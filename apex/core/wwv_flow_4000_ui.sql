set define '^' verify off
prompt ...wwv_flow_4000_ui
create or replace package wwv_flow_4000_ui as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_4000_ui.sql
--
--    DESCRIPTION
--     User interface plsql for internal application development application
--
--    SECURITY
--      No grants
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa    05/08/2009 - Created
--
--------------------------------------------------------------------------------

procedure show_tabs (
    p_application_id    in number   default null,
    p_security_group_id in number   default null,
    p_session_id        in number  default null,
    p_parent_tabset     in varchar2 default null );

function get_timeframe (
    p_days in number default 1)
    return varchar2
    ;

procedure print_lov_examples (
    p_display_as in varchar2 );

procedure print_apex_online_info (
    p_ul_attr in varchar2 default null );

function print_cgi_env (
   p_html_table_attr  in varchar2 default null )
   return clob;

--
-- workspace notification
--
procedure show_workspace_notification (
   p_workspace_id       in number default null,
   p_session            in number default null );

function workspace_notification_exists (
    p_workspace_id in number default null )
    return boolean   ;

--
-- history
--
procedure show_history (
   p_last_updated_by in varchar2 default null,
   p_last_updated_on in date     default null,
   p_created_by      in varchar2 default null,
   p_created_on      in date     default null );

function get_app_initials (
    p_title             in varchar2,
    p_app_id            in number)
    return varchar2
    ;

procedure top_applications (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50,
    p_show_internal_yn  in varchar2 default 'Y' );

procedure updates;

--==============================================================================
-- APEX Administration Services Modernization 07/08/2022
--==============================================================================
function get_account_mega_menu (
    p_username          in varchar2,
    p_workspace_id      in number,
    p_session           in number,
    p_logout_url        in varchar2 )
    return clob;

--==============================================================================
procedure account_mega_menu (
    p_username          in varchar2,
    p_workspace_id      in number,
    p_session           in number,
    p_logout_url        in varchar2 );

procedure ajax_set_ui_mode;

--==============================================================================
-- Returns TRUE if a translation of a particular application is installed. Can be used to decide whether a language
-- selector should be displayed.
--==============================================================================
function is_translation_installed( p_flow_id  in number default wwv_flow.g_flow_id,
                                   p_language in varchar2 default null ) return boolean;

--===============================================================================
-- procedure to save breadcrumb entries reparenting changes
-- called as AJAX callback process from 4000:106
--===============================================================================
procedure save_breadcrumb_changes(
    p_menu_id           in number,
    p_app_id            in number,
    p_workspace_id      in number,
    p_changes           in wwv_flow_global.vc_arr2 );

--===============================================================================
-- function to return LOV query for breadcrumb parent id items
-- used mainly in create page wizard pages in the builder app
--===============================================================================
function breadcrumb_parent_lov_sql(
    p_breadcrumb_item_name in varchar2 )
    return varchar2;

--===============================================================================
-- set builder breadcrumb app icon
--===============================================================================
procedure set_breadcrumb_app_icon (
    p_application_id number );

--===============================================================================
-- set page name to breadcrumb and html title
--===============================================================================
procedure set_breadcrumb_title_page_name (
    p_application_id in number,
    p_page_id        in number );

end wwv_flow_4000_ui;
/
show errors
