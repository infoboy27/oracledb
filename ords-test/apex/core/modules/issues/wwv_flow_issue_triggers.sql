set define off verify off

prompt ...create APEX Issue Triggers

Rem  Copyright (c) Oracle Corporation 2017 - 2019. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_issues_triggers.sql
Rem
Rem    DESCRIPTION
Rem      Creates the triggers required to run APEX Issues from within APEX
Rem
Rem    NOTES
Rem
Rem    REQUIRMENTS
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    dgault      11/26/2018 - Created

---------------------------------------------------------
-- create triggers
---------------------------------------------------------
create or replace  trigger wwv_flow_label_groups_biu 
before insert or update on wwv_flow_label_groups
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_labels_biu 
before insert or update on wwv_flow_labels
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_milestones_biu 
before insert or update on wwv_flow_milestones
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
    -- sequential id
    if inserting or updating then 
        if :new.milestone_id is null then
           select nvl(max(milestone_id),0) + 1
           into :new.milestone_id
           from wwv_flow_milestones
           where security_group_id = nvl(wwv_flow_security.g_security_group_id,0);
       end if;
   end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issues_biu 
before insert or update on wwv_flow_issues
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- row version
    if inserting then
        :new.row_version := 1;
    elsif updating then
        :new.row_version := nvl(:old.row_version, 0) + 1;
    end if; 
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
        :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
        :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
        :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
        :new.updated_on := sysdate;
    end if;
    if inserting or updating then
        :new.updated_by   :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
        :new.updated_on   := sysdate;
    end if;
    
    -- sequential id
    if inserting or updating then 
        if :new.issue_number is null then
           select nvl(max(issue_number),0) + 1
           into :new.issue_number
           from wwv_flow_issues
           where security_group_id = nvl(wwv_flow_security.g_security_group_id,0);
       end if;
   end if;
   -- default subscription setup on create.
   if inserting and not wwv_flow.g_import_in_progress then 
      wwv_flow_issue_notify_int.set_default_email_prefs (p_user_name =>wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user)) );
   end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issues_ad 
after delete  on wwv_flow_issues
for each row
begin
  if wwv_flow.g_workspace_delete_in_progress = false then
  	update wwv_flow_feedback 
       set issue_id = null 
     where issue_id = :OLD.ID;
  end if;
end ;
/


---------------------------------------------------------
create or replace  trigger wwv_flow_issues_att_biu 
before insert or update on wwv_flow_issue_attachments
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issues_stake_biu 
before insert or update on wwv_flow_issue_stakeholders
for each row
begin
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issue_comments_biu 
before insert or update on wwv_flow_issue_comments
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- row version
    if inserting then
        :new.row_version := 1;
    elsif updating then
        :new.row_version := nvl(:old.row_version, 0) + 1;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id, 0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
        :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
        :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
        :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
        :new.updated_on := sysdate;
    end if;
    if inserting or updating then
        :new.updated_by   :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
        :new.updated_on   := sysdate;
    end if;
    if inserting and :new.public_yn is null then 
      :new.public_yn := 'Y';
    end if;
       -- default subscription setup on comment.
   if inserting and not wwv_flow.g_import_in_progress then 
      wwv_flow_issue_notify_int.set_default_email_prefs (p_user_name => wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user)) );
   end if;

end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issue_events_biu 
before insert or update on wwv_flow_issue_events
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issue_milestones_biu 
before insert or update on wwv_flow_issue_milestones
for each row
begin
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issue_labels_biu 
before insert or update on wwv_flow_issue_labels
for each row
begin
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issues_tmpl_biu 
before insert or update on wwv_flow_issue_templates
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issues_not_biu 
before insert or update on wwv_flow_issue_notifications
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;

end;
/

---------------------------------------------------------
create or replace  trigger wwv_flow_issues_email_pref_biu 
before insert or update on wwv_flow_issue_email_prefs
for each row
begin
    -- id
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- vpd
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
    -- created columns
    if inserting and :new.created_by is null then
       :new.created_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.created_on is null then
       :new.created_on := sysdate;
    end if;
    -- updated columns
    if inserting and :new.updated_by is null then
       :new.updated_by := wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
    end if;
    if inserting and :new.updated_on is null then
       :new.updated_on := sysdate;
    end if;
    if inserting or updating then
       :new.updated_by :=  wwv_flow_security.normalize_ws_user_name(nvl(wwv_flow.g_user,user));
       :new.updated_on := sysdate;
    end if;
end;
/



prompt ...done creating APEX ISSUE Triggers
set define '^'

