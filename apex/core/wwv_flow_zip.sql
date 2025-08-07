set define off
set verify off

prompt ...wwv_flow_zip

create or replace package wwv_flow_zip authid current_user as
--------------------------------------------------------------------------------
-- 
-- Copyright (C) 2010, 2024 by Anton Scheffer
--
-- This package allows to compress and to uncompress files and store them in a ZIP file.
--
--! Note:
--!
--! Permission is hereby granted, free of charge, to any person obtaining a copy
--! of this software and associated documentation files (the "Software"), to deal
--! in the Software without restriction, including without limitation the rights
--! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--! copies of the Software, and to permit persons to whom the Software is
--! furnished to do so, subject to the following conditions:
--! 
--! The above copyright notice and this permission notice shall be included in
--! all copies or substantial portions of the Software.
--! 
--! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
--! THE SOFTWARE.
--
--------------------------------------------------------------------------------

--##############################################################################
-- Data Types:
--##############################################################################

--------------------------------------------------------------------------------
-- A file in the archive, with precomputed meta-data
--
-- Attributes:
-- * file_name:           Name of the compressed file, including the directory path.
-- * uncompressed_length: The size, in bytes, that the file will be when it is decompressed.
-- * is_directory:        Will be `TRUE` if the entry represents a file system directory.
--------------------------------------------------------------------------------
type t_dir_entry is record (
    file_name           varchar2(32767),
    uncompressed_length number,
    is_directory        boolean,
    -- Internal:
    internal            wwv_flow_zip_int.t_dir_entry_internal );

--------------------------------------------------------------------------------
-- An easily accessible directory of all the files in the archive, indexed by
-- the full name of the file including its path.
--------------------------------------------------------------------------------
type t_dir_entries is table of t_dir_entry index by varchar2(32767);
--------------------------------------------------------------------------------
-- Collection of file names and path.
--
-- The `t_files` type is deprecated. Using the `t_dir_entries` type is more efficient, especially when dealing with
-- zip archives, which contain many files.
--
-- Deprecated: 21.2
--------------------------------------------------------------------------------
type t_files is table of varchar2(32767) index by binary_integer;

--##############################################################################
-- Reading a zip file
--##############################################################################
--==============================================================================
-- This function returns an array of file names, including the path, of a
-- provided zip file that contains a `BLOB`.
--
-- The `GET_FILES` function is deprecated. The `GET_DIR_ENTIES` function should be used
-- instead, since it is more efficient, especially for zip archives which 
-- contain many files.
--
-- Parameters:
-- * p_zipped_blob:   This is the BLOB containing the zip file.
-- * p_only_files:    If set to TRUE, empty directory entries are not included in
--                    the returned array. Otherwise, set to FALSE to include
--                    empty directory entries.
-- * p_encoding:      This is the encoding used to zip the file.
--
-- Returns:
-- A collection of file names and path.
--
-- Example:
--
-- This example demonstrates reading a zip file from a table, extracting it and
-- storing all files of the zip file into `my_files`.
-- ```
-- declare
--     l_zip_file      blob;
--     l_unzipped_file blob;
--     l_files         apex_zip.t_files;
-- begin
--     select file_content
--       into l_zip_file
--       from my_zip_files
--      where file_name = 'my_file.zip';
--
--     l_files := apex_zip.get_files (
--                    p_zipped_blob => l_zip_file );
--
--     for i in 1 .. l_files.count loop
--         l_unzipped_file := apex_zip.get_file_content (
--                                p_zipped_blob => l_zip_file,
--                                p_file_name   => l_files(i) );
--
--         insert into my_files ( file_name, file_content )
--         values ( l_files(i), l_unzipped_file );
--     end loop;
-- end;
-- ```
--
-- See Also:
-- GET_FILE_CONTENT
-- GET_DIR_ENTRIES
--
-- Deprecated: 21.2
--
--==============================================================================
function get_files (
    p_zipped_blob in blob,
    p_only_files  in boolean  default true,
    p_encoding    in varchar2 default null )
    return t_files;

--==============================================================================
-- This function returns a table of directory entries containing information 
-- about each file in the provided zip file. The returned table of records is
-- indexed by the file names, including the path.
--
-- Parameters:
-- * p_zipped_blob:   This is the BLOB containing the zip file.
-- * p_only_files:    Only return files, not directories, in the directory listing.
-- * p_encoding:      This is the encoding used to zip the file.
--
-- Returns:
-- A table of directory entries.
--
-- Example:
--
-- This example demonstrates reading a zip file from a table, extracting it and
-- storing all files of the zip file into `my_files`.
-- ```
-- declare
--     l_zip_file      blob;
--     l_unzipped_file blob;
--     l_dir           apex_zip.t_dir_entries;
--     l_file_path     varchar2(32767);
-- begin
--     select file_content
--       into l_zip_file
--       from my_zip_files
--      where file_name = 'my_file.zip';
--
--     l_dir := apex_zip.get_dir_entries (
--                    p_zipped_blob => l_zip_file );
--
--     l_file_path := l_dir.first;
--     while l_file_path is not null loop
--         l_unzipped_file := apex_zip.get_file_content (
--                                p_zipped_blob => l_zip_file,
--                                p_dir_entry   => l_dir(l_file_path) );
--
--         insert into my_files ( file_name, file_content )
--         values ( l_file_path, l_unzipped_file );
--
--         l_file_path := l_dir.next(l_file_path);
--     end loop;
-- end;
-- ```
--
-- See Also:
-- GET_FILE_CONTENT Function Signature 2
-- GET_FILES
--
--==============================================================================
function get_dir_entries(
    p_zipped_blob in blob,
    p_only_files  in boolean  default true,
    p_encoding    in varchar2 default null ) 
    return t_dir_entries;

--==============================================================================
-- This function returns the BLOB of a file contained in a provided zip file.
--
-- This overload of `get_file_content` is deprecated. The overload which accepts
-- a parameter of type `t_dir_entry` should be used instead. It is more efficient
-- especially when dealing with zip archives which contain many files, or those
-- which are accessed frequently.
--
-- Parameters:
-- * p_zipped_blob:   This is the BLOB containing the zip file.
-- * p_file_name:     File name, including path, of a file located in the zip file.
-- * p_encoding:      Encoding used to zip the file.
--
-- Returns:
-- BLOB of the file specified in `P_FILE_NAME`.
--
-- Example:
--
-- See [GET_FILES](@@GET_FILES) for an example.
--
-- See Also:
-- GET_FILES
--
-- Deprecated: 21.2
--
--==============================================================================
function get_file_content (
    p_zipped_blob in blob,
    p_file_name   in varchar2,
    p_encoding    in varchar2 default null )
    return blob;

--==============================================================================
-- This function returns the BLOB of a file contained in a provided zip file,
-- identified by the directory entry provided.
--
-- Parameters:
-- * p_zipped_blob:   This is the BLOB containing the zip file.
-- * p_dir_entry:     The directory entry describing the required file.
--
-- Returns:
-- BLOB of the file specified in the `P_DIR_ENTRY` record.
--
-- Example:
--
-- See [GET_DIR_ENTRIES](@@GET_DIR_ENTRIES) for an example.
--
-- See Also:
-- GET_DIR_ENTRIES
--
--==============================================================================
function get_file_content(
    p_zipped_blob in blob,
    p_dir_entry   in t_dir_entry )
    return blob;

--##############################################################################
-- Creating a zip file
--##############################################################################


--==============================================================================
-- This procedure adds a single file to a zip file. You can call this procedure
-- multiple times to add multiple files to the same zip file.
--
-- Note: After all files are added, you must call the `APEX_ZIP.FINISH` procedure.
--
-- Parameters:
-- * p_zipped_blob:   BLOB containing the zip file.
-- * p_file_name:     File name, including path, of the file to be added to the zip file.
-- * p_content:       BLOB containing the file.
--
-- Example:
--
-- This example reads multiple files from table `my_files` and puts them into a
-- single zip file.
-- ```
-- declare
--     l_zip_file blob;
-- begin
--     for l_file in ( select file_name,
--                            file_content
--                       from my_files )
--     loop
--         apex_zip.add_file (
--             p_zipped_blob => l_zip_file,
--             p_file_name   => l_file.file_name,
--             p_content     => l_file.file_content );
--     end loop;
--
--     apex_zip.finish (
--         p_zipped_blob => l_zip_file );
-- end;
-- ```
--
-- See Also:
-- FINISH
--
--==============================================================================
procedure add_file (
    p_zipped_blob in out nocopy blob,
    p_file_name   in     varchar2,
    p_content     in     blob );
--
--==============================================================================
-- This procedure completes the creation of a zip file after adding files
-- with `APEX_ZIP.ADD_FILE`.
--
-- Parameters:
-- * p_zipped_blob:   BLOB containing the zip file.
--
-- Example:
--
-- See [ADD_FILE](@@ADD_FILE) for an example.
--
-- See Also:
-- ADD_FILE
--
--==============================================================================
procedure finish (
    p_zipped_blob in out nocopy blob );
--
end wwv_flow_zip;
/
show errors

set define '^'
