set define '^' verify off
prompt ...apxrekey.sql
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2017. All Rights Reserved.
--
--    NAME
--      apxrekey.sql
--
--    REQUIREMENTS
--      - This script has to be executed as SYS
--
--    SYNOPSIS
--      sqlplus / as sysdba @utilities/apxrekey.sql .
--
--    PARAMETERS
--      1 .... The path to the APEX main directory.
--
--    DESCRIPTION
--      This script generates a new APEX instance encryption key. You can use it
--      after cloning a PDB, to run with different encryption keys in the
--      original and in the clone.
--
--    MODIFIED   (MM/DD/YYYY)
--      cneumuel  07/14/2017 - Created (bug #26223782)
--
--------------------------------------------------------------------------------

define PREFIX=^1

set serveroutput on size unlimited

whenever sqlerror exit failure

declare
    invalid_alter_priv exception;
    pragma exception_init(invalid_alter_priv,-02248);
begin
    if user <> 'SYS' then
        raise_application_error(-20001, 'The script has to run as SYS');
    end if;

    execute immediate 'alter session set "_ORACLE_SCRIPT"=true';
exception
    when invalid_alter_priv then
        null;
end;
/

prompt ...
prompt ... Creating a new key
prompt ...

@^PREFIX./core/wwv_flow_create_key_package.plb
exec wwv_flow_create_key_package(p_overwrite_key => true)
drop procedure sys.wwv_flow_create_key_package
/

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

prompt ...
prompt ... Validating APEX
prompt ...
exec validate_apex
prompt ...
prompt ... Done!
prompt ...
