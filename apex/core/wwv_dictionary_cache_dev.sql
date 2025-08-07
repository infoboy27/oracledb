set define '^' verify off
prompt ...wwv_dictionary_cache_dev.sql
create or replace package wwv_dictionary_cache_dev
as

--------------------------------------------------------------------------------
--
-- Copyright (c) 2019, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_dictionary_cache_dev.sql
--
--    DESCRIPTION
--      Caches and augments data dictionary information to more quickly and elegantly get object info
--
--    RUNTIME DEPLOYMENT:
--
--    MODIFIED  (MM/DD/YYYY)
--     mhichwa   05/20/2019 - Created
--
--------------------------------------------------------------------------------

--
-- Possible exception error codes:
--
-- 20901 - maximum execution time exceeded
-- 20902 - table to be cached does not exist
-- 20903 - logid is expected to be set but is null - unexected procedure error
-- 20904 - user requested canceling running request
-- 20905 - request for caching this object is actively being processed by another request
-- 20906 - completing work and found null log_id - unexpected prcedure error
-- 20907 - requested workspace to be cached was not found
-- 20908 - requested workspace schema to be cached was not found

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_cache_columns       is table of wwv_dictionary_cache_col%rowtype index by binary_integer;
type t_cache_fk_cons       is table of wwv_dictionary_cache_fkcon%rowtype index by binary_integer;
--------------------------------------------------------------------------------
-- Public globals
--------------------------------------------------------------------------------
g_command_line boolean := false; -- true will write debug logs via sys.dbms_output

--
-- APIs to query dictionary cache
--
function fetch_table_cache(
    p_table_owner   in varchar2,
    p_table_name    in varchar2 ) return wwv_dictionary_cache_obj%rowtype;

function fetch_column_cache(
    p_table_owner   in varchar2,
    p_table_name    in varchar2 ) return t_cache_columns;

function fetch_fk_con_cache(
    p_table_owner   in varchar2,
    p_table_name    in varchar2 ) return t_cache_fk_cons;

function get_num_format_mask(
    p_low_value  in number,
    p_high_value in number ) return varchar2;

function get_decimal_mask( p_value in number )
return varchar2;

--==============================================================================
-- This function computes the singular label for the table
--==============================================================================
function get_singular_label (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_table_prefix in varchar2 default null )
    return varchar2;

--==============================================================================
-- This function computes the plural label for the table.
--==============================================================================
function get_plural_label (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_table_prefix in varchar2 default null )
    return varchar2;

--==============================================================================
-- This function computes the table description.
--==============================================================================
function get_table_description (
    p_schema       in varchar2,
    p_table_name   in varchar2 )
    return varchar2;

--==============================================================================
-- This function computes the lable for the column.
--==============================================================================
function get_column_label (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2,
    p_is_fk_column in boolean default false )
    return varchar2;

--==============================================================================
-- This procedure updates the table data dictionary cache.
--==============================================================================
procedure update_table_cache (
    p_schema         in varchar2,
    p_table_name     in varchar2,
    p_singular_label in varchar2 default null,
    p_plural_label   in varchar2 default null,
    p_description    in varchar2 default null );

--==============================================================================
-- This procedure updates the column data dictionary cache.
--==============================================================================
procedure update_column_cache (
    p_schema         in varchar2,
    p_table_name     in varchar2,
    p_column_name    in varchar2,
    p_column_label   in varchar2 default null );

--==============================================================================
-- This procedure syncs the table and column info into data dictionary cache.
--==============================================================================
procedure sync_into_dictionary_cache (
    p_schema         in varchar2,
    p_table_name     in varchar2 );

--
-- APIs to set dictionary cache
--
procedure daily_job;

procedure set_all_ws_schema_cache(
    -- Cache dictionary info for all schemas mapped to all apex non internal workspaces
    -- 604,800 seconds in a week, 2,419,200 seconds in 4 weeks, 86400 in a day, 3600 in an hour
    p_gather_stats             in boolean  default false,       -- 0 gather database stats via SYS.DBMS_STATS.GATHER_TABLE_STATS or other method
    p_max_stats_age_seconds    in number   default 172800,      -- 1 do not analyze tables last analyzed this number of seconds ago
    p_max_cache_stale_seconds  in number   default 100000000,   -- 2 do not cache table if last cached within this number of seconds
    p_stats_mode               in varchar2 default 'estimate',  -- 3 stats mode estimate or compute
    p_show_debug               in boolean  default false,       -- 4 show debug info, set wwv_dictionary_cache_dev.g_command_line to true to use sys.dbms_output, set to false for wwv_flow_debug
    p_verbose                  in boolean  default false,       -- 5 print even more debug information
    p_max_tables_per_schema    in number   default 100000,      -- 7 maximum number of tables to process per workspace schema
    p_sleep_between_tab_sec    in number   default 0,           -- 8 number of seconds to sleep between caching stats for each table
    p_only_obj_created_sec     in number   default 0,           -- 9 only consider objects created in the last X seconds, 0 for all
    p_ignore_already_cached    in boolean  default false,       -- 10 do not attempt to cache objects already in the APEX cache if true (MIKE research this)
    p_last_login_time_seconds  in number   default 0,           -- 11 only cache workspace if last_login date is within this number of seconds
    p_max_elap_exec_time_sec   in number   default 0,           -- 12 execute requests for this amount of seconds, after this amount of time exit
    p_table_prefix             in varchar2 default null,        -- 13 remove this table prefix from display names for table
    p_auto_detect_tab_prefix   in boolean  default true )       -- 14 automatically detect and remove table prefix
    ;

procedure set_workspace_cache(
    -- Cache dictionary info for all schemas mapped to a given apex workspace
    p_workspace_name           in varchar2,                     -- apex workspace name case sensitive name
    p_gather_stats             in boolean  default false,       -- gather database stats via SYS.DBMS_STATS.GATHER_TABLE_STATS or other method
    p_max_stats_age_seconds    in number   default 172800,      -- do not analyze tables last analyzed this number of seconds ago
    p_max_cache_stale_seconds  in number   default 100000000,   -- do not cache table if last cached within this number of seconds
    p_stats_mode               in varchar2 default 'estimate',  -- stats mode estimate or compute
    p_show_debug               in boolean  default false,       -- show debug info, set wwv_dictionary_cache_dev.g_command_line to true to use sys.dbms_output, set to false for wwv_flow_debug
    p_verbose                  in boolean  default false,       -- print even more debug information
    p_max_tables_per_schema    in number   default 100000,      -- maximum number of tables to process per workspace schema
    p_sleep_between_tab_sec    in number   default 0,           -- number of seconds to sleep between caching stats for each table
    p_only_obj_created_sec     in number   default 0,           -- only consider objects created in the last X seconds, 0 for all
    p_ignore_already_cached    in boolean  default false,       -- do not attempt to cache objects already in the APEX cache if true
    p_last_login_time_seconds  in number   default 0,           -- only cache workspace if last_login date is within this number of seconds
    p_max_elap_exec_time_sec   in number   default 0,           -- execute requests for this amount of seconds, after this amount of time exit
    p_table_prefix             in varchar2 default null,        -- remove this table prefix from display names for table
    p_auto_detect_tab_prefix   in boolean  default true )       -- automatically detect and remove table prefix
    ;

procedure set_schema_table_cache(
    -- Cache dictionary info for all tables within a specific workspace schema
    p_workspace_name           in varchar2,                     -- apex workspace name case sensitive name
    p_schema                   in varchar2,                     -- schema name
    p_gather_stats             in boolean  default false,       -- gather database stats via SYS.DBMS_STATS.GATHER_TABLE_STATS or other method
    p_max_stats_age_seconds    in number   default 172800,      -- do not analyze tables last analyzed this number of seconds ago
    p_max_cache_stale_seconds  in number   default 100000000,   -- do not cache table if last cached within this number of seconds
    p_stats_mode               in varchar2 default 'estimate',  -- stats mode estimate or compute
    p_show_debug               in boolean  default false,       -- show debug info, set wwv_dictionary_cache_dev.g_command_line to true to use sys.dbms_output, set to false for wwv_flow_debug
    p_verbose                  in boolean  default false,       -- print even more debug information
    p_max_tables_per_schema    in number   default 100000,      -- maximum number of tables to process per workspace schema
    p_sleep_between_tab_sec    in number   default 0,           -- number of seconds to sleep between caching stats for each table
    p_only_obj_created_sec     in number   default 0,           -- only consider objects created in the last X seconds, 0 for all
    p_ignore_already_cached    in boolean  default false,       -- do not attempt to cache objects already in the APEX cache if true
    p_last_login_time_seconds  in number   default 0,           -- only cache workspace if last_login date is within this number of seconds
    p_max_elap_exec_time_sec   in number   default 0,           -- execute requests for this amount of seconds, after this amount of time exit
    p_table_prefix             in varchar2 default null,        -- remove this table prefix from display names for table
    p_auto_detect_tab_prefix   in boolean  default true )       -- automatically detect and remove table prefix
    ;

procedure set_dictionary_table_cache(
    -- Cache dictionary info for a given table within a given schema within a given workspace
    -- This is the extended procedure with all options, also see simplified procedure reset_dictionary_table_cache
    p_workspace_name           in varchar2,                     -- apex workspace name case sensitive name
    p_schema                   in varchar2,                     -- schema name
    p_table_name               in varchar2,                     -- table name case sensitive
    --
    p_flow_id                  in number   default null,        -- needed if called from create page wizard
    --
    p_gather_stats             in boolean  default false,       -- gather database stats via SYS.DBMS_STATS.GATHER_TABLE_STATS or other method
    --
    p_cache_fk_references      in boolean  default false,       -- cache foreign keys for this table
    p_cache_child_tables       in boolean  default false,       -- cache child tables referencing this table
    --
    p_max_stats_age_seconds    in number   default 172800,      -- do not analyze tables last analyzed this number of seconds ago
    p_max_cache_stale_seconds  in number   default 100000000,   -- do not cache table if last cached within this number of seconds
    p_stats_mode               in varchar2 default 'estimate',  -- stats mode estimate or compute
    --
    p_show_debug               in boolean  default false,       -- show debug info, set wwv_dictionary_cache_dev.g_command_line to true to use sys.dbms_output, set to false for wwv_flow_debug
    p_verbose                  in boolean  default false,       -- print even more debug information
    --
    p_only_obj_created_sec     in number   default 0,           -- only consider objects created in the last X seconds, 0 for all
    p_ignore_already_cached    in boolean  default false,       -- do not attempt to cache objects already in the APEX cache if true
    --
    p_last_login_time_seconds  in number   default 0,           -- only cache workspace if the apex workspace was logged into within this number of seconds
    p_max_elap_exec_time_sec   in number   default 0,           -- execute requests for this amount of seconds, after this amount of time exit
    p_table_prefix             in varchar2 default null,        -- remove this table prefix from display names for table
    p_auto_detect_tab_prefix   in boolean  default true )       -- automatically detect and remove table prefix
    ;

procedure reset_dictionary_table_cache(
    -- recompute table cache for a given table within a given schema mapped to a given workspace, simplified verion of set_dictionary_table_cache
    -- will call reset_all to remove any information previously cache and recache the able information
    p_workspace_name           in varchar2,                     -- apex workspace name case sensitive name
    p_schema                   in varchar2,                     -- schema name
    p_table_name               in varchar2,                     -- table name case sensitive
    --
    p_flow_id                  in number   default null,        -- needed if called from create page wizard
    --
    p_gather_stats             in boolean default false,        -- gather database stats via SYS.DBMS_STATS.GATHER_TABLE_STATS or other method
    p_cache_fk_references      in boolean default false,        -- follow foreign key references and cache related tables
    p_auto_detect_tab_prefix   in boolean default true,         -- auto detect table prefixes, table prefixes are removed when determining recommended display names
    p_show_debug               in boolean default false,        -- show debug info, set wwv_dictionary_cache_dev.g_command_line to true to use sys.dbms_output, set to false for wwv_flow_debug
    p_verbose                  in boolean default false)        -- show even more debug info
    ;

procedure cancel_request(
    p_run_id                  in number)
    ;

procedure reset_all(
    p_workspace_name          in varchar2 default null,         -- remove all cached information for the workspace, null for all
    p_schema                  in varchar2 default null,         -- remove all cached information for the schema, null for all
    p_table_name              in varchar2 default null,         -- remove all cached information for the table, null for all
    p_show_debug              in boolean  default false,        -- show debug info, set wwv_dictionary_cache_dev.g_command_line to true to use sys.dbms_output, set to false for wwv_flow_debug
    p_verbose                 in boolean  default false)        -- show more debug info
    ;

--==============================================================================
-- API to call from INTERNAL app page
--==============================================================================
procedure builder_set_object_cache(
    p_workspace_id             in number,
    p_schema                   in varchar2,
    p_table_name               in varchar2,
    --
    p_gather_stats             in boolean  default false,
    p_max_stats_age_seconds    in number   default 172800,
    p_cache_fk_references      in boolean  default false,
    --
    p_max_cache_stale_seconds  in number   default 100000000 );

function builder_reset_object_cache(
    p_workspace_id             in number,
    p_object_id                in number,
    p_cache_fk_references      in boolean default false,
    p_gather_stats             in boolean default false ) return number;

procedure builder_set_workspace_cache(
    p_workspace_id             in number,
    p_gather_stats             in boolean  default false,       -- gather database stats via SYS.DBMS_STATS.GATHER_TABLE_STATS or other method
    p_max_stats_age_seconds    in number   default 172800,      -- analyze any table that stats have not been set within this number of seconds
    p_max_cache_stale_seconds  in number   default 100000000,   -- recreate dictionary cache information for table and columns if not computed in this number of seconds
    p_max_tables_per_schema    in number   default 100000,      -- maximum number of tables to process
    p_stats_mode               in varchar2 default 'estimate',  -- mode to analyze tables to compute or estimate statisics
    p_max_elap_exec_time_sec   in number   default 0            -- execute requests for this amount of seconds, after this amount of time exit
    );

end wwv_dictionary_cache_dev;
/
show err

set define '^'
