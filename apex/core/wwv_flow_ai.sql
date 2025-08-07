set define off verify off
prompt ...wwv_flow_ai
create or replace package wwv_flow_ai as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates
--
--    NAME
--      wwv_flow_ai.sql
--
--    DESCRIPTION
--      APEX Generative AI backend functionality.
--
--    SECURITY
--
--    NOTES:
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      ralmuell  01/19/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- Types
--==============================================================================
subtype t_provider is wwv_remote_servers.ai_provider_type%type;

type t_server is record (
    id                      number,
    name                    wwv_remote_servers.name%type,
    static_id               wwv_remote_servers.static_id%type,
    base_url                wwv_remote_servers.base_url%type,
    --
    credential_id           wwv_remote_servers.credential_id%type,
    --
    ai_provider_type        wwv_remote_servers.ai_provider_type%type,
    ai_is_builder_service   wwv_remote_servers.ai_is_builder_service%type,
    ai_model_name           wwv_remote_servers.ai_model_name%type,
    ai_attributes           wwv_remote_servers.ai_attributes%type,
    ai_http_headers         wwv_remote_servers.ai_http_headers%type,
    --
    embedding_type          wwv_remote_servers.embedding_type%type,
    emb_local_model_owner   wwv_remote_servers.emb_local_model_owner%type,
    emb_local_model_name    wwv_remote_servers.emb_local_model_name%type,
    emb_function            wwv_remote_servers.emb_function%type,
    --
    workspace_id            wwv_remote_servers.security_group_id%type );

type t_rag_source is record (
    name                    wwv_flow_ai_config_rag_sources.name%type,
    description             wwv_flow_ai_config_rag_sources.description%type,
    rag_type                wwv_flow_ai_config_rag_sources.rag_type%type,
    source                  wwv_flow_ai_config_rag_sources.source%type,
    function_body_language  wwv_flow_ai_config_rag_sources.function_body_language%type,
    max_tokens              wwv_flow_ai_config_rag_sources.max_tokens%type,
    --
    condition_type          wwv_flow_ai_config_rag_sources.condition_type%type,
    condition_expr1         wwv_flow_ai_config_rag_sources.condition_expr1%type,
    condition_expr2         wwv_flow_ai_config_rag_sources.condition_expr2%type,
    authorization_scheme    wwv_flow_ai_config_rag_sources.authorization_scheme%type,
    build_option_id         wwv_flow_ai_config_rag_sources.build_option_id%type );

type t_rag_sources is table of t_rag_source index by pls_integer;

type t_config is record (
    server          t_server,
    --
    system_prompt   wwv_flow_ai_configs.system_prompt%type,
    welcome_message wwv_flow_ai_configs.welcome_message%type,
    temperature     wwv_flow_ai_configs.temperature%type,
    --
    rag_sources     t_rag_sources );

type t_response is record (
    id                       varchar2(4000),
    http_status_code         number,
    text                     clob,
    total_tokens             number );

--==============================================================================
-- Constants
--==============================================================================
c_provider_openai             constant    t_provider   := 'OPENAI';
c_provider_cohere             constant    t_provider   := 'COHERE';
c_provider_ocigenai           constant    t_provider   := 'OCI_GENAI';
c_provider_rest               constant    t_provider   := 'REST';

c_ocigenai_model_cohere_pre   constant    varchar2(32) := 'cohere.';
c_ocigenai_model_cohere       constant    varchar2(32) := 'cohere.command-r-16k';
c_openai_model_gpt4o          constant    varchar2(32) := 'gpt-4o';

c_server_type_ai              constant    wwv_remote_servers.server_type%type := 'GENERATIVE_AI';
c_server_type_vector          constant    wwv_remote_servers.server_type%type := 'VECTOR';

--==============================================================================
-- Gets the details of the server based either on the id or the static id.
-- Either p_id or p_static_id must be provided
--
-- Parameters:
-- * p_id               The AI service numeric id
-- * p_static_id        The AI service static id
--
-- Returns:
-- * The Remote Server
--==============================================================================
function get_server (
    p_id        in number   default null,
    p_static_id in varchar2 default null )
    return t_server;

--==============================================================================
-- Are Generative AI features enabled for the current APEX Workspace
--
-- Parameters:
-- * p_app_builder_service_required    Defines whether there must be an AI service
--                                     marked as "Used by APEX Builder"
--
-- Returns:
-- * true if Generative AI features are enabled for the current workspace,
--   false otherwise
--==============================================================================
function is_enabled ( p_app_builder_service_required in boolean default true )
return boolean;

--==============================================================================
-- Chat with a Generative AI service given a prompt and potential earlier
-- responses.
--
-- Parameters:
-- * p_prompt                The user prompt
-- * p_system_prompt         A (optional) system prompt to pass. Some Generative AI
--                           services (like OpenAI) support the use of passing a system
--                           prompt to set the context of a conversation
-- * p_service_id            The Generative AI Service ID
--                           If not provided, the app's default AI Service will be used.
-- * p_temperature           The temperature to use. How the temperature is interpreted depends
--                           on the Generative AI Serviice implementation. Higher temperatures
--                           result in more 'creative' responses.
-- * p_messages              The (optional) responses from an earlier conversation.
--                           Responses of procedure chat and nl2sql will be automatically
--                           added to p_responses for an easy conversational experience.
-- * p_application_id        The application ID, default is current application ID
--                           The application ID is used to set the proxy for the Application
--                           and to query application specific objects for prompt augmentation.
--
-- Returns:
-- * The response for the given prompt and type
--==============================================================================
function chat (
    p_config    in              t_config,
    p_prompt    in              clob,
    p_messages  in out nocopy   wwv_flow_ai_api.t_chat_messages )
    return clob;

--==============================================================================
-- Returns the AI consent message for the current application
--==============================================================================
function get_consent_message
return clob;

$IF wwv_flow_db_version.c_has_vector_type $THEN
--==============================================================================
-- Get a vector representation of a given value.
--
-- Parameters:
-- * p_value                 The input text
-- * p_service_id            The Vector Provider ID.
-- * p_current_user          The name of the database user whose privileges are currently active.
--
-- Example:
-- Returns a vector corresponding to the provided user search string, which
-- can subsequently be utilized to query a vector type column within a table.
-- ~~~
-- declare
--     l_search_vector vector;
-- begin
--     l_search_vector := apex_ai.get_vector_embeddings (
--         p_value             => 'Two story house in Florida with 4 windows and a red roof'
--         p_service_id        => 1234 );
-- end;
--
-- If running from SQLcl, we need to set the environment
-- for the Oracle APEX workspace associated with this schema.
-- The call to apex_util.set_workspace is not necessary
-- if you're running within the context of the App Builder
-- or an APEX application.
--
-- apex_util.set_workspace( 'MY_WORKSPACE' );
--
-- ~~~
--==============================================================================
function get_vector_embeddings (
    p_value         in clob,
    p_service_id    in number,
    p_current_user  in varchar2 default null )
    return vector;

function get_vector_embeddings (
    p_value             in clob,
    p_local_llm_owner   in varchar2,
    p_local_llm_name    in varchar2,
    p_current_user      in varchar2 default null )
    return vector;

function get_vector_embeddings (
    p_value         in clob,
    p_function_name in varchar2,
    p_current_user  in varchar2 default null )
    return vector;
$END

--==============================================================================
-- Generate a response for a given prompt.
--
-- Parameters:
-- * p_prompt                The user prompt
-- * p_system_prompt         The (optional) System prompt
-- * p_service_id            The Generative AI Service static ID.
--                           If not provided, the app's default AI Service will be used.
-- * p_temperature           The temperature to use. How the temperature is interpreted depends
--                           on the Generative AI Service implementation. Higher temperatures
--                           result in more 'creative' responses. See the documentation of the
--                           Generative AI provider for details and allowed values.
--
-- Returns:
-- * The response for the given prompt and type
--
-- Example:
-- Generate a response with the configured Generative AI Service 'MY_AI_SERVICE' for
-- the given prompt
-- ~~~
-- declare
--   l_response clob;
-- begin
--   l_response := apex_ai.generate(
--     p_prompt            => 'What is Oracle APEX',
--     p_service_id        => 'MY_AI_SERVICE');
-- end;
-- ~~~
--==============================================================================
function generate (
    p_config    in t_config,
    p_prompt    in clob )
    return clob;

--==============================================================================
-- See wwv_flow_ai_api.is_user_consent_needed
--==============================================================================
function is_user_consent_needed (
    p_user_name         in  varchar2    default wwv_flow_security.g_user,
    p_application_id    in  number      default wwv_flow_security.g_flow_id )
    return boolean;

--==============================================================================
-- See wwv_flow_ai_api.set_user_consent
--==============================================================================
procedure set_user_consent (
    p_user_name         in  varchar2,
    p_application_id    in  number );

--==============================================================================
-- See wwv_flow_ai_api.revoke_user_consent
--==============================================================================
procedure revoke_user_consent (
    p_user_name         in  varchar2,
    p_application_id    in  number );

--==============================================================================
-- See wwv_flow_ai_api.revoke_user_consent_for_all
--==============================================================================
procedure revoke_user_consent_for_all (
    p_application_id    in  number );

--==============================================================================
procedure set_g_remote_server_id (
    p_remote_server_id  in  number );

--==============================================================================
-- Helper function to generate the t_config record type.
--
-- Internal IDs should be provided when called internally.
-- Static IDs should be provided when called by public packages.
--
-- If a config ID or Static ID is provided,
--  we read the config's metadata to populate the t_config.
--  This includes RAG sources.
--  All other parameters are ignored.
--
-- If no config ID nor Static ID is provided,
--  we create a slim, ad-hoc config based on
--  the provided system_prompt, welcome_message and temperature.
--  There will be no RAG sources or any config-specific settings.
--
-- Calling this function without any parameters resolves in an empty config,
--  its server falling back to the app's default.
--==============================================================================
function make_t_config (
    p_config_id                 in number   default null,
    p_config_static_id          in varchar2 default null,
    --
    p_remote_server             in t_server default null,
    p_remote_server_id          in number   default null,
    p_remote_server_static_id   in varchar2 default null,
    p_system_prompt             in varchar2 default null,
    p_welcome_message           in varchar2 default null,
    p_temperature               in number   default null )
    return t_config;

--==============================================================================
-- handles component ajax requests
--==============================================================================
procedure ajax_component (
    p_plugin_ai     in wwv_flow_plugin_api.t_ai,
    p_plugin_name   in varchar2                     default null );

--==============================================================================
-- handles global ajax requests
--==============================================================================
procedure ajax_global;

--==============================================================================
-- emits the javascript dependencies of AI-enabled components
--==============================================================================
procedure emit_javascript_files;

--==============================================================================
--Test Generative AI Service connection.
--
-- Parameters:
-- * p_name:                 The name of the Generative AI Service
-- * p_static_id:            Generative AI Service static ID
-- * p_base_url:             Base URL of the service
-- * p_credential_id:        Credential ID for the service. null if new credential must be created
-- * p_ai_provider_type:     The AI provider type: OPENAI, COHERE, OCI_GENAI
-- * p_ai_model_name:        Optional AI model name
-- * p_ai_http_headers:      Optional HTTP Headers in the form key=value
-- * p_ai_attributes:        Optional attributes in the form of JSON
-- * p_new_api_key:          API key for the new credential
-- * p_new_oci_userid:       OCI User ID for the new credential
-- * p_new_oci_tenancyid:    OCI Tenancy ID for the new credential
-- * p_new_oci_privatekey:   OCI private key for the new credential
-- * p_new_oci_fingerprint:  OCI fingerprint for the new credential
-- * p_server_type:          Gen AI or Vector server types.
--
-- Example:
--
-- ~~~
-- begin
--   l_conn_status_msg := wwv_flow_ai.get_connection_status(
--       p_name                  => 'My AI',
--       p_static_id             => 'MY_AI',
--       p_base_url              => 'https://api.openai.com/v1',
--       p_credential_id         => 5678,
--       p_ai_provider_type      => 'OPENAI' );
-- end;
-- ~~~
--==============================================================================
function get_connection_status (
    p_name                   in varchar2,
    p_static_id              in varchar2,
    p_base_url               in varchar2,
    p_credential_id          in number    default null,
    p_ai_provider_type       in varchar2,
    p_ai_model_name          in varchar2  default null,
    p_ai_http_headers        in clob      default null,
    p_ai_attributes          in clob      default null,
    p_new_api_key            in varchar2  default null,
    p_new_oci_userid         in varchar2  default null,
    p_new_oci_tenancyid      in varchar2  default null,
    p_new_oci_privatekey     in varchar2  default null,
    p_new_oci_fingerprint    in varchar2  default null,
    p_server_type            in varchar2  default c_server_type_ai )
return t_response;

--==============================================================================
-- Get the APEX System Prompt
--==============================================================================
function get_system_prompt (
    p_prompt                 in varchar2,
    p_prompt_type            in wwv_flow_ai_api.t_prompt_type default wwv_flow_ai_api.c_prompt_sql_query,
    p_language               in varchar2                      default null )
return clob;

end wwv_flow_ai;
/
show err
set define '^'
