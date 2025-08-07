set define off verify off
prompt ...wwv_flow
create or replace package wwv_flow as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2024, Oracle and/or its affiliates.
--
-- The `APEX_APPLICATION` package is a PL/SQL package that implements the Oracle APEX rendering engine.
-- You can use this package to take advantage of many global variables.
--
-- Filename: core/flow.sql
--
--! This program shows and accepts Oracle APEX pages.
--! The Oracle APEX engine is also known as the flows engine.
--! Frequently called from the procedure f.
--
--! RUNTIME DEPLOYMENT: YES
--
-- Modified:
-- mhichwa   08/04/1999 - Created
--
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Global Variables:
-- Global variables available in `APEX_APPLICATION`.
--! Everything in the following section is documented publicly!
--------------------------------------------------------------------------------
-- Specifies the currently logged in user.
g_user                         varchar2(32767);
-- Specifies the ID of the currently running application.
g_flow_id                      number;
-- Specifies the ID of the currently running page.
g_flow_step_id                 number;
-- Defaults to the application's parsing schema. Use `#APEX$LITERAL$OWNER#` to reference this value in SQL queries and PL/SQL.
-- <br/>
-- **Note:** Changing `G_FLOW_OWNER` at runtime does not change the parsing schema.
g_flow_owner                   wwv_flows.owner%type;
-- Specifies the value of the request variable most recently passed to or set within the show or accept modules.
g_request                      varchar2(32767);
-- Refers to the web browser's current language preference.
g_browser_language             varchar2(32767);
-- Refers to whether debugging is switched on or off. Valid values for the `DEBUG` flag are `Yes` or `No`.
-- <br/>Enabling debug shows details about application processing.
g_debug                        boolean := false;
-- Refers to the home page of an application. If no page is given and if no alternative page is dictated by the
-- authentication scheme's logic, the Oracle APEX engine redirects to this location.
g_home_link                    varchar2(32767);
-- Used to display a link to a login page for users that are not currently logged in.
g_login_url                    varchar2(32767);
-- Refers to the virtual path the web server uses to point to the images directory distributed with APEX.
g_image_prefix                 varchar2(32767)        := wwv_flow_global.g_image_prefix;
-- Refers to the owner of the APEX schema.
g_flow_schema_owner            constant varchar2(11)  := 'APEX_240200';
-- Refers to whether the APEX engine is running in print view mode.
-- This setting can be referenced in conditions to eliminate elements not desired in a
-- printed document from a page.
-- If `TRUE`, use a printer-friendly page template.
g_printer_friendly             boolean := false;
-- Refers to the application attribute Proxy Server.
g_proxy_server                 varchar2(32767);
-- Refers to the current date on the database server. `G_SYSDATE` uses the DATE datatype.
g_sysdate                      constant date          := sysdate;
 -- Refers to the Oracle schema used to connect to the database through the database access descriptor (DAD).
g_public_user                  varchar2(32767);
 -- Specifies the application's global notification attribute.
g_global_notification          varchar2(32767);
-- Specifies the values of the `X01`, ... `X10` variables most recently passed
-- to or set within the `show` or `accept` modules.
-- You typically use these variables in On-Demand AJAX processes.
g_x01 /*, ... g_x10*/          varchar2(32767);
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Data Types:
--------------------------------------------------------------------------------
-- Internal:
type flow_vc_arr is table of varchar2(32767) index by binary_integer;
     empty_flow_vc_arr flow_vc_arr;
-- Internal:
empty_vc_arr wwv_flow_global.vc_arr2;
-- Internal:
type vc_long_arr is table of varchar2(32767) index by binary_integer;
-- Internal:
empty_vc_long_arr vc_long_arr;
-- Internal:
type clob_arr      is table of clob index by binary_integer;
-- Internal:
type vc_assoc_arr  is table of varchar2(32767) index by varchar2(255);
-- Internal:
type num_assoc_arr is table of number index by varchar2(255);
--------------------------------------------------------------------------------
--
-- Attributes:
-- * type:  APEX dictionary view name of the component where an error occurred.
--          For example `APEX_APPLICATION_PAGE_PROC`.
-- * id:    Internal component ID which triggered the error. The ID is always the
--          ID of the primary application.
-- * name:  Name of the component which triggered the error like the process name.
--------------------------------------------------------------------------------
-- Internal:
type t_component is record (
type varchar2(30),
id   number,
name varchar2(32767)
);
-- Internal:
empy_component constant t_component := t_component( type => null, id => null, name => null );
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Globals for generic and public use
--------------------------------------------------------------------------------
--
-- N.B. g_image_prefix moved to the documented Global Variables section
-- g_image_prefix                 varchar2(32767) := wwv_flow_global.g_image_prefix;
--
-- Internal:
g_files_version                varchar2(32767);
-- Internal:
g_company_images               varchar2(32767);
-- Internal:
g_flow_images                  varchar2(32767);
-- Internal:
g_theme_file_prefix            varchar2(32767);
-- Internal:
g_id                           number;
-- Internal:
g_notification                 varchar2(32767);
--
-- N.B. g_global_notification moved to the documented Global Variables section
-- g_global_notification          varchar2(32767);
--
-- Internal:
g_value                        varchar2(32767);
--
-- N.B. g_sysdate moved to the documented Global Variables section
-- g_sysdate                      constant date      := sysdate;
--
-- Internal:
c_systimestamp                 constant timestamp := systimestamp;
-- Internal:
g_boolean                      boolean            := false;
-- Internal:
g_excel_format                 boolean            := false;
-- Internal:
g_error_message_override       varchar2(32767);         -- if set programmatically overrides process error messages
-- Internal:
g_unique_page_id               number;
-- Internal:
g_form_painted                 boolean := false;
-- Internal:
g_print_success_message        varchar2(32767);
-- Internal:
g_return_key_1                 varchar2(32767);         -- used to return keys from dml operations
-- Internal:
g_return_key_2                 varchar2(32767);         -- used to return keys from dml operations
-- Internal:
g_base_href                    varchar2(32767);         -- BASE HREF for APEX references
-- Internal:
g_edition                      wwv_flow_global.t_dbms_id;
-- Internal:
g_timestamp_tz                 timestamp with time zone;
-- Internal:
CR                             constant varchar2(1) := unistr('\000d');
-- Internal:
LF                             constant varchar2(1) := unistr('\000a');
-- Internal:
CRLF                           constant varchar2(2) := unistr('\000d\000a');
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Translated Strings
--------------------------------------------------------------------------------
-- Internal:
g_nls_edit                     varchar2(32767) := 'Edit';
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Optimization and performance feedback information
--------------------------------------------------------------------------------
-- Internal:
g_form_count                   pls_integer := 0;
-- Internal:
g_ok_to_cache_sql              boolean := false;
-- Internal:
g_page_text_generated          boolean := false;
-- Internal:
g_import_in_progress           boolean := false;
-- Internal:
g_workspace_delete_in_progress boolean := false;
-- Internal:
g_cached_region_count          pls_integer := 0;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Debug and error page information
--------------------------------------------------------------------------------
--
-- N.B. g_debug moved to the documented Global Variables section
--g_debug                        boolean := false;        -- identifies if flow is running in debug mode
--
-- Internal:
g_unrecoverable_error          boolean := false;        -- NOTE: This global variable is deprecated,
                                                        -- use apex_application.stop_apex_engine instead!
-- Internal:
g_last_query_text              varchar2(32767);         -- if set is the last user sql query executed
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Authentication and login, logout info
--------------------------------------------------------------------------------
-- N.B. g_user moved to the documented Global Variables section
--g_user                         varchar2(32767);         -- corresponds to username used to login
--
-- Internal:
g_user_known_as                varchar2(32767);
--
-- N.B. g_flow_schema moved to the documented Global Variables section
-- g_flow_schema_owner            constant varchar2(11)  := 'APEX_240100'; -- the owner of Oracle APEX
--
-- N.B. g_login_url moved to the documented Global Variables section
-- g_login_url                    varchar2(32767);
--
-- Internal:
g_logout_url                   varchar2(32767);
-- Internal:
g_logo_type                    varchar2(2);
-- Internal:
g_logo                         varchar2(32767);
-- Internal:
g_logo_text                    varchar2(32767);
-- Internal:
g_app_builder_icon_name        varchar2(32767);
-- Internal:
g_use_zero_sid                 boolean := false;
-- Internal:
g_public_auth_scheme           boolean := false;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Optimistic Locking Globals
--------------------------------------------------------------------------------
-- Internal:
g_md5_checksum                 varchar2(32767) := '0';
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Spatial Globals
--------------------------------------------------------------------------------
-- Internal:
g_map1                         wwv_flow_global.vc_arr2;
-- Internal:
g_map2                         wwv_flow_global.vc_arr2;
-- Internal:
g_map3                         wwv_flow_global.vc_arr2;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Pagination Globals
--------------------------------------------------------------------------------
-- Internal:
g_rownum                       pls_integer := 0;
-- Internal:
g_flow_current_min_row         pls_integer := 1;
-- Internal:
g_flow_current_max_rows        pls_integer := 10;
-- Internal:
g_flow_current_rows_fetched    pls_integer := 0;
-- Internal:
g_flow_total_row_count         pls_integer := 0;
-- Internal:
g_pagination_buttons_painted   boolean := false;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Tabular Form Globals
--------------------------------------------------------------------------------
-- Internal:
g_item_idx_offset              number := 0;
-- Internal:
g_rownum_offset                number := 0;
-- Internal:
g_fmap                         num_assoc_arr;
-- Internal:
g_fhdr                         wwv_flow_global.vc_arr2;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Sorting Globals
--------------------------------------------------------------------------------
-- Internal:
g_fsp_region_id                number := 0;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Translation (NLS) Globals
--------------------------------------------------------------------------------
-- Internal:
g_flow_language                varchar2(32767);        -- language flow written in (primary language)
-- Internal:
g_flow_language_derived_from   varchar2(30);           -- how the language preference of the user is determined
--
-- N.B. g_browser_language moved to the documented Global Variables section
--g_browser_language             varchar2(32767);        -- users language preference (set using lang_derived_from method)
--
-- Internal:
g_browser_version              varchar2(32767);        -- browser version
-- Internal:
g_translated_flow_id           number;                 -- flow ID for translated flow
-- Internal:
g_translated_page_id           number;                 -- page ID for translated flow, e.g. page_id.trans_flow_id
-- Internal:
g_translated_global_page_id    number;                 -- global page id for translated flow. e.g. page_id.trans_flow_id
-- Internal:
g_nls_date_format              varchar2(32767);        -- current database date format from nls_session_parameters table.
-- Internal:
g_nls_timestamp_format         varchar2(32767);        -- current database timestamp with time zone format from nls_session_parameters table.
-- Internal:
g_nls_timestamp_tz_format      varchar2(32767);        -- current database timestamp with time zone format from nls_session_parameters table.
-- Internal:
g_nls_decimal_separator        varchar2(10);           -- current database session decimal separator (derived from NLS_NUMERIC_CHARACTERS)
-- Internal:
g_nls_group_separator          varchar2(10);           -- current database session numeric group separator (derived from NLS_NUMERIC_CHARACTERS)
-- Internal:
g_nls_sort                     varchar2(32767);        -- NLS_SORT value for the current application
-- Internal:
g_nls_comp                     varchar2(32767);        -- NLS_COMP value for the current application
-- Internal:
g_direction_right_to_left      boolean := false;       -- calculated value indicates whether page is rendered right-to-left base on flows data or language data

--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Session Information
--------------------------------------------------------------------------------
-- Internal:
g_new_instance                 boolean := false;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Websheet Information
--------------------------------------------------------------------------------
-- Internal:
g_ws_app_id                   number;                   -- wwv_flow_ws_application pk
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Flow Information
--------------------------------------------------------------------------------
--
-- N.B. g_flow_id moved to the documented Global Variables section
--g_flow_id                      number;                  -- flow pk
--
-- Internal:
g_flow_theme_id                number;                  -- current theme for flow
-- Internal:
g_flow_alias                   varchar2(32767);         -- flow alphanumeric alias
--
--N.B. g_flow_step_id moved to the documented Global Variables section
--g_flow_step_id                 number;                  -- page pk
--
-- Internal:
g_page_alias                   varchar2(32767);         -- page alias
-- Internal:
g_instance                     number;                  -- flow session
-- Internal:
g_edit_cookie_session_id       number;                  -- flow builder session
-- Internal:
g_page_submitted               number;                  -- set when page posted
-- Internal:
g_exact_substitutions_only     varchar2(1);             -- Y or N
-- Internal:
g_arg_names                    wwv_flow_global.vc_arr2; -- array of item names
-- Internal:
g_arg_values                   wwv_flow_global.vc_arr2; -- array of item values
-- Internal:
g_flow_name                    varchar2(32767);         -- name of flow
-- Internal:
g_flow_charset                 varchar2(32767);         -- used in html header
-- Internal:
g_date_format                  varchar2(32767);         -- Application default date format
-- Internal:
g_date_time_format             varchar2(32767);         -- Application date time format
-- Internal:
g_timestamp_format             varchar2(32767);         -- Application default timestamp format
-- Internal:
g_timestamp_tz_format          varchar2(32767);         -- Application default timestamp with time zone format
-- Internal:
-- g_box_width                    varchar2(30);          -- obsolete ?
-- Internal:
g_default_page_template        varchar2(32767);         --
-- Internal:
g_default_dialog_page_template varchar2(32767);         -- Application Theme default dialog page template
-- Internal:
g_printer_friendly_template    varchar2(32767);         --
-- Internal:
g_error_template               varchar2(32767);         --
-- Internal:
g_webdb_logging                varchar2(30);            -- YES (insert entries into a log table), NO (do not do inserts)
--
-- N.B. g_public user moved to the documented Global Variables section
-- Internal:
--g_public_user                  varchar2(32767);         -- identifies public user name
-- Internal:
-- N.B. g_proxy_server moved to the documented Global Variables section
-- Internal:
--g_proxy_server                 varchar2(32767);         -- used for some regions of type url and web services
--
-- Internal:
g_no_proxy_domains             varchar2(32767);         -- used for some regions of type url and web services
-- Internal:
g_media_type                   varchar2(32767);         -- Media Type used in Content-Type HTTP header
-- Internal:
g_flow_version                 varchar2(32767);         --
-- Internal:
g_flow_status                  varchar2(30);            -- controls availability of flow
-- Internal:
g_build_status                 varchar2(30);            --
-- Internal:
g_friendly_url                 boolean := false;        -- should a friendly url be generated for the application
-- Internal:
g_rejoin_existing_sessions     varchar2(1);             -- wwv_flows.rejoin_existing_sessions
--
-- N.B. g_request moved to the documented Global Variables section
--
-- Internal:
--g_request                      varchar2(32767);         -- method of submitting page
-- Internal:
g_sqlerrm                      varchar2(32767);         -- unexpected sql error message to be logged into log tables
-- Internal:
g_err_comp_type                varchar2(32767);         -- sqlerrm_component_type identifies what type of component caused the error
-- Internal:
g_err_comp_name                varchar2(32767);         -- sqlerrm_component_name identifies the name of the component that raised the error
-- Internal:
g_cache_mode                   varchar2(1) := 'D';      -- R = rendered from cache, C = Cache Created, D = Dynamic
-- Internal:
g_auto_time_zone               varchar2(1);             -- automatic time zone (Y or N)
-- Internal:
g_default_error_display_loc    varchar2(40);            -- default error display location for validations
-- Internal:
g_javascript_file_urls         varchar2(32767);         -- application javascript file URLs #APPLICATION_JAVASCRIPT#
-- Internal:
g_include_legacy_javascript    wwv_flows.include_legacy_javascript%type; -- should legacy javascript functions be included?
-- Internal:
g_include_jquery_migrate       boolean := false;        -- should the jQuery Migrate plug-in be included?
-- Internal:
g_css_file_urls                varchar2(32767);         -- application css file URLs #APPLICATION_CSS#
-- Internal:
g_built_with_love_using_apex   boolean := false;        -- show Built with Love using Oracle APEX?
-- Internal:
g_auto_dismiss_success_msg     boolean := false;        -- dismiss success messages
-- Internal:
g_email_from                   varchar2(32767);
-- Internal:
g_oracle_text_function         varchar2(500);
-- Internal:
g_favicons                     varchar2(32767);         -- (Deprecated)
-- Internal:
g_global_page_id               number;
-- Internal:
g_shared_components_scn        number;
-- Internal:
g_json_response                boolean default false;   -- should the output of the accept procedure be in JSON
-- Internal:
g_allow_feedback               boolean := false;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Page Information
--------------------------------------------------------------------------------
-- Internal:
g_popup_filter                 varchar2(32767);         --
--
-- N.B. g_printer_friendly moved to the documented Global Variables section
-- g_printer_friendly             boolean := false;        -- if true use printer friendly page template
--
-- Internal:
g_first_field_displayable      boolean := false;        --
-- Internal:
g_step_name                    varchar2(32767);         -- page name
-- Internal:
g_step_tab_set                 varchar2(32767);         -- page current tab set
-- Internal:
g_step_title                   varchar2(32767);         -- page title typically becomes html page title
-- Internal:
g_step_media_type              varchar2(32767);         -- Media Type used in Content-Type HTTP header
-- Internal:
g_step_first_item              varchar2(32767);         -- name of item to put cursor in
-- Internal:
g_step_welcome_text            varchar2(32767);         -- wwv_flow_steps.welcome_text displayed after page template header
-- Internal:
g_step_box_welcome_text        varchar2(32767);         -- wwv_flow_steps.box_welcome_text displayed before #BODY# in page template body
-- Internal:
g_step_footer_text             varchar2(32767);         -- wwv_flow_steps.footer_text displayed before showing page template footer
-- Internal:
g_step_template                varchar2(32767);         -- page template
-- Internal:
g_page_css_classes             varchar2(32767);         -- page css classes
-- Internal:
g_page_template_options        varchar2(32767);         -- page template options
-- Internal:
g_step_required_role           varchar2(32767);         -- priv required to view page
-- Internal:
g_allow_duplicate_submissions  varchar2(3);             -- Y or N
-- Internal:
g_reload_on_submit             varchar2(1);             -- A=Always), S=Only for Success
-- Internal:
g_warn_on_unsaved_changes      boolean := true;
-- Internal:
g_head                         varchar2(32767);         -- page header for CSS, etc. #HEAD#
-- Internal:
g_page_onload                  varchar2(32767);         -- allows control over #ONLOAD# in page template
-- Internal:
g_step_javascript_file_urls    varchar2(32767);         -- page specific javascript file URLs #PAGE_JAVASCRIPT#
-- Internal:
g_javascript_code              varchar2(32767);         -- page specific javascript #PAGE_JAVASCRIPT#
-- Internal:
g_javascript_code_onload       varchar2(32767);         -- javascript code execute onload
-- Internal:
g_step_css_file_urls           varchar2(32767);         -- page specific CSS file URLs #PAGE_CSS#
-- Internal:
g_step_inline_css              varchar2(32767);         -- page specific inline CSS #PAGE_CSS#
-- Internal:
g_autocomplete_on_off          varchar2(3);             -- should autocomplete="off" be included in form tag
-- Internal:
g_include_apex_css_js_yn       varchar2(1);             -- Y is default, N does not include standard apex css and js files for mobile devices
-- Internal:
g_browser_cache                boolean;                 -- If false (the default) this sends the cache-control: no-store http response in wwv_flow.show
-- Internal:
g_browser_frame                varchar2(1);             -- If D, send X-Frame-Options:DENY header, if S, send X-Frame-Options:SAMEORIGIN header
-- Internal:
g_compatibility_mode           number;                  -- Compatibility Mode which contains a version number is used to determine how the runtime engine should behave when the application is executed
-- Internal:
g_page_mode                    varchar2(20);
-- Internal:
g_dialog_height                varchar2(20);
-- Internal:
g_dialog_width                 varchar2(20);
-- Internal:
g_dialog_max_width             varchar2(20);
-- Internal:
g_dialog_title                 varchar2(32767);
-- Internal:
g_dialog_css_classes           varchar2(32767);
-- Internal:
g_dialog_attributes            varchar2(32767);
-- Internal:
g_navigation_list_id           number;
-- Internal:
g_navigation_list_position     wwv_flows.navigation_list_position%type;
-- Internal:
g_navigation_list_template_id  number;
-- Internal:
g_nav_list_template_options    wwv_flows.nav_list_template_options%type;
-- Internal:
g_nav_bar_type                 wwv_flows.nav_bar_type%type;              -- Navigation Bar Type: Render either as a List or a Navigation Bar
-- Internal:
g_nav_bar_list_id              number;                                                  -- Navigation Bar List ID: where type is set to List
-- Internal:
g_nav_bar_list_template_id     number;                                                  -- Navigation Bar List Template ID: where type is set to List
-- Internal:
g_nav_bar_template_options     wwv_flows.nav_bar_template_options%type;  -- Navigation Bar List Template Options: where type is set to List
-- Do only use this constant for the parameter p_compatibility_mode in wwv_flow_imp.create_flow!
-- It's a string and would result in NLS errors if you compare it against g_compatibility_mode
-- Internal:
c_current_compatibility_mode   constant varchar2(4) := '24.2';

--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Computation Result
--------------------------------------------------------------------------------
-- Internal:
g_computation_result_vc       varchar2(32767);
-- Internal:
g_computation_result_vc_arr   wwv_flow_global.vc_arr2;
-- Internal:
g_computation_result_clob     clob;
-- Internal:
g_computation_result_num      number;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Validations
--------------------------------------------------------------------------------
-- Internal:
g_column_ids_in_error         wwv_flow_global.vc_arr2;
-- if g_execute_validations is programmatically set before the validations
-- are evaluated then this flag will determin if built-in validations and the
-- validations defined for the page are evaluated. If set to NULL, the
-- "Execute Validations" flag for buttons and select lists/radio groups will
-- be evaluated
-- Internal:
g_execute_validations         boolean default null;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Global input values for updatable reports
--------------------------------------------------------------------------------
-- Internal:
g_f01             wwv_flow_global.vc_arr2;
-- Internal:
g_f02             wwv_flow_global.vc_arr2;
-- Internal:
g_f03             wwv_flow_global.vc_arr2;
-- Internal:
g_f04             wwv_flow_global.vc_arr2;
-- Internal:
g_f05             wwv_flow_global.vc_arr2;
-- Internal:
g_f06             wwv_flow_global.vc_arr2;
-- Internal:
g_f07             wwv_flow_global.vc_arr2;
-- Internal:
g_f08             wwv_flow_global.vc_arr2;
-- Internal:
g_f09             wwv_flow_global.vc_arr2;
-- Internal:
g_f10             wwv_flow_global.vc_arr2;
-- Internal:
g_f11             wwv_flow_global.vc_arr2;
-- Internal:
g_f12             wwv_flow_global.vc_arr2;
-- Internal:
g_f13             wwv_flow_global.vc_arr2;
-- Internal:
g_f14             wwv_flow_global.vc_arr2;
-- Internal:
g_f15             wwv_flow_global.vc_arr2;
-- Internal:
g_f16             wwv_flow_global.vc_arr2;
-- Internal:
g_f17             wwv_flow_global.vc_arr2;
-- Internal:
g_f18             wwv_flow_global.vc_arr2;
-- Internal:
g_f19             wwv_flow_global.vc_arr2;
-- Internal:
g_f20             wwv_flow_global.vc_arr2;
-- Internal:
g_f21             wwv_flow_global.vc_arr2;
-- Internal:
g_f22             wwv_flow_global.vc_arr2;
-- Internal:
g_f23             wwv_flow_global.vc_arr2;
-- Internal:
g_f24             wwv_flow_global.vc_arr2;
-- Internal:
g_f25             wwv_flow_global.vc_arr2;
-- Internal:
g_f26             wwv_flow_global.vc_arr2;
-- Internal:
g_f27             wwv_flow_global.vc_arr2;
-- Internal:
g_f28             wwv_flow_global.vc_arr2;
-- Internal:
g_f29             wwv_flow_global.vc_arr2;
-- Internal:
g_f30             wwv_flow_global.vc_arr2;
-- Internal:
g_f31             wwv_flow_global.vc_arr2;
-- Internal:
g_f32             wwv_flow_global.vc_arr2;
-- Internal:
g_f33             wwv_flow_global.vc_arr2;
-- Internal:
g_f34             wwv_flow_global.vc_arr2;
-- Internal:
g_f35             wwv_flow_global.vc_arr2;
-- Internal:
g_f36             wwv_flow_global.vc_arr2;
-- Internal:
g_f37             wwv_flow_global.vc_arr2;
-- Internal:
g_f38             wwv_flow_global.vc_arr2;
-- Internal:
g_f39             wwv_flow_global.vc_arr2;
-- Internal:
g_f40             wwv_flow_global.vc_arr2;
-- Internal:
g_f41             wwv_flow_global.vc_arr2;
-- Internal:
g_f42             wwv_flow_global.vc_arr2;
-- Internal:
g_f43             wwv_flow_global.vc_arr2;
-- Internal:
g_f44             wwv_flow_global.vc_arr2;
-- Internal:
g_f45             wwv_flow_global.vc_arr2;
-- Internal:
g_f46             wwv_flow_global.vc_arr2;
-- Internal:
g_f47             wwv_flow_global.vc_arr2;
-- Internal:
g_f48             wwv_flow_global.vc_arr2;
-- Internal:
g_f49             wwv_flow_global.vc_arr2;
-- Internal:
g_f50             wwv_flow_global.vc_arr2;
-- Internal:
g_fcs             wwv_flow_global.vc_arr2;
-- Internal:
g_fcud            wwv_flow_global.vc_arr2;
-- Internal:
g_frowid          wwv_flow_global.vc_arr2;
-- Internal:
g_survey_map      varchar2(32767);
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Global input variables for AJAX utilities
--------------------------------------------------------------------------------
-- Internal:
g_widget_name       varchar2(32767);
-- Internal:
g_widget_mod        varchar2(32767);
-- Internal:
g_widget_action     varchar2(32767);
-- Internal:
g_widget_action_mod	varchar2(32767);
-- Internal:
g_widget_num_return	varchar2(32767);
-- Internal:
g_widget_view_mode  varchar2(32767);
--
-- N.B. g_x01 moved to the documented Global Variables section
-- g_x01 ... g_x10 mentioned in documented Global Variables section
--
-- Internal:
g_x02             varchar2(32767);
-- Internal:
g_x03             varchar2(32767);
-- Internal:
g_x04             varchar2(32767);
-- Internal:
g_x05             varchar2(32767);
-- Internal:
g_x06             varchar2(32767);
-- Internal:
g_x07             varchar2(32767);
-- Internal:
g_x08             varchar2(32767);
-- Internal:
g_x09             varchar2(32767);
-- Internal:
g_x10             varchar2(32767);
-- Internal:
g_x11             varchar2(32767);
-- Internal:
g_x12             varchar2(32767);
-- Internal:
g_x13             varchar2(32767);
-- Internal:
g_x14             varchar2(32767);
-- Internal:
g_x15             varchar2(32767);
-- Internal:
g_x16             varchar2(32767);
-- Internal:
g_x17             varchar2(32767);
-- Internal:
g_x18             varchar2(32767);
-- Internal:
g_x19             varchar2(32767);
-- Internal:
g_x20             varchar2(32767);
-- Internal:
g_clob_01         clob;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Session Timeout
--------------------------------------------------------------------------------
-- Internal:
g_max_session_length_sec        number;
-- Internal:
g_max_session_idle_sec          number;
-- Internal:
g_session_timeout_warning_sec   number;
--------------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Global array of form item values fetched by automated row fetch processes
-- and other globals previously in wwv_flow_dml
--------------------------------------------------------------------------------
-- Internal:
g_column_values             flow_vc_arr;
-- Internal:
g_clob_column_values        clob_arr;
-- Internal:
g_dml_blob                  blob;
-- Internal:
g_dml_mimetype              varchar2(32767);
-- Internal:
g_dml_filename              varchar2(32767);
-- Internal:
g_dml_charset               varchar2(32767);
-- Internal:
g_dml_last_updated_date     date;
-- Internal:
g_dml_clob_text             clob;
-- Internal:
g_dml_varchar32767_text     varchar2(32767);
-- Internal:
g_dml_rowid                 varchar2(32767);
-- Internal:
g_dml_blob_length           number := 0;
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Stop APEX Engine
--------------------------------------------------------------------------------
-- Internal:
c_stop_apex_engine_no constant pls_integer := -20876;
-- Internal:
e_stop_apex_engine    exception;
-- Internal:
pragma exception_init(e_stop_apex_engine, -20876);
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Will be removed in 5.2
--------------------------------------------------------------------------------
-- Internal:
g_json wwv_flow_global.vc_arr2;
--------------------------------------------------------------------------------
--
--==============================================================================
-- Return global flags that were previously exposed as variables
--==============================================================================
-- Internal:
function g_in_accept
    return boolean;

--==============================================================================
-- Internal:
function g_in_process
    return boolean;

--------------------------------------------------------------------------------
-- Internal:
--
-- This procedure is the entry point for the display of Oracle APEX pages.
--
--
-- p_request              -- Request which can be the tab pressed, the button pressed, an
--                           arbitrary value etc.
-- p_instance             -- Flow Session ID, must be numeric.
-- p_flow_id              -- Flow ID, must be numeric.
-- p_flow_step_id         -- Page ID, must be numeric (for example: 1)
-- p_debug                -- If "YES" then flows will display debug messages.
-- p_arg_names            -- Comma seperated list of flow item names.  Item names should
--                           have corresponding (p_arg_values) values.  For example:
--                           p_arg_names => 'A,B,C'
--                           p_arg_values=> '1,2,3'
--                           This assumes that a flow or page item called A, B, and C
--                           exists.  When called a value of 1 will be assigned to A,
--                           2 to B, etc.
-- p_arg_values           -- Comma seperated list of values that corresponds to a
--                           comma seperated list of names (p_arg_names).  The session
--                           state for the flow items identified will be set to these
--                           values.
-- p_arg_name             -- use when passing one item name, itentifies a single item name
-- p_arg_value            -- use when passing one item value, identifies a single item value
-- p_clear_cache          -- Comma seperated list of pages (e.g. 2,3,4).
--                           Sets to null the values of any flow item declared for a
--                           list of pages.
-- p_box_border           -- obsolete
-- p_printer_friendly     -- If "YES" then show page using printer friendly template.
--                           Do not generate tabs or nav bar icons.
-- p_trace                -- If "YES", generate trace file for debugging and performance tuning
-- p_company              -- ID of company (security group id) must be numeric
-- p_md5_checksum         -- checksum to prevent lost updates
-- p_last_button_pressed  -- facilitates reference to :flow_last_button_pressed
-- p_dialog_cs            -- check sum for modal dialog page to allow use of iframe when Embed in Frame security setting is DENY
--------------------------------------------------------------------------------
procedure show (
    p_request             in varchar2   default null,
    p_instance            in varchar2   default null,
    p_flow_id             in varchar2   default null,
    p_flow_step_id        in varchar2   default null,
    p_debug               in varchar2   default 'NO',
    p_arg_names           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_arg_values          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_clear_cache         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_box_border          in varchar2   default '0',
    p_printer_friendly    in varchar2   default 'NO',
    p_trace               in varchar2   default 'NO',
    p_company             in varchar2   default null,
    p_md5_checksum        in varchar2   default '0',
    p_last_button_pressed in varchar2   default null,
    p_arg_name            in varchar2   default null,
    p_arg_value           in varchar2   default null,
    f01                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f02                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f03                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f04                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f05                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f06                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f07                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f08                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f09                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f10                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f11                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f12                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f13                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f14                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f15                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f16                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f17                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f18                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f19                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f20                   in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_widget_name         in varchar2   default null,
    p_widget_mod          in varchar2   default null,
    p_widget_action       in varchar2   default null,
    p_widget_action_mod   in varchar2   default null,
    p_widget_num_return   in varchar2   default null,
    p_widget_view_mode    in varchar2   default null,
    p_fsp_region_id       in varchar2   default null,
    p_pg_min_row          in varchar2   default null,
    p_pg_max_rows         in varchar2   default null,
    p_pg_rows_fetched     in varchar2   default null,
    p_time_zone           in varchar2   default null,
    x01                   in varchar2   default null,
    x02                   in varchar2   default null,
    x03                   in varchar2   default null,
    x04                   in varchar2   default null,
    x05                   in varchar2   default null,
    x06                   in varchar2   default null,
    x07                   in varchar2   default null,
    x08                   in varchar2   default null,
    x09                   in varchar2   default null,
    x10                   in varchar2   default null,
    x11                   in varchar2   default null,
    x12                   in varchar2   default null,
    x13                   in varchar2   default null,
    x14                   in varchar2   default null,
    x15                   in varchar2   default null,
    x16                   in varchar2   default null,
    x17                   in varchar2   default null,
    x18                   in varchar2   default null,
    x19                   in varchar2   default null,
    x20                   in varchar2   default null,
    p_json                in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_clob_01             in clob       default null,
    p_lang                in varchar2   default null,
    p_territory           in varchar2   default null,
    p_cs                  in varchar2   default null,
    j                     in varchar2   default null,
    XMLCallDate           in varchar2   default null,
    p_dialog_cs           in varchar2   default null,
    p_context             in varchar2   default null );


----------------------------------------------------------------------------
-- A C C E P T
-- Internal:
--
-- This procedure accepts virtually every flow page.
-- Reference show procedure for input argument descriptions.
--
--
-- Internal:
--

procedure accept (
    p_request          in varchar2 default null,
    p_instance         in varchar2 default null,
    p_flow_id          in varchar2 default null,
    p_company          in number   default null,
    p_flow_step_id     in varchar2 default null,
    p_reload_on_submit in varchar2 default 'A',
    p_arg_names        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_arg_values       in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_json             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_files            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f01             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f02             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f03             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f04             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f05             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f06             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f07             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f08             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f09             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f10             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f11             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f12             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f13             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f14             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f15             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f16             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f17             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f18             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f19             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f20             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f21             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f22             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f23             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f24             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f25             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f26             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f27             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f28             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f29             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f30             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f31             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f32             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f33             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f34             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f35             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f36             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f37             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f38             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f39             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f40             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f41             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f42             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f43             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f44             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f45             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f46             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f47             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f48             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f49             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f50             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    fcs             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    fmap            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    fhdr            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    fcud            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    frowid          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    x01             in varchar2   default null,
    x02             in varchar2   default null,
    x03             in varchar2   default null,
    x04             in varchar2   default null,
    x05             in varchar2   default null,
    x06             in varchar2   default null,
    x07             in varchar2   default null,
    x08             in varchar2   default null,
    x09             in varchar2   default null,
    x10             in varchar2   default null,
    x11             in varchar2   default null,
    x12             in varchar2   default null,
    x13             in varchar2   default null,
    x14             in varchar2   default null,
    x15             in varchar2   default null,
    x16             in varchar2   default null,
    x17             in varchar2   default null,
    x18             in varchar2   default null,
    x19             in varchar2   default null,
    x20             in varchar2   default null,
    p_listener      in wwv_flow_global.vc_arr2 default empty_vc_arr, -- used to communicate with apex listner
    p_map1          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_map2          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_map3          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_debug              in varchar2 default 'NO',
    p_trace              in varchar2 default 'NO',
    p_page_submission_id in varchar2 default null,
    p_time_zone          in varchar2 default null,
    p_ignore_01     in varchar2 default null,
    p_ignore_02     in varchar2 default null,
    p_ignore_03     in varchar2 default null,
    p_ignore_04     in varchar2 default null,
    p_ignore_05     in varchar2 default null,
    p_ignore_06     in varchar2 default null,
    p_ignore_07     in varchar2 default null,
    p_ignore_08     in varchar2 default null,
    p_ignore_09     in varchar2 default null,
    p_ignore_10     in varchar2 default null,
    p_lang          in varchar2 default null,
    p_territory     in varchar2 default null,
    p_dialog_cs     in varchar2 default null,
    p_context       in varchar2 default null );

--==============================================================================
-- Internal:
-- This procedure is used for Ajax requests where p_json contains a JSON document
-- with all the necessary information to dispatch the Ajax request(s) to the
-- different components.
--==============================================================================
procedure ajax (
    p_flow_id           in varchar2 default null,
    p_flow_step_id      in varchar2 default null,
    p_instance          in varchar2 default null,
    p_debug             in varchar2 default 'NO',
    p_trace             in varchar2 default 'NO',
    p_request           in varchar2 default null,
    p_arg_names         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_arg_values        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_json              in wwv_flow_global.vc_arr2 default empty_vc_arr,
    x01                 in varchar2 default null,
    x02                 in varchar2 default null,
    x03                 in varchar2 default null,
    x04                 in varchar2 default null,
    x05                 in varchar2 default null,
    x06                 in varchar2 default null,
    x07                 in varchar2 default null,
    x08                 in varchar2 default null,
    x09                 in varchar2 default null,
    x10                 in varchar2 default null,
    x11                 in varchar2 default null,
    x12                 in varchar2 default null,
    x13                 in varchar2 default null,
    x14                 in varchar2 default null,
    x15                 in varchar2 default null,
    x16                 in varchar2 default null,
    x17                 in varchar2 default null,
    x18                 in varchar2 default null,
    x19                 in varchar2 default null,
    x20                 in varchar2 default null,
    f01                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f02                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f03                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f04                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f05                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f06                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f07                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f08                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f09                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f10                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f11                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f12                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f13                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f14                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f15                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f16                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f17                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f18                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f19                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    f20                 in wwv_flow_global.vc_arr2 default empty_vc_arr,
    -- For backward compatibility, don't use for new apps
    p_clob_01           in clob     default null,
    p_widget_name       in varchar2 default null,
    p_widget_mod        in varchar2 default null,
    p_widget_action     in varchar2 default null,
    p_widget_action_mod in varchar2 default null,
    p_widget_num_return in varchar2 default null,
    p_widget_view_mode  in varchar2 default null,
    p_fsp_region_id     in varchar2 default null,
    p_clear_cache       in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_pg_min_row        in varchar2 default null,
    p_pg_max_rows       in varchar2 default null,
    p_pg_rows_fetched   in varchar2 default null,
    p_context           in varchar2 default null );

--==============================================================================
-- Internal:
-- Returns all text messages of the APEX Runtime Engine and the specified
-- application which are marked as JavaScript messages.
-- If p_names is specified, only those text messages will be returned. An entry
-- in p_names can use wildcards of the LIKE operator.
-- Those messages don't have to be marked as JavaScript messages.
--==============================================================================
procedure js_messages (
    p_app_id       in varchar2 default null,
    p_lang         in varchar2 default null,
    p_version      in varchar2 default null,
    p_nls_settings in varchar2 default null,
    p_builder      in varchar2 default 'N',
    p_names        in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 );

--==============================================================================
-- Internal:
-- Emits JavaScript code of modal dialog pages of an application to be consumed
-- by the client.
--
-- If p_page_id is specified, only the dialog code of the dialog
-- page will be returned. This is used when the client needs to open a dialog
-- page of a different application and it has custom dialog attributes.
--==============================================================================
procedure js_dialogs (
    p_app_id                in varchar2,
    p_version               in varchar2 default null,
    p_template_static_id    in varchar2 default null,
    p_page_id               in number   default null );

--==============================================================================
-- This function outputs page and item level help text as formatted HTML.
-- You can also use it to customize how help information is displayed in your
-- application.
--
-- Parameters:
-- * p_request:            Not used.
-- * p_flow_id:            The application ID that contains the page or item
--                         level help you want to output.
-- * p_flow_step_id:       The page ID that contains the page or item level help
--                         you want to display.
-- * p_show_item_help:     Flag to determine if item level help is output. If
--                         this parameter is supplied, the value must be either
--                         'YES' or 'NO'. The default value is 'YES'.
-- * p_show_regions:       Flag to determine if region headers are output (for
--                         regions containing page items). If this parameter is
--                         supplied, the value must be either 'YES' or 'NO'.
--                         The default value is 'YES'.
-- * p_before_page_html:   Use this parameter to include HTML between the page
--                         level help text and item level help text.
-- * p_after_page_html:    Use this parameter to include HTML at the bottom of
--                         the output, after all other help.
-- * p_before_region_html: Use this parameter to include HTML before every
--                         region section. Note: This parameter is ignored if
--                         `p_show_regions` is set to 'NO'.
-- * p_after_region_html:  Use this parameter to include HTML after every region
--                         section. Note: This parameter is ignored if
--                         `p_show_regions` is set to 'NO'.
-- * p_before_prompt_html: Use this parameter to include HTML before every item
--                         label for item level help. Note: This parameter is
--                         ignored if `p_show_item_help` is set to 'NO'.
-- * p_after_prompt_html:  Use this parameter to include HTML after every item
--                         label for item level help. Note: This parameter is
--                         ignored if `p_show_item_help` is set to 'NO'.
-- * p_before_item_html:   Use this parameter to include HTML before every item
--                         help text for item level help. Note: This parameter is
--                         ignored if `p_show_item_help` is set to 'NO'.
-- * p_after_item_html:    Use this parameter to include HTML after every item
--                         help text for item level help. Note: This parameter is
--                         ignored if `p_show_item_help` is set to 'NO'.
--
-- Example:
-- The following example shows how to use the `APEX_APPLICATION.HELP` procedure to
-- customize how help information is displayed.
--
-- In this example, the `p_flow_step_id` parameter is set to `:REQUEST`, which means
-- that a page ID specified in the REQUEST section of the URL controls which
-- page's help information to display (see note after example for full details
-- on how this can be achieved).
--
-- Also, the help display has been customized so that the region sub-header now
-- has a different color (through the `p_before_region_html` parameter) and also
-- the ':' has been removed that appeared by default after every item prompt
-- (through the `p_after_prompt_html` parameter).
-- ~~~
-- APEX_APPLICATION.HELP(
--     p_flow_id            => :APP_ID,
--     p_flow_step_id       => :REQUEST,
--     p_before_region_html => '<p><br/><table class="u-info" width="100%"><tr><td><b>',
--     p_after_prompt_html  => '</b></p>&nbsp;&nbsp;'
-- );
-- ~~~
-- To implement this type of call in your application, you can do the following:
-- 1. Create a page that will be your application help page.
-- 2. Create a region of type 'PL/SQL Dynamic Content' and add the
--    `APEX_APPLICATION.HELP` call as PL/SQL Source.
-- 3. Then you can add a 'Navigation Bar' link to this page, ensuring that the
--    REQUEST value set in the link is `&APP_PAGE_ID.`
--==============================================================================
procedure help (
    p_request              in varchar2 default null,
    p_flow_id              in varchar2 default null,
    p_flow_step_id         in varchar2 default null,
    p_show_item_help       in varchar2 default 'YES',
    p_show_regions         in varchar2 default 'YES',
    p_before_page_html     in varchar2 default '<p>',
    p_after_page_html      in varchar2 default null,
    p_before_region_html   in varchar2 default null,
    p_after_region_html    in varchar2 default '</td></tr></table></p>',
    p_before_prompt_html   in varchar2 default '<p><strong>',
    p_after_prompt_html    in varchar2 default '</strong></p>:&nbsp;',
    p_before_item_html     in varchar2 default null,
    p_after_item_html      in varchar2 default null
);

--! U T I L I T I E S

----------------------------------------------------------------------------
-- Internal:
function do_substitutions (
    --
    -- Perform substitutions of ampersand prefixed flow items with
    -- current flow session state for current user and current session.
    --
    p_string                       in varchar2 default null,
    p_sub_type                     in varchar2 default 'SQL',
    p_perform_oracle_substitutions in boolean default false )
    return varchar2
    ;

----------------------------------------------------------------------------
-- Internal:
function trim_sql (
    --
    -- Given a SQL statement , trim trailing and leading
    -- white spaces.  Optionally perform session state substitutions
    -- as well as ensuring the statement ends in a semicolon.
    --
    p_sql               in varchar2 default null,
    p_ends_in_semicolon in boolean default false,
    p_do_substitutions  in boolean default true)
    return varchar2
    ;

----------------------------------------------------------------------------
-- Internal:
function trim_sql (
    --
    -- This function gets a SQL statement ready for execution
    -- Function is overloaded; p_owner may be provided in order to cause package global
    -- to be temporarily replaced with the value of p_owner in package state during
    -- the execution of this function and until its return to the caller.
    --
    p_sql               in varchar2 default null,
    p_ends_in_semicolon in boolean default false,
    p_do_substitutions  in boolean default true,
    p_owner             in varchar2)
    return varchar2
    ;

----------------------------------------------------------------------------
-- Internal:
function trim_nl_sp_tab (
    -- This function removes all whitespace, tab, and new line characters at the begin and end of the input string
    p_string varchar2 )
    return varchar2;

----------------------------------------------------------------------------
-- Internal:
procedure reset_g_nls
    ;

----------------------------------------------------------------------------
-- Internal:
procedure set_g_nls_date_format
    ;

----------------------------------------------------------------------------
-- Internal:
procedure reset_g_nls_date_format
    ;


----------------------------------------------------------------------------
-- Internal:
procedure set_g_nls_decimal_separator
    ;

----------------------------------------------------------------------------
-- Internal:
procedure reset_g_nls_decimal_separator
    ;

----------------------------------------------------------------------------
-- Internal:
function get_nls_decimal_separator return varchar2
    ;

----------------------------------------------------------------------------
-- Internal:
function get_nls_group_separator return varchar2
    ;

----------------------------------------------------------------------------
-- Internal:
function get_translated_app_id return number
    ;

----------------------------------------------------------------------------
-- Internal:
procedure set_g_base_href
    ;

----------------------------------------------------------------------------
-- Internal:
procedure reset_g_base_href
    ;

----------------------------------------------------------------------------
-- Internal:
function get_g_base_href return varchar2
    ;

----------------------------------------------------------------------------
-- Internal:
function get_page_alias return varchar2
    ;

--==============================================================================
-- Internal:
function is_custom_auth_page return boolean
    ;

--==============================================================================
-- Internal:
function get_application_id return number
    ;

--==============================================================================
-- Internal:
function get_page_id return number
    ;

--==============================================================================
-- Internal:
function get_session_id return number
    ;

--==============================================================================
-- Internal:
function get_security_group_id return number
    ;

--==============================================================================
-- Internal:
function is_pressed_button (
    p_button_id in number )
    return boolean;

--!--------------------------------------------------------------------------
--! E R R O R   H A N D L I N G
--!--------------------------------------------------------------------------

--==============================================================================
-- Internal:
-- Returns the number of inline validation errors.
-- Note: That's a compatibility wrapper,
--       use wwv_flow_error.get_validation_error_count instead.
--==============================================================================
function g_inline_validation_error_cnt return pls_integer;

--==============================================================================
-- This procedure signals the Oracle APEX engine to stop further processing and
-- immediately exit to avoid adding additional HTML code to the HTTP buffer.
--
-- Note: This procedure raises the exception `APEX_APPLICATION.E_STOP_APEX_ENGINE`
--       internally. You must raise that exception again if you use a WHEN OTHERS
--       exception handler.
--
-- Example:
--
-- This example tells the browser to redirect to `http://apex.oracle.com/` and
-- immediately stops further processing.
-- ~~~
-- owa_util.redirect_url('http://apex.oracle.com');
-- apex_application.stop_apex_engine;
-- ~~~
--
-- Example:
--
-- This example tells the browser to redirect to `http://apex.oracle.com/` and
-- immediately stops further processing. The code also contains a WHEN OTHERS
-- exception handler which deals with the `APEX_APPLICATION.E_STOP_APEX_ENGINE`
-- used by `APEX_APPLICATION.STOP_APEX_ENGINE`.
-- ~~~
-- begin
--     ... code which can raise an exception ...
--     owa_util.redirect_url('http://apex.oracle.com');
--     apex_application.stop_apex_engine;
-- exception
--     when apex_application.e_stop_apex_engine then
--         raise; -- reraise the stop APEX engine exception
--     when others then
--         ...; -- code to handle the exception
-- end;
-- ~~~
-- See Also:
-- APEX_UTIL.REDIRECT_URL
--==============================================================================
procedure stop_apex_engine;

--!--------------------------------------
--! I N T E R N A L     U T I L I T I E S
--
-- Internal utilities used by the flow engine runtime
-- that are not intened and are not useful to the
-- flows programmer.
--

--==============================================================================
-- Internal:
procedure set_component (
    p_type in varchar2,
    p_id   in number   default null,
    p_name in varchar2 default null );

--==============================================================================
-- Internal:
function get_component return t_component;

--==============================================================================
-- Internal:
procedure clear_component;

--==============================================================================
-- Internal:
function paint_formOpen
    -- Return the HTML form open tag given current flow state.
    return varchar2
    ;


--==============================================================================
-- Internal:
function get_form_close_tag return varchar2;

--==============================================================================
-- Internal:
procedure s (
    p in varchar2 default null)
    ;

----------------------------------------------------------------------------
-- Internal:
-- D E B U G G I N G
--
procedure debug (
    -- Given a string this will result in the generation of a debug entry
    p_string         in varchar2 default null)
    ;

----------------------------------------------------------------------------
-- Internal:
function get_elapsed_time
    -- Get the elapsed time from package instantiation
    return number;




--!--------------------------------------------------------------------------
--! S E S S I O N   S T A T E   M A N A G E M E N T
--!
--! The following routines can be called to read and write session state.
--!--------------------------------------------------------------------------

--==============================================================================
-- Internal:
function get_next_session_id
    -- Get integer ID values, session ID is a sequence, unique ID is a sequence
    -- with a random number which produces a virtual global unique ID.
    return number
    ;

--==============================================================================
-- Internal:
function get_unique_id
    -- Return a number which is virually globally unique.
    return number
    ;

--==============================================================================
-- Internal:
procedure clear_page_cache (
    -- Reset all cached items for a given page to null
    p_flow_page_id in number default null)
    ;

--==============================================================================
-- Internal:
procedure clear_page_caches (
    -- Reset all cached items for pages in array to null
    p_flow_page_id in wwv_flow_global.vc_arr2 default empty_vc_arr)
    ;

--==============================================================================
-- Internal:
procedure clear_flow_cache (
    -- For the current session remove session state for the given flow.
    -- Requires g_instance to be set to the current flows session.
    p_flow_id in varchar2 default null)
    ;

--==============================================================================
-- Internal:
procedure clear_app_cache (
    -- For the current session remove session state for the given flow.
    -- Requires g_instance to be set to the current flows session.
    p_app_id in varchar2 default null)
    ;

--==============================================================================
-- Internal:
procedure clear_user_cache
    -- For the current users session remove session state and flow system preferences.
    -- Run this procedure if you reuse session IDs and want to run flows without
    -- the benifit of existing session state.  Requires g_instance to be set to the
    -- current flows session.
    ;

--==============================================================================
-- Internal:
function find_item_id (
    -- Given a flow page or flow level items name return its numeric identifier.
    p_name in varchar2 default null)
    return number
    ;

--==============================================================================
-- Internal:
function find_item_name (
    -- Given a flow page or flow level items numeric identifier return the items name.
    p_id in number default null)
    return varchar2
    ;

--==============================================================================
-- Internal:
procedure update_cache_with_write (
    -- For the current session update an items cached value.  This update is persistent
    -- for the life of the flow session, unless the session state is cleared or updated.
    p_name    in varchar2 default null,
    p_value   in varchar2 default null)
    ;

--==============================================================================
-- Internal:
procedure reset_security_check
    -- Security checks are cached to increase performance, this procedure allows you to
    -- undo the caching and thus require all security checks to be revalidated for the
    -- current user.  Use this routine if you allow a user to change "responcibilities"
    -- within an application, thus changing their authentication scheme.
    ;

--==============================================================================
-- Internal:
function public_role_check (
    p_role      in varchar2 default null,
    p_component in varchar2 default null)
    return boolean
    ;

--==============================================================================
-- Internal:
function public_security_check (
    -- Given the name of a flow security scheme determine if the current user
    -- passes the security check.
    p_security_scheme in varchar2)
    return boolean
    ;

--==============================================================================
-- Internal:
function fetch_flow_item(
    -- Given a flow-level item name, locate item in current or specified
    -- flow and current or specified session and return item value.
    p_item         in varchar2,
    p_flow         in number default null,
    p_instance     in number default null)
    return varchar2
    ;

--==============================================================================
-- Internal:
function fetch_app_item(
    -- Given a flow-level item name, locate item in current or specified
    -- flow and current or specified session and return item value.
    p_item         in varchar2,
    p_app          in number default null,
    p_instance     in number default null)
    return varchar2
    ;

--!----------------------------------------------------------------
--! V I R T U A L   P R I V A T E   D A T A B A S E   S U P P O R T
--!
--! flows are owned by companies which are identified by a security
--! group ID.  The flow meta data repository is "sliced up" by
--! the security group id (sgid).
--!----------------------------------------------------------------

--==============================================================================
-- Internal:
function get_sgid return number
    -- Given the current users context return the security group ID.
    ;
--==============================================================================
-- Internal:
function get_browser_version return varchar2;
     -- return browser versiob

--==============================================================================
-- Internal:
function get_company_name (
    p_escape in boolean default true
) return varchar2
    -- Given the current users context return the company name.
    ;

--!----------------------------------------------------------------
--! Stateful processes
--!----------------------------------------------------------------

--==============================================================================
-- Internal:
function process_state(
    p_process_id in number)
    return varchar2
    ;

--==============================================================================
-- Internal:
procedure reset_page_process(
    p_process_id in number)
    ;

--==============================================================================
-- Internal:
procedure reset_page_processess(
    p_page_id in number)
    ;


--!----------------------------------------------------------------
--! A U T H E N T I C A T I O N
--

--==============================================================================
-- Internal:
function get_custom_auth_login_url return varchar2
    -- for use with custom authentication
    ;

--==============================================================================
-- Internal:
function replace_cgi_env(
    p_in varchar2)
    return varchar2
    ;

--==============================================================================
-- Internal:
function get_home_link_url return varchar2
    -- internal use only
    ;

--==============================================================================
-- Internal:
-- Public procedure used as "Path Alias Procedure" (see http://download.oracle.com/docs/cd/A97335_02/apps.102/a90099/feature.htm#1007126
-- to translate a friendly URL of APEX into a related wwv_flow.show or
-- wwv_flow_file_mgr.get_file call.
--==============================================================================
procedure resolve_friendly_url (
    p_path in varchar2 );

--==============================================================================
-- Internal:
-- Routes ORDS /r requests to wwv_flow.resolve_friendly_url
--
-- Parameters:
-- * p_first_segment:   First part of URL path after /r but before following forward slash.
--                      Ex: ".../ords/r/my-workspace/my-app/home?session=123"
--                      p_first_segment would be "my-workspace"
-- * p_path:            URL path following first segment (not including query string).
--                      See ords_friendly_url_config.sql as to why ORDS needs needs to split the path
--                      In above example p_path would be "my-app/home"
--
-- Example:
--
-- In a REST module with the pattern: ":firstsegment/:path*" the following code should be used
-- to route the request to the APEX engine.
--
-- ~~~
-- begin
--     apex_application.route_friendly_url(
--         p_first_segment => :firstsegment,
--         p_path          => :path);
-- end;
-- ~~~
--
--==============================================================================
procedure route_friendly_url (
    p_first_segment in varchar2,
    p_path          in varchar2);

--!----------------------------------------------------------------
--! Deprecated, obsolete procedures and functions.
--! Don't use them anymore!

----------------------------------------------------------------------------
-- Internal:
procedure null_page_cache (
    p_flow_page_id in number default null)
    ;

----------------------------------------------------------------------------
-- Internal:
procedure null_step_cache (
    p_flow_step_id in number default null)
    ;

----------------------------------------------------------------------------
-- Internal:
procedure null_page_caches (
    p_flow_page_id in wwv_flow_global.vc_arr2 default empty_vc_arr)
    ;

----------------------------------------------------------------------------
-- Internal:
procedure null_step_caches (
    p_flow_step_id in wwv_flow_global.vc_arr2 default empty_vc_arr)
    ;

----------------------------------------------------------------------------
-- Internal:
procedure show_error_message (
    p_message  in varchar2 default 'Error',
    p_footer   in varchar2 default null,
    p_query    in varchar2 default null)
    ;

----------------------------------------------------------------------------
-- Internal:
function get_application_id (
    p_application_id_or_alias in varchar2,
    p_security_group_id       in number   default null )
    return number;

----------------------------------------------------------------------------
-- Internal:
procedure set_ppr_query_session_state (p_region_id in number);

end wwv_flow;
/
show errors

set define '^'
