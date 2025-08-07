set define '^'
set verify off
prompt ...wwv_flow_dynamic_action_native


create or replace package wwv_flow_dynamic_action_native
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_dynamic_action_native.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native dynamic actions.
--
--    MODIFIED   (MM/DD/YYYY)
--    arayner     12/08/2009 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
subtype t_type_name     is varchar2(30);
c_show                  constant t_type_name := 'NATIVE_SHOW';
c_hide                  constant t_type_name := 'NATIVE_HIDE';
c_enable                constant t_type_name := 'NATIVE_ENABLE';
c_disable               constant t_type_name := 'NATIVE_DISABLE';
c_set_value             constant t_type_name := 'NATIVE_SET_VALUE';
c_clear                 constant t_type_name := 'NATIVE_CLEAR';
c_javascript_code       constant t_type_name := 'NATIVE_JAVASCRIPT_CODE';
c_add_class             constant t_type_name := 'NATIVE_ADD_CLASS';
c_remove_class          constant t_type_name := 'NATIVE_REMOVE_CLASS';
c_set_css               constant t_type_name := 'NATIVE_SET_CSS';
c_set_focus             constant t_type_name := 'NATIVE_SET_FOCUS';
c_submit_page           constant t_type_name := 'NATIVE_SUBMIT_PAGE';
c_refresh               constant t_type_name := 'NATIVE_REFRESH';
c_execute_plsql         constant t_type_name := 'NATIVE_EXECUTE_PLSQL_CODE';
c_cancel_event          constant t_type_name := 'NATIVE_CANCEL_EVENT';
c_alert                 constant t_type_name := 'NATIVE_ALERT';
c_confirm               constant t_type_name := 'NATIVE_CONFIRM';
c_dialog_cancel         constant t_type_name := 'NATIVE_DIALOG_CANCEL';
c_dialog_close          constant t_type_name := 'NATIVE_DIALOG_CLOSE';
c_tree_collapse         constant t_type_name := 'NATIVE_TREE_COLLAPSE';
c_tree_expand           constant t_type_name := 'NATIVE_TREE_EXPAND';
c_open_region           constant t_type_name := 'NATIVE_OPEN_REGION';
c_close_region          constant t_type_name := 'NATIVE_CLOSE_REGION';
c_geocoding_trigger     constant t_type_name := 'NATIVE_GEOCODING_TRIGGER';
c_share                 constant t_type_name := 'NATIVE_SHARE';
c_get_current_position  constant t_type_name := 'NATIVE_GET_CURRENT_POSITION';
c_download              constant t_type_name := 'NATIVE_DOWNLOAD';
c_print_report          constant t_type_name := 'NATIVE_PRINT_REPORT';
c_open_ai_assistant     constant t_type_name := 'NATIVE_OPEN_AI_ASSISTANT';
c_generate_text_ai      constant t_type_name := 'NATIVE_GENERATE_TEXT_AI';
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin to run the render function.
--==============================================================================
function render (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;
--
--==============================================================================
-- Native plugin interface
--
-- This function is called from wwv_flow_plugin to run the ajax function.
--==============================================================================
function ajax (
    p_type           in varchar2,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action )
    return wwv_flow_plugin_api.t_dynamic_action_ajax_result;
--
end wwv_flow_dynamic_action_native;
/
show errors
