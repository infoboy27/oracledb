set define '^' verify off
prompt ...wwv_flow_exec_web_src_utils.sql
create or replace package wwv_flow_exec_web_src_utils as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2018, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_exec_web_src_utils.sql
--
--    DESCRIPTION
--      Utility functions for Web Source Modules implementation
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    11/29/2018 - created
--
--------------------------------------------------------------------------------


--==============================================================================
-- types
--==============================================================================
type t_post_processing_info is record(
    post_proc_type     wwv_flow_exec_api.t_post_processing,
    post_proc_language wwv_flow_code_exec.t_language,
    post_proc_sql      varchar2(32767),
    post_proc_where    varchar2(32767),
    post_proc_order_by varchar2(32767) );

--==============================================================================
-- constants
--==============================================================================

--==============================================================================
-- globals
--==============================================================================
g_post_processing_info t_post_processing_info;

--==============================================================================
--
-- G E N E R I C   U T I L I T I E S
--
--==============================================================================

--===============================================================================
-- adds a number to a name to make it unique. Used to change the name of a REST
-- data source if one is already taken.
--
-- "Name"     is converted to "Name (2)"
-- "Name (2)" is converted to "Name (3)"
-- ... and so on.
--
-- Parameters:
-- * p_name                   Name to append a suffix to, or to increase the suffix for.
--===============================================================================
procedure add_or_increase_seq_suffix( p_name in out nocopy varchar2 );

--==============================================================================
-- converts an interval day to second to ISO-8601 Duration
--
-- PARAMETERS:
-- * p_value    INTERVAL DAY TO SECOND value to convert to ISO-8601
--
-- RETURNS:
-- * ISO-8601 representation of the value passed in
--==============================================================================
function dsinterval_to_iso(
    p_value in dsinterval_unconstrained )
    return varchar2;

--==============================================================================
-- converts an interval year to month to ISO-8601 Duration
--
-- PARAMETERS:
-- * p_value    INTERVAL YEAR TO MONTH value to convert to ISO-8601
--
-- RETURNS:
-- * ISO-8601 representation of the value passed in
--==============================================================================
function yminterval_to_iso(
    p_value in yminterval_unconstrained )
    return varchar2;

--==============================================================================
-- Extracts the parameter array for the Web Source operation
--==============================================================================
function get_web_source_parameters(
    p_context              in wwv_flow_exec.t_context,
    p_web_source_operation in wwv_flow_exec_web_src.t_web_source_operation )
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- sets the Web Source parameters in the context object, depending on the
-- web source operation type.
--==============================================================================
procedure set_web_source_parameters(
    p_context              in out nocopy wwv_flow_exec.t_context,
    p_web_source_operation in            wwv_flow_exec_web_src.t_web_source_operation,
    p_parameters           in            wwv_flow_exec_api.t_parameters );

--==============================================================================
-- copies the value of a Web Source Module parameter from the execution context
-- (which contains the concrete component value) to the parameter record, which
-- is passed to the Plug-In implementation.
--
-- Parameters:
-- * p_context                context object with execution meta data
-- * p_name                   parameter name
-- * p_to_plugin_param        plug-in parameter record to copy the value to
--==============================================================================
procedure copy_parameter_value(
    p_context_parameters in            wwv_flow_exec_api.t_parameters,
    p_name               in            varchar2,
    p_to_plugin_param    in out nocopy wwv_flow_plugin_api.t_web_source_parameter );

--==============================================================================
-- converts an array of the wwv_flow_data_profile.t_columns type to
-- wwv_flow_plugin_api.t_profile_columns
--
-- PARAMETERS:
-- * p_data_profile_columns   column array to be converted.
-- * p_include_derived        whether to return derived columns as well
--
-- RETURNS:
-- * column array as instance of wwv_flow_plugin_api.t_web_source_columns
--==============================================================================
function convert_to_plugin_api_columns(
    p_data_profile_columns in wwv_flow_data_profile.t_columns,
    p_include_derived      in boolean  )
    return wwv_flow_plugin_api.t_web_source_columns;

--==============================================================================
--
-- R E S T   I N V O C A T I O N   L I F E C Y C L E
--
--==============================================================================

--==============================================================================
-- prepares the endpoint URL for a REST service invocation, based on
-- web source and component meta data
--
-- PARAMETERS:
-- * p_context                context object with execution meta data
-- * p_web_source_operation   internal web source meta data
--
-- RETURNS:
-- * p_url_path               URL to use for REST Service invocation
-- * p_query_string           Query string to append to the URL
--==============================================================================
procedure prepare_endpoint_url(
    p_context              in  wwv_flow_exec.t_context,
    p_web_source_operation in  wwv_flow_exec_web_src.t_web_source_operation,
    p_url_path             out varchar2,
    p_query_string         out varchar2 );

--==============================================================================
-- set HTTP request headers (wwv_flow_webservices_api.g_request_headers)
-- in order to execute the REST service.
--
-- PARAMETERS:
-- * p_web_source_operation     Plug-In meta data for the Web Source operation
-- * p_extend_existing          whether to append to already existing request headers
--                              (true) or whether to clear these first (false)
--==============================================================================
procedure set_http_headers(
    p_web_source_operation in wwv_flow_plugin_api.t_web_source_operation,
    p_extend_existing      in boolean default false );

--==============================================================================
-- set HTTP request cookies (wwv_flow_webservices_api.g_request_cookies)
-- in order to execute the REST service.
--
-- PARAMETERS:
-- * p_web_source_operation     Plug-In meta data for the Web Source operation
--==============================================================================
procedure set_http_cookies(
    p_web_source_operation in wwv_flow_plugin_api.t_web_source_operation );

--==============================================================================
-- builds a request body for a Web Source DML request. If a request body template
-- is set, then #COLUMN# placeholders will be replaced by the DML context
-- column values. In this case, the request body can be any data format.
-- If no request body template is set, the function builds a JSON with the following structure:
-- {
--    "{column1-name}": "{column1-value}",
--    "{column2-name}": "{column2-value}",
--    :
-- }
--
-- PARAMETERS
-- * p_request_format           request format (JSON or XML)
-- * p_profile_columns          column meta data (names, data types)
-- * p_values_context           wwv_flow_exec_api context object containing DML values
-- * p_build_when_empty         whether to build a new request body, if p_request_body is empty
-- * p_exclude_columns          optional list of column names to exclude from body
-- * p_exclude_if_null_columns  optional list of column names to exclude from body if null
-- * p_empty_varchar2_as_null   when true returns null for an empty varchar2 property
--
-- * p_request_body          request body template to perform replacements on
--
-- RETURNS
-- * p_request_body          request body (substitutions replaced or built from scratch)
--==============================================================================
procedure build_request_body(
    p_request_format          in            wwv_flow_plugin_api.t_data_format,
    p_profile_columns         in            wwv_flow_plugin_api.t_web_source_columns,
    p_values_context          in            wwv_flow_exec_api.t_context,
    p_build_when_empty        in            boolean,
    --
    p_request_body            in out nocopy clob,
    --
    p_exclude_columns         in            wwv_flow_t_varchar2 default null,
    p_exclude_if_null_columns in            wwv_flow_t_varchar2 default null,
    p_empty_varchar2_as_null  in            boolean             default false);

--==============================================================================
-- performs the actual REST request (HTTP). Will use wwv_flow_web_services.
-- All parameters wwv_flow_web_services.make_rest_request will be derived
-- from the web source meta data passed in as "p_web_source_operation"
--
-- PARAMETERS
-- * p_web_source_operation     Plug-In meta data for the Web Source operation
-- * p_bypass_cache             if "true", then the cache will not be used
--
-- * p_request_body             override request body to use
--
-- * p_time_budget              if "all rows" are to be fetched (multiple HTTP requests),
--                              then the process will stopped when the time budget is
--                              exhausted. An error will be raised.
--
-- RETURNS
-- * p_time_budget              time budget left after request has been made
-- * p_response                 received response of the HTTP invocation
-- * p_response_parameters      received response headers and cookies, based on web source
--                              meta data
--==============================================================================
procedure make_rest_request(
    p_web_source_operation in            wwv_flow_plugin_api.t_web_source_operation,
    p_bypass_cache         in            boolean default false,
    --
    p_request_body         in            clob default null,
    --
    p_time_budget          in out nocopy number,
    --
    p_response             in out nocopy clob,
    p_response_parameters  in out nocopy wwv_flow_plugin_api.t_web_source_parameters );


--==============================================================================
-- parse the DML request response and load return values to the values context
-- object.
--
-- PARAMETERS:
-- * p_web_source_operation      web source operation (Plug-In) meta data
-- * p_web_source                web source module (Plug-In) meta data
-- * p_response                  REST response to parse
-- * p_status_code               HTTP status code to use
-- * p_error_message             error message to use
-- * p_values_context            values context to store the return values in
--==============================================================================
procedure process_dml_response(
    p_web_source_operation in wwv_flow_plugin_api.t_web_source_operation,
    p_web_source           in wwv_flow_plugin_api.t_web_source,
    --
    p_response             in clob,
    p_status_code          in pls_integer,
    p_error_message        in varchar2,
    --
    p_values_context       in wwv_flow_exec_api.t_context );

--==============================================================================
-- parse a response and load return values to the values contextobject.
--
-- PARAMETERS:
-- * p_response                  REST response to parse
-- * p_data_profile_id           ID of the data profile to use
-- * p_columns_of_interest       If passed in, use this list of columns, instead
--                               the columns in p_values_context
-- * p_values_context            values context to store the return values in
--==============================================================================
procedure process_single_row_response(
    p_response             in clob,
    p_data_profile_id      in number,
    p_columns_of_interest  in wwv_flow_exec_api.t_columns default wwv_flow_exec_api.c_empty_columns,
    --
    p_values_context       in wwv_flow_exec_api.t_context );

--==============================================================================
-- parse the response from a "DML row refetch". A "row refetch" is used for
-- lost update detection in order to verify that nobody else changed the row
--
-- PARAMETERS:
-- * p_web_source_operation      web source operation (Plug-In) meta data
-- * p_web_source                web source module (Plug-In) meta data
-- * p_response                  REST response to parse
-- * p_values_context            values context to store the refetched values in
--==============================================================================
function parse_refetch_response(
    p_web_source_operation in wwv_flow_plugin_api.t_web_source_operation,
    p_web_source           in wwv_flow_plugin_api.t_web_source,
    p_values_context       in wwv_flow_exec_api.t_context,
    --
    p_response             in clob )
    return wwv_flow_exec_api.t_context;

--==============================================================================
-- convert a wwv_flow_exec_api.t_filters array to the external filter syntax
-- for the given Web Source Module ID.
--
-- PARAMETERS
-- * p_web_src_module_id     ID of the Web Source Module
-- * p_filters               filters array
-- * p_order_bys             order bys array
--
-- RETURNS
-- * p_external_order_by     external order_by syntax
-- * p_external_filter       external filter syntax
--==============================================================================
procedure get_external_filters_orderbys(
    p_web_src_module_id     in number,
    p_filters               in wwv_flow_exec_api.t_filters,
    p_order_bys             in wwv_flow_exec_api.t_order_bys,
    --
    p_external_order_by    out varchar2,
    p_external_filter      out varchar2 );

--==============================================================================
-- convert a TIMESTAMP value to Zulu time zone and JSON date format
--
-- PARAMETERS
-- * p_timestamp     Timestamp value
-- * p_has_time_zone Value contains time zone
--==============================================================================
function convert_to_json_zulu(
    p_timestamp     in timestamp,
    p_has_time_zone in boolean default true )
    return varchar2;

--==============================================================================
-- convert a TIMESTAMP WITH TIME ZONE value to Zulu time zone and JSON date format
--
-- PARAMETERS
-- * p_timestamp_tz  Timestamp with time zone value
-- * p_has_time_zone Value contains time zone
--==============================================================================
function convert_to_json_zulu(
    p_timestamp_tz  in timestamp with time zone,
    p_has_time_zone in boolean default true )
    return             varchar2;

--==============================================================================
-- convert a TIMESTAMP WITH LOCAL TIME ZONE value to Zulu time zone and JSON date format
--
-- PARAMETERS
-- * p_timestamp_tz  Timestamp with local time zone value
-- * p_has_time_zone Value contains time zone
--==============================================================================
function convert_to_json_zulu(
    p_timestamp_ltz in timestamp with local time zone,
    p_has_time_zone in boolean default true )
    return             varchar2;

--==============================================================================
-- convert a DATE value to Zulu time zone and JSON date format
--
-- PARAMETERS
-- * p_date          Date value
-- * p_has_time_zone Value contains time zone
--==============================================================================
function convert_to_json_zulu(
    p_date          in date,
    p_has_time_zone in boolean default true )
    return             varchar2;    

--=============================================================================
-- Get all the sanitized Values for an External Filters String
--
-- PARAMETERS
-- * p_external_filters Web source plug-in external filter value
--=============================================================================
function get_sanitized_external_filter(
    p_external_filters in varchar2 )
    return varchar2;
end wwv_flow_exec_web_src_utils;
/
show err

set define '^'
