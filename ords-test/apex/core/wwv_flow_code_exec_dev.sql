set define '^'
set verify off
prompt ...wwv_flow_code_exec_dev
create or replace package wwv_flow_code_exec_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_code_exec_dev.sql
--
--    DESCRIPTION
--      This package is responsible for checking code in the specified language.
--
--      Package must be authid definer, see qkscollIsBinException.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    07/24/2020 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================
subtype t_check_type is varchar2( 40 );

c_check_block          constant t_check_type := 'BLOCK';
c_check_procedures     constant t_check_type := 'PROCEDURES';
c_check_expression     constant t_check_type := 'EXPRESSION';
c_check_func_body      constant t_check_type := 'FUNCTION_BODY';
c_check_sql_query      constant t_check_type := 'SQL_QUERY';
c_check_sql_expression constant t_check_type := 'SQL_EXPRESSION';

subtype t_return_data_type is pls_integer range 1..4;

c_return_data_type_boolean  constant t_return_data_type := 1;
c_return_data_type_varchar2 constant t_return_data_type := 2;
c_return_data_type_clob     constant t_return_data_type := 3;
c_return_data_type_custom   constant t_return_data_type := 4;

--==============================================================================
-- Checks an anonymous code block against the local database and
-- returns the validation error as result.
--==============================================================================
function check_code (
    p_type             in t_check_type       default c_check_block,
    p_return_data_type in t_return_data_type default null,
    p_custom_data_type in varchar2           default null,
    p_code             in varchar2,
    p_language         in wwv_flow_code_exec.t_language,
    -- Used by local database
    p_application_id   in number             default nv( 'FB_FLOW_ID' ),
    p_parse_as_schema  in varchar2           default null )
    return varchar2;

--==============================================================================
-- Prepend and/or Append some code to the existing array.
-- Ensure the first array index remains the same after.
procedure wrap_code (
    p_before in            varchar2,
    p_array  in out nocopy wwv_flow_global.vc_arr2,
    p_after  in            varchar2 );

--==============================================================================
-- Generates the PL/SQL code to check the entered code against the
-- local or remote database.
--==============================================================================
function generate_check_plsql (
    p_type             in t_check_type,
    p_return_data_type in t_return_data_type default null,
    p_custom_data_type in varchar2           default null,
    p_code             in varchar2 )
    return varchar2;

procedure generate_check_plsql_array (
    p_type             in            t_check_type,
    p_return_data_type in            t_return_data_type default null,
    p_custom_data_type in            varchar2           default null,
    p_code             in out nocopy wwv_flow_global.vc_arr2 );

end wwv_flow_code_exec_dev;
/
show errors
