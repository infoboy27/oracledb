set define '^' verify off
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2023. All Rights Reserved.
--
-- NAME
--   end_action.sql
--
-- DESCRIPTION
--   Utility script to display timing of install action
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   jstraub   03/22/2023 - Created
--
--------------------------------------------------------------------------------

column tming new_val tming
set termout off
select rtrim(to_char ((tm2 - tm1)*24*60,'9990D99MI' )) tming from (
select (select started_at from ^APPUN..wwv_install_action$ where action = '^1' and install_id = :install_id and phase = ^3) tm1,
       (select started_at from ^APPUN..wwv_install_action$ where action = '^2' and install_id = :install_id and phase = ^3) tm2
  from sys.dual);
set termout on

prompt
prompt timing for: ^1
prompt Elapsed: ^tming
prompt

prompt #
prompt # ^2
prompt #