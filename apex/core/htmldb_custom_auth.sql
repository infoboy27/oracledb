set define '^'
set verify off

prompt ...htmldb_custom_auth

Rem     NAME
Rem       htmldb_custom_auth.sql
Rem
Rem     SCRIPT ARGUMENTS
Rem       none
Rem
Rem     DESCRIPTION
Rem       Publicly executable for wwv_flow_custom_auth
Rem
Rem     RUNTIME DEPLOYMENT: YES
Rem
Rem     MODIFIED   (MM/DD/YYYY)
Rem       jstraub   10/08/2003 - Created
Rem       sspadafo  09/20/2004 - Add functions from wwv_flow_custom_auth_std and sso package
Rem       sspadafo  09/28/2004 - Remove sso procedures/functions
Rem       sspadafo  08/31/2007 - Added procedure remove_session (Bug 6146451)
Rem       sspadafo  01/03/2009 - Added p_secure out parameter to get_cookie_props
Rem       jstraub   03/22/2010 - Added p_use_ssl to ldap_authenticate and get_ldap_props
Rem       jstraub   03/26/2010 - Added p_use_exact_dn, p_search_filter to ldap_authenticate and get_ldap_props

create or replace package htmldb_custom_auth as
--##############################################################################
-- Copyright (c) 2003, 2024, Oracle and/or its affiliates.
--
-- You can use the `APEX_CUSTOM_AUTH` package to perform various operations related to authentication
-- and session management.
--
--! API package for flow developers using custom authentication.
--!
--!      These functions and procedures provide access to flow
--!      metadata and flow session state and provide wrappers
--!      for commonly used security-related modules.
--!
--!      Some of these modules are intended for use only within
--!      the flow engine runtime context, and others may be
--!      called from within any context, if so indicated.
--!
--!   SECURITY
--!      Executable via public synonym and grant
--
--     Modified:
--       jstraub   10/08/2003 - Created
--##############################################################################
--
--------------------------------------------------------------------------------
-- This function generates the next session ID from the Oracle APEX sequence generator.
--
-- Returns:
-- This function returns a number.
--
-- Example:
-- The following example generates the next session ID and stores it into a variable.
--
--     declare
--         val number;
--     begin
--         val := apex_custom_auth.get_next_session_id;
--     end;
--
-- See Also:
-- SET_SESSION_ID_TO_NEXT_VALUE
--------------------------------------------------------------------------------
function get_next_session_id
    --
    -- Context: HTML DB runtime
    -- Purpose: Generate next session id from sequence generator
    --
    return number;

--------------------------------------------------------------------------------
-- This function returns a number with the value of the security group ID that identifies the
-- workspace of the current user.
--
-- Example:
-- The following example retrieves the Security Group ID for the current user.
--
--     declare
--         val number;
--     begin
--         val := apex_custom_auth.get_security_group_id;
--     end;
--------------------------------------------------------------------------------
function get_security_group_id
    --
    -- Context: HTML DB runtime
    -- Purpose: Return the wwv_flow_security.g_security_group_id global
    --
    return number;

--------------------------------------------------------------------------------
-- This function checks for the existence of a page-level item within the current page of an
-- application.
--
-- Returns:
-- A Boolean value (`TRUE` or `FALSE`).
--
-- Parameters:
-- * p_item_name: The name of the page-level item.
--
-- Example:
-- The following example checks for the existence of a page-level item, `ITEM_NAME`, within the
-- current page of the application.
--
--     declare
--         l_val boolean;
--     begin
--        l_val := apex_custom_auth.application_page_item_exists(:item_name);
--         if l_val then
--             htp.p('The item exists.');
--         else
--             htp.p('The item does not exist.');
--         end if;
--     end;
--------------------------------------------------------------------------------
function application_page_item_exists (
    --
    -- Context: HTML DB runtime
    -- Purpose: Return boolean as to existence within the current
    --          flow page's metadata of a named page-level item.
    --
    p_item_name in varchar2 )
    return boolean;

--------------------------------------------------------------------------------
-- This function checks whether the current page's authentication attribute is set to `Page Is Public`
--
-- Returns:
-- A Boolean value (`TRUE` or `FALSE`).
--
-- Example:
-- The following example checks whether the current page in an application is public.
--
--     declare
--         l_val boolean;
--     begin
--         l_val := apex_custom_auth.current_page_is_public;
--         if l_val then
--             htp.p('The page is public.');
--         else
--             htp.p('The page is not public.');
--         end if;
--     end;
--------------------------------------------------------------------------------
function current_page_is_public
    --
    -- Context: HTML DB runtime
    -- Purpose: Return boolean corresponding to current flow
    --          page attribute PAGE_IS_PUBLIC_Y_N setting.
    --
    return boolean;

--------------------------------------------------------------------------------
-- This function returns a Boolean result based on the global package variable containing the current
-- Oracle APEX session ID.
--
-- Returns:
-- `TRUE` if the result is a positive number; returns `FALSE` if the result is a negative number.
--
-- Example:
-- The following example checks whether the current session ID is valid and exists.
--
--     declare
--         l_val boolean;
--     begin
--         l_val := apex_custom_auth.session_id_exists;
--         if l_val then
--             htp.p('The session ID exists.');
--         else
--             htp.p('The session ID does not exist.');
--         end if;
--     end;
--------------------------------------------------------------------------------
function session_id_exists
    --
    -- Context: HTML DB runtime
    -- Purpose: Return boolean if wwv_flow.g_instance is set/not set
    --
    return boolean;

--------------------------------------------------------------------------------
-- This function returns the `APEX_APPLICATION.G_USER` global variable (`VARCHAR2`).
--
-- Example:
-- The following example retrieves the username associated with the current session.
--
--     declare
--         val varchar2(256);
--     begin
--         val := apex_custom_auth.get_user;
--     end;
--
-- See Also:
-- SET_USER
-- APEX_APPLICATION.GLOBAL_VARIABLES
--------------------------------------------------------------------------------
function get_user
    --
    -- Context: HTML DB runtime
    -- Purpose: Return wwv_flow.g_user global
    --
    return varchar2;

--------------------------------------------------------------------------------
-- This function returns the `APEX_APPLICATION.G_INSTANCE` global variable (`NUMBER`).
--
-- Example:
-- The following example retrieves the session ID for the current user.
--
--     declare
--         val number;
--     begin
--         val := apex_custom_auth.get_session_id;
--     end;
--
-- See Also:
-- SET_SESSION_ID
--------------------------------------------------------------------------------
function get_session_id
    --
    -- Context: HTML DB runtime
    -- Purpose: Return wwv_flow.g_instance global
    --
    return number;

--------------------------------------------------------------------------------
-- This procedure sets the `APEX_APPLICATION.G_USER` global variable (`VARCHAR2`).
--
-- Parameters:
-- * p_user: The user ID to be registered.
--
-- Example:
-- In the following example, if the current application user is 'NOBODY', then  'JOHN.DOE' is
-- registered as the application user.
--
--     begin
--         if v('APP_USER') = 'NOBODY' then
--             apex_custom_auth.set_user('JOHN.DOE');
--         end if;
--     end;
--
-- See Also:
-- GET_USER
-- DEFINE_USER_SESSION
-- APEX_APPLICATION.GLOBAL_VARIABLES
--------------------------------------------------------------------------------
procedure set_user (
    --
    -- Context: HTML DB runtime
    -- Purpose: Set wwv_flow.g_user global
    --
    p_user in varchar2);

--------------------------------------------------------------------------------
-- This procedure sets the `APEX_APPLICATION.G_INSTANCE` global variable (`NUMBER`).
--
-- Parameters:
-- * p_session_id: The session ID to be registered.
--
-- Example:
-- In the following example, the session ID value registered is retrieved from the browser cookie.
--
--     begin
--         apex_custom_auth.set_session_id(apex_custom_auth.get_session_id_from_cookie);
--     end;
--
-- See Also:
-- GET_SESSION_ID
-- SET_SESSION_ID_TO_NEXT_VALUE
-- GET_SESSION_ID_FROM_COOKIE
-- DEFINE_USER_SESSION
--------------------------------------------------------------------------------
procedure set_session_id(
    --
    -- Context: HTML DB runtime
    -- Purpose: Set wwv_flow.g_instance global
    --
    p_session_id in number);

--------------------------------------------------------------------------------
-- This procedure combines the operation of `GET_NEXT_SESSION_ID` and `SET_SESSION_ID` in one call.
--
-- Example:
-- In the following example, if the current session is not valid, a new session ID is generated and
-- registered.
--
--     begin
--         if not apex_custom_auth.session_id_exists then
--             apex_custom_auth.set_session_id_to_next_value;
--         end if;
--     end;
--
-- See Also:
-- GET_NEXT_SESSION_ID
-- SET_SESSION_ID
-- SESSION_ID_EXISTS
--------------------------------------------------------------------------------
procedure set_session_id_to_next_value
    --
    -- Context: HTML DB runtime
    -- Purpose: Set wwv_flow.g_instance to next
    --          session id from sequence generator.
    --
    ;

--------------------------------------------------------------------------------
-- This procedure combines the `SET_USER` and `SET_SESSION_ID` procedures to create one call.
--
-- Parameters:
-- * p_user:       Login name of the user.
-- * p_session_id: The session ID.
--
-- Example:
-- In the following example, a new session ID is generated and registered along with the current
-- application user.
--
--     begin
--     apex_custom_auth.define_user_session (
--         :APP_USER,
--         apex_custom_auth.get_next_session_id);
--     end;
--
-- See Also:
-- SET_USER
-- SET_SESSION_ID
-- GET_NEXT_SESSION_ID
--------------------------------------------------------------------------------
procedure define_user_session(
    --
    -- Context: HTML DB runtime
    -- Purpose: Combine the functions of set_user and
    --          set_session_id to provide a concise API call
    --
    p_user in varchar2,
    p_session_id in number)
    ;
--------------------------------------------------------------------------------
-- This function returns user name registered with the current Oracle APEX session in the internal
-- sessions table. This user name is usually the same as the authenticated user running the current
-- page.
--
-- Example:
-- The following example retrieves the username registered with the current application session.
--
--     declare
--         val varchar2(256);
--     begin
--         val := apex_custom_auth.get_username;
--     end;
--------------------------------------------------------------------------------
function get_username
    --
    -- Context: htmldb application runtime
    -- Purpose: get username from wwv_flow_session$ for current session
    --
    return varchar2;
--------------------------------------------------------------------------------
-- This function returns the Oracle APEX session ID located by the session cookie in a page request
-- in the current browser session.
--
-- Example:
-- The following example retrieves the session ID from the current session cookie.
--
--     declare
--         val number;
--     begin
--         val := apex_custom_auth.get_session_id_from_cookie;
--     end;
--------------------------------------------------------------------------------
function get_session_id_from_cookie
    --
    -- Context: htmldb application runtime with cookie in cgi environment
    -- Purpose: get session id of current user based on cookie
    --
    return number;
--------------------------------------------------------------------------------
-- This function is a Boolean result obtained from executing the current application's authentication
-- scheme to determine if a valid session exists. This function returns the Boolean result of the
-- authentication scheme's page sentry.
--
-- Example:
-- The following example verifies whether the current session is valid.
--
--     declare
--         l_val boolean;
--     begin
--         l_val := apex_custom_auth.is_session_valid;
--         if l_val then
--             htp.p('valid');
--         else
--             htp.p('invalid');
--         end if;
--     end;
--------------------------------------------------------------------------------
function is_session_valid
    --
    -- Context: htmldb application runtime
    -- Purpose: determine if session exists and is valid
    --
    return boolean;
--------------------------------------------------------------------------------
-- Deprecated: Use `APEX_AUTHENTICATION.LOGOUT` instead.
-- ___
--
-- This procedure causes a logout from the current session by unsetting the session cookie and
-- redirecting to a new location.
--
-- Parameters:
-- * p_this_app:           Current application ID.
-- * p_next_app_page_sess: Application and page number to redirect to. Separate multiple pages using
--                         a colon (:) and optionally followed by a colon (:) and the session ID
--                         (if control over the session ID is desired).
-- * p_next_url:           URL to redirect to (use this instead of `p_next_app_page_sess`).
--
-- Example:
-- The following example causes a logout from the current session and redirects to page 99 of
-- application 1000.
--
--     begin
--         apex_custom_auth.logout (
--             p_this_app            => '1000',
--             p_next_app_page_sess  => '1000:99');
--     end;
--
-- See Also:
-- APEX_AUTHENTICATION.LOGOUT
--------------------------------------------------------------------------------
procedure logout(
    --
    -- Context: Use as redirect URL from navbar logout item and similar places
    -- Purpose: determine cookie for given flow, unset cookie, then redirect to url
    --          if p_next_url is passed in, else redirect to flow page using
    --          p_next_flow_page_sess
    --
    p_this_app            in varchar2 default null,
    p_next_app_page_sess  in varchar2 default null, -- assumed to be FLOW:PAGE:SESSION to redirect to
    p_next_url            in varchar2 default null) -- assumed to be full url to redirect to
    ;
--------------------------------------------------------------------------------
-- Needs Review: Mark internal or add to public documentation?
--------------------------------------------------------------------------------
procedure logout_then_go_to_page(
    --
    -- Context: Use as redirect URL from navbar logout item and similar places
    -- Purpose: wrapper for logout procedure when redirect to flow page is needed.
    --          Makes it easier to cram all the logout arguments into one for use in URLs
    --
    p_args in varchar2 default null) -- assumed to be THISFLOW:FLOW:PAGE:SESSION to redirect to
    ;
--------------------------------------------------------------------------------
-- Needs Review: Mark internal or add to public documentation?
--------------------------------------------------------------------------------
procedure remove_session
    ;
--------------------------------------------------------------------------------
-- Needs Review: Mark internal or add to public documentation?
--------------------------------------------------------------------------------
procedure logout_then_go_to_url(
    --
    -- Context: Use as redirect URL from navbar logout item and similar places
    -- Purpose: wrapper for logout procedure when redirect to free form url is needed.
    --          Makes it easier to cram all the logout arguments into one for use in URLs
    --
    p_args in varchar2 default null) -- assumed to be THISFLOW:URL to redirect to
    ;
--------------------------------------------------------------------------------
-- Needs Review: Mark internal or add to public documentation?
--------------------------------------------------------------------------------
function portal_sso_sentry_v1
    return boolean
    ;
--------------------------------------------------------------------------------
-- Also referred to as the Login API, this procedure performs authentication and session registration.
-- Note:Do not use bind variable notations for `p_session_id` argument.
--
-- Parameters:
-- * p_uname:          Login name of the user.
-- * p_password:       Clear text user password.
-- * p_session_id:     Current Oracle APEX session ID.
--                     Do not use bind variable notations for p_session_id argument.
-- * p_app_page:       Current application ID. After login page separated by a colon (:).
-- * p_entry_point:    Internal:
--                     Internal use only.
-- * p_preserve_case:  If `TRUE`, do not include `p_uname` in uppercase during session registration.
--
-- Example:
-- The following example performs the user authentication and session registration.
--     begin
--         apex_custom_auth.login (
--             p_uname       => 'FRANK',
--             p_password    => 'secret99',
--             p_session_id  => v('APP_SESSION'),
--             p_app_page    => :APP_ID||':1');
--     end;
--
-- See Also:
-- POST_LOGIN
--------------------------------------------------------------------------------
procedure login(
    --
    -- Context: any
    -- Purpose: Do after login page submit processing
    --          starting at the pre-authentication step.
    --
    p_uname             in varchar2 default null,
    p_password          in varchar2 default null,
    p_session_id        in varchar2 default null,
    p_app_page          in varchar2 default null,
    -- Internal:
    p_entry_point       in varchar2 default null,
    p_preserve_case     in boolean default false)
    ;
--------------------------------------------------------------------------------
-- This procedure performs session registration, assuming the authentication step has been completed.
-- It can be called only from within an Oracle APEX application page context.
--
-- Parameters:
-- * p_uname:          Login name of the user.
-- * p_session_id:     Current Oracle APEX session ID.
-- * p_app_page:       Current application ID. After login page separated by a colon (:).
-- * p_preserve_case:  If `TRUE`, do not include `p_uname` in uppercase during session registration.
--
-- Example:
-- The following example performs the session registration following a successful authentication.
--
--     begin
--         apex_custom_auth.post_login (
--             p_uname       => 'FRANK',
--             p_session_id  => v('APP_SESSION'),
--             p_app_page    => :APP_ID||':1');
--     end;
--
-- See Also:
-- POST_LOGIN
--------------------------------------------------------------------------------
procedure post_login(
    --
    -- Context: any
    -- Purpose: Do after login page submit processing
    --          starting at the post-authentication step.
    --
    p_uname             in varchar2 default null,
    p_session_id        in varchar2 default null,
    p_app_page          in varchar2 default null,
    p_preserve_case     in boolean default false)
    ;
--------------------------------------------------------------------------------
-- This procedure obtains the properties of the session cookie used in the current authentication
-- scheme for the specified application. These properties can be viewed directly in the App Builder
-- by viewing the authentication scheme cookie attributes.
--
-- Parameters:
-- * p_app_id:        An application ID in the current workspace.
-- * p_cookie_name:   The cookie name.
-- * p_cookie_path:   The cookie path.
-- * p_cookie_domain: The cookie domain.
-- * p_secure:        Flag to set secure property of cookie.
--
-- Example:
-- The following example retrieves the session cookie values used by the authentication scheme of
-- the current application.
--
--     declare
--         l_cookie_name   varchar2(256);
--         l_cookie_path   varchar2(256);
--         l_cookie_domain varchar2(256);
--         l_secure        boolean;
--     begin
--         apex_custom_auth.get_cookie_props(
--             p_app_id        => 2918,
--             p_cookie_name   => l_cookie_name,
--             p_cookie_path   => l_cookie_path,
--             p_cookie_domain => l_cookie_domain,
--             p_secure        => l_secure);
--     end;
--------------------------------------------------------------------------------
procedure get_cookie_props(
    --
    -- Context: any
    -- Purpose: get cookie properties for specified flow
    --
    p_app_id         in number,
    p_cookie_name   out varchar2,
    p_cookie_path   out varchar2,
    p_cookie_domain out varchar2,
    p_secure        out boolean)
    ;
--------------------------------------------------------------------------------
-- This function replaces any occurrences of a period character ( . ) with an underscore character ( _ )
-- in the passed in p_username value and then returns that newly massaged username value.
--
-- Parameters:
-- * p_username: Username value of end user.
--
-- Example:
-- The following example demonstrates how to return a username formatted for LDAP authentication.
--
-- begin
--     return apex_custom_auth.ldap_dnprep(
--         p_username => :USERNAME);
-- end;
--------------------------------------------------------------------------------
function ldap_dnprep(
    p_username in varchar2)
    return varchar2
   ;
--------------------------------------------------------------------------------
-- Needs Review: Mark internal or add to public documentation?
--------------------------------------------------------------------------------
function ldap_authenticate(
    --
    -- Context: any
    -- Purpose: verify credentials using ldap directory
    --
    p_username           in varchar2,
    p_password           in varchar2,
    p_ldap_host          in varchar2,
    p_ldap_port          in number,
    p_use_ssl            in varchar2 default 'N',
    p_use_exact_dn       in varchar2 default 'Y',
    p_ldap_string        in varchar2,
    p_search_filter      in varchar2 default null,
    p_ldap_edit_function in varchar2,
    p_owner              in varchar2)
    return boolean
    ;
--------------------------------------------------------------------------------
-- This procedure obtains the LDAP attributes of the current authentication scheme for the current
-- application. These properties can be viewed directly in App Builder by viewing the authentication
-- scheme attributes.
--
-- Parameters:
-- * p_ldap_host:          LDAP host name.
-- * p_ldap_port:          LDAP port number.
-- * p_use_ssl:            Whether SSL is used.
-- * p_use_exact_dn:       Whether exact distinguished names are used.
-- * p_ldap_dn:            LDAP DN string.
-- * p_search_filter:      The search filter used if exact DN is not used.
-- * p_ldap_edit_function: LDAP edit function name.
--
-- Example:
-- The following example retrieves the LDAP attributes associated with the current application.
--
--     declare
--         l_ldap_host          varchar2(256);
--         l_ldap_port          integer;
--         l_use_ssl            varchar2(1);
--         l_use_exact_dn       varchar2(1);
--         l_search_filter      varchar2(256);
--         l_ldap_dn            varchar2(256);
--         l_ldap_edit_function varchar2(256);
--     begin
--         apex_custom_auth.get_ldap_props (
--             p_ldap_host          => l_ldap_host,
--             p_ldap_port          => l_ldap_port,
--             p_use_ssl            => l_use_ssl,
--             p_use_exact_dn       => l_use_exact_dn,
--             p_search_filter      => l_search_filter,
--             p_ldap_dn            => l_ldap_dn,
--             p_ldap_edit_function => l_ldap_edit_function);
--     end;
--------------------------------------------------------------------------------
procedure get_ldap_props(
    --
    -- Context: in application
    -- Purpose: get ldap config for current application's authentication scheme
    --
    p_ldap_host          out varchar2,
    p_ldap_port          out integer,
    p_use_ssl            out varchar2,
    p_use_exact_dn       out varchar2,
    p_ldap_dn            out varchar2,
    p_search_filter      out varchar2,
    p_ldap_edit_function out varchar2)
    ;

end htmldb_custom_auth;
/
show errors
