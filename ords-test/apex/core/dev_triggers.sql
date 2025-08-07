set define '^' verify off
prompt ...creating dev-only triggers

Rem  Copyright (c) Oracle Corporation 2019. All Rights Reserved.
Rem
Rem    NAME
Rem      dev_triggers.sql
Rem
Rem    DESCRIPTION
Rem      Table triggers which are used in development only environment.
Rem
Rem    NOTE
Rem      Any table added in dev_tabs.sql must have triggers here
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    cbcho       08/08/2019 - Created


--==============================================================================
prompt ...trigger wwv_dictionary_cache_log_t1

create or replace trigger wwv_dictionary_cache_log_t1
    before insert or update on wwv_dictionary_cache_log
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    if :new.initiated_by is null then
        :new.initiated_by := nvl(wwv_flow.g_user,user);
    end if;
    if :new.updated_by is null then
        :new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
    if :new.updated_on is null then
        :new.updated_on := sysdate;
    end if;
    if :new.status is null then
        :new.status := 'RUNNING';
    end if;
    if :new.work_started is null then
        :new.work_started := sysdate;
    end if;
    if :new.status in ('COMPLETED','ABANDONED') and :new.work_completed is null then
        :new.work_completed := sysdate;
    end if;
    if :new.cancel_work is null then
        :new.cancel_work := 'N';
    end if;
    if :new.row_version is null then
       :new.row_version := 1;
    else 
       :new.row_version := :new.row_version + 1;
    end if;
    if :new.analyzed_table_yn is null then
       :new.analyzed_table_yn := 'U';
    end if;
    if :new.cached_columns_yn is null then
       :new.cached_columns_yn := 'U';
    end if;
end;
/

prompt ...trigger wwv_dictionary_cache_obj_t1

create or replace trigger wwv_dictionary_cache_obj_t1
    before insert or update 
    on wwv_dictionary_cache_obj
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    if inserting and :new.apx_cache_date is null then
       :new.apx_cache_date := sysdate;
    end if;
end;
/

prompt ...trigger wwv_dictionary_cache_col_t1

create or replace trigger wwv_dictionary_cache_col_t1
    before insert or update 
    on wwv_dictionary_cache_col
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    if inserting and :new.apx_cache_date is null then
       :new.apx_cache_date := sysdate;
    end if;
    if :new.filter_global_searchable_yn is null then
       :new.filter_global_searchable_yn := 'N';
    end if;
end;
/

prompt ...trigger wwv_dictionary_con_cache_t1

create or replace trigger wwv_dictionary_cache_fkcon_t1
    before insert or update on wwv_dictionary_cache_fkcon
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    if inserting and :new.apx_cache_date is null then
       :new.apx_cache_date := sysdate;
    end if;
end;
/

prompt ...trigger wwv_web_src_catalog_groups_t1

create or replace trigger wwv_web_src_catalog_groups_t1
    before insert or update or delete on wwv_web_src_catalog_groups
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
end;
/

prompt ...trigger wwv_web_src_catalogs_t1

create or replace trigger wwv_web_src_catalogs_t1
    before insert or update or delete on wwv_web_src_catalogs
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_web_src_catalog_groups
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.catalog_group_id,  :old.catalog_group_id  )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;    
end;
/

prompt ...trigger wwv_web_src_catalog_plugins_t1

create or replace trigger wwv_web_src_catalog_plugins_t1
    before insert or update or delete on wwv_web_src_catalog_plugins
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_web_src_catalogs
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.catalog_id,        :old.catalog_id        )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;    
end;
/

prompt ...trigger wwv_web_src_catalog_services_t1

create or replace trigger wwv_web_src_catalog_srvcs_t1
    before insert or update or delete on wwv_web_src_catalog_services
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_web_src_catalogs
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.catalog_id,        :old.catalog_id        )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;    
end;
/

prompt ...wwv_web_src_catalog_groups audit

create or replace trigger wwv_biu_websrc_catgrp_audit
    before insert or update or delete on wwv_web_src_catalog_groups
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_WEB_SRC_CATALOG_GROUPS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_web_src_catalogs audit

create or replace trigger wwv_biu_websrc_catalogs_audit
    before insert or update or delete on wwv_web_src_catalogs
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_WEB_SRC_CATALOGS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_web_src_catalog_plugins audit

create or replace trigger wwv_biu_websrc_catplgs_audit
    before insert or update or delete on wwv_web_src_catalog_plugins
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_WEB_SRC_CATALOG_PLUGINS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.plugin_internal_name,:old.plugin_internal_name) );
end;
/
show errors

prompt ...wwv_web_src_catalog_services audit

create or replace trigger wwv_biu_websrc_catsrvcs_audit
    before insert or update or delete on wwv_web_src_catalog_services
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_WEB_SRC_CATALOG_SERVICES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...done create dev triggers
set define '^'
