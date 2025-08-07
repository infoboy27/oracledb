set define '^' verify off
prompt ...wwv_flow_lov_dev
create or replace package wwv_flow_lov_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_lov_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling functionality related to List of Values in the builder.
--
--    MODIFIED   (MM/DD/YYYY)
--    arayner     04/03/2019 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================

c_builder_collection_name       constant varchar2(12) := 'LOV_COL_INFO';

--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- Converts legacy LOVs into the metadata-based
--==============================================================================
procedure convert_legacy_lov(
    p_lov_id                in number,
    p_application_id        in number       default nv('FB_FLOW_ID') );
--
--
--==============================================================================
-- Save column data from collection (used on main LOV edit page 4111)
--==============================================================================
procedure save_column_info_from_coll(
    p_lov_id                in number,
    p_application_id        in number       default nv('FB_FLOW_ID'));
--
--
--==============================================================================
-- Create a collection containing LOV column information (Used on main LOV edit
-- page 4111)
--==============================================================================
procedure create_coll_from_lov_columns(
    p_lov_id                in number,
    p_application_id        in number       default nv('FB_FLOW_ID'));
--
--
--==============================================================================
-- Gets correct table owner for LOVs based on Local data sources, nulling
-- it in the case where it matches the applications primary schema
--==============================================================================
function get_table_owner(
    p_owner                 in varchar2,
    p_application_id        in number       default nv('FB_FLOW_ID') )
    return varchar2;
--
--
--==============================================================================
-- Create an LOV based on a data source (used in create wizard)
--==============================================================================
procedure create_dynamic_lov(
    p_lov_name               in varchar2,
    p_location               in varchar2,
    p_source_type            in varchar2     default null,
    p_owner                  in varchar2     default null,
    p_table_name             in varchar2     default null,
    p_sql_query              in varchar2     default null,
    p_match_clause           in varchar2     default null,
    p_columns_clause         in varchar2     default null,
    p_function_body_language in wwv_flow_code_exec.t_language default null,
    p_web_src_module_id      in number       default null,
    p_document_source_id     in number       default null,
    p_array_column_id        in number       default null,
    p_remote_server_id       in number       default null,
    p_application_id         in number       default nv('FB_FLOW_ID'),
    p_return_column          in varchar2,
    p_display_column         in varchar2 );
--
--
--==============================================================================
-- Create an LOV from a 2 column query
--==============================================================================
procedure create_lov_from_query(
    p_id                    in number   default null,
    p_flow_id               in number,
    p_name                  in varchar2,
    p_query                 in varchar2,
    p_parse_as_schema       in varchar2 default null );
--
--
--==============================================================================
-- Used in the builder for LOV conversion
--==============================================================================
procedure create_named_lov (
    p_id                    in out number,
    p_flow_id               in     number,
    p_name                  in     varchar2,
    p_query                 in     varchar2 );
--
--
--==============================================================================
-- For LOVs based on web sources, this function gets a formatted SQL query
-- used to pre-populate the Post Processing attributes
--==============================================================================
function get_post_processing_sql_query(
    p_location               in varchar2,
    p_query_type             in varchar2,
    p_owner                  in varchar2     default null,
    p_table_name             in varchar2     default null,
    p_sql_query              in varchar2     default null,
    p_function_body          in varchar2     default null,
    p_function_body_language in wwv_flow_code_exec.t_language default null,
    p_remote_server_id       in number       default null,
    p_document_source_id     in number       default null,
    p_web_src_module_id      in number       default null,
    p_array_column_id        in number       default null )
    return varchar2;
--
--
--==============================================================================
-- Copy an LOV
--==============================================================================
procedure copy_named_lov (
    p_lov_id_from           in number,
    p_lov_name_to           in varchar2     default null,
    p_copy_from_flow_id     in number       default null,
    p_flow_id               in number       default null,
    p_lov_id_to             in number       default null,
    p_subscribe             in boolean      default false );

--
--
--==============================================================================
-- This procedure pulls content from the master lov and
-- copies it to the subscribing lov.
--==============================================================================
procedure subscribe_lov (
    p_master_lov_id         in number,
    p_subscribing_lov_id    in number );
--
--
--==============================================================================
-- Return a string containing a comma seperated list of pages where an LOV is
-- used.
--==============================================================================
function lov_used_on_pages (
    p_lov_id                in number,
    p_flow_id               in number       default nv('FB_FLOW_ID') )
    return varchar2;
--
--
--==============================================================================
-- This procedure removes reference id from a lov.
--==============================================================================
procedure remove_lov_reference_id (
    p_id in number );
--
--
--==============================================================================
-- If the master LOV ID is not passed, get the master LOV ID
-- and refresh subscribing LOV.
--==============================================================================
procedure refresh_lov (
    p_subscribing_lov_id in number );
--
--
--==============================================================================
-- returns true if the LOV is a Graph-Based LOV
--==============================================================================
function is_based_on_graph(
    p_lov_id in number )
    return boolean;

--==============================================================================
-- returns LOV location
--
-- PARAMETERS:
-- * p_lov_id LOV ID
--
-- Returns:
--   location column value
--==============================================================================
function get_location(
    p_lov_id in number )
    return varchar2;

--==============================================================================
-- returns LOV name
--
-- PARAMETERS:
-- * p_lov_id LOV ID
--
-- Returns:
--   LOV name
--==============================================================================
function get_name(
    p_lov_id in number )
    return varchar2;

--==============================================================================
-- API for List of Values delete and clearing reference_id in subscribed component
--==============================================================================
procedure delete_lov(
    p_lov_id            in number,
    p_application_id    in number);

--==============================================================================
-- Updates LOV column collection information based on columns selected in shuttle
-- (used on main LOV edit page 4111). This code was pulled from the builder page
-- to this package and is dependent on page items on pages 4000:4082 and 4000:4111.
--==============================================================================
procedure p4082_update_column_collection;

--==============================================================================
-- populate LOV_COL_INFO collection based on page item values on page 4000:4111,
-- This code was pulled from the builder page to this package and is dependent
-- on page items on 4000:4111.
--==============================================================================
procedure p4111_lov_column_collection;

--==============================================================================
-- return query columns based on page item values on page 4000:4111.
--==============================================================================
function p4111_get_query_columns
return wwv_flow_exec_dev.t_query_columns pipelined;

end wwv_flow_lov_dev;
/
show errors
