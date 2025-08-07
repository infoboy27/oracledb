set define '^'
set verify off
prompt ...wwv_flow_image_png
create or replace package wwv_flow_image_png authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_image_png.sql
--
--    DESCRIPTION
--      This package is responsible for parsing PNG images
--
--------------------------------------------------------------------------------
subtype t_chunk_name    is varchar2( 4 );

type t_chunk is record (
    chunk_name          t_chunk_name,
    offset              pls_integer,
    chunk_length        pls_integer );

type t_chunks           is table of t_chunk;

type t_metadata is record (
    width               pls_integer,
    height              pls_integer,
    bits                pls_integer,
    color_type          pls_integer,
    compression_method  pls_integer,
    filter_method       pls_integer,
    interlace_method    pls_integer,
    chunks              t_chunks );

type t_bytes            is table of pls_integer;

type t_transparency is record (
    indexed             t_bytes,
    grayscale           pls_integer,
    rgb                 t_bytes );

--==============================================================================
-- Returns PNG metadata
--==============================================================================
function get_metadata (
    p_data  in  blob )
    return t_metadata;

--==============================================================================
-- Gets the image data from all IDAT chunks
--==============================================================================
function get_image_data (
    p_data      in blob,
    p_chunks    in t_chunks )
    return blob;

--==============================================================================
-- Gets the palette data from the PLTE chunk
--==============================================================================
function get_palette (
    p_data      in blob,
    p_chunks    in t_chunks )
    return raw;

--==============================================================================
-- Gets the transparency from the tRNS chunk
--==============================================================================
function get_transparency (
    p_data          in blob,
    p_chunks        in t_chunks,
    p_color_type    in pls_integer )
    return t_transparency;

--==============================================================================
-- Splits the alpha channel data from the image data 
--==============================================================================
procedure split_alpha_channel (
    p_metadata          in t_metadata,
    p_pixel_bit_length  in pls_integer,
    p_colors            in pls_integer,
    p_image_data        in out nocopy blob,
    p_alpha_channel     in out nocopy blob );

--==============================================================================
-- Loads the alpha channel data using the transparency
--==============================================================================
procedure load_indexed_alpha_channel (
    p_metadata              in t_metadata,
    p_indexed_transparency  in t_bytes,
    p_pixel_bit_length      in pls_integer,
    p_image_data            in blob,
    p_alpha_channel         in out nocopy blob );

--==============================================================================
-- Decodes the image data 
--==============================================================================
procedure decode_data (
    p_metadata              in t_metadata,
    p_pixel_bit_length      in pls_integer,
    p_image_data            in out nocopy blob );

end wwv_flow_image_png;
/
show errors