Rem  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxprereq.sql
Rem
Rem    DESCRIPTION
Rem      This script checks prerequisites for Oracle APEX full development
Rem      environment installation and runtime only installation. It should not be
Rem      invoked directly.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem
Rem    Arguments:
Rem     Position 1: Installation type (MANUAL, RUNTIME, etc)
Rem     Position 2: Name of Oracle APEX schema
Rem     Position 3: Name of tablespace for Oracle APEX application user
Rem     Position 4: Name of tablespace for Oracle APEX files user
Rem     Position 5: Name of temporary tablespace or tablespace group
Rem     Position 6: Phases
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      vuvarov   06/26/2012 - Created

set define '^'
set concat on
set concat .
set verify off
set termout off
set termout on

define INSTALL_TYPE = '^1'
define APPUN        = '^2'
define DATTS        = '^3'
define FFTS         = '^4'
define TEMPTS       = '^5'
define PHASES       = '^6'

whenever sqlerror exit
set serveroutput on size unlimited


prompt ... Checking prerequisites (^INSTALL_TYPE)
prompt .

declare
    type t_registry is record (
        comp_id sys.dba_registry.comp_id%type,
        schema  sys.dba_registry.schema%type,
        version sys.dba_registry.version%type,
        status  sys.dba_registry.status%type );

    c_install_type  constant varchar2(30) := '^INSTALL_TYPE.';
    l_errors        pls_integer := 0;
    l_apex_registry t_registry;
    l_xdb_registry  t_registry;
--------------------------------------------------------------------------------
    procedure w (
        p_message in varchar2 )
    is
    begin
        sys.dbms_output.put_line('. '||p_message);
    end w;
--------------------------------------------------------------------------------
    procedure fail (
        p_message in varchar2 )
    is
    begin
        w('  FAIL - '||p_message);
        l_errors := l_errors + 1;
    end fail;
--------------------------------------------------------------------------------
    procedure pass (
        p_message in varchar2 )
    is
    begin
        w('  pass - '||p_message);
    end pass;
--------------------------------------------------------------------------------
    procedure check_sysdba
    is
    begin
        w('SYSDBA Privilege');

        if sys_context('USERENV','ISDBA') = 'FALSE' then
            fail('Oracle APEX installation requires a connection with the SYSDBA privilege.');
        else
            pass('Connection with SYSDBA privilege.');
        end if;
    end check_sysdba;
--------------------------------------------------------------------------------
    procedure check_is_rolling_upg
    is
        e_invalid_userenv exception;
        pragma exception_init(e_invalid_userenv, -2003);
    begin
        w('Database rolling upgrade');

        if sys_context('USERENV','IS_DG_ROLLING_UPGRADE') = 'TRUE' then
            fail('Oracle APEX installation or upgrade not allowed during a database rolling upgrade.');
        else
            pass('No rolling upgrade.');
        end if;
    exception when e_invalid_userenv then
        pass('No rolling upgrade.');
    end check_is_rolling_upg;
--------------------------------------------------------------------------------
    procedure check_db_components
    is
        l_cloud_service varchar2(30);
        l_has_xdb_lite  number;
    begin
        w('DB components');

        for i in ( select comp_id,
                          schema,
                          version,
                          status
                     from sys.dba_registry
                    order by comp_id )
        loop
            if i.comp_id = 'APEX' then
                l_apex_registry := i;
                if i.schema not like 'APEX%' then
                    null;
                elsif i.schema > upper('^APPUN') then
                    fail('The installed version of Oracle APEX is newer: '||i.version);
                    continue;
                elsif c_install_type not in ('DEVINS')
                    and i.schema = upper('^APPUN')
                then
                    fail('This version of Oracle APEX is already installed.');
                    continue;
                end if;
            elsif i.comp_id = 'XDB' then
                l_xdb_registry := i;
            elsif i.comp_id = 'CATPROC' then
                if sys.dbms_db_version.version < 19
                then
                    fail('Oracle APEX installation requires database version 19c or later.');
                    continue;
                end if;
            else
                continue;
            end if;

            pass(i.comp_id||': version='||i.version||
                case when i.status <> 'VALID' then ', status='||i.status end );
        end loop;

        w('XDB');

        select count(*) into l_has_xdb_lite
          from v$parameter
         where name='_no_catalog'
           and (value = 'XDB' or value like 'XDB,%' or value like '%,XDB' or value like '%,XDB,%');

        begin
            l_cloud_service := nvl(sys_context('USERENV','CLOUD_SERVICE'),'NONE');
        exception when others then
            l_cloud_service := 'NONE';
        end;

        if c_install_type = 'RUNTIME' then
            pass('skipped (RUNTIME install)');
        elsif l_has_xdb_lite = 1 then
            pass('XDB Lite installed');
        elsif l_cloud_service = 'DWCS' then
            pass('skipped (DWCS)');
        elsif    l_xdb_registry.comp_id is null
               or l_xdb_registry.status = 'INVALID'
        then
            fail('Oracle APEX installation requires the Oracle XML Database database component.');
        else
            pass('is valid');
        end if;
    end check_db_components;
--------------------------------------------------------------------------------
-- Check spfile and DB session parameters.
--
-- The DB parameter workarea_size_policy has to be set to AUTO. If it is MANUAL,
-- aggregate functions can run into ORA-01467 (bug #33105596). DBAs can change
-- the value at instance level or via ALTER SESSION.
--
    procedure check_db_parameters
    is
    begin
        w('DB parameters');

        for i in ( select name,value
                     from sys.v_$parameter
                    where name='workarea_size_policy' )
        loop
            case i.name
            when 'workarea_size_policy' then
                if i.value = 'AUTO' then
                    pass(i.name||' is AUTO');
                else
                    fail(i.name||' must be AUTO during installation/upgrade');
                end if;
            end case;
        end loop;
    end check_db_parameters;
--------------------------------------------------------------------------------
    procedure check_plsql_web_toolkit
    is
    begin
        w('PL/SQL Web Toolkit');

        declare
            l_version varchar2(1000);
        begin
            execute immediate
                'begin :a := sys.owa_util.get_version(); end;'
                using out l_version;
                pass('version '||l_version);
        exception
            when others then
                fail('Oracle APEX installation requires the PL/SQL Web Toolkit.');
        end;
    end check_plsql_web_toolkit;
--------------------------------------------------------------------------------
-- Check that tablespaces passed in exist (except when converting between Full Dev and Runtime)
--
    procedure check_tablespaces
    is
        procedure check_tbs(
            p_tablespace  in varchar2,
            p_check_group in varchar2 default 'N')
        is
        begin
            for c1 in (
                select count(*) cnt
                  from (select null
                          from sys.dba_tablespaces
                         where tablespace_name = upper(p_tablespace)
                         union all
                        select null
                          from sys.dba_tablespace_groups
                         where group_name = upper(p_tablespace)
                           and p_check_group = 'Y')
            ) loop
                if c1.cnt > 0 then
                    pass('found '||p_tablespace);
                else
                    fail('The tablespace ' || p_tablespace || ' does not exist.');
                end if;
            end loop;
        end check_tbs;
    begin
        w('Tablespaces');

        if c_install_type = 'DEVINS' then
            pass('skipped (DEVINS)');
        else
            check_tbs('^DATTS');
            check_tbs('^FFTS');
            if '^TEMPTS' is null then
                pass('Temp tablespace will be derived');
            else
                check_tbs('^TEMPTS', 'Y');
            end if;
        end if;
    end check_tablespaces;

--------------------------------------------------------------------------------
    procedure check_phases
    is
        l_count number;
        e_table_does_not_exist exception;
        pragma exception_init(e_table_does_not_exist, -942);
        function has_apex_schema return boolean
        is
        begin
            select count(*)
              into l_count
              from sys.dba_users
             where username = '^APPUN';
            return l_count > 0;
        end has_apex_schema;
        function has_flows return boolean
        is
        begin
            begin
                execute immediate 'select count(*) from ^APPUN..wwv_flows'
                   into l_count;
            exception when e_table_does_not_exist then l_count := 0;
            end;
            return l_count > 0;
        end has_flows;
    begin
        w('PHASES (^PHASES.)...');
        --
        -- preconditions:
        -- - Do not check if INSTALL_TYPE = DEVINS
        -- - PHASES must be 1 2 3 1,2 2,3 or 1,2,3
        -- - Phase 1: APEX_nnnnnn must not exist
        -- - Phase 2, Phase 3: APEX_nnnnnn must exist
        -- - Phase 2: wwv_flows must be empty
        -- - Phase 3: wwv_flows must not be empty
        -- - Phase 3: dba_registry must not point to APEX_nnnnnn
        -- - PHASES not 1,2,3: not supported in CDB$ROOT
        --
        if c_install_type = 'DEVINS' then
            pass('skipped (DEVINS)');
            return;
        end if;

        if nvl(length('^PHASES'),0) = 0 or not regexp_like('^PHASES','^'||'(1|2|3|1,2,3|1,2|2,3)$') then
            fail('Invalid value for phases: "^PHASES". Should be 1 2 3 1,2,3 1,2 or 2,3');
        elsif instr('^PHASES','1') > 0 then
            if has_apex_schema then
                fail('Precondition for Phase 1 failed: ^APPUN already exists');
            end if;
        else
            if regexp_instr('^PHASES','[23]') > 0 and not has_apex_schema then
                fail('Precondition for Phase 2,3 failed: ^APPUN does not exist');
            end if;

            if instr('^PHASES',2) > 0 then
                if has_flows then
                    fail('Precondition for Phase 2 failed: Applications already installed');
                end if;
            elsif instr('^PHASES','3') > 0 then
                if not has_flows then
                    fail('Precondition for Phase 3 failed: Applications not installed');
                end if;
                if l_apex_registry.schema = '^APPUN' then
                    fail('Precondition for Phase 3 failed: Already switched to schema ^APPUN');
                end if;
            end if;
        end if;
        --
        if '^PHASES' <> '1,2,3' then
            begin
                execute immediate q'{select count(*) from sys.dual where sys_context('userenv','con_name')='CDB$ROOT' }'
                   into l_count;
            exception when others then l_count := null;
            end;
            if l_count > 0 then
                fail('Reduced downtime upgrade is not supported for installation in CDB$ROOT');
            end if;
        end if;
    end check_phases;
--------------------------------------------------------------------------------
-- Check if APEX_PUBLIC_ROUTER exists, it is Oracle maintained
--
--------------------------------------------------------------------------------
    procedure check_public_router
    is
        l_cnt number := 0;
    begin
        select count(*)
          into l_cnt
          from sys.dba_users
         where username = 'APEX_PUBLIC_ROUTER'
           and oracle_maintained = 'N';

        if l_cnt > 0 then
            fail('APEX_PUBLIC_ROUTER exists as a non-Oracle maintained user.');
        end if;
    end check_public_router;
--------------------------------------------------------------------------------
begin
    check_sysdba;
    check_is_rolling_upg;
    check_db_components;
    check_db_parameters;
    check_plsql_web_toolkit;
    check_tablespaces;
    check_phases;
    if instr(c_install_type,'APPCONTAINER') != 1 then
        check_public_router;
    end if;
    --
    --
    -- Bail out if errors occurred
    --
    if l_errors > 0 then
        w(null);
        w(l_errors||' error'||
            case when l_errors > 1 then 's' end||
            ' occurred');
        raise_application_error (
            -20001,
            'Prerequisite checks failed; unable to proceed with APEX installation' );
    end if;
end;
/

prompt .
prompt ... Prerequisite checks passed.
prompt .

whenever sqlerror continue
