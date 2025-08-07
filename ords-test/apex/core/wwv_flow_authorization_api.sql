set define '^' verify off
prompt ...wwv_flow_authorization_api.sql
create or replace package wwv_flow_authorization_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--  The APEX_AUTHORIZATION package contains public utility functions used for
--  controlling and querying access rights to the application.
--
--------------------------------------------------------------------------------

--==============================================================================
-- This procedure resets the authorization caches for the session and
-- forces a re-evaluation when an authorization is checked next.
--
-- Example:
--
-- This examples resets the authorization cache.
--
--     begin
--         apex_authorization.reset_cache;
--     end;
--==============================================================================
procedure reset_cache;

--==============================================================================
-- Determine if the current user passes the authorization with name
-- `P_AUTHORIZATION_NAME`. For performance reasons, authorization results are cached.
-- Because of this, the function may not always evaluate the authorization when called,
-- but take the result out of the cache.
--
-- Parameters:
-- * p_authorization_name: The name of an authorization scheme in the application.
--
-- Returns:
-- `TRUE`, if the authorization is successful, `FALSE` otherwise.
--
-- Example:
--
-- This example prints the result of the authorization `User Is Admin`.
--
--     begin
--         sys.htp.p('User Is Admin: '||
--                   case apex_authorization.is_authorized (
--                       p_authorization_name => 'User Is Admin' )
--                   when true then 'YES'
--                   when false then 'NO'
--                   else 'null'
--                   end);
--     end;
--==============================================================================
function is_authorized (
    p_authorization_name in varchar2 )
    return boolean;

--==============================================================================
-- This procedure enables groups in the current session.
-- These groups do not have to be created in the Oracle APEX workspace repository,
-- but can be loaded from an LDAP repository or retrieved from a trusted HTTP header.
-- Enabling a group that exists in the workspace repository
-- and has other groups granted to it, also enables the granted groups.
--
-- If Real Application Security, available with Oracle Database Release 12g,
-- is enabled for the authentication scheme, all dynamic groups are enabled as
-- RAS dynamic or external groups (depending whether the group exists
-- in `dba_xs_dynamic_roles`).
--
-- This procedure must be called during or right after authentication
-- for example, in a post-authentication procedure.
--
-- Parameters:
-- * p_group_names: Table of group names.
--
-- Example:
--
-- This example enables the dynamic groups `SALES` and `HR` from within a
-- post authentication procedure.
--
--     begin
--         apex_authorization.enable_dynamic_groups (
--             p_group_names => apex_t_varchar2('SALES', 'HR') );
--     end;
--
-- Note: See also
-- View APEX_WORKSPACE_SESSION_GROUPS and View APEX_WORKSPACE_GROUP_GROUPS
--==============================================================================
procedure enable_dynamic_groups (
    p_group_names in wwv_flow_t_varchar2 );

end wwv_flow_authorization_api;
/
show err

