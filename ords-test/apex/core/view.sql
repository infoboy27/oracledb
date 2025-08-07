set define '^' verify off
prompt ...create flow views

Rem  Copyright (c) 2002, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      view.sql
Rem
Rem    DESCRIPTION
Rem      Create flow views
Rem
Rem    NOTES
Rem      Tables that describe a given flow.  Every attribute relates
Rem      back to the ID column of the WWV_FLOWS table.
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    tmuth       12/02/2002 - Created

col APPUN new_val APPUN
set termout off
select sys_context('userenv','current_schema') APPUN from sys.dual;
set termout on

--==============================================================================
-- view that provides a single row with the current workspace id and prevents
-- locking (table(...) can not be locked).
--==============================================================================
prompt ...wwv_flow_current_sgid view
create or replace view wwv_flow_current_sgid as
select nullif(wwv_flow.get_sgid,0)                       security_group_id,
       cu,
       nls_sort,
       (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) has_apex_admin_read_role_yn
  from ( select /*+ no_merge cardinality(t 1) */
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from sys.dual t ) d
/
--==============================================================================
-- view that provides rows for all workspaces that are available to the current
-- user and which can not be locked.
--==============================================================================
prompt ...wwv_companies_auth_restricted view
create or replace view wwv_companies_auth_restricted as
select w.provisioning_company_id  workspace_id,
       w.short_name               workspace,
       w.short_name               workspace_name,
       w.display_name             workspace_display_name,
       w.first_schema_provisioned
  from wwv_flow_companies w,
       ( select /*+ no_merge cardinality(t 1) */
                nullif(wwv_flow.get_sgid,0)           security_group_id,
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from sys.dual t ) d
 where (   d.security_group_id = w.provisioning_company_id
        or (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) = 'Y'
        or w.provisioning_company_id     in ( select security_group_id
                                                from wwv_flow_company_schemas s
                                               where s.schema = d.cu
                                                 and (   d.nls_sort = 'BINARY'
                                                      or nlssort(s.schema,'NLS_SORT=BINARY')=nlssort(d.cu,'NLS_SORT=BINARY'))))
   and w.provisioning_company_id <> 0
/
--==============================================================================
-- alternative view to wwv_companies_auth_restricted which includes workspace 0.
--==============================================================================
prompt ...wwv_companies_auth_restricted0 view
create or replace view wwv_companies_auth_restricted0 as
select w.provisioning_company_id  workspace_id,
       w.short_name               workspace,
       w.short_name               workspace_name,
       w.display_name             workspace_display_name,
       w.first_schema_provisioned
  from wwv_flow_companies w,
       ( select /*+ no_merge cardinality(t 1) */
                nullif(wwv_flow.get_sgid,0)           security_group_id,
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from sys.dual t ) d
 where (   d.security_group_id = w.provisioning_company_id
        or (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) = 'Y'
        or w.provisioning_company_id     in ( select security_group_id
                                                from wwv_flow_company_schemas s
                                               where s.schema = d.cu
                                                 and (   d.nls_sort = 'BINARY'
                                                      or nlssort(s.schema,'NLS_SORT=BINARY')=nlssort(d.cu,'NLS_SORT=BINARY'))))
/
--==================================================================================
-- alternative view to wwv_companies_auth_extension which includes extension access.
--==================================================================================
prompt ...wwv_companies_auth_extension view
create or replace view wwv_companies_auth_extension as
select w.provisioning_company_id  workspace_id,
       d.builder_sgid             extension_workspace_id,
       w.short_name               workspace,
       w.short_name               workspace_name,
       w.display_name             workspace_display_name,
       w.first_schema_provisioned
  from wwv_flow_companies w,
       ( select /*+ no_merge cardinality(t 1) */
                nullif(coalesce(wwv_flow_session.get_builder_security_group_id,wwv_flow.get_sgid),0) security_group_id,
                nullif(wwv_flow_session.get_builder_security_group_id,0) builder_sgid,
                sys_context('userenv','current_user')                    cu,
                sys_context('userenv','nls_sort')                        nls_sort
           from sys.dual t ) d
 where (   d.security_group_id = w.provisioning_company_id
        --or d.builder_sgid      = w.provisioning_company_id
        or (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) = 'Y'
        or (    w.provisioning_company_id     in ( select security_group_id
                                                    from wwv_flow_company_schemas s
                                                   where s.schema = d.cu
                                                     and (   d.nls_sort = 'BINARY'
                                                          or nlssort(s.schema,'NLS_SORT=BINARY')=nlssort(d.cu,'NLS_SORT=BINARY'))))
            and d.builder_sgid is null
            )
   and w.provisioning_company_id <> 0
/
--==============================================================================
-- Alternative version that allows DML on the main view. Note that predicate
-- pushdown does not automatically work on this view. The outer query can use
-- the push_pred hint, though.
--==============================================================================
prompt ...wwv_companies_auth_for_dml view
create or replace view wwv_companies_auth_for_dml as
select w.provisioning_company_id  workspace_id,
       w.short_name               workspace,
       w.short_name               workspace_name,
       w.display_name             workspace_display_name,
       w.first_schema_provisioned
  from wwv_flow_companies w,
       ( select /*+ no_merge cardinality(t 1) */
                nullif(wwv_flow.get_sgid,0)           security_group_id,
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from table(^APPUN..wwv_flow_t_varchar2('X')) t ) d
 where (   d.security_group_id = w.provisioning_company_id
        or (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) = 'Y'
        or w.provisioning_company_id     in ( select security_group_id
                                                from wwv_flow_company_schemas s
                                               where s.schema = d.cu
                                                 and (   d.nls_sort = 'BINARY'
                                                      or nlssort(s.schema,'NLS_SORT=BINARY')=nlssort(d.cu,'NLS_SORT=BINARY'))))
   and w.provisioning_company_id <> 0
/

--==============================================================================
prompt ...wwv_flow_current_sgid_for_dml view
create or replace view wwv_flow_current_sgid_for_dml as
select nullif(wwv_flow.get_sgid,0)                       security_group_id,
       cu,
       nls_sort,
       (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) has_apex_admin_read_role_yn
  from ( select /*+ no_merge cardinality(t 1) */
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from table(^APPUN..wwv_flow_t_varchar2('X')) t ) d
/

--==============================================================================
-- same as wwv_flow_current_sgid, but extension workspace aware
--==============================================================================
prompt ...wwv_flow_current_sgid_ext view
create or replace view wwv_flow_current_sgid_ext as
select nullif(coalesce(wwv_flow_session.get_builder_security_group_id,wwv_flow.get_sgid),0) security_group_id,
       cu,
       nls_sort,
       (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) has_apex_admin_read_role_yn
  from ( select /*+ no_merge cardinality(t 1) */
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from sys.dual t ) d
/

--==============================================================================
prompt ...wwv_flow_activity_log view
create or replace view wwv_flow_activity_log as
    select * from wwv_flow_activity_log1$ union all
    select * from wwv_flow_activity_log2$
/

--==============================================================================
prompt ...wwv_flow_automation_log view
create or replace view wwv_flow_automation_log as
    select * from wwv_flow_automation_log1$ union all
    select * from wwv_flow_automation_log2$
/

--==============================================================================
prompt ...wwv_flow_automation_msg_log view
create or replace view wwv_flow_automation_msg_log as
    select * from wwv_flow_automation_msg_log1$ union all
    select * from wwv_flow_automation_msg_log2$
/

--==============================================================================
prompt ...wwv_flow_webservice_log view
create or replace view wwv_flow_webservice_log as
    select * from wwv_flow_webservice_log1$ union all
    select * from wwv_flow_webservice_log2$
/

--==============================================================================
prompt ...wwv_flow_websource_sync_log view
create or replace view wwv_flow_websource_sync_log as
    select * from wwv_flow_websource_sync_log1$ union all
    select * from wwv_flow_websource_sync_log2$
/

--==============================================================================
prompt ...wwv_flow_user_activity_log view
create or replace view wwv_flow_user_activity_log as
    select time_stamp,
           null component_type,
           null component_name,
           ( select upper(name)
               from wwv_flow_steps
              where id = a.step_id
                and flow_id = a.flow_id ) component_attribute,
           null information,
           elap,
           num_rows,
           userid,
           lower(userid) userid_lc,
           ip_address,
           user_agent,
           flow_id,
           step_id,
           session_id,
           sqlerrm,
           sqlerrm_component_type,
           sqlerrm_component_name,
           page_mode,
           null application_info,
           worksheet_id,
           ir_search,
           ir_report_id,
           content_length
      from wwv_flow_current_sgid sgid,
           wwv_flow_activity_log a
     where a.security_group_id = sgid.security_group_id
/
comment on table wwv_flow_user_activity_log is 'All developer and application run-time activity';
comment on column wwv_flow_user_activity_log.time_stamp is 'Date and time that activity was logged at the end of the page view.';
comment on column wwv_flow_user_activity_log.component_type is 'Reserved for future use.';
comment on column wwv_flow_user_activity_log.component_name is 'Reserved for future use.';
comment on column wwv_flow_user_activity_log.component_attribute is 'Title of page.';
comment on column wwv_flow_user_activity_log.information is 'Reserved for future use.';
comment on column wwv_flow_user_activity_log.elap is 'Elapsed time of page view in seconds.';
comment on column wwv_flow_user_activity_log.num_rows is 'Number of rows processed on page.';
comment on column wwv_flow_user_activity_log.userid is 'User ID performing page view.';
comment on column wwv_flow_user_activity_log.userid_lc is 'User ID performing page view, in lower case.';
comment on column wwv_flow_user_activity_log.ip_address is 'IP address of client.';
comment on column wwv_flow_user_activity_log.ir_report_id is 'Interactive report ID';
comment on column wwv_flow_user_activity_log.ir_search is 'Interactive report search criteria entered by users.';
comment on column wwv_flow_user_activity_log.user_agent is 'Web browser user agent of client.';
comment on column wwv_flow_user_activity_log.flow_id is 'Application ID.';
comment on column wwv_flow_user_activity_log.step_id is 'Page number.';
comment on column wwv_flow_user_activity_log.session_id is 'Oracle APEX session identifier.';
comment on column wwv_flow_user_activity_log.sqlerrm is 'SQL Error message.';
comment on column wwv_flow_user_activity_log.sqlerrm_component_type is 'Reserved for future use.';
comment on column wwv_flow_user_activity_log.sqlerrm_component_name is 'Reserved for future use.';


--==============================================================================
prompt ...wwv_flow_user_access_log_v view
create or replace view wwv_flow_user_access_log_v as
    select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text, security_group_id
      from wwv_flow_user_access_log1$
    union all
    select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text, security_group_id
      from wwv_flow_user_access_log2$
/

--==============================================================================
prompt ...wwv_flow_user_access_log view
create or replace view wwv_flow_user_access_log as
    select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text
      from wwv_flow_current_sgid sgid,
           wwv_flow_user_access_log_v a
     where a.security_group_id = sgid.security_group_id
/
comment on table wwv_flow_user_access_log is 'Login log for the current workspace';

--==============================================================================
prompt ...wwv_flow_user_mail_log view
create or replace view wwv_flow_user_mail_log as
    select mail_id,
       mail_message_id,
       mail_to, mail_from, mail_replyto, mail_subj, mail_cc, mail_bcc, mail_message_created, mail_message_send_begin, mail_message_send_end,
       mail_body_size, mail_body_html_size, mail_attachment_count, mail_attachment_size, mail_send_error, last_updated_on, flow_id app_id,
       a.security_group_id workspace_id,
       w.workspace_name
  from wwv_flow_mail_log             a,
       wwv_companies_auth_restricted w
 where a.security_group_id = w.workspace_id
/
comment on table wwv_flow_user_mail_log is 'Email send log for the current workspace';

--==============================================================================
prompt ...wwv_flow_user_mail_queue view
create or replace view wwv_flow_user_mail_queue
    (id, mail_to, mail_from, mail_replyto, mail_subj, mail_cc, mail_bcc, mail_body, mail_body_html, mail_send_count, mail_send_error, last_updated_by, last_updated_on, mail_message_created, mail_message_created_by, app_id,
     workspace_id,
     workspace_name )
as
select a.id, mail_to, mail_from, mail_replyto, mail_subj, mail_cc, mail_bcc, mail_body, mail_body_html, mail_send_count, mail_send_error, last_updated_by, last_updated_on, mail_message_created, last_updated_by, flow_id,
       a.security_group_id,
       w.workspace_name
  from wwv_flow_mail_queue        a,
       wwv_companies_auth_for_dml w
 where a.security_group_id = w.workspace_id
/
comment on table wwv_flow_user_mail_queue is 'Outgoing email queue for the current workspace';

create or replace trigger wwv_flow_user_mail_queue_iot
instead of delete
on wwv_flow_user_mail_queue
for each row
begin
    delete from wwv_flow_mail_queue
     where id                = :old.id
       and security_group_id = wwv_flow_security.g_security_group_id;
end wwv_flow_user_mail_queue_iot;
/

--==============================================================================
prompt ...wwv_flow_user_mail_attachments view
create or replace view wwv_flow_user_mail_attachments as
select a.id, mail_id, filename, mime_type, inline, content_id, attachment, last_updated_by, last_updated_on,
       a.security_group_id workspace_id,
       w.workspace_name
  from wwv_flow_mail_attachments  a,
       wwv_companies_auth_for_dml w
 where a.security_group_id = w.workspace_id
/
comment on table wwv_flow_user_mail_attachments is 'Attachments of emails in the outgoing email queue for the current workspace';

comment on column wwv_flow_user_mail_attachments.id              is 'Primary key that identifies the attached file';
comment on column wwv_flow_user_mail_attachments.mail_id         is 'Identifier of the mail to which this file is attached';
comment on column wwv_flow_user_mail_attachments.filename        is 'Filename of the attached file';
comment on column wwv_flow_user_mail_attachments.mime_type       is 'Standard media type of the file';
comment on column wwv_flow_user_mail_attachments.inline          is 'Flag indicating whether or not this file should be attached inline';
comment on column wwv_flow_user_mail_attachments.content_id      is 'Identifier by which this file can be referred to in the HTML source of the mail';
comment on column wwv_flow_user_mail_attachments.attachment      is 'Binary data of the attached file';
comment on column wwv_flow_user_mail_attachments.last_updated_by is 'User who last updated this attachment';
comment on column wwv_flow_user_mail_attachments.last_updated_on is 'Date when this attachment was last updated';
comment on column wwv_flow_user_mail_attachments.workspace_id    is 'Oracle APEX Workspace Identifier, unique over all workspaces';
comment on column wwv_flow_user_mail_attachments.workspace_name  is 'Name of the workspace';

create or replace trigger wwv_flow_user_mail_atts_iot
instead of delete
on wwv_flow_user_mail_attachments
for each row
begin
    delete from wwv_flow_mail_attachments
     where id                = :old.id
       and security_group_id = wwv_flow_security.g_security_group_id;
end wwv_flow_user_mail_atts_iot;
/

--==============================================================================
-- View used by the Map Backgrounds feature to display values
--==============================================================================
prompt ...wwv_flow_map_backgrounds_usage
create or replace view wwv_flow_map_backgrounds_usage as
select mb.id,
       p.flow_id,
       p.security_group_id,
       mb.name                         as map_background_name,
       'APEX_APPLICATION_PAGE_REGIONS' as component_type,
       r.plug_name                     as region,
       null                            as page_item,
       p.id                            as page_id,
       p.name                          as page_name,
       null                            as plugin_setting_id
  from wwv_flow_steps p,
       wwv_flow_page_plugs r,
       wwv_flow_map_regions mr,
       wwv_flow_map_backgrounds mb
 where p.flow_id                       = r.flow_id
   and r.flow_id                       = mr.flow_id
   and mr.flow_id                      = mb.flow_id
    --
   and p.security_group_id             = r.security_group_id
   and r.security_group_id             = mr.security_group_id
   and mr.security_group_id            = mb.security_group_id
    --
   and p.id                            = r.page_id
   and p.id                            = mr.page_id
    --
   and r.id                            = mr.region_id
   and mr.default_shared_tilelayer_id  = mb.id
    --
   and r.plug_source_type              = 'NATIVE_MAP_REGION'
union all
select mb.id,
       p.flow_id,
       p.security_group_id,
       mb.name                         as map_background_name,
       'APEX_APPLICATION_PAGE_REGIONS' as component_type,
       r.plug_name                     as region,
       null                            as page_item,
       p.id                            as page_id,
       p.name                          as page_name,
       null                            as plugin_setting_id
  from wwv_flow_steps p,
       wwv_flow_page_plugs r,
       wwv_flow_map_regions mr,
       wwv_flow_map_backgrounds mb
 where p.flow_id                       = r.flow_id
   and r.flow_id                       = mr.flow_id
   and mr.flow_id                      = mb.flow_id
    --
   and p.security_group_id             = r.security_group_id
   and r.security_group_id             = mr.security_group_id
   and mr.security_group_id            = mb.security_group_id
    --
   and p.id                            = r.page_id
   and p.id                            = mr.page_id
    --
   and r.id                            = mr.region_id
   and mr.darkmode_shared_tilelayer_id = mb.id
   --
   and r.plug_source_type              = 'NATIVE_MAP_REGION'
union all
select mb.id,
       p.flow_id,
       p.security_group_id,
       mb.name                         as map_background_name,
       'APEX_APPLICATION_PAGE_ITEMS'   as component_type,
       case when si.item_plug_id is not null
            then (
                select r.plug_name
                  from wwv_flow_page_plugs r
                 where r.security_group_id = si.security_group_id
                   and r.flow_id           = si.flow_id
                   and r.id                = si.item_plug_id )
       end                             as region,
       si.name                         as page_item,
       p.id                            as page_id,
       p.name                          as page_name,
       null                            as plugin_setting_id
  from wwv_flow_steps p,
       wwv_flow_step_items si,
       wwv_flow_map_backgrounds mb
 where p.flow_id                       = si.flow_id
   and si.flow_id                      = mb.flow_id
    --
   and p.security_group_id             = si.security_group_id
   and si.security_group_id            = mb.security_group_id
    --
   and p.id                            = si.flow_step_id
    --
    -- for translated applications, custom_background contains a VARCHAR2 with decimal character,
    -- and that character might be different from the current session NLS settings. So we need
    -- to normalize this.
   and mb.id                           = to_number( replace( replace( si.attributes."custom_background", ',', '.' ), '.', wwv_flow.get_nls_decimal_separator ) )
    --
   and si.display_as                   = 'NATIVE_DISPLAY_MAP'
   and si.attributes."background"      = 'shared-component'
union all
select mb.id,
       ps.flow_id,
       ps.security_group_id,
       mb.name map_background_name,
       'APEX_APPL_PLUGIN_SETTINGS'     as component_type,
       null                            as region,
       null                            as page_item,
       null                            as page_id,
       null                            as page_name,
       ps.id                           as plugin_setting_id
  from wwv_flow_plugin_settings ps,
       wwv_flow_map_backgrounds mb
where ps.flow_id                          = mb.flow_id
    --
   and ps.security_group_id               = mb.security_group_id
    --
   and ps.plugin                          = 'NATIVE_GEOCODED_ADDRESS'
   and ps.attributes."background"         = 'shared-component'
    --
    -- for translated applications, custom_background contains a VARCHAR2 with decimal character,
    -- and that character might be different from the current session NLS settings. So we need
    -- to normalize this.
   and mb.id                           = to_number( replace( replace( ps.attributes."custom_background", ',', '.' ), '.', wwv_flow.get_nls_decimal_separator ) )
/

--==============================================================================
prompt ...wwv_flow_user_push_queue view
create or replace view wwv_flow_user_push_queue (
    id,
    flow_id,
    push_subscription_id,
    title,
    body,
    icon_url,
    target_url,
    send_attempts_count,
    error_message,
    created_on,
    created_by,
    last_updated_on,
    last_updated_by,
    workspace_id,
    workspace_name )
as
select
    a.id,
    flow_id,
    push_subscription_id,
    title,
    body,
    icon_url,
    target_url,
    send_attempts_count,
    error_message,
    created_on,
    created_by,
    last_updated_on,
    last_updated_by,
    a.security_group_id,
    w.workspace_name
  from wwv_flow_push_queue        a,
       wwv_companies_auth_for_dml w
 where a.security_group_id = w.workspace_id
/
comment on table wwv_flow_user_push_queue is 'Outgoing push notification queue for the current workspace';

create or replace trigger wwv_flow_user_push_queue_iot
instead of delete
on wwv_flow_user_push_queue
for each row
begin
    delete from wwv_flow_push_queue
     where id                = :old.id
       and security_group_id = wwv_flow_security.g_security_group_id;
end wwv_flow_user_push_queue_iot;
/

--==============================================================================
prompt ...wwv_flow_temp_files view
create or replace view wwv_flow_temp_files as
  select id,
         flow_id            application_id,
         name,
         filename,
         mime_type,
         created_on,
         blob_content
    from wwv_flow_current_sgid_for_dml sgid,
         wwv_flow_file_objects$      a
   where a.security_group_id = sgid.security_group_id
     and session_id          = ( select nv('SESSION') from sys.dual )
with check option
/
comment on table wwv_flow_temp_files                  is 'Oracle APEX temporary upload files, automatically deleted at end of request processing or session';
comment on column wwv_flow_temp_files.id              is 'Primary key that identifies the file';
comment on column wwv_flow_temp_files.application_id  is 'Key that identifies the application';
comment on column wwv_flow_temp_files.name            is 'Unique name of the uploaded file';
comment on column wwv_flow_temp_files.filename        is 'Name of the uploaded file, without the unique prefix';
comment on column wwv_flow_temp_files.mime_type       is 'Mime Type';
comment on column wwv_flow_temp_files.created_on      is 'Date of creation';
comment on column wwv_flow_temp_files.blob_content    is 'BLOB file content';

create or replace trigger wwv_flow_temp_files_iot
instead of delete on wwv_flow_temp_files
for each row
begin
    delete from wwv_flow_file_objects$
     where id                = :old.id
       and security_group_id = wwv_flow_security.g_security_group_id
       and session_id        = wwv_flow.g_instance;
end wwv_flow_temp_files_iot;
/

--==============================================================================
prompt ...wwv_flow_files view
create or replace view wwv_flow_files as
  select id,
         flow_id,
         name,
         filename,
         title,
         mime_type,
         doc_size,
         dad_charset,
         created_by,
         created_on,
         updated_by,
         updated_on,
         last_updated,
         content_type,
         blob_content,
         language,
         description,
         file_type,
         file_charset
    from wwv_flow_current_sgid_for_dml  sgid,
         wwv_flow_file_objects$       a
   where a.security_group_id = sgid.security_group_id
     and session_id        is null
     and (  file_type is null
         or file_type not in ( 'IMAGE_FILE', 'CSS_FILE', 'STATIC_FILE' ) /* files are now stored in wwv_flow_static_files and wwv_flow_company_static_files */
         or ( /* include legacy static files which don't exist in the workspace and app static file table anymore, because wwv_flow_file_mgr.get_file
                 will still access them in fallback mode (bug #20729418)
              */
                file_type in ( 'IMAGE_FILE', 'CSS_FILE', 'STATIC_FILE' )
            and (  (   flow_id = 0
                   and not exists ( select 1
                                      from wwv_flow_company_static_files
                                     where security_group_id = a.security_group_id
                                       and file_name         = a.filename
                                  )
                   )
                or (   flow_id <> 0
                   and not exists ( select 1
                                      from wwv_flow_static_files
                                     where security_group_id = a.security_group_id
                                       and flow_id           = a.flow_id
                                       and file_name         = a.filename
                                  )
                   )
                )
            )
         )
   union all
  select id,
         flow_id,
         to_char( id ) || '/' || file_name as name,
         file_name,
         null as title,
         mime_type,
         sys.dbms_lob.getlength( file_content ) as doc_size,
         null as dad_charset,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         last_updated_on,
         null as content_type,
         file_content,
         null as language,
         null as description,
         case
           when upper( mime_type ) like 'IMAGE%' then 'IMAGE_FILE'
           when upper( mime_type ) = 'TEXT/CSS'  then 'CSS_FILE'
           else 'STATIC_FILE'
         end as file_type,
         file_charset
    from wwv_flow_static_files
   where security_group_id = ( select wwv_flow.get_sgid from sys.dual )
   union all
  select id,
         0 as flow_id,
         to_char( id ) || '/' || file_name as name,
         file_name,
         null as title,
         mime_type,
         sys.dbms_lob.getlength( file_content ) as doc_size,
         null as dad_charset,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         last_updated_on,
         null as content_type,
         file_content,
         null as language,
         null as description,
         case
           when upper( mime_type ) like 'IMAGE%' then 'IMAGE_FILE'
           when upper( mime_type ) = 'TEXT/CSS'  then 'CSS_FILE'
           else 'STATIC_FILE'
         end as file_type,
         file_charset
    from wwv_flow_company_static_files
   where security_group_id = ( select wwv_flow.get_sgid from sys.dual )
/
create or replace trigger wwv_flow_files_iot
instead of insert or update or delete
on wwv_flow_files
for each row
declare
    l_new_doc_size number;
begin
    if deleting then
        delete wwv_flow_file_objects$
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    else
        wwv_flow_imp.check_api_use_allowed;

        if :new.blob_content is not null then
            l_new_doc_size := sys.dbms_lob.getlength(:new.blob_content);
        else
            l_new_doc_size := 0;
        end if;

        if updating then
            update wwv_flow_file_objects$
            set flow_id      = :new.flow_id,
                name         = :new.name,
                filename     = :new.filename,
                title        = :new.title,
                mime_type    = :new.mime_type,
                doc_size     = l_new_doc_size,
                dad_charset  = :new.dad_charset,
                content_type = :new.content_type,
                blob_content = :new.blob_content,
                language     = :new.language,
                description  = :new.description,
                file_type    = :new.file_type,
                file_charset = :new.file_charset
            where id                = :old.id
            and security_group_id = wwv_flow_security.g_security_group_id;
        else
            insert into wwv_flow_file_objects$ (
                id,
                flow_id,
                name,
                filename,
                title,
                mime_type,
                doc_size,
                dad_charset,
                created_by,
                created_on,
                updated_by,
                updated_on,
                last_updated,
                content_type,
                blob_content,
                language,
                description,
                file_type,
                file_charset )
            values (
                :new.id,
                :new.flow_id,
                :new.name,
                :new.filename,
                :new.title,
                :new.mime_type,
                l_new_doc_size,
                :new.dad_charset,
                :new.created_by,
                :new.created_on,
                :new.updated_by,
                :new.updated_on,
                :new.last_updated,
                :new.content_type,
                :new.blob_content,
                :new.language,
                :new.description,
                :new.file_type,
                :new.file_charset );
        end if;

        if inserting
           or :old.doc_size is null
           or :old.doc_size <> l_new_doc_size
        then
            wwv_flow_file_api.check_workspace_limits;
        end if;
    end if;
end;
/
comment on table wwv_flow_files is 'Uploaded files';
--==============================================================================
prompt ...wwv_flow_company_filestats view
create or replace view wwv_flow_company_filestats (
    security_group_id,
    file_type,
    file_newest,
    file_oldest,
    file_bytes,
    file_count )
as
select security_group_id,
       the_type,
       max(created_on),
       min(created_on),
       nvl(sum(doc_size),0),
       count(*)
 from ( select security_group_id,
               case
               when file_type in (
                        'FLOW_EXPORT','PLUGIN','PAGE_EXPORT','CSS_EXPORT',
                        'IMAGE_EXPORT','THEME','UI_DEFAULTS','FILE_EXPORT' )
               then 'EXPORT REPOSITORY'
               else 'OTHER WORKSPACE FILES'
               end the_type,
               created_on,
               doc_size
          from WWV_FLOW_FILE_OBJECTS$
         where ( file_type is null
                 or file_type not in ('IMAGE_FILE', 'CSS_FILE', 'STATIC_FILE') ))
group by security_group_id,the_type
union all
select security_group_id, 'STATIC WORKSPACE FILES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(file_content)),0), count(*)
from wwv_flow_company_static_files
group by security_group_id
union all
select security_group_id, 'STATIC APPLICATION FILES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(file_content)),0), count(*)
from wwv_flow_static_files
group by security_group_id
union all
select security_group_id, 'PLUG-IN FILES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(FILE_CONTENT)),0), count(*)
from WWV_FLOW_PLUGIN_FILES
group by security_group_id
union all
select security_group_id, 'THEME FILES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(FILE_CONTENT)),0), count(*)
from WWV_FLOW_THEME_FILES
group by security_group_id
union all
select security_group_id, 'THEME IMAGES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(THEME_IMAGE)),0), count(*)
from WWV_FLOW_THEMES
group by security_group_id
/
--==============================================================================
prompt ...wwv_flow_collections view
create or replace view wwv_flow_collections as
    select c.collection_name, m.seq_id, m.c001, m.c002, m.c003, m.c004, m.c005, m.c006, m.c007,
           m.c008, m.c009, m.c010, m.c011, m.c012, m.c013, m.c014, m.c015, m.c016, m.c017,
           m.c018, m.c019, m.c020, m.c021, m.c022, m.c023, m.c024, m.c025, m.c026, m.c027,
           m.c028, m.c029, m.c030, m.c031, m.c032, m.c033, m.c034, m.c035, m.c036, m.c037,
           m.c038, m.c039, m.c040, m.c041, m.c042, m.c043, m.c044, m.c045, m.c046, m.c047,
           m.c048, m.c049, m.c050, m.clob001, m.blob001, m.xmltype001, m.n001, m.n002, m.n003,
           m.n004, m.n005, m.d001, m.d002, m.d003, m.d004, m.d005, m.md5_original
      from wwv_flow_current_sgid_for_dml sgid,
           wwv_flow_collections$ c,
           wwv_flow_collection_members$ m
     where c.session_id = (select v('SESSION') from sys.dual)
       and c.security_group_id = sgid.security_group_id
       and m.security_group_id = sgid.security_group_id
       and c.id = m.collection_id
       and c.flow_id = (select nv('FLOW_ID') from sys.dual)
/
comment on table wwv_flow_collections is 'Session-based nonscalar store';

--==============================================================================
prompt ...wwv_flow_clickthru_log_v view
create or replace view wwv_flow_clickthru_log_v as
    select clickdate, category, id, flow_user, ip, security_group_id
      from wwv_flow_clickthru_log$
    union all
    select clickdate, category, id, flow_user, ip, security_group_id
      from wwv_flow_clickthru_log2$
/

--==============================================================================
prompt ...wwv_flow_clickthru_log view
create or replace view wwv_flow_clickthru_log as
    select clickdate, category, id, flow_user, ip
      from sys.dual bug19306482,
           wwv_flow_clickthru_log_v
     where security_group_id = (select wwv_flow.get_sgid from sys.dual)
/

--==============================================================================
prompt ...wwv_flow_tabset_view view
create or replace view wwv_flow_tabset_view as
select tab_set ||
       replace(' ('||
       max(decode(seq,1,tab_text,null))||
       max(decode(seq,2,', '||tab_text,null))||
       max(decode(seq,3,', '||tab_text,null))||
       max(decode(seq,4,'...',null))||
       ')','&'||'nbsp;',' ') d,
       tab_set r,
       flow_id,
       security_group_id,
       tab_set as id
from (
select flow_id, security_group_id, tab_set, tab_text, tab_sequence, row_number() over (partition by tab_set order by tab_sequence nulls last) seq
from wwv_flow_tabs
where flow_id = (select v('FB_FLOW_ID') from sys.dual) ) x
group by flow_id, security_group_id, tab_set
/

--==============================================================================
prompt ...wwv_flow_tabset_view2 view
create or replace view wwv_flow_tabset_view2 as
select d,r from(
    select tab_set ||
           replace(' ('||
           max(decode(seq,1,tab_text,null))||
           max(decode(seq,2,', '||tab_text,null))||
           max(decode(seq,3,', '||tab_text,null))||
           max(decode(seq,4,'...',null))||
           ')','&'||'nbsp;',' ') d,
           tab_set r, 1 ob
    from (
    select tab_set, tab_text, tab_sequence, row_number() over (partition by tab_set order by tab_sequence nulls last) seq
    from wwv_flow_tabs
    where flow_id = (select v('FB_FLOW_ID') from sys.dual) ) x
    group by tab_set
    union
    (select CURRENT_ON_TABSET d,CURRENT_ON_TABSET r, 2 ob
       from wwv_flow_toplevel_tabs
      where flow_id = (select v('FB_FLOW_ID') from sys.dual)
      minus
     select tab_set d,tab_set r,2 ob
       from wwv_flow_tabs
      where flow_id = (select v('FB_FLOW_ID') from sys.dual) )
    )
order by ob
/


--==============================================================================
prompt ...wwv_flow_list_of_values_data_v view
create or replace view wwv_flow_list_of_values_data_v
as
select id, lov_id, lov_disp_sequence, lov_disp_value, lov_return_value, lov_template, required_patch
  from wwv_flow_current_sgid sgid,
       wwv_flow_list_of_values_data w,
       (select wwv_flow_security.get_translated_flow_id flow_id from sys.dual) f
 where w.flow_id           = f.flow_id
   and w.security_group_id = sgid.security_group_id
/


--==============================================================================
prompt ...wwv_flow_lists_of_values$_v view
create or replace view wwv_flow_lists_of_values$_v
as
select id
  from wwv_flow_current_sgid sgid,
       wwv_flow_lists_of_values$ w,
       (select wwv_flow_security.get_flow_id flow_id from sys.dual) f
 where w.flow_id           = f.flow_id
   and w.security_group_id = sgid.security_group_id
/


--==============================================================================
prompt ...wwv_flow_build_options view
create or replace view wwv_flow_build_options as select * from wwv_flow_patches
/


--==============================================================================
-- Use cast() in NLS-dependent views to ensure the resulting data type is big enough for all languages
--
prompt ...calendar views

create or replace view wwv_flow_dual100
as
select level i
  from wwv_flow_current_sgid
connect by level <= 100
/

create or replace view wwv_flow_months_mon ( month_display, month_value )
as
select cast( to_char(to_date(to_char(rownum,'00'),'MM'),'Mon') as varchar2(128) ) as month,
       rownum as value
  from wwv_flow_dual100
 where rownum < 13;

create or replace view wwv_flow_months_month ( month_display, month_value )
as
select cast( to_char(to_date(to_char(rownum,'00'),'MM'),'Month') as varchar2(128) ) as month,
       rownum as value
  from wwv_flow_dual100
 where rownum < 13;

create or replace view wwv_flow_years(year_value) as
select i+1919 from wwv_flow_dual100
union all
select i+2019 from wwv_flow_dual100 where i < 32
/

create or replace view wwv_flow_hours_24 (hour_value) as
select i-1 from wwv_flow_dual100 where i < 25
/

create or replace view wwv_flow_hours_12 (hour_value) as
select i from wwv_flow_dual100 where i < 13
/

create or replace view wwv_flow_minutes_5 (minute_value) as
select (i-1)*5 from wwv_flow_dual100 where i < 13
/

create or replace view wwv_flow_minutes (minute_value) as
select i-1 from wwv_flow_dual100 where i < 61
/

--==============================================================================
-- Use cast() to ensure the resulting data type is big enough for all languages
--
prompt ...wwv_flow_format_masks view
create or replace view wwv_flow_format_masks as
select cast( d as varchar2(128) ) as d, r, t
  from ( select to_char((5234 + 10/100),'FML999G999G999G999G990D00') d, 'FML999G999G999G999G990D00' r, 'N' t from sys.dual
             union all
         select trim(to_char((5234 + 10/100),'999G999G999G999G990D00')) d, '999G999G999G999G990D00' r, 'N' t from sys.dual
             union all
         select trim(to_char((5234 + 10/100),'999G999G999G999G990D0000')) d, '999G999G999G999G990D0000' r, 'N' t from sys.dual
             union all
         select trim(to_char(5234,'999G999G999G999G999G999G990')) d, '999G999G999G999G999G999G990' r, 'N' t from sys.dual
             union all
         select trim(to_char((-5234 - 10/100),'999G999G999G999G990D00MI')) d, '999G999G999G999G990D00MI' r, 'N' t from sys.dual
             union all
         select trim(to_char((-5234 - 10/100),'S999G999G999G999G990D00')) d, 'S999G999G999G999G990D00' r, 'N' t from sys.dual
             union all
         select trim(to_char((-5234 - 10/100),'999G999G999G999G990D00PR')) d, '999G999G999G999G990D00PR' r, 'N' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-RR') d, 'DD-MON-RR' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY') d, 'DD-MON-YYYY' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON') d, 'DD-MON' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR-MON-DD') d, 'RR-MON-DD' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY-MM-DD') d, 'YYYY-MM-DD' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'fmDay, fmDD fmMonth, YYYY') d, 'fmDay, fmDD fmMonth, YYYY' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, 'DD-MON-YYYY HH24:MI' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI:SS') d, 'DD-MON-YYYY HH24:MI:SS' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH:MIPM') d, 'DD-MON-YYYY HH:MIPM' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'Month') d, 'Month' r, 'D' t from sys.dual
             union all
         select to_char(to_timestamp('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH24.MI.SSXFF') d, 'DD-MON-YYYY HH24.MI.SSXFF' r, 'T' t from sys.dual
             union all
         select to_char(to_timestamp('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH:MI:SSXFF PM') d, 'DD-MON-YYYY HH:MI:SSXFF PM' r, 'T' t from sys.dual
             union all
         select to_char(to_timestamp_tz('20040112143012','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI TZR') d, 'DD-MON-YYYY HH24:MI TZR' r, 'Z' t from sys.dual
             union all
         select to_char(to_timestamp_tz('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH24.MI.SSXFF TZR') d, 'DD-MON-YYYY HH24.MI.SSXFF TZR' r, 'Z' t from sys.dual
             union all
         select to_char(to_timestamp_tz('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH.MI.SSXFF PM TZR') d, 'DD-MON-YYYY HH.MI.SSXFF PM TZR' r, 'Z' t from sys.dual
             union all
         select wwv_flow_lang.runtime_message('SINCE_DATE_MASK') d, 'SINCE' r, 'S' t from sys.dual
             union all
         select wwv_flow_lang.runtime_message('SINCE_SHORT_DATE_MASK') d, 'SINCE_SHORT' r, 'S' t from sys.dual
             union all
         select wwv_flow_lang.runtime_message('BLOB_FORMAT_MASK') d, 'BLOB' r, 'Z' t from sys.dual
       )
/

--==============================================================================
-- Use cast() to ensure the resulting data type is big enough for all languages
--
prompt ...wwv_flow_chart_format_masks view
create or replace view wwv_flow_chart_format_masks as
select cast( d as varchar2(128) ) as d, r, t
  from ( select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-RR') d, '%dd-%MMM-%yy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY') d, '%dd-%MMM-%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON') d, '%dd-%MMM' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR-MON-DD') d, '%yy-%MMM-%dd' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY-MM-DD') d, '%yyyy-%MM-%dd' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'fmDay, fmDD fmMonth, YYYY') d, '%dddd, %dd %MMMM, %yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, '%dd-%MMM-%yyyy %HH:%mm' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI:SS') d, '%dd-%MMM-%yyyy %HH:%mm:%ss' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH:MIPM') d, '%dd-%MMM-%yyyy %hh:%mm%tt' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'Month') d, '%MMMM' r, 'D' t from sys.dual
             union all
         select to_char(to_timestamp('20040112143012','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, '%dd-%MMM-%yyyy %HH:%mm' r, 'T' t from sys.dual
             union all
         select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH24:MI DD.MM.YYYY') d, '%HH:%mm %dd.%MM.%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH24:MI:SS DD.MM.YYYY') d, '%HH:%mm:%ss %dd.%MM.%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH:MIPM DD.MM.YYYY') d, '%HH:%mm%tt %dd.%MM.%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON.RR') d, '%dd.%MMM.%yy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON.YYYY') d, '%dd.%MMM.%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON') d, '%dd.%MMM' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR.MON.DD') d, '%yy.%MMM.%dd' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY.MM.DD') d, '%yyyy.%MM.%dd' r, 'D' t from sys.dual
       )
/


--
-- T H E M E / T E M P L A T E   V I E W S
--

-- view to report on defined templates
create or replace view wwv_flow_templates_all ( security_group_id, flow_id, theme_id, internal_name, theme_class_id, temp_type, name, id, is_popup )
as
with apex_ss as (
    select ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select a.*
  from (
    select security_group_id, flow_id, theme_id, internal_name, theme_class_id, 'PAGE'    , name,                    id, is_popup from wwv_flow_templates
    union all
    select security_group_id, flow_id, theme_id, internal_name, theme_class_id, 'REGION'  , page_plug_template_name, id, null     from wwv_flow_page_plug_templates
    union all
    select security_group_id, flow_id, theme_id, internal_name, theme_class_id, 'REPORT'  , row_template_name,       id, null     from wwv_flow_row_templates
    union all
    select security_group_id, flow_id, theme_id, internal_name, theme_class_id, 'LIST'    , list_template_name,      id, null     from wwv_flow_list_templates
    union all
    select security_group_id, flow_id, theme_id, internal_name, theme_class_id, 'LABEL'   , template_name,           id, null     from wwv_flow_field_templates
    union all
    select security_group_id, flow_id, theme_id, internal_name, theme_class_id, 'BUTTON'  , template_name,           id, null     from wwv_flow_button_templates
    union all
    select security_group_id, flow_id, theme_id, internal_name, theme_class_id, 'MENU'    , name,                    id, null     from wwv_flow_menu_templates
    union all
    select security_group_id, flow_id, theme_id, internal_name, theme_class_id, 'CALENDAR', name,                    id, null     from wwv_flow_cal_templates
    union all
    select security_group_id, flow_id, theme_id, to_char( theme_class_id) , theme_class_id, 'POPUP'   , page_name,               id, null     from wwv_flow_popup_lov_template
    ) a,
    apex_ss
 where a.security_group_id in ( apex_ss.workspace_id, 11, 12 )
/

-- view to report on defined templates
create or replace view wwv_flow_templates_used
(security_group_id, flow_id, page_id, temp_type, id, name, theme_id, internal_name, theme_class_id, is_popup)
as
with apex_ss as (
    select ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*, a.name, to_char(a.theme_id), a.internal_name, a.theme_class_id, a.is_popup
  from (
    select security_group_id, flow_id, id as page_id, 'PAGE' temp_type, step_template id from wwv_flow_steps where step_template is not null
    union all
    select security_group_id, flow_id, null as page_id, 'PAGE' temp_type ,error_template from wwv_flow_themes where error_template is not null
    union all
    select security_group_id, flow_id, null as page_id, 'PAGE' temp_type ,printer_friendly_template from wwv_flow_themes where printer_friendly_template is not null
    union all
    select security_group_id, flow_id, page_id, 'REGION', plug_template from wwv_flow_page_plugs where (plug_template != 0 and plug_template is not null)
    union all
    select security_group_id, flow_id, page_id, 'REPORT',plug_query_row_template from wwv_flow_page_plugs where (plug_query_row_template not in (1,2,3) and plug_query_row_template is not null)
    union all
    select security_group_id, flow_id, page_id, 'LIST',list_template_id from wwv_flow_page_plugs where list_template_id is not null
    union all
    select security_group_id, flow_id, flow_step_id as page_id, 'LABEL', item_field_template from wwv_flow_step_items where item_field_template is not null
    union all
    select security_group_id, flow_id, flow_step_id as page_id, 'BUTTON',button_template_id from wwv_flow_step_buttons where button_template_id is not null
    union all
    select security_group_id, flow_id, page_id, 'MENU', menu_template_id from wwv_flow_page_plugs where menu_template_id is not null
    union all
    select security_group_id, flow_id, (select page_id from wwv_flow_page_plugs where id = c.plug_id) as page_id, 'CALENDAR', template_id from wwv_flow_cals c where template_id is not null
  ) t,
  wwv_flow_templates_all a,
  apex_ss
where t.security_group_id = apex_ss.workspace_id
  and a.temp_type         = t.temp_type
  and a.id                = t.id
/

--==============================================================================
prompt ...wwv_multi_component_export view
create or replace view wwv_multi_component_export
as
select n001 flow_id,
       n002  id,
       c001  type_name,
       c002  name,
       seq_id
  from wwv_flow_collections
 where collection_name = 'MULTI_COMPONENT_EXPORT'
   and n002            is not null
   and c001            is not null
/

--==============================================================================
prompt ...wwv_flow_native_plugins view
create or replace view wwv_flow_native_plugins
as
select id,
       plugin_type,
       name,
       'NATIVE_'||name as name_with_prefix,
       display_name || case
                         when is_deprecated = 'Y' then wwv_flow_lang.runtime_message( 'PLUGIN.DEPRECATED' )
                         when is_legacy     = 'Y' then wwv_flow_lang.runtime_message( 'PLUGIN.LEGACY' )
                       end as display_name,
       category,
       supported_component_types,
       supported_data_types,
       standard_attributes,
       sql_min_column_count,
       sql_max_column_count,
       sql_examples,
       is_deprecated,
       is_legacy,
       is_quick_pick,
       help_text
  from wwv_flow_plugins
 where flow_id           = nvl((select wwv_flow_lang.get_translated_application_id(4411) from sys.dual), 4411)
   and security_group_id = 10
   and (name <> 'SAML'
        or (select wwv_flow_platform.get_preference('SAML_ENABLED') from sys.dual) = 'Y')
   and (name <> 'IAS_SSO'
        or exists ( select null
                      from sys.user_objects
                     where object_type = 'PACKAGE'
                       and object_name = 'WWV_FLOW_CUSTOM_AUTH_SSO' ))
/

--==============================================================================
prompt ...wwv_flow_all_plugins view
create or replace view wwv_flow_all_plugins
as
select id,
       plugin_type,
       name,
       name_with_prefix,
       display_name,
       category,
       supported_component_types,
       supported_data_types,
       standard_attributes,
       sql_min_column_count,
       sql_max_column_count,
       sql_examples,
       is_deprecated,
       is_legacy,
       is_quick_pick,
       help_text
  from wwv_flow_native_plugins
 union all
select id,
       plugin_type,
       name,
       case plugin_type
            when 'TEMPLATE COMPONENT' then 'TMPL_'
            else 'PLUGIN_'
        end || name as name_with_prefix,
       display_name || wwv_flow_lang.system_message( 'PLUGIN.DISPLAY_NAME_POSTFIX' ) display_name,
       category,
       supported_component_types,
       supported_data_types,
       standard_attributes,
       sql_min_column_count,
       sql_max_column_count,
       sql_examples,
       is_deprecated,
       is_legacy,
       is_quick_pick,
       help_text
  from wwv_flow_plugins
 where flow_id           = ( select nv('FB_FLOW_ID') from sys.dual )
   and security_group_id = ( select nv('WORKSPACE_ID') from sys.dual )
/

--==============================================================================
prompt ...wwv_flow_javascript_events view
create or replace view wwv_flow_javascript_events as
select d, r, g
  from ( select 1            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.runtime_message('EVENT.BROWSER.' || name) as d,
                name         as r,
                wwv_flow_lang.runtime_message('EVENT.BROWSER') as g
           from wwv_flow_standard_events
          where event_type = 'BROWSER'
          union all
        select  2            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.runtime_message('EVENT.FRAMEWORK.' || name) as d,
                name         as r,
                wwv_flow_lang.runtime_message('EVENT.FRAMEWORK') as g
           from wwv_flow_standard_events
          where event_type = 'APEX'
          union all
         select 3               as order_by,
                p.display_name  as order_by2,
                e.display_name || ' [' || p.display_name || ']'             as d,
                p.name_with_prefix || '|' || p.plugin_type || '|' || e.name as r,
                wwv_flow_lang.runtime_message('EVENT.COMPONENT')             as g
           from ( select id,
                         display_name,
                         plugin_type,
                         name_with_prefix
                    from wwv_flow_native_plugins p
                   union all
                  select id,
                         display_name,
                         plugin_type,
                         'PLUGIN_' || name
                    from wwv_flow_plugins
                   where flow_id           = (select nv('FB_FLOW_ID') from sys.dual)
                     and security_group_id = (select nv('FLOW_SECURITY_GROUP_ID') sgid from sys.dual)
                ) p,
                wwv_flow_plugin_events e
          where e.plugin_id = p.id
          union all
         select 4            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.runtime_message('EVENT.CUSTOM.' || name) as d,
                name         as r,
                wwv_flow_lang.runtime_message('EVENT.CUSTOM') as g
           from wwv_flow_standard_events
          where event_type = 'CUSTOM'
          order by order_by, order_by2, d)
;

--==============================================================================
prompt ...wwv_flow_feedback_types view
create or replace view wwv_flow_feedback_types as
select 1 id, wwv_flow_lang.runtime_message('GENERAL_COMMENT') the_name from sys.dual union all
select 2 id, wwv_flow_lang.runtime_message('ENHANCEMENT_REQUEST') the_name from sys.dual union all
select 3 id, wwv_flow_lang.runtime_message('BUG') the_name from sys.dual
/
comment on table wwv_flow_feedback_types is 'Types of user feedback';

--==============================================================================
prompt ...wwv_flow_feedback_status view
create or replace view wwv_flow_feedback_status as
select 0 id, wwv_flow_lang.runtime_message('NO_STATUS') the_name from sys.dual union all
select 1 id, wwv_flow_lang.runtime_message('ACKNOWLEDGED') the_name from sys.dual union all
select 2 id, wwv_flow_lang.runtime_message('ADDITIONAL_INFORMATION_REQUESTED') the_name from sys.dual union all
select 3 id, wwv_flow_lang.runtime_message('OPEN_PROCESSING_FEEDBACK') the_name from sys.dual union all
select 4 id, wwv_flow_lang.runtime_message('CLOSED') the_name from sys.dual
/
comment on table wwv_flow_feedback_status is 'Status values for user feedback';
--==============================================================================
prompt ...wwv_flow_users view
create or replace view wwv_flow_users as select
		user_id,
		user_name,
		first_name,
		last_name,
		known_as,
		last_update_date,
		last_updated_by,
		creation_date,
		created_by,
		start_date,
		end_date,
		description,
		password_date,
		password_accesses_left,
		password_lifespan_accesses,
		password_lifespan_days,
		employee_id,
		person_type,
		email_address,
		person_id,
		a.security_group_id,
		default_schema,
		allow_access_to_schemas,
		default_date_format,
		attribute_01,
		attribute_02,
		attribute_03,
		attribute_04,
		attribute_05,
		attribute_06,
		attribute_07,
		attribute_08,
		attribute_09,
		attribute_10,
		last_login,
		builder_login_count,
		last_agent,
		last_ip,
		account_locked,
		account_expiry,
		failed_access_attempts,
		first_password_use_occurred,
		change_password_on_first_use,
		last_failed_login
from wwv_flow_current_sgid sgid,
     wwv_flow_fnd_user     a
where a.security_group_id = sgid.security_group_id
/


--==============================================================================
prompt ...wwv_flow_group_users view
create or replace view wwv_flow_group_users as
select g.id group_id,
          g.group_name,
          ug.user_id
  from wwv_flow_current_sgid    sgid,
       WWV_FLOW_FND_GROUP_USERS ug,
       WWV_FLOW_FND_USER_GROUPS g
where g.id                  = ug.group_id
   and ug.security_group_id = sgid.security_group_id
/

--==============================================================================
prompt ...wwv_flow_group_grants view
create or replace view wwv_flow_group_grants (
    security_group_id,
    grantee_type,
    grantee_id,
    grantee_name,
    granted_id,
    granted_name,
    granted_security_group_id
) as
select grantee.security_group_id,
       'U',
       grantee.user_id,
       grantee.user_name,
       granted.id,
       granted.group_name,
       granted.security_group_id
  from wwv_flow_fnd_user grantee,
       wwv_flow_fnd_user_groups granted,
       wwv_flow_fnd_group_users ug
 where grantee.security_group_id = ug.security_group_id
   and grantee.user_id           = ug.user_id
   and granted.id                = ug.group_id
   and granted.security_group_id in (10, ug.security_group_id)
union all
select grantee.security_group_id,
       'G',
       grantee.id,
       grantee.group_name,
       granted.id,
       granted.group_name,
       granted.security_group_id
  from wwv_flow_fnd_user_groups grantee,
       wwv_flow_fnd_user_groups granted,
       wwv_flow_fnd_group_groups gg
 where grantee.security_group_id = gg.security_group_id
   and grantee.id                = gg.grantee_group_id
   and granted.id                = gg.granted_group_id
   and granted.security_group_id in (10, gg.security_group_id)
/

--==============================================================================
prompt ...wwv_flow_developer_workspaces
create or replace force view wwv_flow_developer_workspaces (
    workspace_id,
    workspace_short_name,
    workspace_display_name,
    workspace_status,
    developer_name,
    developer_first_name,
    developer_last_name,
    developer_email,
    developer_role,
    last_login)
as
select ws.provisioning_company_id,
       ws.short_name,
       case when ws.display_name <> ws.short_name
         then ws.display_name||' ('||ws.short_name||')'
         else ws.short_name
       end,
       nvl(ws.account_status, 'ASSIGNED'),
       u.user_name,
       u.first_name,
       u.last_name,
       u.email_address,
       wwv_flow_lang.runtime_message (
           case
             when instr(d.developer_role,'ADMIN') > 0 then 'ACCESS_CONTROL_ADMIN'
             when instr(d.developer_role, 'EDIT') > 0 then 'DEVELOPER'
             when instr(d.developer_role, 'SQL') > 0 then 'DEVELOPER'
             else 'END_USER'
           end ),
       u.last_login
  from wwv_flow_developers d,
       wwv_flow_fnd_user   u,
       wwv_flow_companies  ws,
       ( select cloud_group_name current_group_name
           from wwv_flow_companies
          where provisioning_company_id = wwv_flow.get_security_group_id ),
       ( select case when count(*) > 0 then 'Y' else 'N' end as exclude_internal
           from wwv_flow_platform_prefs
          where (name = 'APEX_BUILDER_AUTHENTICATION' and value = 'CLOUD_IDM')
             or (name = 'DISABLE_ADMIN_LOGIN' and value = 'Y') ) p
 where d.user_id                 (+) = u.user_id
   and d.security_group_id       (+) = u.security_group_id
   and u.security_group_id           = ws.provisioning_company_id
   and (d.user_id is not null or u.allow_team_development_yn = 'Y' or u.security_group_id=10)
   and nvl(u.account_locked,'N')     = 'N'
   and (    current_group_name   is null
         or ws.cloud_group_name  =  current_group_name )
   and not (    ws.provisioning_company_id = 10
            and nv('APP_ID')               = 4550
            and nv('APP_PAGE_ID')          = 20
            and p.exclude_internal         = 'Y')
/

--==============================================================================
-- view to show workspace users in 4350:55
--
prompt ...wwv_flow_workspace_users view
create or replace view wwv_flow_workspace_users (
    workspace_id,
    icon_view_icon,
    alt,
    link,
    icon_view_name,
    user_id,
    "USER",
    "eMail",
    first_name,
    last_name,
    df, -- default schema
    developer,
    last_login,
    last_login2,
    builder_login_count,
    ul, -- is user locked?
    expiration,
    description,
    password_lifespan_days,
    password_lifespan_accesses,
    password_accesses_left,
    last_agent,
    last_ip,
    account_expiry,
    failed_access_attempts,
    change_password_on_first_use,
    first_password_use_occurred,
    dev_type, -- admin/developer/end user
    group_id, -- comma-separated list of assigned group ids
    group_name, -- comma-separated list of assigned group names
    last_update_date,
    last_updated_by,
    creation_date,
    created_by,
    developer_type,
    allow_app_building,
    allow_sql_workshop,
    allow_team_devopment, -- sic!
    is_external_user,
    profile_image_size)
as
select
    u.security_group_id,
    case
    -- unlocked, expired
    when nvl(u.account_locked,'N') = 'N' and (u.is_dev_account_expired = 'Y' or u.is_user_account_expired = 'Y')
    then image_prefix||'htmldb/icons/user_'||user_icon_color||'_exp.gif'
    -- locked, expired
    when nvl(u.account_locked,'N') = 'Y' and (u.is_dev_account_expired = 'Y' or u.is_user_account_expired = 'Y')
    then image_prefix||'htmldb/icons/user_'||d.user_icon_color||'_locked_exp.gif'
    -- locked, unexpired
    when nvl(u.account_locked,'N') = 'Y'
    then image_prefix||'htmldb/icons/user_'||d.user_icon_color||'_locked.gif'
    else
         -- unlocked and unexpired
         image_prefix||'htmldb/icons/user_'||d.user_icon_color||'.gif'
    end icon_view_icon,
    u.email_address alt,
    'f?p=4350:56:'||app_session||'.::NO:EDIT_USER_PRIVS:F4350_P56_USER_ID,LAST_VIEW:'||USER_ID||',55:' link,
    replace(replace(replace(u.user_name,'_',' '),'.','. '),'@','@ ') icon_view_name,
    user_id,
    u.user_name,
    u.email_address,
    u.first_name,
    u.last_name,
    replace(u.default_schema,'%'||'null%',null) df,
    case
    when d.user_type='END_USER'                                        then m.no_developer_priv
    when u.is_dev_account_expired='Y' or u.is_user_account_expired='Y' then m.password_expired
    else m.password_valid
    end developer,
    last_login,
    last_login,
    builder_login_count,
    decode(nvl(u.account_locked,'N'),'Y',m.yes,m.n)ul,
    case
    when u.is_user_account_expired='Y' then m.password_expired
    else m.password_valid
    end expiration,
    u.description,
    u.password_lifespan_days,
    u.password_lifespan_accesses,
    u.password_accesses_left,
    u.last_agent,
    u.last_ip,
    u.account_expiry,
    u.failed_access_attempts,
    u.change_password_on_first_use,
    u.first_password_use_occurred,
    case d.user_type
    when 'ADMIN' then m.admin
    when 'DEVELOPER' then m.dev
    else m.end_user
    end dev_type,
    wwv_flow_string.join(
        cast(multiset(
                select to_char(group_id)
                from WWV_FLOW_FND_GROUP_USERS
                where user_id = u.user_id
                order by group_id)
            as wwv_flow_t_varchar2),
        ','),
    wwv_flow_string.join(
        cast(multiset(
                 select group_name
                 from WWV_FLOW_FND_USER_GROUPS g,
                      WWV_FLOW_FND_GROUP_USERS gu
                 where g.id = gu.group_id
                   and gu.user_id = u.user_id
                 order by gu.group_id)
            as wwv_flow_t_varchar2),
        ','),
    last_update_date,
    last_updated_by,
    creation_date,
    created_by,
    d.user_type,
    decode(nvl(allow_app_building_yn,'Y'),'Y',m.yes,m.n) allow_app_building,
    decode(nvl(allow_sql_workshop_yn,'Y'),'Y',m.yes,m.n) allow_sql_workshop,
    decode(nvl(allow_team_development_yn,'Y'),'Y',m.yes,m.n) allow_team_devopment,
    case when u.person_type='E' then 'Y' else 'N' end is_external_user,
    sys.dbms_lob.getlength(u.profile_image) profile_image_size
from
   (select u.*,
           case when wwv_flow_fnd_user_int.workspace_account_days_left(u.user_name) <= 0 then 'Y' else 'N' end is_dev_account_expired,
           case when wwv_flow_fnd_user_int.end_user_account_days_left(u.user_name) <= 0 then 'Y' else 'N' end is_user_account_expired
      from wwv_flow_fnd_user u) u,
   (select userid,
           security_group_id,
           case
           when instr(developer_role,'ADMIN') > 0 then 'ADMIN'
           when instr(developer_role,'EDIT')  > 0 then 'DEVELOPER'
           when instr(developer_role,'SQL')   > 0 then 'DEVELOPER'
           else 'END_USER'
           end user_type,
           case
           when instr(developer_role,'ADMIN') > 0 then 'red'
           when instr(developer_role,'EDIT')  > 0 then 'yellow'
           when instr(developer_role,'SQL')   > 0 then 'yellow'
           else 'green'
           end user_icon_color
    from wwv_flow_developers ) d,
    (select wwv_flow_lang.runtime_message('F4000.NO') n,
            wwv_flow_lang.runtime_message('F4000.YES') yes,
            wwv_flow_lang.runtime_message('PASSWORD_VALID') password_valid,
            wwv_flow_lang.runtime_message('PASSWORD_EXPIRED') password_expired,
            wwv_flow_lang.runtime_message('NO_DEVELOPER_PRIV') no_developer_priv,
            wwv_flow_lang.runtime_message('DEVELOPER') dev,
            wwv_flow_lang.runtime_message('ADMINISTRATOR') admin,
            wwv_flow_lang.runtime_message('END_USER') end_user,
            wwv_flow_lang.runtime_message('BASIC_DEVELOPER') basic_developer,
            v('APEX_FILES') image_prefix,
            v('APP_SESSION')  app_session
     from sys.dual) m
where u.user_name         = d.userid (+)
  and u.security_group_id = d.security_group_id (+)
/

--==============================================================================
-- utility view for instance admin lovs of schemas that can be assigned to
-- workspaces
--==============================================================================
prompt ...wwv_flow_admin_all_schemas
create or replace view wwv_flow_admin_all_schemas (
    username,
    restricted_to_workspace )
as
select u.username,
       re.workspace_name
  from sys.all_users u,
       wwv_flow_restricted_schemas r,
       wwv_flow_rschema_exceptions re
 where u.username = r.schema (+)
   and r.id = re.schema_id (+)
   and (u.oracle_maintained = 'N' or re.workspace_name is not null)
   and (u.common = 'NO' or re.workspace_name is not null)
   and (r.id is null or re.workspace_name is not null)
   and (u.username not like 'FLOWS_%' or length(username) != 12 or not REGEXP_LIKE(substr(username,7),'[0-9]{6}'))
   and (u.username not like 'APEX_%' or length(username) != 11 or not REGEXP_LIKE(substr(username,6),'[0-9]{6}'))
/

--==============================================================================
-- LEGACY CODE FOR BACKWARDS COMPATIBILITY
--
-- RESTful Services required view to identify path_prefix for RESTful URL
--
-- Note: We don't require c.allow_restful_services_yn=Y here in order to support
-- built-in RESTful Services under each c.path_prefix. The c.allow_restful_services_yn=Y
-- check is enforced in wwv_flow_rt$services view.
--==============================================================================
prompt ...wwv_flow_pool_config view
create or replace view wwv_flow_pool_config
as
select null                                  pool_name,
       c.short_name                          workspace_identifier,
       case when c.host_prefix is null
            then lower(c.path_prefix)
            else lower(c.host_prefix) end    as uri,
       case when c.host_prefix is null
            then 'BASE_PATH'
            else 'BASE_URL' end              as type,
       coalesce (
           c.created_on,
           date'2015-01-01' )                updated,
       c.provisioning_company_id             tenant_id,
       c.cloud_group_name                    identity_domain,
       c.first_schema_provisioned            schema_name
from   wwv_flow_companies c
where  c.provisioning_company_id not in (0,10,11,12)
and    c.account_status in ('AVAILABLE', 'ASSIGNED')
and    exists (  select 1
                  from wwv_flow_platform_prefs
                 where name  = 'RESTFUL_SERVICES_ENABLED'
                   and value = 'Y')
/

--==============================================================================
create or replace force view wwv_flow_debug_messages_v (
    page_view_id,
    page_view_row_number,
    id,
    security_group_id,
    session_id,
    flow_id,
    page_id,
    apex_user,
    elapsed_seconds,
    execution_time,
    percent_of_max,
    message_timestamp,
    message_level,
    message,
    call_stack )
as
select page_view_id,
       row_number() over (partition by page_view_id order by id),
       id,
       security_group_id,
       session_id,
       flow_id,
       page_id,
       apex_user,
       elap,
       lead(elap) over (partition by page_view_id order by id) - elap,
       case max(elap) over (partition by page_view_id)
       when 0 then 0
       else (nvl(lead(elap) over (partition by page_view_id order by id) - elap, 0)) /
            max(elap) over (partition by page_view_id) *
            100
       end,
       message_timestamp,
       message_level,
       message,
       call_stack
  from ( select * from wwv_flow_debug_messages
         union all
         select * from wwv_flow_debug_messages2 )
/

--==============================================================================
--- View for Historical Activity data with join to COMPANIES and FLOWS
--==============================================================================

create or replace view wwv_flow_log_history_v
as
select
   h.log_day,
   h.workspace_id,
   coalesce(h.workspace_name, w.short_name) workspace_name,
   h.application_id,
   coalesce(h.application_name, a.name) application_name,
   h.page_events,
   h.page_views,
   h.page_accepts,
   h.partial_page_views,
   null websheet_views,
   h.rows_fetched,
   h.ir_searches,
   h.distinct_pages,
   h.distinct_users,
   h.distinct_sessions,
   h.average_render_time,
   h.median_render_time,
   h.maximum_render_time,
   h.total_render_time,
   h.content_length,
   h.error_count,
   h.public_page_events,
   h.workspace_login_events
from wwv_flow_log_history h
       left outer join wwv_flow_companies w  on (
           h.workspace_id = w.provisioning_company_id and w.provisioning_company_id != 0
       )
       left outer join ( select f.id, f.name
                from wwv_flows f
               where not exists (
                   select 1
                     from wwv_flow_language_map m
                    where m.translation_flow_id =  f.id
                      and m.security_group_id   =  f.security_group_id
                      and f.authentication_id   <> trunc(f.authentication_id)
               )
       ) a on ( h.application_id = a.id )
/

--==============================================================================
-- View for workspace groups that excludes app acl roles
--==============================================================================
create or replace view wwv_flow_fnd_user_groups_noapp
as
select *
  from wwv_flow_fnd_user_groups
 where flow_id is null
/

--==============================================================================
-- Duality View / JSON Sources
--==============================================================================
create or replace view wwv_flow_duality_view_sources
as
select *
  from wwv_flow_document_sources
 where document_source_type = 'DUALITY_VIEW'
/

create or replace view wwv_flow_json_sources
as
select *
  from wwv_flow_document_sources
 where document_source_type in ( 'JSON_TABLE', 'JSON_COLLECTION' )
/

--==============================================================================
-- Compatibility view for old table wwv_flow_upgrade_progress, which was
-- replaced by wwv_install_% in 18.2.
--==============================================================================
prompt ...wwv_flow_upgrade_progress
create or replace view wwv_flow_upgrade_progress (
       upgrade_id,
       upgrade_date,
       upgrade_sequence,
       upgrade_action,
       upgrade_error,
       upgrade_command )
as
select a.phase,
       a.started_at,
       nvl(e.id, a.id),
       a.action,
       sys.dbms_lob.substr(e.message, 4000),
       sys.dbms_lob.substr(e.statement, 4000)
  from wwv_install$        i,
       wwv_install_action$ a,
       wwv_install_error$  e
 where i.id         = a.install_id
   and a.id         = e.action_id (+)
   and i.schema     = '^APPUN'
/

--==============================================================================
-- Types for component export (pages + shared components)
-- When new component type is added, please add new text message with same name as type_name
-- These text messages are used in app 4000, LOV COMPONENT EXPORT TYPES
--
-- Note: type_name values are defined as constants in wwv_flow_shared_component_api package
-- So, any change in type_name value will impact shared components subscription and component groups
-- functionality
--==============================================================================
prompt ...wwv_flow_appl_component_types
create or replace view wwv_flow_appl_component_types (
    type_name, pe_type_name, display_name, restrict_export_type, split_file_path )
as
select 'APP_ACL'                , 'APP_ACL'                , 'Application Access Control Role' , 'AC' , 'application/shared_components/security/app_access_control'         from sys.dual union all
select 'APP_COMPUTATION'        , 'APP_COMPUTATION'        , 'Application Computation'         , 'AC' , 'application/shared_components/logic/application_computations'      from sys.dual union all
select 'APP_ITEM'               , 'APP_ITEM'               , 'Application Item'                , 'AC' , 'application/shared_components/logic/application_items'             from sys.dual union all
select 'APP_PROCESS'            , 'APP_PROCESS'            , 'Application Process'             , 'AC' , 'application/shared_components/logic/application_processes'         from sys.dual union all
select 'APP_SETTING'            , 'APP_SETTING'            , 'Application Setting'             , 'AC' , 'application/shared_components/logic/application_settings'          from sys.dual union all
select 'APP_STATIC_FILE'        , 'APP_STATIC_FILE'        , 'Application Static File'         , 'AC' , 'application/shared_components/files'                               from sys.dual union all
select 'AUTHENTICATION'         , 'AUTHENTICATION'         , 'Authentication Scheme'           , 'AC' , 'application/shared_components/security/authentications'            from sys.dual union all
select 'AUTOMATION'             , 'AUTOMATION_ACTION'      , 'Automation'                      , 'AC' , 'application/shared_components/automations'                         from sys.dual union all
select 'BREADCRUMB_ENTRY'       , 'BREADCRUMB_ENTRY_VALUE' , 'Breadcrumb Entry'                , 'AC' , 'application/shared_components/navigation/breadcrumbentry'          from sys.dual union all
select 'BREADCRUMB_TEMPLATE'    , 'BREADCRUMB_TEMPLATE'    , 'Breadcrumb Template'             , 'AC' , 'application/shared_components/user_interface/templates/breadcrumb' from sys.dual union all
select 'BREADCRUMB'             , 'BREADCRUMB_ENTRY'       , 'Breadcrumb'                      , 'AC' , 'application/shared_components/navigation/breadcrumbs'              from sys.dual union all
select 'BUILD_OPTION_STATUS'    , 'BUILD_OPTION_STATUS'    , 'Build Option Status'             , ' C' , 'application/shared_components/logic/build_options/status'          from sys.dual union all
select 'BUILD_OPTION'           , 'BUILD_OPTION'           , 'Build Option'                    , 'AC' , 'application/shared_components/logic/build_options'                 from sys.dual union all
select 'BUTTON_TEMPLATE'        , 'BUTTON_TEMPLATE'        , 'Button Template'                 , 'AC' , 'application/shared_components/user_interface/templates/button'     from sys.dual union all
select 'CALENDAR_TEMPLATE'      , 'CALENDAR_TEMPLATE'      , 'Calendar Template'               , 'AC' , 'application/shared_components/user_interface/templates/calendar'   from sys.dual union all
select 'CREDENTIAL'             , 'CREDENTIAL'             , 'Credential'                      , 'AC' , 'workspace/credentials'                                             from sys.dual union all
select 'LEGACY_DATA_LOAD'       , 'LEGACY_DATA_LOAD'       , 'Data Load ( Legacy )'            , 'AC' , 'application/shared_components/legacy_data_loads'                   from sys.dual union all
select 'DATA_LOAD'              , 'DATA_LOAD'              , 'Data Load'                       , 'AC' , 'application/shared_components/data_loads'                          from sys.dual union all
select 'DATA_PROFILE'           , 'DATA_PROFILE'           , 'Data Profile'                    , 'AC' , 'application/shared_components/data_profiles'                       from sys.dual union all
select 'EMAIL_TEMPLATE'         , 'EMAIL_TEMPLATE'         , 'Email Template'                  , 'AC' , 'application/shared_components/email/templates'                     from sys.dual union all
select 'LABEL_TEMPLATE'         , 'LABEL_TEMPLATE'         , 'Label Template'                  , 'AC' , 'application/shared_components/user_interface/templates/label'      from sys.dual union all
select 'LIST_TEMPLATE'          , 'LIST_TEMPLATE'          , 'List Template'                   , 'AC' , 'application/shared_components/user_interface/templates/list'       from sys.dual union all
select 'LIST'                   , 'LIST_ENTRY'             , 'List'                            , 'AC' , 'application/shared_components/navigation/lists'                    from sys.dual union all
select 'LIST_ENTRY'             , 'LIST_ENTRY_VALUE'       , 'List Entry'                      , 'AC' , 'application/shared_components/navigation/listentry'                from sys.dual union all
select 'LOV'                    , 'LOV_ENTRY'              , 'List of Values'                  , 'AC' , 'application/shared_components/user_interface/lovs'                 from sys.dual union all
select 'MESSAGE'                , 'MESSAGE'                , 'Text Message'                    , 'AC' , 'application/shared_components/globalization/messages'              from sys.dual union all
select 'DYNAMIC_TRANSLATION'    , 'DYNAMIC_TRANSLATION'    , 'Dynamic Translation'             , 'AC' , 'application/shared_components/globalization/dyntranslations'       from sys.dual union all
select 'NAVBAR'                 , 'NAVBAR'                 , 'Navigation Bar Entry'            , 'AC' , 'application/shared_components/navigation/navigation_bar'           from sys.dual union all
select 'PAGE_TEMPLATE'          , 'PAGE_TEMPLATE'          , 'Page Template'                   , 'AC' , 'application/shared_components/user_interface/templates/page'       from sys.dual union all
select 'PAGE'                   , 'PAGE'                   , 'Page'                            , 'AC' , 'application/pages'                                                 from sys.dual union all
select 'PAGE_GROUP'             , 'PAGE_GROUP'             , 'Page Group'                      , 'AC' , 'application/pages/page_groups'                                     from sys.dual union all
select 'PARENT_TAB'             , 'PARENT_TAB'             , 'Parent Tab'                      , 'AC' , 'application/shared_components/navigation/tabs/parent'              from sys.dual union all
select 'PLUGIN'                 , 'PLUGIN'                 , 'Plug-in'                         , 'AC' , 'application/shared_components/plugins'                             from sys.dual union all
select 'PLUGIN_SETTINGS'        , 'PLUGIN_SETTINGS'        , 'Plug-in Settings'                , 'AC' , 'application/plugin_settings'                                       from sys.dual union all
select 'POPUP_LOV_TEMPLATE'     , 'POPUP_LOV_TEMPLATE'     , 'Popup List of Values Template'   , 'AC' , 'application/shared_components/user_interface/templates/popuplov'   from sys.dual union all
select 'REGION_TEMPLATE'        , 'REGION_TEMPLATE'        , 'Region Template'                 , 'AC' , 'application/shared_components/user_interface/templates/region'     from sys.dual union all
select 'REMOTE_SERVER'          , 'REMOTE_SERVER'          , 'Remote Server'                   , 'AC' , 'workspace/remote_servers'                                          from sys.dual union all
select 'REPORT_LAYOUT'          , 'REPORT_LAYOUT'          , 'Report Layout'                   , 'AC' , 'application/shared_components/reports/report_layouts'              from sys.dual union all
select 'REPORT_TEMPLATE'        , 'REPORT_TEMPLATE'        , 'Report Template'                 , 'AC' , 'application/shared_components/user_interface/templates/report'     from sys.dual union all
select 'AUTHORIZATION'          , 'AUTHORIZATION'          , 'Authorization Scheme'            , 'AC' , 'application/shared_components/security/authorizations'             from sys.dual union all
select 'REPORT_QUERY'           , 'REPORT_QUERY'           , 'Report Query'                    , 'AC' , 'application/shared_components/reports/report_queries'              from sys.dual union all
select 'SHORTCUT'               , 'SHORTCUT'               , 'Shortcut'                        , 'AC' , 'application/shared_components/user_interface/shortcuts'            from sys.dual union all
select 'SEARCH_CONFIG'          , 'SEARCH_CONFIG'          , 'Search Configuration'            , 'AC' , 'application/shared_components/navigation/search_config'            from sys.dual union all
select 'TAB'                    , 'TAB'                    , 'Tab'                             , 'AC' , 'application/shared_components/navigation/tabs/standard'            from sys.dual union all
select 'TASK_DEFINITION'        , 'TASK_DEFINITION'        , 'Task Definition'                 , 'AC' , 'application/shared_components/workflow/task_definitions'           from sys.dual union all
select 'TREE'                   , 'TREE'                   , 'Tree'                            , 'AC' , 'application/shared_components/navigation/trees'                    from sys.dual union all
select 'WEB_SERVICE'            , 'WEB_SERVICE'            , 'Web Service'                     , 'AC' , 'application/shared_components/logic/webservices'                   from sys.dual union all
select 'WEB_SOURCE'             , 'WEB_SOURCE'             , 'REST Data Source'                , 'AC' , 'application/shared_components/web_sources'                         from sys.dual union all
select 'DUALITY_VIEW'           , 'DUALITY_VIEW'           , 'Duality View'                    , 'AC' , 'application/shared_components/duality_views'                       from sys.dual union all
select 'JSON_SOURCE'            , 'JSON_SOURCE'            , 'JSON Source'                     , 'AC' , 'application/shared_components/json_source'                         from sys.dual union all
select 'AI_CONFIG'              , 'AI_CONFIG'              , 'AI Config'                       , 'AC' , 'application/shared_components/ai_config'                           from sys.dual union all
select 'PWA_SHORTCUT'           , 'PWA_SHORTCUT'           , 'PWA Shortcut'                    , 'AC' , 'application/shared_components/pwa/shortcuts'                       from sys.dual union all
select 'PWA_SCREENSHOT'         , 'PWA_SCREENSHOT'         , 'PWA Screenshot'                  , 'AC' , 'application/shared_components/pwa/screenshots'                     from sys.dual union all
select 'WS_STATIC_FILE'         , 'WS_STATIC_FILE'         , 'Workspace Static File'           , ' C' , 'workspace/files'                                                   from sys.dual union all
select 'WORKFLOW'               , 'WORKFLOW'               , 'Workflow'                        , 'AC' , 'application/shared_components/workflow/workflows'                  from sys.dual union all
select 'MAP_BACKGROUND'         , 'MAP_BACKGROUND'         , 'Map Backgrounds'                 , 'AC' , 'application/shared_components/user_interface/map_backgrounds'      from sys.dual union all
select 'TEMPLATE_COMPONENT'     , 'PLUGIN'                 , 'Plug-in'                         , 'AC' , 'application/shared_components/plugins'                             from sys.dual union all
select 'COMPONENT_GROUP'        , 'COMPONENT_GROUP'        , 'Component Groups'                , 'AC' , 'application/shared_components/logic/component_groups'              from sys.dual;

comment on column wwv_flow_appl_component_types.type_name            is 'The internal component type';
comment on column wwv_flow_appl_component_types.pe_type_name         is 'The internal component type used by page designer/editor';
comment on column wwv_flow_appl_component_types.display_name         is 'The descriptive component type';
comment on column wwv_flow_appl_component_types.restrict_export_type is 'If AC, valid for both application and component export. If A, only application export. If C, only component export';
comment on column wwv_flow_appl_component_types.split_file_path      is 'The sub-directory path if export occurs in split mode';

--==============================================================================
prompt ...wwv_flow_killed_db_sessions
create or replace view wwv_flow_killed_db_sessions
as
select t.*,
       case when module like '%APEX:APP%'
       then regexp_substr (
                client_identifier,
                '^[^:]+' )
       end                                       apex_username,
       case when module like '%APEX:APP%'
       then regexp_substr (
                client_identifier,
                '\d+$' )
       end                                       apex_session_id,
       case when module like '%APEX:APP%'
       then regexp_substr (
                client_info,
                '\d+' )
       end                                       apex_security_group_id
  from ( select * from wwv_flow_killed_db_sessions1$
         union all
         select * from wwv_flow_killed_db_sessions2$ ) t
/

--==============================================================================
prompt ...wwv_flow_web_src_module_usage
create or replace view wwv_flow_web_src_module_usage
as
select security_group_id,
       flow_id,
       web_src_module_id,
       'REGION_NAME.' || plug_source_type as component_type_msg,
       id                                 as component_id,
       page_id                            as page_id,
       plug_name                          as region_name,
       null                               as series_name,
       null                               as shared_component_name,
       use_local_sync_table
  from wwv_flow_page_plugs
 where web_src_module_id is not null
union all
select js.security_group_id,
       js.flow_id,
       js.web_src_module_id,
       'REGION_NAME.NATIVE_JET_CHART'     as component_type_msg,
       js.id                              as component_id,
       js.page_id                         as page_id,
       js.name                            as series_name,
       p.plug_name                        as region_name,
       null                               as shared_component_name,
       js.use_local_sync_table
  from wwv_flow_jet_chart_series js, wwv_flow_jet_charts j, wwv_flow_page_plugs p
 where js.chart_id             = j.id
   and j.region_id             = p.id
   and js.web_src_module_id is not null
union all
select security_group_id,
       flow_id,
       web_src_module_id,
       'SHARED DYNAMIC LOV'               as component_type_msg,
       id                                 as component_id,
       null                               as page_id,
       lov_name                           as shared_component_name,
       null                               as region_name,
       null                               as series_name,
       use_local_sync_table
  from wwv_flow_lists_of_values$
 where web_src_module_id is not null
union all
select security_group_id,
       flow_id,
       web_src_module_id,
       'PROCESS.NATIVE_INVOKE_API'        as component_type_msg,
       id                                 as component_id,
       flow_step_id                       as page_id,
       null                               as shared_component_name,
       process_name                       as region_name,
       null                               as series_name,
       'N'                                as use_local_sync_table
  from wwv_flow_step_processing
 where web_src_module_id is not null
union all
select security_group_id,
       flow_id,
       web_src_module_id,
       'AUTOMATIONS'                      as component_type_msg,
       id                                 as component_id,
       null                               as page_id,
       name                               as shared_component_name,
       null                               as region_name,
       null                               as series_name,
       use_local_sync_table
  from wwv_flow_automations
 where web_src_module_id is not null
union all
select security_group_id,
       flow_id,
       web_src_module_id,
       'TASK_DEF_ACTIONS'                 as component_type_msg,
       id                                 as component_id,
       null                               as page_id,
       name                               as shared_component_name,
       null                               as region_name,
       null                               as series_name,
       'N'
  from wwv_flow_task_def_actions
 where web_src_module_id is not null
union all
select security_group_id,
       flow_id,
       web_src_module_id,
       'WORKFLOW_ACTIVITIES'              as component_type_msg,
       id                                 as component_id,
       null                               as page_id,
       name                               as shared_component_name,
       null                               as region_name,
       null                               as series_name,
       'N'
  from wwv_flow_workflow_activities
 where web_src_module_id is not null
union all
select security_group_id,
       flow_id,
       web_src_module_id,
       'SEARCH_CONFIG'                    as component_type_msg,
       id                                 as component_id,
       null                               as page_id,
       label                              as shared_component_name,
       null                               as region_name,
       null                               as series_name,
       'N'
  from wwv_flow_search_configs
 where web_src_module_id is not null
union all
select l.security_group_id,
       l.flow_id,
       l.web_src_module_id,
       'APEX.MAPS.LAYER'                  as component_type_msg,
       l.id                               as component_id,
       l.page_id                          as page_id,
       null                               as shared_component_name,
       p.plug_name                        as region_name,
       l.name                             as series_name,
       l.use_local_sync_table
  from wwv_flow_map_region_layers l, wwv_flow_map_regions m, wwv_flow_page_plugs p
 where l.map_region_id      = m.id
   and m.region_id          = p.id
   and l.web_src_module_id is not null
/

--==============================================================================
-- View used by the Embedded Code Analysis feature to display values
--==============================================================================
prompt ...wwv_flow_embedded_code
create or replace view wwv_flow_embedded_code
as
select n001    as flow_id,
       n002    as page_id,
       n003    as property_id,
       n004    as component_id,
       n005    as component_type_id,
       c001    as page_name,
       c002    as component_name,
       c003    as component_type_name,
       c004    as property_name,
       c005    as property_type,
       c006    as code_type,
       c007    as group_name,
       c008    as scope_name,
       clob001 as property_source,
       decode( c005, 'JAVASCRIPT', '.js', '.sql') as file_extension
from wwv_flow_collections
where collection_name = 'FLOW_EMBEDDED_CODE'
/
--==============================================================================
prompt ...wwv_flow_web_credential_usage
create or replace view wwv_flow_web_credential_usage
as
select c.security_group_id               as security_group_id,
       null                              as flow_id,
       c.id                              as credential_id,
       c.name                            as credential_name,
       r.id                              as component_id,
       r.name                            as component_name,
       'F4000.REMOTE_DATABASE'           as component_type,
       1601                              as target_page,
       'P1601_ID'                        as id_item
  from wwv_remote_servers r,
       wwv_credentials c
 where r.credential_id = c.id
   and r.server_type   = 'REMOTE_SQL'
union all
select c.security_group_id               as security_group_id,
       m.flow_id                         as flow_id,
       c.id                              as credential_id,
       c.name                            as credential_name,
       m.id                              as component_id,
       m.name                            as component_name,
       'F4000.WEB_SRC_MODULE'            as component_type,
       1921                              as target_page,
       'P1921_WEB_SRC_MODULE_ID'         as id_item
  from wwv_flow_web_src_modules m,
       wwv_credentials c
 where m.credential_id = c.id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = m.flow_id)
union all
select c.security_group_id               as security_group_id,
       f.id                              as flow_id,
       c.id                              as credential_id,
       c.name                            as credential_name,
       null                              as component_id,
       null                              as component_name,
       'F4000.PRINT_CREDENTIALS'         as component_type,
       4001                              as target_page,
       null                              as id_item
  from wwv_flows f,
       wwv_credentials c
 where f.print_credential_id = c.id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
union all
select c.security_group_id               as security_group_id,
       f.id                              as flow_id,
       c.id                              as credential_id,
       c.name                            as credential_name,
       null                              as component_id,
       null                              as component_name,
       'F4000.PWA_PUSH_CREDENTIALS'      as component_type,
       507                               as target_page,
       null                              as id_item
  from wwv_flows f,
       wwv_credentials c
 where f.print_credential_id = c.id
   and not exists (select 1 from wwv_flow_language_map where TRANSLATION_FLOW_ID = f.id)
union all
select c.security_group_id               as security_group_id,
       a.flow_id                         as flow_id,
       c.id                              as credential_id,
       c.name                            as credential_name,
       a.id                              as component_id,
       a.name                            as component_name,
       'AUTHENTICATION_SCHEME'           as component_type,
       4495                              as target_page,
       'P4495_ID'                        as id_item
  from wwv_flow_authentications a,
       wwv_credentials c
 where a.credential_id = c.id
   and not exists (select 1 from wwv_flow_language_map where translation_flow_id = a.flow_id)
union all
select c.security_group_id               as security_group_id,
       null                              as flow_id,
       c.id                              as credential_id,
       c.name                            as credential_name,
       r.id                              as component_id,
       r.name                            as component_name,
       'F4000.GENERATIVE_AI_CREDENTIALS' as component_type,
       9801                              as target_page,
       'P9801_ID'                        as id_item
  from wwv_remote_servers r,
       wwv_credentials c
 where r.credential_id = c.id
   and r.server_type   = 'GENERATIVE_AI'
/

--==============================================================================
-- View used to display the events tracked from outside APEX and
-- during an APEX request
--==============================================================================
prompt ...wwv_flow_events_log
create or replace view wwv_flow_events_log
as
select log_timestamp,
       log_day,
       event_type_id,
       security_group_id,
       workspace_name,
       session_id,
       database_session_id,
       instance_id,
       username,
       attributes_values_json
  from wwv_flow_events1$
union all
select log_timestamp,
       log_day,
       event_type_id,
       security_group_id,
       workspace_name,
       session_id,
       database_session_id,
       instance_id,
       username,
       attributes_values_json -- generic parameter values
  from wwv_flow_events2$
/

set define off

--==============================================================================
-- view for template component plugins
--==============================================================================
prompt ...wwv_flow_template_components
create or replace view wwv_flow_template_components
as
select id,
       flow_id,
       theme_id,
       name,
       case when theme_id is not null
            then regexp_replace( name, '^THEME_[[:digit:]]+', 'THEME')
            else name
       end as static_id,
       case when theme_id is not null
            then regexp_replace( name, '^THEME_[[:digit:]]+\$' )
            else name
       end as name_without_theme_prefix,
       display_name,
       display_name || wwv_flow_lang.system_message( 'PLUGIN.DISPLAY_NAME_POSTFIX' ) as builder_name,
       'TMPL_' || name as used_name,
       supported_component_types,
       image_prefix,
       javascript_file_urls,
       css_file_urls,
       partial_template,
       partial_template_compiled,
       report_body_template,
       report_body_template_compiled,
       report_group_template,
       report_group_template_compiled,
       report_row_template,
       report_row_template_compiled,
       report_container_template,
       report_container_tmpl_compiled,
       report_placeholder_count,
       default_escape_mode,
       translate_this_template,
       reference_id,
       is_quick_pick,
       is_deprecated,
       is_legacy,
       help_text,
       version_identifier,
       about_url,
       plugin_comment,
       files_version,
       security_group_id,
       created_by,
       created_on,
       last_updated_by,
       last_updated_on
  from wwv_flow_plugins
 where plugin_type = 'TEMPLATE COMPONENT'
/

set define '^'

create or replace trigger wwv_flow_tmpl_components_oit
instead of insert or update or delete on wwv_flow_template_components
for each row
begin
    if inserting then
        insert into wwv_flow_plugins (
            id,
            flow_id,
            theme_id,
            plugin_type,
            name,
            display_name,
            supported_component_types,
            image_prefix,
            javascript_file_urls,
            css_file_urls,
            partial_template,
            report_body_template,
            report_group_template,
            report_row_template,
            report_container_template,
            report_placeholder_count,
            default_escape_mode,
            translate_this_template,
            reference_id,
            is_quick_pick,
            is_deprecated,
            is_legacy,
            help_text,
            version_identifier,
            about_url,
            plugin_comment,
            files_version,
            security_group_id )
        values (
            :new.id,
            :new.flow_id,
            :new.theme_id,
            'TEMPLATE COMPONENT',
            :new.name,
            :new.display_name,
            :new.supported_component_types,
            :new.image_prefix,
            :new.javascript_file_urls,
            :new.css_file_urls,
            :new.partial_template,
            :new.report_body_template,
            :new.report_group_template,
            :new.report_row_template,
            :new.report_container_template,
            :new.report_placeholder_count,
            :new.default_escape_mode,
            :new.translate_this_template,
            :new.reference_id,
            nvl( :new.is_quick_pick, 'N' ),
            nvl( :new.is_deprecated, 'N' ),
            nvl( :new.is_legacy, 'N' ),
            :new.help_text,
            :new.version_identifier,
            :new.about_url,
            :new.plugin_comment,
            nvl( :new.files_version, 1 ),
            :new.security_group_id );
    elsif updating then
        update wwv_flow_plugins
           set id                           = :new.id,
               flow_id                      = :new.flow_id,
               theme_id                     = :new.theme_id,
               name                         = :new.name,
               display_name                 = :new.display_name,
               supported_component_types    = :new.supported_component_types,
               image_prefix                 = :new.image_prefix,
               javascript_file_urls         = :new.javascript_file_urls,
               css_file_urls                = :new.css_file_urls,
               partial_template             = :new.partial_template,
               report_body_template         = :new.report_body_template,
               report_group_template        = :new.report_group_template,
               report_row_template          = :new.report_row_template,
               report_container_template    = :new.report_container_template,
               report_placeholder_count     = :new.report_placeholder_count,
               default_escape_mode          = :new.default_escape_mode,
               translate_this_template      = :new.translate_this_template,
               reference_id                 = :new.reference_id,
               is_quick_pick                = :new.is_quick_pick,
               is_deprecated                = :new.is_deprecated,
               is_legacy                    = :new.is_legacy,
               help_text                    = :new.help_text,
               version_identifier           = :new.version_identifier,
               about_url                    = :new.about_url,
               plugin_comment               = :new.plugin_comment,
               files_version                = :new.files_version,
               security_group_id            = :new.security_group_id
         where id                           = :old.id
           and flow_id                      = :old.flow_id
           and security_group_id            = wwv_flow_security.g_security_group_id;
    elsif deleting then
        delete from wwv_flow_plugins
         where id                           = :old.id
           and security_group_id            = wwv_flow_security.g_security_group_id;
    end if;

end;
/

--==============================================================================
-- Pages and shared components of applications, for component export
-- This is a public view, available to customers as APEX_APPL_EXPORT_COMPS
-- logic for the "name" column in this view should be in sync with apex_subscribed_components view
--==============================================================================

prompt ...wwv_flow_appl_export_comps
create or replace view wwv_flow_appl_export_comps (
    workspace,
    workspace_display_name,
    workspace_id,
    application_id,
    application_name,
    type_name,
    id,
    name,
    created_on,
    last_updated_on,
    last_updated_by,
    used_on_pages )
as
select w.workspace,
       w.workspace_display_name,
       w.workspace_id,
       comp.flow_id,
       f.name,
       comp.type_name,
       comp.id,
       comp.name,
       comp.created_on,
       comp.last_updated_on,
       comp.last_updated_by,
       comp.used_on_pages
from wwv_companies_auth_restricted w,
     wwv_flows                   f,
     ( select 'PAGE' type_name,
           security_group_id,
           flow_id,
           id,
           id||'. '||name name,
           created_on,
           last_updated_on,
           last_updated_by,
           ^APPUN..wwv_flow_t_number(id) used_on_pages
    from wwv_flow_steps
    union all
    select 'APP_COMPUTATION',
           security_group_id,
           flow_id,
           id,
           computation_item,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_computations
    union all
    select 'APP_SETTING',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_app_settings
    union all
    select 'APP_ITEM',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_items
    union all
    select 'APP_PROCESS',
           security_group_id,
           flow_id,
           id,
           process_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_processing
    union all
    select 'AUTHENTICATION',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_authentications
    union all
    select 'AUTOMATION',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_automations
    union all
    select 'SEARCH_CONFIG',
           security_group_id,
           flow_id,
           id,
           label,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_search_configs
    union all
    select 'MAP_BACKGROUND',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_map_backgrounds
    union all
    select 'TASK_DEFINITION',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_task_defs
    union all
    select 'WORKFLOW',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_workflows
    union all
    select 'BREADCRUMB_ENTRY',
           o.security_group_id,
           o.flow_id,
           o.id,
           m.name||': '||o.short_name||' ('||o.page_id||')',
           o.created_on,
           nvl(o.last_updated_on,o.created_on),
           o.last_updated_by,
           ^APPUN..wwv_flow_t_number(o.page_id)
      from wwv_flow_menu_options o,
           wwv_flow_menus        m
     where m.id      = o.menu_id
       and m.flow_id = o.flow_id
    union all
    select 'BREADCRUMB_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.page_id
                 from wwv_flow_page_plugs p
                where p.menu_template_id = t.id
                  and p.flow_id          = t.flow_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_menu_templates t
    union all
    select 'CALENDAR_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.page_id
                 from wwv_flow_page_plugs p,
                      wwv_flow_cals       c
                where c.template_id = t.id
                  and c.flow_id     = t.flow_id
                  and c.plug_id     = p.id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_cal_templates t
    union all
    select 'BUILD_OPTION',
           security_group_id,
           flow_id,
           id,
           patch_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_patches t
    union all
    select 'BUTTON_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           template_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.flow_step_id
                 from wwv_flow_step_buttons p
                where p.button_template_id = t.id
                  and p.flow_id            = t.flow_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_button_templates t
    union all
    select 'REGION_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           page_plug_template_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.page_id
                 from wwv_flow_page_plugs p
                where p.plug_template     = t.id
                  and p.flow_id           = t.flow_id
                  and p.security_group_id = t.security_group_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_page_plug_templates t
    union all
    select 'LIST_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           list_template_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.page_id
                 from wwv_flow_page_plugs p
                where p.list_template_id  = t.id
                  and p.flow_id           = t.flow_id
                  and p.security_group_id = t.security_group_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_list_templates t
    union all
    select 'REPORT_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           row_template_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.page_id
                 from wwv_flow_page_plugs p
                where p.menu_template_id  = t.id
                  and p.flow_id           = t.flow_id
                  and p.security_group_id = t.security_group_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_row_templates t
    union all
    select 'LABEL_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           template_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.flow_step_id
                 from wwv_flow_step_items p
                where p.item_field_template = t.id
                  and p.flow_id             = t.flow_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_field_templates t
    union all
    select 'LIST',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.page_id
                 from wwv_flow_page_plugs p
                where p.list_id           = t.id
                  and p.flow_id           = t.flow_id
                  and p.security_group_id = t.security_group_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_lists t
    union all
    select 'BREADCRUMB',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.page_id
                 from wwv_flow_menu_options p
                where p.menu_id           = t.id
                  and p.flow_id = t.flow_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_menus t
    union all
    select 'TAB',
           security_group_id,
           flow_id,
           id,
           tab_set||': '||tab_name||' ('||tab_text||')',
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           wwv_flow_string.split_numbers(
               regexp_replace (
                   tab_step||','||tab_also_current_for_pages,
                   '[^,0-9]+',
                   null ),
               ',' )
      from wwv_flow_tabs t
    union all
    select 'PARENT_TAB',
           security_group_id,
           flow_id,
           id,
           tab_set||': '||tab_name||' ('||tab_text||')',
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_toplevel_tabs t
    union all
    select 'LOV',
           security_group_id,
           flow_id,
           id,
           lov_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.flow_step_id
                 from wwv_flow_step_items p
                where p.named_lov = t.lov_name
                  and p.flow_id   = t.flow_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_lists_of_values$ t
    union all
    select 'NAVBAR',
           security_group_id,
           flow_id,
           id,
           icon_sequence||'. '||icon_image_alt||' ('||icon_image||')',
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_icon_bar t
    union all
    select 'PAGE_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select p.id
                 from wwv_flow_steps p
                where p.step_template = t.id
                  and p.flow_id       = t.flow_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_templates t
    union all
    select 'PWA_SHORTCUT',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_pwa_shortcuts t
    union all
    select 'PWA_SCREENSHOT',
           security_group_id,
           flow_id,
           id,
           label,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_pwa_screenshots t
    union all
    select 'SHORTCUT',
           security_group_id,
           flow_id,
           id,
           shortcut_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_shortcuts t
    union all
    select 'EMAIL_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_email_templates
    union all
    select 'POPUP_LOV_TEMPLATE',
           security_group_id,
           flow_id,
           id,
           page_title,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select distinct p.flow_step_id
                 from wwv_flow_step_items p
                where p.display_as = 'NATIVE_POPUP_LOV'
                  and p.flow_id    = t.flow_id )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_popup_lov_template t
    union all
    select 'AUTHORIZATION',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_security_schemes t
    union all
    select 'APP_ACL',
           security_group_id,
           flow_id,
           id,
           group_name,
           null as created_on,
           null as last_updated_on,
           null,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_fnd_user_groups t
     where flow_id is not null
    union all
    select 'TREE',
           security_group_id,
           flow_id,
           id,
           tree_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_trees t
    union all
    select 'REPORT_QUERY',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_shared_queries t
    union all
    select 'REPORT_LAYOUT',
           security_group_id,
           flow_id,
           id,
           report_layout_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_report_layouts t
    union all
    select 'WEB_SERVICE',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_shared_web_services t
    union all
    select 'LEGACY_DATA_LOAD',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_load_tables t
      where t.data_profile_id is null
    union all
    select 'DATA_LOAD',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_load_tables t
      where t.data_profile_id is not null
    union all
    select 'PLUGIN',
           security_group_id,
           flow_id,
           id,
           display_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           cast(multiset (
               select p.flow_step_id
                 from wwv_flow_step_items p
                where p.display_as = 'NATIVE_'||t.name
                  and p.flow_id    = t.flow_id
                union
               select p.page_id
                 from wwv_flow_page_plugs p
                where p.plug_source_type = 'NATIVE_'||t.name
                  and p.flow_id          = t.flow_id
                union
               select p.flow_step_id
                 from wwv_flow_step_processing p
                where p.process_type = 'NATIVE_'||t.name
                  and p.flow_id       = t.flow_id
                union
               select p.page_id
                 from wwv_flow_page_da_actions p
                where p.action  = 'NATIVE_'||t.name
                  and p.flow_id = t.flow_id
                union
               select w.page_id
                 from wwv_flow_worksheets w,
                      wwv_flow_worksheet_columns c
                where c.display_text_as = 'TMPL_'||t.name
                  and w.flow_id         = t.flow_id
                  and t.plugin_type     = 'TEMPLATE COMPONENT'
                  and t.theme_id is null )
            as ^APPUN..wwv_flow_t_number)
      from wwv_flow_plugins t
     where theme_id is null
    union all
    select 'PLUGIN_SETTINGS',
           security_group_id,
           flow_id,
           id,
           ( select display_name
               from wwv_flow_native_plugins p
              where p.name_with_prefix = s.plugin
                and p.plugin_type      = s.plugin_type ) display_name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           APEX_240200.wwv_flow_t_number()
      from wwv_flow_plugin_settings s
     where s.plugin like 'NATIVE\_%' escape '\'
    union all
    select 'MESSAGE',
           security_group_id,
           flow_id,
           id,
           name||' ('||message_language||')',
           created_on,
           last_updated_on,
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_messages$ t
    union all
    select 'DYNAMIC_TRANSLATION',
           security_group_id,
           flow_id,
           id,
           substr( translate_from_text, 1, 255 )||' ('||translate_to_lang_code||')',
           created_on,
           last_updated_on,
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_dynamic_translations$ t
    union all
    select 'REMOTE_SERVER',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           last_updated_on,
           last_updated_by,
           cast(sys.sys_nt_collect(page_id) as ^APPUN..wwv_flow_t_number)
      from ( select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on) last_updated_on,
                    s.last_updated_by,
                    p.flow_id,
                    p.page_id
               from wwv_flow_page_plugs p,wwv_remote_servers s
              where (  p.remote_server_id    = s.id
                    or p.ai_remote_server_id = s.id )
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on) last_updated_on,
                    s.last_updated_by,
                    i.flow_id,
                    i.flow_step_id
               from wwv_flow_step_items i, wwv_remote_servers s
              where i.ai_remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on) last_updated_on,
                    s.last_updated_by,
                    a.flow_id,
                    a.page_id
               from wwv_flow_page_da_actions a, wwv_remote_servers s
              where a.ai_remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_processing p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    p.flow_step_id
               from wwv_flow_step_processing p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_web_src_modules p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_web_src_modules p,wwv_remote_servers s
              where p.auth_remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    p.page_id
               from wwv_flow_jet_chart_series p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_lists_of_values$ p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_automations p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_document_sources p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on) last_updated_on,
                    s.last_updated_by,
                    c.flow_id,
                    to_number(null)
               from wwv_flow_ai_configs c, wwv_remote_servers s
              where c.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_automation_actions p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_search_configs p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_task_def_actions p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    to_number(null)
               from wwv_flow_workflow_activities p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    flow_id,
                    p.page_id
               from wwv_flow_map_region_layers p,wwv_remote_servers s
              where p.remote_server_id = s.id
              union select s.security_group_id,
                    s.id,
                    s.name,
                    s.created_on,
                    nvl(s.last_updated_on,s.created_on),
                    s.last_updated_by,
                    p.id,
                    to_number(null)
               from wwv_flows p, wwv_remote_servers s
              where p.print_remote_server_id = s.id )
     group by security_group_id,
              flow_id,
              id,
              name,
              created_on,
              last_updated_on,
              last_updated_by
    union all
    select 'CREDENTIAL',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           last_updated_on,
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from ( select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_page_plugs p,wwv_remote_servers s
              where c.id                     = s.credential_id
                and (  p.remote_server_id    = s.id
                    or p.ai_remote_server_id = s.id )
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    i.flow_id
               from wwv_credentials c, wwv_flow_step_items i, wwv_remote_servers s
              where c.id                  = s.credential_id
                and i.ai_remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    a.flow_id
               from wwv_credentials c, wwv_flow_page_da_actions a, wwv_remote_servers s
              where c.id                  = s.credential_id
                and a.ai_remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_processing p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_step_processing p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_jet_chart_series p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_lists_of_values$ p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_map_region_layers p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_automations p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_automation_actions p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_task_def_actions p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_workflow_activities p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_search_configs p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_web_src_modules p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_web_src_modules p,wwv_remote_servers s
              where c.id                    = s.credential_id
                and p.auth_remote_server_id = s.id
                 --
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    p.flow_id
               from wwv_credentials c,wwv_flow_document_sources p,wwv_remote_servers s
              where c.id               = s.credential_id
                and p.remote_server_id = s.id
                 --
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    a.flow_id
               from wwv_credentials c, wwv_flow_ai_configs a, wwv_remote_servers s
              where c.id               = s.credential_id
                and a.remote_server_id = s.id
                 --
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    flow_id
               from wwv_credentials c,wwv_flow_web_src_modules m
              where c.id = m.credential_id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    flow_id
               from wwv_credentials c,wwv_flow_authentications a
              where c.id = a.credential_id
              union select c.security_group_id,
                    c.id,
                    c.name,
                    c.created_on,
                    nvl(c.last_updated_on, c.created_on) last_updated_on,
                    c.last_updated_by,
                    f.id
               from wwv_credentials c,wwv_flows f
              where c.id = f.print_credential_id )
    union all
    select 'WEB_SOURCE',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_web_src_modules
    union all
    select 'DUALITY_VIEW',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_duality_view_sources
    union all
    select 'JSON_SOURCE',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_json_sources
    union all
    select 'AI_CONFIG',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on, created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_ai_configs
    union all
    select 'DATA_PROFILE',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           nvl(last_updated_on,created_on),
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_data_profiles
    union all
    select 'PAGE_GROUP',
           security_group_id,
           flow_id,
           id,
           group_name,
           null created_on,
           null last_updated,
           null last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_page_groups
    union all
    select 'APP_STATIC_FILE',
           security_group_id,
           flow_id,
           id,
           file_name,
           created_on,
           last_updated_on,
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_static_files
    union all
    select 'WS_STATIC_FILE',
           security_group_id,
           null flow_id,
           id,
           file_name,
           created_on,
           last_updated_on,
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_company_static_files
    union all
    select 'TEMPLATE_COMPONENT',
           security_group_id,
           flow_id,
           id,
           builder_name,
           created_on,
           last_updated_on,
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from WWV_FLOW_TEMPLATE_COMPONENTS
     where theme_id is not null
    union all
    select 'COMPONENT_GROUP',
           security_group_id,
           flow_id,
           id,
           name,
           created_on,
           last_updated_on,
           last_updated_by,
           ^APPUN..wwv_flow_t_number()
      from wwv_flow_component_groups ) comp
 where
   -- workspace level components will not have flow_id
   -- so join with wwv_flows (f) should be an outer join
       w.workspace_id          = comp.security_group_id
   and comp.security_group_id  = f.security_group_id (+)
   and comp.flow_id            = f.id (+)
/
comment on column  wwv_flow_appl_export_comps.workspace              is 'A work area mapped to one or more database schemas';
comment on column  wwv_flow_appl_export_comps.workspace_display_name is 'Display name for the workspace';
comment on column  wwv_flow_appl_export_comps.workspace_id           is 'Oracle APEX Workspace Identifier, unique over all workspaces';
comment on column  wwv_flow_appl_export_comps.application_id         is 'Application Primary Key, Unique over all workspaces';
comment on column  wwv_flow_appl_export_comps.application_name       is 'Identifies the application';
comment on column  wwv_flow_appl_export_comps.type_name              is 'The internal component type';
comment on column  wwv_flow_appl_export_comps.id                     is 'The ID of the component';
comment on column  wwv_flow_appl_export_comps.name                   is 'The name of the component';
comment on column  wwv_flow_appl_export_comps.created_on             is 'Date of creation';
comment on column  wwv_flow_appl_export_comps.last_updated_on        is 'Date of last update';
comment on column  wwv_flow_appl_export_comps.last_updated_by        is 'APEX developer who made last update';
comment on column  wwv_flow_appl_export_comps.used_on_pages          is 'Collection of pages which references this component';
show error
