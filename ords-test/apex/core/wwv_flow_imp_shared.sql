set define '^' verify off
prompt ...wwv_flow_imp_shared.sql
create or replace package wwv_flow_imp_shared as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_imp_shared.sql
--
--    DESCRIPTION
--     Interface to create APEX shared components
--
--    MODIFIED (MM/DD/YYYY)
--     cczarski 09/06/2021 - Created
--
-----------------------------------------------------------------------------------------------------------------------

--
--==============================================================================
-- constants
--==============================================================================
c_y                       constant varchar2(1 CHAR) := 'Y';
c_n                       constant varchar2(1 CHAR) := 'N';

c_empty_varchar2_table    sys.dbms_sql.varchar2_table;

--==============================================================================
procedure set_calling_version(
    p_version in number );

--==============================================================================
function current_lov_id             return number;
function current_menu_id            return number;
function current_list_id            return number;
function current_component_group_id return number;
function current_ai_config_id       return number;

--==============================================================================
procedure load_build_options(
    p_application_id                  in number );

--==============================================================================
procedure clear_build_options;

--==============================================================================
function get_default_ldap_escaping (
    p_edit_function in varchar2 )
    return varchar2;

--==============================================================================
procedure load_app_settings(
    p_application_id                  in number );

--==============================================================================
--
-- U S E R   I N T E R F A C E
--
--==============================================================================
procedure create_user_interface (
    p_id                              in number   default null, -- deprecated
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_ui_type_name                    in varchar2 default null, -- deprecated
    p_display_name                    in varchar2 default null, -- deprecated
    p_display_seq                     in number   default null, -- deprecated
    p_use_auto_detect                 in boolean  default null, -- deprecated
    p_is_default                      in boolean  default null, -- deprecated
    p_theme_id                        in number,
    p_home_url                        in varchar2 default null,
    p_login_url                       in varchar2 default null,
    p_theme_style_by_user_pref        in boolean  default false,
    p_built_with_love                 in boolean  default true,
    p_auto_dismiss_success_msg        in boolean  default false,
    p_global_page_id                  in number   default null,
    p_navigation_list_id              in number   default null,
    p_navigation_list_position        in varchar2 default null,
    p_navigation_list_template_id     in number   default null,
    p_nav_list_template_options       in varchar2 default null,
    p_content_delivery_network        in varchar2 default null, /* desupported */
    p_css_file_urls                   in varchar2 default null,
    p_javascript_file_urls            in varchar2 default null,
    p_include_legacy_javascript       in varchar2 default null,
    p_include_jquery_migrate          in boolean  default false,
    p_required_patch                  in number   default null, -- deprecated
    p_nav_bar_type                    in varchar2 default 'NAVBAR',
    p_nav_bar_list_id                 in number   default null,
    p_nav_bar_list_template_id        in number   default null,
    p_nav_bar_template_options        in varchar2 default null);

--==============================================================================
-- Deprecated
--==============================================================================
procedure create_ui_type (
    p_name                            in varchar2,
    p_based_on_ui_type_name           in varchar2 default null,
    p_autodetect_js_file_urls         in varchar2 default null,
    p_autodetect_js_function_body     in varchar2 default null,
    p_autodetect_plsql_func_body      in varchar2 default null );

--==============================================================================
-- Deprecated
--==============================================================================
procedure create_ui_type_feature (
    p_ui_type_name                    in varchar2,
    p_builder_feature_id              in number );

--==============================================================================
--
-- B U I L D   O P T I O N S
--
--==============================================================================
procedure create_build_option (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_build_option_name               in varchar2 default null,
    p_build_option_status             in varchar2 default null,
    p_build_option_comment            in varchar2 default null,
    --
    p_default_on_export               in varchar2 default null,
    p_on_upgrade_keep_status          in boolean  default false,
    p_feature_identifier              in varchar2 default null,
    p_attribute1                      in varchar2 default null,
    p_attribute2                      in varchar2 default null,
    p_attribute3                      in varchar2 default null,
    p_attribute4                      in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure set_build_option (
    p_id                              in number   default null,
    p_build_option_status             in varchar2 default null );

--==============================================================================
procedure set_build_option_status(
   p_application_id                   in number,
   p_id                               in number,
   p_build_status                     in varchar2 );

--==============================================================================
function get_build_option_status(
   p_application_id                   in number,
   p_id                               in number )
   return varchar2;

--==============================================================================
function get_build_option_status(
   p_application_id                   in number,
   p_build_option_name                in varchar2 )
   return varchar2;

--==============================================================================
--
-- S T A T I C   F I L E S
--
--==============================================================================
procedure create_combined_file (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_user_interface_id               in number   default null, -- deprecated
    p_page_id                         in number   default null,
    p_combined_file_url               in varchar2,
    p_single_file_urls                in varchar2,
    p_required_patch                  in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
function create_static_file (
    p_scope                           in wwv_flow_file_api.t_file_scope,
    p_id                              in number   default null,
    --
    p_flow_id                         in number   default null,
    p_plugin_id                       in number   default null,
    p_theme_id                        in number   default null,
    p_theme_ref_id                    in number   default null,
    --
    p_file_name                       in varchar2,
    p_mime_type                       in varchar2,
    p_file_charset                    in varchar2 default null,
    p_file_content                    in blob,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null )
    return number;

--==============================================================================
procedure create_app_static_file (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_file_name                       in varchar2,
    p_mime_type                       in varchar2,
    p_file_charset                    in varchar2 default null,
    p_file_content                    in blob,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure remove_app_static_file (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id );

--==============================================================================
procedure create_workspace_static_file (
    p_id                              in number   default null,
    p_file_name                       in varchar2,
    p_mime_type                       in varchar2,
    p_file_charset                    in varchar2 default null,
    p_file_content                    in blob,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- S E C U R I T Y   S C H E M E
--
--==============================================================================
procedure create_security_scheme (
    p_id                              in number   default null,
    p_security_group_id               in number   default null, -- obsolete
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_scheme_type                     in varchar2 default null,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_attribute_09                    in varchar2 default null,
    p_attribute_10                    in varchar2 default null,
    p_attribute_11                    in varchar2 default null,
    p_attribute_12                    in varchar2 default null,
    p_attribute_13                    in varchar2 default null,
    p_attribute_14                    in varchar2 default null,
    p_attribute_15                    in varchar2 default null,
    p_scheme                          in varchar2 default null, -- obsolete
    p_scheme_text                     in varchar2 default null, -- obsolete
    p_caching                         in varchar2 default null,
    p_error_message                   in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_comments                        in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_acl_role (
    p_id                              in number              default null,
    p_flow_id                         in number              default wwv_flow.g_flow_id,
    p_static_id                       in varchar2            default null,
    p_name                            in varchar2,
    p_description                     in varchar2            default null,
    p_users                           in wwv_flow_t_varchar2 default null,
    p_reference_id                    in number              default null,
    p_version_scn                     in number              default null );

--==============================================================================
--
-- A P P   P R O C E S S ,   C O M P U T A T I O N S ,   I T E M S
--
--==============================================================================
procedure create_flow_process (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_process_sequence                in number   default null,
    p_process_point                   in varchar2,
    p_process_type                    in varchar2 default 'PLSQL',
    p_process_name                    in varchar2 default null,
    p_process_sql                     in varchar2 default null,
    p_process_sql_clob                in varchar2 default null,
    p_process_clob_language           in varchar2 default null,
    p_location                        in varchar2 default 'LOCAL',
    p_remote_server_id                in number   default null,
    p_web_src_operation_id            in number   default null,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_attribute_09                    in varchar2 default null,
    p_attribute_10                    in varchar2 default null,
    p_attribute_11                    in varchar2 default null,
    p_attribute_12                    in varchar2 default null,
    p_attribute_13                    in varchar2 default null,
    p_attribute_14                    in varchar2 default null,
    p_attribute_15                    in varchar2 default null,
    p_process_error_message           in varchar2 default null,
    p_error_display_location          in varchar2 default 'ON_ERROR_PAGE',
    p_process_when                    in varchar2 default null,
    p_process_when_type               in varchar2 default null,
    p_process_when2                   in varchar2 default null,
    p_process_when_type2              in varchar2 default null,
    p_security_scheme                 in varchar2 default null,
    p_required_patch                  in number   default null,
    p_process_item_name               in varchar2 default null,
    p_process_comment                 in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure set_flow_process_sql (
    p_id                              in number   default null,
    p_process_sql                     in varchar2 default null );

--==============================================================================
procedure create_flow_item (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_scope                           in varchar2 default 'APP',
    p_data_type                       in varchar2 default 'VARCHAR',
    p_is_persistent                   in varchar2 default c_y,
    p_required_patch                  in number   default null,
    p_protection_level                in varchar2 default null,
    p_escape_on_http_output           in varchar2 default null,
    p_item_comment                    in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_flow_computation (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_computation_sequence            in number   default null,
    p_computation_item                in varchar2 default null,
    p_computation_point               in varchar2 default null,
    p_computation_item_type           in varchar2 default null,
    p_computation_type                in varchar2 default null,
    p_computation_language            in varchar2 default null,
    p_computation_processed           in varchar2 default null,
    p_computation                     in varchar2 default null,
    p_security_scheme                 in varchar2 default null,
    p_required_patch                  in number   default null,
    p_computation_comment             in varchar2 default null,
    p_compute_when                    in varchar2 default null,
    p_compute_when_type               in varchar2 default null,
    p_compute_when_text               in varchar2 default null,
    p_computation_error_message       in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- T A B S
--
--==============================================================================
procedure create_tab (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_tab_set                         in varchar2 default null,
    p_tab_sequence                    in number   default null,
    p_tab_name                        in varchar2 default null,
    p_tab_image                       in varchar2 default null,
    p_tab_non_current_image           in varchar2 default null,
    p_tab_image_attributes            in varchar2 default null,
    p_tab_text                        in varchar2 default null,
    p_tab_step                        in number   default null,
    p_tab_also_current_for_pages      in varchar2 default null,
    p_tab_parent_tabset               in varchar2 default null,
    p_tab_plsql_condition             in varchar2 default null,
    p_display_condition_type          in varchar2 default null,
    p_tab_disp_cond_text              in varchar2 default null,
    p_required_patch                  in number   default null,
    p_security_scheme                 in varchar2 default null,
    p_tab_comment                     in varchar2 default null,
    --
    p_auto_parent_tab_set             in varchar2 default null,
    p_auto_parent_tab_text            in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure update_tab_condition (
    p_id                              in number   default null,
    p_tab_plsql_condition             in varchar2 default null );

--==============================================================================
procedure update_tab_text (
    p_id                              in number   default null,
    p_tab_text                        in varchar2 default null );

--==============================================================================
procedure rename_tabset (
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_old_name                        in varchar2 default null,
    p_new_name                        in varchar2 default null );

--==============================================================================
procedure create_toplevel_tab (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_tab_set                         in varchar2 default null,
    p_tab_sequence                    in number   default null,
    p_tab_name                        in varchar2 default null,
    p_tab_image                       in varchar2 default null,
    p_tab_non_current_image           in varchar2 default null,
    p_tab_image_attributes            in varchar2 default null,
    p_tab_text                        in varchar2 default null,
    p_tab_target                      in varchar2 default null,
    p_current_on_tabset               in varchar2 default null,
    p_display_condition               in varchar2 default null,
    p_display_condition2              in varchar2 default null,
    p_display_condition_type          in varchar2 default null,
    p_required_patch                  in number   default null,
    p_security_scheme                 in varchar2 default null,
    p_tab_comment                     in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure update_toplevel_tab (
    p_id                              in number   default null,
    p_display_condition               in varchar2 default null);


--==============================================================================
procedure set_toplevel_tab_target (
    p_id                              in number   default null,
    p_tab_target                      in varchar2 default null);

--==============================================================================
procedure set_toplevel_tab_text (
    p_id                              in number   default null,
    p_tab_text                        in varchar2 default null);

--==============================================================================
--
-- L O V
--
--==============================================================================
procedure create_list_of_values (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_lov_name                        in varchar2 default null,
    p_lov_query                       in varchar2 default null,
    p_source_type                     in varchar2 default null,
    p_function_body_language          in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_location                        in varchar2 default null,
    p_remote_server_id                in number   default null,
    p_web_src_module_id               in number   default null,
    p_web_src_array_col_id            in number   default null,  -- obsolete
    p_array_column_id                 in number   default null,
    p_document_source_id              in number   default null,
    p_use_local_sync_table            in boolean  default null,
    p_query_owner                     in varchar2 default null,
    p_query_table                     in varchar2 default null,
    p_query_match                     in varchar2 default null,
    p_query_columns                   in varchar2 default null,
    p_query_where                     in varchar2 default null,
    p_source_post_processing          in varchar2 default null,
    p_optimizer_hint                  in varchar2 default null,
    p_remote_sql_caching              in varchar2 default null,
    p_remote_sql_invalidate_when      in varchar2 default null,
    p_external_filter_expr            in varchar2 default null,
    p_external_order_by_expr          in varchar2 default null,
    --
    p_return_column_name              in varchar2 default null,
    p_display_column_name             in varchar2 default null,
    p_icon_column_name                in varchar2 default null,
    p_group_column_name               in varchar2 default null,
    p_group_sort_direction            in varchar2 default null,
    p_default_sort_column_name        in varchar2 default null,
    p_default_sort_direction          in varchar2 default null,
    p_oracle_text_column_name         in varchar2 default null,
    --
    p_lov_comment                     in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_list_of_values_cols (
    p_id                              in number   default null,
    p_lov_id                          in number   default current_lov_id,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    --
    p_query_column_name               in varchar2,
    p_heading                         in varchar2 default null,
    p_display_sequence                in number,
    p_format_mask                     in varchar2 default null,
    p_data_type                       in varchar2,
    p_is_visible                      in varchar2 default c_y,
    p_is_searchable                   in varchar2 default c_y,
    --
    p_column_comment                  in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_static_lov_data (
    p_id                              in number   default null,
    p_lov_id                          in number   default current_lov_id,
    p_lov_disp_sequence               in number   default null,
    p_lov_disp_value                  in varchar2 default null,
    p_lov_return_value                in varchar2 default null,
    p_lov_template                    in varchar2 default null,
    p_lov_disp_cond_type              in varchar2 default null,
    p_lov_disp_cond                   in varchar2 default null,
    p_lov_disp_cond2                  in varchar2 default null,
    p_required_patch                  in varchar2 default null,
    p_lov_data_comment                in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- S U P P O R T I N G   O B J E C T S
--
--==============================================================================
procedure create_install (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_include_in_export_yn            in varchar2 default c_y,
    p_welcome_message                 in varchar2 default null,
    p_license_message                 in varchar2 default null,
    p_configuration_message           in varchar2 default null,
    p_build_options_message           in varchar2 default null,
    p_validation_message              in varchar2 default null,
    p_install_message                 in varchar2 default null,
    p_install_success_message         in varchar2 default null,
    p_install_failure_message         in varchar2 default null,
    p_upgrade_message                 in varchar2 default null,
    p_upgrade_confirm_message         in varchar2 default null,
    p_upgrade_success_message         in varchar2 default null,
    p_upgrade_failure_message         in varchar2 default null,
    p_get_version_sql_query           in varchar2 default null,
    p_deinstall_message               in varchar2 default null,
    p_deinstall_success_message       in varchar2 default null,
    p_deinstall_failure_message       in varchar2 default null,
    p_deinstall_script_clob           in varchar2 default null,

    p_prompt_sub_string_01            in varchar2 default null,
    p_prompt_sub_string_02            in varchar2 default null,
    p_prompt_sub_string_03            in varchar2 default null,
    p_prompt_sub_string_04            in varchar2 default null,
    p_prompt_sub_string_05            in varchar2 default null,
    p_prompt_sub_string_06            in varchar2 default null,
    p_prompt_sub_string_07            in varchar2 default null,
    p_prompt_sub_string_08            in varchar2 default null,
    p_prompt_sub_string_09            in varchar2 default null,
    p_prompt_sub_string_10            in varchar2 default null,
    p_prompt_sub_string_11            in varchar2 default null,
    p_prompt_sub_string_12            in varchar2 default null,
    p_prompt_sub_string_13            in varchar2 default null,
    p_prompt_sub_string_14            in varchar2 default null,
    p_prompt_sub_string_15            in varchar2 default null,
    p_prompt_sub_string_16            in varchar2 default null,
    p_prompt_sub_string_17            in varchar2 default null,
    p_prompt_sub_string_18            in varchar2 default null,
    p_prompt_sub_string_19            in varchar2 default null,
    p_prompt_sub_string_20            in varchar2 default null,

    p_install_prompt_01               in varchar2 default null,
    p_install_prompt_02               in varchar2 default null,
    p_install_prompt_03               in varchar2 default null,
    p_install_prompt_04               in varchar2 default null,
    p_install_prompt_05               in varchar2 default null,
    p_install_prompt_06               in varchar2 default null,
    p_install_prompt_07               in varchar2 default null,
    p_install_prompt_08               in varchar2 default null,
    p_install_prompt_09               in varchar2 default null,
    p_install_prompt_10               in varchar2 default null,
    p_install_prompt_11               in varchar2 default null,
    p_install_prompt_12               in varchar2 default null,
    p_install_prompt_13               in varchar2 default null,
    p_install_prompt_14               in varchar2 default null,
    p_install_prompt_15               in varchar2 default null,
    p_install_prompt_16               in varchar2 default null,
    p_install_prompt_17               in varchar2 default null,
    p_install_prompt_18               in varchar2 default null,
    p_install_prompt_19               in varchar2 default null,
    p_install_prompt_20               in varchar2 default null,

    p_prompt_if_mult_auth_yn          in varchar2 default null,

    p_trigger_install_when_cond       in varchar2 default null,
    p_trigger_install_when_exp1       in varchar2 default null,
    p_trigger_install_when_exp2       in varchar2 default null,
    p_trigger_failure_message         in varchar2 default null,

    p_required_free_kb                in number   default null,
    p_required_sys_privs              in varchar2 default null,
    p_required_names_available        in varchar2 default null,
    p_last_updated_by                 in varchar2 default null,
    p_last_updated_on                 in date     default null,
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null );

--==============================================================================
procedure create_install_script (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_security_group_id               in number   default null,
    p_install_id                      in number   default null,
    p_name                            in varchar2 default null,
    p_sequence                        in number   default null,
    p_script_type                     in varchar2 default null,
    p_script_option                   in varchar2 default null,
    p_script_clob                     in varchar2 default null,
    p_condition_type                  in varchar2 default null,
    p_condition                       in varchar2 default null,
    p_condition2                      in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_install_object (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_script_id                       in number   default null,
    p_object_owner                    in varchar2 default null,
    p_object_type                     in varchar2 default null,
    p_object_name                     in varchar2 default null,
    p_last_updated_by                 in varchar2 default null,
    p_last_updated_on                 in date     default null,
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null );

--==============================================================================
procedure append_to_install_script (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_script_clob                     in varchar2 default null,
    p_deinstall                       in boolean  default false) ;

--==============================================================================
procedure create_install_check (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_security_group_id               in number   default null,
    p_install_id                      in number   default null,
    p_name                            in varchar2 default null,
    p_sequence                        in number   default null,
    p_check_type                      in varchar2 default null,
    p_check_condition                 in varchar2 default null,
    p_check_condition2                in varchar2 default null,
    p_failure_message                 in varchar2 default null,

    p_condition_type                  in varchar2 default null,
    p_condition                       in varchar2 default null,
    p_condition2                      in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_install_build_option (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_security_group_id               in number   default null,
    p_install_id                      in number   default null,
    p_build_opt_id                    in number   default null );

--==============================================================================
--
-- T H E M E S
--
--==============================================================================
function extract_theme_version (
    p_file_prefix                     in varchar )
    return varchar2;

--==============================================================================
procedure create_theme(
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_theme_id                        in number   default null,
    p_theme_name                      in varchar2,
    p_theme_internal_name             in varchar2 default null,
    p_version_identifier              in varchar2 default null,
    p_ui_type_name                    in varchar2 default null,
    p_navigation_type                 in varchar2 default 'T',
    p_nav_bar_type                    in varchar2 default 'NAVBAR',
    p_reference_id                    in number   default null,
    p_is_locked                       in boolean  default false,
    p_current_theme_style_id          in number   default null,
    p_default_page_template           in number   default null,
    p_default_dialog_template         in number   default null,
    p_error_template                  in number   default null,
    p_printer_friendly_template       in number   default null,
    p_breadcrumb_display_point        in varchar2 default null,
    p_sidebar_display_point           in varchar2 default null,
    p_login_template                  in number   default null,
    p_default_button_template         in number   default null,
    p_default_region_template         in number   default null,
    p_default_chart_template          in number   default null,
    p_default_form_template           in number   default null,
    p_default_reportr_template        in number   default null,
    p_default_tabform_template        in number   default null,
    p_default_wizard_template         in number   default null,
    p_default_menur_template          in number   default null,
    p_default_listr_template          in number   default null,
    p_default_irr_template            in number   default null,
    p_default_report_template         in number   default null,
    p_default_label_template          in number   default null,
    p_default_menu_template           in number   default null,
    p_default_calendar_template       in number   default null,
    p_default_list_template           in number   default null,
    p_default_nav_list_template       in number   default null,
    p_default_top_nav_list_temp       in number   default null,
    p_default_side_nav_list_temp      in number   default null,
    p_default_nav_list_position       in varchar2 default null,
    p_default_option_label            in number   default null,
    p_default_required_label          in number   default null,
    p_default_page_transition         in varchar2 default null, -- deprecated
    p_default_popup_transition        in varchar2 default null, -- deprecated
    p_default_navbar_list_template    in number   default null,
    p_default_dialogr_template        in number   default null,
    p_default_dialogbtnr_template     in number   default null,
    p_calendar_icon                   in varchar2 default null,
    p_calendar_icon_attr              in varchar2 default null,
    p_custom_icon_classes             in varchar2 default null,
    p_custom_icon_prefix_class        in varchar2 default null,
    p_custom_library_file_urls        in varchar2 default null,
    p_icon_library                    in varchar2 default null,
    p_javascript_file_urls            in varchar2 default null,
    p_css_file_urls                   in varchar2 default null,
    p_mobile_login_template           in number   default null, -- deprecated
    p_mobile_page_template            in number   default null, -- deprecated
    p_mobile_region_template          in number   default null, -- deprecated
    p_mobile_list_template            in number   default null, -- deprecated
    p_mobile_report_template          in number   default null, -- deprecated
    p_mobile_calendar_template        in number   default null, -- deprecated
    p_mobile_button_template          in number   default null, -- deprecated
    p_mobile_required_label           in number   default null, -- deprecated
    p_mobile_optional_label           in number   default null, -- deprecated
    p_default_header_template         in number   default null,
    p_default_footer_template         in number   default null,
    p_theme_description               in varchar2 default null,
    p_file_prefix                     in varchar2 default null,
    p_files_version                   in number   default 1,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_theme_image (
    p_id                              in number                      default null,
    p_flow_id                         in number                      default wwv_flow.g_flow_id,
    p_theme_id                        in number                      default null,
    p_varchar2_table                  in sys.dbms_sql.varchar2_table default c_empty_varchar2_table,
    p_mimetype                        in varchar2                    default null );

--==============================================================================
procedure delete_theme(
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_theme_id                        in number   default null,
    p_import                          in varchar2 default null);

--==============================================================================
procedure set_theme_calendar_icon (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_calendar_icon                   in varchar2 default null,
    p_calendar_icon_attr              in varchar2 default null );

--==============================================================================
procedure create_theme_style (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_theme_id                        in number,
    p_name                            in varchar2,
    p_css_file_urls                   in varchar2 default null,
    p_css_classes                     in varchar2 default null,
    p_is_current                      in boolean  default null, -- obsolete
    p_is_public                       in boolean  default false,
    p_is_accessible                   in boolean  default false,
    p_theme_roller_input_file_urls    in varchar2 default null,
    p_theme_roller_config             in clob     default null,
    p_theme_roller_output_file_url    in varchar2 default null,
    p_theme_roller_read_only          in boolean  default false,
    p_reference_id                    in number   default null,
    p_component_comment               in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_theme_file (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_theme_id                        in number,
    p_file_name                       in varchar2,
    p_mime_type                       in varchar2,
    p_file_charset                    in varchar2 default null,
    p_file_content                    in blob,
    p_reference_id                    in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_template_opt_group (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_theme_id                        in number,
    p_name                            in varchar2,
    p_display_name                    in varchar2,
    p_display_sequence                in varchar2,
    p_template_types                  in varchar2 default null,
    p_help_text                       in varchar2 default null,
    p_null_text                       in varchar2 default null,
    p_is_advanced                     in varchar2,
    p_reference_id                    in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_template_option (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_theme_id                        in number,
    p_name                            in varchar2,
    p_display_name                    in varchar2,
    p_display_sequence                in varchar2,
    p_page_template_id                in number   default null,
    p_region_template_id              in number   default null,
    p_report_template_id              in number   default null,
    p_breadcrumb_template_id          in number   default null,
    p_list_template_id                in number   default null,
    p_field_template_id               in number   default null,
    p_button_template_id              in number   default null,
    p_css_classes                     in varchar2,
    p_group_id                        in number   default null,
    p_template_types                  in varchar2 default null,
    p_help_text                       in varchar2 default null,
    p_is_advanced                     in varchar2 default null,
    p_reference_id                    in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- T E M P L A T E S
--
--==============================================================================
procedure delete_template(
    p_type                            in varchar2 default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_id                              in number   default null );

--==============================================================================
procedure create_template (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_internal_name                   in varchar2 default null,
    p_look                            in number   default null,
    p_is_popup                        in boolean  default false,
    p_javascript_file_urls            in varchar2 default null,
    p_javascript_code                 in varchar2 default null,
    p_javascript_code_onload          in varchar2 default null,
    p_css_file_urls                   in varchar2 default null,
    p_inline_css                      in varchar2 default null,
    p_header_template                 in varchar2 default null,
    p_footer_template                 in varchar2 default null,
    p_success_message                 in varchar2 default null,
    --
    p_current_tab                     in varchar2 default null,
    p_current_tab_font_attr           in varchar2 default null,
    p_non_current_tab                 in varchar2 default null,
    p_non_current_tab_font_attr       in varchar2 default null,
    --
    p_current_image_tab               in varchar2 default null,
    p_non_current_image_tab           in varchar2 default null,
    --
    p_top_current_tab                 in varchar2 default null,
    p_top_current_tab_font_attr       in varchar2 default null,
    p_top_non_curr_tab                in varchar2 default null,
    p_top_non_curr_tab_font_attr      in varchar2 default null,
    --
    p_box                             in varchar2 default null,
    p_navigation_bar                  in varchar2 default null,
    p_navbar_entry                    in varchar2 default null,
    p_body_title                      in varchar2 default null,
    p_notification_message            in varchar2 default null,
    p_attribute1                      in varchar2 default null,
    p_attribute2                      in varchar2 default null,
    p_attribute3                      in varchar2 default null,
    p_attribute4                      in varchar2 default null,
    p_attribute5                      in varchar2 default null,
    p_attribute6                      in varchar2 default null,
    --
    p_table_bgcolor                   in varchar2 default null,
    p_heading_bgcolor                 in varchar2 default null,
    p_table_cattributes               in varchar2 default null,
    p_font_size                       in varchar2 default null,
    p_font_face                       in varchar2 default null,
    --
    p_region_table_cattributes        in varchar2 default null,
    --
    p_app_tab_before_tabs             in varchar2 default null,
    p_app_tab_current_tab             in varchar2 default null,
    p_app_tab_non_current_tab         in varchar2 default null,
    p_app_tab_after_tabs              in varchar2 default null,
    --
    p_error_page_template             in varchar2 default null,
    --
    p_default_button_position         in varchar2 default null,
    p_required_patch                  in number   default null,
    p_reference_id                    in number   default null,
    p_translate_this_template         in varchar2 default c_n,
    p_mobile_page_template            in varchar2 default c_n, -- obsolete
    p_template_comment                in varchar2 default null,
    p_breadcrumb_def_reg_pos          in varchar2 default null,
    p_sidebar_def_reg_pos             in varchar2 default null,
    --
    p_grid_type                       in varchar2 default 'TABLE',
    p_grid_max_columns                in number   default null,
    p_grid_always_use_max_columns     in boolean  default null,
    p_grid_has_column_span            in boolean  default null,
    p_grid_always_emit                in boolean  default null,
    p_grid_emit_empty_leading_cols    in boolean  default null,
    p_grid_emit_empty_trail_cols      in boolean  default null,
    p_grid_default_label_col_span     in number   default null,
    p_grid_template                   in varchar2 default null,
    p_grid_row_template               in varchar2 default null,
    p_grid_column_template            in varchar2 default null,
    p_grid_first_column_attributes    in varchar2 default null,
    p_grid_last_column_attributes     in varchar2 default null,
    p_grid_javascript_debug_code      in varchar2 default null,
    --
    p_dialog_js_init_code             in varchar2 default null,
    p_dialog_js_close_code            in varchar2 default null,
    p_dialog_js_cancel_code           in varchar2 default null,
    p_dialog_height                   in varchar2 default null,
    p_dialog_width                    in varchar2 default null,
    p_dialog_max_width                in varchar2 default null,
    p_dialog_css_classes              in varchar2 default null,
    p_dialog_browser_frame            in varchar2 default null,
    --
    p_has_edit_links                  in boolean  default true, -- Deprecated
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    p_default_template_options        in varchar2 default null,
    p_preset_template_options         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_page_tmpl_display_point (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_page_template_id                in number,
    p_name                            in varchar2,
    p_placeholder                     in varchar2,
    p_has_grid_support                in boolean,
    p_has_region_support              in boolean  default true,
    p_has_item_support                in boolean  default false,
    p_has_button_support              in boolean  default false,
    p_glv_new_row                     in boolean  default true,
    p_max_fixed_grid_columns          in number   default null,
    p_component_comment               in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_button_templates (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_template_name                   in varchar2 default null,
    p_internal_name                   in varchar2 default null,
    p_template                        in clob     default null,
    p_hot_template                    in clob     default null,
    p_translate_this_template         in varchar2 default c_n,
    p_template_comment                in varchar2 default null,
    p_reference_id                    in number   default null,
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    p_default_template_options        in varchar2 default null,
    p_preset_template_options         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plug_template (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_page_plug_template_name         in varchar2 default null,
    p_internal_name                   in varchar2 default null,
    p_javascript_file_urls            in varchar2 default null,
    p_javascript_code_onload          in varchar2 default null,
    p_css_file_urls                   in varchar2 default null,
    p_layout                          in varchar2 default 'TABLE',
    p_render_form_items_in_table      in varchar2 default null,  -- obsolete
    p_template                        in varchar2 default null,
    p_template2                       in varchar2 default null,
    p_template3                       in varchar2 default null,
    p_sub_plug_header_template        in varchar2 default null,
    p_sub_plug_header_entry_templ     in varchar2 default null,
    p_sub_plug_template               in varchar2 default null,
    p_plug_table_bgcolor              in varchar2 default null,
    p_plug_heading_bgcolor            in varchar2 default null,
    p_plug_font_size                  in varchar2 default null,
    p_image_template                  in varchar2 default null,
    p_default_field_template_id       in number   default null,
    p_default_req_field_templ_id      in number   default null,
    p_default_label_alignment         in varchar2 default 'RIGHT',
    p_default_field_alignment         in varchar2 default 'LEFT',
    p_default_button_template_id      in number   default null,
    p_default_button_position         in varchar2 default null,
    p_default_landmark_type           in varchar2 default null,
    p_region_title_dom_id             in varchar2 default null,
    p_reference_id                    in number   default null,
    p_form_table_attr                 in varchar2 default null,
    p_translate_this_template         in varchar2 default c_n,
    p_template_comment                in varchar2 default null,
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    p_default_template_options        in varchar2 default null,
    p_preset_template_options         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
-- provides compatability with version 1.0.0
--==============================================================================
procedure set_plug_template_tab_attr (
    p_id                              in number   default null,
    p_form_table_attr                 in varchar2 default null );

--==============================================================================
procedure create_plug_tmpl_display_point (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plug_template_id                in number,
    p_name                            in varchar2,
    p_placeholder                     in varchar2,
    p_has_grid_support                in boolean,
    p_has_region_support              in boolean  default false,
    p_has_item_support                in boolean  default true,
    p_has_button_support              in boolean  default true,
    p_glv_new_row                     in boolean  default true,
    p_max_fixed_grid_columns          in number   default null,
    p_component_comment               in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_list_template (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_list_template_name              in varchar2 default null,
    p_internal_name                   in varchar2 default null,
    p_javascript_file_urls            in varchar2 default null,
    p_javascript_code_onload          in varchar2 default null,
    p_css_file_urls                   in varchar2 default null,
    p_inline_css                      in varchar2 default null,
    p_list_template_current           in varchar2 default null,
    p_list_template_noncurrent        in varchar2 default null,
    p_list_template_before_rows       in varchar2 default null,
    p_list_template_after_rows        in varchar2 default null,
    p_between_items                   in varchar2 default null,
    p_before_sub_list                 in varchar2 default null,
    p_after_sub_list                  in varchar2 default null,
    p_between_sub_list_items          in varchar2 default null,
    p_sub_list_item_current           in clob     default null,
    p_sub_list_item_noncurrent        in clob     default null,
    p_item_templ_curr_w_child         in clob     default null,
    p_item_templ_noncurr_w_child      in clob     default null,
    p_sub_templ_curr_w_child          in clob     default null,
    p_sub_templ_noncurr_w_child       in clob     default null,
    -- apex 4.0 mike
    p_f_list_template_noncurrent      in clob     default null,
    p_f_list_template_current         in clob     default null,
    p_f_item_template_curr_w_child    in clob     default null,
    p_fi_template_noncurr_w_child     in clob     default null,
    --
    p_reference_id                    in number   default null,
    p_translate_this_template         in varchar2 default c_n,
    p_list_template_comment           in varchar2 default null,
    --
    p_a01_label                       in varchar2 default null,
    p_a02_label                       in varchar2 default null,
    p_a03_label                       in varchar2 default null,
    p_a04_label                       in varchar2 default null,
    p_a05_label                       in varchar2 default null,
    p_a06_label                       in varchar2 default null,
    p_a07_label                       in varchar2 default null,
    p_a08_label                       in varchar2 default null,
    p_a09_label                       in varchar2 default null,
    p_a10_label                       in varchar2 default null,
    p_a11_label                       in varchar2 default null,
    p_a12_label                       in varchar2 default null,
    p_a13_label                       in varchar2 default null,
    p_a14_label                       in varchar2 default null,
    p_a15_label                       in varchar2 default null,
    p_a16_label                       in varchar2 default null,
    p_a17_label                       in varchar2 default null,
    p_a18_label                       in varchar2 default null,
    p_a19_label                       in varchar2 default null,
    p_a20_label                       in varchar2 default null,
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    p_default_template_options        in varchar2 default null,
    p_preset_template_options         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_row_template (
    p_id                              in number default null,
    p_flow_id                         in number default wwv_flow.g_flow_id,
    p_row_template_name               in varchar2 default null,
    p_internal_name                   in varchar2 default null,
    p_javascript_file_urls            in varchar2 default null,
    p_javascript_code_onload          in varchar2 default null,
    p_css_file_urls                   in varchar2 default null,
    p_row_template_type               in varchar2 default null,
    p_before_column_heading           in varchar2 default null, -- new 3.1
    p_column_heading_template         in varchar2 default null,
    p_column_heading_sort_asc_temp    in varchar2 default null,
    p_column_heading_sort_desc_tem    in varchar2 default null,
    p_column_heading_sort_temp        in varchar2 default null,
    p_after_column_heading            in varchar2 default null, -- new 3.1
    p_row_template1                   in varchar2 default null,
    p_row_template_condition1         in varchar2 default null,
    p_row_template_display_cond1      in varchar2 default null,
    p_row_template2                   in varchar2 default null,
    p_row_template_condition2         in varchar2 default null,
    p_row_template_display_cond2      in varchar2 default null,
    p_row_template3                   in varchar2 default null,
    p_row_template_condition3         in varchar2 default null,
    p_row_template_display_cond3      in varchar2 default null,
    p_row_template4                   in varchar2 default null,
    p_row_template_condition4         in varchar2 default null,
    p_row_template_display_cond4      in varchar2 default null,
    p_row_template_before_rows        in varchar2 default null,
    p_row_template_after_rows         in varchar2 default null,
    p_row_template_before_first       in varchar2 default null,
    p_row_template_after_last         in varchar2 default null,
    p_row_template_table_attr         in varchar2 default null,
    p_reference_id                    in number   default null,
    --
    p_pagination_template             in varchar2 default null,
    p_next_page_template              in varchar2 default null,
    p_previous_page_template          in varchar2 default null,
    p_next_set_template               in varchar2 default null,
    p_previous_set_template           in varchar2 default null,
    --
    p_row_style_mouse_over            in varchar2 default null,
    p_row_style_mouse_out             in varchar2 default null,
    p_row_style_checked               in varchar2 default null,
    p_row_style_unchecked             in varchar2 default null,
    --
    p_translate_this_template         in varchar2 default c_n,
    p_row_template_comment            in varchar2 default null,
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    p_default_template_options        in varchar2 default null,
    p_preset_template_options         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_row_template_patch (
    p_id                              in number,
    p_row_template_before_first       in varchar2 default null,
    p_row_template_after_last         in varchar2 default null );

--==============================================================================
procedure create_field_template (
    p_id                              in number default null,
    p_flow_id                         in number default wwv_flow.g_flow_id,
    p_template_name                   in varchar2 default null,
    p_internal_name                   in varchar2 default null,
    p_template_body1                  in varchar2 default null,
    p_template_body2                  in varchar2 default null,
    p_before_item                     in varchar2 default null,
    p_after_item                      in varchar2 default null,
    p_item_pre_text                   in varchar2 default null,
    p_item_post_text                  in varchar2 default null,
    p_before_element                  in varchar2 default null,
    p_after_element                   in varchar2 default null,
    p_help_link                       in varchar2 default null,
    p_inline_help_text                in varchar2 default null,
    p_error_template                  in varchar2 default null,
    p_on_error_before_label           in varchar2 default null,
    p_on_error_after_label            in varchar2 default null,
    p_reference_id                    in number   default null,
    p_translate_this_template         in varchar2 default c_n,
    p_template_comment                in varchar2 default null,
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    p_default_template_options        in varchar2 default null,
    p_preset_template_options         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
-- Legacy
procedure create_calendar_template (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_cal_template_name               in varchar2 default null,
    p_internal_name                   in varchar2 default null,
    p_translate_this_template         in varchar2 default c_n,
    p_month_title_format              in varchar2 default null,
    p_day_of_week_format              in varchar2 default null,
    p_month_open_format               in varchar2 default null,
    p_month_close_format              in varchar2 default null,
    p_day_title_format                in varchar2 default null,
    p_day_open_format                 in varchar2 default null,
    p_day_close_format                in varchar2 default null,
    p_today_open_format               in varchar2 default null,
    p_weekend_title_format            in varchar2 default null,
    p_weekend_open_format             in varchar2 default null,
    p_weekend_close_format            in varchar2 default null,
    p_nonday_title_format             in varchar2 default null,
    p_nonday_open_format              in varchar2 default null,
    p_nonday_close_format             in varchar2 default null,
    p_week_title_format               in varchar2 default null,
    p_week_open_format                in varchar2 default null,
    p_week_close_format               in varchar2 default null,
    p_daily_title_format              in varchar2 default null,
    p_daily_open_format               in varchar2 default null,
    p_daily_close_format              in varchar2 default null,
    p_weekly_title_format             in varchar2 default null,
    p_weekly_day_of_week_format       in varchar2 default null,
    p_weekly_month_open_format        in varchar2 default null,
    p_weekly_month_close_format       in varchar2 default null,
    p_weekly_day_title_format         in varchar2 default null,
    p_weekly_day_open_format          in varchar2 default null,
    p_weekly_day_close_format         in varchar2 default null,
    p_weekly_today_open_format        in varchar2 default null,
    p_weekly_weekend_title_format     in varchar2 default null,
    p_weekly_weekend_open_format      in varchar2 default null,
    p_weekly_weekend_close_format     in varchar2 default null,
    p_weekly_time_open_format         in varchar2 default null,
    p_weekly_time_close_format        in varchar2 default null,
    p_weekly_time_title_format        in varchar2 default null,
    p_weekly_hour_open_format         in varchar2 default null,
    p_weekly_hour_close_format        in varchar2 default null,
    p_daily_day_of_week_format        in varchar2 default null,
    p_daily_month_title_format        in varchar2 default null,
    p_daily_month_open_format         in varchar2 default null,
    p_daily_month_close_format        in varchar2 default null,
    p_daily_day_title_format          in varchar2 default null,
    p_daily_day_open_format           in varchar2 default null,
    p_daily_day_close_format          in varchar2 default null,
    p_daily_today_open_format         in varchar2 default null,
    p_daily_time_open_format          in varchar2 default null,
    p_daily_time_close_format         in varchar2 default null,
    p_daily_time_title_format         in varchar2 default null,
    p_daily_hour_open_format          in varchar2 default null,
    p_daily_hour_close_format         in varchar2 default null,
    p_cust_month_title_format         in varchar2 default null,
    p_cust_day_of_week_format         in varchar2 default null,
    p_cust_month_open_format          in varchar2 default null,
    p_cust_month_close_format         in varchar2 default null,
    p_cust_week_title_format          in varchar2 default null,
    p_cust_week_open_format           in varchar2 default null,
    p_cust_week_close_format          in varchar2 default null,
    p_cust_day_title_format           in varchar2 default null,
    p_cust_day_open_format            in varchar2 default null,
    p_cust_day_close_format           in varchar2 default null,
    p_cust_today_open_format          in varchar2 default null,
    p_cust_daily_title_format         in varchar2 default null,
    p_cust_daily_open_format          in varchar2 default null,
    p_cust_daily_close_format         in varchar2 default null,
    p_cust_nonday_title_format        in varchar2 default null,
    p_cust_nonday_open_format         in varchar2 default null,
    p_cust_nonday_close_format        in varchar2 default null,
    p_cust_weekend_title_format       in varchar2 default null,
    p_cust_weekend_open_format        in varchar2 default null,
    p_cust_weekend_close_format       in varchar2 default null,
    p_cust_hour_open_format           in varchar2 default null,
    p_cust_hour_close_format          in varchar2 default null,
    p_cust_time_title_format          in varchar2 default null,
    p_cust_time_open_format           in varchar2 default null,
    p_cust_time_close_format          in varchar2 default null,
    p_cust_wk_month_title_format      in varchar2 default null,
    p_cust_wk_day_of_week_format      in varchar2 default null,
    p_cust_wk_month_open_format       in varchar2 default null,
    p_cust_wk_month_close_format      in varchar2 default null,
    p_cust_wk_week_title_format       in varchar2 default null,
    p_cust_wk_week_open_format        in varchar2 default null,
    p_cust_wk_week_close_format       in varchar2 default null,
    p_cust_wk_day_title_format        in varchar2 default null,
    p_cust_wk_day_open_format         in varchar2 default null,
    p_cust_wk_day_close_format        in varchar2 default null,
    p_cust_wk_today_open_format       in varchar2 default null,
    p_cust_wk_weekend_title_format    in varchar2 default null,
    p_cust_wk_weekend_open_format     in varchar2 default null,
    p_cust_wk_weekend_close_format    in varchar2 default null,
    p_cust_month_day_height_pix       in varchar2 default null,
    p_cust_month_day_height_per       in varchar2 default null,
    p_cust_week_day_width_pix         in varchar2 default null,
    p_cust_week_day_width_per         in varchar2 default null,
    p_agenda_format                   in varchar2 default null,
    p_agenda_past_day_format          in varchar2 default null,
    p_agenda_today_day_format         in varchar2 default null,
    p_agenda_future_day_format        in varchar2 default null,
    p_agenda_past_entry_format        in varchar2 default null,
    p_agenda_today_entry_format       in varchar2 default null,
    p_agenda_future_entry_format      in varchar2 default null,
    p_month_data_format               in varchar2 default null,
    p_month_data_entry_format         in varchar2 default null,
    p_reference_id                    in number   default null,
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_email_template (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_version_number                  in number   default 1,
    p_subject                         in varchar2,
    p_html_body                       in clob,
    p_html_header                     in clob     default null,
    p_html_footer                     in clob     default null,
    p_html_template                   in clob     default null,
    p_text_template                   in clob     default null,
    p_comment                         in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- A U T O M A T I O N S
--
--==============================================================================
procedure create_automation (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_static_id                       in varchar2 default null,
    p_trigger_type                    in varchar2,
    --
    p_polling_interval                in varchar2 default null,
    p_polling_status                  in varchar2 default null,
    --
    p_result_type                     in varchar2 default null,
    p_location                        in varchar2 default null,
    p_remote_server_id                in number   default null,
    p_web_src_module_id               in number   default null,
    p_web_src_array_col_id            in number   default null,  -- obsolete
    p_array_column_id                 in number   default null,
    p_document_source_id              in number   default null,
    p_use_local_sync_table            in boolean  default null,
    p_query_type                      in varchar2 default null,
    p_query_source                    in varchar2 default null,
    p_function_body_language          in varchar2 default null,
    p_query_owner                     in varchar2 default null,
    p_query_table                     in varchar2 default null,
    p_query_match                     in varchar2 default null,
    p_query_columns                   in varchar2 default null,
    p_query_where                     in varchar2 default null,
    p_query_order_by                  in varchar2 default null,
    p_source_post_processing          in varchar2 default null,
    p_include_rowid_column            in boolean  default null,
    p_optimizer_hint                  in varchar2 default null,
    p_external_filter_expr            in varchar2 default null,
    p_external_order_by_expr          in varchar2 default null,
    --
    p_pk_column_name                  in varchar2 default null,
    p_max_rows_to_process             in number   default null,
    p_commit_each_row                 in boolean,
    p_error_handling_type             in varchar2 default null,
    --
    p_code_snippet                    in varchar2 default null,
    p_init_proc_name                  in varchar2 default null,
    p_before_processing_proc_name     in varchar2 default null,
    p_teardown_proc_name              in varchar2 default null,
    --
    p_condition_type                  in varchar2 default null,
    p_condition_expr1                 in varchar2 default null,
    p_condition_expr2                 in varchar2 default null,
    --
    p_build_option_id                 in varchar2 default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_automation_action (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_automation_id                   in number,
    --
    p_name                            in varchar2,
    p_execution_sequence              in number,
    p_action_type                     in varchar2,
    --
    p_action_clob                     in varchar2 default null,
    p_action_clob_language            in varchar2 default null,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_attribute_09                    in varchar2 default null,
    p_attribute_10                    in varchar2 default null,
    p_attribute_11                    in varchar2 default null,
    p_attribute_12                    in varchar2 default null,
    p_attribute_13                    in varchar2 default null,
    p_attribute_14                    in varchar2 default null,
    p_attribute_15                    in varchar2 default null,
    --
    p_location                        in varchar2 default null,
    p_remote_server_id                in number   default null,
    p_web_src_module_id               in number   default null,
    p_web_src_operation_id            in number   default null,
    --
    p_error_message                   in varchar2 default null,
    p_stop_execution_on_error         in boolean,
    --
    p_condition_type                  in varchar2 default null,
    p_condition_expr1                 in varchar2 default null,
    p_condition_expr2                 in varchar2 default null,
    p_exec_cond_for_each_row          in boolean  default null,
    --
    p_build_option_id                 in varchar2 default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- P R I N T I N G
--
--==============================================================================
procedure create_report_layout (
    p_id                              in number                      default null,
    p_flow_id                         in number                      default wwv_flow.g_flow_id,
    p_report_layout_name              in varchar2                    default null,
    p_static_id                       in varchar2                    default null,
    p_report_layout_type              in varchar2                    default null,
    p_page_template                   in clob                        default null,
    p_varchar2_table                  in sys.dbms_sql.varchar2_table default c_empty_varchar2_table, -- obsolete
    p_file_content                    in blob                        default null,
    p_file_name                       in varchar2                    default null,
    p_mime_type                       in varchar2                    default null,
    p_data_loop_name                  in varchar2                    default null,
    p_xslfo_column_heading            in varchar2                    default null,
    p_xslfo_column_template           in varchar2                    default null,
    p_xslfo_column_template_width     in varchar2                    default null,
    p_reference_id                    in number                      default null,
    p_version_scn                     in number                      default null,
    p_report_layout_comment           in varchar2                    default null,
    --
    p_created_by                      in varchar2                    default null,
    p_created_on                      in date                        default null,
    p_updated_by                      in varchar2                    default null,
    p_updated_on                      in date                        default null );

--==============================================================================
procedure create_shared_query (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_static_id                       in varchar2 default null,
    p_query_text                      in varchar2 default null, -- obsolete
    p_xml_structure                   in varchar2 default null, -- obsolete
    p_include_session_state           in varchar2 default null,
    p_report_layout_id                in number   default null,
    p_format                          in varchar2 default null,
    p_format_item                     in varchar2 default null,
    p_output_file_name                in varchar2 default null,
    p_content_disposition             in varchar2 default null,
    p_document_header                 in varchar2 default null, -- obsolete
    p_xml_items                       in varchar2 default null, -- obsolete
    p_session_state_items             in varchar2 default null);

--==============================================================================
procedure create_shared_query_stmnt (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_shared_query_id               in varchar2 default null,
    p_name                          in varchar2 default null,
    p_display_sequence              in number   default null,
    p_data_loop_name                in varchar2 default null,
    p_location                      in varchar2 default null,
    -- SQL (local and remote) and graph/pql
    p_query_type                    in varchar2 default null,
    p_query_owner                   in varchar2 default null,
    p_query_table                   in varchar2 default null,
    p_query_match                   in varchar2 default null,
    p_query_columns                 in varchar2 default null,
    p_query_where                   in varchar2 default null,
    p_query_order_by                in varchar2 default null,
    p_include_rowid_column          in varchar2 default null,
    p_optimizer_hint                in varchar2 default null,
    p_sql_statement                 in varchar2 default null,
    p_function_body_language        in varchar2 default null,
    -- REST Data Source
    p_web_src_module_id             in number   default null,
    p_web_src_array_column_id       in number   default null,  -- obsolete
    p_array_column_id               in number   default null,
    p_document_source_id            in number   default null,
    p_use_local_sync_table          in varchar2 default null,
    p_source_post_processing        in varchar2 default null,
    p_external_filter_expr          in varchar2 default null,
    p_external_order_by_expr        in varchar2 default null,
    -- REST Enabled SQL
    p_remote_server_id              in number   default null,
    p_remote_sql_caching            in varchar2 default null,
    p_remote_sql_invalidate_when    in varchar2  default null );

--==============================================================================
--
-- L I S T S
--
--==============================================================================
procedure create_list (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_list_type                       in varchar2 default 'STATIC',
    p_list_language                   in varchar2 default null,
    p_list_query                      in varchar2 default null,
    p_list_status                     in varchar2 default null,
    p_list_displayed                  in varchar2 default 'BY_DEFAULT',
    p_display_row_template_id         in number   default null, -- obsolete
    p_required_patch                  in number   default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_list_item (
    p_id                              in number   default null,
    p_list_id                         in number   default current_list_id,
    p_list_item_type                  in varchar2 default 'LINK',
    p_list_item_status                in varchar2 default 'PUBLIC',
    p_item_displayed                  in varchar2 default 'BY_DEFAULT',
    p_list_item_display_sequence      in number   default null,
    p_list_item_link_text             in varchar2 default null,
    p_list_item_link_target           in varchar2 default null,
    p_list_item_icon                  in varchar2 default null,
    p_list_item_icon_attributes       in varchar2 default null,
    p_list_item_icon_alt_attribute    in varchar2 default null,
    p_list_item_disp_cond_type        in varchar2 default null,
    p_list_item_disp_condition        in varchar2 default null,
    p_list_item_disp_cond_type2       in varchar2 default null,
    p_list_item_disp_condition2       in varchar2 default null,
    --
    p_list_item_icon_exp              in varchar2 default null,
    p_list_item_icon_exp_attr         in varchar2 default null,
    p_list_item_parent_id             in number   default null,
    p_parent_list_item_id             in number   default null,
    p_sub_list_id                     in number   default null,
    p_sub_item_count                  in number   default null,
    --
    p_list_countclicks_y_n            in varchar2 default c_n,
    p_list_countclicks_cat            in varchar2 default null,
    p_list_text_01                    in varchar2 default null,
    p_list_text_02                    in varchar2 default null,
    p_list_text_03                    in varchar2 default null,
    p_list_text_04                    in varchar2 default null,
    p_list_text_05                    in varchar2 default null,
    p_list_text_06                    in varchar2 default null,
    p_list_text_07                    in varchar2 default null,
    p_list_text_08                    in varchar2 default null,
    p_list_text_09                    in varchar2 default null,
    p_list_text_10                    in varchar2 default null,
    p_translate_list_text_y_n         in varchar2 default null,
    p_list_item_owner                 in varchar2 default null,
    p_list_item_current_for_pages     in varchar2 default null,
    p_list_item_current_type          in varchar2 default null,
    p_list_item_current_language      in varchar2 default null,
    p_security_scheme                 in varchar2 default null,
    p_required_patch                  in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure set_list_item_sequence (
    p_id                              in number   default null,
    p_item_sequence                   in number   default null );

--==============================================================================
procedure set_list_item_link_text (
    p_id                              in number   default null,
    p_link_text                       in varchar2 default null );

--==============================================================================
procedure set_list_item_link_target (
    p_id                              in number   default null,
    p_link_target                     in varchar2 default null );

--==============================================================================
--
-- T R A N S L A T I O N S
--
--==============================================================================
procedure create_dynamic_translation (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_language                        in varchar2 default null,
    p_from                            in varchar2 default null,
    p_to                              in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_message (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_message_language                in varchar2 default 'en',
    p_message_text                    in varchar2 default null,
    p_is_js_message                   in boolean  default false,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_comment                         in varchar2 default null,
    p_metadata                        in clob     default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_language_map (
    p_id                              in number   default null,
    p_primary_language_flow_id        in number   default wwv_flow.g_flow_id,
    p_translation_flow_id             in number   default null,
    p_translation_flow_language_cd    in varchar2 default null,
    p_translation_image_directory     in varchar2 default null,
    p_translation_comments            in varchar2 default null,
    p_direction_right_to_left         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_translation (
    p_id                              in number   default null,
    p_translated_flow_id              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_page_id                         in number   default wwv_flow_imp_page.current_page_id,
    p_translate_column_id             in number   default null,
    p_column_json_path                in varchar2 default null,
    p_translate_to_id                 in number   default null,
    p_translate_from_id               in number   default null,
    p_translate_to_lang_code          in varchar2 default null,
    p_translation_specific_to_item    in varchar2 default 'NO',
    p_translate_to_text               in varchar2 default null,
    p_translate_from_text             in varchar2 default null,
    p_template_translatable           in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure remove_translation (
    p_translated_flow_id              in number default null);

--==============================================================================
procedure remove_dyanamic_translation (
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_language                        in varchar2 default null);

--==============================================================================
procedure migrate_translations (
    p_flow_id                         in number );

--==============================================================================
procedure migrate_shared_query_stmnts (
    p_flow_id                         in number );

--==============================================================================
--
-- P L U G I N S
--
--==============================================================================
procedure remove_plugin (
    p_flow_id                         in number,
    p_plugin_type                     in varchar2,
    p_name                            in varchar2 );

--==============================================================================
procedure create_plugin (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_theme_id                        in number   default null,
    p_plugin_type                     in varchar2,
    p_name                            in varchar2,
    p_display_name                    in varchar2,
    p_category                        in varchar2 default null,
    p_supported_ui_types              in varchar2 default null,
    p_supported_component_types       in varchar2 default null,
    p_supported_data_types            in varchar2 default null,
    p_image_prefix                    in varchar2 default null,
    p_javascript_file_urls            in varchar2 default null,
    p_css_file_urls                   in varchar2 default null,
    p_plsql_code                      in varchar2 default null,
    p_partial_template                in varchar2 default null,
    p_default_escape_mode             in varchar2 default null,
    p_translate_this_template         in boolean  default null,
    p_api_version                     in number   default null,
    p_render_function                 in varchar2 default null,
    p_meta_data_function              in varchar2 default null,
    p_emit_value_function             in varchar2 default null,
    p_ajax_function                   in varchar2 default null,
    p_validation_function             in varchar2 default null,
    p_execution_function              in varchar2 default null,
    p_termination_function            in varchar2 default null,
    p_session_sentry_function         in varchar2 default null,
    p_invalid_session_function        in varchar2 default null,
    p_authentication_function         in varchar2 default null,
    p_post_logout_function            in varchar2 default null,
    p_wsm_capabilities_function       in varchar2 default null,
    p_wsm_fetch_function              in varchar2 default null,
    p_wsm_dml_function                in varchar2 default null,
    p_wsm_execute_function            in varchar2 default null,
    p_wsm_discover_function           in varchar2 default null,
    p_builder_validation_function     in varchar2 default null,
    p_migration_function              in varchar2 default null,
    p_completion_function             in varchar2 default null,
    p_report_body_template            in varchar2 default null,
    p_report_group_template           in varchar2 default null,
    p_report_row_template             in varchar2 default null,
    p_report_container_template       in varchar2 default null,
    p_report_placeholder_count        in number   default null,
    p_default_slot_region             in varchar2 default null,
    p_default_slot_item               in varchar2 default null,
    p_default_slot_button             in varchar2 default null,
    p_standard_attributes             in varchar2 default null,
    p_sql_min_column_count            in number   default null,
    p_sql_max_column_count            in number   default null,
    p_sql_examples                    in varchar2 default null,
    p_substitute_attributes           in boolean  default true,
    p_attribute_01                    in varchar2 default null, -- obsolete
    p_attribute_02                    in varchar2 default null, -- obsolete
    p_attribute_03                    in varchar2 default null, -- obsolete
    p_attribute_04                    in varchar2 default null, -- obsolete
    p_attribute_05                    in varchar2 default null, -- obsolete
    p_attribute_06                    in varchar2 default null, -- obsolete
    p_attribute_07                    in varchar2 default null, -- obsolete
    p_attribute_08                    in varchar2 default null, -- obsolete
    p_attribute_09                    in varchar2 default null, -- obsolete
    p_attribute_10                    in varchar2 default null, -- obsolete
    p_attribute_11                    in varchar2 default null, -- obsolete
    p_attribute_12                    in varchar2 default null, -- obsolete
    p_attribute_13                    in varchar2 default null, -- obsolete
    p_attribute_14                    in varchar2 default null, -- obsolete
    p_attribute_15                    in varchar2 default null, -- obsolete
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_subscribe_plugin_settings       in boolean  default true,
    p_is_quick_pick                   in boolean  default false,
    p_is_deprecated                   in boolean  default false,
    p_is_legacy                       in boolean  default false,
    p_help_text                       in varchar2 default null,
    p_version_identifier              in varchar2 default null,
    p_about_url                       in varchar2 default null,
    p_plugin_comment                  in varchar2 default null,
    p_files_version                   in number   default 1,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plugin_std_attribute (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_id                       in number,
    p_name                            in varchar2,
    p_is_required                     in boolean  default true,
    p_default_value                   in varchar2 default null,
    p_sql_min_column_count            in number   default null,
    p_sql_max_column_count            in number   default null,
    p_supported_ui_types              in varchar2 default null,
    p_supported_component_types       in varchar2 default null,
    p_depending_on_attribute_id       in number   default null,
    p_depending_on_has_to_exist       in boolean  default null,
    p_depending_on_condition_type     in varchar2 default null,
    p_depending_on_expression         in varchar2 default null,
    p_examples                        in varchar2 default null,
    p_help_text                       in varchar2 default null,
    p_attribute_comment               in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plugin_attr_group (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_id                       in number,
    p_title                           in varchar2,
    p_display_sequence                in number,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );
--==============================================================================
procedure create_plugin_attribute (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_id                       in number,
    p_attribute_scope                 in varchar2,
    p_attribute_sequence              in number,
    p_display_sequence                in number   default null,
    p_static_id                       in varchar2 default null,
    p_prompt                          in varchar2,
    p_attribute_type                  in varchar2,
    p_is_required                     in boolean,
    p_is_common                       in boolean  default true,
    p_show_in_wizard                  in boolean  default true,
    p_default_value                   in varchar2 default null,
    p_demo_value                      in varchar2 default null,
    p_escape_mode                     in varchar2 default null,
    p_display_length                  in number   default null,
    p_max_length                      in number   default null,
    p_min_value                       in number   default null,
    p_max_value                       in number   default null,
    p_unit                            in varchar2 default null,
    p_sql_min_column_count            in number   default null,
    p_sql_max_column_count            in number   default null,
    p_column_data_types               in varchar2 default null,
    p_supported_ui_types              in varchar2 default null,
    p_supported_component_types       in varchar2 default null,
    p_is_translatable                 in boolean,
    p_parent_attribute_id             in number   default null,
    p_depending_on_attribute_id       in number   default null,
    p_depending_on_comp_prop_id       in number   default null,
    p_depending_on_has_to_exist       in boolean  default null,
    p_depending_on_condition_type     in varchar2 default null,
    p_depending_on_expression         in varchar2 default null,
    p_lov_type                        in varchar2 default null,
    p_lov_component_type_id           in number   default null,
    p_lov_component_type_scope        in varchar2 default null,
    p_lov_component_type_on_delete    in varchar2 default null,
    p_reference_scope                 in varchar2 default 'COMPONENT',
    p_attribute_group_id              in number   default null,
    p_text_case                       in varchar2 default null,
    p_null_text                       in varchar2 default null,
    p_deprecated_values               in varchar2 default null,
    p_examples                        in varchar2 default null,
    p_help_text                       in varchar2 default null,
    p_important_for_accessibility     in boolean  default false,
    p_accessibility_help_text         in varchar2 default null,
    p_attribute_comment               in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plugin_attr_value (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_attribute_id             in number,
    p_display_sequence                in number,
    p_display_value                   in varchar2,
    p_return_value                    in varchar2,
    p_is_quick_pick                   in boolean  default false,
    p_is_deprecated                   in boolean  default false,
    p_help_text                       in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plugin_file (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_id                       in number,
    p_file_name                       in varchar2,
    p_mime_type                       in varchar2,
    p_file_charset                    in varchar2 default null,
    p_file_content                    in blob,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plugin_event (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_id                       in number,
    p_name                            in varchar2,
    p_display_name                    in varchar2,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plugin_act_template (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_id                       in number,
    p_name                            in varchar2,
    p_type                            in varchar2,
    p_template                        in varchar2,
    p_translate_this_template         in boolean  default false,
    p_help_text                       in varchar2 default null,
    p_action_template_comments        in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plugin_act_position (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_id                       in number,
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_display_sequence                in number,
    p_is_quick_pick                   in boolean  default false,
    p_type                            in varchar2,
    p_template_id                     in number   default null,
    p_help_text                       in varchar2 default null,
    p_action_position_comments        in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure restore_plugin_act_positions (
        p_flow_id  in number );

--==============================================================================
procedure create_plugin_slot (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_id                       in number,
    p_name                            in varchar2,
    p_placeholder                     in varchar2,
    p_has_grid_support                in boolean,
    p_has_region_support              in boolean  default true,
    p_has_item_support                in boolean  default true,
    p_has_button_support              in boolean  default true,
    p_glv_new_row                     in boolean  default true,
    p_max_fixed_grid_columns          in number   default null,
    p_supported_region_types          in varchar2 default null,
    p_supported_item_types            in varchar2 default null,
    p_component_comment               in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_plugin_setting (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_plugin_type                     in varchar2,
    p_plugin                          in varchar2,
    p_attributes                      in clob     default null,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_attribute_09                    in varchar2 default null,
    p_attribute_10                    in varchar2 default null,
    p_attribute_11                    in varchar2 default null,
    p_attribute_12                    in varchar2 default null,
    p_attribute_13                    in varchar2 default null,
    p_attribute_14                    in varchar2 default null,
    p_attribute_15                    in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_native_plugin_settings (
    p_flow_id                        in number    default wwv_flow.g_flow_id );

--==============================================================================
--
-- D A T A   P R O F I L E
--
--==============================================================================
procedure create_data_profile (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_format                          in varchar2,
    p_encoding                        in varchar2 default null,
    p_csv_separator                   in varchar2 default null,
    p_csv_enclosed                    in varchar2 default null,
    p_default_xlsx_sheet_name         in varchar2 default null,
    p_skip_rows                       in number   default null,
    p_has_header_row                  in boolean  default null,
    p_decimal_characters              in varchar2 default null,
    p_row_selector                    in varchar2 default null,
    p_use_raw_json_selectors          in boolean  default null,
    p_single_row_selector             in varchar2 default null,
    p_is_single_row                   in boolean  default false,
    p_xml_namespaces                  in varchar2 default null,
    p_profile_comment                 in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_data_profile_col (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_data_profile_id                 in number,
    p_parent_column_id                in number   default null,
    p_name                            in varchar2,
    p_sequence                        in number,
    p_is_primary_key                  in boolean  default false,
    p_column_type                     in varchar2 default null,
    p_data_type                       in varchar2,
    p_max_length                      in number   default null,
    p_decimal_char                    in varchar2 default null,
    p_group_char                      in varchar2 default null,
    p_format_mask                     in varchar2 default null,
    p_validation_regexp               in varchar2 default null,
    p_has_time_zone                   in boolean  default null,
    p_is_hidden                       in boolean  default false,
    p_is_filterable                   in boolean  default true,
    p_is_common                       in boolean  default true,
    p_selector_type                   in varchar2 default null,
    p_selector                        in varchar2 default null,
    p_remote_attribute_name           in varchar2 default null,
    p_remote_data_type                in varchar2 default null,
    p_additional_info                 in varchar2 default null,
    p_transform_type                  in varchar2 default null,
    p_sql_expression                  in varchar2 default null, -- obsolete
    p_expression1                     in varchar2 default null,
    p_expression2                     in varchar2 default null,
    p_lookup_owner                    in varchar2 default null,
    p_lookup_table                    in varchar2 default null,
    p_lookup_column1                  in varchar2 default null,
    p_lookup_value1                   in varchar2 default null,
    p_lookup_column2                  in varchar2 default null,
    p_lookup_value2                   in varchar2 default null,
    p_lookup_column3                  in varchar2 default null,
    p_lookup_value3                   in varchar2 default null,
    p_lookup_key_column               in varchar2 default null,
    p_lookup_where_clause             in varchar2 default null,
    p_column_comment                  in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- O B J E C T   S O U R C E S
--
--==============================================================================
procedure create_document_source(
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    --
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_document_source_type            in varchar2,
    --
    p_location                        in varchar2,
    --
    p_remote_server_id                in number   default null,
    p_remote_sql_caching              in varchar2 default null,
    p_remote_sql_invalidate_when      in varchar2 default null,
    --
    p_object_owner                    in varchar2 default null,
    p_object_name                     in varchar2,
    p_where_clause                    in varchar2 default null,
    --
    p_data_profile_id                 in number,
    --
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_source_comment                  in varchar2 default null,
    --
    p_created_on                      in date     default null,
    p_created_by                      in varchar2 default null,
    p_updated_on                      in date     default null,
    p_updated_by                      in varchar2 default null );

--==============================================================================
--
-- A I   CONFIG
--
--==============================================================================
procedure create_ai_config (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    --
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    --
    p_remote_server_id                in number   default null,
    p_system_prompt                   in varchar2 default null,
    p_welcome_message                 in varchar2 default null,
    p_temperature                     in number   default null,
    --
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_config_comment                  in varchar2 default null,
    --
    p_created_on                      in date     default null,
    p_created_by                      in varchar2 default null,
    p_updated_on                      in date     default null,
    p_updated_by                      in varchar2 default null );

procedure create_ai_config_rag_source (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_ai_config_id                    in number   default current_ai_config_id,
    --
    p_name                            in varchar2,
    p_description                     in varchar2 default null,
    --
    p_rag_type                        in varchar2,
    p_source                          in varchar2,
    p_function_body_language          in varchar2 default null,
    p_max_tokens                      in number   default null,
    --
    p_condition_type                  in varchar2 default null,
    p_condition_expr1                 in varchar2 default null,
    p_condition_expr2                 in varchar2 default null,
    --
    p_authorization_scheme            in varchar2 default null,
    p_build_option_id                 in number   default null,
    --
    p_rag_comment                     in varchar2 default null,
    --
    p_created_on                      in date     default null,
    p_created_by                      in varchar2 default null,
    p_updated_on                      in date     default null,
    p_updated_by                      in varchar2 default null );

--==============================================================================
--
-- R E S T   D A T A   S O U R C E S
--
--==============================================================================
procedure restore_web_source_comp_params;

procedure create_web_source_module (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_web_source_type                 in varchar2,
    p_data_profile_id                 in number,
    p_remote_server_id                in number,
    p_url_path_prefix                 in varchar2,
    p_auth_remote_server_id           in number   default null,
    p_auth_url_path_prefix            in varchar2 default null,
    p_credential_id                   in number   default null,
    p_sync_is_active                  in boolean  default false,
    p_sync_table_owner                in varchar2 default null,
    p_sync_table_name                 in varchar2 default null,
    p_sync_array_col_id               in number   default null,
    p_sync_type                       in varchar2 default null,
    p_sync_interval                   in varchar2 default null,
    p_sync_commit_interval            in number   default null,
    p_sync_max_http_requests          in number   default null,
    p_timeout                         in number   default null,
    p_pass_ecid                       in boolean  default null,
    p_max_requests_timeframe_sec      in number   default null,
    p_max_requests                    in number   default null,
    p_max_requests_exceed_action      in varchar2 default null,
    p_reference_id                    in number   default null,
    p_catalog_internal_name           in varchar2 default null,
    p_catalog_service_name            in varchar2 default null,
    p_catalog_service_version         in number   default null,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_attribute_09                    in varchar2 default null,
    p_attribute_10                    in varchar2 default null,
    p_attribute_11                    in varchar2 default null,
    p_attribute_12                    in varchar2 default null,
    p_attribute_13                    in varchar2 default null,
    p_attribute_14                    in varchar2 default null,
    p_attribute_15                    in varchar2 default null,
    p_module_comment                  in varchar2 default null,
    p_openapi_url                     in varchar2 default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_web_source_operation (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_web_src_module_id               in number,
    p_name                            in varchar2 default null,
    p_static_id                       in varchar2 default null,
    p_data_profile_id                 in number   default null,
    p_data_profile_array_col_id       in number   default null,
    p_operation                       in varchar2,
    p_database_operation              in varchar2 default null,
    p_url_pattern                     in varchar2,
    p_request_body_template           in varchar2 default null,
    p_legacy_ords_fixed_page_size     in number   default null,
    p_force_error_for_http_404        in boolean  default null,
    p_allow_fetch_all_rows            in boolean  default null,
    p_fetch_all_rows_timeout          in number   default null,
    p_caching                         in varchar2 default null,
    p_invalidate_when                 in varchar2 default null,
    p_security_scheme                 in varchar2 default null,
    p_operation_comment               in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_web_source_sync_step (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_web_src_module_id               in number,
    p_static_id                       in varchar2,
    p_external_filter_expr            in varchar2 default null,
    p_is_active                       in boolean  default true,
    p_execution_sequence              in number,
    p_sync_step_comment               in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_web_source_param (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_web_src_module_id               in number,
    p_web_src_operation_id            in number   default null,
    p_name                            in varchar2,
    p_param_type                      in varchar2,
    p_data_type                       in varchar2 default null,
    p_output_format_mask              in varchar2 default null,
    p_validation_regexp               in varchar2 default null,
    p_is_required                     in boolean  default true,
    p_direction                       in varchar2 default 'IN',
    p_value                           in varchar2 default null,
    p_is_static                       in boolean  default false,
    p_is_array                        in boolean  default false,
    p_array_separator_char            in varchar2 default null,
    p_omit_when_null                  in boolean  default false,
    p_is_query_param                  in boolean  default false,
    p_param_comment                   in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date    default null );

--==============================================================================
procedure create_web_source_comp_param (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_page_id                         in number   default null,
    p_web_src_param_id                in number,
    p_page_plug_id                    in number   default null,
    p_page_process_id                 in number   default null,
    p_app_process_id                  in number   default null,
    p_jet_chart_series_id             in number   default null,
    p_shared_lov_id                   in number   default null,
    p_module_sync_step_id             in number   default null,
    p_automation_id                   in number   default null,
    p_automation_action_id            in number   default null,
    p_task_def_action_id              in number   default null,
    p_map_region_layer_id             in number   default null,
    p_search_config_id                in number   default null,
    p_workflow_activity_id            in number   default null,
    p_value_type                      in varchar2 default null,
    p_value_language                  in varchar2 default null,
    p_value                           in varchar2 default null,
    p_format_mask                     in varchar2 default null,
    p_ignore_output                   in boolean  default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null);

--==============================================================================
--
-- I N V O K E   A P I
--
--==============================================================================
procedure create_invokeapi_comp_param (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_page_id                         in number   default null,
    p_page_process_id                 in number   default null,
    p_workflow_activity_id            in number   default null,
    --
    p_name                            in varchar2 default null,
    p_direction                       in varchar2,
    p_data_type                       in varchar2,
    p_has_default                     in boolean  default null,
    p_ignore_output                   in boolean  default null,
    p_display_sequence                in number,
    --
    p_value_type                      in varchar2 default null,
    p_value_language                  in varchar2 default null,
    p_value                           in varchar2 default null,
    p_format_mask                     in varchar2 default null,
    --
    p_param_comment                   in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- L E G A C Y   W E B   S E R V I C E   R E F E R E N C E S
--
--==============================================================================
procedure create_web_service (
    p_id                              in number   default null,
    p_security_group_id               in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_url                             in varchar2 default null,
    p_action                          in varchar2 default null,
    p_proxy_override                  in varchar2 default null,
    p_soap_version                    in varchar2 default null,
    p_soap_envelope                   in varchar2 default null,
    p_flow_items_comma_delimited      in varchar2 default null,
    p_static_parm_01                  in varchar2 default null,
    p_static_parm_02                  in varchar2 default null,
    p_static_parm_03                  in varchar2 default null,
    p_static_parm_04                  in varchar2 default null,
    p_static_parm_05                  in varchar2 default null,
    p_static_parm_06                  in varchar2 default null,
    p_static_parm_07                  in varchar2 default null,
    p_static_parm_08                  in varchar2 default null,
    p_static_parm_09                  in varchar2 default null,
    p_static_parm_10                  in varchar2 default null,
    p_stylesheet                      in varchar2 default null,
    p_reference_id                    in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_ws_operations (
    p_id                              in number   default null,
    p_ws_id                           in number   default null,
    p_name                            in varchar2 default null,
    p_input_message_name              in varchar2 default null,
    p_input_message_ns                in varchar2 default null,
    p_input_message_style             in varchar2 default null,
    p_output_message_name             in varchar2 default null,
    p_output_message_ns               in varchar2 default null,
    p_output_message_style            in varchar2 default null,
    p_header_message_name             in varchar2 default null,
    p_header_message_style            in varchar2 default null,
    p_soap_action                     in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_ws_parameters (
    p_id                              in number   default null,
    p_ws_opers_id                     in number   default null,
    p_name                            in varchar2 default null,
    p_input_or_output                 in varchar2 default null,
    p_parm_type                       in varchar2 default null,
    p_path                            in varchar2 default null,
    p_type_is_xsd                     in varchar2 default null,
    p_form_qualified                  in varchar2 default null,
    p_parent_id                       in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null);

--==============================================================================
procedure create_ws_process_parms_map (
    p_id                              in number   default null,
    p_parameter_id                    in number   default null,
    p_process_id                      in number   default null,
    p_map_type                        in varchar2 default null,
    p_parm_value                      in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null);

--==============================================================================
--
-- B R E A D C R U M B S
--
--==============================================================================
procedure create_menu (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_security_group_id               in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_menu_option (
    p_id                              in number   default null,
    p_parent_id                       in number   default null,
    p_menu_id                         in number   default current_menu_id,
    p_option_sequence                 in number   default 10,
    p_short_name                      in varchar2 default null,
    p_long_name                       in varchar2 default null,
    p_link                            in varchar2 default null,
    p_page_id                         in number   default null,
    p_also_current_for_pages          in varchar2 default null,
    p_display_when_cond_type          in varchar2 default null,
    p_display_when_condition          in varchar2 default null,
    p_display_when_condition2         in varchar2 default null,
    p_security_scheme                 in varchar2 default null,
    p_required_patch                  in number   default null,
    p_security_group_id               in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_menu_template (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_internal_name                   in varchar2 default null,
    p_before_first                    in varchar2 default null,
    p_current_page_option             in varchar2 default null,
    p_non_current_page_option         in varchar2 default null,
    p_menu_link_attributes            in varchar2 default null,
    p_between_levels                  in varchar2 default null,
    p_after_last                      in varchar2 default null,
    p_max_levels                      in number   default null,
    p_start_with_node                 in varchar2 default null,
    p_translate_this_template         in varchar2 default c_n,
    p_template_comments               in varchar2 default null,
    p_security_group_id               in number   default null,
    p_reference_id                    in number   default null,
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    p_default_template_options        in varchar2 default null,
    p_preset_template_options         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- A U T H E N T I C A T I O N
--
--==============================================================================
procedure create_authentication (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_scheme_type                     in varchar2,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_attribute_09                    in varchar2 default null,
    p_attribute_10                    in varchar2 default null,
    p_attribute_11                    in varchar2 default null,
    p_attribute_12                    in varchar2 default null,
    p_attribute_13                    in varchar2 default null,
    p_attribute_14                    in varchar2 default null,
    p_attribute_15                    in varchar2 default null,
    p_plsql_code                      in varchar2 default null,
    p_verification_function           in varchar2 default null,
    p_invalid_session_type            in varchar2 default null,
    p_invalid_session_url             in varchar2 default null,
    p_logout_url                      in varchar2 default null,
    p_pre_auth_process                in varchar2 default null,
    p_post_auth_process               in varchar2 default null,
    p_cookie_name                     in varchar2 default null,
    p_cookie_path                     in varchar2 default null,
    p_cookie_domain                   in varchar2 default null,
    p_use_secure_cookie_yn            in varchar2 default null,
    p_ras_mode                        in number   default 0,
    p_ras_dynamic_roles               in varchar2 default null,
    p_ras_namespaces                  in varchar2 default null,
    p_switch_in_session_yn            in varchar2 default c_n,
    p_help_text                       in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_comments                        in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- D A T A   L O A D I N G   ( L E G A C Y )
--
--==============================================================================
procedure create_load_table(
    p_id                              in number    default null,
    p_flow_id                         in number    default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_static_id                       in varchar2 default null,
    p_target_type                     in varchar2 default null,
    p_owner                           in varchar2 default null,
    p_table_name                      in varchar2 default null,
    p_collection_name                 in varchar2 default null,
    p_data_profile_id                 in number   default null,
    p_loading_method                  in varchar2 default null,
    p_commit_interval                 in number   default null,
    p_error_handling                  in varchar2 default null,
    p_error_collection_name           in varchar2 default null,
    --
    p_unique_column_1                 in varchar2 default null,
    p_is_uk1_case_sensitive           in varchar2 default null,
    p_unique_column_2                 in varchar2 default null,
    p_is_uk2_case_sensitive           in varchar2 default null,
    p_unique_column_3                 in varchar2 default null,
    p_is_uk3_case_sensitive           in varchar2 default null,
    p_version_column_name             in varchar2 default null,
    p_column_names_lov_id             in number   default null,
    p_skip_validation                 in varchar2 default c_n,
    p_wizard_page_ids                 in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_comments                        in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_load_table_lookup(
   p_id                               in number   default null,
   p_flow_id                          in number   default wwv_flow.g_flow_id,
   p_load_table_id                    in number,
   p_load_column_name                 in varchar2,
   p_lookup_owner                     in varchar2,
   p_lookup_table_name                in varchar2,
   p_key_column                       in varchar2,
   p_display_column                   in varchar2,
   p_alternative_key_column1          in varchar2 default null,
   p_alternative_display_column1      in varchar2 default null,
   p_alternative_key_column2          in varchar2 default null,
   p_alternative_display_column2      in varchar2 default null,
   p_where_clause                     in varchar2 default null,
   p_insert_new_value                 in varchar2 default c_n,
   p_error_message                    in varchar2 default null,
   --
   p_created_by                      in varchar2 default null,
   p_created_on                      in date     default null,
   p_updated_by                      in varchar2 default null,
   p_updated_on                      in date     default null);

--==============================================================================
procedure create_load_table_rule(
   p_id                               in number   default null,
   p_flow_id                          in number   default wwv_flow.g_flow_id,
   p_load_table_id                    in number,
   p_load_column_name                 in varchar2,
   p_rule_name                        in varchar2,
   p_rule_type                        in varchar2,
   p_rule_sequence                    in number,
   p_rule_expression1                 in varchar2 default null,
   p_rule_expression2                 in varchar2 default null,
   p_error_message                    in varchar2 default null,
   --
   p_created_by                      in varchar2 default null,
   p_created_on                      in date     default null,
   p_updated_by                      in varchar2 default null,
   p_updated_on                      in date     default null);

--==============================================================================
--
-- M I S C E L L A N E O U S
--
--==============================================================================
procedure create_app_setting (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_value                           in varchar2 default null,
    p_is_required                     in varchar2 default null,
    p_valid_values                    in varchar2 default null,
    p_on_upgrade_keep_value           in boolean  default false,
    p_required_patch                  in number   default null,
    p_comments                        in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_app_comments (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_pages                           in varchar2 default null,
    p_app_comment                     in varchar2 default null,
    p_comment_owner                   in varchar2 default null,
    p_comment_flag                    in varchar2 default null,
    p_app_version                     in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in varchar2 default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in varchar2 default null );

procedure create_app_comments (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_pages                           in varchar2 default null,
    p_app_comment                     in varchar2 default null,
    p_comment_owner                   in varchar2 default null,
    p_comment_flag                    in varchar2 default null,
    p_app_version                     in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date );

--==============================================================================
procedure create_shortcut (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_shortcut_name                   in varchar2 default null,
    p_shortcut_consideration_seq      in number   default null,
    p_shortcut_type                   in varchar2 default null,
    p_shortcut_language               in varchar2 default null,
    p_shortcut_condition_type1        in varchar2 default null,
    p_shortcut_condition1             in varchar2 default null,
    p_shortcut_condition_type2        in varchar2 default null,
    p_shortcut_condition2             in varchar2 default null,
    p_build_option                    in number   default null,
    p_error_text                      in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_comments                        in varchar2 default null,
    p_shortcut                        in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );


--==============================================================================
--
-- P W A
--
--==============================================================================
procedure create_pwa_shortcut (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_display_sequence                in number,
    p_description                     in varchar2 default null,
    p_target_url                      in varchar2,
    p_icon_url                        in varchar2 default null,
    p_build_option_id                 in number   default null,
    p_pwa_shortcut_comment            in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );
--==============================================================================
procedure create_pwa_screenshot (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_label                           in varchar2,
    p_display_sequence                in number,
    p_screenshot_url                  in varchar2,
    p_build_option_id                 in number   default null,
    p_pwa_screenshot_comment          in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- L E G A C Y
--
--==============================================================================
procedure create_calendar (
    p_id                          in number    default null,
    p_plug_id                     in number    default null,
    p_flow_id                     in number    default wwv_flow.g_flow_id,
    p_start_date                  in varchar2  default null,
    p_end_date                    in varchar2  default null,
    p_begin_at_start_of_interval  in varchar2  default c_y,
    p_date_item                   in varchar2  default null,
    p_end_date_item               in varchar2  default null,
    p_display_as                  in varchar2  default null,
    p_display_item                in varchar2  default null,
    p_display_type                in varchar2  default null,
    p_item_format                 in varchar2  default null,
    p_easy_sql_owner              in varchar2  default null,
    p_easy_sql_table              in varchar2  default null,
    p_date_column                 in varchar2  default null,
    p_end_date_column             in varchar2  default null,
    p_display_column              in varchar2  default null,
    p_template_id                 in number    default null,
    p_start_of_week               in number    default null,
    p_day_link                    in varchar2  default null,
    p_item_link                   in varchar2  default null,
    p_start_time                  in varchar2  default null,
    p_end_time                    in varchar2  default null,
    p_time_format                 in varchar2  default null,
    p_week_start_day              in varchar2  default null,
    p_week_end_day                in varchar2  default null,
    p_date_type_column            in varchar2  default null,
    p_calendar_type               in varchar2  default null,
    p_include_custom_cal          in varchar2  default null,
    p_custom_cal_days             in number    default 3,
    p_primary_key_column          in varchar2  default null,
    p_drag_drop_required_role     in varchar2  default null,
    p_drag_drop_process_id        in number    default null,
    p_item_link_primary_key_item  in varchar2  default null,
    p_item_link_date_item         in varchar2  default null,
    p_item_link_open_in           in varchar2  default 'W',
    p_include_time_with_date      in varchar2  default c_n,
    p_data_background_color       in varchar2  default null,
    p_data_text_color             in varchar2  default null,
    p_agenda_cal_days_type        in varchar2  default 'MONTH',
    p_agenda_cal_days             in number    default 30,
    p_calendar_comments           in varchar2  default null,
    p_security_group_id           in number    default wwv_flow_security.g_security_group_id,
    p_last_updated_by             in varchar2  default wwv_flow.g_user,
    p_last_updated_on             in date      default sysdate );

--==============================================================================
procedure create_tree  (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_type                            in varchar2 default 'DYNAMIC',
    p_item                            in varchar2 default null,
    p_query                           in varchar2 default null,
    p_levels                          in number   default null,
    p_unexpanded_parent               in varchar2 default null,
    p_unexpanded_parent_last          in varchar2 default null,
    p_expanded_parent                 in varchar2 default null,
    p_expanded_parent_last            in varchar2 default null,
    p_leaf_node                       in varchar2 default null,
    p_leaf_node_last                  in varchar2 default null,
    p_name_link_anchor_tag            in varchar2 default null,
    p_name_link_not_anchor_tag        in varchar2 default null,
    p_indent_vertical_line            in varchar2 default null,
    p_indent_vertical_line_last       in varchar2 default null,
    p_drill_up                        in varchar2 default null,
    p_before_tree                     in varchar2 default null,
    p_after_tree                      in varchar2 default null,
    p_level_1_template                in varchar2 default null,
    p_level_2_template                in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_popup_lov_template (
    p_id                              in number   default null,
    p_security_group_id               in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_popup_icon                      in varchar2 default null,
    p_popup_icon_attr                 in varchar2 default null,
    p_popup_icon2                     in varchar2 default null,
    p_popup_icon_attr2                in varchar2 default null,
    p_page_name                       in varchar2 default null,
    p_page_title                      in varchar2 default null,
    p_page_html_head                  in varchar2 default null,
    p_page_body_attr                  in varchar2 default null,
    p_before_field_text               in varchar2 default null,
    p_page_heading_text               in varchar2 default null,
    p_page_footer_text                in varchar2 default null,
    p_filter_width                    in varchar2 default null,
    p_filter_max_width                in varchar2 default null,
    p_filter_text_attr                in varchar2 default null,
    p_find_button_text                in varchar2 default null,
    p_find_button_image               in varchar2 default null,
    p_find_button_attr                in varchar2 default null,
    p_close_button_text               in varchar2 default null,
    p_close_button_image              in varchar2 default null,
    p_close_button_attr               in varchar2 default null,
    p_next_button_text                in varchar2 default null,
    p_next_button_image               in varchar2 default null,
    p_next_button_attr                in varchar2 default null,
    p_prev_button_text                in varchar2 default null,
    p_prev_button_image               in varchar2 default null,
    p_prev_button_attr                in varchar2 default null,
    p_after_field_text                in varchar2 default null,
    p_scrollbars                      in varchar2 default null,
    p_resizable                       in varchar2 default null,
    p_width                           in varchar2 default null,
    p_height                          in varchar2 default null,
    p_result_row_x_of_y               in varchar2 default null,
    p_result_rows_per_pg              in varchar2 default null,
    p_before_result_set               in varchar2 default null,
    p_after_result_set                in varchar2 default null,
    p_when_no_data_found_message      in varchar2 default null,
    p_before_first_fetch_message      in varchar2 default null,
    p_minimum_characters_required     in number   default null,
    p_reference_id                    in number   default null,
    p_translate_this_template         in varchar2 default c_n,
    --
    p_theme_id                        in number   default null,
    p_theme_class_id                  in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_auth_setup(
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2 default null,
    p_description                     in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_page_sentry_function            in varchar2 default null,
    p_sess_verify_function            in varchar2 default null,
    p_invalid_session_page            in varchar2 default null,
    p_invalid_session_url             in varchar2 default null,
    p_pre_auth_process                in varchar2 default null,
    p_auth_function                   in varchar2 default null,
    p_post_auth_process               in varchar2 default null,
    p_cookie_name                     in varchar2 default null,
    p_cookie_path                     in varchar2 default null,
    p_cookie_domain                   in varchar2 default null,
    p_use_secure_cookie_yn            in varchar2 default null,
    p_ldap_host                       in varchar2 default null,
    p_ldap_port                       in varchar2 default null,
    p_ldap_string                     in varchar2 default null,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_required_patch                  in varchar2 default null,
    p_security_group_id               in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_icon_bar_item (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_icon_sequence                   in number   default null,
    p_icon_image                      in varchar2 default null,
    p_icon_image2                     in varchar2 default null,
    p_icon_image3                     in varchar2 default null,
    p_icon_subtext                    in varchar2 default null,
    p_icon_subtext2                   in varchar2 default null,
    p_icon_subtext3                   in varchar2 default null,
    p_icon_target                     in varchar2 default null,
    p_icon_image_alt                  in varchar2 default null,
    p_icon_height                     in number   default null,
    p_icon_width                      in number   default null,
    p_icon_height2                    in number   default null,
    p_icon_width2                     in number   default null,
    p_icon_height3                    in number   default null,
    p_icon_width3                     in number   default null,
    p_icon_bar_disp_cond              in varchar2 default null,
    p_icon_bar_disp_cond_type         in varchar2 default null,
    p_icon_bar_flow_cond_instr        in varchar2 default null,
    p_begins_on_new_line              in varchar2 default null,
    p_cell_colspan                    in number   default null,
    p_onclick                         in varchar2 default null,
    p_required_patch                  in number   default null,
    p_security_scheme                 in varchar2 default null,
    p_reference_id                    in number   default null,
    p_nav_entry_is_feedback_yn        in varchar2 default null,
    p_icon_bar_comment                in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure set_icon_bar_item (
    p_id                              in number,
    p_icon_sequence                   in number   default null,
    p_icon_image                      in varchar2 default null,
    p_icon_image2                     in varchar2 default null,
    p_icon_image3                     in varchar2 default null,
    p_icon_subtext                    in varchar2 default null,
    p_icon_subtext2                   in varchar2 default null,
    p_icon_subtext3                   in varchar2 default null,
    p_icon_target                     in varchar2 default null,
    p_icon_image_alt                  in varchar2 default null,
    p_icon_height                     in number   default null,
    p_icon_width                      in number   default null,
    p_icon_height2                    in number   default null,
    p_icon_width2                     in number   default null,
    p_icon_height3                    in number   default null,
    p_icon_width3                     in number   default null,
    p_icon_bar_disp_cond              in varchar2 default null,
    p_icon_bar_disp_cond_type         in varchar2 default null,
    p_icon_bar_flow_cond_instr        in varchar2 default null,
    p_begins_on_new_line              in varchar2 default null,
    p_cell_colspan                    in number   default null,
    p_required_patch                  in number   default null,
    p_icon_bar_comment                in varchar2 default null);

--==============================================================================

--==============================================================================
--
-- A P P R O V A L   T A S K S
--
--==============================================================================
procedure create_task_def (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_subject                         in varchar2,
    p_task_type                       in varchar2 default 'APPROVAL',
    p_priority                        in number,
    --
    p_due_on_type                     in varchar2 default null,
    p_due_on_language                 in varchar2 default null,
    p_due_on_interval                 in varchar2 default null,
    p_expiration_policy               in varchar2 default null,
    p_max_renewal_count               in number   default null,
    p_details_link_target             in varchar2 default null,
    --
    p_actions_sql_query               in varchar2 default null,
    p_actions_table_owner             in varchar2 default null,
    p_actions_table_name              in varchar2 default null,
    p_actions_pk_column_name          in varchar2 default null,
    p_vacation_rule_procedure         in varchar2 default null,
    p_initiator_can_complete          in boolean default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_task_def_participant (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_task_def_id                     in number,
    --
    p_participant_type                in varchar2,
    p_identity_type                   in varchar2,
    p_value_type                      in varchar2,
    p_value_language                  in varchar2 default null,
    p_value                           in varchar2,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null);

procedure create_task_def_param (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_task_def_id                     in number,
    --
    p_label                           in varchar2,
    p_static_id                       in varchar2,
    p_data_type                       in varchar2,
    p_is_required                     in boolean,
    p_is_visible                      in boolean,
    p_is_updatable                    in boolean  default false,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

procedure create_task_def_action (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_task_def_id                     in number,
    --
    p_name                            in varchar2,
    p_on_event                        in varchar2,
    p_outcome                         in varchar2 default null,
    p_before_expire_interval          in varchar2 default null,
    p_execution_sequence              in number,
    p_action_type                     in varchar2,
    --
    p_action_clob                     in varchar2 default null,
    p_action_clob_language            in varchar2 default null,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_attribute_09                    in varchar2 default null,
    p_attribute_10                    in varchar2 default null,
    p_attribute_11                    in varchar2 default null,
    p_attribute_12                    in varchar2 default null,
    p_attribute_13                    in varchar2 default null,
    p_attribute_14                    in varchar2 default null,
    p_attribute_15                    in varchar2 default null,
    --
    p_location                        in varchar2 default null,
    p_remote_server_id                in number   default null,
    p_web_src_module_id               in number   default null,
    p_web_src_operation_id            in number   default null,
    --
    p_success_message                 in varchar2 default null,
    p_error_message                   in varchar2 default null,
    p_stop_execution_on_error         in boolean,
    p_log_message_type                in varchar2 default 'NONE',
    --
    p_condition_type                  in varchar2 default null,
    p_condition_expr1                 in varchar2 default null,
    p_condition_expr2                 in varchar2 default null,
    --
    p_build_option_id                 in number   default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

procedure create_task_def_comp_param (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_page_id                         in number   default null,
    p_task_def_param_id               in number,
    p_page_process_id                 in number   default null,
    p_app_process_id                  in number   default null,
    p_automation_action_id            in number   default null,
    p_task_def_action_id              in number   default null,
    p_workflow_activity_id            in number   default null,
    p_value_type                      in varchar2,
    p_value_language                  in varchar2 default null,
    p_value                           in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null);

procedure load_task_instances(
    p_application_id in number);

procedure recreate_task_instances(
    p_application_id in number);

--==============================================================================
--
-- PUSH SUBSCRIPTIONS
--
--==============================================================================

procedure load_push_subscriptions(
    p_application_id in number);

procedure recreate_push_subscriptions(
    p_application_id in number );

--==============================================================================
--
-- S E A R C H   C O N F I G U R A T I O N
--
--==============================================================================
procedure create_search_config(
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_security_group_id               in number   default null,
    --
    p_label                           in varchar2,
    p_static_id                       in varchar2 default null,
    p_search_prefix                   in varchar2 default null,
    p_search_type                     in varchar2,
    --
    p_list_id                         in number   default null,
    --
    p_location                        in varchar2 default null,
    p_remote_server_id                in number   default null,
    p_web_src_module_id               in number   default null,
    p_web_src_array_col_id            in number   default null,  -- obsolete
    p_array_column_id                 in number   default null,
    p_document_source_id              in number   default null,
    p_web_src_function                in varchar2 default null,
    --
    p_query_type                      in varchar2 default null,
    p_query_owner                     in varchar2 default null,
    p_query_table                     in varchar2 default null,
    p_query_match                     in varchar2 default null,
    p_query_columns                   in varchar2 default null,
    p_query_where                     in varchar2 default null,
    p_query_source                    in varchar2 default null,
    p_function_body_language          in varchar2 default null,
    p_source_post_processing          in varchar2 default null,
    p_optimizer_hint                  in varchar2 default null,
    p_external_filter_expr            in varchar2 default null,
    --
    p_searchable_columns              in varchar2 default null,
    --
    p_oratext_index_column_name       in varchar2 default null,
    p_oratext_index_owner             in varchar2 default null,
    p_oratext_index_name              in varchar2 default null,
    p_oratext_function_type           in varchar2 default null,
    p_oratext_function                in varchar2 default null,
    --
    p_vector_search_type              in varchar2 default null,
    p_vector_distance_metric          in varchar2 default null,
    p_vector_maximum_distance         in number   default null,
    p_target_accuracy                 in number   default null,
    p_vector_provider_id              in number   default null,
    --
    p_return_max_results              in number   default null,
    p_no_results_found_message        in varchar2 default null,
    p_query_order_by                  in varchar2 default null,
    --
    p_pk_column_name                  in varchar2,
    p_pk2_column_name                 in varchar2 default null,
    p_title_column_name               in varchar2,
    p_subtitle_column_name            in varchar2 default null,
    p_description_column_name         in varchar2 default null,
    p_badge_column_name               in varchar2 default null,
    p_last_modified_column_name       in varchar2 default null,
    p_custom_01_column_name           in varchar2 default null,
    p_custom_02_column_name           in varchar2 default null,
    p_custom_03_column_name           in varchar2 default null,
    p_score_column_name               in varchar2 default null,
    --
    p_link_target_type                in varchar2 default null,
    p_link_target                     in varchar2 default null,
    p_icon_source_type                in varchar2 default null,
    p_icon_class_column_name          in varchar2 default null,
    p_icon_blob_column_name           in varchar2 default null,
    p_icon_mimetype_column_name       in varchar2 default null,
    p_icon_image_url                  in varchar2 default null,
    p_icon_css_classes                in varchar2 default null,
    --
    p_default_row_html_expr           in varchar2 default null,
    --
    p_result_css_classes              in varchar2 default null,
    --
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    --
    p_condition_type                  in varchar2 default null,
    p_condition_expr1                 in varchar2 default null,
    p_condition_expr2                 in varchar2 default null,
    --
    p_authorization_scheme            in varchar2 default null,
    p_build_option_id                 in number   default null,
    --
    p_search_comment                  in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
--
-- W O R K F L O W S
--
--==============================================================================
procedure create_workflow (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_title                           in varchar2,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_workflow_version (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_workflow_id                     in number,
    --
    p_version                         in varchar2,
    p_state                           in varchar2,
    p_query_type                      in varchar2 default null,
    p_query_source                    in varchar2 default null,
    p_query_owner                     in varchar2 default null,
    p_query_table                     in varchar2 default null,
    p_pk_column                       in varchar2 default null,
    p_diagram                         in varchar2 default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null);

procedure create_workflow_activity (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_workflow_version_id             in number,
    --
    p_name                            in varchar2,
    p_static_id                       in varchar2,
    p_label                           in varchar2 default null,
    p_display_sequence                in number,
    p_parent_activity_id              in number   default null,
    p_activity_type                   in varchar2,
    p_query_source                    in varchar2 default null,
    --
    p_activity_code                   in varchar2 default null,
    p_activity_code_language          in varchar2 default null,
    p_attribute_01                    in varchar2 default null,
    p_attribute_02                    in varchar2 default null,
    p_attribute_03                    in varchar2 default null,
    p_attribute_04                    in varchar2 default null,
    p_attribute_05                    in varchar2 default null,
    p_attribute_06                    in varchar2 default null,
    p_attribute_07                    in varchar2 default null,
    p_attribute_08                    in varchar2 default null,
    p_attribute_09                    in varchar2 default null,
    p_attribute_10                    in varchar2 default null,
    p_attribute_11                    in varchar2 default null,
    p_attribute_12                    in varchar2 default null,
    p_attribute_13                    in varchar2 default null,
    p_attribute_14                    in varchar2 default null,
    p_attribute_15                    in varchar2 default null,
    --
    p_location                        in varchar2 default null,
    p_remote_server_id                in number   default null,
    p_web_src_module_id               in number   default null,
    p_web_src_operation_id            in number   default null,
    --
    p_due_on_type                     in varchar2 default null,
    p_due_on_language                 in varchar2 default null,
    p_due_on_value                    in varchar2 default null,
    p_diagram                         in varchar2 default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

procedure create_workflow_transition (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    --
    p_name                            in varchar2,
    p_execution_sequence              in number   default null,
    p_transition_type                 in varchar2,
    --
    p_from_activity_id                in number,
    p_to_activity_id                  in number,
    --
    p_condition_type                  in varchar2 default null,
    p_condition_expr1                 in varchar2 default null,
    p_condition_expr2                 in varchar2 default null,
    --
    p_diagram                         in varchar2 default null,
    p_build_option_id                 in number default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================
procedure create_workflow_participant (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_workflow_version_id             in number,
    --
    p_name                            in varchar2,
    p_participant_type                in varchar2,
    p_identity_type                   in varchar2,
    p_value_type                      in varchar2,
    p_value_language                  in varchar2 default null,
    p_value                           in varchar2 default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null);

procedure create_workflow_variable (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_workflow_id                     in number   default null,
    p_workflow_version_id             in number   default null,
    p_activity_id                     in number   default null,
    --
    p_label                           in varchar2 default null,
    p_static_id                       in varchar2,
    p_direction                       in varchar2,
    p_data_type                       in varchar2,
    p_is_required                     in boolean  default null,
    p_value_type                      in varchar2 default null,
    p_value_language                  in varchar2 default null,
    p_value                           in varchar2 default null,
    p_format_mask                     in varchar2 default null,
    p_comment                         in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

procedure create_workflow_comp_param (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_page_id                         in number   default null,
    p_workflow_variable_id            in number,
    p_page_process_id                 in number   default null,
    p_app_process_id                  in number   default null,
    p_automation_action_id            in number   default null,
    p_task_def_action_id              in number   default null,
    p_workflow_activity_id            in number   default null,
    p_value_type                      in varchar2,
    p_value_language                  in varchar2 default null,
    p_value                           in varchar2 default null,
    p_format_mask                     in varchar2 default null,
    p_ignore_output                   in boolean  default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null);

procedure load_workflow_instances(
    p_application_id in number);

procedure recreate_workflow_instances(
    p_application_id in number);

procedure create_workflow$ (
    p_id                              in number                   default null,
    p_flow_id                         in number                   default wwv_flow.g_flow_id,
    --
    p_workflow_version_id             in number,
    p_state                           in varchar2,
    p_title                           in varchar2,
    p_initiator                       in varchar2                 default null,
    p_parent_id                       in number                   default null,
    p_parent_activity_id              in number                   default null,
    p_detail_pk                       in varchar2                 default null,
    --
    p_is_dev_mode                     in boolean,
    p_retry_point                     in varchar2                 default null,
    p_debug_level                     in number                   default null,
    --
    p_start_time                      in timestamp with time zone default null,
    p_end_time                        in timestamp with time zone default null,
    p_updated_by                      in varchar2                 default null,
    p_updated_on                      in date                     default null );

procedure create_workflow_activity$ (
    p_id                              in number                   default null,
    p_flow_id                         in number                   default wwv_flow.g_flow_id,
    p_workflow$_id                    in number,
    p_activity_id                     in number,
    --
    p_parent_id                       in number                   default null,
    p_thread_no                       in number                   default null,
    --
    p_state                           in varchar2,
    p_start_time                      in timestamp with time zone default null,
    p_end_time                        in timestamp with time zone default null,
    p_due_on                          in timestamp with time zone default null,
    p_error_message                   in varchar2                 default null,
    p_retry_count                     in number                   default null,
    --
    p_previous_id                     in number                   default null );

procedure create_workflow_variable$ (
    p_id                              in number                      default null,
    p_flow_id                         in number                      default wwv_flow.g_flow_id,
    p_variable_id                     in number,
    p_workflow$_id                    in number,
    p_activity$_id                    in number                      default null,
    --
    p_string_value                    in varchar2                    default null,
    p_number_value                    in number                      default null,
    --
    p_timestamp_value                 in timestamp default null,
    p_timestamp_tz_value              in timestamp with time zone     default null,
    p_timestamp_ltz_value             in timestamp with time zone     default null,
    p_boolean_value                   in varchar2                     default null,
    p_clob_value                      in clob                         default null,
    p_is_modified_flag                in boolean                      default null );

procedure create_workflow_participant$ (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_workflow$_id                    in number,
    p_type                            in varchar2,
    p_value                           in varchar2 );

procedure create_workflow_audit_log$ (
    p_id                              in number                       default null,
    p_flow_id                         in number                       default wwv_flow.g_flow_id,
    --
    p_workflow$_id                    in number,
    p_state                           in varchar2,
    p_action                          in varchar2,
    p_initiator                       in varchar2                     default null,
    --
    p_current_activity$_id            in number                       default null,
    p_current_activity$_state         in varchar2                     default null,
    p_changed_variables               in clob                         default null,
    p_display_msg                     in varchar2                     default null,
    p_parent_workflow$_id             in number                       default null,
    p_parent_activity$_id             in number                       default null,
    --
    p_transition_id                   in number                       default null,
    --
    p_created_by                      in varchar2                     default null,
    p_created_on                      in date                         default null,
    p_updated_by                      in varchar2                     default null,
    p_updated_on                      in date                         default null );

procedure create_wf_tasks$(
    p_id                              in number                       default null,
    p_flow_id                         in number                       default wwv_flow.g_flow_id, 
    p_task_def_id                     in number                       default null,
    p_previous_task_id                in number                       default null,
    p_subject                         in varchar2                     default null,
    p_payload                         in varchar2                     default null,
    p_detail_pk                       in varchar2                     default null,
    p_workflow_id                     in number                       default null,
    p_wf_activity_id                  in number                       default null,
    p_priority                        in number,
    p_initiator                       in varchar2                     default null,
    p_actual_owner                    in varchar2                     default null,
    p_previous_owner                  in varchar2                     default null,
    p_due_on                          in timestamp with time zone     default null,
    p_outcome                         in varchar2                     default null,
    p_renewal_count                   in number                       default null,
    p_state                           in varchar2,
    p_job_status                      in varchar2                     default null,  
    p_initiator_can_complete          in varchar2                     default null,
    p_created_by                      in varchar2                     default null,
    p_created_on                      in timestamp with time zone,
    p_updated_by                      in varchar2                     default null,
    p_updated_on                      in timestamp with time zone     default null,
    p_participants                    in varchar2                     default null,
    p_comments                        in varchar2                     default null,
    p_history                         in varchar2                     default null);
    
--==============================================================================

procedure remove_icon_bar_item (
    p_id                              in number);

--==============================================================================
--
-- M A P   B A C K G R O U N D S   T A S K S
--
--==============================================================================
procedure create_map_background (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_type                            in varchar2,
    p_url                             in varchar2 default null,
    p_attribution                     in varchar2 default null,
    p_api_key                         in varchar2 default null,
    p_http_headers                    in varchar2 default null,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_zoom_min                        in number   default null,
    p_zoom_max                        in number   default null,
    p_map_comment                     in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================

--==============================================================================
--
-- C O M P O N E N T  G R O U P S
--
--==============================================================================
procedure create_component_group (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_name                            in varchar2,
    p_reference_id                    in number   default null,
    p_version_scn                     in number   default null,
    p_group_comment                   in varchar2 default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

procedure create_comp_grp_component (
    p_id                              in number   default null,
    p_flow_id                         in number   default wwv_flow.g_flow_id,
    p_component_group_id              in number   default current_component_group_id,
    p_app_item_id                     in number   default null,
    p_app_process_id                  in number   default null,
    p_app_computation_id              in number   default null,
    p_app_setting_id                  in number   default null,
    p_build_option_id                 in number   default null,
    p_list_id                         in number   default null,
    p_search_config_id                in number   default null,
    p_load_table_id                   in number   default null,
    p_web_src_module_id               in number   default null,
    p_duality_view_id                 in number   default null,
    p_json_source_id                  in number   default null,
    p_authentication_id               in number   default null,
    p_authorization_id                in number   default null,
    p_group_id                        in number   default null,
    p_email_template_id               in number   default null,
    p_lov_id                          in number   default null,
    p_plugin_id                       in number   default null,
    p_plugin_setting_id               in number   default null,
    p_shortcut_id                     in number   default null,
    p_map_background_id               in number   default null,
    p_report_layout_id                in number   default null,
    p_message_id                      in number   default null,
    p_ai_config_id                    in number   default null,
    p_page_id                         in number   default null,
    --
    p_created_by                      in varchar2 default null,
    p_created_on                      in date     default null,
    p_updated_by                      in varchar2 default null,
    p_updated_on                      in date     default null );

--==============================================================================

end wwv_flow_imp_shared;
/
show errors
