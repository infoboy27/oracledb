set define '^' verify off
prompt ...wwv_flow_authentication_social.sql
create or replace package wwv_flow_authentication_social as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2018, 2024, Oracle and/or its affiliates
--
-- NAME
--   wwv_flow_authentication_social.sql
--
-- DESCRIPTION
--   Implementation of Social Sign-In for internal and customer apps
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  12/18/2018 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Get full URL for social callback
--==============================================================================
function get_callback_url
    return varchar2;

--==============================================================================
-- Generic (i.e. not plugin-specific) record for social sign-in attributes.
--==============================================================================
type t_social is record (
    scheme_name           varchar2(4000),
    credential_id         number,
    provider              varchar2(4000),
    openid_discovery_url  varchar2(4000),
    authorization_url     varchar2(4000),
    token_url             varchar2(4000),
    userinfo_url          varchar2(4000),
    logout_url            varchar2(4000),
    token_auth_method     varchar2(4000),
    scope                 varchar2(4000),
    auth_uri_parameters   varchar2(4000),
    username_attr         varchar2(4000),
    additional_user_attrs varchar2(4000),
    map_user_attrs        varchar2(4000),
    uppercase_username    boolean,
    verify_attributes     boolean );

--==============================================================================
-- Invalid Session function for OAUTH2 authentication.
--==============================================================================
function invalid_session (
    p_social in t_social )
    return wwv_flow_plugin_api.t_authentication_inval_result;

--==============================================================================
-- AJAX function for OAUTH2 authentication.
--
-- SEE ALSO
--   wwv_flow_authentication_api.callback
--==============================================================================
function ajax (
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_social in t_social )
    return wwv_flow_plugin_api.t_authentication_ajax_result;

--==============================================================================
-- Post Logout function for OAUTH2 authentication.
--==============================================================================
function post_logout (
    p_social         in t_social )
    return wwv_flow_plugin_api.t_authentication_logout_result;

--==============================================================================
-- Front Channel Logout for OAUTH2 authentication.
--==============================================================================
procedure front_channel_logout (
    p_session_token varchar2 );

end wwv_flow_authentication_social;
/
show err

