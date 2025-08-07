set define '^' verify off
prompt ...wwv_flow_dictionary_dev
create or replace package wwv_flow_dictionary_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_dictionary_dev.sql
--
--    DESCRIPTION
--      This package provides helper functions for wwv_flow_search and
--      wwv_flow_advisor.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    08/24/2009 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_view is record (
    view_name             wwv_flow_dictionary_views.view_name            %type,
    component_type_id     wwv_flow_dictionary_views.component_type_id    %type,
    pk_column_name        wwv_flow_dictionary_views.pk_column_name       %type,
    display_expression    wwv_flow_dictionary_views.display_expression   %type,
    order_expression      wwv_flow_dictionary_views.order_expression     %type,
    parent_view_name      wwv_flow_dictionary_views.view_name            %type,
    parent_fk_column_name wwv_flow_dictionary_views.pk_column_name       %type,
    lookup_or_lov_columns wwv_flow_dictionary_views.lookup_or_lov_columns%type,
    order_seq             wwv_flow_dictionary_views.order_seq            %type,
    link_url              wwv_flow_dictionary_views.link_url             %type,
    has_page_id           boolean,
    is_shared_designer    boolean );
--
type t_view_map is table of t_view index by wwv_flow_dictionary_views.view_name%type;
--
--==============================================================================
-- Global constants
--==============================================================================
--
--
--==============================================================================
-- Global variables
--==============================================================================
g_view_map t_view_map;
--
--==============================================================================
-- Returns the primary key column for a dictionary view.
--==============================================================================
function get_primary_key_column (
    p_view_name in varchar2 )
    return varchar2;
--
--==============================================================================
-- Adds an object to the specified collection.
--==============================================================================
procedure add_to_result (
    p_collection_name   in varchar2,
    p_application_id    in number,
    p_view_name         in varchar2,
    p_primary_key_value in varchar2,
    p_column_name       in varchar2,
    p_column_json_key   in varchar2,
    p_c005              in varchar2 default null,
    p_c006              in varchar2 default null,
    p_c007              in varchar2 default null,
    p_c008              in varchar2 default null,
    p_n002              in number   default null,
    p_n003              in number   default null );
--
--==============================================================================
-- Searches all values in a JSON for a given string and returns any keys that matched
-- The JSON is expected to be a simple:
-- {
--    "key1": "value1",
--    "key2": "value2",
--    ...
-- }
-- that is, a "flat" structure, where all values are strings.
--==============================================================================
function search_in_json (
    p_json              in  sys.json_object_t,
    p_search_string     in  varchar2,
    p_is_regex          in  boolean default false,
    p_is_case_sensitive in  boolean default false )
    return sys.json_key_list;
--
end wwv_flow_dictionary_dev;
/
show errors
