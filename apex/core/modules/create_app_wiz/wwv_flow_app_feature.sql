set define '^' verify off
prompt ...wwv_flow_app_feature_v3

create or replace package wwv_flow_app_feature_v3 as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_app_feature_v3.sql
--
--    DESCRIPTION
--      Extension to create application based on new UI introduced in APEX 5.1.1
--      This package contains all procedures used to add features user selected
--      in the wizard.
--
--    NOTES
--      This API is unsupported.
--
--    MODIFIED (MM/DD/YYYY)
--    xhu       02/09/2017 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
subtype t_feature_name     is varchar2(30);
subtype t_subpage_name     is varchar2(30);

type t_feature_page is record(
    page_id          number,
    page_name        varchar2(255),
    build_option_id  number );
type t_feature_pages is table of t_feature_page index by varchar2(30);

type t_admin_page is record(
    page_option                 varchar2(255),
    page_id                     number,
    page_name                   varchar2(255),
    new_page_id                 number,
    existing_page_id            number,
    --
    tab_option                  varchar2(255),
    tab_set                     varchar2(255),
    tab_name                    varchar2(255),
    tab_text                    varchar2(2000),
    --
    nav_list_option             varchar2(255),
    nav_list_id                 number,
    nav_list_parent_id          number,
    nav_list_new_parent_id      number,
    nav_list_existing_parent_id number,
    nav_list_entry_name         varchar2(4000),
    --
    auth_scheme_id              number );

type t_user_settings_page is record(
    page_id           number,
    include_in_navbar boolean );

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_about_page                  constant t_feature_name := 'FEATURE_ABOUT_PAGE';
c_configuration               constant t_feature_name := 'FEATURE_CONFIGURATION';
c_theme_style                 constant t_feature_name := 'FEATURE_THEME_STYLE';
c_activity_report             constant t_feature_name := 'FEATURE_ACTIVITY_REPORT';
c_acl                         constant t_feature_name := 'FEATURE_ACL';
c_feedback                    constant t_feature_name := 'FEATURE_FEEDBACK';
c_email_report                constant t_feature_name := 'FEATURE_EMAIL_REPORT';
c_job_report                  constant t_feature_name := 'FEATURE_JOB_REPORT';
c_push_notifications          constant t_feature_name := 'FEATURE_PUSH_NOTIFICATIONS';

c_help_dialog                 constant t_subpage_name := 'HELP_DIALOG';

c_activity_dashboard          constant t_subpage_name := 'ACTIVITY_DASHBOARD';
c_activity_top_users          constant t_subpage_name := 'ACTIVITY_TOP_USERS';
c_activity_error_log          constant t_subpage_name := 'ACTIVITY_ERROR_LOG';
c_activity_performance        constant t_subpage_name := 'ACTIVITY_PERFORMANCE';
c_activity_page_views         constant t_subpage_name := 'ACTIVITY_PAGE_VIEWS';
c_activity_automations_log    constant t_subpage_name := 'ACTIVITY_AUTOMATIONS_LOG';
c_activity_automations_msg    constant t_subpage_name := 'ACTIVITY_AUTOMATIONS_MSG';

c_acl_config                  constant t_subpage_name := 'ACL_CONFIG';
c_acl_users                   constant t_subpage_name := 'ACL_USERS';
c_acl_user_detail             constant t_subpage_name := 'ACL_USER_DETAIL';
c_acl_add_multiple_1          constant t_subpage_name := 'ACL_ADD_MULTIPLE_1';
c_acl_add_multiple_2          constant t_subpage_name := 'ACL_ADD_MULTIPLE_2';

c_feedback_add                constant t_subpage_name := 'FEEDBACK_ADD';
c_feedback_success            constant t_subpage_name := 'FEEDBACK_SUCCESS';
c_feedback_settings           constant t_subpage_name := 'FEEDBACK_SETTINGS';
c_feedback_feedbacks          constant t_subpage_name := 'FEEDBACK_FEEDBACKS';
c_feedback_feedback_detail    constant t_subpage_name := 'FEEDBACK_DETAIL';


--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
g_feature_pages               t_feature_pages;

--------------------------------------------------------------------------------
-- API used from create app wizard
--------------------------------------------------------------------------------
procedure create_features;

--------------------------------------------------------------------------------
-- API used both from create app and feature wizard
--------------------------------------------------------------------------------
procedure create_acl_info_region(
    p_app_id              in number default wwv_flow_create_app_v3.g_app_id,
    p_page_id             in number,
    p_user_form_page_id   in number,
    p_parent_region_id    in number default null,
    p_acl_info_region_id  in number default null,
    p_build_option_id     in number default null );

procedure create_feedback_info_region(
    p_app_id                   in number default wwv_flow_create_app_v3.g_app_id,
    p_page_id                  in number,
    p_parent_region_id         in number default null,
    p_feedback_region_id       in number default null,
    p_build_option_id          in number default null );

procedure create_list_region(
    p_app_id                  in number default wwv_flow_create_app_v3.g_app_id,
    p_page_id                 in number,
    p_display_sequence        in number,
    p_list_id                 in number,
    p_region_name             in varchar2,
    p_parent_region_id        in number   default null,
    p_region_template_id      in number   default null,
    p_region_template_options in varchar2 default null,
    p_build_option_id         in number   default null );

--------------------------------------------------------------------------------
-- API used from Feature Page Wizard
--------------------------------------------------------------------------------

-- this function checks if feature exists
--
function is_feature(
    p_page_type     in t_feature_name ) return boolean;

-- this function checks if feature page can be created
-- only distinct feature per app can be created
-- if build option belongs to the feature exists, it returns false
--
function add_feature_page_allowed(
    p_app_id       in number,
    p_feature_name in t_feature_name ) return boolean;

--
-- function returns admin page ID depending on admin page option (NEW, EXISTING)
--
function get_admin_page_id(
    p_admin_page        in t_admin_page ) return number;
--
-- called from about feature page wizard
--
procedure add_feature_about_page(
    p_app_id                   in number,
    p_page_id                  in number,
    p_name                     in varchar2,
    p_group_id                 in number   default null,
    --
    p_create_nav_bar_entry     in boolean  default false,
    p_nav_bar_entry_label      in varchar2 default null );

--
-- called from ACL feature page wizard
--
procedure add_feature_acl(
    p_app_id                   in number,
    p_starting_page_id         in number,
    p_group_id                 in number default null,
    --
    p_admin_page               in t_admin_page );

--
-- called from activity report feature page wizard
--
procedure add_feature_activity_rpt(
    p_app_id                   in number,
    p_starting_page_id         in number,
    p_group_id                 in  number   default null,
    p_auth_scheme_id           in  number   default null,
    --
    p_admin_page               in t_admin_page );

--
-- called from configuration feature page wizard
--
procedure add_feature_configuration(
    p_app_id                     in number,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_group_id                   in number default null,
    p_auth_scheme_id             in number default null,
    --
    p_admin_page                 in t_admin_page );

--
-- called from theme style feature page wizard
--
procedure add_feature_theme_style(
    p_app_id                     in number,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_group_id                   in number default null,
    p_auth_scheme_id             in number default null,
    --
    p_admin_page                 in t_admin_page );

--
-- called from push notifications feature page wizard
--
procedure add_feature_push_notifications (
    p_app_id             in number,
    p_feature_page       in t_feature_page,
    p_user_settings_page in t_user_settings_page );

--
-- called from feedback feature page wizard
--
procedure add_feature_feedback(
    p_app_id                   in number,
    p_starting_page_id         in number,
    p_group_id                 in number   default null,
    p_auth_scheme_id           in number   default null,
    --
    p_create_nav_bar_entry     in boolean  default false,
    p_nav_bar_entry_label      in varchar2 default null,
    --
    p_admin_page               in t_admin_page );

--
-- email reporting feature page
--
procedure add_email_monitor_page (
    p_app_id                   in number,
    p_page_id                  in number,
    p_group_id                 in number default null,
    p_authorization_scheme     in number default null,
    --
    p_admin_page               in t_admin_page );

--
-- Scheduler Job pages
--
procedure add_job_monitoring (
    p_app_id                   in  number,
    p_starting_page_id         in  number,
    p_group_id                 in  number   default null,
    p_authorization_scheme     in  number   default null,
    --
    p_job_list                 in  varchar2 default null,
    --
    p_admin_page               in  t_admin_page );

end wwv_flow_app_feature_v3;
/
show errors
