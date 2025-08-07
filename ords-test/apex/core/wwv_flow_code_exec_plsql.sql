set define '^' verify off
prompt ...wwv_flow_code_exec_plsql
create or replace package wwv_flow_code_exec_plsql authid definer
accessible by (package WWV_FLOW_CODE_EXEC)
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_code_exec_plsql.sql
--
--    DESCRIPTION
--      This package is responsible for executing PL/SQL code.
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
-- Global constants
--==============================================================================

--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- Executes an expression and returns a result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_expression: expression in the language specified which returns the
--               expected data type specified in p_data_type.
-- p_data_type:  expected data type of the result.
--==============================================================================
function get_expression_result (
    p_expression       in varchar2,
    p_data_type        in wwv_flow_exec_api.t_data_type,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_binds            in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema  in varchar2 )
    return wwv_flow_exec_api.t_value;

--==============================================================================
-- Executes an expression and returns a VARCHAR2 result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_expression: expression in the language specified which returns string.
--==============================================================================
function get_expression_result_varchar2 (
    p_expression       in varchar2,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_parse_as_schema  in varchar2 )
    return varchar2; 

--==============================================================================
-- Executes an expression and returns a BOOLEAN result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_expression: expression in the language specified which returns boolean.
--==============================================================================
function get_expression_result_boolean (
    p_expression       in varchar2,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_parse_as_schema  in varchar2 )
    return boolean;

--==============================================================================
-- Executes a function body and returns a result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_function_body: function body in the language specified which returns the
--                  expected data type specified in p_data_type.
-- p_data_type:     expected data type of the result.
--==============================================================================
function get_func_body_result (
    p_function_body    in varchar2,
    p_data_type        in wwv_flow_exec_api.t_data_type,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_binds            in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema  in varchar2 )
    return wwv_flow_exec_api.t_value;

--==============================================================================
-- Executes a function body and returns a VARCHAR2 result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_function_body: function body in the language specified which returns string.
--
--                  Eexample:
--                  declare
--                      l_test varchar2(10);
--                  begin
--                      -- do something
--                      return l_test;
--                  end;
--==============================================================================
function get_func_body_result_varchar2 (
    p_function_body    in varchar2,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_parse_as_schema  in varchar2,
    p_do_substitutions in boolean ) -- $$$ remove????
    return varchar2;

--==============================================================================
-- Executes a function body and returns a CLOB result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_function_body: function body in the language specified which returns a clob.
--
--                  PL/SQL example:
--                  declare
--                      l_test clob;
--                  begin
--                      -- do something
--                      return l_test;
--                  end;
--==============================================================================
function get_func_body_result_clob (
    p_function_body    in varchar2,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_parse_as_schema  in varchar2 )
    return clob;

--==============================================================================
-- Executes a function body and returns a BOOLEAN result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_function_body: function body in the language specified which returns boolean.
--
--                  Example:
--                  declare
--                      l_test boolean;
--                  begin
--                      -- do something
--                      return l_test;
--                  end;
--==============================================================================
function get_func_body_result_boolean (
    p_function_body    in varchar2,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_parse_as_schema  in varchar2 )
    return boolean;
    
--==============================================================================
-- Executes code.
--
-- The procedure automatically performs the necessary binding of bind variables.
--
-- p_code:     code in the language specified which should get executed.
--==============================================================================
procedure execute (
    p_code                 in varchar2,
    p_auto_bind_items      in boolean,
    p_names                in wwv_flow_code_exec.vc_arr2     default wwv_flow_code_exec.c_empty_names,
    p_values               in wwv_flow_code_exec.vc_arr2     default wwv_flow_code_exec.c_empty_values,
    p_binds                in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema      in varchar2                       default wwv_flow_security.g_parse_as_schema,
    p_is_user_schema       in boolean                        default null,
    p_commit_session_state in boolean                        default true,
    p_plugin_cache_key     in varchar2                       default null );

--==============================================================================
-- Executes code and returns OUT bind variables.
--
-- The procedure automatically performs the necessary binding of bind variables
-- and returns the new bind variable values after processing in the p_names and
-- p_values arguments (IN OUT NOCOPY)
--
-- When wwv_flow_plugin passes a cache key (type:name) in, the cursor gets
-- cached and reused on the next call with the same cache key.
--==============================================================================
procedure execute_return_out_binds (
    p_code                 in            varchar2,
    p_auto_bind_items      in            boolean,
    p_names                in out nocopy wwv_flow_code_exec.vc_arr2,
    p_values               in out nocopy wwv_flow_code_exec.vc_arr2,
    p_binds                in            wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema      in            varchar2                       default wwv_flow_security.g_parse_as_schema,
    p_is_user_schema       in            boolean                        default null,
    p_commit_session_state in            boolean                        default true,
    p_plugin_cache_key     in            varchar2                       default null );

--==============================================================================
-- Close any cached cursors (called from wwv_flow_security.teardown).
--==============================================================================
procedure teardown;

end wwv_flow_code_exec_plsql;
/
show errors
