set define '^' verify off
prompt ...wwv_flow_f4500_ob_dev
create or replace package wwv_flow_f4500_ob_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_f4500_ob_dev.sql
--
--    DESCRIPTION
--      This package contains the code for SQL Workshop > Object Browser.
--
--    RUNTIME DEPLOYMENT: NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cbcho       01/13/2022 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
subtype t_ob_type   is wwv_flow_global.t_dbms_id;
subtype t_view      is varchar2(11);
--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- The object types object browser supports.
-- Note: Must be valid Oracle sys.user_objects.object_type,
--       except OB specific types ( SODA COLLECTION ).
--------------------------------------------------------------------------------
c_table                   constant t_ob_type := 'TABLE';
c_view                    constant t_ob_type := 'VIEW';
c_index                   constant t_ob_type := 'INDEX';
c_sequence                constant t_ob_type := 'SEQUENCE';
c_type                    constant t_ob_type := 'TYPE';
c_package                 constant t_ob_type := 'PACKAGE';
c_procedure               constant t_ob_type := 'PROCEDURE';
c_function                constant t_ob_type := 'FUNCTION';
c_trigger                 constant t_ob_type := 'TRIGGER';
c_database_link           constant t_ob_type := 'DATABASE LINK';
c_materialized_view       constant t_ob_type := 'MATERIALIZED VIEW';
c_synonym                 constant t_ob_type := 'SYNONYM';
c_soda_collection         constant t_ob_type := 'SODA COLLECTION';
c_mle_environment         constant t_ob_type := 'MLE ENVIRONMENT';
c_mle_module              constant t_ob_type := 'MLE MODULE';

--------------------------------------------------------------------------------
-- constant to generate DDL for package spec separately
--------------------------------------------------------------------------------
c_package_spec            constant varchar2(12) := 'PACKAGE SPEC';

--------------------------------------------------------------------------------
-- the object view names client sends
--------------------------------------------------------------------------------
c_view_main               constant t_view := 'MAIN';
c_view_columns            constant t_view := 'COLUMNS';
c_view_data               constant t_view := 'DATA';
c_view_details            constant t_view := 'DETAILS';
c_view_indexes            constant t_view := 'INDEXES';
c_view_constraints        constant t_view := 'CONSTRAINTS';
c_view_grants             constant t_view := 'GRANTS';
c_view_stats              constant t_view := 'STATS';
c_view_triggers           constant t_view := 'TRIGGERS';
c_view_dependencies       constant t_view := 'DEPS';
c_view_ddl                constant t_view := 'DDL';
c_view_samples            constant t_view := 'SAMPLES';
c_view_code               constant t_view := 'CODE';
c_view_errors             constant t_view := 'ERRORS';
c_view_deps_syn           constant t_view := 'DEPS_SYN';
c_view_spec               constant t_view := 'SPEC';
c_view_body               constant t_view := 'BODY';
c_view_guide              constant t_view := 'GUIDE';
c_view_meta               constant t_view := 'META';
c_view_mle_imports        constant t_view := 'ENV_IMPORTS';

--
--==============================================================================
-- Normalizes the object type to valid Oracle sys.user_objects.object_type
--==============================================================================
function normalize_object_type (
    p_obj_type in varchar2 )
    return varchar2;

--
--==============================================================================
-- Returns create database objects cards report query
--==============================================================================
function get_create_obj_cards_query (
    p_type in varchar2 )
    return varchar2;

--
--==============================================================================
-- Handles emitting global variable values needed for Object Browser
--==============================================================================
procedure emit_globals;

--
--==============================================================================
-- Handles Object Browser AJAX request
--
-- Parameters:
-- * p_json_path:       The JSON path "Object Browser" plug-in AJAX request sends.
--==============================================================================
procedure ajax (
    p_json_path in varchar2 );

--
--==============================================================================
-- INTERNAL USE: Do not call directly!
--
-- This procedure acts as an interface for scheduler jobs.
-- It gets called when gathering statistics for TABLE or INDEX.
--
-- Parameters:
-- * p_owner:           The owner of the object.
-- * p_object_type:     Database object type.
-- * p_object_name:     The name of the object.
-- * p_apex_app_id:     The application ID.
-- * p_apex_page_id     The application page ID.
-- * p_apex_session_id  The Valid session ID.
-- * p_apex_ws_sgid     The workspace ID.
-- * p_parse_as_schema: Schema to execute the stats as.
--==============================================================================
procedure execute_gather_stats (
    p_owner             in varchar2,
    p_object_type       in varchar2,
    p_object_name       in varchar2,
    --
    p_apex_app_id       in number,
    p_apex_page_id      in number,
    p_apex_session_id   in number,
    p_apex_ws_sgid      in number,
    p_parse_as_schema   in varchar2 );

--
--==============================================================================
-- Executes DDL.
-- This procedure is exposed for OB Create Object Wizard. DDL execution happens
--   in seperate transaction, so it won't affect main transaction status
--   uses pragma autonomous_transaction
-- Parameters:
-- * p_ddl:             DDL to execute. Trims semicolon automatically.
-- * p_parse_as_schema: Schema to execute the DDL as.
--                      Automatically checks if the schema is valid for the current workspace,
--                      and the user has any workspace schema restriction.
--==============================================================================
procedure execute_ddl (
    p_ddl             in varchar2,
    p_parse_as_schema in varchar2 );

end wwv_flow_f4500_ob_dev;
/
show errors
