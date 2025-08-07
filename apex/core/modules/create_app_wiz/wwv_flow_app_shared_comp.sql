set define '^' verify off
prompt ...wwv_flow_app_shared_comp_v3
create or replace package wwv_flow_app_shared_comp_v3 as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_app_shared_comp_v3.sql
--
--    DESCRIPTION
--      Manage application shared components defined from create app extension wizard
--
--    MODIFIED (MM/DD/YYYY)
--    cbcho     02/14/2017 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
subtype t_bo_feature_identifier is varchar2(50);

type t_list_items  is table of wwv_flow_list_items%rowtype index by binary_integer;

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

-- build option identifier for admin pages
c_bo_app_configuration         constant t_bo_feature_identifier := 'APPLICATION_CONFIGURATION';
c_bo_app_acl                   constant t_bo_feature_identifier := 'APPLICATION_ACCESS_CONTROL';
c_bo_app_activity_report       constant t_bo_feature_identifier := 'APPLICATION_ACTIVITY_REPORTING';
c_bo_app_feedback              constant t_bo_feature_identifier := 'APPLICATION_FEEDBACK';
c_bo_app_about_page            constant t_bo_feature_identifier := 'APPLICATION_ABOUT_PAGE';
c_bo_app_themes_style          constant t_bo_feature_identifier := 'APPLICATION_THEME_STYLE_SELECTION';
c_bo_email_monitor             constant t_bo_feature_identifier := 'APPLICATION_EMAIL_REPORTING';
c_bo_job_monitor               constant t_bo_feature_identifier := 'APPLICATION_JOB_REPORTING';

-- build option identifier for user settings pages
c_bo_user_settings             constant t_bo_feature_identifier := 'APPLICATION_USER_SETTINGS';
c_bo_push_notifications        constant t_bo_feature_identifier := 'APPLICATION_PUSH_NOTIFICATIONS';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--
--
--

procedure create_app_icon;

procedure create_page_group(
    p_admin_pg_group_id out number );

function get_template_id(
    p_app_id   in number default wwv_flow_create_app_v3.g_app_id,
    p_type     in varchar2,
    p_name     in varchar2  ) return number;

procedure update_template_options(
    p_id               in number,
    p_app_id           in number default wwv_flow_create_app_v3.g_app_id,
    p_page_id          in number,
    p_component        in varchar2,
    p_template_options in varchar2 );

function get_build_option_id(
    p_app_id             in number default wwv_flow_create_app_v3.g_app_id,
    p_feature_identifier in t_bo_feature_identifier ) return number;

procedure create_build_option(
    p_id                    in number,
    p_app_id                in number default wwv_flow_create_app_v3.g_app_id,
    p_feature_identifier    in t_bo_feature_identifier );

function create_build_option_if_require(
    p_app_id                in number default wwv_flow_create_app_v3.g_app_id,
    p_feature_identifier    in t_bo_feature_identifier )
    return number;

procedure create_build_options(
    p_bo_access_control            out number,
    p_bo_activity_reporting        out number,
    p_bo_application_feedback      out number,
    p_bo_application_settings      out number,
    p_bo_application_configuration out number,
    p_bo_email_framework           out number,
    p_bo_global_search             out number,
    p_bo_help_functionality        out number,
    p_bo_theme_selector            out number,
    p_bo_user_time_zone_support    out number,
    p_bo_user_profiles             out number );

procedure create_acl_roles(
    p_app_id    in number default wwv_flow_create_app_v3.g_app_id );

procedure create_app_roles;

function get_auth_scheme_id(
    p_app_id      in number default wwv_flow_create_app_v3.g_app_id,
    p_static_name in varchar2 ) return number;

procedure replace_admin_auth_scheme(
    p_app_id         in number,
    p_auth_scheme_id in number );

procedure create_auth_scheme(
    p_id                 in number default null,
    p_app_id             in number default wwv_flow_create_app_v3.g_app_id,
    p_static_name        in varchar2,
    p_role_based_admin   in boolean default false );

procedure create_authorization_schemes(
    p_as_admin_id        out number,
    p_as_app_sentry_id   out number,
    p_as_contribution_id out number );

function get_admin_list(
    p_app_id          in number default wwv_flow_create_app_v3.g_app_id,
    p_feature_names   in wwv_flow_t_varchar2,
    p_pages           in wwv_flow_app_feature_v3.t_feature_pages default wwv_flow_app_feature_v3.g_feature_pages ) return t_list_items;

procedure create_list(
    p_app_id          in number default wwv_flow_create_app_v3.g_app_id,
    p_list_id         in number,
    p_list_name       in varchar2,
    p_list_items      in t_list_items,
    p_build_option_id in number default null );

function create_list_if_required(
    p_app_id          in number       default wwv_flow_create_app_v3.g_app_id,
    p_list_name       in varchar2,
    p_list_items      in t_list_items default t_list_items(),
    p_build_option_id in number       default null )
    return number;

procedure create_list_item_if_required(
    p_list_item in wwv_flow_list_items%rowtype );

procedure create_admin_list(
    p_configure_list_id    out number,
    p_theme_style_list_id  out number,
    p_activity_rpt_list_id out number,
    p_acl_list_id          out number,
    p_feedback_list_id     out number );

procedure create_navbar;

procedure create_feature_app_settings(
    p_app_id          in number,
    p_feature_name    in wwv_flow_app_feature_v3.t_feature_name,
    p_build_option_id in number );

procedure create_app_settings;

end wwv_flow_app_shared_comp_v3;
/
show errors
