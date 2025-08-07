set define '^' verify off
prompt ...wwv_flow_lov
create or replace package wwv_flow_lov as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2023, Oracle and/or its affiliates.
--
--  This package is responsible for handling functionality related to List of Values.
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    04/04/2019 - Created
--
--------------------------------------------------------------------------------

--##############################################################################
-- Constants 
--##############################################################################
subtype t_order_by is pls_integer range 1 .. 2;
subtype t_type is varchar2(20);
--
c_order_by_seq              constant t_order_by := 1; -- insert_order
c_order_by_display          constant t_order_by := 2; -- disp
c_start_of_group_column     constant varchar2(22) := 'APEX$START_OF_GROUP';
c_end_of_group_column       constant varchar2(22) := 'APEX$END_OF_GROUP';
--
c_type_shared               constant t_type := 'SHARED';
c_type_sql                  constant t_type := 'SQL_QUERY';
c_type_static               constant t_type := 'STATIC';
c_type_func_returning_sql   constant t_type := 'FUNCTION_BODY';

--##############################################################################
-- Data Types
--##############################################################################

--------------------------------------------------------------------------------
-- LOV record structure
--------------------------------------------------------------------------------
type t_lov is record (
    lov_id                  number,
    lov_name                varchar2(255),
    -- 
    location                wwv_flow_exec_api.t_location,
    source_type             varchar2(23),       --todo constant
    lov_query               varchar2(32767),
    --
    query_meta_data         wwv_flow_exec.t_query_meta_data,
    --
    return_column           wwv_flow_global.t_dbms_id,
    display_column          wwv_flow_global.t_dbms_id,
    icon_column             wwv_flow_global.t_dbms_id,
    group_column            wwv_flow_global.t_dbms_id,
    group_sort_direction    varchar2(16),
    default_sort_column     wwv_flow_global.t_dbms_id,
    default_sort_direction  varchar2(16),
    oracle_text_column      wwv_flow_global.t_dbms_id,
    --
    use_template            boolean,
    display_values          varchar2(32767),
    return_values           varchar2(32767),
    delimiter               varchar2(32676),
    can_cache_data          boolean,
    lov_data                wwv_flow_t_temp_lov_data,
    order_by                t_order_by,
    --
    lov_columns             wwv_flow_plugin_api.t_lov_columns );

c_empty_lov constant t_lov := t_lov();

--------------------------------------------------------------------------------
-- Display value, plus additional column value pairs
--------------------------------------------------------------------------------
type t_row is record (
    display_value   varchar2(32767),
    column_values   wwv_flow_global.vc_map );

--------------------------------------------------------------------------------
-- Rows indexed by the return value
--------------------------------------------------------------------------------
type t_rows is table of t_row index by varchar2(32767);

--======================================================================================================================
-- check whether (legacy) SQL is a query or a PL/SQL body
--======================================================================================================================
function is_plsql( p_sql_or_plsql in varchar2 ) return boolean;

--======================================================================================================================
-- returns the wwv_flow.t_component for a given or the "current" LOV
--======================================================================================================================
function get_lov_component(
    p_lov   in t_lov default c_empty_lov )
    return wwv_flow.t_component;

--======================================================================================================================
-- Returns query meta data for last LOV fetched with get_shared_lov
--
-- Returns:
-- Query metadata
--======================================================================================================================
function current_lov_query_meta_data return wwv_flow_exec.t_query_meta_data;

--======================================================================================================================
-- Looks up a shared LOV ID by name
--
-- Parameters:
-- * p_lov_name         Name of the shared LOV
-- * p_application_id   Application ID
--
-- Returns:
-- The shared LOV ID
--======================================================================================================================
function get_shared_lov_id( 
    p_lov_name       in varchar2,
    p_case_sensitive in boolean default true,
    p_application_id in number  default null ) return number;

--======================================================================================================================
-- Returns the SQL query returning LOV data with Display and return columns. Either a shared LOV ID or an 
-- inline LOV definition must be passed in. The function will return either the LOV SQL query or a query selecting
-- from a table function for static and remote LOVs.
--
-- Parameters:
-- * p_inline_lov        Inline LOV definition to use
-- * p_shared_lov_id     ID of a shared LOV
--
-- * p_remote_server_id: for inline SQL Query LOVs: Remote Server to execute this LOV on.
--
-- * p_return_value      generate a SQL query selecting only a row for this return value
-- * p_no_order_by       suppress additional ORDER BY clauses
-- * p_use_template      whether to use a template for display values
-- 
-- Returns:
-- A SQL query to be embedded into region SQL or to execute in order to get LOV values.
--======================================================================================================================
function get_lov_sql_query (
    p_inline_lov          in varchar2,
    p_inline_lov_language in wwv_flow_code_exec.t_language,
    p_shared_lov_id       in number,
    --
    p_target_location     in wwv_flow_exec_api.t_location default null,
    p_remote_server_id    in number                       default null,
    --
    p_return_value        in varchar2                     default null,
    p_no_order_by         in boolean                      default false,
    p_use_template        in boolean                      default false ) return varchar2;

procedure get_lov_sql_query (
    p_inline_lov          in varchar2,
    p_inline_lov_language in wwv_flow_code_exec.t_language,
    p_shared_lov_id       in number,
    --
    p_target_location     in wwv_flow_exec_api.t_location default null,
    p_remote_server_id    in number                       default null,
    --
    p_return_value        in varchar2                     default null,
    p_no_order_by         in boolean                      default false,
    p_use_template        in boolean                      default false,
    --
    p_sql_query          out varchar2,
    p_display_column     out varchar2,
    p_return_column      out varchar2 );

--======================================================================================================================
-- Fetches and caches a shared LOV. Also prepares the Query Meta Data globals with data source
-- meta data for the WWV_FLOW_EXEC package. A subsequent OPEN_QUERY_CONTEXT invocation with 
-- p_plugin_context => wwv_flow_lov.current_lov_query_meta_data will use the data source settings prepared with
-- this call. ID or Name can be used to identify the LOV
--
-- Parameters:
-- * p_lov_id           ID of the Shared LOV
-- * p_lov_name         Name of the Shared LOV
-- 
-- Returns:
-- LOV meta data as an instance of the T_LOV type.
--======================================================================================================================
function get_shared_lov( 
    p_lov_id            in number,
    p_lov_name          in varchar2 default null,
    p_application_id    in number   default null ) 
    return t_lov;

--======================================================================================================================
-- Given a SQL statement for a static LOV query, return a static LOV index that
-- can be used by get_static_lov_data. Return null if not applicable (i.e.. not
-- a static LOV query).
--
-- Parameters:
-- * p_sql              Static LOV SQL statement
-- 
-- Returns:
-- An index for get_static_lov_data.
--======================================================================================================================
function get_static_lov_index ( p_sql in varchar2 ) return pls_integer;

--======================================================================================================================
-- Returns static LOV data as instance of the wwv_flow_t_temp_lov_data table type. This function is used
-- by the SQL query generated by get_lov_sql_query for a static LOV.
--
-- Parameters:
-- * p_lov_cache_idx          Cache Index of the LOV
-- 
-- Returns:
-- Static LOV data as instance of the wwv_flow_t_temp_lov_data table type        
--======================================================================================================================
function get_static_lov_data ( p_lov_cache_idx in pls_integer ) return wwv_flow_t_temp_lov_data;


--======================================================================================================================
-- Gets the display value for a given LOV and a given return value.
--
-- Parameters:
-- * p_inline_lov             Inline LOV definition to use
-- * p_inline_lov_language    The language of the inline LOV
-- * p_shared_lov_id          ID of a shared LOV
-- * p_display_extra          If set to TRUE and a value isn't found, p_return_value will be added to the result instead.
-- * p_escape_display_extra   If set to TRUE p_return_value will be escaped if added as "Display Extra" value.
-- * p_remote_server_id       If passed in, the query will be executed on this remote server (REST Enabled SQL).
--                            Can only be used for Inline LOVs, and will be ignored for shared LOVs.
-- * p_return_value           Return value to look up the display value for.
--     
-- 
-- Returns:
-- LOV Display value for the given return value
--======================================================================================================================
function get_lov_display_value(
    p_inline_lov            in varchar2,
    p_inline_lov_language   in wwv_flow_code_exec.t_language,
    p_shared_lov_id         in number,
    p_display_extra         in boolean default true,
    p_escape_display_extra  in boolean default true,
    --
    p_remote_server_id      in number  default null,
    --
    p_return_value          in varchar2 ) 
    return varchar2;

--======================================================================================================================
-- Gets the display values for a given LOV and given return values.
--
-- Parameters:
-- * p_inline_lov             Inline LOV definition to use
-- * p_inline_lov_language    The language of the inline LOV
-- * p_shared_lov_id          ID of a shared LOV
-- * p_display_extra          If set to TRUE and a value isn't found, p_return_value will be added to the result instead.
-- * p_escape_display_extra   If set to TRUE p_return_value will be escaped if added as "Display Extra" value.
-- * p_remote_server_id       If passed in, the query will be executed on this remote server (REST Enabled SQL).
--                            Can only be used for Inline LOVs, and will be ignored for shared LOVs.
-- * p_return_value_list      List of return values to look up the display value for.
--     
-- 
-- Returns:
-- LOV Display values for the given return values
--======================================================================================================================
function get_lov_display_value(
    p_inline_lov            in varchar2,
    p_inline_lov_language   in wwv_flow_code_exec.t_language,
    p_shared_lov_id         in number,
    p_display_extra         in boolean default true,
    p_escape_display_extra  in boolean default true,
    --
    p_remote_server_id      in number  default null,
    --
    p_return_value_list     in wwv_flow_global.vc_arr2 ) 
    return wwv_flow_global.vc_arr2;

--======================================================================================================================
-- Gets row values for a given LOV and given return value, or values. By default this will return a t_rows array
-- including the display value. Pass additional columns via p_additional_columns to optionally retrieve more.
--
-- Parameters:
-- * p_item                   The item interface
-- * p_additional_columns     Additional columns to be included in return structure
-- * p_display_extra          If set to TRUE and a value isn't found, p_return_value will be added to the result instead.
-- * p_escape_display_extra   If set to TRUE p_return_value will be escaped if added as "Display Extra" value.
-- * p_return_values          List of return values to look up the row values for.
--     
-- 
-- Returns:
-- t_rows data structure including LOV display value and additional columns requested, for the given return values.
-- Note: If a return value is not found, whether this is included in t_rows depends on p_display_extra.
--======================================================================================================================
function get_row_values(
    p_item                  in  wwv_flow_plugin_api.t_item,
    p_additional_columns    in  wwv_flow_global.vc_arr2,
    p_display_extra         in  boolean default true,
    p_escape_display_extra  in  boolean default true,
    p_return_values         in  wwv_flow_global.vc_arr2 )
    return t_rows;

--======================================================================================================================
-- Builds an instance of the htmldb_item.lov_table type containing LOV data for usage within wwv_flow_item.
--
-- Parameters:
-- * p_inline_lov           Inline LOV definition to use
-- * p_inline_lov_language  The language of the inline LOV
-- * p_shared_lov_id        ID of a shared LOV
-- 
-- Returns:
-- htmldb_item.lov_table instance containing LOV data
--======================================================================================================================
function array_from_lov(
    p_inline_lov          in varchar2,
    p_inline_lov_language in varchar2 default null,
    p_shared_lov_id       in number ) return htmldb_item.lov_table;

--======================================================================================================================
-- Builds an instance of the htmldb_item.lov_table type containing LOV data for usage within wwv_flow_item.
--
-- Parameters:
-- * p_shared_lov_name  Shared LOV Name
-- 
-- Returns:
-- htmldb_item.lov_table instance containing LOV data
--======================================================================================================================
function array_from_lov(
    p_shared_lov_name in varchar2 ) return htmldb_item.lov_table;

--======================================================================================================================
-- Sets all item LOV attributes for a given item
--
-- Parameters:
-- * p_item                 The item interface
-- * p_inline_lov           Inline LOV definition to use
-- * p_inline_lov_language  The language of the inline LOV
-- * p_shared_lov_id        ID of a shared LOV
-- * p_shared_lov_name      Shared LOV Name
-- * p_target_location      Location where the LOV should be executed
-- * p_use_template         Whether to use a template
--======================================================================================================================
procedure set_item_lov_attributes(
    p_item                in out nocopy wwv_flow_plugin_api.t_item,
    p_inline_lov          in varchar2 default null,
    p_inline_lov_language in wwv_flow_code_exec.t_language,
    p_shared_lov_id       in number   default null,
    p_shared_lov_name     in varchar2,
    p_target_location     in wwv_flow_exec_api.t_location default null,
    p_remote_server_id    in number                       default null,
    p_use_template        in boolean default false );
    
--======================================================================================================================
-- Checks if a value is valid for a given List of Values
--
-- Parameters:
-- * p_inline_lov           Inline LOV definition to use
-- * p_inline_lov_language  The language of the inline LOV
-- * p_shared_lov_id        ID of a shared LOV
-- * p_shared_lov_name      Shared LOV Name
-- * p_value                The value to check
--
-- Returns:
-- Value validity
--======================================================================================================================
function is_valid_value (
    p_inline_lov          in varchar2                      default null,
    p_inline_lov_language in wwv_flow_code_exec.t_language default null,
    p_shared_lov_id       in number,
    p_shared_lov_name     in varchar2                      default null,
    p_value               in varchar2 ) 
    return boolean;

--==============================================================================
-- Returns a query context type for the current lov.
--
-- Parameters:
-- *  p_context                 context object obtained with one of the OPEN_ functions                         
-- *  p_first_row               first row to be fetched
-- *  p_max_rows                maximum amount of rows to be fetched
-- *  p_item                    plugin item interface used to execute LOV correctly
-- *  p_supports_grouping       does the item type support grouping
-- *  p_supports_icons          does the item type support icons
-- *  p_supports_add_columns    does the item type support additional columns
-- *  p_search_text             search text
-- *  p_search_operator         exec API search operator
-- *  p_search_case_sensitive   search case sensitive
-- *  p_filters                 filters to apply
-- *  p_sql_parameters          parameters (bind variables) to apply
-- *  p_order_bys               order bys to apply
-- *  p_do_substitutions        whether to perform substitutions
--==============================================================================
procedure open_query_context (
    p_context               in out nocopy wwv_flow_exec.t_context,
    p_first_row             in number                              default null,
    p_max_rows              in number                              default null,
    --
    p_item                  in wwv_flow_plugin_api.t_item,
    p_supports_grouping     in boolean                             default false,
    p_supports_icons        in boolean                             default false,
    p_supports_add_columns  in boolean                             default false,
    --
    p_search_text           in varchar2                            default null,
    p_search_operator       in wwv_flow_exec_api.t_search_operator default wwv_flow_exec_api.c_search_contains_like,
    p_search_case_sensitive in boolean                             default false,
    --
    p_filters               in wwv_flow_exec_api.t_filters         default wwv_flow_exec_api.c_empty_filters,
    p_sql_parameters        in wwv_flow_exec_api.t_parameters      default wwv_flow_exec_api.c_empty_parameters,
    p_order_bys             in wwv_flow_exec_api.t_order_bys       default wwv_flow_exec_api.c_empty_order_bys,
    --
    p_do_substitutions      in boolean                             default false );

--======================================================================================================================
-- Emits LOV as a JSON object in the following format
-- {
--     "values":[
--         { "d": "KING",   "r": "7839", "g":"SALES",    "i": "icon-class1" },
--         { "d": "CLARK",  "r": "7782", "g":"SALES",    "i": "icon-class2" },
--         { "d": "MILLER", "r": "7934", "g":"ACCOUNTS", "i": "icon-class3" }
--     ],
--     "default":""
-- }
--
-- Parameters:
-- * p_item                 plugin item interface
-- * p_supports_grouping    does the item type support grouping
-- * p_supports_icons       does the item type support icons
-- * p_escape               whether to escape the values
-- * p_do_substitutions     whether to perform substitutions
--======================================================================================================================
procedure emit_lov_json (
    p_item                  in wwv_flow_plugin_api.t_item,         
    p_supports_grouping     in boolean  default false,
    p_supports_icons        in boolean  default false,
    p_escape                in boolean,
    p_do_substitutions      in boolean  default false );

--
--
end wwv_flow_lov;
/
show errors
