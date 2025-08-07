set define '^' verify off
prompt ...wwv_flow_code_exec_mle
create or replace package wwv_flow_code_exec_mle authid definer
accessible by (package WWV_FLOW_CODE_EXEC)
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_code_exec_mle.sql
--
--    DESCRIPTION
--      This package is responsible for executing MLE code.
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
-- p_language:   language of the expression.
-- p_data_type:  expected data type of the result.
--==============================================================================
function get_expression_result (
    p_expression       in varchar2,
    p_language         in wwv_flow_code_exec.t_language,
    p_data_type        in wwv_flow_exec_api.t_data_type,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_binds            in wwv_flow_exec_api.t_parameters,
    p_parse_as_schema  in varchar2,
    p_mle_env          in varchar2 )
    return wwv_flow_exec_api.t_value;       

--==============================================================================
-- Executes a function body and returns a result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_function_body: function body in the language specified which returns the
--                  expected data type specified in p_data_type.
-- p_language:      language of the expression.
-- p_data_type:     expected data type of the result.
--==============================================================================
function get_func_body_result (
    p_function_body    in varchar2,
    p_language         in wwv_flow_code_exec.t_language,
    p_data_type        in wwv_flow_exec_api.t_data_type,
    p_auto_bind_items  in boolean,
    p_names            in wwv_flow_code_exec.vc_arr2,
    p_values           in wwv_flow_code_exec.vc_arr2,
    p_binds            in wwv_flow_exec_api.t_parameters,
    p_parse_as_schema  in varchar2,
    p_mle_env          in varchar2 )
    return wwv_flow_exec_api.t_value;

--==============================================================================
-- Executes code.
--
-- The procedure automatically performs the necessary binding of bind variables.
--
-- p_code:     code in the language specified which should get executed.
--==============================================================================
procedure execute (
    p_code                 in varchar2,
    p_language             in wwv_flow_code_exec.t_language,
    p_auto_bind_items      in boolean,
    p_names                in wwv_flow_code_exec.vc_arr2,
    p_values               in wwv_flow_code_exec.vc_arr2,
    p_binds                in wwv_flow_exec_api.t_parameters,
    p_parse_as_schema      in varchar2,
    p_is_user_schema       in boolean,
    p_mle_env              in varchar2,
    p_commit_session_state in boolean );

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
    p_language             in            wwv_flow_code_exec.t_language,
    p_auto_bind_items      in            boolean,
    p_names                in out nocopy wwv_flow_code_exec.vc_arr2,
    p_values               in out nocopy wwv_flow_code_exec.vc_arr2,
    p_binds                in            wwv_flow_exec_api.t_parameters,
    p_parse_as_schema      in            varchar2,
    p_is_user_schema       in            boolean,
    p_mle_env              in            varchar2,
    p_commit_session_state in            boolean );

--==============================================================================
-- Close any cached cursors (called from wwv_flow_security.teardown).
--==============================================================================
procedure teardown;

end wwv_flow_code_exec_mle;
/
show errors
