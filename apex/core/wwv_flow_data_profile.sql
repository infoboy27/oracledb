set define '^' verify off
prompt ...wwv_flow_data_profile.sql
create or replace package wwv_flow_data_profile as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_data_profile
--
--    DESCRIPTION
--      Data Profile processing logic
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    05/24/2017 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--------------------------------------------------------------------------------
subtype t_column_type is pls_integer range 1..3;

c_column_type_derived constant t_column_type := 1;
c_column_type_data    constant t_column_type := 2;
c_column_type_table   constant t_column_type := 3;

--------------------------------------------------------------------------------
subtype t_transform_type is pls_integer range 1..11;

c_tranform_sql_expr        constant t_transform_type :=  1;
c_tranform_sql_query       constant t_transform_type :=  2;
c_tranform_trim            constant t_transform_type :=  3;
c_tranform_ltrim           constant t_transform_type :=  4;
c_tranform_rtrim           constant t_transform_type :=  5;
c_tranform_replace         constant t_transform_type :=  6;
c_tranform_lower           constant t_transform_type :=  7;
c_tranform_upper           constant t_transform_type :=  8;
c_tranform_nullif          constant t_transform_type :=  9;
c_tranform_regexp_replace  constant t_transform_type := 10;
c_tranform_regexp_nullif   constant t_transform_type := 11;

--------------------------------------------------------------------------------
type t_column_name_idx is table of pls_integer index by varchar2(255);

--------------------------------------------------------------------------------
type t_column is record(
    id                    number,
    name                  varchar2(255),
    --
    parent_column_id      number,
    parent_column_idx     pls_integer,
    parent_column_name    varchar2(255),
    --
    data_type             varchar2(255),
    validation_regexp     varchar2(255),
    column_type           t_column_type,
    max_length            number,
    --
    format_mask           varchar2(255),
    decimal_char          varchar2(1 CHAR),
    group_char            varchar2(1 CHAR),
    has_time_zone         boolean       default false,
    --
    is_primary_key        boolean       default false,
    is_hidden             boolean       default false,
    is_filterable         boolean       default true,
    is_common             boolean       default true,
    --
    selector              varchar2(255),
    selector_type         wwv_flow_plugin_api.t_selector_type,   -- selector type for CSV and XLSX data formats
    --
    transform_type        t_transform_type,
    expression1           varchar2(4000),
    expression2           varchar2(4000),
    --
    lookup_owner          wwv_flow_global.t_dbms_id,
    lookup_table          wwv_flow_global.t_dbms_id,
    lookup_column1        wwv_flow_global.t_dbms_id,
    lookup_value1         wwv_flow_global.t_dbms_id,
    lookup_column2        wwv_flow_global.t_dbms_id,
    lookup_value2         wwv_flow_global.t_dbms_id,
    lookup_column3        wwv_flow_global.t_dbms_id,
    lookup_value3         wwv_flow_global.t_dbms_id,
    lookup_key_column     wwv_flow_global.t_dbms_id,
    lookup_where_clause   varchar2(4000),
    --
    remote_attribute_name varchar2(255),
    remote_data_type      varchar2(255),
    additional_info       varchar2(4000) );

type t_columns is table of t_column index by pls_integer;

--------------------------------------------------------------------------------
type t_data_profile is record(
    id                        number,
    name                      varchar2(255),
    format                    wwv_flow_plugin_api.t_data_format,
    --
    csv_separator             varchar2(1 CHAR),
    csv_enclosed              varchar2(1 CHAR),
    default_xlsx_sheet_name   varchar2(255),
    skip_rows                 pls_integer,
    has_header_row            boolean,
    --
    row_selector              varchar2(255),
    use_raw_json_selectors    boolean default false,
    single_row_selector       varchar2(255),
    single_row                boolean default false,
    --
    decimal_characters        varchar2(2),
    xml_namespaces            varchar2(32767),
    encoding                  varchar2(255),
    data_columns              t_columns,
    column_name_idx           t_column_name_idx );

--------------------------------------------------------------------------------
type t_response_parsing_sql is record(
    sql_query           clob,
    parser_file_profile clob );

--==============================================================================
-- constants
--==============================================================================
c_datatype_number_vc        constant varchar2(6)   := 'NUMBER';
c_datatype_varchar2_vc      constant varchar2(8)   := 'VARCHAR2';
c_datatype_date_vc          constant varchar2(4)   := 'DATE';
c_datatype_timestamp_vc     constant varchar2(9)   := 'TIMESTAMP';
c_datatype_timestamp_tz_vc  constant varchar2(24)  := 'TIMESTAMP WITH TIME ZONE';
c_datatype_timestamp_ltz_vc constant varchar2(30)  := 'TIMESTAMP WITH LOCAL TIME ZONE';
c_datatype_clob_vc          constant varchar2(4)   := 'CLOB';
c_datatype_blob_vc          constant varchar2(4)   := 'BLOB';
c_datatype_sdogeometry_vc   constant varchar2(12)  := 'SDO_GEOMETRY';
c_datatype_document_vc      constant varchar2(17)  := 'DOCUMENT_FRAGMENT';
c_datatype_array_vc         constant varchar2(5)   := 'ARRAY';

--------------------------------------------------------------------------------
-- When a new REST Source is discovered, the parsed sample data is populated into
-- a collection - as collections might still use VARCHAR2(4000) columns, regardless
-- of the MAX_STRING_SIZE database parameter, we stick to that limit for preview purpose.
--
c_data_preview_vc2_max_len  constant pls_integer   := 4000;

--------------------------------------------------------------------------------
c_clob_bind_name            constant varchar2(14)  := 'APX$CLOB_VALUE';
c_blob_bind_name            constant varchar2(14)  := 'APX$BLOB_VALUE';
c_xlsx_sheet_bind_name      constant varchar2(14)  := 'APX$SHEET_NAME';
c_clobarray_bind_prefix     constant varchar2(9)   := 'APX$CLARR';
c_query_alias               constant varchar2(8)   := 'apx$data';

c_xml_ns_prefix             constant pls_integer   := 1;
c_xml_ns_value              constant pls_integer   := 2;

--==============================================================================
-- verifies that a row selector does not use functions from the fn:, oradb:
-- or ora: namespace. Raises an error otherwise.
--
-- Parameters:
-- * p_selector:              the XPath selector to validate
-- * p_is_row_selector:       Whether the XPath selector is a "row selector"
--==============================================================================
procedure assert_xml_selector(
    p_selector        in varchar2,
    p_is_row_selector in boolean );

--==============================================================================
-- fetches data profile data from WWV_FLOW_DATA_PROFILES based on ID.
-- Uses OUT parameters in order to get all information with one call.
--
-- Parameters:
-- * p_data_profile_id:          the ID of the data profile
-- * p_data_profile:             data profile details
--==============================================================================
procedure fetch_data_profile(
    p_data_profile_id   in  number,
    p_data_profile      out t_data_profile );

--==============================================================================
-- generate the SQL expression to be added to the parsing query, based on
-- data profile meta data for a given column.
--
-- Parameters:
-- * p_data_profile:             data profile record to use
-- * p_column_idx:               column index ("data_columns" array) of the column
-- * p_src_column_name:          name of the column (or bind variable) to use as the source
--                               of the expression.
-- * p_varchar2_only:            whether to return columns as VARCHAR2 (e.g. if the consuming
--                               component cannot process CLOBs)
-- * p_return_raw_varchar2:      if TRUE; then no data type conversions and no transformations
--                               will be applied.
--
-- Returns:
-- * the SQL expression representing this data profile column
--==============================================================================
function generate_column_expression(
    p_data_profile         in t_data_profile,
    p_column_idx           in pls_integer,
    p_src_column_name      in varchar2,
    p_varchar2_only        in boolean,
    p_return_raw_varchar2  in boolean )
    return varchar2;

--==============================================================================
-- generates the SQL query to parse a REST response using the data profile
--
-- Parameters:
-- * p_data_profile_id:          ID of the data profile to use
-- * p_array_column_id:          ID of the nested array column to use
--
-- * p_array_cnt:                number of CLOBs to be processed by the parsing query
--                               (only supported for XML and JSON parsing)
--
-- * p_columns:                  if specified, only add these columns to the generated SQL
-- * p_optimize_columns:         attempt to omit unused columns in the generated SQL
--
-- * p_use_single_row_selector:  whether the parsing SQL should return a single row
-- * p_override_row_selector:    override the data profile row selector
--
-- * p_describe_only:            whether to generate a query for describe purposes; in this
--                               case, no SQL to parse JSON, XML or CSV is generated.
--
-- * p_varchar2_only:            whether to return CLOB columns as VARCHAR2. Used for
--                               the Create REST Source wizard, which cannot show CLOBs
-- * p_return_raw_varchar2:      if TRUE; then no data type conversions and no transformations
--                               will be applied; this is used for Data Loading.
--
-- * p_source_table_name_quoted: name of the table that holds the column defined by p_column_expression
--                               used by generate_rowsource_json
-- * p_column_expression:        column expression for the json_table expression, references p_source_table_name_quoted
--                               used by generate_rowsource_json
--
-- * p_data:                     data to be parsed. This is required for XLSX and CSV data
--                               in order to detect column positions by header names
--
-- Returns:
-- * the SQL query parsing rows and columns, based on the data profile
--==============================================================================
function get_response_parsing_sql(
    p_data_profile_id          in number,
    p_array_column_id          in number                      default null,
    --
    p_document_source_owner    in varchar2                    default null,
    p_document_source_table    in varchar2                    default null,
    p_document_source_where    in varchar2                    default null,
    --
    p_array_cnt                in pls_integer                 default null,
    --
    p_columns                  in wwv_flow_exec_api.t_columns default wwv_flow_exec_api.c_empty_columns,
    p_optimize_columns         in boolean                     default true,
    --
    p_use_single_row_selector  in boolean                     default false,
    p_override_row_selector    in varchar2                    default null,
    --
    p_describe_only            in boolean                     default false,
    --
    p_varchar2_only            in boolean                     default false,
    p_return_raw_varchar2      in boolean                     default false,
    --
    p_source_table_name_quoted in varchar2                    default null,
    p_column_expression        in varchar2                    default null,
    --
    p_data                     in blob                        default null )
    return t_response_parsing_sql;

--==============================================================================
-- generates the SQL query to parse a REST response using the data profile
--
-- Parameters:
-- * p_data_profile:             data profile record to use
-- * p_array_column_id:          ID of the nested array column to use
--
-- * p_array_cnt:                number of CLOBs to be processed by the parsing query
--                               (only supported for XML and JSON parsing)
--
-- * p_columns:                  if specified, only add these columns to the generated SQL
-- * p_optimize_columns:         attempt to omit unused columns in the generated SQL
--
-- * p_use_single_row_selector:  whether the parsing SQL should return a single row
-- * p_override_row_selector:    override the data profile row selector
--
-- * p_describe_only:            whether to generate a query for describe purposes; in this
--                               case, no SQL to parse JSON, XML or CSV is generated.
--
-- * p_varchar2_only:            whether to return CLOB columns as VARCHAR2. Used for
--                               the Create REST Source wizard, which cannot show CLOBs
-- * p_return_raw_varchar2:      if TRUE; then no data type conversions and no transformations
--                               will be applied; this is used for Data Loading.
--
-- * p_source_table_name_quoted: name of the table that holds the column defined by p_column_expression
--                               used by generate_rowsource_json
-- * p_column_expression:        column expression for the json_table expression, references p_source_table_name_quoted
--                               used by generate_rowsource_json
--
-- * p_data:                     data to be parsed. This is required for XLSX and CSV data
--                               in order to detect column positions by header names

-- Returns:
-- * the SQL query parsing rows and columns, based on the data profile
--==============================================================================
function get_response_parsing_sql(
    p_data_profile             in t_data_profile,
    p_array_column_id          in number                      default null,
    --
    p_array_cnt                in pls_integer                 default null,
    --
    p_columns                  in wwv_flow_exec_api.t_columns default wwv_flow_exec_api.c_empty_columns,
    p_optimize_columns         in boolean                     default true,
    --
    p_use_single_row_selector  in boolean                     default false,
    p_override_row_selector    in varchar2                    default null,
    --
    p_describe_only            in boolean                     default false,
    --
    p_varchar2_only            in boolean                     default false,
    p_return_raw_varchar2      in boolean                     default false,
    --
    p_source_table_name_quoted in varchar2                    default null,
    p_column_expression        in varchar2                    default null,
    --
    p_document_source_owner    in varchar2                    default null,
    p_document_source_table    in varchar2                    default null,
    p_document_source_where    in varchar2                    default null,
    --
    p_data                     in blob                        default null )
    return t_response_parsing_sql;

--==============================================================================
-- return the REST service response attribute for a given column name.
--
-- Parameters:
-- * p_data_profile:             data profile record to use
-- * p_column_name:              column name to return the JSON (or XML) attribute for
--
-- Returns:
-- * name of the service response attribute representing the column
--==============================================================================
function get_attribute_for_column(
    p_data_profile in t_data_profile,
    p_column_name  in varchar2 )
    return varchar2;

--==============================================================================
-- look up a data profile column by ID and return its record.
--
-- Parameters:
-- * p_data_profile:           data profile record to use
-- * p_column_id:              column ID (primary key, not index).
--
-- Returns:
-- * record containing column information.
--==============================================================================
function find_column_by_pk_id(
    p_data_profile in t_data_profile,
    p_column_id    in number )
    return t_column;

--==============================================================================
-- create the XMLNAMESPACES clause for XMLTABLE from the contents of the
-- WWV_FLOW_DATA_PROFILES.XML_NAMESPACES column.
--
-- http://www.w3.org/some/namespace=ns1
-- http://www.some.other.com/namespace=ns2
--
-- ... becomes ...
--
-- 'http://www.w3.org/some/namespace' as "ns1", 'http://www.some.other.com/namespace' as "ns2"
--
-- Parameters:
-- * p_metadata_namespaces:      XML Namespaces in "WWV_FLOW_DATA_PROFILES.XML_NAMESPACES" format
--
-- Returns:
-- * XML Namespaces in XMLNAMESPACES format for usage within SQL XMLTABLE function
--==============================================================================
function create_xmlnamespaces_string(
    p_metadata_namespaces in varchar2 )
    return varchar2;

--==============================================================================
-- returns the columns of the data profile as wwv_flow_exec_api.t_columns type
--
-- Parameters:
-- * p_data_profile_id:          ID of the data profile
-- * p_include_hidden:           whether to include hidden columns
--
-- Returns:
-- * column information for the data profile
--==============================================================================
function describe_profile(
    p_data_profile_id     in wwv_flow_data_profiles.id%type,
    p_array_column_id     in number  default null,
    --
    p_only_common_columns in boolean default false,
    p_include_hidden      in boolean default false )
    return wwv_flow_exec_api.t_columns;

--==============================================================================
-- convert a JSON selector to XPath syntax. To be used in combination with
-- WWV_FLOW_JSON.TO_XMLTYPE and the XMLTABLE function.
--
-- Parameters:
-- * p_selector:                 JSON path syntax selector
--
-- Returns:
-- * XPath equivalent of the JSON selector
--==============================================================================
function convert_selector_to_xpath(
    p_selector in varchar2 )
    return varchar2;

--==============================================================================
-- splits a selector into individual (object) steps, based on the dot (.) as
-- separator. Respects quoted selector steps.
--
-- * a.b.c             -> (a), (b), (c)
-- * a."b"."c"         -> (a), (b), (c)
-- * a."b.c"           -> (a), (b.c)
-- * "a"."b\".c"[*]    -> (a), (b\".c), ([*])
--
-- Parameters:
-- * p_selector:                 JSON path syntax selector
--
-- Returns:
-- array containing the selector steps.
--
-- Example:
-- declare
--     l_steps wwv_flow_t_varchar2;
-- begin
--     l_steps := split_selector( 'obj1.obj2.attr1' );
--     -> wwv_flow_t_varchar2( 'obj1', 'obj2', 'attr1' );
-- end;
--==============================================================================
function split_selector(
    p_selector     in varchar2,
    p_strip_quotes in boolean default false )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Helper Function: converts a data profile selector to a JSON path expression
-- for the JSON_TABLE function. Data Profile selectors can be expressed with a
-- more relaxed syntax to make things easier. This function parses the selector
-- and converts to a proper JSON path expression for JSON_TABLE.
--
-- * simple.child           -> $."simple"."child"
-- * "simple.child"         -> $."simple.child"
-- * "a.b".c[1]             -> $."a.b"."c"[1]
--
-- Parameters:
-- * p_selector                 JSON path syntax selector.
-- * p_select_array:            Whether the selector targets an array, or not.
-- * p_use_raw_selectors:       Whether to use selectors as-is.
-- * p_include_prefix:          Wehther to prepend the "$" prefix.
--
-- Returns:
-- The converted selector, with "$" escaped to \u0024, and quotes properly applied.
--
-- Example:
--   declare
--      l_selector varchar2(255) := '$moreRows.$value';
--   begin
--      dbms_output.put_line( wwv_flow_data_profile.convert_selector_to_jsonpath
--                                p_selector     => l_selector,
--                                p_select_array => false );
--
--      --> $."\u0024moreRows"."\u0024value"
--
--      dbms_output.put_line( wwv_flow_data_profile.convert_selector_to_jsonpath
--                                p_selector     => l_selector,
--                                p_select_array => true );
--
--      --> $."\u0024moreRows"."\u0024value"[*]
--==============================================================================
function convert_selector_to_jsonpath(
    p_selector          in varchar2,
    p_select_array      in boolean default false,
    p_use_raw_selectors in boolean default false,
    p_include_prefix    in boolean default true )
    return varchar2
    result_cache;

--==============================================================================
-- get all array columns between the root and the given array column
--==============================================================================
function get_array_column_path(
    p_data_profile         t_data_profile,
    p_array_column_id      number )
    return wwv_flow_t_number;

--==============================================================================
-- converts the data profile data type to the corresponding APEX_EXEC data type
--==============================================================================
function data_type_profile_to_exec(
    p_profile_data_type    in varchar2,
    p_return_clob_for      in wwv_flow_t_varchar2 default null )
    return wwv_flow_exec_api.t_data_type;

end wwv_flow_data_profile;
/
sho err

set define '^'
