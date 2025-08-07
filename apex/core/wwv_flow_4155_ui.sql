set define '^' verify off
prompt ...wwv_flow_4155_ui.sql
create or replace package wwv_flow_4155_ui as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2023. All Rights Reserved.
--
--    NAME
--      wwv_flow_4155_ui.sql
--
--    DESCRIPTION
--      Utilities for application 4155
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/17/2013 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Internal login application authentication plugin
--
-- Check if session can be used.
--==============================================================================
function session_sentry (
    p_authentication in wwv_flow_plugin_api.t_authentication,
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_is_public_page in boolean )
    return wwv_flow_plugin_api.t_authentication_sentry_result;

--==============================================================================
-- Return the current user, which has an expired password.
--==============================================================================
function get_expired_user_name
    return varchar2;

--==============================================================================
-- Change the current user's password and redirect back to the deep link page.
-- This procedure expects the password item name instead of the password itself,
-- to easily clear caches. Passing the bind variable would re-instantiate the
-- value again.
--
-- Parameters:
-- * p_password_item_name: The name of the item which contains the password.
--==============================================================================
procedure change_password_and_redirect (
    p_password_item_name in varchar2 );

end wwv_flow_4155_ui;
/
show err

