Rem  Copyright (c) 2015, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      coreins4.sql
Rem
Rem    DESCRIPTION
Rem      This is a primary installation script for Oracle APEX, but this should never be invoked directly.
Rem      This file should only be invoked by apexins.sql, the primary installation script for APEX.
Rem
Rem    NOTES
Rem      Ensure that all arguments (except image prefix) are entered in UPPERCASE.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 19c or later
Rem      - PL/SQL Web Toolkit
Rem
Rem    Arguments:
Rem      1 - CDB_ROOT     = CDB installation into root
Rem      2 - APPUN        = APEX schema name
Rem      3 - PREFIX       = The path to the file
Rem      4 - INSTALL_TYPE = Full development environment or runtime only
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      jstraub   02/20/2015 - Split from coreins.sql

set define '^'
set concat on
set concat .
set verify off
set autocommit off
set serveroutput on size unlimited format wrapped

define CDB_ROOT     = '^1'
define APPUN        = '^2'
define PREFIX       = '^3'
define INSTALL_TYPE = '^4'

set errorlogging on table ^APPUN..WWV_INSTALL_ERRORS

--==============================================================================
begin
    if ^APPUN..wwv_install_api.is_upgrade then
        ^APPUN..wwv_flow_upgrade.enable_ws_constraints (
            p_to => '^APPUN' );
    end if;
end;
/

--==============================================================================
@^PREFIX.core/scripts/apxsqler.sql ^INSTALL_TYPE
begin
    if ^APPUN..wwv_install_api.get_error_count > 0 then
        ^APPUN..wwv_flow_upgrade.rollback_phase2 (
            p_from => ^APPUN..wwv_install_api.old_schema );
        sys.dbms_output.put_line('Errors found. Drop ^APPUN before re-starting the installation.');
    end if;

    ^APPUN..wwv_install_api.end_phase (
        p_phase => 2 );
end;
/
set errorlogging off

whenever sqlerror continue
@^PREFIX.core/scripts/timing_stop.sql
