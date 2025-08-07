set define '^' verify off
prompt ...wwv_data_reporter_dev_api
create or replace package wwv_data_reporter_dev_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_data_reporter_dev_api.sql
--
--    DESCRIPTION
--      Procedures to build and mange Data Reporter application.
--
--    NOTES
--      This API is for INTERNAL project use only and is NOT supported.
--
--    MODIFIED (MM/DD/YYYY)
--    cbcho     06/05/2024 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global Constants
--------------------------------------------------------------------------------

--
-- process point type
--
subtype t_process_point         is pls_integer range 1..2;
c_process_point_before_header   constant t_process_point := 1;
c_process_point_after_header    constant t_process_point := 2;

--
-- IR Detail Link Type
--
subtype t_ir_detail_link_type   is pls_integer range 1..3;

c_ir_detail_link_single_row     constant t_ir_detail_link_type := 1;
c_ir_detail_link_custom         constant t_ir_detail_link_type := 2;
c_ir_detail_link_exclude        constant t_ir_detail_link_type := 3;

--
-- faceted search
--
c_filter_region_faceted_search
    constant wwv_flow_faceted_search_dev.t_filter_region_type := wwv_flow_faceted_search_dev.c_filter_region_faceted_search;
c_filter_region_smart_filters
    constant wwv_flow_faceted_search_dev.t_filter_region_type := wwv_flow_faceted_search_dev.c_filter_region_smart_filters;

c_result_region_classic
    constant wwv_flow_faceted_search_dev.t_result_region_type := wwv_flow_faceted_search_dev.c_result_region_classic;
c_result_region_content_row
    constant wwv_flow_faceted_search_dev.t_result_region_type := wwv_flow_faceted_search_dev.c_result_region_content_row;

subtype t_facet_type            is pls_integer range 1..2;

c_facet_checkbox                constant t_facet_type         := 1;
c_facet_input                   constant t_facet_type         := 2;

c_facet_display_inline
    constant wwv_flow_faceted_search_dev.t_filter_region_type := wwv_flow_faceted_search_dev.c_filter_display_inline;
c_facet_display_filter_dialog
    constant wwv_flow_faceted_search_dev.t_filter_region_type := wwv_flow_faceted_search_dev.c_filter_display_filter_dialog;

subtype t_link_type             is pls_integer range 1..3;

c_link_type_redirect_page       constant t_link_type          := 1;
c_link_type_redirect_app        constant t_link_type          := 2;
c_link_type_redirect_url        constant t_link_type          := 3;

subtype t_avatar_type           is pls_integer range 1..3;

c_avatar_icon                   constant t_avatar_type        := 1;
c_avatar_initials               constant t_avatar_type        := 2;
c_avatar_image                  constant t_avatar_type        := 3;

subtype t_avatar_img_src_type   is pls_integer range 1..3;

c_avatar_img_url               constant t_avatar_img_src_type := 1;
c_avatar_img_blob_column       constant t_avatar_img_src_type := 2;
c_avatar_img_url_column        constant t_avatar_img_src_type := 3;
--------------------------------------------------------------------------------
-- Global Types
--------------------------------------------------------------------------------

--
-- Report Column Types
--

--------------------------------------------------------------------------------
-- Report column definition.
--
-- column_name:          Database column name
-- column_label:         Label for the column
-- display_seq:          Display sequence
-- display_in_report:    Whether to display in report
-- format_mask:          Format mask to use
-- column_link:          Column link URL
-- column_link_text:     The text to use for the column link
-- column_link_attr:     The link attribute
--------------------------------------------------------------------------------
type t_report_column is record (
    column_name        wwv_flow_global.t_dbms_id,
    data_type          wwv_flow_global.t_dbms_id,
    column_label       varchar2(4000),
    display_seq        number,
    display_in_report  boolean default true,
    format_mask        varchar2(255),
    column_link        varchar2(4000),
    column_link_text   varchar2(4000),
    column_link_attr   varchar2(4000) );

type t_report_columns is table of t_report_column index by binary_integer;

--------------------------------------------------------------------------------
-- The PL/SQL process definition
--
-- process_seq: The order of execution within each process point
-- point:       The point when the process executes on
-- name:        The name of the process
-- code:        The PL/SQL process logic
--------------------------------------------------------------------------------
type t_process is record (
    process_seq  number,
    point        t_process_point,
    name         varchar2(255),
    code         varchar2(32767) );

--
-- Interactive Report Types
--

--------------------------------------------------------------------------------
-- Interactive report detail link definition.
--
-- link_type:            The type of link to display
-- link_target:          Target of the link
-- link_icon:            Icon to display for the link
-- link_attribute:       The attribute for the link
--------------------------------------------------------------------------------
type t_ir_detail_link is record (
    link_type          t_ir_detail_link_type,
    link_target        varchar2(4000),
    link_icon          varchar2(4000),
    link_attribute     varchar2(4000) );

--------------------------------------------------------------------------------
-- Interactive report page definition.
--
-- page_id:                   The page_id to create
-- page_name:                 Name of the page
-- sql_query:                 SQL query for the interactive report source
-- report_name:               Name for the interactive report region
-- report_columns:            Report column definition for the interactive report
-- detail_link:               Detail link definition
-- show_save_public:          Show save public report menu, default is FALSE,
-- show_subscription:         Show subscription menu, default is FALSE
-- help_text:                 Help text for the page
-- process:                   The PL/SQL page process logic to execute
--------------------------------------------------------------------------------
type t_ir_page is record(
    page_id                   number,
    page_name                 wwv_flow_steps.name%type,
    sql_query                 clob,
    report_name               wwv_flow_worksheets.name%type,
    report_columns            t_report_columns,
    detail_link               t_ir_detail_link,
    show_save                 boolean default false,
    show_save_public          boolean default false,
    show_subscription         boolean default false,
    help_text                 varchar2(4000),
    --
    process                   t_process );

--
-- Faceted Search Types
--

-------------------------------------------------------------------------------
-- External order by definition.
--
-- expression:            The order by clause
-- key:                   Return key value
-- display:               Display value
--------------------------------------------------------------------------------
type t_external_order_by is record (
    expression       varchar2(4000),
    key              varchar2(255),
    display          varchar2(255) );

type t_external_order_bys is table of t_external_order_by index by binary_integer;

-------------------------------------------------------------------------------
-- Facet column definition.
--
-- column_name            The source column name used for the facet
-- display_as             The type how the facet is rendered
-- label                  The label for the facet
-- multi_value            Multi-value definition
--------------------------------------------------------------------------------
type t_facet_column is record (
    column_name            wwv_flow_global.t_dbms_id,
    data_type              wwv_flow_global.t_dbms_id,
    facet_type             t_facet_type,
    display_as             wwv_flow_faceted_search_dev.t_filter_region_type,
    label                  varchar2(255),
    multi_value            wwv_flow_exec_api.t_multi_value );

type t_facet_columns is table of t_facet_column index by binary_integer;

--------------------------------------------------------------------------------
-- Link definition
--
-- target_type:           The target type
-- target_url:            The target URL
--------------------------------------------------------------------------------
type t_link is record (
    target_type              t_link_type,
    target_url               varchar2(4000) );

-------------------------------------------------------------------------------
-- Content row avatar image source definition
--
-- source_type:          The image source type either URL, BLOB Column, URL Column
-- source:               The image source
--------------------------------------------------------------------------------
type t_avatar_image is record (
    source_type              t_avatar_img_src_type,
    source                   varchar2(4000) );

--------------------------------------------------------------------------------
-- Content row region definition.
--
-- overline:             Text and/or column substitution strings to display at the top of each row above the title and description.
-- title:                Text and/or column substitution strings to be used as the title in each row.
-- title_link:           Title link target type and URL
-- description:          Text and/or column substitution strings to be used as the description in each row
-- miscellaneous:        Text and/or column substitution strings to be used as the miscellaneous in each row.
-- row_link:             Full row link target type and URL
-- display_avatar:       Whether to display avatar
-- avatar_type:          The avatar type either icon, initials or image
-- avatar_icon:          The avatar icon name
-- avatar_initials:      The column used as avatar initials
-- avatar_image:         The avatar image source type and the source
-- avatar_description:   The short description of the avatar image. This will be used as alt text for the avatar image
-- display_badge:        Whether to display badge
-- badge_label:          The column for the badge label
-- badge_value:          The column for the badge value
-- bedge_state:          The column for the state of the badge ( ie. danger, warning, success, or info )
--------------------------------------------------------------------------------
type t_content_row is record (
    overline               varchar2(4000),
    title                  varchar2(4000),
    title_link             t_link,
    description            varchar2(4000),
    miscellaneous          varchar2(4000),
    row_link               t_link,
    --
    display_avatar         boolean               default false,
    avatar_type            t_avatar_type,          -- icon, initials, image
    avatar_icon            varchar2(255),
    avatar_initials        varchar2(255),
    avatar_image           t_avatar_image,
    avatar_description     varchar2(4000),
    --
    display_badge          boolean               default false,
    badge_label            wwv_flow_global.t_dbms_id,
    badge_value            wwv_flow_global.t_dbms_id,
    badge_state            wwv_flow_global.t_dbms_id );

-------------------------------------------------------------------------------
-- Facet search page definition.
--
-- page_id:                   New page_id for faceted search page
-- page_name:                 The name of the page
-- filter_region_type:        The filter region type ( i.e. faceted search or smart filters )
-- result_region_type:        The result region type ( i.e. classic report or content row )
-- sql_query:                 SQL source for the result region
-- searchable_columns:        Column names that are used for text search
-- facet_columns:             Column names to use as facets
-- external_order_bys:        The definition of external order by record
-- report_columns:            Column definition for the classic report result region
-- content_row:               Content row definition for the content row result region
-- help_text:                 The help text for the page
-- process:                   The PL/SQL page process logic to execute
--------------------------------------------------------------------------------
type t_faceted_search_page is record (
    page_id                   number,
    page_name                 wwv_flow_steps.name%type,
    filter_region_type        wwv_flow_faceted_search_dev.t_filter_region_type default c_filter_region_faceted_search,
    result_region_type        wwv_flow_faceted_search_dev.t_result_region_type default c_result_region_classic,
    sql_query                 clob,
    searchable_columns        wwv_flow_t_varchar2,
    facet_columns             t_facet_columns,
    external_order_bys        t_external_order_bys,
    report_columns            t_report_columns,
    content_row               t_content_row,
    help_text                 varchar2(4000),
    --
    process                   t_process );

--==============================================================================
-- Return TRUE if p_sql_query contains an order by clause at the end.
--
-- Parameters:
-- * p_sql_query:  The SQL query to validate on
--==============================================================================
function is_query_with_order_by (
    p_sql_query in clob )
    return boolean;

--==============================================================================
-- Gets the minimum available page
--
-- Parameters:
-- * p_start_page:  The starting page ID to compute the free available page from
--==============================================================================
function minimum_free_page (
    p_start_page in number default 1 )
    return number;

--==============================================================================
-- Deletes page
--
-- Parameters:
-- * p_page_id:     The page ID to delete
--==============================================================================
procedure delete_page (
    p_page_id in number );

--==============================================================================
-- Creates interactive report page
--
-- Parameters:
-- * p_ir_page:               The interactive report page definition record
--==============================================================================
procedure create_ir_page (
    p_ir_page               in t_ir_page );

--==============================================================================
-- Creates faceted search page
--
-- Parameters:
-- * p_faceted_search_page:     The faceted search page definition record
--==============================================================================
procedure create_faceted_search_page (
    p_faceted_search_page   in t_faceted_search_page );

--==============================================================================
-- Creates faceted search and interactive report pages,
-- with a button to toggle the view between the page.
--
-- Parameters:
-- * p_faceted_search_page:     The faceted search page definition record
-- * p_ir_page:                 The interactive report page definition record
--==============================================================================
procedure create_data_reporter_page(
    p_faceted_search_page   in t_faceted_search_page,
    p_ir_page               in t_ir_page );

end wwv_data_reporter_dev_api;
/
show errors;