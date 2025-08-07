set define off verify off
prompt ...wwv_flow_user_interface
create or replace package wwv_flow_user_interface as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_user_interface.sql
--
--    DESCRIPTION
--      This package is responsible for handling user interfaces by the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/09/2012 - Created
--
--------------------------------------------------------------------------------
--
--==============================================================================
-- Returns the theme id of the specified application.
--==============================================================================
function get_theme_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the global page id of the specified application.
--==============================================================================
function get_global_page_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;

end wwv_flow_user_interface;
/
show errors

set define '^'
