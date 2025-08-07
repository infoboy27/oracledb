set define off verify off
prompt ...create Quick SQL objects

--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_qs_tables.sql
--
--    DESCRIPTION
--      Creates the tables required to run Quick SQL functionality from within APEX
--
--    NOTES
--
--    REQUIRMENTS
--
--    MODIFIED   (MM/DD/YYYY)
--    mhichwa     10/12/2017 - Created
--------------------------------------------------------------------------------


CREATE TABLE WWV_QS_MODELS (
    id                      number primary key,
    name                    varchar2(255) not null,
    description             varchar2(4000),
    model_type              varchar2(60),
    identifier              varchar2(255),
    --
    quick_sql               clob,
    generated_sql           clob,
    --
    ERD                     blob,
    ERD_filename            varchar2(512),
    ERD_mimetype            varchar2(512),
    ERD_charset             varchar2(512),
    ERD_lastupd             date,
    --
    published_yn            varchar2(1) default 'N',
    --
    created                 date,
    created_by              varchar2(255),
    updated                 date,
    updated_by              varchar2(255)
    )
/


create or replace trigger biu_wwv_qs_models
before insert or update on wwv_qs_models
for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        end if;
        :new.created_by         := nvl(v('APP_USER'), USER);
        :new.created            := sysdate;
    end if;
    :new.identifier := lower(:new.identifier);
    :NEW.UPDATED := sysdate;
    :NEW.UPDATED_BY := nvl(v('APP_USER'),USER);
    if :new.published_yn is null then
       :new.published_yn := 'N';
    end if;
end;
/
show errors

create unique index wwv_qs_models_i1 on WWV_QS_models(identifier)
/

set define '^'
