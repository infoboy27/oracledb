set define '^' verify off
prompt ...wwv_flow_faceted_search.sql
create or replace package wwv_flow_faceted_search as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2019, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_faceted_search.plb
--
--    DESCRIPTION
--      This package is responsible for handling faceted search regions.
--
--    MODIFIED   (MM/DD/YYYY)
--    hfarrell    04/15/2019 - Created
--

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--
c_facet                   constant varchar2(40) := 'FACET_COLUMN';
c_list                    constant varchar2(40) := 'list';
c_range                   constant varchar2(40) := 'range';
c_range_list              constant varchar2(40) := 'rangeList';
c_search                  constant varchar2(40) := 'search';
c_select_list             constant varchar2(40) := 'selectList';
c_select_range            constant varchar2(40) := 'selectRange';
c_input                   constant varchar2(40) := 'input';
c_group                   constant varchar2(40) := 'group';
c_checkbox                constant varchar2(40) := 'checkbox';

--==============================================================================
-- Renders a Faceted Search Region.
--==============================================================================
function render (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow_meta_data.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Ajax callback for a Faceted Search Region.
--==============================================================================
function ajax (
    p_plugin               in wwv_flow_plugin_api.t_plugin,
    p_region               in wwv_flow_plugin_api.t_region,
    p_json_path            in varchar2,
    p_in_accept            in boolean,
    p_in_set_session_state in boolean )
    return wwv_flow_plugin_api.t_region_ajax_result;

--==============================================================================
-- returns filters to apply to query execution of the given filtered region id (19.2: classic report). This
-- function looks up the Faceted Search region, the facets and the submitted values. 
-- A wwv_flow_exec_api.t_filters array is built and returned to the calling component.
--
-- Parameters:
-- * p_filtered_region_id:    ID of the filtered region (classic report)
-- * p_page_id:               Page ID where the filtered region is on; needs to be
--                            passed in, if called from a different page.
--
-- Returns:
-- filters as wwv_flow_exec_api.t_filters array
--==============================================================================
function get_filters_for_region(
    p_filtered_region_id in number,
    p_page_id            in number default wwv_flow.g_flow_step_id ) 
    return wwv_flow_exec_api.t_filters;

--==============================================================================
-- This function is being called by the filtered region (the classic report)
-- in order to get the list of facet names
--
-- Parameters:
-- * p_filtered_region_id:    ID of the filtered region (classic report)
-- * p_page_id:               Page ID where the filtered region is on; needs to be
--                            passed in, if called from a different page.
-- 
-- Returns:
-- list of facets item names as VARCHAR2
--==============================================================================
function get_facets_for_region(
    p_filtered_region_id in number,
    p_page_id            in number default wwv_flow.g_flow_step_id )
    return varchar2;

--==============================================================================
-- This function is being called by the filtered region (e.g. the classic report)
-- in order to get the static id of the faceted search region
--
-- Parameters:
-- * p_filtered_region_id:    ID of the filtered region (classic report)
-- * p_page_id:               Page ID where the filtered region is on; needs to be
--                            passed in, if called from a different page.
-- 
-- Returns:
-- Static ID of the facets region
--==============================================================================
function get_facets_region_static_id(
    p_filtered_region_id in number,
    p_page_id            in number default wwv_flow.g_flow_step_id ) 
    return varchar2;

--==============================================================================
-- Use this procedure to get the details of the faceted search / smart filters
-- region connected to a region identified by p_filtered_region_id. Is used
-- by the plug-in infrastructure to populate the t_region record.
--
-- * p_filtered_region_id:      The internal ID of the filtered region (e.g CR)
-- * p_page_id:                 Page ID where the filtered region is on; needs to be
--                              passed in, if called from a different page.
--
-- * p_filters                  List of filter item names as VARCHAR2
-- * p_filters_region_id        Internal ID of the filters region
-- * p_filters_region_static_id Static ID of the filters region
--==============================================================================
procedure set_filters_region_details (
    p_filtered_region_id        in  number,
    p_page_id                   in  number default wwv_flow.g_flow_step_id,
    --
    p_filters                   out varchar2,
    p_filters_region_id         out number,
    p_filters_region_static_id  out varchar2 );

--==============================================================================
-- resets package state and cached meta data; used for the testing framework.
--==============================================================================
procedure reset_state;

--
end wwv_flow_faceted_search;
/
show errors
