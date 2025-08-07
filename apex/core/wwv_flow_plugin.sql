set define '^' verify off
prompt ...wwv_flow_plugin
create or replace package wwv_flow_plugin as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_plugin.sql
--
--    DESCRIPTION
--      This package is responsible for handling plug-ins.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      04/02/2009 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
subtype t_ajax_scope is varchar2(10);

c_ajax_scope_generic constant t_ajax_scope := 'GENERIC';
c_ajax_scope_ai      constant t_ajax_scope := 'AI';

type t_ajax_callback is record (
    callback_type                       varchar2(12),
    component_type_id                   number,
    component_id                        number,
    json_path                           varchar2(255),
    in_accept                           boolean      default false,
    in_set_session_state                boolean      default false,
    scope                               t_ajax_scope default c_ajax_scope_generic
);

type t_process_meta_data is record (
    location                            wwv_flow_exec_api.t_location,
    remote_server_id                    number,
    plsql_code                          varchar2( 32767 ),
    --
    web_src_module_id                   number,
    web_src_operation_id                number );

subtype t_web_source_plugin_function    is pls_integer range 1..5;

type t_media_attribute is record (
    source                              varchar2( 32767 ),
    url                                 varchar2( 32767 ),
    url_column                          varchar2( 32767 ),
    blob_column                         wwv_flow_exec_api.t_column_name,
    filename_column                     wwv_flow_exec_api.t_column_name,
    mime_type_column                    wwv_flow_exec_api.t_column_name,
    last_updated_column                 wwv_flow_exec_api.t_column_name );

type t_media_attributes_map             is table of t_media_attribute index by wwv_flow_template_directive.t_placeholder_name;

type t_template_component is record (
    id                                  number,
    component_type_id                   number,
    region_id                           number,
    static_id                           varchar2(45),
    attributes                          wwv_flow_t_plugin_attributes,
    pk_columns                          wwv_flow_t_varchar2,
    ajax_items_to_submit_singlerow      varchar2(32767),
    actions                             wwv_flow_template_directive.t_actions,
    media_attributes_map                t_media_attributes_map,
    placeholder_values                  wwv_flow_template_directive.t_values,
    url_triggering_element              varchar2(32767) );

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

-- plugin types
c_plugin_type_item_type                 constant varchar2(30) := 'ITEM TYPE';
c_plugin_type_dynamic_action            constant varchar2(30) := 'DYNAMIC ACTION';
c_plugin_type_validation_type           constant varchar2(30) := 'VALIDATION TYPE';
c_plugin_type_region_type               constant varchar2(30) := 'REGION TYPE';
c_plugin_type_report_col_type           constant varchar2(30) := 'REPORT COLUMN TYPE';
c_plugin_type_process_type              constant varchar2(30) := 'PROCESS TYPE';
c_plugin_type_authorization             constant varchar2(30) := 'AUTHORIZATION TYPE';
c_plugin_type_authentication            constant varchar2(30) := 'AUTHENTICATION TYPE';
c_plugin_type_web_source                constant varchar2(30) := 'WEB SOURCE TYPE';
c_plugin_type_tmpl_component            constant varchar2(30) := 'TEMPLATE COMPONENT';
c_plugin_type_ir_column                 constant varchar2(30) := 'IR COLUMN';

c_plugin_prefix_regexp                  constant varchar2(22) := '^(NATIVE|PLUGIN|TMPL)_';

-- attribute scope
c_attribute_scope_application           constant varchar2(20) := 'APPLICATION';
c_attribute_scope_report                constant varchar2(20) := 'REPORT';
c_attribute_scope_report_group          constant varchar2(20) := 'REPORT_GROUP';
c_attribute_scope_component             constant varchar2(20) := 'COMPONENT';
c_attribute_scope_column                constant varchar2(20) := 'COLUMN';

c_template_component_std_attr           constant varchar2(255) := 'SOURCE_LOCATION:AJAX_ITEMS_TO_SUBMIT:ORDER_BY:NO_DATA_FOUND_MESSAGE:NO_DATA_FOUND_ICON:SUPPORTS_EXTERNAL_FILTERING';
--
-- possible plugin types for ajax callbacks: item, region, dynamic action,
-- authentication, template component
--
c_ajax_callback_item                    constant varchar2(12) := 'ITEM TYPE';
c_ajax_callback_region                  constant varchar2(12) := 'REGION TYPE';
c_ajax_callback_dynamic_action          constant varchar2(12) := 'DA TYPE';
c_ajax_callback_authentication          constant varchar2(12) := 'AUTH TYPE';
c_ajax_callback_tmpl                    constant varchar2(12) := 'TMPL TYPE';

c_null_item_meta_data_result            wwv_flow_plugin_api.t_item_meta_data_result;
c_null_item_render_result               wwv_flow_plugin_api.t_item_render_result;

c_web_source_fetch                      constant t_web_source_plugin_function := 1;
c_web_source_dml                        constant t_web_source_plugin_function := 2;
c_web_source_discover                   constant t_web_source_plugin_function := 3;
c_web_source_execute                    constant t_web_source_plugin_function := 4;
c_web_source_capabilities               constant t_web_source_plugin_function := 5;

c_media_source_url                      constant varchar2(3)  := 'URL';
c_media_source_url_column               constant varchar2(10) := 'URL_COLUMN';
c_media_source_blob_column              constant varchar2(11) := 'BLOB_COLUMN';

--
c_empty_process_meta_data               t_process_meta_data;

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
g_query_meta_data                       wwv_flow_exec.t_query_meta_data;
g_web_source_dml_meta_data              wwv_flow_exec.t_web_source_dml_meta_data;
g_process_meta_data                     t_process_meta_data;

--
--==============================================================================
-- Reset internal caches.
--==============================================================================
procedure reset;

--
--==============================================================================
-- returns plug-in settings for a given plugin.
--==============================================================================
function get_plugin_data(
    p_plugin_identifier in varchar2 )
    return wwv_flow_plugin_api.t_plugin;

--==============================================================================
-- fetches Web Source Parameter Meta data for DML regions
--==============================================================================
procedure fetch_dml_web_src_parameters(
    p_region_id         in number );

--
--==============================================================================
-- Procedure to initialize all plug-in settings of the current application.
--==============================================================================
procedure initialize_plugin_data;
--
--==============================================================================
-- Returns the name attribute which has to be used for a HTML input element if
-- you want that the value of the element is stored in session state when the
-- page is submitted.
--==============================================================================
function get_input_name_for_item return varchar2;
--
--==============================================================================
-- Returns the AJAX identifier which has to be used for the on-demand call
-- of a plug-in.
--
-- Note: if the plug-in doesn't have an AJAX callback configured, null will be
--       returned!
--==============================================================================
function get_ajax_identifier return varchar2;

--==============================================================================
-- Returns the AJAX identifier for an item
--==============================================================================
function get_ajax_identifier_for_item (
    p_item_id in number )
    return varchar2;
--
--==============================================================================
-- Sets the attribute_xx parameters to the default values defined for the plugin
-- specified in p_plugin_name. If a p_attribute_xx parameter contains a value,
-- then the value is NOT modified.
--
-- To be moved to wwv_flow_plugin_dev when all other runtime-only references
-- have been resolved.
--==============================================================================
procedure set_defaults (
    p_application_id  in            number   default null,
    p_plugin_type     in            varchar2,
    p_plugin_name     in            varchar2,
    p_attribute_scope in            varchar2 default 'COMPONENT',
    p_attribute_01    in out nocopy varchar2,
    p_attribute_02    in out nocopy varchar2,
    p_attribute_03    in out nocopy varchar2,
    p_attribute_04    in out nocopy varchar2,
    p_attribute_05    in out nocopy varchar2,
    p_attribute_06    in out nocopy varchar2,
    p_attribute_07    in out nocopy varchar2,
    p_attribute_08    in out nocopy varchar2,
    p_attribute_09    in out nocopy varchar2,
    p_attribute_10    in out nocopy varchar2,
    p_attribute_11    in out nocopy varchar2,
    p_attribute_12    in out nocopy varchar2,
    p_attribute_13    in out nocopy varchar2,
    p_attribute_14    in out nocopy varchar2,
    p_attribute_15    in out nocopy varchar2 );
--
--==============================================================================
-- Sets the attribute_xx parameters to the default values defined for the plugin
-- specified in p_plugin_name. If a p_attribute_xx parameter contains a value,
-- then the value is NOT modified.
--
-- To be moved to wwv_flow_plugin_dev when all other runtime-only references
-- have been resolved.
--==============================================================================
procedure set_defaults (
    p_application_id  in            number   default null,
    p_plugin_type     in            varchar2,
    p_plugin_name     in            varchar2,
    p_attribute_scope in            varchar2 default 'COMPONENT',
    p_attribute_01    in out nocopy varchar2,
    p_attribute_02    in out nocopy varchar2,
    p_attribute_03    in out nocopy varchar2,
    p_attribute_04    in out nocopy varchar2,
    p_attribute_05    in out nocopy varchar2,
    p_attribute_06    in out nocopy varchar2,
    p_attribute_07    in out nocopy varchar2,
    p_attribute_08    in out nocopy varchar2,
    p_attribute_09    in out nocopy varchar2,
    p_attribute_10    in out nocopy varchar2,
    p_attribute_11    in out nocopy varchar2,
    p_attribute_12    in out nocopy varchar2,
    p_attribute_13    in out nocopy varchar2,
    p_attribute_14    in out nocopy varchar2,
    p_attribute_15    in out nocopy varchar2,
    p_attribute_16    in out nocopy varchar2,
    p_attribute_17    in out nocopy varchar2,
    p_attribute_18    in out nocopy varchar2,
    p_attribute_19    in out nocopy varchar2,
    p_attribute_20    in out nocopy varchar2,
    p_attribute_21    in out nocopy varchar2,
    p_attribute_22    in out nocopy varchar2,
    p_attribute_23    in out nocopy varchar2,
    p_attribute_24    in out nocopy varchar2,
    p_attribute_25    in out nocopy varchar2 );
--
--
--==============================================================================
-- Sets the attribute_xx parameters to the default values defined for the plugin
-- specified in p_plugin_name. If a p_attribute_xx parameter contains a value,
-- then the value is NOT modified.
--
-- To be moved to wwv_flow_plugin_dev when all other runtime-only references
-- have been resolved.
--==============================================================================
procedure set_defaults (
    p_application_id  in            number   default null,
    p_plugin_type     in            varchar2,
    p_plugin_name     in            varchar2,
    p_attribute_scope in            varchar2 default 'COMPONENT',
    p_attributes      in out nocopy sys.json_object_t );
--
--
--==============================================================================
--==============================================================================
-- Function to render an item type plugin.
-- p_item_idx contains the index for the wwv_flow.g_item_xx arrays.
--==============================================================================
function render_page_item (
    p_item_idx            in binary_integer,
    p_value               in wwv_flow_session_state_api.t_value,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_item_render_result;
--
--==============================================================================
-- Function to validate an item type plugin. If the validation fails,
-- message will contain a value. display_location and page_item_name can
-- optionally be set.
--==============================================================================
function validate_page_item (
    p_item_id in number )
    return wwv_flow_plugin_api.t_item_validation_result;
--
--==============================================================================
-- Procedure to initialize the p_item record.
--==============================================================================
procedure initialize_item (
    p_plugin_name in            varchar2,
    p_item        in out nocopy wwv_flow_plugin_api.t_item );
--
--==============================================================================
-- Procedure to initialize the p_region record based on the region defined
-- defined by p_region_id.
--==============================================================================
procedure initialize_region_data (
    p_region_id            in            number,
    p_region               in out nocopy wwv_flow_plugin_api.t_region );
--
--==============================================================================
-- Procedure to initialize the p_template_component record.
--==============================================================================
procedure initialize_template_component (
    p_plugin_name               in            varchar2,
    p_define_template           in            boolean,
    p_columns_map               in            wwv_flow_global.vc_map,
    p_pk_columns                in            wwv_flow_t_varchar2,
    p_items_to_submit_singlerow in            varchar2,
    p_region_id                 in            number,
    p_emit_css_js               in            wwv_flow_template_directive.t_when,
    p_url_triggering_element    in            varchar2,
    --
    p_template_component        in out nocopy t_template_component,
    p_used_columns_map             out        wwv_flow_global.vc_map );
--
--==============================================================================
-- Function to get meta data for an item type plugin.
--
-- Note: It's required to call initialize_item before calling this procedure.
--==============================================================================
procedure meta_data_item (
    p_plugin_name in            varchar2,
    p_item        in            wwv_flow_plugin_api.t_item,
    p_param       in            wwv_flow_plugin_api.t_item_meta_data_param,
    p_result      in out nocopy wwv_flow_plugin_api.t_item_meta_data_result );
--
--==============================================================================
-- Procedure initialize page item and meta data
--==============================================================================
procedure meta_page_item (
    p_item_idx in            binary_integer,
    p_result   in out nocopy wwv_flow_plugin_api.t_item_meta_data_result );
--
--==============================================================================
-- Function to render an item type plugin.
--
-- Note: It's required to call initialize_item before calling this procedure.
--==============================================================================
procedure render_item (
    p_plugin_name in            varchar2,
    p_item        in            wwv_flow_plugin_api.t_item,
    p_param       in            wwv_flow_plugin_api.t_item_render_param,
    p_result      in out nocopy wwv_flow_plugin_api.t_item_render_result );
--
--==============================================================================
-- Function to validate an item type plugin. If the validation fails,
-- message will contain a value. display_location and page_item_name can
-- optionally be set.
--
-- Note: It's required to call initialize_item before calling this procedure.
--==============================================================================
function validate_item (
    p_plugin_name in varchar2,
    p_item        in wwv_flow_plugin_api.t_item,
    p_param       in wwv_flow_plugin_api.t_item_validation_param )
    return wwv_flow_plugin_api.t_item_validation_result;
--
--==============================================================================
-- Internal:
--
-- Renders a region plugin and its content, including all slots and components,
-- adhering to the specified grid settings.
--
-- Parameters:
-- * p_plug:                   The region object to be rendered.
-- * p_grid_template:          The grid template to be used for rendering the region.
-- * p_has_grid_support:       Indicates if the current context supports grid.
-- * p_max_fixed_grid_columns: The maximum number of fixed columns supported within the grid.
-- * p_parent_is_read_only:    Indicates if the parent container is in read-only mode.
--
-- Example:
--
-- declare
--     l_result wwv_flow_plugin_api.t_region_render_result;
-- begin
--     ...
--     l_result := wwv_flow_plugin.render_region (
--                     p_plug                   => p_region,
--                     p_grid_template          => p_grid_template,
--                     p_has_grid_support       => p_has_grid_support,
--                     p_max_fixed_grid_columns => p_max_fixed_grid_columns,
--                     p_parent_is_read_only    => p_parent_is_read_only,
--                     p_is_printer_friendly    => wwv_flow.g_printer_friendly );
-- end;
--==============================================================================
function render_region (
    p_plug                   in out nocopy wwv_flow_meta_data.t_plug,
    p_grid_template          in wwv_flow_template.t_grid_template,
    p_has_grid_support       in boolean,
    p_max_fixed_grid_columns in pls_integer,
    p_parent_is_read_only    in boolean,
    p_is_printer_friendly    in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Function to render a dynamic action plugin.
-- p_dynamic_action_id is the id of the non-translated dynamic action.
--==============================================================================
function render_dynamic_action (
    p_dynamic_action_id      in number,
    p_name                   in varchar2,
    p_action                 in varchar2,
    p_attribute_01           in varchar2,
    p_attribute_02           in varchar2,
    p_attribute_03           in varchar2,
    p_attribute_04           in varchar2,
    p_attribute_05           in varchar2,
    p_attribute_06           in varchar2,
    p_attribute_07           in varchar2,
    p_attribute_08           in varchar2,
    p_attribute_09           in varchar2,
    p_attribute_10           in varchar2,
    p_attribute_11           in varchar2,
    p_attribute_12           in varchar2,
    p_attribute_13           in varchar2,
    p_attribute_14           in varchar2,
    p_attribute_15           in varchar2,
    p_init_javascript_code   in varchar2,
    p_triggering_region_id   in number,
    p_affected_elements_type in varchar2,
    p_affected_region_id     in number,
    p_affected_button_id     in number,
    p_affected_elements      in varchar2,
    p_ai_enabled             in boolean,
    p_ai_config_id           in number,
    p_ai_remote_server_id    in number,
    p_ai_system_prompt       in varchar2,
    p_ai_welcome_message     in varchar2 )
    return wwv_flow_plugin_api.t_dynamic_action_render_result;
--
--==============================================================================
-- Function to execute a process plugin.
-- p_process_idx contains the index for the wwv_flow.g_process_xx arrays.
--==============================================================================
function execute_process (
    p_process_int in            wwv_flow_meta_data.t_process,
    p_process     in out nocopy wwv_flow_plugin_api.t_process,
    p_type        in            varchar2 )
    return wwv_flow_plugin_api.t_process_exec_result;
--
--==============================================================================
-- Function to complete a workflow process plugin on which the workflow is waiting.
--==============================================================================
function complete_process (
    p_process_int in            wwv_flow_meta_data.t_process,
    p_process     in out nocopy wwv_flow_plugin_api.t_process,
    p_type        in            varchar2,
    p_param       in            wwv_flow_plugin_api.t_process_complete_param )
    return wwv_flow_plugin_api.t_process_complete_result;
--
--==============================================================================
-- Function to terminate a process plugin of type Workflow Activity,
-- when the corresponding workflow is terminated. The purpose of this process is
-- to free up resources/cancel resources associated with the
-- p_process.correlation_context
--==============================================================================
function terminate_process (
    p_process_int in            wwv_flow_meta_data.t_process,
    p_process     in out nocopy wwv_flow_plugin_api.t_process,
    p_type        in            varchar2 )
    return wwv_flow_plugin_api.t_process_terminate_result;
--
--==============================================================================
-- Function to execute an authorization plugin.
-- p_authorization_id is the id of the non-translated authorization.
--==============================================================================
function execute_authorization (
    p_authorization_id  in number,
    p_type              in varchar2,
    p_name              in varchar2,
    p_username          in varchar2,
    p_caching           in varchar2,
    p_component         in wwv_flow.t_component,
    p_attribute_01      in varchar2,
    p_attribute_02      in varchar2,
    p_attribute_03      in varchar2,
    p_attribute_04      in varchar2,
    p_attribute_05      in varchar2,
    p_attribute_06      in varchar2,
    p_attribute_07      in varchar2,
    p_attribute_08      in varchar2,
    p_attribute_09      in varchar2,
    p_attribute_10      in varchar2,
    p_attribute_11      in varchar2,
    p_attribute_12      in varchar2,
    p_attribute_13      in varchar2,
    p_attribute_14      in varchar2,
    p_attribute_15      in varchar2 )
    return wwv_flow_plugin_api.t_authorization_exec_result;
--
--==============================================================================
-- Function to execute the session sentry function of an authentication plugin.
--==============================================================================
function execute_session_sentry (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;
--
--==============================================================================
-- Function to execute the invalid session function of an authentication plugin.
--==============================================================================
function execute_invalid_session (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_inval_result;
--
--==============================================================================
-- Function to verify if the login credentials of an authentication plugin are
-- valid.
--==============================================================================
function execute_authentication (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_password       in varchar2 )
    return wwv_flow_plugin_api.t_authentication_auth_result;
--
--==============================================================================
-- Procedure to create a response for an AJAX call of an authentication type plugin.
-- p_authentication_id is the id of the non-translated authorization.
--==============================================================================
procedure execute_ajax_auth (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication );
--
--==============================================================================
-- Function to execute the post logout function an authentication plugin.
--==============================================================================
function execute_post_logout (
    p_type           in varchar2,
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return wwv_flow_plugin_api.t_authentication_logout_result;
--
--==============================================================================
-- procedure to execute the fetch operation of a Web Source Module plugin.
--==============================================================================
procedure fetch_web_source (
    p_plugin_name       in            varchar2,
    p_context           in            wwv_flow_exec.t_context,
    p_params            in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result            in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result,
    --
    p_application_id    in            number default wwv_flow_security.g_flow_id,
    p_security_group_id in            number default wwv_flow_security.g_curr_flow_security_group_id,
    p_parse_as_schema   in            varchar2 default wwv_flow_security.g_parse_as_schema );
--
--==============================================================================
-- procedure to execute the fetch operation of a Web Source Module plugin.
--==============================================================================
procedure fetch_web_source (
    p_plugin_name       in            varchar2,
    p_web_source        in out nocopy wwv_flow_plugin_api.t_web_source,
    p_params            in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result            in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result,
    --
    p_application_id    in            number default wwv_flow_security.g_flow_id,
    p_security_group_id in            number default wwv_flow_security.g_curr_flow_security_group_id,
    p_parse_as_schema   in            varchar2 default wwv_flow_security.g_parse_as_schema );
--
--==============================================================================
-- procedure to execute the dml operation of a Web Source Module plugin.
--==============================================================================
procedure dml_web_source (
    p_plugin_name    in            varchar2,
    p_context        in            wwv_flow_exec.t_context,
    p_params         in            wwv_flow_plugin_api.t_web_source_dml_params,
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_dml_result );
--
--==============================================================================
-- procedure to execute the discovery operation of a Web Source Module plugin.
--==============================================================================
procedure discover_web_source (
    p_plugin_name       in            varchar2,
    p_web_source        in            wwv_flow_plugin_api.t_web_source,
    p_params            in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result            in out nocopy wwv_flow_plugin_api.t_web_source_discover_result,
    --
    p_application_id    in            number     default wwv_flow_security.g_flow_id,
    p_security_group_id in            number     default wwv_flow_security.g_curr_flow_security_group_id,
    p_parse_as_schema   in            varchar2   default wwv_flow_security.g_parse_as_schema );

--==============================================================================
procedure discover_web_source (
    p_plugin_name       in            varchar2,
    p_context           in            wwv_flow_exec.t_context,
    p_params            in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result            in out nocopy wwv_flow_plugin_api.t_web_source_discover_result,
    --
    p_application_id    in            number   default wwv_flow_security.g_flow_id,
    p_security_group_id in            number   default wwv_flow_security.g_curr_flow_security_group_id,
    p_parse_as_schema   in            varchar2 default wwv_flow_security.g_parse_as_schema );

--
--==============================================================================
-- procedure to execute the given operation of a Web Source Module plugin (process type)
--==============================================================================
procedure execute_web_source (
    p_plugin_name    in            varchar2,
    p_context        in            wwv_flow_exec.t_context,
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_execute_result );

--
--==============================================================================
-- procedure to execute the "get capabilities" for a Web Source Module Plug-In
--==============================================================================
procedure capabilities_web_source (
    p_plugin_name       in            varchar2,
    p_result            in out nocopy wwv_flow_plugin_api.t_web_source_capabilities,
    --
    p_application_id    in            number   default wwv_flow_security.g_flow_id,
    p_security_group_id in            number   default wwv_flow_security.g_curr_flow_security_group_id,
    p_parse_as_schema   in            varchar2 default wwv_flow_security.g_parse_as_schema );
--
--==============================================================================
-- Function to render a template component plugin.
--==============================================================================
procedure render_template_component (
    p_output                in out nocopy   wwv_flow_t_writer,
    p_template_component    in              t_template_component,
    p_context               in              wwv_flow_exec.t_context,
    p_id_postfix            in              varchar2 );
--
--==============================================================================
-- function to decode an ajax identifier from a "PLUGIN=xxx" request
--==============================================================================
function decode_ajax_request (
    p_request in varchar2 )
    return t_ajax_callback;
--
--==============================================================================
-- Procedure to create a response for an AJAX call of a plugin.
--==============================================================================
procedure ajax_callback (
    p_ajax_callback in t_ajax_callback );
--
--==============================================================================
-- Procedure which immediately emits the css file urls stored for a plug-in.
--==============================================================================
procedure emit_css_file_urls (
    p_plugin_type in varchar2,
    p_name        in varchar2 );
--
--==============================================================================
-- Returns TRUE if the is_translatable flag is set to Y for the specified
-- plug-in attribute.
--==============================================================================
function is_attribute_translatable (
    p_application_id      in number,
    p_plugin_type         in varchar2,
    p_plugin_name         in varchar2,
    p_attribute_scope     in varchar2,
    p_attribute_sequence  in number,
    p_attribute_static_id in varchar2 )
    return boolean;
--
--==============================================================================
-- Returns TRUE if the specified record identified by p_table_name and p_id
-- uses a plug-in where the specified p_column_name is a translatable plug-in
-- attribute. p_table_name has to be one of the tables which support plug-ins
-- ( WWV_FLOW_PLUGIN_SETTINGS, WWV_FLOW_STEP_PROCESSING, WWV_FLOW_PAGE_PLUGS,
--   WWV_FLOW_STEP_ITEMS, WWV_FLOW_PAGE_DA_ACTIONS, WWV_FLOW_SECURITY_SCHEMES,
--   WWV_FLOW_AUTHENTICATIONS ) and p_column_name has to be ATTRIBUTE_xx.
--==============================================================================
function is_column_translatable (
    p_application_id    in number,
    p_table_name        in varchar2,
    p_column_name       in varchar2,
    p_column_json_path  in varchar2,
    p_id                in number )
    return boolean;
--
--
--
--==============================================================================
-- Get the URL to the plug-in file storage if no other URL has been specified
-- ( for custom plugins )
--==============================================================================
function get_file_prefix (
    p_file_prefix   in varchar2,
    p_plugin_id     in number,
    p_files_version in number )
    return varchar2;
--
--
--==============================================================================
-- Transforms a JSON key foo into a JSON selector $."foo"
-- while properly escaping any special characters
--==============================================================================
function make_json_path_from_key (
    p_key in varchar2 )
    return varchar2
    deterministic;
--
--
--==============================================================================
-- Transforms a JSON selector of type $."foo" into foo
-- while properly unescaping any special characters
--==============================================================================
function get_key_from_json_path (
    p_json_path in varchar2 )
    return varchar2
    deterministic;

--==============================================================================
-- Generate the PL/SQL that would execute a callout function or procedure for
-- any plugin
--==============================================================================
function generate_callout_plsql (
    p_plugin_type in varchar2,
    p_property_id in wwv_meta_meta_data.t_property_id,
    p_api_version in number,
    p_plsql_code  in varchar2,
    p_function    in varchar2 )
    return varchar2;
--
--
end wwv_flow_plugin;
/
show errors
