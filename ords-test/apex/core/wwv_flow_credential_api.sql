set define off verify off
prompt ...wwv_flow_credential_api.sql
create or replace package wwv_flow_credential_api authid current_user
------------------------------------------------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2023, Oracle and/or its affiliates.
--
--  You can use the APEX_CREDENTIAL package to change stored credentials either persistently
--  or for the current Oracle APEX session only.
--
------------------------------------------------------------------------------------------------------------------------
is
--
--######################################################################################################################
-- Data Types: 
--
-- The section describes constants and data types used by the APEX_CREDENTIAL package.
--######################################################################################################################

-- Internal:
subtype t_token_type is pls_integer range 1..3;
c_token_access  constant t_token_type := 1;
c_token_refresh constant t_token_type := 2;
c_token_id      constant t_token_type := 3;

subtype t_credential_type is wwv_credentials.authentication_type%type;
c_type_basic             constant t_credential_type := 'BASIC';
c_type_oauth_client_cred constant t_credential_type := 'OAUTH2_CLIENT_CREDENTIALS';
c_type_jwt               constant t_credential_type := 'JWT';
c_type_oci               constant t_credential_type := 'OCI';
c_type_http_header       constant t_credential_type := 'HTTP_HEADER';
c_type_http_query_string constant t_credential_type := 'HTTP_QUERY_STRING';
c_type_key_pair          constant t_credential_type := 'KEY_PAIR';

-- Internal:
type t_credential is record (
    id                        wwv_credentials.id%type,
    auth_type                 t_credential_type,
    scope                     wwv_credentials.scope%type,
    client_id                 wwv_credentials.client_id%type,
    client_secret             wwv_credentials.client_secret%type,
    namespace                 wwv_credentials.namespace%type,
    fingerprint               wwv_credentials.fingerprint%type,
    valid_for_urls            wwv_credentials.valid_for_urls%type,
    db_credential_name        wwv_credentials.db_credential_name%type,
    db_credential_is_instance boolean );

-- Internal:
type t_token is record (
    value_type  wwv_credential_instances.value_type%type,
    value       varchar2(32767),
    expiry_date date );

-- Internal:
type t_tokens is table of t_token index by binary_integer;

--==============================================================================
-- This procedure sets username and password for the provided credential for the
-- current APEX session. Typically used for `BASIC` authentication when the 
-- credentials to be used are to be provided by the end user.
--
-- Parameters:
-- * p_credential_static_id: Credential static ID
-- * p_username:             Credential user name
-- * p_password:             Credential password
--
-- Example:
-- Set user name and password into credential `Login` for the current APEX session.
--
--     begin
--         apex_credential.set_session_credentials (
--             p_credential_static_id => 'Login',
--             p_username             => 'scott',
--             p_password             => 'tiger );
--     end;
--==============================================================================
procedure set_session_credentials(
    p_credential_static_id  in varchar2,
    p_username              in varchar2,
    p_password              in varchar2 );

--==============================================================================
-- This procedure sets provided credential attributes for the current APEX
-- session. Typically used for the `OAuth2 Client Credentials` or 
-- `Oracle Cloud Infrastructure` credential types. 
--
-- Parameters:
-- * p_credential_static_id: Credential static ID
-- * p_client_id:            Use Client ID for OAuth Credentials
--                           Use User OCID for OCI Credentials
-- * p_client_secret:        Use Client Secret for OAuth Credentials
--                           Use Private Key for OCI Credentials
-- * p_namespace:            Use the Tenancy OCID for OCI Credentials
-- * p_fingerprint:          Use the Public Key Fingerprint for OCI Credentials
--
-- Example:
-- Set credential attributes for `OAuth Login`.
--
--     begin
--         apex_credential.set_session_credentials (
--             p_credential_static_id => 'OAuth Login',
--             p_client_id            => 'dnkjq237o8832ndj98098-..',
--             p_client_secret        => '1278672tjksaGSDA789312..' );
--     end;
--
-- Example:
-- Set credential attributes for `OCI Login`. Use attributes as follows:
--
--     begin
--         apex_credential.set_session_credentials (
--             p_credential_static_id => 'OCI Login',
--             p_client_id            => 'ocid1.user.oc1...',
--             p_client_secret        => 'MIIEowIBAAKCAQEAsjhTVL...',
--             p_namespace            => 'ocid1.tenancy.oc1...',
--             p_fingerprint          => 'ff:ff:ee:00:...' );
--     end;
--
-- Example:
-- Set credential attributes for `OCI Login`. Use attributes as follows:
--
--     begin
--         apex_credential.set_session_credentials (
--             p_credential_static_id => 'OCI Login',
--             p_client_id            => 'ocid1.user.oc1...',
--             p_client_secret        => 'MIIEowIBAAKCAQEAsjhTVL...',
--             p_namespace            => 'ocid1.tenancy.oc1...',
--             p_fingerprint          => 'ff:ff:ee:00:...' );
--     end;
--==============================================================================
procedure set_session_credentials(
    p_credential_static_id  in varchar2,
    p_client_id             in varchar2,
    p_client_secret         in varchar2,
    p_namespace             in varchar2 default null,
    p_fingerprint           in varchar2 default null );

--==============================================================================
-- This procedure sets provided credential attributes for the current APEX
-- session. 
--
-- Parameters:
-- * p_credential_static_id: Credential static ID.
-- * p_key:                  Credential key (name of the HTTP Header or Query String Parameter).
-- * p_value:                Credential secret value.
--
-- Example:
-- Set attributes into credential `my_API_key` for the current APEX session.
--
--     begin
--         apex_credential.set_session_credentials (
--             p_credential_static_id => 'my_API_key',
--             p_key                  => 'api_key',
--             p_value                => 'lsjkgjw4908902ru9fj879q367891hdaw' );
--     end;
--==============================================================================
procedure set_session_credentials(
    p_credential_static_id  in varchar2,
    p_key                   in varchar2,
    p_value                 in varchar2 );

--==============================================================================
-- This procedure clears all acquired tokens for the provided credential.
-- Only useful for OAuth based flows.
--
-- Parameters:
-- * p_credential_static_id: Credential static ID.
--
-- Example:
-- Clear all obtained tokens for the credential `OAuth Login`.
--
--     begin
--         apex_credential.clear_tokens(
--             p_credential_static_id => 'OAuth Login' );
--     end;
--==============================================================================
procedure clear_tokens( 
    p_credential_static_id in varchar2);

--==============================================================================
-- This procedure sets a token into the provided credential for the duration 
-- of the current APEX session. The token is encrypted and can only be used by 
-- the current APEX session. Client ID and Client Secret aren't stored in the 
-- credential by this procedure.
--
-- Parameters:
-- * p_credential_static_id: The credential static ID.
-- * p_token_type:           One of the constants: 
--                           - apex_credential.c_token_access
--                           - apex_credential.c_token_refresh
--                           - apex_credential.c_token_id
-- * p_token_value:          The value of the token.
-- * p_token_expires:        The expiry date of the token.
--
-- Example:
--
-- Store the OAuth access token with value `sdakjjkhw7632178jh12hs876e38..`,
-- and expiry date of `2023-10-31` into credential `OAuth Login`.
--
--     begin
--         apex_credential.set_session_token (
--             p_credential_static_id => 'OAuth Login',
--             p_token_type           => apex_credential.C_TOKEN_ACCESS,
--             p_token_value          => 'sdakjjkhw7632178jh12hs876e38..',
--             p_token_expires        => to_date('2023-10-31', 'YYYY-MM-DD') );
--     end;
--==============================================================================
procedure set_session_token(
    p_credential_static_id  in varchar2,
    p_token_type            in t_token_type,
    p_token_value           in varchar2,
    p_token_expires         in date );

--==============================================================================
-- This procedure sets a token into the provided credential persistently,
-- beyond the current APEX session. The token is encrypted for security. Client ID 
-- and Client Secret aren't stored in the credential store by this procedure.
--
-- Parameters:
-- * p_credential_static_id: Credential static ID.
-- * p_token_type:          One of the constants: 
--                           - apex_credential.c_token_access
--                           - apex_credential.c_token_refresh
--                           - apex_credential.c_token_id
-- * p_token_value:          The value of the token.
-- * p_token_expires:        The expiry date of the token.
--
-- Example:
--
-- Store OAuth2 access token with value `sdakjjkhw7632178jh12hs876e38..`,
-- and expiry date of `2023-10-31` into credential `OAuth Login`.
--
--     begin
--         apex_credential.set_persistent_token (
--             p_credential_static_id => 'OAuth Login',
--             p_token_type           => apex_credential.c_token_access,
--             p_token_value          => 'sdakjjkhw7632178jh12hs876e38..',
--             p_token_expires        => to_date('2023-10-31', 'YYYY-MM-DD') );
--     end;
--==============================================================================
procedure set_persistent_token(
    p_credential_static_id in varchar2,
    p_token_type           in t_token_type,
    p_token_value          in varchar2,
    p_token_expires        in date );

--==============================================================================
-- This procedure sets provided credential attributes persistently, beyond 
-- the current session. Already stored access, refresh or ID tokens for the 
-- provided credential will be removed.
--
-- Parameters:
-- * p_credential_static_id: Credential static ID.
-- * p_client_id:            Use Client ID for OAuth Credentials.
--                           Use User OCID for OCI Credentials.
-- * p_client_secret:        Use Client Secret for OAuth Credentials.
--                           Use Private Key for OCI Credentials.
-- * p_namespace:            Use the Tenancy OCID for OCI Credentials.
-- * p_fingerprint:          Use the Public Key Fingerprint for OCI Credentials.
--
-- Example:
-- Set credential attributes for `OAuth Login`.
--
--     begin
--         apex_credential.set_persistent_credentials (
--             p_credential_static_id => 'OAuth Login',
--             p_client_id            => 'dnkjq237o8832ndj98098-..',
--             p_client_secret        => '1278672tjksaGSDA789312..' );
--     end;
--
-- Example:
-- Set credential attributes for `OCI Login`. Use attributes as follows:
--
--     begin
--         apex_credential.set_persistent_credentials (
--             p_credential_static_id => 'OCI Login',
--             p_client_id            => 'ocid1.user.oc1...',
--             p_client_secret        => 'MIIEowIBAAKCAQEAsjhTVL...',
--             p_namespace            => 'ocid1.tenancy.oc1...',
--             p_fingerprint          => 'ff:ff:ee:00:...' );
--     end;
--==============================================================================
procedure set_persistent_credentials(
    p_credential_static_id  in varchar2,
    p_client_id             in varchar2,
    p_client_secret         in varchar2,
    p_namespace             in varchar2 default null,
    p_fingerprint           in varchar2 default null );

--==============================================================================
-- This procedure sets a list of URLs that can be used for this credential.
-- A credential can be used for a HTTP request if its target URL matches one
-- of the URLS in this list. Matching is done on a starts-with basis.
--
-- ### Usage Notes
-- For instance, if "https://www.oracle.com" and "https://apex.oracle.com/ords/" 
-- are set as the allowed URLs, then the credential can be used for the following
-- HTTP request examples:
--
-- * https://www.oracle.com/
-- * https://www.oracle.com/myrest/service
-- * https://apex.oracle.com/ords/secret/workspace
--
-- The credential cannot be used for the following request examples:
--
-- * https://web.oracle.com
-- * https://apex.oracle.com/apex/workspace
-- * http://www.oracle.com/
--
-- For security, the credential secret (Client Secret, Password, Private Key) 
-- must be passed in as well. If not passed, or passed as NULL, the secret
-- will be cleared.
--
-- Parameters:
-- * p_credential_static_id: Credential static ID.
-- * p_allowed_urls:         List of allowed URLs (as `APEX_T_VARCHAR2`) that these credentials can access.
-- * p_client_secret:        Client Secret - must be passed in to change allowed URLs.
--
-- Example:
-- Set allowed URLs for the credential `OAuth Login`.
--
--     begin
--         apex_credential.set_allowed_urls (
--             p_credential_static_id => 'OAuth Login',
--             p_allowed_urls         => apex_t_varchar2(
--                                          'https://tokenserver.mycompany.com/oauth2/token',
--                                          'https://www.oracle.com' ),
--             p_client_secret        => '1278672tjksaGSDA789312..' );
--     end;
--==============================================================================
procedure set_allowed_urls(
    p_credential_static_id  in varchar2,
    p_allowed_urls          in wwv_flow_t_varchar2,
    p_client_secret         in varchar2 );

--==============================================================================
-- This procedure sets username and password for the provided credential
-- persistently, beyond the current session. Typically used for `BASIC` 
-- authentication.
--
-- Parameters:
-- * p_credential_static_id: Credential static ID
-- * p_username:             Credential user name
-- * p_password:             Credential password
--
-- Example:
-- Set user name and password into credential `Login` persistently.
--
--
--     begin
--         apex_credential.set_persistent_credentials (
--             p_credential_static_id => 'Login',
--             p_username             => 'scott',
--             p_password             => 'tiger );
--     end;
--==============================================================================
procedure set_persistent_credentials(
    p_credential_static_id  in varchar2,
    p_username              in varchar2,
    p_password              in varchar2 );

--==============================================================================
-- This procedure sets provided credential attributes persistently, beyond
-- the current APEX session.
--
-- Parameter:
-- * p_credential_static_id: Credential static ID.
-- * p_key:                  Credential key (e.g. HTTP Header or Cookie name).
-- * p_value:                Credential value.
--
-- Example:
-- Set attributes into credential `my_API_key` persistently.
--
--     begin
--         apex_credential.set_persistent_credentials (
--             p_credential_static_id => 'my_API_key',
--             p_key                  => 'api_key',
--             p_value                => 'lsjkgjw4908902ru9fj879q367891hdaw' );
--     end;
--==============================================================================
procedure set_persistent_credentials(
    p_credential_static_id  in varchar2,
    p_key                   in varchar2,
    p_value                 in varchar2 );

--==============================================================================
-- This procedure creates a credential definition.
--
-- Parameters:
-- * p_credential_name:           Credential name.
-- * p_credential_static_id:      Credential static ID.
-- * p_authentication_type:       The authentication type. Supported types: 
--                                - apex_credential.c_type_basic 
--                                - apex_credential.c_type_oauth_client_cred
--                                - apex_credential.c_type_jwt 
--                                - apex_credential.c_type_oci
--                                - apex_credential.c_type_http_header 
--                                - apex_credential.c_type_http_query_string
-- * p_scope:                     OAuth 2.0 scope to use when making token requests.
-- * p_allowed_urls:              List of URLs (as `APEX_T_VARCHAR2`) that these credentials can access.
--
-- * p_db_credential_name:        Name of the database credential to be referenced.
-- * p_db_credential_is_instance: Whether the database credential was made available at the
--                                APEX instance level, i.e. to all workspaces. This parameter
--                                can only be used when instance credentials are enabled for
--                                the APEX instance using the INSTANCE_DBMS_CREDENTIAL_ENABLED
--                                instance parameter.
--
-- * p_prompt_on_install:         Choose whether prompts for this credential should be displayed when the application 
--                                is being imported on another Oracle APEX instance.
-- * p_credential_comment:        Credential comment.
--
-- Example:
-- Create a new Web Credential `OAuth Login`.
-- ```
-- begin
--     -- set the workspace
--     apex_util.set_workspace(p_workspace => 'MY_WORKSPACE');
--
--     apex_credential.create_credential (
--         p_credential_name       => 'OAuth Login',
--         p_credential_static_id  => 'OAUTH_LOGIN',
--         p_authentication_type   => apex_credential.c_type_oauth_client_cred,
--         p_scope                 => 'email',
--         p_allowed_urls          => apex_t_varchar2( 'https://tokenserver.mycompany.com/oauth2/token', 'https://www.oracle.com' ),
--         p_prompt_on_install     => false,
--         p_credential_comment    => 'Credential for OAuth Login' );
--
--      -- store client ID and client secret into the credential
--     apex_credential.set_persistent_credentials (
--         p_credential_static_id  => 'OAUTH_LOGIN',
--         p_client_id             => 'dnkjq237o8832ndj98098-..',
--         p_client_secret         => '1278672tjksaGSDA789312..' );
-- end;
-- ```
-- See also:
-- Data Types
--==============================================================================
procedure create_credential (
    p_credential_name           in varchar2,
    p_credential_static_id      in varchar2,
    p_authentication_type       in varchar2,
    p_scope                     in varchar2            default null,
    p_allowed_urls              in wwv_flow_t_varchar2 default null,
    p_prompt_on_install         in boolean             default false,
    p_credential_comment        in varchar2            default null,
    --
    p_db_credential_name        in varchar2            default null,
    p_db_credential_is_instance in boolean             default null );

--==============================================================================
-- This procedure drops a credential definition.
--
-- Parameters:
-- * p_credential_static_id:      The credential static ID.
--
-- Example:
-- Drop Web Credential with the static ID `OAUTH_LOGIN`.
--
--     begin
--         -- set the workspace
--         apex_util.set_workspace(p_workspace => 'MY_WORKSPACE'); 
--    
--         -- drop the credential
--         apex_credential.drop_credential (
--             p_credential_static_id => 'OAUTH_LOGIN' );
--     end;
--==============================================================================
procedure drop_credential (
    p_credential_static_id    in varchar2 );

--==============================================================================
-- This procedure updates Database Credential properties for a Web Credential.
-- If a Web Credential references a database credential, then it does not store
-- secrets itself - that is done by the database credential. See the documentation
-- for the DBMS_CREDENTIAL package for more information.
--
-- Existing Client IDs, Client Secrets, all tokens and the Valid For URL attribute
-- will be cleared. The procedure throws an error, if database credentials for HTTP
-- requests are not supported on this database, and the credential did not reference
-- a database credential before.
--
-- Parameters:
-- * p_credential_static_id:      The credential static ID.
-- * p_db_credential_name:        Name of the database credential to be referenced.
-- * p_db_credential_is_instance: Whether the database credential was made available at the
--                                APEX instance level, i.e. to all workspaces. This parameter
--                                can only be used when instance credentials are enabled for
--                                the APEX instance using the INSTANCE_DBMS_CREDENTIAL_ENABLED
--                                instance parameter.
--
-- Example:
-- Changes the referenced database credential to "USE_THIS_DB_CREDENTIAL"
--
--     begin
--         -- set the workspace
--         apex_util.set_workspace(p_workspace => 'MY_WORKSPACE'); 
--    
--         -- change the referenced database credential
--         apex_credential.set_database_credential (
--             p_credential_static_id => 'OAUTH_LOGIN',
--             p_db_credential_name   => 'USE_THIS_DB_CREDENTIAL' );
--     end;
--==============================================================================
procedure set_database_credential(
    p_credential_static_id      in varchar2,
    p_db_credential_name        in varchar2,
    p_db_credential_is_instance in boolean default false );

--==============================================================================
-- This procedure changes the "scope" attribute of a Web Credential. 
--
-- All existing tokens for the given credential will be cleared.
--
-- Parameters:
-- * p_credential_static_id: Credential static ID.
-- * p_scope:                New Scope value to store within the Web Credential.
--
-- Example:
-- Set allowed URLs for the credential `OAuth_Login`.
--
--     begin
--         apex_credential.set_scope (
--             p_credential_static_id => 'OAuth_Login',
--             p_scope                => 'new-scope-value' );
--     end;
--==============================================================================
procedure set_scope(
    p_credential_static_id      in varchar2,
    p_scope                     in varchar2 );

end wwv_flow_credential_api;
/
sho err

set define '^'
