set define '^' verify off
prompt ...wwv_flow_app_def_api_v3
create or replace package wwv_flow_app_def_api_v3 as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2017. All Rights Reserved.
--
--    NAME
--      wwv_flow_app_def_api_v3.sql
--
--    DESCRIPTION
--      Used to apply application default settings
--
--    NOTES
--      This API is unsupported.    
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    04/19/2017 - Created
--     cbcho    04/28/2017 - Added apply_app_defaults
--     cbcho    10/02/2017 - Added get_table_label
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--

function get_table_label(
    p_table_name in varchar2,
    p_type       in varchar2 default 'SINGULAR' ) return varchar2;

procedure apply_app_defaults(
    p_app_id  in number );


end wwv_flow_app_def_api_v3;
/
show errors;