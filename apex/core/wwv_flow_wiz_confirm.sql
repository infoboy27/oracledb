set define '^' verify off
prompt ...wwv_flow_wiz_confirm
create or replace package wwv_flow_wiz_confirm as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2006, 2023, Oracle and/or its affiliates.
--
--   NAME
--      wwv_flow_wiz_confirm.sql
--
--    DESCRIPTION
--     This package displays wizard confirmation pages.
--
--    SECURITY
--      No grants, must be run as FLOW schema owner.
--
--
--    MODIFIED   (MM/DD/YYYY)
--     cbcho      03/22/2006 - Created
--
--------------------------------------------------------------------------------
type t_table_row is record (
    header   varchar2(255),
    val      varchar2(255) );

type t_summary_table is table of t_table_row index by pls_integer;

procedure render_two_column_table (
    p_table_values    in t_summary_table,
    p_label           in varchar2 default wwv_flow_lang_dev.builder_message('TWO_COL_TABLE.SUMMARY') );

procedure copy_application (
    p_old_app_id      in number default null,
    p_old_app_name    in varchar2 default null,
    p_new_app_id      in number default null,
    p_new_app_name    in varchar2 default null,
    p_copy_deployment in varchar2 default 'N' );

procedure create_form_on_ws_rpt (
    p_flow_id            in number default null,
    p_region_template    in number default null,
    p_region_template2   in number default null,
    p_report_template    in number default null,
    p_page_id            in number default null,
    p_page_name          in varchar2 default null,
    p_region_name        in varchar2 default null,
    p_region_name2       in varchar2 default null,
    p_ws_id              in number default null,
    p_operation_id       in number default null,
    p_collection_name    in varchar2 default null,
    p_array              in number default null);

procedure create_standard_tab (
    p_flow_id                      in number default null,
    p_new_parent_tabset            in varchar2 default null,
    p_new_parent_tab_text          in varchar2 default null,
    p_parent_tab_set               in varchar2 default null,
    p_tab_set_choice               in varchar2 default null,
    p_tab_set                      in varchar2 default null,
    p_new_tab_display_text         in varchar2 default null,
    p_tab_sequence                 in varchar2 default null,
    p_current_page                 in varchar2 default null,
    p_current_image                in varchar2 default null,
    p_non_current_page             in varchar2 default null,
    p_image_attributes             in varchar2 default null,
    p_display_condition            in varchar2 default null,
    p_condition_type               in varchar2 default null,
    p_display_condition_text       in varchar2 default null,
    p_build_option                 in varchar2 default null);

procedure create_acl (
    p_flow_id           in number default null,
    p_page_id           in number default null,
    p_admin_page_id     in number default null,
    p_admin_page_name   in varchar2 default null,
    p_existing_page     in number default null );

procedure create_global_page (
    p_flow_id              in number default null) ;

procedure copy_page_other_app (
    p_flow_id_from             in number   default null,
    p_page_id_from             in number   default null,
    p_flow_id_to               in number   default null,
    p_page_id_to               in number   default null,
    p_page_name_to             in varchar2 default null,
    p_navigation_type          in varchar2 default null,
    --
    p_tab_options              in varchar2 default null,
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number   default null,
    p_nav_list_parent_item_id  in number   default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_breadcrumb_id            in number   default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_breadcrumb        in varchar2 default null );

procedure create_breadcrumb_region (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_region_type     in varchar2 default null,
    p_region_template in number default null,
    p_menu_template   in number default null,
    p_menu_template2  in number default null,
    p_parent_menu     in number default null,
    p_menu_text       in varchar2 default null,
    p_display_point   in varchar2 default null);

procedure create_summary_page (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_region_name     in varchar2 default null,
    p_region_template in varchar2 default null);

function display_create_success_page (
    p_success_msg     in varchar2 default null)
    return varchar2;

procedure create_dynamic_query (
    p_flow_id         in number default null,
    p_page_id         in number default null,
    p_page_name       in varchar2 default null,
    p_region_template in number default null,
    p_region_name     in varchar2 default null );

end wwv_flow_wiz_confirm;
/
show errors
