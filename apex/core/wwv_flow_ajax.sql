set define '^'

set verify off
prompt ...wwv_flow_ajax
create or replace package wwv_flow_ajax as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2007, 2021, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_ajax.plb
--    DESCRIPTION
--     Interface to handle worksheet AJAX interactions.
--
--
--    SECURITY
--      No grants, must be run as FLOW schema owner.
--
--    MODIFIED (MM/DD/YYYY)
--     cbackstr    05/03/2007 - Created
--
--------------------------------------------------------------------------------

empty_vc_arr wwv_flow_global.vc_arr2;
empty_vc_map wwv_flow_global.vc_map;

function json_replace(
    p_text     in varchar2 default null
)return varchar2;

procedure json_from_array (
    p_rows   in number default null,
    p_cols   in number default null,
    p_name01 in varchar2 default null,
    p_name02 in varchar2 default null,
    p_name03 in varchar2 default null,
    p_name04 in varchar2 default null,
    p_name05 in varchar2 default null,
    p_name06 in varchar2 default null,
    p_name07 in varchar2 default null,
    p_name08 in varchar2 default null,
    p_name09 in varchar2 default null,
    p_name10 in varchar2 default null,
    p_f01    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f02    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f03    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f04    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f05    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f06    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f07    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f08    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f09    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_f10    in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_sub    in varchar2 default 'N');

procedure json_from_items(
    p_items      in varchar2 default null,
    p_separator  in varchar2 default ':',
    p_sub        in varchar2 default 'N'
);

procedure json_from_string(
    p_items      in varchar2 default null,
    p_separator  in varchar2 default ':',
    p_sub        in varchar2 default 'N'
);

procedure ajax_collection(
	p_collection    in varchar2 default null,
	p_action		in varchar2 default null,
	p_format		in varchar2 default null,
	p_item			in varchar2 default null
);

procedure widget;

end wwv_flow_ajax;
/
show errors;
