Rem  Copyright (c) 2004, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      apxpatch_nocdb.sql
Rem
Rem    DESCRIPTION
Rem      This script is called by apxpatch.sql and *SHOULD NOT BE RUN* directly.
Rem
Rem    NOTES
Rem      Assumes the SYS user is connected.
Rem
Rem    REQUIREMENTS
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem     vuvarov    12/22/2016 - Created

spool apxpatch.log

set define '^' verify off
set concat on
set concat .

define PREFIX       = '@'
define INSTALL_TYPE = 'MANUAL'

@^PREFIX.patches/patchset/prereq.sql

@^PREFIX.core/scripts/timing_start.sql "Complete Patch"

@^PREFIX.patches/patchset/syspatch.sql ^PREFIX ^INSTALL_TYPE
@^PREFIX.patches/patchset/ddlpatch.sql ^PREFIX ^INSTALL_TYPE
@^PREFIX.patches/patchset/deppatch.sql ^PREFIX ^INSTALL_TYPE
@^PREFIX.patches/patchset/corepatch.sql ^PREFIX ^INSTALL_TYPE

@^PREFIX.core/scripts/timing_stop.sql
