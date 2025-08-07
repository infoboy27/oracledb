set define '^' verify off
prompt ...wwv_flow_zip_utils.sql
create or replace package wwv_flow_zip_utils authid definer as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2021. All Rights Reserved.
--
-- NAME
--   wwv_flow_zip_utils.sql
--
-- DESCRIPTION
--   Utility package for working with zip compression like gzip, zlib and Deflate
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
--
--------------------------------------------------------------------------------



--##############################################################################
-- Convertors
--##############################################################################


--==============================================================================
-- This function returns Deflate compressed data with the gzip header.
-- The gzip can be used as input to UTL_COMPRESS.LZ_UNCOMPRESS_EXTRACT 
-- to uncompress in chunks
-- 
-- Note: The gzip trailer with the CRC32 checksum is not included, 
-- and cannot be used as input to UTL_COMPRESS.LZ_UNCOMPRESS. Use
-- WWV_FLOW_ZIP_UTILS.GZIP_UNCOMPRESS instead.
--
-- Parameters:
-- * p_deflate: BLOB or RAW containing the Deflate file.
--
-- Returns:
-- A BLOB or RAW in gzip format.
--
-- Example:
--
-- This example demonstrates converting a Deflate compressed file into gzip
-- and manually decompressing it.
--
--   declare
--       l_deflate_file        blob;
--       l_gzip_file           blob;
--       l_uncompressed_file   blob;
--       l_buffer              raw( 32767 );
--   begin
--       select file_content
--         into l_deflate_file
--         from my_deflate_files
--        where file_name = :file_name;
--
--       l_gzip_file := wwv_flow_zip_utils.deflate_to_gzip( l_deflate_file );
--
--       sys.dbms_lob.createtemporary( l_uncompressed_file, true );
--
--       l_handle := sys.utl_compress.lz_uncompress_open( l_gzip_file );
--
--       loop
--           begin
--               sys.utl_compress.lz_uncompress_extract( l_handle, l_buffer );
--           exception
--               when no_data_found then
--                   exit;
--           end;
--
--           sys.dbms_lob.writeappend( l_uncompressed_file, sys.utl_raw.length( l_buffer ), l_buffer );
--
--       end loop;
--
--       sys.utl_compress.lz_uncompress_close( l_handle );
--   end;
--
--==============================================================================
function deflate_to_gzip( 
    p_deflate in blob )
    return blob;

function deflate_to_gzip( 
    p_deflate in raw )
    return raw;

--==============================================================================
-- This function returns zlib compressed data with the gzip header.
-- The gzip can be used as input to UTL_COMPRESS.LZ_UNCOMPRESS_EXTRACT 
-- to uncompress in chunks
-- 
-- Note: The gzip trailer with the CRC32 checksum is not included, 
-- and cannot be used as input to UTL_COMPRESS.LZ_UNCOMPRESS. Use
-- WWV_FLOW_ZIP_UTILS.GZIP_UNCOMPRESS instead.
--
-- Parameters:
-- * p_zlib:        BLOB or RAW containing the zlib file.
-- * p_trailer:     Whether the zlib file ends with the zlib trailer (Adler32 checksum).
--
-- Returns:
-- A BLOB or RAW in gzip format.
--
-- Example:
--
-- This example demonstrates converting a zlib compressed file into gzip
-- and manually decompressing it.
--
--   declare
--       l_zlib_file           blob;
--       l_gzip_file           blob;
--       l_uncompressed_file   blob;
--       l_buffer              raw( 32767 );
--   begin
--       select file_content
--         into l_zlib_file
--         from my_zlib_files
--        where file_name = 'my_file.zz';
--
--       l_gzip_file := wwv_flow_zip_utils.zlib_to_gzip( l_zlib_file );
--
--       sys.dbms_lob.createtemporary( l_uncompressed_file, true );
--
--       l_handle := sys.utl_compress.lz_uncompress_open( l_gzip_file );
--
--       loop
--           begin
--               sys.utl_compress.lz_uncompress_extract( l_handle, l_buffer );
--           exception
--               when no_data_found then
--                   exit;
--           end;
--
--           sys.dbms_lob.writeappend( l_uncompressed_file, sys.utl_raw.length( l_buffer ), l_buffer );
--
--       end loop;
--
--       sys.utl_compress.lz_uncompress_close( l_handle );
--   end;
--
--==============================================================================
function zlib_to_gzip( 
    p_zlib      in blob,
    p_trailer   in boolean )
    return blob;

function zlib_to_gzip( 
    p_zlib      in raw,
    p_trailer   in boolean )
    return raw;

--==============================================================================
-- This function returns compressed data in Deflate format.
-- The gzip header and optional trailer are removed.
-- 
--
-- Parameters:
-- * p_gzip:        BLOB or RAW containing the gzip file.
-- * p_trailer:     Whether the gzip file ends with the trailer (CRC32 checksum and uncompressed length).
--
-- Returns:
-- A BLOB or RAW in Deflate format.
--
--==============================================================================
function gzip_to_deflate( 
    p_gzip      in blob,
    p_trailer   in boolean )
    return blob;

function gzip_to_deflate( 
    p_gzip      in raw,
    p_trailer   in boolean )
    return raw;

--##############################################################################
-- GZIP support
--
-- Note: To compress data to gzip, use UTL_COMPRESS.LZ_COMPRESS instead. there 
-- is no need for WWV_FLOW_ZIP_UTILS.GZIP_COMPRESS.
--##############################################################################

--==============================================================================
-- This function uncompresses a gzip file.
-- 
-- Note: The function should always be used instead of UTL_COMPRESS.LZ_UNCOMPRESS.
-- The gzip will be checked against high compression ratio zip-bombs if needed.
--
-- Parameters:
-- * p_gzip:                 BLOB or RAW containing the gzip file.
-- * p_has_valid_trailer:    Wether the gzip has a valid trailer. 
-- * p_check_isize_record:   Wether to check the ISIZE record agains limitations before uncompressing.
--
-- Returns:
-- An uncompressed BLOB or RAW.
--
-- Example:
--
-- This example demonstrates converting a zlib compressed file into a gzip
-- and uncompressing the gzip.
--
--   declare
--       l_zlib_file           blob;
--       l_gzip_file           blob;
--       l_uncompressed_file   blob;
--   begin
--       select file_content
--         into l_zlib_file
--         from my_zlib_files
--        where file_name = 'my_file.zz';
--
--       l_gzip_file := wwv_flow_zip_utils.zlib_to_gzip( l_zlib_file );
--
--       l_uncompressed_file := wwv_flow_zip_utils.gzip_uncompress( l_gzip_file );
--   end;
--
--==============================================================================
function gzip_uncompress(
    p_gzip                  in blob,
    p_has_valid_trailer     in boolean default true,
    p_check_isize_record    in boolean default true )
    return blob;

--==============================================================================
-- The raw version doesn't need to check against zip-bombs as it returns a raw as well
--==============================================================================
function gzip_uncompress(
    p_gzip in raw )
    return raw;

--##############################################################################
-- ZLIB support
--##############################################################################

--==============================================================================
-- This function compresses data in the zlib format.
-- 
-- Note: The zlib trailer (Adler32 checksum) is not added.
--
-- Parameters:
-- * p_src:         BLOB or RAW containing the data that needs compression.
--
-- Returns:
-- An zlib compressed BLOB or RAW.
--
-- Example:
--
-- This example demonstrates compressing data in the zlib format and uncompress it.
--
--   declare
--       l_zlib_file           blob;
--       l_uncompressed_file   blob;
--   begin
--
--       l_zlib_file := wwv_flow_zip_utils.zlib_compress( hextoraw('00') );
--
--       l_uncompressed_file := wwv_flow_zip_utils.zlib_decompress( p_zlib => l_zlib_file, p_trailer => false );
--   end;
--
--==============================================================================
function zlib_compress( 
    p_src       in blob )
    return blob;

function zlib_compress( 
    p_src       in raw )
    return raw;

--==============================================================================
-- This function uncompresses a zlib compressed file.
--
-- Parameters:
-- * p_zlib:        BLOB or RAW containing the zlib file.
-- * p_trailer:     Whether the zlib file ends with the zlib trailer (Adler32 checksum).
--
-- Returns:
-- An uncompressed BLOB or RAW.
--
-- Example:
--
-- This example demonstrates compressing data in the zlib format and uncompress it.
--
--   declare
--       l_zlib_file           blob;
--       l_uncompressed_file   blob;
--   begin
--
--       l_zlib_file := wwv_flow_zip_utils.zlib_compress( hextoraw('00') );
--
--       l_uncompressed_file := wwv_flow_zip_utils.zlib_decompress( p_zlib => l_zlib_file, p_trailer => false );
--   end;
--
--==============================================================================
function zlib_uncompress(
    p_zlib      in blob,
    p_trailer   in boolean )
    return blob;

function zlib_uncompress(
    p_zlib      in raw,
    p_trailer   in boolean )
    return raw;

--##############################################################################
-- Inflate / Deflate support
--##############################################################################

--==============================================================================
-- This function compresses data in the Deflate format.
-- 
-- Note: Deflate never contains a header or trailer.
--
-- Parameters:
-- * p_src:         BLOB or RAW containing the data that needs compression.
--
-- Returns:
-- An Deflate compressed BLOB or RAW.
--
-- Example:
--
-- This example demonstrates compressing data in the Deflate format and uncompress it.
--
--   declare
--       l_deflate_file        blob;
--       l_uncompressed_file   blob;
--   begin
--
--       l_deflate_file := wwv_flow_zip_utils.deflate( hextoraw('00') );
--
--       l_uncompressed_file := wwv_flow_zip_utils.inflate( l_deflate_file );
--   end;
--
--==============================================================================
function deflate( 
    p_src in blob )
    return blob;

function deflate(
    p_src in raw )
    return raw;

--==============================================================================
-- This function uncompresses a Deflate compressed file.
-- 
-- Note: The zlib trailer (Adler32 checksum) is not added.
--
-- Parameters:
-- * p_deflate:     BLOB or RAW containing the Deflate file.
--
-- Returns:
-- An uncompressed BLOB or RAW.
--
-- Example:
--
-- This example demonstrates compressing data in the Deflate format and uncompress it.
--
--   declare
--       l_deflate_file        blob;
--       l_uncompressed_file   blob;
--   begin
--
--       l_deflate_file := wwv_flow_zip_utils.deflate( hextoraw('00') );
--
--       l_uncompressed_file := wwv_flow_zip_utils.inflate( l_deflate_file );
--   end;
--
--==============================================================================
function inflate( 
    p_deflate in blob )
    return blob;

function inflate(
    p_deflate in raw )
    return raw;

--==============================================================================
-- This function checks the uncompressed size against instance level limits to 
-- prevent high compression ratio zip-bombs
--==============================================================================
procedure check_uncompress_limits (
    p_compressed_size   in number,
    p_uncompressed_size in number );

end wwv_flow_zip_utils;
/
show err

