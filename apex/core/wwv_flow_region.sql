set define off verify off
prompt ...wwv_flow_region
create or replace package wwv_flow_region as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_region.sql
--
--    DESCRIPTION
--      This package is responsible for handling regions in the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    04/12/2012 - Created
--
--------------------------------------------------------------------------------

type t_data_export_config is record (
    output_format               wwv_flow_data_export_api.t_format,
    as_clob                     boolean,
    file_name                   varchar2(32767),
    page_size                   wwv_flow_data_export_api.t_size,
    orientation                 wwv_flow_data_export_api.t_orientation,
    data_only                   boolean,
    pdf_accessible              boolean,
    xml_include_declaration     boolean,
    strip_rich_text             boolean );

--==============================================================================
-- make wwv_flow.g_plugs(p_region_idx) the current component. this procedure
-- should be used instead of the more generic wwv_flow.set_component, because
-- it performs additional initialization.
--==============================================================================
procedure set_component (
    p_region in wwv_flow_meta_data.t_plug );

--==============================================================================
-- clean up after region specific code that has been initiated with
-- set_component().
--==============================================================================
procedure clear_component;

--==============================================================================
-- initialize p_region before rendering. this configures references between the
-- region and it's parent and initializes subcomponents of the region (items,
-- buttons, sub-regions) if it can be displayed.
--
-- ARGUMENTS
-- * p_parent_region_idx  index of p_region's parent region in wwv_flow.g_plugs
-- * p_region             the region
--==============================================================================
procedure init (
    p_parent_region_idx in pls_integer,
    p_region            in out nocopy wwv_flow_meta_data.t_plug );

--==============================================================================
-- return whether the region can be displayed
--==============================================================================
function is_ok_to_display (
    p_region in out nocopy wwv_flow_meta_data.t_plug )
    return boolean;

--==============================================================================
-- return whether the region is read-only.
--
-- ARGUMENTS
-- * p_region              the region
-- * p_parent_is_read_only read-only status of the parent region (for
--                         sub-regions) or the page (for top level regions).
--                         if null, the parent's read only status is computed
--                         by looking up the parent region's or page's status.
--==============================================================================
function is_read_only (
    p_region                in out nocopy wwv_flow_meta_data.t_plug,
    p_parent_is_read_only   in boolean default null )
    return boolean;

--==============================================================================
-- Returns TRUE if the current region is rendered read only and FALSE if not.
-- If the function is called from a context where no region is currently
-- processed it will return NULL.
--
-- The current region is the one that has been configured by calling
-- set_component().
--==============================================================================
function is_read_only return boolean;

--==============================================================================
-- Purge the region cache of the specified application, page and region.
--
-- Parameters:
--   p_application_id Id of the application where the region caches should be purged.
--   p_page_id        Id of the page where the region caches should be purged.
--                    If no value is specified all regions of the specified application
--                    will be purged.
--   p_region_id      Id of a specific region on a page which should be purged.
--                    If no value is specified all regions of the specified page
--                    will be purged.
--   p_current_session_only If true, only purges cache for the current session.
--==============================================================================
procedure purge_cache (
    p_application_id       in number,
    p_page_id              in number default null,
    p_region_id            in number default null,
    p_current_session_only in boolean default false );

--==============================================================================
-- Function returns the region plug-in type (incl. NATIVE_ or PLUGIN_ prefix).
--==============================================================================
function get_type (
    p_region_id in number )
    return wwv_flow_page_plugs.plug_source_type%type;

--==============================================================================
-- Function returns the number of submitted rows of the specified region.
--==============================================================================
function get_row_count (
    p_region_id in number )
    return pls_integer;

--==============================================================================
-- Function returns the status (C=create, U=update, D=delete or NULL) of the specified
-- region row. 
--==============================================================================
function get_row_status (
    p_region_id in number,
    p_row_num   in pls_integer )
    return varchar2;

--==============================================================================
-- Function returns TRUE if the specified row has been created or modified.
-- Returns FALSE if the submitted values have not changed.
--==============================================================================
function has_row_changed (
    p_region_id in number,
    p_row_num   in pls_integer )
    return boolean;

--==============================================================================
-- Function returns an array, indexed by column alias which contains the
-- column values of the specified region. This array can be used to
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

--==============================================================================
-- Procedure which updates the region internal session state with the values
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
    p_column_alias     in varchar2,
    p_row_num          in pls_integer,
    p_ora_error        in wwv_flow_error.t_ora_error default wwv_flow_error.ora_error );

--==============================================================================
-- Function returns the format mask of the tabular form/interactive grid column.
--==============================================================================
function get_column_format_mask (
    p_region_id   in number,
    p_column_name in varchar2 )
    return varchar2;

--==============================================================================
-- Function returns the label/heading of the tabular form/interactive grid column.
--==============================================================================
function get_column_label (
    p_region_id   in number,
    p_column_name in varchar2 )
    return varchar2;

--==============================================================================
-- set the "status" (e.g. CLEAR, RESET) for a given region ID. Using the
-- "get_region_status", the region code can retrieve the status and take
-- appropriate action.
--==============================================================================
procedure set_status(
    p_region_id   in number,
    p_status      in varchar2 );

--==============================================================================
-- get the "status" (e.g. CLEAR, RESET) which has been set for a given region ID
-- using "set_region_status".
--==============================================================================
function get_status(
    p_region_id   in number )
    return varchar2;

--==============================================================================
-- set parent column values for a given region ID
--==============================================================================
procedure set_parent_column_values(
    p_region_id             in number,
    p_parent_column_values  in wwv_flow_session_state.t_value_map );

--==============================================================================
-- retrieve the parent column values for a given region ID
--==============================================================================
function get_parent_column_values(
    p_region_id             in number )
    return wwv_flow_exec_api.t_parameters;

--==============================================================================
-- Function returns the query context returning current report data
--==============================================================================
function open_query_context(
    p_page_id               in number,
    p_region_id             in number,
    p_component_id          in number                         default null,
    p_view_mode             in varchar2                       default null,
    --
    p_additional_filters    in wwv_flow_exec_api.t_filters    default wwv_flow_exec_api.c_empty_filters,
    p_outer_sql             in varchar2                       default null,
    --
    p_first_row             in number                         default null, 
    p_max_rows              in number                         default null,
    p_total_row_count       in boolean                        default false,
    p_total_row_count_limit in number                         default null,
    --
    p_parent_column_values  in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters ) 
    return wwv_flow_exec_api.t_context;

--==============================================================================
-- Function returns the data export for a region 
--==============================================================================
function export_data(
    p_data_export_config        in t_data_export_config,
    --
    p_page_id                   in number,
    p_region_id                 in number,
    p_component_id              in number                                   default null,
    p_view_mode                 in varchar2                                 default null,
    --
    p_additional_filters        in wwv_flow_exec_api.t_filters              default wwv_flow_exec_api.c_empty_filters,
    --
    p_max_rows                  in number                                   default null,
    p_parent_column_values      in wwv_flow_exec_api.t_parameters           default wwv_flow_exec_api.c_empty_parameters ) 
    return wwv_flow_data_export_api.t_export;

--##############################################################################
--#
--# UTILITIES FOR REGIONS THAT PERFORM DML (FORM, IG)
--#
--##############################################################################

--==============================================================================
-- Wrapper for raise_internal_error and wwv_flow_process.add_error_message.
-- Depending on if p_display_location is set, the actual error will be handled
-- by the process. Otherwise we raise an internal error.
--
-- EXAMPLE
--   See e.g. wwv_flow_form_region.dml_process_int.
--==============================================================================
procedure raise_error(
    p_error_code       in varchar2,
    p0                 in varchar2 default null,
    p1                 in varchar2 default null,
    p2                 in varchar2 default null,
    p3                 in varchar2 default null,
    p_display_location in varchar2,
    p_ora_error        in wwv_flow_error.t_ora_error default wwv_flow_error.ora_error );

--==============================================================================
-- Default handler for errors:
--
-- - code is null or (code = 0 and message is 'SKIPPED'): do nothing
-- - message is ORA-20000 ROWVERSION_CONFLICT: raise APEX.DATA_HAS_CHANGED
-- - message is ORA-20987 wwv_flow_lang.system_message('APEX.DATA_HAS_CHANGED):
--   raise APEX.DATA_HAS_CHANGED
-- - otherwise: raises a process/internal error.
--
-- EXAMPLE
--   See e.g. wwv_flow_form_region.dml_process_int.
--==============================================================================
procedure handle_error (
    p_error_message    in varchar2,
    p_display_location in varchar2,
    p_ora_error        in wwv_flow_error.t_ora_error );

--##############################################################################
--#
--# CLEANUP
--#
--##############################################################################


--==============================================================================
-- Resets all global variables.
-- Note: Always call this procedure if the current page/region changes!
--==============================================================================
procedure reset;

--
end wwv_flow_region;
/
show errors

set define '^'
