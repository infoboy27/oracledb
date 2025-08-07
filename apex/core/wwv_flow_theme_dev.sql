set define off
set verify off

prompt ...wwv_flow_theme_dev

create or replace package wwv_flow_theme_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_theme_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling themes and templates
--      in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/07/2012 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================
c_temp_opt_hide_region_header   constant varchar2(16)   := 'HIDEREGIONHEADER';

--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Returns the id of the default page template of the specified theme.
--==============================================================================
function get_page_template_id (
    p_application_id in number,
    p_theme_id       in number )
    return number;

--==============================================================================
-- Returns the id of the default region template of the specified theme.
--==============================================================================
function get_region_template_id (
    p_application_id in number,
    p_theme_id       in number )
    return number;

--==============================================================================
-- Returns the id of the default region template of the specified theme.
--==============================================================================
function get_region_template_id (
    p_application_id in number,
    p_theme_id       in number,
    p_page_type      in varchar2 )
    return number;

--==============================================================================
-- Returns the id of the default report template of the specified theme.
--==============================================================================
function get_report_template_id (
    p_application_id in number,
    p_theme_id       in number,
    p_report_type    in varchar2  default null	)
    return number;

--
--==============================================================================
-- Dispatcher for all AJAX calls related to theme roller.
--==============================================================================
procedure theme_roller_ajax;
--

--==============================================================================
-- Returns the theme_internal_name of the theme used by the application
--==============================================================================
function get_theme_internal_name (
    p_application_id    in number )
    return varchar2;

--==============================================================================
-- Returns the version_identifier of the theme used by the application
--==============================================================================
function get_version_identifier (
    p_application_id    in number )
    return varchar2;

--==============================================================================
-- Returns TRUE if the current application theme is based on the Universal Theme
--==============================================================================
function is_universal_theme (
    p_application_id    in number default null,
    p_theme_id          in number default null )
    return boolean;

--==============================================================================
-- Returns Y if the current application theme is based on the Universal Theme, else N
--==============================================================================
function is_universal_theme_yn (
    p_application_id    in number default null,
    p_theme_id          in number default null )
    return varchar2;
--

--==============================================================================
-- Returns TRUE if the current application theme is based on the Redwood Theme
--==============================================================================
function is_redwood_theme (
    p_application_id    in number default null,
    p_theme_id          in number default null )
    return boolean;

--==============================================================================
-- Returns Y if the current application theme is based on the Redwood Theme, else N
--==============================================================================
function is_redwood_theme_yn (
    p_application_id    in number default null,
    p_theme_id          in number default null )
    return varchar2;
--

--==============================================================================
-- Returns TRUE if the current application theme is using fontAPEX icon library
--==============================================================================
function is_font_apex (
    p_application_id    in number default null,
    p_theme_id          in number default null )
    return boolean;

--==============================================================================
-- Returns Y if the current application theme  is using fontAPEX icon library
--==============================================================================
function is_font_apex_yn (
    p_application_id    in number default null,
    p_theme_id          in number default null )
    return varchar2;


--==============================================================================
-- Returns a CSS class reference for a given template option, by UT version
-- Call when you need to reference a template option, where the CSS class names
-- have changed between releases.
--
-- Currently supports: HIDEREGIONHEADER
--==============================================================================
function get_template_option_by_version (
    p_application_id        in number,
    p_template_id           in number,
    p_template_option_name  in varchar2,
    p_pre_sep               in varchar2 default ':' )
    return varchar2;

end wwv_flow_theme_dev;
/
show errors

set define '^'
