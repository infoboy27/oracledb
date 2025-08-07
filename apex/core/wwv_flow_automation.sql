set define '^' verify off
prompt ...wwv_flow_automation.sql
create or replace package wwv_flow_automation as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_automation.sql
--
--    DESCRIPTION
--      Automations
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    07/06/2020 - Created
-- 
--------------------------------------------------------------------------------

--==============================================================================
-- Global types 
--==============================================================================

subtype t_job_status        is pls_integer range 1..3;

c_status_active              constant t_job_status := 1;
c_status_disabled            constant t_job_status := 2;
c_status_disabled_error      constant t_job_status := 3;

--==============================================================================
-- Constants
--==============================================================================
e_skip_current_row               exception;
e_abort_run                      exception;

c_automation_lastrun_item        constant varchar2(27) := 'APEX$AUTOMATION_LASTRUN_ISO';
c_automation_row_num_item        constant varchar2(23) := 'APEX$AUTOMATION_ROW_NUM';
c_automation_error_rows          constant varchar2(26) := 'APEX$AUTOMATION_ERROR_ROWS';
c_automation_row_pk_value        constant varchar2(22) := 'APEX$AUTOMATION_ROW_PK';

c_automation_lastrun_format      constant varchar2(34) := 'YYYY-MM-DD"T"HH24:MI:SS.FF3TZH:TZM';

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- find an automation ID by its static ID
--
-- Parameters:
-- * p_application_id:      ID of the application which contains the automation
-- * p_static_id:           ID of the automation to execute
--
-- Returns:
-- the ID of the automation
--==============================================================================
function find_automation_id(
    p_application_id      in number,
    p_static_id           in varchar2 ) 
    return number;

--==============================================================================
-- executes an automation
--
-- Parameters:
-- * p_automation_id:        ID of the automation to execute
-- * p_is_job:               'Y' if the automation is executed as background job, 'N'
--                           if an APEX session context exists (API call)
-- * p_is_scheduled:         'Y' if this job is executed based on a schedule
-- * p_flow_id:              applicaton ID of the automation (only when P_IS_JOB = 'Y')
-- * p_security_group_id:    workspace ID of the automation (only when P_IS_JOB = 'Y')
-- * p_force_debug_level:    debug level to use during automation execution
--
-- * p_context:              if passed in, this context will be used instead of executing
--                           the automation query. Only used for API calls.
-- * p_filters:              additional filters to be applied to the automation query.
-- * p_order_bys:            additional order bys to be applied to the automation query.
--==============================================================================
procedure execute_automation(
    p_automation_id          in number,
    p_is_job                 in varchar2,
    p_is_scheduled           in varchar2,
    p_flow_id                in number                        default wwv_flow_security.g_flow_id,
    p_security_group_id      in number                        default wwv_flow_security.g_security_group_id,
    p_force_debug_level      in number                        default null,
    --
    p_context                in wwv_flow_exec.t_context       default wwv_flow_exec.c_empty_context,
    p_filters                in wwv_flow_exec_api.t_filters   default wwv_flow_exec_api.c_empty_filters,
    p_order_bys              in wwv_flow_exec_api.t_order_bys default wwv_flow_exec_api.c_empty_order_bys );

--==============================================================================
-- Sets the next scheduled execution date of a 'polling' automation
-- to now so that it's executed as soon as possible after the specified
-- "next run at" timestamp. If it's currently running, it will not be started again.
-- If the automation is disabled, it will be automatically enabled.
--
-- Parameters:
-- * p_automation_id:        ID of the automation to execute
-- * p_next_run_at:          Timestamp of the next automation run
--==============================================================================
procedure reschedule(
    p_automation_id          in number,
    p_next_run_at            in timestamp with time zone );

--==============================================================================
-- Sets the status of an automation to one of the following:
-- * c_status_disabled_error
-- * c_status_disabled
-- * c_status_active
--
-- If the automation is enabled (c_status_active), the "next run timestamp"
-- will be automatically computed based on the configured polling interval and
-- the current timestamp. If the automation is disabled, the "next run timestamp"
-- will be cleared.
-- 
-- Parameters:
-- * p_automation_id:        ID of the automation to execute
-- * p_status:               Status to set the automation to
--==============================================================================
procedure set_job_status(
    p_automation_id in number,
    p_status        in t_job_status );

--==============================================================================
-- determines whether the scheduler job for the automation is currently 
-- running.
--
-- Parameters:
-- * p_id:                   the Automation ID
--
-- Returns:
-- true, of the scheduler job is running, false otherwise.
--==============================================================================
function is_automation_running(
    p_id             in number )
    return boolean;

--==============================================================================
-- aborts a scheduled or running Automation job
--
-- Parameters:
-- * p_id:                   the Automation ID
--==============================================================================
procedure abort_job (
    p_id             in number );

--==============================================================================
-- adds a message to the log for the currently running automation
--
-- Parameters:
-- * p_message_type:         type of the message (error, warning, info)
-- * p_message:              actual message to add to the log            
--==============================================================================
procedure add_log_message(
    p_message_type      in wwv_flow_log.t_message_type,
    p_message           in varchar2 );

--==============================================================================
-- Returns the scheduler job name for an automation
--
-- Parameters:
-- * p_automation_id:        ID of the automation to return the scheduler job name for
--
-- Returns:
-- the name of the scheduler job
--==============================================================================
function get_job_name( 
    p_automation_id in number ) 
    return varchar2;

--==============================================================================
-- kicks off execution for either a specific automation or for all due 
-- automations (whether p_automation_id is passed in or not).
--
-- Parameters:
-- * p_automation_id:        automation ID. If given, only this automation will be executed
-- * p_force_debug_level:    debug level to use during automation execution
--==============================================================================
procedure execute_due_automations(
    p_automation_id          in number default null,
    p_force_debug_level      in number default null );

--==============================================================================
-- gets information about the latest synchronization
--
-- Parameters:
-- * p_automation_id:         automation ID
-- * p_status:                if provided, return details about the last sync with this status.
-- * p_last_timestamp:        timestamp of the last sync operation
--==============================================================================
procedure get_last_run_status(
    p_automation_id        in            number,
    --
    p_status               in out nocopy varchar2,
    p_last_timestamp          out        timestamp with time zone );

end wwv_flow_automation;
/
show err

set define '^'
