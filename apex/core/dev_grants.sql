set define '^' verify off
prompt dev_grants.sql

Rem  Copyright (c) 2007, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      dev_grants.sql
Rem
Rem    DESCRIPTION
Rem      System and object grants for Oracle APEX development installation
Rem
Rem    NOTES
Rem
Rem
Rem    SCRIPT ARGUMENTS
Rem      None
Rem
Rem    RUNTIME DEPLOYMENT: No
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  07/09/2007 - Created

prompt ...grant APEX owner development privileges

grant execute   on sys.dbms_metadata                  to ^APPUN;
grant execute   on sys.diana                          to ^APPUN;
grant execute   on sys.diutil                         to ^APPUN;
grant execute   on sys.ku$_ddls                       to ^APPUN;
grant execute   on sys.ku$_ddl                        to ^APPUN;
grant execute   on sys.pidl                           to ^APPUN;
grant execute   on sys.dbms_xmlstore                  to ^APPUN;
grant execute   on sys.utl_match                      to ^APPUN;
grant flashback on dual                               to ^APPUN;
grant select    on dba_rollback_segs                  to ^APPUN;
grant select    on sys.all_constraints                to ^APPUN with grant option;
grant select    on sys.all_dependencies               to ^APPUN with grant option;
grant select    on sys.all_objects                    to ^APPUN with grant option;
grant select    on sys.all_synonyms                   to ^APPUN with grant option;
grant select    on sys.dba_arguments                  to ^APPUN;
grant select    on sys.dba_col_privs                  to ^APPUN;
grant select    on sys.dba_ind_expressions            to ^APPUN;
grant select    on sys.dba_mviews                     to ^APPUN;
grant select    on sys.dba_rsrc_consumer_groups       to ^APPUN;
grant select    on sys.dba_rsrc_plan_directives       to ^APPUN;
grant select    on sys.dba_snapshots                  to ^APPUN;
grant select    on sys.dba_trigger_cols               to ^APPUN;
grant select    on sys.dba_external_tables            to ^APPUN;
grant select    on sys.dba_tab_comments               to ^APPUN;
grant select    on sys.gv_$locked_object              to ^APPUN;
grant select    on sys.gv_$mystat                     to ^APPUN;
grant select    on sys.gv_$process                    to ^APPUN;
grant select    on sys.gv_$session_longops            to ^APPUN;
grant select    on sys.gv_$session_wait               to ^APPUN;
grant select    on sys.gv_$sess_io                    to ^APPUN;
grant select    on sys.gv_$sql_plan                   to ^APPUN;
grant select    on sys.gv_$sql                        to ^APPUN;
grant select    on sys.gv_$sysstat                    to ^APPUN;
grant select    on sys.obj$                           to ^APPUN;
grant select    on sys.user_constraints               to ^APPUN;
grant select    on sys.user_source                    to ^APPUN;
grant select    on sys.user_tab_columns               to ^APPUN;
grant select    on sys.user_indexes                   to ^APPUN;
grant select    on sys.v_$object_privilege            to ^APPUN;
grant select    on sys.global_name                    to ^APPUN;
--
-- Grants to silently fail if the base object does not exist
--
declare
    procedure ddl ( p_sql in varchar2 ) is
    begin
        execute immediate p_sql;
    exception
        when others then null;
    end ddl;
begin
    ddl( 'grant select on sys.dba_recyclebin to ^APPUN' );
    ddl( 'grant select on mdsys.cs_srs to ^APPUN' );
    ddl( 'grant select on sys.dba_feature_usage_statistics to ^APPUN' );

    -- keep version dependent privs in sync with core/validate_apex.sql
    if sys.dbms_db_version.version >= 23 then
        -- used by MLE
        ddl( 'grant read on sys.dba_mle_envs        to ^APPUN' );
        ddl( 'grant read on sys.dba_mle_modules     to ^APPUN' );
        ddl( 'grant read on sys.dba_mle_env_imports to ^APPUN' );
        -- used by PQL/Graph
        ddl( 'grant read on sys.dba_property_graphs to ^APPUN' );
        -- used by Vector Search
        ddl( 'grant read on sys.dba_mining_models   to ^APPUN' );
    end if;
    -- For bugs 35770336 (backported to 19c), 37787406
    ddl( 'grant execute on sys.resolve_synonym  to ^APPUN' );
end;
/

prompt ...done grant APEX owner development privileges
