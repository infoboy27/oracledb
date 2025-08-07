set define '^' verify off
prompt ...wwv_flow_wizard_api
create or replace package wwv_flow_wizard_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2001, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wizapi.plb
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  03/18/2001 - Created
--
------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

type t_md is record (
    page_id              number,
    page_name            varchar2(255),
    page_mode            varchar2(255),
    breadcrumb_name      varchar2(255),
    region_id            number,
    region_title         varchar2(255),
    --
    location             wwv_flow_exec_api.t_location default wwv_flow_exec_api.c_location_local_db,
    web_src_module_id    number,
    document_source_id   number,
    array_column_id      number,
    remote_server_id     number,
    --
    owner                varchar2(255),
    table_name           varchar2(255),
    singular_name        varchar2(4000),
    plural_name          varchar2(4000),
    cols                 varchar2(32767),
    pk_col               varchar2(255),
    pk_col2              varchar2(255),
    fk_con               varchar2(255),
    primary_label_col    varchar2(255),
    secondary_label_col  varchar2(255),
    master_col           varchar2(255),
    detail_col           varchar2(255),
    navigation_order_col varchar2(255)
    );

type t_mds is table of t_md index by binary_integer;

type t_lookup is record (
    column_name              varchar2(255),
    column_label             varchar2(4000),
    lookup_column_alias      varchar2(255),
    lookup_table_name        varchar2(255),
    lookup_table_pk          varchar2(255),
    lookup_table_display_col varchar2(255) );

type t_lookups is table of t_lookup index by pls_integer;

type t_lov_entry is record(
    display_value    varchar2(4000),
    return_value     varchar2(4000),
    template         varchar2(4000),
    disp_cond_type   varchar2(255),
    disp_cond        varchar2(4000),
    disp_cond2       varchar2(4000) );

type t_lov_entries is table of t_lov_entry index by binary_integer;

type t_order_by_item is record (
    item_name        wwv_flow_step_items.name%type,
    default_order    wwv_flow_step_items.item_default%type,
    lov_entries      t_lov_entries,
    order_by_type    wwv_flow_page_plugs.query_order_by_type%type,
    order_by_json    wwv_flow_page_plugs.query_order_by%type );

type t_invoke_api_parameters is table of wwv_flow_invokeapi_comp_params%rowtype index by pls_integer;

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_edit_image          constant varchar2(500) := '<img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil"' ||
                                                wwv_flow_plugin_util.get_html_attr(
                                                    p_name  => 'alt',
                                                    p_value => wwv_flow_lang_dev.builder_message( 'EDIT' ) ) || '>';
c_edit_image_ut       constant varchar2(500) := '<span role="img"' ||
                                                wwv_flow_plugin_util.get_html_attr(
                                                    p_name  => 'aria-label',
                                                    p_value => wwv_flow_lang_dev.builder_message( 'EDIT' ) ) ||
                                                ' class="fa fa-edit"' ||
                                                wwv_flow_plugin_util.get_html_attr(
                                                    p_name  => 'title',
                                                    p_value => wwv_flow_lang_dev.builder_message( 'EDIT' ) ) ||
                                                '></span>';

empty_vc_arr          wwv_flow_global.vc_arr2;
c_empty_lookup        t_lookups;
c_empty_lov_entries   t_lov_entries;

c_page_mode_drawer    constant varchar2(6) := 'DRAWER'; -- sets page_mode to modal and page_template to drawer

function array_element(
       p_vcarr in wwv_flow_global.vc_arr2,
       p_index in number )
       return varchar2;

--==============================================================================
-- return p_tables ordered such that tables with FKs to other tables come last
--==============================================================================
function order_tables_by_parents (
    p_owner  in varchar2,
    p_tables in wwv_flow_t_varchar2 )
    return wwv_flow_t_varchar2;

function get_pk (
       p_table_owner  in varchar2,
       p_table_name   in varchar2
       ) return varchar2;

function get_fk (
    p_table_owner in varchar2,
    p_table_name  in varchar2,
    p_parent_table_name in varchar2
    ) return varchar2;

function get_column_data_type (
      p_table_owner in varchar2,
      p_table_name  in varchar2,
      p_column_name in varchar2
      ) return varchar2;

function updateable_query_exists (
      p_flow_id in number,
      p_page_id in number)
   return boolean;

function ir_report_exists (
      p_flow_id   in number,
      p_page_id   in number,
      p_region_id in number default null)
   return boolean;

function jstree_exists (
      p_flow_id   in number,
      p_page_id   in number,
      p_region_id in number default null)
   return boolean;

function tabular_form_exists (
      p_flow_id   in number,
      p_page_id   in number,
      p_region_id in number default null)
   return boolean;

function page_exists (p_flow_id in number, p_page_id in number) return boolean;

function reserve_page(
    --
    -- function returns error text if the page cannot be reserved
    --
    p_flow_id    in number,
    p_page_id    in number,
    p_reuse      in boolean default false ) return varchar2;

function get_maximum_free_page (
    --
    -- function returns maximum free page number (and reserves the page)
    -- page number returns the next available page in 10s
    --
    p_flow_id     in number,
    p_min_page_id in number default 10000 ) return number;

function get_maximum_free_admin_page (
    --
    -- function returns maximum free administration page number (and reserves the page)
    -- page number returns the next available page in 100s
    --
    p_flow_id    in number) return number;

function get_maximum_free_user_page (
    --
    -- function returns maximum free administration page number (and reserves the page)
    -- page number returns the next available page in 100s
    --
    p_flow_id    in number) return number;

function get_owner (
   -- If the owner user chose is equal to flows' owner,
   -- return #OWNER#.
   --
      p_flow_id    in number,
      p_owner      in varchar2 )
   return varchar2;

function get_flow_owner (
   -- Get the owner of current flow.
   --
   p_flow_id   in number default null)
   return varchar2;

-- -----------------------------------------------------------------------------------
-- get valid item name
-- p_column_name
-- returns valid item name for given column name

function get_valid_item_name (
    p_column_name varchar2,
    p_page_id     number default null
) return varchar2;

--==============================================================================
-- Returns the page item in substitution syntax &ITEM.
-- In case if the page item is a multibyte page item it will return &"ITEM".
--==============================================================================
function get_item_substitution_value (
    p_item_name in varchar2 )
    return varchar2;

--==============================================================================
-- Returns the page item as a bind variable :ITEM
-- In case if the page item is a multibyte page item it will return :"ITEM"
--==============================================================================
function get_item_bind_variable (
    p_item_name in varchar2 )
    return varchar2;

--
-- get group region id
-- returns valid region id for given region name, page id, app id and sequence
-- as part of UI Defaults groupings
function get_group_region_id (
    p_flow_id     number,
    p_page_id     number,
    p_group_seq   number,
    p_group_name  varchar2
) return number;

--
-- Check for UI Default Groups
--
 function ui_def_groups_exist(
      p_table_owner   in varchar2,
      p_table_name    in varchar2
  )return boolean;

--
-- Check for Column Group on Interactive Report
--
 function ir_col_group_exists(
      p_flow_id      in number,
      p_worksheet_id in number,
      p_group_name   in varchar2
 )return boolean;

--------------------------------------------------------------------
-- Get preset template options
--
function get_preset_template_options (
    p_template_id    number,
    p_template_type  varchar2 )
    return varchar2;

function get_theme_edit_image return varchar2;

--------------------------------------------------------------------
-- Escape html in report column headings, but limit to only the
-- following characters: < > & "
--
-- Raw Escaped
-- --- -------
--   &   &amp;
--   "   &quot;
--   <   &lt;
--   >   &gt;
--
function escape_report_label (
    p_string in varchar2
) return varchar2;

-- -----------------------------------------------------------------------------------
-- get query columns
-- p_owner: parse-as schema name
-- p_query: sql query


procedure get_query_columns (
    p_location           in wwv_flow_exec_api.t_location default wwv_flow_exec_api.c_location_local_db,
    p_owner              in varchar2,
    p_query              in varchar2,
    p_include_blob       in varchar2 default 'N',
    p_include_tz         in varchar2 default 'N',
    p_remote_server_id   in number   default null,
    p_web_src_module_id  in number   default null,
    p_document_source_id in number   default null,
    p_array_column_id    in number   default null,
    --
    p_columns          out wwv_flow_global.vc_arr2,
    p_types            out wwv_flow_global.vc_arr2,
    p_col_max_len      out wwv_flow_global.vc_arr2 );

 function is_old_ppr_template (
    p_report_template_id in number
 ) return boolean;

function is_identity_always (
    p_owner             in varchar2,
    p_table_name        in varchar2,
    p_column_name       in varchar2
) return boolean;

procedure initcap_report_column_headings (
    p_region_id in number );

function get_template_id(
    p_app_id   in number,
    p_theme_id in number,
    p_type     in varchar2,
    p_name     in varchar2  ) return number;

function get_default_template_id (
    p_template_type in varchar2 )
    return number;

procedure create_report_max_row_lov (
   p_lov_id       in number,
   p_lov_name     in varchar2,
   p_flow_id      in number
   );

--==============================================================================
-- Wrapper for wwv_flow_imp_shared.create_page which will issue additional code.
--==============================================================================
procedure create_page (
    p_id                          in number   default null,
    p_flow_id                     in number   default wwv_flow.g_flow_id,
    p_tab_set                     in varchar2 default null,
    p_name                        in varchar2 default null,
    p_alias                       in varchar2 default null,
    p_page_mode                   in varchar2 default 'NORMAL',
    p_step_title                  in varchar2 default null,
    p_step_sub_title              in varchar2 default null,
    p_step_sub_title_type         in varchar2 default null,
    p_media_type                  in varchar2 default null,
    p_first_item                  in varchar2 default 'NO_FIRST_ITEM',
    p_include_apex_css_js_yn      in varchar2 default 'Y',
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
    p_allow_duplicate_submissions in varchar2 default 'Y',
    p_on_dup_submission_goto_url  in varchar2 default null,
    p_reload_on_submit            in varchar2 default 'S',
    p_warn_on_unsaved_changes     in varchar2 default 'Y',
    p_html_page_header            in varchar2 default null,
    p_html_page_onload            in varchar2 default null,
    p_javascript_file_urls        in varchar2 default null,
    p_javascript_code             in varchar2 default null,
    p_javascript_code_onload      in varchar2 default null,
    p_css_file_urls               in varchar2 default null,
    p_inline_css                  in varchar2 default null,
    p_page_is_protected_y_n       in varchar2 default null,
    p_page_is_public_y_n          in varchar2 default 'N',
    p_protection_level            in varchar2 default 'C',
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
    p_dialog_chained              in varchar2 default 'Y',
    p_dialog_resizable            in varchar2 default null,
    --
    p_overwrite_navigation_list   in varchar2 default 'N',
    p_navigation_list_position    in varchar2 default null,
    p_navigation_list_id          in number   default null,
    p_navigation_list_template_id in number   default null,
    p_nav_list_template_options   in varchar2 default null,
    --
    p_tab_name                    in varchar2 default null,
    --
    p_auto_tab_set                in varchar2 default null,
    p_auto_tab_text               in varchar2 default null,
    p_auto_parent_tab_set         in varchar2 default null,
    p_auto_parent_tab_text        in varchar2 default null,
    --
    p_autocomplete_on_off         in varchar2 default null,
    --
    p_browser_cache               in varchar2 default null,
    p_deep_linking                in varchar2 default null,
    p_rejoin_existing_sessions    in varchar2 default null,
    --
    p_read_only_when_type         in varchar2 default null,
    p_read_only_when              in varchar2 default null,
    p_read_only_when2             in varchar2 default null,
    --
    p_cache_mode                  in varchar2 default null,
    p_cache_page_yn               in varchar2 default 'N',
    p_cache_timeout_seconds       in number   default null,
    p_cache_by_user_yn            in varchar2 default null,
    p_cache_when_condition_type   in varchar2 default null,
    p_cache_when_condition_e1     in varchar2 default null,
    p_cache_when_condition_e2     in varchar2 default null,
    --
    p_group_id                    in number   default null,
    --
    p_is_page_pattern             in varchar2 default 'N',
    p_builder_icon_css_class      in varchar2 default null,
    p_page_pattern_id             in number   default null,
    p_reference_id                in number   default null,
    p_version_scn                 in number   default null );

--------------------------------------------------------------------------------
-- The CREATE_BLANK_PAGE procedure creates blank page, used in create page wizard
-- Optionally it also creates navigation list item, breadcrumb entry and breadcrumb region on the page
--------------------------------------------------------------------------------

procedure create_blank_page (
    p_flow_id                  in number,
    p_page_id                  in number,
    p_name                     in varchar2,
    p_page_mode                in varchar2,
    p_alias                    in varchar2 default null,
    p_title                    in varchar2 default null,
    p_group_id                 in number   default null,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    p_nav_list_item_icon       in varchar2 default null,
    --
    p_html_page_header         in varchar2 default null,
    p_javascript_code          in varchar2 default null,
    --
    p_breadcrumb_id            in number   default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_breadcrumb_id     in number   default null,
    p_inline_css               in varchar2 default null,
    p_javascript_code_onload   in varchar2 default null,
    --
    p_protection_level         in varchar2 default 'C',
    p_warn_on_unsaved_changes  in varchar2 default 'Y',
    p_help_text                in varchar2 default null );

procedure create_global_page (
    p_application_id    in number,
    p_page_id           in number );

procedure create_select_list (
    p_app_id                    in number,
    p_page_id                   in number,
    p_name                      in varchar2,
    --
    p_label_msg_name            in varchar2,
    --
    p_sequence                  in number,
    p_region_id                 in number,
    p_position                  in varchar2 default 'BODY',
    p_grid_new_row              in boolean  default true,
    p_grid_new_column           in boolean  default true,
    p_grid_column_span          in number   default null,
    p_grid_label_column_span    in number   default null,
    p_template_id               in number   default wwv_flow_theme_globals.g_default_label_template,
    p_template_options          in varchar2 default null,
    p_icon_css_classes          in varchar2 default null,
    --
    p_is_required               in boolean,
    --
    p_pre_text                  in varchar2 default null,
    p_post_text                 in varchar2 default null,
    p_warn_on_unsaved_changes   in varchar2 default null,
    --
    p_source_region_id          in number   default null,
    p_db_column_name            in varchar2 default null,
    p_db_column_data_type       in varchar2 default null,
    p_is_primary_key            in boolean  default false,
    p_is_query_only             in boolean  default false,
    --
    p_source_type               in varchar2 default 'ALWAYS_NULL',
    p_source                    in varchar2 default null,
    p_stored_per_user           in boolean  default false,
    --
    p_default_type              in varchar2 default null,
    p_default_source            in varchar2 default null,
    --
    p_shared_lov_name           in varchar2,
    p_shared_lov_id             in number,
    p_inline_lov_type           in varchar2, -- STATIC, QUERY
    p_inline_lov_entries        in t_lov_entries,
    p_inline_lov_query          in varchar2,
    p_lov_display_extra         in boolean,
    p_lov_display_null          in boolean,
    p_lov_null_text             in varchar2,
    p_lov_cascade_parent_items  in varchar2 default null,
    --
    p_condition_type            in varchar2 default null,
    p_condition_expr1           in varchar2 default null,
    p_condition_expr2           in varchar2 default null,
    --
    p_read_only_cond_type       in varchar2 default null,
    p_read_only_cond_expr1      in varchar2 default null,
    p_read_only_cond_expr2      in varchar2 default null,
    --
    p_authorization_scheme_id   in number   default null,
    p_ssp_level                 in varchar2 default 'N',
    --
    p_help_text_msg_name        in varchar2 default null,
    p_inline_help_text_msg_name in varchar2 default null );

procedure create_single_checkbox (
    p_app_id                    in number,
    p_page_id                   in number,
    p_name                      in varchar2,
    --
    p_label_msg_name            in varchar2,
    --
    p_use_defaults              in varchar2 default 'Y',
    p_checked_value             in varchar2 default null,
    p_unchecked_value           in varchar2 default null,
    --
    p_sequence                  in number,
    p_region_id                 in number,
    p_position                  in varchar2 default 'BODY',
    p_grid_new_row              in boolean  default true,
    p_grid_new_column           in boolean  default true,
    p_grid_column_span          in number   default null,
    p_template_id               in number   default wwv_flow_theme_globals.g_default_label_template,
    p_template_options          in varchar2 default null,
    p_icon_css_classes          in varchar2 default null,
    p_format_mask               in varchar2 default null,
    --
    p_is_required               in boolean,
    --
    p_pre_text                  in varchar2 default null,
    p_post_text                 in varchar2 default null,
    p_warn_on_unsaved_changes   in varchar2 default null,
    --
    p_source_region_id          in number   default null,
    p_db_column_name            in varchar2 default null,
    p_db_column_data_type       in varchar2 default null,
    p_is_primary_key            in boolean  default false,
    p_is_query_only             in boolean  default false,
    --
    p_source_type               in varchar2 default 'ALWAYS_NULL',
    p_source                    in varchar2 default null,
    p_stored_per_user           in boolean  default false,
    --
    p_default_type              in varchar2 default null,
    p_default_source            in varchar2 default null,
    --
    p_condition_type            in varchar2 default null,
    p_condition_expr1           in varchar2 default null,
    p_condition_expr2           in varchar2 default null,
    --
    p_read_only_cond_type       in varchar2 default null,
    p_read_only_cond_expr1      in varchar2 default null,
    p_read_only_cond_expr2      in varchar2 default null,
    --
    p_authorization_scheme_id   in number   default null,
    p_ssp_level                 in varchar2 default 'N',
    --
    p_help_text_msg_name        in varchar2 default null,
    p_inline_help_text_msg_name in varchar2 default null );

--===============================================================================
-- Create Invoke API process
--===============================================================================
procedure create_invoke_api_process (
    p_flow_id          in number,
    p_page_id          in number,
    p_name             in varchar2,
    p_point            in varchar2,
    p_sequence         in number,
    p_package_name     in varchar2,
    p_procedure_name   in varchar2,
    p_when_button_id   in number   default null,
    p_success_message  in varchar2 default null,
    p_api_params       in t_invoke_api_parameters );

procedure add_invoke_api_parameter (
    p_api_params       in out nocopy t_invoke_api_parameters,
    p_name             in            varchar2,
    p_direction        in            varchar2 default 'IN',
    p_data_type        in            varchar2 default 'VARCHAR2',
    p_has_default      in            boolean  default false,
    p_ignore_output    in            boolean  default null,
    p_value_type       in            varchar2 default 'ITEM',
    p_value_language   in            varchar2 default null,
    p_value            in            varchar2,
    p_format_mask      in            varchar2 default null );

procedure create_static_region (
    p_id                          in number    default null,
    p_application_id              in number,
    p_page_id                     in number    default wwv_flow_imp_page.current_page_id,
    p_title                       in varchar2,
    p_parent_region_id            in number    default null,
    p_slot                        in varchar2  default 'BODY',
    p_display_sequence            in number    default 10,
    p_include_in_reg_disp_sel_yn  in varchar2  default 'N',
    p_template_id                 in number    default null,
    p_region_template_options     in varchar2  default null,
    p_region_css_classes          in varchar2  default null,
    p_region_attributes           in varchar2  default null,
    p_region_image                in varchar2  default null,
    p_region_source               in varchar2  default null,
    p_condition_type              in varchar2  default null,
    p_condition_expr              in varchar2  default null,
    p_condition_expr2             in varchar2  default null,
    p_icon_css_classes            in varchar2  default null,
    p_region_item_display_point   in varchar2  default 'ABOVE' );

procedure create_updateable_report (
   p_flow_id                  in number,
   p_page_id                  in number,
   p_page_name                in varchar2,
   p_group_name               in varchar2 default null,
   p_page_mode                in varchar2,
   p_use_ui_default           in varchar2 default 'Y',
   --
   p_tabset                   in varchar2 default null,
   p_tab_name                 in varchar2 default null, -- current tab name
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   --
   p_select_columns           in varchar2 default null,
   p_updatable_columns        in varchar2 default null,
   p_table_pk1                in varchar2 default null,
   p_table_pk1_src_type       in varchar2 default null,
   p_table_pk1_src            in varchar2 default null,
   p_table_pk2                in varchar2 default null,
   p_table_pk2_src_type       in varchar2 default null,
   p_table_pk2_src            in varchar2 default null,
   p_table_pk3                in varchar2 default null,
   p_table_pk3_src_type       in varchar2 default null,
   p_table_pk3_src            in varchar2 default null,
   p_table_fk                 in varchar2 default null,
   p_table_fk_src_type        in varchar2 default null,
   p_table_fk_src             in varchar2 default null,
   p_implement_type           in number   default null,
   p_security_group_id        in number   default null,
   --
   p_query                    in varchar2,
   p_region_title             in varchar2,
   p_region_template          in number,
   p_report_template          in number,
   p_cancel_branch            in number,
   p_submit_branch            in number,
   p_process                  in varchar2,
   p_cancel_button_name       in varchar2 default null,
   p_delete_button_name       in varchar2 default null,
   p_add_button_name          in varchar2 default null,
   p_submit_button_name       in varchar2 default null,
   p_is_master_detail         in boolean default false)
   ;

procedure create_form_on_sp (
   p_flow_id                  in number,
   p_page_id                  in number,
   p_page_name                in varchar2,
   p_group_name               in varchar2 default null,
   p_page_mode                in varchar2,
   --
   p_tab_set                  in varchar2 default null,
   p_tab_name                 in varchar2 default null, -- current tab name
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   p_nav_list_item_icon       in varchar2 default null,
   --
   p_region_title             in varchar2 default null,
   p_region_template          in number,
   p_schema                   in varchar2,
   p_procedure                in varchar2,
   p_collection_name          in varchar2 default 'SP_WIZARD',
   p_cancel_branch            in number,
   p_submit_branch            in number,
   p_cancel_button_name       in varchar2 default 'Cancel',
   p_submit_button_name       in varchar2 default 'Submit',
   --
   p_button_label             in varchar2 default 'RUN',
   p_invoking_page_id         in varchar2 default null,
   p_invoking_region_id       in varchar2 default null,
   p_invoking_button_p        in varchar2 default null)
   ;

procedure create_form_on_table (
    p_flow_id                   in number   default null,
    p_page_id                   in number   default null,
    p_page_name                 in varchar2 default 'form',
    p_group_name                in varchar2 default null,
    p_page_mode                 in varchar2,
    p_use_ui_default            in varchar2 default 'Y',
    --
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null, -- current tab name
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_region_title              in varchar2 default null,
    p_region_template           in number default null,
    p_table_owner               in varchar2 default null,
    p_table_name                in varchar2 default null,
    p_table_pk_column_name      in varchar2 default null,
    p_table_pk_src_type         in varchar2 default null,
    p_table_pk_src              in varchar2 default null,
    p_table_pk2_column_name     in varchar2 default null,
    p_table_pk2_src_type        in varchar2 default null,
    p_table_pk2_src             in varchar2 default null,
    p_table_rv_column_name      in varchar2 default null,
    p_display_column_list       in varchar2 default null,
    --
    p_create_button_name        in varchar2 default 'Create',
    p_save_button_name          in varchar2 default 'Apply Changes',
    p_delete_button_name        in varchar2 default 'Delete',
    p_cancel_button_name        in varchar2 default 'Cancel',
    p_branch                    in number default null,
    p_cancel_branch             in number default null,
    --
    p_insert                    in varchar2 default 'Y',
    p_update                    in varchar2 default 'Y',
    p_delete                    in varchar2 default 'Y',
    --
    p_dialog_chained            in varchar2 default 'Y'
    );

procedure create_form_on_ws (
    p_flow_id                 in number   default null,
    p_page_id                 in number   default null,
    p_ws_id                   in number,
    p_operation_id            in number,
    p_page_name               in varchar2 default 'form',
    p_group_name              in varchar2 default null,
    p_page_mode               in varchar2,
    --
    p_tab_set                 in varchar2 default null,
    p_tab_name                in varchar2 default null, -- current tab name
    p_tab_text                in varchar2 default null,
    --
    p_region_title            in varchar2 default null,
    p_region_template         in number default null,
    p_inputs_collection       in varchar2,
    p_outputs_collection      in varchar2,
    p_auth_collection         in varchar2,
    p_report_collection_name  in varchar2 default null
    );

procedure create_form_on_ws_rpt (
    p_flow_id                  in number   default null,
    p_page_id                  in number   default null,
    p_ws_id                    in number,
    p_operation_id             in number,
    p_page_name                in varchar2 default 'form',
    p_group_name               in varchar2 default null,
    p_page_mode                in varchar2,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null, -- current tab name
    p_tab_text                 in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_result_node              in varchar2 default null,
    p_soap_style               in varchar2 default null,
    p_message_format           in varchar2 default null,
    p_namespace                in varchar2 default null,
    --
    p_region_title             in varchar2 default null,
    p_region_template          in number default null,
    p_region_title2            in varchar2 default null,
    p_region_template2         in number default null,
    p_report_template          in varchar2,
    p_inputs_collection        in varchar2,
    p_auth_collection          in varchar2,
    p_array_parm               in number,
    p_report_collection_name   in varchar2,
    p_array_parms_collection   in varchar2
    );

procedure create_report_page (
   p_flow_id                   in number   default null,
   p_page_id                   in number   default null,
   p_page_name                 in varchar2 default null,
   p_group_name                in varchar2 default null,
   p_page_mode                 in varchar2,
   p_report_sql                in varchar2 default null,
   --
   p_columns_colon_sep         in varchar2 default null,
   --
   p_location                  in varchar2 default null,
   p_web_src_module_id         in number   default null,
   p_remote_server_id          in number   default null,
   p_table_owner               in varchar2 default null,
   p_table_name                in varchar2 default null,
   p_include_rowid_column      in boolean  default false,
   --
   p_lookups                   in t_lookups default c_empty_lookup,
   --
   p_report_template           in varchar2 default null,
   p_tab_set                   in varchar2 default null,
   p_tab_name                  in varchar2 default null, -- current tab name
   p_tab_text                  in varchar2 default null,
   p_nav_list_id               in number   default null,
   p_nav_list_item_id          in number   default null,
   p_nav_list_item_name        in varchar2 default null,
   p_nav_list_parent_item_id   in number   default null,
   p_nav_list_child_item_name  in varchar2 default null,
   p_plug_template             in varchar2 default null,
   p_plug_name                 in varchar2 default null,
   p_plug_display_column       in varchar2 default null,
   p_max_rows                  in varchar2 default '15',
   p_report_type               in varchar2 default null,
   p_plug_query_options        in varchar2 default null,
   p_plug_query_max_columns    in varchar2 default null,
   p_plug_query_break_cols     in varchar2 default null,
   p_csv_output                in varchar2 default null,
   p_csv_link_text             in varchar2 default null,
   p_prn_output                in varchar2 default null,
   p_prn_format                in varchar2 default null,
   p_prn_label                 in varchar2 default null,
   p_column_heading_sort       in varchar2 default null,
   p_enable_search             in varchar2 default null,
   p_search_list               in varchar2 default null,
   p_use_ui_defaults           in varchar2 default null,
   p_web_src_param_collection  in varchar2 default null  );

function generate_updatable_rpt_query (
   --
   -- arguments:
   --   p_select_columns       c1:c2:c3  (all columns in query)
   --   p_updatable_columns    c2:c3     (columns that are updateable)
   --   p_table_owner          SCOTT
   --   ...
   --
   p_select_columns     in varchar2 default null,
   p_updatable_columns  in varchar2 default null,
   p_where              in varchar2 default null,
   p_table_owner        in varchar2 default null,
   p_table_name         in varchar2 default null,
   p_table_pk1          in varchar2 default null,
   p_table_pk2          in varchar2 default null,
   p_table_pk3          in varchar2 default null,
   p_table_fk           in varchar2 default null,
   p_table_fk_src_type  in varchar2 default null,
   p_table_fk_src       in varchar2 default null,
   p_implement_type     in number   default null )
   return varchar2
   ;

procedure create_wizard (
   p_flow_id                  in number,
   p_steps                    in number,
   p_page_mode                in varchar2,
   p_group_name               in varchar2 default null,
   p_wizard_name              in varchar2 default null,
   --
   p_tab_type                 in varchar2 default null,
   p_tab_set                  in varchar2 default null,
   p_tab_name                 in varchar2 default null,
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   p_nav_list_item_icon       in varchar2 default null,
   --
   p_region_template          in number   default null,
   p_info_region              in varchar2 default null,
   p_info_region_template     in number   default null,
   p_info_default_text        in varchar2 default null,
   --
   p_cancel_branch            in number   default null,
   p_finish_branch            in number   default null,
   p_cancel_button_name       in varchar2 default 'Cancel',
   p_finish_button_name       in varchar2 default 'Finish',
   p_previous_button_name     in varchar2 default 'Previous',
   p_next_button_name         in varchar2 default 'Next')
   ;

procedure create_jstree (
   p_flow_id                 in number   default null,
   p_page_id                 in number   default null,
   p_page_name               in varchar2 default null,
   p_group_name              in varchar2 default null,
   p_page_mode               in varchar2,
   --
   p_tab_set                 in varchar2 default null,
   p_tab_name                in varchar2 default null,
   p_tab_text                in varchar2 default null,
   --
   p_nav_list_id              in number   default null,
   p_nav_list_item_id         in number   default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number   default null,
   p_nav_list_child_item_name in varchar2 default null,
   p_nav_list_item_icon       in varchar2 default null,
   --
   p_region_template         in number   default null,
   p_region_name             in varchar2 default null,
   p_breadcrumb_id           in number   default null,
   p_breadcrumb_name         in varchar2 default null,
   p_parent_bc_id            in number   default null,
   --
   p_tree_query              in varchar2,                -- SQL query
   p_tree_button_option      in varchar2 default null,
   p_show_hints              in varchar2 default null,
   p_tree_hint_text          in varchar2 default null,
   p_tree_click_action       in varchar2 default null,
   p_selected_node           in varchar2 default null );

procedure create_jstree_region (
   p_flow_id                 in number   default null,
   p_page_id                 in number   default null,
   p_region_template         in number   default null,
   p_region_name             in varchar2 default null,
   p_parent_plug_id          in number   default null,
   p_display_seq             in number   default null,
   p_display_col             in number   default null,
   p_slot                    in varchar2 default null,
   p_display_cond            in varchar2 default null,
   p_display_cond2           in varchar2 default null,
   p_display_cond_type       in varchar2 default null,
   p_auth_scheme             in varchar2 default null,
   --
   p_tree_query              in varchar2,
   p_tree_button_option      in varchar2 default null,
   p_show_hints              in varchar2 default null,
   p_tree_hint_text          in varchar2 default null,
   p_tree_click_action       in varchar2 default null,
   p_selected_node           in varchar2 default null );

function generate_tree_region_query(
         p_flow_id      in number,
         p_owner        in varchar2,
         p_table_name   in varchar2,
         p_id           in varchar2,
         p_pid          in varchar2,
         p_name         in varchar2,
         p_start_item   in varchar2,
         p_start_value  in varchar2,
         p_link_option  in varchar2,
         p_link_page_id in varchar2 default null,
         p_link_item    in varchar2 default null,
         p_where        in varchar2 default null,
         p_order_by     in varchar2 default null,
         p_tooltip      in varchar2 default null,
         p_icon         in varchar2 default null
)
return varchar2;

procedure create_summary_page (
    p_flow_id                  in number   default null,
    p_page_id                  in number   default null,
    p_page_name                in varchar2 default 'Summary',
    p_group_name               in varchar2 default null,
    p_page_mode                in varchar2,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null, -- current tab name
    p_tab_text                 in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_region_id                in number   default null,
    p_region_title             in varchar2 default null,
    p_region_template          in number   default null,
    --
    p_field_template           in number   default null,
    p_label_align              in varchar2 default null,
    p_tag_attr                 in varchar2 default null,
    p_field_align              in varchar2 default null
);

procedure create_home_page (
    p_flow_id                 in varchar2,
    p_page_id                 in varchar2 default 1,
    p_name                    in varchar2 default null,
    p_template                in number   default null);

procedure create_login_page (
    p_flow_id                 in varchar2,
    p_page_id                 in varchar2 default 101,
    p_name                    in varchar2 default null,
    p_template                in number   default null,
    p_username                in varchar2 default null,
    p_password                in varchar2 default null,
    p_save_username_cookie    in boolean  default true,
    p_is_pwa                  in boolean  default false );

procedure create_login_page2 (
    p_fb_flow_id              in varchar2 default null,
    p_p826_login_page         in varchar2 default null );

procedure create_jet_chart (
   p_flow_id                  in number   default null,
   p_page_id                  in number   default null,
   p_page_name                in varchar2 default null,
   p_page_mode                in varchar2,
   p_region_template          in number   default null,
   p_region_name              in varchar2 default null,
   --
   p_tab_set                  in varchar2 default null,
   p_tab_name                 in varchar2 default null,
   p_tab_text                 in varchar2 default null,
   --
   p_nav_list_id              in number default null,
   p_nav_list_item_id         in number default null,
   p_nav_list_item_name       in varchar2 default null,
   p_nav_list_parent_item_id  in number default null,
   p_nav_list_child_item_name in varchar2 default null,
   p_nav_list_item_icon       in varchar2 default null,
   --
   p_breadcrumb_id            in number   default null,
   p_breadcrumb_name          in varchar2 default null,
   p_parent_bc_id             in number   default null,
   --
   p_sql                      in varchar2 default null,
   p_chart_type               in varchar2 default null,
   p_series_type              in varchar2 default null,
   p_max_row_count            in number   default null,
   p_no_data_found            in varchar2 default null,
   --
   p_location                 in varchar2 default null,
   p_query_type               in varchar2 default 'SQL_QUERY',
   p_web_src_module_id        in number   default null,
   p_document_source_id       in number   default null,
   p_array_column_id          in number   default null,
   p_remote_server_id         in number   default null,
   p_table_owner              in varchar2 default null,
   p_table_name               in varchar2 default null,
   p_where_clause             in varchar2 default null,
   p_order_by_clause          in varchar2 default null,
   p_optimizer_hint           in varchar2 default null,
   --
   p_columns                  in varchar2 default null,
   --
   p_series_name_column_name  in varchar2 default null,
   p_items_value_column_name  in varchar2 default null,
   p_items_low_column_name    in varchar2 default null,
   p_items_high_column_name   in varchar2 default null,
   p_items_open_column_name   in varchar2 default null,
   p_items_close_column_name  in varchar2 default null,
   p_items_volume_column_name in varchar2 default null,
   p_items_x_column_name      in varchar2 default null,
   p_items_y_column_name      in varchar2 default null,
   p_items_z_column_name      in varchar2 default null,
   p_items_target_value       in varchar2 default null,
   p_items_max_value          in varchar2 default null,
   p_group_name_column_name   in varchar2 default null,
   p_group_short_desc_column_name in varchar2 default null,
   p_items_label_column_name  in varchar2 default null,
   p_aggregate_function       in varchar2 default null,
   p_ajax_items_to_submit     in varchar2 default null,
   p_link_target              in varchar2 default null,
   p_link_target_type         in varchar2 default null,
   --
   p_gantt_start_date_column  in varchar2 default null,
   p_gantt_end_date_column    in varchar2 default null,
   p_gantt_row_id             in varchar2 default null,
   p_gantt_row_name           in varchar2 default null,
   p_gantt_task_id            in varchar2 default null,
   p_gantt_task_name          in varchar2 default null,
   p_gantt_task_start_date    in varchar2 default null,
   p_gantt_task_end_date      in varchar2 default null,
   --
   p_title                    in varchar2 default null,
   p_orientation              in varchar2 default null,
   p_stack                    in varchar2 default null,
   p_spark_chart              in varchar2 default null,
   p_color_scheme             in varchar2 default null,
   p_x_axis_title             in varchar2 default null,
   p_y_axis_title             in varchar2 default null,
   p_show_tooltip             in varchar2 default null,
   p_show_legend              in varchar2 default null,
   p_gauge_orientation        in varchar2 default null
   );

procedure create_dynamic_query_region (
    p_id                            in number   default null,
    p_flow_id                       in number   default null,
    p_page_id                       in number   default null,
    p_migrate_from_region           in number   default null,
    p_plug_name                     in varchar2 default null,
    p_plug_template                 in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_plug_display_point            in varchar2 default 'BODY',
    p_plug_display_sequence         in varchar2 default null,
    p_plug_display_column           in varchar2 default null,
    p_plug_source                   in varchar2 default null,
    p_plug_source_type              in varchar2 default null,
    p_ajax_items_to_submit          in varchar2 default null,
    --
    p_plug_required_role            in varchar2 default null,
    p_plug_display_when_condition   in varchar2 default null,
    p_plug_display_when_cond2       in varchar2 default null,
    p_plug_display_condition_type   in varchar2 default null,
    p_plug_header                   in varchar2 default null,
    p_plug_footer                   in varchar2 default null,
    --
    p_plug_customized               in varchar2 default null,
    p_plug_customized_name          in varchar2 default null,
    --
    p_plug_query_num_rows           in number   default null,
    p_plug_query_show_nulls_as      in varchar2 default null,
    p_plug_query_no_data_found      in varchar2 default null,
    p_plug_query_row_count_max      in number   default null,
    --
    p_pagination_display_position   in varchar2 default null,
    --
    p_required_patch                in varchar2 default null,
    p_plug_comment                  in varchar2 default null,
    --
    p_show_detail_link              in varchar2 default null,
    p_use_ui_defaults               in varchar2 default null,
    p_base_pk1                      in varchar2 default null,
    p_base_pk2                      in varchar2 default null,
    p_base_pk3                      in varchar2 default null);

procedure create_ir_region_on_col_info (
    p_flow_id                 in number,
    p_page_id                 in number,
    p_region_id               in number,
    p_region_title            in varchar2 default null,
    p_sql                     in varchar2 default null,
    --
    p_show_detail_link        in varchar2 default null,
    p_detail_link             in varchar2 default null,
    p_detail_link_text        in varchar2 default null,
    --
    p_table_name              in varchar2 default null,
    p_pk1                     in varchar2 default null,
    p_pk2                     in varchar2 default null,
    --
    p_db_column_name          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_display_order           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_column_label            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_report_label            in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_column_type             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_display_text_as         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_format_mask             in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_column_alignment        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_help_text               in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_group                   in wwv_flow_global.vc_arr2 default empty_vc_arr);

procedure create_query_region (
    p_id                            in number   default null,
    p_flow_id                       in number   default null,
    p_page_id                       in number   default null,
    p_plug_name                     in varchar2 default null,
    p_plug_template                 in varchar2 default null,
    p_parent_plug_id                in number   default null,
    p_plug_display_point            in varchar2 default 'BODY',
    p_include_in_reg_disp_sel_yn    in varchar2 default 'N',
    p_plug_display_sequence         in varchar2 default null,
    p_plug_display_column           in varchar2 default null,
    p_plug_source                   in varchar2 default null,
    p_plug_source_type              in varchar2 default null,
    --
    p_location                      in wwv_flow_exec_api.t_location default null,
    p_web_src_module_id             in number   default null,
    p_document_source_id            in number   default null,
    p_array_column_id               in number   default null,
    p_remote_server_id              in number   default null,
    --
    p_query_type                    in varchar2 default 'SQL',
    p_query_owner                   in varchar2 default null,
    p_query_table                   in varchar2 default null,
    p_query_where                   in varchar2 default null,
    p_query_order_by                in varchar2 default null,
    p_include_rowid                 in boolean  default false,
    --
    p_external_filter               in varchar2 default null,
    p_external_order_by             in varchar2 default null,
    --
    p_region_css_classes            in varchar2 default null,
    p_region_template_options       in varchar2 default null,
    p_component_template_options    in varchar2 default null,
    p_ajax_items_to_submit          in varchar2 default null,
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
    p_plug_header                   in varchar2 default null,
    p_plug_footer                   in varchar2 default null,
    p_plug_override_reg_pos         in varchar2 default null,
    p_plug_customized               in varchar2 default null,
    p_plug_customized_name          in varchar2 default null,
    --
    p_plug_query_row_template       in number   default null,
    p_plug_query_headings           in varchar2 default null,
    p_plug_query_headings_type      in varchar2 default 'COLON_DELMITED_LIST',
    p_plug_query_num_rows           in number   default null,
    p_plug_query_options            in varchar2 default null,
    p_plug_query_format_out         in varchar2 default null, -- obsolte, msewtz 10/28/02
    p_plug_query_show_nulls_as      in varchar2 default null,
    p_plug_query_col_allignments    in varchar2 default null,
    p_plug_query_break_cols         in varchar2 default null,
    p_plug_query_sum_cols           in varchar2 default null,
    p_plug_query_number_formats     in varchar2 default null,
    p_plug_query_table_border       in varchar2 default null, -- obsolte, msewtz 10/28/02
    p_plug_column_width             in varchar2 default null,
    p_plug_query_no_data_found      in varchar2 default null,
    p_plug_query_more_data          in varchar2 default null,
    p_plug_ignore_pagination        in number   default null, -- obsolte, msewtz 10/28/02
    p_plug_query_num_rows_item      in varchar2 default null,
    p_plug_query_num_rows_type      in varchar2 default null,
    p_plug_query_row_count_max      in number   default wwv_flow_imp.c_default_query_row_count_max,
    p_plug_query_strip_html         in varchar2 default null,
    --
    p_sort_null                     in varchar2 default null,
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
    --
    p_plug_url_text_begin           in varchar2 default null,
    p_plug_url_text_end             in varchar2 default null,
    p_java_entry_point              in varchar2 default null,
    --
    p_plug_caching                  in varchar2 default null,
    p_plug_caching_session_state    in varchar2 default null,
    p_plug_caching_max_age_in_sec   in varchar2 default null,
    --
    p_plug_chart_font_size          in varchar2 default null,
    p_plug_chart_max_rows           in varchar2 default null,
    p_plug_chart_num_mask           in varchar2 default null,
    p_plug_chart_scale              in varchar2 default null,
    p_plug_chart_axis               in varchar2 default null,
    p_plug_chart_show_summary       in varchar2 default null,
    --
    p_menu_template_id              in number   default null,
    --
    p_required_patch                in varchar2 default null,
    p_plug_comment                  in varchar2 default null,
    --
    p_prn_output                    in varchar2 default null,
    p_prn_format                    in varchar2 default null,
    p_prn_label                     in varchar2 default null,
    p_column_heading_sort           in varchar2 default null,
    p_enable_search                 in varchar2 default null,
    p_search_list                   in varchar2 default null,
    p_use_ui_defaults               in varchar2 default null );

procedure create_next_prev_pk_process (
    p_flow_id          in number,
    p_page_id          in number,
    p_page_mode        in varchar2 default wwv_flow_page.c_page_mode_normal,
    p_owner            in varchar2 default null,
    p_table            in varchar2 default null,
    p_nav_region       in varchar2 default null,
    p_pk_column        in varchar2 default null,
    p_pk_column2       in varchar2 default null,
    p_sort_column      in varchar2 default null,
    p_sort_column2     in varchar2 default null,
    p_item_pk          in varchar2 default null,
    p_item_pk2         in varchar2 default null,
    p_where            in varchar2 default null);

procedure create_dynamic_query (
    p_flow_id                   in number   default null,
    p_page_id                   in number   default null,
    p_page_name                 in varchar2 default null,
    p_group_name                in varchar2 default null,
    p_page_mode                 in varchar2,
    p_region_name               in varchar2 default null,
    p_region_template           in varchar2 default null,
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in  number  default null,
    --
    p_query                     in varchar2 default null,
    p_show_detail_link          in varchar2 default null,
    p_use_ui_defaults           in varchar2 default null,
    p_base_pk1                  in varchar2 default null,
    p_base_pk2                  in varchar2 default null,
    p_base_pk3                  in varchar2 default null
    );

procedure create_report_on_ws (
    p_flow_id                  in number   default null,
    p_page_id                  in number   default null,
    p_page_name                in varchar2 default null,
    p_group_name               in varchar2 default null,
    p_page_mode                in varchar2,
    p_region_name              in varchar2 default null,
    p_region_template          in varchar2 default null,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_text                 in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_report_template          in varchar2 default null,
    p_rows_per_page            in varchar2 default null,
    --
    p_breadcrumb_id            in number   default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_bc_id             in  number  default null,
    --
    p_query                    in varchar2 default null
    );


--==============================================================================
-- Creates page buttons, both item and region based
--==============================================================================
procedure create_button (
    p_where                         varchar2,
    p_flow_id                       number,
    p_flow_step_id                  number,
    p_button_sequence               number      default null,
    p_button_plug_id                number,
    p_button_position               varchar2    default 'BODY',
    p_button_name                   varchar2,
    p_button_template_id            number      default null,
    p_button_image                  varchar2    default null,
    p_button_is_hot                 varchar2    default 'N',
    p_button_image_alt              varchar2,
    p_button_redirect_url           varchar2    default null,
    p_button_action                 varchar2    default wwv_flow_button.c_action_submit,
    p_button_execute_validations    varchar2    default 'Y',
    p_confirm_message               varchar2    default null,
    p_confirm_style                 varchar2    default null,
    p_button_image_attributes       varchar2    default null,
    p_button_attributes             varchar2,
    p_button_style                  varchar2    default 'BUTTON_TEMPLATE',
    -- REPORT action only parameter
    p_report_query                  varchar2    default null,
    -- region button only parameters
    p_button_alignment              varchar2    default null,
    -- item button only parameters
    p_begins_on_new_line            varchar2    default null,
    p_begins_on_new_field           varchar2    default null,
    -- condition only parameters
    p_button_condition_type         varchar2    default null,
    p_button_condition              varchar2    default null,
    p_button_condition2             varchar2    default null )
    ;

--==============================================================================
-- Wrapper for creating Form Delete buttons
--==============================================================================
procedure create_delete_button (
    p_id                 in number   default null,
    p_application_id     in number,
    p_page_id            in number,
    p_sequence           in number   default 20,
    p_region_id          in number,
    --
    p_name               in varchar2 default 'DELETE',
    p_label              in varchar2,
    p_database_action    in varchar2 default 'DELETE',
    p_template_id        in number   default wwv_flow_theme_globals.g_default_button_template,
    p_template_options   in varchar2 default null,
    --
    -- either provide p_region_template_id, in which case the position will be under the common #DELETE#
    -- or a different position and p_region_template_id as null
    p_position           in varchar2 default 'DELETE',
    p_region_template_id in number,
    --
    p_condition_type     in varchar2 default null,
    p_condition_expr1    in varchar2 default null,
    p_condition_expr2    in varchar2 default null );


--==============================================================================
-- Returns true if the specified region or one of its sub region has a button
--==============================================================================
function has_region_buttons (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region or one of its sub region has an item
--==============================================================================
function has_region_items (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region or one of its sub region has a validation.
--==============================================================================
function has_region_validations (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region or one of its sub region has a process.
--==============================================================================
function has_region_processes (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region has sub regions
--==============================================================================
function has_region_sub_regions (
    p_region_id         in number,
    p_flow_id           in number,
    p_page_id           in number,
    p_security_group_id in number )
    return boolean;

--==============================================================================
-- Returns true if the specified region has a master region
--==============================================================================
function has_region_master_region (
   p_region_id         in number,
   p_flow_id           in number,
   p_page_id           in number,
   p_security_group_id in number )
   return boolean;

--==============================================================================
-- Deletes a region and depending on the flags sub regions, buttons, items, ...
-- which belong to the region. If the flags are false then the region relation
-- is set to null in the effected components.
--==============================================================================
procedure delete_region (
    p_region_id          in number,
    p_flow_id            in number,
    p_page_id            in number,
    p_security_group_id  in number,
    p_delete_buttons     in boolean,
    p_delete_items       in boolean,
    p_delete_sub_regions in boolean,
    p_delete_lists       in boolean,
    p_delete_dyn_actions in boolean );

--===============================================================================
-- Creates 4 pages for the data upload wizard
--===============================================================================
procedure create_data_load_wizard(
    p_flow_id                  in number,
    --
    p_name                     in varchar2,
    p_owner                    in varchar2,
    p_table_name               in varchar2,
    p_exists                   in varchar2 default 'no',
    p_page_mode                in varchar2,
    p_group_name               in varchar2 default null,
    --
    --
    p_tab_set                  in varchar2,
    p_tab_name                 in varchar2,
    p_tab_label                in varchar2,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_item_id         in number   default null,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_breadcrumb_id            in number,
    p_breadcrumb_name          in varchar2,
    p_parent_breadcrumb_id     in number,
    --
    p_page_step_1              in number,
    p_page_step_2              in number,
    p_page_step_3              in number,
    p_page_step_4              in number,
    --
    p_page_label_step_1        in varchar2,
    p_page_label_step_2        in varchar2,
    p_page_label_step_3        in varchar2,
    p_page_label_step_4        in varchar2,
    --
    p_region_name_step_1       in varchar2,
    p_region_name_step_2       in varchar2,
    p_region_name_step_3       in varchar2,
    p_region_name_step_4       in varchar2,
    --
    p_page_next_label          in varchar2 default 'NEXT',
    p_page_previous_label      in varchar2 default 'PREVIOUS',
    p_page_cancel_label        in varchar2 default 'CANCEL',
    p_page_cancel_branch       in varchar2 default '1',
    p_page_finish_label        in varchar2 default 'SUBMIT',
    p_page_finish_branch       in varchar2 default '1' );

--===============================================================================
-- Creates a page and a region based on a plug-in.
--===============================================================================
procedure create_region_plugin_page (
    p_flow_id                  in number,
    --
    p_page_id                  in number,
    p_page_name                in varchar2,
    p_group_name               in varchar2                       default null,
    p_page_mode                in varchar2,
    --
    p_tab_set                  in varchar2                       default null,
    p_tab_name                 in varchar2                       default null,
    p_tab_label                in varchar2                       default null,
    --
    p_nav_list_id              in number                         default null,
    p_nav_list_item_id         in number                         default null,
    p_nav_list_item_name       in varchar2                       default null,
    p_nav_list_parent_item_id  in number                         default null,
    p_nav_list_child_item_name in varchar2                       default null,
    p_nav_list_item_icon       in varchar2                       default null,
    --
    p_breadcrumb_id            in number,
    p_breadcrumb_name          in varchar2,
    p_parent_breadcrumb_id     in number,
    --
    p_region_name              in varchar2,
    p_region_type              in varchar2,
    --
    p_location                 in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_source_type              in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id         in number                         default null,

    p_table_owner              in varchar2                       default null,
    p_table_name               in varchar2                       default null,
    p_region_source            in varchar2                       default null,
    p_function_body_language in wwv_flow_code_exec.t_language    default null,
    p_column_names             in varchar2                       default null,
    p_web_src_module_id        in number                         default null,
    p_document_source_id       in number                         default null,
    p_array_column_id          in number                         default null,
    --
    p_attributes               in clob                           default null );

--===============================================================================
-- Creates a region based on a plug-in.
--===============================================================================
procedure create_region_plugin (
    p_id                          in number                         default null,
    p_application_id              in number,
    p_page_id                     in number,
    p_title                       in varchar2,
    p_parent_region_id            in number                         default null,
    p_slot                        in varchar2                       default 'BODY',
    p_display_sequence            in number                         default 10,
    p_include_in_reg_disp_sel_yn  in varchar2                       default 'N',
    p_template_id                 in number                         default null,
    p_region_css_classes          in varchar2                       default null,
    p_region_template_options     in varchar2                       default null,
    p_component_template_options  in varchar2                       default null,
    p_type                        in varchar2,
    --
    p_location                    in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_source_type                 in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id            in number                         default null,
    p_table_owner                 in varchar2                       default null,
    p_table_name                  in varchar2                       default null,
    p_source                      in varchar2                       default null,
    p_function_body_language      in wwv_flow_code_exec.t_language  default null,
    p_column_names                in varchar2                       default null,
    p_web_src_module_id           in number                         default null,
    p_document_source_id          in number                         default null,
    p_array_column_id             in number                         default null,
    --
    p_ajax_items_to_submit        in varchar2                       default null,
    --
    p_attributes                  in clob                           default null,
    --
    p_condition_type              in varchar2                       default null,
    p_condition_expr              in varchar2                       default null,
    p_condition_expr2             in varchar2                       default null );

--===============================================================================
-- Creates region columns for a region where the type uses region columns.
--===============================================================================
procedure create_region_columns (
    p_application_id         in number,
    p_page_id                in number,
    p_region_id              in number,
    p_region_type            in varchar2,
    --
    p_location               in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_source_type            in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_sql_query,
    p_remote_server_id       in number                         default null,
    p_table_owner            in varchar2                       default null,
    p_table_name             in varchar2                       default null,
    p_region_sql             in varchar2                       default null,
    p_function_body_language in wwv_flow_code_exec.t_language,
    p_column_names           in varchar2                       default null,
    p_web_src_module_id      in number                         default null,
    p_document_source_id     in number                         default null,
    p_array_column_id        in number                         default null );

function create_breadcrumb_region (
    p_application_id             in number,
    p_page_id                    in number,
    p_seq                        in number,
    p_breadcrumb_id              in number,
    p_breadcrumb_entry_id        in number   default null,
    p_breadcrumb_entry_name      in varchar2,
    p_parent_breadcrumb_entry_id in number,
    p_ignore_global_breadcrumb   in boolean  default false )
    return number;

procedure create_breadcrumb_region (
    p_application_id             in number,
    p_page_id                    in number,
    p_seq                        in number,
    p_breadcrumb_id              in number,
    p_breadcrumb_entry_id        in number   default null,
    p_breadcrumb_entry_name      in varchar2,
    p_parent_breadcrumb_entry_id in number,
    p_ignore_global_breadcrumb   in boolean  default false );

procedure copy_button (
    p_button_id_from         in number,
    p_button_name_to         in varchar2,
    p_button_text_to         in varchar2,
    p_button_page_id_to      in number   default null,
    p_button_region_to       in number   default null,
    p_button_position_to     in varchar2 default null,
    p_button_sequence_to     in number   default null );

procedure copy_page_item (
    p_copy_from_item_id     in number,
    p_copy_to_item_name     in varchar2,
    p_copy_to_item_sequence in varchar2,
    p_copy_to_page_id       in number   default null,
    p_copy_to_item_plug     in varchar2 default null,
    p_copy_to_item_position in varchar2 default null,
    p_copy_to_prompt        in varchar2 default null );

procedure create_user_interface (
    p_flow_id         in number,
    p_theme_id        in number,
    p_home_url        in varchar2,
    p_login_url       in varchar2,
    p_global_page_id  in number
);

procedure create_tab (
     p_flow_id       in number,
     p_page_id       in number,
     p_tab_set       in varchar2,
     p_tab_name      in varchar2 default null,
     p_tab_text      in varchar2 default null,
     p_tab_also_current_for_pages in varchar2 default null);

procedure create_navigation_list_item (
    p_flow_id                  in number,
    p_page_id                  in number,
    p_nav_list_id              in number,
    p_nav_list_item_name       in varchar2 default null,
    p_nav_list_parent_item_id  in number default null,
    p_nav_list_child_item_name in varchar2 default null,
    p_nav_list_item_icon       in varchar2 default null,
    p_is_admin_page            in boolean default false );

--==============================================================================
procedure create_list (
    p_flow_id                  in number,
    p_page_id                  in number,
    p_name                     in varchar2,
    p_entry_name_01            in varchar2,
    p_page_01                  in varchar2,
    p_entry_name_02            in varchar2,
    p_page_02                  in varchar2,
    p_entry_name_03            in varchar2,
    p_page_03                  in varchar2,
    p_entry_name_04            in varchar2,
    p_page_04                  in varchar2,
    p_entry_name_05            in varchar2,
    p_page_05                  in varchar2,
    p_deploy                   in varchar2, -- CURRENT_PAGE or EACH_ENTRY
    p_region_template          in varchar2,
    p_list_template_id         in varchar2,
    p_region_position          in varchar2,
    p_required_patch           in varchar2 );

procedure create_md_single_page (
    p_application_id            in number,
    p_page_id                   in number,
    p_page_name                 in varchar2 default null,
    p_page_mode                 in varchar2,
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    p_nav_list_item_icon        in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in number   default null,
    --
    p_master_region             in t_md,
    p_detail_region             in t_md );

procedure create_md_two_page (
    p_application_id            in number,
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_item_id          in number   default null,
    p_nav_list_item_name        in varchar2 default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    p_nav_list_item_icon        in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_parent_bc_id              in number   default null,
    --
    p_master                    in t_md,
    p_detail                    in t_md );

--
-- creates MD both from create page and create app wizard
--
procedure create_md_side_by_side (
    p_app_id                    in number,
    -- md main page
    p_md_page_id                in number,
    p_md_page_name              in varchar2,
    p_md_page_mode              in varchar2,
    --
    p_table_owner               in varchar2,
    p_master                    in t_md,
    p_details                   in t_mds,
    --
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    p_nav_list_item_icon        in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in number   default null );

--
-- creates MD from create page wizard
--
procedure create_md_side_by_side(
    p_app_id                    in number,
    p_starting_page_id          in number,
    p_md_page_name              in varchar2,
    --
    p_table_owner               in varchar2,
    p_master_table              in varchar2,
    p_primary_label_col         in varchar2,
    p_secondary_label_col       in varchar2 default null,
    p_detail_table_1            in varchar2,
    p_detail_table_2            in varchar2 default null,
    p_detail_table_3            in varchar2 default null,
    p_detail_table_4            in varchar2 default null,
    --
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    p_nav_list_item_icon        in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in number   default null );

--
-- creates dashboard page from create page wizard
--
procedure create_dashboard_page(
    p_app_id                    in number,
    p_page_id                   in number,
    p_page_name                 in varchar2,
    p_page_mode                 in varchar2,
    --
    p_dashboard_layout          in varchar2,
    --
    p_tab_set                   in varchar2 default null,
    p_tab_name                  in varchar2 default null,
    p_tab_text                  in varchar2 default null,
    --
    p_nav_list_id               in number   default null,
    p_nav_list_parent_item_id   in number   default null,
    p_nav_list_child_item_name  in varchar2 default null,
    p_nav_list_item_icon        in varchar2 default null,
    --
    p_breadcrumb_id             in number   default null,
    p_breadcrumb_name           in varchar2 default null,
    p_parent_bc_id              in number   default null );

procedure create_app (
    p_id                          in number,
    p_owner                       in varchar2,
    p_name                        in varchar2,
    p_alias                       in varchar2 default null,
    p_language                    in varchar2,
    p_language_derived_from       in varchar2 default 'FLOW_PRIMARY_LANGUAGE',
    --
    p_date_format                 in varchar2 default null,
    p_date_time_format            in varchar2 default null,
    p_timestamp_format            in varchar2 default null,
    p_timestamp_tz_format         in varchar2 default null,
    --
    p_pwa_is_installable          in boolean  default false,
    p_pwa_is_push_enabled         in boolean  default false,
    --
    p_debugging                   in boolean  default false,
    p_logging                     in boolean  default true,
    p_deep_linking                in boolean  default false,
    p_runtime_api_usage           in varchar2 default null,
    p_version                     in varchar2 default null,
    --
    p_max_session_length_sec      in number   default null,
    p_max_session_idle_sec        in number   default null,
    p_session_timeout_warning_sec in number   default null,
    --
    p_substitution_string_01      in varchar2 default null,
    p_substitution_value_01       in varchar2 default null,
    p_substitution_string_02      in varchar2 default null,
    p_substitution_value_02       in varchar2 default null );

--==============================================================================
-- Returns an "Order By Item" clause for a region. Has to be called before
-- calling create_order_by_item.
--
-- For remote databases, the remote server ID must be passed in to use the
-- correct enquoting for the remote database type.
--
-- If p_column_positionX is passed, the order by clause will use
-- positional syntax (1 asc, 2 desc) instead of the actual column name.
--==============================================================================
function get_order_by_item (
    p_page_id               in number,
    p_location              in varchar2,
    p_remote_server_id      in number,
    p_query_type            in varchar2,
    p_table_owner           in varchar2,
    p_table_name            in varchar2,
    p_sql_plsql_source      in varchar2,
    p_column_name1          in varchar2,
    p_column_position1      in pls_integer default null,
    p_column_name2          in varchar2,
    p_column_position2      in pls_integer default null,
    p_column_name3          in varchar2    default null,
    p_column_position3      in pls_integer default null )
    return t_order_by_item;

--==============================================================================
-- Creates an order by select list page item if the p_order_by_item parameter
-- has been populated by get_order_by_item.
--==============================================================================
procedure create_order_by_item (
    p_app_id                  in number,
    p_page_id                 in number,
    p_region_id               in number,
    p_region_template_id      in number,
    p_template_component_type in varchar2,
    p_order_by_item           in t_order_by_item );

--------------------------------------------------------------------------------
-- Creates collection with name p_collection_name
-- Calls wwv_flow_exec_dev.check_and_describe to describe the data source
--
-- c001 => column_name_esc
-- c002 => column_name
-- c003 => data_type
-- c004 => is_primary_key (Y/N) -- Only available when p_extended_describe is TRUE
-- n001 => data_type_length
--------------------------------------------------------------------------------
procedure create_column_collection (
    p_collection_name        in varchar2,
    p_location               in varchar2,
    p_query_type             in varchar2,
    p_owner                  in varchar2,
    p_table_name             in varchar2,
    p_sql_query              in varchar2,
    p_web_src_module_id      in number,
    p_document_source_id     in number,
    p_array_column_id        in number,
    p_remote_server_id       in number,
    p_extended_describe      in boolean default false );

--------------------------------------------------------------------------------
-- Initializes the create page wizard
-- It is used to set page items before calling create page wizard
--------------------------------------------------------------------------------
procedure init_create_page_wiz(
    p_application_id        in  number,
    p_navigation_type       out varchar2,
    p_navlist_id            out number,
    p_is_navlist_subscribed out varchar2,
    p_navbar_id             out number,
    p_theme_id              out number,
    p_is_ut_based           out varchar2,
    p_is_rw_based           out varchar2,
    p_is_font_apex          out varchar2 );

--------------------------------------------------------------------------------
-- Returns true if the list is subscribed, otherwise returns false
--------------------------------------------------------------------------------
function is_list_subscribed(
    p_list_id   in number,
    p_app_id    in number )
    return boolean;

end wwv_flow_wizard_api;
/
show errors
