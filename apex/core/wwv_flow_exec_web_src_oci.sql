set define '^' verify off
prompt ...wwv_flow_exec_web_src_oci.sql
create or replace package wwv_flow_exec_web_src_oci as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2019. All Rights Reserved.
--
--    NAME
--      wwv_flow_exec_web_src_oci.sql
--
--    DESCRIPTION
--      Web source implementation for Oracle Cloud Infrastructure (OCI) REST Services
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    07/15/2019 Created
--
--------------------------------------------------------------------------------

--======================================================================================================================
-- Web Source Module Plug-In capabilities procedure
--======================================================================================================================
procedure capabilities_oci (
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_capabilities );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure fetch_oci (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result );

end wwv_flow_exec_web_src_oci;
/
show err

set define '^'
