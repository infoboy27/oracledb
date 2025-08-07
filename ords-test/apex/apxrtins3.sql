Rem  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
Rem
Rem    NAME
Rem      apxrtins3.sql
Rem
Rem    DESCRIPTION
Rem      Run Phase 3 (switch to new schema and copy "hot" metadata) of
Rem      Oracle APEX Runtime installation.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 11.2.0.1 or later
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
Rem      sqlplus "sys/syspass as sysdba" @apxrtins3 SYSAUX SYSAUX TEMP /i/
Rem
Rem    2)With connect string
Rem      sqlplus "sys/syspass@10g as sysdba" @apxrtins3 SYSAUX SYSAUX TEMP /i/
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      cneumuel  11/29/2016 - Created
Rem      cneumuel  01/16/2018 - Unify calls of utility scripts (core/scripts/*.sql)

set define '^' verify off

define DATTS        = '^1'
define FF_TBLS      = '^2'
define TEMPTBL      = '^3'
define IMGPR        = '^4'

@@core/scripts/apxpreins.sql

@@apxrtins_nocdb.sql ^DATTS ^FF_TBLS "^TEMPTBL" ^IMGPR 3
