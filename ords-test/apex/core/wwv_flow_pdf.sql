set define '^'
set verify off
prompt ...wwv_flow_pdf
create or replace package wwv_flow_pdf as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_pdf.sql
--
--    DESCRIPTION
--      This package serves as a low level PDF engine
--
--

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
type t_page_margin is record (
    top                     number,
    left                    number,
    bottom                  number,
    right                   number );

subtype t_page_size         is varchar2(15);
subtype t_page_orientation  is varchar2(20);
subtype t_direction         is varchar2(3);
subtype t_alignment         is varchar2(6);
subtype t_font_family_name  is varchar2(100);
subtype t_font_name         is varchar2(150);
subtype t_cell_type         is varchar2(5);

-- Cell data types
c_cell_text                 constant t_cell_type := 'TEXT';
c_cell_image                constant t_cell_type := 'IMAGE';

type t_color is record (
    r                       number,
    g                       number,
    b                       number );

subtype t_color_hex_code    is varchar2(15);

type t_table_column is record (
    heading                 varchar2(32767),
    heading_alignment       t_alignment,
    value_alignment         t_alignment,
    width                   number,
    colspan                 pls_integer );

type t_table_columns        is table of t_table_column index by pls_integer;

type t_image is record (
    content                 blob,
    file_name               varchar2( 32767 ) );

type t_row_cell is record (
    cell_type               t_cell_type         default c_cell_text,
    cell_value              varchar2(32767),
    cell_image              t_image,
    text_color              t_color_hex_code,
    fill_color              t_color_hex_code,
    colspan                 pls_integer,
    alignment               t_alignment );

type t_table_row            is table of t_row_cell index by pls_integer;
type t_table_rows           is table of t_table_row index by pls_integer;

subtype t_tag               is varchar2(10);

type t_char_info is record (
    char_value              wwv_flow_char_reader.t_char,
    preferred_font_name     t_font_name,
    font_size               number,
    font_color              t_color );

type t_text_buffer          is table of t_char_info index by pls_integer;

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
c_empty_row_cell            t_row_cell;
c_empty_table_columns       t_table_columns;

c_default_margin            number := 72;

-- page sizes
c_4A0                       constant t_page_size := '4A0';
c_2A0                       constant t_page_size := '2A0';
c_A0                        constant t_page_size := 'A0';
c_A1                        constant t_page_size := 'A1';
c_A2                        constant t_page_size := 'A2';
c_A3                        constant t_page_size := 'A3';
c_A4                        constant t_page_size := 'A4';
c_A5                        constant t_page_size := 'A5';
c_A6                        constant t_page_size := 'A6';
c_A7                        constant t_page_size := 'A7';
c_A8                        constant t_page_size := 'A8';
c_A9                        constant t_page_size := 'A9';
c_A10                       constant t_page_size := 'A10';
c_B0                        constant t_page_size := 'B0';
c_B1                        constant t_page_size := 'B1';
c_B2                        constant t_page_size := 'B2';
c_B3                        constant t_page_size := 'B3';
c_B4                        constant t_page_size := 'B4';
c_B5                        constant t_page_size := 'B5';
c_B6                        constant t_page_size := 'B6';
c_B7                        constant t_page_size := 'B7';
c_B8                        constant t_page_size := 'B8';
c_B9                        constant t_page_size := 'B9';
c_B10                       constant t_page_size := 'B10';
c_C0                        constant t_page_size := 'C0';
c_C1                        constant t_page_size := 'C1';
c_C2                        constant t_page_size := 'C2';
c_C3                        constant t_page_size := 'C3';
c_C4                        constant t_page_size := 'C4';
c_C5                        constant t_page_size := 'C5';
c_C6                        constant t_page_size := 'C6';
c_C7                        constant t_page_size := 'C7';
c_C8                        constant t_page_size := 'C8';
c_C9                        constant t_page_size := 'C9';
c_C10                       constant t_page_size := 'C10';
c_RA0                       constant t_page_size := 'RA0';
c_RA1                       constant t_page_size := 'RA1';
c_RA2                       constant t_page_size := 'RA2';
c_RA3                       constant t_page_size := 'RA3';
c_RA4                       constant t_page_size := 'RA4';
c_SRA0                      constant t_page_size := 'SRA0';
c_SRA1                      constant t_page_size := 'SRA1';
c_SRA2                      constant t_page_size := 'SRA2';
c_SRA3                      constant t_page_size := 'SRA3';
c_SRA4                      constant t_page_size := 'SRA3';
c_EXECUTIVE                 constant t_page_size := 'EXECUTIVE';
c_FOLIO                     constant t_page_size := 'FOLIO';
c_LEGAL                     constant t_page_size := 'LEGAL';
c_LETTER                    constant t_page_size := 'LETTER';
c_TABLOID                   constant t_page_size := 'TABLOID';
c_CUSTOM                    constant t_page_size := 'CUSTOM';

c_direction_l2r             constant t_direction := 'L2R';
c_direction_r2l             constant t_direction := 'R2L';

c_family_courier            constant t_font_family_name := 'Courier';
c_family_helvetica          constant t_font_family_name := 'Helvetica';
c_family_symbol             constant t_font_family_name := 'Symbol';
c_family_times              constant t_font_family_name := 'Times';
c_family_zapfdingbats       constant t_font_family_name := 'ZapfDingbats';

c_portrait                  constant t_page_orientation := 'portrait';
c_landscape                 constant t_page_orientation := 'landscape';

c_align_start               constant t_alignment := 'start';
c_align_center              constant t_alignment := 'center';
c_align_end                 constant t_alignment := 'end';

-- Tag types for paragraphlike elements
c_tag_p                     constant t_tag := 'P';
c_tag_h                     constant t_tag := 'H';
c_tag_h1                    constant t_tag := 'H1';
c_tag_h2                    constant t_tag := 'H2';
c_tag_h3                    constant t_tag := 'H3';
c_tag_h4                    constant t_tag := 'H4';
c_tag_h5                    constant t_tag := 'H5';
c_tag_h6                    constant t_tag := 'H6';

c_mime_type                 constant varchar2( 255 ) := 'application/pdf';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------

--==============================================================================
-- Initializes a new PDF document
--==============================================================================
procedure init (
    p_page_size         in t_page_size          default c_LETTER,
    p_page_width        in number               default null,
    p_page_height       in number               default null,
    p_page_orientation  in t_page_orientation   default c_portrait,
    p_compress          in boolean              default true,
    p_page_numbers      in boolean              default true,
    p_accessible        in boolean              default null,
    p_image_placeholder in blob                 default null );

--==============================================================================
-- Adds a blank page to the PDF
--==============================================================================
procedure add_page (
    p_orientation t_page_orientation default null );

--==============================================================================
-- Sets one default margin for top, left, bottom & right
--==============================================================================
procedure margin (
    p_margin    in number default c_default_margin );

--==============================================================================
-- Sets the text direction
--==============================================================================
procedure text_direction (
    p_direction     in t_direction default c_direction_l2r );

--==============================================================================
-- Moves to the start coordinate of the current page
--==============================================================================
procedure move_to_beginning;

--==============================================================================
-- Moves to a coordinate on the current page
--==============================================================================
procedure move (
    p_x in number default null,
    p_y in number default null );

--==============================================================================
-- Moves left or right by indentation
--==============================================================================
procedure move_indent (
    p_indentation in number );

--==============================================================================
-- Sets the y coordinate to one line below
--==============================================================================
procedure move_down;

--==============================================================================
-- Sets the font of PDF to use in future
--==============================================================================
procedure font (
    p_font_family   in t_font_family_name,
    p_bold          in boolean              default false,
    p_italic        in boolean              default false );

--==============================================================================
-- Sets the font_size in points of PDF to use in future
--==============================================================================
procedure font_size (
    p_size in number );

--==============================================================================
-- Sets the text_alignment of PDF to use in future
--==============================================================================
procedure text_alignment (
    p_alignment in t_alignment );

--==============================================================================
-- Adds text to a page to the PDF in current position
--==============================================================================
procedure text (
    p_text      in varchar2,
    p_continued in boolean      default false,
    p_max_width in number       default null,
    p_max_lines in pls_integer  default null,
    p_move_down in boolean      default true,
    p_tag       in t_tag        default null );

--==============================================================================
-- Adds text to a page to the PDF on a position
--==============================================================================
procedure text (
    p_text      in varchar2,
    p_x         in number,
    p_y         in number,
    p_max_width in number       default null,
    p_max_lines in pls_integer  default null,
    p_tag       in t_tag        default null );

--==============================================================================
-- Adds a header text to each page in a static Y coord
--==============================================================================
procedure page_header (
    p_text      in varchar2 );

--==============================================================================
-- Adds a footer text to each page in a static Y coord
--==============================================================================
procedure page_footer (
    p_text      in varchar2 );

--==============================================================================
-- Adds a rectangle to a page to the PDF
--==============================================================================
procedure rectangle (
    p_width     in number,
    p_height    in number,
    p_fill      in boolean default false,
    p_stroke    in boolean default true,
    p_for_table in boolean default false );

--==============================================================================
-- Adds a rectangle to a page to the PDF on a position
--==============================================================================
procedure rectangle (
    p_width     in number,
    p_height    in number,
    p_x         in number,
    p_y         in number,
    p_fill      in boolean default false,
    p_stroke    in boolean default true,
    p_for_table in boolean default false );

--==============================================================================
-- Adds a text box to the PDF
--==============================================================================
procedure text_box (
    p_width         in number,
    p_text          in varchar2,
    p_margin        in number,
    p_fill          in boolean      default false,
    p_stroke        in boolean      default true,
    p_tag           in t_tag        default null );

--==============================================================================
-- Adds an image to the PDF (JPEG, PNG ) ( optional WEBP, BMP, GIF )
--==============================================================================
procedure image (
    p_data          in blob,
    p_width         in number       default null,
    p_height        in number       default null,
    p_name          in varchar2     default null );

--==============================================================================
-- Sets defaults for a table
--==============================================================================
procedure table_colors (
    p_row_text_color        in varchar2,
    p_row_fill_color        in varchar2  );

--==============================================================================
-- Adds a table header to the PDF
--==============================================================================
procedure table_header (
    p_columns               in t_table_columns,
    p_margin                in number           default 0,
    p_width                 in number           default null,
    p_fill                  in boolean          default false,
    p_stroke                in boolean          default true,
    p_exact_widths          in boolean          default false,
    p_emit                  in boolean          default true );

--==============================================================================
-- Actives the current colors based on table defaults
--==============================================================================
procedure activate_table_colors;

--==============================================================================
-- Adds a table row to the PDF
--==============================================================================
procedure table_row (
    p_values        in t_table_row,
    p_margin        in number       default 0,
    p_fill          in boolean      default false,
    p_stroke        in boolean      default true );

--==============================================================================
-- Adds a summary (for accessibility) to the table
--==============================================================================
procedure table_summary (
    p_summary       in varchar2 );

--==============================================================================
-- Sets the current text color for the PDF
--==============================================================================
procedure text_color (
    p_r    in number,
    p_g    in number,
    p_b    in number );

--==============================================================================
-- Sets the current text color for the PDF
--==============================================================================
procedure text_color (
    p_hex_code in varchar2 );

--==============================================================================
-- Sets the current fill color for the PDF
--==============================================================================
procedure fill_color (
    p_r    in number,
    p_g    in number,
    p_b    in number );

--==============================================================================
-- Sets the current fill color for the PDF
--==============================================================================
procedure fill_color (
    p_hex_code in varchar2 );

--==============================================================================
-- Sets the current stroke color for the PDF
--==============================================================================
procedure stroke_color (
    p_r    in number,
    p_g    in number,
    p_b    in number );

--==============================================================================
-- Sets the current stroke color for the PDF
--==============================================================================
procedure stroke_color (
    p_hex_code in varchar2 );

--==============================================================================
-- Sets the width in points of PDF to use in future
--==============================================================================
procedure line_width (
    p_width in number );

--==============================================================================
-- Fills the previous graphical element
--==============================================================================
procedure fill;

--==============================================================================
-- Draws a stroke for the previous graphical element
--==============================================================================
procedure stroke;

--==============================================================================
-- Fills and strokes the previous graphical element
--==============================================================================
procedure fill_and_stroke;

--==============================================================================
-- Does not fills and strokes the previous graphical element
--==============================================================================
procedure no_fill_or_stroke;

--==============================================================================
-- Push current graphics state on stack
--==============================================================================
procedure save_grahpics_state;

--==============================================================================
-- Restore last graphics state from stack
--==============================================================================
procedure restore_grahpics_state;

--==============================================================================
-- Gets the max width of the current page in respect with page margins
--==============================================================================
function get_max_line_width return number;

--==============================================================================
-- Gets the max height of the current page in respect with page margins
--==============================================================================
function get_max_page_height return number;

--==============================================================================
-- Finishes the pdf
--==============================================================================
procedure finish;

--==============================================================================
-- Free the resources
--==============================================================================
procedure free;

--==============================================================================
-- The procedure gets the clob buffer.
--==============================================================================
procedure get_clob_output( 
    p_clob in out nocopy clob);

--==============================================================================
-- Gets the PDF as blob
--==============================================================================
function get_blob_output return blob;

--==============================================================================
-- Converts pixels to points
--==============================================================================
function px_to_pt (
    p_pixels in number ) 
    return number;

--==============================================================================
-- Converts points to pixels
--==============================================================================
function pt_to_px (
    p_points in number ) 
    return number;

--==============================================================================
-- Returns true when APEX_PDF_ACCESSIBLE for the user is set to Y
--==============================================================================
function is_accessible_enabled return boolean;

--==============================================================================
-- Override the default producer for unit tests
--==============================================================================
procedure override_producer( 
    p_producer in varchar2 );

end wwv_flow_pdf;
/
show errors