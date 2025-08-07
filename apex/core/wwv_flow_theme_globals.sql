set define '^'
set verify off
prompt ...wwv_flow_theme_globals

Rem  Copyright (c) 2004, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      wwv_flow_theme_globals.sql
Rem
Rem    DESCRIPTION
Rem      Package used to hole theme defaults which will be set by wwv_flow_theme_? packages
Rem      This is to facilitate application creation.
Rem
Rem    NOTES
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem       skutz     06/05/2004 - Created

create or replace package wwv_flow_theme_globals
as

    g_theme_identifier             varchar2(255);
    g_theme_id                     number;
    -- page
    g_navigation_type              varchar2(1);
    g_nav_bar_type                 varchar2(20);
    g_default_nav_list_position    varchar2(20);

    g_default_page_template        number;
    g_wiz_modal_dialog_template    number;
    g_default_login_page_template  number;
    g_error_template               number;
    g_printer_friendly_template    number;
    g_login_template               number;

    -- buttons
    g_default_button_template      number;
    g_icon_button_template         number;
    g_icon_text_button_template    number;
    -- region
    g_default_container_template   number;
    g_button_container_template    number;
    g_default_blank_reg_template   number;
    g_default_region_template      number;
    g_default_chart_template       number;
    g_default_form_template        number;
    g_default_login_reg_template   number;
    g_default_reportr_template     number;
    g_default_tabform_template     number;
    g_default_wizard_template      number;
    g_default_menur_template       number;
    g_default_listr_template       number;
    g_default_irr_template         number;
    g_default_header_template      number;
    g_default_footer_template      number;
    --row/report
    g_default_report_template      number;
    -- field/label
    g_default_label_template       number;
    g_default_login_label_template number;
    -- menu
    g_default_menu_template        number;
    -- calendar
    g_default_calendar_template    number;
    -- lists
    g_default_list_template        number;
    g_default_nav_list_template    number;
    g_default_top_nav_list_temp    number;
    g_wiz_train_list_template      number;
    g_default_side_nav_list_temp   number;
    g_default_option_label         number;
    g_default_required_label       number;
    g_default_navbar_list_template number;
    -- dialog page
    g_default_dialog_template      number;
    -- dialog button region
    g_default_dialogbtnr_template  number;
    -- dialog button region position
    g_dialogbtnr_display_point     varchar2(2000);
    -- dialog content region
    g_default_dialogr_template     number;
    -- list globals
    g_default_chart_list           number;
    g_default_report_list          number;
    g_default_ul_wo_bullet_list    number;
    --
    g_default_breadcrumb_region    number;

    g_default_sb_page_template     number;
    g_default_sb_region_template   number;
    g_default_sb_nav_template      number;

    g_version                      number;

end wwv_flow_theme_globals;
/
show errors;