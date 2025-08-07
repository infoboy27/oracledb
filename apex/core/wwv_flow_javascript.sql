set define off verify off
prompt ...wwv_flow_javascript
create or replace package wwv_flow_javascript as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_javascript.sql
--
--    DESCRIPTION
--      This package contains utility functions for creating or interacting with javascript.
--
--    MODIFIED   (MM/DD/YYYY)
--    cbackstr    05/30/2008 - Created
--
--------------------------------------------------------------------------------
--
--
c_type_link             constant varchar2( 10 ) := 'LINK';
c_type_requirejs_link   constant varchar2( 14 ) := 'REQUIREJS_LINK';
c_type_requirejs_define constant varchar2( 16 ) := 'REQUIREJS_DEFINE';
c_type_jet_link         constant varchar2( 8  ) := 'JET_LINK';
c_type_inline           constant varchar2( 10 ) := 'INLINE';
c_type_onload           constant varchar2( 10 ) := 'ONLOAD';
c_type_dev_toolbar      constant varchar2( 11 ) := 'DEV_TOOLBAR';
c_type_onload_deferred  constant varchar2( 15 ) := 'ONLOAD_DEFERRED';

--
--
--==============================================================================
-- For a description see wwv_flow_javascript_api.add_library
--==============================================================================
procedure add_library (
    p_name                    in varchar2,
    p_directory               in varchar2,
    p_version                 in varchar2 default null,
    p_check_to_add_minified   in boolean  default false,
    p_skip_extension          in boolean  default false,
    p_requirejs_module        in varchar2 default null,
    p_requirejs_js_expression in varchar2 default null,
    p_requirejs_required      in boolean  default false,
    p_jet_required            in boolean  default false,
    p_is_module               in boolean  default false,
    p_is_async                in boolean  default false,
    p_is_defer                in boolean  default false,
    p_attributes              in varchar2 default null,
    p_key                     in varchar2 default null );
--
--==============================================================================
-- For a description see wwv_flow_javascript_api.add_3rd_party_library_file
--==============================================================================
procedure add_3rd_party_library_file (
    p_library            in varchar2,
    p_file_name          in varchar2 default null,
    p_directory          in varchar2 default null,
    p_version            in varchar2 default null,
    p_requirejs_required in boolean  default false,
    p_jet_required       in boolean  default false,
    p_attributes         in varchar2 default null );
--
--==============================================================================
-- Adds the script tag to load an APEX javascript library from the /i/libraries/apex/
-- directory. If a library has already been added, it will not be added a second time.
-- Note: You must ensure the library being added also has a minified version, because
-- this procedure internally calls add_library with p_check_to_add_minified set to true.
--
-- Parameter:
--   p_name: has to be specified without version, .min and .js
--==============================================================================
procedure add_apex_library (
    p_name               in varchar2,
    p_requirejs_required in boolean default false,
    p_jet_required       in boolean default false );
--
--==============================================================================
-- Adds the script tag to load an APEX javascript library from the /i/apex_ui/js/
-- directory. If a library has already been added, it will not be added a second time.
-- Note: You must ensure the library being added also has a minified version, because
-- this procedure internally calls add_library with p_check_to_add_minified set to true.
--
-- Parameter:
--   p_name: has to be specified without version, .min and .js
--==============================================================================
procedure add_apex_ui_library (
    p_name               in varchar2,
    p_requirejs_required in boolean default false,
    p_jet_required       in boolean default false );
--
--==============================================================================
-- Adds the script tag to load a list of URLs specified in p_urls.
-- The URLs specified in p_urls can contain the placeholder #MIN# which will
-- get replaced by .min or an empty string depending if the page is viewed
-- in debug mode or not.
--
-- Parameter:
--   p_urls:             list of urls delimited by a new line
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--==============================================================================
procedure add_library_urls (
    p_urls             in varchar2,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- For a description see wwv_flow_javascript_api.add_requirejs.
--==============================================================================
procedure add_requirejs;
--
--==============================================================================
-- For a description see wwv_flow_javascript_api.add_requirejs_define
--==============================================================================
procedure add_requirejs_define (
    p_module        in varchar2,
    p_js_expression in varchar2 );
--
--==============================================================================
-- For a description see wwv_flow_javascript_api.add_jet.
--==============================================================================
procedure add_jet;
--
--==============================================================================
-- Adds a javascript code snippets to the HTML output which is executed at the
-- onload event.
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_code: javascript code snippet. eg: $s('P1_TEST', 'abc');
--   p_key:  name of the key. eg: APEX_WIDGET
--==============================================================================
procedure add_onload_code (
    p_code in varchar2,
    p_key  in varchar2 default null );
--
--==============================================================================
-- Adds a javascript code snippets to the HTML output which is executed at the
-- beginning of the deferred code. This was needed when we moved onload_code
-- up to before the deferred logic in 21.1, as a place to execute things that
-- needed to wait (eg Dyanmic Actions).
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_code: javascript code snippet. eg: $s('P1_TEST', 'abc');
--   p_key:  name of the key. eg: APEX_WIDGET
--==============================================================================
procedure add_onload_deferred_code (
    p_code in varchar2,
    p_key  in varchar2 default null );
--
--==============================================================================
-- Adds a javascript code snippets to the HTML output which is executed as the
-- first JavaScript code in the onload event.
--==============================================================================
procedure add_dev_toolbar_code (
    p_code in varchar2 );
--
--==============================================================================
-- Adds a code snippet which is included inline into the HTML output
-- eg. You can use this procedure to add new functions or global
--     variable declarations.
-- Note: if you want to execute code, you should use add_onload_code
--
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_code: javascript code snippet. eg: $s('P1_TEST', 123);
--   p_key:  identifier for the code snippet. If specified and a code snippet with
--           the same name has already been added the new code snippet will be ignored.
--==============================================================================
procedure add_inline_code (
    p_code in varchar2,
    p_key  in varchar2 default null );
--
--==============================================================================
-- Emits code which has been added to the internal buffer.
--==============================================================================
procedure emit_code (
    p_type in varchar2 );
--
--==============================================================================
-- Emits all links and RequireJS define statements which have been added to the
-- internal buffer.
--==============================================================================
procedure emit_links;
--
--==============================================================================
-- Escapes a text so that it can be used in JavaScript without problems.
-- Replaces \ with \\, / with \/, " with \u0022, ' with \u0027, tab with \t,
-- chr(10) with \n, < with \u003c, > with \u003e.
--==============================================================================
function escape (
    p_text in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns a safe <script>...</script> markup for emitting a json object.
--==============================================================================
function get_script_markup (
    p_id   in varchar2,
    p_json in sys.json_object_t )
    return clob;
--
--==============================================================================
-- Returns the escaped text surrounded by double quotes. eg: "That\'s a test"
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in varchar2,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns the number, if p_value is NULL the value null is returned.
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in number,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns a JavaScript boolean (true, false, null)
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in boolean,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns the date as a javascript object, if p_value is NULL the value null is returned.
-- If p_add_comma is TRUE a trailing comma is added.
--==============================================================================
function add_value (
    p_value     in date,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns the attribute and its escaped text surrounded by double quotes.
-- eg: test:"That\'s a test"
-- If p_omit_null is TRUE and p_value is NULL the function returns nothing.
-- If p_add_comma is TRUE a trailing comma is added when a value is returned.
--==============================================================================
function add_attribute (
    p_name      in varchar2,
    p_value     in varchar2,
    p_omit_null in boolean := true,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns the attribute and its number, if p_value is NULL the value null is
-- returned. eg. test:123 or test:null
-- If p_omit_null is TRUE and p_value is NULL the function returns nothing.
-- If p_add_comma is TRUE a trailing comma is added when a value is returned.
--==============================================================================
function add_attribute (
    p_name      in varchar2,
    p_value     in number,
    p_omit_null in boolean := true,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns the attribute and a JavaScript boolean (true, false, null)
-- If p_omit_null is TRUE and p_value is NULL the function returns nothing.
-- If p_add_comma is TRUE a trailing comma is added when a value is returned.
--==============================================================================
function add_attribute (
    p_name      in varchar2,
    p_value     in boolean,
    p_omit_null in boolean := true,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns the attribute and its date, if p_value is NULL the value null is
-- returned. eg. test:new Date(2009,0,1) or test:null
-- If p_omit_null is TRUE and p_value is NULL the function returns nothing.
-- If p_add_comma is TRUE a trailing comma is added when a value is returned.
--==============================================================================
function add_attribute (
    p_name      in varchar2,
    p_value     in date,
    p_omit_null in boolean := true,
    p_add_comma in boolean := true )
    return varchar2;
--
--==============================================================================
-- Returns a properly escaped CSS selector and JavaScript literal.
--   '#<p_dom_id>'
--==============================================================================
function add_triggering_element (
    p_dom_id in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns
--   apex.jQuery('#<p_dom_id>', apex.gPageContext$)
-- where p_dom_id is properly CSS selector and JavaScript literal escaped.
--==============================================================================
function add_jquery (
    p_dom_id in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns
--   apex.jQuery('<p_selector', apex.gPageContext$)
-- where p_selector is properly JavaScript literal escaped.
--==============================================================================
function add_jquery (
    p_selector in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns true or false, depending on whether any entries exist for all, or a
-- defined type.
-- If p_type is null, all types are checked (INLINE and ONLOAD)
-- If p_type is not null, only types of type p_type are checked.
--==============================================================================
function has_code_buffered (
    p_type      in varchar2 default null )
    return boolean;
--
--==============================================================================
-- Returns a script tag with all the standard JavaScript files required by APEX.
--==============================================================================
function standard_javascript
    return varchar2;
--
--==============================================================================
-- Adds a javascript code snippets into an internal buffer which is emitted by
-- the call to emit_code later in the page rendering.
-- If an entry with this same type and key exits it will be ignored.
-- If p_key is null the snippet will always be added to the buffer.
--
-- Parameter:
--   p_code: javascript code snippet. eg: $s('P1_TEST', 'abc');
--   p_key:  name of the key. eg: APEX_WIDGET
--   p_type: name of the code type. eg: ONLOAD, INLINE, LINK
--==============================================================================
procedure add_code (
    p_code             in varchar2,
    p_type             in varchar2,
    p_key              in varchar2 default null,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- Adds a javascript code snippets into an internal buffer which is emitted by
-- the call to emit_code later in the page rendering.
-- If an entry with this same type and key exits it will be ignored.
-- If p_key is null the snippet will always be added to the buffer.
--
-- Parameter:
--   p_code: javascript code snippet. eg: $s('P1_TEST', 'abc');
--   p_key:  name of the key. eg: APEX_WIDGET
--   p_type: name of the code type. eg: ONLOAD, INLINE
--==============================================================================
procedure add_code (
    p_code_lines       in wwv_flow_global.vc_arr2,
    p_type             in varchar2,
    p_key              in varchar2 default null,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- Saves the buffered JavaScript code in the page/region cache table wwv_flow_page_code_cache.
-- If p_region_id is specified, only the JavaScript code for that region is saved.
--==============================================================================
procedure save_in_cache (
    p_page_cache_id in number,
    p_region_id     in number default null );
--
--==============================================================================
-- Clears the buffered JavaScript code.
--==============================================================================
procedure reset;
--
--==============================================================================
-- Based on a block of file urls, return them as an array.
-- Ignores
--      - block comments ( wrapped by /* */ )
--      - line comments ( starting with -- )
--      - empty lines
-- Performs raw substitutions.
-- Can be used for both JavaScript and CSS File URLs.
--==============================================================================
function normalize_file_urls (
    p_urls in varchar2 )
    return wwv_flow_t_varchar2;
--
--==============================================================================
-- Get the <script> element with the CSP nounce attribute
-- e.g. <script nonce="random12345">
--==============================================================================
function get_csp_script_element
    return varchar2;
--
end wwv_flow_javascript;
/
show errors

set define '^'
