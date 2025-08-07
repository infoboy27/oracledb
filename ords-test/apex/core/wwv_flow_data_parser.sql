set define '^' verify off
prompt ...wwv_flow_data_parser.sql
create or replace package wwv_flow_data_parser authid current_user as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2017, 2024, Oracle and/or its affiliates.
--
-- This package contains the implementation for the APEX file parser. APEX_DATA_PARSER supports XML, JSON,
-- CSV and XLSX files. The most important function in this package is the PARSE function, which is implemented as a
-- table function returning rows of the APEX_T_PARSER_ROW type.
--
-- Column values are generally returned as VARCHAR2(4000). The parser supports up to 300 columns, and 20
-- of these can be handled as a CLOB, in order to support character strings up to 32,767 bytes.
-- File parsing happens on-the-fly as this function is invoked. No data is materialized temporarily.
--
-- # Parser Result Structure
--
-- type APEX_T_PARSER_ROW is object (
--          LINE_NUMBER         NUMBER,
--          COL001              VARCHAR2(4000),
--          COL002              VARCHAR2(4000),
--          :
--          COL300              VARCHAR2(4000),
--
--          CLOB01              CLOB,
--          CLOB02              CLOB,
--          :
--          CLOB20              CLOB );
--
-- type APEX_T_PARSER_TABLE as table of APEX_T_PARSER_ROW;
--
-- # CSV Parsing
--
-- The CSV parser derives column names from the first row, and parses contents based on parameters for row
-- and column delimiters, as well as for "optionally enclosed" characters.
-- There is no line length maximum for CSV files; however, column values are limited to 32K (CLOB columns) or
-- 4000 bytes (VARCHAR2 columns).
--
-- ## Parsing Large CSV Files
--
-- If the size of the CSV file is less than 50 MB, APEX copies the BLOB to an internal and cached temporary LOB.
-- Thus all CSV parsing is done in memory, which is faster. For larger BLOBs, APEX does CSV parsing on the
-- original LOB locator. If that was selected from a table, CSV parsing can happen on disk and might
-- thus be significantly slower. To ensure memory parsing for files larger than 50MB, developers can
-- explicitly copy them to a temporary and cached lob and pass that to the PARSE function, as outlined in the
-- following example.
--
-- Example:
-- Select a (large) BLOB from a table, copy to a cached temporary LOB and pass that to APEX_DATA_PARSER.
--
-- declare
--     l_blob blob;
-- begin
--     sys.dbms_lob.createtemporary( l_blob, true );
--
--     for f in (
--         select blob_column
--           from my_files_table
--          where id = {file-id} )
--     loop
--         sys.dbms_lob.copy(
--             dest_lob    => l_blob,
--             src_lob     => f.blob_column,
--             amount      => sys.dbms_lob.lobmaxsize );
--     end loop;
--
--     -- Now pass "l_blob" as the p_content parameter to APEX_DATA_PARSER.PARSE
--
--     sys.dbms_lob.freetemporary( l_blob );
-- end;
--
-- # XLSX Parsing
--
-- The XLSX parser will extract the worksheet specified by the P_XLSX_SHEET_NAME parameter. Use GET_XLSX_WORKSHEETS
-- to get a list of available worksheets within the XLSX file. P_XLSX_SHEET_NAME expects the internal file name
-- of the XLSX worksheet; use the SHEET_FILE_NAME attribute from the worksheet information returned by GET_XLSX_WORKSHEETS.
-- If P_XLSX_SHEET_NAME is not passed in, then the parser uses the first worksheet in the XLSX file.
-- Column names are derived from the first row in the XLSX worksheet.
--
-- Since XLSX files are technically ZIP archives, containing XML documents, the XLSX parser can be
-- slow for very large XLSX files. In this case, the CSV parser can be the better alternative.
--
-- # JSON Parsing
--
-- If a row selector is passed in, APEX_DATA_PARSER selects the referenced JSON array; otherwise
-- APEX_DATA_PARSER uses the first array in the JSON document. All objects in that array will
-- be returned as rows, and object attributes as columns. Column names are derived from JSON attribute names.
--
-- Example:
-- Given the JSON file
--
--         {"array":[{
--           "num1":4711,
--           "num2":22,
--           "txt1":"Text",
--           "txt2":"More Text",
--           "dt":"2001-01-01"},
--           :
--          ]}
--
-- The parser will return the values of the "num1", "num2", "txt1", "txt2" and "dt" JSON attributes as COL001 to COL005 values.
--
-- COL001  COL002  COL003  COL004     COL005
-- ------- ------- ------- ---------- -----------
-- 4711    22      Text    More Text  2001-01-01
--
-- # XML Parsing:
--
-- If a Row Selector is passed in, XML tags within the addressed element will be returned as result columns, otherwise
-- APEX_DATA_PARSER treats the first tag within the root tag as repeating and containing row data. For instance,
-- if <rowset> is the root tag, and it contains a list of <row> tags, then the contents of the <row> element
-- will be returned as result columns. Column names are derived from XML tag or attribute names.
--
-- Example:
-- Given the XML file
--    <doc xmlns="mynamespace">
--      <r>
--        <num1>4711</num1>
--        <num2>22</num2>
--        <txt1>Text</txt1>
--        <txt2>More Text</txt2>
--        <dt>2001-01-01</dt>
--      </r>
--    </doc>
--
-- The parser will return the values of the <num1>, <num2>, <txt1>, <txt2> and <dt> tags as COL001 to COL005 values.
--
-- COL001  COL002  COL003  COL004     COL005
-- ------- ------- ------- ---------- -----------
-- 4711    22      Text    More Text  2001-01-01
--
-- # About CLOB Support
--
-- This package supports string values larger than 4000 bytes. 20 out of the 300 supported columns can be
-- handled as a CLOB. The level of CLOB support depends upon the file type being parsed.
--
-- * CSV, XML and XLSX
--   * CLOB values are supported up to 32K.
--   * CLOB columns can be detected during discovery.
--   * When the data profile is discovered, values below 4000 bytes are normally returned as "COLNNN". CLOB values
--     are returned in the "CLOBNN" column and the first 1000 characters are returned as "COLNNN". If a data profile
--     is passed in and that has CLOB column defined, all values are returned in the "CLOBNN" column only.
--
-- * JSON
--   * CLOB values are supported up to 32K.
--   * CLOB columns are *not* detected during discovery; CLOB support is only active, if a file profile
--     containing CLOB column is passed in as the P_FILE_PROFILE parameter.
--
-- Since:
-- 19.1
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- File Type Constants
--------------------------------------------------------------------------------
subtype t_file_type is pls_integer range 1..5;

c_file_type_xlsx constant t_file_type  := 1;
c_file_type_csv  constant t_file_type  := 2;
c_file_type_xml  constant t_file_type  := 3;
c_file_type_json constant t_file_type  := 4;
c_file_type_ics  constant t_file_type  := 5;

--------------------------------------------------------------------------------
-- hard coded maximum JSON hierarchy levels to discover. We won't discover
-- more, even when requested.
--------------------------------------------------------------------------------
c_max_json_hierarchies constant pls_integer   := 50;

--------------------------------------------------------------------------------
-- Specifies a file column.
--
-- Attributes:
-- * col_seq:               Column Sequence.
-- * name:                  Column Name.
-- * data_type:             Column Data Type.
-- * data_type_len:         Data Type Length (for VARCHAR2 columns).
-- * selector:              Selector for JSON or XML parser.
-- * decimal_char:          Decimal character used for this NUMBER column.
-- * group_char:            Group character used for this NUMBER column.
-- * format_mask:           Format Mask used for this DATE or NUMBER column.
-- * clob_column:           A value between 1 and 20, indicating the CLOB01 to CLOB20 column, which contains
--                          the actual content for this CLOB column.
--
-- * clob_col_all_rows:     Internal:
-- * file_data_type:        Internal:
-- * parent_column:         Internal:
--------------------------------------------------------------------------------
type t_file_column is record (
    col_seq           pls_integer,
    name              varchar2(128),
    parent_column     pls_integer,
    data_type         wwv_flow_exec_api.t_data_type,
    data_type_len     pls_integer,
    file_data_type    varchar2(7),
    is_json           boolean default false,
    selector          varchar2(32767),
    decimal_char      varchar2(4),
    group_char        varchar2(4),
    format_mask       varchar2(128),
    clob_column       pls_integer,
    clob_col_all_rows boolean default false );

--------------------------------------------------------------------------------
-- Specifies an array of file columns.
--------------------------------------------------------------------------------
type t_file_columns is table of t_file_column index by pls_integer;

--------------------------------------------------------------------------------
-- Specifies a file profile.
--
-- Attributes:
-- * file_type:             Type of the file, use C_FILE_TYPE_* constants.
-- * file_charset:          Characterset of the file.
-- * row_selector:          Row Selector for XML and JSON file types.
-- * is_single_row:         For JSON files: Whether the row selector points to a single row.
-- * first_row_headings:    Whether the CSV or XLSX file contains column headers in the first row.
-- * xlsx_worksheet:        The (internal) name of the XLSX worksheet to parse.
-- * xml_namespaces:        XML namespaces to use when parsing XML files.
-- * csv_delimiter:         The column delimiter to use for CSV parsing.
-- * csv_enclosed:          The optionally enclosed character to use for CSV parsing.
-- * null_if:               If a parsed column value equals this value, return NULL instead.
-- * force_trim_whitespace: Force the parser to trim whitespaces also when within quotes.
-- * file_columns:          Parsed Column information.
--
-- * parsed_rows:           Internal:
--------------------------------------------------------------------------------
type t_file_profile is record(
    file_type              t_file_type,
    file_charset           varchar2(128),
    row_selector           varchar2(32767),
    is_single_row          boolean,
    first_row_headings     boolean,
    xlsx_worksheet         varchar2(128),
    xml_namespaces         varchar2(4000),
    csv_delimiter          varchar2(4),
    csv_enclosed           varchar2(4),
    null_if                varchar2(20),
    force_trim_whitespace  boolean,
    parsed_rows            number,
    skip_rows              pls_integer,
    file_columns           t_file_columns );

--------------------------------------------------------------------------------
-- Internal:
--------------------------------------------------------------------------------
LF                            constant varchar2(1)  := wwv_flow.LF;
CR                            constant varchar2(1)  := wwv_flow.CR;
c_with_loop_killer            constant boolean      := false;

c_num_group_format            constant varchar2(57) := '9G999G999G999GG999G999G999G999G999G999G999G999D9999999999';

c_value_cut_32k               constant varchar2(7)  := 'CUT_32K';
c_value_cut_4k                constant varchar2(6)  := 'CUT_4K';

--==================================================================================================================
-- This function returns a file type, based on a file name extension.
--
-- Parameter:
-- * p_file_name: File name to get the file type.
--
-- Returns:
-- Returns the file type as t_file_type.
--
-- Example:
--
--   declare
--       l_file_type apex_data_parser.t_file_type;
--   begin
--       l_file_type := apex_data_parser.get_file_type( 'test.xlsx' );
--   end;
--==================================================================================================================
function get_file_type(
    p_file_name in varchar2 )
    return t_file_type;
--==================================================================================================================
-- This function checks whether the extension of the file name matches the specified file type.
--
-- Parameter:
-- * p_file_name: File name to assert
-- * p_file_type: File type to assert
--
-- Returns:
-- true, of the file name matches the specified extension, false otherwise.
--
-- Example:
--
--   declare
--       l_is_valid_file_type boolean;
--   begin
--       l_is_valid_file_type := apex_data_parser.assert_file_type(
--                                   p_file_name => 'test.csv',
--                                   p_file_type => apex_data_parser.c_file_type_csv );
--   end;
--==================================================================================================================
function assert_file_type(
    p_file_name in varchar2,
    p_file_type in t_file_type ) return boolean;
--
--==================================================================================================================
-- This function returns information about worksheets within an XLSX workbook (.xlsx file),
-- as a list of APEX_T_PARSER_WORKSHEET instances. When the name of an XLSX worksheet is
-- to be passed to PARSE or DISCOVER, use the value of the SHEET_FILE_NAME attribute.
--
-- Parameter:
-- * p_content: XLSX workbook as a BLOB
--
-- Returns:
-- Table with worksheet information.
--
-- Example:
-- List Worksheets contained in the XLSX file.
--
--   select *
--     from table(
--              apex_data_parser.get_xlsx_worksheets(
--                  p_content => {BLOB containing XLSX file} )
--
--   Output:
--
--   SHEET_SEQUENCE SHEET_DISPLAY_NAME   SHEET_FILE_NAME   SHEET_PATH
--   -------------- -------------------- ----------------- --------------------------
--   1              Sheet1               sheet1.xml        worksheets/sheet1.xml
--
--==================================================================================================================
function get_xlsx_worksheets(
    p_content in blob )
    return wwv_flow_t_parser_worksheets;
--
--==================================================================================================================
-- This function returns the current file profile (determined by the last PARSE or DISCOVER invication) in JSON format.
-- The file profile contains meta data about the parsed files such as the CSV delimiter, the XLSX worksheet name
-- and the columns found during parsing and their data types.
--
-- When APEX_DATA_PARSER is used in an application, the first step is tyically to call PARSE in order to
-- display a data preview. When PARSE runs, it already computes the data profile which is the "current" data
-- profile afterwards. This profile can be retrieved in JSON format using GET_FILE_PROFILE. The GET_COLUMNS
-- function can be used to display file profile information in a structured way.

-- Returns:
-- Returns file profile of the last PARSE invocation in JSON format.
--
-- Example:
-- Parse a CSV file and retrieve the computed file profile.
--
-- # Parse the file. The file profile is being computed and the result can be shown as a preview to end users.
--
--   select line_number, col001, col002, col003, col004, col005, col006, col007, col008
--     from table(
--              apex_data_parser.parse(
--                  p_content         => {BLOB containing XLSX file},
--                  p_file_name       => 'test.xlsx',
--                  p_xlsx_sheet_name => 'sheet1.xml') )
--
--   Output:
--
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
--
-- # Get the computed file profile in JSON format.
--
--   select apex_data_parser.get_file_profile from sys.dual
--
--   Output:
--
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
--
-- See Also:
-- * PARSE
-- * DISCOVER
-- * JSON_TO_PROFILE
-- * GET_COLUMNS
--==================================================================================================================
function get_file_profile
    return clob;
--
--==================================================================================================================
-- Converts a structured file profile to JSON format.
--
-- Parameter:
-- * p_file_profile: the data profile as an instance of t_file_profile
--
-- Returns:
-- The file profile in JSON format.
--
-- Example:
--
--   declare
--       l_profile t_file_profile;
--       l_json    clob;
--   begin
--       -- build the file profile here ...
--       ...
--       l_json := apex_data_parser.json_to_profile( l_profile );
--   end;
--
-- See Also:
-- * PARSE
-- * GET_FILE_PROFILE
-- * JSON_TO_PROFILE
--==================================================================================================================
function profile_to_json(
    p_file_profile in t_file_profile )
    return clob;
--
--==================================================================================================================
-- This function converts a file profile in JSON format to an instance of the t_file_profile record type.
--
-- Parameter:
-- * p_json: The data profile in JSON format.
--
-- Returns:
-- Returns the the file profile in JSON format.
--
-- Example:
--
--   declare
--      l_profile t_file_profile;
--   begin
--      l_profile := apex_data_parser.json_to_profile( '{"file-type", "csv-delimiter" : "", ... }' );
--   end;
--
-- See Also:
-- * PARSE
-- * GET_FILE_PROFILE
-- * PROFILE_TO_JSON
--==================================================================================================================
function json_to_profile(
    p_json in clob )
    return t_file_profile;
--
--==================================================================================================================
-- Parses XML, XLSX, CSV or JSON files and returns rows of the APEX_T_PARSER_ROW type.
--
-- Either P_FILE_NAME, P_FILE_TYPE or P_FILE_PROFILE parameter must be passed in. P_FILE_NAME or P_FILE_TYPE
-- are only to select the parser to use (CSV, XLSX, JSON, XML). The parser will compute a file profile with column
-- information during parse. The P_DETECT_DATA_TYPES parameter determines whether the parser attempts to
-- detect data types or whether all columns are reported as VARCHAR2(4000).
-- The computed file profile can be retrieved using GET_FILE_PROFILE after parsing is completed.
--
-- Data Type detection depends on the P_DETECT_DATA_TYPES parameter (defaults to TRUE). In this case,
-- APEX_DATA_PARSER will attempt to detect data types by looking into parsed column values. Note that
-- data type detection thus depends on the amount of data being parsed. For instance, the 1000 rows
-- of a CSV file or XLSX worksheet contain only numbers, but strings afterwards. In this case, when
-- only the first 100 rows are being parsed for a data preview, then APEX_DATA_PARSER  might wrongly report
-- this column as a NUMBER column. It's recommended to always parse a significant part of the file in order
-- to detect data types correctly.
-- If P_DETECT_DATA_TYPES is passed in as FALSE, APEX_DATA_PARSER will report all columns as VARCHAR2(4000).
--
-- Parameter:
-- * p_content:                     The file content to be parsed, as a BLOB.
-- * p_file_name:                   The name of the file; only used to derive the file type.
-- * p_file_type:                   The type of the file to be parsed.
-- * p_file_profile:                The file profile (obtained from a previous PARSE or DISCOVER call) to use
--                                  for file parsing.
--
-- * p_detect_data_types:           Whether to detect data types or not. When no data types are being detected, all
--                                  columns are reported as VARCHAR2(4000).
-- * p_decimal_char:                Decimal Character to use when parsing NUMBER values.
--
-- * p_xlsx_sheet_name:             Name of the worksheet to extract from the XLSX file. See GET_XLSX_WORKSHEETS.
--
-- * p_row_selector:                Row Selector to use for XML or JSON files.
--
-- * p_csv_row_delimiter:           Row delimiter for CSV files; defaults to Linefeed (LF).
-- * p_csv_col_delimiter:           Column delimiter for parsing CSV files. If not provided, APEX_DATA_PARSER will
--                                  choose ",", ";", "#", "|" or [Tab], based on occurrence in the first line.
-- * p_csv_enclosed:                Character which optionally encloses values for the CSV parser.
--
-- * p_skip_rows:                   Amount of rows to skip before parsing.
-- * p_add_headers_row:             Whether to prepend parser results with the column headers; this is useful
--                                  for XML and JSON parsing to get the same behavior as for CSV and XLSX parsing.
--
-- * p_nullif:                      Similar to SQL NULLIF function: If the column has this value, return NULL.
-- * p_force_trim_whitespace:       Whether to force trim enquoted whitespace from parsed values.
--
-- * p_file_charset:                File encoding; defaults to Unicode (UTF-8).
-- * p_max_rows:                    The parser stops after processing this amount of rows.
-- * p_return_rows:                 The parser stops returning rows after this amount of rows. However, parsing
--                                  and data type detection continues until the end of the file or until P_MAX_ROWS
--                                  rows have been processed.
--
-- * p_store_profile_to_collection: Store the computed file profile as the CLOB001 member into this collection after
--                                  parsing is completed. Useful to persist the file profile for the lifetime of the
--                                  current APEX session.
--
-- * p_xml_namespaces:              XML namespaces to use when parsing XML files.
--
-- * p_fix_excel_precision:         Whether to round numbers in XLSX files to 15 significant digits. This is useful
--                                  for XLSX files generated by Microsoft Excel. Excel stores numeric values as
--                                  floating point numbers with a maximum of 15 significant digits. For calculation
--                                  results, this can lead to rounding issues, which are fixed using this parameter.
--                                  See also: https://docs.microsoft.com/en-us/office/troubleshoot/excel/floating-point-arithmetic-inaccurate-result
--
-- Returns:
-- Rows of the APEX_T_PARSER_ROW type.
--
-- Example:
--
--   select line_number, col001,col002,col003,col004,col005,col006,col007,col008
--      from table(
--               apex_data_parser.parse(
--                   p_content         => {BLOB containing XLSX spreadsheet},
--                   p_file_name       => 'test.xlsx',
--                   p_xlsx_sheet_name => 'sheet1.xml') )
--
--   Output:
--
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
--
--   select line_number, col001,col002,col003,col004,col005,col006,col007,col008
--      from table(
--               apex_data_parser.parse(
--                   p_content         => {BLOB containing JSON file},
--                   p_file_name       => 'test.json') )
--
--   Output:
--
--   LINE_NUMBER COL001    COL002   COL003                                COL004          COL005
--   ----------- --------- ---------------------------------------------- --------------- --------------
--             1 Feature   1.5      41km E of Cape Yakataga, Alaska       1536513727239   1536514117117
--             2 Feature   0.21     11km ENE of Aguanga, CA               1536513299520   1536513521231
--             3 Feature   1.84     5km SSW of Pahala, Hawaii             1536513262940   1536513459610
--             4 Feature   2.55     9km W of Volcano, Hawaii              1536513100890   1536513446680
--             5 Feature   1.3      62km ESE of Cape Yakataga, Alaska     1536512917361   1536513322236
--             6 Feature   1.79     7km SW of Tiptonville, Tennessee      1536512379690   1536512668010
--             7 Feature   1.9      126km NNW of Arctic Village, Alaska   1536512346186   1536512846567
--             8 Feature   1.4      105km NW of Arctic Village, Alaska    1536512140162   1536512846334
--
-- See Also:
-- - GET_FILE_TYPE
-- - GET_XLSX_WORKSHEETS
-- - GET_FILE_PROFILE
-- - GET_COLUMNS
--==================================================================================================================
function parse(
    p_content                      in blob,
    p_file_name                    in varchar2     default null,
    p_file_type                    in t_file_type  default null,
    p_file_profile                 in clob         default null,
    --
    p_detect_data_types            in varchar2     default 'Y',
    p_decimal_char                 in varchar2     default null,
    --
    p_xlsx_sheet_name              in varchar2     default null,
    --
    p_row_selector                 in varchar2     default null,
    --
    p_csv_row_delimiter            in varchar2     default LF,
    p_csv_col_delimiter            in varchar2     default null,
    p_csv_enclosed                 in varchar2     default '"',
    --
    p_skip_rows                    in pls_integer  default null,
    p_add_headers_row              in varchar2     default 'N',
    --
    p_nullif                       in varchar2     default null,
    p_force_trim_whitespace        in varchar2     default 'N',
    --
    p_file_charset                 in varchar2     default 'AL32UTF8',
    p_max_rows                     in number       default null,
    p_return_rows                  in number       default null,
    --
    p_store_profile_to_collection  in varchar2     default null,
    p_xml_namespaces               in varchar2     default null,
    --
    p_fix_excel_precision          in varchar2     default 'N',
    --
    p_hierarchy_levels             in number       default null )
    return wwv_flow_t_parser_table pipelined;
--
--==================================================================================================================
-- This is a function to discover the column profile of a file. This function calls PARSE and then returns the
-- generated file profile. This function is a shortcut which can be used instead of first calling PARSE and then
-- GET_FILE_PROFILE.
--
-- Parameter:
-- * p_content:                     The file content to be parsed, as a BLOB.
-- * p_file_name:                   The name of the file; only used to derive the file type.
--
-- * p_decimal_char:                Decimal Character to use when parsing NUMBER values.
--
-- * p_xlsx_sheet_name:             Name of the worksheet to extract from the XLSX file. See GET_XLSX_WORKSHEETS.
--
-- * p_row_selector:                Row Selector to use for XML or JSON files.
--
-- * p_csv_row_delimiter:           Row delimiter for CSV files; defaults to Linefeed (LF).
-- * p_csv_col_delimiter:           Column delimiter for parsing CSV files. If not provided, APEX_DATA_PARSER will
--                                  choose ",", ";", "#", "|" or [Tab], based on occurrence in the first line.
-- * p_csv_enclosed:                Character which optionally encloses values for the CSV parser.
--
-- * p_skip_rows:                   Amount of rows to skip before parsing.
--                                  for XML and JSON parsing to get the same behavior as for CSV and XLSX parsing.
--
-- * p_nullif:                      Similar to SQL NULLIF function: If the column has this value, return NULL.
-- * p_force_trim_whitespace:       Whether to force trim enquoted whitespace from parsed values.
--
--
-- * p_file_charset:                File encoding; defaults to Unicode (UTF-8).
-- * p_max_rows:                    The parser stops after processing this amount of rows.
--
-- * p_xml_namespaces:              XML namespaces to use when parsing XML files.
--
-- Returns:
-- CLOB containing the file profile in JSON format.
--
-- Example:
--
--   select apex_data_parser.discover(
--              p_content   => {BLOB containing XLSX file},
--              p_file_name => 'large.xlsx' ) as profile_json
--   from sys.dual
--
--   Output:
--
--   PROFILE_JSON
--   -----------------------------------------------------------
--   {
--      "file-encoding" : "AL32UTF8",
--      "single-row" : false,
--      "file-type" : 1,
--      "parsed-rows" : 2189,
--      "columns" : [
--         {
--            "name" : "C0",
--            "format-mask" : "",
--            "selector" : "",
--            "data-type" : 2
--         },
--         {
--            "selector" : "",
--            "format-mask" : "",
--            "data-type" : 1,
--            "name" : "FIRST_NAME"
--         },
--         {
--            "name" : "LAST_NAME",
--            "format-mask" : "",
--            "selector" : "",
--            "data-type" : 1
--         },
--
--         :
--
--         {
--            "name" : "DATE_",
--            "format-mask" : "DD\"/\"MM\"/\"YYYY",
--            "data-type" : 3,
--            "selector" : ""
--         },
--         {
--            "format-mask" : "",
--            "selector" : "",
--            "data-type" : 2,
--            "name" : "ID"
--         }
--      ],
--      "row-selector" : "",
--      "headings-in-first-row" : true,
--      "xslx-worksheet" : "sheet1.xml",
--      "csv-delimiter" : ""
--   }
--
-- See Also:
-- - GET_FILE_TYPE
-- - GET_XLSX_WORKSHEETS
-- - GET_COLUMNS
--==================================================================================================================
function discover(
    p_content                   in blob,
    p_file_name                 in varchar2,
    --
    p_decimal_char              in varchar2     default null,
    --
    p_xlsx_sheet_name           in varchar2     default null,
    --
    p_row_selector              in varchar2     default null,
    --
    p_csv_row_delimiter         in varchar2     default LF,
    p_csv_col_delimiter         in varchar2     default null,
    p_csv_enclosed              in varchar2     default '"',
    --
    p_skip_rows                 in pls_integer  default null,
    --
    p_nullif                    in varchar2     default null,
    p_force_trim_whitespace     in varchar2     default 'Y',
    --
    p_file_charset              in varchar2     default 'AL32UTF8',
    p_max_rows                  in number       default 200,
    --
    p_xml_namespaces            in varchar2     default null,
    --
    p_hierarchy_levels          in number       default null )
    return clob;
--
--==================================================================================================================
-- This function returns the columns of a parser profile as a table in order to be consumed by Oracle APEX
-- components.
--
-- Parameter:
-- * p_file_profile: File profile to be used for parsing. The file profile might have been computed in a previous
--                   PARSE or DISCOVER invocation.
--
-- Returns:
-- Profile column information as rows of APEX_T_PARSER_COLUMNS.
--
-- Example:
-- This example uses DISCOVER to compute a file profile and then GET_COLUMS to return the list of columns among
-- with their data types.
--
--  select column_position,
--         column_name,
--         data_type,
--         format_mask
--    from table(
--             apex_data_parser.get_columns(
--                 apex_data_parser.discover(
--                     p_content   => {BLOB containing XLSX file},
--                     p_file_name => 'large.xlsx' ) ) )
--
--   Output:
--
--   COLUMN_POSITION COLUMN_NAME   DATA_TYPE   FORMAT_MASK
--   --------------- ------------- ----------- ------------------
--                 1 C0            NUMBER
--                 2 FIRST_NAME    VARCHAR2
--                 3 LAST_NAME     VARCHAR2
--                 4 GENDER        VARCHAR2
--                 5 COUNTRY       VARCHAR2
--                 6 AGE           NUMBER
--                 7 DATE_         DATE        DD"/"MM"/"YYYY
--                 8 ID            NUMBER
--
-- See Also:
-- - GET_FILE_PROFILE
-- - DISCOVER
--==================================================================================================================
function get_columns(
    p_profile in clob )
    return wwv_flow_t_parser_columns pipelined;

--==================================================================================================================
-- Set flags to control parser behavior. Existing flags include:
--
-- * CSV_BACKSLASH_ESCAPING:      When 'Y', the parser treats the backslash character as additional escape for the
--                                the enclosed character. Defaults to 'Y' for backwards compatibility.
-- * XML_FORCE_BINARY:            Internal:
--
-- Parameters:
-- * p_name:         Name of the flag to set
-- * p_value:        Value to set
--==================================================================================================================
procedure set_parser_flags(
    p_name     in varchar2,
    p_value    in varchar2 );

end wwv_flow_data_parser;
/
sho err
