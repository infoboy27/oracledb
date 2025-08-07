set define '^' verify off
prompt ...wwv_flow_webservices_api
create or replace package wwv_flow_webservices_api as
------------------------------------------------------------------------------------------------------------------------
--
--   Copyright (c) 2009, 2023, Oracle and/or its affiliates.
--
-- The `APEX_WEB_SERVICE API` enables you to integrate other systems with APEX by 
-- enabling you to interact with Web Services anywhere you can use PL/SQL in your 
-- application.
--
-- The API contains procedures and functions to call both SOAP and RESTful style 
-- Web Services. Functions parse the responses from Web Services and encode/decode 
-- into SOAP-friendly base64 encoding.
--
-- This API also contains package globals for managing cookies and HTTP headers 
-- when calling Web Services whether from the API or by using standard processes 
-- of type Web Service. Cookies and HTTP headers can be set before invoking a 
-- call to a Web Service by populating the globals, and the cookies and HTTP headers 
-- returned from the Web Service response can be read from other globals.
--
-- Modified:      
-- jstraub   02/06/2009 - Created
--
------------------------------------------------------------------------------------------------------------------------
-- Internal:
OAUTH_CLIENT_CRED constant varchar2(17) := 'OAUTH_CLIENT_CRED'; 
-- Internal:
AUTO_ECID         constant varchar2(9)  := 'AUTO_ECID'; 
--
--######################################################################################################################
-- Data Types: 
--
-- The section describes data types used by the APEX_WEB_SERVICE package.
--######################################################################################################################
type header is record (
    name       varchar2(256),
    value      varchar2(32767) );

type header_table is table of header index by binary_integer;

-- Internal:
type oauth_token is record(
    token      varchar2(32767),
    expires    date ); 

-- Internal:
type t_multipart_part is record (
    name            varchar2(4000),
    filename        varchar2(4000),
    content_type    varchar2(4000),
    content         clob,
    content_blob    blob );

-- Internal:
type t_multipart_parts is table of t_multipart_part index by binary_integer; 
--
--======================================================================================================================
-- Global Variables:
-- The following global variables are available in the APEX_WEB_SERVICE package.
--======================================================================================================================
-- Internal:
empty_vc_arr               wwv_flow_global.vc_arr2;

g_request_cookies          sys.utl_http.cookie_table;
g_response_cookies         sys.utl_http.cookie_table;

g_headers                  header_table;
g_request_headers          header_table;

g_status_code              pls_integer;
g_reason_phrase            varchar2(32767);

-- Internal:
g_oauth_token              oauth_token; 
--======================================================================================================================
-- This function converts a `BLOB` datatype into a `CLOB` that is `base64`-encoded. 
-- This is often used when sending a binary as an input to a Web service.
--
-- Parameters:
-- * p_blob:     The `BLOB` to convert into a `base64`-encoded `CLOB`.
-- * p_newlines: Whether the generated base64 content will contain line breaks.The default values is 'Y',
-- * p_padding:  Whether to pad the generated base64 with "=" so that the length becomes a multiple of 4. The default 
--               value is 'N'. 
--
-- Returns:
-- The `base64`-encoded representation of the input `BLOB`.
--
-- Example:
-- ~~~
-- declare
--     l_base64 clob;
--     l_blob   blob;
-- begin
--     l_blob   := my_function_returning_a_blob;
--     l_base64 := apex_web_service.blob2clobbase64( l_blob );
-- end;
-- ~~~
-- Example:
-- The following example gets a file that was uploaded from the `apex_application_files` view and converts the `BLOB` into 
-- a `CLOB` that is `base64`-encoded.
-- ~~~
-- declare
--    l_clob    CLOB;
--    l_blob    BLOB;
-- begin
--     SELECT BLOB_CONTENT
--       INTO l_BLOB
--       FROM APEX_APPLICATION_FILES
--       WHERE name = :P1_FILE;
-- 
--     l_CLOB := apex_web_service.blob2clobbase64(l_BLOB);
-- end;
-- ~~~
-- See also:
-- CLOBBASE642BLOB
--======================================================================================================================
function blob2clobbase64 (
    p_blob     in blob,
    p_newlines in varchar2 default 'Y',
    p_padding  in varchar2 default 'N' )
    return clob;

--======================================================================================================================
-- This function converts a `CLOB` datatype that is `base64`-encoded into a `BLOB`. 
-- This is often used when receiving output 
-- from a Web service that contains a binary parameter.
--
-- Parameters:
-- * p_clob: The `base64`-encoded `CLOB` to convert into a `BLOB`.
--
-- Returns:
-- The `BLOB` represented by the `base64`-encoded data.
--
-- Example:
-- The following example retrieves a `base64`-encoded node from an XML document 
-- as a `CLOB` and converts it into a `BLOB`.
-- ~~~
-- declare
--     l_base64 CLOB;
--     l_blob   BLOB;
--     l_xml    XMLTYPE;
-- begin
--     l_base64 := apex_web_service.parse_xml_clob(l_xml, ' //runReportReturn/reportBytes/text()');
--     l_blob   := apex_web_service.clobbase642blob(l_base64);
-- end;
-- ~~~
-- See also:
-- BLOB2CLOBBASE64
--======================================================================================================================
function clobbase642blob (
    p_clob in clob ) 
    return blob;

--======================================================================================================================
-- This procedure adds a `BLOB` to a multipart/form request body.
--
-- Parameters:
-- * p_multipart:    The table type for the multipart/request body, `t_multipart_parts`.
-- * p_name:         The name of the multipart data.
-- * p_filename:     The filename of the multipart data if it exists.
-- * p_content_type: The content type of the multipart data. The default value is 
--                   'application/octet-stream'.
-- * p_body_blob:    The content to add in BLOB.
--
-- Example:
-- ~~~
-- declare
--     l_multipart    apex_web_service.t_multipart_parts;
-- begin
--     apex_web_service.append_to_multipart (
--         p_multipart    => l_multipart,
--         p_name         => 'param1',
--         p_filename     => 'filename1',
--         p_content_type => 'application/octet-stream',
--         p_body_blob    => (select blob from table where id = 1) );
-- end;
-- ~~~
--======================================================================================================================
procedure append_to_multipart (
    p_multipart     in out nocopy t_multipart_parts,
    p_name          in            varchar2,
    p_filename      in            varchar2 default null,
    p_content_type  in            varchar2 default 'application/octet-stream',
    p_body_blob     in            blob );

--======================================================================================================================
-- This procedure adds a `CLOB` to a multipart/form request body.
--
-- Parameters:
-- * p_multipart:    The table type for the multipart/request body, `t_multipart_parts`.
-- * p_name:         The name of the multipart data.
-- * p_filename:     The filename of the multipart data if it exists.
-- * p_content_type: The content type of the multipart data.
-- * p_body:         The content to add in CLOB.
--
-- Example:
-- ~~~
-- declare
--     l_multipart    apex_web_service.t_multipart_parts;
-- begin
--     apex_web_service.append_to_multipart (
--         p_multipart    => l_multipart,
--         p_name         => 'param1',
--         p_content_type => 'application/json',
--         p_body         =>  to_clob( '{"hello":"world"}' ) );
-- end;
-- ~~~
--======================================================================================================================
procedure append_to_multipart (
    p_multipart     in out nocopy t_multipart_parts,
    p_name          in            varchar2,
    p_filename      in            varchar2 default null,
    p_content_type  in            varchar2 default null,
    p_body          in            clob );

--======================================================================================================================
-- This function generates the multipart/form-data request body from the data in 
-- the `t_multiparts` array.
--
-- Parameters:
-- * p_multipart:  The table type for the multipart/request body, `t_multipart_parts`.
-- * p_to_charset: The target character set for the parts that are `CLOBs`. This 
--                 parameter defaults to the current character set of the database.
--
--
-- Returns:
-- The request body as a `BLOB`.
--
-- Example:
-- This example stores the multipart/form request in a local `BLOB` variable.
-- ~~~
-- declare
--     l_multipart    apex_web_service.t_multipart_parts;
--     l_request_blob blob;
-- begin
--      l_request_blob := apex_web_service.generate_request_body (
--                            p_multipart    => l_multipart );
-- end;
-- ~~~
--======================================================================================================================
function generate_request_body (
    p_multipart      in t_multipart_parts,
    p_to_charset     in varchar2 default wwv_flow_lang.get_db_charset )
    return blob;

--======================================================================================================================
--! MAKE_REQUEST Function Signature 1
-- 
-- This function invokes a SOAP-style Web service with the supplied SOAP envelope 
-- returning the results in an `XMLTYPE`.
--
-- Parameters:
-- * p_url:                  The URL endpoint of the Web service.
-- * p_action:               The SOAP Action corresponding to the operation invoked.
-- * p_version:              The SOAP version (1.1 or 1.2). The default is 1.1.
-- * p_envelope:             The SOAP envelope to post to the service.
-- * p_username:             The username if basic authentication is required for this service.
-- * p_password:             The password if basic authentication is required for this service.
-- * p_scheme:               The authentication scheme. Basic (default), AWS, Digest, or `OAUTH_CLIENT_CRED` if 
--                           supported by your database release.
-- * p_proxy_override:       The proxy to use for the request. The proxy supplied overrides the proxy defined in the
--                           application attributes.
-- * p_transfer_timeout:     The amount of time in seconds to wait for a response.
-- * p_wallet_path:          The file system path to a wallet if the URL endpoint is HTTPS. 
--                           For example, file:/usr/home/oracle/WALLETS
--                           The wallet path provided overrides the wallet defined in the instance settings.
-- * p_wallet_pwd:           The password to access the wallet.
-- * p_https_host:           The host name to be matched against the common name (CN) of the remote server's certificate
--                           for an HTTPS request.
--
-- Returns:
-- The SOAP service response in an `XMLTYPE`.
--
-- Example:
-- The following example uses the `make_request` function to invoke a SOAP style Web service that returns movie listings.
-- The result is stored in an XMLTYPE.
-- ~~~
-- DECLARE
--     l_envelope  CLOB;
--     l_xml       XMLTYPE;
-- BEGIN
--     l_envelope := ' <?xml version="1.0" encoding="UTF-8"?>
-- <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
-- xmlns:tns="http://www.ignyte.com/whatsshowing"
-- xmlns:xs="http://www.w3.org/2001/XMLSchema">
--     <soap:Body>
--         <tns:GetTheatersAndMovies>
--             <tns:zipCode>43221</tns:zipCode>
--             <tns:radius>5</tns:radius>
--         </tns:GetTheatersAndMovies>
--     </soap:Body>
-- </soap:Envelope>';
--
-- l_xml := apex_web_service.make_request(
--     p_url => ' http://www.ignyte.com/webservices/ignyte.whatsshowing.webservice/moviefunctions.asmx',
--     p_action => ' http://www.ignyte.com/whatsshowing/GetTheatersAndMovies',
--     p_envelope => l_envelope
-- );
-- END;
-- ~~~
--
-- Example:
--  This example invokes a SOAP service returning an XMLTYPE.
--
--     declare
--         l_xml sys.xmltype;
--     begin
--         l_xml := apex_web_service.make_request(
--             p_url            => 'http://{host}:{port}/path/to/soap/service/',
--             p_action         => 'doSoapRequest',
--             p_envelope       => '{SOAP envelope in XML format}' );
--     end;
--======================================================================================================================
function make_request (
    p_url               in varchar2,
    p_action            in varchar2 default null,
    p_version           in varchar2 default '1.1',
    p_envelope          in clob,
    p_username          in varchar2 default null,
    p_password          in varchar2 default null,
    p_scheme            in varchar2 default 'Basic',
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number   default 180,
    p_wallet_path       in varchar2 default null,
    p_wallet_pwd        in varchar2 default null,
    p_https_host        in varchar2 default null) 
    return sys.xmltype;

--======================================================================================================================
--! MAKE_REQUEST Procedure Signature 1
--
-- This procedure invokes a SOAP-style Web service with the supplied SOAP envelope and stores the results in a collection.
--
-- Parameters:
-- * p_url:              The URL endpoint of the Web service.
-- * p_action:           The SOAP Action corresponding to the operation to be invoked.
-- * p_version:          The SOAP version (1.1 or 1.2). The default is 1.1.
-- * p_collection_name:  The name of the collection to store the response.
-- * p_envelope:         The SOAP envelope to post to the service.
-- * p_username:         The username if basic authentication is required for this service.
-- * p_password:         The password if basic authentication is required for this service.
-- * p_scheme:           The authentication scheme. Basic (default), AWS, or Digest if 
--                       supported by your database release.
-- * p_proxy_override:   The proxy to use for the request. The proxy supplied overrides the proxy defined
--                       in the application attributes.
-- * p_transfer_timeout: The amount of time in seconds to wait for a response.
-- * p_wallet_path:      The file system path to a wallet if the URL endpoint is HTTPS. 
--                       For example, `file:/usr/home/oracle/WALLETS`. 
--
--                       The wallet path provided overrides the wallet defined in the instance settings.
-- * p_wallet_pwd:       The password to access the wallet.
-- * p_https_host:       The host name to be matched against the common name (CN) of the remote server's
--                       certificate for an HTTPS request.
--
-- Example:
-- The following example uses the `make_request` procedure to retrieve a list of movies from a SOAP style Web service. 
-- The response is stored in an Oracle APEX collection named `MOVIE_LISTINGS`.
--
-- ~~~
-- DECLARE
--     l_envelope CLOB;
--
-- BEGIN
-- 	 l_envelope := '<?xml version="1.0" encoding="UTF-8"?>
-- <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
-- xmlns:tns="http://www.ignyte.com/whatsshowing"
-- xmlns:xs="http://www.w3.org/2001/XMLSchema">
--    <soap:Body>
--       <tns:GetTheatersAndMovies>
--          <tns:zipCode>43221</tns:zipCode>
--          <tns:radius>5</tns:radius>
--       </tns:GetTheatersAndMovies>
--    </soap:Body>
-- </soap:Envelope>';
-- 
-- apex_web_service.make_request(
--    p_url               => ' http://www.ignyte.com/webservices/ignyte.whatsshowing.webservice/moviefunctions.asmx',
--    p_action            => ' http://www.ignyte.com/whatsshowing/GetTheatersAndMovies',
--    p_collection_name   => 'MOVIE_LISTINGS',
--    p_envelope          => l_envelope
-- );
-- 
-- END;
-- ~~~
--
-- Example:
-- This example invokes a SOAP service and stores the response in a collection:
--
--     begin
--         apex_web_service.make_request(
--             p_url             => 'http://{host}:{port}/path/to/soap/service/',
--             p_collection_name => 'MY_RESPONSE_COLLECTION',
--             p_action          => 'doSoapRequest',
--             p_envelope        => '{SOAP envelope in XML format}' );
--     end;
--======================================================================================================================
procedure make_request (
    p_url               in varchar2,
    p_action            in varchar2 default null,
    p_version           in varchar2 default '1.1',
    p_collection_name   in varchar2 default null,
    p_envelope          in clob,
    p_username          in varchar2 default null,
    p_password          in varchar2 default null,
    p_scheme            in varchar2 default 'Basic',
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number   default 180,
    p_wallet_path       in varchar2 default null,
    p_wallet_pwd        in varchar2 default null,
    p_https_host        in varchar2 default null);

--======================================================================================================================
--! MAKE_REQUEST Function Signature 2
-- 
-- This function invokes a Web service with the supplied SOAP envelope and returns
-- the response as an `XMLTYPE`.
--
-- Parameters:
-- * p_url:                  The URL endpoint of the Web service.
-- * p_action:               The SOAP Action corresponding to the operation invoked.
-- * p_version:              The SOAP version (1.1 or 1.2). The default is 1.1.
-- * p_envelope:             The SOAP envelope to post to the service.
-- * p_credential_static_id: The name of the Web Credentials to be used. Web Credentials are configured in Workspace Utilities.
-- * p_token_url:            The URL to retrieve the token from for token-based authentication flows (such as OAuth2).
-- * p_proxy_override:       The proxy to use for the request. The proxy supplied overrides the proxy defined in the application attributes.
-- * p_transfer_timeout:     The amount of time in seconds to wait for a response.
-- * p_wallet_path:          The filesystem path to a wallet if request is `HTTPS`. 
--                           For example, file:/usr/home/oracle/WALLETS.
-- * p_wallet_pwd:           The password to access the wallet.
-- * p_https_host:           The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
--
-- Returns:
-- The SOAP service response as an XMLTYPE.
--
-- Example:
-- Invoke a SOAP service returning an XMLTYPE.
-- ~~~
-- declare
--     l_xml sys.xmltype;
-- begin
--     l_xml := apex_web_service.make_request(
--         p_url                  => 'http://{host}:{port}/path/to/soap/service/',
--         p_action               => 'doSoapRequest',
--         p_envelope             => '{SOAP envelope in XML format}',
--         p_credential_static_id => 'My_Credentials',
--         p_token_url            => 'http://{host}:{port}/ords/scott/oauth/token' );
-- end;
-- ~~~
--======================================================================================================================
function make_request (
    p_url                  in varchar2,
    p_action               in varchar2 default null,
    p_version              in varchar2 default '1.1',
    p_envelope             in clob,
    --
    p_credential_static_id in varchar2,
    p_token_url            in varchar2 default null,
    --
    p_proxy_override       in varchar2 default null,
    p_transfer_timeout     in number   default 180,
    p_wallet_path          in varchar2 default null,
    p_wallet_pwd           in varchar2 default null,
    p_https_host           in varchar2 default null ) 
    return sys.xmltype;

--======================================================================================================================
--! MAKE_REQUEST Procedure Signature 2 
--
-- This procedure invokes a Web service with the supplied SOAP envelope and stores
-- the response in a collection.
--
-- Parameters:
-- * p_url:                  The URL endpoint of the Web service.
-- * p_action:               The SOAP Action corresponding to the operation invoked.
-- * p_version:              The SOAP version (1.1 or 1.2). The default is 1.1.
-- * p_collection_name:      The name of the collection to store the response.
-- * p_envelope:             The SOAP envelope to post to the service.
-- * p_credential_static_id: The name of the Web Credentials to be used. Web Credentials 
--                           are configured in Workspace Utilities.
-- * p_token_url:            For token-based authentication flows: The URL where to get the token from.
-- * p_proxy_override:       The proxy to use for the request.
-- * p_transfer_timeout:     The amount of time in seconds to wait for a response.
-- * p_wallet_path:          The filesystem path to a wallet if request is HTTPS.
--                           For example, file:/usr/home/oracle/WALLETS
-- * p_wallet_pwd:           The password to access the wallet.
-- * p_https_host:           The host name to be matched against the common name (CN) 
--                            of the remote server's certificate for an HTTPS request
--
-- Example:
-- Invoke a SOAP service and store the response in a collection.
-- ~~~
-- begin
--     apex_web_service.make_request(
--         p_url                  => 'http://{host}:{port}/path/to/soap/service/',
--         p_collection_name      => 'MY_RESPONSE_COLLECTION',
--         p_action               => 'doSoapRequest',
--         p_envelope             => '{SOAP envelope in XML format}',
--         p_credential_static_id => 'My_Credentials',
--         p_token_url            => 'http://{host}:{port}/ords/scott/oauth/token' );
-- end;
-- ~~~
--======================================================================================================================
procedure make_request (
    p_url                  in varchar2,
    p_action               in varchar2 default null,
    p_version              in varchar2 default '1.1',
    p_collection_name      in varchar2 default null,
    p_envelope             in clob,
    --
    p_credential_static_id in varchar2,
    p_token_url            in varchar2 default null,
    --
    p_proxy_override       in varchar2 default null,
    p_transfer_timeout     in number   default 180,
    p_wallet_path          in varchar2 default null,
    p_wallet_pwd           in varchar2 default null,
    p_https_host           in varchar2 default null);


--======================================================================================================================
-- This procedure performs OAUTH authentication and requests an OAuth access token.
-- The token and its expiry date are stored in a package global.
--
-- Note: 
-- Currently only the Client Credentials flow is supported.
--
-- Parameters:
-- * p_token_url:            The URL endpoint of the OAuth token service.
-- * p_client_id:            OAuth Client ID to use for authentication.
-- * p_client_secret:        OAuth Client Secret to use for authentication.
-- * p_flow_type:            OAuth flow type. Only OAUTH_CLIENT_CRED is supported at this time.
-- * p_proxy_override:       The proxy to use for the request.
-- * p_transfer_timeout:     The amount of time in seconds to wait for a response.
-- * p_wallet_path:          The filesystem path to a wallet if request is https. 
--                           For example, 'file:/usr/home/oracle/WALLETS'.
-- * p_wallet_pwd:           The password to access the wallet.
-- * p_https_host:           The host name to be matched against the common name (CN) of the remote server's certificate 
--                           for an HTTPS request.
-- * p_scope:                The OAuth scope to identify groups of attributes that will be requested from the OAuth provider. 
--                           For example, `profile`,`email`.
--
-- Example:
--  This example performs an OAuth client credentials authentication using passed 
--  client ID and client secret and obtains an access token.
-- ~~~
-- begin
--    apex_web_service.oauth_authenticate(
--        p_token_url     => '[URL to ORDS OAuth troken service: http(s)://{host}:{port}/ords/.../oauth/token]',
--        p_client_id     => '[client-id]',
--        p_client_secret => '[client-secret]');
-- end;
-- ~~~
--======================================================================================================================
procedure oauth_authenticate(
    p_token_url         in varchar2,
    p_client_id         in varchar2,
    p_client_secret     in varchar2,
    p_flow_type         in varchar2 default OAUTH_CLIENT_CRED,
    p_proxy_override    in varchar2 default null,
    p_transfer_timeout  in number   default 180,
    p_wallet_path       in varchar2 default null,
    p_wallet_pwd        in varchar2 default null,
    p_https_host        in varchar2 default null,
    p_scope             in varchar2 default null);

--======================================================================================================================
-- This procedure performs OAUTH authentication using a credential store.
-- The obtained access token and its expiry date are stored in a package global.
--
-- Parameters:
-- * p_token_url:            The URL endpoint of the OAuth token service.
-- * p_credential_static_id: The name of the Web Credentials to be used. Web Credentials are configured in Workspace Utilities.
-- * p_proxy_override:       The proxy to use for the request.
-- * p_transfer_timeout:     The amount of time in seconds to wait for a response.
-- * p_wallet_path:          The filesystem path to a wallet if request is https. For example, 'file:/usr/home/oracle/WALLETS'
-- * p_wallet_pwd:           The password to access the wallet.
-- * p_https_host:           The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
--
-- Example:
-- ~~~
-- begin
--    apex_web_service.oauth_authenticate_credential(
--        p_token_url => '[URL to ORDS OAuth troken service: http(s)://{host}:{port}/ords/.../oauth/token]',
--        p_credential_static_id => '[web-credential]');
-- end;
-- ~~~
--======================================================================================================================
procedure oauth_authenticate_credential(
    p_token_url            in varchar2,
    p_credential_static_id in varchar2,
    p_proxy_override       in varchar2 default null,
    p_transfer_timeout     in number   default 180,
    p_wallet_path          in varchar2 default null,
    p_wallet_pwd           in varchar2 default null,
    p_https_host           in varchar2 default null );

--======================================================================================================================
-- This function performs OAUTH autentication using a credential store.
-- The obtained access token and its expiry date are stored in a package global.
--
-- Deprecated:
-- `OAUTH_AUTHENTICATE Procedure Signature 2` has been deprecated, because `p_wallet_path` and `p_wallet_pwd` do not have a default value. 
-- Oracle recommends using `OAUTH_AUTHENTICATE_CREDENTIAL` instead.
-- Parameters:
-- * p_token_url:            The URL endpoint of the OAuth token service.
-- * p_credential_static_id: The name of the Web Credentials to be used. Web Credentials are configured in Workspace Utilities.
-- * p_proxy_override:       The proxy to use for the request.
-- * p_transfer_timeout:     The amount of time in seconds to wait for a response.
-- * p_wallet_path:          The filesystem path to a wallet if request is HTTPS. For example, file:/usr/home/oracle/WALLETS
-- * p_wallet_pwd:           The password to access the wallet.
-- * p_https_host:           The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
--
-- Example:
-- This example performs OAuth client credentials authentication using passed client ID and client secret
--  and obtains an access token.
-- ~~~
-- begin
--     apex_web_service.oauth_authenticate (
--         p_token_url              => 'http://{host}:{port}/ords/scott/oauth/token',
--         p_credential_static_id   => 'My_credentials',
--         p_wallet_path            => null,
--         p_wallet_pwd             => null );
-- end;
-- ~~~
-- See also:
-- OAUTH_AUTHENTICATE_CREDENTIAL
--======================================================================================================================
procedure oauth_authenticate(
    p_token_url            in varchar2,
    p_credential_static_id in varchar2,
    p_proxy_override       in varchar2 default null,
    p_transfer_timeout     in number   default 180,
    p_wallet_path          in varchar2,
    p_wallet_pwd           in varchar2,
    p_https_host           in varchar2 default null);

--======================================================================================================================
-- This function returns the OAuth access token received in the last `OAUTH_AUTHENTICATE` call.
--
-- Returns:
-- The OAuth access token from the last OAUTH_AUTHENTICATE call; `NULL` when the token is expired or `OAUTH_AUTHENTICATE` 
-- has not been called.
--
-- Example:
-- ```
-- declare
--     l_token varchar2(255);
-- begin
--     l_token := apex_web_service.oauth_get_last_token;
-- end;
-- ```
--======================================================================================================================
function oauth_get_last_token 
return varchar2;

--======================================================================================================================
-- This procedure sets the OAuth Access token to be used in `MAKE_REST_REQUEST` calls within this *database* session.
-- This procedure can be used to set a token which has been obtained by other means than with
-- `OAUTH_AUTHENTICATE` (for instance, custom code).
--
-- Parameters:
-- * p_token:   The OAuth access token to be used by `MAKE_REST_REQUEST` calls.
-- * p_expires: (Optional) The token expiry date. If `NULL`, no expiration date is set.
--
-- Example:
-- ```
-- begin
--     apex_web_service.oauth_set_token(
--         p_token => '37948987dqshjgd97638..' );
-- end;
-- ```
--======================================================================================================================
procedure oauth_set_token(
    p_token          in varchar2,
    p_expires        in date      default null );


--======================================================================================================================
-- This procedure sets HTTP request headers (`g_request_headers`) for subsequent 
-- `MAKE_REQUEST` or `MAKE_REST_REQUEST` calls.
--
-- Parameters:
-- * p_name_01:        Name of the 1st header to set.
-- * p_value_01:       Value of the 1st header to set.
-- * p_name_02:        Name of the 2nd header to set.
-- * p_value_02:       Value of the 2nd header to set.
-- * p_name_03:        Name of the 3rd header to set.
-- * p_value_03:       Value of the 3rd header to set.
-- * p_name_04:        Name of the 4th header to set.
-- * p_value_04:       Value of the 4th header to set.
-- * p_name_05:        Name of the 5th header to set.
-- * p_value_05:       Value of the 5th header to set.
-- * p_reset:          Whether to clear the request header array before.
-- * p_skip_if_exists: If TRUE, any existing headers with the same name remain unchanged.
--                     For example, if you pass in "Content-Type" as `p_name_NN` and that
--                     header is already present in the `apex_web_services.g_request_headers` 
--                     array, then the value that you pass in does not override the existing 
--                     header value for that name.
--
--
-- Example:
-- The following example appends "Content-Type" and "User-Agent" HTTP request headers 
-- to the already existing headers, but only if they do not exist yet.
--
-- ```
-- begin
--     apex_web_service.set_request_headers(
--         p_name_01        => 'Content-Type',
--         p_value_01       => 'application/json',
--         p_name_02        => 'User-Agent',
--         p_value_02       => 'APEX',
--         p_reset          => false,
--         p_skip_if_exists => true );
-- end;
-- ```
--
-- Example:
-- The following example clears existing request headers and sets "Content-Type" and "User-Agent."
-- ```
-- begin
--     apex_web_service.set_request_headers(
--         p_name_01        => 'Content-Type',
--         p_value_01       => 'application/json',
--         p_name_02        => 'User-Agent',
--         p_value_02       => 'APEX' );
-- end;
-- ```
--======================================================================================================================
procedure set_request_headers (
    p_name_01            in varchar2,
    p_value_01           in varchar2,
    p_name_02            in varchar2 default null,
    p_value_02           in varchar2 default null,
    p_name_03            in varchar2 default null,
    p_value_03           in varchar2 default null,
    p_name_04            in varchar2 default null,
    p_value_04           in varchar2 default null,
    p_name_05            in varchar2 default null,
    p_value_05           in varchar2 default null,
    p_reset              in boolean  default true,
    p_skip_if_exists     in boolean  default false );

--======================================================================================================================
-- This procedure removes an HTTP request header (`g_request_headers`). If the header 
-- parameter name does not exist, no error is raised.
--
-- Note: 
-- This procedure may reorder the header entries in `g_request_headers`!
--
-- Parameters:
-- * p_name:    The name of the header to remove.
--
-- Example:
-- This example removes the "Metadata-Context" header.
-- ```
-- begin
--     apex_web_service.remove_request_header(
--         p_name => 'Metadata-Context');
-- end;
-- ```
--======================================================================================================================
procedure remove_request_header (
    p_name in varchar2 );    

--======================================================================================================================
-- This procedure adds an Execution Context ID (ECID) HTTP request header to `g_request_headers`. This will override the 
-- application level security setting "Pass ECID".
--
-- Parameters:
-- * p_ecid:   The identifier for the execution context.
--             - If set to NULL, no ECID header will be added.
--             - If set to `AUTO_ECID` (the default), an automatically determined ECID header will be added.
--             - If set to something else, `substrb(p_ecid, 1, 64)` will be used as the ECID header.
--
-- Example:
-- On application level, the sending of an ECID header is switched off. By calling 
-- `set_request_ecid_context` without any parameter, the following call to `make_rest_request`
--  will have an "ECID-Context" request header with an automatically determined ECID.
--
-- ```
-- begin
--     apex_web_service.set_request_ecid_context;
-- end;
-- ```
--
-- Example:
-- On application level, the sending of an ECID header is switched off. By providing an
-- ECID value, the following call to `make_rest_request` will have an "ECID-Context"
-- request header.
--
-- ```
-- begin
--     apex_web_service.set_request_ecid_context(
--         p_ecid => 'my-123456' );
-- end;
-- ```
--
-- Example:
-- On application level, the sending of an ECID header is switched on. By providing an
-- ECID value of `NULL`, the following call to `make_rest_request` will not have an 
-- "ECID-Context" request header.
--
-- ```
-- begin
--     apex_web_service.set_request_ecid_context(
--         p_ecid => null );
-- end;
-- ```
--
-- Example:
-- On application level, the sending of an ECID header is switched on. By providing an
-- ECID value, the following call to `make_rest_request` will use this value instead
-- of an automatically determined ECID.
--
-- ```
-- begin
--     apex_web_service.set_request_ecid_context(
--         p_ecid => 'my-123456' );
-- end;
-- ```
--======================================================================================================================
procedure set_request_ecid_context (
    p_ecid in varchar2 default AUTO_ECID);

--======================================================================================================================
-- Use this function to invoke a RESTful style Web service supplying either name-value pairs, 
-- a character-based payload or a binary payload and returning the response in a CLOB.
--
-- Parameters:  
-- * p_url:                   The URL endpoint of the Web service.
-- * p_http_method:           The HTTP Method to use (PUT, POST, GET, HEAD or DELETE).
-- * p_username:              The username if basic authentication is required for this service.
-- * p_password:              The password if basic authentication is required for this service.
-- * p_scheme:                The authentication scheme, Basic (default) or AWS or Digest or 
--                            `OAUTH_CLIENT_CRED` if supported by your database release.
-- * p_proxy_override:        The proxy to use for the request. The proxy supplied overrides the proxy 
--                            defined in the application attributes.
-- * p_transfer_timeout:      The amount of time in seconds to wait for a response.
--  
-- * p_body:                  The HTTP payload to be sent as CLOB.
-- * p_body_blob:             The HTTP payload to be sent as binary BLOB. For example, posting a file.
-- * p_parm_name:             The name of the parameters to be used in name/value pairs.
-- * p_parm_value:            The value of the paramters to be used in name/value pairs.
-- * p_wallet_path:           The file system path to a wallet if the URL endpoint is https. 
--                            For example, file:/usr/home/oracle/WALLETS. 
--                            The wallet path provided overrides the wallet defined in the instance settings.
-- * p_wallet_pwd:            The password to access the wallet.
-- * p_https_host:            The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
--  
-- * p_credential_static_id:  The name of the Web Credentials to be used. Web Credentials are configured in Workspace Utilities.
-- * p_token_url:             For token-based authentication flows (like OAUTH2): The URL where to get the token from.
--
-- Returns:
-- The REST service response as a CLOB.
--
-- Example:
-- The following example calls a RESTful-style web service using the `make_rest_request` function 
-- passing the parameters to the service as name/value pairs. 
-- The response from the service is stored in a locally declared CLOB.
-- ```
-- declare
--    l_clob 	CLOB;
-- begin
--    l_clob := apex_web_service.make_rest_request(
--        p_url => 'http://us.music.yahewapis.com/video/v1/list/published/popular',
--        p_http_method => 'GET',
--        p_parm_name => apex_string.string_to_table('appid:format'),
--        p_parm_value => apex_string.string_to_table('xyz:xml'));
-- end;
-- ```
--======================================================================================================================
function make_rest_request(
    p_url                  in varchar2,
    p_http_method          in varchar2,
    p_username             in varchar2                default null,
    p_password             in varchar2                default null,
    p_scheme               in varchar2                default 'Basic',
    p_proxy_override       in varchar2                default null,
    p_transfer_timeout     in number                  default 180,
    p_body                 in clob                    default empty_clob(),
    p_body_blob            in blob                    default empty_blob(),
    p_parm_name            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_wallet_path          in varchar2                default null,
    p_wallet_pwd           in varchar2                default null,
    p_https_host           in varchar2                default null,
    --
    p_credential_static_id in varchar2                default null,
    p_token_url            in varchar2                default null) 
    return clob;

--======================================================================================================================
-- This function invokes a RESTful style Web service supplying either name-value pairs, 
-- a character-based payload, or a binary payload, and returns the response in a BLOB.
--
-- Parameters:
-- * p_url:                   The URL endpoint of the Web service.
-- * p_http_method:           The HTTP Method to use, PUT, POST, GET, HEAD or DELETE.
-- * p_username:              The username if basic authentication is required for this service.
-- * p_password:              The password if basic authentication is required for this service.
-- * p_scheme:                The authentication scheme, Basic (default) or AWS or Digest or `OAUTH_CLIENT_CRED`, 
--                            if supported by your database release.
-- * p_proxy_override:        The proxy to use for the request. The proxy supplied overrides the proxy defined in the application attributes.
-- * p_transfer_timeout:      The amount of time in seconds to wait for a response.
--  
-- * p_body:                  The HTTP payload to be sent as CLOB.
-- * p_body_blob:             The HTTP payload to be sent as binary BLOB. For example, posting a file.
-- * p_parm_name:             The name of the parameters to be used in name/value pairs.
-- * p_parm_value:            The value of the paramters to be used in name/value pairs.
-- * p_wallet_path:           The filesystem path to a wallet if the URL endpoint is HTTPS. For example,
--                            file:/usr/home/oracle/WALLETS. The wallet path provided overrides the wallet defined in the instance settings.
-- * p_wallet_pwd:            The password to access the wallet.
-- * p_https_host:            The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
-- 
-- * p_credential_static_id:  The name of the Web Credentials to be used. Web Credentials are configured in Workspace Utilities.
-- * p_token_url:             For token-based authentication flows (like OAuth2): The URL where to get the token from.
--
-- Returns:
-- The REST service response as a BLOB.
--
-- Example:
-- The following example calls a RESTful-style web service using the `make_rest_request` function 
-- passing the parameters to the service as name/value pairs. 
-- The response from the service is stored in a locally declared BLOB.
-- ```
-- declare
--    l_blob 	BLOB;
-- begin
--    l_blob := apex_web_service.make_rest_request_b(
--        p_url => 'http://us.music.yahewapis.com/video/v1/list/published/popular',
--        p_http_method => 'GET',
--        p_parm_name => apex_string.string_to_table('appid:format'),
--        p_parm_value => apex_string.string_to_table('xyz:xml'));
-- end;
-- ```
--======================================================================================================================
function make_rest_request_b(
    p_url                  in varchar2,
    p_http_method          in varchar2,
    p_username             in varchar2                default null,
    p_password             in varchar2                default null,
    p_scheme               in varchar2                default 'Basic',
    p_proxy_override       in varchar2                default null,
    p_transfer_timeout     in number                  default 180,
    p_body                 in clob                    default empty_clob(),
    p_body_blob            in blob                    default empty_blob(),
    p_parm_name            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_parm_value           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_wallet_path          in varchar2                default null,
    p_wallet_pwd           in varchar2                default null,
    p_https_host           in varchar2                default null,
    --
    p_credential_static_id in varchar2                default null,
    p_token_url            in varchar2                default null) 
    return blob;

--======================================================================================================================
-- This function parses the response from a Web service returned as an XMLTYPE 
-- and returns the value requested as a VARCHAR2.
--
-- Parameters:
-- * p_xml:   The XML document as an XMLTYPE to parse.
-- * p_xpath: The XPath expression to the desired node.
-- * p_ns:    The namespace to the desired node.
--
-- Returns:
-- The VARCHAR2 value of the XML node specified by the P_XPATH argument.
--
-- Example:
-- The following example uses the `make_request` function to call a Web service and 
-- store the results in a local XMLTYPE variable. The `parse_xml` function is then 
-- used to pull out a specific node of the XML document stored in the XMLTYPE and
-- stores it in a locally declared VARCHAR2 variable.
-- ~~~
-- DECLARE
--     l_envelope CLOB;
--     l_xml      XMLTYPE;
--     l_movie    VARCHAR2(4000);
-- BEGIN
--     l_envelope := ' <?xml version="1.0" encoding="UTF-8"?>
-- <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
-- xmlns:tns="http://www.ignyte.com/whatsshowing"
-- xmlns:xs="http://www.w3.org/2001/XMLSchema">
--    <soap:Body>
--       <tns:GetTheatersAndMovies>
--          <tns:zipCode>43221</tns:zipCode>
--          <tns:radius>5</tns:radius>
--       </tns:GetTheatersAndMovies>
--    </soap:Body>
-- </soap:Envelope>';
--  
--    l_xml := apex_web_service.make_request(
--      p_url => ' http://www.ignyte.com/webservices/ignyte.whatsshowing.webservice/moviefunctions.asmx',
--      p_action => ' http://www.ignyte.com/whatsshowing/GetTheatersAndMovies',
--      p_envelope => l_envelope );
--  
--    l_movie := apex_web_service.parse_xml(
--      p_xml => l_xml,
--      p_xpath => ' //GetTheatersAndMoviesResponse/GetTheatersAndMoviesResult/Theater/Movies/Movie/Name[1]',
--      p_ns => ' xmlns="http://www.ignyte.com/whatsshowing"' );
--  
-- END;
-- ~~~
--======================================================================================================================
function parse_xml (
    p_xml               in sys.xmltype,
    p_xpath             in varchar2,
    p_ns                in varchar2 default null ) 
    return varchar2;

--======================================================================================================================
-- This function parses the response from a Web service returned as an XMLTYPE
-- and returns the value requested as a CLOB.
--
-- Parameters:
-- * p_xml:   The xmldocument as an sys.xmltype to parse.
-- * p_xpath: The xPath to the desired node.
-- * p_ns:    The namespace to the desired node.
--
-- Returns:
-- The CLOB value of the XML node specified by the P_XPATH argument.
--
-- Example:
-- The following example uses the make_request function to call a Web service and 
-- stores the results in a local XMLTYPE variable. The parse_xml_clob function is then 
-- used to pull out a specific node of the XML document stored in the XMLTYPE and 
-- stores it in a locally declared CLOB variable.
-- ~~~
-- DECLARE
--     l_envelope CLOB;
--     l_xml XMLTYPE;
--     l_movie CLOB;
-- BEGIN
--     l_envelope := ' <?xml version="1.0" encoding="UTF-8"?>
-- <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
-- xmlns:tns="http://www.ignyte.com/whatsshowing"
-- xmlns:xs="http://www.w3.org/2001/XMLSchema">
--    <soap:Body>
--       <tns:GetTheatersAndMovies>
--          <tns:zipCode>43221</tns:zipCode>
--          <tns:radius>5</tns:radius>
--       </tns:GetTheatersAndMovies>
--    </soap:Body>
-- </soap:Envelope>';
--  
--    l_xml := apex_web_service.make_request(
--      p_url => ' http://www.ignyte.com/webservices/ignyte.whatsshowing.webservice/moviefunctions.asmx',
--      p_action => ' http://www.ignyte.com/whatsshowing/GetTheatersAndMovies',
--      p_envelope => l_envelope );
--  
--    l_movie := apex_web_service.parse_xml_clob(
--      p_xml => l_xml,
--      p_xpath => ' //GetTheatersAndMoviesResponse/GetTheatersAndMoviesResult/Theater/Movies/Movie/Name[1]',
--      p_ns => ' xmlns="http://www.ignyte.com/whatsshowing"' );
--  
-- END;
-- ~~~
--======================================================================================================================
function parse_xml_clob (
    p_xml               in sys.xmltype,
    p_xpath             in varchar2,
    p_ns                in varchar2 default null ) 
    return clob;

--======================================================================================================================
-- This function parses the response from a Web service that is stored in a collection 
-- and returns the result as a `VARCHAR2` type.
--
-- Parameters:
-- * p_collection_name: The name of the collection where the Web service response is stored.
-- * p_xpath:           The XPath expression to the desired node.
-- * p_ns:              The namespace to the desired node.
--
-- Returns:
-- The `VARCHAR2` value of the XML node specified by the P_XPATH argument.
--
-- Example:
-- The following example parses a response stored in a collection called 'STELLENT_CHECKIN' 
-- and stores the value in a locally declared `VARCHAR2` variable.
--
-- ```
-- declare
--     l_response_msg  varchar2(4000);
-- begin
--     l_response_msg := apex_web_service.parse_response(
--         p_collection_name=>'STELLENT_CHECKIN',
--         p_xpath =>
-- '//idc:CheckInUniversalResponse/idc:CheckInUniversalResult/idc:StatusInfo/idc:statusMessage/text()',
--         p_ns=>'xmlns:idc="http://www.stellent.com/CheckIn/"');
-- end;
-- ```
--======================================================================================================================
function parse_response (
    p_collection_name   in varchar2,
    p_xpath             in varchar2,
    p_ns                in varchar2 default null ) 
    return varchar2;

--======================================================================================================================
-- This function parses the response from a Web service that is stored in a collection 
-- and returns the result as a `CLOB` type.
--
-- Parameters:
-- * p_collection_name: The name of the collection where the Web service response is stored.
-- * p_xpath:           The XPath expression to the desired node.
-- * p_ns:              The namespace to the desired node.
--
-- Returns:
-- The `CLOB` value of the XML node specified by the P_XPATH argument.
--
-- Example:
-- The following example parses a response stored in a collection called `STELLENT_CHECKIN` and 
-- stores the value in a locally declared CLOB variable.
-- ~~~
-- DECLARE
--     l_response_msg  CLOB;
-- BEGIN
--     l_response_msg := apex_web_service.parse_response_clob(
--         p_collection_name=>'STELLENT_CHECKIN',
--         p_xpath=>
-- '//idc:CheckInUniversalResponse/idc:CheckInUniversalResult/idc:StatusInfo/idc:statusMessage/text()',
--         p_ns=>'xmlns:idc="http://www.stellent.com/CheckIn/"');
-- END;
-- ~~~
--======================================================================================================================
function parse_response_clob (
    p_collection_name   in varchar2,
    p_xpath             in varchar2,
    p_ns                in varchar2 default null ) 
    return clob;
    
--======================================================================================================================
-- This procedure clears the current request headers.
--
-- Parameters:
-- None.
--
-- Example:
-- ~~~
-- begin
--     apex_web_service.clear_request_headers;
-- end;
-- ~~~
--======================================================================================================================
procedure clear_request_headers;

--======================================================================================================================
-- This procedure clears the cookie globals in `APEX_WEB_SERVICE` and in `UTL_HTTP`, 
-- so that the next `MAKE_REST_REQUEST` call executes without sending any cookies. 
--
-- Parameters:
-- None.
--
-- Example:
-- ~~~
-- begin
--     apex_web_service.clear_request_cookies;
-- end;
-- ~~~
--======================================================================================================================
procedure clear_request_cookies;

--======================================================================================================================
-- This function gets a specific request header value out of the request headers array.
--
-- Parameters:
-- * p_header_name: The parameter name (case is normalized for the search in the header array).
--
-- Example:
--
--     select apex_web_service.get_request_header('ECID-Context') from dual;
--
--======================================================================================================================
function get_request_header (
    p_header_name varchar2 )
    return varchar2;

end wwv_flow_webservices_api;
/
show errors
