set define off verify off
prompt ...wwv_flow_credential.sql
create or replace package wwv_flow_credential authid definer
------------------------------------------------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_credential.sql
--
--    DESCRIPTION
--      Secure Credential Store for Web Service Consumption, Remote SQL Data Access
--      and Social Login.
--      Runtime package - MUST NOT be publicly exposed. This is the only package which decrypts and returns stored
--      credentials in clear text. This package is only supposed to be called by APEX components.
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    03/29/2017 - Created
--    ascheffe    02/22/2024 - changed encrypt_value to a procedure
--
------------------------------------------------------------------------------------------------------------------------

is

--==============================================================================
-- checks whether the current database session is allows to make
-- changes to web credentials.
--
-- Example:
--   check whether changes to the credential store can be made.
--
--   begin
--       wwv_flow_credential.check_api_usage_allowed;
--       -- we can continue when the procedure returns without errors
--   exception
--       when others then
--           -- we are not allowed to make changes to the credential store
--   end;
--==============================================================================
procedure check_api_usage_allowed;

--==============================================================================
-- Checks all schemas assigned to the current workspace and returns the first
-- schema which can access (and use) the given DBMS_CREDENTIAL name
--
-- Parameters:
-- * p_db_credential_name:         DBMS_CREDENTIAL to find a schema for.
-- * p_db_credential_is_instance:  Whether to validate the an instance credential
--
-- Returns:
-- The first schema (from the schemas assigned to the workspace) which can access
-- the given credential.
--==============================================================================
function find_schema_for_db_credential(
    p_db_credential_name        in varchar2,
    p_db_credential_is_instance in boolean default false )
    return varchar2;

--==============================================================================
-- converts wwv_flow_credential_api.t_token_type values to VARCHAR2 values stored in the table.
--
-- Parameters:
-- * p_token_type:  the numeric token type value of wwv_flow_credential_api.t_token_type
--
-- Returns:
--   the string representation which is stored in the WWV_FLOW_CREDENTIAL_INSTANCES table
--
-- Example:
--   Look up the string representation for wwv_flow_credential_api.c_token_access;
--
--   declare
--       l_token_type_string varchar2(255);
--   begin
--       l_token_type := wwv_flow_credential.get_token_type_string(
--                           wwv_flow_credential_api.c_token_access );
--   end;
--==============================================================================
function get_token_type_string(
    p_token_type in wwv_flow_credential_api.t_token_type )
    return varchar2;

--==============================================================================
-- converts wwv_flow_credential_api.t_token_type values to VARCHAR2 values stored in the table.
--
-- Parameters:
-- * p_token_type_string: the string representation which is stored in the WWV_FLOW_CREDENTIAL_INSTANCES table
--
-- Returns:
--   the numeric token type value of wwv_flow_credential_api.t_token_type
--
-- Example:
--   Look up the numeric token type value for 'ACCESS'.
--
--   declare
--       l_token_type_string wwv_flow_credential_api.t_token_type;
--   begin
--       l_token_type := wwv_flow_credential.get_token_type( 'ACCESS' );
--   end;
--==============================================================================
function get_token_type(
    p_token_type_string in varchar2 )
    return wwv_flow_credential_api.t_token_type;

--==============================================================================
-- Looks up web credential ID by name.
--
-- Parameters
-- * p_credential_name:      The credential name.
-- * p_credential_static_id: The credential static_id.
--
-- Returns:
--   the internal ID (primary key) of the credential store
--
-- Example:
--   Look up ID of credential store "Login" in Application 100
--
--   declare
--      l_cred_store_id number;
---  begin
--      l_cred_store_id := wwv_flow_credential.get_credential_id (
--           p_credential_name => 'Login' );
--   end;
--==============================================================================
function get_credential_id(
    p_credential_name      in varchar2 )
    return number;

--==============================================================================
function get_credential_id(
    p_credential_static_id in varchar2,
    p_security_group_id    in number default wwv_flow_security.g_security_group_id )
    return number;

--==============================================================================
-- encrypts a value; is typically being called before storing the credentials into the WWV_FLOW_CREDENTIALS table.
-- Application-level credentials are encrypted with the instance key; salted with the application ID
-- Session-level credentials are encrypted with the session crypto salt to be as secure as possible.
--
-- Parameters:
-- * p_value:               Clear text value to be encrypted.
-- * p_encrypted_value      The encrypted value
-- * p_encryption_details   Details of the encryption, algorithm version, IV or Tag
-- * p_session_id:          Session ID. When set then the value is encrypted
--                          with the session crypto salt, default is NULL.
-- * p_security_group_id:   The workspace ID.
-- * p_authentication_type: The credential's authentication type. This is used
--                          to pre-process the given value in case of OCI.
--
-- Example:
--   encrypt a value to only be encrypted within the same session
--
--   declare
--       l_encrypted varchar2(255);
---  begin
--       l_encrypted := wwv_flow_credential.encrypt_value (
--           p_value           => 'This is so secure!',
--           p_session_id      => wwv_flow_security.g_instance );
--   end;
--==============================================================================
procedure encrypt_value (
    p_value                in  varchar2,
    p_encrypted_value      out varchar2,
    p_encryption_details   out varchar2,
    p_session_id           in  number                                   default null,
    p_security_group_id    in  number                                   default wwv_flow_security.g_security_group_id,
    p_authentication_type  in  wwv_credentials.authentication_type%type default null );

--==============================================================================
-- returns credential information in clear text; only to be executed by
-- the APEX engine in order to use the credentials for e.g. invoking a REST
-- service.
--
-- Parameters:
-- * p_credential_id:   The credential ID
--
-- Returns:
--   credential information (Client ID, Client Secret and Authentication Type) in clear text
--
-- Example:
--   retrieve Client ID and Client Secret for credential "Login" in clear text.
--
--   declare
--       l_credential wwv_flow_credential_api.t_credential;
--   begin
--       l_credential := wwv_flow_credential.get_credential (
--           p_credential_id   => wwv_flow_credential.get_credential_id( 'Login' ) );
--
--       sys.dbms_output.put_line( 'Client ID:     ' || l_credential.client_id );
--       sys.dbms_output.put_line( 'Client Secret: ' || l_credential.client_secret );
--   end;
--==============================================================================
function get_credential (
    p_credential_id               in number,
    p_include_secret              in boolean  default true,
    p_security_group_id           in number   default wwv_flow_security.g_security_group_id,
    --
    p_for_url                     in varchar2 default null,
    p_for_token_url               in varchar2 default null,
    --
    p_client_id_for_db_credential in boolean  default false )
    return wwv_flow_credential_api.t_credential;

--==============================================================================
-- returns OAuth2 tokens stored in a credential store in clear text; only to be executed by the APEX engine
-- in order to use for e.g. invoking a REST service.
-- When Client ID and Client Secret have been set at session level using the WWV_FLOW_CREDENTIAL_API package,
-- only session-level tokens are being returned. Application-level tokens are only returned when Client ID
-- and Client Secret are *not* set at the session level.
--
-- Parameters:
-- * p_credential_id:   The credential ID
--
-- Returns:
--   list of tokens (wwv_flow_credential_api.t_tokens type)
--
-- Example:
--   retrieve OAuth tokens for credential "Login" in clear text.
--
--   declare
--       l_tokens wwv_flow_credential_api.t_tokens;
--   begin
--       l_tokens := wwv_flow_credential.get_tokens (
--           p_credential_id   => get_credential_id( 'Login' ) );
--
--       for i in 1 .. l_tokens.count loop
--          sys.dbms_output.put_line( 'Token Type:  ' || l_tokens( i ).value_type );
--          sys.dbms_output.put_line( 'Token Value: ' || l_tokens( i ).value );
--          sys.dbms_output.put_line( 'Expiry:      ' || l_tokens( i ).expiry_date );
--       end loop;
--   end;
--==============================================================================
function get_tokens(
    p_credential_id   in number )
    return wwv_flow_credential_api.t_tokens;

--==============================================================================
-- Set Client ID and Client Secret for a given credential.
--
-- Parameters:
-- * p_credential_id:   The credential ID.
-- * p_client_id:       OAuth2 Client ID
-- * p_client_secret:   OAuth2 Client Secret
-- * p_namespace:       OCI namespace (tenant-ocid)
-- * p_fingerprint:     OCI fingerprint
--
-- Example:
--   Set credential "OAuth Login" for application 100.
--
--   begin
--       wwv_flow_credential.set_application_credentials (
--           p_credential_id   => get_credential_id( 'OAuth Login' ),
--           p_client_id       => 'dnkjq237o8832ndj98098-..',
--           p_client_secret   => '1278672tjksaGSDA789312..' );
--   end;
--==============================================================================
procedure set_workspace_credentials(
    p_credential_id   in number,
    p_client_id       in varchar2,
    p_client_secret   in varchar2,
    p_namespace       in varchar2 default null,
    p_fingerprint     in varchar2 default null );

--==============================================================================
-- Sets the "allowed URLs" attribute for a credential.
--
-- Parameters:
-- * p_credential_id:   The credential ID.
-- * p_allowed_urls:    list of URLs (as WWV_FLOW_T_VARCHAR2) for which this credential can be used for.
-- * p_client_secret:   Client Secret (needs to be provided again, if allowed URLs are changed)
--
-- Example:
--   Set credential "OAuth Login" for application 100.
--
--   begin
--       wwv_flow_credential.set_allowed_urls (
--           p_credential_id   => get_credential_id( 'OAuth Login' ),
--           p_allowed_urls    => wwv_flow_t_varchar2( 'https://tokenserver.mycompany.com/oauth2/token', 'https://www.oracle.com' ),
--           p_client_secret   => '1278672tjksaGSDA789312..' );
--   end;
--==============================================================================
procedure set_allowed_urls(
    p_credential_id   in number,
    p_allowed_urls    in wwv_flow_t_varchar2,
    p_client_secret   in varchar2 );

--==============================================================================
-- Set Client ID and Client Secret for a given credential for the current session.
--
-- Parameters:
-- * p_credential_id:   The credential ID
-- * p_client_id:       OAuth2 Client ID
-- * p_client_secret:   OAuth2 Client Secret
-- * p_namespace:       OCI namespace (tenant-ocid)
-- * p_fingerprint:     OCI fingerprint
--
-- Example:
--   Set credential "OAuth Login".
--
--   begin
--       wwv_flow_credential.set_session_credentials (
--           p_credential_id   => get_credential_id( 'OAuth Login' ),
--           p_client_id       => 'dnkjq237o8832ndj98098-..',
--           p_client_secret   => '1278672tjksaGSDA789312..' );
--   end;
--==============================================================================
procedure set_session_credentials(
    p_credential_id   in number,
    p_client_id       in varchar2,
    p_client_secret   in varchar2,
    p_namespace       in varchar2 default null,
    p_fingerprint     in varchar2 default null );

--==============================================================================
-- clones session credentials from the old to the new session. Called from
-- wwv_flow_session.clone
--
-- Parameters:
-- * p_old_session_id:  session ID to clone credentials from
-- * p_new_session_id:  session ID to clone credentials to
--==============================================================================
procedure clone_session_credentials(
    p_old_session_id    in number,
    p_new_session_id    in number );

--==============================================================================
-- stores a token into a credential store at session level. The token will only
-- be usable in the current APEX session, regardless of its expiration date.
--
-- Parameters:
-- * p_credential_id:   The credential ID.
-- * p_token_type:      The token type: wwv_flow_credential_api.C_TOKEN_ACCESS,
--                                      wwv_flow_credential_api.C_TOKEN_REFRESH
--                                      wwv_flow_credential_api.C_TOKEN_ID
-- * p_token_value:     The value of the token
-- * p_token_expiry:    Expiry date of the token
--
-- Example:
--   Store OAuth2 access token with value "sdakjjkhw7632178jh12hs876e38.." and
--   expiry date of 2017-10-31 into credential "OAuth Login'.
--
--   begin
--       wwv_flow_credential.set_session_token (
--           p_credential_id   => get_credential_id( 'OAuth Login' ),
--           p_token_type      => apex_credential.C_TOKEN_ACCESS,
--           p_token_value     => 'sdakjjkhw7632178jh12hs876e38..',
--           p_token_expiry    => to_date('2017-10-31', 'YYYY-MM-DD') );
--   end;
--==============================================================================
procedure set_session_token(
    p_credential_id   in number,
    p_token_type      in wwv_flow_credential_api.t_token_type,
    p_token_value     in varchar2,
    p_token_expires   in date );

--==============================================================================
-- stores a token into a credential store at application level. The token will
-- be usable until its expiration date has been reached, for all sessions and
-- users of the application.
--
-- Parameters:
-- * p_credential_id:   The credential ID.
-- * p_token_type:      The token type: wwv_flow_credential_api.C_TOKEN_ACCESS,
--                                      wwv_flow_credential_api.C_TOKEN_REFRESH
--                                      wwv_flow_credential_api.C_TOKEN_ID
-- * p_token_value:     The value of the token
-- * p_token_expiry:    Expiry date of the token
--
-- Example:
--   Store OAuth2 access token with value "sdakjjkhw7632178jh12hs876e38.." and
--   expiry date of 2017-10-31 into credential "OAuth Login'.
--
--   begin
--       wwv_flow_credential.set_application_token (
--           p_credential_id   => get_credential_id( 'OAuth Login' ),
--           p_token_type      => apex_credential.C_TOKEN_ACCESS,
--           p_token_value     => 'sdakjjkhw7632178jh12hs876e38..',
--           p_token_expiry    => to_date('2017-10-31', 'YYYY-MM-DD') );
--   end;
--==============================================================================
procedure set_workspace_token(
    p_credential_id   in number,
    p_token_type      in wwv_flow_credential_api.t_token_type,
    p_token_value     in varchar2,
    p_token_expires   in date );


--==============================================================================
-- stores a token into a credential store. The token is stored at session level,
-- when there is Client ID at session level and at application level, when there
-- is not. The token will be usable until its expiration date has been reached.
--
-- Parameters:
-- * p_credential_id:   The credential ID.
-- * p_token_type:      The token type: wwv_flow_credential_api.C_TOKEN_ACCESS,
--                                      wwv_flow_credential_api.C_TOKEN_REFRESH
--                                      wwv_flow_credential_api.C_TOKEN_ID
-- * p_token_value:     The value of the token
-- * p_token_expiry:    Expiry date of the token
--
-- Example:
--   Store OAuth2 access token with value "sdakjjkhw7632178jh12hs876e38.." and
--   expiry date of 2017-10-31 into credential "OAuth Login'.
--
--   begin
--       wwv_flow_credential.set_token (
--           p_credential_id   => get_credential_id( 'OAuth Login' ),
--           p_token_type      => apex_credential.C_TOKEN_ACCESS,
--           p_token_value     => 'sdakjjkhw7632178jh12hs876e38..',
--           p_token_expiry    => to_date('2017-10-31', 'YYYY-MM-DD') );
--   end;
--==============================================================================
procedure set_token(
    p_credential_id      in number,
    p_token_type         in wwv_flow_credential_api.t_token_type,
    p_token_value        in varchar2,
    p_token_expires      in date );

--==============================================================================
-- Clears all set or aquired tokens for a given credential.
--
-- Parameters:
-- * p_credential_id:   The credential ID.
-- * p_session_id:      If set, only session-level tokens will be deleted, defaults to null.
-- * p_token_type:      If set, only tokens of that type will be deleted, defautts to null.
--
-- Example:
--   Clear all tokens for the credential "Login"
--
--   begin
--       wwv_flow_credential.delete_tokens (
--           p_credential_id   => get_credential_id( 'OAuth Login' ),
--           p_token_type      => wwv_flow_credential_api.C_TOKEN_ACCESS );
--   end;
--==============================================================================
procedure delete_tokens(
    p_credential_id   in number,
    p_session_id      in number                               default null,
    p_token_type      in wwv_flow_credential_api.t_token_type default null );

--==============================================================================
-- Create a web credential
--
-- Parameters:
-- * p_credential_name:         The name for the credentials. This name must be unique within the workspace.
-- * p_credential_static_id:    The static ID to reference the credential in API calls.
-- * p_authentication_type:     Specify the authentication type. Supported are the following authentication types:
--                              c_type_basic, c_type_oauth_client_cred, c_type_jwt, c_type_oci, c_type_http_header, c_type_http_query_string
-- * p_scope:                   The scope parameter allows the application to express the desired OAuth 2.0 scope of the access request.
-- * p_allowed_urls:            If set, Oracle APEX will check whether the URL, for which the credential is being used at run time,
--                              matches one of the URLs within this list. If the URL does not match, Oracle APEX will raise an error.
-- * p_prompt_on_install:       Choose whether prompts for this credential should be displayed when the application is being imported
--                              on another Oracle APEX instance.
-- * p_credential_comment:      Enter any comments or notes here.
--
-- Example:
--   Creates a web credential "OAuth Login"
--
--   begin
--       wwv_flow_credential.create_credential (
--           p_credential_name       => 'OAuth Login',
--           p_credential_static_id  => 'OAUTH_LOGIN',
--           p_authentication_type   => wwv_flow_credential_api.c_type_oauth_client_cred,
--           p_scope                 => 'email',
--           p_allowed_urls          => wwv_flow_t_varchar2( 'https://tokenserver.mycompany.com/oauth2/token', 'https://www.oracle.com' ),
--           p_prompt_on_install     => false,
--           p_credential_comment    => 'Credential for OAuth Login' );
--
--      -- should be followed by set_workspace_credentials
--      wwv_flow_credential.set_workspace_credentials (
--          p_credential_id   => wwv_flow_credential.get_credential_id( p_credential_static_id => 'OAUTH_LOGIN' ),
--          p_client_id       => 'dnkjq237o8832ndj98098-..',
--          p_client_secret   => ''1278672tjksaGSDA789312..'' );
--   end;
--==============================================================================
procedure create_credential (
    p_credential_name           in varchar2,
    p_credential_static_id      in varchar2,
    p_authentication_type       in varchar2,
    p_scope                     in varchar2            default null,
    p_allowed_urls              in wwv_flow_t_varchar2 default null,
    p_db_credential_name        in varchar2            default null,
    p_db_credential_is_instance in boolean             default null,
    p_prompt_on_install         in boolean             default false,
    p_credential_comment        in varchar2            default null );

--==============================================================================
-- Drops a web credential
--
-- Parameters:
-- * p_credential_static_id:    The static ID to reference the credential in API calls.
--
-- Example:
--   Drops the "OAuth Login" web credential
--
--   begin
--       wwv_flow_credential.drop_credential (
--           p_credential_static_id => 'OAUTH_LOGIN );
--   end;
--==============================================================================
procedure drop_credential (
    p_credential_static_id    in varchar2 );

--==============================================================================
-- Sanitize credential URLs
--
-- Parameters:
-- * p_urls:    The URLs to sanitize.
--
-- Example:
--   select wwv_flow_credential.sanitize_urls ('
--
--
--      ldap://localhost:389/
--
--         ldaps://localhost:1234/
--
--       test
--
--     http://localhost:8080/test/api/
--
--       https://localhost:8433/test/api/
--
--
--                   ') from sys.dual;
--==============================================================================
function sanitize_urls (
    p_urls in varchar2 )
    return varchar2;

--==============================================================================
-- Assert credential URLs are valid. Throws an error, if URLs are not starting
-- with http(s) or ldap(s).
--
-- Parameters:
-- * p_allowed_urls:    The URLs to check.
--
-- Example:
--   begin
--       wwv_flow_credential.assert_urls_valid (
--           p_allowed_urls => wwv_flow_string.split (
--                                 p_str => :your_string,
--                                 p_sep => :your_delimiter) );
--   end;
--==============================================================================
procedure assert_urls_valid (
    p_allowed_urls in wwv_flow_t_varchar2 );

--==============================================================================
-- Regenerate existing key pair credentials based on a credential ID.
--
-- Parameters:
-- * p_credential_id: The credential ID.
--
-- Example:
--   Regenerate existing key pair credentials for credentials ID 123
--
--   begin
--       wwv_flow_credential.generate_key_pair_credentials (
--           p_credential_id => 123 );
--   end;
--==============================================================================
procedure generate_key_pair_credentials (
    p_credential_id in number );

--==============================================================================
-- Regenerate existing key pair credentials based on a static ID.
--
-- Parameters:
-- * p_credential_static_id: The credential static ID.
--
-- Example:
--   Regenerate existing key pair credentials for
--   static ID 'APP_100_PUSH_NOTIFICATIONS_CREDENTIALS'
--
--   begin
--       wwv_flow_credential.generate_key_pair_credentials (
--           p_credential_static_id => 'APP_100_PUSH_NOTIFICATIONS_CREDENTIALS' );
--   end;
--==============================================================================
procedure generate_key_pair_credentials (
    p_credential_static_id in varchar2 );

--==============================================================================
-- Create new key pair credentials.
--
-- Parameters:
-- * p_credential_name: The name of the credential to create.
--
-- Example:
--   Create new key pair credentials named 'App 100 Push Notifications Credentials'
--
--   begin
--       wwv_flow_credential.create_key_pair_credential (
--           p_application_id => 'App 100 Push Notifications Credentials' );
--   end;
--==============================================================================
procedure create_key_pair_credential (
    p_credential_name in varchar2 );

--=============================================================================
-- Creates a new DBMS_CLOUD OCI API Key credential. The procedure
-- creates a credential in DBMS_CLOUD using DBMS_CLOUD.CREATE_CREDENTIAL.
--
-- PARAMETERS:
-- * p_credential_static_id: The credential static ID.
--
--=============================================================================
procedure create_cloud_credential(
    p_credential_static_id  in varchar2 );

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
-- * p_credential_id:             The credential ID.
-- * p_db_credential_name:        Name of the database credential to be referenced.
-- * p_db_credential_is_instance: Whether the database credential was made available at the
--                                APEX instance level, i.e. to all workspaces.
--
-- Example:
-- Changes the referenced database credential to "USE_THIS_DB_CREDENTIAL"
--
--     begin
--         -- set the workspace
--         apex_util.set_workspace(p_workspace => 'MY_WORKSPACE');
--
--         -- drop the credential
--         wwv_flow_credential.set_database_credential (
--             p_credential_id      => wwv_flow_credential.get_credential_id( 'OAuth_Login' ),
--             p_db_credential_name => 'USE_THIS_DB_CREDENTIAL' );
--     end;
--==============================================================================
procedure set_database_credential(
    p_credential_id             in number,
    p_db_credential_name        in varchar2,
    p_db_credential_is_instance in boolean default false );

--==============================================================================
-- This procedure changes the "scope" attribute of a Web Credential.
--
-- All existing tokens for the given credential will be cleared.
--
-- Parameters:
-- * p_credential_id:        The credential ID.
-- * p_scope:                New Scope value to store within the Web Credential.
--
-- Example:
-- Set scope for the credential `OAuth_Login`.
--
--     begin
--         wwv_flow_credential.set_scope (
--             p_credential_id => wwv_flow_credential.get_credential_id( 'OAuth_Login' ),
--             p_scope         => 'new-scope-value' );
--     end;
--==============================================================================
procedure set_scope(
    p_credential_id in number,
    p_scope         in varchar2 );

end wwv_flow_credential;
/
sho err

set define '^'

