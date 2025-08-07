set define '^' verify off
create or replace package sys.wwv_dbms_sql_APEX_240200 authid current_user
accessible by (package APEX_240200.WWV_FLOW_CODE_EXEC_MLE,package APEX_240200.WWV_FLOW_DYNAMIC_EXEC,package APEX_240200.WWV_FLOW_SESSION_RAS)
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2008, 2023, Oracle and/or its affiliates.
--
--    MODIFIED   (MM/DD/YYYY)
--      jkallman  01/28/2008 - Created
--
--------------------------------------------------------------------------------

subtype t_ras_sessionid is raw(16);
g_ras_sessionid t_ras_sessionid;

--==============================================================================
-- Procedure to clear the current stored error backtrace.
--==============================================================================
procedure clear_error_backtrace;

--==============================================================================
-- Procedure to get the current stored error backtrace in case
-- of an error. Storing the error backtrace is necessary, because as soon as an
-- exception is handled, dbms_utility.format_error_backtrace returns a
-- wrong result (bug# 13510548).
--==============================================================================
function get_error_backtrace return varchar2;

--==============================================================================
-- Function to get the last statement where parsing raised an error
--==============================================================================
function get_error_statement return varchar2;

--==============================================================================
-- Return line/column position of the last error in a parse_as_user or execute
-- call.
--==============================================================================
function get_error_position return varchar2;

--==============================================================================
-- Procedure to close an open cursor and set the error backtrace in case of an
-- error. This is necessary, because as soon as an exception is handled,
-- dbms_utility.format_error_backtrace returns a wrong result (bug# 13510548).
-- If a backtrace is already saved, this procedure does nothing. Therefore, it
-- always has to be called in combination with clear_error_state, either
-- directly or indirectly (parse_as_user procedures already call
-- clear_error_state).
--==============================================================================
procedure on_error (
    p_cursor_to_close in out number,
    p_error_statement in varchar2 );
procedure on_error (
    p_cursor_to_close in out number,
    p_error_statement in sys.dbms_sql.varchar2a,
    p_lfflg           in boolean );

--==============================================================================
function override_user (
    p_username in varchar2,
    p_warn     in boolean default false )
    return varchar2;

--==============================================================================
procedure parse_as_user (
    p_cursor    in integer,
    p_query     in varchar2,
    p_username  in varchar2,
    p_use_roles in boolean default FALSE);

--==============================================================================
procedure parse_as_user (
    p_cursor    in integer,
    p_statement in sys.dbms_sql.varchar2a,
    p_username  in varchar2,
    p_lfflg     in boolean default FALSE,
    p_use_roles in boolean default FALSE);

--==============================================================================
function execute (
    c in integer )
    return integer;

--==============================================================================
function execute_and_fetch (
    c in integer,
    exact in boolean default false )
    return integer;

--==============================================================================
$if sys.dbms_db_version.version >= 21 $then
function create_mle_context_as_user (
    p_username      in varchar2,
    p_environment   in varchar2 )
    return sys.dbms_mle.context_handle_t;
$end

--==============================================================================
-- kill the session (p_sid, p_serial#)
--
-- ARGUMENTS
-- * p_sid       sid of the to be killed session
-- * p_serial#   serial# of the to be killed session
-- o p_inst_id   instance id of the to be killed session
-- o p_reason    textual description why the session has to be killed. if not
--               null, this will be logged to the alert file
--==============================================================================
procedure kill_session (
    p_sid     in number,
    p_serial# in number,
    p_inst_id in number   default null,
    p_reason  in varchar2 default null );

end wwv_dbms_sql_APEX_240200;
/
show errors
