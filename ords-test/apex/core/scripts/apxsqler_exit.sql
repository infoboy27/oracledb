set define '^' verify off
prompt ...apxsqler_exit.sql
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2019. All Rights Reserved.
--
-- NAME
--   apxsqler_exit.sql
--
-- DESCRIPTION
--   Exit on sqlerror
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  11/06/2019 - Created
--
--------------------------------------------------------------------------------

whenever sqlerror exit sql.sqlcode rollback
