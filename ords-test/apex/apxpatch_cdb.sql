Rem  Copyright (c) 2004, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxpatch_cdb.sql
Rem
Rem    DESCRIPTION
Rem      This script is called by apxpatch.sql and *SHOULD NOT BE RUN* directly.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected. Must be run locally to the database and the
Rem      ORACLE_HOME environment variable must be set.
Rem
Rem    REQUIREMENTS
Rem      - Oracle Database 12.1.0.1 or later
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     vuvarov    12/22/2016 - Created


set define '^' verify off
define PREFIX       = '@'
define INSTALL_TYPE = 'MANUAL'

@^PREFIX.core/scripts/set_appun.sql
@^PREFIX.patches/patchset/prereq.sql

@^PREFIX.core/scripts/timing_start.sql "Complete Patch"

whenever sqlerror exit

column :xe_home new_value OH_HOME NOPRINT
variable xe_home varchar2(255)

set serverout on
begin
-- get oracle_home
    sys.dbms_system.get_env('ORACLE_HOME',:xe_home);
    if length(:xe_home) = 0 then
        sys.dbms_output.put_line(lpad('-',80,'-'));
        raise_application_error (
            -20001,
            'Oracle Home environment variable not set' );
    end if;
end;
/
whenever sqlerror continue

set termout off
select :xe_home from sys.dual;
set termout on

prompt Performing installation in multitenant container database in the background.
prompt The installation progress is spooled into *patch_con*.log files.
prompt
prompt Please wait...
prompt

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b syspatch_con patches/patchset/syspatch.sql --p^PREFIX --p^INSTALL_TYPE

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b ddlpatch_con patches/patchset/ddlpatch.sql --p^PREFIX --p^INSTALL_TYPE

begin
    sys.dbms_utility.compile_schema('^APPUN.', false);
end;
/

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b deppatch_con patches/patchset/deppatch.sql --p^PREFIX --p^INSTALL_TYPE

begin
    sys.dbms_utility.compile_schema('^APPUN.', false);
end;
/

host ^OH_HOME/perl/bin/perl -I ^OH_HOME/rdbms/admin ^OH_HOME/rdbms/admin/catcon.pl -b corepatch_con patches/patchset/corepatch.sql --p^PREFIX --p^INSTALL_TYPE

@^PREFIX.core/scripts/timing_stop.sql

prompt
prompt Installation completed. Log files for each container can be found in:
prompt
prompt syspatch_con*.log
prompt ddlpatch_con*.log
prompt deppatch_con*.log
prompt corepatch_con*.log
prompt
prompt You can quickly scan for ORA errors or compilation errors by using a utility
prompt like grep:
prompt
prompt grep ORA- *.log
prompt grep PLS- *.log
prompt
