set define '^' verify off
prompt ...wwv_flow_process_bg_api.sql
create or replace package wwv_flow_process_bg_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2023, Oracle and/or its affiliates.
-- 
-- This package enables background process reporting (status and progress) and 
-- the option to forcefully cancel a running process.
--
-- Filename: core/wwv_flow_process_bg_api.sql
--
-- DESCRIPTION
--  Background Execution of Page Processes: public API
--
--
-- Modified: 
-- cczarski    12/01/2022 - Created
--------------------------------------------------------------------------------
--
--==============================================================================
-- Data Types:
--
-- The section describes constants and data types used by the APEX_BACKGROUND_PROCESS 
-- package.
--==============================================================================
--
--------------------------------------------------------------------------------
-- The state of the execution.
--------------------------------------------------------------------------------
subtype t_execution_state is varchar2(9);
-- An execution has been submitted, but the coordinator job did not pick it up
-- for execution yet.
c_status_enqueued    constant t_execution_state := 'ENQUEUED';
-- The coordinator job has picked up the execution and started an executor job
-- using the database scheduler, but the scheduler has not started this job yet.
c_status_scheduled   constant t_execution_state := 'SCHEDULED'; 
c_status_executing   constant t_execution_state := 'EXECUTING'; -- The executor job for this background execution is currently executing.
c_status_success     constant t_execution_state := 'SUCCESS'; -- The execution has been finished successfully.
c_status_failed      constant t_execution_state := 'FAILED'; -- An unhandled error was raised during execution.
c_status_terminated  constant t_execution_state := 'ABORTED'; -- The execution was terminated.
c_status_aborted     constant t_execution_state := 'ABORTED'; -- Deprecated.

--------------------------------------------------------------------------------
-- Record describing the an execution running in the background.
--
-- Attributes:
-- * execution_id:              ID of the execution.
-- * state:                     State of the execution, see `t_execution_state` constants.
-- * current_exec_process_id:   ID of the currently executing child process.
-- * context_value:             Context value passed when the execution was submitted.
-- * last_status_message:       Last status message set by the developer.
-- * sofar:                     Units of work already processed by the page process.
-- * totalwork:                 Total units of work to process by the page process.
--------------------------------------------------------------------------------
type t_execution is record(
    id                        number,
    state                     t_execution_state,
    --
    current_exec_process_id   number,
    --
    context_value             varchar2(4000),
    --
    last_status_message       varchar2(32767),
    sofar                     number,
    totalwork                 number );

--==============================================================================
-- This procedure sets progress of an execution. This procedure must be called from 
-- within PL/SQL code. 
-- Use the `GET_EXECUTION` function to retrieve information.
--
-- Parameters:
-- * p_totalwork:         Total units of work to be processed by the background process.
-- * p_sofar:             Units of work being processed so far.
--
-- Example:
-- The following example demonstrates a PL/SQL page process running in the background 
-- with a known total amount of work to process. Progress is reported to the 
-- Oracle APEX engine as follows.
--
--     begin
--         for i in 1 .. 1000 loop
--             do_something( p_param => i );
--             apex_background_process.set_progress(
--                 p_totalwork   => 1000,
--                 p_sofar       => i );
--         end loop;
--     end;
--
-- Example:
-- The following example demonstrates a PL/SQL page process running in the background 
-- with an unknown total amount work to process. Progress is reported to the APEX engine 
-- as follows.
--
--     declare
--         l_rows_processed pls_integer := 1;
--     begin
--         for i ( select * from emp ) loop
--             do_something( p_param => i.empno );
--    
--             apex_background_process.set_progress(
--                 p_sofar       => l_rows_processed );
--    
--             l_rows_processed := l_rows_processed + 1;
--         end loop;
--     end;
-- 
-- See also:
-- GET_EXECUTION
--
-- Since: 23.1
--==============================================================================
procedure set_progress(
    p_totalwork in number default null,
    p_sofar     in number );

--==============================================================================
-- This procedure sets status for an execution chain. This procedure must be called 
-- from within PL/SQL code.
-- Use the `GET_EXECUTION` function to retrieve status messages.
--
-- Parameters:
-- * p_message:           Current status message for the page chain.
--
-- Example:
-- The following example demonstrates a PL/SQL page process running in the background.
-- After each unit of work, a status message is being reported to the APEX engine.
--
--     declare
--         l_result varchar2(255);
--     begin
--         apex_background_process.set_status( 'Part A: Process Orders' );
--         for i in ( select *
--                      from orders
--                     where status = 'OPEN' )
--         loop
--             l_result := process_order( p_param => i.order_id );
--         end loop;
--    
--         apex_background_process.set_status( 'Part B: Process Bills' );
--         for i in ( select *
--                      from orders
--                     where status = 'DELIVERED' )
--         loop
--             l_result := emit_bill( p_param => i.order_id );
--         end loop;
--     end;
-- 
-- See also:
-- GET_EXECUTION
--
-- Since: 23.1
--==============================================================================
procedure set_status(
    p_message   in varchar2 );

--==============================================================================
-- This function returns the status of the current execution. This function is 
-- called from within the background process to get its own execution ID. If the 
-- function is NOT called from a page process running in the background, 
-- an empty record is returned.
--
-- Returns:
-- `t_execution` record, with status information for the current execution
--
-- Example:
-- The following example retrieves status information of the currently running 
-- background execution.
--
--     declare
--         l_execution apex_background_process.t_execution;
--     begin
--         l_execution := apex_background_process.get_current_execution;
--         sys.dbms_output.put_line( 'Execution ID: ' || l_execution.id );
--     end;
--    
--     => Execution ID: 4711
--
-- Since: 23.1
--==============================================================================
function get_current_execution
    return t_execution;

--==============================================================================
-- This function returns the current status of a specific execution ID.
--
-- Parameters:
-- * p_application_id:    ID of the application containing the process.
-- * p_execution_id:      ID of the execution to get status for.
--
-- Returns:
-- `t_execution` record, with current status information for this execution.
--
-- Example:
-- The following example retrieves status information for execution ID 4711.
--
--     declare
--         l_execution apex_background_process.t_execution;
--     begin
--         l_execution := apex_background_process.get_execution(
--                            p_application_id     => 100,
--                            p_execution_id       => 4711 );
--    
--         sys.dbms_output.put_line( 'Execution State: ' || l_execution.state );
--     end;
--
--     => Execution State: EXECUTING
-- 
-- Since: 23.1
--==============================================================================
function get_execution(
    p_application_id     in number default wwv_flow.g_flow_id,
    p_execution_id       in number )
    return t_execution;

--==============================================================================
-- This procedure terminates all executions of an execution chain. Note that this 
-- procedure cannot be used in SQL Workshop and SQL Commands.
--
-- Parameters:
-- * p_application_id:    ID of the application containing the process.
-- * p_process_id:        ID of the execution chain to terminate executions for.
--
-- Example:
-- The following example terminates all executions for process ID 9023498034890234890.
--
--     begin
--         apex_background_process.terminate(
--             p_application_id => 100,
--             p_process_id     => 9023498034890234890 );
--     end;
--
-- Since: 23.1
--==============================================================================
procedure terminate(
    p_application_id     in number default wwv_flow.g_flow_id,
    p_process_id         in number );

--==============================================================================
-- This procedure terminates a specific execution of an execution chain.
-- Note that this procedure cannot be used in SQL Workshop and SQL Commands.
--
-- Parameters:
-- * p_application_id:    ID of the application containing the process.
-- * p_execution_id:      ID of the execution to terminate.
--
-- Example:
-- The following example terminates background execution 4711.
--
--     begin
--         apex_background_process.terminate(
--             p_application_id => 100,
--             p_execution_id   => 4711 );
--     end;
--
-- Since: 23.1
--==============================================================================
procedure terminate(
    p_application_id     in number default wwv_flow.g_flow_id,
    p_execution_id       in number );

--==============================================================================
-- Deprecated:
--==============================================================================
procedure abort(
    p_application_id     in number default wwv_flow.g_flow_id,
    p_process_id         in number );
--==============================================================================
-- Deprecated:
--==============================================================================
procedure abort(
    p_application_id     in number default wwv_flow.g_flow_id,
    p_execution_id       in number );
--==============================================================================
end wwv_flow_process_bg_api;
/

set define '^'
