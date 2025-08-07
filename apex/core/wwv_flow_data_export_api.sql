set define '^' verify off
prompt ...wwv_flow_data_export_api
create or replace package wwv_flow_data_export_api authid current_user
as
--------------------------------------------------------------------------------
--  Copyright (c) 2020, 2024, Oracle and/or its affiliates.
--
-- The `APEX_DATA_EXPORT` package contains the implementation to export data from
-- Oracle APEX. Supported file types include: PDF, XLSX, HTML, CSV,
-- XML and JSON.
--
-- Use the `EXPORT` function to pass a query context from the `APEX_EXEC` package
-- and return the `t_export` type, which includes the contents in a LOB.
--------------------------------------------------------------------------------

--##############################################################################
-- Data Types
-- The `APEX_DATA_EXPORT` package uses the following data types.
--##############################################################################
--
--------------------------------------------------------------------------------
-- Generic Data Types
--------------------------------------------------------------------------------
subtype t_alignment             is varchar2(255);
subtype t_label                 is varchar2(32767);
subtype t_color                 is varchar2(4000);
subtype t_format                is varchar2(20);
subtype t_content_disposition   is varchar2(30);
subtype t_unit                  is varchar2(4000);
subtype t_size                  is varchar2(4000);
subtype t_width_unit            is varchar2(255);
subtype t_orientation           is varchar2(4000);
subtype t_font_family           is varchar2(4000);
subtype t_font_weight           is varchar2(4000);

--------------------------------------------------------------------------------
-- Resulting Object of an Export.
--
-- Attributes:
-- * file_name:
-- * format:
-- * mime_type:
-- * as_clob:
-- * content_blob:
-- * content_clob:
--------------------------------------------------------------------------------
type t_export is record (
    file_name    varchar2(32767),
    format       t_format,
    mime_type    varchar2(32767),
    row_count    number,
    as_clob      boolean,
    content_blob blob,
    content_clob clob );
--
--------------------------------------------------------------------------------
-- Column Group definition.
--
-- Attributes:
-- * name:
-- * alignment:
-- * parent_group_idx:
--------------------------------------------------------------------------------
type t_column_group is record (
    name             varchar2(255),
    alignment        t_alignment,
    parent_group_idx pls_integer );

--------------------------------------------------------------------------------
-- Array of column group definitions.
--------------------------------------------------------------------------------
type t_column_groups is table of t_column_group  index by pls_integer;

--------------------------------------------------------------------------------
-- Column definition.
--
-- Attributes:
-- * name:
-- * heading:
-- * format_mask:
-- * heading_alignment:
-- * value_alignment:
-- * width:
-- * is_column_break:
-- * is_frozen:
-- * column_group_idx:
--------------------------------------------------------------------------------
type t_column is record (
    name              wwv_flow_exec_api.t_column_name,
    heading           t_label,
    format_mask       varchar2(4000),
    heading_alignment t_alignment,
    value_alignment   t_alignment,
    width             number,
    is_column_break   boolean,
    is_frozen         boolean,
    column_group_idx  pls_integer );

--------------------------------------------------------------------------------
-- Collection of column definitions.
--------------------------------------------------------------------------------
type t_columns is table of t_column index by pls_integer;

--------------------------------------------------------------------------------
-- Highlight definition.
--
-- Attributes:
-- * id:
-- * name:
-- * value_column:
-- * display_column:
-- * text_color:
-- * background_color:
--------------------------------------------------------------------------------
type t_highlight is record (
    id               number,
    name             varchar2(4000),
    value_column     wwv_flow_exec_api.t_column_name,
    display_column   wwv_flow_exec_api.t_column_name,
    text_color       t_color,
    background_color t_color );

--------------------------------------------------------------------------------
-- Collection of highlight definitions.
--------------------------------------------------------------------------------
type t_highlights is table of t_highlight index by pls_integer;

--------------------------------------------------------------------------------
-- Aggregate definition.
--
-- Attributes:
-- * label:
-- * format_mask:
-- * display_column:
-- * value_column:
-- * overall_label:
-- * overall_value_column:
--------------------------------------------------------------------------------
type t_aggregate is record (
    label                t_label,
    format_mask          varchar2(4000),
    display_column       wwv_flow_exec_api.t_column_name,
    value_column         wwv_flow_exec_api.t_column_name,
    overall_label        t_label,
    overall_value_column wwv_flow_exec_api.t_column_name );

--------------------------------------------------------------------------------
-- Collection of aggregate definitions.
--------------------------------------------------------------------------------
type t_aggregates is table of t_aggregate index by pls_integer;

--------------------------------------------------------------------------------
-- Print Configuration.
--
-- Attributes:
-- * units:
-- * paper_size:
-- * width_units:
-- * width:
-- * height:
-- * orientation:
-- * page_header:
-- * page_header_font_color:
-- * page_header_font_family:
-- * page_header_font_weight:
-- * page_header_font_size:
-- * page_header_alignment:
-- * page_footer:
-- * page_footer_font_color:
-- * page_footer_font_family:
-- * page_footer_font_weight:
-- * page_footer_font_size:
-- * page_footer_alignment:
-- * header_bg_color:
-- * header_font_color:
-- * header_font_family:
-- * header_font_weight:
-- * header_font_size:
-- * body_bg_color:
-- * body_font_color:
-- * body_font_family:
-- * body_font_weight:
-- * body_font_size:
-- * border_width:
-- * border_color:
--------------------------------------------------------------------------------
type t_print_config is record (
    units                   t_unit,
    paper_size              t_size,
    width_units             t_width_unit,
    width                   number,
    height                  number,
    orientation             t_orientation,
    page_header             varchar2(4000),
    page_header_font_color  t_color,
    page_header_font_family t_font_family,
    page_header_font_weight t_font_weight,
    page_header_font_size   varchar2(4000),
    page_header_alignment   t_alignment,
    page_footer             varchar2(4000),
    page_footer_font_color  t_color,
    page_footer_font_family t_font_family,
    page_footer_font_weight t_font_weight,
    page_footer_font_size   varchar2(4000),
    page_footer_alignment   t_alignment,
    header_bg_color         t_color,
    header_font_color       t_color,
    header_font_family      t_font_family,
    header_font_weight      t_font_weight,
    header_font_size        varchar2(4000),
    body_bg_color           t_color,
    body_font_color         t_color,
    body_font_family        t_font_family,
    body_font_weight        t_font_weight,
    body_font_size          varchar2(4000),
    border_width            number,
    border_color            t_color );

--##############################################################################
-- Global Constants:
--##############################################################################
--
--------------------------------------------------------------------------------
-- Empty Default Value Constants
--
-- Constants used as default value for empty values or arrays.
--------------------------------------------------------------------------------
c_empty_column_groups /* constant */  t_column_groups; -- An empty list of column groups.
c_empty_columns       /* constant */  t_columns;       -- An empty list of columns.
c_empty_highlights    /* constant */  t_highlights;    -- An empty list of highlights.
c_empty_aggregates    /* constant */  t_aggregates;    -- An empty list of aggregates.
c_empty_print_config  /* constant */  t_print_config;  -- An empty print configuration.
--
--------------------------------------------------------------------------------
-- Export Format Constants
--------------------------------------------------------------------------------
c_format_csv                    constant t_format               := 'CSV';   -- Output from the [`EXPORT`]() function will be in Comma Separated Values format.
c_format_html                   constant t_format               := 'HTML';  -- Output from the [`EXPORT`]() function will be in HTML format.
c_format_pdf                    constant t_format               := 'PDF';   -- Output from the [`EXPORT`]() function will be in the Portable Document format.
c_format_xlsx                   constant t_format               := 'XLSX';  -- Output from the [`EXPORT`]() function will be in Microsoft Excel Spreadsheet format.
c_format_xml                    constant t_format               := 'XML';   -- Output from the [`EXPORT`]() function will be in Extensible Markup Language format.
c_format_pxml                   constant t_format               := 'PXML';  -- Output from the [`EXPORT`]() function will be in Pandora XML format. This format is optimized for printing.
c_format_json                   constant t_format               := 'JSON';  -- Output from the [`EXPORT`]() function will be in JavaScript Object Notation format.
c_format_pjson                  constant t_format               := 'PJSON'; -- Output from the [`EXPORT`]() function will be in PrettyJSON format. This format is optimized for printing.
--
--------------------------------------------------------------------------------
-- Alignment Constants
--------------------------------------------------------------------------------
c_align_start                   constant t_alignment            := 'LEFT';   -- Align the content to the left. Used in the [`ADD_COLUMN`](), [`ADD_COLUMN_GROUP`](), and [`GET_PRINT_CONFIG`]() methods.
c_align_center                  constant t_alignment            := 'CENTER'; -- Align the content in centre position. Used in the [`ADD_COLUMN`](), [`ADD_COLUMN_GROUP`](), and [`GET_PRINT_CONFIG`]() methods.
c_align_end                     constant t_alignment            := 'RIGHT';  -- Align the content to the right. Used in the [`ADD_COLUMN`](), [`ADD_COLUMN_GROUP`](), and [`GET_PRINT_CONFIG`]() methods.
--------------------------------------------------------------------------------
-- Content Disposition Constants
--------------------------------------------------------------------------------
c_attachment                    constant t_content_disposition  := 'attachment'; -- Download the content as file. Used in the [`DOWNLOAD`]() procedure.
c_inline                        constant t_content_disposition  := 'inline';     -- Display the content inside the browser window. Used in the [`DOWNLOAD`]() procedure.
--
--------------------------------------------------------------------------------
-- Size Unit Constants
--------------------------------------------------------------------------------
c_unit_inches                   constant t_unit                 := 'INCHES';      -- Defines the size unit to specify page width and height as inches. Used in the [`GET_PRINT_CONFIG`]() function.
c_unit_millimeters              constant t_unit                 := 'MILLIMETERS'; -- Defines the size unit to specify page width and height as millimeters. Used in the [`GET_PRINT_CONFIG`]() function.
c_unit_centimeters              constant t_unit                 := 'CENTIMETERS'; -- Defines the size unit to specify page width and height as centimeters. Used in the [`GET_PRINT_CONFIG`]() function.
c_unit_points                   constant t_unit                 := 'POINTS';      -- Defines the size unit to specify page width and height as points. Used in the [`GET_PRINT_CONFIG`]() function.
--
--------------------------------------------------------------------------------
-- Predefined Size Constants
--------------------------------------------------------------------------------
c_size_letter                   constant t_size                 := 'LETTER';  -- Defines the report page size as letter size (8.5 x 11 inches). Used in the [`GET_PRINT_CONFIG`]() function.
c_size_legal                    constant t_size                 := 'LEGAL';   -- Defines the report page size as legal size (8.5 x 14 inches). Used in the [`GET_PRINT_CONFIG`]() function.
c_size_tabloid                  constant t_size                 := 'TABLOID'; -- Defines the report page size as tabloid size (11 x 17 inches). Used in the [`GET_PRINT_CONFIG`]() function.
c_size_A4                       constant t_size                 := 'A4';      -- Defines the report page size as A4 size (8.3 x 11.7 inches). Used in the [`GET_PRINT_CONFIG`]() function.
c_size_A3                       constant t_size                 := 'A3';      -- Defines the report page size as A3 size (11.7 x 16.5 inches). Used in the [`GET_PRINT_CONFIG`]() function.
c_size_custom                   constant t_size                 := 'CUSTOM';  -- Defines the report page size as custom size. Used in the [`GET_PRINT_CONFIG`]() function.
--------------------------------------------------------------------------------
-- Column Width Unit Constants
--------------------------------------------------------------------------------
c_width_unit_percentage         constant t_width_unit           := 'PERCENTAGE'; -- Defines the unit used to specify column width as percentage. Used in the [`GET_PRINT_CONFIG`]() function.
c_width_unit_points             constant t_width_unit           := 'POINTS';     -- Defines the unit used to specify column width as points. Used in the [`GET_PRINT_CONFIG`]() function.
c_width_unit_pixels             constant t_width_unit           := 'PIXELS';     -- Defines the unit used to specify column width as pixels. Used in the [`GET_PRINT_CONFIG`]() function.
--
--------------------------------------------------------------------------------
-- Page Orientation Constants
--------------------------------------------------------------------------------
c_orientation_portrait          constant t_orientation          := 'VERTICAL';   -- Defines the page orientation as vertical (portrait) orientation. Used in the [`GET_PRINT_CONFIG`]() function.
c_orientation_landscape         constant t_orientation          := 'HORIZONTAL'; -- Defines the page orientation as horizontal (landscape) orientation. Used in the [`GET_PRINT_CONFIG`]() function.
--
--------------------------------------------------------------------------------
-- Font Family Constants
--------------------------------------------------------------------------------
c_font_family_helvetica         constant t_font_family          := 'Helvetica'; -- Defines the font family to be used as Helvetica, a sans-serif typeface. Used in the [`GET_PRINT_CONFIG`]() function.
c_font_family_times             constant t_font_family          := 'Times';     -- Defines the font family to be used as Times, a serif typeface. Used in the [`GET_PRINT_CONFIG`]() function.
c_font_family_courier           constant t_font_family          := 'Courier';   -- Defines the font family to be used as Courier, a monospaced typeface. Used in the [`GET_PRINT_CONFIG`]() function.
--
--------------------------------------------------------------------------------
-- Font Weight Constants
--------------------------------------------------------------------------------
c_font_weight_normal            constant t_font_weight          := 'normal'; -- Defines the weight of the font to be used as normal (400). Used in the [`GET_PRINT_CONFIG`]() function.
c_font_weight_bold              constant t_font_weight          := 'bold';   -- Defines the weight of the font to be used as bold (700). Used in the [`GET_PRINT_CONFIG`]() function.

--==============================================================================
-- This procedure adds a column group to the column group collection. Column group
-- collections can be passed to the [`EXPORT`]() calls in order to group columns using
-- an extra header row. If an empty column group collection (or no column group
-- collection) passes, no column groups are added to the export. You can create
-- multiple column group levels.
--
-- Parameters:
-- * p_column_groups:    Column group collection.
-- * p_idx:              The generated index in the columns collection.
-- * p_name:             Column group name.
-- * p_alignment:        Column group alignment. See C_ALIGN_* constants.
-- * p_parent_group_idx: The index of a parent column group.
--
--
-- Example:
--
--     declare
--         l_context          apex_exec.t_context;
--
--         l_export           apex_data_export.t_export;
--         l_column_groups    apex_data_export.t_column_groups;
--         l_columns          apex_data_export.t_columns;
--
--         -- Column group indexes
--         l_identity_idx     pls_integer;
--         l_compensation_idx pls_integer;
--     begin
--
--         l_context := apex_exec.open_query_context(
--                          p_location  => apex_exec.c_location_local_db,
--                          p_sql_query => 'select * from emp' );
--
--         -- Define column groups
--         apex_data_export.add_column_group(
--             p_column_groups => l_column_groups,
--             p_idx           => l_identity_idx,
--             p_name          => 'Identity' );
--
--         apex_data_export.add_column_group(
--             p_column_groups => l_column_groups,
--             p_idx           => l_compensation_idx,
--             p_name          => 'Compensation' );
--
--         -- Define columns
--         apex_data_export.add_column(
--             p_columns          => l_columns,
--             p_name             => 'ENAME',
--             p_heading          => 'Name',
--             p_column_group_idx => l_identity_idx );
--
--         apex_data_export.add_column(
--             p_columns          => l_columns,
--             p_name             => 'JOB',
--             p_heading          => 'Job',
--             p_column_group_idx => l_identity_idx );
--
--         apex_data_export.add_column(
--             p_columns          => l_columns,
--             p_name             => 'SAL',
--             p_heading          => 'Salary',
--             p_column_group_idx => l_compensation_idx );
--
--         apex_data_export.add_column(
--             p_columns          => l_columns,
--             p_name             => 'COMM',
--             p_heading          => 'Commission',
--             p_column_group_idx => l_compensation_idx );
--
--         l_export := apex_data_export.export (
--             p_context       => l_context,
--             p_format        => apex_data_export.c_format_html,
--             p_columns       => l_columns,
--             p_column_groups => l_column_groups,
--             p_file_name     => 'employees' );
--
--         apex_exec.close( l_context );
--
--         apex_data_export.download( p_export => l_export );
--
--     exception
--         when others THEN
--             apex_exec.close( l_context );
--             raise;
--     end;
--==============================================================================
procedure add_column_group (
    p_column_groups     in out nocopy t_column_groups,
    p_idx               out           pls_integer,
    p_name              in            varchar2,
    p_alignment         in            t_alignment     default c_align_center,
    p_parent_group_idx  in            pls_integer     default null );

--==============================================================================
-- This procedure adds a column to the column collection. Column collections can
-- be passed  to the [`EXPORT`]() calls in order to return only a subset of the columns
-- in the export.  If an empty column collection (or no column collection) passes,
-- all columns defined in the Query Context are added to the export.
--
-- Parameters:
-- * p_columns:           Column collection.
-- * p_name:              Column name.
-- * p_heading:           Column heading text.
-- * p_format_mask:       Format mask to apply. Useful for XLSX exports where native
--                        data types are used.
-- * p_heading_alignment: Column heading alignment. Valid values are: `LEFT`, `CENTER`, `RIGHT`.
--                        See also C_ALIGN_* constants.
-- * p_value_alignment:   Column value alignment. Valid values are: `LEFT`, `CENTER`, `RIGHT`.
--                        See also C_ALIGN_* constants.
-- * p_width:             PDF only. The column width. By default the units are as
--                        percentage. The units can be modified by updating the
--                        width_units of the print config.
-- * p_is_column_break:   Whether to use this column for control breaks.
-- * p_is_frozen:         XLSX only. Whether the column is frozen.
-- * p_column_group_idx:  The index of a column group. If used, this column
--                        will part of the column group.
--
-- Example:
--
--     declare
--         l_context apex_exec.t_context;
--
--         l_export  apex_data_export.t_export;
--         l_columns apex_data_export.t_columns;
--     begin
--
--         l_context := apex_exec.open_query_context(
--                          p_location  => apex_exec.c_location_local_db,
--                          p_sql_query => 'select * from emp' );
--
--         apex_data_export.add_column(
--             p_columns     => l_columns,
--             p_name        => 'ENAME',
--             p_heading     => 'Name' );
--
--         apex_data_export.add_column(
--             p_columns     => l_columns,
--             p_name        => 'JOB',
--             p_heading     => 'Job' );
--
--         apex_data_export.add_column(
--             p_columns     => l_columns,
--             p_name        => 'SAL',
--             p_heading     => 'Salary',
--             p_format_mask => 'FML999G999G999G999G990D00' );
--
--         l_export := apex_data_export.export(
--             p_context     => l_context,
--             p_format      => apex_data_export.c_format_html,
--             p_columns     => l_columns,
--             p_file_name   => 'employees' );
--
--         apex_exec.close( l_context );
--
--         apex_data_export.download(
--             p_export => l_export );
--
--     exception
--         WHEN others THEN
--             apex_exec.close( l_context );
--             raise;
--     end;
--==============================================================================
procedure add_column (
    p_columns               in out nocopy t_columns,
    p_name                  in            wwv_flow_exec_api.t_column_name,
    p_heading               in            varchar2                        default null,
    p_format_mask           in            varchar2                        default null,
    p_heading_alignment     in            t_alignment                     default null,
    p_value_alignment       in            t_alignment                     default null,
    p_width                 in            number                          default null,
    p_is_column_break       in            boolean                         default false,
    p_is_frozen             in            boolean                         default false,
    p_column_group_idx      in            pls_integer                     default null );

--==============================================================================
-- This procedure adds a highlight to the highlight collection. Highlight collections
-- can  be passed to the [`EXPORT`]() calls in order to highlight a row or a column in a row.
-- If no highlight collection (or an empty highlight collection) is passed,
-- no highlights render in the export.
--
-- This procedure requires a highlight column. The value is the ID when highlights
-- should be applied, else NULL.
--
-- Parameters:
-- * p_highlights:       Highlight collection.
-- * p_id:               ID of the highlight.
-- * p_value_column:     Name of the column where to check for the highlight ID.
-- * p_display_column:   Name of the column where to display the highlight.
--                       Leave empty for row highlights.
-- * p_text_color:       Hex color code of the text (`#FF0000`).
-- * p_background_color: Hex color code of the background. (`#FF0000`).
--
--
-- Example:
--
--     declare
--         l_highlights apex_data_export.t_highlights;
--         l_context    apex_exec.t_context;
--         l_export     apex_data_export.t_export;
--     begin
--         apex_data_export.add_highlight(
--             p_highlights     => l_highlights,
--             p_id             => 1,
--             p_value_column   => 'HIGHLIGHT1',
--             p_display_column => 'SAL',
--             p_text_color     => '#FF0000' );
--
--         l_context := apex_exec.open_query_context(
--                          p_location    => apex_exec.c_location_local_db,
--                          p_sql_query   => 'select empno,
--                                                   ename,
--                                                   sal,
--                                                   case when sal >= 3000 then 1 end as highlight1
--                                              from emp' );
--
--         l_export := apex_data_export.export(
--                         p_context    => l_context,
--                         p_format     => apex_data_export.c_format_pdf,
--                         p_highlights => l_highlights );
--
--         apex_exec.close( l_context );
--
--         apex_data_export.download(
--             p_export => l_export );
--
--     exception
--         when others THEN
--             apex_exec.close( l_context );
--             raise;
--     end;
--==============================================================================
procedure add_highlight (
    p_highlights        in out nocopy t_highlights,
    p_id                in            pls_integer,
    p_value_column      in            wwv_flow_exec_api.t_column_name,
    p_display_column    in            wwv_flow_exec_api.t_column_name default null,
    p_text_color        in            t_color                         default null,
    p_background_color  in            t_color                         default null );

--==============================================================================
-- This procedure adds an aggregate to the aggregate collection. Aggregate collections
-- can be passed to the  [`EXPORT`]() calls in order to add an aggregate row. This procedure
-- can be used in combination with control breaks or standalone for overall aggregates.
-- If an empty aggregate collection (or no aggregate collection) is passed,
-- no aggregate rows render in the export.
--
-- This procedure requires an aggregate column. Value is the current aggregate
-- total (for control breaks) or the overall total.
--
-- Parameters:
-- * p_aggregates:           Aggregate collection.
-- * p_label:                Aggregate label.
-- * p_format_mask:          Format mask to apply on the aggregate value.
-- * p_display_column:       Name of the column where to display the aggregate
-- * p_value_column:         Name of the column which contains the value of the aggregate.
-- * p_overall_label:        Overall label.
-- * p_overall_value_column: Name of the column which contains the value of the
--                           overall aggregate.
--
--
-- Example:
--
--     declare
--         l_aggregates apex_data_export.t_aggregates;
--         l_columns    apex_data_export.t_columns;
--         l_context    apex_exec.t_context;
--         l_export     apex_data_export.t_export;
--     begin
--         apex_data_export.add_aggregate(
--             p_aggregates           => l_aggregates,
--             p_label                => 'Sum',
--             p_format_mask          => 'FML999G999G999G999G990D00',
--             p_display_column       => 'SAL',
--             p_value_column         => 'AGGREGATE1',
--             p_overall_label        => 'Total sum',
--             p_overall_value_column => 'OVERALL1' );
--
--         apex_data_export.add_column( p_columns => l_columns, p_name => 'DEPTNO', p_is_column_break => true );
--         apex_data_export.add_column( p_columns => l_columns, p_name => 'EMPNO');
--         apex_data_export.add_column( p_columns => l_columns, p_name => 'ENAME');
--         apex_data_export.add_column( p_columns => l_columns, p_name => 'SAL');
--
--         l_context := apex_exec.open_query_context(
--                          p_location  => apex_exec.c_location_local_db,
--                          p_sql_query => 'select deptno,
--                                                 empno,
--                                                 ename,
--                                                 sal,
--                                                 sum( sal) over ( partition by deptno ) as aggregate1,
--                                                 sum( sal) over ( ) as overall1
--                                            from emp
--                                           order by deptno' );
--
--         l_export := apex_data_export.export(
--             p_context      => l_context,
--             p_format       => apex_data_export.c_format_pdf,
--             p_columns      => l_columns,
--             p_aggregates   => l_aggregates );
--
--         apex_exec.close( l_context );
--
--         apex_data_export.download(
--             p_export => l_export );
--
--     exception
--         WHEN others THEN
--             apex_exec.close( l_context );
--             raise;
--     end;
--==============================================================================
procedure add_aggregate(
    p_aggregates            in out nocopy t_aggregates,
    p_label                 in            t_label,
    p_format_mask           in            varchar2                        default null,
    p_display_column        in            wwv_flow_exec_api.t_column_name,
    p_value_column          in            wwv_flow_exec_api.t_column_name,
    p_overall_label         in            t_label                         default null,
    p_overall_value_column  in            wwv_flow_exec_api.t_column_name default null );

--==============================================================================
-- This function prepares the print config to style the data export.
--
-- - The colors are specified using hexadecimal (hex) notation, RGB color codes,
--   or HTML color names.
-- - The alignment options include: left, center, right
-- - The font family options include: Helvetica, Times, Courier
-- - The font weight options include: Normal, Bold
--
-- Parameters:
-- * p_units:                   Select the units used to specify page width and height.
--                              See `C_UNIT_*` constants.
-- * p_paper_size:              PDF only. Select the report page size.
--                              To type in your own page width and height, select Custom.
--                              See `C_SIZE_*` constants.
-- * p_width_units:             PDF only. Select the units used to specify column widths.
--                              See `C_WIDTH_UNIT_*` constants.
-- * p_width:                   PDF only. The width of the page.
-- * p_height:                  PDF only. The height of the page.
-- * p_orientation:             The orientation for the page. PDF only.
--                              See `C_ORIENTATION_*` constants.
-- * p_page_header:             Text to appear in the header section of the document.
-- * p_page_header_font_color:  The page header font color.
-- * p_page_header_font_family: The page header font family. See `C_FONT_FAMILY_*` constants.
-- * p_page_header_font_weight: The page header font weight. See `C_FONT_WEIGHT_*` constants.
-- * p_page_header_font_size:   The page header font size.
-- * p_page_header_alignment:   The page header text alignment. See `C_ALIGN_*` constants.
-- * p_page_footer_font_size:   The page footer font size.
-- * p_page_footer:             Text to appear in the footer section of the document.
-- * p_page_footer_font_color:  The page footer font color.
-- * p_page_footer_font_family: The page footer font family. See `C_FONT_FAMILY_*` constants.
-- * p_page_footer_font_weight: The page footer font weight. See `C_FONT_WEIGHT_*` constants.
-- * p_page_footer_font_size:   The page footer font size.
-- * p_page_footer_alignment:   The page footer text alignment. See `C_ALIGN_*` constants.
-- * p_header_bg_color:         The table header background color.
-- * p_header_font_color:       The table header font color.
-- * p_header_font_family:      The table header font family. See `C_FONT_FAMILY_*` constants.
-- * p_header_font_weight:      The table header font weight. See `C_FONT_WEIGHT_*` constants.
-- * p_header_font_size:        The table header font size.
-- * p_body_bg_color:           The table body background color.
-- * p_body_font_color:         The table body font color.
-- * p_body_font_family:        The table body font family. See `C_FONT_FAMILY_*` constants.
-- * p_body_font_weight:        The table body font weight. See `C_FONT_WEIGHT_*` constants.
-- * p_body_font_size:          The table body font size.
-- * p_border_width:            The width of the borders.
-- * p_border_color:            The color of the borders.
--
-- Returns:
-- The print config to style the data export.
--
-- Example:
--
--     declare
--         l_context      apex_exec.t_context;
--         l_print_config apex_data_export.t_print_config;
--         l_export       apex_data_export.t_export;
--     begin
--         l_context      := apex_exec.open_query_context(
--                               p_location  => apex_exec.c_location_local_db,
--                               p_sql_query => 'select * from emp' );
--
--         l_print_config := apex_data_export.get_print_config(
--                               p_orientation  => apex_data_export.c_orientation_portrait,
--                               p_border_width => 2 );
--
--         l_export       := apex_data_export.export(
--                               p_context      => l_context,
--                               p_print_config => l_print_config,
--                               p_format       => apex_data_export.c_format_pdf );
--
--         apex_exec.close( l_context );
--
--      apex_data_export.download(
--          p_export => l_export );
--
--     exception
--         when others THEN
--             apex_exec.close( l_context );
--             raise;
--     end;
--==============================================================================
function get_print_config(
    p_units                   in t_unit         default c_unit_inches,
    p_paper_size              in t_size         default c_size_letter,
    p_width_units             in t_width_unit   default c_width_unit_percentage,
    p_width                   in number         default 11,
    p_height                  in number         default 8.5,
    p_orientation             in t_orientation  default c_orientation_landscape,
    --
    p_page_header             in varchar2       default null,
    p_page_header_font_color  in t_color        default '#000000',
    p_page_header_font_family in t_font_family  default c_font_family_helvetica,
    p_page_header_font_weight in t_font_weight  default c_font_weight_normal,
    p_page_header_font_size   in number         default 12,
    p_page_header_alignment   in t_alignment    default c_align_center,
    --
    p_page_footer             in varchar2       default null,
    p_page_footer_font_color  in t_color        default '#000000',
    p_page_footer_font_family in t_font_family  default c_font_family_helvetica,
    p_page_footer_font_weight in t_font_weight  default c_font_weight_normal,
    p_page_footer_font_size   in number         default 12,
    p_page_footer_alignment   in t_alignment    default c_align_center,
    --
    p_header_bg_color         in t_color        default '#EEEEEE',
    p_header_font_color       in t_color        default '#000000',
    p_header_font_family      in t_font_family  default c_font_family_helvetica,
    p_header_font_weight      in t_font_weight  default c_font_weight_bold,
    p_header_font_size        in number         default 10,
    --
    p_body_bg_color           in t_color        default '#FFFFFF',
    p_body_font_color         in t_color        default '#000000',
    p_body_font_family        in t_font_family  default c_font_family_helvetica,
    p_body_font_weight        in t_font_weight  default c_font_weight_normal,
    p_body_font_size          in number         default 10,
    --
    p_border_width            in number         default .5,
    p_border_color            in t_color        default '#666666' ) return t_print_config;

--==============================================================================
-- This function exports the query context in the specified format.
--
-- Parameters:
-- * p_context:                	Context object from the EXEC infrastructure.
-- * p_format:                  Export format. See `C_FORMAT_*` constants.
-- * p_as_clob:                 Exports as a CLOB instead of BLOB (default `FALSE`).
-- * p_columns:                 Collection of column attributes beginning with
--                              column breaks, then in the order of display.
-- * p_column_groups:           Collection of column group attributes in the order
--                              of levels and display.
-- * p_aggregates:              Collection of aggregates.
-- * p_highlights:              Collection of highlights.
-- * p_file_name:             	Defines the file name of the export.
-- * p_print_config:            Used for EXCEL and PDF to set the print attributes.
-- * p_page_header:             Text to appear in the header section of the document.
--                              Overrides the page header from `p_print_config`.
-- * p_page_footer:             Text to appear in the footer section of the document.
--                              Overrides the page footer from `p_print_config`.
-- * p_supplemental_text:       Text at the top of all download formats.
-- * p_csv_enclosed_by:         Used for CSV to enclose the output.
-- * p_csv_separator:           Used for CSV to separate the column values.
-- * p_pdf_accessible:          Used for PDF to create an accessible PDF.
-- * p_xml_include_declaration: Used for XML to generate the XML declaration as the first line.
--
-- Returns:
--
-- The export file as object which includes the contents, MIME type, and file name.
--
-- Example:
--
--     declare
--         l_context apex_exec.t_context;
--         l_export  apex_data_export.t_export;
--     begin
--         l_context := apex_exec.open_query_context(
--                          p_location  => apex_exec.c_location_local_db,
--                          p_sql_query => 'select * from emp' );
--
--         l_export := apex_data_export.export(
--                         p_context => l_context,
--                         p_format  => apex_data_export.c_format_pdf );
--
--         apex_exec.close( l_context );
--
--         apex_data_export.download(
--             p_export => l_export );
--     exception
--         when others THEN
--             apex_exec.close( l_context );
--             raise;
--     end;
--
-- See Also:
-- ADD_AGGREGATE
-- ADD_COLUMN
-- ADD_COLUMN_GROUP
-- ADD_HIGHLIGHT
-- GET_PRINT_CONFIG
--==============================================================================
function export (
    p_context                 in wwv_flow_exec_api.t_context,
    p_format                  in t_format,
    p_as_clob                 in boolean                      default false,
    p_columns                 in t_columns                    default c_empty_columns,
    p_column_groups           in t_column_groups              default c_empty_column_groups,
    p_aggregates              in t_aggregates                 default c_empty_aggregates,
    p_highlights              in t_highlights                 default c_empty_highlights,
    --
    p_file_name               in varchar2                     default null,
    p_print_config            in t_print_config               default c_empty_print_config,
    p_page_header             in varchar2                     default null,
    p_page_footer             in varchar2                     default null,
    p_supplemental_text       in varchar2                     default null,
    --
    p_csv_enclosed_by         in varchar2                     default null,
    p_csv_separator           in varchar2                     default null,
    --
    p_pdf_accessible          in boolean                      default false,
    --
    p_xml_include_declaration in boolean                      default true )
    return t_export;

--==============================================================================
-- This procedure downloads the data export.
--
-- Note:
-- This procedure internally calls `APEX_APPLICATION.STOP_APEX_ENGINE`, if
-- `p_stop_apex_engine` is set to `TRUE` (default). This will stop any further
-- processing after downloading the export.
--
-- Parameters:
-- * p_export:              The result object of an export.
-- * p_content_disposition: Specifies whether to download the print document or
--                          display inline. Use constants `C_ATTACHMENT` and `C_INLINE`.
-- * p_add_file_extension:  Whether APEX should add the file extension to the
--                          filename based on the export format.
-- * p_stop_apex_engine:    Whether to call `APEX_APPLICATION.STOP_APEX_ENGINE`.
--
--
-- Example:
--
--     declare
--         l_context apex_exec.t_context;
--         l_export  apex_data_export.t_export;
--     begin
--         l_context := apex_exec.open_query_context(
--                          p_location  => apex_exec.c_location_local_db,
--                          p_sql_query => 'select * from emp' );
--
--         l_export := apex_data_export.export(
--                         p_context   => l_context,
--                         p_format    => apex_data_export.c_format_csv,
--                         p_file_name => 'employees' );
--
--         apex_exec.close( l_context );
--
--         apex_data_export.download(
--             p_export => l_export );
--
--     exception
--         when others THEN
--             apex_exec.close( l_context );
--             raise;
--     end;
--==============================================================================
procedure download (
    p_export              in out nocopy t_export,
    p_content_disposition in t_content_disposition default c_attachment,
    p_add_file_extension  in boolean               default true,
    p_stop_apex_engine    in boolean               default true );

end  wwv_flow_data_export_api;
/
show errors
