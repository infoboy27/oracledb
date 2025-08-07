set define '^' verify off
prompt ...wwv_flow_map_region.sql
create or replace package wwv_flow_map_region as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2022, Oracle and/or its affiliates.
--
--  Implementation package for the map region.
--
--  Since: 21.1
--
--------------------------------------------------------------------------------
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    09/21/2020 - Created
-- 
--------------------------------------------------------------------------------

--==============================================================================
-- Global types 
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

subtype t_map_layer_type    is pls_integer range 1..5;

c_map_layer_points             constant t_map_layer_type          := 1;
c_map_layer_lines              constant t_map_layer_type          := 2;
c_map_layer_polygons           constant t_map_layer_type          := 3;
c_map_layer_3d_polygons        constant t_map_layer_type          := 4;
c_map_layer_heat_map           constant t_map_layer_type          := 5;

subtype t_feature_data_type is pls_integer range 1..3;

c_feature_sdo_geometry         constant t_feature_data_type       := 1;
c_feature_geojson              constant t_feature_data_type       := 2;
c_feature_number_columns       constant t_feature_data_type       := 3;


type t_map_background is record (
    bkg_name                        varchar2(255),
    bkg_type                        varchar2(6),
    url                             varchar2(4000),
    attribution                     varchar2(4000),
    api_key                         varchar2(4000),
    http_headers                    varchar2(4000),
    --
    zoom_min                        number,
    zoom_max                        number,
    --
    map_comment                     varchar2(4000)
);
--
-- array of map backgrounds for caching purposes
--
type t_map_backgrounds is table of t_map_background index by varchar2(255);
--==============================================================================
-- Globals
--==============================================================================

--
--==============================================================================
-- Renders a Map Region.
--==============================================================================
function render (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow_meta_data.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Ajax callback for a Map Region.
--==============================================================================
function ajax (
    p_plugin               in wwv_flow_plugin_api.t_plugin,
    p_region               in wwv_flow_plugin_api.t_region,
    p_json_path            in varchar2 )
    return wwv_flow_plugin_api.t_region_ajax_result;

--==============================================================================
-- Retrieves a map background by id.
--
-- Parameters:
-- * p_map_background_id:            ID.                                          
--        
--==============================================================================
function get_map_background( 
    p_map_background_id in number ) 
return t_map_background;

end wwv_flow_map_region;
/
show err

set define '^'
