set define '^' verify off
prompt ...wwv_patch_applied.sql
create or replace function wwv_patch_applied
    return varchar2
is
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
--
-- NAME
--   wwv_patch_applied.sql
--
-- DESCRIPTION
--   This function returns APPLIED, but it's main purpose is to init the CGI
--   environment and therefore mask cookies.
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  05/07/2021 - Created
--
--------------------------------------------------------------------------------
    l_dummy varchar2(30);
begin
    execute immediate 'begin :a := wwv_flow_cgi.get_request_method; end;'
      using out l_dummy;
    return 'APPLIED';
end wwv_patch_applied;
/
show err

