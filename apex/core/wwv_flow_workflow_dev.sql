set define off verify off
prompt ...wwv_flow_workflow_dev
create or replace package wwv_flow_workflow_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_workflow_dev.sql
--
--    DESCRIPTION
--      Oracle APEX Workflow App Builder API.
--
--    SECURITY
--
--    NOTES:
--
--    RUNTIME DEPLOYMENT: NO
--
--    MODIFIED    (MM/DD/YYYY)
--      ralmuell   01/05/2023 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Get the activation state of  a  Workflow Model version.
--
--
-- Since: 23.2
--
-- Parameters:
-- * p_application_id        The application ID that creates the Workflow
-- * p_workflow_id           ID of the Workflow Definition
-- * p_version_label         Version label
-- Returns:
-- * Active/Inactive/In Development
--==============================================================================
function get_activation_status(
    p_application_id         in number           default wwv_flow.g_flow_id,
    p_workflow_id            in number,
    p_version_label          in varchar2)
return varchar2;

--==============================================================================
-- Returns true, if the theme has the needed components to generate workflow
-- console pages. This is no complete check for each and every component. It
-- is mainly for detecting an outdated universal theme. Is called by the page
-- creation wizard.
--
-- Since: 23.2
--
-- Parameters:
-- * p_flow_id     The application ID

--==============================================================================
function has_theme_needed_components (
    p_flow_id in number )
    return boolean;

--==============================================================================
-- Creates a workflow console report page. Is called by the page creation wizard.
--
-- Since: 23.2
--
-- Parameters:
-- * p_flow_id                    The application ID
-- * p_report_page_id             ID of the report page (cards type)
-- * p_report_page_name           Name of the report page
-- * p_report_context             The report context (MY_WORKFLOWS, ADMIN_WORKFLOWS, INITIATED_BY_ME or SINGLE_WORKFLOW)
-- * p_details_page_id            The ID of the Details Page
-- * p_group_name                 Page group name (optional)
-- * p_breadcrumb_id              Breadcrumb ID (optional)
-- * p_breadcrumb_entry_name      Breadcrumb entry name (optional)
-- * p_parent_breadcrumb_entry_id Parent Breadcrumb Entry ID (optional)
-- * p_nav_list_id                Navigation list ID (optional)
-- * p_nav_list_item_id           Navigation list item ID (optional)
-- * p_nav_list_item_name         Navigation list item name (optional)
-- * p_nav_list_item_icon         Navigation list item icon (optional)
-- * p_nav_list_parent_item_id    Navigation list parent item ID (optional)
-- * p_nav_list_child_item_name   Navigation list child item name (optional)
--==============================================================================
procedure create_workflow_console_report (
    p_flow_id                    in number                 ,
    p_report_page_id             in number                 ,
    p_report_page_name           in varchar2               ,
    p_report_context             in varchar2  default wwv_flow_workflow_api.c_context_my_workflows,
    p_details_page_id            in number    default null ,
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
-- Creates a workflow console form page. Is called by the page creation wizard.
--
-- Since: 23.2
--
-- Parameters:
-- * p_flow_id                    The application ID
-- * p_details_page_id            ID of the details page
-- * p_details_page_name          Name of the details page
-- * p_details_page_mode          The page mode (NORMAL, MODAL, DRAWER)
--==============================================================================
procedure create_workflow_console_form (
    p_flow_id                in number                    ,
    p_details_page_id        in number                    ,
    p_details_page_name      in varchar2                  ,
    p_details_page_mode      in varchar2 default 'DRAWER' );

--==============================================================================
-- Creates a workflow console dashboard page. Is called by the page creation wizard.
--
-- Since: 24.1
--
-- Parameters:
-- * p_flow_id                    The application ID
-- * p_page_id                    ID of the details page
-- * p_page_name                  Name of the details page
-- * p_page_mode                  The page mode (NORMAL, MODAL, DRAWER)
--==============================================================================
procedure create_workflow_console_charts (
    p_flow_id                    in number                    ,
    p_page_id                    in number                    ,
    p_page_name                  in varchar2                  ,
    p_page_mode                  in varchar2  default 'NORMAL' ,
    p_context                    in varchar2  default wwv_flow_workflow_api.c_context_my_workflows,
    p_breadcrumb_id              in number    default null ,
    p_breadcrumb_entry_name      in varchar2  default null ,
    p_parent_breadcrumb_entry_id in number    default null ,
    --
    p_nav_list_id                in number    default null ,
    p_nav_list_item_id           in number    default null ,
    p_nav_list_item_name         in varchar2  default null ,
    p_nav_list_item_icon         in varchar2  default null ,
    p_nav_list_parent_item_id    in number    default null ,
    p_nav_list_child_item_name   in varchar2  default null
);

--==============================================================================
-- Synchronizes parameter attributes in all components based on the
-- given workflow id.
--==============================================================================
procedure sync_workflow_param_attributes(
    p_application_id         in number,
    p_workflow_id            in number );

--==============================================================================
-- If a Workflow with the given static ID already
-- exists in the target application, simply return its ID.
-- Otherwise copy the workfloe to the target application.
--==============================================================================

procedure get_or_copy_workflow(
    p_flow_id_to          in                number,
    p_flow_id_from        in                number,
    p_workflow_id_from    in                number,
    p_name                in                varchar2,
    p_static_id           in                varchar2,
    --
    p_workflow_id_to         out            number,
    p_workflow_param_map  in out nocopy     wwv_flow_global.vc_map );
--==============================================================================
-- Copy a workflow to another application.
--
-- PARAMETERS:
-- * p_from_flow_id ID of the application from where the workflow is being copied.
-- * p_from_id      ID of existing workflow which should get copied
-- * p_to_name      Name of the new copied workflow
-- * p_to_static_id Static id of the new copied workflow
-- * p_to_flow_id   Application ID to copy the workflow to
--
-- RETURNS:
-- * ID of the copied workflow.
--==============================================================================
function copy_from_other_app (
    p_from_flow_id         in number   ,
    p_from_id              in number   ,
    p_to_name              in varchar2 ,
    p_to_static_id         in varchar2 ,
    p_to_flow_id           in number)
    return number;

--==============================================================================
-- computes the map of "from parameter ID" to "to parameter" ID for two
-- Workflows. The result is a list of Workflow Parameter IDs of
-- of the source Workflow, mapped to the corresponding parameter of the
-- destination Workflow.
--==============================================================================
procedure compute_workflow_param_map(
    p_from_application_id           in            number,
    p_to_application_id             in            number,
    p_from_workflow_id              in            number,
    p_to_workflow_id                in            number,
    --
    p_workflow_param_map            in out nocopy wwv_flow_global.vc_map );

--==============================================================================
-- If a Workflow with the given static ID already
-- exists in the target application, simply return its ID. Otherwise raise exception
-- if p_handle_error is true (Default). If p_handle_error is false then the error
-- is passed on to the caller of this procedure.
--==============================================================================
procedure get_workflow_info(
    p_from_application_id  in            number,
    p_to_application_id    in            number,
    p_from_workflow_id     in            number,
    p_static_id            in            varchar2,
    --
    p_to_workflow_id          out        number,
    p_workflow_param_map   in out nocopy wwv_flow_global.vc_map,
    p_handle_error         in            boolean                 default true );

end wwv_flow_workflow_dev;

/

show err
set define '^'
