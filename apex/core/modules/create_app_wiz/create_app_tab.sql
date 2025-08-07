set define '^' verify off

--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2017. All Rights Reserved.
--
--    NAME
--      create_app_tab_v3.sql
--
--    DESCRIPTION
--      create tables needed in create blueprint app wizard
--
--    RUNTIME DEPLOYMENT: 
--
--    MODIFIED  (MM/DD/YYYY)
--     mhichwa   07/17/2017 - Created
--     mhichwa   07/20/2017 - modified shape
--     cbcho     08/04/2017 - Merged all table DDL to one file and made it runnable
--     cbcho     11/21/2017 - Moved wwv_flow_cons_sync$ to core/tab.sql
--
--------------------------------------------------------------------------------

--
-- creates table needed to support blueprints
--
prompt ...create table wwv_flow_blueprint_repo

begin
    execute immediate '
create table wwv_flow_blueprint_repo (
   id                  number         not null constraint wwv_flow_blueprint_pk primary key,
   security_group_id   number         not null,
   name                varchar2(255)  not null,
   blueprint           clob           not null,
   attribute_defaults  clob,
   supporting_objects  clob,
   remove_objects      clob,
   auto_purge_yn       varchar2(1),
   is_public_yn        varchar2(1),
   icon_class          varchar2(255),
   icon_color_class    varchar2(255),
   page_count          number,
   feature_count       number,
   description         clob,
   short_description   varchar2(4000),
   updated_by          varchar2(255),
   updated_on          date,
   created_by          varchar2(255),
   created_on          date )
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger WWV_FLOW_BLUEPRINT_REPO_T1
    before insert or update
    on WWV_FLOW_BLUEPRINT_REPO 
    for each row
begin
   if inserting and :new.id is null then
      :new.id            := wwv_flow_id.next_val;
   end if;
   if inserting then
      :new.created_by    := nvl(wwv_flow.g_user,USER);
      :new.created_on    := sysdate;
      :new.updated_by    := nvl(wwv_flow.g_user,USER);
      :new.updated_on    := sysdate;
   elsif updating then
      :new.updated_by    := nvl(wwv_flow.g_user,USER);
      :new.updated_on    := sysdate;
   end if;
   if :new.security_group_id is null then
      :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
   end if;
   if :new.auto_purge_yn is null then
       :new.auto_purge_yn := 'Y';
   end if;
   if :new.is_public_yn is null then
       :new.is_public_yn := 'N';
   end if;
   if :new.page_count is null then 
       :new.page_count := 0;
   end if;
   if :new.feature_count is null then 
       :new.feature_count := 0;
   end if;
   if :new.security_group_id is null then
       :new.security_group_id := 0;
   end if;
   if :new.name is null then
       :new.name := 'Unknown';
   end if;
end;
/

begin
    execute immediate 'create index wwv_flow_blueprint_repo_i1 on wwv_flow_blueprint_repo (created_on)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
