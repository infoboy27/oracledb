set define '^' verify off
prompt ...wwv_flow_f4000_plugins
create or replace package wwv_flow_f4000_plugins as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_f4000_plugins.sql
--
--    DESCRIPTION
--      This package contains the code for all APEX Builder plug-ins.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      10/01/2009 - Created
--
--------------------------------------------------------------------------------

--******************************************************************************
-- REGION PLUG-INs
--******************************************************************************

--
--==============================================================================
-- Renders a "Subscriptions" region to displays if there are subscriptions.
--==============================================================================
function render_subscriptions (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Renders the splitter region plugin
--==============================================================================
function render_splitter (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Handles persisting splitter state changes as a user preference
--==============================================================================
function ajax_splitter (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_region_ajax_result;
--******************************************************************************
-- DYNAMIC ACTION PLUG-INs
--******************************************************************************

--==============================================================================
-- Renders the "Hide Required" dynamic action.
--==============================================================================
function render_hide_required (
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;
--
--==============================================================================
-- Renders the "Show Required" dynamic action.
--==============================================================================
function render_show_required (
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;

--******************************************************************************
-- ITEM TYPE PLUG-INs
--******************************************************************************

--==============================================================================
-- Renders a search item type.
--==============================================================================
function render_searchbox (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Renders the condition type selectlist and adds the necessary javascript
-- code to show/hide the attached expression1/2 fields.
--==============================================================================
function render_condition_type (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Validates the condition type expression fields.
--==============================================================================
function validate_condition_type (
    p_item   in     wwv_flow_plugin_api.t_page_item,
    p_plugin in     wwv_flow_plugin_api.t_plugin,
    p_value  in     varchar2 )
    return wwv_flow_plugin_api.t_page_item_validation_result;
--
--==============================================================================
-- Renders the code language select list.
--==============================================================================
procedure render_code_language (
    p_item   in            wwv_flow_plugin_api.t_item,
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_param  in            wwv_flow_plugin_api.t_item_render_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_render_result );
--
--==============================================================================
-- Validates the code language field.
--==============================================================================
procedure validate_code_language (
    p_item   in            wwv_flow_plugin_api.t_item,
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_param  in            wwv_flow_plugin_api.t_item_validation_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_validation_result );
--
--==============================================================================
-- Renders a hierarchical checkboxes based on the defined attributes in p_item.
--==============================================================================
function render_hierarchical_checkbox (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Renders a group select list of components which restricts the output
-- to the component supported by the current user interface.
--==============================================================================
function render_ui_component_selectlist (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Renders a plug-in attribute item type.
--==============================================================================
function render_plugin_attribute (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Based on the passed attribute type the function will perform different
-- operations.
--==============================================================================
function ajax_plugin_attribute (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;
--
--==============================================================================
-- CLOB Textarea item plugin
--
-- emit textarea for clob result of select statement in p_item.attribute_01
--
-- data is passed from browser to server via a synchronous ajax request right
-- before the submit. the ajax request passes 4000 character chunks via the f01
-- array of apex_application.show, where it is stored in a collection's clob001
-- whose name equals the item name.
--==============================================================================
function render_clob_textarea (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- CLOB Textarea item plugin
--
-- write g_f01 array into collection p_item.name
--==============================================================================
function ajax_clob_textarea (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;
--
--==============================================================================
-- Renders a CLOB code editor based on the defined attributes in p_region.
--==============================================================================
function render_clob_code_editor (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Renders a code editor based on the defined attributes in p_item.
--==============================================================================
procedure render_code_editor (
    p_item   in            wwv_flow_plugin_api.t_item,
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_param  in            wwv_flow_plugin_api.t_item_render_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_render_result );
--
--==============================================================================
-- AJAX callout for CLOB code editor.
--==============================================================================
function ajax_clob_code_editor (
    p_region  in wwv_flow_plugin_api.t_region,
    p_plugin  in wwv_flow_plugin_api.t_plugin)
    return wwv_flow_plugin_api.t_region_ajax_result;
--
--==============================================================================
-- AJAX callout for code editor.
--==============================================================================
procedure ajax_code_editor (
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_item   in            wwv_flow_plugin_api.t_item,
    p_param  in            wwv_flow_plugin_api.t_item_ajax_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_ajax_result );
--
--==============================================================================
-- Renders client side templator region
--==============================================================================
function render_client_side_templator (
    p_region              in wwv_flow_plugin_api.t_region,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- AJAX handler of client side templator region
--==============================================================================
function ajax_client_side_templator (
    p_region in wwv_flow_plugin_api.t_region,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_region_ajax_result;
--
--==============================================================================
-- Emit the code complete values based on the provided values.
-- Provide either p_application_id or p_parsing_schema
--==============================================================================
procedure emit_code_complete_list (
    p_application_id in number      default null,
    p_parsing_schema in varchar2    default null,
    p_type           in varchar2,
    p_search_prefix  in varchar2,
    p_parent         in varchar2,
    p_grand_parent   in varchar2 );

--==============================================================================
-- Renders a wizard selection widget based on the defined attributes in p_item.
--==============================================================================
function render_wizard_selection (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;

--==============================================================================
-- AJAX callout for wizard selection
--==============================================================================
function ajax_wizard_selection (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;

--
--==============================================================================
-- Renders a template option checkboxes based on the defined attributes in p_item.
--==============================================================================
function render_template_opt_checkbox (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;

--==============================================================================
-- AJAX callout for template option checkboxes
--==============================================================================
function ajax_template_opt_checkbox (
    p_item   in wwv_flow_plugin_api.t_page_item,
    p_plugin in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_page_item_ajax_result;

--
--==============================================================================
-- Renders a Internal Page Popup LOV
--==============================================================================
function render_internal_page_popuplov (
    p_item                in wwv_flow_plugin_api.t_page_item,
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_page_item_render_result;
--
--==============================================================================
-- Renders the "Add Check All Checkbox" dynamic action, which turns a column heading
-- containing the #CHECK_ALL_CHECKBOX# string into an accessible 'check all' checkbox.
--==============================================================================
function render_add_check_all_checkbox (
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action,
    p_plugin         in wwv_flow_plugin_api.t_plugin )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;
--
--==============================================================================
-- Renders the AI Chat Item, used for creating apps and data models with AI
--==============================================================================
procedure render_ai_chat_item (
    p_item   in            wwv_flow_plugin_api.t_item,
    p_plugin in            wwv_flow_plugin_api.t_plugin,
    p_param  in            wwv_flow_plugin_api.t_item_render_param,
    p_result in out nocopy wwv_flow_plugin_api.t_item_render_result );

end wwv_flow_f4000_plugins;
/
show errors
