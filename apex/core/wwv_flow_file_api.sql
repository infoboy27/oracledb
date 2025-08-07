set define '^' verify off
prompt ...wwv_flow_file_api
create or replace package wwv_flow_file_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2001, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_file_api.sql
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      sdillon   04/15/2001 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
g_file_inserted       boolean     := false;
g_file_inserted_count pls_integer := 0;

--==============================================================================
subtype t_file_scope is varchar2(10);
c_file_scope_app        constant t_file_scope := 'APP';
c_file_scope_workspace  constant t_file_scope := 'WORKSPACE';
c_file_scope_plugin     constant t_file_scope := 'PLUGIN';
c_file_scope_theme      constant t_file_scope := 'THEME';

--==============================================================================
subtype t_temp_type is varchar2(9);
c_temp_session constant t_temp_type := 'SESSION';
c_temp_request constant t_temp_type := 'REQUEST';
c_db_column    constant t_temp_type := 'DB_COLUMN';

--==============================================================================
-- Clean a directory varchar2 value
--==============================================================================
function clean_dirname(
    p_dir                       in varchar2 )
    return varchar2;

--==============================================================================
-- Clean a filename varchar2 value
--==============================================================================
function clean_filename(
    p_file                      in varchar2 )
    return varchar2;

--==============================================================================
-- Remove leading and trailing spaces, dots and slashes and then append the 
-- uploaded filename to get the final file name
--==============================================================================
function get_file_name (
    p_directory in varchar2,
    p_file_name in varchar2 )
    return varchar2;

--==============================================================================
-- Get mime type based on the provided file name extension
--==============================================================================
function get_mime_type (
    p_file_name in varchar2 )
    return varchar2;

--==============================================================================
-- Take a BLOB, and write it to a VARCHAR2 table, in HEX encoding. You can 
-- then use varchar2_to_blob to reconstruct your binary objects from your 
-- VARCHAR2 table.
--==============================================================================
function blob_to_varchar2(
    p_blob                      in blob )
    return sys.dbms_sql.varchar2_table;

--==============================================================================
-- Take a BLOB, and write it to a VARCHAR2 table, in BASE64 encoding. You can 
-- then use varchar2_to_blob to reconstruct your binary objects from your 
-- VARCHAR2 table.
--==============================================================================
function blob_to_varchar2_base64(
    p_blob in blob)
    return sys.dbms_sql.varchar2_table;

--==============================================================================
-- Take a VARCHAR2 table and write them to a blob.
--==============================================================================
function varchar2_to_blob(
    p_varchar2_tab              in sys.dbms_sql.varchar2_table )
    return blob;

--==============================================================================
-- Create a new record in the wwv_flow_file_objects$ table.
--==============================================================================
function new_file_object$(
    p_name                    in out varchar2,
    p_blob                        in blob,
    p_mimetype                    in varchar2)
    return number;

--==============================================================================
-- delete a file
--==============================================================================
procedure remove_file(
    p_id                        in number,
    p_file_path                 in varchar2,
    p_file_name                 in varchar2 );

--==============================================================================
-- create a new file
--==============================================================================
procedure create_file (
    p_id              in number   default null,
    p_flow_id         in number   default null,
    p_name            in varchar2 default null,
    p_pathid          in number   default null,
    p_filename        in varchar2 default null,
    p_title           in varchar2 default null,
    p_mime_type       in varchar2 default null,
    p_doc_size        in number   default null,
    p_dad_charset     in varchar2 default null,
    p_created_by      in varchar2 default null,
    p_created_on      in date     default null,
    p_updated_by      in varchar2 default null,
    p_updated_on      in date     default null,
    p_deleted_as_of   in date     default null,
    p_last_updated    in date     default null,
    p_content_type    in varchar2 default null,
    p_blob_content    in blob     default null,
    p_language        in varchar2 default null,
    p_description     in varchar2 default null,
    p_file_type       in varchar2 default null );

--==============================================================================
-- move files to another session
--==============================================================================
procedure move_files(
    p_flow_id            in number,
    p_from_session       in number,
    p_to_session         in number,
    p_names              in wwv_flow_t_varchar2 );

--==============================================================================
-- copy files to another session
--==============================================================================
procedure copy_files(
    p_flow_id            in     number,
    p_from_session       in     number,
    p_to_session         in     number,
    p_names              in     wwv_flow_t_varchar2,
    p_new_names             out wwv_flow_t_varchar2 );

--##############################################################################
--#
--# REGISTERING FILES AND CLEANING UP
--#
--##############################################################################

--==============================================================================
-- Update the file with the given name to reference the current workspace
-- (g_security_group_id). If p_temp_type is null, the file is persistent, i.e.
-- lives until manually deleted from wwv_flow_file_objects$. If p_temp_type is
-- SESSION or REQUEST, it is temporary. A p_temp_type of DB_COLUMN is used for
-- DB form columns, i.e. files that later get moved to a database column.
--
-- SESSION and REQUEST files populate wwv_flow_file_objects$.session_id and the
-- after delete trigger on sessions deletes them. At the end of the request,
-- delete_temp_request_files() should be called. This deletes all files which
-- were registered with type REQUEST and DB_COLUMN.
--==============================================================================
procedure register_file (
    p_file_name in varchar2,
    p_temp_type in t_temp_type );

--==============================================================================
-- delete files that were registered with p_temp_type REQUEST. this is a
-- utility procedure for wwv_flow_security.teardown. the procedure performs the
-- delete statement in an autonomous transaction.
--==============================================================================
procedure delete_temp_request_files;

--==============================================================================
-- assert that the workspace limits for file uploads have not been exceeded and
-- raise an error otherwise.
--==============================================================================
procedure check_workspace_limits (
    p_security_group_id in number default wwv_flow_security.g_security_group_id );

--==============================================================================
-- Sanity check for the various scope combinations
-- Used in wwv_flow_imp_shared and wwv_flow_file_editor_dev
--
-- Raises internal error if invalid
-- p_scope  must be valid t_file_scope
-- p_app_id must not be null for scopes app, plugin and theme
-- p_app_id must not be null for scope plugin
-- p_app_id must not be null for scope theme
--==============================================================================
procedure validate_scope (
    p_scope     in t_file_scope,
    p_app_id    in number   default null,
    p_plugin_id in number   default null,
    p_theme_id  in number   default null );

end wwv_flow_file_api;
/
show error
