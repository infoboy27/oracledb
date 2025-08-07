set define '^' verify off
prompt ...wwv_flow_debug_api
create or replace package wwv_flow_debug_api as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2010 - 2022. All Rights Reserved.
--
-- The APEX_DEBUG package provides utility functions for managing the debug
-- message log. Specifically, this package provides the necessary APIs to instrument
-- and debug PL/SQL code contained within your Oracle APEX application
-- as well as PL/SQL code in database stored procedures and functions.
-- Instrumenting your PL/SQL code makes it much easier to track down bugs and
-- isolate unexpected behavior more quickly.
--
-- The package also provides the means to enable and disable debugging at different
-- debug levels and utility procedures to clean up the message log.
--
-- You can view the message log either as described in the "Accessing Debugging Mode"
-- section of the *Oracle APEX App Builder User's Guide* or by querying
-- the APEX_DEBUG_MESSAGES view.
--------------------------------------------------------------------------------

subtype t_log_level is pls_integer;

--------------------------------------------------------------------------------
-- Constants
--
-- The following constants are used by this package.
--------------------------------------------------------------------------------

-- critical error
c_log_level_error constant t_log_level := 1;
-- less critical error
c_log_level_warn constant t_log_level := 2;
-- default level if debugging is enabled (for example, used by APEX_APPLICATION.DEBUG)
c_log_level_info constant t_log_level := 4;
-- application: messages when procedures/functions are entered
c_log_level_app_enter constant t_log_level := 5;
-- application: other messages within procedures/functions
c_log_level_app_trace constant t_log_level := 6;
-- Oracle APEX engine: messages when procedures/functions are entered
c_log_level_engine_enter constant t_log_level := 8;
-- Oracle APEX engine: other messages within procedures/functions
c_log_level_engine_trace constant t_log_level := 9;

--##############################################################################
--
-- Configuring Debug Mode
--
--##############################################################################

--==============================================================================
-- This procedure turns on debug messaging. You can specify, by level of importance,
-- the types of debug messages that are monitored.
--
-- Note:
-- You only need to call ENABLE procedure once per page view or page accept.
--
-- Parameters:
-- * p_level: Level or levels of messages to log. Must be an integer from 1 to 9,
--            where level 1 is the most important messages and level 4
--            (the default) is the least important. Setting to a specific level logs
--            messages both at that level and below that level. For example,
--            setting P_LEVEL to 2 logs any message at level 1 and 2.
--
-- Example:
--
-- This examples shows how to enable logging of messages for levels 1, 2 and 4.
-- Messages at higher levels are not logged.
--
--   begin
--       apex_debug.enable( apex_debug.c_log_level_info );
--   end;
--==============================================================================
procedure enable (
    p_level in t_log_level default c_log_level_info );
--
--==============================================================================
-- This procedure turns off debug messaging.
--
-- See Also: ENABLE
--
-- Example:
--
-- This example shows how you can turn off debug messaging.
--
--   begin
--       apex_debug.disable;
--   end;
--==============================================================================
procedure disable;

--==============================================================================
-- This procedure writes all debug logs via DBMS_OUTPUT. If debug is disabled,
-- this call also enables it with log level C_LOG_LEVEL_WARN. You have to set
-- a debug level higher than C_LOG_LEVEL_WARN for finer grained debug output.
-- The output 95 starts with a configurable prefix, followed by the log level, `|`
-- and the actual debug message.
--
-- Parameters:
-- * p_prefix: Prefix for lines that go to dbms_output, default `# APEX|`.
--
-- See Also:
-- - DISALBE_DBMS_OUTPUT
-- - ENABLE
-- - DISABLE
--
-- Example:
--
-- This sqlplus code writes the debug messages for 4, 5, 7, and 8 via DBMS_OUTPUT.
--
--   set serveroutput on size unlimited
--   begin
--       apex_debug.error('1');
--       apex_debug.warn('2');
--       apex_debug.enable_dbms_output(p_prefix=> 'Debug-');
--       apex_debug.error('4');
--       apex_debug.warn('5');
--       apex_debug.info('6');
--       apex_debug.enable(p_level => apex_debug.c_log_level_info);
--       apex_debug.info('7');
--       apex_debug.enable_dbms_output;
--       apex_debug.info('8');
--       apex_debug.disable_dbms_output;
--       apex_debug.info('9');
--   end;
--   /
--   Output:
--    Debug-ERR|4
--    Debug-WRN|5
--    Debug-INF|7
--    # APEX|INF|8
--==============================================================================
procedure enable_dbms_output (
    p_prefix in varchar2 default '# APEX|' );
--
--==============================================================================
-- This procedure stops writing all debug logs also via DBMS_OUTPUT.
--
-- See Also:
-- - ENABLE_DBMS_OUTPUT
-- - ENABLE
-- - DISABLE
--
-- Example:
--
-- See ENABLE_DBMS_OUTPUT.
--==============================================================================
procedure disable_dbms_output;
--
--==============================================================================
-- Deprecated:
--
-- See Also:
-- Use ENABLE instead.
--==============================================================================
procedure enable_debug_messages (
    p_level in t_log_level default c_log_level_info );
--
--==============================================================================
-- Deprecated:
--
-- See Also:
-- Use DISABLE instead.
--==============================================================================
procedure disable_debug_messages;
--
--
--##############################################################################
--
-- Logging Debug Messages
--
--##############################################################################
--
--==============================================================================
-- This procedure logs a formatted debug message, general version.
--
-- Parameters:
-- * p_message:      The debug message. Occurrences of `%s` is replaced by P0 to P19,
--                   as in UTL_LMS.FORMAT_MESSAGE and C's sprintf.
--                   Occurrences of `%%` represent the special character `%`.
--                   Occurrences of `%<n>` are replaced by `p<n>`.
-- * p0 through p19: Substitution strings for `%s` placeholders.
-- * p_max_length:   The `p<n>` values is truncated to this length.
-- * p_level:        The log level for the message, default is C_LOG_LEVEL_INFO.
--                   See C_LOG_LEVEL_* constants.
-- * p_force:        If TRUE, this generates a debug message even if the page is not
--                   rendered in debug mode or p_level is greater than the configured
--                   debug messaging (using the URL or using the ENABLE procedure).
--
-- Example:
--
-- This example shows how to use the APEX_DEBUG.MESSAGE procedure to add
-- text to the debug log.
--
--   begin
--       apex_debug.message('the value of %s + %s equals %s', 3, 5, 'eight');
--   end;
--
-- See Also:
-- - ERROR
-- - WARN
-- - TRACE
-- - INFO
-- - ENTER
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
    p_level      in t_log_level default c_log_level_info,
    p_force      in boolean     default false );
--
--==============================================================================
-- This procedure logs messages at level C_LOG_LEVEL_ERROR. This procedure always
-- logs, even if debug mode is turned off.
--
-- Parameters:
-- * p_message:     The debug message. Occurrences of `%s` are replaced by P0 to P19,
--                  as in UTL_LMS.FORMAT_MESSAGE and C's sprintf.
--                  Occurrences of `%%` represent the special character `%`.
--                  Occurrences of `%<n>` are replaced by `p<n>`.
-- * p0 through p9: Substitution strings for `%s` placeholders.
-- * p_max_length:  The `p<n>` values are truncated to this length.
--
-- Example:
--
-- This example shows how to use APEX_ERROR to log a critical error in the debug log.
--
--   begin
--       apex_debug.error('Critical error %s', sqlerrm);
--   end;
--
-- See Also:
-- - ERROR
-- - WARN
-- - TRACE
-- - INFO
-- - ENTER
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
--
--==============================================================================
-- This procedure logs messages at level C_LOG_LEVEL_WARN.
--
-- Parameters:
-- * p_message:     The debug message. Occurrences of `%s` are replaced by P0 to P19,
--                  as in UTL_LMS.FORMAT_MESSAGE and C's sprintf.
--                  Occurrences of `%%` represent the special character `%`.
--                  Occurrences of `%<n>` are replaced by `p<n>`.
-- * p0 through p9: Substitution strings for `%s` placeholders.
-- * p_max_length:  The `p<n>` values are truncated to this length.
--
-- Example:
--
-- This example shows how to use APEX_DEBUG.WARN to log highly important data
-- in the debug log.
--
--   begin
--       apex_debug.warn('Soft constraint %s violated: %s', 4711, sqlerrm);
--   end;
--
-- See Also:
--  - MESSAGE
--  - ERROR
--  - ENTER
--  - TRACE
--  - INFO
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
--
--==============================================================================
-- This procedure logs messages at level C_LOG_LEVEL_INFO.
--
-- Parameters:
-- * p_message:     The debug message. Occurrences of `%s` are replaced by P0 to P19,
--                  as in UTL_LMS.FORMAT_MESSAGE and C's sprintf.
--                  Occurrences of `%%` represent the special character `%`.
--                  Occurrences of `%<n>` are replaced by `p<n>`.
-- * p0 through p9: Substitution strings for `%s` placeholders.
-- * p_max_length:  The `p<n>` values are truncated to this length.
--
-- Example:
--
-- This example shows how to use APEX_DEBUG.INFO to log information in the debug log.
--
--   begin
--       apex_debug.info('Important: %s', 'fnord');
--   end;
--
-- See Also:
--  - MESSAGE
--  - ERROR
--  - ENTER
--  - TRACE
--  - INFO
--==============================================================================
--
procedure info (
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
--
--==============================================================================
-- This procedure logs messages at level C_LOG_LEVEL_APP_TRACE.
--
-- Paramters:
-- * p_message:     The debug message. Occurrences of `%s` are replaced by P0 to P19,
--                  as in UTL_LMS.FORMAT_MESSAGE and C's sprintf.
--                  Occurrences of `%%` represent the special character `%`.
--                  Occurrences of `%<n>` are replaced by `p<n>`.
-- * p0 through p9: Substitution strings for `%s` placeholders.
-- * p_max_length:  The `p<n>` values are truncated to this length.
--
-- Example:
--
-- This example shows how to use APEX_DEBUG.TRACE to log low-level debug
-- information in the debug log.
--
--   begin
--       apex_debug.trace('Low-level information: %s+%s=%s', 1, 2, 3);
--   end;
--
-- See Also:
--  - MESSAGE
--  - ERROR
--  - WARN
--  - ENTER
--  - INFO
--==============================================================================
procedure trace (
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
--
--==============================================================================
-- This procedure logs messages at level C_LOG_LEVEL_APP_ENTER. Use ENTER to log
-- the routine name and it's arguments at the beginning of a procedure or function.
--
-- Parameters:
-- * p_routine_name:     The name of the procedure or function.
-- * p_namexx/p_valuexx: The procedure or function parameter name and value.
-- * p_value_max_length: The `p_valuexx` values is truncated to this length.
--
-- Example:
--
-- This example shows how to use APEX_ENTER to add a debug message at the
-- beginning of a procedure.
--
--   procedure foo (
--       p_widget_id       in number,
--       p_additional_data in varchar2,
--       p_emp_rec         in emp%rowtype )
--   is
--   begin
--       apex_debug.enter('foo',
--           'p_widget_id',       p_widget_id,
--           'p_additional_data', p_additional_data,
--           'p_emp_rec.id',      p_emp_rec.id );
--       ....do something....
--   end foo;
--
-- See Also:
--  - MESSAGE
--  - ERROR
--  - WARN
--  - ENTER
--  - INFO
--==============================================================================
procedure enter (
    p_routine_name     in varchar2,
    p_name01           in varchar2    default null,
    p_value01          in varchar2    default null,
    p_name02           in varchar2    default null,
    p_value02          in varchar2    default null,
    p_name03           in varchar2    default null,
    p_value03          in varchar2    default null,
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
    p_value_max_length in pls_integer default 1000 );
--
--==============================================================================
-- This procedure logs the session's item values.
--
-- Parameters:
-- * p_page_id: Identifies a page within the current applicaton and workspace
--              context.
-- * p_enabled: Messages are logged when logging is enabled, setting a value of
--              TRUE enables logging.
-- * p_level:   Identifies the level of the log message where 1 is most important,
--              9 is least important. Must be an integer value.
--
-- Example:
--
-- This example shows how to enable debug message logging for C_LOG_LEVEL_ERROR and
-- C_LOG_LEVEL_WARN level messages and display a level C_LOG_LEVEL_ERROR message
-- containing all the session state for the application's current page.
-- Note, the P_ENABLED parameter need not be specified, as debugging has been
-- explicitly enabled and the default of FALSE for this parameter respects this
-- enabling. Also note the P_PAGE_ID has not been specified, as this example just
-- shows session state information for the application's current page.
--
--   begin
--       apex_debug.enable (p_level => apex_debug.c_log_level_warn);
--       apex_debug.log_page_session_state (p_level => apex_debug.c_log_level_error);
--   end;
--==============================================================================
procedure log_page_session_state (
    p_page_id in number      default null,
    p_enabled in boolean     default false,
    p_level   in t_log_level default c_log_level_app_trace );
--
--==============================================================================
-- This procedure writes the contents of DBMS_OUTPUT.GET_LINES to the debug log.
-- Messages of legacy applications which use DBMS_OUTPUT are copied  into the debug log.
-- In order to write to the debug log, DBMS_OUTPUT.ENABLE must be performed.
--
-- Example:
--
--   begin
--       sys.dbms_output.enable;
--       sys.dbms_output.put_line('some data');
--       sys.dbms_output.put_line('other data');
--       apex_debug.log_dbms_output;
--   end;
--
-- See Also:
-- - MESSAGE
-- - ERROR
-- - WARN
-- - TRACE
-- - INFO
--==============================================================================
procedure log_dbms_output;
--
--==============================================================================
-- This procedure logs a debug message.
--
-- Deprecated:
--
-- Parameters:
-- * p_message: The debug message with a maximum length of 1000 bytes.
-- * p_enabled: Messages are logged when logging is enabled, setting a
--              value of TRUE enables logging.
-- * p_level:   Identifies the level of the log message where 1 is most important
--              and 9 is least important. This is an integer value.
--
-- See Also:
-- Use one of the following procedures instead.
-- - MESSAGE
-- - ERROR
-- - WARN
-- - TRACE
-- - INFO
--==============================================================================
procedure log_message (
    p_message in varchar2    default null,
    p_enabled in boolean     default false,
    p_level   in t_log_level default c_log_level_app_trace );
--
--==============================================================================
-- Use this procedure to emit debug messages from PLSQL components of Application
-- Express, or PLSQL procedures and functions. This procedure is the same
-- as LOG_MESSAGE, except it allows logging of much longer messages, which are
-- subsequently split into 4,000 character chunks in the debugging output
-- (because a single debug message is constrained to 4,000 characters).
--
-- Note: Instead of this procedure, use ERROR, WARN, MESSAGE, INFO, ENTER or TRACE.
--
-- Parameters:
-- * p_message: Log long message with maximum size of 32767 bytes.
-- * p_enabled: Set to TRUE to always log messages, irrespective of whether
--              debugging is enabled. Set to FALSE to only log messages if
--              debugging is enabled.
-- * p_level:   Identifies the level of the long log message. See "Constants."
--
-- Example:
--
-- This example shows how to enable debug message logging for 1 and 2 level messages
-- and display a level 1 message that could contain anything up to 32767 characters.
-- Note, the p_enabled parameter need not be specified, as debugging has been explicitly
-- enabled and the default of FALSE for this parameter respects this enabling.
--
--   declare
--       l_msg varchar2(32767) := 'Debug outputs anything up to varchar2 limit';
--   begin
--       apex_debug.enable (p_level => 2);
--
--       apex_debug.log_long_message(
--           p_message => l_msg,
--           p_level   => 1 );
--   end;
--
-- See Also:
-- - MESSAGE
-- - ERROR
-- - WARN
-- - TRACE
-- - INFO
--==============================================================================
procedure log_long_message (
    p_message in varchar2    default null,
    p_enabled in boolean     default false,
    p_level   in t_log_level default c_log_level_app_trace );
--
--
--##############################################################################
--
-- Utilities
--
--##############################################################################
--
--
--==============================================================================
-- This function converts a BOOLEAN to a VARCHAR2.
--
-- Parameters:
-- * p_value: A BOOLEAN that is converted to FALSE or TRUE respectively.
--
-- Example:
--
-- This example shows how to use the TOCHAR function to convert BOOLEAN values
-- to VARCHAR2, so they can be passed to the other debug procedures.
--
--   declare
--       l_state boolean;
--   begin
--       ....
--       apex_debug.info('Value of l_state is %s', apex_debug.tochar(l_state));
--       ....
--   end;
--==============================================================================
function tochar (
    p_value in boolean )
    return varchar2;
--
--
--==============================================================================
-- Return the current page view identifier, which is a unique ID for each
-- browser request or standalone database session. The value is null until the
-- first debug message has been generated.
--
-- Example:
--
-- Print the page view identifiers before and after emitting debug output.
--
--   begin
--       sys.dbms_output.put_line('Page View ID='||apex_debug.get_page_view_id);
--       apex_debug.message('Hello', p_force => true);
--       sys.dbms_output.put_line('Page View ID='||apex_debug.get_page_view_id);
--   end;
--==============================================================================
function get_page_view_id
    return number;
--
--
--==============================================================================
-- Return the identifier for the last debug message that was generated in this
-- session. The value is null until the first debug message has been generated.
--
-- Example:
--
-- Print the message identifiers before and after emitting debug output.
--
--   begin
--       sys.dbms_output.put_line('Page View ID='||apex_debug.get_last_message_id);
--       apex_debug.message('Hello', p_force => true);
--       sys.dbms_output.put_line('Page View ID='||apex_debug.get_last_message_id);
--   end;
--==============================================================================
function get_last_message_id
    return number;
--
--
--##############################################################################
--
-- Managing logged Debug Messages
--
--##############################################################################
--
--==============================================================================
-- This procedure deletes from the debug message log all data for a given session in your
-- workspace defaults to your current session.
--
-- Parameters:
-- * p_session: The session ID. Defaults to your current session.
--
-- Example:
--
-- This example demonstrates the removal of all debug messages logged within
-- the current session. Note: As no value is passed for the P_SESSION parameter,
-- the procedure defaults to the current session.
--
--   begin
--       apex_debug.remove_session_message;
--   end;
--==============================================================================
procedure remove_session_messages (
    p_session in number default null );
--
--==============================================================================
-- Use this procedure to delete from the debug message log all data belonging
-- to a specified application.
--
-- Parameters:
-- * p_application_id: The application ID of the application.
--
-- Example:
--
-- This example demonstrates removing all debug messages logged for the
-- current application.
--
--   begin
--       apex_debug.remove_debug_by_app(
--           p_application_id => to_number(:APP_ID) );
--   end;
--==============================================================================
procedure remove_debug_by_app (
    p_application_id in number);
--
--==============================================================================
-- Use this procedure to delete from the debug message log all data older than
-- the specified number of days.
--
-- Paramters:
-- * p_application_id:  The application ID of the application.
-- * p_older_than_days: The number of days data can exist in the debug message
--                      log before it is deleted.
--
-- Example:
--
-- This example demonstrates removing debug messages relating to the current application,
-- that are older than 3 days old.
--
--   begin
--       apex_debug.remove_debug_by_age (
--           p_application_id  => to_number(:APP_ID),
--           p_older_than_days => 3 );
--   end;
--==============================================================================
procedure remove_debug_by_age (
    p_application_id  in number,
    p_older_than_days in number);
--
--==============================================================================
-- Use this procedure to delete all data for a specified view from the message log.
--
-- Parameters:
-- * p_application_id: The application ID of the application.
-- * p_view_id:        The view ID of the view.
--
-- Example:
--
-- This example demonstrates the removal of debug messages within the
-- View Identifier of 12345, belonging to the current application.
--
--   begin
--       apex_debug.remove_debug_by_view (
--           p_application_id => TO_NUMBER(:APP_ID),
--           p_view_id        => 12345 );
--   end;
--==============================================================================
procedure remove_debug_by_view (
    p_application_id in number,
    p_view_id        in number);
--==============================================================================
-- Deprecated:
--
-- See Also: Use REMOVE_DEBUG_BY_AGE instead.
--==============================================================================
procedure remove_debug_by_age (
    p_application_id  in number,
    p_older_then_days in number);

end wwv_flow_debug_api;
/
show errors
