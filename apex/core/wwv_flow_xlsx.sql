set define '^' verify off
prompt ...wwv_flow_xlsx.sql
create or replace package wwv_flow_xlsx as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2020 - 2022. All Rights Reserved.
--
-- NAME
--   wwv_flow_xlsx.sql
--
-- DESCRIPTION
--   Package for creating XSLX files
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
subtype t_alignment             is varchar2( 6 );
subtype t_border_style          is varchar2( 20 );

type t_image_rel_ids            is table of wwv_flow_ooxml.t_rel_id index by wwv_flow_ooxml.t_file_name;

--------------------------------------------------------------------------------
-- XLSX Worksheet Definition
--------------------------------------------------------------------------------
type t_worksheet is record (
    id                          pls_integer,
    worksheet_name              varchar2( 32767 ),
    file_name                   wwv_flow_ooxml.t_file_name,
    sheet_data                  wwv_flow_t_clob_writer,
    table_parts                 wwv_flow_t_varchar2,
    right_to_left               boolean,
    merge_cells                 wwv_flow_t_varchar2,
    current_row                 pls_integer,
    current_column              pls_integer,
    current_row_content         varchar2( 32767 ),
    current_row_height          number,
    current_row_font_size       number,
    current_row_line_count      pls_integer,
    current_row_cell_format     pls_integer,
    row_is_open                 boolean,
    auto_widths                 boolean,
    max_col_width               number,
    max_lines_per_row           pls_integer,
    column_widths               wwv_flow_global.n_arr,
    drawing_rel_id              wwv_flow_ooxml.t_rel_id,
    image_rel_ids               t_image_rel_ids,
    -- OOXML parts
    part_rels                   wwv_flow_ooxml.t_part,
    part_worksheet              wwv_flow_ooxml.t_part,
    part_table                  wwv_flow_ooxml.t_part,
    part_drawing_rels           wwv_flow_ooxml.t_part,
    part_drawing                wwv_flow_ooxml.t_part );

--------------------------------------------------------------------------------
-- XLSX Shared Strings Definition
--------------------------------------------------------------------------------
type t_shared_strings is record (
    string_count                pls_integer,
    ids                         wwv_flow_global.t_bag,
    content                     wwv_flow_t_clob_writer );

--------------------------------------------------------------------------------
-- XLSX Styles Definition
--------------------------------------------------------------------------------
type t_style_section is record (
    style_keys                  wwv_flow_global.t_bag,
    content                     wwv_flow_t_clob_writer );

type t_styles is record (
    fonts                       t_style_section,
    fills                       t_style_section,
    borders                     t_style_section,
    number_formats              t_style_section,
    cell_format                 t_style_section,
    indexed_colors              t_style_section );

--------------------------------------------------------------------------------
-- XLSX Table Definition
--------------------------------------------------------------------------------
type t_tables                   is table of pls_integer index by pls_integer;

--------------------------------------------------------------------------------
-- XLSX Cell Format Definition
--------------------------------------------------------------------------------
type t_cell_format is record (
    font_size                   number,
    number_format               varchar2( 32767 ) );

type t_cell_formats             is table of t_cell_format index by pls_integer;

--------------------------------------------------------------------------------
-- XLSX Workbook Definition
--------------------------------------------------------------------------------
type t_workbook is record (
    ooxml_doc                   wwv_flow_ooxml.t_doc,
    worksheet_names             wwv_flow_t_varchar2,
    shared_strings              t_shared_strings,
    styles                      t_styles,
    tables                      t_tables,
    rel_id                      wwv_flow_ooxml.t_rel_id,
    has_worksheet_relationships boolean,
    cell_formats                t_cell_formats,
    -- OOXML parts
    part_rels                   wwv_flow_ooxml.t_part,
    part_workbook               wwv_flow_ooxml.t_part,
    part_styles                 wwv_flow_ooxml.t_part,
    part_shared_strings         wwv_flow_ooxml.t_part );

subtype t_cell_data_type        is varchar2( 10 );

type t_value is record (
    varchar2_value              varchar2(32767),
    number_value                number,
    date_value                  date,
    timestamp_value             timestamp,
    timestamp_tz_value          timestamp with time zone,
    timestamp_ltz_value         timestamp with local time zone );

type t_cell is record (
    data_type                   t_cell_data_type,
    cell_format                 pls_integer,
    cell_value                  t_value );

type t_row                      is table of t_cell index by pls_integer;

type t_rows                     is table of t_row index by pls_integer;

type t_cell_widths              is table of number index by pls_integer;

-- Row dimensions in pt
type t_row_dimensions is record (
    height                      number,      
    cell_widths                 t_cell_widths );

type t_table_column is record (
    column_name                 varchar2( 23767 ) );

type t_table_columns            is table of t_table_column index by pls_integer;

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
c_align_left                    constant t_alignment := 'left';
c_align_center                  constant t_alignment := 'center';
c_align_right                   constant t_alignment := 'right';


c_border_none                   constant t_border_style := 'none';
c_border_thin                   constant t_border_style := 'thin';
c_border_medium                 constant t_border_style := 'medium';
c_border_thick                  constant t_border_style := 'thick';

c_mime_type                     constant varchar2( 255 ) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';

-- Cell data types
c_boolean                       constant t_cell_data_type := 'b';
c_date                          constant t_cell_data_type := 'd';
c_inline_string                 constant t_cell_data_type := 'inlineStr';
c_number                        constant t_cell_data_type := 'n';
c_shared_string                 constant t_cell_data_type := 's';

--==============================================================================
-- Creates a new workbook
--==============================================================================
function workbook( 
    p_image_placeholder in blob default null )
    return t_workbook;

--==============================================================================
-- Adds a worksheet to a workbook
--==============================================================================
function worksheet (
    p_workbook          in out nocopy   t_workbook,
    p_name              in              varchar2                 default null,
    p_right_to_left     in              boolean                  default false,
    p_auto_widths       in              boolean                  default true,
    p_max_col_width     in              number                   default 80,
    p_max_lines_per_row in              pls_integer              default 20,
    p_column_widths     in              wwv_flow_global.n_arr    default wwv_flow_global.c_empty_n_arr,
    p_freeze_rows       in              pls_integer              default null,
    p_freeze_columns    in              pls_integer              default null )
    return t_worksheet;

--==============================================================================
-- Adds a format entry to the styles and returns the index
--==============================================================================
function add_format (
    p_workbook      in out nocopy   t_workbook,
    p_bold          in              boolean          default false,
    p_font_name     in              varchar2         default 'Calibri',
    p_font_size     in              number           default 11,
    p_font_color    in              varchar2         default '#000000',
    --
    p_bg_color      in              varchar2         default null,
    --
    p_alignment     in              t_alignment      default null,
    p_wrap_text     in              boolean          default true,
    --
    p_border_style  in              t_border_style   default null,
    p_border_color  in              varchar2         default null,
    --
    p_number_format in              varchar2         default null ) 
    return pls_integer;

--==============================================================================
-- Adds a table to a worksheet
--==============================================================================
procedure add_table (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_name          in              varchar2,
    p_from_row      in              pls_integer,
    p_from_column   in              pls_integer,
    p_to_row        in              pls_integer,
    p_to_column     in              pls_integer,
    p_header_row    in              boolean          default true,
    p_auto_filter   in              boolean          default true,
    p_columns       in              t_table_columns );

--==============================================================================
-- Opens a new worksheet row
--==============================================================================
procedure open_row(
    p_worksheet     in out nocopy   t_worksheet,
    p_height        in number       default null,
    p_cell_format   in pls_integer  default null );

--==============================================================================
-- Closes the current rowsheet row
--==============================================================================
procedure close_row(
    p_worksheet     in out nocopy   t_worksheet );

--==============================================================================
-- Writes a varchar2 value to next cell in the current worksheet row
--==============================================================================
procedure write_cell (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_value         in              varchar2,
    p_cell_format   in              pls_integer  default null,
    p_ignore_width  in              boolean      default false );

--==============================================================================
-- Writes a number value to next cell in the current worksheet row
--==============================================================================
procedure write_cell (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_value         in              number,
    p_cell_format   in              pls_integer  default null,
    p_ignore_width  in              boolean      default false );

--==============================================================================
-- Writes a date value to next cell in the current worksheet row
--==============================================================================
procedure write_cell (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_value         in              date,
    p_cell_format   in              pls_integer  default null,
    p_ignore_width  in              boolean      default false,
    p_format_mask   in              varchar2     default null );

--==============================================================================
-- Writes a timestamp value to next cell in the current worksheet row
--==============================================================================
procedure write_cell (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_value         in              timestamp,
    p_cell_format   in              pls_integer  default null,
    p_ignore_width  in              boolean      default false,
    p_format_mask   in              varchar2     default null );

--==============================================================================
-- Writes a timestamp with time zone value to next cell in the current worksheet row
--==============================================================================
procedure write_cell (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_value         in              timestamp with time zone,
    p_cell_format   in              pls_integer                  default null,
    p_ignore_width  in              boolean                      default false,
    p_format_mask   in              varchar2                     default null );

--==============================================================================
-- Writes a timestamp with time zone value to next cell in the current worksheet row
--==============================================================================
procedure write_cell (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_value         in              timestamp with local time zone,
    p_cell_format   in              pls_integer                      default null,
    p_ignore_width  in              boolean                          default false,
    p_format_mask   in              varchar2                         default null );
    
--==============================================================================
-- Writes a boolean value to next cell in the current worksheet row
--==============================================================================
procedure write_cell (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_value         in              boolean,
    p_cell_format   in              pls_integer  default null,
    p_ignore_width  in              boolean      default false );
    
--==============================================================================
-- Writes a image value to next cell in the current worksheet row
--==============================================================================
procedure write_cell (
    p_workbook      in out nocopy   t_workbook,
    p_worksheet     in out nocopy   t_worksheet,
    p_value         in              blob,
    p_file_name     in              varchar2     default null,
    p_mime_type     in              varchar2     default null,
    p_cell_format   in              pls_integer  default null,
    p_ignore_width  in              boolean      default false );

--==============================================================================
-- Moves to next cell in the current worksheet row
--==============================================================================
procedure skip_cell (
    p_worksheet     in out nocopy   t_worksheet,
    p_cell_format   in              pls_integer  default null );

--==============================================================================
-- Merges a range of cells of the same into one cell
--==============================================================================
procedure merge_cells (
    p_worksheet     in out nocopy   t_worksheet,
    p_col_span      in              pls_integer,
    p_cell_format   in              pls_integer      default null );

--==============================================================================
-- Free the resources
--==============================================================================
procedure free_worksheet( 
    p_worksheet in out nocopy t_worksheet );

procedure free_workbook( 
    p_workbook in out nocopy t_workbook );

--==============================================================================
-- Finishes the pdf
--==============================================================================
procedure finish_worksheet( 
    p_workbook  in out nocopy t_workbook,
    p_worksheet in out nocopy t_worksheet );

procedure finish_workbook(
    p_workbook in out nocopy t_workbook );

--==============================================================================
-- Gets the PDF as blob
--==============================================================================
function get_blob_output(
    p_workbook in out nocopy t_workbook )
    return blob;

--==============================================================================
-- Gets the corresponding formatCode for a Number Format for an Oracle Format Mask
-- Returns null if nothing is found
--==============================================================================
function to_format_code (
    p_format_mask   in varchar2,
    p_data_type     in wwv_flow_exec_api.t_data_type,
    p_nls_settings  in wwv_flow_ooxml.t_nls_settings )
    return varchar2;

end wwv_flow_xlsx;
/
show err

