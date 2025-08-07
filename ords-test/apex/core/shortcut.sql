set define '^' verify off
prompt ...wwv_flow_render_shortcut
create or replace package wwv_flow_render_shortcut as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2000 - 2021. All Rights Reserved.
--
--    NAME
--      shortcut.sql
--
--    DESCRIPTION
--      Substitucte shortcuts in HTML text
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--      mhichwa  09/04/2000 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
function do_shortcuts_exist (
    p_string       in varchar2)
    return boolean;

--==============================================================================
function expand_shortcuts (
    p_string           in varchar2,
    p_current_item_idx in pls_integer default null )
    return varchar2;

end wwv_flow_render_shortcut;
/
show errors
