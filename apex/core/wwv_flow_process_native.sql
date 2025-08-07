set define '^' verify off
prompt ...wwv_flow_process_native
create or replace package wwv_flow_process_native as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2010, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_process_native.sql
--
--    DESCRIPTION
--      This package is resonsible for handling native process types.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      03/12/2010 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_form_info is record (
    -- general tabform and form info
    id                    number,
    table_owner           varchar2(4000),
    table_name            varchar2(4000),
    pk_column1            varchar2(4000),
    pk_column2            varchar2(4000),
    runtime_where_clause  varchar2(4000),
    row_version_column    varchar2(4000),
    -- form fetch/dml specific
    pk_item1              varchar2(4000),
    pk_item2              varchar2(4000),
    -- form dml process specific
    return_key_into_item1 varchar2(4000),
    return_key_into_item2 varchar2(4000),
    -- form pagination process specific
    order_column1         varchar2(4000),
    order_column2         varchar2(4000) );

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
subtype t_type_name is varchar2(30);
c_plsql                  constant t_type_name := 'NATIVE_PLSQL';
c_send_email             constant t_type_name := 'NATIVE_SEND_EMAIL';
c_send_push_notification constant t_type_name := 'NATIVE_SEND_PUSH_NOTIFICATION';
c_create_task            constant t_type_name := 'NATIVE_CREATE_TASK';
c_manage_task            constant t_type_name := 'NATIVE_MANAGE_TASK';
c_close_window           constant t_type_name := 'NATIVE_CLOSE_WINDOW';
c_session_state          constant t_type_name := 'NATIVE_SESSION_STATE';
c_user_preferences       constant t_type_name := 'NATIVE_USER_PREFERENCES';
c_tabform_add_rows       constant t_type_name := 'NATIVE_TABFORM_ADD_ROWS';
c_tabform_update         constant t_type_name := 'NATIVE_TABFORM_UPDATE';
c_tabform_delete         constant t_type_name := 'NATIVE_TABFORM_DELETE';
c_form_fetch             constant t_type_name := 'NATIVE_FORM_FETCH';
c_form_pagination        constant t_type_name := 'NATIVE_FORM_PAGINATION';
c_form_process           constant t_type_name := 'NATIVE_FORM_PROCESS';
c_form_process_legacy    constant t_type_name := 'NATIVE_FORM_PROCESS_LEGACY';
c_web_service            constant t_type_name := 'NATIVE_WEB_SERVICE';
c_web_service_legacy     constant t_type_name := 'NATIVE_WEB_SERVICE_LEGACY';
c_reset_pagination       constant t_type_name := 'NATIVE_RESET_PAGINATION';
c_parse_uploaded_data    constant t_type_name := 'NATIVE_PARSE_UPLOADED_DATA';
c_prepare_uploaded_data  constant t_type_name := 'NATIVE_PREPARE_UPLOADED_DATA';
c_load_uploaded_data     constant t_type_name := 'NATIVE_LOAD_UPLOADED_DATA';
c_ig_dml                 constant t_type_name := 'NATIVE_IG_DML';
c_form_region_init       constant t_type_name := 'NATIVE_FORM_INIT';
c_form_region_dml        constant t_type_name := 'NATIVE_FORM_DML';
c_data_loading           constant t_type_name := 'NATIVE_DATA_LOADING';
c_invoke_api             constant t_type_name := 'NATIVE_INVOKE_API';
c_execution_chain        constant t_type_name := 'NATIVE_EXECUTION_CHAIN';
c_workflow               constant t_type_name := 'NATIVE_WORKFLOW';
c_start_wf_activity      constant t_type_name := 'NATIVE_WORKFLOW_START';
c_end_wf_activity        constant t_type_name := 'NATIVE_WORKFLOW_END';
c_switch_wf_activity     constant t_type_name := 'NATIVE_WORKFLOW_SWITCH';
c_wait_wf_activity       constant t_type_name := 'NATIVE_WORKFLOW_WAIT';
c_download               constant t_type_name := 'NATIVE_DOWNLOAD';
c_geocoding              constant t_type_name := 'NATIVE_GEOCODING';
c_print_report           constant t_type_name := 'NATIVE_PRINT_REPORT';
c_invoke_wf              constant t_type_name := 'NATIVE_INVOKE_WF';

--==============================================================================
-- Dispatcher which actually calls the native process plug-in.
--==============================================================================
function execute_process (
    p_type        in varchar2,
    p_plugin      in wwv_flow_plugin_api.t_plugin,
    p_process     in wwv_flow_plugin_api.t_process,
    p_process_int in wwv_flow_meta_data.t_process )
    return wwv_flow_plugin_api.t_process_exec_result;

--==============================================================================
-- Dispatcher which actually calls the native process plug-in for completion.
--==============================================================================
function complete_process (
    p_type        in varchar2,
    p_plugin      in wwv_flow_plugin_api.t_plugin,
    p_process     in wwv_flow_plugin_api.t_process,
    p_process_int in wwv_flow_meta_data.t_process,
    p_param       in wwv_flow_plugin_api.t_process_complete_param )
    return wwv_flow_plugin_api.t_process_complete_result;

--==============================================================================
-- Dispatcher which actually calls the native process plug-in for termination.
--==============================================================================
function terminate_process (
    p_type        in varchar2,
    p_plugin      in wwv_flow_plugin_api.t_plugin,
    p_process     in wwv_flow_plugin_api.t_process,
    p_process_int in wwv_flow_meta_data.t_process )
    return wwv_flow_plugin_api.t_process_terminate_result;

--==============================================================================
-- Utility function to return attributes of a c_form_fetch or c_form_process
-- process.
--
-- Either p_page_id or p_process_id needs to be passed, all
-- other parameters are mandatory.
--
-- raises 'WWV_FLOW_NATIVE_ITEM.NO_DML_PROCESS_FOUND' if the process could not
-- be found.
--==============================================================================
function get_form_info (
    p_process_type      in varchar2, -- c_form_fetch or c_form_process
    p_security_group_id in number,
    p_application_id    in number,
    p_page_id           in number default null,
    p_process_id        in number default null )
    return t_form_info;

--==============================================================================
-- Logic to get downloadable file for download process and DA plug-in
--==============================================================================
procedure get_download_file (
    p_multiple_files      in            boolean  default false,
    p_sql_query           in            varchar2,
    p_file_name           in out        varchar2,
    p_mime_type              out        varchar2,
    p_blob                in out nocopy blob );

end wwv_flow_process_native;
/
show errors
