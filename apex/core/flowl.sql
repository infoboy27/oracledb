set define '^' verify off
prompt ...wwv_flowl
create or replace package wwv_flow_lang as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2024, Oracle and/or its affiliates.
--
--    NAME
--      flowl.sql
--
--    DESCRIPTION
--      Flow language translation services
--
--    NOTES
--      This program allows for translation of text strings from
--      on national language to another.
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa    08/22/1999 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- NLS session settings
--==============================================================================
type t_nls_session_parameters is record (
    date_format         sys.nls_session_parameters.value%type,
    time_format         sys.nls_session_parameters.value%type,
    timestamp_format    sys.nls_session_parameters.value%type,
    timestamp_tz_format sys.nls_session_parameters.value%type,
    numeric_characters  sys.nls_session_parameters.value%type,
    sort                sys.nls_session_parameters.value%type,
    comp                sys.nls_session_parameters.value%type,
    currency            sys.nls_session_parameters.value%type,
    iso_currency        sys.nls_session_parameters.value%type,
    dual_currency       sys.nls_session_parameters.value%type);

--==============================================================================
-- Return NLS_SESSION_PARAMETERS.
--==============================================================================
function get_session_parameters
    return t_nls_session_parameters;

--==============================================================================
-- Set NLS_NUMERIC_CHARACTERS to p_new_value. If no value is given, reset to the
-- last value that was used when a value was passed.
--==============================================================================
procedure reset_nls_numeric_characters (
    p_new_value in varchar2 default null );

--==============================================================================
procedure report_lang_to_browser
    --
    -- Produce an HTML report listing the browser language to database
    -- language equivs.
    --
    ;


function map_language (
    --
    -- Convert a browser language into a database language.
    -- for example:
    -- us = AMERICAN
    -- fr = FRENCH
    -- ja = JAPANESE
    --
    --
    p_language  in varchar2)
    RETURN varchar2
    ;

--==============================================================================
-- alter the dbms session set the language to this value.
--==============================================================================
procedure alter_session (
    p_language  in varchar2 default null);

--==============================================================================
-- Return the language that was set with alter_session(p_language).
--==============================================================================
function nls_language_set
    return varchar2;

--==============================================================================
function replace_param (
    p_message                   in varchar2,
    p0                          in varchar2,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null)
    return varchar2
    ;

function replace_param (
    p_message        in varchar2,
    p_params         in wwv_flow_t_varchar2 default wwv_flow_t_varchar2())
    return varchar2
    ;

--
-- return named text message with substitutions
--
function message (
    p_name                      in varchar2,
    p_params                    in wwv_flow_t_varchar2 default wwv_flow_t_varchar2(),
    p_lang                      in varchar2 default null,
    p_application_id            in number   default null)
    return varchar2
    ;

--
-- return named text message with substitutions
--
function message (
    p_name                      in varchar2,
    p0                          in varchar2,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in number   default null)
    return varchar2
    ;

--
-- htp.print a named text message with substitutions
--
procedure message_p (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in number   default null )
    ;


--
-- Create a runtime message
--
procedure create_message(
    p_application_id        in number,
    p_name                  in varchar2,
    p_language              in varchar2,
    p_message_text          in varchar2,
    p_used_in_javascript    in boolean  default false,
    p_metadata              in clob     default null,
    p_comment               in varchar2 default null );

--
-- Update the text of a runtime message
--
procedure update_message(
    p_id in number,
    p_message_text in varchar2 )
    ;

--
-- Update the attributes of a message
--
procedure update_message (
    p_id                 in number,
    p_name               in varchar2,
    p_language           in varchar2,
    p_message_text       in varchar2,
    p_used_in_javascript in boolean,
    p_metadata           in clob,
    p_comment            in varchar2 );

--
-- Delete a runtime message
--
procedure delete_message(
    p_id in number );

--
-- Update the string in the translation repository
--
procedure update_translated_string(
    p_id in number,
    p_language in varchar2,
    p_string in varchar2);


--
-- return named text System message with substitutions
--
function system_message (
    p_name                      in varchar2,
    p_params                    in wwv_flow_t_varchar2 default wwv_flow_t_varchar2(),
    p_lang                      in varchar2 default null,
    p_application_id            in varchar2 default null,
    p_security_group_id         in varchar2 default null)
    return varchar2
    ;

--
-- return named text System message with substitutions
--
function system_message (
    p_name                      in varchar2,
    p0                          in varchar2,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in varchar2 default null,
    p_security_group_id         in varchar2 default null)
    return varchar2
    ;



--
-- Return named text System message with substitutions.
-- This function is used when the returned string is going to be included
-- in a literal, so all occurrences of a single quote in the message will
-- be returned as two consecutive single quotes.
--
function system_message_lit (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in varchar2 default null,
    p_security_group_id         in varchar2 default null)
    return varchar2
    ;


--
-- htp.print a named text System message with substitutions
--
procedure system_message_p (
    p_name                      in varchar2 default null,
    p0                          in varchar2 default null,
    p1                          in varchar2 default null,
    p2                          in varchar2 default null,
    p3                          in varchar2 default null,
    p4                          in varchar2 default null,
    p5                          in varchar2 default null,
    p6                          in varchar2 default null,
    p7                          in varchar2 default null,
    p8                          in varchar2 default null,
    p9                          in varchar2 default null,
    p_lang                      in varchar2 default null,
    p_application_id            in varchar2 default null,
    p_security_group_id         in varchar2 default null)
    ;

--==============================================================================
-- Returns an APEX runtime message, but first checks if it has been overwritten
-- in the current application.
--==============================================================================
function custom_runtime_message (
    p_name    in varchar2,
    p_params  in wwv_flow_t_varchar2 default wwv_flow_t_varchar2(),
    p_lang    in varchar2 default null )
    return varchar2
    ;

--==============================================================================
-- Returns an APEX runtime message, but first checks if it has been overwritten
-- in the current application.
--==============================================================================
function custom_runtime_message (
    p_name in varchar2,
    p0     in varchar2,
    p1     in varchar2 default null,
    p2     in varchar2 default null,
    p3     in varchar2 default null,
    p4     in varchar2 default null,
    p5     in varchar2 default null,
    p6     in varchar2 default null,
    p7     in varchar2 default null,
    p8     in varchar2 default null,
    p9     in varchar2 default null,
    p_lang in varchar2 default null )
    return varchar2
    ;

--==============================================================================
-- Returns an APEX runtime message, but first checks if it has been overwritten
-- in the current application.
--==============================================================================
function runtime_message (
    p_name              in varchar2,
    p_params            in wwv_flow_t_varchar2 default wwv_flow_t_varchar2(),
    p_lang              in varchar2 default null,
    p_application_id    in number   default null,
    p_security_group_id in number   default null )
    return varchar2;

--==============================================================================
-- Returns an APEX runtime message, but first checks if it has been overwritten
-- in the current application.
--==============================================================================
function runtime_message (
    p_name              in varchar2,
    p0                  in varchar2,
    p1                  in varchar2 default null,
    p2                  in varchar2 default null,
    p3                  in varchar2 default null,
    p4                  in varchar2 default null,
    p5                  in varchar2 default null,
    p6                  in varchar2 default null,
    p7                  in varchar2 default null,
    p8                  in varchar2 default null,
    p9                  in varchar2 default null,
    p_lang              in varchar2 default null,
    p_application_id    in number   default null,
    p_security_group_id in number   default null )
    return varchar2;

--==============================================================================
-- Returns all text messages of the APEX Runtime Engine and the specified
-- application which are marked as JavaScript messages.
-- If p_names is specified, only those text messages will be returned. An entry
-- in p_names can use wildcards of the LIKE operator.
-- Those messages don't have to be marked as JavaScript messages.
--==============================================================================
procedure js_messages (
    p_application_id in number,
    p_lang           in varchar2,
    p_version        in varchar2,
    p_nls_settings   in varchar2 default null,
    p_builder        in varchar2 default 'N',
    p_names          in wwv_flow_global.vc_arr2 default wwv_flow_global.c_empty_vc_arr2 );

--
--  WebDB20 style translations
--
function lang (
   p_primary_text_string       in varchar2 default null,
   p0                          in varchar2 default null,
   p1                          in varchar2 default null,
   p2                          in varchar2 default null,
   p3                          in varchar2 default null,
   p4                          in varchar2 default null,
   p5                          in varchar2 default null,
   p6                          in varchar2 default null,
   p7                          in varchar2 default null,
   p8                          in varchar2 default null,
   p9                          in varchar2 default null,
   p_primary_text_context      in varchar2 default null,
   p_primary_language          in varchar2 default null)
   return varchar2
   ;

FUNCTION find_language_preference
   RETURN varchar2
   ;

--==============================================================================
-- Returns based on the specified language (eg. de-at, zh-cn, ...)
-- the application id of the translated application.
--==============================================================================
function get_translated_application_id (
    p_application_id in number   default wwv_flow.g_flow_id,
    p_language       in varchar2 default wwv_flow.g_browser_language )
    return number;

procedure set_translated_flow_and_page
    ---------------------------------
    --- SET NATIONAL LANGUAGE SUPPORT
    --  The language is determined from the browser
    --  this procedure sets:
    --  1. wwv_flow.g_translated_flow_id
    --  2. wwv_flow.g_translated_page_id
    --
   ;

--
-- Given an Oracle datbase character set, return the corresponding
-- IANA character set.  For example, given DB character set
-- of 'JA16SJIS', return 'shift_jis'.
--
-- If not found, will return NULL.
--
function map_iana_charset(
    p_db_charset in varchar2 )
    return varchar2;


--
-- Given an IANA character set, return the corresponding
-- Oracle database character set.  For example, given IANA
-- character set 'windows-1257', return 'BLT8MSWIN1257'.
--
-- If not found, will return NULL.
--
function map_db_charset(
    p_iana_charset in varchar2 )
    return varchar2;

--
-- Initialize the NLS settings for the current
-- database session to that of the database and
-- also set the cached variables so this isn't
-- unnecessarily executed again
--
procedure reset_nls;


--
-- Return the value of the NLS_LANGUAGE which
-- was set in the current session
--
function get_nls_language return varchar2;


--
-- Return the value of the NLS Windows Charset which
-- was set in the current session.  Typically used for
-- CSV encoding
--
function get_nls_windows_charset return varchar2;


--
-- Return the target character set for CSV data in the
-- current application.  A null value returned from this function
-- means that either application language derived from is set to
-- No NLS (application not translated) or that the csv_encoding
-- flag of wwv_flows is not turned on.  Otherwise, the non-null
-- value will be an Oracle character set to be used as the target
-- character set which CSV data is to be converted to
--
function get_csv_charset return varchar2;


--==============================================================================
-- Return the database characterset from nls_database_parameters
--==============================================================================
function get_db_charset
    return varchar2;

--==============================================================================
-- Return the database territory from nls_database_parameters
--==============================================================================
function get_db_territory
    return varchar2;


--
-- Check for the application-level date format setting
-- and adjust the database session NLS_DATE_FORMAT parameter
--
procedure set_application_dt_tz_formats;



--==============================================================================
-- Sets the time zone in the format +HH:MI or -HH:MI.
-- For example -02:00 for CEST or -05:30 for IST.
--==============================================================================
procedure set_session_time_zone( p_time_zone in varchar2 );

procedure set_g_session_time_zone( p_time_zone in varchar2 );

function get_g_session_time_zone( p_format in boolean default false ) return varchar2;

procedure reset_session_time_zone( p_force in boolean default FALSE );




--==============================================================================
-- Sets the session language
-- For example de or en-us
--==============================================================================
procedure set_session_lang( p_lang in varchar2 );

procedure set_g_session_lang( p_lang in varchar2 );

function get_g_session_lang return varchar2;

procedure reset_session_lang;

--==============================================================================
procedure set_session_lang_cookie (
    p_lang      in varchar2 default null,
    p_territory in varchar2 default null );

--==============================================================================
function get_session_lang_from_cookie return varchar2;

--==============================================================================
function get_session_terr_from_cookie return varchar2;


--
-- Territory specific
---
procedure set_session_territory( p_territory in varchar2 );

procedure set_g_session_territory( p_territory in varchar2 );

function get_g_session_territory return varchar2;

procedure reset_session_territory;

function get_nls_territory_from_lang( p_lang in varchar2 ) return varchar2;

function get_nls_time_format return varchar2;

--==============================================================================
-- Generates a HTML page with the necessary Javascript code to automatically
-- detect the time zone based on the operating system setting.
--==============================================================================
procedure auto_detect_time_zone;

procedure increment_seed_changed_attrs;

procedure seed_translations (
    p_flow_id              in varchar2 default null,
    p_language             in varchar2 default null,
    p_insert_only          in varchar2 default 'NO' );

--==============================================================================
-- Create a language mapping for the specified application. A mapping
-- includes the target application ID and the language code
-- (e.g., de, en-us, etc.)
--==============================================================================
procedure create_language_mapping(
    p_application_id             in number,
    p_language                   in varchar2,
    p_translation_application_id in number,
    p_direction_right_to_left    in boolean  default null,
    p_image_directory            in varchar2 default null );


procedure update_language_mapping(
    --
    -- Update the mapping for specified application and language.  Only the mapping to the new translation
    -- ID can be updated.  The language cannot be updated.
    --
    p_application_id             in number,
    p_language                   in varchar2,
    p_new_trans_application_id   in number);


procedure delete_language_mapping(
    --
    -- Delete a language mapping for the specified application and language.
    --
    p_application_id in number,
    p_language       in varchar2);

--==============================================================================
function get_language_selector_list
   return varchar2;

end wwv_flow_lang;
/
show errors
