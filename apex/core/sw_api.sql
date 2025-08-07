set define '^' verify off
prompt ...wwv_flow_sw_api
create or replace package wwv_flow_sw_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2001, 2024, Oracle and/or its affiliates.
--
--    NAME
--      sw_api.sql
--
--    DESCRIPTION
--      SQL Workshop API
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--     cbcho    12/11/2001 - created
--
--------------------------------------------------------------------------------

empty_vc_arr    wwv_flow_global.vc_arr2;

g_raise_errors    boolean := false;
g_compile_errors  boolean := false;
g_error_msg       varchar2(32767);
g_success_msg     varchar2(32767);
g_dbms_output     sys.dbms_output.chararr;

--
-- gives how many rows got updated, deleted, and inserted
--
g_rowcnt        number := 0;

--==============================================================================
-- Utilitiy function to return an array of lines for the input, where each line
-- is noop()ed.
--==============================================================================
function clob_to_lines (
    p_clob in clob )
    return sys.dbms_sql.varchar2a;

--==============================================================================
function array_element(
    p_vcarr in wwv_flow_global.vc_arr2,
    p_index in number )
    return varchar2;

--==============================================================================
function valid_workspace_schema (
    p_schema in varchar2 )
    return varchar2;

--==============================================================================
procedure check_priv (
    p_schema in varchar2 );

--==============================================================================
procedure check_priv_object (
    p_application_id in number,
    p_schema         in varchar2,
    p_object         in varchar2 );

--==============================================================================
procedure display_error_msg (
    p_command in clob default null );

--==============================================================================
-- Return a CLOB that contains a SQL command, based on the given array
-- (typically wwv_flow.g_f01).
--==============================================================================
function to_sql_command (
    p_input_array in wwv_flow_global.vc_arr2 )
    return clob;

--==============================================================================
procedure create_plan_table (
    p_schema in varchar2 );

--==============================================================================
procedure explain_plan (
    p_plan_id in number,
    p_sql     in clob,
    p_schema  in varchar2 );

--==============================================================================
procedure save_history (
    p_security_group_id in number,
    p_user              in varchar2,
    p_sql_cmd           in clob,
    p_schema            in varchar2 );

--==============================================================================
-- App process sc_saveQuery, to save the query in SQL Commands.
--==============================================================================
procedure sc_savequery (
    p_name        in varchar2,
    p_desc        in varchar2,
    p_query_id    in varchar2,
    p_schema      in varchar2,
    p_sql_command in clob );

--==============================================================================
-- This gets SQL in CLOB and runs.
--
-- PARAMETERS
-- * p_sql:             The array of SQL lines.
-- * p_schema:          The name of the schema.
--   p_values:          The bind variable values.
--   p_print_msg:       If Y, prints error message or sys.dbms_output into htp buffer.
--   p_language:        The language of the code.
--   p_mle_env:         The MLE environment in which to execute all MLE snippets.
--   p_get_dbms_output: If Y, reads sys.dbms_output buffer and outputs.
--==============================================================================
procedure run_sql (
    p_sql_cmd         in clob,
    p_schema          in varchar2,
    p_values          in wwv_flow_global.vc_arr2       default empty_vc_arr,
    p_print_msg       in varchar2                      default 'N',
    p_language        in wwv_flow_code_exec.t_language default null,
    p_mle_env         in varchar2                      default null,
    p_get_dbms_output in varchar2                      default 'Y' );

--==============================================================================
procedure create_sw_qbe_collection (
    p_object_owner     varchar2,
    p_object_name      varchar2,
    p_column_ids       wwv_flow_global.vc_arr2,
    p_column_names     wwv_flow_global.vc_arr2,
    p_query_conditions wwv_flow_global.vc_arr2,
    p_data_types       wwv_flow_global.vc_arr2,
    p_comments         wwv_flow_global.vc_arr2,
    p_checked          wwv_flow_global.vc_arr2 );

--==============================================================================
function get_binds(
    p_stmt     in clob,
    p_language in wwv_flow_code_exec.t_language default wwv_flow_code_exec.c_plsql )
    return varchar2;

--==============================================================================
procedure perform_binds(
    p_cursor in number,
    p_stmt   in clob,
    p_values in wwv_flow_global.vc_arr2 default empty_vc_arr );

--==============================================================================
procedure get_describe_object_info (
    p_action           in varchar2,
    p_schema           in varchar2,
    p_desc_object_name in varchar2,
    -- out
    p_object_owner     out varchar2,
    p_object_name      out varchar2,
    p_object_type      out varchar2,
    p_object_status    out varchar2 );
end wwv_flow_sw_api;
/
show error;
