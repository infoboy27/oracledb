set define '^' verify off
prompt ...wwv_flow_exec_sql.sql
create or replace package wwv_flow_exec_sql as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2021 - 2024. All Rights Reserved.
--
--    NAME
--      wwv_flow_exec_sql.sql
--
--    DESCRIPTION
--      This package contains logic to generate APEX component SQL
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    12/14/2021 - Created.
--
--------------------------------------------------------------------------------

--==============================================================================
-- constants
--==============================================================================
c_canonical_date_format_oracle   constant varchar2(16)  := 'YYYYMMDDHH24MISS';
c_canonical_date_format_mysql    constant varchar2(16)  := '%Y%m%d%H%i%s';

--==============================================================================
-- Global types
--==============================================================================
type t_converted_format_mask is record(
    date_format_mask  varchar2(255),
    decimal_places    pls_integer,
    locale            varchar2(255) );

--==============================================================================
-- raises an error if the requested feature is not available on the target 
-- database
--==============================================================================
procedure assert_feature_available(
    p_target_database in wwv_flow_exec_api.t_database_type,
    p_feature         in varchar2 );

--==============================================================================
-- Returns a SQL CASE expression based on the filter_buckets attributes of 
-- a wwv_flow_exec_api.t_filter instance
--==============================================================================
function get_bucket_case_expression( 
    p_filter          in wwv_flow_exec_api.t_filter,
    p_target_database in wwv_flow_exec_api.t_database_type ) 
    return varchar2;

--==============================================================================
-- generates a SQL expression to convert the multi-value column to a JSON array. 
-- If the column already contains a JSON array, the column name is passed back 
-- unchanged. 
-- Otherwise the function generates a SQL REPLACE expression to convert the separated 
-- list to a JSON array, which can be processed using native SQL/JSON functions.
--
-- This function can generate expressions to run on Oracle as well as on MySQL.
--
-- Parameters:
-- * p_expr_enquoting_asserted: column expression to use in generated SQL expression. This must
--                              be an expression for which enquoted has already been asserted.
-- * p_multi_value.type:        whether the column expression contains separated values or already a JSON array
-- * p_multi_value.separator:   separator character to use
-- * p_multi_value.trim_space:  whether to trim whitespace from individual values after split.
--
-- * p_no_json_conversion:      skip the JSON conversion for separated values; this is used if the
--                              JSON conversion already happened earlier.
-- * p_target_database:         target database to generate the SQL expression for.
--
-- Example:
-- 
--   declare
--       procedure eval( p_expr in varchar2 )
--       is
--           l_result varchar2(32767);
--       begin
--           sys.dbms_output.put_line( 'expression: ' || p_expr );
--           execute immediate 'select ' || p_expr || ' from sys.dual' into l_result;
--           sys.dbms_output.put_line( 'result: ' || l_result );
--   
--       end eval;
--   begin
--       eval( wwv_flow_exec_sql.get_replace_to_json_sql_expr(
--                 p_expr_enquoting_asserted => ''' A:B: C: D:E:F:G: H''',
--                 p_multi_value.type        => wwv_flow_exec_api.c_multi_value_separated,
--                 p_multi_value.separator   => ':',
--                 p_multi_value.trim_space  => false ) );
--   
--       eval( wwv_flow_exec_sql.get_replace_to_json_sql_expr(
--                 p_expr_enquoting_asserted => ''' A:B: C: D:E:F:G: H''',
--                 p_multi_value.type        => wwv_flow_exec_api.c_multi_value_separated,
--                 p_multi_value.separator   => ':',
--                 p_multi_value.trim_space  => true ) );
--   
--       eval( wwv_flow_exec_sql.get_replace_to_json_sql_expr(
--                 p_expr_enquoting_asserted => ''' A,B, C, D:E,F,G, H''',
--                 p_multi_value.type        => wwv_flow_exec_api.c_multi_value_separated,
--                 p_multi_value.separator   => ':',
--                 p_multi_value.trim_space  => true ) );
--   
--       eval( wwv_flow_exec_sql.get_replace_to_json_sql_expr(
--                 p_expr_enquoting_asserted => ''' A,B, C, D,E,F,G, H''',
--                 p_multi_value.type        => wwv_flow_exec_api.c_multi_value_separated,
--                 p_multi_value.separator   => ',',
--                 p_multi_value.trim_space  => true ) );
--   end;
--
--   expression: '["'||replace(replace(replace(' A:B: C: D:E:F:G: H', '\', '\\'),'"', '\"'),':', '","')||'"]'
--   result: [" A","B"," C"," D","E","F","G"," H"]
--
--   expression: '["'||regexp_replace(replace(replace(ltrim(rtrim(' A:B: C: D:E:F:G: H')), '\', '\\'),'"', '\"'),'\s*:\s*', '","')||'"]'
--   result: ["A","B","C","D","E","F","G","H"]
--
--   expression: '["'||regexp_replace(replace(replace(ltrim(rtrim(' A,B, C, D:E,F,G, H')), '\', '\\'),'"', '\"'),'\s*:\s*', '","')||'"]'
--   result: ["A,B, C, D","E,F,G, H"]
--
--   expression: '["'||regexp_replace(replace(replace(ltrim(rtrim(' A,B, C, D,E,F,G, H')), '\', '\\'),'"', '\"'),'\s*,\s*', '","')||'"]'
--   result: ["A","B","C","D","E","F","G","H"]
--==============================================================================
function get_replace_to_json_sql_expr(
    p_expr_enquoting_asserted in varchar2,
    p_multi_value             in wwv_flow_exec_api.t_multi_value,
    p_no_json_conversion      in boolean                           default false,
    p_target_database         in wwv_flow_exec_api.t_database_type default wwv_flow_exec_api.c_database_oracle )
    return varchar2;

--==============================================================================
-- To perform (simple) multi-value filtering on a JSON array, we can use the JSON_EXISTS SQL
-- function and JSON path expressions. These only work with simple Equals or IN filters, and are
-- always case-sensitive.
--
-- Examples:
-- * We have a JSON array of ["10","20","30"]
-- * We are doing a multi-value search for "10", "40"
--
-- 1. OR filtering:  Return a match, if the array contains at least one of the filter values
--                   ... where json_exists( '["10","20","30"]', '$[*]?(@in("40","10"))')
--
-- 2. AND filtering: Only return a match, if the array contains all of the filter values.
--                   ... where json_exists( '["10","20","30"]', '$?(@[*]=="10"&&@[*]=="40")');
--
-- Note: The path expression of JSON_EXISTS does not support bind variable usage; the final
--       expression must be present at compile time. However, filter evaluation with JSON_EXISTS
--       is still significantly faster than using WWV_FLOW_STRING.SPLIT in a query an having
--       PL/SQL execution with context switches for each row, so it's worth it.
--==============================================================================
procedure add_multi_value_filter_expr(
    p_filter                  in            wwv_flow_exec_api.t_filter,
    p_expr_enquoting_asserted in            varchar2,
    p_no_json_conversion      in            boolean default false,
    p_bind_prefix             in            varchar2 default null,
    --
    p_sql_query               in out nocopy varchar2,
    p_parameters              in out nocopy wwv_flow_exec_api.t_parameters );

--==============================================================================
-- Return a NOT NULL expression for a column and support multi-value filters. 
-- If a multi-value filter is based on a JSON array, the expression must do
-- more than just IS NULL. An empty JSON array ([]) would also suffice as "null", 
-- and for faceted search the condition is also true if one of the array elements
-- is "" (which is equivalent to the NULL value).
--==============================================================================
function get_multi_value_is_null_expr(
    p_expr_enquoting_asserted in varchar2,
    p_multi_value             in wwv_flow_exec_api.t_multi_value,
    p_no_json_conversion      in boolean default false )
    return varchar2;

--==============================================================================
-- merges SQL queries. The #APEX$SOURCE_DATA# placeholder in p_outer_sq is
-- replaced with p_inner_sql
--==============================================================================
function merge_sql(
    p_inner_sql     in varchar2,
    p_outer_sql     in varchar2 ) return varchar2;

--==============================================================================
-- adds columns referenced by the filters array to the columns array, if not
-- already present.
--==============================================================================
procedure add_filter_columns(
    p_columns in out nocopy wwv_flow_exec_api.t_columns,
    p_filters in            wwv_flow_exec_api.t_filters );

--==============================================================================
-- generate a SQL query.
--
--
-- How WWV_FLOW_EXEC generates and wraps SQL:
----------------------------------------------
--
-- select {component-outer-sql select list}
-- from (
--     select { columns[is_selected=true] }, { APEX$TOTAL_ROW_COUNT }
--     from (
--         select i.*, { aggregrations }, COUNT(*) OVER () APEX$TOTAL_ROW_COUNT }
--         from (
--              select { columns }, { columns[sql_expression IS NOT NULL] ( computations ) }
--              from ( (
--                   select /*+ qb_name(apex$inner) */ { map rowid to APE X$ROWID }, { columns }, { LOV return columns }
--                   from (
--                       ***********************************************
--                       *** COMPONENT SQL by developer (region source)
--                       ***********************************************
--                   ) d,
--                   { JOIN LOV columns }
--              ) { flashback-clause } )
--         ) i
--         where 1 = 1 and rownum <= { maximum-rows-to-process } and { filters }
--         { order-by-clause }
--     )
-- )
-- { where and order-by clauses of component-outer-sql }
--
--==============================================================================
procedure generate_sql_query (
    p_sql_text_array           in out nocopy wwv_flow_global.vc_arr2,
    p_parameters               in out nocopy wwv_flow_exec_api.t_parameters,
    --
    p_location                 in            wwv_flow_exec_api.t_location,
    p_remote_server_id         in            number                                      default null,
    p_target_database          in            wwv_flow_exec_api.t_database_type,
    --
    p_query_type               in            wwv_flow_exec_api.t_query_type,
    p_columns                  in            wwv_flow_exec_api.t_columns                 default wwv_flow_exec_api.c_empty_columns,
    --
    p_owner                    in            varchar2,
    p_table_name               in            varchar2,
    p_where_clause             in            varchar2,
    p_match_clause             in            varchar2,
    p_columns_clause           in            varchar2,
    p_order_by_clause          in            varchar2,
    p_include_rowid_column     in            boolean,
    p_optimizer_hint           in            varchar2                                    default null,
    --
    p_sql_query                in            varchar2,
    p_function_body            in            varchar2,
    p_function_body_language   in            wwv_flow_code_exec.t_language,
    --
    p_filters                  in            wwv_flow_exec_api.t_filters                 default wwv_flow_exec_api.c_empty_filters,
    p_order_bys                in            wwv_flow_exec_api.t_order_bys               default wwv_flow_exec_api.c_empty_order_bys,
    p_aggregation              in            wwv_flow_exec_api.t_aggregation             default wwv_flow_exec_api.c_empty_aggregation,
    p_control_break            in            wwv_flow_exec_api.t_control_break           default wwv_flow_exec_api.c_empty_control_break,
    p_primary_keys             in            wwv_flow_exec.t_columns_values              default wwv_flow_exec.c_empty_columns_values,
    --
    p_component_sql            in            varchar2                                    default null,
    --
    p_return_distinct_rows     in            boolean                                     default false,
    p_flashback_minutes        in            pls_integer                                 default null,
    --
    p_total_row_count          in            boolean                                     default false,
    p_total_row_count_limit    in            number                                      default null,
    --
    p_select_all_query_cols    in            boolean                                     default false,
    p_generate_simple_query    in            boolean                                     default false,
    p_parse_as_schema_override in            varchar2                                    default null,
    p_parse_func_body_as_apex  in            boolean                                     default false,
    --
    p_do_substitutions         in            boolean                                     default false );
--
--
--==============================================================================
-- generate SQL query. Return as VARCHAR2.
--==============================================================================
procedure generate_sql_query (
    p_parameters               in out nocopy wwv_flow_exec_api.t_parameters,
    p_sql_text                 in out nocopy varchar2,
    --
    p_location                 in            wwv_flow_exec_api.t_location,
    p_remote_server_id         in            number                                      default null,
    p_target_database          in            wwv_flow_exec_api.t_database_type,
    p_query_type               in            wwv_flow_exec_api.t_query_type,
    p_owner                    in            varchar2,
    p_table_name               in            varchar2,
    p_sql_query                in            varchar2,
    p_function_body            in            varchar2,
    p_function_body_language   in            wwv_flow_code_exec.t_language,
    p_where_clause             in            varchar2,
    p_match_clause             in            varchar2,
    p_columns_clause           in            varchar2,
    p_order_by_clause          in            varchar2,
    p_include_rowid_column     in            boolean,
    p_optimizer_hint           in            varchar2                                    default null,
    p_columns                  in            wwv_flow_exec_api.t_columns                 default wwv_flow_exec_api.c_empty_columns,
    p_select_all_query_cols    in            boolean                                     default false,
    --
    p_generate_simple_query    in            boolean                                     default false,
    --
    p_filters                  in            wwv_flow_exec_api.t_filters                 default wwv_flow_exec_api.c_empty_filters,
    p_order_bys                in            wwv_flow_exec_api.t_order_bys               default wwv_flow_exec_api.c_empty_order_bys,
    p_aggregation              in            wwv_flow_exec_api.t_aggregation             default wwv_flow_exec_api.c_empty_aggregation,
    p_control_break            in            wwv_flow_exec_api.t_control_break           default wwv_flow_exec_api.c_empty_control_break,
    --
    p_return_distinct_rows     in            boolean                                     default false,
    p_flashback_minutes        in            pls_integer                                 default null,
    --
    p_component_sql            in            varchar2                                    default null,
    --
    p_total_row_count          in            boolean                                     default false,
    p_total_row_count_limit    in            number                                      default null,
    p_do_substitutions         in            boolean                                     default false,
    p_parse_as_schema_override in            varchar2                                    default null,
    p_parse_func_body_as_apex  in            boolean                                     default false );
--
--
--==============================================================================
-- generate query for classic reports using the "Generic Columns" feature.
--==============================================================================
procedure generate_generic_sql_query (
    p_sql_text_array           in out nocopy wwv_flow_global.vc_arr2,
    p_parameters               in out nocopy wwv_flow_exec_api.t_parameters,
    --
    p_location                 in            wwv_flow_exec_api.t_location,
    p_target_database          in            wwv_flow_exec_api.t_database_type,
    p_function_body            in            varchar2,
    p_function_body_language   in            wwv_flow_code_exec.t_language,
    --
    p_remote_server_id         in            number                                default null,
    --
    p_columns                  in            wwv_flow_exec_api.t_columns           default wwv_flow_exec_api.c_empty_columns,
    p_select_all_query_cols    in            boolean                               default false,
    --
    p_optimizer_hint           in            varchar2                              default null,
    --
    p_total_row_count          in            boolean                               default false,
    p_total_row_count_limit    in            number                                default null,
    --
    p_generic_column_cnt       in            pls_integer                           default 50,
    p_filters                  in            wwv_flow_exec_api.t_filters           default wwv_flow_exec_api.c_empty_filters,
    p_order_bys                in            wwv_flow_exec_api.t_order_bys         default wwv_flow_exec_api.c_empty_order_bys,
    p_aggregation              in            wwv_flow_exec_api.t_aggregation       default wwv_flow_exec_api.c_empty_aggregation,
    p_control_break            in            wwv_flow_exec_api.t_control_break     default wwv_flow_exec_api.c_empty_control_break,
    --
    p_do_substitutions         in            boolean,
    p_parse_as_schema_override in            varchar2                              default null,
    p_parse_func_body_as_apex  in            boolean                               default false );
--
--
--==============================================================================
-- Return a single ORDER BY expression
--==============================================================================
function get_orderby_expr(
    p_order_by                 in            wwv_flow_exec_api.t_order_by,
    p_column_expr              in            varchar2                          default null,
    p_target_database          in            wwv_flow_exec_api.t_database_type default wwv_flow_exec_api.c_database_oracle )
    return varchar2;
--
--
--==============================================================================
-- return the list of SQL functions to use within Interactive Report
-- computations or row filters
--==============================================================================
function get_ir_sql_functions(
    p_for_database in wwv_flow_exec_api.t_database_type )
    return wwv_flow_t_varchar2;
--
--
--==============================================================================
-- converts an Oracle mask to a record with information for other databases.
-- Currently only MySQL is supported as a foreign database; other database vendors
-- will be added as needed.
--
-- As there are no direct format mask equivalents between Oracle and other 
-- databases, this function returns a record with formatting information.
--
-- * MySQL Databases:
--   * DATE format masks:
--     The Oracle Format Mask is translated to MySQL on a best-effort bases. Format
--     elements which are not available on MySQL, are not translated.
-- 
--     Examples: 
--     - YYYY-MM-DD"T"HH24:MI:SS                    -> %Y-%m-%dT%H:%i:%s
--     - DAY, DDTH.MM.YYYY                          -> %W, %D.%m.%Y
--     - DAY", the "DD. FMMONTH", in the year "YYYY -> %W, the %d. %M, in the year %Y
--
--     https://www.w3schools.com/sql/func_mysql_date_format.asp
--
--   * NUMBER format masks:
--     MySQL does not even support numeric format models. The only available
--     function is FORMAT which accepts an integer value for the number of 
--     decimal places and a locale for derive the decimal and group characters
--     from.
--     So, for a number format mask, this function only looks up the "D" element
--     within the format mask, and counts the digits afterwards, in order to get
--     the number of desired decimal places. This value is returned as well as
--     the current locale (based on the browser language).
--     https://www.w3schools.com/sql/func_mysql_format.asp
--
-- Parameters:
-- * p_oracle_format_mask:   Oracle format mask to translate
-- * p_format_mask_type:     Data Type indication; to distinguish between NUMBER and DATE
--                           format masks
--
-- Result:
-- Record with format mask information for MySQL.
--==============================================================================
function convert_format_mask(
    p_oracle_format_mask in varchar2,
    p_format_mask_type   in wwv_flow_exec_api.t_data_type )
    return t_converted_format_mask;

--==============================================================================
-- generates a TO_CHAR (Oracle) or equivalent (other databases) expression based
-- on the column expression, the format mask, and the data type.
--
-- * For Oracle databases, this will be simply TO_CHAR()
-- * For MySQL databases, this will be either FORMAT or DATE_FORMAT, dependen
--   on the data type.
--
-- Parameters:
-- * p_column_expr:          column expression to build the SQL expression with
-- * p_in_format_mask:       Oracle format mask to use
-- * p_in_format_mask_type:  Data Type indication; to distinguish between NUMBER and DATE
--                           format masks.
-- * p_for_database:         Database type to generate the expression for.
--
-- Result:
-- SQL expression to be used within a generated SQL Query
--==============================================================================
function get_tochar_expr(
    p_column_expr          in varchar2,
    p_in_format_mask       in varchar2,
    p_in_format_mask_type  in wwv_flow_exec_api.t_data_type,
    --
    p_for_database         in wwv_flow_exec_api.t_database_type )
    return varchar2;

--==============================================================================
-- returns the FROM clause to select a single value from. This is different
-- for different databases.
-- 
-- Example:
-- * Oracle Database -> "from sys.dual"
-- * MySQL           -> "" (MySQL allows to simply do "select sysdate();"
-- 
-- Parameters:
-- * p_for_database:         Database type to generate the expression for.
-- * p_oracle_no_dual:       avoid using sys.dual for Oracle Database. 
--                           Will use "from table(wwv_flow_t_varchar2(''X''))" instead.
--==============================================================================
function get_select_single_value_from(
    p_for_database   in wwv_flow_exec_api.t_database_type,
    p_oracle_no_dual in boolean )
    return varchar2;

end wwv_flow_exec_sql;
/
show errors
