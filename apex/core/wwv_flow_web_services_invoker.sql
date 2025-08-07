set define '^' verify off
prompt ...wwv_flow_web_services_invoker.sql
create or replace package wwv_flow_web_services_invoker authid current_user
is
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_web_services_invoker.sql
--
--    MODIFIED    (MM/DD/YYYY)
--    cczarski     02/26/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- This package is to perform REST requests with privileges of the workspace
-- schema, and (unlike APEX_WEB_SERVICE) not with those of the APEX engine.
--
-- Main goal is to allow HTTP requests using a DBMS_CREDENTIAL, which resides
-- in, or which is granted to the workspace schema.
--
-- Note that only the MAKE_REST_REQUEST call must be made with workspace schema
-- privileges. The other calls are only about setting or fetching globals, and
-- can be done as normal APEX engine code.
--
-- Usage examples:
--
-- 1. Perform a request passing a CLOB body and getting a CLOB response.
--
-- begin
--     wwv_flow_webservices_api.set_request_headers(
--         p_name_01        => 'Content-Type',
--         p_value_01       => 'application/json',
--         p_name_02        => 'User-Agent',
--         p_value_02       => 'APEX' );
--
--     wwv_flow_web_services_invoker.set_request(
--         p_url               => ...
--         p_http_method       => ... 
--         --
--         p_auth_scheme       => ...
--         --
--         p_body_clob         => ...
--         p_body_blob         => ...
--         p_parm_name         => ...
--         :
--         p_key_utl_http      => {key to communicate UTL_HTTP.REQ objects} );
--
--     wwv_flow_web_services_invoker.make_prepared_rest_request;
--
--     sys.dbms_output.put_line( wwv_flow_web_services_invoker.get_response_clob );
-- end;
--==============================================================================

--==============================================================================
-- Procedure to set the UTL_HTTP.REQ object in dynamic SQL within the context
-- of the parsing schema. The key is being passed by WWV_FLOW_WEB_SERVICES.SET_REQUEST
-- package and must be reused here. The concrete key value is a random number,
-- computed within the WWV_FLOW_WEB_SERVICES package.
--==============================================================================
procedure set_utl_http_req(
    p_key            in number,
    p_utl_http_req   in sys.utl_http.req );

--==============================================================================
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
--==============================================================================
function make_rest_request(
    p_url                    in varchar2,
    p_http_method            in varchar2,
    --
    p_auth_scheme            in wwv_flow_web_services.t_auth_scheme   default wwv_flow_web_services.null_auth_scheme,

    p_body                   in clob                                  default empty_clob(),
    p_body_blob              in blob                                  default empty_blob(),
    p_parm_name              in wwv_flow_global.vc_arr2               default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value             in wwv_flow_global.vc_arr2               default wwv_flow_global.c_empty_vc_arr2,
    p_http_headers           in wwv_flow_global.vc_arr2               default wwv_flow_global.c_empty_vc_arr2,
    p_http_hdr_values        in wwv_flow_global.vc_arr2               default wwv_flow_global.c_empty_vc_arr2,
    --
    p_proxy_override         in varchar2,
    p_transfer_timeout       in number,
    p_wallet_path            in varchar2,
    p_wallet_pwd             in varchar2,
    --
    p_https_host             in varchar2 )
    return clob;

--==============================================================================
-- Same as MAKE_REST_REQUEST, but returning a BLOB.
--==============================================================================
function make_rest_request_b(
    p_url                    in varchar2,
    p_http_method            in varchar2,
    --
    p_auth_scheme            in wwv_flow_web_services.t_auth_scheme   default wwv_flow_web_services.null_auth_scheme,

    p_body                   in clob                                  default empty_clob(),
    p_body_blob              in blob                                  default empty_blob(),
    p_parm_name              in wwv_flow_global.vc_arr2               default wwv_flow_global.c_empty_vc_arr2,
    p_parm_value             in wwv_flow_global.vc_arr2               default wwv_flow_global.c_empty_vc_arr2,
    p_http_headers           in wwv_flow_global.vc_arr2               default wwv_flow_global.c_empty_vc_arr2,
    p_http_hdr_values        in wwv_flow_global.vc_arr2               default wwv_flow_global.c_empty_vc_arr2,
    --
    p_proxy_override         in varchar2,
    p_transfer_timeout       in number,
    p_wallet_path            in varchar2,
    p_wallet_pwd             in varchar2,
    --
    p_https_host             in varchar2 )
    return blob;

--==============================================================================
-- sets the request body for the next MAKE_REST_REQUEST or MAKE_REST_REQUEST_B
-- call. Setting a BLOB clears the CLOB value and vice-versa.
--
-- Parameters:
-- * p_url:                 The url endpoint of the Web service.
-- * p_http_method:         The HTTP Method to use, PUT, POST, GET, HEAD or DELETE.
-- * p_auth_scheme:         The authentication scheme information.
-- * p_proxy_override:      The proxy to use for the request.
-- * p_transfer_timeout:    The amount of time in seconds to wait for a response.
-- * p_body_clob:           The HTTP payload to be sent as clob.
-- * p_body_blob:           The HTTP payload to be sent as binary blob (ex., posting a file).
-- * p_parm_name:           The name of the parameters to be used in name/value pairs.
-- * p_parm_value:          The value of the paramters to be used in name/value pairs.
-- * p_wallet_path:         The filesystem path to a wallet if request is https, e.g. file:/usr/home/oracle/WALLETS.
-- * p_wallet_pwd:          The password to access the wallet.
-- * p_https_host:          The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
--
-- * p_key_utl_http:        "Key" value to use when storing a UTL_HTTP.REQ record obtained by running dynamic code.
--                          This key must be generated within the WWV_FLOW_WEB_SERVICES package and cannot be passed 
--                          from outside.
--==============================================================================
procedure set_request(
    p_url              in varchar2,
    p_http_method      in varchar2,
    --
    p_auth_scheme      in wwv_flow_web_services.t_auth_scheme,
    --
    p_body_clob        in clob,
    p_body_blob        in blob,
    p_parm_name        in wwv_flow_global.vc_arr2,
    p_parm_value       in wwv_flow_global.vc_arr2,
    p_http_headers     in wwv_flow_global.vc_arr2,
    p_http_hdr_values  in wwv_flow_global.vc_arr2,
    --
    p_proxy_override   in varchar2,
    p_transfer_timeout in pls_integer,
    p_wallet_path      in varchar2,
    p_wallet_pwd       in varchar2,
    p_https_host       in varchar2,
    --
    p_key_utl_http     in number );
 
--==============================================================================
-- makes a REST Request using the parameters provided with SET_REQUEST before.
--==============================================================================
procedure make_prepared_rest_request;
 
--==============================================================================
procedure make_prepared_rest_request_b;
 
--==============================================================================
-- fetches the response of the latest MAKE_REST_REQUEST call. Use GET_RESPONSE_CLOB
-- when MAKE_REST_REQUEST was used, and GET_RESPONSE_BLOB when MAKE_REST_REQUEST_B
-- was used.
--==============================================================================
function get_response_clob return clob;

--==============================================================================
function get_response_blob return blob;

--==============================================================================
-- This function performs OAUTH autentication using a credential store
-- The obtained access token and its expiry date are stored in the global variable g_oauth_token.
--
-- type oauth_token is record(
--     token      varchar2(255),
--     expires    date );
--
-- PARAMETERS
-- * p_auth_scheme          The authentication scheme information
-- * p_proxy_override       The proxy to use for the request
-- * p_transfer_timeout     The amount of time in seconds to wait for a response
-- * p_wallet_path          The filesystem path to a wallet if request is https, e.g. file:/usr/home/oracle/WALLETS
-- * p_wallet_pwd           The password to access the wallet
-- * p_https_host           The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request
--
-- EXAMPLE
--   perform OAuth client credentials authentication using passed client ID and client secret
--   and obtain access token.
--
--   begin
--       wwv_flow_web_services.oauth_authenticate (
--           p_auth_scheme => wwv_flow_web_services.to_auth_scheme (
--                                p_credential_id => 312786312489789423,
--                                p_token_url     => 'http://{host}:{port}/ords/scott/oauth/token' ));
--   end;
--==============================================================================
procedure oauth_authenticate (
    p_auth_scheme       in wwv_flow_web_services.t_auth_scheme,
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number   default 180,
    p_wallet_path       in varchar2,
    p_wallet_pwd        in varchar2,
    p_https_host        in varchar2 default null );
 
--==============================================================================
-- clears out all CLOB and BLOB globals and also frees temporary LOBs. Should
-- be called when done with the functionality of this package.
--==============================================================================
procedure free_resources;

--==============================================================================
-- SOAP functions being moved from WWV_FLOW_WEB_SERVICES package to here.
--==============================================================================
function make_soap_request (
    p_url               in varchar2,
    p_action            in varchar2                            default null,
    p_version           in varchar2                            default '1.1',
    p_envelope          in clob,
    --
    p_auth_scheme       in wwv_flow_web_services.t_auth_scheme default wwv_flow_web_services.null_auth_scheme,
    --
    p_proxy_override    in varchar2                            default null,
    p_transfer_timeout  in number                              default 180,
    p_wallet_path       in varchar2                            default null,
    p_wallet_pwd        in varchar2                            default null,
    p_https_host        in varchar2                            default null,
    p_http_headers      in wwv_flow_global.vc_arr2             default wwv_flow_global.c_empty_vc_arr2,
    p_http_hdr_values   in wwv_flow_global.vc_arr2             default wwv_flow_global.c_empty_vc_arr2 )
    return clob;

--==============================================================================
function WSDL_retrieve(
    p_wsdl_url          in varchar2,
    p_proxy_url         in varchar2,
    p_username          in varchar2,
    p_password          in varchar2,
    p_wallet            in wwv_flow_security.t_wallet )
    return clob;

end wwv_flow_web_services_invoker;
/
show errors
