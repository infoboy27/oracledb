set define '^' verify off
prompt sw_util.sql
create or replace package wwv_flow_sw_util as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2002, 2023, Oracle and/or its affiliates.
--
--    NAME
--      sw_util.sql
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      msewtz   01/13/2002 - Created
--------------------------------------------------------------------------------

function get_pk_position (
    p_table_owner in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
return number;

function table_exists (
    p_name  in varchar2,
    p_owner in varchar2 )
return boolean;

--==============================================================================
-- copy of run_block from dynsql.plb
-- in order to call parse_as_user with useLogonRoles => TRUE
--==============================================================================
procedure run_block(
    p_sql  in varchar2,
    p_user in varchar2 );

--==============================================================================
-- This function executes the given sql or pl/sql
--
-- Parameters:
-- * p_schema        : Schema name for resolving privileges
-- * p_sql           : Code to execute
-- * p_ignore_errors : If it's true, this function returns SUCCESS even if there are compilation errors
--
-- Returns:
--   returns SUCCESS if no errors
--           Error message when there are errors
--==============================================================================
function run_other_sql (
    p_schema        in varchar2,
    p_sql           in varchar2,
    p_ignore_errors in boolean default false )
return varchar2;

procedure create_package(
    p_source  in sys.dbms_sql.varchar2a,
    p_owner   in varchar2 );

end wwv_flow_sw_util;
/
show errors