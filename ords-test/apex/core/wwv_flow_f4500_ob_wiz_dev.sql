set define '^' verify off
prompt ...wwv_flow_f4500_ob_wiz_dev
create or replace package wwv_flow_f4500_ob_wiz_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_f4500_ob_wiz_dev.sql
--
--    DESCRIPTION
--      This package contains the code for Object Browser > Create Object Wizards
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    sravva      12/01/2022 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- this function verifies if the given word is a database reserved word or not
--
-- Parameters:
-- * p_word: Input word to verify
--
-- Returns:
-- returns true, if given word is a database reserved word
-- false, otherwise
--==============================================================================
function is_database_reserved_word(
    p_word in varchar2 )
    return boolean;

--==============================================================================
--  This function verifies if the given object name is available for the object type
--
-- Parameters:
-- * p_name:   Name of the object
-- * p_owner:  Object Owner where object will be created
-- * p_type:   Object Type (Spaces are replaced with _, otherwise same as Oracle object types)
--
-- Returns:
-- returns true if object name is available
-- returns false otherwise
--==============================================================================
function is_available_name(
    p_name  in varchar2,
    p_owner in varchar2,
    p_type  in varchar2 )
    return boolean;

--==============================================================================
-- This function validates object name
--
-- Parameters:
-- * p_name:             Name of the object
-- * p_owner:            Object Owner where object will be created
-- * p_object_type:      Object Type
-- * p_length_check:     When true, checks if Object Name length is less than maximum length
-- * p_valid_identifier: When true, checks if Object Name is a valid Oracle identifier
-- * p_reserved_word:    When true, checks if Object Name is not a reserved word
-- * p_available_name:   When true, checks if Object Name is available (not used by other objects)
--
-- Returns:
-- returns NULL if object name is valid
-- returns error text if object name is invalid
--==============================================================================
function validate_object_name(
    p_name             in varchar2,
    p_owner            in varchar2,
    p_object_type      in varchar2,
    p_length_check     in boolean default true,
    p_valid_identifier in boolean default true,
    p_reserved_word    in boolean default true,
    p_available_name   in boolean default true )
    return varchar2;

--==============================================================================
-- this function returns the DDL required to create a table
--
-- Parameters:
-- * p_name:               Table name to create
-- * p_parsing_schema:     Parsing schema against which the given DDL is executed
-- * p_semantics:          Semantics option used for text columns
-- * p_comments:           Table comments
-- * p_columns_collection: Collection with columns data
--
-- Returns:
-- DDL to create a table
--==============================================================================
function get_table_ddl (
    p_name               in varchar2,
    p_parsing_schema     in varchar2,
    p_semantics          in varchar2,
    p_comments           in varchar2,
    p_columns_collection in varchar2 )
    return clob;

--==============================================================================
-- this function creates table and returns table object id
-- this is called from Create Object Wizards in Object Browser
--
-- Parameters:
-- * p_name:               Table name to create
-- * p_parsing_schema:     Parsing schema against which the given DDL is executed
-- * p_semantics:          Semantics option used for text columns
-- * p_comments:           Table comments
-- * p_columns_collection: Collection with columns data
--
-- Returns:
-- returns newly created object id
-- returns NULL if object creation is failed
--==============================================================================
function create_table(
    p_name               in varchar2,
    p_parsing_schema     in varchar2,
    p_semantics          in varchar2,
    p_comments           in varchar2,
    p_columns_collection in varchar2 )
    return number;

--==============================================================================
-- this function creates object by executing given DDL statement
-- this is called from Create Object Wizards in Object Browser
-- Errors, if any, are added to error stack using wwv_flow_error_api.add_error
--
-- Parameters:
-- * p_object_name:    Object name to create
-- * p_object_type:    New object type
-- * p_parsing_schema: Parsing schema against which the given DDL is executed
-- * p_ddl:            DDL to execute
--
-- Returns:
-- returns newly created object id
-- returns NULL if object creation is failed
--==============================================================================
function create_object(
    p_object_name     in varchar2,
    p_object_type     in varchar2,
    p_parsing_schema  in varchar2,
    p_ddl             in varchar2 )
    return number;

--==============================================================================
-- this procedure creates package using given spec and body code
-- Errors, if any, are added to error stack using wwv_flow_error_api.add_error
--
-- Parameters:
-- * p_name:           Package name to create
-- * p_parsing_schema: Parsing schema against which the given DDL is executed
-- * p_spec_ddl:       Package Specification Code
-- * p_body_ddl:       Package Body Code
-- * p_object_id:      Newly created object id
--==============================================================================
procedure create_package(
    p_name            in  varchar2,
    p_parsing_schema  in  varchar2,
    p_spec_ddl        in  varchar2,
    p_body_ddl        in  varchar2,
    p_object_id       out number );

--==============================================================================
-- this function generates DDL required to create look-up table
--
-- Parameters:
-- * p_table:          Base table name
-- * p_parsing_schema: Parsing schema against which the given DDL is executed
-- * p_column_name:    Text column from base table
-- * p_lookup_table:   New look-up table name that should be created
-- Returns:
-- Returns DDL and DML statements to create look-up table
--==============================================================================
function get_lookup_table_ddl(
    p_table          in varchar2,
    p_parsing_schema in varchar2,
    p_column_name    in varchar2,
    p_lookup_table   in varchar2 )
    return varchar2;

--==============================================================================
-- this procedure creates look-up table based on base table text column
--
-- Parameters:
-- * p_table:          Base table name
-- * p_parsing_schema: Parsing schema against which the given DDL is executed
-- * p_column_name:    Text column from base table
-- * p_lookup_table:   New look-up table name that should be created
-- * p_object_id:      Newly created object id
--==============================================================================
procedure create_lookup_table(
    p_table           in  varchar2,
    p_parsing_schema  in  varchar2,
    p_column_name     in  varchar2,
    p_lookup_table    in  varchar2,
    p_object_id       out number );

--==============================================================================
-- this function returns full db link name
-- this function checks if global_name has domain or not
-- if there is domain data, then this domain name is appended to db_link name
-- otherwise same db_link name is returned
--
-- Parameters:
-- * p_db_link_name: New DB Link name that's being created
--
-- Returns:
-- returns full db link name with domain, if applicable
-- otherwise just returns the same db link name
--==============================================================================
function get_full_db_link_name(
    p_db_link_name in varchar2 )
    return varchar2;

--==============================================================================
-- This function returns schema ID from wwv_flow_company_schemas table
--   based on given schema name. schema name are always given in upper case
--
-- Parameters:
-- * p_schema: Schema name in upper case
--
-- Returns:
-- returns schema ID from wwv_flow_company_schemas, if row found for current workspace
-- returns null otherwise
--==============================================================================
function get_workspace_schema_id(
    p_schema in varchar2 )
    return number;

--==============================================================================
-- returns geometry metadata for the given table column
-- from mdsys.user_sdo_geom_metadata view
--==============================================================================
function get_geom_metadata(
    p_owner           in varchar2,
    p_table_name      in varchar2,
    p_column_name     in varchar2 )
    return varchar2;

--==============================================================================
-- validates whether all rows of an SDO_GEOMETRY column have the specified GTYPE
-- (GTYPE is the geometry type (Point, Polygon, Line etc))
--==============================================================================
function validate_gtype(
    p_owner           in varchar2,
    p_table_name      in varchar2,
    p_column_name     in varchar2,
    p_gtype           in number )
    return boolean;

--==============================================================================
-- validates whether all rows of an SDO_GEOMETRY column have the specified SRID
--==============================================================================
function validate_srid(
    p_owner           in varchar2,
    p_table_name      in varchar2,
    p_column_name     in varchar2,
    p_srid            in number )
    return boolean;

--==============================================================================
-- returns pl/sql code to create / recreate geometry metadata for a table column
--==============================================================================
function get_add_geom_metadata_dml(
    p_action      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2,
    p_srid        in number,
    p_dim_x_min   in number,
    p_dim_x_max   in number,
    p_dim_y_min   in number,
    p_dim_y_max   in number,
    p_dim_x_tol   in number,
    p_dim_y_tol   in number )
    return varchar2;

--==============================================================================
-- generates unique object name based on p_owner, p_name and p_suffix
-- checks for object names in sys.dba_objects view, if p_is_constraint is false
-- checks for names in sys.dba_constraints view, if p_is_constraint is true
--==============================================================================
function generate_name (
    p_owner         in varchar2,
    p_name          in varchar2,
    p_suffix        in varchar2,
    p_is_constraint in boolean default false )
    return varchar2;

--==============================================================================
-- returns status of an object from sys.dba_objects view
--==============================================================================
function get_object_status (
    p_object_id      in number,
    p_object_type    in varchar2,
    p_parsing_schema in varchar2 )
    return varchar2;

end wwv_flow_f4500_ob_wiz_dev;
/
show errors