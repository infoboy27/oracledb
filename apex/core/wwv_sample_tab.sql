set define '^' verify off

Rem  Copyright (c) Oracle Corporation 2010 - 2022. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_sample_create_db_objects.sql
Rem
Rem    DESCRIPTION
Rem      Create Sample datasets database objects during APEX installation
Rem

Rem    MODIFIED     (MM/DD/YYYY)
Rem    dpeake       01/10/2018 - Created
Rem    dpeake       01/11/2018 - Changed format to make rerunnable
Rem    dpeake       07/17/2018 - Added wwv_sample_json table for feeding JSON into the Create App Wizard (feature #2365)
Rem    jstraub      08/22/2018 - Replaced timestamp with local timezone with date (Bug 28538783)

prompt
prompt ... Oracle APEX Sample Datasets - Install DB Objects
prompt

prompt ...create table wwv_sample_datasets

begin
    execute immediate '
create table wwv_sample_datasets (
    id                             number not null constraint wwv_sample_datasets_pk primary key,
    name                           varchar2(255) not null,
    description                    varchar2(4000),
    change_history                 varchar2(4000),
    table_prefix                   varchar2(30),
    last_updated                   date not null
)
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_sample_datasets_biu
    before insert or update
    on wwv_sample_datasets
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.last_updated := sysdate;
end wwv_sample_datasets_biu;
/


prompt ...create table wwv_sample_languages

begin
    execute immediate '
create table wwv_sample_languages (
    cd                             varchar2(10) not null constraint wwv_sample_languages_pk primary key,
    name                           varchar2(255) not null,
    display_seq                    number
)
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

prompt ...create table wwv_sample_dataset_languages

begin
    execute immediate '
create table wwv_sample_dataset_languages (
    id                             number not null constraint wwv_sample_dataset_lang_pk primary key,
    wwv_sample_dataset_id          number not null
                                   constraint wwv_sample_ds_lang_datasets_fk
                                   references wwv_sample_datasets (id) on delete cascade,
    language_cd                    varchar2(10) not null
                                   constraint wwv_sample_ds_lang_language_fk
                                   references wwv_sample_languages (cd) on delete cascade
)
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_sample_ds_languages_biu
    before insert or update
    on wwv_sample_dataset_languages
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end wwv_sample_ds_languages_biu;
/

begin
    execute immediate 'create index wwv_sample_dataset_language_i1 on wwv_sample_dataset_languages (wwv_sample_dataset_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
begin
    execute immediate 'create index wwv_sample_dataset_language_i2 on wwv_sample_dataset_languages (language_cd)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

prompt ...create table wwv_sample_json

begin
    execute immediate '
create table wwv_sample_json (
    id                             number not null constraint wwv_sample_json_pk primary key,
    wwv_sample_dataset_id          number not null
                                   constraint wwv_sample_json_datasets_fk
                                   references wwv_sample_datasets (id) on delete cascade,
    language_cd                    varchar2(10) default ''en'' not null
                                   constraint wwv_sample_json_language_fk
                                   references wwv_sample_languages (cd) on delete cascade,
    create_app_wizard_json         clob not null
)
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_sample_json_biu
    before insert or update
    on wwv_sample_json
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
end wwv_sample_json_biu;
/

begin
    execute immediate 'create index wwv_sample_json_i1 on wwv_sample_json (wwv_sample_dataset_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
begin
    execute immediate 'create index wwv_sample_json_i2 on wwv_sample_json (language_cd)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

prompt ...create table wwv_sample_dataset_companies

begin
    execute immediate '
create table wwv_sample_dataset_companies (
    id                             number not null constraint wwv_sample_ds_companies_pk primary key,
    security_group_id              number not null
                                   constraint wwv_sample_ds_comp_company_fk
                                   references wwv_flow_companies (provisioning_company_id) on delete cascade,
    wwv_sample_dataset_id          number not null
                                   constraint wwv_sample_ds_comp_dataset_fk
                                   references wwv_sample_datasets (id) on delete cascade,
    language_cd                    varchar2(10) not null
                                   constraint wwv_sample_comp_language_fk
                                   references wwv_sample_languages (cd) on delete cascade,
    schema                         varchar2(128),
    last_updated                   date not null
)
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_sample_ds_companies_biu
    before insert or update
    on wwv_sample_dataset_companies
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    :new.last_updated := sysdate;
end wwv_sample_ds_companies_biu;
/

begin
    execute immediate 'create index wwv_sample_ds_companies_i1 on wwv_sample_dataset_companies (security_group_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
begin
    execute immediate 'create index wwv_sample_ds_companies_i2 on wwv_sample_dataset_companies (wwv_sample_dataset_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
begin
    execute immediate 'create index wwv_sample_ds_companies_i3 on wwv_sample_dataset_companies (language_cd)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/


prompt ...create table wwv_sample_ddls

begin
    execute immediate '
create table wwv_sample_ddls (
    id                             number not null constraint wwv_sample_ddls_pk primary key,
    wwv_sample_dataset_id          number not null
                                   constraint wwv_sample_ddls_datasets_fk
                                   references wwv_sample_datasets (id) on delete cascade,
    object_type                    varchar2(50) not null,
    object_name                    varchar2(255) not null,
    install_seq                    number not null,
    drop_seq                       number not null,
    ddl                            clob not null
)
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_sample_ddls_biu
    before insert or update
    on wwv_sample_ddls
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- Tweak the wwv_sample_datasets table so last_updated increased which indicates a refresh is available
    update wwv_sample_datasets
    set id = id
    where id = :new.wwv_sample_dataset_id;
end wwv_sample_ddls_biu;
/

begin
    execute immediate 'create index wwv_sample_ddls_i1 on wwv_sample_ddls (wwv_sample_dataset_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/


prompt ...create table wwv_sample_dmls

begin
    execute immediate '
create table wwv_sample_dmls (
    id                             number not null constraint wwv_sample_dmls_pk primary key,
    wwv_sample_dataset_id          number not null
                                   constraint wwv_sample_dmls_datasets_fk
                                   references wwv_sample_datasets (id) on delete cascade,
    language_cd                    varchar2(10) default ''en'' not null
                                   constraint wwv_sample_dmls_language_fk
                                   references wwv_sample_languages (cd) on delete cascade,
    dml_name                       varchar2(255),
    install_seq                    number not null,
    dml                            clob not null
)
';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_sample_dmls_biu
    before insert or update
    on wwv_sample_dmls
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    -- Tweak the wwv_sample_datasets table so last_updated increased which indicates a refresh is available
    update wwv_sample_datasets
    set id = id
    where id = :new.wwv_sample_dataset_id;
end wwv_sample_dmls_biu;
/

begin
    execute immediate 'create index wwv_sample_dmls_i1 on wwv_sample_dmls (wwv_sample_dataset_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/
begin
    execute immediate 'create index wwv_sample_dmls_i2 on wwv_sample_dmls (language_cd)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/


