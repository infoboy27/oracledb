set define '^' verify off
prompt ...wwv_flow_jet_chart
create or replace package wwv_flow_jet_chart
as
--------------------------------------------------------------------------------
--
--   Copyright (c) 1999, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_jet_chart.sql
--
--    DESCRIPTION
--      This package is responsible for handling JET chart rendering.
--
--    MODIFIED      (MM/DD/YYYY)
--    hfarrell       08/28/2015 - Created

--==============================================================================
-- Definition of chart data, axis, series and chart info record types
--==============================================================================

-- Gantt Task Record
type t_task_point is record (
    id                            varchar2(255),
    task                          varchar2(4000),
    parent_id                     varchar2(255),
    parent_task                   varchar2(255),
    labelPosition                 varchar2(11),
    taskStyle                     varchar2(255),
    task_css_class                varchar2(255),
    progress                      number,
    progress_css_class            varchar2(255),
    task_short_desc               varchar2(4000),
    start_date                    varchar2(255),
    end_date                      varchar2(255),
    baseline_start                varchar2(255),
    baseline_end                  varchar2(255),
    baseline_css_class            varchar2(255),
    custom_tooltip                varchar2(4000),
    label_font_family             wwv_flow_jet_chart_series.items_label_font_family%type,
    label_font_style              wwv_flow_jet_chart_series.items_label_font_style%type,
    label_font_size               wwv_flow_jet_chart_series.items_label_font_size%type,
    label_font_color              wwv_flow_jet_chart_series.items_label_font_color%type
);

type t_task_points is table of t_task_point index by pls_integer;

-- Gantt Row Record
type t_row_point is record (
    task_id                       varchar2(255),
    task                          varchar2(4000),
    parent_id                     varchar2(255),
    parent_task                   varchar2(255)
);

type t_row_points is table of t_row_point index by pls_integer;

-- Gantt Dependency Record
type t_dep_point is record (
    id                            varchar2(255),
    predecessor_task_id           varchar2(255),
    successor_task_id             varchar2(255),
    short_desc                    varchar2(4000),
    type                          varchar2(12)
);

type t_dep_points is table of t_dep_point index by pls_integer;

-- Data Record
type t_data_point is record (
    id                            number,
    series_name                   varchar2(255),
    value                         number,
    low                           number,
    high                          number,
    open                          number,
    close                         number,
    volume                        number,
    x                             number,  --number
    x_str                         varchar2(255),  -- string
    y                             number,
    z                             number,
    q1                            number,
    q2                            number,
    q3                            number,
    outliers                      varchar2(4000),
    target_value                  number,
    min_value                     number,
    max_value                     number,
    series_short_desc             varchar2(4000),
    group_col_data_type           varchar2(100),
    group_short_desc              varchar2(4000),
    label                         varchar2(255),
    label_time_zone               varchar2(255),
    label_time_zone_name          varchar2(255),
    item_short_desc               varchar2(4000),
    link_target                   varchar2(4000),
    custom                        varchar2(4000),
    color                         varchar2(128),
    stack_category                varchar2(100),
    gantt_start                   varchar2(255),
    gantt_end                     varchar2(255),
    viewport_start                varchar2(255),
    viewport_end                  varchar2(255)
);

type t_data_points is table of t_data_point index by pls_integer;

-- Axis Record
type t_axis is record (
    static_id                     wwv_flow_jet_chart_axes.static_id%type,
    axis                          wwv_flow_jet_chart_axes.axis%type,
    is_rendered                   wwv_flow_jet_chart_axes.is_rendered%type,
    title                         wwv_flow_jet_chart_axes.title%type,
    title_font_family             wwv_flow_jet_chart_axes.title_font_family%type,
    title_font_style              wwv_flow_jet_chart_axes.title_font_style%type,
    title_font_size               wwv_flow_jet_chart_axes.title_font_size%type,
    title_font_color              wwv_flow_jet_chart_axes.title_font_color%type,
    min                           wwv_flow_jet_chart_axes.min%type,
    max                           wwv_flow_jet_chart_axes.max%type,
    format_type                   wwv_flow_jet_chart_axes.format_type%type,
    decimal_places                wwv_flow_jet_chart_axes.decimal_places%type,
    currency                      wwv_flow_jet_chart_axes.currency%type,
    numeric_pattern               wwv_flow_jet_chart_axes.numeric_pattern%type,
    format_scaling                wwv_flow_jet_chart_axes.format_scaling%type,
    scaling                       wwv_flow_jet_chart_axes.scaling%type,
    baseline_scaling              wwv_flow_jet_chart_axes.baseline_scaling%type,
    step                          wwv_flow_jet_chart_axes.step%type,
    position                      wwv_flow_jet_chart_axes.position%type,
    major_tick_rendered           wwv_flow_jet_chart_axes.major_tick_rendered%type,
    min_step                      wwv_flow_jet_chart_axes.min_step%type,
    minor_tick_rendered           wwv_flow_jet_chart_axes.minor_tick_rendered%type,
    minor_step                    wwv_flow_jet_chart_axes.minor_step%type,
    tick_label_rendered           wwv_flow_jet_chart_axes.tick_label_rendered%type,
    tick_label_rotation           wwv_flow_jet_chart_axes.tick_label_rotation%type,
    tick_label_position           wwv_flow_jet_chart_axes.tick_label_position%type,
    tick_label_font_family        wwv_flow_jet_chart_axes.tick_label_font_family%type,
    tick_label_font_style         wwv_flow_jet_chart_axes.tick_label_font_style%type,
    tick_label_font_size          wwv_flow_jet_chart_axes.tick_label_font_size%type,
    tick_label_font_color         wwv_flow_jet_chart_axes.tick_label_font_color%type,
    split_dual_y                  wwv_flow_jet_chart_axes.split_dual_y%type,
    splitter_position             wwv_flow_jet_chart_axes.splitter_position%type,
    axis_scale                    wwv_flow_jet_chart_axes.axis_scale%type,
    zoom_order_seconds            boolean,
    zoom_order_minutes            boolean,
    zoom_order_hours              boolean,
    zoom_order_days               boolean,
    zoom_order_weeks              boolean,
    zoom_order_months             boolean,
    zoom_order_quarters           boolean,
    zoom_order_years              boolean);

type t_axes is table of t_axis index by pls_integer;

-- Series Record - to hold series attributes and associated data
type t_series is record (
    id                            wwv_flow_jet_chart_series.id%type,
    chart_id                      wwv_flow_jet_chart_series.chart_id%type,
    static_id                     wwv_flow_jet_chart_series.static_id%type,
    flow_id                       wwv_flow_jet_chart_series.flow_id%type,
    page_id                       wwv_flow_jet_chart_series.page_id%type,
    seq                           wwv_flow_jet_chart_series.seq%type,
    name                          wwv_flow_jet_chart_series.name%type,
    data_source_type              wwv_flow_jet_chart_series.data_source_type%type,
    data_source                   varchar2(32767),  -- For result caching, handle the CLOB column as VARCHAr2(32767)
    function_body_language        wwv_flow_code_exec.t_language,
    --
    series_data                   t_data_points,
    --
    rows_data                     t_row_points,
    tasks_data                    t_task_points,
    dependencies_data             t_dep_points,
    --
    max_row_count                 wwv_flow_jet_chart_series.max_row_count%type,
    ajax_items_to_submit          wwv_flow_jet_chart_series.ajax_items_to_submit%type,
    order_by_page_item            varchar2(255),
    series_type                   wwv_flow_jet_chart_series.series_type%type,
    chart_type                    wwv_flow_jet_charts.chart_type%type,
    series_name_column_name       wwv_flow_jet_chart_series.series_name_column_name%type,
    items_value_column_name       wwv_flow_jet_chart_series.items_value_column_name%type,
    items_label_column_name       wwv_flow_jet_chart_series.items_label_column_name%type,
    items_short_desc_column_name  wwv_flow_jet_chart_series.items_short_desc_column_name%type,
    items_low_column_name         wwv_flow_jet_chart_series.items_low_column_name%type,
    items_high_column_name        wwv_flow_jet_chart_series.items_high_column_name%type,
    items_open_column_name        wwv_flow_jet_chart_series.items_open_column_name%type,
    items_close_column_name       wwv_flow_jet_chart_series.items_close_column_name%type,
    items_volume_column_name      wwv_flow_jet_chart_series.items_volume_column_name%type,
    --
    aggregate_function            wwv_flow_jet_chart_series.aggregate_function%type,
    --
    items_x_column_name           wwv_flow_jet_chart_series.items_x_column_name%type,
    items_y_column_name           wwv_flow_jet_chart_series.items_y_column_name%type,
    items_z_column_name           wwv_flow_jet_chart_series.items_z_column_name%type,
    items_target_value            wwv_flow_jet_chart_series.items_target_value%type,
    items_min_value               wwv_flow_jet_chart_series.items_min_value%type,
    items_max_value               wwv_flow_jet_chart_series.items_max_value%type,
    group_name_column_name        wwv_flow_jet_chart_series.group_name_column_name%type,
    group_short_desc_column_name  wwv_flow_jet_chart_series.group_short_desc_column_name%type,
    custom_column_name            wwv_flow_jet_chart_series.custom_column_name%type,
    color                         wwv_flow_jet_chart_series.color%type,
    q2_color                      wwv_flow_jet_chart_series.q2_color%type,
    q3_color                      wwv_flow_jet_chart_series.q3_color%type,
    line_style                    wwv_flow_jet_chart_series.line_style%type,
    line_width                    wwv_flow_jet_chart_series.line_width%type,
    line_type                     wwv_flow_jet_chart_series.line_type%type,
    marker_rendered               wwv_flow_jet_chart_series.marker_rendered%type,
    marker_shape                  wwv_flow_jet_chart_series.marker_shape%type,
    assigned_to_y2                wwv_flow_jet_chart_series.assigned_to_y2%type,
    stack_category                wwv_flow_jet_chart_series.stack_category%type,
    --
    items_label_rendered          boolean,
    items_label_position          wwv_flow_jet_chart_series.items_label_position%type,
    items_label_display_as        wwv_flow_jet_chart_series.items_label_display_as%type,
    items_label_css_classes       wwv_flow_jet_chart_series.items_label_css_classes%type,
    items_label_font_family       wwv_flow_jet_chart_series.items_label_font_family%type,
    items_label_font_style        wwv_flow_jet_chart_series.items_label_font_style%type,
    items_label_font_size         wwv_flow_jet_chart_series.items_label_font_size%type,
    items_label_font_color        wwv_flow_jet_chart_series.items_label_font_color%type,
    --
    link_target                   wwv_flow_jet_chart_series.link_target%type,
    link_target_type              wwv_flow_jet_chart_series.link_target_type%type,
    --
    gantt_start_date_source       wwv_flow_jet_chart_series.gantt_start_date_source%type,
    gantt_start_date_column       wwv_flow_jet_chart_series.gantt_start_date_column%type,
    gantt_start_date_item         wwv_flow_jet_chart_series.gantt_start_date_item%type,
    gantt_end_date_source         wwv_flow_jet_chart_series.gantt_end_date_source%type,
    gantt_end_date_column         wwv_flow_jet_chart_series.gantt_end_date_column%type,
    gantt_end_date_item           wwv_flow_jet_chart_series.gantt_end_date_item%type,
    gantt_row_id                  wwv_flow_jet_chart_series.gantt_row_id%type,
    gantt_row_name                wwv_flow_jet_chart_series.gantt_row_name%type,
    gantt_task_id                 wwv_flow_jet_chart_series.gantt_task_id%type,
    gantt_task_name               wwv_flow_jet_chart_series.gantt_task_name%type,
    gantt_task_start_date         wwv_flow_jet_chart_series.gantt_task_start_date%type,
    gantt_task_end_date           wwv_flow_jet_chart_series.gantt_task_end_date%type,
    gantt_task_css_style          wwv_flow_jet_chart_series.gantt_task_css_style%type,
    gantt_task_css_class          wwv_flow_jet_chart_series.gantt_task_css_class%type,
    gantt_predecessor_task_id     wwv_flow_jet_chart_series.gantt_predecessor_task_id%type,
    gantt_successor_task_id       wwv_flow_jet_chart_series.gantt_successor_task_id%type,
    gantt_baseline_start_column   wwv_flow_jet_chart_series.gantt_baseline_start_column%type,
    gantt_baseline_end_column     wwv_flow_jet_chart_series.gantt_baseline_end_column%type,
    gantt_baseline_css_class      wwv_flow_jet_chart_series.gantt_baseline_css_class%type,
    gantt_progress_column         wwv_flow_jet_chart_series.gantt_progress_column%type,
    gantt_progress_css_class      wwv_flow_jet_chart_series.gantt_progress_css_class%type,
    gantt_viewport_start_source   wwv_flow_jet_chart_series.gantt_viewport_start_source%type,
    gantt_viewport_start_column   wwv_flow_jet_chart_series.gantt_viewport_start_column%type,
    gantt_viewport_start_item     wwv_flow_jet_chart_series.gantt_viewport_start_item%type,
    gantt_viewport_end_source     wwv_flow_jet_chart_series.gantt_viewport_end_source%type,
    gantt_viewport_end_column     wwv_flow_jet_chart_series.gantt_viewport_end_column%type,
    gantt_viewport_end_item       wwv_flow_jet_chart_series.gantt_viewport_end_item%type,
    task_label_position           wwv_flow_jet_chart_series.task_label_position%type,
    --
    use_region_source             boolean,
    location                      wwv_flow_jet_chart_series.location%type,
    query_type                    wwv_flow_exec_api.t_query_type,
    remote_server_id              wwv_flow_jet_chart_series.remote_server_id%type,
    web_src_module_id             wwv_flow_jet_chart_series.web_src_module_id%type,
    array_column_id               wwv_flow_jet_chart_series.array_column_id%type,
    document_source_id            wwv_flow_jet_chart_series.document_source_id%type,
    use_local_sync_table          boolean,
    query_owner                   wwv_flow_jet_chart_series.query_owner%type,
    query_table                   wwv_flow_jet_chart_series.query_table%type,
    query_where                   wwv_flow_jet_chart_series.query_where%type,
    query_match                   wwv_flow_jet_chart_series.query_match%type,
    query_columns                 wwv_flow_jet_chart_series.query_columns%type,
    query_order_by                wwv_flow_jet_chart_series.query_order_by%type,
    source_post_processing        wwv_flow_jet_chart_series.source_post_processing%type,
    include_rowid_column          boolean,
    optimizer_hint                wwv_flow_jet_chart_series.optimizer_hint%type,
    remote_sql_caching            wwv_flow_jet_chart_series.remote_sql_caching%type,
    remote_sql_invalidate_when    wwv_flow_jet_chart_series.remote_sql_invalidate_when%type,
    cache_component_type          pls_integer,
    cache_component_id            number,
    external_filter_expr          wwv_flow_jet_chart_series.external_filter_expr%type,
    external_order_by_expr        wwv_flow_jet_chart_series.external_order_by_expr%type,
    web_src_parameters            wwv_flow_exec_api.t_parameters,
    gauge_plot_area_color         wwv_flow_jet_chart_series.gauge_plot_area_color%type,
    threshold_values              wwv_flow_jet_chart_series.threshold_values%type,
    threshold_colors              wwv_flow_jet_chart_series.threshold_colors%type,
    threshold_display             wwv_flow_jet_chart_series.threshold_display%type,
    reference_line_values         wwv_flow_jet_chart_series.reference_line_values%type,
    reference_line_colors         wwv_flow_jet_chart_series.reference_line_colors%type
);

type t_chart_series_tbl is table of t_series index by pls_integer;

-- Chart Record - to hold chart attributes, axes and series information
type t_chart_info is record (
    id                            wwv_flow_jet_charts.id%type,
    flow_id                       wwv_flow_jet_charts.flow_id%type,
    page_id                       wwv_flow_jet_charts.page_id%type,
    region_id                     wwv_flow_jet_charts.region_id%type,
    chart_type                    wwv_flow_jet_charts.chart_type%type,
    --
    series                        t_chart_series_tbl,
    axes                          t_axes,
    --
    region_source                 varchar2(32767),
    region_items_to_submit        varchar2(32767),
    --
    title                         wwv_flow_jet_charts.title%type,
    width                         wwv_flow_jet_charts.width%type,
    height                        wwv_flow_jet_charts.height%type,
    animation_on_display          wwv_flow_jet_charts.animation_on_display%type,
    animation_on_data_change      wwv_flow_jet_charts.animation_on_data_change%type,
    orientation                   wwv_flow_jet_charts.orientation%type,
    data_cursor                   wwv_flow_jet_charts.data_cursor%type,
    data_cursor_behavior          wwv_flow_jet_charts.data_cursor_behavior%type,
    hide_and_show_behavior        wwv_flow_jet_charts.hide_and_show_behavior%type,
    hover_behavior                wwv_flow_jet_charts.hover_behavior%type,
    stack                         wwv_flow_jet_charts.stack%type,
    stack_label                   wwv_flow_jet_charts.stack_label%type,
    stack_font_family             wwv_flow_jet_charts.stack_font_family%type,
    stack_font_style              wwv_flow_jet_charts.stack_font_family%type,
    stack_font_size               wwv_flow_jet_charts.stack_font_size%type,
    stack_font_color              wwv_flow_jet_charts.stack_font_color%type,
    spark_chart                   boolean,
    connect_nulls                 boolean,
    stock_render_as               wwv_flow_jet_charts.stock_render_as%type,
    pie_selection_effect          wwv_flow_jet_charts.pie_selection_effect%type,
    value_min                     wwv_flow_jet_charts.value_min%type,
    value_text_type               wwv_flow_jet_charts.value_text_type%type,
    value_position                wwv_flow_jet_charts.value_position%type,
    value_format_type             wwv_flow_jet_charts.value_format_type%type,
    value_decimal_places          wwv_flow_jet_charts.value_decimal_places%type,
    value_currency                wwv_flow_jet_charts.value_currency%type,
    value_numeric_pattern         wwv_flow_jet_charts.value_numeric_pattern%type,
    value_format_scaling          wwv_flow_jet_charts.value_format_scaling%type,
    sorting                       wwv_flow_jet_charts.sorting%type,
    fill_multi_series_gaps        boolean,
    zoom_and_scroll               wwv_flow_jet_charts.zoom_and_scroll%type,
    zoom_direction                wwv_flow_jet_charts.zoom_direction%type,
    initial_zooming               wwv_flow_jet_charts.initial_zooming%type,
    tooltip_rendered              wwv_flow_jet_charts.tooltip_rendered%type,
    show_series_name              boolean,
    show_group_name               boolean,
    show_value                    boolean,
    show_label                    boolean,
    show_row                      boolean,
    show_start                    boolean,
    show_end                      boolean,
    show_progress                 boolean,
    show_baseline                 boolean,
    custom_tooltip                wwv_flow_jet_charts.custom_tooltip%type,
    legend_rendered               wwv_flow_jet_charts.legend_rendered%type,
    legend_title                  wwv_flow_jet_charts.legend_title%type,
    legend_position               wwv_flow_jet_charts.legend_position%type,
    legend_font_family            wwv_flow_jet_charts.legend_font_family%type,
    legend_font_style             wwv_flow_jet_charts.legend_font_family%type,
    legend_font_size              wwv_flow_jet_charts.legend_font_size%type,
    legend_font_color             wwv_flow_jet_charts.legend_font_color%type,
    overview_rendered             wwv_flow_jet_charts.overview_rendered%type,
    overview_height               wwv_flow_jet_charts.overview_height%type,
    pie_other_threshold           wwv_flow_jet_charts.pie_other_threshold%type,
    time_axis_type                wwv_flow_jet_charts.time_axis_type%type,
    no_data_found_message         wwv_flow_jet_charts.no_data_found_message%type,
    javascript_code               wwv_flow_jet_charts.javascript_code%type,
    automatic_refresh_interval    wwv_flow_jet_charts.automatic_refresh_interval%type,
    has_link                      boolean,
    --
    horizontal_grid               wwv_flow_jet_charts.horizontal_grid%type,
    vertical_grid                 wwv_flow_jet_charts.vertical_grid%type,
    row_axis_rendered             wwv_flow_jet_charts.row_axis_rendered%type,
    gantt_axis_position           wwv_flow_jet_charts.gantt_axis_position%type,
    --
    gauge_orientation             wwv_flow_jet_charts.gauge_orientation%type,
    gauge_indicator_size          wwv_flow_jet_charts.gauge_indicator_size%type,
    gauge_inner_radius            wwv_flow_jet_charts.gauge_inner_radius%type,
    gauge_plot_area               wwv_flow_jet_charts.gauge_plot_area%type,
    gauge_start_angle             wwv_flow_jet_charts.gauge_start_angle%type,
    gauge_angle_extent            wwv_flow_jet_charts.gauge_angle_extent%type,
    show_gauge_value              boolean
);

--==============================================================================
-- Returns a chart record, with data, for the given region ID
-- NOTE: The data is added in t_chart_info.series(x).series_data
--==============================================================================
function get_chart_data (
    p_chart_info         in t_chart_info,
    p_region             in wwv_flow_plugin_api.t_region)
    return t_chart_info;

/*procedure get_chart_json (
    p_page_id            in number,
    p_region_id          in number ); */
    --return clob;

--==============================================================================
-- Returns a varchar2 containing the chart attributes and data as a JSON object
-- for the given chart record
--==============================================================================
procedure emit_json (
    p_chart_info         in t_chart_info);

--==============================================================================
-- Renders the JET Chart based on the chart record type
--==============================================================================
procedure render_jet_chart (
    p_region             in wwv_flow_plugin_api.t_region );

--==============================================================================
-- Returns the JET Chart data.
--==============================================================================
procedure ajax_jet_chart (
    p_region             in wwv_flow_plugin_api.t_region );

end wwv_flow_jet_chart;
/
show errors
