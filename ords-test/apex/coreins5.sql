Rem  Copyright (c) 2015, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      coreins5.sql
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
Rem      1 - CDB_ROOT     = CDB installation into root
Rem      2 - APPUN        = APEX schema name
Rem      3 - PREFIX       = The path to the file
Rem      4 - INSTALL_TYPE = Full development environment or runtime only
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   02/20/2015 - Split from coreins.sql

set define '^'
set concat on
set concat .
set verify off
set autocommit off
set serveroutput on size unlimited format wrapped

define CDB_ROOT  = '^1'
define APPUN     = '^2'
define PREFIX    = '^3'
define INSTALL_TYPE = '^4'

--==============================================================================
@^PREFIX.core/scripts/timing_start.sql "Enabling Phase 3"
begin
    ^APPUN..wwv_install_api.begin_phase (
        p_phase => 3,
        p_hot   => true );
    commit;
end;
/
set errorlogging on table ^APPUN..WWV_INSTALL_ERRORS

alter session set current_schema = ^APPUN;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Updating DBA_REGISTRY"

begin
    --
    -- We need to directly delete dependencies (to XDB), because the
    -- namespace switch from SERVER to DBTOOLS would result in a FK error.
    -- There is no suitable API in dbms_registry.
    --
    delete from sys.registry$dependencies
     where cid = 'APEX';
    delete from sys.registry$progress
     where cid = 'APEX';
    delete from sys.registry$schemas
     where cid = 'APEX';
    --
    -- Delete duplicate entry that could have been created by older
    -- apxdwngrd.sql.
    --
    begin
        delete from sys.registry$
         where cid       = 'APEX'
           and namespace = 'SERVER'
           and exists ( select null
                          from sys.registry$
                         where cid       = 'APEX'
                           and namespace = 'DBTOOLS' );
    exception when others then
        sys.dbms_output.put_line (
            'Error when deleting duplicate SERVER registry entry:'||
            sqlerrm );
    end;
    --
    -- Update registry
    --
    wwv_install_api.upgrade_registry;
end;
/
--==============================================================================
-- Invalidate objects that depend on the existing public synonyms and the old
-- APEX schema objects.
--
@^PREFIX.core/scripts/install_action.sql "Computing Pub Syn Dependents"

declare
    l_object_ids wwv_flow_t_number;
    l_obj_descs  wwv_flow_t_varchar2;
    l_errors     pls_integer := 0;
    l_ufrom      varchar2(12) := ^APPUN..wwv_install_api.old_schema;
begin
    if l_ufrom is not null and l_ufrom <> '^APPUN' then
        with pub_syns_and_apex_objs as (
            select owner,
                   synonym_name
              from sys.dba_synonyms
             where owner       = 'PUBLIC'
               and table_owner = l_ufrom
             union all
            select l_ufrom,
                   object_name
                  from sys.dba_objects
                 where owner = l_ufrom ),
        deps as (
            select distinct
                   d.owner,
                   d.type,
                   d.name
              from sys.dba_dependencies   d,
                   pub_syns_and_apex_objs p
             where d.owner     not in ('SYS','FLOWS_FILES','PUBLIC', l_ufrom)
               and d.referenced_owner in ('PUBLIC', l_ufrom)
               and d.referenced_owner = p.owner
               and d.referenced_name  = p.synonym_name )
        select o.object_id,
               o.object_type||' '||o.owner||'.'||o.object_name
          bulk collect into
               l_object_ids,
               l_obj_descs
          from deps            d,
               sys.dba_objects o
         where o.owner       = d.owner
           and o.object_type = d.type
           and o.object_name = d.name
           and o.status      = 'VALID'
           and o.owner       <> l_ufrom
           and o.object_type in ( 'SYNONYM',
                                  'VIEW',
                                  'TRIGGER',
                                  'FUNCTION',
                                  'PROCEDURE',
                                  'PACKAGE',
                                  'PACKAGE BODY',
                                  'TYPE',
                                  'TYPE BODY' )
         order by o.owner,
                  o.object_id;

        ^APPUN..wwv_install_api.action (
            p_action => 'Invalidating Pub Syn Dependents',
            p_info   => l_object_ids.count||' objects' );

        for i in 1 .. l_object_ids.count loop
            if mod(i, 100) = 1 and instr('^INSTALL_TYPE','APPCONTAINER') <> 1 then
                sys.dbms_application_info.set_action('Invalidating '||i||'/'||l_object_ids.count);
            end if;

            begin
                sys.dbms_utility.invalidate (
                    p_object_id => l_object_ids(i) );
            exception when others then
                ^APPUN..wwv_install_api.error (
                    p_message   => 'WARN: '||sqlerrm,
                    p_statement => 'dbms_utility.invalidate('||l_object_ids(i)||') for '||l_obj_descs(i) );
                l_errors := l_errors + 1;
                exit when l_errors = 100;
            end;
        end loop;
    end if;
end;
/

@^PREFIX.core/scripts/reset_state_and_show_invalid.sql SYS,^APPUN

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Upgrade Hot Metadata and Switch Schemas"


alter session set current_schema = ^APPUN;

begin
    wwv_flow_upgrade.switch_schemas (
        p_from        => ^APPUN..wwv_install_api.old_schema,
        p_to          => '^APPUN',
        p_create_jobs => not ^APPUN..wwv_install_api.is_upgrade );
    commit;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing FLOWS_FILES Objects"

@^PREFIX.core/flows_files_new2.sql

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing APEX$SESSION Context"


create or replace context APEX$SESSION sharing=none using ^APPUN..wwv_flow_session_context
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Recompiling ^APPUN."
begin
    if instr('^INSTALL_TYPE','APPCONTAINER') <> 1 then
        sys.dbms_application_info.set_action('recompiling');
        sys.utl_recomp.recomp_parallel(schema => '^APPUN.');
    end if;
end;
/

@^PREFIX.core/scripts/reset_state_and_show_invalid.sql SYS,FLOWS_FILES,^APPUN
--
-- After a session state reset, wwv_install_api does not remember the phase it
-- was in. Since phase 4 typically already started at this stage via a
-- background job, the built-in current phase detection will assume the actions
-- below belong to phase 4. We therefore have to manually set the current phase
-- to 3.
--
exec ^APPUN..wwv_install_api.continue_phase(p_phase => 3);

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Installing APEX REST Config"

--
-- Configure RESTful services for this instance if APEX_LISTENER exists
--
column thescript  new_val script
set termout off
select decode(has_rest, 1, 'apex_rest_config_core.sql', 'core/null1.sql') thescript
  from ( select count(*) has_rest
           from sys.dba_users
          where username = 'APEX_LISTENER' );
set termout on
@^PREFIX.core/scripts/gen_adm_pwd.sql
@^PREFIX.^script ^PREFIX. ^ADM_PWD ^ADM_PWD

--
-- Invoke ords_metadata.ords_apex_repair.update_objects if procedure is found
--
declare
    l_cnt      number;
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

begin
    select count(*)
      into l_cnt
      from sys.dba_procedures
     where owner = 'ORDS_METADATA'
       and object_name = 'ORDS_APEX_REPAIR'
       and procedure_name = 'UPDATE_OBJECTS';
    if l_cnt > 0 then
        begin
            execute immediate 'grant select on ^APPUN..wwv_flow_pool_config to ORDS_METADATA with grant option';
            execute immediate l_plsql;
        exception
            when others then null;
        end;
    end if;
end;
/


--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Set Loaded/Upgraded in Registry"

begin
    ^APPUN..wwv_install_api.set_upgraded_in_registry;
    ^APPUN..wwv_flow_upgrade.set_patch_applied;
    commit;
end;
/
--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Removing Unused SYS Objects and Public Privs"

declare
    l_old_schema   varchar2(30);
    l_dropped boolean;
    e_does_not_exist exception;
    pragma exception_init(e_does_not_exist,-942);
    e_does_not_exist2 exception;
    pragma exception_init(e_does_not_exist2, -4043);
    e_compile_error exception;
    pragma exception_init(e_compile_error, -24344);
    e_compiled_with_errors_in_root exception;
    pragma exception_init(e_compiled_with_errors_in_root, -65047);
    procedure ddl(p_sql in varchar2)
    is
    begin
        sys.dbms_output.put_line('...'||p_sql);
        execute immediate p_sql;
        l_dropped := true;
    exception
    when e_does_not_exist or e_does_not_exist2 then
        l_dropped := false;
    when e_compile_error or e_compiled_with_errors_in_root then
        sys.dbms_output.put_line('...(compilation error)');
    end ddl;
begin
    if ^APPUN..wwv_install_api.is_upgrade then
        ddl('drop view sys.flow_sessions');
        ddl('drop view sys.flow_parameters');
        ddl('drop view sys.flow_sqlarea');
        ddl('drop view sys.flow_sga');
        ddl('drop view sys.wwv_flow_gv$session');
        if l_dropped then
            -- can not keep old version because of dependencies
            ddl('drop package sys.wwv_dbms_sql');
        end if;
        --
        -- drop upgrade triggers in old schema to avoid errors on downgrade
        --
        l_old_schema := ^APPUN..wwv_install_api.old_schema;
        ^APPUN..wwv_flow_upgrade.drop_upgrade_triggers (
            p_from => l_old_schema );
        --
        -- Recompile SYS objects that became invalid by the revokes. We do not
        -- need new grants as this is SYS, the REVOKE statement simply changed
        -- the object status.
        --
        for i in ( select object_name
                     from sys.dba_objects
                    where owner       =    'SYS'
                      and object_name like 'WWV%'
                      and object_type =    'PACKAGE BODY'
                      and status      =    'INVALID'
                    order by 1 )
        loop
            ddl('alter package sys.'||
                sys.dbms_assert.enquote_name(i.object_name)||
                ' compile body reuse settings');
        end loop;
    end if;
end;
/

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Validating Installation"
begin
    if '^INSTALL_TYPE' = 'INTERNAL' and ^APPUN..wwv_install_api.is_upgrade then
        null;
    elsif instr('^INSTALL_TYPE','APPCONTAINER') = 1 then
        -- Try to REST enable schema to use /r path for ORDS 24.1 onwards for APPCONTAINER ONLY
        -- For all other types of install use sys.validate_apex as it sets _oracle_script=true which is required for ORDS
        sys.wwv_util_APEX_240200.post_ords_upgrade;
    else
        sys.validate_apex;
    end if;
end;
/

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

column flow_version new_val version
set termout off
select wwv_flows_release as flow_version from sys.dual where rownum = 1;
set termout on

begin
for c1 in (select value
             from sys.v_$parameter
            where name = 'job_queue_processes') loop
    sys.dbms_output.put_line('JOB_QUEUE_PROCESSES: '|| c1.value);
    exit;
end loop;
end;
/
--==============================================================================
@^PREFIX.core/scripts/timing_stop.sql
begin
    ^APPUN..wwv_install_api.end_phase (
        p_phase       => 3,
        p_raise_error => false );
    ^APPUN..wwv_install_api.end_install;
end;
/
set errorlogging off

prompt
prompt
prompt
prompt      Thank you for installing Oracle APEX ^version.
prompt
prompt      Oracle APEX is installed in the ^APPUN schema.
prompt
prompt      The structure of the link to the Oracle APEX Administration Services is as follows:
prompt      http://host:port/ords/apex_admin
prompt
prompt      The structure of the link to the Oracle APEX development environment is as follows:
prompt      http://host:port/ords/apex
prompt

column global_name new_value gname
set termout off
select user global_name from sys.dual;
set termout on
set heading on
set feedback on
set sqlprompt '^gname> '
