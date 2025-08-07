set define '^' verify off
prompt ...wwv_dg_blueprint_util_int.sql
create or replace PACKAGE wwv_dg_blueprint_util_int authid definer as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2021, 2023, Oracle and/or its affiliates.
--
-- This package contains the implementation for data generation in APEX.
--
--
-- Since: 21.1
--
--    MODIFIED   (MM/DD/YYYY)
--     jstraub    01/11/2021 - Created from Anton Nielsen, Neelesh Shah
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Misc Globals
--------------------------------------------------------------------------------
LF                             constant varchar2(1)   := unistr('\000a');
g_preview_in_progress          boolean                := FALSE;
c_max_error_count              constant number        := 10000;
c_comma                        constant varchar2 (1)  := ',';
c_nl                           constant varchar2 (15) := chr (13) || chr(10);
c_cr                           constant varchar2(1)    := chr(13);
c_lf                           constant varchar2(1)    := chr(10);
c_crlf                         constant varchar2(2)    := c_cr || c_lf;
c_json_date_format             constant varchar2 (32) := 'YYYY-MM-DD"T"HH24:MI:SS"Z"';
c_empty_t_varchar2             wwv_flow_t_varchar2;
g_current_schema               varchar2(2000);
c_column_pad                   constant varchar2(100)  := '            ';
c_min_max_date                 constant number         := 36500;  -- Default applied to dates when no min/max date specifid
c_default_seq_offset           constant number         := 100;  -- Gap between table and column sequences 

c_process_status               constant number        := 0;
c_process_complete             constant number        := 10;
c_process_error                constant number        := 20;
c_process_stop                 constant number        := 99;

c_progress_status_in_progress  constant varchar2(20)  := 'IN PROGRESS';   
c_progress_status_complete     constant varchar2(20)  := 'COMPLETE';
c_progress_status_error        constant varchar2(20)  := 'ERROR';
c_progress_status_stopped      constant varchar2(20)  := 'STOPPED';

--==================================================================================================================
-- This procedure creates a blueprint which is a collection of tables with corresponding columns and data generation
-- attributes
--
-- Parameters:
-- * p_name:           Identifier for the blueprint, combination of name and language is unique, Name is automatically upper cased and special characters removed.
--   p_display_name    Friendly display name
--   p_description     Description of the blueprint
--   p_lang            Blueprint language determines values from builtin data sources. If the builtin data source has
--                     0 records in this language, 'en' is used
--   p_default_schema  The default schema name for the blueprint
--   p_blueprint_id    ID of the added blueprint (OUT)
--
-- Example:
--
--   declare
--     l_blueprint_id number;
--   begin
--       apex_dg_data_gen.add_blueprint(
--                    p_name           => 'Cars',
--                    p_display_name   => 'My Cars Blueprint',
--                    p_description    => 'A blueprint to generate car data',
--                    p_blueprint_id   => l_blueprint_id);
--   end;
--==================================================================================================================
procedure add_blueprint
   (p_name                  in varchar2,
    p_display_name          in varchar2 default null,
    p_description           in varchar2 default null,
    p_lang                  in varchar2 default 'en',
    p_default_schema        in varchar2 default null,
    p_blueprint_id          out number
   );

--==================================================================================================================
-- This procedure updates the attributes of an existing blueprint
--
-- Parameters:
-- * p_name:           Name of blueprint to update
--   p_new_name        The new name (rename). The name is upper cased and special characters removed.
--   p_display_name    Friendly display name
--   p_description     Description of the blueprint.
--   p_lang            blueprint language determines values from builtin data sources. If the builtin data source has
--                     0 records in this language, 'en' is used
--   p_default_schema  The default schema name

-- Example:
--
--
--   begin
--       apex_dg_data_gen.update_blueprint(
--                    p_name           => 'Cars',
--                    p_display_name   => 'My Cars',
--                    p_description    => 'An updated blueprint to generate car data');
--   end;
--==================================================================================================================
procedure update_blueprint
   (p_name                  in varchar2,
    p_new_name              in varchar2 default null,   
    p_display_name          in varchar2 default null,
    p_description           in varchar2 default null,
    p_lang                  in varchar2 default 'en',
    p_default_schema        in varchar2 default null
   );

--==================================================================================================================
-- This procedure removes meta data associated with a blueprint.
--
-- Parameters:
-- * p_name:           Name of blueprint to be removed.
--
--
-- Example:
--
--
--   begin
--       apex_dg_data_gen.remove_blueprint(
--                    p_name           => 'Cars');
--   end;
--==================================================================================================================
procedure remove_blueprint
    (p_name                  in varchar2
    );

--==================================================================================================================
-- This function exports a blueprint in JSON format.
--
-- Parameters:
-- * p_name:           Name of blueprint to export.
--   p_pretty          Y to return pretty results, all other values do not.
--
-- Returns:
-- Returns the blueprint as a JSON document in a CLOB.
--
-- Example:
--
--
--   declare
--       l_json clob;
--   begin
--       l_json := apex_dg_data_gen.export_blueprint(
--                    p_name => 'Cars');
--   end;
--==================================================================================================================
function export_blueprint
    (p_name                  in varchar2,
     p_pretty                in varchar2 default 'Y'
    ) return clob;


--==================================================================================================================
-- This procedure imports a JSON blueprint
--
-- Parameters:
-- * p_clob:            Blueprint in JSON format.
--   p_override_name    Name of blueprint, this will override the name provided in p_clob.
--   p_replace          Return error if blueprint exist and p_replace = FALSE. Will replace the blueprint (or p_override_name if provided).
-- * p_blueprint_id     ID of the imported blueprint (OUT)
--
--
-- Example:
--
--
--   declare
--       l_json clob;
--       l_blueprint_id number;
--   begin
--       l_json := apex_dg_data_gen.export_blueprint(
--                    p_name => 'Cars');
--
--       apex_dg_data_gen.import_blueprint(
--                    p_clob => l_json,
--                    p_replace => TRUE,
--                    p_blueprint_id => l_blueprint_id);
--   end;
--==================================================================================================================
procedure import_blueprint
    (p_clob                  in clob,
     p_override_name         in varchar2 default null,
     p_replace               in boolean default FALSE,
     p_blueprint_id          out number
    );


--==================================================================================================================
-- This procedure creates a data source which identifies a table or query from which you can source data values.
--
-- Parameters:
-- * p_blueprint           Identifies the blueprint
-- * p_name                Name of a data source, Name is upper cased and must be 26 characters or less
-- * p_data_source_type    TABLE, SQL_QUERY
--   p_table               For source type = TABLE. Typically this will match p_name.
--   p_preserve_case       Defaults to N which forces p_table_name to uppercase, if Y perserves casing of p_table
--   p_sql_query           For p_data_source_type  = SQL_QUERY
--   p_where_clause        For p_data_source_type = TABLE, this adds the where clause. Do not include "where" keyword. e.g. deptno <= 20
--   p_inline_data         This will be used for p_data_source_type JSON_DATA
--   p_order_by_column     Not used
--
--
-- Example:
--
--   declare
--     l_data_source_id number;
--   begin
--       apex_dg_data_gen.add_data_source(
--                    p_blueprint           => 'Cars',
--                    p_name                => 'apex_dg_builtin_cars',
--                    p_data_source_type    => 'TABLE',
--                    p_table               => 'apex_dg_builtin_cars',
--                    p_data_source_id      => l_data_source_id  );
--   end;
--==================================================================================================================
procedure add_data_source

    (p_blueprint             in varchar2,
     p_name                  in varchar2,
     p_data_source_type      in varchar2,
     p_table                 in varchar2 default null,
     p_preserve_case         in varchar2 default 'N',
     p_sql_query             in varchar2 default null,
     p_where_clause          in varchar2 default null,
     p_inline_data           in clob     default null,
     p_order_by_column       in varchar2 default null,
     p_data_source_id        out number
    );


--==================================================================================================================
-- This procedure removes meta data associated with the data source for given blueprint.
--
-- Parameters:
-- * p_blueprint           Identifies the blueprint
-- * p_name                Data source to be removed from blueprint
--
--
-- Example:
--
--
--   begin
--       apex_dg_data_gen.remove_data_source(
--                    p_blueprint           => 'Cars',
--                    p_name                => 'apex_dg_builtin_cars');
--   end;
--==================================================================================================================
procedure remove_data_source
    (p_blueprint             in varchar2,
     p_name                  in varchar2
    );

--==================================================================================================================
-- This procedure updates an existing data source which identifies a table or query from which you can source data values.
--
-- Parameters:
-- * p_blueprint           Identifies the blueprint
-- * p_name                Name of a data source, Name is upper cased and must be 26 characters or less
--   p_new_name            New ame of a data source (rename), Name is upper cased and must be 26 characters or less
-- * p_data_source_type    TABLE, SQL_QUERY
--   p_table               For source type = TABLE. Typically this will match p_name.
--   p_preserve_case       Defaults to N which forces p_table_name to uppercase, if Y perserves casing of p_table
--   p_sql_query           For p_data_source_type  = SQL_QUERY
--   p_where_clause        For p_data_source_type = TABLE, this adds the where clause. Do not include "where" keyword. e.g. deptno <= 20
--   p_inline_data         This will be used for p_data_source_type JSON_DATA
--   p_order_by_column     Not used
--
--
-- Example:
--
--
--   begin
--       apex_dg_data_gen.update_data_source(
--                    p_blueprint           => 'Cars',
--                    p_name                => 'apex_dg_builtin_cars',
--                    p_data_source_type    => 'TABLE',
--                    p_table               => 'apex_dg_builtin_cars');
--   end;
--==================================================================================================================
procedure update_data_source
    (p_blueprint             in varchar2,
     p_name                  in varchar2,
     p_new_name              in varchar2 default null,     
     p_data_source_type      in varchar2,
     p_table                 in varchar2 default null,
     p_preserve_case         in varchar2 default 'N',
     p_sql_query             in varchar2 default null,
     p_where_clause          in varchar2 default null,
     p_inline_data           in clob     default null,
     p_order_by_column       in varchar2 default null
    );

--==================================================================================================================
-- This procedure adds a destination table for the generated data.
--
-- Parameters:
-- * p_blueprint           Identifier for the blueprint
-- * p_sequence            1 for first table, 2 for second etc.
-- * p_table_name          Name of table that can exist or not exist
--   p_preserve_case       Defaults to N which forces table name to uppercase, if Y perserves casing of parameter
--   p_display_name        Friendly display name
--   p_singular_name       Singluar friendly name
--   p_plural_name         Plural friendly name
--   p_rows                Number of rows to generate for this table
--   p_max_rows            If null then p_rows determines the number of rows, else random rows between p_rows and p_max_rows will be used when generating output
--   p_use_existing_table  If Y, uses the data dictionary to auto generate columns
--                         The automatic blueprint column creation supports the following data source mapping rules:
--                              * Foreign key data generation (populates the column with keys from the master table)
--                              * Inline data generation based on CHECK constraints (simple IN constructs are supported)
--                              * Mapping based on existing builtin tables (based on the table and column name)
--                              * Mapping based on the column name, datatype and length
--                              * If the column is nullable, 5% of the values will be NULL
--   p_exclude_columns     String array (apex_t_varchar2) of column names to exclude from the auto column generation
-- * p_table_id            ID of the added table (OUT)
--
--
-- Examples:
--
--   declare
--       l_table_id number;
--   begin
--       apex_dg_data_gen.add_table(
--                    p_blueprint               => 'Cars',
--                    p_sequence                => 1,
--                    p_table_name              => 'my_cars',
--                    p_rows                    => '50',
--                    p_table_id                => l_table_id);
--
--       apex_dg_data_gen.add_table(
--                    p_blueprint               => 'Cars',
--                    p_sequence                => 1,
--                    p_table_name              => 'my_cars',
--                    p_rows                    => '50',
--                    p_use_existing_table      => 'Y',
--                    p_table_id                => l_table_id
--       );
--
--       apex_dg_data_gen.add_table(
--                    p_blueprint               => 'Cars',
--                    p_sequence                => 1,
--                    p_table_name              => 'my_cars',
--                    p_rows                    => '50',
--                    p_use_existing_table      => 'Y',
--                    p_exclude_columns         => apex_t_varchar2('CREATED_BY','CREATED_DATE'),
--                    p_table_id                => l_table_id
--       );
--   end;
--==================================================================================================================
procedure add_table
    (p_blueprint             in varchar2,
     p_sequence              in pls_integer,
     p_table_name            in varchar2,
     p_preserve_case         in varchar2 default 'N',
     p_display_name          in varchar2 default null,
     p_singular_name         in varchar2 default null,
     p_plural_name           in varchar2 default null,
     p_rows                  in number   default 0,
     p_max_rows              in number   default null,
     p_use_existing_table    in varchar2 default 'N',
     p_exclude_columns       in wwv_flow_t_varchar2 default c_empty_t_varchar2,
     p_table_id              out number
    );


--==================================================================================================================
-- This procedure removes a table for the specified blueprint.
--
-- Parameters:
-- * p_blueprint           Identifier for the blueprint
-- * p_table_name          Table name to be removed from blueprint
--
--
-- Example:
--
--
--   begin
--       apex_dg_data_gen.remove_table(
--                    p_blueprint               => 'Cars',
--                    p_table_name              => 'MY_CARS');
--   end;
--==================================================================================================================
procedure remove_table
    (p_blueprint             in varchar2,
     p_table_name            in varchar2
    );


--==================================================================================================================
-- This procedure updates the attributes for a blueprint table
-- The logical key is p_blueprint and p_table_name
--
-- Parameters:
-- * p_blueprint           Identifier for the blueprint
-- * p_table_name          Name of table that can exist or not exist
--   p_new_table_name      New table name (rename)
-- * p_sequence            1 for first table, 2 for second etc
--   p_preserve_case       Defaults to N which forces p_new_table_name to uppercase, if Y perserves casing of p_new_table_name
--   p_display_name        Friendly display name
--   p_singular_name       Singluar friendly name
--   p_plural_name         Plural friendly name
--   p_rows                Number of rows to generate for this table
--   p_max_rows            If null then p_rows determines the number of rows, else random rows between p_rows and p_max_rows will be used when generating output
--   p_use_existing_table  If this is Y all columns will be removed and recreated
--   p_exclude_columns     String array (apex_t_varchar2) of column names to exclude from the auto column generation
--
--
-- Examples:
--
--  begin
--    apex_dg_data_gen.update_table(
--                p_blueprint               => 'Cars',
--                p_table_name              => 'MY_CARS',
--                p_sequence                => 20,
--                p_new_table_name          => 'MY_NEW_CARS',
--                p_display_name            => 'My great cars 2',
--                p_singular_name           => 'My car',
--                p_plural_name             => 'My Cars',
--                p_rows                    => '50',
--                p_use_existing_table      => 'N'
--     );
--   end;
--
--   begin
--       apex_dg_data_gen.update_table(
--                    p_blueprint               => 'Cars',
--                    p_table_name              => 'my_cars',
--                    p_sequence                => 10,
--                    p_rows                    => '50',
--                    p_use_existing_table      => 'Y',
--                    p_exclude_columns         => apex_t_varchar2('CREATED_BY','CREATED_DATE')
--       );
--   end;
--==================================================================================================================
procedure update_table
    (p_blueprint             in varchar2,
     p_table_name            in varchar2,
     p_new_table_name        in varchar2 default null,
     p_sequence              in pls_integer,
     p_preserve_case         in varchar2 default 'N',
     p_display_name          in varchar2 default null,
     p_singular_name         in varchar2 default null,
     p_plural_name           in varchar2 default null,
     p_rows                  in number default 0,
     p_max_rows              in number default null
    );

--==================================================================================================================
-- This procedure adds a column to the blueprint table.
--
-- Parameters:
-- * p_blueprint             Identifier for the blueprint
-- * p_sequence              1 for first column, 2 for second etc
-- * p_table_name            Table name as known to blueprint (note:first checks exact case, then checks upper case)
-- * p_column_name           Name of the column
--   p_preserve_case         Defaults to N which forces column name to uppercase, if Y perserves casing of parameter
--   p_display_name          A friendly name for a given table
--   p_max_length            When generating data (e.g. latin text) substring to this
--   p_multi_value           Y or N (currently  available for BUILTIN table data and INLINE data)
--                           BUILTIN table data will be distinct
--                           INLINE data will be distinct if all values appear once (red,1;blue,1;green,1). Will allow duplicates otherwise (red,3;blue,4;green,8).
--                           Note: database will sometimes misbehave and not give the right number of values
--   p_mv_format             DELIMITED (based upon p_mv_delimiter) or JSON (e.g. {"p_column_name" : ["sympton1","sympton2"]} )
--   p_mv_unique             Y indicates values will not repeat within the multi-value column, N indicates values may repeat
--   p_mv_delimiter          Delimiter for a DELIMITED
--   p_mv_min_entries        Minimum values in a multi value list
--   p_mv_max_entries        Maximum values in a multi value list
--   p_mv_partition_by       This value must match a column in the same builtin data source, e.g. if p_data_sourse is "car.model", this value might be "make" because "car.make" is valid.
--   p_lang                  language code en, de, es *** not currenlty used
-- * p_data_source_type      DATA_SOURCE, BUILTIN, BLUEPRINT, INLINE, SEQUENCE, FORMULA  (Note: FORMULA requires p_data_source to be null)
--   p_data_source           When p_data_source_type = DATA_SOURCE then DATA_SOURCE_NAME.COLUMN_NAME (column names case follows p_ds_preserve_case and by default will upper case)
--                                                   = BUILTIN then see builtin list, must match exactly a builtin
--                                                   = BLUEPRINT references table data already generated (table must have lower sequence), e.g. Dept.Deptno where add_table with p_table_name = Dept and add_column with Deptno exist
--                                                      (note: This is case sensitive. Tables created with p_preserve_case = N are automatically upper cased. Hence, this will typically require DEPT.DEPTNO instead of dept.deptno)
--                                                   = INLINE then PART_TIME,3;FULL_TIME,7   -- note: it is best to use the smallest numeric values that provide the desired distribution.
--                                                   = SEQUENCE uses p_sequence_ params
--                                                   = FORMULA p_data_source must be null. Uses p_formula as a plsql formula and {column_name} as substitutions from this table, e.g. p_formula => {first_name}||'.'||{last_name}||'.insum.ca'
--   p_ds_preserve_case      If p_data_source_type in ('DATA_SOURCE'. 'BLUEPRINT') and p_ds_preserve_case = N then the data source will be upper cased to match an upper case table_name.column_name
--   p_min_numeric_value     Minimum numeric value, values equal or greater than this value. Note: Only used in BUILTIN functions.
--   p_max_numeric_value     Maximum numeric value, values. Note: Only used in BUILTIN functions.
--   p_numeric_precision     0=no decimal values, -1=round to ten, positive integer=# of decimal places
--   p_min_date_value        Minimum date value, values equal or greater than this value. Note: Only used in BUILTIN functions.
--   p_max_date_value        Maximum date value, must be greater than or equal to p_min_date_value, if specified. Note: Only used in BUILTIN functions.
--   p_format_mask           Format mask when datatype is a date
--   p_date_precision        YEAR, QUARTER, MONTH, WEEK, DAY, HOUR, MINUTE, SECOND. Note: *** not implemented.
--   p_sequence_start_with   Only used when p_data_source_type = SEQUENCE
--   p_sequence_increment    Only used when p_data_source_type = SEQUENCE
--   p_depends_on            Only populate when another column in this row is equal to value (including null). Note: not implemented.
--   p_formula               Allows referencing columns in this row,
--                           PL/SQL expressions that can reference columns defined in this blueprint row
--                           Example: {FIRST_NAME}||'.'||{LAST_NAME}||'.insum.ca' (note: substitutions are case sensitive and must match {column_name} exactly. If p_preserve_case was set to N, {COLUMN_NAME} must be upper case.)
--                           Can be used on any DATA_SOURCE_TYPE
--                           NOTE: formulas are applied last, after p_percent_blank. Hence if p_percent_blank = 100 but FORMULAR is "sysdate", the column value will be sysdate
--   p_formula_lang          PLSQL and Javascript. Refrence columns in this table as {column_name}.  *** only PLSQL implemented
--   p_custom_attributes     For future expansion
--   p_percent_blank         0-100. This is applied prior to all formulas. Hence, if this column is referenced in a formula, the formula will have a blank when appropriate. A formula on this column, however, may cause the column to not be blank.
-- * p_column_id             ID of the added column (OUT)
--
-- Example:
--
--   declare
--       l_column_id number;
--   begin
--       apex_dg_data_gen.add_column(
--                    p_blueprint               => 'Cars',
--                    p_sequence                => 1,
--                    p_table_name              => 'MY_CARS',
--                    p_column_name             => 'make',
--                    p_data_source_type        => 'BUILTIN',
--                    p_data_source             => 'car.make',
--                    p_column_id               => l_column_id);
--   end;
--==================================================================================================================
procedure add_column
    (p_blueprint             in varchar2,
     p_sequence              in pls_integer,
     p_table_name            in varchar2,
     p_column_name           in varchar2,
     p_preserve_case         in varchar2 default 'N',
     p_display_name          in varchar2 default null,
     p_max_length            in number default 4000,
     p_multi_value           in varchar2 default 'N',
     p_mv_format             in varchar2 default 'JSON',
     p_mv_unique             in varchar2 default 'Y',
     p_mv_delimiter          in varchar2 default ':',
     p_mv_min_entries        in integer default 1,
     p_mv_max_entries        in integer default 2,
     p_mv_partition_by       in varchar2 default null,
     p_lang                  in varchar2 default 'en',
     p_data_source_type      in varchar2,
     p_data_source           in varchar2 default null,
     p_ds_preserve_case      in varchar2 default 'N',
     p_min_numeric_value     in number default 1,
     p_max_numeric_value     in number default 10,
     p_numeric_precision     in number default 0,
     p_min_date_value        in date default null,
     p_max_date_value        in date default null,
     p_format_mask           in varchar2 default c_json_date_format,
     p_date_precision        in varchar2 default null,
     p_sequence_start_with   in number default 1,
     p_sequence_increment    in number default 1,
     p_depends_on            in varchar2 default null,
     p_formula               in varchar2 default null,
     p_formula_lang          in varchar2 default 'PLSQL',
     p_custom_attributes     in varchar2 default null,
     p_percent_blank         in number default 0,
     p_column_id             out number
    );


--==================================================================================================================
-- This procedure removes a column from the blueprint table.
--
-- Parameters:
-- * p_blueprint             Identifier for the blueprint
-- * p_table_name            Name of table within blueprint
-- * p_column_name           Name of column within table
--
--
-- Example:
--
--
--   begin
--       apex_dg_data_gen.remove_column(
--                    p_blueprint               => 'Cars',
--                    p_table_name              => 'MY_CARS',
--                    p_column_name             => 'MAKE');
--   end;
--==================================================================================================================
procedure remove_column
    (p_blueprint             in varchar2,
     p_table_name            in varchar2,
     p_column_name           in varchar2
    );

--==================================================================================================================
-- This procedure updates an existing column in a blueprint table.
--
-- Parameters:
-- * p_blueprint             Identifier for the blueprint
-- * p_sequence              1 for first column, 2 for second etc
-- * p_table_name            Table name as known to blueprint (note:first checks exact case, then checks upper case)
-- * p_column_name           Name of column
--   p_new_column_name       New name of column (rename)
--   p_preserve_case         Defaults to N which forces p_new_column_name to uppercase, if Y perserves casing of p_new_column_name
--   p_display_name          A friendly name for a given
--   p_max_length            When generating data (e.g. latin text) substring to this
--   p_multi_value           Y or N (currently  available for BUILTIN table data and INLINE data)
--                           BUILTIN table data will be distinct
--                           INLINE data will be distinct if all values appear once (red,1;blue,1;green,1). Will allow duplicates otherwise (red,3;blue,4;green,8).
--                           Note: database will sometimes misbehave and not give the right number of values
--   p_mv_format             DELIMITED (based upon p_mv_delimiter) or JSON (e.g. {"p_column_name" : ["sympton1","sympton2"]} )
--   p_mv_unique             Y indicates values will not repeat within the multi-value column, N indicates values may repeat
--   p_mv_delimiter          Delimiter for a DELIMITED
--   p_mv_min_entries        Minimum values in a multi value list
--   p_mv_max_entries        Maximum values in a multi value list
--   p_mv_partition_by       This value must match a column in the same builtin data source, e.g. if p_data_sourse is "car.model", this value might be "make" because "car.make" is valid.
--   p_lang                  Language code en, de, es *** not currenlty used
-- * p_data_source_type      DATA_SOURCE, BUILTIN, BLUEPRINT, INLINE, SEQUENCE, FORMULA  (Note: FORMULA requires p_data_source to be null)
--   p_data_source           When p_data_source_type = DATA_SOURCE then DATA_SOURCE_NAME.COLUMN_NAME (column names case follows p_ds_preserve_case and by default will upper case)
--                                                   = BUILTIN then see builtin list, must match exactly a builtin
--                                                   = BLUEPRINT references table data already generated (table must have lower sequence), e.g. Dept.Deptno where add_table with p_table_name = Dept and add_column with Deptno exist
--                                                      (note: This is case sensitive. Tables created with p_preserve_case = N are automatically upper cased. Hence, this will typically require DEPT.DEPTNO instead of dept.deptno)
--                                                   = INLINE then PART_TIME,20;FULL_TIME,80
--                                                   = SEQUENCE uses p_sequence_ params
--                                                   = FORMULA p_data_source must be null. Uses p_formula as a plsql formula and {column_name} as substitutions from this table, e.g. p_formula => {first_name}||'.'||{last_name}||'.insum.ca'
--   p_ds_preserve_case      If p_data_source_type in ('DATA_SOURCE'. 'BLUEPRINT') and p_ds_preserve_case = N then the data source will be upper cased to match an upper case table_name.column_name
--   p_min_numeric_value     Minimum numeric value, values equal or greater than this value. Note: Only used in BUILTIN functions.
--   p_max_numeric_value     Maximum numeric value, values. Note: Only used in BUILTIN functions.
--   p_numeric_precision     0=no decimal values, -1=round to ten, positive integer=# of decimal places
--   p_min_date_value        Minimum date value, values equal or greater than this value. Note: Only used in BUILTIN functions.
--   p_max_date_value        Maximum date value, must be greater than or equal to p_min_date_value, if specified. Note: Only used in BUILTIN functions.
--   p_format_mask           Format mask when datatype is a date
--   p_date_precision        YEAR, QUARTER, MONTH, WEEK, DAY, HOUR, MINUTE, SECOND. Note: *** not implemented.
--   p_sequence_start_with   Only used when p_data_source_type = SEQUENCE
--   p_sequence_increment    Only used when p_data_source_type = SEQUENCE
--   p_depends_on            Only populate when another column in this row is equal to value (including null). Note: not implemented.
--   p_formula               Allows referencing columns in this row,
--                           PL/SQL expressions that can reference columns defined in this blueprint row
--                           Example: {FIRST_NAME}||'.'||{LAST_NAME}||'.insum.ca' (note: substitutions are case sensitive and must match {column_name} exactly. If p_preserve_case was set to N, {COLUMN_NAME} must be upper case.)
--                           Can be used on any DATA_SOURCE_TYPE
--                           NOTE: formulas are applied last, after p_percent_blank. Hence if p_percent_blank = 100 but FORMULAR is "sysdate", the column value will be sysdate
--   p_formula_lang          PLSQL and Javascript. Refrence columns in this table as {column_name}.  *** only PLSQL implemented
--   p_custom_attributes     For future expansion
--   p_percent_blank         0-100. This is applied prior to all formulas. Hence, if this column is referenced in a formula, the formula will have a blank when appropriate. A formula on this column, however, may cause the column to not be blank.
--
--
-- Example:
--
--
--   begin
--       apex_dg_data_gen.update_column(
--                    p_blueprint               => 'Cars',
--                    p_sequence                => 1,
--                    p_table_name              => 'MY_CARS',
--                    p_column_name             => 'make',
--                    p_data_source_type        => 'BUILTIN',
--                    p_data_source             => 'car.make');
--   end;
--==================================================================================================================
procedure update_column
    (p_blueprint             in varchar2,
     p_table_name            in varchar2,
     p_column_name           in varchar2,
     p_new_column_name       in varchar2 default null,
     p_sequence              in pls_integer,
     p_preserve_case         in varchar2 default 'N',
     p_display_name          in varchar2 default null,
     p_max_length            in number default 4000,
     p_multi_value           in varchar2 default 'N',
     p_mv_format             in varchar2 default 'JSON',
     p_mv_unique             in varchar2 default 'Y',
     p_mv_delimiter          in varchar2 default ':',
     p_mv_min_entries        in integer default 1,
     p_mv_max_entries        in integer default 2,
     p_mv_partition_by       in varchar2 default null,
     p_lang                  in varchar2 default 'en',
     p_data_source_type      in varchar2,
     p_data_source           in varchar2 default null,
     p_ds_preserve_case      in varchar2 default 'N',
     p_min_numeric_value     in number default 1,
     p_max_numeric_value     in number default 10,
     p_numeric_precision     in number default 0,
     p_min_date_value        in date default null,
     p_max_date_value        in date default null,
     p_format_mask           in varchar2 default c_json_date_format,
     p_date_precision        in varchar2 default null,
     p_sequence_start_with   in number default 1,
     p_sequence_increment    in number default 1,
     p_depends_on            in varchar2 default null,
     p_formula               in varchar2 default null,
     p_formula_lang          in varchar2 default 'PLSQL',
     p_custom_attributes     in varchar2 default null,
     p_percent_blank         in number default 0
    );

--==================================================================================================================
--  This procedure will resequence all tables and columns within tables with gaps of p_offset (retaining their current order)
--
-- Parameters:
-- * p_blueprint             Identifier for the blueprint
--   p_offset                The offset between gaps, ex. 10, 100 or 1000
--
--
-- Example:
--
--   begin
--       apex_dg_data_gen.resequence_blueprint(
--                    p_blueprint          => 'Cars',
--                    p_offset             => 100);
--   end;
--==================================================================================================================
procedure resequence_blueprint (p_blueprint in varchar2,
                                p_offset    in number default c_default_seq_offset);


--==================================================================================================================
-- This procedure will validate appropriate instance settings (table, column, generation level).
--
-- Parameters:
-- * p_json                  JSON Document
-- * p_valid                 Out parameter to identify whether settings are valid
-- * p_result                Out parameter with a detailed message
--
--
-- Example:
--
--   declare
--        l_is_valid varchar2(30);
--        l_message clob;
--   begin
--       apex_dg_data_gen.validate_instance_setting(
--                    p_json               => '<json_doc>',
--                    p_valid              => l_is_valid,
--                    p_message            => l_message);
--   end;
--==================================================================================================================
procedure validate_instance_setting
    (p_json    in         clob,
     p_valid   out nocopy varchar2,
     p_message out nocopy clob
    );



--==================================================================================================================
-- Generated inline rows from a semi colon (;) delimited list of values. For each value add a comma to define weight. Ex "F,45;M,30"
-- Parameters:
-- * p_data                  The list of values
--
--
-- Example:
--
--   select * 
--   from apex_dg_data_gen.get_weighted_inline_data( p_data => 'F;M');
--
--   (returns 2 rows: F and M)
--==================================================================================================================
function get_weighted_inline_data
    (p_data in varchar2
    ) return wwv_flow_t_varchar2;


--==================================================================================================================
-- Generate example data for a friendly name. The function will return a (user specified) number of
-- examples, showing the data that can be expected when using this friendly name.
--
-- Parameters:
-- * p_friendly_name         The friendly name
--   p_lang                  The language (optional)
--   p_rows                  Number of rows (exmaples) to return
--
--
-- Example:
--
--   select * 
--   from apex_dg_data_gen.get_example( p_friendly_name => 'animal.family');
--
--   (returns 2 rows: F and M)
--==================================================================================================================
function get_example
     (p_friendly_name     in  varchar2,
      p_lang              in  varchar2 default 'en',
      p_rows              in  number default 5) return wwv_flow_t_varchar2;


--==================================================================================================================
-- Return the blueprint ID from the name
-- Parameters:
-- * p_name                  The blueprint identifier
--
-- Returns: ID of the blueprint
--
-- Example:
--
--    declare
--      l_blueprint_id apex_dg_blueprints.id%TYPE;
--    begin
--      l_blueprint_id := apex_dg_data_gen.get_blueprint_id(p_name => 'MY BLUEPRINT');
--    end;
--   
--==================================================================================================================
-- Return the blueprint ID from the name
function get_blueprint_id
    (p_name in varchar2
    ) return number;

--==================================================================================================================
-- Given a blueprint_id and table name, return the table_id
-- this function first checks assuming that p_table_name has the correct case
-- if not found, it looks for upper(p_table_name)
--
-- Parameters:
-- * p_bp_id        The blueprint ID
-- * p_table_name   The name of the table
--
-- Returns:     The table ID
--
-- Example:
--
--   declare
--     v_table_id number;
--   begin
--     l_table_id := apex_dg_data_gen.get_bp_table_id
--         (p_bp_id         => 12345,
--          p_table_name    => 'DEPT'
--         );
--   end;
--   
--==================================================================================================================
function get_bp_table_id(p_bp_id        in number,
                         p_table_name   in varchar2) return number;


--==================================================================================================================
-- This procedure imports a JSON blueprint from a workspace or application file
-- The file should be JSON, containing a correct blueprint definition.
--
-- Parameters:
-- * p_filename         Name of the file (apex_application_files.filename)
--   p_application_id   ID of the application, or null for workspace files
--   p_override_name    Name of blueprint, this will override the name provided in the file.
--   p_replace          Return error if blueprint exists and p_replace = FALSE. Will replace the blueprint (or p_override_name if provided).
-- * p_blueprint_id     ID of the imported blueprint (OUT)
--
--
-- Example:
--
--
-- declare
--   l_blueprint number;
-- begin
--   apex_dg_data_gen.add_blueprint_from_file
--     (p_filename              => 'app/example.json',  
--      p_application_id        => 145,
--      p_override_name         => 'My Application Blueprint',
--      p_replace               => false,
--      p_blueprint_id          => l_blueprint
--     );
-- end;
-- 
-- declare
--   l_blueprint number;
-- begin
--   apex_dg_data_gen.add_blueprint_from_file
--     (p_filename              => 'workspace/example.json',  
--      p_override_name         => 'My Workspace Blueprint',
--      p_replace               => false,
--      p_blueprint_id          => l_blueprint
--     );
-- end;
-- 
--==================================================================================================================
procedure add_blueprint_from_file
    (p_filename              in varchar2,                   -- name of workspace or application file   
     p_application_id        in number default null,        -- Application ID if an Application File, or null if a workspace file
     p_override_name         in varchar2 default null,      -- Name of blueprint, this will override the name provided in the file
     p_replace               in boolean default FALSE,      -- return error if blueprint exist and p_replace=FALSE
     p_blueprint_id          out number
    );

--==================================================================================================================
-- This procedure is the download functionality, returning file extension and mime type.
--
-- Parameters:
-- * p_blueprint            Name of the blueprint
-- * p_format               When p_format = SQL INSERT outputs a sql script
--                                        = CSV outputs a single CSV for one table or a ZIP of CSVs for multiple tables
--                                        = JSON outputs JSON file
--                                        = INSERT INTO generates the SQL INSERT script and runs the insert  statements in the current schema
--                                        = FAST INSERT INTO generates the data and does a single INSERT ... into [table] SELECT ... from [temporary table] 
--   p_blueprint_table      Null for all tables. If not null, will generate data only for designated table.
--                          If not null, must be table name of a table within the blueprint. Note: this value is
--                          case sensitive.
--   p_row_scaling          Will scale the number of rows defined into the blueprint by this percentage value.
--   p_stop_after_errors    How many errors can happen before the process is stopped. This is only applicable for INSERT INTO
-- * p_output               The blob to hold the output. Null for INSERT INTO and FAST INSERT INTO.
-- * p_file_ext             The file extension of the output. Null for INSERT INTO and FAST INSERT INTO.
-- * p_mime_type            The mime type of the output. Null for INSERT INTO and FAST INSERT INTO.
-- * p_errors               JSON output of any errors. NULL upon success.
--
-- Notes: 
--
-- Example:
--
--
--    declare
--        l_output    blob;
--        l_file_ext  varchar2(255);
--        l_mime_type varchar2(255);
--        l_errors    clob;
--    begin
--        apex_dg_output.generate_data
--            (p_blueprint          => 'Cars',
--             p_blueprint_table    => 'my_cars',
--             p_stop_after_errors  => 100,
--             p_output             => l_output
--             p_file_ext           => l_file_ext,
--             p_mime_type          => l_mime_type,
--             p_errors             => l_errors
--            );
--    end;
--==================================================================================================================
procedure generate_data
    (p_blueprint            in         varchar2,
     p_format               in         varchar2,
     p_blueprint_table      in         varchar2 default null,
     p_row_scaling          in         number default 100,
     p_stop_after_errors    in         number default c_max_error_count,
     p_output               out nocopy blob,
     p_file_ext             out nocopy varchar2,
     p_mime_type            out nocopy varchar2,
     p_errors               out nocopy clob
    );

--==================================================================================================================
-- This procedure is the download functionality, returning file extension and mime type.
--
-- Parameters:
-- * p_blueprint            Name of the blueprint
-- * p_format               When p_format = SQL INSERT outputs a sql script
--                                        = CSV outputs a single CSV for one table or a ZIP of CSVs for multiple tables
--                                        = JSON outputs JSON file
--                                        = INSERT INTO generates the SQL INSERT script and runs the insert  statements in the current schema
--                                        = FAST INSERT INTO generates the data and does a single INSERT ... into [table] SELECT ... from [temporary table] 
--   p_blueprint_table      Null for all tables. If not null, will generate data only for designated table.
--                          If not null, must be table name of a table within the blueprint. Note: this value is
--                          case sensitive.
--   p_row_scaling          Will scale the number of rows defined into the blueprint by this percentage value.
--   p_stop_after_errors    How many errors can happen before the process is stopped. This is only applicable for INSERT INTO
-- * p_output               The clob to hold the output. Null for INSERT INTO and FAST INSERT INTO.
-- * p_file_ext             The file extension of the output. Null for INSERT INTO and FAST INSERT INTO.
-- * p_mime_type            The mime type of the output. Null for INSERT INTO and FAST INSERT INTO.
-- * p_errors               JSON output of any errors. NULL upon success.
--
-- Notes: 
--
-- Example:
--
--
--    declare
--        l_output    clob;
--        l_file_ext  varchar2(255);
--        l_mime_type varchar2(255);
--        l_errors    clob;
--    begin
--        apex_dg_output.generate_data
--            (p_blueprint          => 'Cars',
--             p_blueprint_table    => 'my_cars',
--             p_stop_after_errors  => 100,
--             p_output             => l_output
--             p_file_ext           => l_file_ext,
--             p_mime_type          => l_mime_type,
--             p_errors             => l_errors
--            );
--    end;
--==================================================================================================================
procedure generate_data
    (p_blueprint            in         varchar2,
     p_format               in         varchar2,
     p_blueprint_table      in         varchar2 default null,
     p_row_scaling          in         number default 100,
     p_stop_after_errors    in         number default c_max_error_count,
     p_output               out nocopy clob,
     p_file_ext             out nocopy varchar2,
     p_mime_type            out nocopy varchar2,
     p_errors               out nocopy clob
    ); 

--==================================================================================================================
-- This procedure validates the blueprint by checking the validity of the generated SQL
--
-- Parameters:
-- * p_blueprint            Name of the blueprint
-- * p_format               CSV, SQL INSERT, JSON, PRETTY JSON, INSERT INTO, FAST INSERT INTO
-- * p_errors               Clob holds error output
--
--
-- Example:
--
--
--    declare
--        l_errors    clob;
--    begin
--        apex_dg_output.validate_blueprint
--            (p_blueprint          => 'Cars',
--             p_format             => 'JSON',
--             p_errors             => l_errors
--            );
--    end;
--==================================================================================================================
procedure validate_blueprint
    (p_blueprint          in     varchar2,
     p_format             in     varchar2,
     p_errors             out    clob
    );

--==================================================================================================================
-- Get a list of reserved words used in BP table or column names
-- Returns a list of the reserved words used (comma sep)
--
--
-- Example:
--
--   declare
--     l_reserved varchar2(32000);
--   begin
--       l_reserved := wwv_dg_blueprint_util_int.get_reserved_keywords(123456789);
--   end;
--==================================================================================================================
function get_reserved_keywords (p_blueprint_table_id in number) return varchar2;

--==================================================================================================================
-- This procedures adds table information to wwv_dg_builtin_table based upon user tables prefixed with wwv_dg_builtin.
-- Adds columns from these tables to wwv_dg_builtin_tab_col.
--
--
-- Example:
--
--
--   begin
--       wwv_dg_blueprint_util_int.add_builtin_data_sources;
--   end;
--==================================================================================================================
procedure add_builtin_data_sources;

--==================================================================================================================
-- This procedure looks for a suitable mapping for a table/column/data_type
--
-- Example:
--
--   declare
--        l_data_source_type varchar2(100);
--        l_data_source      varchar2(100);
--   begin
--       wwv_dg_blueprint_util_int.get_data_source_mapping
--          (p_table_name       => 'DOGS',
--           p_column_name      => 'NAME',
--           p_data_type        => 'VARCHAR2',
--           p_data_length      => 10,
--           p_data_source_type => l_data_source_type,
--           p_data_source      => l_data_source);
--                                     
--   end;
--==================================================================================================================
procedure get_data_source_mapping
    (p_table_name       in  varchar2
    ,p_column_name      in  varchar2
    ,p_lang             in  varchar2 default 'en'
    ,p_data_type        in  varchar2
    ,p_data_length      in  number
    ,p_data_source_type out varchar2
    ,p_data_source      out varchar2);

--==================================================================================================================
-- This procedure will retrieve additional builtin data (only used for wwv_dg_BUILTIN% AND wwv_dg_HELPER% tables).
-- Calls a web service at p_rest_endpoint and inserts response data by calling the persist_builtin_data procedure into p_table_name.
--
-- Parameters:
-- * p_table_name           Name of the target table
-- * p_rest_endpoint        End point of the service returning json data. Supports #ROWS#, #LANG#, #DOMAIN# substitions
--   p_rows                 Number of rows to get, min 1, defaults to 500000
--   p_mode                 APPEND to OR REPLACE data in target table, defaults to APPEND
--   p_lang                 Language of the data retrieved, defaults to en
--   p_domain               Used only when p_table_name is wwv_dg_HELPER_DATA to retrieve data for the specified domain
--
--
-- Example:
--
--
--   begin
--      wwv_dg_blueprint_util_int.get_builtin_data(
--          p_table_name => 'WWV_DG_BUILTIN_LOCATIONS',
--          p_rest_endpoint => 'https://insumlabs.com/webapps/odg/builtindata/location?p_rows=#ROWS#&p_lang=#LANG#',
--          p_mode => 'REPLACE'
--      );
--   end;
--==================================================================================================================
procedure get_builtin_data
    (p_table_name    in varchar2,
     p_rest_endpoint in varchar2,
     p_rows          in pls_integer default 500000,
     p_mode          in varchar2 default 'APPEND',
     p_lang          in varchar2 default 'en',
     p_domain        in varchar2 default null
    );



--==================================================================================================================
-- This procedure will insert response data from REST call to end point or passed in JSON into p_table_name.
--
-- Parameters:
-- * p_sample_name          Name of the target table
-- * p_json_data            End point of the service returning json data
--   p_source               Source set to JSON if this procedure is called with a JSON file, if called from get_builtin_data, it will be REST.
--                          Defaults to JSON
--   p_mode                 APPEND to OR REPLACE data in target table, defaults to APPEND
--   p_lang                 Language of the data retrieved, defaults to en
--   p_domain               Used only when p_table_name is wwv_dg_HELPER_DATA to REPLACE data in specified DOMAIN. Pass ALL to replace data in all domains.
--
--
-- Example:
--
--
--    begin
--        wwv_dg_blueprint_util_int.persist_builtin_data
--            (p_table_name       => 'wwv_dg_BUILTIN_LOCATIONS',
--            p_source           => 'JSON',
--            p_mode             => 'APPEND',
--            p_lang             => 'en',
--            p_json_data        => '
--        {
--          "items": [
--            {
--              "latitude": 42.10081,
--              "longitude": -73.46335,
--              "city": "South Egremont",
--              "state_id": "MA",
--              "state_name": "Massachusetts",
--              "zcta": "TRUE",
--              "population": 513,
--              "county_fips": 25003,
--              "county_name": "Berkshire",
--              "military": "FALSE",
--              "timezone": "America/New_York",
--              "zip_vc": "01258",
--              "lang": "en"
--            },
--            {
--              "latitude": 42.0755,
--              "longitude": -73.26273,
--              "city": "Southfield",
--              "state_id": "MA",
--              "state_name": "Massachusetts",
--              "zcta": "TRUE",
--              "population": 486,
--              "county_fips": 25003,
--              "county_name": "Berkshire",
--              "military": "FALSE",
--              "timezone": "America/New_York",
--              "zip_vc": "01259",
--              "lang": "en"
--            },
--            {
--              "latitude": 18.1675462,
--              "longitude": -66.7265305,
--              "city": "Adjuntas",
--              "state_id": "PR",
--              "state_name": "Puerto Rico",
--              "zcta": "TRUE",
--              "population": 18488,
--              "county_fips": 72001,
--              "county_name": "Adjuntas",
--              "military": "FALSE",
--              "timezone": "America/Puerto_Rico",
--              "zip_vc": "00601",
--              "lang": "en"
--            },
--            {
--              "latitude": 18.37111,
--              "longitude": -67.18451,
--              "city": "Aguada",
--              "state_id": "PR",
--              "state_name": "Puerto Rico",
--              "zcta": "TRUE",
--              "population": 39098,
--              "county_fips": 72003,
--              "county_name": "Aguada",
--              "military": "FALSE",
--              "timezone": "America/Puerto_Rico",
--              "zip_vc": "00602",
--              "lang": "en"
--            },
--            {
--              "latitude": 18.4618437,
--              "longitude": -67.1208146,
--              "city": "Aguadilla",
--              "state_id": "PR",
--              "state_name": "Puerto Rico",
--              "zcta": "TRUE",
--              "population": 44508,
--              "county_fips": 72005,
--              "county_name": "Aguadilla",
--              "military": "FALSE",
--              "timezone": "America/Puerto_Rico",
--              "zip_vc": "00603",
--              "lang": "en"
--            }
--          ]
--        }
--        '
--        );
--   end;
--==================================================================================================================
procedure persist_builtin_data
    (p_table_name     in varchar2,
     p_json_data      in clob,
     p_source         in varchar2 default 'JSON',
     p_mode           in varchar2 default 'APPEND',
     p_lang           in varchar2 default 'en',
     p_domain         in varchar2 default null
    ) ;



--==================================================================================================================
-- This function will fetch an instance setting value for the setting name passed, returns null if not found.
--
-- Returns:
-- Returns a setting value as a varchar2.
--
-- Parameters:
-- * p_setting_name           Any setting name
--
--
-- Example:
--
--   declare
--       l_result varchar2(255);
--   begin
--       l_result := wwv_dg_blueprint_util_int.get_instance_setting(
--          p_setting_name => 'use powerset if available');
--   end;
--==================================================================================================================
function get_instance_setting
    (p_setting_name in varchar2
    ) return varchar2;




--==================================================================================================================
-- This utility function replaces listagg selects in order to process very large comma separated data.
--
-- Parameters:
-- * p_select_type
-- * p_blueprint_id       Identifies blueprint
-- * p_table_name         Name of table associated with blueprint
--   p_format
--   p_delimiter
--
--
-- Example:
--
--   declare
--      l_return clob;
--   begin
--       l_return := wwv_dg_blueprint_util_int.wwv_dg_listagg(
--                      p_select_type  => 'COL LIST FOR DDL',
--                      p_blueprint_id => 245831952590108797212700726123395346563,
--                      p_table_name   => 'dept');
--   end;
--==================================================================================================================
function wwv_dg_listagg
    (p_select_type  in varchar2,
     p_blueprint_id in number,
     p_table_name   in varchar2,
     p_format       in varchar2 default null,
     p_delimiter    in varchar2 default c_comma
    ) return clob;


--==================================================================================================================
--
--
-- This procedure will use dbms_assert.qualified_sql_name to cross check all table and col names that are part of
-- the blueprint specified in p_blueprint.
--     It also returns a message with the invalid names
--     p_a_ok flag indicates success or failure, p_message is just for information
--
-- Parameters:
-- * p_blueprint      Name of a blueprint
-- * p_a_ok           Indicates success or failure
-- * p_message        For additional information, returned as JSON
--
--
-- Example:
--
--   declare
--      l_output varchar2(255);
--      l_message clob;
--   begin
--       wwv_dg_blueprint_util_int.wwv_dg_assert(
--                    p_blueprint  => 'hr schema',
--                    p_a_ok       => l_output,
--                    p_message    => l_message);
--   end;
--==================================================================================================================
procedure wwv_dg_assert
    (p_blueprint   in         varchar2,
     p_a_ok         out nocopy varchar2,
     p_message      out nocopy clob
    );

--==================================================================================================================
--
--
-- Prettify a JSON document
--
-- Parameters:
-- * p_json           The JSON document
--
--
-- Example:
--
--   declare
--      l_json clob;
--   begin
--       wwv_dg_blueprint_util_int.pretty_json(l_json);
--   end;
--==================================================================================================================
procedure pretty_json (p_json in out nocopy clob);

--==================================================================================================================
--
-- Fetch the current schema
-- Handles both sessions with just the security group id set, and from an APEX application session
--
-- Parameters:
--
-- Returns: The current schema name (users database schema when the security group id is set, 
--          or the APEX Application database schema if run from an APEX application)
--
-- Example:
--
--   declare
--      l_schema varchar2(30);
--   begin
--       l_schema := wwv_dg_blueprint_util_int.get_current_schema();
--   end;
--==================================================================================================================
function get_current_schema return varchar2;

--==================================================================================================================
-- This procedure is similar to the download functionality, however it puts the results into an APEX collection named APEX$BP$[BLUEPRINT_NAME].
--
-- Parameters:
-- * p_blueprint            Name of the blueprint
-- * p_format               When p_format = SQL INSERT outputs a sql script
--                                        = CSV outputs a single CSV for one table or a ZIP of CSVs for multiple tables
--                                        = JSON outputs JSON file
--                                        = INSERT INTO generates the SQL INSERT script and runs the insert  statements in the current schema
--                                        = FAST INSERT INTO generates the data and does a single INSERT ... into [table] SELECT ... from [temporary table] 
--   p_blueprint_table      Null for all tables. If not null, will generate data only for designated table.
--                          If not null, must be table name of a table within the blueprint. Note: this value is
--                          case sensitive.
--   p_row_scaling          Will scale the number of rows defined into the blueprint by this percentage value.
--   p_stop_after_errors    How many errors can happen before the process is stopped. This is only applicable for INSERT INTO
-- * p_errors               JSON output of any errors. NULL upon success.
--
--  Output will be stored in the collection
--  CLOB001                 The clob to hold the output. Null for INSERT INTO and FAST INSERT INTO.
--  BLOB001                 The blob to hold the output. Null for INSERT INTO and FAST INSERT INTO.
--  C006                    The file extension of the output. Null for INSERT INTO and FAST INSERT INTO.
--  C007                    The mime type of the output. Null for INSERT INTO and FAST INSERT INTO.
--  
--  Additionally, a new row within the same collection will contain the error message if there is one
--  C001                    'ERROR'
--  CLOB001                 JSON output of any errors. NULL upon success.
--
-- Notes: 
--
-- Example:
--
--
--    declare
--        l_errors    clob;
--    begin
--        apex_dg_output.generate_data_into_collection
--            (p_blueprint          => 'Cars',
--             p_blueprint_table    => 'my_cars',
--             p_stop_after_errors  => 100,
--             p_errors             => l_errors
--            );
--    end;
--==================================================================================================================

procedure generate_data_into_collection
    (p_blueprint            in         varchar2,
     p_format               in         varchar2,
     p_blueprint_table      in         varchar2 default null,
     p_row_scaling          in         number default 100,
     p_stop_after_errors    in         number default c_max_error_count,
     p_errors               out nocopy clob
    ); 



--==================================================================================================================
-- This procedure creates preview data for a blueprint and stores this in APEX collections
-- Note: Can only be used with an active APEX session.
--
-- Parameters:
-- * p_blueprint            Name of the blueprint
--   p_table_name           If null all tables, if not null then just the specified table
--   p_number_of_rows       Number of rows to generate (max. 50).
-- * p_data_collection      Name of the APEX collection for data
-- * p_header_collection    Name of the APEX collection for headers
--
--
-- Example:
--
--    begin
--        apex_dg_output.preview_blueprint
--            (p_blueprint          => 'Cars',
--             p_table_name         => 'my_cars',
--             p_data_collection    => 'CARS_DATA',
--             p_header_collection  => 'CARS_HEADERS'
--            );
--    end;
--==================================================================================================================
procedure preview_blueprint
    (p_blueprint         in varchar2,
     p_table_name        in varchar2 default null,
     p_number_of_rows    in number default 50,
     p_data_collection   in varchar2,
     p_header_collection in varchar2);

--==================================================================================================================
-- For the string p_string, replace rn with pn
--
-- Parameters:
-- * p_string   String to replace
--   r0-9       Replace this
--   p0-9       With this
--
-- Example:
--
--    begin
--        wwv_dg_blueprint_util_int.multi_replace
--            (p_string    => 'select * from #TABLE#',
--             r0          => '#TABLE#',
--             p0          => 'dept'
--            );
--    end;
--==================================================================================================================
function multi_replace
    (p_string     in varchar2,
     r0           in varchar2     default null,
     p0           in varchar2     default null,
     r1           in varchar2     default null,
     p1           in varchar2     default null,
     r2           in varchar2     default null,
     p2           in varchar2     default null,
     r3           in varchar2     default null,
     p3           in varchar2     default null,
     r4           in varchar2     default null,
     p4           in varchar2     default null,
     r5           in varchar2     default null,
     p5           in varchar2     default null,
     r6           in varchar2     default null,
     p6           in varchar2     default null,
     r7           in varchar2     default null,
     p7           in varchar2     default null,
     r8           in varchar2     default null,
     p8           in varchar2     default null,
     r9           in varchar2     default null,
     p9           in varchar2     default null
    ) return clob;


--==================================================================================================================
-- Cleanse table and column names
--
-- Parameters:
-- * p_string   String to cleanse
--
-- Return: The cleansed string
--
-- Example:
--
--    declare
--        l_string varchar2(100);
--    begin
--        l_string := wwv_dg_blueprint_util_int.cleanse_string('My new_ Column ');
--    end;
--==================================================================================================================
function cleanse_string
    (p_string    in varchar2
    ) return varchar2 ;

--==================================================================================================================
-- Cleanse blueprint names
--
-- Parameters:
-- * p_string   String to cleanse
--
-- Return: The cleansed string
--
-- Example:
--
--    declare
--        l_string varchar2(100);
--    begin
--        l_string := wwv_dg_blueprint_util_int.cleanse_string_name('My New Blueprint');
--    end;
--==================================================================================================================
function cleanse_string_name
    (p_string    in varchar2
    ) return varchar2 ;

--==================================================================================================================
-- Sbstitute column aliases for column name references
--
-- Parameters:
-- * p_formula      String to cleanse
-- * p_bp_table_id  The blueprint table id
--
-- Return: The formula with table columns
--
-- Example:
--
--    declare
--        l_formula varchar2(100);
--    begin
--        l_formula := wwv_dg_blueprint_util_int.do_formula_substitutions(p_formula => '{FIRST_NAME}', p_bp_table_id => 102202);
--    end;
--==================================================================================================================
function do_formula_substitutions
    (p_formula     varchar2,
     p_bp_table_id number
    ) return varchar2 ;

--==================================================================================================================
-- This procedure creates a blueprint and adds the tables specified - based on the data dictionary
--
-- Parameters:
-- * p_name:           Name of blueprint, combination of name and language are unique, Name is automatically upper cased.
-- * p_tables          List of tables and the number of records for these
--                     The format is: apex_t_varchar2('<Table name>:[Rows]',...). Ex: apex_t_varchar2('PRODUCTS:10','CUSTOMERS:50', 'SALES:1000')
--                     The ordering of tables should be: master tables before child tables (for FK relationsships)
--   p_preserve_case   Defaults to N which forces table name to uppercase, if Y perserves casing of table
--   p_exclude_columns String array (apex_t_varchar2) of column names to exclude from the auto column generation
--                     The exclude columns parameter will be applied to all tables in the p_tables parameter
--   p_description     Description of blueprint
--   p_lang            blueprint language determines values from builtin data sources. If the builtin data source has
--                     0 records in this language, 'en' is used
--   p_default_schema  The default schema name for the blueprint
-- * p_blueprint_id    ID of the added blueprint (OUT)
--
-- Example:
--
--   declare
--     l_blueprint_id number;
--   begin
--       wwv_dg_blueprint_util_int.add_blueprint_from_tables(
--                    p_name            => 'Product Sales',
--                    p_tables          =>  apex_t_varchar2('PRODUCTS:10','CUSTOMERS:50','SALES:1000'),       
--                    p_exclude_columns => apex_t_varchar2('CREATED_BY','CREATED_DATE'),
--                    p_description     => 'A blueprint to generate product sales data',
--                    p_lang            => 'en',
--                    p_blueprint_id    => l_blueprint_id
--                    );
--   end;
--==================================================================================================================
procedure add_blueprint_from_tables
   (p_name                  in varchar2,
    p_tables                in wwv_flow_t_varchar2,
    p_preserve_case         in varchar2 default 'N',
    p_exclude_columns       in wwv_flow_t_varchar2 default c_empty_t_varchar2,    
    p_description           in varchar2 default null,
    p_lang                  in varchar2 default 'en',
    p_default_schema        in varchar2 default null,
    p_blueprint_id          out number    
   );


--==================================================================================================================
-- This procedure creates a new sample from an existing blueprint
-- Note: The workspace context (security group id) should be set to the workspace that owns the blueprint
-- before calling this procedure
--
-- Parameters:
-- * p_blueprint_id            ID of the blueprint
--
--
-- Example:
--
-- begin
--   wwv_dg_blueprint_util_int.make_blueprint_sample(342415356533192972);
-- end;
--
--==================================================================================================================
procedure make_blueprint_sample
    (p_blueprint_id  in number
    );
    
--==================================================================================================================
-- Set a process update message
-- Used to record progress about an ongoing data generation
--
-- Parameters:
-- *p_current_process      Process step number
-- *p_format               Data format
-- *p_blueprint            Name of the blueprint
--  p_table_name           Name of the table
--  p_total_steps          Total number of steps
--  p_errors               Error message (or null if no errors)
--
--
-- Example:
--
-- begin
--   wwv_dg_blueprint_util_int.update_process_message(
--                    p_current_process => 1,
--                    p_format     => 'JSON',
--                    p_blueprint  => 'MY_BLUEPRINT',
--                    p_table_name => 'DEPT');
-- end;
--
--==================================================================================================================    
procedure update_process_message
    (p_current_process in number,
     p_format          in varchar2,
     p_blueprint       in varchar2,
     p_table_name      in varchar2 default null,
     p_total_steps     in number default null,
     p_errors          in clob default null
    );

end wwv_dg_blueprint_util_int;
/
sho err
