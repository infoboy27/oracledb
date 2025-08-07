set define '^' verify off
prompt ...wwv_install_tabs.sql
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2018. All Rights Reserved.
--
-- NAME
--   wwv_install_tabs.sql
--
-- DESCRIPTION
--   APEX system installation log tables.
--
-- ARGUMENTS
--   1: APEX username, e.g. APEX_180100
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  06/25/2018 - Created
--   cneumuel  07/12/2018 - In wwv_install_error$.kind: added 'WARN'
--   jstraub   02/11/2019 - Modify wwv_install$.install_type to all APPCONTAINEREXT (feature 2398)
--
--------------------------------------------------------------------------------

--==============================================================================
prompt ...wwv_install_seq
declare
    l_start number := regexp_substr('^1','[0-9]+')*10000;
begin
    execute immediate 'create sequence wwv_install_seq '||
                      'start with '||l_start;
end;
/

--==============================================================================
prompt ...wwv_install$
create table wwv_install$ (
    id                  number
                        constraint wwv_install$_pk primary key,
    install_type        varchar2(15) not null
                        constraint wwv_install$_ck_install_type check (
                            install_type in ( 'RUNTIME',
                                              'FULLINS',
                                              'APPCONTAINER',
                                              'APPCONTAINEREXT',
                                              'DEVINS',
                                              'DEVRM',
                                              'PATCH') ),
    version_name        varchar2(30) not null,
    schema              varchar2(128) not null,
    old_schema          varchar2(128),
    status              varchar2(10) not null
                        constraint wwv_install$_ck_status check (
                            status in ('INSTALLING','INSTALLED','ERROR') ),
    started_at          date not null,
    ended_at            date
)
/
create index wwv_install$_ix1 on wwv_install$ (
    install_type, version_name )
/

--==============================================================================
prompt ...wwv_install_action$
create table wwv_install_action$ (
    id                  number
                        constraint wwv_install_action$_pk primary key,
    install_id           number not null
                        constraint wwv_install_action$_fk
                        references wwv_install$(id),
    started_at          date not null,
    phase               number not null,
    action              varchar2(256) not null,
    info                varchar2(4000)
)
/
create index wwv_install_action$_ix1 on wwv_install_action$ (
    install_id, started_at )
/

--==============================================================================
prompt ...wwv_install_error$
create table wwv_install_error$ (
    username            varchar2(256),
    timestamp           timestamp,
    script              varchar2(1024),
    identifier          varchar2(256),
    message             clob,
    statement           clob,
    --
    kind                varchar2(5) generated always as (
                          case
                          when message like 'PERF:%'    then 'PERF' -- performance warning
                          when message like 'WARN:%'    then 'WARN' -- other warning
                          when message like 'SP2-0804%' then 'WARN' -- procedure created with warnings
                          when message like 'SP2-0805%' then 'WARN' -- procedure altered with warnings
                          when message like 'SP2-0806%' then 'WARN' -- function created with warnings
                          when message like 'SP2-0807%' then 'WARN' -- function altered with warnings
                          when message like 'SP2-0808%' then 'WARN' -- package created with warnings
                          when message like 'SP2-0809%' then 'WARN' -- package altered with warnings
                          when message like 'SP2-0810%' then 'WARN' -- package body created with warnings
                          when message like 'SP2-0811%' then 'WARN' -- package body altered with warnings
                          when message like 'SP2-0812%' then 'WARN' -- view created with warnings
                          when message like 'SP2-0813%' then 'WARN' -- view altered with warnings
                          when message like 'SP2-0814%' then 'WARN' -- trigger created with warnings
                          when message like 'SP2-0815%' then 'WARN' -- trigger altered with warnings
                          when message like 'SP2-0816%' then 'WARN' -- type created with warnings
                          when message like 'SP2-0817%' then 'WARN' -- type altered with warnings
                          when message like 'SP2-0818%' then 'WARN' -- type body created with warnings
                          when message like 'SP2-0819%' then 'WARN' -- type body altered with warnings
                          else 'ERROR'
                          end ) virtual not null,
    error_stack         varchar2(4000),
    id                  number
                        constraint wwv_install_error$_pk primary key,
    action_id           number not null
                        constraint wwv_install_error$_fk
                        references wwv_install_action$(id)
)
/
create index wwv_install_error$_ix1 on wwv_install_error$ (
    action_id, timestamp )
/
--==============================================================================
prompt ...wwv_flow_install_errors
create or replace view wwv_install_errors as
select username,
       timestamp,
       script,
       identifier,
       message,
       statement
  from wwv_install_error$
/
show err
