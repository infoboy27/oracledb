set define '^' verify off
prompt ...wwv_flow_authentication
create or replace package wwv_flow_authentication as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2011, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_authentication.sql
--
--    DESCRIPTION
--      This package provides an internal API for authentication plugins
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/17/2011 - Created
--
--------------------------------------------------------------------------------

type t_authentication_result is record (
    is_valid     boolean,
    redirect_url varchar2(32767) );

type t_failed_login_counter is record (
    method_name    varchar2(30),
    counting       boolean,
    login_attempts pls_integer,
    last_login     date );

type t_login_throttle is record (
    username_counter    t_failed_login_counter,
    ip_counter          t_failed_login_counter,
    username_ip_counter t_failed_login_counter,
    delay_increase      pls_integer,
    delay_seconds       pls_integer );

--##############################################################################
--#
--# U T I L I T Y   F U N C T I O N S
--#
--##############################################################################

--==============================================================================
-- Perform substitutions and set defaults for cookie name and path.
-- Cookie Name:
--   - For INTERNAL, substitute &INSTANCE_ID.
--   - &WORKSPACE_COOKIE. is the shared workspace cookie.
--   - &DBID / &DBID. is V$DATABASE.DBID.
-- Cookie Path:
--   - replace &CGI_SCRIPT_NAME.
-- Use Secure Cookie:
--   - Override value if instance parameter REQUIRE_HTTPS is set
--==============================================================================
procedure substitute_cookie_attributes (
    p_app_id               in            number,
    p_security_group_id    in            number,
    p_cookie_name          in out nocopy varchar2,
    p_cookie_path          in out nocopy varchar2,
    p_use_secure_cookie_yn in out nocopy varchar2 );

--==============================================================================
-- get authentication scheme type of current application.
-- this has to be run after the metadata has been loaded, e.g. via
-- authenticate_and_init_session.
--==============================================================================
function get_scheme_type
    return wwv_flow_authentications.scheme_type%type;

--==============================================================================
-- helper function to get the builtin login url in app 4155 for the current
-- page and session.
--==============================================================================
function get_builtin_login_url return varchar2;

--==============================================================================
-- get cookie properties for specified application
--==============================================================================
procedure get_cookie_properties (
    p_app_id            in  number,
    p_authentication_id in  number default null,
    p_security_group_id in  number default null,
    p_cookie_name       out varchar2,
    p_cookie_path       out varchar2,
    p_cookie_domain     out varchar2,
    p_secure            out boolean );

--==============================================================================
-- Like get_cookie_properties, but get just the cookie name.
--==============================================================================
function get_cookie_name (
    p_app_id            in number,
    p_authentication_id in number default null,
    p_security_group_id in number default null )
    return varchar2;

--==============================================================================
-- Helper function for authorizations
--
-- Return if the current page is the invalid session (i.e. login) page
--==============================================================================
function is_invalid_session_page
    return boolean;

--==============================================================================
-- Helper function for authorizations
--
-- Return if the current page is a public page
--==============================================================================
function is_public_page
    return boolean;

--==============================================================================
-- return the REQUIRE_HTTPS instance preference
--==============================================================================
function require_https
    return varchar2;

--==============================================================================
-- determine whether session joining is allowed
--==============================================================================
function rejoin_existing_sessions (
    p_app_id                       in wwv_flows.id%type,
    p_app_browser_frame            in wwv_flows.browser_frame%type,
    p_app_rejoin_existing_sessions in wwv_flows.rejoin_existing_sessions%type,
    p_page_info                    in wwv_flow_page.t_page_info )
    return wwv_flows.rejoin_existing_sessions%type;

--==============================================================================
-- Encrypt parameters for ajax callback.
--
-- RETURNS
--   Encrypted string, contains app id, page id, session id and ajax identifier.
--
-- SEE ALSO
--   decrypt_ajax_parameters
--==============================================================================
function encrypt_ajax_parameters
    return varchar2;

--==============================================================================
-- Decrypt parameters of ajax callback.
--
-- PARAMETERS
--   * p_encrypted_parameters: Encrypted string of parameters
--
-- RETURNS
--   PL/SQL table containing app id, page id, session id and ajax identifier.
--
-- SEE ALSO
--   encrypt_ajax_parameters, wwv_flow_authentication_api.callback
--==============================================================================
function decrypt_ajax_parameters (
    p_encrypted_parameters in varchar2 )
    return wwv_flow_t_varchar2;

--==============================================================================
-- return the url to redirect to.
--
-- if it's a normal f, ws or show request:
--   just return the requested url with session id replaced. also remove
--   success / notification message and session checksum to avoid checksum
--   errors.
--   if the request is APEX_CLONE_SESSION or APEX_AUTHENTICATION=..., we must
--   remove that to prevent a loop that creates new sessions. if the url has a
--   checksum and cloning was actually done, we have to re-create the checksum.
--   otherwise, we remove it and strip the url of any payload, because removing
--   the request would have broken the checksum. When we remove the request
--   part, we also call prepare_url, which adds the checksum and also encodes
--   item values. We can not call it for other requests, because that may lead
--   to double escaping later on.
-- otherwise:
--   create a url from the global variables of wwv_flow.
--==============================================================================
function build_redirect_url (
    p_full          in boolean default false,
    p_clone_session in boolean default false )
    return varchar2;

--==============================================================================
-- On cloud, we need to prevent any user entered code to run in internal apps
-- auth schemes.
--
-- Return the given code unmodified, when one of the following is true:
--
-- * code is null
-- * not running in cloud mode
-- * not running in internal app
-- * running on 4000:3890, the builder test LDAP page
-- * running on app 4155, the open door login app
--
-- Otherwise, return null.
--==============================================================================
function filter_user_auth_code (
    p_code in varchar2 )
    return varchar2;

--##############################################################################
--#
--# PACKAGED APP UTILITIES
--#
--##############################################################################

--==============================================================================
-- return current authentication scheme of given application
--==============================================================================
function get_current (
    p_app_id                   in number )
    return wwv_flow_authentications%rowtype;

--==============================================================================
-- delete unused authentication schemes for a given application
--==============================================================================
procedure delete_unused (
    p_app_id                   in  number );

--==============================================================================
-- update current authentication scheme of given application
--==============================================================================
procedure update_current (
    p_app_id                   in number,
    p_scheme_type              in varchar2,
    p_name                     in varchar2,
    p_use_secure_cookie_yn     in varchar2 default null,
    p_attribute_01             in varchar2 default null,
    p_attribute_02             in varchar2 default null,
    p_attribute_03             in varchar2 default null,
    p_attribute_04             in varchar2 default null,
    p_attribute_05             in varchar2 default null,
    p_attribute_06             in varchar2 default null,
    p_attribute_07             in varchar2 default null,
    p_attribute_08             in varchar2 default null,
    p_attribute_09             in varchar2 default null,
    p_attribute_10             in varchar2 default null,
    p_attribute_11             in varchar2 default null,
    p_attribute_12             in varchar2 default null,
    p_attribute_13             in varchar2 default null,
    p_attribute_14             in varchar2 default null,
    p_attribute_15             in varchar2 default null );

--==============================================================================
-- update current authentication scheme of given application with
-- authentication record of another (possibly already deleted) application. the
-- procedure corrects the flow_id and id references to make p_authentication a
-- valid current authentication for p_app_id.
--==============================================================================
procedure update_current (
    p_app_id                   in number,
    p_authentication           in wwv_flow_authentications%rowtype );

--##############################################################################
--#
--# S E S S I O N   I N I T I A L I Z A T I O N
--#
--##############################################################################

--==============================================================================
-- Show/accept interface
--
-- The function to start authentication and initialize the session.
--==============================================================================
function authenticate_and_init_session (
    p_app_id                  in number,
    p_auth_override           in varchar2 default null,
    p_has_safe_url_parameters in boolean default null,
    p_clone_session           in boolean default false )
    return t_authentication_result;

--##############################################################################
--#
--# L O G I N / L O G O U T
--#
--##############################################################################

--==============================================================================
-- Utility procedure to restrict access to internal apps on 1st access to the
-- application. If access is restricted, APEX stops with HTTP 403.
--==============================================================================
procedure restrict_access;

--==============================================================================
-- login interface
--
-- the entry point to the engine to perform user/password authentication.
--
-- ARGUMENTS
-- * p_username                    the end user's name
-- * p_password                    the end user's password
-- * p_current_app_id
-- * p_next_app_id
-- * p_next_page_id
-- * p_post_login                  if true, do not call pre-authentication and
--                                 authentication function, i.e. no credentials
--                                 hecking
-- * p_builder_login_for_workspace when called from wwv_flow_login.builder: the
--                                 workspace where the user wants to login. null
--                                 otherwise.
-- * p_set_persistent_auth         if true and persistent auth is enabled, set
--                                 persistent authentication fingerprint cookie
--                                 in browser and store complementary data in db.
--==============================================================================
procedure execute_login (
    p_username                    in varchar2,
    p_password                    in varchar2,
    p_current_app_id              in number,
    p_next_app_id                 in number,
    p_next_page_id                in number,
    p_post_login                  in boolean default false,
    p_builder_login_for_workspace in number  default null,
    p_set_persistent_auth         in boolean default false );

--==============================================================================
-- custom_auth_std.logout interface
--
-- log out of session, using the authentication scheme of p_app_id.
--==============================================================================
procedure execute_logout (
    p_session_id in number,
    p_app_id     in number );

--##############################################################################
--#
--# L O G I N   T H R O T T L E
--#
--##############################################################################

--==============================================================================
-- if workspace expiry is enabled, create a record with the number of seconds
-- that login has to be delayed because of past login attempts.
-- if workspace expiry is disabled, return an empty record.
--==============================================================================
function create_login_throttle (
    p_security_group_id in number default wwv_flow_security.g_security_group_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_username          in varchar2 )
    return t_login_throttle;

--==============================================================================
-- if workspace expiry is disabled, do nothing.
-- elsif p_throttle contains a delay, set p_authentication to failed because of
-- the login delay.
-- elsif p_add_1_failure, add a login failure and re-compute the delay.
--==============================================================================
procedure apply_login_throttle (
    p_throttle       in out nocopy t_login_throttle,
    p_authentication in out nocopy wwv_flow_plugin_api.t_authentication_auth_result,
    p_add_1_failure  in boolean default false );

--==============================================================================
-- add javascript code for login throttle timer
--==============================================================================
procedure add_login_throttle_onload_code;

--##############################################################################
--#
--# L O G G I N G
--#
--##############################################################################

--==============================================================================
-- write successful and failed login attempts to the access log.
--==============================================================================
procedure log_login (
    p_username               in varchar2,
    p_security_group_id      in number   default wwv_flow_security.g_security_group_id,
    p_owner                  in varchar2 default wwv_flow_security.g_parse_as_schema,
    p_application_id         in number   default wwv_flow_security.g_flow_id,
    p_authentication_method  in varchar2,
    p_authentication_result  in number,
    p_custom_status_text     in varchar2 default null );

--==============================================================================
-- Log an authentication error and redirect to the invalid session URL with
-- notification message.
--==============================================================================
procedure log_and_redirect_on_auth_error (
    p_authentication_method in varchar2,
    p_status_text           in varchar2,
    p_notification_msg      in varchar2 );

--==============================================================================
-- This procedure will remove the Persistent Authentication entry for the
-- current user's browser.
--==============================================================================
procedure remove_current_persistent_auth;

--==============================================================================
-- This procedure will remove all Persistent Authentication entries
-- and end all related sessions in the current workspace.
--
-- Parameters:
-- * p_username: The user's name. Use NULL to remove persistent authentication
--               for all users of the workspace.
--==============================================================================
procedure remove_persistent_auth(
    p_username in varchar2 );


--==============================================================================
-- Returns whether persistent authentication is enabled or not for instance
--==============================================================================
function is_persistent_auth_enabled
    return boolean;

end wwv_flow_authentication;
/
show errors
