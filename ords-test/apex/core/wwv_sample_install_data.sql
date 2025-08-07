Rem  Copyright (c) 2018, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      wwv_sample_install_data.sql
Rem
Rem    DESCRIPTION
Rem      Insert Sample datasets during APEX installation
Rem
Rem    IMPORTANT: If DDL lengh > 4000, DDL cannot exceed 255 chars per line.
Rem               When DDL > 4000, install uses varchar2 255 array to execute DDL.
Rem

Rem    MODIFIED     (MM/DD/YYYY)
Rem    dpeake       01/10/2018 - Created

set define '^'
prompt ...Oracle APEX Sample installation of datasets

prompt
prompt ...insert into wwv_sample_datasets
prompt

begin
    delete from wwv_sample_datasets;
    insert into wwv_sample_datasets (id, name, description, change_history, last_updated, table_prefix)
    values (  1
            , 'SAMPLE_DS.PROJECT'
            , 'SAMPLE_DS.PROJECT.DESC'
            , 'Installed during Oracle APEX installation.'
            , sysdate
            , 'EBA_PROJECT'
           );
    insert into wwv_sample_datasets (id, name, description, change_history, last_updated, table_prefix)
    values (  2
            , 'SAMPLE_DS.EMP_DEPT'
            , 'SAMPLE_DS.EMP_DEPT.DESC'
            , 'Installed during Oracle APEX installation.'
            , sysdate
            , null
           );
    insert into wwv_sample_datasets (id, name, description, change_history, last_updated, table_prefix)
    values (  3
            , 'SAMPLE_DS.OEHR'
            , 'SAMPLE_DS.OEHR.DESC'
            , 'Installed during Oracle APEX installation.'
            , sysdate
            , 'OEHR'
           );
    insert into wwv_sample_datasets (id, name, description, change_history, last_updated, table_prefix)
    values (  4
            , 'SAMPLE_DS.TASKS'
            , 'SAMPLE_DS.TASKS.DESC'
            , 'Installed during Oracle APEX installation.'
            , sysdate
            , 'EBA_TASKS_SS'
           );
    insert into wwv_sample_datasets (id, name, description, change_history, last_updated, table_prefix)
    values (  5
            , 'SAMPLE_DS.ORDERS'
            , 'SAMPLE_DS.ORDERS.DESC'
            , 'Installed during Oracle APEX installation.'
            , sysdate
            , null
           );
    insert into wwv_sample_datasets (id, name, description, change_history, last_updated, table_prefix)
    values (  6
            , 'SAMPLE_DS.COUNTRY'
            , 'SAMPLE_DS.COUNTRY.DESC'
            , 'Installed during Oracle APEX installation.'
            , sysdate
            , null
           );
    insert into wwv_sample_datasets (id, name, description, change_history, last_updated, table_prefix)
    values (  7
            , 'SAMPLE_DS.HEALTH_UPDATES'
            , 'SAMPLE_DS.HEALTH_UPDATES.DESC'
            , 'Installed during Oracle APEX installation.'
            , sysdate
            , null
           );
end;
/

prompt
prompt ...insert into wwv_sample_languages
prompt
begin
    delete from wwv_sample_languages;
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'en', 'English', 1);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'ar', 'Arabic', 5);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'zh', 'Chinese', 10);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'cs', 'Czech', 20);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'fr', 'French', 30);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'de', 'German', 40);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'it', 'Italian', 45);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'ja', 'Japanese', 50);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'ko', 'Korean', 60);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'pl', 'Polish', 70);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'ru', 'Russian', 80);
    insert into wwv_sample_languages (cd, name, display_seq)
    values (  'es', 'Spanish', 90);
end;
/

prompt
prompt ...insert into wwv_sample_dataset_languages
prompt
begin
    delete from wwv_sample_dataset_languages;
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 1, 'en');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'en');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'zh');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'cs');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'fr');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'de');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'ja');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'ko');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'pl');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'ru');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'es');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'ar');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 2, 'it');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 3, 'en');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 4, 'en');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 5, 'en');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 6, 'en');
    insert into wwv_sample_dataset_languages (wwv_sample_dataset_id, language_cd)
    values ( 7, 'en');
end;
/

prompt
prompt ...insert into wwv_sample_ddls
prompt
begin
delete from wwv_sample_ddls;
-- ************************
-- ************************
-- **  Projects Dataset  **
-- ************************
-- ************************
    ------------------------------------------------------------
    -- Demo Project Status table
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TABLE'
            , 'EBA_PROJECT_STATUS'
            , 10
            , 20
            , 'create table eba_project_status ('||chr(10)||
               'id                  number  '||chr(10)||
               '                    generated by default on null as identity '||chr(10)||
               '                    (start with 4 nocache nocycle)'||chr(10)|| 
               '                    constraint eba_project_users_pk'||chr(10)||
               '                    primary key,'||chr(10)||
               'code                varchar2(15) not null,'||chr(10)||
               'description         varchar2(255) not null,'||chr(10)||
               'display_order       number not null,'||chr(10)||
               'created             timestamp with time zone not null,'||chr(10)||
               'created_by          varchar2(255)            not null,'||chr(10)||
               'updated             timestamp with time zone not null,'||chr(10)||
               'updated_by          varchar2(255)            not null )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_STATUS_UK'
            , 11
            , 0
            , 'alter table eba_project_status add constraint eba_project_status_uk unique (code)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TRIGGER'
            , 'EBA_PROJECT_STATUS_BIU'
            , 12
            , 0
            , 'create or replace trigger eba_project_status_biu'||chr(10)||
              'before insert or update on eba_project_status'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created    := current_timestamp;'||chr(10)||
              '        :new.created_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.code       := upper(:new.code);'||chr(10)||
              '    :new.updated    := current_timestamp;'||chr(10)||
              '    :new.updated_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              'end;'
           );

    -----------------------------------------------------------
    -- Demo Projects table
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TABLE'
            , 'EBA_PROJECTS'
            , 20
            , 30
            , 'create table eba_projects ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     constraint eba_projects_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'status_id            number,'||chr(10)||
              'name                 varchar2(255) not null,'||chr(10)||
              'description          varchar2(4000),'||chr(10)||
              'project_lead         varchar2(255),'||chr(10)||
              'budget               number,'||chr(10)||
              'completed_date       date,'||chr(10)||
              'created              timestamp with time zone not null,'||chr(10)||
              'created_by           varchar2(255)            not null,'||chr(10)||
              'updated              timestamp with time zone not null,'||chr(10)||
              'updated_by           varchar2(255)            not null )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECTS_UK'
            , 21
            , 0
            , 'alter table eba_projects add constraint eba_projects_uk unique (name)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_STATUS_FK'
            , 22
            , 0
            , 'alter table eba_projects add constraint eba_project_status_fk'||chr(10)||
              '  foreign key (status_id) references eba_project_status (id)'||chr(10)||
              '  on delete set null'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECTS_STATUS_IDX'
            , 23
            , 0
            , 'create index eba_projects_status_idx on eba_projects (status_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TRIGGER'
            , 'EBA_PROJECTS_BIU'
            , 23
            , 0
            , 'create or replace trigger eba_projects_biu'||chr(10)||
              '    before insert or update on eba_projects'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created    := current_timestamp;'||chr(10)||
              '        :new.created_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.updated    := current_timestamp;'||chr(10)||
              '    :new.updated_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              'end;'
           );

    -----------------------------------------------------------
    -- Demo Project Milestones table
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TABLE'
            , 'EBA_PROJECT_MILESTONES'
            , 30
            , 40
            , 'create table eba_project_milestones ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     constraint eba_project_milestones_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'project_id           number not null,'||chr(10)||
              'name                 varchar2(255) not null,'||chr(10)||
              'description          varchar2(4000),'||chr(10)||
              'due_date             date not null,'||chr(10)||
              'created              timestamp with time zone not null,'||chr(10)||
              'created_by           varchar2(255)            not null,'||chr(10)||
              'updated              timestamp with time zone not null,'||chr(10)||
              'updated_by           varchar2(255)            not null )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_MSTONE_PROJ_FK'
            , 31
            , 0
            , 'alter table eba_project_milestones add constraint eba_project_mstone_proj_fk'||chr(10)||
              '  foreign key (project_id) references eba_projects (id)'||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECT_MSTONE_PROJ_IDX'
            , 32
            , 0
            , 'create index eba_project_mstone_proj_idx on eba_project_milestones (project_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TRIGGER'
            , 'EBA_PROJECT_MILESTONES_BIU'
            , 33
            , 0
            , 'create or replace trigger eba_project_milestones_biu'||chr(10)||
              '    before insert or update on eba_project_milestones'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created    := current_timestamp;'||chr(10)||
              '        :new.created_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.updated    := current_timestamp;'||chr(10)||
              '    :new.updated_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              'end;'
           );

    -----------------------------------------------------------
    -- Demo Project Tasks table
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TABLE'
            , 'EBA_PROJECT_TASKS'
            , 40
            , 50
            , 'create table eba_project_tasks ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     constraint eba_project_tasks_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'project_id           number not null,'||chr(10)||
              'milestone_id         number,'||chr(10)||
              'name                 varchar2(255) not null,'||chr(10)||
              'description          varchar2(4000),'||chr(10)||
              'assignee             varchar2(255),'||chr(10)||
              'start_date           date not null,'||chr(10)||
              'end_date             date not null,'||chr(10)||
              'cost                 number,'||chr(10)||
              'is_complete_yn       varchar2(1),'||chr(10)||
              'created                 timestamp with time zone not null,'||chr(10)||
              'created_by              varchar2(255)            not null,'||chr(10)||
              'updated                 timestamp with time zone not null,'||chr(10)||
              'updated_by              varchar2(255)            not null )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_TASKS_UK'
            , 41
            , 0
            , 'alter table eba_project_tasks add constraint eba_project_tasks_uk unique (project_id, name)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_TASK_PROJ_FK'
            , 42
            , 0
            , 'alter table eba_project_tasks add constraint eba_project_task_proj_fk'||chr(10)||
              '  foreign key (project_id) references eba_projects (id)'||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECT_TASK_PROJ_IDX'
            , 43
            , 0
            , 'create index eba_project_task_proj_idx on eba_project_tasks (project_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_TASK_MSTONE_FK'
            , 44
            , 0
            , 'alter table eba_project_tasks add constraint eba_project_task_mstone_fk'||chr(10)||
              '  foreign key (milestone_id) references eba_project_milestones (id)'||chr(10)||
              '  on delete set null'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECT_TASK_MSTONE_IDX'
            , 45
            , 0
            , 'create index eba_project_task_mstone_idx on eba_project_tasks (milestone_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TRIGGER'
            , 'EBA_PROJECT_TASKS_BIU'
            , 46
            , 0
            , 'create or replace trigger eba_project_tasks_biu'||chr(10)||
              '    before insert or update on eba_project_tasks'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created    := current_timestamp;'||chr(10)||
              '        :new.created_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.updated    := current_timestamp;'||chr(10)||
              '    :new.updated_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              'end;'
           );

    -----------------------------------------------------------
    -- Demo Project Task ToDos table
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TABLE'
            , 'EBA_PROJECT_TASK_TODOS'
            , 50
            , 60
            , 'create table eba_project_task_todos ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     constraint eba_project_task_todos_pk '||chr(10)||
              '                     primary key,'||chr(10)||
              'project_id           number not null,'||chr(10)||
              'task_id              number not null,'||chr(10)||
              'name                 varchar2(255) not null,'||chr(10)||
              'description          varchar2(4000),'||chr(10)||
              'assignee             varchar2(255),'||chr(10)||
              'is_complete_yn       varchar2(1),'||chr(10)||
              'created                 timestamp with time zone not null,'||chr(10)||
              'created_by              varchar2(255)            not null,'||chr(10)||
              'updated                 timestamp with time zone not null,'||chr(10)||
              'updated_by              varchar2(255)            not null )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJ_TASK_TODO_PROJ_FK'
            , 51
            , 0
            , 'alter table eba_project_task_todos add constraint eba_proj_task_todo_proj_fk'||chr(10)||
              '  foreign key (project_id) references eba_projects (id)'||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECT_TSK_TODO_PR_IDX'
            , 52
            , 0
            , 'create index eba_project_tsk_todo_pr_idx  on eba_project_task_todos (project_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_TSK_TODO_TSK_FK'
            , 53
            , 0
            , 'alter table eba_project_task_todos add constraint eba_project_tsk_todo_tsk_fk'||chr(10)||
              '  foreign key (task_id) references eba_project_tasks (id)'||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECT_TSK_TODO_TK_IDX'
            , 54
            , 0
            , 'create index eba_project_tsk_todo_tk_idx on eba_project_task_todos (task_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TRIGGER'
            , 'EBA_PROJECT_TASK_TODOS_BIU'
            , 55
            , 0
            , 'create or replace trigger eba_project_task_todos_biu'||chr(10)||
              '    before insert or update on eba_project_task_todos'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created    := current_timestamp;'||chr(10)||
              '        :new.created_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.updated    := current_timestamp;'||chr(10)||
              '    :new.updated_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              'end;'
           );

    -----------------------------------------------------------
    -- Demo Project Task Links table
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TABLE'
            , 'EBA_PROJECT_TASK_LINKS'
            , 60
            , 70
            , 'create table eba_project_task_links ('||chr(10)||
              'id                 number '||chr(10)||
              '                   generated by default on null as identity '||chr(10)||
              '                   constraint eba_project_task_links_pk '||chr(10)||
              '                   primary key,'||chr(10)||
              'project_id         number not null,'||chr(10)||
              'task_id            number not null,'||chr(10)||
              'link_type          varchar2(20) not null,'||chr(10)||
              'url                varchar2(255),'||chr(10)||
              'application_id     number,'||chr(10)||
              'application_page   number,'||chr(10)||
              'description        varchar2(4000),'||chr(10)||
              'created                 timestamp with time zone not null,'||chr(10)||
              'created_by              varchar2(255)            not null,'||chr(10)||
              'updated                 timestamp with time zone not null,'||chr(10)||
              'updated_by              varchar2(255)            not null )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_TSK_LINK_PRJ_FK'
            , 61
            , 0
            , 'alter table eba_project_task_links add constraint eba_project_tsk_link_prj_fk'||chr(10)||
              '  foreign key (project_id) references eba_projects (id) '||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECT_TSK_LINK_PR_IDX'
            , 62
            , 0
            , 'create index eba_project_tsk_link_pr_idx  on eba_project_task_links (project_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_TSK_LINK_TSK_FK'
            , 63
            , 0
            , 'alter table eba_project_task_links add constraint eba_project_tsk_link_tsk_fk'||chr(10)||
              '  foreign key (task_id) references eba_project_tasks (id) '||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECT_TSK_LINK_TK_IDX'
            , 64
            , 0
            , 'create index eba_project_tsk_link_tk_idx on eba_project_task_links (task_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_TSK_LINK_LTY_CH'
            , 65
            , 0
            , 'alter table eba_project_task_links add constraint eba_project_tsk_link_lty_ch check ( link_type in (''URL'',''Application''))'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TRIGGER'
            , 'EBA_PROJECT_TASK_LINKS_BIU'
            , 66
            , 0
            , 'create or replace trigger eba_project_task_links_biu'||chr(10)||
              '    before insert or update on eba_project_task_links'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created    := current_timestamp;'||chr(10)||
              '        :new.created_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.updated    := current_timestamp;'||chr(10)||
              '    :new.updated_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              'end;'
           );

    -----------------------------------------------------------
    -- Demo Project Comments table
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TABLE'
            , 'EBA_PROJECT_COMMENTS'
            , 70
            , 80
            , 'create table eba_project_comments ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     constraint eba_project_comments_pk '||chr(10)||
              '                     primary key,'||chr(10)||
              'project_id           number not null,'||chr(10)||
              'comment_text         varchar2(4000) not null,'||chr(10)||
              'created              timestamp with time zone not null,'||chr(10)||
              'created_by           varchar2(255)            not null,'||chr(10)||
              'updated              timestamp with time zone not null,'||chr(10)||
              'updated_by           varchar2(255)            not null )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'CONSTRAINT'
            , 'EBA_PROJECT_COMMENT_PROJ_FK'
            , 71
            , 0
            , 'alter table eba_project_comments add constraint eba_project_comment_proj_fk'||chr(10)||
              '  foreign key (project_id) references eba_projects (id) '||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'INDEX'
            , 'EBA_PROJECT_COMMENT_PRJ_IDX'
            , 72
            , 0
            , 'create index eba_project_comment_prj_idx on eba_project_comments (project_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'TRIGGER'
            , 'EBA_PROJECT_COMMENTS_BIU'
            , 73
            , 0
            , 'create or replace trigger eba_project_comments_biu'||chr(10)||
              '    before insert or update on eba_project_comments'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created    := current_timestamp;'||chr(10)||
              '        :new.created_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.updated    := current_timestamp;'||chr(10)||
              '    :new.updated_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              'end;'
           );

    -----------------------------------------------------------
    -- Create Projects View
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'VIEW'
            , 'EBA_PROJECTS_V'
            , 80
            , 10
            , 'create view eba_projects_v as'||chr(10)||
              'select p.id'||chr(10)||
              ',      p.name'||chr(10)||
              ',      s.description status'||chr(10)||
              ',      p.project_lead'||chr(10)||
              ',      p.completed_date'||chr(10)||
              ',      p.budget'||chr(10)||
              ',      (select sum(t.cost)'||chr(10)||
              '        from eba_project_tasks t'||chr(10)||
              '        where t.project_id = p.id'||chr(10)||
              '       ) cost'||chr(10)||
              ',       p.budget - (select sum(t.cost)'||chr(10)||
              '                   from eba_project_tasks t'||chr(10)||
              '                   where t.project_id = p.id'||chr(10)||
              '       ) budget_v_cost'||chr(10)||
              ',      (select count(*)'||chr(10)||
              '        from eba_project_milestones m'||chr(10)||
              '        where m.project_id = p.id'||chr(10)||
              '       ) milestones '||chr(10)||
              ',      (select count(*)'||chr(10)||
              '        from eba_project_tasks t'||chr(10)||
              '        where t.project_id = p.id'||chr(10)||
              '       ) tasks'||chr(10)||
              'from eba_projects p'||chr(10)||
              ',    eba_project_status s'||chr(10)||
              'where s.id = p.status_id'
           );

    -----------------------------------------------------------
    -- Create Completed Projects View
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  1
            , 'VIEW'
            , 'EBA_PROJECTS_COMPLETED_V'
            , 81
            , 11
            , 'create view eba_projects_completed_v as'||chr(10)||
              'select p.id'||chr(10)||
              ',      p.name'||chr(10)||
              ',      p.project_lead'||chr(10)||
              ',      p.completed_date'||chr(10)||
              ',      p.budget'||chr(10)||
              ',      (select sum(t.cost)'||chr(10)||
              '        from eba_project_tasks t'||chr(10)||
              '        where t.project_id = p.id'||chr(10)||
              '       ) cost'||chr(10)||
              ',      (  (select count(*)'||chr(10)||
              '           from eba_project_milestones m'||chr(10)||
              '           ,    eba_project_tasks t'||chr(10)||
              '           where t.project_id = p.id'||chr(10)||
              '           and   t.milestone_id = m.id'||chr(10)||
              '           and   nvl(t.is_complete_yn,''N'') = ''Y'''||chr(10)||
              '           and   t.end_date <= m.due_date'||chr(10)||
              '          )'||chr(10)||
              '        + (select count(*)'||chr(10)||
              '           from eba_project_tasks t'||chr(10)||
              '           where t.project_id = p.id'||chr(10)||
              '           and   t.milestone_id is null'||chr(10)||
              '           and   nvl(t.is_complete_yn,''N'') = ''Y'''||chr(10)||
              '          )'||chr(10)||
              '       ) tasks_on_time '||chr(10)||
              ',      (select count(*)'||chr(10)||
              '        from eba_project_milestones m'||chr(10)||
              '        ,    eba_project_tasks t'||chr(10)||
              '        where t.project_id = p.id'||chr(10)||
              '        and   t.milestone_id = m.id'||chr(10)||
              '        and   nvl(t.is_complete_yn,''N'') = ''Y'''||chr(10)||
              '        and   t.end_date > m.due_date'||chr(10)||
              '       ) tasks_late'||chr(10)||
              ',      (select count(*)'||chr(10)||
              '        from eba_project_tasks t'||chr(10)||
              '        where t.project_id = p.id'||chr(10)||
              '        and   nvl(t.is_complete_yn,''N'') = ''N'''||chr(10)||
              '       ) tasks_incomplete'||chr(10)||
              ',      (select count(*)'||chr(10)||
              '        from eba_project_milestones m'||chr(10)||
              '        where m.project_id = p.id'||chr(10)||
              '        and   not exists (select t.id'||chr(10)||
              '                          from eba_project_tasks t'||chr(10)||
              '                          where t.milestone_id = m.id'||chr(10)||
              '                          and   nvl(t.is_complete_yn,''N'') = ''Y'''||chr(10)||
              '                          and   t.end_date > m.due_date'||chr(10)||
              '                         )'||chr(10)||
              '       ) milestones_on_time'||chr(10)||
              ',      (select count(*)'||chr(10)||
              '        from eba_project_milestones m'||chr(10)||
              '        where m.project_id = p.id'||chr(10)||
              '        and   exists (select t.id'||chr(10)||
              '                      from eba_project_tasks t'||chr(10)||
              '                      where t.milestone_id = m.id'||chr(10)||
              '                      and   nvl(t.is_complete_yn,''N'') = ''Y'''||chr(10)||
              '                      and   t.end_date > m.due_date'||chr(10)||
              '                     )'||chr(10)||
              '       ) milestones_late'||chr(10)||
              ',      (select count(*)'||chr(10)||
              '        from eba_project_milestones m'||chr(10)||
              '        where m.project_id = p.id'||chr(10)||
              '        and   exists (select t.id'||chr(10)||
              '                      from eba_project_tasks t'||chr(10)||
              '                      where t.milestone_id = m.id'||chr(10)||
              '                      and   nvl(t.is_complete_yn,''N'') = ''N'''||chr(10)||
              '                     )'||chr(10)||
              '       ) milestones_incomplete'||chr(10)||
              'from eba_projects p'||chr(10)||
              'where p.status_id = 3'
           );
end;
/
-- **************************
-- **************************
-- **  EMP / DEPT Dataset  **
-- **************************
-- **************************
begin
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  2
            , 'TABLE'
            , 'DEPT'
            , 10
            , 30
            , 'create table dept'||chr(10)||
              '(    deptno number(4,0) '||chr(10)||
              '     generated by default on null as identity '||chr(10)||
              '     (start with 50 increment by 10 maxvalue 9000 nocache nocycle)'||chr(10)||
              '     constraint dept_pk '||chr(10)||
              '     primary key,'||chr(10)||
              '     dname varchar2(50 byte), '||chr(10)||
              '     loc varchar2(50 byte) )'
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  2
            , 'TABLE'
            , 'EMP'
            , 20
            , 30
            , 'create table emp'||chr(10)||
              '(    empno number(4,0) '||chr(10)||
              '     generated by default on null as identity '||chr(10)||
              '     (start with 8000 increment by 10 maxvalue 90000 nocache nocycle)'||chr(10)||
              '     constraint emp_pk '||chr(10)||
              '     primary key,'||chr(10)||
              '     ename varchar2(50 byte), '||chr(10)||
              '     job varchar2(50 byte), '||chr(10)||
              '     mgr number(4,0), '||chr(10)||
              '     hiredate date, '||chr(10)||
              '     sal number(7,2), '||chr(10)||
              '     comm number(7,2), '||chr(10)||
              '     deptno number(4,0) )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  2
            , 'CONSTRAINT'
            , 'EMP_MGR_FK'
            , 21
            , 0
            , 'alter table emp add constraint emp_mgr_fk'||chr(10)||
              '  foreign key (mgr) references emp (empno) '
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  2
            , 'CONSTRAINT'
            , 'EMP_DEPT_FK'
            , 22
            , 0
            , 'alter table emp add constraint emp_dept_fk'||chr(10)||
              '  foreign key (deptno) references dept (deptno) '
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  2
            , 'INDEX'
            , 'EMP_1'
            , 23
            , 0
            , 'create index emp_1 on emp (mgr)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  2
            , 'INDEX'
            , 'EMP_2'
            , 23
            , 0
            , 'create index emp_2 on emp (deptno)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  2
            , 'VIEW'
            , 'EMP_DEPT_V'
            , 50
            , 10
            , 'create view emp_dept_v as'||chr(10)||
              'select e.empno'||chr(10)||
              ',      e.ename'||chr(10)||
              ',      e.job'||chr(10)||
              ',      (select m.ename from emp m where e.mgr = m.empno) mgr'||chr(10)||
              ',      e.hiredate'||chr(10)||
              ',      e.sal'||chr(10)||
              ',      e.comm'||chr(10)||
              ',      d.deptno'||chr(10)||
              ',      d.dname'||chr(10)||
              ',      d.loc'||chr(10)||
              'from emp e'||chr(10)||
              ',    dept d'||chr(10)||
              'where e.deptno = d.deptno (+)'
           );
end;
/
-- ******************
-- ******************
-- **  HR Dataset  **
-- ******************
-- ******************
begin
    -----------------------------------------------------------
    -- Create Tables
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_REGIONS'
            , 10
            , 240
            , 'create table oehr_regions'||chr(10)||
              '(  region_id      number '||chr(10)||
              '     generated by default on null as identity '||chr(10)||
              '     (start with 3300 increment by 100 maxvalue 9900 nocache nocycle)'||chr(10)||
              ' , region_name    varchar2(25)'||chr(10)||
              ' ,   constraint oehr_reg_id_pk primary key (region_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_REGIONS'
            , 18
            , 0
            , 'comment on table oehr_regions is ''Regions table that contains region numbers and names. Contains 4 rows references with the oehr_Countries table.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_REGIONS.REGION_ID'
            , 19
            , 0
            , 'comment on column oehr_regions.region_id is ''Primary key of oehr_regions table.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_REGIONS.REGION_NAME'
            , 19
            , 0
            , 'comment on column oehr_regions.region_name is ''Names of regions. Locations are in the countries of these regions.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_COUNTRIES'
            , 20
            , 230
            , 'create table oehr_countries '||chr(10)||
              '(  country_id      char(2) '||chr(10)||
              '                   constraint oehr_country_id_nn not null'||chr(10)||
              ' , country_name    varchar2(40) '||chr(10)||
              ' , region_id       number '||chr(10)||
              ' ,   constraint oehr_country_c_id_pk'||chr(10)||
              '       primary key (country_id) '||chr(10)||
              ' ,   constraint oehr_countr_reg_fk'||chr(10)||
              '       foreign key (region_id)'||chr(10)||
              '       references oehr_regions(region_id)'||chr(10)||
              ') '||chr(10)||
              'organization index'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_COUNTRY_REGION_IX'
            , 21
            , 0
            , 'create index oehr_country_region_ix on oehr_countries (region_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_COUNTRIES'
            , 28
            , 0
            , 'comment on table oehr_countries is ''oehr_country table. Contains 25 rows. References with oehr_locations table.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_COUNTRIES.COUNTRY_ID'
            , 29
            , 0
            , 'comment on column oehr_countries.country_id is ''Primary key of oehr_countries table.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_COUNTRIES.REGION_ID'
            , 29
            , 0
            , 'comment on column oehr_countries.region_id is ''Region ID for the country. Foreign key to region_id column in the oehr_departments table.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_LOCATIONS'
            , 30
            , 220
            , 'create table oehr_locations'||chr(10)||
              '(  location_id    number(4)'||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 3300 increment by 100 maxvalue 9900 nocache nocycle)'||chr(10)||
              ' , street_address varchar2(40)'||chr(10)||
              ' , postal_code    varchar2(12)'||chr(10)||
              ' , city           varchar2(30)'||chr(10)||
              '                  constraint oehr_loc_city_nn not null'||chr(10)||
              ' , state_province varchar2(25)'||chr(10)||
              ' , country_id     char(2)'||chr(10)||
              ' ,   constraint oehr_loc_id_pk'||chr(10)||
              '       primary key (location_id)'||chr(10)||
              ' ,   constraint oehr_loc_c_id_fk'||chr(10)||
              '       foreign key (country_id)'||chr(10)||
              '       references oehr_countries(country_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_LOC_CITY_IX'
            , 31
            , 0
            , 'create index oehr_loc_city_ix on oehr_locations (city)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_LOC_STATE_PROVINCE_IX'
            , 32
            , 0
            , 'create index oehr_loc_state_province_ix on oehr_locations (state_province)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_LOC_COUNTRY_IX'
            , 33
            , 0
            , 'create index oehr_loc_country_ix on oehr_locations (country_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_LOCATIONS'
            , 38
            , 0
            , 'comment on table oehr_locations is '||chr(10)||
              '''Locations table that contains specific address of a specific office,'||chr(10)||
              'warehouse, and/or production site of a company. Does not store addresses /'||chr(10)||
              'locations of customers. Contains 23 rows references with the'||chr(10)||
              'oehr_departments and oehr_countries tables. '''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_LOCATIONS.LOCATION_ID'
            , 39
            , 0
            , 'comment on column oehr_locations.location_id is ''Primary key of oehr_locations table'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_LOCATIONS.STREET_ADDRESS'
            , 39
            , 0
            , 'comment on column oehr_locations.street_address is ''Street address of an office, warehouse, or production site of a company. Contains building number and street name'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_LOCATIONS.POSTAL_CODE'
            , 39
            , 0
            , 'comment on column oehr_locations.postal_code is ''Postal code of the location of an office, warehouse, or production site of a company. '''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_LOCATIONS.CITY'
            , 39
            , 0
            , 'comment on column oehr_locations.city is ''A not null column that shows city where an office, warehouse, or production site of a company is located. '''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_LOCATIONS.STATE_PROVINCE'
            , 39
            , 0
            , 'comment on column oehr_locations.state_province is ''State or Province where an office, warehouse, or production site of a company is located.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_LOCATIONS.COUNTRY_ID'
            , 39
            , 0
            , 'comment on column oehr_locations.country_id is '||chr(10)||
              '''Country where an office, warehouse, or production site of a company is located. Foreign key to country_id column of the oehr_countries table.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_DEPARTMENTS'
            , 40
            , 210
            , 'create table oehr_departments'||chr(10)||
              '(  department_id    number(4)'||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 280 increment by 10 maxvalue 9990 nocache nocycle)'||chr(10)||
              ' , department_name  varchar2(30)'||chr(10)||
              '                    constraint oehr_dept_name_nn not null'||chr(10)||
              ' , manager_id       number(6)'||chr(10)||
              ' , location_id      number(4)'||chr(10)||
              ' ,   constraint oehr_dept_id_pk'||chr(10)||
              '       primary key (department_id)'||chr(10)||
              ' ,   constraint oehr_dept_loc_fk'||chr(10)||
              '       foreign key (location_id)'||chr(10)||
              '       references oehr_locations (location_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_DEPT_LOCATION_IX'
            , 41
            , 0
            , 'create index oehr_dept_location_ix on oehr_departments (location_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_DEPARTMENTS'
            , 48
            , 0
            , 'comment on table oehr_departments is '||chr(10)||
              '''Departments table that shows details of departments where employees work. Contains 27 rows references with oehr_locations, oehr_employees, and oehr_job_history tables.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_DEPARTMENTS.DEPARTMENT_ID'
            , 49
            , 0
            , 'comment on column oehr_departments.department_id is ''Primary key column of oehr_departments table.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_DEPARTMENTS.DEPARTMENT_NAME'
            , 49
            , 0
            , 'comment on column oehr_departments.department_name is '||chr(10)||
              '''A not null column that shows name of a department. Administration, Marketing, Purchasing, '||chr(10)||
              'Human Resources, Shipping, IT, Executive, Public Relations, Sales, Finance, and Accounting. '''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_DEPARTMENTS.MANAGER_ID'
            , 49
            , 0
            , 'comment on column oehr_departments.manager_id is '||chr(10)||
              '''Manager_id of a department. Foreign key to employee_id column of oehr_employees table. '||chr(10)||
              'The manager_id column of the oehr_employee table references this column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_DEPARTMENTS.LOCATION_ID'
            , 49
            , 0
            , 'comment on column oehr_departments.location_id is ''Location id where a department is located. Foreign key to location_id column of oehr_locations table.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_JOBS'
            , 50
            , 200
            , 'create table oehr_jobs'||chr(10)||
              '(  job_id         varchar2(10)'||chr(10)||
              ' , job_title      varchar2(35)'||chr(10)||
              '                  constraint oehr_job_title_nn not null'||chr(10)||
              ' , min_salary     number(6)'||chr(10)||
              ' , max_salary     number(6)'||chr(10)||
              ' ,   constraint oehr_job_id_pk'||chr(10)||
              '       primary key(job_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOBS'
            , 58
            , 0
            , 'comment on table oehr_jobs is '||chr(10)||
              '''jobs table with job titles and salary ranges. Contains 19 rows.'||chr(10)||
              'References with oehr_employees and oehr_job_history table.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOBS.JOB_ID'
            , 59
            , 0
            , 'comment on column oehr_jobs.job_id is ''Primary key of jobs oehr_table.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOBS.JOB_TITLE'
            , 59
            , 0
            , 'comment on column oehr_jobs.job_title is ''A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOBS.MIN_SALARY'
            , 59
            , 0
            , 'comment on column oehr_jobs.min_salary is ''Minimum salary for a job title.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOBS.MAX_SALARY'
            , 59
            , 0
            , 'comment on column oehr_jobs.max_salary is ''Maximum salary for a job title'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_EMPLOYEES'
            , 60
            , 190
            , 'create table oehr_employees'||chr(10)||
              '(  employee_id    number(6)'||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 207 nocache nocycle)'||chr(10)||
              ' , first_name     varchar2(20)'||chr(10)||
              ' , last_name      varchar2(25)'||chr(10)||
              '                  constraint oehr_emp_last_name_nn not null'||chr(10)||
              ' , email          varchar2(25)'||chr(10)||
              '                  constraint oehr_emp_email_nn not null'||chr(10)||
              ' , phone_number   varchar2(20)'||chr(10)||
              ' , hire_date      date'||chr(10)||
              '                  constraint oehr_emp_hire_date_nn not null'||chr(10)||
              ' , job_id         varchar2(10)'||chr(10)||
              '                  constraint oehr_emp_job_nn not null'||chr(10)||
              ' , salary         number(8,2)'||chr(10)||
              ' , commission_pct number(2,2)'||chr(10)||
              ' , manager_id     number(6)'||chr(10)||
              ' , department_id  number(4)'||chr(10)||
              ' ,   constraint oehr_emp_salary_min'||chr(10)||
              '       check (salary > 0) '||chr(10)||
              ' ,   constraint oehr_emp_email_uk'||chr(10)||
              '       unique (email)'||chr(10)||
              ' ,   constraint oehr_emp_emp_id_pk'||chr(10)||
              '       primary key (employee_id)'||chr(10)||
              ' ,   constraint oehr_emp_dept_fk'||chr(10)||
              '       foreign key (department_id)'||chr(10)||
              '       references oehr_departments'||chr(10)||
              ' ,   constraint oehr_emp_job_fk'||chr(10)||
              '       foreign key (job_id)'||chr(10)||
              '       references oehr_jobs (job_id)'||chr(10)||
              ' ,   constraint oehr_emp_manager_fk'||chr(10)||
              '       foreign key (manager_id)'||chr(10)||
              '       references oehr_employees'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_EMP_NAME_IX'
            , 61
            , 0
            , 'create index oehr_emp_name_ix on oehr_employees (last_name, first_name)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_EMP_JOB_IX'
            , 62
            , 0
            , 'create index oehr_emp_job_ix on oehr_employees (job_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_EMP_MANAGER_IX'
            , 63
            , 0
            , 'create index oehr_emp_manager_ix on oehr_employees (manager_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_EMP_DEPARTMENT_IX'
            , 64
            , 0
            , 'create index oehr_emp_department_ix on oehr_employees (department_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'CONSTRAINT'
            , 'OEHR_DEPT_MGR_FK'
            , 65
            , 0
            , 'alter table oehr_departments add constraint oehr_dept_mgr_fk'||chr(10)||
              '  foreign key (manager_id) references oehr_employees (employee_id) '
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_DEPT_MANAGER_IX'
            , 66
            , 0
            , 'create index oehr_dept_manager_ix on oehr_departments (manager_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES'
            , 69
            , 0
            , 'comment on table oehr_employees is '||chr(10)||
              '''oehr_employees table. Contains 107 rows. References with oehr_departments, '||chr(10)||
              'oehr_jobs, oehr_job_history tables. Contains a self reference.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.EMPLOYEE_ID'
            , 69
            , 0
            , 'comment on column oehr_employees.employee_id is ''Primary key of oehr_employees table.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.FIRST_NAME'
            , 69
            , 0
            , 'comment on column oehr_employees.first_name is ''First name of the employee. A not null column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.LAST_NAME'
            , 69
            , 0
            , 'comment on column oehr_employees.last_name is ''Last name of the employee. A not null column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.EMAIL'
            , 69
            , 0
            , 'comment on column oehr_employees.email is ''Email id of the employee'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.PHONE_NUMBER'
            , 69
            , 0
            , 'comment on column oehr_employees.phone_number is ''Phone number of the employee includes country code and area code'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.HIRE_DATE'
            , 69
            , 0
            , 'comment on column oehr_employees.hire_date is ''Date when the employee started on this job. A not null column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.JOB_ID'
            , 69
            , 0
            , 'comment on column oehr_employees.job_id is ''Current job of the employee foreign key to job_id column of the oehr_jobs table. A not null column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.SALARY'
            , 69
            , 0
            , 'comment on column oehr_employees.salary is ''Monthly salary of the employee. Must be greater than zero (enforced by constraint oehr_emp_salary_min)'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.COMMISSION_PCT'
            , 69
            , 0
            , 'comment on column oehr_employees.commission_pct is ''Commission percentage of the employee Only employees in sales department elgible for commission percentage'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.MANAGER_ID'
            , 69
            , 0
            , 'comment on column oehr_employees.manager_id is '||chr(10)||
              '''Manager id of the employee has same domain as manager_id in '||chr(10)||
              'oehr_departments table. Foreign key to employee_id column of oehr_employees table.'||chr(10)||
              '(useful for reflexive joins and CONNECT BY query)'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_EMPLOYEES.DEPARTMENT_ID'
            , 69
            , 0
            , 'comment on column oehr_employees.department_id is ''Department id where employee works foreign key to department_id column of the oehr_departments table'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_JOB_HISTORY'
            , 70
            , 180
            , 'create table oehr_job_history'||chr(10)||
              '(  employee_id   number(6)'||chr(10)||
              '                 constraint oehr_jhist_employee_nn not null'||chr(10)||
              ' , start_date    date'||chr(10)||
              '                 constraint oehr_jhist_start_date_nn not null'||chr(10)||
              ' , end_date      date'||chr(10)||
              '                 constraint oehr_jhist_end_date_nn not null'||chr(10)||
              ' , job_id        varchar2(10)'||chr(10)||
              '                 constraint oehr_jhist_job_nn not null'||chr(10)||
              ' , department_id number(4)'||chr(10)||
              ' ,   constraint oehr_jhist_date_interval'||chr(10)||
              '       check (end_date >= start_date)'||chr(10)||
              ' ,   constraint oehr_jhist_job_fk'||chr(10)||
              '       foreign key (job_id)'||chr(10)||
              '       references oehr_jobs'||chr(10)||
              ' ,   constraint oehr_jhist_emp_fk'||chr(10)||
              '       foreign key (employee_id)'||chr(10)||
              '       references oehr_employees'||chr(10)||
              ' ,   constraint oehr_jhist_dept_fk'||chr(10)||
              '       foreign key (department_id)'||chr(10)||
              '       references oehr_departments'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_JHIST_JOB_IX'
            , 71
            , 0
            , 'create index oehr_jhist_job_ix on oehr_job_history (job_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_JHIST_EMPLOYEE_IX'
            , 72
            , 0
            , 'create index oehr_jhist_employee_ix on oehr_job_history (employee_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_JHIST_DEPARTMENT_IX'
            , 73
            , 0
            , 'create index oehr_jhist_department_ix on oehr_job_history (department_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'PROCEDURE'
            , 'OEHR_ADD_JOB_HISTORY'
            , 74
            , 184
            , 'create or replace procedure oehr_add_job_history'||chr(10)||
              '  (  p_emp_id          oehr_job_history.employee_id%type'||chr(10)||
              '   , p_start_date      oehr_job_history.start_date%type'||chr(10)||
              '   , p_end_date        oehr_job_history.end_date%type'||chr(10)||
              '   , p_job_id          oehr_job_history.job_id%type'||chr(10)||
              '   , p_department_id   oehr_job_history.department_id%type '||chr(10)||
              '   )'||chr(10)||
              'is'||chr(10)||
              'begin'||chr(10)||
              '  insert into oehr_job_history (employee_id, start_date, end_date, job_id, department_id)'||chr(10)||
              '    values(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);'||chr(10)||
              'end oehr_add_job_history;'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TRIGGER'
            , 'OEHR_UPDATE_JOB_HISTORY'
            , 75
            , 0
            , 'create or replace trigger oehr_update_job_history'||chr(10)||
              '  after update of job_id, department_id on oehr_employees'||chr(10)||
              '  for each row'||chr(10)||
              'declare'||chr(10)||
              '  l_sdate date;'||chr(10)||
              'begin'||chr(10)||
              '  if (:old.job_id != :new.job_id '||chr(10)||
              '  or :old.department_id != :new.department_id) then'||chr(10)||
              '    for c1 in (select max(end_date) prev_start_date '||chr(10)||
              '               from oehr_job_history'||chr(10)||
              '               where employee_id = :old.employee_id'||chr(10)||
              '              ) loop'||chr(10)||
              '      l_sdate := c1.prev_start_date+((24/60)/60);'||chr(10)||
              '    end loop;'||chr(10)||
              '   oehr_add_job_history(  :old.employee_id'||chr(10)||
              '                         , nvl(l_sdate,:old.hire_date)'||chr(10)||
              '                         , sysdate'||chr(10)||
              '                         , :old.job_id'||chr(10)||
              '                         , :old.department_id);'||chr(10)||
              '  end if;'||chr(10)||
              'end;'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOB_HISTORY'
            , 79
            , 0
            , 'comment on table oehr_job_history is '||chr(10)||
              '''Table that stores job history of the employees. If an employee '||chr(10)||
              'changes departments within the job or changes jobs within the department, '||chr(10)||
              'new rows get inserted into this table with old job information of the '||chr(10)||
              'employee. Contains a complex primary key: employee_id+start_date.'||chr(10)||
              'Contains 25 rows. References with oehr_jobs, oehr_employees, and oehr_departments tables.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOB_HISTORY.EMPLOYEE_ID'
            , 79
            , 0
            , 'comment on column oehr_job_history.employee_id is '||chr(10)||
              '''A not null column in the complex primary key employee_id+start_date.'||chr(10)||
              'Foreign key to employee_id column of the oehr_employee table'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOB_HISTORY.START_DATE'
            , 79
            , 0
            , 'comment on column oehr_job_history.start_date is '||chr(10)||
              '''A not null column in the complex primary key employee_id+start_date. '||chr(10)||
              'Must be less than the end_date of the oehr_job_history table. (enforced by '||chr(10)||
              'constraint oehr_jhist_date_interval)'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOB_HISTORY.END_DATE'
            , 79
            , 0
            , 'comment on column oehr_job_history.end_date is '||chr(10)||
              '''Last day of the employee in this job role. A not null column. Must be '||chr(10)||
              'greater than the start_date of the oehr_job_history table. '||chr(10)||
              '(enforced by constraint oehr_jhist_date_interval)'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOB_HISTORY.JOB_ID'
            , 79
            , 0
            , 'comment on column oehr_job_history.job_id is '||chr(10)||
              '''Job role in which the employee worked in the past foreign key to '||chr(10)||
              'job_id column in the oehr_jobs table. A not null column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_JOB_HISTORY.DEPARTMENT_ID'
            , 79
            , 0
            , 'comment on column oehr_job_history.department_id is ''Department id in which the employee worked in the past foreign key to deparment_id column in the oehr_departments table'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_CUSTOMERS'
            , 80
            , 170
            , 'create table oehr_customers'||chr(10)||
              '(  customer_id        number(6)'||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 996 maxvalue 999999 nocache nocycle)'||chr(10)||
              ' , cust_first_name    varchar2(20) '||chr(10)||
              '                      constraint cust_fname_nn not null'||chr(10)||
              ' , cust_last_name     varchar2(20)'||chr(10)||
              '                      constraint cust_lname_nn not null'||chr(10)||
              ' , street_address     varchar2(40)'||chr(10)||
              ' , postal_code        varchar2(10)'||chr(10)||
              ' , city               varchar2(30)'||chr(10)||
              ' , state_province     varchar2(10)'||chr(10)||
              ' , country_id         char(2)'||chr(10)||
              ' , phone_number       varchar2(25)'||chr(10)||
              ' , nls_language       varchar2(3)'||chr(10)||
              ' , nls_territory      varchar2(30)'||chr(10)||
              ' , credit_limit       number(9,2)'||chr(10)||
              ' , cust_email         varchar2(30)'||chr(10)||
              ' , account_mgr_id     number(6)'||chr(10)||
              ' ,   constraint oehr_cust_cl_max'||chr(10)||
              '       check (credit_limit <= 5000)'||chr(10)||
              ' ,   constraint oehr_customer_id_min'||chr(10)||
              '       check (customer_id > 0)'||chr(10)||
              ' ,   constraint oehr_cust_acct_mgr_fk'||chr(10)||
              '       foreign key (account_mgr_id)'||chr(10)||
              '       references oehr_employees(employee_id) on delete set null'||chr(10)||
              ' ,   constraint oehr_customers_pk'||chr(10)||
              '       primary key (customer_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_CUST_ACCOUNT_MANAGER_IX'
            , 81
            , 0
            , 'create index oehr_cust_account_manager_ix on oehr_customers (account_mgr_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_CUST_LNAME_IX'
            , 82
            , 0
            , 'create index oehr_cust_lname_ix on oehr_customers (cust_last_name)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_CUST_EMAIL_IX'
            , 83
            , 0
            , 'create index oehr_cust_email_ix on oehr_customers (cust_email)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_CUST_UPPER_NAME_IX'
            , 84
            , 0
            , 'create index oehr_cust_upper_name_ix on oehr_customers (upper(cust_last_name), upper(cust_first_name))'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS'
            , 88
            , 0
            , 'comment on table oehr_customers is ''Contains customers data either entered by an employee or by the customer him/herself over the Web.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.STREET_ADDRESS'
            , 89
            , 0
            , 'comment on column oehr_customers.street_address is ''Modified column to maintain customer street address.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.POSTAL_CODE'
            , 89
            , 0
            , 'comment on column oehr_customers.postal_code is ''Modified column to maintain customer postal code.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.CITY'
            , 89
            , 0
            , 'comment on column oehr_customers.city is ''Modified column to maintain customer city.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.STATE_PROVINCE'
            , 89
            , 0
            , 'comment on column oehr_customers.state_province is ''Modified column to maintain customer state or province.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.COUNTRY_ID'
            , 89
            , 0
            , 'comment on column oehr_customers.country_id is ''Modified column to maintain customer country id.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.PHONE_NUMBER'
            , 89
            , 0
            , 'comment on column oehr_customers.phone_number is ''Modified column to maintain customer phone number.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.CUST_FIRST_NAME'
            , 89
            , 0
            , 'comment on column oehr_customers.cust_first_name is ''NOT NULL constraint.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.CUST_LAST_NAME'
            , 89
            , 0
            , 'comment on column oehr_customers.cust_last_name is ''NOT NULL constraint.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.CREDIT_LIMIT'
            , 89
            , 0
            , 'comment on column oehr_customers.credit_limit is ''Check constraint.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.CUSTOMER_ID'
            , 89
            , 0
            , 'comment on column oehr_customers.customer_id is ''Primary key column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_CUSTOMERS.ACCOUNT_MGR_ID'
            , 89
            , 0
            , 'comment on column oehr_customers.account_mgr_id is ''References oehr_employees.employee_id.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_WAREHOUSES'
            , 90
            , 160
            , 'create table oehr_warehouses'||chr(10)||
              '(  warehouse_id       number(3)'||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 10 increment by 1 maxvalue 999 nocache nocycle)'||chr(10)||
              ' , warehouse_name     varchar2(35)'||chr(10)||
              ' , location_id        number(4)'||chr(10)||
              ' ,   constraint oehr_warehouses_location_fk'||chr(10)||
              '       foreign key (location_id)'||chr(10)||
              '       references oehr_locations(location_id) on delete set null'||chr(10)||
              ' ,   constraint oehr_warehouses_pk '||chr(10)||
              '       primary key (warehouse_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_WHS_LOCATION_IX'
            , 91
            , 0
            , 'create index oehr_whs_location_ix on oehr_warehouses (location_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_WAREHOUSES'
            , 98
            , 0
            , 'comment on table oehr_warehouses is ''Warehouse data unspecific to any industry.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_WAREHOUSES.WAREHOUSE_ID'
            , 99
            , 0
            , 'comment on column oehr_warehouses.warehouse_id is ''Primary key column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_WAREHOUSES.LOCATION_ID'
            , 99
            , 0
            , 'comment on column oehr_warehouses.location_id is ''Primary key column, references oehr_locations.location_id.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_ORDERS'
            , 100
            , 150
            , 'create table oehr_orders'||chr(10)||
              '(  order_id           number(12)'||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 2460 increment by 1 nocache nocycle)'||chr(10)||
              ' , order_date         timestamp with time zone'||chr(10)||
              '                      constraint order_date_nn not null'||chr(10)||
              ' , order_mode         varchar2(8)'||chr(10)||
              ' , customer_id        number(6) '||chr(10)||
              '                      constraint oehr_order_customer_id_nn not null'||chr(10)||
              ' , order_status       number(2)'||chr(10)||
              ' , order_total        number(8,2)'||chr(10)||
              ' , sales_rep_id       number(6)'||chr(10)||
              ' , promotion_id       number(6)'||chr(10)||
              ' ,   constraint oehr_order_mode_lov'||chr(10)||
              '       check (order_mode in (''direct'',''online''))'||chr(10)||
              ' ,   constraint oehr_order_total_min'||chr(10)||
              '       check (order_total >= 0)'||chr(10)||
              ' ,   constraint oehr_orders_sales_rep_fk '||chr(10)||
              '       foreign key (sales_rep_id) '||chr(10)||
              '       references oehr_employees(employee_id) on delete set null'||chr(10)||
              ' ,   constraint oehr_orders_customer_id_fk '||chr(10)||
              '       foreign key (customer_id) '||chr(10)||
              '       references oehr_customers(customer_id) on delete set null'||chr(10)||
              ' , constraint oehr_order_pk '||chr(10)||
              '     primary key (order_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_ORD_SALES_REP_IX'
            , 101
            , 0
            , 'create index oehr_ord_sales_rep_ix on oehr_orders (sales_rep_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_ORD_CUSTOMER_IX'
            , 102
            , 0
            , 'create index oehr_ord_customer_ix on oehr_orders (customer_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_ORD_ORDER_DATE_IX'
            , 103
            , 0
            , 'create index oehr_ord_order_date_ix on oehr_orders (order_date)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDERS'
            , 108
            , 0
            , 'comment on table oehr_orders is ''Contains orders entered by a salesperson as well as over the Web.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDERS.ORDER_STATUS'
            , 109
            , 0
            , 'comment on column oehr_orders.order_status is '||chr(10)||
              '''0: Not fully entered, 1: Entered, 2: Canceled - bad credit, -'||chr(10)||
              '3: Canceled - by customer, 4: Shipped - whole order, -'||chr(10)||
              '5: Shipped - replacement items, 6: Shipped - backlog on items, -'||chr(10)||
              '7: Shipped - special delivery, 8: Shipped - billed, 9: Shipped - payment plan,-'||chr(10)||
              '10: Shipped - paid'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDERS.ORDER_DATE'
            , 109
            , 0
            , 'comment on column oehr_orders.order_date is ''TIMESTAMP WITH TIME ZONE column, NOT NULL constraint.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDERS.ORDER_ID'
            , 109
            , 0
            , 'comment on column oehr_orders.order_id is ''PRIMARY KEY column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDERS.SALES_REP_ID'
            , 109
            , 0
            , 'comment on column oehr_orders.sales_rep_id is ''References oehr_employees.employee_id.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDERS.PROMOTION_ID'
            , 109
            , 0
            , 'comment on column oehr_orders.promotion_id is ''Sales promotion ID. Used in SH schema'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDERS.ORDER_MODE'
            , 109
            , 0
            , 'comment on column oehr_orders.order_mode is ''CHECK constraint.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDERS.ORDER_TOTAL'
            , 109
            , 0
            , 'comment on column oehr_orders.order_total is ''CHECK constraint.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_PRODUCT_INFORMATION'
            , 110
            , 140
            , 'create table oehr_product_information'||chr(10)||
              '(  product_id          number(6)'||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 3520 increment by 1 maxvalue 999999 nocache nocycle)'||chr(10)||
              '   constraint oehr_product_info_pk'||chr(10)||
              '   primary key'||chr(10)||
              ' , product_name        varchar2(50)'||chr(10)||
              ' , product_description varchar2(2000)'||chr(10)||
              ' , category_id         number(2)'||chr(10)||
              ' , weight_class        number(1)'||chr(10)||
              ' , warranty_period     interval year to month'||chr(10)||
              ' , supplier_id         number(6)'||chr(10)||
              ' , product_status      varchar2(20)'||chr(10)||
              ' , list_price          number(8,2)'||chr(10)||
              ' , min_price           number(8,2)'||chr(10)||
              ' , catalog_url         varchar2(50)'||chr(10)||
              ' ,  constraint oehr_product_status_lov'||chr(10)||
              '      check (product_status in (  ''orderable'''||chr(10)||
              '                                , ''planned'''||chr(10)||
              '                                , ''under development'''||chr(10)||
              '                                , ''obsolete''))'||chr(10)||
            ')'
          );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_PROD_SUPPLIER_IX'
            , 111
            , 0
            , 'create index oehr_prod_supplier_ix on oehr_product_information (supplier_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_INFORMATION'
            , 118
            , 0
            , 'comment on table oehr_product_information is ''Non-industry-specific data in various categories.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_INFORMATION.PRODUCT_ID'
            , 119
            , 0
            , 'comment on column oehr_product_information.product_id is ''Primary key column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_INFORMATION.PRODUCT_DESCRIPTION'
            , 119
            , 0
            , 'comment on column oehr_product_information.product_description is '||chr(10)||
              '''Primary language description corresponding to translated_description in'||chr(10)||
              'oehr_product_descriptions, added to provide non-NLS text columns for OC views to access.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_INFORMATION.CATEGORY_ID'
            , 119
            , 0
            , 'comment on column oehr_product_information.category_id is ''Low cardinality column, can be used for bitmap index. Schema SH uses it as foreign key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_INFORMATION.WEIGHT_CLASS'
            , 119
            , 0
            , 'comment on column oehr_product_information.weight_class is ''Low cardinality column, can be used for bitmap index.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_INFORMATION.WARRANTY_PERIOD'
            , 119
            , 0
            , 'comment on column oehr_product_information.warranty_period is ''INTERVAL YEAER TO MONTH column, low cardinality, can be used for bitmap index.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_INFORMATION.SUPPLIER_ID'
            , 119
            , 0
            , 'comment on column oehr_product_information.supplier_id is ''Offers possibility of extensions outside Common Schema.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_INFORMATION.PRODUCT_STATUS'
            , 119
            , 0
            , 'comment on column oehr_product_information.product_status is'||chr(10)||
              '''Check constraint. Appropriate for complex rules, such as "All products in '||chr(10)||
              'status PRODUCTION must have at least one inventory entry." Also appropriate '||chr(10)||
              'for a trigger auditing status change.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_ORDER_ITEMS'
            , 120
            , 130
            , 'create table oehr_order_items'||chr(10)||
              '(  order_id           number(12)'||chr(10)||
              ' , line_item_id       number(3)'||chr(10)||
              '                      constraint ord_item_line_item_nn not null'||chr(10)||
              ' , product_id         number(6)'||chr(10)||
              '                      constraint ord_item_prod_nn not null'||chr(10)||
              ' , unit_price         number(8,2)'||chr(10)||
              ' , quantity           number(8)'||chr(10)||
              ' , order_item_id      number(12) '||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 665 increment by 1 maxvalue 999999999999 nocache nocycle)'||chr(10)||
              ' ,   constraint oehr_order_items_order_id_fk '||chr(10)||
              '       foreign key (order_id)'||chr(10)||
              '       references oehr_orders(order_id) on delete cascade'||chr(10)||
              ' ,   constraint oehr_order_items_product_id_fk '||chr(10)||
              '       foreign key (product_id)'||chr(10)||
              '       references oehr_product_information(product_id)'||chr(10)||
              ' ,   constraint oehr_order_items_pk'||chr(10)||
              '       primary key (order_item_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_ORDER_ITEMS_UK'
            , 121
            , 0
            , 'create unique index oehr_order_items_uk on oehr_order_items (order_id, product_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_ITEM_ORDER_IX'
            , 122
            , 0
            , 'create index oehr_item_order_ix on oehr_order_items (order_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_ITEM_PRODUCT_IX'
            , 123
            , 0
            , 'create index oehr_item_product_ix on oehr_order_items (product_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TRIGGER'
            , 'OEHR_OI_PK'
            , 125
            , 0
            , 'create or replace trigger  oehr_oi_pk'||chr(10)||
              '  before insert on oehr_order_items'||chr(10)||
              '  for each row'||chr(10)||
              'declare'||chr(10)||
              '  new_line number;'||chr(10)||
              'begin'||chr(10)||
              '  if :new.line_item_id is null then'||chr(10)||
              '    select (nvl(max(line_item_id),0)+1) '||chr(10)||
              '    into new_line  '||chr(10)||
              '    from oehr_order_items '||chr(10)||
              '    where order_id = :new.order_id;  '||chr(10)||
              '    :new.line_item_id := new_line;  '||chr(10)||
              '  end if;'||chr(10)||
              'end;'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDER_ITEMS'
            , 128
            , 0
            , 'comment on table oehr_order_items is ''Example of many-to-many resolution.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDER_ITEMS.ORDER_ID'
            , 129
            , 0
            , 'comment on column oehr_order_items.order_id is ''Part of concatenated primary key, references orders.order_id.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDER_ITEMS.PRODUCT_ID'
            , 129
            , 0
            , 'comment on column oehr_order_items.product_id is ''References oehr_product_information.product_id.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_ORDER_ITEMS.LINE_ITEM_ID'
            , 129
            , 0
            , 'comment on column oehr_order_items.line_item_id is ''Part of concatenated primary key.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_PRODUCT_DESCRIPTIONS'
            , 130
            , 120
            , 'create table oehr_product_descriptions'||chr(10)||
              '( product_id             number(6)'||chr(10)||
              ', language_id            varchar2(3)'||chr(10)||
              ', translated_name        nvarchar2(50)'||chr(10)||
              '                         constraint oehr_translated_name_nn'||chr(10)||
              '                         not null'||chr(10)||
              ', translated_description nvarchar2(2000)'||chr(10)||
              '                         constraint oehr_translated_desc_nn'||chr(10)||
              '                         not null'||chr(10)||
              ' ,  constraint oehr_pd_product_id_fk'||chr(10)||
              '      foreign key (product_id)'||chr(10)||
              '      references oehr_product_information(product_id)'||chr(10)||
              ',   constraint oehr_prod_desc_pk '||chr(10)||
              '      primary key (product_id, language_id)'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_PROD_DESC_PROD_IX'
            , 131
            , 0
            , 'create index oehr_prod_desc_prod_ix on oehr_product_descriptions (product_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_PROD_DESC_TRANSLATED_IX'
            , 132
            , 0
            , 'create index oehr_prod_desc_translated_ix on oehr_product_descriptions (translated_name)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_DESCRIPTIONS'
            , 138
            , 0
            , 'comment on table oehr_product_descriptions is ''Non-industry-specific design, allows selection of NLS-setting-specific data derived at runtime, for example using the products view.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_DESCRIPTIONS.PRODUCT_ID'
            , 139
            , 0
            , 'comment on column oehr_product_descriptions.product_id is ''Primary key column.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCT_DESCRIPTIONS.LANGUAGE_ID'
            , 139
            , 0
            , 'comment on column oehr_product_descriptions.language_id is ''Primary key column.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_INVENTORIES'
            , 140
            , 110
            , 'create table oehr_inventories'||chr(10)||
              '(  product_id         number(6)'||chr(10)||
              ' , warehouse_id       number(3) '||chr(10)||
              '                      constraint oehr_inventory_warehouse_id_nn not null'||chr(10)||
              ' , quantity_on_hand   number(8)'||chr(10)||
              '                      constraint oehr_inventory_qoh_nn not null'||chr(10)||
              ' ,   constraint oehr_inventories_warehouses_fk '||chr(10)||
              '       foreign key (warehouse_id)'||chr(10)||
              '       references oehr_warehouses (warehouse_id)'||chr(10)||
              ' ,   constraint oehr_inventories_product_id_fk '||chr(10)||
              '       foreign key (product_id)'||chr(10)||
              '       references oehr_product_information (product_id)'||chr(10)||
              ' ,   constraint oehr_inventory_pk '||chr(10)||
              '       primary key (product_id, warehouse_id) disable novalidate'||chr(10)||
              ')'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_INVENTORY_IX'
            , 141
            , 0
            , 'create index oehr_inventory_ix on oehr_inventories (warehouse_id,product_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'INDEX'
            , 'OEHR_INV_PRODUCT_IX'
            , 142
            , 0
            , 'create index oehr_inv_product_ix on oehr_inventories (product_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_INVENTORIES'
            , 148
            , 0
            , 'comment on table oehr_inventories is ''Tracks availability of products by product_it and warehouse_id.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_INVENTORIES.PRODUCT_ID'
            , 149
            , 0
            , 'comment on column oehr_inventories.product_id is ''Part of concatenated primary key, references oehr_product_information.product_id.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_INVENTORIES.WAREHOUSE_ID'
            , 149
            , 0
            , 'comment on column oehr_inventories.warehouse_id is ''Part of concatenated primary key, references oehr_warehouses.warehouse_id.'''
           );


    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'TABLE'
            , 'OEHR_PROMOTIONS'
            , 150
            , 100
            , 'create table oehr_promotions '||chr(10)||
              '(  promo_id number(6)'||chr(10)||
              '   generated by default on null as identity '||chr(10)||
              '   (start with 3 increment by 1 maxvalue 999999 nocache nocycle)'||chr(10)||
              ' , promo_name varchar2(20)'||chr(10)||
              ' ,   constraint oehr_promo_id_pk '||chr(10)||
              '       primary key (promo_id)'||chr(10)||
              ')'
           );

    -----------------------------------------------------------
    -- Create Views
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_EMP_DETAILS_VIEW'
            , 160
            , 90
            , 'create or replace view oehr_emp_details_view'||chr(10)||
              '  (employee_id,'||chr(10)||
              '   job_id,'||chr(10)||
              '   manager_id,'||chr(10)||
              '   department_id,'||chr(10)||
              '   location_id,'||chr(10)||
              '   country_id,'||chr(10)||
              '   first_name,'||chr(10)||
              '   last_name,'||chr(10)||
              '   salary,'||chr(10)||
              '   commission_pct,'||chr(10)||
              '   department_name,'||chr(10)||
              '   job_title,'||chr(10)||
              '   city,'||chr(10)||
              '   state_province,'||chr(10)||
              '   country_name,'||chr(10)||
              '   region_name)'||chr(10)||
              'as select'||chr(10)||
              '  e.employee_id, '||chr(10)||
              '  e.job_id, '||chr(10)||
              '  e.manager_id, '||chr(10)||
              '  e.department_id,'||chr(10)||
              '  d.location_id,'||chr(10)||
              '  l.country_id,'||chr(10)||
              '  e.first_name,'||chr(10)||
              '  e.last_name,'||chr(10)||
              '  e.salary,'||chr(10)||
              '  e.commission_pct,'||chr(10)||
              '  d.department_name,'||chr(10)||
              '  j.job_title,'||chr(10)||
              '  l.city,'||chr(10)||
              '  l.state_province,'||chr(10)||
              '  c.country_name,'||chr(10)||
              '  r.region_name'||chr(10)||
              'from'||chr(10)||
              '  oehr_employees e,'||chr(10)||
              '  oehr_departments d,'||chr(10)||
              '  oehr_jobs j,'||chr(10)||
              '  oehr_locations l,'||chr(10)||
              '  oehr_countries c,'||chr(10)||
              '  oehr_regions r'||chr(10)||
              'where e.department_id = d.department_id'||chr(10)||
              '  and d.location_id = l.location_id'||chr(10)||
              '  and l.country_id = c.country_id'||chr(10)||
              '  and c.region_id = r.region_id'||chr(10)||
              '  and j.job_id = e.job_id '||chr(10)||
              'with read only'
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_PRODUCTS'
            , 170
            , 80
            , 'create or replace view oehr_products'||chr(10)||
              'as'||chr(10)||
              'select i.product_id'||chr(10)||
              ',      d.language_id'||chr(10)||
              ',      case when d.language_id is not null'||chr(10)||
              '            then d.translated_name'||chr(10)||
              '            else translate(i.product_name using nchar_cs)'||chr(10)||
              '       end    as product_name'||chr(10)||
              ',      i.category_id'||chr(10)||
              ',      case when d.language_id is not null'||chr(10)||
              '            then d.translated_description'||chr(10)||
              '            else translate(i.product_description using nchar_cs)'||chr(10)||
              '       end    as product_description'||chr(10)||
              ',      i.weight_class'||chr(10)||
              ',      i.warranty_period'||chr(10)||
              ',      i.supplier_id'||chr(10)||
              ',      i.product_status'||chr(10)||
              ',      i.list_price'||chr(10)||
              ',      i.min_price'||chr(10)||
              ',      i.catalog_url'||chr(10)||
              'from   oehr_product_information  i'||chr(10)||
              ',      oehr_product_descriptions d'||chr(10)||
              'where  d.product_id  (+) = i.product_id'||chr(10)||
              'and    d.language_id (+) = sys_context(''USERENV'',''LANG'')'
           );
insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_PRODUCTS'
            , 171
            , 0
            , 'comment on table oehr_products is'||chr(10)||
              '''This view joins oehr_product_information and oehr_product_descriptions, using NLS'||chr(10)||
              'settings to pick the appropriate language-specific product description.'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_SYDNEY_INVENTORY'
            , 180
            , 70
            , 'create or replace view oehr_sydney_inventory'||chr(10)||
              'as'||chr(10)||
              'select p.product_id'||chr(10)||
              ',      p.product_name'||chr(10)||
              ',      i.quantity_on_hand'||chr(10)||
              'from   oehr_inventories i'||chr(10)||
              ',      oehr_warehouses  w'||chr(10)||
              ',      oehr_products    p  '||chr(10)||
              'where  p.product_id = i.product_id'||chr(10)||
              'and    i.warehouse_id = w.warehouse_id'||chr(10)||
              'and    w.warehouse_name = ''Sydney'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_SYDNEY_INVENTORY'
            , 181
            , 0
            , 'comment on table oehr_sydney_inventory is ''This view shows inventories at the Sydney warehouse.'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_BOMBAY_INVENTORY'
            , 190
            , 60
            , 'create or replace view oehr_bombay_inventory'||chr(10)||
              'as'||chr(10)||
              'select p.product_id'||chr(10)||
              ',      p.product_name'||chr(10)||
              ',      i.quantity_on_hand'||chr(10)||
              'from   oehr_inventories i'||chr(10)||
              ',      oehr_warehouses  w'||chr(10)||
              ',      oehr_products    p   '||chr(10)||
              'where  p.product_id = i.product_id'||chr(10)||
              'and    i.warehouse_id = w.warehouse_id'||chr(10)||
              'and    w.warehouse_name = ''Bombay'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_BOMBAY_INVENTORY'
            , 191
            , 0
            , 'comment on table oehr_bombay_inventory is ''This view shows inventories at the Bombay warehouse.'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_TORONTO_INVENTORY'
            , 200
            , 50
            , 'create or replace view oehr_toronto_inventory'||chr(10)||
              'as'||chr(10)||
              'select p.product_id'||chr(10)||
              ',      p.product_name'||chr(10)||
              ',      i.quantity_on_hand'||chr(10)||
              'from   oehr_inventories i'||chr(10)||
              ',      oehr_warehouses  w'||chr(10)||
              ',      oehr_products    p   '||chr(10)||
              'where  p.product_id = i.product_id'||chr(10)||
              'and    i.warehouse_id = w.warehouse_id'||chr(10)||
              'and    w.warehouse_name = ''Toronto'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'COMMENT'
            , 'OEHR_BOMBAY_INVENTORY'
            , 201
            , 0
            , 'comment on table oehr_bombay_inventory is ''This view shows inventories at the Toronto warehouse.'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_PRODUCT_PRICES'
            , 210
            , 40
            , 'create or replace view oehr_product_prices'||chr(10)||
              'as'||chr(10)||
              'select category_id'||chr(10)||
              ',      count(*)        as "#_OF_PRODUCTS"'||chr(10)||
              ',      min(list_price) as low_price'||chr(10)||
              ',      max(list_price) as high_price'||chr(10)||
              'from   oehr_product_information'||chr(10)||
              'group by category_id'
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_ACCOUNT_MANAGERS'
            , 220
            , 30
            , 'create or replace view oehr_account_managers '||chr(10)||
              'as'||chr(10)||
              'select    c.account_mgr_id    acct_mgr,'||chr(10)||
              '    cr.region_id      region, '||chr(10)||
              '    c.country_id                  country,'||chr(10)||
              '    c.state_province          province, '||chr(10)||
              '    count(*)      num_customers'||chr(10)||
              'from    oehr_customers c, oehr_countries cr'||chr(10)||
              'where   c.country_id = cr.country_id'||chr(10)||
              'group by rollup (  c.account_mgr_id'||chr(10)||
              '                 , cr.region_id'||chr(10)||
              '                 , c.country_id'||chr(10)||
              '                 , c.state_province'||chr(10)||
              '                )'
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_CUSTOMERS_VIEW'
            , 230
            , 20
            , 'create or replace view oehr_customers_view'||chr(10)||
              'as select '||chr(10)||
              '  c.customer_id,'||chr(10)||
              '  c.cust_first_name,'||chr(10)||
              '  c.cust_last_name,'||chr(10)||
              '  c.street_address,'||chr(10)||
              '  c.postal_code,'||chr(10)||
              '  c.city,'||chr(10)||
              '  c.state_province,'||chr(10)||
              '  co.country_id,'||chr(10)||
              '  co.country_name,'||chr(10)||
              '  co.region_id,'||chr(10)||
              '  c.nls_language,'||chr(10)||
              '  c.nls_territory,'||chr(10)||
              '  c.credit_limit,'||chr(10)||
              '  c.cust_email,'||chr(10)||
              '  c.phone_number,'||chr(10)||
              '  c.account_mgr_id'||chr(10)||
              'from '||chr(10)||
              '  oehr_countries co,'||chr(10)||
              '  oehr_customers c'||chr(10)||
              'where '||chr(10)||
              '  c.country_id = co.country_id(+)'
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  3
            , 'VIEW'
            , 'OEHR_ORDERS_VIEW'
            , 240
            , 10
            , 'create or replace view oehr_orders_view'||chr(10)||
              'as '||chr(10)||
              'select order_id,'||chr(10)||
              '  to_date(to_char(order_date,''DD-MON-YY HH:MI:SS''),''DD-MON-YY HH:MI:SS'')    order_date,'||chr(10)||
              'order_mode,'||chr(10)||
              'customer_id,'||chr(10)||
              'order_status,'||chr(10)||
              'order_total,'||chr(10)||
              'sales_rep_id,'||chr(10)||
              'promotion_id'||chr(10)||
              'from oehr_orders'
           );
end;
/
-- *******************
-- *******************
-- **  Spreadsheet  **
-- *******************
-- *******************
begin
    -----------------------------------------------------------
    -- Create Tables
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  4
            , 'TABLE'
            , 'EBA_TASKS_SS'
            , 10
            , 10
            , 'create table eba_tasks_ss ('||chr(10)||
              'id                   number  '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     constraint eba_tasks_ss_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'project              varchar2(30) not null,'||chr(10)||
              'task_name            varchar2(255),'||chr(10)||
              'start_date           date not null,'||chr(10)||
              'end_date             date,'||chr(10)||
              'status               varchar2(30) not null,'||chr(10)||
              'assigned_to          varchar2(30),'||chr(10)||
              'cost                 number,'||chr(10)||
              'budget               number,'||chr(10)||
              'created              timestamp with time zone not null,'||chr(10)||
              'created_by           varchar2(255)            not null,'||chr(10)||
              'updated              timestamp with time zone not null,'||chr(10)||
              'updated_by           varchar2(255)            not null )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  4
            , 'CONSTRAINT'
            , 'EBA_TASKS_SS_UK'
            , 11
            , 0
            , 'alter table eba_tasks_ss add constraint eba_tasks_ss_uk unique (project, task_name)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  4
            , 'TRIGGER'
            , 'EBA_TASKS_SS_BIU'
            , 12
            , 0
            , 'create or replace trigger eba_tasks_ss_biu'||chr(10)||
              '    before insert or update on eba_tasks_ss'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created    := current_timestamp;'||chr(10)||
              '        :new.created_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.updated    := current_timestamp;'||chr(10)||
              '    :new.updated_by := nvl(wwv_flow.g_user,user);'||chr(10)||
              'end;'
           );
end;
/
-- ***********************
-- ***********************
-- **  Customer Orders  **
-- ***********************
-- ***********************
begin
    -----------------------------------------------------------
    -- Create Tables
    -----------------------------------------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'TABLE'
            , 'CUSTOMERS'
            , 10
            , 100
            , 'create table customers ('||chr(10)||
              'customer_id          number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     (start with 400 increment by 1 nocache nocycle)'||chr(10)|| 
              '                     constraint customers_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'full_name            varchar2(255) not null,'||chr(10)||
              'email_address        varchar2(255) not null)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'CUSTOMERS_EMAIL_U'
            , 11
            , 0
            , 'alter table customers add constraint customers_email_u unique (email_address)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'INDEX'
            , 'CUSTOMERS_NAME_I'
            , 12
            , 0
            , 'create index customers_name_i on customers (full_name)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMERS'
            , 14
            , 0
            , 'comment on table customers is ''Details of the people placing orders'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMERS.CUSTOMER_ID'
            , 15
            , 0
            , 'comment on column customers.customer_id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMERS.EMAIL_ADDRESS'
            , 15
            , 0
            , 'comment on column customers.email_address is ''The email address the person uses to access the account'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMERS.FULL_NAME'
            , 15
            , 0
            , 'comment on column customers.full_name is ''What this customer is called'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'TABLE'
            , 'STORES'
            , 20
            , 90
            , 'create table stores ('||chr(10)||
              'store_id             number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     (start with 25 increment by 1 nocache nocycle)'||chr(10)|| 
              '                     constraint stores_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'store_name           varchar2(255) not null,'||chr(10)||
              'web_address          varchar2(100),'||chr(10)||
              'physical_address     varchar2(512),'||chr(10)||
              'latitude             number,'||chr(10)||
              'longitude            number,'||chr(10)||
              'logo                 blob,'||chr(10)||
              'logo_mime_type       varchar2(512),'||chr(10)||
              'logo_filename        varchar2(512),'||chr(10)||
              'logo_charset         varchar2(512),'||chr(10)||
              'logo_last_updated    date)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'STORE_NAME_U'
            , 21
            , 0
            , 'alter table stores add constraint store_name_u unique (store_name)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'STORE_AT_LEAST_ONE_ADDRESS_C'
            , 22
            , 0
            , 'alter table stores add constraint store_at_least_one_address_c check (coalesce ( web_address, physical_address ) is not null)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES'
            , 24
            , 0
            , 'comment on table stores is ''Physical and virtual locations where people can purchase products'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.STORE_ID'
            , 25
            , 0
            , 'comment on column stores.store_id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.STORE_NAME'
            , 25
            , 0
            , 'comment on column stores.store_name is ''What the store is called'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.WEB_ADDRESS'
            , 25
            , 0
            , 'comment on column stores.web_address is ''The URL of a virtual store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.PHYSICAL_ADDRESS'
            , 25
            , 0
            , 'comment on column stores.physical_address is ''The postal address of this location'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.LATITUDE'
            , 25
            , 0
            , 'comment on column stores.latitude is ''The north-south position of a physical store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.LONGITUDE'
            , 25
            , 0
            , 'comment on column stores.longitude is ''The east-west position of a physical store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.LOGO'
            , 25
            , 0
            , 'comment on column stores.logo is ''An image used by this store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.LOGO_MIME_TYPE'
            , 25
            , 0
            , 'comment on column stores.logo_mime_type is ''The mime-type of the store logo'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.LOGO_FILENAME'
            , 25
            , 0
            , 'comment on column stores.logo_filename is ''The name of the file loaded in the image column'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.LOGO_CHARSET'
            , 25
            , 0
            , 'comment on column stores.logo_charset is ''The character set used to encode the image'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORES.LOGO_LAST_UPDATED'
            , 25
            , 0
            , 'comment on column stores.logo_last_updated is ''The date the image was last changed'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'TABLE'
            , 'PRODUCTS'
            , 30
            , 80
            , 'create table products ('||chr(10)||
              'product_id           number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     (start with 50 increment by 1 nocache nocycle)'||chr(10)|| 
              '                     constraint products_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'product_name         varchar2(255) not null,'||chr(10)||
              'unit_price           number(10,2),'||chr(10)||
              'product_details      blob,'||chr(10)||
              'product_image        blob,'||chr(10)||
              'image_mime_type      varchar2(512),'||chr(10)||
              'image_filename       varchar2(512),'||chr(10)||
              'image_charset        varchar2(512),'||chr(10)||
              'image_last_updated   date)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'PRODUCT_JSON_C'
            , 31
            , 0
            , 'alter table products add constraint product_json_c check (product_details is json)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS'
            , 33
            , 0
            , 'comment on table products is ''Details of goods that customers can purchase'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.PRODUCT_ID'
            , 34
            , 0
            , 'comment on column products.product_id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.PRODUCT_NAME'
            , 34
            , 0
            , 'comment on column products.product_name is ''What a product is called'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.UNIT_PRICE'
            , 34
            , 0
            , 'comment on column products.unit_price is ''The monetary value of one item of this producty'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.PRODUCT_DETAILS'
            , 34
            , 0
            , 'comment on column products.product_details is ''Further details of the product stored in JSON format'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.PRODUCT_IMAGE'
            , 34
            , 0
            , 'comment on column products.product_image is ''A picture of the product'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.IMAGE_MIME_TYPE'
            , 34
            , 0
            , 'comment on column products.image_mime_type is ''The mime-type of the product image'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.IMAGE_FILENAME'
            , 34
            , 0
            , 'comment on column products.image_filename is ''The name of the file loaded in the image column'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.IMAGE_CHARSET'
            , 34
            , 0
            , 'comment on column products.image_charset is ''The character set used to encode the image'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCTS.IMAGE_LAST_UPDATED'
            , 34
            , 0
            , 'comment on column products.image_last_updated is ''The date the image was last changed'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'TABLE'
            , 'ORDERS'
            , 40
            , 70
            , 'create table orders ('||chr(10)||
              'order_id             number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     (start with 2000 increment by 1 nocache nocycle)'||chr(10)|| 
              '                     constraint orders_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'order_datetime       timestamp not null,'||chr(10)||
              'customer_id          number not null,'||chr(10)||
              'order_status         varchar2(10) not null,'||chr(10)||
              'store_id             number not null)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'ORDERS_CUSTOMER_ID_FK'
            , 41
            , 0
            , 'alter table orders add constraint orders_customer_id_fk'||chr(10)||
              '  foreign key (customer_id) references customers (customer_id)'||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'INDEX'
            , 'ORDERS_CUSTOMER_ID_I'
            , 42
            , 0
            , 'create index orders_customer_id_i on orders (customer_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'ORDER_STATUS_C'
            , 43
            , 0
            , 'alter table orders add constraint order_status_c check (order_status in (''CANCELLED'',''COMPLETE'',''OPEN'',''PAID'',''REFUNDED'',''SHIPPED''))'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'ORDERS_STORE_ID_FK'
            , 44
            , 0
            , 'alter table orders add constraint orders_store_id_fk'||chr(10)||
              '  foreign key (store_id) references stores (store_id)'||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'INDEX'
            , 'ORDERS_STORE_ID_I'
            , 45
            , 0
            , 'create index orders_store_id_i on orders (store_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDERS'
            , 47
            , 0
            , 'comment on table orders is ''Details of who made purchases where'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDERS.ORDER_ID'
            , 48
            , 0
            , 'comment on column orders.order_id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDERS.ORDER_DATETIME'
            , 48
            , 0
            , 'comment on column orders.order_datetime is ''When the order was placed'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDERS.CUSTOMER_ID'
            , 48
            , 0
            , 'comment on column orders.customer_id is ''Who placed this order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDERS.ORDER_STATUS'
            , 48
            , 0
            , 'comment on column orders.order_status is ''What state the order is in. Valid values are:
OPEN - the order is in progress.
PAID - money has been received from the customer for this order.
SHIPPED - the products have been dispatched to the customer.
COMPLETE - the customer has received the order.
CANCELLED - the customer has stopped the order.
REFUNDED - there has been an issue with the order and the money has been returned to the customer.'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDERS.STORE_ID'
            , 48
            , 0
            , 'comment on column orders.store_id is ''Where this order was placed'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'TABLE'
            , 'ORDER_ITEMS'
            , 50
            , 60
            , 'create table order_items ('||chr(10)||
              'order_id             number not null,'||chr(10)||
              'line_item_id         number not null,'||chr(10)||
              'product_id           number not null,'||chr(10)||
              'unit_price           number(10,2) not null,'||chr(10)||
              'quantity             number not null)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'ORDER_ITEMS_PK'
            , 51
            , 0
            , 'alter table order_items add constraint order_items_pk primary key (order_id, line_item_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'ORDER_ITEMS_ORDER_ID_FK'
            , 52
            , 0
            , 'alter table order_items add constraint order_items_order_id_fk'||chr(10)||
              '  foreign key (order_id) references orders (order_id)'||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'ORDER_ITEMS_PRODUCT_ID_FK'
            , 53
            , 0
            , 'alter table order_items add constraint order_items_product_id_fk'||chr(10)||
              '  foreign key (product_id) references products (product_id)'||chr(10)||
              '  on delete cascade'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'CONSTRAINT'
            , 'ORDER_ITEMS_PRODUCT_U'
            , 54
            , 0
            , 'alter table order_items add constraint order_items_product_u unique (product_id, order_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDER_ITEMS'
            , 56
            , 0
            , 'comment on table order_items is ''Details of which products the customer has purchased in an order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDER_ITEMS.ORDER_ID'
            , 57
            , 0
            , 'comment on column order_items.order_id is ''The order these products belong to'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDER_ITEMS.LINE_ITEM_ID'
            , 57
            , 0
            , 'comment on column order_items.line_item_id is ''An incrementing number, starting at one for each order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDER_ITEMS.PRODUCT_ID'
            , 57
            , 0
            , 'comment on column order_items.product_id is ''Which item was purchased'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDER_ITEMS.UNIT_PRICE'
            , 57
            , 0
            , 'comment on column order_items.unit_price is ''How much the customer paid for one item of the product'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'ORDER_ITEMS.QUANTITY'
            , 57
            , 0
            , 'comment on column order_items.quantity is ''How many items of this product the customer purchased'''
           );

    ----------------------------
    --  Customer Order Views  --
    ----------------------------
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'VIEW'
            , 'CUSTOMER_ORDER_PRODUCTS'
            , 60
            , 50
            , 'create view customer_order_products as'||chr(10)||
              'select o.order_id'||chr(10)||
              ',      o.order_datetime'||chr(10)||
              ',      o.order_status'||chr(10)||
              ',      c.customer_id'||chr(10)||
              ',      c.email_address'||chr(10)||
              ',      c.full_name'||chr(10)||
              ',      sum ( oi.quantity * oi.unit_price ) order_total'||chr(10)||
              ',      listagg (p.product_name, '', '''||
              ' on overflow truncate ''...'' with count)'||chr(10)||
              '         within group ( order by oi.line_item_id ) items'||chr(10)||
              'from orders o'||chr(10)||
              'join order_items oi'||chr(10)||
              '  on o.order_id = oi.order_id'||chr(10)||
              'join customers c'||chr(10)||
              '  on o.customer_id = c.customer_id'||chr(10)||
              'join products p'||chr(10)||
              '  on oi.product_id = p.product_id'||chr(10)||
              'group by o.order_id'||chr(10)||
              ',        o.order_datetime'||chr(10)||
              ',        o.order_status'||chr(10)||
              ',        c.customer_id'||chr(10)||
              ',        c.email_address'||chr(10)||
              ',        c.full_name'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS'
            , 61
            , 0
            , 'comment on table customer_order_products is ''A summary of who placed each order and what they bought'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS.ORDER_ID'
            , 62
            , 0
            , 'comment on column customer_order_products.order_id is ''The primary key of the order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS.ORDER_DATETIME'
            , 62
            , 0
            , 'comment on column customer_order_products.order_datetime is ''The date and time the order was placed'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS.ORDER_STATUS'
            , 62
            , 0
            , 'comment on column customer_order_products.order_status is ''The current state of this order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS.CUSTOMER_ID'
            , 62
            , 0
            , 'comment on column customer_order_products.customer_id is ''The primary key of the customer'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS.EMAIL_ADDRESS'
            , 62
            , 0
            , 'comment on column customer_order_products.email_address is ''The email address the person uses to access the account'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS.FULL_NAME'
            , 62
            , 0
            , 'comment on column customer_order_products.full_name is ''What this customer is called'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS.ORDER_TOTAL'
            , 62
            , 0
            , 'comment on column customer_order_products.order_total is ''The total amount the customer paid for the order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'CUSTOMER_ORDER_PRODUCTS.items'
            , 62
            , 0
            , 'comment on column customer_order_products.items is ''A comma-separated list naming the products in this order'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'VIEW'
            , 'STORE_ORDERS'
            , 70
            , 40
            , 'create view store_orders as'||chr(10)||
              'select case'||chr(10)||
              '         grouping_id ( store_name, order_status )'||chr(10)||
              '           when 1 then ''STORE TOTAL'''||chr(10)||
              '           when 2 then ''STATUS TOTAL'''||chr(10)||
              '           when 3 then ''GRAND TOTAL'''||chr(10)||
              '       end total'||chr(10)||
              ',      s.store_name'||chr(10)||
              ',      coalesce ( s.web_address, s.physical_address ) address'||chr(10)||
              ',      s.latitude'||chr(10)||
              ',      s.longitude'||chr(10)||
              ',      o.order_status'||chr(10)||
              ',      count ( distinct o.order_id ) order_count'||chr(10)||
              ',      sum ( oi.quantity * oi.unit_price ) total_sales'||chr(10)||
              'from stores s'||chr(10)||
              'join orders o'||chr(10)||
              '  on s.store_id = o.store_id'||chr(10)||
              'join order_items oi'||chr(10)||
              '  on o.order_id = oi.order_id'||chr(10)||
              'group by grouping sets (  (s.store_name, coalesce(s.web_address,s.physical_address), s.latitude, s.longitude)'||chr(10)||
              '                        , (s.store_name, coalesce(s.web_address,s.physical_address), s.latitude, s.longitude, o.order_status)'||chr(10)||
              '                        , o.order_status'||chr(10)||
              '                        , ()'||chr(10)||
              '                       )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS'
            , 71
            , 0
            , 'comment on table store_orders is ''A summary of what was purchased at each location, including summaries each store, order status and overall total'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS.TOTAL'
            , 72
            , 0
            , 'comment on column store_orders.total is ''Indicates what type of total is displayed, including Store, Status, or Grand Totals'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS.STORE_NAME'
            , 72
            , 0
            , 'comment on column store_orders.store_name is ''What the store is called'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS.ADDRESS'
            , 72
            , 0
            , 'comment on column store_orders.address is ''The physical or virtual location of this store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS.LATITUDE'
            , 72
            , 0
            , 'comment on column store_orders.latitude is ''The north-south position of a physical store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS.LONGITUDE'
            , 72
            , 0
            , 'comment on column store_orders.longitude is ''The east-west position of a physical store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS.ORDER_STATUS'
            , 72
            , 0
            , 'comment on column store_orders.order_status is ''The current state of this order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS.ORDER_COUNT'
            , 72
            , 0
            , 'comment on column store_orders.order_count is ''The primary key of the order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS.TOTAL_SALES'
            , 72
            , 0
            , 'comment on column store_orders.total_sales is ''The total value of orders placed'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'VIEW'
            , 'STORE_ORDERS_STATUS'
            , 80
            , 30
            , 'create view store_orders_status as'||chr(10)||
              'select s.store_name'||chr(10)||
              ',      coalesce ( s.web_address, s.physical_address ) address'||chr(10)||
              ',      s.latitude'||chr(10)||
              ',      s.longitude'||chr(10)||
              ',      o.order_status'||chr(10)||
              ',      count ( distinct o.order_id ) order_count'||chr(10)||
              ',      sum ( oi.quantity * oi.unit_price ) total_sales'||chr(10)||
              'from stores s'||chr(10)||
              'join orders o'||chr(10)||
              '  on s.store_id = o.store_id'||chr(10)||
              'join order_items oi'||chr(10)||
              '  on o.order_id = oi.order_id'||chr(10)||
              'group by s.store_name, coalesce ( s.web_address, s.physical_address ), s.latitude, s.longitude, o.order_status'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS_STATUS'
            , 81
            , 0
            , 'comment on table store_orders_status is ''A summary of what was purchased at each location for each order status'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS_STATUS.STORE_NAME'
            , 82
            , 0
            , 'comment on column store_orders_status.store_name is ''What the store is called'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS_STATUS.ADDRESS'
            , 82
            , 0
            , 'comment on column store_orders_status.address is ''The physical or virtual location of this store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS_STATUS.LATITUDE'
            , 82
            , 0
            , 'comment on column store_orders_status.latitude is ''The north-south position of a physical store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS_STATUS.LONGITUDE'
            , 82
            , 0
            , 'comment on column store_orders_status.longitude is ''The east-west position of a physical store'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS_STATUS.ORDER_STATUS'
            , 82
            , 0
            , 'comment on column store_orders_status.order_status is ''The current state of this order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS_STATUS.ORDER_COUNT'
            , 82
            , 0
            , 'comment on column store_orders_status.order_count is ''The primary key of the order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'STORE_ORDERS_STATUS.TOTAL_SALES'
            , 82
            , 0
            , 'comment on column store_orders_status.total_sales is ''The total value of orders placed'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'VIEW'
            , 'PRODUCT_ORDERS'
            , 90
            , 20
            , 'create view product_orders as'||chr(10)||
              'select p.product_name'||chr(10)||
              ',      o.order_status'||chr(10)||
              ',      sum ( oi.quantity * oi.unit_price ) total_sales'||chr(10)||
              ',      count (*) order_count'||chr(10)||
              'from orders o'||chr(10)||
              'join order_items oi'||chr(10)||
              '  on o.order_id = oi.order_id'||chr(10)||
              'join customers c'||chr(10)||
              '  on o.customer_id = c.customer_id'||chr(10)||
              'join products p'||chr(10)||
              '  on oi.product_id = p.product_id'||chr(10)||
              'group by p.product_name'||chr(10)||
              ',        o.order_status'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_ORDERS'
            , 91
            , 0
            , 'comment on table product_orders is ''A summary of the state of the orders placed for each product'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_ORDERS.PRODUCT_NAME'
            , 92
            , 0
            , 'comment on column product_orders.product_name is ''What this product is called'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_ORDERS.ORDER_STATUS'
            , 92
            , 0
            , 'comment on column product_orders.order_status is ''The current state of these order'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_ORDERS.TOTAL_SALES'
            , 92
            , 0
            , 'comment on column product_orders.total_sales is ''The total value of orders placed'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_ORDERS.ORDER_COUNT'
            , 92
            , 0
            , 'comment on column product_orders.order_count is ''The total number of orders placed'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'VIEW'
            , 'PRODUCT_REVIEWS'
            , 100
            , 10
            , 'create view product_reviews as'||chr(10)||
              'select p.product_name'||chr(10)||
              ',      r.rating'||chr(10)||
              ',      round (avg (r.rating) over (partition by product_name), 2) avg_rating'||chr(10)||
              ',      r.review'||chr(10)||
              'from products p'||chr(10)||
              ',    json_table'||chr(10)||
              '       (p.product_details, ''$'''||chr(10)||
              '        columns (nested path ''$.reviews[*]'''||chr(10)||
              '                 columns (  rating number path ''$.rating'''||chr(10)||
              '                          , review varchar2(4000) path ''$.review'''||chr(10)||
              '                         )'||chr(10)||
              '                )'||chr(10)||
              '       ) r'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_REVIEWS'
            , 101
            , 0
            , 'comment on table product_reviews is ''A relational view of the reviews stored in the JSON for each product'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_REVIEWS.PRODUCT_NAME'
            , 102
            , 0
            , 'comment on column product_reviews.product_name is ''What this product is called'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_REVIEWS.RATING'
            , 102
            , 0
            , 'comment on column product_reviews.rating is ''The review score the customer has placed. Range is 1-10'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_REVIEWS.AVG_RATING'
            , 102
            , 0
            , 'comment on column product_reviews.avg_rating is ''The mean of the review scores for this product'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  5
            , 'COMMENT'
            , 'PRODUCT_REVIEWS.REVIEW'
            , 102
            , 0
            , 'comment on column product_reviews.review is ''The text of the review'''
           );

    commit;
end;
/

-- *****************
-- *****************
-- **  Countries  **
-- *****************
-- *****************
begin
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'TABLE'
            , 'EBA_COUNTRY_REGIONS'
            , 10
            , 60
            , 'create table eba_country_regions ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     (start with 60 increment by 10 nocache nocycle)'||chr(10)|| 
              '                     constraint eba_country_region_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'name                 varchar2(255) not null)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_REGIONS'
            , 12
            , 0
            , 'comment on table eba_country_regions is ''Major geographical region'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_REGIONS.ID'
            , 13
            , 0
            , 'comment on column eba_country_regions.id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_REGIONS.NAME'
            , 13
            , 0
            , 'comment on column eba_country_regions.name is ''The region name'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'TABLE'
            , 'EBA_COUNTRY_SUB_REGIONS'
            , 20
            , 50
            , 'create table eba_country_sub_regions ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     (start with 180 increment by 10 nocache nocycle)'||chr(10)|| 
              '                     constraint eba_country_sub_region_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'name                 varchar2(255) not null)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_SUB_REGIONS'
            , 22
            , 0
            , 'comment on table eba_country_sub_regions is ''Minor geographical region'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_SUB_REGIONS.ID'
            , 23
            , 0
            , 'comment on column eba_country_sub_regions.id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_SUB_REGIONS.NAME'
            , 23
            , 0
            , 'comment on column eba_country_sub_regions.name is ''The region name'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'TABLE'
            , 'EBA_COUNTRY_INTERMEDIATES'
            , 30
            , 40
            , 'create table eba_country_intermediates ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     (start with 90 increment by 10 nocache nocycle)'||chr(10)|| 
              '                     constraint eba_country_intermediate_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'name                 varchar2(255) not null)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_INTERMEDIATES'
            , 32
            , 0
            , 'comment on table eba_country_intermediates is ''Intermediate geographical region'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_INTERMEDIATESS.ID'
            , 33
            , 0
            , 'comment on column eba_country_intermediates.id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_INTERMEDIATES.NAME'
            , 33
            , 0
            , 'comment on column eba_country_intermediates.name is ''The region name'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'TABLE'
            , 'EBA_COUNTRY_ORGANIZATIONS'
            , 40
            , 30
            , 'create table eba_country_organizations ('||chr(10)||
              'id                   number '||chr(10)||
              '                     generated by default on null as identity '||chr(10)||
              '                     (start with 50 increment by 10 nocache nocycle)'||chr(10)|| 
              '                     constraint eba_country_organization_pk'||chr(10)||
              '                     primary key,'||chr(10)||
              'code                 varchar2(100) not null,'||chr(10)||
              'name                 varchar2(255))'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_ORGANIZATIONS'
            , 42
            , 0
            , 'comment on table eba_country_organizations is ''Regions specifically for the orgnaization'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_ORGANIZATIONS.ID'
            , 43
            , 0
            , 'comment on column eba_country_organizations.id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_ORGANIZATIONS.CODE'
            , 43
            , 0
            , 'comment on column eba_country_organizations.code is ''The region code'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRY_ORGANIZATIONS.NAME'
            , 43
            , 0
            , 'comment on column eba_country_organizations.name is ''The region name'''
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'TABLE'
            , 'EBA_COUNTRIES'
            , 50
            , 20
            , 'create table eba_countries ('||chr(10)||
              'country_id               number '||chr(10)||
              '                         generated by default on null as identity '||chr(10)||
              '                         (start with 250 increment by 1 nocache nocycle)'||chr(10)|| 
              '                         constraint eba_country_pk'||chr(10)||
              '                         primary key,'||chr(10)||
              'name                     varchar2(100) not null,'||chr(10)||
              'nationality              varchar2(100),'||chr(10)||
              'country_code             varchar2(3),'||chr(10)||
              'iso_alpha2               varchar2(2),'||chr(10)||
              'capital                  varchar2(100),'||chr(10)||
              'population               number,'||chr(10)||
              'area_km2                 number,'||chr(10)||
              'region_id                number,'||chr(10)||
              'sub_region_id            number,'||chr(10)||
              'intermediate_region_id   number,'||chr(10)||
              'organization_region_id   number)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'CONSTRAINT'
            , 'EBA_COUNTRY_REGION_FK'
            , 51
            , 0
            , 'alter table eba_countries add constraint eba_country_regions_fk'||chr(10)||
              '  foreign key (region_id) references eba_country_regions (id)'||chr(10)||
              '  on delete set null'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'CONSTRAINT'
            , 'EBA_COUNTRY_SUB_REGION_FK'
            , 52
            , 0
            , 'alter table eba_countries add constraint eba_country_sub_regions_fk'||chr(10)||
              '  foreign key (sub_region_id) references eba_country_sub_regions (id)'||chr(10)||
              '  on delete set null'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'CONSTRAINT'
            , 'EBA_COUNTRY_INTERMEDIATE_FK'
            , 53
            , 0
            , 'alter table eba_countries add constraint eba_country_intermediates_fk'||chr(10)||
              '  foreign key (intermediate_region_id) references eba_country_intermediates (id)'||chr(10)||
              '  on delete set null'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'CONSTRAINT'
            , 'EBA_COUNTRY_ORGANIZATION_FK'
            , 54
            , 0
            , 'alter table eba_countries add constraint eba_country_organizations_fk'||chr(10)||
              '  foreign key (organization_region_id) references eba_country_organizations (id)'||chr(10)||
              '  on delete set null'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'INDEX'
            , 'EBA_COUNTRIES_I1'
            , 55
            , 0
            , 'create index eba_countries_i1 on eba_countries (region_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'INDEX'
            , 'EBA_COUNTRIES_I2'
            , 56
            , 0
            , 'create index eba_countries_i2 on eba_countries (sub_region_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'INDEX'
            , 'EBA_COUNTRIES_I3'
            , 57
            , 0
            , 'create index eba_countries_i3 on eba_countries (intermediate_region_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'INDEX'
            , 'EBA_COUNTRIES_I4'
            , 58
            , 0
            , 'create index eba_countries_i4 on eba_countries (organization_region_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES'
            , 60
            , 0
            , 'comment on table eba_countries is ''Worldwide Countries'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.COUNTRY_ID'
            , 61
            , 0
            , 'comment on column eba_countries.country_id is ''Auto-incrementing primary key'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.NAME'
            , 61
            , 0
            , 'comment on column eba_countries.name is ''The country name'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.NATIONALITY'
            , 61
            , 0
            , 'comment on column eba_countries.nationality is ''The name of people from this country'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.COUNTRY_CODE'
            , 61
            , 0
            , 'comment on column eba_countries.country_code is ''The 3-character ISO country code'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.ISO_ALPHA2'
            , 61
            , 0
            , 'comment on column eba_countries.iso_alpha2 is ''The 2-character ISO country code'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.CAPITAL'
            , 61
            , 0
            , 'comment on column eba_countries.capital is ''The country''''s capital'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.POPULATION'
            , 61
            , 0
            , 'comment on column eba_countries.population is ''The country''''s population'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.AREA_KM2'
            , 61
            , 0
            , 'comment on column eba_countries.area_km2 is ''The area of the country in square kilometers'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.REGION_ID'
            , 61
            , 0
            , 'comment on column eba_countries.region_id is ''Which region this country is in'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.SUB_REGION_ID'
            , 61
            , 0
            , 'comment on column eba_countries.sub_region_id is ''Which sub-region this country is in'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.INTERMEDIATE_REGION_ID'
            , 61
            , 0
            , 'comment on column eba_countries.intermediate_region_id is ''Which intermediate region this country is in'''
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'COMMENT'
            , 'EBA_COUNTRIES.ORGNAIZATION_REGION_ID'
            , 61
            , 0
            , 'comment on column eba_countries.organization_region_id is ''Which organization region this country is in'''
           );



    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  6
            , 'VIEW'
            , 'EBA_COUNTRIES_V'
            , 60
            , 10
            , 'create or replace view eba_countries_v'||chr(10)||
              'as '||chr(10)||
              'select c.country_id,'||chr(10)||
              'c.name,'||chr(10)||
              'c.nationality,'||chr(10)||
              'c.country_code,'||chr(10)||
              'c.capital,'||chr(10)||
              'c.population,'||chr(10)||
              'c.area_km2 area,'||chr(10)||
              'r.name region,'||chr(10)||
              's.name sub_region,'||chr(10)||
              'i.name intermediate_region,'||chr(10)||
              'o.name orgnaization_region'||chr(10)||
              'from eba_countries c'||chr(10)||
              ',    eba_country_regions r'||chr(10)||
              ',    eba_country_sub_regions s'||chr(10)||
              ',    eba_country_intermediates i'||chr(10)||
              ',    eba_country_organizations o'||chr(10)||
              'where c.region_id = r.id (+)'||chr(10)||
              'and   c.sub_region_id = s.id (+)'||chr(10)||
              'and   c.intermediate_region_id = i.id (+)'||chr(10)||
              'and   c.organization_region_id = o.id'
           );

    commit;

end;
/
-- **********************
-- **********************
-- **  Health Dataset  **
-- **********************
-- **********************
begin
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'TABLE'
            , 'HEALTH_STATES'
            , 10
            , 30
            , 'create table health_states'||chr(10)||
              '(    state_id      number '||chr(10)||
              '     generated by default on null as identity '||chr(10)||
              '     (start with 10 increment by 10 nocache nocycle)'||chr(10)||
              '     constraint health_states_pk primary key'||chr(10)||
              ',    state         varchar2(255) not null'||chr(10)||
              ',    code          varchar2(30) not null'||chr(10)||
              ',    state_region  varchar2(255) not null'||chr(10)||
              ',    state_type    varchar2(255) not null'||chr(10)||
              ',    population    number ) '
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'TABLE'
            , 'HEALTH_PATIENTS'
            , 20
            , 20
            , 'create table health_patients'||chr(10)||
              '(    patient_id          number'||chr(10)||
              '     generated by default on null as identity '||chr(10)||
              '     (start with 10000 increment by 10 nocache nocycle)'||chr(10)||
              '     constraint health_patients_pk primary key'||chr(10)||
              ',    first_name          varchar2(100) not null'||chr(10)||
              ',    last_name           varchar2(100) not null'||chr(10)||
              ',    upper_first         varchar2(100)'||chr(10)||
              ',    upper_last          varchar2(100)'||chr(10)||
              ',    cell_phone          varchar2(100)'||chr(10)||
              ',    email_address       varchar2(100)'||chr(10)||
              ',    city                varchar2(100)'||chr(10)||
              ',    longitude           number'||chr(10)||
              ',    latitude            number'||chr(10)||
              ',    state               varchar2(100)'||chr(10)||
              ',    postal_code         varchar2(100)'||chr(10)||
              ',    county              varchar2(100)'||chr(10)||
              ',    sex                 varchar2(100)'||chr(10)||
              ',    dob                 date'||chr(10)||
              ',    year_of_birth       varchar2(4)'||chr(10)||
              ',    last_feeling        varchar2(100)'||chr(10)||
              ',    last_status_update  date'||chr(10)||
              ',    created             date )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'TRIGGER'
            , 'HEALTH_PATIENTS_TRG1'
            , 22
            , 0
            , 'create or replace trigger health_patients_trg1'||chr(10)||
              '    before insert on health_patients'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '    if inserting then'||chr(10)||
              '        :new.created     := sysdate;'||chr(10)||
              '    end if;'||chr(10)||
              '    :new.upper_last  := upper(:new.last_name);'||chr(10)||
              '    :new.upper_first := upper(:new.first_name);'||chr(10)||
              '    :new.year_of_birth := to_char(:new.dob,''YYYY'');'||chr(10)||
              'end;'
           );

    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'TABLE'
            , 'HEALTH_STATUS_UPDATES'
            , 30
            , 10
            , 'create table health_status_updates'||chr(10)||
              '(    status_update_id         number'||chr(10)||
              '     generated by default on null as identity '||chr(10)||
              '     (start with 200000 increment by 10 nocache nocycle)'||chr(10)||
              '     constraint health_status_updates_pk primary key'||chr(10)||
              ',    patient_id               number not null'||chr(10)||
              ',    date_provided            date'||chr(10)||
              ',    feeling_today            varchar2(100)'||chr(10)||
              ',    impact                   varchar2(4000)'||chr(10)||
              ',    injection_site_symptoms  varchar2(4000)'||chr(10)||
              ',    highest_temp             number'||chr(10)||
              ',    feverish_today           varchar2(3)'||chr(10)||
              ',    general_symptoms         varchar2(4000)'||chr(10)||
              ',    healthcare_visit         varchar2(4000) )'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'CONSTRAINT'
            , 'HEALTH_STATUS_UPD_PATIENT_FK'
            , 31
            , 0
            , 'alter table health_status_updates add constraint health_status_upd_patient_fk'||chr(10)||
              '  foreign key (patient_id) references health_patients (patient_id) '
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'INDEX'
            , 'HEALTH_STATUS_UPDATE_I1'
            , 32
            , 0
            , 'create index health_status_update_i1 on health_status_updates (patient_id)'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'TRIGGER'
            , 'HEALTH_STATUS_UPDATES_TRG1'
            , 34
            , 0
            , 'create or replace trigger health_status_updates_trg1'||chr(10)||
              '    before insert on health_status_updates'||chr(10)||
              '    for each row'||chr(10)||
              'begin'||chr(10)||
              '        if nvl(:new.highest_temp,98.6) >= 100.4 then'||chr(10)||
              '            :new.feverish_today := ''Yes'';'||chr(10)||
              '        end if;'||chr(10)||
              '        update health_patients set'||chr(10)||
              '          last_feeling = :new.feeling_today,'||chr(10)||
              '          last_status_update = sysdate'||chr(10)||
              '        where patient_id = :new.patient_id;'||chr(10)||
              'end;'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'VIEW'
            , 'HEALTH_STATUS_IMPACT_V'
            , 35
            , 8
            , 'create or replace view health_status_impact_v as'||chr(10)||
              'select hsu.patient_id, hsu.status_update_id, hsu.date_provided, impact_row.impact'||chr(10)||
              '    from health_status_updates hsu,'||chr(10)||
              '         json_table (hsu.impact, ''$.IMPACT[*]'''||chr(10)||
              '                     columns( impact      varchar2(4000)  path ''$'''||chr(10)||
              '                            )'||chr(10)||
              '                    ) impact_row'
           );
    insert into wwv_sample_ddls (wwv_sample_dataset_id, object_type, object_name, install_seq, drop_seq, ddl)
    values (  7
            , 'VIEW'
            , 'HEALTH_STATUS_GEN_SYMPTOM_V'
            , 36
            , 9
            , 'create or replace view health_status_gen_symptom_v as'||chr(10)||
              'select hsu.patient_id, hsu.status_update_id, hsu.date_provided, symptoms_row.general_symptom'||chr(10)||
              '    from health_status_updates hsu,'||chr(10)||
              '         json_table (hsu.general_symptoms, ''$.GENERAL_SYMPTOMS[*]'''||chr(10)||
              '                     columns( general_symptom      varchar2(4000)  path ''$'''||chr(10)||
              '                             )'||chr(10)||
              '                     ) symptoms_row'
           );
end;
/

