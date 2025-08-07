set define '^' verify off
prompt ...wwv_flow_exec_web_src_odata.sql
create or replace package wwv_flow_exec_web_src_odata as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2023 - 2024. All Rights Reserved.
--
--    NAME
--      wwv_flow_exec_web_src_odata.sql
--
--    DESCRIPTION
--      Web source implementation for Oracle Cloud Infrastructure (OCI) REST Services
--
--
--    MODIFIED   (MM/DD/YYYY)
--    ascheffe    06/09/2023 Created
--
--------------------------------------------------------------------------------

--======================================================================================================================
-- Web Source Module Plug-In discover procedure
--======================================================================================================================
procedure discover_odata (
    p_plugin         in            wwv_flow_plugin_api.t_plugin,
    p_web_source     in            wwv_flow_plugin_api.t_web_source,
    p_params         in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );

--======================================================================================================================
-- Web Source Module Plug-In capabilities procedure
--======================================================================================================================
procedure capabilities_odata (
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_capabilities );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure fetch_odata (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result );

--======================================================================================================================
-- Web Source Module Plug-In DML procedure
--======================================================================================================================
procedure dml_odata (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_dml_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_dml_result );
    
--======================================================================================================================
-- type is only public for unit testing, do not use
--======================================================================================================================
type t_plugin_attributes is record (
    count_method       number,
    --
    query_req_body     boolean default false,
    --
    filter_in          boolean default false,
    filter_contains    boolean default false,
    filter_startswith  boolean default false,
    filter_endswith    boolean default false,
    filter_lower       boolean default false,
    filter_upper       boolean default false,
    --
    orderby            boolean default false,
    --
    filter_select      boolean default false,
    --
    row_search         boolean default false,
    client_pagination  boolean default false );

--======================================================================================================================
-- function is only public for unit testing, do not use
--======================================================================================================================
function odata_orderby_format (
    p_profile_columns         in wwv_flow_plugin_api.t_web_source_columns,
    p_order_bys               in wwv_flow_exec_api.t_order_bys,
    p_external_order_bys      in varchar2  )
    return varchar2;
    
--======================================================================================================================
-- function is only public for unit testing, do not use
--======================================================================================================================
function get_single_odata_filter_query (
    p_filter                    in            wwv_flow_exec_api.t_filter,
    p_profile_columns           in            wwv_flow_plugin_api.t_web_source_columns,
    p_filter_selector           in            varchar2,
    p_plugin_attributes         in            t_plugin_attributes,
    p_remote_filter             out           boolean,
    p_row_search_query          in out nocopy varchar2 )
    return varchar2;

--======================================================================================================================
-- function is only public for unit testing, do not use
--======================================================================================================================
function odata_filter_format (
    p_filters               in            wwv_flow_exec_api.t_filters,
    p_local_filters         in out nocopy wwv_flow_exec_api.t_filters,
    p_external_filters      in            varchar2,
    p_web_source            in            wwv_flow_plugin_api.t_web_source,
    p_profile_columns       in            wwv_flow_plugin_api.t_web_source_columns,
    p_plugin_attributes     in            t_plugin_attributes,
    p_row_search_query      out           varchar2 )
    return varchar2;
    
end wwv_flow_exec_web_src_odata;
/
show err

set define '^'
