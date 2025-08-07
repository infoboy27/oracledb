set define '^' verify off
prompt ...wwv_flow_exec_api
create or replace package wwv_flow_exec_api authid current_user as
--------------------------------------------------------------------------------
--  Copyright (c) 2018, 2024, Oracle and/or its affiliates.
--
--  This package provides data processing and query capabilities on REST Data Sources, REST Enabled SQL sources
--  or the local database, to APEX application developers. With the procedures and functions in this package,
--  developers can access a data source using a generic API. Data Source specific behaviour like Paginaton for
--  REST Data Sources or REST Enabled SQL is being implemented in this package and abstracted away from the
--  developer.
--
--  The package is useful for developers who want to programmatically access data sources in page or
--  application processes, PL/SQL stored procedures or APEX Plug-Ins.
--
--  All procedures require an APEX session to be present. In a SQL or PL/SQL context, an APEX Session can
--  be established using the APEX_SESSION package.
--
--  # APEX_EXEC call sequences
--
--  ## Querying a data source with APEX_EXEC
--
--  1. Prepare columns to be selected from the data source. This step is optional; and only required if the
--     query result set should be limited to a subset of columns.
--     * Create a variable of the APEX_EXEC.T_COLUMNS type.
--     * Add columns with APEX_EXEC.ADD_COLUMNS.
--
--  2. Prepare bind variables (optional).
--     * Create a variable of APEX_EXEC.T_PARAMETERS type.
--     * Add bind values with APEX_EXEC.ADD_PARAMETER.
--
--  3. Prepare Filters (optional). Filters are being passed as instances of the T_FILTER record type. This allows
--     to pass filters independent from the used data source. For instance, if the used REST Data Source supports
--     server-side filtering, then the T_FILTER instance will be translated to the syntax used by the REST API.
--     * Create a variable of APEX_EXEC.T_FILTERS type.
--     * Add bind values with APEX_EXEC.ADD_FILTER.
--
--  4. Execute the Data Source Query.
--     * Use APEX_EXEC.OPEN_REST_SOURCE_QUERY for REST Data Sources.
--     * Use APEX_EXEC.OPEN_REMOTE_SQL_QUERY for REST Enabled SQL Sources.
--     * Use APEX_EXEC.OPEN_QUERY_CONTEXT to pass the data source dynamically as the p_location parameter.
--
--  5. Get Result Set meta data.
--     * APEX_EXEC.GET_COLUMN_COUNT returns the number of result columns.
--     * APEX_EXEC.GET_COLUMN returns information about a specific column.
--
--  6. Walk through and process the result set.
--     * APEX_EXEC.NEXT_ROW advances the result cursor by one row.
--     * APEX_EXEC.GET_NNN functions retrieve individual column values.
--       There is a GET_ function for each supported data type.
--
--  7. Finally close all resources with APEX_EXEC.CLOSE. This is important. Also always add an exception handler and close
--     resources there as well.
--
-- Example:
-- The following example assumes a REST Data Source named "USGS" to be created in Shared Components,
-- based on the URL endpoint "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson".
-- The example invokes the REST service and prints out the result set.
--
--    declare
--        l_context apex_exec.t_context;
--
--        l_magidx  pls_integer;
--        l_titidx  pls_integer;
--        l_plcidx  pls_integer;
--        l_timidx  pls_integer;
--        l_ididx   pls_integer;
--    begin
--        l_context := apex_exec.open_rest_source_query(
--            p_static_id        => '{REST Source static ID}',
--            p_max_rows         => 1000 );
--
--        l_titidx := apex_exec.get_column_position( l_context, 'TITLE' );
--        l_magidx := apex_exec.get_column_position( l_context, 'MAG' );
--        l_plcidx := apex_exec.get_column_position( l_context, 'PLACE' );
--        l_timidx := apex_exec.get_column_position( l_context, 'TIME' );
--        l_ididx  := apex_exec.get_column_position( l_context, 'ID' );
--
--        while apex_exec.next_row( l_context ) loop
--            sys.dbms_output.put_line( 'ID:    ' || apex_exec.get_varchar2( l_context, l_ididx  ) );
--            sys.dbms_output.put_line( 'MAG:   ' || apex_exec.get_varchar2( l_context, l_magidx ) );
--            sys.dbms_output.put_line( 'PLACE: ' || apex_exec.get_varchar2( l_context, l_plcidx ) );
--            sys.dbms_output.put_line( 'TITLE: ' || apex_exec.get_varchar2( l_context, l_titidx ) );
--            sys.dbms_output.put_line( 'TIME:  ' || apex_exec.get_varchar2( l_context, l_timidx ) );
--        end loop;
--
--        apex_exec.close( l_context );
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--
-- ## Executing DML on a data source with APEX_EXEC
--
--  1. Define DML columns.
--     * Create a variable of the APEX_EXEC.T_COLUMNS type.
--     * Add columns with APEX_EXEC.ADD_COLUMNS.
--
--  2. Prepare bind variables (optional).
--     * Create a variable of APEX_EXEC.T_PARAMETERS type.
--     * Add bind values with APEX_EXEC.ADD_PARAMETER.
--
--  3. Prepare the DML Context.
--     Use APEX_EXEC.OPEN_REST_SOURCE_DML_CONTEXT for REST Data Sources.
--     Use APEX_EXEC.OPEN_REMOTE_DML_CONTEXT for REST Enabled SQL Sources.
--     Use APEX_EXEC.OPEN_LOCAL_DML_CONTEXT for the local database.
--
--  4. Add rows and row values for DML to be performed.
--     * Add a new row with APEX_EXEC.ADD_DML_ROW.
--     * Set column values with APEX_EXEC.SET_VALUE.
--
--  5. Execute DML with APEX_EXEC.EXECUTE_DML. If multiple rows were passed, it depends on the data
--     source whether these are executed in one transaction or not.
--
--  6. Walk through RETURNING values and error messages for processed DML rows.
--     * APEX_EXEC.NEXT_ROW advances the result cursor by one row.
--     * APEX_EXEC.HAS_ERROR indicates whether DML processing for this row was successful or not.
--     * APEX_EXEC.GET_DML_STATUS_CODE returns the status code (SQL Error Code) for each DML row.
--       If DML for this row was successful, NULL is returned as the status code.
--     * APEX_EXEC.GET_NNN functions retrieve individual column DML RETURNING values.
--
--  7. Finally close all resources with APEX_EXEC.CLOSE. This is important.
--     Also always add an exception handler and close resources there as well.
--
-- Example:
-- this example "inserts one row" into the "EMP" REST Data Source
--
--    declare
--        l_columns        apex_exec.t_columns;
--        l_context        apex_exec.t_context;
--    begin
--        -- I. Define DML columns
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'EMPNO',
--            p_data_type      => apex_exec.c_data_type_number,
--            p_is_primary_key => true );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'ENAME',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'JOB',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'HIREDATE',
--            p_data_type      => apex_exec.c_data_type_date );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'MGR',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'SAL',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'COMM',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'DEPTNO',
--            p_data_type      => apex_exec.c_data_type_number );
--
--        -- II. Open the context object
--        l_context := apex_exec.open_rest_source_dml_context(
--            p_static_id             => '{REST Source static ID}',
--            p_columns               => l_columns,
--            p_lost_update_detection => apex_exec.c_lost_update_none );
--
--        -- III. Provide DML data
--
--        apex_exec.add_dml_row(
--            p_context   => l_context,
--            p_operation => apex_exec.c_dml_operation_insert );
--
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 1,
--            p_value           => 4711 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 2,
--            p_value           => 'DOE' );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 3,
--            p_value           => 'DEVELOPR' );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 4,
--            p_value           => sysdate );
--        apex_exec.set_value(
--            p_column_position => 6,
--            p_value           => 1000 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 8,
--            p_value           => 10 );
--
--        -- IV: Execute the DML statement
--
--        apex_exec.execute_dml(
--            p_context           => l_context,
--            p_continue_on_error => false);
--
--        apex_exec.close( l_context );
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--
-- ## Executing a remote procedure or a REST API
--
--  1. Prepare bind variables (optional).
--     * Create a variable of APEX_EXEC.T_PARAMETERS type.
--     * Add bind values with APEX_EXEC.ADD_PARAMETER.
--
--  2. Execute the local or remote procedure or REST API. The P_PARAMETERS array which is used to
--     pass bind variables, is an IN OUT parameter, so OUT parameters will be passed back.
--     * Use APEX_EXEC.EXECUTE_REST_SOURCE for REST Data Sources.
--     * Use APEX_EXEC.EXECUTE_REMOTE_PLSQL for REST Enabled SQL.
--     * Use APEX_EXEC.EXECUTE_PLSQL for the local database.
--
--  3. Optionally retrieve back the OUT parameters.
--     * Walk though the variable of the APEX_EXEC.T_PARAMETERS type.
--     * Use GET_PARAMETER_VALUE to retrieve the OUT parameter value.
--
-- Example:
-- Executes a PL/SQL block with arbitrary bind variables, so any bind can be used to
-- pass values and to get values back.
--
--    declare
--        l_sql_parameters apex_exec.t_parameters;
--        l_out_value      varchar2(32767);
--    begin
--        apex_exec.add_parameter( l_sql_parameters, 'MY_BIND_IN_VAR',  '{some value}' );
--
--        apex_exec.execute_plsql(
--            p_plsql_code      => q'#begin some_plsql( p_parameter => :MY_BIND_IN_VAR ); end;#',
--            p_auto_bind_items => false,
--            p_sql_parameters  => l_sql_parameters );
--    end;
--------------------------------------------------------------------------------

--##############################################################################
-- Constants
--##############################################################################

--------------------------------------------------------------------------------
-- Data Source Table Name constant.
--
-- Used in Post Processing SQL queries to reference the REST Source results.
--------------------------------------------------------------------------------
c_data_source_table_name  constant varchar2(18) := '#APEX$SOURCE_DATA#';

--------------------------------------------------------------------------------
-- Programming Language Constants
--------------------------------------------------------------------------------
subtype t_language       is varchar2(10);

c_lang_plsql             constant t_language := 'PLSQL';
c_lang_javascript        constant t_language := 'JAVASCRIPT';

--------------------------------------------------------------------------------
-- DML Lost Update Detection Constants
--------------------------------------------------------------------------------
subtype t_lost_update_detection  is pls_integer range 1..3;

c_lost_update_none        constant t_lost_update_detection := 1;
c_lost_update_implicit    constant t_lost_update_detection := 2;
c_lost_update_explicit    constant t_lost_update_detection := 3;

--------------------------------------------------------------------------------
-- DML Lock Row type Constants
--------------------------------------------------------------------------------
subtype t_lock_rows              is pls_integer range 1..3;

c_lock_rows_none          constant t_lock_rows := 1;
c_lock_rows_automatic     constant t_lock_rows := 2;
c_lock_rows_plsql         constant t_lock_rows := 3;

--------------------------------------------------------------------------------
-- Query or DML location Constants
--------------------------------------------------------------------------------
subtype t_location               is varchar2(15);

c_location_local_db        constant t_location  := 'LOCAL';
c_location_remote_db       constant t_location  := 'REMOTE';
c_location_rest_source     constant t_location  := 'WEB_SOURCE';
c_location_region_source   constant t_location  := 'REGION_SOURCE';
c_location_duality_view    constant t_location  := 'DUALITY_VIEW';
c_location_json_source     constant t_location  := 'JSON_COLLECTION';

--------------------------------------------------------------------------------
-- Database Vendor Constants
--------------------------------------------------------------------------------
subtype t_database_type          is wwv_flow_assert.t_database_type;

c_database_oracle         constant t_database_type := 1;
c_database_mysql          constant t_database_type := 2;

--------------------------------------------------------------------------------
-- Query or DML location Constants
--
-- Deprecated:
--------------------------------------------------------------------------------
c_location_web_source     constant t_location  := c_location_rest_source;

--------------------------------------------------------------------------------
-- LOV Type Constants
--
-- Internal:
--------------------------------------------------------------------------------
subtype t_lov_type               is pls_integer range 1..3;

c_lov_shared              constant t_lov_type  := 1;
c_lov_sql_query           constant t_lov_type  := 2;
c_lov_static              constant t_lov_type  := 3;

--------------------------------------------------------------------------------
-- Query Type Constants
--------------------------------------------------------------------------------
subtype t_query_type             is varchar2(23);

c_query_type_table           constant t_query_type := 'TABLE';
c_query_type_sql_query       constant t_query_type := 'SQL';
c_query_type_func_return_sql constant t_query_type := 'FUNC_BODY_RETURNING_SQL';
c_query_type_graph           constant t_query_type := 'GRAPH';

--------------------------------------------------------------------------------
-- DML Operation Type constants
--------------------------------------------------------------------------------
subtype t_dml_operation          is pls_integer range 1..3;

c_dml_operation_insert constant t_dml_operation := 1;
c_dml_operation_update constant t_dml_operation := 2;
c_dml_operation_delete constant t_dml_operation := 3;
--
--------------------------------------------------------------------------------
-- DML Operation Target Type constants
--------------------------------------------------------------------------------
subtype t_target_type            is varchar2(13);

c_target_type_region_source constant t_target_type := 'REGION_SOURCE';
c_target_type_table         constant t_target_type := 'TABLE';
c_target_type_sql_query     constant t_target_type := 'SQL';
c_target_type_plsql         constant t_target_type := 'PLSQL_CODE';
--
--------------------------------------------------------------------------------
-- REST Source Post Processing Constants
--------------------------------------------------------------------------------
subtype t_post_processing        is pls_integer range 1..3;

c_postprocess_where_orderby    constant t_post_processing := 1;
c_postprocess_sql              constant t_post_processing := 2;
c_postprocess_func_return_sql  constant t_post_processing := 3;
--
--------------------------------------------------------------------------------
-- Deprecated REST Source Post Processing Constants
--
-- Deprecated:
--------------------------------------------------------------------------------
c_postprocess_plsql_return_sql constant t_post_processing := 3;
--
--------------------------------------------------------------------------------
-- Column Data Type Constants
--------------------------------------------------------------------------------
subtype t_data_type              is pls_integer range 1..18;

c_data_type_varchar2      constant t_data_type := 1;
c_data_type_number        constant t_data_type := 2;
c_data_type_date          constant t_data_type := 3;
c_data_type_timestamp     constant t_data_type := 4;
c_data_type_timestamp_tz  constant t_data_type := 5;
c_data_type_timestamp_ltz constant t_data_type := 6;
c_data_type_interval_y2m  constant t_data_type := 7;
c_data_type_interval_d2s  constant t_data_type := 8;
c_data_type_blob          constant t_data_type := 9;
c_data_type_bfile         constant t_data_type := 10;
c_data_type_clob          constant t_data_type := 11;
c_data_type_rowid         constant t_data_type := 12;
c_data_type_user_defined  constant t_data_type := 13;
c_data_type_binary_number constant t_data_type := 14;
c_data_type_sdo_geometry  constant t_data_type := 15;
c_data_type_boolean       constant t_data_type := 16; -- only available for PL/SQL
c_data_type_array         constant t_data_type := 17;
c_data_type_vector        constant t_data_type := 18;
--
-- Use this data type for columns of the JSON data type (Database 21c or higher) ONLY.
-- Has currently the same functionality as CLOB columns, but might be extended in the
-- future.
c_data_type_json          constant t_data_type := 11;
--
--------------------------------------------------------------------------------
-- filter type constants
--------------------------------------------------------------------------------
subtype t_filter_type            is pls_integer range 1..34;

c_filter_eq              constant t_filter_type := 1;
c_filter_not_eq          constant t_filter_type := 2;
c_filter_gt              constant t_filter_type := 3;
c_filter_gte             constant t_filter_type := 4;
c_filter_lt              constant t_filter_type := 5;
c_filter_lte             constant t_filter_type := 6;
c_filter_null            constant t_filter_type := 7;
c_filter_not_null        constant t_filter_type := 8;
c_filter_starts_with     constant t_filter_type := 9;
c_filter_not_starts_with constant t_filter_type := 10;
c_filter_ends_with       constant t_filter_type := 11;
c_filter_not_ends_with   constant t_filter_type := 12;
c_filter_contains        constant t_filter_type := 13;
c_filter_not_contains    constant t_filter_type := 14;
c_filter_in              constant t_filter_type := 15;
c_filter_not_in          constant t_filter_type := 16;
c_filter_between         constant t_filter_type := 17;
c_filter_between_lbe     constant t_filter_type := 29;
c_filter_between_ube     constant t_filter_type := 30;
c_filter_not_between     constant t_filter_type := 18;
c_filter_regexp          constant t_filter_type := 19;
c_filter_last            constant t_filter_type := 20;
c_filter_not_last        constant t_filter_type := 21;
c_filter_next            constant t_filter_type := 22;
c_filter_not_next        constant t_filter_type := 23;
c_filter_like            constant t_filter_type := 24;
c_filter_not_like        constant t_filter_type := 25;
c_filter_search          constant t_filter_type := 26;
c_filter_sql_expression  constant t_filter_type := 27;
c_filter_oracletext      constant t_filter_type := 28;
c_filter_sdo_filter      constant t_filter_type := 31;
c_filter_sdo_anyinteract constant t_filter_type := 32;
c_filter_dbms_search     constant t_filter_type := 33;
c_filter_vector_type     constant t_filter_type := 34;
--
--------------------------------------------------------------------------------
-- Vector Search subtypes
--------------------------------------------------------------------------------
subtype t_vector_search_type is pls_integer range 1..3;

c_vector_search_exact  constant t_vector_search_type := 1;
c_vector_search_approx constant t_vector_search_type := 2;
c_vector_search_multi  constant t_vector_search_type := 3;

--
subtype t_vector_distance_type is pls_integer range 1..6;

c_vector_distance_cosine       constant t_vector_distance_type := 1;
c_vector_distance_dot          constant t_vector_distance_type := 2;
c_vector_distance_euclidean    constant t_vector_distance_type := 3;
c_vector_distance_eucl_squared constant t_vector_distance_type := 4;
c_vector_distance_hamming      constant t_vector_distance_type := 5;
c_vector_distance_manhattan    constant t_vector_distance_type := 6;
--
subtype t_vector_distance is varchar2(17);

c_vector_dist_str_cosine       constant t_vector_distance  := 'COSINE';
c_vector_dist_str_dot          constant t_vector_distance  := 'DOT';
c_vector_dist_str_euclidean    constant t_vector_distance  := 'EUCLIDEAN';
c_vector_dist_str_eucl_squared constant t_vector_distance  := 'EUCLIDEAN_SQUARED';
c_vector_dist_str_hamming      constant t_vector_distance  := 'HAMMING';
c_vector_dist_str_manhattan    constant t_vector_distance  := 'MANHATTAN';
--
--------------------------------------------------------------------------------
-- Multiple Value Column Constants
--------------------------------------------------------------------------------
subtype t_multi_value_type is pls_integer range 1..2;

c_multi_value_separated  constant t_multi_value_type := 1;
c_multi_value_json_array constant t_multi_value_type := 2;

subtype t_multi_value_separator is varchar2(1 char);
--
--------------------------------------------------------------------------------
-- Filter Value Separator Constants
--------------------------------------------------------------------------------
c_filter_expr_sep       constant varchar2(1) := '~';
c_filter_expr_value_sep constant varchar2(1) := chr(1);
--
--------------------------------------------------------------------------------
-- Date Internal Type Constants
--------------------------------------------------------------------------------
subtype t_filter_interval_type   is varchar2(2);

c_filter_int_type_year   constant t_filter_interval_type := 'Y';
c_filter_int_type_month  constant t_filter_interval_type := 'M';
c_filter_int_type_week   constant t_filter_interval_type := 'W';
c_filter_int_type_day    constant t_filter_interval_type := 'D';
c_filter_int_type_hour   constant t_filter_interval_type := 'H';
c_filter_int_type_minute constant t_filter_interval_type := 'MI';

--
--------------------------------------------------------------------------------
-- Filter Combination Type Constants
--------------------------------------------------------------------------------
subtype t_filter_combination is pls_integer range 1..2;

c_filter_combination_or         constant t_filter_combination := 1;
c_filter_combination_and        constant t_filter_combination := 2;
--
--------------------------------------------------------------------------------
-- Order By Type Constants
--------------------------------------------------------------------------------
subtype t_order_direction        is pls_integer range 1..2;

c_order_asc           constant t_order_direction := 1;
c_order_desc          constant t_order_direction := 2;
--
--------------------------------------------------------------------------------
-- Order By Sort NULLs Constants
--------------------------------------------------------------------------------
subtype t_order_nulls            is pls_integer range 1..2;

c_order_nulls_first   constant t_order_nulls := 1;
c_order_nulls_last    constant t_order_nulls := 2;
--
--------------------------------------------------------------------------------
-- Order By Sort NULLs variants supported by (REST) Data Sources Constants
--------------------------------------------------------------------------------
subtype t_supports_orderby_nulls_as is pls_integer range 1..5;

c_orderby_nulls_flexible      constant t_supports_orderby_nulls_as := 1;
c_orderby_nulls_are_lowest    constant t_supports_orderby_nulls_as := 2;
c_orderby_nulls_are_highest   constant t_supports_orderby_nulls_as := 3;
c_orderby_nulls_always_last   constant t_supports_orderby_nulls_as := 4;
c_orderby_nulls_always_first  constant t_supports_orderby_nulls_as := 5;
--
--------------------------------------------------------------------------------
-- ORDER BY Source Type
--------------------------------------------------------------------------------
subtype t_order_by_clause_source is pls_integer range 1..2;

c_order_by_static     constant t_order_by_clause_source := 1;
c_order_by_from_item  constant t_order_by_clause_source := 2;
--
--------------------------------------------------------------------------------
-- String Value Case Constants
--------------------------------------------------------------------------------
subtype t_value_case             is pls_integer range 1..3;

c_case_mixed             constant t_value_case := 1;
c_case_upper             constant t_value_case := 2;
c_case_lower             constant t_value_case := 3;
--
--------------------------------------------------------------------------------
-- Search Operator Constants
--------------------------------------------------------------------------------
subtype t_search_operator        is pls_integer range 1..5;

c_search_contains_instr  constant t_search_operator := 1;
c_search_contains_like   constant t_search_operator := 2;
c_search_starts_with     constant t_search_operator := 3;
c_search_ends_with       constant t_search_operator := 4;
c_search_like            constant t_search_operator := 5;
--
--------------------------------------------------------------------------------
-- Aggregation Type Constants
--------------------------------------------------------------------------------
subtype t_aggregation_type is pls_integer range 1..3;

c_aggregation_none       constant t_aggregation_type := 1;
c_aggregation_group_by   constant t_aggregation_type := 2;
c_aggregation_distinct   constant t_aggregation_type := 3;
--c_aggregation_pivot    constant t_aggregation_type := 4;
--
--------------------------------------------------------------------------------
-- Aggregation Column Role Constants
--------------------------------------------------------------------------------
subtype t_column_role is pls_integer range 1..2;

c_column_role_aggregate constant t_column_role := 1;
c_column_role_group_by  constant t_column_role := 2; -- also used as the ROW column for Pivots
-- c_column_role_pivot     constant t_column_role := 3;
--
--------------------------------------------------------------------------------
-- Aggregation Function Constants
--------------------------------------------------------------------------------
subtype t_aggregate_function is pls_integer range 1..11;

c_aggregate_sum                  constant t_aggregate_function := 1;
c_aggregate_avg                  constant t_aggregate_function := 2;
c_aggregate_median               constant t_aggregate_function := 3;
c_aggregate_cnt                  constant t_aggregate_function := 4;
c_aggregate_distinct_cnt         constant t_aggregate_function := 5;
c_aggregate_approx_dist_cnt      constant t_aggregate_function := 6;
c_aggregate_min                  constant t_aggregate_function := 7;
c_aggregate_max                  constant t_aggregate_function := 8;
c_aggregate_ratio_report_sum     constant t_aggregate_function := 9;
c_aggregate_ratio_report_cnt     constant t_aggregate_function := 10;
c_aggregate_listagg              constant t_aggregate_function := 11;

--------------------------------------------------------------------------------
-- Resolve Synonym Type constants
--------------------------------------------------------------------------------
subtype t_resolve_synonym_type is pls_integer range 0..1;

c_resolve_synonym_type_table constant t_resolve_synonym_type := 0;
c_resolve_synonym_type_plsql constant t_resolve_synonym_type := 1;

--##############################################################################
-- Data Types
--##############################################################################

--------------------------------------------------------------------------------
-- Data Type for a Column Name.
--------------------------------------------------------------------------------
subtype t_column_name            is varchar2(32767);

--------------------------------------------------------------------------------
-- Parameter value, as the respective data type.
--
-- Attributes:
-- * varchar2_value:
-- * number_value:
-- * binary_number_value:
-- * date_value:
-- * timestamp_value:
-- * timestamp_tz_value:
-- * timestamp_ltz_value:
-- * interval_y2m_value:
-- * interval_d2s_value:
-- * blob_value:
-- * clob_value:
-- * sdo_geometry_value:
-- * vector_value:
-- * array_value:
-- * anydata_value:
--------------------------------------------------------------------------------
type t_value is record (
    varchar2_value      varchar2(32767),
    number_value        number,
    binary_number_value binary_double,
    date_value          date,
    boolean_value       boolean, -- internal only
    timestamp_value     timestamp,
    timestamp_tz_value  timestamp with time zone,
    timestamp_ltz_value timestamp with local time zone,
    interval_y2m_value  yminterval_unconstrained,
    interval_d2s_value  dsinterval_unconstrained,
    blob_value          blob,
    bfile_value         bfile,
    clob_value          clob,
    $IF wwv_flow_db_version.c_has_locator $THEN
    sdo_geometry_value  mdsys.sdo_geometry,
    $END
    $IF wwv_flow_db_version.c_has_vector_type $THEN
    vector_value        vector,
    $END
    array_value         sys.json_array_t,
    anydata_value       sys.anydata );

--------------------------------------------------------------------------------
-- Collection of parameter values
--------------------------------------------------------------------------------
type t_values is table of t_value index by pls_integer;

--------------------------------------------------------------------------------
-- Named Parameter definition.
--
-- name:         Parameter (bind variable) name
-- data_type:    Parameter (bind variable) data type
-- value:        Parameter (bind variable) value.
--------------------------------------------------------------------------------
type t_parameter is record (
    name      t_column_name,
    data_type t_data_type,
    value     t_value );

--------------------------------------------------------------------------------
-- Collection of names parameters.
--------------------------------------------------------------------------------
type t_parameters is table of t_parameter index by pls_integer;

--------------------------------------------------------------------------------
-- LOV meta data.
--
-- Internal:
--------------------------------------------------------------------------------
type t_lov is record (
    lov_type            t_lov_type,
    --
    display_extra       boolean,
    display_null        boolean,
    --
    display_col_name    wwv_flow_global.t_dbms_id,
    return_col_name     wwv_flow_global.t_dbms_id,
    --
    shared_lov_id       varchar2(32767),
    sql_query           varchar2(32767),
    static_values       varchar2(32767) );

--------------------------------------------------------------------------------
-- Multi-Value meta data.
--
-- Internal:
--------------------------------------------------------------------------------
type t_multi_value is record(
    type                t_multi_value_type,
    separator           t_multi_value_separator,
    trim_space          boolean                  default false,
    filter_combi        t_filter_combination );

--------------------------------------------------------------------------------
-- Column Meta Data
--
-- Attributes:
-- * name:                   Column Name or Alias.
-- * sql_expression:         SQL Expression for derived columns.
-- * parent_column_position: stores the reference to the parent column
-- * data_type:              Data Type: Use constants c_data_type_*.
-- * data_type_length:       Data Type Length for VARCHAR2 columns.
-- * format_mask:            Format Mask for NUMBER, DATE or TIMESTAMP columns.
-- * is_required:            Whether the column is required (NOT NULL)
-- * is_primary_key:         Whether the column is part of the table primary key
-- * is_query_only:          Query Only columns are not part of DML operations.
-- * is_checksum:            Whether the column is designated as the Row Version column.
-- * is_returning:           Whether the new value is to be returned after a DML operation.
--
-- * data_type_name:         Internal: stores the name of a User Defined type (Object Type)
-- * vendor_type_name:       Internal: stores the vendor-specific data type
-- * bind_variable_name:     Internal:
-- * is_simple_alias:        Internal:
-- * is_selected:            Internal:
-- * is_aggregation:         Internal:
-- * is_end_user:            Internal:
-- * dependent_on:           Internal:
-- * is_binary_number:       Internal:
-- * value_case:             Internal:
-- * lov:                    Internal:
-- * use_for_checksum:       Internal:
-- * multi_value:            Internal:
--
-- Internal:
--------------------------------------------------------------------------------
type t_column is record (
    name                      t_column_name,
    --
    data_type                 t_data_type,
    data_type_length          pls_integer,
    --
    sql_expression            varchar2(32767),
    --
    format_mask               varchar2(4000),
    is_required               boolean default false,
    is_primary_key            boolean default false,
    is_query_only             boolean default false,
    is_checksum               boolean default false,
    is_returning              boolean default false,
    --
    -- Internal properties:
    --
    parent_column_position    pls_integer,
    --
    data_type_name            t_column_name,
    vendor_type_name          varchar2(255),
    multi_value               t_multi_value,
    value_case                t_value_case default c_case_mixed,
    --
    -- properties for LOV display in reports.
    lov                       t_lov,
    is_lov_display            boolean default false,
    --
    -- properties for JSON based columns, typically used for array columns
    data_profile_selector     varchar2(4000),
    data_profile_format_mask  varchar2(4000),
    --
    -- this flag indicates whether the data profile has a SQL Expression, Lookup or
    -- transformation expression defined. In that case, we currently cannot access
    -- these columns using the APEX_EXEC APIs to access nested arrays.
    data_profile_is_raw       boolean,
    --
    -- bind variable to use for this column in Interactive Grid DML processes using
    -- custom PL/SQL code.
    bind_variable_name        t_column_name,
    --
    -- this flag is used when the data_type is set to c_data_type_number, but the table or query column
    -- is of BINARY_FLOAT or BINARY_DOUBLE. During fetch, values will be fetched as BINARY_FLOAT|DOUBLE and
    -- then converted to NUMBER. 'NAN' or 'INF' values will be converted to NULL.
    is_binary_number          boolean default false,
    --
    -- true when the SQL expression is just a column. We can then prefix this column with a subquery alias
    -- during SQL generation which prevents "Column ambigously defined" errors.
    is_simple_alias           boolean default false,
    --
    -- when is_selected is false, the column will not added to the most outer select list
    is_selected               boolean default true,
    --
    -- for analytic functions - apply these after filtering; otherwise apply before filtering to make the
    -- column available to filters
    is_aggregation            boolean default false,
    --
    -- SQL expressions of end user columns can only work on columns specified in the p_columns array parameter
    is_end_user               boolean default true,
    --
    -- required for Generic Columns. If COL25 has "Compute Sum" enabled, we generate a SUM (OVER) clause for it.
    -- When the base SQL query does not return COL25, we have to remove that derived column, so we need to know, on
    -- which column it depends.
    dependent_on              t_column_name,
    --
    -- used to explicitly exclude a column from the row version checksum calculation. We need this for
    -- blob helper columns like MIMETYPE, FILENAME or LAST_UPDATED. For these we often don't have items (so they
    -- won't get submitted, but they're selected in the fetch / init processes)
    use_for_checksum          boolean default true );

--------------------------------------------------------------------------------
-- Collection of columns
--------------------------------------------------------------------------------
type t_columns is table of t_column index by pls_integer;

--------------------------------------------------------------------------------
-- Bucket definitions for a Range Filter
--
-- Attributes:
-- * name:           Bucket Name.
-- * value_from:     Bucket lower value.
-- * value_to:       Bucket upper value.
--------------------------------------------------------------------------------
type t_filter_bucket is record(
    name              varchar2(255),
    value_from        number,
    value_to          number );

--------------------------------------------------------------------------------
-- Collection of filter buckets
--------------------------------------------------------------------------------
type t_filter_buckets is table of t_filter_bucket index by pls_integer;

--------------------------------------------------------------------------------
-- Filter definitions
--
-- Attributes:
-- * column_name:            Name of the column to filter on
-- * data_type:              Data type of the filter
-- * filter_type:            Type of the filter to use
-- * filter_values:          One or many filter values, depending on filter type
-- * sql_expression:         Expression to use for the generic "SQL Expression" filter type
-- * search_columns:         Columns to include for the Row Search filter
-- * search_operator:        Operator to use for the Row Search filter
-- * null_result:            Whether to return true or false if the filter evaluates to NULL
-- * is_case_sensitive:      Case-sensitive or insensitive filtering
-- * force_local:            Force local filtering, even when the REST source supports it on the server
-- * use_lov_return_column:  Force use the LOV return column for filtering
--
-- * or_group                Internal:
-- * multi_value             Internal:
--------------------------------------------------------------------------------
type t_filter is record (
    column_name               t_column_name,
    --
    data_type                 t_data_type,
    filter_type               t_filter_type,
    filter_values             t_values,
    filter_buckets            t_filter_buckets,
    sql_expression            varchar2(32767),
    search_columns            t_columns,
    search_operator           t_search_operator default c_search_contains_instr,
    null_result               boolean           default false,
    is_case_sensitive         boolean           default true,
    force_local               boolean           default false,
    use_lov_return_column     boolean           default false,
    or_group                  varchar2(255),
    --
    tokenize_value            boolean           default false,
    multi_value               t_multi_value );

--------------------------------------------------------------------------------
-- Collection of filters
--------------------------------------------------------------------------------
type t_filters is table of t_filter index by pls_integer;

--------------------------------------------------------------------------------
-- Order By definitions
--
-- Attributes:
-- * column_name:          Name of the column to sort
-- * direction:            sort direction
-- * order_nulls:          whether to order nulls first or last
-- * position:             Internal:
-- * lov:                  Internal:
--------------------------------------------------------------------------------
type t_order_by is record (
    column_name t_column_name,
    position    pls_integer,
    lov         t_lov,
    direction   t_order_direction,
    order_nulls t_order_nulls );

--------------------------------------------------------------------------------
-- Collection of order bys
--------------------------------------------------------------------------------
type t_order_bys is table of t_order_by index by pls_integer;

--------------------------------------------------------------------------------
-- Aggregation columns
--------------------------------------------------------------------------------
type t_aggregation_column is record(
    attributes         t_column,
    aggr_role          t_column_role,
    aggr_function      t_aggregate_function,
    total_column_name  t_column_name,
    total_function     t_aggregate_function );

--------------------------------------------------------------------------------
-- Collection of Aggregation columns
--------------------------------------------------------------------------------
type t_aggregation_columns is table of t_aggregation_column index by pls_integer;

--------------------------------------------------------------------------------
-- Aggregation
--------------------------------------------------------------------------------
type t_aggregation is record(
    aggregation_type        t_aggregation_type,
    column_info             t_aggregation_columns,
    order_bys               t_order_bys,
    order_by_expr           varchar2(32767),
    row_count_column        t_column_name );

--------------------------------------------------------------------------------
-- Control Breaks
--------------------------------------------------------------------------------
type t_control_break is record(
    control_break_columns   t_columns
);

--------------------------------------------------------------------------------
-- Context handle
--------------------------------------------------------------------------------
subtype t_context is pls_integer;

--------------------------------------------------------------------------------
-- Data Source capabilities
--
-- Internal:
-- Deprecated:
--------------------------------------------------------------------------------
type t_source_capabilities is record(
    location                 t_location,
    --
    pagination               boolean default false,
    page_size_is_stable      boolean default false,
    --
    allow_fetch_all_rows     boolean default false,
    --
    filtering                boolean default false,
    order_by                 boolean default false,
    group_by                 boolean default false,
    filter_eq                boolean default false,
    filter_not_eq            boolean default false,
    filter_gt                boolean default false,
    filter_gte               boolean default false,
    filter_lt                boolean default false,
    filter_lte               boolean default false,
    filter_null              boolean default false,
    filter_not_null          boolean default false,
    filter_contains          boolean default false,
    filter_not_contains      boolean default false,
    filter_like              boolean default false,
    filter_not_like          boolean default false,
    filter_starts_with       boolean default false,
    filter_not_starts_with   boolean default false,
    filter_ends_with         boolean default false,
    filter_not_ends_with     boolean default false,
    filter_between           boolean default false,
    filter_not_between       boolean default false,
    filter_in                boolean default false,
    filter_not_in            boolean default false,
    filter_regexp            boolean default false,
    filter_last              boolean default false,
    filter_not_last          boolean default false,
    filter_next              boolean default false,
    filter_not_next          boolean default false,
    --
    orderby_asc              boolean default false,
    orderby_desc             boolean default false,
    -- Deprecated:
    orderby_nulls            boolean default false,
    --
    orderby_nulls_as         t_supports_orderby_nulls_as );

--------------------------------------------------------------------------------
-- Constants for empty collection types
--------------------------------------------------------------------------------
c_empty_value            t_value;
c_empty_columns          t_columns;
c_empty_filters          t_filters;
c_empty_order_bys        t_order_bys;
c_empty_parameters       t_parameters;
c_empty_filter_buckets   t_filter_buckets;
c_empty_aggregation      t_aggregation;
c_empty_control_break    t_control_break;

--------------------------------------------------------------------------------
-- Internal:
-- This is an internal only global variable
--------------------------------------------------------------------------------
g_value t_value;

--==============================================================================
-- converts the t_data_type constant into the VARCHAR2 representation.
--
-- Parameters:
-- * p_datatype_num:     data type constant of wwv_flow_exec_api.t_data_type
--
-- Returns:
-- a VARCHAR2 representation of the data type, as used by SQL.
--==============================================================================
function get_data_type(
    p_datatype_num in wwv_flow_exec_api.t_data_type ) return varchar2;

--==============================================================================
-- converts a data type VARCHAR2 representation to the t_data_type constant
--
-- Parameters:
-- * p_datatype:         VARCHAR2 representation of the data type, as used by SQL
--
-- Returns:
-- data type constant of wwv_flow_exec_api.t_data_type
--==============================================================================
function get_data_type(
    p_datatype in varchar2 ) return wwv_flow_exec_api.t_data_type;

--==============================================================================
-- tests whether a t_value instance is NULL.
--
-- Parameters:
-- * p_value:            a t_value instance
-- * p_data_type:        data type of the t_value instance
--
-- Returns:
-- true, if the t_value instance IS NULL, false otherwise
--==============================================================================
function value_is_null(
    p_value     in t_value,
    p_data_type in t_data_type )
    return boolean;

--==============================================================================
-- convert a VARCHAR2 value to an instance of the T_VALUE type of the provided
-- data type, and with applying the provided format mask.
--
-- Parameters:
-- * p_data_type:        desired data type of the t_value instance
-- * p_format_mask:      format mask to use in the TO_{type} expressions
-- * p_value:            VARCHAR2 value to convert
-- * p_is_filter:        Internal:
--
-- Returns:
-- the value, converted to T_VALUE using the requested data type
--
-- Since: 23.2
--==============================================================================
function convert_to_value (
    p_data_type   in t_data_type,
    p_format_mask in varchar2,
    p_value       in varchar2,
    p_is_filter   in boolean default false )
    return wwv_flow_exec_api.t_value;

--==============================================================================
-- TO_CHAR implementation for a T_VALUE instance.
--
-- Parameters:
-- * p_value:            T_VALUE value to convert
-- * p_data_type:        data type of the t_value instance
-- * p_format_mask:      format mask to use
--
-- Returns:
-- the VARCHAR2 value
--
-- Since: 23.2
--==============================================================================
function convert_to_varchar2(
    p_value              in t_value,
    p_data_type          in t_data_type,
    p_format_mask        in varchar2 )
    return varchar2;

--==============================================================================
-- This procedure describes the query context based on the current region source.
--
-- Parameters:
-- * p_columns:                Columns to be selected from the data source. Can be used to restrict
--                             the set of columns being returned.
--
-- Returns:
-- A t_columns object, describing the columns and data types.
--
-- Example:
-- The following example describes the query of the current plug-in region source,
-- and prints out result column names.
--
--    declare
--        l_columns apex_exec.t_columns;
--    begin
--        l_columns := apex_exec.describe_query;
--
--        for i in 1 .. l_columns.count loop
--            sys.htp.p( 'Column #' || i || ': ' || apex_escape.html( l_columns( i ).name ));
--        end loop;
--    end;
--==============================================================================
function describe_query(
    p_columns                in t_columns          default c_empty_columns )
    return t_columns;

--==============================================================================
-- This procedure describes the query context based on the current region
-- source.
--
-- Parameters:
-- * p_location:               Location to open the query context for. Use the c_location_* constants.
--
-- * p_table_owner:            Table owner when query type TABLE is used.
-- * p_table_name:             Table name when query type TABLE is used.
-- * p_match_clause:           Match clause to append when query type GRAPH is used.
-- * p_columns_clause:         Columns clause to append when query type GRAPH is used.
-- * p_test_for_rowid:         Whether to attempt including the ROWID column to the query being described.
--
-- * p_sql_query:              SQL Query to execute when query type SQL Query is used.
-- * p_function_body:          Function body returning SQL query.
-- * p_function_body_language: Programming Language used for p_function_body. Use the c_lang_* constants.
--
-- * p_optimizer_hint:         Optimizer hint to be applied to the most outer SQL query generated by APEX.
--
-- * p_server_static_id:       Static ID of the Remote Server when REST Enabled SQL is used.
-- * p_module_static_id:       Static ID of the REST Data Source.
-- * p_duality_view_static_id: Static ID of the Duality View Source.
-- * p_json_source_static_id:  Static ID of the JSON Source.
--
-- * p_post_process_type:      Type of post processing to be applied to the REST Data Source result data.
--
-- * p_columns:                Columns to be selected from the data source. Can be used to restrict
--                             the set of columns being returned.
--
-- Returns:
-- A t_columns object, describing the columns and data types.
--
-- Example:
-- The following example describes a query, and prints out result column names.
--
--    declare
--        l_columns apex_exec.t_columns;
--    begin
--        l_columns := apex_exec.describe_query(
--            p_location  => apex_exec.c_location_local_db,
--            p_sql_query => 'select * from emp' );
--
--        for i in 1 .. l_columns.count loop
--            sys.dbms_output.put_line( 'Col #' || i || ': ' || l_columns( i ).name );
--        end loop;
--    end;
--==============================================================================
function describe_query(
    p_location                   in t_location,
    --
    p_table_owner                in varchar2           default null,
    p_table_name                 in varchar2           default null,
    p_match_clause               in varchar2           default null,
    p_columns_clause             in varchar2           default null,
    p_test_for_rowid             in boolean            default false,
    --
    p_sql_query                  in varchar2           default null,
    p_function_body              in varchar2           default null,
    p_function_body_language     in t_language         default c_lang_plsql,
    --
    p_optimizer_hint             in varchar2           default null,
    --
    p_server_static_id           in varchar2           default null,
    --
    p_module_static_id           in varchar2           default null,
    p_post_process_type          in t_post_processing  default null,
    --
    p_columns                    in t_columns          default c_empty_columns,
    --
    p_array_column_name          in varchar2           default null,
    --
    p_duality_view_static_id     in varchar2           default null,
    p_json_source_static_id      in varchar2           default null )
    return t_columns;

--==============================================================================
-- This procedure opens a query context based on the current region source/
-- item lov/process source.
--
-- Parameters:
-- * p_columns:                     columns to be selected from the data source
-- * p_filters:                     filters to be used
-- * p_order_bys:                   order by expressions to be used
-- * p_aggregation:                 aggregation (GROUP BY, DISTINCT) to apply on top of the query
-- * p_control_break:               whether to return control breaks when looping trough the context data
--
-- * p_first_row:                   first row to be fetched
-- * p_max_rows:                    maximum amount of rows to be fetched
--
-- * p_total_row_count:             whether to determine the total row count
-- * p_total_row_count_limit:       upper limit for the total row count computation
--
-- * p_select_all_query_cols:       when set to TRUE, the columns passed in p_columns
--                                  will be selected *in addition* to the columns of
--                                  the data source. Useful to compute derived values.
--
-- * p_component_sql:               SQL query which wraps the data source - typically used to apply
--                                  SQL functions on the data returned by the data source. In this SQL query,
--                                  use the "APEX_EXECC_DATA_SOURCE_NAME" constant as the table name for
--                                  the actual data.
--
-- * p_use_region_filters_orderbys: whether to respect order by clauses and filters coming from the
--                                  current execution context, like order by items or faceted search filters.
--                                  When performing a single-row or primary-key based query, turn this off.
--
-- * p_sql_parameters:              bind variables to be used
-- * p_set_session_state:           whether to automatically populate session state with the current row values
--                                  when NEXT_ROW is called.
--
-- Returns:
-- the context object representing a "cursor" for the query
--==============================================================================
function open_query_context (
    p_columns                     in t_columns        default c_empty_columns,
    --
    p_filters                     in t_filters        default c_empty_filters,
    p_order_bys                   in t_order_bys      default c_empty_order_bys,
    p_aggregation                 in t_aggregation    default c_empty_aggregation,
    p_control_break               in t_control_break  default c_empty_control_break,
    --
    p_first_row                   in number           default null,
    p_max_rows                    in number           default null,
    --
    p_total_row_count             in boolean          default false,
    p_total_row_count_limit       in number           default null,
    --
    p_select_all_query_cols       in boolean          default false,
    p_component_sql               in varchar2         default null,
    --
    p_use_region_filters_orderbys in boolean          default true,
    --
    p_sql_parameters              in t_parameters     default c_empty_parameters,
    --
    p_set_session_state           in boolean          default false ) return t_context;

--==============================================================================
-- This procedure opens a REST Data Source query context. Based on the provided REST Source
-- static ID, the operation matched to the FETCH_COLLECTION database operation will be
-- selected.
--
-- Parameters:
-- * p_static_id:               static ID of the REST Data Source to invoke
-- * p_array_column_name:       Name of an Array column within the REST Source data profile.
-- * p_parameters:              parameter values to be passed to the REST Data Source
--
-- * p_filters:                 filters to be passed to the REST Data Source
-- * p_order_bys:               order by expressions to be passed to the REST Data Source
-- * p_aggregation:             aggregation (GROUP BY, DISTINCT) to apply on top of the query
-- * p_control_break:           whether to return control breaks when looping trough the context data
-- * p_columns:                 columns to be selected from the REST Data Source
--
-- * p_external_filter_expr:    filter expression to be passed 1:1 to the external web service
--                              Depends on the actual web service being used.
-- * p_external_order_by_expr:  order by expression to be passed 1:1 to the external web service.
--                              Depends on the actual web service being used.
--
-- * p_first_row:               first row to be fetched from the Data Source
-- * p_max_rows:                maximum amount of rows to be fetched from the Data Source
--
-- * p_total_row_count:         whether to determine the total row count (only supported
--                              when the "allow fetch all rows" attribute is set to Yes)
--
-- Returns:
-- the context object representing a "cursor" for the REST Data Source query
--
-- Example:
--
-- the following example assumes a REST Data Source named "USGS" to be
-- created in Shared Components, based on the URL endpoint
-- https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson. The
-- example invokes the REST service and prints out the result set. This example code could
-- be used Within a plug-in or within a "Execute PL/SQL" region.
--
--    declare
--        l_context apex_exec.t_context;
--
--        l_magidx  pls_integer;
--        l_titidx  pls_integer;
--        l_plcidx  pls_integer;
--        l_timidx  pls_integer;
--        l_ididx   pls_integer;
--    begin
--        l_context := apex_exec.open_rest_source_query(
--            p_static_id        => '{REST Source static ID}',
--            p_max_rows         => 1000 );
--
--        l_titidx := apex_exec.get_column_position( l_context, 'TITLE' );
--        l_magidx := apex_exec.get_column_position( l_context, 'MAG' );
--        l_plcidx := apex_exec.get_column_position( l_context, 'PLACE' );
--        l_timidx := apex_exec.get_column_position( l_context, 'TIME' );
--        l_ididx  := apex_exec.get_column_position( l_context, 'ID' );
--
--        while apex_exec.next_row( l_context ) loop
--            sys.dbms_output.put_line( 'ID:    ' || apex_exec.get_varchar2( l_context, l_ididx  ) );
--            sys.dbms_output.put_line( 'MAG:   ' || apex_exec.get_varchar2( l_context, l_magidx ) );
--            sys.dbms_output.put_line( 'PLACE: ' || apex_exec.get_varchar2( l_context, l_plcidx ) );
--            sys.dbms_output.put_line( 'TITLE: ' || apex_exec.get_varchar2( l_context, l_titidx ) );
--            sys.dbms_output.put_line( 'TIME:  ' || apex_exec.get_varchar2( l_context, l_timidx ) );
--        end loop;
--
--        apex_exec.close( l_context );
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--
--==============================================================================
function open_web_source_query(
    p_module_static_id       in varchar2,
    p_parameters             in t_parameters     default c_empty_parameters,
    --
    p_filters                in t_filters        default c_empty_filters,
    p_order_bys              in t_order_bys      default c_empty_order_bys,
    p_aggregation            in t_aggregation    default c_empty_aggregation,
    p_control_break          in t_control_break  default c_empty_control_break,
    p_columns                in t_columns        default c_empty_columns,
    --
    p_external_filter_expr   in varchar2         default null,
    p_external_order_by_expr in varchar2         default null,
    --
    p_first_row              in number           default null,
    p_max_rows               in number           default null,
    --
    p_total_row_count        in boolean          default false,
    --
    p_array_column_name      in varchar2         default null )
    return t_context;

--==============================================================================
function open_rest_source_query(
    p_static_id              in varchar2,
    p_parameters             in t_parameters     default c_empty_parameters,
    --
    p_filters                in t_filters        default c_empty_filters,
    p_order_bys              in t_order_bys      default c_empty_order_bys,
    p_aggregation            in t_aggregation    default c_empty_aggregation,
    p_control_break          in t_control_break  default c_empty_control_break,
    p_columns                in t_columns        default c_empty_columns,
    --
    p_external_filter_expr   in varchar2         default null,
    p_external_order_by_expr in varchar2         default null,
    --
    p_first_row              in number           default null,
    p_max_rows               in number           default null,
    --
    p_total_row_count        in boolean          default false,
    --
    p_array_column_name      in varchar2         default null )
    return t_context;

--==============================================================================
-- This procedure purges the local cache for a REST Data Source. The REST Data
-- source must exist in the current application and is being identified by its
-- static ID. If caching is disabled or no cache entries exist, nothing happens.
--
-- Parameters:
-- * p_static_id:              Static ID of the REST Data Source.
-- * p_current_session_only:   Specify true if you only want to purge entries that
--                             where saved for the current session. Defaults to false.
--
-- Example:
--    begin
--        apex_exec.purge_rest_source_cache(
--            p_static_id => '{REST Source static ID}' );
--    end;
--
--==============================================================================
procedure purge_web_source_cache(
    p_module_static_id     in varchar2,
    p_current_session_only in boolean default false );

--==============================================================================
procedure purge_rest_source_cache(
    p_static_id            in varchar2,
    p_current_session_only in boolean default false );

--==============================================================================
-- These procedures purge the local cache for a Duality Views of JSON Sources
-- based on REST Enabled SQL. The Duality View or JSON Source must exist in
-- the current application and is being identified by its static ID.
-- If caching is disabled or no cache entries exist, nothing happens.
--
-- Parameters:
-- * p_static_id               Static ID of the Duality View or JSON Source.
-- * p_current_session_only:   Specify true if you only want to purge entries that
--                             where saved for the current session. Defaults to false.
--
-- Example:
--    begin
--        apex_exec.purge_duality_view_cache(
--            p_static_id => '{Duality View static ID}' );
--    end;
--==============================================================================
procedure purge_json_source_cache(
    p_static_id            in varchar2,
    p_current_session_only in boolean default false );

--==============================================================================
procedure purge_duality_view_cache(
    p_static_id            in varchar2,
    p_current_session_only in boolean default false );

--==============================================================================
-- This procedure opens a query context and executes the provided SQL query
-- on the ORDS REST Enabled SQL instance.
--
-- Parameters:
-- * p_server_static_id:       static ID of the ORDS REST Enabled SQL Instance
-- * p_sql_query:              SQL Query to execute
-- * p_sql_parameters:         bind variables to pass to the remote server
-- * p_auto_bind_items:        whether to auto-bind all page items
--
-- * p_columns:                columns return from this SQL query
--
-- * p_first_row:              first row to be fetched from the result set
-- * p_max_rows:               maximum amount of rows to be fetched
--
-- * p_total_row_count         whether to determine the total row count
-- * p_total_row_count_limit   upper boundary for total row count computation
--
-- Returns:
-- the context object representing a "cursor" for the REST Enabled SQL query
--
-- Example:
-- the following example assumes a REST enabled ORDS instance to be configured
-- in Shared Components as "My Remote SQL Instance". Based on that, the example
-- executes the query on the remote server and prints out the result set.
-- This example code could be used Within a plug-in or within a "Execute PL/SQL" region.
--
--    declare
--        l_context apex_exec.t_context;
--
--        l_idx_empno    pls_integer;
--        l_idx_ename    pls_integer;
--        l_idx_job      pls_integer;
--        l_idx_hiredate pls_integer;
--        l_idx_mgr      pls_integer;
--        l_idx_sal      pls_integer;
--        l_idx_comm     pls_integer;
--        l_idx_deptno   pls_integer;
--
--    begin
--        l_context := apex_exec.open_remote_sql_query(
--            p_server_static_id  => '{REST Enabled SQL Server static id}',
--            p_sql_query         => 'select * from emp' );
--
--        l_idx_empno    := apex_exec.get_column_position( l_context, 'EMPNO');
--        l_idx_ename    := apex_exec.get_column_position( l_context, 'ENAME');
--        l_idx_job      := apex_exec.get_column_position( l_context, 'JOB');
--        l_idx_hiredate := apex_exec.get_column_position( l_context, 'HIREDATE');
--        l_idx_mgr      := apex_exec.get_column_position( l_context, 'MGR');
--        l_idx_sal      := apex_exec.get_column_position( l_context, 'SAL');
--        l_idx_comm     := apex_exec.get_column_position( l_context, 'COMM');
--        l_idx_deptno   := apex_exec.get_column_position( l_context, 'DEPTNO');
--
--        while apex_exec.next_row( l_context ) loop
--
--            sys.dbms_output.put_line( 'EMPNO: ' || apex_exec.get_number  ( l_context, l_idx_empno    ) );
--            sys.dbms_output.put_line( 'ENAME: ' || apex_exec.get_varchar2( l_context, l_idx_ename    ) );
--            sys.dbms_output.put_line( 'MGR:   ' || apex_exec.get_number  ( l_context, l_idx_mgr      ) );
--
--        end loop;
--
--        apex_exec.close( l_context );
--        return;
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--==============================================================================
function open_remote_sql_query(
    p_server_static_id      in varchar2,
    p_sql_query             in varchar2,
    p_sql_parameters        in t_parameters default c_empty_parameters,
    p_auto_bind_items       in boolean      default true,
    --
    p_columns               in t_columns    default c_empty_columns,
    --
    p_first_row             in number       default null,
    p_max_rows              in number       default null,
    --
    p_total_row_count       in boolean      default false,
    p_total_row_count_limit in number       default null )
    return t_context;

--==============================================================================
-- This procedure opens a query context and executes the provided SQL query.
--
-- Parameters:
-- * p_location:               Location to open the query context for. Use constants c_location_*.
--
-- * p_table_owner:            Table owner when query type TABLE is used.
-- * p_table_name:             Table name when query type TABLE is used.
-- * p_where_clause:           Where clause to append when query types TABLE or GRAPH is used.
-- * p_match_clause:           Match clause to append when query type GRAPH is used.
-- * p_columns_clause:         Columns clause to append when query type GRAPH is used.
-- * p_order_by_clause:        Order by clause to append when query type TABLE is used.
-- * p_include_rowid_column:   Add the ROWID column to the SELECT list when query type TABLE is used. Defaults to "false"
-- * p_optimizer_hint:         Optimizer hint to be applied to the most outer SQL query generated by APEX.
--
-- * p_sql_query:              SQL Query to execute when query type SQL Query is used.
-- * p_function_body:          Function body returning SQL query.
-- * p_function_body_language: Programming Language used for p_function_body. Use constants c_lang_*
--
-- * p_module_static_id:       Static ID of the REST Data Source.
-- * p_duality_view_static_id: Static ID of the Duality View Source.
-- * p_json_source_static_id:  Static ID of the JSON Source.
--
-- * p_array_column_name:      Name of an Array column within the REST Source data profile.
-- * p_server_static_id:       Static ID of the Remote Server when REST Enabled SQL is used.
-- * p_external_filter_expr:   external filter expression to be passed to a REST Data Source.
-- * p_external_order_by_expr: external order by expression to be passed to a REST Data Source.
-- * p_web_src_parameters:     parameters to be passed to a REST Data Source
--
-- * p_auto_bind_items:        whether to auto-bind APEX items (page and application items)
-- * p_sql_parameters:         additional bind variables to be used for the SQL query
--
-- * p_columns:                columns to be selected
--
-- * p_filters:                filters to be passed to the query context
-- * p_order_bys:              order by expressions to be passed to the query context
-- * p_aggregation:            aggregation (GROUP BY, DISTINCT) to apply on top of the query
-- * p_control_break:          whether to return control breaks when looping trough the context data
--
--
-- * p_post_process_type:      type of post processing to be applied to the REST Data Source result data.
--                             Use constants c_postprocess_*.
--
-- * p_first_row:              first row to be fetched from the result set
-- * p_max_rows:               maximum amount of rows to be fetched
--
-- * p_total_row_count:        whether to determine the total row count
-- * p_total_row_count_limit:  upper boundary for total row count computation
-- * p_supports_binary_number  whether to return BINARY NUMBER columns as c_data_type_binary_number instead of
--                             c_data_type_number
--
-- Returns:
-- the context object representing a "cursor" for the source query
--
-- Example:
-- the following example executes a query and prints out the result set.
-- This example code can be used within a "Execute PL/SQL" region.
--
--    declare
--        l_context apex_exec.t_context;
--
--        l_idx_empno    pls_integer;
--        l_idx_ename    pls_integer;
--        l_idx_job      pls_integer;
--        l_idx_hiredate pls_integer;
--        l_idx_mgr      pls_integer;
--        l_idx_sal      pls_integer;
--        l_idx_comm     pls_integer;
--        l_idx_deptno   pls_integer;
--
--    begin
--        l_context := apex_exec.open_query_context(
--            p_location          => apex_exec.c_location_local_db,
--            p_sql_query         => 'select * from emp' );
--
--        l_idx_empno    := apex_exec.get_column_position( l_context, 'EMPNO');
--        l_idx_ename    := apex_exec.get_column_position( l_context, 'ENAME');
--        l_idx_job      := apex_exec.get_column_position( l_context, 'JOB');
--        l_idx_hiredate := apex_exec.get_column_position( l_context, 'HIREDATE');
--        l_idx_mgr      := apex_exec.get_column_position( l_context, 'MGR');
--        l_idx_sal      := apex_exec.get_column_position( l_context, 'SAL');
--        l_idx_comm     := apex_exec.get_column_position( l_context, 'COMM');
--        l_idx_deptno   := apex_exec.get_column_position( l_context, 'DEPTNO');
--
--        while apex_exec.next_row( l_context ) loop
--
--            sys.dbms_output.put_line( 'EMPNO: ' || apex_exec.get_number  ( l_context, l_idx_empno    ) );
--            sys.dbms_output.put_line( 'ENAME: ' || apex_exec.get_varchar2( l_context, l_idx_ename    ) );
--            sys.dbms_output.put_line( 'MGR:   ' || apex_exec.get_number  ( l_context, l_idx_mgr      ) );
--
--        end loop;
--
--        apex_exec.close( l_context );
--        return;
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--==============================================================================
function open_query_context(
    p_location               in wwv_flow_exec_api.t_location,
    --
    p_table_owner            in varchar2                       default null,
    p_table_name             in varchar2                       default null,
    p_where_clause           in varchar2                       default null,
    p_match_clause           in varchar2                       default null,
    p_columns_clause         in varchar2                       default null,
    p_order_by_clause        in varchar2                       default null,
    p_include_rowid_column   in boolean                        default false,
    --
    p_sql_query              in varchar2                       default null,
    p_function_body          in varchar2                       default null,
    p_function_body_language in t_language                     default c_lang_plsql,
    p_plsql_function_body    in varchar2                       default null, -- deprecated, use p_function_body
    p_optimizer_hint         in varchar2                       default null,
    --
    p_server_static_id       in varchar2                       default null,
    --
    p_module_static_id       in varchar2                       default null,
    p_web_src_parameters     in t_parameters                   default c_empty_parameters,
    p_external_filter_expr   in varchar2                       default null,
    p_external_order_by_expr in varchar2                       default null,
    --
    p_sql_parameters         in t_parameters                   default c_empty_parameters,
    p_auto_bind_items        in boolean                        default true,
    --
    p_columns                in t_columns                      default c_empty_columns,
    --
    p_filters                in t_filters                      default c_empty_filters,
    p_order_bys              in t_order_bys                    default c_empty_order_bys,
    p_aggregation            in t_aggregation                  default c_empty_aggregation,
    p_control_break          in t_control_break                default c_empty_control_break,
    --
    p_post_process_type      in t_post_processing              default null,
    --
    p_first_row              in number                         default null,
    p_max_rows               in number                         default null,
    --
    p_total_row_count        in boolean                        default false,
    p_total_row_count_limit  in number                         default null,
    --
    p_supports_binary_number in boolean                        default false,
    --
    p_array_column_name      in varchar2                       default null,
    --
    p_duality_view_static_id in varchar2                       default null,
    p_json_source_static_id  in varchar2                       default null )
    return t_context;

--==============================================================================
-- This procedure executes PL/SQL code based on the current process or plug-in
-- location settings.
--
-- Parameters:
-- * p_plsql_code:              PL/SQL code to execute. Based on the settings of the
--                              current process or process-type plug-in, the code is executed
--                              locally or remote.
--
-- Example:
-- executes a PL/SQL block.
--
--    begin
--        apex_exec.execute_plsql(
--            p_plsql_code => q'#begin :P10_NEW_SAL := salary_pkg.raise_sal( p_empno => :P10_EMPNO ); end;#' );
--    end;
--==============================================================================
procedure execute_plsql (
    p_plsql_code in varchar2 );

--==============================================================================
-- This procedure executes PL/SQL code based on the current process or plug-in
-- location settings.
--
-- Parameters:
-- * p_plsql_code:           PL/SQL code to be executed
-- * p_auto_bind_items:      whether to automatically bind page item values for IN *and* OUT direction. If
--                           the PL/SQL code references bind variables which are not page items, this
--                           must be set to FALSE. Default: TRUE
-- * p_sql_parameters:       additional bind variables; if needed. Note that EXECUTE_PLSQL binds all
--                           parameters as VARCHAR2; so if the T_PARAMETER has been created as NUMBER,
--                           DATE or other data types, it will be implicitly converted to VARCHAR2.
--
-- Example:
-- executes a PL/SQL block with arbitrary bind variables, so any bind can be used to
-- pass values and to get values back.
--
--    declare
--        l_sql_parameters apex_exec.t_parameters;
--        l_out_value      varchar2(32767);
--    begin
--        apex_exec.add_parameter( l_sql_parameters, 'MY_BIND_IN_VAR',  '{some value}' );
--
--        apex_exec.execute_plsql(
--            p_plsql_code      => q'#begin some_plsql( p_parameter => :MY_BIND_IN_VAR ); end;#',
--            p_auto_bind_items => false,
--            p_sql_parameters  => l_sql_parameters );
--    end;
--==============================================================================
procedure execute_plsql (
    p_plsql_code      in     varchar2,
    p_auto_bind_items in     boolean      default true,
    p_sql_parameters  in out t_parameters );

--==============================================================================
-- This procedure executes PL/SQL code on a REST Enabled SQL instance.
--
-- Parameters:
-- * p_server_static_id:     static ID of the ORDS REST Enabled SQL Instance
-- * p_plsql_code:           PL/SQL code to be executed
--
-- EXAMPLE
-- executes a PL/SQL block on a remote database.
--
--    begin
--        apex_exec.execute_remote_plsql(
--            p_server_static_id => '{REST Enabled SQL Server static id}',
--            p_plsql_code       => q'#begin :P10_NEW_SAL := salary_pkg.raise_sal( p_empno => :P10_EMPNO ); end;#' );
--    end;
---==============================================================================
procedure execute_remote_plsql(
    p_server_static_id in varchar2,
    p_plsql_code       in varchar2 );

--==============================================================================
-- The open_remote_dml_context and open_local_dml_context procedures open
-- a DML context based for a local or remote database.
--
-- Parameters:
-- * p_server_static_id:        static ID of the ORDS REST Enabled SQL Instance
-- * p_columns:                 DML columns to pass to the data source
-- * p_query_type:              indicates the type of the data source. Use constants c_query_type_*.
--
-- * p_table_owner:             Table owner
-- * p_table_name:              Table name
-- * p_where_clause:            Where clause
--
-- * p_sql_query:               SQL query. Note that the SQL Query must produce an updateable result for the DML to succeed.
-- * p_function_body:           Function body which returns the SQL query. Note that the SQL Query must produce an
--                              updateable result for the DML to succeed.

-- * p_function_body_language:  Programming language used for p_function_body. Use constants c_lang_*.
--
-- * p_with_check_option:       specify whether the "WITH CHECK OPTION" should be used for the data source.
--                              That makes sure that changed values cannot violate the where clause.
-- * p_optimizer_hint:          optimizer hints to be added to the DML clause
--
-- * p_dml_table_owner:         when set, DML statements will be executed against this table
-- * p_dml_table_name:          when set, DML statements will be executed against this table
-- * p_dml_plsql_code:          custom PL/SQL code to be executed instead of generated DML statements
--
-- * p_lost_update_detection:   lost-update detection type. Use constants c_lost_update_*.
-- * p_lock_rows:               specify how to lock rows. Use constants c_lock_rows_*.
-- * p_dml_plsql_code:          custom PL/SQL code to be used to lock the rows.
--
-- * p_sql_parameters:          bind variables to use
--
-- Returns:
-- the context object representing the DML handle.
--
-- Example:
-- this example inserts one row into the EMP table on a REST Enabled SQL Service.
--
--    declare
--        l_columns        apex_exec.t_columns;
--        l_context        apex_exec.t_context;
--    begin
--        -- I. Define DML columns
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'EMPNO',
--            p_data_type      => apex_exec.c_data_type_number,
--            p_is_primary_key => true );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'ENAME',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'JOB',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'HIREDATE',
--            p_data_type      => apex_exec.c_data_type_date );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'MGR',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'SAL',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'COMM',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'DEPTNO',
--            p_data_type      => apex_exec.c_data_type_number );
--
--        -- II. Open the context object
--        l_context := apex_exec.open_remote_dml_context(
--            p_server_static_id      => '{REST Enabled SQL Server static id}',
--            p_columns               => l_columns,
--            p_query_type            => apex_exec.c_query_type_sql_query,
--            p_sql_query             => 'select * from emp where deptno = 10',
--            p_lost_update_detection => apex_exec.c_lost_update_none );
--
--        -- III. Provide DML data
--
--        apex_exec.add_dml_row(
--            p_context   => l_context,
--            p_operation => apex_exec.c_dml_operation_insert );
--
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 1,
--            p_value           => 4711 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 2,
--            p_value           => 'DOE' );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 3,
--            p_value           => 'DEVELOPR' );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 4,
--            p_value           => sysdate );
--        apex_exec.set_value(
--            p_column_position => 6,
--            p_value           => 1000 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 8,
--            p_value           => 10 );
--
--        -- IV: Execute the DML statement
--
--        apex_exec.execute_dml(
--            p_context           => l_context,
--            p_continue_on_error => false);
--
--        apex_exec.close( l_context );
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--
--    end;
--==============================================================================
function open_remote_dml_context (
    p_server_static_id       in varchar2,
    --
    p_columns                in t_columns               default c_empty_columns,
    p_query_type             in t_query_type,
    --
    p_table_owner            in varchar2                default null,
    p_table_name             in varchar2                default null,
    p_where_clause           in varchar2                default null,
    --
    p_sql_query              in varchar2                default null,
    p_function_body          in varchar2                default null,
    p_function_body_language in t_language              default c_lang_plsql,
    p_plsql_function_body    in varchar2                default null, -- deprecated, use p_function_body
    --
    p_with_check_option      in boolean                 default true,
    p_optimizer_hint         in varchar2                default null,
    --
    p_dml_table_owner        in varchar2                default null,
    p_dml_table_name         in varchar2                default null,
    p_dml_plsql_code         in varchar2                default null,
    --
    p_lost_update_detection  in t_lost_update_detection default null,
    p_lock_rows              in t_lock_rows             default null,
    p_lock_plsql_code        in varchar2                default null,
    --
    p_sql_parameters         in t_parameters            default c_empty_parameters ) return t_context;

--==============================================================================
function open_local_dml_context (
    p_columns                in t_columns               default c_empty_columns,
    p_query_type             in t_query_type,
    --
    p_table_owner            in varchar2                default null,
    p_table_name             in varchar2                default null,
    p_where_clause           in varchar2                default null,
    --
    p_sql_query              in varchar2                default null,
    p_function_body          in varchar2                default null,
    p_function_body_language in t_language              default c_lang_plsql,
    p_plsql_function_body    in varchar2                default null, -- deprecated, use p_function_body
    --
    p_with_check_option      in boolean                 default true,
    p_optimizer_hint         in varchar2                default null,
    --
    p_dml_table_owner        in varchar2                default null,
    p_dml_table_name         in varchar2                default null,
    p_dml_plsql_code         in varchar2                default null,
    --
    p_lost_update_detection  in t_lost_update_detection default null,
    p_lock_rows              in t_lock_rows             default null,
    p_lock_plsql_code        in varchar2                default null,
    --
    p_sql_parameters         in t_parameters            default c_empty_parameters ) return t_context;

--==============================================================================
-- This procedure opens a DML context based for a REST Data Source.
--
-- Parameters:
-- * p_static_id:               static ID of the REST Data Source to use. This REST Data Source must have operations
--                              defined for at least one of the Insert Rows, Update Rows or Delete rows database
--                              actions.
--
-- * p_parameters:              REST Data Source parameter values to be used for all DML operations within this context.
--
-- * p_fetch_rows_parameters:   REST Data Source parameter values to use only for the "Fetch Rows" operation within this DML context.
-- * p_fetch_row_parameters:    REST Data Source parameter values to use only for the "Fetch Single Row" operation within this DML context.
-- * p_insert_row_parameters:   REST Data Source parameter values to use only for the "Update" operation within this DML context.
-- * p_update_row_parameters:   REST Data Source parameter values to use only for the "Insert" operation within this DML context.
-- * p_delete_row_parameters:   REST Data Source parameter values to use only for the "Delete" operation within this DML context.
--
-- * p_array_column_name:       Name of an Array column within the REST Source data profile.
-- * p_columns:                 DML columns to pass to the data source
-- * p_lost_update_detection:   lost-update detection type. Use constants c_lost_update_*.
--
-- Returns:
-- the context object representing the DML handle.
--
-- Example:
-- this example "inserts one row" into the "EMP" REST Data Source
--
--    declare
--        l_columns        apex_exec.t_columns;
--        l_context        apex_exec.t_context;
--    begin
--        -- I. Define DML columns
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'EMPNO',
--            p_data_type      => apex_exec.c_data_type_number,
--            p_is_primary_key => true );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'ENAME',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'JOB',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'HIREDATE',
--            p_data_type      => apex_exec.c_data_type_date );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'MGR',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'SAL',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'COMM',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'DEPTNO',
--            p_data_type      => apex_exec.c_data_type_number );
--
--        -- II. Open the context object
--        l_context := apex_exec.open_rest_source_dml_context(
--            p_static_id             => '{module static id}',
--            p_columns               => l_columns,
--            p_lost_update_detection => apex_exec.c_lost_update_none );
--
--        -- III. Provide DML data
--
--        apex_exec.add_dml_row(
--            p_context   => l_context,
--            p_operation => apex_exec.c_dml_operation_insert );
--
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 1,
--            p_value           => 4711 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 2,
--            p_value           => 'DOE' );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 3,
--            p_value           => 'DEVELOPR' );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 4,
--            p_value           => sysdate );
--        apex_exec.set_value(
--            p_column_position => 6,
--            p_value           => 1000 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 8,
--            p_value           => 10 );
--
--        -- IV: Execute the DML statement
--
--        apex_exec.execute_dml(
--            p_context           => l_context,
--            p_continue_on_error => false);
--
--        apex_exec.close( l_context );
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--==============================================================================
function open_web_source_dml_context (
    p_module_static_id      in varchar2,
    p_parameters            in t_parameters            default c_empty_parameters,
    --
    p_columns               in t_columns               default c_empty_columns,
    p_lost_update_detection in t_lost_update_detection default null,
    --
    p_array_column_name     in varchar2                default null )
    return t_context;

--==============================================================================
function open_rest_source_dml_context (
    p_static_id             in varchar2,
    p_parameters            in t_parameters            default c_empty_parameters,
    --
    p_columns               in t_columns               default c_empty_columns,
    p_lost_update_detection in t_lost_update_detection default null,
    --
    p_fetch_rows_parameters in t_parameters            default c_empty_parameters,
    p_fetch_row_parameters  in t_parameters            default c_empty_parameters,
    p_insert_row_parameters in t_parameters            default c_empty_parameters,
    p_update_row_parameters in t_parameters            default c_empty_parameters,
    p_delete_row_parameters in t_parameters            default c_empty_parameters,
    --
    p_array_column_name     in varchar2                default null )
    return t_context;

--==============================================================================
-- This procedure opens a DML context based on a JSON Source or Duality View
-- Source.
--
-- Parameters:
-- * p_static_id:               Static ID of the JSON or Duality View Source to use.
-- * p_array_column_name:       Name of an Array column within the REST Source data profile.
-- * p_columns:                 DML columns to pass to the data source
-- * p_lost_update_detection:   Lost-update detection type. Use constants c_lost_update_*.
--
-- Returns:
-- the context object representing the DML handle.
--
-- Example:
-- this example "inserts one row" into the "EMP" Duality View Source.
--
--    declare
--        l_columns        apex_exec.t_columns;
--        l_context        apex_exec.t_context;
--    begin
--        -- I. Define DML columns
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'EMPNO',
--            p_data_type      => apex_exec.c_data_type_number,
--            p_is_primary_key => true );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'ENAME',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'JOB',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'HIREDATE',
--            p_data_type      => apex_exec.c_data_type_date );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'MGR',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'SAL',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'COMM',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'DEPTNO',
--            p_data_type      => apex_exec.c_data_type_number );
--
--        -- II. Open the context object
--        l_context := apex_exec.open_duality_view_dml_context(
--            p_static_id             => '{duality view static id}',
--            p_columns               => l_columns,
--            p_lost_update_detection => apex_exec.c_lost_update_none );
--
--        -- III. Provide DML data
--
--        apex_exec.add_dml_row(
--            p_context   => l_context,
--            p_operation => apex_exec.c_dml_operation_insert );
--
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 1,
--            p_value           => 4711 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 2,
--            p_value           => 'DOE' );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 3,
--            p_value           => 'DEVELOPR' );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 4,
--            p_value           => sysdate );
--        apex_exec.set_value(
--            p_column_position => 6,
--            p_value           => 1000 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 8,
--            p_value           => 10 );
--
--        -- IV: Execute the DML statement
--
--        apex_exec.execute_dml(
--            p_context           => l_context,
--            p_continue_on_error => false);
--
--        apex_exec.close( l_context );
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--==============================================================================
function open_json_source_dml_context (
    p_static_id             in varchar2,
    p_array_column_name     in varchar2                default null,
    --
    p_columns               in t_columns               default c_empty_columns,
    p_lost_update_detection in t_lost_update_detection default null )
    return t_context;

--==============================================================================
function open_duality_view_dml_context (
    p_static_id             in varchar2,
    p_array_column_name     in varchar2                default null,
    --
    p_columns               in t_columns               default c_empty_columns,
    p_lost_update_detection in t_lost_update_detection default null )
    return t_context;

--==============================================================================
-- this procedure adds one row to the DML context. To be called after the open_dml_context and before the
-- execute_dml procedures. Can be called multiple times to process multiple rows. All columns of the new
-- row are initialized with NULL.
-- Use set_value, set_null and set_row_version_checksum to populate the -- new row with values and the
-- checksum for lost-update detection.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
-- * p_operation:      DML operation to be executed on this row. Use constants c_dml_operation_*.
--
-- Example:
-- see "open_dml_context" procedures.
--==============================================================================
procedure add_dml_row(
    p_context               in t_context,
    p_operation             in t_dml_operation );

--=============================================================================
-- this procedure adds a child row for the current array or the array column provided
-- as p_column_name. The "cursor" moves to the new row within the specified array
-- column, and all subsequent calls to SET_VALUE will target attributes of this
-- new array element. Only allowed within DML contexts on REST Data Sources.
--
-- Hierarchical structures are currently only supported for DML on REST Data Sources,
-- if the REST Source type or Plug-In can deal with such structures. DML on a local
-- table or based on REST Enabled SQL will ignore array columns.
--
-- The provided array column must be a direct child of the current array column;
-- path syntax and jumping to another position in the hierarchy is not allowed.
--
-- Parameters:
-- * p_context:          context object obtained with one of the OPEN_ functions
-- * p_column_name:      Name of the array column (must exist within the current context) to add a new row for.
-- * p_column_position:  position of the column to set the value for within the DML context
-- * p_operation:        DML operation to be executed on this row. Use constants c_dml_operation_*. If omitted,
--                       the child row will inherit the operation from its parent.
--
-- Example:
--
--     declare
--         l_columns apex_exec.t_columns;
--         l_context apex_exec.t_context;
--
--     begin
--
--         --
--         -- I. Define DML columns
--         --
--         -- 1. row-level columns
--         --
--         apex_exec.add_column(
--             p_columns      => l_columns,
--             p_column_name  => 'CUSTOMER_NAME',
--             p_data_type    => apex_exec.c_data_type_varchar2 );
--
--         apex_exec.add_column(
--             p_columns      => l_columns,
--             p_column_name  => 'ORDER_DATE',
--             p_data_type    => apex_exec.c_data_type_date );
--
--         apex_exec.add_column(
--             p_columns      => l_columns,
--             p_column_name  => 'ORDER_ITEMS',
--             p_data_type    => apex_exec.c_data_type_array );
--
--         --
--         -- 2. child columns of the ORDER_ITEMS array column
--         --
--         apex_exec.add_column(
--             p_columns            => l_columns,
--             p_column_name        => 'PRODUCT_ID',
--             p_data_type          => apex_exec.c_data_type_number,
--             p_parent_column_path => 'ORDER_ITEMS' );
--
--         apex_exec.add_column(
--             p_columns            => l_columns,
--             p_column_name        => 'PRODUCT_NAME',
--             p_data_type          => apex_exec.c_data_type_varchar2,
--             p_parent_column_path => 'ORDER_ITEMS' );
--
--         apex_exec.add_column(
--             p_columns            => l_columns,
--             p_column_name        => 'UNIT_PRICE',
--             p_data_type          => apex_exec.c_data_type_number,
--             p_parent_column_path => 'ORDER_ITEMS' );
--
--         apex_exec.add_column(
--             p_columns            => l_columns,
--             p_column_name        => 'AMOUNT_ORDERED',
--             p_data_type          => apex_exec.c_data_type_number,
--             p_parent_column_path => 'ORDER_ITEMS' );
--
--         --
--         -- II. Open the context object
--         --
--         l_context := apex_exec.open_rest_source_dml_context(
--                          p_columns    => l_columns,
--                          p_static_id  => '{module static id}' );
--
--         --
--         -- III: Provide DML data
--         --
--         -- 1. the first row
--         --
--         apex_exec.add_dml_row(
--             p_context   => l_context,
--             p_operation => apex_exec.c_dml_operation_insert );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'CUSTOMER_NAME',
--             p_value        => 'John Doe' );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'ORDER_DATE',
--             p_value        => date'2024-03-15' );
--
--         --
--         -- 1.1. the first line item of the first row
--         --
--         apex_exec.add_dml_array_row(
--             p_context      => l_context,
--             p_operation    => apex_exec.c_dml_operation_insert,
--             p_column_name  => 'ORDER_ITEMS');
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'PRODUCT_ID',
--             p_value        => 100 );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'PRODUCT_NAME',
--             p_value        => 'Men''s Jeans size L' );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'UNIT_PRICE',
--             p_value        => 30.99 );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'AMOUNT_ORDERED',
--             p_value        => 10 );
--
--         --
--         -- 1.2. the second line item of the first row
--         --
--         apex_exec.add_dml_array_row(
--             p_context      => l_context );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'PRODUCT_ID',
--             p_value        => 101 );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'PRODUCT_NAME',
--             p_value        => 'Ladies Jeans size S' );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'UNIT_PRICE',
--             p_value        => 30.99 );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'AMOUNT_ORDERED',
--             p_value        => 10 );
--
--         --
--         -- 2. the second row
--         --
--         apex_exec.add_dml_row(
--             p_context   => l_context,
--             p_operation => apex_exec.c_dml_operation_insert );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'CUSTOMER_NAME',
--             p_value        => 'Jane Doe' );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'ORDER_DATE',
--             p_value        => date'2024-03-16' );
--
--         --
--         -- 2.1. the first line item of the second row
--         --
--         apex_exec.add_dml_array_row(
--             p_context      => l_context,
--             p_operation    => apex_exec.c_dml_operation_insert,
--             p_column_name  => 'ORDER_ITEMS');
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'PRODUCT_ID',
--             p_value        => 100 );
--
--         -- :
--
--         apex_exec.add_dml_array_row(
--             p_context      => l_context,
--             p_operation    => apex_exec.c_dml_operation_insert );
--
--         -- :
--
--         -- IV: Set "cursor" back to the first child in order to change a value
--
--         apex_exec.set_array_current_row(
--             p_context         => l_context,
--             p_current_row_idx => 1 );
--
--         apex_exec.set_value(
--             p_context      => l_context,
--             p_column_name  => 'AMOUNT_ORDERED',
--             p_value        => 20 );
--
--         -- V: Execute the DML statement
--
--         apex_exec.execute_dml(
--             p_context           => l_context,
--             p_continue_on_error => false);
--
--         apex_exec.close( l_context );
--     exception
--         when others then
--             apex_exec.close( l_context );
--             raise;
--     end;
--
-- See also:
-- * close_array
-- * open_array
-- * next_array_row
-- * set_array_current_row
-- * get_array_row_dml_operation
--=============================================================================
procedure add_dml_array_row(
    p_context               in t_context,
    p_column_name           in varchar2        default null,
    p_operation             in t_dml_operation default null );

--=============================================================================
procedure add_dml_array_row(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_operation             in t_dml_operation default null );

--=============================================================================
-- this procedure closes the current array and returns the "cursor" back to
-- the parent element. Subsequent calls to SET_VALUE will target attributes
-- of the parent element (or root row, if there is no parent element).
--
-- Can only be called after calling add_dml_array_row or open_array.
-- An error is raised if called when the "cursor" is on the root level of the row.
-- Currently only supported for contexts on REST Data Sources.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Example:
-- see "open_array" procedure.
--
-- See also:
-- * open_array
-- * next_array_row
-- * set_array_current_row
-- * add_dml_array_row
--=============================================================================
procedure close_array(
    p_context               in t_context );

--==============================================================================
-- clears all DML rows which have been added with add_dml_rows so far.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Example:
-- Open a DML context, populate DML rows, and discards them afterwards.
--
--    declare
--        l_columns        apex_exec.t_columns;
--        l_context        apex_exec.t_context;
--    begin
--        -- I. Define DML columns

--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'EMPNO',
--            p_data_type      => apex_exec.c_data_type_number,
--            p_is_primary_key => true );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'ENAME',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--
--        -- II. Open the context object

--        l_context := apex_exec.open_rest_source_dml_context(
--            p_static_id             => '{module static id}',
--            p_columns               => l_columns,
--            p_lost_update_detection => apex_exec.c_lost_update_none );
--
--        -- III. Provide DML data

--        apex_exec.add_dml_row(
--            p_context   => l_context,
--            p_operation => apex_exec.c_dml_operation_insert );
--
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 1,
--            p_value           => 4711 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 2,
--            p_value           => 'NAME_1' );
--
--        apex_exec.add_dml_row(
--            p_context   => l_context,
--            p_operation => apex_exec.c_dml_operation_insert );
--
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 1,
--            p_value           => 4712 );
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 2,
--            p_value           => 'NAME_2' );
--
--        -- IV. Discard rows
--
--        apex_exec.clear_dml_rows(
--            p_context         => l_context );
--
--        apex_exec.close( l_context );
--    end;
--==============================================================================
procedure clear_dml_rows(
    p_context               in t_context );

--==============================================================================
-- sets the current row pointer of a DML context to the given row number. Subsequent
-- SET_VALUE invocations will affect the row with this row number.
--
-- This function only works with DML contexts, an error message is raised when
-- called on a query context.
--
-- Parameters:
-- * p_context:       context object obtained with one of the OPEN_ functions
-- * p_row_idx:       row number to set the "current row" pointer to.
--
-- Example:
-- this example inserts two rows into the EMP table on a REST Enabled SQL Service.
-- After adding the last row, the example uses set_current_row to explicitly
-- change a value in the first row.
--
--    declare
--        l_columns        apex_exec.t_columns;
--        l_context        apex_exec.t_context;
--    begin
--        -- I. Define DML columns

--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'EMPNO',
--            p_data_type      => apex_exec.c_data_type_number,
--            p_is_primary_key => true );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'ENAME',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--
--        -- II. Open the context object

--        l_context := apex_exec.open_remote_dml_context(
--            p_server_static_id      => '{REST Enabled SQL Server static id}',
--            p_columns               => l_columns,
--            p_query_type            => apex_exec.c_query_type_sql_query,
--            p_sql_query             => 'select * from emp where deptno = 10',
--            p_lost_update_detection => apex_exec.c_lost_update_none );
--
--        -- III. Provide DML data for two row
--
--        apex_exec.add_dml_row(
--            p_context   => l_context,
--            p_operation => apex_exec.c_dml_operation_insert );
--
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 1,
--            p_value           => 4711 );
--        apex_exec.set_value(
--            p_column_position => 2,
--            p_value           => 'NAME_1' );
--
--        apex_exec.add_dml_row(
--            p_context   => l_context,
--            p_operation => apex_exec.c_dml_operation_insert );
--
--        apex_exec.set_value(
--            p_context         => l_context,
--            p_column_position => 1,
--            p_value           => 4712 );
--        apex_exec.set_value(
--            p_column_position => 2,
--            p_value           => 'NAME_2' );
--
--        -- IV. change the ENAME value for the first row
--
--        apex_exec.set_current_row(
--            p_context   => l_context,
--            p_operation => 1 );
--
--        apex_exec.set_value(
--            p_column_position => 2,
--            p_value           => 'Name 1' );
--
--        -- V. Execute the DML statement
--
--        apex_exec.execute_dml(
--            p_context           => l_context,
--            p_continue_on_error => false);
--
--        apex_exec.close( l_context );
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--
-- Since: 21.1
--==============================================================================
procedure set_current_row(
    p_context               in t_context,
    p_row_idx               in pls_integer );

--==============================================================================
-- this procedure enters the array within the provided array column and
-- moves the "cursor" to before the first row, so that calling next_array_row()
-- points to the first array element.
-- Currently only supported for contexts on REST Data Sources.
--
-- Parameters:
-- * p_context:          context object obtained with one of the OPEN_ functions
-- * p_column_position:  position of the column to set the value for within the DML context
-- * p_column_name:      Name of the array column to add a row for.
--
-- Example:
--
--     declare
--         l_context apex_exec.t_context;
--
--     begin
--         l_context := apex_exec.open_rest_source_query(
--             p_static_id        => '{REST Source static ID}',
--             p_max_rows         => 1000 );
--
--         <<rest_rows_loop>>
--         while apex_exec.next_row( l_context ) loop
--             sys.dbms_output.put_line( 'ID:    ' || apex_exec.get_varchar2( l_context, 'TITLE'  ) );
--             sys.dbms_output.put_line( 'MAG:   ' || apex_exec.get_varchar2( l_context, 'MAG'    ) );
--             sys.dbms_output.put_line( 'PLACE: ' || apex_exec.get_varchar2( l_context, 'PLACE'  ) );
--             sys.dbms_output.put_line( 'TITLE: ' || apex_exec.get_varchar2( l_context, 'TIME'   ) );
--             sys.dbms_output.put_line( 'TIME:  ' || apex_exec.get_varchar2( l_context, 'ID'     ) );
--
--             sys.dbms_output.put_line( 'SOURCES: ' );
--             apex_exec.open_array(
--                 p_context      => l_context,
--                 p_column_name  => 'SOURCES' );
--
--             <<rest_child_row_sources_loop>>
--             while apex_exec.next_array_row( l_context ) loop
--
--                 sys.dbms_output.put_line( '-- ID:   ' || apex_exec.get_varchar2( l_context, 'SOURCE_ID'   ) );
--                 sys.dbms_output.put_line( '-- NAME: ' || apex_exec.get_varchar2( l_context, 'SOURCE_NAME' ) );
--
--             end loop rest_child_row_sources_loop;
--
--             apex_exec.close_array( l_context );
--
--             sys.dbms_output.put_line( 'REPORTERS: ' );
--
--             apex_exec.open_array(
--                 p_context      => l_context,
--                 p_column_name  => 'REPORTERS' );
--
--             <<rest_child_row_reporters_loop>>
--             while apex_exec.next_array_row( l_context ) loop
--
--                 sys.dbms_output.put_line( '-- NAME: ' || apex_exec.get_varchar2( l_context, 'REPORTER_NAME' ) );
--
--             end loop rest_child_row_reporters_loop;
--
--             apex_exec.close_array( l_context );
--
--         end loop rest_rows_loop;
--
--         apex_exec.close( l_context );
--     exception
--         when others then
--             apex_exec.close( l_context );
--             raise;
--     end;
--
-- See also:
-- * close_array
-- * next_array_row
-- * set_array_current_row
-- * add_dml_array_row
--==============================================================================
procedure open_array(
    p_context               in t_context,
    p_column_name           in varchar2 );

--==============================================================================
procedure open_array(
    p_context               in t_context,
    p_column_position       in pls_integer );

--==============================================================================
-- this procedure moves the "cursor" to the given row within the current array.
-- Currently only supported for contexts on REST Data Sources.
--
-- Parameters:
-- * p_context:          context object obtained with one of the OPEN_ functions
-- * p_current_row_idx:  Row within the child array to place the cursor on.
--
-- Example:
-- see "open_dml_context" procedures.
--
-- See also:
-- * close_array
-- * open_array
-- * next_array_row
-- * add_dml_array_row
--==============================================================================
procedure set_array_current_row(
    p_context               in t_context,
    p_current_row_idx       in pls_integer );

--==============================================================================
-- Sets the row version checksum to use for lost update detection for the current
-- DML row. To be called after add_dml_row.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
-- * p_checksum:       checksum to use for lost-update detection of this row
--
-- Example:
-- this example opens a query context on the EMP table and retrieves all values and the row version checksum
-- for the row with EMPNO=7839. Then a DML context is opened to update the "SAL" column while using the
-- row version checksum for lost update detection.
--
--    declare
--        l_columns        apex_exec.t_columns;
--        l_dml_context    apex_exec.t_context;
--        l_query_context  apex_exec.t_context;
--    begin
--        -- I. Define DML columns
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'EMPNO',
--            p_data_type      => apex_exec.c_data_type_number,
--            p_is_primary_key => true );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'ENAME',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'JOB',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'HIREDATE',
--            p_data_type      => apex_exec.c_data_type_date );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'MGR',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'SAL',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'COMM',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'DEPTNO',
--            p_data_type      => apex_exec.c_data_type_number );
--
--        -- II. Open the Query Context object
--        l_query_context := apex_exec.open_remote_sql_query(
--            p_server_static_id  => '{REST Enabled SQL Server static id}',
--            p_sql_query         => 'select * from emp where empno = 7839',
--            p_columns           => l_columns );
--
--        -- III. Open the DML context object
--        l_dml_context := apex_exec.open_remote_dml_context(
--            p_server_static_id      => '{REST Enabled SQL Server static id}',
--            p_columns               => l_columns,
--            p_query_type            => apex_exec.c_query_type_sql_query,
--            p_sql_query             => 'select * from emp where deptno = 10',
--            p_lost_update_detection => apex_exec.c_lost_update_implicit );
--
--        if apex_exec.next_row( p_context => l_query_context ) then
--            apex_exec.add_dml_row(
--                p_context   => l_dml_context,
--                p_operation => apex_exec.c_dml_operation_update);
--
--            apex_exec.set_row_version_checksum(
--                p_context   => l_dml_context,
--                p_checksum  => apex_exec.get_row_version_checksum( p_context => l_query_context );
--
--            apex_exec.set_values(
--                p_context         => l_dml_context,
--                p_cource_context  => l_query_context );
--
--            apex_exec.set_value(
--                p_column_name => 'SAL',
--                p_value       => 8000 );
--        else
--            raise_application_error( -20000, 'EMPNO #4711 is not present!');
--        end if;
--
--        apex_exec.execute_dml(
--            p_context           => l_dml_context,
--            p_continue_on_error => false);
--
--        apex_exec.close( l_dml_context );
--        apex_exec.close( l_query_context );
--    exception
--        when others then
--            apex_exec.close( l_dml_context );
--            apex_exec.close( l_query_context );
--            raise;
--
--    end;
--==============================================================================
procedure set_row_version_checksum(
    p_context               in t_context,
    p_checksum              in varchar2 );

--==============================================================================
-- Sets the row version checksum for the current nested array row. Can only be
-- called when being inside an array column; otherwise an error message is
-- being called.
--
-- The checksum is to be used by a REST Data Source Plug-In, when performing
-- plug-in actions for an array element.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
-- * p_checksum:       checksum to use for lost-update detection of this array row
--
-- See also:
-- * get_array_row_version_checksum
--==============================================================================
procedure set_array_row_version_checksum(
    p_context               in t_context,
    p_checksum              in varchar2 );

--==============================================================================
-- Sets error status for the current row. This is useful for REST Data Source
-- Plug-In DML functions where we need to report on the error or success status
-- for a given row after performing the actual REQUEST.
--
-- Parameters:
-- * p_context:         context object obtained with one of the OPEN_ functions
-- * p_sqlcode:         Error code to report for this row
-- * p_sqlerrm:         Error message to report for this row
--
-- Example:
-- see "set_row_version_checksum" procedure
--==============================================================================
procedure set_row_status(
    p_context               in t_context,
    p_sqlcode               in pls_integer,
    p_sqlerrm               in varchar2 );

--==============================================================================
-- Sets all column values in the DML context with corresponding column values
-- from the source (query) context. Useful for querying a row, changing only
-- single columns and writing the row back.
--
-- Parameters:
-- * p_context:          context object obtained with one of the OPEN_ functions
-- * p_source_context:   query context object to get column values from.
--
-- Example:
-- see "set_row_version_checksum" procedure
--==============================================================================
procedure set_values(
    p_context               in t_context,
    p_source_context        in t_context );

--==============================================================================
-- Setter procedures to set a DML column value to NULL. Useful when the row
-- has been initialized from a query context with set_values and the new value
-- of one of the columns should be NULL.
--
-- The procedure can be called either with the column name or with the column position.
-- Calling with the column position is typically more efficient, since Oracle APEX
-- does not need to it look up.
--
-- Parameters:
-- * p_context:          context object obtained with one of the OPEN_ functions
-- * p_column_position:  position of the column to set the value for within the DML context
-- * p_column_name:      name of the column to set the value for
--
-- Example:
--      apex_exec.set_null(
--          p_context         => l_dml_context,
--          p_column_name     => 'SAL' );
--
--      apex_exec.set_null(
--          p_context         => l_dml_context,
--          p_column_position => 6 );
--==============================================================================
procedure set_null(
    p_context               in t_context,
    p_column_position       in pls_integer );

procedure set_null(
    p_context               in t_context,
    p_column_name           in varchar2 );

--==============================================================================
-- Setter procedures to set DML column values. To be called after add_dml_row for
-- each column value to be set.

-- Each procedure can be called either with the column name or with the column position.
-- Calling with the column position is typically more efficient, since Oracle APEX
-- does not need to it look up.
--
-- Parameters:
-- * p_context:          context object obtained with one of the OPEN_ functions
-- * p_column_position:  position of the column to set the value for within the DML context
-- * p_column_name:      name of the column to set the value for
-- * p_value:            value to set
--
-- Example:
--    apex_exec.set_value(
--        p_context         => l_dml_context,
--        p_column_name     => 'SAL',
--        p_value           => 9500 );
--
--    apex_exec.set_value(
--        p_context         => l_dml_context,
--        p_column_position => 6,
--        p_value           => 9500 );
--
--    apex_exec.set_value(
--        p_context         => l_dml_context,
--        p_column_position => 'HIREDATE',
--        p_value           => trunc( sysdate ) );
--
-- also see "open_dml_context" procedures.
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in varchar2 );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in varchar2 );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in number );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in number );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in binary_double );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in binary_double );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in date );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in date );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in timestamp );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in timestamp );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in timestamp with time zone);

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in timestamp with time zone);
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in timestamp with local time zone);

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in timestamp with local time zone);
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in dsinterval_unconstrained );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in dsinterval_unconstrained );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in yminterval_unconstrained );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in yminterval_unconstrained );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in clob );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in clob );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in blob );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in blob );
--==============================================================================
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in sys.anydata );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in sys.anydata );

--==============================================================================
$IF wwv_flow_db_version.c_has_locator $THEN
procedure set_value(
    p_context               in t_context,
    p_column_position       in pls_integer,
    p_value                 in mdsys.sdo_geometry );

procedure set_value(
    p_context               in t_context,
    p_column_name           in varchar2,
    p_value                 in mdsys.sdo_geometry );
$END

--==============================================================================
-- executes the DML context. To be called
--
-- * after the context has been opened (open_dml_context)
-- * one or many DML rows have been added with add_dml_row
-- * column values have been set with set_values, set_null or set_value
--
-- Parameters:
--    p_context            context object obtained with one of the OPEN_ functions
--    p_continue_on_error  whether to continue executing DML for the remaining rows
--                         after an error occurred (defaults to false)
-- Example:
-- see "open_dml_context" and "set_row_version_checksum" procedures
--==============================================================================
procedure execute_dml(
    p_context               in t_context,
    p_continue_on_error     in boolean default false );

--==============================================================================
-- fetches all rows from the source context and writes to the target context.
-- Useful -- to copy data between different data sources (for example: local to remote,
-- or remote to REST Data Source).
--
-- Array columns are not supported by the COPY_DATA procedure yet. These will be
-- handled as CLOBs in JSON format.
--
-- Parameters:
-- * p_from_context:          query context to fetch rows from
-- * p_to_context:            DML context to write rows to
-- * p_operation_column_name: column in the query context to indicate the DML operation to execute on the target
--                            context. Possible values are:
--                            * "I": insert the row on the target (DML) context
--                            * "U": update the row on the target (DML) context
--                            * "D": delete the row on the target (DML) context
--
-- Example:
--    declare
--        l_columns        apex_exec.t_columns;
--        l_dml_context    apex_exec.t_context;
--        l_query_context  apex_exec.t_context;
--    begin
--        -- I. Define DML columns
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'EMPNO',
--            p_data_type      => apex_exec.c_data_type_number,
--            p_is_primary_key => true );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'ENAME',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'JOB',
--            p_data_type      => apex_exec.c_data_type_varchar2 );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'HIREDATE',
--            p_data_type      => apex_exec.c_data_type_date );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'MGR',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'SAL',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'COMM',
--            p_data_type      => apex_exec.c_data_type_number );
--        apex_exec.add_column(
--            p_columns        => l_columns,
--            p_column_name    => 'DEPTNO',
--            p_data_type      => apex_exec.c_data_type_number );
--
--        -- II. Open the Query Context object
--        l_query_context := apex_exec.open_remote_sql_query(
--            p_server_static_id  => '{REST Enabled SQL Server static id}',
--            p_sql_query         => 'select * from emp',
--            p_columns           => l_columns );
--
--        -- III. Open the DML context object
--        l_dml_context := apex_exec.open_remote_dml_context(
--            p_server_static_id      => '{REST Enabled SQL Server static id}',
--            p_columns               => l_columns,
--            p_query_type            => apex_exec.c_query_type_sql_query,
--            p_sql_query             => 'select * from emp' );
--
--        -- IV. Copy rows
--        apex_exec.copy_data(
--            p_from_context => l_query_context,
--            p_to_context   => l_dml_context );
--
--        -- V. Close contexts and free resources
--        apex_exec.close( l_dml_context );
--        apex_exec.close( l_query_context );
--    exception
--        when others then
--            apex_exec.close( l_dml_context );
--            apex_exec.close( l_query_context );
--            raise;
--
--    end;
--==============================================================================
procedure copy_data(
    p_from_context          in out nocopy t_context,
    p_to_context            in out nocopy t_context,
    p_operation_column_name in            varchar2 default null);

--==============================================================================
-- This procedure executes PL/SQL code on a REST Enabled SQL instance.
--
-- Parameters:
-- * p_server_static_id:      static ID of the ORDS REST Enabled SQL Instance
-- * p_plsql_code:            PL/SQL code to be executed
-- * p_auto_bind_items:       whether to automatically bind page item values for IN *and* OUT direction. If
--                            the PL/SQL code references bind variables which are not page items, this
--                            must be set to FALSE.
-- * p_sql_parameters:        additional bind variables; if needed
--
-- Example:
-- executes a PL/SQL block on a remote database.
--
--    begin
--        apex_exec.execute_remote_plsql(
--            p_server_static_id => '{REST Enabled SQL Server static id}',
--            p_plsql_code       => q'#begin :P10_NEW_SAL := salary_pkg.raise_sal( p_empno => :P10_EMPNO ); end;#' );
--    end;
--
-- execute a PL/SQL block on a remote database, using bind variables, which are not page items.
--
--    declare
--        l_sql_parameters apex_exec.t_parameters;
--        l_out_value      varchar2(32767);
--    begin
--        apex_exec.add_parameter( l_sql_parameters, 'MY_BIND_IN_VAR',  '{some value}' );
--        apex_exec.add_parameter( l_sql_parameters, 'MY_BIND_OUT_VAR', ''             );
--
--        apex_exec.execute_remote_plsql(
--            p_server_static_id  => '{REST Enabled SQL Server static id}',
--            p_plsql_code        => q'#begin :MY_BIND_OUT_VAR := some_remote_plsql( p_parameter => :MY_BIND_IN_VAR ); end;#',
--            p_auto_bind_items   => false,
--            p_sql_parameters    => l_sql_parameters );
--
--        l_out_value := apex_exec.get_parameter_varchar2(
--            p_parameters  => l_sql_parameters,
--            p_name        => 'MY_BIND_OUT_VAR');
--
--        -- further processing of l_out_value
--    end;
--==============================================================================
procedure execute_remote_plsql(
    p_server_static_id  in     varchar2,
    p_plsql_code        in     varchar2,
    p_auto_bind_items   in     boolean      default true,
    p_sql_parameters    in out t_parameters );

--==============================================================================
-- checks whether the current authentication credentials are correct for the
-- given REST Enabled SQL instance.
--
-- Parameters:
-- * p_server_static_id:     static ID of the REST enabled SQL instance
--
-- Returns:
-- true, when credentials are correct, false otherwise
--
-- Example:
-- Tests whether the provided credentials are valid for a REST Enabled SQL reference.
--
-- begin
--     apex_credentials.set_session_credentials(
--         p_application_id    => {application-id},
--         p_credential_name   => 'SCOTT_Credentials',
--         p_username          => 'SCOTT',
--         p_password          => '****' );
--
--     if apex_exec.check_rest_enabled_sql_auth(
--         p_server_static_id  => '{REST Enabled SQL Server static id}' )
--     then
--         sys.dbms_output.put_line( 'credentials are correct!');
--     else
--         sys.dbms_output.put_line( 'credentials are NOT correct!');
--     end if;
-- end;
--==============================================================================
function is_remote_sql_auth_valid(
    p_server_static_id  in  varchar2 ) return boolean;

--==============================================================================
-- Executes a REST source operation based on module static ID, operation and
-- URL pattern (if required). Use the t_parameters array to pass in values
-- for declared REST Data Source parameters. REST Data Source invocation is done based
-- on meta data defined in Shared Components.
--
-- Parameters:
-- * p_static_id:           static ID of the REST Data Source
-- * p_operation_static_id: Static ID of the operation, if configured
-- * p_operation:           HTTP operation, e.g. POST, GET, DELETE
-- * p_url_pattern:         If multiple operations with the same name exist, specify the URL pattern,
--                          as defined in Shared Components, to identify the REST source operation.
-- * p_parameters:          parameter values to pass to the external REST Data Source
--
-- Returns:
-- array with OUT parameter values, received from the REST Data Source
--
-- Example:
-- This example assumes a REST service being created on the EMP table using
-- ORDS and the "Auto-REST" feature (ORDS.ENABLE_OBJECT). Then a REST Data Source
-- for this REST service is being created in Shared Components as "ORDS EMP".
--
-- * The POST operation has the following "Request Body Template" defined:
--   {"empno": "#EMPNO#", "ename": "#ENAME#", "job": "#JOB#", "sal": #SAL#}
--
-- * Parameters are defined as follows:
--   Name         Direction    Type
--   ------------ ------------ --------------
--   EMPNO        IN           Request Body
--   ENAME        IN           Request Body
--   SAL          IN           Request Body
--   JOB          IN           Request Body
--   RESPONSE     OUT          Request Body
--   Content-Type IN           HTTP Header
--
-- PL/SQL code to invoke that REST source operation looks as follows:
--
--    declare
--        l_params apex_exec.t_parameters;
--    begin
--        apex_exec.add_parameter( l_params, 'ENAME', :P2_ENAME );
--        apex_exec.add_parameter( l_params, 'EMPNO', :P2_EMPNO );
--        apex_exec.add_parameter( l_params, 'SAL',   :P2_SAL   );
--        apex_exec.add_parameter( l_params, 'JOB',   :P2_JOB   );

--        apex_exec.execute_rest_source(
--            p_static_id        => 'ORDS_EMP',
--            p_operation        => 'POST',
--            p_parameters       => l_params );
--
--        :P2_RESPONSE := apex_exec.get_parameter_clob(l_params,'RESPONSE');
--    end;
--==============================================================================

procedure execute_web_source (
    p_module_static_id in            varchar2,
    p_operation        in            varchar2,
    p_url_pattern      in            varchar2         default null,
    p_parameters       in out nocopy t_parameters );

--==============================================================================
procedure execute_rest_source (
    p_static_id        in            varchar2,
    p_operation        in            varchar2,
    p_url_pattern      in            varchar2         default null,
    p_parameters       in out nocopy t_parameters );

--==============================================================================
procedure execute_rest_source (
    p_static_id           in            varchar2,
    p_operation_static_id in            varchar2,
    p_parameters          in out nocopy t_parameters );

--==============================================================================
-- Returns the result column count for this context object
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- column count
--==============================================================================
function get_column_count (
    p_context in t_context ) return pls_integer;

--==============================================================================
-- Returns a query context total result row count. If unknown (for REST Sources),
-- NULL is returned.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- total row count; NULL if unknown
--==============================================================================
function get_total_row_count (
    p_context in t_context ) return number;

--==============================================================================
-- Returns whether the data source has more data after fetching p_max_rows.
-- Note that this function only returns a value after the NEXT_ROW loop
-- has been finished. Only then we can know that there is more data
-- to fetch than we actually requested.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- true, if there is more data, false otherwise. NULL if no "more data detection"
-- was requested.
--
-- Example:
-- the following example executes a query, fetches a maximum of 10 rows
-- and prints out the result set. If there are more rows, then a message "has more rows"
-- is displayed.
--
--    declare
--        l_context      apex_exec.t_context;
--
--    begin
--        l_context := apex_exec.open_query_context(
--            p_location          => apex_exec.c_location_local_db,
--            p_max_rows          => 10,
--            p_sql_query         => 'select * from emp' );
--
--        while apex_exec.next_row( l_context ) loop
--
--            sys.dbms_output.put_line( 'EMPNO: ' || apex_exec.get_number  ( l_context, 'EMPNO' ) );
--            sys.dbms_output.put_line( 'ENAME: ' || apex_exec.get_varchar2( l_context, 'ENAME' ) );
--
--        end loop;
--
--        if apex_exec.has_more_rows( l_context ) then
--            sys.dbms_output.put_line( 'there are more rows ...' );
--        end if;
--
--        apex_exec.close( l_context );
--        return;
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--==============================================================================
function has_more_rows (
    p_context in t_context ) return boolean;

--==============================================================================
-- Returns whether the current array has more children. Can only be called
-- when being within an array column; otherwise an error is raised.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- true, if successful; false, if the end of the result set has been reached.
--
-- See also:
-- * close_array
-- * open_array
-- * next_array_row
--==============================================================================
function has_more_array_rows(
    p_context in t_context )
    return boolean;

--==============================================================================
-- Returns whether an end of group was found.
-- Group columns must not be null.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- true, if successful; false, if no group change was found.
--
-- Example:
-- the following example executes a query and prints out the result set with 
-- control breaks.
--
--    declare
--        l_context               apex_exec.t_context;
--        l_columns               apex_exec.t_columns;
--        l_control_break         apex_exec.t_control_break;
--        l_order_bys             apex_exec.t_order_bys;
--    begin
--
--        apex_exec.add_column(
--            p_columns     => l_columns,
--            p_column_name => 'EMPNO' );
--
--        apex_exec.add_column(
--            p_columns     => l_columns,
--            p_column_name => 'ENAME' );
--        apex_exec.add_column(
--            p_columns     => l_columns,
--            p_column_name => 'JOB' );
--
--        apex_exec.add_column(
--            p_columns     => l_columns,
--            p_column_name => 'DEPTNO' );
--
--        apex_exec.add_order_by(
--            p_order_bys     => l_order_bys,
--            p_column_name   => 'JOB',
--            p_direction     => apex_exec.c_order_asc );
--
--        apex_exec.add_order_by(
--            p_order_bys     => l_order_bys,
--            p_column_name   => 'DEPTNO',
--            p_direction     => apex_exec.c_order_asc );
--
--
--        apex_exec.add_column(
--            p_columns     => l_control_break.control_break_columns,
--            p_column_name => 'JOB' );
--
--        apex_exec.add_column(
--            p_columns     => l_control_break.control_break_columns,
--            p_column_name => 'DEPTNO' );
--
--        l_context := apex_exec.open_query_context(
--            p_location         => apex_exec.c_location_local_db,
--            p_sql_query        => 'select * from emp',
--            p_columns          => l_columns,
--            p_order_bys        => l_order_bys,
--            p_control_break    => l_control_break );
--
--        while apex_exec.next_row( l_context ) loop
--
--            sys.dbms_output.put_line( 'EMPNO: ' || apex_exec.get_number  ( l_context, 'EMPNO' ) );
--            sys.dbms_output.put_line( 'ENAME: ' || apex_exec.get_varchar2( l_context, 'ENAME' ) );
--            if apex_exec.is_group_end( p_context => l_context ) then
--                sys.dbms_output.put_line( 'Is end of Control Break' );
--            end if;
--
--        end loop;
--
--        apex_exec.close( l_context );
--        return;
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--==============================================================================
function is_group_end(
    p_context in t_context )
    return boolean;

--==============================================================================
-- Returns the column position for a given column name or alias.
--
-- Parameters:
-- * p_context:             context object obtained with one of the OPEN_ functions
-- * p_attribute_label:     attribute label to format error messages
-- * p_column_name:         column name
-- * p_is_required:         indicates whether this is a required column
-- * p_data_type:           indicates the requsted data type
-- * p_parent_column_path:  path to the parent column to look the index up within
--
-- Returns:
-- the position of the column in the query result set.
--==============================================================================
function get_column_position (
    p_context            in t_context,
    p_column_name        in varchar2,
    p_attribute_label    in varchar2  default null,
    p_is_required        in boolean   default false,
    p_data_type          in varchar2  default c_data_type_varchar2,
    p_parent_column_path in varchar2  default null )
    return pls_integer;

--==============================================================================
-- Returns the list of columns containing detailed information about each column.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
--    t_columns object with column meta data
--==============================================================================
function get_columns(
    p_context    in t_context )
    return t_columns;

--==============================================================================
-- Returns detailed information about a result set column
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
-- * p_column_idx:     index (position) of the column
--
-- Returns:
--    t_column object with column meta data
--==============================================================================
function get_column(
    p_context    in t_context,
    p_column_idx in pls_integer ) return t_column;

--==============================================================================
-- Advances the cursor of a context by one row. For REST Data Source
-- returning their data page-wise, additional pages are being fetched transparently.
-- This function can be used in WHILE loops to walk through all result rows.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- true, if successful; false, if the end of the result set has been reached.
--
-- Example:
-- see "open_query_context" procedures.
--==============================================================================
function next_row(
    p_context in t_context ) return boolean;

--==============================================================================
-- Advances the array cursor by one row. Can only be called when being within
-- an array column; otherwise an error is raised.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- true, if successful; false, if the end of the result set has been reached.
--
-- See also:
-- * close_array
-- * open_array
-- * has_more_array_rows
--==============================================================================
function next_array_row(
    p_context in t_context ) return boolean;

--==============================================================================
-- Returns the row version checksum for the current row. This is either a
-- specific column (when designated as "checksum column") or a calculated
-- checksum from all column values.
-- The checksum can be used for Lost Update detection in subsequent DML operations.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- row version checksum for the current row.
--==============================================================================
function get_row_version_checksum(
    p_context     in t_context ) return varchar2;

--==============================================================================
-- Returns the row version checksum for the current nested array row. Can only be
-- called when being inside an array column; otherwise an error message is
-- being called.
--
-- To be used within a REST Data Source Plug-In when a checksum for an array element
-- is needed to perform plug-in actions.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- row version checksum for the nested current array row.
--
-- See also:
-- * set_array_row_version_checksum
--==============================================================================
function get_array_row_version_checksum(
    p_context               in t_context)
    return varchar2;

--==============================================================================
-- Returns whether DML execution for the current row led to an error or not.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- true, if an error occurred, false otherwise
--==============================================================================
function has_error(
    p_context               in t_context) return boolean;

--==============================================================================
-- Returns the SQL status code of the last context execution, for the current
-- row. For local or remote SQL contexts, the ORA error code will be returned
-- in case of an error, NULL in case of success.
-- For REST Data Source contexts, the function will return the HTTP status code.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- the DML status code of the current row.
--==============================================================================
function get_dml_status_code(
    p_context               in t_context) return number;

--==============================================================================
-- Returns the SQL status message of the last context execution, for the current
-- row. For local or remote SQL contexts, the ORA error message will be returned
-- in case of an error, NULL in case of success.
-- For REST Data Source contexts, the function will return the HTTP "reason phrase".
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- the DML status message of the current row.
--==============================================================================
function get_dml_status_message(
    p_context               in t_context) return varchar2;

--==============================================================================
-- Returns the DML operation type for the current array element. Can only be
-- called when being inside an array column; otherwise an error message is
-- being called.
--
-- To be used within a REST Data Source Plug-In when plug-in actions are to
-- be executed based on the DML type for an array element.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
--
-- Returns:
-- The DML type, as instance of t_dml_operation, for the current array row.
--
-- See also:
-- * add_dml_array_row
--==============================================================================
function get_array_row_dml_operation(
    p_context               in t_context) return t_dml_operation;

--==============================================================================
-- Getter functions to retrieve column values from a context.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions
-- * p_column_idx:     column index
--
-- Returns:
--    column value as specific data type
--
-- Example:
-- see "open_query_context" procedures.
--==============================================================================
function get_varchar2 (
    p_context     in t_context,
    p_column_idx  in pls_integer ) return varchar2;

function get_varchar2 (
    p_context     in t_context,
    p_column_name in varchar2 ) return varchar2;

--==============================================================================
function get_number (
    p_context     in t_context,
    p_column_idx  in pls_integer ) return number;

function get_number (
    p_context     in t_context,
    p_column_name in varchar2 ) return number;


--==============================================================================
function get_binary_number (
    p_context     in t_context,
    p_column_idx  in pls_integer ) return binary_double;

function get_binary_number (
    p_context     in t_context,
    p_column_name in varchar2 ) return binary_double;

--==============================================================================
function get_date (
    p_context     in t_context,
    p_column_idx  in pls_integer ) return date;

function get_date (
    p_context     in t_context,
    p_column_name in varchar2 ) return date;
--==============================================================================
function get_timestamp (
    p_context    in t_context,
    p_column_idx in pls_integer ) return timestamp;

function get_timestamp (
    p_context    in t_context,
    p_column_name in varchar2 ) return timestamp;
--==============================================================================
function get_timestamp_tz (
    p_context    in t_context,
    p_column_idx in pls_integer ) return timestamp with time zone;

function get_timestamp_tz (
    p_context    in t_context,
    p_column_name in varchar2 ) return timestamp with time zone;
--==============================================================================
function get_timestamp_ltz (
    p_context    in t_context,
    p_column_idx in pls_integer ) return timestamp with local time zone;

function get_timestamp_ltz (
    p_context    in t_context,
    p_column_name in varchar2 ) return timestamp with local time zone;
--==============================================================================
function get_clob (
    p_context    in t_context,
    p_column_idx in pls_integer ) return clob;

function get_clob (
    p_context    in t_context,
    p_column_name in varchar2 ) return clob;
--==============================================================================
function get_blob (
    p_context    in t_context,
    p_column_idx in pls_integer ) return blob;

function get_blob (
    p_context    in t_context,
    p_column_name in varchar2 ) return blob;
--==============================================================================
function get_intervald2s (
    p_context    in t_context,
    p_column_idx in pls_integer ) return dsinterval_unconstrained;

function get_intervald2s (
    p_context    in t_context,
    p_column_name in varchar2 ) return dsinterval_unconstrained;
--==============================================================================
function get_intervaly2m (
    p_context    in t_context,
    p_column_idx in pls_integer ) return yminterval_unconstrained;

function get_intervaly2m (
    p_context    in t_context,
    p_column_name in varchar2 ) return yminterval_unconstrained;
--==============================================================================
function get_anydata (
    p_context    in t_context,
    p_column_idx in pls_integer ) return sys.anydata;

function get_anydata (
    p_context    in t_context,
    p_column_name in varchar2 ) return sys.anydata;

--==============================================================================
$IF wwv_flow_db_version.c_has_locator $THEN
function get_sdo_geometry (
    p_context    in t_context,
    p_column_idx in pls_integer ) return mdsys.sdo_geometry;

function get_sdo_geometry (
    p_context    in t_context,
    p_column_name in varchar2 ) return mdsys.sdo_geometry;
$END

--==============================================================================
-- Closes the query context and releases resources. Make sure to always call
-- this procedure after work has finished or an exception occurred.
--
-- Parameters:
-- * p_context:        context object obtained with one of the OPEN_ functions.
--==============================================================================
procedure close(
    p_context in t_context );

--==============================================================================
-- Adds a SQL parameter (bind variable) to the parameter collection.
-- To use SQL parameters, prepare the array first, then use it in the execution call.
--
-- Parameters:
-- * p_parameters:              SQL parameter array
-- * p_name:                    parameter name
-- * p_value:                   parameter value
--
-- Example:
-- Prepare an array of bind variables and use it for executing PL/SQL on a REST Enabled
-- SQL reference.
--
--    declare
--        l_parameters     apex_exec.t_parameters;
--    begin
--        apex_exec.add_parameter( l_parameters, 'ENAME',    'SCOTT' );
--        apex_exec.add_parameter( l_parameters, 'SAL',      2000 );
--        apex_exec.add_parameter( l_parameters, 'HIREDATE', sysdate );
--
--        apex_exec.execute_remote_plsql(
--            p_server_static_id => '{REST Enabled SQL Server static id}',
--            p_auto_bind_items  => false,
--            p_plsql_code       => q'#begin insert into emp values (:ENAME, :SAL, :HIREDATE ); end;#',
--            p_sql_parameters   => l_parameters );
--    end;
--==============================================================================
procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            varchar2 );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            number );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            binary_double );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            date );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            timestamp );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            timestamp with time zone );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            timestamp with local time zone );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            yminterval_unconstrained );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            dsinterval_unconstrained );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            blob );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            bfile );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            clob );

$IF wwv_flow_db_version.c_has_locator $THEN
procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            mdsys.sdo_geometry );
$END

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            sys.anydata );

procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_data_type  in            t_data_type,
    p_value      in            t_value );

procedure add_parameter (
    p_parameters          in out nocopy t_parameters,
    p_name                in            varchar2,
    p_value               in            varchar2,
    p_data_type           in            t_data_type,
    p_format_mask         in            varchar2 default null );

$IF wwv_flow_db_version.c_has_vector_type $THEN
procedure add_parameter (
    p_parameters in out nocopy t_parameters,
    p_name       in            t_column_name,
    p_value      in            vector );
$END

--==============================================================================
-- Returns a SQL parameter value. Typically used to retrieve values for
-- OUT binds of an executed SQL or PL/SQL statement.
--
-- Parameters:
-- * p_parameters:              SQL parameter array
-- * p_name:                    parameter name
-- * p_format_mask:             format mask to use for DATE, TIMESTAMP or NUMBER parameters
--
-- Returns:
-- the parameter value.
--
-- Example:
-- see "execute_remote_plsql" procedure.
--==============================================================================
function get_parameter_varchar2(
    p_parameters      in t_parameters,
    p_name            in varchar2,
    p_format_mask     in varchar2 default null ) return varchar2;

function get_parameter_number(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return number;

function get_parameter_binary_number(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return binary_double;

function get_parameter_date(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return date;

function get_parameter_timestamp(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return timestamp;

function get_parameter_timestamp_tz(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return timestamp with time zone;

function get_parameter_timestamp_ltz(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return timestamp with local time zone;

function get_parameter_clob(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return clob;

function get_parameter_interval_d2s(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return dsinterval_unconstrained;

function get_parameter_interval_y2m(
    p_parameters      in t_parameters,
    p_name            in varchar2 ) return yminterval_unconstrained;

--==============================================================================
-- Adds a column to the columns collection. Columns collections are passed
-- the OPEN_*_CONTEXT calls in order to request only a subset of columns. This is
-- particularly useful for REST Data Sources where no SQL statement is involved.
-- If no or an empty column array is passed, all columns defined in the
-- REST Data Source are being fetched.
--
-- Parameters:
-- * p_columns:            columns array
-- * p_column_name:        column name
-- * p_parent_column_path: indicates the parent column of this column. Use dot syntax
--                         for deeper levels of hierarchy, e.g. "CUSTOMERS"."ORDERS". Currently
--                         only supported for DML on REST Data Sources.
-- * p_data_type:          column data type
-- * p_sql_expression:     SQL expression in order to derive a column from other columns
-- * p_format_mask:        format mask to use for this column
-- * p_is_primary_key:     whether this is a primary key column (default false)
-- * p_is_query_only:      query only columns are not written in a DML context (default false)
-- * p_is_returning:       whether to retrieve the RETURNING column after DML has been executed (default false)
-- * p_is_checksum:        whether this is a checksum (row version) column (default false)
--
-- Example:
-- Fetch only ENAME and SAL columns from a REST Data Source.
--
--     declare
--         l_columns     apex_exec.t_columns;
--         l_context     apex_exec.t_context;
--     begin
--         apex_exec.add_column(
--             p_columns     => l_columns,
--             p_column_name => 'ENAME' );
--
--         apex_exec.add_column(
--             p_columns     => l_columns,
--             p_column_name => 'SAL' );

--         l_context := apex_exec.open_rest_source_query(
--             p_static_id        => '{REST Data Source static ID}',
--             p_columns          => l_columns
--             p_max_rows         => 1000 );
--
--             while apex_exec.next_row( l_context ) loop
--                -- process rows here ...
--             end loop;
--
--         apex_exec.close( l_context );
--     exception
--         when others then
--             apex_exec.close( l_context );
--             raise;
--     end;
--==============================================================================
procedure add_column(
    p_columns              in out nocopy t_columns,
    p_column_name          in            varchar2,
    p_data_type            in            t_data_type default null,
    p_sql_expression       in            varchar2    default null,
    p_format_mask          in            varchar2    default null,
    p_is_primary_key       in            boolean     default false,
    p_is_query_only        in            boolean     default false,
    p_is_returning         in            boolean     default false,
    p_is_checksum          in            boolean     default false,
    p_parent_column_path   in            varchar2    default null );

--==============================================================================
-- Adds the APEX$VECTOR_DISTANCE column to the column collection.
-- This is mandatory for the Vector Search specific add_filter procedure.
--
-- Parameters:
-- * p_columns: columns array
--==============================================================================
procedure add_vector_distance_column (
    p_columns in out nocopy t_columns );

--==============================================================================
-- Checks whether a column already exists in the columns array.
--
-- Parameters:
-- * p_columns:            columns array
-- * p_column_name:        column name
-- * p_parent_column_path: path to the parent column to look the index up within
--
-- Returns:
-- true if the column exists, false otherwise
--
-- Example:
-- Builds a column array and verifies that the SAL column exists in the array.
--
--     declare
--         l_columns     apex_exec.t_columns;
--     begin
--         apex_exec.add_column(
--             p_columns     => l_columns,
--             p_column_name => 'ENAME' );
--
--         apex_exec.add_column(
--             p_columns     => l_columns,
--             p_column_name => 'SAL' );
--
--         if apex_exec.column_exists(
--                p_columns     => l_columns,
--                p_column_name => 'SAL' )
--         then
--             -- the column exists ...
--         end if;
--     end;
--==============================================================================
function column_exists(
    p_columns            in t_columns,
    p_column_name        in varchar2,
    p_parent_column_path in varchar2 default null )
    return boolean;

--==============================================================================
-- Adds a filter to the filter collection.
--
-- Parameters:
-- * p_filters:            filters array
-- * p_filter_type:        type of filter - use one of the t_filter_type constants
-- * p_column_name:        column to apply this filter on
-- * p_data_type:          data type of the column to apply this filter on
--
-- * p_value:              value for filters requiring one value (e.g. equals or greater than)
-- * p_values:             value array for IN or NOT IN filters
-- * p_from_value:         lower value for filters requiring a range (e.g. between)
-- * p_to_value:           upper value for filters requiring a range (e.g. between)
-- * p_interval:           interval for date filters (e.g. last X months)
-- * p_interval_type:      interval type for date filters (months, dates)
--
-- * p_sql_expression:     generic SQL expression to use as filter
--
-- * p_null_result:        result to return when the actual column value is NULL
-- * p_is_case_sensitive:  whether this filter should work case-sensitive or not
--
-- * p_tokenize:           whether to tokenize a row search term to individual words.
--                         Defaults to the "Tokenize Row Search" application attribute.
--
-- Example:
-- Fetch data from a REST Data Source using filters on the ENAME and SAL columns.
--
--    declare
--        l_filters     apex_exec.t_filters;
--        l_context     apex_exec.t_context;
--    begin
--        apex_exec.add_filter(
--            p_filters     => l_filters,
--            p_filter_type => apex_exec.c_filter_eq,
--            p_column_name => 'ENAME',
--            p_value       => 'KING' );

--        apex_exec.add_filter(
--            p_filters     => l_filters,
--            p_filter_type => apex_exec.c_filter_gt,
--            p_column_name => 'SAL',
--            p_value       => 2000 );
--
--        l_context := apex_exec.open_rest_source_query(
--            p_static_id        => '{REST Data Source static ID}',
--            p_filters          => l_filters
--            p_max_rows         => 1000 );
--
--            while apex_exec.next_row( l_context ) loop
--               -- process rows here ...
--            end loop;
--
--        apex_exec.close( l_context );
--    exception
--        when others then
--            apex_exec.close( l_context );
--            raise;
--    end;
--==============================================================================
procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_value             in            varchar2,
    p_null_result       in            boolean     default false,
    p_is_case_sensitive in            boolean     default true,
    p_data_type         in            t_data_type default c_data_type_varchar2 );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_from_value        in            varchar2,
    p_to_value          in            varchar2,
    p_null_result       in            boolean default false,
    p_is_case_sensitive in            boolean default true );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_values            in            wwv_flow_t_varchar2,
    p_buckets           in            t_filter_buckets default c_empty_filter_buckets,
    p_null_result       in            boolean          default false,
    p_is_case_sensitive in            boolean          default true );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_value             in            number,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_from_value        in            number,
    p_to_value          in            number,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_values            in            wwv_flow_t_number,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_value             in            date,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_from_value        in            date,
    p_to_value          in            date,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_value             in            timestamp,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_from_value        in            timestamp,
    p_to_value          in            timestamp,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_value             in            timestamp with time zone,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_from_value        in            timestamp with time zone,
    p_to_value          in            timestamp with time zone,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_value             in            timestamp with local time zone,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_from_value        in            timestamp with local time zone,
    p_to_value          in            timestamp with local time zone,
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    p_interval          in            pls_integer,
    p_interval_type     in            t_filter_interval_type,
    p_null_result       in            boolean     default false,
    p_data_type         in            t_data_type default c_data_type_date );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_search_columns    in            t_columns,
    p_is_case_sensitive in            boolean           default false,
    p_value             in            varchar2,
    p_search_operator   in            t_search_operator default c_search_contains_instr,
    p_tokenize          in            boolean           default null );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_sql_expression    in            varchar2 );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    --
    p_value             in            varchar2,
    p_data_type         in            t_data_type,
    p_format_mask       in            varchar2,
    --
    p_null_result       in            boolean  default false );

procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            t_column_name,
    --
    p_from_value        in            varchar2,
    p_to_value          in            varchar2,
    p_data_type         in            t_data_type,
    p_format_mask       in            varchar2,
    --
    p_null_result       in            boolean default false );

procedure add_filter (
    p_filters             in out nocopy t_filters,
    p_text_column_name    in            varchar2,
    p_text_query_function in            varchar2,
    p_value               in            varchar2 );

procedure add_filter (
    p_filters             in out nocopy t_filters,
    p_search_index_owner  in            varchar2,
    p_search_index_table  in            varchar2,
    p_text_column_name    in            varchar2,
    p_text_query_function in            varchar2,
    p_value               in            varchar2 );

$IF wwv_flow_db_version.c_has_locator $THEN
procedure add_filter (
    p_filters           in out nocopy t_filters,
    p_filter_type       in            t_filter_type,
    p_column_name       in            varchar2,
    p_value             in            mdsys.sdo_geometry );
$END

$IF wwv_flow_db_version.c_has_vector_type $THEN
procedure add_filter (
    p_filters             in out nocopy t_filters,
    p_vector_column_name  in            varchar2,
    --
    p_vector_search_type  in            t_vector_search_type   default c_vector_search_exact,
    p_distance_metric     in            t_vector_distance_type default c_vector_distance_euclidean,
    --
    -- only for p_vector_search_type = c_vector_search_approx
    p_target_accuracy     in            number                 default null,
    --
    p_max_results         in            number,
    p_max_dist            in            number                 default null,
    p_search_vector       in            vector );
$END
--==============================================================================
-- Adds an order by expression to the order bys collection.
--
-- Parameters:
-- * p_order_bys:     order by collection
-- * p_column_name:   references a column name or alias of the provided data source.
-- * p_direction:     determines order direction: Use constants c_order_*.
-- * p_order_nulls:   determines how NULL values are sorted. Use constants c_order_nulls_*.
--                    Note: p_order_nulls might not be supported by external REST sources.
--
-- Example:
-- fetch data from a REST source and order results by ENAME ascending.
--
--   declare
--       l_order_bys   apex_exec.t_order_bys;
--       l_context     apex_exec.t_context;
--   begin
--       apex_exec.add_order_by(
--           p_order_bys     => l_order_bys,
--           p_column_name   => 'ENAME',
--           p_direction     => apex_exec.c_order_asc );
--
--       l_context := apex_exec.open_rest_source_query(
--           p_static_id        => '{REST Source static ID}',
--           p_order_bys        => l_order_bys,
--           p_max_rows         => 1000 );
--
--           while apex_exec.next_row( l_context ) loop
--              -- process rows here ...
--           end loop;
--
--       apex_exec.close( l_context );
--   exception
--       when others then
--           apex_exec.close( l_context );
--           raise;
--   end;
--==============================================================================
procedure add_order_by (
    p_order_bys         in out nocopy t_order_bys,
    p_position          in            pls_integer,
    p_direction         in            t_order_direction default c_order_asc,
    p_order_nulls       in            t_order_nulls     default null );

procedure add_order_by (
    p_order_bys         in out nocopy t_order_bys,
    p_column_name       in            t_column_name,
    p_direction         in            t_order_direction default c_order_asc,
    p_order_nulls       in            t_order_nulls     default null );

--==============================================================================
-- enquote a string literal and escape contained quotes. This function
-- works for all database types supported by APEX over REST Enabled SQL.
--
-- Parameters:
-- * p_str:           string literal to enquote
-- * p_for_database:  target database to enquote for. If omitted, the
--                    function will enquote for the target database of
--                    the currently executed region.
--
-- Returns:
-- The enquoted string literal.
--
-- Example:
-- declare
--     l_enquoted_literal varchar2(32767);
-- begin
--     l_enquoted_literal := apex_exec.enquote_literal(
--                               p_str          => q'#O'Neil \n#',
--                               p_for_database => c_database_oracle );
--
--     -- returns: 'O''Neil \n'
--
--     l_enquoted_literal := apex_exec.enquote_literal(
--                               p_str          => q'#O'Neil \n#',
--                               p_for_database => c_database_mysql );
--
--     -- returns: 'O''Neil \\n'
-- end;
--==============================================================================
function enquote_literal(
    p_str               in varchar2,
    p_for_database      in t_database_type default null )
    return varchar2;

--==============================================================================
-- enquote a database object name and (is applicable) escape contained quotes.
-- This function works for all database types supported by APEX over REST
-- Enabled SQL.
--
-- Parameters:
-- * p_str:           object name to enquote
-- * p_for_database:  target database to enquote for. If omitted, the
--                    function will enquote for the target database of
--                    the currently executed region.
--
-- Returns:
-- The enquoted object name
--
-- Example:
-- declare
--     l_enquoted_literal varchar2(32767);
-- begin
--     l_enquoted_literal := apex_exec.enquote_name(
--                               p_str          => q'emp',
--                               p_for_database => c_database_oracle );
--
--     -- returns: "emp"
--
--     l_enquoted_literal := apex_exec.enquote_name(
--                               p_str          => q'emp#',
--                               p_for_database => c_database_mysql );
--
--     -- returns: `emp`
-- end;
--==============================================================================
function enquote_name(
    p_str               in varchar2,
    p_for_database      in t_database_type default null )
    return varchar2;

--##############################################################################
-- Internal Only procedures
--##############################################################################

--==============================================================================
-- Adds an order by expression to the order bys collection. Allows to pass in
-- an ORDER BY expression as well.
--
-- Internal:
--==============================================================================
procedure add_order_by (
    p_order_bys         in out nocopy t_order_bys,
    p_column_name       in            t_column_name,
    p_lov               in            t_lov,
    p_direction         in            t_order_direction default c_order_asc,
    p_order_nulls       in            t_order_nulls     default null );

--==============================================================================
-- converts the t_data_type constant into the VARCHAR2 representation used by the
-- Plug-In infrastructure.
--
-- Internal:
--==============================================================================
function get_data_type_vc2_plugin(
    p_datatype_num in wwv_flow_exec_api.t_data_type ) return varchar2;

--==============================================================================
-- Returns the 'real' owner and name of a database object/synonym.
--
-- Internal:
--==============================================================================
procedure resolve_local_synonym (
    p_object_name in     varchar2,
    p_type        in     t_resolve_synonym_type default c_resolve_synonym_type_table,
    p_owner          out varchar2,
    p_name           out varchar2 );

--==============================================================================
-- Internal:
--==============================================================================
function get_array (
    p_context    in t_context,
    p_column_idx in pls_integer ) return sys.json_array_t;

function get_array (
    p_context    in t_context,
    p_column_name in varchar2 ) return sys.json_array_t;

end wwv_flow_exec_api;
/
show errors
