set define '^' verify off
prompt ...wwv_flow_data_loader.sql
create or replace package wwv_flow_data_loader as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_data_loader.sql
--
--    DESCRIPTION
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    09/20/2017 - Created
-- 
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- public types
--------------------------------------------------------------------------------

subtype t_column_list_type is pls_integer range 1..2;

--------------------------------------------------------------------------------
-- public constants
--------------------------------------------------------------------------------
c_empty_t_varchar2            constant wwv_flow_t_varchar2 := wwv_flow_t_varchar2();

c_column_list_include         constant t_column_list_type  := 1;
c_column_list_exclude         constant t_column_list_type  := 2;

c_job_prefix                  constant varchar2(17) := 'ORACLE_APEX_DTLD$'; 

c_max_jobs_per_apex_session   constant number := 5;

--==================================================================================================================
-- loads file contents into a new table. This function parses the input file using WWV_FLOW_DATA_PARSER.PARSE
-- and stores the data into a new table.
--
-- Since WWV_FLOW_DATA_PARSER.PARSE is a table function, this procedure will actually load the data using
-- an INSERT .. SELECT operation. No temporary collections or tables are being used.
-- This function requires a file parsing profile in JSON format, which can be retrieved using
-- the PARSE and GET_FILE_PROFILE functions in WWV_FLOW_DATA_PARSER. The typical call sequence is as
-- follows:
--
-- 1) Invoke WWV_FLOW_DATA_PARSER.PARSE 
--    Use this table function to parse the file and get rows and columns in order to display a data preview.
--    *While the function runs* it computes the file parser profile which can be used in subsequent calls 
--    in order to further process the data.
-- 2) Invoke WWV_FLOW_DATA_PARSER.GET_FILE_PROFILE
--    Retrieve file profile information in JSON format.
-- 3) Using the file profile, call this procedure.
--
-- PARAMETERS:
--     p_content              BLOB content to load into a new table
--     p_file_profile_json    File parser profile to be used for generating the required dara load SQL (see above)
--
--     p_load_from_owner      Owner of the table to load from (typically an external table)
--     p_load_from_table      Name of the table to load from (typically an external table)
--     p_drop_source_table    whether to drop the source (external) table after load
--
--     p_table_name           Name of the new table to create and to insert data into
--     p_table_owner          Name of the schema to create the new table in
--     -- 
--     p_column_list          List of columns to be processed 
--     p_column_list_type     How to interpret the p_column_list values
--                            -) wwv_flow_data_parser.c_column_list_exclude:
--                               Columns in p_column_list will *not* be imported into the table
--                            -) wwv_flow_data_parser.c_column_list_include:
--                               Only columns in p_column_list will be imported into the table
--     p_add_id_column        Whether to add an IDENTITY primary key column to the table
--
--     p_skip_rows            Number of rows to skip. Useful for CSV or XLSX files where the first line contains
--                            column headers.
--
--     p_use_column_names     Whether to use the column names of the file_profile passed in. Defaults to "true". If
--                            set to false, table columns will be named COL001 to COLNNN.
--     p_use_data_types       Whether to use the data types from the file_profile passed in. Defaults to "true". If
--                            set to false, table columns will be created as VARCHAR2(4000).
--     p_load_incomplete_clob whether to silently load incomplete CLOB values for CSV and XLSX files. These parsers
--                            support CLOB values only up to 32767 bytes. When p_load_incomplete_clob is set to "true"
--                            these CLOB values will be loaded without errors. If set to false (default), the loading
--                            operation will stop with in error in these cases.
--                           
--
--     p_commit_interval      when specified, the procedure will commit after each {p_commit_interval} rows have been processed.
--                            If specified, values less than 200 are not allowed.
--     p_status_collection    when specified, the procedure will store ...
--                            N001: the amount of already processed rows
--                            C001: job status ( 'RUNNING' or 'FINISHED' )
--
--     p_run_in_background    whether to execute the actual data loading as a scheduler job in the background.
-- 
--     p_add_append_hint      whether to use the /*+ APPEND */ hint for better loading performance. Defaults to true. 
--                            If set to yes, the procedure will automatically commit after the operation.
--
--     p_error_log_name       whether to use the databases' DML error logging feature. If an error log name is provided,
--                            an additional table of that name will be created. Whenever a row cannot be inserted into
--                            the target table, it will be inserted into the error log table, among with some information
--                            on the cause of the actual error.
--
--     p_execute_as_schema    schema name to execute the DDL and DML operations as
--
-- EXAMPLE
--
-- I. Parse the file in order to a) see a preview and b) compute the file profile.
--
-- select line_number, col001,col002,col003,col004,col005,col006,col007,col008 
--   from table( 
--              wwv_flow_data_parser.parse(
--                  p_content         => apex_web_service.make_rest_request_b('http://file-examples.com/wp-content/uploads/2017/02/file_example_XLSX_100.xlsx', 'GET' ),
--                  p_file_name       => 'test.xlsx',
--                  p_xlsx_sheet_name => 'sheet1.xml') ) ;
--
--  LINE_NUMBER COL001   COL002       COL003       COL004   COL005          COL006   COL007       COL008 
--  ----------- -------- ------------ ------------ -------- --------------- -------- ------------ ------------- 
--            1 0        First Name   Last Name    Gender   Country         Age      Date         Id       
--            2 1        Dulce        Abril        Female   United States   32       15/10/2017   1562     
--            3 2        Mara         Hashimoto    Female   Great Britain   25       16/08/2016   1582     
--            4 3        Philip       Gent         Male     France          36       21/05/2015   2587     
--            5 4        Kathleen     Hanner       Female   United States   25       15/10/2017   3549     
--            6 5        Nereida      Magwood      Female   United States   58       16/08/2016   2468     
--            7 6        Gaston       Brumm        Male     United States   24       21/05/2015   2554     
--            8 7        Etta         Hurn         Female   Great Britain   56       15/10/2017   3598     
--            9 8        Earlean      Melgar       Female   United States   27       16/08/2016   2456     
--           10 9        Vincenza     Weiland      Female   United States   40       21/05/2015   6548     
--            : :        :            :            :        :               :        :            :
--
-- II: Using the file profile, load the data into a new table "XLSX_TAB". Failed rows will be stored in the
--     "XLSX_TAB_ERR_LOG" error logging table.
--
-- begin
--     wwv_flow_data_loader.load_into_new_table(
--         p_content           => apex_web_service.make_rest_request_b('http://file-examples.com/wp-content/uploads/2017/02/file_example_XLSX_100.xlsx', 'GET' ),
--         p_file_profile_json => wwv_flow_data_parser.get_file_profile,
--         p_table_name        => 'XLSX_TAB',
--         p_error_log_name    => 'XLSX_TAB_ERR_LOG' );
--
-- As an alternative using a COMMIT Interval
--
-- begin
--     wwv_flow_data_loader.load_into_new_table(
--         p_content           => apex_web_service.make_rest_request_b('http://file-examples.com/wp-content/uploads/2017/02/file_example_XLSX_100.xlsx', 'GET' ),
--         p_file_profile_json => wwv_flow_data_parser.get_file_profile,
--         p_table_name        => 'XLSX_TAB',
--         p_error_log_name    => 'XLSX_TAB_ERR_LOG',
--         p_commit_interval   => 200,
--         p_status_collection => 'MY_UPLOAD_COLL' );
-- end;
--
-- When another database session is attached to the current APEX session (APEX_SESSION.ATTACH), the status
-- can be monitored using the following query:
--
-- select n001 from apex_collections where collection_name = 'MY_UPLOAD_COLL'
-- 
--==================================================================================================================
procedure load_into_new_table(
    p_content              in blob,
    p_file_profile_json    in clob,
    --
    p_table_name           in varchar2,
    p_table_owner          in varchar2                                     default null,
    --
    p_load_from_owner      in varchar2                                     default null,
    p_load_from_table      in varchar2                                     default null,
    p_drop_source_table    in boolean                                      default false,
    --
    p_column_list          in wwv_flow_t_varchar2                          default c_empty_t_varchar2,
    p_column_list_type     in t_column_list_type                           default c_column_list_exclude,
    p_add_id_column        in boolean                                      default false,
    p_force_sysguid_id     in boolean                                      default false,
    --
    p_skip_rows            in pls_integer                                  default 0,
    --
    p_use_column_names     in boolean                                      default true,
    p_use_data_types       in boolean                                      default true,
    p_load_incomplete_clob in boolean                                      default false,
    --
    p_commit_interval      in pls_integer                                  default null,
    p_status_collection    in varchar2                                     default null,
    --
    p_run_in_background    in boolean                                      default false,
    --
    p_add_append_hint      in boolean                                      default true,
    p_error_log_name       in varchar2                                     default null,
    --
    p_execute_as_schema    in varchar2                                     default wwv_flow_security.g_parse_as_schema );

--==================================================================================================================
procedure load_into_existing_table(
    p_content              in blob,
    p_file_profile_json    in clob,
    --
    p_table_name           in varchar2,
    p_table_owner          in varchar2                                     default null,
    p_truncate_rows        in boolean                                      default false,
    p_column_map           in wwv_flow_global.vc_map                       default wwv_flow_global.c_empty_vc_map,
    --
    p_load_from_owner      in varchar2                                     default null,
    p_load_from_table      in varchar2                                     default null,
    p_drop_source_table    in boolean                                      default false,
    --
    p_skip_rows            in pls_integer                                  default 0,
    p_use_data_types       in boolean                                      default true,
    p_load_incomplete_clob in boolean                                      default false,
    --
    p_commit_interval      in pls_integer                                  default null,
    p_status_collection    in varchar2                                     default null,
    --
    p_run_in_background    in boolean                                      default false,
    --
    p_add_append_hint      in boolean                                      default true,
    p_error_log_name       in varchar2                                     default null,
    --
    p_execute_as_schema    in varchar2                                     default wwv_flow_security.g_parse_as_schema );


--==================================================================================================================
-- INTERNAL USE: Do not call directly
--
-- this procedure acts as an interface for scheduler jobs - it will be called when load_into_new_table is invoked 
-- with p_run_in_background => true. 
--==================================================================================================================
procedure load_data_into_table_job(
    p_table_name           in varchar2,
    p_table_owner          in varchar2                                    default null,
    --
    p_add_id_column        in varchar2                                    default 'N',
    p_force_sysguid_id     in varchar2                                    default 'N',
    p_skip_rows            in pls_integer                                 default 0,
    --
    p_use_column_names     in varchar2                                    default 'Y',
    p_use_data_types       in varchar2                                    default 'Y',
    p_load_incomplete_clob in varchar2                                    default 'N',
    --
    p_commit_interval      in pls_integer                                 default null,
    p_status_collection    in varchar2                                    default null,
    --
    p_add_append_hint      in varchar2                                    default 'Y',
    p_error_log_name       in varchar2                                    default null,
    --
    p_apex_session_id      in varchar2                                    default null,
    p_apex_app_id          in varchar2                                    default null,
    p_apex_page_id         in varchar2                                    default null,
    p_apex_ws_sgid         in varchar2                                    default null,
    --    
    p_collection_name      in varchar2                                    default 'APX$DTLD',
    --
    p_load_from_owner      in varchar2                                    default null,
    p_load_from_table      in varchar2                                    default null,
    p_drop_source_table    in varchar2                                    default 'N',
    --
    p_execute_as_schema   in varchar2                                     default wwv_flow_security.g_parse_as_schema ) ;

end wwv_flow_data_loader;
/
sho err
