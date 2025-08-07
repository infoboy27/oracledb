set define '^' verify off
prompt ...wwv_flow_interactive_grid
create or replace package wwv_flow_interactive_grid as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2015, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_interactive_grid.sql
--
--    DESCRIPTION
--      This package is responsible for handling interactive grids.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    10/20/2015 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

type t_current_report is record (
    id        number,
    view_type wwv_flow_ig_report_views.view_type%type );

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_action_create constant varchar2( 1 ) := 'i';
c_action_update constant varchar2( 1 ) := 'u';
c_action_delete constant varchar2( 1 ) := 'd';

c_column_type_column      constant varchar2( 6 )  := 'column';
c_column_type_compute     constant varchar2( 7 )  := 'compute';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------
--
--==============================================================================
-- Renders an Interactive Grid region.
--==============================================================================
function render (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_plug                in wwv_flow_meta_data.t_plug,
    p_is_printer_friendly in boolean )
    return wwv_flow_plugin_api.t_region_render_result;
--
--==============================================================================
-- Ajax callback for an Interactive Grid region.
--==============================================================================
function ajax (
    p_plugin               in wwv_flow_plugin_api.t_plugin,
    p_region               in wwv_flow_plugin_api.t_region,
    p_json_path            in varchar2,
    p_in_accept            in boolean,
    p_in_set_session_state in boolean )
    return wwv_flow_plugin_api.t_region_ajax_result;
--
--==============================================================================
-- Procedure to initialize the p_item plug-in record based on an ig column id.
--==============================================================================
procedure initialize_item (
    p_column_id   in            number,
    p_plugin_name in out nocopy varchar2,
    p_item        in out nocopy wwv_flow_plugin_api.t_item );
--
--==============================================================================
-- Function returns the number of submitted rows of the specified interactive grid.
--==============================================================================
function get_row_count (
    p_region_id in number )
    return pls_integer;
--
--==============================================================================
-- Function returns the status (C=create, U=update, D=delete or NULL) of the specified
-- interactive grid row. 
--==============================================================================
function get_row_status (
    p_region_id in number,
    p_row_num   in pls_integer )
    return varchar2;
--
--==============================================================================
-- Function returns TRUE if the specified row has been created, modified or deleted.
-- Returns FALSE if the submitted values have not changed.
--==============================================================================
function has_row_changed (
    p_region_id in number,
    p_row_num   in pls_integer )
    return boolean;
--
--==============================================================================
-- Function returns an array, indexed by column alias which contains the
-- column values of the specified interactive grid row. This array can be used to
-- call set_component_values.
--
-- The "Row Selector" column is returned as "APEX$ROW_SELECTOR" and contains
-- the value X if checked.
-- The "Record Status" column is returned as "APEX$ROW_STATUS".
--==============================================================================
function get_row_values (
    p_region_id in number,
    p_row_num   in pls_integer )
    return wwv_flow_session_state.t_value_map;
--
--==============================================================================
-- Procedure which updates the interactive grid internal session state with the values
-- of the p_value_map. p_value_map is index by column alias.
--==============================================================================
procedure set_row_values (
    p_region_id in number,
    p_value_map in wwv_flow_session_state.t_value_map,
    p_row_num   in pls_integer );

--==============================================================================
-- Performs the basic and predefined validations
--==============================================================================
procedure perform_basic_validations (
    p_region_id in number,
    p_row_num   in pls_integer );

--==============================================================================
-- Adds an error message onto the error stack.
-- Note: This procedure has to be called before APEX has performed the
--       last validation/process, otherwise it will not take the error into account
--       when the inline errors are displayed.
--==============================================================================
procedure add_error (
    p_message          in varchar2,
    p_display_location in varchar2,
    p_region_id        in number,
    p_column_name      in varchar2,
    p_row_num          in pls_integer,
    p_ora_error        in wwv_flow_error.t_ora_error );
--
procedure add_error (
    p_error_code       in varchar2,
    p_display_location in varchar2,
    p_region_id        in number,
    p_column_name      in varchar2,
    p_row_num          in pls_integer,
    p_ora_error        in wwv_flow_error.t_ora_error );
--
--==============================================================================
-- "Interactive Grid (DML)" process type plug-in which processes the data
-- stored in the session state.
--==============================================================================
function dml_process (
    p_process                in wwv_flow_plugin_api.t_process,
    p_error_display_location in varchar2,
    p_error_message          in varchar2 )
    return wwv_flow_plugin_api.t_process_exec_result;
--
--==============================================================================
-- Copies the definition (including all child information) of an report.
--==============================================================================
function copy_saved_report (
    p_id                   in number,
    p_offset               in number,
    p_base_report_id       in number  default null,
    p_session_id           in number  default null,
    p_app_id               in number  default null,
    p_page_id              in number  default null,
    p_interactive_grid_id  in number  default null,
    p_security_group_id    in number  default wwv_flow_security.g_curr_flow_security_group_id,
    p_delete_copied_report in boolean default false )
    return number;
--
--==============================================================================
-- Create copies of all session reports for p_old_session_id in the new session.
--==============================================================================
procedure clone_session_reports (
    p_old_session_id   in number,
    p_new_session_id   in number );
--
--==============================================================================
-- Translates the specified column or page item names into the (static) ids of
-- those columns.
--
-- If p_raise_error = true and error will be raised if the specified name isn't
-- a valid IG column name. If p_raise_error = false we assume the specified name
-- is a page item name and just return it.
--==============================================================================
function get_static_ids (
    p_region_id   in number,
    p_item_names  in varchar2,
    p_raise_error in boolean )
    return varchar2;

--
--==============================================================================
-- Extracts the parent item values for this Interactive Grid region from
-- the request JSON.
--==============================================================================
function get_parent_item_values(
    p_json_path       in varchar2,
    p_region_id       in number,
    p_values_required in boolean )
    return wwv_flow_session_state.t_value_map;
--
--==============================================================================
--
--==============================================================================
function get_current_report (
    p_region_id in number )
    return t_current_report;
--
--==============================================================================
--
--==============================================================================
procedure init_current_report (
    p_region_id in number,
    p_report_id in number,
    p_view_type in varchar2,
    p_persist   in boolean );
--
--==============================================================================
--
--==============================================================================
procedure create_session_based_report (
    p_id     in out number,
    p_offset    out number );
--
--==============================================================================
--
--==============================================================================
function handle_reset_report_settings (
    p_region_id in number,
    p_report_id in number )
    return wwv_flow_ig_reports%rowtype;
--
--==============================================================================
--
--==============================================================================
procedure reset (
    p_region_id in number,
    p_report_id in number default null );
--
--==============================================================================
function get_report_query_context (
    p_page_id                 in number,
    --
    p_region_id               in number,
    p_report_id               in number                         default null,
    p_view_mode               in varchar2                       default 'GRID',
    --
    p_query_meta_data         in wwv_flow_exec.t_query_meta_data,
    p_additional_filters      in wwv_flow_exec_api.t_filters,
    p_outer_sql               in varchar2                       default null,
    --
    p_first_row               in number                         default null,
    p_max_rows                in number                         default null,
    p_total_row_count         in boolean                        default false,
    p_total_row_count_limit   in number                         default null,
    --
    p_parent_column_values    in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters ) 
    return wwv_flow_exec.t_context;
    
--
--==============================================================================
procedure run_export(
    p_run                       in out nocopy   wwv_flow_data_export.t_run,
    p_region                    in              wwv_flow_plugin_api.t_region,
    p_data_export_config        in              wwv_flow_region.t_data_export_config,
    p_report_id                 in              number                                   default null,
    p_view_mode                 in              varchar2                                 default 'GRID',
    --
    p_additional_filters        in              wwv_flow_exec_api.t_filters              default wwv_flow_exec_api.c_empty_filters,
    --
    p_max_rows                  in              number                                   default null,
    p_parent_column_values      in              wwv_flow_exec_api.t_parameters           default wwv_flow_exec_api.c_empty_parameters );

--
--==============================================================================
procedure assert_filter_operator ( 
    p_operator_abbr  in varchar2 );

--==============================================================================
procedure clear (
    p_report_id in number );

--
--==============================================================================
procedure handle_filter (
    p_id                in number,
    p_operation         in varchar2,
    p_flow_id           in number,
    p_page_id           in number,
    p_report_id         in number,
    p_region_id         in number,
    p_view_id           in number,
    p_offset            in number,
    p_name              in varchar2,
    p_is_enabled        in boolean,
    p_type              in varchar2,
    p_column_type       in varchar2,
    p_column_id         in number,
    p_operator          in varchar2,
    p_is_case_sensitive in boolean,
    p_value             in varchar2,
    p_expression        in varchar2 );

--
--==============================================================================
procedure set_report_using_request (
    p_page_id          in number,
    p_request          in varchar2 default null );

--
--==============================================================================
procedure add_filter_using_item (
    p_page_id          in number,
    p_request          in varchar2 default null,
    --
    p_item_name        in varchar2 default null,
    p_item_value       in varchar2 default null );

--
--==============================================================================
procedure get_ig_info_from_request (
    p_request           in  varchar2,
    p_region_static_id  out varchar2,
    p_report_name       out varchar2 );

--
--==============================================================================
function get_region_id (
	p_page_id          in number,
	p_region_static_id in varchar2
	) return number;

end wwv_flow_interactive_grid;
/
show errors
