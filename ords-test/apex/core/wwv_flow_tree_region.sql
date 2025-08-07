set define '^' verify off
prompt ...wwv_flow_tree_region
create or replace package wwv_flow_tree_region as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2010-2020. All Rights Reserved.
--
--    NAME
--      wwv_flow_tree_region.sql
--
--    DESCRIPTION
--      This package specification is responsible for the generation of tree regions
--
--    SECURITY
--      No grants, must be run as FLOW schema owner.
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    CUSTOMER MAY CUSTOMIZE
--      NO
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--    hfarrell  01/11/2010 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Function which generates the necessary HTML code for the tree. This is
-- the API used when the tree is used in a region.
--==============================================================================
function render (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow_meta_data.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;

--==============================================================================
-- Function which generates the necessary JSON code for the tree. This is
-- the API used when the tree is refreshed via AJAX.
--==============================================================================
function ajax (
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_region in wwv_flow_plugin_api.t_region )
    return wwv_flow_plugin_api.t_region_ajax_result;

--==============================================================================
-- initialize and show tree, independent of tree plugin. this is used by the
-- navigation tree of websheets.
--==============================================================================
procedure show_tree (
    p_tree              in wwv_flow_plugin_util.t_column_value_list,
    p_tree_id           in varchar2,
    p_tree_template     in varchar2,
    p_tree_has_focus    in varchar2,
    p_tree_action       in varchar2,
    p_hints             in varchar2,
    p_hints_text        in varchar2,
    p_selected_node_id  in varchar2 default null,
    p_label             in varchar2 default null);

end wwv_flow_tree_region;
/
show errors
