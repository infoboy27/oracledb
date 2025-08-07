set define '^' verify off
prompt ...wwv_flow_sw_page_calls
create or replace package wwv_flow_sw_page_calls is
--------------------------------------------------------------------------------
--
--  Copyright (c) 2005, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_sw_page_calls.sql
--
--    DESCRIPTION
--
--    NOTES
--
--    Arguments:
--
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--     skutz    05/25/2005 - created
--
--------------------------------------------------------------------------------

procedure sql_results (
    p_sql_command2  in clob,
    p_bind_vals     in varchar2,
    p_schema        in varchar2,
    p_language      in wwv_flow_code_exec.t_language default wwv_flow_code_exec.c_sql,
    p_mle_env       in varchar2                      default null );

function restore_object (
    p_object_name   in varchar2,
    p_object_owner  in varchar2,
    p_object_type   in varchar2 )
    return varchar2;

function purge_object (
    p_object_name   in varchar2,
    p_object_owner  in varchar2,
    p_object_type   in varchar2 )
    return varchar2;

function purge_recyclebin (
    p_object_owner  in varchar2 )
    return varchar2;

procedure update_comment (
    p_owner         in varchar2,
    p_table_name    in varchar2,
    p_table_comment in varchar2 );

end wwv_flow_sw_page_calls;
/
show error
