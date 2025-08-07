set define '^'
set verify off
prompt ...wwv_flow_pdf_font_cff
create or replace package wwv_flow_pdf_font_cff as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2019 All Rights Reserved.
--
--    NAME
--      wwv_flow_pdf_font_cff.sql
--
--    DESCRIPTION
--      This package is responsible for dealing with Compact Font Format Specification (CFF)
--
--

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
subtype t_font_name is varchar2( 127 );

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------

--==============================================================================
-- Parse the contents of a CFF file
--==============================================================================
procedure parse_cff_file (
    p_file in blob );

--==============================================================================
-- Add the glyph data to the current subset
--==============================================================================
procedure add_glyph_to_subset (
    p_font_name in t_font_name,
    p_glyph_id  in pls_integer );

--==============================================================================
-- Gets the subsetted font file
--==============================================================================
function get_font_subset (
    p_font_name in t_font_name )
     return blob;

--==============================================================================
-- Free all the resources
--==============================================================================
procedure free;

end wwv_flow_pdf_font_cff;
/
show errors