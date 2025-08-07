Rem  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      unload_pt-br.sql
Rem
Rem    DESCRIPTION
Rem      Deinstall Brazilian Portuguese version of Oracle APEX applications.  This script will be used to remove
Rem      the Brazilian Portuguese version of Oracle APEX applications from an existing Oracle APEX instance.
Rem
Rem    NOTES
Rem      To be run from SQL*Plus as the Oracle APEX owner or current_schema set to Oracle APEX owner.
Rem
Rem    REQUIREMENTS
Rem      Requires connection to the target database as the Oracle APEX owner (APEX_XXXXXX) or
Rem      connection as SYS and issuing 'ALTER SESSION SET CURRENT_SCHEMA = APEX_XXXXXX'.
Rem
Rem    ARGUMENTS
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   09/01/2004 - Created

prompt . ORACLE
prompt .
prompt . Oracle APEX Hosted Development Service Brazilian Portuguese Language Deinstall
prompt ........................................................................................


set define '^'
set concat on
set concat .
set verify off
set termout on

whenever sqlerror exit
begin
    if wwv_flow_global.g_cloud and sys_context('USERENV','ISDBA') = 'FALSE' then
        raise_application_error(-20001, 'This script is not supported on Oracle Autonomous Database. ' ||
                                        'This instance is pre-installed with all supported languages.');
    end if;
end;
/
whenever sqlerror continue

declare
    l_schema sys.dba_registry.schema%type;
begin
    sys.dbms_registry.set_session_namespace ( namespace   => 'DBTOOLS' );
    l_schema := sys.dbms_registry.schema( 'APEX' );
    execute immediate 'alter session set current_schema='||sys.dbms_assert.enquote_name( l_schema );
end;
/

declare
    l_applications dbms_sql.number_table;
    l_offset       number := 5;
begin
    l_applications(l_applications.count+1)  := 4000;
    l_applications(l_applications.count+1)  := 4020;
    l_applications(l_applications.count+1)  := 4050;
    l_applications(l_applications.count+1)  := 4100;
    l_applications(l_applications.count+1)  := 4155;
    l_applications(l_applications.count+1)  := 4300;
    l_applications(l_applications.count+1)  := 4350;
    l_applications(l_applications.count+1)  := 4411;
    l_applications(l_applications.count+1)  := 4470;
    l_applications(l_applications.count+1)  := 4500;
    l_applications(l_applications.count+1)  := 4550;
    l_applications(l_applications.count+1)  := 4600;
    l_applications(l_applications.count+1)  := 4650;
    l_applications(l_applications.count+1)  := 4700;
    l_applications(l_applications.count+1)  := 4750;
    l_applications(l_applications.count+1)  := 4850;
    --
    wwv_flow_security.g_security_group_id := 10;
    for i in 1..l_applications.count loop
        wwv_flow_api.remove_flow( l_applications(i) + l_offset );
        commit;
    end loop;
    --
end;
/

