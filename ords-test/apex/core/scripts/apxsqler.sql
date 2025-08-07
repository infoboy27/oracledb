--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2019. All Rights Reserved.
--
-- NAME
--   apxsqler.sql
--
-- DESCRIPTION
--   This script calls
--
--     whenever sqlerror exit sql.sqlcode rollback
--
--   if parameter 1 (INSTALL_TYPE) is MANUAL, RUNTIME or APPCONTAINER.
--   Otherwise, it calls
--
--     whenever sqlerror continue
--
-- ARGUMENTS
--   * 1: INSTALL_TYPE
--
-- MODIFIED  (MM/DD/YYYY)
--   cneumuel 07/02/2018 - Created
--
--------------------------------------------------------------------------------

set define '^' termout off
col apxsqler_script new_val apxsqler_script
select case
       when '^1' in ( 'MANUAL',
                      'RUNTIME',
                      'APPCONTAINER',
                      'APPCONTAINEREXT' )
       then 'apxsqler_exit'
       else 'apxsqler_continue'
       end apxsqler_script
  from sys.dual
/
set termout on
@^PREFIX.core/scripts/^apxsqler_script..sql
