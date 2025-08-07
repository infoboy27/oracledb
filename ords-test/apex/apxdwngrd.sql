Rem  Copyright (c) 2019, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxdwngrd.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem
Rem
Rem    Example:
Rem
Rem     sqlplus "sys/syspass as sysdba" @apxdwngrd
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   01/08/2019 - Created


set define '^'
set concat on
set concat .
set verify off

set termout off
column foo new_val LOG
select 'apxdwngrd_' ||to_char(sysdate, 'YYYY-MM-DD_HH24-MI-SS') || '.log' as foo
  from sys.dual;
set termout on
spool ^LOG

@@core/scripts/set_appun.sql

whenever sqlerror exit
set serveroutput on size unlimited

declare
    l_cnt    number := 0;
begin
    select count(*) into l_cnt from sys.dba_users where username = '^APPUN';
    if l_cnt = 0 then
        sys.dbms_output.put_line('^APPUN not found in this database.');
        raise program_error;
    end if;
end;
/
whenever sqlerror continue

column down NEW_VALUE dfrom NOPRINT

exec sys.dbms_registry.set_session_namespace (namespace   => 'DBTOOLS');
select nvl(sys.dbms_registry.schema('APEX'),'^APPUN') down from sys.dual;

prompt ...Create validate procedure in SYS schema and start registration
@@core/validate_apex.sql

grant inherit any privileges to ^APPUN;

@@core/wwv_flow_val.sql ^APPUN.
grant execute on sys.wwv_flow_val to ^APPUN.;

@@core/wwv_flow_val.plb

ALTER SESSION SET CURRENT_SCHEMA = ^APPUN;

exec sys.dbms_session.modify_package_state(sys.dbms_session.reinitialize);

exec ^APPUN..wwv_flow_upgrade.switch_schemas('^DFROM','^APPUN');

exec ^APPUN..wwv_flow_upgrade.set_patch_applied('^APPUN');

ALTER SESSION SET CURRENT_SCHEMA = SYS;

drop context APEX$SESSION;
create context APEX$SESSION using ^APPUN..WWV_FLOW_SESSION_CONTEXT;


alter package sys.wwv_dbms_sql_^APPUN. compile;
alter package sys.wwv_dbms_sql_^APPUN. compile body;

exec sys.dbms_session.modify_package_state(sys.dbms_session.reinitialize);

set serveroutput on size unlimited

--
-- Switch namespace again after resetting package state and finally update
-- registry. The reset call switched the namespace back to SERVER.
--
declare
     l_apex_version varchar2(30);
     l_schemas      sys.dbms_registry.schema_list_t;
begin
    sys.dbms_registry.set_session_namespace (
        namespace => 'DBTOOLS' );
    execute immediate 'drop package ^APPUN..WWV_FLOW_DB_VERSION';
    l_apex_version := ^APPUN..wwv_flows_release;
    sys.dbms_registry.loading('APEX','Oracle APEX','validate_apex', '^APPUN');
    select username
      bulk collect into l_schemas
      from sys.all_users
     where username in ('FLOWS_FILES','APEX_PUBLIC_USER','APEX_LISTENER','APEX_REST_PUBLIC_USER','APEX_PUBLIC_ROUTER')
     order by 1;
     sys.dbms_registry.update_schema_list('APEX', l_schemas);
     sys.dbms_registry.loaded('APEX',l_apex_version);
     commit;
     sys.validate_apex;
end;
/

spool off
