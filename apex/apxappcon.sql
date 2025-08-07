Rem  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
Rem
Rem    NAME
Rem      apxappcon.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected to an application root.
Rem
Rem
Rem    Arguments:
Rem     Position 1: Name of tablespace for Oracle APEX application user
Rem     Position 2: Name of tablespace for Oracle APEX files user
Rem     Position 3: Name of temporary tablespace or tablespace group
Rem     Position 4: Virtual directory for APEX images
Rem     Position 5: Password for APEX_PUBLIC_USER
Rem
Rem    Example:
Rem
Rem      sqlplus "sys/syspass as sysdba" @apxappcon SYSAUX SYSAUX TEMP /i/ Passw0rd!
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   04/06/2017 - Created
Rem      cneumuel  01/16/2018 - Unify calls of utility scripts (core/scripts/ *.sql)
Rem      jstraub   07/09/2018 - Call core/scripts/set_appun.sql (bug 28317943)
Rem      cneumuel  07/11/2018 - Added PREFIX parameter to coreins[24].sql
Rem      cneumuel  08/23/2018 - Call coreins.sql with UFROM parameter and coreins4 with INSTALL_TYPE (bug #28542126)
Rem      jstraub   11/07/2018 - Changed PREFIX to @
Rem      jstraub   02/08/2019 - Added application begin/end install and check for application root
Rem      jstraub   02/14/2019 - Spool the log

alter session set nls_length_semantics = byte;

set define '^'
set concat on
set concat .
set verify off
set termout off
set termout on

define DATTS             = '^1'
define FF_TBLS           = '^2'
define TEMPTBL           = '^3'
define IMGPR             = '^4'
define APXPUBPWD         = '^5'


define PREFIX            = '@'
define DB_VERSION        = '10'
define INSTALL_TYPE      = 'APPCONTAINER'
define PHASES            = '1,2,3'
define TIMING_ALL_VALUES = ""

whenever sqlerror exit
set serveroutput on size unlimited
declare
    l_app_root  varchar2(3) := 'NO';
begin
    select application_root into l_app_root
      from sys.v$containers
     where con_id = sys_context('USERENV','CON_ID');

    if l_app_root = 'NO' then
        dbms_output.put_line('This container is not an application root.');
        raise program_error;
    end if;
end;
/
whenever sqlerror continue

column foo3 new_val LOG1
select 'apxappcon'||to_char(sysdate,'YYYY-MM-DD_HH24-MI-SS')||'.log' foo3 from sys.dual;

spool ^LOG1


prompt . ORACLE
prompt .
prompt . Oracle APEX Installation.
prompt ...................................

--
-- convert ^PASSWD* into bind variables
--
variable PASSWD1 varchar2(128)
create or replace procedure wwv_flow_assign_pwd (
    p_dest out varchar2,
    p_src  in  varchar2 )
is
begin
    p_dest := p_src;
end wwv_flow_assign_pwd;
/
alter session set cursor_sharing=force;
call wwv_flow_assign_pwd(:PASSWD1,'^APXPUBPWD');
alter session set cursor_sharing=exact;
drop procedure wwv_flow_assign_pwd;

@^PREFIX.core/scripts/set_appun.sql
@^PREFIX.core/scripts/set_ufrom_and_upgrade.sql

@^PREFIX.core/scripts/apxprereq.sql ^INSTALL_TYPE ^APPUN ^DATTS ^FF_TBLS "^TEMPTBL" ^PHASES

set termout off
column ADM_PWD new_value ADM_PWD
select dbms_random.string('X',30) ADM_PWD from sys.dual;

column APPVER new_value APPVER
select substr('^APPUN',6,2) || '.' || substr('^APPUN',9,1) APPVER from sys.dual;

column APPFROM new_value APPFROM
select app_version APPFROM from sys.dba_applications where app_name = 'APEX';

column INSTYPE new_value INSTYPE
select decode('^UPGRADE','1','INSTALL','UPGRADE') INSTYPE from sys.dual;

column INSBEGSTR new_value INSBEGSTR
select decode('^UPGRADE','1','^INSTYPE ''^APPVER''','^INSTYPE ''^APPFROM'' TO ''^APPVER''') INSBEGSTR from sys.dual;

column INSENDSTR new_value INSENDSTR
select decode('^UPGRADE','1','INSTALL','UPGRADE TO') INSENDSTR from sys.dual;
set termout on

@^PREFIX.core/scripts/timing_start.sql "Complete Installation"
ALTER PLUGGABLE DATABASE APPLICATION apex BEGIN ^INSBEGSTR;

@^PREFIX.coreins.sql ^LOG1 ^APPUN "^TEMPTBL" ^IMGPR ^DATTS ^FF_TBLS ^ADM_PWD ^PREFIX ^INSTALL_TYPE
@^PREFIX.coreins2.sql NO ^APPUN ^PREFIX ^INSTALL_TYPE
@^PREFIX.coreins3.sql NO ^APPUN ^PREFIX ^INSTALL_TYPE
@^PREFIX.coreins4.sql NO ^APPUN ^PREFIX ^INSTALL_TYPE
@^PREFIX.coreins5.sql NO ^APPUN ^PREFIX ^INSTALL_TYPE

declare
    l_stmt         varchar2(32767);
begin
    if '^UPGRADE' = 1 then
        l_stmt := 'ALTER USER APEX_PUBLIC_USER IDENTIFIED BY '||
            sys.dbms_assert.enquote_name(:PASSWD1,false)||' ACCOUNT UNLOCK';
        execute immediate l_stmt;
    end if;
end;
/

ALTER PLUGGABLE DATABASE APPLICATION apex END ^INSENDSTR '^APPVER';
@^PREFIX.core/scripts/timing_stop.sql

spool off

set define '&'
