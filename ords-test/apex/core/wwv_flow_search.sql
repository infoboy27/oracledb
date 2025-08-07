set define '^' verify off
prompt ...wwv_flow_search.sql
create or replace package wwv_flow_search as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_search.sql
--
--    DESCRIPTION
--      Application Search
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    06/07/2022 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Constants
--==============================================================================

--------------------------------------------------------------------------------
-- Search Type Constants
--------------------------------------------------------------------------------
subtype t_vc_search_type is varchar2(16);

c_search_type_simple           constant t_vc_search_type := 'SIMPLE';
c_search_type_list             constant t_vc_search_type := 'APEX_LIST';
c_search_type_text_manual      constant t_vc_search_type := 'TEXT_MANUAL';
c_search_type_text_dbms_search constant t_vc_search_type := 'TEXT_DBMS_SEARCH';
c_search_type_vector           constant t_vc_search_type := 'VECTOR';

subtype t_icon_type        is pls_integer range 1..5;

c_icon_static_class            constant t_icon_type          := 1;
c_icon_dynamic_class           constant t_icon_type          := 2;
c_icon_url                     constant t_icon_type          := 3;
c_icon_blob                    constant t_icon_type          := 4;
c_icon_initials                constant t_icon_type          := 5;

c_column_name_text_score       constant varchar2(18)         := 'APEX$ORATEXT_SCORE';

c_result_icon_type_class       constant varchar2(5)          := 'CLASS';
c_result_icon_type_url         constant varchar2(3)          := 'URL';
c_result_icon_type_initials    constant varchar2(8)          := 'INITIALS';
c_result_icon_type_blob        constant varchar2(4)          := 'BLOB';

--
-- substitutions being usable in row templates.
--
c_subst_title                  constant varchar2(5)          := 'TITLE';
c_subst_subtitle               constant varchar2(8)          := 'SUBTITLE';
c_subst_pk_1                   constant varchar2(13)         := 'PRIMARY_KEY_1';
c_subst_pk_2                   constant varchar2(13)         := 'PRIMARY_KEY_2';
c_subst_descr                  constant varchar2(11)         := 'DESCRIPTION';
c_subst_badge                  constant varchar2(5)          := 'BADGE';
c_subst_lastmodified           constant varchar2(13)         := 'LAST_MODIFIED';
c_subst_has_custom_attrs       constant varchar2(16)         := 'HAS_CUSTOM_ATTRS';
c_subst_custom1                constant varchar2(9)          := 'CUSTOM_01';
c_subst_custom2                constant varchar2(9)          := 'CUSTOM_02';
c_subst_custom3                constant varchar2(9)          := 'CUSTOM_03';
c_subst_score                  constant varchar2(5)          := 'SCORE';
c_subst_config_id              constant varchar2(9)          := 'CONFIG_ID';
c_subst_config_label           constant varchar2(12)         := 'CONFIG_LABEL';
c_subst_icon_type              constant varchar2(9)          := 'ICON_TYPE';
c_subst_icon_value             constant varchar2(10)         := 'ICON_VALUE';
c_subst_result_css_classes     constant varchar2(18)         := 'RESULT_CSS_CLASSES';
c_subst_link                   constant varchar2(4)          := 'LINK';
c_subst_icon_mimetype          constant varchar2(13)         := 'ICON_MIMETYPE';
c_subst_icon_blob              constant varchar2(9)          := 'ICON_BLOB';

--==============================================================================
-- Global types
--==============================================================================

--
-- this type represents a reduced set of search configuration meta data, in
-- order to be able to interpret the context object with search results. Used
-- by the (public) table function WWV_FLOW_SEARCH_API.SEARCH.
--
type t_column_positions is table of pls_integer index by varchar2(255);

type t_row_info is record(
    search_id                         number,
    search_label                      varchar2(32767),
    is_static_list                    boolean,
    --
    pk_column_name                    wwv_flow_global.t_dbms_id,
    pk2_column_name                   wwv_flow_global.t_dbms_id,
    title_column_name                 wwv_flow_global.t_dbms_id,
    subtitle_column_name              wwv_flow_global.t_dbms_id,
    description_column_name           wwv_flow_global.t_dbms_id,
    badge_column_name                 wwv_flow_global.t_dbms_id,
    last_modified_column_name         wwv_flow_global.t_dbms_id,
    last_modified_column_datatype     wwv_flow_exec_api.t_data_type,
    custom_01_column_name             wwv_flow_global.t_dbms_id,
    custom_02_column_name             wwv_flow_global.t_dbms_id,
    custom_03_column_name             wwv_flow_global.t_dbms_id,
    score_column_name                 wwv_flow_global.t_dbms_id,
    icon_class_column_name            wwv_flow_global.t_dbms_id,
    icon_blob_column_name             wwv_flow_global.t_dbms_id,
    icon_mimetype_column_name         wwv_flow_global.t_dbms_id,
    formatted_row_column_name         wwv_flow_global.t_dbms_id,
    --
    query_column_positions            t_column_positions,
    --
    icon_type                         t_icon_type,
    icon_static_class                 varchar2(32767),
    icon_url                          varchar2(32767),
    link_target                       varchar2(32767),
    --
    result_css_classes                varchar2(32767),
    --
    template_static_id                varchar2(32767) );

--------------------------------------------------------------------------------
type t_search_region_data is record(
    region_id                 number,
    last_modified_format_mask varchar2(255),
    ajax_items_to_submit      varchar2(32767),
    --
    max_results_per_source    wwv_flow_global.n_arr,
    label_per_source          wwv_flow_global.vc_arr2 );


--------------------------------------------------------------------------------
-- Search Type APEX_LIST constants
--------------------------------------------------------------------------------
c_static_list_query constant wwv_flow_lists.list_query%type := wwv_flow_string.join( wwv_flow_t_varchar2(
                                                                   '    select list_entry_id,',
                                                                   '           entry_text,',
                                                                   '           entry_target,',
                                                                   '           null col04,',
                                                                   '           entry_image,',
                                                                   '           null col06,',
                                                                   '           null col07,',
                                                                   '           entry_attribute_01,',
                                                                   '           entry_attribute_02,',
                                                                   '           entry_attribute_03,',
                                                                   '           entry_attribute_04,',
                                                                   '           entry_attribute_05,',
                                                                   '           entry_attribute_06,',
                                                                   '           entry_attribute_07,',
                                                                   '           entry_attribute_08,',
                                                                   '           entry_attribute_09,',
                                                                   '           entry_attribute_10',
                                                                   '      from apex_application_list_entries i',
                                                                   '     where coalesce(entry_target,''none'') != ''separator''',
                                                                   '       and condition_type_code             is null',
                                                                   '       and authorization_scheme_id         is null',
                                                                   '       and build_option                    is null',
                                                                   'start with list_entry_parent_id is null',
                                                                   '       and application_id       = :SEARCH_APP_ID',
                                                                   '       and list_id              = :SEARCH_LIST_ID',
                                                                   'connect by list_entry_parent_id = prior list_entry_id',
                                                                   '       and application_id       = prior application_id',
                                                                   '       and list_id              = prior list_id',
                                                                   '     order siblings by display_sequence, entry_text' ) );

--==============================================================================
-- Globals
--==============================================================================



--==============================================================================
-- fetches search configuration meta data into memory. If a search is about
-- to run on multiple search configurations it makes sense to call this procedure
-- first, in order to load all meta data in one go.
--
-- Parameters:
-- * p_search_ids:             IDs to load meta data for.
-- * p_define_row_templates:   Whether to define the row templates.
-- * p_emit_css_js:            When to emit CSS and JS of the row templates.
--==============================================================================
procedure fetch_meta_data(
    p_search_ids             in out nocopy wwv_flow_t_number,
    p_define_row_templates   in            boolean,
    p_emit_css_js            in            wwv_flow_template_directive.t_when );

--==============================================================================
-- returns TRUE if a search region is currently executing
--==============================================================================
function is_search_region_executing return boolean;

--==============================================================================
-- get additional search region information, if a search region
-- is currently executing.
--==============================================================================
function get_search_region_info return t_search_region_data;


--==============================================================================
-- Inject a format mask into aN EXEC context's result columns. This is to
-- allow template substitutions to pick the format mask up, even after the
-- context query was executed.
--==============================================================================
procedure inject_lastmodified_formatmask(
    p_context       in out nocopy wwv_flow_exec.t_context,
    p_column_name   in            varchar2,
    p_format_mask   in            varchar2 );

--==============================================================================
-- Return the list of query prefixes used by the search configurations for
-- which IDs are passed in.
--==============================================================================
function get_search_prefixes(
    p_search_ids in wwv_flow_t_number )
    return wwv_flow_global.vc_map;

--==============================================================================
-- generates a URL to download a BLOB Icon for a search result
--==============================================================================
function get_blob_column_url (
    p_search_source_cache_idx  in varchar2,
    p_context                  in wwv_flow_exec.t_context,
    p_row_info                 in t_row_info,
    p_pk1_value                in varchar2,
    p_pk2_value                in varchar2 )
    return varchar2;

--==============================================================================
-- initializes application search
--
-- Parameters:
-- * p_search_id:              ID to initialize search for.
-- * p_search_expression:      Terms to search with
-- * p_apply_order_bys:        Whether to apply search config ORDER BY settings. Typically
--                             disabled when called from the APEX_SEARCH.SEARCH table function
--                             and the outer query has its own ORDER BY.
-- * p_use_as_initial_result:  determines whether to use this source as "initial" result
-- * p_return_total_row_count: whether to return the total row count
-- * p_override_max_results:   override the maximum results configured in the search configuration
-- * p_search_prefixes:        search keyword prefixes to consider when pre-processing the search query.
--
-- Returns:
-- * p_context:                Context object to fetch result rows from.
-- * p_has_data:               Whether the search contains data to fetch.
-- * p_row_info:               Interpretation information for rows returned by p_context.
--==============================================================================
procedure initialize_search(
    p_search_id              in            number,
    p_search_expression      in            varchar2,
    p_apply_order_bys        in            boolean                 default true,
    p_use_as_initial_result  in            boolean,
    p_return_total_row_count in            boolean                 default false,
    p_override_max_results   in            number                  default null,
    p_search_prefixes        in            wwv_flow_global.vc_map  default wwv_flow_global.c_empty_vc_map,
    --
    p_context                in out nocopy wwv_flow_exec.t_context,
    p_has_data                  out        boolean,
    p_row_info                  out        t_row_info );

--==============================================================================
-- converts a list of search configuration static IDs to a list of search
-- configuration IDs.
--
-- Parameters:
-- * p_search_static_ids:      List of static IDs to convert
--
-- Returns:
-- the list with corresponding internal IDs
--==============================================================================
function get_search_config_ids(
    p_search_static_ids      in wwv_flow_t_varchar2 )
    return wwv_flow_t_number;


--==============================================================================
-- Plug-In render function
--==============================================================================
function render (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow_meta_data.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;

--==============================================================================
-- Plug-In AJAX function
--==============================================================================
function ajax (
    p_plugin               in wwv_flow_plugin_api.t_plugin,
    p_region               in wwv_flow_plugin_api.t_region,
    p_json_path            in varchar2 )
    return wwv_flow_plugin_api.t_region_ajax_result;

--==============================================================================
-- Tokenize the expression into indiviual words, based on the space character.
-- Enquoted tokens ("Oracle Database") are kept together as one token. The
-- quote character can be escaped as "".
--
--  An input of
--
--    'Hello "world""s end" foo'
--
--  returns:
--
--    1. Hello
--    2. "world""s end"
--    3. foo
--
-- Parameters:
-- * p_expression:      Space-separated list of one or more search tokens
--
-- Returns:
-- list of individual, whitespace-trimmed search terms
--
--==============================================================================
function simple_tokenize(
    p_expression           in varchar2 )
    return wwv_flow_t_varchar2;
end wwv_flow_search;
/
show err

set define '^'
