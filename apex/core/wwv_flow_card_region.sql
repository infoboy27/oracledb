set define '^' verify off
prompt ...wwv_flow_card_region
create or replace package wwv_flow_card_region
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2022, Oracle and/or its affiliates.
--
-- NAME
--   wwv_flow_card_region.sql
--
-- DESCRIPTION
--   This package is responsible for handling Card native region plugin.
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cbcho     06/05/2020 - Created
--
--------------------------------------------------------------------------------

--==============================================================================================
-- This function renders a Cards Region
--
-- PARAMETERS
--     p_plugin:
--     p_region:
--     p_plug:
--     p_is_printer_friendly:
-- 
-- RETURN
--     wwv_flow_plugin_api.t_region_render_result
--============================================================================================== 
function render (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow_meta_data.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;

--==============================================================================
-- This function is ajax callback for a Cards Region
--
-- PARAMETERS
--     p_plugin:
--     p_region:
--     p_json_path:
-- 
-- RETURN
--     wwv_flow_plugin_api.t_region_ajax_result;
--==============================================================================================
function ajax (
    p_plugin               in wwv_flow_plugin_api.t_plugin,
    p_region               in wwv_flow_plugin_api.t_region,
    p_json_path            in varchar2 )
    return wwv_flow_plugin_api.t_region_ajax_result;

end wwv_flow_card_region;
/
show errors
