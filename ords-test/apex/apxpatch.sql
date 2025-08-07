Rem  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
Rem
Rem    NAME
Rem      apxpatch.sql
Rem
Rem    DESCRIPTION
Rem      This script installs an Oracle APEX patchset.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     vuvarov    12/22/2016 - Created

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
        l_script_name := 'apxpatch_cdb.sql';
    elsif '^CDB' = 'YES' and '^META_LINK' = 'METADATA LINK' then
        l_script_name := 'apxpatch_cdb.sql';
    else
        l_script_name := 'apxpatch_nocdb.sql';
    end if;
    :script_name := l_script_name;
end;
/

select :script_name from dual;

@@^comp_file
