set define '^'
set verify off
prompt ...wwv_flow_pdf_font
create or replace package wwv_flow_pdf_font as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_pdf_font.sql
--
--    DESCRIPTION
--      This package is responsible for dealing with fonts in PDF files
--
--

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
subtype t_encoded_char      is varchar2(8 byte);
subtype t_font_subtype      is varchar2(12);

type t_glyph is record (
    actual_font_name        wwv_flow_pdf.t_font_name,
    char_info               wwv_flow_pdf.t_char_info,
    codepoint               pls_integer,
    encoded_value           t_encoded_char,
    width                   number,
    x_offset                number,
    y_offset                number,
    id                      pls_integer,
    subset_id               pls_integer );

type t_glyphs               is table of t_glyph index by pls_integer;

type t_text_line_part is record (
    actual_text             wwv_flow_t_varchar2,
    glyphs                  t_glyphs,
    encoded_chars           wwv_flow_t_varchar2,
    width                   number,
    font                    wwv_flow_pdf.t_font_name,
    font_size               number );

type t_text_line_parts      is table of t_text_line_part index by pls_integer;

type t_text_line is record (
    line_parts              t_text_line_parts,
    width                   number,
    height                  number,
    text_alignment          wwv_flow_pdf.t_alignment );

type t_text_lines           is table of t_text_line index by pls_integer;


type t_font_glyph_widths    is table of number index by pls_integer;
type t_unicode_mapping      is table of pls_integer index by pls_integer;

type t_font_attributes is record (
    font_name               wwv_flow_pdf.t_font_name,
    font_family             wwv_flow_pdf.t_font_family_name,
    font_subtype            t_font_subtype,
    scale                   number,
    flags                   pls_integer,
    x_min                   pls_integer,
    y_min                   pls_integer,
    x_max                   pls_integer,
    y_max                   pls_integer,
    italic_angle            pls_integer,
    ascender                pls_integer,
    descender               pls_integer,
    cap_height              pls_integer );

type t_subset is record (
    font_file               blob,
    widths                  t_font_glyph_widths,
    to_unicode              t_unicode_mapping,
    is_truetype             boolean );

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
c_courier_bold              constant wwv_flow_pdf_fonts.font_name%type := 'Courier-Bold';
c_courier_bold_oblique      constant wwv_flow_pdf_fonts.font_name%type := 'Courier-BoldOblique';
c_courier_oblique           constant wwv_flow_pdf_fonts.font_name%type := 'Courier-Oblique';
c_courier                   constant wwv_flow_pdf_fonts.font_name%type := 'Courier';
c_helvetica_bold            constant wwv_flow_pdf_fonts.font_name%type := 'Helvetica-Bold';
c_helvetica_bold_oblique    constant wwv_flow_pdf_fonts.font_name%type := 'Helvetica-BoldOblique';
c_helvetica_oblique         constant wwv_flow_pdf_fonts.font_name%type := 'Helvetica-Oblique';
c_helvetica                 constant wwv_flow_pdf_fonts.font_name%type := 'Helvetica';
c_symbol                    constant wwv_flow_pdf_fonts.font_name%type := 'Symbol';
c_times_bold                constant wwv_flow_pdf_fonts.font_name%type := 'Times-Bold';
c_times_bold_italic         constant wwv_flow_pdf_fonts.font_name%type := 'Times-BoldItalic';
c_times_italic              constant wwv_flow_pdf_fonts.font_name%type := 'Times-Italic';
c_times_roman               constant wwv_flow_pdf_fonts.font_name%type := 'Times-Roman';
c_zapfdingbats              constant wwv_flow_pdf_fonts.font_name%type := 'ZapfDingbats';

--==============================================================================
-- Lays out a plain ASCIII text
-- 
-- This function is a lot faster then the non-ascii function
-- 
-- The width of the characters depend on the font name.
-- The accumulated widths of those glyphs are used to determine line breaks.
--==============================================================================
function layout_ascii_text (
    p_text          in varchar2,
    p_font_name     in wwv_flow_pdf.t_font_name,
    p_font_size     in number,
    p_font_color    in wwv_flow_pdf.t_color,
    p_max_width     in number,
    p_alignment     in wwv_flow_pdf.t_alignment,
    p_max_lines     in pls_integer                 default null )
    return t_text_lines;

--==============================================================================
-- Lays out a text using the unicode bidi algoritm and font shaping
-- See 3.4 Reordering Resolved Levels (https://unicode.org/reports/tr9/#Reordering_Resolved_Levels)
-- 
-- The text is split into paragraphs
-- The levels of the text are determined according to the Unicode Bidi Algorithm.
-- The characters are shaped into glyphs according to their context (taking the embedding levels into account for mirroring).
-- The accumulated widths of those glyphs (in logical order) are used to determine line breaks.
-- For each line, rules L1-L4 are used to reorder the characters on that line.
--==============================================================================
function layout_text (
    p_text_buffer           in wwv_flow_pdf.t_text_buffer,
    p_max_width             in number,
    p_text_direction        in wwv_flow_pdf.t_direction,
    p_alignment             in wwv_flow_pdf.t_alignment,
    p_max_lines             in pls_integer                 default null )
    return t_text_lines;

--==============================================================================
-- Returns the base font for a font family
--==============================================================================
function get_font_name (
    p_font_family   in varchar2,
    p_bold          in boolean default false,
    p_italic        in boolean default false ) 
    return wwv_flow_pdf.t_font_name;

--==============================================================================
-- Free all the resources
--==============================================================================
procedure free;

--==============================================================================
-- Gets the subsetted font file
--==============================================================================
function get_font_subset (
    p_font_name in wwv_flow_pdf.t_font_name ) 
    return t_subset;

--==============================================================================
-- Gets attributes of a font
--==============================================================================
function get_font_attributes (
    p_font_name in wwv_flow_pdf.t_font_name ) 
    return t_font_attributes;

end wwv_flow_pdf_font;
/
show errors