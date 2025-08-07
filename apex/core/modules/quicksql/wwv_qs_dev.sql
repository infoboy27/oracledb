set define '^' verify off
prompt ...wwv_qs_dev
create or replace package wwv_qs_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_qs_dev.sql
--
--    DESCRIPTION
--     Primary package that facilitates Quick SQL functionality within APEX
--  
--
--    MODIFIED    (MM/DD/YYYY)
--     neiferna    08/04/2023 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------
-- defaults
c_default_apex_yn                 constant varchar2(1)   := 'Y';
c_default_api_yn                  constant varchar2(1)   := 'N';
c_default_compressed_yn           constant varchar2(1)   := 'N';
c_default_date_datatype           constant varchar2(4)   := 'DATE';
c_default_include_drops_yn        constant varchar2(1)   := 'N';
c_default_inserts_yn              constant varchar2(1)   := 'Y';
c_default_editionable_yn          constant varchar2(1)   := 'N';
c_default_auto_gen_pk_yn          constant varchar2(1)   := 'Y';
c_default_on_delete               constant varchar2(30)  := 'CASCADE';
c_default_trigger_method          constant varchar2(30)  := 'IDENTITY';
c_default_primary_key_yn          constant varchar2(1)   := 'Y';
c_default_prefix_pk_yn            constant varchar2(1)   := 'N';
c_default_semantics               constant varchar2(30)  := 'CHAR';
c_default_created_col_name        constant varchar2(30)  := 'created';
c_default_created_by_col_name     constant varchar2(30)  := 'created_by';
c_default_updated_col_name        constant varchar2(30)  := 'updated';
c_default_updated_by_col_name     constant varchar2(30)  := 'updated_by';

--==============================================================================
-- Functions used to determine availability
--==============================================================================

--==============================================================================
-- Determines if minimum version of ORDS is met
--
--
-- Returns:
-- True/False
--
-- Raises:
-- * REST_WS.CURR_VERSION_NULL: Current ORDS version is null
--
-- Example:
-- Used in authorization scheme QUICKSQL_ORDS_ALLOWED used on 4500:1100.
--
--   return wwv_qs_dev.is_minimum_version;  
--==============================================================================
function is_minimum_version return boolean;

--==============================================================================
-- Functions used for Quick SQL generation
--==============================================================================

--==============================================================================
-- Gets text string for current database version
--
--
-- Returns:
-- Current database version
--
-- Example:
-- Returns database version for current instance -> 19c
--
--   return wwv_qs_dev.get_default_db_version;  
--==============================================================================
function get_default_db_version return varchar2;

--==============================================================================
-- Gets JSON object to supply to quicksqljs translate function
--
--
-- Returns:
-- JSON options object with expected keys and values for quicksqljs
--
-- Example:
-- This returns a JSON object based on the values in 4500:1101 
--
--   declare
--       l_audit_cols   varchar2(1) := 'N';
--       l_row_version  varchar2(1) := 'N';
--       l_row_key      varchar2(1) := 'N';
--   begin
--       if instr (:P1101_ADTL_COLS,'AUDIT_COLS') > 0 then l_audit_cols := 'Y'; end if;
--       if instr (:P1101_ADTL_COLS,'ROW_VERSION') > 0 then l_row_version := 'Y'; end if;
--       if instr (:P1101_ADTL_COLS,'ROW_KEY') > 0 then l_row_key := 'Y'; end if;
--   
--       :P1100_JSON_OPTIONS := wwv_qs_dev.get_options_json (
--           p_apex_yn                 => :P1101_APEX,
--           p_api_yn                  => :P1101_API,
--           p_audit_yn                => l_audit_cols,
--           p_compressed_yn           => :P1101_COMPRESSED,
--           p_date_datatype           => :P1101_DATE_DATATYPE,
--           p_db_version              => :P1101_DB_VERSION,
--           p_include_drops_yn        => :P1101_INCLUDE_DROPS,
--           p_inserts_yn              => :P1101_GENERATE_INSERTS,
--           p_editionable_yn          => :P1101_EDITIONABLE,
--           p_auto_gen_pk_yn          => :P1101_AUTO_GEN_PK,
--           p_table_prefix            => :P1101_TABLE_PREFIX,
--           p_trigger_method          => :P1101_TRIGGER_METHOD,
--           p_prefix_pk_with_tname_yn => :P1101_PREFIX_PK_WITH_TNAME,
--           p_row_key_yn              => l_row_key,
--           p_row_version_yn          => l_row_version,
--           p_schema                  => :P1101_SCHEMA,
--           p_semantics               => :P1101_SEMANTICS,
--           p_created_col             => :P1101_CREATED_COLUMN_NAME,
--           p_created_by_col          => :P1101_CREATED_BY_COLUMN_NAME,
--           p_updated_col             => :P1101_UPDATED_COLUMN_NAME,
--           p_updated_by_col          => :P1101_UPDATED_BY_COLUMN_NAME
--       );
--   end;
--==============================================================================
function get_options_json(
    p_apex_yn                 in varchar2 default null,
    p_api_yn                  in varchar2 default null,
    p_audit_yn                in varchar2 default null,
    p_compressed_yn           in varchar2 default null,
    p_date_datatype           in varchar2 default null,
    p_db_version              in varchar2 default null,
    p_include_drops_yn        in varchar2 default null,
    p_inserts_yn              in varchar2 default null,
    p_editionable_yn          in varchar2 default null,
    p_auto_gen_pk_yn          in varchar2 default null,
    p_table_prefix            in varchar2 default null,
    p_trigger_method          in varchar2 default null, -- pk pop
    p_prefix_pk_with_tname_yn in varchar2 default null,
    p_row_key_yn              in varchar2 default null,
    p_row_version_yn          in varchar2 default null,
    p_schema                  in varchar2 default null,
    p_semantics               in varchar2 default null,
    -- audit column names
    p_created_col             in varchar2 default null,
    p_created_by_col          in varchar2 default null,
    p_updated_col             in varchar2 default null,
    p_updated_by_col          in varchar2 default null ) 
    return varchar2;

--==============================================================================
-- Functions used in Quick SQL Help
--==============================================================================

--==============================================================================
-- Gets the HTML used to explain settings help
--
--
-- Returns:
-- HTML clob of settings info
--
-- Example:
-- Used in a dynamic content region in 4500:1102
--
--   return wwv_qs_dev.get_pound_options;  
--==============================================================================
function get_pound_options return clob;

--==============================================================================
-- Gets the HTML used to explain view Help
--
--
-- Returns:
-- HTML clob of view info
--
-- Example:
-- Used in a dynamic content region in 4500:1102
--
--   return wwv_qs_dev.get_view_syntax;  
--==============================================================================
function get_view_syntax return varchar2;

--==============================================================================
-- Gets the HTML used to explain data type help
--
--
-- Returns:
-- HTML clob of data type info
--
-- Example:
-- Used in a dynamic content region in 4500:1102
--
--   return wwv_qs_dev.get_column_datatypes;  
--==============================================================================  
function get_column_datatypes return varchar2;

--==============================================================================
-- Gets the HTML used to explain column directive help
--
--
-- Returns:
-- HTML clob of column directive info
--
-- Example:
-- Used in a dynamic content region in 4500:1102
--
--   return wwv_qs_dev.get_column_directives;  
--==============================================================================
function get_column_directives return varchar2;

--==============================================================================
-- Gets the HTML used to explain table directive help
--
--
-- Returns:
-- HTML clob of table directive info
--
-- Example:
-- Used in a dynamic content region in 4500:1102
--
--   return wwv_qs_dev.get_table_directives;  
--==============================================================================
function get_table_directives return varchar2;

--==============================================================================
-- Gets the HTML used to explain about
--
--
-- Returns:
-- HTML clob of about info
--
-- Example:
-- Used in a dynamic content region in 4500:1102
--
--   return wwv_qs_dev.get_about;  
--==============================================================================
function get_about return varchar2;

end wwv_qs_dev;
/
show errors

set define '^'