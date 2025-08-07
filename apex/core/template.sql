set define '^' verify off
prompt ...wwv_flow_templates_util
create or replace package wwv_flow_templates_util as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2024, Oracle and/or its affiliates.
--
--    DESCRIPTION
--      Flow template rendering engine
--
--    SECURITY
--      Publicly executable
--
--    RUNTIME DEPLOYMENT: YES
--
--    NOTES
--      This program shows an html page header and footer.
--      Templates can have the following pound sign "#" based substitutions:
--      1. #TITLE#           -- HTML body title
--      2. #NAVIGATION_BAR#  -- Location of navigation Bar
--      3. #FORM_OPEN#       -- Opens HTML form used by flows
--      4. #FORM_CLOSE#      -- Closes HTML form opened
--      5. #SUCCESS_MESSAGE# -- If set by flow engine display here
--      Templates can also reference any flow variable using &VARIABLE syntax
--      Tab templates use #TAB_TEXT#
--
--    MODIFIED   (MM/DD/YYYY)
--     mhichwa    08/18/1999 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------
-- Constants
--
c_page       constant varchar2(5)  := 'PAGE';
c_region     constant varchar2(6)  := 'REGION';
c_field      constant varchar2(5)  := 'FIELD';
c_report     constant varchar2(6)  := 'REPORT';
c_list       constant varchar2(5)  := 'LIST';
c_menu       constant varchar2(5)  := 'MENU';
c_button     constant varchar2(6)  := 'BUTTON';
c_calendar   constant varchar2(8)  := 'CALENDAR';
c_label      constant varchar2(5)  := 'LABEL';
c_item       constant varchar2(4)  := 'ITEM';
c_breadcrumb constant varchar2(10) := 'BREADCRUMB';
c_popup      constant varchar2(5)  := 'POPUP';

-------------------
-- Global Variables
--
g_template  number := null;

-- Template substitution string details
type substitution_string_detail is record(
    description     varchar2(4000),
    is_referenced   boolean);

-- Array of template substitution string details, indexed by the name
type substitution_string_by_name is table of substitution_string_detail index by varchar2(4000);

-- Array of substitution string arrays, indexed by the 'Referenced From' value
type template_string_usage is table of substitution_string_by_name index by varchar2(4000);


------------------------------------
-- Template Procedures and Functions
--


-- Function to determine if a varchar2 value (p_from) contains another value (p_str)
--
function is_ref(
    p_from  in varchar2,
    p_str   in varchar2 default null)
    return boolean;

-- Function to determine if a clob value (p_from) contains another value (p_str)
--
function is_ref(
    p_from  in clob,
    p_str   in varchar2 default null)
    return boolean;

-- Procedure to add a substitution string to the record structure used to render the template usage table
-- Template passed as a clob
--
procedure add_usage_string(
    p_sub_str_by_name   in out  substitution_string_by_name,
    p_name              in      varchar2,
    p_description       in      varchar2,
    p_template          in      clob);

-- Procedure to add a substitution string to the record structure used to render the template usage table
-- Template passed as a varchar2
--
procedure add_usage_string(
    p_sub_str_by_name   in out  substitution_string_by_name,
    p_name              in      varchar2,
    p_description       in      varchar2,
    p_template          in      varchar2);

function get_default_template_id (
    p_flow_id       in number,
    p_theme_id      in number,
    p_template_type in varchar2 )
    return number;

function get_internal_template_name (
    p_internal_name in varchar2,
    p_template_name in varchar2 )
    return varchar2;

procedure fetch_page_template (
    p_template_id in number );

procedure sync_page_tmplopt_presets (
    p_page_template_id in number );

procedure sync_region_tmplopt_presets (
    p_region_template_id in number );

procedure sync_report_tmplopt_presets (
    p_report_template_id in number );

procedure sync_list_tmplopt_presets (
    p_list_template_id in number );

procedure sync_bc_tmplopt_presets (
    p_bc_template_id in number );

procedure sync_field_tmplopt_presets (
    p_field_template_id in number );

procedure sync_button_tmplopt_presets (
    p_button_template_id in number );

function template_option_exists (
    p_application_id    in number,
    p_theme_id          in number,
    p_template_id       in number,
    p_template_type     in varchar2,
    p_css_classes       in varchar2,
    p_security_group_id in number default wwv_flow_security.g_security_group_id )
    return boolean;

procedure remove_template_option_classes (
    p_flow_id           in number,
    p_template_type     in varchar2,
    p_template_id       in number,
    p_old_css_classes   in varchar2,
    p_security_group_id in number default wwv_flow_security.g_security_group_id );

procedure push_template_option_classes (
    p_flow_id           in number,
    p_template_type     in varchar2,
    p_template_id       in number,
    p_old_css_classes   in varchar2,
    p_new_css_classes   in varchar2,
    p_security_group_id in number default wwv_flow_security.g_security_group_id );

function get_template_option_group_id (
    p_group_id             in number,
    p_to_flow_id           in number,
    p_to_theme_id          in number,
    p_to_security_group_id in number default wwv_flow_security.g_security_group_id )
    return number;

procedure copy_page_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_name     in varchar2 default null,
    p_to_internal_name     in varchar2 default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

procedure copy_region_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_name     in varchar2 default null,
    p_to_internal_name     in varchar2 default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

procedure copy_row_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_name     in varchar2 default null,
    p_to_internal_name     in varchar2 default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

procedure copy_list_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_name     in varchar2 default null,
    p_to_internal_name     in varchar2 default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

procedure copy_field_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_name     in varchar2 default null,
    p_to_internal_name     in varchar2 default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

procedure copy_menu_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_name     in varchar2 default null,
    p_to_internal_name     in varchar2 default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

procedure copy_button_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_name     in varchar2 default null,
    p_to_internal_name     in varchar2 default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

procedure copy_calendar_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_name     in varchar2 default null,
    p_to_internal_name     in varchar2 default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

procedure copy_popup_template (
    p_from_template_id     in number,
    p_to_flow_id           in number,
    p_to_security_group_id in number   default wwv_flow_security.g_security_group_id,
    p_to_theme_id          in number   default null,
    p_to_template_id       in number   default null,
    p_include_subscription in boolean  default true );

--------------------------------------------------------------------
-- utility functions for backward compatability and upgrade services
--

procedure list_template_sub_str (
    p_list_template_id in number default null );

procedure breadcrumb_template_sub_str (
    p_template_id   in number default null );

procedure label_template_sub_str (
    p_template_id in number default null );

procedure button_template_sub_str (
    p_template_id in number default null );

function breadcrumb_template_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

function button_template_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

function label_template_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

function calendar_template_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

function list_template_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

function page_template_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

function region_template_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

function report_template_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

function template_component_ref_count (
    p_flow_id      in number default null,
    p_template_id  in number default null )
    return number;

end wwv_flow_templates_util;
/
show errors
