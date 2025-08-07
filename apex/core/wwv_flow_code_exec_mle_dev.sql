set define '^' verify off
prompt ...wwv_flow_code_exec_mle_dev
create or replace package wwv_flow_code_exec_mle_dev authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_code_exec_mle_dev.sql
--
--    DESCRIPTION
--      This package is a helper package for MLE code in the Builder.
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

-- collection name used for storing temporary module contents when editing
c_collection_name constant varchar2(20) := 'MLE_MODULE_CODE_CLOB';

--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- Utility for the "About Oracle APEX" page. To be called from 4350:9
-- Prints out a special "not available" message on 19c
-- Prints out a special message on 21c pointing to 23ai
--
-- On 23ai, the following logic is used:
--
-- (If MLE is disabled)
--  MLE is disabled at Database Instance level via the system parameter MLE_PROG_LANGUAGES.
--
-- (If MLE is not available)
--  MLE is not available: <reason>
--
-- (Otherwise, for each parsing schema)
-- Schema <schema>:
--  (loop through all MLE languages. Only JavaScript (MLE) for now)
--  - Can create MLE modules. / Cannot create MLE modules. Missing privileges: CREATE MLE
--  - Can execute <language> code. / Cannot execute <language> code. Missing privileges [EXECUTE DYNAMIC MLE,] [EXECUTE ON SYS.<language>]
--  [- Within the APEX Builder, <language> has been disabled via the MLE_LANGUAGES instance parameter.]
--
--==============================================================================
function get_about_html
    return varchar2;

--==============================================================================
-- Returns all the MLE languages supported by the specified parsing schema.
--==============================================================================
function get_languages (
    p_parsing_schema    in varchar2 )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Creates an MLE environment
--==============================================================================
procedure create_env (
    p_schema            in varchar2,
    p_env_name          in varchar2,
    p_language_options  in varchar2 default null );

--==============================================================================
-- Drops an MLE environment
--==============================================================================
procedure drop_env (
    p_schema            in varchar2,
    p_env_name          in varchar2 );

--==============================================================================
-- Updates an environment's language options
--==============================================================================
procedure update_env_language_options (
    p_schema            in varchar2,
    p_env_name          in varchar2,
    p_language_options  in varchar2 );

--==============================================================================
-- Adds an Import mapping
--==============================================================================
procedure add_env_import (
    p_schema            in varchar2,
    p_env_name          in varchar2,
    p_module_owner      in varchar2,
    p_module_name       in varchar2,
    p_import_name       in varchar2 );

--==============================================================================
-- Removes an Import mapping
--==============================================================================
procedure remove_env_import (
    p_schema            in varchar2,
    p_env_name          in varchar2,
    p_import_name       in varchar2 );

--==============================================================================
-- Compiles an MLE Environment
--==============================================================================
procedure compile_env (
    p_schema            in varchar2,
    p_env_name          in varchar2 );

--==============================================================================
-- Creates an MLE module
--==============================================================================
procedure create_module (
    p_schema            in varchar2,
    p_module_name       in varchar2,
    p_language          in wwv_flow_code_exec.t_language,
    p_version           in varchar2 default null,
    p_source            in clob );

--==============================================================================
-- Drops an MLE module
--==============================================================================
procedure drop_module (
    p_schema            in varchar2,
    p_module_name       in varchar2 );

--==============================================================================
-- Gets the module code without any ddl wrapper
--==============================================================================
function get_module_code (
    p_schema            in varchar2,
    p_module_name       in varchar2 )
    return clob;

end wwv_flow_code_exec_mle_dev;
/
show errors
