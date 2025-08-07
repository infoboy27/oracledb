set define '^' verify off
prompt wwv_flow_sc_transactions.sql
create or replace package wwv_flow_sc_transactions as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2005 - 2021. All Rights Reserved.
--
-- NAME
--   SQL Commands transactional/job API
--
-- RUNTIME DEPLOYMENT: NO
--
-- MODIFIED  (MM/DD/YYYY)
--   skutz    03/21/2005 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
function add_trans (
    p_session in number,
    p_user    in varchar2,
    p_schema  in varchar2,
    p_type    in varchar2,
    p_rows    in number,
    p_binds   in varchar2,
    p_sql     in clob )
    return number;

--==============================================================================
procedure sc_job (p_session in number, p_user in varchar2, p_language in varchar2 default null);

--==============================================================================
-- schedule sc_job (in app process of 4500)
--==============================================================================
function sc_create_job(p_language in varchar2 default null)
    return number;

end;
/

