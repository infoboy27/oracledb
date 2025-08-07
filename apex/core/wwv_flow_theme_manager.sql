set define '^'
set verify off
prompt ...wwv_flow_theme_manager.sql
create or replace package wwv_flow_theme_manager is

--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_theme_manager.sql
--
--    DESCRIPTION
--      This package is responsible for managing theme switching
--
--    MODIFIED   (MM/DD/YYYY)
--      skutz     06/10/2004 - created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Get preset template options based on a template type and template id
-- If we are calling this from an existing component with existing template
-- options, then we check if we can preserve them in the the new preset
--==============================================================================
function get_preset_template_options (
    p_template_id               number,
    p_template_type             varchar2,
    p_existing_template_options varchar2 default null )
    return varchar2;

procedure create_new_public_theme (
   p_workspace_id    in number,
   p_app_id          in number,
   p_app_theme_id    in number,
   p_theme_name      in varchar2,
   p_theme_number    in number,
   p_theme_desc      in varchar2 default null,
   p_subscribe_theme in varchar2 default 'N');

procedure delete_workspace_theme (
    p_id              in number);

procedure delete_public_theme (
    p_id              in number);

procedure change_workspace_theme (
    p_id              in number,
    p_theme_name      in varchar2,
    p_theme_number    in number,
    p_theme_desc      in varchar2 default null);

procedure change_public_theme (
    p_id              in number,
    p_theme_name      in varchar2,
    p_theme_number    in number,
    p_theme_desc      in varchar2 default null);

procedure create_new_workspace_theme (
    p_app_id          in number,
    p_app_theme_id    in number,
    p_theme_name      in varchar2,
    p_theme_number    in number,
    p_theme_desc      in varchar2 default null,
    p_subscribe_theme in varchar2 default 'N');

function is_navigation_upgrade (
    p_application_id in number,
    p_from_theme_id  in number,
    p_to_theme_id    in number )
    return boolean;

function is_theme_switch_allowed (
    p_application_id in number,
    p_from_theme_id  in number,
    p_to_theme_id    in number )
    return varchar2;

procedure switch_theme (
    p_application_id      in number,
    p_from_application_id in number,
    p_from_theme_id       in number,
    p_to_application_id   in number,
    p_to_theme_id         in number );

procedure delete_theme(
    p_flow_id   in number,
    p_theme_id  in number );

procedure renumber_theme(
    p_application_id    in number,
    p_to_theme_id       in number,
    p_from_theme_id     in number default null,
    p_security_group_id in number default wwv_flow_security.g_security_group_id );

procedure copy_theme(
    p_from_application_id  in number,
    p_from_theme_id        in number,
    p_to_application_id    in number,
    p_to_theme_id          in number,
    p_to_security_group_id in number  default wwv_flow_security.g_security_group_id,
    p_theme_style_id       in number  default null,
    p_subscribe_theme      in boolean default false );

function get_button_slot(
    p_template_id in number,
    p_position    in varchar2 )
    return varchar2;

function get_page_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

function get_region_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

function get_report_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

function get_list_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

function get_field_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

function get_button_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

function get_menu_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

function get_cal_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

function get_template_component_util(
    p_flow_id     in number,
    p_id          in number )
    return varchar2;

--==============================================================================
-- Unsubscribe a theme
-- If provided theme is local, then we remove all reference IDs from templates
-- If provided theme is central, then we copy all templates from the central theme locally, without reference IDs
--                               then map the templates from central theme to local theme by internal name
--                               then update all app components to use the local templates
--==============================================================================
procedure unsubscribe_theme (
    p_subscribing_theme_id in number );

--==============================================================================
-- Subscribe a theme
-- First, map the templates from master theme to subscribing theme by internal name
-- Remove all matching local templates
-- If provided master theme is local, copy all templates locally
--                                    update all app components to use the new local templates
-- If provided master theme is central, update all app components to use the new central templates
--==============================================================================
procedure subscribe_theme (
    p_subscribing_theme_id in number,
    p_master_theme_id      in number default null );

--==============================================================================
-- Determines whether or not a theme can be refreshed for a given app and theme id
--
-- Parameters:
-- * p_application_id: ID of the application.
-- * p_theme_id:       The number of the theme to check, e.g. 42
--
-- Returns:
-- * BOOLEAN:  true if 1) if there exists an upgrade to the existing theme for a
--             given application and theme id or (2) if we cannot determine if there is an
--             upgrade opportunity
--             false if there is no identifiable upgrade opportunity
--
-- Example:
-- Check if theme 456 in application 123 has an opportunity to refresh.
--
-- declare
--     l_is_refresh_available boolean;
-- begin
--     l_is_refresh_available := wwv_flow_theme_manager.is_refresh_available( p_application_id => 123, p_theme_id => 456 );
--     sys.dbms_output.put_line( 'The theme of App 123 theme 456 can be refreshed: ' || wwv_flow_debug.tochar( l_is_refresh_available ) );
-- end;
--
-- Since: 24.2
--==============================================================================
function is_refresh_available (
    p_application_id in number,
    p_theme_id       in number )
    return boolean;

--==============================================================================
-- Determines if the specified app theme is itself a central theme.
-- A central theme fits one of the following scenarios
-- Workspace 12: oracle theme (e.g. master UT)
-- Workspace 11: public theme (theme_security_group_id is null)
-- Workspace 11: workspace theme (theme_security_group_id is not null)
--
-- Parameters:
-- * p_application_id: ID of the application.
-- * p_theme_id:       The number of the theme to check, e.g. 42
--
-- Returns:
-- * BOOLEAN:  true if the specified app and theme is a central theme,
--             false if the specified app and theme is not a central theme.
--
-- Example:
-- Check if theme 456 in application 123 is a central theme.
--
-- declare
--     l_is_central_theme boolean;
-- begin
--     l_is_central_theme := wwv_flow_theme_manager.is_central_theme(
--                               p_application_id => 123,
--                               p_theme_id       => 42 );
--     sys.dbms_output.put_line(
--         'is central theme: ' ||
--         wwv_flow_debug.tochar( l_is_central_theme ) );
-- end;
--
-- Since: 24.2
--==============================================================================
function is_central_theme (
    p_application_id in number,
    p_theme_id       in number )
    return boolean;

--==============================================================================
-- Determines if the specified app theme is subscribed to a central theme.
-- A central theme as one of the following scenarios
-- Workspace 12: oracle theme (e.g. master UT)
-- Workspace 11: public theme (theme_security_group_id is null)
-- Workspace 11: workspace theme (theme_security_group_id is not null)
--
-- Parameters:
-- * p_application_id: ID of the application.
-- * p_theme_id:       The number of the theme to check, e.g. 42
--
-- Returns:
-- * BOOLEAN:  true if the specified app and theme is subscribed to a central theme,
--             false if the specified app and theme is not subscribed to a central theme.
--
-- Example:
-- Check if current theme in application 123 is subscribed to a central theme.
--
-- declare
--     l_subscribed_to_central_theme boolean;
-- begin
--     l_subscribed_to_central_theme := wwv_flow_theme_manager.is_subscribed_to_central_theme(
--                                          p_application_id => 123,
--                                          p_theme_id       => 42 );
--     sys.dbms_output.put_line(
--         'is subscribed to central theme: ' ||
--         wwv_flow_debug.tochar( l_subscribed_to_central_theme ) );
-- end;
--
-- Since: 24.2
--==============================================================================
function is_subscribed_to_central_theme (
    p_application_id in number,
    p_theme_id       in number )
    return boolean;

--==============================================================================
-- Returns the id of the central application of the specified theme.
-- A central theme can belong in a different application than the current one.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_central_application_id (
    p_application_id in number,
    p_theme_id       in number default null )
    return number;

--==============================================================================
-- Returns the id of the central theme of the specified theme.
-- A central theme can belong in a different application than the current one.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_central_theme_id (
    p_application_id in number,
    p_theme_id       in number default null )
    return number;

--==============================================================================
-- Returns the id of the central workspace of the specified theme.
-- A central theme can belong in a different application than the current one.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_central_workspace_id (
    p_application_id in number,
    p_theme_id       in number default null )
    return number;

--==============================================================================
-- Function that returns the status of template subscription
-- Values can be CENTRAL, BOTH, THEME
--==============================================================================
function get_subscription_status (
    p_template_type  in varchar2,
    p_template_id    in number )
    return varchar2;

end wwv_flow_theme_manager;
/
show errors;
