set define off
set verify off

prompt ...wwv_flow_css_api
create or replace package wwv_flow_css_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2022, Oracle and/or its affiliates.
--
-- The APEX_CSS package provides utility functions for adding CSS styles to HTTP
-- output. This package is usually used for plug-in development.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constants:
--------------------------------------------------------------------------------
-- Internal:
c_library_jquery        constant varchar2(20) := 'jquery';

-- Internal:
c_library_jquery_ui     constant varchar2(20) := 'jquery-ui';
--------------------------------------------------------------------------------

--==============================================================================
-- This procedure adds the link tag to load a CSS library. If a library has
-- already been added, it will not be added a second time.
--
-- Parameters:
-- * p_name:           Name of the CSS file.
-- * p_directory:      Begin of the URL where the CSS file should be read from.
--                     If you use this function for a plug-in you should set this
--                     parameter to `p_plugin.file_prefix`.
-- * p_version:        Identifier of the version of the CSS file. The version will
--                     be  added to the CSS filename. In most cases you should
--                     use the default of NULL as the value.
-- * p_skip_extension: The function automatically adds `.css` to the CSS filename.
--                     If set to `TRUE`, the function ignores this addition.
-- * p_media_query:    Value set as media query.
-- * p_ie_condition:   (Desupported) Condition used as Internet Explorer condition.
-- * p_attributes:     Extra attributes to add to the link tag.
--                     NOTE: Callers are responsible for escaping this parameter.
--
-- Example:
--
-- Adds the CSS file `jquery.autocomplete.css` in the directory specified by
-- `p_plugin.file_prefix` to the HTML output of the page and makes sure that
-- it will only be included once if `APEX_CSS.ADD_FILE` is called multiple times
-- with that name.
--
--     begin
--         apex_css.add_file (
--             p_name      => 'jquery.autocomplete',
--             p_directory => p_plugin.file_prefix );
--     end;
--==============================================================================
procedure add_file (
    p_name           in varchar2,
    p_directory      in varchar2 default wwv_flow.g_image_prefix || 'css/',
    p_version        in varchar2 default null,
    p_skip_extension in boolean  default false,
    p_media_query    in varchar2 default null,
    -- p_ie_condition is desupported and has no effect
    p_ie_condition   in varchar2 default null,
    p_attributes     in varchar2 default null,
    p_key            in varchar2 default null );
--
--==============================================================================
-- This procedure adds the link tag to load a 3rd party CSS file and also
-- takes into account the specified Content Delivery Network (CDN) for the application.
-- 
-- Supported libraries include:
-- - jQuery
-- - jQueryUI
--
-- If a library has already been added, it is not added a second time.
--
-- Parameters:
-- * p_library:     Use one of the `c_library_*` constants
-- * p_file_name:   Specifies the file name without version, `.min` and `.css`
--                  If no file name is provided, the default library file will be loaded.
-- * p_directory:   (Optional) Directory where the file P_FILE_NAME is located.
-- * p_version:     (Optional) If no value is provided, then uses the same version shipped with APEX.
-- * p_media_query: (Optional) Value that is set as media query.
-- * p_attributes:  Extra attributes to add to the link tag.
--                  Note: Callers are responsible for escaping this parameter.
--
-- Example:
--
-- The following example loads the CSS file of the Accordion
-- component of the jQuery UI.
--
--     begin
--         apex_css.add_3rd_party_library_file (
--             p_library   => apex_css.c_library_jquery_ui,
--             p_file_name => 'jquery.ui.accordion' );
--     end;
-- 
-- Deprecated: 
--==============================================================================
procedure add_3rd_party_library_file (
    p_library     in varchar2,
    p_file_name   in varchar2 default null,
    p_directory   in varchar2 default null,
    p_version     in varchar2 default null,
    p_media_query in varchar2 default null,
    p_attributes  in varchar2 default null );
--
--==============================================================================
-- This procedure adds a CSS style snippet that is included inline in the HTML output.
-- Use this procedure to add new CSS style declarations.
--
-- Parameters:
-- * p_css: The CSS style snippet. For example, `#test {color:#fff}`
-- * p_key: Identifier for the style snippet. If specified and a style snippet
--          with the same name has already been added the new style snippet will
--          be ignored.
--
-- Example:
--
-- Adds an inline CSS definition for the class autocomplete into the HTML page.
-- The key `autocomplete_widget` prevents the definition from being included another
-- time if the `apex_css.add` is called another time.
--
--     begin
--         apex_css.add (
--             p_css => '.autocomplete { color:#ffffff }',
--             p_key => 'autocomplete_widget' );
--     end;
--==============================================================================
procedure add (
    p_css in varchar2,
    p_key in varchar2 default null );
--
--==============================================================================
-- Internal:
--
-- Deprecated:
--
-- See Also:
-- Use WWV_FLOW_API.CREATE_APP_STATIC_FILE and WWV_FLOW_API.CREATE_WORKSPACE_STATIC_FILE instead.
--==============================================================================
function new_css_repository_record (
    p_name           in out varchar2,
    p_varchar2_table     in sys.dbms_sql.varchar2_table,
    p_mimetype           in varchar2,
    p_flow_id            in number,
    p_notes              in varchar2 )
    return number
    ;
--
--==============================================================================
-- Internal:
--
-- Deprecated:
--==============================================================================
procedure remove_css (
    p_css_name in varchar2,
    p_flow_id  in number   default null );
--
end wwv_flow_css_api;
/
show errors

set define '^'
