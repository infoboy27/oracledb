set define '^' verify off
prompt ...wwv_flow_ooxml.sql
create or replace package wwv_flow_ooxml as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2020 - 2023. All Rights Reserved.
--
-- NAME
--   wwv_flow_ooxml.sql
--
-- DESCRIPTION
--   Package for creating Office Open XML Documents (OOXML)
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
subtype t_hash              is varchar2( 32767 );
subtype t_media_type        is varchar2( 10 );
subtype t_extension         is varchar2( 30 );
subtype t_file_name         is varchar2( 255 );
subtype t_part_name         is varchar2( 4000 );
subtype t_directory_name    is varchar2( 3745 );
subtype t_rel_id            is varchar2( 4000 );

type t_part is record (
    part_name               t_part_name,
    content                 wwv_flow_t_blob_writer,
    rel_counter             pls_integer );

type t_parts                is table of t_part index by t_part_name;

type t_media_file is record (
    media_type              t_media_type,
    file_name               t_file_name,
    extension               varchar2( 30 ),
    mime_type               varchar2( 80 ),
    width                   number,
    height                  number );

type t_media_files          is table of t_media_file index by t_hash;

type t_media_directories    is table of t_media_files index by t_directory_name;

type t_extensions           is table of t_extension;

type t_doc is record (
    media_directories       t_media_directories,
    extensions              t_extensions,
    image_placeholder       blob,
    max_images              number,
    zip                     blob,
    -- parts
    root_rels               t_part,
    content_types           t_part,
    app                     t_part,
    core                    t_part );

type t_image is record (
    file_name               t_file_name,
    width                   number,
    height                  number );

type t_nls_settings is record (
    ms_lcid                 wwv_flow_languages.ms_lcid%type,
    ds_format               wwv_flow_languages.ds_format%type,
    dl_format               wwv_flow_languages.dl_format%type,
    ts_format               wwv_flow_languages.ts_format%type );

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
c_xml_declaration constant varchar2( 56 ) := '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' || chr( 10 );

--==============================================================================
-- Initializes a new document
--==============================================================================
function init (
    p_image_placeholder in blob default null )
    return t_doc;

--==============================================================================
-- Initializes a new part in the document
--==============================================================================
function add_part ( 
    p_doc           in out nocopy   t_doc,
    p_name          in              t_part_name,
    p_content_type  in              varchar2     default null )
    return t_part;

--==============================================================================
-- Initializes the a .rels file
--==============================================================================
procedure init_relationships ( 
    p_part in out nocopy t_part );

--==============================================================================
-- Adds an image BLOB as media
--==============================================================================
function add_media_image_part ( 
    p_doc           in out nocopy   t_doc,
    p_directory     in              t_directory_name,
    p_image         in              blob,
    p_file_name     in              varchar2         default null,
    p_mime_type     in              varchar2         default null,
    p_check_max     in              boolean          default true )
    return t_image;

--==============================================================================
-- Adds a relationship for the package as a whole
--==============================================================================
procedure add_root_relation (     
    p_doc       in out nocopy   t_doc,
    p_id        in out nocopy   varchar2,
    p_type      in              varchar2,
    p_target    in              t_part_name );

--==============================================================================
-- Adds a relationship for a specific part
--==============================================================================
procedure add_part_relation ( 
    p_part      in out nocopy   t_part,
    p_id        in out nocopy   varchar2,
    p_type      in              varchar2,
    p_target    in              t_part_name );

--==============================================================================
-- Frees the resources
--==============================================================================
procedure free_part( 
    p_part  in out nocopy   t_part );

--==============================================================================
-- Frees the resources
--==============================================================================
procedure free_doc( 
    p_doc   in out nocopy   t_doc );

--==============================================================================
-- Closes and returns the document
--==============================================================================
procedure close_part( 
    p_doc   in out nocopy   t_doc,
    p_part  in out nocopy   t_part );

--==============================================================================
-- Closes and returns the document
--==============================================================================
function close_doc( 
    p_doc   in out nocopy   t_doc )
    return blob;

--==============================================================================
-- Casts a number to varchar2
-- The decimal separator is always a point (.), and no thousands separator may be used.
--==============================================================================
function format_number ( 
    p_value in number )
    return varchar2;

--==============================================================================
-- Casts a date to varchar2
-- Representing a Serial Date-Time
--
-- There are two ways to store a date in OOXML:
-- - As number (Serial Date-Time)
-- - As ISO 8601 string
--
-- For backward compatibility (Excel 2007) we store dates as Serial Date-Time numbers 
--
-- Also Excel does not support timezones:
-- (See: https://superuser.com/questions/1153794/how-can-i-display-a-utc-date-time-value-in-the-users-local-time-zone-in-excel)
--==============================================================================
function format_date ( 
    p_value in date )
    return varchar2;

--==============================================================================
-- Casts a boolean to varchar2
-- Can be: true / false 
-- or 1 / 0 (preferred because shorter file size)
--==============================================================================
function format_boolean ( 
    p_value in boolean )
    return varchar2;

--==============================================================================
-- Gets NLS settings which are relevant for OOXML documents
--==============================================================================
function get_nls_settings return t_nls_settings;

end wwv_flow_ooxml;
/
show err

