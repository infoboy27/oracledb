set define '^' verify off
prompt ...wwv_flow_export_api.sql
create or replace package wwv_flow_export_api authid current_user as
--------------------------------------------------------------------------------
-- Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
--
-- Filename: core/ wwv_flow_export_api.sql
-- Alias: APEX_EXPORT
--
--
-- The `APEX_EXPORT` package provides APIs to export the definitions of applications,
-- files, feedback and workspaces to text files.
--
-- `APEX_EXPORT` uses utility types `APEX_T_EXPORT_FILE` and `APEX_T_EXPORT_FILES`.
-- The former is a tuple of (name, contents) where 'name' is the file name and
-- 'contents' is a clob containing the export object's definition.
-- APEX_T_EXPORT_FILES is a table of APEX_T_EXPORT_FILE.
--
--! RUNTIME DEPLOYMENT: YES
--! PUBLIC:             YES
--
-- Modified:
-- cneumuel  09/28/2017 - Created (feature #2224)
--------------------------------------------------------------------------------
--==============================================================================
-- Data Types:
--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
subtype t_export_type     is varchar2( 255 );
-- Needs Review: Mark internal or add to public documentation?
subtype t_audit_type      is varchar2( 255 );
--==============================================================================
-- Constants:
--==============================================================================
-- Needs Review: Mark internal or add to public documentation?
c_type_application_source constant t_export_type := 'APPLICATION_SOURCE';
-- Needs Review: Mark internal or add to public documentation?
c_type_embedded_code      constant t_export_type := 'EMBEDDED_CODE';
-- Needs Review: Mark internal or add to public documentation?
c_type_checksum_sh1       constant t_export_type := 'CHECKSUM-SH1';
-- Needs Review: Mark internal or add to public documentation?
c_type_checksum_sh256     constant t_export_type := 'CHECKSUM-SH256';
-- Needs Review: Mark internal or add to public documentation?
c_type_readable_yaml      constant t_export_type := 'READABLE_YAML';
-- Needs Review: Mark internal or add to public documentation?
c_audit_dates_only        constant t_audit_type  := 'DATES_ONLY';
-- Needs Review: Mark internal or add to public documentation?
c_audit_names_dates       constant t_audit_type  := 'NAMES_AND_DATES';

--==============================================================================
-- This function exports the given application and optionally splits the application definition into
-- multiple files. The optional `p_with_%` parameters can be used to include additional information
-- in the export.
--
-- Parameters:
-- * p_application_id:          The application ID.
-- * p_type:                    Comma-delimited list of export types to perform:
--                                 - APPLICATION_SOURCE - export an APEX application using other parameters
--                                   passed.
--                                 - EMBEDDED_CODE - export code such as SQL, PL/SQL and Javascript. APEX
--                                   ignores all other options when EMBEDDED_CODE is selected.
--                                 - CHECKSUM-SH1 - export a SHA1 checksum that is independent of IDs and
--                                   can be compared across instances and workspaces.
--                                 - CHECKSUM-SH256 - export a SHA-256 checksum that is independent of IDs
--                                   and can be compared across instances and workspaces.
--                                 - READABLE_YAML - export a readable version of the application meta-data
--                                   in YAML format.
-- * p_split:                   If `TRUE`, splits the definition into discrete elements that can be
--                              stored in separate files. If `FALSE`, the result is a single file.
-- * p_with_date:               If `TRUE`, include export date and time in the result.
-- * p_with_ir_public_reports:  If `TRUE`, include public reports that a user saved.
-- * p_with_ir_private_reports: If `TRUE`, include private reports that a user saved.
-- * p_with_ir_notifications:   If `TRUE`, include report notifications.
-- * p_with_translations:       If `TRUE`, include application translation mappings and all text from the
--                              translation repository.
-- * p_with_pkg_app_mapping:    This parameter is obsolete.
-- * p_with_original_ids:       If `TRUE`, export with the IDs as they were when the application was imported.
-- * p_with_no_subscriptions:   If `FALSE`, components contain subscription references.
-- * p_with_comments:           If `TRUE`, include developer comments.
-- * p_with_supporting_objects: - If `Y`, export supporting objects.
--                              - If `I`, automatically install on import.
--                              - If `N`, do not export supporting objects.
--                              - If `NULL`, the application's 'Include in Export' deployment value is
--                                used.
-- * p_with_acl_assignments:    If `TRUE`, export ACL user role assignments.
-- * p_components:              - If not `NULL`, export only given components (array elements
--                                should be of form `<type>:<name>`, e.g.  `PAGE:42`, or `MESSAGE:12345`).
--                              - Use `%` to indicate that all components of the given type should be exported,
--                                for example: `LOV:%` exports all Lists of Values contained in the application.
--                              - See view `APEX_APPL_EXPORT_COMPS` for components that can be exported.
-- * p_with_audit_info:         Specifies the detail of audit information to include:
--                                 - NULL - export will not include any audit information
--                                 - NAMES_AND_DATES - export will include created on, created by, updated
--                                   on, updated by values if they exist.
--                                 - DATES_ONLY - export will include created on and updated on values if
--                                   they exists. User names will not be included.
-- * p_with_runtime_instances   An array with components for which to export runtime instance data. 
--                              For example, WORKFLOW can be specified to export all Workflow Instances together
--                              with the application.
--
-- Returns:
-- A table of `apex_t_export_file`. Unless the caller passes `p_split=>true` to the function, the
-- result will be a single file.
--
-- Example:
--  This SQLcl code fragment spools the definition of application `100` into
--  file `f100.sql`.
--
--     variable name     varchar2(255)
--     variable contents clob
--     declare
--         l_files apex_t_export_files;
--     begin
--         l_files   := apex_export.get_application(p_application_id => 100);
--         :name     := l_files(1).name;
--         :contents := l_files(1).contents;
--     end;
--     /
--     set feed off echo off head off flush off termout off trimspool on
--     set long 100000000 longchunksize 32767
--     col name new_val name
--     select :name name from sys.dual;
--     spool &name.
--     print contents
--     spool off
--==============================================================================
function get_application (
    p_application_id          in number,
    p_type                    in t_export_type       default c_type_application_source,
    p_split                   in boolean             default false,
    p_with_date               in boolean             default false,
    p_with_ir_public_reports  in boolean             default false,
    p_with_ir_private_reports in boolean             default false,
    p_with_ir_notifications   in boolean             default false,
    p_with_translations       in boolean             default false,
    p_with_pkg_app_mapping    in boolean             default false,  -- Ignore: obsolete
    p_with_original_ids       in boolean             default false,
    p_with_no_subscriptions   in boolean             default false,
    p_with_comments           in boolean             default false,
    p_with_supporting_objects in varchar2            default null,
    p_with_acl_assignments    in boolean             default false,
    p_components              in wwv_flow_t_varchar2 default null,
    p_with_audit_info         in t_audit_type        default null,
    --
    p_with_runtime_instances  in wwv_flow_t_varchar2 default null )
    return wwv_flow_t_export_files;

--==============================================================================
-- This functions extracts and decompresses all the files from a ZIP archive. It is
-- intended for use with the routines in the `APEX_APPLICATION_INSTALL`
-- package and assumes that all of the files in the ZIP archive are in a text format, such as SQL
-- scripts (which must have a `.sql` extension) or simple `README` files.
--
-- Note: All text content in the ZIP file must be encoded as UTF-8.
--
-- Returns:
-- A table of `apex_t_export_file` containing the name and contents (converted
-- to text format) of each file from the ZIP archive.
--
-- Parameters:
-- * p_source_zip: A BLOB containing the ZIP archive.
--
-- Example:
-- The following example fetches an application archive from a remote URL, extracts
-- the files within it, and prints the type and name of the contained application.
--
--     declare
--         l_zip    blob;
--         l_info   apex_application_install.t_file_info;
--     begin
--         l_zip := apex_web_service.make_rest_request_b (
--                      p_url         => 'https://www.example.com/apps/f100.zip',
--                      p_http_method => 'GET' );
--         l_info   := apex_application_install.get_info (
--                      p_source => apex_export.unzip (
--                      p_source_zip => l_zip ) );
--
--         sys.dbms_output.put_line (
--             apex_string.format (
--                 p_message => q'~
--                              !Type ................. %0
--                              !App Name ............. %1
--                              !~',
--                 p0        => l_info.file_type,
--                 p1        => l_info.app_name,
--                 p_prefix  => '!' ));
--     end;
--
-- See Also:
-- APEX_APPLICATION_INSTALL
-- ZIP
--==============================================================================
function unzip (
    p_source_zip in blob )
    return wwv_flow_t_export_files;

--==============================================================================
-- This functions compresses a list of files, usually obtained from one of the `APEX_EXPORT` routines,
-- into a single BLOB containing a ZIP archive.
--
-- All file names within the archive must be unique to prevent the accidental
-- overwriting of files in the application export (an exception raises otherwise).
--
-- Additional files (`p_extra_files`) may be added to the resultant archive, such as a simple
-- `README.txt` file or licensing information.
--
-- Note: All text content in the resultant ZIP file will be encoded as UTF-8.
--
-- Parameters:
-- * p_source_files: A table of files. For example from `APEX_EXPORT.GET_APPLICATION`.
-- * p_extra_files:  Optional additional files to add to the resultant ZIP archive.
--
-- Returns:
-- A BLOB containing the compressed application files and any extra files, in ZIP format.
--
-- Example:
--     declare
--       l_source_files apex_t_export_files;
--       l_extra_files  apex_t_export_files;
--       l_zip          blob;
--     begin
--       l_source_files := apex_export.get_application(
--           p_application_id => 100,
--           p_split          => true );
--
--       l_extra_files := apex_t_export_files(
--           apex_t_export_file(
--               name     => 'README.md',
--               contents => 'An example exported application.' ),
--           apex_t_export_file(
--               name     => 'LICENSE.txt',
--               contents => 'The Universal Permissive License (UPL), Version 1.0' ) );
--
--       l_zip := apex_export.zip(
--           p_source_files => l_source_files,
--           p_extra_files  => l_extra_files );
--
--       sys.dbms_output.put_line(
--           'Compressed application export to zip of size; '
--           || sys.dbms_lob.getLength( l_zip ) );
--     end;
--
-- See Also:
-- APEX_APPLICATION_INSTALL
-- UNZIP
--==============================================================================
function zip (
    p_source_files wwv_flow_t_export_files,
    p_extra_files  wwv_flow_t_export_files default wwv_flow_t_export_files() )
    return blob;

--==============================================================================
-- This function exports the given workspace's static files.
--
-- Parameters:
-- * p_workspace_id: The workspace ID.
-- * p_with_date: If `TRUE`, include export date and time in the result.
--
-- Returns:
-- A table of `apex_t_export_file`. The result is a single file, splitting  into multiple files
-- will be implemented in a future release.
--
-- Example:
-- Export the workspace files of the workspace with ID `12345678`.
--
--     declare
--         l_file apex_t_export_files;
--     begin
--         l_file := apex_export.get_workspace_files (
--                       p_workspace_id => 12345678 );
--     end;
--==============================================================================
function get_workspace_files (
    p_workspace_id in number,
    p_with_date    in boolean default false )
    return wwv_flow_t_export_files;

--==============================================================================
-- This function exports user feedback to the development environment, or developer feedback to
-- the deployment environment.
--
-- Parameters:
-- * p_workspace_id:      The workspace ID.
-- * p_with_date:         If `TRUE`, include export date and time in the result.
-- * p_since:             If set, only export feedback that has been gathered since the
--                        given date.
-- * p_deployment_system: If `NULL`, export user feedback. If not `NULL`, export developer feedback for
--                        the given deployment system.
--
-- Returns:
-- A table of `apex_t_export_file`.
--
-- Example:
-- Export feedback to development environment.
--
--     declare
--         l_file apex_t_export_files;
--     begin
--         l_file := apex_export.get_feedback(p_workspace_id => 12345678);
--     end;
--
-- Example:
-- Export developer feedback in workspace `12345678` since `8-MAR-2010` to
-- deployment environment `EA2`.
--
--     declare
--         l_file apex_t_export_files;
--     begin
--         l_file := apex_export.get_feedback (
--                       p_workspace_id      => 12345678,
--                       p_since             => date'2010-03-08',
--                       p_deployment_system => 'EA2' );
--     end;
--==============================================================================
function get_feedback (
    p_workspace_id      in number,
    p_with_date         in boolean  default false,
    p_since             in date     default null,
    p_deployment_system in varchar2 default null )
    return wwv_flow_t_export_files;

--==============================================================================
-- This function exports the given workspace's definition and users. The optional
-- `p_with_%`parameters which all default to false can be used to include additional
-- information in the export.
--
-- Parameters:
-- * p_workspace_id:          The workspace ID.
-- * p_with_date:             If `TRUE`, include export date and time in the result.
-- * p_with_team_development: If `TRUE`, include team development data.
-- * p_with_misc:             If `TRUE`, include data from SQL Workshop, mail logs, etc. in the export.
--
-- Returns:
-- A table of `apex_t_export_file`.
--
-- Example:
-- Export the definition of workspace #12345678.
--
--     declare
--         l_files apex_t_export_files;
--     begin
--         l_files := apex_export.get_workspace(p_workspace_id => 12345678);
--     end;
--==============================================================================
function get_workspace (
    p_workspace_id          in number,
    p_with_date             in boolean default false,
    p_with_team_development in boolean default false,
    p_with_misc             in boolean default false )
    return wwv_flow_t_export_files;

--==============================================================================
-- Internal:
--
-- When called, the application export will NOT call
--
--   set transaction isolation level serializable
--
-- to produce a consistent export when calling GET_APPLICATION.
-- This should only be used if running into "ORA-01555 Snapshot too old" and the
-- UNDO tablespace can't be extended.
--==============================================================================
procedure disable_export_consistency;

end wwv_flow_export_api;
/
show err
