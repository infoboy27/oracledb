set define '^' verify off
prompt ...wwv_flow_web_src_sync.sql
create or replace package wwv_flow_web_src_sync as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_web_src_sync.sql
--
--    DESCRIPTION
--      REST Source Synchronizations
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    04/29/2020 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
subtype t_table_ddl_sync_status is pls_integer range 1..5;

--==============================================================================
-- contants
--==============================================================================

c_table_does_not_exist        t_table_ddl_sync_status            := 1;
c_columns_can_be_synced       t_table_ddl_sync_status            := 2;
c_columns_cannot_be_synced    t_table_ddl_sync_status            := 3;
c_table_is_up_to_date         t_table_ddl_sync_status            := 4;
c_no_fetch_rows_operation     t_table_ddl_sync_status            := 5;

c_local_table_sync_step_col   constant wwv_flow_global.t_dbms_id := 'APEX$SYNC_STEP_STATIC_ID';
c_local_table_sync_row_ts_col constant wwv_flow_global.t_dbms_id := 'APEX$ROW_SYNC_TIMESTAMP';

--==============================================================================
-- Globals
--==============================================================================


--==============================================================================
-- returns the currently active "synchronization ID". This is used by
-- wwv_flow_log.log_ws to write the synchronization ID to the Web Service
-- request log. This will allow correlating logged web service requests to
-- logged REST source synchronizations.
--
-- Returns:
-- ID of the current synchronization operation, NULL if no sync is active
--==============================================================================
function get_current_sync_id return number;

--==============================================================================
-- returns the currently active "synchronization run ID". The "Run ID" is the
-- same for all steps of a REST Synchronization.
--
-- Returns:
-- ID of the current synchronization job run, NULL if no sync is active
--==============================================================================
function get_current_sync_run_id return number;

--==============================================================================
-- synchronizes the local table definition with the data profile. If the table
-- does not yet exist, a CREATE TABLE statement will be executed. Table columns
-- will be created for visible data profile columns.
--
-- If the table already exists, a series of ALTER TABLE statements will be
-- executed in order to align the table with the data profile.
--
-- Parameters:
-- * p_web_src_module_id:     REST Source ID
-- * p_drop_unused_columns:   if TRUE, the procedure will also drop columns
--                            which do not exist in the data profile any more
--==============================================================================
procedure execute_sync_table(
    p_web_src_module_id     in wwv_flow_web_src_modules.id%type,
    p_drop_unused_columns   in boolean                           default false );

--==============================================================================
-- generates SQL to synchronize the local table definition with the data profile.
--
-- Parameters:
-- * p_web_src_module_id:     REST Source ID
-- * p_include_drop_columns:  if TRUE, generate ALTER TABLE DROP COLUMN
--                            statements for columns which do not exist in the
--                            data profile any more.
--==============================================================================
function get_sync_table_column_sql(
    p_web_src_module_id     in wwv_flow_web_src_modules.id%type,
    p_include_drop_columns  in boolean                           default false,
    p_generate_api_call     in boolean                           default false )
    return varchar2;

--==============================================================================
-- returns information on whether the local synchronization table is in sync
-- with the data profile.
--
-- Parameters:
-- * p_web_src_module_id:     REST Source ID
--
-- Returns:
-- Instance of t_table_ddl_sync_status
--==============================================================================
function get_table_ddl_sync_status(
    p_web_src_module_id     in wwv_flow_web_src_modules.id%type )
    return t_table_ddl_sync_status;

--==============================================================================
-- executes data synchronization to the local table.
--
-- Parameters:
-- * p_web_src_module_id:        REST Source ID
-- * p_flow_id:                  Application ID
-- * p_security_group_id:        Workspace ID
--
-- * p_is_job:                   Whether this synchronization is running as a scheduled job
--
-- * p_custom_static_id:         "Step" Static ID to report in the synchronization table
-- * p_custom_ext_filter_expr:   External filters to use for this synchronization
-- * p_custom_parameters:        REST Source Parameters to use for this synchronization
--==============================================================================
procedure execute_wsm_data_sync(
    p_web_src_module_id      in wwv_flow_web_src_modules.id%type,
    p_is_job                 in varchar2,
    p_flow_id                in number                         default wwv_flow_security.g_flow_id,
    p_security_group_id      in number                         default wwv_flow_security.g_security_group_id,
    --
    p_custom_static_id       in varchar2                       default null,
    p_custom_ext_filter_expr in varchar2                       default null,
    p_custom_parameters      in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters );

--==============================================================================
-- returns the synchronization job name for a REST Source.
--
-- Parameters:
-- * p_web_src_module_id:     REST Source ID
--
-- Returns:
-- the name of the synchronization job
--==============================================================================
function get_job_name(
    p_web_src_module_id in number )
    return varchar2;

--==============================================================================
-- returns whether a synchronization is running for a REST Source.
--
-- Parameters:
-- * p_web_src_module_id:     REST Source ID
--
-- Returns:
-- TRUE when the synchronization is currently running, FALSE otherwise.
--==============================================================================
function is_synchronization_running(
    p_web_src_module_id in number )
    return boolean;

--==============================================================================
-- fetch the current status of the synchronization scheduler job
--
-- Parameters:
-- * p_web_src_module_id:     REST Source ID
--
-- * p_job_status:            scheduler job status
-- * p_job_start_date:        timestamp when the job was started
--==============================================================================
procedure fetch_scheduler_job_status (
    p_web_src_module_id  in     number,
    p_job_status            out sys.dba_scheduler_jobs.state%type,
    p_job_start_date        out sys.dba_scheduler_jobs.last_start_date%type );

--==============================================================================
-- executes all due data synchronizations
--
-- Parameters:
-- * p_web_src_module_id:     REST source ID. If provided, synchronization
--                            will be executed for this REST Source.
--==============================================================================
procedure execute_due_wsm_data_syncs(
    p_web_src_module_id      in wwv_flow_web_src_modules.id%type default null );

--==============================================================================
-- sets the next execution timestamp for the synchronization job, based on
-- the given calendaring expression.
--
-- Parameters:
-- * p_web_source_module_id:    REST source ID
-- * p_calendaring_expression:  calendaring expression (DBMS_SCHEDULER) to
--                              compute the next execution timestamp
-- * p_set_last_run_timestamp:  whether to set the "last run timestamp" to the
--                              current date or not
-- * p_clear_when_null:         Whether to clear out the "Next Synchronization" date
--                              for a NULL expression.
-- * p_security_group_id:       Workspace ID
--==============================================================================
procedure set_web_src_sync_timestamps(
    p_web_source_module_id    in number,
    p_calendaring_expression  in varchar2,
    p_set_last_run_timestamp  in boolean,
    p_clear_when_null         in boolean default false,
    p_security_group_id       in number  default wwv_flow_security.g_security_group_id );

--==============================================================================
-- gets information about the latest synchronization
--
-- Parameters:
-- * p_web_src_module_id:     REST Source ID
-- * p_status:                if provided, return details about the last sync with this status.
--
-- * p_status:                status of the last sync operation
-- * p_last_timestamp:        timestamp of the last sync operation
--==============================================================================
procedure get_last_sync_status(
    p_web_src_module_id    in            wwv_flow_web_src_modules.id%type,
    --
    p_status               in out nocopy varchar2,
    p_last_timestamp          out        timestamp with time zone );

--==============================================================================
-- gets the name of the local synchronization table
--
-- Parameters:
-- * p_web_source_module_id:  REST Source ID
--
-- Returns:
-- the name of the local synchronization table
--==============================================================================
function get_sync_table_name(
    p_web_source_module_id in number )
    return varchar2;

--==============================================================================
-- gets the name of the local synchronization table
--
-- Parameters:
-- * p_web_source_module_id:  REST Source ID
--
-- Returns:
-- the IDs of the array column being synchronized, currently only one.
--==============================================================================
function get_sync_array_columns(
    p_web_source_module_id in number )
    return wwv_flow_t_number;

--==============================================================================
-- determines whether a synchronization exists for the given REST Source
-- and array column ID, and returns 'Y' or 'N'. This function is used in
-- SQL queries (dev_views.sql) and must thus return a VARCHAR2.
--
-- Parameters:
-- * p_web_source_module_id:  REST Source ID
-- * p_array_column_id:       Array Column ID
--
-- Returns:
-- 'Y' of a sync is configured, 'N' otherwise.
--==============================================================================
function sync_exists_for_array_column(
    p_web_source_module_id in number,
    p_array_column_id      in number )
    return varchar2;

--==============================================================================
-- Sets the next scheduled execution timestamp for a synchronization
--
-- Parameters:
-- * p_web_source_module_id:  REST Source ID
-- * p_next_run_at:           Timestamp to execute the next synchronization
--==============================================================================
procedure reschedule(
    p_web_source_module_id   in number,
    p_next_run_at            in timestamp with time zone );

--==============================================================================
-- Sets the next scheduled execution timestamp for a synchronization
--
-- Parameters:
-- * p_web_source_module_id:  REST source ID
-- * p_enabled:               TRUE to enable synchronization, FALSE to disable
--==============================================================================
procedure set_enabled(
    p_web_source_module_id   in number,
    p_enabled                in boolean );

--==============================================================================
-- terminates a scheduled or running synchronization job
--
-- PARAMETERS:
-- * p_application_id      application ID
-- * p_web_src_module_id   web source module ID
--==============================================================================
procedure terminate_sync_job(
    p_application_id         in number,
    p_web_src_module_id      in number );

end wwv_flow_web_src_sync;
/
show err

set define '^'

