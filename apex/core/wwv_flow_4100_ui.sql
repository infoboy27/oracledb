set define '^' verify off
prompt ...wwv_flow_4100_ui
create or replace package wwv_flow_4100_ui as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_4100_ui.sql
--
--    DESCRIPTION
--      Utilities for internal application 4100
--
--    SECURITY
--      No grants
--
--    MODIFIED   (MM/DD/YYYY)
--    mouledha    12/13/2023 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Prints the most accessed applications of a workspace in a specific timeframe p_days
--==============================================================================
procedure top_applications_combo2 (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_chart_width       in number default 50,
    p_show_internal_yn  in varchar2 default 'Y',
    p_link              in varchar2 default null)
    ;


--==============================================================================
-- Prints the most active users of a workspace in a specific timeframe p_days and the count
-- of how many times they accessed the workspace
--==============================================================================
procedure top_users2 (
    p_app_session       in varchar2,
    p_security_group_id in varchar2,
    p_image_prefix      in varchar2,
    p_days              in varchar2 default null,
    p_display_count     in number default 8,
    p_max_length        in number default 20,
    p_chart_width       in number default 50,
    p_link              in varchar2 default null)
    ;


--==============================================================================
-- Shows the current reporting timeframe with a link to page 4100:3 where the timeframe can be changed 
--==============================================================================
procedure show_page_event_link (
    p_days              in varchar2 default null,
    p_link              in varchar2 default null)
;


--==============================================================================
-- Returns whether we are allowed to check for product updates ("call home") in this instance (for example, from page
-- 4100:1). By default, we will perform this check unless disabled at user/developer level - see updates() procedure.
--==============================================================================
function updates_check_enabled return boolean;

end wwv_flow_4100_ui;
/
show errors
