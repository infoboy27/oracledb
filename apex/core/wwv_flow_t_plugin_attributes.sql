set define '^' verify off
prompt ...wwv_flow_t_plugin_attributes.sql
create or replace type wwv_flow_t_plugin_attributes as object (
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_t_plugin_attributes.sql
--
--    DESCRIPTION
--      Object type that for reading plug-in attributes
--
--    MODIFIED   (MM/DD/YYYY)
--    sdobre      01/23/2024 - Created
--
--------------------------------------------------------------------------------

l_json sys.json_object_t,

constructor function wwv_flow_t_plugin_attributes (
    self    in out nocopy wwv_flow_t_plugin_attributes,
    p_json  in clob )
    return self as result,

constructor function wwv_flow_t_plugin_attributes (
    self    in out nocopy wwv_flow_t_plugin_attributes,
    p_plist in wwv_flow_t_varchar2 )
    return self as result,

-- p_do_substitutions and p_do_serveronly_substitutions cannot both be true
-- constants for the escape_mode will need to be exposed
final member function get_varchar2 (
    p_static_id                   in varchar2,
    --
    p_default_value               in varchar2    default null,
    p_do_substitutions            in boolean     default false,
    p_do_serveronly_substitutions in boolean     default false,
    p_substitutions_escape_mode   in pls_integer default 2 ) -- wwv_flow_session_state_api.c_escape_mode_html
    return varchar2,

-- uses wwv_flow_plugin_util.get_attribute_as_number
final member function get_number (
    p_static_id     in varchar2,
    --
    p_default_value in number   default null )
    return number,

-- used for Y/N type attributes
final member function get_boolean (
    p_static_id     in varchar2,
    --
    p_default_value in boolean  default null )
    return boolean,

final member function to_clob
    return clob
)

not persistable
/
show err