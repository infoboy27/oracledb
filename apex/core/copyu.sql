set define '^'
set verify off
prompt ...wwv_flow_copy_util


create or replace package wwv_flow_copy_util
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2002, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_copy_util.sql
--
--    DESCRIPTION
--      Used to copy flow objects.
--
--    MODIFIED   (MM/DD/YYYY)
--    cbcho      03/04/2002 - Created
--
--------------------------------------------------------------------------------

procedure copy_security_scheme (
    p_copy_from_flow_id   in number,
    p_flow_id             in varchar2,
    p_from_scheme_id      in number,
    p_to_scheme_name      in varchar2,
    p_to_scheme_id        in number  default null,
    p_subscribe           in boolean default false,
    p_copy_subscription   in boolean default false );
--
--==============================================================================
procedure copy_navbar (
    p_copy_from_flow_id   in number,
    p_flow_id             in varchar2,
    p_from_navbar_id      in number,
    p_to_navbar_name      in varchar2,
    p_to_navbar_id        in number default null );

--
--==============================================================================
procedure copy_plugin (
    p_from_application_id       in number,
    p_from_plugin_id            in number,
    p_to_application_id         in number,
    p_to_plugin_id              in number   default null,
    p_to_display_name           in varchar2 default null,
    p_subscribe                 in boolean  default false,
    p_from_theme_id             in number   default null,
    p_to_theme_id               in number   default null,
    p_if_existing_raise_dupval  in boolean  default false );
--
end wwv_flow_copy_util;
/
show error;