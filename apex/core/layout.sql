set define '^'
set verify off
prompt ...wwv_flow_region_layout

--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2000 - 2021. All Rights Reserved.
--
--    NAME
--      layout.sql
--
--    DESCRIPTION
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   07/17/2000 - Created
--
---------------------------------------------------------------------------------

create or replace package wwv_flow_region_layout
as

g_first_process boolean := true;
  
procedure set_lock_status (
    p_flow in number,
    p_page in number);

procedure page_template_substitution (
    p_flow          in number,   
    p_template_id   in number);
        
procedure region_template_substitution (
    p_flow          in number,   
    p_template_id   in number);

function get_process_type_desc (
    p_flow_id      in number,
    p_process_type in varchar2 )
    return varchar2;

end wwv_flow_region_layout;
/
show errors
