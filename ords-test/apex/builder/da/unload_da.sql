Rem  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      unload_da.sql
Rem
Rem    DESCRIPTION
Rem      Deinstall Danish version of Oracle APEX Runtime Messages.  This script will be used to remove
Rem      the Danish version of Oracle APEX Runtime Messages from an existing Oracle APEX instance.
Rem
Rem    REQUIREMENTS
Rem      Requires connection as SYS.
Rem
Rem    ARGUMENTS
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem    jkallman     09/01/2004 - Created


prompt . ORACLE
prompt .
prompt . Oracle APEX Danish Language Runtime Messages Deinstall
prompt ................................................................


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
    sys.dbms_registry.set_session_namespace ( namespace => 'DBTOOLS' );
    l_schema := sys.dbms_registry.schema( 'APEX' );
    execute immediate 'alter session set current_schema='||sys.dbms_assert.enquote_name( l_schema );
end;
/

declare
    l_applications dbms_sql.number_table;
    l_offset       number := 29;
begin
    l_applications( l_applications.count+1 )  := 4470;
    --
    wwv_flow_security.g_security_group_id := 10;
    for i in 1..l_applications.count loop
        wwv_flow_api.remove_flow( l_applications(i) + l_offset );
        commit;
    end loop;
    --
end;
/