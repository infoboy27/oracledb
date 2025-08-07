set define '^' verify off
prompt ...wwv_flow_theme_api
create or replace package wwv_flow_theme_api authid current_user as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2016 - 2022. All Rights Reserved.
--
-- The APEX_THEME package contains utility functions for working with themes
-- and theme styles.
--
--------------------------------------------------------------------------------

--==============================================================================
-- This procedure sets current theme style for the current application.
--
-- Note: This is a persistent change. The "Modify this Application" setting has
--       to be activated in Shared Components, Security, Runtime API usage.
--
-- Parameters:
-- * p_application_id: The application id, default is the current application.
-- * p_theme_number:   The theme number for which to set the default style.
-- * p_style_id:       The ID of the new default theme style.
--
-- Example:
--
-- The following example gets available theme styles from Oracle APEX
-- Dictionary View.
--
--   select s.theme_style_id,
--          t.theme_number
--     from apex_application_theme_styles s,
--          apex_application_themes t
--    where s.application_id = :APP_ID
--      and s.is_current     = 'Yes'
--      and t.application_id = s.application_id
--      and t.theme_number   = s.theme_number
--
-- The following example sets the current theme style to one of values
-- returned by the above query.
--
--   begin
--       apex_theme.set_current_style (
--            p_theme_number => {query.theme_number},
--            p_id           => {query.theme_style_id} );
--   end;
--
--==============================================================================
procedure set_current_style (
    p_application_id in wwv_flow.g_flow_id%type         default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type,
    p_id             in wwv_flow_theme_styles.name%type );

--==============================================================================
-- This procedure sets the theme style dynamically for the current session. This
-- is typically being called after successful authentication.
--
-- Parameters:
-- * p_application_id: The application id, default is the current application.
-- * p_theme_number:   The theme number to set the session style for, default is
--                     the current theme of the application.
-- * p_name:           The name of the theme style to be used in the session.
--
-- Example:
--
-- The following example gets the current theme number from Oracle APEX
-- Dictionary View and sets the session theme style for the current theme to "Vita".
--
--   declare
--       l_theme_number number;
--   begin
--       select theme_number
--         into l_theme_number
--         from apex_application_themes
--        where application_id = :APP_ID;
--
--       apex_theme.set_current_style (
--           p_theme_number => l_theme_number,
--           p_name         => 'Vita' );
--   end;
--
--==============================================================================
procedure set_session_style (
    p_application_id in wwv_flow.g_flow_id%type         default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type   default wwv_flow.g_flow_theme_id,
    p_name           in wwv_flow_theme_styles.name%type );

--==============================================================================
-- This procedure sets the theme style dynamically for the current session. This
-- is typically being called after successful authentication.
--
-- Parameters:
-- * p_application_id: The application id, default is the current application.
-- * p_theme_number:   The theme number to set the session style for, default is
--                     the current theme of the application.
-- * p_id              The ID of the theme style to be used in the session.
--==============================================================================
procedure set_session_style (
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id,
    p_id             in wwv_flow_theme_styles.id%type );

--==============================================================================
-- This procedure sets the theme style CSS urls dynamically for the current session.
-- Theme style CSS URLs are being directly passed in; a persistent style definition
-- is not needed. This is typically being called after successful authentication.
--
-- Parameters:
-- * p_application_id:   The application id, default is the current application.
-- * p_theme_number:     The theme number to set the session style for, default is
--                       the current theme of the application.
-- * p_css_urls:         The URLs to CSS files with style directives.
-- * p_page_css_classes: Class names which are added to the #PAGE_CSS_CLASSES#
--                       placeholder.
--
-- Example:
--
-- The following example gets the current theme number from Oracle APEX
-- Dictionary View and sets the session theme style for the current theme to
-- `#APP_FILES#my_style.css`.
--
--   declare
--       l_theme_number number;
--   begin
--       select theme_number
--         into l_theme_number
--         from apex_application_themes
--        where t.application_id = :APP_ID;
--
--       apex_theme.set_current_style_css (
--           p_theme_number  => l_theme_number,
--           p_css_file_urls => '#APP_FILES#my_style.css' );
--   end;
--
--==============================================================================
procedure set_session_style_css (
    p_application_id   in wwv_flow.g_flow_id%type                  default wwv_flow.g_flow_id,
    p_theme_number     in wwv_flow_themes.theme_id%type            default wwv_flow.g_flow_theme_id,
    p_css_file_urls    in wwv_flow_theme_styles.css_file_urls%type,
    p_page_css_classes in varchar2                                 default null );

--==============================================================================
-- This procedure sets a theme style user preference for the current user and
-- application. Theme Style User Preferences are automatically picked up and
-- precede any style set with SET_SESSION_STYLE.
--
-- Parameters:
-- * p_application_id: The application id, default is the current application.
-- * p_user            The user name to the user style preference.
-- * p_theme_number:   The theme number to set the use style for, default is
--                     the current theme of the application.
-- * p_id              The ID of the theme style to set as a user preference.
--
-- See Also:
-- - GET_USER_STYLE
-- - CLEAR_USER_STYLE
-- - CLEAR_ALL_USER_STYLE
-- - ENABLE_USER_STYLE
-- - DISABLE_USER_STYLE
--==============================================================================
procedure set_user_style (
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id,
    p_id             in wwv_flow_theme_styles.id%type );

--==============================================================================
-- This function returns the theme style user preference for the user and
-- application. If no user preference is present, NULL is returned.
--
-- PARAMETERS
-- * p_application_id: The application id, default is the current application.
-- * p_user:           The user name to the user style preference.
-- * p_theme_number:   The theme number.
--
-- Returns:
-- The theme style ID which is set as a user preference.
--
-- Example:
--
-- The query returns the theme style user preference for the `ADMIN` user in
-- application `100` and theme `42`.
--
--   select apex_theme.get_user_style( 100, 'ADMIN', 42 ) from dual;
--
-- See Also:
-- - SET_USER_STYLE
-- - CLEAR_USER_STYLE
-- - CLEAR_ALL_USER_STYLE
-- - ENABLE_USER_STYLE
-- - DISABLE_USER_STYLE
--==============================================================================
function get_user_style (
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id )
    return number;

--==============================================================================
-- clears the theme style user preference for user and application.
--
-- PARAMETERS
-- * p_application_id: The application id, default is the current application.
-- * p_user               user name to the user style preference for
-- * p_theme_number       theme number to clear the theme style user preference
--
-- EXAMPLE
--   clear the theme style user preference for the "ADMIN" user
--   in application "100" and theme "42"
--
--   apex_theme.clear_user_style(
--       p_application_id => 100,
--       p_user           => 'ADMIN',
--       p_theme_number   => 42
--   );
--==============================================================================
procedure clear_user_style (
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id );

--==============================================================================
-- clears all theme style user preferences for an application and theme.
--
-- PARAMETERS
-- * p_application_id: The application id, default is the current application.
-- * p_theme_number       theme number to clear all theme style user preferences for
--
-- EXAMPLE
--   clear the all theme style user preferences for theme "42" in application "100"
--
--   apex_theme.clear_all_users_style(
--       p_application_id => 100,
--       p_theme_number   => 42
--   );
--==============================================================================
procedure clear_all_users_style (
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id );

--==============================================================================
-- enables theme style selection by end users. When enabled and there is at least
-- one theme style marked as "Public", end users will see a Customize link which
-- allows to choose the theme style. End user theme style selection is enabled or
-- disabled at the User Interface level.
-- When providing a theme number, the theme must be the "Current Theme" for a
-- User Interface.
--
-- Note that this only affects the "Customization" link for end users. APEX_THEME
-- API calls are independent.
--
-- PARAMETERS
-- * p_application_id: The application id, default is the current application.
-- * p_theme_number       number of User Interface's "Current Theme"
--
-- EXAMPLE
--   enable end user theme style selection for application "100".
--
--   declare
--     l_theme_id apex_themes.theme_number%type;
--   begin
--     select theme_number into l_theme_id
--       from apex_applications
--      where application_id = 100;
--
--     apex_theme.enable_user_style(
--       p_application_id => 100,
--       p_theme_number   => l_theme_id
--     );
--   end;
--==============================================================================
procedure enable_user_style (
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id );

--==============================================================================
-- disables theme style selection by end users. End users will not be able
-- to customize the theme style on their own.
--
-- Note that this only affects the "Customization" link for end users. APEX_THEME
-- API calls are independent.
--
-- PARAMETERS
-- * p_application_id: The application id, default is the current application.
-- * p_theme_number       number of User Interface's "Current Theme"
--
-- EXAMPLE
--   disable end user theme style selection for application "100".
--
--   declare
--     l_theme_id apex_themes.theme_number%type;
--   begin
--     select theme_number into l_theme_id
--       from apex_applications
--      where application_id = 100;
--
--     apex_theme.disable_user_style(
--       p_application_id => 100,
--       p_theme_number   => l_theme_id
--     );
--   end;
--==============================================================================
procedure disable_user_style (
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id );

end wwv_flow_theme_api;
/
show errors
