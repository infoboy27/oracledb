set define '^' verify off
prompt ...wwv_flow_blueprint_v3


create or replace package wwv_flow_blueprint_v3
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_blueprint_v3.plb
--
--    DESCRIPTION
--      Provide JSON support to create application wizard
--
--    RUNTIME DEPLOYMENT:
--
--    MODIFIED  (MM/DD/YYYY)
--     mhichwa   03/13/2017 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global types
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------

--==============================================================================
-- Parses blueprint JSON AI gives,
-- and converts it into a fully corrected version.
-- This is used to safeguard the JSON input AI provides.
--==============================================================================
function to_blueprint_json (
    p_ai_json    in clob )
    return clob;

--==============================================================================
-- Emits template JSON for AI to use and generate
-- create app wizard blueprint JSON
--==============================================================================
function get_ai_template_json
    return clob;

--==============================================================================
-- Emits sample quick actions in JSON array format
--==============================================================================
function get_ai_sample_actions (
    p_schema in varchar2 )
    return clob;

--==============================================================================
-- Takes data out of session state and collections and returns
-- a JSON document.  JSON notation is all camel case and uses
-- friendly names.
--==============================================================================
function gen_json (
    p_built_with_love         in varchar2 default null, -- P5_BUILT_WITH_LOVE
    p_learn_app_def           in varchar2 default null, -- P5_LEARN_YN
    p_app_name                in varchar2 default null, -- P1_APP_NAME
    p_app_short_desc          in varchar2 default null, -- P5_APP_SHORT_DESC
    p_app_desc                in varchar2 default null, -- P5_APP_DESC
    p_features                in varchar2 default null, -- P1_FEATURES
    p_theme_style             in varchar2 default null, -- P1_THEME_STYLE
    p_nav_position            in varchar2 default null, -- P1_NAV_POSITION
    p_app_icon_class          in varchar2 default null, -- P1_APP_ICON_CLASS
    p_app_color_class         in varchar2 default null, -- P1_APP_COLOR_CLASS
    p_app_color_hex           in varchar2 default null, -- P1_APP_COLOR_HEX
    p_base_table_prefix       in varchar2 default null, -- P5_BASE_TABLE_PREFIX
    p_primary_language        in varchar2 default null, -- P1_PRIMARY_LANGUAGE
    p_translated_langs        in varchar2 default null, -- P1_TRANSLATED_LANGS
    p_authentication          in varchar2 default null, -- P1_AUTHENTICATION
    p_app_version             in varchar2 default null, -- P5_APP_VERSION
    p_app_logging             in varchar2 default null, -- P5_APP_LOGGING
    p_app_debugging           in varchar2 default null, -- P5_APP_DEBUGGING
    p_date_format             in varchar2 default null, -- P5_DATE_FORMAT
    p_date_time_format        in varchar2 default null, -- P5_DATE_TIME_FORMAT
    p_timestamp_format        in varchar2 default null, -- P5_TIMESTAMP_FORMAT
    p_timestamp_tz_format     in varchar2 default null, -- P5_TIMESTAMP_TZ_FORMAT
    p_deep_linking            in varchar2 default null, -- P5_DEEP_LINKING
    p_max_session_length      in number   default null, -- P5_MAX_SESSION_LENGTH
    p_max_session_idle_time   in number   default null, -- P5_MAX_SESSION_IDLE_TIME
    p_schema                  in varchar2 default null  -- P1_SCHEMA
    ) return clob
    ;

--==============================================================================
-- This procedure populates collection and returns via out variables
-- to session state required to fully load a JSON model into the create
-- app wizard.
--==============================================================================
procedure get_session_state_from_json (
    p_json_blueprint          in  clob    default null,  -- P150_JSON_BLUEPRINT
    --
    p_raise_error             in  boolean default false,
    --
    p_schema                  out varchar2,              -- P1_SCHEMA
    p_built_with_love         out varchar2,              -- P5_BUILT_WITH_LOVE
    p_learn_app_def           out varchar2,              -- P5_LEARN_YN
    p_app_name                out varchar2,              -- P1_APP_NAME
    p_app_short_desc          out varchar2,              -- P5_APP_SHORT_DESC
    p_app_desc                out varchar2,              -- P5_APP_DESC
    p_features                out varchar2,              -- P1_FEATURES
    p_theme_style             out varchar2,              -- P1_THEME_STYLE
    p_nav_position            out varchar2,              -- P1_NAV_POSITION
    p_app_icon_class          out varchar2,              -- P1_APP_ICON_CLASS
    p_app_color_class         out varchar2,              -- P1_APP_COLOR_CLASS
    p_app_color_hex           out varchar2,              -- P1_APP_COLOR_HEX
    p_base_table_prefix       out varchar2,              -- P5_BASE_TABLE_PREFIX
    p_primary_language        out varchar2,              -- P1_PRIMARY_LANGUAGE
    p_translated_langs        out varchar2,              -- P1_TRANSLATED_LANGS
    p_authentication          out varchar2,              -- P1_AUTHENTICATION
    p_app_version             out varchar2,              -- P5_APP_VERSION
    p_app_logging             out varchar2,              -- P5_APP_LOGGING
    p_app_debugging           out varchar2,              -- P5_APP_DEBUGGING
    p_date_format             out varchar2,              -- P5_DATE_FORMAT
    p_date_time_format        out varchar2,              -- P5_DATE_TIME_FORMAT
    p_timestamp_format        out varchar2,              -- P5_TIMESTAMP_FORMAT
    p_timestamp_tz_format     out varchar2,              -- P5_TIMESTAMP_TZ_FORMAT
    p_deep_linking            out varchar2,              -- P5_DEEP_LINKING
    p_max_session_length      out number,                -- P5_MAX_SESSION_LENGTH
    p_max_session_idle_time   out number                 -- P5_MAX_SESSION_IDLE_TIME
    );

--==============================================================================
--  Saves the blueprint to a table for later use.
--  The blueprint is converted to JSON then put into
--  a CLOB into the WWV_FLOW_BLUEPRINT_REPO table.
--==============================================================================
procedure save_blueprint (
    p_built_with_love         in varchar2 default null, -- P5_BUILT_WITH_LOVE
    p_learn_app_def           in varchar2 default null, -- P5_LEARN_YN
    p_app_name                in varchar2 default null, -- P1_APP_NAME
    p_app_short_desc          in varchar2 default null, -- P5_APP_SHORT_DESC
    p_app_desc                in varchar2 default null, -- P5_APP_DESC
    p_features                in varchar2 default null, -- P1_FEATURES
    p_theme_style             in varchar2 default null, -- P1_THEME_STYLE
    p_nav_position            in varchar2 default null, -- P1_NAV_POSITION
    p_app_icon_class          in varchar2 default null, -- P1_APP_ICON_CLASS
    p_app_color_class         in varchar2 default null, -- P1_APP_COLOR_CLASS
    p_app_color_hex           in varchar2 default null, -- P1_APP_COLOR_HEX
    p_base_table_prefix       in varchar2 default null, -- P5_BASE_TABLE_PREFIX
    p_primary_language        in varchar2 default null, -- P1_PRIMARY_LANGUAGE
    p_translated_langs        in varchar2 default null, -- P1_TRANSLATED_LANGS
    p_authentication          in varchar2 default null, -- P1_AUTHENTICATION
    p_app_version             in varchar2 default null, -- P5_APP_VERSION
    p_app_logging             in varchar2 default null, -- P5_APP_LOGGING
    p_app_debugging           in varchar2 default null, -- P5_APP_DEBUGGING
    p_date_format             in varchar2 default null, -- P5_DATE_FORMAT
    p_date_time_format        in varchar2 default null, -- P5_DATE_TIME_FORMAT
    p_timestamp_format        in varchar2 default null, -- P5_TIMESTAMP_FORMAT
    p_timestamp_tz_format     in varchar2 default null, -- P5_TIMESTAMP_TZ_FORMAT
    p_deep_linking            in varchar2 default null, -- P5_DEEP_LINKING
    p_max_session_length      in number   default null, -- P5_MAX_SESSION_LENGTH
    p_max_session_idle_time   in number   default null, -- P5_MAX_SESSION_IDLE_TIME
    p_page_count              in number   default null, -- compute from collection
    p_feature_count           in number   default null) -- compute from array)
    ;

--==============================================================================
-- Loads saved blueprint JSON
--==============================================================================
function load_blueprint (
    p_blueprint_id      in number,
    p_app_user          in varchar2 default null,
    p_security_group_id in number   default null )
    return clob;

--==============================================================================
-- Deletes saved blueprint
--==============================================================================
procedure remove_blueprint (
    p_blueprint_id      in number,
    p_app_user          in varchar2 default null,
    p_security_group_id in number   default null );

end wwv_flow_blueprint_v3;
/
show errors
