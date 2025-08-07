set define '^' verify off
prompt ...wwv_flow_authentication_extn.sql
create or replace package wwv_flow_authentication_extn as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2024, Oracle and/or its affiliates.
--
-- NAME
--   wwv_flow_authentication_extn.sql
--
-- DESCRIPTION
--   This package implements the Builder Extension Authentication Scheme.
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  12/19/2023 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Session Sentry function for builder extension authentication.
--==============================================================================
function session_sentry (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;

--==============================================================================
-- Invalid Session function for builder extension authentication.
--==============================================================================
function invalid_session (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_inval_result;

--==============================================================================
-- Post Logout function for builder extension authentication.
--==============================================================================
function post_logout (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_logout_result;

end wwv_flow_authentication_extn;
/
show err

