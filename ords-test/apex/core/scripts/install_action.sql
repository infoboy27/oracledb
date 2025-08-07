set define '^' verify off
--------------------------------------------------------------------------------
--
-- Copyright (c) 2012, 2023, Oracle and/or its affiliates.
--
-- NAME
--   install_action.sql
--
-- DESCRIPTION
--   Utility script to log an install action
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  06/26/2018 - Created
--
--------------------------------------------------------------------------------
@^PREFIX.core/scripts/timing_stop.sql

prompt #
prompt # ^1
prompt #

@^PREFIX.core/scripts/timing_start.sql "^1"
exec ^APPUN..wwv_install_api.action('^1')
