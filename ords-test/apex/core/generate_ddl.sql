set define '^'
set verify off
prompt ...wwv_flow_generate_ddl
create or replace package wwv_flow_generate_ddl
AUTHID CURRENT_USER
as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2002, 2023, Oracle and/or its affiliates.
--
--    NAME
--      generate_ddl.sql
--
--    DESCRIPTION
--      Used to generate DDL using sys.dbms_metadata.
--
--    SECURITY
--      Grant execute to Public.  Synonym is NOT availabe on wwv_flow_generate_ddl.
--      This package is invokers right package.
--
--    MODIFIED   (MM/DD/YYYY)
--      cbcho     08/02/2002 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
subtype t_filter_name is varchar2(22);
subtype t_output      is varchar2(17);

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

--
-- Filter Names for sys.DBMS_METADATA.SET_FILTER
--
-- filters DDL for the passed objects
c_filter_name_expr            constant t_filter_name := 'NAME_EXPR';
-- filters DDL for objects dependent on the passed objects
c_filter_name_base_name_expr  constant t_filter_name := 'BASE_OBJECT_NAME_EXPR';

--
-- output types to emit DDL
--
c_output_to_script      constant t_output := 'SCRIPT';  -- writes to BLOB and saves to SQL Workshop > Scripts
c_output_to_htp         constant t_output := 'HTP';     -- writes to HTP buffer
c_output_to_clob        constant t_output := 'CLOB';    -- writes to CLOB
c_output_to_blob        constant t_output := 'BLOB';    -- writes to BLOB

--==============================================================================
-- This procedure is the main procedure to get DDL using sys.DBMS_METADATA.
--
-- NOTES
-- 1. This gets DDL per Object Type
-- 2. This gets run dynamically from execute_get_* procedures as invoker's rights.
--
-- PARAMETERS
-- * p_schema:             The name of the schema.
-- * p_object_type:        The object type.
--   p_objects:            The colon delimited object names for the object type.
--                         If NULL, gets all objects for the object type.
--   p_filter:             How to filter the objects using the p_objects.
--   p_inc_dependent_ddls: If TRUE, dependent object DDLs are included.
--
-- EXAMPLE
--   Get DDL for talbes EMP:DEPT owned by SCOTT.
--
--   begin
--       wwv_flow_generate_ddl.get_ddl (
--           p_schema      => 'SCOTT',
--           p_object_type => 'TABLE',
--           p_objects     => 'EMP:DEPT' );
--   end;
--==============================================================================
procedure get_ddl (
    p_schema             in varchar2,
    p_object_type        in varchar2,
    p_objects            in varchar2 default null,
    p_filter             in t_filter_name default c_filter_name_expr,
    p_inc_dependent_ddls in boolean default false );

--==============================================================================
-- This procedure is a wrapper call to get_ddl and get_dependent_ddl.
-- Executes dynamically to get DDL for multiple object types and object names.
--
-- PARAMETERS
-- * p_schema:             The name of the schema.
-- * p_object_types:       The colon delimited object types.
--   p_objects:            The colon delimited object names.
--                         If NULL, gets all objects for each iteration of p_object_types.
--   p_filter:             How to filter the objects using the p_objects.
--   p_inc_dependent_ddls: If TRUE, dependent object DDLs are included.
--   p_output_type:        Where to output the DDL ( htp buffer, clob or SQL Workshop Script )
--
--   p_filename:           If c_output_to_script, script file name
--   p_description:        If c_output_to_script, script file description
--
-- EXAMPLE
--   Get DDL for object types TABLE:SEQUENCE with object names EMP:DEPT:EMP_SEQ owned by SCOTT
--   then output to SQL Workshop > Script.
--
--   begin
--       wwv_flow_generate_ddl.execute_get_ddl (
--           p_schema      => 'SCOTT',
--           p_object_type => 'TABLE:SEQUENCE',
--           p_objects     => 'EMP:DEPT:EMP_SEQ',
--           p_output_type => c_output_to_script,
--           --
--           p_filename    => 'EmpDept',
--           p_description => 'DDL for EMP and DEPT' );
--   end;
--==============================================================================
procedure execute_get_ddl (
    p_schema              in varchar2,
    p_object_types        in varchar2,
    p_objects             in varchar2 default null,
    p_filter              in t_filter_name default c_filter_name_expr,
    --
    p_inc_dependent_ddls  in boolean default false,
    p_output_type         in t_output default null,
    --
    p_filename            in varchar2 default null,
    p_description         in varchar2 default null );

--==============================================================================
-- Get DDL for App > Supporting Objects in CLOB.
--
-- PARAMETERS
-- * p_schema:      The name of the schema.
-- * p_object_type: The object type
--   p_objects:     The colon delimited object names for the object type
--
-- EXAMPLE
--   Get DDL for talbes EMP:DEPT owned by SCOTT
--
--   declare
--       l_ddl clob;
--   begin
--       l_ddl := wwv_flow_generate_ddl.get_ddl_supporting_objects (
--                    p_schema      => 'SCOTT',
--                    p_object_type => 'TABLE',
--                    p_objects     => 'EMP:DEPT' );
--   end;
--==============================================================================
function get_ddl_supporting_objects (
    p_schema      in varchar2,
    p_object_type in varchar2,
    p_objects     in varchar2 default null )
    return clob;

--==============================================================================
-- Get DDL for a specific object type and name in CLOB.
--
-- PARAMETERS
-- * p_schema:             The name of the schema.
-- * p_object_type:        The object type
--   p_object_name:        The object name for the object type
--   p_inc_dependent_ddls: If TRUE, dependent object DDLs are included.
--
-- EXAMPLE
--   Get DDL for talbe EMP owned by SCOTT
--
--   declare
--       l_ddl clob;
--   begin
--       l_ddl := wwv_flow_generate_ddl.get_clob_output (
--                    p_schema      => 'SCOTT',
--                    p_object_type => 'TABLE',
--                    p_objects     => 'EMP' );
--   end;
--==============================================================================
function get_clob_output (
    p_schema             in varchar2,
    p_object_type        in varchar2,
    p_object_name        in varchar2 default null,
    p_inc_dependent_ddls in boolean default false )
    return clob;

--==============================================================================
-- Get DDL for a specific object type and name in BLOB.
--
-- PARAMETERS
-- * p_schema:             The name of the schema.
-- * p_object_type:        The object type
--   p_object_name:        The object name for the object type
--   p_inc_dependent_ddls: If TRUE, dependent object DDLs are included.
--
-- EXAMPLE
--   Get DDL for talbe EMP owned by SCOTT
--
--   declare
--       l_ddl blob;
--   begin
--       l_ddl := wwv_flow_generate_ddl.get_blob_output (
--                    p_schema      => 'SCOTT',
--                    p_object_type => 'TABLE',
--                    p_objects     => 'EMP' );
--   end;
--==============================================================================
function get_blob_output (
    p_schema             in varchar2,
    p_object_type        in varchar2,
    p_object_name        in varchar2 default null,
    p_inc_dependent_ddls in boolean default false )
    return blob;

end wwv_flow_generate_ddl;
/
show error;
