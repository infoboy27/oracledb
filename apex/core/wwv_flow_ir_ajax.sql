set define '^' verify off
prompt ...wwv_flow_ir_ajax
create or replace package wwv_flow_ir_ajax as
------------------------------------------------------------------------------------------------------------------------
--
--   Copyright (c) 2017, 2022, Oracle and/or its affiliates.
-- 
--     NAME
--       wwv_flow_ir_ajax.sql
--
--     DESCRIPTION
--      Interface to handle interactive report AJAX interactions.
-- 
--     SECURITY
--       No grants, must be run as FLOW schema owner.
-- 
--     MODIFIED (MM/DD/YYYY)
--      cczarski    08/11/2017 - Created
------------------------------------------------------------------------------------------------------------------------
--

procedure ajax(
    p_region        in wwv_flow_plugin_api.t_region );

end wwv_flow_ir_ajax;

/
show errors;
