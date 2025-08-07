set define off
set verify off

prompt ...wwv_flow_theme

create or replace package wwv_flow_theme
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_theme.sql
--
--    DESCRIPTION
--      This package is responsible for handling themes by the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/16/2012 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_ref is record (
    app_id   number,
    theme_id number,
    sgid     number );
type t_refs is table of t_ref index by pls_integer;

type t_slot is record (
    placeholder             varchar2(255),
    has_grid_support        boolean,
    has_region_support      boolean,
    has_item_support        boolean,
    has_button_support      boolean,
    max_fixed_grid_columns  pls_integer,
    placeholder_position    pls_integer ); -- position of the placeholder in the context of its markup

type t_theme is record (
    id                           number,
    application_id               number,
    theme_id                     number,
    central_application_id       number,
    central_theme_id             number,
    central_workspace_id         number,
    navigation_type              varchar2(1),
    default_page_template_id     number,
    default_dialog_template_id   number,
    printer_friendly_template_id number,
    error_page_template_id       number,
    login_page_template_id       number,
    default_button_template_id   number,
    default_region_template_id   number,
    default_chart_template_id    number,
    default_form_template_id     number,
    default_reportr_template_id  number,
    default_tabform_template_id  number,
    default_wizard_template_id   number,
    default_menur_template_id    number,
    default_listr_template_id    number,
    default_irr_template_id      number,
    default_report_template_id   number,
    default_label_template_id    number,
    default_menu_template_id     number,
    default_calendar_template_id number,
    default_list_template_id     number,
    default_nav_list_template_id number,
    default_option_label_id      number,
    default_required_label_id    number,
    default_dialogr_template     number,
    default_dialogbtnr_template  number,
    breadcrumb_display_point     wwv_flow_themes.breadcrumb_display_point%type,
    sidebar_display_point        wwv_flow_themes.sidebar_display_point%type,
    calendar_icon                wwv_flow_themes.calendar_icon%type,
    calendar_icon_attr           wwv_flow_themes.calendar_icon_attr%type,
    custom_icon_classes          wwv_flow_themes.custom_icon_classes%type,
    custom_icon_prefix_class     wwv_flow_themes.custom_icon_prefix_class%type,
    custom_library_file_urls     wwv_flow_themes.custom_library_file_urls%type,
    icon_library                 wwv_flow_themes.icon_library%type,
    javascript_file_urls         wwv_flow_themes.javascript_file_urls%type,
    css_file_urls                wwv_flow_themes.css_file_urls%type,
    file_prefix                  wwv_flow_themes.file_prefix%type,
    files_version                number );

type t_calendar is record (
    icon            wwv_flow_themes.calendar_icon%type,
    icon_attributes wwv_flow_themes.calendar_icon_attr%type );

--==============================================================================
-- Global constants
--==============================================================================

--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- Returns the slots for a region template
--==============================================================================
function get_region_placeholders (
    p_region_template_id in number )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Returns if a page slot exists in the specified page template.
--==============================================================================
function has_page_slot (
    p_page_template_id in number,
    p_placeholder      in varchar2 )
    return boolean;

--==============================================================================
-- Returns the id of the central application of the specified theme.
-- A central theme can belong in a different application than the current one.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_central_application_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;

--==============================================================================
-- Returns the id of the central theme of the specified theme.
-- A central theme can belong in a different application than the current one.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_central_theme_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;

--==============================================================================
-- Returns the id of the central workspace of the specified theme.
-- A central theme can belong in a different application than the current one.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_central_workspace_id (
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;

--==============================================================================
-- Procedure that returns a table of two theme records for runtime usage.
-- First record is the default application_id, theme_id and security_group_id
-- Second record is the central application_id, theme_id and security_group_id
--==============================================================================
function get_refs_rt
    return t_refs;

--==============================================================================
-- Procedure that returns a table of two theme records for dev usage.
-- First record is the provided application_id, theme_id and security_group_id
-- Second record is the central application_id, theme_id and security_group_id
--==============================================================================
function get_refs_dev (
    p_application_id    in number,
    p_theme_id          in number default null )
    return t_refs;

--==============================================================================
-- Procedure that returns a table of two theme records
-- First record is the provided application_id, theme_id and security_group_id
-- Second record is the central application_id, theme_id and security_group_id
--==============================================================================
function get_refs (
    p_application_id    in number,
    p_theme_id          in number default null,
    p_security_group_id in number,
    p_translated_app_id in number default null )
    return t_refs;

--==============================================================================
-- Returns the id of the default page template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_default_page_template_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the id of the default dialog page template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_dialog_page_template_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the navigation type ([T]ab or [L]ist) of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_navigation_type (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the id of the error page template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_error_page_template_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the id of the printer friendly page template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_printer_friendly_templ_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the page css classes of the current theme style.
--==============================================================================
function get_style_page_css_classes return varchar2;

--
--==============================================================================
-- Returns the icon library of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_icon_library (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns a page slot based on page template and placeholder
--==============================================================================
function get_page_slot (
    p_page_template_id  in number,
    p_placeholder       in varchar2 )
    return t_slot;
--
--==============================================================================
-- Returns a region slot based on region template and placeholder
--==============================================================================
function get_region_slot (
    p_region_template_id in number,
    p_placeholder        in varchar2 )
    return t_slot;

--
--==============================================================================
-- Returns a plugin slot based on region type, tc type and placeholder
--==============================================================================
function get_region_plugin_slot (
    p_plug_source_type        in varchar2,
    p_template_component_type in varchar2,
    p_placeholder             in varchar2 )
    return t_slot;
--
--==============================================================================
-- Returns the meta data of the passed slot stored for the application.
-- If that slot is not defined, default values will be used.
-- p_max_fixed_grid_columns should be set to the available maximum columns of the
-- parent container.
--==============================================================================
function get_slot (
    p_grid_template           in wwv_flow_template.t_grid_template,
    p_page_template_id        in number      default null,
    p_region_template_id      in number      default null,
    p_plug_source_type        in varchar2    default null,
    p_template_component_type in varchar2    default null,
    p_placeholder             in varchar2    default null,
    p_has_grid_support        in boolean     default true,
    p_max_fixed_grid_columns  in pls_integer default null )
    return t_slot;
--
--==============================================================================
-- Returns the calendar attributes of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
-- Note: For all returned attributes, do_substitutions has already been called,
--       and icon contains the default /i/asfdcldr.gif if no icon has been set for
--       the theme.
--==============================================================================
function get_calendar (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return t_calendar;
--
--==============================================================================
-- Returns the file prefix to references files of the specified theme.
-- If file_prefix doesn't contain a value then the URL to access the theme file storage will be returned.
--
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_file_prefix (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the URL to access the theme file storage in the database.
--
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_db_file_prefix (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the prefixed and HTML attribute escaped icon css classes based on the
-- current theme icon library settings.
--
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_prefixed_icon_css_classes (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id,
    p_icon_css_classes  in varchar2,
    p_escape_mode       in wwv_flow_session_state.t_escape_mode default wwv_flow_session_state.c_escape_mode_html_attribute,
    p_do_substitutions  in boolean default true )
    return varchar2;
--
--==============================================================================
-- Returns the combined css classes of the manual specified classes and
-- template options.
--==============================================================================
function get_component_css_classes (
    p_component_id             in number,
    p_component_level          in number   default 1,
    p_css_classes              in varchar2,
    p_template_options         in varchar2,
    p_default_template_options in varchar2 )
    return varchar2;
--
--==============================================================================
-- Emits all css files (icon library, theme level css) of the current theme.
--==============================================================================
procedure emit_theme_css;
--
--==============================================================================
-- Emits all css files (css and theme roller css) of the current theme style.
--==============================================================================
procedure emit_theme_style_css;
--
--==============================================================================
-- Emits the javascript files of the of the current theme.
--==============================================================================
procedure emit_theme_javascript;
--
--==============================================================================
-- set current theme style for the current application. To be called from
-- wwv_flow_theme_api.set_current_style.
--==============================================================================
procedure set_current_style (
    p_application_id in number                          default wwv_flow_security.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type,
    p_id             in wwv_flow_theme_styles.name%type
    );
--
--==============================================================================
-- sets a theme style user preference for the current user and application. To
-- be called from wwv_flow_theme_api.set_session_style_css
--==============================================================================
procedure set_session_style_css (
    p_application_id   in number                                   default wwv_flow_security.g_flow_id,
    p_theme_number     in wwv_flow_themes.theme_id%type            default wwv_flow.g_flow_theme_id,
    p_css_file_urls    in wwv_flow_theme_styles.css_file_urls%type,
    p_page_css_classes in varchar2 );
--
--==============================================================================
-- sets a theme style user preference for the current user and application. To
-- be called from wwv_flow_theme_api.set_session_style
--==============================================================================
procedure set_session_style (
    p_application_id in number                        default wwv_flow_security.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id,
    p_id             in wwv_flow_theme_styles.id%type
    );
procedure set_session_style (
    p_application_id in number                          default wwv_flow_security.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type   default wwv_flow.g_flow_theme_id,
    p_name           in wwv_flow_theme_styles.name%type
    );

--
--==============================================================================
-- procedures to set, get and clear the theme style user preferences
--==============================================================================
procedure set_user_style_preference(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id,
    p_id             in wwv_flow_theme_styles.id%type
);

function get_user_style_preference(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id
) return number;

procedure clear_user_style_preference(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id
);

--==============================================================================
-- procedure to clear all theme style user preferences for an application
--==============================================================================
procedure clear_all_users_style_pref(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id
);

--==============================================================================
-- procedure to enable or disable theme style selection by user preference
--==============================================================================
--
procedure enable_style_by_user_pref(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id,
    p_enable         in boolean                       default true
);
--
--==============================================================================
-- loads user styles into session state for all user interfaces of the
-- current application
--==============================================================================
procedure set_user_styles (
    p_application_id in number default wwv_flow_security.g_flow_id );
--
--==============================================================================
-- loads global theme attributes into memory
--==============================================================================
procedure set_globals (
    p_flow_id           in number,
    p_theme_id          in number default null );
--
--==============================================================================
-- Gets the next available theme ID for an application
--==============================================================================
function get_new_theme_id( p_flow_id in number )
    return number;
--
--==============================================================================
-- Deletes a theme from an application
--==============================================================================
procedure delete_theme(
    p_flow_id   in number,
    p_theme_id  in number,
    p_import    in varchar2 default 'N' );
--
--==============================================================================
-- Returns true if theme operations are restricted in the app
--==============================================================================
function is_restricted_app( p_flow_id   in number )
    return boolean;

--==============================================================================
-- Build array of central theme components for the exported app
--==============================================================================
procedure init_central_theme_components (
    p_application_id number );

--==============================================================================
-- Returns true if the value belongs to a central theme
--==============================================================================
function is_central_theme_component (
    p_value number )
    return boolean;

end wwv_flow_theme;
/
show errors

set define '^'
