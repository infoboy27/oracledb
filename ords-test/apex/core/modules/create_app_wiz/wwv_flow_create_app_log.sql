set define '^' verify off
prompt ...wwv_flow_create_app_log_v3
create or replace package wwv_flow_create_app_log_v3 as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2017. All Rights Reserved.
--
--    NAME
--      wwv_flow_create_app_log_v3.sql
--
--    DESCRIPTION
--      API to log create application events.
--
--    MODIFIED (MM/DD/YYYY)
--    cbcho     03/08/2017 - Created
--    cbcho     03/10/2017 - Added get_progress
--    cbcho     04/05/2017 - Renamed to v3
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_log_collection    constant varchar2(255) := 'APEX$CREATE_APP_LOG';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--

procedure get_progress(
    p_last_event_name  out varchar2,
    p_percent_complete out number );

procedure start_log(
    p_app_id in number );

procedure log_event(
    p_event_msg_name in varchar2,
    p0               in varchar2 default null );

procedure end_log;
    
end wwv_flow_create_app_log_v3;
/
show errors
