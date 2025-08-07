Rem  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      coreins.sql
Rem
Rem    DESCRIPTION
Rem      This is the primary installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by apexins.sql, the primary installation script for APEX.
Rem
Rem    NOTES
Rem      Ensure that all arguments (except image prefix) are entered in UPPERCASE.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem
Rem    Arguments:
Rem      1 - LOG1         = Installation log file
Rem      2 - APPUN        = APEX schema name
Rem      3 - TEMPTBL      = Temporary tablespace
Rem      4 - IMGPR        = Image prefix
Rem      5 - DATTS        = APEX tablespace
Rem      6 - FF_TBLS      = APEX files tablespace
Rem      7 - ADM_PWD      = APEX administrator password
Rem      8 - PREFIX       = Path prefix for files
Rem      9 - INSTALL_TYPE = Full development environment or runtime only
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   08/14/2000 - Created

set define '^'
set concat on
set concat .
set verify off
set autocommit off
set feedback off
set serveroutput on size unlimited format wrapped

define LOG1      = '^1'
define APPUN     = '^2'
define TEMPTBL   = '^3'
define IMGPR     = '^4'
define DATTS     = '^5'
define FF_TBLS   = '^6'
define ADM_PWD   = '^7'
define PREFIX    = '^8'
define INSTALL_TYPE = '^9'

--==============================================================================
prompt #
prompt # Bootstrapping
prompt #
@^PREFIX.core/scripts/timing_start.sql "Bootstrapping"

@^PREFIX.core/scripts/apxsqler.sql ^INSTALL_TYPE

prompt ...setting session environment
declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    if instr('^INSTALL_TYPE','APPCONTAINER') <> 1 then
        execute immediate 'alter session set "_ORACLE_SCRIPT"=true';
    end if;
exception
    when invalid_alter_priv then
        null;
end;
/

prompt ...Configuring SHARING clause
column :sharing_clause noprint new_value SHARING
variable sharing_clause varchar2(30)
declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    if '^INSTALL_TYPE' in ('APPCONTAINEREXT','CLOUDEXT') then
        -- Determine if this database supports no capture, set
        -- SHARING = EXTENDED DATA if so.
        execute immediate 'alter session set "_force_no_capture"=false';
        :sharing_clause := 'SHARING=EXTENDED DATA';
        sys.dbms_output.put_line('...will use EXTENDED DATA');
    else
        :sharing_clause := '';
    end if;
exception
    when invalid_alter_priv then
        :sharing_clause := '';
        sys.dbms_output.put_line('...will not use EXTENDED DATA');
end;
/

set termout off
select :sharing_clause from sys.dual;
set termout on

prompt ...Creating users
--
-- run with cursor_sharing=force to avoid leaking a password in v$sql
--
alter session set cursor_sharing=force;
declare
    c_appun            constant varchar2(11) := '^APPUN';
    c_datts            constant varchar2(30) := '^DATTS';
    l_tmp_ts           varchar2(30);
    l_profile          varchar2(128);
    l_has_apex_user    number;
    l_has_files_user   number;
    l_has_pub_user     number;
    l_has_pub_router   number;
--------------------------------------------------------------------------------
    procedure create_user (
        p_username        in varchar2,
        p_default_ts      in varchar2,
        p_temp_ts         in varchar2,
        p_profile         in varchar2 default null,
        p_quota_unlimited in boolean,
        p_locked          in boolean default true )
    is
        invalid_option  exception;
        pragma exception_init(invalid_option, -922);
        l_stmt varchar2(4000);
    begin
        sys.dbms_output.put_line('...create user '||p_username);
        begin
            l_stmt := 'create user '||
                      p_username||
                      ' no authentication ' || case when p_locked then
                      'account lock ' else null end || 'default tablespace '||
                      p_default_ts||
                      ' temporary tablespace '||
                      p_temp_ts;
            if p_quota_unlimited then
                l_stmt := l_stmt||
                          ' quota unlimited on '||
                          p_default_ts;
            end if;
            if p_profile is not null then
                l_stmt := l_stmt||
                          ' profile #PROFILE#';
            end if;
            execute immediate replace( l_stmt, '#PROFILE#', p_profile );
        exception when invalid_option then
            l_stmt := 'create user '||p_username||
                      ' identified by "#ADM_PWD#"'||
                      ' password expire account lock default tablespace '||
                      p_default_ts||
                      ' temporary tablespace '||
                      p_temp_ts;
            if p_quota_unlimited then
                l_stmt := l_stmt||
                          ' quota unlimited on '||
                          p_default_ts;
            end if;
            if p_profile is not null then
                l_stmt := l_stmt||
                          ' profile #PROFILE#';
            end if;
            execute immediate replace( replace (
                                  l_stmt,
                                  '#ADM_PWD#',
                                  '^ADM_PWD' ), '#PROFILE#', p_profile );
        end;
    exception when others then
        sys.dbms_output.put_line(l_stmt);
        raise;
    end create_user;
--------------------------------------------------------------------------------
    procedure do_grant (
        p_what     in varchar2,
        p_username in varchar2 )
    is
    begin
        execute immediate 'grant '||p_what||' to '||p_username;
    exception when others then
        raise_application_error (
            -20001,
            'Can not grant '||p_what||' to '||p_username||': '||sqlerrm);
    end do_grant;

--------------------------------------------------------------------------------
    -- APEX_PUBLIC_USER and APEX_PUBLIC_ROUTER need the same grants
    --
    -- In most cases create session is all that either user requires
    --
    -- However if common packages are revoked from public (ex: "revoke execute on dbms_lob from public")
    -- an error will be raised when a user access the page.
    --
    -- Reason: ORDS will run code as the user to process htp buffer which uses dbms_lob, htp, owa, etc.
    --
    procedure do_grant_pub_user(
        p_username                  in varchar2,
        p_grant_inherit_priv_to_pub in boolean default false )
    is
    begin
        -- Extra check to ensure this is only called for APEX_PUBLIC_USER and APEX_PUBLIC_ROUTER
        if p_username not in ('APEX_PUBLIC_USER', 'APEX_PUBLIC_ROUTER') then
            raise_application_error (
                -20001,
                'do_grant_pub_user only meant for APEX_PUBLIC_USER and APEX_PUBLIC_ROUTER. Called for: ' || p_username);
        end if;

        do_grant (
            p_what     => 'create session',
            p_username => p_username );
        do_grant (
            p_what     => 'execute on sys.dbms_lob',
            p_username => p_username );
        do_grant (
            p_what     => 'execute on sys.dbms_session',
            p_username => p_username );
        do_grant (
            p_what     => 'execute on sys.dbms_utility',
            p_username => p_username );
        do_grant (
            p_what     => 'execute on sys.htp',
            p_username => p_username );
        do_grant (
            p_what     => 'execute on sys.owa',
            p_username => p_username );
        do_grant (
            p_what     => 'execute on sys.owa_util',
            p_username => p_username );
        do_grant (
            p_what     => 'execute on sys.wpg_docload',
            p_username => p_username );
        do_grant (
            p_what     => 'execute on sys.wpiutl',
            p_username => p_username );

        if p_grant_inherit_priv_to_pub then
            do_grant (
                p_what     => 'inherit privileges on user ' || p_username,
                p_username => 'public' );
        end if;

    end do_grant_pub_user;
--------------------------------------------------------------------------------
begin
    select nvl(sum(case when username = c_appun              then 1 end),0),
           nvl(sum(case when username = 'APEX_PUBLIC_USER'   then 1 end),0),
           nvl(sum(case when username = 'FLOWS_FILES'        then 1 end),0),
           nvl(sum(case when username = 'APEX_PUBLIC_ROUTER' then 1 end),0)
      into l_has_apex_user,
           l_has_pub_user,
           l_has_files_user,
           l_has_pub_router
      from sys.dba_users
     where username in (c_appun, 'FLOWS_FILES', 'APEX_PUBLIC_USER','APEX_PUBLIC_ROUTER');

    select nvl('^TEMPTBL',tts.temp_ts) into l_tmp_ts
      from (select rownum, temp_ts
              from (select u.temporary_tablespace temp_ts
                     from sys.dba_users u
                    where u.username = (select schema from sys.dba_registry where comp_id = 'APEX' and rownum = 1)
                    union
                   select property_value temp_ts
                     from sys.DATABASE_PROPERTIES
                    where PROPERTY_NAME='DEFAULT_TEMP_TABLESPACE')
             where rownum < 2
             order by rownum) tts;

    if l_has_pub_user = 1 then
        select profile into l_profile
          from sys.dba_users
         where username = 'APEX_PUBLIC_USER';
    end if;
    --
    -- create APEX_nnnnnnn
    --
    if l_has_apex_user = 0 then
        create_user (
            p_username        => c_appun,
            p_default_ts      => c_datts,
            p_temp_ts         => l_tmp_ts,
            p_quota_unlimited => true );
    end if;
    --
    -- create FLOWS_FILES
    --
    if l_has_files_user = 0 then
        create_user (
            p_username        => 'FLOWS_FILES',
            p_default_ts      => '^FF_TBLS',
            p_temp_ts         => l_tmp_ts,
            p_quota_unlimited => true );
    else
        --
        -- remove too powerful privileges that older versions granted
        --
        begin
            execute immediate 'revoke connect from flows_files';
        exception when others then null;
        end;
        begin
            execute immediate 'revoke create any synonym from flows_files';
        exception when others then null;
        end;
        begin
            execute immediate 'revoke create public synonym from flows_files';
        exception when others then null;
        end;
    end if;
    do_grant (
        p_what     => 'create synonym',
        p_username => 'FLOWS_FILES' );
    --
    -- create APEX_PUBLIC_USER
    --
    if '^INSTALL_TYPE' not in ('INTERNAL','CLOUD','CLOUDEXT') then
        if l_has_pub_user = 0 then
            create_user (
                p_username        => 'APEX_PUBLIC_USER',
                p_default_ts      => c_datts,
                p_temp_ts         => l_tmp_ts,
                p_quota_unlimited => false );
        end if;

        do_grant_pub_user(
            p_username => 'APEX_PUBLIC_USER' );
    end if;
    --
    -- create APEX_PUBLIC_ROUTER
    --
    if sys_context('userenv','con_name') != 'CDB$ROOT' then
        if l_has_pub_router = 0 then
            create_user (
                p_username        => 'APEX_PUBLIC_ROUTER',
                p_default_ts      => c_datts,
                p_temp_ts         => l_tmp_ts,
                p_profile         => case when l_profile = 'DEFAULT' then null else l_profile end,
                p_quota_unlimited => false,
                p_locked          => false
            );
        end if;

        do_grant_pub_user(
            p_username                  => 'APEX_PUBLIC_ROUTER',
            -- #36925895: Need to grant inherit privlege to APEX_PUBLIC_ROUTER as ords.enable_schema requires it.
            p_grant_inherit_priv_to_pub => true );
    end if;
end;
/
alter session set cursor_sharing=exact;

@^PREFIX.core/core_grants.sql

prompt ...Creating ^APPUN. Install Objects
alter session set current_schema=^APPUN;
@^PREFIX.core/flows_release.sql
@^PREFIX.core/wwv_install_api.sql
@^PREFIX.core/wwv_install_tabs.sql ^APPUN
@^PREFIX.core/wwv_install_api.plb
alter session set current_schema=sys;

begin
    ^APPUN..wwv_install_api.begin_install (
        p_install_type => '^INSTALL_TYPE',
        p_schema       => '^APPUN' );
    ^APPUN..wwv_install_api.begin_phase (
        p_phase => 1 );
end;
/
set errorlogging on table ^APPUN..WWV_INSTALL_ERRORS

whenever sqlerror continue

--==============================================================================
-- APEX specific database roles and privileges for schema provisioning
--
@^PREFIX.core/scripts/install_action.sql "Creating APEX_GRANTS_FOR_NEW_USERS_ROLE"

declare
    c_grants_role constant varchar2(30) := 'APEX_GRANTS_FOR_NEW_USERS_ROLE';
    procedure create_role (
        p_role in varchar2 )
    is
        l_exists1 exception;
        pragma exception_init(l_exists1,-1921);
        l_exists2 exception;
        pragma exception_init(l_exists2,-42294);
    begin
        execute immediate 'create role '||p_role;
    exception when l_exists1 or l_exists2 then
        sys.dbms_output.put_line(p_role||' exists.');
    end create_role;
    procedure addpriv (
        p_privilege in varchar2,
        p_to        in varchar2 default c_grants_role,
        p_option    in varchar2 default null )
    is
    begin
        execute immediate 'grant '||p_privilege||' to '||p_to||' '||p_option;
    exception when others then
        sys.dbms_output.put_line(sqlerrm);
        sys.dbms_output.put_line('... when granting '||p_privilege||' to '||p_to||' '||p_option);
    end addpriv;
begin
    -- roles for privileged access to apex views and admin APIs
    create_role('APEX_ADMINISTRATOR_READ_ROLE');
    create_role('APEX_ADMINISTRATOR_ROLE');
    -- when apex creates a new workspace schema (prov.plb), it passes grants to
    -- this role on to the new schema
    create_role(c_grants_role);
    addpriv('CREATE SESSION');
    addpriv('CREATE CLUSTER');
    addpriv('CREATE DIMENSION');
    addpriv('CREATE INDEXTYPE');
    addpriv('CREATE JOB');
    addpriv('CREATE MATERIALIZED VIEW');
    addpriv('CREATE OPERATOR');
    addpriv('CREATE PROCEDURE');
    addpriv('CREATE SEQUENCE');
    addpriv('CREATE SYNONYM');
    addpriv('CREATE TABLE');
    addpriv('CREATE TRIGGER');
    addpriv('CREATE TYPE');
    addpriv('CREATE VIEW');

    -- keep version dependent privs in sync with core/validate_apex.sql
    if sys.dbms_db_version.version >= 21 then
        addpriv('EXECUTE DYNAMIC MLE');
        addpriv('EXECUTE ON SYS.JAVASCRIPT');
    end if;
    if sys.dbms_db_version.version >= 23 then
        addpriv('CREATE MLE');
        addpriv('CREATE PROPERTY GRAPH');
    end if;
    -- make sure that privileges granted to APEX_GRANTS_FOR_NEW_USERS_ROLE are
    -- granted to APPUN with grant/admin option, so APEX can re-grant them. we
    -- base this on a query instead of the static list above, because the role
    -- may have more privileges when an APEX upgrade occurs.
    for i in ( select privilege,
                      'with admin option' priv_option
                 from sys.dba_sys_privs
                where grantee = c_grants_role
                union all
               select granted_role,
                      'with admin option'
                 from sys.dba_role_privs
                where grantee = c_grants_role
               union all
              select privilege||' on '||
                     sys.dbms_assert.enquote_name(owner)||'.'||
                     sys.dbms_assert.enquote_name(table_name),
                     'with grant option'
                 from sys.dba_tab_privs
                where grantee = c_grants_role )
    loop
        addpriv (
            p_privilege => i.privilege,
            p_to        => '^APPUN',
            p_option    => i.priv_option );
    end loop;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Creating SYS Objects"

prompt ...Create validate procedure in SYS schema and start registration
@^PREFIX.core/validate_apex.sql
grant execute on sys.validate_apex to ^APPUN;

col UFROM noprint new_val UFROM
select ^APPUN..wwv_install_api.old_schema UFROM from sys.dual
/

@^PREFIX.core/wwv_dbms_sql.sql
grant execute on sys.wwv_dbms_sql_^APPUN. to ^APPUN;

@^PREFIX.core/wwv_util_apex.sql
@^PREFIX.core/wwv_util_apex.plb
grant execute on sys.wwv_util_^APPUN. to ^APPUN;
exec sys.wwv_util_^APPUN..create_key_package;

grant execute on sys.wwv_flow_key to ^APPUN;

@^PREFIX.core/wwv_flow_val.sql "^UFROM."
grant execute on sys.wwv_flow_val to ^APPUN.;

@^PREFIX.core/wwv_flow_val.plb

prompt ...CONNECT as the Oracle user who will own the Oracle APEX engine

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Creating APEX Tables"

alter session set current_schema = FLOWS_FILES;

@^PREFIX.core/flows_files_upgrade.sql

grant select,insert,update,delete,references on wwv_flow_file_objects$ to ^APPUN with grant option;

alter session set current_schema = ^APPUN;

create or replace synonym wwv_flow_file_objects$ for FLOWS_FILES.wwv_flow_file_objects$;

@^PREFIX.core/tab.sql
@^PREFIX.core/dg_tab.sql

prompt ...insert default companies
declare
    procedure ins (
        p_id                        in number,
        p_provisioning_company_id   in number,
        p_short_name                in varchar2,
        p_allow_restful_services_yn in varchar2 default 'N',
        p_schema                    in varchar2 default '^APPUN',
        p_path_prefix               in varchar2 default null )
    is
    begin
        -- Also set some default values that are normally populated in wwv_flow_companies_t1 trigger
        insert into wwv_flow_companies (
            id,
            provisioning_company_id,
            short_name,
            display_name,
            cookie_name,
            first_schema_provisioned,
            expire_fnd_user_accounts,
            account_status,
            allow_to_be_purged_yn,
            allow_restful_services_yn,
            max_email_messages,
            max_webservice_requests,
            path_prefix )
        values (
            p_id,
            p_provisioning_company_id,
            p_short_name,
            p_short_name,
            p_short_name,
            '^APPUN',
            'Y',
            'ASSIGNED',
            'N',
            p_allow_restful_services_yn,
            10000000,
            10000000,
            p_path_prefix );
        if p_schema is not null then
            insert into wwv_flow_company_schemas (id,security_group_id,schema)
            values (p_id,p_provisioning_company_id,p_schema);
        end if;
    end;
begin
    ins (
        p_id                        => 0,
        p_provisioning_company_id   => 0,
        p_short_name                => 'Unknown',
        p_schema                    => null );
    ins (
        p_id                        => 1,
        p_provisioning_company_id   => 10,
        p_short_name                => 'INTERNAL',
        p_allow_restful_services_yn => 'Y',
        p_path_prefix               => 'APEX' );
    ins (
        p_id                        => 3,
        p_provisioning_company_id   => 11,
        p_short_name                => 'COM.ORACLE.APEX.REPOSITORY' );
    ins (
        p_id                        => 4,
        p_provisioning_company_id   => 12,
        p_short_name                => 'COM.ORACLE.CUST.REPOSITORY' );
    commit;
end;
/

@^PREFIX.core/types.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing Package Specs (Runtime)"

prompt ...Create v function stub
create or replace function v ( p_item in varchar2) return varchar2 is begin return null; end;
/
show error

prompt ...Create nv function stub
create or replace function nv ( p_item in varchar2) return number is begin return null; end;
/
show error

prompt ...Database version and feature detection
@^PREFIX.core/wwv_flow_db_env_detection.sql
@^PREFIX.core/wwv_flow_db_env_detection.plb

begin
    -- this will create the wwv_flow_db_version package with boolean constants for the exact database
    -- version and existing database features
    wwv_flow_db_env_detection.generate_wwv_flow_db_version;
end;
/
sho err

--
-- Although this seems unnecessary to compile the package body of wwv_flow_image_prefix here,
-- only to later compile the body referencing the IMAGE_PREFIX platform preference, there are
-- many dependencies in this installation on the package body of wwv_flow_image_prefix. For example
-- wwv_flow_global relies on the package body, and although it will compile fine, when a trigger
-- references it during install, like the inserts in apex_install_data.sql, the trigger will fail
-- because wwv_flow_global cannot be validated without the package body of wwv_flow_image_prefix.
--
@^PREFIX.core/wwv_flow_image_prefix.sql    x x x x x x ^IMGPR x x x

column cloud new_val g_cloud
set termout off
select decode('^INSTALL_TYPE','CLOUD','true','CLOUDEXT','true','false') cloud from sys.dual;
set termout on

@^PREFIX.core/wwv_flow_global.sql ^g_cloud
@^PREFIX.core/htmldb_item.sql
@^PREFIX.core/wwv_flow_component.sql
@^PREFIX.core/flow.sql
@^PREFIX.core/wwv_flow_crypto.sql
@^PREFIX.core/wwv_flow_cgi.sql
@^PREFIX.core/wwv_flow_security.sql
@^PREFIX.core/wwv_flow_string.sql
@^PREFIX.core/wwv_flow_string_util.sql
@^PREFIX.core/wwv_flow_string_stopword.sql
@^PREFIX.core/wwv_flow_asn1.sql
@^PREFIX.core/wwv_flow_public_key_util.sql
@^PREFIX.core/wwv_flow_error_api.sql
@^PREFIX.core/wwv_flow_error.sql
@^PREFIX.core/wwv_flow_assert.sql
@^PREFIX.core/wwv_flow_exec_api.sql
@^PREFIX.core/wwv_flow_code_exec.sql
@^PREFIX.core/wwv_flow_code_exec_plsql.sql
@^PREFIX.core/wwv_flow_code_exec_mle.sql
@^PREFIX.core/wwv_flow_dynamic_exec.sql
@^PREFIX.core/wwv_flow_exec.sql
@^PREFIX.core/wwv_flow_exec_sql.sql
@^PREFIX.core/wwv_flow_pltable_util.sql
@^PREFIX.core/wwv_flow_session_state_api.sql
@^PREFIX.core/wwv_flow_t_writer.sql
@^PREFIX.core/wwv_flow_t_clob_writer.sql
@^PREFIX.core/wwv_flow_t_blob_writer.sql
@^PREFIX.core/wwv_flow_t_htp_writer.sql
@^PREFIX.core/wwv_flow_t_dbms_output_writer.sql
@^PREFIX.core/wwv_flow_t_plugin_attributes.sql
@^PREFIX.core/flowu.sql
@^PREFIX.core/flowl.sql
@^PREFIX.core/wwv_flow_debug_api.sql
@^PREFIX.core/wwv_flow_debug.sql
@^PREFIX.core/wwv_flow_escape.sql
@^PREFIX.core/wwv_htf.sql
@^PREFIX.core/wwv_htp.sql
@^PREFIX.core/wwv_flow_response.sql
@^PREFIX.core/init_htp.sql
@^PREFIX.core/meta.sql
@^PREFIX.core/template.sql
@^PREFIX.core/chart.sql
@^PREFIX.core/wwv_flow_webservices_api.sql
@^PREFIX.core/wwv_flow_plugin_api.sql
@^PREFIX.core/wwv_flow_data_export_api.sql
@^PREFIX.core/wwv_flow_page_cache_api.sql
@^PREFIX.core/wwv_flow_render_query.sql
@^PREFIX.core/wwv_flow_print_api.sql
@^PREFIX.core/wwv_flow_print_util.sql
@^PREFIX.core/wwv_flow_report_query.sql
@^PREFIX.core/wwv_flow_application_admin_api.sql
@^PREFIX.core/wwv_flow_application_install.sql
@^PREFIX.core/wwv_flow_file_api.sql
@^PREFIX.core/wwv_flow_session_state.sql
@^PREFIX.core/wwv_flow_template.sql
@^PREFIX.core/wwv_flow_mail_api.sql
@^PREFIX.core/wwv_flow_mail.sql
@^PREFIX.core/gen_api_pkg.sql
@^PREFIX.core/wwv_meta_meta_data.sql
@^PREFIX.core/wwv_flow_template_directive.sql
@^PREFIX.core/wwv_flow_plugin.sql
--
@^PREFIX.core/wwv_imp_util.sql
@^PREFIX.core/wwv_imp_workspace.sql
@^PREFIX.core/wwv_flow_imp_page.sql
@^PREFIX.core/wwv_flow_imp_shared.sql
@^PREFIX.core/wwv_flow_imp.sql
--
@^PREFIX.core/wwv_flow_file_mgr.sql
@^PREFIX.core/wwv_flow_plugin_util.sql
@^PREFIX.core/wwv_flow_legacy_plugins.sql
@^PREFIX.core/wwv_flow_markdown.sql

@^PREFIX.core/wwv_flow_epg_include_local.sql
@^PREFIX.core/wwv_flow_epg_include.sql
@^PREFIX.core/random.sql
@^PREFIX.core/wwv_id.sql
@^PREFIX.core/random.plb
@^PREFIX.core/wwv_id.plb

@^PREFIX.core/collection_member_resize.sql
@^PREFIX.core/db_webservices_tab.sql

@^PREFIX.core/column_exceptions.sql
@^PREFIX.core/meta_cleanup.sql
@^PREFIX.core/wwv_flow_sw_upgrade.sql
@^PREFIX.core/wwv_flow_upgrade.sql

@^PREFIX.core/wwv_flow_rpt_std_msg.sql

@^PREFIX.core/wwv_flow_ajax.sql
@^PREFIX.core/wwv_flow_region.sql

@^PREFIX.core/audit.sql
@^PREFIX.core/wwv_flow_user_api.sql
@^PREFIX.core/wwv_flow_workspace_user_api.sql
@^PREFIX.core/wwv_flow_fnd_user_int.sql
@^PREFIX.core/wwv_flow_fnd_user_api.sql
@^PREFIX.core/wwv_patch_applied.sql
@^PREFIX.core/wwv_flow_platform.sql

@^PREFIX.core/wwv_flow_session.sql
@^PREFIX.core/wwv_flow_session_ras.sql
@^PREFIX.core/wwv_flow_session_context.sql
@^PREFIX.core/wwv_flow_session_api.sql
@^PREFIX.core/wwv_flow_collection_int.sql

@^PREFIX.core/wwv_dg_blueprint_util_int.sql
@^PREFIX.core/wwv_dg_data_gen_api.sql

@^PREFIX.core/wwv_flow_user_interface.sql
@^PREFIX.core/wwv_flow_theme.sql
@^PREFIX.core/wwv_flow_native_item.sql
@^PREFIX.core/view.sql
@^PREFIX.core/dg_view.sql
@^PREFIX.core/wwv_flow_grid_layout.sql

@^PREFIX.core/wwv_flow_pkg_app_tab.sql

@^PREFIX.core/wwv_extension.sql
@^PREFIX.core/wwv_extension_api.sql

@^PREFIX.core/wwv_flow_ooxml.sql
@^PREFIX.core/wwv_flow_xlsx.sql
@^PREFIX.core/wwv_flow_data_export.sql
@^PREFIX.core/wwv_flow_data_export_html.sql
@^PREFIX.core/wwv_flow_data_export_csv.sql
@^PREFIX.core/wwv_flow_data_export_pdf.sql
@^PREFIX.core/wwv_flow_data_export_xlsx.sql
@^PREFIX.core/wwv_flow_data_export_xml.sql
@^PREFIX.core/wwv_flow_data_export_json.sql

@^PREFIX.core/wwv_flow_credential_api.sql
@^PREFIX.core/wwv_flow_credential.sql

@^PREFIX.core/wwv_flow_ir.sql
@^PREFIX.core/wwv_flow_ir_render.sql
@^PREFIX.core/wwv_flow_ir_ajax.sql
@^PREFIX.core/wwv_flow_ir_dialog.sql
@^PREFIX.core/wwv_flow_ir_api.sql
@^PREFIX.core/wwv_flow_instance_admin.sql
@^PREFIX.core/wwv_flow_event_metrics_int.sql

@^PREFIX.core/wwv_flow_json.sql

@^PREFIX.core/wwv_flow_fnd_developer_api.sql
@^PREFIX.core/provisioning_tables.sql
@^PREFIX.core/wwv_flow_char_reader.sql
@^PREFIX.core/wwv_flow_plsql_lexer.sql
@^PREFIX.core/wwv_flow_listener.sql

@^PREFIX.core/flow_log.sql
@^PREFIX.core/flow_dml.sql
@^PREFIX.core/wwv_flow_preference_int.sql
@^PREFIX.core/flowp.sql
@^PREFIX.core/f.sql
@^PREFIX.core/vrn.sql
@^PREFIX.core/flowc.sql
@^PREFIX.core/wwv_flow_export_api.sql
@^PREFIX.core/wwv_flow_export_int.sql
@^PREFIX.core/plug.sql
@^PREFIX.core/customize.sql
@^PREFIX.core/generic.sql
@^PREFIX.core/form.sql
@^PREFIX.core/popup_filter.sql
@^PREFIX.core/wwv_flow_builder.sql
@^PREFIX.core/shortcut.sql
@^PREFIX.core/popup.sql
@^PREFIX.core/wwv_flow_calendar.sql

@^PREFIX.core/prov.sql
@^PREFIX.core/provision.sql

@^PREFIX.core/wwv_flow_item.sql
@^PREFIX.core/tree.sql
@^PREFIX.core/tree3.sql
@^PREFIX.core/wwv_flow_button.sql
@^PREFIX.core/flow_isc.sql

@^PREFIX.core/home.sql

@^PREFIX.core/imgapi_public.sql
@^PREFIX.core/htmlapi_public.sql
@^PREFIX.core/flows_version.sql
@^PREFIX.core/collection.sql
@^PREFIX.core/z.sql
@^PREFIX.core/custom_auth_api.sql
@^PREFIX.core/custom_auth_std.sql
@^PREFIX.core/sw_api.sql
@^PREFIX.core/wwv_flow_item_help.sql
@^PREFIX.core/wwv_flow_admin_api.sql
@^PREFIX.core/flowcon.sql
@^PREFIX.core/wwv_flow_svg.sql
@^PREFIX.core/sw_util.sql
@^PREFIX.core/wwv_flow_hint.sql
@^PREFIX.core/wwv_flow_series_attr.sql
@^PREFIX.core/edit_report.sql
@^PREFIX.core/wwv_flow_app_install_int.sql
@^PREFIX.core/imp_parser.sql

@^PREFIX.core/wwv_flow_login.sql

@^PREFIX.core/wwv_flow_cloud_db_services.sql
@^PREFIX.core/wwv_flow_developer_toolbar.sql
@^PREFIX.core/wwv_flow_feedback_int.sql
@^PREFIX.core/htmldb_util.sql
@^PREFIX.core/htmldb_custom_auth.sql
@^PREFIX.core/htmldb_lang.sql
@^PREFIX.core/wwv_flow_xliff.sql
@^PREFIX.core/wwv_flow_theme_globals.sql
@^PREFIX.core/wwv_flow_ppr_util.sql
@^PREFIX.core/wwv_flow_sw_script.sql
-- Eventually break dependency from wwv_flow_sc_transactions to wwv_flow_sw_script
@^PREFIX.core/wwv_flow_sc_transactions.sql
@^PREFIX.core/wwv_flow_sw_parser.sql
@^PREFIX.core/wwv_flow_page_api.sql
@^PREFIX.core/wwv_flow_page.sql
@^PREFIX.core/wwv_flow_region_api.sql
@^PREFIX.core/wwv_flow_region_init.sql
@^PREFIX.core/reports3.sql
@^PREFIX.core/wwv_flow_yaml.sql
@^PREFIX.core/wwv_flow_jwt.sql
@^PREFIX.core/wwv_flow_cdn.sql
@^PREFIX.core/wwv_flow_combined_file.sql
@^PREFIX.core/wwv_flow_css.sql
@^PREFIX.core/wwv_flow_css_api.sql
@^PREFIX.core/wwv_flow_javascript_api.sql
@^PREFIX.core/wwv_flow_javascript.sql
@^PREFIX.core/wwv_flow_tabular_form.sql
@^PREFIX.core/wwv_flow_validation.sql
@^PREFIX.core/wwv_flow_computation.sql
@^PREFIX.core/wwv_flow_process.sql
@^PREFIX.core/wwv_flow_process_bg_api.sql
@^PREFIX.core/wwv_flow_process_bg.sql
@^PREFIX.core/wwv_flow_branch.sql
@^PREFIX.core/wwv_flow_dynamic_action.sql
@^PREFIX.core/wwv_flow_dynamic_action_native.sql
@^PREFIX.core/wwv_flow_data_upload.sql
@^PREFIX.core/wwv_flow_region_native.sql
@^PREFIX.core/wwv_flow_region_list.sql
@^PREFIX.core/wwv_flow_process_native.sql
@^PREFIX.core/wwv_flow_invoke_api_process.sql
@^PREFIX.core/wwv_flow_authorization_api.sql
@^PREFIX.core/wwv_flow_authorization.sql
@^PREFIX.core/wwv_flow_authentication_api.sql
@^PREFIX.core/wwv_flow_authentication.sql
@^PREFIX.core/wwv_flow_authentication_social.sql
@^PREFIX.core/wwv_flow_authentication_saml.sql
@^PREFIX.core/wwv_flow_authentication_native.sql
@^PREFIX.core/wwv_flow_4155_ui.sql
@^PREFIX.core/wwv_flow_cloud_idm.sql
@^PREFIX.core/wwv_flow_authentication_extn.sql
@^PREFIX.core/v.sql
@^PREFIX.core/nv.sql
@^PREFIX.core/wwv_flow_maint.sql
@^PREFIX.core/wwv_flow_tree_region.sql

@^PREFIX.core/wwv_flow_meta_util.sql
@^PREFIX.core/wwv_purge.sql
@^PREFIX.core/wwv_flow_install_wizard.sql
@^PREFIX.core/wwv_flow_cloud_archive_obj.sql
@^PREFIX.core/wwv_flow_cloud_archive.sql
@^PREFIX.core/wwv_flow_team_file.sql
@^PREFIX.core/wwv_flow_translation_util_api.sql
@^PREFIX.core/wwv_flow_app_builder_api.sql
@^PREFIX.core/wwv_flow_zip_int.sql
@^PREFIX.core/wwv_flow_zip.sql
@^PREFIX.core/wwv_flow_zip_utils.sql
@^PREFIX.core/wwv_flow_css_calendar.sql
@^PREFIX.core/wwv_flow_lock.sql
@^PREFIX.core/wwv_flow_jet_chart.sql
@^PREFIX.core/wwv_flow_interactive_grid.sql
@^PREFIX.core/wwv_flow_interactive_grid_api.sql
@^PREFIX.core/wwv_flow_app_setting_api.sql
@^PREFIX.core/wwv_flow_acl_api.sql

@^PREFIX.core/wwv_flow_theme_api.sql

@^PREFIX.core/wwv_flow_content_cache.sql

@^PREFIX.core/wwv_flow_xml_security.sql

@^PREFIX.core/wwv_flow_data_profile.sql
@^PREFIX.core/wwv_flow_exec_local.sql
@^PREFIX.core/wwv_flow_exec_remote.sql
@^PREFIX.core/wwv_flow_exec_web_src.sql
@^PREFIX.core/wwv_flow_exec_web_src_utils.sql
@^PREFIX.core/wwv_flow_exec_web_src_ords.sql
@^PREFIX.core/wwv_flow_exec_web_src_http.sql
@^PREFIX.core/wwv_flow_exec_web_src_adfbc.sql
@^PREFIX.core/wwv_flow_exec_web_src_boss.sql
@^PREFIX.core/wwv_flow_web_src_boss_discover.sql
@^PREFIX.core/wwv_flow_exec_web_src_oci.sql
@^PREFIX.core/wwv_flow_exec_web_src_restsql.sql
@^PREFIX.core/wwv_flow_exec_web_src_odata.sql
@^PREFIX.core/wwv_flow_web_src_sync.sql
@^PREFIX.core/wwv_flow_web_src_sync_api.sql
@^PREFIX.core/wwv_flow_exec_doc_src.sql

@^PREFIX.core/wwv_flow_form_region.sql
@^PREFIX.core/wwv_flow_faceted_search.sql
@^PREFIX.core/wwv_flow_card_region.sql
@^PREFIX.core/wwv_flow_map_region.sql

@^PREFIX.core/wwv_flow_data_parser.sql
@^PREFIX.core/wwv_flow_data_loader.sql

@^PREFIX.core/wwv_flow_lov_api.sql
@^PREFIX.core/wwv_flow_lov.sql

@^PREFIX.core/wwv_flow_pdf.sql
@^PREFIX.core/wwv_flow_pdf_unicode_bidi.sql
@^PREFIX.core/wwv_flow_pdf_font.sql
@^PREFIX.core/wwv_flow_pdf_font_cff.sql
@^PREFIX.core/wwv_flow_pdf_image.sql
@^PREFIX.core/wwv_flow_image.sql
@^PREFIX.core/wwv_flow_image_jpeg.sql
@^PREFIX.core/wwv_flow_image_png.sql

@^PREFIX.core/wwv_flow_approval_api.sql
@^PREFIX.core/wwv_flow_approval.sql
@^PREFIX.core/wwv_flow_wf_management.sql

@^PREFIX.core/wwv_flow_workflow_api.sql
@^PREFIX.core/wwv_flow_workflow.sql

@^PREFIX.core/wwv_flow_automation_api.sql
@^PREFIX.core/wwv_flow_automation.sql

@^PREFIX.core/wwv_flow_data_loading_api.sql
@^PREFIX.core/wwv_flow_data_loading.sql

@^PREFIX.core/wwv_flow_pwa.sql
@^PREFIX.core/wwv_flow_pwa_api.sql
@^PREFIX.core/wwv_data_pkg_int.sql
@^PREFIX.core/wwv_data_pkg_api.sql

@^PREFIX.core/wwv_flow_search_api.sql
@^PREFIX.core/wwv_flow_search.sql

@^PREFIX.core/wwv_flow_web_src_openapi.sql
@^PREFIX.core/wwv_flow_template_component.sql
@^PREFIX.core/wwv_flow_object_store.sql

@^PREFIX.core/wwv_flow_barcode_api.sql

@^PREFIX.core/wwv_flow_ai_api.sql
@^PREFIX.core/wwv_flow_ai.sql

@^PREFIX.core/wwv_dbms_cloud_int.sql
@^PREFIX.core/wwv_flow_docgen.sql
@^PREFIX.core/wwv_http.sql

@^PREFIX.core/trigger.sql
@^PREFIX.core/dg_trigger.sql
@^PREFIX.core/apex_install_data.sql

Rem  Only install the LDAP packages if sys.dbms_ldap exists
column temp new_val LDAP_SQL
column temp2 new_val AUTH_LDAP_SQL
set termout off
select decode(count(*),0,'null1.sql','ldap.sql') temp from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
select decode(count(*),0,'null1.sql','custom_auth_ldap.sql') temp2 from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
set termout on
@^PREFIX.core/^LDAP_SQL
@^PREFIX.core/^AUTH_LDAP_SQL
set heading off
set termout off
column temp format a80
select decode(count(*),0,'DBMS_LDAP is not installed.','') temp
  from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
set heading on
set termout on
Rem  End LDAP package specs

@^PREFIX.core/wwv_flow_web_services.sql
@^PREFIX.core/wwv_flow_web_services_invoker.sql

@^PREFIX.core/processu.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing Package Bodies (Runtime)"


alter session set "_LOAD_WITHOUT_COMPILE" = plsql;

@^PREFIX.core/wwv_dbms_sql.plb
@^PREFIX.core/wwv_flow_crypto.plb
@^PREFIX.core/wwv_flow_char_reader.plb
@^PREFIX.core/wwv_flow_plsql_lexer.plb
@^PREFIX.core/wwv_flow_assert.plb
@^PREFIX.core/wwv_flow_t_writer.plb
@^PREFIX.core/wwv_flow_t_clob_writer.plb
@^PREFIX.core/wwv_flow_t_blob_writer.plb
@^PREFIX.core/wwv_flow_t_htp_writer.plb
@^PREFIX.core/wwv_flow_t_dbms_output_writer.plb
@^PREFIX.core/wwv_flow_t_plugin_attributes.plb

@^PREFIX.core/wwv_flow_platform.plb
@^PREFIX.core/wwv_flow_upgrade.plb

@^PREFIX.core/meta_cleanup.plb

@^PREFIX.core/wwv_flow_dynamic_exec.plb
@^PREFIX.core/wwv_flow_code_exec.plb
@^PREFIX.core/wwv_flow_code_exec_plsql.plb
@^PREFIX.core/wwv_flow_code_exec_mle.plb
@^PREFIX.core/wwv_flow_exec_api.plb
@^PREFIX.core/chart.plb
@^PREFIX.core/reports3.plb
@^PREFIX.core/wwv_flow_page_cache_api.plb
@^PREFIX.core/wwv_flow_render_query.plb
@^PREFIX.core/wwv_flow_report_query.plb
--
@^PREFIX.core/wwv_imp_util.plb
@^PREFIX.core/wwv_imp_workspace.plb
@^PREFIX.core/wwv_flow_imp_page.plb
@^PREFIX.core/wwv_flow_imp_shared.plb
@^PREFIX.core/wwv_flow_imp.plb
--
@^PREFIX.core/gen_api_pkg.plb
@^PREFIX.core/wwv_flow_export_api.plb
@^PREFIX.core/wwv_flow_export_int.plb
@^PREFIX.core/wwv_htf.plb
@^PREFIX.core/wwv_htp.plb
@^PREFIX.core/flow_log.plb
@^PREFIX.core/wwv_flow_cgi.plb
@^PREFIX.core/wwv_flow_response.plb

@^PREFIX.core/flow_dml.plb
@^PREFIX.core/flowu.plb
@^PREFIX.core/wwv_flow_string.plb
@^PREFIX.core/wwv_flow_string_util.plb
@^PREFIX.core/wwv_flow_string_stopword.plb
@^PREFIX.core/wwv_flow_asn1.plb
@^PREFIX.core/wwv_flow_public_key_util.plb
@^PREFIX.core/wwv_flow_error_api.plb
@^PREFIX.core/wwv_flow_error.plb
@^PREFIX.core/db_webservices_triggers.sql
@^PREFIX.core/wwv_flow_grid_layout.plb
@^PREFIX.core/wwv_flow_page_api.plb
@^PREFIX.core/wwv_flow_page.plb
@^PREFIX.core/wwv_flow_region_api.plb
@^PREFIX.core/wwv_flow_region.plb
@^PREFIX.core/wwv_flow_region_init.plb
@^PREFIX.core/wwv_flow_json.plb
@^PREFIX.core/wwv_flow_yaml.plb
@^PREFIX.core/wwv_flow_jwt.plb
@^PREFIX.core/wwv_flow_cdn.plb
@^PREFIX.core/wwv_flow_combined_file.plb
@^PREFIX.core/wwv_flow_css_api.plb
@^PREFIX.core/wwv_flow_css.plb
@^PREFIX.core/wwv_flow_javascript_api.plb
@^PREFIX.core/wwv_flow_javascript.plb
@^PREFIX.core/wwv_flow_user_interface.plb
@^PREFIX.core/wwv_flow_template.plb
@^PREFIX.core/wwv_flow_template_directive.plb
@^PREFIX.core/wwv_flow_theme.plb
@^PREFIX.core/wwv_flow_plugin_api.plb
@^PREFIX.core/wwv_flow_plugin.plb
@^PREFIX.core/wwv_flow_plugin_util.plb
@^PREFIX.core/wwv_flow_tabular_form.plb
@^PREFIX.core/wwv_flow_validation.plb
@^PREFIX.core/wwv_flow_computation.plb
@^PREFIX.core/wwv_flow_process.plb
@^PREFIX.core/wwv_flow_process_bg_api.plb
@^PREFIX.core/wwv_flow_process_bg.plb
@^PREFIX.core/wwv_flow_branch.plb
@^PREFIX.core/wwv_flow_dynamic_action.plb
@^PREFIX.core/wwv_flow_native_item.plb
@^PREFIX.core/wwv_flow_dynamic_action_native.plb
@^PREFIX.core/wwv_flow_data_upload.plb
@^PREFIX.core/wwv_flow_region_native.plb
@^PREFIX.core/wwv_flow_region_list.plb
@^PREFIX.core/wwv_flow_process_native.plb
@^PREFIX.core/wwv_flow_invoke_api_process.plb
@^PREFIX.core/wwv_flow_pltable_util.plb
@^PREFIX.core/wwv_flow_session_state_api.plb
@^PREFIX.core/wwv_flow_session_state.plb
@^PREFIX.core/wwv_flow_session.plb
@^PREFIX.core/wwv_flow_session_ras.plb
@^PREFIX.core/wwv_flow_session_context.plb
@^PREFIX.core/wwv_flow_session_api.plb
@^PREFIX.core/wwv_flow_authorization_api.plb
@^PREFIX.core/wwv_flow_authorization.plb
@^PREFIX.core/wwv_flow_authentication_api.plb
@^PREFIX.core/wwv_flow_authentication.plb
@^PREFIX.core/wwv_flow_authentication_social.plb
@^PREFIX.core/wwv_flow_authentication_saml.plb
@^PREFIX.core/wwv_flow_authentication_native.plb
@^PREFIX.core/wwv_flow_4155_ui.plb
@^PREFIX.core/wwv_flow_maint.plb
@^PREFIX.core/wwv_flow_debug_api.plb
@^PREFIX.core/wwv_flow_debug.plb
@^PREFIX.core/wwv_flow_escape.plb
@^PREFIX.core/wwv_flow_application_admin_api.plb
@^PREFIX.core/wwv_flow_application_install.plb
@^PREFIX.core/wwv_flow_tree_region.plb
@^PREFIX.core/wwv_flow_button.plb
@^PREFIX.core/wwv_flow_legacy_plugins.plb
@^PREFIX.core/wwv_flow_markdown.plb

@^PREFIX.core/wwv_flow_rpt_std_msg.plb

@^PREFIX.core/wwv_flow_ajax.plb

@^PREFIX.core/audit.plb
@^PREFIX.core/audit_trigger.sql
@^PREFIX.core/flowc.plb
@^PREFIX.core/wwv_flow_preference_int.plb
@^PREFIX.core/flowp.plb
@^PREFIX.core/meta.plb
@^PREFIX.core/flow.plb
@^PREFIX.core/flowl.plb
@^PREFIX.core/template.plb
@^PREFIX.core/plug.plb
@^PREFIX.core/customize.plb
@^PREFIX.core/sw_util.plb
@^PREFIX.core/generic.plb
@^PREFIX.core/wwv_flow_security.plb
@^PREFIX.core/form.plb
@^PREFIX.core/wwv_flow_builder.plb
@^PREFIX.core/shortcut.plb
@^PREFIX.core/wwv_flow_fnd_developer_api.plb
@^PREFIX.core/wwv_flow_mail_api.plb
@^PREFIX.core/wwv_flow_mail.plb
@^PREFIX.core/wwv_flow_file_mgr.plb
@^PREFIX.core/prov.plb
@^PREFIX.core/provision.plb

@^PREFIX.core/tree.plb
@^PREFIX.core/tree3.plb
@^PREFIX.core/wwv_flow_file_api.plb
@^PREFIX.core/imgapi_public.plb
@^PREFIX.core/htmlapi_public.plb
@^PREFIX.core/wwv_flow_fnd_user_int.plb
@^PREFIX.core/wwv_flow_fnd_user_api.plb
@^PREFIX.core/wwv_flow_user_api.plb
@^PREFIX.core/wwv_flow_workspace_user_api.plb
@^PREFIX.core/wwv_flow_collection_int.plb
@^PREFIX.core/collection.plb
@^PREFIX.core/wwv_flow_item.plb
@^PREFIX.core/custom_auth_api.plb
@^PREFIX.core/custom_auth_std.plb
@^PREFIX.core/sw_api.plb

@^PREFIX.core/wwv_flow_item_help.plb
@^PREFIX.core/wwv_flow_admin_api.plb
@^PREFIX.core/flowcon.plb
@^PREFIX.core/wwv_flow_svg.plb
@^PREFIX.core/popup.plb
@^PREFIX.core/wwv_flow_calendar.plb
@^PREFIX.core/wwv_flow_hint.plb
@^PREFIX.core/wwv_flow_series_attr.plb
@^PREFIX.core/edit_report.plb
@^PREFIX.core/wwv_flow_app_install_int.plb
@^PREFIX.core/imp_parser.plb
@^PREFIX.core/wwv_flow_cloud_db_services.plb
@^PREFIX.core/wwv_flow_developer_toolbar.plb
@^PREFIX.core/flow_isc.plb
@^PREFIX.core/wwv_flow_web_services.plb
@^PREFIX.core/wwv_flow_web_services_invoker.plb
@^PREFIX.core/wwv_flow_feedback_int.plb
@^PREFIX.core/htmldb_util.plb
@^PREFIX.core/htmldb_item.plb
@^PREFIX.core/htmldb_custom_auth.plb
@^PREFIX.core/htmldb_lang.plb
@^PREFIX.core/wwv_flow_xliff.plb

@^PREFIX.core/wwv_flow_login.plb

@^PREFIX.core/wwv_flow_ppr_util.plb
@^PREFIX.core/wwv_flow_sw_script.plb
@^PREFIX.core/wwv_flow_sw_parser.plb
@^PREFIX.core/wwv_flow_sc_transactions.plb
@^PREFIX.core/wwv_flow_sw_upgrade.plb
@^PREFIX.core/wwv_flow_data_export_api.plb
@^PREFIX.core/wwv_flow_data_export_html.plb
@^PREFIX.core/wwv_flow_data_export_csv.plb
@^PREFIX.core/wwv_flow_data_export_pdf.plb
@^PREFIX.core/wwv_flow_data_export_xlsx.plb
@^PREFIX.core/wwv_flow_data_export_xml.plb
@^PREFIX.core/wwv_flow_data_export_json.plb
@^PREFIX.core/wwv_flow_data_export.plb
@^PREFIX.core/wwv_flow_print_util.plb
@^PREFIX.core/wwv_flow_instance_admin.plb
@^PREFIX.core/wwv_purge.plb
@^PREFIX.core/wwv_flow_cloud_idm.plb
@^PREFIX.core/wwv_flow_authentication_extn.plb
@^PREFIX.core/wwv_flow_install_wizard.plb
@^PREFIX.core/wwv_flow_listener.plb
@^PREFIX.core/wwv_flow_team_file.plb
@^PREFIX.core/wwv_flow_translation_util_api.plb
@^PREFIX.core/wwv_flow_app_builder_api.plb
@^PREFIX.core/wwv_flow_zip.plb
@^PREFIX.core/wwv_flow_zip_utils.plb
@^PREFIX.core/wwv_flow_css_calendar.plb
@^PREFIX.core/wwv_flow_lock.plb
@^PREFIX.core/wwv_flow_jet_chart.plb
@^PREFIX.core/wwv_flow_interactive_grid.plb
@^PREFIX.core/wwv_flow_interactive_grid_api.plb
@^PREFIX.core/wwv_flow_app_setting_api.plb
@^PREFIX.core/wwv_flow_acl_api.plb

@^PREFIX.core/wwv_extension.plb
@^PREFIX.core/wwv_extension_api.plb

@^PREFIX.core/wwv_flow_theme_api.plb

@^PREFIX.core/wwv_flow_credential_api.plb
@^PREFIX.core/wwv_flow_credential.plb

@^PREFIX.core/wwv_flow_content_cache.plb

@^PREFIX.core/wwv_flow_xml_security.plb

@^PREFIX.core/wwv_flow_data_profile.plb
@^PREFIX.core/wwv_flow_exec.plb
@^PREFIX.core/wwv_flow_exec_sql.plb
@^PREFIX.core/wwv_flow_exec_local.plb
@^PREFIX.core/wwv_flow_exec_remote.plb
@^PREFIX.core/wwv_flow_exec_web_src.plb
@^PREFIX.core/wwv_flow_exec_web_src_utils.plb
@^PREFIX.core/wwv_flow_exec_web_src_ords.plb
@^PREFIX.core/wwv_flow_exec_web_src_http.plb
@^PREFIX.core/wwv_flow_exec_web_src_adfbc.plb
@^PREFIX.core/wwv_flow_exec_web_src_boss.plb
@^PREFIX.core/wwv_flow_web_src_boss_discover.plb
@^PREFIX.core/wwv_flow_exec_web_src_oci.plb
@^PREFIX.core/wwv_flow_exec_web_src_restsql.plb
@^PREFIX.core/wwv_flow_exec_web_src_odata.plb
@^PREFIX.core/wwv_flow_web_src_sync.plb
@^PREFIX.core/wwv_flow_web_src_sync_api.plb
@^PREFIX.core/wwv_flow_exec_doc_src.plb

-- new interactive reports implementation
@^PREFIX.core/wwv_flow_ir.plb
@^PREFIX.core/wwv_flow_ir_render.plb
@^PREFIX.core/wwv_flow_ir_ajax.plb
@^PREFIX.core/wwv_flow_ir_dialog.plb
@^PREFIX.core/wwv_flow_ir_api.plb

@^PREFIX.core/wwv_flow_form_region.plb
@^PREFIX.core/wwv_flow_faceted_search.plb
@^PREFIX.core/wwv_flow_card_region.plb
@^PREFIX.core/wwv_flow_map_region.plb

@^PREFIX.core/wwv_flow_data_parser.plb
@^PREFIX.core/wwv_flow_data_loader.plb

@^PREFIX.core/wwv_flow_lov_api.plb
@^PREFIX.core/wwv_flow_lov.plb

@^PREFIX.core/wwv_flow_pdf.plb
@^PREFIX.core/wwv_flow_pdf_unicode_bidi.plb
@^PREFIX.core/wwv_flow_pdf_font.plb
@^PREFIX.core/wwv_flow_pdf_font_cff.plb
@^PREFIX.core/wwv_flow_pdf_image.plb
@^PREFIX.core/wwv_flow_image.plb
@^PREFIX.core/wwv_flow_image_jpeg.plb
@^PREFIX.core/wwv_flow_image_png.plb

@^PREFIX.core/wwv_flow_ooxml.plb
@^PREFIX.core/wwv_flow_xlsx.plb

@^PREFIX.core/wwv_flow_approval_api.plb
@^PREFIX.core/wwv_flow_approval.plb
@^PREFIX.core/wwv_flow_wf_management.plb

@^PREFIX.core/wwv_flow_workflow_api.plb
@^PREFIX.core/wwv_flow_workflow.plb

@^PREFIX.core/wwv_flow_automation_api.plb
@^PREFIX.core/wwv_flow_automation.plb

@^PREFIX.core/wwv_dg_blueprint_util_int.plb
@^PREFIX.core/wwv_dg_data_gen_api.plb

@^PREFIX.core/scripts/set_force_no_capture.sql true
@^PREFIX.core/dg_install_data.sql
@^PREFIX.core/scripts/set_force_no_capture.sql false

@^PREFIX.core/wwv_flow_data_loading_api.plb
@^PREFIX.core/wwv_flow_data_loading.plb

@^PREFIX.core/wwv_flow_pwa.plb
@^PREFIX.core/wwv_flow_pwa_api.plb

@^PREFIX.core/wwv_data_pkg_int.plb
@^PREFIX.core/wwv_data_pkg_api.plb

@^PREFIX.core/wwv_flow_epg_include.plb

@^PREFIX.core/wwv_flow_template_component.plb
@^PREFIX.core/wwv_flow_object_store.plb

@^PREFIX.core/wwv_flow_event_metrics_int.plb

@^PREFIX.core/wwv_flow_barcode_api.plb

@^PREFIX.core/wwv_flow_ai_api.plb
@^PREFIX.core/wwv_flow_ai.plb

@^PREFIX.core/wwv_dbms_cloud_int.plb
@^PREFIX.core/wwv_flow_print_api.plb
@^PREFIX.core/wwv_flow_docgen.plb
@^PREFIX.core/wwv_http.plb

Rem  Only install the ldap packages if sys.dbms_ldap exists
column temp new_val LDAP_PLB
column temp2 new_val AUTH_LDAP_PLB
set termout off
set heading off
select decode(count(*),0,'null1.sql','ldap.plb') temp from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
select decode(count(*),0,'null1.sql','custom_auth_ldap.plb') temp2 from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
set termout on
@^PREFIX.core/^LDAP_PLB
@^PREFIX.core/^AUTH_LDAP_PLB
set termout off
set heading off
column temp format a80
select decode(count(*),0,'DBMS_LDAP is not installed.','') temp
  from sys.all_objects where object_name ='DBMS_LDAP' AND OBJECT_TYPE ='PACKAGE';
set termout on
set heading on
Rem  End LDAP package bodies

@^PREFIX.core/processu.plb
@^PREFIX.core/wwv_flow_meta_util.plb
@^PREFIX.core/wwv_meta_meta_data.plb

@^PREFIX.core/wwv_flow_search_api.plb
@^PREFIX.core/wwv_flow_search.plb

@^PREFIX.core/wwv_flow_web_src_openapi.plb

@^PREFIX.core/p.sql

@^PREFIX.core/apex_views.sql

@^PREFIX.core/wwv_flow_webservices_api.plb

alter session set "_LOAD_WITHOUT_COMPILE" = none;

--==============================================================================
prompt ...Development install if necessary
column foo new_val script
set termout off
select decode('^INSTALL_TYPE','RUNTIME','core/null1.sql','devins.sql') foo from sys.dual;
set termout on
@^PREFIX.^script ^LOG1 ^APPUN "^TEMPTBL" ^IMGPR ^DATTS ^FF_TBLS ^ADM_PWD ^PREFIX

--==============================================================================
prompt ...Marking sensitive columns
declare
    l_owner# number;
    procedure set_sensitive (
        p_table_name  in varchar2,
        p_column_name in varchar2 )
    is
    begin
        update sys.col$
           set property = property + 8796093022208 - bitand(property, 8796093022208)
         where name = p_column_name
           and obj# = (select obj#
                         from sys.obj$
                        where name = p_table_name
                          and owner# = l_owner#
                          and remoteowner is NULL);
    end set_sensitive;
begin
    if sys.dbms_db_version.version >= 18 then
        select user#
          into l_owner#
          from sys.user$
         where name = sys_context('userenv','current_schema');
        --
        set_sensitive('WWV_FLOW_FND_USER'         , 'WEB_PASSWORD');
        set_sensitive('WWV_FLOW_FND_USER'         , 'WEB_PASSWORD2');
        set_sensitive('WWV_FLOW_FND_USER'         , 'WEB_PASSWORD_RAW');
        set_sensitive('WWV_FLOW_PASSWORD_HISTORY' , 'PASSWORD');
        set_sensitive('WWV_CREDENTIALS'           , 'CLIENT_SECRET');
        set_sensitive('WWV_CREDENTIAL_INSTANCES'  , 'VALUE');
        set_sensitive('WWV_FLOW_PLATFORM_PREFS'   , 'VALUE');
        commit;
    end if;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Recompiling ^APPUN."


begin
    if instr('^INSTALL_TYPE','APPCONTAINER') <> 1 then
        sys.utl_recomp.recomp_parallel(schema => '^APPUN.');
    end if;
end;
/

alter package sys.wwv_dbms_sql_^APPUN. compile body;

@^PREFIX.core/scripts/reset_state_and_show_invalid.sql SYS,^APPUN

@^PREFIX.core/wwv_flow_cloud_archive_obj.plb

create or replace procedure create_cloud_obj
as
begin
    wwv_flow_cloud_archive_obj.create_archive_tables;
end;
/

begin
    ^APPUN..create_cloud_obj;
end;
/

drop procedure create_cloud_obj
/

@^PREFIX.core/wwv_flow_cloud_archive.plb

--==============================================================================
-- install spatial utilities
--==============================================================================
@^PREFIX.core/wwv_flow_spatial_int.sql
@^PREFIX.core/wwv_flow_spatial_int.plb
@^PREFIX.core/wwv_flow_spatial_api.sql
@^PREFIX.core/wwv_flow_spatial_api.plb

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Creating Instance Parameter Defaults"


column img_pre  new_val IMGPR
set termout off
select case when regexp_like('^IMGPR','^(.*/)$') then '^IMGPR' else '^IMGPR'||'/' end img_pre from sys.dual;
set termout on

declare
    l_instance_id   varchar2(32767) := wwv_flow_id.next_val;
    l_instance_hash varchar2(32767) := rawtohex(sys.dbms_crypto.hash (
                                           src => sys.utl_raw.cast_to_raw(l_instance_id),
                                           typ => sys.dbms_crypto.hash_sh256 ));
    l_names         wwv_flow_global.vc_arr2;
    l_values        wwv_flow_global.vc_arr2;
    l_comments      wwv_flow_global.vc_arr2;
    c_install_type  constant varchar2(30) := '^INSTALL_TYPE.';
--------------------------------------------------------------------------------
    procedure add_parameter (
        p_name    in varchar2,
        p_value   in varchar2,
        p_comment in varchar2 )
    is
        c_pos constant pls_integer := l_names.count+1;
    begin
        l_names(c_pos)    := p_name;
        l_values(c_pos)   := p_value;
        l_comments(c_pos) := p_comment;
    end add_parameter;
--------------------------------------------------------------------------------
begin
    add_parameter('ALLOW_DB_MONITOR'                 , 'N','The flag which determines if database monitoring is enabled.');
    add_parameter('ALLOW_PUBLIC_FILE_UPLOAD'         , 'N','The flag which determines if file uploads are allowed without user authentication.');
    add_parameter('AI_IS_ENABLED'                    , 'Y','The flag which determines if AI Services can be enabled on this instance.');
    add_parameter('ALLOW_RAS'                        , 'N','The flag which determines if Real Application Security is enabled.');
    add_parameter('ALLOW_SQL_DEVELOPER_WEB'          , 'N','The flag which determines if developers are allowed to open SQL Developer Web for associated DB schemas.');
    add_parameter('APEX_BUILDER_AUTHENTICATION'      , 'APEX','The flag used to control the Instance Administration and Builder authentication scheme.');
    add_parameter('APEX_LISTENER_FOP_PATH'           , '_/fop2pdf','path to FOP rendering script');
    add_parameter('APP_EXPORT_TO_DB_ENABLED'         , 'Y', 'Y if applcation export to File Format "Database" is enabled');
    add_parameter('APPLICATION_ACTIVITY_LOGGING'     , 'U','Controls instance wide setting of application activity log (always, never, use application settings)');
    add_parameter('AUDIT_LOG_RETENTION'              , '90','Number of days to keep audit log entries.');
    add_parameter('AUTOEXTEND_TABLESPACES'           , 'Y','If set to ''Y'', provisioned tablespaces will autoextend up to a maximum size.');
    add_parameter('AUTO_SCHEMA_NAME'                 , 'N', 'Controls whether schema name is automatically assigned to someone requesting a new workspace');
    add_parameter('AUTO_WORKSPACE_NAME'              , 'N', 'Controls whether workspace name is automatically assigned to someone requesting a new workspace');
    add_parameter('BIGFILE_TABLESPACES_ENABLED'      , 'N', 'Y if the tablespaces provisioned through APEX should be done using bigfiles');
    add_parameter('CHECK_FOR_UPDATES'                , 'Y', 'Y if APEX should check if new versions are available. This sends anonymized version information and general feature usage stats to apex.oracle.com.');
    add_parameter('CLONE_SESSION_ENABLED'            , 'Y', 'If set to Y, users can create multiple sessions in the browser.');
    add_parameter('DEFAULT_THEMES'                   , '42,51', 'Comma delimited list of default themes');
    add_parameter('DEBUG_MESSAGE_PAGE_VIEW_LIMIT'    , 50000, 'Maximum number of debug messages for a single page view');
    add_parameter('DELETE_UPLOADED_FILES_AFTER_DAYS' , 14, 'Uploaded files like application export files, spreadsheet data load files will be automatically deleted after this number of days.');
    add_parameter('DISABLE_ADMIN_LOGIN'              , 'N','The flag which determines if Adminstration services are disabled.');
    add_parameter('DISABLE_WORKSPACE_LOGIN'          , 'N','The flag which determines if workspace login is disabled.');
    add_parameter('DISABLE_WS_PROV'                  , 'N','The flag which determines if workspace creation is disabled for requests sent out via e-mail notification.');
    add_parameter('ENABLE_TRANSACTIONAL_SQL'         , 'N','The flag which determines if Transactional SQL Commands are enabled on this instance.');
    add_parameter('ENCRYPTED_TABLESPACES_ENABLED'    , 'N', 'Y if the tablespaces provisioned through APEX should be encrypted');
    add_parameter('EXPIRE_FND_USER_ACCOUNTS'         , 'Y','Enable expiration of APEX accounts');
    add_parameter('HPROF_DIRECTORY'                  , '-', 'Name of the directory where profiling files are stored if p_trace=HPROF, "-" if not configured');
    add_parameter('IGNORED_FRIENDLY_URL_PARAMETERS'  , 'utm_campaign,utm_source,utm_medium,utm_term,utm_content,fbclid', 'Comma-separated list of parameter names which are ignored when parsing friendly URLs.');
    add_parameter('IMAGE_PREFIX'                     , '^IMGPR', 'The image prefix of the APEX instance, such as /i/');
    add_parameter('INSTANCE_ID'                      , l_instance_id, 'Instance Identifier');
    add_parameter('INSTANCE_HASH'                    , l_instance_hash, 'Hash of INSTANCE_ID');
    add_parameter('KEEP_SESSIONS_ON_UPGRADE'         , 'N', 'If set to Y, keep sessions on application upgrade. If N, delete them.');
    add_parameter('KILL_SESSIONS_LAST_CALL_ET'       , '3600', 'Threshold (in seconds) for GV$SESSION.LAST_CALL_ET when killing waiting sessions');
    add_parameter('KILL_SESSIONS_WAIT_TIME_SEC'      , '120', 'Threshold (in seconds) for GV$SESSION.WAIT_TIME_MICRO when killing waiting sessions');
    add_parameter('LOGIN_THROTTLE_DELAY'             , '5','The flag which determines the time increase in seconds after failed logins.');
    add_parameter('LOGIN_THROTTLE_METHODS'           , 'USERNAME_IP','The methods to count failed logins. Colon-separated list of USERNAME_IP, USERNAME, IP');
    add_parameter('MAX_SCRIPT_SIZE'                  , '500000','The maximum allowable size for a script text.');
    add_parameter('MAX_LOGIN_FAILURES'               , '4', 'The maximum number of consecutive unsuccessful authentication attempts allowed before a developer or administrator account is locked.');
    add_parameter('MAX_PROCESS_SCHEDULER_JOBS_DEFAULT', '10', 'Maximum number of background processing scheduler jobs allowed to run in parallel for one workspace.');
    add_parameter('MAX_SESSION_IDLE_SEC'             , '3600','The number of seconds an internal application may be idle.');
    add_parameter('MAX_SESSION_LENGTH_SEC'           , '28800','The number of seconds an internal application session may exist.');
    add_parameter('MAX_WEBSERVICE_REQUESTS'          , '1000', 'Maximum number of web service requests per workspace in a 24 hour period.');
    add_parameter('OBJECT_STORE_MAX_SYNC_BYTES'      , '10485760', 'Maximum number of bytes to sync to/from object storage in the foreground.');
    add_parameter('MLE_LANGUAGES'                    , 'JAVASCRIPT', 'Comma-separated list of MLE languages available for application development.');
    add_parameter('PASSWORD_ALPHA_CHARACTERS'        , 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ','The alphabetic characters used for pasword complexity rules.');
    add_parameter('PASSWORD_PUNCTUATION_CHARACTERS'  , '!"`''#$%&()[]{},.*+-/|\:;<=>?_~','The punctuation characters used for pasword complexity rules.');
    add_parameter('ALLOW_PERSISTENT_AUTHENTICATION'    ,    'N' , 'The flag which determines if Persistent Authentication is enabled.');
    add_parameter('PERSISTENT_AUTHENTICATION_MAX_DAYS' ,    '30', 'Maximum number of days user can login using Persistent Authentication before having to enter credentials again.');
    add_parameter('PLSQL_EDITING'                    , 'Y','The flag used in SQL Workshop Object Browser to enable user to edit and compile PL/SQL.');
    add_parameter('PRINT_BIB_LICENSED'               , 'NONE','Determines BI Publisher licensing level.');
    add_parameter('REJOIN_EXISTING_SESSIONS'         , 'P','Disable or enable session joining for the instance');
    add_parameter('REQ_NEW_SCHEMA'                   , 'N','The flag which determines if option for new schema for new workspace requests is disabled.');
    add_parameter('REQUIRE_HTTPS'                    , 'N','Only permit access to the instance over SSL');
    add_parameter('RESTFUL_SERVICES_ENABLED'         , 'Y', 'If set to ''Y'', RESTful services development will be enabled.');
    add_parameter('SELF_SERVICE_SCHEMA_PREFIX'       , 'WKSP_', 'If set, schemas created during self service workspace provisioning will be prefixed with the value.');
    add_parameter('SERVICE_REQUEST_FLOW'             , 'MANUAL','Determines default provisioning mode.');
    add_parameter('SERVICE_REQUESTS_ENABLED'         , 'Y', 'If set to ''Y'', workspace service requests for schemas, storage, and termination will be enabled.');
    if c_install_type in ('CLOUD','CLOUDEXT') then
        add_parameter('SMTP_HOST_PORT'               , '587','The port that the SMTP server listens for requests.');
        add_parameter('SMTP_TLS_MODE'                , 'STARTTLS','The flag which determines if apex_mail uses an encrypted smtp connection');
    else
        add_parameter('SMTP_HOST_ADDRESS'            , 'localhost','The address of the SMTP server used to relay mail.');
        add_parameter('SMTP_HOST_PORT'               , '25','The port that the SMTP server listens for requests.');
        add_parameter('SMTP_TLS_MODE'                , 'N','The flag which determines if apex_mail uses an encrypted smtp connection');
    end if;
    add_parameter('SQL_SCRIPT_MAX_OUTPUT_SIZE'       , '200000','The maximum allowable size for an individual script result.');
    add_parameter('STRONG_SITE_ADMIN_PASSWORD'       , 'Y','The flag which determines if the apex_admin password must conform to the default set of stong complexity rules.');
    add_parameter('GALLERY_FILE_URLS'                , 'https://apex.oracle.com/manifests/v1/#APEX_BASE_VERSION#/manifest.json', 'Location of the installation source files for sample apps or starter apps gallery. These URLs should link to JSON files.');
    add_parameter('GALLERY_BACKGROUND_INSTALL'       , 'Y', 'This enables installation of gallery applications in the background. So you do not have to wait until an app finishes with installation.');
    add_parameter('SYSTEM_HELP_URL'                  , 'https://apex.oracle.com/doc242', 'Location of the help and documentation, from within the Help link of the development environment.');
    add_parameter('GET_STARTED_URL'                  , 'https://apex.oracle.com/go/get_started_apex', 'Location of the "Get Started with APEX" page');
    add_parameter('TOP_THEMES'                       , '42,51', 'Comma delimited list of top themes');
    add_parameter('TRACING_ENABLED'                  , 'Y', 'Y if tracing and profiling (p_trace) is enabled');
    add_parameter('UPGRADE_DEFER_DAYS'               , '45','The number of days to defer the upgrade if UPGRADE_DEFERRED is set to ''Y''.');
    add_parameter('UPGRADE_DEFER_DAYS_MAX'           , '90','The maximum number of days to defer the upgrade if UPGRADE_DEFERRED is set to ''Y''.');
    add_parameter('UPGRADE_DEFERRED'                 , 'N','If set to ''Y'', the upgrade will be deferred in cloud services.');
    add_parameter('USERNAME_VALIDATION'              , '*','The regular expression used to validate a username of workspace developers and administrators.');
    add_parameter('WEBSERVICE_LOGGING'               , 'U','Controls instance wide setting of web service log (always, never, use workspace settings)');
    add_parameter('WORKSPACE_EMAIL_MAXIMUM'          , '1000', 'Maximum number of emails allowed to be sent via APEX_MAIL per workspace in a 24 hour period.');
    add_parameter('WORKSPACE_MAX_OUTPUT_SIZE'        , '2000000','The maximum space allocated for script results.');
    add_parameter('WORKSPACE_PROVISION_DEMO_OBJECTS' , 'N','The flag used in Instance Adminstration which determines if demonstration applications and database objects are created in new workspaces.');
    add_parameter('WORKSPACE_TEAM_DEV_FILES_YN'      , 'N', 'Y if new workspaces in this instance will allow file uploads in Team Development, N otherwise (default is Y)');
    add_parameter('WORKSPACE_TEAM_DEV_FS_LIMIT'      , '15728640', 'The maximum file size per upload of a Workspace''s Team Development "File" (default is 15MB)');
    add_parameter('WORKSPACE_ISSUE_FILES_YN'         , 'Y', 'Y if new workspaces in this instance will allow file uploads in Team Development, N otherwise (default is Y)');
    add_parameter('WORKSPACE_ISSUE_FS_LIMIT'         , '15728640', 'The maximum file size per upload of a Workspace''s Team Development "File" (default is 15MB)');
    add_parameter('CONTENT_CACHE_SIZE_TARGET'        , '104857600','Per workspace size target (soft limit) for the content cache.');
    add_parameter('CONTENT_CACHE_MAX_FILE_SIZE'      , '1048576','Per workspace individual entry size limit for the content cache.');
    add_parameter('MAX_APPLICATION_BACKUPS'          , '25','Number of application backups to keep before cleaning up older versions.');
    add_parameter('WS_REQUEST_USAGE_Q'               , 'N','If set to Y, additional questions are asked in Workspace Request wizard such as Country, Usage and Organization Name.');
    add_parameter('DG_ALLOW_MULTI_VALUE'                                       , 'Y','Allow multi-value columns for data generation.');
    add_parameter('DG_ALLOW_SQL_DATA_SOURCES'                                  , 'Y','Allow SQL Query data sources for data generation.');
    add_parameter('DG_ALLOW_TABLE_DATA_SOURCES'                                , 'Y','Allow table data sources for data generation.');
    add_parameter('DG_ALLOW_TABLE_DATA_SOURCE_WHERE_CLAUSE'                    , 'Y','Allow where clauses in table data sources for data generation.');
    add_parameter('DG_MAXIMUM_NUMBER_OF_JSON_ROWS_TO_LOAD_PER_BUILTIN'         , '500000','Maximum number of JSON rows allowed for builtin data sources.');
    add_parameter('DG_MAXIMUM_NUMBER_OF_ROWS_TO_RETRIEVE_FROM_REST_DATA_SOURCE', '500000','Maximum number of rows to request from REST data sources.');
    add_parameter('DG_MAXIMUM_ROWS_PER_TABLE'                                  , '500000','Maximum number of rows to generate data in a single table.');
    add_parameter('DG_PRIORITIZE_SPEED_OVER_RANDOMNESS'                        , 'Y','Not yet implemented.');
    add_parameter('DG_USE_POWERSET_IF_AVAILABLE'                               , 'Y','Create additional data as a cartesian product when requesting large data sets for data generation.');
    add_parameter('DG_ALLOW_FORMULAS'                                          , 'Y','Allow formulas on data generation columns.');
    add_parameter('DG_ALLOW_JSON_DATA_SOURCES'                                 , 'Y','Allow JSON data sources for data generation.');
    add_parameter('MAX_DATA_EXPORT_IMAGES'                                     , '1000','Number of unique images within one data export file.');
    add_parameter('ZIP_FILE_MAX_EXPANSION_FACTOR'                              , '200','Maximum factor by which a compressed file can expand after uncompression.');
    add_parameter('ZIP_FILE_MAX_UNCOMPRESSED_SIZE_MB'                          , '4096','Maximum allowed uncompressed size.');
    add_parameter('TASK_RETENTION_PERIOD_DAYS'                                 , '7','Default retention period for Completed approval tasks.');
    add_parameter('WORKFLOW_RETENTION_PERIOD_DAYS'                                   , '30','Default retention period for Completed workflows.');
    add_parameter('ALLOW_LEGACY_THEME_COPY'                                    , 'N','If set to Y, the Copy Theme wizard will allow copying desupported themes.');
    add_parameter('ADMIN_DIGEST_DEFAULT_REPORTING_PERIOD'                      , '7','Default reporting period in days, for APEX Administrator Digest');
    add_parameter('ADMIN_DIGEST_MAX_REPORTING_PERIOD'                          , '30','Maximum reporting period in days, for APEX Administrator Digest, older data is removed from the metrics tables.');
    add_parameter('WORKSPACE_FREE_SPACE_LIMIT'                                 , '10','Workspace free space - percentage limit, if the space is lower that the value set here, a report lists them for the APEX Administrator Digest');
    add_parameter('SMTP_RETRY_PERMANENT_ERROR_PATTERNS'                        , '.*','List of regex patterns, which are used to determine whether an SMTP "permanent" error should be treated as temporary. In this case, sending the mail is attempted again.');
    add_parameter('JWT_VERIFY_SIGNATURE_ENABLED'                               , 'N','If set to ''Y'' JWT signature verification is enabled for OpenID connect authentication schemes');

    --
    forall i in 1 .. l_names.count
        insert into wwv_flow_platform_prefs (
            name, value, pref_desc, security_group_id )
        values (
            l_names(i), l_values(i), l_comments(i), 10 );
    commit;
end;
/
set verify off

@^PREFIX.core/wwv_flow_image_prefix.plb

prompt ...Initialize logs
begin
    wwv_flow_log.initialize_log( p_log => 'ACCESS' );
    wwv_flow_log.initialize_log( p_log => 'ACTIVITY' );
    wwv_flow_log.initialize_log( p_log => 'CLICKTHRU' );
    wwv_flow_log.initialize_log( p_log => 'DEBUG' );
    wwv_flow_log.initialize_log( p_log => 'WEBSERVICE' );
    wwv_flow_log.initialize_log( p_log => 'WEBSOURCESYNC' );
    wwv_flow_log.initialize_log( p_log => 'AUTOMATION' );
    wwv_flow_log.initialize_log( p_log => 'EVENT',
                                 p_log_switch_after_days => 30);
    commit;
end;
/

@^PREFIX.core/scripts/set_force_no_capture.sql true
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Loading PDF font data"

prompt ...PDF font data install
@^PREFIX.core/apex_install_pdf_standard_fonts_data.sql
@^PREFIX.core/apex_install_pdf_extra_fonts_data.sql
@^PREFIX.core/apex_install_pdf_unicode_data.sql
@^PREFIX.core/apex_install_pdf_unicode_mirroring.sql
@^PREFIX.core/apex_install_pdf_unicode_arab_shaping.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing Page Designer Metadata"


prompt ...Page Designer metadata install
-- PD meta data are referenced by plug-ins, that's why we always have to install them.
-- We skip the creation of system messages, because they will be loaded by f4470.sql
@^PREFIX.core/apex_install_pe_data.sql NO

@^PREFIX.core/scripts/set_force_no_capture.sql false
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Creating Private Synonyms"


prompt ...Creating Private Synonyms
begin
    wwv_flow_upgrade.create_private_synonyms('^APPUN');
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Inherit Privileges"


rem inherit privileges for APEX accounts

begin

$if sys.dbms_db_version.ver_le_10_2 $then
    null;
$elsif sys.dbms_db_version.ver_le_11_1 $then
    null;
$elsif sys.dbms_db_version.ver_le_11_2 $then
    null;
$else

declare
  already_revoked exception;
  no_user         exception;
  cannot_grant    exception;

  pragma exception_init(already_revoked,-01927);
  pragma exception_init(no_user,-01917);
  pragma exception_init(cannot_grant,-31707);

  procedure revoke_inherit_privilege(user in varchar2) as
  begin
    execute immediate 'revoke inherit privileges on user '||user||' from PUBLIC';
  exception
    when already_revoked or no_user or cannot_grant then
      null;
  end;
begin
  revoke_inherit_privilege('^APPUN');
  revoke_inherit_privilege('APEX_PUBLIC_USER');
  revoke_inherit_privilege('FLOWS_FILES');
  execute immediate 'grant inherit any privileges to ^APPUN';
end;

$end
end;
/
--==============================================================================
@^PREFIX.core/scripts/apxsqler.sql ^INSTALL_TYPE
begin
    if ^APPUN..wwv_install_api.get_error_count > 0 then
        sys.dbms_output.put_line('Errors found. Drop ^APPUN before re-starting the installation.');
    end if;
    ^APPUN..wwv_install_api.end_phase (
        p_phase => 1 );
end;
/
set errorlogging off

whenever sqlerror continue
@^PREFIX.core/scripts/timing_stop.sql

