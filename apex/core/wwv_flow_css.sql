set define off
set verify off

prompt ...wwv_flow_css
create or replace package wwv_flow_css as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_css.sql
--
--    DESCRIPTION
--      This package contains utility functions for adding CSS styles to the HTTP output.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      01/04/2010 - Created
--
--------------------------------------------------------------------------------
--
--
--==============================================================================
-- For a description see wwv_flow_css_api.add_file
--==============================================================================
procedure add_file (
    p_name             in varchar2,
    p_directory        in varchar2 default wwv_flow.g_image_prefix||'css/',
    p_version          in varchar2 default null,
    p_skip_extension   in boolean  default false,
    p_media_query      in varchar2 default null,
    p_emit_immediately in boolean  default false,
    p_attributes       in varchar2 default null,
    p_key              in varchar2 default null );
--
--==============================================================================
-- For a description see wwv_flow_css_api.add_3rd_party_library_file
--==============================================================================
procedure add_3rd_party_library_file (
    p_library          in varchar2,
    p_file_name        in varchar2 default null,
    p_directory        in varchar2 default null,
    p_version          in varchar2 default null,
    p_media_query      in varchar2 default null,
    p_emit_immediately in boolean  default false,
    p_attributes       in varchar2 default null );
--
--==============================================================================
-- Adds the link tag to load a list of URLs specified in p_urls.
-- The URLs specified in p_urls can contain the placeholder #MIN# which will
-- get replaced by .min or an empty string depending if the page is viewed
-- in debug mode or not.
--
-- Parameter:
--   p_urls:             list of urls delimited by a new line
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--==============================================================================
procedure add_file_urls (
    p_urls             in varchar2,
    p_emit_immediately in boolean default false );
--
--==============================================================================
-- Adds a CSS style snippet which is included inline into the HTML output
-- eg. You can use this procedure to add new css style declarations.
--
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_style:            CSS style snippet. eg: #test { color:#fff }
--   p_key:              identifier for the style snippet. If specified and a style snippet with
--                       the same name has already been added the new style snippet will be ignored. (optional)
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--==============================================================================
procedure add (
    p_css              in varchar2,
    p_key              in varchar2 default null,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- Adds a CSS style snippet into an internal buffer which is emitted by
-- the call to emit later in the page rendering.
--
-- If an entry with the same key exits it will be ignored.
-- If p_key is null the snippet will always be added.
--
-- Parameter:
--   p_style:            CSS style snippet. eg: .test { color:#fff }
--   p_key:              identifier for the style snippet. If specified and a style snippet with
--                       the same name has already been added the new style snippet will be ignored.
--   p_type:             name of the style type. eg: INLINE, LINK
--   p_emit_immediately: TRUE if the URLs should immidiately be written to the HTTP buffer (optional)
--==============================================================================
procedure add (
    p_css              in varchar2,
    p_type             in varchar2,
    p_key              in varchar2 default null,
    p_emit_immediately in boolean  default false );
--
--==============================================================================
-- Emits CSS style snippets which have been added to the internal buffer.
--==============================================================================
procedure emit;
--
--==============================================================================
-- Returns the standard CSS files of APEX. If wwv_flow.g_include_apex_css_js_yn
-- is set to no, nothing is returned
--==============================================================================
function get_standard_files return varchar2;
--
--==============================================================================
-- Saves the buffered CSS code in the page/region cache table wwv_flow_page_code_cache.
-- If p_region_id is specified, only the CSS code for that region is saved.
--==============================================================================
procedure save_in_cache (
    p_page_cache_id in number,
    p_region_id     in number default null );
--
--==============================================================================
-- Clears the buffered CSS code.
--==============================================================================
procedure reset;
--
--==============================================================================
-- Get the <style> element with the CSP nonce and other attributes (like id)
-- e.g. <style id="R190954325" nonce="random12345">
-- 
-- Arguments:
    --   (optional) p_attributes = any text string
--==============================================================================
function get_open_csp_style_element (
    p_attributes in varchar2 default null
)
    return varchar2;
--
--
end wwv_flow_css;
/
show errors

set define '^'
