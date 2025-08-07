Rem  Copyright (c) 2015, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      coreins2.sql
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

define CDB_ROOT     = '^1'
define APPUN        = '^2'
define PREFIX       = '^3'
define INSTALL_TYPE = '^4'

--==============================================================================
@^PREFIX.core/scripts/timing_start.sql "Enabling Phase 2"
begin
    ^APPUN..wwv_install_api.begin_phase (
        p_phase => 2 );
    commit;
end;
/
set errorlogging on table ^APPUN..WWV_INSTALL_ERRORS

alter session set current_schema = ^APPUN;

--==============================================================================
@^PREFIX.core/scripts/install_action.sql "Upgrade Metadata (1)"


declare
    l_ufrom     varchar2(12)    := ^APPUN..wwv_install_api.old_schema;
    l_ufrom_enq varchar2(32767) := sys.dbms_assert.enquote_name(l_ufrom);
    l_appun_enq varchar2(32767) := sys.dbms_assert.enquote_name('^APPUN');
    --------------------------------------------------------------------------------
    procedure ddl (
        p_stmt in varchar2 )
    is
    begin
        execute immediate p_stmt;
    exception when others then
        ^APPUN..wwv_install_api.error (
            p_message   => sqlerrm,
            p_statement => p_stmt );
    end ddl;
--------------------------------------------------------------------------------
    procedure grant_access_to_ufrom
    is
    begin
    if instr('^INSTALL_TYPE','APPCONTAINER') <> 1 then
        sys.dbms_application_info.set_action('upgrade');
    end if;
    --
    -- grant select on tables of old schema to new schema
    --
    for i in ( select object_name
                 from sys.dba_objects
                where owner       = l_ufrom
                  and object_type = 'TABLE'
                  and object_name not like 'SYS%'
                 order by 1 )
    loop
        ddl('grant select on '||
            l_ufrom_enq||'.'||sys.dbms_assert.enquote_name(i.object_name)||
            'to '||l_appun_enq);
    end loop;
    end grant_access_to_ufrom;
--------------------------------------------------------------------------------
    procedure drop_bgexec_coordinator_job
    is
        e_no_coordinator_job_found exception;
        pragma exception_init( e_no_coordinator_job_found, -27475 );
    begin
        sys.dbms_scheduler.drop_job(
            job_name => l_ufrom || '.' || 'ORACLE_APEX_BG_PROCESSES',
            force    => true );
    exception
        when e_no_coordinator_job_found then
            -- the job does not exist (any more); do nothing.
            null;
    end drop_bgexec_coordinator_job;

begin
    if ^APPUN..wwv_install_api.is_upgrade then
        --
        -- at the beginning of the upgrade, we're dropping the background executions
        -- coordinator job, as we need to avoid new background executions being
        -- kicked off during the upgrade.
        --
        -- * Executions which are RUNNING or SCHEDULED will continue execution within the old APEX schema.
        -- * All others will be migrated to the new schema, and background execution will be kicked off
        --   from there.
        --
        drop_bgexec_coordinator_job;
        --
        -- Grant select on all tables of UFROM to APPUN. Note that these
        -- privileges are also required for later steps, so we do not revoke
        -- them again.
        --
        grant_access_to_ufrom;
        --
        -- Grant CREATE TRIGGER to UFROM, because we will create triggers to
        -- disable metadata access. Runtime only instances do not have that
        -- privilege.
        --
        ddl('grant CREATE TRIGGER to '||l_ufrom_enq);
        --
        -- Grant additional required privileges for parallel stats collection.
        -- CREATE JOB is already granted in core_grants.sql.
        --
        ddl('grant MANAGE SCHEDULER to ^APPUN');
        ddl('grant MANAGE ANY QUEUE to ^APPUN');
        --
        -- Copy data, gather stats and run selective upgrades before enabling
        -- constraints.
        --
        wwv_flow_upgrade.copy_flow_meta_data (
            p_owner_from  => l_ufrom,
            p_owner_to    => '^APPUN',
            p_cdb_install => '^CDB_ROOT');
        --
        -- Revoke additional privs again.
        --
        ddl('revoke MANAGE SCHEDULER from ^APPUN');
        ddl('revoke MANAGE ANY QUEUE from ^APPUN');
    end if;
end;
/
@^PREFIX.core/scripts/reset_state_and_show_invalid.sql SYS,^APPUN
