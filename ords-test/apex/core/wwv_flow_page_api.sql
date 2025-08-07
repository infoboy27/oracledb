set define off verify off
prompt ...wwv_flow_page_api
create or replace package wwv_flow_page_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_page_api.sql
--
--    DESCRIPTION
--      This package is the public API for handling pages.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    02/29/2012 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global constants
--==============================================================================
c_ui_type_desktop        constant varchar2(10) := 'DESKTOP'; -- Deprecated

--==============================================================================
-- Deprecated.
-- Returns TRUE if the current page has been designed for Desktop browsers.
--==============================================================================
function is_desktop_ui return boolean;

--==============================================================================
-- Deprecated.
-- Returns the UI type for which the current page has been designed for.
--==============================================================================
function get_ui_type return varchar2;

--==============================================================================
-- Returns TRUE if the current page is rendered read only and FALSE if not.
--==============================================================================
function is_read_only return boolean;

--==============================================================================
-- Returns the page mode for the current page.
--==============================================================================
function get_page_mode (
    p_application_id        in number,
    p_page_id               in number)
    return varchar2;

--==============================================================================
-- Purge the cache of the specified application, page and optional for the
-- specified user. If the user is not specified, all cached versions of that
-- page are purged.
--
-- PARAMETERS
-- * p_application_id       application id, defaults to current application.
-- * p_page_id              page id, defaults to the current page. if you pass
--                          null, APEX purges the cache on all pages of the
--                          application.
-- * p_user_name            specify a user name if you only want to purge
--                          entries that were saved for the given user.
-- * p_current_session_only specify true if you only want to purge entries that
--                          where saved for the current session. defaults to
--                          false.
--
-- EXAMPLE
--   Purge session specific cache on the current page.
--
--   begin
--       apex_page.purge_cache (
--           p_current_session_only => true );
--   end;
--==============================================================================
procedure purge_cache (
    p_application_id       in number   default wwv_flow.g_flow_id,
    p_page_id              in number   default wwv_flow.g_flow_step_id,
    p_user_name            in varchar2 default null,
    p_current_session_only in boolean  default false );

--==============================================================================
-- Function to return an APEX f?p= URL. It is sometimes clearer to read a
-- function call than a concatenated URL. See the example below for a
-- comparison.
--
-- NOTE: For security reasons, the URL will not contain a checksum if the application
--       specified is located in a different workspace!
--
-- PARAMETERS
-- * p_application        application id or alias. defaults to the current application.
-- * p_page               page id or alias. defaults to the current page.
-- * p_session            session id. defaults to the current session id.
-- * p_request            URL request parameter.
-- * p_debug              URL debug parameter. defaults to the current debug mode.
-- * p_clear_cache        URL clear cache parameter.
-- * p_items              comma delimited list of item names to set session state.
-- * p_values             comma separated list of item values to set session state.
-- * p_printer_friendly   URL printer friendly parameter. defaults tot he current request's printer friendly mode.
-- * p_trace              SQL trace parameter.
-- * p_triggering_element A jQuery selector (for example, #my_button , where my_button is the static ID for a button element),
--                        to identify which element to use to trigger the dialog. This is required for Modal Dialog support.
-- * p_plain_url          If the page you are calling APEX_PAGE.GET_URL from is a modal dialog, specify p_plain_url to omit the
--                        unnecessary JavaScript code in the generated link. By default, if this function is called from a modal dialog,
--                        JavaScript code to close the modal dialog is included in the generated URL.
-- * p_absolute_url       If true, always generates an absolute URL. Defaults to false, which auto-determines if an absolute URL is needed.
--
-- EXAMPLE
--   This query uses apex_page.get_url and it's alternative
--   apex_util.prepare_url to produce 2 identical URLs.
--
--   select apex_page.get_url (
--              p_page   => 1,
--              p_items  => 'P1_X,P1_Y',
--              p_values => 'somevalue,othervalue' ) f_url_1,
--          apex_util.prepare_url('f?p=&APP_ID.:1:&APP_SESSION.::::P1_X,P1_Y:somevalue,othervalue') f_url_2
--     from dual
--==============================================================================
function get_url (
    p_application        in varchar2 default null,
    p_page               in varchar2 default null,
    p_session            in number   default wwv_flow.g_instance,
    p_request            in varchar2 default null,
    p_debug              in varchar2 default null,
    p_clear_cache        in varchar2 default null,
    p_items              in varchar2 default null,
    p_values             in varchar2 default null,
    p_printer_friendly   in varchar2 default null,
    p_trace              in varchar2 default null,
    p_x01                in varchar2 default null,
    p_hash               in varchar2 default null,
    p_triggering_element in varchar2 default 'this',
    p_plain_url          in boolean  default false,
    p_absolute_url       in boolean  default false )
    return varchar2;

end wwv_flow_page_api;
/
show errors

set define '^'
