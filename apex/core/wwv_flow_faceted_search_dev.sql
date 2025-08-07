set define '^' verify off
prompt ...wwv_flow_faceted_search_dev.sql
create or replace package wwv_flow_faceted_search_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2019, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_faceted_search_dev.sql
--
--    DESCRIPTION
--      Builder-specific procedures for faceted search regions
--
--    MODIFIED   (MM/DD/YYYY)
--    cbcho       05/28/2019 - created (feature #2416)
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
subtype t_filter_region_type is pls_integer range 1..2;
subtype t_filter_disp_type   is pls_integer range 1..2;
subtype t_result_region_type is pls_integer range 1..4;

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_filter_region_faceted_search  constant t_filter_region_type := 1;
c_filter_region_smart_filters   constant t_filter_region_type := 2;

c_filter_display_inline         constant t_filter_disp_type   := 1;
c_filter_display_filter_dialog  constant t_filter_disp_type   := 2;

c_result_region_classic         constant t_result_region_type := 1;
c_result_region_card            constant t_result_region_type := 2;
c_result_region_map             constant t_result_region_type := 3;
c_result_region_content_row     constant t_result_region_type := 4;

c_report_max_row_count          constant pls_integer  := 100000;
c_no_of_buckets                 constant pls_integer  := 5;           -- Number of buckets for range item types

c_floor                         constant varchar2(5)  := 'floor';     -- floor type of rounding
c_ceil                          constant varchar2(4)  := 'ceil';      -- ceil type of rounding

c_min_show_more_cnt             constant number       := 7;

--======================================================================================================================
-- returns date columns types, to ignore for 19.2
--======================================================================================================================
function get_date_col_types return wwv_flow_t_varchar2;
--======================================================================================================================
-- gets all the facet column names
--======================================================================================================================
function get_facet_column_names(
    p_table_owner    in varchar2 default null,
    p_table_name     in varchar2 default null ) return wwv_flow_t_varchar2;
--======================================================================================================================
-- gets the top 5 scored columns
--======================================================================================================================
function get_top5_facet_columns(
    p_table_owner    in varchar2,
    p_table_name     in varchar2 ) return wwv_flow_t_varchar2;
--======================================================================================================================
-- checks if the report source has searchable columns or columns to create facets
-- if neither exist, cannot create faceted search
--======================================================================================================================
function valid_faceted_search_source(
    p_parse_as_schema        in varchar2,
    p_location               in wwv_flow_exec_api.t_location    default wwv_flow_exec_api.c_location_local_db,
    p_query_type             in wwv_flow_exec_api.t_query_type,
    p_table_owner            in varchar2                        default null,
    p_table_name             in varchar2                        default null,
    p_table_where            in varchar2                        default null,
    p_table_order_by         in varchar2                        default null,
    p_sql_plsql_source       in varchar2                        default null,
    p_function_body_language in wwv_flow_code_exec.t_language   default null,
    --
    p_remote_server_id       in number                          default null,
    p_web_source_module_id   in number                          default null,
    p_document_source_id     in number                          default null,
    p_array_column_id        in number                          default null,
    --
    p_facet_columns          in wwv_flow_t_varchar2             default null,
    p_searchable_columns     in varchar2                        default null,
    p_report_columns         in wwv_flow_t_varchar2             default null,
    --
    p_describe_result        in wwv_flow_exec_dev.t_describe_result default wwv_flow_exec_dev.c_empty_describe_result ) return boolean;

--======================================================================================================================
-- creates search text facet
-- =====================================================================================================================
procedure create_search_text (
    p_flow_id            in number,
    p_page_id            in number,
    p_region_id          in number,
    p_filter_region_type in t_filter_region_type,
    p_name               in varchar2,
    p_sequence           in number,
    p_label              in varchar2,
    p_source             in varchar2 default null );

--======================================================================================================================
-- creates checkbox facet
-- =====================================================================================================================
procedure create_checkbox (
    p_flow_id            in number,
    p_page_id            in number,
    p_region_id          in number,
    p_filter_region_type in t_filter_region_type,
    p_name               in varchar2,
    p_sequence           in number,
    p_label              in varchar2,
    p_data_type          in varchar2,
    p_source             in varchar2,
    p_escape             in boolean            default true,
    p_lov_id             in number,
    p_show_more_count    in number             default c_min_show_more_cnt,
    p_display_as         in t_filter_disp_type default c_filter_display_inline );

--======================================================================================================================
-- creates input field facet
-- =====================================================================================================================
procedure create_input_field (
    p_flow_id                  in number,
    p_page_id                  in number,
    p_region_id                in number,
    p_filter_region_type       in t_filter_region_type,
    p_name                     in varchar2,
    p_sequence                 in number,
    p_label                    in varchar2,
    p_data_type                in varchar2,
    p_source                   in varchar2,
    p_display_as               in t_filter_disp_type default c_filter_display_inline,
    p_user_can_choose_operator in boolean            default false );

--======================================================================================================================
-- creates a faceted search region on an new page
-- =====================================================================================================================
procedure create_faceted_search_region (
    p_filter_region_type        in t_filter_region_type default c_filter_region_faceted_search,
    p_id                        in number               default null,
    p_flow_id                   in number,
    p_page_id                   in number               default wwv_flow_imp_page.current_page_id,
    p_name                      in varchar2             default null,
    p_parent_region_id          in number               default null,
    p_template_id               in number,
    p_template_options          in varchar2,
    p_display_point             in varchar2,
    p_display_sequence          in number,
    p_grid_column_span          in number               default null,
    p_filtered_region_id        in number );

--======================================================================================================================
-- creates a report page with faceted search controls
--======================================================================================================================
procedure create_faceted_search_page(
    p_flow_id                    in number,
    p_filter_region_type         in t_filter_region_type,
    p_result_region_type         in t_result_region_type                        default c_result_region_classic,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_page_mode                  in varchar2,
    --
    p_form_page_id               in number                                      default null,
    p_form_page_mode             in varchar2                                    default null,
    p_include_new_button         in boolean                                     default false,
    --
    p_use_ui_default             in boolean                                     default false,
    --
    p_tab_set                    in varchar2                                    default null,
    p_tab_name                   in varchar2                                    default null,
    p_tab_text                   in varchar2                                    default null,
    --
    p_nav_list_id                in number                                      default null,
    p_nav_list_item_id           in number                                      default null,
    p_nav_list_item_name         in varchar2                                    default null,
    p_nav_list_parent_item_id    in number                                      default null,
    p_nav_list_child_item_name   in varchar2                                    default null,
    p_nav_list_item_icon         in varchar2                                    default null,
    --
    p_breadcrumb_id              in number                                      default null,
    p_breadcrumb_entry_name      in varchar2                                    default null,
    p_parent_breadcrumb_entry_id in number                                      default null,
    --
    p_location                   in wwv_flow_exec_api.t_location                default wwv_flow_exec_api.c_location_local_db,
    p_query_type                 in wwv_flow_exec_api.t_query_type,
    p_table_owner                in varchar2                                    default null,
    p_table_name                 in varchar2                                    default null,
    p_table_where                in varchar2                                    default null,
    p_table_order_by             in varchar2                                    default null,
    p_sql_plsql_source           in varchar2                                    default null,
    p_function_body_language     in wwv_flow_code_exec.t_language               default null,
    --
    p_remote_server_id           in number                                      default null,
    p_web_source_module_id       in number                                      default null,
    p_document_source_id         in number                                      default null,
    p_array_column_id            in number                                      default null,
    --
    p_order_by_facet_score       in boolean                                     default true,
    p_facet_columns              in wwv_flow_t_varchar2                         default null,
    p_primary_key_columns        in wwv_flow_t_varchar2                         default null,
    --
    p_report_columns             in wwv_flow_t_varchar2                         default null,
    --
    p_card_layout_type           in varchar2                                    default null,
    p_card_title_column_name     in varchar2                                    default null,
    p_card_body_column_name      in varchar2                                    default null,
    p_card_icon_column_name      in varchar2                                    default null,
    p_card_badge_column_name     in varchar2                                    default null,
    --
    p_layer_name                in varchar2                                    default null,
    p_layer_type                 in wwv_flow_map_region.t_map_layer_type        default null,
    p_has_spatial_index          in boolean                                     default false,
    p_geometry_column_type       in wwv_flow_map_region.t_feature_data_type     default null,
    p_pk_column                  in varchar2                                    default null,
    p_geometry_column            in varchar2                                    default null,
    p_longitude_column           in varchar2                                    default null,
    p_latitude_column            in varchar2                                    default null,
    p_value_column               in varchar2                                    default null,
    p_extrude_value_column       in varchar2                                    default null,
    p_tooltip_column             in varchar2                                    default null,
    --
    p_content_row_attributes     in clob                                        default null,
    --
    p_help_text                  in varchar2                                    default null,
    --
    p_do_validation              in boolean                                     default false ) ;

--======================================================================================================================
-- Returns default buckets for a numeric column based on min max values
--======================================================================================================================
function get_buckets (
    p_min_value     in number,
    p_max_value     in number,
    p_no_of_buckets in number default c_no_of_buckets,
    p_format_mask   in varchar2 default '999G999G999G999G999G999G999G999G999G990' ) return wwv_flow_exec_api.t_filter_buckets;

--======================================================================================================================
-- Returns buckets as static LOV definition (Display1;Min1|Max1,Display2;Min2|Max2)
--======================================================================================================================
function to_static_lov (
    p_buckets   in wwv_flow_exec_api.t_filter_buckets ) return varchar2;

--======================================================================================================================
-- Returns the numeric value of the bucket where a number falls into
--======================================================================================================================
function get_bucket_size_of_number(
    p_number    in number,
    p_direction in varchar2 ) return number;

end wwv_flow_faceted_search_dev;
/
show err

set define '^'
