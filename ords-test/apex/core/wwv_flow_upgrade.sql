set define '^' verify off
prompt ...wwv_flow_upgrade.sql
create or replace package wwv_flow_upgrade as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2001, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_upgrade
--
--    DESCRIPTION
--      This package facilitates flows upgrades.
--      Follow the following steps to upgrade:
--      1. Install a new version of flows into a "new flows" schema.
--      2. Login to sqlplus as the "new flows" user.
--      3. exec wwv_flow_upgrade.copy_flow_meta_data('FLOWS1','FLOWS2')
--         assume flows1 is the old schema and flows2 is the new schema.
--      4. Review the upgrade log (see example query)
--      5. exec wwv_flow_upgrade.recreate_public_synonyms('FLOWS2')
--
--    NOTES
--      Example Log Query:
--         column upgrade_sequence format 9999
--         column upgrade_action format a44 wrapped
--         column upgrade_error format a50 wrapped
--         column upgrade_command format a50 wrapped
--         set linesize 160
--         set pagesize 1000
--         select upgrade_sequence, upgrade_action, upgrade_error, upgrade_command
--         from   wwv_flow_upgrade_progress
--         order by upgrade_id desc, upgrade_sequence desc
--
--      Example Log Query 2:
--         column upgrade_sequence format 9999
--         column upgrade_action format a44 wrapped
--         column upgrade_error format a50 wrapped
--         column upgrade_command format a50 wrapped
--         set linesize 160
--         set pagesize 1000
--         select upgrade_sequence, upgrade_action, upgrade_error, upgrade_command
--         from   wwv_flow_upgrade_progress
--         order by upgrade_id desc, upgrade_sequence
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa    07/03/2001 - Created
--
--------------------------------------------------------------------------------

type t_pref is record (
    name            wwv_flow_platform_prefs.name%type,
    value           wwv_flow_platform_prefs.value%type,
    pref_desc       wwv_flow_platform_prefs.pref_desc%type,
    created_on      wwv_flow_platform_prefs.created_on%type,
    last_updated_on wwv_flow_platform_prefs.last_updated_on%type );
type t_prefs is table of t_pref index by pls_integer;

g_row_cnt              number := 0;
g_prefs                t_prefs;

subtype t_install_phase is varchar2(6);
c_phase_pre           constant t_install_phase := 'PRE';
c_phase_hot           constant t_install_phase := 'HOT';
c_phase_post_1        constant t_install_phase := 'POST_1';
c_phase_post_2        constant t_install_phase := 'POST_2';

subtype t_job_type is pls_integer range 1..8;
c_job_type_automation constant t_job_type := 1;
c_job_type_rest_sync  constant t_job_type := 2;
c_job_type_standard   constant t_job_type := 3;
c_job_type_task_exp   constant t_job_type := 4;
c_job_type_pwa_push   constant t_job_type := 5;
c_job_type_wf_timeout constant t_job_type := 6;
c_job_type_task_purge constant t_job_type := 7;
c_job_type_wf_purge   constant t_job_type := 8;

c_cdn        constant varchar2(255) := 'https://static.oracle.com/cdn/apex/';

--==============================================================================
procedure init (
    p_owner in varchar2,
    p_phase in t_install_phase default null );

--==============================================================================
procedure disable_cons_and_trg (
   p_owner_name        in varchar2,
   p_object_name       in varchar2 );

--==============================================================================
procedure enable_cons_and_trg (
   p_owner_name        in varchar2,
   p_object_name       in varchar2 );

--==============================================================================
-- drop public synonyms to flow objects
--
-- sqlplus example:
--    exec wwv_flow_upgrade.drop_public_synonyms;
--==============================================================================
procedure drop_public_synonyms (
    p_drop_all in boolean default false );

--==============================================================================
-- create public synonyms only without dropping or granting
-- sqlplus example:
--    exec wwv_flow_upgrade.create_public_synonyms('FLOWS2')
--==============================================================================
procedure create_public_synonyms (
   p_owner_to          in varchar2 );

--==============================================================================
-- issue grants to public synonyms only without dropping or creating
-- sqlplus example:
--    exec wwv_flow_upgrade.grant_public_synonyms('FLOWS2')
--==============================================================================
procedure grant_public_synonyms (
   p_owner_to          in varchar2 );

--==============================================================================
-- create all needed public synonyms for a flows environment.
--
-- sqlplus example:
--    exec wwv_flow_upgrade.recreate_public_synonyms('FLOWS2')
--==============================================================================
procedure recreate_public_synonyms (
   p_owner_to          in varchar2 );

--==============================================================================
-- drop private synonyms
-- sqlplus example:
--    exec wwv_flow_upgrade.drop_private_synonyms
--==============================================================================
procedure drop_private_synonyms;

--==============================================================================
-- create private synonyms
-- sqlplus example:
--    exec wwv_flow_upgrade.create_private_synonyms('FLOWS2')
--==============================================================================
procedure create_private_synonyms (
   p_owner_to          in varchar2 );

--==============================================================================
-- Copy flows meta data from once schema to another.
--
-- sqlplus example:
--    exec wwv_flow_upgrade.copy_flow_meta_data('FLOWS1','FLOWS2')
--==============================================================================
procedure copy_flow_meta_data (
   p_owner_from        in varchar2,
   p_owner_to          in varchar2,
   p_cdb_install       in varchar2 default 'NO' );

--==============================================================================
procedure drop_upgrade_triggers (
    p_from in varchar2 );

--==============================================================================
-- revert phase2, so old schema is usable again
--==============================================================================
procedure rollback_phase2 (
    p_from in varchar2 );

--==============================================================================
-- Remove dev-only jobs for a schema
--==============================================================================
procedure remove_dev_jobs (
    p_owner     in varchar2 );

--==============================================================================
-- Remove all of the standard dbms_jobs for a schema
--==============================================================================
procedure remove_jobs;

--==============================================================================
-- Create dev-only jobs for a schema
--==============================================================================
procedure create_dev_jobs (
    p_owner     in varchar2 );

--==============================================================================
-- Create all of the standard dbms_jobs for a given schema
--==============================================================================
procedure create_jobs (
    p_owner     in varchar2 );

--==============================================================================
-- In new APEX instances, jobs in the APEX_nnnnnn schema are created disabled by
-- default. Creating the first app workspace automatically enables the jobs via
-- this procedure.
--==============================================================================
procedure enable_internal_jobs(
    p_job_type in t_job_type );

--==============================================================================
-- Create the proper grants and synonyms for the flows_files schema
-- used for file upload / download
--==============================================================================
procedure flows_files_objects_create (
    p_flow_owner    in varchar2,
    p_owner         in varchar2 default 'FLOWS_FILES' );

--==============================================================================
-- Remove the proper grants and synonyms for the flows_files schema
-- used for file upload / download
--==============================================================================
procedure flows_files_objects_remove (
    p_flow_owner    in varchar2,
    p_owner         in varchar2 default 'FLOWS_FILES' );

--==============================================================================
procedure meta_cleanup (
    p_from      in varchar2,
    P_to        in varchar2 );

--==============================================================================
procedure report_column_cleanup;

--==============================================================================
procedure template_name_cleanup(
    p_owner     in varchar2);

--==============================================================================
-- This procedure should be run after an additional copy of flows is installed,
-- as it is the final step in the upgrade process.
-- Once this procedure is run, you will be running in the new version of flows.
-- This will:
--     1.  Remove all old scheduler jobs.
--     2.  If upgrading: Copy session and user related metadata.
--     3.  Create all new public synonyms
--     4.  Perform all necessary grants on public synoyms.
--     5.  If p_create_jobs is true (the default): Create all new jobs.
--==============================================================================
procedure switch_schemas (
    p_from        in varchar2,
    p_to          in varchar2,
    p_create_jobs in boolean default true );

--==============================================================================
-- Merge APEX web entry points into the ORDS PL/SQL gateway allow list, which
-- was added in ORDS 22.2.
--
-- Parameters:
-- * p_to:             The APEX target schema (e.g. wwv_flow.g_flow_schema_owner).
-- * p_mode:           One of
--                     - INS: Insert the (CUSTOM) entry point for
--                       p_procedure_name.
--                     - DEL: Delete the (CUSTOM) entry point for
--                       p_procedure_name.
--                     - SYNC: Sync all INTERN and LEGACY APEX entries in the
--                       allow list, ignore CUSTOM ones. This mode is used for
--                       APEX upgrades and for enabling/disabling LEGACY
--                       entries.
-- * p_procedure_name: Qualified name of the procedure that should be synced,
--                     e.g. MYPACKAGE.PROC. Ignored when p_mode is SYNC.
--==============================================================================
procedure sync_ords_gateway_allow_list (
    p_to             in varchar2,
    p_mode           in varchar2,
    p_procedure_name in varchar2 default null );

--==============================================================================
-- Copy and migrate metadata in POST phase. The switch_schemas procedure above
-- creates a DB job to run this procedure.
--==============================================================================
procedure copy_post_metadata (
    p_from      in varchar2,
    p_to        in varchar2 );

--==============================================================================
-- Copys old preferences from schema1.WWV_FLOW_PLATFORM_PREFS
-- to schema2.WWV_FLOW_PLATFORM_PREFS
--==============================================================================
procedure copy_prefs (
    p_owner_from        in varchar2,
    p_owner_to          in varchar2 );

--==============================================================================
-- Native Plug-ins can have attributes of scope APPLICATION. This procedure will
-- make sure that new attributes or new plug-ins are added for existing applications.
--==============================================================================
procedure update_plugin_settings (
    p_to in varchar2 );

function to_template_id(
  p_in varchar2)
  return number;

procedure upgrade_to_latest (
    p_owner             in varchar2,
    p_from              in varchar2)
    ;

procedure upgrade_wwv_flow_flash_chart (
    p_flash_chart in wwv_flow_flash_charts%rowtype );

procedure upgrade_flash_to_jet (
    p_flash_chart_id in number );

procedure upgrade_flash_series_to_jet (
    p_series in wwv_flow_flash_chart5_series%rowtype );

procedure upgrade_html_chart (
    p_plug in wwv_flow_page_plugs%rowtype );

procedure upgrade_svg_chart (
    p_plug       in wwv_flow_page_plugs%rowtype);

procedure upgrade_svg_chart_series (
    p_plug        in wwv_flow_page_plugs%rowtype,
    p_series_id   in number,
    p_a001        in varchar2 default null,
    p_a002        in varchar2 default null,
    p_a003        in varchar2 default null,
    p_a004        in varchar2 default null,
    p_a005        in varchar2 default null );

procedure sw_cleanup (
    p_from    in varchar2,
    p_to      in varchar2)
    ;

procedure enable_ws_constraints (
    p_to      in varchar2 )
    ;

--==============================================================================
-- HTML-escapes a string without affecting item references like &P1_ITEM.
--==============================================================================
function escape_but_allow_items (
    p_input   in varchar2 )
    return varchar2;

--==============================================================================
-- Set the patch status to APPLYING
--
-- PARAMETERS
--   * p_from: The schema you upgraded from
--==============================================================================
procedure set_patch_applying (
    p_from in varchar2 default wwv_flow.g_flow_schema_owner );

--==============================================================================
-- Set the patch status to APPLIED
--
-- PARAMETERS
--   * p_from: The schema you upgraded from
--==============================================================================
procedure set_patch_applied (
    p_from in varchar2 default wwv_flow.g_flow_schema_owner );

--==============================================================================
-- Sets the table comment and column comments in bulk to reduce network roundtrips
--
-- PARAMETERS
--   * p_table_name: The table name
--   * p_table_comment: The table comment
--   * p_column_comments: A plist of column names and column comments
--==============================================================================
procedure add_table_comments (
    p_table_name        in varchar2,
    p_table_comment     in varchar2,
    p_column_comments   in wwv_flow_t_varchar2 );

--==============================================================================
-- Comments out a block of JS code by prepending "//" to each line
-- Adds a dummy function( options ) { return options; } at the start.
-- Adds a new line at the end to avoid commenting out any appended code.
--
-- Useful for disabling legacy Init JS Code during upgrades.
-- The final content will be truncated at 4000 characters if it exceeds.
-- A null input will not be changed.
--
-- Example:
-- ```
-- function( options ){
--     options.foo = LEGACY_API.func();
--     return options;
-- }
-- ```
--
-- will become:
--
-- ```
-- function( options ){ return options; }
-- //function( options ){
-- //    options.foo = LEGACY_API.func();
-- //    return options;
-- //}
--
-- ```
--
-- PARAMETERS
--   * p_code: The JS code
--==============================================================================
function comment_out_init_js_code (
    p_code in varchar2 )
    return varchar2;

--==============================================================================
-- To be used when migrating components from the plug-in attribute_xx columns
-- to the new JSON attributes structure.
--
-- This function reads the plug-in metadata for the attribute keys and builds
-- a JSON of type:
--
-- {
--  "{statid id of plugin attribute with sequence 1}": "{value of p_attribute_01}",
--  "{statid id of plugin attribute with sequence 2}": "{value of p_attribute_02}",
--  ...
-- }
--
-- Returns the stringified JSON as a CLOB which can be used directly in update statements.
--
--==============================================================================
function legacy_attributes_to_json (
    p_app_id        in number,
    p_plugin_name   in varchar2,
    p_plugin_type   in varchar2,
    p_attribute_01  in varchar2,
    p_attribute_02  in varchar2,
    p_attribute_03  in varchar2,
    p_attribute_04  in varchar2,
    p_attribute_05  in varchar2,
    p_attribute_06  in varchar2,
    p_attribute_07  in varchar2,
    p_attribute_08  in varchar2,
    p_attribute_09  in varchar2,
    p_attribute_10  in varchar2,
    p_attribute_11  in varchar2,
    p_attribute_12  in varchar2,
    p_attribute_13  in varchar2,
    p_attribute_14  in varchar2,
    p_attribute_15  in varchar2,
    p_attribute_16  in varchar2,
    p_attribute_17  in varchar2,
    p_attribute_18  in varchar2,
    p_attribute_19  in varchar2,
    p_attribute_20  in varchar2,
    p_attribute_21  in varchar2,
    p_attribute_22  in varchar2,
    p_attribute_23  in varchar2,
    p_attribute_24  in varchar2,
    p_attribute_25  in varchar2 )
    return clob;

--==============================================================================
-- Selectively handle template component attribute escaping
--==============================================================================
procedure migrate_ut_template_components (
    p_application_id  in number   default null );

--
--
--==============================================================================
-- creates a new json object with attribute_NN  hardcoded keys
-- {
--     "key1": "...",
--     "key2": "...",
--     ...
-- }
-- the values are always strings
-- null values are omitted
--
--==============================================================================
function create_attributes_json (
    p_plugin_name  in varchar2 default null,
    p_attr_scope   in varchar2,
    p_attributes   in wwv_flow_t_varchar2 )
    return sys.json_object_t;
--
end wwv_flow_upgrade;
/
show errors
