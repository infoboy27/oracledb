Rem   Copyright (c) 2000, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      load_is.sql
Rem
Rem    DESCRIPTION
Rem      Install Icelandic version of Oracle APEX Runtime Messages
Rem
Rem    REQUIREMENTS
Rem      Requires connection as SYS
Rem
Rem    NOTES
Rem      The NLS_LANG must be properly set in the environment
Rem      prior to running this script or character set conversion can take place.
Rem      The character set portion of NLS_LANG must be set to AL32UTF8
Rem         Example: AMERICAN_AMERICA.AL32UTF8
Rem
Rem    Arguments:
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem    hfarrell     03/06/2023 - Created

prompt . ORACLE
prompt .
prompt . Oracle APEX Runtime Messages Installation.
prompt ....................................................


set define '^'
set concat on
set concat .
set verify off
set termout off
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

@@f4470_is.sql

set define '^'

prompt Adjust instance settings
-- Update image prefix, owner, release of installed translated application
begin
    wwv_flow_security.g_security_group_id := 10;
    --
    for c1 in ( select flow_image_prefix, owner
                  from wwv_flows
                 where security_group_id = 10
                   and id                = 4155 ) loop
        update wwv_flows
           set flow_image_prefix = c1.flow_image_prefix,
               owner             = c1.owner,
               flow_version      = ( select '&PRODUCT_NAME. ' || wwv_flows_release from dual where rownum = 1 )
          where id in ( select translation_flow_id
                          from wwv_flow_language_map
                         where translation_flow_language_code = 'is'
                           and security_group_id = wwv_flow_security.g_security_group_id );
        exit;
    end loop;--c1
    commit;
end;
/
