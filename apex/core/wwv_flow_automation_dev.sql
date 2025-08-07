set define '^' verify off
prompt ...wwv_flow_automation_dev.sql
create or replace package wwv_flow_automation_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_automation_dev.sql
--
--    DESCRIPTION
--      Automations: Builder utility functions
--
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      07/06/2020 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- Creates a new automation and a dummy PL/SQL based action.
--
-- PARAMETERS:
-- * p_flow_id                application ID
-- * p_name                   name of the new automation
-- * p_trigger_type           trigger type of the automation: POLLING or API
-- * p_polling_interval       DBMS_SCHEDULER calendaring expression for the POLLING
--                            automation execution schedule
-- * p_result_type            determines when automation actions fire
--                            ROWS, NO_ROWS, FUNC_BODY_RETURNING_BOOLEAN, ALWAYS
-- * p_location               Data Source Location for the automation source
--                            LOCAL, REMOTE, WEB_SOURCE
-- * p_remote_server_id       ID of the REST Enabled SQL Service, if p_location = 'REMOTE'
-- * p_web_src_module_id      ID of the REST Data Source, if p_location = 'WEB_SOURCE'
-- * p_array_column_id        ID of the array column to use, for REST Data Sources, Duality Views or JSON Sources
-- * p_query_type             Type of the SQL Query
--                            TABLE, SQL, FUNC_BODY_RETURNING_SQL
-- * p_query_source           SQL Query or function body returning SQL Query
-- * p_function_body_language Programming language of p_query_source
-- * p_query_owner            Table owner, if p_query_type = 'TABLE'
-- * p_query_table            Table name, if p_query_type = 'TABLE'
-- * p_query_match            PQL Match clause, if p_query type = 'GRAPH'
-- * p_query_columns          PQL Columns clause, if p_query type = 'GRAPH'
-- * p_pk_column_name         Name of the Primary Key column

-- RETURNS:
-- * ID of the created automation.
--==============================================================================
function create_wizard (
    p_flow_id                in number    default v( 'FB_FLOW_ID' ),
    --
    p_name                   in varchar2,
    p_trigger_type           in varchar2,
    p_polling_interval       in varchar2,
    --
    p_result_type            in varchar2,
    p_location               in varchar2,
    p_remote_server_id       in number,
    p_web_src_module_id      in number,
    p_array_column_id        in number,
    p_document_source_id     in number,
    p_query_type             in varchar2,
    p_query_source           in clob,
    p_function_body_language in varchar2 default null,
    p_query_owner            in varchar2,
    p_query_table            in varchar2,
    p_query_match            in varchar2,
    p_query_columns          in varchar2,
    --
    p_pk_column_name         in varchar2 )
    return number;

--==============================================================================
-- helper functions to get the columns returned by the automation query
--==============================================================================
procedure p7021_emit_query_columns;

function p7021_query_columns_as_clob return clob;

--==============================================================================
-- Copy an existing automation.
--
-- PARAMETERS:
-- * p_id                    id of existing automation which should get copied
-- * p_to_name               name of the new copied automation
-- * p_to_static_id          static id of the new copied automation
-- * p_to_flow_id            Application ID to copy the automation to; by default
--                           the automation is copied within the same application
--
-- RETURNS:
-- * ID of the created automation.
--==============================================================================
function copy (
    p_id           in number,
    p_to_name      in varchar2,
    p_to_static_id in varchar2,
    p_to_flow_id   in number default null )
    return number;

--==============================================================================
-- Given the calendaring expression, return the amount of minutes between the
-- next and the following execution.
--
-- PARAMETERS:
-- * p_calendaring_expression calendaring expression (DBMS_SCHEDULER) to
--                            compute the next execution timestamp
-- RETURNS:
-- * minutes between the next and following execution
--==============================================================================
function get_execution_cadence_minutes(
    p_calendaring_expression  in varchar2 )
    return number;

end wwv_flow_automation_dev;
/
show err

set define '^'
