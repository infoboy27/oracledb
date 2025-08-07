Rem  Copyright (c) 1999, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxremov1.sql
Rem
Rem    DESCRIPTION
Rem      Removes Oracle APEX
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. You must exit the SQL*Plus session prior to running
Rem      apexins.sql
Rem
Rem    REQUIRENTS
Rem      Oracle APEX
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   08/14/2006 - Created
Rem

set define '^' verify off
define PREFIX = '^1'

prompt ...Removing Oracle APEX

@^PREFIX.core/scripts/set_appun.sql

alter session set current_schema = ^APPUN;
declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=true';
exception
    when invalid_alter_priv then
        null;
end;
/

begin
    wwv_flow_upgrade.remove_jobs;
    wwv_flow_upgrade.drop_public_synonyms(p_drop_all => TRUE);
end;
/

declare
    c_max_iterations     constant pls_integer := 60;

    l_job_session_exists number;
    l_continue_checking  boolean     := true;
    l_iteration#         pls_integer := 0;
begin
    while l_continue_checking loop
        l_iteration# := l_iteration# + 1;

        if l_iteration# > c_max_iterations then
            sys.dbms_output.put_line( to_char( systimestamp, 'YYYY-MM-DD HH24:MI:SS' ) || ': maximum wait time exceeded.' );
            exit;
        end if;

        select count(*)
          into l_job_session_exists
          from sys.gv_$session
         where schemaname    = '^APPUN'
           and module        = 'DBMS_SCHEDULER'
           and action     like 'ORACLE_APEX_%'
           and rownum        = 1;

        l_continue_checking := l_job_session_exists != 0;

        if l_continue_checking then
            sys.dbms_output.put_line( to_char( systimestamp, 'YYYY-MM-DD HH24:MI:SS' ) || ': waiting to finish scheduler job background sessions.' );
            sys.dbms_session.sleep( seconds => 5 );
        end if;

    end loop;
end;
/

@^PREFIX.core/scripts/set_ufrom_and_upgrade.sql

begin
    if '^UPGRADE' = '1' then
        wwv_flow_upgrade.flows_files_objects_remove('^APPUN');
    end if;
end;
/

alter session set current_schema = SYS;

set serveroutput on
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
declare
    l_has_apex number;
begin
    select count(*)
      into l_has_apex
      from sys.dba_users
     where username = '^APPUN';

    if l_has_apex = 0 then
        sys.dbms_output.put_line(chr(13)||chr(10));
        sys.dbms_output.put_line('Error:');
        sys.dbms_output.put_line('You can only use this script to remove Oracle APEX');
        sys.dbms_output.put_line(chr(13)||chr(10)||chr(13)||chr(10));
        execute immediate('invalid sql stmnt to force exit');
    end if;
end;
/
WHENEVER SQLERROR CONTINUE
