set define '^'
prompt ...wwv_flow_imp_parser
create or replace package wwv_flow_imp_parser as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2023. All Rights Reserved.
--
--    NAME
--      imp_parser.sql
--
--    DESCRIPTION
--      This package provides parsing engine for flow export file.
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    05/19/2003 - Created
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# Constants for MIME types of uploaded files and default conversions of blobs
--#
--##############################################################################
c_mime_application_zip  constant varchar2(30) := 'application/zip' ;
c_mime_application_text constant varchar2(30) := 'application/text';
c_default_charset       constant varchar2(30) := 'utf-8';

--##############################################################################
--#
--# utility functions
--#
--##############################################################################

function get_app_name (p_file_id in number)
return varchar2;

function get_build_status (p_file_id in number)
return varchar2;

function get_version (p_file_id in number)
return varchar2;

function is_company_export (p_file_id in number)
return boolean;

function flow_exists (p_flow_id in number)
return number;

function get_image_name (p_file_id in number)
return varchar2;

function get_css_name (p_file_id in number)
return varchar2;

function get_workspace_name (p_file_id in number)
return varchar2;

function get_attr_dict_workspace (p_file_id in number)
return varchar2;

function get_schema_provisioned (p_file_id in number)
return varchar2;

function get_workspace_schemas (p_file_id in number)
return varchar2;

function get_component_manifest (p_file_id in number)
return clob;

function get_flow_id (p_file_id in number)
return number;

function get_page_id (p_file_id in number)
return number;

function get_theme_id (p_file_id in number)
return number;

function get_theme_name (p_file_id in number)
return varchar2;

function get_plugin_type (p_file_id in number)
return varchar2;

function get_plugin_name (p_file_id in number)
return varchar2;

function get_plugin_display_name (p_file_id in number)
return varchar2;

function get_rest_catalog_name ( p_file_id in number )
return varchar2;

function get_ui_schema (p_file_id in number)
return varchar2;

function get_security_group_id (p_file_id in number)
return number;

function get_parse_as_schema (p_file_id in number)
return varchar2;

function get_feedback_origin (p_file_id in number)
return varchar2;

function is_component_export (p_file_id in number)
return boolean;

procedure replace_links(
    p_old_flow in number,
    p_new_flow in number);

--##############################################################################
--#
--# parse / install
--#
--##############################################################################

--==============================================================================
-- Implementation of wwv_flow_application_install.get_info.
--
-- ARGUMENTS
-- * p_source: The source of the import file
-- * p_full:   If true, verify source integrity. If false (the default), the
--             result attributes file_type and has_install_script are not
--             populated.
--==============================================================================
function get_info (
    p_source                    in clob,
    p_full                      in boolean default false )
    return wwv_flow_application_install.t_file_info;

--==============================================================================
-- Implementation of wwv_flow_application_install.install.
--==============================================================================
procedure install (
    p_source                    in clob,
    p_overwrite_existing        in boolean,
    p_need_parse                in boolean );

--==============================================================================
-- parse and run import file
--==============================================================================
procedure parse (
  p_file_id            in number,
  p_parse_as_schema    in varchar2 default null,
  p_install_as_flow    in number   default null,
  p_original_flow_id   in number   default null,
  p_adjust_offset      in boolean  default true,
  p_create_theme       in boolean  default false,
  p_pkg_app_install    in boolean  default false,
  p_new_name           in varchar2 default null,
  p_new_build_status   in varchar2 default null,
  p_keep_bg_execs      in boolean  default false,
  p_install_in_theme   in number   default null );

--==============================================================================
-- parse and run import file
--==============================================================================
procedure parse (
  p_clob              in clob,
  p_parse_as_schema   in varchar2 default null,
  p_install_as_flow   in number   default null,
  p_original_flow_id  in number   default null,
  p_offset            in number   default null,
  p_adjust_offset     in boolean  default true,
  p_create_theme      in boolean  default false,
  p_pkg_app_install   in boolean  default false,
  p_new_name          in varchar2 default null,
  p_new_build_status  in varchar2 default null,
  p_keep_bg_execs     in boolean  default false,
  p_install_in_theme  in number   default null );

--==============================================================================
-- parse and run import file
--==============================================================================
procedure component_export_parse (
    p_clob              in clob,
    p_parse_as_schema   in varchar2 default null,
    p_install_as_flow   in number   default null,
    p_original_flow_id  in number   default null,
    p_offset            in number   default null,
    p_adjust_offset     in boolean  default true,
    p_create_theme      in boolean  default false,
    p_pkg_app_install   in boolean  default false,
    p_new_name          in varchar2 default null,
    p_new_build_status  in varchar2 default null,
    p_keep_bg_execs     in boolean  default false,
    p_install_in_theme  in number   default null );

-- =============================================================================
-- handle the uploaded export file, especially if it's a zip
-- =============================================================================
procedure upload_export_file (
  p_file               in varchar2,
  p_file_type          in varchar2,
  p_security_group_id  in number,
  p_file_charset       in varchar2,
  p_flow_user          in varchar2
  );

--==============================================================================
-- Convert multiple split parts of an application into a single installable clob.
--
-- The p_source is a table of (name, contents), where name looks like
--
--   f4550/application/set_environment.sql
--   f4550/application/delete_application.sql
--   ...
--   f4550/application/end_environment.sql
--   f4550/install.sql
--
-- where f4550/install.sql e.g. contains
--
--   @@application/set_environment.sql
--   @@application/delete_application.sql
--   ...
--   @@f4550/application/end_environment.sql
--
-- For the result, we have to concatenate the contents in the order they appear
-- in the install.sql (or similar, e.g. install_component.sql) file.
--
-- If there are multiple files (e.g. including README.md, LICENSE.txt) but there's
-- only one SQL (e.g. if the list was obtained from apex_export.get_application 
-- without the p_split option) file, then return that file
--==============================================================================
function create_installable_sql (
    p_source in wwv_flow_t_export_files )
    return clob;

--==============================================================================

end wwv_flow_imp_parser;
/
show error;
