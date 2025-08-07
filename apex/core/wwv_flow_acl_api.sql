set define '^' verify off
prompt ...wwv_flow_acl_api
create or replace package wwv_flow_acl_api as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2000 - 2022. All Rights Reserved.
--
-- The `APEX_ACL` package provides utilities that you can use when programming in
-- the Oracle APEX environment related to application access
-- control shared components.
-- You can use the `APEX_ACL` package to add, remove, or replace user roles.
-- You can also take advantage of the `INSTEAD OF` trigger on the `APEX_APPL_ACL_USERS`
-- view to edit user roles with DML statements (INSERT, UPDATE, and DELETE).
--
-- If the package is used outside of an Oracle APEX environment,
-- the `security_group_id` must be set using either `APEX_UTIL.SET_WORKSPACE` or
-- `APEX_UTIL.SET_SECURITY_GROUP_ID` before the call. 
-- Use the related APEX views `APEX_APPL_ACL_ROLES`, `APEX_APPL_ACL_USERS`, 
-- and `APEX_APPL_ACL_USER_ROLES` to get more information on application users and roles.
--------------------------------------------------------------------------------

--==============================================================================
-- This procedure assigns a role to a user.
--
-- Parameters:
-- * p_application_id: The application ID for which you want to assign a role to a user.
--                     Defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user
--                     to assign the role to.
-- * p_role_id:        The ID of the role.
--
-- Example:
--
-- The following example shows how to use the `ADD_USER_ROLE` procedure to assign
-- the role ID of `2505704029884282` to the user name called `SCOTT` in application `255`.
--
--     begin
--         apex_acl.add_user_role (
--             p_application_id => 255,
--             p_user_name      => 'SCOTT',
--             p_role_id        => 2505704029884282 );
--     end;
--==============================================================================
procedure add_user_role (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_role_id        in number );

--==============================================================================
-- This procedure assigns a role to a user.
--
-- Parameters:
-- * p_application_id: The application ID for which you want to assign a role to
--                     a user. Defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user
--                     to assign the role to.
-- * p_role_static_id: The case insensitive name of the role static ID.
--
-- Example:
--
-- The following example shows how to use the `ADD_USER_ROLE` procedure to assign 
-- the role static ID `ADMINISTRATOR` to the user name called `SCOTT` in 
-- application `255`.
--
--     begin
--         apex_acl.add_user_role (
--             p_application_id => 255,
--             p_user_name      => 'SCOTT',
--             p_role_static_id => 'ADMINISTRATOR' );
--     end;
--==============================================================================
procedure add_user_role (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_role_static_id in varchar2 );

--==============================================================================
-- This procedure removes an assigned role from a user.
--
-- Parameters:
-- * p_application_id: The application ID from which you want to remove
--                     an assigned role from a user.
--                     Defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user
--                     to remove the role from.
-- * p_role_id:        The ID of the role.
--
-- Example:
--
-- The following example shows how to use the `REMOVE_USER_ROLE` procedure to remove
-- the role ID of `2505704029884282` from the user name called `SCOTT` in 
-- application `255`.
--
--     begin
--         apex_acl.remove_user_role (
--             p_application_id => 255,
--             p_user_name      => 'SCOTT',
--             p_role_id        => 2505704029884282 );
--     end;
--==============================================================================
procedure remove_user_role (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_role_id        in number );

--==============================================================================
-- This procedure removes an assigned role from a user.
--
-- Parameters:
-- * p_application_id: The application ID from which you want to remove
--                     an assigned role from a user.
--                     It defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user
--                     to remove the role from.
-- * p_role_static_id: The case insensitive name of the role static ID.
--
-- Example:
--
-- The following example shows how to use the `REMOVE_USER_ROLE` procedure to remove
-- the role static ID `ADMINISTRATOR` from the user name `SCOTT` in application `255`.
--
--     begin
--         apex_acl.remove_user_role (
--             p_application_id => 255,
--             p_user_name      => 'SCOTT',
--             p_role_static_id => 'ADMINISTRATOR' );
--     end;
--==============================================================================
procedure remove_user_role (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_role_static_id in varchar2 );

--==============================================================================
-- This procedure replaces any existing assigned user roles with a new array of roles.
--
-- Parameters:
-- * p_application_id: The application ID for which you want to replace the user 
--                     role. Defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user
--                     whose role to replace.
-- * p_role_ids:       The array of NUMBER type role IDs.
--
-- Example:
--
-- The following example shows how to use the `REPLACE_USER_ROLES` procedure
-- to replace any existing roles to new role IDs of `2505704029884282`, `345029884282`
-- for the user name called `SCOTT` in application `255`.
--
--     begin
--         apex_acl.replace_user_roles (
--             p_application_id => 255,
--             p_user_name      => 'SCOTT',
--             p_role_ids       => apex_t_number( 2505704029884282, 345029884282 ) );
--     end;
--==============================================================================
procedure replace_user_roles (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_role_ids       in wwv_flow_t_number );

--==============================================================================
-- This procedure replaces any existing assigned user roles with a new array of roles.
--
-- Parameters:
-- * p_application_id:  The application ID for which you want to replace the user
--                      roles. Defaults to the current application.
-- * p_user_name:       The case insensitive name of the application user
--                      whose role to replace.
-- * p_role_static_ids: The array of case insensitive VARCHAR2 type role static IDs.
--
-- Example:
--
-- The following example shows how to use the `REPLACE_USER_ROLES` procedure
-- to replace existing roles with new role static IDs of `ADMINISTRATOR` and
-- `CONTRIBUTOR` for the user name called `SCOTT` in application `255`.
--
--     begin
--         apex_acl.replace_user_roles (
--             p_application_id  => 255,
--             p_user_name       => 'SCOTT',
--             p_role_static_ids => apex_t_varchar2( 'ADMINISTRATOR', 'CONTRIBUTOR' ) );
--     end;
--==============================================================================
procedure replace_user_roles (
    p_application_id  in number   default wwv_flow_security.g_flow_id,
    p_user_name       in varchar2,
    p_role_static_ids in wwv_flow_t_varchar2 );

--==============================================================================
-- This procedure removes all assigned roles from a user.
--
-- Parameters:
-- * p_application_id: The application ID for which you want to remove
--                     all assigned roles from a user.
--                     Defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user
--                     to remove all assigned roles from.
--
-- Example:
--
-- The following example shows how to use the `REMOVE_ALL_USER_ROLES` procedure
-- to remove all assigned roles from the user name called `SCOTT` in application `255`.
--
--     begin
--         apex_acl.remove_all_user_roles (
--             p_application_id => 255,
--             p_user_name      => 'SCOTT' );
--     end;
--==============================================================================
procedure remove_all_user_roles (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2 );

--==============================================================================
-- This function returns `TRUE` if the user is assigned to the specified role.
--
-- Parameters:
-- * p_application_id: The application ID for which you want to check
--                     if a user is assigned to the specific role.
--                     Defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user to check.
--                     It defaults to the current logged in user.
-- * p_role_static_id: The case insensitive name of the role static ID.
--
-- Example:
--
-- The following example shows how to use the `HAS_USER_ROLE` function to check
-- if the user name called `SCOTT` is assigned to the role static ID of 
-- `ADMINISTRATOR` in application `255`.
--
--     declare
--         l_is_admin boolean := false;
--     begin
--         l_is_admin := apex_acl.has_user_role (
--                           p_application_id  => 255,
--                           p_user_name       => 'SCOTT'`
--                           p_role_static_id  => 'ADMINISTRATOR' );
--
--         if not l_is_admin then
--             raise_application_error(-20001, 'Scott is NOT an administrator' );
--         end if;
--     end;
--==============================================================================
function has_user_role (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2 default wwv_flow.g_user,
    p_role_static_id in varchar2 )
    return boolean;

--==============================================================================
-- This function returns `TRUE` when the specified user is assigned to any 
-- application role. This function can be used to check if a user is permitted 
-- to access an application.
--
-- Parameters:
-- * p_application_id: The application ID for which you want to check
--                     if a user is assigned to any application role.
--                     It defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user to check.
--                     Defaults to the current logged in user.
-- Example:
--
-- The following example shows how to use the `HAS_USER_ANY_ROLES` function to check
-- if the user name called `SCOTT` is assigned to any application role
-- in application `255`.
-- ```
-- declare
--     l_has_user_any_roles boolean := false;
-- begin
--     l_has_user_any_roles := apex_acl.has_user_any_roles (
--                                 p_application_id  => 255,
--                                 p_user_name       => 'SCOTT' );
--     
--    if not l_has_user_any_roles then
--         raise_application_error(-20001, 'Scott is not assigned to any application role!' );
--    end if;
-- end;
-- ```
--==============================================================================
function has_user_any_roles (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2 default wwv_flow.g_user )
    return boolean;

--==============================================================================
-- This function is used to ensure that a user cannot remove a role (identified by 
-- p_role_static_id) from himself.
--
-- Returns:
-- *  `TRUE`, when p_user_name currently has the role identified by p_role_static_id,
-- but the roles identified by p_role_ids do not include the role identified by 
-- p_role_static_id. 
-- * `FALSE` in all other cases.
--
-- Parameters:
-- * p_application_id: The application ID for which you want to check
--                     if a specific role is removed from the list of roles from a user.
--                     It defaults to the current application.
-- * p_user_name:      The case insensitive name of the application user to check.
--                     Defaults to the current logged in user.
-- * p_role_static_id: The case insensitive name of the role static ID to check if it is removed.
-- * p_role_ids:       The array of NUMBER type new role IDs the user is assigned to.
--
-- Example:
-- The following example uses `IS_ROLE_REMOVED_FROM_USER` to ensure that the current user of the app,
-- who has the role `ADMINISTRATOR` in the current app, does not remove him/herself from 
-- the role when updating or deleting the access.
--
--      begin
--          if :P1_USER_NAME = :APP_USER
--             and apex_acl.is_role_removed_from_user (
--                      p_application_id => :APP_ID,
--                      p_user_name => :APP_USER,
--                      p_role_static_id => 'ADMINISTRATOR',
--                      p_role_ids => apex_string.split_numbers(
--                                              p_str => case when :REQUEST = 'DELETE' then
--                                                           null
--                                                       else
--                                                           :P1_ROLE_IDS
--                                                       end,
--                                              p_sep => ':') ) then
--          
--              raise_application_error(-20001, 'You cannot remove administrator role from yourself.' );
--          end if;
--      end;
--==============================================================================
function is_role_removed_from_user (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_role_static_id in varchar2,
    p_role_ids       in wwv_flow_t_number )
    return boolean;

--==============================================================================
-- Internal:
-- assigns an array of roles to a user
--==============================================================================
procedure add_user_roles (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_role_ids       in wwv_flow_t_number );

--==============================================================================
-- Internal:
-- assigns an array of roles to a user
--==============================================================================
procedure add_user_roles (
    p_application_id  in number   default wwv_flow_security.g_flow_id,
    p_user_name       in varchar2,
    p_role_static_ids in wwv_flow_t_varchar2 );

end wwv_flow_acl_api;
/
show errors;
