set define '^' verify off
prompt ...wwv_flow_web_services
create or replace package wwv_flow_web_services as
------------------------------------------------------------------------------------------------------------------------
--  Copyright (c) 2002, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_web_services.sql
--
--    MODIFIED    (MM/DD/YYYY)
--      jkallman   07/23/2002 - Created
--
------------------------------------------------------------------------------------------------------------------------

--==============================================================================
-- Globals for SOAP
--==============================================================================
g_body                        varchar2(32000);
g_header                      varchar2(32000);

--==============================================================================
-- Globals for proxy
--==============================================================================
type t_proxy              is record (
    current_proxy                varchar2(32767),
    current_noproxydomains       varchar2(32767),
    --
    proxy_was_changed            boolean             := false,
    --
    -- memorize proxy settings in UTL_HTTP
    --
    utlhttp_restore_proxy           varchar2(32767),
    utlhttp_restore_noproxydomains  varchar2(32767),
    --
    -- memorize proxy globals in WWV_FLOW
    --
    wwvflow_restore_proxy           varchar2(32767),
    wwvflow_restore_noproxydomains  varchar2(32767) );

g_proxy t_proxy;

--==============================================================================
-- Authentication scheme attributes, as used by UTL_HTTP.SET_AUTHENTICATION.
--==============================================================================
type t_auth_scheme is record (
    scheme                    varchar2(4000), -- Basic, Digest, AWS, AWS4-HMAC-SHA256, BMC
    credential_id             number,
    username                  varchar2(32767),
    password                  varchar2(32767),
    oauth2_scope              varchar2(32767),
    namespace                 varchar2(32767),
    fingerprint               varchar2(32767),
    token_url                 varchar2(4000),
    --
    db_credential_name        varchar2(128),
    db_credential_is_instance boolean default false );


--##############################################################################
--
-- U T I L I T Y   F U N C T I O N S
--
--##############################################################################

--==============================================================================
-- Return an empty auth scheme record.
--==============================================================================
function null_auth_scheme
    return t_auth_scheme;

--==============================================================================
-- This function returns the given HTTP request body in a form that is suitable
-- for logging with wwv_flow_debug.
--==============================================================================
function log_value_for_body (
    p_body in clob )
    return varchar2;

--==============================================================================
-- This procedure is to be called from WWV_FLOW_WEB_SERVICES_INVOKER to store
-- the UTL_HTTP.REQ object which was obtained using a dynamic block.
--
-- As WWV_FLOW_WEB_SERVICES_INVOKER is a public package, we want to avoid
-- anybody storing arbitrary UTL_HTTP.REQ objects herein, so this call is protected
-- by a "key", which is generated as a random value by the MAKE_REST_REQUEST and
-- MAKE_REST_REQUEST_B procedures before processing is handed over to
-- WWV_FLOW_WEB_SERVICES_INVOKER. If the key does not match, an error is raised.
--==============================================================================
procedure set_utl_http_req(
    p_key            in number,
    p_utl_http_req   in sys.utl_http.req );

--==============================================================================
-- Get the stored a UTL_HTTP.REQ object.
--==============================================================================
function get_utl_http_req(
    p_key            in number )
    return sys.utl_http.req;

--==============================================================================
-- get the parsing schema to use by WWV_FLOW_WEB_SERVICES_INVOKER when dynamic
-- SQL is needed.
--==============================================================================
function get_current_req_parsing_schema return varchar2;

--==============================================================================
-- To be called by WWV_FLOW_WEB_SERVICES_INVOKER package to determine whether
-- the current HTTP request should be logged or not.
--==============================================================================
function get_current_req_logging return boolean;

--==============================================================================
-- Return the count of HTTP requests done in the current database session
--==============================================================================
function get_current_request_count return number;

--==============================================================================
-- Checks whether the workspace request limit has been exceeded.
--==============================================================================
function request_limit_exceeded return boolean;

--==============================================================================
-- increase g_count_ws_requests by one.
--==============================================================================
procedure count_ws_request;

--==============================================================================
-- sets the proxy server to the proxy configured in the application currently
-- being edited within the builder. This is important to reach out to REST services
-- from within the builder, as we must not use the proxy server specified in app
-- 4000, but the one specified in the app which is being worked on.
--==============================================================================
procedure set_proxy (
    p_url            in varchar2 default null,
    p_proxy_override in varchar2 default null );

--==============================================================================
-- sets the proxy server to the proxy configured in the application currently
-- being edited within the builder. This is important to reach out to REST services
-- from within the builder, as we must not use the proxy server specified in app
-- 4000, but the one specified in the app which is being worked on. Signature 2.
--==============================================================================
procedure set_proxy_for_app (
    p_app_id         in number        default wwv_flow.g_flow_id,
    p_workspace_id   in number        default wwv_flow_security.g_security_group_id );

--==============================================================================
-- restores the proxy server back to the default
--==============================================================================
procedure restore_proxy;

--==============================================================================
-- restores the app proxy server back to the default
--==============================================================================
procedure restore_proxy_for_app;

--##############################################################################
--
-- A U T H E N T I C A T I O N   F U N C T I O N S
--
--##############################################################################

--==============================================================================
-- Convert (scheme,username,password) to a t_auth_scheme record
--==============================================================================
function to_auth_scheme (
    p_scheme                    in varchar2,
    p_username                  in varchar2,
    p_password                  in varchar2,
    p_oauth2_scope              in varchar2 default null,
    p_token_url                 in varchar2 default null,
    p_db_credential_name        in varchar2 default null,
    p_db_credential_is_instance in boolean  default null )
    return t_auth_scheme;

--==============================================================================
-- Convert a t_credential to a t_auth_scheme record.
--==============================================================================
function to_auth_scheme (
    p_credential in wwv_flow_credential_api.t_credential,
    p_token_url  in varchar2 default null )
    return t_auth_scheme;

--==============================================================================
-- Convert a credential id to a t_auth_scheme record.
--==============================================================================
function to_auth_scheme (
    p_credential_id in number,
    p_token_url     in varchar2 default null,
    p_for_url       in varchar2 default null )
    return t_auth_scheme;

--##############################################################################
--
-- R E Q U E S T   F U N C T I O N S
--
--##############################################################################

--======================================================================================================================
-- This function invokes a RESTful Web service with the supplied name value pairs, body clob, or body blob
-- the response as an clob. Use a credential store for authentication.
--
-- Parameters:
-- * p_url:                 The url endpoint of the Web service.
-- * p_http_method:         The HTTP Method to use, PUT, POST, GET, HEAD or DELETE.
-- * p_auth_scheme:         The authentication scheme information.
-- * p_proxy_override:      The proxy to use for the request.
-- * p_transfer_timeout:    The amount of time in seconds to wait for a response.
-- * p_body:                The HTTP payload to be sent as clob.
-- * p_body_blob:           The HTTP payload to be sent as binary blob (ex., posting a file).
-- * p_parm_name:           The name of the parameters to be used in name/value pairs.
-- * p_parm_value:          The value of the paramters to be used in name/value pairs.
-- * p_wallet_path:         The filesystem path to a wallet if request is https, e.g. file:/usr/home/oracle/WALLETS.
-- * p_wallet_pwd:          The password to access the wallet.
-- * p_https_host:          The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
-- * p_log_request:         Whether to log the request or not.
-- * p_parse_as_schema:     The parsing schema to use, if the HTTP request is done using dynamic SQL (WWV_FLOW_WEB_SERVICES_INVOKER).
--
-- Returns:
-- The REST service response as a CLOB
--
-- Example:
-- Invoke a REST service returning a CLOB. Use the credential store  ID 4711 and a token
-- URL to get the OAuth access token from.
--
--   begin
--       wwv_flow_web_services.make_rest_request(
--           p_url            => 'http://{host}:{port}/ords/scott/emp/',
--           p_http_method    => 'GET',
--           p_auth_scheme    => wwv_flow_web_services.to_auth_scheme (
--                                   p_credential_id => 4711,
--                                   p_oauth2_token  => 'http://{host}:{port}/ords/scott/oauth/token' ));
--   end;
--======================================================================================================================
function make_rest_request(
    p_url               in varchar2,
    p_http_method       in varchar2,
    --
    p_auth_scheme       in t_auth_scheme           default null_auth_scheme,
    --
    p_proxy_override    in varchar2                default null,
    p_transfer_timeout  in number                  default 180,
    p_body              in clob                    default empty_clob(),
    p_body_blob         in blob                    default empty_blob(),
    p_parm_name         in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value        in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_http_headers      in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_http_hdr_values   in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_wallet_path       in varchar2,
    p_wallet_pwd        in varchar2,
    p_https_host        in varchar2                default null,
    p_log_request       in boolean                 default true,
    --
    p_parse_as_schema   in varchar2                default wwv_flow_security.g_parse_as_schema )
    return clob;

--======================================================================================================================
function make_rest_request_b (
    p_url              in varchar2,
    p_http_method      in varchar2,
    p_auth_scheme      in t_auth_scheme           default null_auth_scheme,
    p_proxy_override   in varchar2                default null,
    p_transfer_timeout in number                  default 180,
    p_body             in clob                    default empty_clob(),
    p_body_blob        in blob                    default empty_blob(),
    p_parm_name        in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value       in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_http_headers     in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_http_hdr_values  in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_wallet_path      in varchar2,
    p_wallet_pwd       in varchar2,
    p_https_host       in varchar2                default null,
    --
    p_parse_as_schema  in varchar2                default wwv_flow_security.g_parse_as_schema )
    return blob;

--======================================================================================================================
-- This procedure invokes a Web service with the supplied SOAP envelope and returns
-- the response as an sys.xmltype.
--
-- Parameters:
-- * p_url:                 The url endpoint of the Web service.
-- * p_action:              The SOAP Action corresponding to the operation invoked.
-- * p_version:             The SOAP version, 1.1 or 1.2.
-- * p_envelope:            The SOAP envelope to post to the service.
--
-- * p_application_id:      The ID of the application which contains the credential store to be used.
-- * p_credential_name:     The name of the credential store to be used.
--
-- * p_proxy_override:      The proxy to use for the request.
-- * p_transfer_timeout:    The amount of time in seconds to wait for a response.
-- * p_wallet_path:         The filesystem path to a wallet if request is https.
--                          ex., file:/usr/home/oracle/WALLETS
-- * p_wallet_pwd:          The password to access the wallet.
-- * p_https_host:          The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
-- * p_http_headers:        Array of HTTP Header Names to be set for the SOAP request.
-- * p_http_hdr_values:     Array of HTTP Header Values to be set for the SOAP request.
--
-- Example:
-- Invoke a SOAP service returning an XMLTYPE.
--
--   declare
--       l_xml sys.xmltype;
--   begin
--       l_xml := apex_web_service.make_request(
--           p_url            => 'http://{host}:{port}/path/to/soap/service/',
--           p_action         => 'doSoapRequest',
--           p_envelope       => '{SOAP envelope in XML format}',
--           p_auth_scheme    => wwv_flow_web_services.to_auth_scheme (
--                                   p_credential_id => 4711,
--                                   p_oauth2_token  => 'http://{host}:{port}/ords/scott/oauth/token' ));
--   end;
--======================================================================================================================
function make_soap_request (
    p_url               in varchar2,
    p_action            in varchar2                default null,
    p_version           in varchar2                default '1.1',
    p_envelope          in clob,
    --
    p_auth_scheme       in t_auth_scheme           default null_auth_scheme,
    --
    p_proxy_override    in varchar2                default null,
    p_transfer_timeout  in number                  default 180,
    p_wallet_path       in varchar2                default null,
    p_wallet_pwd        in varchar2                default null,
    p_https_host        in varchar2                default null,
    p_http_headers      in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_http_hdr_values   in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 )
    return clob;

--##############################################################################
--
-- P U S H   N O T I F I C A T I O N
--
--##############################################################################

--======================================================================================================================
-- This function invokes a request to a push notification service such as Google, Mozilla, Apple, etc.
-- based on the subscription information and the payload. Then the push notification service will
-- send the notification to the client device.
--
-- Parameters:
-- * p_subscription_interface:  The user subscription object
-- * p_pwa_push_credential_id:  The credential ID used for the push notification service
-- * p_pwa_vapid_contact_info:  The contact information (email) to send to the push notification service
-- * p_payload:                 The payload of the notification
--======================================================================================================================
procedure make_push_notification_request(
    p_subscription_interface in varchar2,
    p_pwa_push_credential_id in number,
    p_pwa_vapid_contact_info in varchar2,
    p_payload                in clob );

--##############################################################################
--
-- L E G A C Y   W E B   S E R V I C E   (S O A P )   F U N C T I O N S
--
--##############################################################################

--==============================================================================
function generate_envelope(
    p_operation in varchar2,
    p_style     in varchar2,
    p_ns        in varchar2,
    p_version   in varchar2 default '1.1',
    p_body      in clob,
    p_header    in clob )
    return clob;

--==============================================================================
function make_request(
    p_url            in varchar2,
    p_action         in varchar2,
    p_version        in varchar2 default '1.1',
    p_envelope       in clob,
    p_username       in varchar2,
    p_password       in varchar2,
    p_scheme         in varchar2 default 'Basic',
    p_proxy_override in varchar2 default null,
    p_charset        in varchar2 default null,
    p_wallet_path    in varchar2,
    p_wallet_pwd     in varchar2,
    p_https_host     in varchar2 default null )
    return clob;

--==============================================================================
procedure make_request(
    p_id             in number,
    p_process_id     in number,
    p_charset        in varchar2 default null );

--==============================================================================
procedure make_request(
    p_id             in number,
    p_operation_id   in number,
    p_process_id     in number,
    p_charset        in varchar2 default null );

--==============================================================================
function render_request(
    p_service_id     in number,
    p_stylesheet     in clob   default null,
    p_occurrence     in number default 1,
    p_stylesheet_id  in number default null)
return clob;

--==============================================================================
procedure print_rendered_result(
    p_service_id     in number,
    p_stylesheet     in clob   default null,
    p_occurrence     in number default 1,
    p_stylesheet_id  in number default null );

--==============================================================================
function parse( p_clob in clob )
return clob ;

--==============================================================================
function get_last_error_message
return varchar2;

--==============================================================================
function find_proxy(
    p_flow_id   in varchar2)
return varchar2;

--==============================================================================
function get_parm_value(
    p_parm_id       in number,
    p_process_id    in number )
return varchar2;

--==============================================================================
function get_parm_value(
    p_name          in varchar2,
    p_parm_name     in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value    in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 )
return varchar2;

--==============================================================================
procedure append_element(
    p_process_id        in number default null,
    p_parm_id           in number,
    p_name              in varchar2,
    p_is_xsd            in varchar2,
    p_form_qualified    in varchar2,
    p_type              in varchar2,
    p_operation_id      in number,
    p_in_msg_style      in varchar2,
    p_soap_style        in varchar2,
    p_parm_name         in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value        in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 );

--==============================================================================
procedure append_element2(
    p_process_id        in number default null,
    p_parm_id           in number,
    p_name              in varchar2,
    p_is_xsd            in varchar2,
    p_form_qualified    in varchar2,
    p_type              in varchar2,
    p_operation_id      in number,
    p_in_msg_style      in varchar2,
    p_ns                in varchar2,
    p_soap_style        in varchar2,
    p_parm_name         in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value        in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 );

--==============================================================================
procedure generate_body(
    p_process_id    in number default null,
    p_operation_id  in number,
    p_in_msg_style  in varchar2,
    p_soap_style    in varchar2,
    p_parm_name     in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value    in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 );

--==============================================================================
procedure generate_header(
    p_process_id    in number default null,
    p_operation_id  in number,
    p_in_msg_style  in varchar2,
    p_ns            in varchar2,
    p_soap_style    in varchar2,
    p_parm_name     in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value    in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 );

--==============================================================================
function get_path(
    p_parm_id       in number,
    p_level         in number default 0 )
return varchar2;

--==============================================================================
function generate_query(
    p_operation_id              in number,
    p_array_parm                in number,
    p_report_collection_name    in varchar2,
    p_array_parms_collection    in varchar2 )
return varchar2;

--==============================================================================
function generate_query_manual(
    p_result_node               in varchar2,
    p_soap_style                in varchar2,
    p_message_format            in varchar2,
    p_namespace                 in varchar2,
    p_report_collection_name    in varchar2,
    p_array_parms_collection    in varchar2 )
return varchar2;

--==============================================================================
function UDDI_request(
    p_uddi_url              in varchar2,
    p_request_type          in varchar2,
    p_request_parameter     in varchar2,
    p_proxy_url             in varchar2,
    p_request_parameter2    in varchar2 default null,
    p_uddi_version          in varchar2 default '2.0' )
return sys.xmltype;

--==============================================================================
procedure find_services_by_servname(
    p_uddi_url              in varchar2,
    p_request_parameter2    in varchar2,
    p_flow_id               in varchar2,
    p_services_collection   in varchar2,
    p_exact                 in varchar2 default 'N',
    p_case_sensitive        in varchar2 default 'N',
    p_uddi_version          in varchar2 default '2.0' );

--==============================================================================
procedure find_services_by_busname(
    p_uddi_url              in varchar2,
    p_request_parameter     in varchar2,
    p_flow_id               in varchar2,
    p_services_collection   in varchar2,
    p_exact                 in varchar2 default 'N',
    p_case_sensitive        in varchar2 default 'N',
    p_uddi_version          in varchar2 default '2.0' );

--==============================================================================
procedure get_service_details(
    p_uddi_url              in varchar2,
    p_request_parameter     in varchar2,
    p_flow_id               in varchar2,
    p_services_collection   in varchar2,
    p_details_collection    in varchar2,
    p_uddi_version          in varchar2 default '2.0' );

--==============================================================================
function WSDL_analyze(
    p_wsdl_url                      in varchar2,
    p_flow_id                       in varchar2,
    p_uddi_details_collection       in varchar2,
    p_web_service_collection        in varchar2,
    p_operations_collection         in varchar2,
    p_inputs_collection             in varchar2,
    p_outputs_collection            in varchar2,
    p_username                      in varchar2,
    p_password                      in varchar2 )
return varchar2;

--==============================================================================
procedure create_web_service(
    p_id                            in number,
    p_flow_id                       in varchar2,
    p_name                          in varchar2,
    p_url                           in varchar2,
    p_target_ns                     in varchar2,
    p_xsd_prefix                    in varchar2,
    p_soap_style                    in varchar2,
    p_soap_version                  in varchar2 default '1.1',
    p_operations_collection         in varchar2,
    p_inputs_collection             in varchar2,
    p_outputs_collection            in varchar2,
    p_basic_auth                    in varchar2 );

--==============================================================================
procedure create_rest_web_reference(
    p_id                            in number,
    p_flow_id                       in varchar2,
    p_name                          in varchar2,
    p_url                           in varchar2,
    p_proxy_override                in varchar2,
    p_http_method                   in varchar2,
    p_input_format                  in varchar2,
    p_body                          in varchar2,
    p_output_format                 in varchar2,
    p_xpath                         in varchar2,
    p_xmlns                         in varchar2,
    p_text_parm_delim               in varchar2,
    p_text_record_delim             in varchar2,
    p_inputs_collection             in varchar2,
    p_outputs_collection            in varchar2,
    p_headers_collection            in varchar2,
    p_basic_auth                    in varchar2 );

--==============================================================================
procedure update_rest_web_reference(
    p_id                            in number,
    p_flow_id                       in varchar2,
    p_name                          in varchar2,
    p_url                           in varchar2,
    p_proxy_override                in varchar2,
    p_http_method                   in varchar2,
    p_input_format                  in varchar2,
    p_body                          in varchar2,
    p_output_format                 in varchar2,
    p_xpath                         in varchar2,
    p_xmlns                         in varchar2,
    p_text_parm_delim               in varchar2,
    p_text_record_delim             in varchar2,
    p_inputs_collection             in varchar2,
    p_outputs_collection            in varchar2,
    p_headers_collection            in varchar2,
    p_basic_auth                    in varchar2 );

--==============================================================================
procedure update_process_parms(
    p_process_id                    in number,
    p_in_parm_ids                   in wwv_flow_global.vc_arr2,
    p_in_parm_map_types             in wwv_flow_global.vc_arr2,
    p_in_parm_values                in wwv_flow_global.vc_arr2,
    p_out_map_type                  in varchar2,
    p_out_parm_ids                  in wwv_flow_global.vc_arr2,
    p_out_parm_values               in wwv_flow_global.vc_arr2,
    p_auth_parm_ids                 in wwv_flow_global.vc_arr2,
    p_auth_parm_map_types           in wwv_flow_global.vc_arr2,
    p_auth_parm_values              in wwv_flow_global.vc_arr2 );

--==============================================================================
procedure create_process_parms(
    p_process_id                    in number,
    p_in_parm_collection_name       in varchar2,
    p_out_map_type                  in varchar2,
    p_out_parm_collection_name      in varchar2 );

--==============================================================================
procedure create_auth_parms(
    p_process_id                    in number,
    p_auth_collection_name         in varchar2 );

end wwv_flow_web_services;
/
show errors
