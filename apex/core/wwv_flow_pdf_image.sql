set define '^'
set verify off
prompt ...wwv_flow_pdf_image
create or replace package wwv_flow_pdf_image authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_pdf_image.sql
--
--    DESCRIPTION
--      This package is responsible for dealing with images in PDF files.
--      Currently only JPEG and PNG
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------
type t_n2_entry is record (
    n1                          pls_integer,
    n2                          pls_integer );

type t_n2_arr                   is table of t_n2_entry index by pls_integer;

type t_image is record (
    xobject_name                varchar2( 4 ),
    width                       pls_integer,
    height                      pls_integer,
    image_type                  varchar2( 5 ),
    bits_per_component          pls_integer,
    color_space                 varchar2( 50 ),
    colors                      pls_integer,
    palette                     raw( 768 ),
    image_data                  blob,
    mask                        t_n2_arr,
    has_alpha_channel           boolean,
    alpha_channel               blob,
    is_interlaced               boolean );

--==============================================================================
-- Parses an image BLOB
--==============================================================================
function parse (
    p_data  in  blob )
    return t_image;

--==============================================================================
-- Free the image resources
--==============================================================================
procedure free (
    p_image in out nocopy t_image );

end wwv_flow_pdf_image;
/
show errors