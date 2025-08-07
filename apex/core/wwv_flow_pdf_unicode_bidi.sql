set define '^'
set verify off
prompt ...wwv_flow_pdf_unicode_bidi
create or replace package wwv_flow_pdf_unicode_bidi as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_pdf_unicode_bidi.sql
--
--    DESCRIPTION
--      This package is responsible for implementing the Unicode Bidirectional Algorithm
--

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
subtype t_direction         is char(1);
subtype t_resolved_type     is varchar2(3);

type t_resolved_char is record (
    char_value              wwv_flow_char_reader.t_char,
    codepoint               pls_integer,
    codepoint_mirrored      pls_integer,
    script                  wwv_flow_pdf_unicode_data.script%type,
    arab_joining_type       wwv_flow_pdf_unicode_arab.joining_type%type,
    resolved_type           t_resolved_type,
    embedding_level         pls_integer,
    logical_index           pls_integer,
    text_buffer_index       pls_integer );

type t_resolved_chars       is table of t_resolved_char index by pls_integer;

type t_paragraph is record (
    resolved_chars          t_resolved_chars,
    max_level               pls_integer,
    needs_reordering        boolean );

type t_paragraphs           is table of t_paragraph index by pls_integer;

type t_reordered_char is record (
    resolved_char           t_resolved_char,
    direction               t_direction,
    codepoint_mirrored      pls_integer );

type t_reordered_chars      is table of t_reordered_char index by pls_integer;

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
c_direction_left            constant t_direction := 'L';
c_direction_right           constant t_direction := 'R';
c_direction_neutral         constant t_direction := 'N';

--==============================================================================
-- Returns zero-width codepoints
--==============================================================================
function get_zero_width_codepoints return wwv_flow_t_number;

--==============================================================================
-- Get the embedding levels from codepoints per paragraph
--
-- It is a simplified implementation of the bidi algorithm that supports weak character directions and implicit markers.
--
-- The output is a table of embedding levels per paragraph. A new line indicates a new paragraph. 
-- 
-- Per character:
--  Get the codepoint
--  Get the unicode bidi class
--  Determine the embedding level
--  A new line in the text will start a new record of the output table
--  If the level is even, text direction is LEFT
--  If the level is odd, text direction is RIGHT
--  
-- Example: [ <codepoints> ] = [ <levels> ]
--
--  [ 1649, 65, 66, 1657, 1667 ] = [[ 1, 0, 0, 1, 1 ]]
--  In this example, the paragraph direction is RIGHT, two codepoints (65, 66) have a LEFT direction.
--  These two codepoints are Latin characters (strong) and will break the ordering of surrounding Arabic codepoints.
--
--  [ 1649, 51, 55, 1657, 1667 ] = [[ 1, 2, 2, 1, 1 ]]
--  In this example, the paragraph direction is RIGHT, two codepoints (51, 55) have a LEFT direction.
--  These two codepoints are European Numbers (weak) and surrounding codepoints keep their ordering.
--
-- 
--==============================================================================
function resolve_levels (
    p_text_buffer       in wwv_flow_pdf.t_text_buffer,
    p_default_direction in t_direction                      default c_direction_left,
    p_max_paragraphs    in pls_integer                      default null )
    return t_paragraphs;

--==============================================================================
-- Reorders characters using their embedding levels
-- 
-- Example:
--  Input: 
--      codepoints: [1649, 51, 55, 1657, 1667] 
--      indexes: [ 1, 2, 3, 4, 5 ]
--      levels: [1, 2, 2, 1, 1]
--  Output:
--      [ 1667, 1657, 51, 55, 1649 ]
--      [ 5, 4, 2, 3, 1 ]
--
--  Start with outer level until lowest odd inner level.
--  A visual explanation where col1 is input and col3 is output:
--
--  ------------------------------------
--  | codepoint | level 2 | level  1-2 |
--  ------------------------------------
--  |      1649 |         |       1667 |
--  |        51 |      55 |       1657 |
--  |        55 |      51 |         51 |
--  |      1657 |         |         55 |
--  |      1667 |         |       1649 |
--  ------------------------------------
--
-- See : https://unicode.org/reports/tr9/#Reordering_Resolved_Levels
--
--==============================================================================
function reorder_chars (
    p_resolved_chars    in t_resolved_chars,
    p_max_level         in pls_integer )
    return t_reordered_chars;

end wwv_flow_pdf_unicode_bidi;
/
show errors