set define '^' verify off
prompt wwv_flow_utilities
create or replace package wwv_flow_utilities as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2024, Oracle and/or its affiliates.
--
--    NAME
--      flowu.sql
--
--    DESCRIPTION
--      Oracle APEX utility package.
--
--      Includes:
--      1. JavaScript Generation Utilities
--      2. Array Manipulation Utilities
--      3. Date Utilities
--      4. List of Values (LOV) Utilities
--      5. String Manipulation Function Utilities
--      6. If Then Else (ite) Utility
--      7. URL Utilities
--      8. Check Sum Utility
--      9. Bind Variable Utilities
--     10. Substitution Value Utilities
--
--    NOTES
--      This package contains utility functions for the APEX service.
--
--    MODIFIED   (MM/DD/YYYY)
--     mhichwa    08/04/1999 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Flow Utilities Public Data Types
--==============================================================================
type vc_assoc_arr  is table of varchar2(32767) index by varchar2(255);

type t_null_value_entry is record (
    entry_type   varchar2(255),
    entry_name   varchar2(255),
    entry_value  varchar2(255));

type t_null_value_list is table of t_null_value_entry index by pls_integer;

subtype t_dependent_object is wwv_flow_dynamic_exec.t_dependent_object;
subtype t_dependent_object_list is wwv_flow_dynamic_exec.t_dependent_object_list;

subtype t_url_type is pls_integer range 0..3;
c_url_type_relative     constant t_url_type := 0;
c_url_type_absolute     constant t_url_type := 1;
c_url_type_auto         constant t_url_type := 2;
c_url_type_auto_branch  constant t_url_type := 3;


--==============================================================================
-- A t_p_arguments record contains the URL parameters of a f?p or friendly URL.
-- It is the result of the parse_p and parse_friendly functions.
--==============================================================================
type t_p_arguments is record (
    app              varchar2(32767),
    page             varchar2(32767),
    session_id       varchar2(32767),
    request          varchar2(32767),
    debug            varchar2(32767),
    clear_cache      varchar2(32767),
    arg_names        wwv_flow_global.vc_arr2,
    arg_values       wwv_flow_global.vc_arr2,
    printer_friendly varchar2(32767),
    -- only populated by parse_p
    arg_names_vc2    varchar2(32767),
    arg_values_vc2   varchar2(32767),
    -- only populated by parse_friendly
    cs               varchar2(32767),
    dialogcs         varchar2(32767),
    fsp_region_id    varchar2(32767),
    lang             varchar2(32767),
    notification_msg varchar2(32767),
    pg_max_rows      varchar2(32767),
    pg_min_row       varchar2(32767),
    pg_rows_fetched  varchar2(32767),
    success_msg      varchar2(32767),
    territory        varchar2(32767),
    timezone         varchar2(32767),
    trace            varchar2(32767),
    x01              varchar2(32767),
    hash             varchar2(32767) );

--==============================================================================
-- Misc Global Variables
--==============================================================================
    empty_vc_arr        wwv_flow_global.vc_arr2;
    g_value             wwv_flow_global.vc_arr2;
    g_display           wwv_flow_global.vc_arr2;
    g_query_hold        varchar2(32767);
    g_data_type         varchar2(256);
    g_xml_clob          clob;
    g_val_num           number;
    g_val_vc2           varchar2(4000);
    g_null_map          vc_assoc_arr;
    g_null_value_list   t_null_value_list;

--==============================================================================
-- ASCII regexp ranges
--==============================================================================
    c_alpha             constant varchar2(52) := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    c_alnum             constant varchar2(62) := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';

--==============================================================================
procedure bulk_save_session_state (
    p_value   in varchar2,
    p_item_01 in varchar2 default null,
    p_item_02 in varchar2 default null,
    p_item_03 in varchar2 default null,
    p_item_04 in varchar2 default null,
    p_item_05 in varchar2 default null,
    p_item_06 in varchar2 default null,
    p_item_07 in varchar2 default null,
    p_item_08 in varchar2 default null,
    p_item_09 in varchar2 default null,
    p_item_10 in varchar2 default null,
    p_item_11 in varchar2 default null,
    p_item_12 in varchar2 default null,
    p_item_13 in varchar2 default null,
    p_item_14 in varchar2 default null,
    p_item_15 in varchar2 default null,
    p_item_16 in varchar2 default null,
    p_item_17 in varchar2 default null,
    p_item_18 in varchar2 default null,
    p_item_19 in varchar2 default null,
    p_item_20 in varchar2 default null,
    p_item_21 in varchar2 default null,
    p_item_22 in varchar2 default null,
    p_item_23 in varchar2 default null,
    p_item_24 in varchar2 default null,
    p_item_25 in varchar2 default null,
    p_item_26 in varchar2 default null,
    p_item_27 in varchar2 default null,
    p_item_28 in varchar2 default null,
    p_item_29 in varchar2 default null,
    p_item_30 in varchar2 default null,
    p_item_31 in varchar2 default null,
    p_item_32 in varchar2 default null,
    p_item_33 in varchar2 default null,
    p_item_34 in varchar2 default null,
    p_item_35 in varchar2 default null,
    p_item_36 in varchar2 default null,
    p_item_37 in varchar2 default null,
    p_item_38 in varchar2 default null,
    p_item_39 in varchar2 default null,
    p_item_40 in varchar2 default null,
    p_item_41 in varchar2 default null,
    p_item_42 in varchar2 default null,
    p_item_43 in varchar2 default null,
    p_item_44 in varchar2 default null,
    p_item_45 in varchar2 default null,
    p_item_46 in varchar2 default null,
    p_item_47 in varchar2 default null,
    p_item_48 in varchar2 default null,
    p_item_49 in varchar2 default null,
    p_item_50 in varchar2 default null,
    p_set_as_preference  in varchar2 default 'N')
    ;



-------------------------------------------------------------------------------
-- JavaScript Generation Utilities
--
--


procedure open_noscript
    -- Generates javascript that...
    --
    --
    ;

function  open_noscript
    -- Generates javascript that...
    --
    --
    return varchar2
    ;

procedure close_noscript
    -- Generates javascript that...
    --
    --
    ;

function close_noscript
    -- Generates javascript that...
    --
    --
    return varchar2
    ;

procedure open_javascript
    ;

function open_javascript
    return varchar2
    ;

procedure close_javascript
    -- Generates javascript that...
    --
    --
    ;

function close_javascript
    -- Generates javascript that...
    --
    --
    return varchar2
    ;

procedure add_null_value_entry (
    -- Generates javascript that...
    --
    --
    p_entry_type    varchar2,
    p_entry_name    varchar2,
    p_entry_value   varchar2 )
    ;

procedure append_to_list
    -- Generates javascript that...
    --
    --
    ;

procedure delete_from_list
    -- Generates javascript that...
    --
    --
    ;

procedure delete_list_element
    -- Generates javascript that...
    --
    --
    ;

function delete_list_element
    -- Generates javascript that...
    --
    --
    return varchar2
    ;


-------------------------------------------------------------------------------
-- Array Manipulation Utilities
--

function in_list (
    p_value      varchar2,
    p_array      wwv_flow_global.vc_arr2)
    return boolean
    ;


-------------------------------------------------------------------------------
-- Date Utilities
--

function time_since (
    --
    --
    --
    p_date     in date)
    return varchar2
    ;

-------------------------------------------------------------------------------
-- Text Area with HTML Editor
--

function html_editor_language
    -- Checks for html editor's specified/default language...
    --
    --
    return varchar2
    ;

-------------------------------------------------------------------------------
-- List of Values (LOV) Utilities
--

procedure show_as_display_only (
    p_lov                in varchar2 default null,
    p_value              in varchar2 default null,
    p_translation        in varchar2 default null,
    p_attributes         in varchar2 default null,
    p_null_display_value in varchar2 default null,
    p_display_extra      in varchar2 default null)
    ;

procedure show_as_combobox (
    p_lov          in varchar2,
    p_value        in varchar2 default null,
    p_name         in varchar2 default null,
    p_height       in varchar2 default null,
    p_show_null    in varchar2 default null,
    p_null_text    in varchar2 default '%',
    p_null_value   in varchar2 default '%null%',
    p_show_extra   in varchar2 default 'YES',
    p_extra_text   in varchar2 default null,
    p_onBlur       in varchar2 default null,
    p_onChange     in varchar2 default null,
    p_onFocus      in varchar2 default null,
    p_max_elements in number   default 1000000,
    p_attributes   in varchar2 default null,
    p_translation  in varchar2 default 'NO')
    ;

procedure gen_popup_list (
    p_name                    in varchar2,
    p_lov                     in varchar2,
    p_lov_checksum            in varchar2,
    p_element_index           in varchar2,
    p_form_index              in varchar2,
    p_filter                  in varchar2,
    p_escape_html             in varchar2 default null,
    p_max_elements            in varchar2 default null,
    p_before_field_field_text in varchar2 default null,
    p_after_field_field_text  in varchar2 default null,
    p_title                   in varchar2 default null,
    p_image                   in varchar2 default null,
    p_help                    in varchar2 default null,
    p_eval_value              in varchar2 default null,
    p_request                 in varchar2 default null,
    p_min_row                 in number   default 1,
    p_translation             in varchar2 default 'NO',
    p_return_key              in varchar2 default 'NO',
    p_hidden_elem_name        in varchar2 default null,
    p_elem_id                 in varchar2 default null,
    p_hidden_elem_id          in varchar2 default null,
    --
    p_ok_to_query             in varchar2 default 'YES',
    p_flow_id                 in number   default null,
    p_page_id                 in number   default null,
    p_session_id              in number   default null,
    p_company                 in number   default null,
    p_item_id                 in varchar2 default null,
    p_column_id               in varchar2 default null)
    ;

procedure show_as_popup_calendar (
    p_request                 in varchar2 default null,
    p_title                   in varchar2 default null,
    p_yyyy                    in varchar2 default null,
    p_mm                      in varchar2 default null,
    p_dd                      in varchar2 default null,
    p_hh                      in varchar2 default null,
    p_mi                      in varchar2 default null,
    p_pm                      in varchar2 default null,
    p_element_index           in varchar2 default null,
    p_form_index              in varchar2 default null,
    p_date_format             in varchar2 default 'MM/DD/YYYY',
    p_bgcolor                 in varchar2 default '#336699',
    p_white_foreground        in varchar2 default 'Y',
    p_application_format      in varchar2 default 'N',
    p_lang                    in varchar2 default null,
    p_application_id          in varchar2 default null,
    p_security_group_id       in varchar2 default null)
    ;

procedure show_as_popup (
    p_lov               in varchar2,
    p_name              in varchar2 default null,
    p_value             in varchar2 default null,
    p_width             in varchar2 default null,
    p_max_length        in varchar2 default null,
    p_form_index        in varchar2 default '0',
    p_element_index     in varchar2 default null,
    p_escape_html       in varchar2 default null,
    p_max_elements      in varchar2 default null,
    p_attributes        in varchar2 default null,
    p_eval_value        in varchar2 default null,
    p_ok_to_query       in varchar2 default 'YES',
    p_translation       in varchar2 default 'NO',
    p_return_key        in varchar2 default 'NO',
    p_hidden_elem_name  in varchar2 default null,
    p_filter_first_fetch in varchar2 default 'NO',
    p_item_id           in varchar2 default null,
    p_element_attributes in varchar2 default null,
    p_item_name in varchar2 default null)
    ;

function show_as_popup (
    p_lov               in varchar2,
    p_name              in varchar2 default null,
    p_value             in varchar2 default null,
    p_width             in varchar2 default null,
    p_max_length        in varchar2 default null,
    p_form_index        in varchar2 default '0',
    p_element_index     in varchar2 default null,
    p_escape_html       in varchar2 default null,
    p_max_elements      in varchar2 default null,
    p_attributes        in varchar2 default null,
    p_eval_value        in varchar2 default null,
    p_ok_to_query       in varchar2 default 'YES',
    p_translation       in varchar2 default 'NO',
    p_return_key        in varchar2 default 'NO',
    p_hidden_elem_name  in varchar2 default null,
    p_filter_first_fetch in varchar2 default 'NO',
    p_item_id           in varchar2 default null,
    p_element_attributes in varchar2 default null,
    p_item_name in varchar2 default null)
    return varchar2
    ;

function static_to_query (
    p_lov                   in varchar2 default null)
    return varchar2
    ;


-------------------------------------------------------------------------------
-- String Manipulation Function Utilities
--

function remws(
    --
    -- Given a string remove the lead, trailing, or leading and trialing whitespace.
    --
    -- Arguments:
    --   p_str   = any text string
    --   p_where = B for both leading and trailing
    --             L for leading
    --             T for trailing
    --
    p_str in varchar2,
    p_where in varchar2 default 'B' )
    return varchar2
    ;

function remove_trailing_whitespace (
    --
    -- Given a string remove trailing chr 10, chr 13s and spaces.
    -- Also removes leading whitespace.
    --
    p_str in varchar2 )
    return varchar2
    ;

function string_to_table (
    --
    --
    --
    str in varchar2,
    sep in varchar2 default ':')
    return wwv_flow_global.vc_arr2
    ;

function string_to_table2 (
    --
    --
    --
    str in varchar2,
    sep in varchar2 default ':')
    return wwv_flow_global.vc_arr2
    ;

function string_to_table3 (
    --
    --
    --
    str in varchar2,
    sep in varchar2 default ':')
    return wwv_flow_dynamic_exec.vc_arr2
    ;

--==============================================================================
-- Returns p_str as a pl/sql table seperated by the specified list of seperators.
-- The found seperator will also be included in the result array if p_include_sep
-- is true.
-- Only the first occurrense of the seperator is searched if p_first_occurrense is
-- true.
--
-- Example:
--
-- l_result_list := wwv_flow_utilities.string_to_table4 (
--                      'this#SEP1#is#SEP2#a test',
--                      wwv_flow_t_varchar2('#SEP1', '#SEP2#') );
--
-- Will result in an array of
--   this
--   #SEP1#
--   is
--   #SEP2#
--   a test
--==============================================================================
function string_to_table4 (
    p_str              in varchar2,
    p_sep_list         in wwv_flow_t_varchar2,
    p_include_sep      in boolean := true,
    p_first_occurrense in boolean := true )
    return wwv_flow_dynamic_exec.vc_arr2;

--==============================================================================
-- DO NOT USE - SEE WWV_FLOW_STRING INSTEAD
--==============================================================================
function join (
    t in wwv_flow_t_varchar2,
    s in varchar2 default wwv_flow.LF)
    return varchar2;

--==============================================================================
-- compute a hash value for all given values. this function can be used to
-- implement lost update detection for data records.
--
-- PARAMETERS
-- * p_values    input values
-- * p_salted    if true (the default), salt hash with internal session info
--==============================================================================
function get_hash (
    p_values in wwv_flow_t_varchar2,
    p_salted in boolean default true )
    return varchar2;

--==============================================================================
-- Returns p_prefix||p_clob||p_suffix
--==============================================================================
function wrap_clob (
    --
    --
    --
    p_prefix in varchar2,
    p_clob   in clob,
    p_suffix in varchar2 )
    return clob
    ;

--==============================================================================
-- Returns the values of the array t as a concatenated string separated by s.
-- As long as the result contains a value, the separator will always be appended.
--
-- Note: If an error occurs during concatenating the string, for example the
--       result gets to long, only the last valid value will be returned.
--==============================================================================
function table_to_string (
    --
    --
    --
    t in wwv_flow_global.vc_arr2,
    s in varchar2 default ':')
    return varchar2
    ;

--==============================================================================
-- Returns the values of the array t as a concatenated string separated by s.
-- If the separator is not a colon, any colons in the values are escaped with &#58;
--
-- Note: If an error occurs during concatenating the string, for example the
--       result gets to long, only the last valid value will be returned.
--==============================================================================
function table_to_string2 (
    --
    --
    --
    t in wwv_flow_global.vc_arr2,
    s in varchar2 default ':')
    return varchar2
    ;

--==============================================================================
-- Returns the values of the array t as a concatenated string separated by s.
--==============================================================================
function table_to_string3 (
    t in wwv_flow_global.vc_arr2,
    s in varchar2 default ':' )
    return varchar2;

--==============================================================================
-- Returns the values of the array t as a concatenated CLOB separated by s.
-- If the separator is not a colon, any colons in the values are escaped with &#58;
--
-- Note: If an error occurs during concatenating the string, for example the
--       result gets to long, only the last valid value will be returned.
--==============================================================================
function table_to_clob (
    --
    --
    --
    t in wwv_flow_global.vc_arr2,
    s in varchar2 default ':')
    return clob
    ;

--==============================================================================
function instr_tostr (
    --
    --
    --
    p_instr             in varchar2 default null,
    p_tostr             in varchar2 default null)
    return varchar2
    ;

--==============================================================================
function instr_fromstr (
    --
    --
    --
    p_instr             in varchar2 default null,
    p_fromstr           in varchar2 default null)
    return varchar2
    ;

--==============================================================================
function striphtml(
    --
    --
    --
    p_html        in varchar2)
    return varchar2 deterministic
    ;

--==============================================================================
function striphtml_clob(
    --
    --
    --
    p_html        in clob)
    return clob deterministic
    ;

--==============================================================================
function is_numeric (
    --
    --
    --
    p_str in varchar2 default null)
    return boolean
    ;

-------------------------------------------------------------------------------
-- If Then Else (ite) Utility
--
function ite (
    --
    --
    --
    b boolean,
    t varchar2,
    f varchar2)
    return varchar2
    ;


-------------------------------------------------------------------------------
-- URL Utilities
--

function urlencode(
    --
    -- Encode every character of a URL.
    -- an encoded URL is a URL in Hex.
    -- Encoded URLs allow spaces, question marks and other special characters.
    --
    p_str in varchar2 )
    return varchar2
    ;

function url_encode2 (
    --
    -- Encode (into HEX) all special characters which includes spaces,
    -- question marks, ampersands, etc.
    --
    p_str in varchar2)
    return varchar2
    ;

function url_decode2 (
    --
    --
    --
    p_str in varchar2)
    return varchar2
    ;

function url_encode (
    --
    -- Encode every character of a URL.
    -- an encoded URL is a URL in Hex.
    -- Encoded URLs allow spaces, question marks and other special characters.
    --
    p_str in varchar2)
    return varchar2
    ;

function is_valid_application_name(
    --
    --  Verify application name does not contain invalid characters '<>"'
    --  during creation of application
    --
    p_name        in varchar2)
    return varchar2
    ;

function is_valid_group_name(
    --
    --  Verify group name does not contain invalid characters '<>', is not null,
    --  or does not contain only blank spaces during creation/modification of group name
    --
    p_name        in varchar2)
    return varchar2
    ;

function is_valid_page_group_name(
    --
    --  Verify page group name does not contain invalid characters '<>', is not null,
    --  or does not contain only blank spaces during creation/modification of page group name
    --
    p_name        in varchar2)
    return varchar2
    ;

function is_valid_application_id(
    --
    --  Verify application id conforms to the regular expression '^[0-9]*$', is not null,
    --  is an available id, or does not contain only blank spaces during creation of application
    --
    p_name        in varchar2)
    return varchar2
    ;

function get_page_group_id(
    --
    -- Purpose: Return boolean as to existence within the given
    --          flow page's metadata of a named page-group.
    --
    p_group_name      in varchar2,
    p_application_id  in number)
    return number
    ;

--------------------------------------------------------------------------------
-- Calls owa_util.redirect_url to redirect the browser to a new URL.
-- The procedure automatically calls apex_application.stop_apex_engine to
-- abort further processing of the APEX application.
--
-- p_reset_htp_buffer should be set to FALSE if the application has set it's own
-- cookie in the response, otherwise the HTP buffer will be reseted to make sure
-- that the browser understands the redirect to the new URL and isn't confused
-- by data which has already been written to the HTP buffer.
--------------------------------------------------------------------------------
procedure redirect_url (
    p_url              in varchar2,
    p_reset_htp_buffer in boolean default true );

procedure redirect_url_array (
    p_owner      varchar2 default null,
    p_package    varchar2 default null,
    p_procedure  varchar2 default null,
    p_parameters wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_values     wwv_flow_global.vc_arr2 default empty_vc_arr)
    ;




-------------------------------------------------------------------------------
-- Check Sum Utility
--
function checksum (
    --
    -- Obsolete with 8.1.7 of Oracle and greater.  This PLSQL checksum
    -- algorythem is slower and less reliable then the
    -- dbms_obfuscation_toolkit.md5 function.  This function is provided
    -- for backward compatability and for support of 8.1.6.
    --
    -- Note recommended use is:
    --    x := utl_raw.cast_to_raw( dbms_obfuscation_toolkit.md5( input_string => p_string ) );
    --
    p_buff in varchar2 )
    return number
    ;




-------------------------------------------------------------------------------
-- Bind Variable Utilities
--

function get_binds(
    --
    -- Given a valid Oracle SQL statement, which
    -- can include quotes, c style, and plsql style
    -- comments, return a table of bind variable names.
    -- The bind variable names will be used for binding in
    -- flows session state.
    --
    p_stmt  in clob )
    return  sys.dbms_sql.varchar2_table
    ;

procedure perform_binds(
    --
    --
    --
    p_cursor in number,
    p_stmt   in varchar2)
    ;

function get_using_clause (
    --
    --
    --
    p_stmt   in varchar2 )
    return varchar2
    ;

function get_column_headings (
    --
    -- Given a SQL select statement return colon delimited list of
    -- column headings.
    --
    p_sql_select_statement in varchar2)
    return varchar2
    ;


-------------------------------------------------------------------------------
-- Substitution Variable Utilities
--

function parse(
    p_string in varchar2,
    p_escape in boolean default false )
    return varchar2
    ;



function get_substitution_value(
    --
    --
    --
    p_substitution_string in varchar2,
    p_flow_id in varchar2 )
    return varchar2
    ;

-------------------------------------------------------------------------------
-- Flows Internal Utilities
--
-- These utilities are exposed however they are of little or no value to the
-- flows application programmer.

function minimum_free_page (
    --
    -- Given a flow find the minimum page number
    -- available.  Useful in building flow wizards
    -- since you can default the page to the next
    -- availble page ID number.
    --
    p_flow_id           in number default null,
    p_occurance         in number default 1,
    p_start_page        in number default 1)
    return number
    ;

type t_free_flow_candidate_rec is record (
    candidate_id     number,
    next_reserved_id number );
type t_free_flow_candidates is ref cursor return t_free_flow_candidate_rec;

function minimum_free_flow_candidates
    return t_free_flow_candidates;

function minimum_free_flow
    return number
    ;

function flow_authentication (
    p_flow_id           in number default null)
    return varchar2
    ;

function is_date (
  p_date varchar2,
  p_format varchar2 default null )
  return boolean
  ;

--==============================================================================
-- Given a security group id and an application id, return a message text
-- that explains why the id is reserved and can not be used. Return null if the
-- id can be used.
--
-- ARGUMENTS
-- * p_security_group_id: the workspace id
-- * p_application_id:    the application id
-- * p_check_reserved:    flag that determines wheter IDs that are reserved by
--                        the create app wizard should be treated as reserved
--==============================================================================
function get_app_id_reserved_reason (
    p_security_group_id     in number,
    p_application_id        in number,
    p_check_reserved        in boolean default TRUE )
    return varchar2;

--==============================================================================
-- Given a security group id and the application number, return true if the
-- application number is not reserved, false if it is reserved.
--
-- Same as get_app_id_reserved_reason(...) is null.
--==============================================================================
function is_available_application_id (
    p_security_group_id     in number,
    p_application_id        in number,
    p_check_reserved        in boolean default TRUE )
    return boolean;

function is_number(
  p_number varchar2,
  p_format varchar2 default null )
  return boolean
  ;

--==============================================================================
-- return whether p_string looks like an email address
--==============================================================================
function is_email (
    p_string in varchar2 )
    return boolean;
--
procedure get_lov_delimiters(
  p_s in varchar2,
  p_r out varchar2,
  p_c out varchar2)
  ;

function get_temp_lov_query (
    p_display_values in varchar2,
    p_return_values  in varchar2,
    p_delimiter      in varchar2 default ';',
    p_order_by       in varchar2 ) /* values: null, SEQ or DISPLAY */
    return varchar2;

function get_temp_lov_query (
    p_lov_id       in number,
    p_add_order_by in boolean default true,
    p_use_template in boolean default false )
    return varchar2;

function get_temp_lov_index (
    p_sql in varchar2 )
    return number;

function get_temp_lov_data (
    p_lov_index in binary_integer )
    return wwv_flow_t_temp_lov_data;

function get_multi_value_temp_lov_data (
    p_values in varchar2 )
    return wwv_flow_t_temp_lov_data;

function remove_spaces (
    --
    -- takes a string and removes duplicate spaces
    --
    p_str in varchar2 default null)
    return varchar2
    ;


function is_valid_alias(
    --
    -- Verify that the Flow alias is composed of valid characters,
    -- namely A-Z, 0-9, and _ or -.  Also, must be at least 1 char
    -- long but not longer than 32 chars.
    --
    p_alias in varchar2)
    return boolean
    ;


----------------------
-- SQL Query functions
--
function get_display_value_given_lov (
   p_sql_query   in varchar2,
   p_value       in varchar2,
   p_translation in varchar2 default 'NO',
   p_escape_sc   in varchar2 default 'YES')
   return varchar2
   ;


----------------------------------
-- Given an ID get the region name
--
function get_region_name (
    p_region_id   in varchar2 default null)
    return varchar2
    ;


------------------------------------------------------
-- Pause for number of seconds identified by p_seconds
--  (capped at 120 seconds)
--
procedure pause (
    p_seconds   in number)
    ;

-------------------------------------------------------
-- Checks to ensure p_name is a valid Oracle identifier
--
function is_valid_identifier (
    p_identifier   in varchar2,
    p_quote        in boolean := false)
    return boolean
    ;

function get_company_from_cookie return varchar2
    ;
function get_un_from_cookie return varchar2
    ;
function my_url return varchar2
    ;
function get_cookie_user_name (p_cookie_user_id in number) return varchar2
    ;

-----------------------------------------
-- Optimized String Replacement Functions
--


procedure fast_replace(
    srcstr in out NOCOPY varchar2,
    oldsub in varchar2,
    newsub in varchar2 )
    ;

procedure fast_replace_many (
   srcstr in out NOCOPY varchar2,
   oldsub in wwv_flow_t_varchar2,
   newsub in wwv_flow_t_varchar2 )
   ;

function fast_replace_f(
   p_srcstr in varchar2,
   oldsub in varchar2,
   newsub in varchar2 )
   return varchar2
   ;

function fast_replace_manyf (
   p_srcstr in varchar2,
   oldsub in wwv_flow_t_varchar2,
   newsub in wwv_flow_t_varchar2 )
   return varchar2
   ;

function show_line_number (
   --------------------------------------------------------
   -- Displays line numbers for the given query or string
   --
   q in varchar2)
   return varchar2
   ;

--==============================================================================
procedure parse_query_string(
    p_query     in  varchar2,
    p_flow_id   out varchar2,
    p_page_id   out varchar2,
    p_sess_id   out varchar2,
    p_remainder out varchar2)
    ;

--==============================================================================
-- Returns the query string of the current GET request where the session id is
-- replaced with the value of wwv_flow.g_instance.
--
-- For example, if the current request were
--   p=105:12:5312::NO:ARG1:VAL1&p_trace=YES
-- and the current g_instance is 1675, this function will return:
--   p=105:12:1675::NO:ARG1:VAL1&p_trace=YES
--
-- Context: runtime with HTTP GET request in process.
--==============================================================================
function rewrite_query_string return varchar2;

---------------------------
-- session state conditions
--

function page_changed (
    -----------------------------------------------------------------
    -- Any item on page changed for current flow and current session.
    -- Change implys item was populated, then update.
    p_page_number in number )
    return boolean
    ;

function item_changed (
    -------------------------------------------------
    -- Item in current flow and session has changed.
    -- Change implys item was populated, then update.
    p_item_name in varchar2)
    return boolean
    ;

function list_of_items_changed (
    p_item_names in varchar2)
    return boolean
    ;

function list_of_pages_changed (
    p_page_numbers in varchar2 )
    return boolean
    ;

function current_session_changed
    return boolean
    ;

function current_flow_changed
    return boolean
    ;

function get_data_type (
   p_table_name  in varchar2,
   p_column_name in varchar2)
   return varchar2
   ;

function extracthtml (
   p_html in varchar2)
   return varchar2
   ;

--
-- function to construct quick links
--
-- p_disable    Deprecated and no longer does anything. This used to internally emit a call to callDisItems,
--              which was not a library function, only locally defined on page 190 in application 4000. This
--              also called disableItems, which internally called eval(), and on page 190 this functionality
--              was replaced with Dynamic Action's disable / enable, hence this parameter was no longer required.
--
function quick_link(
   p_forminput in varchar2,
   p_form_value in varchar2,
   p_display in varchar2,
   p_system_message in boolean  := true,
   p_forminput2 in varchar2 := null ,
   p_form_value2 in varchar2 := null,
   p_disable in varchar2 := null,
   p_popup_message  in varchar2 := null)
   return varchar2
   ;

function clob_to_varchar2(
   p_clob   in clob,
   p_offset in number default 0,
   p_raise  in boolean default false)
   return varchar2
   ;

function blob_to_clob(
   p_blob        in blob,
   p_charset     in varchar2    default null,
   --
   p_cache       in boolean     default false,
   p_dur         in pls_integer default sys.dbms_lob.session )
   return clob
   ;

function clob_to_blob(
   p_clob        in clob,
   p_charset     in varchar2    default null,
   p_include_bom in boolean     default false,
   --
   p_cache       in boolean     default false,
   p_dur         in pls_integer default sys.dbms_lob.session )
   return blob
   ;


function escape_url(
    p_url             in varchar2,
    p_url_charset     in varchar2 default null,
    p_escape_reserved in varchar2 default 'N')
    return varchar2
    ;
function unescape_url(
    p_url             in varchar2,
    p_url_charset     in varchar2 default null )
    return varchar2
    ;

function host_url(
    --
    -- Return the host URL
    --
    -- Possible options are:
    --     NULL      - Return URL up to port number (e.g., https://myserver.com:7778 )
    --     SCRIPT    - Return URL to include script name
    --                 - With friendly URLs enabled, this typically returns:
    --                   https://myserver.com:7778/pls/apex/{workspace}/r/{application}
    --                 - With friendly URLs disabled, this typically returns:
    --                   https://myserver.com:7778/pls/apex/
    --     APEX_PATH - Return URL to include script name (e.g., https://myserver.com:7778/pls/apex/ )
    --     IMGPRE    - Return URL to include image prefix (e.g., https://myserver.com:7778/i/ )
    --
    p_option          in varchar2 default null )
    return varchar2
    ;

--==============================================================================
-- Returns the protocol (http or https) used for the current HTTP request or post.
--==============================================================================
function get_protocol return varchar2;

--==============================================================================
function lov_checksum (
    p_string      in varchar2 )
    return varchar2;
--==============================================================================
function lov_checksum (
    p_string      in clob )
    return varchar2;

--==============================================================================
-- utility type for information on target app and page in an url
--==============================================================================
type t_target_url_app_info is record (
    app_id                      wwv_flows.id%type,
    app_alias                   wwv_flows.alias%type,
    page_id                     wwv_flow_steps.id%type,
    friendly_url                boolean default false,
    browser_frame               wwv_flows.browser_frame%type,
    rejoin_existing_sessions    wwv_flows.rejoin_existing_sessions%type,
    bookmark_checksum_function  wwv_flows.bookmark_checksum_function%type,
    checksum_salt               wwv_flows.checksum_salt%type,
    security_group_id           wwv_flows.security_group_id%type );

--==============================================================================
function get_target_url_app_info (
    p_app                       in varchar2,
    p_page                      in varchar2 )
    return t_target_url_app_info;

--==============================================================================
-- Parse f?p value
--==============================================================================
function parse_p (
    p_arguments in varchar2,
    p_sep       in varchar2 default ':' )
    return t_p_arguments;

--==============================================================================
-- Parse friendly URL query string. This will *NOT* populate the attributes
-- app, page, arg_names_vc2, and arg_values_vc2.
--==============================================================================
function parse_friendly (
    p_app       in varchar2,
    p_page      in varchar2,
    p_arguments in varchar2 )
    return t_p_arguments;

--==============================================================================
-- compute the source for the URL checksum
--==============================================================================
procedure compute_checksum_source(
    p_arguments              in t_p_arguments,
    p_level                  in number,
    p_version                in varchar2   default wwv_flow_security.c_checksum_curr_version_prefix,
    p_compute_old            in boolean    default false );

--==============================================================================
-- If URL is f?p format, do escape_url on the argument values only.  This
-- function assumes that all substitutions, e.g., &ITEM_NAME. substitutions
-- have already been performed.
--
-- This procedure is overloaded.
--==============================================================================
function prepare_url (
    p_url                    in varchar2,
    p_url_charset            in varchar2 default null,
    p_checksum_type          in varchar2 default null,
    p_save_session_state_yn  in varchar2 default 'N',
    p_triggering_element     in varchar2 default 'this',
    p_dialog                 in varchar2 default 'null',
    p_rejoin_public_only     in boolean  default false,
    p_plain_url              in boolean  default false,
    p_force_legacy_url       in boolean  default false,
    p_absolute_url           in boolean  default true )
    return varchar2;
--==============================================================================
-- Overloaded version for p_url_type.
--==============================================================================
function prepare_url (
    p_url                    in varchar2,
    p_url_charset            in varchar2 default null,
    p_checksum_type          in varchar2 default null,
    p_save_session_state_yn  in varchar2 default 'N',
    p_triggering_element     in varchar2 default 'this',
    p_dialog                 in varchar2 default 'null',
    p_rejoin_public_only     in boolean  default false,
    p_plain_url              in boolean  default false,
    p_force_legacy_url       in boolean  default false,
    p_url_type               in t_url_type )
    return varchar2;

--==============================================================================
-- get cgi QUERY_STRING and decode content
--==============================================================================
function get_cgi_query_string_decoded
    return varchar2;

function pick_date_format_mask(
    --
    -- Given a Date Picker type (e.g., PICK_DATE_DD_MON_YYYY), return
    -- the corresponding format mask.  The input p_format_mask is only
    -- applicable when p_pick_date_type = PICK_DATE_USING_FORMAT_MASK.
    --
    p_pick_date_type in varchar2,
    p_format_mask    in varchar2 default null )
    return varchar2
    ;

function pick_date_classic_format_mask (
    --
    -- Given a Classic Date Picker type (e.g., PICK_DATE_DD_MON_YYYY), return
    -- the corresponding format mask.  The input p_format_mask is only
    -- applicable when p_pick_date_type = PICK_DATE_USING_FORMAT_MASK.
    --
    p_pick_date_type in varchar2,
    p_format_mask    in varchar2 default null )
    return varchar2;

procedure increment_calendar;
    --
    -- procedure to handle the increment of a date in a calendar
    -- Date must be in YYYYMMDD format
    --
procedure decrement_calendar;
    --
    -- procedure to handle the decrement of a date in a calendar
    -- Date must be in YYYYMMDD format
    --
procedure today_calendar;
    --
    -- procedure to handle the chaning to today of a date in a calendar
    -- Date must be in YYYYMMDD format
    --
procedure month_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle the Month type of the calendar

procedure weekly_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle the date type of the calendar
procedure daily_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle agenda view of calendar
procedure agenda_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle the Custom calendar
procedure custom_calendar(p_date_type_field varchar2 default null);
    --
    -- procedure to handle the date type of the calendar

procedure process_calendar_date(
    --
    -- procedure to handle the changes of a date in a calendar
    -- Date must be in YYYYMMDD format
    --
    p_request varchar2);

function savekey_num(p_val in number)
    return number
    ;

function keyval_num return number
    ;

function savekey_vc2(p_val in varchar2)
    return varchar2
    ;

function keyval_vc2 return varchar2
    ;

--==============================================================================
function get_clob_md5(
    --
    -- Compute and return a hash for the specified CLOB.
    -- Arguments:
    --     p_clob              =  Input CLOB value
    --
    p_clob            in clob )
    return varchar2
    ;

--
-- Print with opening and closing JavaScript tags the JavaScript function filter_escape.
-- This JavaScript function is used in encoding multibyte values in a URL in JavaScript
--
procedure gen_filter_escape;

procedure check_sgid;

--------------------------------------------
-- is_build_option_enabled
-- returns YES / NO based on build option ID

function is_build_option_enabled (
    p_build_option_id number) return boolean;

-----------------------------------------------
-- is_build_option_enabled
-- returns YES / NO based on build option name

function is_build_option_enabled (
    p_build_option_name varchar2) return boolean;


 -----------------------------------------------
 -- esc_non_basic_tags
 -- escapes input string, except specified tags
 -- use this function to preserve basic HTML formatting, yet escaping all other tags

 -- example:
 --   wwv_flow_utilities.esc_non_basic_tags('<a href="hello"><b>hello</b></a>')
 --   results in: &lt;a href="hello"&gt;<b>hello</b>&lt;/a&gt;')

 function esc_non_basic_tags (
     p_string in varchar2) return varchar2;

---------------------------------------------
-- function to extract database version value
--
function db_version
    return varchar2;

--------------------------------------------------
-- function to extract database compatibility value
--
function db_compatibility
    return varchar2;

---------------------------------------------------------------------
-- boolean function to compare current db version with input parameter
--
function db_version_is_at_least(p_version in varchar2)
    return boolean;

--------------------------------------------------------------
-- vc2 function to compare current db version with input parameter
--
function db_version_is_at_least_i(p_version in varchar2)
    return varchar2;

---------------------------------------------------------------------
-- boolean function to check if database is xe
--
function db_edition_is_xe
    return boolean;

--##############################################################################
--#
--# Page Caching
--#
--##############################################################################

procedure cache_purge_by_application (
    p_application    in number)
    ;

procedure cache_purge_by_page (
    p_application  in number,
    p_page         in number,
    p_user_name    in varchar2 default null)
    ;

procedure cache_purge_stale (
    p_application    in number);

function cache_get_date_cached (
    p_application  in number,
    p_page         in number)
    return date;

--##############################################################################
--#
--# Region Caching
--#
--##############################################################################

procedure purge_regions_by_app (
     p_application in number);

procedure purge_regions_by_id (
     p_application in number,
     p_region_id   in number);

procedure purge_regions_by_name (
     p_application  in number,
     p_page_id      in number,
     p_region_name  in varchar2);

procedure purge_regions_by_page (
     p_application  in number,
     p_page_id      in number);

procedure purge_stale_regions (
     p_application in number);

function count_stale_regions (
    p_application    in number)
    return number;

function cache_get_date_cached (
    p_application  in number,
    p_page         in number,
    p_region_name  in varchar2)
    return date;

--##############################################################################
--#
--# Export
--#
--##############################################################################

--==============================================================================
procedure export_application_to_db (
   p_application_id    in number,
   p_with_original_ids in boolean default false );

--==============================================================================
function export_application_to_clob (
   p_application_id            in number,
   p_export_ir_public_reports  in varchar2 default 'N',
   p_export_ir_private_reports in varchar2 default 'N',
   p_export_ir_notifications   in varchar2 default 'N',
   p_export_translations       in varchar2 default 'N',
   p_export_pkg_app_mapping    in varchar2 default 'N',
   p_with_original_ids         in boolean  default false,
   p_exclude_subscriptions     in boolean  default false )
   return clob
   ;

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_application_as_download (
    p_application_id          in number);

--==============================================================================
function export_page_to_clob (
   p_application_id            in number,
   p_page_id                   in number,
   p_export_ir_public_reports  in varchar2 default 'N',
   p_export_ir_private_reports in varchar2 default 'N',
   p_export_ir_notifications   in varchar2 default 'N',
   p_with_original_ids         in boolean  default false )
   return CLOB;

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_page_as_download (
    p_application_id          in number,
    p_page_id                 in number);

--==============================================================================
-- DEPRECATED - DO NOT USE
--==============================================================================
procedure export_component_as_download (
    p_application_id          in number,
    p_component_id            in number,
    p_component_type          in varchar2);

--==============================================================================
procedure export_workspace (
    p_workspace_id             in number,
    p_format                   in varchar2 default 'UNIX',
    p_include_team_development in boolean  default true,
    p_include_extension_links  in boolean  default true,
    p_minimal                  in boolean default false );

--==============================================================================
function export_workspace_to_clob (
    p_workspace_id             in number,
    p_include_team_development in boolean default true,
    p_minimal                  in boolean default false )
    return clob;

--==============================================================================
function export_restful_to_clob (
    p_workspace_id             in number )
    return clob;

--==============================================================================
function export_files_to_clob (
    p_workspace_id             in number )
    return clob;

--==============================================================================
function export_feedback_to_development (
    p_workspace_id in number,
    p_since        in date   default null )
    return clob;

--==============================================================================
function export_feedback_to_deployment (
    p_workspace_id      in number,
    p_deployment_system in varchar2,
    p_since             in date   default null )
    return clob;

--##############################################################################

--
-- Perform a string replacement in a CLOB variable
--
procedure lob_replace (
    p_lob                in out nocopy clob,
    p_search_string      in varchar2,
    p_replacement_string in varchar2 );

procedure lob_replace (
    p_lob                in out nocopy clob,
    p_search_clob        in clob,
    p_replacement_clob   in clob );


function array_element(
    p_vcarr in wwv_flow_global.vc_arr2,
    p_index in number )
    return varchar2;

--
-- Convert input to utf-8 and base 64 encode, per RFC 2231
--
function b64_encode(
    p_input in varchar2 )
    return varchar2;

--
-- Encode a filename in either utf-8 encoding or utf-8 base64 encoding.
-- This is commonly used in the generation of the HTTP header for a file download,
-- as IE and FF behave differently
--
function encode_filename(
    p_filename in varchar2)
    return varchar2;


procedure get_theme_file(
    p_id            in number,
    p_app_id        in number,
    p_show_last_mod in varchar2 default 'Y');

procedure show_ir_help (
   p_app_id         in number,
   p_worksheet_id   in number,
   p_lang           in varchar2 default null,
   p_direction      in varchar2 default 'ltr' );


-- -----------------------------------------------------------------------------------------------
function get_print_document (
--
-- This function returns a document as BLOB using XML based report data and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_report_data:        XML based report data (utf-8 encoded)
--   p_report_layout:      Report layout in XSL-FO or RTF format
--   p_report_layout_type: Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:    Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:       URL of of the print server. If not specified, the print server will be derived from preferences
--                         example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_report_data         in clob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;


-- -----------------------------------------------------------------------------------------------
function get_print_document (
--
-- This function returns a document as BLOB using XML based report data and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_report_data:        XML based report data (utf-8 encoded)
--   p_report_layout:      Report layout in XSL-FO or RTF format
--   p_report_layout_type: Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:    Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:       URL of of the print server. If not specified, the print server will be derived from preferences
--                         example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_report_data         in blob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;


-- -----------------------------------------------------------------------------------------------
function get_print_document (
--
-- This function returns a document as BLOB using pre-defined report query and pre-defined report layout.
--
-- Arguments:
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout_name:  Name of the report query (stored under application's shared components)
--                          if report layout name is not specified, layout associated with report query will be used
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout_name  in varchar2 default null,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;


-- -----------------------------------------------------------------------------------------------
function get_print_document (
--
-- This function returns a document as BLOB using a pre-defined report query and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout:       Defines the report layout in in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
) return blob;


-- -----------------------------------------------------------------------------------------------
procedure download_print_document (
--
-- This procedure initiates the download of a print document using XML based report data and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_file_name            Defines the filename of the print document
--   p_content_disposition: Specifies whether to download the print document or display inline ("attachment", "inline")
--   p_report_data:         XML based report data
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_report_data         in clob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);


-- -----------------------------------------------------------------------------------------------
procedure download_print_document (
--
-- This procedure initiates the download of a print document using XML based report data and RTF or XSL-FO based report layout.
--
-- Arguments:
--   p_file_name            Defines the filename of the print document
--   p_content_disposition: Specifies whether to download the print document or display inline ("attachment", "inline")
--   p_report_data:         XML based report data
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_report_data         in blob,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);


-- -----------------------------------------------------------------------------------------------
procedure download_print_document (
--
-- This procedure initiates the download of a print document using pre-defined report query and pre-defined report layout.
--
-- Arguments:
--   p_file_name            Filename of print document
--   p_content_disposition: Download print document or display inline ("attachment", "inline")
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout_name:  Name of the report query (stored under application's shared components)
--                          if report layout name is not specified, layout associated with report query will be used
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout_name  in varchar2 default null,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);


-- -----------------------------------------------------------------------------------------------
procedure download_print_document (
--
-- This procedure initiates the download of a print document using pre-defined report query and RTF and XSL-FO based report layout.
--
-- Arguments:
--   p_file_name            Filename of print document
--   p_content_disposition: Download print document or display inline ("attachment", "inline")
--   p_application_id:      Defines the application ID of the report query
--   p_report_query_name:   Name of the report layout (stored under application's Shared Components)
--   p_report_layout:       Report layout in XSL-FO or RTF format
--   p_report_layout_type:  Defines the report layout type, that is "xsl-fo" or "rtf"
--   p_document_format:     "Defines the document format, that is "pdf", "rtf", "xls", "htm", or "xml"
--   p_print_server:        URL of of the print server. If not specified, the print server will be derived from preferences
--                          example: http://myserver.example.com:8888/xmlpserver/convert
--
    p_file_name           in varchar,
    p_content_disposition in varchar  default 'attachment',
    p_application_id      in number,
    p_report_query_name   in varchar2,
    p_report_layout       in clob,
    p_report_layout_type  in varchar2 default 'xsl-fo',
    p_document_format     in varchar2 default 'pdf',
    p_print_server        in varchar2 default null
);

-------------------------------------------------------------------------------------------------
-- Based on the browser this function returns the mime type for an excel file download.
-- IE:     application/vnd.ms-excel
-- Others: application/excel
-------------------------------------------------------------------------------------------------
function get_excel_mime_type return varchar2;

-------------------------------------------------------------------------------------------------
-- Adds the necessary commands to the HTTP header to indicate a file download of a specific
-- mime type. It also takes care that the file name is probably encoded.
-- Use p_is_attachment to indicate if the browser should show it inline or as an attachment.
--
-- Note: You have to call htp.init before and owa_util.http_header_close after this call!
-------------------------------------------------------------------------------------------------
procedure print_download_header (
    p_mime_type      in varchar2,
    p_mime_charset   in varchar2 default null,
    p_file_name      in varchar2 default null,
    p_is_attachment  in boolean  default true,
    p_content_length in number   default null,
    p_http_hdr_attr1 in varchar  default null );

--==============================================================================
-- function to convert Oracle Dateformat to a javascript date date format
-- pFormat - Oracle Date format to be converted
--==============================================================================
function get_javascript_date_format (
    p_format in varchar2 )
    return varchar2;

--==============================================================================
-- function to determine should time part be displayed and it's display format(24hr or 12hr date format
-- p_js_date_format - javascript based date format
--==============================================================================
function get_time_format (
    p_js_date_format in varchar2)
    return varchar2;
-------------------------------------------------------------------------------------------------
-- Function returns an Oracle date datatype for an absoute or relative date string value.
-- p_value:    is a date string containing an absolute date (eg. 12-OCT-2009) or a
--             relative date (eg. +1d)
-- p_format:   is an Oracle date format
-- p_attribute is the name of the attribute which is converted and is used to build
--             the error message in the format APEX.DATEPICKER_xxx_INVALID if the
--             conversion fails
-------------------------------------------------------------------------------------------------
function get_oracle_date (
    p_value     in varchar2,
    p_format    in varchar2,
    p_attribute in varchar2,
    p_item_name in varchar2
) return date;
-------------------------------------------------------------------------------------------------
-- Function to render and get the JqueryUI Datepicker related Source
--    p_id:                 The id for the item
--    p_name:               Name for the item
--    p_value:              The value for item
--    p_date_format:        The Date format to be used for rendering
--    p_size:               Input item size
--    p_max_length:         Maxlength for the item
--    p_placeholder:        Placeholder rendered into the date input field
--    p_attributes:         Additional HTML attributes for the item
--    p_item_label:         Label for the input item
--    p_default_value:      The default date to be highlighted in datepicker
--    p_max_value:          Maximum date for item
--    p_min_value:          Minimum date for item
--    p_show_on:            When the datepicker should be displayed
--    p_show_other_months:  should the datepicker show Month Selection list
--    p_number_of_months:   Number of months to be displayed
--    p_navigation_list_for:Navigation list for Year, Month or Both
--    p_year_range:         Year range to be displayed in the Year selection list
-------------------------------------------------------------------------------------------------
function get_date_picker (
    p_id                    in varchar2 default null,
    p_name                  in varchar2 default null,
    p_value                 in varchar2 default null,
    p_date_format           in varchar2 default null,
    p_size                  in number default 20,
    p_max_length            in number default 2000,
    p_placeholder           in varchar2 default null,
    p_attributes            in varchar2 default null,
    p_item_label            in varchar2 default null,

    p_default_value         in varchar2 default null,
    p_max_value             in varchar2 default null,
    p_min_value             in varchar2 default null,
    p_show_on               in varchar2 default 'button',
    p_show_other_months     in boolean  default false,
    p_number_of_months      in varchar2 default null,
    p_navigation_list_for   in varchar2 default 'NONE',
    p_year_range            in varchar2 default null,
    p_js_date_format        in varchar2 default null
) return varchar2;


procedure wwv_flow_team_tag_sync (
    p_component_type    in varchar2 default 'FEATURE',
    p_component_id      in number   default null,
    p_new_tags          in varchar2 default null,
    p_security_group_id in number   default null)
    ;

--==============================================================================
-- Returns TRUE if p_user equals to ANONYMOUS, APEX_PUBLIC_USER,
-- HTMLDB_PUBLIC_USER, nobody or the value in wwv_flow.g_public_user.
-- If not it returns FALSE.
--==============================================================================
function is_public_user (
    p_user in varchar2 default wwv_flow_security.g_user )
    return boolean;

--==============================================================================
-- Returns HTML attributes to define a table as a 'layout' table, such that it
-- will be ignored by screen readers. A 'layout' table is one that does not
-- contain data and is used purely for presentation.
--==============================================================================
function get_layout_table_attributes
    return varchar2;

--==============================================================================
-- CLOB Textarea item plugin
--
-- get clob value that was written back by ajax_clob_textarea, to process it on
-- submit.
--
-- the function was moved here from wwv_flow_f4000_plugins because it needs to
-- exist in a runtime only environment, too.
--==============================================================================
function get_clob_textarea_value (
    p_item_name in varchar2 )
    return clob;

--==============================================================================
-- Function used to load application archive to files table.
-- Only application and page archive is allowed.
--==============================================================================
function load_apex_archive_file (
    p_blob           in blob,
    p_app_id         in number default null,
    p_file_type      in varchar2 default null,
    p_file_name      in varchar2 default null,
    p_title          in varchar2 default null,
    p_mime_type      in varchar2 default null,
    p_file_charset   in varchar2 default null,
    p_description    in varchar2 default null
    ) return number;

--==============================================================================
-- Emit the header of a popup LOV.
--==============================================================================
procedure emit_popup_lov_header (
    p_template in varchar2,
    p_title    in varchar2 );

--==============================================================================
-- Function used to get dependency object in a query.
--==============================================================================
function get_dependency_objects (
    p_sql in varchar2) return t_dependent_object_list;

--==============================================================================
-- Returns p_url prefixed by <path alias>/<path prefix of workspace>/
-- if the Web Server supports friendly URLs.
--
-- This procedure is overloaded.
--==============================================================================
function get_friendly_workspace_url (
    p_url                in varchar2,
    p_absolute_url       in boolean  default false,
    p_security_group_id  in number   default null )
    return varchar2;
--==============================================================================
-- Overloaded version for p_url_type.
--==============================================================================
function get_friendly_workspace_url (
    p_url                in varchar2,
    p_security_group_id  in number default null,
    p_url_type           in t_url_type )
    return varchar2;

--==============================================================================
-- Returns p_url prefixed by get_friendly_workspace_url() + <appid>/
-- if the Web Server supports friendly URLs.
--
-- This procedure is overloaded.
--==============================================================================
function get_friendly_app_url (
    p_application_id     in varchar2 default wwv_flow_security.g_flow_id,
    p_url                in varchar2,
    p_absolute_url       in boolean  default false,
    p_security_group_id  in number   default null )
    return varchar2;
--==============================================================================
-- Overloaded version for p_url_type.
--==============================================================================
function get_friendly_app_url (
    p_application_id     in varchar2 default wwv_flow_security.g_flow_id,
    p_url                in varchar2,
    p_security_group_id  in number   default null,
    p_url_type           in t_url_type )
    return varchar2;

--==============================================================================
-- Resets the internal cache for building friendly URLs.
--==============================================================================
procedure reset_friendly_url_cache;

--==============================================================================
-- Public API see specification.
--==============================================================================
function get_apex_path (
    p_security_group_id  in number default null,
    p_url_type           in t_url_type default c_url_type_relative )
    return varchar2;

--==============================================================================
-- Populate user and date audit columns
--==============================================================================
procedure set_audit_cols (
    p_username in out nocopy varchar2,
    p_date     in out nocopy varchar2 );

--==============================================================================
-- Print a given clob to a writer object and flush the output.
--
-- Parameters:
-- * p_writer: The writer.
-- * p_clob:   The clob.
-- * p_escape: If true (the default), escape special characters, using
--             apex_escape.html.
--
-- Example:
--   Print l_clob and escape special characters.
--
--     declare
--         l_out  wwv_flow_t_writer := wwv_flow_t_htp_writer();
--         l_clob clob := '<script>alert(1)</script>';
--     begin
--         apex_util.prn (
--             p_writer => l_writer,
--             p_clob   => l_clob,
--             p_escape => true );
--     end;
--==============================================================================
procedure prn (
    p_writer in out nocopy wwv_flow_t_writer,
    p_clob   in            clob,
    p_escape in            boolean default true );

--==============================================================================
-- Creates a URL using actions syntax.
--
-- There are two kinds of actions:
--
--      1. Using the global context
--          Syntax:     #action$action-name?arguments
--          Example:    #action$a-submit?request=SAVE
--
--         Note: Internal global actions should use the "a-" prefix.
--
--      2. Using specific context
--          Syntax:     [context-id]action-name?arguments
--          Example:    [tasksIG]reset-report
--
--
-- Parameters:
-- * p_action_name: Name of the action. E.g. a-submit
-- * p_context_id:  Optional name of the specific context.
-- * p_arguments:   Table of Name/value pairs arguments for the action.
--                  The values will be URL escaped.
--
-- Example:
--   Generate an action URL to submit the page.
--
--     declare
--         l_url  varchar2( 4000 );
--     begin
--         l_url :=
--              wwv_flow_utilities.get_action_url (
--                  p_action_name => 'a-submit',
--                  p_arguments   => wwv_flow_t_varchar2(
--                                       'request', 'SUBMIT' ) );
--         sys.dbms_output.put_line( l_url );
--     end;
--==============================================================================
function get_action_url(
    p_action_name   in varchar2,
    p_context_id    in varchar2             default null,
    p_arguments     in wwv_flow_t_varchar2  default null )
    return varchar2;

end wwv_flow_utilities;
/
show errors
