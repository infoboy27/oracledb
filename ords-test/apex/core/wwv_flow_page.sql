set define off verify off
prompt ...wwv_flow_page
create or replace package wwv_flow_page as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_page.sql
--
--    DESCRIPTION
--      This package is responsible for handling pages the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    02/29/2012 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
subtype t_page_mode        is wwv_flow_steps.page_mode%type;

subtype t_protection_level is wwv_flow_steps.protection_level%type;
c_protection_unrestricted  constant t_protection_level := 'N';
c_protection_checksum      constant t_protection_level := 'C';
c_protection_no_arguments  constant t_protection_level := 'U';
c_protection_no_url_access constant t_protection_level := 'D';

subtype t_escape_mode is pls_integer range 1..2;
c_escape_mode_url            constant t_escape_mode := 1;
c_escape_mode_html_attribute constant t_escape_mode := 2;

subtype t_dft_error_page_type is varchar2(12);
c_error_page_type_error        constant t_dft_error_page_type := 'ERROR';
c_error_page_type_apex_upgrade constant t_dft_error_page_type := 'APEX_UPGRADE';


type t_page_info is record (
    id                       wwv_flow_steps.id%type,
    flow_id                  wwv_flow_steps.flow_id%type,
    security_group_id        wwv_flow_steps.security_group_id%type,
    alias                    wwv_flow_steps.alias%type,
    page_is_public_y_n       wwv_flow_steps.page_is_public_y_n%type,
    protection_level         t_protection_level,
    deep_linking             wwv_flow_steps.deep_linking%type,
    rejoin_existing_sessions wwv_flow_steps.rejoin_existing_sessions%type,
    page_mode                t_page_mode,
    theme_id                 wwv_flows.theme_id%type,
    step_title               wwv_flow_steps.step_title%type,
    page_components_scn      wwv_flow_steps.page_components_scn%type,
    -- dialog columns, used in prepare_url
    dialog_js_init_code      wwv_flow_templates.dialog_js_init_code%type,
    dialog_js_close_code     wwv_flow_templates.dialog_js_close_code%type,
    dialog_js_cancel_code    wwv_flow_templates.dialog_js_cancel_code%type,
    dialog_browser_frame     wwv_flow_templates.dialog_browser_frame%type,
    dialog_title             wwv_flow_steps.dialog_title%type,
    dialog_height            wwv_flow_steps.dialog_height%type,
    dialog_width             wwv_flow_steps.dialog_width%type,
    dialog_max_width         wwv_flow_steps.dialog_max_width%type,
    dialog_is_modal          varchar2(5),
    dialog_css_classes       wwv_flow_steps.dialog_css_classes%type,
    dialog_attributes        wwv_flow_steps.dialog_attributes%type,
    page_template_options    wwv_flow_steps.page_template_options%type,
    dialog_chained           wwv_flow_steps.dialog_chained%type,
    dialog_checksum          varchar2(128),
    dialog_tmpl_static_id    wwv_flow_templates.internal_name%type );

type t_env_banner is record (
    label    wwv_flow_companies.env_banner_label%type,
    color    wwv_flow_companies.env_banner_color%type,
    position wwv_flow_companies.env_banner_pos%type );

--==============================================================================
-- Global constants
--==============================================================================
c_page_mode_normal   constant t_page_mode := 'NORMAL';
c_page_mode_modal    constant t_page_mode := 'MODAL';
c_page_mode_nonmodal constant t_page_mode := 'NON_MODAL';

--==============================================================================
-- Global variables
--==============================================================================
g_standard_rds_id   number;

--==============================================================================
-- Returns the theme id which is used by the specified page.
--==============================================================================
function get_theme_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_page_id           in number default wwv_flow.g_flow_step_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;

--==============================================================================
-- Returns the dialog JavaScript close code of the page template which is used
-- by the current page. If the page itself doesn't have an assigned dialog close
-- code defined, the theme default will be used.
--==============================================================================
function get_dialog_close_code (
    p_target in varchar2 )
    return varchar2;

--==============================================================================
-- Emits the dialog JavaScript close code of the page template which should be used by the current page.
-- If the page itself doesn't have an assigned dialog close code defined, the theme default
-- will be used.
--==============================================================================
procedure emit_dialog_close_html (
    p_target in varchar2 );

--==============================================================================
-- Returns the dialog JavaScript cancel code of the page template which is used
-- by the current page. If the page itself doesn't have an assigned dialog cancel
-- code defined, the theme default will be used.
--==============================================================================
function get_dialog_cancel_code return varchar2;

--==============================================================================
-- Purge the cache of the specified application, page and optional for
-- the specified user. If the user isn't specified, all cached versions of
-- that page are purged.
--==============================================================================
procedure purge_cache (
    p_application_id in number,
    p_page_id        in number,
    p_user_name      in varchar2 default null,
    p_current_session_only in boolean default false );

--==============================================================================
-- Returns the id of the specified page alias. If the parameter p_page_id_or_alias
-- is a numeric value. The function also checks if the specified page exists.
--==============================================================================
function get_page_id (
    p_application_id   in number default wwv_flow_security.g_flow_id,
    p_page_id_or_alias in varchar2 )
    return number;

--==============================================================================
-- Returns the global active tab id for the Region Display Selector on the page
--==============================================================================
function get_rds_active_tab_id return varchar2;

--==============================================================================
-- Sets the global active tab id for the Region Display Selector on the page
--==============================================================================
procedure set_rds_active_tab_id ( p_tab_value in varchar2 );

--==============================================================================
-- Returns TRUE if the current page should be rendered read only and FALSE if not.
--==============================================================================
function is_read_only return boolean;

--==============================================================================
-- Given a page_id and the application id, return page info:
-- * page mode - NORMAL, MODAL or NON_MODAL
-- * rejoin_existing_sessions
--==============================================================================
function get_page_info (
    p_application_id    in number,
    p_page_id           in number,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id,
    p_use_translation   in boolean default true )
    return t_page_info;

--==============================================================================
-- Set the browser frame for Dialog Page
--==============================================================================
procedure set_dialog_browser_frame;

--==============================================================================
-- Returns environment banner configured at workspace level first then instance level.
--==============================================================================
function get_env_banner return t_env_banner;

--==============================================================================
-- Render the current page
--==============================================================================
procedure render;


--==============================================================================
-- Internal:
-- Returns default error page template
--==============================================================================
function get_dflt_error_page_template(
    p_title in varchar2 default null,
    p_type  in t_dft_error_page_type default c_error_page_type_error )
    return varchar2;


--==============================================================================
-- Renders the error page with the specified values in p_error.
--==============================================================================
procedure render_error_page (
    p_error in wwv_flow_error_api.t_error );

--==============================================================================
-- Return f?p URL to current page, passing non-persistent PK items
--==============================================================================
function get_url_to_current_page (
    p_debug in varchar2 default wwv_flow_debug.get_debug_value )
    return varchar2;

--==============================================================================
-- Returns a page submission id to detect duplicate page submits.
--
-- Parameters:
-- * p_source: If null, generate a new random source. Otherwise, use this
--   source.
--
-- Returns:
-- * The source, with a session specific checksum.
--==============================================================================
function get_page_submission_id (
    p_source in number default null )
    return varchar2;

--==============================================================================
-- Verify the page submission ID and check for duplicate submissions
--
-- Parameters:
-- * p_page_submission_id: Page submission ID with checksum (see
--   get_new_submission_id).
-- * p_check_duplicate_submission: If true, raise error on duplicate submission.
--
-- Raises:
-- * APEX.PAGE.DUPLICATE_SUBMIT: Duplicate submission.
-- * APEX.CHECKSUM.CONTENT_ERROR: Invalid checksum.
--==============================================================================
procedure verify_page_submission (
    p_page_submission_id         in varchar2,
    p_check_duplicate_submission in boolean );

--=========================================================================================================
-- Function that returns the page context
--
-- Parameters:
-- * p_escape_mode: c_escape_mode_html_attribute for HTML Attribute escaping, c_escape_mode_url for URL escaping
-- * p_value_only : boolean, when true this function returns <context_value> alone, when false returns 'p_context=<context_value>'
--    <context_value>
--      Friendly URLs turned on : <application alias>/<page alias>/<session id>
--      Friendly URLs turned off: <appid>:<pageid>:<session id>
--      Context is derived using global variables declared in wwv_flow package
--
-- Returns:
--   Returns page context as VARCHAR2 type.
--=========================================================================================================
function get_context (
    p_escape_mode in number default c_escape_mode_url,
    p_value_only  in boolean default false )
return varchar2;

--==============================================================================
-- Resets all global variables.
-- Note: Always call this procedure if the current page changes!
--==============================================================================
procedure reset;

--==============================================================================
-- Internal:
--
-- Renders all components (regions, items, buttons)
-- for a slot (page slot, region slot, plugin slot)
-- adhering to the specified grid settings.
--
-- Parameters:
-- * p_grid_template:       The grid template to be used for the slot
-- * p_components:          The table of components that need to be rendered
-- * p_slot:                Indicates if the current rendering context supports grid.
-- * p_parent_is_read_only: Indicates if the parent container is in read-only mode.
-- * p_region_id:           The region id to render components into.
-- * p_grid_attributes:     Additional grid attributes (for table based layouts).
--
-- Example:
--
-- begin
--     ...
--     wwv_flow_page.render_components (
--         p_grid_template       => p_grid_template,
--         p_components          => p_region.components,
--         p_slot                => l_slot,
--         p_parent_is_read_only => p_parent_is_read_only,
--         p_region_id           => p_region.id );
-- end;
--==============================================================================
procedure render_components (
    p_grid_template       in wwv_flow_template.t_grid_template,
    p_components          in wwv_flow_meta_data.t_components,
    p_slot                in wwv_flow_theme.t_slot,
    p_parent_is_read_only in boolean,
    p_region_id           in number   default null,
    p_grid_attributes     in varchar2 default null );

--==============================================================================
-- Emits dialog attributes for a single dialog template
--==============================================================================
procedure emit_js_dialogs(
    p_template_static_id    in varchar2 default null,
    p_page_id               in number   default null );

end wwv_flow_page;
/
show errors

set define '^'
