set define '^' verify off
prompt ...wwv_flow_translation_util_api
create or replace package wwv_flow_translation_util_api as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_theme.sql
--
--    DESCRIPTION
--      Internal APIs for use with application translation publishing
--
--    MODIFIED   (MM/DD/YYYY)
--      jkallman  08/15/2012 - Created
--
--------------------------------------------------------------------------------

-- internal function available for sql statement
function get_theme_translation_value (
    p_value in number )
    return number;

procedure publish_application (
    p_from_flow_id          in number default null,
    p_translated_flow_id    in number default null );

procedure sync_translations (
    p_flow_id              in number   default null,
    p_language             in varchar2 default null );

procedure flow_copy (
    p_flow_id_from         in number,
    p_flow_id_to           in number,
    p_alias_to             in varchar2 default null,
    p_flow_language_to     in varchar2,
    p_ok_to_delete_flow    in boolean := false,
    p_perform_translations in boolean := true );

procedure set_translation_mapping (
    p_application_id_from  in number,
    p_application_id_to    in number,
    p_language             in varchar2 );

--
-- Wrapper for the native json_transform function
-- which can use a variable for the path
--
function json_transform (
    p_json                 in clob,
    p_json_path            in varchar2,
    p_value                in varchar2 )
    return clob;

--
-- Splits a JSON into [path, value] tuples
-- Currently only flat JSON structures are supported.
--
function get_json_parts (
    p_json                      in clob,
    p_key_has_path_wrapper_yn   in varchar2 default 'Y' )
    return wwv_flow_t_json_parts pipelined;

--
-- Modifies a JSON object to make it suitable for use in SQL statments
-- workaround for database bug - 35716179
function patch_attributes (
    p_plugin_name in varchar2,
    p_plugin_type in varchar2 default null,
    p_attributes  in clob,
    p_offset      in number )
    return clob;

end wwv_flow_translation_util_api;
/
show errors

