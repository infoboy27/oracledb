set define '^' verify off
prompt ...apxsqler_continue.sql
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2019. All Rights Reserved.
--
-- NAME
--   apxsqler_continue.sql
--
-- DESCRIPTION
--   Continue on sqlerror
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  11/06/2019 - Created
--
--------------------------------------------------------------------------------

whenever sqlerror continue
