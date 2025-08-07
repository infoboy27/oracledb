Rem  Copyright (c) 2007, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      runtime_grant_revoke.sql
Rem
Rem    DESCRIPTION
Rem      Removes unnecessary DBA system privileges for a runtime Oracle APEX environment.
Rem
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   11/26/2007 - Created

prompt ...revoke development environment privileges from APEX

declare
    procedure revoke_sys_priv (
        p_privilege in varchar2)
    is
        l_has_priv number;
    begin
        select 1
          into l_has_priv
          from dba_sys_privs
         where grantee   = '^APPUN'
           and privilege = p_privilege;

        execute immediate 'revoke '||p_privilege||' from ^APPUN';
    exception
        when NO_DATA_FOUND then null;
    end revoke_sys_priv;
    procedure revoke_tab_priv (
        p_owner       in varchar2 default 'SYS',
        p_object_name in varchar2,
        p_privilege   in varchar2 )
    is
        l_has_priv number;
    begin
        select 1
          into l_has_priv
          from dba_tab_privs
         where grantee    = '^APPUN'
           and privilege  = p_privilege
           and owner      = p_owner
           and table_name = p_object_name;

        execute immediate 'revoke '||p_privilege||' on '||p_owner||'.'||p_object_name||' from ^APPUN';
    exception
        when NO_DATA_FOUND then null;
    end revoke_tab_priv;
begin
    revoke_sys_priv(p_privilege => 'ALTER DATABASE');
    revoke_sys_priv(p_privilege => 'ALTER USER');
    revoke_sys_priv(p_privilege => 'CREATE CLUSTER');
    revoke_sys_priv(p_privilege => 'CREATE DIMENSION');
    revoke_sys_priv(p_privilege => 'CREATE INDEXTYPE');
    revoke_sys_priv(p_privilege => 'CREATE MATERIALIZED VIEW');
    revoke_sys_priv(p_privilege => 'CREATE OPERATOR');
    revoke_sys_priv(p_privilege => 'CREATE PROCEDURE');
    revoke_sys_priv(p_privilege => 'CREATE ROLE');
    revoke_sys_priv(p_privilege => 'CREATE SEQUENCE');
    revoke_sys_priv(p_privilege => 'CREATE SYNONYM');
    revoke_sys_priv(p_privilege => 'CREATE TABLE');
    revoke_sys_priv(p_privilege => 'CREATE TABLESPACE');
    revoke_sys_priv(p_privilege => 'CREATE TRIGGER');
    revoke_sys_priv(p_privilege => 'CREATE TYPE');
    revoke_sys_priv(p_privilege => 'CREATE USER');
    revoke_sys_priv(p_privilege => 'CREATE VIEW');
    revoke_sys_priv(p_privilege => 'EXECUTE ANY PROCEDURE');

    if sys.dbms_db_version.version >= 23 then
        revoke_tab_priv(p_privilege => 'READ', p_object_name => 'DBA_MLE_ENVS');
        revoke_tab_priv(p_privilege => 'READ', p_object_name => 'DBA_MLE_MODULES');
        revoke_tab_priv(p_privilege => 'READ', p_object_name => 'DBA_MLE_ENV_IMPORTS');
        revoke_tab_priv(p_privilege => 'READ', p_object_name => 'DBA_PROPERTY_GRAPHS');
        revoke_tab_priv(p_privilege => 'READ', p_object_name => 'DBA_MINING_MODELS');
    end if;

    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'RESOLVE_SYNONYM');

    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'DBMS_METADATA');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'DIANA');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'DIUTIL');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'KU$_DDLS');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'KU$_DDL');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'PIDL');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'DBMS_XMLSTORE');
    revoke_tab_priv(p_privilege => 'EXECUTE'   , p_object_name => 'UTL_MATCH');

    revoke_tab_priv(p_privilege => 'FLASHBACK' , p_object_name => 'DUAL');

    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_ROLLBACK_SEGS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'ALL_DEPENDENCIES');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'ALL_CONSTRAINTS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'ALL_OBJECTS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'ALL_SYNONYMS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_ARGUMENTS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_COL_PRIVS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_IND_EXPRESSIONS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_MVIEWS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_RSRC_CONSUMER_GROUPS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_RSRC_PLAN_DIRECTIVES');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_SNAPSHOTS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_TRIGGER_COLS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_EXTERNAL_TABLES');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_RECYCLEBIN');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_FEATURE_USAGE_STATISTICS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'DBA_TAB_COMMENTS');

    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$LOCKED_OBJECT');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$MYSTAT');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$PROCESS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SESSION_LONGOPS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SESSION_WAIT');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SESS_IO');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SQL_PLAN');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SQL');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GV_$SYSSTAT');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'OBJ$');

    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'USER_CONSTRAINTS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'USER_SOURCE');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'USER_TAB_COLUMNS');
    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'USER_INDEXES');

    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'V_$OBJECT_PRIVILEGE');

    revoke_tab_priv(p_privilege => 'SELECT'    , p_object_name => 'GLOBAL_NAME');

    revoke_tab_priv(p_owner => 'MDSYS', p_privilege => 'SELECT', p_object_name => 'CS_SRS');
end;
/
