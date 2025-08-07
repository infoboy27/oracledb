set define '^' verify off
prompt ...wwv_flow_exec_doc_src.sql
create or replace package wwv_flow_exec_doc_src authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_exec_doc_src.sql
--
--    DESCRIPTION
--      Package for document source runtime logic.
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    06/03/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

subtype t_doc_source_type is pls_integer range 1..3;

--==============================================================================
-- Constants
--==============================================================================

c_doc_source_collection   constant t_doc_source_type := 1;
c_doc_source_json_column  constant t_doc_source_type := 2;
c_doc_source_duality_view constant t_doc_source_type := 3;

--==============================================================================
-- Converts the String representation of a document source type to its
-- t_doc_source_type pendant.
--
-- * 'JSON_TABLE'      -> c_doc_source_json_column
-- * 'COLLECTION'      -> c_doc_source_collection
-- * 'DUALITY_VIEW'    -> c_doc_source_duality_view
--==============================================================================
function map_document_source_type(
    p_document_source_type in varchar2 )
    return t_doc_source_type;

--==============================================================================
-- Finds the document source and array column IDs based on
-- static ID and array column name.
--
-- Parameters:
-- * p_application_id:           The application ID within to look for a document source.
-- * p_static_id:                The static ID of the document source.
-- * p_array_column_name:        The name of the array column to look for.
--
-- * p_document_source_id:       The ID of the document source.
-- * p_array_column_id:          The ID of the array column, if an array column was passed in.
--
-- Since: 24.2
--==============================================================================
procedure find_document_source_ids(
    p_application_id            in number    default wwv_flow.g_flow_id,
    p_static_id                 in varchar2,
    p_array_column_name         in varchar2  default null,
    --
    p_document_source_id       out number,
    p_array_column_id          out number );

--==============================================================================
-- Opens a query context for the given document source ID.
--
-- Parameters:
-- * p_context:                  The context object.
-- * p_parse_as_schema_override: Override the schema to parse SQL as.
--==============================================================================
procedure open_query_context(
    p_context                   in out nocopy wwv_flow_exec.t_context,
    p_parse_as_schema_override  in            varchar2 );

--==============================================================================
-- Returns the remote server ID of a document source, NULL if the
-- document source is based on the local database.
--
-- Parameters:
-- * p_document_source_id:       ID of the document source.
--
-- Returns:
-- The ID of the remote server if the document source is based on REST Enabled SQL.
--==============================================================================
function get_remote_server_id(
    p_document_source_id        in number )
    return number;

--==============================================================================
-- Returns the Document Source SQL Query. Used for LOV based report columns,
-- where the LOV query must be joined with the main report query.
--
-- Parameters:
-- * p_query_meta_data:          Query Meta Data object with all query details.
-- * p_columns:                  List of columns the caller is interested in.
--
-- * p_sql_query:                The generated SQL Query.
--==============================================================================
procedure generate_sql_query(
    p_query_meta_data           in wwv_flow_exec.t_query_meta_data,
    p_columns                   in wwv_flow_exec_api.t_columns,
    --
    p_sql_query                out wwv_flow_global.vc_arr2 );

--==============================================================================
-- Opens a DML context for the given document source ID.
--
-- Parameters:
-- * p_context:                  Context object with execution details.
-- * p_continue_on_error:        Whether to continue execution for the remaining rows,
--                               when an error occurs for one row.
--==============================================================================
procedure execute_dml(
    p_context                   in out nocopy wwv_flow_exec.t_context,
    p_continue_on_error         in            boolean                     default false );

end wwv_flow_exec_doc_src;
/
show err

set define '^'
