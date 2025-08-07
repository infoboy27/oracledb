set define off
set verify off

prompt ...wwv_flow_grid_layout

create or replace package wwv_flow_grid_layout
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_grid_layout.sql
--
--    DESCRIPTION
--      This package is responsible for handling grid layouts in the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    05/15/2012 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_grid_component is record (
    idx  binary_integer,
    name varchar2(255) );

type t_grid_components is table of t_grid_component index by pls_integer; -- index: seq increment

type t_column is record (
    no                pls_integer,
    column_span       pls_integer,
    row_span          pls_integer,
    label_column_span pls_integer,
    css_classes       varchar2(255),
    attributes        varchar2(300), /* longer because it will also include alignment for table based layout */
    components        t_grid_components,
    is_emitted        boolean := false );

type t_columns is table of t_column  index by pls_integer; -- index: seq increment

type t_row is record (
    cols           t_columns,
    css_classes    varchar2(255),
    is_emitted     boolean     := false,
    next_column_no pls_integer := 1 );

type t_rows is table of t_row index by pls_integer; -- index: seq increment

type t_grid is record (
    max_columns          pls_integer,
    attributes           varchar2(255),
    rows                 t_rows,
    has_to_be_rendered   boolean     := null,
    is_emitted           boolean     := false );

type t_grids is table of t_grid index by pls_integer; -- index: seq increment

type t_iterator is record (
    component_idx         binary_integer,
    component_column_span pls_integer,
    is_finished           boolean        := true,
    -- internal info
    grids                 t_grids,
    grid_idx              pls_integer,
    grid_row_idx          pls_integer,
    grid_column_idx       pls_integer,
    grid_component_idx    pls_integer,
    grid_template         wwv_flow_template.t_grid_template );

type t_component is record (
    name               varchar2(255),
    type               varchar2(10),
    original_idx       binary_integer,
    item_type          varchar2(255),
    is_ok_to_display   boolean,
    is_new_grid        boolean,
    is_new_row         boolean,
    row_css_classes    varchar2(255),
    is_new_column      boolean,
    column_no          pls_integer,
    column_span        pls_integer,
    row_span           pls_integer,
    label_column_span  pls_integer,
    column_css_classes varchar2(255),
    column_attributes  varchar2(300) ); /* longer because it will also include alignment for table based layout */

type t_components is table of t_component index by pls_integer;

--==============================================================================
-- Global constants
--==============================================================================
c_component_type_region    constant varchar2(10) := 'REGION';
c_component_type_page_item constant varchar2(10) := 'PAGE_ITEM';
c_component_type_label     constant varchar2(10) := 'LABEL';
c_component_type_button    constant varchar2(10) := 'BUTTON';

c_label_span_not_supported constant pls_integer  := -1;

c_null_iterator t_iterator;
c_empty_vc_arr2 wwv_flow_global.vc_arr2;

--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Parses the layout information of the passed components and calculates
-- the structure of the grids with it's rows and columns. This has to be the
-- first call before actually emitting the grid with emit_open or next_and_emit_close.
--
-- If the grid has completely been emitted, p_iterator.is_finished will be TRUE.
-- The next component which should be displayed is stored in p_iterator.component_idx
-- and is the array index which should be used to access the component in the
-- passed arrays.
--
-- declare
--    l_grid_template wwv_flow_template.t_grid_template,
--    l_slot          wwv_flow_theme.t_slot;
--    l_components    wwv_flow_grid_layout.t_components;
--    l_iterator      wwv_flow_grid_layout.t_iterator;
-- begin
--     wwv_flow_grid_layout.init (
--          p_grid_template   => l_grid_template,
--          p_slot            => l_slot,
--          p_grid_attributes => wwv_flow_meta_data.g_region_table_cattributes,
--          p_components      => l_components,
--          p_iterator        => l_iterator );
--
--     while not l_iterator.is_finished
--     loop
--         if <<is ok to display>> then
--             wwv_flow_grid_layout.emit_open (
--                 p_iterator => l_iterator );
--
--             -- Show component
--             -- ... code ...
--         end if;
--
--         wwv_flow_grid_layout.next_and_emit_close (
--             p_iterator => l_iterator );
--     end loop;
-- end;
--
--==============================================================================
procedure init (
    p_grid_template      in            wwv_flow_template.t_grid_template,
    p_slot               in            wwv_flow_theme.t_slot,
    p_is_always_rendered in            boolean      default null,
    p_grid_attributes    in            varchar2,
    p_components         in            t_components,
    p_iterator           in out nocopy t_iterator );

--==============================================================================
-- Call this procedure if a component should be rendered. It will automatically
-- take care that a grid, grid row and grid column is emitted if necessary.
--==============================================================================
procedure emit_open (
    p_iterator in out nocopy t_iterator );

--==============================================================================
-- This procedure has always to be called in the while loop to close an open grid,
-- grid row or grid column. It will also return the next component in
-- p_iterator.component_idx or set p_iterator.is_finished = TRUE if all components
-- have been processed.
--==============================================================================
procedure next_and_emit_close (
    p_iterator in out nocopy t_iterator );

--==============================================================================
-- Replaces the grid substitution variables in a label template.
--==============================================================================
procedure replace_label_template (
    p_iterator in            t_iterator,
    p_template in out nocopy varchar2 );

--==============================================================================
-- Replaces the grid substitution variables in a before item template.
--==============================================================================
procedure replace_before_item_template (
    p_iterator in            t_iterator,
    p_template in out nocopy varchar2 );
--
end wwv_flow_grid_layout;
/
show errors

set define '^'
