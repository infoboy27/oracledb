set define off verify off
prompt ...wwv_flow_cdn
create or replace package wwv_flow_cdn as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_cdn.sql
--
--    DESCRIPTION
--      This package is responsible for gettings files from a
--      content delivery networks in the runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    04/05/2012 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================
subtype t_library is varchar2(18);
subtype t_version is varchar2(15);

-- adding a new library
--  - add the c_library_ and c_version_ constants
--  - extend function get_version
--  - extend function get_url
--  - extend function get_base_url
--      ensure the file is loaded correctly both in debug mode On and Off
--      ensure the file is loaded correctly in locked and unlocked instances
--      ensure any css file counterpart is loaded correctly
--  - if the library version is to be included in the client-side apex.libVersions
--    extend function get_libversions_object

c_library_cropperjs          constant t_library := 'cropperjs';
c_library_dompurify          constant t_library := 'dompurify';
c_library_fullcalendar       constant t_library := 'fullcalendar';
c_library_hammer             constant t_library := 'hammer';
c_library_jointplus          constant t_library := 'jointplus';
c_library_jquery             constant t_library := 'jquery';
c_library_jquery_migrate     constant t_library := 'jquery-migrate';
c_library_jquery_ui          constant t_library := 'jquery-ui';
c_library_lessjs             constant t_library := 'lessjs';
c_library_maplibre           constant t_library := 'maplibre';
c_library_mapbox_gl_rtl_text constant t_library := 'mapbox-gl-rtl-text';
c_library_markedjs           constant t_library := 'markedjs';
c_library_monaco_editor      constant t_library := 'monaco';
c_library_oraclejet          constant t_library := 'oraclejet';
c_library_ortl               constant t_library := 'ortl';
c_library_prismjs            constant t_library := 'prismjs';
c_library_terser             constant t_library := 'terser';
c_library_turndown           constant t_library := 'turndown';

c_library_font_apex          constant t_library := 'font-apex';

c_file_type_js               constant varchar2(3)  := 'js';
c_file_type_css              constant varchar2(3)  := 'css';

--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- Returns the specified version of the library or if not provided the one shipped
-- with APEX.
-- p_library:   Use one of the c_library_* constants
-- p_version:   If no value is provided the version required by APEX will be used
--
-- Example:
--
--   get_version (
--     p_library => wwv_flow_cdn.c_library_monaco_editor )
--
--==============================================================================
function get_version (
    p_library in varchar2,
    p_version in varchar2 default null )
    return varchar2;

--==============================================================================
-- Returns the URL for a 3rd party library which is stored on a CDN.
-- If the application hasn't specified to use a CDN, the files which ship
-- with APEX will be returned.
-- p_library:   Use one of the c_library_* constants
-- p_file_name: If no value is provided the main js/css file will be returned
-- p_file_type: Use one of the c_file_type_* constants
-- p_directory: Directory where the file p_file_name is located
-- p_version:   If no value is provided the version required by APEX will be used
--
-- Examples:
--
--   get_url (
--     p_library   => wwv_flow_cdn.c_library_jquery,
--     p_file_type => wwv_flow_cdn.c_file_type_js )
--
--   get_url (
--     p_library   => wwv_flow_cdn.c_library_jquery_ui,
--     p_file_name => 'jquery.ui.draggable',
--     p_file_type => wwv_flow_cdn.c_file_type_js )
--
--   get_url (
--     p_library   => wwv_flow_cdn.c_library_jquery_ui,
--     p_file_name => 'jquery.ui.datepicker-' || wwv_flow.g_browser_language,
--     p_file_type => wwv_flow_cdn.c_file_type_js,
--     p_directory => 'i18n/oracle/' )
--
--==============================================================================
function get_url (
    p_library   in varchar2,
    p_file_name in varchar2 default null,
    p_file_type in varchar2,
    p_directory in varchar2 default null,
    p_version   in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Returns the base URL for a 3rd party library which is stored on a CDN.
-- If the application hasn't specified to use a CDN, the files which ship
-- with APEX will be returned.
-- p_library:   Use one of the c_library_* constants
-- p_version:   If no value is provided the version required by APEX will be used
--
-- Examples:
--
--   get_base_url (
--     p_library => wwv_flow_cdn.c_library_jquery )
--
--==============================================================================
function get_base_url (
    p_library in varchar2,
    p_version in varchar2 default null )
    return varchar2;
--
--==============================================================================
-- Returns a space separated list of supported content delivery networks
--==============================================================================
function get_all
    return varchar2;
--
--==============================================================================
-- Returns a stringified JSON object of all front-end-relevant library versions
--==============================================================================
function get_libversions_object
    return varchar2;

end wwv_flow_cdn;
/
show errors

set define '^'
