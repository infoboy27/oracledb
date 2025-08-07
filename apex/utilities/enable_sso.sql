Rem  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
Rem
Rem    NAME
Rem      enable_sso.sql
Rem
Rem    DESCRIPTION
Rem      Enable Single Sign On for Oracle APEX.
Rem
Rem    NOTES
Rem
Rem      - This utility should be run via SQL*Plus and connected as SYS.
Rem      - This utility will also recompile the entire Oracle APEX schema
Rem
Rem      - *IMPORTANT* This script requries you to copy the following four files from
Rem      - the core directory, a peer of the utilities directory:
Rem      - custom_auth_sso_902.sql, custom_auth_sso_902.plb, custom_auth_sso.sql,
Rem      - custom_auth_sso.plb
Rem
Rem      - This utility should not be run on an active Oracle APEX instance.
Rem        If need be, the database should be started in RESTRICT mode.
Rem
Rem    Arguments:
Rem      None - The user will be prompted for the SSO SDK Schema
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jstraub    04/17/2008 - Created
Rem      jstraub    07/15/2010 - Updated APPUN to APEX_040000 and added steps per note 562807.1 (bug 9892637)
Rem      jkallman   08/02/2011 - Updated APPUN to APEX_040100
Rem      jkallman   09/11/2012 - Updated APPUN to APEX_040200
Rem      jkallman   12/17/2012 - Updated APPUN to APEX_050000
Rem      msewtz     07/07/2015 - Updated APPUN to APEX_050100
Rem      hfarrel    01/31/0217 - Updated APPUN to APEX_050200
Rem      cneumuel   01/17/2018 - avoid hard-coded APEX schema name

set define '&'
set concat on
set concat .
set verify off
set termout on

col APPUN noprint new_val APPUN
exec sys.dbms_registry.set_session_namespace (namespace   => 'DBTOOLS');
select sys.dbms_registry.schema('APEX') APPUN from sys.dual;

prompt
prompt
accept SSOUSR CHAR prompt 'Enter the schema name where the SSO SDK is installed '

prompt ...enabling SSO

whenever sqlerror exit

declare
    l_fnd boolean := false;
begin
    for c1 in (select null
                 from sys.dba_users
                where username = upper('&SSOUSR') ) loop
        l_fnd := true;
    end loop;
    if not l_fnd then
        raise_application_error(-20001,'&SSOUSR does not exist');
    end if;
end;
/
declare
    l_fnd boolean := false;
begin
    for c1 in (select null
                 from sys.all_arguments
                where package_name = 'WWSEC_SSO_ENABLER_PRIVATE'
                  and object_name = 'PARSE_URL_COOKIE'
                  and owner = upper('&SSOUSR') ) loop
        l_fnd := true;
    end loop;
    if not l_fnd then
        raise_application_error(-20001,'SSO SDK does not exist');
    end if;
end;
/

alter session set current_schema = &SSOUSR;

prompt
prompt ...Grant execute on WWSEC_SSO_ENABLER_PRIVATE to Oracle APEX Schema
prompt

grant execute on WWSEC_SSO_ENABLER_PRIVATE to &APPUN;
grant select on wwsec_enabler_config_info$ to &APPUN;

alter session set current_schema = &APPUN;

prompt
prompt ...Create private synonym for WWSEC_SSO_ENABLER_PRIVATE
prompt

begin
    execute immediate 'drop synonym WWSEC_SSO_ENABLER_PRIVATE';
exception when others then null;
end;
/

begin
    execute immediate 'drop synonym wwsec_enabler_config_info$';
exception when others then null;
end;
/

create synonym wwsec_enabler_config_info$ for &SSOUSR..wwsec_enabler_config_info$;
create synonym WWSEC_SSO_ENABLER_PRIVATE for &SSOUSR..WWSEC_SSO_ENABLER_PRIVATE;

prompt
prompt ...Compile the proper custom_auth_sso package based on number of arguments
prompt

column temp new_val SSO_SQL
set termout off
select (case when exists (select object_name from sys.all_arguments where package_name='WWSEC_SSO_ENABLER_PRIVATE'
                                  and object_name='PARSE_URL_COOKIE' and position = 9)
                       then 'custom_auth_sso_902' -- compile new version if PARSE_URL_COOKIE has more than 8 arguments (new SSO SDK)
                       else 'custom_auth_sso' end -- compile old version if PARSE_URL_COOKIE has fewer than 9 arguments (old SSO SDK)
       ) temp
from sys.dual;

set termout on

@@&SSO_SQL..sql

set define '&'

@@&SSO_SQL..plb

set define '&'

prompt
prompt ...Grant to APEX_PUBLIC_USER, *NOTE* If you are using EPG, grant to ANONYMOUS
prompt

grant execute on wwv_flow_custom_auth_sso to APEX_PUBLIC_USER;

prompt
prompt ...Creating wwv_flow_custom_auth_sso synonym
prompt
begin
    execute immediate 'drop public synonym wwv_flow_custom_auth_sso';
exception when others then null;
end;
/

create public synonym wwv_flow_custom_auth_sso for &APPUN..wwv_flow_custom_auth_sso;

prompt
prompt ...Recompiling the Oracle APEX schema
prompt
begin
    sys.dbms_utility.compile_schema(schema => '&APPUN', compile_all => FALSE);
end;
/


prompt
prompt Enabling Single Sign On for Oracle APEX complete
prompt

exit;
