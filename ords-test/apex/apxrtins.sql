Rem  Copyright (c) 2007, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxrtins.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem
Rem    Arguments:
Rem     Position 1: Name of tablespace for Oracle APEX application user
Rem     Position 2: Name of tablespace for Oracle APEX files user
Rem     Position 3: Name of temporary tablespace or tablespace group
Rem     Position 4: Virtual directory for APEX images
Rem
Rem    Example:
Rem
Rem    1)Local
Rem      sqlplus "sys/syspass as sysdba" @apxrtins SYSAUX SYSAUX TEMP /i/
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   07/11/2007 - Created

set define '^'
set concat on
set concat .
set verify off


define DATTS        = '^1'
define FF_TBLS      = '^2'
define TEMPTBL      = '^3'
define IMGPR        = '^4'

@@core/scripts/set_appun.sql
@@core/scripts/apxpreins.sql
@@core/scripts/set_ufrom_and_upgrade.sql

COLUMN :script_name NEW_VALUE comp_file NOPRINT
VARIABLE script_name VARCHAR2(50)

declare
    l_script_name varchar2(100);
begin
    if '^CDB_ROOT' = 'YES' then
        l_script_name := 'apxrtins_cdb.sql';
    elsif '^CDB' = 'YES' and '^META_LINK' = 'METADATA LINK' then
        l_script_name := 'apxrtins_cdb.sql';
    else
        l_script_name := 'apxrtins_nocdb.sql';
    end if;
    :script_name := l_script_name;
end;
/

select :script_name from dual;
Rem
Rem Call cdb/nocdb script. The last argument must not end in "/"!
Rem
@@^comp_file ^DATTS ^FF_TBLS "^TEMPTBL" ^IMGPR 1,2,3
