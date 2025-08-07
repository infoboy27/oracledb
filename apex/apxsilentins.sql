Rem  Copyright (c) 2004, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxsilentins.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 11.2.0.4 or later
Rem
Rem    Arguments:
Rem     Position 1: Name of tablespace for Oracle APEX application user
Rem     Position 2: Name of tablespace for Oracle APEX files user
Rem     Position 3: Name of temporary tablespace or tablespace group
Rem     Position 4: Virtual directory for APEX images
Rem     Position 5: password for APEX_PUBLIC_USER
Rem     Position 6: password for APEX_LISTENER
Rem     Position 7: password for APEX_REST_PUBLIC_USER
Rem     Position 8: password for the APEX internal ADMIN user
Rem
Rem
Rem    Example:
Rem
Rem    1)Local
Rem      sqlplus "sys/syspass as sysdba" @apxsilentins SYSAUX SYSAUX TEMP /i/ Passw0rd!1 Passw0rd!2 Passw0rd!3 Passw0rd!4
Rem
Rem    2)With connect string
Rem      sqlplus "sys/syspass@10g as sysdba" @apxsilentins SYSAUX SYSAUX TEMP /i/ Passw0rd!1 Passw0rd!2 Passw0rd!3 Passw0rd!4
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   05/22/2019 - Created

set define '^'
set concat on
set concat .
set verify off

define DATTS        = '^1'
define FF_TBLS      = '^2'
define TEMPTBL      = '^3'
define IMGPR        = '^4'
define APXPUBPWD    = '^5'
define APXLISTPWD   = '^6'
define APXRESTPWD   = '^7'
define APXADMINPWD  = '^8'

define PREFIX            = '@'

--
-- convert ^PASSWD* into bind variables
--
variable PASSWD1 varchar2(128)
variable PASSWD2 varchar2(128)
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
call wwv_flow_assign_pwd(:PASSWD2,'^APXADMINPWD');
alter session set cursor_sharing=exact;
drop procedure wwv_flow_assign_pwd;

@^PREFIX.core/scripts/set_appun.sql
@^PREFIX.core/scripts/apxpreins.sql

@^PREFIX.apexins_nocdb.sql ^DATTS ^FF_TBLS "^TEMPTBL" ^IMGPR 1,2,3

column foo3 new_val LOG1
select 'configure'||to_char(sysdate,'YYYY-MM-DD_HH24-MI-SS')||'.log' as foo3 from sys.dual;

spool ^LOG1

set define '^'
set concat on
set concat .
set verify off

@^PREFIX.core/scripts/timing_start.sql "APEX Configuration"

@^PREFIX.core/scripts/set_appun.sql
@^PREFIX.core/scripts/apxpreins.sql

declare
    l_stmt         varchar2(32767);
begin

    l_stmt := 'ALTER USER APEX_PUBLIC_USER IDENTIFIED BY '||
        sys.dbms_assert.enquote_name(:PASSWD1,false)||' ACCOUNT UNLOCK';
    execute immediate l_stmt;
end;
/

alter session set current_schema = ^APPUN;

col user_id       noprint new_value M_USER_ID
col email_address noprint new_value M_EMAIL_ADDRESS
set termout off
select rtrim(min(user_id))       user_id,
       nvl (
           rtrim(min(email_address)),
           'ADMIN' )        email_address
  from wwv_flow_fnd_user
 where security_group_id = 10
   and user_name         = upper('ADMIN')
/

set termout on

declare
    c_user_id  constant number         := to_number( '^M_USER_ID.' );
    c_username constant varchar2(4000) := 'ADMIN';
    c_email    constant varchar2(4000) := 'admin@example.com';
    c_password constant varchar2(4000) := :PASSWD2;
    c_old_sgid constant number := wwv_flow_security.g_security_group_id;
    c_old_user constant varchar2(255) := wwv_flow_security.g_user;

    procedure cleanup
    is
    begin
        wwv_flow_security.g_security_group_id := c_old_sgid;
        wwv_flow_security.g_user              := c_old_user;
    end cleanup;
begin
    wwv_flow_security.g_security_group_id := 10;
    wwv_flow_security.g_user              := c_username;

    wwv_flow_fnd_user_int.create_or_update_user( p_user_id  => c_user_id,
                                                 p_username => c_username,
                                                 p_email    => c_email,
                                                 p_password => c_password );
    commit;
    cleanup();
exception
    when others then
        cleanup();
        raise;
end;
/

DECLARE
    ACL_PATH  VARCHAR2(4000);
    APEX_USER VARCHAR2(200);
BEGIN
    BEGIN
        SELECT
            SCHEMA
        INTO
            APEX_USER
        FROM
            DBA_REGISTRY
        WHERE
            COMP_ID = 'APEX';
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            APEX_USER := NULL;
    END;

    IF APEX_USER IS NOT NULL THEN
        -- Look for the ACL currently assigned to '*' and give the APEX user "connect" privilege if it does not have the privilege yet
        SELECT
            ACL
        INTO
            ACL_PATH
        FROM
            DBA_NETWORK_ACLS
        WHERE
            HOST = '*' AND
            LOWER_PORT IS NULL AND
            UPPER_PORT IS NULL;

        IF DBMS_NETWORK_ACL_ADMIN.CHECK_PRIVILEGE(
            ACL_PATH,
            APEX_USER,
            'connect'
        ) IS NULL THEN
            DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
                ACL_PATH,
                APEX_USER,
                TRUE,
                'connect'
            );
        END IF;
    END IF;
EXCEPTION
    -- When no ACL has been assigned to '*'.
    WHEN NO_DATA_FOUND THEN
        DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(
            'power_users.xml',
            'ACL that lets power users to connect to everywhere',
            APEX_USER,
            TRUE,
            'connect'
        );
        DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL('power_users.xml', '*');
END;
/
COMMIT;

@^PREFIX.apex_rest_config_core.sql ^PREFIX. ^APXLISTPWD ^APXRESTPWD

set define '^'

prompt
prompt ...Recompiling the Oracle APEX schemas
prompt
begin
    sys.dbms_utility.compile_schema( schema => wwv_flow.g_flow_schema_owner, compile_all => false );
    sys.dbms_utility.compile_schema( schema => 'FLOWS_FILES', compile_all => false );
end;
/

@^PREFIX.core/scripts/timing_stop.sql

spool off

