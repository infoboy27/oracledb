set define '^' verify off
prompt ...wwv_flow_web_src_sync_dev.sql
create or replace package wwv_flow_web_src_sync_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
--    NAME
--      wwv_flow_web_src_sync.sql
--
--    DESCRIPTION
--      Web source Synchronizations: Builder utility functions
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    04/29/2020 - Created
-- 
--------------------------------------------------------------------------------

--==============================================================================
-- Global types 
--==============================================================================

subtype t_supp_script is pls_integer range 1..2;

--==============================================================================
-- contants
--==============================================================================

c_script_install constant t_supp_script := 1;
c_script_upgrade constant t_supp_script := 2;

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- Given the calendaringh expression, return the amount of minutes between the 
-- next and the following execution.
--
-- PARAMETERS:
-- * p_calendaring_expression calendaring expression (DBMS_SCHEDULER) to
--                            compute the next execution timestamp
-- RETURNS:
-- * minutes between the next and following execution
--==============================================================================
function get_execution_cadence_minutes(
    p_calendaring_expression  in varchar2 )
    return number;

--==============================================================================
-- adds a supporting objects script to maintain the synchronization table.
--
-- PARAMETERS:
-- * p_application_id         application ID
-- * p_web_source_module_id   web source module ID
-- * p_include_drop_columns   whether to include DROP COLUMN statements
-- * p_script_type            type of the script to create (c_script_install, c_script_upgrade)
-- * p_script_name            name of the script
--
-- RETURNS:
-- * internal ID of the created supporting objects script.
--==============================================================================
function create_supp_objects_script(
    p_application_id         in number,
    --
    p_web_source_module_id   in number,
    p_include_drop_columns   in boolean,
    p_script_type            in t_supp_script,
    p_script_name            in varchar2 )
    return number;

--==============================================================================
-- based on when the next snchronization is due, return the actual scheduled
-- job's execution timestamp
--==============================================================================
--
-- PARAMETERS:
-- * p_due_timestamp:         due timestamp of the next synchronization
--
-- RETURNS:
-- * actual scheduled job execution timestamp
--==============================================================================
function get_actual_execution_timestamp(
    p_due_timestamp in timestamp with time zone )
    return timestamp with time zone;

--==============================================================================
-- create a new synchronization step and return the internal ID for futher 
-- processing within the builder
--
-- PARAMETERS:
-- * p_application_id         application ID
-- * p_web_source_module_id   web source module ID
--
-- RETURNS:
-- * Internal ID of the new synchronization step
--==============================================================================
function create_new_sync_step(
    p_application_id         in number,
    p_web_source_module_id   in number )
    return number;

--==============================================================================
-- handles the synchronization job for all subscribed Web Source Modules. If
-- the master WSM synchronization job is active, the job will be disabled for
-- all subscribed Web Source Modules.
--
-- PARAMETERS:
-- * p_web_source_module_id   web source module ID
-- * p_master_wsm_job_status  synchronization job status of the master WSM
--==============================================================================
procedure handle_sync_job_subscribed_wsm(
    p_master_wsm_job_status   in boolean,
    p_web_source_module_id    in number );

--==============================================================================
-- disables the synchronization for a Web Source Module. All components using
-- this Web Source Module will be changed as follows:
-- 
-- * USE_LOCAL_SYNC_TABLE changes to NULL
-- * Component parameters are re-created using default values from the Web Source Module
--
-- PARAMETERS:
-- * p_application_id         application ID
-- * p_web_source_module_id   web source module ID
--==============================================================================
procedure clear_web_source_sync(
    p_application_id       in number,
    p_web_source_module_id in number );

--==============================================================================
-- activates synchronization for a Web Source Module. All components using
-- this Web Source Module will be changed as follows:
--
-- - USE_LOCAL_SYNC_TABLE attribute changes from NULL to 'N'
-- - All component parameters are being removed.
--
-- PARAMETERS:
-- * p_application_id         application ID
-- * p_web_source_module_id   web source module ID
-- * p_use_local_sync_table   value to set the use_local_sync_table attribute
--                            in wwv_flow_page_plugs, wwv_flow_jet_chart_series
--                            and wwv_flow_lists_of_values$
--==============================================================================
procedure set_use_local_sync_table(
    p_application_id       in number,
    p_web_source_module_id in number,
    p_use_local_sync_table in boolean );

--==============================================================================
-- gets the current state of the synchronization job
--
-- PARAMETERS:
-- * p_web_source_module_id   web source module ID
--
-- RETURNS:
-- * state of the synchronization job. NULL if the job does not exist.
--==============================================================================
function get_job_status(
    p_web_source_module_id in number )
    return varchar2;

--==============================================================================
-- aborts a scheduled or running synchronization job
--
-- PARAMETERS:
-- * p_application_id         application ID
-- * p_web_source_module_id   web source module ID
--==============================================================================
procedure abort_sync_job(
    p_application_id       in number,
    p_web_source_module_id in number );

--==============================================================================
-- determines whether the data profile of the web source module has a
-- primary key defined.
--
-- PARAMETERS:
-- * p_web_source_module_id   web source module ID
--
-- RETURNS:
-- * true, if a primary key column exists, false otherwise
--==============================================================================
function data_profile_has_primary_key(
    p_web_source_module_id in number )
    return boolean;    

end wwv_flow_web_src_sync_dev;
/
show err

set define '^'

