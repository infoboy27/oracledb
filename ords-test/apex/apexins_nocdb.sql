Rem  Copyright (c) 2004, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apexins_nocdb.sql
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
Rem      DO NOT RUN THIS SCRIPT DIRECTLY. It is invoked by apexins.sql and apexins[123].sql.
Rem
Rem    Arguments:
Rem     Position 1: Name of tablespace for Oracle APEX application user
Rem     Position 2: Name of tablespace for Oracle APEX files user
Rem     Position 3: Name of temporary tablespace or tablespace group
Rem     Position 4: Virtual directory for APEX images
Rem     Position 5: Upgrade phases to run. Comma separated list with values
Rem                 1 ... just install APEX schema and objects
Rem                 2 ... limited access: disable builder in old schema, copy metadata and install new internal apps
Rem                 3 ... no access: copy user and file related objects
Rem
Rem    Example:
Rem
Rem    1)Local
Rem      sqlplus "sys/syspass as sysdba" @apexins_nocdb SYSAUX SYSAUX TEMP /i/ 1,2,3
Rem
Rem    2)With connect string
Rem      sqlplus "sys/syspass@10g as sysdba" @apexins_nocdb SYSAUX SYSAUX TEMP /i/ 1,2,3
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  09/10/2004 - Created

alter session set nls_length_semantics = byte;

set define '^'
set concat on
set concat .
set verify off
set termout off
spool off
set termout on

define DATTS             = '^1'
define FF_TBLS           = '^2'
define TEMPTBL           = '^3'
define IMGPR             = '^4'
define PHASES            = '^5'

define PREFIX            = '@'
define DB_VERSION        = '10'
define INSTALL_TYPE      = 'MANUAL'
define TIMING_ALL_VALUES = ""

column foo3 new_val LOG1
select 'install'||to_char(sysdate,'YYYY-MM-DD_HH24-MI-SS')||'.log' as foo3 from sys.dual;

define LOG2 = ^LOG1.english.log
define LOG3 = ^LOG1.english.bad
spool ^LOG1

prompt . ORACLE
prompt .
prompt . Oracle APEX Installation.
prompt ..........................................
prompt .

Rem  Check prerequisites. Installation will not continue if prerequisites are not met.
@^PREFIX.core/scripts/set_appun.sql
@^PREFIX.core/scripts/apxprereq.sql ^INSTALL_TYPE ^APPUN ^DATTS ^FF_TBLS "^TEMPTBL" ^PHASES
@^PREFIX.core/scripts/gen_adm_pwd.sql
@^PREFIX.core/scripts/timing_start.sql "Complete Installation"
column SCRIPT noprint new_value SCRIPT
--==============================================================================
-- phase 1
--==============================================================================
prompt Phase 1 (Installation)
@^PREFIX.core/scripts/timing_start.sql "Phase 1 (Installation)"
set termout off
select case when instr('^PHASES','1') > 0 then 'coreins.sql' else 'core/null1.sql' end SCRIPT from sys.dual;
set termout on
@^PREFIX.^SCRIPT ^LOG1 ^APPUN "^TEMPTBL" ^IMGPR ^DATTS ^FF_TBLS ^ADM_PWD ^PREFIX ^INSTALL_TYPE
@^PREFIX.core/scripts/timing_stop.sql
--==============================================================================
-- phase 2
--==============================================================================
prompt Phase 2 (Upgrade)
@^PREFIX.core/scripts/timing_start.sql "Phase 2 (Upgrade)"
set termout off
select case when instr('^PHASES','2') > 0 then 'coreins2.sql' else 'core/null1.sql' end SCRIPT from sys.dual;
set termout on
@^PREFIX.^SCRIPT NO ^APPUN ^PREFIX ^INSTALL_TYPE
set termout off
select case when instr('^PHASES','2') > 0 then 'coreins3.sql' else 'core/null1.sql' end SCRIPT from sys.dual;
set termout on
@^PREFIX.^SCRIPT NO ^APPUN ^PREFIX ^INSTALL_TYPE
set termout off
select case when instr('^PHASES','2') > 0 then 'coreins4.sql' else 'core/null1.sql' end SCRIPT from sys.dual;
set termout on
@^PREFIX.^SCRIPT NO ^APPUN ^PREFIX ^INSTALL_TYPE
@^PREFIX.core/scripts/timing_stop.sql
--==============================================================================
-- phase 3
--==============================================================================
prompt Phase 3 (Switch)
@^PREFIX.core/scripts/timing_start.sql "Phase 3 (Switch)"
set termout off
select case when instr('^PHASES','3') > 0 then 'coreins5.sql' else 'core/null1.sql' end SCRIPT from sys.dual;
set termout on
@^PREFIX.^SCRIPT NO ^APPUN ^PREFIX ^INSTALL_TYPE
@^PREFIX.core/scripts/timing_stop.sql
@^PREFIX.core/scripts/timing_stop.sql

spool off


