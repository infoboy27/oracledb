set define '^' verify off
prompt ...wwv_flow_exec_web_src_ords.sql
create or replace package wwv_flow_exec_web_src_ords as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
--    NAME
--      wwv_flow_exec_web_src_ords.sql
--
--    DESCRIPTION
--      Web source implementation for ORDS REST Services
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    03/14/2017 - Created
--
--------------------------------------------------------------------------------


--======================================================================================================================
-- converts wwv_flow_exec_api.t_filters (contains component filters) to ORDS JSON filter syntax
-- 
-- PARAMETERS
-- * p_filters                 context object with execution details
-- * p_web_source_operation    web source operation record with wsm details
--
-- RETURNS
-- * ORDS filter syntax (JSON format) which represents the component filters
--======================================================================================================================
function generate_json_filter(
    p_filters              in wwv_flow_exec_api.t_filters,
    p_web_source_operation in wwv_flow_exec_web_src.t_web_source_operation )
    return varchar2;

--======================================================================================================================
-- converts wwv_flow_exec_api.t_order_bys array to ORDS JSON syntax
-- 
-- PARAMETERS
-- * p_order_bys                 IN array of ORDER BYs to convert
-- * p_web_source_operation    web source operation record with wsm details
--
-- RETURNS
-- * ORDS order by syntax (JSON format) which represents the component order bys
--======================================================================================================================
function generate_json_orderby(
    p_order_bys            in wwv_flow_exec_api.t_order_bys,
    p_web_source_operation in wwv_flow_exec_web_src.t_web_source_operation) 
    return varchar2;

--======================================================================================================================
-- Web Source Module Plug-In capabilities procedure
--======================================================================================================================
procedure capabilities_ords (
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_capabilities );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure for ORDS
--======================================================================================================================
procedure fetch_ords (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result );

--======================================================================================================================
-- Web Source Module Plug-In DML procedure 
--======================================================================================================================
procedure dml_ords (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_dml_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_dml_result );

--======================================================================================================================
-- Web Source Module Plug-In discover procedure
--======================================================================================================================
procedure discover_ords (
    p_plugin         in            wwv_flow_plugin_api.t_plugin,
    p_web_source     in            wwv_flow_plugin_api.t_web_source,
    p_params         in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );

end wwv_flow_exec_web_src_ords;
/
show err

set define '^'
