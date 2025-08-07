set define '^' verify off
prompt ...wwv_flow_map_region_dev.sql
create or replace package wwv_flow_map_region_dev as
--------------------------------------------------------------------------------
--
-- Copyright (c) 1999, 2022, Oracle and/or its affiliates.
--
-- Map Region Builder utility functions
--
-- Since: 21.1
--
--------------------------------------------------------------------------------
--
-- MODIFIED   (MM/DD/YYYY)
-- cczarski    11/27/2020 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

c_default_map_height              pls_integer  := 640;
c_default_color_spectrum          varchar2(4)  := 'Burg';
c_default_color_spectrum_type     varchar2(10) := 'SEQUENTIAL';

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- converts the VARCHAR2 map layer type representation to the instance of
-- wwv_flow_map_region.t_map_layer_type
--
-- Parameters:
-- * p_layer_type_vc2    layer type in string format (e.g. "POINTS", "LINES" etc
--
-- Returns:
-- layer type as an instance of wwv_flow_map_region.t_map_layer_type
--==============================================================================
function convert_map_layer_type(
    p_layer_type_vc2              in varchar2 )
    return wwv_flow_map_region.t_map_layer_type;

--==============================================================================
-- Creates a new map region.
--
-- Parameters:
-- * p_id:                           region ID to use
-- * p_app_id:                       application ID to create the page on
-- * p_page_id:                      ID to use for the new page
-- * p_page_mode:                    page mode (normal or modal)
--
-- * p_location:                     Query Location (Local DB, REST Enabled SQL, REST Source)
-- * p_query_type:                   Query Type (Table, SQL Query)
-- * p_table_owner:                  Table Owner
-- * p_table_name:                   Table Name
-- * p_map_source:                   SQL Query
--
-- * p_remote_server_id:             REST Enabled SQL reference
-- * p_web_source_module_id:         REST Data Source ID
--
-- * p_layer_name:                   Name for the map layer to be created
-- * p_layer_type:                   Type of the map layer (Points, Lines, Polygons, Heatmap, Extruded Polygons)
-- * p_pk_column:                    Name of the Primary Key column
-- * p_has_spatial_index:            Whether the SQL Query or Table can use a spatial index
-- * p_geometry_column_type:         Type of the Geometry column (GeoJSON, SDO_GEOMETRY, NUMBER Columns)
-- * p_geometry_column:              Name of the Geometry or GeoJSON column
-- * p_longitude_column:             Longitude column
-- * p_latitude_column:              Latitude column
-- * p_value_column:                 Value Column (if set, the color will be determined by this column)
-- * p_extrude_value_column:         For "Extruded Polygon" Layers, this value determines the height
-- * p_tooltip_column:               Tooltip column (displayed on mouseover)
--
-- * p_faceted_search_region         Whether to create the region for a faceted search page.
--==============================================================================
procedure create_map_region (
    p_id                          in number                                      default null,
    p_app_id                      in number,
    p_page_id                     in number,
    p_page_mode                   in varchar2,
    p_region_title                in varchar2,
    p_display_sequence            in varchar2,
    p_region_template_id          in number                                      default null,
    --
    p_location                    in wwv_flow_exec_api.t_location,
    p_query_type                  in wwv_flow_exec_api.t_query_type,
    p_table_owner                 in varchar2                                    default null,
    p_table_name                  in varchar2                                    default null,
    p_map_source                  in varchar2                                    default null,
    --
    p_remote_server_id            in number                                      default null,
    p_web_source_module_id        in number                                      default null,
    p_document_source_id          in number                                      default null,
    p_array_column_id             in number                                      default null,
    --
    p_layer_name                  in varchar2,
    p_layer_type                  in wwv_flow_map_region.t_map_layer_type,
    p_has_spatial_index           in boolean                                     default false,
    p_geometry_column_type        in wwv_flow_map_region.t_feature_data_type,
    p_pk_column                   in varchar2                                    default null,
    p_geometry_column             in varchar2                                    default null,
    p_longitude_column            in varchar2                                    default null,
    p_latitude_column             in varchar2                                    default null,
    p_value_column                in varchar2                                    default null,
    p_extrude_value_column        in varchar2                                    default null,
    p_tooltip_column              in varchar2                                    default null,
    --
    p_faceted_search_region       in boolean                                     default false );

--==============================================================================
-- Creates a new map page.
--
-- Parameters:
-- * p_app_id:                       application ID to create the page on
-- * p_page_id:                      ID to use for the new page
-- * p_page_name:                    name to use for the new page
-- * p_group_name:                   if passed in, assign the page to this group. Create
--                                   the group if it does not exist yet.
-- * p_page_mode:                    page mode (normal or modal)
--
-- * p_tab_set:                      Legacy
-- * p_tab_name:                     Legacy
-- * p_tab_text:                     Legacy
--
-- * p_nav_list_id:                  Navigation menu ID
-- * p_nav_list_child_item_name:     Navigation Menu entry for the new page
-- * p_nav_list_parent_item_id:      Parent Navigation Menu entry for the new page
--
-- * p_breadcrumb_id:                Breadcrumb ID
-- * p_breadcrumb_entry_name:        Breadcrumb entry for the new page
-- * p_parent_breadcrumb_entry_id:   Parent Breadcrumb entry to use for the new page
--
-- * p_location:                     Query Location (Local DB, REST Enabled SQL, REST Source)
-- * p_query_type:                   Query Type (Table, SQL Query)
-- * p_table_owner:                  Table Owner
-- * p_table_name:                   Table Name
-- * p_map_source:                   SQL Query
--
-- * p_remote_server_id:             REST Enabled SQL reference
-- * p_web_source_module_id:         REST Data Source ID
--
-- * p_layer_name:                   Name for the map layer to be created
-- * p_layer_type:                   Type of the map layer (Points, Lines, Polygons, Heatmap, Extruded Polygons)
-- * p_pk_column:                    Name of the Primary Key column
-- * p_has_spatial_index:            Whether the SQL Query or Table can use a spatial index
-- * p_geometry_column_type:         Type of the Geometry column (GeoJSON, SDO_GEOMETRY, NUMBER Columns)
-- * p_geometry_column:              Name of the Geometry or GeoJSON column
-- * p_longitude_column:             Longitude column
-- * p_latitude_column:              Latitude column
-- * p_value_column:                 Value Column (if set, the color will be determined by this column)
-- * p_extrude_value_column:         For "Extruded Polygon" Layers, this value determines the height
-- * p_tooltip_column:               Tooltip column (displayed on mouseover)
--==============================================================================
procedure create_map_page (
    p_app_id                      in number,
    p_page_id                     in number,
    p_page_name                   in varchar2,
    p_group_name                  in varchar2                                    default null,
    p_page_mode                   in varchar2,
    --
    p_tab_set                     in varchar2                                    default null,
    p_tab_name                    in varchar2                                    default null,
    p_tab_text                    in varchar2                                    default null,
    --
    p_nav_list_id                 in number                                      default null,
    p_nav_list_parent_item_id     in number                                      default null,
    p_nav_list_child_item_name    in varchar2                                    default null,
    p_nav_list_item_icon          in varchar2                                    default null,
    --
    p_breadcrumb_id               in number                                      default null,
    p_breadcrumb_entry_name       in varchar2                                    default null,
    p_parent_breadcrumb_entry_id  in number                                      default null,
    --
    p_location                    in wwv_flow_exec_api.t_location,
    p_query_type                  in wwv_flow_exec_api.t_query_type,
    p_table_owner                 in varchar2                                    default null,
    p_table_name                  in varchar2                                    default null,
    p_map_source                  in varchar2                                    default null,
    --
    p_remote_server_id            in number                                      default null,
    p_web_source_module_id        in number                                      default null,
    p_document_source_id          in number                                      default null,
    p_array_column_id             in number                                      default null,
    --
    p_layer_name                  in varchar2,
    p_layer_type                  in wwv_flow_map_region.t_map_layer_type,
    p_has_spatial_index           in boolean                                     default false,
    p_geometry_column_type        in wwv_flow_map_region.t_feature_data_type,
    p_pk_column                   in varchar2                                    default null,
    p_geometry_column             in varchar2                                    default null,
    p_longitude_column            in varchar2                                    default null,
    p_latitude_column             in varchar2                                    default null,
    p_value_column                in varchar2                                    default null,
    p_extrude_value_column        in varchar2                                    default null,
    p_tooltip_column              in varchar2                                    default null,
    --
    p_faceted_search_page         in boolean                                     default false );

--==============================================================================
-- Creates a new map background.
--
-- Parameters:
-- * p_id:                           New map background ID.
-- * p_flow_id:                      Application ID.
-- * p_name:                         Name.
-- * p_type:                         Type(RASTER, VECTOR, OGCWMS).
-- * p_url:                          URL.
-- * p_attribution:                  Attribution.
-- * p_api_key:                      API Key.
-- * p_reference_id:                 Reference ID for subscriptions.
-- * p_zoom_min:                     Zoom min.
-- * p_zoom_max:                     Zoom max.
-- * p_map_comment:                  Comments.
--
-- Returns:
-- layer type as an instance of wwv_flow_map_region.t_map_layer_type
--==============================================================================
function create_map_background (
    p_id                          in number                                      default null,
    p_flow_id                     in number,
    p_name                        in varchar2,
    p_type                        in varchar2,
    p_url                         in varchar2                                    default null,
    p_attribution                 in varchar2                                    default null,
    p_api_key                     in varchar2                                    default null,
    p_http_headers                in varchar2                                    default null,
    p_reference_id                in number                                      default null,
    p_zoom_min                    in number                                      default null,
    p_zoom_max                    in number                                      default null,
    p_map_comment                 in varchar2                                    default null )
return number;

--==============================================================================
-- Copies an existing map background to another application.
--
-- Parameters:
-- * p_from_application_id:          Source's application ID.
-- * p_from_map_background_id:       Source's ID.
-- * p_to_application_id:            Target's application ID.
-- * p_to_name:                      Target's name.
-- * p_subscribe:                    Subscribe.
-- * p_if_existing_raise_dupval:     Duplicate value.
--
-- Returns:
-- new coppied map background id
--==============================================================================
function copy_map_background (
    p_from_application_id         in number,
    p_from_map_background_id      in number,
    p_to_application_id           in number,
    p_to_name                     in varchar2                                    default null,
    p_subscribe                   in boolean                                     default false,
    p_if_existing_raise_dupval    in boolean                                     default false )
return number;

--==============================================================================
-- Deletes an existing map background.
--
-- Parameters:
-- * p_map_background_id:            ID.
-- * p_flow_id:                      Application ID.
--
--==============================================================================
procedure delete_map_background (
    p_map_background_id           in number,
    p_flow_id                     in number);

--==============================================================================
-- This procedure refreshes all the map backgrounds that are in the status
--  "Needs Refresh" in a given application
--
-- Parameters:
-- * p_app_id:      Application ID to refresh the map backgrounds from
--==============================================================================
procedure refresh_map_backgrounds (
    p_app_id in number );

--==============================================================================
-- Checks if map background is in use.
--
-- Parameters:
-- * p_application_id:            Application ID.
-- * p_map_background_id:         ID.
--
--==============================================================================
function is_map_background_used (
    p_application_id              in number,
    p_map_background_id           in number )
return boolean;

end wwv_flow_map_region_dev;
/
show err

set define '^'
