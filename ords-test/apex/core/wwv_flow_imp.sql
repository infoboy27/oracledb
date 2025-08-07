set define '^' verify off
prompt ...wwv_flow_imp
create or replace package wwv_flow_imp as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2023, Oracle and/or its affiliates.
--
--    NAME
--      api.sql
--
--    DESCRIPTION
--     Interface to creating APEX attributes.
--
--    NOTES
--      API to insert application metadata into the apex data dictionary
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  10/09/1999 - Created
--
-----------------------------------------------------------------------------------------------------------------------

--==============================================================================
--
-- THIS PACKAGE IS FROZEN AS OF APEX 21.2.
--
-- ADD NEW COMPONENTS OR NEW ATTRIBUTES TO EXISTING COMPONENTS IN THE
-- FOLLOWING PACKAGES:
--
-- * WWV_FLOW_IMP_PAGE ...... for APEX application pages and page components
-- * WWV_FLOW_IMP_SHARED .... for APEX application shared components
-- * WWV_IMP_WORKSPACE ...... for workspace-level components and for CREATE_FLOW
--
-- Only generic ad API usage check functionality remains in this package.
--
--==============================================================================

--==============================================================================
-- globals and constants
--==============================================================================

--
c_default_query_row_count_max   constant number := 500;
--
empty_vc_arr                    wwv_flow_global.vc_arr2;
g_raise_errors                  boolean := false;
g_id_offset                     number := 0;
g_nls_numeric_chars             varchar2(8);


-- Valid modes:
--   CREATE  - only insert
--   REMOVE  - only delete
--   REPLACE - delete and insert
g_mode                          varchar2(255) := 'CREATE';

--==============================================================================
-- import versions
--==============================================================================
c_y                             constant varchar2(1 CHAR) := 'Y';
c_n                             constant varchar2(1 CHAR) := 'N';

--==============================================================================
-- import versions
--==============================================================================
subtype t_apex_version          is pls_integer;
c_release_date_str              constant varchar2(10)   := '2024.11.30'; -- KEEP IN SYNC
c_current                       constant t_apex_version := 20241130;     -- KEEP IN SYNC

c_apex_4_0                      constant t_apex_version := 20100513;
c_apex_4_1                      constant t_apex_version := 20110212;
c_apex_4_2                      constant t_apex_version := 20120101;
c_apex_5_0                      constant t_apex_version := 20130101;
c_apex_5_1                      constant t_apex_version := 20160824;
c_apex_18_1                     constant t_apex_version := 20180404;
c_apex_18_2                     constant t_apex_version := 20180928;
c_apex_19_1                     constant t_apex_version := 20190331;
c_apex_19_2                     constant t_apex_version := 20191004;
c_apex_20_1                     constant t_apex_version := 20200331;
c_apex_20_2                     constant t_apex_version := 20201001;
c_apex_21_1                     constant t_apex_version := 20210415;
c_apex_21_2                     constant t_apex_version := 20211015;
c_apex_22_1                     constant t_apex_version := 20220412;
c_apex_22_2                     constant t_apex_version := 20221007;
c_apex_23_1                     constant t_apex_version := 20230428;
c_apex_23_2                     constant t_apex_version := 20231031;
c_apex_24_1                     constant t_apex_version := 20240531;
c_apex_24_2                     constant t_apex_version := c_current;

g_is_compatable                 boolean                 := true;
--
--==============================================================================

empty_varchar2_table            sys.dbms_sql.varchar2_table;
g_varchar2_table                sys.dbms_sql.varchar2_table;
g_fnd_user_password_action      boolean := false;
--
--==============================================================================
-- convert boolean to Y or N
--==============================================================================
function boolean_to_string (
    p_value in boolean )
    return varchar2;

--##############################################################################
--#
--# SECURITY CHECKS
--#
--##############################################################################

--==============================================================================
procedure check_sgid;

--==============================================================================
procedure check_version;

--==============================================================================
procedure check_sgid_for_app_id (
    p_flow_id in number );

--==============================================================================
-- check whether the caller can use the API procedures. this procedure
-- implements checks for
-- * security group id
-- * version compatibility (disable with p_check_version => false)
-- * current app can use workspace api (enable with p_check_workspace => true)
-- * current app can edit app (enable by passing a value for p_flow_id)
--==============================================================================
procedure check_api_use_allowed (
    p_check_version   in boolean default true,
    p_check_workspace in boolean default null,
    p_flow_id         in number  default null );

--==============================================================================
procedure check_for_valid_flow_range (
    p_flow_id in number );

--##############################################################################
--#
--# VERSIONING
--#
--##############################################################################

--==============================================================================
function get_version_identifier
    return varchar2;

--==============================================================================
-- This call is expected to be made before running and procedure within wwv_flow_imp.
-- You are expected to inform the flows API which version of flows created your export.
-- All flow versions are in the form YYYY.MM.DD.
-- No API calls will work if the versions are incompatable.
-- An incompatable version is defined as the wwv_flow_imp.g_compatable_from_version
-- (a static plsql package global that indicates from which date this api is good from)
-- is less then or equal to the calling version passed to this procedure.
--==============================================================================
procedure set_version (
    p_version_yyyy_mm_dd in varchar2,
    p_release            in varchar2 default null,
    p_debug              in varchar2 default 'YES');

--==============================================================================
-- return the export version of the file that we are currently importing and
-- where set_version() was called when executing the PL/SQL blocks.
--==============================================================================
function get_calling_version
    return t_apex_version;

--==============================================================================
function id (
    p_id in number )
    return number;

function get_internal_template_name (
    p_internal_name in varchar2,
    p_template_name in varchar2
) return varchar2;

--##############################################################################
--#
--# REMOVING
--#
--##############################################################################
--==============================================================================
-- This procedure deletes a row from the wwv_flows table
-- which then cascades to all subordinate flow objects.
--
-- Run this procedure only from an application export file
-- because it will make sure that translated apps will not be removed and
-- saved IR's are stored in memory for later restore.
--
-- To delete an application and all it's translations, ... use remove_application
-- instead.
--==============================================================================
procedure remove_flow (
    p_id            in number  default null,
    p_keep_sessions in boolean default wwv_flow_application_install.get_keep_sessions );

--==============================================================================
-- This procedure deletes an application and all it's child objects like
-- pages, translated applications, ...
--==============================================================================
procedure remove_application (
    p_application_id   in  number,
    p_workspace_id     in  number   default wwv_flow_security.g_security_group_id,
    p_delete_feedback  in  boolean  default false );


--==============================================================================
-- This procedure deletes a row from the pages table
-- which then cascades to delete all subordinate meta
-- data.
--==============================================================================
procedure remove_page (
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default null );

--##############################################################################
--#
--# CREATING
--#
--##############################################################################

--==============================================================================
-- Deprecated
--==============================================================================
procedure create_ui_type (
    p_name                        in varchar2,
    p_based_on_ui_type_name       in varchar2 default null,
    p_autodetect_js_file_urls     in varchar2 default null,
    p_autodetect_js_function_body in varchar2 default null,
    p_autodetect_plsql_func_body  in varchar2 default null );

--==============================================================================
-- Deprecated
--==============================================================================
procedure create_ui_type_feature (
    p_ui_type_name       in varchar2,
    p_builder_feature_id in number );

-------------------------------------------------
-- C R E A T E   F L O W   A T T R I B U T E S --
-------------------------------------------------

--
-- F L O W
--
procedure create_flow (
    --
    -- THIS PROCEDURE IS FROZEN STARTING WITH 23.1. APPLY CHANGES TO WWV_IMP_WORKSPACE.CREATE_FLOW.
    --
    --
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


    p_id                        in number   default null,
    p_security_group_id         in number   default null, -- obsolete
    p_display_id                in number   default null,
    p_owner                     in varchar2 default null,
    p_name                      in varchar2 default null,
    p_alias                     in varchar2 default null,
    p_webdb_template            in varchar2 default null, -- obsolete
    p_default_page_template     in number   default null, -- obsolete
    p_home_link                 in varchar2 default null, -- obsolete
    p_box_width                 in varchar2 default null,
    p_webdb_logging             in varchar2 default null, -- obsolete
    p_page_view_logging         in varchar2 default null,
    p_flow_language             in varchar2 default null,
    p_flow_language_derived_from in varchar2 default null,
    p_date_format               in varchar2 default null,
    p_date_time_format          in varchar2 default null,
    p_timestamp_format          in varchar2 default null,
    p_timestamp_tz_format       in varchar2 default null,
    p_nls_sort                  in varchar2 default null,
    p_nls_comp                  in varchar2 default null,
    p_direction_right_to_left   in varchar2 default c_n,
    p_flow_image_prefix         in varchar2 default null,
    p_media_type                in varchar2 default null,
    p_printer_friendly_template in number   default null, -- obsolete
    p_default_region_template   in number   default null, -- obsolete
    p_default_label_template    in number   default null, -- obsolete
    p_default_report_template   in number   default null, -- obsolete
    p_default_list_template     in number   default null, -- obsolete
    p_default_menu_template     in number   default null, -- obsolete
    p_default_button_template   in number   default null, -- obsolete
    p_error_template            in number   default null, -- obsolete
    --
    p_default_chart_template    in number   default null, -- obsolete
    p_default_form_template     in number   default null, -- obsolete
    p_default_wizard_template   in number   default null, -- obsolete
    p_default_tabform_template  in number   default null, -- obsolete
    p_default_reportr_template  in number   default null, -- obsolete
    p_default_menur_template    in number   default null, -- obsolete
    p_default_listr_template    in number   default null, -- obsolete
    p_default_irr_template      in number   default null, -- obsolete
    --
    p_theme_id                  in number   default null, -- obsolete
    p_application_group         in number   default null,
    p_application_group_name    in varchar2 default null,
    p_application_group_comment in varchar2 default null,
    --
    p_documentation_banner      in varchar2 default null,
    p_authentication            in varchar2 default null,
    p_authentication_id         in number   default null,
    p_login_url                 in varchar2 default null, -- obsolete
    p_logout_url                in varchar2 default null,
    p_populate_roles            in varchar2 default 'R',
    p_logo_type                 in varchar2 default null,
    p_logo                      in varchar2 default null,
    p_logo_text                 in varchar2 default null,
    p_logo_image                in varchar2 default null, -- obsolete
    p_logo_image_attributes     in varchar2 default null, -- obsolete
    p_app_builder_icon_name     in varchar2 default null,
    p_favicons                  in varchar2 default null, -- deprecated
    p_public_url_prefix         in varchar2 default null,
    p_public_user               in varchar2 default null,
    p_dbauth_url_prefix         in varchar2 default null,
    p_proxy_server              in varchar2 default null,
    p_no_proxy_domains          in varchar2 default '.',
    p_cust_authentication_process in varchar2 default null,
    p_cust_authentication_page  in varchar2 default null,
    p_custom_auth_login_url     in varchar2 default null, -- obsolete
    p_flow_version              in varchar2 default null,
    p_page_range_minimum        in number   default null, -- obsolete; not in wwv_flows table
    p_page_range_maximum        in number   default null, -- obsolete; not in wwv_flows table
    p_flow_status               in varchar2 default null,
    p_flow_unavailable_text     in varchar2 default null,
    p_restrict_to_user_list     in varchar2 default null,
    p_build_status              in varchar2 default 'RUN_AND_BUILD',
    p_exact_substitutions_only  in varchar2 default null,
    p_browser_cache             in varchar2 default c_y,
    p_browser_frame             in varchar2 default 'A',
    p_referrer_policy           in varchar2 default null,
    p_deep_linking              in varchar2 default c_n,
    p_http_response_headers     in varchar2 default null,
    p_auth_config_procedure     in varchar2 default null,
    p_vpd                       in varchar2 default null,
    p_vpd_teardown_code         in varchar2 default null,
    p_runtime_api_usage         in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_authorize_public_pages_yn in varchar2 default c_n,
    p_authorize_batch_job       in varchar2 default c_y,
    p_application_tab_set       in number   default null, -- obsolete; reused for debugging flag
    p_rejoin_existing_sessions  in varchar2 default null,
    p_substitution_string_01    in varchar2 default null,
    p_substitution_value_01     in varchar2 default null,
    p_substitution_string_02    in varchar2 default null,
    p_substitution_value_02     in varchar2 default null,
    p_substitution_string_03    in varchar2 default null,
    p_substitution_value_03     in varchar2 default null,
    p_substitution_string_04    in varchar2 default null,
    p_substitution_value_04     in varchar2 default null,
    p_substitution_string_05    in varchar2 default null,
    p_substitution_value_05     in varchar2 default null,
    p_substitution_string_06    in varchar2 default null,
    p_substitution_value_06     in varchar2 default null,
    p_substitution_string_07    in varchar2 default null,
    p_substitution_value_07     in varchar2 default null,
    p_substitution_string_08    in varchar2 default null,
    p_substitution_value_08     in varchar2 default null,
    p_substitution_string_09    in varchar2 default null,
    p_substitution_value_09     in varchar2 default null,
    p_substitution_string_10    in varchar2 default null,
    p_substitution_value_10     in varchar2 default null,
    p_substitution_string_11    in varchar2 default null,
    p_substitution_value_11     in varchar2 default null,
    p_substitution_string_12    in varchar2 default null,
    p_substitution_value_12     in varchar2 default null,
    p_substitution_string_13    in varchar2 default null,
    p_substitution_value_13     in varchar2 default null,
    p_substitution_string_14    in varchar2 default null,
    p_substitution_value_14     in varchar2 default null,
    p_substitution_string_15    in varchar2 default null,
    p_substitution_value_15     in varchar2 default null,
    p_substitution_string_16    in varchar2 default null,
    p_substitution_value_16     in varchar2 default null,
    p_substitution_string_17    in varchar2 default null,
    p_substitution_value_17     in varchar2 default null,
    p_substitution_string_18    in varchar2 default null,
    p_substitution_value_18     in varchar2 default null,
    p_substitution_string_19    in varchar2 default null,
    p_substitution_value_19     in varchar2 default null,
    p_substitution_string_20    in varchar2 default null,
    p_substitution_value_20     in varchar2 default null,
    p_required_roles              in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_global_notification         in varchar2 default null,
    p_global_id                   in number   default null,
    p_charset                     in varchar2 default null,
    p_page_protection_enabled_y_n in varchar2 default null,
    p_checksum_salt               in raw      default null,
    p_checksum_salt_last_reset    in varchar2 default null,
    p_bookmark_checksum_function  in varchar2 default null, -- MD5 for pre-5.0
    p_accept_old_checksums        in boolean  default null,
    p_csv_encoding                in varchar2 default null,
    p_auto_time_zone              in varchar2 default null,
    p_content_delivery_network    in varchar2 default null, -- obsolete
    p_javascript_file_urls        in varchar2 default null,
    p_include_legacy_javascript   in varchar2 default null,
    p_ui_detection_css_urls       in varchar2 default null, -- deprecated
    p_error_handling_function     in varchar2 default null,
    p_default_error_display_loc   in varchar2 default 'INLINE_WITH_FIELD_AND_NOTIFICATION',
    p_max_session_length_sec      in number   default null,
    p_on_max_session_timeout_url  in varchar2 default null,
    p_max_session_idle_sec        in number   default null,
    p_on_max_idle_timeout_url     in varchar2 default null,
    p_session_timeout_warning_sec in number   default null,
    p_compatibility_mode          in varchar2 default '4.0',
    p_html_escaping_mode          in varchar2 default null,
    p_email_from                  in varchar2 default null,
    p_oracle_text_function_type   in varchar2 default null,
    p_oracle_text_function        in varchar2 default null,
    p_tokenize_row_search         in varchar2 default c_y,
    p_friendly_url                in varchar2 default c_y,
    --
    p_publish_yn                  in varchar2 default c_n,   -- apex 4.0
    p_allow_feedback_yn           in varchar2 default c_n,   -- apex 4.0
    --
    p_ui_type_name                in varchar2 default null,
    p_file_prefix                 in varchar2 default null,
    p_files_version               in number   default 1,
    --
    p_last_updated_by             in varchar2 default null,
    p_last_upd_yyyymmddhh24miss   in varchar2 default null,
    --
    p_print_server_type           in varchar2 default null,
    p_print_remote_server_id      in number   default null,
    p_print_credential_id         in number   default null,
    --
    p_is_pwa                      in varchar2 default c_n,
    p_pwa_is_installable          in varchar2 default null,
    p_pwa_manifest_description    in varchar2 default null,
    p_pwa_manifest_display        in varchar2 default null,
    p_pwa_manifest_orientation    in varchar2 default null,
    p_pwa_manifest_theme_color    in varchar2 default null,
    p_pwa_manifest_bg_color       in varchar2 default null,
    p_pwa_manifest_icon_url       in varchar2 default null,
    p_pwa_manifest_custom         in varchar2 default null,
    p_pwa_service_worker_hooks    in clob     default null,
    p_pwa_apple_status_bar_style  in varchar2 default null,
    p_copyright_banner            in varchar2 default null,
    p_mle_environment             in varchar2 default null)
    ;

procedure set_application_name (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null)
    ;
procedure set_application_alias (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_alias                     in varchar2 default null)
    ;
procedure set_exact_subs (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_exact_substitutions       in varchar2 default null)
    ;
procedure set_security_scheme (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_security_scheme           in varchar2 default null)
    ;
procedure set_proxy_server (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_proxy_server              in varchar2 default null,
    p_no_proxy_domains          in varchar2 default null)
    ;
procedure set_page_prot_enabled_y_n (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_page_protection           in varchar2 default null)
    ;
procedure set_vpd (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_vpd                       in varchar2 default null)
    ;
procedure set_application_lock (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_locked_by                 in varchar2 default null)
    ;

procedure set_enable_app_debugging (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_debugging                 in varchar2 default null)
    ;
procedure set_global_notification (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_global_notification       in varchar2 default null)
    ;
function get_global_notification (
    p_flow_id                   in number default wwv_flow.g_flow_id)
    return varchar2
    ;
procedure set_flow_authentication (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_authentication            in varchar2 default null)
    ;
procedure set_logout_url (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_logout_url                in varchar2 default null)
    ;
procedure set_logo_image (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_logo_image                in varchar2 default null,
    p_logo_image_attributes     in varchar2 default null)
    ;
procedure set_image_prefix (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_image_prefix              in varchar2 default null)
    ;
procedure set_logging (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_logging                   in varchar2 default null)
    ;
procedure set_application_owner (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_application_owner         in varchar2 default null)
    ;
function get_application_owner (
    p_flow_id                   in number )
    return varchar2
    ;
procedure set_build_status (
    p_application_id           in number default wwv_flow.g_flow_id,
    p_build_status             in varchar2 default null)
    ;
procedure set_public_url_prefix (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_public_url_prefix         in varchar2 default null)
    ;
procedure set_authenticated_url_prefix (
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_authenticated_url_prefix  in varchar2 default null)
    ;
procedure create_build_option (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_build_option_name         in varchar2 default null,
    p_build_option_status       in varchar2 default null,
    p_build_option_comment      in varchar2 default null,
    --
    p_default_on_export         in varchar2 default null,
    p_on_upgrade_keep_status    in boolean  default false,
    p_feature_identifier        in varchar2 default null,
    p_attribute1                in varchar2 default null,
    p_attribute2                in varchar2 default null,
    p_attribute3                in varchar2 default null,
    p_attribute4                in varchar2 default null )
    --
    ;
procedure set_build_option (
    p_id                        in number   default null,
    p_build_option_status       in varchar2 default null)
    ;
procedure set_static_sub_strings (
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_substitution_string_01      in varchar2 default null,
    p_substitution_value_01       in varchar2 default null,
    p_substitution_string_02      in varchar2 default null,
    p_substitution_value_02       in varchar2 default null,
    p_substitution_string_03      in varchar2 default null,
    p_substitution_value_03       in varchar2 default null,
    p_substitution_string_04      in varchar2 default null,
    p_substitution_value_04       in varchar2 default null,
    p_substitution_string_05      in varchar2 default null,
    p_substitution_value_05       in varchar2 default null,
    p_substitution_string_06      in varchar2 default null,
    p_substitution_value_06       in varchar2 default null,
    p_substitution_string_07      in varchar2 default null,
    p_substitution_value_07       in varchar2 default null,
    p_substitution_string_08      in varchar2 default null,
    p_substitution_value_08       in varchar2 default null)
    ;
procedure set_flow_status (
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_status               in varchar2,
    p_flow_status_message       in varchar2 default null,
    p_restrict_to_user_list     in varchar2 default null)
    ;

--==============================================================================
-- implementation of apex_util.set_compatibility_mode
--==============================================================================
procedure set_compatibility_mode (
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_compatibility_mode        in varchar2 );

procedure create_user_interface (
    p_id                            in number   default null, -- deprecated
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_ui_type_name                  in varchar2 default null, -- Deprecated
    p_display_name                  in varchar2 default null, -- Deprecated
    p_display_seq                   in number   default null, -- deprecated
    p_use_auto_detect               in boolean  default null, -- deprecated
    p_is_default                    in boolean  default null, -- deprecated
    p_theme_id                      in number,
    p_home_url                      in varchar2 default null,
    p_login_url                     in varchar2 default null,
    p_theme_style_by_user_pref      in boolean  default false,
    p_built_with_love               in boolean  default true,
    p_global_page_id                in number   default null,
    p_navigation_list_id            in number   default null,
    p_navigation_list_position      in varchar2 default null,
    p_navigation_list_template_id   in number   default null,
    p_nav_list_template_options     in varchar2 default null,
    p_content_delivery_network      in varchar2 default null, /* desupported */
    p_css_file_urls                 in varchar2  default null,
    p_javascript_file_urls          in varchar2 default null,
    p_include_legacy_javascript     in varchar2 default null,
    p_include_jquery_migrate        in boolean  default false,
    p_required_patch                in number   default null, -- deprecated
    p_nav_bar_type                  in varchar2 default 'NAVBAR',
    p_nav_bar_list_id               in number   default null,
    p_nav_bar_list_template_id      in number   default null,
    p_nav_bar_template_options      in varchar2 default null);

-- For backward compatibility of < APEX 18 imports
procedure create_user_interface (
    p_id                            in number   default null, -- deprecated
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_ui_type_name                  in varchar2 default null, -- Deprecated
    p_display_name                  in varchar2 default null, -- Deprecated
    p_display_seq                   in number   default null, -- deprecated
    p_use_auto_detect               in boolean  default null, -- deprecated
    p_is_default                    in boolean  default null, -- deprecated
    p_theme_id                      in number,
    p_home_url                      in varchar2 default null,
    p_login_url                     in varchar2 default null,
    p_theme_style_by_user_pref      in boolean  default false,
    p_built_with_love               in boolean  default true,
    p_global_page_id                in number   default null,
    p_navigation_list_id            in number   default null,
    p_navigation_list_position      in varchar2 default null,
    p_navigation_list_template_id   in number   default null,
    p_nav_list_template_options     in varchar2 default null,
    p_content_delivery_network      in varchar2 default null, /* desupported */
    p_css_file_urls                 in varchar2  default null,
    p_javascript_file_urls          in varchar2 default null,
    p_include_legacy_javascript     in boolean,
    p_include_jquery_migrate        in boolean  default false,
    p_required_patch                in number   default null, -- deprecated
    p_nav_bar_type                  in varchar2 default 'NAVBAR',
    p_nav_bar_list_id               in number   default null,
    p_nav_bar_list_template_id      in number   default null,
    p_nav_bar_template_options      in varchar2 default null);

procedure create_combined_file (
    p_id                in number   default null,
    p_flow_id           in number   default wwv_flow.g_flow_id,
    p_user_interface_id in number   default null, -- deprecated
    p_page_id           in number   default null,
    p_combined_file_url in varchar2,
    p_single_file_urls  in varchar2,
    p_required_patch    in number   default null );

function create_static_file (
    p_scope        in wwv_flow_file_api.t_file_scope,
    p_id           in number        default null,

    p_flow_id      in number        default null,
    p_plugin_id    in number        default null,
    p_theme_id     in number        default null,
    p_theme_ref_id in number        default null,

    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2      default null,
    p_file_content in blob )
return number;

procedure create_app_static_file (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in blob );

procedure remove_app_static_file (
    p_id      in number   default null,
    p_flow_id in number   default wwv_flow.g_flow_id );

procedure create_workspace_static_file (
    p_id           in number   default null,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in blob );

--
-- S E C U R I T Y   S C H E M E S
--
procedure create_security_scheme (
    p_id                       in number   default null,
    p_security_group_id        in number   default null, -- obsolete
    p_flow_id                  in number   default wwv_flow.g_flow_id,
    p_name                     in varchar2 default null,
    p_scheme_type              in varchar2 default null,
    p_attribute_01             in varchar2 default null,
    p_attribute_02             in varchar2 default null,
    p_attribute_03             in varchar2 default null,
    p_attribute_04             in varchar2 default null,
    p_attribute_05             in varchar2 default null,
    p_attribute_06             in varchar2 default null,
    p_attribute_07             in varchar2 default null,
    p_attribute_08             in varchar2 default null,
    p_attribute_09             in varchar2 default null,
    p_attribute_10             in varchar2 default null,
    p_attribute_11             in varchar2 default null,
    p_attribute_12             in varchar2 default null,
    p_attribute_13             in varchar2 default null,
    p_attribute_14             in varchar2 default null,
    p_attribute_15             in varchar2 default null,
    p_scheme                   in varchar2 default null, -- obsolete
    p_scheme_text              in varchar2 default null, -- obsolete
    p_caching                  in varchar2 default null,
    p_error_message            in varchar2 default null,
    p_reference_id             in number   default null,
    p_comments                 in varchar2 default null);

procedure create_acl_role (
    p_id                       in number              default null,
    p_flow_id                  in number              default wwv_flow.g_flow_id,
    p_static_id                in varchar2            default null,
    p_name                     in varchar2,
    p_description              in varchar2            default null,
    p_users                    in wwv_flow_t_varchar2 default null );

--
-- N A V I G A T I O N   B A R
--

procedure create_icon_bar (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_icon_bar_text             in varchar2 default null,
    p_icon_bar_table_width      in varchar2 default null);

procedure create_icon_bar_item (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_icon_sequence             in number   default null,
    p_icon_image                in varchar2 default null,
    p_icon_image2               in varchar2 default null,
    p_icon_image3               in varchar2 default null,
    p_icon_subtext              in varchar2 default null,
    p_icon_subtext2             in varchar2 default null,
    p_icon_subtext3             in varchar2 default null,
    p_icon_target               in varchar2 default null,
    p_icon_image_alt            in varchar2 default null,
    p_icon_height               in number   default null,
    p_icon_width                in number   default null,
    p_icon_height2              in number   default null,
    p_icon_width2               in number   default null,
    p_icon_height3              in number   default null,
    p_icon_width3               in number   default null,
    p_icon_bar_disp_cond        in varchar2 default null,
    p_icon_bar_disp_cond_type   in varchar2 default null,
    p_icon_bar_flow_cond_instr  in varchar2 default null,
    p_begins_on_new_line        in varchar2 default null,
    p_cell_colspan              in number   default null,
    p_onclick                   in varchar2 default null,
    p_required_patch            in number   default null,
    p_security_scheme           in varchar2 default null,
    p_reference_id              in number   default null,
    p_nav_entry_is_feedback_yn  in varchar2 default null,
    p_icon_bar_comment          in varchar2 default null );

procedure set_icon_bar_item (
    p_id                        in number,
    p_icon_sequence             in number   default null,
    p_icon_image                in varchar2 default null,
    p_icon_image2               in varchar2 default null,
    p_icon_image3               in varchar2 default null,
    p_icon_subtext              in varchar2 default null,
    p_icon_subtext2             in varchar2 default null,
    p_icon_subtext3             in varchar2 default null,
    p_icon_target               in varchar2 default null,
    p_icon_image_alt            in varchar2 default null,
    p_icon_height               in number   default null,
    p_icon_width                in number   default null,
    p_icon_height2              in number   default null,
    p_icon_width2               in number   default null,
    p_icon_height3              in number   default null,
    p_icon_width3               in number   default null,
    p_icon_bar_disp_cond        in varchar2 default null,
    p_icon_bar_disp_cond_type   in varchar2 default null,
    p_icon_bar_flow_cond_instr  in varchar2 default null,
    p_begins_on_new_line        in varchar2 default null,
    p_cell_colspan              in number   default null,
    p_required_patch            in number   default null,
    p_icon_bar_comment          in varchar2 default null);

procedure remove_icon_bar_item (
    p_id                        in number);

--
-- F L O W   P R O C E S S
--
procedure create_flow_process (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_process_sequence          in number   default null,
    p_process_point             in varchar2,
    p_process_type              in varchar2 default 'PLSQL',
    p_process_name              in varchar2 default null,
    p_process_sql               in varchar2 default null,
    p_process_sql_clob          in varchar2 default null,
    p_process_clob_language     in varchar2 default null,
    p_location                  in varchar2 default 'LOCAL',
    p_remote_server_id          in number   default null,
    p_web_src_operation_id      in number   default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    p_process_error_message     in varchar2 default null,
    p_error_display_location    in varchar2 default 'ON_ERROR_PAGE',
    p_process_when              in varchar2 default null,
    p_process_when_type         in varchar2 default null,
    p_process_when2             in varchar2 default null,
    p_process_when_type2        in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_process_item_name         in varchar2 default null,
    p_process_comment           in varchar2 default null );

procedure set_flow_process_sql (
    p_id                        in number   default null,
    p_process_sql               in varchar2 default null)
    ;


--
-- F L O W   I T E M S
--

procedure create_flow_item (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_scope                     in varchar2 default 'APP',
    p_data_type                 in varchar2 default 'VARCHAR',
    p_is_persistent             in varchar2 default c_y,
    p_required_patch            in number   default null,
    p_protection_level          in varchar2 default null,
    p_escape_on_http_output     in varchar2 default null,
    p_item_comment              in varchar2 default null);

--
-- F L O W   C O M P U T A T I O N S
--
procedure create_flow_computation (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_computation_sequence      in number   default null,
    p_computation_item          in varchar2 default null,
    p_computation_point         in varchar2 default null,
    p_computation_item_type     in varchar2 default null,
    p_computation_type          in varchar2 default null,
    p_computation_language      in varchar2 default null,
    p_computation_processed     in varchar2 default null,
    p_computation               in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_computation_comment       in varchar2 default null,
    p_compute_when              in varchar2 default null,
    p_compute_when_type         in varchar2 default null,
    p_compute_when_text         in varchar2 default null,
    p_computation_error_message in varchar2 default null);

procedure create_app_setting (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2,
    p_value                     in varchar2 default null,
    p_is_required               in varchar2 default null,
    p_valid_values              in varchar2 default null,
    p_on_upgrade_keep_value     in boolean  default false,
    p_required_patch            in number   default null,
    p_comments                  in varchar2 default null );

procedure create_tab (
    --
    -- Standard Tabs
    --
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_tab_set                   in varchar2 default null,
    p_tab_sequence              in number   default null,
    p_tab_name                  in varchar2 default null,
    p_tab_image                 in varchar2 default null,
    p_tab_non_current_image     in varchar2 default null,
    p_tab_image_attributes      in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    p_tab_step                  in number   default null,
    p_tab_also_current_for_pages in varchar2 default null,
    p_tab_parent_tabset         in varchar2 default null,
    p_tab_plsql_condition       in varchar2 default null,
    p_display_condition_type    in varchar2 default null,
    p_tab_disp_cond_text        in varchar2 default null,
    p_required_patch            in number   default null,
    p_security_scheme           in varchar2 default null,
    p_tab_comment               in varchar2 default null,
    --
    p_auto_parent_tab_set       in varchar2 default null,
    p_auto_parent_tab_text      in varchar2 default null );

procedure update_tab_condition (
    p_id                        in number   default null,
    p_tab_plsql_condition       in varchar2 default null);

procedure update_tab_text (
    p_id                        in number   default null,
    p_tab_text                  in varchar2 default null);

procedure rename_tabset (
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_old_name                  in varchar2 default null,
    p_new_name                  in varchar2 default null);

procedure create_toplevel_tab (
    --
    -- Parent Tabs
    --
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_tab_set                   in varchar2 default null,
    p_tab_sequence              in number   default null,
    p_tab_name                  in varchar2 default null,
    p_tab_image                 in varchar2 default null,
    p_tab_non_current_image     in varchar2 default null,
    p_tab_image_attributes      in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    p_tab_target                in varchar2 default null,
    p_current_on_tabset         in varchar2 default null,
    p_display_condition         in varchar2 default null,
    p_display_condition2        in varchar2 default null,
    p_display_condition_type    in varchar2 default null,
    p_required_patch            in number   default null,
    p_security_scheme           in varchar2 default null,
    p_tab_comment               in varchar2 default null );

procedure update_toplevel_tab (
    p_id                        in number   default null,
    p_display_condition         in varchar2 default null);


procedure set_toplevel_tab_target (
    p_id                        in number   default null,
    p_tab_target                in varchar2 default null);

procedure set_toplevel_tab_text (
    p_id                        in number   default null,
    p_tab_text                  in varchar2 default null);


--
-- L I S T S  O F  V A L U E S
--

procedure create_list_of_values (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_lov_name                      in varchar2 default null,
    p_lov_query                     in varchar2 default null,
    p_source_type                   in varchar2 default null,
    p_function_body_language        in varchar2 default null,
    p_reference_id                  in number   default null,
    --
    p_location                      in varchar2 default null,
    p_remote_server_id              in number   default null,
    p_web_src_module_id             in number   default null,
    p_use_local_sync_table          in boolean  default null,
    p_query_owner                   in varchar2 default null,
    p_query_table                   in varchar2 default null,
    p_query_where                   in varchar2 default null,
    p_source_post_processing        in varchar2 default null,
    p_optimizer_hint                in varchar2 default null,
    p_remote_sql_caching            in varchar2 default null,
    p_remote_sql_invalidate_when    in varchar2 default null,
    p_external_filter_expr          in varchar2 default null,
    p_external_order_by_expr        in varchar2 default null,
    --
    p_return_column_name            in varchar2 default null,
    p_display_column_name           in varchar2 default null,
    p_icon_column_name              in varchar2 default null,
    p_group_column_name             in varchar2 default null,
    p_group_sort_direction          in varchar2 default null,
    p_default_sort_column_name      in varchar2 default null,
    p_default_sort_direction        in varchar2 default null,
    p_oracle_text_column_name       in varchar2 default null );

procedure create_list_of_values_cols (
    p_id                            in number   default null,
    p_lov_id                        in number   default wwv_flow_imp_shared.current_lov_id,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    --
    p_query_column_name             in varchar2,
    p_heading                       in varchar2 default null,
    p_display_sequence              in number,
    p_format_mask                   in varchar2 default null,
    p_data_type                     in varchar2,
    p_is_visible                    in varchar2 default c_y,
    p_is_searchable                 in varchar2 default c_y,
    --
    p_column_comment                in varchar2 default null);

procedure create_static_lov_data (
    p_id                        in number   default null,
    p_lov_id                    in number   default wwv_flow_imp_shared.current_lov_id,
    p_lov_disp_sequence         in number   default null,
    p_lov_disp_value            in varchar2 default null,
    p_lov_return_value          in varchar2 default null,
    p_lov_template              in varchar2 default null,
    p_lov_disp_cond_type        in varchar2 default null,
    p_lov_disp_cond             in varchar2 default null,
    p_lov_disp_cond2            in varchar2 default null,
    p_required_patch            in varchar2 default null,
    p_lov_data_comment          in varchar2 default null );

--
-- I N S T A L L E R
--

procedure create_install (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_include_in_export_yn        in varchar2 default c_y,
    p_welcome_message             in varchar2 default null,
    p_license_message             in varchar2 default null,
    p_configuration_message       in varchar2 default null,
    p_build_options_message       in varchar2 default null,
    p_validation_message          in varchar2 default null,
    p_install_message             in varchar2 default null,
    p_install_success_message     in varchar2 default null,
    p_install_failure_message     in varchar2 default null,
    p_upgrade_message             in varchar2 default null,
    p_upgrade_confirm_message     in varchar2 default null,
    p_upgrade_success_message     in varchar2 default null,
    p_upgrade_failure_message     in varchar2 default null,
    p_get_version_sql_query       in varchar2 default null,
    p_deinstall_message           in varchar2 default null,
    p_deinstall_success_message   in varchar2 default null,
    p_deinstall_failure_message   in varchar2 default null,
    p_deinstall_script_clob       in varchar2 default null,

    p_prompt_sub_string_01        in varchar2 default null,
    p_prompt_sub_string_02        in varchar2 default null,
    p_prompt_sub_string_03        in varchar2 default null,
    p_prompt_sub_string_04        in varchar2 default null,
    p_prompt_sub_string_05        in varchar2 default null,
    p_prompt_sub_string_06        in varchar2 default null,
    p_prompt_sub_string_07        in varchar2 default null,
    p_prompt_sub_string_08        in varchar2 default null,
    p_prompt_sub_string_09        in varchar2 default null,
    p_prompt_sub_string_10        in varchar2 default null,
    p_prompt_sub_string_11        in varchar2 default null,
    p_prompt_sub_string_12        in varchar2 default null,
    p_prompt_sub_string_13        in varchar2 default null,
    p_prompt_sub_string_14        in varchar2 default null,
    p_prompt_sub_string_15        in varchar2 default null,
    p_prompt_sub_string_16        in varchar2 default null,
    p_prompt_sub_string_17        in varchar2 default null,
    p_prompt_sub_string_18        in varchar2 default null,
    p_prompt_sub_string_19        in varchar2 default null,
    p_prompt_sub_string_20        in varchar2 default null,

    p_install_prompt_01           in varchar2 default null,
    p_install_prompt_02           in varchar2 default null,
    p_install_prompt_03           in varchar2 default null,
    p_install_prompt_04           in varchar2 default null,
    p_install_prompt_05           in varchar2 default null,
    p_install_prompt_06           in varchar2 default null,
    p_install_prompt_07           in varchar2 default null,
    p_install_prompt_08           in varchar2 default null,
    p_install_prompt_09           in varchar2 default null,
    p_install_prompt_10           in varchar2 default null,
    p_install_prompt_11           in varchar2 default null,
    p_install_prompt_12           in varchar2 default null,
    p_install_prompt_13           in varchar2 default null,
    p_install_prompt_14           in varchar2 default null,
    p_install_prompt_15           in varchar2 default null,
    p_install_prompt_16           in varchar2 default null,
    p_install_prompt_17           in varchar2 default null,
    p_install_prompt_18           in varchar2 default null,
    p_install_prompt_19           in varchar2 default null,
    p_install_prompt_20           in varchar2 default null,

    p_prompt_if_mult_auth_yn      in varchar2 default null,

    p_trigger_install_when_cond   in varchar2 default null,
    p_trigger_install_when_exp1   in varchar2 default null,
    p_trigger_install_when_exp2   in varchar2 default null,
    p_trigger_failure_message     in varchar2 default null,

    p_required_free_kb            in number   default null,
    p_required_sys_privs          in varchar2 default null,
    p_required_names_available    in varchar2 default null,

    p_last_updated_by             in varchar2 default null,
    p_last_updated_on             in date     default null );

procedure create_install_script (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_security_group_id           in number   default null,
    p_install_id                  in number   default null,
    p_name                        in varchar2 default null,
    p_sequence                    in number   default null,
    p_script_type                 in varchar2 default null,
    p_script_option               in varchar2 default null,
    p_script_clob                 in varchar2 default null,
    p_condition_type              in varchar2 default null,
    p_condition                   in varchar2 default null,
    p_condition2                  in varchar2 default null );

procedure create_install_object (
    p_id                               in number      default null,
    p_flow_id                          in number      default wwv_flow.g_flow_id,
    p_script_id                        in number      default null,
    p_object_owner                     in varchar2    default null,
    p_object_type                      in varchar2    default null,
    p_object_name                      in varchar2    default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null );

procedure append_to_install_script (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_script_clob                 in varchar2 default null,
    p_deinstall                   in boolean  default false) ;

procedure create_install_check (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_security_group_id           in number   default null,
    p_install_id                  in number   default null,
    p_name                        in varchar2 default null,
    p_sequence                    in number   default null,
    p_check_type                  in varchar2 default null,
    p_check_condition             in varchar2 default null,
    p_check_condition2            in varchar2 default null,
    p_failure_message             in varchar2 default null,

    p_condition_type              in varchar2 default null,
    p_condition                   in varchar2 default null,
    p_condition2                  in varchar2 default null );

procedure create_install_build_option (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_security_group_id           in number   default null,
    p_install_id                  in number   default null,
    p_build_opt_id                in number   default null );

--
-- P A G E
--
procedure create_page (
    --
    -- Creates a page identification.  The p_auto_ auto
    -- arguments are used to optionally create new
    -- tab sets and tab text.
    --
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_user_interface_id           in number   default null, -- deprecated
    p_tab_set                     in varchar2 default null,
    p_name                        in varchar2 default null,
    p_alias                       in varchar2 default null,
    p_page_mode                   in varchar2 default 'NORMAL',
    p_step_title                  in varchar2 default null,
    p_step_sub_title              in varchar2 default null,
    p_step_sub_title_type         in varchar2 default null,
    p_media_type                  in varchar2 default null,
    p_first_item                  in varchar2 default 'NO_FIRST_ITEM',
    p_include_apex_css_js_yn      in varchar2 default c_y,
    p_render_form_as_table        in varchar2 default null,
    p_welcome_text                in varchar2 default null,
    p_box_welcome_text            in varchar2 default null,
    p_box_footer_text             in varchar2 default null,
    p_footer_text                 in varchar2 default null,
    p_help_text                   in varchar2 default null,
    p_step_template               in number   default null,
    p_page_css_classes            in varchar2 default null,
    p_page_template_options       in varchar2 default null,
    p_box_image                   in varchar2 default null,
    p_required_role               in varchar2 default null,
    p_required_patch              in number   default null,
    p_allow_duplicate_submissions in varchar2 default c_y,
    p_on_dup_submission_goto_url  in varchar2 default null,
    p_reload_on_submit            in varchar2 default 'S',
    p_warn_on_unsaved_changes     in varchar2 default c_y,
    p_html_page_header            in varchar2 default null,
    p_html_page_onload            in varchar2 default null,
    p_javascript_file_urls        in varchar2 default null,
    p_javascript_code             in varchar2 default null,
    p_javascript_code_onload      in varchar2 default null,
    p_css_file_urls               in varchar2 default null,
    p_inline_css                  in varchar2 default null,
    p_page_is_protected_y_n       in varchar2 default null,
    p_page_is_public_y_n          in varchar2 default c_n,
    p_protection_level            in varchar2 default c_n,
    p_error_handling_function     in varchar2 default null,
    p_error_notification_text     in varchar2 default null,
    p_page_comment                in varchar2 default null,
    --
    p_dialog_title                in varchar2 default null,
    p_dialog_height               in varchar2 default null,
    p_dialog_width                in varchar2 default null,
    p_dialog_max_width            in varchar2 default null,
    p_dialog_attributes           in varchar2 default null,
    p_dialog_css_classes          in varchar2 default null,
    p_dialog_chained              in varchar2 default c_y,
    --
    p_overwrite_navigation_list   in varchar2 default c_n,
    p_navigation_list_position    in varchar2 default null,
    p_navigation_list_id          in number   default null,
    p_navigation_list_template_id in number   default null,
    p_nav_list_template_options   in varchar2 default null,
    --
    p_tab_name                    in varchar2 default null,  -- current tab name
    --
    p_auto_tab_set                in varchar2 default null,
    p_auto_tab_text               in varchar2 default null,
    p_auto_parent_tab_set         in varchar2 default null,
    p_auto_parent_tab_text        in varchar2 default null,
    --
    p_autocomplete_on_off         in varchar2 default null,
    p_page_transition             in varchar2 default null, -- deprecated
    p_popup_transition            in varchar2 default null, -- deprecated
    --
    p_browser_cache               in varchar2 default null,
    p_deep_linking                in varchar2 default null,
    p_rejoin_existing_sessions    in varchar2 default null,
    --
    p_read_only_when_type         in varchar2 default null,
    p_read_only_when              in varchar2 default null,
    p_read_only_when2             in varchar2 default null,
    --
    p_cache_mode                  in varchar2 default null,-- 5.0 replacement for p_cache_page_yn and p_cache_by_user_yn
    p_cache_page_yn               in varchar2 default c_n, -- pre 5.0
    p_cache_timeout_seconds       in number   default null,
    p_cache_by_user_yn            in varchar2 default null,-- pre 5.0
    p_cache_when_condition_type   in varchar2 default null,
    p_cache_when_condition_e1     in varchar2 default null,
    p_cache_when_condition_e2     in varchar2 default null,
    --
    p_group_id                    in number   default null,
    --
    p_last_updated_by             in varchar2 default null,
    p_last_upd_yyyymmddhh24miss   in varchar2 default null,
    --
    p_created_by                  in varchar2 default null,
    p_created_on_yyyymmddhh24miss in varchar2 default null );

procedure create_page_group (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_group_name                  in varchar2 default null,
    p_group_desc                  in varchar2 default null );

procedure create_page_help (
    --
    -- Used to add up to 32767 bytes of page level help text to an existing page.
    -- P_ID identifies the page ID.
    --
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_help_text                   in varchar2 default null );

procedure update_page (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_tab_set                     in varchar2 default null,
    p_name                        in varchar2 default null,
    p_step_title                  in varchar2 default null,
    p_step_sub_title              in varchar2 default null,
    p_step_sub_title_type         in varchar2 default null,
    p_welcome_text                in varchar2 default null,
    p_box_welcome_text            in varchar2 default null,
    p_box_footer_text             in varchar2 default null,
    p_footer_text                 in varchar2 default null,
    p_help_text                   in varchar2 default null,
    p_step_template               in varchar2 default null,
    p_box_image                   in varchar2 default null,
    p_required_role               in varchar2 default null,
    p_required_patch              in number   default null,
    p_page_comment                in varchar2 default null);


--
-- B U T T O N S
--
procedure create_page_button (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_flow_step_id               in number   default wwv_flow_imp_page.current_page_id,
    p_button_sequence            in number   default null,
    p_button_plug_id             in number   default null,
    p_button_position            in varchar2 default 'BODY',
    p_button_name                in varchar2 default null,
    p_button_static_id           in varchar2 default null,
    p_button_template_id         in number   default null,
    p_button_template_options    in varchar2 default null,
    p_button_image               in varchar2 default null,
    p_button_is_hot              in varchar2 default c_n,
    p_button_image_alt           in varchar2 default null,
    p_button_alignment           in varchar2 default 'RIGHT',
    p_button_redirect_url        in varchar2 default null,
    p_button_action              in varchar2 default null,
    p_button_execute_validations in varchar2 default c_y,
    p_warn_on_unsaved_changes    in varchar2 default 'I',
    p_confirm_message            in varchar2 default null,
    p_confirm_style              in varchar2 default null,
    p_button_condition           in varchar2 default null,
    p_button_condition2          in varchar2 default null,
    p_button_condition_type      in varchar2 default null,
    p_button_image_attributes    in varchar2 default null,
    p_button_css_classes         in varchar2 default null,
    p_icon_css_classes           in varchar2 default null,
    p_button_cattributes         in varchar2 default null,
    p_request_source             in varchar2 default null,
    p_request_source_type        in varchar2 default null,
    p_pre_element_text           in varchar2 default null,
    p_post_element_text          in varchar2 default null,
    p_grid_column_attributes     in varchar2 default null,
    p_grid_column_css_classes    in varchar2 default null,
    p_grid_new_grid              in boolean  default false,
    p_grid_new_row               in varchar2 default null,
    p_grid_row_css_classes       in varchar2 default null,
    p_grid_new_column            in varchar2 default null,
    p_grid_column_span           in number   default null,
    p_grid_row_span              in number   default null,
    p_grid_column                in number   default null,
    p_security_scheme            in varchar2 default null,
    p_required_patch             in number   default null,
    p_button_comment             in varchar2 default null,
    p_database_action            in varchar2 default null ) ;

--
-- B R A N C H
--
procedure create_page_branch (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default wwv_flow_imp_page.current_page_id,
    p_branch_name               in varchar2 default null,
    p_branch_action             in varchar2 default null,
    p_branch_point              in varchar2 default null,
    p_branch_type               in varchar2 default null,
    p_branch_language           in varchar2 default null,
    p_branch_when_button_id     in number   default null,
    p_branch_sequence           in number   default null,
    p_branch_condition_type     in varchar2 default null,
    p_branch_condition          in varchar2 default null,
    p_branch_condition_text     in varchar2 default null,
    p_save_state_before_branch_yn in varchar2 default c_n,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_branch_comment            in varchar2 default null );

--
-- B R A N C H   A R G S
--
procedure create_page_branch_args (
    p_id                        in number   default null,
    p_flow_step_branch_id       in number   default null,
    p_branch_arg_sequence       in number   default null,
    p_branch_arg_source_type    in varchar2 default null,
    p_branch_arg_source         in varchar2 default null,
    p_branch_arg_comment        in varchar2 default null );

--
-- P A G E   I T E M   G R O U P S
--
procedure create_page_item_group(
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_flow_step_id                in number   default wwv_flow_imp_page.current_page_id,
    p_page_plug_id                in number,
    p_label                       in varchar2,
    p_display_sequence            in number,
    p_icon_css_classes            in varchar2 default null,
    p_css_classes                 in varchar2 default null,
    --
    p_suggestions_type            in varchar2 default null,
    p_suggestions_language        in varchar2 default null,
    p_suggestions_source          in varchar2 default null,
    p_max_suggestions             in number   default null,
    --
    p_fc_filter_combination       in varchar2,
    p_fc_max_height               in number   default null,
    p_fc_show_label               in boolean  default null,
    p_fc_collapsible              in boolean  default false,
    p_fc_initial_collapsed        in boolean  default null,
    --
    p_fc_compute_counts           in boolean  default true,
    p_fc_show_counts              in boolean  default true,
    p_fc_zero_count_entries       in varchar2 default 'H',
    p_fc_show_selected_first      in boolean  default false,
    p_fc_sort_by_top_counts       in boolean  default false,
    p_fc_show_more_count          in number   default null,
    p_fc_show_chart               in boolean  default null,
    p_fc_initial_chart            in boolean  default null,
    p_fc_toggleable               in boolean  default false,
    p_fc_initial_toggled          in boolean  default null,
    --
    p_condition_expr1             in varchar2 default null,
    p_condition_expr2             in varchar2 default null,
    p_condition_type              in varchar2 default null,
    --
    p_group_comment               in varchar2 default null,
    --
    p_build_option_id             in number   default null,
    p_authorization_scheme        in varchar2 default null );

--
-- P A G E   I T E M S
--
procedure create_page_item (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_flow_step_id                in number   default wwv_flow_imp_page.current_page_id,
    p_item_group_id               in number   default null,
    p_name                        in varchar2 default null,
    p_name_length                 in number   default null,
    p_data_type                   in varchar2 default 'VARCHAR',
    p_source_data_type            in varchar2 default null,
    p_is_required                 in boolean  default false,
    p_is_primary_key              in boolean  default false,
    p_is_query_only               in boolean  default false,
    p_standard_validations        in varchar2 default null,
    p_accept_processing           in varchar2 default 'REPLACE_EXISTING',
    p_item_sequence               in number   default null,
    p_item_plug_id                in number   default null,
    p_item_display_point          in varchar2 default 'BODY',
    p_item_source_plug_id         in number   default null,
    p_use_cache_before_default    in varchar2 default 'YES',
    p_item_default                in varchar2 default null,
    p_item_default_type           in varchar2 default 'STATIC_TEXT_WITH_SUBSTITUTIONS',
    p_item_default_language       in varchar2 default null,
    p_prompt                      in varchar2 default null,
    p_placeholder                 in varchar2 default null,
    p_pre_element_text            in varchar2 default null,
    p_post_element_text           in varchar2 default null,
    p_format_mask                 in varchar2 default null,
    p_source                      in varchar2 default null,
    p_source_type                 in varchar2 default 'ALWAYS_NULL',
    p_source_language             in varchar2 default null,
    p_source_post_computation     in varchar2 default null,
    p_display_as                  in varchar2 default null,
    p_lov_language                in varchar2 default null,
    p_named_lov                   in varchar2 default null,
    p_lov                         in varchar2 default null,
    p_lov_columns                 in number   default null, -- deprecated
    p_lov_display_extra           in varchar2 default null,
    p_lov_display_null            in varchar2 default 'NO',
    p_lov_null_text               in varchar2 default null,
    p_lov_null_value              in varchar2 default null,
    p_lov_translated              in varchar2 default c_n,
    p_lov_cascade_parent_items    in varchar2 default null,
    p_lov_cascade_parent_column   in varchar2 default null,
    p_ajax_items_to_submit        in varchar2 default null,
    p_ajax_optimize_refresh       in varchar2 default null,
    p_cSize                       in number   default null,
    p_cMaxlength                  in number   default null,
    p_cHeight                     in number   default null,
    p_cAttributes                 in varchar2 default null,
    p_cAttributes_element         in varchar2 default null,
    p_tag_css_classes             in varchar2 default null,
    p_icon_css_classes            in varchar2 default null,
    p_tag_attributes              in varchar2 default null,
    p_tag_attributes2             in varchar2 default null,
    p_new_grid                    in boolean  default false,
    p_begin_on_new_line           in varchar2 default c_y,
    p_grid_row_css_classes        in varchar2 default null,
    p_begin_on_new_field          in varchar2 default c_y,
    p_colspan                     in number   default null,
    p_rowspan                     in number   default null,
    p_grid_column                 in number   default null,
    p_grid_label_column_span      in number   default null,
    p_grid_column_css_classes     in varchar2 default null,
    p_button_image                in varchar2 default null,
    p_button_image_attr           in varchar2 default null,
    p_label_alignment             in varchar2 default 'LEFT',
    p_field_alignment             in varchar2 default 'LEFT',
    p_field_template              in varchar2 default null,
    p_item_css_classes            in varchar2 default null,
    p_item_icon_css_classes       in varchar2 default null,
    p_item_template_options       in varchar2 default null,
    p_depending_on_id             in number   default null,
    p_depending_on_condition_type in varchar2 default null,
    p_depending_on_expression     in varchar2 default null,
    p_display_when                in varchar2 default null,
    p_display_when2               in varchar2 default null,
    p_display_when_type           in varchar2 default null,
    p_warn_on_unsaved_changes     in varchar2 default null,
    p_is_Persistent               in varchar2 default c_y,
    p_javascript                  in varchar2 default null,
    p_security_scheme             in varchar2 default null,
    p_required_patch              in number   default null,
    p_item_comment                in varchar2 default null,
    p_help_text                   in varchar2 default null,
    p_inline_help_text            in varchar2 default null,
    --
    p_read_only_when              in varchar2 default null,
    p_read_only_when2             in varchar2 default null,
    p_read_only_when_type         in varchar2 default null,
    p_read_only_disp_attr         in varchar2 default null,
    --
    p_protection_level            in varchar  default c_n,
    p_escape_on_http_input        in varchar2 default null,
    p_escape_on_http_output       in varchar2 default c_y,
    p_restricted_characters       in varchar2 default null,
    --
    p_encrypt_session_state_yn    in varchar2 default null,
    --
    p_plugin_init_javascript_code in varchar2 default null,
    --
    p_attribute_01                in varchar2 default null,
    p_attribute_02                in varchar2 default null,
    p_attribute_03                in varchar2 default null,
    p_attribute_04                in varchar2 default null,
    p_attribute_05                in varchar2 default null,
    p_attribute_06                in varchar2 default null,
    p_attribute_07                in varchar2 default null,
    p_attribute_08                in varchar2 default null,
    p_attribute_09                in varchar2 default null,
    p_attribute_10                in varchar2 default null,
    p_attribute_11                in varchar2 default null,
    p_attribute_12                in varchar2 default null,
    p_attribute_13                in varchar2 default null,
    p_attribute_14                in varchar2 default null,
    p_attribute_15                in varchar2 default null,
    --
    p_fc_max_height               in number   default null,
    p_fc_show_label               in boolean  default null,
    p_fc_collapsible              in boolean  default null,
    p_fc_initial_collapsed        in boolean  default null,
    p_fc_compute_counts           in boolean  default null,
    p_fc_show_counts              in boolean  default null,
    p_fc_zero_count_entries       in varchar2 default null,
    p_fc_show_more_count          in number   default null,
    p_fc_filter_values            in boolean  default null,
    p_fc_sort_by_top_counts       in boolean  default null,
    p_fc_show_selected_first      in boolean  default null,
    p_fc_show_chart               in boolean  default null,
    p_fc_initial_chart            in boolean  default null,
    p_fc_toggleable               in boolean  default null,
    p_fc_initial_toggled          in boolean  default null,
    --
    p_multi_value_type            in varchar2 default null,
    p_multi_value_separator       in varchar2 default null,
    p_multi_value_trim_space      in boolean  default null,
    p_fc_filter_combination       in varchar2 default null,
    --
    p_show_quick_picks            in varchar2 default c_n,
    p_quick_pick_label_01         in varchar2 default null,
    p_quick_pick_value_01         in varchar2 default null,
    p_quick_pick_label_02         in varchar2 default null,
    p_quick_pick_value_02         in varchar2 default null,
    p_quick_pick_label_03         in varchar2 default null,
    p_quick_pick_value_03         in varchar2 default null,
    p_quick_pick_label_04         in varchar2 default null,
    p_quick_pick_value_04         in varchar2 default null,
    p_quick_pick_label_05         in varchar2 default null,
    p_quick_pick_value_05         in varchar2 default null,
    p_quick_pick_label_06         in varchar2 default null,
    p_quick_pick_value_06         in varchar2 default null,
    p_quick_pick_label_07         in varchar2 default null,
    p_quick_pick_value_07         in varchar2 default null,
    p_quick_pick_label_08         in varchar2 default null,
    p_quick_pick_value_08         in varchar2 default null,
    p_quick_pick_label_09         in varchar2 default null,
    p_quick_pick_value_09         in varchar2 default null,
    p_quick_pick_label_10         in varchar2 default null,
    p_quick_pick_value_10         in varchar2 default null,
    p_quick_pick_link_attr        in varchar2 default null,
    --
    p_suggestions_type            in varchar2 default null,
    p_suggestions_language        in varchar2 default null,
    p_suggestions_source          in varchar2 default null,
    p_max_suggestions             in number   default null,
    --
    p_reference_id                in number   default null,
    --
    p_button_execute_validations  in varchar2 default c_y,
    p_button_action               in varchar2 default null,
    p_button_redirect_url         in varchar2 default null,
    p_button_is_hot               in varchar2 default null );

--
-- P A G E   C O M P U T A T I O N S
--
procedure create_page_computation (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default wwv_flow_imp_page.current_page_id,
    p_computation_sequence      in number   default null,
    p_computation_item          in varchar2 default null,
    p_computation_point         in varchar2 default 'AFTER_SUBMIT',
    p_computation_item_type     in varchar2 default null,
    p_computation_type          in varchar2 default 'SQL_EXPRESSION',
    p_computation_language      in varchar2 default null,
    p_computation_processed     in varchar2 default 'REPLACE_EXISTING',
    p_computation               in varchar2 default null,
    p_computation_comment       in varchar2 default null,
    p_compute_when              in varchar2 default null,
    p_compute_when_type         in varchar2 default null,
    p_computation_error_message in varchar2 default null,
    p_compute_when_text         in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null );

--
-- P A G E   V A L I D A T I O N S
--
procedure create_page_validation (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default wwv_flow_imp_page.current_page_id,
    p_tabular_form_region_id    in number   default null,
    p_validation_name           in varchar2 default null,
    p_validation_sequence       in number   default null,
    p_validation                in varchar2 default null,
    p_validation2               in varchar2 default null,
    p_validation_type           in varchar2 default null,
    p_error_message             in varchar2 default null,
    p_always_execute            in varchar2 default c_n,
    p_validation_condition      in varchar2 default null,
    p_validation_condition2     in varchar2 default null,
    p_validation_condition_type in varchar2 default null,
    p_exec_cond_for_each_row    in varchar2 default c_n,
    p_only_for_changed_rows     in varchar2 default c_y,
    p_when_button_pressed       in varchar2 default null,
    p_associated_item           in number   default null,
    p_associated_column         in varchar2 default null,
    p_error_display_location    in varchar2 default 'ON_ERROR_PAGE',
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_validation_comment        in varchar2 default null );

---------------------------------
-- D Y N A M I C    A C T I O N S
--
procedure create_page_da_event (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default wwv_flow_imp_page.current_page_id,
    p_name                      in varchar2,
    p_event_sequence            in number,
    p_triggering_element_type   in varchar2 default null,
    p_triggering_region_id      in number   default null,
    p_triggering_button_id      in number   default null,
    p_triggering_element        in varchar2 default null,
    p_condition_element_type    in varchar2 default null,
    p_condition_element         in varchar2 default null,
    p_triggering_condition_type in varchar2 default null,
    p_triggering_expression     in varchar2 default null,
    p_bind_type                 in varchar2,
    p_bind_delegate_to_selector in varchar2 default null,
    p_bind_event_type           in varchar2,
    p_bind_event_type_custom    in varchar2 default null,
    p_bind_event_data           in varchar2 default null,
    p_display_when_type         in varchar2 default null,
    p_display_when_cond         in varchar2 default null,
    p_display_when_cond2        in varchar2 default null,
    p_required_patch            in number   default null,
    p_security_scheme           in varchar2 default null,
    p_da_event_comment          in varchar2 default null );

procedure create_page_da_action (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_page_id                     in number   default wwv_flow_imp_page.current_page_id,
    p_event_id                    in number,
    p_event_result                in varchar2,
    p_action_sequence             in number,
    p_execute_on_page_init        in varchar2,
    p_stop_execution_on_error     in varchar2 default c_y,
    p_wait_for_result             in varchar2 default null,
    p_name                        in varchar2 default null,
    p_action                      in varchar2,
    p_affected_elements_type      in varchar2 default null,
    p_affected_region_id          in number   default null,
    p_affected_button_id          in number   default null,
    p_affected_elements           in varchar2 default null,
    p_plugin_init_javascript_code in varchar2 default null,
    p_attribute_01                in varchar2 default null,
    p_attribute_02                in varchar2 default null,
    p_attribute_03                in varchar2 default null,
    p_attribute_04                in varchar2 default null,
    p_attribute_05                in varchar2 default null,
    p_attribute_06                in varchar2 default null,
    p_attribute_07                in varchar2 default null,
    p_attribute_08                in varchar2 default null,
    p_attribute_09                in varchar2 default null,
    p_attribute_10                in varchar2 default null,
    p_attribute_11                in varchar2 default null,
    p_attribute_12                in varchar2 default null,
    p_attribute_13                in varchar2 default null,
    p_attribute_14                in varchar2 default null,
    p_attribute_15                in varchar2 default null,
    p_client_condition_type       in varchar2 default null,
    p_client_condition_elem_type  in varchar2 default null,
    p_client_condition_element    in varchar2 default null,
    p_client_condition_expression in varchar2 default null,
    p_server_condition_type       in varchar2 default null,
    p_server_condition_expr1      in varchar2 default null,
    p_server_condition_expr2      in varchar2 default null,
    p_build_option_id             in number   default null,
    p_security_scheme             in varchar2 default null,
    p_da_action_comment           in varchar2 default null );

------------------------------
-- P A G E   P R O C E S S E S
--
procedure create_page_process (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_flow_step_id              in number   default wwv_flow_imp_page.current_page_id,
    p_process_sequence          in number   default null,
    p_process_point             in varchar2,
    p_process_type              in varchar2 default 'PLSQL',
    p_process_name              in varchar2 default null,
    p_region_id                 in number   default null,
    p_process_sql               in varchar2 default null,
    p_process_sql_clob          in varchar2 default null,
    p_process_clob_language     in varchar2 default null,
    p_location                  in varchar2 default 'LOCAL',
    p_remote_server_id          in number   default null,
    p_web_src_module_id         in number   default null,
    p_web_src_operation_id      in number   default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    p_process_error_message     in varchar2 default null,
    p_error_display_location    in varchar2 default 'ON_ERROR_PAGE',
    p_process_when_button_id    in number   default null,
    p_process_when              in varchar2 default null,
    p_process_when_type         in varchar2 default null,
    p_process_when2             in varchar2 default null,
    p_exec_cond_for_each_row    in varchar2 default c_n,
    p_only_for_changed_rows     in varchar2 default c_y,
    p_process_when_type2        in varchar2 default null,
    p_process_success_message   in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_required_patch            in number   default null,
    p_process_is_stateful_y_n   in varchar2 default c_n,
    p_return_key_into_item1     in varchar2 default null,
    p_return_key_into_item2     in varchar2 default null,
    p_process_item_name         in varchar2 default null,
    p_process_comment           in varchar2 default null,
    p_runtime_where_clause      in varchar2 default null );

procedure set_page_process_source (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default wwv_flow_imp_page.current_page_id,
    p_process_sql_clob          in varchar2 default null );

------------------------------------------------------------
-- T H E M E S
--

procedure create_theme(
    p_id                            in number default null,
    p_flow_id                       in number default wwv_flow.g_flow_id,
    p_theme_id                      in number default null,
    p_theme_name                    in varchar2,
    p_theme_internal_name           in varchar2 default null,
    p_ui_type_name                  in varchar2 default null,
    p_navigation_type               in varchar2 default 'T',
    p_nav_bar_type                  in varchar2 default 'NAVBAR',
    p_reference_id                  in number   default null,
    p_is_locked                     in boolean  default false,
    p_default_page_template         in number default null,
    p_default_dialog_template       in number default null,
    p_error_template                in number default null,
    p_printer_friendly_template     in number default null,
    p_breadcrumb_display_point      in varchar2 default null,
    p_sidebar_display_point         in varchar2 default null,
    p_login_template                in number default null,
    p_default_button_template       in number default null,
    p_default_region_template       in number default null,
    p_default_chart_template        in number default null,
    p_default_form_template         in number default null,
    p_default_reportr_template      in number default null,
    p_default_tabform_template      in number default null,
    p_default_wizard_template       in number default null,
    p_default_menur_template        in number default null,
    p_default_listr_template        in number default null,
    p_default_irr_template          in number default null,
    p_default_report_template       in number default null,
    p_default_label_template        in number default null,
    p_default_menu_template         in number default null,
    p_default_calendar_template     in number default null,
    p_default_list_template         in number default null,
    p_default_nav_list_template     in number default null,
    p_default_top_nav_list_temp     in number default null,
    p_default_side_nav_list_temp    in number default null,
    p_default_nav_list_position     in varchar2 default null,
    p_default_option_label          in number default null,
    p_default_required_label        in number default null,
    p_default_page_transition       in varchar2 default null, -- deprecated
    p_default_popup_transition      in varchar2 default null, -- deprecated
    p_default_navbar_list_template  in number default null,
    p_default_dialogr_template      in number default null,
    p_default_dialogbtnr_template   in number default null,
    p_calendar_icon                 in varchar2 default null,
    p_calendar_icon_attr            in varchar2 default null,
    p_custom_icon_classes           in varchar2 default null,
    p_custom_icon_prefix_class      in varchar2 default null,
    p_custom_library_file_urls      in varchar2 default null,
    p_icon_library                  in varchar2 default null,
    p_javascript_file_urls          in varchar2 default null,
    p_css_file_urls                 in varchar2 default null,
    p_mobile_login_template         in number default null, -- deprecated
    p_mobile_page_template          in number default null, -- deprecated
    p_mobile_region_template        in number default null, -- deprecated
    p_mobile_list_template          in number default null, -- deprecated
    p_mobile_report_template        in number default null, -- deprecated
    p_mobile_calendar_template      in number default null, -- deprecated
    p_mobile_button_template        in number default null, -- deprecated
    p_mobile_required_label         in number default null, -- deprecated
    p_mobile_optional_label         in number default null, -- deprecated
    p_default_header_template       in number default null,
    p_default_footer_template       in number default null,
    p_theme_description             in varchar2 default null,
    p_file_prefix                   in varchar2 default null,
    p_files_version                 in number   default 1);

procedure create_theme_image (
    p_id                          in number default null,
    p_flow_id                     in number default wwv_flow.g_flow_id,
    p_theme_id                    in number default null,
    p_varchar2_table              in sys.dbms_sql.varchar2_table default empty_varchar2_table,
    p_mimetype                    in varchar2 default null);

procedure delete_theme(
    p_flow_id       in number default wwv_flow.g_flow_id,
    p_theme_id      in number default null,
    p_import        in varchar2 default null);

procedure set_theme_calendar_icon (
    p_id            in number default null,
    p_flow_id       in number default wwv_flow.g_flow_id,
    p_calendar_icon in varchar2 default null,
    p_calendar_icon_attr in varchar2 default null);

procedure create_theme_style (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_theme_id                      in number,
    p_name                          in varchar2,
    p_css_file_urls                 in varchar2 default null,
    p_css_classes                   in varchar2 default null,
    p_is_current                    in boolean,
    p_is_public                     in boolean  default false,
    p_is_accessible                 in boolean  default false,
    p_theme_roller_input_file_urls  in varchar2 default null,
    p_theme_roller_config           in clob     default null,
    p_theme_roller_output_file_url  in varchar2 default null,
    p_theme_roller_read_only        in boolean  default false,
    p_reference_id                  in number   default null,
    p_component_comment             in varchar2 default null );

procedure create_theme_file (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_theme_id     in number,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in blob,
    p_reference_id in number   default null );

procedure create_template_opt_group (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_theme_id                  in number,
    p_name                      in varchar2,
    p_display_name              in varchar2,
    p_display_sequence          in varchar2,
    p_template_types            in varchar2 default null,
    p_help_text                 in varchar2 default null,
    p_null_text                 in varchar2 default null,
    p_is_advanced               in varchar2,
    p_reference_id              in number default null);

procedure create_template_option (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_theme_id                  in number,
    p_name                      in varchar2,
    p_display_name              in varchar2,
    p_display_sequence          in varchar2,
    p_page_template_id          in number   default null,
    p_region_template_id        in number   default null,
    p_report_template_id        in number   default null,
    p_breadcrumb_template_id    in number   default null,
    p_list_template_id          in number   default null,
    p_field_template_id         in number   default null,
    p_button_template_id        in number   default null,
    p_css_classes               in varchar2,
    p_group_id                  in number   default null,
    p_template_types            in varchar2 default null,
    p_help_text                 in varchar2 default null,
    p_is_advanced               in varchar2 default null,
    p_reference_id              in number default null);

------------------------------------------------------------
-- T E M P L A T E S
--
-- page template
--

procedure create_template (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_internal_name             in varchar2 default null,
    p_look                      in number   default null,
    p_is_popup                  in boolean  default false,
    p_javascript_file_urls      in varchar2 default null,
    p_javascript_code           in varchar2 default null,
    p_javascript_code_onload    in varchar2 default null,
    p_css_file_urls             in varchar2 default null,
    p_inline_css                in varchar2 default null,
    p_header_template           in varchar2 default null,
    p_footer_template           in varchar2 default null,
    p_success_message           in varchar2 default null,
    --
    p_current_tab               in varchar2 default null,
    p_current_tab_font_attr     in varchar2 default null,
    p_non_current_tab           in varchar2 default null,
    p_non_current_tab_font_attr in varchar2 default null,
    --
    p_current_image_tab         in varchar2 default null,
    p_non_current_image_tab     in varchar2 default null,
    --
    p_top_current_tab            in varchar2 default null,
    p_top_current_tab_font_attr  in varchar2 default null,
    p_top_non_curr_tab           in varchar2 default null,
    p_top_non_curr_tab_font_attr in varchar2 default null,
    --
    p_box                       in varchar2 default null,
    p_navigation_bar            in varchar2 default null,
    p_navbar_entry              in varchar2 default null,
    p_body_title                in varchar2 default null,
    p_notification_message      in varchar2 default null,
    p_attribute1                in varchar2 default null,
    p_attribute2                in varchar2 default null,
    p_attribute3                in varchar2 default null,
    p_attribute4                in varchar2 default null,
    p_attribute5                in varchar2 default null,
    p_attribute6                in varchar2 default null,
    --
    p_table_bgcolor             in varchar2 default null,
    p_heading_bgcolor           in varchar2 default null,
    p_table_cattributes         in varchar2 default null,
    p_font_size                 in varchar2 default null,
    p_font_face                 in varchar2 default null,
    --
    p_region_table_cattributes  in varchar2 default null,
    --
    p_app_tab_before_tabs       in varchar2 default null,
    p_app_tab_current_tab       in varchar2 default null,
    p_app_tab_non_current_tab   in varchar2 default null,
    p_app_tab_after_tabs        in varchar2 default null,
    --
    p_error_page_template       in varchar2 default null,
    --
    p_default_button_position   in varchar2 default null,
    p_required_patch            in number   default null,
    p_reference_id              in number   default null,
    p_translate_this_template   in varchar2 default c_n,
    p_mobile_page_template      in varchar2 default c_n, /* obsolete */
    p_template_comment          in varchar2 default null,
    p_breadcrumb_def_reg_pos    in varchar2 default null,
    p_sidebar_def_reg_pos       in varchar2 default null,
    --
    p_grid_type                      in varchar2 default 'TABLE',
    p_grid_max_columns               in number   default null,
    p_grid_always_use_max_columns    in boolean  default null,
    p_grid_has_column_span           in boolean  default null,
    p_grid_always_emit               in boolean  default null,
    p_grid_emit_empty_leading_cols   in boolean  default null,
    p_grid_emit_empty_trail_cols     in boolean  default null,
    p_grid_default_label_col_span    in number   default null,
    p_grid_template                  in varchar2 default null,
    p_grid_row_template              in varchar2 default null,
    p_grid_column_template           in varchar2 default null,
    p_grid_first_column_attributes   in varchar2 default null,
    p_grid_last_column_attributes    in varchar2 default null,
    p_grid_javascript_debug_code     in varchar2 default null,
    --
    p_dialog_js_init_code            in varchar2 default null,
    p_dialog_js_close_code           in varchar2 default null,
    p_dialog_js_cancel_code          in varchar2 default null,
    p_dialog_height                  in varchar2 default null,
    p_dialog_width                   in varchar2 default null,
    p_dialog_max_width               in varchar2 default null,
    p_dialog_css_classes             in varchar2 default null,
    p_dialog_browser_frame           in varchar2 default null,
    --
    p_has_edit_links                 in boolean  default true, /* Deprecated */
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options  in varchar2 default null);

procedure create_page_tmpl_display_point (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_page_template_id       in number,
    p_name                   in varchar2,
    p_placeholder            in varchar2,
    p_has_grid_support       in boolean,
    p_has_region_support     in boolean  default true,
    p_has_item_support       in boolean  default false,
    p_has_button_support     in boolean  default false,
    p_glv_new_row            in boolean  default true,
    p_max_fixed_grid_columns in number   default null,
    p_component_comment      in varchar2 default null );

procedure create_button_templates (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_template_name                 in varchar2 default null,
    p_internal_name                 in varchar2 default null,
    p_template                      in clob     default null,
    p_hot_template                  in clob     default null,
    p_translate_this_template       in varchar2 default c_n,
    p_template_comment              in varchar2 default null,
    p_reference_id                  in number   default null,
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options  in varchar2 default null);

procedure create_plug_template (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_page_plug_template_name     in varchar2 default null,
    p_internal_name               in varchar2 default null,
    p_javascript_file_urls        in varchar2 default null,
    p_javascript_code_onload      in varchar2 default null,
    p_css_file_urls               in varchar2 default null,
    p_layout                      in varchar2 default 'TABLE',
    p_render_form_items_in_table  in varchar2 default null,  /* obsolete */
    p_template                    in varchar2 default null,
    p_template2                   in varchar2 default null,
    p_template3                   in varchar2 default null,
    p_sub_plug_header_template    in varchar2 default null,
    p_sub_plug_header_entry_templ in varchar2 default null,
    p_sub_plug_template           in varchar2 default null,
    p_plug_table_bgcolor          in varchar2 default null,
    p_plug_heading_bgcolor        in varchar2 default null,
    p_plug_font_size              in varchar2 default null,
    p_default_field_template_id   in number   default null,
    p_default_req_field_templ_id  in number   default null,
    p_default_label_alignment     in varchar2 default 'RIGHT',
    p_default_field_alignment     in varchar2 default 'LEFT',
    p_default_button_template_id  in number   default null,
    p_default_button_position     in varchar2 default null,
    p_reference_id                in number   default null,
    p_form_table_attr             in varchar2 default null,
    p_translate_this_template     in varchar2 default c_n,
    p_template_comment            in varchar2 default null,
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options  in varchar2 default null);

procedure set_plug_template_tab_attr (
    -- provides compatability with version 1.0.0
    p_id                            in number   default null,
    p_form_table_attr               in varchar2 default null );

procedure create_plug_tmpl_display_point (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_plug_template_id       in number,
    p_name                   in varchar2,
    p_placeholder            in varchar2,
    p_has_grid_support       in boolean,
    p_has_region_support     in boolean  default false,
    p_has_item_support       in boolean  default true,
    p_has_button_support     in boolean  default true,
    p_glv_new_row            in boolean  default true,
    p_max_fixed_grid_columns in number   default null,
    p_component_comment      in varchar2 default null );

procedure create_list_template (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_list_template_name            in varchar2 default null,
    p_internal_name                 in varchar2 default null,
    p_javascript_file_urls          in varchar2 default null,
    p_javascript_code_onload        in varchar2 default null,
    p_css_file_urls                 in varchar2 default null,
    p_inline_css                    in varchar2 default null,
    p_list_template_current         in varchar2 default null,
    p_list_template_noncurrent      in varchar2 default null,
    p_list_template_before_rows     in varchar2 default null,
    p_list_template_after_rows      in varchar2 default null,
    p_between_items                 in varchar2 default null,
    p_before_sub_list               in varchar2 default null,
    p_after_sub_list                in varchar2 default null,
    p_between_sub_list_items        in varchar2 default null,
    p_sub_list_item_current         in clob     default null,
    p_sub_list_item_noncurrent      in clob     default null,
    p_item_templ_curr_w_child       in clob     default null,
    p_item_templ_noncurr_w_child    in clob     default null,
    p_sub_templ_curr_w_child        in clob     default null,
    p_sub_templ_noncurr_w_child     in clob     default null,
    -- apex 4.0 mike
    p_f_list_template_noncurrent    in clob     default null,
    p_f_list_template_current       in clob     default null,
    p_f_item_template_curr_w_child  in clob     default null,
    p_fi_template_noncurr_w_child   in clob     default null,
    --
    p_reference_id                  in number   default null,
    p_translate_this_template       in varchar2 default c_n,
    p_list_template_comment         in varchar2 default null,
    --
    p_a01_label                     in varchar2 default null,
    p_a02_label                     in varchar2 default null,
    p_a03_label                     in varchar2 default null,
    p_a04_label                     in varchar2 default null,
    p_a05_label                     in varchar2 default null,
    p_a06_label                     in varchar2 default null,
    p_a07_label                     in varchar2 default null,
    p_a08_label                     in varchar2 default null,
    p_a09_label                     in varchar2 default null,
    p_a10_label                     in varchar2 default null,
    p_a11_label                     in varchar2 default null,
    p_a12_label                     in varchar2 default null,
    p_a13_label                     in varchar2 default null,
    p_a14_label                     in varchar2 default null,
    p_a15_label                     in varchar2 default null,
    p_a16_label                     in varchar2 default null,
    p_a17_label                     in varchar2 default null,
    p_a18_label                     in varchar2 default null,
    p_a19_label                     in varchar2 default null,
    p_a20_label                     in varchar2 default null,
    --
    p_theme_id                      in number   default null,
    p_theme_class_id                in number   default null,
    p_default_template_options      in varchar2 default null,
    p_preset_template_options       in varchar2 default null);

procedure create_row_template (
    --
    -- Create a report template which defines HTML
    -- template control over report rows
    --
    p_id                            in number default null,
    p_flow_id                       in number default wwv_flow.g_flow_id,
    p_row_template_name             in varchar2 default null,
    p_internal_name                 in varchar2 default null,
    p_javascript_file_urls          in varchar2 default null,
    p_javascript_code_onload        in varchar2 default null,
    p_css_file_urls                 in varchar2 default null,
    p_row_template_type             in varchar2 default null,
    p_before_column_heading         in varchar2 default null, -- new 3.1
    p_column_heading_template       in varchar2 default null,
    p_column_heading_sort_asc_temp  in varchar2 default null,
    p_column_heading_sort_desc_tem  in varchar2 default null,
    p_column_heading_sort_temp      in varchar2 default null,
    p_after_column_heading          in varchar2 default null, -- new 3.1
    p_row_template1                 in varchar2 default null,
    p_row_template_condition1       in varchar2 default null,
    p_row_template_display_cond1    in varchar2 default null,
    p_row_template2                 in varchar2 default null,
    p_row_template_condition2       in varchar2 default null,
    p_row_template_display_cond2    in varchar2 default null,
    p_row_template3                 in varchar2 default null,
    p_row_template_condition3       in varchar2 default null,
    p_row_template_display_cond3    in varchar2 default null,
    p_row_template4                 in varchar2 default null,
    p_row_template_condition4       in varchar2 default null,
    p_row_template_display_cond4    in varchar2 default null,
    p_row_template_before_rows      in varchar2 default null,
    p_row_template_after_rows       in varchar2 default null,
    p_row_template_before_first     in varchar2 default null,
    p_row_template_after_last       in varchar2 default null,
    p_row_template_table_attr       in varchar2 default null,
    p_reference_id                  in number   default null,
    --
    p_pagination_template           in varchar2 default null,
    p_next_page_template            in varchar2 default null,
    p_previous_page_template        in varchar2 default null,
    p_next_set_template             in varchar2 default null,
    p_previous_set_template         in varchar2 default null,
    --
    p_row_style_mouse_over          in varchar2 default null,
    p_row_style_mouse_out           in varchar2 default null,
    p_row_style_checked             in varchar2 default null,
    p_row_style_unchecked           in varchar2 default null,
    --
    p_translate_this_template       in varchar2 default c_n,
    p_row_template_comment          in varchar2 default null,
    --
    p_theme_id                      in number   default null,
    p_theme_class_id                in number   default null,
    p_default_template_options      in varchar2 default null,
    p_preset_template_options       in varchar2 default null);

procedure create_row_template_patch (
    --
    -- This procedure extendes the create_row_template
    -- procedure.  It allows for compatability with version
    -- 1.0.0.
    --
    p_id                            in number,
    p_row_template_before_first     in varchar2 default null,
    p_row_template_after_last       in varchar2 default null );

procedure create_field_template (
    --
    -- Create a field template which defines the display
    -- of a form field, for example a form page item label.
    -- Page lables do not require the use of a field template,
    -- the use of field templates is optional.
    -- Field templates are defined at the flow level and shared
    -- to all pages within a flow.
    --
    p_id                            in number default null,
    p_flow_id                       in number default wwv_flow.g_flow_id,
    p_template_name                 in varchar2 default null,
    p_internal_name                 in varchar2 default null,
    p_template_body1                in varchar2 default null,
    p_template_body2                in varchar2 default null,
    p_before_item                   in varchar2 default null,
    p_after_item                    in varchar2 default null,
    p_item_pre_text                 in varchar2 default null,
    p_item_post_text                in varchar2 default null,
    p_before_element                in varchar2 default null,
    p_after_element                 in varchar2 default null,
    p_help_link                     in varchar2 default null,
    p_inline_help_text              in varchar2 default null,
    p_error_template                in varchar2 default null,
    p_on_error_before_label         in varchar2 default null,
    p_on_error_after_label          in varchar2 default null,
    p_reference_id                  in number   default null,
    p_translate_this_template       in varchar2 default c_n,
    p_template_comment              in varchar2 default null,
    --
    p_theme_id                      in number   default null,
    p_theme_class_id                in number   default null,
    p_default_template_options      in varchar2 default null,
    p_preset_template_options       in varchar2 default null) ;

procedure create_calendar_template (
    -- creates a calendar template
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
    p_theme_class_id                  in number   default null);


procedure create_email_template (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_name                         in varchar2,
    p_static_id                    in varchar2,
    p_subject                      in varchar2,
    p_html_body                    in clob,
    p_html_header                  in clob     default null,
    p_html_footer                  in clob     default null,
    p_html_template                in clob     default null,
    p_text_template                in clob     default null,
    p_comment                      in varchar2 default null );

procedure create_automation (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_name                         in varchar2,
    p_static_id                    in varchar2 default null,
    p_trigger_type                 in varchar2,
    --
    p_polling_interval             in varchar2 default null,
    p_polling_status               in varchar2 default null,
    --
    p_result_type                  in varchar2 default null,
    p_location                     in varchar2 default null,
    p_remote_server_id             in number   default null,
    p_web_src_module_id            in number   default null,
    p_use_local_sync_table         in boolean  default null,
    p_query_type                   in varchar2 default null,
    p_query_source                 in varchar2 default null,
    p_function_body_language       in varchar2 default null,
    p_query_owner                  in varchar2 default null,
    p_query_table                  in varchar2 default null,
    p_query_where                  in varchar2 default null,
    p_query_order_by               in varchar2 default null,
    p_source_post_processing       in varchar2 default null,
    p_include_rowid_column         in boolean  default null,
    p_optimizer_hint               in varchar2 default null,
    p_external_filter_expr         in varchar2 default null,
    p_external_order_by_expr       in varchar2 default null,
    --
    p_pk_column_name               in varchar2 default null,
    p_max_rows_to_process          in number   default null,
    p_commit_each_row              in boolean,
    p_error_handling_type          in varchar2 default null,
    --
    p_code_snippet                 in varchar2 default null,
    p_init_proc_name               in varchar2 default null,
    p_before_processing_proc_name  in varchar2 default null,
    p_teardown_proc_name           in varchar2 default null,
    --
    p_condition_type               in varchar2 default null,
    p_condition_expr1              in varchar2 default null,
    p_condition_expr2              in varchar2 default null,
    --
    p_build_option_id              in varchar2 default null,
    p_comment                      in varchar2 default null );

procedure create_automation_action (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_automation_id                in number,
    --
    p_name                         in varchar2,
    p_execution_sequence           in number,
    p_action_type                  in varchar2,
    --
    p_action_clob                  in varchar2 default null,
    p_action_clob_language         in varchar2 default null,
    p_attribute_01                 in varchar2 default null,
    p_attribute_02                 in varchar2 default null,
    p_attribute_03                 in varchar2 default null,
    p_attribute_04                 in varchar2 default null,
    p_attribute_05                 in varchar2 default null,
    p_attribute_06                 in varchar2 default null,
    p_attribute_07                 in varchar2 default null,
    p_attribute_08                 in varchar2 default null,
    p_attribute_09                 in varchar2 default null,
    p_attribute_10                 in varchar2 default null,
    p_attribute_11                 in varchar2 default null,
    p_attribute_12                 in varchar2 default null,
    p_attribute_13                 in varchar2 default null,
    p_attribute_14                 in varchar2 default null,
    p_attribute_15                 in varchar2 default null,
    --
    p_location                     in varchar2 default null,
    p_remote_server_id             in number   default null,
    p_web_src_module_id            in number   default null,
    p_web_src_operation_id         in number   default null,
    --
    p_error_message                in varchar2 default null,
    p_stop_execution_on_error      in boolean,
    --
    p_condition_type               in varchar2 default null,
    p_condition_expr1              in varchar2 default null,
    p_condition_expr2              in varchar2 default null,
    p_exec_cond_for_each_row       in boolean  default null,
    --
    p_build_option_id              in varchar2 default null,
    p_comment                      in varchar2 default null );


procedure create_report_layout (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_report_layout_name            in varchar2 default null,
    p_report_layout_type            in varchar2 default null,
    p_page_template                 in varchar2 default null,
    p_varchar2_table                in sys.dbms_sql.varchar2_table default empty_varchar2_table,
    p_xslfo_column_heading          in varchar2 default null,
    p_xslfo_column_template         in varchar2 default null,
    p_xslfo_column_template_width   in varchar2 default null,
    p_reference_id                  in number   default null,
    p_report_layout_comment         in varchar2 default null)
    ;

procedure create_shared_query (
    --
    -- For high fidelity printing with custom/uploaded templates
    --
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_query_text                in varchar2 default null,
    p_xml_structure             in varchar2 default null,
    p_report_layout_id          in number   default null,
    p_format                    in varchar2 default null,
    p_format_item               in varchar2 default null,
    p_output_file_name          in varchar2 default null,
    p_content_disposition       in varchar2 default null,
    p_document_header           in varchar2 default null,
    p_xml_items                 in varchar2 default null)
    ;

procedure create_shared_query_stmnt (
    --
    -- For high fidelity printing with custom/uploaded templates
    --
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_shared_query_id           in varchar2 default null,
    p_sql_statement             in varchar2 default null)
    ;

--
-- R E G I O N S  (PLUGS)
--

procedure create_page_plug (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default wwv_flow_imp_page.current_page_id,
    p_plug_name                     in varchar2 default null,
    p_region_name                   in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_plug_display_point            in varchar2 default 'BODY',
    p_plug_template                 in number   default null,
    p_plug_display_sequence         in varchar2 default null,
    p_include_in_reg_disp_sel_yn    in varchar2 default c_n,
    p_region_css_classes            in varchar2 default null,
    p_icon_css_classes              in varchar2 default null,
    p_region_sub_css_classes        in varchar2 default null,
    p_region_template_options       in varchar2 default null,
    p_component_template_options    in varchar2 default null,
    p_region_attributes             in varchar2 default null,
    p_report_attributes             in varchar2 default null,
    p_escape_on_http_output         in varchar2 default c_n,
    p_plug_new_grid                 in boolean  default false,
    p_plug_new_grid_row             in boolean  default true,
    p_plug_grid_row_css_classes     in varchar2 default null,
    p_plug_new_grid_column          in boolean  default true,
    p_plug_grid_column_span         in number   default null,
    p_plug_grid_column_css_classes  in varchar2 default null,
    p_plug_display_column           in varchar2 default null,
    p_plug_item_display_point       in varchar2 default 'ABOVE',
    p_plug_source_type              in varchar2 default 'NATIVE_STATIC',
    p_location                      in varchar2 default 'LOCAL',
    p_web_src_module_id             in number   default null,
    p_use_local_sync_table          in boolean  default null,
    p_remote_server_id              in number   default null,
    p_query_type                    in varchar2 default null,
    p_function_body_language        in varchar2 default null,
    p_plug_source                   in varchar2 default null,
    p_query_owner                   in varchar2 default null,
    p_query_table                   in varchar2 default null,
    p_query_where                   in varchar2 default null,
    p_query_order_by                in varchar2 default null,
    p_source_post_processing        in varchar2 default null,
    p_include_rowid_column          in boolean  default null,
    p_optimizer_hint                in varchar2 default null,
    p_remote_sql_caching            in varchar2 default null,
    p_remote_sql_invalidate_when    in varchar2 default null,
    p_external_filter_expr          in varchar2 default null,
    p_external_order_by_expr        in varchar2 default null,
    p_is_editable                   in boolean  default null,
    p_edit_operations               in varchar2 default null,
    p_edit_row_operations_column    in varchar2 default null,
    p_add_authorization_scheme      in varchar2 default null,
    p_update_authorization_scheme   in varchar2 default null,
    p_delete_authorization_scheme   in varchar2 default null,
    p_lost_update_check_type        in varchar2 default null,
    p_row_version_column            in varchar2 default null,
    p_add_row_if_empty              in boolean  default null,
    p_lazy_loading                  in boolean  default null,
    p_list_id                       in number   default null,
    p_menu_id                       in number   default null,
    p_master_region_id              in number   default null,
    p_filtered_region_id            in number   default null,
    p_plug_display_error_message    in varchar2 default null, /* obsolete */
    p_plug_create_link_text         in varchar2 default null,
    p_plug_create_link_target       in varchar2 default null,
    p_plug_create_image             in varchar2 default null,
    p_plug_create_image_attributes  in varchar2 default null,
    p_plug_edit_link_text           in varchar2 default null,
    p_plug_edit_link_target         in varchar2 default null,
    p_plug_edit_image               in varchar2 default null,
    p_plug_edit_image_attributes    in varchar2 default null,
    p_plug_expand_link_text         in varchar2 default null,
    p_plug_expand_link_target       in varchar2 default null,
    p_plug_expand_image             in varchar2 default null,
    p_plug_expand_image_attributes  in varchar2 default null,
    p_plug_close_link_text          in varchar2 default null,
    p_plug_close_link_target        in varchar2 default null,
    p_plug_close_image              in varchar2 default null,
    p_plug_close_image_attributes   in varchar2 default null,
    p_plug_required_role            in varchar2 default null,
    p_plug_display_when_condition   in varchar2 default null,
    p_plug_display_when_cond2       in varchar2 default null,
    p_plug_display_condition_type   in varchar2 default null,
    --
    p_plug_read_only_when_type      in varchar2 default null,
    p_plug_read_only_when           in varchar2 default null,
    p_plug_read_only_when2          in varchar2 default null,
    --
    p_plug_header                   in varchar2 default null,
    p_plug_footer                   in varchar2 default null,
    p_plug_override_reg_pos         in varchar2 default null,
    p_plug_customized               in varchar2 default null,
    p_plug_customized_name          in varchar2 default null,
    p_translate_title               in varchar2 default c_y,
    p_ajax_enabled                  in varchar2 default null,
    p_ajax_items_to_submit          in varchar2 default null,
    p_rest_enabled                  in varchar2 default c_n,
    --
    p_region_image                  in varchar2 default null,
    p_region_image_attr             in varchar2 default null,
    --
    p_plug_query_row_template       in number   default null,
    p_plug_query_max_columns        in number   default null,
    p_plug_query_headings           in varchar2 default null,
    p_plug_query_headings_type      in varchar2 default 'COLON_DELMITED_LIST',
    p_plug_query_num_rows           in number   default null,
    p_plug_query_hit_highlighting   in varchar2 default null,
    p_plug_query_options            in varchar2 default null,
    p_plug_query_format_out         in varchar2 default null,
    p_plug_query_show_nulls_as      in varchar2 default null,
    p_plug_query_col_allignments    in varchar2 default null,
    p_plug_query_break_cols         in varchar2 default null,
    p_plug_query_sum_cols           in varchar2 default null,
    p_plug_query_number_formats     in varchar2 default null,
    p_plug_query_table_border       in varchar2 default null,
    p_plug_column_width             in varchar2 default null,
    p_plug_query_no_data_found      in varchar2 default null,
    p_no_data_found_icon_classes    in varchar2 default null,
    p_plug_query_more_data          in varchar2 default null,
    p_plug_ignore_pagination        in number   default null,
    p_plug_query_num_rows_item      in varchar2 default null,
    p_plug_query_num_rows_type      in varchar2 default null,
    p_plug_query_row_count_max      in number   default null,
    p_show_total_row_count          in boolean  default null,
    p_plug_query_asc_image          in varchar2 default null,
    p_plug_query_asc_image_attr     in varchar2 default null,
    p_plug_query_desc_image         in varchar2 default null,
    p_plug_query_desc_image_attr    in varchar2 default null,
    --
    p_plug_query_exp_filename       in varchar2 default null,
    p_plug_query_exp_separator      in varchar2 default null,
    p_plug_query_exp_enclosed_by    in varchar2 default null,
    p_plug_query_strip_html         in varchar2 default null,
    p_plug_query_parse_override     in varchar2 default null,
    --
    p_pagination_display_position   in varchar2 default null,
    p_report_total_text_format      in varchar2 default null,
    p_break_column_text_format      in varchar2 default null,
    p_break_before_row              in varchar2 default null,
    p_break_generic_column          in varchar2 default null,
    p_break_after_row               in varchar2 default null,
    p_break_type_flag               in varchar2 default null,
    p_break_repeat_heading_format   in varchar2 default null,
    p_csv_output                    in varchar2 default null,
    p_csv_output_link_text          in varchar2 default null,
    p_supplemental_text             in varchar2 default null,
    p_print_url                     in varchar2 default null,
    p_print_url_label               in varchar2 default null,
    --
    p_prn_output                    in varchar2 default null,
    p_prn_print_server_overwrite    in varchar2 default null,
    p_prn_template_id               in number   default null,
    p_prn_format                    in varchar2 default null,
    p_prn_format_item               in varchar2 default null,
    p_prn_output_show_link          in varchar2 default null,
    p_prn_output_link_text          in varchar2 default null,
    p_prn_output_file_name          in varchar2 default null,
    p_prn_content_disposition       in varchar2 default null,
    p_prn_document_header           in varchar2 default null,
    p_prn_units                     in varchar2 default null,
    p_prn_paper_size                in varchar2 default null,
    p_prn_width_units               in varchar2 default null,
    p_prn_width                     in number   default null,
    p_prn_height                    in number   default null,
    p_prn_orientation               in varchar2 default null,
    p_prn_page_header               in varchar2 default null,
    p_prn_page_header_font_color    in varchar2 default null,
    p_prn_page_header_font_family   in varchar2 default null,
    p_prn_page_header_font_weight   in varchar2 default null,
    p_prn_page_header_font_size     in varchar2 default null,
    p_prn_page_footer               in varchar2 default null,
    p_prn_page_footer_font_color    in varchar2 default null,
    p_prn_page_footer_font_family   in varchar2 default null,
    p_prn_page_footer_font_weight   in varchar2 default null,
    p_prn_page_footer_font_size     in varchar2 default null,
    p_prn_header_bg_color           in varchar2 default null,
    p_prn_header_font_color         in varchar2 default null,
    p_prn_header_font_family        in varchar2 default null,
    p_prn_header_font_weight        in varchar2 default null,
    p_prn_header_font_size          in varchar2 default null,
    p_prn_body_bg_color             in varchar2 default null,
    p_prn_body_font_color           in varchar2 default null,
    p_prn_body_font_family          in varchar2 default null,
    p_prn_body_font_weight          in varchar2 default null,
    p_prn_body_font_size            in varchar2 default null,
    p_prn_border_width              in number   default null,
    --
    p_shared_query_id               in number   default null,
    --
    p_plug_url_text_begin           in varchar2 default null,
    p_plug_url_text_end             in varchar2 default null,
    p_java_entry_point              in varchar2 default null,
    --
    p_plug_caching                  in varchar2 default 'NOCACHE',
    p_plug_caching_session_state    in varchar2 default null,
    p_plug_caching_max_age_in_sec   in varchar2 default null,
    p_plug_cache_when_cond_type     in varchar2 default null,
    p_plug_cache_when_condition_e1  in varchar2 default null,
    p_plug_cache_when_condition_e2  in varchar2 default null,
    p_plug_cache_depends_on_items   in varchar2 default null,
    --
    p_plug_chart_font_size          in varchar2 default null,
    p_plug_chart_max_rows           in varchar2 default null,
    p_plug_chart_num_mask           in varchar2 default null,
    p_plug_chart_scale              in varchar2 default null,
    p_plug_chart_axis               in varchar2 default null,
    p_plug_chart_show_summary       in varchar2 default null,
    --
    p_menu_template_id              in number   default null,
    p_list_template_id              in number   default null,
    --
    p_required_patch                in varchar2 default null,
    p_plug_comment                  in varchar2 default null,
    --
    p_use_custom_item_layout        in varchar2 default null,
    p_custom_item_layout            in varchar2 default null,
    --
    p_prn_page_header_alignment     in varchar2 default null,
    p_prn_page_footer_alignment     in varchar2 default null,
    p_prn_border_color              in varchar2 default null,
    p_sort_null                     in varchar2 default null,
    --
    p_fixed_header                  in varchar2 default null,
    p_fixed_header_max_height       in number   default null,
    --
    p_plugin_init_javascript_code   in varchar2 default null,
    --
    p_attribute_01                  in varchar2 default null,
    p_attribute_02                  in varchar2 default null,
    p_attribute_03                  in varchar2 default null,
    p_attribute_04                  in varchar2 default null,
    p_attribute_05                  in varchar2 default null,
    p_attribute_06                  in varchar2 default null,
    p_attribute_07                  in varchar2 default null,
    p_attribute_08                  in varchar2 default null,
    p_attribute_09                  in varchar2 default null,
    p_attribute_10                  in varchar2 default null,
    p_attribute_11                  in varchar2 default null,
    p_attribute_12                  in varchar2 default null,
    p_attribute_13                  in varchar2 default null,
    p_attribute_14                  in varchar2 default null,
    p_attribute_15                  in varchar2 default null,
    p_attribute_16                  in varchar2 default null,
    p_attribute_17                  in varchar2 default null,
    p_attribute_18                  in varchar2 default null,
    p_attribute_19                  in varchar2 default null,
    p_attribute_20                  in varchar2 default null,
    p_attribute_21                  in varchar2 default null,
    p_attribute_22                  in varchar2 default null,
    p_attribute_23                  in varchar2 default null,
    p_attribute_24                  in varchar2 default null,
    p_attribute_25                  in varchar2 default null );

procedure set_region_column_width (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default wwv_flow_imp_page.current_page_id,
    p_plug_column_width             in varchar2 default null);

procedure create_report_region (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default wwv_flow_imp_page.current_page_id,
    p_name                          in varchar2 default null,
    p_region_name                   in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_template                      in number   default null,
    p_display_sequence              in varchar2 default null,
    p_include_in_reg_disp_sel_yn    in varchar2 default c_n,
    p_region_css_classes            in varchar2 default null,
    p_icon_css_classes              in varchar2 default null,
    p_region_sub_css_classes        in varchar2 default null,
    p_region_template_options       in varchar2 default null,
    p_component_template_options    in varchar2 default null,
    p_region_attributes             in varchar2 default null,
    p_report_attributes             in varchar2 default null,
    p_new_grid                      in boolean  default false,
    p_new_grid_row                  in boolean  default true,
    p_grid_row_css_classes          in varchar2 default null,
    p_new_grid_column               in boolean  default true,
    p_grid_column_span              in number   default null,
    p_grid_column_css_classes       in varchar2 default null,
    p_display_column                in varchar2 default null,
    p_display_point                 in varchar2 default 'BODY',
    p_item_display_point            in varchar2 default 'ABOVE',
    p_source_type                   in varchar2 default null,
    p_location                      in varchar2 default 'LOCAL',
    p_web_src_module_id             in number   default null,
    p_use_local_sync_table          in boolean  default null,
    p_remote_server_id              in number   default null,
    p_query_type                    in varchar2 default null,
    p_function_body_language        in varchar2 default null,
    p_source                        in varchar2 default null,
    p_query_owner                   in varchar2 default null,
    p_query_table                   in varchar2 default null,
    p_query_where                   in varchar2 default null,
    p_query_order_by                in varchar2 default null,
    p_source_post_processing        in varchar2 default null,
    p_include_rowid_column          in boolean  default null,
    p_optimizer_hint                in varchar2 default null,
    p_remote_sql_caching            in varchar2 default null,
    p_remote_sql_invalidate_when    in varchar2 default null,
    p_external_filter_expr          in varchar2 default null,
    p_external_order_by_expr        in varchar2 default null,
    p_display_error_message         in varchar2 default null, /* obsolete */
    p_required_role                 in varchar2 default null,
    p_display_when_condition        in varchar2 default null,
    p_display_when_cond2            in varchar2 default null,
    p_display_condition_type        in varchar2 default null,
    --
    p_read_only_when_type           in varchar2 default null,
    p_read_only_when                in varchar2 default null,
    p_read_only_when2               in varchar2 default null,
    --
    p_header                        in varchar2 default null,
    p_footer                        in varchar2 default null,
    p_override_reg_pos              in varchar2 default null,
    p_customized                    in varchar2 default null,
    p_customized_name               in varchar2 default null,
    p_translate_title               in varchar2 default c_y,
    p_ajax_enabled                  in varchar2 default c_n,
    p_ajax_items_to_submit          in varchar2 default null,
    p_rest_enabled                  in varchar2 default c_n,
    p_region_image                  in varchar2 default null,
    p_region_image_attr             in varchar2 default null,
    p_fixed_header                  in varchar2 default 'PAGE',
    p_fixed_header_max_height       in number   default null,
    --
    p_lazy_loading                  in boolean  default false,
    --
    p_query_row_template            in number   default null,
    p_plug_query_max_columns        in number   default null,
    p_query_headings                in varchar2 default null,
    p_query_headings_type           in varchar2 default 'COLON_DELMITED_LIST',
    p_query_num_rows                in number   default null,
    p_query_options                 in varchar2 default null,
    p_query_show_nulls_as           in varchar2 default null,
    p_query_break_cols              in varchar2 default null,
    p_query_no_data_found           in varchar2 default null,
    p_query_more_data               in varchar2 default null,
    p_ignore_pagination             in number   default null,
    p_query_num_rows_item           in varchar2 default null,
    p_query_num_rows_type           in varchar2 default null,
    p_query_row_count_max           in number   default null,
    --
    p_pagination_display_position   in varchar2 default null,
    p_report_total_text_format      in varchar2 default null,
    p_break_column_text_format      in varchar2 default null,
    p_break_before_row              in varchar2 default null,
    p_break_generic_column          in varchar2 default null,
    p_break_after_row               in varchar2 default null,
    p_break_type_flag               in varchar2 default null,
    p_break_repeat_heading_format   in varchar2 default null,
    p_csv_output                    in varchar2 default null,
    p_csv_output_link_text          in varchar2 default null,
    p_supplemental_text             in varchar2 default null,
    p_print_url                     in varchar2 default null,
    p_print_url_label               in varchar2 default null,
    --
    p_prn_output                    in varchar2 default null,
    p_prn_print_server_overwrite    in varchar2 default null,
    p_prn_template_id               in number   default null,
    p_prn_format                    in varchar2 default null,
    p_prn_format_item               in varchar2 default null,
    p_prn_output_show_link          in varchar2 default null,
    p_prn_output_link_text          in varchar2 default null,
    p_prn_output_file_name          in varchar2 default null,
    p_prn_content_disposition       in varchar2 default null,
    p_prn_document_header           in varchar2 default null,
    p_prn_units                     in varchar2 default null,
    p_prn_paper_size                in varchar2 default null,
    p_prn_width_units               in varchar2 default null,
    p_prn_width                     in number   default null,
    p_prn_height                    in number   default null,
    p_prn_orientation               in varchar2 default null,
    p_prn_page_header               in varchar2 default null,
    p_prn_page_header_font_color    in varchar2 default null,
    p_prn_page_header_font_family   in varchar2 default null,
    p_prn_page_header_font_weight   in varchar2 default null,
    p_prn_page_header_font_size     in varchar2 default null,
    p_prn_page_footer               in varchar2 default null,
    p_prn_page_footer_font_color    in varchar2 default null,
    p_prn_page_footer_font_family   in varchar2 default null,
    p_prn_page_footer_font_weight   in varchar2 default null,
    p_prn_page_footer_font_size     in varchar2 default null,
    p_prn_header_bg_color           in varchar2 default null,
    p_prn_header_font_color         in varchar2 default null,
    p_prn_header_font_family        in varchar2 default null,
    p_prn_header_font_weight        in varchar2 default null,
    p_prn_header_font_size          in varchar2 default null,
    p_prn_body_bg_color             in varchar2 default null,
    p_prn_body_font_color           in varchar2 default null,
    p_prn_body_font_family          in varchar2 default null,
    p_prn_body_font_weight          in varchar2 default null,
    p_prn_body_font_size            in varchar2 default null,
    p_prn_border_width              in number   default null,
    --
    p_shared_query_id               in number   default null,
    --
    p_query_asc_image               in varchar2 default 'arrow_down_gray_dark.gif',
    p_query_asc_image_attr          in varchar2 default 'width="13" height="12"',
    p_query_desc_image              in varchar2 default 'arrow_up_gray_dark.gif',
    p_query_desc_image_attr         in varchar2 default 'width="13" height="12"',
    --
    p_plug_query_exp_filename       in varchar2 default null,
    p_plug_query_exp_separator      in varchar2 default null,
    p_plug_query_exp_enclosed_by    in varchar2 default null,
    p_plug_query_strip_html         in varchar2 default null,
    p_plug_query_parse_override     in varchar2 default null,
    --
    p_required_patch                in varchar2 default null,
    p_comment                       in varchar2 default null,
    --
    p_plug_column_width             in varchar2 default null,
    --
    p_prn_page_header_alignment     in varchar2 default null,
    p_prn_page_footer_alignment     in varchar2 default null,
    p_prn_border_color              in varchar2 default null,
    p_sort_null                     in varchar2 default null,
    --
    p_plug_caching                  in varchar2 default 'NOCACHE',
    p_plug_caching_session_state    in varchar2 default null,
    p_plug_caching_max_age_in_sec   in varchar2 default null,
    p_plug_cache_when_cond_type     in varchar2 default null,
    p_plug_cache_when_condition_e1  in varchar2 default null,
    p_plug_cache_when_condition_e2  in varchar2 default null,
    p_plug_cache_depends_on_items   in varchar2 default null );

procedure create_report_columns(
    p_id                             in number default null,
    p_region_id                      in number default wwv_flow_imp_page.current_region_id,
    p_flow_id                        in number default null, -- defaults to region's flow id
    p_query_column_id                in number default null,
    p_form_element_id                in number default null,
    p_column_alias                   in varchar2 default null,
    p_static_id                      in varchar2 default null,
    p_column_display_sequence        in varchar2 default null,
    p_column_heading                 in varchar2 default null,
    p_use_as_row_header              in varchar2 default null,
    p_column_format                  in varchar2 default null,
    p_column_html_expression         in varchar2 default null,
    p_column_css_class               in varchar2 default null,
    p_column_css_style               in varchar2 default null,
    p_column_hit_highlight           in varchar2 default null,
    p_column_link                    in varchar2 default null,
    p_column_linktext                in varchar2 default null,
    p_column_link_attr               in varchar2 default null,
    p_column_alignment               in varchar2 default 'LEFT',
    p_heading_alignment              in varchar2 default 'CENTER',
    p_default_sort_column_sequence   in varchar2 default '0',
    p_default_sort_dir               in varchar2 default null,
    p_disable_sort_column            in varchar2 default c_y,
    p_sum_column                     in varchar2 default c_n,
    p_hidden_column                  in varchar2 default c_n,
    p_display_when_cond_type         in varchar2 default null,
    p_display_when_condition         in varchar2 default null,
    p_display_when_condition2        in varchar2 default null,
    p_report_column_required_role    in varchar2 default null,
    p_security_group_id              in varchar2 default null,
    p_last_updated_by                in varchar2 default null,
    p_last_updated_on                in varchar2 default null,
    p_display_as                     in varchar2 default 'ESCAPE_SC',
    p_named_lov                      in varchar2 default null,
    p_inline_lov                     in varchar2 default null,
    p_lov_language                   in varchar2 default null,
    p_lov_show_nulls                 in varchar2 default null,
    p_lov_null_text                  in varchar2 default null,
    p_lov_null_value                 in varchar2 default null,
    p_report_column_width            in varchar2 default null,
    p_column_width                   in varchar2 default null,
    p_column_height                  in varchar2 default null,
    p_css_classes                    in varchar2 default null,
    p_cattributes                    in varchar2 default null,
    p_cattributes_element            in varchar2 default null,
    p_column_field_template          in number   default null,
    p_is_required                    in boolean  default false,
    p_standard_validations           in varchar2 default null,
    --
    p_attribute_01                   in varchar2 default null,
    p_attribute_02                   in varchar2 default null,
    p_attribute_03                   in varchar2 default null,
    p_attribute_04                   in varchar2 default null,
    p_attribute_05                   in varchar2 default null,
    p_attribute_06                   in varchar2 default null,
    p_attribute_07                   in varchar2 default null,
    p_attribute_08                   in varchar2 default null,
    p_attribute_09                   in varchar2 default null,
    p_attribute_10                   in varchar2 default null,
    p_attribute_11                   in varchar2 default null,
    p_attribute_12                   in varchar2 default null,
    p_attribute_13                   in varchar2 default null,
    p_attribute_14                   in varchar2 default null,
    p_attribute_15                   in varchar2 default null,
    --
    p_pk_col_source_type             in varchar2 default null,
    p_pk_col_source                  in varchar2 default null,
    p_derived_column                 in varchar2 default null,
    --
    p_column_default                 in varchar2 default null,
    p_column_default_type            in varchar2 default null,
    p_lov_display_extra              in varchar2 default null,
    --
    p_include_in_export             in varchar2 default null,
    p_print_col_width               in varchar2 default null,
    p_print_col_align               in varchar2 default null,
    --
    p_ref_schema                     in varchar2 default null,
    p_ref_table_name                 in varchar2 default null,
    p_ref_column_name                in varchar2 default null,
    --
    p_column_link_checksum_type      in varchar2 default null,
    --
    p_required_patch                 in number   default null,
    --
    p_column_comment                 in varchar2 default null );

procedure create_query_definition(
    p_id                               in number default null,
    p_region_id                        in number default wwv_flow_imp_page.current_region_id,
    p_flow_id                          in number default wwv_flow.g_flow_id,
    p_reference_id                     in number default null);

procedure create_query_object(
    p_id                               in number default null,
    p_query_id                         in number default null,
    p_object_owner                     in varchar2 default null,
    p_object_name                      in varchar2 default null,
    p_object_alias                     in varchar2 default null);

procedure create_query_column(
    p_id                               in number default null,
    p_query_id                         in number default null,
    p_query_object_id                  in number default null,
    p_column_number                    in number default null,
    p_column_alias                     in varchar2 default null,
    p_column_sql_expression            in varchar2 default null,
    p_column_group_by_sequence         in varchar2 default null);

procedure create_query_condition(
    p_id                               in number default null,
    p_query_id                         in number default null,
    p_condition                        in varchar2 default null,
    p_cond_column                      in varchar2 default null,
    p_cond_id1                         in number default null,
    p_cond_id2                         in number default null,
    p_cond_root                        in varchar2 default null,
    p_operator                         in varchar2 default null);

procedure set_plug_source (
    p_id                            in number   default null,
    p_plug_source                   in varchar2 default null);

procedure set_plug_query_heading (
    p_id                            in number   default null,
    p_plug_query_heading            in varchar2 default null);

procedure create_chart_series_attr (
    p_id                            in number default null,
    p_region_id                     in number default wwv_flow_imp_page.current_region_id,
    p_series_id                     in number default null,
    p_a001                          in varchar2 default null,
    p_a002                          in varchar2 default null,
    p_a003                          in varchar2 default null,
    p_a004                          in varchar2 default null,
    p_a005                          in varchar2 default null,
    p_a006                          in varchar2 default null,
    p_a007                          in varchar2 default null,
    p_a008                          in varchar2 default null,
    p_a009                          in varchar2 default null,
    p_a010                          in varchar2 default null,
    p_a011                          in varchar2 default null,
    p_a012                          in varchar2 default null,
    p_a013                          in varchar2 default null,
    p_a014                          in varchar2 default null,
    p_a015                          in varchar2 default null,
    p_a016                          in varchar2 default null,
    p_a017                          in varchar2 default null,
    p_a018                          in varchar2 default null,
    p_a019                          in varchar2 default null,
    p_a020                          in varchar2 default null,
    p_a021                          in varchar2 default null,
    p_a022                          in varchar2 default null,
    p_a023                          in varchar2 default null,
    p_a024                          in varchar2 default null,
    p_a025                          in varchar2 default null,
    p_a026                          in varchar2 default null,
    p_a027                          in varchar2 default null,
    p_a028                          in varchar2 default null,
    p_a029                          in varchar2 default null,
    p_a030                          in varchar2 default null,
    p_a031                          in varchar2 default null,
    p_a032                          in varchar2 default null,
    p_a033                          in varchar2 default null,
    p_a034                          in varchar2 default null,
    p_a035                          in varchar2 default null,
    p_a036                          in varchar2 default null,
    p_a037                          in varchar2 default null,
    p_a038                          in varchar2 default null,
    p_a039                          in varchar2 default null,
    p_a040                          in varchar2 default null,
    p_a041                          in varchar2 default null,
    p_a042                          in varchar2 default null,
    p_a043                          in varchar2 default null,
    p_a044                          in varchar2 default null,
    p_a045                          in varchar2 default null,
    p_a046                          in varchar2 default null,
    p_a047                          in varchar2 default null,
    p_a048                          in varchar2 default null,
    p_a049                          in varchar2 default null,
    p_a050                          in varchar2 default null );

procedure create_generic_attr (
    p_id                            in number   default null,
    p_region_id                     in number   default wwv_flow_imp_page.current_region_id,
    p_attribute_id                  in number   default null,
    p_attribute_value               in varchar2 default null );

procedure create_region_rpt_cols (
    --
    -- Updatable report columns define attributes of regions
    -- of type UPDATABLE_SQL_QUERY.
    --
    p_id                            in number,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_plug_id                       in number   default wwv_flow_imp_page.current_region_id,
    p_column_sequence               in number,
    p_query_column_name             in varchar2,
    p_display_as                    in varchar2 default null,
    p_named_lov                     in number   default null,
    p_inline_lov                    in varchar2 default null,
    p_lov_show_nulls                in varchar2 default null,
    p_lov_null_text                 in varchar2 default null,
    p_lov_null_value                in varchar2 default null,
    p_column_width                  in number   default null,
    p_column_height                 in number   default null,
    p_cattributes                   in varchar2 default null,
    p_column_comment                in varchar2 default null );

procedure create_region_column_group(
    p_id                       in number   default null,
    p_flow_id                  in number   default wwv_flow.g_flow_id,
    p_page_id                  in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                in number   default wwv_flow_imp_page.current_region_id,
    p_heading                  in varchar2,
    p_label                    in varchar2 default null );

procedure create_region_column(
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_page_id                     in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                   in number   default wwv_flow_imp_page.current_region_id,
    p_name                        in varchar2,
    p_source_type                 in varchar2 default null,
    p_source_expression           in varchar2 default null,
    p_data_type                   in varchar2 default null,
    p_is_query_only               in boolean  default null,
    p_item_type                   in varchar2 default null,
    p_is_visible                  in boolean  default null,
    p_heading                     in varchar2 default null,
    p_label                       in varchar2 default null,
    p_heading_alignment           in varchar2 default null,
    p_display_sequence            in number,
    p_value_alignment             in varchar2 default null,
    p_value_css_classes           in varchar2 default null,
    p_value_attributes            in varchar2 default null,
    p_group_id                    in number   default null,
    p_use_group_for               in varchar2 default null,
    p_stretch                     in varchar2 default null,
    --
    p_plugin_init_javascript_code in varchar2 default null,
    --
    p_attribute_01                in varchar2 default null,
    p_attribute_02                in varchar2 default null,
    p_attribute_03                in varchar2 default null,
    p_attribute_04                in varchar2 default null,
    p_attribute_05                in varchar2 default null,
    p_attribute_06                in varchar2 default null,
    p_attribute_07                in varchar2 default null,
    p_attribute_08                in varchar2 default null,
    p_attribute_09                in varchar2 default null,
    p_attribute_10                in varchar2 default null,
    p_attribute_11                in varchar2 default null,
    p_attribute_12                in varchar2 default null,
    p_attribute_13                in varchar2 default null,
    p_attribute_14                in varchar2 default null,
    p_attribute_15                in varchar2 default null,
    p_attribute_16                in varchar2 default null,
    p_attribute_17                in varchar2 default null,
    p_attribute_18                in varchar2 default null,
    p_attribute_19                in varchar2 default null,
    p_attribute_20                in varchar2 default null,
    p_attribute_21                in varchar2 default null,
    p_attribute_22                in varchar2 default null,
    p_attribute_23                in varchar2 default null,
    p_attribute_24                in varchar2 default null,
    p_attribute_25                in varchar2 default null,
    --
    p_format_mask                 in varchar2 default null,
    p_item_width                  in number   default null,
    p_item_height                 in number   default null,
    p_item_placeholder            in varchar2 default null,
    p_item_css_classes            in varchar2 default null,
    p_item_icon_css_classes       in varchar2 default null,
    p_item_attributes             in varchar2 default null,
    p_is_required                 in boolean  default null,
    p_max_length                  in number   default null,
    p_lov_type                    in varchar2 default null,
    p_lov_language                in varchar2 default null,
    p_lov_id                      in number   default null,
    p_lov_source                  in varchar2 default null,
    p_lov_display_extra           in boolean  default null,
    p_lov_display_null            in boolean  default null,
    p_lov_null_text               in varchar2 default null,
    p_lov_null_value              in varchar2 default null,
    p_lov_cascade_parent_items    in varchar2 default null,
    p_ajax_items_to_submit        in varchar2 default null,
    p_ajax_optimize_refresh       in boolean  default null,
    p_link_target                 in varchar2 default null,
    p_link_text                   in varchar2 default null,
    p_link_attributes             in varchar2 default null,
    p_enable_filter               in boolean  default null,
    p_filter_operators            in varchar2 default null,
    p_filter_is_required          in boolean  default null,
    p_filter_text_case            in varchar2 default null,
    p_filter_exact_match          in boolean  default null,
    p_filter_date_ranges          in varchar2 default null,
    p_filter_lov_type             in varchar2 default null,
    p_filter_lov_language         in varchar2 default null,
    p_filter_lov_id               in number   default null,
    p_filter_lov_query            in varchar2 default null,
    p_static_id                   in varchar2 default null,
    p_use_as_row_header           in boolean  default null,
    p_javascript_code             in varchar2 default null,
    p_enable_sort_group           in boolean  default null,
    p_enable_control_break        in boolean  default null,
    p_enable_hide                 in boolean  default null,
    p_enable_pivot                in boolean  default null,
    p_is_primary_key              in boolean  default null,
    p_parent_column_id            in number   default null,
    p_default_type                in varchar2 default null,
    p_default_language            in varchar2 default null,
    p_default_expression          in varchar2 default null,
    p_duplicate_value             in boolean  default null,
    p_include_in_export           in boolean  default null,
    p_display_condition_type      in varchar2 default null,
    p_display_condition           in varchar2 default null,
    p_display_condition2          in varchar2 default null,
    p_readonly_condition_type     in varchar2 default null,
    p_readonly_condition          in varchar2 default null,
    p_readonly_condition2         in varchar2 default null,
    p_readonly_for_each_row       in boolean  default null,
    p_escape_on_http_output       in boolean  default null,
    p_security_scheme             in varchar2 default null,
    p_restricted_characters       in varchar2 default null,
    p_help_text                   in varchar2 default null,
    p_required_patch              in number   default null,
    p_column_comment              in varchar2 default null );

procedure create_calendar (
    --
    -- create calendar and easy_calendar
    --
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default wwv_flow_imp_page.current_page_id,
    p_plug_name                     in varchar2 default null,
    p_region_name                   in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_plug_display_point            in varchar2 default 'BODY',
    p_plug_template                 in number   default null,
    p_plug_display_sequence         in varchar2 default null,
    p_include_in_reg_disp_sel_yn    in varchar2 default c_n,
    p_region_css_classes            in varchar2 default null,
    p_region_attributes             in varchar2 default null,
    p_report_attributes             in varchar2 default null,
    p_plug_new_grid                 in boolean  default false,
    p_plug_new_grid_row             in boolean  default true,
    p_plug_grid_row_css_classes     in varchar2 default null,
    p_plug_new_grid_column          in boolean  default true,
    p_plug_grid_column_span         in number   default null,
    p_plug_grid_column_css_classes  in varchar2 default null,
    p_plug_display_column           in varchar2 default null,
    p_plug_item_display_point       in varchar2 default 'ABOVE',
    p_plug_source_type              in varchar2 default null,
    p_location                      in varchar2 default 'LOCAL',
    p_web_src_module_id             in number   default null,
    p_use_local_sync_table          in boolean  default null,
    p_remote_server_id              in number   default null,
    p_query_type                    in varchar2 default null,
    p_function_body_language        in varchar2 default null,
    p_plug_source                   in varchar2 default null,
    p_query_owner                   in varchar2 default null,
    p_query_table                   in varchar2 default null,
    p_query_where                   in varchar2 default null,
    p_query_order_by                in varchar2 default null,
    p_source_post_processing        in varchar2 default null,
    p_include_rowid_column          in boolean  default null,
    p_optimizer_hint                in varchar2 default null,
    p_remote_sql_caching            in varchar2 default null,
    p_remote_sql_invalidate_when    in varchar2 default null,
    p_external_filter_expr          in varchar2 default null,
    p_external_order_by_expr        in varchar2 default null,
    p_plug_display_error_message    in varchar2 default null, /* obsolete */
    p_plug_required_role            in varchar2 default null,
    p_plug_display_when_condition   in varchar2 default null,
    p_plug_display_when_cond2       in varchar2 default null,
    p_plug_display_condition_type   in varchar2 default null,
    --
    p_plug_read_only_when_type      in varchar2 default null,
    p_plug_read_only_when           in varchar2 default null,
    p_plug_read_only_when2          in varchar2 default null,
    --
    p_plug_header                   in varchar2 default null,
    p_plug_footer                   in varchar2 default null,
    p_plug_override_reg_pos         in varchar2 default null,
    p_plug_customized               in varchar2 default null,
    p_plug_customized_name          in varchar2 default null,
    p_translate_title               in varchar2 default c_y,
    p_rest_enabled                  in varchar2 default c_n,
    --
    p_region_image                  in varchar2 default null,
    p_region_image_attr             in varchar2 default null,
    --
    p_plug_caching                  in varchar2 default 'NOCACHE',
    p_plug_caching_session_state    in varchar2 default null,
    p_plug_caching_max_age_in_sec   in varchar2 default null,
    p_plug_cache_when_cond_type     in varchar2 default null,
    p_plug_cache_when_condition_e1  in varchar2 default null,
    p_plug_cache_when_condition_e2  in varchar2 default null,
    p_plug_cache_depends_on_items   in varchar2 default null,
    p_escape_on_http_output         in varchar2 default c_n,
    --
    p_required_patch                in varchar2 default null,
    p_plug_comment                  in varchar2 default null,
    --
    p_cal_id                        in number          default null,
    p_start_date                    in varchar2        default null,
    p_end_date                      in varchar2        default null,
    p_begin_at_start_of_interval    in varchar2        default c_y,
    p_date_item                     in varchar2        default null,
    p_end_date_item                 in varchar2        default null,
    p_display_as                    in varchar2        default null,
    p_display_item                  in varchar2        default null,
    p_display_type                  in varchar2        default null,
    p_item_format                   in varchar2        default null,
    p_easy_sql_owner                in varchar2        default null,
    p_easy_sql_table                in varchar2        default null,
    p_date_column                   in varchar2        default null,
    p_end_date_column               in varchar2        default null,
    p_display_column                in varchar2        default null,
    p_template_id                   in number          default null,
    p_start_of_week                 in number          default null,
    p_day_link                      in varchar2        default null,
    p_item_link                     in varchar2        default null,
    p_start_time                    in varchar2        default null,
    p_end_time                      in varchar2        default null,
    p_time_format                   in varchar2        default null,
    p_week_start_day                in varchar2        default null,
    p_week_end_day                  in varchar2        default null,
    p_date_type_column              in varchar2        default null,
    p_calendar_type                 in varchar2        default null,
    p_include_custom_cal            in varchar2        default null,
    p_custom_cal_days               in number          default 3,
    p_primary_key_column            in varchar2        default null,
    p_drag_drop_required_role       in varchar2        default null,
    p_drag_drop_process_id          in number          default null,
    p_item_link_primary_key_item    in varchar2        default null,
    p_item_link_date_item           in varchar2        default null,
    p_item_link_open_in             in varchar2        default 'W',
    p_include_time_with_date        in varchar2        default c_n,
    p_data_background_color         in varchar2        default null,
    p_data_text_color               in varchar2        default null,
    p_agenda_cal_days_type          in varchar2        default 'MONTH',
    p_agenda_cal_days               in number          default 30,
    p_calendar_comments             in varchar2        default null,
    --
    p_plug_column_width             in varchar2        default null );

--
-- B U G
--

procedure create_bug (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default null,
    p_bug_description           in varchar2 default null,
    p_bug_priority              in varchar2 default null,
    p_bug_status_code           in varchar2 default null,
    p_bug_reported_by           in varchar2 default null,
    p_bug_reported_on           in date     default null,
    p_bug_assigned_to           in varchar2 default null,
    p_bug_assigned_on           in date     default null,
    p_bug_fix_in_version        in varchar2 default null,
    p_bug_projected_close_date  in date     default null,
    p_bug_close_date            in date     default null,
    p_bug_affected_files_or_mod in varchar2 default null,
    p_bug_text                  in varchar2 default null,
    p_bug_how_to_reproduce      in varchar2 default null,
    p_bug_workaround            in varchar2 default null,
    p_bug_additional_text       in varchar2 default null,
    p_bug_work_log              in varchar2 default null,
    p_bug_last_updated_by       in varchar2 default null,
    p_bug_last_updated_on       in date     default null );


--
-- L I S T S
--



procedure create_list (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_list_type                 in varchar2 default 'STATIC',
    p_list_language             in varchar2 default null,
    p_list_query                in varchar2 default null,
    p_list_status               in varchar2 default null,
    p_list_displayed            in varchar2 default 'BY_DEFAULT',
    p_display_row_template_id   in number   default null, /* obsolete */
    p_required_patch            in number   default null );

procedure create_list_item (
    p_id                           in number   default null,
    p_list_id                      in number   default wwv_flow_imp_shared.current_list_id,
    p_list_item_type               in varchar2 default 'LINK',
    p_list_item_status             in varchar2 default 'PUBLIC',
    p_item_displayed               in varchar2 default 'BY_DEFAULT',
    p_list_item_display_sequence   in number   default null,
    p_list_item_link_text          in varchar2 default null,
    p_list_item_link_target        in varchar2 default null,
    p_list_item_icon               in varchar2 default null,
    p_list_item_icon_attributes    in varchar2 default null,
    p_list_item_icon_alt_attribute in varchar2 default null,
    p_list_item_disp_cond_type     in varchar2 default null,
    p_list_item_disp_condition     in varchar2 default null,
    p_list_item_disp_cond_type2    in varchar2 default null,
    p_list_item_disp_condition2    in varchar2 default null,
    --
    p_list_item_icon_exp           in varchar2 default null,
    p_list_item_icon_exp_attr      in varchar2 default null,
    p_list_item_parent_id          in number default null,
    p_parent_list_item_id          in number default null,
    p_sub_item_count               in number default null,
    --
    p_list_countclicks_y_n         in varchar2 default c_n,
    p_list_countclicks_cat         in varchar2 default null,
    p_list_text_01                 in varchar2 default null,
    p_list_text_02                 in varchar2 default null,
    p_list_text_03                 in varchar2 default null,
    p_list_text_04                 in varchar2 default null,
    p_list_text_05                 in varchar2 default null,
    p_list_text_06                 in varchar2 default null,
    p_list_text_07                 in varchar2 default null,
    p_list_text_08                 in varchar2 default null,
    p_list_text_09                 in varchar2 default null,
    p_list_text_10                 in varchar2 default null,
    p_translate_list_text_y_n      in varchar2 default null,
    p_list_item_owner              in varchar2 default null,
    p_list_item_current_for_pages  in varchar2 default null,
    p_list_item_current_type       in varchar2 default null,
    p_list_item_current_language   in varchar2 default null,
    p_security_scheme              in varchar2 default null,
    p_required_patch               in number   default null );

procedure set_list_item_sequence (
    p_id                         in number   default null,
    p_item_sequence              in number   default null);

procedure set_list_item_link_text (
    p_id                         in number   default null,
    p_link_text                  in varchar2 default null);
procedure set_list_item_link_target (
    p_id                         in number   default null,
    p_link_target                in varchar2 default null);

--------------------------
-- C O M M E N T S
--
procedure create_app_comments (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_pages                      in varchar2 default null,
    p_app_comment                in varchar2 default null,
    p_comment_owner              in varchar2 default null,
    p_comment_flag               in varchar2 default null,
    p_app_version                in varchar2 default null,
    --
    p_created_by                 in varchar2 default null,
    p_created_on                 in varchar2 default null,
    p_updated_by                 in varchar2 default null,
    p_updated_on                 in varchar2 default null );

--------------------------
-- T R A N S L A T I O N S
--

procedure create_dynamic_translation (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_language                   in varchar2 default null,
    p_from                       in varchar2 default null,
    p_to                         in varchar2 default null );

procedure create_message (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_name                       in varchar2 default null,
    p_message_language           in varchar2 default 'en',
    p_message_text               in varchar2 default null,
    p_is_js_message              in boolean  default false );

procedure create_language_map (
    p_id                            in number   default null,
    p_primary_language_flow_id      in number   default wwv_flow.g_flow_id,
    p_translation_flow_id           in number   default null,
    p_translation_flow_language_cd  in varchar2 default null,
    p_translation_image_directory   in varchar2 default null,
    p_translation_comments          in varchar2 default null,
    p_direction_right_to_left       in varchar2 default c_n );

procedure create_translation (
    p_id                            in number default null,
    p_translated_flow_id            in number default null,
    p_flow_id                       in number default wwv_flow.g_flow_id,
    p_page_id                       in number default wwv_flow_imp_page.current_page_id,
    p_translate_column_id           in number default null,
    p_translate_to_id               in number default null,
    p_translate_from_id             in number default null,
    p_translate_to_lang_code        in varchar2 default null,
    p_translation_specific_to_item  in varchar2 default 'NO',
    p_translate_to_text             in varchar2 default null,
    p_translate_from_text           in varchar2 default null,
    p_template_translatable         in varchar2 default null );

procedure remove_translation (
    p_translated_flow_id            in number default null);

procedure remove_dyanamic_translation (
    p_flow_id            in number default wwv_flow.g_flow_id,
    p_language           in varchar2 default null);


procedure create_image (
    p_id                in number default null,
    p_flow_id           in number default wwv_flow.g_flow_id,
    p_image_name        in varchar2 default null,
    p_national_language in varchar2 default null,
    p_height            in number   default null,
    p_width             in number   default null,
    p_notes             in varchar2 default null );

procedure create_shortcut (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_shortcut_name              in varchar2 default null,
    p_shortcut_consideration_seq in number   default null,
    p_shortcut_type              in varchar2 default null,
    p_shortcut_language          in varchar2 default null,
    p_shortcut_condition_type1   in varchar2 default null,
    p_shortcut_condition1        in varchar2 default null,
    p_shortcut_condition_type2   in varchar2 default null,
    p_shortcut_condition2        in varchar2 default null,
    p_build_option               in number   default null,
    p_error_text                 in varchar2 default null,
    p_reference_id               in number default null,
    p_comments                   in varchar2 default null,
    p_shortcut                   in varchar2 default null );

procedure create_tree  (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_type                      in varchar2 default 'DYNAMIC',
    p_item                      in varchar2 default null,
    p_query                     in varchar2 default null,
    p_levels                    in number   default null,
    p_unexpanded_parent         in varchar2 default null,
    p_unexpanded_parent_last    in varchar2 default null,
    p_expanded_parent           in varchar2 default null,
    p_expanded_parent_last      in varchar2 default null,
    p_leaf_node                 in varchar2 default null,
    p_leaf_node_last            in varchar2 default null,
    p_name_link_anchor_tag      in varchar2 default null,
    p_name_link_not_anchor_tag  in varchar2 default null,
    p_indent_vertical_line      in varchar2 default null,
    p_indent_vertical_line_last in varchar2 default null,
    p_drill_up                  in varchar2 default null,
    p_before_tree               in varchar2 default null,
    p_after_tree                in varchar2 default null,
    p_level_1_template          in varchar2 default null,
    p_level_2_template          in varchar2 default null );

procedure create_jstree  (
    p_id                        in number default null,
    p_flow_id                   in number default wwv_flow.g_flow_id,
    p_page_id                   in number default wwv_flow_imp_page.current_page_id,
    p_region_id                 in number default wwv_flow_imp_page.current_region_id,
    p_tree_template             in varchar2 default null,
    p_tree_source               in varchar2 default null,
    p_tree_query                in varchar2 default null,
    p_tree_node_title           in varchar2 default null,
    p_tree_node_value           in varchar2 default null,
    p_tree_node_icon            in varchar2 default null,
    p_tree_node_link            in varchar2 default null,
    p_tree_node_hints           in varchar2 default null,
    p_tree_start_item           in varchar2 default null,
    p_tree_start_value          in varchar2 default null,
    p_tree_button_option        in varchar2 default null,
    p_show_node_link            in varchar2 default null,
    p_node_link_checksum_type   in varchar2 default null,
    p_tree_comment              in varchar2 default null,
    p_show_hints                in varchar2 default null,
    p_tree_has_focus            in varchar2 default null,
    p_tree_hint_text            in varchar2 default null,
    p_tree_click_action         in varchar2 default null,
    p_selected_node             in varchar2 default null);

--
-- P L U G I N S
--
procedure remove_plugin (
    p_flow_id     in number,
    p_plugin_type in varchar2,
    p_name        in varchar2 );

procedure create_plugin (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_plugin_type                  in varchar2,
    p_name                         in varchar2,
    p_display_name                 in varchar2,
    p_category                     in varchar2 default null,
    p_supported_ui_types           in varchar2 default null,
    p_supported_component_types    in varchar2 default null,
    p_supported_data_types         in varchar2 default null,
    p_image_prefix                 in varchar2 default null,
    p_javascript_file_urls         in varchar2 default null,
    p_css_file_urls                in varchar2 default null,
    p_plsql_code                   in varchar2 default null,
    p_api_version                  in number   default null,
    p_render_function              in varchar2 default null,
    p_meta_data_function           in varchar2 default null,
    p_emit_value_function          in varchar2 default null,
    p_ajax_function                in varchar2 default null,
    p_validation_function          in varchar2 default null,
    p_execution_function           in varchar2 default null,
    p_session_sentry_function      in varchar2 default null,
    p_invalid_session_function     in varchar2 default null,
    p_authentication_function      in varchar2 default null,
    p_post_logout_function         in varchar2 default null,
    p_wsm_capabilities_function    in varchar2 default null,
    p_wsm_fetch_function           in varchar2 default null,
    p_wsm_dml_function             in varchar2 default null,
    p_wsm_execute_function         in varchar2 default null,
    p_wsm_discover_function        in varchar2 default null,
    p_builder_validation_function  in varchar2 default null,
    p_migration_function           in varchar2 default null,
    p_standard_attributes          in varchar2 default null,
    p_sql_min_column_count         in number   default null,
    p_sql_max_column_count         in number   default null,
    p_sql_examples                 in varchar2 default null,
    p_substitute_attributes        in boolean  default true,
    p_attribute_01                 in varchar2 default null, /* obsolete */
    p_attribute_02                 in varchar2 default null, /* obsolete */
    p_attribute_03                 in varchar2 default null, /* obsolete */
    p_attribute_04                 in varchar2 default null, /* obsolete */
    p_attribute_05                 in varchar2 default null, /* obsolete */
    p_attribute_06                 in varchar2 default null, /* obsolete */
    p_attribute_07                 in varchar2 default null, /* obsolete */
    p_attribute_08                 in varchar2 default null, /* obsolete */
    p_attribute_09                 in varchar2 default null, /* obsolete */
    p_attribute_10                 in varchar2 default null, /* obsolete */
    p_attribute_11                 in varchar2 default null, /* obsolete */
    p_attribute_12                 in varchar2 default null, /* obsolete */
    p_attribute_13                 in varchar2 default null, /* obsolete */
    p_attribute_14                 in varchar2 default null, /* obsolete */
    p_attribute_15                 in varchar2 default null, /* obsolete */
    p_reference_id                 in number   default null,
    p_subscribe_plugin_settings    in boolean  default true,
    p_is_quick_pick                in boolean  default false,
    p_is_deprecated                in boolean  default false,
    p_is_legacy                    in boolean  default false,
    p_help_text                    in varchar2 default null,
    p_version_identifier           in varchar2 default null,
    p_about_url                    in varchar2 default null,
    p_plugin_comment               in varchar2 default null,
    p_files_version                in number   default 1 );

procedure create_plugin_std_attribute (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_plugin_id                    in number,
    p_name                         in varchar2,
    p_is_required                  in boolean  default true,
    p_default_value                in varchar2 default null,
    p_sql_min_column_count         in number   default null,
    p_sql_max_column_count         in number   default null,
    p_supported_ui_types           in varchar2 default null,
    p_supported_component_types    in varchar2 default null,
    p_depending_on_attribute_id    in number   default null,
    p_depending_on_has_to_exist    in boolean  default null,
    p_depending_on_condition_type  in varchar2 default null,
    p_depending_on_expression      in varchar2 default null,
    p_examples                     in varchar2 default null,
    p_help_text                    in varchar2 default null,
    p_attribute_comment            in varchar2 default null );

procedure create_plugin_attribute (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_plugin_id                    in number,
    p_attribute_scope              in varchar2,
    p_attribute_sequence           in number,
    p_display_sequence             in number   default null,
    p_prompt                       in varchar2,
    p_attribute_type               in varchar2,
    p_is_required                  in boolean,
    p_is_common                    in boolean  default true,
    p_show_in_wizard               in boolean  default true,
    p_default_value                in varchar2 default null,
    p_display_length               in number   default null,
    p_max_length                   in number   default null,
    p_min_value                    in number   default null,
    p_max_value                    in number   default null,
    p_unit                         in varchar2 default null,
    p_sql_min_column_count         in number   default null,
    p_sql_max_column_count         in number   default null,
    p_column_data_types            in varchar2 default null,
    p_supported_ui_types           in varchar2 default null,
    p_supported_component_types    in varchar2 default null,
    p_is_translatable              in boolean,
    p_parent_attribute_id          in number   default null,
    p_depending_on_attribute_id    in number   default null,
    p_depending_on_comp_prop_id    in number   default null,
    p_depending_on_has_to_exist    in boolean  default null,
    p_depending_on_condition_type  in varchar2 default null,
    p_depending_on_expression      in varchar2 default null,
    p_lov_type                     in varchar2 default null,
    p_lov_component_type_id        in number   default null,
    p_lov_component_type_scope     in varchar2 default null,
    p_lov_component_type_on_delete in varchar2 default null,
    p_reference_scope              in varchar2 default 'COMPONENT',
    p_text_case                    in varchar2 default null,
    p_null_text                    in varchar2 default null,
    p_deprecated_values            in varchar2 default null,
    p_examples                     in varchar2 default null,
    p_help_text                    in varchar2 default null,
    p_attribute_comment            in varchar2 default null );

procedure create_plugin_attr_value (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_plugin_attribute_id    in number,
    p_display_sequence       in number,
    p_display_value          in varchar2,
    p_return_value           in varchar2,
    p_is_quick_pick          in boolean  default false,
    p_is_deprecated          in boolean  default false,
    p_help_text              in varchar2 default null );

procedure create_plugin_file (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_plugin_id    in number,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in blob );

/* obsolete */
procedure create_plugin_file (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_plugin_id    in number,
    p_file_name    in varchar2,
    p_mime_type    in varchar2,
    p_file_charset in varchar2 default null,
    p_file_content in sys.dbms_sql.varchar2_table );

procedure create_plugin_event (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_plugin_id    in number,
    p_name         in varchar2,
    p_display_name in varchar2 );

procedure create_plugin_setting (
    p_id           in number   default null,
    p_flow_id      in number   default wwv_flow.g_flow_id,
    p_plugin_type  in varchar2,
    p_plugin       in varchar2,
    p_attribute_01 in varchar2 default null,
    p_attribute_02 in varchar2 default null,
    p_attribute_03 in varchar2 default null,
    p_attribute_04 in varchar2 default null,
    p_attribute_05 in varchar2 default null,
    p_attribute_06 in varchar2 default null,
    p_attribute_07 in varchar2 default null,
    p_attribute_08 in varchar2 default null,
    p_attribute_09 in varchar2 default null,
    p_attribute_10 in varchar2 default null,
    p_attribute_11 in varchar2 default null,
    p_attribute_12 in varchar2 default null,
    p_attribute_13 in varchar2 default null,
    p_attribute_14 in varchar2 default null,
    p_attribute_15 in varchar2 default null );

procedure create_credential (
    p_id                  in number   default null,
    p_name                in varchar2,
    p_static_id           in varchar2,
    p_authentication_type in varchar2,
    p_scope               in varchar2 default null,
    p_client_id           in varchar2 default null,
    p_client_secret       in varchar2 default null,
    p_namespace           in varchar2 default null,
    p_fingerprint         in varchar2 default null,
    p_valid_for_urls      in varchar2 default null,
    p_prompt_on_install   in boolean,
    p_credential_comment  in varchar2 default null );

procedure create_remote_server (
    p_id                    in number   default null,
    p_name                  in varchar2,
    p_static_id             in varchar2,
    p_base_url              in varchar2,
    p_https_host            in varchar2 default null,
    p_server_type           in varchar2,
    p_ords_timezone         in varchar2 default null,
    p_ords_init_code        in varchar2 default null,
    p_ords_cleanup_code     in varchar2 default null,
    p_print_server_type     in varchar2 default null,
    p_server_timeout        in number   default null,
    p_credential_id         in number   default null,
    p_prompt_on_install     in boolean,
    p_server_comment        in varchar2 default null );

procedure create_data_profile (
    p_id                      in number   default null,
    p_flow_id                 in number   default wwv_flow.g_flow_id,
    p_name                    in varchar2,
    p_format                  in varchar2,
    p_encoding                in varchar2 default null,
    p_csv_separator           in varchar2 default null,
    p_csv_enclosed            in varchar2 default null,
    p_default_xlsx_sheet_name in varchar2 default null,
    p_skip_rows               in number   default null,
    p_has_header_row          in boolean  default null,
    p_decimal_characters      in varchar2 default null,
    p_row_selector            in varchar2 default null,
    p_single_row_selector     in varchar2 default null,
    p_is_single_row           in boolean  default false,
    p_xml_namespaces          in varchar2 default null,
    p_profile_comment         in varchar2 default null );

procedure create_data_profile_col (
    p_id                    in number   default null,
    p_flow_id               in number   default wwv_flow.g_flow_id,
    p_data_profile_id       in number,
    p_name                  in varchar2,
    p_sequence              in number,
    p_is_primary_key        in boolean  default false,
    p_column_type           in varchar2 default null,
    p_data_type             in varchar2,
    p_max_length            in number   default null,
    p_decimal_char          in varchar2 default null,
    p_group_char            in varchar2 default null,
    p_format_mask           in varchar2 default null,
    p_has_time_zone         in boolean  default null,
    p_is_hidden             in boolean  default false,
    p_is_filterable         in boolean  default true,
    p_selector_type         in varchar2 default null,
    p_selector              in varchar2 default null,
    p_remote_attribute_name in varchar2 default null,
    p_remote_data_type      in varchar2 default null,
    p_transform_type        in varchar2 default null,
    p_sql_expression        in varchar2 default null, -- obsolete
    p_expression1           in varchar2 default null,
    p_expression2           in varchar2 default null,
    p_lookup_owner          in varchar2 default null,
    p_lookup_table          in varchar2 default null,
    p_lookup_column1        in varchar2 default null,
    p_lookup_value1         in varchar2 default null,
    p_lookup_column2        in varchar2 default null,
    p_lookup_value2         in varchar2 default null,
    p_lookup_column3        in varchar2 default null,
    p_lookup_value3         in varchar2 default null,
    p_lookup_key_column     in varchar2 default null,
    p_lookup_where_clause   in varchar2 default null,
    p_column_comment        in varchar2 default null );

procedure create_web_source_module (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_name                       in varchar2,
    p_static_id                  in varchar2,
    p_web_source_type            in varchar2,
    p_data_profile_id            in number,
    p_remote_server_id           in number,
    p_url_path_prefix            in varchar2,
    p_auth_remote_server_id      in number   default null,
    p_auth_url_path_prefix       in varchar2 default null,
    p_credential_id              in number   default null,
    p_sync_is_active             in boolean  default false,
    p_sync_table_owner           in varchar2 default null,
    p_sync_table_name            in varchar2 default null,
    p_sync_type                  in varchar2 default null,
    p_sync_interval              in varchar2 default null,
    p_sync_commit_interval       in number   default null,
    p_sync_max_http_requests     in number   default null,
    p_timeout                    in number   default null,
    p_pass_ecid                  in boolean  default null,
    p_max_requests_timeframe_sec in number   default null,
    p_max_requests               in number   default null,
    p_max_requests_exceed_action in varchar2 default null,
    p_reference_id               in number   default null,
    p_catalog_internal_name      in varchar2 default null,
    p_catalog_service_name       in varchar2 default null,
    p_catalog_service_version    in number   default null,
    p_attribute_01               in varchar2 default null,
    p_attribute_02               in varchar2 default null,
    p_attribute_03               in varchar2 default null,
    p_attribute_04               in varchar2 default null,
    p_attribute_05               in varchar2 default null,
    p_attribute_06               in varchar2 default null,
    p_attribute_07               in varchar2 default null,
    p_attribute_08               in varchar2 default null,
    p_attribute_09               in varchar2 default null,
    p_attribute_10               in varchar2 default null,
    p_attribute_11               in varchar2 default null,
    p_attribute_12               in varchar2 default null,
    p_attribute_13               in varchar2 default null,
    p_attribute_14               in varchar2 default null,
    p_attribute_15               in varchar2 default null,
    p_module_comment             in varchar2 default null );

procedure create_web_source_operation (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_web_src_module_id            in number,
    p_data_profile_id              in number   default null,
    p_operation                    in varchar2,
    p_database_operation           in varchar2 default null,
    p_url_pattern                  in varchar2,
    p_request_body_template        in varchar2 default null,
    p_legacy_ords_fixed_page_size  in number   default null,
    p_force_error_for_http_404     in boolean  default null,
    p_allow_fetch_all_rows         in boolean  default null,
    p_fetch_all_rows_timeout       in number   default null,
    p_caching                      in varchar2 default null,
    p_invalidate_when              in varchar2 default null,
    p_security_scheme              in varchar2 default null,
    p_operation_comment            in varchar2 default null );

procedure create_web_source_sync_step (
    p_id                           in number   default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_web_src_module_id            in number,
    p_static_id                    in varchar2,
    p_external_filter_expr         in varchar2 default null,
    p_is_active                    in boolean  default true,
    p_execution_sequence           in number,
    p_sync_step_comment            in varchar2 default null );

procedure create_web_source_param (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_web_src_module_id      in number,
    p_web_src_operation_id   in number   default null,
    p_name                   in varchar2,
    p_param_type             in varchar2,
    p_is_required            in boolean  default true,
    p_direction              in varchar2 default 'IN',
    p_value                  in varchar2 default null,
    p_is_static              in boolean  default false,
    p_is_array               in boolean  default false,
    p_array_separator_char   in varchar2 default null,
    p_omit_when_null         in boolean  default false,
    p_is_query_param         in boolean  default false,
    p_param_comment          in varchar2 default null );

procedure create_web_source_comp_param (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_page_id                in number   default null,
    p_web_src_param_id       in number,
    p_page_plug_id           in number   default null,
    p_page_process_id        in number   default null,
    p_app_process_id         in number   default null,
    p_jet_chart_series_id    in number   default null,
    p_shared_lov_id          in number   default null,
    p_module_sync_step_id    in number   default null,
    p_automation_id          in number   default null,
    p_automation_action_id   in number   default null,
    p_map_region_layer_id    in number   default null,
    p_value_type             in varchar2,
    p_value_language         in varchar2 default null,
    p_value                  in varchar2 default null);

--
-- RESTful Services Procedures
--
procedure remove_restful_service (
    p_id                in number default null,
    p_name              in varchar2);


procedure create_user_groups (
    p_id                in number,
    p_group_name        in varchar2,
    p_group_desc        in varchar2  default null,
    p_security_group_id in number    default null);

procedure create_restful_module (
    p_id                           in number   default null,
    p_name                         in varchar2,
    p_uri_prefix                   in varchar2 default null,
    p_parsing_schema               in varchar2 default null,
    p_origins_allowed              in varchar2 default null,
    p_items_per_page               in varchar2 default null,
    p_privilege_id                 in number default null,
    p_privilege_name               in varchar2 default null,
    p_status                       in varchar2 default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number default null,
    p_row_version_number           in number default null);


procedure create_restful_template (
    p_id                           in number   default null,
    p_module_id                    in number,
    p_uri_template                 in varchar2,
    p_priority                     in number default null,
    p_etag_type                    in varchar2 default null,
    p_etag_query                   in varchar2 default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number default null,
    p_row_version_number           in number default null);


procedure create_restful_handler (
    p_id                           in number   default null,
    p_template_id                  in number,
    p_source_type                  in varchar2,
    p_format                       in varchar2 default null,
    p_method                       in varchar2 default null,
    p_mimes_allowed                in varchar2 default null,
    p_items_per_page               in number default null,
    p_require_https                in varchar2 default null,
    p_privilege_id                 in number default null,
    p_source                       in clob default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number default null,
    p_row_version_number           in number default null);


procedure create_restful_param (
    p_id                           in number   default null,
    p_handler_id                   in number,
    p_name                         in varchar2,
    p_bind_variable_name           in varchar2 default null,
    p_source_type                  in varchar2 default null,
    p_access_method                in varchar2 default null,
    p_param_type                   in varchar2 default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number default null,
    p_row_version_number           in number default null);


procedure create_restful_priv (
    p_id                           in number,
    p_name                         in varchar2,
    p_label                        in varchar2,
    p_description                  in varchar2 default null,
    p_comments                     in varchar2 default null,
    p_security_group_id            in number   default null,
    p_row_version_number           in number   default null);


procedure create_rs_priv_grp (
    p_id                           in number   default null,
    p_privilege_id                 in number   default null,
    p_privilege_name               in varchar2 default null,
    p_user_group_id                in number   default null,
    p_group_name                   in varchar2 default null,
    p_security_group_id            in number   default null,
    p_row_version_number           in number   default null);


procedure create_popup_lov_template (
    p_id                             in number   default null,
    p_security_group_id              in number   default null,
    p_flow_id                        in number   default wwv_flow.g_flow_id,
    p_popup_icon                     in varchar2 default null,
    p_popup_icon_attr                in varchar2 default null,
    p_popup_icon2                    in varchar2 default null,
    p_popup_icon_attr2               in varchar2 default null,
    p_page_name                      in varchar2 default null,
    p_page_title                     in varchar2 default null,
    p_page_html_head                 in varchar2 default null,
    p_page_body_attr                 in varchar2 default null,
    p_before_field_text              in varchar2 default null,
    p_page_heading_text              in varchar2 default null,
    p_page_footer_text               in varchar2 default null,
    p_filter_width                   in varchar2 default null,
    p_filter_max_width               in varchar2 default null,
    p_filter_text_attr               in varchar2 default null,
    p_find_button_text               in varchar2 default null,
    p_find_button_image              in varchar2 default null,
    p_find_button_attr               in varchar2 default null,
    p_close_button_text              in varchar2 default null,
    p_close_button_image             in varchar2 default null,
    p_close_button_attr              in varchar2 default null,
    p_next_button_text               in varchar2 default null,
    p_next_button_image              in varchar2 default null,
    p_next_button_attr               in varchar2 default null,
    p_prev_button_text               in varchar2 default null,
    p_prev_button_image              in varchar2 default null,
    p_prev_button_attr               in varchar2 default null,
    p_after_field_text               in varchar2 default null,
    p_scrollbars                     in varchar2 default null,
    p_resizable                      in varchar2 default null,
    p_width                          in varchar2 default null,
    p_height                         in varchar2 default null,
    p_result_row_x_of_y              in varchar2 default null,
    p_result_rows_per_pg             in varchar2 default null,
    p_before_result_set              in varchar2 default null,
    p_after_result_set               in varchar2 default null,
    p_when_no_data_found_message     in varchar2 default null,
    p_before_first_fetch_message     in varchar2 default null,
    p_minimum_characters_required    in number   default null,
    p_reference_id                   in number   default null,
    p_translate_this_template        in varchar2 default c_n,
    --
    p_theme_id                       in number   default null,
    p_theme_class_id                 in number   default null );

procedure create_menu (
    p_id                       in number   default null,
    p_flow_id                  in number   default wwv_flow.g_flow_id,
    p_name                     in varchar2 default null,
    p_security_group_id        in number   default null );

procedure create_menu_option (
    p_id                       in number   default null,
    p_parent_id                in number   default null,
    p_menu_id                  in number   default wwv_flow_imp_shared.current_menu_id,
    p_option_sequence          in number   default 10,
    p_short_name               in varchar2 default null,
    p_long_name                in varchar2 default null,
    p_link                     in varchar2 default null,
    p_page_id                  in number   default null,
    p_also_current_for_pages   in varchar2 default null,
    p_display_when_cond_type   in varchar2 default null,
    p_display_when_condition   in varchar2 default null,
    p_display_when_condition2  in varchar2 default null,
    p_security_scheme          in varchar2 default null,
    p_required_patch           in number   default null,
    p_security_group_id        in number   default null );

procedure create_menu_template (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_internal_name             in varchar2 default null,
    p_before_first              in varchar2 default null,
    p_current_page_option       in varchar2 default null,
    p_non_current_page_option   in varchar2 default null,
    p_menu_link_attributes      in varchar2 default null,
    p_between_levels            in varchar2 default null,
    p_after_last                in varchar2 default null,
    p_max_levels                in number   default null,
    p_start_with_node           in varchar2 default null,
    p_translate_this_template   in varchar2 default c_n,
    p_template_comments         in varchar2 default null,
    p_security_group_id         in number   default null,
    p_reference_id              in number   default null,
    --
    p_theme_id                  in number   default null,
    p_theme_class_id            in number   default null,
    p_default_template_options  in varchar2 default null,
    p_preset_template_options   in varchar2 default null);

procedure create_web_service (
    p_id                       in number   default null,
    p_security_group_id        in number   default null,
    p_flow_id                  in number   default wwv_flow.g_flow_id,
    p_name                     in varchar2 default null,
    p_url                      in varchar2 default null,
    p_action                   in varchar2 default null,
    p_proxy_override           in varchar2 default null,
    p_soap_version             in varchar2 default null,
    p_soap_envelope            in varchar2 default null,
    p_flow_items_comma_delimited in varchar2 default null,
    p_static_parm_01           in varchar2 default null,
    p_static_parm_02           in varchar2 default null,
    p_static_parm_03           in varchar2 default null,
    p_static_parm_04           in varchar2 default null,
    p_static_parm_05           in varchar2 default null,
    p_static_parm_06           in varchar2 default null,
    p_static_parm_07           in varchar2 default null,
    p_static_parm_08           in varchar2 default null,
    p_static_parm_09           in varchar2 default null,
    p_static_parm_10           in varchar2 default null,
    p_stylesheet               in varchar2 default null,
    p_reference_id             in number   default null );

procedure create_ws_operations (
    p_id                       in number   default null,
    p_ws_id                    in number   default null,
    p_name                     in varchar2 default null,
    p_input_message_name       in varchar2 default null,
    p_input_message_ns         in varchar2 default null,
    p_input_message_style      in varchar2 default null,
    p_output_message_name      in varchar2 default null,
    p_output_message_ns        in varchar2 default null,
    p_output_message_style     in varchar2 default null,
    p_header_message_name      in varchar2 default null,
    p_header_message_style     in varchar2 default null,
    p_soap_action              in varchar2 default null);

procedure create_ws_parameters (
    p_id                       in number   default null,
    p_ws_opers_id              in number   default null,
    p_name                     in varchar2 default null,
    p_input_or_output          in varchar2 default null,
    p_parm_type                in varchar2 default null,
    p_path                     in varchar2 default null,
    p_type_is_xsd              in varchar2 default null,
    p_form_qualified           in varchar2 default null,
    p_parent_id                in varchar2 default null);

procedure create_ws_process_parms_map (
    p_id                       in number   default null,
    p_parameter_id             in number   default null,
    p_process_id               in number   default null,
    p_map_type                 in varchar2 default null,
    p_parm_value               in varchar2 default null);

--##############################################################################
--#
--# AUTHENTICATION
--#
--##############################################################################

--==============================================================================
-- internal utility function, also needed for wwv_flow_upgrade
--==============================================================================
function get_default_ldap_escaping (
    p_edit_function in varchar2 )
    return varchar2;
--==============================================================================
-- legacy API for pre 4.1
--==============================================================================
procedure create_auth_setup(
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_description               in varchar2 default null,
    p_reference_id              in number   default null,
    p_page_sentry_function      in varchar2 default null,
    p_sess_verify_function      in varchar2 default null,
    p_invalid_session_page      in varchar2 default null,
    p_invalid_session_url       in varchar2 default null,
    p_pre_auth_process          in varchar2 default null,
    p_auth_function             in varchar2 default null,
    p_post_auth_process         in varchar2 default null,
    p_cookie_name               in varchar2 default null,
    p_cookie_path               in varchar2 default null,
    p_cookie_domain             in varchar2 default null,
    p_use_secure_cookie_yn      in varchar2 default null,
    p_ldap_host                 in varchar2 default null,
    p_ldap_port                 in varchar2 default null,
    p_ldap_string               in varchar2 default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_required_patch            in varchar2 default null,
    p_security_group_id         in number   default null );
--
--==============================================================================
-- new API for plugin-based authentications (4.1+)
--==============================================================================
procedure create_authentication (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2,
    p_scheme_type               in varchar2,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_attribute_09              in varchar2 default null,
    p_attribute_10              in varchar2 default null,
    p_attribute_11              in varchar2 default null,
    p_attribute_12              in varchar2 default null,
    p_attribute_13              in varchar2 default null,
    p_attribute_14              in varchar2 default null,
    p_attribute_15              in varchar2 default null,
    p_plsql_code                in varchar2 default null,
    p_verification_function     in varchar2 default null,
    p_invalid_session_type      in varchar2 default null,
    p_invalid_session_url       in varchar2 default null,
    p_logout_url                in varchar2 default null,
    p_pre_auth_process          in varchar2 default null,
    p_post_auth_process         in varchar2 default null,
    p_cookie_name               in varchar2 default null,
    p_cookie_path               in varchar2 default null,
    p_cookie_domain             in varchar2 default null,
    p_use_secure_cookie_yn      in varchar2 default null,
    p_ras_mode                  in number   default 0,
    p_ras_dynamic_roles         in varchar2 default null,
    p_ras_namespaces            in varchar2 default null,
    p_switch_in_session_yn      in varchar2 default c_n,
    p_help_text                 in varchar2 default null,
    p_reference_id              in number   default null,
    p_comments                  in varchar2 default null );

--##############################################################################
--#
--# FLASH CHARTS
--#
--##############################################################################

procedure create_flash_chart (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                  in number   default wwv_flow_imp_page.current_region_id,
    p_default_chart_type         in varchar2 default null,
    p_chart_title                in varchar2 default null,
    p_chart_width                in number   default null,
    p_chart_height               in number   default null,
    p_chart_animation            in varchar2 default null,
    p_display_attr               in varchar2 default null,
    p_dial_tick_attr             in varchar2 default null,
    p_margins                    in varchar2 default null,
    p_omit_label_interval        in number   default null,
    --
    p_bgtype                     in varchar2 default null,
    p_bgcolor1                   in varchar2 default null,
    p_bgcolor2                   in varchar2 default null,
    p_gradient_rotation          in number   default null,
    p_color_scheme               in varchar2 default null,
    p_custom_colors              in varchar2 default null,
    --
    p_x_axis_title               in varchar2 default null,
    p_x_axis_min                 in number   default null,
    p_x_axis_max                 in number   default null,
    p_x_axis_grid_spacing        in number   default null,
    p_x_axis_prefix              in varchar2 default null,
    p_x_axis_postfix             in varchar2 default null,
    p_x_axis_group_sep           in varchar2 default null,
    p_x_axis_decimal_place       in number   default null,
    --
    p_y_axis_title               in varchar2 default null,
    p_y_axis_min                 in number   default null,
    p_y_axis_max                 in number   default null,
    p_y_axis_grid_spacing        in number   default null,
    p_y_axis_prefix              in varchar2 default null,
    p_y_axis_postfix             in varchar2 default null,
    p_y_axis_group_sep           in varchar2 default null,
    p_y_axis_decimal_place       in number   default null,
    --
    p_async_update               in varchar2 default null,
    p_async_time                 in number   default null,
    --
    p_names_font                 in varchar2 default null,
    p_names_rotation             in number   default null,
    p_values_font                in varchar2 default null,
    p_values_rotation            in number   default null,
    p_hints_font                 in varchar2 default null,
    p_legend_font                in varchar2 default null,
    p_grid_labels_font           in varchar2 default null,
    p_chart_title_font           in varchar2 default null,
    p_x_axis_title_font          in varchar2 default null,
    p_y_axis_title_font          in varchar2 default null,
    --
    p_use_chart_xml              in varchar2 default null,
    p_chart_xml                  in varchar2 default null,
    p_attribute_01               in varchar2 default null,
    p_attribute_02               in varchar2 default null,
    p_attribute_03               in varchar2 default null,
    p_attribute_04               in varchar2 default null,
    p_attribute_05               in varchar2 default null );

procedure create_flash_chart5 (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                  in number   default wwv_flow_imp_page.current_region_id,
    p_default_chart_type         in varchar2 default null,
    p_chart_title                in varchar2 default null,
    p_chart_rendering            in varchar2 default 'FLASH_PREFERRED',
    p_chart_name                 in varchar2 default null,
    p_chart_width                in number   default null,
    p_chart_height               in number   default null,
    p_chart_animation            in varchar2 default null,
    p_display_attr               in varchar2 default null,
    p_dial_tick_attr             in varchar2 default null,
    p_gantt_attr                 in varchar2 default null,
    p_pie_attr                   in varchar2 default 'Outside:::',
    p_map_attr                   in varchar2 default null,
    p_map_source                 in varchar2 default null,
    p_margins                    in varchar2 default null,
    p_omit_label_interval        in number   default null,
    --
    p_bgtype                     in varchar2 default null,
    p_bgcolor1                   in varchar2 default null,
    p_bgcolor2                   in varchar2 default null,
    p_gradient_rotation          in number   default null,
    p_grid_bgtype                in varchar2 default null,
    p_grid_bgcolor1              in varchar2 default null,
    p_grid_bgcolor2              in varchar2 default null,
    p_grid_gradient_rotation     in number   default null,
    p_color_scheme               in varchar2 default null,
    p_custom_colors              in varchar2 default null,
    p_map_undef_color_scheme     in varchar2 default null,
    p_map_undef_custom_colors    in varchar2 default null,
    --
    p_x_axis_title               in varchar2 default null,
    p_x_axis_min                 in number   default null,
    p_x_axis_max                 in number   default null,
    p_x_axis_grid_spacing        in number   default null,  -- obsolete
    p_x_axis_decimal_place       in number   default null,
    p_x_axis_prefix              in varchar2 default null,
    p_x_axis_postfix             in varchar2 default null,
    p_x_axis_label_rotation      in varchar2 default null,
    p_x_axis_label_font          in varchar2 default null,
    p_x_axis_major_interval      in number   default null,
    p_x_axis_minor_interval      in number   default null,
    --
    p_y_axis_title               in varchar2 default null,
    p_y_axis_min                 in number   default null,
    p_y_axis_max                 in number   default null,
    p_y_axis_grid_spacing        in number   default null,  -- obsolete
    p_y_axis_decimal_place       in number   default null,
    p_y_axis_prefix              in varchar2 default null,
    p_y_axis_postfix             in varchar2 default null,
    p_y_axis_label_rotation      in varchar2 default null,
    p_y_axis_label_font          in varchar2 default null,
    p_y_axis_major_interval      in number   default null,
    p_y_axis_minor_interval      in number   default null,
    --
    p_extra_y_axis_min           in number   default null,
    p_extra_y_axis_max           in number   default null,
    --
    p_async_update               in varchar2 default null,
    p_async_time                 in number   default null,
    --
    p_legend_title               in varchar2 default null,
    p_legend_title_font          in varchar2 default null,
    --
    p_names_font                 in varchar2 default null,
    p_names_rotation             in number   default null,
    p_values_font                in varchar2 default null,
    p_values_rotation            in number   default null,
    p_values_prefix              in varchar2 default null,
    p_values_postfix             in varchar2 default null,
    p_hints_font                 in varchar2 default null,
    p_legend_font                in varchar2 default null,
    p_grid_labels_font           in varchar2 default null,
    p_chart_title_font           in varchar2 default null,
    p_x_axis_title_font          in varchar2 default null,
    p_x_axis_title_rotation      in varchar2 default null,
    p_y_axis_title_font          in varchar2 default null,
    p_y_axis_title_rotation      in varchar2 default null,
    p_gauge_labels_font          in varchar2 default null,
    --
    p_use_chart_xml              in varchar2 default null,
    p_chart_xml                  in varchar2 default null );

procedure create_flash_chart_series (
    p_id                           in number   default null,
    p_chart_id                     in number   default null,
    p_flow_id                      in number   default null, -- defaults to chart's flow id
    p_series_seq                   in number   default null,
    p_series_name                  in varchar2 default null,
    p_series_query                 in varchar2 default null,
    p_series_query_type            in varchar2 default null,
    p_series_query_parse_opt       in varchar2 default null,
    p_series_query_no_data_found   in varchar2 default null,
    p_series_query_row_count_max   in number   default null );

procedure create_flash_chart5_series (
    p_id                           in number   default null,
    p_chart_id                     in number   default null,
    p_flow_id                      in number   default null, -- defaults to chart's flow id
    p_series_seq                   in number   default null,
    p_series_name                  in varchar2 default null,
    p_series_query                 in varchar2 default null,
    p_series_type                  in varchar2 default null,
    p_series_required_role         in varchar2 default null,
    p_required_patch               in number   default null,
    p_series_query_type            in varchar2 default null,
    p_series_ajax_items_to_submit  in varchar2 default null,
    p_series_query_parse_opt       in varchar2 default null,
    p_series_query_no_data_found   in varchar2 default null,
    p_series_query_row_count_max   in number   default null,
    p_action_link                  in varchar2 default null,
    p_show_action_link             in varchar2 default null,
    p_action_link_checksum_type    in varchar2 default null,
    p_display_when_cond_type       in varchar2 default null,
    p_display_when_condition       in varchar2 default null,
    p_display_when_condition2      in varchar2 default null );

--##############################################################################
--#
--# JET CHARTS
--#
--##############################################################################

procedure create_jet_chart (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                  in number   default wwv_flow_imp_page.current_region_id,
    p_chart_type                 in varchar2 default 'area',
    p_title                      in varchar2 default null,
    p_width                      in varchar2 default null,
    p_height                     in varchar2 default null,
    p_animation_on_display       in varchar2 default 'auto',
    p_animation_on_data_change   in varchar2 default 'auto',
    p_orientation                in varchar2 default null,
    p_data_cursor                in varchar2 default null,
    p_data_cursor_behavior       in varchar2 default null,
    p_hide_and_show_behavior     in varchar2 default null,
    p_hover_behavior             in varchar2 default null,
    p_stack                      in varchar2 default 'off',
    p_stack_label                in varchar2 default 'off',
    p_stack_font_family          in varchar2 default null,
    p_stack_font_style           in varchar2 default null,
    p_stack_font_size            in varchar2 default null,
    p_stack_font_color           in varchar2 default null,
    p_spark_chart                in varchar2 default null,
    p_connect_nulls              in varchar2 default c_y,
    p_stock_render_as            in varchar2 default null,
    p_dial_indicator             in varchar2 default null,
    p_dial_background            in varchar2 default null,
    p_value_min                  in number   default null,
    p_value_text_type            in varchar2 default null,
    p_value_position             in varchar2 default 'auto',
    p_value_format_type          in varchar2 default null,
    p_value_decimal_places       in number   default null,
    p_value_currency             in varchar2 default null,
    p_value_numeric_pattern      in varchar2 default null,
    p_value_format_scaling       in varchar2 default null,
    p_sorting                    in varchar2 default null,
    p_fill_multi_series_gaps     in boolean  default true,
    p_zoom_and_scroll            in varchar2 default null,
    p_zoom_direction             in varchar2 default null,
    p_initial_zooming            in varchar2 default null,
    p_tooltip_rendered           in varchar2 default null,
    p_show_series_name           in boolean  default true,
    p_show_group_name            in boolean  default true,
    p_show_value                 in boolean  default true,
    p_show_label                 in boolean  default true,
    p_show_row                   in boolean  default true,
    p_show_start                 in boolean  default true,
    p_show_end                   in boolean  default true,
    p_show_progress              in boolean  default true,
    p_show_baseline              in boolean  default true,
    p_custom_tooltip             in varchar2 default null,
    p_legend_rendered            in varchar2 default 'on',
    p_legend_title               in varchar2 default null,
    p_legend_position            in varchar2 default 'auto',
    p_legend_font_family         in varchar2 default null,
    p_legend_font_style          in varchar2 default null,
    p_legend_font_size           in varchar2 default null,
    p_legend_font_color          in varchar2 default null,
    p_overview_rendered          in varchar2 default 'off',
    p_overview_height            in varchar2 default null,
    p_pie_other_threshold        in number   default null,
    p_pie_selection_effect       in varchar2 default null,
    p_time_axis_type             in varchar2 default null,
    p_no_data_found_message      in varchar2 default null,
    p_horizontal_grid            in varchar2 default 'auto',
    p_vertical_grid              in varchar2 default 'auto',
    p_row_axis_rendered          in varchar2 default null,
    p_gantt_axis_position        in varchar2 default null,
    p_gauge_orientation          in varchar2 default 'circular',
    p_gauge_indicator_size       in number   default null,
    p_gauge_inner_radius         in number   default null,
    p_gauge_plot_area            in varchar2 default 'on',
    p_gauge_start_angle          in number   default null,
    p_gauge_angle_extent         in number   default null,
    p_show_gauge_value           in boolean  default true,
    p_javascript_code            in varchar2 default null,
    p_automatic_refresh_interval in number   default null);

procedure create_jet_chart_axis (
    p_id                         in number   default null,
    p_chart_id                   in number   default null,
    p_static_id                  in varchar2 default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default wwv_flow_imp_page.current_page_id,
    p_axis                       in varchar2 default null,
    p_is_rendered                in varchar2 default null,
    p_title                      in varchar2 default null,
    p_title_font_family          in varchar2 default null,
    p_title_font_style           in varchar2 default null,
    p_title_font_size            in varchar2 default null,
    p_title_font_color           in varchar2 default null,
    p_min                        in number   default null,
    p_max                        in number   default null,
    p_format_type                in varchar2 default null,
    p_decimal_places             in number   default null,
    p_currency                   in varchar2 default null,
    p_numeric_pattern            in varchar2 default null,
    p_format_scaling             in varchar2 default null,
    p_scaling                    in varchar2 default null,
    p_baseline_scaling           in varchar2 default 'zero',
    p_step                       in number   default null,
    p_position                   in varchar2 default null,
    p_major_tick_rendered        in varchar2 default 'auto',
    p_min_step                   in number   default null,
    p_minor_tick_rendered        in varchar2 default 'auto',
    p_minor_step                 in number   default null,
    p_tick_label_rendered        in varchar2 default 'on',
    p_tick_label_rotation        in varchar2 default null,
    p_tick_label_position        in varchar2 default null,
    p_tick_label_font_family     in varchar2 default null,
    p_tick_label_font_style      in varchar2 default null,
    p_tick_label_font_size       in varchar2 default null,
    p_tick_label_font_color      in varchar2 default null,
    p_split_dual_y               in varchar2 default null,
    p_splitter_position          in number   default null,
    p_axis_scale                 in varchar2 default null,
    p_zoom_order_seconds         in boolean  default false,
    p_zoom_order_minutes         in boolean  default false,
    p_zoom_order_hours           in boolean  default false,
    p_zoom_order_days            in boolean  default false,
    p_zoom_order_weeks           in boolean  default false,
    p_zoom_order_months          in boolean  default false,
    p_zoom_order_quarters        in boolean  default false,
    p_zoom_order_years           in boolean  default false);

procedure create_jet_chart_series (
    p_id                           in number   default null,
    p_chart_id                     in number   default null,
    p_static_id                    in varchar2 default null,
    p_flow_id                      in number   default wwv_flow.g_flow_id,
    p_page_id                      in number   default wwv_flow_imp_page.current_page_id,
    p_seq                          in number   default null,
    p_name                         in varchar2 default null,
    p_data_source_type             in varchar2 default null,
    p_function_body_language       in varchar2 default null,
    p_data_source                  in varchar2 default null,
    p_max_row_count                in varchar2 default null,
    p_ajax_items_to_submit         in varchar2 default null,
    p_location                     in varchar2 default 'LOCAL',
    p_web_src_module_id            in number   default null,
    p_use_local_sync_table         in boolean  default null,
    p_remote_server_id             in number   default null,
    p_query_owner                  in varchar2 default null,
    p_query_table                  in varchar2 default null,
    p_query_where                  in varchar2 default null,
    p_query_order_by               in varchar2 default null,
    p_source_post_processing       in varchar2 default null,
    p_include_rowid_column         in boolean  default null,
    p_optimizer_hint               in varchar2 default null,
    p_remote_sql_caching           in varchar2 default null,
    p_remote_sql_invalidate_when   in varchar2 default null,
    p_external_filter_expr         in varchar2 default null,
    p_external_order_by_expr       in varchar2 default null,
    p_series_type                  in varchar2 default null,
    p_series_name_column_name      in varchar2 default null,
    p_items_value_column_name      in varchar2 default null,
    p_items_low_column_name        in varchar2 default null,
    p_items_high_column_name       in varchar2 default null,
    p_items_open_column_name       in varchar2 default null,
    p_items_close_column_name      in varchar2 default null,
    p_items_volume_column_name     in varchar2 default null,
    p_items_x_column_name          in varchar2 default null,
    p_items_y_column_name          in varchar2 default null,
    p_items_z_column_name          in varchar2 default null,
    p_items_target_value           in varchar2 default null,
    p_items_min_value              in varchar2 default null,
    p_items_max_value              in varchar2 default null,
    p_group_name_column_name       in varchar2 default null,
    p_group_short_desc_column_name in varchar2 default null,
    p_items_label_column_name      in varchar2 default null,
    p_items_short_desc_column_name in varchar2 default null,
    p_custom_column_name           in varchar2 default null,
    p_aggregate_function           in varchar2 default null,
    p_color                        in varchar2 default null,
    p_q2_color                     in varchar2 default null,
    p_q3_color                     in varchar2 default null,
    p_line_style                   in varchar2 default null,
    p_line_width                   in number   default null,
    p_line_type                    in varchar2 default null,
    p_marker_rendered              in varchar2 default null,
    p_marker_shape                 in varchar2 default null,
    p_assigned_to_y2               in varchar2 default null,
    p_stack_category               in varchar2 default null,
    p_items_label_rendered         in boolean  default true,
    p_items_label_position         in varchar2 default null,
    p_items_label_display_as       in varchar2 default 'PERCENT',
    p_items_label_css_classes      in varchar2 default null,
    p_items_label_font_family      in varchar2 default null,
    p_items_label_font_style       in varchar2 default null,
    p_items_label_font_size        in varchar2 default null,
    p_items_label_font_color       in varchar2 default null,
    p_gantt_start_date_source      in varchar2 default null,
    p_gantt_start_date_column      in varchar2 default null,
    p_gantt_start_date_item        in varchar2 default null,
    p_gantt_end_date_source        in varchar2 default null,
    p_gantt_end_date_column        in varchar2 default null,
    p_gantt_end_date_item          in varchar2 default null,
    p_gantt_row_id                 in varchar2 default null,
    p_gantt_row_name               in varchar2 default null,
    p_gantt_task_id                in varchar2 default null,
    p_gantt_task_name              in varchar2 default null,
    p_gantt_task_start_date        in varchar2 default null,
    p_gantt_task_end_date          in varchar2 default null,
    p_gantt_task_css_style         in varchar2 default null,
    p_gantt_task_css_class         in varchar2 default null,
    p_gantt_predecessor_task_id    in varchar2 default null,
    p_gantt_successor_task_id      in varchar2 default null,
    p_gantt_baseline_start_column  in varchar2 default null,
    p_gantt_baseline_end_column    in varchar2 default null,
    p_gantt_baseline_css_class     in varchar2 default null,
    p_gantt_progress_column        in varchar2 default null,
    p_gantt_progress_css_class     in varchar2 default null,
    p_gantt_viewport_start_source  in varchar2 default null,
    p_gantt_viewport_start_column  in varchar2 default null,
    p_gantt_viewport_start_item    in varchar2 default null,
    p_gantt_viewport_end_source    in varchar2 default null,
    p_gantt_viewport_end_column    in varchar2 default null,
    p_gantt_viewport_end_item      in varchar2 default null,
    p_task_label_position          in varchar2 default null,
    p_gauge_plot_area_color       in varchar2 default null,
    p_threshold_values             in varchar2 default null,
    p_threshold_colors             in varchar2 default null,
    p_threshold_display            in varchar2 default 'onIndicator',
    p_reference_line_values        in varchar2 default null,
    p_reference_line_colors        in varchar2 default null,
    p_link_target                  in varchar2 default null,
    p_link_target_type             in varchar2 default null,
    p_security_scheme              in varchar2 default null,
    p_required_patch               in number   default null,
    p_series_comment               in varchar2 default null,
    p_display_when_cond_type       in varchar2 default null,
    p_display_when_condition       in varchar2 default null,
    p_display_when_condition2      in varchar2 default null );

--==============================================================================
-- CARD
--==============================================================================
procedure create_card (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                     in number   default wwv_flow_imp_page.current_region_id,
    p_layout_type                   in varchar2 default 'GRID',
    p_grid_column_count             in number   default null,
    p_component_css_classes         in varchar2 default null,
    p_card_appearance               in varchar2 default null,
    p_card_css_classes              in varchar2 default null,
    p_title_adv_formatting          in boolean  default false,
    p_title_column_name             in varchar2 default null,
    p_title_html_expr               in varchar2 default null,
    p_title_css_classes             in varchar2 default null,
    p_sub_title_adv_formatting      in boolean  default false,
    p_sub_title_column_name         in varchar2 default null,
    p_sub_title_html_expr           in varchar2 default null,
    p_sub_title_css_classes         in varchar2 default null,
    p_body_adv_formatting           in boolean  default false,
    p_body_column_name              in varchar2 default null,
    p_body_html_expr                in varchar2 default null,
    p_body_css_classes              in varchar2 default null,
    p_second_body_adv_formatting    in boolean  default false,
    p_second_body_column_name       in varchar2 default null,
    p_second_body_html_expr         in varchar2 default null,
    p_second_body_css_classes       in varchar2 default null,
    p_icon_source_type              in varchar2 default null,
    p_icon_class_column_name        in varchar2 default null,
    p_icon_blob_column_name         in varchar2 default null,
    p_icon_image_url                in varchar2 default null,
    p_icon_css_classes              in varchar2 default null,
    p_icon_position                 in varchar2 default null,
    p_icon_description              in varchar2 default null,
    p_badge_column_name             in varchar2 default null,
    p_badge_label                   in varchar2 default null,
    p_badge_css_classes             in varchar2 default null,
    p_media_adv_formatting          in boolean  default false,
    p_media_html_expr               in varchar2 default null,
    p_media_source_type             in varchar2 default null,
    p_media_url                     in varchar2 default null,
    p_media_url_column_name         in varchar2 default null,
    p_media_blob_column_name        in varchar2 default null,
    p_media_display_position        in varchar2 default null,
    p_media_appearance              in varchar2 default null,
    p_media_sizing                  in varchar2 default null,
    p_media_css_classes             in varchar2 default null,
    p_media_description             in varchar2 default null,
    p_pk1_column_name               in varchar2 default null,
    p_pk2_column_name               in varchar2 default null,
    p_mime_type_column_name         in varchar2 default null,
    p_last_updated_column_name      in varchar2 default null );

procedure create_card_action (
    p_id                            in number   default null,
    p_card_id                       in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default wwv_flow_imp_page.current_page_id,
    p_action_type                   in varchar2 default 'BUTTON',
    p_position                      in varchar2 default null,
    p_display_sequence              in number   default null,
    p_label                         in varchar2 default null,
    p_link_target_type              in varchar2 default null,
    p_link_target                   in varchar2 default null,
    p_link_attributes               in varchar2 default null,
    p_button_display_type           in varchar2 default null,
    p_icon_css_classes              in varchar2 default null,
    p_action_css_classes            in varchar2 default null,
    p_is_hot                        in boolean  default null,
    p_condition_type                in varchar2 default null,
    p_condition_expr1               in varchar2 default null,
    p_condition_expr2               in varchar2 default null,
    p_exec_cond_for_each_row        in boolean  default null,
    p_authorization_scheme          in varchar2 default null,
    p_build_option_id               in number   default null,
    p_action_comments               in varchar2 default null );

--==============================================================================
-- MAP
--==============================================================================
procedure create_map_region (
    p_id                            in number   default null,
    p_flow_id                       in number   default wwv_flow.g_flow_id,
    p_page_id                       in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                     in number   default wwv_flow_imp_page.current_region_id,
    p_height                        in number,
    p_tilelayer_type                in varchar2 default 'DEFAULT',
    p_tilelayer_name_default        in varchar2 default null,
    p_tilelayer_name_dark           in varchar2 default null,
    p_default_shared_tilelayer_id   in number   default null,
    p_darkmode_shared_tilelayer_id  in number   default null,
    p_navigation_bar_type           in varchar2,
    p_navigation_bar_position       in varchar2 default null,
    p_init_position_zoom_type       in varchar2,
    p_init_position_from_browser    in boolean  default null,
    p_init_position_zoom_source     in varchar2 default null,
    p_init_position_geometry_type   in varchar2 default null,
    p_init_position_geometry_col    in varchar2 default null,
    p_init_position_lon_column      in varchar2 default null,
    p_init_position_lat_column      in varchar2 default null,
    p_init_zoomlevel_column         in varchar2 default null,
    p_init_position_lon_static      in varchar2 default null,
    p_init_position_lat_static      in varchar2 default null,
    p_init_zoomlevel_static         in varchar2 default null,
    p_layer_messages_position       in varchar2 default null,
    p_layer_messages_selector       in varchar2 default null,
    p_show_legend                   in boolean  default true,
    p_legend_title                  in varchar2 default null,
    p_legend_position               in varchar2 default null,
    p_legend_position_selector      in varchar2 default null,
    p_legend_css_classes            in varchar2 default null,
    p_map_status_item               in varchar2 default null,
    p_features                      in varchar2 default null,
    p_copyright_notice              in varchar2 default null,
    p_custom_styles                 in varchar2 default null,
    p_unit_system                   in varchar2 default 'METRIC',
    p_unit_system_page_item_name    in varchar2 default null );

procedure create_map_region_layer (
    p_id                             in number   default null,
    p_flow_id                        in number   default wwv_flow.g_flow_id,
    p_page_id                        in number   default wwv_flow_imp_page.current_page_id,
    p_map_region_id                  in number,
    p_name                           in varchar2,
    p_label                          in varchar2 default null,
    p_layer_type                     in varchar2,
    p_display_sequence               in number,
    p_visible_min_zoom_level         in number   default null,
    p_visible_max_zoom_level         in number   default null,
    p_location                       in varchar2,
    p_query_type                     in varchar2 default null,
    p_table_owner                    in varchar2 default null,
    p_table_name                     in varchar2 default null,
    p_where_clause                   in varchar2 default null,
    p_order_by_clause                in varchar2 default null,
    p_include_rowid_column           in boolean  default null,
    p_layer_source                   in varchar2 default null,
    p_function_body_language         in varchar2 default null,
    p_optimizer_hint                 in varchar2 default null,
    p_web_src_module_id              in number   default null,
    p_use_local_sync_table           in boolean  default null,
    p_source_post_processing         in varchar2 default null,
    p_external_filter_expr           in varchar2 default null,
    p_external_order_by_expr         in varchar2 default null,
    p_remote_server_id               in number   default null,
    p_remote_sql_caching             in varchar2 default null,
    p_remote_sql_invalidate_when     in varchar2 default null,
    p_items_to_submit                in varchar2 default null,
    p_max_row_count                  in number   default null,
    p_no_data_found_message          in varchar2 default null,
    p_no_data_found_icon_classes     in varchar2 default null,
    p_more_data_found_message        in varchar2 default null,
    p_has_spatial_index              in boolean  default null,
    p_row_assignment_column          in varchar2 default null,
    p_row_assignment_value           in varchar2 default null,
    p_pk_column                      in varchar2 default null,
    p_geometry_column_data_type      in varchar2,
    p_geometry_column                in varchar2 default null,
    p_longitude_column               in varchar2 default null,
    p_latitude_column                in varchar2 default null,
    p_stroke_color                   in varchar2 default null,
    p_stroke_width                   in number   default null,
    p_stroke_style                   in varchar2 default null,
    p_fill_color                     in varchar2 default null,
    p_fill_color_is_spectrum         in boolean  default null,
    p_fill_color_spectr_name         in varchar2 default null,
    p_fill_color_spectr_type         in varchar2 default null,
    p_fill_value_column              in varchar2 default null,
    p_fill_opacity                   in number   default null,
    p_extrude_value_column           in varchar2 default null,
    p_extrude_unit                   in varchar2 default null,
    p_point_display_type             in varchar2 default null,
    p_point_icon_source_type         in varchar2 default null,
    p_point_icon_class_column        in varchar2 default null,
    p_point_icon_image_url           in varchar2 default null,
    p_point_icon_css_classes         in varchar2 default null,
    p_point_svg_shape                in varchar2 default null,
    p_point_svg_shape_scale          in varchar2 default null,
    p_feature_clustering             in boolean  default null,
    p_cluster_threshold_pixels       in number   default null,
    p_cluster_point_image_path       in varchar2 default null,
    p_cluster_point_css_classes      in varchar2 default null,
    p_cluster_point_svg_shape        in varchar2 default null,
    p_cluster_point_svg_shp_scale    in varchar2 default null,
    p_cluster_point_svg_fill_color   in varchar2 default null,
    p_cluster_tooltip                in varchar2 default null,
    p_tooltip_adv_formatting         in boolean  default null,
    p_tooltip_column                 in varchar2 default null,
    p_tooltip_html_expr              in varchar2 default null,
    p_tooltip_css_classes            in varchar2 default null,
    p_info_window_adv_formatting     in boolean  default null,
    p_info_window_title_column       in varchar2 default null,
    p_info_window_body_column        in varchar2 default null,
    p_info_window_html_expr          in varchar2 default null,
    p_info_window_css_classes        in varchar2 default null,
    p_link_target_type               in varchar2 default null,
    p_link_target                    in varchar2 default null,
    p_display_in_legend              in boolean  default true,
    p_legend_icon_css_classes        in varchar2 default null,
    p_allow_hide                     in boolean  default null,
    p_condition_type                 in varchar2 default null,
    p_condition_expr1                in varchar2 default null,
    p_condition_expr2                in varchar2 default null,
    p_exec_cond_for_each_row         in boolean  default null,
    p_authorization_scheme           in varchar2 default null,
    p_build_option_id                in number   default null,
    p_layer_comments                 in varchar2 default null );

procedure create_worksheet (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                  in number   default wwv_flow_imp_page.current_region_id,
    p_name                       in varchar2 default null,
    p_folder_id                  in number   default null,
    p_alias                      in varchar2 default null,
    p_report_id_item             in varchar2 default null,
    p_max_row_count              in varchar2 default null,
    p_max_row_count_message      in varchar2 default null,
    p_no_data_found_message      in varchar2 default null,
    p_max_rows_per_page          in varchar2 default null,
    p_search_button_label        in varchar2 default null,
    p_page_items_to_submit       in varchar2 default null, /* obsolete, is stored in wwv_flow_page_plugs.ajax_items_to_submit now */
    p_sort_asc_image             in varchar2 default null,
    p_sort_asc_image_attr        in varchar2 default null,
    p_sort_desc_image            in varchar2 default null,
    p_sort_desc_image_attr       in varchar2 default null,
    --
    p_sql_query                  in varchar2 default null,
    p_base_table_or_view         in varchar2 default null,
    p_base_pk1                   in varchar2 default null,
    p_base_pk2                   in varchar2 default null,
    p_base_pk3                   in varchar2 default null,
    p_sql_hint                   in varchar2 default null,
    p_oracle_text_index_column   in varchar2 default null,
    --
    p_status                     in varchar2 default 'AVAILABLE_FOR_OWNER',
    --
    p_allow_report_saving        in varchar2 default c_y,
    p_allow_save_rpt_public      in varchar2 default c_n,
    p_save_rpt_public_auth_scheme in varchar2 default null,
    p_allow_report_categories    in varchar2 default c_y,
    p_show_nulls_as              in varchar2 default null,
    p_pagination_type            in varchar2 default null,
    p_pagination_display_pos     in varchar2 default null,
    p_button_template            in number   default null,  -- obsolete
    p_show_finder_drop_down      in varchar2 default c_y,
    p_show_display_row_count     in varchar2 default c_n,
    p_show_search_bar            in varchar2 default c_y,
    p_show_search_textbox        in varchar2 default c_y,
    p_show_actions_menu          in varchar2 default c_y,
    p_actions_menu_icon          in varchar2 default null,  -- obsolete
    p_finder_icon                in varchar2 default null,  -- obsolete
    p_report_list_mode           in varchar2 default null,
    p_fixed_header               in varchar2 default 'PAGE',
    p_fixed_header_max_height    in number   default null,
    --
    p_lazy_loading               in boolean  default false,
    --
    p_show_detail_link           in varchar2 default c_y,
    p_show_select_columns        in varchar2 default c_y,
    p_show_rows_per_page         in varchar2 default c_y,
    p_show_filter                in varchar2 default c_y,
    p_show_sort                  in varchar2 default c_y,
    p_show_control_break         in varchar2 default c_y,
    p_show_highlight             in varchar2 default c_y,
    p_show_computation           in varchar2 default c_y,
    p_show_aggregate             in varchar2 default c_y,
    p_show_chart                 in varchar2 default c_y,
    p_show_group_by              in varchar2 default c_y,
    p_show_pivot                 in varchar2 default c_y,
    p_show_notify                in varchar2 default c_n,
    p_show_calendar              in varchar2 default c_y,
    p_show_flashback             in varchar2 default c_y,
    p_show_reset                 in varchar2 default c_y,
    p_show_download              in varchar2 default c_y,
    p_show_help                  in varchar2 default c_y,
    p_download_auth_scheme       in varchar2 default null,
    p_download_formats           in varchar2 default null,
    p_download_filename          in varchar2 default null,
    p_enable_mail_download       in varchar2 default c_y,
    p_csv_output_separator       in varchar2 default null,
    p_csv_output_enclosed_by     in varchar2 default null,
    p_supplemental_text          in varchar2 default null,
    --
    p_email_from                 in varchar2 default null,
    --
    p_detail_link                in varchar2 default null,
    p_detail_link_text           in varchar2 default null,
    p_detail_link_attr           in varchar2 default null,
    p_detail_link_checksum_type  in varchar2 default null,
    p_detail_link_condition_type in varchar2 default null,
    p_detail_link_cond           in varchar2 default null,
    p_detail_link_cond2          in varchar2 default null,
    p_detail_link_auth_scheme    in varchar2 default null,
    --
    p_allow_exclude_null_values  in varchar2 default c_y,
    p_allow_hide_extra_columns   in varchar2 default c_y,
    --
    p_max_query_cost             in varchar2 default null,
    p_max_flashback              in varchar2 default null,
    p_worksheet_flags            in varchar2 default null,
    --
    p_icon_view_enabled_yn       in varchar2 default c_n,
    p_icon_view_use_custom       in varchar2 default c_n,
    p_icon_view_custom_link      in varchar2 default null,
    p_icon_view_link_column      in varchar2 default null,
    p_icon_view_img_src_column   in varchar2 default null,
    p_icon_view_label_column     in varchar2 default null,
    p_icon_view_img_attr_text    in varchar2 default null,
    p_icon_view_alt_text         in varchar2 default null,
    p_icon_view_title_text       in varchar2 default null,
    p_icon_view_columns_per_row  in number   default null,
    p_detail_view_enabled_yn     in varchar2 default c_n,
    p_detail_view_before_rows    in varchar2 default null,
    p_detail_view_for_each_row   in varchar2 default null,
    p_detail_view_after_rows     in varchar2 default null,
    --
    p_description                in varchar2 default null,
    p_owner                      in varchar2 default null,
    --
    p_internal_uid               in number default null );

procedure create_worksheet_category (
    p_id                         in number   default null,
    p_worksheet_id               in number   default wwv_flow_imp_page.current_worksheet_id,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_application_user           in varchar2 default null,
    p_name                       in varchar2 default null,
    p_display_sequence           in number   default null );

procedure create_worksheet_column (
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_page_id                   in number   default wwv_flow_imp_page.current_page_id,
    p_worksheet_id              in number   default wwv_flow_imp_page.current_worksheet_id,
    p_websheet_id               in number   default null,  -- obsolte in 22.1
    --
    p_db_column_name            in varchar2 default null,
    p_display_order             in number   default null,
    p_group_id                  in number   default null,
    p_column_identifier         in varchar2 default null,
    p_column_expr               in varchar2 default null,
    p_column_label              in varchar2 default null,
    p_report_label              in varchar2 default null,
    p_sync_form_label           in varchar2 default c_y,
    --
    p_display_in_default_rpt    in varchar2 default c_y,
    p_column_html_expression    in varchar2 default null,
    p_column_link               in varchar2 default null,
    p_column_linktext           in varchar2 default null,
    p_column_link_attr          in varchar2 default null,
    p_column_link_checksum_type in varchar2 default null,
    --
    p_is_sortable               in varchar2 default c_y,
    p_allow_sorting             in varchar2 default c_y,
    p_allow_filtering           in varchar2 default c_y,
    p_allow_highlighting        in varchar2 default c_y,
    p_allow_ctrl_breaks         in varchar2 default c_y,
    p_allow_aggregations        in varchar2 default c_y,
    p_allow_computations        in varchar2 default c_y,
    p_allow_charting            in varchar2 default c_y,
    p_allow_group_by            in varchar2 default c_y,
    p_allow_pivot               in varchar2 default c_y,
    p_allow_hide                in varchar2 default c_y,
    --
    p_use_custom                in varchar2 default null,
    p_custom_filter             in varchar2 default null,
    p_base_column               in varchar2 default null,
    p_allow_filters             in varchar2 default null,
    --
    p_others_may_edit           in varchar2 default c_y,
    p_others_may_view           in varchar2 default c_y,
    --
    p_column_type               in varchar2 default null,
    p_display_as                in varchar2 default 'TEXT',
    p_display_text_as           in varchar2 default 'ESCAPE_SC',
    p_heading_alignment         in varchar2 default 'CENTER',
    p_column_alignment          in varchar2 default 'LEFT',
    p_max_length                in number   default null,
    p_display_width             in number   default null,
    p_display_height            in number   default null,
    --
    p_allow_null                in varchar2 default null,
    p_format_mask               in varchar2 default null,
    p_tz_dependent              in varchar2 default null,
    p_static_id                 in varchar2 default null,
    p_css_classes               in varchar2 default null,
    --
    p_rich_text_format          in varchar2 default null,
    --
    p_fact_table_key            in varchar2 default null,
    p_dimension_table           in varchar2 default null,
    p_dimension_table_id        in varchar2 default null,
    p_dimension_table_value     in varchar2 default null,
    --
    p_rpt_distinct_lov          in varchar2 default null,
    p_rpt_lov                   in varchar2 default null,
    p_rpt_named_lov             in number   default null,
    p_rpt_show_filter_lov       in varchar2 default 'D',
    p_rpt_filter_date_ranges    in varchar2 default 'ALL',
    --
    p_static_lov                in varchar2 default null,
    p_lov_null_text             in varchar2 default null,
    p_lov_allow_new_values      in varchar2 default null,
    p_lov_is_distinct_values    in varchar2 default null,
    p_lov_num_columns           in number   default null,
    p_lov_id                    in number   default null,
    --
    p_computation_type          in varchar2 default null,
    p_computation_expr_1        in varchar2 default null,
    p_computation_expr_2        in varchar2 default null,
    --
    p_validation_type           in varchar2 default null,
    p_validation_expr_1         in varchar2 default null,
    p_validation_expr_2         in varchar2 default null,
    --
    p_display_condition_type    in varchar2 default null,
    p_display_condition         in varchar2 default null,
    p_display_condition2        in varchar2 default null,
    --
    p_default_value             in varchar2 default null,
    p_default_when              in varchar2 default null,
    p_help_text                 in varchar2 default null,
    p_security_scheme           in varchar2 default null,
    p_column_flags              in varchar2 default null,
    p_required_patch            in number   default null,
    p_column_comment            in varchar2 default null );

procedure create_worksheet_col_group (
    p_id                      in number   default null,
    p_flow_id                 in number   default wwv_flow.g_flow_id,
    p_worksheet_id            in number   default wwv_flow_imp_page.current_worksheet_id,
    p_websheet_id             in number   default null,  -- obsolte in 22.1
    p_name                    in varchar2 default null,
    p_description             in varchar2 default null,
    p_display_sequence        in number   default null );

procedure create_worksheet_rpt (
    p_id                      in number   default null,
    p_flow_id                 in number   default wwv_flow.g_flow_id,
    p_page_id                 in number   default wwv_flow_imp_page.current_page_id,
    p_worksheet_id            in number   default wwv_flow_imp_page.current_worksheet_id,
    p_websheet_id             in number   default null,  -- obsolte in 22.1
    p_session_id              in number   default null,
    p_base_report_id          in number   default null,
    p_application_user        in varchar2 default null,
    p_name                    in varchar2 default null,
    p_description             in varchar2 default null,
    p_report_seq              in number   default null,
    p_report_type             in varchar2 default null,
    p_report_alias            in varchar2 default null,
    p_status                  in varchar2 default 'PRIVATE',
    p_category_id             in number   default null,
    p_autosave                in varchar2 default null,
    p_is_default              in varchar2 default c_n,
    --
    p_display_rows            in number   default 50,
    p_view_mode               in varchar2 default null,
    p_report_columns          in varchar2 default null,
    --
    p_sort_column_1           in varchar2 default null,
    p_sort_direction_1        in varchar2 default null,
    p_sort_column_2           in varchar2 default null,
    p_sort_direction_2        in varchar2 default null,
    p_sort_column_3           in varchar2 default null,
    p_sort_direction_3        in varchar2 default null,
    p_sort_column_4           in varchar2 default null,
    p_sort_direction_4        in varchar2 default null,
    p_sort_column_5           in varchar2 default null,
    p_sort_direction_5        in varchar2 default null,
    p_sort_column_6           in varchar2 default null,
    p_sort_direction_6        in varchar2 default null,
    --
    p_break_on                in varchar2 default null,
    p_break_enabled_on        in varchar2 default null,
    p_control_break_options   in varchar2 default null,
    --
    p_sum_columns_on_break    in varchar2 default null,
    p_avg_columns_on_break    in varchar2 default null,
    p_max_columns_on_break    in varchar2 default null,
    p_min_columns_on_break    in varchar2 default null,
    p_median_columns_on_break in varchar2 default null,
    p_mode_columns_on_break   in varchar2 default null,
    p_count_columns_on_break  in varchar2 default null,
    p_count_distnt_col_on_break in varchar2 default null,
    --
    p_flashback_mins_ago      in varchar2 default null,
    p_flashback_enabled       in varchar2 default c_n,
    --
    p_chart_type              in varchar2 default null,
    p_chart_3d                in varchar2 default null,
    p_chart_label_column      in varchar2 default null,
    p_chart_label_title       in varchar2 default null,
    p_chart_value_column      in varchar2 default null,
    p_chart_aggregate         in varchar2 default null,
    p_chart_value_title       in varchar2 default null,
    p_chart_sorting           in varchar2 default null,
    p_chart_orientation       in varchar2 default null,
    --
    p_calendar_date_column    in varchar2 default null,
    p_calendar_display_column in varchar2 default null );

procedure create_worksheet_condition (
    p_id                    in number   default null,
    p_flow_id               in number   default wwv_flow.g_flow_id,
    p_page_id               in number   default wwv_flow_imp_page.current_page_id,
    p_worksheet_id          in number   default wwv_flow_imp_page.current_worksheet_id,
    p_websheet_id           in number   default null,  -- obsolte in 22.1
    p_report_id             in number   default null,
    p_name                  in varchar2 default null,
    p_condition_type        in varchar2 default null,
    p_allow_delete          in varchar2 default null,
    --
    p_column_name           in varchar2 default null,
    p_operator              in varchar2 default null,
    p_expr_type             in varchar2 default null,
    p_expr                  in varchar2 default null,
    p_expr2                 in varchar2 default null,
    p_time_zone             in varchar2 default null,
    p_condition_sql         in varchar2 default null,
    p_condition_display     in varchar2 default null,
    --
    p_enabled               in varchar2 default null,
    --
    p_highlight_sequence    in number   default null,
    p_row_bg_color          in varchar2 default null,
    p_row_font_color        in varchar2 default null,
    p_row_format            in varchar2 default null,
    p_column_bg_color       in varchar2 default null,
    p_column_font_color     in varchar2 default null,
    p_column_format         in varchar2 default null );

procedure create_worksheet_computation (
    p_id                    in number   default null,
    p_flow_id               in number   default wwv_flow.g_flow_id,
    p_page_id               in number   default wwv_flow_imp_page.current_page_id,
    p_worksheet_id          in number   default wwv_flow_imp_page.current_worksheet_id,
    p_websheet_id           in number   default null,  -- obsolte in 22.1
    p_report_id             in number   default null,
    --
    p_db_column_name        in varchar2 default null,
    p_column_identifier     in varchar2 default null,
    p_computation_expr      in varchar2 default null,
    p_format_mask           in varchar2 default null,
    p_column_type           in varchar2 default null,
    --
    p_column_label          in varchar2 default null,
    p_report_label          in varchar2 default null );

procedure create_worksheet_group_by (
    p_id                         in number   default null,
    p_flow_id                    in number   default wwv_flow.g_flow_id,
    p_page_id                    in number   default wwv_flow_imp_page.current_page_id,
    p_worksheet_id               in number   default wwv_flow_imp_page.current_worksheet_id,
    p_websheet_id                in number   default null,  -- obsolte in 22.1
    p_report_id                  in number   default null,
    --
    p_group_by_columns           in varchar2 default null,
    p_function_01                in varchar2 default null,
    p_function_column_01         in varchar2 default null,
    p_function_db_column_name_01 in varchar2 default null,
    p_function_label_01          in varchar2 default null,
    p_function_format_mask_01    in varchar2 default null,
    p_function_sum_01            in varchar2 default null,
    p_function_02                in varchar2 default null,
    p_function_column_02         in varchar2 default null,
    p_function_db_column_name_02 in varchar2 default null,
    p_function_label_02          in varchar2 default null,
    p_function_format_mask_02    in varchar2 default null,
    p_function_sum_02            in varchar2 default null,
    p_function_03                in varchar2 default null,
    p_function_column_03         in varchar2 default null,
    p_function_db_column_name_03 in varchar2 default null,
    p_function_label_03          in varchar2 default null,
    p_function_format_mask_03    in varchar2 default null,
    p_function_sum_03            in varchar2 default null,
    p_function_04                in varchar2 default null,
    p_function_column_04         in varchar2 default null,
    p_function_db_column_name_04 in varchar2 default null,
    p_function_label_04          in varchar2 default null,
    p_function_format_mask_04    in varchar2 default null,
    p_function_sum_04            in varchar2 default null,
    p_function_05                in varchar2 default null,
    p_function_column_05         in varchar2 default null,
    p_function_db_column_name_05 in varchar2 default null,
    p_function_label_05          in varchar2 default null,
    p_function_format_mask_05    in varchar2 default null,
    p_function_sum_05            in varchar2 default null,
    p_function_06                in varchar2 default null,
    p_function_column_06         in varchar2 default null,
    p_function_db_column_name_06 in varchar2 default null,
    p_function_label_06          in varchar2 default null,
    p_function_format_mask_06    in varchar2 default null,
    p_function_sum_06            in varchar2 default null,
    p_function_07                in varchar2 default null,
    p_function_column_07         in varchar2 default null,
    p_function_db_column_name_07 in varchar2 default null,
    p_function_label_07          in varchar2 default null,
    p_function_format_mask_07    in varchar2 default null,
    p_function_sum_07            in varchar2 default null,
    p_function_08                in varchar2 default null,
    p_function_column_08         in varchar2 default null,
    p_function_db_column_name_08 in varchar2 default null,
    p_function_label_08          in varchar2 default null,
    p_function_format_mask_08    in varchar2 default null,
    p_function_sum_08            in varchar2 default null,
    p_function_09                in varchar2 default null,
    p_function_column_09         in varchar2 default null,
    p_function_db_column_name_09 in varchar2 default null,
    p_function_label_09          in varchar2 default null,
    p_function_format_mask_09    in varchar2 default null,
    p_function_sum_09            in varchar2 default null,
    p_function_10                in varchar2 default null,
    p_function_column_10         in varchar2 default null,
    p_function_db_column_name_10 in varchar2 default null,
    p_function_label_10          in varchar2 default null,
    p_function_format_mask_10    in varchar2 default null,
    p_function_sum_10            in varchar2 default null,
    p_function_11                in varchar2 default null,
    p_function_column_11         in varchar2 default null,
    p_function_db_column_name_11 in varchar2 default null,
    p_function_label_11          in varchar2 default null,
    p_function_format_mask_11    in varchar2 default null,
    p_function_sum_11            in varchar2 default null,
    p_function_12                in varchar2 default null,
    p_function_column_12         in varchar2 default null,
    p_function_db_column_name_12 in varchar2 default null,
    p_function_label_12          in varchar2 default null,
    p_function_format_mask_12    in varchar2 default null,
    p_function_sum_12            in varchar2 default null,
    p_sort_column_01             in varchar2 default null,
    p_sort_direction_01          in varchar2 default null,
    p_sort_column_02             in varchar2 default null,
    p_sort_direction_02          in varchar2 default null,
    p_sort_column_03             in varchar2 default null,
    p_sort_direction_03          in varchar2 default null,
    p_sort_column_04             in varchar2 default null,
    p_sort_direction_04          in varchar2 default null,
    p_sort_column_05             in varchar2 default null,
    p_sort_direction_05          in varchar2 default null,
    p_sort_column_06             in varchar2 default null,
    p_sort_direction_06          in varchar2 default null,
    p_sort_column_07             in varchar2 default null,
    p_sort_direction_07          in varchar2 default null,
    p_sort_column_08             in varchar2 default null,
    p_sort_direction_08          in varchar2 default null,
    p_sort_column_09             in varchar2 default null,
    p_sort_direction_09          in varchar2 default null,
    p_sort_column_10             in varchar2 default null,
    p_sort_direction_10          in varchar2 default null,
    p_sort_column_11             in varchar2 default null,
    p_sort_direction_11          in varchar2 default null,
    p_sort_column_12             in varchar2 default null,
    p_sort_direction_12          in varchar2 default null );

procedure create_worksheet_notify (
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_worksheet_id           in number   default wwv_flow_imp_page.current_worksheet_id,
    p_websheet_id            in number   default null,  -- obsolte in 22.1
    p_report_id              in number   default null,
    p_owner                  in varchar2 default null,
    p_language               in varchar2 default null,
    p_download_format        in varchar2 default 'HTML',
    p_strip_rich_text        in varchar2 default null,
    p_data_only              in varchar2 default null,
    p_pdf_page_size          in varchar2 default null,
    p_pdf_page_orientation   in varchar2 default null,
    p_pdf_accessible         in varchar2 default null,
    p_skip_no_data_found     in varchar2 default c_n,
    p_email_from             in varchar2 default null,
    p_email_subject          in varchar2 default null,
    p_email_address          in varchar2 default null,
    p_start_date             in varchar2 default null,
    p_end_date               in varchar2 default null,
    p_end_day                in number   default null,
    p_end_day_unit           in varchar2 default null,
    p_offset_date            in varchar2 default null,
    p_notify_interval        in varchar2 default null,
    p_status                 in varchar2 default null,
    p_notify_error           in varchar2 default null );

procedure create_worksheet_pivot (
    p_id            in number   default null,
    p_flow_id       in number   default wwv_flow.g_flow_id,
    p_page_id       in number   default wwv_flow_imp_page.current_page_id,
    p_worksheet_id  in number   default wwv_flow_imp_page.current_worksheet_id,
    p_websheet_id   in number   default null,  -- obsolte in 22.1
    p_report_id     in number   default null,
    --
    p_pivot_columns in varchar2 default null,
    p_row_columns   in varchar2 default null );

procedure create_worksheet_pivot_agg (
    p_id              in number   default null,
    p_pivot_id        in number   default null,
    p_display_seq     in number   default null,
    p_function_name   in varchar2 default null,
    p_column_name     in varchar2 default null,
    p_db_column_name  in varchar2 default null,
    p_column_label    in varchar2 default null,
    p_format_mask     in varchar2 default null,
    p_display_sum     in varchar2 default c_n );

procedure create_worksheet_pivot_sort (
    p_id                in number   default null,
    p_pivot_id          in number   default null,
    p_sort_seq          in number   default null,
    p_sort_column_name  in varchar2 default null,
    p_sort_direction    in varchar2 default null );

procedure create_interactive_grid(
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_page_id                     in number   default wwv_flow_imp_page.current_page_id,
    p_region_id                   in number   default wwv_flow_imp_page.current_region_id,
    p_internal_uid                in number   default null,
    p_is_editable                 in boolean  default false,
    p_edit_operations             in varchar2 default null,
    p_edit_row_operations_column  in varchar2 default null,
    p_add_authorization_scheme    in varchar2 default null,
    p_update_authorization_scheme in varchar2 default null,
    p_delete_authorization_scheme in varchar2 default null,
    p_lost_update_check_type      in varchar2 default null,
    p_row_version_column          in varchar2 default null,
    p_add_row_if_empty            in boolean  default null,
    p_submit_checked_rows         in boolean  default null,
    p_lazy_loading                in boolean  default false,
    p_requires_filter             in boolean  default false,
    p_max_row_count               in number   default null,
    p_show_nulls_as               in varchar2 default null,
    p_select_first_row            in boolean  default true,
    p_fixed_row_height            in boolean  default true,
    p_pagination_type             in varchar2 default 'SCROLL',
    p_show_total_row_count        in boolean  default true,
    p_no_data_found_message       in varchar2 default null,
    p_max_row_count_message       in varchar2 default null,
    p_show_toolbar                in boolean  default true,
    p_toolbar_buttons             in varchar2 default 'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE',
    p_add_button_label            in varchar2 default null,
    p_enable_save_public_report   in boolean  default false,
    p_public_report_auth_scheme   in varchar2 default null,
    p_enable_subscriptions        in boolean  default true,
    p_enable_flashback            in boolean  default true,
    p_define_chart_view           in boolean  default true,
    p_enable_download             in boolean  default true,
    p_download_auth_scheme        in varchar2 default null,
    p_download_formats            in varchar2 default 'CSV:HTML:PDF:XLSX',
    p_download_filename           in varchar2 default null,
    p_enable_mail_download        in boolean  default true,
    p_csv_separator               in varchar2 default null,
    p_csv_enclosed_by             in varchar2 default null,
    p_supplemental_text           in varchar2 default null,
    p_fixed_header                in varchar2 default 'PAGE',
    p_fixed_header_max_height     in number   default null,
    p_show_icon_view              in boolean  default false,
    p_icon_view_use_custom        in boolean  default null,
    p_icon_view_custom            in varchar2 default null,
    p_icon_view_icon_type         in varchar2 default null,
    p_icon_view_icon_column       in varchar2 default null,
    p_icon_view_icon_attributes   in varchar2 default null,
    p_icon_view_link_target       in varchar2 default null,
    p_icon_view_link_attributes   in varchar2 default null,
    p_icon_view_label_column      in varchar2 default null,
    p_show_detail_view            in boolean  default false,
    p_detail_view_before_rows     in varchar2 default null,
    p_detail_view_for_each_row    in varchar2 default null,
    p_detail_view_after_rows      in varchar2 default null,
    p_oracle_text_index_column    in varchar2 default null,
    p_email_from                  in varchar2 default null,
    p_javascript_code             in varchar2 default null,
    p_help_text                   in varchar2 default null );

procedure create_ig_report(
    p_id                     in number   default null,
    p_flow_id                in number   default wwv_flow.g_flow_id,
    p_page_id                in number   default wwv_flow_imp_page.current_page_id,
    p_interactive_grid_id    in number,
    p_name                   in varchar2 default null,
    p_static_id              in varchar2 default null,
    p_description            in varchar2 default null,
    p_type                   in varchar2,
    p_default_view           in varchar2,
    p_authorization_scheme   in varchar2 default null,
    p_application_user       in varchar2 default null,
    p_rows_per_page          in number   default null,
    p_show_row_number        in boolean  default false,
    p_settings_area_expanded in boolean  default true,
    p_flashback_mins_ago     in number   default null,
    p_flashback_is_enabled   in boolean  default null );

procedure create_ig_report_view(
    p_id                        in number   default null,
    p_report_id                 in number,
    p_view_type                 in varchar2,
    p_breaks_expanded           in boolean  default null,
    p_stretch_columns           in boolean  default null,
    p_srv_exclude_null_values   in boolean  default null,
    p_srv_only_display_columns  in boolean  default null,
    p_edit_mode                 in boolean  default null,
    p_chart_type                in varchar2 default null,
    p_chart_orientation         in varchar2 default null,
    p_chart_stack               in varchar2 default null,
    p_axis_label                in varchar2 default null,
    p_axis_value                in varchar2 default null,
    p_axis_value_decimal_places in number   default null );

procedure create_ig_report_compute(
    p_id                  in number   default null,
    p_report_id           in number,
    p_view_id             in number   default null,
    p_function            in varchar2,
    p_column_id           in number   default null,
    p_comp_column_id      in number   default null,
    p_partition_by_clause in varchar2 default null,
    p_order_by_clause     in varchar2 default null,
    p_sql_expression      in varchar2 default null,
    p_data_type           in varchar2 default null,
    p_heading             in varchar2 default null,
    p_label               in varchar2 default null,
    p_heading_alignment   in varchar2 default null,
    p_column_alignment    in varchar2 default null,
    p_group_id            in number   default null,
    p_use_group_for       in varchar2 default null,
    p_format_mask         in varchar2 default null,
    p_is_enabled          in boolean  default true );

procedure create_ig_report_filter(
    p_id                in number   default null,
    p_report_id         in number,
    p_view_id           in number   default null,
    p_type              in varchar2,
    p_name              in varchar2 default null,
    p_column_id         in number   default null,
    p_comp_column_id    in number   default null,
    p_operator          in varchar2 default null,
    p_is_case_sensitive in boolean  default null,
    p_expression        in varchar2 default null,
    p_is_enabled        in boolean  default true );

procedure create_ig_report_column(
    p_id                     in number   default null,
    p_view_id                in number,
    p_display_seq            in number,
    p_column_id              in number   default null,
    p_comp_column_id         in number   default null,
    p_is_visible             in boolean  default true,
    p_is_frozen              in boolean  default false,
    p_width                  in number   default null,
    p_priority               in number   default null,
    p_sort_order             in number   default null,
    p_break_order            in number   default null,
    p_break_is_enabled       in boolean  default null,
    p_break_sort_direction   in varchar2 default null,
    p_break_sort_nulls       in varchar2 default null,
    p_sort_direction         in varchar2 default null,
    p_sort_nulls             in varchar2 default null );

procedure create_ig_report_highlight(
    p_id                          in number   default null,
    p_view_id                     in number,
    p_execution_seq               in number,
    p_name                        in varchar2,
    p_column_id                   in number   default null,
    p_comp_column_id              in number   default null,
    p_background_color            in varchar2 default null,
    p_text_color                  in varchar2 default null,
    p_condition_type              in varchar2,
    p_condition_column_id         in number   default null,
    p_condition_comp_column_id    in number   default null,
    p_condition_operator          in varchar2 default null,
    p_condition_is_case_sensitive in boolean  default null,
    p_condition_expression        in varchar2 default null,
    p_is_enabled                  in boolean  default true );

procedure create_ig_report_aggregate(
    p_id               in number   default null,
    p_view_id          in number,
    p_tooltip          in varchar2 default null,
    p_function         in varchar2,
    p_column_id        in number   default null,
    p_comp_column_id   in number   default null,
    p_show_grand_total in boolean  default true,
    p_is_enabled       in boolean  default true );

procedure create_ig_report_chart_col(
    p_id             in number   default null,
    p_view_id        in number,
    p_column_type    in varchar2,
    p_column_id      in number   default null,
    p_comp_column_id in number   default null,
    p_function       in varchar2 default null,
    p_sort_order     in number   default null,
    p_sort_direction in varchar2 default null,
    p_sort_nulls     in varchar2 default null );

procedure create_entry_point(
    p_id                        in number   default null,
    p_flow_id                   in number   default wwv_flow.g_flow_id,
    p_name                      in varchar2 default null,
    p_page_reset                in varchar2 default null,
    p_entry_point_comment       in number   default null,
    p_security_group_id         in number   default null );

procedure create_entry_point_args(
    p_id                        in number   default null,
    p_flow_entry_point_id       in number   default null,
    p_entry_point_arg_sequence  in varchar2 default null,
    p_entry_point_arg_item_id   in varchar2 default null,
    p_entry_point_arg_comment   in number   default null,
    p_security_group_id         in number   default null );

procedure set_security_group_id(
    p_security_group_id in number default null)
    --
    -- This procedure allows the caller to set wwv_flow_security.g_security_group_id
    -- to the security group id of the schema they are currently running in.
    --
    ;

function get_security_group_id
    --
    -- This function returns wwv_flow_security.g_security_group_id
    --
    return number
    ;

procedure update_owner(
    -----------------------------
    -- Change flow schema (owner)
    --
    p_flow_id in number   default wwv_flow.g_flow_id,
    p_owner   in varchar2 default null)
    ;

procedure set_build_status_run_only(
    ---------------------------------------
    -- Change flow build status to RUN_ONLY
    --
    p_flow_id in number default wwv_flow.g_flow_id)
    ;

procedure delete_template(
    ------------------------------------
    -- Delete template of specified type
    --
    p_type    in varchar2 default null,
    p_flow_id in number   default wwv_flow.g_flow_id,
    p_id      in number   default null)
    ;

procedure set_page_help_text(
    ----------------------------------
    -- select page help text into clob
    --
    p_flow_id       in number   default wwv_flow.g_flow_id,
    p_flow_step_id  in number   default null,
    p_text          in varchar2 default null)
    ;

procedure set_html_page_header(
    ------------------------------------
    -- select html page header into clob
    --
    p_flow_id       in number   default wwv_flow.g_flow_id,
    p_flow_step_id  in number   default null,
    p_text          in varchar2 default null)
    ;

procedure import_script (
    p_filename        in varchar2,
    p_varchar2_table  in sys.dbms_sql.varchar2_table,
    p_flow_id         in number default wwv_flow.g_flow_id,
    p_pathid          in number default null,
    p_name            in varchar2 default null,
    p_title           in varchar2 default null,
    p_mime_type       in varchar2 default null,
    p_dad_charset     in varchar2 default null,
    p_deleted_as_of   in date default null,
    p_content_type    in varchar2 default null,
    p_language        in varchar2 default null,
    p_description     in varchar2 default null,
    p_file_type       in varchar2 default null,
    p_file_charset    in varchar2 default null)
    ;

procedure create_script (
    p_id                in number  default null,
    p_flow_id           in number  default wwv_flow.g_flow_id,
    p_name              in varchar2 default null,
    p_pathid            in number default null,
    p_filename          in varchar2,
    p_title             in varchar2 default null,
    p_mime_type         in varchar2 default null,
    p_dad_charset       in varchar2 default null,
    p_created_by        in varchar2 default null,
    p_created_on        in date     default null,
    p_updated_by        in varchar2 default null,
    p_updated_on        in date     default null,
    p_deleted_as_of     in date default null,
    p_content_type      in varchar2 default null,
    p_blob_content      in sys.dbms_sql.varchar2_table,
    p_language          in varchar2 default null,
    p_description       in varchar2 default null,
    p_file_type         in varchar2 default null,
    p_file_charset      in varchar2 default null)
    ;

procedure update_page_item (
    p_flow_id              in number,
    p_page_id              in number,
    p_item_id              in number,
    p_new_sequence         in number,
    p_display_as           in varchar2,
    p_new_name             in varchar2,
    p_new_label            in varchar2,
    p_new_begin_new_line   in varchar2,
    p_new_begin_new_field  in varchar2,
    p_attribute_01         in varchar2,
    p_attribute_02         in varchar2,
    p_attribute_03         in varchar2,
    p_attribute_04         in varchar2,
    p_attribute_05         in varchar2,
    p_attribute_06         in varchar2,
    p_attribute_07         in varchar2,
    p_attribute_08         in varchar2,
    p_attribute_09         in varchar2,
    p_attribute_10         in varchar2,
    p_attribute_11         in varchar2,
    p_attribute_12         in varchar2,
    p_attribute_13         in varchar2,
    p_attribute_14         in varchar2,
    p_attribute_15         in varchar2
    );

procedure set_feedback_origin (
    p_identifier  in varchar2,
    p_import_into in varchar2 );

procedure import_feedback (
    p_id                        in number,
    p_feedback_id               in number   default null,
    p_feedback_comment          in varchar2,
    p_developer_comment         in varchar2 default null,
    p_public_response           in varchar2 default null,
    p_feedback_status           in number   default null,
    p_feedback_type             in number   default null,
    p_tags                      in varchar2 default null,
    p_application_id            in number   default null,
    p_application_name          in varchar2 default null,
    p_page_id                   in number   default null,
    p_page_name                 in varchar2 default null,
    p_page_last_updated_by      in varchar2 default null,
    p_page_last_updated_on      in date     default null,
    p_session_id                in varchar2 default null,
    p_apex_user                 in varchar2 default null,
    p_user_email                in varchar2 default null,
    p_logging_email             in varchar2 default null,
    p_logging_security_group_id in number   default null,
    p_logged_by_workspace_name  in varchar2 default null,
    p_application_version       in varchar2 default null,
    p_parsing_schema            in varchar2 default null,
    p_http_user_agent           in varchar2 default null,
    p_remote_addr               in varchar2 default null,
    p_remote_user               in varchar2 default null,
    p_http_host                 in varchar2 default null,
    p_server_name               in varchar2 default null,
    p_server_port               in varchar2 default null,
    p_screen_width              in varchar2 default null,
    p_screen_height             in varchar2 default null,
    p_session_state             in varchar2 default null,
    p_session_info              in varchar2 default null,
    p_label_01                  in varchar2 default null,
    p_label_02                  in varchar2 default null,
    p_label_03                  in varchar2 default null,
    p_label_04                  in varchar2 default null,
    p_label_05                  in varchar2 default null,
    p_label_06                  in varchar2 default null,
    p_label_07                  in varchar2 default null,
    p_label_08                  in varchar2 default null,
    p_attribute_01              in varchar2 default null,
    p_attribute_02              in varchar2 default null,
    p_attribute_03              in varchar2 default null,
    p_attribute_04              in varchar2 default null,
    p_attribute_05              in varchar2 default null,
    p_attribute_06              in varchar2 default null,
    p_attribute_07              in varchar2 default null,
    p_attribute_08              in varchar2 default null,
    p_created_by                in varchar2                 default null,
    p_created_on                in timestamp with time zone default null,
    p_updated_by                in varchar2                 default null,
    p_updated_on                in timestamp with time zone default null );

procedure import_feedback_followup (
    p_id          in number,
    p_feedback_id in number,
    p_follow_up   in varchar2,
    p_email       in varchar2,
    p_created_by  in varchar2                 default null,
    p_created_on  in timestamp with time zone default null,
    p_updated_by  in varchar2                 default null,
    p_updated_on  in timestamp with time zone default null );

procedure parse_file_source (
    p_source               in varchar2,
    p_db_column           out varchar2,
    p_mimetype_column     out varchar2,
    p_filename_column     out varchar2,
    p_last_updated_col    out varchar2,
    p_charset_column      out varchar2,
    p_content_disposition out varchar2,
    p_download_link_text  out varchar2 );

procedure create_load_table(
   p_id                       in number    default null,
   p_flow_id                  in number    default wwv_flow.g_flow_id,
   p_name                     in varchar2,
   p_static_id                in varchar2 default null,
   p_target_type              in varchar2 default null,
   p_owner                    in varchar2 default null,
   p_table_name               in varchar2 default null,
   p_collection_name          in varchar2 default null,
   p_data_profile_id          in number   default null,
   p_loading_method           in varchar2 default null,
   p_commit_interval          in number   default null,
   p_error_handling           in varchar2 default null,
   p_error_collection_name    in varchar2 default null,
   --
   p_unique_column_1          in varchar2 default null,
   p_is_uk1_case_sensitive    in varchar2 default null,
   p_unique_column_2          in varchar2 default null,
   p_is_uk2_case_sensitive    in varchar2 default null,
   p_unique_column_3          in varchar2 default null,
   p_is_uk3_case_sensitive    in varchar2 default null,
   p_version_column_name      in varchar2 default null,
   p_column_names_lov_id      in number   default null,
   p_skip_validation          in varchar2 default c_n,
   p_wizard_page_ids          in varchar2 default null,
   p_reference_id             in number   default null,
   p_comments                 in varchar2 default null);

procedure create_load_table_lookup(
   p_id                        in number    default null,
   p_flow_id                   in number    default wwv_flow.g_flow_id,
   p_load_table_id             in number,
   p_load_column_name          in varchar2,
   p_lookup_owner              in varchar2,
   p_lookup_table_name         in varchar2,
   p_key_column                in varchar2,
   p_display_column            in varchar2,
   p_alternative_key_column1     in varchar2  default null,
   p_alternative_display_column1 in varchar2  default null,
   p_alternative_key_column2     in varchar2  default null,
   p_alternative_display_column2 in varchar2  default null,
   p_where_clause              in varchar2 default null,
   p_insert_new_value          in varchar2  default c_n,
   p_error_message             in varchar2  default null);

procedure create_load_table_rule(
   p_id                        in number    default null,
   p_flow_id                   in number    default wwv_flow.g_flow_id,
   p_load_table_id             in number,
   p_load_column_name          in varchar2,
   p_rule_name                 in varchar2,
   p_rule_type                 in varchar2,
   p_rule_sequence             in number,
   p_rule_expression1          in varchar2  default null,
   p_rule_expression2          in varchar2  default null,
   p_error_message             in varchar2  default null);
--
-- Procedure to change the status of Build Options
-- p_app: The Application id
-- p_id: The Build Option Id
-- p_build_status: Status with possible values 'INCLUDE','EXCLUDE' (Both uppercase)
procedure set_build_option_status(
   p_application_id    in number,
   p_id                in number,
   p_build_status      in varchar2 );

--
-- Function to get the status of Build Options
-- p_application_id: The Application id
-- p_id:  The Build Option Id
--
function get_build_option_status(
   p_application_id   in number,
   p_id               in number )
return varchar2;

--
-- Function to get the status of Build Options
-- p_application_id: The Application id
-- p_build_option_name: Build Option Name
--
function get_build_option_status(
   p_application_id   in number,
   p_build_option_name in varchar2 )
return varchar2;


--
-- Function to get the status of the application
-- p_application_id: The Application ID
--
function get_application_status(
   p_application_id   in number )
return varchar2;



procedure post_import_process (
    p_flow_id              in number  default wwv_flow.g_flow_id,
    p_auto_install_sup_obj in boolean default false,
    p_is_component_import  in boolean default false );

-- Used by SQL Developer
procedure create_app_from_query (
    p_schema                     in varchar2,
    p_workspace_id               in number,
    p_application_name           in varchar2,
    p_authentication             in varchar2 default 'DATABASE ACCOUNT',
    p_application_id             out number,
    p_theme                      in number,
    p_theme_type                 in varchar2,
    p_sql                        in varchar2,
    p_page_name                  in varchar2 default 'Page 1',
    p_max_displayed_columns      in number default 30,
    p_group_name                 in varchar2 default null);

------------------------
-- Complete workspace export
--
procedure create_app_build_pref (
    p_id                               in number      default null,
    p_default_parsing_schema           in varchar2    default null,
    p_default_auth_scheme              in varchar2    default null,
    p_default_app_theme                in number      default null,
    p_default_tabs                     in varchar2    default null,
    p_default_proxy_server             in varchar2    default null,
    p_default_language                 in varchar2    default null,
    p_default_language_derived         in varchar2    default null,
    p_date_format                      in varchar2    default null,
    p_date_time_format                 in varchar2    default null,
    p_timestamp_format                 in varchar2    default null,
    p_timestamp_tz_format              in varchar2    default null,
    p_created_on                       in date        default null,
    p_created_by                       in varchar2    default null,
    p_updated_on                       in date        default null,
    p_updated_by                       in varchar2    default null );

procedure create_clickthru_log$ (
    p_clickdate                        in date        default null,
    p_category                         in varchar2    default null,
    p_id                               in number      default null,
    p_flow_user                        in varchar2    default null,
    p_ip                               in varchar2    default null );

procedure create_clickthru_log2$ (
    p_clickdate                        in date        default null,
    p_category                         in varchar2    default null,
    p_id                               in number      default null,
    p_flow_user                        in varchar2    default null,
    p_ip                               in varchar2    default null );

procedure create_data_load_bad_log (
    p_id                               in number      default null,
    p_load_id                          in number      default null,
    p_errm                             in varchar2    default null,
    p_data                             in varchar2    default null );

procedure create_data_load_unload (
    p_id                               in number      default null,
    p_platform                         in varchar2    default null,
    p_file_columns                     in varchar2    default null,
    p_data_type                        in varchar2    default null,
    p_data_schema                      in varchar2    default null,
    p_data_table                       in varchar2    default null,
    p_success_rows                     in number      default null,
    p_failed_rows                      in number      default null,
    p_data_id                          in number      default null,
    p_job_id                           in number      default null,
    p_created_on                       in date        default null,
    p_created_by                       in varchar2    default null,
    p_created_by_id                    in number      default null,
    p_enclosed_by                      in varchar2    default null,
    p_separator                        in varchar2    default null );

procedure create_mail_attachments (
    p_id                               in number      default null,
    p_mail_id                          in number      default null,
    p_filename                         in varchar2    default null,
    p_mime_type                        in varchar2    default null,
    p_inline                           in varchar2    default null,
    p_content_id                       in varchar2    default null,
    p_attachment                       in sys.dbms_sql.varchar2_table default empty_varchar2_table,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null);

procedure create_mail_log (
	p_mail_id                          in number      default null,
    p_mail_to                          in varchar2    default null,
    p_mail_from                        in varchar2    default null,
    p_mail_replyto                     in varchar2    default null,
    p_mail_subj                        in varchar2    default null,
    p_mail_cc                          in varchar2    default null,
    p_mail_bcc                         in varchar2    default null,
    p_mail_send_error                  in varchar2    default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_mail_queue (
    p_id                               in number      default null,
    p_mail_to                          in varchar2    default null,
    p_mail_from                        in varchar2    default null,
    p_mail_replyto                     in varchar2    default null,
    p_mail_subj                        in varchar2    default null,
    p_mail_cc                          in varchar2    default null,
    p_mail_bcc                         in varchar2    default null,
    p_mail_body                        in clob        default null,
    p_mail_body_html                   in clob        default null,
    p_mail_send_count                  in number      default null,
    p_mail_send_error                  in varchar2    default null,
    p_includes_html                    in number      default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_model_pages (
    p_id                               in number      default null,
    p_model_id                         in number      default null,
    p_page_id                          in number      default null,
    p_parent_page_id                   in number      default null,
    p_display_sequence                 in number      default null,
    p_page_type                        in varchar2    default null,
    p_page_source                      in varchar2    default null,
    p_page_name                        in varchar2    default null,
    p_source                           in clob        default null,
    p_block_id                         in number      default null,
    p_report_id                        in number      default null,
    p_mig_comments                     in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_model_page_regions (
    p_id                               in number      default null,
    p_model_page_id                    in number      default null,
    p_region_id                        in number      default null,
    p_region_name                      in varchar2    default null,
    p_region_source                    in varchar2    default null,
    p_source                           in clob        default null,
    p_display_sequence                 in number      default null,
    p_report_implementation            in varchar2    default null,
    p_search_enabled                   in varchar2    default null,
    p_link_column                      in varchar2    default null,
    p_link_text                        in varchar2    default null,
    p_parent_link_from_column1         in varchar2    default null,
    p_parent_link_from_column2         in varchar2    default null,
    p_link_to_column1                  in varchar2    default null,
    p_link_to_column2                  in varchar2    default null,
    p_display_column                   in varchar2    default null,
    p_supp_info_column                 in varchar2    default null,
    p_report_filter                    in varchar2    default null,
    p_column_heading_sorting           in varchar2    default null,
    p_download_link                    in varchar2    default null,
    p_chart_title                      in varchar2    default null,
    p_chart_type                       in varchar2    default null,
    p_chart_rendering                  in varchar2    default null,
    p_x_axis_title                     in varchar2    default null,
    p_y_axis_title                     in varchar2    default null,
    p_chart_orientation                in varchar2    default null,
    p_chart_value_column               in varchar2    default null,
    p_chart_label_column               in varchar2    default null,
    p_chart_low_column                 in varchar2    default null,
    p_chart_high_column                in varchar2    default null,
    p_chart_open_column                in varchar2    default null,
    p_chart_close_column               in varchar2    default null,
    p_chart_volume_column              in varchar2    default null,
    p_chart_x_column                   in varchar2    default null,
    p_chart_y_column                   in varchar2    default null,
    p_chart_z_column                   in varchar2    default null,
    p_chart_target_column              in varchar2    default null,
    p_chart_min_column                 in varchar2    default null,
    p_chart_max_column                 in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_model_page_cols (
    p_id                               in number      default null,
    p_model_region_id                  in number      default null,
    p_column_name                      in varchar2    default null,
    p_column_display_name              in varchar2    default null,
    p_column_sequence                  in number      default null,
    p_help_text                        in varchar2    default null,
    p_display_as_form                  in varchar2    default null,
    p_form_attribute_01                in varchar2    default null,
    p_form_attribute_02                in varchar2    default null,
    p_form_attribute_03                in varchar2    default null,
    p_form_attribute_04                in varchar2    default null,
    p_form_attribute_05                in varchar2    default null,
    p_form_attribute_06                in varchar2    default null,
    p_form_attribute_07                in varchar2    default null,
    p_form_attribute_08                in varchar2    default null,
    p_form_attribute_09                in varchar2    default null,
    p_form_attribute_10                in varchar2    default null,
    p_form_attribute_11                in varchar2    default null,
    p_form_attribute_12                in varchar2    default null,
    p_form_attribute_13                in varchar2    default null,
    p_form_attribute_14                in varchar2    default null,
    p_form_attribute_15                in varchar2    default null,
    p_display_as_tab_form              in varchar2    default null,
    p_datatype                         in varchar2    default null,
    p_alignment                        in varchar2    default null,
    p_display_width                    in number      default null,
    p_max_width                        in number      default null,
    p_height                           in number      default null,
    p_format_mask                      in varchar2    default null,
    p_hidden_column                    in varchar2    default null,
    p_sort_sequence                    in number      default null,
    p_sort_dir                         in number      default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_password_history (
    p_id                               in number      default null,
    p_user_id                          in number      default null,
    p_password                         in raw         default null,
    p_created                          in date        default null );

procedure create_pkg_app_map (
    p_id                               in number      default null,
    p_app_id                           in number      default null,
    p_installed_app_id                 in number      default null,
    p_installed_ws_id                  in number      default null,
    p_installed_build_version          in number      default null,
    p_app_locked                       in varchar2    default null,
    p_created                          in date        default null,
    p_created_by                       in varchar2    default null,
    p_updated                          in date        default null,
    p_updated_by                       in varchar2    default null );

procedure create_preferences$ (
    p_id                               in number      default null,
    p_user_id                          in varchar2    default null,
    p_preference_name                  in varchar2    default null,
    p_attribute_value                  in varchar2    default null,
    p_tenant_id                        in varchar2    default null );

procedure create_provision_serice_mod (
    p_id                               in number      default null,
    p_service_name                     in varchar2    default null,
    p_service_attribute_1              in varchar2    default null,
    p_service_attribute_2              in varchar2    default null,
    p_service_attribute_3              in varchar2    default null,
    p_service_attribute_4              in varchar2    default null,
    p_service_attribute_5              in varchar2    default null,
    p_service_attribute_6              in varchar2    default null,
    p_service_attribute_7              in varchar2    default null,
    p_service_attribute_8              in varchar2    default null,
    p_requested_on                     in date        default null,
    p_requested_by                     in varchar2    default null,
    p_last_status_change_on            in date        default null,
    p_last_status_change_by            in varchar2    default null,
    p_request_status                   in varchar2    default null,
    p_request_work_log                 in varchar2    default null,
    p_request_comments                 in varchar2    default null );

procedure create_qb_saved_cond (
    p_id                               in number      default null,
    p_col                              in varchar2    default null,
    p_alias                            in varchar2    default null,
    p_fv                               in varchar2    default null,
    p_fp                               in varchar2    default null,
    p_out                              in varchar2    default null,
    p_st                               in varchar2    default null,
    p_so                               in varchar2    default null,
    p_grp                              in varchar2    default null,
    p_con                              in varchar2    default null,
    p_ord                              in number      default null );

procedure create_qb_saved_join (
    p_id                               in number      default null,
    p_field1                           in varchar2    default null,
    p_field2                           in varchar2    default null,
    p_cond                             in varchar2    default null );

procedure create_qb_saved_query (
    p_id                               in number      default null,
    p_query_owner                      in varchar2    default null,
    p_title                            in varchar2    default null,
    p_qb_sql                           in clob        default null,
    p_description                      in varchar2    default null,
    p_query_type                       in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

procedure create_qb_saved_tabs (
    p_id                               in number      default null,
    p_oid                              in number      default null,
    p_cnt                              in number      default null,
    p_top                              in varchar2    default null,
    p_left                             in varchar2    default null,
    p_tname                            in varchar2    default null );

procedure create_rt$approvals (
    p_id                               in number      default null,
    p_client_id                        in number      default null,
    p_user_name                        in varchar2    default null,
    p_status                           in varchar2    default null,
    p_row_version_number               in number      default null );

procedure create_rt$approval_privs (
    p_id                               in number      default null,
    p_approval_id                      in number      default null,
    p_privilege_id                     in number      default null,
    p_row_version_number               in number      default null );

procedure create_rt$clients (
    p_id                               in number      default null,
    p_name                             in varchar2    default null,
    p_description                      in varchar2    default null,
    p_auth_flow                        in varchar2    default null,
    p_apex_app_id                      in number      default null,
    p_response_type                    in varchar2    default null,
    p_client_id                        in varchar2    default null,
    p_client_secret                    in varchar2    default null,
    p_redirect_uri                     in varchar2    default null,
    p_support_email                    in varchar2    default null,
    p_about_url                        in varchar2    default null,
    p_row_version_number               in number      default null );

procedure create_rt$client_privileges (
    p_id                               in number      default null,
    p_client_id                        in number      default null,
    p_privilege_id                     in number      default null,
    p_row_version_number               in number      default null );

procedure create_rt$errors (
    p_id                               in number      default null,
    p_handler_id                       in number      default null,
    p_request_path                     in varchar2    default null,
    p_request_parameters               in varchar2    default null,
    p_parsed_schema                    in varchar2    default null,
    p_sql_error_code                   in number      default null,
    p_sql_error_message                in varchar2    default null );

procedure create_rt$pending_approvals (
    p_id                               in number      default null,
    p_approval_id                      in number      default null,
    p_client_state                     in varchar2    default null,
    p_row_version_number               in number      default null );

procedure create_rt$user_sessions (
    p_id                               in number      default null,
    p_approval_id                      in number      default null,
    p_apex_session_id                  in number      default null,
    p_bearer_token                     in varchar2    default null,
    p_refresh_token                    in varchar2    default null,
    p_token_expiry                     in timestamp   default null,
    p_refresh_expiry                   in timestamp   default null,
    p_client_state                     in varchar2    default null,
    p_row_version_number               in number      default null );

procedure create_sw_detail_results (
    p_id                               in number      default null,
    p_result_id                        in number      default null,
    p_file_id                          in number      default null,
    p_seq_id                           in number      default null,
    p_stmt_num                         in number      default null,
    p_stmt_text                        in clob        default null,
    p_result                           in clob        default null,
    p_result_size                      in number      default null,
    p_result_rows                      in number      default null,
    p_msg                              in varchar2    default null,
    p_success                          in varchar2    default null,
    p_failure                          in varchar2    default null,
    p_started                          in date        default null,
    p_start_time                       in number      default null,
    p_ended                            in date        default null,
    p_end_time                         in number      default null,
    p_run_complete                     in varchar2    default null,
    p_last_updated                     in date        default null );

procedure create_sw_results (
    p_id                               in number      default null,
    p_file_id                          in number      default null,
    p_job_id                           in number      default null,
    p_run_by                           in varchar2    default null,
    p_run_as                           in varchar2    default null,
    p_started                          in date        default null,
    p_start_time                       in number      default null,
    p_ended                            in date        default null,
    p_end_time                         in number      default null,
    p_status                           in varchar2    default null,
    p_run_comments                     in varchar2    default null );

procedure create_sw_sql_cmds (
    p_id                               in number      default null,
    p_command                          in clob        default null,
    p_parsed_schema                    in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null );

procedure create_sw_stmts (
    p_id                               in number      default null,
    p_file_id                          in number      default null,
    p_stmt_number                      in number      default null,
    p_src_line_number                  in number      default null,
    p_offset                           in number      default null,
    p_length                           in number      default null,
    p_stmt_class                       in number      default null,
    p_stmt_id                          in number      default null,
    p_isrunnable                       in varchar2    default null,
    p_stmt_vc2                         in varchar2    default null,
    p_stmt                             in clob        default null );

procedure create_qs_saved_model (
    p_id                               in number      default null,
    p_row_version                      in integer     default null,
    p_name                             in varchar2    default null,
    p_description                      in varchar2    default null,
    p_model                            in clob        default null,
    p_created                          in date        default null,
    p_created_by                       in varchar2    default null,
    p_updated                          in date        default null,
    p_updated_by                       in varchar2    default null );

procedure create_user_access_log1$ (
    p_login_name                       in varchar2    default null,
    p_auth_method                      in varchar2    default null,
    p_app                              in number      default null,
    p_owner                            in varchar2    default null,
    p_access_date                      in date        default null,
    p_ip_address                       in varchar2    default null,
    p_remote_user                      in varchar2    default null,
    p_auth_result                      in number      default null,
    p_custom_status_text               in varchar2    default null );

procedure create_user_access_log2$ (
    p_login_name                       in varchar2    default null,
    p_auth_method                      in varchar2    default null,
    p_app                              in number      default null,
    p_owner                            in varchar2    default null,
    p_access_date                      in date        default null,
    p_ip_address                       in varchar2    default null,
    p_remote_user                      in varchar2    default null,
    p_auth_result                      in number      default null,
    p_custom_status_text               in varchar2    default null );

procedure create_models (
    p_id                               in number      default null,
    p_session_id                       in number      default null,
    p_flow_id                          in number      default wwv_flow.g_flow_id,
    p_owner                            in varchar2    default null,
    p_name                             in varchar2    default null,
    p_model_complete                   in varchar2    default null,
    p_created_by                       in varchar2    default null,
    p_created_on                       in date        default null,
    p_last_updated_by                  in varchar2    default null,
    p_last_updated_on                  in date        default null );

function varchar2_to_blob(
    p_varchar2s                        in sys.dbms_sql.varchar2_table)
    return blob;

function varchar2_to_clob (
    p_varchar2s                        in sys.dbms_sql.varchar2_table )
    return clob;

procedure clear_blobs;

procedure set_blob (
    p_column_name                       in varchar2,
    p_elements                          in wwv_flow_t_varchar2  );

function get_blob(
    p_column_name                      in varchar2 )
    return blob;

--==============================================================================
procedure component_begin (
    p_version_yyyy_mm_dd               in varchar2,
    p_release                          in varchar2    default null,
    p_default_workspace_id             in number,
    p_default_application_id           in number      default null,
    p_default_id_offset                in number      default null,
    p_default_owner                    in varchar2    default null );

--==============================================================================
procedure component_end (
    p_auto_install_sup_obj             in boolean     default false,
    p_is_component_import              in boolean     default false );

--==============================================================================
procedure import_begin (
    p_version_yyyy_mm_dd               in varchar2,
    p_release                          in varchar2    default null,
    p_default_workspace_id             in number,
    p_default_application_id           in number      default null,
    p_default_id_offset                in number      default null,
    p_default_owner                    in varchar2    default null );
--==============================================================================
procedure import_end (
    p_auto_install_sup_obj             in boolean     default false,
    p_is_component_import              in boolean     default false );

--
-- *** API Deprecated, use wwv_flow_imp.create_app_static_file, create_workspace_static_file instead ***
--
procedure create_or_remove_file (
    p_name                      in varchar2,
    p_varchar2_table            in sys.dbms_sql.varchar2_table default empty_varchar2_table,
    p_mimetype                  in varchar2 default null,
    p_location                  in varchar2 default 'WORKSPACE',
    p_flow_id                   in number   default null,
    p_nlang                     in varchar2 default null,
    p_height                    in number   default null,
    p_width                     in number   default null,
    p_notes                     in varchar2 default '',
    p_mode                      in varchar2 default 'CREATE_OR_REPLACE',
    p_type                      in varchar2 default 'STATIC')
    ;

--==============================================================================
-- convert a GMT date string to a local TZ date
--==============================================================================
function dz (
    p_yyyymmddhh24miss varchar2 )
    return date;
end wwv_flow_imp;
/
show errors;
