set define '^' verify off
prompt ...wwv_flow_code_exec
create or replace package wwv_flow_code_exec authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_code_exec.sql
--
--    DESCRIPTION
--      This package is responsible for executing code in the specified language.
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
type t_bind_value is record (
    name  varchar2( 255 ),
    value varchar2( 32767 ) );

type t_bind_values is table of t_bind_value index by pls_integer;

subtype vc_arr2 is wwv_flow_global.vc_arr2;
subtype t_language is wwv_flow_exec_api.t_language;

--==============================================================================
-- Global constants
--==============================================================================

-- Note: keep in sync with api.plb / migrate_source_code_lang!
c_plsql      constant t_language := wwv_flow_exec_api.c_lang_plsql;
c_javascript constant t_language := wwv_flow_exec_api.c_lang_javascript;
c_java       constant t_language := 'JAVA';
c_python     constant t_language := 'PYTHON';
c_sql        constant t_language := 'SQL'; -- only supported for get_expression_*

c_empy_binds   t_bind_values;
c_empty_names  vc_arr2;
c_empty_values vc_arr2;

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
    p_language         in t_language,
    p_data_type        in wwv_flow_exec_api.t_data_type,
    p_auto_bind_items  in boolean                        default true,
    p_names            in vc_arr2                        default c_empty_names,
    p_values           in vc_arr2                        default c_empty_values,
    p_binds            in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema  in varchar2                       default wwv_flow_security.g_parse_as_schema,
    p_mle_env          in varchar2                       default wwv_flow_security.g_mle_environment )
    return wwv_flow_exec_api.t_value;

--==============================================================================
-- Executes an expression and returns a VARCHAR2 result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_expression: expression in the language specified which returns string.
-- p_language:   language of the expression.
--==============================================================================
function get_expression_result_varchar2 (
    p_expression       in varchar2,
    p_language         in t_language,
    p_auto_bind_items  in boolean    default true,
    p_names            in vc_arr2    default c_empty_names,
    p_values           in vc_arr2    default c_empty_values,
    p_parse_as_schema  in varchar2   default wwv_flow_security.g_parse_as_schema,
    p_mle_env          in varchar2   default wwv_flow_security.g_mle_environment )
    return varchar2;

--==============================================================================
-- Executes an expression and returns a BOOLEAN result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_expression: expression in the language specified which returns boolean.
-- p_language:   language of the expression.
--==============================================================================
function get_expression_result_boolean (
    p_expression       in varchar2,
    p_language         in t_language,
    p_auto_bind_items  in boolean    default true,
    p_names            in vc_arr2    default c_empty_names,
    p_values           in vc_arr2    default c_empty_values,
    p_parse_as_schema  in varchar2   default wwv_flow_security.g_parse_as_schema,
    p_mle_env          in varchar2   default wwv_flow_security.g_mle_environment )
    return boolean;

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
    p_function_body   in varchar2,
    p_language        in t_language,
    p_data_type       in wwv_flow_exec_api.t_data_type,
    p_auto_bind_items in boolean                        default true,
    p_names           in vc_arr2                        default c_empty_names,
    p_values          in vc_arr2                        default c_empty_values,
    p_binds           in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema in varchar2                       default wwv_flow_security.g_parse_as_schema,
    p_mle_env         in varchar2                       default wwv_flow_security.g_mle_environment )
    return wwv_flow_exec_api.t_value;

--==============================================================================
-- Executes a function body and returns a VARCHAR2 result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_function_body: function body in the language specified which returns string.
-- p_language:      language of the function body.
--
--                  PL/SQL example:
--                  declare
--                      l_test varchar2(10);
--                  begin
--                      -- do something
--                      return l_test;
--                  end;
--==============================================================================
function get_func_body_result_varchar2 (
    p_function_body    in varchar2,
    p_language         in t_language,
    p_auto_bind_items  in boolean    default true,
    p_names            in vc_arr2    default c_empty_names,
    p_values           in vc_arr2    default c_empty_values,
    p_parse_as_schema  in varchar2   default wwv_flow_security.g_parse_as_schema,
    p_mle_env          in varchar2   default wwv_flow_security.g_mle_environment,
    p_do_substitutions in boolean    default true ) -- $$$ remove????
    return varchar2;

--==============================================================================
-- Executes a function body and returns a CLOB result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_function_body: function body in the language specified which returns a clob.
-- p_language:      language of the expression.
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
    p_function_body   in varchar2,
    p_language        in t_language,
    p_auto_bind_items in boolean    default true,
    p_names           in vc_arr2    default c_empty_names,
    p_values          in vc_arr2    default c_empty_values,
    p_parse_as_schema in varchar2   default wwv_flow_security.g_parse_as_schema,
    p_mle_env         in varchar2   default wwv_flow_security.g_mle_environment )
    return clob;

--==============================================================================
-- Executes a function body and returns a BOOLEAN result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_function_body: function body in the language specified which returns boolean.
-- p_language:      language of the expression.
--
--                  PL/SQL example:
--                  declare
--                      l_test boolean;
--                  begin
--                      -- do something
--                      return l_test;
--                  end;
--==============================================================================
function get_func_body_result_boolean (
    p_function_body   in varchar2,
    p_language        in t_language,
    p_auto_bind_items in boolean    default true,
    p_names           in vc_arr2    default c_empty_names,
    p_values          in vc_arr2    default c_empty_values,
    p_parse_as_schema in varchar2   default wwv_flow_security.g_parse_as_schema,
    p_mle_env         in varchar2   default wwv_flow_security.g_mle_environment )
    return boolean;

--==============================================================================
-- Executes code.
--
-- The procedure automatically performs the necessary binding of bind variables.
--
-- p_code:     code in the language specified which should get executed.
-- p_language: language of the expression.
--==============================================================================
procedure execute (
    p_code                 in varchar2,
    p_language             in t_language,
    p_auto_bind_items      in boolean                        default true,
    p_names                in vc_arr2                        default c_empty_names,
    p_values               in vc_arr2                        default c_empty_values,
    p_binds                in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema      in varchar2                       default wwv_flow_security.g_parse_as_schema,
    p_is_user_schema       in boolean                        default null,
    p_mle_env              in varchar2                       default wwv_flow_security.g_mle_environment,
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
    p_language             in            t_language,
    p_auto_bind_items      in            boolean  default true,
    p_names                in out nocopy vc_arr2,
    p_values               in out nocopy vc_arr2,
    p_binds                in            wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema      in            varchar2                       default wwv_flow_security.g_parse_as_schema,
    p_is_user_schema       in            boolean                        default null,
    p_mle_env              in            varchar2                       default wwv_flow_security.g_mle_environment,
    p_commit_session_state in            boolean                        default true,
    p_plugin_cache_key     in            varchar2                       default null );

--==============================================================================
-- Returns a complete data type that can be used for variable declarations.
-- For example, VARCHAR2 becomes VARCHAR2(32767)
--==============================================================================
function get_variable_data_type (
    p_data_type in varchar2 )
    return varchar2;

--==============================================================================
-- Close any cached cursors (called from wwv_flow_security.teardown).
--==============================================================================
procedure teardown;

end wwv_flow_code_exec;
/
show errors
