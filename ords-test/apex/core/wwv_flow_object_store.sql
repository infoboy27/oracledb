set define '^' verify off
prompt ...wwv_flow_object_store.sql
create or replace package wwv_flow_object_store is
------------------------------------------------------------------------------------------------------------------------
--
--  Copyright (c) 2019, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_object_store.sql
--
--    DESCRIPTION
--      OCI Object Storage file support in APEX
--
--
--    MODIFIED   (MM/DD/YYYY)
--    jstraub     08/02/2023 - Created
--
--
-- Constants
--
c_max_sync_bytes            constant number       :=
    to_number(nvl(wwv_flow_platform.get_preference('OBJECT_STORE_MAX_SYNC_BYTES'),'10485760')); --10MB
c_file_storage_object_store constant varchar2(12) := 'OBJECT_STORE';
--==============================================================================
-- Returns the file storage setting of the given p_app_id
--
-- Parameters:
-- * p_app_id:       ID of the application.
--
--==============================================================================
function get_file_storage (
    p_app_id         in number                        default wwv_flow.g_flow_id )
return varchar2;

--==============================================================================
--Tests access to the bucket, ensures that it is visible, and returns success or
--failure message.
--
-- Parameters:
-- * p_app_id:       ID of the application.
--
--==============================================================================
function test_bucket (
    p_app_id         in number                        default wwv_flow.g_flow_id,
    p_url            in varchar2,
    p_credential_id  in number )
return varchar2;

--==============================================================================
-- Deletes resource at the specified path.
--
-- Parameters:
-- * p_app_id: ID of the application.
-- * p_path  : The path to list.
--
--==============================================================================
procedure delete_file (
    p_app_id         in number                        default wwv_flow.g_flow_id,
    p_path           in varchar2 );

--==============================================================================
-- Returns the resource at the specified path.
--
-- Parameters:
-- * p_app_id: ID of the application.
-- * p_path  : The path to list.
--
--==============================================================================
function get_file (
    p_app_id         in number        default wwv_flow.g_flow_id,
    p_workspace_id   in number        default wwv_flow_security.g_security_group_id,
    p_path           in varchar2 )
return blob;

--==============================================================================
-- Adds a resource at the specified path.
--
-- Parameters:
-- * p_app_id   : ID of the application
-- * p_workspace_id: The id of the workspace
-- * p_path     : The path to the file
-- * p_mime_type: the mimetype of the file
-- * p_resource : The object to create
--
--==============================================================================
procedure put_file (
    p_app_id         in number        default wwv_flow.g_flow_id,
    p_workspace_id   in number        default wwv_flow_security.g_security_group_id,
    p_path           in varchar2,
    p_mime_type      in varchar2,
    p_resource       in blob );

--==============================================================================
-- Renames a resource at the specified path.
--
-- Parameters:
-- * p_app_id   : ID of the application
-- * p_workspace_id: The id of the workspace
-- * p_old_path    : The path to the old file
-- * p_new_path    : The new path to the file
--
--==============================================================================
procedure rename_file (
    p_app_id         in number        default wwv_flow.g_flow_id,
    p_workspace_id   in number        default wwv_flow_security.g_security_group_id,
    p_old_path       in varchar2,
    p_new_path       in varchar2 );
--==============================================================================
-- Create a bucket.
--
-- Parameters:
-- * p_path          : The path to list.
-- * p_bucket_name   : Name of the bucket
-- * p_compartment_id: The OCID of the compartment where the bucket will live
-- * p_credential_id : The credential that can create the bucket.
--
--==============================================================================
procedure create_bucket (
    p_path           in varchar2,
    p_bucket_name    in varchar2,
    p_compartment_id in varchar2,
    p_credential_id  in number );

--==============================================================================
-- Migrates application files to object storage from local database storage.
--
-- Parameters:
-- * p_app_id: ID of the application.
-- * p_workspace_id: The id of the workspace
--
--==============================================================================
procedure migrate (
    p_app_id         in number        default wwv_flow.g_flow_id,
    p_session_id     in number        default null,
    p_workspace_id   in number        default wwv_flow_security.g_security_group_id );

--==============================================================================
-- Migrates application files to object storage from local database storage in
-- the background.
--
-- Parameters:
-- * p_app_id: ID of the application.
-- * p_workspace_id: The id of the workspace
--
--==============================================================================
procedure migrate_bg (
    p_app_id         in number        default wwv_flow.g_flow_id,
    p_session_id     in number,
    p_workspace_id   in number        default wwv_flow_security.g_security_group_id );

--==============================================================================
-- Moves application files from object storage to local database storage.
--
-- Parameters:
-- * p_app_id: ID of the application.
-- * p_session_id: The current builder session
-- * p_workspace_id: The id of the workspace
-- * p_collection_name: Name of collection containing file information
--
--==============================================================================
procedure move (
    p_app_id            in number        default wwv_flow.g_flow_id,
    p_session_id        in number,
    p_workspace_id      in number        default wwv_flow_security.g_security_group_id,
    p_collection_name   in varchar2 );

--==============================================================================
-- Moves application files from object storage to local database storage in the
-- background.
--
-- Parameters:
-- * p_app_id: ID of the application.
-- * p_session_id: The current builder session
-- * p_workspace_id: The id of the workspace
-- * p_collection_name: Name of collection containing file information
--
--==============================================================================
procedure move_bg (
    p_app_id            in number        default wwv_flow.g_flow_id,
    p_session_id        in number,
    p_workspace_id      in number        default wwv_flow_security.g_security_group_id,
    p_collection_name   in varchar2 );

--==============================================================================
--
-- Parameters:
-- * p_app_id         : ID of the application.
-- * p_collection_name: Name of collection to store results
--   p_limit          : Number of objects to retrieve
--   p_search         : Search term for filename
--
procedure populate_object_collection (
    p_app_id            in number                     default wwv_flow.g_flow_id,
    p_collection_name   in varchar2,
    p_limit             in number                     default 1000,
    p_search            in varchar2                   default null );

end wwv_flow_object_store;
/
show errors
