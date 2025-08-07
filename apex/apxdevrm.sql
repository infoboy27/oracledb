Rem  Copyright (c) 2007, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxdevrm.sql
Rem
Rem    DESCRIPTION
Rem      This is the development environment removal script for Oracle APEX.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   06/26/2007 - Created


set define '^'
set concat on
set concat .
set verify off

@@core/scripts/apxpreins.sql

COLUMN :script_name NEW_VALUE comp_file NOPRINT
VARIABLE script_name VARCHAR2(50)

declare
    l_script_name varchar2(100);
begin
    if '^CDB_ROOT' = 'YES' then
        l_script_name := 'apxdevrm_cdb.sql';
    elsif '^CDB' = 'YES' and '^META_LINK' = 'METADATA LINK' then
        l_script_name := 'apxdevrm_cdb.sql';
    else
        l_script_name := 'apxdevrm_nocdb.sql';
    end if;
    :script_name := l_script_name;
end;
/

select :script_name from dual;

@@^comp_file
