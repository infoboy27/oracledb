set define off verify off
prompt ...wwv_flow_data_loader_dev.sql
create or replace package wwv_flow_data_loader_dev is
------------------------------------------------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_data_loader_dev.sql
--
--    DESCRIPTION
--      Builder support for wwv_flow_data_loader package
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    11/24/2019 - Created
--
------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- loads data from an external table to a new table.
--
-- EXAMPLE 1
--     load contents from external table into a new table: process on page 3140
--
--     load_to_new_table(
--         p_source_type       => 'TABLE',
--         p_source_schema     => :P3140_SCHEMA,
--         p_source_name       => :P3140_EXTERNAL_TABLE_NAME,
--         p_drop_source_table => :P3140_DROP_EXTERNAL_TABLE = 'Y',
--         --
--         p_target_schema     => :P3140_SCHEMA,
--         p_target_name       => :P3140_NEW_TABLE_NAME,
--         p_error_table_name  => :P3140_ERROR_TABLE_NAME,
--         --
--         p_add_id_column     => false,
--         --
--         p_monitor_progress  => :P3140_MONITOR_PROGRESS = 'Y',
--         p_commit_interval   => :P3140_COMMIT_INTERVAL,
--         --
--         p_load_id           => :P3100_LOAD_ID,
--         p_message           => :P3140_SUCCESS_MSG );
--
-- EXAMPLE 2
--     load contents into a new table: process on page 3100
--
--     load_to_new_table(
--         p_source_type      => :P3100_SOURCE_TYPE,
--         p_file_name        => :P3100_FILE,
--         --
--         p_target_schema    => :P3100_TABLE_OWNER,
--         p_target_name      => :P3100_TABLE_NAME,
--         p_error_table_name => :P3100_ERROR_TABLE_NAME,
--         --
--         p_add_id_column    => true,
--         p_force_sysguid_id => :P3100_FORCE_SYSGUID_ID = 'Y',
--         p_skip_rows        => ( case when :P3100_FIRST_LINE = 'HEADERS' and :P3100_FILE_TYPE in ( '1', '2' ) then 1 else 0 end ),
--         p_use_column_names => ( case when :P3100_FIRST_LINE = 'HEADERS' then true else false end ),
--         p_use_data_types   => ( case when :P3100_USE_DATA_TYPES = 'Y' then true else false end ),
--         --
--         p_load_id          => :P3100_LOAD_ID,
--         p_message          => l_dummy );
-------------------------------------------------------------------------------
procedure load_to_new_table(
    p_source_type         in varchar2,
    --
    p_source_schema       in varchar2 default null,
    p_source_name         in varchar2 default null,
    p_drop_source_table   in boolean  default false,
    p_file_name           in varchar2 default null,
    --
    p_target_schema       in varchar2,
    p_target_name         in varchar2,
    p_error_table_name    in varchar2,
    --
    p_add_id_column       in boolean  default true,
    p_force_sysguid_id    in boolean  default false,
    p_skip_rows           in number   default 0,
    p_use_column_names    in boolean  default true,
    p_use_data_types      in boolean  default true,
    --
    p_column_collection   in varchar2 default 'APEX$DATALOAD_COLUMNS',
    p_profile_collection  in varchar2 default 'APEX$DATALOAD',
    --
    p_monitor_progress    in boolean  default true,
    p_commit_interval     in number   default 200,
    --
    p_load_id            out number,
    p_message            out varchar2 );

-------------------------------------------------------------------------------
-- loads data from an external table to an existing table.
--
-- EXAMPLE 1
--    load contents from external table into an existing table: process on page 3140
--
--    load_to_existing_table(
--        p_source_type       => 'TABLE',
--        p_source_schema     => :P3140_SCHEMA,
--        p_source_name       => :P3140_EXTERNAL_TABLE_NAME,
--        p_drop_source_table => :P3140_DROP_EXTERNAL_TABLE = 'Y',
--        --
--        p_target_schema     => :P3140_SCHEMA,
--        p_target_name       => :P3140_NEW_TABLE_NAME,
--        p_error_table_name  => :P3140_ERROR_TABLE_NAME,
--
--        p_skip_rows         => 0,
--        p_truncate_rows     => ( :P3140_UPDATE_METHOD = 'REPLACE' ),
--        --
--        p_monitor_progress  => :P3140_MONITOR_PROGRESS = 'Y',
--        p_commit_interval   => :P3140_COMMIT_INTERVAL,
--        --
--        p_load_id           => :P3100_LOAD_ID,
--        p_message           => :P3140_SUCCESS_MSG );
--
-- EXAMPLE 2
--    load contents from file into an existing table: process on page 3100
--
--    load_to_existing_table(
--        p_source_type      => :P3100_SOURCE_TYPE,
--        p_file_name        => :P3100_FILE,
--        --
--        p_target_schema    => :P3100_TABLE_OWNER,
--        p_target_name      => :P3100_EXISTING_TABLE,
--        p_error_table_name => :P3140_ERROR_TABLE_NAME,
--        --
--        p_skip_rows        => ( case when :P3100_FIRST_LINE = 'HEADERS' and :P3100_FILE_TYPE in ( '1', '2' ) then 1 else 0 end ),
--        p_truncate_rows    => ( :P3100_UPDATE_METHOD = 'REPLACE' ),
--        --
--        p_load_id          => :P3100_LOAD_ID,
--        p_message          => l_dummy );
-------------------------------------------------------------------------------
procedure load_to_existing_table(
    p_source_type         in varchar2,
    --
    p_source_schema       in varchar2 default null,
    p_source_name         in varchar2 default null,
    p_drop_source_table   in boolean  default false,
    p_file_name           in varchar2 default null,
    --
    p_target_schema       in varchar2,
    p_target_name         in varchar2,
    p_error_table_name    in varchar2,
    --
    p_skip_rows           in number   default 0,
    p_truncate_rows       in boolean,
    --
    p_column_collection   in varchar2 default 'APEX$DATALOAD_COLUMNS',
    p_profile_collection  in varchar2 default 'APEX$DATALOAD',
    --
    p_monitor_progress    in boolean  default true,
    p_commit_interval     in number   default 200,
    --
    p_load_id            out number,
    p_message            out varchar2 );

--==================================================================================================================
-- builds the data loading column mapping collection
--==================================================================================================================
procedure build_column_mapping_coll(
    p_file_profile_json  in out nocopy clob,
    p_collection_name    in            varchar2 default 'APEX$DATALOAD_COLUMNS',
    p_load_to_owner      in            varchar2 default null ,
    p_load_to_table      in            varchar2 default null );

--==================================================================================================================
-- generates a SQL query selecting up to the first N columns from the given table. Used for data preview reports
-- in f4500.
--==================================================================================================================
function get_preview_query(
    p_table_owner       in varchar2,
    p_table_name        in varchar2,
    p_column_cnt        in number default 15 )
    return varchar2;

--==================================================================================================================
-- generates an error table name from the given target table name. If the table name already exists,
-- a number will be appended.
-- Generation scheme:
-- 1. Error Table Name is generated by appending "_ERR$" to the target table name
-- 2. If the generated table name is not available any more, a random 3 digit number is appended: "_ERR$001"
-- 3. if the base table name if larger than 25 bytes (or 23 bytes), it will be cut accordingly
--
-- The generated table name will be checked against DBA_TABLES, DBA_EXTERNAL_TABLES, DBA_VIEWS and DBA_SYNONYMS
--==================================================================================================================
function get_error_table_name(
    p_table_owner       in varchar2,
    p_table_name        in varchar2 )
    return varchar2;

--==================================================================================================================
-- retrieves a list with up to the first N columns to used for column heading display in data preview reports.
--==================================================================================================================
function get_column_names(
    p_table_owner       in varchar2,
    p_table_name        in varchar2,
    p_column_cnt        in number default 15 )
    return wwv_flow_t_varchar2;

--==================================================================================================================
-- generates a "parser profile" for a given table
--==================================================================================================================
function get_profile_from_table(
    p_table_owner       in varchar2,
    p_table_name        in varchar2 )
    return wwv_flow_data_parser.t_file_profile;

--==================================================================================================================
-- returns a query to preview (10 columns and 5 rows) data for a given file or copy paste data
--==================================================================================================================
function get_10by5_preview_query(
    p_source_type           in varchar2,
    p_file_name             in varchar2 default null,
    --
    p_max_rows              in number   default 200,
    p_csv_delimiter         in varchar2 default null,
    p_csv_enclosed          in varchar2 default '"',
    p_file_charset          in varchar2 default 'AL32UTF8',
    p_skip_rows             in number   default null,
    p_xlsx_sheet_name       in varchar2 default null )
    return varchar2;
--==================================================================================================================
-- returns true if the data load definition is used in the application
--==================================================================================================================
function is_data_load_used(
    p_application_id in number,
    p_data_load_id   in number ) return boolean;
--==================================================================================================================
-- returns true if PK data profile column defined for the data load defintion
--==================================================================================================================
function is_pk_profile_col_defined(
    p_application_id in number,
    p_data_load_id   in number ) return boolean;
--==================================================================================================================
-- initializes column mapping collection for a given file profile
--==================================================================================================================
procedure init_column_collection(
    p_column_collection   in varchar2 default 'APEX$DATALOAD_COLUMNS',
    p_profile_collection  in varchar2 default 'APEX$DATALOAD',
    --
    p_target_type         in varchar2,
    p_target_schema       in varchar2,
    p_target_name         in varchar2 );

-------------------------------------------------------------------------------
-- Creates data loading definitions under App > Shared Component > Data Load Definitions
-- and returns the created data load definition ID.
--
-- EXAMPLE 1
--    creates new data load definition to load into EMP in current app: process on 4000:1812
--
--    declare
--        l_data_load_id number;
--    begin
--        l_data_load_id := create_data_load(
--            p_application_id      => :FB_FLOW_ID,
--            --
--            p_column_collection   => 'APEX$DATALOAD_COLUMNS',
--            p_profile_collection  => 'APEX$DATALOAD',
--            --
--            p_use_selector_type   => wwv_flow_plugin_api.c_selector_name,
--            --
--            p_data_load_name      => :P1811_NAME,
--            p_target_type         => :P1811_TARGET_TYPE,
--            p_target_schema       => case :P1811_TARGET_TYPE
--                                     when 'TABLE' then
--                                         :P1811_TABLE_OWNER
--                                     when 'COLLECTION' then
--                                         :OWNER
--                                     end,
--            p_target_name         => case :P1811_TARGET_TYPE
--                                     when 'TABLE' then
--                                         :P1811_TABLE_NAME
--                                     when 'COLLECTION' then
--                                         :P1811_COLLECTION_NAME
--                                     end );
--    end;
-------------------------------------------------------------------------------
function create_data_load(
    p_application_id      in number,
    --
    p_column_collection   in varchar2 default 'APEX$DATALOAD_COLUMNS',
    p_profile_collection  in varchar2 default 'APEX$DATALOAD',
    --
    p_use_selector_type   in wwv_flow_plugin_api.t_selector_type,
    --
    p_data_load_name      in varchar2,
    p_target_type         in varchar2,
    p_target_schema       in varchar2,
    p_target_name         in varchar2 ) return number;

-------------------------------------------------------------------------------
-- Creates a page to load data using the selected data loading definitions
--
-- EXAMPLE 1
--    creates a page to load data in current app: process on 4000:1814
--
--    begin
--        create_data_load_page(
--            p_application_id      => :FB_FLOW_ID,
--            --
--            p_column_collection   => 'APEX$DATALOAD_COLUMNS',
--            p_profile_collection  => 'APEX$DATALOAD',
--            --
--            p_data_load_name      => :P1811_NAME,
--            p_target_type         => :P1811_TARGET_TYPE,
--            p_target_schema       => case :P1811_TARGET_TYPE
--                                     when 'TABLE' then
--                                         :P1811_TABLE_OWNER
--                                     when 'COLLECTION' then
--                                         :OWNER
--                                     end,
--            p_target_name         => case :P1811_TARGET_TYPE
--                                     when 'TABLE' then
--                                         :P1811_TABLE_NAME
--                                     when 'COLLECTION' then
--                                         :P1811_COLLECTION_NAME
--                                     end );
--    end;
-------------------------------------------------------------------------------
procedure create_data_load_page(
    p_application_id             in number,
    p_page_id                    in number,
    p_page_name                  in varchar2,
    p_group_name                 in varchar2 default null,
    p_page_mode                  in varchar2,
    p_use_ui_default             in varchar2 default 'Y',
    --
    p_tab_set                    in varchar2 default null,
    p_tab_name                   in varchar2 default null,
    p_tab_text                   in varchar2 default null,
    --
    p_nav_list_id                in number   default null,
    p_nav_list_parent_item_id    in number   default null,
    p_nav_list_child_item_name   in varchar2 default null,
    p_nav_list_item_icon         in varchar2 default null,
    --
    p_breadcrumb_id              in number   default null,
    p_breadcrumb_entry_name      in varchar2 default null,
    p_parent_breadcrumb_entry_id in number   default null,
    --
    p_data_load_id               in number,
    p_data_source_type           in varchar2 default 'FILE',
    p_max_file_size              in number   default null );

-------------------------------------------------------------------------------
-- Copy a data load definition, between applications p_from_application_id to p_to_application_id.
--
-- p_subscribe:
--     if true then the new data load definition gets a subscription to the old one.
-- p_if_existing_raise_dupval:
--     if true and a data load definition with the same name already exists in
--     p_to_flow_id then DUP_VAL_ON_INDEX gets thrown.
-------------------------------------------------------------------------------
function copy_data_load(
    p_from_application_id      in            number,
    p_name                     in            varchar2,
    p_to_application_id        in            number,
    p_to_name                  in            varchar2 default null,
    p_subscribe                in            boolean  default false,
    p_if_existing_raise_dupval in            boolean  default false )
    return number;

-------------------------------------------------------------------------------
-- Copy a data load definition, between applications p_from_application_id to p_to_application_id.
--
-- p_subscribe:
--     if true then the new data load definition gets a subscription to the old one.
-- p_if_existing_raise_dupval:
--     if true and a data load definition with the same name already exists in
--     p_to_flow_id then DUP_VAL_ON_INDEX gets thrown.
-------------------------------------------------------------------------------
function copy_data_load(
    p_from_application_id      in            number,
    p_from_data_load_id        in            number,
    p_to_application_id        in            number,
    p_to_name                  in            varchar2 default null,
    p_subscribe                in            boolean  default false,
    p_if_existing_raise_dupval in            boolean  default false )
    return number;

-------------------------------------------------------------------------------
-- This procedure pulls content from the master data load and
-- copies it to the subscribing data load.
-------------------------------------------------------------------------------
procedure subscribe_data_load (
    p_data_load_id        in number,
    p_master_data_load_id in number );

-------------------------------------------------------------------------------
-- Refresh data load definition with the master data load definition content.
-------------------------------------------------------------------------------
procedure refresh_data_load (
    p_data_load_id  in number );

-------------------------------------------------------------------------------
-- returns name of the data load definition
-------------------------------------------------------------------------------
function get_data_load_name(
    p_data_load_id        in number,
    p_application_id      in number )
    return varchar2;

--==============================================================================
-- Deletes data load definition and clears reference_id in subscribed component
--==============================================================================
procedure delete_data_load_definition(
    p_data_load_id         in number,
    p_application_id       in number);

end wwv_flow_data_loader_dev;
/
sho err

set define '^'