set define off
set verify off

prompt ...wwv_flow_cloud_idm

create or replace package wwv_flow_cloud_idm
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2011, 2021, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_cloud_idm.sql
--
--    DESCRIPTION
--      Add description of the package.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    10/25/2011 - Created
--
--------------------------------------------------------------------------------

subtype t_workspace_privilege is varchar2(13);
c_priv_admin     constant t_workspace_privilege := 'ADMINISTRATOR';
c_priv_developer constant t_workspace_privilege := 'DEVELOPER';
c_priv_user      constant t_workspace_privilege := 'USER';

--
--==============================================================================
-- Session Sentry function for native CLOUD_IDM authentication.
--==============================================================================
function native_session_sentry (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;
--
--==============================================================================
-- Invalid Session function for native CLOUD_IDM authentication.
--==============================================================================
function native_invalid_session (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_inval_result;
--
--==============================================================================
-- AJAX function for native CLOUD_IDM authentication.
--==============================================================================
function native_ajax (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_ajax_result;
--
--==============================================================================
-- Post Logout function for native CLOUD_IDM authentication.
--==============================================================================
function native_post_logout (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_logout_result;
--
--==============================================================================
-- Session Sentry function for builder CLOUD_IDM authentication.
--==============================================================================
function builder_session_sentry (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;
--
--==============================================================================
-- Invalid Session function for builder CLOUD_IDM authentication.
--==============================================================================
function builder_invalid_session (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_inval_result;
--
--==============================================================================
-- AJAX function for builder CLOUD_IDM authentication.
--==============================================================================
function builder_ajax (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_ajax_result;
--
--==============================================================================
-- Post Logout function for builder CLOUD_IDM authentication.
--==============================================================================
function builder_post_logout (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_logout_result;
--
--==============================================================================
-- Checks if the specified user groups are assigned to the current user.
--==============================================================================
function check_usergroups (
    p_authorization in wwv_flow_plugin_api.t_authorization )
    return wwv_flow_plugin_api.t_authorization_exec_result;
--
--==============================================================================
-- Returns the privilege of the current user in the current workspace, based on
-- IDM groups:
-- - c_priv_admin if HTTP_OAM_REMOTE_USER_GROUPS contains a DB_ADMINISTRATOR
--   role for the service,
-- - c_priv_developer if it contains DB_DEVELOPER for the service,
-- - c_priv_user otherwise
--==============================================================================
function get_workspace_privilege
    return t_workspace_privilege;

end wwv_flow_cloud_idm;
/
show errors

set define '^'
