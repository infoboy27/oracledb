set define '^' verify off
prompt ...wwv_flow_approval_api
create or replace package wwv_flow_approval_api authid current_user as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2022, 2024, Oracle and/or its affiliates.
--
--
-- The `APEX_APPROVAL` package provides APIs for the management of approvals and
-- Human Tasks. This package includes functionality to create new Human Tasks
-- for a user to approve as well as operations dealing with the lifecycle
-- management and state handling of Human Tasks. This package is part of the
-- Oracle APEX Workflow functionality.
--------------------------------------------------------------------------------


--==============================================================================
-- Data Types:
--
-- The `APEX_APPROVAL` package uses the following constants and data types:
--==============================================================================
--
--------------------------------------------------------------------------------
-- Task Definition Participant Types
--------------------------------------------------------------------------------
subtype t_task_participant_type is varchar2(15);
c_task_potential_owner constant t_task_participant_type := 'POTENTIAL_OWNER';
c_task_business_admin  constant t_task_participant_type := 'BUSINESS_ADMIN';
c_task_initiator       constant t_task_participant_type := 'INITIATOR'; 
--------------------------------------------------------------------------------
-- Collection of Task Participant Types
--------------------------------------------------------------------------------
type t_task_participant_types is table of t_task_participant_type index by pls_integer;
--------------------------------------------------------------------------------
-- Task Definition Participant Identity Types
--------------------------------------------------------------------------------
subtype t_task_identity_type is varchar2(32);
c_task_identity_type_user constant t_task_identity_type := 'USER';
--------------------------------------------------------------------------------
type t_task_participant is record (
    type                    varchar2(15),
    identity                varchar2(32),
    value                   varchar2(255));

--------------------------------------------------------------------------------
-- Collection of Task Participants
--------------------------------------------------------------------------------
type t_task_participants is table of t_task_participant index by pls_integer;

-- Task (Instance) outcomes
--------------------------------------------------------------------------------
subtype t_task_outcome is varchar2(32);
c_task_outcome_approved  constant t_task_outcome := 'APPROVED';
c_task_outcome_rejected  constant t_task_outcome := 'REJECTED';
--------------------------------------------------------------------------------
-- Task (Instance) states
--------------------------------------------------------------------------------
subtype t_task_state is varchar2(15);
c_task_state_unassigned     constant t_task_state := 'UNASSIGNED';
c_task_state_assigned       constant t_task_state := 'ASSIGNED';
c_task_state_completed      constant t_task_state := 'COMPLETED';
c_task_state_cancelled      constant t_task_state := 'CANCELLED';
c_task_state_failed         constant t_task_state := 'FAILED';
c_task_state_errored        constant t_task_state := 'ERRORED';
c_task_state_expired        constant t_task_state := 'EXPIRED';
c_task_state_info_requested constant t_task_state := 'INFO_REQUESTED';
--------------------------------------------------------------------------------
-- Task (Instance) operations
--------------------------------------------------------------------------------
subtype t_task_operation is varchar2(30);
c_task_op_approve            constant t_task_operation := 'APPROVE_TASK';
c_task_op_reject             constant t_task_operation := 'REJECT_TASK';
c_task_op_complete           constant t_task_operation := 'COMPLETE_TASK';
c_task_op_claim              constant t_task_operation := 'CLAIM_TASK';
c_task_op_delegate           constant t_task_operation := 'DELEGATE_TASK';
c_task_op_renew              constant t_task_operation := 'RENEW_TASK';
c_task_op_release            constant t_task_operation := 'RELEASE_TASK';
c_task_op_cancel             constant t_task_operation := 'CANCEL_TASK';
c_task_op_set_priority       constant t_task_operation := 'SET_TASK_PRIORITY';
c_task_op_add_comment        constant t_task_operation := 'ADD_TASK_COMMENT';
c_task_op_add_owner          constant t_task_operation := 'ADD_TASK_POTENTIAL_OWNER';
c_task_op_request_info       constant t_task_operation := 'REQUEST_INFO';
c_task_op_submit_info        constant t_task_operation := 'SUBMIT_INFO';
c_task_op_set_due_date       constant t_task_operation := 'SET_DUE_DATE';
c_task_op_remove_owner       constant t_task_operation := 'REMOVE_POTENTIAL_OWNER';
c_task_op_set_params         constant t_task_operation := 'SET_TASK_PARAMS';
c_task_op_initiator_can_comp constant t_task_operation := 'SET_INITIATOR_CAN_COMPLETE';
--------------------------------------------------------------------------------
--  Task List Context Types
--------------------------------------------------------------------------------
subtype t_task_list_context is varchar2(15);
c_context_my_tasks         constant t_task_list_context := 'MY_TASKS';
c_context_admin_tasks      constant t_task_list_context := 'ADMIN_TASKS';
c_context_initiated_by_me  constant t_task_list_context := 'INITIATED_BY_ME';
c_context_single_task      constant t_task_list_context := 'SINGLE_TASK';

--------------------------------------------------------------------------------
-- Task Types
--------------------------------------------------------------------------------
subtype t_task_type          is varchar2(32);
c_task_type_approval         constant t_task_type  := 'APPROVAL';
c_task_type_action           constant t_task_type  := 'ACTION';

--------------------------------------------------------------------------------
-- Task Parameter (Value)
--
-- Attributes:
-- * static_id :    The static ID of the parameter. This ID must match the
--                  static id of the corresponding parameter in the task
--                  definition.
-- * string_value:  The value of the parameter as a string.
--------------------------------------------------------------------------------
type t_task_parameter is record (
    static_id    varchar2(32767),
    string_value varchar2(32767)
);
--------------------------------------------------------------------------------
-- Collection of Task Parameter Values
--------------------------------------------------------------------------------
type t_task_parameters is table of t_task_parameter index by pls_integer;
c_empty_task_parameters constant t_task_parameters   :=  t_task_parameters(); -- Task parameters default

--------------------------------------------------------------------------------
-- Task Vacation Rules Input Record
--
-- Attributes:
-- * task_def_static_id:    The Static ID of the task definition
-- * task_id :              The  ID of the task instance.
-- * priority:              The task priority.
-- * original_participant:  The originial participant(s) of the task for whom
--                          the vacation rule is defined.
-- * parameters             The parameters of the task instance
-- * due_date               The due_date of the task instance
-- * detail_pk:             The Primary Key value of the system of records associated
--                          with this task instance.
--------------------------------------------------------------------------------
type t_vacation_rule_input is record (
    task_def_static_id    varchar2(255),
    task_id               number,
    priority              number,
    --
    -- pass in one or more participants for whom the vacation rules are defined.
    original_participants t_task_participants,
    parameters            t_task_parameters default c_empty_task_parameters,
    due_date              timestamp with time zone,
    detail_pk             varchar2(4000) );

--
-- define a new array with "participant change" information.
type t_task_participant_change is record(
    old_participant         t_task_participant,
    new_participant         t_task_participant,
    change_reason           varchar2(4000) );
--------------------------------------------------------------------------------
-- Collection of Task Parcticipant Change Information
--------------------------------------------------------------------------------
type t_task_participant_changes is table of t_task_participant_change index by pls_integer;

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Task Vacation Rules Output Record
--
-- Attributes:
-- * has_participant_changes :   True if alternate participant(s) exist for at least
--                               one of the original task participants, False otherwise.
-- * participant_changes:        An array of the task participant change information.
--------------------------------------------------------------------------------
type t_vacation_rule_result is record (
    has_participant_changes  boolean    default false,
    participant_changes      t_task_participant_changes );

--
-- Constants:
--
-- The following constants are used by the `APEX_APPROVAL` package.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Task (Instance) Priority constants
--------------------------------------------------------------------------------
-- Task (Instance) Priority constant
c_task_priority_lowest       constant integer := 5;
-- Task (Instance) Priority constant
c_task_priority_low          constant integer := 4;
-- Task (Instance) Priority constant
c_task_priority_medium       constant integer := 3;
-- Task (Instance) Priority constant
c_task_priority_high         constant integer := 2;
-- Task (Instance) Priority constant
c_task_priority_urgent       constant integer := 1;


-- Task (Instance) date formats
c_canonical_date_format      constant varchar2(16)     := 'YYYYMMDDHH24MISS';

--------------------------------------------------------------------------------
-- Task Participants related constants.
--------------------------------------------------------------------------------
c_task_participants_default constant t_task_participants := t_task_participants();
--------------------------------------------------------------------------------
-- Global variables
/* Note: for internal use only */
--------------------------------------------------------------------------------
g_vacation_rule_input             t_vacation_rule_input;
g_vacation_rule_result            t_vacation_rule_result;

--==============================================================================
-- This functions creates a new task. A new Task (Instance) is created. Depending on the task
-- definition participant setting, the Task is set to state `Unassigned` or `Assigned`.
-- If the task definition has a single potential owner, the Task is set to Assigned.
-- If the task has multiple potential owners, the Task is set to Unassigned and can
-- be claimed by any of the potential owners.
--
--This procedure throws an exception if no potential owners are found in the
-- corresponding task definition.
--
-- Since: 22.1
--
-- Parameters:
-- * p_application_id:         The application ID that creates the Task.
-- * p_task_def_static_id:     The Task Definition static ID.
-- * p_subject:                The subject (expression of the Task).
-- * p_parameters:             The task parameters.
-- * p_priority:               (Optional) A task priority, default is NULL. If
--                             no priority is provided, uses the priority
--                             set in the corresponding task definition.
-- * p_initiator:              (Optional) An initiator information for the task.
-- * p_initiator_can_complete: (Optional) Can the Initiator of a task complete the task, default NULL.
--                              If this parameter is not specified, the value of the corresponding
--                              task definition will be used.
-- * p_detail_pk:               (Optional) A primary key value for the task details.
-- * p_due_date:                (Optional)  Page Item representing the Due Date of the Task.
--                              When specified, this value overrides the Due Date provided
--                              in the Task Definition this Task is based on.
--
-- Returns:
-- Returns the ID of the newly created task.
--
-- Example:
-- Below example creates a requisition item in the system of record in the database and then
-- creates a new Human Task to get the requisition item approved by a user.
-- ~~~
-- declare
--    l_req_id     number;
--    l_req_item   varchar2(100) := 'Some requisition item requiring approval';
--    l_req_amount number := 2499.42;
--    l_task_id    number;
-- begin
--     insert into requisitions(created_by, creator_emailid, item, item_amount, item_category)
--     values (:emp_uid, :emp_email, l_req_item, l_req_amount, 'Equipment')
--     returning id into l_req_id;
--     commit;
--
--     l_task_id := apex_approval.create_task(
--         p_application_id => 110,
--         p_task_def_static_id => 'REQAPPROVALS',
--         p_subject => 'Requisition ' || l_req_id || ': ' || l_req_item || ' for ' || l_req_amount,
--         p_initiator => :emp_uid,
--         p_initiator_can_complete => true,
--         p_parameters => apex_approval.t_task_parameters(
--             1 => apex_approval.t_task_parameter(static_id => 'REQ_DATE', string_value => sysdate),
--             3 => apex_approval.t_task_parameter(static_id => 'REQ_AMOUNT', string_value => l_req_amount),
--             4 => apex_approval.t_task_parameter(static_id => 'REQ_ITEM', string_value => l_req_item),
--             5 => apex_approval.t_task_parameter(static_id => 'REQ_ID', string_value => l_req_id)
--         ),
--         p_detail_pk => l_req_id
--     );
-- end;
-- ~~~
--==============================================================================
function create_task(
    p_application_id         in number                   default wwv_flow.g_flow_id,
    p_task_def_static_id     in varchar2,
    p_subject                in varchar2                 default null,
    p_parameters             in t_task_parameters        default c_empty_task_parameters,
    p_priority               in integer                  default null,
    p_initiator              in varchar2                 default null,
    p_initiator_can_complete in boolean                  default null,
    p_detail_pk              in varchar2                 default null,
    p_due_date               in timestamp with time zone default null)
return number;

--==============================================================================
-- This procedure adds a comment to a task. Any potential owner or business administrator of
-- a Task can add comments to a Task. Comments are useful as additional
-- information regarding a Task. For example, a manager might add her notes
-- to a Task she's working on before delegating the Task.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id: The Task Id.
-- * p_text:    The comment text.
--
-- Example:
-- ~~~
-- begin
--     add_task_comment(
--         p_task_id => 1234,
--         p_text    => 'Please review and approve'
--     );
-- end;
-- ~~~
--
--==============================================================================
procedure add_task_comment(
    p_task_id                in number,
    p_text                   in varchar2);

--==============================================================================
-- This procedure adds a new potential owner to a task. Only a Business Administrator
-- for the task can invoke this procedure.
-- The procedure throws an error if the task is in `Completed` or `Errored` state.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:         The Task ID.
-- * p_potential_owner: The potential owner.
-- * p_identity_type:   The identity type of the potential owner, default is
--                      'USER'.
-- Note: As of this release, the only supported identity type is USER.
-- Additional options will be added in a future release.
--
-- Example:
-- Add user 'STIGER' as potential owner for Task ID '1234'.
-- ~~~
-- begin
--     apex_approval.add_task_potential_owner(
--         p_task_id         => 1234,
--         p_potential_owner => 'STIGER'
--     );
-- end;
-- ~~~
--==============================================================================
procedure add_task_potential_owner(
    p_task_id                in number,
    p_potential_owner        in varchar2,
    p_identity_type          in t_task_identity_type default c_task_identity_type_user);

--==============================================================================
-- This procedure removes a potential owner of a task.
-- An exception is raised, when the user to be removed is not an existing potential owner.
-- Since: 23.2
--
-- Parameters:
-- * p_task_id:         The Task ID.
-- * p_potential_owner: The potential owner.
--
-- Example:
-- Remove user 'STIGER' as potential owner for Task ID '1234'.
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
-- Claim responsibility for a task. A task can be claimed by potential owners
-- of the Task. A Task must be in `Unassigned` state to claim it. Once the task is
-- claimed by a user, the Task transitions to `Assigned` state and the actual
-- owner of the task is set to the user who claimed the task.
--
-- Since: 22.1
--
-- ### State Handling
-- + Pre-State: UNASSIGNED
-- + Post-State: ASSIGNED
--
--
-- Parameters:
-- * p_task_id: The Task ID.
--
--
-- Example:
-- ~~~
-- begin
--     apex_approval.claim_task(
--         p_task_id => 1234
--     );
-- end;
-- ~~~
--==============================================================================
procedure claim_task(
    p_task_id                in number);

--==============================================================================
-- Complete a task with an optional outcome. Tasks in Assigned state might be completed
-- with an outcome. This operation transitions the Task from Assigned state to
-- Completed state.  If the task is an Approval Task, an outcome for the task is also set.
-- Once a Task is in Completed state, it is subject for purging and archival.
--
-- Since: 22.1
--
-- ### State Handling
-- + Pre-State:  ASSIGNED or UNASSIGNED (p_autoclaim=true)
-- + Post-State: COMPLETED
--
-- Parameters:
-- * p_task_id:      The Task ID.
-- * p_outcome:      The outcome of the Task (for Approval Tasks).
-- * p_autoclaim:    If Task is in state `UNASSIGNED`, then claim the task implicitly.
--
--
-- Example:
-- ~~~
-- begin
--     apex_approval.complete_task(
--         p_task_id => 1234,
--         p_outcome => apex_approval.c_task_outcome_approved
--     );
-- end;
-- ~~~
-- See also:
-- APPROVE_TASK
-- REJECT_TASK
--==============================================================================
procedure complete_task(
    p_task_id                in number,
    p_outcome                in t_task_outcome default null,
    p_autoclaim              in boolean default false );

--==============================================================================
-- This procedure approves a Task. Only the potential owner or actual owner of
-- the task can invoke this procedure. This procedure moves the state of the Task
-- to `Completed` and sets the outcome of the Task to `Approved`. This is a
-- convenience procedure and equivalent to calling `APEX_APPROVAL.COMPLETE_TASK` with
-- the outcome `apex_approval.c_task_outcome_approved`.
--
-- Since: 22.1
--
-- ### State Handling
-- + Pre-State:  ASSIGNED or UNASSIGNED (p_autoclaim=true)
-- + Post-State: COMPLETED
--
-- Parameters:
-- * p_task_id: The Task Id.
-- * p_autoclaim: If Task is in state `UNASSIGNED`, then claim the task implicitly.
--
--
-- Example:
-- ~~~
-- begin
--     apex_approval.approve_task(
--         p_task_id => 1234
--     );
-- end;
-- ~~~
-- See also:
-- COMPLETE_TASK
--==============================================================================
procedure approve_task(
    p_task_id                in number,
    p_autoclaim              in boolean default false );

--==============================================================================
-- This procedure rejects the task. Only a potential owner or the actual owner
-- of the task can invoke this procedure. Moves the state of the Task to `Completed`
-- and sets the outcome of the Task to `Rejected`. This is a convenience procedure
-- and equivalent to calling `APEX_APPROVAL.COMPLETE_TASK` with the outcome
-- `apex_approval.c_task_outcome_rejected`.
--
-- Since: 22.1
--
-- ### State Handling
-- + Pre-State:  ASSIGNED or UNASSIGNED (p_autoclaim=true)
-- + Post-State: COMPLETED
--
-- Parameters:
-- * p_task_id: The Task ID.
-- * p_autoclaim: If Task is in state `UNASSIGNED`, then claim the task implicitly.
--
--
-- Example:
-- ~~~
-- begin
--     apex_approval.reject_task(
--         p_task_id => 1234
--     );
-- end;
-- ~~~
-- See also:
-- COMPLETE_TASK
--==============================================================================
procedure reject_task(
    p_task_id                in number,
    p_autoclaim              in boolean default false );

--==============================================================================
-- This procedure assigns the task to one potential owner and sets the task state
-- to `Assigned`.
-- Either the current owner of the task (the user to whom the task is currently assigned)
-- or the Business Administrator of the task can perform this operation.
--
-- Since: 22.1
--
-- ### State Handling
-- + Pre-State: UNASSIGNED, ASSIGNED
-- + Post-State: ASSIGNED
--
-- Parameters:
-- * p_task_id:            The Task Id.
-- * p_to_user:    A (user) participant
--
-- Example:
-- ~~~
-- begin
--     apex_approval.delegate_task(
--         p_task_id            => 1234,
--         p_to_user            => 'STIGER'
--     );
-- end;
-- ~~~
--==============================================================================
procedure delegate_task(
    p_task_id                in number,
    p_to_user                in varchar2);

--==============================================================================
-- This function reactivates `Expired` or `Errored` Tasks.
-- Tasks that have been transitioned to state `EXPIRED` or `ERRORED` can be renewed
-- by a Business Administrator. By renewing a Task, a new Task will be created with
-- the given information from the given Task Id. The re-newed task will be
-- associated to the Expired Task, so that a user can trace back the origin of
-- the Task.
--
-- Since: 22.2
--
-- ### State Handling
-- + State of original Task: `EXPIRED`, `ERRORED`
-- + State of renewed Task:  `ASSIGNED, `UNASSIGNED`
--
-- Parameters:
-- * p_task_id:            The Task Id.
-- * p_priority:           The priority of the renewed Task
-- * p_due_date:           The due date for the renewed Task
--
-- Returns:
-- Returns the ID of the renewed task.
--
-- Example:
-- ~~~
-- begin
--     apex_approval.renew_task(
--         p_task_id            => 1234,
--         p_priority           => apex_approval.c_task_priority_high,
--         p_due_date           => sysdate + 10
--     );
-- end;
-- ~~~
-- See also:
-- Constants
--==============================================================================
function renew_task(
    p_task_id                in number,
    p_priority               in integer default null,
    p_due_date               in timestamp with time zone)
return number;

--==============================================================================
-- This functions gets the value of a Task parameter. It can be used in SQL or PL/SQL
-- to get the value of a Task parameter for a given task.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:          The Task ID.
-- * p_param_static_id:  The static ID of the parameter
-- * p_ignore_not_found: If set to false (default) and no data is found, a `no_data_found`
--                       exception will be raised. If set to true and no data is found,
--                       `null` will be returned.
--
-- Returns:
-- The Task parameter value for the given static id or `null`
--
-- Raises:
-- * NO_DATA_FOUND:  In the case where `p_ignore_not_found` is set to false and no data
--                   is being found (for example, if the parameter of the given name doesn't exist)
--
-- Example:
-- ~~~
-- declare
--     l_req_item varchar2(100);
-- begin
--     l_req_item := apex_approval.get_task_parameter_value(
--         p_task_id         => 1234,
--         p_param_static_id => 'REQ_ITEM'
--     );
--     dbms_output.put_line('Parameter REQ_ITEM of task 1234 has value ' || l_req_item);
-- end;
-- ~~~
--==============================================================================
function get_task_parameter_value(
    p_task_id                in number,
    p_param_static_id        in varchar2,
    p_ignore_not_found       in boolean default false)
return varchar2;

--==============================================================================
-- This procedure updates the parameter(s) of a Task.
-- Since: 23.2
--
-- Parameters:
-- * p_task_id:       The Task ID.
-- * p_parameters:    The list of changed parameters.
-- * p_raise_error:   When set to `FALSE`, the API will ignore any exceptions raised if
--                    the list contains one or more incorrect parameter static ids or parameters that are
--                    not marked as updatable in the Task Definition. The API will update the rest of the
--                    parameters. When set to `TRUE`, the API will raise an exception and none of the
--                    parameters will be updated. Default is `TRUE`.
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
    p_parameters             in t_task_parameters,
    p_raise_error            in boolean default true);


--=================================================================================
-- This function checks if the value of this Task Parameter has been modified in
-- the current session. Returns `NULL` if the parameter does not exist.
-- Since: 23.2
--
-- Parameters:
-- * p_task_id:         The Task ID.
-- * p_param_static_id: The static ID of the parameter
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

--=====================================================================================
-- This function gets the old value of a parameter of this task that was updated
-- in the current session.
--
-- Since: 23.2
--
-- Parameters:
-- * p_task_id:            The Task ID.
-- * p_param_static_id:    The static ID of the parameter.
-- * p_raise_error:        Flag indicating whether an exception should be raised
--                         if the parameter is not found.
-- Raises:
-- * NO_DATA_FOUND: If the parameter does not exist and p_raise_error flag is set to `TRUE`.
--
-- Example:
-- ~~~
-- begin
--     return apex_approval.get_task_parameter_old_value(
--                p_task_id            => 1234,
--                p_param_static_id    => 'REQ_AMOUNT',
--                p_raise_error        => false);
-- end;
-- ~~~
--==============================================================================
function get_task_parameter_old_value(
    p_task_id                in number,
    p_param_static_id        in varchar2,
    p_raise_error            in boolean   default true)
return varchar2;

--==============================================================================
-- This procedure cancels the Task by setting the Task to state 'CANCELLED'.
-- Only the Initiator or the Business Administrator of the Task can invoke this
-- procedure. Only tasks which are not in `COMPLETED` or `ERRORED` state can be
-- canceled.
-- Canceling a task is useful, when an approval is no longer required. For example,
-- consider a travel approval for a business trip and the person requesting the approval
-- is not feeling well and cannot make the trip. In such cases, a Task might be
-- canceled.
--
-- Since: 22.1
--
-- ### State Handling
-- + Pre-State: Any
-- + Post-State: `CANCELLED`
--
-- Parameters:
-- * p_task_id: The Task ID.
--
-- Example:
-- ~~~
-- begin
--     apex_approval.cancel_task(
--         p_task_id => 1234
--     );
-- end;
-- ~~~
--=============================================================================
procedure cancel_task(
    p_task_id                in number);

--==============================================================================
-- This procedure releases an Assigned task from its current owner and sets the task
-- to `UNASSIGNED` state. Only the current owner of the task can invoke this procedure.
--
-- Since: 22.1
--
-- ### State Handling
-- + Pre-State: ASSIGNED
-- + Post-State: UNASSIGNED
--
-- Parameters:
-- * p_task_id: The Task ID.
--
--
-- Example:
-- ~~~
-- begin
--     apex_approval.release_task(
--         p_task_id => 1234
--     );
-- end;
-- ~~~
--=============================================================================
procedure release_task(
    p_task_id                in number);

--==============================================================================
-- This procedure sets the priority of a task.
-- This procedure updates the priority of a task. The task can not be `COMPLETED` or
-- `ERRORED`. Only a user who is either a Business Administrator for the task or is
-- the Initiator of the task can invoke this procedure.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:  The Task ID.
-- * p_priority: The task priority (between 1 and 5, 1 being the highest).
--
-- Example:
-- ~~~
-- begin
--     apex_approval.set_task_priority(
--         p_task_id  => 1234,
--         p_priority => apex_approval.c_task_priority_highest
--     );
-- end;
-- ~~~
-- See also:
-- Constants
--==============================================================================
procedure set_task_priority(
    p_task_id                in number,
    p_priority               in integer);


--==============================================================================
-- This procedure requests more information for a task. The actual owner of a task can request
-- additional information regarding a Task from the Initiator.
-- For example, a travel approver might need the airlines details from the Initiator.
-- The Task then moves to the `INFO_REQUESTED` state and can be acted on by the Owner
-- only after the Initiator submits the requested information.
--
-- Since: 22.2
--
-- ### State Handling
-- + Pre-State: ASSIGNED
-- + Post-State: INFO_REQUESTED
--
-- Parameters:
-- * p_task_id: The Task ID.
-- * p_text:    Text describing the information requested.
--
-- Example:
-- ~~~
-- begin
--      apex_approval.request_more_information(
--         p_task_id => 1234,
--         p_text    => 'Please provide the flight PNR for your travel.'
--     );
-- end;
-- ~~~
--==============================================================================
procedure request_more_information(
    p_task_id                in number,
    p_text                   in varchar2);
--==============================================================================
-- This procedure submits information for a task. The Initiator of a Task can submit additional
-- information regarding a Task for which information has been requested.
-- For example, a travel approver might need the airlines details from the Initiator.
-- The Initiator can submit this information to the travel approver using this API.
--
-- Since: 22.2
--
-- ### State Handling
-- + Pre-State: INFO_REQUESTED
-- + Post-State: ASSIGNED
--
-- Parameters:
-- * p_task_id: The Task ID.
-- * p_text:    Text containing the information submitted.
--
-- Example:
-- ~~~
-- begin
--      apex_approval.submit_information(
--         p_task_id => 1234,
--         p_text    => 'The flight PNR is PN1234'
--     );
-- end;
-- ~~~
--==============================================================================
procedure submit_information(
    p_task_id                in number,
    p_text                   in varchar2);
--==============================================================================
-- This procedure sets the due date of a task and can be invoked by the Business
-- Administrator to update the due date of the task.
-- This API cannot be invoked for a task that is `EXPIRED`, `ERRORED`, `COMPLETED`
-- or `CANCELLED`.
-- The due date needs to be in the future, otherwise an exception is thrown when
-- invoking this API.
--
-- Since: 22.2
--
-- Parameters:
-- * p_task_id:  The Task ID.
-- * p_due_date: The new due date of the Task.
--
-- Example:
-- ~~~
-- begin
--     apex_approval.set_task_due(
--         p_task_id  => 1234,
--         p_due_date => sysdate+20
--     );
-- end;
-- ~~~
--==============================================================================
procedure set_task_due(
    p_task_id                in number,
    p_due_date               in timestamp with time zone);

--==============================================================================
-- This function checks whether the given user is of a certain participant type
-- for a Task.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:          The Task ID.
-- * p_participant_type: The participant type. Can be set to POTENTIAL_OWNER (default)
--                       or BUSINESS_ADMIN.
-- * p_user:             The user to check for. Default is the logged-in user.
--
-- Returns:
-- `TRUE`, if the user given by `p_user` is a participant of given participant
-- type for a given task, `FALSE` otherwise.
--
-- Example:
-- ~~~
-- declare
--     l_is_potential_owner boolean;
-- begin
--     l_is_potential_owner := apex_approval.is_of_participant_type(
--         p_task_id          => 1234,
--         p_participant_type => apex_approval.c_task_potential_owner,
--         p_user             => 'STIGER'
--     );
--     if l_is_potential_owner then
--         dbms_output.put_line('STIGER is a potential owner for task 1234');
--     end if;
-- end;
-- ~~~
--==============================================================================
function is_of_participant_type(
    p_task_id                in number,
    p_participant_type       in t_task_participant_type
                                default c_task_potential_owner,
    p_user                   in varchar2
                                default wwv_flow_security.g_user)
return boolean;

--==============================================================================
-- This function checks whether the given user is allowed to perform a certain operation on
-- a Task.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:           The Task ID.
-- * p_operation:         The operation to check (see constants c_task_op_<XXX>)
-- * p_user:              The user to check for. Default is the logged-in user.
-- * p_new_participant:   (Optional) The new assignee in case of an `DELEGATE_TASK`
--                        operation.
--
-- Returns:
-- `TRUE`, if the user given by `p_user` is allowed to perform the operation
-- given by `p_operation`, `FALSE` otherwise.
--
-- Example:
-- ~~~
-- declare
--     l_is_allowed boolean;
-- begin
--     l_is_allowed := apex_approval.is_allowed(
--         p_task_id         => 1234,
--         p_operation       => apex_approval.c_task_op_delegate
--         p_user            => 'STIGER',
--         p_new_participant => 'SMOON'
--     );
--     if l_is_allowed then
--         dbms_output.put_line('STIGER is a allowed to delegate the task to SMOON for task 1234');
--     end if;
-- end;
-- ~~~
--==============================================================================
function is_allowed(
    p_task_id                in number,
    p_operation              in wwv_flow_approval_api.t_task_operation,
    p_user                   in varchar2 default wwv_flow_security.g_user,
    p_new_participant        in varchar2 default null)
return boolean;

--==============================================================================
-- This function checks whether the given user is a Business Administrator for at
-- least one Task definition.
--
-- Since: 22.1
--
-- Parameters:
-- * p_user:              The user to check for. Default is the logged-in user.
-- * p_application_id:    The application to check for. Default behavior:
--                        checks against all applications in the workspace.
--
-- Returns:
-- `TRUE`, if the user given by `p_user` is at least in one task definition configured
-- as participant type `BUSINESS_ADMIN`, `FALSE` otherwise.
--
-- Example:
-- ~~~
-- declare
--     l_is_business_admin boolean;
-- begin
--     l_is_business_admin := apex_approval.is_business_admin(
--         p_user => 'STIGER'
--     );
--     if l_is_business_admin then
--         dbms_output.put_line('STIGER is a Business Administrator');
--     end if;
-- end;
-- ~~~
--==============================================================================
function is_business_admin(
    p_user           in varchar2 default wwv_flow_security.g_user,
    p_application_id in number   default null)
return boolean;

--==============================================================================
-- This procedure adds a log entry into the Task history and is to be used
-- within Task action code.
--
-- Parameters:
-- * p_message: Message to add into to the Task history.
--
-- Example:
--
-- This example writes some log information.
-- The task action uses `select * from emp` as the action source query.
--
-- ~~~
--   begin
--       apex_approval.add_to_history(
--           p_message => 'Approved leave for employee with empno: ' || :EMPNO );
--       my_logic_package.update_emp_leave_balance(
--           p_empno        => :EMPNO,
--           p_no_of_days   => :NO_OF_DAYS);
--   end;
-- ~~~
--==============================================================================
procedure add_to_history (
    p_message in varchar2 );

--==============================================================================
-- This procedure handles Task Deadlines for all Tasks in the current Workspace.
--! In Oracle APEX 22.2, there is a Background Job that performs this work every
--! hour.
-- A background Job performs this work every hour. Developers can use this API
-- for testing of Task Expiration Policies and 'Before Expire' and
-- 'Expire' Task Actions.
--
-- Example:
--
-- ~~~
--   begin
--       apex_approval.handle_task_deadlines
--   end;
-- ~~~
--==============================================================================
procedure handle_task_deadlines;

--==============================================================================
-- Get the Tasks of a user depending on the given context.
-- Context can be one of the following:
-- + `MY_TASKS` - Returns all Tasks of which the user calling the function is either
--                the Owner or one of the Potential Owners of the task.
-- + `ADMIN_TASKS` - Returns all Tasks for which the user calling the function is a
--                   Business Administrator.
-- + `INITIATED_BY_ME` - Returns all tasks where the user calling the function is the
--                       Initiator.
-- + `SINGLE_TASK` - Returns the task identified by the `p_task_id` input parameter.
--
-- Note: The function will only return data in the context of a valid APEX
-- session. It will not return any data in SQL Workshop.
--
-- Since: 22.1
--
-- Parameters:
-- * p_context:              The list context. Default is `MY_TASKS`.
-- * p_user:                 The user to check for. Default is the logged-in user.
--                           Needs `p_context` set to `MY_TASKS`, `ADMIN_TASKS` or
--                           `INITIATED_BY_ME`.
-- * p_task_id:              Filter for a Task ID instead of a user. Default is null.
--                           Needs p_context set to `SINGLE_TASK`.
-- * p_application_id:       Filter for an application. Default is null (all applications).
-- * p_show_expired_tasks:   If set to `Y` the tasks returned include tasks which are in
--                           `EXPIRED` state. Default is `N` (no).
--
-- Returns:
-- A table of tasks (type `apex_t_approval_tasks`).
--
-- Example:
-- ~~~
-- select *
--   from table ( apex_approval.get_tasks ( p_context => 'MY_TASKS' ) )
-- ~~~
--==============================================================================
function get_tasks (
    p_context            in varchar2 default wwv_flow_approval_api.c_context_my_tasks,
    p_user               in varchar2 default wwv_flow_security.g_user,
    p_task_id            in number   default null,
    p_application_id     in number   default null,
    p_show_expired_tasks in varchar2 default 'N' )
return wwv_flow_t_approval_tasks pipelined;

--==============================================================================
-- This procedure specifies, whether a Task can be completed by the initiator.
-- This procedure updates the initiator can complete attribute of a task. The task can
-- not be `COMPLETED` or `ERRORED`. Only a user who is a Business Administrator for
-- the task can invoke this procedure.
--
-- Since: 24.1
--
-- Parameters:
-- * p_task_id:                The Task ID.
-- * p_initiator_can_complete: true, if the initiator is allowed to also approve or reject the task,
--                             false otherwise.
--
-- Example:
-- ~~~
-- begin
--     apex_approval.set_initiator_can_complete(
--         p_task_id                => 1234,
--         p_initiator_can_complete => true
--     );
-- end;
-- ~~~
procedure set_initiator_can_complete(
    p_task_id                 in number,
    p_initiator_can_complete  in boolean);

--==============================================================================
-- This function gets the approval log for a task.
--
-- Note: The function will only return data in the context of a valid APEX
-- session. It returns no data in SQL Workshop.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:     The task ID.
-- * p_include_all: If set to `Y`, the history of all tasks linked to the task
--                  with the given Task ID is shown. This includes prior Tasks
--                  that have been expired.
--                  Since Oracle APEX release 22.2, this includes prior Tasks 
--                  that have been expired.
--
-- Returns:
-- A table of approval log entries (type `apex_t_approval_log_table`)
--
-- Example:
-- ~~~
-- select *
--   from table ( apex_approval.get_task_history ( p_task_id => 1234,
--                                                 p_include_all => 'Y' ) )
-- ~~~
--==============================================================================
function get_task_history (
    p_task_id        in number,
    p_include_all    in varchar2 default 'N' )
return wwv_flow_t_approval_log_table pipelined;

--==============================================================================
-- This function gets the potential new Owners of a Task. The actual Owner is
-- excluded from the list.
--
-- Note: This function only returns data in the context of a valid Oracle APEX session.
-- It returns no data in SQL Workshop.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:  The task ID.
--
-- Returns:
-- A table of `apex_t_temp_lov_data`.
--
-- Example:
-- ~~~
-- select disp,
--        val
--   from table ( apex_approval.get_task_delegates ( p_task_id => 1234 ) );
-- ~~~
--==============================================================================
function get_task_delegates (
    p_task_id in number )
return wwv_flow_t_temp_lov_data pipelined;

--==============================================================================
-- Get the potential new priorities of a Task. The actual priority is excluded
-- from the list.
--
-- Note: This function only returns data in the context of a valid Oracle APEX
-- session. It returns no data in SQL Workshop.
--
-- Since: 22.1
--
-- Parameters:
-- * p_task_id:  The task ID.
--
-- Returns:
-- A table of `apex_t_temp_lov_data`.
--
-- Example:
-- ~~~
-- select disp,
--        val
--   from table ( apex_approval.get_task_priorities ( p_task_id => 1234 ) );
-- ~~~
--==============================================================================
function get_task_priorities (
    p_task_id in number )
return wwv_flow_t_temp_lov_data pipelined;

--==============================================================================
-- Get the list of value data for the task attribute priority.
--
-- Since: 22.1
--
-- Returns:
-- A table of `apex_t_temp_lov_data`.
--
-- Example:
-- ~~~
-- select disp,
--        val
--   from table ( apex_approval.get_lov_priority );
-- ~~~
--==============================================================================
function get_lov_priority
return wwv_flow_t_temp_lov_data;

--==============================================================================
-- Get the list of value data for the task attribute state.
--
-- Since: 22.1
--
-- Returns:
-- A table of `apex_t_temp_lov_data`.
--
-- Example:
-- ~~~
-- select disp,
--        val
--   from table ( apex_approval.get_lov_state );
-- ~~~
--==============================================================================
function get_lov_state
return wwv_flow_t_temp_lov_data;

--==============================================================================
-- Get the list of value data for the task attribute type.
--
-- Since: 23.2
--
-- Returns:
-- `apex_t_temp_lov_data`
--
-- Example:
-- ~~~
-- select disp,
--        val
--   from table ( apex_approval.get_lov_type )
-- ~~~
--==============================================================================
function get_lov_type
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
--     l_next_purge_job_ts := apex_approval.get_next_purge_timestamp();
-- end;
-- ~~~
--
--==============================================================================
function get_next_purge_timestamp
return timestamp with time zone;

end wwv_flow_approval_api;
/
show err

set define '^'
