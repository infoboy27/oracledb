set define '^' verify off
prompt ...wwv_flow_char_reader.sql
create or replace package wwv_flow_char_reader as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_char_reader.sql
--
--    DESCRIPTION
--      This is the basis for doing lexical analysis in PL/SQL
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    02/07/2013 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- utility types and constants
--==============================================================================
subtype t_char is char(1 char);                 -- a single character

LF constant t_char        := unistr('\000a');   -- line separator character
CR constant t_char        := unistr('\000d');
CRLF constant varchar2(2) := CR||LF;
WS constant varchar2(5)   := unistr(' \0009\000a\000b\000d'); -- white space

type t_pos is record (
    line              simple_integer := 0,      -- currrent line number
    col               simple_integer := 0,      -- current column number
    idx               simple_integer := 0       -- character index
);

--==============================================================================
-- char_reader state
--==============================================================================
type t is record (
    --
    -- public fields (read/write)
    --
    input             wwv_flow_global.vc_arr2,  -- input text
    is_line_separated boolean not null := true, -- true if the char_reader should assume LF between input(n) and input(n+1)
    --
    -- read-only fields
    --
    pos               t_pos,                    -- current line/column position
    --
    -- private fields
    --
    putback           varchar2(32767),          -- stack of unread characters
    putback_length    simple_integer := 0,      -- length of putback
    cur_input         varchar2(32767),          -- copy of input(cur_input_idx) for performance
    cur_input_pos     simple_integer := 1,      -- cursor position in cur_input
    cur_input_length  simple_integer := 0,      -- length(cur_input)
    cur_input_idx     simple_integer := 0,      -- index of cur_input within input. if 0 -> not initialized
    input_count       simple_integer := 0       -- input.count
);

--==============================================================================
-- read next character
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_char: read character
--
-- RETURNS
--   next character
--==============================================================================
procedure read (
    p_this in out nocopy t,
    p_char in out nocopy t_char );

--==============================================================================
-- read next character that is not white space
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_char: read character
--==============================================================================
procedure read_non_ws (
    p_this in out nocopy t,
    p_char in out nocopy t_char );

--==============================================================================
-- read all characters that are allowed in PL/SQL identifiers (A-Za-z0-9_$#)
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_result: varchar2 buffer where the procedure appends identifier chars
--==============================================================================
procedure read_plsql_identifer_chars (
    p_this   in out nocopy t,
    p_result in out nocopy varchar2 );

--==============================================================================
-- read until eof or p_char is found, or limit is reached. return last char.
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_char: the character after which reading stops
-- * p_esc_char: optional escaping character, stops reading
-- * p_max_length: maximum result length, stops reading if reached
-- * p_result: (optional) buffer for read characters, except last one
--==============================================================================
function read_until (
    p_this     in out nocopy t,
    p_char     in            t_char )
    return t_char;
function read_until (
    p_this       in out nocopy t,
    p_char       in            t_char,
    p_esc_char   in            t_char      default null,
    p_max_length in            pls_integer default 32767,
    p_result     in out nocopy varchar2 )
    return t_char;

--==============================================================================
-- put character back. if called multiple times, the next characters that read
-- yields are in the unread order.
--
-- EXAMPLE
--   unread(t, 'x');
--   unread(t, 'y');
--   read(t, c);     -- y
--   read(t, c);     -- x
--
-- ARGUMENTS
-- * p_this: char_reader state
-- * p_char: character to put back.
--==============================================================================
procedure unread (
    p_this in out nocopy t,
    p_char in t_char );

end wwv_flow_char_reader;
/
show err

