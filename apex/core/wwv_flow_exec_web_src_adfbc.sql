set define '^' verify off
prompt ...wwv_flow_exec_web_src_adfbc.sql
create or replace package wwv_flow_exec_web_src_adfbc as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
--    NAME
--      wwv_flow_exec_web_src_adfbc.sql
--
--    DESCRIPTION
--      Web source (plug-in) implementation for ADF BC REST Services
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    01/08/2018 Created
--    smuench     05/24/2023 - APEX-6959 REST Data Source Improvements for FA Extensions
--
--------------------------------------------------------------------------------

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure capabilities_adfbc (
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_capabilities );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure fetch_adfbc (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result );

--======================================================================================================================
-- Web Source Module Plug-In discover procedure
--======================================================================================================================
procedure discover_adfbc (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );

procedure dml_adfbc (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_dml_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_dml_result );
    
end wwv_flow_exec_web_src_adfbc;
/
show err

set define '^'
