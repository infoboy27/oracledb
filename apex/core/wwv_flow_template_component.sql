set define '^' verify off
prompt ...wwv_flow_template_component
create or replace package wwv_flow_template_component
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, 2024, Oracle and/or its affiliates.
--
-- NAME
--   wwv_flow_template_component.sql
--
-- DESCRIPTION
--   This package is responsible for handling the Template Component plug-in.
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   mhoogend 11/16/2022 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
subtype t_template_component_type is wwv_flow_page_plugs.template_component_type%type;
c_report      constant t_template_component_type := 'REPORT';
c_partial     constant t_template_component_type := 'PARTIAL';
c_region_only constant t_template_component_type := 'REGION_ONLY';

--==============================================================================
-- Parses the JSON document of a media attribute definition and returns the
-- values as a t_media_attribute.
--==============================================================================
function parse_media_attribute (
    p_value in varchar2 )
    return wwv_flow_plugin.t_media_attribute;

--==============================================================================
-- Returns a normalized css class for the specified template component name.
--==============================================================================
function get_tmpl_component_css_class (
    p_prefix in varchar2,
    p_name   in varchar2 )
    return varchar2;

--==============================================================================
-- Procedure to initialize the p_template_component record for an IR column.
--==============================================================================
procedure initialize_ir_column (
    p_display_name       in            varchar2,
    p_define_template    in            boolean,
    p_columns_map        in            wwv_flow_global.vc_map,
    p_emit_css_js        in            wwv_flow_template_directive.t_when,
    --
    p_template_component in out nocopy wwv_flow_plugin.t_template_component,
    p_used_columns_map      out        wwv_flow_global.vc_map );

--==============================================================================
-- Procedure to render a template component plugin.
--==============================================================================
procedure render (
    p_output                in out nocopy   wwv_flow_t_writer,
    p_template_component    in              wwv_flow_plugin.t_template_component,
    p_context               in              wwv_flow_exec.t_context,
    p_ajax_identifier       in              varchar2,
    p_id_postfix            in              varchar2 );

--==============================================================================
-- Handles AJAX callbacks. Currently only for downloading BLOBs.
--==============================================================================
procedure ajax (
    p_template_component in wwv_flow_plugin.t_template_component );

--==============================================================================
-- This function renders a template component region.
--
-- Parameters:
-- * p_region:
-- * p_plug:
-- * p_grid_template:
-- * p_has_grid_support:
-- * p_max_fixed_grid_columns:
-- * p_parent_is_read_only:
--==============================================================================
function render_region (
    p_region                 in wwv_flow_plugin_api.t_region,
    p_plug                   in wwv_flow_meta_data.t_plug,
    p_grid_template          in wwv_flow_template.t_grid_template,
    p_has_grid_support       in boolean,
    p_max_fixed_grid_columns in pls_integer,
    p_parent_is_read_only    in boolean )
    return wwv_flow_plugin_api.t_region_render_result;

--==============================================================================
-- This function is ajax callback for a template component region.
--
-- Parameters:
-- * p_plugin:
-- * p_region:
-- * p_json_path:
--==============================================================================
function ajax_region (
    p_region    in wwv_flow_plugin_api.t_region,
    p_plug      in wwv_flow_meta_data.t_plug,
    p_json_path in varchar2 )
    return wwv_flow_plugin_api.t_region_ajax_result;

--==============================================================================
-- This procedure resets the state (pagination, ...) of a
-- template component region.
--==============================================================================
procedure reset_region (
    p_region_id in number );

--==============================================================================
-- Precompiles a report body template to JSON including error handling
--==============================================================================
function compile_report_body_template (
    p_template          in clob,
    p_placeholders_only in boolean  default false,
    p_for_validation    in boolean  default false  )
    return blob;

end wwv_flow_template_component;
/
show errors
