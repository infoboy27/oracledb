set define '^' verify off
prompt ...wwv_flow_css_calendar
create or replace package wwv_flow_css_calendar
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2013, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_css_calendar.sql
--
--    DESCRIPTION
--      This package is resonsible for handling css calendar native region plugin.
--
--    MODIFIED      (MM/DD/YYYY)
--    pmanirah       07/30/2013  - Created
--
--------------------------------------------------------------------------------


--==============================================================================
-- global variables
--==============================================================================
    
--==============================================================================
-- Renders the CSS Calendar region type based on the configuration of
-- the region.
--==============================================================================
procedure render_css_calendar (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow_meta_data.t_plug,
    p_is_printer_friendly in boolean );

--==============================================================================
-- Returns the CSS Calendar events.
--==============================================================================

procedure ajax_css_calendar (
    p_region in wwv_flow_plugin_api.t_region );

end wwv_flow_css_calendar;
/
show errors
