set define '^' verify off
prompt ...wwv_flow_ir
create or replace package wwv_flow_ir as
------------------------------------------------------------------------------------------------------------------------
--
--   Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
--     NAME
--       wwv_flow_ir.sql
--
--     DESCRIPTION
--      Package for basic interactive report operations.
--
--     SECURITY
--       No grants, must be run as FLOW schema owner.
--
--     MODIFIED (MM/DD/YYYY)
--      cczarski 08/11/2017 - Created
--
------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_column is record (
    id                     number,
    column_expression      varchar2(4000),
    db_column_name         varchar2(255),
    column_alias           varchar2(255),
    column_identifier      varchar2(10),
    report_label           varchar2(4000),
    column_label           varchar2(4000),
    alternative_label      varchar2(4000),
    column_type            varchar2(255),
    format_mask            varchar2(255),
    image_description      varchar2(255),
    display_as             varchar2(255),
    display_text_as        varchar2(255),
    display_order          number,
    is_primary_key         varchar2(1),
    heading_alignment      varchar2(255),
    column_alignment       varchar2(255),
    max_length             number,
    --
    filter_date_ranges     varchar2(255),
    col_index_in_query     number,
    html_expression        varchar2(4000),
    link                   varchar2(4000),
    linktext               varchar2(4000),
    link_attr              varchar2(4000),
    --
    rpt_distinct_lov       varchar2(1),
    rpt_show_filter_lov    varchar2(1),
    rpt_lov                varchar2(4000),
    rpt_named_lov          varchar2(32767),
    --
    rich_text_format       varchar2(8),
    --
    fact_table_key         varchar2(4000),
    dimension_table        varchar2(4000),
    dimension_table_id     varchar2(4000),
    dimension_table_value  varchar2(4000),
    --
    display_condition_type varchar2(255),
    display_condition      varchar2(4000),
    display_condition2     varchar2(4000),
    security_scheme        varchar2(255),
    required_patch         number,
    user_may_view          varchar2(1),
    user_may_edit          varchar2(1),
    show_column            varchar2(1),
    tz_dependent           varchar2(1),
    is_computed            varchar2(1),
    --
    allow_hide             varchar2(1),
    allow_sorting          varchar2(1),
    allow_filtering        varchar2(1),
    allow_ctrl_breaks      varchar2(1),
    allow_computations     varchar2(1),
    help_text              varchar2(32767),
    --
    static_id              varchar2(255),
    --
    use_as_row_header      varchar2(1),
    --
    template_static_id     varchar2(32767),
    template_placeholders  wwv_flow_t_varchar2,
    --
    -- only used by template components
    attributes             wwv_flow_worksheet_columns.attributes%type
    );

type t_columns         is table of t_column index by binary_integer;
type t_columns_by_name is table of t_column index by varchar2(255);

type t_full_columns         is table of wwv_flow_worksheet_columns%rowtype index by binary_integer;
type t_full_columns_by_name is table of wwv_flow_worksheet_columns%rowtype index by varchar2(255);

type t_group_by_function is record (
    function_name   varchar2(255),
    column_name     varchar2(255),
    db_column_name  varchar2(30),
    column_label    varchar2(4000),
    format_mask     varchar2(255),
    display_sum     boolean default false);

type t_group_by_function_list is table of t_group_by_function index by binary_integer;

type t_sort is record (
    sort_column              varchar2(255),
    sort_direction           varchar2(255) );

type t_sorts is table of t_sort index by binary_integer;

type t_pivot_function_list is table of wwv_flow_worksheet_pivot_agg%rowtype index by binary_integer;
type t_pivot_sort_list     is table of wwv_flow_worksheet_pivot_sort%rowtype index by binary_integer;


type t_distinct_pivot_val is record (
    c01           varchar2(4000),
    c01_formatted varchar2(4000),
    c02           varchar2(4000),
    c02_formatted varchar2(4000),
    c03           varchar2(4000),
    c03_formatted varchar2(4000) );
type t_distinct_pivot_val_list is table of t_distinct_pivot_val index by pls_integer;
type t_pivoted_col_aggregates  is table of wwv_flow_worksheet_pivot_agg%rowtype index by varchar2(255);

type t_ir_preferences is record (
    worksheet_id      number,
    stored_value      varchar2(32767),
    parent_report_id  number,
    show_nulls        varchar2(30),
    show_rpt_cols     varchar2(30),
    hide_rpt_settings varchar2(30),
    rpt_view_mode     varchar2(255) );

type col_val_arr_t  is table of varchar2(32767) index by varchar2(32767);
type t_column_name_list is table of varchar2(255) index by binary_integer;

type t_template_component_column is record (
    template_component      wwv_flow_plugin.t_template_component,
    used_column_names       wwv_flow_global.vc_map );

type t_template_component_columns is table of t_template_component_column index by varchar2(255);

type t_interactive_report is record(
    region_id                   number,
    region_static_id            varchar2(255),
    ir_region_title             varchar2(32767),
    --
    source_capabilities         wwv_flow_exec_api.t_source_capabilities,
    --
    preferences                 t_ir_preferences,
    --
    location                    wwv_flow_exec_api.t_location default wwv_flow_exec_api.c_location_local_db,
    binds                       wwv_flow_exec_api.t_parameters,
    parse_override_item         wwv_flow_page_plugs.plug_query_parse_override%type,
    --
    base_rpt_app_user           varchar2(255),
    --
    num_highlight_cols          number                       default 0,
    num_invisible_cols          number                       default 0,
    num_link_cols               number                       default 0,
    num_break_cols              number                       default 0,
    num_visible_cols            number                       default 0,
    num_hidden_cols             number                       default 0,
    num_aggregate_cols          number                       default 0,
    detail_link_check           boolean                      default false,
    break_col_list              varchar2(32767),
    --
    no_data_found               boolean                      default false,
    show_pagination             boolean                      default true,
    pagination_out_of_range     boolean                      default false,
    total_row_count             number,
    exceeded_max_row_cnt        boolean,
    --
    group_by_view               boolean                      default false,
    pivot_view                  boolean                      default false,
    chart_view                  boolean                      default false,
    --
    aggregate_cols              wwv_flow_global.vc_arr2,
    aggregate_types             wwv_flow_global.vc_arr2,
    aggregate_formats           wwv_flow_global.vc_arr2,
    show_aggregate_types        boolean,
    --
    headers                     wwv_flow_global.vc_arr2,
    header_align                wwv_flow_global.vc_arr2,
    column_align                wwv_flow_global.vc_arr2,
    lead_order_by_col           wwv_flow_global.t_dbms_id,
    lead_order_by_dir           varchar2(255),
    --
    worksheet                   wwv_flow_worksheets%rowtype,
    report                      wwv_flow_worksheet_rpts%rowtype,
    group_by                    wwv_flow_worksheet_group_by%rowtype,
--
    ir_columns                  t_columns,
    ir_columns_by_name          t_columns_by_name,
    ir_full_columns             t_full_columns,
    ir_full_columns_by_name     t_full_columns_by_name,
    --
    --
    detail_view_columns         wwv_flow_global.vc_arr2,
    detail_view_labels          wwv_flow_global.vc_arr2,
    icon_view_columns           wwv_flow_global.vc_arr2,
    icon_view_labels            wwv_flow_global.vc_arr2,
    --
    pivot                       wwv_flow_worksheet_pivot%rowtype,
    pivot_function_list         t_pivot_function_list,
    pivot_sort_list             t_pivot_sort_list,
    --
    row_header_list             wwv_flow_global.vc_arr2,
    --
    pk_columns                  wwv_flow_t_varchar2 default wwv_flow_t_varchar2(),
    --
    template_component_columns  t_template_component_columns,
    print_layout_id             wwv_flow_page_plugs.prn_template_id%type );

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_export_file_prefix        varchar2( 9 ) := 'FILE_ID=';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
g_delete_in_progress          boolean     := false;

--
--==============================================================================
--
-- generic UTILITY functions
--
--==============================================================================

--
--==============================================================================
function get_ir_security_group_id return number;

--
--==============================================================================
function esc_ir_col_header (
   p_string in varchar2)
   return varchar2;

--
--==============================================================================
function replace_col_header_tags (
   p_string in varchar2)
   return varchar2;

--
--==============================================================================
function do_app_substitutions (
    p_string                       in varchar2 default null)
    return varchar2;

--
--==============================================================================
function get_sql_functions return wwv_flow_t_varchar2;

--
--==============================================================================
function get_sql_from_expr (
    p_ir_columns      in t_columns,
    p_expr            in varchar2) return varchar2;

--
--==============================================================================
function get_sql_from_expr (
    p_ir_full_columns in t_full_columns,
    p_expr            in varchar2 ) return varchar2;

--
--==============================================================================
function is_valid_format_mask (
    p_format_mask in varchar2,
    p_string_type in varchar2 default 'BOTH',
    p_allow_since in varchar2 default 'Y')
return boolean;

--
--==============================================================================
function tokenize (
    p_expression           in varchar2 )
return wwv_flow_global.vc_arr2;

--
--==============================================================================
function in_list     ( p_in_expr in varchar2) return wwv_flow_global.vc_arr2;
function in_list2    ( p_in_expr in varchar2 ) return wwv_flow_t_varchar2;
function in_list_num ( p_in_expr in varchar2 ) return wwv_flow_t_number;


--
--==============================================================================
--
-- interactive report utility functions
--
--==============================================================================

--
--==============================================================================
function get_parse_as_schema_override(
    p_ir_attributes in t_interactive_report ) return varchar2;

--
--==============================================================================
procedure get_ir_info_from_request (
    p_request          in varchar2,
    --
    p_region_static_id out varchar2,
    p_report_alias     out varchar2);

--
--==============================================================================
function get_group_name (
    p_ir_attributes  in t_interactive_report,
    p_group_id       in number
    ) return varchar2;

--
--==============================================================================
function get_column_label (
    p_ir_attributes          in t_interactive_report,
    p_db_column_name         in varchar2,
    p_computed_column_prefix in varchar2 default null) return varchar2;

--
--==============================================================================
procedure get_column_list (
    p_ir_attributes     in t_interactive_report,
    --
    p_type              in varchar2 default null,
    p_column_label      out wwv_flow_global.vc_arr2,
    p_db_column_name    out wwv_flow_global.vc_arr2,
    p_is_displayed      out wwv_flow_global.vc_arr2,
    p_group_id          out wwv_flow_global.vc_arr2,
    p_column_type       out wwv_flow_global.vc_arr2,
    p_column_category   out wwv_flow_global.vc_arr2,
    p_rows              out number );

--
--==============================================================================
function get_filter_operator ( p_operator_abbr  in varchar2) return varchar2;

--
--==============================================================================
function get_group_by_function_label (
    p_ir_attributes    in t_interactive_report,
    p_function         in varchar2,
    p_function_column  in varchar2,
    p_label            in varchar2 default null
    ) return varchar2;

--==============================================================================
-- Create copies of all session reports for p_old_session_id in the new session.
--==============================================================================
procedure clone_session_reports (
    p_old_session_id   in number,
    p_new_session_id   in number );

--==============================================================================
function get_report_id(
    p_worksheet_id               in number,
    p_app_user                   in varchar2,
    p_report_id                  in number,
    --
    p_new_default_rpt_type       in varchar2 default 'PRIMARY',
    p_new_default_rpt_name       in varchar2 default null,
    p_create_report_if_necessary in varchar2 default 'Y')
return number;
--
--==============================================================================
function get_report_id_using_alias (
    p_worksheet_id     in number,
    p_report_alias     in varchar2,
    p_region_static_id in varchar2 default null)
    return number;

--
--==============================================================================
function validate_comp_expression (
    p_token_list           in  wwv_flow_global.vc_arr2,
    p_valid_token_list     in  wwv_flow_global.vc_arr2,
    p_allow_literals       in  varchar2 default 'Y',
    p_invalid_token_return out varchar2)
return boolean;

--
--==============================================================================
--
-- interactive report actions: Generic
--
--==============================================================================

--==============================================================================
procedure set_report_type (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_report_type  in varchar2);

--==============================================================================
procedure reset_pagination (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

--==============================================================================
-- This procedure is called from plug.plb to reset IR pagination for the current page.
-- If p_request is null, all session reports pagination will be reset.
--==============================================================================
procedure reset_pagination (
     p_region_ids  in wwv_flow_t_number,
     p_request     in varchar2 default null );

--==============================================================================
procedure reset_report_settings (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number);

--==============================================================================
procedure clear_report_settings (
    p_worksheet_id    in number,
    p_app_user        in varchar2,
    p_report_id       in number);

--==============================================================================
function save_derived_report (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_base_report_id    in number,
    p_report_name       in varchar2 default null,
    p_report_descr      in varchar2 default null,
    p_public            in varchar2 default null,
    p_is_default        in varchar2 default null,
    p_default_rpt_type  in varchar2 default 'PRIMARY') return number;

--==============================================================================
procedure rename_report (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number,
    p_report_name       in varchar2 default null,
    p_report_descr      in varchar2 default null,
    p_public            in varchar2 default null,
    p_is_default        in varchar2 default null,
    p_default_rpt_type  in varchar2 default 'PRIMARY');

--==============================================================================
procedure delete_report (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number,
    p_is_default        in varchar2 default null);


--
--==============================================================================
--
-- interactive report actions: columns
--
--==============================================================================
procedure hide_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

--==============================================================================
procedure show_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

--==============================================================================
procedure show_column_in_default_report (
    p_worksheet_id        in number,
    p_column              in varchar2 );

--
--==============================================================================
--
-- interactive report actions: highlights
--
--==============================================================================
procedure add_or_update_highlight (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_condition_id        in number   default null,
    p_name                in varchar2 default null,
    -- highlight condition
    p_column              in varchar2,
    p_operator            in varchar2,
    p_expr_type           in varchar2 default null,
    p_expr                in varchar2 default null,
    p_expr2               in varchar2 default null,
    -- highlight settings
    p_highlight_sequence  in varchar2 default null,
    p_highlight_enabled   in varchar2 default 'Y',
    p_highlight_type      in varchar2 default 'ROW',
    -- highlight formatting
    p_bg_color            in varchar2 default null,
    p_font_color          in varchar2 default null,
    p_format              in varchar2 default null,
    p_validation_error    out varchar2);

--==============================================================================
procedure clear_highlight (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_condition_id in number);

--==============================================================================
procedure toggle_highlighting (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number,
    --
    p_condition_id      in number,
    p_highlight_enabled in varchar2);

--
--==============================================================================
--
-- interactive report actions: filters
--
--==============================================================================
procedure add_or_update_filter (
    p_region_id           in number,
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    -- filtering
    p_condition_id        in number   default null,
    p_filter_name         in varchar2 default null,
    p_filter_column       in varchar2 default null,
    p_filter_operator     in varchar2 default '=',
    p_filter_expr_type    in varchar2 default null,
    p_filter_expr         in varchar2 default null,
    p_filter_expr2        in varchar2 default null,
    --
    p_clear_existing_col_filters in varchar2 default 'Y',
    p_filter_type         in varchar2 default 'NORMAL',
    --
    p_validation_error    out varchar2);

--==============================================================================
procedure add_filter_using_item (
    p_page_id          in number,
    p_request          in varchar2 default null,
    --
    p_item_name        in varchar2 default null,
    p_item_value       in varchar2 default null );

--==============================================================================
procedure toggle_filter (
    p_worksheet_id      in number,
    p_app_user          in varchar2,
    p_report_id         in number,
    --
    p_condition_id      in number,
    p_filter_enabled    in varchar2);

--==============================================================================
procedure clear_filter (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_condition_id in number);

--
--==============================================================================
--
-- interactive report actions: sorts
--
--==============================================================================
procedure sort_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in varchar2,
    p_sort_direction      in varchar2);

--==============================================================================
procedure save_ordering (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in wwv_flow_global.vc_arr2,
    p_sort_direction      in wwv_flow_global.vc_arr2,
    p_null_sorting        in wwv_flow_global.vc_arr2);

--==============================================================================
procedure sort_on_group_by_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in varchar2,
    p_sort_direction      in varchar2);

--==============================================================================
procedure save_group_by_sort (
    p_id                  in number,
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in wwv_flow_global.vc_arr2,
    p_sort_direction      in wwv_flow_global.vc_arr2,
    p_null_sorting        in wwv_flow_global.vc_arr2);

--==============================================================================
procedure save_pivot_sort (
    p_id                  in number,
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_sort_column         in wwv_flow_global.vc_arr2,
    p_sort_direction      in wwv_flow_global.vc_arr2,
    p_null_sorting        in wwv_flow_global.vc_arr2);

--
--==============================================================================
--
-- interactive report actions: control breaks
--
--==============================================================================
procedure break_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

--==============================================================================
procedure remove_break_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

--==============================================================================
procedure toggle_break_on_column (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_column              in varchar2);

--==============================================================================
procedure set_control_breaks (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_break_on            in wwv_flow_global.vc_arr2,
    p_break_enabled_list  in wwv_flow_global.vc_arr2);

--
--==============================================================================
--
-- interactive report actions: flashback
--
--==============================================================================
procedure set_flashback (
    p_worksheet_id     in number,
    p_app_user         in varchar2,
    p_report_id        in number,
    p_mins_ago         in varchar2,
    p_validation_error out varchar2);

--==============================================================================
procedure toggle_flashback (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number,
    --
    p_flashback_enabled in varchar2 default null);

--==============================================================================
procedure clear_flashback (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);


--
--==============================================================================
--
-- interactive report actions: aggregates
--
--==============================================================================
procedure create_aggregate (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    p_old_aggregation     in varchar2 default null,
    p_aggregate           in varchar2 default null,
    p_column              in varchar2 default null);

--==============================================================================
procedure remove_aggregate (
    p_worksheet_id    in number,
    p_app_user        in varchar2,
    p_report_id       in number,
    p_aggregate       in varchar2,
    p_column          in varchar2);

--
--==============================================================================
--
-- interactive report actions: computations
--
--==============================================================================
procedure add_or_update_computation (
    p_region_id           in number,
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_computation_id      in number default null,
    p_computation_expr    in varchar2 default null,
    p_format_mask         in varchar2 default null,
    p_column_label        in varchar2 default null,
    p_report_label        in varchar2 default null,
    p_validation_error    out varchar2);

--==============================================================================
procedure delete_computation (
    p_worksheet_id        in number,
    p_app_user            in varchar2,
    p_report_id           in number,
    --
    p_computation_id      in number);

--
--==============================================================================
--
-- interactive report actions: charts
--
--==============================================================================
procedure save_chart (
    p_ir_attributes      in t_interactive_report,
    --
    p_chart_type         in varchar2 default null,
    p_chart_label_column in varchar2 default null,
    p_chart_label_title  in varchar2 default null,
    p_chart_value_column in varchar2 default null,
    p_chart_aggregate    in varchar2 default null,
    p_chart_value_title  in varchar2 default null,
    p_chart_sorting      in varchar2 default null,
    p_chart_orientation  in varchar2 default null,
    --
    p_validation_error   out varchar2);

--==============================================================================
procedure delete_chart (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

--
--==============================================================================
--
-- interactive report actions: group by
--
--==============================================================================
procedure save_group_by (
    p_ir_attributes      in t_interactive_report,
    --
    p_group_by_id        in number default null,
    --
    p_column_list        in t_column_name_list,
    p_function_list      in t_group_by_function_list,
    --
    p_validation_error   out varchar2);

--==============================================================================
procedure delete_group_by (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

--
--==============================================================================
--
-- interactive report actions: pivot
--
--==============================================================================
procedure save_pivot (
    p_ir_attributes      in t_interactive_report,
    --
    p_pivot_id           in number default null,
    p_pivot_column_list  in t_column_name_list,
    p_row_column_list    in t_column_name_list,
    p_function_list      in t_pivot_function_list,
    --
    p_validation_error   out varchar2);

--==============================================================================
procedure delete_pivot (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in number);

procedure send_email (
    p_ir_attributes    in out nocopy t_interactive_report,
    p_app_user         in varchar2,
    p_format           in varchar2,
    p_data_only        in varchar2,
    p_pdf_page_size    in varchar2,
    p_pdf_orientation  in varchar2,
    p_strip_rich_text  in varchar2,
    p_accessible       in varchar2,
    p_to               in varchar2,
    p_cc               in varchar2 default null,
    p_bcc              in varchar2 default null,
    p_subject          in varchar2 default null,
    p_body             in varchar2 default null );

--
--==============================================================================
--
-- interactive report actions: email
--
--==============================================================================
procedure save_notify (
    p_ir_attributes         in t_interactive_report,
    p_app_user              in varchar2,
    p_format                in varchar2,
    p_email_address         in varchar2,
    p_email_subject         in varchar2,
    p_notify_interval       in varchar2,
    p_skip_no_data_found    in varchar2,
    p_notify_id             in number                 default null,
    p_start_date            in varchar2               default null,
    p_end_date              in varchar2               default null,
    p_data_only             in varchar2               default null,
    p_pdf_page_size         in varchar2               default null,
    p_pdf_orientation       in varchar2               default null,
    p_strip_rich_text       in varchar2               default null,
    p_accessible            in varchar2               default null,
    p_validation_error      out varchar2);

--==============================================================================
procedure delete_notify (
    p_worksheet_id    in number,
    p_app_user        in varchar2,
    p_report_id       in number,
    p_notify_id       in number default null);

--==============================================================================
-- Cursor for IR subscriptions (see do_notify).
--
-- Does not join by SGID, to support subscriptions in builder sessions.
--==============================================================================
cursor c_subscriptions (p_security_group_id number ) is
    select n.id,
           n.worksheet_id,
           n.report_id,
           n.session_id,
           n.email_subject,
           n.email_from,
           n.email_address,
           n.notify_interval,
           n.start_date,
           n.end_date,
           n.offset_date,
           n.status,
           n.notify_error,
           n.language,
           n.download_format,
           n.strip_rich_text,
           n.data_only,
           n.pdf_page_size,
           n.pdf_page_orientation,
           n.pdf_accessible,
           n.skip_no_data_found,
           n.owner,
           n.security_group_id,
           w.region_id,
           w.flow_id,
           w.page_id
      from wwv_flow_worksheet_notify n,
           wwv_flow_worksheets w
     where w.id                = n.worksheet_id
       and n.security_group_id = p_security_group_id
       and systimestamp        between nvl(n.start_date,systimestamp) and nvl(n.end_date,systimestamp)
       and n.email_address     is not null
       and nvl(n.offset_date,systimestamp) <= systimestamp
     order by w.security_group_id,
              w.flow_id,
              w.page_id,
              n.worksheet_id;

--==============================================================================
-- Process notification for one subscription record and change it's
-- (offset_date, status, notify_error) attribute.
--==============================================================================
procedure do_notify_1 (
    p_subscription in out nocopy c_subscriptions%rowtype );

--==============================================================================
-- Process notifications for a given workspace, update table and push mail
-- queue.
--==============================================================================
procedure do_notify_workspace (
    p_security_group_id in number );

--==============================================================================
-- Main entry point for Interactive Report subscription. It spawns a separate
-- scheduler job for each workspace where subscriptions need processing.
--==============================================================================
procedure do_notify;

--==============================================================================
-- get a query context for the current report
--==============================================================================
function get_report_query_context (
    p_page_id                 in number,
    --
    p_region_id               in number,
    p_report_id               in number      default null,
    p_view                    in varchar2    default 'REPORT',
    --
    p_query_meta_data         in wwv_flow_exec.t_query_meta_data,
    p_additional_filters      in wwv_flow_exec_api.t_filters,
    p_outer_sql               in varchar2    default null,
    --
    p_first_row               in number      default null,
    p_max_rows                in number      default null,
    p_total_row_count         in boolean     default false,
    p_total_row_count_limit   in number      default null )
    return wwv_flow_exec.t_context;

--==============================================================================
-- Runs a data export
--==============================================================================
procedure run_export(
    p_run                       in out nocopy   wwv_flow_data_export.t_run,
    p_data_export_config        in              wwv_flow_region.t_data_export_config,
    --
    p_page_id                   in              number,
    --
    p_region                    in              wwv_flow_plugin_api.t_region,
    p_report_id                 in              number                                   default null,
    p_view                      in              varchar2                                 default 'REPORT',
    --
    p_additional_filters        in              wwv_flow_exec_api.t_filters              default wwv_flow_exec_api.c_empty_filters,
    --
    p_max_rows                  in              number                                   default null );

--==============================================================================
-- get a link to download the IR
--==============================================================================
function get_download_link(
    p_ir_attributes   in t_interactive_report,
    p_format          in varchar2,
    p_data_only       in varchar2,
    p_pdf_page_size   in varchar2,
    p_pdf_orientation in varchar2,
    p_strip_rich_text in varchar2,
    p_accessible      in varchar2 )
    return varchar2;

--==========================================================================
-- Download a generated file
--==========================================================================
procedure download_export (
    p_region_id in number );

--==============================================================================
-- get column_identifier for the newly added IR column
-- used from IR column trigger
--==============================================================================
function get_next_identifier (
   p_worksheet_id in number )
   return varchar2;

--==============================================================================
-- get column_identifier for the newly added computed column
-- used from IR computation column trigger
--==============================================================================
function get_next_computed_identifier(
   p_worksheet_id in number,
   p_report_id    in number )
   return varchar2;

--==============================================================================
-- get db_column_name for the newly added computed column
-- used from IR computation column trigger
--==============================================================================
function get_next_computed_column_name (
    p_worksheet_id in number,
    p_report_id    in number )
    return varchar2;

--==============================================================================
-- API to call from INTERNAL app page
-- Procedure deletes subscription from different workspace.
--==============================================================================
procedure builder_delete_subscription (
    p_workspace_id        in number,
    p_subscription_id     in number );

--==============================================================================
-- API to call from INTERNAL app page
-- Procedure deletes saved report from different workspace.
--==============================================================================
procedure builder_delete_saved_report (
    p_workspace_id      in number,
    p_worksheet_id      in number,
    p_report_id         in number );

--==============================================================================
-- API to call from INTERNAL app page
-- This procedure is called from 4155:200 to remove email from the subscription.
-- After the email remove, if the subscription has no email to send, the subscription gets deleted.
--==============================================================================
procedure builder_unsubscribe_email (
    p_subscription_id  in number,
    p_workspace_id     in number,
    p_email            in varchar2 );
end wwv_flow_ir;
/
show errors;
