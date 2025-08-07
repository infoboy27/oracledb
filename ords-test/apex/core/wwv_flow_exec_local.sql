set define '^'
set verify off
prompt ...wwv_flow_exec_local
create or replace package wwv_flow_exec_local
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_exec_local.sql
--
--    DESCRIPTION
--      This package is used to select, insert, update and delete rows from
--      a local database. In addition it can also be used to execute PL/SQL code
--      on a local database.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      03/20/2017 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

c_pk_bind_name constant varchar2(7) := 'apex$pk';

--==============================================================================
-- This procedure opens a "local database" query context.
--==============================================================================
procedure open_query_context (
    p_context                  in out nocopy wwv_flow_exec.t_context,
    p_columns                  in            wwv_flow_exec_api.t_columns,
    p_primary_keys             in            wwv_flow_exec.t_columns_values default wwv_flow_exec.c_empty_columns_values,
    --
    -- Should only be used by INTERNAL apps to execute the statement with a schema of the
    -- current workspace, instead of using APEX_xxxxxx
    p_parse_as_schema_override in            varchar2                       default null );

--==============================================================================
-- $$$
--==============================================================================
procedure populate_buffer (
    p_context in out nocopy wwv_flow_exec.t_context );

--==============================================================================
-- Re-executes the SQL Statement assigned to the given context. Useful when a SQL
-- is to be executed repeatedly with different bind values for each execute.
--==============================================================================
procedure re_execute_query (
    p_context in out nocopy wwv_flow_exec.t_context );

--==============================================================================
-- This procedure cleans up an existing context.
--==============================================================================
procedure close_context (
    p_context in out nocopy wwv_flow_exec.t_context );

--==============================================================================
-- This function checks if the SQL query is valid and returns the columns
-- returned by the query.
--==============================================================================
function describe_query (
    p_sql_query                in varchar2,
    p_optimizer_hint           in varchar2 default null,
    --
    p_test_for_rowid           in boolean  default false,
    p_supports_binary_number   in boolean  default false,
    p_parse_as_schema_override in varchar2 default null )
    return wwv_flow_exec_api.t_columns;

--==============================================================================
function describe_query (
    p_sql_query                in wwv_flow_global.vc_arr2,
    p_optimizer_hint           in varchar2 default null,
    --
    p_test_for_rowid           in boolean  default false,
    p_supports_binary_number   in boolean  default false,
    p_parse_as_schema_override in varchar2 default null )
    return wwv_flow_exec_api.t_columns;

--==============================================================================
-- This procedure executes a DML context on the local database. The context
-- object must already be prepared using WWV_FLOW_EXEC.PREPARE_DML_CONTEXT,
-- and DML rows must be present in P_CONTEXT.DML_COLUMNS_VALUES.
--
-- PARAMETERS
--     p_context:                     the context object to execute
--     p_continue_on_error:           whether to continue with the remaining rows in case of an error
--     p_do_substitutions:            whether to perform substitutions
--     p_parse_as_schema_override:    schema to parse SQL as
--==============================================================================
procedure execute_dml (
    p_context                    in out nocopy wwv_flow_exec.t_context,
    p_continue_on_error          in            boolean                     default false,
    p_do_substitutions           in            boolean                     default false,
    p_parse_as_schema_override   in            varchar2                    default null,
    --
    p_override_statements        in            wwv_flow_global.vc_arr2     default wwv_flow_global.c_empty_vc_arr2,
    p_only_for_row_idx           in            pls_integer                 default null,
    p_no_binds_for_cols          in            wwv_flow_global.vc_arr2     default wwv_flow_global.c_empty_vc_arr2 );

--==============================================================================
-- This procedure opens a "local database" execute code context.
--==============================================================================
procedure open_code_context(
    p_context                  in out nocopy wwv_flow_exec.t_context,
    p_parse_as_schema_override in            varchar2   default null );

end wwv_flow_exec_local;
/
show errors
