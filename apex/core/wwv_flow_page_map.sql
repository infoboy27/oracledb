set define '^' verify off
prompt wwv_flow_page_map.sql
create or replace package wwv_flow_page_map as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2006, 2022, Oracle and/or its affiliates.
--
--    MODIFIED   (MM/DD/YYYY)
--    mhichwa     11/20/2006 - Created
--
--------------------------------------------------------------------------------

function page_type (
   p_application_id in number,
   p_page_id in number)
return varchar2;

procedure set_page (
   p_application_id in number,
   p_page_id        in number);

procedure set_current_application (
   p_application_id in number,
   p_date           in date default null);

function extract_page_id (
    p_url               in varchar2,
    p_application_id    in number default wwv_flow_security.g_flow_id )
return number;

function get_home_page_id (
    p_application_id    in number default wwv_flow_security.g_flow_id )
return number;

end wwv_flow_page_map;
/
show errors