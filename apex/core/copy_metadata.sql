set define '^' verify off
prompt ...wwv_flow_copy_metadata
create or replace package wwv_flow_copy_metadata as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_copy_metadata.sql
--
--    DESCRIPTION
--      Used to subscribe and pull flow objects.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho   01/22/2002 - Created
--
--------------------------------------------------------------------------------
--==============================================================================
-- Global types and constants
--==============================================================================
type templ_opt_checksum_type is record (templ_opt_name varchar2(255), tmpl_opt_checksum varchar2(32767));
type templ_opt_checksum_tbl is table of templ_opt_checksum_type index by binary_integer;

type t_component is record(
    table_name         wwv_flow_global.t_dbms_id,
    name_col           wwv_flow_global.t_dbms_id,
    additional_col     wwv_flow_global.t_dbms_id,
    build_option_col   wwv_flow_global.t_dbms_id,
    authorization_col  wwv_flow_global.t_dbms_id,
    unique_cols        varchar2(500),
    unique_err_message wwv_flow_messages$.name%type );

--==============================================================================
-- This procedure removes reference id from page templates.
--==============================================================================
procedure remove_page_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from region templates.
--==============================================================================
procedure remove_region_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from list templates.
--==============================================================================
procedure remove_list_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from report templates.
--==============================================================================
procedure remove_report_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from field templates.
--==============================================================================
procedure remove_field_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from a popup LOV template.
--==============================================================================
procedure remove_popuplov_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from a menu template.
--==============================================================================
procedure remove_menu_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from a button template.
--==============================================================================
procedure remove_button_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from a security scheme.
--==============================================================================
procedure remove_scheme_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from a shortcut.
--==============================================================================
procedure remove_shortcut_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from a navbar.
--==============================================================================
procedure remove_navbar_reference_id (
    p_id in number );

--==============================================================================
-- This procedure removes reference id from an item help
--==============================================================================
procedure remove_item_help_reference_id (
    p_id in number );

--==============================================================================
-- This procedure pulls content from the master template and
-- copies it to the subscribing template.
--==============================================================================
procedure subscribe_page_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master region template and
-- copies it to the subscribing region template.
--==============================================================================
procedure subscribe_region_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master list template and
-- copies it to the subscribing list template.
--==============================================================================
procedure subscribe_list_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master report template and
-- copies it to the subscribing report template.
--==============================================================================
procedure subscribe_report_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master field template and
-- copies it to the subscribing field template.
--==============================================================================
procedure subscribe_field_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master popup lov template and
-- copies it to the subscribing popup lov template.
--==============================================================================
procedure subscribe_popuplov_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master menu template and
-- copies it to the subscribing menu template.
--==============================================================================
procedure subscribe_menu_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master button template and
-- copies it to the subscribing button template.
--==============================================================================
procedure subscribe_button_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master calendar template and
-- copies it to the subscribing calendar template.
--==============================================================================
procedure subscribe_calendar_template (
    p_master_template_id      in number,
    p_subscribing_template_id in number,
    p_subscribing_sgid        in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- This procedure pulls content from the master navbar and
-- copies it to the subscribing navbar.
--==============================================================================
procedure subscribe_navbar (
    p_master_navbar_id         in number,
    p_subscribing_navbar_id    in number );

--==============================================================================
-- This procedure pulls content from the master authentication and
-- copies it to the subscribing authentication.
--==============================================================================
procedure subscribe_authentication (
    p_master_auth_id         in number,
    p_subscribing_auth_id    in number,
    p_subscribing_app_id     in number default null );

--==============================================================================
-- This procedure pulls content from the master item help and
-- copies it to the subscribing item help.
--==============================================================================
procedure subscribe_item_help (
    p_master_item_id         in number,
    p_subscribing_item_id    in number );

--==============================================================================
-- This procedure pushes content of the page template to
-- all templates that reference this page template.
--==============================================================================
procedure push_page_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the region template to
-- all templates that reference this region template.
--==============================================================================
procedure push_region_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the list template to
-- all templates that reference this list template.
--==============================================================================
procedure push_list_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the report template to
-- all templates that reference this report template.
--==============================================================================
procedure push_report_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the field template to
-- all templates that reference this field template.
--==============================================================================
procedure push_field_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the popup LOV template to
-- all templates that reference this popup LOV template.
--==============================================================================
procedure push_popuplov_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the menu template to
-- all templates that reference this menu template.
--==============================================================================
procedure push_menu_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the button template to
-- all templates that reference this button template.
--==============================================================================
procedure push_button_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the calendar template to
-- all templates that reference this calendar template.
--==============================================================================
procedure push_calendar_template (
    p_template_id in number );

--==============================================================================
-- This procedure pushes content of the navbar to
-- all navbars that reference this navbar.
--==============================================================================
procedure push_navbar (
    p_navbar_id in number );

--==============================================================================
-- This procedure pushes content of the item help to
-- all item helps that reference this item help.
--==============================================================================
procedure push_item_help (
    p_item_id in number );

--==============================================================================
-- If the master navbar ID is not passed, get the master navbar ID
-- and refresh subscribing navbar.
--==============================================================================
procedure refresh_navbar (
    p_subscribing_navbar_id    in number );

--==============================================================================
-- compares template options of template with those of master template
--==============================================================================
function template_options_match (
    p_template_id    in number,
    p_reference_id   in number
) return boolean;

--==============================================================================
-- compares all templates of the subscribing theme with the references templates
-- in the master themes
--==============================================================================
function compare_themes (
    p_subscribing_theme_id in number
) return number;

--==============================================================================
-- This procedure copies the list data from master list to subscribing list
--
-- Parameters:
--
-- * p_master_list_id: Master list id
-- * p_subscribing_list_id: Subscribing list id
--==============================================================================
procedure subscribe_list (
    p_master_list_id      in number,
    p_subscribing_list_id in number );

--==============================================================================
-- This procedure refreshes the list data from master list to the subscribing list
--
-- Parameters:
--
-- * p_list_id: list id to refresh
--==============================================================================
procedure refresh_list (
    p_list_id in number );

--==============================================================================
-- This procedure copies a list
--
-- Parameters:
-- * p_copy_from_app_id:     app ID to copy the list from
-- * p_copy_from_list_id:    list ID to copy
-- * p_new_list_name:        name for the new list
-- * p_new_application_id:   app ID to copy the list to
-- * p_include_subscription: also copy the subscription status of the list
-- * p_copy_subscription:    Flag to determine whether to copy reference_id as is or not from p_copy_from_app_id
--                           This flag is applicable only if p_include_subscription is true
--
-- Returns:
-- * p_new_list_id:          ID of the new list
--==============================================================================
procedure copy_list_from_app (
    p_copy_from_app_id      in number,
    p_copy_from_list_id     in number,
    p_new_list_name         in varchar2,
    p_new_application_id    in number,
    p_include_subscription  in boolean default false,
    p_copy_subscription     in boolean default false,
    --
    p_new_list_id          out number );

--==============================================================================
-- This function returns meta data like table_name, name_col etc of given component type
--
-- Parameters:
-- * p_component_type:       wwv_flow_shared_component_api.t_component_type
--
-- Returns:
-- * Component meta data as t_component type
--==============================================================================
function get_component(
    p_component_type in wwv_flow_shared_component_api.t_component_type )
    return t_component;

function copy_authentication (
    p_copy_from_flow_id      in number,
    p_flow_id                in number,
    p_from_authentication_id in number,
    p_to_authentication_name in varchar2 default null,
    p_subscribe              in boolean default false )
return number;

--==============================================================================
-- Common function to copy a component
-- Calls corresponding copy function or uses generic copy function based on p_component_type value
-- Throws exception / error message if a component with same name already exists
--
-- Parameters:
-- * p_component_type:       wwv_flow_shared_component_api.t_component_type
-- * p_from_id:              Component ID to copy
-- * p_from_app_id:          App ID to copy the component from
-- * p_to_app_id:            App ID to copy the component to
-- * p_new_name:             Name of the new component, when null source name is used
-- * p_additional_col:       Additional column info that should be copied to new shared component
-- * p_subscribe:            Flag to determine whether to subscribe to the shared component or not
-- * p_copy_subscription:    Flag to determine whether to copy reference_id as is or not from p_from_app_id
--                           This flag is applicable only if p_subscribe is true
--
-- Returns:
-- * ID of the new copied component
--==============================================================================
function copy_component (
    p_component_type       in wwv_flow_shared_component_api.t_component_type,
    p_from_id              in number,
    p_from_app_id          in number,
    p_to_app_id            in number,
    p_new_name             in varchar2 default null,
    p_additional_col       in varchar2 default null,
    p_subscribe            in boolean  default false,
    p_copy_subscription    in boolean  default false )
    return number;

--==============================================================================
-- Common procedure to refresh a component
-- Calls corresponding refresh procedure or uses generic refresh procedure based on p_component_type value
--
-- Parameters:
-- * p_component_type:       wwv_flow_shared_component_api.t_component_type
-- * p_master_id:            Master component ID
-- * p_subscribing_id:       Subscribing component ID
-- * p_subscribing_app_id:   Subscribing app ID
-- * p_initial_refresh:      Flag to determine if the refresh is happening right after subscription
--                           or during subsequent refresh or publish operations
--                           this parameter is not applicable to all shared components
-- * p_master_app_id:        Master app ID, this is only required for PAGE,
--                           because ID is not unique in wwv_flow_steps table
--                           not used or applicable for other components
--
--==============================================================================
procedure refresh_component (
    p_component_type     in wwv_flow_shared_component_api.t_component_type,
    p_master_id          in number,
    p_subscribing_id     in number,
    p_subscribing_app_id in number,
    p_initial_refresh    in boolean default false,
    p_master_app_id      in number  default null );

--==============================================================================
-- Common procedure to refresh a component
-- Wrapper for refresh_component
-- this procedure is called by documented API apex_shared_component.refresh
--
-- Parameters:
-- * p_component_type:       wwv_flow_shared_component_api.t_component_type
-- * p_component_id:         Component ID
--==============================================================================
procedure refresh (
    p_component_type     in wwv_flow_shared_component_api.t_component_type,
    p_component_id       in number );

--==============================================================================
-- Common procedure to publish a component
--
-- Parameters:
-- * p_component_type:       wwv_flow_shared_component_api.t_component_type
-- * p_master_id:            Master component ID
-- * p_master_app_id:        Master app ID
--==============================================================================
procedure publish_component (
    p_component_type     in wwv_flow_shared_component_api.t_component_type,
    p_master_id          in number,
    p_master_app_id      in number );

--==============================================================================
-- Common procedure to publish a component
-- Wrapper for publish_component
-- this procedure is called by documented API apex_shared_component.publish
--
-- Parameters:
-- * p_component_type:       wwv_flow_shared_component_api.t_component_type
-- * p_component_id:         Component ID
--==============================================================================
procedure publish (
    p_component_type     in wwv_flow_shared_component_api.t_component_type,
    p_component_id       in number );

--==============================================================================
-- Generic procedure to unsubscribe a shared component
--
-- Parameters:
-- * p_component_type:       wwv_flow_shared_component_api.t_component_type
-- * p_component_id:         Shared component ID to unsubscribe
-- * p_app_id:               Application ID
--==============================================================================
procedure unsubscribe_component (
    p_component_type  in wwv_flow_shared_component_api.t_component_type,
    p_component_id    in number,
    p_app_id          in number );

--==============================================================================
-- Generic procedure to clear reference_id column in subscribing app
-- It's called when master shared component is deleted
--
-- Parameters:
-- * p_component_type:       wwv_flow_shared_component_api.t_component_type
-- * p_master_id:            Shared component ID that's being deleted
--
--==============================================================================
procedure clear_subscriptions (
    p_component_type  in wwv_flow_shared_component_api.t_component_type,
    p_master_id       in number );

--==============================================================================
-- This procedure looks for the build option by name in p_to_application_id app
-- if build option is not found, then build option is copied from p_from_application_id to p_to_application_id
--
-- Parameters:
--
-- * p_from_patch_id:        Build option to search for
-- * p_from_application_id:  App ID where p_from_patch_id build option exists
-- * p_to_application_id:    App ID to search or copy the build option to
-- * p_include_subscription: Flag to determine whether to subscribe to the Build Option or not
-- * p_copy_subscription:    Flag to determine whether to copy reference_id as is or not from p_copy_from_app_id
--                           This flag is applicable only if p_include_subscription is true
--
-- Returns:
-- * Build option id
--==============================================================================
function get_patch_in_other_app(
    p_from_patch_id        in number,
    p_from_application_id  in number,
    p_to_application_id    in number,
    p_include_subscription in boolean default false,
    p_copy_subscription    in boolean default false )
    return number;

--==============================================================================
-- This function copies an application computation
--
-- Parameters:
-- * p_copy_from_computation_id:  Application computation ID to copy
-- * p_copy_from_app_id:          App ID to copy the Application computation from
-- * p_new_computation_item:      New application computation item
-- * p_copy_to_app_id:            App ID to copy the Application computation to
-- * p_include_subscription:      Flag to determine whether to subscribe to the Application computation or not
--
-- Returns:
-- * ID of the new Application computation
--==============================================================================
function copy_app_computation (
    p_copy_from_computation_id  in number,
    p_copy_from_app_id          in number,
    p_new_computation_item      in varchar2,
    p_copy_to_app_id            in number,
    p_include_subscription      in boolean default false )
    return number;

--==============================================================================
-- This procedure refreshes the application computation data from master to the subscribing computation
--
-- Parameters:
-- * p_master_computation_id:      Master application computation id
-- * p_subscribing_computation_id: Subscribing application computation id
-- * p_subscribing_app_id:         Subscribing application id
--==============================================================================
procedure refresh_app_computation (
    p_master_computation_id      in number,
    p_subscribing_computation_id in number,
    p_subscribing_app_id         in number );

--==============================================================================
-- This procedure refreshes all the components that are in the status "Needs Refresh"
--  for a given shared component type
--
-- Parameters:
--
-- * p_app_id:         Application ID
-- * p_component_type: Shared component type to refresh
--==============================================================================
procedure refresh_all_components (
    p_app_id         in number,
    p_component_type in varchar2 );

--==============================================================================
-- This function gets publish text message for a given shared component
--  it is used in page 4000:149
--
-- Parameters:
--
-- * p_id:             Shared Component ID
-- * p_component_type: Shared component type
--==============================================================================
function get_publish_text (
    p_id             in number,
    p_component_type in wwv_flow_shared_component_api.t_component_type )
    return varchar2;

--==============================================================================
-- This function gets SQL query to list subscribed components of a shared component
--  it is used in page 4000:149
--
-- Parameters:
--
-- * p_component_type: Shared component type
--==============================================================================
function get_subscribed_components_sql (
    p_component_type in wwv_flow_shared_component_api.t_component_type )
    return varchar2;

end wwv_flow_copy_metadata;
/
show errors
