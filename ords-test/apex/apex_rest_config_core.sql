Rem  Copyright (c) 2011, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apex_rest_config_core.sql
Rem
Rem    DESCRIPTION
Rem      This script creates the APEX_LISTENER and APEX_REST_PUBLIC_USER database users:
Rem        - The APEX_LISTENER user is used by Oracle REST Data Services to access the schema objects in the
Rem          APEX_XXXXXX schema containing resource templates and OAuth data. This user is NOT used for execution of
Rem          resource templates or APEX sessions.
Rem        - The APEX_REST_PUBLIC_USER user is used for the execution of resource templates or APEX sessions.
Rem
Rem    PARAMETERS
Rem      - 1: Prefix, e.g. ./
Rem      - 2: Password for APEX_LISTENER
Rem      - 3: Password for APEX_REST_PUBLIC_USER
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIRMENTS
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    cdivilly   09/07/2011 - Created

set define '^'
set concat on
set concat .
set verify off
set autocommit off

define PREFIX  = ^1
define PASSWD1 = '^2'
define PASSWD2 = '^3'
@^PREFIX.core/scripts/set_appun.sql
define LISTENERUN = 'APEX_LISTENER'
define RESTUN = 'APEX_REST_PUBLIC_USER'

prompt ...setting session environment
declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
    l_app_pdb   number := 0;
begin
    $if sys.dbms_db_version.version > 12
        or (     sys.dbms_db_version.version = 12
             and sys.dbms_db_version.release = 2 )
    $then
    begin
        select decode(APPLICATION_ROOT,'YES',1,0)  + nvl(APPLICATION_ROOT_CON_ID,0) into l_app_pdb
          from sys.v$containers
         where con_id = sys_context('USERENV','CON_ID');
    exception when others then
        null;
    end;
    $end
    if l_app_pdb = 0 then
        execute immediate 'alter session set "_ORACLE_SCRIPT"=true';
    end if;
exception
    when invalid_alter_priv then
        null;
end;
/

--
-- convert ^PASSWD* into bind variables
--
variable PASSWD1 varchar2(128)
variable PASSWD2 varchar2(128)
create or replace procedure wwv_flow_assign_pwd sharing=none (
    p_dest out varchar2,
    p_src  in  varchar2 )
is
begin
    p_dest := p_src;
end wwv_flow_assign_pwd;
/
alter session set cursor_sharing=force;
call wwv_flow_assign_pwd(:PASSWD1,'^PASSWD1');
call wwv_flow_assign_pwd(:PASSWD2,'^PASSWD2');
alter session set cursor_sharing=exact;
drop procedure wwv_flow_assign_pwd;
--
-- Retrieve Tablespace and Temporary Tablespace for APEX_PUBLIC_USER
--
column tbs new_value TBLS noprint
column tmp_tbs new_value TEMPTBL noprint
set termout off
select default_tablespace as tbs, temporary_tablespace as tmp_tbs
  from sys.dba_users
 where username = 'APEX_PUBLIC_USER';
set termout on

prompt ...create ^LISTENERUN. and ^RESTUN. users
declare
    l_user_created boolean := false;
    l_stmt         varchar2(32767);
    l_schemas      sys.dbms_registry.schema_list_t;
begin
    --
    -- create user
    --
    for i in ( select u.username, u.password
                 from ( select '^LISTENERUN.' username, :PASSWD1 password from sys.dual union all
                        select '^RESTUN.'     username, :PASSWD2 password from sys.dual ) u
                where not exists ( select null
                                     from sys.dba_users u2
                                    where u.username = u2.username ))
    loop
        l_stmt := 'create user '||sys.dbms_assert.enquote_name(i.username,false)||
                  ' identified by '||sys.dbms_assert.enquote_name(i.password,false)||
                  ' account unlock default tablespace ^TBLS temporary tablespace ^TEMPTBL';
        begin
            execute immediate l_stmt;
        exception when others then
            sys.dbms_output.put_line('Error: '||l_stmt);
            raise;
        end;
        l_user_created := true;
    end loop;
    --
    -- register if created
    --
    sys.dbms_registry.set_session_namespace (
        namespace   => 'DBTOOLS');
    if l_user_created then
        select username
          bulk collect into l_schemas
          from all_users
         where username in ('FLOWS_FILES','APEX_PUBLIC_USER','^LISTENERUN.','^RESTUN.','APEX_PUBLIC_ROUTER')
         order by 1;
        sys.dbms_registry.update_schema_list('APEX', l_schemas);
    end  if;
    --
    -- drop existing synonyms to avoid ORA-38824 (bug #25406642)
    --
    for i in ( select owner,object_type,object_name
                 from sys.dba_objects
                where owner in ('^LISTENERUN.','^RESTUN.')
                  and object_type = 'SYNONYM'
                order by 1,2 )
    loop
        l_stmt := 'drop '||i.object_type||' '||
                  sys.dbms_assert.enquote_name(i.owner,false)||'.'||
                  sys.dbms_assert.enquote_name(i.object_name,false);
        begin
            execute immediate l_stmt;
        exception when others then
            sys.dbms_output.put_line('Error: '||l_stmt);
            raise;
        end;
    end loop;
end;
/


-- Allow REST user to proxy into APEX_PUBLIC_USER for built-in RESTful Services
alter user APEX_PUBLIC_USER grant connect through ^RESTUN.;

-- Ability to connect and interact with the tables referenced below
grant create session to ^LISTENERUN.;

-- Ability to connect and interact with the tables referenced below
grant create session to ^RESTUN.;

-- Used to map a tenant/workspace to its security_group_id, alternatively need view/pl_sql api to determine this
grant select on ^APPUN..wwv_flow_companies to ^LISTENERUN.;

-- Ability for APEX_LISTENER select from wwv_flow_pool_config
-- Ability for ORDS_METADATA to select from the APEX-based REST Services tables, wwv_flow_company_schemas, and wwv_flow_pool_config view
-- Execution of ORDS API ords_metadata.ords_apex_repair.update_objects to update references to the APEX schema
prompt ...grants for APEX_LISTENER and ORDS_METADATA user
declare
    l_plsql    varchar2(4000) := 'declare
    l_success  boolean;
begin
    l_success := ords_metadata.ords_apex_repair.update_objects;
    if l_success then
        sys.dbms_output.put_line(''Updated ORDS views and synonyms successfully.'');
    else
        sys.dbms_output.put_line(''Failed to update ORDS views and synonyms.'');
    end if;
end;';
    --
    procedure ddl ( p_sql in varchar2 ) is
        begin
            execute immediate p_sql;
        exception
            when others then null;
    end ddl;
    --
begin
    for i in ( select username
                 from sys.dba_users
                where username in ('ORDS_METADATA', '^LISTENERUN.'))
    loop
        case i.username
            when '^LISTENERUN.' then
                ddl( 'grant select on ^APPUN..wwv_flow_pool_config to '|| i.username );
            when 'ORDS_METADATA' then

                -- required select privileges for ords schema mapping
                -- grant ORDS_METADATA select on underlying view and tables
                ddl( 'grant select on ^APPUN..wwv_flow_pool_config to '     || i.username || ' with grant option' );
                ddl( 'grant select on ^APPUN..wwv_flow_rt$modules to '      || i.username || ' with grant option' );
                ddl( 'grant select on ^APPUN..wwv_flow_company_schemas to ' || i.username || ' with grant option' );

                -- required select privileges for ords apex rest migration
                ddl( 'grant select on ^APPUN..WWV_FLOW_COMPANIES to '            || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_FND_USER_GROUPS to '      || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$APPROVAL_PRIVS to '    || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$APPROVALS to '         || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$CLIENT_PRIVILEGES to ' || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$CLIENTS to '           || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$HANDLERS to '          || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$PARAMETERS to '        || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$PENDING_APPROVALS to ' || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$PRIVILEGE_GROUPS to '  || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$PRIVILEGES to '        || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$TEMPLATES to '         || i.username );
                ddl( 'grant select on ^APPUN..WWV_FLOW_RT$USER_SESSIONS to '     || i.username );

                -- package with Oracle REST Data Services specific utility
                -- functions
                ddl( 'grant execute on ^APPUN..wwv_flow_listener to '            || i.username );

                ddl( l_plsql );

        end case;
    end loop;
end;
/

-- resource template tables, full r/w access needed
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$privileges to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$modules to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$templates to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$handlers to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$parameters to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$clients to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$client_privileges to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$approvals to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$approval_privs to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$pending_approvals to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$user_sessions to ^LISTENERUN.;
grant insert, update, delete, select on ^APPUN..wwv_flow_rt$privilege_groups to ^LISTENERUN.;

-- resource template tables and view with just read access
grant select on ^APPUN..wwv_flow_rt$services to ^LISTENERUN.;
grant select on ^APPUN..wwv_flow_rt$idm_privs to ^LISTENERUN.;
grant select on ^APPUN..wwv_flow_rt$apex_account_privs to ^LISTENERUN.;

-- package with Oracle REST Data Services specific utility functions
grant execute on ^APPUN..wwv_flow_listener to ^LISTENERUN.;

-- Synonyms to avoid coupling Oracle REST Data Services queries to a particular APEX_XXXXXX schema version
alter session set current_schema = ^LISTENERUN.;

create or replace synonym wwv_flow_companies for ^APPUN..wwv_flow_companies;
create or replace synonym wwv_flow_rt$privileges for ^APPUN..wwv_flow_rt$privileges;
create or replace synonym wwv_flow_rt$modules for ^APPUN..wwv_flow_rt$modules;
create or replace synonym wwv_flow_rt$templates for ^APPUN..wwv_flow_rt$templates;
create or replace synonym wwv_flow_rt$handlers for ^APPUN..wwv_flow_rt$handlers;
create or replace synonym wwv_flow_rt$parameters for ^APPUN..wwv_flow_rt$parameters;
create or replace synonym wwv_flow_rt$clients for ^APPUN..wwv_flow_rt$clients;
create or replace synonym wwv_flow_rt$client_privileges for ^APPUN..wwv_flow_rt$client_privileges;
create or replace synonym wwv_flow_rt$approvals for ^APPUN..wwv_flow_rt$approvals;
create or replace synonym wwv_flow_rt$approval_privs for ^APPUN..wwv_flow_rt$approval_privs;
create or replace synonym wwv_flow_listener for ^APPUN..wwv_flow_listener;
create or replace synonym wwv_flow_rt$services for ^APPUN..wwv_flow_rt$services;
create or replace synonym wwv_flow_rt$idm_privs for ^APPUN..wwv_flow_rt$idm_privs;
create or replace synonym wwv_flow_rt$apex_account_privs for ^APPUN..wwv_flow_rt$apex_account_privs;
create or replace synonym wwv_flow_rt$user_sessions for ^APPUN..wwv_flow_rt$user_sessions;
create or replace synonym wwv_flow_rt$pending_approvals for ^APPUN..wwv_flow_rt$pending_approvals;
create or replace synonym wwv_flow_rt$privilege_groups for ^APPUN..wwv_flow_rt$privilege_groups;
create or replace synonym vc4000array for ^APPUN..wwv_flow_t_varchar2;
create or replace synonym pool_config for ^APPUN..wwv_flow_pool_config;

-- Install REST groups
alter session set current_schema = ^APPUN.;

declare
    c_sgid           constant number := 10;
begin
    wwv_flow_security.g_security_group_id := c_sgid;
    wwv_flow_listener.install_prereq_data();
end;
/

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=false';
exception
    when invalid_alter_priv then
        null;
end;
/
