set define '^' verify off
prompt ...wwv_flow_authentication_dev.sql
create or replace package wwv_flow_authentication_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_authentication_dev.sql
--
--    DESCRIPTION
--      Builder-specific internal authentication-related routines
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/03/2012 - Created
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# BUILDER UTILITIES
--#
--##############################################################################

--==============================================================================
-- helper routine for app 4155 (scheme authentication login)
--==============================================================================
procedure get_login_help_for_app (
    p_app_id                   in  number,
    p_plugin_help_text         out varchar2,
    p_authentication_help_text out varchar2,
    p_workspace_name           out varchar2,
    p_needs_password_yn        out varchar2 );
--
--==============================================================================
-- helper function to get the translated authentication name
--==============================================================================
function get_translated_authent_name (
    p_authentication_name in varchar2 )
    return varchar2;
--
--==============================================================================
-- helper procedure to activate/create an authentication within the application,
-- also used in wwv_flow_data_quick_flow, etc.
--
-- valid values for p_authentication_name:
--   (a) any authentication that already exists within the app
--   or (b) 'Oracle APEX', 'SSO', 'DATABASE', 'DBACCOUNT'
-- if (b) then the native authentication will be created, if it does not yet
-- exist.
--==============================================================================
procedure activate_in_app (
    p_app_id              in number,
    p_authentication_name in varchar2 );

--==============================================================================
-- helper routine for 4000:3890 (LDAP Test)
-- if authentication fails, this procedure raises last LDAP exception, see
-- wwv_flow_custom_auth_ldap.get_last_error.
--==============================================================================
procedure test_ldap_authentication (
    p_username           in varchar2,
    p_password           in varchar2,
    p_ldap_host          in varchar2,
    p_ldap_port          in number,
    p_use_ssl            in varchar2,
    p_use_exact_dn       in varchar2,
    p_ldap_string        in varchar2,
    p_search_filter      in varchar2,
    p_ldap_edit_function in varchar2,
    p_username_escaping  in varchar2,
    p_application_id     in number );

--==============================================================================
-- return the authentication scheme identifier for internal builder apps (APEX,
-- CLOUD_IDM, SSO, ...)
--==============================================================================
function get_internal_authentication
    return varchar2;

--==============================================================================
-- return whether the administrator and developer accounts in the workspace
-- user repository can be
--
-- if builder account management is external, administrators and developers can
-- not be created and edited via workspace admin (e.g. 4350:52 - Create User).
--
-- currently, only CLOUD_IDM authentication has truly external account
-- management. for all other authentication schemes, shadow users have to be
-- created manually via the workspace/instance admin gui.
--==============================================================================
function can_edit_builder_users
    return boolean;

--==============================================================================
-- return whether builder password needs to be set on create/edit
--==============================================================================
function is_builder_password_required (
    p_developer_yn in varchar2 )
    return boolean;

--==============================================================================
-- return a random password, for shadow users
--==============================================================================
function create_shadow_user_password
    return varchar2;

--==============================================================================
-- return whether the SSO authentication scheme can be used by the current
-- workspace
--==============================================================================
function can_use_sso_yn
    return varchar2;

--==============================================================================
-- return the default authentication scheme name for new applications
--==============================================================================
function get_authentication_for_new_app
    return varchar2;

--##############################################################################
--#
--# UTILITIES FOR 4050 (INTERNAL ADMINISTRATION)
--#
--##############################################################################

--==============================================================================
-- internal authentication scheme types
--==============================================================================
c_internal_scheme_prefix    constant varchar2(40) := 'PLUGIN_COM.ORACLE.APEX.AUTHN.INTERNAL.';
subtype t_internal_scheme_identifier is varchar2(10);
c_internal_scheme_apex      constant t_internal_scheme_identifier := 'APEX';
c_internal_scheme_sso       constant t_internal_scheme_identifier := 'SSO';
c_internal_scheme_cloud_idm constant t_internal_scheme_identifier := 'CLOUD_IDM';
c_internal_scheme_db        constant t_internal_scheme_identifier := 'DB';

--==============================================================================
-- instance parameter name for builder authentication
--==============================================================================
c_builder_instance_parameter constant varchar2(27) := 'APEX_BUILDER_AUTHENTICATION';

--==============================================================================
-- push authentication plugins of 4050 to other applications
--==============================================================================
procedure internal_push_plugins;

--==============================================================================
-- push changes to an authentication scheme to all other schemes of the same
-- type
--==============================================================================
procedure internal_push_changes (
    p_authentication_id  in number );

--==============================================================================
-- make an authentication scheme the current one for internal apps
--==============================================================================
procedure internal_make_current (
    p_authentication_id  in number );

--==============================================================================
-- make an authentication scheme the current one for internal apps
--==============================================================================
procedure internal_make_current (
    p_scheme_identifier  in t_internal_scheme_identifier );

--==============================================================================
-- return the current internal authentication scheme's name
--==============================================================================
function get_internal_scheme_name
    return varchar2;

--==============================================================================
-- reset internal authentication scheme to APEX and clear attributes that are
-- specific to the internal development environment
--==============================================================================
procedure reset_internal_authentication;

--##############################################################################
--#
--# BUILDER APEX AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Check user credentials for APEX accounts authentication
--==============================================================================
function plugin_authenticate_apex (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;

--##############################################################################
--#
--# BUILDER DB AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Check user credentials for DB accounts authentication
--==============================================================================
function plugin_authenticate_db (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;

--##############################################################################
--#
--# BUILDER LDAP AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Check user credentials for LDAP authentication
--==============================================================================
function plugin_authenticate_ldap (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;

--##############################################################################
--#
--# BUILDER CLOUD AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Check if session can be used
--==============================================================================
function plugin_sentry_cloud (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;

--==============================================================================
-- Redirect to login if invalid session
--==============================================================================
function plugin_invalid_session_cloud (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_inval_result;

--==============================================================================
-- Check user credentials
--==============================================================================
function plugin_authenticate_cloud (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;

--==============================================================================
-- Callback
--==============================================================================
function plugin_callback_cloud (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_ajax_result;

--==============================================================================
-- Compute logout url
--==============================================================================
function plugin_post_logout_cloud (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_logout_result;

--##############################################################################
--#
--# BUILDER HEADER AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Check if session can be used
--==============================================================================
function plugin_sentry_header (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;

--==============================================================================
-- Redirect to login if invalid session
--==============================================================================
function plugin_invalid_session_header (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_inval_result;

--==============================================================================
-- Check user credentials
--==============================================================================
function plugin_authenticate_header (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;

--==============================================================================
-- Callback
--==============================================================================
function plugin_callback_header (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_ajax_result;

--==============================================================================
-- Compute logout url
--==============================================================================
function plugin_post_logout_header (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_logout_result;

--##############################################################################
--#
--# BUILDER ORACLE SSO AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Check if session can be used
--==============================================================================
function plugin_sentry_osso (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;

--==============================================================================
-- Redirect to login if invalid session
--==============================================================================
function plugin_invalid_session_osso (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_inval_result;

--==============================================================================
-- Check user credentials
--==============================================================================
function plugin_authenticate_osso (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;

--==============================================================================
function plugin_callback_osso (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_ajax_result;

--==============================================================================
-- Compute logout url
--==============================================================================
function plugin_post_logout_osso (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_logout_result;

--##############################################################################
--#
--# BUILDER SOCIAL SIGN-IN AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Check if session can be used
--==============================================================================
function plugin_sentry_social (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;

--==============================================================================
-- Redirect to login if invalid session
--==============================================================================
function plugin_invalid_session_social (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_inval_result;

--==============================================================================
-- Check user credentials
--==============================================================================
function plugin_authenticate_social (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;

--==============================================================================
function plugin_callback_social (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_ajax_result;

--==============================================================================
-- Compute logout url
--==============================================================================
function plugin_post_logout_social (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_logout_result;

--##############################################################################
--#
--# BUILDER SAML AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- Check if session can be used
--==============================================================================
function plugin_sentry_saml (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;

--==============================================================================
-- Redirect to login if invalid session
--==============================================================================
function plugin_invalid_session_saml (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_inval_result;

--==============================================================================
-- Check user credentials
--==============================================================================
function plugin_authenticate_saml (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;

--==============================================================================
function plugin_callback_saml (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_ajax_result;

--==============================================================================
-- Compute logout url
--==============================================================================
function plugin_post_logout_saml (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_authentication_logout_result;

--==============================================================================
-- Deletes authentication and clears reference_id in subscribed component
--==============================================================================
procedure delete_authentication(
    p_authentication_id    in number,
    p_application_id       in number);

end wwv_flow_authentication_dev;
/
show err

