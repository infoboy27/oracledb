set define '^' verify off
prompt ...wwv_flow_exec_web_src_http.sql
create or replace package wwv_flow_exec_web_src_http as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
--    NAME
--      wwv_flow_exec_web_src_http.sql
--
--    DESCRIPTION
--      Web source implementation for simple HTTP data feeds
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    03/14/2017 - Created
--
--------------------------------------------------------------------------------

--======================================================================================================================
-- Web Source Module Plug-In capabilities procedure
--======================================================================================================================
procedure capabilities_simple_http (
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_capabilities );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure fetch_simple_http (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure dml_simple_http (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_dml_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_dml_result );

--======================================================================================================================
-- Web Source Module Plug-In discover procedure
--======================================================================================================================
procedure discover_simple_http (
    p_plugin         in            wwv_flow_plugin_api.t_plugin,
    p_web_source     in            wwv_flow_plugin_api.t_web_source,
    p_params         in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );

end wwv_flow_exec_web_src_http;
/
show err

set define '^'
