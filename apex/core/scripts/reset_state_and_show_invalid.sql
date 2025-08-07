set define '^' verify off
prompt ...reset_state_and_show_invalid.sql
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2018. All Rights Reserved.
--
-- NAME
--   reset_state_and_show_invalid.sql
--
-- DESCRIPTION
--   Reset package state and show invalid objects
--
-- PARAMETERS
--   * 1: Comma-separated list of schemas to check for invalid objects
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  06/26/2018 - Created
--   cneumuel  07/10/2018 - Enumerate SYS objects of this release, no errors when e.g. older WWV_DBMS_SQL_% is invalid
--   cneumuel  07/20/2018 - Set serveroutput format to wrapped
--
--------------------------------------------------------------------------------

exec sys.dbms_session.modify_package_state(sys.dbms_session.reinitialize)
set serveroutput on size unlimited format wrapped

begin
    for i in ( select type,
                      owner,
                      name,
                      line,
                      position,
                      text
                 from sys.dba_errors
                where owner in ('^APPUN', 'SYS', 'FLOWS_FILES')
                  and instr('^1', owner) > 0
                  and attribute = 'ERROR'
                  and (owner <> 'SYS' or name in ( 'WWV_FLOW_VAL',
                                                   'WWV_DBMS_SQL_^APPUN',
                                                   'VALIDATE_APEX' ))
                order by owner,
                         type,
                         name,
                         line,
                         position )
    loop
        ^APPUN..wwv_install_api.error (
            p_message   => i.text,
            p_statement => i.type||' '||i.owner||'.'||i.name||', Line '||i.line||'/'||i.position );
    end loop;
end;
/
