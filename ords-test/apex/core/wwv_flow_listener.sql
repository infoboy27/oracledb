set define '^' verify off
prompt ...wwv_flow_listener
create or replace package wwv_flow_listener as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2011, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_listener.sql

--    DESCRIPTION
--      This package provides utility functions for the APEX listener
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    09/13/2011 - Created
--
--==============================================================================
-- return if p_username is a valid user in p_workspace_id and can authenticate
-- with p_password
--==============================================================================
function authenticate (
    p_workspace_id in number,
    p_username     in varchar2,
    p_password     in varchar2 )
    return boolean;

--==============================================================================
-- return all workspace schema names
--==============================================================================
function get_workspace_schemas (
    p_workspace_id in number)
    return wwv_flow_t_varchar2;

--==============================================================================
-- return groups the workspace user is in
--==============================================================================
function get_workspace_user_groups (
    p_workspace_id in number,
    p_username     in varchar2 )
    return wwv_flow_t_varchar2;

--==============================================================================
-- return groups in the workspace
--==============================================================================
function get_workspace_user_groups (
    p_workspace_id in number)
    return wwv_flow_t_varchar2;

--==============================================================================
-- return group name in a given workspace for a given group ID
--==============================================================================
function get_workspace_user_group_name (
         p_workspace_id  in number,
         p_user_group_id in number)
         return varchar2;

--==============================================================================
-- return group ID in a given workspace for a given group name
--==============================================================================
function get_workspace_user_group_id (
         p_workspace_id  in number,
         p_group_name    in varchar2 )
         return number;

--==============================================================================
-- return if the user is Administrator, Developer or User in the given workspace
--==============================================================================
function get_workspace_user_type (
    p_workspace_id in number,
    p_username     in varchar2 )
    return varchar2;

--==============================================================================
-- return username of the APEX session if it is a valid session
--==============================================================================
function get_session_username (
    p_application_id in number,
    p_session_id     in number )
    return varchar2;

--==============================================================================
-- return if p_template is a valid template containing no length parameters
-- greater than 100 characters
--==============================================================================
function is_valid_template (
    p_template       in varchar2)
    return boolean;

--==============================================================================
-- return if p_module_id is a valid module in ORDS cached version
--
--==============================================================================
function get_module_version (
    p_workspace_id   in number,
    p_module_id      in number)
    return number;

--==============================================================================
-- return if p_privilege_id is a valid privilege in ORDS cached version
--
--==============================================================================
function get_privilege_version (
    p_workspace_id   in number,
    p_privilege_id   in number)
    return number;

--==============================================================================
-- return if p_template is a valid template containing no length parameters
-- greater than 100 characters
--==============================================================================
function is_required_version
    return boolean;

--==============================================================================
-- Merge APEX web entry points into the ORDS PL/SQL gateway allow list, which
-- was added in ORDS 22.2.
--==============================================================================
procedure sync_ords_gateway_allow_list;

procedure install_prereq_data;

--==============================================================================
-- returning true if SQL Developer Web option is enabled and ORDS API exists 
-- and execute is granted
--==============================================================================
function sql_developer_web_enabled
   return boolean;

--==============================================================================
-- Initialize collection SDW_SCHEMAS with associated Workspace schemas
--==============================================================================
function init_sdw_schema_list
   return varchar2;

end wwv_flow_listener;
/
show errors
