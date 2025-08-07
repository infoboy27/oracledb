set define '^' verify off
prompt ...create flow triggers

Rem  Copyright (c) 2001, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      trigger.sql
Rem
Rem    DESCRIPTION
Rem      Flow tiggers creation script.
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jstraub  02/28/2001 - Created

prompt ...trigger wwv_flow_platform_prefs_t1

create or replace trigger wwv_flow_platform_prefs_t1
    before insert or update on wwv_flow_platform_prefs
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.created_on is null then
            :new.created_on := sysdate;
        end if;
    end if;
    :new.security_group_id := 10;
    if updating or :new.last_updated_on is null then
        :new.last_updated_on := sysdate;
    end if;
end;
/
show errors

prompt ...trigger wwv_flow_companies_t1

create or replace trigger wwv_flow_companies_t1
    before insert or update on wwv_flow_companies
    for each row
declare
begin
    if :new.provisioning_company_id = 20 and :new.short_name not in ('ORACLE','COM.ORACLE.APEX.APPLICATIONS') then
        raise_application_error(-20001,wwv_flow_lang.runtime_message('TRIGGER.SGID_RESERVED'));
    end if;
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.allow_to_be_purged_yn is null then
        :new.allow_to_be_purged_yn := 'Y';
    end if;
    :new.short_name := trim(upper(:new.short_name));
    if :new.display_name is null then
        :new.display_name := :new.short_name;
    end if;
    if :new.cookie_name is null then
        :new.cookie_name := 'ORA_WWV_APP_'||ltrim(to_char(wwv_flow_id.next_val,'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'));
    end if;
    if inserting then
        :new.created_on := sysdate;
        if :new.account_status is null then
            :new.account_status := 'AVAILABLE';
        elsif :new.account_status = 'ASSIGNED' then
            :new.assigned_on := sysdate;
        end if;
    elsif updating then
        if :new.account_status = 'ASSIGNED' and nvl(:old.account_status,'AVAILABLE') = 'AVAILABLE' then
            :new.assigned_on := sysdate;
        end if;
    end if;
    :new.cloud_group_name   := upper(:new.cloud_group_name);
    :new.cloud_service_name := upper(:new.cloud_service_name);
    :new.host_prefix        := upper(:new.host_prefix);
    if :new.path_prefix is null then
        :new.path_prefix := wwv_flow_security.get_sanitized_path_prefix (
                                p_security_group_id => :new.provisioning_company_id,
                                p_path_prefix       => :new.short_name );
    elsif inserting
          or :old.path_prefix is null
          or :old.path_prefix <> :new.path_prefix
    then
        :new.path_prefix := wwv_flow_security.get_sanitized_path_prefix (
                                p_security_group_id => :new.provisioning_company_id,
                                p_path_prefix       => :new.path_prefix );
    end if;

    if inserting
        and :new.provisioning_company_id not in (0,10,11,12)
    then
        -- We create internal jobs of the APEX_nnnnnn schema as disabled on new
        -- installs. When inserting a non-internal (customer) workspace, we need to
        -- enable these jobs.
        wwv_flow_upgrade.enable_internal_jobs( p_job_type => wwv_flow_upgrade.c_job_type_standard );

        -- Remove the Landing Page redirect to the Administration Services on ADB
        wwv_flow_provisioning.reset_landing_page(p_force => true);
    end if;

    -- Monitor it on the wwv_flow_events1/2$ table
    wwv_flow_event_metrics_int.add_event (
        p_event_type       => case
                              when inserting then 'WKSP_CREATED'
                              else 'WKSP_UPDATED'
                              end,
        p_attribute_values => wwv_flow_t_varchar2 (
                                  wwv_flow_json.stringify(:new.provisioning_company_id),
                                  wwv_flow_json.stringify(:new.short_name),
                                  wwv_flow_json.stringify(:new.source_identifier),
                                  wwv_flow_json.stringify(:new.first_schema_provisioned),
                                  wwv_flow_json.stringify(:new.rm_consumer_group)));
    --
    exception when wwv_flow_error.e_mutating_table then null;
end;
/

prompt ...trigger wwv_flow_companies_tdel
create or replace trigger wwv_flow_companies_tdel
for delete on wwv_flow_companies
compound trigger
    l_sgids wwv_flow_global.n_arr;
    l_sgnames wwv_flow_global.vc_arr2;
--------------------------------------------------------------------------------
-- Set delete flag.
--
    before statement is
    begin
        wwv_flow.g_workspace_delete_in_progress := true;
    end before statement;
--------------------------------------------------------------------------------
-- Capture deleted workspace IDs to delete files at the end of the statement. We
-- would run into "table is mutating" errors if we deleted files here, doing it
-- in bulk is also faster.
--
    after each row is
    begin
        l_sgids(l_sgids.count+1) := :old.provisioning_company_id;
        l_sgnames(l_sgnames.count+1) := :old.short_name;
    end after each row;
--------------------------------------------------------------------------------
-- Bulk delete files and reset delete flag.
--
    after statement is
    begin
        for i in 1 .. l_sgids.count loop
            delete from flows_files.wwv_flow_file_objects$
             where security_group_id = l_sgids(i);

            -- Monitor it on the wwv_flow_events1/2$ table
            --
            wwv_flow_event_metrics_int.add_event (
                p_event_type       => 'WKSP_DELETED',
                p_attribute_values => wwv_flow_t_varchar2 (
                                          wwv_flow_json.stringify(l_sgids(i)),
                                          wwv_flow_json.stringify(l_sgnames(i))));
        end loop;
        -- If all user workspaces are removed, the Landing Page will be set again
        -- to the Administration Services login on ADB
        wwv_flow_provisioning.reset_landing_page;
        --
        wwv_flow.g_workspace_delete_in_progress := false;
    end after statement;
end wwv_flow_companies_tdel;
/

prompt ...trigger wwv_flow_company_schemas_t1

create or replace trigger wwv_flow_company_schemas_t1
    before insert or update on wwv_flow_company_schemas
    for each row
declare
    l_restricted number;
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.schema := wwv_flow_security.normalize_ws_schema_name(:new.schema);

    if :new.security_group_id in (10, 11, 12) then
        l_restricted := case
                        when :new.schema <> wwv_flow.g_flow_schema_owner
                        then 1
                        else 0
                        end;
    else
        select count(*)
          into l_restricted
          from wwv_flow_restricted_schemas r
         where r.schema = :new.schema
           and not exists ( select null
                              from wwv_flow_rschema_exceptions re,
                                   wwv_flow_companies          c
                             where r.id                      = re.schema_id
                               and re.workspace_name         = c.short_name
                               and c.provisioning_company_id = :new.security_group_id );
    end if;

    if l_restricted > 0 then
        wwv_flow_error.raise_internal_error (
            p_error_code => 'APEX.INSTANCE_ADMIN.SCHEMA_RESTRICTED' );
    end if;

    -- Monitor it on the wwv_flow_events1/2$ table
    --
    if inserting then
        wwv_flow_event_metrics_int.add_event (
            p_event_type        => 'SCHEMA_CREATED',
            p_security_group_id => :new.security_group_id,
            p_attribute_values  => wwv_flow_t_varchar2 (
                                       wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                                   p_security_group_id => :new.security_group_id)),
                                       wwv_flow_json.stringify(:new.schema)));
    end if;
end;
/
show err

prompt ...trigger wwv_flow_company_schemas_t2
create or replace trigger wwv_flow_company_schemas_t2
    for delete on wwv_flow_company_schemas
    compound trigger
    l_restricted number;
    l_sgids   wwv_flow_global.n_arr;
    l_schemas wwv_flow_global.vc_arr2;
--------------------------------------------------------------------------------
-- Capture deleted schemas. We would run into "table is mutating" errors if we
-- remove them here, doing it in bulk is also faster.
--
    after each row is
begin
    --:old.schema := wwv_flow_security.normalize_ws_schema_name(:old.schema);
    if :old.security_group_id in (10, 11, 12) then
        l_restricted := case
                        when :old.schema <> wwv_flow.g_flow_schema_owner
                        then 1
                        else 0
                        end;
    end if;

    l_sgids(l_sgids.count+1) := :old.security_group_id;
    l_schemas(l_schemas.count+1) := :old.schema;

    if l_restricted > 0 then
        wwv_flow_error.raise_internal_error (
            p_error_code => 'APEX.INSTANCE_ADMIN.SCHEMA_RESTRICTED' );
    end if;
end after each row;

--------------------------------------------------------------------------------
-- Bulk delete schemas

    after statement is
begin
    for i in 1 .. l_schemas.count loop
        -- Monitor it on the wwv_flow_events1/2$ table
        --
        wwv_flow_event_metrics_int.add_event (
            p_event_type        => 'SCHEMA_DELETED',
            p_security_group_id => l_sgids(i),
            p_attribute_values  => wwv_flow_t_varchar2 (
                                       wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                                   p_security_group_id => l_sgids(i))),
                                       wwv_flow_json.stringify(l_schemas(i))));
    end loop;
end after statement;
end;
/
show errors

prompt ...trigger wwv_flow_comp_stat_files_t1

create or replace trigger wwv_flow_comp_stat_files_t1
    before insert or update on wwv_flow_company_static_files
    for each row
declare
    l_files_version_increment number;
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- audit
    -- Note: always set change attributes so that the caching of files works
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;
    --
    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
    --

    if deleting then
        l_files_version_increment := 0;
    else
        l_files_version_increment := 1;
    end if;

    update wwv_flow_companies
       set files_version = files_version + l_files_version_increment
     where provisioning_company_id = :new.security_group_id;

end;
/

prompt ...trigger wwv_flow_comp_stat_files_t2
create or replace trigger wwv_flow_comp_stat_files_t2
    after insert or update on wwv_flow_company_static_files
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/

prompt ...trigger wwv_extension_links_t1
create or replace trigger wwv_extension_links_t1
before insert or update or delete on wwv_extension_links
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

prompt ...trigger wwv_extension_grants_t1
create or replace trigger wwv_extension_grants_t1
before insert or update or delete on wwv_extension_grants
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
--==============================================================================
prompt ...trigger wwv_flows_t1

create or replace trigger wwv_flows_t1
    before insert or update on wwv_flows
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    :new.webdb_logging := case nvl(wwv_flow_platform.get_preference('APPLICATION_ACTIVITY_LOGGING'), 'U') /* U=Use Application Settings */
                            when 'A' /* Always */ then 'YES'
                            when 'N' /* Never  */ then 'NO'
                            else                       nvl(:new.webdb_logging, 'YES')
                          end;

    if nvl(wwv_flow_platform.get_preference('APPLICATION_ACTIVITY_LOGGING'), 'U') = 'O' /* O=Off for New and Packaged Applications */
       and wwv_flow_security.g_security_group_id = 12 and (:new.id between 7000 and 8000 or :new.id = 8950) then
        --
        :new.webdb_logging := 'NO';
    end if;

    -- Cleanup the application image prefix if it's equal to the instance image prefix or the /i/ default
    -- This will allow easier migration of applications between APEX instances which have different image prefixes (bug #15969515)
    if :new.flow_image_prefix in ( '/i/', wwv_flow_global.g_image_prefix ) then
        :new.flow_image_prefix := null;
    end if;

    -- default debugging to no
    if inserting and :new.application_tab_set is null then
        :new.application_tab_set := 0; -- sets debugging off
    end if;
    :new.flow_language          := lower(:new.flow_language);
    :new.substitution_string_01 := upper(:new.substitution_string_01);
    :new.substitution_string_02 := upper(:new.substitution_string_02);
    :new.substitution_string_03 := upper(:new.substitution_string_03);
    :new.substitution_string_04 := upper(:new.substitution_string_04);
    :new.substitution_string_05 := upper(:new.substitution_string_05);
    :new.substitution_string_06 := upper(:new.substitution_string_06);
    :new.substitution_string_07 := upper(:new.substitution_string_07);
    :new.substitution_string_08 := upper(:new.substitution_string_08);
    if :new.build_status is null then
       :new.build_status := 'RUN_AND_BUILD';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- owner
    --
    :new.owner := wwv_flow_security.normalize_ws_schema_name(:new.owner);
    if inserting or :new.owner <> nvl(:old.owner, :new.owner) then
        for i in ( select min(case when schema = :new.owner then schema end) over () found_schema,
                          schema first_schema
                     from wwv_flow_company_schemas
                    where security_group_id = :new.security_group_id )
        loop
            if i.found_schema is null then
                wwv_flow_debug.trace (
                    'owner "%s" not found, reverting to "%s"',
                    :new.owner,
                    i.first_schema );
                :new.owner := i.first_schema;
            else
                wwv_flow_debug.trace (
                    'accepting owner change to "%s"',
                    i.found_schema );
            end if;
            exit;
        end loop;
    end if;

    :new.alias := upper(:new.alias);

    if :new.bookmark_checksum_function is null then
        :new.bookmark_checksum_function := coalesce (
                                               wwv_flow_platform.g_checksum_hash_function,
                                               wwv_flow_crypto.c_hash_best );
    end if;

    -- The FK to wwv_flow_steps is defined to automatically set to NULL
    -- if the related record in wwv_flow_steps is deleted. We need to handle
    -- 2 cases related to this:

    -- Firstly, we want to prevent this from setting the global_page_id to NULL,
    -- in the case where a page import is being performed, which inhrenently
    -- deletes the page and would otherwise cause the constraint to set global_page_id
    -- to NULL (bug #14532258).
    -- Note: Application import is not affected by this, because the entire
    -- flow is deleted, which cascade deletes down through all the dependent
    -- objects. Then the application is just re-created in the normal way,
    -- from afresh.
    if updating and :new.global_page_id is null and wwv_flow.g_import_in_progress then
        :new.global_page_id := :old.global_page_id;
    end if;

    -- Secondly, because the FK uses id and global_page_id, the required
    -- id would be set to NULL as well which we don't want.
    if updating and :new.id is null then
        :new.id := :old.id;
    end if;

    --
    -- Enable Push Notification Job
    --
    if :new.pwa_is_push_enabled = 'Y' and coalesce( :old.pwa_is_push_enabled, 'N' ) = 'N' then
        wwv_flow_upgrade.enable_internal_jobs( p_job_type => wwv_flow_upgrade.c_job_type_pwa_push );
    end if;

    if not wwv_flow.g_import_in_progress then
        --
        -- only set audit information when not importing
        --
        if inserting then
            :new.created_on      := nvl(:new.created_on, sysdate);
            :new.created_by      := nvl(:new.created_by, nvl(wwv_flow.g_user,user));
            :new.last_updated_on := nvl(:new.last_updated_on, :new.created_on);
            :new.last_updated_by := nvl(:new.last_updated_by, :new.created_by);
        end if;

        if updating
           and ( :old.checksum_salt is null
                 or :new.checksum_salt <> :old.checksum_salt)
        then
            :new.checksum_salt_last_reset := sysdate;
        end if;

        -- Update the SCN when a wwv_flows column has changed and the SCN hasn't changed
        -- Helps with PWA column change to update the Web App Manifest URL
        if    updating
          and :new.shared_components_scn         = :old.shared_components_scn
          and nvl(:new.last_updated_on, sysdate) = nvl(:old.last_updated_on, sysdate)
        then
            :new.shared_components_scn := sys.dbms_flashback.get_system_change_number;
        end if;

        -- The version_scn is updated when the primary application is modified
        -- and copied during the publishing of a translated application.
        -- If version_scn values are not equal, it indicates the translation is out-of-sync.

        :new.version_scn := sys.dbms_flashback.get_system_change_number;

        --
        -- last updated
        --
        if user <> 'SYS' then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
end;
/

--==============================================================================
prompt ...trigger wwv_flow_app_comments_t1

create or replace trigger wwv_flow_app_comments_t1
    before insert or update on wwv_flow_app_comments
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- clean up whitespace in pages
    --
    for i in 1..10 loop
              :new.pages := replace(:new.pages,'  ',' ');
    end loop;
    :new.pages := trim(:new.pages);
    :new.pages := replace(:new.pages,':',',');
    :new.pages := replace(:new.pages,' ',',');
    :new.pages := replace(:new.pages,',,',', ');
    :new.pages := rtrim(:new.pages,',');
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.updated_on := sysdate;
        :new.updated_by := wwv_flow.g_user;
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        update wwv_flows
        set last_updated_on = sysdate,
            last_updated_by = wwv_flow.g_user
        where id = :new.flow_id and
            security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_combined_files_t1

create or replace trigger wwv_flow_combined_files_t1
    before insert or update or delete on wwv_flow_combined_files
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_app_settings_t1

create or replace trigger wwv_flow_app_settings_t1
    before insert or update or delete on wwv_flow_app_settings
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
        :new.name := upper(:new.name);
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;

    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where app_setting_id     = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_email_templates_t1

create or replace trigger wwv_flow_email_templates_t1
    before insert or update or delete on wwv_flow_email_templates
    for each row
declare
    c_needs_compile constant boolean := ( nvl( :old.version_number, 1 ) < :new.version_number );
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        :new.static_id := upper(:new.static_id);
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
        -- Compile templates
        if :new.version_number > 1 then
            if ( c_needs_compile or ( :old.subject is null or :new.subject != :old.subject ) ) then
                :new.subject_compiled := wwv_flow_template_directive.compile_to_json(
                    p_template          => :new.subject,
                    p_placeholders_only => true );
            end if;
            if :new.text_template is not null
                and ( c_needs_compile or ( :old.text_template is null or :new.text_template != :old.text_template ) )
            then
                :new.text_template_compiled := wwv_flow_template_directive.compile_to_json(
                    p_template          => :new.text_template,
                    p_placeholders_only => true );
            elsif :new.text_template is null then
                :new.text_template_compiled := null;
            end if;
            if ( c_needs_compile or ( :old.html_body is null or :new.html_body != :old.html_body ) ) then
                :new.html_body_compiled := wwv_flow_template_directive.compile_to_json(
                    p_template          => :new.html_body,
                    p_placeholders_only => true );
            end if;
            if :new.html_header is not null
                and ( c_needs_compile or ( :old.html_header is null or :new.html_header != :old.html_header ) )
            then
                :new.html_header_compiled := wwv_flow_template_directive.compile_to_json(
                    p_template          => :new.html_header,
                    p_placeholders_only => true );
            elsif :new.html_header is null then
                :new.html_header_compiled := null;
            end if;
            if :new.html_footer is not null
                and ( c_needs_compile or ( :old.html_footer is null or :new.html_footer != :old.html_footer ) )
            then
                :new.html_footer_compiled := wwv_flow_template_directive.compile_to_json(
                    p_template          => :new.html_footer,
                    p_placeholders_only => true );
            elsif :new.html_footer is null then
                :new.html_footer_compiled := null;
            end if;
        end if;
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;

    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where email_template_id  = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/


prompt ...trigger wwv_flow_automations_t1

create or replace trigger wwv_flow_automations_t1
    before insert or update or delete on wwv_flow_automations
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
        -- static id
        :new.static_id := wwv_flow_string_util.get_slug( coalesce( :new.static_id, :new.name ) );
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

        if :new.polling_status = 'ACTIVE' then
            wwv_flow_upgrade.enable_internal_jobs( p_job_type => wwv_flow_upgrade.c_job_type_automation );
        end if;
    end if;

    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_automation_acts_t1

create or replace trigger wwv_flow_automation_acts_t1
    before insert or update or delete on wwv_flow_automation_actions
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
            update wwv_flow_automations
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.automation_id, :old.automation_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_credentials_t1

-- we use the '^' character in a regexp in the following trigger
set define off

create or replace trigger wwv_credentials_t1
    before insert or update or delete on wwv_credentials
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- static id
        if     not wwv_flow.g_import_in_progress
           and inserting or ( updating and nvl( :old.static_id, chr( 1 ) ) != nvl( :new.static_id, chr( 1 ) ) )
        then
            :new.static_id := regexp_replace(
                                  srcstr     => coalesce( :new.static_id, lower( :new.name ) ),
                                  pattern    => '[^' || wwv_flow_utilities.c_alnum || ']+',
                                  replacestr => '_' );

            if :new.static_id = '_' then
                :new.static_id := 'C' || :new.id;
            end if;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- sanitize valid_for_urls
        if :new.valid_for_urls is not null then
            :new.valid_for_urls := wwv_flow_credential.sanitize_urls(p_urls => :new.valid_for_urls);
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

set define '^'

prompt ...trigger wwv_credential_inst_t1

create or replace trigger wwv_credential_inst_t1
    before insert or update or delete on wwv_credential_instances
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
    end if;
end;
/

prompt ...trigger wwv_remote_servers_t1

-- we use the '^' character in a regexp in the following trigger
set define off

create or replace trigger wwv_remote_servers_t1
    before insert or update or delete on wwv_remote_servers
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- static id
        if     not wwv_flow.g_import_in_progress
           and inserting or ( updating and nvl( :old.static_id, chr( 1 ) ) != nvl( :new.static_id, chr( 1 ) ) )
        then
            :new.static_id := regexp_replace(
                                  srcstr     => coalesce( :new.static_id, lower( :new.name ) ),
                                  pattern    => '[^' || wwv_flow_utilities.c_alnum || ']+',
                                  replacestr => '_' );

            if :new.static_id = '_' then
                 :new.static_id := 'C' || :new.id;
            end if;
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

set define '^'

prompt ...trigger wwv_flow_data_profiles_t1

create or replace trigger wwv_flow_data_profiles_t1
    before insert or update or delete on wwv_flow_data_profiles
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- set default value for use_raw_json_selectors
        if inserting then
            :new.use_raw_json_selectors := case when :new.format = 'JSON' then
                                                nvl( :new.use_raw_json_selectors, 'N' )
                                            end;
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
        -- cascade to REST data source parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_web_src_modules
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where data_profile_id   = coalesce( :new.id, :old.id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        -- cascade to data load definition parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_load_tables
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where data_profile_id   = coalesce( :new.id, :old.id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        -- cascade to document source parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_document_sources
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where data_profile_id   = coalesce( :new.id, :old.id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_data_profile_cols_t1

create or replace trigger wwv_flow_data_profile_cols_t1
    before insert or update or delete on wwv_flow_data_profile_cols
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
            update wwv_flow_data_profiles
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.data_profile_id, :old.data_profile_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

-- we use the '^' character in a regexp in the following trigger
set define off

prompt ...trigger wwv_flow_document_sources_t1

create or replace trigger wwv_flow_document_sources_t1
    before insert or update or delete on wwv_flow_document_sources
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
        -- static id
        if     not wwv_flow.g_import_in_progress
           and inserting or ( updating and nvl( :old.static_id, chr( 1 ) ) != nvl( :new.static_id, chr( 1 ) ) )
        then
            :new.static_id := regexp_replace(
                                  srcstr     => coalesce( :new.static_id, lower( :new.name ) ),
                                  pattern    => '[^' || wwv_flow_utilities.c_alnum || ']+',
                                  replacestr => '_' );

            if :new.static_id = '_' then
                 :new.static_id := 'c' || :new.id;
            end if;
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
         -- populate version_scn for the master components

        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                if :new.document_source_type = 'DUALITY_VIEW' then
                    update wwv_flow_comp_grp_components
                       set last_updated_on = sysdate,
                           last_updated_by = wwv_flow.g_user
                     where duality_view_id    = coalesce( :new.id, :old.id )
                       and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                       and security_group_id  = wwv_flow_security.g_security_group_id;
                else
                    update wwv_flow_comp_grp_components
                       set last_updated_on = sysdate,
                           last_updated_by = wwv_flow.g_user
                     where json_source_id     = coalesce( :new.id, :old.id )
                       and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                       and security_group_id  = wwv_flow_security.g_security_group_id;
                end if;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_ai_configs_t1

create or replace trigger wwv_flow_ai_configs_t1
    before insert or update or delete on wwv_flow_ai_configs
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
         -- populate version_scn for the master components

        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where ai_config_id       = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_ai_rag_sources_t1

create or replace trigger wwv_flow_ai_rag_sources_t1
    before insert or update or delete on wwv_flow_ai_config_rag_sources
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
            update wwv_flow_ai_configs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.ai_config_id, :old.ai_config_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_web_src_modules_t1

create or replace trigger wwv_flow_web_src_modules_t1
    before insert or update or delete on wwv_flow_web_src_modules
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
        -- static id
        if     not wwv_flow.g_import_in_progress
           and inserting or ( updating and nvl( :old.static_id, chr( 1 ) ) != nvl( :new.static_id, chr( 1 ) ) )
        then
            :new.static_id := regexp_replace(
                                  srcstr     => coalesce( :new.static_id, lower( :new.name ) ),
                                  pattern    => '[^' || wwv_flow_utilities.c_alnum || ']+',
                                  replacestr => '_' );

            if :new.static_id = '_' then
                 :new.static_id := 'C' || :new.id;
            end if;
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
         -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            --
            -- ignore updates on SYNC_xxxx columns, only update version_scn when other columns are updated
            --
            if inserting
               or ( updating('NAME')
               or updating('WEB_SOURCE_TYPE')
               or updating('URL_PATH_PREFIX')
               or updating('AUTH_URL_PATH_PREFIX')
               or updating('CREDENTIAL_ID')
               or updating('REFERENCE_ID')
               or updating('MODULE_COMMENT')
               or updating('TIMEOUT')
               or updating('PASS_ECID')
               or updating('REMOTE_SERVER_ID')
               or updating('AUTH_REMOTE_SERVER_ID')
               or updating('REFERENCE_ID')
               or updating('VERSION_SCN')
               or updating('LAST_UPDATED_ON')
               or updating('LAST_UPDATED_BY')
               or updating('CATALOG_INTERNAL_NAME')
               or updating('CATALOG_SERVICE_NAME')
               or updating('OPENAPI_URL')
               or updating('ATTRIBUTE_01')
               or updating('ATTRIBUTE_02')
               or updating('ATTRIBUTE_03')
               or updating('ATTRIBUTE_04')
               or updating('ATTRIBUTE_05')
               or updating('ATTRIBUTE_06')
               or updating('ATTRIBUTE_07')
               or updating('ATTRIBUTE_08')
               or updating('ATTRIBUTE_09')
               or updating('ATTRIBUTE_10')
               or updating('ATTRIBUTE_11')
               or updating('ATTRIBUTE_12')
               or updating('ATTRIBUTE_13')
               or updating('ATTRIBUTE_14')
               or updating('ATTRIBUTE_15') ) then

                :new.version_scn := sys.dbms_flashback.get_system_change_number;
            end if;
        end if;

        if :new.sync_table_name is not null then
            wwv_flow_upgrade.enable_internal_jobs( p_job_type => wwv_flow_upgrade.c_job_type_rest_sync );
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where web_src_module_id  = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

set define '^'

prompt ...trigger wwv_flow_web_src_operations_t1

create or replace trigger wwv_flow_web_src_operations_t1
    before insert or update or delete on wwv_flow_web_src_operations
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
            update wwv_flow_web_src_modules
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.web_src_module_id, :old.web_src_module_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_web_src_sync_steps_t1

create or replace trigger wwv_flow_web_src_sync_steps_t1
    before insert or update or delete on wwv_flow_web_src_sync_steps
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
            update wwv_flow_web_src_modules
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.web_src_module_id, :old.web_src_module_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_web_src_params_t1

create or replace trigger wwv_flow_web_src_params_t1
    before insert or update or delete on wwv_flow_web_src_params
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
        if coalesce( :new.web_src_operation_id, :old.web_src_operation_id ) is not null then
            begin
                update wwv_flow_web_src_operations
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.web_src_operation_id, :old.web_src_operation_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        else
            begin
                update wwv_flow_web_src_modules
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.web_src_module_id, :old.web_src_module_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_websrc_comp_params_t1

create or replace trigger wwv_flow_websrc_comp_params_t1
    before insert or update or delete on wwv_flow_web_src_comp_params
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
        if coalesce( :new.page_plug_id, :old.page_plug_id ) is not null then
            begin
                update wwv_flow_page_plugs
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where id                = coalesce( :new.page_plug_id, :old.page_plug_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.page_process_id, :old.page_process_id ) is not null then
            begin
                update wwv_flow_step_processing
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where id                = coalesce( :new.page_process_id, :old.page_process_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.app_process_id, :old.app_process_id ) is not null then
            begin
                update wwv_flow_processing
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.app_process_id, :old.app_process_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.jet_chart_series_id, :old.jet_chart_series_id ) is not null then
            begin
                update wwv_flow_jet_chart_series
                   set updated_on       = sysdate,
                       updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.jet_chart_series_id, :old.jet_chart_series_id )
                   and security_group_id = coalesce( :new.security_group_id,   :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.map_region_layer_id, :old.map_region_layer_id ) is not null then
            begin
                update wwv_flow_map_region_layers
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.map_region_layer_id, :old.map_region_layer_id )
                   and security_group_id = coalesce( :new.security_group_id,   :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.automation_id, :old.automation_id ) is not null then
            begin
                update wwv_flow_automations
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.automation_id,     :old.automation_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.search_config_id, :old.search_config_id ) is not null then
            begin
                update wwv_flow_search_configs
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.search_config_id,  :old.search_config_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.shared_lov_id, :old.shared_lov_id ) is not null then
            begin
                update wwv_flow_lists_of_values$
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.shared_lov_id,     :old.shared_lov_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.automation_action_id, :old.automation_action_id ) is not null then
            begin
                update wwv_flow_automation_actions
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.automation_action_id,  :old.automation_action_id )
                   and security_group_id = coalesce( :new.security_group_id,     :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.task_def_action_id, :old.task_def_action_id ) is not null then
            begin
                update wwv_flow_task_def_actions
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.task_def_action_id,  :old.task_def_action_id )
                   and security_group_id = coalesce( :new.security_group_id,   :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        if coalesce( :new.workflow_activity_id, :old.workflow_activity_id ) is not null then
            begin
                update wwv_flow_workflow_activities
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.workflow_activity_id, :old.workflow_activity_id )
                   and security_group_id = coalesce( :new.security_group_id,    :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_invokeapi_comp_params_t1

create or replace trigger wwv_invokeapi_comp_params_t1
    before insert or update or delete on wwv_flow_invokeapi_comp_params
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
        if coalesce( :new.page_process_id, :old.page_process_id ) is not null then
            begin
                update wwv_flow_step_processing
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where id                = coalesce( :new.page_process_id, :old.page_process_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_content_cache1$_t1

create or replace trigger wwv_flow_content_cache1$_t1
    before insert or update on wwv_flow_content_cache1$
    for each row
begin
    if not wwv_flow.g_import_in_progress then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
            :new.cached_on := sysdate;
        end if;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_curr_flow_security_group_id,0);
    end if;
end;
/

prompt ...trigger wwv_flow_security_schemes_t1

create or replace trigger wwv_flow_security_schemes_t1
    before insert or update or delete on wwv_flow_security_schemes
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
            -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where authorization_id   = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_banner_t1

create or replace trigger wwv_flow_banner_t1
    before insert or update on wwv_flow_banner
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

prompt ...wwv_flow_pwa_shortcuts_t1

create or replace trigger wwv_flow_pwa_shortcuts_t1
    before insert or update or delete on wwv_flow_pwa_shortcuts
    for each row
begin
    if inserting or updating then
        if :new.id is null then
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...wwv_flow_pwa_screenshots_t1

create or replace trigger wwv_flow_pwa_screenshots_t1
    before insert or update or delete on wwv_flow_pwa_screenshots
    for each row
begin
    if inserting or updating then
        if :new.id is null then
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...wwv_flow_push_subscriptions_t1

create or replace trigger wwv_flow_push_subscriptions_t1
    before insert or update on wwv_flow_push_subscriptions$
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    if :new.flow_id is null then
        :new.flow_id := wwv_flow.g_flow_id;
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;

    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
end;
/

prompt ...wwv_flow_push_queue_t1

create or replace trigger wwv_flow_push_queue_t1
    before insert or update on wwv_flow_push_queue
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    if :new.flow_id is null then
        :new.flow_id := wwv_flow.g_flow_id;
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := wwv_flow.g_user;
    end if;

    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
end;
/

prompt ...trigger wwv_flow_languages_t1

create or replace trigger wwv_flow_languages_t1
    before insert or update on wwv_flow_languages
    for each row
begin
    :new.lang_id_upper := upper(:new.lang_id);
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/


prompt ...trigger wwv_flow_language_map_t1

create or replace trigger wwv_flow_language_map_t1
    before insert or update or delete on wwv_flow_language_map
    for each row
begin
    if inserting or updating then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.trans_flow_lang_code_root := substr(:new.translation_flow_language_code,1,2);
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.primary_language_flow_id, :old.primary_language_flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_language_map_t2

create or replace trigger wwv_flow_language_map_t2
    before delete on wwv_flow_language_map
    for each row
begin
    --
    -- cascade delete from wwv_flows_reserved
    --
    if nvl(wwv_flow_imp.g_mode,'x') != 'REPLACE' then
        delete from wwv_flows_reserved
          where id = :old.translation_flow_id
            and (permanent_security_group_id is null or permanent_security_group_id = :old.security_group_id);
    end if;
end;
/

prompt ...trigger wwv_flow_dbcharset_lang_map_t1

create or replace trigger wwv_flow_dbcharset_lang_map_t1
    before insert or update on wwv_flow_dbcharset_lang_map
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/



prompt ...trigger wwv_flow_translatable_text_t1

create or replace trigger wwv_flow_translatable_text_t1
    before insert or update or delete on wwv_flow_translatable_text$
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.template_translatable is null then
            :new.template_translatable := 'N';
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_dynamic_trans_t1

create or replace trigger wwv_flow_dynamic_trans_t1
    before insert or update or delete on WWV_FLOW_DYNAMIC_TRANSLATIONS$
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_page_cache_t1

create or replace trigger wwv_flow_page_cache_t1
    before insert or update on wwv_flow_page_cache
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
        :new.cached_on := sysdate;
        if :new.language is null then
           :new.language  := upper(substr(wwv_flow.g_flow_language,1,2));
        end if;
    end if;

    --
    -- vpd
    --
    --:new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    :new.security_group_id := nvl(wwv_flow_security.g_curr_flow_security_group_id,0);
end;
/

prompt ...trigger wwv_flow_page_code_cache_t1

create or replace trigger wwv_flow_page_code_cache_t1
    before insert or update on wwv_flow_page_code_cache
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_templates_t1

create or replace trigger wwv_flow_templates_t1
    before insert or update or delete on wwv_flow_templates
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_page_tmpl_dp_t1

create or replace trigger wwv_flow_page_tmpl_dp_t1
    before insert or update or delete on wwv_flow_page_tmpl_disp_points
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
            update wwv_flow_templates
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.page_template_id, :old.page_template_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_field_templates_t1

create or replace trigger wwv_flow_field_templates_t1
    before insert or update or delete on wwv_flow_field_templates
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_icon_bar_t1

create or replace trigger wwv_flow_icon_bar_t1
    before insert or update or delete on wwv_flow_icon_bar
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- flow_id
        if :new.flow_id is null then
            :new.flow_id := v('FB_FLOW_ID');
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_processing_t1

create or replace trigger wwv_flow_processing_t1
    before insert or update or delete on wwv_flow_processing
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where app_process_id     = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_items_t1

create or replace trigger wwv_flow_items_t1
    before insert or update or delete on wwv_flow_items
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -----------------
        -- default values
        --
        if :new.data_type is null then
            :new.data_type := 'VARCHAR';
        end if;
        :new.name_length := length(:new.name);
        :new.name := upper(:new.name);
        if :new.is_Persistent is null then
            :new.is_Persistent := 'Y';
        end if;

        --
        -- name
        --
        :new.name := upper(:new.name);

        --
        -- cascade to computations
        --
        if updating and :new.name != upper(:old.name) then
            begin
                update wwv_flow_computations
                    set computation_item = :new.name
                    where flow_id = :new.flow_id
                    and upper(computation_item) = upper(:old.name);
                --
                update wwv_flow_step_computations
                    set computation_item = :new.name
                    where flow_id = :new.flow_id
                    and upper(computation_item) = upper(:old.name);
            exception when others then null;
            end;
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where app_item_id        = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_items_t2

create or replace trigger wwv_flow_items_t2
    before delete on wwv_flow_items
    for each row
begin
    --
    -- cascade delete flow and step computations referencing item
    --
    if nvl(wwv_flow_imp.g_mode,'x') != 'REPLACE' then
        begin
            delete wwv_flow_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
            delete wwv_flow_step_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_computations_t1

create or replace trigger wwv_flow_computations_t1
    before insert or update or delete on wwv_flow_computations
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.computation_point is null then
           :new.computation_point := 'AFTER_SUBMIT';
        end if;
        if :new.computation_processed is null then
           :new.computation_processed := 'REPLACE_EXISTING';
        end if;
        if :new.computation_type is null then
           :new.computation_type := 'SQL_EXPRESSION';
        end if;

        --
        -- set name
        --
        :new.computation_item := upper(:new.computation_item);

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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where app_computation_id = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_tabs_t1

create or replace trigger wwv_flow_tabs_t1
    before insert or update or delete on wwv_flow_tabs
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.tab_also_current_for_pages :=
           replace(replace(replace(:new.tab_also_current_for_pages,':',','),' ',','),'|',',');
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/



prompt ...trigger wwv_flow_toplevel_tabs_t1

create or replace trigger wwv_flow_toplevel_tabs_t1
    before insert or update or delete on wwv_flow_toplevel_tabs
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/




prompt ...trigger wwv_flow_lists_of_values_t1

create or replace trigger wwv_flow_lists_of_values_t1
    before insert or update or delete on wwv_flow_lists_of_values$
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -- Static LOVs now identified by LOCATION
        if :new.location = 'STATIC' then
            :new.lov_query := '.'||trunc(:new.id)||'.';
        elsif :new.lov_query = '.' then
            :new.lov_query := '.'||trunc(:new.id)||'.';
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
            -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where lov_id             = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/
show errors



prompt ...trigger wwv_flow_list_of_valuesc_t1

create or replace trigger wwv_flow_list_of_valuesc_t1
    before insert or update or delete on wwv_flow_list_of_values_cols
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
            update wwv_flow_lists_of_values$
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.lov_id, :old.lov_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors



prompt ...trigger wwv_flow_lists_of_valuesd_t1

create or replace trigger wwv_flow_lists_of_valuesd_t1
    before insert or update or delete on wwv_flow_list_of_values_data
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.lov_return_value is null then
           :new.lov_return_value := :new.lov_disp_value;
        end if;
        if :new.lov_disp_value is null then
           :new.lov_disp_value := :new.lov_return_value;
        end if;
        --
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_lists_of_values$
                        where id = :new.lov_id) loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
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
            update wwv_flow_lists_of_values$
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.lov_id, :old.lov_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors



prompt ...trigger wwv_flow_trees_t1

create or replace trigger wwv_flow_trees_t1
    before insert or update or delete on  wwv_flow_trees
    for each row
begin
    if inserting or updating then
        if :new.id is null then
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_treeregion_t1

create or replace trigger wwv_flow_treeregion_t1
    before insert or update or delete on  wwv_flow_tree_regions
    for each row
begin
    if inserting or updating then
        if :new.id is null then
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
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_steps_t1

create or replace trigger wwv_flow_steps_t1
    before insert or update or delete on wwv_flow_steps
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        :new.alias := upper(:new.alias);

        -- Used by Page Designer to detect a change on the page
        :new.page_components_scn := sys.dbms_flashback.get_system_change_number;

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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
        -- reset version_scn for normal pages
        -- this also covers the case when a page pattern is converted to a normal page
        if :new.is_page_pattern = 'N' then
            :new.version_scn := null;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        --
        -- Update the shared_components_scn only when the dialog_attributes or
        -- dialog_resizable changes
        -- This will invalidate the cache of wwv_flows.js_dialogs
        --
        begin
            update wwv_flows
               set last_updated_on          = sysdate,
                   last_updated_by          = wwv_flow.g_user,
                   shared_components_scn    = case
                                              when     coalesce( :new.dialog_attributes, chr( 1 ) ) != coalesce( :old.dialog_attributes, chr( 1 ) )
                                                    or coalesce( :new.dialog_resizable,  chr( 1 ) ) != coalesce( :old.dialog_resizable,  chr( 1 ) )
                                              then sys.dbms_flashback.get_system_change_number
                                              else shared_components_scn
                                              end
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where page_id            = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_step_buttons_t1

create or replace trigger wwv_flow_step_buttons_t1
    before insert or update or delete on wwv_flow_step_buttons
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- Check the button name doesn't conflict with a tab name in the same application.
        -- Never do this during an import / or upgrade
        if not wwv_flow.g_import_in_progress then
            -- Then check on inserting, or on updating (but only if the button name has changed)
            if inserting or (updating and :old.button_name <> :new.button_name) then
                -- Finally, check if the button action is one that could submit with a REQUEST equal to the button name
                if :new.button_action is not null and :new.button_action in ('SUBMIT','REDIRECT_URL','DEFINED_BY_DA') then
                    for c1 in (select tab_name
                                 from wwv_flow_tabs
                                where flow_id = :new.flow_id
                                  and tab_name = :new.button_name)
                    loop
                        raise_application_error (-20001,wwv_flow_lang.runtime_message('TRIGGER.BUTTON_TAB_NAMES_NOT_EQUAL'));
                        exit;
                    end loop;
                end if;
            end if;
        end if;

        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.button_condition  := rtrim(:new.button_condition );
            :new.button_condition  := rtrim(:new.button_condition ,chr(10));
            :new.button_condition  := rtrim(:new.button_condition ,chr(13));
        end loop;
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_step_branches_t1

create or replace trigger wwv_flow_step_branches_t1
    before insert or update or delete on wwv_flow_step_branches
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.branch_condition_type = 'REQUEST_IS_NUMERIC' then
            :new.branch_condition := 'Numeric Check.';
        end if;
        if :new.branch_condition_type = '%null%' then
           :new.branch_condition_type := null;
        end if;
        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.branch_condition  := rtrim(:new.branch_condition );
            :new.branch_condition  := rtrim(:new.branch_condition ,chr(10));
            :new.branch_condition  := rtrim(:new.branch_condition ,chr(13));
        end loop;
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_step_item_groups_t1

create or replace trigger wwv_flow_step_item_groups_t1
    before insert or update or delete on wwv_flow_step_item_groups
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_step_items_t1

create or replace trigger wwv_flow_step_items_t1
    before insert or update or delete on wwv_flow_step_items
    for each row
declare
    l_clear_session_state boolean;
    l_subscribed_computations  pls_integer;
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        -----------------
        -- default values
        --
        if :new.begin_on_new_line is null then
            :new.begin_on_new_line := 'Y';
        end if;
        if :new.begin_on_new_field is null then
            :new.begin_on_new_field := 'Y';
        end if;
        if :new.label_alignment is null then
            :new.label_alignment := 'LEFT';
        end if;
        if :new.field_alignment is null then
            :new.field_alignment := 'LEFT';
        end if;
        if :new.lov_display_null is null then
            :new.lov_display_null := 'NO';
        end if;
        if :new.accept_processing is null then
            :new.accept_processing := 'REPLACE_EXISTING';
        end if;
        if :new.is_Persistent is null then
            :new.is_Persistent := 'Y';
        end if;
        if :new.source_type = wwv_flow_faceted_search.c_facet and :new.fc_show_chart is null then
            :new.fc_show_chart := 'N';
        end if;
        -- maintain the length of the item name
        :new.name_length := length(:new.name);
        -- force field into upper case and make sure that some special characters are replaced
        -- Note: keep in sync with wwv_flow_builder.is_valid_item_name and get_valid_item_name
        :new.name := replace (
                         replace (
                             translate(trim(upper(:new.name)), ' :&,.+?%''"', '__________'),
                             '_#',
                             '_H' ),
                         '#',
                         '_H' );
        --
        -- remove trailing whitespace from source column
        :new.source := rtrim(rtrim(ltrim(:new.source)),chr(13)||chr(10));
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        --
        -- Populate LOV column for named list of values
        --
        if replace(:new.named_lov,'%null%') is not null then
            begin
            select replace(lov_query,chr(13),null) into :new.lov
              from wwv_flow_lists_of_values$
             where flow_id = :new.flow_id and lov_name = :new.named_lov
               and security_group_id = :new.security_group_id;
            exception when others then null;
            end;
        end if;

        --
        -- New Datepicker > Native HTML mode: Always use format required by browser
        --
        if :new.display_as = wwv_flow_native_item.c_date_picker_apex and json_value( :new.attributes, '$.display_as' ) = 'NATIVE' then
            if json_value( :new.attributes, '$.show_time' ) = 'N' then
                :new.format_mask := wwv_flow_native_item.c_browser_date_format_mask;
            else
                :new.format_mask := wwv_flow_native_item.c_browser_datetime_format_mask;
            end if;
        end if;

        --
        -- cascade to computations, remove session state
        --
        if updating then

            if :new.name != upper(:old.name) then
                begin
                    update wwv_flow_computations
                       set computation_item = :new.name
                     where flow_id = :new.flow_id
                       and security_group_id = :new.security_group_id
                       and upper(computation_item) = upper(:old.name)
                       returning count(reference_id)
                       into l_subscribed_computations;
                    --
                    update wwv_flow_step_computations
                       set computation_item = :new.name
                     where flow_id = :new.flow_id
                       and security_group_id = :new.security_group_id
                       and upper(computation_item) = upper(:old.name);
                exception when others then null;
                end;
                -- if there are application computations based on this item
                -- and if the computation is subscribed, then prevent renaming the item
                if l_subscribed_computations > 0 then
                    raise_application_error( -20101,
                                             wwv_flow_lang.message(
                                                 p_name => 'SUBSCRIPTION.ITEM_RENAME_NOT_POSSIBLE',
                                                 p0 => upper(:old.name) ) );
                end if;
                l_clear_session_state := true;
            elsif :old.is_persistent <> :new.is_persistent then
                l_clear_session_state := true;
            elsif :old.data_type <> :new.data_type then
                l_clear_session_state := true;
            end if;

            if l_clear_session_state and not wwv_flow.g_import_in_progress then
                -- Remove existing session state to avoid issues with logic that accesses session state by
                -- item name and not by item ID. Note that the developer who is changing this item may not be
                -- the only one with existing session state for it (therefore, we don't constrain to flow_instance).
                wwv_flow_session_state.clear_all_state_for_name_aut (
                    p_item_name         => :old.name,
                    p_application_id    => :old.flow_id,
                    p_security_group_id => :old.security_group_id );
            end if;
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_step_items_t2

create or replace trigger wwv_flow_step_items_t2
    before delete on wwv_flow_step_items
    for each row
begin
    --
    -- cascade delete flow and step computations referencing item
    --
    if nvl(wwv_flow_imp.g_mode,'x') != 'REPLACE' then
        begin
            delete wwv_flow_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
            delete wwv_flow_step_computations
                where upper(computation_item) = upper(:old.name)
                and flow_id = :old.flow_id
                and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
    --
    -- cascade update to page
    --
    begin
        wwv_flow_audit.g_cascade := true;
        update wwv_flow_steps set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           flow_id = :old.flow_id and
           id = :old.flow_step_id and
           security_group_id = :new.security_group_id;
        wwv_flow_audit.g_cascade := false;
    exception when others then null;
    end;
end;
/


prompt ...trigger wwv_flow_step_item_help_t1

create or replace trigger wwv_flow_step_item_help_t1
    before insert or update or delete on wwv_flow_step_item_help
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
            update wwv_flow_step_items
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_item_id, :old.flow_item_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_step_computations_t1

create or replace trigger wwv_flow_step_computations_t1
    before insert or update or delete on wwv_flow_step_computations
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.computation_point is null then
           :new.computation_point := 'AFTER_SUBMIT';
        end if;
        if :new.computation_processed is null then
           :new.computation_processed := 'REPLACE_EXISTING';
        end if;
        if :new.computation_type is null then
           :new.computation_type := 'SQL_EXPRESSION';
        end if;
        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.compute_when  := rtrim(:new.compute_when );
            :new.compute_when  := rtrim(:new.compute_when ,chr(10));
            :new.compute_when  := rtrim(:new.compute_when ,chr(13));
        end loop;
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_step_validations_t1

create or replace trigger wwv_flow_step_validations_t1
    before insert or update or delete on wwv_flow_step_validations
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        :new.validation_condition := rtrim( :new.validation_condition, ' '||chr(10)||chr(13) );
        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.validation  := rtrim(:new.validation );
            :new.validation  := rtrim(:new.validation ,chr(10));
            :new.validation  := rtrim(:new.validation ,chr(13));
        end loop;
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_step_processing_t1

create or replace trigger wwv_flow_step_processing_t1
    before insert or update or delete on wwv_flow_step_processing
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if inserting and :new.internal_uid is null then
            :new.internal_uid := :new.id;
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.flow_step_id, :old.flow_step_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_process_bg_execs$_t1

create or replace trigger wwv_flow_process_bg_execs$_t1
    before insert or update or delete on wwv_flow_process_bg_execs$
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_session_seq.nextval;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := systimestamp;
            end if;
            --
            :new.last_updated_on := systimestamp;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_button_templates_t1

create or replace trigger wwv_flow_button_templates_t1
    before insert or update or delete on wwv_flow_button_templates
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_cals_t1

create or replace trigger wwv_flow_cals_t1
   before insert or update or delete on wwv_flow_cals
   for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- Default the display type
        --
        if :new.display_type is null then
            :new.display_type := 'COL';
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plug_id, :old.plug_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_cal_templates_t1

create or replace trigger wwv_flow_cal_templates_t1
    before insert or update or delete on wwv_flow_cal_templates
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_themes_t1

create or replace trigger wwv_flow_themes_t1
         before insert or update or delete on wwv_flow_themes
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
prompt ...trigger wwv_flow_themes_t2
create or replace trigger wwv_flow_themes_t2
    after insert or update on wwv_flow_themes
begin
    if inserting or updating('THEME_IMAGE') then
        wwv_flow_file_api.check_workspace_limits;
    end if;
end;
/

prompt ...trigger wwv_flow_theme_styles_t1

create or replace trigger wwv_flow_theme_styles_t1
    before insert or update or delete on wwv_flow_theme_styles
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_theme_files_t1

create or replace trigger wwv_flow_theme_files_t1
    before insert or update or delete on wwv_flow_theme_files
    for each row
declare
    l_files_version_increment number;
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
        -- Note: always set change attributes so that the caching of files works
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        if deleting then
            l_files_version_increment := 0;
        else
            l_files_version_increment := 1;
        end if;
        --
        begin
            update wwv_flow_themes
               set files_version   = files_version + l_files_version_increment,
                   last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_template_opt_groupsp_t1

create or replace trigger wwv_flow_template_opt_grp_t1
    before insert or update or delete on wwv_flow_template_opt_groups
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_template_options_t1

create or replace trigger wwv_flow_template_options_t1
    before insert or update or delete on wwv_flow_template_options
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_page_plug_templ_t1

create or replace trigger wwv_flow_page_plug_templ_t1
    before insert or update or delete on wwv_flow_page_plug_templates
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plug_tmpl_dp_t1

create or replace trigger wwv_flow_plug_tmpl_dp_t1
    before insert or update or delete on wwv_flow_plug_tmpl_disp_points
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.placeholder = 'SUB_REGIONS' then
            :new.has_region_support := 'Y';
            :new.has_item_support   := 'N';
            :new.has_button_support := 'N';
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
            update wwv_flow_page_plug_templates
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plug_template_id, :old.plug_template_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_row_templates_t1

create or replace trigger wwv_flow_row_templates_t1
    before insert or update or delete on wwv_flow_row_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.row_template_before_rows is null then
           :new.row_template_before_rows := ' ';
        end if;
        if :new.row_template_after_rows is null then
           :new.row_template_after_rows := ' ';
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_list_templates_t1

create or replace trigger wwv_flow_list_templates_t1
    before insert or update or delete on wwv_flow_list_templates
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.list_template_before_rows is null then
           :new.list_template_before_rows := ' ';
        end if;
        if :new.list_template_after_rows is null then
           :new.list_template_after_rows := ' ';
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_page_plugs_t1

create or replace trigger wwv_flow_page_plugs_t1
    before insert or update or delete on wwv_flow_page_plugs
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.plug_source_type is null then
            :new.plug_source_type := 'NATIVE_STATIC';
        end if;
        if :new.plug_query_row_template is not null then
            :new.plug_query_format_out := 'TEMPLATE';
        end if;
        --
        -- remove trailing spaces
        --
        for i in 1..10 loop
            :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition );
            :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition ,chr(10));
            :new.plug_display_when_condition  := rtrim(:new.plug_display_when_condition ,chr(13));
        end loop;

        if :new.plug_source is not null then
            :new.plug_source := replace (
                                    :new.plug_source,
                                    wwv_flow.CR,
                                    null );
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        --
        if :new.security_group_id <> 10 and :new.plug_query_parse_override is not null then
           :new.plug_query_parse_override := null;
        end if;
        --
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

        if :old.plug_source_type in ( 'NATIVE_SQL_REPORT', 'NATIVE_TABFORM' ) and :old.plug_query_num_rows <> :new.plug_query_num_rows  then
            -- Remove existing session state for region ID to clear out previous number of rows value
            -- for classic reports and tabular forms
            wwv_flow_session_state.clear_all_state_for_id (
                p_item_id        => :new.id,
                p_application_id => :new.flow_id );
        end if;

        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.page_id, :old.page_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_interactive_grids_t1

create or replace trigger wwv_flow_interactive_grids_t1
    before insert or update or delete on wwv_flow_interactive_grids
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if inserting and :new.internal_uid is null then
            :new.internal_uid := :new.id;
        end if;
        -- vpd
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ...trigger wwv_flow_interactive_grids_t2

create or replace trigger wwv_flow_interactive_grids_t2
    after insert on wwv_flow_interactive_grids
    for each row
declare
    l_id number;
begin
    if not wwv_flow.g_import_in_progress then
        -- Create the default primary report
        insert into wwv_flow_ig_reports (
            flow_id,
            page_id,
            interactive_grid_id,
            type,
            default_view,
            show_row_number,
            settings_area_expanded )
        values (
            :new.flow_id,
            :new.page_id,
            :new.id,
            'PRIMARY',
            'GRID',
            'N',
            'Y' )
        returning id into l_id;
        --
        insert into wwv_flow_ig_report_views (
            flow_id,
            page_id,
            report_id,
            view_type,
            srv_exclude_null_values,
            srv_only_display_columns,
            edit_mode )
        values (
            :new.flow_id,
            :new.page_id,
            l_id,
            'GRID',
            'N',
            'Y',
            'N' );
    end if;
end;
/
show errors

prompt ...trigger wwv_flow_ig_reports_t1

create or replace trigger wwv_flow_ig_reports_t1
    before insert or update or delete on wwv_flow_ig_reports
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
        if :new.type = 'PRIVATE' then
            :new.static_id := null;
        else
            -- populate static_id for base reports
            if :new.static_id is null and :new.session_id is null then
                :new.static_id := wwv_seq.nextval;
            end if;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
        :new.version_number := nvl( :new.version_number, 0 ) + 1;
    end if;

    if    not wwv_flow.g_import_in_progress
      and :new.type       in ( 'PRIMARY', 'ALTERNATIVE' )
      and :new.session_id is null
    then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_interactive_grids
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id  = coalesce( :new.interactive_grid_id, :old.interactive_grid_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_ig_report_views_t1

create or replace trigger wwv_flow_ig_report_views_t1
    before insert or update or delete on wwv_flow_ig_report_views
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ig_reports
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.report_id, :old.report_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_ig_report_computes_t1

create or replace trigger wwv_flow_ig_report_computes_t1
    before insert or update or delete on wwv_flow_ig_report_computes
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ig_reports
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.report_id, :old.report_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_ig_report_filters_t1

create or replace trigger wwv_flow_ig_report_filters_t1
    before insert or update or delete on wwv_flow_ig_report_filters
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ig_reports
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.report_id, :old.report_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_ig_report_columns_t1

create or replace trigger wwv_flow_ig_report_columns_t1
    before insert or update or delete on wwv_flow_ig_report_columns
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ig_report_views
               set view_type = view_type
             where id                = coalesce( :new.view_id, :old.view_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_ig_report_high_t1

create or replace trigger wwv_flow_ig_report_high_t1
    before insert or update or delete on wwv_flow_ig_report_highlights
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ig_report_views
               set view_type = view_type
             where id                = coalesce( :new.view_id, :old.view_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_ig_report_agg_t1

create or replace trigger wwv_flow_ig_report_agg_t1
    before insert or update or delete on wwv_flow_ig_report_aggregates
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ig_report_views
               set view_type = view_type
             where id                = coalesce( :new.view_id, :old.view_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_ig_report_chart_t1

create or replace trigger wwv_flow_ig_report_chart_t1
    before insert or update or delete on wwv_flow_ig_report_chart_cols
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ig_report_views
               set view_type = view_type
             where id                = coalesce( :new.view_id, :old.view_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ...trigger wwv_flow_region_col_groups_t1

create or replace trigger wwv_flow_region_col_groups_t1
    before insert or update or delete on wwv_flow_region_column_groups
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
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ...trigger wwv_flow_region_columns_t1

create or replace trigger wwv_flow_region_columns_t1
    before insert or update or delete on wwv_flow_region_columns
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        --
        -- New Datepicker > Native HTML mode always use format required by browser
        --
        if :new.item_type = wwv_flow_native_item.c_date_picker_apex and json_value(:new.attributes, '$.display_as') = 'NATIVE' then
            if json_value(:new.attributes, '$.show_time') = 'N' then
                :new.format_mask := wwv_flow_native_item.c_browser_date_format_mask;
            else
                :new.format_mask := wwv_flow_native_item.c_browser_datetime_format_mask;
            end if;
        end if;

        -- Remove in APEX 5.2 when required filters are implemented
        if :new.enable_filter = 'Y' and :new.filter_is_required is null then
            :new.filter_is_required := 'N';
        end if;
        -- vpd
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_region_columns_t2

create or replace trigger wwv_flow_region_columns_t2
    after insert on wwv_flow_region_columns
    for each row
begin
    if not wwv_flow.g_import_in_progress and :new.item_type <> 'NATIVE_ROW_SELECTOR' then
        -- Add new column to all Primary Reports (session and static ones)
        -- Note: An Action Menu column is added to any report type, because if an IG becomes editable that column always has to show up
        for l_view in ( select v.id
                          from wwv_flow_interactive_grids i,
                               wwv_flow_ig_reports r,
                               wwv_flow_ig_report_views v
                         where i.region_id           = :new.region_id
                           and i.security_group_id   = :new.security_group_id
                           and r.interactive_grid_id = i.id
                           and (  r.type         = 'PRIMARY'
                               or :new.item_type = 'NATIVE_ROW_ACTION' )
                           and v.report_id           = r.id
                           and v.view_type           = 'GRID' )
        loop
            insert into wwv_flow_ig_report_columns (
                view_id,
                display_seq,
                column_id,
                is_visible,
                is_frozen )
            values (
                l_view.id,
                ( select case
                           when :new.item_type = 'NATIVE_ROW_ACTION' then 0 /* always has to be the first column! */
                           else coalesce( max( display_seq ), 0 ) + 1
                         end
                    from wwv_flow_ig_report_columns
                   where view_id = l_view.id
                ),
                :new.id,
                'Y',
                'N' );
        end loop;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_pg_generic_attr_t1

create or replace trigger wwv_flow_pg_generic_attr_t1
    before insert or update on wwv_flow_page_generic_attr
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated page, cascades to update application
    --
    if not wwv_flow.g_import_in_progress then
        wwv_flow_audit.g_cascade := true;
        for c1 in (select flow_id, page_id from wwv_flow_page_plugs
                   where id = :new.region_id
                   and security_group_id = :new.security_group_id) loop
            update wwv_flow_steps set
               last_updated_on = sysdate,
               last_updated_by = wwv_flow.g_user
            where
               flow_id = c1.flow_id and
               id = c1.page_id and
               security_group_id = :new.security_group_id;
        end loop;
        wwv_flow_audit.g_cascade := false;
    end if;
end;
/

prompt ...trigger wwv_flow_sessions_t2

create or replace trigger wwv_flow_sessions_t2
   after delete on wwv_flow_sessions$
   for each row
begin
    delete from wwv_flow_worksheet_rpts where session_id = :old.id;
    --
    delete from wwv_flow_file_objects$ where session_id = :old.id;
    --
    update wwv_flow_companies
       set last_login = trunc(:old.created_on)
     where provisioning_company_id = :old.security_group_id
       and (last_login < trunc(:old.created_on) or last_login is null);
    --
    if :old.ras_sessionid is not null then
        wwv_flow_session_ras.destroy_session (
            p_sessionid => :old.ras_sessionid );
    end if;
end;
/

prompt ...trigger wwv_flow_preferences_t1

create or replace trigger wwv_flow_preferences_t1
    before insert or update on wwv_flow_preferences$
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- Monitor it on the wwv_flow_events1/2$ table
    wwv_flow_event_metrics_int.add_event (
        p_event_type       => case
                              when inserting then 'PREFERENCE_CREATED'
                              else 'PREFERENCE_UPDATED'
                              end,
        p_attribute_values => wwv_flow_t_varchar2 (
                                  wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                              p_security_group_id => :new.security_group_id)),
                                  wwv_flow_json.stringify(:new.preference_name),
                                  wwv_flow_json.stringify(:new.attribute_value)));
    --
    exception when wwv_flow_error.e_mutating_table then null;
end;
/

prompt ...trigger wwv_flow_preferences_t2

create or replace trigger wwv_flow_preferences_t2
    before delete on wwv_flow_preferences$
    for each row
begin
    -- Monitor it on the wwv_flow_events1/2$ table
    wwv_flow_event_metrics_int.add_event (
        p_event_type       => 'PREFERENCE_DELETED',
        p_attribute_values => wwv_flow_t_varchar2 (
                                  wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                              p_security_group_id => :old.security_group_id)),
                                  wwv_flow_json.stringify(:old.preference_name),
                                  wwv_flow_json.stringify(:old.attribute_value)));
    --
    exception when wwv_flow_error.e_mutating_table then null;
end;
/
show errors

prompt ...trigger wwv_flow_messages_t1

create or replace trigger wwv_flow_messages_t1
    before insert or update or delete on wwv_flow_messages$
    for each row
begin
    if inserting or updating then
        if inserting then
            if :new.id is null then
                :new.id := wwv_flow_id.next_val;
            end if;
        end if;
        :new.name := upper(:new.name);
        :new.message_language := lower(:new.message_language);
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where message_id         = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_patches_t1

create or replace trigger wwv_flow_patches_t1
    before insert or update or delete on wwv_flow_patches
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where build_option_id    = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_developers_t1

create or replace trigger wwv_flow_developers_t1
    before insert or update on wwv_flow_developers
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.user_id is null then
            :new.user_id := :new.id;
        end if;
    end if;
    :new.userid         := wwv_flow_security.normalize_ws_user_name(:new.userid);
    :new.developer_role := wwv_flow_security.upper_sec_ok(:new.developer_role);
    --
    -- set admin privs
    --
    if instr(:new.developer_role,'ADMIN') > 0 then
        :new.developer_role := 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL';
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    --
    -- Monitor it on the wwv_flow_events1/2$ table
    if inserting
        or updating ('DEVELOPER_ROLE') then
            wwv_flow_event_metrics_int.add_event (
                p_event_type       => case
                                      when inserting then 'DEVELOPER_ROLE_CREATED'
                                      else 'DEVELOPER_ROLE_UPDATED'
                                      end,
                p_attribute_values => wwv_flow_t_varchar2 (
                                          wwv_flow_json.stringify(:new.user_id),
                                          wwv_flow_json.stringify(:new.userid),
                                          wwv_flow_json.stringify(:new.flow_id),
                                          wwv_flow_json.stringify(:new.developer_role),
                                          wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                                      p_security_group_id => :new.security_group_id))));
    end if;
    --
    exception when wwv_flow_error.e_mutating_table then null;
end;
/
show errors

prompt ...set security group id = 10

begin
   wwv_flow_security.g_security_group_id := 10;
end;
/


prompt ...trigger wwv_flow_lists_t1

create or replace trigger wwv_flow_lists_t1
    before insert or update or delete on wwv_flow_lists
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.list_status is null then
            :new.list_status := 'PERSONAL';
        end if;
        if :new.list_displayed is null then
            :new.list_displayed := 'BY_DEFAULT';
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where list_id            = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_list_items_t1

create or replace trigger wwv_flow_list_items_t1
    before insert or update or delete on wwv_flow_list_items
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.list_item_owner is not null then
            :new.list_item_owner := user;
        end if;
        for c1 in (select flow_id from wwv_flow_lists where id = :new.list_id) loop
            :new.flow_id := c1.flow_id;
            exit;
        end loop;
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
            update wwv_flow_lists
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.list_id, :old.list_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_shared_queries_t1

create or replace trigger wwv_flow_shared_queries_t1
  before insert or update or delete on wwv_flow_shared_queries
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
        -- static id
        if     not wwv_flow.g_import_in_progress
           and inserting or ( updating and nvl( :old.static_id, chr( 1 ) ) != nvl( :new.static_id, chr( 1 ) ) )
        then
            :new.static_id := regexp_replace(
                                  srcstr     => coalesce( :new.static_id, upper( :new.name ) ),
                                  pattern    => '[^' || wwv_flow_utilities.c_alnum || ']+',
                                  replacestr => '_' );

            if :new.static_id = '_' then
                :new.static_id := 'C' || :new.id;
            end if;
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_sqry_sql_stmts_t1

create or replace trigger wwv_flow_sqry_sql_stmts_t1
  before insert or update or delete on wwv_flow_shared_qry_sql_stmts
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
        --
        -- display sequence
        --
        if inserting and :new.display_sequence is null then
            select nvl(max(display_sequence),0) + 1 into :new.display_sequence
              from wwv_flow_shared_qry_sql_stmts
             where shared_query_id      = :new.shared_query_id
               and security_group_id    = wwv_flow_security.g_security_group_id;
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_report_layouts_t1

create or replace trigger wwv_flow_report_layouts_t1
  before insert or update or delete on wwv_flow_report_layouts
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
        -- static id
        if     not wwv_flow.g_import_in_progress
           and inserting or ( updating and nvl( :old.static_id, chr( 1 ) ) != nvl( :new.static_id, chr( 1 ) ) )
        then
            :new.static_id := regexp_replace(
                                  srcstr     => coalesce( :new.static_id, upper( :new.report_layout_name ) ),
                                  pattern    => '[^' || wwv_flow_utilities.c_alnum || ']+',
                                  replacestr => '_' );

            if :new.static_id = '_' then
                :new.static_id := 'C' || :new.id;
            end if;
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where report_layout_id   = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/


prompt ...trigger wwv_flow_static_files_t1

create or replace trigger wwv_flow_static_files_t1
    before insert or update or delete on wwv_flow_static_files
    for each row
declare
    l_files_version_increment number;
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
        if deleting then
            l_files_version_increment := 0;
        else
            l_files_version_increment := 1;
        end if;
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   files_version         = files_version + l_files_version_increment,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
prompt ...trigger wwv_flow_static_files_t2
create or replace trigger wwv_flow_static_files_t2
    after insert or update on wwv_flow_static_files
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/

prompt ...wwv_flow_shortcuts_t1

create or replace trigger wwv_flow_shortcuts_t1
    before insert or update or delete on wwv_flow_shortcuts
    for each row
begin
    if inserting or updating then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        :new.shortcut_consideration_seq := nvl(:new.shortcut_consideration_seq,1);
        :new.shortcut_name := upper(:new.shortcut_name);
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where shortcut_id        = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/
show errors


prompt ...trigger wwv_flow_mail_queue_t1

create or replace trigger wwv_flow_mail_queue_t1
    before insert or update on wwv_flow_mail_queue
    for each row
begin
    if not wwv_flow.g_import_in_progress then
        if inserting then
            if :new.id is null then
                :new.id := wwv_flow_id.next_val;
            end if;
            if :new.last_updated_by is null then
                :new.last_updated_by := nvl(wwv_flow.g_user,user);
            end if;
        end if;
        :new.last_updated_on := sysdate;
    end if;

    if :new.flow_id is null then
        :new.flow_id := wwv_flow.g_flow_id;
    end if;
    if :new.mail_send_count is null then
        :new.mail_send_count := 0;
    end if;
    if :new.mail_message_created is null then
        :new.mail_message_created := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_mail_log_t1

create or replace trigger wwv_flow_mail_log_t1
    before insert on wwv_flow_mail_log
    for each row
begin
    if :new.last_updated_on is null then
        :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_mail_attachments_t1

create or replace trigger wwv_flow_mail_attachments_t1
    before insert or update on wwv_flow_mail_attachments
    for each row
declare
  l_maximum_size_mb integer;
begin
    if not wwv_flow.g_import_in_progress then
        if inserting then
            if :new.id is null then
                :new.id := wwv_flow_id.next_val;
            end if;
        end if;
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);

        --
        -- If a maximum attachment size is specified in system preferences, then ensure
        -- that this attachment does not exceed the maximum size.
        --
        l_maximum_size_mb := wwv_flow_platform.get_preference('EMAIL_ATTACHMENT_MAX_SIZE_MB');
        if l_maximum_size_mb is not null then
            if sys.dbms_lob.getlength(:new.attachment)/1024/1024 > l_maximum_size_mb then
                raise_application_error (-20023,
                    wwv_flow_lang.runtime_message('WWV_FLOW_MAIL.ADD_ATTACHMENT.ATTACHMENT_EXCEEDS_MAXIMUM_SIZE',
                        round(sys.dbms_lob.getlength(:new.attachment)/1024/1024), l_maximum_size_mb));
            end if;
        end if;
    end if;


    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

prompt ...trigger wwv_flow_sw_results_t1

create or replace trigger wwv_flow_sw_results_t1
    before insert or update on wwv_flow_sw_results
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting and :new.started is null then
        :new.started := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_sw_detail_results_t1

create or replace trigger wwv_flow_sw_detail_results_t1
    before insert or update on wwv_flow_sw_detail_results
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting and :new.started is null then
        :new.started := sysdate;
    elsif updating and :new.last_updated is null then
        :new.last_updated := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_sw_sql_cmds_t1

create or replace trigger wwv_flow_sw_sql_cmds_t1
    before insert or update on wwv_flow_sw_sql_cmds
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting and not wwv_flow.g_import_in_progress then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

----------------------------
--  U S E R   T A B L E S
--

prompt ...trigger wwv_flow_fnd_user_t1

create or replace trigger wwv_flow_fnd_user_t1
    before insert or update on wwv_flow_fnd_user
    for each row
declare
    procedure generate_hashed_password
    is
        l_today date := trunc(sysdate);
        l_found number;
    begin
        --
        -- hash the plain text password and clear legacy password columns
        --
        :new.web_password_version       := wwv_flow_crypto.get_current_password_version;
        :new.web_password2              := wwv_flow_crypto.hash_password (
                                               p_password          => :new.web_password,
                                               p_version           => :new.web_password_version,
                                               p_security_group_id => :new.security_group_id,
                                               p_user_name         => :new.user_name,
                                               p_user_id           => :new.user_id );
        :new.web_password               := null;
        :new.web_password_raw           := null;
        --
        -- save new password in history, but prevent duplicates
        --
        if updating then
            select count(1)
              into l_found
              from wwv_flow_password_history
             where security_group_id          = :new.security_group_id
               and user_id                    = :new.user_id
               and password                   = :new.web_password2
               and nvl(password_version, '*') = nvl(:new.web_password_version, '*')
               and created                    = l_today;
        else
            l_found := 0;
        end if;

        if l_found = 0 then
            insert into wwv_flow_password_history (
                id,
                user_id,
                password,
                password_version,
                created,
                security_group_id )
            values (
                wwv_flow_id.next_val,
                :new.user_id,
                :new.web_password2,
                :new.web_password_version,
                l_today,
                :new.security_group_id );
        end if;
    end generate_hashed_password;
begin
    if inserting then
        :new.user_id        := coalesce(:new.user_id, wwv_flow_id.next_val);
        :new.creation_date  := sysdate;
        :new.created_by     := coalesce(wwv_flow.g_user, user);
        :new.account_expiry := coalesce(:new.account_expiry, sysdate);
    end if;

    :new.start_date              := coalesce(:new.start_date, sysdate);
    :new.end_date                := coalesce(:new.end_date, :new.start_date + (365*20));
    :new.user_name               := wwv_flow_security.normalize_ws_user_name(:new.user_name);
    :new.allow_access_to_schemas := wwv_flow_security.normalize_ws_schema_name(:new.allow_access_to_schemas);
    :new.default_date_format     := trim(:new.default_date_format);
    :new.last_updated_by         := coalesce(wwv_flow.g_user, user);
    :new.last_update_date        := sysdate;
    :new.security_group_id       := coalesce(:new.security_group_id, wwv_flow_security.g_security_group_id, 0);
    --
    -- the insert/update APIs pass clear text passwords in the WEB_PASSWORD
    -- column. in this case, we apply the newest hashing algorithm and safe the
    -- hashed value instead of the clear text.
    --
    if :new.web_password is not null then
        generate_hashed_password;
        if updating then
            :new.account_expiry := sysdate;
        end if;
    end if;

    -- Check whether the user's email is valid
    if (inserting
        or nvl(:old.email_address, wwv_flow.LF) <> nvl(:new.email_address, wwv_flow.LF))
       and not wwv_flow_instance_admin.is_valid_provisioning_email( p_email => :new.email_address )
    then
        wwv_flow_error.raise_internal_error( p_error_code => 'APEX.PROVISION_REQUEST.INVALID_EMAIL' );
    end if;

    -- Monitor it on the wwv_flow_events1/2$ table
    if updating ('ATTRIBUTE_01')
        or updating ('ATTRIBUTE_02')
        or updating ('ATTRIBUTE_03')
        or updating ('ATTRIBUTE_04')
        or updating ('ATTRIBUTE_05')
        or updating ('ATTRIBUTE_06')
        or updating ('ATTRIBUTE_07')
        or updating ('ATTRIBUTE_08')
        or updating ('ATTRIBUTE_09')
        or updating ('ATTRIBUTE_10')
    then
        wwv_flow_event_metrics_int.add_event (
            p_event_type       => 'ATTRIBUTE_CREATED',
            p_attribute_values => wwv_flow_t_varchar2 (
                                      wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                                  p_security_group_id => :new.security_group_id)),
                                      wwv_flow_json.stringify(:new.user_name),
                                      wwv_flow_json.stringify(:new.attribute_01),
                                      wwv_flow_json.stringify(:new.attribute_02),
                                      wwv_flow_json.stringify(:new.attribute_03),
                                      wwv_flow_json.stringify(:new.attribute_04),
                                      wwv_flow_json.stringify(:new.attribute_05),
                                      wwv_flow_json.stringify(:new.attribute_06),
                                      wwv_flow_json.stringify(:new.attribute_07),
                                      wwv_flow_json.stringify(:new.attribute_08),
                                      wwv_flow_json.stringify(:new.attribute_09),
                                      wwv_flow_json.stringify(:new.attribute_10)));
    end if;
    if inserting then
        wwv_flow_event_metrics_int.add_event (
            p_event_type       => 'USER_CREATED',
            p_attribute_values => wwv_flow_t_varchar2 (
                                      wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                                  p_security_group_id => :new.security_group_id)),
                                      wwv_flow_json.stringify(:new.user_name)));
    elsif updating then
        wwv_flow_event_metrics_int.add_event (
            p_event_type       => 'USER_UPDATED',
            p_attribute_values => wwv_flow_t_varchar2 (
                                      wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                                  p_security_group_id => :new.security_group_id)),
                                      wwv_flow_json.stringify(:new.user_name)));
    end if;
    --
    exception when wwv_flow_error.e_mutating_table then null;
end;
/
show errors


prompt ...trigger wwv_flow_fnd_user_groups_t1

create or replace trigger wwv_flow_fnd_user_groups_t1
    before insert or update on wwv_flow_fnd_user_groups
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.static_id is null or :new.flow_id is null then
        :new.static_id := upper(:new.group_name);
    else
        :new.static_id := upper(:new.static_id);
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    -- populate version_scn for the master components
    if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
        :new.version_scn := sys.dbms_flashback.get_system_change_number;
    end if;

    --
    -- cascade change to wwv_flow_comp_grp_components
    --
    if not wwv_flow.g_import_in_progress and updating then
        begin
            update wwv_flow_comp_grp_components
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where group_id           = coalesce( :new.id, :old.id )
               and flow_id            = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id  = wwv_flow_security.g_security_group_id;
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;

    -- Monitor it on the wwv_flow_events1/2$ table
    if inserting then
        wwv_flow_event_metrics_int.add_event (
            p_event_type       => 'USER_GROUP_CREATED',
            p_attribute_values => wwv_flow_t_varchar2 (
                                      wwv_flow_json.stringify(:new.id),
                                      wwv_flow_json.stringify(:new.group_name),
                                      wwv_flow_json.stringify(:new.static_id),
                                      wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                                   p_security_group_id => :new.security_group_id))));
    end if;
    --
    exception when wwv_flow_error.e_mutating_table then null;
end;
/
show errors

prompt ...trigger wwv_flow_fnd_user_groups_t2

create or replace trigger wwv_flow_fnd_user_groups_t2
    before delete on wwv_flow_fnd_user_groups
    for each row
begin
    -- Monitor it on the wwv_flow_events1/2$ table
    wwv_flow_event_metrics_int.add_event (
        p_event_type       => 'USER_GROUP_DELETED',
        p_attribute_values => wwv_flow_t_varchar2 (
                                  wwv_flow_json.stringify(:old.id),
                                  wwv_flow_json.stringify(:old.group_name),
                                  wwv_flow_json.stringify(:old.static_id),
                                  wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                              p_security_group_id => :old.security_group_id))));
    --
    exception when wwv_flow_error.e_mutating_table then null;
end;
/
show errors


prompt ...trigger wwv_flow_fnd_group_users_t1

create or replace trigger wwv_flow_fnd_group_users_t1
    before insert or update on wwv_flow_fnd_group_users
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

prompt ...trigger wwv_flow_acl_group_users_t1

create or replace trigger wwv_flow_acl_group_users_t1
    before insert or update on wwv_flow_acl_group_users
    for each row
begin
    :new.last_updated_by := coalesce(wwv_flow.g_user, user);
    :new.last_updated_on := sysdate;

    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        :new.created_by := :new.last_updated_by;
        :new.created_on := :new.last_updated_on;
    end if;
    :new.user_name := wwv_flow_security.normalize_ws_user_name(:new.user_name);
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/

--

prompt ...trigger wwv_flow_fnd_user_t2

create or replace trigger wwv_flow_fnd_user_t2
    before delete on wwv_flow_fnd_user
    for each row
begin
    -- Monitor it on the wwv_flow_events1/2$ table
    wwv_flow_event_metrics_int.add_event (
        p_event_type       => 'USER_DELETED',
        p_attribute_values => wwv_flow_t_varchar2 (
                                  wwv_flow_json.stringify(wwv_flow_security.find_company_name(
                                                              p_security_group_id => :old.security_group_id)),
                                  wwv_flow_json.stringify(:old.user_name)));
    --
    exception when wwv_flow_error.e_mutating_table then null;
end;
/
show errors


------------------------------
-- Updatable Report Attributes
--

prompt ...trigger wwv_flow_reg_upd_rpt_cols_t1

create or replace trigger wwv_flow_reg_upd_rpt_cols_t1
    before insert or update on wwv_flow_region_upd_rpt_cols
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/


prompt ...trigger wwv_flow_popup_lov_template_t1
create or replace trigger wwv_flow_popup_lov_template_t1
    before insert or update or delete on wwv_flow_popup_lov_template
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


------------------------------------
--   M E N U S
--

prompt ...trigger wwv_flow_menus_t1

create or replace trigger wwv_flow_menus_t1
    before insert or update or delete on wwv_flow_menus
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_menu_options_t1

create or replace trigger wwv_flow_menu_options_t1
    before insert or update or delete on wwv_flow_menu_options
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_menus
                        where id = :new.menu_id) loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
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
            update wwv_flow_menus
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.menu_id, :old.menu_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/



prompt ...trigger wwv_flow_menu_templates_t1

create or replace trigger wwv_flow_menu_templates_t1
    before insert or update or delete on wwv_flow_menu_templates
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
            update wwv_flow_themes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and theme_id          = coalesce( :new.theme_id, :old.theme_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_authentications_t1

create or replace trigger wwv_flow_authentications_t1
    before insert or update or delete on wwv_flow_authentications
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where authentication_id  = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_web_services_t1
create or replace trigger wwv_flow_web_services_t1
    before insert or update or delete on wwv_flow_shared_web_services
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_operations_t1

create or replace trigger wwv_flow_ws_operations_t1
    before insert or update or delete on wwv_flow_ws_operations
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
            update wwv_flow_shared_web_services
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.ws_id, :old.ws_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_parameters_t1

create or replace trigger wwv_flow_ws_parameters_t1
    before insert or update or delete on wwv_flow_ws_parameters
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
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_ws_operations
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.ws_opers_id, :old.ws_opers_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_parms_map_t1

create or replace trigger wwv_flow_ws_parms_map_t1
    before insert or update or delete on wwv_flow_ws_process_parms_map
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
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_step_processing
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.process_id, :old.process_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_lock_page_t1

create or replace trigger wwv_flow_lock_page_t1
    before insert or update or delete on wwv_flow_lock_page
    for each row
begin
    if inserting or updating then
        --
        -- ID
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- vpd
        --
        if :new.security_group_id is null then
            :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
        end if;
        --
        -- last updated
        --
        if not wwv_flow.g_import_in_progress then
            :new.LOCKED_ON := sysdate;
        end if;
    end if;

    --
    -- maintain log
    --
    if inserting then
        insert into wwv_flow_lock_page_log
            (lock_id,lock_flow,lock_page,action,developer,lock_comment)
        values
            (:new.id,:new.flow_id,:new.object_id,'LOCK',:new.locked_by,:new.lock_comment);
    elsif updating then
        insert into wwv_flow_lock_page_log
            (lock_id,lock_flow,lock_page,action,developer,lock_comment)
        values
            (:new.id,:new.flow_id,:new.object_id,'UPDATE',:new.locked_by,:new.lock_comment);
    elsif deleting then
        insert into wwv_flow_lock_page_log (
           lock_id,lock_flow,lock_page,ACTION,ACTION_DATE,DEVELOPER,lock_comment)
           values (
           :old.id, :old.flow_id, :old.object_id,'UNLOCK',sysdate,v('USER'),:old.lock_comment);
    end if;

    if not wwv_flow.g_import_in_progress then
        -- Perform a "dummy" update on page to increase the page_components_scn to avoid caching issues in Page Designer
        -- Ignore mutating table error which is raised if the parent is deleted too.
        begin
            update wwv_flow_steps
               set last_updated_on = last_updated_on,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.object_id, :old.object_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_lock_page_log_t1

create or replace trigger wwv_flow_lock_page_log_t1
    before insert or update on wwv_flow_lock_page_log
    for each row
begin
    --
    -- ID
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.action_date := sysdate;
    end if;
end;
/



prompt ...trigger wwv_flow_hnt_table_info_t1

create or replace trigger wwv_flow_hnt_table_info_t1
    before insert or update on wwv_flow_hnt_table_info
    for each row
begin
    if inserting and :new.table_id is null then
        :new.table_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_hnt_groups_t1

create or replace trigger wwv_flow_hnt_groups_t1
    before insert or update on wwv_flow_hnt_groups
    for each row
begin
    if inserting and :new.group_id is null then
        :new.group_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_hnt_col_info_t1

create or replace trigger wwv_flow_hnt_col_info_t1
    before insert or update on wwv_flow_hnt_column_info
    for each row
begin
    if inserting and :new.column_id is null then
        :new.column_id := wwv_flow_id.next_val;
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_hnt_lov_data_t1

create or replace trigger wwv_flow_hnt_lov_data_t1
    before insert or update on wwv_flow_hnt_lov_data
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
    :new.last_updated_on := sysdate;
end;
/


prompt ...trigger wwv_flow_hnt_column_dict_t1

create or replace trigger wwv_flow_hnt_column_dict_t1
    before insert or update on wwv_flow_hnt_column_dict
    for each row
begin
    :new.column_name := upper(:new.column_name);

    if inserting and :new.column_id is null then
        :new.column_id := wwv_flow_id.next_val;
    elsif updating
        and :old.column_name != :new.column_name then
        begin
            update wwv_flow_hnt_col_dict_syn
               set syn_name = :new.column_name
             where column_id = :old.column_id
               and syn_name = :old.column_name
               and security_group_id = :old.security_group_id;
        exception when others then null;
        end;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
       :new.created_on := sysdate;
       :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

create or replace trigger wwv_flow_hnt_column_dict_t2
    after insert on wwv_flow_hnt_column_dict
    for each row
begin
    if not wwv_flow.g_import_in_progress then
        insert into wwv_flow_hnt_col_dict_syn
           (column_id, syn_name)
        values
           (:new.column_id, :new.column_name);
    end if;
end;
/


prompt ...trigger wwv_flow_hnt_col_dict_syn_t1

create or replace trigger wwv_flow_hnt_col_dict_syn_t1
    before insert or update on wwv_flow_hnt_col_dict_syn
    for each row
begin

    :new.syn_name := upper(:new.syn_name);

    if inserting and :new.syn_id is null then
        :new.syn_id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if inserting then
       :new.created_on := sysdate;
       :new.created_by := nvl(wwv_flow.g_user,user);
    end if;

    if not wwv_flow.g_import_in_progress then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/


prompt ...trigger wwv_flow_chart_ser_attr_t1

create or replace trigger wwv_flow_chart_ser_attr_t1
    before insert or update or delete on wwv_flow_region_chart_ser_attr
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_reg_report_column_t1

create or replace trigger wwv_flow_reg_report_column_t1
    before insert or update or delete on wwv_flow_region_report_column
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- sync flow id for translations
        --
        if :new.flow_id is null then
             for c1 in (select flow_id
                         from wwv_flow_page_plugs
                         where id = :new.region_id) loop
                 :new.flow_id := c1.flow_id;
                 exit;
             end loop;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress then
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
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_page_groups_t1

create or replace trigger wwv_flow_page_groups_t1
    before insert or update or delete on wwv_flow_page_groups
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
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end wwv_flow_page_groups_t1;
/

prompt ...trigger wwv_flow_page_meta_tags_t1

create or replace trigger wwv_flow_page_meta_tags_t1
    before insert or update or delete on wwv_flow_page_meta_tags
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.page_id, :old.page_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_qb_saved_qry_t1

create or replace trigger wwv_flow_qb_saved_qry_t1
    before insert on wwv_flow_qb_saved_query
    for each row
begin
    :new.id                 := nvl(:new.id,wwv_flow_id.next_val);
    :new.query_owner        := nvl(:new.query_owner,wwv_flow_user_api.get_default_schema);
    :new.created_by         := nvl(:new.created_by,wwv_flow.g_user);
    :new.created_on         := nvl(:new.created_on,sysdate);
    :new.last_updated_by    := wwv_flow.g_user;
    :new.last_updated_on    := sysdate;
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
end;
/


prompt ...trigger wwv_flow_qb_saved_cond_t1

create or replace trigger wwv_flow_qb_saved_cond_t1
    before insert on wwv_flow_qb_saved_cond
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_qb_saved_join_t1

create or replace trigger wwv_flow_qb_saved_join_t1
    before insert on wwv_flow_qb_saved_join
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_qb_saved_tabs_t1

create or replace trigger wwv_flow_qb_saved_tabs_t1
    before insert on wwv_flow_qb_saved_tabs
    for each row
begin
    :new.security_group_id  := nvl(wwv_flow_security.g_security_group_id,0);
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_qb_saved_query set
           last_updated_on = sysdate,
           last_updated_by = wwv_flow.g_user
        where
           id = :new.id and
           security_group_id = :new.security_group_id;
    end if;
end;
/


prompt ...trigger wwv_flow_sw_stmts_t1

create or replace trigger wwv_flow_sw_stmts_t1
    before insert or update on wwv_flow_sw_stmts
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_collection_int.get_security_group_id;
    end if;
end;
/

prompt ...trigger wwv_qs_saved_models_t1

create or replace trigger wwv_qs_saved_models_t1
    before insert or update on wwv_qs_saved_models
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        :new.row_version := 1;
    elsif updating then
        :new.row_version := :old.row_version + 1;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        :new.updated := sysdate;
        :new.updated_by := wwv_flow.g_user;
    end if;
end;
/


prompt ...trigger wwv_flow_models_t1

create or replace trigger wwv_flow_models_t1
    before insert or update on wwv_flow_models
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_model_pages_t1

create or replace trigger wwv_flow_model_pages_t1
    before insert or update on wwv_flow_model_pages
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_model_page_regions_t1

create or replace trigger wwv_flow_model_page_regions_t1
    before insert or update on wwv_flow_model_page_regions
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_model_page_cols_t1

create or replace trigger wwv_flow_model_page_cols_t1
    before insert or update on wwv_flow_model_page_cols
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    if inserting then
       :new.created_by := nvl(wwv_flow.g_user,user);
       :new.created_on := sysdate;
    elsif updating then
       :new.last_updated_by := nvl(wwv_flow.g_user,user);
       :new.last_updated_on := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_sc_trans_t1

CREATE OR REPLACE TRIGGER wwv_flow_sc_trans_t1
    before insert or update on wwv_flow_sc_trans
    for each row
declare
  l_tid number;
begin
    -- set security group id if null
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- set t_id as I need to amintain the order of transactions as they occured
    if inserting and :new.transaction_id is null then
        select nvl(max(transaction_id),0)+1 into l_tid from wwv_flow_sc_trans where session_id = :new.session_id;
        :new.transaction_id := l_tid;
        :new.transaction_status := 'N';
        :new.created_on := sysdate;
    else
        :new.updated_on := sysdate;
    end if;
end;
/

prompt ...trigger wwv_flow_restricted_schema_t1

create or replace trigger wwv_flow_restricted_schema_t1
    before insert or update on wwv_flow_restricted_schemas
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    else
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;

    -- Monitor it on the wwv_flow_events1/2$ table
    --
    if inserting then
        wwv_flow_event_metrics_int.add_event (
            p_event_type       => 'SCHEMA_RESTRICT',
            p_attribute_values => wwv_flow_t_varchar2 (
                                      wwv_flow_json.stringify(:new.schema)));
    end if;
end;
/

prompt ...trigger wwv_flow_restricted_schema_t2

create or replace trigger wwv_flow_restricted_schema_t2
    after delete on wwv_flow_restricted_schemas
    for each row
begin
    -- Monitor it on the wwv_flow_events1/2$ table
    --
    wwv_flow_event_metrics_int.add_event (
        p_event_type       => 'SCHEMA_UNRESTRICT',
        p_attribute_values => wwv_flow_t_varchar2 (
                                  wwv_flow_json.stringify(:old.schema)));
end;
/
show errors

prompt ...trigger wwv_flow_rschema_exception_t1

create or replace trigger wwv_flow_rschema_exception_t1
    before insert or update or delete on wwv_flow_rschema_exceptions
    for each row
declare
------------------------------------------------------------------------
-- Return the schema name for a schema ID. We are using an autonomous
-- transaction to avoid mutating table issues.
--
    function get_schema_name (
        p_schema_id in number )
    return varchar2
    is
        pragma autonomous_transaction;
        l_schema wwv_flow_restricted_schemas.schema%type;
    begin
        select schema
          into l_schema
          from wwv_flow_restricted_schemas
         where id = p_schema_id;
        wwv_flow_security.do_commit;
        return l_schema;
    exception when no_data_found then
        wwv_flow_security.do_commit;
        return null;
    end get_schema_name;
------------------------------------------------------------------------
begin
    if not deleting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
    elsif updating then
        :new.last_updated_on := sysdate;
        :new.last_updated_by := nvl(wwv_flow.g_user,user);
    end if;
    --
    -- Monitor it on the wwv_flow_events1/2$ table
    --
    begin
       if inserting or deleting then
            wwv_flow_event_metrics_int.add_event (
                p_event_type    => case
                                       when inserting then 'SCHEMA_EXCEPTION_CREATED'
                                       else 'SCHEMA_EXCEPTION_DELETED'
                                    end,
            p_security_group_id => wwv_flow_security.find_security_group_id(
                                       p_company => case
                                                        when inserting then :new.workspace_name
                                                        else :old.workspace_name
                                                    end ),
            p_attribute_values  => wwv_flow_t_varchar2 (
                                       wwv_flow_json.stringify(
                                           get_schema_name(
                                               p_schema_id => nvl(:old.schema_id,
                                                                  :new.schema_id))),
                                       wwv_flow_json.stringify(
                                           nvl(:new.workspace_name,
                                               :old.workspace_name))));
    end if;
    end;
end;
/
show errors

prompt ...trigger wwv_flow_install_t1

create or replace trigger wwv_flow_install_t1
    before insert or update or delete on wwv_flow_install
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;
        --
        :new.prompt_substitution_01_yn := nvl(:new.prompt_substitution_01_yn, 'N');
        :new.prompt_substitution_02_yn := nvl(:new.prompt_substitution_02_yn, 'N');
        :new.prompt_substitution_03_yn := nvl(:new.prompt_substitution_03_yn, 'N');
        :new.prompt_substitution_04_yn := nvl(:new.prompt_substitution_04_yn, 'N');
        :new.prompt_substitution_05_yn := nvl(:new.prompt_substitution_05_yn, 'N');
        :new.prompt_substitution_06_yn := nvl(:new.prompt_substitution_06_yn, 'N');
        :new.prompt_substitution_07_yn := nvl(:new.prompt_substitution_07_yn, 'N');
        :new.prompt_substitution_08_yn := nvl(:new.prompt_substitution_08_yn, 'N');
        :new.prompt_substitution_09_yn := nvl(:new.prompt_substitution_09_yn, 'N');
        :new.prompt_substitution_10_yn := nvl(:new.prompt_substitution_10_yn, 'N');
        :new.prompt_substitution_11_yn := nvl(:new.prompt_substitution_11_yn, 'N');
        :new.prompt_substitution_12_yn := nvl(:new.prompt_substitution_12_yn, 'N');
        :new.prompt_substitution_13_yn := nvl(:new.prompt_substitution_13_yn, 'N');
        :new.prompt_substitution_14_yn := nvl(:new.prompt_substitution_14_yn, 'N');
        :new.prompt_substitution_15_yn := nvl(:new.prompt_substitution_15_yn, 'N');
        :new.prompt_substitution_16_yn := nvl(:new.prompt_substitution_16_yn, 'N');
        :new.prompt_substitution_17_yn := nvl(:new.prompt_substitution_17_yn, 'N');
        :new.prompt_substitution_18_yn := nvl(:new.prompt_substitution_18_yn, 'N');
        :new.prompt_substitution_19_yn := nvl(:new.prompt_substitution_19_yn, 'N');
        :new.prompt_substitution_20_yn := nvl(:new.prompt_substitution_20_yn, 'N');
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
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_install_scripts_t1

create or replace trigger wwv_flow_install_scripts_t1
    before insert or update or delete on wwv_flow_install_scripts
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;

        if :new.install_id is null then
           for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
              :new.install_id := c1.id;
           end loop;
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
            update wwv_flow_install
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.install_id, :old.install_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_install_objects_t1

create or replace trigger wwv_flow_install_objects_t1
    before insert or update or delete on wwv_flow_install_objects
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
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
            update wwv_flow_install_scripts
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.script_id, :old.script_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_install_checks_t1

create or replace trigger wwv_flow_install_checks_t1
    before insert or update or delete on wwv_flow_install_checks
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;

        if :new.install_id is null then
           for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
              :new.install_id := c1.id;
           end loop;
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
            update wwv_flow_install
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.install_id, :old.install_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_install_build_opt_t1

create or replace trigger wwv_flow_install_build_opt_t1
    before insert or update or delete on wwv_flow_install_build_opt
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.flow_id is null then
           :new.flow_id := v('FB_FLOW_ID');
        end if;

        if :new.install_id is null then
           for c1 in (select id from wwv_flow_install where flow_id = :new.flow_id) loop
              :new.install_id := c1.id;
           end loop;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_install
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.install_id, :old.install_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_lock_script_t1

create or replace trigger wwv_flow_lock_script_t1
    before insert or update on wwv_flow_lock_script
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.locked_by := nvl(wwv_flow.g_user,user);
        :new.locked_on := sysdate;
    end if;
    --
    -- maintain log
    --
    if inserting then
        insert into wwv_flow_lock_script_log
            (flow_id, lock_id, script_id, action, lock_comment)
        values
            (:new.flow_id, :new.id, :new.script_id, 'LOCK', :new.lock_comment);
    end if;
    if updating then
        insert into wwv_flow_lock_script_log
            (flow_id, lock_id, script_id, action, lock_comment)
        values
            (:new.flow_id, :new.id, :new.script_id, 'UPDATE', :new.lock_comment);
    end if;
end;
/


prompt ...trigger wwv_flow_lock_script_t2

create or replace trigger wwv_flow_lock_script_t2
    before delete on wwv_flow_lock_script
    for each row
begin
    insert into wwv_flow_lock_script_log
        (flow_id, lock_id, script_id, action, lock_comment)
    values
        (:old.flow_id, :old.id, :old.script_id, 'UNLOCK', :old.lock_comment);
end;
/


prompt ...trigger wwv_flow_lock_script_log_t1

create or replace trigger wwv_flow_lock_script_log_t1
    before insert or update on wwv_flow_lock_script_log
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    --
    -- last updated
    --
    if not wwv_flow.g_import_in_progress then
        :new.locked_by := nvl(wwv_flow.g_user,user);
        :new.action_date := sysdate;
    end if;
end;
/


prompt ...trigger wwv_flow_flash_charts_t1

create or replace trigger wwv_flow_flash_charts_t1
    before insert or update or delete on wwv_flow_flash_charts
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.chart_xml is not null then
            :new.chart_xml := replace (
                                  :new.chart_xml,
                                  wwv_flow.CR,
                                  null );
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_flash_chart_series_t1

create or replace trigger wwv_flow_flash_chart_series_t1
    before insert or update or delete on wwv_flow_flash_chart_series
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_flash_charts
                        where id = :new.chart_id) loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
        end if;

        if :new.series_query is not null then
            :new.series_query := replace (
                                     :new.series_query,
                                     wwv_flow.CR,
                                     null );
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_flash_charts
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.chart_id, :old.chart_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_flash_charts_5_t1

create or replace trigger wwv_flow_flash_charts_5_t1
    before insert or update or delete on wwv_flow_flash_charts_5
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.chart_xml is not null then
            :new.chart_xml := replace (
                                  :new.chart_xml,
                                  wwv_flow.CR,
                                  null );
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_flash_5_series_t1

create or replace trigger wwv_flow_flash_5_series_t1
    before insert or update or delete on wwv_flow_flash_chart5_series
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_flash_charts_5
                        where id = :new.chart_id) loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
        end if;

        if :new.series_query is not null then
            :new.series_query := replace (
                                     :new.series_query,
                                     wwv_flow.CR,
                                     null );
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_flash_charts_5
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.chart_id, :old.chart_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_jet_charts_t1

create or replace trigger wwv_flow_jet_charts_t1
    before insert or update or delete on wwv_flow_jet_charts
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_jet_chart_series_t1

create or replace trigger wwv_flow_jet_chart_series_t1
    before insert or update or delete on wwv_flow_jet_chart_series
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_jet_charts
                        where id = :new.chart_id)
            loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
        end if;
        if :new.data_source is not null then
            :new.data_source := replace ( :new.data_source, wwv_flow.CR, null );
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_jet_charts
               set updated_on        = sysdate,
                   updated_by        = wwv_flow.g_user
             where id                = coalesce( :new.chart_id, :old.chart_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_jet_chart_axes_t1

create or replace trigger wwv_flow_jet_chart_axes_t1
    before insert or update or delete on wwv_flow_jet_chart_axes
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.flow_id is null then
            for c1 in (select flow_id
                         from wwv_flow_jet_charts
                        where id = :new.chart_id)
            loop
                :new.flow_id := c1.flow_id;
                exit;
            end loop;
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_jet_charts
               set updated_on        = sysdate,
                   updated_by        = wwv_flow.g_user
             where id                = coalesce( :new.chart_id, :old.chart_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_map_regions_t1

create or replace trigger wwv_flow_map_regions_t1
    before insert or update or delete on wwv_flow_map_regions
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
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_map_region_layers_t1

create or replace trigger wwv_flow_map_region_layers_t1
    before insert or update or delete on wwv_flow_map_region_layers
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
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_map_regions
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.map_region_id, :old.map_region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_cards_t1

create or replace trigger wwv_flow_cards_t1
    before insert or update or delete on wwv_flow_cards
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
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_card_actions_t1

create or replace trigger wwv_flow_card_actions_t1
    before insert or update or delete on wwv_flow_card_actions
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
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_cards
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.card_id, :old.card_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_standard_icons_t1

create or replace trigger wwv_flow_standard_icons_t1
    before insert or update on wwv_flow_standard_icons
    for each row
begin
    if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_std_item_types_t1

create or replace trigger wwv_flow_std_item_types_t1
    before insert or update on wwv_flow_standard_item_types
    for each row
begin
    if inserting and :new.id is null then
         :new.id := wwv_flow_id.next_val;
    end if;
end;
/

----------------------
-- W O R K S H E E T S

prompt ...trigger wwv_flow_worksheets_t1

create or replace trigger wwv_flow_worksheets_t1
    before insert or update or delete on wwv_flow_worksheets
    for each row
begin
    if inserting or updating then
        --
        -- maintain pk and timestamps
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;


        if inserting and :new.internal_uid is null then
            :new.internal_uid := :new.id;
        end if;
        --
        -- set owner
        --
        if :new.owner is null then
            :new.owner := :new.created_by;
        end if;
        --
        -- set status
        --
        if :new.status is null then
            :new.status := 'AVAILABLE_FOR_OWNER';
        end if;
        --
        -- by default, reports show up as TABS
        --
        if inserting and :new.report_list_mode is null then
            :new.report_list_mode := 'TABS';
        end if;

        :new.SHOW_SELECT_COLUMNS       := nvl(:new.SHOW_SELECT_COLUMNS,'Y');
        :new.SHOW_ROWS_PER_PAGE        := nvl(:new.SHOW_ROWS_PER_PAGE,'Y');
        :new.SHOW_FILTER               := nvl(:new.SHOW_FILTER,'Y');
        :new.SHOW_CONTROL_BREAK        := nvl(:new.SHOW_CONTROL_BREAK,'Y');
        :new.SHOW_SORT                 := nvl(:new.SHOW_SORT,'Y');
        :new.SHOW_HIGHLIGHT            := nvl(:new.SHOW_HIGHLIGHT,'Y');
        :new.SHOW_AGGREGATE            := nvl(:new.SHOW_AGGREGATE,'Y');
        :new.SHOW_NOTIFY               := nvl(:new.SHOW_NOTIFY,'N');
        :new.SHOW_CHART                := nvl(:new.SHOW_CHART,'Y');
        :new.SHOW_GROUP_BY             := nvl(:new.SHOW_GROUP_BY,'Y');
        :new.SHOW_PIVOT                := nvl(:new.SHOW_PIVOT,'Y');
        :new.SHOW_CALENDAR             := nvl(:new.SHOW_CALENDAR,'Y');
        :new.SHOW_FLASHBACK            := nvl(:new.SHOW_FLASHBACK,'Y');
        :new.SHOW_RESET                := nvl(:new.SHOW_RESET,'Y');
        :new.SHOW_DOWNLOAD             := nvl(:new.SHOW_DOWNLOAD,'Y');
        :new.SHOW_COMPUTATION          := nvl(:new.SHOW_COMPUTATION,'Y');
        :new.SHOW_HELP                 := nvl(:new.SHOW_HELP,'Y');
        :new.SHOW_DETAIL_LINK          := nvl(:new.SHOW_DETAIL_LINK,'Y');
        :new.ALLOW_REPORT_SAVING       := nvl(:new.ALLOW_REPORT_SAVING,'Y');
        :new.ALLOW_SAVE_RPT_PUBLIC     := nvl(:new.ALLOW_SAVE_RPT_PUBLIC,'N');
        :new.ALLOW_REPORT_CATEGORIES   := nvl(:new.ALLOW_REPORT_CATEGORIES,'Y');
        :new.ALLOW_EXCLUDE_NULL_VALUES := nvl(:new.ALLOW_EXCLUDE_NULL_VALUES,'Y');
        :new.ALLOW_HIDE_EXTRA_COLUMNS  := nvl(:new.ALLOW_HIDE_EXTRA_COLUMNS,'Y');

        :new.SHOW_FINDER_DROP_DOWN     := nvl(:new.SHOW_FINDER_DROP_DOWN,'Y');
        :new.SHOW_DISPLAY_ROW_COUNT    := nvl(:new.SHOW_DISPLAY_ROW_COUNT,'N');
        :new.SHOW_SEARCH_BAR           := nvl(:new.SHOW_SEARCH_BAR,'Y');
        :new.SHOW_SEARCH_TEXTBOX       := nvl(:new.SHOW_SEARCH_TEXTBOX,'Y');
        :new.SHOW_ACTIONS_MENU         := nvl(:new.SHOW_ACTIONS_MENU,'Y');
        :new.ENABLE_MAIL_DOWNLOAD      := nvl(:new.ENABLE_MAIL_DOWNLOAD,'Y');

        --
        -- maintain column values
        --
        if :new.flow_id is null then
           :new.flow_id := wwv_flow.g_flow_id;
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress and coalesce( :new.region_id, :old.region_id ) is not null then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_plugs
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.region_id, :old.region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_worksheets_t2

create or replace trigger wwv_flow_worksheets_t2
    before delete on wwv_flow_worksheets
begin
    wwv_flow_ir.g_delete_in_progress := true;
end;
/


prompt ...trigger wwv_flow_worksheets_t3

create or replace trigger wwv_flow_worksheets_t3
    after delete on wwv_flow_worksheets
begin
    wwv_flow_ir.g_delete_in_progress := false;
end;
/


prompt ...trigger wwv_flow_ws_categories_t1

create or replace trigger wwv_flow_ws_categories_t1
    before insert or update or delete on wwv_flow_worksheet_categories
    for each row
begin
    if inserting or updating then
        --
        -- maintain pk and timestamps
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- display sequence
        --
        if inserting and :new.display_sequence is null then
            select nvl(max(display_sequence),0) + 1 into :new.display_sequence
              from wwv_flow_worksheet_categories
             where worksheet_id = :new.worksheet_id;
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_worksheets
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.worksheet_id, :old.worksheet_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_col_groups_t1

create or replace trigger wwv_flow_ws_col_groups_t1
    before insert or update or delete on wwv_flow_worksheet_col_groups
    for each row
begin
    if inserting or updating then
        --
        -- maintain pk and timestamps
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        if :new.display_sequence is null then
            :new.display_sequence := 10;
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
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_worksheets
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.worksheet_id, :old.worksheet_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_columns_t1

create or replace trigger wwv_flow_ws_columns_t1
    before insert or update or delete on wwv_flow_worksheet_columns
    for each row
begin
    if inserting or updating then
        --
        -- maintain pk and timestamps
        --
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        --
        -- default values
        --
        if :new.report_label is null then
            :new.report_label := :new.column_label;
        elsif :new.column_label is null then
            :new.column_label := :new.report_label;
        end if;

        if :new.is_sortable is null then
            :new.is_sortable := 'Y';
        end if;

        if :new.display_text_as = 'RICH_TEXT' then
            -- Rich Text column type doesn't allow to set those attributes,
            -- but they still have to be set to No for the runtime engine.
            :new.allow_sorting      := 'N';
            :new.allow_ctrl_breaks  := 'N';
            :new.allow_aggregations := 'N';
            :new.allow_computations := 'N';
            :new.allow_charting     := 'N';
            :new.allow_group_by     := 'N';
            :new.allow_pivot        := 'N';
        elsif :new.display_text_as like 'TMPL\_%' escape '\' then
            -- Template Component column type doesn't allow to set those attributes,
            -- but they still have to be set to No for the runtime engine.
            :new.allow_sorting      := 'N';
            :new.allow_filtering    := 'N';
            :new.allow_highlighting := 'N';
            :new.allow_ctrl_breaks  := 'N';
            :new.allow_aggregations := 'N';
            :new.allow_computations := 'N';
            :new.allow_charting     := 'N';
            :new.allow_group_by     := 'N';
            :new.allow_pivot        := 'N';
        end if;

        :new.allow_sorting      := nvl(:new.allow_sorting,'Y');
        :new.allow_filtering    := nvl(:new.allow_filtering,'Y');
        :new.allow_highlighting := nvl(:new.allow_highlighting,'Y');
        :new.allow_ctrl_breaks  := nvl(:new.allow_ctrl_breaks,'Y');
        :new.allow_aggregations := nvl(:new.allow_aggregations,'Y');
        :new.allow_computations := nvl(:new.allow_computations,'Y');
        :new.allow_charting     := nvl(:new.allow_charting,'Y');
        :new.allow_group_by     := nvl(:new.allow_group_by,'Y');
        :new.allow_pivot        := nvl(:new.allow_pivot,'Y');
        :new.allow_hide         := nvl(:new.allow_hide,'Y');

        if :new.display_text_as is null then
            :new.display_text_as := 'ESCAPE_SC';
        end if;
        if :new.heading_alignment is null then
            :new.heading_alignment := 'CENTER';
        end if;
        if :new.column_alignment is null then
            :new.column_alignment := 'LEFT';
        end if;
        if :new.display_text_as = 'RICH_TEXT' then
           :new.rpt_show_filter_lov := 'N';
        elsif :new.rpt_show_filter_lov is null then
            :new.rpt_show_filter_lov := 'D';
        end if;
        if :new.rpt_filter_date_ranges is null then
            :new.rpt_filter_date_ranges := 'ALL';
        end if;

        --
        -- security columns
        --
        if :new.others_may_edit is null then
           :new.others_may_edit := 'Y';
        end if;
        if :new.others_may_view is null then
           :new.others_may_view := 'Y';
        end if;

        -- maintain distinct_value_filter
        if :new.display_as = 'TEXTAREA' and :new.rpt_distinct_lov is null then
           :new.rpt_distinct_lov := 'N';
        elsif :new.rpt_distinct_lov is null then
           :new.rpt_distinct_lov := 'Y';
        end if;

        -- get next identifier
        if inserting and :new.column_identifier is null then
           :new.column_identifier := wwv_flow_ir.get_next_identifier(:new.worksheet_id);
        end if;
        --
        -- sync column headings
        --
        if :new.sync_form_label is null then
           :new.sync_form_label := 'Y';
        end if;
        if :new.sync_form_label = 'Y' then
           :new.column_label := :new.report_label;
        end if;
        -- vpd
        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
        -- audit
        if not wwv_flow.g_import_in_progress
           and not wwv_flow_ir.g_delete_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.updated_on := sysdate;
            :new.updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_worksheets
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.worksheet_id, :old.worksheet_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_rpts_t1

create or replace trigger wwv_flow_ws_rpts_t1
    before insert or update on wwv_flow_worksheet_rpts
    for each row
declare
    l_col_type varchar2(30);
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
    if :new.application_user is null then
        :new.application_user := v('APP_USER');
    end if;
    if :new.status is null then
       :new.status := 'PRIVATE';
    end if;
    if :new.display_rows is null then
       :new.display_rows := 50;
    end if;
    if :new.flashback_enabled is null then
       :new.flashback_enabled := 'N';
    end if;
    if :new.report_seq is null then
       :new.report_seq := 10;
    end if;
    if :new.is_default is null then
        :new.is_default := 'N';
    end if;
    if :new.is_default = 'Y' and :new.status = 'PRIVATE' then
        :new.status := 'PUBLIC';
    end if;

    if :new.status = 'PRIVATE' then
        :new.report_alias := null;
    else
        -- populate report alias for base reports
        if :new.report_alias is null and :new.session_id is null then
            select wwv_seq.nextval
            into :new.report_alias
            from sys.dual;
        end if;
    end if;

    -- bug 10399772
    if :new.chart_aggregate = '0' then
        :new.chart_aggregate := null;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
    --
    if not wwv_flow.g_import_in_progress and :new.status <> 'PRIVATE' then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_worksheets
               set updated_on = sysdate,
                   updated_by = wwv_flow.g_user
             where id                = coalesce( :new.worksheet_id, :old.worksheet_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_conditions_t1

create or replace trigger wwv_flow_ws_conditions_t1
    before insert or update on wwv_flow_worksheet_conditions
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
    if inserting and :new.enabled is null then
        :new.enabled := 'Y';
    end if;
    if inserting and :new.allow_delete is null then
        :new.allow_delete := 'Y';
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    if not wwv_flow.g_import_in_progress then
        --
        -- update parent timestamp
        --
        for i in ( select id
                     from wwv_flow_worksheet_rpts
                    where id = :new.report_id
                    for update skip locked )
        loop
            update wwv_flow_worksheet_rpts
               set updated_on = :new.updated_on,
                   updated_by = :new.updated_by
             where id = :new.report_id;
        end loop;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_computation_t1

create or replace trigger wwv_flow_ws_computation_t1
    before insert or update on wwv_flow_worksheet_computation
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;

    if :new.db_column_name is null then
        :new.db_column_name := wwv_flow_ir.get_next_computed_column_name(:new.worksheet_id, :new.report_id);
    end if;

    if :new.column_identifier is null then
        :new.column_identifier := wwv_flow_ir.get_next_computed_identifier(:new.worksheet_id, :new.report_id);
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/


prompt ...trigger wwv_flow_ws_group_by_t1

create or replace trigger wwv_flow_ws_group_by_t1
    before insert or update on wwv_flow_worksheet_group_by
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;

    if :new.function_01 is not null and :new.function_column_01 is not null then
        :new.function_db_column_name_01 := nvl(:new.function_db_column_name_01,'APXWS_GBFC_01');
    end if;
    if :new.function_02 is not null and :new.function_column_02 is not null then
        :new.function_db_column_name_02 := nvl(:new.function_db_column_name_02,'APXWS_GBFC_02');
    end if;
    if :new.function_03 is not null and :new.function_column_03 is not null then
        :new.function_db_column_name_03 := nvl(:new.function_db_column_name_03,'APXWS_GBFC_03');
    end if;
    if :new.function_04 is not null and :new.function_column_04 is not null then
        :new.function_db_column_name_04 := nvl(:new.function_db_column_name_04,'APXWS_GBFC_04');
    end if;
    if :new.function_05 is not null and :new.function_column_05 is not null then
        :new.function_db_column_name_05 := nvl(:new.function_db_column_name_05,'APXWS_GBFC_05');
    end if;
    if :new.function_06 is not null and :new.function_column_06 is not null then
        :new.function_db_column_name_06 := nvl(:new.function_db_column_name_06,'APXWS_GBFC_06');
    end if;
    if :new.function_07 is not null and :new.function_column_07 is not null then
        :new.function_db_column_name_07 := nvl(:new.function_db_column_name_07,'APXWS_GBFC_07');
    end if;
    if :new.function_08 is not null and :new.function_column_08 is not null then
        :new.function_db_column_name_08 := nvl(:new.function_db_column_name_08,'APXWS_GBFC_08');
    end if;
    if :new.function_09 is not null and :new.function_column_09 is not null then
        :new.function_db_column_name_09 := nvl(:new.function_db_column_name_09,'APXWS_GBFC_09');
    end if;
    if :new.function_10 is not null and :new.function_column_10 is not null then
        :new.function_db_column_name_10 := nvl(:new.function_db_column_name_10,'APXWS_GBFC_10');
    end if;
    if :new.function_11 is not null and :new.function_column_11 is not null then
        :new.function_db_column_name_11 := nvl(:new.function_db_column_name_11,'APXWS_GBFC_11');
    end if;
    if :new.function_12 is not null and :new.function_column_12 is not null then
        :new.function_db_column_name_12 := nvl(:new.function_db_column_name_12,'APXWS_GBFC_12');
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

prompt ...trigger wwv_flow_worksheet_notify_t1

create or replace trigger wwv_flow_worksheet_notify_t1
    before insert or update on wwv_flow_worksheet_notify
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if inserting then
        --
        -- Mark the session as associated with the subscription.
        --
        if :new.session_id is not null then
            wwv_flow_session.on_subscription_created (
                p_id => :new.session_id );
        end if;
    end if;

    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;

    --
    -- set owner
    --
    if :new.owner is null then
        :new.owner := :new.created_by;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress
       and not wwv_flow_ir_render.g_notify_in_progress
    then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

prompt ...trigger wwv_flow_worksheet_notify_t2
create or replace trigger wwv_flow_worksheet_notify_t2
    after delete on wwv_flow_worksheet_notify
    for each row
begin
    --
    -- Mark the session as timed out.
    --
    if :old.session_id is not null then
        wwv_flow_session.on_subscription_deleted (
            p_id => :old.session_id );
    end if;
end;
/

prompt ...trigger wwv_flow_ws_pivot_t1

create or replace trigger wwv_flow_ws_pivot_t1
    before insert or update on wwv_flow_worksheet_pivot
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_rpts
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.report_id;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_pivot_agg_t1

create or replace trigger wwv_flow_ws_pivot_agg_t1
    before insert or update on wwv_flow_worksheet_pivot_agg
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_pivot
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.pivot_id;
    end if;
end;
/

prompt ...trigger wwv_flow_ws_pivot_sort_t1

create or replace trigger wwv_flow_ws_pivot_sort_t1
    before insert or update on wwv_flow_worksheet_pivot_sort
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;

    --
    -- update parent timestamp
    --
    if not wwv_flow.g_import_in_progress then
        update wwv_flow_worksheet_pivot
           set updated_on = :new.updated_on,
               updated_by = :new.updated_by
         where id = :new.pivot_id;
    end if;
end;
/


prompt ...trigger wwv_flow_app_groups_t1

create or replace trigger wwv_flow_app_groups_t1
    before insert or update on wwv_flow_application_groups
    for each row
begin
    --
    -- maintain pk and timestamps
    --
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := nvl(wwv_flow.g_user,user);
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        elsif updating then
            :new.updated_on := sysdate;
            :new.updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow.get_sgid;
    end if;
end;
/


prompt ...trigger wwv_flow_dict_views_t1

create or replace trigger wwv_flow_dict_views_t1
    before insert or update on wwv_flow_dictionary_views
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_adv_cat_t1

create or replace trigger wwv_flow_adv_cat_t1
    before insert or update on wwv_flow_advisor_categories
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_adv_chk_t1

create or replace trigger wwv_flow_adv_chk_t1
    before insert or update on wwv_flow_advisor_checks
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_adv_chk_msg_t1

create or replace trigger wwv_flow_adv_chk__msg_t1
    before insert or update on wwv_flow_advisor_check_msgs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/

prompt ...trigger wwv_flow_plugins_t1

create or replace trigger wwv_flow_plugins_t1
    before insert or update or delete on wwv_flow_plugins
    for each row
declare
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- set name
        :new.name := upper(:new.name);

        -- fix internal name for template components
        if :new.plugin_type = wwv_flow_plugin.c_plugin_type_tmpl_component then
            :new.name := wwv_flow_template_directive.get_name (
                             p_name                  => :new.name,
                             p_theme_id              => :new.theme_id,
                             p_for_using_component   => false );

            -- pre compile templates
            -- partial template
            if :new.partial_template is not null then
                if :old.partial_template is null or :new.partial_template != :old.partial_template then
                    :new.partial_template_compiled := wwv_flow_template_directive.compile_to_json(
                                                          p_template          => :new.partial_template,
                                                          p_placeholders_only => false );
                end if;
            else
                :new.partial_template_compiled := null;
            end if;

            -- report body template
            if :new.report_body_template is not null then
                if :old.report_body_template is null or :new.report_body_template != :old.report_body_template then
                    -- Initialize Report Body template, if it doesn't include error handling, we have to add a default one
                    :new.report_body_template_compiled := wwv_flow_template_component.compile_report_body_template(
                                                              p_template          => :new.report_body_template,
                                                              p_placeholders_only => false );
                end if;
            else
                :new.report_body_template_compiled := null;
            end if;

            -- report row template
            if :new.report_row_template is not null then
                if :old.report_row_template is null or :new.report_row_template != :old.report_row_template then
                    :new.report_row_template_compiled := wwv_flow_template_directive.compile_to_json(
                                                             p_template          => :new.report_row_template,
                                                             p_placeholders_only => false );
                end if;
            else
                :new.report_row_template_compiled := null;
            end if;
             -- report group template
            if :new.report_group_template is not null then
                if :old.report_group_template is null or :new.report_group_template != :old.report_group_template then
                    :new.report_group_template_compiled := wwv_flow_template_directive.compile_to_json(
                                                               p_template          => :new.report_group_template,
                                                               p_placeholders_only => false );
                end if;
            else
                :new.report_group_template_compiled := null;
            end if;

            -- report container template
            if :new.report_container_template is not null then
                if :old.report_container_template is null or :new.report_container_template != :old.report_container_template then
                    :new.report_container_tmpl_compiled := wwv_flow_template_directive.compile_to_json(
                                                               p_template          => :new.report_container_template,
                                                               p_placeholders_only => false );
                end if;
            else
                :new.report_container_tmpl_compiled := null;
            end if;

        else
            :new.translate_this_template        := null;
            :new.partial_template_compiled      := null;
            :new.report_body_template_compiled  := null;
            :new.report_row_template_compiled   := null;
            :new.report_container_tmpl_compiled := null;
        end if;

        -- not set by "Create Plug-In" on 4000:4410 that's why we have to default it
        :new.substitute_attributes := nvl(:new.substitute_attributes, 'Y');

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
         -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        if coalesce( :new.theme_id, :old.theme_id ) is not null then
            begin
                update wwv_flow_themes
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where flow_id           = coalesce( :new.flow_id, :old.flow_id )
                   and theme_id          = coalesce( :new.theme_id, :old.theme_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        else
            begin
                update wwv_flows
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user,
                       shared_components_scn = sys.dbms_flashback.get_system_change_number
                 where id                = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where plugin_id          = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_plugin_slots_t1

create or replace trigger wwv_flow_plugin_slots_t1
    before insert or update or delete on wwv_flow_plugin_slots
    for each row
declare
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
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_plugin_std_attributes_t1

create or replace trigger wwv_flow_plugin_std_attr_t1
    before insert or update or delete on wwv_flow_plugin_std_attributes
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
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_plugin_attr_groups_t1

create or replace trigger wwv_flow_plugin_attr_groups_t1
    before insert or update or delete on wwv_flow_plugin_attr_groups
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
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_plugin_attributes_t1

create or replace trigger wwv_flow_plugin_attributes_t1
    before insert or update or delete on wwv_flow_plugin_attributes
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- delete values when it's no select list anymore
        if updating and :old.attribute_type = 'SELECT LIST' and :new.attribute_type <> 'SELECT LIST' then
            delete wwv_flow_plugin_attr_values
             where plugin_attribute_id = :old.id;
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
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plugin_attr_values_t1

create or replace trigger wwv_flow_plugin_attr_values_t1
    before insert or update or delete on wwv_flow_plugin_attr_values
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
            update wwv_flow_plugin_attributes
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_attribute_id, :old.plugin_attribute_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plugin_act_templ_t1

create or replace trigger wwv_flow_plugin_act_templ_t1
    before insert or update or delete on wwv_flow_plugin_act_templates
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

        -- pre compile template
        if :new.template is not null then
            if :old.template is null or :new.template != :old.template then
                :new.template_compiled := wwv_flow_template_directive.compile_to_json(
                                              p_template          => :new.template,
                                              p_placeholders_only => false );
            end if;
        else
            :new.template_compiled := null;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plugin_act_pos_t1

create or replace trigger wwv_flow_plugin_act_pos_t1
    before insert or update or delete on wwv_flow_plugin_act_positions
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
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plugin_files_t1

create or replace trigger wwv_flow_plugin_files_t1
    before insert or update or delete on wwv_flow_plugin_files
    for each row
declare
    l_files_version_increment number;
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
        -- Note: always set change attributes so that the caching of files works
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        if deleting then
            l_files_version_increment := 0;
        else
            l_files_version_increment := 1;
        end if;
        --
        begin
            update wwv_flow_plugins
               -- we should not update files_version, if the plugin is subscribed
               set files_version   = case when reference_id is null then
                                         files_version + l_files_version_increment
                                     else
                                         files_version
                                     end,
                   last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
prompt ...trigger wwv_flow_plugin_files_t2
create or replace trigger wwv_flow_plugin_files_t2
    after insert or update on wwv_flow_plugin_files
begin
    wwv_flow_file_api.check_workspace_limits;
end;
/



prompt ...trigger wwv_flow_plugin_events_t1

create or replace trigger wwv_flow_plugin_events_t1
    before insert or update or delete on wwv_flow_plugin_events
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        :new.name := lower(:new.name);
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
            update wwv_flow_plugins
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.plugin_id, :old.plugin_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/


prompt ...trigger wwv_flow_plugin_settings_t1

create or replace trigger wwv_flow_plugin_settings_t1
    before insert or update or delete on wwv_flow_plugin_settings
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where plugin_setting_id  = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/


prompt ...trigger wwv_flow_da_stnd_events_t1

create or replace trigger wwv_flow_da_stnd_events_t1
    before insert or update on wwv_flow_standard_events
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/



prompt ...trigger wwv_flow_page_da_events_t1

create or replace trigger wwv_flow_page_da_events_t1
    before insert or update or delete on wwv_flow_page_da_events
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
            update wwv_flow_steps
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.page_id, :old.page_id )
               and flow_id           = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_page_da_actions_t1

create or replace trigger wwv_flow_page_da_actions_t1
    before insert or update or delete on wwv_flow_page_da_actions
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
            -- for the wwv_flow_page_da_actions table
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_page_da_events
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.event_id, :old.event_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_feedback_t1

create or replace trigger  wwv_flow_feedback_t1
before insert or update on wwv_flow_feedback
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        if nvl(:new.APPLICATION_ID,0) >= 4000 and nvl(:new.application_id,0) <= 4999 then
           :new.security_group_id := 10;
        else
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;

    if :new.logging_security_group_id is null then
       :new.logging_security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;

    if :new.logged_by_workspace_name is null then
       for c1 in (select short_name from WWV_FLOW_COMPANIES where PROVISIONING_COMPANY_ID = :new.logging_security_group_id) loop
           :new.logged_by_workspace_name := c1.short_name;
       end loop;
    end if;

    if :new.feedback_status is null then
        :new.feedback_status := 0;
    end if;

    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_by := wwv_flow.g_user;
            :new.created_on := current_timestamp;
        end if;
       :new.updated_by := wwv_flow.g_user;
       :new.updated_on := current_timestamp;
    end if;

    -- set feedback ID
        if :new.feedback_id is null and inserting then
            select nvl(max(feedback_id),0) + 1 into :new.feedback_id
            from wwv_flow_feedback
            where security_group_id = :new.security_group_id;
        end if;
        --
        -- TAG
        --
        wwv_flow_utilities.wwv_flow_team_tag_sync (
               p_component_type    => 'FEEDBACK',
               p_component_id      => :new.id,
               p_new_tags          => rtrim(trim(:new.TAGS),','),
               p_security_group_id => :new.security_group_id);

end wwv_flow_feedback_t1;
/
show errors
ALTER TRIGGER  wwv_flow_feedback_T1 ENABLE
/

prompt ...trigger wwv_flow_feedback_t2

create or replace trigger wwv_flow_feedback_t2
after delete on wwv_flow_feedback
for each row
begin
    if wwv_flow.g_workspace_delete_in_progress = FALSE then
              delete from wwv_flow_team_tags where component_id = :old.id;
          end if;
end wwv_flow_feedback_t2;
/

prompt ...trigger wwv_flow_feedback_fup_t1

create or replace trigger  wwv_flow_feedback_fup_t1
before insert or update on wwv_flow_feedback_followup
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    if inserting and not wwv_flow.g_import_in_progress then
       :new.created_by := coalesce(:new.created_by, wwv_flow.g_user, user);
       :new.created_on := coalesce(:new.created_on, current_timestamp);
       :new.updated_by := coalesce(:new.updated_by, wwv_flow.g_user, user);
       :new.updated_on := coalesce(:new.updated_on, current_timestamp);
    elsif updating and not wwv_flow.g_import_in_progress then
       :new.updated_by := coalesce(wwv_flow.g_user, user);
       :new.updated_on := current_timestamp;
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_feedback
               set updated_on = current_timestamp,
                   updated_by = coalesce(wwv_flow.g_user, user)
             where id = coalesce( :new.feedback_id, :old.feedback_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end wwv_flow_feedback_fup_t1;
/
show errors
ALTER TRIGGER  wwv_flow_feedback_fup_T1 ENABLE
/

prompt ...trigger wwv_flow_team_tags_t1

create or replace trigger  wwv_flow_team_tags_t1
before insert or update on wwv_flow_team_tags
for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.tag := upper(:new.tag);
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end wwv_flow_team_tags_t1;
/
ALTER TRIGGER wwv_flow_team_tags_t1 ENABLE
/

prompt ...trigger wwv_flow_gallery_installs_t1

create or replace trigger wwv_flow_gallery_installs_t1
    before insert or update on wwv_flow_gallery_installs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- audit
    if inserting then
        :new.created_by := coalesce(:new.created_by, wwv_flow.g_user, user);
        :new.created_on := coalesce(:new.created_on, sysdate);
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
end;
/

prompt ...trigger wwv_purge_workspaces_trg1

create or replace trigger wwv_purge_workspaces_trg1
    before insert or update on wwv_purge_workspaces
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        end if;
        --
        if :new.status is null then
            :new.status := 'NEW';
        end if;
        --
        :new.created_ts := systimestamp;
        :new.updated_ts := :new.created_ts;
    else
        :new.updated_ts := systimestamp;
    end if;

end;
/

prompt ...trigger wwv_purge_log_trg1

create or replace trigger wwv_purge_log_trg1
    before insert on wwv_purge_log
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/

prompt ...trigger wwv_purge_emails_trg1

create or replace trigger wwv_purge_emails_trg1
    before insert on wwv_purge_emails
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/

prompt ...trigger wwv_purge_workspace_resp_trg1

create or replace trigger wwv_purge_workspace_resp_trg1
    before insert on wwv_purge_workspace_responses
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
end;
/

prompt ...trigger wwv_purge_datafiles_trg1

create or replace trigger wwv_purge_datafiles_trg1
    before insert on wwv_purge_datafiles
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
    if :new.status is null then
        :new.status := 'NOT_EVAL';
    end if;
end;
/

prompt ...trigger wwv_purge_schemas_trg1

create or replace trigger wwv_purge_schemas_trg1
    before insert on wwv_purge_schemas
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.created_ts := systimestamp;
    if :new.status is null then
        :new.status := 'NOT_EVAL';
    end if;
end;
/


prompt ...trigger wwv_flow_authorized_urls_t1

create or replace trigger wwv_flow_authorized_urls_t1
    before insert or update on wwv_flow_authorized_urls
    for each row
begin
    -- normalize the case of the entire URL
    :new.url := trim(lower(:new.url));
    if :new.url is not null then
        :new.url_hash := wwv_flow_crypto.hash_raw (
                             p_src      => :new.url,
                             p_function => wwv_flow_crypto.c_hash_sh256 );
    end if;

    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    if inserting then
        :new.created_on := sysdate;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.last_updated_on := :new.created_on;
    end if;

    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;

    --
    -- last updated
    --
    if updating then
        :new.last_updated_on := sysdate;
    end if;
    :new.last_updated_by := nvl(wwv_flow.g_user,user);
end;
/

prompt ...trigger wwv_flow_load_tables_t1

create or replace trigger wwv_flow_load_tables_t1
    before insert or update or delete on wwv_flow_load_tables
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
        -- static id
        if     not wwv_flow.g_import_in_progress
           and :new.data_profile_id is not null
           and inserting or ( updating and nvl( :old.static_id, chr( 1 ) ) != nvl( :new.static_id, chr( 1 ) ) )
        then
            :new.static_id := regexp_replace(
                                  srcstr     => coalesce( :new.static_id, lower( :new.name ) ),
                                  pattern    => '[^' || wwv_flow_utilities.c_alnum || ']+',
                                  replacestr => '_' );

            if inserting and :new.static_id = '_' then
                 :new.static_id := 'C' || :new.id;
            end if;
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where load_table_id      = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/

prompt ...trigger wwv_flow_loadtab_lookups_t1

create or replace trigger wwv_flow_loadtab_lookups_t1
    before insert or update or delete on wwv_flow_load_table_lookups
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
            update wwv_flow_load_tables
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.load_table_id, :old.load_table_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_loadtab_rules_t1

create or replace trigger wwv_flow_loadtab_rules_t1
    before insert or update or delete on wwv_flow_load_table_rules
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
            update wwv_flow_load_tables
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.load_table_id, :old.load_table_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ...trigger wwv_flow_auto_file_del_log_t1

create or replace trigger wwv_flow_auto_file_del_log_t1
    before insert on wwv_flow_auto_file_delete_log
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    :new.deleted_on := sysdate;
end;
/

prompt ... trigger wwv_flow_pses_t1

create or replace trigger wwv_flow_pses_t1
before insert or update on wwv_flow_pses
for each row
begin
    if :new.id is null then
        select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') into :new.id from sys.dual;
    end if;
    if :new.installed_on is null then
        :new.installed_on := sysdate;
    end if;
    if :new.is_bundle_patch is null then
        :new.is_bundle_patch := 'Y';
    end if;
end;
/

prompt ... trigger wwv_flow_task_defs_t1
create or replace trigger wwv_flow_task_defs_t1
    before insert or update or delete on wwv_flow_task_defs
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
        --
        -- Enable Task Expiration Job in case where Task Definition is added
        -- with a non-NULL due on type
        --
        if :new.due_on_type is not null then
            wwv_flow_upgrade.enable_internal_jobs( p_job_type => wwv_flow_upgrade.c_job_type_task_exp );
        end if;
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ... trigger wwv_flow_task_def_params_t1
create or replace trigger wwv_flow_task_def_params_t1
    before insert or update or delete on wwv_flow_task_def_params
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

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
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_task_defs
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.task_def_id, :old.task_def_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/

prompt ... trigger wwv_flow_task_def_actions_t1
create or replace trigger wwv_flow_task_def_actions_t1
    before insert or update or delete on wwv_flow_task_def_actions
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
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
    if not wwv_flow.g_import_in_progress then
       -- cascade to parent. Ignore mutating table error which is raised
       -- if the parent is deleted too.
       begin
           update wwv_flow_task_defs
              set last_updated_on       = sysdate,
                  last_updated_by       = wwv_flow.g_user
            where id                    = coalesce( :new.task_def_id, :old.task_def_id )
              and security_group_id     = coalesce( :new.security_group_id, :old.security_group_id );
       exception when wwv_flow_error.e_mutating_table then null;
       end;
    end if;
end;
/

prompt ... trigger wwv_flow_task_def_c_params_t1
create or replace trigger wwv_flow_task_def_c_params_t1
    before insert or update or delete on wwv_flow_task_def_comp_params
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
        if coalesce( :new.page_process_id, :old.page_process_id ) is not null then
            begin
                update wwv_flow_step_processing
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where id                = coalesce( :new.page_process_id, :old.page_process_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        else if coalesce( :new.app_process_id, :old.app_process_id ) is not null then
             begin
                 update wwv_flow_processing
                    set last_updated_on       = sysdate,
                        last_updated_by       = wwv_flow.g_user
                  where id                = coalesce( :new.app_process_id, :old.app_process_id )
                    and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
             exception when wwv_flow_error.e_mutating_table then null;
             end;
            end if;
        end if;
    end if;
end;
/

prompt ... trigger wwv_flow_task_def_particips_t1
create or replace trigger wwv_flow_task_def_particips_t1
    before insert or update or delete on wwv_flow_task_def_participants
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

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
    if not wwv_flow.g_import_in_progress then
       -- cascade to parent. Ignore mutating table error which is raised
       -- if the parent is deleted too.
       begin
           update wwv_flow_task_defs
              set last_updated_on       = sysdate,
                  last_updated_by       = wwv_flow.g_user
            where id                    = coalesce( :new.task_def_id, :old.task_def_id )
              and security_group_id     = coalesce( :new.security_group_id, :old.security_group_id );
       exception when wwv_flow_error.e_mutating_table then null;
       end;
    end if;
end;
/

prompt ... trigger wwv_flow_tasks$_t1
create or replace trigger wwv_flow_tasks$_t1
    before insert or update or delete on wwv_flow_tasks$
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
        if inserting and not wwv_flow.g_import_in_progress then
                :new.created_on := systimestamp;
                :new.created_by := wwv_flow.g_user;
        end if;
        --
        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := systimestamp;
            :new.last_updated_by := wwv_flow.g_user;
        end if;

        wwv_flow_upgrade.enable_internal_jobs( p_job_type => wwv_flow_upgrade.c_job_type_task_purge );

    end if;
end;
/
show errors

prompt ...trigger wwv_flow_search_configs_t1

create or replace trigger wwv_flow_search_config_t1
    before insert or update or delete on wwv_flow_search_configs
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

        -- static id
        if     not wwv_flow.g_import_in_progress
           and inserting or ( updating and nvl( :old.static_id, chr( 1 ) ) != nvl( :new.static_id, chr( 1 ) ) )
        then
            :new.static_id := regexp_replace(
                                  srcstr     => coalesce( :new.static_id, lower( :new.label ) ),
                                  pattern    => '[^' || wwv_flow_utilities.c_alnum || ']+',
                                  replacestr => '_' );

            if :new.static_id = '_' then
                :new.static_id := 'C' || :new.id;
            end if;
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
        -- Compile templates
        if :new.default_row_html_expr is not null then

            if :old.default_row_html_expr is null or :new.default_row_html_expr != :old.default_row_html_expr then
                :new.default_row_html_expr_compiled := wwv_flow_template_directive.compile_to_json(
                    p_template          => :new.default_row_html_expr,
                    p_placeholders_only => false );
            end if;

        else

            :new.default_row_html_expr_compiled := null;

        end if;

    end if;

    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where search_config_id   = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/
show err

prompt ...trigger wwv_flow_srch_region_srcs_t1

create or replace trigger wwv_flow_srch_region_srcs_t1
    before insert or update or delete on wwv_flow_search_region_sources
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
            update wwv_flow_page_plugs
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.search_region_id, :old.search_region_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show err

prompt ... trigger wwv_flow_workflows_t1
create or replace trigger wwv_flow_workflows_t1
    before insert or update or delete on wwv_flow_workflows
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
        wwv_flow_upgrade.enable_internal_jobs( p_job_type => wwv_flow_upgrade.c_job_type_wf_purge );
        --
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflow_versions_t1
create or replace trigger wwv_flow_workflow_versions_t1
    before insert or update or delete on wwv_flow_workflow_versions
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
        --
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_workflows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                    = coalesce( :new.workflow_id, :old.workflow_id )
               and security_group_id     = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflow_acts_t1
create or replace trigger wwv_flow_workflow_acts_t1
    before insert or update or delete on wwv_flow_workflow_activities
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
        --
        -- Enable WF Activities Time Out Job in case where Activity is added
        -- with a non-NULL due on type
        --
        if :new.due_on_type is not null or :new.activity_type = 'NATIVE_WORKFLOW_WAIT' then
            wwv_flow_upgrade.enable_internal_jobs( p_job_type => wwv_flow_upgrade.c_job_type_wf_timeout );
        end if;
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_workflow_versions
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                    = coalesce( :new.workflow_version_id, :old.workflow_version_id )
               and security_group_id     = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflow_trans_t1
create or replace trigger wwv_flow_workflow_trans_t1
    before insert or update or delete on wwv_flow_workflow_transitions
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
        --
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_workflow_activities
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                    = coalesce( :new.from_activity_id, :old.from_activity_id )
               and security_group_id     = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflow_vars_t1
create or replace trigger wwv_flow_workflow_vars_t1
    before insert or update or delete on wwv_flow_workflow_variables
    for each row
declare
    l_required_value_type   wwv_flow_workflow_comp_params.value_type%type;
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        if not wwv_flow.g_import_in_progress and not wwv_flow_workflow.g_copy_in_progress then
            -- create new page process comp params when
            -- 1) a new parameter is added with direction IN or IN_OUT
            -- 2) an existing parameter direction is changed from OUT
            --    to IN or IN_OUT
            if inserting or (:new.direction in ('IN','IN_OUT') and :old.direction = 'OUT')
            then
                -- create page process comp params
                -- comp params for invoke workflow are automatically
                -- handled by the workflow designer and are not handled
                -- here
                if :new.direction in ('IN','IN_OUT') then
                    insert into wwv_flow_workflow_comp_params (
                        flow_id,
                        page_id,
                        page_process_id,
                        workflow_variable_id,
                        value_type,
                        ignore_output)
                    select
                        :new.flow_id,
                        flow_step_id,
                        id,
                        :new.id,
                        case when :new.is_required = 'N' then 'NULL'
                             when :new.value is not null then 'DEFAULT'
                             else 'ITEM'
                        end,
                        case when :new.direction = 'IN_OUT' then 'Y'
                        end
                    from wwv_flow_step_processing
                   where workflow_id       = :new.workflow_id
                     and flow_id           = :new.flow_id
                     and security_group_id = :new.security_group_id;
                end if;
            -- handle the page process workflow component parameters
            -- for direction change or is_required change
            elsif (updating
                    and (:new.direction !='VARIABLE'
                        and (:new.direction != :old.direction
                            or :new.is_required != :old.is_required)))
            then
                -- if direction is changed to OUT, page process comp parameters
                -- should be deleted
                if :new.direction = 'OUT' then
                    delete from wwv_flow_workflow_comp_params
                     where workflow_variable_id  = :new.id
                       and page_process_id       is not null
                       and page_id               is not null
                       and flow_id               = :new.flow_id
                       and security_group_id     = :new.security_group_id;
                -- if direction is changed to IN or IN_OUT then
                -- value_type should be adjusted
                elsif :new.direction in ('IN','IN_OUT') then
                    l_required_value_type   :=  case when :new.value is not null then
                                                    'DEFAULT'
                                                else
                                                    'ITEM'
                                                end;
                    update wwv_flow_workflow_comp_params
                    --set value_type based on direction and is_required properties
                       set value_type = case
                                            when :new.is_required = 'Y' and value_type = 'NULL'
                                            then
                                                l_required_value_type
                                            else
                                                value_type
                                            end,
                        -- set ignore_output based on direction
                        ignore_output = case
                                            when :new.direction = 'IN' then null
                                            else nvl( ignore_output, 'Y' )
                                        end
                     where  workflow_variable_id = :new.id
                       and  page_process_id      is not null
                       and  page_id              is not null
                       and  flow_id              = :new.flow_id
                       and  security_group_id    = :new.security_group_id;
                end if;
            end if;
        end if;
        --
        if not wwv_flow.g_import_in_progress then
            -- auto populate audit columns
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.

            -- for workflow parameters
            if coalesce( :new.workflow_id, :old.workflow_id) is not null then
                begin
                update wwv_flow_workflows
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                    = coalesce( :new.workflow_id, :old.workflow_id)
                   and security_group_id     = coalesce( :new.security_group_id, :old.security_group_id );

                exception when wwv_flow_error.e_mutating_table then null;
                end;
            -- for workflow variables
            elsif coalesce( :new.workflow_version_id, :old.workflow_version_id) is not null then
                begin
                update wwv_flow_workflow_versions
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                    = coalesce( :new.workflow_version_id, :old.workflow_version_id)
                   and security_group_id     = coalesce( :new.security_group_id, :old.security_group_id );

                exception when wwv_flow_error.e_mutating_table then null;
                end;
            -- for workflow activity variables
            elsif coalesce( :new.activity_id, :old.activity_id) is not null then
                begin
                update wwv_flow_workflow_activities
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                    = coalesce( :new.activity_id, :old.activity_id)
                   and security_group_id     = coalesce( :new.security_group_id, :old.security_group_id );

                exception when wwv_flow_error.e_mutating_table then null;
                end;
            end if;

    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflow_cparams_t1
create or replace trigger wwv_flow_workflow_cparams_t1
    before insert or update or delete on wwv_flow_workflow_comp_params
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
        --
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        if coalesce( :new.page_process_id, :old.page_process_id ) is not null then
            begin
                update wwv_flow_step_processing
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where id                = coalesce( :new.page_process_id, :old.page_process_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        elsif coalesce( :new.app_process_id, :old.app_process_id ) is not null then
             begin
                 update wwv_flow_processing
                    set last_updated_on       = sysdate,
                        last_updated_by       = wwv_flow.g_user
                  where id                = coalesce( :new.app_process_id, :old.app_process_id )
                    and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
             exception when wwv_flow_error.e_mutating_table then null;
             end;
        elsif coalesce( :new.automation_action_id, :old.automation_action_id ) is not null then
            begin
                update wwv_flow_automation_actions
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.automation_action_id, :old.automation_action_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        elsif coalesce( :new.task_def_action_id, :old.task_def_action_id ) is not null then
            begin
                update wwv_flow_task_def_actions
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.task_def_action_id, :old.task_def_action_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        elsif coalesce( :new.workflow_activity_id, :old.workflow_activity_id ) is not null then
            begin
                update wwv_flow_workflow_activities
                   set last_updated_on       = sysdate,
                       last_updated_by       = wwv_flow.g_user
                 where id                = coalesce( :new.workflow_activity_id, :old.workflow_activity_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            exception when wwv_flow_error.e_mutating_table then null;
            end;

        end if;
    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflow_parts_t1
create or replace trigger wwv_flow_workflow_parts_t1
    before insert or update or delete on wwv_flow_workflow_participants
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        if :new.security_group_id is null then
           :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;

        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := sysdate;
                :new.created_by := wwv_flow.g_user;
            end if;
            --
            :new.last_updated_on := sysdate;
            :new.last_updated_by := wwv_flow.g_user;
        end if;
        --
    end if;

    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flow_workflow_versions
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user
             where id                = coalesce( :new.workflow_version_id, :old.workflow_version_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflows$_t1
create or replace trigger wwv_flow_workflows$_t1
    before insert or update or delete on wwv_flow_workflows$
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
        --
        if not wwv_flow.g_import_in_progress then
            :new.last_updated_on := systimestamp;
            :new.last_updated_by := wwv_flow.g_user;
        end if;

    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflow_acts$_t1
create or replace trigger wwv_flow_workflow_acts$_t1
    before insert or update or delete on wwv_flow_workflow_activities$
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

        if inserting and not wwv_flow.g_import_in_progress then
                :new.start_time := systimestamp;
        end if;
        --

    end if;
end;
/
show errors


prompt ... trigger wwv_flow_workflow_vars$_t1
create or replace trigger wwv_flow_workflow_vars$_t1
    before insert or update or delete on wwv_flow_workflow_variables$
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
    end if;
end;
/
show errors

prompt ... trigger wwv_flow_workflow_part$_t1
create or replace trigger wwv_flow_workflow_part$_t1
    before insert or update or delete on wwv_flow_workflow_participant$
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
    end if;
end;
/
show errors

prompt ... trigger wwv_flow_wf_audit_log$_t1
create or replace trigger wwv_flow_workflow_aud_log$_t1
    before insert or update or delete on wwv_flow_workflow_audit_log$
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
        if not wwv_flow.g_import_in_progress then
            if inserting then
                :new.created_on := systimestamp;
                if :new.created_by is null then
                    :new.created_by := wwv_flow.g_user;
                end if;
            end if;
            --
            :new.last_updated_on := systimestamp;
            if :new.last_updated_by is null then
                :new.last_updated_by := wwv_flow.g_user;
            end if;
        end if;

    end if;
end;
/
show errors

prompt ...trigger wwv_flow_component_actions_t1

create or replace trigger wwv_flow_component_actions_t1
    before insert or update or delete on wwv_flow_component_actions
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
            if coalesce( :new.region_id, :old.region_id ) is not null then
                update wwv_flow_page_plugs
                   set last_updated_on   = sysdate,
                       last_updated_by   = wwv_flow.g_user
                 where id                = coalesce( :new.region_id, :old.region_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            end if;
            if coalesce( :new.ir_column_id, :old.ir_column_id ) is not null then
                update wwv_flow_worksheet_columns
                   set updated_on        = sysdate,
                       updated_by        = wwv_flow.g_user
                 where id                = coalesce( :new.ir_column_id, :old.ir_column_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            end if;
            if coalesce( :new.region_column_id, :old.region_column_id ) is not null then
                update wwv_flow_region_columns
                   set last_updated_on   = sysdate,
                       last_updated_by   = wwv_flow.g_user
                 where id                = coalesce( :new.region_column_id, :old.region_column_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            end if;
            if coalesce( :new.page_item_id, :old.page_item_id ) is not null then
                update wwv_flow_step_items
                   set last_updated_on   = sysdate,
                       last_updated_by   = wwv_flow.g_user
                 where id                = coalesce( :new.page_item_id, :old.page_item_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            end if;
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show err


prompt ...trigger wwv_flow_comp_menu_entries_t1

create or replace trigger wwv_flow_comp_menu_entries_t1
    before insert or update or delete on wwv_flow_comp_menu_entries
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
            if coalesce( :new.component_action_id, :old.component_action_id ) is not null then
                update wwv_flow_component_actions
                   set last_updated_on   = sysdate,
                       last_updated_by   = wwv_flow.g_user
                 where id                = coalesce( :new.component_action_id, :old.component_action_id )
                   and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
            end if;
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show err

prompt ...trigger wwv_flow_event_types_biu

create or replace trigger wwv_flow_event_types_biu
before insert on wwv_flow_event_types
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end;
/
show errors

prompt ...trigger wwv_database_error_types_t1

create or replace trigger wwv_database_error_types_t1
    before insert or update on wwv_database_error_types
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

end;
/
show errors

prompt ...trigger wwv_flow_prov_email_pattern_t1
create or replace trigger wwv_flow_prov_email_pattern_t1
    before insert or update on wwv_flow_prov_email_patterns
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    --
    -- audit
    --
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/
show err

prompt ...trigger wwv_flow_map_backgrounds_t1
create or replace trigger wwv_flow_map_backgrounds_t1
    before insert or update or delete on wwv_flow_map_backgrounds
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;

    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
        --
        -- cascade change to wwv_flow_comp_grp_components
        --
        if updating then
            begin
                update wwv_flow_comp_grp_components
                   set last_updated_on = sysdate,
                       last_updated_by = wwv_flow.g_user
                 where map_background_id  = coalesce( :new.id, :old.id )
                   and flow_id            = coalesce( :new.flow_id, :old.flow_id )
                   and security_group_id  = wwv_flow_security.g_security_group_id;
            exception when wwv_flow_error.e_mutating_table then null;
            end;
        end if;
    end if;
end;
/
show err

prompt ...trigger wwv_flow_component_groups_t1
create or replace trigger wwv_flow_component_groups_t1
    before insert or update or delete on wwv_flow_component_groups
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
        -- populate version_scn for the master components
        if ( not wwv_flow.g_import_in_progress or :new.version_scn is null ) and :new.reference_id is null then
            :new.version_scn := sys.dbms_flashback.get_system_change_number;
        end if;
    end if;
    --
    if not wwv_flow.g_import_in_progress then
        -- cascade to parent. Ignore mutating table error which is raised
        -- if the parent is deleted too.
        begin
            update wwv_flows
               set last_updated_on       = sysdate,
                   last_updated_by       = wwv_flow.g_user,
                   shared_components_scn = sys.dbms_flashback.get_system_change_number
             where id                = coalesce( :new.flow_id, :old.flow_id )
               and security_group_id = coalesce( :new.security_group_id, :old.security_group_id );
        exception when wwv_flow_error.e_mutating_table then null;
        end;
    end if;
end;
/
show err

prompt ...trigger wwv_flow_grp_comp_t1
create or replace trigger wwv_flow_grp_comp_t1
    before insert or update or delete on wwv_flow_comp_grp_components
    for each row
begin
    if inserting or updating then
        if inserting and :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;

        -- auto set flow_id from wwv_flow_component_groups
        for c1 in ( select flow_id
                      from wwv_flow_component_groups
                     where id                = :new.component_group_id
                       and security_group_id = wwv_flow_security.g_security_group_id ) loop
            :new.flow_id := c1.flow_id;
            exit;
        end loop;

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
            update wwv_flow_component_groups
               set last_updated_on = sysdate,
                   last_updated_by = wwv_flow.g_user
             where id                = coalesce( :new.component_group_id, :old.component_group_id )
               and security_group_id = coalesce( :new.security_group_id , :old.security_group_id );
        exception
            when wwv_flow_error.e_mutating_table then
               null;
        end;
    end if;
end;
/
show err

prompt ...done create triggers
