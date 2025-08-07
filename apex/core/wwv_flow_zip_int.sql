set define off
set verify off

prompt ...wwv_flow_zip_int

create or replace package wwv_flow_zip_int authid definer accessible by ( package wwv_flow_zip )
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021 - 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_zip_int.sql
--
--    DESCRIPTION
--      This package contains internal types for apex_zip.
--
--    MODIFIED   (MM/DD/YYYY)
--    mhoogend   10/07/2021 - Created
--
--------------------------------------------------------------------------------

--##############################################################################
-- Data types
--##############################################################################

--------------------------------------------------------------------------------
-- Types used to describe directory entries
--------------------------------------------------------------------------------

subtype t_compression_type is varchar2( 4 );

c_compression_deflate   constant t_compression_type := '0800';
c_compression_deflate64 constant t_compression_type := '0900';
c_compression_none      constant t_compression_type := '0000';

--------------------------------------------------------------------------------
-- A file in the archive, with precomputed meta-data
--------------------------------------------------------------------------------
type t_dir_entry_internal is record (
    compression_type    t_compression_type,
    compressed_length   pls_integer,
    file_position       integer,
    source_offset       integer,
    crc32_checksum      raw(8) );

end wwv_flow_zip_int;
/
show errors

set define '^'
