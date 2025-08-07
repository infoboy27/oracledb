Rem  Copyright (c) 2011, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apex_rest_config.sql
Rem
Rem    DESCRIPTION
Rem      This script creates the APEX_LISTENER and APEX_REST_PUBLIC_USER database users:
Rem        - The APEX_LISTENER user is used by Oracle REST Data Services to access the schema objects in the
Rem          APEX_XXXXXX schema containing resource templates and OAuth data. This user is NOT used for execution of
Rem          resource templates or APEX sessions.
Rem        - The APEX_REST_PUBLIC_USER user is used for the execution of resource templates or APEX sessions.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. You will be prompted to enter passwords for both users.
Rem
Rem    REQUIRMENTS
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    cdivilly   09/07/2011 - Created

set define '^'
set concat on
set concat .
set verify off
set autocommit off


@@core/scripts/apxpreins.sql


COLUMN :script_name NEW_VALUE comp_file NOPRINT
VARIABLE script_name VARCHAR2(50)

declare
    l_script_name varchar2(100);
begin
    if '^CDB_ROOT' = 'YES' then
        l_script_name := 'apex_rest_config_cdb.sql';
    elsif '^CDB' = 'YES' and '^META_LINK' = 'METADATA LINK' then
        l_script_name := 'apex_rest_config_cdb.sql';
    else
        l_script_name := 'apex_rest_config_nocdb.sql';
    end if;
    :script_name := l_script_name;
end;
/

select :script_name from dual;

@@^comp_file
