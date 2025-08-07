set define '^' verify off
prompt ...wwv_flow_region_native
create or replace package wwv_flow_region_native as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2011, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_region_native.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native region types.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      06/07/2011 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
subtype t_region_type is varchar2(40);
c_data_upload_column_mapping constant t_region_type := 'NATIVE_DATA_UPLOAD_COLUMN_MAPPING';
c_jqm_list_view              constant t_region_type := 'NATIVE_JQM_LIST_VIEW';
c_css_calendar               constant t_region_type := 'NATIVE_CSS_CALENDAR';
c_jqm_reflow                 constant t_region_type := 'NATIVE_JQM_REFLOW';
c_jqm_column_toggle          constant t_region_type := 'NATIVE_JQM_COLUMN_TOGGLE';
c_list_region                constant t_region_type := 'NATIVE_LIST';
c_breadcrumb_region          constant t_region_type := 'NATIVE_BREADCRUMB';
c_display_selector           constant t_region_type := 'NATIVE_DISPLAY_SELECTOR';
c_url                        constant t_region_type := 'NATIVE_URL';
c_help_text                  constant t_region_type := 'NATIVE_HELP_TEXT';
c_ir                         constant t_region_type := 'NATIVE_IR';
c_sql_report                 constant t_region_type := 'NATIVE_SQL_REPORT';
c_tabform                    constant t_region_type := 'NATIVE_TABFORM';
c_static                     constant t_region_type := 'NATIVE_STATIC';
c_plsql                      constant t_region_type := 'NATIVE_PLSQL';
c_jstree                     constant t_region_type := 'NATIVE_JSTREE';
c_calendar                   constant t_region_type := 'NATIVE_CALENDAR';
c_legacy_svg_chart           constant t_region_type := 'NATIVE_SVG_CHART';
c_legacy_simple_chart        constant t_region_type := 'NATIVE_SIMPLE_CHART';
c_legacy_tree                constant t_region_type := 'NATIVE_TREE';
c_static_search              constant t_region_type := 'NATIVE_STATIC_SEARCH';
c_jet_chart                  constant t_region_type := 'NATIVE_JET_CHART';
c_ig                         constant t_region_type := 'NATIVE_IG';
c_form_region                constant t_region_type := 'NATIVE_FORM';
c_faceted_search             constant t_region_type := 'NATIVE_FACETED_SEARCH';
c_card                       constant t_region_type := 'NATIVE_CARDS';
c_map_region                 constant t_region_type := 'NATIVE_MAP_REGION';
c_smart_filters              constant t_region_type := 'NATIVE_SMART_FILTERS';
c_dynamic_content            constant t_region_type := 'NATIVE_DYNAMIC_CONTENT';
c_search_region              constant t_region_type := 'NATIVE_SEARCH_REGION';
c_workflow_diagram           constant t_region_type := 'NATIVE_WORKFLOW_DIAGRAM';

--##############################################################################
--#
--# LIST REGION
--#
--##############################################################################

--==============================================================================
procedure render_list (
    p_region_id               in number,
    p_region_name             in varchar2 default null,
    p_list_id                 in number,
    p_list_template_id        in number,
    p_region_sub_css_classes  in varchar2 default null,
    p_region_template_options in varchar2 default null );

--##############################################################################
--#
--# CLASSIC REPORT
--#
--##############################################################################

--==============================================================================
-- dispatch legacy classic report requests FLOW_XXX_OUTPUT_R218312782378
--==============================================================================
procedure legacy_classic_report;

--##############################################################################
--#
--# REGION DISPLAY SELECTOR
--#
--##############################################################################

--==============================================================================
-- Function to generate the name of the RDS preference
--==============================================================================
function get_rds_preference_name (
    p_app_id        in number   default wwv_flow.g_flow_id,
    p_page_id       in number   default wwv_flow.g_flow_step_id,
    p_rds_region_id in number   default wwv_flow_page.g_standard_rds_id )
    return varchar2;
--
--==============================================================================
-- Procedure to set the active RDS tab
--==============================================================================
procedure reset_display_selector (
    p_app_id        in wwv_flow.g_flow_id%type              default wwv_flow.g_flow_id,
    p_page_id       in wwv_flow.g_flow_step_id%type         default wwv_flow.g_flow_step_id,
    p_rds_region_id in wwv_flow_page.g_standard_rds_id%type default wwv_flow_page.g_standard_rds_id );
--
--==============================================================================
-- Procedure to set the active RDS tab
--==============================================================================
procedure set_active_rds_tab (
    p_rds_region_id in wwv_flow_page.g_standard_rds_id%type default wwv_flow_page.g_standard_rds_id,
    p_app_id        in wwv_flow.g_flow_id%type              default wwv_flow.g_flow_id,
    p_page_id       in wwv_flow.g_flow_step_id%type         default wwv_flow.g_flow_step_id,
    p_scope         in varchar2 );
--
--##############################################################################
--#
--# DISPATCHERS
--#
--##############################################################################

--==============================================================================
-- Dispatcher which actually calls the native region plug-in.
--==============================================================================
function render_region (
    p_type                in varchar2,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow_meta_data.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Dispatcher which actually calls the native region plug-in.
--==============================================================================
function ajax_region (
    p_type                 in varchar2,
    p_plugin               in wwv_flow_plugin_api.t_plugin,
    p_region               in wwv_flow_plugin_api.t_region,
    p_plug                 in wwv_flow_meta_data.t_plug,
    p_json_path            in varchar2,
    p_in_accept            in boolean,
    p_in_set_session_state in boolean )
    return wwv_flow_plugin_api.t_region_ajax_result;
--
--==============================================================================
-- Dispatcher which validates the entered data in the Builder.
--==============================================================================
procedure validate_builder_region (
    p_type             in varchar2,
    p_attribute_scope  in varchar2,
    p_page_item_prefix in varchar2 );
--
--
end wwv_flow_region_native;
/
show errors
