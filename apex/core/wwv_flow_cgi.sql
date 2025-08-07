set define '^' verify off
prompt ...wwv_flow_cgi.sql
create or replace package wwv_flow_cgi as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_cgi.sql
--
--    DESCRIPTION
--      Provide easy access to CGI variables
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    06/14/2012 - Created
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# H T T P   H E A D E R   V A L U E S
--#
--# These values automatically get initialized when the package gets accessed.
--# Use them instead of owa_util.get_cgi_env, to avoid looping through the header
--# array.
--#
--##############################################################################
subtype t_cgi_header is varchar2(32767);

function get_apex_listener_version  return t_cgi_header;
function get_ords_version_number    return number; -- major.minor, e.g. 24.1.
function get_cookie                 return t_cgi_header;
function get_dad_name               return t_cgi_header;
function get_ecid_context           return t_cgi_header;
function get_http_accept            return t_cgi_header;
function get_http_accept_language   return t_cgi_header;
function get_http_host              return t_cgi_header;
function get_http_if_modified_since return t_cgi_header;
function get_http_if_none_match     return t_cgi_header;
function get_http_referer           return t_cgi_header;
function get_http_user_agent        return t_cgi_header;
function get_http_user_agent_lower  return t_cgi_header;
function get_origin                 return t_cgi_header;
function get_path_info              return t_cgi_header;
function get_path_alias             return t_cgi_header;
function get_query_string           return t_cgi_header;
function get_remote_addr            return t_cgi_header;
function get_remote_user            return t_cgi_header;
function get_request_iana_charset   return t_cgi_header;
function get_request_method         return t_cgi_header;
function get_request_protocol       return t_cgi_header;
function get_script_name            return t_cgi_header;
function get_script_prefix          return t_cgi_header;
function get_server_name            return t_cgi_header;
function get_server_port            return t_cgi_header;
function get_server_software        return t_cgi_header;
function get_x_forwarded_for        return t_cgi_header;
function get_x_forwarded_proto      return t_cgi_header;
function get_x_forwarded_port       return t_cgi_header;

--==============================================================================
-- Generic get header value function, to be used instead of
-- owa_util.get_cgi_env. this decodes base64- or quoted printable encoded
-- header values (RFC 2047).
--
-- PARAMETERS
-- * p_header_name: The header name.
-- * p_unique: If true (default false), raise an error when the header is not
--   unique. If false, do not check for uniqueness but return the value of the
--   first matching header.
--
-- RETURNS
-- * The decoded header value.
--
-- RAISES
-- * APEX.AUTHENTICATION.HEADER.DUPLICATE: Header exists more than once and
--   p_unique was true.
--==============================================================================
function get_header_value (
    p_header_name in varchar2,
    p_unique      in boolean default false )
    return varchar2;

--==============================================================================
-- Return the protocol (http/https) of the current request.
--==============================================================================
function get_protocol
    return varchar2;

--==============================================================================
-- Return protocol://host:port/
--==============================================================================
function get_base_url
    return varchar2;

--##############################################################################
--#
--# S E S S I O N   C O O K I E   H A N D L I N G
--#
--##############################################################################

subtype t_cookie_value is varchar2(32);

--==============================================================================
-- return a new random session cookie value
--==============================================================================
function create_session_cookie_value
    return t_cookie_value;

--==============================================================================
-- update the CGI value for the given session cookie name
-- this does not send the cookie via htp, it merely updates wwv_flow_cgi's
-- internal structures.
--==============================================================================
procedure set_session_cookie_value (
    p_name  in varchar2,
    p_value in t_cookie_value );

--==============================================================================
-- return the CGI value for the given session cookie name
--==============================================================================
function get_session_cookie_value (
    p_name in varchar2 )
    return t_cookie_value;

--==============================================================================
-- return whether a session cookie with the given value exists
-- this function should only be used in wwv_flow_custom_auth_std.ws_login, for
-- sso authentication.
--==============================================================================
function does_cookie_exist_for_value (
    p_value in t_cookie_value )
    return boolean;

--==============================================================================
-- return builder remember me cookie name (ORA_WWV_REMEMBER_UN)
--==============================================================================
function get_builder_login_cookie_name
    return varchar2;

--==============================================================================
-- return builder remember me cookie value (ORA_WWV_REMEMBER_UN)
--==============================================================================
function get_builder_login_cookie_value
    return varchar2;

--##############################################################################
--#
--# U T I L I T Y   F U N C T I O N S
--#
--##############################################################################

--==============================================================================
-- Initialize the global variables.
--
-- The package calls init on startup, but there may be occasions where a
-- re-initialization is necessary.
--==============================================================================
procedure init;

--==============================================================================
-- Initialize via name/value plist. This overwrites the OWA arrays.
--
-- ARGUMENTS
-- * p_headers: table of name/value pairs
--
-- EXAMPLE
--   Set PATH_INFO to '/hello' and FOO to 'world'
--
--     wwv_flow_cgi.init (
--         p_headers => wwv_flow_t_varchar2 (
--                          'PATH_INFO', '/hello',
--                          'FOO'      , 'world' ));
--==============================================================================
procedure init (
    p_headers in wwv_flow_t_varchar2 );

end wwv_flow_cgi;
/
show err
