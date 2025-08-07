set define '^' verify off
prompt ...wwv_flow_log
create or replace package wwv_flow_log as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2023, Oracle and/or its affiliates.
--
--    DESCRIPTION
--      Flow activity logging
--
--    SECURITY
--
--    NOTES:
--      This program logs flow activity
--      p_elap:     Elapsed time in seconds
--      p_verbose:  Log all information not just most critical
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   08/04/1999 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- counter for report rows fetched
--==============================================================================
g_total_rows_fetched pls_integer := 0;

--==============================================================================
-- for IR logging
--==============================================================================
g_worksheet_id          number;
g_ir_report_id          number;
g_ir_search             varchar2(4000);

--==============================================================================
-- activity log page view type
--==============================================================================
subtype t_page_view_type is wwv_flow_activity_log1$.page_view_type%type;
c_page_view_type_other         t_page_view_type := 0;
c_page_view_type_processing    t_page_view_type := 1;
c_page_view_type_rendering     t_page_view_type := 2;
c_page_view_type_ajax          t_page_view_type := 3;
c_page_view_type_auth_logout   t_page_view_type := 4;
c_page_view_type_auth_callback t_page_view_type := 5;
c_page_view_type_bg_execution  t_page_view_type := 6;


--==============================================================================
-- message types and constants
--==============================================================================
subtype t_message_type is pls_integer range 1..3;

c_log_message_info           constant t_message_type := 1;
c_log_message_warn           constant t_message_type := 2;
c_log_message_error          constant t_message_type := 3;

--==============================================================================
-- automation logging messages
--==============================================================================
subtype t_automation_log_status is varchar2(20);

c_log_status_success              constant t_automation_log_status := 'SUCCESS';
c_log_status_no_action            constant t_automation_log_status := 'NO_ACTION';
c_log_status_incomplete           constant t_automation_log_status := 'INCOMPLETE';
c_log_status_failure              constant t_automation_log_status := 'FAILURE';
c_log_status_aborted              constant t_automation_log_status := 'ABORTED';
c_log_status_job_runs_already     constant t_automation_log_status := 'JOB_ALREADY_RUNNING';


type t_automation_message is record(
    action_id         number,
    message_type      t_message_type,
    message           varchar2(4000),
    pk_value          varchar2(4000),
    message_timestamp timestamp with time zone );

type t_automation_messages is table of t_automation_message index by binary_integer;

c_empty_automation_messages t_automation_messages;

--==============================================================================
-- For the specified log (ACCESS, ACTIVITY, CLICKTHRU, DEBUG), determine if a log switch is necessary
-- If not, return the current log number.  Otherwise, switch the logs and return the updated log number
--==============================================================================
function evaluate_current_log_number(
    p_log in varchar2 )
    return number;

--==============================================================================
procedure initialize_log (
    p_log in varchar2,
    p_log_switch_after_days in number default null );

--==============================================================================
function get_current_activity_log_id return number;

--==============================================================================
procedure log (
    p_elap                in number  default null,
    p_content_length      in number  default null,
    p_verbose             in boolean default true );

--==============================================================================
procedure log_ws (
    p_url                 in varchar2,
    p_http_method         in varchar2,
    p_content_length      in number default null,
    p_status_code         in number default null,
    p_resp_content_length in number default null,
    p_elapsed_sec         in number default null,
    p_ai_remote_server_id in number default null,
    p_ai_tokens_consumed  in number default null );

--==============================================================================
procedure log_web_source_sync (
    p_flow_id                in number,
    p_synchronization_id     in number,
    p_synchronization_run_id in number,
    p_web_src_module_id      in number,
    p_web_src_sync_static_id in varchar2,
    p_sync_to_table_owner    in varchar2,
    p_sync_to_table_name     in varchar2,
    p_is_job                 in boolean,
    p_status                 in varchar2,
    p_start_timestamp        in timestamp with local time zone,
    p_end_timestamp          in timestamp with local time zone,
    p_rows_processed         in number,
    p_messages               in varchar2,
    p_security_group_id      in number default null );

--==============================================================================
procedure log_automation(
    p_flow_id                in number,
    p_automation_id          in number,
    p_is_job                 in boolean,
    p_status                 in t_automation_log_status,
    p_start_timestamp        in timestamp with time zone,
    p_end_timestamp          in timestamp with time zone,
    p_success_row_count      in number,
    p_error_row_count        in number,
    p_messages               in t_automation_messages default c_empty_automation_messages,
    p_security_group_id      in number                default null );

end wwv_flow_log;
/
show errors
