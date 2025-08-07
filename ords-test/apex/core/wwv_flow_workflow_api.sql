set define '^' verify off
prompt ...wwv_flow_workflow_api
create or replace package wwv_flow_workflow_api authid current_user as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2023, 2024, Oracle and/or its affiliates.
--
--
-- The APEX_WORKFLOW package provides API's for the management of Workflows in APEX.
-- This package is part of the
-- Oracle APEX Workflow functionality.
--------------------------------------------------------------------------------


--==============================================================================
-- Global types
--==============================================================================
subtype t_workflow_state            is varchar2(10);

subtype t_activity_status           is varchar2(15);

subtype t_workflow_participant_type is varchar2(15);

subtype t_workflow_list_context     is varchar2(15);

subtype t_workflow_operation        is varchar2(30);

--==============================================================================
-- Data Types.
--==============================================================================

--------------------------------------------------------------------------------
-- Workflow Parameter (Value)
--
-- Attributes:
-- * static_id :    The static id of the parameter. This ID must match the
--                  the static id of the corresponding parameter in the workflow
--                  definition.
-- * value:         The value of the parameter as a session state value
-- * string_value:  The value of the parameter as a string.
-- * format_mask:   An optional format mask for the parameter
--------------------------------------------------------------------------------
type t_workflow_parameter    is record (
    static_id                varchar2(255),
    value                    wwv_flow_session_state_api.t_value,
    string_value             varchar2(32767),
    format_mask              varchar2(255));

--------------------------------------------------------------------------------
-- Collection of Workflow Parameter Values
--------------------------------------------------------------------------------
type t_workflow_parameters   is table of t_workflow_parameter index by pls_integer;

--------------------------------------------------------------------------------
-- Collection of Workflow Participant Types
--------------------------------------------------------------------------------
type t_workflow_participant_types is table of t_workflow_participant_type
    index by pls_integer;
--==============================================================================
-- Constants.
--==============================================================================
c_workflow_system_user  constant varchar2(8)  := 'system';
--------------------------------------------------------------------------------
-- Workflow and Activity (Instance) states
--------------------------------------------------------------------------------
c_state_active      constant t_workflow_state := 'ACTIVE';
c_state_terminated  constant t_workflow_state := 'TERMINATED';
c_state_completed   constant t_workflow_state := 'COMPLETED';
c_state_faulted     constant t_workflow_state := 'FAULTED';
c_state_suspended   constant t_workflow_state := 'SUSPENDED';
c_state_waiting     constant t_workflow_state := 'WAITING';
--------------------------------------------------------------------------------
-- Workflow (Instance) operations
--------------------------------------------------------------------------------
c_workflow$_op_suspend      constant t_workflow_operation   := 'SUSPEND';
c_workflow$_op_resume       constant t_workflow_operation   := 'RESUME';
c_workflow$_op_retry        constant t_workflow_operation   := 'RETRY';
c_workflow$_op_update_var   constant t_workflow_operation   := 'UPDATE_VARIABLE';
c_workflow$_op_terminate    constant t_workflow_operation   := 'TERMINATE';
--==============================================================================
-- Workflow Substitution Strings
--==============================================================================
c_workflow_id                constant varchar2(30)     := 'APEX$WORKFLOW_ID';
c_workflow_activity_id       constant varchar2(30)     := 'APEX$WORKFLOW_ACTIVITY_ID';
c_workflow_initiator         constant varchar2(30)     := 'APEX$WORKFLOW_INITIATOR';
c_workflow_state             constant varchar2(30)     := 'APEX$WORKFLOW_STATE';
c_workflow_detail_pk         constant varchar2(30)     := 'APEX$WORKFLOW_DETAIL_PK';
c_workflow_created_on        constant varchar2(30)     := 'APEX$WORKFLOW_CREATED_ON';

--------------------------------------------------------------------------------
-- Workflow Activity (Instance) status
--------------------------------------------------------------------------------
c_activity_status_success    constant t_activity_status := 'SUCCESS';
c_activity_status_failure    constant t_activity_status := 'FAILURE';

--------------------------------------------------------------------------------
-- Workflow parameters default
--------------------------------------------------------------------------------
c_empty_workflow_parameters  t_workflow_parameters;

--------------------------------------------------------------------------------
-- Workflow Participant Types
--------------------------------------------------------------------------------
c_workflow_owner             constant t_workflow_participant_type := 'OWNER';
c_workflow_admin             constant t_workflow_participant_type := 'ADMIN';

--------------------------------------------------------------------------------
-- Workflow List Context Types
--------------------------------------------------------------------------------
c_context_my_workflows           constant t_workflow_list_context := 'MY_WORKFLOWS';
c_context_admin_workflows        constant t_workflow_list_context := 'ADMIN_WORKFLOWS';
c_context_initiated_by_me        constant t_workflow_list_context := 'INITIATED_BY_ME';
c_context_single_workflow        constant t_workflow_list_context := 'SINGLE_WORKFLOW';

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
-- Example:
-- Below example sets the debug level of  a Workflow Instance.
-- ~~~
--
-- begin
--     apex_workflow.set_log_level (
--         p_instance_id    =>  1,
--         p_debug_level    =>  wwv_flow_debug_api.c_log_level_app_trace);
--
-- end;
-- ~~~
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
--
-- Example:
-- Below example starts a Workflow for a given Requisition.
-- ~~~
-- declare
--    l_req_id      number        := 10;
--    l_req_item    varchar2(100) := 'Some requisition item requiring approval';
--    l_req_amount  number        := 2499.42;
--    l_workflow_id number;
-- begin
--     l_workflow_id := apex_workflow.start_workflow (
--         p_application_id => 110,
--         p_static_id      => 'REQUISTIONWORKFLOW',
--         p_parameters     => apex_workflow.t_workflow_parameters(
--             1 => apex_workflow.t_workflow_parameter(static_id => 'REQ_DATE',   string_value => sysdate),
--             3 => apex_workflow.t_workflow_parameter(static_id => 'REQ_AMOUNT', string_value => l_req_amount),
--             4 => apex_workflow.t_workflow_parameter(static_id => 'REQ_ITEM',   string_value => l_req_item),
--             5 => apex_workflow.t_workflow_parameter(static_id => 'REQ_ID',     string_value => l_req_id)),
--         p_debug_level => wwv_flow_debug_api.c_log_level_info );
-- end;
-- ~~~
--==============================================================================
function start_workflow(
    p_application_id         in number                          default wwv_flow.g_flow_id,
    p_static_id              in varchar2,
    p_parameters             in t_workflow_parameters           default c_empty_workflow_parameters,
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
-- * p_instance_id           ID of the Workflow
-- * p_static_id             Static ID of the activity
-- * p_activity_params       The parameters returned as part of the activity execution
--                           If these parameters correspond to workflow variables, the
--                           values of those variables will get updated with what is
--                           provided here, before the workflow continues to the next
--                           activity.
-- * p_activity_status       The status of the activity (default: SUCCESS)
--
-- Example:
-- Below example continues a Workflow Activity.
-- ~~~
-- declare
--    l_activity_params wwv_flow_global.vc_map;
-- begin

--      l_activity_result('TASK_OUTCOME')   :=  'APPROVED';
--      apex_workflow.continue_activity(
--           p_instance_id          => 1234,
--           p_static_id            => 'REQUEST_LEAVE_APPROVAL',
--           p_activity_params      => l_activity_result);
--
-- end;
--==============================================================================
procedure continue_activity(
    p_instance_id            in number,
    p_static_id              in varchar2,
    p_activity_params        in wwv_flow_global.vc_map,
    p_activity_status        in t_activity_status default c_activity_status_success);

--==============================================================================
-- Continues the Workflow at the given Activity.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow
-- * p_activity_instance_id  ID of the Activity Instance
-- * p_activity_params       The parameters returned as part of the activity execution
--                           If these parameters correspond to workflow variables, the
--                           values of those variables will get updated with what is
--                           provided here, before the workflow continues to the next
--                           activity.
-- * p_activity_status       The status of the activity (default: SUCCESS)
--
-- Example:
-- Below example continues a Workflow Activity.
-- ~~~
-- declare
--    l_activity_params wwv_flow_global.vc_map;
-- begin

--      l_activity_result('TASK_OUTCOME')   :=  'APPROVED';
--      apex_workflow.continue_activity(
--           p_instance_id          => 1234,
--           p_activity_instance_id => 1,
--           p_activity_params      => l_activity_result);
--
-- end;
--==============================================================================
procedure continue_activity(
    p_instance_id            in number,
    p_activity_instance_id   in number,
    p_activity_params        in wwv_flow_global.vc_map,
    p_activity_status        in t_activity_status default c_activity_status_success);

--==============================================================================
-- Update workflow variables of the workflow instance.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow
-- * p_changed_params        Table of workflow variables to be updated
--
-- Example:
-- Below example updates a Workflow Variable value. If the Workflow Variable has a format mask
-- set, the same mask will be applied to the value being passed here.
-- ~~~
--
--begin
--    apex_workflow.update_variables(
--           p_instance_id => 1234,
--           p_changed_params => apex_workflow.t_workflow_parameters(
--               1 => apex_workflow.t_workflow_parameter(static_id => 'NEW_SALARY', string_value => '2,560.50')));
--end;

--==============================================================================
procedure update_variables(
    p_instance_id            in number,
    p_changed_params         in t_workflow_parameters);

--==============================================================================
-- Suspend a  Workflow .
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow
--
-- Example:
-- Below example suspends a Workflow Instance. Only Active or Faulted Workflow Instances
-- can be suspended.
-- ~~~
--
--begin
--    apex_workflow.suspend(
--           p_instance_id => 1234);
--end;
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
-- * p_instance_id           ID of the Workflow
--
-- Example:
-- Below example terminates a Workflow Instance. Only Active, Suspended or Faulted Workflow Instances
-- can be terminated.
-- ~~~
--
--begin
--    apex_workflow.terminate(
--           p_instance_id => 1234);
--end;
--==============================================================================
procedure terminate(
    p_instance_id            in number);

--==============================================================================
-- Retry a  Workflow .
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow
--
-- Example:
-- Below example retries a Faulted Workflow Instance. The activity at which the fault was
-- encountered, is the point of retry.
--
--begin
--    apex_workflow.retry(
--           p_instance_id => 1234);
--end;
--==============================================================================
procedure retry(
    p_instance_id            in number);

--==============================================================================
-- Resume a Workflow.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow
-- * p_activity_static_id    Static ID of the Activity to resume the Workflow or
--                           null if to resume at current activity
--
-- Example:
-- Below example resumes a Workflow Instance at activity 'UPDATE_JOB_LEVEL'.
-- Only suspended Workflow Instances can be resumed.
--
--begin
--    apex_workflow.suspend(
--           p_instance_id        => 1234,
--           p_activity_static_id => 'UPDATE_JOB_LEVEL');
--end;
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
--
-- Example:
-- Below example terminates all faulted  Workflow Instances.
--
--begin
--    apex_workflow.terminate_faulted_workflows(
--           p_application_id => 110);
--end;
--==============================================================================
procedure terminate_faulted_workflows(
    p_application_id         in number);

--==============================================================================
-- Get the current state of the workflow
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Application
-- Returns:
-- t_workflow_state
-- Example:
-- Get the current state of the  Workflow Instance.
--
--begin
--    return apex_workflow.get_workflow_state(
--              p_instance_id => 1234);
--end;
--==============================================================================
function get_workflow_state(
    p_instance_id            in number)
return t_workflow_state;

--=================================================================================
-- Get the string value of a workflow variable. If the workflow variable has a format
-- mask set, the same format mask will be applied to value being returned.
-- If the workflow variable is of CLOB data type and the data length > varchar2 max length
-- then an exception will be thrown if p_raise is set to true.
--
-- Since: 23.2
--
-- Parameters:
-- * p_instance_id           ID of the Workflow
-- * p_variable_static_id    Static ID of the variable
-- * p_raise                 Raise exception if CLOB data exceeds max length of varchar2. Default false.
--
-- Returns:
-- varchar2
--
-- Example:
-- Below example returns the value of Workflow Variable called NEW_SALARY.
--
--begin
--    apex_workflow.get_variable_value(
--           p_instance_id => 1234,
--           p_variable_static_id => 'NEW_SALARY');
--end;
--==============================================================================
function get_variable_value(
    p_instance_id            in number,
    p_variable_static_id     in varchar2,
    p_raise                  in boolean     default false)
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
--
-- Example:
-- Below example returns the value of Workflow Variable called REST_RESPONSE.
--
--begin
--    apex_workflow.get_variable_clob_value(
--           p_instance_id => 1234,
--           p_variable_static_id => 'REST_RESPONSE');
--end;
--==============================================================================
function get_variable_clob_value(
    p_instance_id            in number,
    p_variable_static_id     in varchar2)
return clob;

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
--
-- Example:
-- ~~~
-- declare
--     l_is_owner boolean;
-- begin
--     l_is_owner := apex_workflow.is_of_participant_type(
--         p_instance_id      => 1234,
--         p_participant_type => apex_workflow.c_workflow_owner,
--         p_user             => 'STIGER'
--     );
--     if l_is_owner then
--         dbms_output.put_line('STIGER is an owner for workflow 1234');
--     end if;
-- end;
-- ~~~
--==============================================================================
function is_of_participant_type(
    p_instance_id            in number,
    p_participant_type       in t_workflow_participant_type,
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
--         p_instance_id     => 1234,
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
-- Example:
-- ~~~
--
-- begin
--     apex_workflow.refresh_participants(
--         p_instance_id         => 1234
--     );
-- end;
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
--
-- Example:
-- ~~~
-- declare
--     l_is_business_admin boolean;
-- begin
--     l_is_admin := apex_workflow.is_admin(
--         p_user => 'STIGER'
--     );
--     if l_is_admin then
--         dbms_output.put_line('STIGER is a Business Administrator');
--     end if;
-- end;
-- ~~~
--==============================================================================
function is_admin(
    p_user           in varchar2 default wwv_flow_security.g_user,
    p_application_id in number   default null)
return boolean;

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
-- A table of workflows (type apex_t_workflow_instances)
--
-- Example:
-- ~~~
-- select *
--   from table ( apex_workflow.get_workflows (
--                    p_context => 'MY_WORKFLOWS' ) )
-- ~~~
--==============================================================================
function get_workflows (
    p_context            in varchar2 default wwv_flow_workflow_api.c_context_my_workflows,
    p_user               in varchar2 default wwv_flow_security.g_user,
    p_workflow_id        in number   default null,
    p_application_id     in number   default null )
return wwv_flow_t_workflow_instances pipelined;

--==============================================================================
-- Get the list of value data for the workflow instance attribute state.
--
-- Since: 23.2
--
-- Return:
-- A table of apex_t_temp_lov_data
--
-- Example:
-- ~~~
-- select disp,
--        val
--   from table ( apex_workflow.get_lov_workflow_state )
-- ~~~
--==============================================================================
function get_lov_workflow_state
return wwv_flow_t_temp_lov_data;

--==============================================================================
-- Get the list of value data for the workflow instance attribute state.
--
-- Since: 23.2
--
-- Return:
-- A table of apex_t_temp_lov_data
--
-- Example:
-- ~~~
-- select disp,
--        val
--   from table ( apex_workflow.get_lov_activity_state )
-- ~~~
--==============================================================================
function get_lov_activity_state
return wwv_flow_t_temp_lov_data;

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

end wwv_flow_workflow_api;
/
show err

set define '^'
