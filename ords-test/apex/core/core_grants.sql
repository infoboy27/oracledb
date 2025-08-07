set define '^' verify off
prompt ...core_grants.sql

Rem  Copyright (c) 2007, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      core_grants.sql
Rem
Rem    DESCRIPTION
Rem      System and object grants for Oracle APEX core (runtime) installation
Rem
Rem    NOTES
Rem
Rem
Rem    SCRIPT ARGUMENTS
Rem      None
Rem
Rem    RUNTIME DEPLOYMENT: Yes
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jkallman  07/09/2007 - Created

prompt ...grant APEX owner core privileges

--
-- tab (object) privs
--
grant execute on sys.dbms_application_info          to ^APPUN;
grant execute on sys.dbms_assert                    to ^APPUN;
grant execute on sys.dbms_db_version                to ^APPUN;
grant execute on sys.dbms_flashback                 to ^APPUN;
grant execute on sys.dbms_ldap                      to ^APPUN;
grant execute on sys.dbms_ldap_utl                  to ^APPUN;
grant execute on sys.dbms_lob                       to ^APPUN with grant option;
grant execute on sys.dbms_lock                      to ^APPUN;
grant execute on sys.dbms_output                    to ^APPUN;
grant execute on sys.dbms_random                    to ^APPUN;
grant execute on sys.dbms_registry                  to ^APPUN;
grant execute on sys.dbms_scheduler                 to ^APPUN;
grant execute on sys.dbms_session                   to ^APPUN;
grant execute on sys.dbms_sql                       to ^APPUN;
grant execute on sys.dbms_stats                     to ^APPUN;
grant execute on sys.dbms_transaction               to ^APPUN;
grant execute on sys.dbms_types                     to ^APPUN;
grant execute on sys.dbms_utility                   to ^APPUN;
grant execute on sys.dbms_xmlgen                    to ^APPUN;
grant execute on sys.dbms_xplan                     to ^APPUN;
grant execute on sys.dbms_xplan_type_table          to ^APPUN;
grant execute on sys.htf                            to ^APPUN;
grant execute on sys.htp                            to ^APPUN;
grant execute on sys.owa_cookie                     to ^APPUN;
grant execute on sys.owa_custom                     to ^APPUN;
grant execute on sys.owa                            to ^APPUN;
grant execute on sys.owa_util                       to ^APPUN;
grant execute on sys.utl_compress                   to ^APPUN;
grant execute on sys.utl_encode                     to ^APPUN;
grant execute on sys.utl_http                       to ^APPUN;
grant execute on sys.utl_i18n                       to ^APPUN;
grant execute on sys.utl_lms                        to ^APPUN;
grant execute on sys.utl_raw                        to ^APPUN;
grant execute on sys.utl_smtp                       to ^APPUN;
grant execute on sys.utl_url                        to ^APPUN;
grant execute on sys.utl_tcp                        to ^APPUN;
grant execute on sys.wpg_docload                    to ^APPUN;
grant execute on sys.xmltype                        to ^APPUN;
grant execute on sys.anydata                        to ^APPUN;
grant select  on sys.all_col_comments               to ^APPUN with grant option;
grant select  on sys.all_scheduler_jobs             to ^APPUN;
grant select  on sys.all_tab_columns                to ^APPUN;
grant select  on sys.all_tab_comments               to ^APPUN;
grant select  on sys.all_users                      to ^APPUN with grant option;
grant select  on sys.all_views                      to ^APPUN;
grant select  on sys.database_properties            to ^APPUN;
grant select  on sys.dba_col_comments               to ^APPUN;
grant select  on sys.dba_coll_types                 to ^APPUN;
grant select  on sys.dba_cons_columns               to ^APPUN;
grant select  on sys.dba_constraints                to ^APPUN;
grant select  on sys.dba_data_files                 to ^APPUN;
grant select  on sys.dba_dependencies               to ^APPUN;
grant select  on sys.dba_errors                     to ^APPUN;
grant select  on sys.dba_extents                    to ^APPUN;
grant select  on sys.dba_free_space                 to ^APPUN;
grant select  on sys.dba_ind_columns                to ^APPUN;
grant select  on sys.dba_indexes                    to ^APPUN;
grant select  on sys.dba_jobs                       to ^APPUN;
grant select  on sys.dba_lock                       to ^APPUN;
grant select  on sys.dba_network_acls               to ^APPUN;
grant select  on sys.dba_network_acl_privileges     to ^APPUN;
grant select  on sys.dba_objects                    to ^APPUN;
grant select  on sys.dba_procedures                 to ^APPUN;
grant select  on sys.dba_profiles                   to ^APPUN;
grant select  on sys.dba_proxies                    to ^APPUN;
grant select  on sys.dba_registry                   to ^APPUN;
grant select  on sys.dba_role_privs                 to ^APPUN;
grant select  on sys.dba_roles                      to ^APPUN;
grant select  on sys.dba_scheduler_jobs             to ^APPUN with grant option;
grant select  on sys.dba_scheduler_running_jobs     to ^APPUN with grant option;
grant select  on sys.dba_scheduler_job_run_details  to ^APPUN with grant option;
grant select  on sys.dba_segments                   to ^APPUN;
grant select  on sys.dba_sequences                  to ^APPUN;
grant select  on sys.dba_source                     to ^APPUN;
grant select  on sys.dba_synonyms                   to ^APPUN;
grant select  on sys.dba_sys_privs                  to ^APPUN;
grant select  on sys.dba_tab_columns                to ^APPUN;
grant select  on sys.dba_tab_cols                   to ^APPUN;
grant select  on sys.dba_tab_col_statistics         to ^APPUN;
grant select  on sys.dba_tablespaces                to ^APPUN;
grant select  on sys.dba_tablespace_usage_metrics   to ^APPUN;
grant select  on sys.dba_tables                     to ^APPUN;
grant select  on sys.dba_tab_privs                  to ^APPUN;
grant select  on sys.dba_triggers                   to ^APPUN;
grant select  on sys.dba_ts_quotas                  to ^APPUN;
grant select  on sys.dba_types                      to ^APPUN;
grant select  on sys.dba_users                      to ^APPUN;
grant select  on sys.dba_views                      to ^APPUN;
grant select  on sys.dual                           to ^APPUN with grant option;
grant select  on sys.nls_database_parameters        to ^APPUN;
grant select  on sys.nls_session_parameters         to ^APPUN;
grant select  on sys.user_dependencies              to ^APPUN;
grant select  on sys.user_objects                   to ^APPUN;
grant select  on sys.user_role_privs                to ^APPUN;
grant select  on sys.user_tables                    to ^APPUN;
grant select  on sys.dba_rsrc_consumer_group_privs  to ^APPUN;
grant select  on sys.user_sys_privs                 to ^APPUN;
grant select  on sys.v_$session                     to ^APPUN;
grant select  on sys.gv_$session                    to ^APPUN;
grant select  on sys.gv_$backup                     to ^APPUN;
grant select  on sys.v_$database                    to ^APPUN;
grant select  on sys.v_$diag_info                   to ^APPUN;
grant select  on sys.gv_$instance                   to ^APPUN;
grant select  on sys.v_$open_cursor                 to ^APPUN;
grant select  on sys.gv_$open_cursor                to ^APPUN;
grant select  on sys.v_$object_dependency           to ^APPUN;
grant select  on sys.v_$parameter                   to ^APPUN;
grant select  on sys.v_$sesstat                     to ^APPUN;
grant select  on sys.gv_$sesstat                    to ^APPUN;
grant select  on sys.v_$sql                         to ^APPUN;
grant select  on sys.v_$sql_plan                    to ^APPUN;
grant select  on sys.v_$statname                    to ^APPUN;
grant select  on sys.v_$dblink                      to ^APPUN;
grant select  on sys.v_$timezone_names              to ^APPUN;
grant select  on sys.v_$reserved_words              to ^APPUN;
grant select  on sys.v_$diag_alert_ext              to ^APPUN;
grant select  on sys.v_$version                     to ^APPUN;
grant select  on sys.v_$pdbs                        to ^APPUN;
grant select  on sys.dba_db_links                   to ^APPUN;
grant select  on sys.all_credentials                to ^APPUN;

declare
    e_invalid_table_name exception;
    pragma exception_init(e_invalid_table_name, -903);
    e_missing_privilege  exception;
    pragma exception_init(e_missing_privilege, -990);
    e_table_does_not_exist exception;
    pragma exception_init(e_table_does_not_exist, -942);
    e_proc_does_not_exist  exception;
    pragma exception_init(e_proc_does_not_exist, -4042);
    e_user_does_not_exist  exception;
    pragma exception_init(e_user_does_not_exist, -1917);
    procedure ddl (
        p_sql                  in varchar2 )
    is
    begin
        execute immediate p_sql;
    exception when e_invalid_table_name
                or e_missing_privilege
                or e_table_does_not_exist
                or e_proc_does_not_exist
                or e_user_does_not_exist
    then
        null;
    end ddl;
    procedure grant_system_privilege (
        priv_name in varchar2,
        user_name in varchar2 default '^APPUN' )
    is
    begin
        sys.xs_admin_util.grant_system_privilege (
            priv_name => priv_name,
            user_name => user_name );
    exception when others then null;
    end;
begin
    --
    -- Grant select on sys.v_$encryption_wallet
    --
    ddl(p_sql => 'grant select  on sys.v_$encryption_wallet to ^APPUN');
    --
    -- Grant execute on sys.dbms_crypto
    --
    ddl(p_sql => 'grant execute on sys.dbms_crypto to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_crypto_internal to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_crypto_stats_int to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_stats_internal to ^APPUN');
    ddl(p_sql => 'grant execute on sys.getlong to ^APPUN');
    ddl(p_sql => 'grant execute on sys.sys_nt_collect to ^APPUN');
    ddl(p_sql => 'grant execute on sys.sys_stub_for_purity_analysis to ^APPUN');
    --
    -- Xmltype and XDB dependencies
    --
    ddl(p_sql => 'grant execute on sys.xml_schema_name_present to ^APPUN');
    ddl(p_sql => 'grant execute on sys.xqsequence to ^APPUN with grant option');
    ddl(p_sql => 'grant execute on sys.xqsequencefromxmltype to ^APPUN with grant option');
    ddl(p_sql => 'grant execute on xdb.dbms_xmldom to ^APPUN');
    ddl(p_sql => 'grant execute on xdb.dbms_xmlparser to ^APPUN');
    --
    -- Redaction
    --
    ddl(p_sql => 'grant select on sys.redaction_policies to ^APPUN');
    ddl(p_sql => 'grant select on sys.redaction_columns to ^APPUN');
    ddl(p_sql => 'grant select on sys.redaction_values_for_type_full to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_redact to ^APPUN');
    ddl(p_sql => 'grant exempt redaction policy to ^APPUN');
    --
    -- Call Stack
    --
    ddl(p_sql => 'grant execute on sys.utl_call_stack to ^APPUN');
    --
    -- Real Application Security
    --
    ddl(p_sql => 'grant select on sys.dba_xs_dynamic_roles to ^APPUN');
    ddl(p_sql => 'grant select on sys.dba_xs_ns_templates to ^APPUN');
    ddl(p_sql => 'grant select on sys.v_$xs_session_roles  to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_xs_nsattr to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_xs_nsattrlist to ^APPUN');
    ddl(p_sql => 'grant execute on sys.dbms_xs_sessions to ^APPUN');
    ddl(p_sql => 'grant execute on sys.xs$name_list to ^APPUN');
    -- for dbms_xs_sessions.create_session
    grant_system_privilege (
        priv_name => 'CREATE_SESSION',
        user_name => '^APPUN' );
    -- for dbms_xs_sessions.set_inactivity_timeout
    grant_system_privilege (
        priv_name => 'MODIFY_SESSION',
        user_name => '^APPUN' );
    -- for attach via dbms_sys_sql
    grant_system_privilege (
        priv_name => 'ATTACH_SESSION',
        user_name => '^APPUN' );
    -- for dbms_xs_sessions.destroy_session
    grant_system_privilege (
        priv_name => 'TERMINATE_SESSION',
        user_name => '^APPUN' );
    -- for dbms_xs_sessions.assign_user
    grant_system_privilege (
        priv_name => 'ASSIGN_USER',
        user_name => '^APPUN' );
    -- for dbms_xs_sessions.assign_user
    grant_system_privilege (
        priv_name => 'SET_DYNAMIC_ROLES',
        user_name => '^APPUN' );
    --
    -- identity columns
    --
    ddl(p_sql => 'grant select on sys.dba_tab_identity_cols to ^APPUN');
    --
    -- JSON_%_T
    --
    ddl(p_sql => 'grant execute on sys.json_array_t  to ^APPUN');
    ddl(p_sql => 'grant execute on sys.json_element_t to ^APPUN');
    ddl(p_sql => 'grant execute on sys.json_scalar_t to ^APPUN');
    ddl(p_sql => 'grant execute on sys.json_key_list  to ^APPUN');
    ddl(p_sql => 'grant execute on sys.json_object_t  to ^APPUN');
    ddl(p_sql => 'grant execute on sys.json_dataguide  to ^APPUN');
    --
    -- Collection Tables
    --
    ddl(p_sql => 'grant select on sys.dba_json_collection_tables to ^APPUN');
    ddl(p_sql => 'grant select on sys.dba_json_duality_views to ^APPUN');
    --
    -- for COLLECT
    --
    ddl(p_sql => 'grant execute on sys.sys_nt_collect_imp to ^APPUN');
    --
    -- for wwv_flow_public_key_util.java
    --
    ddl(p_sql => 'grant execute on "SYS"."java/io/ByteArrayInputStream" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/io/ByteArrayOutputStream" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/io/InputStream" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/lang/Exception" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/lang/Object" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/lang/StringBuilder" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/lang/String" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/lang/Throwable" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/math/BigInteger" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/cert/CertificateFactory" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/cert/Certificate" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/cert/X509Certificate" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/interfaces/RSAPublicKey" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/KeyFactory" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/Key" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/PrivateKey" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/PublicKey" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/SignatureException" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/Signature" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/spec/KeySpec" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/spec/PKCS8EncodedKeySpec" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."java/security/spec/X509EncodedKeySpec" to ^APPUN');
    ddl(p_sql => 'grant execute on "SYS"."javax/crypto/Cipher" to ^APPUN');
    --
    -- DBMS Privilege Capture
    --
    ddl(p_sql => 'grant execute on sys.dbms_priv_capture to ^APPUN');
    --
    -- MLE
    --
    if sys.dbms_db_version.version >= 21 then
        ddl(p_sql => 'grant execute on sys.dbms_mle to ^APPUN');
    end if;

    ddl(p_sql => 'grant execute on mdsys.sdo_dim_array to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_dim_element to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_elem_info_array to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_ordinate_array to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_point_type to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_geometry to ^APPUN');
    --
    ddl(p_sql => 'grant execute on mdsys.mderr to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_meta to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_cs to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_geom to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_util to ^APPUN');
    ddl(p_sql => 'grant execute on mdsys.sdo_gcdr to ^APPUN');
    --
    ddl(p_sql => 'grant select, insert, delete on mdsys.sdo_geom_metadata_table to ^APPUN');
    ddl(p_sql => 'grant select on mdsys.user_sdo_index_info to ^APPUN');
    --
    -- Application Continuity
    --
    ddl(p_sql => 'grant execute on sys.dbms_app_cont to ^APPUN');

    --
    -- DBMS_CLOUD for Oracle Document Generator Pre-built Function
    --
    declare
        l_dbms_cloud_owner    sys.dba_synonyms.table_owner%type;
        l_dbms_cloud_name     sys.dba_synonyms.table_name%type;
    begin
        select table_owner,
               table_name
          into l_dbms_cloud_owner,
               l_dbms_cloud_name
          from sys.dba_synonyms
         where synonym_name = 'DBMS_CLOUD'
           and owner        = 'PUBLIC'
           and rownum       = 1;

        for c in (
            select owner
              from sys.dba_objects
             where object_type       = 'PACKAGE'
               and owner             = l_dbms_cloud_owner
               and object_name       = l_dbms_cloud_name
               and oracle_maintained = 'Y'
               and rownum = 1 )
        loop

            ddl(    'grant execute on '
                 || sys.dbms_assert.enquote_name( l_dbms_cloud_owner )
                 || '.'
                 || sys.dbms_assert.enquote_name( l_dbms_cloud_name )
                 || ' to ^APPUN' );

            if l_dbms_cloud_owner != 'SYS' then
                ddl(    'grant inherit privileges on user ^APPUN to '
                     || sys.dbms_assert.enquote_name( l_dbms_cloud_owner ) );
            end if;

        end loop;

    exception
        when no_data_found then
            --
            -- if there is no DBMS_CLOUD public synonym, do nothing.
            --
            null;
    end;
end;
/
set termout on

--
-- sys privs
--
grant alter database           to ^APPUN;
grant alter session            to ^APPUN;
grant alter user               to ^APPUN;
grant create cluster           to ^APPUN with admin option;
grant create dimension         to ^APPUN with admin option;
grant create indextype         to ^APPUN with admin option;
grant create job               to ^APPUN with admin option;
grant create materialized view to ^APPUN with admin option;
grant create operator          to ^APPUN with admin option;
grant create procedure         to ^APPUN with admin option;
grant create public synonym    to ^APPUN;
grant create role              to ^APPUN;
grant create sequence          to ^APPUN with admin option;
grant create session           to ^APPUN with admin option;
grant create synonym           to ^APPUN with admin option;
grant create tablespace        to ^APPUN;
grant create table             to ^APPUN with admin option;
grant create trigger           to ^APPUN with admin option;
grant create type              to ^APPUN with admin option;
grant create user              to ^APPUN;
grant create view              to ^APPUN with admin option;
grant drop   public synonym    to ^APPUN;
grant drop tablespace          to ^APPUN;
grant drop user                to ^APPUN;
grant unlimited tablespace     to ^APPUN;

prompt ...done grant APEX owner core privileges
