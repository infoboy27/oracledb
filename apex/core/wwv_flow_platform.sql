set define '^' verify off
prompt ...wwv_flow_platform.sql
create or replace package wwv_flow_platform as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_platform.sql
--
--    DESCRIPTION
--      Low-level interface to instance parameters.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa  03/04/2001 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- globals for common instance parameters that are always needed at the
-- beginning of request processing. these are set via init() below and on first
-- access, in the package body's begin block.
--
-- the number of these globals should be kept small. only add a new one if it
-- is used for each request.
--==============================================================================
g_qos_max_workspace_requests   number;
g_qos_max_session_requests     number;
g_qos_max_session_kill_timeout number;
g_rm_consumer_group            varchar2(4000);
g_allow_hostnames              varchar2(4000);
g_http_sts_max_age             varchar2(4000);
g_http_response_headers        varchar2(4000);
g_require_https                varchar2(4000);
g_rejoin_existing_sessions     varchar2(4000);
g_max_session_length_sec       number;
g_max_session_idle_sec         number;
g_session_timeout_warning_sec  number;
g_instance_id                  varchar2(4000);
g_instance_proxy               varchar2(4000);
g_instance_no_proxy_domains    varchar2(4000);
g_checksum_hash_function       varchar2(4000);
g_proxy_authentication         varchar2(4000);
g_debug_page_view_limit        number;

--==============================================================================
-- Fetches a preference directly from the preferences table; bypassing the
-- cache.
--
-- Parameters:
-- * p_preference_name: name of the preference to fetch
--
-- Returns:
-- the value of the preference.
--==============================================================================
function fetch_preference (
   p_preference_name in varchar2)
   return varchar2;

--==============================================================================
-- Returns a preference value. The value is taken from the cache, if available,
-- otherwise it's fetched from the preference table and then cached.
--
-- Parameters:
-- * p_preference_name: name of the preference to fetch
--
-- Returns:
-- the value of the preference.
--==============================================================================
function get_preference (
   p_preference_name in varchar2)
   return varchar2;

--==============================================================================
-- Sets a preference value
-- 
-- Parameters:
-- * p_preference_name:  name of the preference
-- * p_preference_value: value to set the preference to
--==============================================================================
procedure set_preference (
   p_preference_name  in varchar2,
   p_preference_value in varchar2 );

--==============================================================================
-- Initialize the global variables.
--
-- The package calls init on startup, but there may be occasions where a
-- re-initialization is necessary.
--==============================================================================
procedure init;

end wwv_flow_platform;
/
show err

