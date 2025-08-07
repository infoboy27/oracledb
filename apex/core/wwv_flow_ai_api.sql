set define off verify off
prompt ...wwv_flow_ai_api
create or replace package wwv_flow_ai_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, 2024, Oracle and/or its affiliates
--
--    NAME
--      wwv_flow_ai_api.sql
--
--    DESCRIPTION
--      APEX Generative AI API.
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
-- Global types
--==============================================================================
subtype t_chat_role            is varchar2(30);
subtype t_prompt_type          is varchar2(30);

type t_chat_message            is record (
    chat_role   t_chat_role,
    message     clob );

type t_chat_messages  is table of t_chat_message index by pls_integer;

--==============================================================================
-- Constants
--=============================================================================
c_chat_messages                   t_chat_messages;

c_prompt_sql_query     constant   t_prompt_type  := 'SQL_QUERY';
c_prompt_sql_ddl       constant   t_prompt_type  := 'SQL_DDL';
c_prompt_quicksql_ddl  constant   t_prompt_type  := 'QUICKSQL_DDL';

--==============================================================================
-- Are Generative AI features enabled for the current APEX Workspace?
--
--
-- Returns:
-- * true if Generative AI features are enabled for the current workspace,
--   false otherwise
--
-- Example:
-- ~~~
-- declare
--   l_is_ai_enabled boolean;
-- begin
--   l_is_ai_enabled := apex_ai.is_enabled;
--   dbms_output.put_line('AI is enabled: ' || case l_is_ai_enabled when true then 'Yes' else 'No' end);
-- end;
-- ~~~
--==============================================================================
function is_enabled
return boolean;

--==============================================================================
-- Chat with a Generative AI service given a prompt and potential earlier
-- responses.
--
-- Parameters:
-- * p_config_static_id      The Static ID of the AI Configuration defined under the application's Shared Components
-- * p_prompt                The user prompt
-- * p_messages              The (optional) responses from an earlier conversation.
--                           Responses will be automatically added to p_responses for an easy conversational experience.
--
-- Returns:
-- * The response for the given prompt and type
--
-- Example:
-- Chat with the Assistant configured as 'my-oracle-assistant' where in the first interaction,
-- a system prompt is given and then in further interactions the context is passed to the
-- Generative AI service in the form of parameter p_messages.
-- ~~~
-- declare
--   l_messages  t_chat_messages := c_chat_messages;
--   l_response1 clob;
--   l_response2 clob;
-- begin
--   l_response1 := apex_ai.chat(
--     p_config_static_id  => 'my-oracle-assistant',
--     p_prompt            => 'What is Oracle APEX',
--     p_messages          => l_messages);
--   l_response2 := apex_ai.chat(
--     p_config_static_id  => 'my-oracle-assistant',
--     p_prompt            => 'What is new in 23.2',
--     p_messages          => l_messages)
-- end;
-- ~~~
--==============================================================================
function chat (
    p_config_static_id  in              varchar2,
    p_prompt            in              clob,
    p_messages          in out nocopy   t_chat_messages )
    return clob;

--==============================================================================
-- Chat with a Generative AI service given a prompt and potential earlier
-- responses.
--
-- Parameters:
-- * p_prompt                The user prompt
-- * p_system_prompt         A (optional) system prompt to pass. Some Generative AI
--                           services (like OpenAI) support the use of passing a system
--                           prompt to set the context of a conversation
-- * p_service_static_id     The Generative AI Service static ID.
--                           If not provided, the app's default AI Service will be used.
-- * p_temperature           The temperature to use. How the temperature is interpreted depends
--                           on the Generative AI Service implementation. Higher temperatures
--                           result in more 'creative' responses. See the documentation of the
--                           Generative AI provider for details and allowed values.
-- * p_messages              The (optional) responses from an earlier conversation.
--                           Responses will be automatically added to p_responses for an easy conversational experience.
--
-- Returns:
-- * The response for the given prompt and type
--
-- Example:
-- Chat with the configured Generative AI Service 'MY_AI_SERVICE' where in the first interaction,
-- a system prompt is given and then in further interactions the context is passed to the
-- Generative AI service in the form of parameter p_messages.
-- ~~~
-- declare
--   l_messages  t_chat_messages := c_chat_messages;
--   l_response1 clob;
--   l_response2 clob;
-- begin
--   l_response1 := apex_ai.chat(
--     p_prompt            => 'What is Oracle APEX',
--     p_system_prompt     => 'I am an expert in Low Code Application Platforms',
--     p_service_static_id => 'MY_AI_SERVICE',
--     p_messages          => l_messages);
--   l_response2 := apex_ai.chat(
--     p_prompt            => 'What is new in 23.2',
--     p_service_static_id => 'MY_AI_SERVICE',
--     p_messages          => l_messages)
-- end;
-- ~~~
--==============================================================================
function chat (
    p_prompt            in              clob,
    p_system_prompt     in              varchar2            default null,
    p_service_static_id in              varchar2            default null,
    p_temperature       in              number              default null,
    p_messages          in out nocopy   t_chat_messages )
    return clob;

$IF wwv_flow_db_version.c_has_vector_type $THEN
--==============================================================================
-- Receive the embedding from a vector provider for a given term.
--
-- Parameters:
-- * p_value                 The user input
-- * p_service_static_id     The Vector Provider static ID.
--
-- Returns:
-- * The embedding for the user input as a vector datatype
--
-- Note:
-- * For the Vector Provider embedding types ONNX and PLSQL, the corresponding functions are called internally.
--
-- Example:
-- Get the embedding for "wooden house at the lake" from the configured Vector Provider "MY_VECTOR_PROVIDER".
-- ~~~
-- declare
--   l_response  vector;
-- begin
--   l_response := apex_ai.get_vector_embeddings(
--       p_value             => 'wooden house at the lake',
--       p_service_static_id => 'MY_VECTOR_PROVIDER' );
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
    p_value             in clob,
    p_service_static_id in varchar2 )
    return vector;

function get_vector_embeddings (
    p_value             in clob,
    p_local_llm_owner   in varchar2,
    p_local_llm_name    in varchar2 )
    return vector;

function get_vector_embeddings (
    p_value             in clob,
    p_function_name     in varchar2 )
    return vector;
$END

--==============================================================================
-- Generate a response for a given prompt.
--
-- Parameters:
-- * p_config_static_id      The Static ID of the AI Configuration defined under the application's Shared Components
-- * p_prompt                The user prompt
--
-- Returns:
-- * The response for the given prompt and type
--
-- Example:
-- Generate a response with the Assistant configured as 'my-oracle-assistant' for
-- the given prompt
-- ~~~
-- declare
--   l_response clob;
-- begin
--   l_response := apex_ai.generate(
--     p_prompt            => 'What is Oracle APEX',
--     p_service_static_id => 'MY_AI_SERVICE');
-- end;
-- ~~~
--==============================================================================
function generate (
    p_config_static_id  in              varchar2,
    p_prompt            in              clob )
    return clob;

--==============================================================================
-- Generate a response for a given prompt.
--
-- Parameters:
-- * p_prompt                The user prompt
-- * p_system_prompt         A (optional) system prompt to pass. Some Generative AI
--                           services (like OpenAI) support the use of passing a system
--                           prompt to set the context of a request.
-- * p_service_static_id     The Generative AI Service static ID.
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
--     l_response clob;
-- begin
--     l_response := apex_ai.generate(
--                       p_prompt            => 'What is Oracle APEX',
--                       p_system_prompt     => 'I am an expert in Low Code Application Platforms',
--                       p_service_static_id => 'MY_AI_SERVICE');
-- end;
-- ~~~
--==============================================================================
function generate (
    p_prompt            in              clob,
    p_system_prompt     in              varchar2            default null,
    p_service_static_id in              varchar2            default null,
    p_temperature       in              number              default null )
    return clob;

--==============================================================================
-- Returns whether a consent screen is should be shown to the user
--   before interacting with the AI.
--
-- Parameters:
-- * p_username         The username. Defaults to the current user.
-- * p_application_id   The application ID. Defaults to the current application.
--
-- Returns:
-- * True if there exists an AI consent message and if the user has not already consented,
--      false otherwise
--
-- Example:
-- Below code checks whether user consent is needed for the current user and application.
-- ~~~
-- declare
--   l_user_consent_needed boolean;
-- begin
--   l_user_consent_needed := apex_ai.is_user_consent_needed;
-- end;
-- ~~~
--==============================================================================
function is_user_consent_needed (
    p_user_name         in  varchar2    default wwv_flow_security.g_user,
    p_application_id    in  number      default wwv_flow_security.g_flow_id )
    return boolean;

--==============================================================================
-- Marks the user as having consented to the use of AI.
--  If done once either by the user via the UI, or via this API, the user will no
--  longer be prompted to cosent when interacting with AI.
--
-- Parameters:
-- * p_user_name        The username.
-- * p_application_id   The application ID.
--
-- Example:
-- ~~~
-- begin
--   apex_ai.set_user_consent(
--     p_user_name      => 'STIGER',
--     p_application_id => 100);
-- end;
-- ~~~
--==============================================================================
procedure set_user_consent (
    p_user_name         in  varchar2,
    p_application_id    in  number );

--==============================================================================
-- Removes the AI user preference storing the usage consent.
--
-- Parameters:
-- * p_user_name        The username.
-- * p_application_id   The application ID.
--
-- Example:
-- ~~~
-- begin
--   apex_ai.revoke_user_consent(
--     p_user_name      => 'STIGER',
--     p_application_id => 100);
-- end;
-- ~~~
--==============================================================================
procedure revoke_user_consent (
    p_user_name         in  varchar2,
    p_application_id    in  number );

--==============================================================================
-- Removes the AI user preference storing the usage consent for all users
--
-- Parameters:
-- * p_application_id   The application ID.
--
-- Example:
-- ~~~
-- begin
--   apex_ai.revoke_user_consent_for_all(
--     p_application_id => 100);
-- end;
-- ~~~
--==============================================================================
procedure revoke_user_consent_for_all (
    p_application_id    in  number );

--==============================================================================
-- INTERNAL API ONLY:
--  
-- Get the APEX System Prompt.
--
-- Parameters:
-- * p_prompt:               The user prompt
-- * p_prompt_type:          The type of prompt, apex_ai.c_prompt_sql_query (default),
--                           apex_ai.c_prompt_sql_ddl or apex_ai.c_prompt_quicksql_ddl
-- * p_language:             An (optional) language. The response will be given in
--                           the specified language, the default is English.
--
-- Returns:
-- * The APEX system prompt for the specified prompt type.
--
-- This API requires a full development installation of APEX.
--
-- Example:
-- Below example shows how to create the system prompt for a Text-to-SQL use case
-- given the prompt and then generate an answer using Generative AI Service 'MY_AI_SERVICE'.
-- ~~~
-- declare
--   l_system_prompt clob;
--   l_genai_output  clob;
-- begin
--   l_system_prompt := apex_ai.get_system_prompt (
--     p_prompt            => 'show average salary of employees by department name',
--     p_prompt_type       =>  apex_ai.c_prompt_sql_query );
--   l_genai_output  := apex_ai.generate (
--     p_prompt            => 'show average salary of employees by department name',
--     p_system_prompt     => l_system_prompt,
--     p_service_static_id => 'MY_AI_SERVICE' );
-- end;
-- ~~~
--==============================================================================
function get_system_prompt (
    p_prompt                 in varchar2,
    p_prompt_type            in t_prompt_type default c_prompt_sql_query,
    p_language               in varchar2      default null )
return clob;

end wwv_flow_ai_api;
/

show err
set define '^'
