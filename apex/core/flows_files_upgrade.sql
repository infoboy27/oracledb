set define '^'
set verify off
prompt ...flows_files_upgrade


Rem  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      flows_files_upgrade.sql
Rem
Rem    DESCRIPTION
Rem      Oracle APEX file repository install or upgrade
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem       jkallman  08/04/2003 - Created

prompt ...create or upgrade wwv_flow_file_objects

declare
    l_found boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$' ) loop
        l_found := TRUE;
    end loop;
    --
    -- If the table wasn't found, create it
    if l_found = FALSE then
        execute immediate q'{create table wwv_flow_file_objects$ (
    id                               number
                                     constraint wwv_flow_file_obj_pk
                                     primary key,
    flow_id                          number not null,
    name                             varchar2(400) not null unique,
    pathid                           number,
    filename                         varchar2(400),
    title                            varchar2(255),
    mime_type                        varchar2(255),
    doc_size                         number,
    dad_charset                      varchar2(128),
    created_by                       varchar2(255),
    created_on                       date,
    updated_by                       varchar2(255),
    updated_on                       date,
    deleted_as_of                    date default to_date('01-01-0001','DD-MM-YYYY') not null,
    last_updated                     date,
    content_type                     varchar2(128),
    blob_content                     blob,
    language                         varchar2(30),
    description                      varchar2(4000),
    security_group_id                number,
    file_type                        varchar2(255),
    file_charset                     varchar2(128),
    session_id                       number
    )}';

        execute immediate q'{comment on table wwv_flow_file_objects$ is
'General file repository table for all flows applications, used to store SQL Scripts, BLOBs, etc.'}';

        execute immediate 'create index wwv_flow_files_file_idx on wwv_flow_file_objects$ (security_group_id, filename, flow_id)';

        execute immediate 'create index wwv_flow_files_user_idx on wwv_flow_file_objects$ (created_by)';

        execute immediate 'create index wwv_flow_files_session_idx on flows_files.wwv_flow_file_objects$ (session_id)';

        execute immediate 'create or replace public synonym wwv_flow_file_objects$ sharing=NONE for wwv_flow_file_objects$';

    end if;
exception
    when not_in_pdb then
        null;
end;
/

declare
    l_found boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$'
                  and column_name = 'FILE_CHARSET') loop
        l_found := TRUE;
    end loop;
    --
    -- If the new column wasn't found, add it to the file object repository
    if l_found = FALSE then
        execute immediate 'ALTER TABLE wwv_flow_file_objects$ ADD file_charset VARCHAR2(128)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/



declare
    l_exists boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$'
                  and column_name = 'NAME'
                  and data_length = 400) loop
        l_exists := TRUE;
    end loop;
    --
    -- If the modified column size hasn't been applied, alter the table
    if l_exists = FALSE then
        execute immediate 'ALTER TABLE FLOWS_FILES.wwv_flow_file_objects$ modify name VARCHAR2(400)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/


declare
    l_exists boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$'
                  and column_name = 'MIME_TYPE'
                  and data_length = 255) loop
        l_exists := TRUE;
    end loop;
    --
    -- If the modified column size hasn't been applied, alter the table
    if l_exists = FALSE then
        execute immediate 'ALTER TABLE FLOWS_FILES.wwv_flow_file_objects$ modify mime_type VARCHAR2(255)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/

declare
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_indexes
                where owner = 'FLOWS_FILES'
                  and index_name = 'WWV_FLOW_FILES_SGID_FK_IDX')
    loop
        execute immediate 'drop index FLOWS_FILES.wwv_flow_files_sgid_fk_idx';
        exit;
    end loop;
exception
    when not_in_pdb then
        null;
end;
/


declare
    l_exists boolean := FALSE;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_indexes
                where owner = 'FLOWS_FILES'
                  and index_name = 'WWV_FLOW_FILES_FILE_IDX') loop
        l_exists := TRUE;
    end loop;
    --
    -- If the index doesn't exist add it
    if l_exists = FALSE then
        execute immediate 'create index FLOWS_FILES.wwv_flow_files_file_idx on FLOWS_FILES.wwv_flow_file_objects$ (security_group_id, filename, flow_id)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/

declare
    l_exists boolean := false;
    not_in_pdb exception;
    pragma exception_init(not_in_pdb,-65040);
begin
    for c1 in (select null
                 from sys.dba_tab_columns
                where owner = 'FLOWS_FILES'
                  and table_name = 'WWV_FLOW_FILE_OBJECTS$'
                  and column_name = 'SESSION_ID' )
    loop
        l_exists := true;
    end loop;
    --
    -- If the modified column size hasn't been applied, alter the table
    if l_exists = false then
        execute immediate 'alter table flows_files.wwv_flow_file_objects$ add session_id number';
        execute immediate 'create index flows_files.wwv_flow_files_session_idx on flows_files.wwv_flow_file_objects$ (session_id)';
    end if;
exception
    when not_in_pdb then
        null;
end;
/

