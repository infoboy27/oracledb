set define '^' verify off lines 200 serveroutput on
prompt ...activity.sql ^1
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2015. All Rights Reserved.
--
--    NAME
--      activity.sql
--
--    SYNOPSIS
--      SQL> @activity arg1,arg2,...
--      SQL> @activity help
--      SQL> @activity "last_days=2,error"
--
--    DESCRIPTION
--      This script prints data from the APEX activity log. Administrators can
--      use it to get an overview of what is going on in an APEX instance.
--
--    EXAMPLES
--      Print argument help and exit.
--
--      SQL> @activity help
--
--      What errors occurred in the last 2 days?
-- 
--      SQL> @activity last_days=2,error
--
--      What happened in the 10 minutes before 15th October 2015 10:00 in
--      application 100?
--
--      SQL> @activity "now=2015-10-15_10:00,last_minutes=10,app=100"
--
--    MODIFIED   (MM/DD/YYYY)
--      cneumuel  10/15/2015 - Created
--      cneumuel  01/26/2016 - set current_schema
--      cneumuel  04/18/2018 - expose ELAP column
--
--------------------------------------------------------------------------------

set termout off
col DBA_REGISTRY_SCHEMA noprint new_value DBA_REGISTRY_SCHEMA
select schema DBA_REGISTRY_SCHEMA
  from sys.dba_registry
 where comp_id='APEX'
/
alter session set current_schema=^DBA_REGISTRY_SCHEMA.;
set termout on

declare
    LF               constant varchar2(1) := unistr('\000a');
    l_now            date        := sysdate;
    l_last_minutes   pls_integer := 5;
    l_app            number;
    l_page           number;
    l_ws_name        varchar2(100);
    l_session        number;
    l_user           varchar2(100);
    l_ip_address     varchar2(100);
    l_error          varchar2(200);
    l_debug          number;
    l_print_app      boolean;
    l_print_page     boolean;
    l_print_app_page boolean;
    l_print_session  boolean;
    l_print_user     boolean;
    l_print_ip       boolean;
    l_length         pls_integer;
    l_error_length   pls_integer;
    l_lines          wwv_flow_t_varchar2;
--------------------------------------------------------------------------------
    procedure print_usage_and_exit (
        p_error in varchar2 )
    is
        l_sqlerrm varchar2(4000) := sqlerrm;
    begin
        sys.dbms_output.put_line('Usage: activity.sql arg1,arg2,...');
        sys.dbms_output.put_line('');
        sys.dbms_output.put_line('Arguments:');
        sys.dbms_output.put_line('- help ....................... print argument help and exit');
        sys.dbms_output.put_line('- now ........................ set date to sysdate');
        sys.dbms_output.put_line('- now=YYYY-MM-DD_HH24:MI:SS .. set to date (time parts are optional, default sysdate)');
        sys.dbms_output.put_line('- last_minutes=nnn ........... look back nnn minutes (default 5)');
        sys.dbms_output.put_line('- last_days=nnn .............. look back nnn days (default 5 minutes)');
        sys.dbms_output.put_line('- app=nnn .................... just application nnn');
        sys.dbms_output.put_line('- page=nnn ................... just page nnn');
        sys.dbms_output.put_line('- workspace=WSNAME ........... just workspace with name WSNAME');
        sys.dbms_output.put_line('- session=nnn ................ just session nnn');
        sys.dbms_output.put_line('- user=USERNAME .............. just user USERNAME');
        sys.dbms_output.put_line('- ip-address=a.b.c.d ......... just IP address a.b.c.d (if no address given, entries with ip address)');
        sys.dbms_output.put_line('- error ...................... just show activity with errors');
        sys.dbms_output.put_line('- error=XXX .................. just with errors like XXX (e.g. ORA-00942%)');
        sys.dbms_output.put_line('- debug ...................... print warnings and errors in the debug log');
        sys.dbms_output.put_line('- debug=n .................... print messages with level <= n in the debug log');
        sys.dbms_output.put_line('');
        sys.dbms_output.put_line('Example: What errors occurred in the last 2 days?');
        sys.dbms_output.put_line('  SQL> @activity last_days=2,error');
        sys.dbms_output.put_line('');
        sys.dbms_output.put_line('Example: What happened on 15h October 2015 between 9:00 and 10:00 in app 100?');
        sys.dbms_output.put_line('  SQL> @activity now=2015-10-15_10:00,last_minutes=60,app=100');
        raise_application_error(-20001, p_error);
    end print_usage_and_exit;
--------------------------------------------------------------------------------
    procedure parse_arguments
    is
        c_args constant varchar2(32767) := nvl('^1', 'help');
        l_start     pls_integer;
        l_comma_pos pls_integer;
        l_arg       varchar2(4000);
        function val
            return varchar2
        is
            l_eq_pos pls_integer;
        begin
            l_eq_pos := instr(l_arg, '=');
            return case when l_eq_pos > 0 then ltrim(substr(l_arg, l_eq_pos+1)) end;
        end val;
    begin
        l_start := 1;
        while l_start > 0 and l_start <= length(c_args) loop
            --
            -- 1. read arg=val and advance l_start
            --
            l_comma_pos := instr(c_args, ',', l_start);
            if l_comma_pos > 0 then
                l_arg   := substr(c_args, l_start, l_comma_pos-l_start);
                l_start := l_comma_pos + 1;
            else
                l_arg   := substr(c_args, l_start);
                l_start := 0;
            end if;
            l_arg    := trim(l_arg);
            --
            -- 2. process argument
            --
            case
            when l_arg = 'now'               then l_now            := sysdate;
                                                  l_last_minutes  := 5;
            when l_arg like 'now=%'          then l_now            := to_date(val, 'yyyy-mm-dd_hh24:mi:ss');
            when l_arg like 'last_minutes=%' then l_last_minutes  := val;
            when l_arg like 'last_days=%'    then l_last_minutes  := val*60*24;
            when l_arg like 'app=%'          then l_app           := val;
            when l_arg like 'page=%'         then l_page          := val;
            when l_arg like 'workspace=%'    then l_ws_name       := upper(val);
            when l_arg like 'session=%'      then l_session       := val;
            when l_arg like 'user=%'         then l_user          := upper(val);
            when l_arg like 'ip-address=%'   then l_ip_address    := val;
            when l_arg like 'error'          then l_error         := '%';
            when l_arg like 'error=%'        then l_error         := val;
            when l_arg like 'debug'          then l_debug         := 2;
            when l_arg like 'debug=%'        then l_debug         := replace(upper(val),'LEVEL',null);
            when l_arg = 'help'              then print_usage_and_exit (
                                                      p_error => 'Exit after printing help' );
            else                                  print_usage_and_exit (
                                                      p_error => 'Invalid Argument: '||l_arg );
            end case;
        end loop;
        l_print_app_page := l_app is null and l_page is null;
        l_print_app      := not l_print_app_page and l_app is null;
        l_print_page     := not l_print_app_page and l_page is null;
        l_print_session  := l_session is null;
        l_print_user     := l_user is null;
        l_print_ip       := l_ip_address is not null;
    exception when others then
        if sqlcode = -20001 then raise; end if;
        print_usage_and_exit (
            case
            when l_arg is not null then 'Error ORA'||sqlcode||' parsing argument: '||l_arg
            else sqlerrm
            end );
    end parse_arguments;
--------------------------------------------------------------------------------
    procedure cell (
        p_value  in varchar2,
        p_length in pls_integer,
        p_cond   in boolean := true )
    is
    begin
        if p_cond then
            sys.dbms_output.put(rpad(nvl(p_value, ' '),p_length+1));
            l_length := l_length + p_length+1;
        end if;
    end cell;
--------------------------------------------------------------------------------
begin
    begin
        parse_arguments;
    exception when others then return;
    end;

    l_length := 0;
    cell('TIME'          , 19);
    cell('ELAP'          , 5);
    cell('APP:PAGE'      , 12   , l_print_app_page);
    cell('APP'           , 8    , l_print_app);
    cell('PAGE'          , 5    , l_print_page);
    cell('SESSION'       , 15   , l_print_session);
    cell('VIEW_TYPE'     , 13);
    cell('IP_ADDRESS'    , 31   , l_print_ip);
    cell('USER'          , 30   , l_print_user);
    cell('DEBUG'         , 15);
    l_error_length := 199-l_length;
    cell('ERROR'         , l_error_length);
    sys.dbms_output.new_line;
    sys.dbms_output.put_line(rpad('-',l_length,'-'));
    for i in ( select a.time_stamp,
                      ltrim(to_char(a.elap, '990D999')) elap,
                      a.ip_address,
                      a.flow_id,
                      a.step_id,
                      a.session_id,
                      a.userid,
                      a.sqlerrm,
                      a.page_view_type,
                      a.request_value,
                      a.debug_page_view_id,
                      c.short_name ws_name
                 from wwv_flow_activity_log a,
                      wwv_flow_companies c
                where a.security_group_id = c.provisioning_company_id
                  and a.time_stamp between l_now-l_last_minutes/24/60 and l_now
                  and (l_app is null        or a.flow_id = l_app)
                  and (l_page is null       or a.step_id = l_page)
                  and (l_ws_name is null    or c.short_name = l_ws_name)
                  and (l_session is null    or a.session_id = l_session)
                  and (l_user is null       or a.userid = l_user)
                  and (l_ip_address is null or a.ip_address like l_ip_address)
                  and (l_error is null      or a.sqlerrm like l_error )
                order by 1 )
    loop
        cell(to_char(i.time_stamp,'yyyy-mm-dd hh24:mi:ss'), 19);
        cell(lpad(substr(i.elap, 1, 5), 5)                , 5);
        cell(i.flow_id||':'||i.step_id                    , 12   , l_print_app_page);
        cell(i.flow_id                                    , 8    , l_print_app);
        cell(i.step_id                                    , 5    , l_print_page);
        cell(i.session_id                                 , 15   , l_print_session);
        cell(case i.page_view_type
             when 0 then 'Other'
             when 1 then 'Processing'
             when 2 then 'Rendering'
             when 3 then 'Ajax'
             when 4 then 'Logout'
             when 5 then 'Auth Callback'
             end                                          , 13);
        cell(i.ip_address                                 , 31   , l_print_ip);
        cell(substr(i.userid,1,30)                        , 30   , l_print_user);
        cell(i.debug_page_view_id                         , 15);
        cell(replace(i.sqlerrm, LF, '\n')                 , l_error_length);
        sys.dbms_output.new_line;
        if     l_debug is not null
           and i.debug_page_view_id is not null
        then
            for j in ( select message_level,
                              message
                         from ( select id,
                                       message_level,
                                       message
                                  from wwv_flow_debug_messages
                                 where page_view_id=i.debug_page_view_id
                                union all
                                select id,
                                       message_level,
                                       message
                                  from wwv_flow_debug_messages2
                                 where page_view_id=i.debug_page_view_id )
                        where message_level <= l_debug
                        order by id )
            loop
                l_lines := wwv_flow_string.split(j.message);
                for k in 1 .. l_lines.count loop
                    sys.dbms_output.put_line('. -'||j.message_level||'- '||l_lines(k));
                end loop;
            end loop;
        end if;
    end loop;
end;
/
