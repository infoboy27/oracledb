set define '^' verify off
prompt ...wwv_flow_pltable_util.sql
create or replace package wwv_flow_pltable_util as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
-- NAME
--   wwv_flow_pltable_util.sql
--
-- DESCRIPTION
--   Utilities for PL/SQL tables.
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  12/08/2022 - Created
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# MANAGING PENDING CHANGES
--#
--##############################################################################

--==============================================================================
-- A change index accompanies a data table of records. It implements:
--
-- (1) A lookup to the record entry by "key" (a varchar2 value of the primary
--     key).
-- (2) A sparse table of data table indexes, which have pending merges to the
--     base table.
-- (3) A sparse table of data table indexes, which have pending deletes to the
--     base table.
--
-- The change index controls access to the data table. Use put_key() to get the
-- data table index for making changes. Use find() to get the data table index
-- for retrieving values.
--
-- Example:
--   Our data table is a ficticious table of my_t_row:
--
--     my_t_rows (
--         1 => my_t_row(key=>'hello',other_values=>111),
--         2 => my_t_row(key=>'world',other_values=>222),
--         3 => my_t_row(key=>'foo'  ,other_values=>333))
--
--   For the change index, let's assume that 'hello' hashes to 9876 and both
--   'world' and 'foo' hash to 1234. The 'foo' key was inserted before 'world',
--   so it comes first under the 1234 key. Let's also assume that there is a
--   pending delete for 'world'. Therefore, deletes contains a record for data
--   index 2 ('world') that references the hash where it can be found (1234).
--
--     t_change_index (
--         int#elts    => t_index_elts (
--                            1234 => t_index_elt (
--                                       idx       => 3,
--                                       key       => 'foo',
--                                       overflows => t_index_values (
--                                                        idx => 2,
--                                                        key => 'world' )),
--                            9876 => t_index_elt (
--                                       idx       => 1,
--                                       key       => 'hello',
--                                       overflows => null )),
--         int#cur_idx => 3,
--         merges      => null,
--         deletes     => t_idxs (
--                            2 => 1234 ))
--==============================================================================
subtype t_key      is varchar2(4000);
subtype t_key_hash is pls_integer;
subtype t_idx      is simple_integer;

type t_idxs is table of t_idx index by t_idx;

type t_index_value is record (
    idx t_idx := 0,
    key t_key );
type t_index_values is table of t_index_value;

type t_index_elt is record (
    idx        t_idx := 0,
    key        t_key,
    overflows  t_index_values );
type t_index_elts is table of t_index_elt index by t_key_hash;

type t_change_index is record (
    --
    -- internal
    --
    int#elts      t_index_elts,
    int#cur_idx   simple_integer := 0,
    --
    -- table indexes of pending merges and deletes
    --
    merges        t_idxs,
    deletes       t_idxs );

c_empty t_change_index;

--==============================================================================
-- INTERNAL, EXPOSED FOR TESTING ONLY
--==============================================================================
procedure access_idx (
    p_change_index in out nocopy t_change_index,
    p_key          in            t_key,
    p_readonly     in            boolean,
    p_idx          in out nocopy pls_integer,
    p_is_new       in out nocopy boolean,
    p_elt_idx      in out nocopy pls_integer );

--==============================================================================
-- Make sure that p_key exists in the change index and compute it's data table
-- index.
--
-- Parameters:
-- * p_change_index: The index.
-- * p_key:          The key.
-- * p_idx:          The resulting data table index for p_key. If the key
--                   already exists in the index, put_key() assigns the index
--                   for that key. Otherwise, it assigns a new index number.
--                   When you pass a not null value and it is not the same value
--                   that the procedure would generate, a PROGRAM_ERROR gets
--                   raised.
-- * p_is_new:       True if p_idx did not yet exist, false otherwise.
--==============================================================================
procedure put_key (
    p_change_index in out nocopy t_change_index,
    p_key          in            t_key,
    p_idx          in out nocopy pls_integer,
    p_is_new       out           boolean );

--==============================================================================
-- Return the data table index for the given key.
--
-- Parameters:
-- * p_change_index:    The index.
-- * p_key:             The key.
-- * p_include_deleted: If false (the default), return null for deleted entries.
--                      If true, also return indices of deleted entries.
--==============================================================================
function find (
    p_change_index    in out nocopy t_change_index,
    p_key             in            t_key,
    p_include_deleted in            boolean default false )
    return pls_integer;

--==============================================================================
-- Make sure that p_key exists in the change index. Add the data table index to
-- the merges table and remove from the deletes table if needed.
--
-- Parameters:
-- * p_change_index: The index.
-- * p_key:          The key.
-- * p_idx:          The resulting data table index for p_key.
-- * p_is_new:       True if p_idx did not yet exist, false otherwise.
--==============================================================================
procedure mark_merge (
    p_change_index in out nocopy t_change_index,
    p_key          in            t_key,
    p_idx          out           pls_integer,
    p_is_new       out           boolean );

--==============================================================================
-- Make sure that p_key exists in the change index. Add the data table index to
-- the deletes table and remove from the merges table if needed.
--
-- Parameters:
-- * p_change_index: The index.
-- * p_key:          The key.
-- * p_idx:          The resulting data table index for p_key.
-- * p_is_new:       True if p_idx did not yet exist, false otherwise.
--==============================================================================
procedure mark_delete (
    p_change_index in out nocopy t_change_index,
    p_key          in            t_key,
    p_idx          out           pls_integer,
    p_is_new       out           boolean );

--==============================================================================
-- Remove deleted entries from the change index and empty the merges and deletes
-- tables. Call this procedure after applying merges and deletes to the main
-- table. Note that the caller is responsible for deleting entries in the data
-- table.
--
-- Parameters:
-- * p_change_index: The index.
--==============================================================================
procedure reset_changes (
    p_change_index in out nocopy t_change_index );

--==============================================================================
-- Return the change index in text form, for debugging purposes.
--
-- Example:
--   Given is a change index with the following keys:
--   * K1 with hash 41, data table index 1
--   * K2 with hash 3, data table index 2
--   * K3 with hash 99, data table index 3
--   * K4 with hash 3, data table index 4
--   The hash algorithm computed the same value 3 for K2 and K4, so K4 is stored
--   as an overflow next to K2. Key K1 is marked for merging, K3 and K4 are
--   marked for deleting.
--
--   Output lines are alphabetically sorted:
--     Cur Idx: 4
--     Elt: K1->1 ... #41
--     Elt: K2->2, K4->4 ... #3
--     Elt: K3->3 ... #99
--     To delete: 4->Elt#3, 3->Elt#99
--     To merge: 1->Elt#41
--==============================================================================
function inspect (
    p_change_index in t_change_index )
    return wwv_flow_t_varchar2;

end wwv_flow_pltable_util;
/
show err
