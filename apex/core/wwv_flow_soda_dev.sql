set define '^' verify off
prompt ...wwv_flow_soda_dev.sql
create or replace package wwv_flow_soda_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2019, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_soda_dev.sql
--
--    DESCRIPTION
--      SODA support in the APEX application builder
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    11/28/2019 - Created
-- 
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- public types
--------------------------------------------------------------------------------

subtype t_json_file_type        is pls_integer range 1..2;
subtype t_handle_nonjson_files  is pls_integer range 1..2;

--------------------------------------------------------------------------------
-- public constants
--------------------------------------------------------------------------------
c_job_prefix                  constant varchar2(17)           := 'ORACLE_APEX_DTLD$'; 

c_max_jobs_per_apex_session   constant number                 := 5;

c_file_type_zip               constant t_json_file_type       := 1;
c_file_type_json_collection   constant t_json_file_type       := 2;

c_skip_nonjson_files          constant t_handle_nonjson_files := 1;
c_allow_nonjson_files         constant t_handle_nonjson_files := 2;

c_row_selector_chr_jsonlist   constant pls_integer            := 1;


--==================================================================================================================
-- loads JSON documents into a new SODA collection. The function extracts JSON documents from the BLOB which 
-- was passed in and loads these using DBMS_SODA.
--
-- PARAMETERS:
-- *   p_content              BLOB content to load into a new table
-- *   p_content_type         indicator for the file type of the content
--
-- *   p_collection_name      Name of the new collection to create and to insert data into
-- *   p_handle_nonjson_files Only for ZIP files: whether to skip or to allow non-json files or whether to error out
-- *   p_convert_xml_to_json  Only for ZIP files: whether to convert XML files to JSON or not.
-- *   p_relational_view_name Name of the relational view to create. If given, the procedure will automatically
--                            create a JSON search index in order to get the data guide. Based on the Data Guide,
--                            the relational view will be created using DBMS_JSON.
--
-- *   p_row_selector         Used to extract a collection of JSON objects from a single JSON file being passed in.
--                            Only valid for p_content_type = c_file_type_json_collection.
--
-- *   p_commit_interval      when specified, the procedure will commit after each {p_commit_interval} rows have been processed.
--                            If specified, values less than 200 are not allowed.
-- *   p_status_collection    when specified, the procedure will store ...
--                            N001: the amount of already processed rows
--                            C001: job status ( 'RUNNING' or 'FINISHED' )
--
-- *   p_run_in_background    whether to execute the actual data loading as a scheduler job in the background.
-- 
-- *   p_execute_as_schema    schema name to execute the DDL and DML operations as
--
--==================================================================================================================
procedure load_into_new_collection(
    p_content              in blob,
    p_content_type         in t_json_file_type,
    --
    p_collection_name      in varchar2,
    p_handle_nonjson_files in t_handle_nonjson_files                       default c_skip_nonjson_files,
    p_convert_xml_to_json  in boolean                                      default true,
    p_relational_view_name in varchar2                                     default null,
    --
    p_row_selector         in varchar2                                     default null,
    --
    p_commit_interval      in pls_integer                                  default null,
    p_status_collection    in varchar2                                     default null,
    --
    p_run_in_background    in boolean                                      default false,
    --
    p_execute_as_schema    in varchar2                                     default wwv_flow_security.g_parse_as_schema );

--==================================================================================================================
-- loads JSON documents into an already existing SODA collection. The function extracts JSON documents 
-- from the BLOB which was passed in and loads these using DBMS_SODA.
--
-- PARAMETERS:
-- *   p_content              BLOB content to load into a new table
-- *   p_content_type         indicator for the file type of the content
--
-- *   p_collection_name      Name of the existing collection to insert data into
-- *   p_handle_nonjson_files Only for ZIP files: whether to skip or to allow non-json files or whether to error out
-- *   p_convert_xml_to_json  Only for ZIP files: whether to convert XML files to JSON or not.
-- *   p_relational_view_name Name of the relational view to create. If given, the procedure will automatically
--                            create a JSON search index in order to get the data guide. Based on the Data Guide,
--                            the relational view will be created using DBMS_JSON.
--
-- *   p_row_selector         Used to extract a collection of JSON objects from a single JSON file being passed in.
--                            Only valid for p_content_type = c_file_type_json_collection.
--
-- *   p_truncate             whether to truncate the collection before data loading or not.
-- 
-- *   p_commit_interval      when specified, the procedure will commit after each {p_commit_interval} rows have been processed.
--                            If specified, values less than 200 are not allowed.
-- *   p_status_collection    when specified, the procedure will store ...
--                            N001: the amount of already processed rows
--                            C001: job status ( 'RUNNING' or 'FINISHED' )
--
-- *   p_run_in_background    whether to execute the actual data loading as a scheduler job in the background.
-- 
-- *   p_execute_as_schema    schema name to execute the DDL and DML operations as
--
--==================================================================================================================
procedure load_into_existing_collection(
    p_content              in blob,
    p_content_type         in t_json_file_type,
    --
    p_collection_name      in varchar2,
    p_handle_nonjson_files in t_handle_nonjson_files                       default c_skip_nonjson_files,
    p_convert_xml_to_json  in boolean                                      default true,
    p_relational_view_name in varchar2                                     default null,
    --
    p_row_selector         in varchar2                                     default null,
    --
    p_truncate             in boolean                                      default false,
    --
    p_commit_interval      in pls_integer                                  default null,
    p_status_collection    in varchar2                                     default null,
    --
    p_run_in_background    in boolean                                      default false,
    --
    p_execute_as_schema    in varchar2                                     default wwv_flow_security.g_parse_as_schema );

--==================================================================================================================
-- returns a list of existing SODA collections within the schema. Uses DBMS_SODA.LIST_COLLECTION_NAMES.
-- https://docs.oracle.com/en/database/oracle/oracle-database/18/arpls/DBMS_SODA.html#GUID-2D5982F5-34B2-44A7-8D94-DA7272A6B831
-- 
-- PARAMETERS:
-- *   p_schema:              Name of schema to get the collection list for. 
--
-- RETURNS
--     the list of SODA collection names 
--==================================================================================================================
function get_soda_collections(
    p_schema in varchar2 ) return wwv_flow_t_varchar2 pipelined;

--==================================================================================================================
-- creates a search index on the SODA collection. Uses SODA_COLLECTION_T.CREATE_INDEX.
-- https://docs.oracle.com/en/database/oracle/oracle-database/18/arpls/SODA_TYPES.html#GUID-B49091EB-6B09-4B6E-A80E-73E708517768
-- 
-- PARAMETERS:
-- *   p_schema:              Name of schema containing the collection
-- *   p_collection_name:     Name of the SODA collection to create the search index on
-- *   p_index_name:          Name for the new JSON search index to create.
--==================================================================================================================
procedure create_search_index(
    p_schema          in varchar2,
    p_collection_name in varchar2,
    p_index_name      in varchar2 default null );

--==================================================================================================================
-- drops the search index on a SODA collection. Looks up the name of the JSON search index which has been
-- created for the collection and drops it using SODA_COLLECTION_T.DROP_INDEX.
-- https://docs.oracle.com/en/database/oracle/oracle-database/18/arpls/SODA_TYPES.html#GUID-C464ADAB-7D17-4530-BC42-0BC76FA9CCA8
-- 
-- PARAMETERS:
-- *   p_schema:              Name of schema containing the collection
-- *   p_collection_name:     Name of the SODA collection to create the search index on
--==================================================================================================================
procedure drop_search_index(
    p_schema          in varchar2,
    p_collection_name in varchar2 );

--==================================================================================================================
-- creates a relational view on top of the SODA collection. Requires a JSON search index to exist on the
-- SODA collection. Uses DBMS_JSON.CREATE_VIEW.
-- https://docs.oracle.com/en/database/oracle/oracle-database/18/arpls/DBMS_JSON.html#GUID-9A634A69-6F96-43E2-9A44-80FD21E262C1
-- 
-- PARAMETERS:
-- *   p_schema:              Name of schema containing the collection
-- *   p_collection_name:     Name of the SODA collection to create the search index on
-- *   p_view_name:           Name for the new view to create.
-- *   p_on_path:             JSON Path to create the relational view. Corresponds to the "PATH" 
--                            parameter of DBMS_JSON.CREATE_VIEW_ON_PATH
--==================================================================================================================
procedure create_relational_view(
    p_schema          in varchar2,
    p_collection_name in varchar2,
    p_view_name       in varchar2,
    p_on_path         in varchar2 default null );

--==================================================================================================================
-- retrieves meta data or the data guide for the SODA collection. Depending on p_method either 
-- SODA_COLLECTION_T.GET_METADATA or SODA_COLLECTION_T.GET_DATA_GUIDE is used.
-- 
-- SODA_COLLECTION_T.GET_METADATA:
-- https://docs.oracle.com/en/database/oracle/oracle-database/18/arpls/SODA_TYPES.html#GUID-C27EB17B-E716-43FC-9B13-1440687DCAC9
--
-- SODA_COLLECTION_T.GET_DATA_GUIDE
-- https://docs.oracle.com/en/database/oracle/oracle-database/18/arpls/SODA_TYPES.html#GUID-B2235AD3-910A-44A1-990A-AE85D8594669
--
-- PARAMETERS:
-- *   p_schema:              Name of schema containing the collection
-- *   p_collection_name:     Name of the SODA collection to create the search index on
-- *   p_method:              "get_metadata" or "get_data_guide"
--==================================================================================================================
function get_collection_details(
    p_schema          in varchar2,
    p_collection_name in varchar2,
    p_method          in varchar2 ) 
    return clob;

--==================================================================================================================
-- drops a SODA collection. Uses DBMS_SODA.DROP_COLLECTION.
-- https://docs.oracle.com/en/database/oracle/oracle-database/18/arpls/DBMS_SODA.html#GUID-8806F2BE-DC70-417D-B08B-A3972B3DA69C
-- 
-- PARAMETERS:
-- *   p_schema:              Name of schema containing the collection
-- *   p_collection_name:     Name of the SODA collection to drop
--==================================================================================================================
procedure drop_collection(
    p_schema          in varchar2,
    p_collection_name in varchar2 );

--==================================================================================================================
-- returns a SQL query to select all rows from the collection for display in Object Browser
--
-- PARAMETERS:
-- *   p_schema:              Name of schema containing the collection
-- *   p_collection_name:     Name of the SODA collection to drop
-- *   p_content_display_len: Amount of characters after which to cut JSON content.
--
-- RETURNS:
--     the SQL query to be executed as a report in SQL Workshop
--==================================================================================================================
function get_collection_data_query( 
    p_schema              in varchar2,
    p_collection_name     in varchar2,
    p_content_display_len in pls_integer default 255 ) 
    return varchar2;

--==================================================================================================================
-- gets translated text messages for SODA collection column headings; matching the query 
-- returned by get_collection_data_query
--
-- PARAMETERS:
-- *   p_schema:              Name of schema containing the collection
-- *   p_collection_name:     Name of the SODA collection to drop
--
-- RETURNS:
--     a colon-separated list of (translated) column headings
--==================================================================================================================
function get_collection_column_headers( 
    p_schema              in varchar2,
    p_collection_name     in varchar2 )
    return varchar2;

--==================================================================================================================
-- INTERNAL USE: Do not call directly
--
-- this procedure acts as an interface for scheduler jobs - it will be called when load_into_new_table is invoked 
-- with p_run_in_background => true. 
--==================================================================================================================
procedure load_data_into_collection_job(
    p_content_type         in number,
    p_soda_collection_name in varchar2,
    p_handle_nonjson_files in t_handle_nonjson_files                       default c_skip_nonjson_files,
    p_convert_xml_to_json  in varchar2                                     default 'Y',
    p_relational_view_name in varchar2                                     default null,
    p_row_selector         in varchar2                                     default null,
    --
    p_commit_interval      in pls_integer                                  default null,
    p_status_collection    in varchar2                                     default null,
    --
    p_apex_session_id      in varchar2                                     default null,
    p_apex_app_id          in varchar2                                     default null,
    p_apex_page_id         in varchar2                                     default null,
    p_apex_ws_sgid         in varchar2                                     default null,
    --    
    p_apex_collection_name in varchar2                                     default 'APX$DTLD',
    --
    p_execute_as_schema    in varchar2                                     default wwv_flow_security.g_parse_as_schema);


--==================================================================================================================
-- determines whether the given schema has the SODA_APP role granted.
--
-- PARAMETERS:
-- *   p_schema:              Name of schema to check
-- 
-- RETURNS
--     true, if the schema has SODA_APP granted, false otherwise
--==================================================================================================================
function has_soda_role(
    p_schema in varchar2 )
    return boolean;

--==================================================================================================================
-- returns the URL to the REST endpoint for a SODA collection
--
-- PARAMETERS:
-- *   p_workspace_name    workspace for which SQL Workshop is running
-- *   p_collection_name   SODA collection
-- 
-- RETURNS
--     URL to the REST endpoint for the SODA collection
--==================================================================================================================
function get_soda_rest_endpoint(
    p_collection_name in varchar2 ) 
    return varchar2;    

--==================================================================================================================
-- Determine whether we are running within the AJD ("JDCS") cloud service
--
-- RETURNS:
-- TRUE, if APEX runs within AJD, FALSE otherwise
--==================================================================================================================
function is_ajd_service return boolean;

end wwv_flow_soda_dev;
/
sho err
