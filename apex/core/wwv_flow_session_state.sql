set define '^' verify off
prompt ...wwv_flow_session_state.sql
create or replace package wwv_flow_session_state authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_session_state.sql
--
--    DESCRIPTION
--      This package encapsulates all access to session state (wwv_flow_data)
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    04/05/2012 - Created
--
--------------------------------------------------------------------------------

c_deep_link_item_name       constant varchar2(30) := 'FSP_AFTER_LOGIN_URL';
c_saml_metadata_item_name   constant varchar2(30) := 'APP_SAML_AUTH_METADATA';
c_ext_session_item_name     constant varchar2(30) := 'APP_EXT_BUILDER_SESSION_ID';
c_ai_consent_item_name      constant varchar2(30) := 'APP_AI_CONSENT_GIVEN_YN';
c_social_metadata_item_name constant varchar2(30) := 'APP_SOCIAL_AUTH_METADATA';

--=================================================================================================================
-- modes for how we can escape substitution variables
--=================================================================================================================
subtype t_escape_mode is wwv_flow_session_state_api.t_escape_mode;

c_escape_mode_raw            constant t_escape_mode := wwv_flow_session_state_api.c_escape_mode_raw;
c_escape_mode_html           constant t_escape_mode := wwv_flow_session_state_api.c_escape_mode_html;
c_escape_mode_html_attribute constant t_escape_mode := wwv_flow_session_state_api.c_escape_mode_html_attribute;
c_escape_mode_javascript     constant t_escape_mode := wwv_flow_session_state_api.c_escape_mode_javascript;
c_escape_mode_striphtml      constant t_escape_mode := wwv_flow_session_state_api.c_escape_mode_striphtml;
c_escape_mode_json           constant t_escape_mode := wwv_flow_session_state_api.c_escape_mode_json;

--==============================================================================
-- type for tuple of substitution name and escape mode
--==============================================================================
type t_substitution is record (
    pattern        varchar2(32767),
    name           varchar2(32767),
    escape_mode    t_escape_mode default c_escape_mode_raw,
    has_escape_tag boolean       default false );

--==============================================================================
-- type for replacing multiple substitution strings
--
-- SEE ALSO
--   * init_applier, reset_applier, advance, apply_and_advance
--==============================================================================
type t_map_v2_int        is table of pls_integer index by varchar2(32767);
type t_applier_text_part is record (
    first_text_idx       pls_integer,
    text_before          varchar2(32767),
    pattern_idx          pls_integer,
    substitution         t_substitution );
type t_applier_text_parts is table of t_applier_text_part index by pls_integer;
type t_substitution_applier is record (
    found                boolean,                -- true if substitution pattern was found
    text                 varchar2(32767),        -- result text
    substitution         t_substitution,         -- the substitution pattern
    pattern_idx          pls_integer,            -- index of substitution.name in patterns
    patterns             wwv_flow_t_varchar2,    -- start patterns
    patterns_count       pls_integer,            -- patterns.count
    --
    parsed_texts         t_map_v2_int,           -- text -> index of first text_parts element
    first_text_idx       pls_integer,
    current_idx          pls_integer,            -- current index into text_parts
    text_parts           t_applier_text_parts ); -- all parsed text parts

--==============================================================================
-- map of t_value indexed by bind id
-- for use in set_component_values
--==============================================================================
type t_value_map is table of wwv_flow_session_state_api.t_value index by varchar2(255);

c_empty_t_value_map constant t_value_map := t_value_map();

--==============================================================================
-- disable all read/write access to session state. after calling this procedure,
-- all APIs of wwv_flow_session_state except for enable() will raise an error.
--==============================================================================
procedure disable_access;

--==============================================================================
-- enable read/write access to session state. by default, access is enabled.
--==============================================================================
procedure enable_access;

--==============================================================================
-- Return whether session state access is enabled.
--==============================================================================
function is_access_enabled
    return boolean;

--==============================================================================
-- split p_pattern into a name part and substitution mode part. they are
-- separated by "!". valid substitution mode strings are
--
-- - !RAW .... c_escape_mode_raw
-- - !HTML ... c_escape_mode_html
-- - !ATTR ... c_escape_mode_html_attribute
-- - !JS ..... c_escape_mode_javascript
--
-- the function assumes that the input string still contains the surrounding
-- substitution characters (& and . for items, # and # for columns)
--==============================================================================
function parse_substitution (
    p_pattern        in varchar2,
    p_pattern_length in pls_integer,
    p_default_mode   in t_escape_mode )
    return t_substitution;

--==============================================================================
-- overloaded version that extracts the pattern from p_text
--==============================================================================
function parse_substitution (
    p_text           in varchar2,
    p_pattern_start  in pls_integer,
    p_pattern_end    in pls_integer,
    p_default_mode   in t_escape_mode )
    return t_substitution;

--==============================================================================
-- returns p_value, thereby escaping the value based on p_substitution.escape_mode.
--
-- ARGUMENTS
-- * p_substitution           parsed substitution pattern (see parse_substitution above)
-- * p_value                  replacement value
-- * p_fix_html_double_escape LEGACY - DO NOT USE IN NEW CODE
--                            if true, try to fix html double escaping. the default is false.
--==============================================================================
function escaped_value (
    p_substitution           in t_substitution,
    p_value                  in varchar2,
    p_fix_html_double_escape in boolean default false )
    return varchar2;

--==============================================================================
-- replace the substitution pattern in p_text with p_value, thereby escaping
-- the value based on p_substitution.escape_mode.
--
-- ARGUMENTS
-- * p_text                   text where substitution should occur
-- * p_substitution           parsed substitution pattern (see parse_substitution above)
-- * p_value                  replacement value
-- * p_fix_html_double_escape LEGACY - DO NOT USE IN NEW CODE
--                            if true, try to fix html double escaping. the default is false.
--==============================================================================
procedure substitute (
    p_text                   in out nocopy varchar2,
    p_substitution           in t_substitution,
    p_value                  in varchar2,
    p_fix_html_double_escape in boolean default false );

--==============================================================================
-- init a substitution applier. this gives you an "object" that can be used to
-- do template substitutions. you give it patterns, start and end characters and
-- after initialization, the applier can be used multiple times.
--
-- ARGUMENTS
-- * p_this       the applier record
-- * p_names      table of varchar2 that contains start patterns
-- * p_start_char the start character for a pattern
-- * p_end_char   the end character of a pattern
--
-- EXAMPLE
--   the example below initializes an applier record and then uses it to apply
--   substitutions in a text.
--
--   declare
--       l_applier wwv_flow_session_state.t_substitution_applier;
--       l_names   wwv_flow_t_varchar2 := wwv_flow_t_varchar2('FOO'  , 'BAR');
--       l_values  wwv_flow_t_varchar2 := wwv_flow_t_varchar2('Hello', '<World>');
--       l_text    varchar2(32767)     := '#FOO#, #BAR!HTML#!';
--   begin
--       wwv_flow_session_state.init_applier (
--           p_this  => l_applier,
--           p_names => l_names );
--       wwv_flow_session_state.start_applier (
--           p_this => l_applier,
--           p_text => l_text );
--       while l_applier.found loop
--           wwv_flow_session_state.apply_and_advance (
--               p_this  => l_applier,
--               p_value => l_values(l_applier.pattern_idx) );
--       end loop;
--       dbms_output.put_line(l_applier.text);
--       --
--       -- output: Hello, &lt;World&gt;!
--  end;
--==============================================================================
procedure init_applier (
    p_this       in out nocopy t_substitution_applier,
    p_names      in wwv_flow_t_varchar2 );
procedure init_applier (
    p_this       in out nocopy t_substitution_applier,
    p_names      in wwv_flow_global.vc_arr2 );

--==============================================================================
-- see init_applier
--==============================================================================
procedure start_applier (
    p_this      in out nocopy t_substitution_applier,
    p_text      in varchar2 );

--==============================================================================
-- see init_applier
--==============================================================================
procedure advance (
    p_this      in out nocopy t_substitution_applier );

--==============================================================================
-- see init_applier
--==============================================================================
procedure apply_and_advance (
    p_this                   in out nocopy t_substitution_applier,
    p_value                  in varchar2,
    p_fix_html_double_escape in boolean default false );

--==============================================================================
-- helper procedure to reset the package global session state
--==============================================================================
procedure reset;

--==============================================================================
-- Write any pending changes.
--==============================================================================
procedure flush_changes;

--==============================================================================
-- helper for wwv_flow.clear_page_cache
--
-- Reset all cached items for a given page to null
--==============================================================================
procedure clear_state_for_page (
    p_page_id in number default null);

--==============================================================================
-- For the current session remove session state for the given flow.  Requires
-- wwv_flow_security.g_instance to be set to the current session.
--==============================================================================
procedure clear_state_for_application (
    p_application_id in varchar2 );

--==============================================================================
-- ...
--==============================================================================
procedure clear_state_for_user;

--==============================================================================
-- Remove session state by region IDs in the current session.
--==============================================================================
procedure clear_state_for_ids (
    p_region_ids in wwv_flow_t_number );

--==============================================================================
-- remove session state by item id, for all sessions
--==============================================================================
procedure clear_all_state_for_id (
    p_item_id        in number,
    p_application_id in number default wwv_flow_security.g_flow_id );

--==============================================================================
-- remove session state by item name, for all sessions
--==============================================================================
procedure clear_all_state_for_name (
    p_item_name         in varchar2,
    p_application_id    in number    default wwv_flow_security.g_flow_id,
    p_security_group_id in number    default wwv_flow_security.g_security_group_id );

--==============================================================================
-- same as clear_all_state_for_name, but in autonomous transaction
--==============================================================================
procedure clear_all_state_for_name_aut (
    p_item_name         in varchar2,
    p_application_id    in number    default wwv_flow_security.g_flow_id,
    p_security_group_id in number    default wwv_flow_security.g_security_group_id );

--==============================================================================
-- Compare two t_values.
--
-- Arguments:
-- * p_value1: First value
-- * p_value2: Second value
--
-- Returns:
-- * null: Both p_value1 and p_value2 are null
-- * true: p_value1 is equal to p_value2
-- * false: p_value1 is not equal to p_value2
--==============================================================================
function compare (
    p_value1 in wwv_flow_session_state_api.t_value,
    p_value2 in wwv_flow_session_state_api.t_value )
    return boolean;

--==============================================================================
-- ...
--==============================================================================
procedure save_deferred_session_vals;
--==============================================================================
-- ...
--==============================================================================
function get_deferred_session_val_id (
    p_string in varchar2 )
    return number;

--==============================================================================
-- return if p_item_name is the name of a global item
--==============================================================================
function is_builtin_global_item_name (
    p_item_name in varchar2 )
    return boolean;

--==============================================================================
-- Set global session state (i.e. independent of application, e.g. deep link)
--==============================================================================
procedure set_builtin_global_item_value (
    p_item_name in varchar2,
    p_value     in varchar2,
    p_commit    in boolean default true );

--==============================================================================
-- Get "id" for global session state item
--==============================================================================
function get_global_item_id (
    p_item_name in varchar2 )
    return number;

--==============================================================================
-- Get global session state (i.e. independent of application, e.g. deep link)
--==============================================================================
function get_builtin_global_item_value (
    p_item_name         in varchar2,
    p_session_id        in number default wwv_flow_security.g_instance )
    return varchar2;

--==============================================================================
-- Save item to session state (ignoring the substitution cache) and commit if
-- p_commit is true
--==============================================================================
procedure save_nocache (
    p_item_id        in number,
    p_item_scope     in wwv_flow_meta_data.t_item_scope,
    p_item_name      in varchar2,
    p_item_value     in varchar2,
    p_item_filter    in varchar2                               default 'N',
    p_is_encrypted   in varchar2                               default 'N',
    p_data_type      in wwv_flow_session_state_api.t_data_type default wwv_flow_session_state_api.c_data_type_varchar2,
    p_application_id in number                                 default wwv_flow_security.g_flow_id,
    p_commit         in boolean                                default true,
    p_session_id     in number                                 default wwv_flow_security.g_instance );
--==============================================================================
procedure save_nocache (
    p_item_id        in number,
    p_item_scope     in wwv_flow_meta_data.t_item_scope,
    p_item_name      in varchar2,
    p_item_value     in wwv_flow_session_state_api.t_value,
    p_item_filter    in varchar2                            default 'N',
    p_is_encrypted   in varchar2                            default 'N',
    p_application_id in number                              default wwv_flow_security.g_flow_id,
    p_commit         in boolean                             default true,
    p_session_id     in number                              default wwv_flow_security.g_instance );

--==============================================================================
-- Save session state to plsql memory cache and database.
--
-- p_item           = application or page item
-- p_item_value     = value of item to be stored as session state
-- p_external_input = if true, escape input
-- p_commit         = perform commit if true
--==============================================================================
procedure save (
    p_item              in wwv_flow_meta_data.t_item_properties,
    p_item_value        in wwv_flow_session_state_api.t_value,
    p_external_input    in boolean,
    p_commit            in boolean default true );

--==============================================================================
-- Save session state to plsql memory cache and database.
--
-- p_item_id        = id of application or page item
-- p_item_value     = value of item to be stored as session state
-- p_external_input = if true, escape input
-- p_commit         = perform commit if true
--==============================================================================
procedure save_by_id (
    p_item_id           in number,
    p_item_value        in varchar2,
    p_external_input    in boolean default false,
    p_commit            in boolean default true );
--==============================================================================
procedure save_by_id (
    p_item_id           in number,
    p_item_value        in wwv_flow_session_state_api.t_value,
    p_external_input    in boolean default false,
    p_commit            in boolean default true );

--==============================================================================
-- Save session state to plsql memory cache and database.
--
-- item_name        = name of application or page item
-- item_value       = value of item to be stored as session state
-- p_external_input = if true, escape input
-- p_commit         = perform commit if true
--==============================================================================
procedure save_by_name (
    p_item_name         in varchar2,
    p_item_value        in varchar2,
    p_external_input    in boolean default false,
    p_commit            in boolean default true );
--==============================================================================
procedure save_by_name (
    p_item_name         in varchar2,
    p_value             in wwv_flow_session_state_api.t_value,
    p_external_input    in boolean default false,
    p_commit            in boolean default true );

--==============================================================================
-- Return if p_name is part of the component value map
--==============================================================================
function has_component_value (
    p_name in varchar2 )
    return boolean;

--==============================================================================
-- Sets the component specific values which can then be used as bind variables,
-- substitution values, ...
-- p_value_map is index by the uppercase column names of the component.
-- p_append    flag indicating whether to add the values to the existing
--             collection or whether to first reset it
--
-- Note: Always call clear_component_values after a row of your component has
--       been processed to make sure that these values are not accidentially
--       used outside your component. Don't forget about the exception handler!!
--==============================================================================
procedure set_component_values (
    p_value_map in t_value_map,
    p_append    in boolean default false );

--==============================================================================
-- Legacy version of set_component_values, based on a wwv_flow_global.vc_map
--==============================================================================
procedure set_component_values (
    p_value_map in wwv_flow_global.vc_map,
    p_append    in boolean default false );

--==============================================================================
-- Returns the component specific values. These values can change if the bind
-- variable was used as an assignment target.
-- p_value_map is index by the uppercase column names of the component.
--==============================================================================
function get_component_values
    return t_value_map;

--==============================================================================
-- Clears the component specific values which can then be used as bind variables,
-- substitution values, ...
--
-- This procedure should always be called after a row of your component has
-- been processed to make sure that these values are not accidentially
-- used outside your component. Don't forget about the exception handler to call
-- this procedure there as well!!
--==============================================================================
procedure clear_component_values;

--==============================================================================
-- Update the cache of session state maintained in a pl/sql table.
--
-- p_name      = name of the application or page item
-- p_value     = Session state value for the item
--==============================================================================
procedure set_substitution_cache_byname (
    p_name       in varchar2,
    p_value      in wwv_flow_session_state_api.t_value );

--==============================================================================
-- Update the cache of session state maintained in a pl/sql table.
-- This procedure does not write the change to disk.
--
-- p_id        = ID of the application or page item
-- p_value     = Session state value for the item
-- p_name      = name of the application or page item
-- p_filter    = filter value of the item (escape on http output)
-- p_encrypted = encrypted (Y/N) flag of the item
--==============================================================================
procedure set_substitution_cache (
    p_id         in number,
    p_value      in wwv_flow_session_state_api.t_value,
    p_name       in varchar2 default null,
    p_filter     in varchar2 default null,
    p_encrypted  in varchar2 default null );

--==============================================================================
-- fetch all of the application's session state into the substitution cache,
-- i.e. the wwv_flow.g_substitution_item% variables.
--==============================================================================
procedure fetch_into_substitution_cache (
    p_exact_substitutions_only in boolean );

--==============================================================================
-- utility to substitute "&ITEM."
--
-- part of do_substitutions but exposed for backwards compatibility, since it
-- is used in wwv_flow_utilities.parse.
--==============================================================================
procedure do_exact_item_substitutions (
    p_string                     in out nocopy varchar2,
    p_search_start_pos           in            pls_integer,
    p_escape_mode                in            t_escape_mode,
    p_skip_items                 in            wwv_flow_t_varchar2 default null );

--==============================================================================
-- for a substitutions in the string, extract the item or column names
--==============================================================================
procedure do_serveronly_substitutions(
    p_string                     in out nocopy varchar2,
    p_client_substitution_names  in out nocopy wwv_flow_t_varchar2,
    p_query_columns              in            wwv_flow_exec_api.t_columns default wwv_flow_exec_api.c_empty_columns,
    p_escape_mode                in            t_escape_mode,
    p_skip_items                 in            wwv_flow_t_varchar2         default null );

--==============================================================================
-- function version of do_serveronly_substitutions proc, without out params
--==============================================================================
function do_serveronly_substitutions (
    p_string        in varchar2,
    p_escape_mode   in t_escape_mode )
    return varchar2;

--==============================================================================
-- perform serverside only substitutions on a string with escape mode RAW
--==============================================================================
function do_serveronly_subs_raw (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
-- perform serverside only substitutions on a string with escape mode HTML
--==============================================================================
function do_serveronly_subs_html (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
-- replace generic #xxx# values in p_str
--
-- part of do_substitutions, but can also be used to replace the xxxIMAGExxx
-- and xxxOWNERxxx values.
--==============================================================================
procedure do_hash_substitutions (
    p_str       in out nocopy varchar2,
    p_start_pos in binary_integer default null );

--==============================================================================
-- substitute &ITEM. and &ITEM (if wwv_flow.g_exact_substitutions_only = 'N')
-- and #HASH#.
--
-- PARAMETERS
--   * p_string:      Input string which contains substitution parameters.
--   * p_escape_mode: Default mode of escaping for values.
--   * p_skip_items:  List of items that should not be escaped.
--==============================================================================
function do_substitutions (
    p_string      in varchar2,
    p_escape_mode in t_escape_mode,
    p_skip_items  in wwv_flow_t_varchar2 )
    return varchar2;
function do_substitutions (
    p_string      in varchar2,
    p_escape_mode in t_escape_mode )
    return varchar2;

--==============================================================================
-- overloaded do_substitutions with p_escape_mode=c_escape_mode_raw
--==============================================================================
function do_raw_substitutions (
    p_string      in varchar2,
    p_skip_items  in wwv_flow_t_varchar2 )
    return varchar2;
function do_raw_substitutions (
    p_string      in varchar2 )
    return varchar2;

--==============================================================================
-- overloaded do_substitutions with p_escape_mode=c_escape_mode_html
--==============================================================================
function do_html_substitutions (
    p_string      in varchar2,
    p_skip_items  in wwv_flow_t_varchar2 )
    return varchar2;
function do_html_substitutions (
    p_string      in varchar2 )
    return varchar2;

--==============================================================================
-- return flow value (formerly stand-alone v function)
--
-- This program allows you to reference flow variables using
-- v('FLOW_VAR') syntax.  This prevents the shared pool from
-- filling up and running out of enqueues when running with
-- large numbers of concurrent users.
--
-- p_item_id                Case insensitive name of the item for which you
--                          wish to have the session state fetched.
-- p_flow                   Identifies the flow ID
-- p_session_and_user_scope If true (default), will look in session state in both
--                          the session cache and in the user cache.
--                          otherwise, will look only in the session cache and will
--                          omit looking for this value in the user cache.
--                          SESSION caching is caching of session state of an
--                          item value for a flows session.  User caching is
--                          the caching of an item value for a user over all
--                          sessions for that user.
--==============================================================================
function v (
    p_item                   in varchar2,
    p_flow                   in number        default null,
    p_session_and_user_scope in boolean       default true,
    p_escape                 in t_escape_mode default c_escape_mode_raw,
    p_always_escape          in boolean       default false )
    return varchar2;

--==============================================================================
-- return flow value
--
-- This program allows you to reference flow variables using
-- v('FLOW_VAR') syntax.  This prevents the shared pool from
-- filling up and running out of enqueues when running with
-- large numbers of concurrent users.
--
-- p_item_id                Case insensitive name of the item for which you
--                          wish to have the session state fetched.
-- p_flow                   Identifies the flow ID
-- p_session_and_user_scope If true (default), will look in session state in both
--                          the session cache and in the user cache.
--                          otherwise, will look only in the session cache and will
--                          omit looking for this value in the user cache.
--                          SESSION caching is caching of session state of an
--                          item value for a flows session.  User caching is
--                          the caching of an item value for a user over all
--                          sessions for that user.
--==============================================================================
function get_value (
    p_item                   in varchar2,
    p_flow                   in number        default null,
    p_session_and_user_scope in boolean       default true,
    p_escape                 in t_escape_mode default c_escape_mode_raw,
    p_always_escape          in boolean       default false )
    return wwv_flow_session_state_api.t_value;

--==============================================================================
-- Given a flow-level item name, locate item in current or specified
-- application and current or specified session and return item value.
--
--
-- Security:
--    Caller must be a package,procedure, or function whose
--    owner can be identified by owa_util.who_called_me.
--    This owner will be used to find the security_group_id
--    associated with that schema.
--==============================================================================
function get_item_value (
    p_item         in varchar2,
    p_flow         in number default wwv_flow_security.g_flow_id,
    p_instance     in number default wwv_flow_security.g_instance )
    return varchar2;

--==============================================================================
-- internal helper routine to get an item value by item_id
--
-- ARGUMENTS
-- * p_item_id:            id of the item
-- * p_deferred_item_only: if true, ensure that the item has been saved with
--                         get_deferred_session_val_id and return null
--                         otherwise. see wwv_flow_utilities.gen_popup_list.
-- * p_use_cache:          if true, look at g_substitution_item% cache first.
-- * p_session_id:         session id, defaults to current session
--==============================================================================
function fetch_value_by_id (
    p_item_id            in number,
    p_deferred_item_only in boolean default false,
    p_use_cache          in boolean default false,
    p_session_id         in number  default wwv_flow_security.g_instance )
    return varchar2;

--==============================================================================
function fetch_t_value_by_id (
    p_item_id            in number,
    p_deferred_item_only in boolean default false,
    p_use_cache          in boolean default false,
    p_session_id         in number  default wwv_flow_security.g_instance )
    return wwv_flow_session_state_api.t_value;

--==============================================================================
-- internal helper routine to get a numeric item value by item_id
--==============================================================================
function fetch_num_value_by_id (
    p_item_id in number )
    return number;

--==============================================================================
-- internal helper routine to return the changed status
-- (wwv_flow_data.session_state_status)
--==============================================================================
function get_status (
    p_item_properties in wwv_flow_meta_data.t_item_properties )
    return wwv_flow_data.session_state_status%type;

--==============================================================================
-- internal helper routine to return if any session_state_status is 'U'
-- if p_application_id is null, the application id is ignored
--==============================================================================
function is_status_changed (
    p_application_id in number )
    return boolean;

--==============================================================================
-- Given a session state value, return a suitable value for logging. This
-- returns '***' if the value is encrypted and should not be logged.
--==============================================================================
function log_value (
    p_value_vc2    in varchar2,
    p_value_clob   in clob default null,
    p_is_encrypted in boolean default true )
    return varchar2;
function log_value (
    p_value        in wwv_flow_session_state_api.t_value,
    p_is_encrypted in boolean default true )
    return varchar2;

--==============================================================================
-- internal helper for wwv_flow_data_view
--==============================================================================
function get_decrypted_value_for_query (
    p_application_id  in number,
    p_item_name       in varchar2,
    p_item_value_vc2  in varchar2,
    p_item_value_clob in clob )
    return varchar2;

--##############################################################################
--#
--# CHECKING FOR UNDEFINED ITEMS
--#
--##############################################################################

--==============================================================================
-- Register item names that should not be reported as undefined, with
-- check_undefined.
--==============================================================================
procedure whitelist_undefined (
    p_item_names in wwv_flow_t_varchar2 );

--==============================================================================
-- Warn if p_item_name references an undefined item. Use whitelist_undefined to
-- white-list items that should not be reported.
--==============================================================================
procedure check_undefined (
    p_item_name in varchar2 );

--==============================================================================
-- Check all items that V() added to the internal list of undefined objects,
-- then reset the list.
--==============================================================================
procedure check_undefined;

--==============================================================================
-- Reset the list of undefined objects.
--==============================================================================
procedure reset_undefined;

--##############################################################################
--#
--# PROTECTED PAGE ITEMS
--#
--##############################################################################

--==============================================================================
-- Used by get_protected_item*
--==============================================================================
type t_protected_items is record (
    salt  varchar2( 4000 ),
    items wwv_flow_t_varchar2 default wwv_flow_t_varchar2() );

--==============================================================================
-- Returns the checksum for a page item value and adds the item name to our
-- internal list of protected page items.
--==============================================================================
function get_protected_item_checksum (
    p_item            in            varchar2,
    p_value           in            varchar2,
    p_protected_items in out nocopy t_protected_items )
    return varchar2;
function get_protected_item_checksum (
    p_item            in            varchar2,
    p_value           in            wwv_flow_session_state_api.t_value,
    p_protected_items in out nocopy t_protected_items )
    return varchar2;
--==============================================================================
-- Overloaded version for page items.
--==============================================================================
function get_protected_item_checksum (
    p_item            in            varchar2,
    p_value           in            wwv_flow_session_state_api.t_value )
    return varchar2;

--==============================================================================
-- Returns the encoded list of protected items set by the get_item_checksum
-- calls.
--==============================================================================
function get_encoded_protected_items (
    p_protected_items in t_protected_items )
    return varchar2;

--==============================================================================
-- Overloaded version for page items.
--==============================================================================
function get_encoded_protected_items
    return varchar2;

--==============================================================================
-- Returns the decoded list of protected items passed in.
--==============================================================================
function get_decoded_protected_items (
    p_encoded_value in varchar2,
    p_salt          in varchar2 )
    return wwv_flow_t_varchar2;

--==============================================================================
procedure init_protected_page_items (
    p_unique_page_id in number );

--==============================================================================
-- Return the number of protected page items.
--==============================================================================
function protected_page_items_count
    return number;

--==============================================================================
-- Setter for page-level salt
--==============================================================================
procedure page_salt (
    p_salt in varchar2 );

--==============================================================================
-- Getter for page-level salt
--==============================================================================
function page_salt
    return varchar2;

--==============================================================================
-- Dummy check to prevent reporting by SQL injection tool
--==============================================================================
function noop_value (
    p_src in wwv_flow_session_state_api.t_value )
    return wwv_flow_session_state_api.t_value;

--==============================================================================
-- Returns the length of a t_value in characters
--==============================================================================
function get_length (
    p_value in wwv_flow_session_state_api.t_value )
    return number;

--==============================================================================
-- Returns the numeric representation of the string session_state_data_type
--==============================================================================
function get_data_type_from_string (
    p_data_type in varchar2 )
    return wwv_flow_session_state_api.t_data_type;

--==============================================================================
-- Returns true if p_value represents a null value
--==============================================================================
function is_null (
    p_value in wwv_flow_session_state_api.t_value )
    return boolean;

--==============================================================================
-- Helper function for converting the legacy vc_map into a t_value_map
-- All members will be mapped to c_data_type_varchar2
--==============================================================================
function vc_map_to_t_value_map (
    p_vc_map in wwv_flow_global.vc_map )
    return t_value_map;

--==============================================================================
-- Helper function for converting a t_value_map into the legacy vc_map
-- All members of p_t_value_map will be treated as varchar2
--==============================================================================
function t_value_map_to_vc_map (
    p_t_value_map in t_value_map )
    return wwv_flow_global.vc_map;

--==============================================================================
-- Constructor for a t_value of data type varchar2
--==============================================================================
function to_varchar2_t_value (
    p_varchar2_value in varchar2 )
    return wwv_flow_session_state_api.t_value;

--==============================================================================
-- Constructor for a t_value of data type clob
--==============================================================================
function to_clob_t_value (
    p_clob_value in clob )
    return wwv_flow_session_state_api.t_value;

--==============================================================================
-- persists in-memory items (is_persistent = 'N') to a different session; this
-- is used as part of a session clone, to also have the non-persistent
-- (in memory) item values in the cloned session
--==============================================================================
procedure persist_in_memory_items(
    p_to_session_id     in number,
    p_commit            in boolean default true );

end wwv_flow_session_state;
/
show err
