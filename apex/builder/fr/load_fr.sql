Rem  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      load_fr.sql
Rem
Rem    DESCRIPTION
Rem      Install French version of Oracle APEX applications
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
prompt .........................................................


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

@@f4411_fr.sql
@@f4470_fr.sql
@@f4000_fr.sql
@@f4020_fr.sql
@@f4050_fr.sql
@@f4100_fr.sql
@@f4155_fr.sql
@@f4300_fr.sql
@@f4350_fr.sql
@@f4500_fr.sql
@@f4550_fr.sql
@@f4600_fr.sql
@@f4650_fr.sql
@@f4700_fr.sql
@@f4750_fr.sql
@@f4850_fr.sql

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
          where id in ( select translation_flow_id
                         from wwv_flow_language_map
                        where translation_flow_language_code = 'fr'
                          and security_group_id = wwv_flow_security.g_security_group_id );
        update wwv_flows set flow_version = '&PRODUCT_NAME. ' where id = 4552;
        exit;
    end loop;--c1
    commit;
end;
/
