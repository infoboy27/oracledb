set define '^' verify off
prompt ...wwv_flow_workflow
create or replace package wwv_flow_workflow as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2023, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_workflow.sql
--
--    DESCRIPTION
--      Oracle APEX Workflow Component.
--
--    SECURITY
--
--    NOTES:
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      ralmuell   01/05/2023 - Created
--
--------------------------------------------------------------------------------
-- Workflow Changed Variable Record
--
-- Attributes:
-- * static_id :    The static id of the workflow variable. This ID must match the
--                  the static id of the corresponding variable in the workflow
--                  definition.
-- * old_value:     The original value of the variable as a string.
-- * new_value:     The updated value of the variable as a string.
--------------------------------------------------------------------------------
type t_wf_changed_var    is record (
    static_id                varchar2(255),
    old_value                varchar2(32767),
    new_value                varchar2(32767));

--------------------------------------------------------------------------------
-- Collection of Workflow Changed Variable Values (to be used in the audit log)
--------------------------------------------------------------------------------
type t_wf_changed_vars   is table of t_wf_changed_var index by pls_integer;

--==============================================================================
--  Constants
--==============================================================================
c_workflow_operation_resume       constant varchar2(30) := 'RESUME';
c_workflow_operation_retry        constant varchar2(30) := 'RETRY';
c_workflow_operation_start        constant varchar2(30) := 'START';
c_workflow_operation_suspend      constant varchar2(30) := 'SUSPEND';
c_workflow_operation_terminate    constant varchar2(30) := 'TERMINATE';

--------------------------------------------------------------------------------
-- Workflow changed variables default
--------------------------------------------------------------------------------
c_empty_wf_changed_vars      t_wf_changed_vars;

--==============================================================================
--  Globals
--==============================================================================
-- Internal:
g_copy_in_progress           boolean := false;

--==============================================================================
-- Sets the debug log level for the Workflow Instance. When set, this will override
-- the debug log level settings for the Workflow Version.
-- Permitted values are
--  1   -   wwv_flow_debug_api.c_log_level_error
--  2   -   wwv_flow_debug_api.c_log_level_warn
--  4   -   wwv_flow_debug_api.c_log_level_info
--  5   -   wwv_flow_debug_api.c_log_level_enter
--  6   -   wwv_flow_debug_api.c_log_level_app_trace
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow
-- * p_debug_level           The Debug Level to use
--
--==============================================================================
procedure set_log_level(
    p_instance_id            in number,
    p_debug_level            in wwv_flow_debug_api.t_log_level);
--==============================================================================
-- Start a new Workflow given the Workflow Definition ID.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_application_id        The application ID that creates the Workflow
-- * p_static_id             Static ID of the Workflow Definition
-- * p_parameters            Optional workflow parameters
-- * p_initiator             A (optional) initiator information for the workflow
-- * p_detail_pk             A (optional) detail Primary Key
-- * p_debug_level           A (optional) debug log level for the Workflow Instance being started
--
-- Returns:
-- * the ID of the newly started workflow
--==============================================================================
function start_workflow(
    p_application_id         in number                          default wwv_flow.g_flow_id,
    p_static_id              in varchar2,
    p_parameters             in wwv_flow_workflow_api.t_workflow_parameters
                                default wwv_flow_workflow_api.c_empty_workflow_parameters,
    p_initiator              in varchar2                        default null,
    p_detail_pk              in varchar2                        default null,
    p_debug_level            in wwv_flow_debug_api.t_log_level  default null)
return number;

--==============================================================================
-- Continues the Workflow at the given Activity.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- * p_static_id             Static ID of the activity
-- * p_activity_params       The parameters returned as part of the activity execution
--                           If these parameters correspond to workflow variables, the
--                           values of those variables will get updated with what is
--                           provided here, before the workflow continues to the next
--                           activity.
-- * p_activity_status       The status of the activity (default: SUCCESS)
--==============================================================================
procedure continue_activity(
    p_instance_id            in number,
    p_static_id              in varchar2,
    p_activity_params        in wwv_flow_global.vc_map,
    p_activity_status        in wwv_flow_workflow_api.t_activity_status
                                default wwv_flow_workflow_api.c_activity_status_success);

--==============================================================================
-- Continues the Workflow at the given Activity.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- * p_activity_instance_id  ID of the Activity Instance
-- * p_activity_params       The parameters returned as part of the activity execution
--                           If these parameters correspond to workflow variables, the
--                           values of those variables will get updated with what is
--                           provided here, before the workflow continues to the next
--                           activity.
-- * p_activity_status       The status of the activity (default: SUCCESS)
--==============================================================================
procedure continue_activity(
    p_instance_id            in number,
    p_activity_instance_id   in number,
    p_activity_params        in wwv_flow_global.vc_map,
    p_activity_status        in wwv_flow_workflow_api.t_activity_status
                                default wwv_flow_workflow_api.c_activity_status_success);

--==============================================================================
-- Update workflow variables.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- * p_changed_params        Table of changed workflow parameters
--==============================================================================
procedure update_variables(
    p_instance_id            in number,
    p_changed_params         in wwv_flow_workflow_api.t_workflow_parameters);

--==============================================================================
-- Suspend a  Workflow .
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
--==============================================================================
procedure suspend(
    p_instance_id            in number);

--==============================================================================
-- Terminate a  Workflow .
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- * p_authorization_check   if true authorization check shall be performed
-- * p_terminate_parent      if true then parent instance will also be terminated

--==============================================================================
procedure terminate(
    p_instance_id            in number,
    p_authorization_check    in boolean default true,
    p_terminate_parent       in boolean default true);

--==============================================================================
-- Retry a  Workflow .
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- * p_authorization_check   if true authorization check shall be performed
--==============================================================================
procedure retry(
    p_instance_id            in number,
    p_authorization_check    in boolean default true);

--==============================================================================
-- Resume a  Workflow .
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- * p_activity_static_id    Static ID of the activity from where to resume 
--==============================================================================
procedure resume(
    p_instance_id            in number,
    p_activity_static_id     in varchar2 default null);

--==============================================================================
-- Terminate all faulted workflow instances for an application
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_application_id        ID of the Application
--==============================================================================
procedure terminate_faulted_workflows(
    p_application_id         in number);

--==============================================================================
-- Checks whether the given user is of a certain participant type for a Workflow.
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id:      The Workflow Id.
-- * p_participant_type: The participant type.
-- * p_user:             The user to check for.
--
-- Returns:
-- true, if the user given by p_user is a participant of given participant
-- type for a given workflow, false otherwise
--==============================================================================
function is_of_participant_type(
    p_instance_id            in number,
    p_participant_type       in wwv_flow_workflow_api.t_workflow_participant_type,
    p_user                   in varchar2)
return boolean;

--==============================================================================
-- Checks whether the given user is allowed to perform a certain operation on
-- a Workflow.
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id:       The Workflow Id.
-- * p_operation:         The operation to check.
-- * p_user:              The user to check for. Default is logged in user
--
-- Returns:
-- true, if the user given by p_user is allowed to perform the operation
-- given by p_operation, false otherwise
--
-- Example:
-- ~~~
-- declare
--     l_is_allowed boolean;
-- begin
--     l_is_allowed := apex_workflow.is_allowed(
--         p_task_id         => 1234,
--         p_operation       => apex_workflow.c_workflow_op_suspend,
--         p_user            => 'STIGER'
--     );
--     if l_is_allowed then
--         dbms_output.put_line('STIGER is a allowed to suspend the workflow 1234');
--     end if;
-- end;
-- ~~~
--==============================================================================
function is_allowed(
    p_instance_id            in number,
    p_operation              in wwv_flow_workflow_api.t_workflow_operation,
    p_user                   in varchar2 default wwv_flow_security.g_user)
return boolean;

--==============================================================================
-- Refreshes the participants for this workflow instance
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id:       The Workflow Id.
--
--==============================================================================
procedure refresh_participants(
    p_instance_id    in number);

--==============================================================================
-- Checks whether the given user is a business administrator for at least one
-- workflow in this application.
--
-- Since: 23.2
--
-- Parameters:
-- * p_user:              The user to check for. Default is logged in user
-- * p_application_id:    The application to check for. Default behavior
--                        checks against all applications in the workspace.
--
-- Return:
-- true, if the user given by p_user is defined as a Business Admin for
-- at least one workflow in the given application, false otherwise
--==============================================================================
function is_workflow_admin(
    p_user           in varchar2 default wwv_flow_security.g_user,
    p_application_id in number   default null)
return boolean;

--==============================================================================
-- Get the current state of the workflow
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- Returns:
-- wwv_flow_workflow_api.t_workflow_state
--==============================================================================
function get_workflow_state(
    p_instance_id            in number)
return wwv_flow_workflow_api.t_workflow_state ;

--==============================================================================
-- Get the initiator of the workflow
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- Returns:
-- varchar2
--==============================================================================
function get_workflow_initiator(
    p_instance_id            in number)
return varchar2 ;

--==============================================================================
-- Get the due date of an activity instance
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- * p_activity_instance_id  ID of the Activity Instance
-- Returns:
-- timestamp with time zone
--==============================================================================
function get_activity_due_date(
    p_instance_id            in number,
    p_activity_instance_id   in number)
return timestamp with time zone;

--=================================================================================
-- Get the string value of a workflow variable. If the workflow variable has a format
-- mask set, the same format mask will be applied to value being returned.
-- If the workflow variable is of CLOB data type and the data length > varchar2 max length
-- then an exception will be thrown if p_raise is set to true.
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow Instance
-- * p_variable_static_id    Static ID of the variable
-- * p_raise                 Raise exception if CLOB data exceeds max length of varchar2. Default false.
--
-- Returns:
-- varchar2
--==============================================================================
function get_variable_value(
    p_instance_id            in number,
    p_variable_static_id     in varchar2,
    p_raise                  in boolean   default false)
return varchar2;

--=================================================================================
-- Get the CLOB value of a workflow variable. Will return the VARCHAR2 value if
-- the data type of the variable is VARCHAR2.
-- Will return NULL if the variable is not of CLOB or VARCHAR2 datatype
-- Since: 24.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow
-- * p_variable_static_id    Static ID of the variable
-- Returns:
-- clob
--==============================================================================
function get_variable_clob_value(
    p_instance_id            in number,
    p_variable_static_id     in varchar2)
return clob;

--==============================================================================
-- Internal API's
--==============================================================================

--------------------------------------------------------------------------------
-- Start a new Workflow given the Workflow Definition ID.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_application_id        The application ID that creates the Workflow
-- * p_workflow_id           ID of the Workflow (Definition)
-- * p_parameters            Optional workflow parameters
-- * p_initiator             A (optional) initiator information for the workflow
-- * p_detail_pk             A (optional) detail Primary Key
-- * p_debug_level           A (optional) debug log level for the Workflow Instance being started
-- * p_retry_point           A (optional) value specifying an invoked workflow instance's retry behavior
--                           in case it has faulted. If value is RESUME, the invoked workflow is retried from
--                           the faulted activity in the child workflow.
--                           If value is START_OVER then the invoked workflow is instantiated from the beginning
--                           The value is null by default.
-- * p_parent_workflow_id    A (optional) workflow instance from where the current workflow was invoked.
-- * p_parent_wf_activity_id A (optional) workflow activity instance that invoked the current workflow and is waiting for
--                           the current workflow to complete.
-- Returns:
-- * the ID of the newly started workflow
--------------------------------------------------------------------------------
function start_workflow(
    p_application_id         in number                          default wwv_flow.g_flow_id,
    p_workflow_id            in number,
    p_parameters             in wwv_flow_workflow_api.t_workflow_parameters
                                default wwv_flow_workflow_api.c_empty_workflow_parameters,
    p_initiator              in varchar2                        default null,
    p_detail_pk              in varchar2                        default null,
    p_debug_level            in wwv_flow_debug_api.t_log_level  default null,
    p_retry_point            in varchar2                        default null,
    p_parent_workflow_id     in number                          default null,
    p_parent_wf_activity_id  in number                          default null)
return number;

--==============================================================================
-- compute component values for workflow parameters and return the name-value
-- pairs as wwv_flow_workflow_api.t_workflow_params array
--
-- PARAMETERS:
-- * p_component_type        process component type to fetch parameters for
-- * p_component_id          id of the process type component
-- * p_workflow_id           id of the workflow
-- RETURNS:
-- * t_workflow_parameters   fetched parameters for the given component
--==============================================================================
function get_workflow_comp_parameters(
    p_component_type         in varchar2,
    p_component_id           in number,
    p_workflow_id            in number)
return wwv_flow_workflow_api.t_workflow_parameters;

--==================================================================================
-- Update Workflow Variables.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_security_group_id     The Workspace ID
-- * p_workflow$_id          Workflow Instance ID
-- * p_parameters            Workflow Parameter list
-- * p_update_only           If only existing variables should be updated
-- * p_message               Description of the updated variables to save in audit log
--====================================================================================
procedure update_workflow_variables(
   p_security_group_id       in number,
   p_workflow$_id            in number,
   p_parameters              in wwv_flow_workflow_api.t_workflow_parameters,
   p_update_only             in boolean default false,
   p_message                out varchar2,
   p_changed_variables      out t_wf_changed_vars);

--==============================================================================
-- Removes workflow instances created in DEV mode. This API can be used by
-- a developer to remove any workflow instances that have been started from
-- App Builder in DEV mode.
--
-- Since: 23.2
--
-- Parameters:
-- * p_application_id        The application ID
-- * p_static_id             Static ID of the workflow, if omitted, all development
--                           workflow instances of the application will be removed
--
-- Example:
-- ~~~
-- begin
--   apex_workflow.remove_development_instances(
--     p_application_id => 100);
-- end;
-- ~~~
--==============================================================================
procedure remove_development_instances(
    p_application_id         in number   default wwv_flow.g_flow_id,
    p_static_id              in varchar2 default null);

--================================================================================
-- Parse  the correlation_context attribute of the Plugin Process record.
-- to extract the workflow and activity instance IDs.
--
-- Since: 23.2
--
-- Parameters:
-- * p_value               The value of the correlation context in Plugin Process record
-- * p_workflow_id         The workflow instance ID extracted from the correlation ID
-- * p_activity_id         The activity instance ID extracted from the correlation ID
--=================================================================================
procedure parse_correlation_context(
    p_value                  in varchar2,
    p_workflow_id           out number,
    p_activity_id           out number);

--================================================================================
-- Parse  the correlation_context attribute of the Plugin Process record.
-- to extract the workflow and activity instance IDs.
--
-- Since: 24.2
--
-- Parameters:
-- * p_value               The value of the correlation context in Plugin Process record
-- * p_workflow_id         The workflow instance ID extracted from the correlation ID
-- * p_activity_id         The activity instance ID extracted from the correlation ID
-- * p_voluntary_terminate true, if the correlation is used in a context of suspend/alter/resume
--=================================================================================
procedure parse_correlation_context(
    p_value                  in varchar2,
    p_workflow_id           out number,
    p_activity_id           out number,
    p_voluntary_terminate   out boolean);

--==============================================================================
-- Execute the Workflow End Activity.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_process               The Plugin Process record
--==============================================================================
procedure execute_end(
    p_process                in wwv_flow_plugin_api.t_process);

--==============================================================================
-- Execute the Workflow Switch Activity.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_process               The Plugin Process record
--==============================================================================
procedure execute_switch(
    p_process                in wwv_flow_plugin_api.t_process);

--==============================================================================
-- Execute the Workflow Wait Activity.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_process               The Plugin Process record
--==============================================================================
procedure execute_wait(
    p_process                in wwv_flow_plugin_api.t_process);

--==============================================================================
-- Complete the Workflow Wait Activity.
-- This function is used from wwv_flow_process_native.plb to complete a workflow wait
-- activity created by a workflow based on the defined attributes in p_process.

--
-- Since: 24.1
--
-- Parameters:
-- * p_process:  The Plugin process.
-- * p_param:    A record with
--               i) Key Value Map containing and parameters passed to the apex_workflow
--                    .continue_activity procedure to complete the wait activity
--               ii) The status of the completed wait activty - Success or Error
-- Returns:
-- wwv_flow_plugin_api.t_process_complete_result
--==============================================================================
function complete_wait (
    p_process                in wwv_flow_plugin_api.t_process,
    p_param                  in wwv_flow_plugin_api.t_process_complete_param)
    return wwv_flow_plugin_api.t_process_complete_result;
--==============================================================================
-- Execute the Invoke Workflow  Activity.
--
--
-- Since: 24.2
--
-- Parameters:
-- * p_plugin                The Plugin record
-- * p_process               The Plugin Process record
--==============================================================================
function execute_invoked_wf(
    p_plugin                 in wwv_flow_plugin_api.t_plugin,
    p_process                in wwv_flow_plugin_api.t_process)
return wwv_flow_plugin_api.t_process_exec_result;
--==============================================================================
-- Implement the Completion of Invoke Workflow plugin.
-- This function is called from wwv_flow_process_native.plb to complete a workflow
-- invoked by another workflow based on the defined attributes in p_process.

--
-- Since: 24.2
--
--==============================================================================

function complete_invoked_wf (
    p_plugin                 in wwv_flow_plugin_api.t_plugin,
    p_process                in wwv_flow_plugin_api.t_process,
    p_param                  in wwv_flow_plugin_api.t_process_complete_param)
    return wwv_flow_plugin_api.t_process_complete_result;
--==============================================================================
-- Implement the Termination/Cancellation of Invoke Workflow plugin.
-- This function is used from wwv_flow_process_native.plb to terminate a workflow
-- invoked by another workflow based on the defined attributes in p_process.
--
--==============================================================================

function terminate_invoked_wf(
    p_process in wwv_flow_plugin_api.t_process)
    return wwv_flow_plugin_api.t_process_terminate_result;
--==============================================================================
-- Execution Shell for Activities.
-- This procedure is scheduled from handle_state procedure, hence we
-- give the spec here.
--
-- Since: 23.2
--
-- Parameters:
-- * p_security_group_id     The Workspace ID
-- * p_application_id        The Application ID
-- * p_workflow$_id          The Workflow Instance ID
-- * p_activity_id           The ID of the Activity to execute
-- * p_transition_id         The ID of the (incoming) transition for the Activity 
-- * p_activity$_id          The Activity Instance ID of the previous Activity
-- * p_is_retry              Wheteher to retry (true) or not (false)
--==============================================================================
procedure execution_shell(
    p_security_group_id      in number,
    p_application_id         in number,
    p_workflow$_id           in number,
    p_activity_id            in number,
    p_transition_id          in number,
    p_activity$_id           in number,
    p_is_retry               in boolean);

--==============================================================================
-- Handle State Job for Activities.
-- This procedure is scheduled from handle_state procedure, hence we
-- give the spec here.
--
-- Since: 23.2
--
-- Parameters:
-- * p_security_group_id     The Workspace ID
-- * p_application_id        The Application ID
-- * p_workflow$_id          The Workflow Instance ID
-- * p_activity_id           The ID of the Activity to execute
-- * p_transition_id         The ID of the (incoming) transition for the Activity
-- * p_activity$_id          The Activity Instance ID of the previous Activity
-- * p_retry_flag            Wheteher to retry ('Y') or not ('N')
-- * p_session_time_zone     The time zone for the job DB session
-- * p_log_level             The debug level to use for this job
--==============================================================================
procedure handle_state_job(
    p_security_group_id      in number,
    p_application_id         in number,
    p_workflow$_id           in number,
    p_activity_id            in number,
    p_transition_id          in number,
    p_activity$_id           in number,
    p_retry_flag             in varchar2,
    p_session_time_zone      in varchar2,
    p_log_level              in number);

--==============================================================================
-- Handle State (change) of a workflow instance
-- Since: 23.2
--
-- Parameters:
-- * p_security_group_id     The Workspace ID
-- * p_workflow$_id          The Workflow Instance ID
-- * p_activity_id           The activity the workflow is transitioning to next
-- * p_transition_id         The ID of the (incoming) transition for the Activity
-- * p_activity$_id          The Activity Instance ID of the current Activity
-- * p_is_retry              The Flag to indicate if the activity is being retried
-- * p_retry_count           The actual retry count
--==============================================================================
procedure handle_state(
    p_security_group_id      in number,
    p_workflow$_id           in number,
    p_activity_id            in number,
    p_transition_id          in number   default null,
    p_activity$_id           in number   default null,
    p_is_retry               in boolean  default false,
    p_retry_count            in number   default null);

--==============================================================================
-- Handling Async Activities.
-- This procedure is scheduled from handle_async procedure, hence we
-- give the spec here.
--
-- Since: 23.2
--
-- Parameters:
-- * p_security_group_id     The Workspace ID
-- * p_application_id        The Application ID
-- * p_workflow$_id          The Workflow Instance ID
-- * p_activity$_id          The Activity Instance ID of the previous Activity
-- * p_activity_status       The Activity Status
-- * p_activity_result       The activity result as JSON (because of JOB param)
-- * p_session_time_zone     The time zone to use in the job DB session
--==============================================================================
procedure handle_async_job(
    p_security_group_id      in number,
    p_application_id         in number,
    p_workflow$_id           in number,
    p_activity$_id           in number,
    p_activity_status        in wwv_flow_workflow_api.t_activity_status,
    p_activity_result        in clob,
    p_session_time_zone      in varchar2);

--==============================================================================
-- Handling Timed Out Activities.
-- This procedure is scheduled from handle_timeouts procedure, hence we
-- give the spec here.
--
-- Since: 23.2
--
-- Parameters:
-- * p_security_group_id     The Workspace ID
-- * p_application_id        The Application ID
-- * p_workflow$_id          The Workflow Instance ID
-- * p_activity$_id          The Activity Instance ID
-- * p_activity_id           The Activity ID
-- * p_parent_workflow$_id   The Parent Workflow Instance ID
-- * p_parent_activity$_id   The Parent Activity Instance ID
-- * p_activity_state        The state of the Activity Instance
-- * p_session_time_zone     The time zone to use in the job DB session
--==============================================================================
procedure timeout_job(
    p_security_group_id      in number,
    p_application_id         in number,
    p_workflow$_id           in number,
    p_activity$_id           in number,
    p_activity_id            in number,
    p_parent_workflow$_id    in number,
    p_parent_activity$_id    in number,
    p_activity_state         in varchar2,
    p_session_time_zone      in varchar2);

--==============================================================================
-- Handling Workflow Activity Time-Outs .
--
-- This procedure is responsible for the following
-- (1.) Process an activity that has timed out.
--
-- (2.) If the activity has time-out transitions, those will be taken. Otherwise
--  the activity will go to Faulted state
--
-- Since: 23.2
--
-- Parameters:
-- * p_security_group_id     The security group ID.
--
-- The procedure will be executed by a DBMS_SCHEDULER job, see wwv_flow_upgrade
--==============================================================================
procedure handle_timeout(
    p_security_group_id      in number default null);

--==============================================================================
-- Suspend all active Workflows for a given Application.
--
-- Since: 23.2
--
-- Parameters:
-- * p_application_id        The APEX Application ID for which to suspend the
--                           active Workflows
--==============================================================================
procedure suspend_all(
    p_application_id         in number);

--==============================================================================
-- Support functions for Unit Tests
--==============================================================================
function boolean_to_char(
        p_boolean_value      in boolean,
        p_format_mask        in varchar2 default null)
return varchar2;

--==============================================================================
-- Return g_workflow_instance
--==============================================================================
function get_g_workflow_instance_id
return number;

--==============================================================================
-- Delete all test instances.
--==============================================================================
procedure delete_instances;

--==============================================================================
-- Get the workflows of a user depending on the given context. Context can be
-- MY_WORKFLOWS, ADMIN_WORKFLOWS or SINGLE_WORKFLOW.
--
-- Note: The function will only return data in the context of a valid APEX
-- session. It will return no data in SQL Workshop.
--
-- Since: 23.2
--
-- Parameters:
-- * p_context:              The list context. Default is MY_WORKFLOWS.
-- * p_user:                 The user to check for. Default is logged in user.
--                           Needs p_context set to MY_WORKFLOWS, ADMIN_WORKFLOWS or INITIATED_BY_ME.
-- * p_workflow_id:          Filter for a workflow ID instead of a user. Default is null.
--                           Needs p_context set to SINGLE_WORKFLOW.
-- * p_application_id:       Filter for an application. Default is null (all applications).
--
-- Return:
-- sys_refcursor
--==============================================================================
function get_workflows (
    p_context        in varchar2 default wwv_flow_workflow_api.c_context_my_workflows,
    p_user           in varchar2 default wwv_flow_security.g_user,
    p_workflow_id    in number   default null,
    p_application_id in number   default null )
return sys_refcursor;

--------------------------------------------------------------------------------
-- Get the string value of a workflow variable by attribute values
--------------------------------------------------------------------------------
function get_variable_value (
    p_string_value        in varchar2,
    p_number_value        in number,
    p_timestamp_value     in timestamp,
    p_timestamp_tz_value  in timestamp with time zone,
    p_timestamp_ltz_value in timestamp with local time zone,
    p_boolean_value       in varchar2,
    p_clob_value          in clob,
    p_data_type           in varchar2,
    p_format_mask         in varchar2 )
return varchar2;

--==============================================================================
-- Get the timestamp of the next Purge run.
--
--
-- Example:
-- ~~~
-- declare
--     l_next_purge_job_ts timestamp with time zone;
-- begin
--     l_next_purge_job_ts := apex_workflow.get_next_purge_timestamp();
-- end;
-- ~~~
--
--==============================================================================
function get_next_purge_timestamp
return timestamp with time zone;

--==============================================================================
-- Returns the configuration of the Workflow Diagram components as a JSON string
--==============================================================================
function get_workflow_diagram_config
return varchar2;


--==============================================================================
-- Migrate the Workflow Audit Log to use the new semantics starting with 24.2
--
-- Parameters:
-- * p_application_id: The APEX application ID for which to migrate the Audit Log.
--
-- This procedure is invoked from
-- - wwv_flow_imp.plb
--==============================================================================
procedure migrate_workflow_audit_log(
    p_application_id         in number);

end wwv_flow_workflow;
/
show err

set define '^'
