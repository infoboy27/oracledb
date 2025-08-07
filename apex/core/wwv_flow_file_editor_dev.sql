set define '^' verify off
prompt ...wwv_flow_file_editor_dev.sql
create or replace package wwv_flow_file_editor_dev authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_file_editor_dev
--
--    DESCRIPTION
--      File editor logic specific to the APEX builder
--
--
--    MODIFIED   (MM/DD/YYYY)
--    sdobre      04/02/2021 - Created
--------------------------------------------------------------------------------

--==============================================================================
-- To be called in a Before Header page process on 4000/118
-- Performs sanity checks, populates items, loads needed libraries and text messages
--==============================================================================
procedure init_page (
    -- scope
    p_scope                 in  wwv_flow_file_api.t_file_scope,
    p_app_id                in  number,
    p_plugin_id             in  number,
    p_theme_id              in  number,
    p_id                    in  number,

    -- items
    p_out_directory         out varchar2,
    p_out_name              out varchar2,
    p_out_name_original     out varchar2,
    p_out_title             out varchar2,
    p_out_title_landmark    out varchar2,
    p_out_mime_type         out varchar2,
    p_out_charset           out varchar2,
    p_out_language          out varchar2,
    p_out_is_editable       out varchar2,
    p_out_bc_parent_label   out varchar2,
    p_out_bc_parent_url     out varchar2 );

--==============================================================================
-- Returns true if a file by the given name exists in the given scope
-- p_ignore_id can be provided to ignore a cerain file
--==============================================================================
function file_name_is_taken (
    p_scope     in wwv_flow_file_api.t_file_scope,
    p_app_id    in number   default null,
    p_plugin_id in number   default null,
    p_theme_id  in number   default null,  
    p_name      in varchar2,
    p_ignore_id in number   default null )
    return boolean;

--==============================================================================
-- Returns the contents of a file as CLOB
--==============================================================================
function get_file_as_base64 (
    p_id        in number,
    p_scope     in wwv_flow_file_api.t_file_scope,
    p_app_id    in number default null,
    p_plugin_id in number default null,
    p_theme_id  in number default null ) 
    return clob;

--==============================================================================
-- Generic procedure to delete a file in 1 of the 4 scopes
--==============================================================================
procedure delete_file (
    p_id                in number,
    p_scope             in wwv_flow_file_api.t_file_scope,
    p_app_id            in number  default null,
    p_plugin_id         in number  default null,
    p_theme_id          in number  default null,
    p_delete_artifacts  in boolean default false );

--==============================================================================
-- Renames a file and changes its mime_type if the extension has changes
--==============================================================================
procedure update_file_name (
    p_id        in number,
    p_name      in varchar2,
    p_scope     in wwv_flow_file_api.t_file_scope,
    p_app_id    in number default null,
    p_plugin_id in number default null,
    p_theme_id  in number default null );

--==============================================================================
-- Returns a combination of last_updated_by and last_updated_on
-- to be use as a checksum to deletect lost updates
--==============================================================================
function get_file_last_modified (
    p_id        in number,
    p_scope     in wwv_flow_file_api.t_file_scope,
    p_app_id    in number default null,
    p_plugin_id in number default null,
    p_theme_id  in number default null )
    return varchar2;

--==============================================================================
-- Returns the reference of a file based on scope and name
-- e.g #APP_FILES#script#MIN#.js
-- #MIN# is added if the file has a (un)minified version
--==============================================================================
function get_file_reference (
    p_scope     in wwv_flow_file_api.t_file_scope,
    p_app_id    in number default null,
    p_plugin_id in number default null,
    p_theme_id  in number default null,
    p_file_name in varchar2 )
    return varchar2;

--==============================================================================
-- Function to get all file directories in a given scope
--==============================================================================
function get_directories (
    p_scope     in wwv_flow_file_api.t_file_scope,
    p_app_id    in number default null,
    p_plugin_id in number default null,
    p_theme_id  in number default null )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Creates a static file
-- Creates empty file if p_content is not provided
--      also generates min files for js and css
-- Loads the files uploaded to wwv_flow_temp_files identified by p_content
-- Returns the ID of the new file
--==============================================================================
function create_file (
    p_scope     in wwv_flow_file_api.t_file_scope,
    p_app_id    in number default null,
    p_plugin_id in number default null,
    p_theme_id  in number default null,
    p_name      in varchar2,    -- the file name including directory
    p_directory in varchar2,    -- just the directory
    p_content   in varchar2,    -- wwv_flow_temp_files file names, ":" separated
    p_unzip     in varchar2,    -- Y/N
    p_charset   in varchar2 )   -- only used for uploaded files
return number;

--==============================================================================
-- Entry point for saving a file via AJAX
-- Writes back status into htp buffer via apex_json
--==============================================================================
procedure save_ajax (
    p_id            in number,
    p_scope         in wwv_flow_file_api.t_file_scope,
    p_app_id        in number default null,
    p_plugin_id     in number default null,
    p_theme_id      in number default null,

    p_file_1        in wwv_flow_global.vc_arr2,
    p_file_1_name   in varchar2,
    p_file_2        in wwv_flow_global.vc_arr2,
    p_file_2_name   in varchar2,
    p_file_3        in wwv_flow_global.vc_arr2,
    p_file_3_name   in varchar2,

    p_last_mod      in varchar2,
    p_name_original in varchar2 );

end wwv_flow_file_editor_dev;
/
sho err

set define '^'
