set define '^' verify off
prompt ...wwv_flow_session
create or replace package wwv_flow_session as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2011, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_session.sql
--
--    DESCRIPTION
--      This package is resonsible for session management
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      cneumuel  04/14/2011 - Created
--
--------------------------------------------------------------------------------
--
subtype t_session_record is wwv_flow_sessions$%rowtype;
--
x_session_does_not_exist exception;

subtype t_session_process_point is pls_integer range 1..3;
c_pp_on_new_instance constant t_session_process_point := 1;
c_pp_after_login     constant t_session_process_point := 2;
c_pp_both            constant t_session_process_point := 3;

type t_timeout_urls is record (
    max_idle    wwv_flows.on_max_idle_timeout_url%type,
    max_session wwv_flows.on_max_session_timeout_url%type );

--##############################################################################
--#
--# PER REQUEST INIT/TEARDOWN
--#
--##############################################################################

--==============================================================================
-- Initialize the package with wwv_flow metadata.
--
-- Parameters:
-- * p_session_state_commits: If IMMEDIATE, store any session related changes
--   immediately.
--==============================================================================
procedure init_app_metadata (
    p_session_state_commits in wwv_flows.session_state_commits%type );

--==============================================================================
-- Return whether session state changes should be saved immediately.
--==============================================================================
function immediate_mode
    return boolean;

--==============================================================================
-- Perform pending merge/delete statements to session, session state and user
-- preferences.
--
-- Parameters:
-- * p_commit: If true (the default), commit after making changes. Otherwise,
--   the transaction remains open. Note that a commit only occurs if there
--   actually were some changes to save.
--==============================================================================
procedure flush_changes (
    p_commit in boolean default false );

--==============================================================================
-- Even in immediate mode, APEX knows some changes that will be deferred until a
-- synchronization point has been reached, to optimize bulk operations. For
-- example, wwv_flow_session_state deferrs the saving of pending changes in many
-- cases, like when saving multiple arguments that the browser passed to us.
-- The callers then run flush_on_immediate_mode() to persist all changes.
--
-- This procedure is a no-op when not in immediate mode.
--==============================================================================
procedure flush_on_immediate_mode;

--==============================================================================
-- At the end of request processing, write pending changes and reset caches.
--==============================================================================
procedure teardown;

--==============================================================================
-- Tell the package that there are pending session state changes. Two parameters
-- control when data gets written/committed in the DB. They are only applicable
-- when the app's session state changes mode is IMMEDIATE. When it is
-- END_OF_REQUEST, changes are only written/committed during teardown.
--
-- Parameters:
-- * p_defer_when_immediate: If true (default false), do NOT flush changes when
--   in immediate mode.
-- * p_commit_when_immediate: If true (default false) and changes should be
--   persisted immediately, commit when flushing changes.
--==============================================================================
procedure mark_pending_changes (
    p_defer_when_immediate  in boolean default false,
    p_commit_when_immediate in boolean default false );

--##############################################################################
--#
--# MISC APIS
--#
--##############################################################################

--==============================================================================
-- Set the session cookie name for the current request.
--==============================================================================
procedure set_session_cookie_name (
    p_cookie_name in varchar2 );

--==============================================================================
-- return the cookie name used for builder authentication
--==============================================================================
function get_builder_cookie_name
    return varchar2;
--
--==============================================================================
-- return the session id of the builder session if the user is logged in to
-- the builder with the same workspace
--==============================================================================
function get_builder_session_id
    return number;
--
--==============================================================================
-- return the security group id of builder invoking an extension
--==============================================================================
function get_builder_security_group_id
    return number;
--
--==============================================================================
-- sets the security group id of the workspace invoked by an extension
--==============================================================================
procedure set_builder_security_group_id(
    p_security_group_id number );
--
--==============================================================================
-- session integrity is required to access session information and session
-- state. this function checks whether the session and security group id
-- settings match, logs integrity errors and returns false if any were found.
--==============================================================================
function can_be_used
    return boolean;
--
--==============================================================================
-- raise an error if can_be_used is false
--==============================================================================
procedure check_integrity;

--==============================================================================
function to_int_cookie_value (
    p_pub_cookie_value in varchar2,
    p_cookie_name      in varchar2 )
    return varchar2;

--==============================================================================
function to_pub_cookie_value (
    p_int_cookie_value in varchar2 )
    return varchar2;

--==============================================================================
-- return the current session's cookie_value
--==============================================================================
function get_cookie_value
    return varchar2;
--
--==============================================================================
-- return the current tenant_id
--==============================================================================
function get_tenant_id
    return varchar2;

--==============================================================================
procedure set_tenant_id (
    p_tenant_id in varchar2 );

--
--==============================================================================
-- return the current session by g_instance or an empty record if g_instance is
-- not a valid session id. If p_check_sgid is true then the returned session
-- has to have the current security group id set.
--==============================================================================
function get_current
    return t_session_record;
--
--==============================================================================
-- return the session by reading the cookie or an empty record.
--==============================================================================
function get_by_cookie_name (
    p_cookie_name          in varchar2 )
    return t_session_record;
--
--==============================================================================
-- return the current session's crypto salt. If the session ID of the
-- associated builder session is passed in, the crypto salt of that session
-- is returned.
--==============================================================================
function get_crypto_salt(
    p_session_id in number default null )
    return wwv_flow_sessions$.crypto_salt%type;

--==============================================================================
-- try to establish a valid session and user by comparing the given cookie's
-- values with the current session id. if that fails, compare with the builder
-- cookie's values.
--
-- this is the core of the default session sentry if nothing else is specified
-- in the authentication scheme.
--
-- on success, this sets
--   - wwv_flow.g_instance
--   - wwv_flow_security.g_instance
--   - wwv_flow.g_user
--==============================================================================
function builtin_cookie_sentry (
    p_cookie_name          in varchar2 )
    return boolean;

--==============================================================================
-- set current session's authentication id to p_authentication_id. This is a
-- helper for wwv_flow_authentication.authenticate_and_init_session.
--==============================================================================
procedure set_authentication (
    p_authentication_id in number );

--==============================================================================
-- generate a new unique session id
--==============================================================================
function generate_unique_session_id
    return number;
--
--==============================================================================
-- create a new session
--==============================================================================
procedure create_new (
    p_generate_id             in boolean  default true,
    p_save_new_instance_fired in boolean  default false,
    p_authentication_result   in varchar2 default null,
    p_authentication_id       in number   default null,
    p_tenant_id               in varchar2 default null );

--==============================================================================
-- Create a copy of the given session.
--
-- PARAMETERS
-- * p_session:          The session that should be copied.
-- * p_share_cookie:     If true, keep p_session's cookie value. In
--                       delete_session(), we delete all sessions that
--                       share the same cookie value. If false, generate a
--                       new and distinct cookie value.
-- * p_collections:      If true, clone collections.
-- * p_reports:          If true, clone session-based IRs and IGs.
-- * p_for_subscription: If true, set no timeouts for a session that is used for
--                       IR subscriptions.
--==============================================================================
function clone (
    p_session               in t_session_record,
    p_share_cookie          in boolean default true,
    p_collections           in boolean default true,
    p_reports               in boolean default true,
    p_for_subscription      in boolean default false )
    return t_session_record;

--==============================================================================
-- try to attach to the current session/g_instance, if security group id and
-- user match. initialize session globals, like authorization cache and language
-- flags.
--
-- PARAMETERS
-- * p_clone_session:     if true, duplicate the current session.
-- * p_authentication_id: if not null, the session override for the
--                        authentication scheme.
-- * tenant_id:           if not null, set the session's tenant_id to that
--                        value.
--==============================================================================
procedure create_or_reuse_session (
    p_clone_session     in boolean  default false,
    p_authentication_id in number   default null,
    p_tenant_id         in varchar2 default null );
--
--==============================================================================
-- attach to the session with id p_id. initialize session globals.
--==============================================================================
procedure attach_preliminary (
    p_id in number default wwv_flow.g_instance );
--
--==============================================================================
-- deletes a session.
--
-- The p_skip_cache_and_clones controls whether the PL/SQL cache is maintained
-- and cloned sessions are also deleted - this is useful when a background session
-- (e.g. background page processes) is deleted, because the background execution
-- was forcefully terminated.
--
-- p_skip_cache_and_clones can only be passed as TRUE, when a *different session*
-- then the current session (wwv_flow_security.g_instance) is deleted. If that
-- is not the case, an error is raised.
--
-- Parameters:
-- * p_id:                     ID of the session to be deleted
-- * p_skip_cache_and_clones:  whether to clear the cache and delete cloned
--                             sessions also
--==============================================================================
procedure delete_session (
    p_id                    in number  default wwv_flow_security.g_instance,
    p_skip_cache_and_clones in boolean default false );

--==============================================================================
-- deletes all sessions that were used with the given workspace.
-- This api is used when deleting persistent authentication entries.
--==============================================================================
procedure delete_sessions_by_workspace (
    p_security_group_id in number );

--==============================================================================
-- deletes sessions that were used with the given application. this api is used
-- when deleting an application or persistent authentication entries.
--==============================================================================
procedure delete_sessions_by_app (
    p_application_id    in number,
    p_security_group_id in number );

--==============================================================================
-- deletes sessions that were used by the given user. This api is used
-- when deleting persistent authentication entries.
--==============================================================================
procedure delete_sessions_by_user (
    p_username          in varchar2,
    p_security_group_id in number );

--==============================================================================
-- Handle session dependencies when an Interactive Report subscription gets
-- deleted.
--
-- Parameters:
-- * p_id: The session that was associated with the subscription.
--==============================================================================
procedure on_subscription_deleted (
    p_id in number );

--==============================================================================
-- Handle session dependencies when an Interactive Report subscription gets
-- created with a reference to the given session.
--
-- Parameters:
-- * p_id: The session that is associated with the subscription.
--==============================================================================
procedure on_subscription_created (
    p_id in number );

--==============================================================================
-- creates Real Application Security session
--==============================================================================
procedure create_ras_session;

--==============================================================================
-- saves p_new_username and p_authentication_result into
-- wwv_flow_sessions$ for the current session id.
-- raises x_session_does_not_exist if session record for current g_instance and
-- g_security_group_id does not exit.
--==============================================================================
procedure update_user (
    p_username              in wwv_flow_sessions$.username%type,
    p_workspace_user_id     in wwv_flow_sessions$.workspace_user_id%type default null,
    p_authentication_result in wwv_flow_sessions$.authentication_result%type default wwv_flow_security.auth_normal,
    p_security_group_id     in number default wwv_flow_security.g_security_group_id,
    p_old_security_group_id in number default wwv_flow_security.g_security_group_id );
--
--==============================================================================
-- saves p_new_security_group_id into wwv_flow_sessions$.security_group_id for
-- the current session id. raises x_session_does_not_exist if session record
-- for current g_instance and g_security_group_id does not exit.
--==============================================================================
procedure update_security_group_id (
    p_new_security_group_id in number );
--
--==============================================================================
-- creates a new cookie_value and saves it in the current session.
-- a new cookie_value is required after login, to avoid session fixation problems.
--==============================================================================
function update_cookie_value
    return varchar2;

--==============================================================================
-- find the last session process point that has executed for the current
-- application:
--
--   null                 if no process point has yet been executed
--   c_pp_on_new_instance if ON_NEW_INSTANCE has been executed
--   c_pp_after_login     if AFTER_LOGIN has been executed
--   c_pp_both            if both ON_NEW_INSTANCE and AFTER_LOGIN have been executed
--==============================================================================
function get_executed_process_point
    return t_session_process_point;

--==============================================================================
-- set the last session process point that has executed for the current
-- application
--==============================================================================
procedure set_executed_process_point (
    p_process_point  in t_session_process_point,
    p_application_id in number default wwv_flow_security.g_flow_id );

--==============================================================================
-- set language, time zone and territory in wwv_flow_lang, based on current
-- session
--==============================================================================
procedure init_lang_from_session;

--==============================================================================
-- see apex_util.set_session_lifetime_seconds
--==============================================================================
procedure set_session_lifetime_seconds(
    p_seconds in number );

--==============================================================================
-- see apex_util.set_session_max_idle_seconds
--==============================================================================
procedure set_session_max_idle_seconds(
    p_seconds  in number );

--==============================================================================
-- Time out the given sessions, unless they are subscription sessions.
--
-- Parameters:
-- * p_sessions: Table of sessions.
--==============================================================================
procedure time_out_sessions (
    p_sessions in wwv_flow_t_number );

--==============================================================================
-- raise APEX.SESSION.EXPIRED error
--==============================================================================
procedure raise_expired_error (
    p_home_link in varchar2 default wwv_flow.get_home_link_url );

--==============================================================================
-- Check for session timeout, based on
-- 1. maximum allowed session life
-- 2. maximum allowed session idle time
--==============================================================================
procedure check_session_timeout;

--==============================================================================
function get_screen_reader_mode
      return varchar2;

--==============================================================================
procedure set_screen_reader_mode (
    p_mode in varchar2 );

--==============================================================================
function get_high_contrast_mode
      return varchar2;

--==============================================================================
procedure set_high_contrast_mode (
    p_mode in varchar2 );

--==============================================================================
-- Change time zone in other session
--==============================================================================
procedure set_session_time_zone (
    p_session_id in number,
    p_time_zone  in varchar2 );

--==============================================================================
procedure set_session_time_zone (
    p_time_zone in varchar2 );

--==============================================================================
procedure set_session_territory (
    p_territory in varchar2 );

--==============================================================================
procedure set_session_lang (
    p_lang in varchar2 );

--==============================================================================
function get_session_record (
    p_session_id   in number,
    p_calling_user in varchar2 )
    return t_session_record;

--==============================================================================
-- Update the session's authentication_result column, to indicate that the
-- username is not expired anymore.
--==============================================================================
procedure reset_expired_user_in_session;

--==============================================================================
function get_timeout_urls
    return t_timeout_urls;

--##############################################################################
--#
--# PUBLIC APEX_SESSION APIS
--#
--##############################################################################

--==============================================================================
procedure set_debug (
    p_session_id   in number,
    p_level        in wwv_flow_debug_api.t_log_level,
    p_calling_user in varchar2 );

--==============================================================================
procedure set_trace (
    p_session_id   in number,
    p_mode         in varchar2,
    p_calling_user in varchar2 );

--==============================================================================
procedure create_session (
    p_app_id                   in number,
    p_page_id                  in number,
    p_username                 in varchar2,
    p_call_post_authentication in boolean,
    p_calling_user             in varchar2 );

--==============================================================================
procedure delete_session (
    p_session_id   in number,
    p_calling_user in varchar2 );

--==============================================================================
-- See wwv_flow_session_api.
--
-- ADDITIONAL PARAMETERS
-- * p_builder_context: If called from the builder, pass a string that describe
--                      the context for the call. Attaching to builder sessions
--                      for app workspaces is only allowed for specific
--                      contexts. Default is null (no builder context).
--==============================================================================
procedure attach (
    p_app_id          in number,
    p_page_id         in number,
    p_session_id      in number,
    p_calling_user    in varchar2,
    p_builder_context in varchar2 default null );

--==============================================================================
procedure detach (
    p_calling_user in varchar2 );

--==============================================================================
function get_timeouts
    return varchar2;

--==============================================================================
procedure emit_timeouts (
    p_app_id        in number,
    p_session_id    in number,
    p_reset_idle    in varchar2 default 'N' );


end wwv_flow_session;
/
show err
