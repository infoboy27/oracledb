set define '^' verify off
prompt wwv_flow_authentication_api
create or replace package wwv_flow_authentication_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2011, 2024, Oracle and/or its affiliates.
--
--  The APEX_AUTHENTICATION package provides a public API for
--  authentication plug-in.
--
-- Filename: wwv_flow_authentication_api.sql
--
-- RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      cneumuel  05/23/2011 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Internal:
-- Native plugin authentication types
--------------------------------------------------------------------------------
subtype t_authentication_type is varchar2(30);

c_type_apex_accounts        constant t_authentication_type := 'NATIVE_APEX_ACCOUNTS';
c_type_ldap                 constant t_authentication_type := 'NATIVE_LDAP';
c_type_db_accounts          constant t_authentication_type := 'NATIVE_DB_ACCOUNTS';
c_type_open_door            constant t_authentication_type := 'NATIVE_OPEN_DOOR';
c_type_custom               constant t_authentication_type := 'NATIVE_CUSTOM';
c_type_dad                  constant t_authentication_type := 'NATIVE_DAD';
c_type_ias_sso              constant t_authentication_type := 'NATIVE_IAS_SSO';
c_type_http_header_variable constant t_authentication_type := 'NATIVE_HTTP_HEADER_VARIABLE';
c_type_cloud_idm            constant t_authentication_type := 'NATIVE_CLOUD_IDM';
c_type_social               constant t_authentication_type := 'NATIVE_SOCIAL';
c_type_saml                 constant t_authentication_type := 'NATIVE_SAML';
c_type_extension            constant t_authentication_type := 'NATIVE_EXTENSION';

--------------------------------------------------------------------------------
-- Constants:
--------------------------------------------------------------------------------
-- The default name for the username cookie
c_default_username_cookie constant varchar2(30) := 'LOGIN_USERNAME_COOKIE';

--==============================================================================
-- Result of Authentication Configuration Procedure.
--==============================================================================
subtype t_tenant_id  is varchar2(32);
type t_configuration is record (
    authentication_name         varchar2(255),
    substitutions               wwv_flow_t_varchar2,
    tenant_id                   t_tenant_id );

--==============================================================================
-- This procedure authenticates the user in the current session.
--
-- Login processing has the following steps:
-- 1. Run authentication scheme's pre-authentication procedure.
-- 2. Run authentication scheme's authentication function to check
--    the user credentials (p_username, p_password), returning TRUE on success.
-- 3. If result=true: run post-authentication procedure.
-- 4. If result=true: save username in session table.
-- 5. If result=true: set redirect url to deep link.
-- 6. If result=false: set redirect url to current page,
--    with an error message in the notification_msg parameter.
-- 7. Log authentication result.
-- 8. Redirect.
--
-- Parameters:
-- * p_username:            The user's name.
-- * p_password:            The user's password.
-- * p_uppercase_username:  If TRUE then P_USERNAME is converted to uppercase.
-- * p_set_persistent_auth: If TRUE then persistent authentication cookie is set.
--                           Persistent authentication needs to be enabled on instance level.
--
-- Example:
--
-- This example passes user credentials, username and password,
-- to the authentication scheme.
--
--     begin
--         apex_authentication.login (
--             p_username => 'JOE USER',
--             p_password => 'mysecret' );
--     end;
--
-- See Also:
-- POST_LOGIN
--==============================================================================
procedure login (
    p_username            in varchar2,
    p_password            in varchar2,
    p_uppercase_username  in boolean default true,
    p_set_persistent_auth in boolean default false );
--
--==============================================================================
-- This procedure authenticates the user in the current session. It runs a subset
-- of `APEX_AUTHENTICATION.LOGIN`, without steps 1 and 2. For steps, see `APEX_AUTHENTICATION.LOGIN`.
-- It is primarily useful in authentication schemes where user credentials checking
-- is done performed to Oracle APEX.
--
-- Parameters:
-- * p_username:           The user's name.
-- * p_password:           The user's password.
-- * p_uppercase_username: If `TRUE` then `P_USERNAME` is converted to uppercase.
--
-- Example:
--
-- This procedure call passes user credentials, username and password,
-- to the authentication scheme to finalize the user's authentication.
--
--     begin
--         apex_authentication.post_login (
--             p_username => 'JOE USER',
--             p_password => 'mysecret' );
--     end;
--
-- See Also:
-- LOGIN
--==============================================================================
procedure post_login (
    p_username           in varchar2,
    p_password           in varchar2 default null,
    p_uppercase_username in boolean  default true );

--==============================================================================
-- This function returns whether persistent cookies are enabled on the instance.
-- Instance administrators can control this value with the parameter
-- `WORKSPACE_NAME_USER_COOKIE`.
--
-- Returns:
-- This function returns TRUE if instance parameter `WORKSPACE_NAME_USER_COOKIE`
-- is set to Y or not set, and FALSE if set to N.
--==============================================================================
function persistent_cookies_enabled
    return boolean;

--==============================================================================
-- This procedure sends a cookie with the username.
--
-- Parameters:
-- * p_username:    The user's name.
-- * p_cookie_name: The cookie name which stores `P_USERNAME` in the browser.
-- * p_consent:     Control if the cookie should actually be sent.
--                  - If TRUE, assume the user gave consent to send the cookie.
--                  - If FALSE, do not send the cookie.
--                  - If there is no consent and the cookie already exists,
--                    the procedure overwrites the existing cookie value with NULL.
--                  This parameter is ignored and no cookie gets sent
--                  if `PERSISTENT_COOKIES_ENABLED` returns FALSE.
--
-- Example:
--
-- The example code below could be from a page submit process on a login page,
-- which saves the username in a cookie when consent is given.
-- `P101_REMEMBER_USERNAME` could be a switch.
-- On rendering, it could be set to Y when the cookie has a value.
--
--     begin
--         apex_authentication.send_login_username_cookie (
--             p_username => :P101_USERNAME,
--             p_consent  => :P101_REMEMBER_USERNAME = 'Y' );
--     end;
--
-- See Also:
-- GET_LOGIN_USERNAME_COOKIE
-- PERSISTENT_COOKIES_ENABLED
--==============================================================================
procedure send_login_username_cookie (
    p_username    in varchar2,
    p_cookie_name in varchar2 default c_default_username_cookie,
    p_consent     in boolean  default false );
--
--==============================================================================
-- This function reads the cookie with the username from the default login page.
--
-- Parameters:
-- * p_cookie_name: The cookie name which stores the username in the browser.
--
-- Example:
--
-- The example code below could be from a Before Header process.
-- It populates a text item `P101_USERNAME` with the cookie value and a switch
-- `P101_REMEMBER_USERNAME`, based on whether the cookie already has a value.
--
--     begin
--         :P101_USERNAME          := apex_authentication.get_login_username_cookie;
--         :P101_REMEMBER_USERNAME := case
--                                    when :P101_USERNAME is not null then 'Y'
--                                    else 'N'
--                                    end;
--     end;
--
-- See Also:
-- SEND_LOGIN_USERNAME_COOKIE
--==============================================================================
function get_login_username_cookie (
    p_cookie_name in varchar2 default c_default_username_cookie )
    return varchar2;
--
--==============================================================================
-- This procedure closes the session and redirects to the application's home page.
-- Call this procedure directly from the browser.
--
-- Parameters:
-- * p_session_id: The Oracle APEX session identifier of
--                 the session to close.
-- * p_app_id:     The database application identifier.
--
-- Example:
--
-- This example logs the session out.
--
--     begin
--         apex_authentication.logout (
--             p_session_id => :APP_SESSION,
--             p_app_id     => :APP_ID );
--     end;
--==============================================================================
procedure logout (
    p_session_id in number default null,
    p_app_id     in number default null );

--==============================================================================
-- This procedure is the landing resource for external login pages. Call this
-- procedure directly from the browser.
--
-- Note: The parameters which are marked with "OAuth2" should not be used for custom
-- callback URLs. They are only used if this procedure is used for Social Sign-In.
-- These parameters are defined by the OAuth2 spec.
--
-- Parameters:
-- * p_session_id:        The Oracle APEX session identifier.
-- * p_app_id:            The database application identifier.
-- * p_page_id:           Optional page identifier.
-- * p_ajax_identifier:   The system generated Ajax identifier.
--                        See `APEX_PLUGIN.GET_AJAX_IDENTIFIER`.
-- * p_x01 through p_x10: Optional parameters that the external login
--                        passes to the authentication plugin.
-- * state:               OAuth2.
-- * code:                OAuth2.
-- * error:               OAuth2.
-- * error_description:   OAuth2.
-- * error_uri:           OAuth2.
-- * error_reason:        OAuth2.
-- * error_code:          OAuth2.
-- * error_message:       OAuth2.
-- * authuser:            OAuth2.
-- * session_state:       OAuth2.
-- * prompt:              OAuth2.
-- * hd:                  OAuth2.
-- * scope:               OAuth2.
-- * realmID:             OAuth2.
-- * session_token:       OAuth2.
--
-- Example:
--
-- In this example, a redirect is performed to an external login page and
-- the callback is passed into Oracle APEX, which the external login
-- redirects to after successful authentication.
--
--     declare
--         l_callback varchar2(4000) := apex_application.get_callback_url;
--     begin
--         sys.owa_util.redirect_url(
--             'https://single-signon.example.com/my_custom_sso.login?p_on_success='||
--             sys.utl_url.escape (
--                 url                   => l_callback,
--                 escape_reserved_chars => true );
--         apex_application.stop_apex_engine;
--     end;
--
-- Example:
--
-- In this example, an external login page saves user data in a shared table
-- and performs a callback with a handle to the data. In Oracle APEX,
-- the callback activates the authentication plugin's ajax code.
-- It can take the value of X01 and fetch the actual user data from the shared table.
--
--```
-- ----create or replace package body my_custom_sso as
-- procedure login (
--     p_on_success in varchar2 )
-- is
--     l_login_id varchar2(32);
-- begin
--     l_login_id := rawtohex(sys.dbms_crypto.random(32));
--     insert into login_data(id, username) values (l_login_id, 'JOE USER');
--     sys.owa_util.redirect_url (
--         p_on_success || '&p_x01=' || l_login_id );
-- end;
-- ----end my_custom_sso;
-- ```
--
-- See Also:
-- GET_CALLBACK_URL
-- CALLBACK2
--==============================================================================
procedure callback (
    --
    -- Custom callback parameters
    --
    p_session_id      in number   default null,
    p_app_id          in number   default null,
    p_ajax_identifier in varchar2 default null,
    p_page_id         in number   default null,
    p_x01             in varchar2 default null,
    p_x02             in varchar2 default null,
    p_x03             in varchar2 default null,
    p_x04             in varchar2 default null,
    p_x05             in varchar2 default null,
    p_x06             in varchar2 default null,
    p_x07             in varchar2 default null,
    p_x08             in varchar2 default null,
    p_x09             in varchar2 default null,
    p_x10             in varchar2 default null,
    --
    -- OAuth2-related parameters
    --
    state             in varchar2 default null,
    code              in varchar2 default null,
    error             in varchar2 default null,
    error_description in varchar2 default null,
    error_uri         in varchar2 default null,
    error_reason      in varchar2 default null,
    error_code        in varchar2 default null,
    error_message     in varchar2 default null,
    authuser          in varchar2 default null,
    session_state     in varchar2 default null,
    prompt            in varchar2 default null,
    hd                in varchar2 default null,
    scope             in varchar2 default null,
    realmID           in varchar2 default null,
    session_token     in varchar2 default null );

--==============================================================================
-- This procedure is an alternative to CALLBACK.
--
-- See Also:
-- CALLBACK
--==============================================================================
procedure callback2 (
    --
    -- Custom callback parameters
    --
    p_session_id      in number   default null,
    p_app_id          in number   default null,
    p_ajax_identifier in varchar2 default null,
    p_page_id         in number   default null,
    p_x01             in varchar2 default null,
    p_x02             in varchar2 default null,
    p_x03             in varchar2 default null,
    p_x04             in varchar2 default null,
    p_x05             in varchar2 default null,
    p_x06             in varchar2 default null,
    p_x07             in varchar2 default null,
    p_x08             in varchar2 default null,
    p_x09             in varchar2 default null,
    p_x10             in varchar2 default null,
    --
    -- OAuth2-related parameters
    --
    state             in varchar2 default null,
    code              in varchar2 default null,
    error             in varchar2 default null,
    error_description in varchar2 default null,
    error_uri         in varchar2 default null,
    error_reason      in varchar2 default null,
    error_code        in varchar2 default null,
    error_message     in varchar2 default null,
    authuser          in varchar2 default null,
    session_state     in varchar2 default null,
    prompt            in varchar2 default null,
    hd                in varchar2 default null,
    scope             in varchar2 default null,
    realmID           in varchar2 default null,
    session_token     in varchar2 default null  );

--==============================================================================
-- This function is a plugin helper function to return a URL that is used as
-- a landing request for external login pages.
-- When the browser sends the request, it triggers the authentication plugin
-- ajax callback, which can be used to log the user in.
--
-- Parameters:
-- * p_x01 through p_x10: Optional parameters that the external login
--                        passes to the authentication plugin.
-- * p_callback_name:     Optional public name of the callback,
--                        defaults to `APEX_AUTHENTICATION.CALLBACK`.
--
-- See Also:
-- CALLBACK
--==============================================================================
function get_callback_url (
    p_x01             in varchar2 default null,
    p_x02             in varchar2 default null,
    p_x03             in varchar2 default null,
    p_x04             in varchar2 default null,
    p_x05             in varchar2 default null,
    p_x06             in varchar2 default null,
    p_x07             in varchar2 default null,
    p_x08             in varchar2 default null,
    p_x09             in varchar2 default null,
    p_x10             in varchar2 default null,
    p_callback_name   in varchar2 default null )
    return varchar2;

--==============================================================================
-- This function checks if the user is authenticated in the session and returns
-- TRUE if the user is already logged in or FALSE if the user of the current
-- session is not yet authenticated.
--
-- Example:
--
-- In this example, IS_AUTHENTICATED is used to emit the username
-- if the user has already logged in, or a notification if the user has not.
--
--     begin
--         if apex_authentication.is_authenticated then
--             sys.htp.p(apex_escape.html(:APP_USER)||', you are known to the system');
--         else
--             sys.htp.p('Please sign in');
--         end if;
--     end;
--
-- See Also:
-- IS_PUBLIC_USER
--==============================================================================
function is_authenticated
    return boolean;

--==============================================================================
-- This function checks if the user is not authenticated in the session.
-- A FALSE is returned if the user is already logged on or TRUE if the user of
-- the current session is not yet authenticated.
--
-- Example:
--
-- In this example, IS_PUBLIC_USER is used to show a notification
-- if the user has not already logged in or the username if the user has not.
--
-- ~~~
-- begin
--     if apex_authentication.is_public_user then
--         sys.htp.p('Please sign in');
--     else
--         sys.htp.p(apex_escape.html(:APP_USER)||', you are known to the system');
--     end if;
-- end;
-- ~~~
-- See Also:
-- IS_AUTHENTICATED
--==============================================================================
function is_public_user
    return boolean;

--==============================================================================
-- Landing resource for SAML authentication. To be called directly from the
-- browser by the SAML identity provider.
--
-- Parameters:
-- * SAMLResponse: The base64-encoded SAML response. For `GET` requests,
--                 APEX assumes that the data is also deflated.
-- * SAMLRequest:  Request from the IP to APEX (e.g. logout), same
--                 format as SAMLRESPONSE.
-- * RelayState:   APEX session specific data.
-- * SigAlg:       Signature algorithm.
-- * Signature:    Signature value.
--==============================================================================
procedure saml_callback (
    SAMLResponse      in varchar2 default null,
    SAMLRequest       in varchar2 default null,
    RelayState        in varchar2 default null,
    SigAlg            in varchar2 default null,
    Signature         in varchar2 default null );

--==============================================================================
-- Emit the SAML metadata for the given application or for the APEX instance.
--
-- Parameters:
-- * p_app_id:  The ID of the application for which service provider
--              metadata should be generated. If NULL or if the
--              application's SAML authentication is configured to
--              use instance mode, generate metadata using the SAML
--              instance attributes.
--
-- Example:
--
-- Download SAML metadata for app 101.
--
--   $ curl https://www.example.com/apex/apex_authentication.saml_metadata?p_app_id=101
--==============================================================================
procedure saml_metadata (
    p_app_id          in number default null );

--==============================================================================
-- This procedure will remove the Persistent Authentication entry for the
-- user's current browser.
--
-- Example:
--
-- In this example, the Persistant Authentication entry of the current
-- user will be deleted for the current browser.
--
--     begin
--         apex_authentication.remove_current_persistent_auth;
--     end;
--
-- See Also:
-- Login Procedure
--==============================================================================
procedure remove_current_persistent_auth;

--==============================================================================
-- This procedure will remove all Persistent Authentication entries
-- and end all related sessions in the current workspace.
--
-- Parameters:
-- * p_username: The user's name. Use NULL to remove persistent authentication
--               for all users of the workspace.
--
-- Example:
--
-- In this example, all Persistant Authentication entries for the given
-- user will be deleted and all sessions of this user will be ended in
-- the current workspace.
--
--     begin
--         apex_authentication.remove_persistent_auth(
--              p_username => :APP_USER );
--     end;
--
-- Example:
--
-- In this example, all Persistant Authentication entries for the current
-- workspace will be deleted and all sessions ended.
--
--     begin
--         apex_authentication.remove_persistent_auth(
--              p_username => null );
--     end;
--
--==============================================================================
procedure remove_persistent_auth (
    p_username in varchar2 );

--==============================================================================
-- This function returns whether persistent authenication is enabled on the instance.
-- Instance administrators can control this value with the parameter
-- `ALLOW_PERSISTENT_AUTHENTICATION`.
--
-- Returns:
--   This function returns TRUE if instance parameter
--   `ALLOW_PERSISTENT_AUTHENTICATION` is set to Y, and FALSE if set to N or not
--   set.
--
-- Example:
-- In this example, PERSISTENT_AUTH_ENABLED is used to show a notification
--
--     begin
--         if apex_authentication.persistent_auth_enabled then
--             sys.htp.p('Persistant Authentication enabled on Instance level');
--         else
--             sys.htp.p('Persisten Auhentication disabled');
--         end if;
--     end;
--==============================================================================
function persistent_auth_enabled
    return boolean;

end wwv_flow_authentication_api;
/
show errors
