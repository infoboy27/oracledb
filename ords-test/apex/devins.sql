Rem  Copyright (c) 2007, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      devins.sql
Rem
Rem    DESCRIPTION
Rem      This is the development installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by apexins.sql or apxdvins.sql.
Rem
Rem    NOTES
Rem      Ensure that all arguments (except image prefix) are entered in UPPERCASE.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    Arguments:
Rem      1 - LOG1      = Installation log file
Rem      2 - APPUN     = APEX schema name
Rem      3 - TEMPTBL   = Temporary tablespace
Rem      4 - IMGPR     = Image prefix
Rem      5 - DATTS     = APEX tablespace
Rem      6 - FF_TBLS   = APEX files tablespace
Rem      7 - ADM_PWD   = APEX administrator password
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   06/26/2007 - Created

set define '^'
set concat on
set concat .
set verify off

define LOG1      = '^1'
define APPUN     = '^2'
define TEMPTBL   = '^3'
define IMGPR     = '^4'
define DATTS     = '^5'
define FF_TBLS   = '^6'
define ADM_PWD   = '^7'
define PREFIX    = '^8'


set termout on

alter session set current_schema = SYS;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Dev Grants"

@^PREFIX.core/dev_grants.sql

alter session set current_schema = ^APPUN;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Creating Dev-Only Tables and Triggers"

@^PREFIX.core/dev_tabs.sql
@^PREFIX.core/dev_triggers.sql

@^PREFIX.core/scripts/install_action.sql "Installing Package Specs (Dev)"

@^PREFIX.core/wwv_flow_code_exec_dev.sql
@^PREFIX.core/wwv_flow_exec_dev.sql

@^PREFIX.core/wwv_flow_lang_dev.sql
@^PREFIX.core/wizapi.sql
@^PREFIX.core/wwv_flow_form_region_dev.sql
@^PREFIX.core/wwv_flow_lov_dev.sql
@^PREFIX.core/wwv_flow_theme_dev.sql
@^PREFIX.core/wwv_flow_template_dev.sql
@^PREFIX.core/wwv_flow_plugin_dev.sql
@^PREFIX.core/wwv_flow_mail_dev.sql

prompt Installing SYS view wrappers
@^PREFIX.core/apex_sys_all_views.sql

prompt Installing Team Development objects
@^PREFIX.core/wwv_flow_team_api.sql
@^PREFIX.core/wwv_flow_team_gen_api.sql

@^PREFIX.core/wwv_flow_code_exec_mle_dev.sql
@^PREFIX.core/wwv_flow_upgrade_app.sql
@^PREFIX.core/wwv_flow_translation_utilities.sql
@^PREFIX.core/layout.sql
@^PREFIX.core/wwv_lov_used_on_pages.sql
@^PREFIX.core/wwv_flow_query_builder.sql
@^PREFIX.core/wwv_flow_sw_object_feed.sql
@^PREFIX.core/wwv_flow_load_data.sql
@^PREFIX.core/wwv_flow_shared_component_api.sql
@^PREFIX.core/copy_metadata.sql
@^PREFIX.core/copyu.sql
@^PREFIX.core/wwv_flow_tab_mgr.sql
@^PREFIX.core/generate_ddl.sql
@^PREFIX.core/table_drill.sql
@^PREFIX.core/wwv_flow_copy_page.sql
@^PREFIX.core/generate_table_api.sql
@^PREFIX.core/wwv_flow_gen_hint.sql
@^PREFIX.core/apex_admin.sql
@^PREFIX.core/wwv_flow_session_mon.sql
@^PREFIX.core/wwv_flow_sw_page_calls.sql
@^PREFIX.core/wwv_flow_wiz_confirm.sql
@^PREFIX.core/wwv_flow_page_map.sql
@^PREFIX.core/wwv_flow_dataload_xml.sql
@^PREFIX.core/apex_ui_default_update.sql
@^PREFIX.core/wwv_flow_ui_default_update_int.sql
@^PREFIX.core/wwv_flow_dictionary_dev.sql
@^PREFIX.core/wwv_flow_advisor_checks_api.sql
@^PREFIX.core/wwv_flow_advisor_checks_int.sql
@^PREFIX.core/wwv_flow_advisor_dev.sql
@^PREFIX.core/wwv_flow_builder_search_dev.sql
@^PREFIX.core/wwv_flow_f4000_plugins.sql
@^PREFIX.core/wwv_flow_f4000_util.sql
@^PREFIX.core/wwv_flow_4000_ui.sql
@^PREFIX.core/wwv_flow_4050_ui.sql
@^PREFIX.core/wwv_flow_4100_ui.sql
@^PREFIX.core/wwv_flow_4350_ui.sql
@^PREFIX.core/wwv_flow_workspace_reports.sql
@^PREFIX.core/wwv_flow_create_app_from_query.sql
@^PREFIX.core/wwv_flow_dev.sql
@^PREFIX.core/wwv_flow_automation_dev.sql
@^PREFIX.core/wwv_flow_approval_dev.sql
@^PREFIX.core/wwv_flow_workflow_dev.sql
@^PREFIX.core/wwv_flow_map_region_dev.sql
@^PREFIX.core/wwv_flow_authorization_dev.sql
@^PREFIX.core/wwv_flow_user_interface_dev.sql
@^PREFIX.core/wwv_flow_page_dev.sql
@^PREFIX.core/wwv_flow_file_editor_dev.sql
@^PREFIX.core/wwv_flow_f4500_ob_dev.sql
@^PREFIX.core/wwv_flow_f4500_ob_wiz_dev.sql
@^PREFIX.core/wwv_flow_working_copy_dev.sql
@^PREFIX.core/wwv_flow_ai_dev.sql
@^PREFIX.core/wwv_flow_component_group_dev.sql


prompt ...install Create Blueprint package spec
@^PREFIX.core/modules/create_app_wiz/create_app_tab.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_define_app.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_create_app.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_app_feature.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_app_shared_comp.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_create_app_log.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_blueprint.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_app_def.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_app_def_api.sql

prompt ...install Fusion Apps wizard support specs
@^PREFIX.core/modules/create_app_wiz/wwv_flow_fa_meta_dev.sql
@^PREFIX.core/modules/create_app_wiz/wwv_flow_fa_util_dev.sql

prompt ...install Quick SQL spec
@^PREFIX.core/modules/quicksql/wwv_qs_tables.sql
@^PREFIX.core/modules/quicksql/wwv_qs_dev.sql

prompt ...install REST Workshop spec
@^PREFIX.core/modules/rest_ws/wwv_flow_rest_ws.sql

@^PREFIX.core/wwv_flow_dynamic_action_dev.sql
@^PREFIX.core/wwv_flow_authentication_dev.sql
@^PREFIX.core/wwv_flow_error_dev.sql
@^PREFIX.core/wwv_flow_export_dev.sql
@^PREFIX.core/wwv_flow_property_dev.sql
@^PREFIX.core/wwv_flow_credential_dev.sql
@^PREFIX.core/wwv_flow_remote_server_dev.sql
@^PREFIX.core/wwv_flow_remote_deploy_dev.sql
@^PREFIX.core/wwv_flow_data_profile_dev.sql
@^PREFIX.core/wwv_flow_web_src_dev.sql
@^PREFIX.core/wwv_flow_web_src_sync_dev.sql
@^PREFIX.core/wwv_flow_doc_src_dev.sql

prompt ...install Spotlight Search package spec
@^PREFIX.core/wwv_flow_spotlight_dev.sql

prompt ...install Sample Dataset spec
@^PREFIX.core/wwv_sample_tab.sql
@^PREFIX.core/wwv_sample_install_data.sql
@^PREFIX.core/wwv_sample_dmls_projects.sql
@^PREFIX.core/wwv_sample_dmls_empdept.sql
@^PREFIX.core/wwv_sample_dmls_oehr.sql
@^PREFIX.core/wwv_sample_dmls_spreadsheet.sql
@^PREFIX.core/wwv_sample_dmls_custorders.sql
@^PREFIX.core/wwv_sample_dmls_country.sql
@^PREFIX.core/wwv_sample_dmls_health.sql
@^PREFIX.core/wwv_sample_dataset.sql

prompt ...install Dictionary Cache package spec
@^PREFIX.core/wwv_dictionary_cache_dev.sql

prompt ...install Report package spec
@^PREFIX.core/wwv_flow_report_dev.sql
@^PREFIX.core/wwv_flow_faceted_search_dev.sql

prompt  ...install Issues App objects
@^PREFIX.core/modules/issues/wwv_flow_issue_int.sql
@^PREFIX.core/modules/issues/wwv_flow_issue_notify_int.sql
@^PREFIX.core/modules/issues/wwv_flow_issue_seed_int.sql
@^PREFIX.core/modules/issues/wwv_flow_issue_tables.sql
@^PREFIX.core/modules/issues/wwv_flow_issue_triggers.sql
@^PREFIX.core/modules/issues/apex_issue_views.sql

prompt ... install Auto Backup objects
@^PREFIX.core/modules/auto_backup/wwv_flow_backup_tables.sql
@^PREFIX.core/modules/auto_backup/wwv_flow_backup_triggers.sql
@^PREFIX.core/modules/auto_backup/wwv_flow_backup_views.sql
@^PREFIX.core/modules/auto_backup/wwv_flow_backup.sql

prompt ... install DBMS_CLOUD data loading support objects
@^PREFIX.core/wwv_dbms_cloud.sql
@^PREFIX.core/wwv_flow_data_loader_dev.sql

@^PREFIX.core/wwv_flow_soda_dev.sql

@^PREFIX.core/modules/catalog/wwv_web_src_catalog_api.sql
@^PREFIX.core/modules/catalog/wwv_web_src_catalog.sql
@^PREFIX.core/modules/catalog/catalog_apex_views.sql

@^PREFIX.core/wwv_flow_pwa_dev.sql
@^PREFIX.core/wwv_flow_search_dev.sql

@^PREFIX.core/wwv_flow_theme_manager.sql

@^PREFIX.core/wwv_flow_report_query_dev.sql
@^PREFIX.core/wwv_flow_report_layout_dev.sql

@^PREFIX.core/wwv_flow_maint_dev.sql
@^PREFIX.core/wwv_data_reporter_dev_api.sql

prompt ... install Object Dependency Reports
@^PREFIX.core/modules/object_dependencies/object_dependencies_tables.sql
@^PREFIX.core/modules/object_dependencies/object_dependencies_triggers.sql
@^PREFIX.core/modules/object_dependencies/object_dependencies_views.sql
@^PREFIX.core/modules/object_dependencies/wwv_flow_object_dependency_api.sql
@^PREFIX.core/modules/object_dependencies/wwv_flow_object_dependency_dev.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing Views (Dev)"

@^PREFIX.core/theme_dev_views.sql
@^PREFIX.core/dev_views.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing Package Bodies (Dev)"


alter session set "_LOAD_WITHOUT_COMPILE" = plsql;

@^PREFIX.core/wwv_flow_lang_dev.plb
@^PREFIX.core/wizapi.plb
@^PREFIX.core/wwv_flow_form_region_dev.plb
@^PREFIX.core/wwv_flow_lov_dev.plb
@^PREFIX.core/wwv_flow_theme_dev.plb
@^PREFIX.core/wwv_flow_template_dev.plb
@^PREFIX.core/wwv_flow_plugin_dev.plb
@^PREFIX.core/wwv_flow_mail_dev.plb

@^PREFIX.core/wwv_flow_code_exec_dev.plb
@^PREFIX.core/wwv_flow_exec_dev.plb
@^PREFIX.core/wwv_flow_code_exec_mle_dev.plb
@^PREFIX.core/wwv_flow_upgrade_app.plb
@^PREFIX.core/layout.plb
@^PREFIX.core/wwv_flow_query_builder.plb
@^PREFIX.core/wwv_flow_sw_object_feed.plb
@^PREFIX.core/wwv_flow_load_data.plb
@^PREFIX.core/copy_metadata.plb
@^PREFIX.core/copyu.plb
@^PREFIX.core/wwv_flow_tab_mgr.plb
@^PREFIX.core/generate_ddl.plb
@^PREFIX.core/table_drill.plb
@^PREFIX.core/wwv_flow_copy_page.plb
@^PREFIX.core/generate_table_api.plb
@^PREFIX.core/wwv_flow_gen_hint.plb
@^PREFIX.core/wwv_flow_translation_utilities.plb
@^PREFIX.core/wwv_flow_session_mon.plb
@^PREFIX.core/wwv_flow_sw_page_calls.plb
@^PREFIX.core/wwv_flow_wiz_confirm.plb
@^PREFIX.core/wwv_flow_page_map.plb
@^PREFIX.core/wwv_flow_dataload_xml.plb
@^PREFIX.core/apex_ui_default_update.plb
@^PREFIX.core/wwv_flow_ui_default_update_int.plb
@^PREFIX.core/wwv_flow_dictionary_dev.plb
@^PREFIX.core/wwv_flow_advisor_checks_api.plb
@^PREFIX.core/wwv_flow_advisor_checks_int.plb
@^PREFIX.core/wwv_flow_advisor_dev.plb
@^PREFIX.core/wwv_flow_builder_search_dev.plb
@^PREFIX.core/wwv_flow_f4000_plugins.plb
@^PREFIX.core/wwv_flow_f4000_util.plb
@^PREFIX.core/wwv_flow_4000_ui.plb
@^PREFIX.core/wwv_flow_4050_ui.plb
@^PREFIX.core/wwv_flow_4100_ui.plb
@^PREFIX.core/wwv_flow_4350_ui.plb
@^PREFIX.core/wwv_flow_team_api.plb
@^PREFIX.core/wwv_flow_team_gen_api.plb
@^PREFIX.core/wwv_flow_workspace_reports.plb
@^PREFIX.core/wwv_flow_create_app_from_query.plb
@^PREFIX.core/wwv_flow_dev.plb
@^PREFIX.core/wwv_flow_user_interface_dev.plb
@^PREFIX.core/wwv_flow_page_dev.plb
@^PREFIX.core/wwv_flow_dynamic_action_dev.plb
@^PREFIX.core/wwv_flow_authentication_dev.plb
@^PREFIX.core/wwv_flow_error_dev.plb
@^PREFIX.core/wwv_flow_export_dev.plb
@^PREFIX.core/wwv_flow_property_dev.plb
@^PREFIX.core/wwv_flow_credential_dev.plb
@^PREFIX.core/wwv_flow_remote_server_dev.plb
@^PREFIX.core/wwv_flow_remote_deploy_dev.plb
@^PREFIX.core/wwv_flow_data_profile_dev.plb
@^PREFIX.core/wwv_flow_web_src_dev.plb
@^PREFIX.core/wwv_flow_web_src_sync_dev.plb
@^PREFIX.core/wwv_flow_doc_src_dev.plb
@^PREFIX.core/wwv_flow_automation_dev.plb
@^PREFIX.core/wwv_flow_approval_dev.plb
@^PREFIX.core/wwv_flow_workflow_dev.plb
@^PREFIX.core/wwv_flow_map_region_dev.plb
@^PREFIX.core/wwv_flow_authorization_dev.plb
@^PREFIX.core/wwv_flow_file_editor_dev.plb
@^PREFIX.core/wwv_flow_f4500_ob_dev.plb
@^PREFIX.core/wwv_flow_f4500_ob_wiz_dev.plb
@^PREFIX.core/wwv_flow_working_copy_dev.plb
@^PREFIX.core/wwv_flow_ai_dev.plb
@^PREFIX.core/wwv_flow_component_group_dev.plb
@^PREFIX.core/wwv_flow_shared_component_api.plb

prompt ...install Create Blueprint App Wizard package body
@^PREFIX.core/modules/create_app_wiz/wwv_flow_define_app.plb
@^PREFIX.core/modules/create_app_wiz/wwv_flow_app_shared_comp.plb
@^PREFIX.core/modules/create_app_wiz/wwv_flow_create_app.plb
@^PREFIX.core/modules/create_app_wiz/wwv_flow_app_feature.plb
@^PREFIX.core/modules/create_app_wiz/wwv_flow_create_app_log.plb
@^PREFIX.core/modules/create_app_wiz/wwv_flow_blueprint.plb
@^PREFIX.core/modules/create_app_wiz/wwv_flow_app_def.plb
@^PREFIX.core/modules/create_app_wiz/wwv_flow_app_def_api.plb

prompt ...install Fusion Apps wizard support package bodies
@^PREFIX.core/modules/create_app_wiz/wwv_flow_fa_meta_dev.plb
@^PREFIX.core/modules/create_app_wiz/wwv_flow_fa_util_dev.plb

prompt ...install Quick SQL package body
@^PREFIX.core/modules/quicksql/wwv_qs_dev.plb
@^PREFIX.core/modules/quicksql/sample_models.sql

prompt ...install REST Workshop package body
@^PREFIX.core/modules/rest_ws/wwv_flow_rest_ws.plb

prompt ...install Spotlight Search package body
@^PREFIX.core/wwv_flow_spotlight_dev.plb

prompt ...install Sample Dataset package body
@^PREFIX.core/wwv_sample_dataset.plb

prompt ...install Dictionary Cache package body
@^PREFIX.core/wwv_dictionary_cache_dev.plb

prompt ...install Report package body
@^PREFIX.core/wwv_flow_report_dev.plb
@^PREFIX.core/wwv_flow_faceted_search_dev.plb

prompt ... install Issues Application pakage body
@^PREFIX.core/modules/issues/wwv_flow_issue_int.plb
@^PREFIX.core/modules/issues/wwv_flow_issue_notify_int.plb
@^PREFIX.core/modules/issues/wwv_flow_issue_seed_int.plb

prompt ... install Auto Backup package body
@^PREFIX.core/modules/auto_backup/wwv_flow_backup.plb

prompt ... install DBMS_CLOUD data loading support package body
@^PREFIX.core/wwv_dbms_cloud.plb
@^PREFIX.core/wwv_flow_data_loader_dev.plb

@^PREFIX.core/wwv_flow_soda_dev.plb

@^PREFIX.core/modules/catalog/wwv_web_src_catalog_api.plb
@^PREFIX.core/modules/catalog/wwv_web_src_catalog.plb

@^PREFIX.core/wwv_flow_pwa_dev.plb
@^PREFIX.core/wwv_flow_search_dev.plb

@^PREFIX.core/wwv_flow_theme_manager.plb

@^PREFIX.core/wwv_flow_report_query_dev.plb
@^PREFIX.core/wwv_flow_report_layout_dev.plb

@^PREFIX.core/wwv_flow_maint_dev.plb
@^PREFIX.core/wwv_data_reporter_dev_api.plb

prompt ... install Object Dependency Report package bodies
@^PREFIX.core/modules/object_dependencies/wwv_flow_object_dependency_api.plb
@^PREFIX.core/modules/object_dependencies/wwv_flow_object_dependency_dev.plb

alter session set "_LOAD_WITHOUT_COMPILE" = none;
