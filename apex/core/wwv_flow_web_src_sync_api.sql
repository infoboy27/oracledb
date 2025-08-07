set define '^' verify off
prompt ...wwv_flow_web_src_sync_api.sql
create or replace package wwv_flow_web_src_sync_api authid current_user is
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_web_src_sync_api.sql
--
--    DESCRIPTION
--      Web source Synchronization API
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    04/29/2020 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- contants
--==============================================================================

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- synchronizes the local table definition with the data profile. If the table
-- does not yet exist, a CREATE TABLE statement will be executed. Table columns
-- will be created for visible data profile columns.
--
-- If the table already exists, a series of ALTER TABLE statements will be
-- executed in order to align the table with the data profile.
--
-- Parameters:
-- * p_module_static_id:       static ID to identify the REST Data Source
-- * p_application_id:         (optional) the application ID
-- * p_drop_unused_columns:    if TRUE, the procedure will also drop columns
--                            which do not exist in the data profile any more
-- Example:
-- after the REST Data Source named "rest_movie" has been changed, bring
-- the local synchronization table in sync with the data profile.
--
-- begin
--     apex_session.create_session(
--         p_app_id          => 100,
--         p_page_id         => 1,
--         p_username        => '...' );
--
--     apex_rest_source_sync.synchronize_table_definition(
--         p_module_static_id     => 'rest_movie',
--         p_drop_unused_columns  => true );
-- end;
--==============================================================================
procedure synchronize_table_definition(
    p_module_static_id      in varchar2,
    p_application_id        in number  default wwv_flow.g_flow_id,
    p_drop_unused_columns   in boolean default false );

--==============================================================================
-- generates SQL to synchronize the local table definition with the data profile.
--
-- Parameters:
-- * p_module_static_id:      static ID to identify the REST Data Source
-- * p_application_id:        (optional) the application ID
-- * p_include_drop_columns:  if TRUE, generate ALTER TABLE DROP COLUMN
--                            statements for columns which do not exist in the
--                            data profile any more.
-- Example:
-- after the REST Data Source named "rest_movie" has been changed, generate
-- the SQL statements (ALTER TABLE) to bring the table in sync with the
-- data profile.
--
-- declare
--     l_sql varchar2(32767);
-- begin
--     apex_session.create_session(
--         p_app_id          => 100,
--         p_page_id         => 1,
--         p_username        => '...' );
--
--     l_sql := apex_rest_source_sync.get_sync_table_definition_sql(
--         p_module_static_id      => 'rest_movie',
--         p_include_drop_columns  => true );
-- end;
--==============================================================================
function get_sync_table_definition_sql(
    p_module_static_id      in varchar2,
    p_application_id        in number  default wwv_flow.g_flow_id,
    p_include_drop_columns  in boolean default false )
    return varchar2;

--==============================================================================
-- executes the configured data synchronization to the local table.
-- Requires an APEX session context.
--
-- Parameters:
-- * p_module_static_id:      static ID to identify the REST Data Source
-- * p_application_id:        (optional) the application ID
-- * p_run_in_background:     if TRUE, synchronization will run in the background,
--                            as a one-time DBMS_SCHEDULER job
--
-- Example:
-- perform data synchronization right now, independent of the next
-- scheduled time.
--
-- begin
--     apex_session.create_session(
--         p_app_id          => 100,
--         p_page_id         => 1,
--         p_username        => '...' );
--
--     apex_rest_source_sync.synchronize_data(
--         p_module_static_id      => 'rest_movie',
--         p_run_in_background     => true );
-- end;
--==============================================================================
procedure synchronize_data(
    p_module_static_id      in varchar2,
    p_run_in_background     in boolean default false,
    p_application_id        in number  default wwv_flow.g_flow_id );

--==============================================================================
-- executes a dynamic data synchronization to the local table, based on the
-- provided parameters. The predefined synchronization steps are not executed.
--
-- Parameters:
-- * p_module_static_id:          static ID to identify the REST Data Source
-- * p_application_id:            (optional) the application ID
-- * p_sync_static_id:            static ID for this dynamic synchronization
-- * p_sync_external_filter_expr: external filter expression to use for this synchronization
-- * p_sync_parameters:           REST Data Source parameters to use for this synchronization
--
-- Example:
-- performs a dynamic data synchronization with "Oracle APEX" as the
-- REST Data Source's "query" parameter.
--
-- declare
--     l_parameters apex_exec.t_parameters;
-- begin
--     apex_exec.add_parameter(
--         p_parameters      => l_parameters,
--         p_name            => 'query',
--         p_value           => 'Oracle APEX' );
--
--     apex_session.create_session(
--         p_app_id          => 100,
--         p_page_id         => 1,
--         p_username        => '...' );
--
--     apex_rest_source_sync.dynamic_synchronize_data(
--         p_module_static_id      => 'rest_movie',
--         p_sync_static_id        => 'Sync_Oracle_APEX',
--         p_sync_parameters       => l_parameters );
-- end;
--==============================================================================
procedure dynamic_synchronize_data(
    p_module_static_id          in varchar2,
    --
    p_sync_static_id            in varchar2,
    p_sync_external_filter_expr in varchar2                       default null,
    p_sync_parameters           in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    --
    p_application_id            in number                         default wwv_flow.g_flow_id );

--==============================================================================
-- returns the timestamp of the last successful sync operation
--
-- Parameters:
-- * p_module_static_id:      static ID to identify the REST Data Source
-- * p_application_id:        (optional) the application ID
--
-- Returns:
-- timestamp of the last successful sync operation
--
-- Example:
-- return the last synchronization timestamp of the "rest_movie" REST
-- Data Source
--
-- declare
--     l_last_sync_time timestamp with time zone;
-- begin
--     apex_session.create_session(
--         p_app_id          => 100,
--         p_page_id         => 1,
--         p_username        => '...' );
--
--     l_last_sync_time := apex_rest_source_sync.get_last_sync_timestamp(
--                             p_module_static_id      => 'rest_movie' );
-- end;
--==============================================================================
function get_last_sync_timestamp(
    p_module_static_id      in varchar2,
    p_application_id        in number   default wwv_flow.g_flow_id )
    return timestamp with time zone;

--==============================================================================
-- This procedure determines whether synchronization for the given
-- REST data source is currently running.
--
-- Parameters:
-- * p_application_id:       ID of the application which contains the automation.
-- * p_module_static_id:     Static ID of the automation to disable.
--
-- Returns:
-- true, if synchronization is currently running, false otherwise.
--
-- Example:
-- This example prints out whether synchronization is currently running or not.
--
--   begin
--       if apex_rest_source_sync.is_running(
--              p_application_id     => 152,
--              p_module_static_id   => 'rest_movie' )
--       then
--           dbms_output.put_line( 'Synchronization is currently running.' );
--       else
--           dbms_output.put_line( 'Synchronization is currently not running.' );
--       end if;
--   end;
--==============================================================================
function is_running(
    p_application_id        in number   default wwv_flow.g_flow_id,
    p_module_static_id      in varchar2 )
    return boolean;

--==============================================================================
-- Sets the next scheduled execution timestamp of the synchronization.
--
-- Parameters:
-- * p_application_id:       (optional) the application ID
-- * p_module_static_id:     static ID to identify the REST Data Source
-- * p_next_run_at:          Timestamp to execute the next synchronization
--
-- Example:
-- Synchronize the REST Data Source named "rest_movie" right now
--
-- begin
--     apex_session.create_session(
--          p_app_id          => 100,
--          p_page_id         => 1,
--          p_username        => '...' );
--
--     apex_rest_source_sync.reschedule(
--         p_module_static_id  => 'rest_movie' );
-- end;
--==============================================================================
procedure reschedule (
    p_application_id         in number                   default wwv_flow.g_flow_id,
    p_module_static_id       in varchar2,
    p_next_run_at            in timestamp with time zone default systimestamp );

--==============================================================================
-- Disables synchronization, so that it will no longer be executed automatically.
--
-- Parameters:
-- * p_application_id:       (optional) the application ID
-- * p_module_static_id:     static ID to identify the REST Data Source
--
-- Example:
-- Disable synchronization for the "rest_movie" REST Data Source in application 152.
--
-- begin
--     apex_rest_source_sync.disable(
--         p_application_id   => 152,
--         p_module_static_id => 'rest_movie' );
-- end;
--==============================================================================
procedure disable(
    p_application_id         in number   default wwv_flow.g_flow_id,
    p_module_static_id       in varchar2 );

--==============================================================================
-- Enables synchronization for the REST Data Source
--
-- Parameters:
-- * p_application_id:       (optional) the application ID
-- * p_module_static_id:     static ID to identify the REST Data Source
--
-- Example:
-- Enable synchronization for the "rest_movie" REST Data Source in application 152.
--
-- begin
--     apex_rest_source_sync.enable(
--         p_application_id   => 152,
--         p_module_static_id => 'rest_movie' );
-- end;
--==============================================================================
procedure enable(
    p_application_id         in number   default wwv_flow.g_flow_id,
    p_module_static_id       in varchar2 );

--==============================================================================
-- Terminates a running synchronization job for the REST Data Source
--
-- Parameters:
-- * p_application_id:       (optional) the application ID
-- * p_module_static_id:     static ID to identify the REST Data Source
--
-- Example:
-- Terminates synchronization for the "rest_movie" REST Data Source in application 152.
--
-- begin
--     apex_rest_source_sync.terminate(
--         p_application_id   => 152,
--         p_module_static_id => 'rest_movie' );
-- end;
--==============================================================================
procedure terminate(
    p_application_id         in number   default wwv_flow.g_flow_id,
    p_module_static_id       in varchar2 );

end wwv_flow_web_src_sync_api;
/
show err
