set define '^' verify off
prompt ...wwv_flow_web_src_dev.sql
create or replace package wwv_flow_web_src_dev authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_web_src_dev.sql
--
--    DESCRIPTION
--      Web source implementation
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    05/30/2017 - Created
--    ascheffe    08/18/2023 - made public
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

--==============================================================================
-- Copy a web source module, between applications p_from_application_id to p_to_application_id.
--
-- p_subscribe:
--     if true then the new web source module gets a subscription to the old one.
-- p_if_existing_raise_dupval:
--     if true and a web source module with the same name already exists in
--     p_to_flow_id then DUP_VAL_ON_INDEX gets thrown.
--==============================================================================
function copy_web_src_module (
    p_from_application_id      in            number,
    p_name                     in            varchar2,
    p_to_application_id        in            number,
    p_to_name                  in            varchar2 default null,
    p_subscribe                in            boolean  default false,
    p_if_existing_raise_dupval in            boolean  default false )
    return number;

--==============================================================================
-- Copy a web source module, between applications p_from_application_id to p_to_application_id.
--
-- p_subscribe:
--     if true then the new web source module gets a subscription to the old one.
-- p_if_existing_raise_dupval:
--     if true and a web source module with the same name already exists in
--     p_to_flow_id then DUP_VAL_ON_INDEX gets thrown.
--==============================================================================
function copy_web_src_module (
    p_from_application_id      in            number,
    p_from_web_src_module_id   in            number,
    p_to_application_id        in            number,
    p_to_name                  in            varchar2 default null,
    p_subscribe                in            boolean  default false,
    p_if_existing_raise_dupval in            boolean  default false )
    return number;

--==============================================================================
function copy_web_src_module (
    p_from_application_id      in            number,
    p_name                     in            varchar2,
    p_to_application_id        in            number,
    p_to_name                  in            varchar2 default null,
    p_subscribe                in            boolean  default false,
    p_if_existing_raise_dupval in            boolean  default false,
    --
    p_param_map                in out nocopy wwv_flow_global.vc_map )
    return number;

--==============================================================================
-- Copy a REST Source to another application, but only if the static ID
-- is not already taken. If a REST Source with the given static ID already
-- exists, simply return its ID.
--==============================================================================
function copy_module_when_not_exists(
    p_from_application_id  in            number,
    p_to_application_id    in            number,
    p_static_id            in            varchar2,
    p_name                 in            varchar2,
    p_subscribe            in            boolean    default false,
    --
    p_array_map            in out nocopy wwv_flow_global.vc_map,
    p_param_map            in out nocopy wwv_flow_global.vc_map )
    return number;

--==============================================================================
-- computes the map of "from parameter ID" to "to parameter" ID for two
-- REST Data Sources. The result is a list o REST Source Parameter IDs of
-- of the source REST Source, mapped to the corresponding parameter of the
-- destination REST Source.
--==============================================================================
procedure compute_web_src_param_map(
    p_from_application_id           in            number,
    p_to_application_id             in            number,
    p_from_web_src_module_id        in            number,
    p_to_web_src_module_id          in            number,
    --
    p_array_map                     in out nocopy wwv_flow_global.vc_map,
    p_param_map                     in out nocopy wwv_flow_global.vc_map );

--==============================================================================
-- This procedure pulls content from the master remote server and
-- copies it to the subscribing remote server.
--==============================================================================
procedure subscribe_web_src_module (
    p_web_src_module_id        in number,
    p_master_web_src_module_id in number );

--===============================================================================
-- Returns Y when the data profile of a REST Data Source contains array columns,
-- 'N' otherwise.
--===============================================================================
function web_src_has_array_columns(
    p_web_src_module_id    in number )
    return varchar2;

--==============================================================================
-- converts a remote server base URL into a  server name
--==============================================================================
function get_remote_server_name(
    p_url  in varchar2 ) return varchar2;

--==============================================================================
-- If the master remote server ID is not passed, get the master remote server ID
-- and refresh subscribing remote server.
--==============================================================================
procedure unsubscribe_web_src_module (
    p_web_src_module_id in number );

--==============================================================================
-- Refresh remote server with the master remote server content.
--==============================================================================
procedure refresh_web_src_module (
    p_web_src_module_id in number );

--==============================================================================
-- deletes a web source module. Also removes associated data profiles and
-- remote servers, if requested. Data profiles and remote servers are only
-- deleted, when not referenced by other components.
--
-- PARAMETERS
--     p_web_src_module_id    IN    ID of the web source module to remove
--     p_remove_remote_server IN    whether to remove the remote server
--     p_remove_data_profile  IN    whether to remove the data profile
--
--==============================================================================
procedure remove_web_src_module(
    p_web_src_module_id    in number,
    p_application_id       in number,
    p_remove_remote_server in boolean default false,
    p_remove_data_profile  in boolean default false );

--==============================================================================
-- determine component parameter attributes, based on parameter direction,
-- value type and whether it's required.
--==============================================================================
procedure get_value_attributes(
    p_direction       in wwv_flow_web_src_params.direction%type,
    p_default_value   in wwv_flow_web_src_params.value%type,
    p_is_required     in wwv_flow_web_src_params.is_required%type,
    --
    p_value_type     out wwv_flow_web_src_comp_params.value_type%type,
    p_value          out wwv_flow_web_src_comp_params.value%type,
    p_ignore_output  out boolean );

--==============================================================================
-- executes a web source operation and stores the response into a collection
--
-- PARAMETERS
--     p_web_src_module_id     Web Source Module ID
--     p_web_src_operation_id  ID of the operation to execute
--     p_collection            name of the collection to write the information to
--==============================================================================
procedure test_web_src_operation(
    p_web_src_module_id    in number,
    p_web_src_operation_id in number,
    p_data_collection      in varchar2 default 'WEB_SOURCE_DATA',
    p_info_collection      in varchar2 default 'WEB_SOURCE_INFO');

--==============================================================================
-- extracts placeholders from a request body template and create operation
-- parameters if the names are not already taken.
--
-- PARAMETERS
--     p_flow_id               application ID
--     p_web_src_module_id     Web Source Module ID
--     p_web_src_operation_id  ID of the operation to execute
--     p_request_body_template Request Body template to extract parameters from
--==============================================================================
procedure sync_parameters_from_body(
    p_flow_id               in number,
    p_web_src_module_id     in number,
    p_web_src_operation_id  in number,
    p_request_body_template in clob );

--==============================================================================
-- stores data profile columns after discovery or rediscovery
--==============================================================================
procedure store_data_profile_columns(
    p_application_id      in number              default v('FB_FLOW_ID'),
    p_data_profile_id     in number,
    p_info_collection     in varchar2            default 'WEB_SOURCE_INFO',
    p_replace             in boolean             default false );

--==============================================================================
-- stores a web source module based on discovery information
--==============================================================================
procedure store_web_src_module(
    p_application_id      in number              default v('FB_FLOW_ID'),
    p_module_name         in varchar2,
    p_web_source_type     in varchar2,
    --
    p_remote_server_id    in number              default null,
    p_server_base_url     in varchar2            default null,
    p_url_pattern         in varchar2,
    p_https_host          in varchar2            default null,
    --
    p_oauth_token_url     in varchar2            default null,
    --
    p_credential_store_id in number              default null,
    p_auth_scheme         in varchar2            default null,
    p_client_id           in varchar2            default null,
    p_client_secret       in varchar2            default null,
    p_username            in varchar2            default null,
    p_password            in varchar2            default null,
    p_namespace           in varchar2            default null,
    p_fingerprint         in varchar2            default null,
    --
    p_info_collection     in varchar2            default 'WEB_SOURCE_INFO',
    --
    p_attribute_01        in varchar2            default null,
    p_attribute_02        in varchar2            default null,
    p_attribute_03        in varchar2            default null,
    p_attribute_04        in varchar2            default null,
    p_attribute_05        in varchar2            default null,
    p_attribute_06        in varchar2            default null,
    p_attribute_07        in varchar2            default null,
    p_attribute_08        in varchar2            default null,
    p_attribute_09        in varchar2            default null,
    p_attribute_10        in varchar2            default null,
    p_attribute_11        in varchar2            default null,
    p_attribute_12        in varchar2            default null,
    p_attribute_13        in varchar2            default null,
    p_attribute_14        in varchar2            default null,
    p_attribute_15        in varchar2            default null );

--==============================================================================
-- remove unsupported component parameters from Regions, JET Charts, Map Layers,
-- Sync Steps, Shared LOVs and Search Configs. These are:
--
-- * Parameters of the "DATA_PROFILE" type
-- * Operation Parameters for which the
--   operation is *not* mapped to a DB Operation
--==============================================================================
procedure check_and_remove_comp_param(
    p_application_id       in number,
    p_web_src_param_id     in number );

--==============================================================================
-- generate SQL query to identify parameters to add to a component
--==============================================================================
function get_params_for_component_query(
    p_comp_id_column in varchar2,
    p_for_operation  in boolean default false)
    return varchar2;

--==============================================================================
-- synchronizes module level attributes in all components based on the
-- given web source module id.
--==============================================================================
procedure sync_module_attributes(
    p_application_id       in number,
    p_web_src_module_id    in number );

--==============================================================================
-- synchronizes module level attributes in all processes based on the
-- given web source operation id.
--==============================================================================
procedure sync_operation_attributes(
    p_application_id       in number,
    p_web_src_operation_id in number );

--==============================================================================
-- rediscover an existing web source module and generate a new data profile
--==============================================================================
procedure rediscover(
    p_web_src_module_id     in number,
    p_info_collection       in varchar2 default 'WEB_SOURCE_INFO',
    p_data_collection       in varchar2 default 'WEB_SOURCE_DATA',
    --
    p_sample_response       in blob     default null );

--==============================================================================
-- entry point for builder pages 1943, 1944 and others to either discover
-- web source information (store in collection) or to manually store a web
-- source module.
--==============================================================================
procedure f4000_store_or_discover(
    p_application_id      in number,
    --
    p_action              in varchar2 default 'DISCOVER',
    --
    p_web_src_type        in varchar2,
    p_server_id           in number   default null,
    p_server_url          in varchar2,
    p_service_path        in varchar2,
    p_http_method         in varchar2 default 'GET',
    p_request_body        in varchar2 default null,
    --
    p_https_host          in varchar2 default null,
    --
    p_auth_required       in boolean,
    p_cred_store          in number   default null,
    p_token_url           in varchar2 default null,
    p_openapi_url         in varchar2 default null,
	p_openapi_document    in blob     default null,
    --
    p_auth_type           in varchar2 default null,
    p_client_id           in varchar2 default null,
    p_client_secret       in varchar2 default null,
    p_username            in varchar2 default null,
    p_password            in varchar2 default null,
    p_namespace           in varchar2 default null,
    p_fingerprint         in varchar2 default null,
    --
    p_url_param_name1     in varchar2 default null,
    p_url_param_type1     in varchar2 default null,
    p_url_param_value1    in varchar2 default null,
    p_url_param_stat1     in varchar2 default 'N',
    --
    p_url_param_name2     in varchar2 default null,
    p_url_param_type2     in varchar2 default null,
    p_url_param_value2    in varchar2 default null,
    p_url_param_stat2     in varchar2 default 'N',
    --
    p_url_param_name3     in varchar2 default null,
    p_url_param_type3     in varchar2 default null,
    p_url_param_value3    in varchar2 default null,
    p_url_param_stat3     in varchar2 default 'N',
    --
    p_url_param_name4     in varchar2 default null,
    p_url_param_type4     in varchar2 default null,
    p_url_param_value4    in varchar2 default null,
    p_url_param_stat4     in varchar2 default 'N',
    --
    p_url_param_name5     in varchar2 default null,
    p_url_param_type5     in varchar2 default null,
    p_url_param_value5    in varchar2 default null,
    p_url_param_stat5     in varchar2 default 'N',
    --
    p_module_name         in varchar2 default null,
    --
    p_row_selector        in varchar2 default null,
    p_is_single_row       in boolean  default null,
    --
    p_info_collection     in varchar2 default 'WEB_SOURCE_INFO',
    p_data_collection     in varchar2 default 'WEB_SOURCE_DATA',
    --
    p_sample_response     in blob     default null,
    --
    p_attribute_01        in varchar2 default null,
    p_attribute_02        in varchar2 default null,
    p_attribute_03        in varchar2 default null,
    p_attribute_04        in varchar2 default null,
    p_attribute_05        in varchar2 default null,
    p_attribute_06        in varchar2 default null,
    p_attribute_07        in varchar2 default null,
    p_attribute_08        in varchar2 default null,
    p_attribute_09        in varchar2 default null,
    p_attribute_10        in varchar2 default null,
    p_attribute_11        in varchar2 default null,
    p_attribute_12        in varchar2 default null,
    p_attribute_13        in varchar2 default null,
    p_attribute_14        in varchar2 default null,
    p_attribute_15        in varchar2 default null );


--==============================================================================
-- entry point for builder pages 1943, 1944 and others to find an existing remote
-- server based on the given endpoint URL. Then -- split the URL into the server-
-- and a service-specific part.
-- If no remote server is found, do a proposal for splitting the URL.
--==============================================================================
procedure f4000_find_remote_server(
    p_application_id    in  number,
    p_endpoint_url      in  varchar2,
    p_remote_server_id  out varchar2,
    p_remote_server_url out varchar2,
    p_server_url        out varchar2,
    p_service_path      out varchar2 );

--==============================================================================
-- entry point for builder pages 1943, 1944 and others to find an existing remote
-- server based on the given endpoint URL. Then -- split the URL into the server-
-- and a service-specific part.
-- If no remote server is found, do a proposal for splitting the URL.
--==============================================================================
procedure f4000_test_endpoint_url(
    p_application_id   in     number,
    p_endpoint_url     in out varchar2,
    p_http_method      in     varchar2 default 'GET',
    p_https_host       in     varchar2,
    p_web_source_type  in     varchar2,
    p_url_param1_name  in     varchar2,
    p_url_param1_value in     varchar2,
    p_url_param2_name  in     varchar2,
    p_url_param2_value in     varchar2,
    --
    p_param1_name      out    varchar2,
    p_param1_type      out    varchar2,
    p_param1_value     out    varchar2,
    p_param2_name      out    varchar2,
    p_param2_type      out    varchar2,
    p_param2_value     out    varchar2,
    --
    p_auth_required    out    varchar2,
    p_success          out    varchar2,
    p_message          out    varchar2 );

--==============================================================================
-- generate a request body template to use for HTTP POST or PUT requests. The
-- template will be generated based on the data profile assigned to the given
-- Web Source Module.
--==============================================================================
function f4000_build_body_template(
    p_web_src_module_id     in number )
    return clob;

--==============================================================================
-- adds web source parameters for a *region* based on the defaults in the web source
-- module or operation definition. This overload does not accept a collection with
-- new parameter defaults.
-- To be called from create wizards. Does not (yet) support populating parameters
-- for processes (app, page), automation or task definition actions.
--==============================================================================
procedure add_web_source_params(
    p_flow_id              in number,
    p_web_source_module_id in number,
    p_database_operation   in wwv_flow_plugin_api.t_db_operation,
    p_array_column_id      in number default null,
    --
    p_page_id              in number default null,
    p_region_id            in number default null,
    p_jet_chart_series_id  in number default null,
    p_map_region_layer_id  in number default null,
    p_web_src_sync_step_id in number default null,
    p_shared_lov_id        in number default null,
    p_automation_id        in number default null,
    p_search_config_id     in number default null );

--==============================================================================
-- validates the value configuration for a REST Source parameter
--==============================================================================
function validate_web_src_param_value(
    p_application_id in number,
    --
    p_data_type      in varchar2,
    p_value_type     in varchar2,
    p_value_lang     in varchar2,
    p_expression     in varchar2 )
    return varchar2;

--==============================================================================
-- validates whether the set of operations for a REST Source is valid
--==============================================================================
function validate_web_src_operations(
    p_security_group_id      in number,
    p_flow_id                in number,
    p_web_src_module_id      in number,
    p_dml_operation          in wwv_flow_exec_api.t_dml_operation,
    --
    p_operation_id           in number,
    p_static_id              in varchar2,
    p_url_pattern            in varchar2,
    p_operation              in varchar2,
    p_database_operation     in varchar2,
    p_array_column_id        in number )
    return varchar2;

--==============================================================================
-- turns the wwv_flow_plugin_api.t_db_operation constant to a VARCHAR2
-- representation.
--==============================================================================
function get_db_operation_vc(
    p_db_operation in wwv_flow_plugin_api.t_db_operation )
    return varchar2;

--==============================================================================
-- turns the wwv_flow_plugin_api.t_web_source_param_type constant to a VARCHAR2
-- representation
--==============================================================================
function get_param_type_vc(
    p_param_type in wwv_flow_plugin_api.t_web_source_param_type )
    return varchar2;

--==============================================================================
-- get the response body from the INFO collection. If the response type
-- is JSON, pretty-print it.
--==============================================================================
function get_formatted_response(
    p_response_type in varchar2 )
    return clob;

--==============================================================================
-- returns name of the web source module
--==============================================================================
function get_web_src_module_name(
    p_web_src_module_id        in number,
    p_application_id           in number )
    return varchar2;
end wwv_flow_web_src_dev;
/
show err

set define '^'
