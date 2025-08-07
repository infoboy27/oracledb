set define '^'
set verify off
prompt ...wwv_flow_image_jpeg
create or replace package wwv_flow_image_jpeg authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_image_jpeg.sql
--
--    DESCRIPTION
--      This package is responsible for parsing JPEG images
--
--------------------------------------------------------------------------------

type t_metadata is record (
    bits        pls_integer,
    width       pls_integer,
    height      pls_integer,
    color_space pls_integer );

--==============================================================================
-- Returns JPEG metadata
--==============================================================================
function get_metadata (
    p_data  in  blob )
    return t_metadata;

end wwv_flow_image_jpeg;
/
show errors