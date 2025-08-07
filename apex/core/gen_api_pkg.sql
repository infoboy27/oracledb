set define '^' verify off
prompt ...wwv_flow_gen_api
create or replace package wwv_flow_gen_api2 is
--------------------------------------------------------------------------------
--
--  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
--
--    NAME
--      gen_api_pkg.sql
--
--    DESCRIPTION
--      Generate API calls to create objects from database
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  05/20/2000 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- The component type and ID uniquely define which component to export.
--==============================================================================
type t_component is record (
    component    varchar2(255),
    component_id number
);
type t_components is table of t_component;

--==============================================================================
-- This type describes how IDs (and other installation specific data, like app
-- id, schema, workspace) should be exported.
--
-- * c_id_unchanged: Export IDs as they are in the application metadata.
-- * c_id_original: Export IDs by subtracting the wwv_flows.import_id_offset.
-- * c_id_relative: Map IDs as they are found to sequential numbers starting at
--   1.
--==============================================================================
subtype t_id_mode is pls_integer range 1..3;
c_id_unchanged constant t_id_mode := 1;
c_id_original  constant t_id_mode := 2;
c_id_relative  constant t_id_mode := 3;

--==============================================================================
g_id_offset            number  := 0;
g_exp_region_col_width boolean := true;

--==============================================================================
-- Output target (see e.g. wwv_flow_export_int)
--==============================================================================
g_writer               wwv_flow_t_writer := wwv_flow_t_htp_writer();
g_splitter_basedir     varchar2(255);
g_splitter_files       wwv_flow_t_export_files;

--##############################################################################
--#
--# Application / Component Export
--#
--##############################################################################

--==============================================================================
-- Utility function to convert from a p_with_original_ids parameter to
-- t_id_mode.
--==============================================================================
function to_id_mode (
    p_with_original_ids in boolean )
    return t_id_mode;

--==============================================================================
-- Initializes the get_id generation based on the mode in p_with_id_mode.
--==============================================================================
procedure init_id_generation (
    p_application_id in number,
    p_with_id_mode   in t_id_mode );

--==============================================================================
-- Function which returns the passed in p_id, with the original id, unchanged
-- or relative.
-- Note: init_id_generation has to be called before this function.
--==============================================================================
function get_id (
    p_id in number )
    return number;

--==============================================================================
-- This procedure exports flows
--
-- p_flow_id...................Unique ID number of your flow
-- p_format....................Output format UNIX, DOS, DB, XML
-- p_commit....................Generate a commit statement at end of script (YES or NO)
-- p_owner_override............Set the application owner to this USER and not the current flows owner attribute
-- p_flashback_min_ago.........Set the export procedure to use flashback mode
-- p_file_id...................Use optionally when exporting into DB format
-- p_export_comments...........Export comments in with the file
-- p_export_ir_public_reports..Export public interactive report and grid
-- p_export_ir_private_reports.Export private interactive report and grid
-- p_export_ir_notifications...Export interactive report and grid subscriptions
-- p_export_pkg_app_mapping....Export mapping between the application and packaged application if it exists
-- p_debugging_override........Set the application debugging status to this value (1 = Yes, 0 = No)
-- p_components................The components of the page that should be exported (everything if null).
-- p_with_original_ids.........If true, export with original workspace id, application id and component ids
--                             Otherwise, use the current ids.
--                             Setting this flag to true helps to diff/merge changes from different workspaces.
-- p_with_acl_assignments .....Export ACL role assignments
-- p_with_runtime_instances....Import runtime instances for the given components (e.g. WORKFLOW)
--==============================================================================
procedure export (
    p_flow_id                   in number,
    p_format                    in varchar2            default 'UNIX',
    p_commit                    in varchar2            default 'YES',
    p_owner_override            in varchar2            default null,
    p_build_status_override     in varchar2            default 'NO',
    p_flashback_min_ago         in number              default null,
    p_file_id                   in number              default null,
    p_export_sup_objects        in varchar2            default null,
    p_export_comments           in varchar2            default 'N',
    p_export_ir_public_reports  in varchar2            default 'N',
    p_export_ir_private_reports in varchar2            default 'N',
    p_export_ir_notifications   in varchar2            default 'N',
    p_export_translations       in varchar2            default 'N',
    p_export_pkg_app_mapping    in varchar2            default 'N',
    p_debugging_override        in number              default null,
    p_exclude_subscriptions     in boolean             default false,
    p_components                in t_components        default null,
    p_with_id_mode              in t_id_mode           default c_id_unchanged,
    p_with_date                 in boolean             default true,
    p_with_acl_assignments      in boolean             default false,
    p_with_install              in boolean             default true,
    p_ignore_working_copy       in boolean             default false,
    p_export_for_merge          in boolean             default false,
    p_with_audit_info           in varchar2            default null,
    --
    p_with_runtime_instances    in wwv_flow_t_varchar2 default null );

--==============================================================================
-- exposed emit procedures to be used within other packages
--==============================================================================
procedure w_param (
    p_column_name          in varchar2,
    p_value                in varchar2,
    p_add_comma            in boolean  default true,
    p_write_null           in boolean  default false );

--------------------------------------------------------------------------------
procedure w_param (
    p_column_name          in varchar2,
    p_value                in timestamp with time zone,
    p_add_comma            in boolean                  default true );

--------------------------------------------------------------------------------
procedure w_param (
    p_column_name          in varchar2,
    p_value                in boolean,
    p_add_comma            in boolean  default true );

--------------------------------------------------------------------------------
procedure w_param (
    p_column_name          in varchar2,
    p_value                in timestamp,
    p_add_comma            in boolean  default true );
    
--------------------------------------------------------------------------------
procedure w_param_attributes (
    p_value in clob );

--------------------------------------------------------------------------------
procedure w_call (
    p_procedure_name       in varchar2,
    p_id                   in number   default null,
    p_add_offset           in boolean  default true );

--------------------------------------------------------------------------------
procedure w_unquoted (
    p_column_name in varchar2,
    p_value       in varchar2,
    p_add_comma   in boolean   default true );

--------------------------------------------------------------------------------
procedure w (
    p_text                 in varchar2 default null );

--------------------------------------------------------------------------------
function v (
    p_str in varchar2 default null )
    return varchar2;

--------------------------------------------------------------------------------
function clob_to_varchar2_tab (
    p_clob in clob )
    return sys.dbms_sql.varchar2_table;

--------------------------------------------------------------------------------
procedure w_offset (
    p_column_name          in varchar2,
    p_value                in number,
    p_add_comma            in boolean  default true );

--------------------------------------------------------------------------------
procedure show_begin (
    p_type                 in varchar2 default null,
    p_name                 in varchar2 default null,
    p_show_component_begin in boolean  default true,
    p_manifest             in varchar2 default null );

--------------------------------------------------------------------------------
procedure show_end (
    p_show_component_end   in boolean  default true );

--------------------------------------------------------------------------------
procedure w_call_end;

--------------------------------------------------------------------------------
procedure w_audit_info (
    p_created_by               in varchar2,
    p_created_on               in date,
    p_updated_by               in varchar2,
    p_updated_on               in date,
    p_created_by_column        in varchar2 default 'created_by',
    p_created_on_column        in varchar2 default 'created_on',
    p_updated_by_column        in varchar2 default 'updated_by',
    p_updated_on_column        in varchar2 default 'updated_on',
    p_include_null_dates       in boolean  default false,
    p_add_comma                in boolean  default true );

--------------------------------------------------------------------------------
procedure set_with_audit_info (
    p_with_audit_info          in varchar2 default null );

--##############################################################################
--#
--# Flow Component Export
--#
--##############################################################################

--==============================================================================
-- p_flow_id........Unique ID number of your flow
-- p_format.........Output format UNIX, DOS, DB, XML
-- p_commit.........Generate a commit statement at end of script (YES or NO)
--==============================================================================
procedure export_theme (
    p_flow_id               in number,
    p_theme_id              in number,
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES',
    p_with_audit_info       in varchar2 default null );

--==============================================================================

procedure export_restful_services (
    p_format    in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES',
    p_include_script_header in boolean  default true,
    p_include_groups        in boolean  default true,
    p_with_audit_info       in varchar2 default null );


procedure export_restful_service (
    p_module_id        in number,
    p_format           in varchar2 default 'UNIX',
    p_commit           in varchar2 default 'YES',
    p_with_audit_info  in varchar2 default null );


--##############################################################################
--#
--# File Component Export
--#
--##############################################################################

procedure export_workspace_static_files (
    p_format          in varchar2 default 'UNIX',
    p_commit          in varchar2 default 'YES',
    p_with_audit_info in varchar2 default null );

procedure export_workspace_objects (
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES',
    p_include_script_header in boolean  default true,
    p_with_audit_info       in varchar2 default null );

--##############################################################################
--#
--# Other Exports
--#
--##############################################################################

procedure export_script (
    p_format           in varchar2 default 'UNIX',
    p_commit           in varchar2 default 'YES',
    p_with_audit_info  in varchar2     default null );

procedure export_feedback_to_development (
    p_id              in number   default null,
    p_since           in date     default null,
    p_format          in varchar2 default 'UNIX',
    p_commit          in varchar2 default 'YES',
    p_with_audit_info in varchar2 default null );

procedure export_feedback_to_deployment (
    p_deployment_system in varchar2,
    p_id                in number   default null,
    p_since             in date     default null,
    p_format            in varchar2 default 'UNIX',
    p_commit            in varchar2 default 'YES',
    p_with_audit_info   in varchar2 default null );

procedure export_ir_reports (
    p_report_ids      in wwv_flow_t_number,
    p_with_audit_info in varchar2 default null );

procedure export_extension_links (
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES',
    p_include_script_header in boolean  default true,
    p_with_audit_info       in varchar2 default null );

procedure export_extension_grants (
    p_format                in varchar2 default 'UNIX',
    p_commit                in varchar2 default 'YES',
    p_include_script_header in boolean  default true,
    p_with_audit_info       in varchar2 default null );

--##############################################################################
--#
--# Other Functions
--#
--##############################################################################
procedure file_open (
    p_format             in varchar2,
    p_set_application_id in boolean   default false,
    p_with_id_mode       in t_id_mode default c_id_unchanged );

procedure file_close (
    p_commit              in boolean,
    p_is_component_export in boolean default false );

--##############################################################################
--#
--# Patch Utilities
--#
--##############################################################################

--==============================================================================
-- Generate an update statement for use in APEX dev team patch scripts.
--
-- EXAMPLE
--   Generate statement to update region name and read-only attributes of wwv_flow_page_plugs.
--
--     exec wwv_flow_gen_api2.gen_update_stmt('WWV_FLOW_PAGE_PLUGS','REGION_NAME,READ', 12345678);
--
--   Output:
--
--     update wwv_flow_page_plugs
--        set region_name              = 'current region name',
--            plug_read_only_when_type = 'current value',
--            plug_read_only_when      = wwv_flow_utilities.join(wwv_flow_t_varchar2(
--     'multi-line',
--     'also supported')),
--            plug_read_only_when2     = null
--     where security_group_id = 10
--       and flow_id           between 4000 and 4009
--       and id                between 12345678 and 12345678.9999;
--
--==============================================================================
procedure gen_update_stmt (
    p_table_name  in varchar2,
    p_columns_csv in varchar2,
    p_id          in number );

--==============================================================================
-- Returns a padded 5 digit page id or just the number if >= 100000.
--==============================================================================
function fpage (
    p_page_id in number )
    return varchar2;

end wwv_flow_gen_api2;
/
show error
