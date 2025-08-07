Rem  Copyright (c) 2007, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxdvins_nocdb.sql
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
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   07/11/2007 - Created

alter session set nls_length_semantics = byte;

set define '^'
set concat on
set concat .
set verify off
set feedback off
set serveroutput on size unlimited
set termout off
spool off
set termout on

define DATTS             = 'x'
define FF_TBLS           = 'x'
define TEMPTBL           = 'x'

define PREFIX            = '@'
define DB_VERSION        = '10'
define INSTALL_TYPE      = 'DEVINS'
define ADM_PWD           = 'x'
define TIMING_ALL_VALUES = ""


column foo3 new_val LOG1
select 'installdev'||to_char(sysdate,'YYYY-MM-DD_HH24-MI-SS')||'.log' foo3 from sys.dual;
spool ^LOG1

prompt . ORACLE
prompt .
prompt . Oracle APEX Installation (DEV).
prompt .........................................
prompt .

--==============================================================================
@^PREFIX.core/scripts/timing_start.sql "Bootstrapping"

Rem  Check prerequisites. Installation will not continue if prerequisites are not met.
@^PREFIX.core/scripts/set_appun.sql
@^PREFIX.core/scripts/apxprereq.sql ^INSTALL_TYPE ^APPUN ^DATTS ^FF_TBLS "^TEMPTBL" 1,2,3

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
--==============================================================================
begin
    ^APPUN..wwv_install_api.begin_install (
        p_install_type => '^INSTALL_TYPE.',
        p_schema       => '^APPUN' );
    ^APPUN..wwv_install_api.begin_phase (
        p_phase        => 1 );
end;
/
set errorlogging on table ^APPUN..WWV_INSTALL_ERRORS

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Core Grants"

@^PREFIX.core/core_grants.sql

column :img_prefix new_value IMGPR NOPRINT
variable img_prefix varchar2(255)
begin
    :img_prefix := ^APPUN..wwv_flow_global.g_image_prefix;
end;
/
select :img_prefix from sys.dual;

@^PREFIX.devins.sql ^LOG1 ^APPUN "^TEMPTBL" ^IMGPR ^DATTS ^FF_TBLS ^ADM_PWD ^PREFIX
--==============================================================================
@^PREFIX.core/scripts/timing_start.sql "Dropping Public Synonyms"
begin
    wwv_flow_upgrade.drop_public_synonyms();
end;
/
@^PREFIX.core/scripts/timing_stop.sql
--==============================================================================
--@^PREFIX.core/scripts/install_action.sql "Creating Private Synonyms"
@^PREFIX.core/scripts/timing_start.sql "Creating Private Synonyms"
begin
    wwv_flow_upgrade.create_private_synonyms('^APPUN');
end;
/
--@^PREFIX.core/scripts/install_action.sql "Creating Public Synonyms"
@^PREFIX.core/scripts/timing_start.sql "Creating Public Synonyms"
begin
    wwv_flow_upgrade.create_public_synonyms('^APPUN');
end;
/
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Compiling ^APPUN"


begin
    sys.dbms_utility.compile_schema( '^APPUN', false );
end;
/

begin
    wwv_flow_upgrade.grant_public_synonyms('^APPUN');
end;
/
@^PREFIX.core/scripts/reset_state_and_show_invalid.sql SYS,FLOWS_FILES,^APPUN

@^PREFIX.appins.sql
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Creating Dev-Only Jobs"

begin
    wwv_flow_upgrade.create_dev_jobs('^APPUN');
end;
/
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Updating App Owner/Version"
update wwv_flows
   set owner = '^APPUN',
       flow_version = case when id in (4550) then '&PRODUCT_NAME.'
                           else '&PRODUCT_NAME. ' || wwv_flows_release
                      end
 where id between 4000 and 4999;

commit;
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Validating Installation"
exec sys.validate_apex;

--==============================================================================
@^PREFIX.core/scripts/timing_stop.sql
begin
    ^APPUN..wwv_install_api.end_phase (
        p_phase       => 1,
        p_raise_error => false );
    ^APPUN..wwv_install_api.end_install;
end;
/
--==============================================================================
-- exit
--

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    if instr('^INSTALL_TYPE','APPCONTAINER') <> 1 then
        execute immediate 'alter session set "_ORACLE_SCRIPT"=false';
    end if;
exception
    when invalid_alter_priv then
        null;
end;
/

spool off

column global_name new_value gname
set termout off
select user global_name from sys.dual;
set termout on
set heading on
set feedback on
set sqlprompt '^gname> '

