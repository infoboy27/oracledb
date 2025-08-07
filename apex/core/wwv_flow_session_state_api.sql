set define '^' verify off
prompt ...wwv_flow_session_state_api
create or replace package wwv_flow_session_state_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_session_state_api.sql
--
--    DESCRIPTION
--      Public package to to read and write session state values.
--
--    MODIFIED   (MM/DD/YYYY)
--    sdobre      06/21/2022 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
subtype t_data_type is pls_integer range 1..11;

--------------------------------------------------------------------------------
-- A session state value, as the respective data type.
--
-- Attributes:
-- * data_type:
-- * varchar2_value:
-- * clob_value:
--------------------------------------------------------------------------------
type t_value is record (
    data_type       t_data_type,
    varchar2_value  varchar2(32767),
    clob_value      clob );

--------------------------------------------------------------------------------
-- Collection of session state values
--------------------------------------------------------------------------------
type t_values is table of t_value index by pls_integer;

--==============================================================================
-- modes for how we can escape substitution variables
--==============================================================================
subtype t_escape_mode is pls_integer range 1..6;
c_escape_mode_raw            constant t_escape_mode := 1;
c_escape_mode_html           constant t_escape_mode := 2;
c_escape_mode_html_attribute constant t_escape_mode := 3;
c_escape_mode_javascript     constant t_escape_mode := 4;
c_escape_mode_striphtml      constant t_escape_mode := 5;
c_escape_mode_json           constant t_escape_mode := 6;
--==============================================================================
-- Constants
--==============================================================================
c_data_type_varchar2      constant t_data_type := wwv_flow_exec_api.c_data_type_varchar2;
c_data_type_clob          constant t_data_type := wwv_flow_exec_api.c_data_type_clob;

--==============================================================================
-- Returns the value of item identified by p_item as VARCHAR2
--==============================================================================
function get_varchar2 (
    p_item in varchar2 )
    return varchar2;

--==============================================================================
-- Returns the value of item identified by p_item as CLOB
--==============================================================================
function get_clob (
    p_item in varchar2 )
    return clob;

--==============================================================================
-- Returns the value of item identified by p_item as NUMBER
--==============================================================================
function get_number (
    p_item in varchar2 )
    return number;

--==============================================================================
-- Returns the value of item identified by p_item as TIMESTAMP
--==============================================================================
function get_timestamp (
    p_item in varchar2 )
    return timestamp;

--==============================================================================
-- Returns the value of item identified by p_item as a generic T_VALUE
--==============================================================================
function get_value (
    p_item in varchar2 )
    return t_value;

--==============================================================================
-- Sets the VARCHAR2 value of item identified by p_item.
--
-- Parameters:
-- * p_item:   The item name.
-- * p_value:  The item value.
-- * p_commit: If true (the default), commit after modifying session state. If
--             false or if the existing value in session state equals p_value,
--             no commit is issued.
--             This parameter gets ignored when the application's Session State
--             Changes attribute is set to End Of Request.
--
--==============================================================================
procedure set_value (
    p_item   in varchar2,
    p_value  in varchar2,
    p_commit in boolean default true );

--==============================================================================
-- Sets the CLOB value of item identified by p_item.
--
-- Parameters:
-- * p_item:   The item name.
-- * p_value:  The item value.
-- * p_commit: If true (the default), commit after modifying session state. If
--             false or if the existing value in session state equals p_value,
--             no commit is issued.
--             This parameter gets ignored when the application's Session State
--             Changes attribute is set to End Of Request.
--==============================================================================
procedure set_value (
    p_item   in varchar2,
    p_value  in clob,
    p_commit in boolean default true );

--==============================================================================
-- Sets the value of item identified by p_item.
--
-- Parameters:
-- * p_item:   The item name.
-- * p_value:  The item value.
-- * p_commit: If true (the default), commit after modifying session state. If
--             false or if the existing value in session state equals p_value,
--             no commit is issued.
--             This parameter gets ignored when the application's Session State
--             Changes attribute is set to End Of Request.
--==============================================================================
procedure set_value (
    p_item   in varchar2,
    p_value  in t_value,
    p_commit in boolean default true );

end wwv_flow_session_state_api;
/
show errors
