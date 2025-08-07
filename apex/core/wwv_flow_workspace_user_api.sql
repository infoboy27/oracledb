set define '^' verify off
prompt ...wwv_flow_workspace_user_api.sql
create or replace package wwv_flow_workspace_user_api authid current_user as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2019. All Rights Reserved.
--
-- NAME
--   wwv_flow_workspace_user_api.sql - APEX_WORKSPACE_USER
--
-- DESCRIPTION
--   Mid-term, this package will provide all necessary APIs for workspace user
--   management and the old ones in APEX_UTIL will be deprecated. For now (5.1),
--   we just expose the new required APIs for ORDS.
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             YES
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  06/13/2016 - Created
--   cneumuel  07/25/2018 - Added verify_session (bug #28102037)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Kind of user
--==============================================================================
subtype t_account_type is pls_integer range 1 .. 3;
c_account_type_admin           constant t_account_type := 1; -- workspace administrator
c_account_type_dev             constant t_account_type := 2; -- developer
c_account_type_user            constant t_account_type := 3; -- end user

--==============================================================================
-- Workspace user type
--==============================================================================
type t_user is record (
    security_group_id          wwv_flow_fnd_user.security_group_id%type, -- workspace id
    user_id                    wwv_flow_fnd_user.user_id%type,           -- numeric user id
    --
    user_name                  wwv_flow_fnd_user.user_name%type,         -- user name
    email_address              wwv_flow_fnd_user.email_address%type,     -- email address
    --
    account_type               t_account_type,                           -- account type
    --
    account_locked             boolean,                                  -- is account locked?
    account_expiry             wwv_flow_fnd_user.account_expiry%type,    -- password expiry date
    --
    change_password_on_first_use boolean,                                -- does password have to be changed on 1st use?
    first_password_use_occurred  boolean                                 -- has the password already been used?
);

--==============================================================================
-- Authentication status
--==============================================================================
subtype t_auth_status is pls_integer range 0 .. 9;
c_auth_success                 constant t_auth_status := 0;  -- successful login
c_auth_invalid_credentials     constant t_auth_status := 1;  -- bad user/password combination
c_auth_locked                  constant t_auth_status := 2;  -- user account is locked
c_auth_change_password         constant t_auth_status := 3;  -- user must change password
c_auth_delayed                 constant t_auth_status := 9;  -- login delayed, too many attempts

--==============================================================================
-- Result type for function authenticate
--==============================================================================
type t_authentication_result is record (
    status                     t_auth_status,      -- was authentication successful / why did it fail
    delay_sec                  number,             -- if status=c_auth_delayed, nr of seconds to pass before the next login
    user                       t_user,             -- user information
    all_group_names            wwv_flow_t_varchar2 -- names of all (recursively) assigned groups
);

--==============================================================================
-- Verify user credentials. This function is meant to be used for password
-- checking outside of an APEX context.
--
-- PARAMETERS
-- * p_user_name:              User name
-- * p_password:               User password
-- * p_workspace:              User's workspace name. If null and a current
--                             workspace is set, verifies the user in this
--                             workspace. If null and no current workspace is
--                             set, looks up the workspace via CURRENT_USER.
--
-- RETURNS
-- * A t_authentication_result record
--
-- RAISES
-- * WWV_FLOW_API.SGID_NOT_SET: Workspace for user can not be found or the
-- caller has no privileges for the workspace.
--
-- EXAMPLE
--   Verify password of user EXAMPLEUSER in workspace SALES and print
--   authentication status.
--
--   declare
--       l_auth apex_workspace_user.t_authentication_result;
--   begin
--       l_auth := apex_workspace_user.authenticate (
--                     p_user_name => 'EXAMPLEUSER',
--                     p_password  => '...password...',
--                     p_workspace => 'SALES' );
--       case l_auth.status
--       when apex_workspace_user.c_auth_success then
--           sys.dbms_output.put_line('Logged in');
--       when apex_workspace_user.c_auth_change_password then
--           sys.dbms_output.put_line('Please change password');
--       when apex_workspace_user.c_auth_locked then
--           sys.dbms_output.put_line('Account locked');
--       when apex_workspace_user.c_auth_delayed then
--           sys.dbms_output.put_line('Please wait '||l_auth.delay_sec||' sec');
--       else
--           sys.dbms_output.put_line('Invalid credentials');
--       end case;
--   end;
--==============================================================================
function authenticate (
    p_user_name                in varchar2,
    p_password                 in varchar2,
    p_workspace                in varchar2 default null )
    return t_authentication_result;

--==============================================================================
-- Use this function from non-APEX web applications, to verify session
-- information and return authentication/user information.
--
-- PARAMETERS
-- * p_app_id:                 Application ID.
-- * p_session_id:             Application session.
--
-- RETURNS
-- * A t_authentication_result record. On success, the status will be
--   c_auth_success and the user/group information can be used. If verification
--   fails, e.g. because the session does not exist, is not yet authenticated or
--   the session id does not match the cookie, status will be
--   c_auth_invalid_credentials and all other attributes will be null.
--
-- EXAMPLE
--   Print the logged in user for app 100 and session 12345678.
--
--   declare
--       l_owa_names  sys.owa.vc_arr;
--       l_owa_values sys.owa.vc_arr;
--       l_auth apex_workspace_user.t_authentication_result;
--   begin
--       --
--       -- set up OWA environment with session cookie
--       --
--       l_owa_names(1)  := 'COOKIE';
--       l_owa_values(1) := 'ORA_WWV_APP_100=ORA_WWV-abcdef';
--       sys.owa.init_cgi_env(l_owa_names.count, l_owa_names, l_owa_values);
--       --
--       -- verify session
--       --
--       l_auth := apex_workspace_user.verify_session (
--                     p_app_id     => 100,
--                     p_session_id => 12345678 );
--       --
--       -- print result
--       --
--       if l_auth.status = apex_workspace_user.c_auth_success then
--           sys.dbms_output.put_line('User:'||l_user.user_name);
--       else
--           sys.dbms_output.put_line('Verification failed');
--       end if;
--   end;
--==============================================================================
function verify_session (
    p_app_id                   in number,
    p_session_id               in number )
    return t_authentication_result;

end wwv_flow_workspace_user_api;
/
show err

