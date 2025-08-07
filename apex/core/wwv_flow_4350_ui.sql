set define '^' verify off
prompt ...wwv_flow_4350_ui.sql
create or replace package wwv_flow_4350_ui as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
-- NAME
--   wwv_flow_4350_ui.sql
--
-- DESCRIPTION
--   UI code for workspace administration app
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  10/28/2020 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Send a workspace usage email.
--==============================================================================
procedure p83_send_ws_usage_mail (
    p_security_group_id in number default null,
    p_to                in varchar2,
    p_subject           in varchar2,
    p_body              in varchar2,
    p_reporting_period  in varchar2,
    p_date_time_format  in varchar2 );

--==============================================================================
-- Check multiple users emails, make sure they have a valid email pattern
--
-- Parameters:
-- * p_users_email               email address(es)
--
-- Example:
--
--   begin
--       if wwv_flow_4350_ui.check_email_list_pattern (
--           p_users_email => apex_t_varchar2('john.doe@example.com','frank.smith@example.com') )
--       then sys.htp.p('YES');
--       else sys.htp.p('NO');
--       end if;
--   end;
--==============================================================================
function check_email_list_pattern (
    p_users_email in varchar2 default null )
    return boolean;

end wwv_flow_4350_ui;
/
show err

