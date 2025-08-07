set define '^' verify off
prompt ...wwv_flow_define_app_v3
create or replace package wwv_flow_define_app_v3 as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2024, Oracle and/or its affiliates
--
--    NAME
--      wwv_flow_define_app_v3.sql
--
--    DESCRIPTION
--     Used to define pages in new create application wizard introduced in APEX 5.1.1
--
--    NOTES
--      This API is unsupported.
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    01/25/2017 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_chart is record(
    chart_name        varchar2(255),
    chart_type        varchar2(255),
    table_name        varchar2(255),
    label_column      varchar2(255),
    value_column      varchar2(255),
    value_function    varchar2(30),
    --
    link_column       varchar2(255),
    link_key          varchar2(255),
    link_to_page      varchar2(255),
    link_target_key   varchar2(255) );

type t_chart_list is table of t_chart index by pls_integer;

type t_calendar is record(
    display_column    varchar2(255),
    start_date_column varchar2(255),
    end_date_column   varchar2(255),
    show_time         varchar2(1) );

type t_table_list is table of varchar2(255) index by pls_integer;

type t_md is record(
    md_type                varchar2(255),
    primary_label_column   varchar2(255),
    secondary_label_column varchar2(255),
    detail_table_1         wwv_flow_global.t_dbms_id,
    detail_table_2         wwv_flow_global.t_dbms_id,
    detail_table_3         wwv_flow_global.t_dbms_id,
    detail_table_4         wwv_flow_global.t_dbms_id );

type t_card is record(
    layout_type    varchar2(255),
    title_column   varchar2(255),
    body_column    varchar2(255),
    icon_column    varchar2(255) ,
    badge_column   varchar2(255) );

type t_timeline is record(
    username_column   varchar2(255),
    date_column       varchar2(255),
    event_name_column varchar2(255),
    desc_column       varchar2(255) );

type t_wizard is record(
    page_mode     varchar2(30),
    page_name_1   varchar2(255),
    page_name_2   varchar2(255),
    page_name_3   varchar2(255),
    page_name_4   varchar2(255),
    page_name_5   varchar2(255),
    page_name_6   varchar2(255),
    page_name_7   varchar2(255),
    page_name_8   varchar2(255) );

type t_map is record(
    layer_type             varchar2(255),
    geometry_column_type   varchar2(255),
    geometry_column        varchar2(128),
    longitude_column       varchar2(128),
    latitude_column        varchar2(128),
    extrusion_value_column varchar2(128),
    value_column           varchar2(128),
    heat_value_column      varchar2(128),
    tooltip_column         varchar2(128) );

type t_drill_down is record(
    link_column     varchar2(255),
    link_key        varchar2(255),
    link_to_page    number,
    link_target_key varchar2(255) );

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_empty_t_chart_list     t_chart_list;
c_empty_t_table_list     t_table_list;

c_y                   constant  varchar2(1) := 'Y';
c_n                   constant  varchar2(1) := 'N';

-- page types
c_page_blank          constant varchar2(30) := 'BLANK';
c_page_ig             constant varchar2(30) := 'INTERACTIVE_GRID';
c_page_ir             constant varchar2(30) := 'INTERACTIVE_RPT';
c_page_cr             constant varchar2(30) := 'CLASSIC_RPT';
c_page_faceted_search constant varchar2(30) := 'FACETED_SEARCH';
c_page_cards          constant varchar2(30) := 'CARDS';
c_page_calendar       constant varchar2(30) := 'CALENDAR';
c_page_form           constant varchar2(30) := 'FORM';
c_page_master_detail  constant varchar2(30) := 'MASTER_DETAIL';
c_page_list           constant varchar2(30) := 'LIST';
c_page_dashboard      constant varchar2(30) := 'DASHBOARD';
c_page_chart          constant varchar2(30) := 'CHART';
c_page_timeline       constant varchar2(30) := 'TIMELINE';
c_page_wizard         constant varchar2(30) := 'WIZARD';
c_page_map            constant varchar2(30) := 'MAP';
c_page_smart_filters  constant varchar2(13) := 'SMART_FILTERS';
-- faceted search result region type
c_fs_result_card      constant varchar2(4)  := 'CARD';
c_fs_result_cr        constant varchar2(2)  := 'CR';
-- form types
c_form_on_table       constant varchar2(30) := 'FORM_ON_TABLE';
c_md_w_selector       constant varchar2(30) := 'MD_ON_TABLE_WITH_SELECTOR';
c_md_grid             constant varchar2(30) := 'MD_GRID';

--source types
c_table               constant varchar2(5)  := 'TABLE';
c_sql                 constant varchar2(3)  := 'SQL';

c_page_collection     constant varchar2(255) := 'APEX$CREATE_APP_PAGE';
c_icons_collection    constant varchar2(255) := 'APEX$CREATE_APP_ICONS';
c_chart_collection    constant varchar2(255) := 'APEX$CREATE_APP_PAGE_CHART';
c_column_collection   constant varchar2(255) := 'APEX$CREATE_APP_PAGE_COLUMN';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--

--==============================================================================
-- checks if page is homepage
--==============================================================================
function is_home_page(
    p_page_id in number default null )
    return boolean;

--==============================================================================
-- gets the internal page_id
--==============================================================================
function get_internal_page_id(
    p_page_id  in number )
    return number;

--==============================================================================
-- gets the page_id using internal_page_id that is set at create and never change
--==============================================================================
function get_page_id(
    p_internal_page_id  in number )
    return number;

--==============================================================================
-- gets table names from a script file
--==============================================================================
function get_valid_tables(
    p_schema     in varchar2,
    p_file_id    in number )
    return wwv_flow_t_varchar2;

--==============================================================================
-- initializes create app wizard
--==============================================================================
procedure init_wizard;

--==============================================================================
-- moves page up
--==============================================================================
procedure move_page_up(
    p_page_id  in number );

--==============================================================================
-- moves page down
--==============================================================================
procedure move_page_down(
    p_page_id  in number );

--==============================================================================
-- adds page attribute into a collection
--==============================================================================
function add_page(
    p_internal_page_id  in number       default null,
    p_page_name         in varchar2,
    p_page_type         in varchar2,
    p_page_icon         in varchar2     default null,
    p_page_help         in varchar2     default null,
    p_schema            in varchar2     default null,
    p_source_type       in varchar2     default null,
    p_source            in clob         default null,
    p_table_name        in varchar2     default null,
    p_is_homepage       in boolean      default false,
    p_is_admin_page     in boolean      default false,
    --
    p_fs_report_type    in varchar2     default null,
    p_facet_columns     in varchar2     default null,
    p_ig_is_editable    in boolean      default false,
    p_include_form      in boolean      default false,
    p_include_report    in boolean      default false,
    p_form_type         in varchar2     default null,
    p_parent_page_id    in number       default null,
    p_calendar          in t_calendar   default null,
    p_md                in t_md         default null,
    p_card              in t_card       default null,
    p_timeline          in t_timeline   default null,
    p_wizard            in t_wizard     default null,
    p_map               in t_map        default null,
    p_chart_list        in t_chart_list default c_empty_t_chart_list,
    p_detail_table_list in t_table_list default c_empty_t_table_list,
    -- mike
    p_link_column       in varchar2     default null,
    p_link_key          in varchar2     default null,
    p_link_to_page      in varchar2     default null,
    p_link_target_key   in varchar2     default null,
    --
    p_raise_error       in boolean      default false )
    return number;

--==============================================================================
-- adds page definition into collection
--==============================================================================
procedure add_page(
    p_internal_page_id  in number       default null,
    p_page_name         in varchar2,
    p_page_type         in varchar2,
    p_page_icon         in varchar2     default null,
    p_page_help         in varchar2     default null,
    p_schema            in varchar2     default null,
    p_source_type       in varchar2     default null,
    p_source            in clob         default null,
    p_table_name        in varchar2     default null,
    p_is_homepage       in boolean      default false,
    p_is_admin_page     in boolean      default false,
    --
    p_fs_report_type    in varchar2     default null,
    p_facet_columns     in varchar2     default null,
    p_ig_is_editable    in boolean      default false,
    p_include_form      in boolean      default false,
    p_include_report    in boolean      default false,
    p_parent_page_id    in number       default null,
    p_form_type         in varchar2     default null,
    p_calendar          in t_calendar   default null,
    p_md                in t_md         default null,
    p_card              in t_card       default null,
    p_timeline          in t_timeline   default null,
    p_wizard            in t_wizard     default null,
    p_map               in t_map        default null,
    p_chart_list        in t_chart_list default c_empty_t_chart_list,
    p_detail_table_list in t_table_list default c_empty_t_table_list,
    -- mike
    p_link_column       in varchar2     default null,
    p_link_key          in varchar2     default null,
    p_link_to_page      in varchar2     default null,
    p_link_target_key   in varchar2     default null );

--==============================================================================
-- edits page attributes
--==============================================================================
procedure edit_page(
    p_page_id           in number,
    p_page_name         in varchar2,
    p_page_type         in varchar2,
    p_page_icon         in varchar2     default null,
    p_page_help         in varchar2     default null,
    p_schema            in varchar2     default null,
    p_source_type       in varchar2     default null,
    p_source            in clob         default null,
    p_table_name        in varchar2     default null,
    p_is_homepage       in boolean      default false,
    p_is_admin_page     in boolean      default false,
    --
    p_fs_report_type    in varchar2     default null,
    p_facet_columns     in varchar2     default null,
    p_ig_is_editable    in boolean      default false,
    p_include_form      in boolean      default false,
    p_include_report    in boolean      default false,
    p_parent_page_id    in number       default null,
    p_form_type         in varchar2     default null,
    p_calendar          in t_calendar   default null,
    p_md                in t_md         default null,
    p_card              in t_card       default null,
    p_timeline          in t_timeline   default null,
    p_wizard            in t_wizard     default null,
    p_map               in t_map        default null,
    p_chart_list        in t_chart_list default c_empty_t_chart_list,
    p_detail_table_list in t_table_list default c_empty_t_table_list,
    -- mike
    p_link_column       in varchar2     default null,
    p_link_key          in varchar2     default null,
    p_link_to_page      in varchar2     default null,
    p_link_target_key   in varchar2     default null );

--==============================================================================
-- Deletes page
--==============================================================================
procedure delete_page(
    p_page_id     in number );

--==============================================================================
-- Edits page collection to save the real page_id that will be created
--==============================================================================
procedure save_page_id(
    p_seq_id      in number,
    p_new_page_id in number );

--==============================================================================
-- Saves the region ID to the column collection,
-- so it can be used when setting app defaults
--==============================================================================
procedure save_region_id(
    p_internal_page_id in number,
    p_table_name       in varchar2,
    p_new_region_id    in number );

--==============================================================================
-- Adds multiple IR pages in Create App Wizard
--==============================================================================
procedure add_ir_pages(
    p_schema              in varchar2,
    p_selected_rows_json  in varchar2 );

--==============================================================================
-- Adds page from a SQL Script run result
--==============================================================================
procedure add_page_from_script(
    p_schema             in varchar2,
    p_script_result_id   in number,
    --
    p_app_name           out varchar2 );

--==============================================================================
-- Adds page from a SQL Script file
--==============================================================================
procedure add_page_from_script(
    p_schema   in varchar2,
    p_file_id  in number,
    --
    p_app_name out varchar2 );

--==============================================================================
-- Adds page using a table
--==============================================================================
procedure add_page_with_new_table(
    p_schema       in varchar2,
    p_table_name   in varchar2,
    --
    p_app_name     out varchar2 );

--
-- Sample Data
--

function get_country_population_data  return clob ;
function get_project_data             return clob ;
function get_emp_data                 return clob ;
function get_vehical_speed_data       return clob ;
function get_sales_data               return clob ;
function get_academic_data            return clob ;
function get_json_test_data           return clob ;
function get_json_only_data           return clob ;

--==============================================================================
-- Adds pages from a sample JSON. Used from Sample Dataset install.
--==============================================================================
procedure add_page_from_sample_json(
    p_json_id      in number,
    --
    p_built_with_love       out varchar2, -- p5_built_with_love
    p_learn_app_def         out varchar2, -- p5_learn_yn
    p_app_name              out varchar2, -- p1_app_name
    p_app_short_desc        out varchar2, -- p5_app_short_desc
    p_app_desc              out varchar2, -- p5_app_desc
    p_features              out varchar2, -- p1_features
    p_theme_style           out varchar2, -- p1_theme_style
    p_nav_position          out varchar2, -- p1_nav_position
    p_app_icon_class        out varchar2, -- p1_app_icon_class
    p_app_color_class       out varchar2, -- p1_app_color_class
    p_app_color_hex         out varchar2, -- p1_app_color_hex
    p_base_table_prefix     out varchar2, -- p5_base_table_prefix
    p_primary_language      out varchar2, -- p1_primary_language
    p_translated_langs      out varchar2, -- p1_translated_langs
    p_authentication        out varchar2, -- p1_authentication
    p_app_version           out varchar2, -- p5_app_version
    p_app_logging           out varchar2, -- p5_app_logging
    p_app_debugging         out varchar2, -- p5_app_debugging
    p_date_format           out varchar2, -- p5_date_format
    p_date_time_format      out varchar2, -- p5_date_time_format
    p_timestamp_format      out varchar2, -- p5_timestamp_format
    p_timestamp_tz_format   out varchar2, -- p5_timestamp_tz_format
    p_deep_linking          out varchar2, -- p5_deep_linking
    p_max_session_length    out varchar2, -- p5_max_session_length
    p_max_session_idle_time out varchar2 -- p5_max_session_idle_time
    );

end wwv_flow_define_app_v3;
/
show errors;
