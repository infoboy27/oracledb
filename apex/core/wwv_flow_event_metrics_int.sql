set define off verify off
prompt ...wwv_flow_event_metrics_int.sql
create or replace package wwv_flow_event_metrics_int as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2024 Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_event_metrics_int.sql
--
--    DESCRIPTION
--      This package contains the implementation for the Administrator Digest Metrics.
--
--
--    MODIFIED   (MM/DD/YYYY)
--    andrdobr    11/14/2022 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- The procedure includes the overall activity/aggregated event metrics at
-- workspace level for each day
--==============================================================================
procedure insert_daily_workspace_metrics;

--==============================================================================
-- The procedure includes the schema level metrics / day (aggregated schema
-- level metrics / day ), we can have multiple schemas on the instance,
-- therefore for a certain day will have multiple records
--==============================================================================
procedure insert_daily_schema_metrics;

--==============================================================================
-- The procedure includes the overall metrics/aggregated metrics for the entire
-- instance in a day
--==============================================================================
procedure insert_daily_instance_metrics;

--==============================================================================
-- The procedure removes the data older than the value set by the instance
-- administrator in the wwv_flow_log_numbers for the WORKSPACE_AGGR_METRICS entry
--==============================================================================
procedure remove_old_workspace_metrics;

--==============================================================================
-- The procedure removes the data older than the value set by the instance
-- administrator in the wwv_flow_log_numbers for the SCHEMA_AGGR_METRICS entry
--==============================================================================
procedure remove_old_schema_metrics;

--==============================================================================
-- Returns TRUE if the daily metrics (for yesterday) have not yet been created.
--==============================================================================
function needs_latest_daily_metrics
    return boolean;

--==============================================================================
-- The function returns the id for the event_type parameter listed in the
-- signature
--
-- Parameters:
-- * p_event_type                 event type
--
-- Example:
--
--   begin
--       sys.htp.p(wwv_flow_event_metrics_int.get_event_type_id (
--                     p_event_type => 'SCHEMA_CREATED' ));
--   end;
--==============================================================================
function get_event_type_id (
    p_event_type in varchar2 )
    return number;

--==============================================================================
-- The procedure adds events that are not yet covered/logged in the existing
-- views eg. workspace creation, schema creation
--
-- Parameters:
-- * p_event_type                 event type
-- * p_security_group_id          workspace id
-- * p_attribute_values           the array stores all parameters values coming
--                                from an APEX request or using the APEX APIs
--
-- Example:
--
--   begin
--       ...
--       wwv_flow_event_metrics_int.add_event (
--           p_event_type       => 'SCHEMA_CREATED',
--           p_attribute_values => wwv_flow_t_varchar2(
--                                     wwv_flow_json.stringify(...)));
--   end;
--==============================================================================
procedure add_event (
    p_event_type          in varchar2,
    p_security_group_id   in number   default null,
    p_attribute_values    in wwv_flow_t_varchar2 default null );

--==============================================================================
-- The function retrieves a message using the event values that were changed
-- in an APEX request or outside APEX through the public APEX APIs.
--
-- Parameters:
-- * p_event_static_id             event type
-- * p_attribute_values            the array stores all parameters values coming
--                                 from an APEX request or using the APEX APIs
--
-- Example:
--
--   begin
--       sys.htp.p(wwv_flow_event_metrics_int.get_event_message(
--                     p_event_static_id  => 'SCHEMA_CREATED',
--                     p_attribute_values => [ "WORKSPACE_1" ,"SCHEMA_1"] ));
--   end;
--==============================================================================

function get_event_message (
    p_event_static_id in varchar2,
    p_attribute_values in clob )
    return varchar2;

--==============================================================================
-- The function retrieves the error message (sqlerrm) assigned to a specific
-- error code
--
-- Parameters:
-- * p_error_code                 error code
--
-- Example:
--
--   begin
--       sys.htp.p(wwv_flow_event_metrics_int.get_error_message(
--                     p_error_code => substr(db_error_code,
--                                            instr(db_error_code, ''-'') + 2))
--                 );
--   end;
--==============================================================================

function get_error_message (
    p_error_code in number )
    return varchar2;

--==============================================================================
-- The procedure includes the aggregated job metrics for each day
-- It Contains: Jobs created using the DBMS_SCHEDULER API, Automations,
-- REST Synchronizations
--==============================================================================
procedure insert_daily_job_metrics;

--==============================================================================
-- The procedure removes the data older than the value set by the instance
-- administrator in the Instance Settings -> Administrator Digest ->
-- Maximum Reporting Period (Days)
--==============================================================================
procedure remove_old_job_metrics;

end wwv_flow_event_metrics_int;
/

show errors
set define '^'