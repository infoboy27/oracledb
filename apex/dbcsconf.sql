Rem  Copyright (c) 1999, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      dbcsconf.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem
Rem    Arguments:
Rem     Position 1: DBCS password
Rem     Position 2: Virtual directory for APEX images
Rem
Rem    Example:
Rem
Rem    1)Local
Rem      sqlplus "sys/syspass as sysdba" @dbcsconf Passw0rd! /i/
Rem
Rem    2)With connect string
Rem      sqlplus "sys/syspass@10g as sysdba" @dbcsconf Passw0rd! /i/
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   04/02/2018 - Created
Rem      cneumuel  07/11/2018 - Added prefix parameter to apex_rest_config_core.sql (bug #28315666)

set define '^'
set concat on
set concat .
set verify off


define OPC_PASSWORD      = '^1'
define IMGPRE            = '^2'

define PREFIX            = '@'


@^PREFIX.core/scripts/set_appun.sql
@^PREFIX.core/scripts/apxpreins.sql

set define '^'

Rem from dbtools_apex_schema_passwords_reset.sql

alter session set current_schema = ^APPUN;

declare
    c_password constant varchar2(4000) := trim('^OPC_PASSWORD.');
    c_pass_enq constant varchar2(4000) := wwv_flow_assert.enquote_name(c_password);
begin
    if c_password is not null then
        execute immediate 'alter user APEX_PUBLIC_USER IDENTIFIED BY ' || c_pass_enq || ' ACCOUNT UNLOCK';
        execute immediate 'alter user APEX_REST_PUBLIC_USER IDENTIFIED BY ' || c_pass_enq || ' ACCOUNT UNLOCK';
        execute immediate 'alter user APEX_LISTENER IDENTIFIED BY ' || c_pass_enq || ' ACCOUNT UNLOCK';
    end if;
end;
/

Rem from dbtools_apex_password_policy_config.sql

prompt Starting APEX Password Policy Configuration

declare
    c_password constant varchar2(4000) := trim('^OPC_PASSWORD.');
begin
    if c_password is null then
        -- APEX upgrade, don't reset password policies
        return;
    end if;

    APEX_INSTANCE_ADMIN.SET_PARAMETER( 'PASSWORD_MIN_LENGTH', 8 );
    APEX_INSTANCE_ADMIN.SET_PARAMETER( 'STRONG_SITE_ADMIN_PASSWORD', 'Y' );
    APEX_INSTANCE_ADMIN.SET_PARAMETER( 'SERVICE_ADMIN_PASSWORD_NOT_LIKE_WS_NAME', 'N' );
    APEX_INSTANCE_ADMIN.SET_PARAMETER( 'SERVICE_ADMIN_PASSWORD_ONE_PUNCTUATION', 'N' );
    COMMIT;
end;
/

prompt APEX password policy configuration complete

Rem from dbtools_apxchpwd.sql

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

declare
    c_user_id  constant number         := to_number( '^M_USER_ID.' );
    c_username constant varchar2(4000) := 'ADMIN';
    c_email    constant varchar2(4000) := 'admin@example.com';
    c_password constant varchar2(4000) := trim('^OPC_PASSWORD.');
    c_old_sgid constant number := wwv_flow_security.g_security_group_id;
    c_old_user constant varchar2(255) := wwv_flow_security.g_user;

    procedure cleanup
    is
    begin
        wwv_flow_security.g_security_group_id := c_old_sgid;
        wwv_flow_security.g_user              := c_old_user;
    end cleanup;
begin
    if c_password is null then
        -- APEX upgrade, don't reset password policies
        return;
    end if;

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

Rem from dbtools_apex_rest_config_cdb.sql
@^PREFIX.apex_rest_config_core.sql "^PREFIX." "^OPC_PASSWORD." "^OPC_PASSWORD."

Rem from dbtools_reset_image_prefix_con.sql
@^PREFIX.utilities/reset_image_prefix_core.sql ^IMGPRE x
set define '^'

prompt
prompt ...Configuring Oracle APEX instance parameters
prompt

begin
    wwv_flow_platform.set_preference( p_preference_name  => 'CHECK_FOR_UPDATES',
                                      p_preference_value => 'N' );
    commit;
end;
/

prompt
prompt ...Applying languages
prompt
set define '^'

@^PREFIX.builder/ar/load_ar.sql
@^PREFIX.builder/cs/load_cs.sql
@^PREFIX.builder/da/load_da.sql
@^PREFIX.builder/de/load_de.sql
@^PREFIX.builder/el/load_el.sql
@^PREFIX.builder/es/load_es.sql
@^PREFIX.builder/fi/load_fi.sql
@^PREFIX.builder/fr/load_fr.sql
@^PREFIX.builder/fr-ca/load_fr-ca.sql
@^PREFIX.builder/he/load_he.sql
@^PREFIX.builder/hr/load_hr.sql
@^PREFIX.builder/hu/load_hu.sql
@^PREFIX.builder/is/load_is.sql
@^PREFIX.builder/it/load_it.sql
@^PREFIX.builder/ja/load_ja.sql
@^PREFIX.builder/ko/load_ko.sql
@^PREFIX.builder/nl/load_nl.sql
@^PREFIX.builder/no/load_no.sql
@^PREFIX.builder/pl/load_pl.sql
@^PREFIX.builder/pt/load_pt.sql
@^PREFIX.builder/pt-br/load_pt-br.sql
@^PREFIX.builder/ro/load_ro.sql
@^PREFIX.builder/ru/load_ru.sql
@^PREFIX.builder/sk/load_sk.sql
@^PREFIX.builder/sl/load_sl.sql
@^PREFIX.builder/sr/load_sr.sql
@^PREFIX.builder/sr-latn/load_sr-latn.sql
@^PREFIX.builder/sv/load_sv.sql
@^PREFIX.builder/th/load_th.sql
@^PREFIX.builder/tr/load_tr.sql
@^PREFIX.builder/zh-cn/load_zh-cn.sql
@^PREFIX.builder/zh-tw/load_zh-tw.sql

prompt
prompt ...Applying languages Completed
prompt
