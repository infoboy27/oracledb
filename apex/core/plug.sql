set define '^' verify off
prompt ...wwv_page_plugs
create or replace package wwv_flow_disp_page_plugs as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
--
--    DESCRIPTION
--      Render page plugs.
--
--    SECURITY
--      RESTRICTED, NO GRANTS, NOT A PUBLIC PACKAGE
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   01/12/2000 - Created
--
--------------------------------------------------------------------------------

g_region_id        number;
g_region_static_id varchar2(255);

--==============================================================================

function is_ok_to_display_region (
    p_region_id          in number,
    p_required_patch     in varchar2 default null,
    p_security_scheme    in varchar2,
    p_display_when_type  in varchar2,
    p_display_when_cond  in varchar2,
    p_display_when_cond2 in varchar2,
    p_customized         in varchar2 )
    return boolean;

--==============================================================================
procedure get_pagination_data (
    p_region_id  in number,
    p_min_row    out number,
    p_max_row    out number,
    p_total_rows out number,
    p_add_rows   out number,
    p_has_state  out boolean );

--==============================================================================
procedure set_pagination_data (
    p_region_id  in number,
    p_min_row    in number default null,
    p_max_row    in number default null,
    p_total_rows in number default null,
    p_add_rows   in number default null,
    p_total_diff in number default null );

--==============================================================================
procedure set_region_pagination (
    p_region_pagination_type in varchar2,
    p_region_id in number,
    p_min_row   in out number,
    p_max_row   in out number );

--==============================================================================
procedure reset_region_pagination (
    p_request   in varchar2 default null );

--==============================================================================
procedure reset_region_pagination (
    p_region_id in number );
--==============================================================================
procedure reset_pagination_by_page (
    p_flow_id in number,
    p_page_id in number );
--
--==============================================================================
procedure set_report_using_request (
    p_page_id          in number,
    p_request          in varchar2 default null );

--==============================================================================
-- Clears all of the regions for the current app page.
-- Only report regions are supported at this time.
-- This clears report pagination and IR settings.
--
-- PARAMETERS
-- * p_request  If clearing sepecific region saved report,
--              the region and saved report alias gets passed
--              as part of REQUEST (i.e. IR[region static ID]_REPORTALIAS).
procedure clear (
    p_request    in varchar2 default null );

--==============================================================================
-- Resets all of the regions for the current app page.
-- Only report regions are supported at this time.
-- This resets report pagination, CR sort, IR and IG report settings.
--
-- PARAMETERS
-- * p_request  If resetting sepecific region saved report,
--              the region and saved report alias gets passed
--              as part of REQUEST (i.e. IR[region static ID]_REPORTALIAS).
procedure reset (
    p_request    in varchar2 default null );

--==============================================================================
-- Internal:
--
-- Renders a region and its content, including all slots and components,
-- adhering to the specified grid settings.
--
-- Parameters:
-- * p_region:                 The region object to be rendered.
-- * p_grid_template:          The grid template to be used for rendering the region.
-- * p_has_grid_support:       Indicates if the current rendering context supports grid.
-- * p_max_fixed_grid_columns: The maximum number of fixed columns supported within the grid.
-- * p_parent_is_read_only:    Indicates if the parent container is in read-only mode.
--
-- Example:

-- begin
--     ...
--     wwv_flow_disp_page_plugs.render_region (
--         p_region                 => wwv_flow_meta_data.g_plugs(l_idx),
--         p_grid_template          => p_grid_template,
--         p_has_grid_support       => p_slot.has_grid_support,
--         p_max_fixed_grid_columns => l_iterator.component_column_span,
--         p_parent_is_read_only    => p_parent_is_read_only );
-- end;
--==============================================================================
procedure render_region (
    p_region                 in out nocopy wwv_flow_meta_data.t_plug,
    p_grid_template          in wwv_flow_template.t_grid_template,
    p_has_grid_support       in boolean,
    p_max_fixed_grid_columns in pls_integer,
    p_parent_is_read_only    in boolean );

end wwv_flow_disp_page_plugs;
/
show errors
