set define '^' verify off
prompt ...wwv_flow_exec_web_src_restsql.sql
create or replace package wwv_flow_exec_web_src_restsql as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_exec_web_src_restsql.sql
--
--    DESCRIPTION
--      Web source implementation for REST Sources based on REST Enabled SQL
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    01/04/2022 - Created
--
--------------------------------------------------------------------------------

--======================================================================================================================
-- Web Source Module Plug-In capabilities procedure
--======================================================================================================================
procedure capabilities_restsql (
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_capabilities );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure fetch_restsql (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure dml_restsql (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_dml_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_dml_result );

--======================================================================================================================
-- Web Source Module Plug-In discover procedure
--======================================================================================================================
procedure discover_restsql (
    p_plugin         in            wwv_flow_plugin_api.t_plugin,
    p_web_source     in            wwv_flow_plugin_api.t_web_source,
    p_params         in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );

end wwv_flow_exec_web_src_restsql;
/
show err

set define '^'
