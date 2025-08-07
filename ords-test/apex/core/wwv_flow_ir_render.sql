set define '^' verify off
prompt ...wwv_flow_ir_render
create or replace package wwv_flow_ir_render as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_ir_render.sql
--
--    DESCRIPTION
--      This package is responsible for handling interactive reports.
--
--    MODIFIED  (MM/DD/YYYY)
--      cczarski 08/11/2017 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_empty_columns                  wwv_flow_ir.t_columns;
c_empty_columns_by_name          wwv_flow_ir.t_columns_by_name;

c_canonical_date_format          constant varchar2(16)  := wwv_flow_exec_sql.c_canonical_date_format_oracle;
c_canonical_date_format_mysql    constant varchar2(16)  := wwv_flow_exec_sql.c_canonical_date_format_mysql;

c_canonical_number_format        constant varchar2(47)  := '99999999999999999999999999999999999999.99999999';
c_nls_num_characters             constant varchar2(29)  := 'NLS_NUMERIC_CHARACTERS=''.,''';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--
g_notify_in_progress          boolean     := false;

--
--==============================================================================
function build_ir_dom_id (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_id            in varchar2 ) return varchar2;
--
--==============================================================================
-- Fetches translated report attributes
--==============================================================================
procedure fetch_translated_rpt_attr (
    p_worksheet_id   in number,
    p_base_report_id in number,
    --
    p_report         in out nocopy wwv_flow_worksheet_rpts%rowtype );
--
--==============================================================================
-- Fetches translated filter or condition name
--==============================================================================
procedure fetch_translated_cond_name (
    p_worksheet_id   in number,
    p_base_report_id in number,
    p_report_id      in number,
    p_id             in number,
    --
    p_name           in out nocopy varchar2 );
--
--==============================================================================
function fetch_ir_attributes(
    p_region                     in wwv_flow_plugin_api.t_region,
    p_report_id                  in number,
    p_define_templates           in boolean,
    p_include_hidden_cols        in boolean default false,
    p_include_computed_cols      in boolean default false,
    p_create_report_if_necessary in boolean default true,
    p_is_ajax                    in boolean default false ) return wwv_flow_ir.t_interactive_report;

--
--==============================================================================
procedure get_worksheet_prefs (
    p_worksheet_id   in            number,
    p_ir_preferences in out nocopy wwv_flow_ir.t_ir_preferences );

--
--==============================================================================
procedure set_worksheet_prefs (
    p_ir_preferences    in out nocopy wwv_flow_ir.t_ir_preferences,
    p_worksheet_id      in            number,
    --
    p_parent_report_id  in number   default null,
    p_hide_rpt_settings in varchar2 default null,
    p_show_nulls        in varchar2 default null,
    p_show_rpt_cols     in varchar2 default null,
    p_rpt_view_mode     in varchar2 default null ) ;

--
--==============================================================================
function open_filter_context(
    p_ir_attributes     in out nocopy wwv_flow_ir.t_interactive_report,
    p_report_id         in            number default null,
    p_column            in            varchar2,
    p_search_string     in            varchar2 default null ) return wwv_flow_exec.t_context;

--
--==============================================================================
procedure open_report_query_context(
    p_context                 in out nocopy wwv_flow_exec.t_context,
    p_query_meta_data         in            wwv_flow_exec.t_query_meta_data,
    --
    p_ir_attributes           in out nocopy wwv_flow_ir.t_interactive_report,
    p_view_mode               in            varchar2 default 'REPORT',
    --
    p_additional_filters      in            wwv_flow_exec_api.t_filters,
    p_outer_sql               in            varchar2,
    --
    p_first_row               in            number      default null,
    p_max_rows                in            number      default null,
    p_total_row_count         in            boolean     default false,
    p_total_row_count_limit   in            number      default null );

--
--==============================================================================
function generate_report_query(
    p_ir_attributes           in out nocopy wwv_flow_ir.t_interactive_report,
    p_view_mode               in            varchar2 default 'REPORT' )
    return varchar2;

--
--==============================================================================
procedure get_select_list (
    p_ir_attributes      in out nocopy wwv_flow_ir.t_interactive_report,
    p_columns            in out nocopy wwv_flow_exec_api.t_columns,
    p_apply_formats      in            boolean default false,
    p_select_all         in            boolean default false,
    p_select_hidden_cols in            boolean default true );

--
--==============================================================================
procedure get_chart(
    p_ir_attributes  in out nocopy wwv_flow_ir.t_interactive_report );

--
--==============================================================================
procedure show_single_row (
    p_ir_attributes      in out nocopy wwv_flow_ir.t_interactive_report,
    p_region             in wwv_flow_plugin_api.t_region,
    p_row_id             in varchar2 default null,
    p_base_report_id     in number   default null,
    p_display_button_bar in boolean  default true );

--
--==============================================================================
procedure render (
    p_region                 in wwv_flow_plugin_api.t_region,
    p_request                in varchar2,
    p_actions_menu_structure in varchar2 default 'IG' );

--
--==============================================================================
procedure render_ajax(
    p_region                    in wwv_flow_plugin_api.t_region,
    p_request                   in varchar2,
    p_max_rows                  in number                       default null,
    p_report_id                 in number                       default null,
    p_view_mode                 in varchar2                     default null );

--
--==============================================================================
procedure run_export(
    p_run                       in out nocopy   wwv_flow_data_export.t_run,
    p_external                  in out nocopy   boolean,
    p_region                    in              wwv_flow_plugin_api.t_region,
    p_data_export_config        in              wwv_flow_region.t_data_export_config,
    p_report_id                 in              number                                   default null,
    p_view_mode                 in              varchar2                                 default 'REPORT',
    --
    p_additional_filters        in              wwv_flow_exec_api.t_filters              default wwv_flow_exec_api.c_empty_filters,
    --
    p_max_rows                  in              number                                   default null );

--
--==============================================================================
procedure initialize_template_component (
    p_column_id          in            number,
    p_template_component in out nocopy wwv_flow_plugin.t_template_component );

end wwv_flow_ir_render;
/
show errors
