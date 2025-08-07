Rem  Copyright (c) 2015, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      coreins3.sql
Rem
Rem    DESCRIPTION
Rem      This is a primary installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by apexins.sql, the primary installation script for APEX.
Rem
Rem    NOTES
Rem      Ensure that all arguments (except image prefix) are entered in UPPERCASE.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    Arguments:
Rem      1 - CDB_ROOT       = CDB installation into root
Rem      2 - APPUN          = APEX schema name
Rem      3 - PREFIX         = The path to the file
Rem      4 - INSTALL_TYPE   = Full development environment or runtime only
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   02/20/2015 - Split from coreins.sql

set define '^'
set concat on
set concat .
set verify off
set autocommit off
set serveroutput on size unlimited format wrapped

define CDB_ROOT     = '^1'
define APPUN        = '^2'
define PREFIX       = '^3'
define INSTALL_TYPE = '^4'

--
-- Bug 37467375 SHARING variable must be redefined if a phased install 
-- is being performed, and phase 2 is inovked from a different session 
-- than phase 1
--
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

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Upgrade Metadata (2)"


set errorlogging on table ^APPUN..WWV_INSTALL_ERRORS

alter session set current_schema = ^APPUN;

begin
if ^APPUN..wwv_install_api.is_upgrade Then
    sys.dbms_output.put_line('   -- Upgrading new schema. -------');
    wwv_flow_upgrade.upgrade_to_latest (
        p_owner => '^APPUN',
        p_from  => ^APPUN..wwv_install_api.old_schema );
    commit;
end if;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Recompiling ^APPUN schema"


begin
    if instr('^INSTALL_TYPE','APPCONTAINER') <> 1 then
        sys.dbms_application_info.set_action('recompiling');
        sys.utl_recomp.recomp_parallel(schema => '^APPUN.');
    end if;
end;
/

alter package sys.wwv_dbms_sql_^APPUN. compile body;
alter type wwv_flow_t_writer compile body;

@^PREFIX.core/scripts/reset_state_and_show_invalid.sql SYS,^APPUN

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Configuring Restricted Schemas"


prompt ...Drop APEX_INSTANCE_ADMIN_USER - Administration REST Interface is desupported.
declare
    l_instadmin_user_used    number := 0;
    l_instadmin_user_has_obj number := 0;

    c_ufrom                  constant varchar2(12) := ^APPUN..wwv_install_api.old_schema;
    c_restadmin_user_name    constant varchar2(24) := 'APEX_INSTANCE_ADMIN_USER';
begin
    -- detect whether APEX_INSTANCE_ADMIN_USER was assigned to the INTERNAL
    -- workspace in the previous APEX installation.
    if c_ufrom is not null then
        begin
            execute immediate 'select 1'||
                            '  from '||sys.dbms_assert.enquote_name(c_ufrom)||
                                    '.wwv_flow_company_schemas'||
                            ' where security_group_id = 10'||
                            ' and schema = :1'
            into l_instadmin_user_used
            using c_restadmin_user_name;
        exception
            when NO_DATA_FOUND then l_instadmin_user_used := 0;
        end;
    end if;
    -- detect whether APEX_INSTANCE_ADMIN_USER has objects.
    begin
        select 1
          into l_instadmin_user_has_obj
          from sys.dba_objects
         where owner = c_restadmin_user_name
           and rownum = 1;
    exception
        when NO_DATA_FOUND then
            l_instadmin_user_has_obj := 0;
    end;

    -- if APEX_INSTANCE_ADMIN_USER has no objects and was assigned to the INTERNAL
    -- workspace, we can safely assume that it was used for the REST Administration interface.
    if l_instadmin_user_has_obj = 0 and l_instadmin_user_used = 1 then
        begin
            execute immediate 'drop user ' || c_restadmin_user_name;
            sys.dbms_output.put_line('... APEX_INSTANCE_ADMIN_USER dropped.');
        exception
            when others then
                sys.dbms_output.put_line('...could not drop APEX_INSTANCE_ADMIN_USER. Must drop manually.');
        end;
    else
        sys.dbms_output.put_line('...APEX_INSTANCE_ADMIN_USER not dropped.');
    end if;
end;
/

prompt ...Initialize the table of Oracle default schema names
declare
    l_schemas wwv_flow_t_varchar2;
begin
    l_schemas := ^APPUN..wwv_flow_security.predefined_restricted_schemas
                 multiset union
                 wwv_flow_t_varchar2 (
                     'OE',
                     'PM',
                     'QS', 'QS_ADM', 'QS_CB', 'QS_CBADM', 'QS_CS', 'QS_ES', 'QS_OS', 'QS_WS',
                     'SCOTT',
                     'SH' );
    --
    -- add existing APEX schemas
    --
    for i in ( select username
                 from sys.dba_users
                where username between 'APEX_030200' and '^APPUN.'
                   or username between 'FLOWS_010500' and 'FLOWS_030100' )
    loop
        l_schemas.extend;
        l_schemas(l_schemas.count) := i.username;
    end loop;

    insert into wwv_flow_restricted_schemas (
           schema )
    select schema
      from ( select s.column_value schema
               from table(l_schemas) s
           ) s
     where not exists ( select null
                          from wwv_flow_restricted_schemas s2
                         where s2.schema = s.schema );
end;
/
prompt ...Service signup Question install
begin
    -- insert disabled service signup question. on upgrade, the question can already exist. we ignore that error.
    insert into wwv_flow_prov_signup_q (id, pkg_app_only_ws_yn, show_schema_yn, survey_enabled_yn, justification_required_yn) values (1, 'N', 'N', 'N', 'Y');
exception when dup_val_on_index then null;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Upgrading Host ACL"


--
-- now carry over host ACEs. Depending on whether the DBA_HOST_ACES view as the PRIVATE_TARGET
-- column, the private_target parameter will be respected, or not.
--
declare
    type t_ace is record(
        host               sys.dba_host_aces.host%type,
        lower_port         sys.dba_host_aces.lower_port%type,
        upper_port         sys.dba_host_aces.upper_port%type,
        grant_type         sys.dba_host_aces.grant_type%type,
        inverted_principal sys.dba_host_aces.inverted_principal%type,
        privileges         sys.xs$name_list,
        priv_list          varchar2(32767),
        private_target     varchar2(255) );

    type t_aces is table of t_ace index by pls_integer;

    l_ufrom                   varchar2(12)  := ^APPUN..wwv_install_api.old_schema;
    l_appun                   varchar2(12)  := '^APPUN';
    l_supports_private_target boolean       := false;

    l_aces                    t_aces;
    l_ace_query               varchar2(32767);
    l_ace_plsql               varchar2(32767);

    ----------------------------------------------------------------------------
    procedure determine_has_private_target
    is
        l_dummy                   varchar2(4000);
        --
        -- ORA-00904 on the query below means: the "private_target" column is not present.
        --
        e_no_private_target       exception;
        pragma exception_init( e_no_private_target, -904 );
    begin
        --
        -- execute a test query to see whether the private_target column exists.
        --
        execute immediate 'select private_target from sys.dba_host_aces where 1=0'
           into l_dummy;
    exception
       when no_data_found then
           l_supports_private_target := true;
       when e_no_private_target then
           l_supports_private_target := false;
    end determine_has_private_target;

begin
    if ^APPUN..wwv_install_api.is_upgrade then

        determine_has_private_target;

        l_ace_query := q'~select host,
                                 lower_port,
                                 upper_port,
                                 grant_type,
                                 inverted_principal,
                                 cast(sys.sys_nt_collect(privilege) as sys.xs$name_list) as privileges,
                                 listagg(privilege, ',') within group (order by privilege) as priv_list,~'
                    || case when l_supports_private_target
                            then 'private_target'
                            else 'null as private_target'
                       end
                    || q'~  from sys.dba_host_aces
                           where principal      = :UFROM
                             and principal_type = 'DATABASE'
                           group by host,
                                    lower_port,
                                    upper_port,
                                    grant_type,
                                    inverted_principal~'
                    || case when l_supports_private_target
                            then ',private_target'
                       end
                    || q'~ order by 1,2~';

        l_ace_plsql := q'~declare
                              l_private_target varchar2(4000) := :B1;
                          begin
                              sys.dbms_network_acl_admin.append_host_ace(
                                  host           => :B2,
                                  ace            => sys.xs$ace_type (
                                                        privilege_list => :B3,
                                                        granted        => case when :B4  = 'DENY' then false
                                                                               else true
                                                                          end,
                                                        inverted       => case when :B5 = 'YES' then true
                                                                               else false
                                                                          end,
                                                        principal_name => :B6,
                                                        principal_type => sys.xs_acl.ptype_db ),
                                  lower_port     => :B7,
                                  upper_port     => :B8~'
                    || case when l_supports_private_target
                            then q'~,private_target => case when l_private_target = 'YES' then true else false end~'
                       end
                    || q'~    );
                              sys.dbms_output.put_line('done');
                          exception when others then
                              sys.dbms_output.put_line(sqlerrm);
                          end;~';

        execute immediate l_ace_query
           bulk collect into l_aces
          using l_ufrom;

        for i in 1 .. l_aces.count loop
            sys.dbms_output.put('...'||l_aces( i ).host||
                                case when l_aces( i ).lower_port is not null then
                                          ':'||l_aces( i ).lower_port||'-'||l_aces( i ).upper_port
                                end ||
                                ' (' || l_aces( i ).priv_list || ') - ');

            execute immediate l_ace_plsql
              using l_aces(i).private_target,
                    l_aces(i).host,
                    l_aces(i).privileges,
                    l_aces(i).grant_type,
                    l_aces(i).inverted_principal,
                    l_appun,
                    l_aces(i).lower_port,
                    l_aces(i).upper_port;

        end loop;
    else
        sys.dbms_output.put_line('...not implemented on new install');
    end if;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Upgrading Wallet ACL"
--
-- now carry over wallet ACEs. Although we don't need dynamic PL/SQL for this one, we keep the approach
-- similar to the migration of Host ACEs above.
--
declare
    type t_ace is record(
        wallet_path        sys.dba_wallet_aces.wallet_path%type,
        grant_type         sys.dba_wallet_aces.grant_type%type,
        inverted_principal sys.dba_wallet_aces.inverted_principal%type,
        privileges         sys.xs$name_list,
        priv_list          varchar2(32767) );

    type t_aces is table of t_ace index by pls_integer;

    l_ufrom                   varchar2(12)  := ^APPUN..wwv_install_api.old_schema;
    l_appun                   varchar2(12)  := '^APPUN';

    l_aces                    t_aces;
    l_ace_query               varchar2(32767);
    l_ace_plsql               varchar2(32767);

begin
    if ^APPUN..wwv_install_api.is_upgrade then

        l_ace_query := q'~select wallet_path,
                                 grant_type,
                                 inverted_principal,
                                 cast(sys.sys_nt_collect(privilege) as sys.xs$name_list) as privileges,
                                 listagg(privilege, ',') within group (order by privilege) as priv_list
                            from sys.dba_wallet_aces
                           where principal      = :UFROM
                             and principal_type = 'DATABASE'
                           group by wallet_path,
                                    grant_type,
                                    inverted_principal
                           order by 1,2~';

        l_ace_plsql := q'~begin
                              sys.dbms_network_acl_admin.append_wallet_ace(
                                  wallet_path    => :B1,
                                  ace            => sys.xs$ace_type (
                                                        privilege_list => :B2,
                                                        granted        => case when :B3  = 'DENY' then false
                                                                               else true
                                                                          end,
                                                        inverted       => case when :B4 = 'YES' then true
                                                                               else false
                                                                          end,
                                                        principal_name => :B5,
                                                        principal_type => sys.xs_acl.ptype_db ) );
                              sys.dbms_output.put_line('done');
                          exception when others then
                              sys.dbms_output.put_line(sqlerrm);
                          end;~';

        execute immediate l_ace_query
           bulk collect into l_aces
          using l_ufrom;

        for i in 1 .. l_aces.count loop
            sys.dbms_output.put('...'||l_aces( i ).wallet_path ||
                                ' (' || l_aces( i ).priv_list || ') - ');

            execute immediate l_ace_plsql
              using l_aces(i).wallet_path,
                    l_aces(i).privileges,
                    l_aces(i).grant_type,
                    l_aces(i).inverted_principal,
                    l_appun;

        end loop;
    else
        sys.dbms_output.put_line('...not implemented on new install');
    end if;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Upgrading DIRECTORY object grants"
--
declare
    l_ufrom                   varchar2(12)  := ^APPUN..wwv_install_api.old_schema;
    l_appun                   varchar2(12)  := '^APPUN';
begin

    if ^APPUN..wwv_install_api.is_upgrade then
        for d in (
            select d.directory_name,
                   p.privilege
              from sys.dba_directories d,
                   sys.dba_tab_privs   p
             where d.directory_name = p.table_name
               and p.type           = 'DIRECTORY'
               and p.grantee        = l_ufrom
             order by d.directory_name, p.privilege )
        loop
            sys.dbms_output.put( '...' || d.privilege || ' on ' || d.directory_name || ' - ' );

            execute immediate    'grant '
                              || d.privilege
                              || ' on directory '
                              || sys.dbms_assert.enquote_name( d.directory_name )
                              || ' to '
                              || sys.dbms_assert.enquote_name( l_appun );

            sys.dbms_output.put_line( 'done' );
        end loop;
    else
        sys.dbms_output.put_line( '...not implemented on new install' );
    end if;
end;
/

@^PREFIX.core/scripts/set_force_no_capture.sql true
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4411"

@^PREFIX.builder/f4411.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4470"

@^PREFIX.builder/f4470.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing 4155"

@^PREFIX.builder/f4155.sql
set define '^'

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing Central Themes"

@^PREFIX.core/themes/apex_install_central_themes.sql
set define '^'

prompt ...Applications install if necessary
column foo new_val script
set termout off
select decode('^INSTALL_TYPE','RUNTIME','core/null1.sql','appins.sql') foo from sys.dual;
set termout on
@^PREFIX.^script

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
begin
    if '^INSTALL_TYPE' in ('CLOUD','CLOUDEXT') then
        update ^APPUN..wwv_flow_build_options
           set patch_status = 'EXCLUDE'
         where flow_id = 4050
           and patch_name = 'Full Access Only';
        commit;
    end if;
end;
/

@^PREFIX.core/scripts/set_force_no_capture.sql false
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Updating Plug-in settings of Applications"

begin
    if ^APPUN..wwv_install_api.is_upgrade then
        sys.dbms_output.put_line('   -- Updating Plug-in settings of Applications -------');
        wwv_flow_upgrade.update_plugin_settings (
            p_to => '^APPUN' );
        commit;
    end if;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Copying Instance settings"

begin
    if ^APPUN..wwv_install_api.is_upgrade then
        sys.dbms_output.put_line('   -- Copying preferences to new schema. -------');
        wwv_flow_upgrade.copy_prefs (
            p_owner_from => ^APPUN..wwv_install_api.old_schema,
            p_owner_to   => '^APPUN' );
        commit;
    end if;
end;
/
