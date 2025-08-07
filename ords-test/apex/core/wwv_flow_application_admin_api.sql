set define '^' verify off
prompt ...wwv_flow_application_admin_api
create or replace package wwv_flow_application_admin_api as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999  -2022. All Rights Reserved.
--
-- The `APEX_APPLICATION_ADMIN` package provides APIs to modify application
-- attributes of installed Oracle APEX applications.
--
--------------------------------------------------------------------------------
--
--==============================================================================
-- Data Types:
--
-- The `APEX_APPLICATION_ADMIN` package uses the following constants and data types:
--==============================================================================
--
--------------------------------------------------------------------------------
-- Define the kind of application status.
--------------------------------------------------------------------------------
subtype t_app_status is varchar2(30);
c_app_available                constant t_app_status := 'AVAILABLE';
c_app_available_with_edit_link constant t_app_status := 'AVAILABLE_W_EDIT_LINK';
c_app_available_devs_only      constant t_app_status := 'DEVELOPERS_ONLY';
c_app_restricted_access        constant t_app_status := 'RESTRICTED_ACCESS';
c_app_unavailable              constant t_app_status := 'UNAVAILABLE';
c_app_unavailable_redirect     constant t_app_status := 'UNAVAILABLE_URL';
c_app_unavailable_show_plsql   constant t_app_status := 'UNAVAILABLE_PLSQL';

--------------------------------------------------------------------------------
-- Define the kind of build status.
--------------------------------------------------------------------------------
subtype t_build_status is varchar2(30);
c_build_status_run_and_build   constant t_build_status := 'RUN_AND_BUILD';
c_build_status_run_only        constant t_build_status := 'RUN_ONLY';

--------------------------------------------------------------------------------
-- Define the kind of build option status.
--------------------------------------------------------------------------------
subtype t_build_option_status is varchar2(30);
c_build_option_status_include constant t_build_option_status := 'INCLUDE';
c_build_option_status_exclude constant t_build_option_status := 'EXCLUDE';

-------------------------------------------------------------------------------
-- Define the kind of file storage options.
--------------------------------------------------------------------------------
subtype t_storage_type is varchar2(30);
c_file_storage_oci     constant t_storage_type := 'OBJECT_STORE';
c_file_storage_db      constant t_storage_type := 'DB';

--==============================================================================
-- PUBLIC APIs
--==============================================================================

--==============================================================================
-- This procedure sets the application Security attribute "Pass ECID" (Execution Context ID).
-- Indicates whether to pass the ECID to the external web services for end-to-end tracing.
--
-- Parameters:
-- * p_application_id: The application ID
-- * p_pass_ecid:      Boolean value (true or false)
--
-- Example:
--     begin
--         apex_application_admin.set_pass_ecid(100, true);
--     end;
--
-- See Also:
-- GET_PASS_ECID
--==============================================================================
procedure set_pass_ecid (
    p_application_id in number,
    p_pass_ecid      in boolean );

--==============================================================================
-- This function retrieves the application security attribute "Pass ECID" (Execution Context ID).
-- This indicates whether to pass the ECID to the external web services for end-to-end tracing.
--
-- Parameters:
-- * p_application_id: The application ID
--
-- See Also:
-- SET_PASS_ECID
--==============================================================================
function get_pass_ecid (
    p_application_id in number )
    return boolean;

--==============================================================================
-- Set the application attribute "Maximum Scheduler Jobs", which indicates how
-- many scheduler jobs can run at the same time to execute background page processes.
--
-- Parameters:
-- * p_application_id:     The application ID
-- * p_max_scheduler_jobs: Maximum number of scheduler jobs running for this application
--                         at the same time.
--
-- The following example sets the maximum scheduler jobs for app 100 to 5.
--
--     begin
--         apex_application_admin.set_max_scheduler_jobs(100, 5);
--     end;
--
-- See Also:
-- GET_MAX_SCHEDULER_JOBS
--==============================================================================
procedure set_max_scheduler_jobs(
    p_application_id     in number,
    p_max_scheduler_jobs in number );

--==============================================================================
-- This function fetches the application attribute "Maximum Scheduler Jobs",
-- which indicates how many scheduler jobs can run at the same time
-- to execute background page processes.
--
-- Parameters:
-- * p_application_id: The application ID
--
-- See Also:
-- SET_MAX_SCHEDULER_JOB
--==============================================================================
function get_max_scheduler_jobs(
    p_application_id     in number )
    return number;

--==============================================================================
-- Set the global notification message.
--
-- This is the message displayed in the `#GLOBALNOTIFICATION#` substitution
-- string.
--
-- Parameters:
-- * p_application_id:              The application ID
-- * p_global_notification_message: The new global notification message
--
-- See Also:
-- GET_GLOBAL_NOTIFICATION
--==============================================================================
procedure set_global_notification(
    p_application_id              in number,
    p_global_notification_message in varchar2 );

--==============================================================================
-- Get the global notification message. This is the message displayed in
-- the `#GLOBALNOTIFICATION#` substitution string.
--
-- Parameters:
-- * p_application_id: The application ID
--
-- See Also:
-- SET_GLOBAL_NOTIFICATION
--==============================================================================
function get_global_notification(
    p_application_id in number )
return varchar2;

--==============================================================================
-- Set the status of a Build Option.
--
-- Parameters:
-- * p_app:          The application ID.
-- * p_id:           The build option ID.
-- * p_build_status: Status with possible values:
--                   + apex_application_admin.c_build_option_status_include
--                   + apex_application_admin.c_build_option_status_exclude
--
-- See Also:
-- GET_BUILD_OPTION_STATUS Function Signature 1
-- GET_BUILD_OPTION_STATUS Function Signature 2
-- Data Types
--==============================================================================
procedure set_build_option_status (
    p_application_id   in number,
    p_id               in number,
    p_build_status     in t_build_option_status );

--==============================================================================
-- Get the status of a Build Option by ID.
--
-- Parameters:
-- * p_application_id: The application ID
-- * p_id:             The build option ID
--
-- See Also:
-- SET_BUILD_OPTION_STATUS
-- Data Types
--==============================================================================
function get_build_option_status (
    p_application_id   in number,
    p_id               in number )
return t_build_option_status;

--==============================================================================
-- Get the status of a Build Option by name.
--
-- Parameters:
-- * p_application_id:    The application ID
-- * p_build_option_name: The build option name.
--
-- See Also:
-- SET_BUILD_OPTION_STATUS
-- Data Types
--==============================================================================
function get_build_option_status (
    p_application_id    in number,
    p_build_option_name in varchar2 )
return t_build_option_status;

--==============================================================================
-- Set the status of the application.
--
-- Parameters:
-- * p_application_id:       The application ID.
-- * p_application_status:   New status to set application to. Values include:
--                           + apex_application_admin.c_app_available                - Application is available with no restrictions.
--                           + apex_application_admin.c_app_available_with_edit_link - Application is available with no restrictions. Developer Toolbar shown to developers.
--                           + apex_application_admin.c_app_available_devs_only      - Application only available to developers.
--                           + apex_application_admin.c_app_restricted_access        - Application only available to users in `p_allowed_users_list`.
--                           + apex_application_admin.c_app_unavailable              - Application unavailable. Message shown in `p_message`.
--                           + apex_application_admin.c_app_unavailable_redirect     - Application unavailable. Redirected to URL provied in `p_redirect_url`.
--                           + apex_application_admin.c_app_unavailable_show_plsql   - Application unavailable. Message shown from PL/SQL block in `p_plsql_code`.
-- * p_allowed_users_list:   An `apex_t_varchar2` list of users which are allowed to access the application when `p_application_status` = `c_app_restricted_access`.
-- * p_message:              Message shown to users when `p_application_status` = `c_app_unavailable`.
-- * p_plsql_code:           Message shown to users when `p_application_status` = `c_app_unavailable_show_plsql`.
-- * p_redirect_url:         URL to redirect to when `p_application_status` = `c_app_unavailable_redirect`.
--
--
-- Example:
-- The following example sets the application status for application 100 to
-- restricted access - only USER1 and USER2 are allowed to use it.
--
--     begin
--        apex_util.set_workspace('YOUR_WORKSPACE_NAME');
--        apex_application_admin.set_application_status (
--            p_application_id     => 100,
--            p_application_status => apex_application_admin.c_app_restricted_access,
--            p_allowed_users_list => apex_t_varchar2('USER1','USER2') );
--     commit;
--     end;
--
-- See Also:
-- GET_APPLICATION_STATUS
-- Data Types
--==============================================================================
procedure set_application_status (
    p_application_id            in number,
    p_application_status        in t_app_status,
    --
    p_allowed_users_list        in wwv_flow_t_varchar2 default null,
    --
    p_message                   in varchar2 default null,
    p_plsql_code                in varchar2 default null,
    p_redirect_url              in varchar2 default null );

--==============================================================================
-- Get the application status (e.g. Available, Unavailable, etc.).
-- Returns `t_app_status`.
--
-- Parameters:
-- * p_application_id: The application ID.
--
-- Example:
--
-- The following example gets the application status for application 100 and
-- works with one of the constants to act on the result.
--
--     declare
--         l_app_status apex_application_admin.t_app_status;
--     begin
--         apex_util.set_workspace('YOUR_WORKSPACE_NAME');
--         l_app_status := apex_application_admin.get_application_status (
--                             p_application_id => 100 );
--         if l_app_status = apex_application_admin.c_app_available_with_edit_link then
--             dbms_output.put_line(l_app_status);
--           ...your custom code here...
--        end if;
--     end;
--
-- See Also:
-- SET_APPLICATION_STATUS
-- Data Types
--==============================================================================
function get_application_status (
    p_application_id in number )
return t_app_status;

--==============================================================================
-- Set the application name.
--
-- Parameters:
-- * p_application_id:   The application ID
-- * p_application_name: The application name. Cannot be null and cannot be longer than 255 characters.
--
-- Example:
--
-- The following example sets the application name to 'Executive Dashboard' for application 100.
--
--     declare
--         c_id   constant number        := 100;
--         c_name constant varchar2(255) := 'Executive Dashboard';
--     begin
--         apex_application_admin.set_application_name (
--             p_application_id   => c_id,
--             p_application_name => c_name );
--     end;
--
-- See Also:
-- GET_APPLICATION_NAME
--==============================================================================
procedure set_application_name (
    p_application_id   in number,
    p_application_name in varchar2 );

--==============================================================================
-- This function retrieves the application name.
--
-- Parameters:
-- * p_application_id: The application ID
--
-- Example:
--
-- The following example returns the value of the application name.
--
--      declare
--          l_application_name varchar2(255);
--      begin
--          l_application_name := apex_application_admin.get_application_name (
--                                    p_application_id => 100 );
--      end;
--
-- See Also:
-- SET_APPLICATION_NAME
--==============================================================================
function get_application_name (
    p_application_id in number )
    return varchar2;

--==============================================================================
-- This procedure sets the application alias.
--
-- Parameters:
-- * p_application_id:    The application ID
-- * p_application_alias: The application alias. Cannot be null and cannot be longer than 255 characters.
--
-- Example:
--
-- The following example sets the application alias to 'EXECUTIVE-DASHBOARD' for application 100.
--
--      declare
--          c_id    constant number        := 100;
--          c_alias constant varchar2(255) := 'EXECUTIVE-DASHBOARD';
--      begin
--          apex_application_admin.set_application_alias (
--              p_application_id    => c_id,
--              p_application_alias => c_alias );
--      end;
--
-- See Also:
-- GET_APPLICATION_ALIAS
--==============================================================================
procedure set_application_alias (
    p_application_id    in number,
    p_application_alias in varchar2 );

--==============================================================================
-- Get the application alias.
--
-- Parameters:
-- * p_application_id: The application ID.
--
-- Example:
--
-- The following example returns the value of the application alias.
--
--     declare
--          l_application_alias varchar2(255);
--     begin
--          l_application_alias := apex_application_admin.get_application_alias (
--                                     p_application_id => 100 );
--     end;
--
-- See Also:
-- SET_APPLICATION_ALIAS
--==============================================================================
function get_application_alias (
    p_application_id in number )
    return varchar2;

--==============================================================================
-- This procedure sets the application build status.
--
-- Parameters:
-- * p_application_id: The application ID
-- * p_build_status:   New build status to set application to. Values include:
--                     - `RUN_AND_BUILD` - Developers and users can both run and
--                                         develop the application.
--                     - `RUN_ONLY`      - Users can only run the application.
--                                         Developers cannot edit the application.
--
-- Example:
--
-- The following example sets build status for app 100 to `RUN_ONLY`.
--
--     begin
--         apex_application_admin.set_build_status (
--             p_application_id => 100,
--             p_build_status   => 'RUN_ONLY' );
--     end;
--   /
--
-- See Also:
-- GET_BUILD_STATUS
--==============================================================================
procedure set_build_status (
    p_application_id in number,
    p_build_status   in t_build_status );

--==============================================================================
-- This function retrieves the application build status.
--
-- Parameters:
-- * p_application_id: The application ID.
--
-- Example:
--
-- The following example returns the value of the application build status.
--
--     declare
--         l_application_build_status  apex_application_admin.t_build_status;
--     begin
--         l_application_build_status := apex_application_admin.get_build_status (
--                                           p_application_id => 100 );
--     end;
--
-- See Also:
-- SET_BUILD_STATUS
-- Data Types
--==============================================================================
function get_build_status (
    p_application_id in number )
    return t_build_status;

--==============================================================================
-- This procedure sets the application image prefix.
--
-- Parameters:
-- * p_application_id: The application ID.
-- * p_image_prefix:   The image prefix. Cannot be longer than 255 characters.
--
-- Example:
--
-- The following example sets the application image prefix to '/static/' for application 100.
--
--     declare
--         c_id           constant number        := 100;
--         c_image_prefix constant varchar2(255) := '/static/';
--     begin
--         apex_application_admin.set_image_prefix (
--             p_application_id => c_id,
--             p_image_prefix   => c_image_prefix );
--     end;
--
-- See Also:
-- GET_IMAGE_PREFIX
--==============================================================================
procedure set_image_prefix (
    p_application_id in number,
    p_image_prefix   in varchar2 );

--==============================================================================
-- This function retrieves the application image prefix.
--
-- Parameters:
-- * p_application_id: The application ID.
--
-- Example:
--
-- The following example returns the value of the the application image prefix.
--
--     declare
--         l_image_prefix varchar2(255);
--     begin
--         l_image_prefix := apex_application_admin.get_image_prefix (
--                               p_application_id => 100 );
--     end;
--
-- See Also:
-- SET_IMAGE_PREFIX
--==============================================================================
function get_image_prefix (
    p_application_id in number )
    return varchar2;

--==============================================================================
-- Set the proxy server attributes of an application.
--
-- Parameters:
-- * p_application_id:   The application ID
-- * p_proxy_server:     The proxy server. There is no default value. The proxy
--                       server cannot be more than 255 characters and should
--                       not include any protocol prefix such as
--                       http://. A sample value might be: `www-proxy.example.com`
-- * p_no_proxy_domains: Comma delimited list of domains for which the proxy
--                       server should not be used. Default value is null.
--                       Cannot be more than 500 characters.
--
-- Example:
--
-- The following example sets the value of the proxy for an application.
--
--     begin
--         apex_application_admin.set_proxy_server (
--             p_proxy_server => 'www-proxy.example.com' );
--     end;
--
-- See Also:
-- GET_PROXY_SERVER
-- GET_NO_PROXY_DOMAINS
--==============================================================================
procedure set_proxy_server (
    p_application_id   in number,
    p_proxy_server     in varchar2,
    p_no_proxy_domains in varchar2 default null );

--==============================================================================
-- This function retrieves the proxy server attribute of an application.
--
-- Parameters:
-- * p_application_id: The application ID.
--
-- Example:
--
-- The following example returns the value of the application proxy server.
-- The proxy server attribute cannot be more than 255 characters.
--
-- ~~~
-- declare
--     l_proxy_server varchar2(255);
-- begin
--     l_proxy_server := apex_application_admin.get_proxy_server (
--         p_application_id => 100 );
-- end;
-- ~~~
--
-- See Also:
-- SET_PROXY_SERVER
-- GET_NO_PROXY_DOMAINS
--==============================================================================
function get_proxy_server (
    p_application_id in number )
    return varchar2;

--==============================================================================
-- Retrieves the "No Proxy Domains" attribute of an application.
--
-- Parameters:
-- * p_application_id: The application ID.
--
-- Returns:
-- A comma delimited list of domains for which the proxy server should not be used.
-- The "No Proxy Domains" attribute cannot be more than 500 characters.
--
-- See Also:
-- SET_PROXY_SERVER
-- GET_PROXY_SERVER
--==============================================================================
function get_no_proxy_domains (
    p_application_id in number )
    return varchar2;

--==============================================================================
-- Set the parsing schema ("owner") of an application.
--
-- The database user of the schema must already exist, and the schema name must
-- already be mapped to the workspace.
--
-- Parameters:
-- * p_application_id: The application ID
-- * p_schema:         The schema name.
--
-- Example:
--
-- The following example sets the parsing schema to 'EXAMPLE' for application 100.
--
--     begin
--         apex_application_admin.set_parsing_schema (
--             p_application_id => 100,
--             p_schema         => 'EXAMPLE' );
--     end;
--
-- See Also:
-- GET_PARSING_SCHEMA
--==============================================================================
procedure set_parsing_schema (
    p_application_id in number,
    p_schema         in varchar2 );

--==============================================================================
-- Get the parsing schema ("owner") of an application.
--
-- Parameters:
-- * p_application_id: The application ID
--
-- Example:
--
-- The following example returns the value of the application schema for application 100.
--
--     declare
--         l_schema varchar2(30);
--     begin
--         l_schema := apex_application_admin.get_parsing_schema(
--                         p_application_id => 100 );
--     end;
--
-- See Also:
-- SET_PARSING_SCHEMA
--==============================================================================
function get_parsing_schema (
    p_application_id in number )
    return varchar2;

--==============================================================================
-- This procedure sets the authentication scheme of an application.
--
-- Parameters:
-- * p_application_id: The application ID
-- * p_name:           The name of the authentication scheme to be activated. This new
--                     authentication scheme must exist in the application. If null,
--                     the active authentication scheme will remain unchanged.
--
-- Example:
--
-- Activate authentication scheme "SSO-Production" for application 100.
--
--     begin
--         apex_application_admin.set_authentication_scheme (
--             p_application_id => 100,
--             p_name           => 'SSO-Production' );
--     end;
--
-- See Also:
-- GET_AUTHENTICATION_SCHEME
--==============================================================================
procedure set_authentication_scheme (
    p_application_id in number,
    p_name           in varchar2 );

--==============================================================================
-- Get the authentication scheme of an application.
--
-- Parameters:
-- * p_application_id: The application ID
--
-- Example:
--
-- The following example prints the authentication scheme override:
--
--     select apex_application_admin.get_authentication_scheme(100)
--       from sys.dual;
--
-- See Also:
-- SET_AUTHENTICATION_SCHEME
--==============================================================================
function get_authentication_scheme (
    p_application_id in number )
    return varchar2;

--==============================================================================
-- This procedure sets the version of an application.
--
-- Parameters:
-- * p_application_id: The application ID
-- * p_version:        The version information. Cannot be longer than 255 characters.
--
-- Example:
--
-- Set the version for application 100.
--
--     begin
--         apex_application_admin.set_application_version (
--             p_application_id => 100,
--             p_version        => 'Release 1.0' );
--     end;
--
-- See Also:
-- GET_APPLICATION_VERSION
--==============================================================================
procedure set_application_version (
   p_application_id in number,
   p_version        in varchar2 );

--==============================================================================
-- This function retrieves the version of an application.
--
-- Parameters:
-- * p_application_id: The application ID.
--
-- Example:
--
-- Print the application version:
--
--     select apex_application_admin.get_application_version(100)
--       from sys.dual;
--
-- See Also:
-- SET_APPLICATION_VERSION
--==============================================================================
function get_application_version (
   p_application_id in number )
return varchar2;

--==============================================================================
-- Use this procedure to set the file storage type to use either the local
-- database or OCI Object store. If Object store is chosen, make sure to
-- pass the static ID of the remote server pointing to the object store
-- bucket.
--
-- Parameters:
-- * p_application_id:          The ID of the application.
-- * p_storage_type:            Whether to use database or OCI storage for files
-- * p_remote_server_static_id: Static ID of the remote server, if OCI is used.
-- * p_migrate_files:           If true, migrate application files from the
--                              application export to specified file storage server.
--
-- Example:
--
-- During import, set the file storage to OCI, use the remote server with the
-- static ID "bucket-app-files-myapp" and upload all files contained in the
-- export file.
--
--     begin
--         apex_application_admin.set_file_storage(
--             p_application_id          => 100,
--             p_storage_type            => apex_application_admin.c_file_storage_oci,
--             p_remote_server_static_id => 'bucket-app-files-myapp',
--             p_migrate_files           => true );
--     end;
--
-- See Also:
-- GET_FILE_STORAGE
--==============================================================================
procedure set_file_storage (
    p_application_id          in number,
    p_storage_type            t_storage_type,
    p_remote_server_static_id in varchar2         default null,
    p_migrate_files           in boolean          default false );

--==============================================================================
-- Get the static ID of the file storage remote server of an application.
-- If database file storage is used, NULL is returned.
--
-- Parameters:
-- * p_application_id:          The ID of the application.
--
-- Returns:
-- The static ID of the file storage remote server, if OCI file storage is used.
-- NULL otherwise.
--
-- Example:
--
-- The example prints the static ID of application file storage remote server setting
--
--     select apex_application_admin.get_file_storage(100)
--       from sys.dual;
--
-- See Also:
-- SET_FILE_STORAGE
--==============================================================================
function get_file_storage (
   p_application_id in number )
return varchar2;

--==============================================================================
-- Use this procedure to set Base URL, HTTPS Host, and other attributes for remote
-- servers. Remote Servers are identified by their Static ID.
--
-- Parameters:
-- * p_static_id:        Static ID to reference the remote server object.
-- * p_base_url:         New Base URL to use for this remote server object.
-- * p_https_host:       New HTTPS Host Property to use for this remote server object.
--
-- * p_default_database: Default database to use when connecting. Currently only supported for MySQL databases.
-- * p_mysql_sql_modes:  SQL modes to use when connecting to a MySQL database.
--
-- * p_ords_timezone:    Time zone which the remote ORDS server runs in. Only relevant for
--                       REST Enabled SQL services, when remote ORDS does not run in UTC time zone.
--
-- * p_ai_model_name:    The AI model to use when requesting a response from a Generative AI Service.
-- * p_ai_http_headers:  HTTP headers to use when making a request to a Generative AI Service.
-- * p_ai_attributes:    Attributes in JSON format to use when making a request to a Generative AI Service.
--
-- Example:
--
--     begin
--         apex_application_admin.set_remote_server(
--             p_static_id => 'MY_REMOTE_SERVER',
--             p_base_url => 'http://production.example.com' );
--     end;
--==============================================================================
procedure set_remote_server(
    p_static_id        in varchar2,
    p_base_url         in varchar2,
    p_https_host       in varchar2 default null,
    --
    p_default_database in varchar2 default null,
    p_mysql_sql_modes  in varchar2 default null,
    --
    p_ords_timezone    in varchar2 default null,
    --
    p_ai_model_name    in varchar2 default null,
    p_ai_http_headers  in clob     default null,
    p_ai_attributes    in clob     default null );

end wwv_flow_application_admin_api;
/
show errors

