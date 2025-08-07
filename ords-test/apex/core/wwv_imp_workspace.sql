set define '^' verify off
prompt ...wwv_imp_workspace.sql
create or replace package wwv_imp_workspace as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_imp_workspace.sql
--
--    DESCRIPTION
--     Interface to create workspace components
--
--    MODIFIED (MM/DD/YYYY)
--    cczarski  09/08/2021 - Created
--
-----------------------------------------------------------------------------------------------------------------------

--==============================================================================
-- constants
--==============================================================================
c_empty_varchar2_table    sys.dbms_sql.varchar2_table;

c_y                       constant varchar2(1 CHAR) := 'Y';
c_n                       constant varchar2(1 CHAR) := 'N';

--==============================================================================
procedure set_calling_version(
    p_version in number );

procedure set_calling_release(
    p_release in varchar2 );

--==============================================================================
procedure set_original_app_values(
    p_original_security_group_id  in number,
    p_original_application_id     in number,
    p_original_owner              in wwv_flows.import_orig_owner%type,
    p_original_id_offset          in number );

--==============================================================================
--
-- B E G I N   A N D   E N D   O F   I M P O R T   H E L P E R S
--
--==============================================================================
procedure load_group_info (
    p_application_id                  in number );

--=================================================================================
procedure relink_group_info (
    p_application_id                  in number,
    p_id_offset                       in number,
    p_old_id_offset                   in number,
    p_original_id_offset              in number );

--==============================================================================
--
-- A P P L I C A T I O N
--
--==============================================================================

--==============================================================================
-- This procedure creates the description of a flow.
-- A flow is made up of zero or more pages as well as
-- other "flow level" attributes.
--
-- obsolete attributes
--   P_SECURITY_GROUP_ID (derived from "set credentials" call)
--   P_WEBDB_TEMPLATE (included for compatability replaced with p_default_page_template)
--   P_WEBDB_LOGGING (included for compatability replaced with p_page_view_logging)
--   P_PAGE_RANGE_MINIMUM (included so old flows will still create)
--   P_PAGE_RANGE_MAXIMUM (included so old flows will still create)
--
-- new arguments not yet implemented
--   P_GLOBAL_ID (will allow alternate flow ID reference... a synonym for a flow ID)
--==============================================================================
procedure create_flow (
    p_id                              in number                       default null,
    p_owner                           in varchar2                     default null,
    p_name                            in varchar2                     default null,
    p_alias                           in varchar2                     default null,
    p_page_view_logging               in varchar2                     default null,
    p_flow_language                   in varchar2                     default null,
    p_flow_language_derived_from      in varchar2                     default null,
    p_date_format                     in varchar2                     default null,
    p_date_time_format                in varchar2                     default null,
    p_timestamp_format                in varchar2                     default null,
    p_timestamp_tz_format             in varchar2                     default null,
    p_nls_sort                        in varchar2                     default null,
    p_nls_comp                        in varchar2                     default null,
    p_direction_right_to_left         in varchar2                     default null,
    p_flow_image_prefix               in varchar2                     default null,
    p_media_type                      in varchar2                     default null,
    --
    p_application_group               in number                       default null,
    p_application_group_name          in varchar2                     default null,
    p_application_group_comment       in varchar2                     default null,
    --
    p_documentation_banner            in varchar2                     default null,
    p_authentication_id               in number                       default null,
    p_populate_roles                  in varchar2                     default 'R',
    p_logo_type                       in varchar2                     default null,
    p_logo                            in varchar2                     default null,
    p_logo_text                       in varchar2                     default null,
    p_app_builder_icon_name           in varchar2                     default null,
    p_favicons                        in varchar2                     default null, -- deprecated
    p_public_user                     in varchar2                     default null,
    p_proxy_server                    in varchar2                     default null,
    p_no_proxy_domains                in varchar2                     default '.',
    p_cust_authentication_process     in varchar2                     default null,
    p_flow_version                    in varchar2                     default null,
    p_flow_status                     in varchar2                     default null,
    p_flow_unavailable_text           in varchar2                     default null,
    p_restrict_to_user_list           in varchar2                     default null,
    p_build_status                    in varchar2                     default 'RUN_AND_BUILD',
    p_exact_substitutions_only        in varchar2                     default null,
    p_browser_cache                   in varchar2                     default c_y,
    p_browser_frame                   in varchar2                     default 'A',
    p_referrer_policy                 in varchar2                     default null,
    p_deep_linking                    in varchar2                     default c_n,
    p_http_response_headers           in varchar2                     default null,
    p_auth_config_procedure           in varchar2                     default null,
    p_vpd                             in varchar2                     default null,
    p_vpd_teardown_code               in varchar2                     default null,
    p_runtime_api_usage               in varchar2                     default null,
    p_security_scheme                 in varchar2                     default null,
    p_authorize_public_pages_yn       in varchar2                     default c_n,
    p_authorize_batch_job             in varchar2                     default c_y,
    p_application_tab_set             in number                       default null, -- obsolete; reused for debugging flag
    p_rejoin_existing_sessions        in varchar2                     default null,
    p_substitution_string_01          in varchar2                     default null,
    p_substitution_value_01           in varchar2                     default null,
    p_substitution_string_02          in varchar2                     default null,
    p_substitution_value_02           in varchar2                     default null,
    p_substitution_string_03          in varchar2                     default null,
    p_substitution_value_03           in varchar2                     default null,
    p_substitution_string_04          in varchar2                     default null,
    p_substitution_value_04           in varchar2                     default null,
    p_substitution_string_05          in varchar2                     default null,
    p_substitution_value_05           in varchar2                     default null,
    p_substitution_string_06          in varchar2                     default null,
    p_substitution_value_06           in varchar2                     default null,
    p_substitution_string_07          in varchar2                     default null,
    p_substitution_value_07           in varchar2                     default null,
    p_substitution_string_08          in varchar2                     default null,
    p_substitution_value_08           in varchar2                     default null,
    p_substitution_string_09          in varchar2                     default null,
    p_substitution_value_09           in varchar2                     default null,
    p_substitution_string_10          in varchar2                     default null,
    p_substitution_value_10           in varchar2                     default null,
    p_substitution_string_11          in varchar2                     default null,
    p_substitution_value_11           in varchar2                     default null,
    p_substitution_string_12          in varchar2                     default null,
    p_substitution_value_12           in varchar2                     default null,
    p_substitution_string_13          in varchar2                     default null,
    p_substitution_value_13           in varchar2                     default null,
    p_substitution_string_14          in varchar2                     default null,
    p_substitution_value_14           in varchar2                     default null,
    p_substitution_string_15          in varchar2                     default null,
    p_substitution_value_15           in varchar2                     default null,
    p_substitution_string_16          in varchar2                     default null,
    p_substitution_value_16           in varchar2                     default null,
    p_substitution_string_17          in varchar2                     default null,
    p_substitution_value_17           in varchar2                     default null,
    p_substitution_string_18          in varchar2                     default null,
    p_substitution_value_18           in varchar2                     default null,
    p_substitution_string_19          in varchar2                     default null,
    p_substitution_value_19           in varchar2                     default null,
    p_substitution_string_20          in varchar2                     default null,
    p_substitution_value_20           in varchar2                     default null,
    p_global_notification             in varchar2                     default null,
    p_charset                         in varchar2                     default null,
    p_page_protection_enabled_y_n     in varchar2                     default null,
    p_checksum_salt                   in raw                          default null,
    p_checksum_salt_last_reset        in varchar2                     default null,
    p_bookmark_checksum_function      in varchar2                     default null, -- MD5 for pre-5.0
    p_accept_old_checksums            in boolean                      default null,
    p_csv_encoding                    in varchar2                     default null,
    p_auto_time_zone                  in varchar2                     default null,
    p_error_handling_function         in varchar2                     default null,
    p_default_error_display_loc       in varchar2                     default 'INLINE_WITH_FIELD_AND_NOTIFICATION',
    p_max_session_length_sec          in number                       default null,
    p_on_max_session_timeout_url      in varchar2                     default null,
    p_max_session_idle_sec            in number                       default null,
    p_on_max_idle_timeout_url         in varchar2                     default null,
    p_session_timeout_warning_sec     in number                       default null,
    p_max_scheduler_jobs              in number                       default null,
    p_compatibility_mode              in varchar2                     default '4.0',
    p_accessible_read_only            in varchar2                     default c_y,
    p_session_state_commits           in varchar2                     default 'END_OF_REQUEST',
    p_html_escaping_mode              in varchar2                     default null,
    p_email_from                      in varchar2                     default null,
    p_oracle_text_function_type       in varchar2                     default null,
    p_oracle_text_function            in varchar2                     default null,
    p_tokenize_row_search             in varchar2                     default c_y,
    p_friendly_url                    in varchar2                     default c_y,
    --
    p_publish_yn                      in varchar2                     default c_n,   -- apex 4.0
    p_allow_feedback_yn               in varchar2                     default c_n,   -- apex 4.0
    --
    p_file_prefix                     in varchar2                     default null,
    p_files_version                   in number                       default 1,
    --
    p_version_scn                     in number                       default null,
    --
    p_created_by                      in varchar2                     default null,
    p_created_on                      in date                         default null,
    -- keep "last" for backwards compatibility and consistency
    p_last_updated_by                 in varchar2                     default null,
    p_last_updated_on                 in date                         default null,
    p_last_upd_yyyymmddhh24miss       in varchar2                     default null, -- deprecated 24.1
    --
    p_print_server_type               in varchar2                     default null,
    p_print_remote_server_id          in number                       default null,
    p_print_credential_id             in number                       default null,
    --
    p_file_storage                    in varchar2                     default 'DB',
    p_file_remote_server_id           in number                       default null,
    --
    p_is_pwa                          in varchar2                     default c_n,
    p_pwa_is_installable              in varchar2                     default null,
    p_pwa_manifest_description        in varchar2                     default null,
    p_pwa_manifest_display            in varchar2                     default null,
    p_pwa_manifest_orientation        in varchar2                     default null,
    p_pwa_manifest_theme_color        in varchar2                     default null,
    p_pwa_manifest_bg_color           in varchar2                     default null,
    p_pwa_manifest_icon_url           in varchar2                     default null,
    p_pwa_manifest_custom             in varchar2                     default null,
    p_pwa_service_worker_hooks        in clob                         default null,
    p_pwa_apple_status_bar_style      in varchar2                     default null,
    p_pwa_is_push_enabled             in varchar2                     default null,
    p_pwa_push_credential_id          in number                       default null,
    p_pwa_vapid_contact_info          in varchar2                     default null,
    p_copyright_banner                in varchar2                     default null,
    --
    p_ai_remote_server_id             in number                       default null,
    p_ai_consent_message              in varchar2                     default null,
    --
    p_mle_environment                 in varchar2                     default null,
    p_pass_ecid                       in varchar2                     default c_y,
    p_working_copy_created_on         in date                         default null,
    p_working_copy_created_by         in varchar2                     default null,
    p_working_copy_name               in varchar2                     default null,
    p_working_copy_description        in varchar2                     default null,
    p_task_vacation_rule_procedure    in varchar2                     default null, 
    p_otel_product_family             in varchar2                     default null );  -- OpenTelemetry Product Family

--==============================================================================
--
-- C R E D E N T I A L S   /   R E M O T E   S E R V E R S
--
--==============================================================================
procedure create_credential (
    p_id                              in number                       default null,
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_authentication_type             in varchar2,
    p_scope                           in varchar2                     default null,
    p_client_id                       in varchar2                     default null,
    p_client_secret                   in varchar2                     default null,
    p_namespace                       in varchar2                     default null,
    p_fingerprint                     in varchar2                     default null,
    p_valid_for_urls                  in varchar2                     default null,
    p_db_credential_name              in varchar2                     default null,
    p_db_credential_is_instance       in boolean                      default null,
    p_prompt_on_install               in boolean,
    p_credential_comment              in varchar2                     default null,
    p_created_by                      in varchar2                     default null,
    p_created_on                      in date                         default null,
    p_updated_by                      in varchar2                     default null,
    p_updated_on                      in date                         default null );

--==============================================================================
procedure create_remote_server (
    p_id                              in number                       default null,
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_base_url                        in varchar2,
    p_https_host                      in varchar2                     default null,
    p_server_type                     in varchar2,
    p_ords_timezone                   in varchar2                     default null,
    p_ords_version                    in varchar2                     default null,
    p_ords_init_code                  in varchar2                     default null,
    p_ords_cleanup_code               in varchar2                     default null,
    p_print_server_type               in varchar2                     default null,
    p_server_timeout                  in number                       default null,
    p_credential_id                   in number                       default null,
    p_remote_sql_database_type        in varchar2                     default null,
    p_remote_sql_database_info        in varchar2                     default null,
    p_remote_sql_default_schema       in varchar2                     default null,
    p_mysql_sql_modes                 in varchar2                     default null,
    p_prompt_on_install               in boolean,
    p_ai_provider_type                in varchar2                     default null,
    p_ai_is_builder_service           in boolean                      default false,
    p_ai_model_name                   in varchar2                     default null,
    p_ai_http_headers                 in varchar2                     default null,
    p_ai_attributes                   in varchar2                     default null,
    p_embedding_type                  in varchar2                     default null,
    p_emb_local_model_owner           in varchar2                     default null,
    p_emb_local_model_name            in varchar2                     default null,
    p_emb_function                    in varchar2                     default null,
    p_configuration_procedure         in varchar2                     default null,
    p_plsql_code                      in varchar2                     default null,
    p_server_comment                  in varchar2                     default null,
    p_created_by                      in varchar2                     default null,
    p_created_on                      in date                         default null,
    p_updated_by                      in varchar2                     default null,
    p_updated_on                      in date                         default null );

--==============================================================================
--
-- S Q L   W O R K S H O P
--
--==============================================================================
procedure get_imported_files_and_status(
    p_file_names                    out wwv_flow_global.vc_arr2,
    p_file_status                   out wwv_flow_global.vc_arr2 );

--==============================================================================
procedure import_script (
    p_filename                        in varchar2,
    p_varchar2_table                  in sys.dbms_sql.varchar2_table,
    p_flow_id                         in number                       default wwv_flow.g_flow_id,
    p_pathid                          in number                       default null,
    p_name                            in varchar2                     default null,
    p_title                           in varchar2                     default null,
    p_mime_type                       in varchar2                     default null,
    p_dad_charset                     in varchar2                     default null,
    p_deleted_as_of                   in date                         default null,
    p_content_type                    in varchar2                     default null,
    p_language                        in varchar2                     default null,
    p_description                     in varchar2                     default null,
    p_file_type                       in varchar2                     default null,
    p_file_charset                    in varchar2                     default null );

--==============================================================================
procedure create_script (
    p_id                              in number                       default null,
    p_flow_id                         in number                       default wwv_flow.g_flow_id,
    p_name                            in varchar2                     default null,
    p_pathid                          in number                       default null,
    p_filename                        in varchar2,
    p_title                           in varchar2                     default null,
    p_mime_type                       in varchar2                     default null,
    p_dad_charset                     in varchar2                     default null,
    p_created_by                      in varchar2                     default null,
    p_created_on                      in date                         default null,
    p_updated_by                      in varchar2                     default null,
    p_updated_on                      in date                         default null,
    p_deleted_as_of                   in date                         default null,
    p_content_type                    in varchar2                     default null,
    p_blob_content                    in sys.dbms_sql.varchar2_table,
    p_language                        in varchar2                     default null,
    p_description                     in varchar2                     default null,
    p_file_type                       in varchar2                     default null,
    p_file_charset                    in varchar2                     default null );

--==============================================================================
procedure create_sw_detail_results (
    p_id                              in number                       default null,
    p_result_id                       in number                       default null,
    p_file_id                         in number                       default null,
    p_seq_id                          in number                       default null,
    p_stmt_num                        in number                       default null,
    p_stmt_text                       in clob                         default null,
    p_result                          in clob                         default null,
    p_result_size                     in number                       default null,
    p_result_rows                     in number                       default null,
    p_msg                             in varchar2                     default null,
    p_success                         in varchar2                     default null,
    p_failure                         in varchar2                     default null,
    p_started                         in date                         default null,
    p_start_time                      in number                       default null,
    p_ended                           in date                         default null,
    p_end_time                        in number                       default null,
    p_run_complete                    in varchar2                     default null,
    p_last_updated                    in date                         default null );

--==============================================================================
procedure create_sw_results (
    p_id                              in number                       default null,
    p_file_id                         in number                       default null,
    p_job_id                          in number                       default null,
    p_run_by                          in varchar2                     default null,
    p_run_as                          in varchar2                     default null,
    p_started                         in date                         default null,
    p_start_time                      in number                       default null,
    p_ended                           in date                         default null,
    p_end_time                        in number                       default null,
    p_status                          in varchar2                     default null,
    p_run_comments                    in varchar2                     default null );

--==============================================================================
procedure create_sw_sql_cmds (
    p_id                              in number                       default null,
    p_command                         in clob                         default null,
    p_parsed_schema                   in varchar2                     default null,
    p_created_by                      in varchar2                     default null,
    p_created_on                      in date                         default null );

--==============================================================================
procedure create_sw_stmts (
    p_id                              in number                       default null,
    p_file_id                         in number                       default null,
    p_stmt_number                     in number                       default null,
    p_src_line_number                 in number                       default null,
    p_offset                          in number                       default null,
    p_length                          in number                       default null,
    p_stmt_class                      in number                       default null,
    p_stmt_id                         in number                       default null,
    p_isrunnable                      in varchar2                     default null,
    p_stmt_vc2                        in varchar2                     default null,
    p_stmt                            in clob                         default null );

--==============================================================================
procedure create_qs_saved_model (
    p_id                              in number                       default null,
    p_row_version                     in integer                      default null,
    p_name                            in varchar2                     default null,
    p_description                     in varchar2                     default null,
    p_model                           in clob                         default null,
    p_created                         in date                         default null,
    p_created_by                      in varchar2                     default null,
    p_updated                         in date                         default null,
    p_updated_by                      in varchar2                     default null );

--==============================================================================
procedure create_qb_saved_cond (
    p_id                              in number                       default null,
    p_col                             in varchar2                     default null,
    p_alias                           in varchar2                     default null,
    p_fv                              in varchar2                     default null,
    p_fp                              in varchar2                     default null,
    p_out                             in varchar2                     default null,
    p_st                              in varchar2                     default null,
    p_so                              in varchar2                     default null,
    p_grp                             in varchar2                     default null,
    p_con                             in varchar2                     default null,
    p_ord                             in number                       default null );

--==============================================================================
procedure create_qb_saved_join (
    p_id                              in number                       default null,
    p_field1                          in varchar2                     default null,
    p_field2                          in varchar2                     default null,
    p_cond                            in varchar2                     default null );

--==============================================================================
procedure create_qb_saved_query (
    p_id                              in number                       default null,
    p_query_owner                     in varchar2                     default null,
    p_title                           in varchar2                     default null,
    p_qb_sql                          in clob                         default null,
    p_description                     in varchar2                     default null,
    p_query_type                      in varchar2                     default null,
    p_created_by                      in varchar2                     default null,
    p_created_on                      in date                         default null,
    p_last_updated_by                 in varchar2                     default null,
    p_last_updated_on                 in date                         default null );

--==============================================================================
procedure create_qb_saved_tabs (
    p_id                              in number                       default null,
    p_oid                             in number                       default null,
    p_cnt                             in number                       default null,
    p_top                             in varchar2                     default null,
    p_left                            in varchar2                     default null,
    p_tname                           in varchar2                     default null );

--==============================================================================
--
-- F E E D B A C K
--
--==============================================================================
procedure set_feedback_origin (
    p_identifier                      in varchar2,
    p_import_into                     in varchar2 );

--==============================================================================
procedure import_feedback (
    p_id                              in number,
    p_feedback_id                     in number                       default null,
    p_feedback_comment                in varchar2,
    p_developer_comment               in varchar2                     default null,
    p_public_response                 in varchar2                     default null,
    p_feedback_status                 in number                       default null,
    p_feedback_type                   in number                       default null,
    p_tags                            in varchar2                     default null,
    p_application_id                  in number                       default null,
    p_application_name                in varchar2                     default null,
    p_page_id                         in number                       default null,
    p_page_name                       in varchar2                     default null,
    p_page_last_updated_by            in varchar2                     default null,
    p_page_last_updated_on            in date                         default null,
    p_session_id                      in varchar2                     default null,
    p_apex_user                       in varchar2                     default null,
    p_user_email                      in varchar2                     default null,
    p_logging_email                   in varchar2                     default null,
    p_logging_security_group_id       in number                       default null,
    p_logged_by_workspace_name        in varchar2                     default null,
    p_application_version             in varchar2                     default null,
    p_parsing_schema                  in varchar2                     default null,
    p_http_user_agent                 in varchar2                     default null,
    p_remote_addr                     in varchar2                     default null,
    p_remote_user                     in varchar2                     default null,
    p_http_host                       in varchar2                     default null,
    p_server_name                     in varchar2                     default null,
    p_server_port                     in varchar2                     default null,
    p_screen_width                    in varchar2                     default null,
    p_screen_height                   in varchar2                     default null,
    p_session_state                   in varchar2                     default null,
    p_session_info                    in varchar2                     default null,
    p_label_01                        in varchar2                     default null,
    p_label_02                        in varchar2                     default null,
    p_label_03                        in varchar2                     default null,
    p_label_04                        in varchar2                     default null,
    p_label_05                        in varchar2                     default null,
    p_label_06                        in varchar2                     default null,
    p_label_07                        in varchar2                     default null,
    p_label_08                        in varchar2                     default null,
    p_attribute_01                    in varchar2                     default null,
    p_attribute_02                    in varchar2                     default null,
    p_attribute_03                    in varchar2                     default null,
    p_attribute_04                    in varchar2                     default null,
    p_attribute_05                    in varchar2                     default null,
    p_attribute_06                    in varchar2                     default null,
    p_attribute_07                    in varchar2                     default null,
    p_attribute_08                    in varchar2                     default null,
    p_created_by                      in varchar2                     default null,
    p_created_on                      in timestamp with time zone     default null,
    p_updated_by                      in varchar2                     default null,
    p_updated_on                      in timestamp with time zone     default null );

--==============================================================================
procedure import_feedback_followup (
    p_id                              in number,
    p_feedback_id                     in number,
    p_follow_up                       in varchar2,
    p_email                           in varchar2,
    p_created_by                      in varchar2                     default null,
    p_created_on                      in timestamp with time zone     default null,
    p_updated_by                      in varchar2                     default null,
    p_updated_on                      in timestamp with time zone     default null );

--==============================================================================
--
-- F U L L   W O R K S P A C E   E X P O R T
--
--==============================================================================
procedure create_app_build_pref (
    p_id                              in number                       default null,
    p_default_parsing_schema          in varchar2                     default null,
    p_default_auth_scheme             in varchar2                     default null,
    p_default_app_theme               in number                       default null,
    p_default_tabs                    in varchar2                     default null,
    p_default_proxy_server            in varchar2                     default null,
    p_default_language                in varchar2                     default null,
    p_default_language_derived        in varchar2                     default null,
    p_date_format                     in varchar2                     default null,
    p_date_time_format                in varchar2                     default null,
    p_timestamp_format                in varchar2                     default null,
    p_timestamp_tz_format             in varchar2                     default null,
    p_created_on                      in date                         default null,
    p_created_by                      in varchar2                     default null,
    p_updated_on                      in date                         default null,
    p_updated_by                      in varchar2                     default null );

--==============================================================================
procedure create_clickthru_log$ (
    p_clickdate                       in date                         default null,
    p_category                        in varchar2                     default null,
    p_id                              in number                       default null,
    p_flow_user                       in varchar2                     default null,
    p_ip                              in varchar2                     default null );

--==============================================================================
procedure create_clickthru_log2$ (
    p_clickdate                       in date                         default null,
    p_category                        in varchar2                     default null,
    p_id                              in number                       default null,
    p_flow_user                       in varchar2                     default null,
    p_ip                              in varchar2                     default null );

--==============================================================================
procedure create_mail_attachments (
    p_id                               in number                      default null,
    p_mail_id                          in number                      default null,
    p_filename                         in varchar2                    default null,
    p_mime_type                        in varchar2                    default null,
    p_inline                           in varchar2                    default null,
    p_content_id                       in varchar2                    default null,
    p_attachment                       in sys.dbms_sql.varchar2_table default c_empty_varchar2_table,
    p_last_updated_by                  in varchar2                    default null,
    p_last_updated_on                  in date                        default null);

--==============================================================================
procedure create_mail_log (
	p_mail_id                          in number                      default null,
    p_mail_to                          in varchar2                    default null,
    p_mail_from                        in varchar2                    default null,
    p_mail_replyto                     in varchar2                    default null,
    p_mail_subj                        in varchar2                    default null,
    p_mail_cc                          in varchar2                    default null,
    p_mail_bcc                         in varchar2                    default null,
    p_mail_send_error                  in varchar2                    default null,
    p_last_updated_by                  in varchar2                    default null,
    p_last_updated_on                  in date                        default null );

--==============================================================================
procedure create_mail_queue (
    p_id                               in number                      default null,
    p_mail_to                          in varchar2                    default null,
    p_mail_from                        in varchar2                    default null,
    p_mail_replyto                     in varchar2                    default null,
    p_mail_subj                        in varchar2                    default null,
    p_mail_cc                          in varchar2                    default null,
    p_mail_bcc                         in varchar2                    default null,
    p_mail_body                        in clob                        default null,
    p_mail_body_html                   in clob                        default null,
    p_mail_send_count                  in number                      default null,
    p_mail_send_error                  in varchar2                    default null,
    p_includes_html                    in number                      default null,
    p_last_updated_by                  in varchar2                    default null,
    p_last_updated_on                  in date                        default null );

--==============================================================================
procedure create_password_history (
    p_id                               in number                      default null,
    p_user_id                          in number                      default null,
    p_password                         in raw                         default null,
    p_created                          in date                        default null );

--==============================================================================
procedure create_preferences$ (
    p_id                               in number                      default null,
    p_user_id                          in varchar2                    default null,
    p_preference_name                  in varchar2                    default null,
    p_attribute_value                  in varchar2                    default null,
    p_tenant_id                        in varchar2                    default null );

--==============================================================================
procedure create_provision_serice_mod (
    p_id                               in number                      default null,
    p_service_name                     in varchar2                    default null,
    p_service_attribute_1              in varchar2                    default null,
    p_service_attribute_2              in varchar2                    default null,
    p_service_attribute_3              in varchar2                    default null,
    p_service_attribute_4              in varchar2                    default null,
    p_service_attribute_5              in varchar2                    default null,
    p_service_attribute_6              in varchar2                    default null,
    p_service_attribute_7              in varchar2                    default null,
    p_service_attribute_8              in varchar2                    default null,
    p_requested_on                     in date                        default null,
    p_requested_by                     in varchar2                    default null,
    p_last_status_change_on            in date                        default null,
    p_last_status_change_by            in varchar2                    default null,
    p_request_status                   in varchar2                    default null,
    p_request_work_log                 in varchar2                    default null,
    p_request_comments                 in varchar2                    default null );

--==============================================================================
procedure create_user_access_log1$ (
    p_login_name                       in varchar2                    default null,
    p_auth_method                      in varchar2                    default null,
    p_app                              in number                      default null,
    p_owner                            in varchar2                    default null,
    p_access_date                      in date                        default null,
    p_ip_address                       in varchar2                    default null,
    p_remote_user                      in varchar2                    default null,
    p_auth_result                      in number                      default null,
    p_custom_status_text               in varchar2                    default null );

--==============================================================================
procedure create_user_access_log2$ (
    p_login_name                       in varchar2                    default null,
    p_auth_method                      in varchar2                    default null,
    p_app                              in number                      default null,
    p_owner                            in varchar2                    default null,
    p_access_date                      in date                        default null,
    p_ip_address                       in varchar2                    default null,
    p_remote_user                      in varchar2                    default null,
    p_auth_result                      in number                      default null,
    p_custom_status_text               in varchar2                    default null );

--=================================================================================
procedure create_user_groups (
    p_id                               in number,
    p_group_name                       in varchar2,
    p_group_desc                       in varchar2                    default null,
    p_security_group_id                in number                      default null);

--=================================================================================
procedure create_extension_link (
    p_id                               in number,
    p_name                             in varchar2,
    p_url                              in varchar2,
    p_description                      in varchar2                    default null,
    p_display_sequence                 in number,
    p_is_public                        in boolean                     default false,
    p_created_on                       in date                        default null,
    p_created_by                       in varchar2                    default null,
    p_updated_on                       in date                        default null,
    p_updated_by                       in varchar2                    default null );

--=================================================================================
procedure create_extension_grant (
    p_id                               in number,
    p_extension_workspace              in varchar2,
    p_menu_label                       in varchar2                    default null,
    p_has_read_access                  in boolean                     default false,
    p_created_on                       in date                        default null,
    p_created_by                       in varchar2                    default null,
    p_updated_on                       in date                        default null,
    p_updated_by                       in varchar2                    default null );

end wwv_imp_workspace;
/
show errors;
