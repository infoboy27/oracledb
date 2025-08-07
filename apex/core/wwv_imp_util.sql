set define '^' verify off
prompt ...wwv_imp_util.sql
create or replace package wwv_imp_util as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021, 2024, Oracle and/or its affiliates.
--
--    NAME
--      api.sql
--
--    DESCRIPTION
--     Utility functions for importing APEX applications
--
--    MODIFIED (MM/DD/YYYY)
--     cczarski 09/06/2021 - Created
--
-----------------------------------------------------------------------------------------------------------------------

--==============================================================================
-- Types
--==============================================================================
type t_workspace_object is record(
    object_id             wwv_remote_servers.id%type,
    static_id             wwv_remote_servers.static_id%type,
    prompt_on_install     boolean,
    imp_base_url          wwv_remote_servers.base_url%type,
    imp_https_host        wwv_remote_servers.https_host%type,
    imp_ords_timezone     wwv_remote_servers.ords_timezone%type,
    imp_ords_version      wwv_remote_servers.ords_version%type,
    imp_default_schema    wwv_remote_servers.remote_sql_default_schema%type,
    old_base_url          wwv_remote_servers.base_url%type,
    old_https_host        wwv_remote_servers.https_host%type,
    old_ords_timezone     wwv_remote_servers.ords_timezone%type,
    old_ords_version      wwv_remote_servers.ords_version%type,
    old_default_schema    wwv_remote_servers.remote_sql_default_schema%type,
    is_new                boolean,
    apex_app_install_used boolean,
    is_used_by_other_apps boolean,
    is_overwritten        boolean );


--==============================================================================
-- constants for patch_jqueryui (see wwv_flow_upgrade, search for bug #23295272)
--==============================================================================
c_jqueryui_marker       constant varchar2(13)   := 'jquery-ui/1.8';
c_jqueryui_from1        constant varchar2(4000) := '(?(?(?wwv_flow|apex_application).g_image_prefix *\|\| *(''))|(?#IMAGE_PREFIX#|'||wwv_flow_global.g_image_prefix||'))libraries/jquery-ui/1.8(/|\.14/|\.22/)(themes/base|ui)';
c_jqueryui_to1          constant varchar2(24)   := '\4#JQUERYUI_DIRECTORY#\7';
c_jqueryui_from2        constant varchar2(81)   := '#JQUERYUI_DIRECTORY#ui/(minified/)?jquery.effects.([abcdefghijklmnopqrstuvwxyz]+)';
c_jqueryui_to2          constant varchar2(44)   := '#JQUERYUI_DIRECTORY#ui/\1jquery.ui.effect-\2';
c_include_all_legacy_js constant varchar2(8)    := 'PRE18:18';

--==============================================================================
procedure log_error (
    p_package    in varchar2,
    p_context    in varchar2,
    p_id         in number,
    p_component  in varchar2 default null );

--==============================================================================
function get_upgr_javascript_file_urls return varchar2;
function get_upgr_incl_legacy_js       return varchar2;
function get_ut_1_4_or_1_5             return boolean;

procedure set_after_install_prompts(
    p_enable in boolean );

procedure initialize_migrate_counters;
procedure initialize_maps;

--==============================================================================
procedure set_upgr_javascript_file_urls(
    p_file_urls                       in varchar2 );

--==============================================================================
procedure set_upgr_incl_legacy_js(
    p_incl_legcy_js                   in varchar2 );

--==============================================================================
procedure add_global_page(
    p_page_id                         in number );

function is_global_page(
    p_page_id                         in number )
    return boolean;

--==============================================================================
procedure set_is_ut_1_4_or_1_5(
    p_is_ut_1_4_or_1_5                in boolean );

--==============================================================================
-- Migrates code related (expression, function body) condition types to new
-- language agnostic names and initializes the programming language.
--==============================================================================
procedure migrate_source_code_lang (
    p_type                            in            varchar2,
    p_language                        in out nocopy varchar2 );

--==============================================================================
-- Migrates code related (expression, function body) condition types to new
-- language agnostic names and initializes the programming language.
--==============================================================================
procedure migrate_source_code_type (
    p_type                            in out nocopy varchar2,
    p_language                        in out nocopy varchar2 );

--==============================================================================
-- if a credential or remote server with the same static ID already exists in the
-- workspace, the imported components are supposed to use the existing object instead
-- of the one within the export file.
-- Thus we need to maintain a map from the remote server or credential ID in the
-- export file to an already existing object in the workspace, so that all components
-- are being created referencing the correct object.
--==============================================================================
procedure add_remote_server_to_map(
    p_id                              in number,
    p_remote_server                   in t_workspace_object );

--==============================================================================
function get_remote_server_from_map(
    p_remote_server_id                in number )
    return number;

--==============================================================================
procedure add_credential_to_map(
    p_id                              in number,
    p_credential                      in t_workspace_object );

--==============================================================================
function get_credential_from_map(
    p_credential_id                   in number )
    return number;

--==============================================================================
procedure migrate_components (
    p_flow_id                         in number );

--==============================================================================
procedure migrate_custom_positions (
    p_flow_id                         in number );

--==============================================================================
function get_internal_template_name (
    p_internal_name                   in varchar2,
    p_template_name                   in varchar2 )
    return varchar2;

--==============================================================================
function get_cur_app_authentication return number;

--==============================================================================
procedure set_cur_app_authentication(
    p_cur_app_authentication          in number );

--==============================================================================
function get_cur_app_id return number;

--==============================================================================
procedure set_cur_app_id(
    p_cur_app_id                      in number );

--==============================================================================
procedure add_button_to_migrate;
procedure add_bc_region_to_migrate;
procedure add_list_region_to_migrate;

--==============================================================================
procedure set_command_line_import(
    p_is_command_line_import in boolean );

--==============================================================================
function is_command_line_import return boolean;

--==============================================================================
procedure set_list_contents_only(
    p_list_contents_only in boolean );

--==============================================================================
function get_list_contents_only return boolean;

--==============================================================================
procedure write_remoteserver_collection;
procedure write_credential_collection;

--==============================================================================
procedure add_to_wwv_flow_steps_table(p_flow_id in number, p_id in number);
procedure upd_dup_wwv_flow_steps_aliases;

--==============================================================================
-- function to check flow alias and to generate generic alias if needed
--==============================================================================
function check_or_generate_flow_alias(
    p_flow_id    in number,
    p_flow_alias in varchar2 )
    return varchar2;

--==============================================================================
-- getters and setters for server attributes
--==============================================================================
procedure set_print_server_type( p_print_server_type in varchar2 );
procedure set_print_server_id( p_print_server_id in number );
procedure set_print_credential_id( p_print_credential_id in number );
procedure set_pwa_push_credential_id( p_pwa_push_credential_id in number );
procedure set_file_storage_server_id( p_file_storage_server_id in number );
procedure set_ai_service_id( p_ai_service_id in number );

function get_print_server_type      return varchar2;
function get_print_server_id        return number;
function get_print_credential_id    return number;
function get_pwa_push_credential_id return number;
function get_file_storage_server_id return number;
function get_ai_service_id          return number;

--==============================================================================
-- functions for caching ids of template component regions
--==============================================================================
procedure set_templ_comp_region(
    p_region_id in number );

function is_templ_comp_region(
    p_region_id in number )
    return boolean;

procedure clear_templ_comp_regions;

end wwv_imp_util;
/
show errors;
