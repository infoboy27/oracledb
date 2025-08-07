Rem  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      rt_es.sql
Rem
Rem    DESCRIPTION
Rem      Install Spanish version of Oracle APEX runtime
Rem
Rem    NOTES
Rem      Assumes the Oracle APEX owner.
Rem      Note that the NLS_LANG must be properly set in the environment
Rem      prior to running this script or character set conversion can take place
Rem      The character set portion of NLS_LANG must be set to AL32UTF8
Rem         Example: AMERICAN_AMERICA.AL32UTF8
Rem
Rem    REQUIREMENTS
Rem      - Oracle 12.1.0.2 or greater
Rem
Rem    Arguments:
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   10/04/2007 - Created
Rem      hfarrell   02/13/2012 - Added set define statement after f4155_es.sql (due to bug 13403278 fix)
Rem      arayner    01/17/2013 - Replaced ORACLE ASCII art with plain ORACLE text (bug #14556985)

prompt . ORACLE
prompt .
prompt . Oracle APEX Runtime Installation.
prompt .........................................................


set define '^'
set concat on
set concat .
set verify off
set termout off
spool off
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

@@f4411_es.sql
@@f4470_es.sql
@@f4155_es.sql

set define '^'

prompt Adjust instance settings
-- Update image prefix, owner, release of installed translated applications
begin
    wwv_flow_security.g_security_group_id := 10;
    --
    for c1 in (select flow_image_prefix, owner
                 from wwv_flows
                where security_group_id = 10
                  and id = 4155) loop
        update wwv_flows
           set flow_image_prefix = c1.flow_image_prefix,
               owner = c1.owner,
               flow_version = (select '&PRODUCT_NAME. ' || wwv_flows_release from dual where rownum = 1)
         where id in ( select translation_flow_id
                         from wwv_flow_language_map
                        where translation_flow_language_code = 'es'
                          and primary_language_flow_id in (4411,4470,4155)
                          and security_group_id = 10 );
        commit;
        exit;
    end loop;--c1
end;
/
