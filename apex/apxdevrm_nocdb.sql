Rem  Copyright (c) 2007, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxdevrm_nocdb.sql
Rem
Rem    DESCRIPTION
Rem      This is the development environment removal script for Oracle APEX.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   06/26/2007 - Created

set define '^'
set concat on
set concat .
set verify off
set serveroutput on size unlimited
set feedback off

define PREFIX = '@'
define INSTALL_TYPE = 'DEVRM'
define TIMING_ALL_VALUES = ""

@^PREFIX.core/scripts/set_appun.sql

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=true';
exception
    when invalid_alter_priv then
        null;
end;
/

column foo3 new_val LOG1
select 'removedev'||to_char(sysdate,'YYYY-MM-DD_HH24-MI-SS')||'.log' foo3 from sys.dual;
spool ^LOG1

set termout on

--==============================================================================
@^PREFIX.core/scripts/timing_start.sql "Bootstrapping"
--==============================================================================
begin
    ^APPUN..wwv_install_api.begin_install (
        p_install_type => '^INSTALL_TYPE.',
        p_schema       => '^APPUN' );
    ^APPUN..wwv_install_api.begin_phase (
        p_phase        => 1 );
end;
/
set errorlogging on table ^APPUN..WWV_INSTALL_ERRORS

alter session set current_schema = SYS;

ALTER SESSION SET recyclebin = OFF;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Revoking Dev-Only Grants"
@^PREFIX.core/runtime_grant_revoke.sql

alter session set current_schema = ^APPUN;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Dev-Only Packages"

drop package wwv_flow_approval_dev;
drop package wwv_flow_workflow_dev;
drop package wwv_flow_ai_dev;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing SYS view wrappers"

drop view apex_sys_all_synonyms;
drop view apex_sys_all_objects;
drop view apex_sys_all_constraints;
drop view apex_sys_all_dependencies;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Dev-Only Views"

drop view wwv_flow_wf_activities_dev;
drop view wwv_flow_workflow_cparams_dev;
drop view wwv_flow_workflow_branches_dev;
drop view wwv_flow_workflow_vars_dev;
drop view wwv_flow_plugins_dev;
drop view wwv_flow_component_actions_dev;
drop view wwv_flow_search_result_dev;
drop view wwv_flow_advisor_result_dev;
drop view wwv_flow_ws_operations_dev;
drop view wwv_flow_ws_oper_param_dev;
drop view wwv_flow_page_proc_ws_parm_dev;
drop view wwv_flow_worksheet_col_grp_dev;
drop view wwv_flow_worksheet_rpts_dev;
drop view wwv_flow_ig_reports_dev;
drop view wwv_flow_steps_dev;
drop view wwv_flow_page_plugs_dev;
drop view wwv_flow_region_rpt_dev;
drop view wwv_flow_region_plugin_dev;
drop view wwv_flow_region_print_dev;
drop view wwv_flow_map_regions_dev;
drop view wwv_flow_map_layers_dev;
drop view wwv_flow_cards_dev;
drop view wwv_flow_region_rpt_col_dev;
drop view wwv_flow_worksheet_col_dev;
drop view wwv_flow_region_columns_dev;
drop view wwv_flow_ig_columns_dev;
drop view wwv_flow_step_items_dev;
drop view wwv_flow_filters_dev;
drop view wwv_flow_step_branches_dev;
drop view wwv_flow_jet_axes_dev;
drop view wwv_flow_jet_series_dev;
drop view wwv_flow_cals_dev;
drop view wwv_flow_page_da_events_dev;
drop view wwv_flow_page_da_actions_dev;
drop view wwv_flow_visible_flows;
drop view wwv_flow_object_owners_dev;
drop view wwv_flow_objects_dev;
drop view wwv_flow_tables_views_dev;
drop view wwv_flow_detail_tables_dev;
drop view wwv_flow_table_columns_dev;
drop view wwv_flow_sequences_dev;
drop view wwv_flow_trigger_source_dev;
drop view wwv_flow_jobs_dev;
drop view wwv_credentials_dev;
drop view wwv_remotesql_servers_dev;
drop view wwv_flow_data_view;
drop view wwv_flow_page_types_dev;
drop view wwv_flow_lovs_dev;
drop view wwv_flow_data_profiles_dev;
drop view wwv_flow_data_profile_cols_dev;
drop view wwv_flow_automations_dev;
drop view wwv_flow_substitutions_dev;
drop view wwv_flow_install_subst_dev;
drop view wwv_flow_pages_dev;
drop view wwv_flow_web_src_params_dev;
drop view wwv_flow_web_src_cparams_dev;
drop view wwv_flow_search_configs_dev;
drop view wwv_flow_invokeapi_cparams_dev;
drop view wwv_flow_step_processing_dev;
drop view wwv_flow_web_src_opers_dev;
drop view wwv_flow_diff_export_left_dev;
drop view wwv_flow_diff_export_right_dev;
drop view wwv_flow_diff_comp_export_dev;
drop view wwv_flow_diff_page_changes;
drop view wwv_flow_diff_page_locks;
drop view wwv_main_apps_dev;
drop view wwv_working_copy_apps_dev;
drop view wwv_flow_auth_scheme_usage_dev;
drop view wwv_flow_subscribed_comp_dev;
drop view wwv_flow_ai_usage_dev;
drop view wwv_flow_ai_config_usage_dev;
drop view wwv_flow_build_opt_usage_dev;
drop view wwv_flow_worksheets_dev;
drop view wwv_flow_interactive_grids_dev;
drop view wwv_flow_plugin_settings_dev;
drop view wwv_flow_src_arr_cols_dev;
drop view wwv_flow_shared_qry_stmts_dev;
drop view wwv_flow_report_layouts_dev;
drop view wwv_flow_doc_src_usage_dev;
drop view wwv_flow_f4000_lov_cols;
drop view wwv_flow_restds_usage_dev;
drop view wwv_flow_lov_usage_dev;
drop view wwv_flow_list_usage_dev;
drop view wwv_flow_email_usage_dev;
drop view wwv_flow_task_def_usage_dev;
drop view wwv_flow_sublist_usage_dev;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Theme Dev-Only Views"

drop view wwv_theme_styles;
drop view wwv_theme_files;
drop view wwv_theme_page_templates;
drop view wwv_theme_region_templates;
drop view wwv_theme_report_templates;
drop view wwv_theme_list_templates;
drop view wwv_theme_item_templates;
drop view wwv_theme_button_templates;
drop view wwv_theme_breadcrumb_templates;
drop view wwv_theme_calendar_templates;
drop view wwv_theme_popup_lov_templates;
drop view wwv_theme_template_opt_groups;
drop view wwv_theme_template_options;
drop view wwv_theme_template_components;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Team Development objects"

drop package wwv_flow_team_api;
drop package wwv_flow_team_gen_api;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Re-Installing Runtime Views"


@^PREFIX.core/view.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Other packages"


drop package wwv_flow_wizard_api;
drop package wwv_flow_form_region_dev;
drop package wwv_flow_lov_dev;
drop package wwv_flow_upgrade_app;
drop package wwv_flow_translation_utilities;
drop package wwv_flow_region_layout;
drop function wwv_flow_lov_used_on_pages;
drop package wwv_flow_query_builder;
drop package wwv_flow_sw_object_feed;
drop package wwv_flow_load_data;
drop package wwv_flow_copy_metadata;
drop package wwv_flow_copy_util;
drop package wwv_flow_tab_mgr;
drop package wwv_flow_generate_ddl;
drop package wwv_flow_table_drill;
drop package wwv_flow_copy_page;
drop package wwv_flow_generate_table_api;
drop package wwv_flow_gen_hint;
drop procedure apex_admin;
drop procedure htmldb_admin;
drop package wwv_flow_session_mon;
drop package wwv_flow_sw_page_calls;
drop package wwv_flow_wiz_confirm;
drop package wwv_flow_page_map;
drop package wwv_flow_dataload_xml;
drop package apex_ui_default_update;
drop package wwv_flow_ui_default_update_int;
drop package wwv_flow_dictionary_dev;
drop package wwv_flow_advisor_checks_api;
drop package wwv_flow_advisor_checks_int;
drop package wwv_flow_advisor_dev;
drop package wwv_flow_builder_search_dev;
drop package wwv_flow_f4000_plugins;
drop package wwv_flow_4000_ui;
drop package wwv_flow_4050_ui;
drop package wwv_flow_4100_ui;
drop package wwv_flow_4350_ui;
drop package wwv_flow_workspace_reports;
drop package wwv_flow_create_app_from_query;
drop package wwv_flow_dev;
drop package wwv_flow_theme_dev;
drop package wwv_flow_template_dev;
drop package wwv_flow_code_exec_mle_dev;
drop package wwv_flow_user_interface_dev;
drop package wwv_flow_page_dev;
drop package wwv_flow_file_editor_dev;
drop package wwv_flow_lang_dev;
drop package wwv_flow_mail_dev;
drop package wwv_flow_pwa_dev;
drop package wwv_flow_f4500_ob_dev;
drop package wwv_flow_f4500_ob_wiz_dev;
drop package wwv_flow_working_copy_dev;
drop package wwv_flow_component_group_dev;
drop package wwv_flow_shared_component_api;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Create Blueprint App Wizard"


drop package wwv_flow_define_app_v3;
drop package wwv_flow_create_app_v3;
drop package wwv_flow_app_feature_v3;
drop package wwv_flow_app_shared_comp_v3;
drop package wwv_flow_create_app_log_v3;
drop package wwv_flow_blueprint_v3;
drop package wwv_flow_app_def_v3;
drop package wwv_flow_app_def_api_v3;
drop table wwv_flow_blueprint_repo cascade constraints;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Fusion Apps wizard support packages"

drop package wwv_flow_fa_meta_dev;
drop package wwv_flow_fa_util_dev;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Quick SQL"


drop package wwv_qs_dev;
drop table wwv_qs_models cascade constraints;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing REST Workshop"

drop package wwv_flow_rest_ws;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Other Packages"


drop package wwv_flow_dynamic_action_dev;
drop package wwv_flow_authentication_dev;
drop package wwv_flow_error_dev;
drop package wwv_flow_export_dev;
drop package wwv_flow_property_dev;
drop package wwv_flow_credential_dev;
drop package wwv_flow_remote_server_dev;
drop package wwv_flow_remote_deploy_dev;
drop package wwv_flow_data_profile_dev;
drop package wwv_flow_web_src_dev;
drop package wwv_flow_doc_src_dev;
drop package wwv_flow_web_src_sync_dev;
drop package wwv_flow_automation_dev;
drop package wwv_flow_map_region_dev;
drop package wwv_flow_authorization_dev;
drop package wwv_flow_f4000_util;
drop package wwv_flow_plugin_dev;
drop package wwv_flow_code_exec_dev;
drop package wwv_flow_exec_dev;
drop package wwv_flow_search_dev;
drop package wwv_flow_theme_manager;
drop package wwv_flow_report_query_dev;
drop package wwv_flow_report_layout_dev;
drop package wwv_flow_maint_dev;
drop package wwv_data_reporter_dev_api;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Spotlight Search"

drop package wwv_flow_spotlight_dev;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Sample Dataset"

drop package wwv_sample_dataset;
drop table wwv_sample_dmls cascade constraints;
drop table wwv_sample_ddls cascade constraints;
drop table wwv_sample_dataset_companies cascade constraints;
drop table wwv_sample_json cascade constraints;
drop table wwv_sample_dataset_languages cascade constraints;
drop table wwv_sample_languages cascade constraints;
drop table wwv_sample_datasets cascade constraints;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Dictionary Cache"

drop package wwv_dictionary_cache_dev;
drop table wwv_dictionary_cache_log    cascade constraints;
drop table wwv_dictionary_cache_obj    cascade constraints;
drop table wwv_dictionary_cache_col    cascade constraints;
drop table wwv_dictionary_cache_fkcon  cascade constraints;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Report Package"

drop package wwv_flow_report_dev;
drop package wwv_flow_faceted_search_dev;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Issues Application"

drop package wwv_flow_issue_int;
drop package wwv_flow_issue_notify_int;
drop package wwv_flow_issue_seed_int;

drop table wwv_flow_label_groups cascade constraints;
drop table wwv_flow_labels cascade constraints;
drop table wwv_flow_milestones cascade constraints;
drop table wwv_flow_issues cascade constraints;
drop table wwv_flow_issue_attachments cascade constraints;
drop table wwv_flow_issue_stakeholders cascade constraints;
drop table wwv_flow_issue_comments cascade constraints;
drop table wwv_flow_issue_events cascade constraints;
drop table wwv_flow_issue_milestones cascade constraints;
drop table wwv_flow_issue_labels cascade constraints;
drop table wwv_flow_issue_templates cascade constraints;
drop table wwv_flow_issue_notifications cascade constraints;
drop table wwv_flow_issue_email_prefs cascade constraints;

drop view apex_issues;
drop view apex_issue_events;
drop view apex_issue_comments;
drop view apex_issue_attachments;
drop view apex_issue_stakeholders;
drop view apex_issue_milestones;
drop view apex_issue_label_groups;
drop view apex_issue_labels;
drop view apex_issue_label_relation;
drop view apex_issue_milestone_relation;
drop view apex_issue_email_prefs;
drop view apex_issue_notifications;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Application Backup feature"


drop package wwv_flow_backup;

begin
    delete from wwv_flow_file_objects$ where file_type = 'FLOW_BACKUP' and id in (select object_id from wwv_flow_backups$);
    commit;
end;
/

drop table wwv_flow_backups$;
drop table wwv_flow_backup_log;
drop view wwv_flow_workspace_backups;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing DBMS_CLOUD Data Loading" support
drop package wwv_dbms_cloud;
drop package wwv_flow_data_loader_dev;
drop package wwv_flow_soda_dev;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing REST Source Catalogs"
drop package wwv_web_src_catalog_api;
drop package wwv_web_src_catalog;

drop view apex_rest_catalog_groups;
drop view apex_rest_catalogs;
drop view apex_rest_catalog_plugins;
drop view apex_rest_catalog_services;

drop table wwv_web_src_catalog_plugins;
drop table wwv_web_src_catalog_services;
drop table wwv_web_src_catalogs;
drop table wwv_web_src_catalog_groups;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Object Dependency Reports"
drop package wwv_flow_object_dependency_dev;
drop package wwv_flow_object_dependency_api;

drop view apex_used_db_obj_dependencies;
drop view apex_used_db_objects;
drop view apex_used_db_object_comp_props;

drop view wwv_flow_obj_dep_entries;
drop view wwv_used_db_object_comp_props;
drop view wwv_used_db_objects;
drop view wwv_used_db_obj_dependencies;

drop table wwv_flow_used_obj_dependencies;
drop table wwv_flow_used_db_objects;
drop table wwv_flow_used_obj_comp_props;

begin
    wwv_flow.g_import_in_progress := true;
    update wwv_flows
       set last_dependency_analyzed_at = null
     where last_dependency_analyzed_at is not null;
    wwv_flow.g_import_in_progress := false;
    commit;
exception when others then
    wwv_flow.g_import_in_progress := false;
    raise;
end;
/

--==============================================================================
@^PREFIX.core/scripts/reset_state_and_show_invalid.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Dev-Only Jobs"

begin
    wwv_flow_upgrade.remove_dev_jobs(p_owner => '^APPUN.');
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Recompiling ^APPUN."


exec sys.utl_recomp.recomp_parallel(schema => '^APPUN.');

@^PREFIX.core/scripts/reset_state_and_show_invalid.sql SYS,FLOWS_FILES,^APPUN

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Public Synonyms"


begin
    wwv_flow_upgrade.drop_public_synonyms();
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Private Synonyms"


begin
    wwv_flow_upgrade.drop_private_synonyms;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Disabling Workspace Purge"


begin
    wwv_flow_platform.set_preference( p_preference_name => 'PURGE_ENABLED', p_preference_value => 'N' );
    commit;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Internal Development Applications"


declare
    l_app sys.dbms_sql.number_table;
begin
    wwv_flow_security.g_security_group_id := 10;

    l_app(l_app.count+1) := 4000;
    l_app(l_app.count+1) := 4020;
    l_app(l_app.count+1) := 4050;
    l_app(l_app.count+1) := 4100;
    l_app(l_app.count+1) := 4300;
    l_app(l_app.count+1) := 4350;
    l_app(l_app.count+1) := 4400;
    l_app(l_app.count+1) := 4500;
    l_app(l_app.count+1) := 4550;
    l_app(l_app.count+1) := 4700;
    l_app(l_app.count+1) := 4750;
    l_app(l_app.count+1) := 4800;
    l_app(l_app.count+1) := 4850;

    for i in 1..l_app.count loop
        for j in 0..9 loop
            wwv_flow_imp.remove_application( l_app(i)+j );
        end loop;
    end loop;
    commit;
end;
/


--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Validating Installation"

alter session set current_schema = SYS;

alter session set recyclebin = ON;

exec validate_apex;
--==============================================================================
@^PREFIX.core/scripts/timing_stop.sql
begin
    ^APPUN..wwv_install_api.end_phase (
        p_phase       => 1,
        p_raise_error => false );
    ^APPUN..wwv_install_api.end_install;
end;
/
--==============================================================================
spool off

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=false';
exception
    when invalid_alter_priv then
        null;
end;
/

column global_name new_value gname
set termout off
select user global_name from sys.dual;
set termout on
set heading on
set feedback on
set sqlprompt '^gname> '

