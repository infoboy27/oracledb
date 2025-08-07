set define '^' verify off
prompt ...wwv_flow_session_api.sql
create or replace package wwv_flow_session_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_session_api.sql - APEX_SESSION
--
--    DESCRIPTION
--      This package enables you to configure Oracle APEX sessions.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--      cneumuel  01/26/2016 - Created
--      cneumuel  09/12/2017 - Added create_session, delete_session, attach, detach (feature #1558)
--      cneumuel  09/15/2017 - In create_session, attach: added p_page_id (feature #1558)
--      cneumuel  10/22/2018 - In create_session: added p_call_post_authentication (feature #2381)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Set debug level for all future requests in a session.
--
-- ARGUMENTS
--   * p_session_id: The session id. The session must belong to the current
--                   workspace or the caller must be able to set the session's
--                   workspace.
--   * p_level:      The debug level. NULL disables debug, 1-9 sets a debug level.
--
-- EXAMPLE
--   Set debug for session 1234 to INFO level.
--
--   apex_session.set_debug (
--       p_session_id => 1234,
--       p_level      => apex_debug.c_log_level_info );
--   commit;
--
-- EXAMPLE
--   Disable debug in session 1234.
--
--     apex_session.set_debug (
--         p_session_id => 1234,
--         p_level      => null );
--     commit;
--
-- SEE ALSO
--   apex_debug.enable, apex_debug.disable
--==============================================================================
procedure set_debug (
    p_session_id in number default wwv_flow.g_instance,
    p_level      in wwv_flow_debug_api.t_log_level );

--==============================================================================
-- Set tenant_id for the current session.
--
-- ARGUMENTS
--   * p_tenant_id:                   The tenant id.
--
--
-- RAISES
--   * PE.DISPLAY_GROUP.SESSION_NOT_VALID: The session doesn't exist.
--   * WWV_FLOW_SESSION_API.TENANT_ID_EXISTS: The tenant ID has already been set.
--
-- EXAMPLE
--   Set the tenant id for the current session.
--
--     begin
--         apex_session.set_tenant_id (
--             p_tenant_id   => 10);
--
--     end;
--
--==============================================================================
procedure set_tenant_id (
    p_tenant_id     in varchar2 );

--==============================================================================
-- Set trace mode in all future requests of a session.
--
-- ARGUMENTS
--   * p_session_id: The session id. The session must belong to the current
--                   workspace or the caller must be able to set the session's
--                   workspace.
--   * p_trace:      The trace mode. NULL disables trace, SQL enables SQL trace.
--
-- EXAMPLE
--   Enable trace in requests for session 1234.
--
--   apex_session.set_trace (
--       p_session_id => 1234,
--       p_mode       => 'SQL' );
--   commit;
--
-- EXAMPLE
--   Disable trace in requests for session 1234.
--
--     apex_session.set_trace (
--         p_session_id => 1234,
--         p_mode       => null );
--     commit;
--==============================================================================
procedure set_trace (
    p_session_id in number default wwv_flow.g_instance,
    p_mode       in varchar2 );

--==============================================================================
-- Create a new session for the given application, set environment and run the
-- application's Initialization PL/SQL Code.
--
-- ARGUMENTS
--   * p_app_id:                   The application id.
--   * p_page_id:                  The application page.
--   * p_username:                 The session user.
--   * p_call_post_authentication: If true, call post-authentication procedure.
--                                 The default is false.
--
-- RAISES
--   * WWV_FLOW.APP_NOT_FOUND_ERR: The application does not exist or the caller
--     has no access to the workspace.
--
-- EXAMPLE
--   Create a session for EXAMPLE USER in application 100 page 1, then print the
--   app id and session id.
--
--     begin
--         apex_session.create_session (
--             p_app_id   => 100,
--             p_page_id  => 1,
--             p_username => 'EXAMPLE USER' );
--         sys.dbms_output.put_line (
--             'App is '||v('APP_ID)||', session is '||v('APP_SESSION'));
--     end;
--
-- SEE ALSO
--   delete_session, attach, detach
--==============================================================================
procedure create_session (
    p_app_id                   in number,
    p_page_id                  in number,
    p_username                 in varchar2,
    p_call_post_authentication in boolean default false );

--==============================================================================
-- Delete the session with the given ID. If the session is currently attached,
-- call the application's Cleanup PL/SQL Code and reset the environment.
--
-- ARGUMENTS
--   * p_session_id: The session id.
--
-- RAISES
--   * APEX.SESSION.EXPIRED: The session does not exist.
--   * SECURITY_GROUP_ID_INVALID: Current workspace does not match session
--     workspace.
--
-- EXAMPLE
--   Delete session 12345678.
--
--     begin
--         apex_session.delete_session (
--             p_session_id => 12345678 );
--     end;
--
-- SEE ALSO
--   create_session, attach, detach
--==============================================================================
procedure delete_session (
    p_session_id in number default wwv_flow.g_instance );

--==============================================================================
-- Based on the given application and session current, set environment and run
-- the Initialization PL/SQL Code.
--
-- ARGUMENTS
--   * p_app_id:     The application id.
--   * p_page_id:    The application page.
--   * p_session_id: The session id.
--
-- RAISES
--   * WWV_FLOW.APP_NOT_FOUND_ERR: Application does not exist or caller has no
--     access to the workspace.
--   * APEX.SESSION.EXPIRED: The session does not exist.
--   * SECURITY_GROUP_ID_INVALID: Current workspace does not match session
--     workspace.
--
-- EXAMPLE
--   Attach to session 12345678 for application 100 page 1, then print the app
--   id and session id.
--
--     begin
--         apex_session.attach (
--             p_app_id     => 100,
--             p_page_id    => 1,
--             p_session_id => 12345678 );
--         sys.dbms_output.put_line (
--             'App is '||v('APP_ID)||', session is '||v('APP_SESSION'));
--     end;
--
-- SEE ALSO
--   create_session, delete_session, detach
--==============================================================================
procedure attach (
    p_app_id     in number,
    p_page_id    in number,
    p_session_id in number );

--==============================================================================
-- Detach from the current session, reset the environment and run the
-- application's Cleanup PL/SQL Code.
--
-- This procedure does nothing if no session is attached.
--
-- EXAMPLE
--   Detach from the current session.
--
--     begin
--         apex_session.detach;
--     end;
--
-- SEE ALSO
--   create_session, delete_session, attach
--==============================================================================
procedure detach;

--==============================================================================
-- Emit the current session's timeout information to the buffer.
--
-- ARGUMENTS
--   * p_app_id:     The application id.
--   * p_session_id: The session id.
--   * p_reset_idle: Determines if idle time should be reset with the call
--
-- Emits a JSON object in the following format:
-- {
--    idle_time_ms:     17,     // time left in ms before the idle timeout
--    life_time_ms:     270,    // time left in ms before the max timeout
--    max_idle_time_ms: 28000   // defined max idle time in ms
-- }
--
-- EXAMPLE
--   Emits timeout information for app ID and session 12345678, also resetting
--   the idle time.
--
--     begin
--         apex_session.emit_timeouts (
--             p_app_id     => 100,
--             p_session_id => 12345678,
--             p_reset_idle => 'Y' );
--     end;
--
--==============================================================================
procedure emit_timeouts (
    p_app_id        in number,
    p_session_id    in number,
    p_reset_idle    in varchar2 default 'N' );

end wwv_flow_session_api;
/
show err
