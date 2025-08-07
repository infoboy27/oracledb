set define '^' verify off
prompt ...wwv_flow_approval
create or replace package wwv_flow_approval as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2022, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_approval.sql
--
--    DESCRIPTION
--      Oracle APEX Approvals Component.
--
--    SECURITY
--
--    NOTES:
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      ralmuell   08/30/2021 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Data Types.
--==============================================================================

subtype t_task_state         is wwv_flow_tasks$.state%type;

--------------------------------------------------------------------------------
-- Task Participant Definition
--------------------------------------------------------------------------------
type t_task_def_participant is record (
    type                     wwv_flow_task_def_participants.participant_type%type,
    identity                 wwv_flow_task_def_participants.identity_type%type,
    value_type               wwv_flow_task_def_participants.value_type%type,
    value_language           wwv_flow_task_def_participants.value_language%type,
    value                    wwv_flow_task_def_participants.value%type);

--------------------------------------------------------------------------------
-- Collection of Task Participant Definitions
--------------------------------------------------------------------------------
type t_task_def_participants is table of t_task_def_participant
    index by pls_integer;

--------------------------------------------------------------------------------
-- Task Parameter Definition
--------------------------------------------------------------------------------
type t_task_def_parameter is record (
    id                       wwv_flow_task_def_params.id%type,
    static_id                wwv_flow_task_def_params.static_id%type,
    data_type                wwv_flow_task_def_params.data_type%type,
    is_required              wwv_flow_task_def_params.is_required%type,
    is_updatable             wwv_flow_task_def_params.is_updatable%type);

--------------------------------------------------------------------------------
-- Collection of Task Parameter Definitions
--------------------------------------------------------------------------------
type t_task_def_parameters is table of t_task_def_parameter
    index by pls_integer;

--------------------------------------------------------------------------------
-- Task Action Definition
--------------------------------------------------------------------------------
type t_task_def_action is record (
    on_event                 wwv_flow_task_def_actions.on_event%type,
    outcome                  wwv_flow_task_def_actions.outcome%type,
    action_type              wwv_flow_task_def_actions.action_type%type,
    action_language          wwv_flow_task_def_actions.action_clob_language%type,
    action                   wwv_flow_task_def_actions.action_clob%type);

--------------------------------------------------------------------------------
-- Collection of Task Action Definitions
--------------------------------------------------------------------------------
type t_task_def_actions is table of t_task_def_action index by pls_integer;

--------------------------------------------------------------------------------
-- Task Definition
--------------------------------------------------------------------------------
type t_task_def is record (
    subject                  wwv_flow_task_defs.subject%type,
    priority                 wwv_flow_task_defs.priority%type,
    due_on                   wwv_flow_task_defs.due_on_interval%type,
    participants             t_task_def_participants,
    actions                  t_task_def_actions);

--==============================================================================
-- Constants
--==============================================================================
--------------------------------------------------------------------------------
-- Task Result.
--------------------------------------------------------------------------------
c_task_result_outcome        constant varchar2(13)         := '_TASK_OUTCOME';
c_task_result_owner          constant varchar2(9)          := '_APPROVER';

--==============================================================================
-- Expires Tasks.
--
-- This procedure is responsible for the following
-- (1.) Execute a Task BEFORE_EXPIRE actions. Those actions can be
--      configured on the Task Definition level.
--
-- (2.) Execute a Task Expiration Policy for Tasks that are Expired
--      A task is considered expired when the task due date is less than the
--      current date. As part of this, any 'Expire' actions for a Task are also
--      executed.
--
-- The procedure will be executed by a DBMS_SCHEDULER job, see wwv_flow_upgrade
--==============================================================================
procedure expire_tasks(p_security_group_id in number default null);

--==============================================================================
-- Execure EXPIRE Actions and apply Expiration Policy.
--
-- This procedure is scheduled by DBMS_SCHEDULER as a job to execute 'EXPIRE'
-- actions for a Task and apply the Expiration Policy.
-- (1.) If the Task has 'EXPIRE' Actions configured, then those actions are
--      performed. Eventually, the task is set to error state if the action(s)
--      errored and the task is configured to move into error state.
-- (2.) Apply the Expiration Policy for the Task.
--
-- Parameters:
-- * p_security_group_id     The company id of the task
-- * p_flow_id               The application id of the task to expire
-- * p_task_id               The task id
-- * p_expiration_policy     The expiration policy of the task
-- * p_max_renewal_count     The maximum renewal count of the task
--==============================================================================
procedure expire_policy_job(
    p_security_group_id in number,
    p_flow_id           in number,
    p_task_id           in number,
    p_expiration_policy in varchar2,
    p_max_renewal_count in number);


--==============================================================================
-- Execute BEFORE_EXPIRE actions.
--
-- This procedure is scheduled by DBMS_SCHEDULER as a job to execute 'BEFORE_EXPIRE'
-- actions for a Task.
--
-- Parameters:
-- * p_security_group_id     The company id of the task
-- * p_flow_id               The application id of the task
-- * p_task_id               The task id for which to execute the BEFORE_EXPIRE
--                           actions.
--==============================================================================
procedure before_expire_job(
    p_security_group_id in number,
    p_flow_id           in number,
    p_task_id           in number);

--==============================================================================
-- find a task definition ID by its static ID
--
-- Parameters:
-- * p_application_id        ID of the application which contains the
--                           task definition
-- * p_static_id             ID of the task definition (varchar2)
--
-- Returns:
-- * the ID of the task definition
--==============================================================================
function get_task_def_id(
    p_application_id      in number,
    p_static_id           in varchar2)
return number;

--==============================================================================
-- compute component values for task definition parameters and return the name-value pairs as
-- wwv_flow_approvals_api.t_parameter_values array
--
-- PARAMETERS:
-- * p_component_type  The component type (page process, workflow activity, automation action etc)
-- * p_component_id    The ID of the component type
-- * p_task_def_id     The task definition ID to fetch parameters for
-- RETURNS:
--   fetched task parameters for the given component
--==============================================================================
function get_task_comp_parameters (
    p_component_type         in varchar2,
    p_component_id           in number,
    p_task_def_id            in number)
return wwv_flow_approval_api.t_task_parameters;

--==============================================================================
-- Create a new task. A new Task (Instance) is created. Depending on the task
-- definition participant setting, the Task is set to state Unassigned or Assigned.
--
-- Parameters:
-- * p_application_id          The application ID that creates the Task
-- * p_task_def_id             The Task Definition ID.
-- * p_subject                 The subject (expression of the Task
-- * p_parameters              The task parameters
-- * p_priority                A (optional) task priority, default is 3
-- * p_initiator:              A (optional) initiator information for the task
-- * p_initiator_can_complete: (Optional) Can the Initiator of a task complete the task,default NULL.
--                              If this parameter is not specified, the value of the corresponding
--                              task definition will be used
-- * p_detail_pk:               Primary key value of the system of records for the task
-- * p_previous_task_id:        A potential previous task id for Renewed Tasks.
-- * p_renewal_count:           A counter on how often the task has been renewed
-- * p_due_date:                An (optional) due date value for the task
-- * p_workflow_id:             A (optional) workflow instance id if the task is created as
--                              part of a workflow activity
-- * p_wf_activity_id:          A (optional) workflow activity instance id if the task is created
--                             as part of a workflow activity
--
-- Returns:
-- Returns the ID of the newly created task.
--
-- Since:
-- 22.1
--==============================================================================
function create_task(
    p_application_id         in number                   default wwv_flow.g_flow_id,
    p_task_def_id            in number,
    p_subject                in varchar2                 default null,
    p_parameters             in wwv_flow_approval_api.t_task_parameters,
    p_priority               in integer                  default null,
    p_initiator              in varchar2                 default null,
    p_initiator_can_complete in boolean                  default null,
    p_detail_pk              in varchar2                 default null,
    p_previous_task_id       in number                   default null,
    p_renewal_count          in number                   default null,
    p_due_date               in timestamp with time zone default null,
    p_workflow_id            in number                   default null,
    p_wf_activity_id         in number                   default null)
return number;

--==============================================================================
-- Add a comment to a task.
--
-- Parameters:
-- * p_task_id: The Task Id.
-- * p_text:    The comment text
--
-- Since:
-- 22.1
--==============================================================================
procedure add_task_comment(
    p_task_id                in number,
    p_text                   in varchar2);

--==============================================================================
-- Add a potential owner to a task.
--
-- Parameters:
-- * p_task_id:         The Task Id.
-- * p_potential_owner: The potential owner
-- * p_identity_type:   The identity type of the potential owner, default is
--                      'USER'
--
-- Since:
-- 22.1
--==============================================================================
procedure add_task_potential_owner(
    p_task_id                in number,
    p_potential_owner        in varchar2,
    p_identity_type          in wwv_flow_approval_api.t_task_identity_type
                                default wwv_flow_approval_api.c_task_identity_type_user);

--==============================================================================
-- Remove a potential owner of a task.
-- Raise exception when the user to be removed is not an existing potential owner.
-- Since: 23.2
--
-- Parameters:
-- * p_task_id:         The Task Id.
-- * p_potential_owner: The potential owner
--
-- Example:
-- Remove user STIGER as potential owner for Task Id 1234
-- ~~~
-- begin
--     apex_approval.remove_potential_owner(
--         p_task_id         => 1234,
--         p_potential_owner => 'STIGER'
--     );
-- end;
-- ~~~
--==============================================================================
procedure remove_potential_owner(
    p_task_id                in number,
    p_potential_owner        in varchar2);

--==============================================================================
-- Complete a task.
--
-- Parameters:
-- * p_task_id               The Task Id.
-- * p_outcome               The outcome of the Task
--
-- # State Handling
-- Pre-State: ASSIGNED
-- Post-State: COMPLETED
--
-- Since:
-- 22.1
--==============================================================================
procedure complete_task(
    p_task_id                in number,
    p_outcome                in wwv_flow_approval_api.t_task_outcome default null,
    p_autoclaim              in boolean default false);

--==============================================================================
-- Assign the task to one Potential Owner and set the task state to Assigned.
--
-- Parameters:
-- * p_task_id:     The Task Id.
-- * p_to_potential_owner: A new potential owner
--
-- # State Handling
-- Pre-State: UNASIGNED, ASIGNED
-- Post-State: ASIGNED
--
-- Since:
-- 22.1
--==============================================================================
procedure delegate_task(
    p_task_id                in number,
    p_to_user                in varchar2);

--==============================================================================
-- Renew a Task.
-- Tasks that have been transitioned to state 'EXPIRED' can be renewed by a
-- Business Administrator. By renewing a Task, a new Task will be created with
-- given the information from the given Task Id. The re-newed task will be
-- associated to the Expired Task so that a user can trace back the origin of
-- the Task.
--
-- Parameters:
-- * p_task_id:            The Task Id.
-- * p_priority:           The priority of the renewed Task
-- * p_due_date:           The due date for the renewed Task
--
-- # State Handling
-- Pre-State: EXPIRED
-- Post-State: ASSIGNED, UNASSIGNED
--
-- Since: 22.2
--==============================================================================
function renew_task(
    p_task_id                in number,
    p_priority               in integer default null,
    p_due_date               in timestamp with time zone)
return number;

--==============================================================================
-- Cancel the task, i.e. set the task to state 'CANCELLED'.
--
-- Parameters:
-- * p_task_id: The Task Id.
--
-- # State Handling
-- Pre-State: <Any>
-- Post-State: CANCELLED
--
-- Since:
-- 22.1
--=============================================================================
procedure cancel_task(
    p_task_id                in number);

--==============================================================================
-- Release the task, i.e. set the task back to state Unassigned.
--
-- Parameters:
-- * p_task_id: The Task Id.
--
-- # State Handling
-- Pre-State: ASIGNED
-- Post-State: UNASIGNED
--
-- Since:
-- 22.1
--=============================================================================
procedure release_task(
    p_task_id                in number);

--==============================================================================
-- Claim responsibility for a task.
--
-- Parameters:
-- * p_task_id: The Task Id.
--
-- # State Handling
-- Pre-State: UNASIGNED
-- Post-State: ASIGNED
--
-- Since:
-- 22.1
--==============================================================================
procedure claim_task(
    p_task_id                in number);

--==============================================================================
-- Set the priority of a task.
--
-- Parameters:
-- * p_task_id:  The Task Id.
-- * p_priority: The task priority (between 0..10)
--
-- Since:
-- 22.1
--==============================================================================
procedure set_task_priority(
    p_task_id                in number,
    p_priority               in integer);

--==============================================================================
-- Request information for a task.
--
-- Parameters:
-- * p_task_id: The Task Id.
-- * p_text:    Text describing the information requested
--
-- Since:
-- 22.2
--==============================================================================
procedure request_info(
    p_task_id                in number,
    p_text                   in varchar2);
--==============================================================================
-- Submit information for a task.
--
-- Parameters:
-- * p_task_id: The Task Id.
-- * p_text:    Text containing the information submitted
--
-- Since:
-- 22.2
--==============================================================================
procedure submit_info(
    p_task_id                in number,
    p_text                   in varchar2);
--==============================================================================
-- Set the due date of a task.
--
-- Parameters:
-- * p_task_id:  The Task Id.
-- * p_priority: The task due date
--
-- Since:
-- 22.2
--==============================================================================
procedure set_task_due_date(
    p_task_id                in number,
    p_due_date               in timestamp with time zone);

--==============================================================================
-- Get the value of a Task parameter.
--
-- Parameters:
-- * p_task_id:         The Task Id.
-- * p_param_static_id  The static id of the parameter
--
-- Returns:
-- The task parameter value for the given static id.
--
-- Since:
-- 22.1
--==============================================================================
function get_task_parameter_value(
    p_task_id                in number,
    p_param_static_id        in varchar2,
    p_ignore_not_found       in boolean default false)
return varchar2;

--==============================================================================
-- Update the parameter(s) of this task
-- Since: 23.2
--
-- Parameters:
-- * p_task_id:       The Task Id.
-- * p_parameters:    The list of changed parameters.
-- * p_raise_error:   If true, then an exception will be raised if the
--                    parameter is not found or is not updatable.
-- Example:
-- ~~~
-- begin
--     apex_approval.set_task_parameter_values(
--         p_task_id            => 1234,
--         p_parameters         => apex_approval.t_task_parameters(
--             1 => apex_approval.t_task_parameter(static_id => 'REQ_DATE', string_value => sysdate+10),
--             3 => apex_approval.t_task_parameter(static_id => 'REQ_AMOUNT', string_value => l_req_amount));
-- end;
-- ~~~
--==============================================================================
procedure set_task_parameter_values(
    p_task_id                in number,
    p_parameters             in wwv_flow_approval_api.t_task_parameters,
    p_raise_error            in boolean);

--==================================================================================
-- Check if the value of this task paramter has been modified in the current session
-- Return null when the parameter does not exist.
-- Since: 23.2
--
-- Parameters:
-- * p_task_id:         The Task Id.
-- * p_param_static_id: The static Id of the parameter
--
-- Example:
-- ~~~
-- begin
--     return apex_approval.has_task_param_changed(
--                              p_task_id         => 1234,
--                              p_param_static_id => 'REQ_AMOUNT'
--     );
-- end;
-- ~~~
--==============================================================================
function has_task_param_changed(
             p_task_id                in number,
             p_param_static_id        in varchar2)
return boolean;

--======================================================================================
-- Get the old value of a parameter of this task that was modified in the current session
-- Raise No Data Found if the parameter does not exist
-- and p_raise_error flag is set to true
-- Since: 23.2
--
-- Parameters:
-- * p_task_id:            The Task Id.
-- * p_param_static_id:    The static Id of the parameter.
-- * p_raise_error:        Flag indicating whether exception should be raised
--                         if the parameter is not found.
-- Returns:
--
-- Example:
-- ~~~
-- begin
--     return apex_approval.get_task_parameter_old_value(
--                p_task_id            => 1234,
--                p_param_static_id    => 'REQ_AMOUNT');
-- end;
-- ~~~
--==============================================================================
function get_task_parameter_old_value(
    p_task_id                in number,
    p_param_static_id        in varchar2,
    p_raise_error            in boolean   default true)
return varchar2;
--==============================================================================
-- Checks whether the given user is of a certain participant type for a Task.
--
-- Parameters:
-- * p_task_id:          The Task Id.
-- * p_participant_type: The participant type. Default is POTENTIAL_OWNER
-- * p_user:             The user to check for. Default is the current user.
--
-- Returns:
-- true, if the user given by p_user is a participant of given participant
-- type for a given task, false otherwise
--
-- Since:
-- 22.1
--==============================================================================
function is_of_participant_type(
    p_task_id                in number,
    p_participant_type       in wwv_flow_approval_api.t_task_participant_type
                                default wwv_flow_approval_api.c_task_potential_owner,
    p_user                   in varchar2
                                default wwv_flow_security.g_user)
return boolean;

--==============================================================================
-- Checks whether the given user is allowed to perform a certain operation on
-- a Task.
--
-- Parameters:
-- * p_task_id:           The Task Id.
-- * p_operation:         The operation to check (see constants c_task_op_<XXX>)
-- * p_user:              The user to check for.
--
-- Returns:
-- true, if the user given by p_user is allowed to perform the operation
-- given by p_operation, false otherwise
--
-- Since:
-- 22.1
--==============================================================================
function is_allowed(
    p_task_id                in number,
    p_operation              in wwv_flow_approval_api.t_task_operation,
    p_user                   in varchar2
                                default wwv_flow_security.g_user,
    p_new_participant        in varchar2 default null)
return boolean;

--==============================================================================
-- Checks whether the given user is a business administrator for at least one
-- task definition.
--
-- Parameters:
-- * p_user:              The user to check for. Default is logged in user
-- * p_application_id:    The application to check for. Default behavior
--                        checks against all applications in the workspace.
--
-- Returns:
-- true, if the user given by p_user is at least in on task definition configured
-- as participant type BUSINESS_ADMIN, false otherwise
--
-- Since:
-- 22.1
--==============================================================================
function is_business_admin(
    p_user in varchar2 default wwv_flow_security.g_user,
    p_application_id in number   default null)
return boolean;

--==============================================================================
-- This procedure adds a log entry into the task history and is to be used
-- within task action code.
--
-- Parameters:
-- * p_message: Message to add into to the task history .
--
--
-- Since:
-- 22.2
--==============================================================================
procedure add_action_to_history (
    p_message in varchar2 );

--==============================================================================
-- This procedure handles Task Deadlines for all Tasks in the current Workspace.
-- In Oracle APEX 22.2, there is a background Job that performs this work every
-- hour. Developers can use this API for testing of Task Expiration Policies and
-- 'Before Expire' and 'Expire' Task Actions.
--
-- Since:
-- 22.2
--==============================================================================
procedure handle_task_deadlines;

--==============================================================================
-- Get the tasks of a user depending on the given context. Context can be
-- MY_TASKS, ADMIN_TASKS, INITIATED_BY_ME or SINGLE_TASK.
--
-- Note: The function will only return data in the context of a valid APEX
-- session. It will return no data in SQL Workshop.
--
-- Since: 22.1
--
-- Parameters:
-- * p_context:              The list context. Default is MY_TASKS.
-- * p_user:                 The user to check for. Default is logged in user.
--                           Needs p_context set to MY_TASKS, ADMIN_TASKS or INITIATED_BY_ME.
-- * p_task_id:              Filter for a task ID instead of a user. Default is null.
--                           Needs p_context set to SINGLE_TASK.
-- * p_application_id:       Filter for an application. Default is null (all applications)
--
-- Return:
-- sys_refcursor
--==============================================================================
function get_tasks (
    p_context            in varchar2 default wwv_flow_approval_api.c_context_my_tasks,
    p_user               in varchar2 default wwv_flow_security.g_user,
    p_task_id            in number   default null,
    p_application_id     in number   default null,
    p_show_expired_tasks in boolean  default false )
return sys_refcursor;

--==============================================================================
--  Updates the initiator can complete attribute of a task. 

-- Parameters:
-- * p_task_id:                The Task ID.
-- * p_initiator_can_complete: true, if the initiator is allowed to also approve or reject the task,
--                             false otherwise.
-- Since: 24.1
--==============================================================================
procedure set_initiator_can_complete(
    p_task_id                 in number,
    p_initiator_can_complete  in boolean);
--==============================================================================
-- Get the approval log for a task.
--
-- Note: The function will only return data in the context of a valid APEX
-- session. It will return no data in SQL Workshop.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:     The task ID.
-- * p_include_all: If true, the history of all tasks linked to the task
--                  with given task ID is shown. In 22.2, this includes
--                  prior Tasks that have been expired.
--
-- Return:
-- sys_refcursor
--
-- Example:
-- ~~~
-- select *
--   from table ( apex_approval.get_task_history ( p_task_id     => 1234,
--                                                 p_include_all => true ) )
-- ~~~
--==============================================================================
function get_task_history (
    p_task_id     in number,
    p_include_all in boolean default false )
return sys_refcursor;

--==============================================================================
-- Get the potential new owners of a task.
-- The actual owner is excluded from the list.
--
-- Note: The function will only return data in the context of a valid APEX
-- session. It will return no data in SQL Workshop.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:  The task ID.
--
-- Return:
-- sys_refcursor
--==============================================================================
function get_task_delegates (
    p_task_id in number )
return sys_refcursor;

--==============================================================================
-- Get the potential new priorities of a task.
-- The actual priority is excluded from the list.
--
-- Note: The function will only return data in the context of a valid APEX
-- session. It will return no data in SQL Workshop.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:  The task ID.
--
-- Return:
-- wwv_flow_t_number
--==============================================================================
function get_task_priorities (
    p_task_id in number )
return sys_refcursor;

--==============================================================================
-- Implement the Human Task - Manage plugin.
-- This function is used from wwv_flow_process_native.plb and handles all operations
-- of the Human Task - Manage process plugin.
--
-- Since: 22.2
--
-- Parameters:
-- * p_process:  The Plugin process.
--
-- Return:
-- wwv_flow_plugin_api.t_process_exec_result
--==============================================================================
function manage_task(
    p_process in wwv_flow_plugin_api.t_process)
return wwv_flow_plugin_api.t_process_exec_result;

--==============================================================================
-- Implement the Execution of Human Task - Create plugin.
-- This function is used from wwv_flow_process_native.plb and Create a human task
-- based on the defined attributes in p_process.
--
-- Since: 22.2
--
-- Parameters:
-- * p_process:  The Plugin process.
--
-- Return:
-- wwv_flow_plugin_api.t_process_exec_result
--==============================================================================
function create_task(
    p_process in wwv_flow_plugin_api.t_process)
return wwv_flow_plugin_api.t_process_exec_result;

--==============================================================================
-- Implement the Completion of Human Task - Create plugin.
-- This function is used from wwv_flow_process_native.plb to complete a human task
-- created by a workflow based on the defined attributes in p_process.

--
-- Since: 22.2
--
-- Parameters:
-- * p_process:  The Plugin process.
-- * p_param  :   A record with
--               i) Key Value Map containing the Task Outcome and Approver on
--               completion of task.
--               ii) The status of the completed task - Success or Error
-- Return:
-- wwv_flow_plugin_api.t_process_complete_result
--==============================================================================
function complete_task (
    p_process                in wwv_flow_plugin_api.t_process,
    p_param                  in wwv_flow_plugin_api.t_process_complete_param)
    return wwv_flow_plugin_api.t_process_complete_result;


--==============================================================================
-- Get the timestamp of the next Purge run.
--
--
-- Example:
-- ~~~
-- declare
--     l_next_purge_job_ts timestamp with time zone;
-- begin
--     l_next_purge_job_ts := apex_approval.get_next_purge_timestamp();
-- end;
-- ~~~
--
--==============================================================================
function get_next_purge_timestamp
return timestamp with time zone;
--==============================================================================
-- Implement the Termination/Cancellation of Human Task - Create plugin.
-- This function is used from wwv_flow_process_native.plb to cancel a human task
-- created by a workflow based on the defined attributes in p_process.
--
--
-- Parameters:
-- * p_process:  The Plugin process.
--
-- Return:
-- wwv_flow_plugin_api.t_process_terminate_result
--==============================================================================
function cancel_task(
    p_process in wwv_flow_plugin_api.t_process)
    return wwv_flow_plugin_api.t_process_terminate_result;


end wwv_flow_approval;
/
show err

set define '^'
