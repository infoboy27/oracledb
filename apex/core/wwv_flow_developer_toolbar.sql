set define '^' verify off
prompt ...wwv_flow_developer_toolbar
create or replace package wwv_flow_developer_toolbar
is
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_developer_toolbar.plb
--
--    DESCRIPTION
--      This package is responsible for showing the developer toolbar.
--
--    MODIFIED   (MM/DD/YYYY)
--    sspadafo    06/20/2003 - Created
--
--------------------------------------------------------------------------------
--
g_ok_to_show_toolbar boolean := false;

--
procedure show_toolbar;
--
procedure add_component (
    p_type_id               in number,
    p_page_id               in number,
    p_id                    in number,
    p_dom_id                in varchar2,
    p_supports_live_options in boolean );
--
--==============================================================================
-- Dispatcher for all AJAX calls of the developer toolbar.
--==============================================================================
procedure ajax;

--==============================================================================
-- Returns the name of the preference for session overrides for an application
--==============================================================================
function get_session_overrides_prefname (
    p_application_id in number )
    return varchar2;

--==============================================================================
-- Apply Session Overrides at runtime for current builder user
-- Parameter p_caller is used to identify where is the procedure called from
-- Session overrides are applied differently dependending in the caller
--==============================================================================
procedure apply_session_overrides (
    p_caller in varchar2 );

--
end wwv_flow_developer_toolbar;
/
show errors
