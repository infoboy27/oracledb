set define '^' verify off
prompt ...wwv_flow_data_loading_api.sql
create or replace package wwv_flow_data_loading_api as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
-- 
-- The `APEX_DATA_LOADING` package provides the ability to load data by calling 
-- an application data loading definition. This can be used in place of native data loading. 
--
-- Filename: core/wwv_flow_data_loading_api.sql
--
-- Modified:   
-- cczarski    12/07/2020 - created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Data Types:
-- The `APEX_DATA_LOADING` package uses the following data types:
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

type t_data_load_result is record (
    processed_rows    pls_integer,
    error_rows        pls_integer );

--==============================================================================
-- This function loads file data and returns loading status information containing 
-- processed rows and error rows.
--
-- PARAMETERS:
-- * p_application_id:        ID of the application which contains the data load definition.
-- * p_static_id:             Static ID of the data loading definition to execute.
-- * p_data_to_load:          BLOB file to be loaded.
-- * p_xlsx_sheet_name:       For XLSX files, the worksheet to extract.
--
-- RETURNS:
-- Loading status information, containing processed rows and error rows.
--
-- EXAMPLE:
-- This example fetches a file (uploaded with the `PX_FILEBROWSE_ITEM`) from the `APEX_APPLICATION_TEMP_FILES`
-- table and executes the `my-load-definition` data loading definition.
--
--     declare
--         l_file blob;
--         l_load_result apex_data_loading.t_data_load_result;
--     begin
--         apex_session.create_session( 100, 1, 'ADMIN' ); 
--
--         select blob_content
--           into l_file
--           from apex_application_temp_files
--          where name = :PX_FILEBROWSE_ITEM; 
--
--        l_load_result := apex_data_loading.load_data (
--                           p_static_id    => 'my-load-definition',
--                           p_data_to_load => l_file );
-- 
--        dbms_output.put_line( 'Processed ' || l_load_result.processed_rows || ' rows.');
--     end;
--==============================================================================
function load_data (
    p_application_id   in number      default wwv_flow.g_flow_id,
    p_static_id        in varchar2,
    p_data_to_load     in blob,
    p_xlsx_sheet_name  in varchar2    default null )
    return t_data_load_result;

--==============================================================================
-- This function loads file data and returns loading status information containing 
-- processed rows and error rows.
--
-- PARAMETERS:
-- * p_application_id:        ID of the application which contains the data load definition.
-- * p_static_id:             Static ID of the data loading definition to execute.
-- * p_data_to_load:          CLOB file to be loaded.
-- * p_xlsx_sheet_name:       For XLSX files, the worksheet to extract.
--
-- RETURNS:
-- Loading status information, containing processed rows and error rows.
--
-- EXAMPLE:
-- This example gets data (copy and pasted into the `PX_DATA textarea`) and executes 
-- the `my-load-definition` data loading definition.
--
--     declare
--         l_load_result apex_data_loading.t_data_load_result;
--     begin
--         apex_session.create_session( 100, 1, 'ADMIN' ); 
--         
--        l_load_result := apex_data_loading.load_data (
--                           p_static_id    => 'my-load-definition',
--                           p_data_to_load => :PX_DATA );
--        dbms_output.put_line( 'Processed ' || l_load_result.processed_rows || ' rows.');
--     end;
--==============================================================================
function load_data (
    p_application_id   in number      default wwv_flow.g_flow_id,
    p_static_id        in varchar2,
    p_data_to_load     in clob,
    p_xlsx_sheet_name  in varchar2    default null )
    return t_data_load_result;

--==============================================================================
-- This function returns the file profile ( determinded by the data loading definition )
-- in JSON format.
--
-- PARAMETERS:
-- * p_application_id:        ID of the application which contains the the data load definition.
-- * p_static_id:             Static ID of the data loading definition to execute.
--
-- RETURNS:
-- Returns file profile computed from the data load definition in JSON format.
--
-- EXAMPLE:
-- This example parses an XLSX file using the file profile computed from the data load defintion.
--
-- Parse the file using the file profile computed from the data load defintion. 
-- The result can be shown as a preview to end users.
--
--     select line_number, col001, col002, col003, col004, col005, col006, col007, col008  
--       from table( 
--                apex_data_parser.parse(
--                    p_content         => {BLOB containing XLSX file},
--                    p_file_name       => 'test.xlsx',
--                    p_xlsx_sheet_name => 'sheet1.xml',
--                    p_file_profile    => apex_data_loading.get_file_profile(
--                                             p_static_id => 'my-load-definition' ) )
--
--  Output:
--```
--   LINE_NUMBER COL001   COL002       COL003       COL004   COL005          COL006   COL007       COL008 
--   ----------- -------- ------------ ------------ -------- --------------- -------- ------------ ------------- 
--             1 0        First Name   Last Name    Gender   Country         Age      Date         Id       
--             2 1        Dulce        Abril        Female   United States   32       15/10/2017   1562     
--             3 2        Mara         Hashimoto    Female   Great Britain   25       16/08/2016   1582     
--             4 3        Philip       Gent         Male     France          36       21/05/2015   2587     
--             5 4        Kathleen     Hanner       Female   United States   25       15/10/2017   3549     
--             6 5        Nereida      Magwood      Female   United States   58       16/08/2016   2468     
--             7 6        Gaston       Brumm        Male     United States   24       21/05/2015   2554     
--             8 7        Etta         Hurn         Female   Great Britain   56       15/10/2017   3598     
--             9 8        Earlean      Melgar       Female   United States   27       16/08/2016   2456     
--            10 9        Vincenza     Weiland      Female   United States   40       21/05/2015   6548     
--             : :        :            :            :        :               :        :            :
--``` 
-- Get the the file profile computed from the data load defintion in JSON format.
--
--     select apex_data_loading.get_file_profile( p_static_id => 'my-load-definition' ) 
--     from sys.dual;
--  
--  Output:
-- ```
--   {
--       "file-type" : 1,
--       "csv-delimiter" : "",
--       "xslx-worksheet" : "sheet1.xml",
--       "headings-in-first-row" : true,
--       "file-encoding" : "AL32UTF8",
--       "single-row" : false,
--       "parsed-rows" : 2378,
--       "columns" : [
--          {
--              "format-mask" : "",
--              "name" : "C0",
--              "data-type" : 2,
--              "selector" : ""
--          },
--          {
--              "name" : "FIRST_NAME",
--              "data-type" : 1,
--              "selector" : "",
--              "format-mask" : ""
--          },
--          :
--          {
--              "format-mask" : "DD\"/\"MM\"/\"YYYY",
--              "selector" : "",
--              "data-type" : 3,
--              "name" : "DATE_"
--          },
--          {
--              "name" : "ID",
--              "data-type" : 2,
--              "selector" : "",
--              "format-mask" : ""
--          }
--       ],
--       "row-selector" : ""
--   }
--```
-- Example:
-- This example parses and fetches the first 10 columns using a file uploaded from 
-- `P1_FILE` File Browse item and the file profile computed from the data load defintion.
--
--     select p.line_number,
--            p.col001, 
--            p.col002, 
--            p.col003, 
--            p.col004, 
--            p.col005, 
--            p.col006, 
--            p.col007, 
--            p.col008, 
--            p.col009, 
--            p.col010
--       from apex_application_temp_files    f,
--            table( apex_data_parser.parse(
--                       p_content       =>  f.blob_content,
--                       p_file_name     =>  f.filename,
--                       p_file_profile  =>  apex_data_loading.get_file_profile
--                                           ( p_static_id => 'my-load-definition'),
--                       p_max_rows      =>  100 ) ) p
--      where f.name = :P1_FILE;
--
-- See also:
-- APEX_DATA_PARSER.PARSE
--==============================================================================
function get_file_profile (
    p_application_id   in number      default wwv_flow.g_flow_id,
    p_static_id        in varchar2 )
    return clob;
end wwv_flow_data_loading_api;
/
show err

set define '^'

