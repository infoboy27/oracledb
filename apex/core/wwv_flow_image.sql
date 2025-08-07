set define '^'
set verify off
prompt ...wwv_flow_image
create or replace package wwv_flow_image authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_image.sql
--
--    DESCRIPTION
--      This package is responsible for dealing with images in PDF files.
--      Currently only JPEG and PNG
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
c_JPEG              constant varchar2( 4 ) := 'JPEG';
c_PNG               constant varchar2( 3 ) := 'PNG';

--------------------------------------------------------------------------------
-- Exceptions
--------------------------------------------------------------------------------
e_invalid_image     exception;

--==============================================================================
-- Returns the type of an image
--==============================================================================
function get_image_type (
    p_data  in  blob )
    return varchar2;

end wwv_flow_image;
/
show errors