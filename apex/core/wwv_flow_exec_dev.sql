set define '^'
set verify off
prompt ...wwv_flow_exec_dev
create or replace package wwv_flow_exec_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2018, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_exec_dev.sql
--
--    DESCRIPTION
--      This package is used to to check and describe SQL and PL/SQL for
--      local and remote data sources and web sources.
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    06/14/2017 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

type t_query_column is record(
    column_name      wwv_flow_global.t_dbms_id,
    data_type        wwv_flow_global.t_dbms_id,
    column_name_esc  varchar2(255) );

type t_query_columns is table of t_query_column;

-- subtypes for column counts and t_describe_result. Inherit type definitions from wwv_flow_exec.
subtype t_column_count    is wwv_flow_exec.t_column_count;
subtype t_describe_result is wwv_flow_exec.t_describe_result;

--==============================================================================
-- Constants
--==============================================================================
c_empty_describe_result     t_describe_result;

--==============================================================================
-- Describes a SQL statement and returns the selected columns used in the SQL.
--==============================================================================
function check_and_describe (
    p_location                 in wwv_flow_exec_api.t_location        default wwv_flow_exec_api.c_location_local_db,
    p_remote_server_id         in number                              default null,
    --
    p_query_type               in wwv_flow_exec_api.t_query_type,
    -- Used by wwv_flow_exec_api.t_query_type_table, t_query_type_graph
    p_owner                    in varchar2                            default null,
    p_table_name               in varchar2                            default null,
    -- Used by wwv_flow_exec_api.t_query_type_sql_query
    p_sql_query                in varchar2                            default null,
    -- Used by wwv_flow_exec_api.c_query_type_func_return_sql
    p_function_body            in varchar2                            default null,
    p_function_body_language   in wwv_flow_exec_api.t_language        default null,
    p_generic_column_count     in t_column_count                      default null,
    -- Used by wwv_flow_exec_api.t_query_type_graph
    p_match_clause             in varchar2                            default null,
    p_columns_clause           in varchar2                            default null,
    -- Used by wwv_flow_exec_api.t_query_type_table,t_query_type_graph and t_location_web_source
    p_where_clause             in varchar2                            default null,
    p_order_by_clause          in varchar2                            default null,
    -- Used by wwv_flow_exec_api.t_query_type_table, t_query_type_graph, t_query_type_sql_query and c_query_type_func_return_sql
    p_optimizer_hint           in varchar2                            default null,
    --
    p_test_for_rowid           in boolean                             default false,
    --
    p_document_source_id       in number                              default null,
    --
    p_web_src_module_id        in number                              default null,
    p_array_column_id          in number                              default null,
    p_post_processing_type     in varchar2                            default null,
    --
    p_columns                  in wwv_flow_exec_api.t_columns         default wwv_flow_exec_api.c_empty_columns,
    p_min_column_count         in t_column_count                      default null,
    p_max_column_count         in t_column_count                      default null,
    p_only_common_columns      in boolean                             default false,
    -- Used by local database
    p_application_id           in number                              default nv( 'FB_FLOW_ID' ),
    p_parse_as_schema          in varchar2                            default null,
    --
    p_extended_describe        in boolean                             default false,
    -- legacy
    p_do_substitutions         in boolean                             default false )
    return t_describe_result;

--==============================================================================
-- Describes a SQL statement and returns the selected columns used in the SQL
-- as a table function to be used by LOVs within the Builder
--==============================================================================
function get_query_columns (
    p_location                 in varchar2,
    p_remote_server_id         in number                              default null,
    --
    p_query_type               in varchar2,
    -- Used by wwv_flow_exec_api.t_query_type_table
    p_owner                    in varchar2                            default null,
    p_table_name               in varchar2                            default null,
    -- Used by wwv_flow_exec_api.t_query_type_sql_query
    p_sql_query                in varchar2                            default null,
    -- Used by wwv_flow_exec_api.c_query_type_func_return_sql
    p_function_body            in varchar2                            default null,
    p_function_body_language   in wwv_flow_exec_api.t_language        default null,
    p_generic_column_count     in t_column_count                      default null,
    -- Used by wwv_flow_exec_api.t_query_type_table and wwv_flow_exec_api.t_location_web_source
    p_where_clause             in varchar2                            default null,
    p_match_clause             in varchar2                            default null,
    p_columns_clause           in varchar2                            default null,
    p_order_by_clause          in varchar2                            default null,
    -- Used by wwv_flow_exec_api.t_query_type_table, wwv_flow_exec_api.t_query_type_sql_query and wwv_flow_exec_api.c_query_type_func_return_sql
    p_optimizer_hint           in varchar2                            default null,
    --
    p_document_source_id       in number                              default null,
    --
    p_web_src_module_id        in number                              default null,
    p_array_column_id          in number                              default null,
    p_post_processing_type     in varchar2                            default null,
    --
    p_min_column_count         in t_column_count                      default null,
    p_max_column_count         in t_column_count                      default null,
    p_only_common_columns      in boolean                             default false,
    --
    p_application_id           in number                              default nv( 'FB_FLOW_ID' ),
    p_parse_as_schema          in varchar2                            default null,
    -- legacy
    p_do_substitutions         in boolean                             default false )
    return t_query_columns pipelined;

--==============================================================================
-- Returns true if p_sql_query contains an order by clause at the end.
-- Used by validations on 4000:420, 4000:4651, 4000:4796 and 4000:831 and
-- by check_and_describe_sql
--==============================================================================
function has_sql_query_order_by_clause (
    p_sql_query in clob )
    return boolean;

--==============================================================================
-- Checks an anonymous code block against the local or remote database and
-- returns the validation error as result.
--==============================================================================
function check_code (
    p_location         in wwv_flow_exec_api.t_location              default wwv_flow_exec_api.c_location_local_db,
    p_remote_server_id in number                                    default null,
    p_type             in wwv_flow_code_exec_dev.t_check_type       default wwv_flow_code_exec_dev.c_check_block,
    p_return_data_type in wwv_flow_code_exec_dev.t_return_data_type default null,
    p_custom_data_type in varchar2                                  default null,
    p_code             in varchar2,
    p_language         in wwv_flow_code_exec.t_language,
    -- Used by local database
    p_application_id   in number                                    default nv( 'FB_FLOW_ID' ),
    p_parse_as_schema  in varchar2                                  default null )
    return varchar2;

--==============================================================================
-- Gets correct table owner for Local data sources, nulling
-- it in the case where it matches the applications primary schema
--==============================================================================
function get_table_owner (
    p_owner          in varchar2,
    p_application_id in number                                      default nv('FB_FLOW_ID') )
    return varchar2;

--==============================================================================
-- helper function to validate a query. Based on location and
-- query type parameters, the appropriate parameters are validated for existence
-- and valid SQL or PL/SQL.
-- For instance, if query_type is passed in as TABLE, the p_table_name argument
-- must be non-null and p_table_owner, p_where_clause and p_order_by_clause must
-- contain valid SQL / identifiers.
--==============================================================================
function validate_query (
    p_application_id            in number default v('FB_FLOW_ID' ),
    p_location                  in varchar2,
    --
    p_remote_server_id          in number default null,
    p_document_source_id        in number default null,
    p_web_src_module_id         in number default null,
    p_array_column_id           in number default null,
    --
    p_query_type                in varchar2,
    p_table_name                in varchar2,
    p_table_owner               in varchar2,
    p_where_clause              in varchar2 default null,
    p_match_clause              in varchar2 default null,
    p_columns_clause            in varchar2 default null,
    p_order_by_clause           in varchar2 default null,
    p_sql_query                 in varchar2 default null,
    p_function_body             in varchar2 default null,
    p_function_body_language    in varchar2 default null,
    p_optimizer_hint            in varchar2 default null,
    --
    p_post_processing_type      in varchar2 default null )
    return varchar2;

end wwv_flow_exec_dev;
/
show errors
