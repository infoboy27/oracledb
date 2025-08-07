set define '^' verify off
prompt ...wwv_flow_search_dev.sql
create or replace package wwv_flow_search_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_search_dev.sql
--
--    DESCRIPTION
--      Application Search Development Environent Specifics
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    06/14/2022 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

c_columns_collection_name constant varchar2(26) := 'APEX$SEARCH_CONFIG_COLUMNS';

--==============================================================================
-- copies (and subscribes) as search configuration.
--==============================================================================
function copy_search_config (
    p_from_application_id      in number,
    p_from_search_config_id    in number,
    p_to_application_id        in number,
    p_to_name                  in varchar2 default null,
    p_subscribe                in boolean  default false,
    p_if_existing_raise_dupval in boolean  default false )
    return number;

--==============================================================================
-- This procedure pulls content from the master Search configuration and
-- copies it to the subscribing Search configuration.
--
-- Parameters:
-- * p_search_config_id:        Subscribing Search configuration ID
-- * p_master_search_config_id: Master Search configuration ID
-- * p_initial_refresh:         Flag to determine if the refresh is happening right after subscription
--                              or during subsequent refresh or publish operations
--==============================================================================
procedure subscribe_search_config (
    p_search_config_id        in number,
    p_master_search_config_id in number,
    p_initial_refresh         in boolean default false );

--==============================================================================
-- Refresh Search configuration with the master Search configuration content.
--
-- Parameters:
-- * p_search_config_id: Search configuration ID
-- * p_initial_refresh:  Flag to determine if the refresh is happening right after subscription
--                       or during subsequent refresh or publish operations
--==============================================================================
procedure refresh_search_config (
    p_search_config_id in number,
    p_initial_refresh  in boolean default false );

--==============================================================================
-- returns true if the search configuration is used in the application
--==============================================================================
function is_search_config_used (
    p_application_id   in number,
    p_search_config_id in number ) return boolean;

--==============================================================================
-- helper function to split the search config target URL
-- into declarative link bulder item values
--==============================================================================
procedure split_target_url (
    p_target_type      in out varchar2,
    p_target_url       in out varchar2,
    --
    p_app_id           out    varchar2,
    p_page_id          out    varchar2,
    p_request          out    varchar2,
    p_clear_cache      out    varchar2,
    p_reset_pagination out    varchar2,
    p_arg_names        out    varchar2,
    p_arg_values       out    varchar2 );

--==============================================================================
-- initializes search config columns for a given data source
--==============================================================================
procedure init_column_collection (
    p_column_collection      in varchar2                       default c_columns_collection_name,
    --
    p_application_id         in number,
    p_search_type            in wwv_flow_search.t_vc_search_type,
    --
    p_list_id                in number                         default null,
    --
    p_location               in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_query_type             in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_table,
    p_owner                  in varchar2                       default null,
    p_table_name             in varchar2                       default null,
    p_sql_query              in varchar2                       default null,
    p_function_body          in varchar2                       default null,
    p_function_body_language in wwv_flow_exec_api.t_language   default null,
    p_where_clause           in varchar2                       default null,
    p_match_clause           in varchar2                       default null,
    p_columns_clause         in varchar2                       default null,
    p_order_by_clause        in varchar2                       default null,
    p_optimizer_hint         in varchar2                       default null,
    --
    p_remote_server_id       in number                         default null,
    p_web_src_module_id      in number                         default null,
    p_array_column_id        in number                         default null,
    p_document_source_id     in number                         default null,
    p_post_processing_type   in varchar2                       default null,
    --
    p_extended_describe      in boolean                        default false );

--==============================================================================
-- Creates search configuration under App > Shared Component > Search Configurations
--
-- PARAMETERS:
-- * p_application_id            application ID
-- * p_label                     label of the new search configuration
-- * p_search_type               search type: APEX_LIST, TEXT_MANUAL, SIMPLE
--   p_list_id                   ID of the list to search within, when searching within an APEX list.
--   p_location                  Data Source Location for the search config
--                               LOCAL, REMOTE, WEB_SOURCE

--   p_local_query_type          Type of the SQL Query, if p_location = 'LOCAL'
--                               TABLE, SQL, FUNC_BODY_RETURNING_SQL
--   p_local_table_owner         Table owner, if p_location = 'LOCAL'
--   p_local_table_name          Table name, if p_location = 'LOCAL'
--   p_local_query_source        SQL Query or function body returning SQL Query, if p_location = 'LOCAL'
--   --
--   p_local_graph_name           Name of the Graph when the query type is GRAPH
--   p_local_pql_match_clause     Match Clause for PQL queries
--   p_local_pql_where_clause     Where Clause for PQL queries
--   p_local_pql_columns_clause   Columns Clause for PQL queries
--   --
--   p_remote_server_id           ID of the REST Enabled SQL Service, if p_location = 'REMOTE'
--   p_remote_query_type          Type of the SQL Query, if p_location = 'REMOTE'
--                                TABLE, SQL, FUNC_BODY_RETURNING_SQL
--   p_remote_table_owner         Table owner, if p_location = 'REMOTE'
--   p_remote_table_name          Table name, if p_location = 'REMOTE'
--   p_remote_query_source        SQL Query or function body returning SQL Query, if p_location = 'REMOTE'
--   --
--   p_oratext_query_type         Type of the SQL Query, if p_search_type = 'TEXT_MANUAL'
--                                TABLE, SQL, FUNC_BODY_RETURNING_SQL
--   p_oratext_table_owner        Table owner, if p_search_type = 'TEXT_MANUAL'
--   p_oratext_table_name         Table name, if p_search_type = 'TEXT_MANUAL'
--   p_oratext_query_source       SQL Query or function body returning SQL Query, if p_search_type = 'TEXT_MANUAL'
--   p_oratext_index_column_name  Oracle Text index column name, if p_search_type = 'TEXT_MANUAL'
--   --
--   p_dbms_search_index_owner    DBMS Search Index Owner, if p_search_type = 'TEXT_DBMS_SEARCH'
--   p_dbms_search_index_name     DBMS Search Index Name, if p_search_type = 'TEXT_DBMS_SEARCH'
--   p_dbms_search_source_owner   DBMS Search Index Source Owner, if p_search_type = 'TEXT_DBMS_SEARCH'
--   p_dbms_search_source_name    DBMS Search Index Source Name, if p_search_type = 'TEXT_DBMS_SEARCH'
--   --
--   p_web_src_module_id         ID of the REST Data Source, if p_location = 'WEB_SOURCE'
--   --
--   p_pk_column_name            Name of the Primary Key column
--   p_title_column_name         Name of the Title column
--   p_description_column_name   Name of the Description column
--   p_icon_source_type          Type of the source implementation for the icon
--                               INITIALS, STATIC_CLASS, DYNAMIC_CLASS
--   p_icon_class_column_name    Name of the column to be used as icon, if p_icon_source_type = 'DYNAMIC_CLASS'
--   p_icon_css_classes          The Icon CSS Classes to display icon image, if p_icon_source_type = 'STATIC_CLASS'


-- RETURNS:
-- * ID of the created search configuration.
--==============================================================================
function create_search_config (
    p_application_id             in number,
    --
    p_label                      in varchar2,
    p_search_type                in varchar2,
    --
    p_list_id                    in number  default null,
    --
    p_location                   in wwv_flow_exec_api.t_location    default wwv_flow_exec_api.c_location_local_db,
    --
    p_local_query_type           in wwv_flow_exec_api.t_query_type  default null,
    p_local_table_owner          in varchar2                        default null,
    p_local_table_name           in varchar2                        default null,
    p_local_query_source         in varchar2                        default null,
    --
    p_local_graph_name           in varchar2                        default null,
    p_local_pql_match_clause     in varchar2                        default null,
    p_local_pql_columns_clause   in varchar2                        default null,
    p_local_pql_where_clause     in varchar2                        default null,
    --
    p_remote_server_id           in number                          default null,
    p_remote_query_type          in wwv_flow_exec_api.t_query_type  default null,
    p_remote_table_owner         in varchar2                        default null,
    p_remote_table_name          in varchar2                        default null,
    p_remote_query_source        in varchar2                        default null,
    --
    p_oratext_query_type         in wwv_flow_exec_api.t_query_type  default null,
    p_oratext_table_owner        in varchar2                        default null,
    p_oratext_table_name         in varchar2                        default null,
    p_oratext_query_source       in varchar2                        default null,
    p_oratext_index_column_name  in varchar2                        default null,
    --
    p_dbms_search_index_owner    in varchar2                        default null,
    p_dbms_search_index_name     in varchar2                        default null,
    p_dbms_search_source_owner   in varchar2                        default null,
    p_dbms_search_source_name    in varchar2                        default null,
    --
    p_vector_query_type          in wwv_flow_exec_api.t_query_type  default null,
    p_vector_table_owner         in varchar2                        default null,
    p_vector_table_name          in varchar2                        default null,
    p_vector_column_name         in varchar2                        default null,
    p_vector_query_source        in varchar2                        default null,
    p_vector_search_type         in varchar2                        default null,
    p_vector_distance_metric     in varchar2                        default null,
    p_vector_maximum_distance    in number                          default null,
    p_target_accuracy            in number                          default null,
    p_vector_provider_id         in number                          default null,
    --
    p_web_source_module_id       in number                          default null,
    p_array_column_id            in number                          default null,
    --
    p_document_source_id         in number                          default null,
    --
    p_pk_column_name             in varchar2                        default null,
    p_title_column_name          in varchar2                        default null,
    p_description_column_name    in varchar2                        default null,
    p_icon_source_type           in varchar2                        default null,
    p_icon_class_column_name     in varchar2                        default null,
    p_icon_css_classes           in varchar2                        default null )
    return number;

--==============================================================================
-- Creates a page to search using the selected search configurations
--
-- PARAMETERS:
-- * p_application_id              application ID
-- * p_page_id                     page ID
-- * p_page_name                   page Name,
-- * p_page_mode                   page Mode,
--
--   p_tab_set                     tab set name
--   p_tab_name                    tab name,
--   p_tab_text                    tab text,
--   --
--   p_nav_list_id                 navigation list ID,
--   p_nav_list_parent_item_id     parent navigation ID,
--   p_nav_list_child_item_name    new child navigation name,
--   p_nav_list_item_icon          navigation icon,
--   --
--   p_breadcrumb_id               existing breadcrumb ID to use for the page,
--   p_breadcrumb_entry_name       new breadcrumb entry name,
--   p_parent_breadcrumb_entry_id  parent breadcrumb entry ID,
--
--   p_search_config_ids           list of search cofiguration IDs to use
--
--==============================================================================
procedure create_search_page (
    p_application_id             in number,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_page_mode                  in varchar2,
    --
    p_nav_list_id                in number   default null,
    p_nav_list_parent_item_id    in number   default null,
    p_nav_list_child_item_name   in varchar2 default null,
    p_nav_list_item_icon         in varchar2 default null,
    --
    p_breadcrumb_id              in number   default null,
    p_breadcrumb_entry_name      in varchar2 default null,
    p_parent_breadcrumb_entry_id in number   default null,
    --
    p_search_config_ids          in wwv_flow_t_number );

--==============================================================================
-- populate columns collection based on query items on page 4000:3120.
--
-- Note: this procedure is specific to 4000:3120 and cannot be used on other
-- pages.
--
-- Parameters:
-- * p_collection_name:       collection name to use
-- * p_emit_json:             whether to emit a JSON with column names, display names
--                            and return types.
--==============================================================================
procedure p3120_get_columns(
    p_collection_name in varchar2 default c_columns_collection_name,
    p_emit_json       in boolean );

--==============================================================================
-- checks whether a column name exists in the columns collection
--
-- Parameters:
-- * p_collection_name:       collection name to use
-- * p_column_name:           column name to check for.
--
-- Returns:
-- true if the column name exists in the collection, false otherwise.
--==============================================================================
function column_exists_in_collection(
    p_collection_name in varchar2 default c_columns_collection_name,
    p_column_name     in varchar2 )
    return boolean;

--==============================================================================
-- gets the search config primary key column name based on search type
--
-- PARAMETERS:
--   p_collection_name:          columns collection name to use
-- * p_application_id            application ID
-- * p_search_type               search type: APEX_LIST, TEXT_MANUAL, SIMPLE
--   p_list_id                   ID of the list to search within, when searching within an APEX list.
--
-- Returns:
-- the column name that can be used as primary key column for the search config
--==============================================================================
function get_pk_column_name(
    p_collection_name       in varchar2 default c_columns_collection_name,
    p_application_id        in number,
    p_search_type           in wwv_flow_search.t_vc_search_type,
    --
    p_list_id               in number                         default null )
    return varchar2;

--==============================================================================
-- gets the search config title column name based on search type
--
-- PARAMETERS:
--   p_collection_name:          columns collection name to use
-- * p_application_id            application ID
-- * p_search_type               search type: APEX_LIST, TEXT_MANUAL, SIMPLE
--   p_list_id                   ID of the list to search within, when searching within an APEX list.
--   p_location                  Data Source Location for the search config
--                               LOCAL, REMOTE, WEB_SOURCE
--   p_query_type                Type of the SQL Query
--                               TABLE, SQL, FUNC_BODY_RETURNING_SQL
--   p_owner                     Table owner, if p_query_type = 'TABLE'
--   p_table_name                Table name, if p_query_type = 'TABLE'
--
-- Returns:
-- the column name that can be used as title column for the search config
--==============================================================================
function get_title_column_name(
    p_collection_name        in varchar2 default c_columns_collection_name,
    p_application_id         in number,
    p_search_type            in wwv_flow_search.t_vc_search_type,
    --
    p_list_id                in number                         default null,
    --
    p_location               in wwv_flow_exec_api.t_location   default wwv_flow_exec_api.c_location_local_db,
    p_query_type             in wwv_flow_exec_api.t_query_type default wwv_flow_exec_api.c_query_type_table,
    p_owner                  in varchar2                       default null,
    p_table_name             in varchar2                       default null )
    return varchar2;

--==============================================================================
-- Gets the user_dbms_search_indexes rows, since we do not have a all_dbms_search... view
--
-- PARAMETERS:
-- * p_application_id            application ID
--
-- Returns:
-- the names of the dbms search indexes
-- in case dbms_search is not available, no rows are returned
--
-- select column_value
--   from table( wwv_flow_search_dev.get_dbms_search_indexes( :FB_FLOW_ID ) );
--
--==============================================================================
function get_dbms_search_indexes(
    p_application_id         in number )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Gets the user_dbms_search_index_sources rows, since we do not have a all_dbms_search... view
--
-- PARAMETERS:
-- * p_application_id            application ID
-- * p_index_name                search index name
--
-- Returns:
-- the names of the dbms search index sources
-- in case dbms_search is not available, no rows are returned
--
-- select column_value
--   from table( wwv_flow_search_dev.get_dbms_search_sources( :FB_FLOW_ID, :IDX_NAME ) );
--
--==============================================================================
function get_dbms_search_sources(
    p_application_id         in number,
    p_index_name             in varchar2 )
    return wwv_flow_t_varchar2;

--==============================================================================
-- returns Search configuration location
--
-- PARAMETERS:
-- * p_search_config_id Search Configuration ID
--
-- Returns:
--   location column value
--==============================================================================
function get_location(
    p_search_config_id in number )
    return varchar2;

--==============================================================================
-- returns Search configuration name
--
-- PARAMETERS:
-- * p_search_config_id Search configuration ID
--
-- Returns:
--   Search configuration name
--==============================================================================
function get_name(
    p_search_config_id in number )
    return varchar2;

--==============================================================================
-- API for search configuration delete and clearing reference_id in subscribed component
--==============================================================================
procedure delete_search_configuration(
    p_search_config_id     in number,
    p_application_id       in number);

--==============================================================================
-- returns true if a vector index exists on the specified column
-- called by P3120_VECTOR_SEARCH_TYPE validation in 4000:3120
--
-- PARAMETERS:
-- * p_object_owner owner of the table or view
-- * p_object_name  name of the table or view
-- * p_column_name  name of the column to check for a vector index
--
-- Note for views:
--   We are able to detect the existence of a vector index, if the column name
--   is the same as for the table and it works only for one level ( view on table )
--
-- Returns:
--   true (vector index exists) or false
--==============================================================================
function has_vector_index(
    p_object_owner in varchar2,
    p_object_name  in varchar2,
    p_column_name  in varchar2 )
    return boolean;

end wwv_flow_search_dev;
/
show err

set define '^'
