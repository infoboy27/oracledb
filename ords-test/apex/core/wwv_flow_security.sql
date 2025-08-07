set define off verify off
prompt ...wwv_flow_security
create or replace package wwv_flow_security as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
--
--    DESCRIPTION
--      Security and authentication services
--
--    SECURITY
--      This package is only accessible to the owner of Oracle APEX
--      This package contains globals that control parsing and company (aka workspace)
--      identification.
--      g_parse_as_schema   = schema to parse SQL as
--      g_security_group_id = identifies the workspace of the current user (provides VPD)
--
--    MODIFIED   (MM/DD/YYYY)
--     mhichwa    01/20/2000 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- wallet information for public key certificates of ssl encoded ldap, http and
-- mail
--==============================================================================
type t_wallet is record (
    wallet_path                 varchar2(4000),
    wallet_pwd                  varchar2(4000) );

--==============================================================================
-- workspace settings
--==============================================================================
type t_workspace is record (
    security_group_id             wwv_flow_companies.provisioning_company_id%type,
    short_name                    wwv_flow_companies.short_name%type,
    display_name                  wwv_flow_companies.display_name%type,
    rm_consumer_group             wwv_flow_companies.rm_consumer_group%type,
    host_prefix                   wwv_flow_companies.host_prefix%type,
    path_prefix                   wwv_flow_companies.path_prefix%type,
    account_status                wwv_flow_companies.account_status%type,
    fnd_user_max_login_failures   wwv_flow_companies.fnd_user_max_login_failures%type,
    expire_fnd_user_accounts      wwv_flow_companies.expire_fnd_user_accounts%type,
    qos_max_workspace_requests    wwv_flow_companies.qos_max_workspace_requests%type,
    qos_max_session_requests      wwv_flow_companies.qos_max_session_requests%type,
    qos_max_session_kill_timeout  wwv_flow_companies.qos_max_session_kill_timeout%type,
    max_session_length_sec        wwv_flow_companies.max_session_length_sec%type,
    max_session_idle_sec          wwv_flow_companies.max_session_idle_sec%type,
    session_timeout_warning_sec   wwv_flow_companies.session_timeout_warning_sec%type,
    files_version                 wwv_flow_companies.files_version%type,
    cookie_name                   wwv_flow_companies.cookie_name%type,
    env_banner_yn                 wwv_flow_companies.env_banner_yn%type,
    env_banner_label              wwv_flow_companies.env_banner_label%type,
    env_banner_color              wwv_flow_companies.env_banner_color%type,
    env_banner_pos                wwv_flow_companies.env_banner_pos%type,
    schemas                       wwv_flow_t_varchar2,
    ai_is_enabled_yn              wwv_flow_companies.ai_is_enabled_yn%type,
    otel_cls_url                  wwv_flow_companies.otel_cls_url%type,
    otel_token_relay_url          wwv_flow_companies.otel_token_relay_url%type
);

--==============================================================================
-- workspace login control settings
--==============================================================================
type t_workspace_sec is record (
    login_throttle_delay   pls_integer,
    login_throttle_methods varchar2(4000),
    expire_accounts        boolean,
    failed_login_threshold pls_integer );

--==============================================================================
-- checksum level types
--==============================================================================
subtype t_checksum_protection_level is pls_integer range 0 .. 4;
c_checksum_level_none            constant t_checksum_protection_level := 0;
c_checksum_level_app             constant t_checksum_protection_level := 1; -- also 'PUBLIC_BOOKMARK'
c_checksum_level_user            constant t_checksum_protection_level := 2; -- also 'PRIVATE_BOOKMARK'
c_checksum_level_session         constant t_checksum_protection_level := 3; -- also 'SESSION'
c_checksum_level_noargs          constant t_checksum_protection_level := 4;

c_checksum_curr_version_prefix   constant varchar2(1) := 'a';

--==============================================================================
-- URL Tampering Prevention - value set in f and tested in wwv_flow.show
--==============================================================================
g_url_checksum_src              varchar2(32767);
g_url_old_checksum_src_v1       varchar2(32767);
g_url_old_checksum_src_v2       varchar2(32767);

g_custom_authentication_page    number;
g_custom_invalid_session_url    varchar2(4000);
g_sso_session_registration      boolean        := false;
g_authenticated                 boolean        := false;
g_notification_checksum         boolean        := true;
g_success_message_checksum      boolean        := true;
g_user                          varchar2(255);
g_flow_id                       number;
g_instance                      number;
g_translated_flow_id            number;
g_page_request                  boolean        := false;
g_context                       varchar2(60)   := 'NULL';   -- mike security

-------------------------------
-- the current users company ID
--
g_security_group_id            number := 0;


--------------------------------------------------------------------
-- the Oracle Schema whos rights and privs will be used to parse SQL
--
g_parse_as_schema              varchar2(255);  -- owner of the application, use this owner to parse SQL


---------------------------------------------------
-- to avoid parsing as the flows schema supper user
g_parse_as_schema_override     varchar2(255);  -- for app builder set this global to avoid parsing as flows schema

------------------------------------------------------------------------------
-- the schema where the APEX$ tables are located for the current workspace
g_apex$_schema                 varchar2(255);

-----------------------------------------------------
-- the security group id (aka company id) of the flow
--
g_curr_flow_security_group_id  number;

-----------------------------------------------------
-- the MLE environment in which to execute all MLE snippets
--
g_mle_environment              varchar2(255);

--
--
--
g_in_accept                   boolean := false;        -- set by accept procedure so other packages can take action based on show or accept processing
g_in_process                  boolean := false;
--
-- constants and variables to support fnd account access
--
AUTH_NORMAL                   constant pls_integer := 0;
AUTH_UNKNOWN_USER             constant pls_integer := 1;
AUTH_ACCOUNT_LOCKED           constant pls_integer := 2;
AUTH_ACCOUNT_EXPIRED          constant pls_integer := 3;
AUTH_PASSWORD_MISMATCH        constant pls_integer := 4;
AUTH_PASSWORD_FIRST_USE       constant pls_integer := 5;
AUTH_PWD_ATTEMPTS_EXCEEDED    constant pls_integer := 6;
AUTH_INTERNAL_ERROR           constant pls_integer := 7;
AUTH_UNKNOWN_WORKSPACE        constant pls_integer := 8;
AUTH_LOGIN_ATTEMPTS_THROTTLED constant pls_integer := 9;

g_authenticate_user_action     boolean;        -- set when wwv_flow_security.authenticate is executing
g_authentication_result        number;         -- coded result of wwv_flow_security.authenticate
g_authentication_user_id       number;         -- workspace user id if wwv_flow_security.authenticate was successful
g_custom_authentication_status varchar2(4000); -- may be set by author of custom authentication function using api

c_db_sid                       constant number := sys_context('userenv','sid');

--------------------------------------------------------------------
-- SERIALIZATION

subtype t_lock_handle is varchar2(128);

--
-- Exception when serialization lock could not be obtained
--
e_lock_timeout exception;
--
-- Exception when some other lock or lock release error occurred
--
e_lock_error   exception;

--##############################################################################
--#
--# NLS_SORT
--#
--##############################################################################

--==============================================================================
-- Record type to store the value of NLS_SORT
--==============================================================================
type t_nls_sort is record (
    is_binary    boolean,
    old_nls_sort varchar2(30) );

--==============================================================================
-- Return the value of the session's NLS_SORT and set NLS_SORT to binary.
--==============================================================================
function with_binary_sort
    return t_nls_sort;

--==============================================================================
-- Restore the old NLS_SORT value in p_value if it is not binary.
--==============================================================================
procedure restore_sort (
    p_value in t_nls_sort );

--##############################################################################
--#
--# STRING CASE
--#
--##############################################################################

--==============================================================================
-- Return the upper case value of the given input string. Use this function
-- instead of upper() to avoid errors in RDBMS test tkzgincorrcase.tsc.
--==============================================================================
function upper_sec_ok (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
-- Return the lower case value of the given input string. Use this function
-- instead of lower() to avoid errors in RDBMS test tkzgincorrcase.tsc.
--==============================================================================
function lower_sec_ok (
    p_string in varchar2 )
    return varchar2;

--##############################################################################
--#
--# WORKSPACE USER AND WORKSPACE SCHEMA ARE ALWAYS UPPER CASE
--#
--##############################################################################

--==============================================================================
function normalize_ws_schema_name (
    p_schema in wwv_flow_global.t_dbms_id )
    return wwv_flow_global.t_dbms_id;

--==============================================================================
function normalize_ws_user_name (
    p_user in varchar2 )
    return varchar2;

--##############################################################################
--#
--# WWV_FLOW_COMPANY ACCESS ROUTINES
--#
--##############################################################################

--==============================================================================
-- Translate company name to the security group id
--==============================================================================
function find_security_group_id (
     p_company       in varchar2 default null,
     p_only_assigned in boolean  default false )
     return number;

--==============================================================================
-- Translate path prefix to the security group id
--==============================================================================
function find_security_group_id_by_path (
     p_path_prefix   in varchar2 default null,
     p_only_assigned in boolean  default false )
     return number
     result_cache;

--==============================================================================
--
--==============================================================================
function find_first_schema (
     p_security_group_id in number)
     return varchar2;

--==============================================================================
--
--==============================================================================
function find_company_name (
     p_security_group_id in number)
     return varchar2;

--
-- C O O K I E
--

--==============================================================================
--
--==============================================================================
function cookie_user
    return varchar2;

--==============================================================================
-- determine if application developer can edit the current flow
--
-- Identify the developer from the session cookie. The
-- wwv_flow_security.cookie_user function will return the user only if an
-- session cookie exists matching wwv_flow_security.g_security_group_id and the
-- session encoded in the cookie still exists in wwv_flow_sessions$ and also
-- has matching criteria.
--==============================================================================
function cookie_user_can_dev_curr_flow(
    p_user in varchar2 default null)
   return boolean;

--
-- P L A T F O R M   P R I V S
--
--==============================================================================
--
--==============================================================================
function flow_owner (
    p_flow_id             in number,
    p_security_group_id   in number)
    return varchar2;

--==============================================================================
-- determine whether the owner of the flow has a specific system privilege
-- granted.
--==============================================================================
function check_db_privilege_before_use (
    p_flow_id             in number,
    p_security_group_id   in number,
    p_system_privilege    in varchar2,
    p_capture_usage       in boolean default true )
    return boolean;

--==============================================================================
-- return the workspace id of a given application or null if the app does not
-- exist.
--==============================================================================
function get_flow_security_group_id (
    p_flow_id in number )
    return number;

--==============================================================================
-- used in 4000, 4050
--==============================================================================
function user_is_internal
   return boolean;

--==============================================================================
-- used in 4000
--==============================================================================
function user_can_develop_flow (
   p_flow_id in number)
   return boolean;

--==============================================================================
-- this function checks if the current user has access to schema or not
--
-- Parameters:
-- * p_in_schema   : Schema name to check
--
-- Returns:
--  returns true if current user has access to the schema
--  returns false otherwise
--==============================================================================
function current_user_can_build (
    p_schema in varchar2)
    return boolean;

--==============================================================================
--
--==============================================================================
function current_company_can_build (
    p_in_schema in varchar2)
    return boolean;

--==============================================================================
--
--==============================================================================
function current_company_can_parse (
    p_in_schema in varchar2)
    return boolean;

--==============================================================================
--
--==============================================================================
function get_security_group_id (
    p_provisioned_schema in varchar2)
    return number;

--==============================================================================
-- used in 4000, 4350
--==============================================================================
function user_can_develop_any_flow
    return boolean;

--==============================================================================
-- return USER, ROLE or null, depending on whether p_username is a database
-- user, a role or not defined in sys.user$
--==============================================================================
function get_db_user_or_role (
    p_username in varchar2 )
    return varchar2;

--==============================================================================
-- return whether a db user exists
--==============================================================================
function exists_db_user (
    p_username in varchar2 )
    return boolean;

--==============================================================================
-- return the database user which executes this api call. the function looks
-- at g_parse_as_schema_override and g_parse_as_schema before falling back to
-- USER.
--==============================================================================
function get_db_user
    return varchar2;

--==============================================================================
-- Return whether the given user is a superuser
--==============================================================================
function is_superuser (
    p_username in varchar2 default wwv_flow_security.get_db_user )
    return boolean;

--==============================================================================
-- return if p_username has been granted APEX_ADMINISTRATOR_ROLE or is in
-- (wwv_flow.g_flow_schema_owner, SYS, SYSTEM)
--==============================================================================
function has_apex_administrator_role (
    p_username in varchar2 default null )
    return boolean;
--
--==============================================================================
-- return Y if p_username has been granted APEX_ADMINISTRATOR_ROLE or is in
-- (wwv_flow.g_flow_schema_owner, SYS, SYSTEM)
--==============================================================================
function has_apex_administrator_role_yn (
    p_username in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- return Y if p_username should be able to read APEX dictionary views for all
-- workspaces. The user is entitled to query all workspaces if
--
--   - user is wwv_flow.g_flow_schema_owner, SYS, SYSTEM
--   - user has been granted APEX_ADMINISTRATOR_ROLE
--   - user has been granted APEX_ADMINISTRATOR_READ_ROLE
--   - user has been granted SELECT ANY DICTIONARY
--==============================================================================
function has_apex_admin_read_role_yn (
    p_username in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- return if p_username has role "DBA"
--==============================================================================
function user_is_dba(
    p_username in varchar2)
    return boolean;

--==============================================================================
-- is the user authenticated to the builder?
--==============================================================================
function user_builder_session_company
    return number;

--==============================================================================
-- return the session id of the development environment.
-- this is used to provide links to the builder with the proper session id
--==============================================================================
function get_builder_session_id
    return number;

--==============================================================================
--
--==============================================================================
procedure session_cookie_info_internal(
    p_user    out varchar2,
    p_session out number,
    p_sgid    out number);

--==============================================================================
-- Encode a success/notification message with checksum and return the encoded
-- string. This function is used to add the notification_msg and success_msg
-- parameters to a f?p URL.
--
-- SEE ALSO
--   decode_with_checksum
--==============================================================================
function encode_with_checksum (
    p_msg  in varchar2,
    p_salt in varchar2 default null )
    return varchar2;

--==============================================================================
-- Decode message with checksum and overwrite p_msg with the decoded string.
--
-- SEE ALSO
--   encode_with_checksum
--==============================================================================
function decode_with_checksum (
    p_msg  in varchar2,
    p_salt in varchar2 default null )
    return varchar2;

--==============================================================================
--
--==============================================================================
function authenticated_session(
    p_flow_id           in number,
    p_security_group_id in number,
    p_session_id        in number default null)
    return boolean;

--==============================================================================
-- normalize a compressed ipv6 address. compression removes leading zeroes and
-- replaces a consecutive sequence of zero groups with :: (only allowed once,
-- to avoid abiguity).
--
-- compressed             normalized
-- ---------------------- ---------------------------------------
-- 2001:db8::ff00:42:8329 2001:0db8:0000:0000:0000:ff00:0042:8329
-- ::1                    0000:0000:0000:0000:0000:0000:0000:0001
--
--==============================================================================
function normalize_ipv6_address (
    p_ip_address in varchar2 )
    return wwv_flow_global.vc_arr2;

--==============================================================================
-- Checks if page access is for an app ID that is in an "allow list"
-- (instance parameter RESTRICT_APPS_HEADER).
--==============================================================================
function restrict_apps_header_check
    return boolean;

--==============================================================================
-- Checks if page access is from an IP address that is in an "allow list".
--
-- PARAMETERS
-- * p_remote_addr       The address to check. Defaults to the REMOTE_ADDR CGI
--                       value.
-- * p_restrict_ip_range The comma separated list of allowed IP ranges.
--                       Defaults to the RESTRICT_IP_RANGE instance parameter.
--
-- used in 4550
--==============================================================================
function ip_check (
    p_remote_addr       in varchar2 default null,
    p_restrict_ip_range in varchar2 default null )
    return boolean;

--==============================================================================
-- Return the client IP address
--
-- If p_remove_proxies is true, the computation is based on g_remote_addr,
-- g_x_forwarded_for and INBOUND_PROXIES. If Apex detects that it is behind a
-- proxy (g_x_forwarded_for exists and is not equal to g_remote_addr), it
-- removes the proxies from g_x_forwarded_for and returns the rightmost
-- remaining address.
--
-- If p_remove_proxies is false, the function returns g_x_forwarded_concatenated
-- with g_remote_addr.
--==============================================================================
function get_client_ip_address (
    p_remove_proxies  in boolean  default true,
    p_x_forwarded_for in varchar2 default wwv_flow_cgi.get_x_forwarded_for,
    p_remote_addr     in varchar2 default wwv_flow_cgi.get_remote_addr )
    return varchar2;

--==============================================================================
-- The DISABLE_ADMIN_LOGIN preference setting
-- can be created and set to YES using the site
-- admin page for environment preferences. If this
-- preference is YES, this function will return true.
--==============================================================================
function disable_admin_login
    return boolean;

--==============================================================================
-- The DISABLE_WORKSPACE_LOGIN preference setting
-- can be created and set to YES using the site
-- admin page for environment preferences. If this
-- preference is YES, this function will return true.
--==============================================================================
function disable_workspace_login
    return boolean;

--==============================================================================
-- The DISABLE_APPS_LOGIN preference setting can be created and set to YES
-- using the site admin page for environment preferences. If this preference
-- is YES or a comma separated list of application ID's and
-- wwv_flow_security.g_flow_id is contained in this list, this function will
-- return true.
--==============================================================================
function disable_apps_login
    return boolean;

--##############################################################################
--#
--# U R L   T A M P E R I N G
--#
--##############################################################################

g_page_protection_enabled     boolean := false;
g_page_protection_level       varchar2(1);
g_direct_branch               boolean := false;
g_application_checksum_salt   raw(255);
g_application_bookmark_cs_fnc wwv_flow_crypto.t_hash_function;
g_accept_old_checksums        boolean := false;

--==============================================================================
-- Reset checksum salt and bookmark hash function for an application.
-- See 4000:517
--==============================================================================
procedure reset_app_checksum_salt (
    p_flow_id  in number,
    p_function in wwv_flow_crypto.t_hash_function );

--==============================================================================
-- compute checksum
--==============================================================================
function url_checksum (
    p_string                     in varchar2,
    p_checksum_level             in t_checksum_protection_level,
    p_bookmark_checksum_function in wwv_flow_crypto.t_hash_function,
    p_checksum_salt              in raw )
    return varchar2;

--==============================================================================
-- return error message code for checksum protection level
--==============================================================================
function get_checksum_error_message (
    p_protection_level in t_checksum_protection_level )
    return varchar2;

--##############################################################################
--
-- P A S S W O R D   C H E C K I N G
--
--##############################################################################

--==============================================================================
procedure strong_password_check(
    p_username                    in  varchar2,
    p_password                    in  varchar2,
    p_old_password                in  varchar2,
    p_workspace_name              in  varchar2,
    p_use_strong_rules            in  boolean,
    p_min_length_err              out boolean,
    p_new_differs_by_err          out boolean,
    p_one_alpha_err               out boolean,
    p_one_numeric_err             out boolean,
    p_one_punctuation_err         out boolean,
    p_one_upper_err               out boolean,
    p_one_lower_err               out boolean,
    p_not_like_username_err       out boolean,
    p_not_like_workspace_name_err out boolean,
    p_not_like_words_err          out boolean,
    p_not_reusable_err            out boolean);

--==============================================================================
-- perform password validation and return a html text that describes the errors
-- or null if the validation succeeds
--==============================================================================
function strong_password_validation(
    p_username         in varchar2,
    p_password         in varchar2,
    p_old_password     in varchar2 default null,
    p_workspace_name   in varchar2,
    p_use_strong_rules in boolean default false)
    return varchar2;

--==============================================================================
-- Authenticate a workspace user
--
-- ARGUMENTS
-- * p_user_name               login user name (a workspace user)
-- * p_password                p_user_name's password
-- * p_company                 workspace where p_user_name authenticates to
-- * p_ignore_password         if true, do not check password. this is used for
--                             when the builder is in single-sign-on mode and
--                             p_user_name is just a shadow account.
-- * p_settings_from_workspace if not null, take workspace security settings (
--                             account expiration, max. login failures) from
--                             there instead of from p_company.
--==============================================================================
function authenticate (
    p_user_name               in varchar2 default null,
    p_password                in varchar2 default null,
    p_company                 in varchar2 default null,
    p_ignore_password         in boolean default false,
    p_settings_from_workspace in number default null )
    return boolean;

--==============================================================================
-- return if the given credentials are valid in the workspace
--==============================================================================
function is_workspace_password_valid (
    p_workspace_id     in number,
    p_username         in varchar2,
    p_password         in varchar2 )
    return boolean;

--##############################################################################
--#
--# TRANSACTION MANAGEMENT
--#
--##############################################################################

--==============================================================================
-- Commit the current transaction.
--==============================================================================
procedure do_commit;

--==============================================================================
-- Roll back the current transaction.
--==============================================================================
procedure do_rollback;

--==============================================================================
-- This procedure needs to be called in autonomous transactions that can be
-- replayed in case of an outage. If Application Continuity is supported, it
-- marks the current transaction as replayable.
--
-- Example:
--   procedure some_transaction is
--       pragma autonomous_transaction;
--   begin
--       wwv_flow_security.mark_transaction_replayable; -- must come first
--
--       wwv_flow_debug.enter('some_transaction');
--
--       update my_table
--          set ...
--        where ... only changes that can be safely re-run a 2nd time ...
--
--       commit;
--   end some_transaction;
--==============================================================================
procedure mark_replayabletrans;

--##############################################################################
--#
--# WALLET
--#
--##############################################################################

--==============================================================================
-- Set the system preferences for the wallet.
-- Used for ssl connections with dbms_ldap and utl_mail.
--==============================================================================
procedure set_wallet (
    p_wallet in t_wallet );

--==============================================================================
-- Get the system preferences for the wallet.
-- Used for ssl connections with dbms_ldap and utl_mail.
--==============================================================================
function get_wallet
    return t_wallet;

--==============================================================================
-- Return the translated flow_id or fall back to g_flow_id
-- used in tab.sql
--==============================================================================
function get_translated_flow_id
    return number;


--==============================================================================
-- Return p_id with the translated flow id in the decimal places
--==============================================================================
function get_translated_id (
    p_id in number )
    return number;

--==============================================================================
-- used in tab.sql
--==============================================================================
function get_flow_id
    return number;

--==============================================================================
--
--==============================================================================
function prep_url(
    p_url       in varchar2
    ) return varchar2;

--==============================================================================
function authorized_url(
    p_url in varchar2 ) return varchar2;

--==============================================================================
-- Set a Resource Manager consumer group for the current database session.
--==============================================================================
procedure set_rm_consumer_group (
    p_consumer_group in varchar2 );

--==============================================================================
-- sets the service level of the current database session
--==============================================================================
procedure set_service_level(
    p_service_level in varchar2 );

--==============================================================================
-- reset the service level of the current database session
--==============================================================================
procedure reset_service_level;

--==============================================================================
-- Returns if the workspace's host_prefix and path_prefix allow access via the
-- URL (i.e. CGI variables).
--==============================================================================
function does_url_match_workspace (
    p_security_group_id in number,
    p_host_prefix       in varchar2,
    p_path_prefix       in varchar2 )
    return boolean;

--==============================================================================
-- Return whether the calling user can set the security group id
--
-- This check is used in public API procedures that set security group id, to
-- ensure that the operation is allowed.
--
-- ARGUMENTS
-- * p_security_group_id the security group id to be set
-- * p_calling_user      the db user for which the check should be performed.
--                       it defaults to coalesce(g_parse_as_schema_override,
--                       g_parse_as_schema, user)
--==============================================================================
function can_set_g_security_group_id (
    p_security_group_id    in number,
    p_calling_user         in varchar2 default null )
    return boolean;

--==============================================================================
-- Set g_security_group_id.
--
-- This
-- - activates the workspace's Resource Manager consumer group if one is
--   assigned
-- - checks the workspace's host_prefix (a comma-separated list) against the
--   HTTP_HOST CGI variable and raises an error if host_prefix is set but no
--   list element matches
--==============================================================================
procedure set_g_security_group_id (
    p_security_group_id    in number  default g_security_group_id,
    p_check_host_prefix    in boolean default true,
    p_check_account_status in boolean default true );

--==============================================================================
-- set security group id if this is allowed for p_calling_user. if it is not
-- allowed and p_raise_error, raise an error
--==============================================================================
procedure set_g_security_group_id (
    p_security_group_id    in number,
    p_calling_user         in varchar2,
    p_raise_error          in boolean );

--==============================================================================
-- Grant Connect Through APEX_REST_PUBLIC_USER for access to RESTful Services
--==============================================================================
procedure grant_restful_connect;

--##############################################################################
--#
--# WORKSPACE UTILITIES
--#
--##############################################################################

--==============================================================================
-- clear internally cached workspace info
--==============================================================================
procedure clear_workspace_cache;

--==============================================================================
-- return workspace settings.
--==============================================================================
function get_workspace (
    p_security_group_id in number )
    return t_workspace;

--==============================================================================
-- return security settings of workspace.
--==============================================================================
function get_workspace_sec_settings (
    p_security_group_id in number default wwv_flow_security.g_security_group_id,
    p_internal          in boolean default false )
    return t_workspace_sec;

--==============================================================================
-- Get group_name||'.' for the current workspace
--==============================================================================
function get_workspace_group_prefix (
    p_security_group_id in number default g_security_group_id )
    return varchar2;

--==============================================================================
-- a workspace's path_prefix needs to be unique and only allows a restricted
-- set of characters. this function sanitizes the given p_path_prefix to make
-- it conform to these criteria. if the sanitized prefix is not unique or null,
-- it gets replaced by a unique number.
--
-- ARGUMENTS
-- * p_path_prefix       input path prefix
-- * p_security_group_id workspace id of the input path prefix
--==============================================================================
function get_sanitized_path_prefix (
    p_path_prefix       in varchar2,
    p_security_group_id in number )
    return varchar2;

--##############################################################################
--#
--# BEGINNING AND ENDING A REQUEST
--#
--##############################################################################


--==============================================================================
-- checks whether APEX is disabled on ADB databases, and end the request
-- with HTTP-403, if not.
--==============================================================================
procedure init_entry_point;

--==============================================================================
-- set trace in db session
--
-- ARGUMENTS
-- * p_trace: If YES or TRACE, enable sql trace. If HPROF, enable hierarchical
--            PL/SQL profiler.
--==============================================================================
procedure set_trace_on (
    p_trace in varchar2 );

--==============================================================================
-- return whether debug is enabled (set via configure_trace_and_debug)
--==============================================================================
function is_debug_enabled
    return boolean;

--==============================================================================
-- return whether remote debug is enabled (set via configure_trace_and_debug)
--==============================================================================
function is_remote_debug_enabled
    return boolean;

--==============================================================================
-- return the sql or hprof trace mode (set via configure_trace_and_debug)
--==============================================================================
function get_trace_mode
    return varchar2;

--==============================================================================
-- at the beginning of a request, configure the sql/hprof and debug mode
--==============================================================================
procedure start_page_request (
    p_app_id                     in number,
    p_security_group_id          in number,
    p_trace                      in varchar2,
    p_debug                      in varchar2,
    p_alert_if_debug_not_allowed in boolean );

--==============================================================================
-- db session init (aka vpd)
--==============================================================================
procedure db_session_init;

--==============================================================================
-- Initialize app specific metadata variables.
--==============================================================================
procedure init_app_metadata (
    p_parse_as_schema             in varchar2,
    p_mle_environment             in varchar2,
    p_db_session_init_code        in varchar2,
    p_db_session_cleanup_code     in varchar2,
    p_page_protection_enabled     in boolean,
    p_application_checksum_salt   in raw,
    p_application_bookmark_cs_fnc in varchar2,
    p_accept_old_checksums        in boolean );

--==============================================================================
-- Implementation of apex_util.set_parsing_schema_for_request.
--==============================================================================
procedure set_parsing_schema_for_request (
    p_schema in varchar2 );

--==============================================================================
-- cleanup code at the end of the top level request procedure
--==============================================================================
procedure teardown;

--==============================================================================
-- exception handling code at the end of the top level request procedure
--==============================================================================
procedure final_exception_handler (
    p_show_error_page in boolean default true );

--==============================================================================
-- cleanup code in show, when the request is FSP_SHOW_POPUPLOV
--==============================================================================
procedure teardown_fsp_show_popuplov;

--==============================================================================
-- Wrapper for dbms_session.clear_identifier
--==============================================================================
procedure clear_identifier;

--==============================================================================
-- Generate the identifier for the given user / session ID
--==============================================================================
function generate_identifier (
    p_user     in varchar2 := wwv_flow.g_user,
    p_instance in number   := wwv_flow_security.g_instance
) return varchar2;

--==============================================================================
-- Wrapper for dbms_session.set_identifier
--==============================================================================
procedure set_identifier (
    p_user     in varchar2 := wwv_flow.g_user,
    p_instance in number   := wwv_flow_security.g_instance
);

--==============================================================================
-- Wrapper for dbms_session.set_identifier for wwv_flow_mail
--==============================================================================
procedure set_mail_identifier (
    p_mail_from    in varchar2,
    p_message_guid in varchar2
);

--==============================================================================
-- Clear dbms_session identifier and dbms_application_info
--==============================================================================
procedure clear_session_info;

--==============================================================================
-- Generate the client info string
--==============================================================================
function generate_client_info (
    p_security_group_id in number   := wwv_flow_security.g_security_group_id,
    p_user              in varchar2 := wwv_flow.g_user
) return varchar2;

--==============================================================================
-- Wrapper for dbms_application_info.set_client_info
--==============================================================================
procedure set_client_info (
    p_security_group_id in number   := wwv_flow_security.g_security_group_id,
    p_user              in varchar2 := wwv_flow.g_user
);

--==============================================================================
-- Wrapper for dbms_application_info.set_module
-- Will set both module and action.
--==============================================================================
procedure set_module (
    p_module in varchar2,
    p_action in varchar2 := ''
);

--==============================================================================
-- Wrapper for dbms_application_info.set_action
--==============================================================================
procedure set_action (p_action in varchar2);

--==============================================================================
-- set info in v$session, via dbms_application_info and
-- dbms_session.set_identifier
--==============================================================================
procedure set_db_session_info;

--==============================================================================
-- Return static list of known restricted schema names. This list is the basis
-- for initializing wwv_flow_restricted_schemas.
--==============================================================================
function predefined_restricted_schemas
    return wwv_flow_t_varchar2;

--==============================================================================
-- Utility function for get_owner_of_calling_code below, extracted for testing.
-- The function returns true when P_OWNER.P_OBJECT_NAME can be used to determine
-- the caller from within APEX.
--==============================================================================
function is_owner_of_calling_code (
    p_owner       in out nocopy varchar2,
    p_object_name in            varchar2 )
    return boolean;

--==============================================================================
-- function to get the owner of the calling PL/SQL function or procedure
-- default to USER if the caller could not be determined (e.g. an anonymous block)
--==============================================================================
function get_owner_of_calling_code
    return varchar2;

--==============================================================================
-- perform initial security checks for show/accept, after the application
-- metadata has been initialized.
--
-- The checks are
-- * app owner is a valid workspace schema
-- * app owner is a valid database schema
-- * FSP_SHOW_POPUPLOV request can be processed
--==============================================================================
procedure check_request_can_be_processed;

--==============================================================================
-- Use wwv_flow.show to initialize the environment, but exits before actually
-- rendering the page. This procedure does not reset global variables, so
-- teardown/final_exception_handler have to be run by the caller.
--
-- ARGUMENTS
-- * p_flow_id               application id
-- * p_flow_step_id          page id
-- * p_instance              session id
-- * p_error_if_unauthorized if true and wwv_flow.show fails to authenticated
--                           the session, raise WWV_FLOW_HELP.UNAUTHORIZED
--==============================================================================
procedure setup_session_via_show (
    p_flow_id               in number,
    p_flow_step_id          in number,
    p_instance              in number,
    p_error_if_unauthorized in boolean default true );

--==============================================================================
-- Close all database links open in the current session
--==============================================================================
procedure close_open_db_links;

--==============================================================================
-- Return the application security setting for "Pass ECID".
--==============================================================================
function can_pass_ecid
    return boolean;

--==============================================================================
-- Return the execution context ID (ECID) for the current request.
--==============================================================================
function get_ecid
    return varchar2;

--==============================================================================
-- Validates the database password using the verify function from the default
-- profile.
-- Parameters:
-- * p_username = Database username/ workspace admin username.
-- * p_password = Database password/ admin password.
--==============================================================================
function password_validation (
    p_username in varchar2,
    p_password in varchar2 )
    return boolean;

--==============================================================================
-- Check whether the email address for a newly created/updated user is valid
-- PL/SQL function internal_rc_get_patterns uses the result_cache clause to
-- avoid the query on each login request
--
-- Parameters:
-- * p_email                 email address
--
-- Example:
--
--   begin
--       if wwv_flow_security.is_valid_provisioning_email (
--              p_email => 'example@example.com' ) then sys.htp.p('YES');
--       else sys.htp.p('NO');
--       end if;
--   end;
--==============================================================================
function is_valid_provisioning_email(
    p_email    in varchar2 )
    return boolean;

--##############################################################################
--#
--# CONTENT SECURITY POLICY
--#
--##############################################################################

--==============================================================================
-- Substitute these values:
-- * #APEX_CSP_NONCE#
-- * #APEX_CSP_NONCE_ATTRIBUTE#
-- * #APEX_CSP_DISPLAY_NONE#
-- * #APEX_CSP_HASHES#
--==============================================================================
procedure do_csp_substitutions (
    p_string in out nocopy varchar2 );

--##############################################################################
--#
--# SERIALIZATION
--#
--##############################################################################

--==============================================================================
-- Request a lock on the given resource (by name).
-- Returns the lock handle: varchar2(128).
-- If p_raise_error = false and lock cannot be obtained, returns null.
--==============================================================================
function request_lock (
    p_lock_name         in varchar2,
    p_lock_mode         in integer default null,  -- default is Exclusive
    p_timeout           in integer default null,  -- default is maxwait
    p_release_on_commit in boolean default false,
    p_raise_error       in boolean default true ) -- raise exception if lock could not be obtained
    return t_lock_handle;

--==============================================================================
-- Release a lock requested earlier.
--==============================================================================
procedure release_lock (
    p_lock_handle in t_lock_handle,
    p_raise_error in boolean := true ); -- raise exception if lock could not be released

--==============================================================================
-- Release a lock requested earlier, given the lock name.
--==============================================================================
procedure release_lock_by_name (
    p_lock_name   in varchar2,
    p_raise_error in boolean := true ); -- raise exception if lock could not be released

end wwv_flow_security;
/
show errors

set define '^'
