set define off verify off
prompt ...wwv_flow_region_api
create or replace package wwv_flow_region_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012 - 2014. All Rights Reserved.
--
--    NAME
--      wwv_flow_region_api.sql
--
--    DESCRIPTION
--      This package is the public API for handling regions.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    04/12/2012 - Created
--      cneumuel  04/28/2014 - In purge_cache: added p_current_session_only (feature #1401)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Returns TRUE if the current region is rendered read only and FALSE if not.
-- If the function is called from a context where no region is currently
-- processed it will return NULL. This function can for example be used in
-- conditions of a region or it's underlying items and buttons.
--
-- EXAMPLE
--   return apex_region.is_read_only;
--==============================================================================
function is_read_only return boolean;

--==============================================================================
-- Purge the region cache of the specified application, page and region.
--
-- PARAMETERS
-- * p_application_id       id of the application where the region caches should
--                          be purged. defaults to the current application.
-- * p_page_id              id of the page where the region caches should be
--                          purged. if no value is specified (which is the
--                          default) all regions of the application will be
--                          purged.
-- * p_region_id            id of a specific region on a page. if no value is
--                          specified all regions of the specified page will be
--                          purged.
-- * p_current_session_only specify true if you only want to purge entries that
--                          where saved for the current session. defaults to
--                          false.
--
-- EXAMPLE
--   Purge session specific region cache for the whole application.
--
--   begin
--       apex_region.purge_cache (
--           p_current_session_only => true );
--   end;
--==============================================================================
procedure purge_cache (
    p_application_id       in number default wwv_flow.g_flow_id,
    p_page_id              in number default null,
    p_region_id            in number default null,
    p_current_session_only in boolean default false );

--==============================================================================
-- returns an APEX_EXEC query context returning current region data. Only native
-- regions are supported at this time.
--
-- This function runs within an autonomous transaction.
--
-- PARAMETERS
-- * p_page_id               id of the page where the region is on
-- * p_region_id             id of a specific region to open the query context for
-- * p_component_id          region component ID to use. For Interactive Reports and Interactive Grids this is the saved
--                           report ID within the current application page, for JET charts use the chart series ID.
-- * p_view_mode             The view type available for the report. The values can be:
--                           APEX_IR.C_VIEW_REPORT, APEX_IR.C_VIEW_GROUPBY, APEX_IR.C_VIEW_PIVOT,
--                           APEX_IG.C_VIEW_GRID, APEX_IG.C_VIEW_ICON, APEX_IG.C_VIEW_DETAIL or APEX_IG.C_VIEW_CHART
--                           If p_view is null, it gets the view
--                           currently used by the report. If p_view passed which doesn't
--                           exist for the current report, an error is raised.
--
-- * p_additional_filters    additional filters to apply to the context
-- * p_outer_sql             outer SQL query to wrap around the region SQL query. Use the #APEX$SOURCE_DATA#
--                           to reference the region source (apex_exec.c_data_source_table_name constant). If
--                           this parameter is specified, then the P_COLUMNS parameter has no effect.
--                           Note that this parameter will override CHART, GROUP BY or PIVOT views for
--                           interactive reports.
--
-- * p_first_row             row index to start fetching at. Defaults to 1
-- * p_max_rows              maximum amount of rows to get. Default unlimited.
-- * p_total_row_count       whether to retrieve the total row count. Defaults to false. If used together with
--                           the P_OUTER_SQL parameter make sure to add the APEX$TOTAL_ROW_COUNT column to the
--                           select list of the P_OUTER_SQL query.
-- * p_total_row_count_limit Upper limit of rows to process the query on. This applies
--                           to Interactive Report aggregations or ordering.
--                           Default is no limit
--
-- * p_parent_column_values  For the detail grid in an Interactive Grid Master-Detail relationship. Use this
--                           parameter to pass in values for the master-detail parent column(s).
--
-- EXAMPLE
--   Get the query context for a given saved interactive report on page 1 and print
--   the data out as JSON.
--
--   declare
--       l_context apex_exec.t_context;
--   begin
--       l_context := apex_region.open_query_context (
--                        p_page_id      => 1,
--                        p_region_id    => 880629800374638220,
--                        p_component_id => 2505704029884282);
--
--       apex_json.open_object;
--       apex_json.write_context( 'data', l_context );
--       apex_json.close_object;
--   end;
--
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
-- The function exports current region data. Only native regions are supported at this time.
--
-- PARAMETERS
-- * p_format                   Export format. Valid values are: XLSX, PDF, HTML, CSV, XML, PXML, JSON & PJSON.
--
-- * p_page_id                  id of the page where the region is on
-- * p_region_id                id of a specific region to open the query context for
-- * p_component_id             region component ID to use. For Interactive Reports and Interactive Grids this is the saved
--                              report ID within the current application page, for JET charts use the chart series ID.
-- * p_view_mode                The view type available for the report. The values can be:
--                              APEX_IR.C_VIEW_REPORT, APEX_IR.C_VIEW_GROUPBY, APEX_IR.C_VIEW_PIVOT,
--                              APEX_IG.C_VIEW_GRID, APEX_IG.C_VIEW_ICON, APEX_IG.C_VIEW_DETAIL or APEX_IG.C_VIEW_CHART
--                              If p_view is null, it gets the view
--                              currently used by the report. If p_view passed which doesn't
--                              exist for the current report, an error is raised.
--
-- * p_additional_filters       additional filters to apply to the context
--
-- * p_max_rows                 maximum amount of rows to get. Default unlimited.
-- * p_parent_column_values     For the detail grid in an Interactive Grid Master-Detail relationship. Use this
--                              parameter to pass in values for the master-detail parent column(s).
--
-- * p_as_clob                  Returns the export contents as a CLOB. Does not work with binary export formats like PDF and XLSX.
--                              Default to false.
--
-- * p_file_name                Defines the filename of the export.
-- * p_page_size                Report page size. Available options include: Letter, Legal, Tabloid, A4, A3, Custom.
-- * p_orientation              Report page orientation. Available options include: Vertical, Horizontal
-- * p_strip_rich_text          Whether to remove markup from column values for CSV and XLSX. Only for Interactive Reports and Interactive Grids.
-- * p_data_only                Whether to include column groups, control breaks, aggregates and highlights
--
-- * p_pdf_accessible           Whether to include accessibility tags in the PDF. Defaults to false.
--
-- * p_xml_include_declaration  Whether to include the XML declaration. Defaults to true.
--
-- RETURNS
--    The export file contents and mime_type and optional the report layout
--
-- EXAMPLE
--   Get the export result for a given saved classic report on page 3 and download as HTML.
--
--   declare
--       l_export       apex_data_export.t_export;
--       l_region_id    number;
--   begin
--
--      select region_id into l_region_id
--        from apex_application_page_regions
--       where application_id = 100
--         and page_id = 3
--         and static_id = 'classic_report';
--
--       l_export := apex_region.export_data (
--            p_format       => apex_data_export.c_format_html,
--            p_page_id      => 3,
--            p_region_id    => l_region_id );
--
--       apex_data_export.download( l_export );
--   end;
--
--==============================================================================
function export_data(
    p_format                    in wwv_flow_data_export_api.t_format,
    --
    p_page_id                   in number,
    p_region_id                 in number,
    p_component_id              in number                                   default null,
    p_view_mode                 in varchar2                                 default null,
    --
    p_additional_filters        in wwv_flow_exec_api.t_filters              default wwv_flow_exec_api.c_empty_filters,
    --
    p_max_rows                  in number                                   default null,
    p_parent_column_values      in wwv_flow_exec_api.t_parameters           default wwv_flow_exec_api.c_empty_parameters,
    --
    p_as_clob                   in boolean                                  default false,
    --
    p_file_name                 in varchar2                                 default null,
    p_page_size                 in wwv_flow_data_export_api.t_size          default wwv_flow_data_export_api.c_size_letter,
    p_orientation               in wwv_flow_data_export_api.t_orientation   default wwv_flow_data_export_api.c_orientation_portrait,
    p_strip_rich_text           in boolean                                  default false,
    p_data_only                 in boolean                                  default false,
    --
    p_pdf_accessible            in boolean                                  default false,
    --
    p_xml_include_declaration   in boolean                                  default true )
    return wwv_flow_data_export_api.t_export;

--==============================================================================
-- Clears region settings ( CR and IR pagination, IR report settings).
-- For IR
--  1. Clears settings such as:
--     control break, aggregate, flashback, chart, number of rows to display,
--      filter, highlight, computation, group by
-- 2. Does NOT clear the following:
--     display column list, sorting,
--     report preference (view mode, display nulls in detail view, expand/collapse of report settings).
--
-- PARAMETERS
-- * p_application_id        id of the application where the region is on
-- * p_page_id               id of the page where the region is on
-- * p_region_id             id of a specific region
-- * p_component_id          region component ID to use. For Interactive Reports this is the saved
--                           report ID within the current application page.
--
-- EXAMPLE
--   Clear the given saved report on application 100, page 1
--
--   begin
--       apex_region.clear (
--           p_applicatoin_id => 100,
--           p_page_id        => 1,
--           p_region_id      => 2505704029884282,
--           p_component_id   => 880629800374638220);
--   end;
--
--==============================================================================

procedure clear (
    p_application_id  in number  default wwv_flow.g_flow_id,
    p_page_id         in number,
    p_region_id       in number,
    p_component_id    in number  default null );
--==============================================================================
-- Resets region settings ( CR and IR pagination, CR sort, IR and IG report settings).
-- Only report regions are supported at this time.
--
-- PARAMETERS
-- * p_application_id        id of the application where the region is on
-- * p_page_id               id of the page where the region is on
-- * p_region_id             id of a specific region
-- * p_component_id          region component ID to use. For Interactive Reports and Interactive Grids this is the saved
--                           report ID within the current application page.
--
-- EXAMPLE
--   Reset the given saved report on application 100, page 1
--
--   begin
--       apex_region.reset (
--           p_applicatoin_id => 100,
--           p_page_id        => 1,
--           p_region_id      => 2505704029884282,
--           p_component_id   => 880629800374638220);
--   end;
--
--==============================================================================
procedure reset (
    p_application_id  in number  default wwv_flow.g_flow_id,
    p_page_id         in number,
    p_region_id       in number,
    p_component_id    in number  default null );


--==============================================================================
-- Get the region ID based on the region_static_id
--
-- Parameters:
-- * p_application_id:   ID of the application which contains the region. Defaults to the current application.
-- * p_page_id:          ID of the page which contains the region.
-- * p_dom_static_id:    Static ID of the desired region.
--
-- Raises:
-- * too_many_rows: A too_many_rows error will be raised if multiple regions exist with the same DOM static id.
-- * no_data_found: A no_data_found error will be raised if a region with p_dom_static_id doesn't exist.
--
-- Example:
--   Get the ID of the region whose static ID is "my_apex_region" in app 100 on page 1.
--
--   declare
--     l_region_id apex_application_page_regions.region_id%type;
--   begin
--     --
--     l_region_id := apex_region.get_id(
--                        p_application_id => 100,
--                        p_page_id        => 1,
--                        p_dom_static_id  => 'my_apex_region' );
--     --
-- end;
--
-- Since: 24.2
--==============================================================================
function get_id(
    p_application_id in number default wwv_flow.g_flow_id,
    p_page_id        in number,
    p_dom_static_id  in varchar2 )
    return number;


--==============================================================================
-- Get the region ID based on the region name
--
-- Parameters:
-- * p_application_id:   ID of the application which contains the region. Defaults to the current application.
-- * p_page_id:          ID of the page which contains the region.
-- * p_name:             Name of the desired region.
--
-- Raises:
-- * too_many_rows: A too_many_rows error will be raised if multiple regions exist with the same region name.
-- * no_data_found: A no_data_found error will be raised if a region with p_name doesn't exist.
--
-- Example:
--   Get the ID of the region whose name is "Test" in app 100 on page 1.
--
--   declare
--     l_region_id apex_application_page_regions.region_id%type;
--   begin
--     --
--     l_region_id := apex_region.get_id(
--                        p_application_id => 100,
--                        p_page_id        => 1,
--                        p_name           => 'Test' );
--     --
-- end;
--
-- Since: 24.2
--==============================================================================
function get_id(
    p_application_id in number default wwv_flow.g_flow_id,
    p_page_id        in number,
    p_name           in varchar2 )
    return number;

end wwv_flow_region_api;
/
show errors
set define '^'
