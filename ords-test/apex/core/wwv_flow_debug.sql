set define '^' verify off
prompt ...wwv_flow_debug
create or replace package wwv_flow_debug as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2010-2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_debug.sql
--
--    DESCRIPTION
--      Debug logging for code instrumentation
--      Private part of debug API
--
--    MODIFIED (MM/DD/YYYY)
--     mhichwa  01/26/2010 - Created
--
--------------------------------------------------------------------------------

g_max_log_level          wwv_flow_debug_api.t_log_level := wwv_flow_debug_api.c_log_level_app_trace;

--==============================================================================
-- return whether SYSTEM_DEBUG_LEVEL is set to c_log_level_engine_trace.
--
-- this function can be used to conditionally emit security relevant
-- information in some special cases.
--==============================================================================
function is_system_debug_trace_enabled
    return boolean;

--==============================================================================
-- enable
--
-- turn on debug messaging at a integer level between 1 and 9
-- level 1 is most important
-- level 9 is least important
-- setting p_level to 3 would log any message at level 1, 2, or 3.
--
-- wwv_flow.debug uses level 4
--==============================================================================
procedure enable (
    p_level in wwv_flow_debug_api.t_log_level default wwv_flow_debug_api.c_log_level_info);

--==============================================================================
-- Builder mode automatically logs warnings, even when debug is disabled
-- otherwise. This mode gets enabled early on during request processing of a
-- user app, when APEX detects that the builder session cookie exists.
--==============================================================================
procedure enable_builder_mode;

--==============================================================================
-- disable
--
-- turn off debug messaging
--==============================================================================
procedure disable;

--==============================================================================
-- Write all debug logs via dbms_output. If debug is disabled, this call also
-- enables it with log level c_log_level_warn. You have to set a debug level
-- higher than c_log_level_warn for finer grained debug output. The output
-- starts with a configurable prefix, followed by the log level, "|" and the
-- actual debug message.
--
-- ARGUMENTS
-- * p_prefix: Prefix for lines that go to dbms_output, default '# APEX|'.
--
-- EXAMPLE
--   This sqlplus code writes the debug messages for '4', '5', '7' and '8' via
--   dbms_output.
--
--     set serveroutput on size unlimited
--     begin
--       wwv_flow_debug.error('1');
--       wwv_flow_debug.warn('2');
--       wwv_flow_debug.info('3');
--       wwv_flow_debug.enable_dbms_output(p_prefix=>'Debug-');
--       wwv_flow_debug.error('4');
--       wwv_flow_debug.warn('5');
--       wwv_flow_debug.info('6');
--       wwv_flow_debug.enable(p_level=>wwv_flow_debug_api.c_log_level_info);
--       wwv_flow_debug.info('7');
--       wwv_flow_debug.enable_dbms_output;
--       wwv_flow_debug.info('8');
--     end;
--     /
--
--   Output:
--     Debug-ERR|4
--     Debug-WRN|5
--     Debug-INF|7
--     # APEX|INF|8
--
-- SEE ALSO
--   disable_dbms_output, enable, disable
--==============================================================================
procedure enable_dbms_output (
    p_prefix in varchar2 default '# APEX|' );

--==============================================================================
-- Stops writing all debug logs also via dbms_output.
--==============================================================================
procedure disable_dbms_output;

--==============================================================================
-- Log a formatted debug message, general version.
-- See error(), warn(), info(), trace() below for shorter versions.
--
-- EXAMPLE
--   wwv_flow_debug.message('the value of %s + %s equals %s', 3, 5, 'eight');
--
-- ARGUMENTS
-- * p_message:     The debug message. Occurrences of '%s' will
--                  be replaced by p0 to p19, like in
--                  utl_lms.format_message and C's sprintf.
--                  '%%' represents the special character '%'.
--                  Occurrences of '%<n>' will be replaced by p<n>.
-- * p0..p19:       Substitution strings for '%s' placeholders.
-- * p_max_length:  The p<n> values will be truncated to this length
-- * p_level:       The log level for the message, default c_log_level_info
-- * p_force:       If true, this generates a debug message even if the page is
--                  not rendered in debug mode or p_level is greater than the
--                  configured debug messaging (via the URL or via the enable
--                  procedure).
--==============================================================================
procedure message (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p10          in varchar2    default null,
    p11          in varchar2    default null,
    p12          in varchar2    default null,
    p13          in varchar2    default null,
    p14          in varchar2    default null,
    p15          in varchar2    default null,
    p16          in varchar2    default null,
    p17          in varchar2    default null,
    p18          in varchar2    default null,
    p19          in varchar2    default null,
    p_max_length in pls_integer default 1000,
    p_level      in wwv_flow_debug_api.t_log_level default wwv_flow_debug_api.c_log_level_info,
    p_force      in boolean     default false );

--==============================================================================
-- Log message at level c_log_level_error.
--
-- Similar to message() with
-- * p_enabled => true (i.e. always log error)
-- * p_level   => c_log_level_error
--==============================================================================
procedure error (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p_max_length in pls_integer default 1000 );

--==============================================================================
-- Log message at level c_log_level_warn.
--
-- Similar to message() with
-- * p_enabled => (debug mode or builder session exists),
-- * p_level   => c_log_level_warn
--==============================================================================
procedure warn (
    p_message    in varchar2,
    p0           in varchar2    default null,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p_max_length in pls_integer default 1000 );

--==============================================================================
-- Log message at level c_log_level_info
--
-- Similar to message() with p_enabled => false, p_level => c_log_level_info
--==============================================================================
procedure info (
    p_message    in varchar2,
    p0           in varchar2,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p_max_length in pls_integer default 1000 );
--==============================================================================
procedure info (
    p_message    in varchar2 );

--==============================================================================
-- Log message at level c_log_level_engine_trace.
--
-- Similar to message() with p_enabled => false, p_level => c_log_level_engine_trace
--
-- This procedure is reserverd for the engine and should not be called from end
-- user applications.
--==============================================================================
procedure trace (
    p_message    in varchar2,
    p0           in varchar2,
    p1           in varchar2    default null,
    p2           in varchar2    default null,
    p3           in varchar2    default null,
    p4           in varchar2    default null,
    p5           in varchar2    default null,
    p6           in varchar2    default null,
    p7           in varchar2    default null,
    p8           in varchar2    default null,
    p9           in varchar2    default null,
    p_max_length in pls_integer default 1000 );
--==============================================================================
-- Overload for smaller number of arguments.
--==============================================================================
procedure trace (
    p_message    in varchar2 );

--==============================================================================
-- Log message at level c_log_level_engine_enter.
--
-- Use enter() to log the routine name and it's arguments at the beginning of a
-- procedure/function.
--
-- This procedure is reserverd for the engine and should not be called from end
-- user applications.
--
-- Example:
--
--   procedure foo (
--       p_widget_id       in number,
--       p_additional_data in varchar2,
--       p_emp_rec         in emp%rowtype )
--   is
--   begin
--       wwv_flow_debug.enter('foo',
--           'p_widget_id'      , p_widget_id,
--           'p_additional_data', p_additional_data,
--           'p_emp_rec'        , '<an emp>' );
--       ....
--   end foo;
--
-- Arguments:
-- * p_routine_name:     name of the procedure/function
-- * p_namexx/p_valuexx: procuedure/function parameter name and value
-- * p_max_length:   The p_argXX values will be truncated to this length
-- * p_level:           The log level for the message, default c_log_level_engine_enter
--==============================================================================
procedure enter (
    p_routine_name     in varchar2,
    p_name01           in varchar2,
    p_value01          in varchar2,
    p_name02           in varchar2,
    p_value02          in varchar2,
    p_name03           in varchar2,
    p_value03          in varchar2,
    p_name04           in varchar2    default null,
    p_value04          in varchar2    default null,
    p_name05           in varchar2    default null,
    p_value05          in varchar2    default null,
    p_name06           in varchar2    default null,
    p_value06          in varchar2    default null,
    p_name07           in varchar2    default null,
    p_value07          in varchar2    default null,
    p_name08           in varchar2    default null,
    p_value08          in varchar2    default null,
    p_name09           in varchar2    default null,
    p_value09          in varchar2    default null,
    p_name10           in varchar2    default null,
    p_value10          in varchar2    default null,
    p_name11           in varchar2    default null,
    p_value11          in varchar2    default null,
    p_name12           in varchar2    default null,
    p_value12          in varchar2    default null,
    p_name13           in varchar2    default null,
    p_value13          in varchar2    default null,
    p_name14           in varchar2    default null,
    p_value14          in varchar2    default null,
    p_value_max_length in pls_integer default 1000,
    p_level            in wwv_flow_debug_api.t_log_level default wwv_flow_debug_api.c_log_level_engine_enter,
    p_remove_top_stack in boolean     default false );
--==============================================================================
-- Overload for smaller number of arguments.
--==============================================================================
procedure enter (
    p_routine_name     in varchar2,
    p_name01           in varchar2    default null,
    p_value01          in varchar2    default null,
    p_name02           in varchar2    default null,
    p_value02          in varchar2    default null );

--==============================================================================
-- warn that p_name is deprecated 
--==============================================================================
procedure deprecated (
    p_name in varchar2 );



--==============================================================================
-- this logs an instance of wwv_flow_global.vc_arr2. The WWV_FLOW_EXEC packages
-- maintain SQL statements as arrays - this procedure allows to conveniently
-- write them to the debug log. 
--
-- ARGUMENTS
-- * p_array:              the VARCHAR2 array to be logged
-- * p_level:              the log level to use 
-- * p_append_lf           whether to append LF to each array element during
--                         aggregation to a single VARCHAR2
-- * p_individual_lines:   whether to log each array element as an individual 
--                         debug message. Defaults to false, which means that
--                         array elements are aggregated to as less individual
--                         messages as possible.
procedure log_vc_array(
    p_array            in wwv_flow_global.vc_arr2,
    p_level            in wwv_flow_debug_api.t_log_level,
    p_append_lf        in boolean default true,
    p_individual_lines in boolean default false );

--==============================================================================
-- warn that an exception occurred
--
-- this logs sqlerrm and the backtrace at level c_log_level_warn.
--
-- ARGUMENTS
-- * p_context: an optional context to the message, like a procedure name
-- * p_force:   if true, this generates a debug message even if the page is
--              not rendered in debug mode or p_level is greater than the
--              configured debug messaging (via the URL or via the enable
--              procedure).
--
-- EXAMPLE
--     wwv_flow_debug.log_exception('my_procedure');
--
--   creates a log entry
--
--     Logging exception in my_procedure:
--     Sqlerrm: ORA-XXXXX: ...
--     Backtrace: ...
--==============================================================================
procedure log_exception (
    p_context in varchar2 default null,
    p_force   in boolean  default false );

--==============================================================================
-- log_page_session_state
--
-- ARGUMENTS
--    p_page_id: identifies a page within the current applicaiton and workspace
--               context
--    p_enabled: messages will be logged when logging is enabled, setting a
--               value of true will log
--    p_level:   identifies the level of the log message, 1 is most important,
--               9 is least important, integer value
--==============================================================================
procedure log_page_session_state (
    p_page_id in number      default null,
    p_enabled in boolean     default false,
    p_level   in wwv_flow_debug_api.t_log_level default wwv_flow_debug_api.c_log_level_app_trace );

--==============================================================================
-- if debug is enabled, write dbms_output.get_lines into debug
--==============================================================================
procedure log_dbms_output;

--==============================================================================
-- utility function to convert a value to a varchar2
--==============================================================================
function tochar (
    p_value in boolean )
    return varchar2;

--==============================================================================
-- remove_session_messages
--
-- delete from the apex debug message log all data for a given session in your
-- workspace defaults to your current session
--==============================================================================
procedure remove_session_messages(
   p_session in number default null);

procedure remove_debug_by_app (
    p_application_id in number);

procedure remove_debug_by_age (
    p_application_id  in number,
    p_older_than_days in number);

procedure remove_debug_by_view (
    p_application_id  in number,
    p_view_id        in number);

--==============================================================================
-- internal function to return the current call stack
--
-- ARGUMENTS:
-- * p_remove_top:  if true, removes the top entry from the call stack (for
--                  wwv_flow.debug)
-- * p_force_stack: if true, always emits stack. otherwise, only emit stack when
--                  debug level is wwv_flow_debug_api.c_log_level_engine_trace.
--==============================================================================
function get_call_stack (
    p_remove_top  in boolean default false,
    p_force_stack in boolean default false )
    return varchar2;

--==============================================================================
-- internal procedure to write into the debug tables, using an autonomous
-- transaction
--
-- exposed for wwv_flow.debug() and wwv_flow_debug_api, do not call from
-- elsewhere.
--==============================================================================
procedure log_message_internal (
    p_message    in varchar2,
    p_level      in wwv_flow_debug_api.t_log_level,
    p_call_stack in varchar2 );

--==============================================================================
-- configure the package to cache debug messages and write them in bulk. this
-- requires that flush_cache has to be called at the end of request processing.
--
-- this should be run at the beginning of Apex request handling.
--==============================================================================
procedure configure_cache (
    p_enable in boolean default true );

--==============================================================================
-- save cached debug messages in the database.
--
-- this has to be run at the end of Apex request handling.
--==============================================================================
procedure flush_cache;

--==============================================================================
-- See wwv_flow_debug_api.get_page_view_id.
--==============================================================================
function get_page_view_id
    return number;

--==============================================================================
-- See wwv_flow_debug_api.get_last_message_id.
--==============================================================================
function get_last_message_id
    return number;

--==============================================================================
-- return a value for the APEX-Debug header (page view id, level=XXX)
--==============================================================================
function get_debug_header_value
    return varchar2;

--==============================================================================
-- return the current debug value
--==============================================================================
function get_debug_value
    return varchar2;

--==============================================================================
-- DEPRECATED
--==============================================================================
procedure log_message (
    p_message in varchar2    default null,
    p_enabled in boolean     default false,
    p_level   in wwv_flow_debug_api.t_log_level default wwv_flow_debug_api.c_log_level_app_trace );

procedure log_long_message (
    p_message in varchar2    default null,
    p_enabled in boolean     default false,
    p_level   in wwv_flow_debug_api.t_log_level default wwv_flow_debug_api.c_log_level_app_trace );

end wwv_flow_debug;
/
show errors
