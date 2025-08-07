set define off verify off
prompt ...wwv_flow_approval_dev
create or replace package wwv_flow_approval_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_approval_dev.sql
--
--    DESCRIPTION
--      Oracle APEX Approvals Component App Builder API.
--
--    SECURITY
--
--    NOTES:
--
--    RUNTIME DEPLOYMENT: NO
--
--    MODIFIED    (MM/DD/YYYY)
--      ralmuell   08/30/2021 - Created
--      ogobrech   01/19/2022 - Add unified task list creation
--
--------------------------------------------------------------------------------


--==============================================================================
-- Create a new task definition.
--
-- Parameters:
-- * p_flow_id                   application ID
-- * p_name                      name of the new task definition
-- * p_static_id                 internal id of the new task definition
-- * p_subject:                  The subject (expression) of the task
-- * p_task_type                 the type of the task (APPROVAL, ACTION)
-- * p_potential_participant:    The (optional) potential owner of the task
-- * p_business_participant:     The (optional) administrator of the task
-- * p_due_on                    The optional due on interval for the task
-- * p_priority                  A (optional) task priority, default is 5
-- * p_initiator_can_complete    A (optional) Specify if the initiator can complete the task
--
-- Returns:
-- Returns the ID of the newly created task definition.
--
-- Since:
-- 22.1
--==============================================================================

function create_task_def(
    p_flow_id                in number    default v( 'FB_FLOW_ID' ),
    p_name                   in varchar2,
    p_static_id              in varchar2,
    p_subject                in varchar2,
    p_task_type              in varchar2,
    p_potential_participant  in varchar2 default null,
    p_admin_participant      in varchar2 default null,
    p_due_on                 in varchar2 default 'NONE',
    p_priority               in integer  default wwv_flow_approval_api.c_task_priority_medium,
    p_initiator_can_complete in varchar2 default 'N',
    p_comment                in varchar2 default null
)
return number;

--==============================================================================
-- checks vacation rule procedure for compilation errors if any
-- returns false if vacation rule procedure is invalid
--==============================================================================

function validate_vacation_rule_proc (
    p_proc_name            in varchar2)
    return boolean;

--==============================================================================
-- synchronizes parameter attributes in all components based on the
-- given task definition id.
--==============================================================================
procedure sync_task_def_param_attributes(
    p_application_id       in number,
    p_task_def_id          in number );

--==============================================================================
-- Returns true, if the theme has the needed components to generate unified
-- task list and task details pages. This is no complete check for each and
-- every component. It is mainly for detecting an outdated universal theme.
-- Is called by the page creation wizard.
--
-- Since: 24.2
--
-- Parameters:
-- * p_flow_id     The application ID
--==============================================================================
function has_theme_needed_components (
    p_flow_id in number )
    return boolean;

--==============================================================================
-- Creates a unified task list report.
-- Is called by the page creation wizard.
--==============================================================================
procedure create_task_list_report (
    p_flow_id                    in number                 ,
    p_report_page_id             in number                 ,
    p_report_page_name           in varchar2               ,
    p_report_context             in varchar2  default wwv_flow_approval_api.c_context_my_tasks,
    --
    p_group_name                 in varchar2  default null ,
    --
    p_breadcrumb_id              in number    default null ,
    p_breadcrumb_entry_name      in varchar2  default null ,
    p_parent_breadcrumb_entry_id in number    default null ,
    --
    p_nav_list_id                in number    default null ,
    p_nav_list_item_id           in number    default null ,
    p_nav_list_item_name         in varchar2  default null ,
    p_nav_list_item_icon         in varchar2  default null ,
    p_nav_list_parent_item_id    in number    default null ,
    p_nav_list_child_item_name   in varchar2  default null );

--==============================================================================
-- Creates a task details form.
-- Is called by the page creation wizard.
--==============================================================================
procedure create_task_details_forms (
    p_flow_id              in number   ,
    p_details_page_id      in number   ,
    p_task_definition_name in varchar2 ,
    p_task_type            in varchar2 );

--==============================================================================
-- Copy an existing task definition.
--
-- PARAMETERS:
-- * p_id id of existing task definition which should get copied
-- * p_to_name name of the new copied task definition
-- * p_to_static_id static id of the new copied task definition
-- * p_to_flow_id Application ID to copy the task definition to; by default
-- the automation is copied within the same application
--
-- RETURNS:
-- * ID of the created task definition.
--==============================================================================
function copy (
    p_id                   in number   ,
    p_to_name              in varchar2 ,
    p_to_static_id         in varchar2 ,
    p_to_flow_id           in number default null )
    return number;

--==============================================================================
-- computes the map of "from parameter ID" to "to parameter" ID for two
-- Task Definitions. The result is a list of Task Parameter IDs of
-- of the source Task Definition, mapped to the corresponding parameter of the
-- destination Task Definition.
--==============================================================================
procedure compute_task_param_map(
    p_from_application_id           in            number,
    p_to_application_id             in            number,
    p_from_task_def_id              in            number,
    p_to_task_def_id                in            number,
    --
    p_task_param_map                in out nocopy wwv_flow_global.vc_map );

--==============================================================================
-- If a Task Definition with the given static ID already
-- exists in the target application, simply return its ID. Otherwise raise exception
-- if p_handle_error is true (Default). If p_handle_error is false then propagate the
-- exception to the caller of the procedure.
--==============================================================================
procedure get_task_def_info(
    p_from_application_id  in            number,
    p_to_application_id    in            number,
    p_from_task_def_id     in            number,
    p_static_id            in            varchar2,
    --
    p_to_task_def_id          out        number,
    p_task_param_map       in out nocopy wwv_flow_global.vc_map,
    p_handle_error         in            boolean                default true );

--==============================================================================
-- If a Task Definition with the given static ID already
-- exists in the target application, simply return its ID. Otherwise copy the
-- task definition to the target application.
--==============================================================================
procedure get_or_copy_task_def(
    p_from_application_id  in            number,
    p_to_application_id    in            number,
    p_from_task_def_id     in            number,
    p_name                 in            varchar2,
    p_static_id            in            varchar2,
    --
    p_to_task_def_id          out        number,
    p_task_param_map       in out nocopy wwv_flow_global.vc_map );

end wwv_flow_approval_dev;
/

show err
set define '^'
