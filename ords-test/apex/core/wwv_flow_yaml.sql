set define '^' verify off
prompt ...wwv_flow_yaml.sql
create or replace package wwv_flow_yaml authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2024, Oracle and/or its affiliates.
--
--  This package contains procedures to generate YAML-formatted
--  output. Use the overloaded OPEN_%, CLOSE_% and WRITE procedures
--  for writing to a temporary CLOB, use INITIALIZE_CLOB_OUTPUT,
--  GET_CLOB_OUTPUT and FREE_OUTPUT for managing the output buffer.
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# CONVERSION UTILITIES
--#
--##############################################################################
c_document_start constant varchar2(3) := '---';

--==============================================================================
-- convert p_value (varchar2) to an escaped YAML value
--==============================================================================
function stringify (
    p_value in varchar2 )
    return varchar2;

--==============================================================================
-- convert p_value (number) to an escaped YAML value
--==============================================================================
function stringify (
    p_value in number )
    return varchar2;

--==============================================================================
-- convert p_value (boolean) to an escaped YAML value
--==============================================================================
function stringify (
    p_value in boolean )
    return varchar2;

--##############################################################################
--#
--# OUTPUT INTERFACE
--#
--##############################################################################

--==============================================================================
-- Initialize the output interface to write to a temporary CLOB. If using
-- CLOB output, you should call FREE_OUTPUT at the end. to free the CLOB.
--
-- Parameters
-- * p_dur:      duration of the temporary CLOB. this can be
--               DBMS_LOB.SESSION or DBMS_LOB.CALL (the default).
-- * p_cache:    specifies if the lob should be read into buffer cache or
--               not.
-- * p_preserve: Whether to preserve the currently active output object. After
--               calling free_output, subsequent write calls will be executed on
--               the preserved output. Defaults to "false". If HTP output has
--               already been initialized and a CLOB needs to be created, use
--               p_preserve => true. After free_output, sunsequent output will
--               be directed to the original HTP output again. Note that
--               free_output *must* be called after YAML processing, if p_preserve was
--               set to true.
--
-- See Also:
-- GET_CLOB_OUTPUT
-- FREE_OUTPUT
--==============================================================================
procedure initialize_clob_output (
    p_dur      in pls_integer default sys.dbms_lob.call,
    p_cache    in boolean     default true,
    p_preserve in boolean     default false );

--==============================================================================
-- Free output resources. call this procedure after processing, if you are
-- using initialize_clob_output to write to a temporary CLOB.
--
-- See Also:
-- INITIALIZE_CLOB_OUTPUT
-- GET_CLOB_OUTPUT
-- FREE_OUTPUT
--==============================================================================
procedure free_output;

--==============================================================================
-- Return the temporary clob that you created with initialize_clob_output.
--
-- Parameters:
-- * p_free:  Free output resources, if true. Defaults to false.
--
-- See Also:
-- INITIALIZE_CLOB_OUTPUT
-- FREE_OUTPUT
--==============================================================================
function get_clob_output(
    p_free in boolean default false )
    return clob;

--==============================================================================
-- Flush pending changes to write incomplete YAML.
--==============================================================================
procedure flush;

--==============================================================================
-- write {
--
-- Parameters:
-- * p_name: If not null, write an object attribute name and colon before the
--           opening brace.
--==============================================================================
procedure open_object (
    p_name    in varchar2 default null,
    p_comment in varchar2 default null );

--==============================================================================
-- write }
--==============================================================================
procedure close_object;

--==============================================================================
-- write [
--
-- Parameters:
-- * p_name: If not null, write an object attribute name and colon before the
--           opening bracket.
--==============================================================================
procedure open_array (
    p_name    in varchar2 default null,
    p_comment in varchar2 default null );

--==============================================================================
-- write ]
--==============================================================================
procedure close_array;

--==============================================================================
-- close all objects and arrays up to the outermost nesting level
--==============================================================================
procedure close_all;

--==============================================================================
-- Write array attribute of type varchar2.
--
-- Parameters:
-- * p_value: The value to be written
--==============================================================================
procedure write (
    p_value   in varchar2,
    p_comment in varchar2 default null );

--==============================================================================
-- Write array attribute of type clob.
--
-- Parameters:
-- * p_value: The value to be written
--==============================================================================
procedure write (
    p_value   in clob,
    p_comment in varchar2 default null );

--==============================================================================
-- Write array attribute
--
-- Parameters:
-- * p_value: The value to be written
--==============================================================================
procedure write (
    p_value   in number,
    p_comment in varchar2 default null );

--==============================================================================
-- Write array attribute
--
-- Parameters:
-- * p_value: The value to be written
--==============================================================================
procedure write (
    p_value   in boolean,
    p_comment in varchar2 default null );

--==============================================================================
-- Write an object attribute of type varchar2
--
-- Parameters:
-- * p_name:         The attribute name
-- * p_value:        The attribute value to be written
-- * p_write_null:   If true, write null values. If false (the default), do not
--                   write nulls.
-- * p_comment:      Comment text added after the attribute value
--==============================================================================
procedure write (
    p_name       in varchar2,
    p_value      in varchar2,
    p_write_null in boolean  default false,
    p_comment    in varchar2 default null );

--==============================================================================
-- Write an object attribute
--
-- Parameters:
-- * p_name:         The attribute name
-- * p_value:        The attribute value to be written
-- * p_write_null:   If true, write null values. If false (the default), do not
--                   write nulls.
-- * p_comment:      Comment text added after the attribute value
--==============================================================================
procedure write (
    p_name       in varchar2,
    p_value      in clob,
    p_write_null in boolean  default false,
    p_comment    in varchar2 default null );

--==============================================================================
-- Write an object attribute
--
-- Parameters:
-- * p_name:         The attribute name
-- * p_value:        The attribute value to be written
-- * p_write_null:   If true, write null values. If false (the default), do not
--                   write nulls.
-- * p_comment:      Comment text added after the attribute value
--==============================================================================
procedure write (
    p_name        in varchar2,
    p_value       in number,
    p_write_null  in boolean  default false,
    p_comment     in varchar2 default null );

--==============================================================================
-- Write an object attribute
--
-- Parameters:
-- * p_name:         The attribute name
-- * p_value:        The attribute value to be written
-- * p_write_null:   If true, write null values. If false (the default), do not
--                   write nulls.
-- * p_comment:      Comment text added after the attribute value
--==============================================================================
procedure write (
    p_name       in varchar2,
    p_value      in boolean,
    p_write_null in boolean  default false,
    p_comment    in varchar2 default null );

--==============================================================================
-- Write an array attribute of type varchar2
--
-- Parameters:
-- * p_name:         The attribute name
-- * p_values:       The varchar2 array values to be written
-- * p_write_null:   If true, write an empty array. If false (the default), do not
--                   write an empty array.
-- * p_comment:      Comment text added after the attribute value
--==============================================================================
procedure write (
    p_name       in varchar2,
    p_values     in wwv_flow_t_varchar2,
    p_write_null in boolean  default false,
    p_comment    in varchar2 default null );

--==============================================================================
-- Write an array attribute of type number
--
-- Parameters:
-- * p_name:         The attribute name
-- * p_values:       The number array values to be written
-- * p_write_null:   If true, write an empty array. If false (the default), do not
--                   write an empty array.
-- * p_comment:      Comment text added after the attribute value
--==============================================================================
procedure write (
    p_name       in varchar2,
    p_values     in wwv_flow_t_number,
    p_write_null in boolean  default false,
    p_comment    in varchar2 default null );

--==============================================================================
-- Write a comment line
--==============================================================================
procedure write_comment (
    p_comment in varchar2 );

--##############################################################################
--#
--# UNSAFE RAW OUTPUT
--#
--##############################################################################

--==============================================================================
-- Write an unescaped array attribute. use the escaping write() procedures
-- instead, if possible.
--
-- Parameters:
-- * p_value:    The value to be written
--==============================================================================
procedure write_raw (
    p_value in varchar2 );

--==============================================================================
-- Write an unescaped array attribute. use the escaping write() procedures
-- instead, if possible.
--
-- Parameters:
-- * p_value:    The value to be written which can be longer than 32KB
--==============================================================================
procedure write_raw (
    p_value in wwv_flow_global.vc_arr2 );

--==============================================================================
-- Write an unescaped object value. Use the escaping WRTE procedures
-- instead, if possible.
--
-- Parameters:
-- * p_name:  The attribute name
-- * p_value: The raw value to be written.
--==============================================================================
procedure write_raw (
    p_name  in varchar2,
    p_value in varchar2 );

--==============================================================================
-- Write an unescaped object value. Use the escaping WRITE procedures
-- instead, if possible.
--
-- Parameters:
-- * p_name:  The attribute name
-- * p_value: The raw value to be written.
--==============================================================================
procedure write_raw (
    p_name  in varchar2,
    p_value in clob );

end wwv_flow_yaml;
/
show err
