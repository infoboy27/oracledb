set define off verify off
prompt ...wwv_flow_ai_dev
create or replace package wwv_flow_ai_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_ai_dev.sql
--
--    DESCRIPTION
--      APEX Generative AI App Builder API.
--
--    SECURITY
--
--    NOTES:
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      ralmuell  12/04/2023 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Constants
--==============================================================================

-- Some default values for find_table_names function
c_default_fuzziness_level    constant  number         := 50;
c_default_max_tables         constant  number         := 20;

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- API's called by execute immediate from APEX Runtime
--==============================================================================

--==============================================================================
-- Build a prompt for NL2SQL from a user provided prompt
--
-- Parameters:
-- * p_prompt:               The user provided prompt
-- * p_first_prompt:         The system prompt (APEX$NL2SQL, APEX$CREATE_APP...)
-- * p_workspace_id:         The APEX Workspace ID
-- * p_result                The result of building the prompt
--
-- Return:
--   The prompt for NL2SQL
--
-- Example:
--
-- ~~~
-- declare
--   l_prompt  clob;
-- begin
--   wwv_flow_ai_dev.build_prompt_from_prompt(
--       p_prompt       => 'show average salary of employees by department name',
--       p_workspace_id => 1234
--       p_result       => l_prompt);
-- end;
-- ~~~
--==============================================================================
procedure build_prompt_from_prompt (
    p_prompt                 in  varchar2,
    p_first_prompt           in  varchar2,
    p_workspace_id           in  number,
    p_fuzziness_level        in  number    default c_default_fuzziness_level,
    p_result                 out clob );

--==============================================================================
-- Build a prompt for CREATE_APP from a user provided prompt
--
-- Parameters:
-- * p_first_prompt:         The system prompt (APEX$NL2SQL, APEX$CREATE_APP...)
-- * p_workspace_id:         The APEX Workspace ID
-- * p_fuzziness_level:      Minimum "Edit Distance" similarity to be met by the table name.
-- * p_result:               The result of building the prompt
--
-- Return:
--   The prompt for CREATE_APP
--
-- Example:
--
-- ~~~
-- declare
--   l_prompt  clob;
-- begin
--   wwv_flow_ai_dev.build_create_app_prompt (
--       p_prompt       => 'Create an application for employees'
--       p_first_prompt => 'APEX$CREATE_APP',
--       p_workspace_id => 1234,
--       p_result       => l_prompt);
-- end;
-- ~~~
--==============================================================================
procedure build_create_app_prompt (
    p_prompt                 in  varchar2,
    p_first_prompt           in  varchar2,
    p_workspace_id           in  number,
    p_fuzziness_level        in  number    default c_default_fuzziness_level,
    p_result                 out clob,
    p_tables_found           out varchar2 );

--==============================================================================
-- Build a prompt for NL2SQL from a user provided prompt
--
-- Parameters:
-- * p_tables:               A list of tables to consider in the prompt
-- * p_workspace_id:         The APEX Workspace ID
-- * p_fuzziness_level:      Minimum "Edit Distance" similarity to be met by the table name.
-- * p_result                The result of building the prompt
--
-- Return:
--   The prompt for NL2SQL
--
-- ~~~
-- Example:
--
-- declare
--   l_prompt  clob;
-- begin
--   wwv_flow_ai_dev.build_prompt_from_prompt(
--       p_prompt       => 'show average salary of employees by department name',
--       p_workspace_id => 1234,
--       p_result       => l_prompt);
-- end;
-- ~~~
--==============================================================================
procedure build_prompt_from_tables(
    p_tables                 in  wwv_flow_t_varchar2,
    p_workspace_id           in  number,
    p_result                 out clob);

--==============================================================================
-- Merge (create/update) Generative AI Service.
--
-- Parameters:
-- * p_id:                   The Generative AI Service (remote_servers) ID.
-- * p_name:                 The name of the Generative AI Service
-- * p_static_id:            Generative AI Service static ID
-- * p_base_url:             Base URL of the service
-- * p_credential_id:        Credential ID for the service. null if new credential must be created
-- * p_ai_provider_type:     The AI provider type: OPENAI, COHERE, OCI_GENAI
-- * p_ai_model_name:        Optional AI model name
-- * p_ai_http_headers:      Optional HTTP Headers in the form key=value
-- * p_ai_attributes:        Optional attributes in the form of JSON
-- * p_server_comment:       Comments for the service
-- * p_new_api_key:          API key for the new credential
-- * p_new_oci_userid:       OCI User ID for the new credential
-- * p_new_oci_tenancyid:    OCI Tenancy ID for the new credential
-- * p_new_oci_privatekey:   OCI private key for the new credential
-- * p_new_oci_fingerprint:  OCI fingerprint for the new credential
--
-- Example:
--
-- ~~~
-- begin
--   wwv_flow_ai_dev.merge_remote_server(
--       p_id                    => 1234,
--       p_name                  => 'My AI',
--       p_static_id             => 'MY_AI',
--       p_base_url              => 'https://api.openai.com/v1',
--       p_credential_id         => 5678,
--       p_ai_provider_type      => 'OPENAI',
--       p_ai_is_builder_service => 'Y');
-- end;
-- ~~~
--==============================================================================
procedure merge_remote_server (
    p_id                     in number,
    p_name                   in varchar2,
    p_static_id              in varchar2,
    p_base_url               in varchar2,
    p_credential_id          in number   default null,
    p_ai_provider_type       in varchar2,
    p_ai_is_builder_service  in varchar2,
    p_ai_model_name          in varchar2,
    p_ai_http_headers        in clob,
    p_ai_attributes          in clob,
    p_server_comment         in varchar2,
    --
    p_new_api_key            in varchar2 default null,
    p_new_oci_userid         in varchar2 default null,
    p_new_oci_tenancyid      in varchar2 default null,
    p_new_oci_privatekey     in varchar2 default null,
    p_new_oci_fingerprint    in varchar2 default null );

--==============================================================================
-- Merge (create/update) Vector Provider, Remote Server for embeddings.
--
-- Parameters:
-- * p_id:                    The Vector Provider (remote_servers) ID.
-- * p_name:                  The name of the Vector Provider
-- * p_static_id:             Vector Provider static ID
-- * p_base_url:              Optional Base URL of the service
-- * p_credential_id:         Optional Credential ID for the service.
-- * p_ai_provider_type:      Optional AI provider type: OPENAI, COHERE, OCI_GENAI
-- * p_ai_model_name:         Optional AI model name
-- * p_ai_http_headers:       Optional HTTP Headers in the form key=value
-- * p_ai_attributes:         Optional attributes in the form of JSON
-- * p_server_comment:        Comments for the service
-- * p_new_api_key:           API key for the new credential
-- * p_new_oci_userid:        OCI User ID for the new credential
-- * p_new_oci_tenancyid:     OCI Tenancy ID for the new credential
-- * p_new_oci_privatekey:    OCI private key for the new credential
-- * p_new_oci_fingerprint:   OCI fingerprint for the new credential
-- * p_embedding_type:        AI, ONNX model or custom PL/SQL function
-- * p_emb_local_model_owner: Specifies the ONNX model owner
-- * p_emb_local_model_name:  Specifies the ONNX model name
-- * p_emb_function:          Specifies the custom PL/SQL function name
--
-- Example:
--
-- ~~~
-- begin
--   wwv_flow_ai_dev.merge_remote_server_emb(
--       p_id                    => 1234,
--       p_name                  => 'My VP',
--       p_static_id             => 'MY_VP',
--       p_embedding_type        => 'ONNX',
--       p_emb_local_model_owner => 'SCOTT',
--       p_emb_local_model_name  => 'ALL_MINILM_L6' );
-- end;
-- ~~~
--==============================================================================
procedure merge_remote_server_emb (
    p_application_id         in number,
    --
    p_id                     in number,
    p_name                   in varchar2,
    p_static_id              in varchar2,
    p_base_url               in varchar2 default null,
    p_credential_id          in number   default null,
    p_ai_provider_type       in varchar2 default null,
    p_ai_model_name          in varchar2 default null,
    p_ai_http_headers        in clob,
    p_ai_attributes          in clob,
    p_server_comment         in varchar2 default null,
    --
    p_new_api_key            in varchar2 default null,
    p_new_oci_userid         in varchar2 default null,
    p_new_oci_tenancyid      in varchar2 default null,
    p_new_oci_privatekey     in varchar2 default null,
    p_new_oci_fingerprint    in varchar2 default null,
    --
    p_embedding_type         in varchar2,
    p_emb_local_model_owner  in varchar2 default null,
    p_emb_local_model_name   in varchar2 default null,
    p_emb_function           in varchar2 default null );

--==============================================================================
-- Delete remote server based on selected Generative AI provider
--
-- Parameters:
-- * p_id:                   The remote server ID.
--
-- Example:
--
-- ~~~
-- begin
--   wwv_flow_ai_dev.delete_remote_server(
--       p_id => 1234);
-- end;
-- ~~~
--==============================================================================
procedure delete_remote_server (
    p_id                     in number );

--==============================================================================
-- Get the base URL for a given AI provider type.
--
-- Parameters:
-- * p_provider_type:        The AI provider type.
-- * p_oci_region:           The OCI region in case where OCI Generative AI is used.
--
-- Example:
--
-- ~~~
-- declare
--   l_base_url varchar2(32767);
-- begin
--   l_base_url := wwv_flow_ai_dev.get_base_url(
--       p_provider_type => wwv_flow_ai.c_provider_openai);
-- end;
-- ~~~
--==============================================================================
function get_base_url(
    p_provider_type          in varchar2,
    p_oci_region             in varchar2 default null)
    return varchar2;

--==============================================================================
-- Get mandatory attributes for a given AI provider type.
--
-- Parameters:
-- * p_provider_type:        The AI provider type.
-- * p_oci_compartment_id:   OCI compartment ID if OCI Generative AI is used
-- * p_oci_model_id:         OCI model ID if OCI Generative AI is used
--
-- Example:
--
-- ~~~
-- declare
--   l_attributes clob;
-- begin
--   l_attributes := wwv_flow_ai_dev.get_mandatory_attributes(
--       p_provider_type => wwv_flow_ai.c_provider_openai);
-- end;
-- ~~~
--==============================================================================
function get_mandatory_attributes(
    p_provider_type          in varchar2,
    p_oci_compartment_id     in varchar2 default null,
    p_oci_model_id           in varchar2 default null)
    return clob;

--==============================================================================
-- Get the default Model for a given Generative AI provider
--
-- Parameters:
-- * p_provider_type:        The AI provider type.
--
-- Example:
--
-- ~~~
-- declare
--   l_model varchar2(64);
-- begin
--   l_attributes := wwv_flow_ai_dev.get_default_model(
--       p_provider_type => wwv_flow_ai.c_provider_openai);
-- end;
-- ~~~
--==============================================================================
function get_default_model(
    p_provider_type          in wwv_flow_ai.t_provider)
    return varchar2;

--==============================================================================
-- Get the default embedding AI model for the given vector provider.
--
-- Parameters:
-- * p_provider_type:        The vector provider type.
--
-- Example:
--
-- ~~~
-- declare
--   l_model varchar2(64);
-- begin
--   l_attributes := wwv_flow_ai_dev.get_default_emb_model(
--       p_provider_type => wwv_flow_ai.c_provider_openai);
-- end;
-- ~~~
--==============================================================================
function get_default_emb_model (
    p_provider_type in wwv_flow_ai.t_provider)
    return varchar2;
--
--==============================================================================
-- The function copies an existing ai config to the target application, if it
-- doesn't exist in that application. If it exists, the ID is returned.
--==============================================================================
function get_id_or_copy_ai_config (
    p_config_id           in number,
    p_from_application_id in number,
    p_to_application_id   in number,
    p_subscribe           in boolean default false,
    p_copy_subscription   in boolean default false )
    return number;
--
--==============================================================================
-- Create a new Credential for a Generative AI Service and return it's ID.
--
-- Parameters:
-- * p_name:                 The name of the Generative AI Service
-- * p_base_url:             Base URL of the service
-- * p_ai_provider_type:     The AI provider type: OPENAI, COHERE, OCI_GENAI
-- * p_new_api_key:          API key for the new credential
-- * p_new_oci_userid:       OCI User ID for the new credential
-- * p_new_oci_tenancyid:    OCI Tenancy ID for the new credential
-- * p_new_oci_privatekey:   OCI private key for the new credential
-- * p_new_oci_fingerprint:  OCI fingerprint for the new credential
--
-- Example:
--
-- ~~~
-- declare
--   l_model varchar2(64);
-- begin
--   l_credential_id := wwv_flow_ai_dev.create_credential(
--       p_name                  => 'My AI',
--       p_base_url              => 'https://api.openai.com/v1',
--       p_ai_provider_type      => 'OPENAI',
--       p_new_api_key           => 'mY_keY' );
-- end;
-- ~~~
--==============================================================================
function create_credential(
    p_name                   in varchar2,
    p_base_url               in varchar2,
    p_ai_provider_type       in varchar2,
    p_new_api_key            in varchar2 default null,
    p_new_oci_userid         in varchar2 default null,
    p_new_oci_tenancyid      in varchar2 default null,
    p_new_oci_privatekey     in varchar2 default null,
    p_new_oci_fingerprint    in varchar2 default null )
    return number;
--
--==============================================================================
-- This procedure copies an AI configuration into a new or the same application.
--==============================================================================
procedure copy_ai_config_from_app (
    p_from_application_id in    number,
    p_from_config_id      in    number,
    p_to_application_id   in    number,
    p_to_name             in    varchar2,
    p_subscribe           in    boolean default false,
    p_copy_subscription   in    boolean default false,
    --
    p_new_config_id          out number );
--
--==============================================================================
-- This procedure pulls content from the master ai config and
-- copies it to the subscribing ai config.
--==============================================================================
procedure subscribe_ai_config (
    p_master_config_id      in number,
    p_subscribing_config_id in number );
--
--==============================================================================
-- This procedure refreshes the specified ai config from its master ai config.
--==============================================================================
procedure refresh_ai_config (
    p_subscribing_config_id in number );

--==============================================================================
-- This procedure pushes the changes of the specified ai config to all its
-- subscribers.
--==============================================================================
procedure publish_ai_config (
    p_master_config_id in number );

end wwv_flow_ai_dev;
/
show err
set define '^'
