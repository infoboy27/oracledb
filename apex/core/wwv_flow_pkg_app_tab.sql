set define '^' verify off

Rem  Copyright (c) 2011, 2021, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      wwv_flow_pkg_app_tab.sql
Rem
Rem    DESCRIPTION
Rem      Packaged application object creation script.  Create tables, indexes, triggers.
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       cbcho    10/19/2011 - Created
Rem

prompt ...create table wwv_flow_pkg_app_map

begin
    execute immediate q'{
create table wwv_flow_pkg_app_map (
   id                         number   not null,
   app_id                     number   not null,
   installed_app_id           number,
   installed_build_version    number   not null,
   application_locked         varchar2(1) not null
                                  constraint wwv_flow_pkg_app_locked_ck
                                  check (application_locked in ('Y','N')),
   security_group_id          number   not null,
   --
   created                    date,
   created_by                 varchar2(255),
   updated                    date,
   updated_by                 varchar2(255),
   --
   constraint wwv_flow_pkg_app_map_pk
      primary key (id),
   constraint wwv_flow_pkg_app_map_fk
      foreign key (installed_app_id) references wwv_flows (id)
      on delete cascade,
   constraint wwv_flow_pkg_app_map_uk1
      unique (app_id, security_group_id)
   )
}';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

begin
    execute immediate 'create index wwv_flow_pkg_app_map_idx on wwv_flow_pkg_app_map(installed_app_id)';
exception
    when others then
        if sqlcode = -955 then null;
        else raise;
        end if;
end;
/

create or replace trigger wwv_flow_pkg_app_map_biu
   before insert or update on wwv_flow_pkg_app_map
   for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    wwv_flow_utilities.set_audit_cols(:new.updated_by,:new.updated);
    if inserting then
        :new.created    := :new.updated;
        :new.created_by := :new.updated_by;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/