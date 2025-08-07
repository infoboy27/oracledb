set define '^' verify off
prompt ...wwv_flow_form_region.sql
create or replace package wwv_flow_form_region_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2018, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_form_region_dev.sql
--
--    DESCRIPTION
--      Builder-specific procedures for the form region
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    11/29/2018 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

subtype t_report_implementation is pls_integer range 1..4;

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

c_report_impl_classic       constant t_report_implementation := 1;
c_report_impl_interactive   constant t_report_implementation := 2;
c_report_impl_listview      constant t_report_implementation := 3;
c_report_impl_ig            constant t_report_implementation := 4;


c_textarea_threshold        constant pls_integer             := 256;

--======================================================================================================================
-- add REST Source Parameters for new editable region
--======================================================================================================================
procedure add_region_web_source_params(
    p_flow_id                 in number,
    p_page_id                 in number,
    p_region_id               in number,
    p_web_source_module_id    in number,
    p_array_column_id         in number default null );

--======================================================================================================================
-- creates a form region on an existing page
--======================================================================================================================
procedure create_form_region (
    p_flow_id                   in number,
    p_page_id                   in number,
    p_page_mode                 in varchar2,
    --
    p_region_title              in varchar2,
    p_region_template           in number                              default null,
    --
    p_location                  in wwv_flow_exec_api.t_location        default wwv_flow_exec_api.c_location_local_db,
    p_query_type                in wwv_flow_exec_api.t_query_type,
    p_table_owner               in varchar2                            default null,
    p_table_name                in varchar2                            default null,
    p_table_where               in varchar2                            default null,
    p_table_order_by            in varchar2                            default null,
    p_sql_plsql_source          in varchar2                            default null,
    p_function_body_language    in wwv_flow_code_exec.t_language       default null,
    --
    p_remote_server_id          in number                              default null,
    p_web_source_module_id      in number                              default null,
    p_document_source_id        in number                              default null,
    p_array_column_id           in number                              default null,
    p_web_src_param_collection  in varchar2                            default null,
    --
    p_primary_key_columns       in wwv_flow_t_varchar2                 default null,
    p_form_columns              in wwv_flow_t_varchar2                 default null,
    --
    p_use_ui_default            in varchar2                            default 'Y',
    --
    p_create_button_name        in varchar2                            default wwv_flow_lang_dev.builder_message('LAYOUT.T_CREATE_BUTTON'),
    p_save_button_name          in varchar2                            default wwv_flow_lang_dev.builder_message('WWV_FLOW_CUSTOMIZE.T_APPLY'),
    p_delete_button_name        in varchar2                            default wwv_flow_lang_dev.builder_message('F4350.DELETE'),
    p_cancel_button_name        in varchar2                            default wwv_flow_lang_dev.builder_message('WWV_SPELING.BUTTON_CANCEL'),
    p_branch                    in number                              default null,
    p_cancel_branch             in number                              default null,
    --
    p_insert                    in varchar2                            default 'Y',
    p_update                    in varchar2                            default 'Y',
    p_delete                    in varchar2                            default 'Y',
    --
    p_add_navigation            in boolean                             default false,
    --
    p_describe_result           in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result );

--======================================================================================================================
-- creates a new page with a form region
--======================================================================================================================
procedure create_form_page(
    p_flow_id                    in number,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_group_name                 in varchar2                            default null,
    p_page_mode                  in varchar2,
    p_use_ui_default             in varchar2                            default 'Y',
    --
    p_tab_set                    in varchar2                            default null,
    p_tab_name                   in varchar2                            default null,
    p_tab_text                   in varchar2                            default null,
    --
    p_nav_list_id                in number                              default null,
    p_nav_list_item_id           in number                              default null,
    p_nav_list_item_name         in varchar2                            default null,
    p_nav_list_parent_item_id    in number                              default null,
    p_nav_list_child_item_name   in varchar2                            default null,
    p_nav_list_item_icon         in varchar2                            default null,
    --
    p_breadcrumb_id              in number                              default null,
    p_breadcrumb_entry_name      in varchar2                            default null,
    p_parent_breadcrumb_entry_id in number                              default null,
    --
    p_region_title               in varchar2,
    p_region_template            in number                              default null,
    --
    p_location                   in wwv_flow_exec_api.t_location        default wwv_flow_exec_api.c_location_local_db,
    p_query_type                 in wwv_flow_exec_api.t_query_type,
    p_table_owner                in varchar2                            default null,
    p_table_name                 in varchar2                            default null,
    p_table_where                in varchar2                            default null,
    p_table_order_by             in varchar2                            default null,
    p_sql_plsql_source           in varchar2                            default null,
    p_function_body_language     in wwv_flow_code_exec.t_language       default null,
    --
    p_remote_server_id           in number                              default null,
    p_web_source_module_id       in number                              default null,
    p_document_source_id         in number                              default null,
    p_array_column_id            in number                              default null,
    p_web_src_param_collection   in varchar2                            default null,
    --
    p_primary_key_columns        in wwv_flow_t_varchar2                 default null,
    p_form_columns               in wwv_flow_t_varchar2                 default null,
    --
    p_create_button_name         in varchar2                            default wwv_flow_lang_dev.builder_message('LAYOUT.T_CREATE_BUTTON'),
    p_save_button_name           in varchar2                            default wwv_flow_lang_dev.builder_message('WWV_FLOW_CUSTOMIZE.T_APPLY'),
    p_delete_button_name         in varchar2                            default wwv_flow_lang_dev.builder_message('F4350.DELETE'),
    p_cancel_button_name         in varchar2                            default wwv_flow_lang_dev.builder_message('WWV_SPELING.BUTTON_CANCEL'),
    p_branch                     in number                              default null,
    p_cancel_branch              in number                              default null,
    --
    p_insert                     in varchar2                            default 'Y',
    p_update                     in varchar2                            default 'Y',
    p_delete                     in varchar2                            default 'Y',
    --
    p_add_navigation             in boolean                             default false,
    --
    p_dialog_chained             in varchar2                            default 'Y',
    --
    p_describe_result            in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result );

--======================================================================================================================
-- creates classic report and form pages
--======================================================================================================================
procedure create_form_and_report_pages (
    p_flow_id                    in number,
    p_form_page_id               in number,
    p_report_page_id             in varchar2,
    p_form_page_name             in varchar2,
    p_report_page_name           in varchar2,
    --
    p_report_implementation      in t_report_implementation,
    --
    p_group_name                 in varchar2                        default null,
    p_form_page_mode             in varchar2,
    p_report_page_mode           in varchar2,
    p_use_ui_default             in varchar2                        default 'Y',
    --
    p_tab_set                    in varchar2                        default null,
    p_tab_name                   in varchar2                        default null,
    p_tab_text                   in varchar2                        default null,
    --
    p_nav_list_id                in number                          default null,
    p_nav_list_item_id           in number                          default null,
    p_nav_list_item_name         in varchar2                        default null,
    p_nav_list_parent_item_id    in number                          default null,
    p_nav_list_child_item_name   in varchar2                        default null,
    p_nav_list_item_icon         in varchar2                        default null,
    --
    p_breadcrumb_id              in number                          default null,
    p_breadcrumb_entry_name      in varchar2                        default null,
    p_parent_breadcrumb_entry_id in number                          default null,
    --
    p_location                   in wwv_flow_exec_api.t_location    default wwv_flow_exec_api.c_location_local_db,
    p_query_type                 in wwv_flow_exec_api.t_query_type,
    p_table_owner                in varchar2                        default null,
    p_table_name                 in varchar2                        default null,
    p_table_order_by             in varchar2                        default null,
    p_sql_plsql_source           in varchar2                        default null,
    p_function_body_language     in wwv_flow_code_exec.t_language   default null,
    --
    p_remote_server_id           in number                          default null,
    p_web_source_module_id       in number                          default null,
    p_document_source_id         in number                          default null,
    p_array_column_id            in number                          default null,
    p_web_src_param_collection   in varchar2                        default null,
    --
    p_primary_key_columns        in wwv_flow_t_varchar2             default null,
    p_form_columns               in wwv_flow_t_varchar2             default null,
    p_report_columns             in wwv_flow_t_varchar2             default null,
    p_automatic_lovs             in boolean                         default false,
    --
    p_rpt_region_template        in number                          default null,
    p_rpt_template               in number                          default null,
    p_rpt_region_name            in varchar2,
    p_form_region_template       in number                          default null,
    p_form_region_name           in varchar2,
    --
    p_pagination_size            in varchar2                        default '10',
    p_edit_link                  in varchar2                        default null,
    --
    p_form_insert                in varchar2                        default 'Y',
    p_form_update                in varchar2                        default 'Y',
    p_form_delete                in varchar2                        default 'Y',
    --
    p_add_form_navigation        in boolean                         default false,
    --
    p_dialog_chained             in varchar2                        default 'Y' );

end wwv_flow_form_region_dev;
/
show err

set define '^'
