set define '^' verify off
prompt ...wwv_flow_global.sql
create or replace package wwv_flow_global as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_global.sql
--
--    DESCRIPTION
--      Oracle APEX global package variables.
--
--    NOTES
--      Allows sharing of data within a session that does not belong to any given package.
--      Includes type declaration(s).
--
--      Any change to this file must also be replicated in the same file in cloud/apex_patches.
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--     mhichwa    08/04/1999 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
g_v255_result       varchar2(255) := null;
g_v1_result         varchar2(1)   := null;
g_image_prefix      constant varchar2(255) := wwv_flow_image_prefix.g_image_prefix;

subtype             t_dbms_id        is dbms_id;
subtype             t_dbms_quoted_id is dbms_quoted_id;
subtype             t_dbms_id_128    is dbms_id_128;
c_dbms_id_length    constant pls_integer := 128;

--==============================================================================
type vc_map  is table of varchar2(32767) index by varchar2(255);
subtype vc_arr2 is sys.dbms_sql.varchar2a;
type n_arr   is table of number          index by binary_integer;
type d_arr   is table of date            index by binary_integer;
type b_arr   is table of boolean         index by binary_integer;

type t_bag   is table of pls_integer     index by varchar2(32767);

--==============================================================================
c_empty_vc_map  vc_map;
c_empty_vc_arr2 vc_arr2;
c_empty_n_arr   n_arr;
c_empty_d_arr   d_arr;
c_empty_b_arr   b_arr;
c_empty_bag     t_bag;

subtype t_desc_tab is sys.dbms_sql.desc_tab4;
subtype t_desc_rec is sys.dbms_sql.desc_rec4;

--
-- maximum varchar2 size (in bytes), based on the MAX_STRING_SIZE database parameter 
--
$if wwv_flow_db_version.c_has_extended_string_size $then
c_max_varchar2_size constant number := 32767;
$else
c_max_varchar2_size constant number := 4000;
$end

--==============================================================================
function g_cloud return boolean;

end wwv_flow_global;
/
show err

create or replace package body wwv_flow_global as
g_cloud_value constant boolean := ^1;

function g_cloud return boolean
is
begin
    return g_cloud_value;
end g_cloud;
end wwv_flow_global;
/
show err
