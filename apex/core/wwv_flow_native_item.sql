set define '^' verify off
prompt ...wwv_flow_native_item
create or replace package wwv_flow_native_item
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_native_item.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native item types.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      09/11/2009 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_auto_complete             constant varchar2(40) := 'NATIVE_AUTO_COMPLETE';
c_checkbox                  constant varchar2(40) := 'NATIVE_CHECKBOX';
c_color_picker              constant varchar2(40) := 'NATIVE_COLOR_PICKER';
c_date_picker_jquery        constant varchar2(40) := 'NATIVE_DATE_PICKER';              -- deprecated in 21.1
c_date_picker_apex          constant varchar2(40) := 'NATIVE_DATE_PICKER_APEX';
c_display_image             constant varchar2(40) := 'NATIVE_DISPLAY_IMAGE';
c_display_only              constant varchar2(40) := 'NATIVE_DISPLAY_ONLY';
c_file                      constant varchar2(40) := 'NATIVE_FILE';
c_hidden                    constant varchar2(40) := 'NATIVE_HIDDEN';
c_html_expression           constant varchar2(40) := 'NATIVE_HTML_EXPRESSION';
c_link                      constant varchar2(40) := 'NATIVE_LINK';
c_list_manager              constant varchar2(40) := 'NATIVE_LIST_MANAGER';
c_number_field              constant varchar2(40) := 'NATIVE_NUMBER_FIELD';
c_markdown_editor           constant varchar2(40) := 'NATIVE_MARKDOWN_EDITOR';
c_password                  constant varchar2(40) := 'NATIVE_PASSWORD';
c_pct_graph                 constant varchar2(40) := 'NATIVE_PCT_GRAPH';
c_popup_lov                 constant varchar2(40) := 'NATIVE_POPUP_LOV';
c_radiogroup                constant varchar2(40) := 'NATIVE_RADIOGROUP';
c_range                     constant varchar2(40) := 'NATIVE_RANGE';
c_input                     constant varchar2(40) := 'NATIVE_INPUT';
c_rich_text_editor          constant varchar2(40) := 'NATIVE_RICH_TEXT_EDITOR';
c_row_action                constant varchar2(40) := 'NATIVE_ROW_ACTION';
c_row_selector              constant varchar2(40) := 'NATIVE_ROW_SELECTOR';
c_select_list               constant varchar2(40) := 'NATIVE_SELECT_LIST';
c_search                    constant varchar2(40) := 'NATIVE_SEARCH';
c_shuttle                   constant varchar2(40) := 'NATIVE_SHUTTLE';
c_star_rating               constant varchar2(40) := 'NATIVE_STAR_RATING';
c_stop_and_start_html_table constant varchar2(40) := 'NATIVE_STOP_AND_START_HTML_TABLE';
c_text_field                constant varchar2(40) := 'NATIVE_TEXT_FIELD';
c_textarea                  constant varchar2(40) := 'NATIVE_TEXTAREA';
c_yes_no                    constant varchar2(40) := 'NATIVE_YES_NO';
c_single_checkbox           constant varchar2(40) := 'NATIVE_SINGLE_CHECKBOX';
c_geocoded_address          constant varchar2(40) := 'NATIVE_GEOCODED_ADDRESS';
c_display_map               constant varchar2(40) := 'NATIVE_DISPLAY_MAP';
c_image_upload              constant varchar2(40) := 'NATIVE_IMAGE_UPLOAD';
c_qr_code                   constant varchar2(40) := 'NATIVE_QRCODE';
c_combobox                  constant varchar2(40) := 'NATIVE_COMBOBOX';
c_select_one                constant varchar2(40) := 'NATIVE_SELECT_ONE';
c_select_many               constant varchar2(40) := 'NATIVE_SELECT_MANY';

-- Used by HTML5 date picker
-- format mask from https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/date
c_browser_date_format_mask     constant varchar2(30) := 'YYYY-MM-DD';
-- format mask from https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/datetime-local
c_browser_datetime_format_mask constant varchar2(30) := 'YYYY-MM-DD"T"HH24:MI';
-- just used by native jet date picker but the above format is correct for date time
c_browser_iso_format_mask      constant varchar2(30) := 'YYYY-MM-DD"T"HH24:MI:SS';
--
--==============================================================================
-- This function handles unsupported format masks that are unsupported by
-- apex.date.js
--==============================================================================
function handle_invalid_date_formats(
    p_format_mask in varchar2 ) return varchar2;
--
--==========================================================================
-- Returns all parts of the format mask that are not compatible with
-- apex.date.js
--==========================================================================
function get_unspported_datejs_parts (
    p_format in varchar2 ) return varchar2;
--
--===============================================================================
-- Gets the format mask for an item, if the item itself has no format mask
-- defined, this function will return the relevant NLS format according to the
-- date type.
-- Falls back to 'DD-MON-RR' if no formats can be found
--===============================================================================
function get_item_date_format (
    p_data_type    varchar2,
    p_format_mask  varchar2 default null,
    p_is_form_item boolean default false ) return varchar2;
--==============================================================================
-- This function handles multiple values separators and decodes Unicode values
--==============================================================================
function handle_multi_value_separators(
    p_type      in wwv_flow_exec_api.t_multi_value_type,
    p_separator in varchar2,
    p_for_faceted_search in boolean default false ) return varchar2;
--
--==============================================================================
-- Renders the HTML code for popup LOV dialog.
--==============================================================================
procedure render_popup_lov_dialog (
    p_item_name        in varchar2,
    p_fetch            in varchar2,
    p_lov_definition   in varchar2,
    p_lov_display_null in boolean,
    p_lov_null_text    in varchar2 default null,
    p_lov_null_value   in varchar2 default null,
    p_has_hidden_item  in boolean  default false,
    p_is_old_popup_lov in boolean  default false,
    p_allow_multiple   in boolean  default false );
--
--==============================================================================
-- Native plugin interface
--
-- This procedure is called from wwv_flow_plugin to run the meta data function.
--==============================================================================
procedure meta_data (
    p_type   in            varchar2,
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_item   in            wwv_flow_plugin_api.t_item,
    p_param  in            wwv_flow_plugin_api.t_item_meta_data_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_meta_data_result );
--
--==============================================================================
-- Native plugin interface
--
-- This procedure is called from wwv_flow_plugin to run the render function.
--==============================================================================
procedure render (
    p_type   in            varchar2,
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_item   in            wwv_flow_plugin_api.t_item,
    p_param  in            wwv_flow_plugin_api.t_item_render_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_render_result );
--
--==============================================================================
-- Native plugin interface
--
-- This procedure is called from wwv_flow_plugin to run the validate function.
--==============================================================================
procedure validate (
    p_type   in            varchar2,
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_item   in            wwv_flow_plugin_api.t_item,
    p_param  in            wwv_flow_plugin_api.t_item_validation_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_validation_result );
--
--==============================================================================
-- Native plugin interface
--
-- This procedure is called from wwv_flow_plugin to run the ajax function.
--==============================================================================
procedure ajax (
    p_type   in            varchar2,
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_item   in            wwv_flow_plugin_api.t_item,
    p_param  in            wwv_flow_plugin_api.t_item_ajax_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_ajax_result );
--
end wwv_flow_native_item;
/
show errors
