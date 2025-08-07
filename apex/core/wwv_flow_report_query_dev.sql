set define '^' verify off
prompt ...wwv_flow_report_query_dev
create or replace package wwv_flow_report_query_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_report_query_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling functionality related to Report Queries in the builder.
--
--    MODIFIED   (MM/DD/YYYY)
--    mhoogend   10/31/2023 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Returns a user-friendly display name based on the query metadata
--==============================================================================
function get_display_name(
    p_location               in varchar2,
    -- Local
    p_source_type            in varchar2,
    p_table_name             in varchar2,
    p_sql_query              in clob,
    p_function_body          in clob,
    p_graph_name             in varchar2,
    --
    p_document_source_id     in number,
    -- REST data source
    p_web_src_module_id      in number,
    -- REST enabled SQL
    p_remote_source_type     in varchar2,
    p_remote_sql_query       in clob,
    p_remote_table_name      in varchar2 )
    return varchar2;

--==============================================================================
-- Adds or updates a Source Query collection member
-- (used on wizard Source Query Step 1119)
--==============================================================================
procedure merge_collection_member(
    p_seq                       in out nocopy number,
    p_collection_name           in varchar2,
    p_name                      in varchar2,
    p_location                  in varchar2,
    -- Local
    p_source_type               in varchar2,
    p_table_owner               in varchar2,
    p_table_name                in varchar2,
    p_sql_query                 in varchar2,
    p_function_body_language    in varchar2,
    p_function_body             in varchar2,
    p_graph_name                in varchar2,
    p_match_clause              in varchar2,
    p_columns_clause            in varchar2,
    --
    p_document_source_id        in number,
    -- REST data source
    p_web_src_module_id         in number,
    p_array_column_id           in number,
    -- REST enabled SQL
    p_remote_server_id          in number,
    p_remote_source_type        in varchar2,
    p_remote_sql_query          in varchar2,
    p_remote_table_owner        in varchar2,
    p_remote_table_name         in varchar2 );

--==============================================================================
-- Returns all attributes of a Source Query collection member
-- (used on wizard Source Query Step 1119)
--==============================================================================
procedure get_collection_member (
    p_seq                       in number,
    p_collection_name           in varchar2,
    --
    p_name                      out varchar2,
    p_location                  out varchar2,
    -- Local
    p_source_type               out varchar2,
    p_table_owner               out varchar2,
    p_table_name                out varchar2,
    p_sql_query                 out varchar2,
    p_function_body_language    out varchar2,
    p_function_body             out varchar2,
    p_graph_name                out varchar2,
    p_match_clause              out varchar2,
    p_columns_clause            out varchar2,
    --
    p_document_source_id        out number,
    -- REST data source
    p_web_src_module_id         out number,
    p_array_column_id           out number,
    -- REST enabled SQL
    p_remote_server_id          out number,
    p_remote_source_type        out varchar2,
    p_remote_sql_query          out varchar2,
    p_remote_table_owner        out varchar2,
    p_remote_table_name         out varchar2 );

--==============================================================================
-- Creates a report query
-- (used on wizard Source Query Step 1114)
--==============================================================================
function create_report_query (
    p_flow_id               in number,
    p_report_query_name     in varchar2,
    p_report_layout_id      in number,
    p_output_format         in varchar2,
    p_format_item           in varchar2,
    p_file_name             in varchar2,
    p_include_session_state in varchar2,
    p_items                 in varchar2,
    p_content_disposition   in varchar2 default null )
    return number;

--==============================================================================
-- Creates all sources for a report query
-- (used on wizard Source Query Step 1114)
--==============================================================================
procedure create_sources (
    p_collection_name       in varchar2,
    p_application_id        in number,
    p_report_query_id       in number );

--==============================================================================
-- copies a report query.
--==============================================================================
procedure copy_report_query (
    p_application_id            in number,
    p_report_query_id           in number,
    p_to_name                   in varchar2 default null,
    p_if_existing_raise_dupval  in boolean  default false );

--==============================================================================
-- Fetches all bind variables into a collection
--==============================================================================
procedure fetch_bind_variables(
    p_application_id    in number,
    p_report_query_id   in number );

--==============================================================================
-- Invokes a remote print server for the Report Query
--==============================================================================
procedure test_report(
    p_application_id        in number,
    p_report_query_name     in varchar2,
    p_include_session_state in boolean,
    p_format                in varchar2 );

end wwv_flow_report_query_dev;
/
show errors
