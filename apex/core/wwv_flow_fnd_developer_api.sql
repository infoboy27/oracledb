set define '^' verify off
prompt ...wwv_flow_fnd_developer_api
create or replace package wwv_flow_fnd_developer_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2002, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_fnd_developer_api.sql
--
--    DESCRIPTION
--      API to manage cookie based users.
--
--    NOTES
--      This package supports developer privileges with multiple application IDs.
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    12/04/2002 - created
--
--------------------------------------------------------------------------------

empty_vc_arr wwv_flow_global.vc_arr2;


procedure set_component_privs (
    p_user_id                      in number,
    p_ALLOW_APP_BUILDING_YN        in varchar2 default 'N',
    p_ALLOW_SQL_WORKSHOP_YN        in varchar2 default 'N',
    p_ALLOW_TEAM_DEVELOPMENT_YN      in varchar2 default 'N')
    ;

procedure edit_fnd_user (
     --
     -- Edit user information to
     -- wwv_flow_fnd_user, wwv_flow_fnd_group_users table.
     --
     p_user_id                      in number,
     p_user_name                    in varchar2,
     p_first_name                   in varchar2 default null,
     p_last_name                    in varchar2 default null,
     p_web_password                 in varchar2 default null,
     p_new_password                 in varchar2 default null,
     p_email_address                in varchar2 default null,
     p_start_date                   in varchar2 default null,
     p_end_date                     in varchar2 default null,
     p_employee_id                  in varchar2 default null,
     p_allow_access_to_schemas      in varchar2 default null,
     p_person_type                  in varchar2 default null,
     p_default_schema               in varchar2 default null,
     p_default_date_format          in varchar2 default null,
     p_group_ids                    in varchar2 default null,
     p_description                  in varchar2 default null,
     p_account_expiry               in date default null,
     p_account_locked               in varchar2 default null,
     p_failed_access_attempts       in number   default null,
     p_change_password_on_first_use in varchar2 default null,
     p_first_password_use_occurred  in varchar2 default null,
     --
     p_ALLOW_APP_BUILDING_YN        in varchar2 default 'Y',
     p_ALLOW_SQL_WORKSHOP_YN        in varchar2 default 'Y',
     p_ALLOW_TEAM_DEVELOPMENT_YN    in varchar2 default 'Y'
     );

procedure edit_developer_role (
    --
    -- Edit user developer roles in wwv_flow_developers.
    --
    p_id               in number,
    p_user_id          in number,
    p_user_name        in varchar2,
    p_flow_id          in number default null,
    p_developer_roles  in varchar2 default null
    );

procedure edit_developer_roles (
    --
    -- This procedure expects array values.
    -- Edit user developer roles in wwv_flow_developers.
    --
    p_ids              in wwv_flow_global.vc_arr2,
    p_user_id          in number,
    p_user_name        in varchar2,
    p_flow_ids         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_developer_roles  in wwv_flow_global.vc_arr2 default empty_vc_arr
    );

procedure delete_developer_role (
    p_id        in number,
    p_user_name in varchar2
    );

--
-- reset passwords
--

procedure f4550_send_workspace (
   p_email_address      in varchar2 );

procedure f4550_reset_password (
   p_email_address      in varchar2,
   p_workspace_name     in varchar2 default null );

--
--
--

procedure f4050_55_provision_workspace (
   p_provision_id       in number,
   p_approval_message   in varchar2,
   p_acceptance_message in varchar2 );

procedure f4700_73_provision_workspace (
   p_provision_id       in number,
   p_sign_in_url        in out varchar2,
   p_msg                in out varchar2 );


procedure admin_notify_new_request (
    p_workspace_name in varchar2,
    p_schema_name    in varchar2,
    p_admin_userid   in varchar2,
    p_admin_email    in varchar2 );

procedure admin_notify_change_request (
    p_workspace_id   in number,
    p_admin_userid   in varchar2 );


end wwv_flow_fnd_developer_api;
/
show error;
