set define '^' verify off
prompt ...wwv_flow_barcode_api
create or replace package wwv_flow_barcode_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_barcode_api.plb
--
--    DESCRIPTION
--      The APEX_BARCODE package contains the implementation to generate different
--      types of Barcode. The supported output type are SVG value or PNG File BLOB
--
--    Since: 23.2
--
--    MODIFIED   (MM/DD/YYYY)
--    yadli      11/25/2022 - Created
--

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- Data Types
--==============================================================================

-- Subtype for the error correction level of a QR code
subtype t_eclevel_type      is varchar2(1);

--==============================================================================
-- Constants
--==============================================================================

-- The error correction level determines the percentage of the total QR code that is allowed to be dirty or
-- damaged without being unable to read.
-- c_eclevel_type_low      ('L')  7% of data bytes can be restored.
-- c_eclevel_type_medium   ('M') 15% of data bytes can be restored.
-- c_eclevel_type_quartile ('Q') 25% of data bytes can be restored.
-- c_eclevel_type_high     ('H') 30% of data bytes can be restored.
c_eclevel_type_low          constant t_eclevel_type := 'L';
c_eclevel_type_medium       constant t_eclevel_type := 'M';
c_eclevel_type_quartile     constant t_eclevel_type := 'Q';
c_eclevel_type_high         constant t_eclevel_type := 'H';

c_default_foreground_color  constant varchar2(7)    := '#000000';
c_default_background_color  constant varchar2(7)    := '#FFFFFF';
c_default_quiet             constant number         := 1;
c_default_eclevel           constant t_eclevel_type := c_eclevel_type_high;
c_default_margin            constant number         := 2;
c_default_max_input_length  constant number         := 4000;


c_default_scale             constant number         := 1;
c_default_size              constant number         := 256;
c_default_width             constant number         := 256;
c_default_height            constant number         := 256;

--==================================================================================================================
-- This function generates a QR code, configured according to the specified options, and returns a CLOB in SVG format.
--
-- Parameters:
-- * p_value             Value to be encoded into the QR Code.
-- * p_size              Size of the QR code (in pixels). Defaults to 256px.
-- * p_foreground_color  Foreground color. Must be in hex code. Defaults to #000000.
-- * p_background_color  Background color. Must be in hex code. Defaults to null (transparent).
-- * p_quiet             Blank area (positive integer value) around the QR Code used to help the scanners clearly
--                       distinguish the QR Code from its surroundings for good scannability. Defaults to 1.
-- * p_eclevel           The error correction level (possible values: 'L', 'M', 'Q', 'H'). Defaults to
--                       c_eclevel_type_high.
--                       The level determines the percentage of the total QR code that is allowed to be dirty or
--                       damaged without being unable to read.
--                       c_eclevel_type_low      ('L')	7% of data bytes can be restored.
--                       c_eclevel_type_medium   ('M') 15% of data bytes can be restored.
--                       c_eclevel_type_quartile ('Q') 25% of data bytes can be restored.
--                       c_eclevel_type_high     ('H') 30% of data bytes can be restored.
--
--
-- Returns:
-- The SVG value of the QR Code.
--
-- Example:
-- Generates an SVG QR Code with a determined foreground and background color. This function is
-- usually used in rendering QR Code page item.
--
-- declare
--   l_output clob;
-- begin
--   l_output := apex_barcode.get_qrcode_svg(
--                   p_value            => 'apex.oracle.com',
--                   p_foreground_color => '#4cd964',
--                   p_background_color => '#c7c7cc' );
--
--   sys.dbms_outout.put_line( l_output );
--  end;
-- Since: 23.2
--==================================================================================================================
function get_qrcode_svg(
    p_value             in varchar2,
    p_size              in number         default c_default_size,
    p_quiet             in number         default c_default_quiet,
    p_eclevel           in t_eclevel_type default c_default_eclevel,
    p_foreground_color  in varchar2       default c_default_foreground_color,
    p_background_color  in varchar2       default null )
    return clob;

--==================================================================================================================
-- This function generates a QR code, configured according to the specified options, and returns a BLOB in PNG format.
--
-- Parameters:
-- * p_value             Value to be encoded into the QR Code.
-- * p_scale             Makes the orignial PNG p_scale times larger (integer 1-10). Defaults to 1. The original size is
--                       determined by the input length.
-- * p_quiet             Blank area (positive integer value) around the QR Code used to help the scanners clearly
--                       distinguish the QR Code from its surroundings for good scannability. Defaults to 1.
-- * p_eclevel           The error correction level (possible values: 'L', 'M', 'Q', 'H'). Defaults to
--                       c_eclevel_type_high.
--                       The level determines the percentage of the total QR code that is allowed to be dirty or damaged
--                       without being unable to read.
--                       c_eclevel_type_low      ('L')	7% of data bytes can be restored.
--                       c_eclevel_type_medium   ('M') 15% of data bytes can be restored.
--                       c_eclevel_type_quartile ('Q') 25% of data bytes can be restored.
--                       c_eclevel_type_high     ('H') 30% of data bytes can be restored.
-- * p_foreground_color  Foreground color. Must be in hex code. Defaults to #000000.
-- * p_background_color  Background color. Must be in hex code. Defaults to null (transparent).
--
-- Returns:
-- The QR Code PNG Image file.
--
-- Example:
-- Generates a QR Code PNG file with a determined foreground and background color. This function is
-- usually used when a QR code image file is needed.
--
--   declare
--     l_output blob;
--   begin
--     l_output := apex_barcode.get_qrcode_png(
--                     p_value            => 'apex.oracle.com',
--                     p_scale            => 1,
--                     p_quiet            => 5,
--                     p_eclevel          => c_eclevel_type_high,
--                     p_foreground_color => '#4cd964',
--                     p_background_color => '#c7c7cc' );
--
--   end;
-- Since: 23.2
--==================================================================================================================
function get_qrcode_png(
    p_value             in varchar2,
    p_scale             in number         default c_default_scale,
    p_quiet             in number         default c_default_quiet,
    p_eclevel           in t_eclevel_type default c_default_eclevel,
    p_foreground_color  in varchar2       default c_default_foreground_color,
    p_background_color  in varchar2       default null )
    return blob;


--==================================================================================================================
-- This function generates a Code 128 Barcode, configured according to the specified options, and returns a CLOB
-- in SVG format.
--
-- Parameters:
-- * p_value             Value to be encoded into the Code 128 Barcode.
-- * p_size              Size of the Code 128 Barcode (in pixels). Defaults to 256px.
-- * p_foreground_color  Foreground color. Must be in hex code. Defaults to #000000.
-- * p_background_color  Background color. Must be in hex code. Defaults to null (transparent).
--
-- Returns:
-- The SVG value of the Code 128 Barcode.
--
-- Example:
-- Generates an SVG Code 128 type barcode with specified foreground color, and background color.
--   declare
--     l_output clob;
--   begin
--     l_output := apex_barcode.get_code128_svg(
--                     p_value            => 'apex.oracle.com',
--                     p_foreground_color => '#4cd964',
--                     p_background_color => '#c7c7cc' );
--
--    sys.dbms_outout.put_line( l_output );
--
--   end;
-- Since: 23.2
--==================================================================================================================
function get_code128_svg(
    p_value             in varchar2,
    p_size              in number   default c_default_size,
    p_foreground_color  in varchar2 default c_default_foreground_color,
    p_background_color  in varchar2 default null )
    return clob;


--==================================================================================================================
-- This function generates a Code 128 Barcode, configured according to the specified options, and returns a BLOB
-- in PNG format.
--
-- Parameters:
-- * p_value             Value to be encoded into the Code 128 Barcode.
-- * p_scale             Makes the orignial PNG p_scale times larger (integer 1-10). Defaults to 1. The original size is
--                       determined by the input length.
-- * p_foreground_color  Foreground color. Must be in hex code. Defaults to #000000.
-- * p_background_color  Background color. Must be in hex code. Defaults to null (transparent).
--
-- Returns:
-- The Code 128 Barcode PNG Image file.
--
-- Example:
-- Generates an PNG Code 128 type barcode file with specified scale, foreground color, and background color.
--
--   declare
--     l_output blob;
--   begin
--     l_output := apex_barcode.get_code128_png(
--                     p_value            => 'apex.oracle.com',
--                     p_scale            => 1,
--                     p_foreground_color => '#4cd964',
--                     p_background_color => '#c7c7cc' );
--
--   end;
-- Since: 23.2
--==================================================================================================================
function get_code128_png(
    p_value             in varchar2,
    p_scale             in number   default c_default_scale,
    p_foreground_color  in varchar2 default c_default_foreground_color,
    p_background_color  in varchar2 default null )
    return blob;


--==================================================================================================================
-- This function generates an EAN 8 Barcode, configured according to the specified options, and returns a CLOB
-- in SVG format.
--
-- Parameters:
-- * p_value             Value to be encoded into the EAN 8 Barcode. Format is digits only with a maximum of 8 digits.
-- * p_size              Size of the EAN 8 Barcode (in pixels). Defaults to 256px.
-- * p_foreground_color  Foreground color. Must be in hex code. Defaults to #000000.
-- * p_background_color  Background color. Must be in hex code. Defaults to null (transparent).
--
-- Returns:
-- The SVG value of the EAN 8 Barcode.
--
-- Raises:
-- WWV_FLOW_BARCODE_API.NUMERIC_INPUT_ERROR: when p_value exceeds 8 digits.
--
-- Example:
-- Generates an SVG EAN 8 type of barcide with specified foreground and background colors.
--
--   declare
--     l_output clob;
--   begin
--     l_output := apex_barcode.get_ean8_svg(
--                     p_value            => '12345678',
--                     p_foreground_color => '#4cd964',
--                     p_background_color => '#c7c7cc');
--
--    sys.dbms_outout.put_line( l_output );
--
--   end;
-- Since: 23.2
--==================================================================================================================
function get_ean8_svg(
    p_value             in varchar2,
    p_size              in number   default c_default_size,
    p_foreground_color  in varchar2 default c_default_foreground_color,
    p_background_color  in varchar2 default null )
    return clob;


--==================================================================================================================
-- This function generates an EAN 8 Barcode, configured according to the specified options, and returns a BLOB
-- in PNG format.
--
-- Parameters:
-- * p_value             Value to be encoded into the EAN 8 Barcode. Format is digits only with a maximum of 8 digits.
-- * p_scale             Makes the orignial PNG p_scale times larger (integer 1-10). Defaults to 1. The original size is
--                       determined by the input length.
-- * p_foreground_color  Foreground color. Must be in hex code. Defaults to #000000.
-- * p_background_color  Background color. Must be in hex code. Defaults to null (transparent).
--
-- Returns:
-- The EAN 8 Barcode PNG Image file.
--
-- Raises:
-- WWV_FLOW_BARCODE_API.NUMERIC_INPUT_ERROR: when p_value exceeds 8 digits.
--
-- Example:
-- Generates a PNG EAN 8 type of barcode file with desired scale, foreground color, and background color.
--
--   declare
--     l_output blob;
--   begin
--     l_output := apex_barcode.get_ean8_png(
--                     p_value            => '12345678',
--                     p_scale            => 1,
--                     p_foreground_color => '#4cd964',
--                     p_background_color => '#c7c7cc' );
--
--   end;
-- Since: 23.2
--==================================================================================================================
function get_ean8_png(
    p_value             in varchar2,
    p_scale             in number   default c_default_scale,
    p_foreground_color  in varchar2 default c_default_foreground_color,
    p_background_color  in varchar2 default null )
    return blob;


end wwv_flow_barcode_api;
/
show errors