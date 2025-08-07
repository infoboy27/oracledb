set define '^' verify off
prompt ...wwv_flow_exec_web_src.sql
create or replace package wwv_flow_exec_web_src as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_exec_web_src.sql
--
--    DESCRIPTION
--      Web source implementation
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    03/14/2017 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global type to represent a web source operation
--==============================================================================
subtype t_sync_type                  is pls_integer range 1..5;

c_sync_type_merge           constant t_sync_type                  := 1;
c_sync_type_append          constant t_sync_type                  := 2;
c_sync_type_replace         constant t_sync_type                  := 3;
c_sync_type_truncate        constant t_sync_type                  := 4;
c_sync_type_merge_insert    constant t_sync_type                  := 5;

subtype t_max_requests_exceed_action is pls_integer range 1..2;

c_max_requests_exceed_wait  constant t_max_requests_exceed_action := 1;
c_max_requests_exceed_error constant t_max_requests_exceed_action := 2;

type t_web_source_param is record(
    id                    wwv_flow_web_src_params.id%type,
    name                  wwv_flow_web_src_params.name%type,
    is_required           boolean,
    direction             wwv_flow_plugin_api.t_web_source_param_dir,
    param_type            wwv_flow_plugin_api.t_web_source_param_type,
    data_type             wwv_flow_exec_api.t_data_type,
    output_format_mask    wwv_flow_web_src_params.output_format_mask%type,
    validation_regexp     wwv_flow_web_src_params.validation_regexp%type,
    value                 wwv_flow_web_src_params.value%type,
    component_value       wwv_flow_web_src_comp_params.value%type,
    component_value_type  wwv_flow_web_src_comp_params.value_type%type,
    is_static             boolean,
    is_array              boolean,
    array_separator_char  varchar2(1 CHAR),
    omit_when_null        boolean,
    is_query_param        boolean );

type t_web_source_params is table of t_web_source_param index by binary_integer;

-------------------------------------------------------------------------------

type t_web_source_sync_step is record(
    id                     wwv_flow_web_src_sync_steps.id%type,
    external_filter_expr   wwv_flow_web_src_sync_steps.external_filter_expr%type,
    static_id              wwv_flow_web_src_sync_steps.static_id%type );

type t_web_source_sync_steps is table of t_web_source_sync_step index by pls_integer;

-------------------------------------------------------------------------------

type t_web_source_sync is record(
    is_active              boolean,
    table_owner            wwv_flow_global.t_dbms_id,
    table_name             wwv_flow_global.t_dbms_id,
    sync_type              t_sync_type,
    interval               wwv_flow_web_src_modules.sync_interval%type,
    commit_interval        wwv_flow_web_src_modules.sync_commit_interval%type,
    max_http_requests      wwv_flow_web_src_modules.sync_max_http_requests%type,
    -- job_name
    -- next_run_timestamp
    --
    steps                  t_web_source_sync_steps );

-------------------------------------------------------------------------------

type t_web_source_operation is record(
    flow_id                     number,
    module_id                   number,
    module_static_id            wwv_flow_web_src_modules.static_id%type,
    operation_id                number,
    array_column_id             number,
    --
    web_source_plugin_type      wwv_flow_web_src_modules.web_source_type%type,
    --
    base_url                    varchar2(32767),
    https_host                  varchar2(500),
    --
    auth_token_url              varchar2(32767),
    auth_https_host             varchar2(500),
    credential_id               wwv_flow_web_src_modules.credential_id%type,
    --
    operation                   wwv_flow_web_src_operations.operation%type,
    db_operation                wwv_flow_plugin_api.t_db_operation,
    --
    url_pattern                 wwv_flow_web_src_operations.url_pattern%type,
    request_body_template       wwv_flow_web_src_operations.request_body_template%type,
    params                      t_web_source_params,
    --
    timeout                     pls_integer,
    pass_ecid                   boolean,
    max_requests_timeframe_sec  pls_integer,
    max_requests                pls_integer,
    max_requests_exceed_action  t_max_requests_exceed_action,
    --
    fixed_page_size             pls_integer,
    allow_fetch_all_rows        boolean,
    fetch_all_rows_timeout      pls_integer,
    --
    force_error_for_http_404    boolean,
    --
    caching                     wwv_flow_web_src_operations.caching%type,
    invalidate_when             wwv_flow_web_src_operations.invalidate_when%type,
    --
    security_scheme             wwv_flow_web_src_operations.security_scheme%type,
    --
    data_profile_id             wwv_flow_web_src_modules.data_profile_id%type,
    data_profile                wwv_flow_data_profile.t_data_profile,
    array_column_name           wwv_flow_data_profile_cols.name%type,
    --
    use_local_table             boolean,
    --
    synchronization             t_web_source_sync,
    --
    attribute_01                wwv_flow_web_src_modules.attribute_01%type,
    attribute_02                wwv_flow_web_src_modules.attribute_02%type,
    attribute_03                wwv_flow_web_src_modules.attribute_03%type,
    attribute_04                wwv_flow_web_src_modules.attribute_04%type,
    attribute_05                wwv_flow_web_src_modules.attribute_05%type,
    attribute_06                wwv_flow_web_src_modules.attribute_06%type,
    attribute_07                wwv_flow_web_src_modules.attribute_07%type,
    attribute_08                wwv_flow_web_src_modules.attribute_08%type,
    attribute_09                wwv_flow_web_src_modules.attribute_09%type,
    attribute_10                wwv_flow_web_src_modules.attribute_10%type,
    attribute_11                wwv_flow_web_src_modules.attribute_11%type,
    attribute_12                wwv_flow_web_src_modules.attribute_12%type,
    attribute_13                wwv_flow_web_src_modules.attribute_13%type,
    attribute_14                wwv_flow_web_src_modules.attribute_14%type,
    attribute_15                wwv_flow_web_src_modules.attribute_15%type );

--==============================================================================
-- contants
--==============================================================================

c_def_user_agent_hdr        constant varchar2(26)                 := 'Oracle APEX';

c_native_web_src_http       constant varchar2(11)                 := 'NATIVE_HTTP';
c_native_web_src_ords       constant varchar2(13)                 := 'NATIVE_ORDS';
c_native_web_src_oci        constant varchar2(10)                 := 'NATIVE_OCI';
c_native_web_src_adfbc      constant varchar2(12)                 := 'NATIVE_ADFBC';
c_native_web_src_boss       constant varchar2(11)                 := 'NATIVE_BOSS';
c_native_web_src_restsql    constant varchar2(29)                 := 'NATIVE_REST_ENABLED_SQL_QUERY';
c_native_web_src_odata      constant varchar2(12)                 := 'NATIVE_ODATA';

c_empty_web_source_params   t_web_source_params;

--==============================================================================
-- Globals
--==============================================================================

--======================================================================================================================
--
-- 1 .   M E T A   D A T A   P R O C E D U R E S
--
--======================================================================================================================

--==============================================================================
-- finds the web source module id by static ID
--
-- PARAMETERS:
-- * p_module_static_id        web source module static ID
-- * p_application_id          application ID (optional)
--
-- RETURNS:
-- * the ID of the web source module
--==============================================================================
function find_web_src_module_id(
    p_module_static_id in varchar2,
    p_application_id   in number default wwv_flow.g_flow_id )
    return wwv_flow_web_src_modules.id%type;

--==============================================================================
-- finds the web source module id by static ID
--
-- PARAMETERS:
-- * p_application_id:         application ID (optional)
-- * p_module_static_id:       web source module static ID
-- * p_array_column_name:      name of a data profile array column
--
-- * p_web_src_module_id:      ID of the REST Data Source
-- * p_array_column_id:        ID of the array column
--==============================================================================
procedure find_rest_source_ids(
    p_application_id     in number    default wwv_flow.g_flow_id,
    p_module_static_id   in varchar2,
    p_array_column_name  in varchar2  default null,
    --
    p_web_src_module_id out number,
    p_array_column_id   out number );

--==============================================================================
-- finds the web source module and operation IDs
--
-- PARAMETERS:
-- * p_application_id         (optional) application ID
-- * p_module_name            web source module name
-- * p_operation              web source operation
-- * p_url_pattern            (optional) URL pattern to look up the module and operation IDs
--
-- RETURNS:
-- * p_module_id              web source module_id
-- * p_operation_id           web source operation id
--==============================================================================
procedure find_websrc_module_operation(
    p_module_name      in  varchar2,
    p_operation        in  varchar2,
    p_url_pattern      in  varchar2 default null,
    p_application_id   in  number   default wwv_flow.g_flow_id,
    --
    p_module_id        out number,
    p_operation_id     out number );

--==============================================================================
-- finds the web source module and operation IDs
--
-- PARAMETERS:
-- * p_application_id         (optional) application ID
-- * p_module_static_id       web source module static ID
-- * p_operation              web source operation
-- * p_url_pattern            (optional) URL pattern to look up the module and operation IDs
--
-- RETURNS:
-- * p_module_id              web source module_id
-- * p_operation_id           web source operation id
--==============================================================================
procedure find_websrc_module_operation(
    p_module_static_id in  varchar2,
    p_operation        in  varchar2,
    p_url_pattern      in  varchar2 default null,
    p_application_id   in  number   default wwv_flow.g_flow_id,
    --
    p_module_id        out number,
    p_operation_id     out number );

--==============================================================================
-- finds the web source module and operation IDs
--
-- PARAMETERS:
-- * p_application_id         (optional) application ID
-- * p_module_static_id       web source module static ID
-- * p_operation_static_id    web source operation static ID
--
-- RETURNS:
-- * p_module_id              web source module_id
-- * p_operation_id           web source operation id
--==============================================================================
procedure find_websrc_module_operation(
    p_application_id      in  number   default wwv_flow.g_flow_id,
    p_module_static_id    in  varchar2,
    p_operation_static_id in  varchar2,
    --
    p_module_id           out number,
    p_operation_id        out number );

--==============================================================================
-- fetches all data for a web source operation into one record.
--
-- PARAMETERS:
-- * p_web_src_module_id          REST Source module ID to lookup operation from
-- * p_operation_type             lookup web source operation for this given DB operation
-- * p_array_column_id            lookup web source operation for this given Array ID column
-- * p_for_synchronization        whether to include synchronization data
--
-- RETURNS:
-- * p_web_src_operation_id       ID of the Web Source operation found.
-- * p_web_source                 instance of t_web_source_operation, containing all meta data for a web source operation
--==============================================================================
procedure fetch_web_source (
    p_web_src_module_id     in            wwv_flow_web_src_modules.id%type,
    p_web_src_operation_id  in out nocopy wwv_flow_web_src_operations.id%type,
    --
    p_operation_type        in            wwv_flow_exec.t_context_type          default null,
    p_array_column_id       in            number                                default null,
    --
    p_web_source            in out nocopy t_web_source_operation,
    p_for_synchronization   in            boolean                               default false );

--==============================================================================
-- Overrides the application setting for "Pass ECID"
--==============================================================================
function get_pass_ecid_override return boolean;

--==============================================================================
-- Overrides the application setting for "Pass ECID".
--
-- PARAMETERS:
-- * p_override                   boolean override value
--
-- Also see wwv_flow_security.can_pass_ecid
--==============================================================================
procedure set_pass_ecid_override (
    p_override in boolean );

--======================================================================================================================
--
-- 2 .   U T I L I T Y   F U N C T I O N S
--
--======================================================================================================================


--======================================================================================================================
--
-- 3 .   W E B   S O U R C E   /   C O M P O N E N T   P A R A M E T E R S
--
--======================================================================================================================

--==============================================================================
-- get component parameter values for a given region ID
--
-- PARAMETERS:
-- * p_region_id           ID of the region to fetch component parameters
--
-- RETURNS:
-- * array of parameter names, data types and values
--==============================================================================
function get_region_parameters(
    p_region_id              in wwv_flow_web_src_comp_params.page_plug_id%type)
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- get component parameter values and OUT parameters for a given region ID
--
-- PARAMETERS:
-- * p_region_id           ID of the region to fetch component parameters
-- * p_for_operation       return parameters for the module level and for the operation which
--                         maps to this database operation.
--
-- RETURNS:
-- * p_in_parameters       array of IN parameter names, data types and values
-- * p_out_parameters      array of OUT parameter names, data types and values
--==============================================================================
procedure get_region_parameters(
    p_region_id              in wwv_flow_web_src_comp_params.page_plug_id%type,
    p_for_operation          in wwv_flow_plugin_api.t_db_operation,
    --
    p_in_parameters         out wwv_flow_exec_api.t_parameters,
    p_out_parameters        out wwv_flow_exec.t_web_source_out_params );

--==============================================================================
-- get component parameter values for a given page process ID
--
-- PARAMETERS:
-- * p_page_process_id     ID of the page process to fetch component parameters
--
-- RETURNS:
-- * p_in_parameters:  array of parameter names, data types and values
-- * p_out_parameters: array of parameter names, data types and values
--==============================================================================
procedure get_page_process_parameters(
    p_page_process_id        in wwv_flow_web_src_comp_params.page_process_id%type,
    --
    p_in_parameters         out wwv_flow_exec_api.t_parameters,
    p_out_parameters        out wwv_flow_exec.t_web_source_out_params );

--==============================================================================
-- get component parameter values for a given workflow activity ID
--
-- PARAMETERS:
-- * p_workflow_activity_id     ID of the workflow activity to fetch component parameters
--
-- RETURNS:
-- * p_in_parameters:  array of parameter names, data types and values
-- * p_out_parameters: array of parameter names, data types and values
--==============================================================================
procedure get_workflow_act_parameters(
    p_workflow_activity_id   in wwv_flow_web_src_comp_params.workflow_activity_id%type,
    --
    p_in_parameters         out wwv_flow_exec_api.t_parameters,
    p_out_parameters        out wwv_flow_exec.t_web_source_out_params );

--==============================================================================
-- get component parameter values for a given application process ID
--
-- PARAMETERS:
-- * p_app_process_id      ID of the application process to fetch component parameters
--
-- RETURNS:
-- * array of parameter names, data types and values
--==============================================================================
function get_app_process_parameters(
    p_app_process_id            in wwv_flow_web_src_comp_params.app_process_id%type )
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- get component parameter values for a given synchronization step
--
-- PARAMETERS:
-- * p_module_sync_step_id ID of the sync step to fetch component parameters
--
-- RETURNS:
-- * array of parameter names, data types and values
--==============================================================================
function get_sync_step_parameters(
    p_module_sync_step_id       in wwv_flow_web_src_comp_params.module_sync_step_id%type
) return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- get component parameter values for a given JET chart series ID
--
-- PARAMETERS:
-- * p_jet_chart_series_id ID of the JET chart series to fetch component parameters
--
-- RETURNS:
-- * array of parameter names, data types and values
--==============================================================================
function get_jet_chart_parameters(
    p_jet_chart_series_id       in wwv_flow_web_src_comp_params.jet_chart_series_id%type )
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- get component parameter values for a given shared LOV ID
--
-- PARAMETERS:
-- * p_shared_lov_id       ID of the shared LOV to fetch component parameters
--
-- RETURNS:
-- * array of parameter names, data types and values
--==============================================================================
function get_shared_lov_parameters(
    p_shared_lov_id             in wwv_flow_web_src_comp_params.shared_lov_id%type )
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- get component parameter values for a automation trigger ID
--
-- PARAMETERS:
-- * p_automation_id        ID of the automation to fetch component parameters
--
-- RETURNS:
-- * array of parameter names, data types and values
--==============================================================================
function get_automation_parameters(
    p_automation_id             in wwv_flow_web_src_comp_params.automation_id%type )
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- get component parameter values for a map region layer ID
--
-- PARAMETERS:
-- * p_map_region_layer_id  ID of the map layer to fetch component parameters
--
-- RETURNS:
-- * array of parameter names, data types and values
--==============================================================================
function get_map_layer_parameters(
    p_map_region_layer_id in wwv_flow_web_src_comp_params.map_region_layer_id%type )
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- get component parameter values for a search configuration ID
--
-- PARAMETERS:
-- * p_search_config_id  ID of the search configuration to fetch component parameters
--
-- RETURNS:
-- * array of parameter names, data types and values
--==============================================================================
function get_search_config_parameters(
    p_search_config_id in wwv_flow_web_src_comp_params.search_config_id%type )
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- compute final web source parameter values based on web service module definitions
-- and actual component parameters.
-- Expects the context object to be populated with the component-specific parameter values.
--
-- PARAMETERS:
-- * p_context             context object to populate with parameter values
-- * p_web_source          web source operation meta data
--
-- RETURNS:
-- * p_context             context object, populated with parameter values
--==============================================================================
procedure compute_in_parameter_values(
    p_web_source             in            t_web_source_operation,
    --
    p_context_filters        in out nocopy wwv_flow_exec_api.t_filters,
    p_context_parameters     in out nocopy wwv_flow_exec_api.t_parameters );

--======================================================================================================================
--
-- 4 .   W E B   S O U R C E   " G E T   C A P A B I L I T I E S "
--
--======================================================================================================================

--==============================================================================
-- returns a record structure with information about web source capabilities
--
-- PARAMETERS
-- * p_web_source_module_id          web source module ID to get capabilities for
--
-- RETURNS
-- * capabilities record structure
--==============================================================================
function get_capabilities(
    p_web_source_module_id in wwv_flow_web_src_modules.id%type )
    return wwv_flow_exec_api.t_source_capabilities;

--======================================================================================================================
--
-- 5 .   W E B   S O U R C E   " F E T C H "
--
--======================================================================================================================

--==============================================================================
-- Performs the "open_query_context" operation for execution on a web source
--
-- PARAMETERS:
-- * p_context              context object with execution details
-- * p_web_src_operation    already fetched information about the web src operation
--
-- RETURNS:
-- * p_context              context object with execution details
--==============================================================================
procedure open_query_context(
    p_context              in out nocopy wwv_flow_exec.t_context,
    p_web_source_operation in            t_web_source_operation );

--==============================================================================
-- Performs the "open_query_context" operation for execution on a web source
--
-- PARAMETERS:
-- * p_context          IN context object with execution details
--
-- RETURNS:
-- * p_context              context object with execution details
--==============================================================================
procedure open_query_context(
    p_context                in out nocopy wwv_flow_exec.t_context );

--==============================================================================
-- fetches the next page of a web source response
--
-- PARAMETERS:
-- * p_context          IN context object with execution details
--
-- RETURNS:
-- * p_context          IN context object with execution details
-- *                    true if a next page exists, false otherwise
--==============================================================================
function next_page(
    p_context in out nocopy wwv_flow_exec.t_context )
    return boolean;

--======================================================================================================================
--
-- 6 .   W E B   S O U R C E   " D M L "
--
--======================================================================================================================

--==============================================================================
-- Performs DML execution on a web source. For a query context, this procedure
-- does nothing, for a DML context, DML operations are being performed for the
-- rows within the context object.
--
-- PARAMETERS:
-- * p_context               context object with execution details
-- * p_continue_on_error     for multi-row context, whether to continue execution
--                           for subsequent rows when an error occurred for one row.
--
-- RETURNS:
-- * p_context               context object with execution details
--==============================================================================
procedure execute_dml (
    p_context                    in out nocopy wwv_flow_exec.t_context,
    p_continue_on_error          in            boolean                     default false );

--======================================================================================================================
--
-- 7 .   W E B   S O U R C E   " P R O C E S S "
--
--======================================================================================================================

--==============================================================================
-- Performs the "open_process_context" operation for execution on a web source.
--
-- PARAMETERS:
-- * p_context               context object with execution details
--
-- RETURNS:
-- * p_context               context object with execution details
--==============================================================================
procedure open_process_context(
    p_context in out nocopy wwv_flow_exec.t_context );

--======================================================================================================================
--
-- 8 .   O T H E R   P U B L I C   A P I
--
--======================================================================================================================

--==============================================================================
-- returns the currently active Web Source Module ID. This is for Web Service
-- logging to also record the Web Source Module ID.
--
-- RETURNS:
-- * the ID of the currently "active" Web Source Module, NULL otherwise
--==============================================================================
function get_current_web_src_module_id return number;

--==============================================================================
-- Purges the cache for the FETCH_COLLECTION database operation of a Web Source Module
--
-- PARAMETERS:
-- * p_application_id         Application ID
-- * p_module_id              Purge cache entries for the given web sourc module ID
-- * p_current_session_only   Purge only cache entries for the current session
--==============================================================================
procedure purge_cache(
    p_application_id       in number,
    p_module_id            in number,
    p_current_session_only in boolean );

--======================================================================================================================
--
-- 9 .   P L U G I N   D I S P A T C H E R S
--
--======================================================================================================================

--==============================================================================
-- "Fetch" procedure for native web source plug-ins
--==============================================================================
procedure fetch_native_web_source(
    p_type       in            varchar2,
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result );

--==============================================================================
-- "DML" procedure for native web source plug-ins
--==============================================================================
procedure dml_native_web_source(
    p_type       in            varchar2,
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_dml_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_dml_result );

--==============================================================================
-- "Execute" procedure for native web source plug-ins
--==============================================================================
procedure execute_native_web_source(
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_execute_result );

--==============================================================================
-- "Capabilities" procedure for native web source plug-ins
--==============================================================================
procedure capabilities_web_source(
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_capabilities );

--==============================================================================
-- "Discover" procedure for native web source plug-ins
--==============================================================================
procedure discover_native_web_source(
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );


end wwv_flow_exec_web_src;
/
show err

set define '^'
