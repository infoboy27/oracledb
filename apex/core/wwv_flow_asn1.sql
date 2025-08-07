set define '^' verify off
prompt ...wwv_flow_asn1.sql
create or replace package wwv_flow_asn1 as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
-- NAME
--   wwv_flow_asn1.sql
--
-- DESCRIPTION
--   Utility package to read/write ASN.1 in DER encoding, which is e.g. used in
--   X.509 certificates.
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  10/15/2019 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- The encoding uses a Tag-Length-Value format, where the tag indicates what
-- kind of data follows. Below are the built-in (universal) tag classes.
--==============================================================================
subtype t_tag_number is pls_integer range 0 .. 255; -- value type:
c_end_of_content    constant t_tag_number := 0;     -- -
c_boolean           constant t_tag_number := 1;     -- number (0=false, 1=true)
c_integer           constant t_tag_number := 2;     -- number,raw
c_bit_string        constant t_tag_number := 3;     -- raw,varchar2
c_octet_string      constant t_tag_number := 4;     -- raw
c_null              constant t_tag_number := 5;     -- -
c_object_identifier constant t_tag_number := 6;     -- varchar2
c_object_descriptor constant t_tag_number := 7;     -- number
c_external          constant t_tag_number := 8;     -- raw
c_real              constant t_tag_number := 9;     -- number
c_enumerated        constant t_tag_number := 10;    -- number
c_embedded_pdv      constant t_tag_number := 11;    -- raw
c_utf8string        constant t_tag_number := 12;    -- number
c_relative_oid      constant t_tag_number := 13;    -- number
c_time              constant t_tag_number := 14;    -- number
c_reserved          constant t_tag_number := 15;    -- -
c_sequence          constant t_tag_number := 16;    -- child_ids
c_set               constant t_tag_number := 17;    -- child_ids
c_numericstring     constant t_tag_number := 18;    -- varchar2
c_printablestring   constant t_tag_number := 19;    -- varchar2
c_t61string         constant t_tag_number := 20;    -- varchar2
c_videotexstring    constant t_tag_number := 21;    -- varchar2
c_ia5string         constant t_tag_number := 22;    -- varchar2
c_utctime           constant t_tag_number := 23;    -- timestamp
c_generalizedtime   constant t_tag_number := 24;    -- timestamp
c_graphicstring     constant t_tag_number := 25;    -- varchar2
c_visiblestring     constant t_tag_number := 26;    -- varchar2
c_generalstring     constant t_tag_number := 27;    -- varchar2
c_universalstring   constant t_tag_number := 28;    -- varchar2
c_character_string  constant t_tag_number := 29;    -- varchar2
c_bmpstring         constant t_tag_number := 30;    -- varchar2
c_date              constant t_tag_number := 31;    -- varchar2
c_time_of_day       constant t_tag_number := 32;    -- varchar2
c_date_time         constant t_tag_number := 33;    -- varchar2
c_duration          constant t_tag_number := 34;    -- varchar2
c_oid_iri           constant t_tag_number := 35;    -- varchar2
c_relative_oid_iri  constant t_tag_number := 36;    -- varchar2

--==============================================================================
-- The tag class specifies if the tag is in the list above (universal) or
-- specific.
--==============================================================================
subtype t_tag_class is pls_integer range 0 .. 3;
c_tc_universal      constant t_tag_class := 0;
c_tc_application    constant t_tag_class := 1;
c_tc_context        constant t_tag_class := 2;
c_tc_private        constant t_tag_class := 3;

--==============================================================================
-- A record type for tag, length and value. The value attributes are set,
-- depending on the tag. See comments for t_tag_number values above.
--==============================================================================
type t_record is record (
    tag             t_tag_number,
    tag_class       t_tag_class,
    input_start     pls_integer,         -- offset in p_input where this record
                                         -- starts
    input_length    pls_integer,         -- byte length of this record
                                         -- (including tag and length part)
    value_length    pls_integer,         -- byte length of the value part
    number_value    number,              -- value, converted to number
    varchar2_value  varchar2(32767),     -- value, converted to varchar2
    timestamp_value timestamp with time zone, -- value, converted to tstz
    raw_value       raw(32767),          -- raw value
    child_ids       wwv_flow_t_number ); -- t_records indexes of children
type t_records is table of t_record;

--##############################################################################
--#
--# READING
--#
--##############################################################################

--==============================================================================
-- Decode DER-encoded data.
--
-- PARAMETERS
-- * p_input: The raw encoded input.
--
-- RETURNS
-- * A table of tag/length/value records.
--
-- EXAMPLE
--   Decode the given input and print the tag/length/value elements.
--
--   declare
--      l_input raw(4000) := hextoraw(replace (
--             '30 13 02 01 05 16 0e 41 6e 79 62 6f 64 79 20 74 68 65 72 65 3f',
--             ' ',null));
--      l_records wwv_flow_asn1.t_records;
--   begin
--      l_records := wwv_flow_asn1.decode (
--                       p_input => l_input );
--      for i in 1 .. l_records.count loop
--         sys.dbms_output.put_line (
--             i||': '||wwv_flow_asn1.tochar(l_records(i)));
--      end loop;
--   end;
--   ->
--   1: Tag=16, Length=19, Value=-> 2,3
--   2: Tag=2, Length=1, Value=5
--   3: Tag=22, Length=14, Value=Anybody there?
--==============================================================================
function decode (
    p_input in raw )
    return t_records;

--==============================================================================
-- Return the record at a given position and assert it's tag.
--
-- PARAMETERS
-- * p_records:      A t_records value, as returned by decode.
-- * p_pos:          Position within the record.
-- * p_has_tag:      Assert the referenced record's tag.
-- * p_min_children: Assert the referenced record's nr of children. No check if
--                   the value is null.
-- * p_max_children: Assert the maximum number of children.
--
-- RETURNS
-- * The t_record at position p_pos.
--
-- RAISES
-- * NO_DATA_FOUND: Record at p_pos does not exist.
-- * VALUE_ERROR:   Record at p_pos has a different tag or different number of
--                  children.
--==============================================================================
function get (
    p_records      in t_records,
    p_pos          in pls_integer,
    p_has_tag      in t_tag_number,
    p_min_children in pls_integer default null,
    p_max_children in pls_integer default null )
    return t_record;

--##############################################################################
--#
--# WRITING
--#
--##############################################################################

--==============================================================================
-- Return a printable value for a record, useful for debugging.
--
-- PARAMETERS
-- * p_record:       The record.
--==============================================================================
function tochar (
    p_record in t_record )
    return varchar2;

end wwv_flow_asn1;
/
show err

