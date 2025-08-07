set define '^' verify off
prompt ...wwv_flow_plugin_util
create or replace package wwv_flow_plugin_util as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2010, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_plugin_util.sql
--
--    DESCRIPTION
--      This package is a collection of utility functions for plug-ins.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      02/03/2010 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_sql_handler is record (
    cursor_handler number,
    base_statement varchar2(32767),
    column_list    wwv_flow_global.t_desc_tab );

type t_value is record (
    varchar2_value      varchar2(32767),
    number_value        number,
    date_value          date,
    timestamp_value     timestamp,
    timestamp_tz_value  timestamp with time zone,
    timestamp_ltz_value timestamp with local time zone,
    interval_y2m_value  interval year to month,
    interval_d2s_value  interval day to second,
    blob_value          blob,
    bfile_value         bfile,
    clob_value          clob,
    anydata_value       sys.anydata );

type t_value_list is table of t_value index by pls_integer;

type t_column is record (
    name        varchar2(32767),
    data_type   wwv_flow_global.t_dbms_id, /* use c_data_type_* constants to compare */
    format_mask varchar2(255),
    value_list  t_value_list );

type t_column_list       is table of t_column index by pls_integer;
type t_column_value_list is table of wwv_flow_global.vc_arr2 index by pls_integer;

type t_bind is record (
    name  varchar2(128),
    value varchar2(32767) );

type t_bind_list is table of t_bind index by pls_integer;

-- For backward compatibility
subtype t_column_values      is t_column;
subtype t_column_value_list2 is t_column_list;

subtype t_data_access_type   is pls_integer range 1..2;

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_search_contains_case    constant varchar2(20) := 'CONTAINS_CASE';   -- uses INSTR
c_search_contains_ignore  constant varchar2(20) := 'CONTAINS_IGNORE'; -- uses INSTR with UPPER
c_search_exact_case       constant varchar2(20) := 'EXACT_CASE';      -- uses LIKE value%
c_search_exact_ignore     constant varchar2(20) := 'EXACT_IGNORE';    -- uses LIKE VALUE% with UPPER
c_search_like_case        constant varchar2(20) := 'LIKE_CASE';       -- uses LIKE %value%
c_search_like_ignore      constant varchar2(20) := 'LIKE_IGNORE';     -- uses LIKE %VALUE% with UPPER
c_search_lookup           constant varchar2(20) := 'LOOKUP';          -- uses = value
--
c_data_type_varchar2      constant varchar2(20) := 'VARCHAR2';
c_data_type_number        constant varchar2(20) := 'NUMBER';
c_data_type_date          constant varchar2(20) := 'DATE';
c_data_type_timestamp     constant varchar2(20) := 'TIMESTAMP';
c_data_type_timestamp_tz  constant varchar2(20) := 'TIMESTAMP_TZ';
c_data_type_timestamp_ltz constant varchar2(20) := 'TIMESTAMP_LTZ';
c_data_type_interval_y2m  constant varchar2(20) := 'INTERVAL_Y2M';
c_data_type_interval_d2s  constant varchar2(20) := 'INTERVAL_D2S';
c_data_type_blob          constant varchar2(20) := 'BLOB';
c_data_type_bfile         constant varchar2(20) := 'BFILE';
c_data_type_clob          constant varchar2(20) := 'CLOB';
c_data_type_rowid         constant varchar2(20) := 'ROWID';
c_data_type_sdo_geometry  constant varchar2(20) := 'SDO_GEOMETRY';
--
c_empty_data_type_list    wwv_flow_global.vc_arr2;
c_empty_bind_list         t_bind_list;

c_data_access_total_rows  constant t_data_access_type := 1;
c_data_access_aggregate   constant t_data_access_type := 2;

c_ignore_display_value    constant varchar2(1)  := chr(0);
--
--==============================================================================
-- Returns p_value escaped or not depending on the escape parameter.
--==============================================================================
function escape (
    p_value  in varchar2,
    p_escape in boolean )
    return varchar2;
--
--==============================================================================
-- Replaces all &ITEM. substitution references in p_value and returns the result.
-- If p_escape is TRUE, special characters in the replaced values will be escaped.
--==============================================================================
function replace_substitutions (
    p_value  in varchar2,
    p_escape in boolean  default true )
    return varchar2;
--
--==============================================================================
-- Returns a properly escaped HTML attribute if p_value is not null.
--==============================================================================
function get_html_attr (
    p_name  in varchar2,
    p_value in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns some of the general attributes of an HTML element (eg. id, name,
-- required, placeholder, aria-error-attributes, class) which should be used
-- if a HTML input/select/textarea/... tag is generated to get a consistent
-- set of attributes.
--
-- Set p_add_labelledby to FALSE if you render a HTML input element like input/select/
-- textarea which doesn't require specifying the aria-labelledby attribute because
-- the label's 'for' attribute will work for those HTML input elements. Set it to
-- TRUE for all 'non-standard form element widgets (i.e using div, span, etc.)' which
-- do allow focus to make them accessible to screen readers. Note: Inclusion of
-- aria-labelledby is also dependent on 2 things. Firstly the item plug-in having
-- 'Standard Form Element' set to 'No' and secondly there being the #LABEL_ID# substitution
-- defined in the item's corresponding label template.
--==============================================================================
function get_element_attributes (
    p_item                  in wwv_flow_plugin_api.t_item,
    p_name                  in varchar2 default null,
    p_default_class         in varchar2 default null,
    p_add_id                in boolean  default true,
    p_add_required          in boolean  default true,
    p_add_labelledby        in boolean  default true,
    p_aria_describedby_id   in varchar2 default null,
    p_add_multi_value       in boolean  default false )
    return varchar2;
--
--==============================================================================
-- Returns an <a href>xxx</a> HTML tag where p_url is automatically converted
-- to a valid APEX url (checksum, dialog, ...).
--==============================================================================
function get_link (
    p_url                in varchar2,
    p_text               in varchar2,
    p_escape_text        in boolean  default true,
    p_attributes         in varchar2 default null,
    p_triggering_element in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Returns the value of a plug-in attribute as number, taking into account NLS
-- decimal separator effective for the current database session. Use this
-- function in plug-in PL/SQL source for custom attributes of type NUMBER
-- instead of the built-in to_number() function.
--==============================================================================
function get_attribute_as_number (
    p_value           in varchar2,
    p_attribute_label in varchar2 default null )
    return number;
--
--==============================================================================
-- XXX. $$$
--
-- p_value: t_value record type
--==============================================================================
procedure set_component_values (
    p_column_value_list in t_column_list,
    p_row_num           in pls_integer );
--
--==============================================================================
-- XXX. $$$
--
-- p_value: t_value record type
--==============================================================================
procedure clear_component_values;
--
--==============================================================================
-- Returns TRUE if both values are equal and FALSE if not.
-- Note: if both values are null, TRUE will be returned as well.
--==============================================================================
function is_equal (
    p_value1 in varchar2,
    p_value2 in varchar2 )
    return boolean;
--
--==============================================================================
-- Deprecated!
-- Returns the position in the list where p_value is stored. If it's not found
-- null will be returned.
--==============================================================================
function get_position_in_list (
    p_list  in wwv_flow_global.vc_arr2,
    p_value in varchar2 )
    return number;
--
--==============================================================================
-- Adds the javascript dependencies required by the a-unsafe-html element
--  - The DOMPurify JavaScript library
--  - libraries/apex/component.UnsafeHTML.js
--==============================================================================
procedure add_unsafe_html_javascript;
--
--==============================================================================
-- Escapes, and wraps the content in an a-unsafe-html element
-- The caller must ensure the needed javascript dependencies are loaded as well
--
-- Parameters:
--  * p_html:      The unescaped raw HTML string
--
-- Returns:
--  the escaped HTML, wrappen in an a-unsafe-html tag
--
-- Example:
--      The following unsafe, raw HTML string:
--      <p>test<script>alert("XSS");</script></p>
--
--      will be returned as:
--
--      <a-unsafe-html aria-hidden="true">
--          &lt;p&gt;test&lt;script&gt;alert(&quot;XSS&quot;);&lt;&#x2F;script&gt;&lt;&#x2F;p&gt;
--      </a-unsafe-html>
--
--==============================================================================
function make_unsafe_html_element (
    p_html in clob )
    return clob;
--
--==============================================================================
-- Prints unsafe HTML content to be sanitized client-side
-- Uses add_unsafe_html_javascript and make_unsafe_html_element
--
-- Parameters:
--  * p_html:      The unescaped raw HTML string
--
--==============================================================================
procedure print_unsafe_html (
    p_html in clob );
--
--==============================================================================
-- Outputs the value in an escaped form. It's also taking care of chunking big
-- strings into smaller outputs.
--==============================================================================
procedure print_escaped_value (
    p_value in varchar2 );
--
--==============================================================================
-- Outputs the value in an escaped form. It's also taking care of chunking big
-- strings into smaller outputs.
--==============================================================================
procedure print_escaped_value (
    p_value in wwv_flow_session_state_api.t_value );
--
--==============================================================================
-- register a change handler for the item specified in the "Order By" expression
-- within region source settings.
--==============================================================================
procedure register_refresh_handler(
    p_region_static_id in varchar2,
    p_item_name        in varchar2 );
--
--==============================================================================
-- adds a page item to the list of page items to submit. Does nothing if the
-- item is already part of the list.
--==============================================================================
procedure add_page_item_to_submit(
    p_page_items_to_submit in out nocopy varchar2,
    p_add_item             in            varchar2 );
--
--==============================================================================
-- Outputs the value in an escaped form. It's also taking care of chunking big
-- strings into smaller outputs.
--==============================================================================
procedure print_escaped_value (
    p_param in wwv_flow_plugin_api.t_item_render_param );
--
--==============================================================================
-- Outputs a hidden field to store the page item value if the
-- page item is rendered readonly but not printer friendly.
--==============================================================================
procedure print_hidden_if_readonly (
    p_item_name           in varchar2,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean,
    p_id_postfix          in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden field to store the page item value if the
-- page item is rendered readonly but not printer friendly.
--==============================================================================
procedure print_hidden_if_readonly (
    p_item       in wwv_flow_plugin_api.t_item,
    p_param      in wwv_flow_plugin_api.t_item_render_param,
    p_id_postfix in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden field to store the page item value.
--==============================================================================
procedure print_hidden (
    p_item_name  in varchar2,
    p_value      in varchar2,
    p_id_postfix in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden field to store the page item value.
--==============================================================================
procedure print_hidden (
    p_item       in wwv_flow_plugin_api.t_item,
    p_param      in wwv_flow_plugin_api.t_item_render_param,
    p_id_postfix in varchar2 default null,
    p_classes    in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden field to store the item value.
--==============================================================================
procedure print_hidden (
    p_item       in wwv_flow_plugin_api.t_item,
    p_value      in varchar2,
    p_id_postfix in varchar2 default null,
    p_classes    in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden field to store the item value.
--==============================================================================
procedure print_hidden (
    p_item_name  in varchar2,
    p_value      in wwv_flow_session_state_api.t_value,
    p_id_postfix in varchar2 default null,
    p_classes    in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden protected field to store the page item value.
--==============================================================================
procedure print_hidden_protected (
    p_item_name  in varchar2,
    p_value      in varchar2,
    p_id_postfix in varchar2 default null );
--
--==============================================================================
-- Outputs a hidden protected field to store the page item value.
--==============================================================================
procedure print_hidden_protected (
    p_item_name  in varchar2,
    p_value      in wwv_flow_session_state_api.t_value,
    p_id_postfix in varchar2 default null );
--
--==============================================================================
-- Outputs a checksum to protect the value of a page item from manipulations.
--==============================================================================
procedure print_protected (
    p_item_name in varchar2,
    p_value     in varchar2 );
--
--==============================================================================
-- Outputs a checksum to protect the value of a page item from manipulations.
--==============================================================================
procedure print_protected (
    p_param     in wwv_flow_plugin_api.t_item_render_param );
--
--==============================================================================
-- Outputs a checksum to protect the value of a page item from manipulations.
--==============================================================================
procedure print_protected (
    p_value     in wwv_flow_session_state_api.t_value );
--
--==============================================================================
-- Outputs a SPAN tag for a display only field.
-- If p_escape isn't specified, the value from p_item.escape_output will be used.
--==============================================================================
procedure print_display_only (
    p_item             in wwv_flow_plugin_api.t_item,
    p_display_value    in varchar2,
    p_show_line_breaks in boolean,
    p_escape           in boolean  default null,
    p_id_postfix       in varchar2 default '_DISPLAY',
    p_show_icon        in boolean  default true );
--
--==============================================================================
-- Outputs a SPAN tag for a display only field.
-- If p_escape isn't specified, the value from p_item.escape_output will be used.
--==============================================================================
procedure print_display_only (
    p_item             in wwv_flow_plugin_api.t_item,
    p_display_value    in wwv_flow_session_state_api.t_value,
    p_show_line_breaks in boolean,
    p_escape           in boolean  default null,
    p_id_postfix       in varchar2 default '_DISPLAY',
    p_show_icon        in boolean  default true );
--
--==============================================================================
-- Outputs a SPAN tag for the item icon
--==============================================================================
procedure print_item_icon (
    p_item             in wwv_flow_plugin_api.t_item
);
--
--==============================================================================
-- Deprecated!
--
-- Outputs a SPAN tag for a display only field.
--==============================================================================
procedure print_display_only (
    p_item_name        in varchar2,
    p_display_value    in varchar2,
    p_show_line_breaks in boolean,
    p_escape           in boolean,
    p_attributes       in varchar2,
    p_id_postfix       in varchar2 default '_DISPLAY' );
--
--==============================================================================
-- Outputs an OPTION tag. The values are always escaped.
--==============================================================================
procedure print_option (
    p_display_value in varchar2,
    p_return_value  in varchar2,
    p_is_selected   in boolean,
    p_attributes    in varchar2,
    p_escape        in boolean  default true );
--
--==============================================================================
-- Outputs the standard HTTP header for a JSON output.
--==============================================================================
procedure print_json_http_header;
--
--==============================================================================
-- Outputs a JSON response based on the result of a two column LOV in the format:
-- [{"d":"display","r":"return"},{"d":...,"r":...},...]
--
-- p_sql_statement         A SQL statement which returns two columns from the SELECT.
-- p_component_name        The name of the page item or report column that is used
--                         in case an error is displayed.
-- p_escape                If set to TRUE the value of the display column will be
--                         escaped, otherwise it will be output as is.
-- p_replace_substitutions If set to TRUE, replace_substitutions will be called
--                         for the value of the display column, otherwise it will
--                         be output as is.
-- p_set_mime_type         If set to TRUE, the HTTP header is initialized with
--                         mime type "application/json".
--==============================================================================
procedure print_lov_as_json (
    p_sql_statement         in varchar2,
    p_component_name        in varchar2,
    p_escape                in boolean,
    p_replace_substitutions in boolean default false,
    p_set_mime_type         in boolean default true,
    p_support_legacy_lov    in boolean default false /* for internal use only! */
    );
--
--==============================================================================
-- Outputs a JSON response based on the result of a two column LOV in the format:
-- {"values":[{"d":"display","r":"return"},{"d":...,"r":...},...], "default":"..."}
--
-- The difference to print_lov_as_json is that the result also contains the
-- default value of the specified page item in the JSON attribute "default".
--
-- p_sql_statement         A SQL statement which returns two columns from the SELECT.
-- p_page_item_name        The name of the page item that is used to read the
--                         default value and which is also used in case an error is displayed.
-- p_escape                If set to TRUE the value of the display column will be
--                         escaped, otherwise it will be output as is.
-- p_replace_substitutions If set to TRUE, replace_substitutions will be called
--                         for the value of the display column, otherwise it will
--                         be output as is.
--
-- Note: The HTTP header is initialized with mime type "application/json".
--==============================================================================
procedure print_page_item_lov_as_json (
    p_sql_statement         in varchar2,
    p_page_item_name        in varchar2,
    p_escape                in boolean,
    p_replace_substitutions in boolean default false,
    p_support_legacy_lov    in boolean default false /* for internal use only! */
    );
--
--==============================================================================
-- Returns a jQuery selector based on a comma delimited string of page- and
-- region column names.
--==============================================================================
function item_names_to_jquery (
    p_item_names     in varchar2,
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action )
    return varchar2;
--
--==============================================================================
-- Returns a jQuery selector based on a comma delimited string of page- and
-- region column names.
--==============================================================================
function item_names_to_jquery (
    p_item_names in varchar2,
    p_item       in wwv_flow_plugin_api.t_item )
    return varchar2;
--
--==============================================================================
-- Returns a comma delimited string of DOM ids based on a comma delimited string
-- of page- and region column names.
--==============================================================================
function item_names_to_dom (
    p_item_names     in varchar2,
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action )
    return varchar2;
--
--==============================================================================
-- Returns a comma delimited string of DOM ids based on a comma delimited string
-- of page- and region column names.
--==============================================================================
function item_names_to_dom (
    p_item_names in varchar2,
    p_item       in wwv_flow_plugin_api.t_item )
    return varchar2;
--
--==============================================================================
-- Returns a cleaned up version of a comma delimited string of page- and region
-- column names where all spaces are removed, colons are replaced with a
-- comma and the item names are converted to uppercase. This is important for
-- JavaScript code, because page item names are case sensitive in the browser.
--==============================================================================
function cleanup_item_names (
    p_item_names in varchar2 )
    return varchar2;
--
--==============================================================================
-- Maps the numeric column type in p_sql_handler.column_list(x).col_type into
-- fewer data types defined by the constants c_data_type_*.
--==============================================================================
function get_data_type (
    p_col_type      in number,
    p_col_type_name in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Returns the passed in value of p_value as VARCHAR2.
--
-- p_value: t_value record type
--==============================================================================
function get_value_as_varchar2 (
    p_data_type   in varchar2,
    p_value       in t_value,
    p_format_mask in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Returns the index of the specified column alias in p_column_value_list.
--==============================================================================
function get_column_no (
    p_attribute_label   in varchar2,
    p_column_alias      in varchar2,
    p_column_value_list in t_column_list,
    p_is_required       in boolean,
    p_data_type         in varchar2 default c_data_type_varchar2 )
    return pls_integer;
--
--==============================================================================
-- Returns the index of the specified column alias in p_sql_handler.
--==============================================================================
function get_column_no (
    p_attribute_label in varchar2,
    p_column_alias    in varchar2,
    p_sql_handler     in t_sql_handler,
    p_is_required     in boolean,
    p_data_type       in varchar2 default c_data_type_varchar2 )
    return pls_integer;
--
--==============================================================================
-- Returns the index of the specified column alias in p_sql_handler.column_list.
--==============================================================================
function get_column_no (
    p_sql_handler  in t_sql_handler,
    p_column_alias in varchar2 )
    return pls_integer;
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column.
-- Note: All column values are returned as a string, independent of their original
--       data type!
--
-- p_sql_statement:      SQL statement which should be executed.
-- p_min_columns and
-- p_max_columns:        Used to check if the SQL statement complies to the number
--                       of required columns.
-- p_component_name:     The name of the page item or report column, ... which is
--                       used in case an error has to be displayed.
-- p_search_type:        Use one of the c_search_* constants.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      Value which should be used to restrict the query.
-- p_first_row:          Skips all rows before the specified row. Can be used for
--                       pagination.
-- p_max_rows:           Limits the number of returned rows.
--==============================================================================
function get_data (
    p_sql_statement      in varchar2,
    p_min_columns        in number,
    p_max_columns        in number,
    p_component_name     in varchar2,
    p_search_type        in varchar2    default null,
    p_search_column_name in varchar2    default null,
    p_search_string      in varchar2    default null,
    p_first_row          in number      default null,
    p_max_rows           in number      default null,
    p_auto_bind_items    in boolean     default true,
    p_bind_list          in t_bind_list default c_empty_bind_list )
    return t_column_value_list;
--
--==============================================================================
-- Same as the above get_data but references the search column by position number.
--==============================================================================
function get_data (
    p_sql_statement      in varchar2,
    p_min_columns        in number,
    p_max_columns        in number,
    p_component_name     in varchar2,
    p_search_type        in varchar2,
    p_search_column_no   in varchar2,
    p_search_string      in varchar2,
    p_first_row          in number      default null,
    p_max_rows           in number      default null,
    p_auto_bind_items    in boolean     default true,
    p_bind_list          in t_bind_list default c_empty_bind_list,
    p_support_legacy_lov in boolean     default false  /* for internal use only! */ )
    return t_column_value_list;
--
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column. This is a more advanced version of get_data, because
-- it returns the column values with their original data types.
--
-- p_sql_statement:      SQL statement which should be executed.
-- p_min_columns and
-- p_max_columns:        Used to check if the SQL statement complies to the number
--                       of required columns.
-- p_data_type_list:     If provided checks that the data type for each column
--                       matches to the specified data type in the array.
--                       Use the constants c_data_type_* for available data types.
-- p_component_name:     The name of the page item or report column, ... which is
--                       used in case an error has to be displayed.
-- p_search_type:        Use one of the c_search_* constants.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      Value which should be used to restrict the query.
-- p_first_row:          Skips all rows before the specified row. Can be used for
--                       pagination.
-- p_max_rows:           Limits the number of returned rows.
--==============================================================================
function get_data2 (
    p_sql_statement      in varchar2,
    p_min_columns        in number,
    p_max_columns        in number,
    p_data_type_list     in wwv_flow_global.vc_arr2 default c_empty_data_type_list,
    p_component_name     in varchar2,
    p_search_type        in varchar2    default null,
    p_search_column_name in varchar2    default null,
    p_search_string      in varchar2    default null,
    p_first_row          in number      default null,
    p_max_rows           in number      default null,
    p_auto_bind_items    in boolean     default true,
    p_bind_list          in t_bind_list default c_empty_bind_list )
    return t_column_list;
--
--==============================================================================
-- Same as the above get_data2 but references the search column by position number.
--==============================================================================
function get_data2 (
    p_sql_statement    in varchar2,
    p_min_columns      in number,
    p_max_columns      in number,
    p_data_type_list   in wwv_flow_global.vc_arr2 default c_empty_data_type_list,
    p_component_name   in varchar2,
    p_search_type      in varchar2,
    p_search_column_no in varchar2,
    p_search_string    in varchar2,
    p_first_row        in number      default null,
    p_max_rows         in number      default null,
    p_auto_bind_items  in boolean     default true,
    p_bind_list        in t_bind_list default c_empty_bind_list )
    return t_column_list;
--
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column. This function expects a t_region record to automatically
-- set the format_mask in the t_column_value record which will be sued by set_component_values.
--
-- p_sql_statement:      SQL statement which should be executed.
-- p_region              Region record
-- p_search_type:        Use one of the c_search_* constants.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      Value which should be used to restrict the query.
-- p_first_row:          Skips all rows before the specified row. Can be used for
--                       pagination.
-- p_max_rows:           Limits the number of returned rows.
--==============================================================================
function get_data2 (
    p_sql_statement      in varchar2,
    p_region             in wwv_flow_plugin_api.t_region,
    p_search_type        in varchar2    default null,
    p_search_column_name in varchar2    default null,
    p_search_string      in varchar2    default null,
    p_first_row          in number      default null,
    p_max_rows           in number      default null,
    p_auto_bind_items    in boolean     default true,
    p_bind_list          in t_bind_list default c_empty_bind_list )
    return t_column_list;
--
--==============================================================================
-- Gets the display (lookup) value for the value specified in p_search_string.
--
-- p_sql_statement:     SQL statement which is used for the lookup.
-- p_min_columns and
-- p_max_columns:       Used to check if the SQL statement complies to the number
--                      of required columns.
-- p_component_name:    The name of the page item or report column, ... which is
--                      used in case an error has to be displayed.
-- p_display_column_no: Column which should be returned from the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_column_no:  Column which should be used to restrict the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_string:     Value which should be looked up.
-- p_display_extra:     If set to TRUE and a value isn't found, the search value
--                      will be added to the result instead.
-- p_escape_display_extra: If set to TRUE p_search_string will be escaped if added
--                         as "Display Extra" value.
--
-- Note: In the case multiple rows are returned by the query, just the first one
--       is returned.
--==============================================================================
function get_display_data (
    p_sql_statement        in varchar2,
    p_min_columns          in number,
    p_max_columns          in number,
    p_component_name       in varchar2,
    p_display_column_no    in binary_integer default 1,
    p_search_column_no     in binary_integer default 2,
    p_search_string        in varchar2,
    p_display_extra        in boolean        default true,
    p_escape_display_extra in boolean        default true,
    p_auto_bind_items      in boolean        default true,
    p_bind_list            in t_bind_list    default c_empty_bind_list,
    p_support_legacy_lov   in boolean        default false /* for internal use only! */ )
    return varchar2;
--
--==============================================================================
-- Gets the display (lookup) values for the values specified in p_search_value_list.
--
-- p_sql_statement:     SQL statement which is used for the lookup.
-- p_min_columns and
-- p_max_columns:       Used to check if the SQL statement complies to the number
--                      of required columns.
-- p_component_name:    The name of the page item or report column, ... which is
--                      used in case an error has to be displayed.
-- p_display_column_no: Column which should be returned from the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_column_no:  Column which should be used to restrict the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_value_list: Array of values which should be looked up.
-- p_display_extra:     If set to TRUE and a value isn't found, the search value
--                      will be added to the result instead.
-- p_escape_display_extra: If set to TRUE p_search_string will be escaped if added
--                         as "Display Extra" value.
--==============================================================================
function get_display_data (
    p_sql_statement        in varchar2,
    p_min_columns          in number,
    p_max_columns          in number,
    p_component_name       in varchar2,
    p_display_column_no    in binary_integer default 1,
    p_search_column_no     in binary_integer default 2,
    p_search_value_list    in wwv_flow_global.vc_arr2,
    p_display_extra        in boolean        default true,
    p_escape_display_extra in boolean        default true,
    p_auto_bind_items      in boolean        default true,
    p_bind_list            in t_bind_list    default c_empty_bind_list,
    p_support_legacy_lov   in boolean        default false /* for internal use only! */ )
    return wwv_flow_global.vc_arr2;
--
--==============================================================================
-- Opens a sql cursor and returns useful information about the SQL statement
-- in a record structure. Like used bind variables, column information, ...
--
-- p_sql_statement:  SQL statement which should be executed.
-- p_min_columns and
-- p_max_columns:    Used to check if the SQL statement complies to the number
--                   of required columns.
-- p_data_type_list: If provided checks that the data type for each column
--                   matches to the specified data type in the array.
--                   Use the constants c_data_type_* for available data types.
--                   Note: This parameter should be used in combination with
--                         get_data2.
-- p_component_name: The name of the page item or report column, ... which is
--                   used in case an error has to be displayed.
--
-- Note: Always call free_sql_handler after you are done reading data. Don't
--       forget to add it to the exception handler as well to release the cursor!
--==============================================================================
function get_sql_handler (
    p_sql_statement   in varchar2,
    p_min_columns     in number,
    p_max_columns     in number,
    p_data_type_list  in wwv_flow_global.vc_arr2 default c_empty_data_type_list,
    p_component_name  in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list )
    return t_sql_handler;
--
--==============================================================================
-- Closes the open cursor created by get_sql_handler.
--
-- p_sql_handler: Record returned by get_sql_handler.
--==============================================================================
procedure free_sql_handler (
    p_sql_handler in out nocopy t_sql_handler );
--
--==============================================================================
-- Creates and parses a SQL statement based on p_search_type and p_max_row.
-- The procedure also already binds all page item bind variables.
-- Call get_data afterwards to get the actual data.
--
-- p_sql_handler:        Record returned by get_sql_handler.
-- p_search_type:        Use one of the c_search_* constants.
-- p_search_column_name: Column which should be used to restrict the SQL statement.
-- p_first_row:          Skips all rows before the specified row. Can be used for
--                       pagination.
-- p_max_rows:           Limits the number of returned rows.
--
-- Note: get_sql_handler has to be called before this call.
--==============================================================================
procedure prepare_query (
    p_sql_handler        in out nocopy t_sql_handler,
    p_search_type        in varchar2,
    p_search_column_name in varchar2,
    p_first_row          in number         default null,
    p_max_rows           in number         default null,
    p_auto_bind_items    in boolean        default true,
    p_bind_list          in t_bind_list    default c_empty_bind_list );
--
--==============================================================================
-- Creates and parses a SQL statement based on p_search_type and p_max_row.
-- The procedure also already binds all page item bind variables.
-- Call get_data afterwards to get the actual data.
--
-- p_sql_handler:      Record returned by get_sql_handler.
-- p_search_type:      Use one of the c_search_* constants.
-- p_search_column_no: Column which should be used to restrict the SQL statement.
--                     Has to be in range of p_min_column and p_max_column.
-- p_first_row:        Skips all rows before the specified row. Can be used for
--                     pagination.
-- p_max_rows:         Limits the number of returned rows.
--
-- Note: get_sql_handler has to be called before this call.
--==============================================================================
procedure prepare_query (
    p_sql_handler      in out nocopy t_sql_handler,
    p_search_type      in varchar2       default null,
    p_search_column_no in binary_integer default 2,
    p_first_row        in number         default null,
    p_max_rows         in number         default null,
    p_auto_bind_items  in boolean        default true,
    p_bind_list        in t_bind_list    default c_empty_bind_list );
--
--==============================================================================
-- Converts the search string in uppercase if it's a case insensitive search.
--
-- p_search_type:   Use one of the c_search_* constants.
-- p_search_string: Search string.
--==============================================================================
function get_search_string (
    p_search_type   in varchar2,
    p_search_string in varchar2 )
    return varchar2;
--
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column.
-- Note: All column values are returned as a string, independent of their original
--       data type!
--
-- p_sql_handler:        Record returned by get_sql_handler.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      The query is restricted by this value.
--
-- Note: prepare_query has to be called before!
--==============================================================================
function get_data (
    p_sql_handler        in t_sql_handler,
    p_search_column_name in varchar2      default null,
    p_search_string      in varchar2      default null )
    return t_column_value_list;
--
--==============================================================================
-- Same as the above get_data but references the search column by position number.
--==============================================================================
function get_data (
    p_sql_handler      in t_sql_handler,
    p_search_column_no in binary_integer,
    p_search_string    in varchar2 )
    return t_column_value_list;
--
--==============================================================================
-- Executes the query restricted by search string (optional) and returns the
-- values for each column.
--
-- p_sql_handler:        Record returned by get_sql_handler.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      The query is restricted by this value.
--
-- Note: prepare_query has to be called before!
--==============================================================================
function get_data2 (
    p_sql_handler        in t_sql_handler,
    p_search_column_name in varchar2       default null,
    p_search_string      in varchar2       default null )
    return t_column_list;
--
--==============================================================================
-- Same as the above get_data2 but references the search column by position number.
--==============================================================================
function get_data2 (
    p_sql_handler      in t_sql_handler,
    p_search_column_no in binary_integer,
    p_search_string    in varchar2 )
    return t_column_list;
--
--==============================================================================
-- Initializes the array fetching with get_data2 where p_column_list is specified.
--
-- It executes the query restricted by search string (optional) and returns the
-- meta data for each column. You have to call get_data2 with the p_column_list
-- parameter to read the actual data.
--
-- p_sql_handler:        Record returned by get_sql_handler.
-- p_search_column_name: Column name which should be used to restrict the SQL statement.
-- p_search_string:      The query is restricted by this value.
--
-- Note: prepare_query has to be called before!
--==============================================================================
function init_get_data2 (
    p_sql_handler        in t_sql_handler,
    p_search_column_name in varchar2       default null,
    p_search_string      in varchar2       default null )
    return t_column_list;
--
--==============================================================================
-- Fetches rows until p_array_size is reached and returns the values for each column.
--
-- p_sql_handler:        Record returned by get_sql_handler.
-- p_array_size:         Number of rows which should be fetched, set to NULL if all rows
--                       should be fetched.
-- p_column_list:        Array returned by init_get_data2.
--
-- Note: init_get_data2 has to be called before!
--==============================================================================
procedure get_data2 (
    p_sql_handler in            t_sql_handler,
    p_array_size  in            pls_integer,
    p_column_list in out nocopy t_column_list );
--
--==============================================================================
-- Gets the display (lookup) values for the values specified in p_search_value_list.
--
-- p_sql_handler:       Record returned by get_sql_handler.
-- p_display_column_no: Column which should be returned from the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_column_no:  Column which should be used to restrict the SQL statement.
--                      Has to be in range of p_min_column and p_max_column.
-- p_search_value_list: Array of values which should be looked up.
-- p_display_extra:     If set to TRUE and a value isn't found, the search value
--                      will be added to the result instead.
-- p_escape_display_extra: If set to TRUE p_search_string will be escaped if added
--                         as "Display Extra" value.
--
-- Note: get_sql_handler has to be called before!
--       prepare_query will be called by this function.
--==============================================================================
function get_display_data (
    p_sql_handler          in t_sql_handler,
    p_display_column_no    in binary_integer default 1,
    p_search_column_no     in binary_integer default 2,
    p_search_value_list    in wwv_flow_global.vc_arr2,
    p_display_extra        in boolean        default true,
    p_escape_display_extra in boolean        default true,
    p_auto_bind_items      in boolean        default true,
    p_bind_list            in t_bind_list    default c_empty_bind_list )
    return wwv_flow_global.vc_arr2;
--
--==============================================================================
-- Executes a PL/SQL expression and returns the result.
--
-- p_plsql_expression: PL/SQL expression which returns string.
--==============================================================================
function get_plsql_expression_result (
    p_plsql_expression in varchar2,
    p_auto_bind_items  in boolean     default true,
    p_bind_list        in t_bind_list default c_empty_bind_list )
    return varchar2;
--
--==============================================================================
-- Executes a PL/SQL expression and returns the result.
--
-- p_plsql_expression: PL/SQL expression which returns CLOB.
--==============================================================================
function get_plsql_expr_result_clob (
    p_plsql_expression in varchar2,
    p_auto_bind_items  in boolean     default true,
    p_bind_list        in t_bind_list default c_empty_bind_list )
    return clob;
--
--==============================================================================
-- Executes a PL/SQL expression and returns the result.
--
-- p_plsql_expression: PL/SQL expression which returns boolean.
--==============================================================================
function get_plsql_expr_result_boolean (
    p_plsql_expression in varchar2,
    p_auto_bind_items  in boolean     default true,
    p_bind_list        in t_bind_list default c_empty_bind_list )
    return boolean;
--
--==============================================================================
-- Executes a PL/SQL function code block and returns the result.
--
-- p_plsql_function: PL/SQL function which returns string.
--                   For example:
--                   declare
--                       l_test varchar2(10);
--                   begin
--                       -- do something
--                       return l_test;
--                   end;
--==============================================================================
function get_plsql_function_result (
    p_plsql_function  in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list )
    return varchar2;
--
--==============================================================================
-- Executes a PL/SQL function code block and returns the result.
--
-- p_plsql_function: PL/SQL function which returns boolean.
--                   For example:
--                   declare
--                       l_test boolean;
--                   begin
--                       -- do something
--                       return l_test;
--                   end;
--==============================================================================
function get_plsql_func_result_boolean (
    p_plsql_function  in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list )
    return boolean;
--
--==============================================================================
-- Executes a PL/SQL function code block and returns the result.
--
-- p_plsql_function: PL/SQL function which returns clob.
--                   For example:
--                   declare
--                       l_test clob;
--                   begin
--                       -- do something
--                       return l_test;
--                   end;
--==============================================================================
function get_plsql_func_result_clob (
    p_plsql_function  in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list )
    return clob;
--
--==============================================================================
-- Executes a PL/SQL code block.
--==============================================================================
procedure execute_plsql_code (
    p_plsql_code      in varchar2,
    p_auto_bind_items in boolean     default true,
    p_bind_list       in t_bind_list default c_empty_bind_list );
--
--==============================================================================
-- Function returns true if the passed build option, authorization and
-- condition are ok to display/process/use this component.
--==============================================================================
function is_component_used (
    p_build_option_id         in number   default null,
    p_authorization_scheme_id in varchar2,
    p_condition_type          in varchar2,
    p_condition_expression1   in varchar2,
    p_condition_expression2   in varchar2,
    p_component               in varchar2 default null )
    return boolean;
--
--==============================================================================
-- Returns the capabilities of current region source/item lov/process source, when it is a web source
--==============================================================================
function get_capabilities return wwv_flow_exec_api.t_source_capabilities;
--
--==============================================================================
-- asserts that the current region source supports the requested data source
-- access type.
--==============================================================================
function supports_data_source_access(
    p_data_access_type in t_data_access_type,
    p_is_requested     in boolean )
    return boolean;
--
--==============================================================================
-- Writes the data of the page item meta data into the debug output.
--==============================================================================
procedure debug_item (
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_item   in wwv_flow_plugin_api.t_item );
--
procedure debug_item_render (
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_item   in wwv_flow_plugin_api.t_item,
    p_param  in wwv_flow_plugin_api.t_item_render_param );
--
--==============================================================================
-- Writes the data of the region meta data into the debug output.
--==============================================================================
procedure debug_region (
    p_plugin in wwv_flow_plugin_api.t_plugin,
    p_region in wwv_flow_plugin_api.t_region );
--
procedure debug_region (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_region              in wwv_flow_plugin_api.t_region,
    p_is_printer_friendly in boolean );
--
--==============================================================================
-- Writes the data of the dynamic action meta data into the debug output.
--==============================================================================
procedure debug_dynamic_action (
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_dynamic_action in wwv_flow_plugin_api.t_dynamic_action );
--
--==============================================================================
-- Writes the data of the process meta data into the debug output.
--==============================================================================
procedure debug_process (
    p_plugin  in wwv_flow_plugin_api.t_plugin,
    p_process in wwv_flow_plugin_api.t_process );
--
--==============================================================================
-- Writes the data of the authorization meta data into the debug output.
--==============================================================================
procedure debug_authorization (
    p_plugin        in wwv_flow_plugin_api.t_plugin,
    p_authorization in wwv_flow_plugin_api.t_authorization );
--
--==============================================================================
-- Writes the data of the authentication meta data into the debug output.
--==============================================================================
procedure debug_authentication (
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_authentication in wwv_flow_plugin_api.t_authentication );
--
--==============================================================================
-- Writes the data of the web source meta data into the debug output.
--==============================================================================
procedure debug_web_source (
    p_plugin         in wwv_flow_plugin_api.t_plugin,
    p_web_source     in wwv_flow_plugin_api.t_web_source );
--
--==============================================================================
-- Fetches the rows from a wwv_flow_exec context to the t_column_list structure.
--==============================================================================
function get_rows(
    p_context        in out nocopy wwv_flow_exec.t_context,
    p_column_list    in out nocopy t_column_list,
    p_amount         in            pls_integer             default 1,
    p_column_order   in            wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 ) return boolean;
--
--==============================================================================
-- Converts a t_column_list structure to a wwv_flow_exec context object, which
-- can be further processed by wwv_flow_exec procedures
--==============================================================================
function get_exec_context(
    p_column_list    in t_column_list,
    p_max_rows       in number      default null ) return wwv_flow_exec.t_context;
--
--==============================================================================
-- Maps the numeric column data type into a string.
--==============================================================================
function get_data_type_as_string (
    p_column in wwv_flow_exec_api.t_column )
    return varchar2;
--
--==============================================================================
-- Maps the numeric column data type into a string.
--==============================================================================
function get_data_type_as_string (
    p_data_type in wwv_flow_exec_api.t_data_type )
    return varchar2;
--
--==============================================================================
-- Maps the string data type into a numeric value.
--==============================================================================
function get_data_type_from_string (
    p_data_type in varchar2 ) return wwv_flow_exec_api.t_data_type;

--
--==============================================================================
-- Gets a Web Source Module operation. The Web Source operation object contains
-- all meta data for the HTTP request which needs to be done to implement the
-- given database operation (insert, update, delete).
--
-- Parameters:
-- * p_web_source:          web source plug-in meta data
-- * p_db_operation:        database operation for which to look up the
--                          Web Source operation (UPDATE -> PUT, INSERT -> POST) etc.
-- * p_db_operation:        whether to inialize the HTTP request environment
--                          (HTTP request headers, cookies, request body placeholder
--                          replacements) or not. If passed as false, the Plug-In
--                          developer is responsible for setting up the environment
--                          themselves.
-- * p_preserve_headers:    whether to preserve HTTP request headers in
--                          wwv_flow_webservices_api.g_request_headers or not.
--
-- Returns:
-- Plug-In meta data for the web source operation
--
-- Example:
-- Use get_web_source_operation as part of a Plug-In "fetch" procedure
-- in order to get meta data about the Web Source operation
--
-- procedure plugin_fetch(
--     p_plugin     in            apex_plugin.t_plugin,
--     p_web_source in            apex_plugin.t_web_source,
--     p_params     in            apex_plugin.t_web_source_fetch_params,
--     p_result     in out nocopy apex_plugin.t_web_source_fetch_result )
-- is
--     l_web_source_operation apex_plugin.t_web_source_operation;
-- begin
--
--     l_web_source_operation := apex_plugin_util.get_web_source_operation(
--         p_web_source   => p_web_source,
--         p_db_operation => apex_plugin.c_db_operation_fetch_rows,
--         p_perform_init => true );
--
--     p_result.responses.extend( 1 );
--
--     apex_plugin_util.make_rest_request(
--         p_web_source_operation => l_web_source_operation,
--         --
--         p_response             => p_result.responses( 1 ),
--         p_response_parameters  => p_result.out_parameters );
--
-- end plugin_fetch;
--
-- Since: 20.2
--==============================================================================
function get_web_source_operation(
    p_web_source       in wwv_flow_plugin_api.t_web_source,
    p_db_operation     in wwv_flow_plugin_api.t_db_operation   default null,
    p_perform_init     in boolean                              default false,
    p_preserve_headers in boolean                              default false )
    return wwv_flow_plugin_api.t_web_source_operation;

--
--==============================================================================
-- performs the actual REST request (HTTP). Unlike a direct invocation
-- of APEX_WEB_SERVICE.MAKE_REST_REQUEST all web source module parameters
-- will be respected by this procedure.
--
-- Parameters:
-- * p_web_source_operation:    Plug-In meta data for the Web Source operation
-- * p_bypass_cache:            if "true", then the cache will not be used
-- * p_time_budget:             if "all rows" are to be fetched (multiple HTTP requests),
--                              then the process will stopped when the time budget is
--                              exhausted. An error will be raised.
--
-- Returns:
-- * p_time_budget:             time budget left after request has been made
-- * p_response:                received response of the HTTP invocation
-- * p_response_parameters:     received response headers and cookies, based on web source
--                              meta data
--
-- Example:
-- Simplified Plug-In "fetch" procedure doing HTTP requests with
-- APEX_PLUGIN_UTIL.MAKE_REST_REQUEST.
--
-- procedure plugin_fetch(
--     p_plugin     in            apex_plugin.t_plugin,
--     p_web_source in            apex_plugin.t_web_source,
--     p_params     in            apex_plugin.t_web_source_fetch_params,
--     p_result     in out nocopy apex_plugin.t_web_source_fetch_result )
-- is
--     l_web_source_operation apex_plugin.t_web_source_operation;
--     l_time_budget          pls_integer := 60;
--     l_page_to_fetch        pls_integer := 1;
--     l_continue_fetching    boolean;
-- begin
--
--     l_web_source_operation := apex_plugin_util.get_web_source_operation(
--         p_web_source   => p_web_source,
--         p_db_operation => apex_plugin.c_db_operation_fetch_rows,
--         p_perform_init => true );
--
--     --
--     -- loop to execute HTTP request as long as we receive a response header named "moreRows"
--     -- with the value of "true". A time budget of (initially 60) seconds is passed as
--     -- IN OUT parameter to MAKE_REST_REQUEST; once that budget is exhausted, an error will
--     -- be raised.
--     --
--     while l_continue_fetching loop
--         p_result.responses.extend( 1 );
--         l_page_to_fetch := l_page_to_fetch + 1;
--
--         apex_plugin_util.make_rest_request(
--             p_web_source_operation => l_web_source_operation,
--             p_bypass_cache         => false,
--             p_time_budget          => l_time_budget,
--             --
--             p_response             => p_result.responses( l_page_to_fetch ),
--             p_response_parameters  => p_result.out_parameters );
--
--         l_continue_fetching := false;
--         for h in 1 .. apex_web_service.g_headers.count loop
--             if apex_web_service.g_headers( h ).name = 'moreRows' and
--                apex_web_service.g_headers( h ).value = 'true'
--             then
--                 l_continue_fetching := true;
--                 exit;
--             end if;
--         end loop;
--     end loop;
-- end plugin_fetch;
--
-- Since: 20.2
--==============================================================================
procedure make_rest_request(
    p_web_source_operation in            wwv_flow_plugin_api.t_web_source_operation,
    p_request_body         in            clob    default null,
    p_bypass_cache         in            boolean default false,
    --
    p_time_budget          in out nocopy number,
    --
    p_response             in out nocopy clob,
    p_response_parameters  in out nocopy wwv_flow_plugin_api.t_web_source_parameters );

--
--==============================================================================
-- performs the actual REST request (HTTP). Will use wwv_flow_web_services.
-- All parameters wwv_flow_web_services.make_rest_request will be derived
-- from the web source meta data passed in as "p_web_source_operation"
--
-- Parameters:
-- * p_web_source_operation:    Plug-In meta data for the Web Source operation
-- * p_bypass_cache:            if "true", then the cache will not be used
-- * p_request_body:            override request body to use
--
-- Returns:
-- * p_response:                received response of the HTTP invocation
-- * p_response_parameters:     received response headers and cookies, based on web source
--                              meta data
-- Example:
-- Simplified Plug-In "fetch" procedure doing a HTTP request with
-- APEX_PLUGIN_UTIL.MAKE_REST_REQUEST.
--
-- procedure plugin_fetch(
--     p_plugin     in            apex_plugin.t_plugin,
--     p_web_source in            apex_plugin.t_web_source,
--     p_params     in            apex_plugin.t_web_source_fetch_params,
--     p_result     in out nocopy apex_plugin.t_web_source_fetch_result )
-- is
--     l_web_source_operation apex_plugin.t_web_source_operation;
-- begin
--
--     l_web_source_operation := apex_plugin_util.get_web_source_operation(
--         p_web_source   => p_web_source,
--         p_db_operation => apex_plugin.c_db_operation_fetch_rows,
--         p_perform_init => true );
--
--     p_result.responses.extend( 1 );
--
--     apex_plugin_util.make_rest_request(
--         p_web_source_operation => l_web_source_operation,
--         --
--         p_response             => p_result.responses( 1 ),
--         p_response_parameters  => p_result.out_parameters );
--
-- end plugin_fetch;
--
-- Since: 20.2
--==============================================================================
procedure make_rest_request(
    p_web_source_operation in            wwv_flow_plugin_api.t_web_source_operation,
    --
    p_request_body         in            clob default null,
    --
    p_response             in out nocopy clob,
    p_response_parameters  in out nocopy wwv_flow_plugin_api.t_web_source_parameters );

--
--==============================================================================
-- builds a request body for a Web Source DML request. If a request body template
-- is set, then #COLUMN# placeholders will be replaced by the DML context
-- column values. In this case, the request body can be any data format.
-- If no request body template is set, the function builds a JSON with the following structure:
-- {
--    "{column1-name}": "{column1-value}",
--    "{column2-name}": "{column2-value}",
--    :
-- }
--
-- Parameters:
-- * p_request_format:       request format (JSON or XML)
-- * p_profile_columns:      column meta data (names, data types)
-- * p_values_context:       wwv_flow_exec_api context object containing DML values
-- * p_build_when_empty:     whether to build a new request body, if p_request_body is empty
--
-- * p_request_body:         request body template to perform replacements on
--
-- Returns:
-- * p_request_body:         request body (substitutions replaced or built from scratch)
--
-- Example:
-- usage of BUILD_REQUEST_BODY witin a plug-in DML procedure.
--
-- procedure plugin_dml(
--     p_plugin     in            apex_plugin.t_plugin,
--     p_web_source in            apex_plugin.t_web_source,
--     p_params     in            apex_plugin.t_web_source_dml_params,
--     p_result     in out nocopy apex_plugin.t_web_source_dml_result )
-- is
--     l_web_source_operation apex_plugin.t_web_source_operation;
--     l_request_body         clob;
-- begin
--
--     l_web_source_operation := apex_plugin_util.get_web_source_operation(
--         p_web_source   => p_web_source,
--         p_db_operation => apex_plugin.c_db_operation_insert,
--         p_perform_init => true );
--
--     apex_plugin_util.build_request_body(
--         p_request_format       => apex_plugin.c_format_json,
--         p_profile_columns      => p_web_source.profile_columns,
--         p_values_context       => p_params.insert_values_context,
--         p_build_when_empty     => true,
--         p_request_body         => l_request_body );
--
--     -- continue with APEX_PLUGIN_UTIL.MAKE_REST_REQUEST
--
-- end plugin_dml;
--
-- Since: 20.2
--==============================================================================
procedure build_request_body(
    p_request_format       in            wwv_flow_plugin_api.t_data_format,
    p_profile_columns      in            wwv_flow_plugin_api.t_web_source_columns,
    p_values_context       in            wwv_flow_exec_api.t_context,
    p_build_when_empty     in            boolean,
    --
    p_request_body         in out nocopy clob );

--
--==============================================================================
-- parse the DML request response and load return values to the values context
-- object.
--
-- This procedure always parses JSON at the root level, an array column cannot
-- be assed in. Array column contents can be accessed in the values context
-- using APEX_EXEC procedures (OPEN_ARRAY, CLOSE_ARRAY).
--
-- Parameters:
-- * p_web_source_operation:     web source operation (Plug-In) meta data
-- * p_web_source:               web source module (Plug-In) meta data
-- * p_response:                 REST response to parse
-- * p_status_code:              HTTP status code to use
-- * p_error_message:            error message to use
-- * p_values_context:           values context to store the return values in
--
-- Example:
-- usage of PROCESS_DML_RESPONSE witin a plug-in DML procedure.
--
-- procedure plugin_dml(
--     p_plugin     in            apex_plugin.t_plugin,
--     p_web_source in            apex_plugin.t_web_source,
--     p_params     in            apex_plugin.t_web_source_dml_params,
--     p_result     in out nocopy apex_plugin.t_web_source_dml_result )
-- is
--     l_web_source_operation apex_plugin.t_web_source_operation;
--     l_request_body         clob;
--     l_response             clob;
--
--     l_return_values_ctx    apex_exec.t_context := p_params.insert_values_context;
-- begin
--
--     l_web_source_operation := apex_plugin_util.get_web_source_operation(
--         p_web_source   => p_web_source,
--         p_db_operation => apex_plugin.c_db_operation_insert,
--         p_perform_init => true );
--
--     apex_plugin_util.build_request_body(
--         p_request_format       => apex_plugin.c_format_json,
--         p_profile_columns      => p_web_source.profile_columns,
--         p_values_context       => p_params.insert_values_context,
--         p_build_when_empty     => true,
--         p_request_body         => l_request_body );
--
--     -- continue with APEX_PLUGIN_UTIL.MAKE_REST_REQUEST
--
--     wwv_flow_plugin_util.process_dml_response(
--         p_web_source_operation => l_web_source_operation,
--         p_web_source           => p_web_source,
--         --
--         p_response             => l_response,
--         --
--         p_status_code          => wwv_flow_webservices_api.g_status_code,
--         p_error_message        => wwv_flow_webservices_api.g_reason_phrase,
--         --
--         p_values_context       => l_return_values_ctx );
--
-- end plugin_dml;
--
-- Since: 20.2
--==============================================================================
procedure process_dml_response(
    p_web_source_operation in wwv_flow_plugin_api.t_web_source_operation,
    p_web_source           in wwv_flow_plugin_api.t_web_source,
    --
    p_response             in clob,
    p_status_code          in pls_integer,
    p_error_message        in varchar2,
    --
    p_values_context       in wwv_flow_exec_api.t_context );

--
--==============================================================================
-- parse the response from a "DML row refetch". A "row refetch" is used for
-- lost update detection in order to verify that nobody else changed the row.
-- To use this function, the Web Source Module must have a "Fetch Single Row"
-- database operation defined.
--
-- This procedure always parses JSON at the root level, an array column cannot
-- be assed in. Array column contents can be accessed in the values context
-- using APEX_EXEC procedures (OPEN_ARRAY, CLOSE_ARRAY).
--
-- Parameters:
-- * p_web_source_operation:     web source operation (Plug-In) meta data
-- * p_web_source:               web source module (Plug-In) meta data
-- * p_response:                 REST response to parse
-- * p_values_context:           values context, needed for DML column definitions.
--
-- Returns:
-- APEX_EXEC "Values" context object for the plug-in developer to get
-- the checksum or column values from
--
-- Example:
-- Within the Plug-In DML function, perform a "refetch" operation for
-- a given row to be updated and compare checksums in order to detect
-- lost updates.
--
-- procedure plugin_dml(
--     p_plugin     in            apex_plugin.t_plugin,
--     p_web_source in            apex_plugin.t_web_source,
--     p_params     in            apex_plugin.t_web_source_dml_params,
--     p_result     in out nocopy apex_plugin.t_web_source_dml_result )
-- is
--     l_web_source_operation apex_plugin.t_web_source_operation;
--     l_request_body         clob;
--     l_response             clob;
--
--     l_refetch_context      apex_exec.t_context;
--     l_checksum             varchar2(32767);
--     l_refetched_checksum   varchar2(32767);
--
-- begin
--     p_result.update_values_context := p_params.update_values_context;
--
--     --
--     -- this code performs a "refetch" operation for a row, in order to perform
--     -- lost update detection. This happens before the actual DML.
--     --
--     if p_web_source.operations.exists( apex_plugin.c_db_operation_fetch_row ) then
--
--         l_web_source_operation := apex_plugin_util.get_web_source_operation(
--             p_web_source       => p_web_source,
--             p_db_operation     => wwv_flow_plugin_api.c_db_operation_fetch_row,
--             p_preserve_headers => false,
--             p_perform_init     => true );
--
--         -- add some logic to add primary key values to the URL or as HTTP headers here
--         -- PK values can be obtained from "p_params.update_values_context"
--
--         wwv_flow_plugin_util.make_rest_request(
--             p_web_source_operation => l_web_source_operation,
--             p_request_body         => l_request_body,
--             p_response             => l_response,
--             p_response_parameters  => p_result.out_parameters );
--
--         l_refetch_context := wwv_flow_plugin_util.parse_refetch_response(
--             p_web_source_operation => l_web_source_operation,
--             p_web_source           => p_web_source,
--             p_response             => l_response,
--             p_values_context       => p_params.update_values_context );
--
--         if apex_exec.next_row( p_context => l_refetch_context ) then
--
--             l_checksum           := apex_exec.get_row_version_checksum( p_context => p_params.update_values_context );
--             l_refetched_checksum := apex_exec.get_row_version_checksum( p_context => l_refetch_context );
--
--             if l_checksum != l_refetched_checksum then
--                 apex_exec.set_row_status(
--                     p_context  => p_result.update_values_context,
--                     p_sqlcode  => -20987,
--                     p_sqlerrm  => 'APEX.DATA_HAS_CHANGED' );
--             end if;
--         end if;
--     end if;
--
--     -- continue with DML logic here ...
--
-- end plugin_dml;
--
-- Since: 20.2
--==============================================================================
function parse_refetch_response(
    p_web_source_operation in wwv_flow_plugin_api.t_web_source_operation,
    p_web_source           in wwv_flow_plugin_api.t_web_source,
    p_values_context       in wwv_flow_exec_api.t_context,
    --
    p_response             in clob )
    return wwv_flow_exec_api.t_context;

--
--==============================================================================
-- determine whether the current row changed between the two contexts. In order
-- to compare the next row within the value context, use APEX_EXEC.NEXT_ROW
-- for both contexts.
--
-- Parameters:
-- * p_old_row_context:      values context containing values before the change
-- * p_new_row_context:      values context containing values after the change
--
-- Returns:
-- whether there is a difference between the rows or not.
--
-- Example:
-- Within the Plug-In DML function, perform a "refetch" operation for
-- a given row to be updated and check whether the row would actually be
-- changed with the DML operation - if not, we could suppress the HTTP
-- request.
--
-- procedure plugin_dml(
--     p_plugin     in            apex_plugin.t_plugin,
--     p_web_source in            apex_plugin.t_web_source,
--     p_params     in            apex_plugin.t_web_source_dml_params,
--     p_result     in out nocopy apex_plugin.t_web_source_dml_result )
-- is
--     l_web_source_operation apex_plugin.t_web_source_operation;
--     l_request_body         clob;
--     l_response             clob;
--
--     l_refetch_context      apex_exec.t_context;
--     l_checksum             varchar2(32767);
--     l_refetched_checksum   varchar2(32767);
--
-- begin
--     p_result.update_values_context := p_params.update_values_context;
--
--     --
--     -- this code performs a "refetch" operation for a row, in order to perform
--     -- lost update detection. This happens before the actual DML.
--     --
--     if p_web_source.operations.exists( apex_plugin.c_db_operation_fetch_row ) then
--
--         l_web_source_operation := apex_plugin_util.get_web_source_operation(
--             p_web_source       => p_web_source,
--             p_db_operation     => wwv_flow_plugin_api.c_db_operation_fetch_row,
--             p_preserve_headers => false,
--             p_perform_init     => true );
--
--         -- add some logic to add primary key values to the URL or as HTTP headers here
--         -- PK values can be obtained from "p_params.update_values_context"
--
--         wwv_flow_plugin_util.make_rest_request(
--             p_web_source_operation => l_web_source_operation,
--             p_request_body         => l_request_body,
--             p_response             => l_response,
--             p_response_parameters  => p_result.out_parameters );
--
--         l_refetch_context := wwv_flow_plugin_util.parse_refetch_response(
--             p_web_source_operation => l_web_source_operation,
--             p_web_source           => p_web_source,
--             p_response             => l_response,
--             p_values_context       => p_params.update_values_context );
--
--         if apex_plugin_util.current_row_changed(
--                p_old_row_context   => l_refetch_context,
--                p_new_row_context   => p_params.update_values_context )
--         then
--             -- perform actual DML here
--             --
--         else
--             apex_exec.set_row_status(
--                 p_context  => p_result.update_values_context,
--                 p_sqlcode  => 0,
--                 p_sqlerrm  => 'SKIPPED' );
--         end if;
--     end if;
-- end plugin_dml;
--
-- Since: 20.2
--==============================================================================
function current_row_changed(
    p_old_row_context       in wwv_flow_exec_api.t_context,
    p_new_row_context       in wwv_flow_exec_api.t_context )
    return boolean;
--
--==============================================================================
-- checks whether a database operation is allowed (contained in the allowed
-- operations) and either raises an APEX error or returns an error message.
--
-- Parameters:
-- * p_allowed_operations:   allowed operations (U, UD, D)
-- * p_operation:            operation to check for
-- * p_raise_error:          whether to raise an error if the operation is not
--                           allowed (default true)
--
-- Returns:
-- NULL if the operation is allowed
-- an error message if the operation is not allowed and p_raise_error is "false"
--
-- Example:
-- Within the Plug-In code, assert (using the "allowed_operations_column") that
-- the current operation is allowed. See above examples for illustration of the
-- Plug-In DML procedure.
--
-- declare
--     l_error_message varchar2(32767);
-- begin
--     l_error_message := apex_plugin_util.db_operation_allowed(
--                            p_allowed_operations => apex_exec.get_varchar2(
--                                                        p_context     => l_refetch_context,
--                                                        p_column_name => p_params.allowed_operations_column ),
--                            p_operation          => apex_plugin.c_db_operation_update,
--                            p_raise_error        => false );
-- end;
--
-- Since: 20.2
--==============================================================================
function db_operation_allowed(
    p_allowed_operations   in varchar2,
    p_operation            in wwv_flow_plugin_api.t_db_operation,
    p_raise_error          in boolean default true )
    return varchar2;
--
--==============================================================================
-- checks whether the current data source allows to specify a NULLS clause for
-- sorting. While this is always the case for local and REST Enabled SQL, some
-- REST APIs might not support it.
-- Plug-In developers can use this function to determine whether a NULLS clause
-- is possible for this data source and show or hide these options in their UI.
--
-- we can specify a NULLS FIRST or NULLS LAST clause if one of the following conditions is true.
--
-- * we're working against the local database or a REST Enabled SQL Service
-- * the REST API does not do pagination; in this case we always get all rows back and sort locally.
-- * the REST API does not allow server-side ordering. We have to fetch all rows and order locally in that case.
-- * the REST API does pagination, supports server-side ordering *plus* a "flexible" ORDER BY NULLS clause.
--
-- Returns:
-- an instance of apex_exec.t_supports_orderby_nulls_as which indicates whether ORDER BY NULLs
-- clauses are supported, or how the REST API treats NULLs when ordering.
--
-- * wwv_flow_exec_api.c_orderby_nulls_flexible:     the data source supports ORDER BY NULLs clauses.
-- * wwv_flow_exec_api.c_orderby_nulls_are_lowest:   the data source treats NULLs as the lowest values when sorting.
-- * wwv_flow_exec_api.c_orderby_nulls_are_highest:  the data source treats NULLs as the highest values when sorting.
-- * wwv_flow_exec_api.c_orderby_nulls_always_last:  the data source always orders NULLs last.
-- * wwv_flow_exec_api.c_orderby_nulls_always_first: the data source always orders NULLs first.
--
-- Example:
--
-- declare
--     l_supports_orderby_nulls apex_exec.t_supports_orderby_nulls_as;
-- begin
--     l_supports_orderby_nulls := apex_plugin_util.get_orderby_nulls_support;
--
--     if l_supports_orderby_nulls = wwv_flow_exec_api.c_orderby_nulls_flexible then
--         ...
--     end if;
-- end;
--
-- Since: 22.2
--==============================================================================
function get_orderby_nulls_support
    return wwv_flow_exec_api.t_supports_orderby_nulls_as;

--==============================================================================
-- retrieves the database type for the currently active region
--==============================================================================
function get_current_database_type(
    p_remote_server_id in number default null )
    return wwv_flow_exec_api.t_database_type;
--
--==============================================================================
-- Parses a Swagger/OpenAPI JSON document into a t_web_source_discover_result
--
-- Example:
--
-- declare
--     l_openapi_json clob;
--     l_result wwv_flow_plugin_api.t_web_source_discover_result;
-- begin
--     l_openapi_json :=
--          '{"swagger":"2.0","info":{"title":"","version":""}'
--       || ',"host":"localhost","schemes":["https"],"paths":'
--       || '{"/":{"get":{"responses":{"200":{"description":""'
--       || ',"schema":{"type":"array","items":{"properties":'
--       || '{"empno":{"type":"number"},"ename":{"type":'
--       || '"string"}}}}}},"produces":["csv"]}}}}';
--
--     apex_plugin_util.discover_openapi(
--         p_openapi_json => l_openapi_json,
--         p_result       => l_result );
-- end;
--
-- Since: 23.1
--==============================================================================
procedure discover_openapi(
    p_openapi_json   in            clob,
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );

--==============================================================================
-- Outputs a read-only text field or textarea.
-- Use when displaying a single value.
--
-- Parameters:
-- * p_item:            The item's p_item variable.
-- * p_param:           The item's p_param variable.
-- * p_value:           (Optional) The unescaped value (API always escapes it). If not passed defaults to p_param.session_state_value.
-- * p_display_value:   (Optional) Used as the display value. If not passed, defaults to c_ignore_display_value (and won't be used)
-- * p_width:           (Optional) The width of the item. If not passed uses p_item.element_width.
-- * p_height:          (Optional) The height of the item. If not passed uses p_item.element_height. If height is > 1, API renders textarea not text field.
-- * p_css_classes:     (Optional) Additional CSS classes to be added to the text field, or textarea.
-- * p_protected:       Add checksum for the value. Defaults to true.
-- * p_escape:          Controls escaping of p_display_value (p_value is always escaped). Defaults true.
--
-- Example:
--    wwv_flow_plugin_util.print_read_only (
--        p_item          => p_item,
--        p_param         => p_param,
--        p_display_value => l_display_value,
--        p_css_classes   => 'my-readonly-custom-item' );
--
-- Since: 24.1
--==============================================================================
procedure print_read_only (
    p_item                  in wwv_flow_plugin_api.t_item,
    p_param                 in wwv_flow_plugin_api.t_item_render_param,
    p_value                 in wwv_flow_session_state_api.t_value  default wwv_flow_session_state_api.t_value(),
    p_display_value         in varchar2                            default c_ignore_display_value,
    p_width                 in pls_integer                         default null,
    p_height                in pls_integer                         default null,
    p_css_classes           in varchar2                            default null,
    p_protected             in boolean                             default true,
    p_escape                in boolean                             default true );
--==============================================================================
-- Outputs a read-only text field or textarea.
-- Use when displaying multiple values.
--
-- Parameters:
-- * p_item:            The item's p_item variable.
-- * p_param:           The item's p_param variable.
-- * p_value:           (Optional) The unescaped value (API always escapes it). If null defaults to p_param.session_state_value.
-- * p_display_values:  Array of display values.
-- * p_width:           (Optional) The width of the item. If null uses p_item.element_width.
-- * p_height:          (Optional) The height of the item. If null uses p_item.element_height. If height is > 1, API renders textarea not text field.
-- * p_css_classes:     (Optional) Additional CSS classes to be added to the text field, or textarea.
-- * p_protected:       Add checksum for the value. Defaults to true.
-- * p_escape:          Controls escaping of p_display_values (p_value is always escaped). Defaults true.
--
-- Example:
--    procedure render_custom_item (
--        p_item   in            apex_plugin.t_item,
--        p_plugin in            apex_plugin.t_plugin,
--        p_param  in            apex_plugin.t_item_render_param,
--        p_result in out nocopy apex_plugin.t_item_render_result )
--    is
--        l_search_list apex_application_global.vc_arr2;
--        l_result_list apex_application_global.vc_arr2;
--    begin
--        l_search_list(1) := '7863';
--        l_search_list(2) := '7911';
--        l_search_list(3) := '7988';
--
--        l_result_list := apex_plugin_util.get_display_data (
--                             p_sql_statement        => p_item.lov_definition,
--                             p_min_columns          => 2,
--                             p_max_columns          => 2,
--                             p_component_name       => p_item.name,
--                             p_search_col_no        => 1,
--                             p_search_value_list    => l_search_list );

--        wwv_flow_plugin_util.print_read_only (
--            p_item                  => p_item,
--            p_param                 => p_param,
--            p_display_values        => l_result_list,
--            p_css_classes           => 'my-readonly-custom-item' );
--
--    end render_custom_item;
--
-- Since: 24.1
--==============================================================================
procedure print_read_only (
    p_item              in wwv_flow_plugin_api.t_item,
    p_param             in wwv_flow_plugin_api.t_item_render_param,
    p_value             in wwv_flow_session_state_api.t_value  default wwv_flow_session_state_api.t_value(),
    p_display_values    in wwv_flow_global.vc_arr2,
    p_width             in pls_integer                         default null,
    p_height            in pls_integer                         default null,
    p_css_classes       in varchar2                            default null,
    p_protected         in boolean                             default true,
    p_escape            in boolean                             default true  );
--
--==============================================================================
-- Convert a separated input string into an array.
--
-- PARAMETERS
-- * p_value: The input value
-- * p_item: This type contains information about the current item
--
-- RETURNS
-- * An array of strings.
--
-- EXAMPLE
--   declare
--       l_arr  apex_t_varchar2 := apex_t_varchar2();
--       l_item apex_plugin.t_item;
--   begin
--       l_arr := apex_plugin_util.split_multiple_value_to_table(
--                    p_value => '["dog","cat","capybara"]',
--                    p_item  => l_item
--                );
--   end;
--   /
--   -> apex_t_varchar2('dog','cat','capybara')
--==============================================================================
function split_multiple_value_to_table (
    p_value in clob,
    p_item  in wwv_flow_plugin_api.t_item )
    return wwv_flow_t_varchar2;
--
--==============================================================================
-- PRIVATE
-- Convert a separated input string into an array.
--
-- PARAMETERS
-- * p_value: The input value
-- * p_item: This type contains information about the current item
--
-- RETURNS
-- * An array of strings.
--
-- EXAMPLE
--   declare
--       l_arr  apex_application.vc_arr2;
--       l_item apex_plugin.t_item;
--   begin
--       l_arr := apex_plugin_util.split_multiple_value_to_tab_2(
--                    p_value => '["dog","cat","capybara"]',
--                    p_item  => l_item
--                );
--       sys.dbms_output.put_line( apex_string.table_to_string( l_arr, '-' ) );
--   end;
--   /
--   -> dog-cat-capybara
--==============================================================================
function split_multiple_value_to_tab_2 (
    p_value in clob,
    p_item  in wwv_flow_plugin_api.t_item )
    return wwv_flow_global.vc_arr2;
--
--==============================================================================
-- DEPRECATED APIs.
--==============================================================================
procedure debug_page_item (
    p_plugin    in wwv_flow_plugin_api.t_plugin,
    p_page_item in wwv_flow_plugin_api.t_item );
--
procedure debug_page_item (
    p_plugin              in wwv_flow_plugin_api.t_plugin,
    p_page_item           in wwv_flow_plugin_api.t_item,
    p_value               in varchar2,
    p_is_readonly         in boolean,
    p_is_printer_friendly in boolean );
--
function page_item_names_to_jquery (
    p_page_item_names in varchar2 )
    return varchar2;
--
function cleanup_page_item_names (
    p_page_item_names in varchar2 )
    return varchar2;
--
end wwv_flow_plugin_util;
/
show errors
