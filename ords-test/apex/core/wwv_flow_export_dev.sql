set define '^' verify off
prompt ...wwv_flow_export_dev.sql
create or replace package wwv_flow_export_dev as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2024. All Rights Reserved.
--
-- NAME
--   wwv_flow_export_dev.sql
--
-- DESCRIPTION
--   Builder utilities for application export.
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  07/15/2019 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- The component type and ID uniquely define which component to export.
--==============================================================================
subtype t_component  is wwv_flow_gen_api2.t_component;
subtype t_components is wwv_flow_gen_api2.t_components;

--==============================================================================
-- Export multiple components of an application.
--
-- PARAMETERS
-- * p_application_id:         The application ID.
-- * p_owner_override:
-- * p_export_sup_objects:
-- * p_export_components:
-- * p_export_ir_public_reports:
-- * p_export_ir_private_reports:
-- * p_export_ir_notifications:
-- * p_export_translations:
-- * p_build_status_override:
-- * p_debugging_override:
-- * p_with_original_ids:      Contain the application component IDs as of the last import of this application
-- * p_split:                  Split export into multiple files.
-- * p_readable_format:        If true, a readable version of the export will be included
--                             in YAML format
-- * p_flashback_min_ago:      If not null, export using flashback.
-- * p_with_audit_info:        When null, no audit information included in the export.
--                             When DATES_ONLY then created_on, last_updated_on dates included.
--                             When NAMES_AND_DATES then created_by and last_updated_by included in addition to dates.
--==============================================================================
procedure export_application (
    p_application_id            in number,
    p_owner_override            in varchar2,
    p_export_sup_objects        in varchar2,
    p_export_components         in varchar2,
    p_export_ir_public_reports  in varchar2,
    p_export_ir_private_reports in varchar2,
    p_export_ir_notifications   in varchar2,
    p_export_translations       in varchar2,
    p_build_status_override     in varchar2,
    p_debugging_override        in varchar2,
    p_with_original_ids         in varchar2,
    p_split                     in boolean,
    p_readable_format           in boolean,
    p_flashback_min_ago         in number,
    p_with_audit_info           in varchar2 default null);

--==============================================================================
-- Export multiple components of an application.
--
-- PARAMETERS
-- * p_application_id:         The application ID.
-- * p_components:             The components to export.
-- * p_format:                 One of
--                             - UNIX, DOS: Export via HTP with different line endings
--                             - DB: Export to wwv_flow_files
-- * p_export_translations_yn: If Y, then also export translated versions of
--                             components. Note that translated text messages
--                             always live in the main app.
-- * p_flashback_min_ago:      If not null, export using flashback.
-- * p_with_install:           Do not create installation file when false. Used when creating a split export.
-- * p_with_audit_info:        When null, no audit information included in the export.
--                             When DATES_ONLY then created_on, last_updated_on dates included.
--                             When NAMES_AND_DATES then created_by and last_updated_by included in addition to dates.
--==============================================================================
procedure export_components (
    p_application_id         in number,
    p_components             in t_components,
    p_format                 in varchar2,
    p_export_translations_yn in varchar2,
    p_flashback_min_ago      in number,
    p_with_install           in boolean  default true,
    p_with_audit_info        in varchar2 default null);

--==============================================================================
-- Export an application page.
--
-- PARAMETERS
-- * p_application_id:         The application ID.
-- * p_page_id:                The page.
-- * p_include_sql:            Include SQL script(s) to install the jpage
-- * p_include_readable        Include Readable format (YAML) for the page
-- * p_split                   (only applicable of p_include_sql = true) Split
--                             SQL scripts for the page, shared components, etc.
-- * p_with_original_ids:      Contain the application component IDs as of the last import of this application
-- * p_flashback_min_ago:      If not null, export using flashback.
-- * p_with_audit_info:        When null, no audit information included in the export.
--                             When DATES_ONLY then created_on, last_updated_on dates included.
--                             When NAMES_AND_DATES then created_by and last_updated_by included in addition to dates.
--
-- Note: at least one of p_include_sql and/or p_include_readable must be set.
--
-- RESULT
-- The file format downloaded will depend on the options selected:
--
--   p_include_sql p_include_readable p_split format
--   ============= ================== ======= ======
--   true          false              false   SQL (default)
--   true          false              true    ZIP containing separate SQL scripts
--   true          true               false   ZIP containing single SQL + a YAML file
--   true          true               true    ZIP containing separate SQL scripts + YAML
--   false         true               n/a     YAML
--==============================================================================
procedure export_page (
    p_application_id    in number,
    p_page_id           in number,
    p_include_sql       in boolean default true,
    p_include_readable  in boolean default false,
    p_split             in boolean default false,
    p_with_original_ids in boolean default false,
    p_flashback_min_ago in number  default null, 
    p_with_audit_info   in varchar2 default null);

--==============================================================================
-- Export a theme.
--
-- PARAMETERS
-- * p_application_id:         The application ID.
-- * p_theme:                  The theme.
-- * p_format:                 One of
--                             - UNIX, DOS: Export via HTP with different line endings
--                             - DB: Export to wwv_flow_files
-- * p_with_audit_info:        When null, no audit information included in the export.
--                             When DATES_ONLY then created_on, last_updated_on dates included.
--                             When NAMES_AND_DATES then created_by and last_updated_by included in addition to dates.
--==============================================================================
procedure export_theme (
    p_application_id  in number,
    p_theme_id        in number,
    p_format          in varchar2,
    p_with_audit_info in varchar2 default null);

--==============================================================================
-- Export a plugin.
--
-- PARAMETERS
-- * p_application_id:         The application ID.
-- * p_plugin_id:              The plugin ID.
-- * p_format:                 One of
--                             - UNIX, DOS: Export via HTP with different line endings
--                             - DB: Export to wwv_flow_files
-- * p_with_audit_info:        When null, no audit information included in the export.
--                             When DATES_ONLY then created_on, last_updated_on dates included.
--                             When NAMES_AND_DATES then created_by and last_updated_by included in addition to dates.
--==============================================================================
procedure export_plugin (
    p_application_id  in number,
    p_plugin_id       in number,
    p_format          in varchar2,
    p_with_audit_info in varchar2 default null);

--==============================================================================
-- Export feedback to development/deployment system.
--
-- PARAMETERS
-- * p_export_type:            TO_DEVELOPMENT if feedback to development.
--                             TO_DEPLOYMENT if feedback to deployment system.
-- * p_deployment_system:      Deployment system name.
-- * p_since:                  If set, only export feedback that has been
--                             gathered since the given date.
-- * p_format:                 One of
--                             - UNIX, DOS: Export via HTP with different line endings
--                             - DB: Export to wwv_flow_files
-- * p_with_audit_info:        When null, no audit information included in the export.
--                             When DATES_ONLY then created_on, last_updated_on dates included.
--                             When NAMES_AND_DATES then created_by and last_updated_by included in addition to dates.
--==============================================================================
procedure export_feedback (
    p_export_type        in varchar2,
    p_deployment_system  in varchar2,
    p_since              in date,
    p_format             in varchar2,
    p_with_audit_info    in varchar2 default null);

--==============================================================================
-- Copy an application:
--
-- PARAMETERS
-- * p_old_application_id:     The ID of the existing application.
-- * p_new_application_id:     The ID of the new application.
-- * p_new_name:               The name of the new application.
-- * p_export_sup_objects:     Should supporting objects be copied? (Y/N)
--==============================================================================
procedure copy_application (
    p_old_application_id   in number,
    p_new_application_id   in number,
    p_new_name             in varchar2,
    p_export_sup_objects   in varchar2,
    p_with_acl_assignments in boolean default false );

--==============================================================================
-- Add selected values to the multi-component export (collection
-- MULTI_COMPONENT_EXPORT).
--
-- PARAMETERS
-- * p_application_id:         The ID of the existing application.
-- * p_selected:               A collection of strings of the form
--                             [id]:[type_name]:[hex-encoded name]
--==============================================================================
procedure add_to_component_export (
    p_application_id in number,
    p_selected       in wwv_flow_global.vc_arr2 );

--==============================================================================
-- Export the embedded code of the application specified. The procedure will
-- call the internal wwv_flow_export_int.get_embedded_code() procedure to retrieve
-- the table of files/source and then write them to a ZIP file.
-- The procedure then handles returning the file and setting the appropriate
-- mime-type and header information.
--
-- PARAMETERS
-- * p_application_id:         The ID of the existing application.
--==============================================================================
procedure export_embedded_code (
    p_application_id            in number );

--==============================================================================
-- Return a checksum for the given application and page.
--
-- PARAMETERS
-- * p_application_id:         The application ID.
-- * p_page_id:                The page ID.
--==============================================================================
function page_checksum (
    p_application_id           in number,
    p_page_id                  in number )
    return varchar2;

end wwv_flow_export_dev;
/
show err
