set define '^' verify off
prompt ...wwv_flow_fnd_user_api
create or replace package wwv_flow_fnd_user_api authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2001, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_fnd_user_api.sql
--
--    DESCRIPTION
--      API to manage cookie based users.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  05/24/2000 - created
--
--------------------------------------------------------------------------------
    c_person_type_external constant varchar2(1) := 'E';

    g_mime_shown      boolean := false;
    g_password_save               raw(255);


--==============================================================================
-- This procedure exports all users in a the current company, designed to be
-- called from the flows html development environment.
--==============================================================================
procedure export_fnd_users (
    p_export_format           in varchar2 default 'UNIX',
    p_include_script_header   in boolean default true,
    p_minimal                 in boolean default false );

--==============================================================================
-- This procedure creates a company description.  Without a company user and
-- flows can not be creatd.
--
-- ARGUMENTS
-- * p_id                        unique ID which identifies a company row, not referenced by other tables
-- * p_provisioning_company_id   security_group_id column is a foreign key to this column.  The
--                               security_group_id column is used by all tables that store data that is
--                               specific to a given company.
-- * p_short_name                name of the company used to login
-- * p_first_schema_provisioned  is used to indicate the first schema created. This is necessary to
--                               determine things like what is the default tablespace for this company
-- * p_company_schemas           colon delimited list of schemas that this company can "parse as".
-- * p_ws_schema                 indicates the schema for Websheet objects
-- * p_rm_consumer_group         Resource Manager consumer group which should be used when executing
--                               applications for this company.
-- * p_path_prefix               is used in RESTful Services to determine workspace associated with RESTful service
-- * p_allow_restful_services_yn is a workspace level setting to to determine whether RESTful Services is enabled. This
--                               setting is dependent on the instance level preference RESTFUL_SERVICES_ENABLED being set to 'Y'.
--==============================================================================
procedure create_company (
    p_id                           in number,
    p_provisioning_company_id      in number,
    p_short_name                   in varchar2,
    p_display_name                 in varchar2 default null,
    p_workspace_service_id         in number   default null,
    p_first_schema_provisioned     in varchar2,
    p_company_schemas              in varchar2,
    p_ws_schema                    in varchar2 default null,
    p_expire_fnd_user_accounts     in varchar2 default null,
    p_account_lifetime_days        in number   default null,
    p_fnd_user_max_login_failures  in number   default null,
    p_account_status               in varchar2 default 'ASSIGNED',
    p_allow_plsql_editing          in varchar2 default null,
    p_allow_app_building_yn        in varchar2 default null,
    p_allow_packaged_app_ins_yn    in varchar2 default null,
    p_allow_sql_workshop_yn        in varchar2 default null,
    p_allow_websheet_dev_yn        in varchar2 default null,  -- obsolte 22.1, left for backward compatibility
    p_allow_team_development_yn    in varchar2 default null,
    p_allow_to_be_purged_yn        in varchar2 default null,
    p_source_identifier            in varchar2 default null,
    p_auto_archive_yn              in varchar2 default null,
    p_webservice_logging_yn        in varchar2 default null,
    p_builder_notification_message in varchar2 default null,
    p_workspace_image_mime_type    in varchar2 default null,
    p_workspace_image              in sys.dbms_sql.varchar2_table default wwv_flow_imp.empty_varchar2_table,
    p_rm_consumer_group            in varchar2 default null,
    p_host_prefix                  in varchar2 default null,
    p_cloud_group_name             in varchar2 default null,
    p_cloud_service_name           in varchar2 default null,
    p_path_prefix                  in varchar2 default null,
    p_allow_restful_services_yn    in varchar2 default null,
    p_files_version                in number   default 1,
    p_is_extension_yn              in varchar2 default 'N',
    p_qos_max_workspace_requests   in number   default null,
    p_qos_max_session_requests     in number   default null,
    p_qos_max_session_kill_timeout in number   default null,
    p_max_session_length_sec       in number   default null,
    p_max_session_idle_sec         in number   default null,
    p_session_timeout_warning_sec  in number   default null,
    p_max_email_messages           in number   default null,
    p_max_webservice_requests      in number   default null,
    p_max_scheduler_jobs           in number   default null,
    p_content_cache_size_target    in number   default null,
    p_content_cache_max_file_size  in number   default null,
    p_env_banner_yn                in varchar2 default 'N',
    p_env_banner_label             in varchar2 default null,
    p_env_banner_color             in varchar2 default null,
    p_env_banner_pos               in varchar2 default 'LEFT',
    p_otel_cls_url                 in varchar2 default null,    -- OpenTelemetry Client Logging Service (CLS) URL 
    p_otel_token_relay_url         in varchar2 default null );  -- OpenTelemetry Token Relay URL

--==============================================================================
-- This procedure allows for programatic and bulk creation of users.
--
-- Arguments:
--    p_ID                = unique identifier of the group, typically a large virtually globally unique number.
--    p_group_name        = name of group
--    p_security_group_id = identifies which company this user group belongs to
--    p_group_desc        = text description used as an note to the developer
--==============================================================================
procedure create_user_group (
    p_id                      in number,
    p_group_name              in varchar2,
    p_security_group_id       in number,
    p_group_desc              in varchar2);

--==============================================================================
-- This procedure allows for removal of group from wwv_flow_fnd_user_groups.
-- This procedure is overloaded.
--
-- Arguments:
--    p_group_id          = unique identifier of the group, typically a large virtually globally unique number.
--==============================================================================
procedure delete_user_group (
    p_group_id                in number);

--==============================================================================
-- This procedure allows for removal of group from wwv_flow_fnd_user_groups.
-- This procedure is overloaded.
--
-- Arguments:
--    p_group_name          = group name.
--==============================================================================
procedure delete_user_group (
    p_group_name              in varchar2);

--==============================================================================
procedure set_group_group_grants (
    p_group_id                in number,
    p_granted_group_ids       in wwv_flow_t_number );

--==============================================================================
-- This procedure allows for programatic and bulk creation of users.
--
-- Example:
--    From sqlplus logged in as the privileged flows user, first
--    ensure that the security group id is set properly, then create
--    your users.
--
--    begin wwv_flow_security.g_security_group_id := 20; end;
--    /
--
--    begin
--       for i in 1..10 loop
--          wwv_flow_fnd_user_api.create_fnd_user(
--             p_user_name => 'USER_'||i,
--             p_email_address => 'user_'||i||'@example.com',
--             p_web_password => 'user_'||i) ;
--       end loop;
--       commit;
--    end;
--    /
--
-- Arguments:
--    p_user_id         numeric primary key of user
--    p_user_name       the username the user uses to login
--    p_first_name      informational only
--    p_last_name       informational only
--    p_web_password    the unencrypted password for the new user
--    p_group_ids       A colon delimited list of group IDs from the table wwv_flow_fnd_user_groups
--    p_developer_privs A colon delmited list of developer privs, privs include:
--                      ADMIN:BROWSE:CREATE:DATA_LOADER:DB_MONITOR:EDIT:HELP:MONITOR:SQL:USER_MANAGER
--    p_default_schema  A valid oracle schema that is the default schema for use in browsing and
--                      creating flows
--    p_allow_access_to_schemas A colon delimited list of oracle schemas that the user is allowed to
--                      parse as.  If null the user can parse as any schema available to the company.
--                      This does not provide privilege it only resticts privilege, so listing a schema
--                      does not provide the privilege to parse as a schema, it only restricts that user
--                      to that list of schemas.
--    p_attributes_XX   These attributes allow you to store arbitary information about a given user.
--                      They are for use by flow developers who want to extend user information.
--    p_web_password_format Identifies the format of the web password.
--                      The range of values is
--                      - CLEAR_TEXT: clear text passwords that are automatically hashed
--                      - a valid password version identifier
--    p_person_type     "E" marks the user as external
--==============================================================================
procedure create_fnd_user (
    p_user_id                      in number   default null,
    p_user_name                    in varchar2,
    p_first_name                   in varchar2 default null,
    p_last_name                    in varchar2 default null,
    p_description                  in varchar2 default null,
    p_email_address                in varchar2 default null,
    p_web_password                 in varchar2,
    p_web_password_format          in varchar2 default 'CLEAR_TEXT',
    p_group_ids                    in varchar2 default null,
    p_developer_privs              in varchar2 default null,
    p_default_schema               in varchar2 default null,
    p_default_date_format          in varchar2 default null,
    p_allow_access_to_schemas      in varchar2 default null,
    p_account_expiry               in date     default trunc(sysdate),
    p_account_locked               in varchar2 default 'N',
    p_failed_access_attempts       in number   default 0,
    p_change_password_on_first_use in varchar2 default 'Y',
    p_first_password_use_occurred  in varchar2 default 'N',
    p_attribute_01                 in varchar2 default null,
    p_attribute_02                 in varchar2 default null,
    p_attribute_03                 in varchar2 default null,
    p_attribute_04                 in varchar2 default null,
    p_attribute_05                 in varchar2 default null,
    p_attribute_06                 in varchar2 default null,
    p_attribute_07                 in varchar2 default null,
    p_attribute_08                 in varchar2 default null,
    p_attribute_09                 in varchar2 default null,
    p_attribute_10                 in varchar2 default null,
    p_allow_app_building_yn        in varchar2 default null,
    p_allow_sql_workshop_yn        in varchar2 default null,
    p_allow_websheet_dev_yn        in varchar2 default null,  -- obsolte 22.1, left for backward compatibility
    p_allow_team_development_yn    in varchar2 default null,
    p_person_type                  in varchar2 default null,
    p_profile_image                in blob     default empty_blob(),
    p_profile_image_name           in varchar2 default null,
    p_profile_mimetype             in varchar2 default null,
    p_profile_filename             in varchar2 default null,
    p_profile_last_update          in date     default null,
    p_profile_charset              in varchar2 default null);

--==============================================================================
-- This procedure allows for programatic and bulk creation of users from a text
-- file.  The file must be in one of two formats.
--
-- FORMAT 1
-- username,email,PRIV1:PRIV2,password
--
-- FORMAT 2
-- username,email,PRIV1:PRIV2
--
-- PRIV1:PRIV2 is a colon delimited list of developer privelages of the
-- user.  Valid privelages are detailed in create_fnd_user spec.
--
-- Each line must end with a line feed (chr(10)).
--
-- Arguments:
--
--    p_id          The id of the file in wwv_flow_file_objects$
--    p_mode        Either CREATE or display depending on whether you
--                  actually want to create the users or just display them
--                  via sys.htp.p
--    p_format      Can be either 1, 2 or 3.  Refers to the format of the file
--                  and the create user process.  1: passwords are contained in
--                  the file in clear text.  2: passwords have been supplied via
--                  the p_password parameter.  3: passwords should be randomly
--                  generated and then e-mailed to the user.
--    p_password    Only relevant in format 2.  Every user created is given the
--                  password supplied in this parameter.
--    p_app         The name of the application.  This name appears in the subject
--                  and body of the e-mail message sent to users when format is 3.
--    p_appurl      Optional URL can be supplied when file format is 3.  The URL will
--                  appear at the end of the mail message.
--    p_start       This parameter holds the start time of execution
--    p_end         Parameter holds the time the procedure completes
--    p_loaded      The number of users that were provisioned by the execution of the
--                  procedure.
--==============================================================================
procedure create_user_from_file (
  p_id in number,
  p_mode      in varchar2 default 'CREATE',
  p_format    in varchar2 default '1',
  p_password  in varchar2 default 'oracle',
  p_app       in varchar2 default null,
  p_appurl    in varchar2 default null,
  p_start    out varchar2,
  p_end      out varchar2,
  p_loaded   out varchar2)
    ;

--==============================================================================
procedure create_user_coll_from_csv (
    p_users                     in varchar2,
    p_security_group_id         in number,
    p_strip_domain              in varchar2 default 'Y');

--==============================================================================
procedure create_user_from_collection (
    p_security_group_id         in number,
    p_web_password              in varchar2,
    p_allow_access_to_schemas   in varchar2,
    p_default_schema            in varchar2,
    p_developer                 in varchar2,
    p_admin                     in varchar2,
    p_allow_app_building_yn     in varchar2,
    p_allow_sql_workshop_yn     in varchar2,
    p_allow_team_development_yn in varchar2);

--==============================================================================
-- This procedure allows for programatic removal of users.
-- This procedure is overloaded.
--==============================================================================
procedure remove_fnd_user (
    p_user_id         in number);

--==============================================================================
-- This procedure allows for programatic removal of users.
-- This procedure is overloaded.
--
-- Example:
--    begin wwv_flow_security.g_security_group_id := 20; end;
--    /
--
--    begin
--       for i in 1..10 loop
--          wwv_flow_fnd_user_api.remove_fnd_user(
--             p_user_name => 'USER_'||i);
--       end loop;
--       commit;
--    end;
--    /
--==============================================================================
procedure remove_fnd_user (
    p_user_name       in varchar2);

--==============================================================================
-- This procedure changes the current users password.
--==============================================================================
procedure change_current_user_pw (
    p_new_password    in varchar2);

--==============================================================================
-- This procedure resets the current users password to a random one and sends
-- an email with the new password to the user.
--==============================================================================
procedure reset_pw (
    p_user                  in varchar2,
    p_security_group_id     in varchar2,
    p_msg                   in varchar2);

--==============================================================================
-- change password of p_user_name in the current workspace to p_new_password.
-- If p_change_password_on_first_use is true, then the user is has to change
-- the password on the next login.
--
-- ARGUMENTS
-- * p_user_name                    the user whose password should be changed.
--                                  defaults to the currently logged in APEX
--                                  user.
-- * p_old_password                 the old (current) password of the user. if
--                                  the value is not the user's password, an
--                                  error occurs. the call also succeeds if the
--                                  given value is null and the owner of the
--                                  calling PL/SQL code has
--                                  APEX_ADMINISTRATOR_ROLE.
-- * p_new_password                 the new password
-- * p_change_password_on_first_use if true (default), then the user has to
--                                  change the password on the next login.
--
-- RAISES
-- * INVALID_CREDENTIALS            p_user_name/p_old_password mismatch
-- * APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER authentication was prevented by
--                                  login throttle
-- * internal error                 p_old_password is null and caller does not
--                                  have APEX_ADMINISTRATOR_ROLE
-- * internal error                 caller is not a valid workspace schema
--==============================================================================
procedure reset_password (
    p_user_name                    in varchar2 default wwv_flow_security.g_user,
    p_old_password                 in varchar2 default null,
    p_new_password                 in varchar2,
    p_change_password_on_first_use in boolean default true );

--==============================================================================
-- obsolete
--==============================================================================
function user_in_group (
    p_group_name in varchar2)
    return boolean;

--==============================================================================
-- Return the colon-delimited list of developer roles
-- for the specified user in the current company
--==============================================================================
function get_user_roles (
    p_username              in varchar2)
    return varchar2;

--==============================================================================
-- given a company short name return the security group id
-- p_company = short name of company
--==============================================================================
function find_security_group_id (
     p_company  in varchar2 default null)
     return number;

--==============================================================================
-- given a security_group_id, return the company short name
-- p_company = short name of company
--==============================================================================
function find_company (
     p_security_group_id  in varchar2 default null)
     return varchar2;

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_fnd_user (
     p_user_id       in number,
     p_company       out varchar2,
     p_user_name     out varchar2,
     p_first_name    out varchar2,
     p_last_name     out varchar2,
     p_web_password  out varchar2,
     p_email_address out varchar2,
     p_start_date    out varchar2,
     p_end_date      out varchar2,
     p_employee_id   out varchar2,
     p_allow_access_to_schemas out varchar2,
     p_person_type     out varchar2,
     p_default_schema  out varchar2,
     p_groups          out varchar2,
     p_developer_role  out varchar2,
     p_description     out varchar2 );

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_fnd_user (
     p_user_id         in number,
     p_user_name       out varchar2,
     p_first_name      out varchar2,
     p_last_name       out varchar2,
     p_email_address   out varchar2,
     p_groups          out varchar2,
     p_developer_role  out varchar2,
     p_description     out varchar2 );

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_fnd_user (
     p_user_id                      in number,
     p_company                      out varchar2,
     p_user_name                    out varchar2,
     p_first_name                   out varchar2,
     p_last_name                    out varchar2,
     p_web_password                 out varchar2,
     p_email_address                out varchar2,
     p_start_date                   out varchar2,
     p_end_date                     out varchar2,
     p_employee_id                  out varchar2,
     p_allow_access_to_schemas      out varchar2,
     p_person_type                  out varchar2,
     p_default_schema               out varchar2,
     p_groups                       out varchar2,
     p_developer_role               out varchar2,
     p_description                  out varchar2,
     p_account_expiry               out date,
     p_account_locked               out varchar2,
     p_failed_access_attempts       out number,
     p_change_password_on_first_use out varchar2,
     p_first_password_use_occurred  out varchar2 );

--==============================================================================
-- Fetch user information from
-- wwv_flow_fnd_user for Edit Profile page.
-- This procedure is overloaded.
--==============================================================================
procedure fetch_fnd_user (
    p_user_id                      in number,
    p_user_name                    out varchar2,
    p_company                      out varchar2,
    p_first_name                   out varchar2,
    p_last_name                    out varchar2,
    p_email_address                out varchar2,
    p_web_password                 out varchar2,
    p_first_password_use_occurred  out varchar2);

--==============================================================================
-- Edit user information to
-- wwv_flow_fnd_user, wwv_flow_fnd_group_users and wwv_flow_developers table.
--==============================================================================
procedure edit_fnd_user (
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
     p_developer_roles              in varchar2 default null,
     p_description                  in varchar2 default null,
     p_account_expiry               in date     default null,
     p_account_locked               in varchar2 default 'N',
     p_failed_access_attempts       in number   default 0,
     p_change_password_on_first_use in varchar2 default 'Y',
     p_first_password_use_occurred  in varchar2 default 'N' );

--==============================================================================
-- Edit user information to
-- wwv_flow_fnd_user for the Edit Profile page.
--==============================================================================
procedure edit_fnd_user (
    p_user_id                      in number,
    p_first_name                   in varchar2 default null,
    p_last_name                    in varchar2 default null,
    p_web_password                 in varchar2 default null,
    p_new_password                 in varchar2 default null,
    p_email_address                in varchar2 default null,
    p_account_locked               in varchar2 default null,
    p_first_password_use_occurred  in varchar2 default 'N',
    p_profile_image                in blob     default empty_blob());

--==============================================================================
procedure lock_account (
    p_user_name     in varchar2 );

--==============================================================================
procedure unlock_account(
    p_user_name     in varchar2 );

--==============================================================================
function get_account_locked_status(
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
procedure expire_workspace_account(
    p_user_name in varchar2 );

procedure unexpire_workspace_account(
    p_user_name in varchar2 );

--==============================================================================
procedure expire_end_user_account(
    p_user_name in varchar2 );

--==============================================================================
procedure unexpire_end_user_account(
    p_user_name in varchar2 );

--==============================================================================
function workspace_account_days_left (
    p_user_name           in varchar2,
    p_check_user_is_admin in boolean default true )
    return number;

--==============================================================================
function end_user_account_days_left(
    p_user_name in varchar2)
    return number;

--==============================================================================
procedure set_custom_auth_status(
    p_status in varchar2 );

--==============================================================================
procedure set_authentication_result(
    p_code in number );

--==============================================================================
function get_authentication_result
    return number;

--==============================================================================
function change_password_on_first_use(
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
function password_first_use_occurred(
    p_user_name in varchar2 )
    return boolean;

--==============================================================================
procedure import_dg_blueprint(
    p_bp_clob in clob );

end wwv_flow_fnd_user_api;
/
show errors
