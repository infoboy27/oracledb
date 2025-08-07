set define '^' verify off
prompt ...wwv_flow_report_dev.sql
create or replace package wwv_flow_report_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2019, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_report_dev.sql
--
--    DESCRIPTION
--      Builder-specific procedures for handling report (CR, IR, IG) page and region
--
--    MODIFIED   (MM/DD/YYYY)
--    cbcho       08/28/2019 - created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

c_region_position_body       constant varchar2(4)  := 'BODY';

--======================================================================================================================
-- Creates new shared LOV if [table, display, return values] not found and returns the new ID.
-- If found, returns existing LOV ID.
--======================================================================================================================
function get_shared_lov_id(
    p_app_id               in number,
    p_table_owner          in varchar2,
    p_table_name           in varchar2,
    p_display_column       in varchar2,
    p_return_column        in varchar2 ) return number;

--======================================================================================================================
-- Wrapper to wwv_dictionary_cache_dev.fetch_fk_con_cache with parsing schema check
--======================================================================================================================
function get_fk_cons_cache(
    p_app_id           in number,
    p_table_owner      in varchar2,
    p_table_name       in varchar2 )
return wwv_dictionary_cache_dev.t_cache_fk_cons;

--======================================================================================================================
-- Creates a classic report region
--======================================================================================================================
procedure create_cr_region(
    p_id                      in number                              default null,
    p_app_id                  in number,
    p_page_id                 in number,
    p_title                   in varchar2,
    p_display_sequence        in number                              default 10,
    p_region_template_id      in number                              default null,
    p_report_template_id      in number                              default null,
    p_new_grid_row            in boolean                             default true,
    p_new_grid_column         in boolean                             default true,
    --
    p_location                in varchar2                            default wwv_flow_exec_api.c_location_local_db,
    p_query_type              in varchar2                            default wwv_flow_exec_api.c_query_type_sql_query,
    p_web_source_module_id    in number                              default null,
    p_document_source_id      in number                              default null,
    p_array_column_id         in number                              default null,
    p_remote_server_id        in number                              default null,
    p_table_owner             in varchar2                            default null,
    p_table_name              in varchar2                            default null,
    p_table_where             in varchar2                            default null,
    p_sql_plsql_source        in varchar2                            default null,
    p_function_body_language  in wwv_flow_code_exec.t_language       default null,
    --
    p_primary_key_columns     in wwv_flow_t_varchar2                 default null,
    p_form_page_id            in number                              default null,
    p_form_page_mode          in varchar2                            default null,
    p_include_new_button      in boolean                             default false,
    p_report_columns          in wwv_flow_t_varchar2                 default null,
    p_hidden_columns          in wwv_flow_t_varchar2                 default null,
    --
    p_csv_output              in boolean                             default false,
    p_csv_output_link_text    in varchar2                            default wwv_flow_lang_dev.builder_message( 'DOWNLOAD' ),
    --
    p_max_row_count           in number                              default null,
    --
    p_display_when_condition  in varchar2                            default null,
    p_display_when_cond2      in varchar2                            default null,
    p_display_condition_type  in varchar2                            default null,
    --
    p_describe_result         in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result,
    p_region_template_options in varchar2                            default null );

--======================================================================================================================
-- Creates a classic report page
--======================================================================================================================
procedure create_cr_page(
    p_app_id                     in number,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_group_name                 in varchar2                            default null,
    p_page_mode                  in varchar2,
    p_use_ui_default             in boolean                             default false,
    --
    p_tab_set                    in varchar2                            default null,
    p_tab_name                   in varchar2                            default null,
    p_tab_text                   in varchar2                            default null,
    --
    p_nav_list_id                in number                              default null,
    p_nav_list_parent_item_id    in number                              default null,
    p_nav_list_child_item_name   in varchar2                            default null,
    p_nav_list_item_icon         in varchar2                            default null,
    --
    p_breadcrumb_id              in number                              default null,
    p_breadcrumb_entry_name      in varchar2                            default null,
    p_parent_breadcrumb_entry_id in number                              default null,
    --
    p_region_title               in varchar2,
    p_region_template_id         in number                              default null,
    p_report_template_id         in number                              default null,
    --
    p_location                   in wwv_flow_exec_api.t_location        default wwv_flow_exec_api.c_location_local_db,
    p_query_type                 in wwv_flow_exec_api.t_query_type,
    p_table_owner                in varchar2                            default null,
    p_table_name                 in varchar2                            default null,
    p_table_where                in varchar2                            default null,
    p_sql_plsql_source           in varchar2                            default null,
    p_function_body_language     in wwv_flow_code_exec.t_language       default null,
    --
    p_remote_server_id           in number                              default null,
    p_web_source_module_id       in number                              default null,
    p_document_source_id         in number                              default null,
    p_array_column_id            in number                              default null,
    --
    p_primary_key_columns        in wwv_flow_t_varchar2                 default null,
    p_form_page_id               in number                              default null,
    p_form_page_mode             in varchar2                            default null,
    p_include_new_button         in boolean                             default false,
    p_report_columns             in wwv_flow_t_varchar2                 default null,
    p_hidden_columns             in wwv_flow_t_varchar2                 default null,
    --
    p_csv_output                 in boolean                             default false,
    p_csv_output_link_text       in varchar2                            default wwv_flow_lang_dev.builder_message( 'DOWNLOAD' ),
    --
    p_max_row_count              in number                              default null,
    --
    p_describe_result            in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result );

--======================================================================================================================
-- Creates native Cards region
--======================================================================================================================
procedure create_card_region (
    p_id                         in number                         default null,
    p_app_id                     in number,
    p_page_id                    in number,
    p_page_mode                  in varchar2,
    p_region_title               in varchar2,
    p_region_template_id         in number                         default null,
    p_display_sequence           in number                         default 10,
    p_new_grid_row               in boolean                        default true,
    p_new_grid_column            in boolean                        default true,
    --
    p_location                   in varchar2                       default wwv_flow_exec_api.c_location_local_db,
    p_query_type                 in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_table,
    p_table_owner                in varchar2                       default null,
    p_table_name                 in varchar2                       default null,
    p_sql_plsql_source           in varchar2                       default null,
    --
    p_remote_server_id           in number                         default null,
    p_web_source_module_id       in number                         default null,
    p_document_source_id         in number                         default null,
    p_array_column_id            in number                         default null,
    --
    p_layout_type                in varchar2                       default null,
    p_title_column_name          in varchar2,
    p_body_column_name           in varchar2                       default null,
    p_icon_column_name           in varchar2                       default null,
    p_badge_column_name          in varchar2                       default null );

--======================================================================================================================
-- Creates native Cards region page
--======================================================================================================================
procedure create_card_page(
    p_app_id                     in number,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_group_name                 in varchar2                            default null,
    p_page_mode                  in varchar2,
    p_use_ui_default             in boolean                             default false,
    --
    p_tab_set                    in varchar2                            default null,
    p_tab_name                   in varchar2                            default null,
    p_tab_text                   in varchar2                            default null,
    --
    p_nav_list_id                in number                              default null,
    p_nav_list_parent_item_id    in number                              default null,
    p_nav_list_child_item_name   in varchar2                            default null,
    p_nav_list_item_icon         in varchar2                            default null,
    --
    p_breadcrumb_id              in number                              default null,
    p_breadcrumb_entry_name      in varchar2                            default null,
    p_parent_breadcrumb_entry_id in number                              default null,
    --
    p_location                   in wwv_flow_exec_api.t_location        default wwv_flow_exec_api.c_location_local_db,
    p_query_type                 in wwv_flow_exec_api.t_query_type,
    p_table_owner                in varchar2                            default null,
    p_table_name                 in varchar2                            default null,
    p_sql_plsql_source           in varchar2                            default null,
    --
    p_remote_server_id           in number                              default null,
    p_web_source_module_id       in number                              default null,
    p_document_source_id         in number                              default null,
    p_array_column_id            in number                              default null,
    --
    p_layout_type                in varchar2                            default null,
    p_title_column_name          in varchar2,
    p_body_column_name           in varchar2                            default null,
    p_icon_column_name           in varchar2                            default null,
    p_badge_column_name          in varchar2                            default null );

--======================================================================================================================
-- Creates native IR region
--======================================================================================================================
procedure create_ir_region (
    p_id                            in number                              default null,
    p_flow_id                       in number                              default null,
    p_page_id                       in number                              default null,
    p_migrate_from_region           in number                              default null,
    p_plug_name                     in varchar2                            default null,
    p_plug_template                 in varchar2                            default null,
    p_parent_plug_id                in number                              default null,
    p_plug_display_point            in varchar2                            default c_region_position_body,
    p_plug_display_sequence         in varchar2                            default null,
    p_plug_display_column           in varchar2                            default null,
    p_ajax_items_to_submit          in varchar2                            default null,
    --
    p_query_type                    in varchar2,
    p_location                      in varchar2                            default wwv_flow_exec_api.c_location_local_db,
    p_remote_server_id              in number                              default null,
    p_web_src_module_id             in number                              default null,
    p_document_source_id            in number                              default null,
    p_array_column_id               in number                              default null,
    p_owner                         in varchar2                            default null,
    p_table_name                    in varchar2                            default null,
    p_sql_source                    in varchar2                            default null,
    p_include_rowid_column          in boolean                             default false,
    --
    p_columns                       in varchar2                            default null,
    --
    p_plug_required_role            in varchar2                            default null,
    p_plug_display_when_condition   in varchar2                            default null,
    p_plug_display_when_cond2       in varchar2                            default null,
    p_plug_display_condition_type   in varchar2                            default null,
    p_plug_header                   in varchar2                            default null,
    p_plug_footer                   in varchar2                            default null,
    --
    p_plug_customized               in varchar2                            default null,
    p_plug_customized_name          in varchar2                            default null,
    --
    p_plug_query_num_rows           in number                              default null,
    p_plug_query_show_nulls_as      in varchar2                            default null,
    p_plug_query_no_data_found      in varchar2                            default null,
    p_plug_query_row_count_max      in number                              default null,
    --
    p_pagination_display_position   in varchar2                            default null,
    --
    p_required_patch                in varchar2                            default null,
    p_plug_comment                  in varchar2                            default null,
    --
    p_show_detail_link              in varchar2                            default null,
    p_detail_link                   in varchar2                            default null,
    p_detail_link_text              in varchar2                            default null,
    p_detail_link_attr              in varchar2                            default null,
    --
    p_show_notify                   in boolean                             default true,
    p_allow_report_saving           in boolean                             default true,
    p_allow_save_rpt_public         in boolean                             default false,
    --
    p_use_ui_defaults               in varchar2                            default null,
    p_base_pk1                      in varchar2                            default null,
    p_base_pk2                      in varchar2                            default null,
    p_base_pk3                      in varchar2                            default null,
    p_form_page_id                  in number                              default null,
    p_form_page_mode                in varchar2                            default null,
    p_include_new_button            in boolean                             default false,
    p_web_src_param_collection      in varchar2                            default null,
    --
    p_describe_result               in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result );

--======================================================================================================================
-- Creates IR page, used in create page wizard, create app wizard
--======================================================================================================================
procedure create_ir_page(
    p_flow_id                   in number                              default null,
    p_page_id                   in number                              default null,
    p_page_name                 in varchar2                            default null,
    p_group_name                in varchar2                            default null,
    p_page_mode                 in varchar2,
    p_region_name               in varchar2                            default null,
    p_region_template           in varchar2                            default null,
    p_tab_set                   in varchar2                            default null,
    p_tab_name                  in varchar2                            default null,
    p_tab_text                  in varchar2                            default null,
    --
    p_nav_list_id               in number                              default null,
    p_nav_list_item_id          in number                              default null,
    p_nav_list_item_name        in varchar2                            default null,
    p_nav_list_parent_item_id   in number                              default null,
    p_nav_list_child_item_name  in varchar2                            default null,
    p_nav_list_item_icon        in varchar2                            default null,
    --
    p_breadcrumb_id             in number                              default null,
    p_breadcrumb_name           in varchar2                            default null,
    p_parent_bc_id              in number                              default null,
    --
    p_query_type                in varchar2,
    p_location                  in varchar2                            default wwv_flow_exec_api.c_location_local_db,
    p_remote_server_id          in number                              default null,
    p_web_src_module_id         in number                              default null,
    p_document_source_id        in number                              default null,
    p_array_column_id           in number                              default null,
    p_table_owner               in varchar2                            default null,
    p_table_name                in varchar2                            default null,
    p_sql_source                in varchar2                            default null,
    p_where_clause              in varchar2                            default null,
    p_order_by_clause           in varchar2                            default null,
    p_include_rowid_column      in boolean                             default false,
    p_optimizer_hint            in varchar2                            default null,
    --
    p_columns                   in varchar2                            default null,
    --
    p_show_detail_link          in varchar2                            default null,
    p_detail_link               in varchar2                            default null,
    p_detail_link_text          in varchar2                            default null,
    p_detail_link_attr          in varchar2                            default null,
    --
    p_show_notify               in boolean                             default true,
    p_allow_report_saving       in boolean                             default true,
    p_allow_save_rpt_public     in boolean                             default false,
    --
    p_use_ui_defaults           in varchar2                            default null,
    p_base_pk1                  in varchar2                            default null,
    p_base_pk2                  in varchar2                            default null,
    p_base_pk3                  in varchar2                            default null,
    p_form_page_id              in number                              default null,
    p_form_page_mode            in varchar2                            default null,
    p_include_new_button        in boolean                             default false,
    p_web_src_param_collection  in varchar2                            default null,
    --
    p_help_text                 in varchar2                            default null,
    p_describe_result           in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result );

--======================================================================================================================
-- Creates IR region, used in create page wizard
--======================================================================================================================
procedure create_ig_region (
    p_id                     in number                              default null,
    p_application_id         in number,
    p_page_id                in number,
    p_title                  in varchar2,
    p_display_sequence       in number                              default 10,
    p_dml_process_sequence   in number                              default 10,
    p_region_template_id     in number                              default null,
    --
    p_location               in varchar2                            default wwv_flow_exec_api.c_location_local_db,
    p_query_type             in varchar2                            default wwv_flow_exec_api.c_query_type_sql_query,
    p_web_src_module_id      in number                              default null,
    p_document_source_id     in number                              default null,
    p_array_column_id        in number                              default null,
    p_remote_server_id       in number                              default null,
    p_table_owner            in varchar2                            default null,
    p_table_name             in varchar2                            default null,
    p_table_where            in varchar2                            default null,
    p_external_filter        in varchar2                            default null,
    p_include_rowid_column   in boolean                             default false,
    p_sql                    in varchar2                            default null,
    p_function_body_language in varchar2                            default null,
    p_columns                in varchar2                            default null,
    p_automatic_lovs         in boolean                             default false,
    --
    p_is_editable            in boolean                             default false,
    p_save_when_button_id    in number                              default null,
    p_toolbar_buttons        in varchar2                            default 'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE',
    p_pk_column              in varchar2                            default null,
    p_pk2_column             in varchar2                            default null,
    p_fk_columns             in varchar2                            default null,
    p_form_page_id           in number                              default null,
    p_form_page_mode         in varchar2                            default null,
    p_include_new_button     in boolean                             default false,
    p_link                   in varchar2                            default null,
    p_ajax_items_to_submit   in varchar2                            default null,
    p_describe_result        in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result );

--======================================================================================================================
-- Creates IR page, used in create page wizard
--======================================================================================================================
procedure create_ig_page (
    p_application_id            in number,
    p_page_id                   in number,
    p_page_name                 in varchar2                            default null,
    p_page_mode                 in varchar2,
    p_region_template_id        in number                              default null,
    --
    p_tab_set                   in varchar2                            default null,
    p_tab_name                  in varchar2                            default null,
    p_tab_text                  in varchar2                            default null,
    --
    p_nav_list_id               in number                              default null,
    p_nav_list_item_id          in number                              default null,
    p_nav_list_item_name        in varchar2                            default null,
    p_nav_list_parent_item_id   in number                              default null,
    p_nav_list_child_item_name  in varchar2                            default null,
    p_nav_list_item_icon        in varchar2                            default null,
    --
    p_breadcrumb_id             in number                              default null,
    p_breadcrumb_name           in varchar2                            default null,
    p_parent_bc_id              in number                              default null,
    --
    p_location                  in varchar2                            default wwv_flow_exec_api.c_location_local_db,
    p_query_type                in varchar2                            default wwv_flow_exec_api.c_query_type_sql_query,
    p_web_src_module_id         in number                              default null,
    p_document_source_id        in number                              default null,
    p_array_column_id           in number                              default null,
    p_remote_server_id          in number                              default null,
    p_table_owner               in varchar2                            default null,
    p_table_name                in varchar2                            default null,
    p_include_rowid_column      in boolean                             default false,
    p_sql                       in varchar2                            default null,
    p_function_body_language    in varchar2                            default null,
    p_columns                   in varchar2                            default null,
    p_automatic_lovs            in boolean                             default false,
    --
    p_is_editable               in boolean                             default false,
    p_pk_column                 in varchar2                            default null,
    p_pk2_column                in varchar2                            default null,
    p_form_page_id              in number                              default null,
    p_form_page_mode            in varchar2                            default null,
    p_include_new_button        in boolean                             default false,
    p_link                      in varchar2                            default null,
    p_describe_result           in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result );

--======================================================================================================================
-- Creates a Template Component report region
--======================================================================================================================
procedure create_tmpl_component_region (
    p_id                         in number    default null,
    p_app_id                     in number,
    p_page_id                    in number,
    p_page_mode                  in varchar2,
    p_region_title               in varchar2,
    p_region_template_id         in number    default null,
    --
    p_plugin_name                in varchar2 );

--======================================================================================================================
-- Creates a Template Component report region page
--======================================================================================================================
procedure create_template_component_page (
    p_app_id                     in number,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_group_name                 in varchar2  default null,
    p_page_mode                  in varchar2,
    --
    p_tab_set                    in varchar2  default null,
    p_tab_name                   in varchar2  default null,
    p_tab_text                   in varchar2  default null,
    --
    p_nav_list_id                in number    default null,
    p_nav_list_parent_item_id    in number    default null,
    p_nav_list_child_item_name   in varchar2  default null,
    p_nav_list_item_icon         in varchar2  default null,
    --
    p_breadcrumb_id              in number    default null,
    p_breadcrumb_entry_name      in varchar2  default null,
    p_parent_breadcrumb_entry_id in number    default null,
    --
    p_plugin_name                in varchar2 );

--======================================================================================================================
-- Creates content row template component regon
--======================================================================================================================
procedure create_content_row_region (
    p_id                         in number               default null,
    p_app_id                     in number,
    p_page_id                    in number,
    p_page_mode                  in varchar2,
    p_region_title               in varchar2,
    p_display_sequence           in number               default 10,
    p_region_template_id         in number               default null,
    --
    p_location                   in varchar2             default wwv_flow_exec_api.c_location_local_db,
    p_query_type                 in varchar2             default wwv_flow_exec_api.c_query_type_sql_query,
    p_web_src_module_id          in number               default null,
    p_document_source_id         in number               default null,
    p_array_column_id            in number               default null,
    p_remote_server_id           in number               default null,
    p_table_owner                in varchar2             default null,
    p_table_name                 in varchar2             default null,
    p_sql_query                  in varchar2             default null,
    p_function_body_language     in varchar2             default null,
    --
    p_attributes                 in clob                 default null );

end wwv_flow_report_dev;
/
show err

set define '^'
