set define '^' verify off
prompt ...wwv_flow_automation_api.sql
create or replace package wwv_flow_automation_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
-- The APEX_AUTOMATION package provides automated functionality to your environment.
-- Automations are a sequential set of actions which are triggered by query results.
-- Use automations to monitor data and then perform the appropriate action,
-- such as auto-approving specific requests and sending email alerts.
--------------------------------------------------------------------------------

--==============================================================================
-- This procedure executes an automation.
--
-- Parameters:
-- * p_application_id:    ID of the application which contains the automation.
-- * p_static_id:         Static ID of the automation to execute.
-- * p_run_in_background: if TRUE, synchronization will run in the background,
--                        as a one-time DBMS_SCHEDULER job
--
-- Example:
--
-- This example executes the automation `my_emp_table_automation` in the background.
--
--     begin
--         apex_session.create_session( 100, 1, 'ADMIN' );
--
--         apex_automation.execute(
--             p_static_id          => 'my_emp_table_automation',
--             p_run_in_background  => true );
--     end;
--==============================================================================
procedure execute(
    p_application_id     in number                        default wwv_flow.g_flow_id,
    p_static_id          in varchar2,
    p_run_in_background  in boolean );

--==============================================================================
-- This procedure executes an automation.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation to execute.
-- * p_filters:        Additional filters to apply to the automation query.
-- * p_order_bys:      `ORDER BY` clauses to apply to the automation query.
--
-- Example:
--
-- This example executes the automation `my_emp_table_automation` and applies
-- a filter to the automation query on the `DEPTNO` column (`DEPTNO = 10`).
--
--     declare
--         l_filters apex_exec.t_filters;
--     begin
--         apex_session.create_session( 100, 1, 'ADMIN' );
--         apex_exec.add_filter(
--             p_filters     => l_filters,
--             p_column_name => 'DEPTNO',
--             p_filter_type => apex_exec.c_filter_eq,
--             p_value       => 10 );
--
--         apex_automation.execute(
--             p_static_id => 'my_emp_table_automation',
--             p_filters   => l_filters );
--     end;
--
-- See also:
-- APEX_EXEC
--==============================================================================
procedure execute(
    p_application_id in number                        default wwv_flow.g_flow_id,
    p_static_id      in varchar2,
    p_filters        in wwv_flow_exec_api.t_filters   default wwv_flow_exec_api.c_empty_filters,
    p_order_bys      in wwv_flow_exec_api.t_order_bys default wwv_flow_exec_api.c_empty_order_bys );

--==============================================================================
-- This procedure executes automation actions for a given query context.
-- The columns returned by the query context match those defined in the automation query,
-- especially when columns are referenced as bind variables in the actions code.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation to execute.
-- * p_query_context:  The context to run the actions for the query.
--
-- Example:
--
-- This example executes the actions defined in the automation `my_emp_table_automation`,
-- but uses a different query context.
--
--     declare
--         l_context apex_exec.t_context:
--     begin
--         apex_session.create_session( 100, 1, 'ADMIN' );
--
--         l_context := apex_exec.open_query_context(
--             p_location  => apex_exec.c_location_local_db,
--             p_sql_query => 'select * from emp_copy_table' );
--
--         apex_automation.execute(
--             p_static_id     => 'my_emp_table_automation',
--             p_query_context => l_context );
--     end;
--
-- Also see:
-- APEX_EXEC
--==============================================================================
procedure execute(
    p_application_id in number                        default wwv_flow.g_flow_id,
    p_static_id      in varchar2,
    p_query_context  in wwv_flow_exec_api.t_context );

--==============================================================================
-- This procedure sets the next scheduled execution date of a "polling"
-- automation to now so that the main automation execution job executes
-- the automation as soon as possible.
-- If the automation is currently running, it will not be restarted.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation to execute.
-- * p_next_run_at:    Timestamp of the next automation run.
--
-- Example:
--
-- This example sets the automation `my_emp_table_automation`
-- to execute in the background right now.
--
--     begin
--         apex_session.create_session( 100, 1, 'ADMIN' );
--
--         apex_automation.reschedule(
--             p_static_id => 'my_emp_table_automation' );
--     end;
--==============================================================================
procedure reschedule (
    p_application_id in number                   default wwv_flow.g_flow_id,
    p_static_id      in varchar2,
    p_next_run_at    in timestamp with time zone default systimestamp );

--==============================================================================
-- This function retrieves information about the latest automation run.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation to execute.
--
-- Returns:
-- Timestamp of the last successful automation run.
--
-- Example:
--
-- This example retrieves the timestamp of the last successful run
-- of the `my_emp_table_automation`.
--
--     declare
--         l_last_run_ts timestamp with time zone;
--     begin
--         apex_session.create_session( 100, 1, 'ADMIN' );
--         l_last_run := apex_automation.get_last_run_timestamp(
--                           p_static_id => 'my_emp_table_automation' );
--
--         dbms_output.put_line( 'The automation''s last run was as of: ' || l_last_run );
--     end;
--==============================================================================
function get_last_run_timestamp(
    p_application_id in number   default wwv_flow.g_flow_id,
    p_static_id      in varchar2 )
    return timestamp with time zone;

--==============================================================================
-- This procedure stops the automation from executing automatically.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation to disable.
--
-- Example:
--
-- This example disables the automation `my_emp_table_automation` in application `152`.
--
--     begin
--         apex_automation.disable(
--             p_application_id  => 152,
--             p_static_id       => 'my_emp_table_automation' );
--     end;
--
-- See also:
-- TERMINATE
--==============================================================================
procedure disable(
    p_application_id in number   default wwv_flow.g_flow_id,
    p_static_id      in varchar2 );

--==============================================================================
-- Deprecated: 24.1
-- This functionality remains to support existing applications.
-- New applications should use `APEX_AUTOMATION.TERMINATE` instead.
--
-- This procedure terminates a currently executing automation.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation to terminate.
--
-- Example:
-- This example terminates the currently executing automation `my_emp_table_automation`
-- in application `152`. If the automation is not running, nothing happens.
--
--     begin
--         apex_automation.abort(
--             p_application_id  => 152,
--             p_static_id       => 'my_emp_table_automation' );
--     end;
--
-- See also:
-- DISABLE
-- TERMINATE
--==============================================================================
procedure abort(
    p_application_id in number   default wwv_flow.g_flow_id,
    p_static_id      in varchar2 );

--==============================================================================
-- This procedure returns the name which will be used for the scheduler job
-- when the automation executes.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation.
--
-- Returns:
-- the name of the the scheduler job which will be spawned to execute this
-- automation.
--
-- Example:
--
--     begin
--         dbms_output.put_line(
--             apex_automation.get_scheduler_job_name(
--                 p_application_id  => 152,
--                 p_static_id       => 'my_emp_table_automation' ) );
--     end;
--     ==> APEX$AUTOMATION_2167837869128719
--==============================================================================
function get_scheduler_job_name(
    p_application_id in number   default wwv_flow.g_flow_id,
    p_static_id      in varchar2 )
    return varchar2;

--==============================================================================
-- This procedure determines whether a given automation is currently running.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation.
--
-- Returns:
-- `TRUE`, if the automation is currently running, false otherwise.
--
-- Example:
--
-- This example prints out whether the automation is currently running or not.
--
--     begin
--         if apex_automation.is_running(
--                p_application_id  => 152,
--                p_static_id       => 'my_emp_table_automation' )
--         then
--             dbms_output.put_line( 'The Automation is currently running.' );
--         else
--             dbms_output.put_line( 'The Automation is currently not running.' );
--         end if;
--     end;
--==============================================================================
function is_running(
    p_application_id in number   default wwv_flow.g_flow_id,
    p_static_id      in varchar2 )
    return boolean;

--==============================================================================
-- This procedure enables the automation for normal execution.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation to enable.
--
-- Example:
--
-- This example enables the automation `my_emp_table_automation` in application `152`.
--
--     begin
--         apex_automation.enable(
--             p_application_id => 152,
--             p_static_id      => 'my_emp_table_automation' );
--     end;
--
-- See Also:
-- DISABLE
--==============================================================================
procedure enable(
    p_application_id in number   default wwv_flow.g_flow_id,
    p_static_id      in varchar2 );

--==============================================================================
-- This procedure skips processing of the current row and continues with the next
-- one. Use this procedure in automation action code.
--
-- Parameters:
-- * p_log_message: Message to write to the automation log.
--
-- Example:
--
-- This example skips the rest of processing for the current row (`PRESIDENT` row).
-- The automation uses `select * from emp` as the automation query.
--
--     begin
--         if :ENAME = 'PRESIDENT' THEN
--             apex_automation.skip_current_row( p_log_message => 'PRESIDENT skipped' );
--         else
--             my_logic_package.process_emp(
--                 p_empno => :EMPNO,
--                 p_sal   => :SAL,
--                 p_depto => :DEPTNO );
--         end if;
--     end;
--==============================================================================
procedure skip_current_row(
    p_log_message in varchar2 default null );

--==============================================================================
-- This procedure exits automation processing, including for remaining rows.
-- Use this procedure in automation action code.
--
-- Parameters:
-- * p_log_message: Message to write to the automation log.
--
-- Example:
--
-- This example terminates the automation if a salary higher than `10000` is found.
-- The automation uses `select * from emp` as the automation query.
--
--     begin
--         if :SQL > 10000 THEN
--             apex_automation.exit(
--                 p_log_message => 'Dubious SAL value found. Exit automation.' );
--         else
--             my_logic_package.process_emp(
--                 p_empno => :EMPNO,
--                 p_sal   => :SAL,
--                 p_depto => :DEPTNO );
--         end if;
--     end;
--==============================================================================
procedure exit(
    p_log_message in varchar2 default null );

--==============================================================================
-- This procedure writes a log entry with severity *INFO* and is to be used
-- within automation code.
--
-- Parameters:
-- * p_message: Message to write to the automation log.
--
-- Example:
--
-- This example writes some log information.
-- The automation uses `select * from emp` as the automation query.
--
--     begin
--         apex_automation.log_info(
--             p_message => 'Processed employee with empno: ' || :EMPNO );
--         my_logic_package.process_emp(
--             p_empno => :EMPNO,
--             p_sal   => :SAL,
--             p_depto => :DEPTNO );
--     end;
--==============================================================================
procedure log_info (
    p_message in varchar2 );

--==============================================================================
-- This procedure writes a log entry with severity *ERROR* and is to be used
-- within automation code.
--
-- Parameters:
-- * p_message: Message to write to the automation log.
--
-- Example:
--
-- This example writes some log information.
-- The automation uses `select * from emp` as the automation query.
--
--     begin
--         if :SAL > 10000 then
--             apex_automation.log_error(
--                 p_message => 'High Salary found for empno: ' || :EMPNO );
--         else
--             my_logic_package.process_emp(
--                 p_empno => :EMPNO,
--                 p_sal   => :SAL,
--                 p_depto => :DEPTNO );
--         end if;
--     end;
--==============================================================================
procedure log_error (
    p_message in varchar2 );

--==============================================================================
-- This procedure writes a log entry with severity *WARN* and is to be used
-- within automation code.
--
-- Parameters:
-- * p_message: Message to write to the automation log.
--
-- Example:
--
-- This example writes some log information.
-- The automation uses `select * from emp` as the automation query.
  --
--     begin
--         if :SAL > 10000 then
--             apex_automation.log_warn(
--                 p_message => 'High Salary found for empno: ' || :EMPNO );
--         end if;
--         my_logic_package.process_emp(
--             p_empno => :EMPNO,
--             p_sal   => :SAL,
--             p_depto => :DEPTNO );
--     end;
--==============================================================================
procedure log_warn (
    p_message in varchar2 );

--==============================================================================
-- This function returns the last run of the automation as a TIMESTAMP WITH TIME ZONE type.
-- Use this function within automation action code or the automation query.
--
-- Returns:
-- Timestamp of the previous automation run.
--
-- Example:
--
-- This example automation only selects rows from a table
-- which have the `CREATED_AT` column after the last run of the automation.
--
--     select *
--       from {table}
--      where created_at > apex_automation.get_last_run;
--==============================================================================
function get_last_run
    return timestamp with time zone;

--==============================================================================
-- This procedure terminates a currently executing automation.
--
-- Parameters:
-- * p_application_id: ID of the application which contains the automation.
-- * p_static_id:      Static ID of the automation to terminate.
--
-- Example:
-- This example terminates the currently executing automation `my_emp_table_automation`
-- in application `152`. If the automation is not running, nothing happens.
--
--     begin
--         apex_automation.terminate(
--             p_application_id  => 152,
--             p_static_id       => 'my_emp_table_automation' );
--     end;
--
-- See also:
-- DISABLE
--==============================================================================
procedure terminate(
    p_application_id in number   default wwv_flow.g_flow_id,
    p_static_id      in varchar2 );


end wwv_flow_automation_api;
/
show err

set define '^'

