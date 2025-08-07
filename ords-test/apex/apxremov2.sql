Rem  Copyright (c) Oracle Corporation 1999 - 2024. All Rights Reserved.
Rem
Rem    NAME
Rem      apxremov2.sql
Rem
Rem    DESCRIPTION
Rem      Removes Oracle APEX
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. You must exit the SQL*Plus session prior to running
Rem      apexins.sql
Rem
Rem    REQUIRENTS
Rem      Oracle APEX
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   08/14/2006 - Created

set define '^' verify off
set serverout on
define PREFIX = '^1'

@^PREFIX.core/scripts/set_appun.sql

alter session set current_schema = SYS;

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=true';
exception
    when invalid_alter_priv then
        null;
end;
/

@^PREFIX.core/scripts/set_ufrom_and_upgrade.sql



-- Drop REST for APEX_PUBLIC_ROUTER
prompt ...Attempting to drop REST for APEX_PUBLIC_ROUTER
declare
    l_cnt       pls_integer;
begin
    -- Only remove if drop procedure exist and APEX_PUBLIC_ROUTER has been REST enabled
    select count(*)
      into l_cnt
      from sys.dba_procedures p
     where p.owner          = 'ORDS_METADATA'
       and p.object_name    = 'ORDS_ADMIN'
       and p.procedure_name = 'DROP_REST_FOR_SCHEMA';

    if l_cnt > 0 then
        -- Can not run using "execute immediate" as it will not work if the DB lockdown is applied,
        -- Where SYS is common and ORDS_METADATA is not (ADB) (although it is unlikely that apxremov gets called there), but a customer could also set this up.
        -- 
        declare
            l_user_id   sys.all_users.user_id%type;
            l_cursor    integer := sys.dbms_sql.open_cursor;
            ignore      pls_integer;
        begin
            select u.user_id
              into l_user_id
              from sys.all_users u
             where u.username = 'ORDS_METADATA';

            -- If APEX_PUBLIC_ROUTER wasn't register as a rest schema no error will be raised if not found
            -- Did not check in first query as dba_ords_schemas may not exist and would break script
            sys.dbms_sys_sql.parse_as_user(
                c             => l_cursor,
                statement     => q'!
begin 
    ords_admin.drop_rest_for_schema(p_schema => 'APEX_PUBLIC_ROUTER');
    commit;
exception
    when others then
        sys.dbms_output.put_line('Error calling ords_metadata.ords_admin.drop_rest_for_schema: ' || sqlerrm);
end;
!',
                language_flag => sys.dbms_sys_sql.native,
                userid        => l_user_id,
                useLogonRoles => false );
            
            ignore := sys.dbms_sql.execute(l_cursor);

            sys.dbms_sys_sql.close_cursor(l_cursor);

        exception when others then
            dbms_output.put_line('Error attempting to drop REST for APEX_PUBLIC_ROUTER: ' || sqlerrm);
            if sys.dbms_sys_sql.is_open(l_cursor) then
                sys.dbms_sys_sql.close_cursor(l_cursor);
            end if;
        end;
    end if;

end;
/


-- Remove FLOWS SCHEMA
drop user ^APPUN cascade;

-- Remove FLOWS_FILES and APEX_PUBLIC_USER SCHEMA if no other versions exist

declare
    procedure ddl (
        p_stmt in varchar2 )
    is
    begin
        execute immediate p_stmt;
    exception when others then
        if sqlcode not in (-1918, -1924) then
            sys.dbms_output.put_line(sqlerrm);
            sys.dbms_output.put_line('... when running: '||p_stmt);
        end if;
    end ddl;
begin
    if '^UPGRADE' = '1' then
        ddl('drop user FLOWS_FILES cascade');
        ddl('drop user APEX_PUBLIC_USER cascade');
        ddl('drop user APEX_LISTENER cascade');
        ddl('drop user APEX_REST_PUBLIC_USER cascade');
        ddl('drop user APEX_PUBLIC_ROUTER cascade');
        ddl('drop role APEX_ADMINISTRATOR_ROLE');
        ddl('drop role APEX_ADMINISTRATOR_READ_ROLE');
        ddl('drop role APEX_GRANTS_FOR_NEW_USERS_ROLE');
        ddl('drop context APEX$SESSION');
    end if;
end;
/

-- Remove SYS owned objects

begin
    if '^UPGRADE' = '1' then
        execute immediate 'drop procedure validate_apex';
        execute immediate 'drop package WWV_FLOW_VAL';
        execute immediate 'drop package WWV_FLOW_KEY';
        execute immediate 'drop library WWV_FLOW_VAL_LIB';
    end if;
    --
    -- drop old wwv_dbms_sql if it is invalid
    --
    for i in ( select 1
                 from sys.dba_objects
                where owner       = 'SYS'
                  and object_name = 'WWV_DBMS_SQL'
                  and status      = 'INVALID' )
    loop
        execute immediate 'drop package wwv_dbms_sql';
    end loop;
end;
/
drop package WWV_DBMS_SQL_^APPUN.;
drop package WWV_UTIL_^APPUN.;

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    execute immediate 'alter session set "_ORACLE_SCRIPT"=false';
exception
    when invalid_alter_priv then
        null;
end;
/

prompt ...Oracle APEX Removed
prompt
prompt ********************************************************************
prompt ** You must exit this SQL*Plus session before running apexins.sql **
prompt ********************************************************************
