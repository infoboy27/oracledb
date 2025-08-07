Rem  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      load_ko.sql
Rem
Rem    DESCRIPTION
Rem      Install Korean version of Oracle APEX applications
Rem
Rem    NOTES
Rem      Assumes the Oracle APEX owner.
Rem      Note that the NLS_LANG must be properly set in the environment
Rem      prior to running this script or character set conversion can take place
Rem      The character set portion of NLS_LANG must be set to AL32UTF8
Rem         Example: AMERICAN_AMERICA.AL32UTF8
Rem
Rem    Arguments:
Rem      None
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   08/29/2003 - Created

prompt . ORACLE
prompt .
prompt . Oracle APEX Hosted Development Service Installation.
prompt ..............................................................


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
    sys.dbms_registry.set_session_namespace ( namespace   => 'DBTOOLS' );
    l_schema := sys.dbms_registry.schema( 'APEX' );
    execute immediate 'alter session set current_schema='||sys.dbms_assert.enquote_name( l_schema );
end;
/

@@f4411_ko.sql
@@f4470_ko.sql
@@f4000_ko.sql
@@f4020_ko.sql
@@f4050_ko.sql
@@f4100_ko.sql
@@f4155_ko.sql
@@f4300_ko.sql
@@f4350_ko.sql
@@f4500_ko.sql
@@f4550_ko.sql
@@f4600_ko.sql
@@f4650_ko.sql
@@f4700_ko.sql
@@f4750_ko.sql
@@f4850_ko.sql

set define '^'

prompt Adjust instance settings
-- Update image prefix, owner, release of installed translated applications
begin
    wwv_flow_security.g_security_group_id := 10;
    --
    for c1 in (select flow_image_prefix, owner
                 from wwv_flows
                where security_group_id = 10
                  and id = 4000) loop
        update wwv_flows
           set flow_image_prefix = c1.flow_image_prefix,
               owner = c1.owner,
               flow_version = (select '&PRODUCT_NAME. ' || wwv_flows_release from dual where rownum = 1)
         where id in (select translation_flow_id
                        from wwv_flow_language_map
                       where translation_flow_language_code = 'ko'
                         and security_group_id = wwv_flow_security.g_security_group_id);
        update wwv_flows set flow_version = '&PRODUCT_NAME. ' where id = 4558;
        exit;
    end loop;--c1
    commit;
end;
/
