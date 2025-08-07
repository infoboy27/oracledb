Rem  Copyright (c) 1999, 2022, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      dbcsins.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 11.2.0.4 or later
Rem
Rem    Arguments:
Rem     Position 1: Name of tablespace for Oracle APEX application user
Rem     Position 2: Name of tablespace for Oracle APEX files user
Rem     Position 3: Name of temporary tablespace or tablespace group
Rem     Position 4: Virtual directory for APEX images
Rem     Position 5: DBCS password
Rem
Rem    Example:
Rem
Rem    1)Local
Rem      sqlplus "sys/syspass as sysdba" @dbcsins SYSAUX SYSAUX TEMP /i/ Passw0rd!
Rem
Rem    2)With connect string
Rem      sqlplus "sys/syspass@10g as sysdba" @dbcsins SYSAUX SYSAUX TEMP /i/ Passw0rd!
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   03/28/2018 - Created

set define '^'
set concat on
set concat .
set verify off

define DATTS        = '^1'
define FF_TBLS      = '^2'
define TEMPTBL      = '^3'
define IMGPR        = '^4'
define DBCSPWD      = '^5'

@@core/scripts/set_appun.sql
@@core/scripts/apxpreins.sql

@@apexins_nocdb.sql ^DATTS ^FF_TBLS "^TEMPTBL" ^IMGPR 1,2,3

set define '^'

@@dbcsconf.sql "^DBCSPWD" "^IMGPR" x
