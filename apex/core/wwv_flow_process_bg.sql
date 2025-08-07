set define '^' verify off
prompt ...wwv_flow_process_bg.sql
create or replace package wwv_flow_process_bg as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_process_bg.sql
--
--    DESCRIPTION
--      Background Execution of Page Processes
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    11/29/2022 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- returns the execution ID which is currently processing
--==============================================================================
function get_current_execution_id
    return number;

--==============================================================================
-- returns the execution chain ID which is currently executing
--==============================================================================
function get_current_chain_id
    return number;

--==============================================================================
-- returns TRUE if there are currently running background executions for the
-- given application. Active means either SCHEDULED or EXECUTING.
--==============================================================================
function has_active_executions(
    p_application_id         in number,
    p_security_group_id      in number )
    return boolean;

--==============================================================================
-- returns TRUE if any of the application's page processes execute in the
-- background.
--==============================================================================
function has_bg_processing(
    p_application_id         in number,
    p_security_group_id      in number )
    return boolean;

--==============================================================================
-- fetches execution details based on a given execution ID
--==============================================================================
function get_execution(
    p_execution_id       in number,
    p_application_id     in number,
    p_security_group_id  in number default wwv_flow_security.g_curr_flow_security_group_id )
    return wwv_flow_process_bg_api.t_execution;

--==============================================================================
-- sets the currently executing process ID for an execution
--==============================================================================
procedure set_current_exec_process(
    p_execution_id             in number,
    p_current_exec_process_id  in number );

--==============================================================================
-- clears the currently executing process ID for an execution
--==============================================================================
procedure clear_current_exec_process(
    p_execution_id             in number );

--==============================================================================
-- sets the current status for an execution
--==============================================================================
procedure set_execution_status(
    p_execution_id      in number,
    p_security_group_id in number                                    default wwv_flow_security.g_curr_flow_security_group_id,
    p_status            in wwv_flow_process_bg_api.t_execution_state default null,
    p_message           in varchar2                                  default null );

--==============================================================================
-- Sets execution progress (sofar, total work)
--==============================================================================
procedure set_progress(
    p_totalwork in number default null,
    p_sofar     in number );

--==============================================================================
-- Sets execution status message
--==============================================================================
procedure set_status_message(
    p_message   in varchar2 );

--==============================================================================
-- locks an application for background processing. Once an application is locked,
-- the coordinator job will not kick off execution jobs for this application,
-- until the lock is released.
--==============================================================================
function lock_application(
    p_application_id    in number,
    p_exclusive         in boolean )
    return boolean;

--==============================================================================
-- aborts an execution or all executions for a given process ID
--==============================================================================
procedure abort(
    p_application_id     in number,
    p_security_group_id  in number default wwv_flow_security.g_curr_flow_security_group_id,
    p_process_id         in number default null,
    p_execution_id       in number default null );

--==============================================================================
-- aborts an execution or all executions for a given process ID. Runs in an
-- autonomous transactions which commits afterwards.
--==============================================================================
procedure abort_atx(
    p_application_id     in number,
    p_security_group_id  in number default wwv_flow_security.g_curr_flow_security_group_id,
    p_process_id         in number default null,
    p_execution_id       in number default null );

--==============================================================================
-- deletes process executions by Application ID. Executions are handled
-- depending on their current state.
--
-- * ENQUEUED:   remove execution; delete working session clone
-- * SCHEDULED:  remove execution; drop scheduled job, delete working session clone
-- * EXECUTING:  remove execution; drop scheduled job, delete working session clone
-- * FAILED:     remove execution
-- * SUCCESS:    remove execution
-- * ABORTED:    remove execution
--==============================================================================
procedure remove_all_executions(
    p_application_id         in number,
    p_security_group_id      in number );

--==============================================================================
-- executes an execution chain; to be executed by an executor job
--==============================================================================
procedure perform_execution(
    p_execution_id           in number,
    --
    p_security_group_id      in number,
    p_flow_id                in number,
    p_page_id                in number,
    p_process_id             in number,
    --
    p_cloned_work_session_id in number,
    p_request                in varchar2 );

--==============================================================================
-- executes all enqueued chains
--==============================================================================
procedure coordinator_job;

--==============================================================================
-- entry point for wwv_flow_process_native; this is called only for execution
-- chains with background execution enabled, and it enqueues the execution to
-- the background executions table.
--==============================================================================
function add_execution (
    p_process                in wwv_flow_plugin_api.t_process,
    p_error_message          in varchar2,
    p_error_display_location in varchar2 )
    return wwv_flow_plugin_api.t_process_exec_result;

end wwv_flow_process_bg;
/
sho err

set define '^'
