set define '^' verify off
prompt ...wwv_flow_exec.sql
create or replace package wwv_flow_exec as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2018, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_exec.sql
--
--    DESCRIPTION
--      This package is used to select, insert, update and delete rows from
--      different data locations (local-, remote database and web services).
--      In addition it can also be used to execute PL/SQL code on a local and
--      remote database.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      03/17/2017 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

subtype t_plugin_context         is pls_integer range 1..2;

--------------------------------------------------------------------------------
-- Column values
type t_anydata_table is table of sys.anydata index by pls_integer;

type t_array_table is table of sys.json_array_t index by pls_integer;

$IF wwv_flow_db_version.c_has_locator $THEN
type t_sdo_geometry_table is table of mdsys.sdo_geometry index by pls_integer;
$END

----------------------------------------------------------------------------------
type t_column_values is record (
    -- this flag is to intentionally suppress actual DML for that column. We will use this for BLOB support. When
    -- the end user does not upload a file, we typically don't want the table to be updated with NULL. We also cannot
    -- use the QUERY_ONLY flag, since that column actually is not "query only". So we can set this flag to "true".
    force_no_dml         boolean default false,
    --
    -- based on whether MAX_STRING_SIZE is EXTENDED or not USE DBMS_SQL.VARCHAR2A or VARCHAR2_TABLE
$IF wwv_flow_db_version.c_has_extended_string_size $THEN
    varchar2_values      sys.dbms_sql.varchar2a,
$ELSE
    varchar2_values      sys.dbms_sql.varchar2_table,
$END
    number_values        sys.dbms_sql.number_table,
    binary_number_values sys.dbms_sql.binary_double_table,
    date_values          sys.dbms_sql.date_table,
    timestamp_values     sys.dbms_sql.timestamp_table,
    timestamp_tz_values  sys.dbms_sql.timestamp_with_time_zone_table,
    timestamp_ltz_values sys.dbms_sql.timestamp_with_ltz_table,
    interval_y2m_values  sys.dbms_sql.interval_year_to_month_table,
    interval_d2s_values  sys.dbms_sql.interval_day_to_second_table,
    blob_values          sys.dbms_sql.blob_table,
    bfile_values         sys.dbms_sql.bfile_table,
    clob_values          sys.dbms_sql.clob_table,
$IF wwv_flow_db_version.c_has_locator $THEN
    sdo_geometry_values  t_sdo_geometry_table,
$END
    ----------------------------------------------------------------------------------
    -- nested objects for DML requests will go into this member.
    --
    array_values         t_array_table,
    anydata_values       t_anydata_table );

type t_columns_values is table of t_column_values index by pls_integer;

type t_row_status is record(
    operation wwv_flow_exec_api.t_dml_operation,
    checksum  varchar2(32767),
    sqlcode   pls_integer,
    sqlerrm   varchar2(32767) );

type t_row_statuses is table of t_row_status index by binary_integer;

--------------------------------------------------------------------------------
-- query describe result
type t_describe_result is record (
    query_columns               wwv_flow_exec_api.t_columns,
    generated_sql_text          wwv_flow_global.vc_arr2,
    has_order_by_clause         boolean,
    varchar_columns_are_generic boolean default false,
    --
    has_array_columns           boolean,
    rest_sync_for_arrays        wwv_flow_t_number,
    --
    database_type               wwv_flow_exec_api.t_database_type default wwv_flow_exec_api.c_database_oracle,
    --
    error_message               varchar2( 32767 ));

subtype t_column_count is pls_integer range 0..1000;

--------------------------------------------------------------------------------
-- SQL Statement information - SQL, Remote Server, Binds, Offset and Limit
--------------------------------------------------------------------------------
type t_sql_statement is record (
    sql_text                     varchar2(32767),
    sql_text_array               wwv_flow_global.vc_arr2,
    code_language                wwv_flow_code_exec.t_language,
    optimizer_hint               varchar2(32767),
    --
    remote_server_id             number,
    remote_sql_stmt_id           pls_integer,
    --
    total_row_count              boolean                          default false,
    total_row_count_limit        number,
    total_row_count_column_idx   pls_integer,
    --
    auto_bind_items              boolean,
    page_items_to_sessionstate   boolean                          default false,
    --
    force_single_row_fetch       boolean                          default false,
    -- DML specific
    dml_lock_rows                wwv_flow_exec_api.t_lock_rows,
    dml_continue_on_error        boolean                          default false,
    dml_plsql_code               varchar2(32767),
    dml_table_view_owner         wwv_flow_global.t_dbms_id,
    dml_table_view_name          wwv_flow_global.t_dbms_id,
    dml_plsql_locking_code       varchar2(32767),
    -- pagination
    first_row                    number,
    max_rows                     number,
    detect_more_rows             boolean                          default false,
    use_sql_pagination           boolean                          default true,
    -- group by
    control_break_column_idx     pls_integer );

--------------------------------------------------------------------------------
-- Web Source specific
--------------------------------------------------------------------------------

-- information about component config for web source OUT parameters.

subtype t_web_source_out_param_type is pls_integer range 1..3;

type t_web_source_out_param is record(
    name                         varchar2(255),
    value_type                   t_web_source_out_param_type,
    ignore_output                boolean,
    value                        varchar2(255) );

type t_web_source_out_params is table of t_web_source_out_param index by pls_integer;

--
-- information about web source module / operation
--
type t_web_source is record (
    module_id                    number,
    array_column_id              number,
    operation_id                 number,
    --
    -- fetch rows parameters
    web_src_parameters           wwv_flow_exec_api.t_parameters,
    web_src_out_parameters       t_web_source_out_params,
    --
    fetch_row_parameters         wwv_flow_exec_api.t_parameters,
    insert_row_parameters        wwv_flow_exec_api.t_parameters,
    update_row_parameters        wwv_flow_exec_api.t_parameters,
    delete_row_parameters        wwv_flow_exec_api.t_parameters,
    --
    fetch_row_out_parameters     t_web_source_out_params,
    insert_row_out_parameters    t_web_source_out_params,
    update_row_out_parameters    t_web_source_out_params,
    delete_row_out_parameters    t_web_source_out_params,
    --
    filter_expr                  varchar2(32767),
    order_by_expr                varchar2(32767),
    component_sql                varchar2(32767),
    --
    post_processing_type         wwv_flow_exec_api.t_post_processing,
    post_processing_language     wwv_flow_code_exec.t_language,
    post_processing_where        varchar2(32767),
    post_processing_order_by     varchar2(32767),
    post_processing_sql          varchar2(32767),
    --
    filters                      wwv_flow_exec_api.t_filters,
    order_bys                    wwv_flow_exec_api.t_order_bys,
    aggregation                  wwv_flow_exec_api.t_aggregation,
    control_break                wwv_flow_exec_api.t_control_break,
    primary_keys                 t_columns_values,
    query_columns                wwv_flow_exec_api.t_columns,
    select_all_columns           boolean                          default false,
    --
    mixed_filter                 boolean                          default false,
    --
    first_row                    number,
    max_rows                     number,
    --
    request_context_id           varchar2(32767) );

--
-- information about document sources
--
type t_doc_source is record (
    source_id                    number,
    array_column_id              number,
    component_sql                varchar2(32767),
    --
    post_processing_type         wwv_flow_exec_api.t_post_processing,
    post_processing_language     wwv_flow_code_exec.t_language,
    post_processing_where        varchar2(32767),
    post_processing_order_by     varchar2(32767),
    post_processing_sql          varchar2(32767),
    --
    filters                      wwv_flow_exec_api.t_filters,
    order_bys                    wwv_flow_exec_api.t_order_bys,
    aggregation                  wwv_flow_exec_api.t_aggregation,
    primary_keys                 t_columns_values,
    query_columns                wwv_flow_exec_api.t_columns,
    select_all_columns           boolean                          default false );

--------------------------------------------------------------------------------
-- Query Result information (description, data and status information)
--------------------------------------------------------------------------------
type t_query_result is record (
    fetched_row_count            number,
    buffered_row_count           pls_integer,
    current_array_idx            pls_integer,
    -- next_row() increases this one; then <buffered_row_count> is reached, next fetch is done.
    current_row_idx              pls_integer,
    returned_row_count           number                           default 0,
    rows_to_ignore               number                           default 0,
    --
    total_row_count              number,
    has_more                     boolean,
    bulk_fetch                   boolean,
    has_more_rows                boolean,
    is_group_end                 boolean,
    --
    sqlcode                      pls_integer,
    error_message                varchar2(32767),
    --
    query_columns                wwv_flow_exec_api.t_columns,
    columns_values               t_columns_values );

--------------------------------------------------------------------------------
-- DML Result information (description, data and status information)
--------------------------------------------------------------------------------
type t_sql_nonquery_result is record (
    sqlcode                      pls_integer,
    error_message                varchar2(32767),
    affected_row_count           pls_integer,
    out_parameters               wwv_flow_exec_api.t_parameters );

--------------------------------------------------------------------------------
-- Web Source result
type t_web_source_response is record(
    has_more                     boolean,
    fetched_row_count            number,
    out_parameters               wwv_flow_exec_api.t_parameters );

--------------------------------------------------------------------------------
type t_nested_values_json is record (
    used_array_columns        t_array_table,
    used_array_indexes        wwv_flow_global.n_arr,
    --
    current_array_column      pls_integer,
    current_array_index       pls_integer );

--------------------------------------------------------------------------------
-- Context types ...
subtype t_context_type is pls_integer range 1..8;

--------------------------------------------------------------------------------
-- the "context" object
--
type t_context is record (
    context_type                 t_context_type,
    location                     wwv_flow_exec_api.t_location,
    executing_component          wwv_flow.t_component,
    cursor_id                    integer,
    dynamic_execution_group      boolean                                  default false,
    set_session_state            boolean,
    -- Bind variables
    in_parameters                wwv_flow_exec_api.t_parameters,
    sql_statement                t_sql_statement,
    web_source                   t_web_source,
    doc_source                   t_doc_source,
    query_result                 t_query_result,
    sql_nonquery_result          t_sql_nonquery_result,
    web_source_response          t_web_source_response,
    --
    dml_allowed_operations_attr  varchar2(255),
    dml_columns                  wwv_flow_exec_api.t_columns,
    dml_columns_values           t_columns_values,
    dml_current_row              pls_integer,
    dml_row_statuses             t_row_statuses,
    dml_lost_update_detection    wwv_flow_exec_api.t_lost_update_detection,
    --
    nested_values_json           t_nested_values_json,
    --
    supports_binary_number       boolean);

--------------------------------------------------------------------------------
-- plug-in data source meta data
--
type t_query_meta_data is record (
    location                  wwv_flow_exec_api.t_location,
    remote_server_id          number,
    web_src_module_id         number,
    array_column_id           number,
    web_src_parameters        wwv_flow_exec_api.t_parameters,
    web_src_out_parameters    t_web_source_out_params,
    document_source_id        number,
    --
    query_type                wwv_flow_exec_api.t_query_type,
    owner                     varchar2( 32767 ),
    table_name                varchar2( 32767 ),
    sql_query                 varchar2( 32767 ),
    function_body             varchar2( 32767 ),
    function_body_language    wwv_flow_code_exec.t_language,
    where_clause              varchar2( 32767 ),
    match_clause              varchar2( 32767 ),
    columns_clause            varchar2( 32767 ),
    order_by_clause           varchar2( 32767 ),
    source_post_processing    varchar2( 32767 ),
    include_rowid_column      boolean,
    optimizer_hint            varchar2( 32767 ),
    cache                     varchar2( 32767 ),
    cache_invalidation        varchar2( 32767 ),
    cache_comp_type           pls_integer,
    cache_comp_id             number,
    --
    use_local_sync_table      boolean,
    --
    external_filter_expr      varchar2( 32767 ),
    external_order_by_expr    varchar2( 32767 ),
    --
    region_filters            wwv_flow_exec_api.t_filters );

--------------------------------------------------------------------------------
-- web source DML meta data
--
type t_web_source_dml_meta_data is record (
    fetch_row_in_params                 wwv_flow_exec_api.t_parameters,
    fetch_row_out_params                t_web_source_out_params,
    --
    insert_row_in_params                wwv_flow_exec_api.t_parameters,
    insert_row_out_params               t_web_source_out_params,
    --
    update_row_in_params                wwv_flow_exec_api.t_parameters,
    update_row_out_params               t_web_source_out_params,
    --
    delete_row_in_params                wwv_flow_exec_api.t_parameters,
    delete_row_out_params               t_web_source_out_params );

--------------------------------------------------------------------------------
-- Vector Search mappings
--
type c_vector_distance_table is table of varchar2( 17 ) index by pls_integer;

c_vector_distances constant c_vector_distance_table :=
    c_vector_distance_table ( 1 => 'COSINE',
                              2 => 'DOT',
                              3 => 'EUCLIDEAN',
                              4 => 'EUCLIDEAN_SQUARED',
                              5 => 'HAMMING',
                              6 => 'MANHATTAN' );

--==============================================================================
-- Constants
--==============================================================================
c_empty_context              t_context;

c_context_query              constant t_context_type := 1;
c_context_dml_fetch_row      constant t_context_type := 2;
c_context_dml_insert         constant t_context_type := 3;
c_context_dml_update         constant t_context_type := 4;
c_context_dml_delete         constant t_context_type := 5;
c_context_plsql              constant t_context_type := 6;
c_context_dml                constant t_context_type := 7;
c_context_values             constant t_context_type := 8;

c_total_row_count_column     constant varchar2(20)    := 'APEX$TOTAL_ROW_COUNT';
c_control_break_column       constant varchar2(15)    := 'APEX$CTRL_BREAK';
c_rowid_alias                constant varchar2(16)    := 'APEX$ROWID_ALIAS';

c_empty_columns_values                t_columns_values;
c_empty_query_meta_data               t_query_meta_data;
c_empty_web_source_out_params         t_web_source_out_params;

c_web_source_out_param_item  constant t_web_source_out_param_type := 1;
c_web_source_out_param_coll  constant t_web_source_out_param_type := 2;
c_web_source_out_param_pref  constant t_web_source_out_param_type := 3;

c_orderby_type_item_vc2      constant varchar2(4) := 'ITEM';
c_orderby_type_static_vc2    constant varchar2(6) := 'STATIC';

c_orderby_expr_path_itemname constant varchar2(8) := 'itemName';
c_orderby_expr_path_orderbys constant varchar2(8) := 'orderBys';

c_empty_nested_values_json            t_nested_values_json;

c_json_timestamp_tz          constant varchar2(22) := 'yyyymmddhh24missff9tzr';
c_json_timestamp_ltz         constant varchar2(19) := 'yyyymmddhh24missff9';

c_bind_prefix_val            constant varchar2(8)  := 'APEX$VAL';
c_bind_prefix_pk             constant varchar2(7)  := 'APEX$PK';
c_bind_prefix_ret            constant varchar2(8)  := 'APEX$RET';

--==============================================================================
-- Globals
--==============================================================================
type t_context_table is table of t_context index by wwv_flow_exec_api.t_context;
g_context_table t_context_table;

--==============================================================================
-- Maintain the global hashtable with EXEC_API context objects.
--==============================================================================
function create_api_context
  return wwv_flow_exec_api.t_context;

function create_api_context(
   p_context in t_context )
   return wwv_flow_exec_api.t_context;

procedure remove_api_context (
    p_context in wwv_flow_exec_api.t_context );

--==============================================================================
-- convert to NUMBER value using canonical format
--==============================================================================
function get_canonical_number (
    p_value in varchar2 ) return number;

--==============================================================================
-- get the canonical format mask for a given data type
--==============================================================================
function get_canonical_format_mask (
    p_data_type in wwv_flow_exec_api.t_data_type,
    p_is_filter in boolean  default false ) return varchar2;

--==============================================================================
-- Costructor for a t_query_meta_data record type
--==============================================================================
function query_meta_data(
    p_location                  wwv_flow_exec_api.t_location,
    p_remote_server_id          number,
    p_web_src_module_id         number,
    p_array_column_id           number,
    p_web_src_parameters        wwv_flow_exec_api.t_parameters,
    p_web_src_out_parameters    t_web_source_out_params,
    p_document_source_id        number,
    p_query_type                wwv_flow_exec_api.t_query_type,
    p_owner                     varchar2,
    p_table_name                varchar2,
    p_sql_query                 varchar2,
    p_function_body             varchar2,
    p_function_body_language    wwv_flow_code_exec.t_language,
    p_where_clause              varchar2,
    p_match_clause              varchar2,
    p_columns_clause            varchar2,
    p_order_by_type             varchar2,
    p_order_by_clause           varchar2,
    p_source_post_processing    varchar2,
    p_include_rowid_column      boolean,
    p_optimizer_hint            varchar2,
    p_cache                     varchar2,
    p_cache_invalidation        varchar2,
    p_cache_comp_type           number,
    p_cache_comp_id             number,
    p_use_local_sync_table      boolean,
    p_external_filter_expr      varchar2,
    p_external_order_by_type    varchar2,
    p_external_order_by_expr    varchar2,
    p_region_filters            wwv_flow_exec_api.t_filters )
    return t_query_meta_data;

--==============================================================================
-- Returns a query context type for the current region source/item lov/process source.
--==============================================================================
procedure open_query_context (
    p_context                     in out nocopy t_context,
    p_plugin_context              in t_query_meta_data                  default c_empty_query_meta_data,
    p_columns                     in wwv_flow_exec_api.t_columns        default wwv_flow_exec_api.c_empty_columns,
    p_select_all_query_cols       in boolean                            default false,
    p_use_generic_columns         in boolean                            default false,
    p_generic_column_cnt          in pls_integer                        default 50,
    p_first_row                   in number                             default null,
    p_max_rows                    in number                             default null,
    p_detect_more_rows            in boolean                            default false,
    --
    p_return_distinct_rows        in boolean                            default false,
    p_flashback_minutes           in pls_integer                        default null,
    --
    p_component_sql               in varchar2                           default null,
    --
    p_total_row_count             in boolean                            default false,
    p_total_row_count_limit       in number                             default null,
    --
    p_force_single_row_fetch      in boolean                            default false,
    --
    p_filters                     in wwv_flow_exec_api.t_filters        default wwv_flow_exec_api.c_empty_filters,
    p_order_bys                   in wwv_flow_exec_api.t_order_bys      default wwv_flow_exec_api.c_empty_order_bys,
    p_aggregation                 in wwv_flow_exec_api.t_aggregation    default wwv_flow_exec_api.c_empty_aggregation,
    p_control_break               in wwv_flow_exec_api.t_control_break  default wwv_flow_exec_api.c_empty_control_break,
    p_primary_keys                in t_columns_values                   default c_empty_columns_values,
    --
    p_use_region_filters_orderbys in boolean                            default true,
    --
    p_sql_parameters              in wwv_flow_exec_api.t_parameters     default wwv_flow_exec_api.c_empty_parameters,
    --
    p_set_session_state           in boolean                            default false,
    p_page_items_to_sessionstate  in boolean                            default false,
    --
    p_supports_binary_number      in boolean                            default false,
    --
    p_executing_component         in wwv_flow.t_component               default wwv_flow.get_component,
    -- legacy
    p_do_substitutions            in boolean                            default true,
    -- Should only be used by INTERNAL apps to execute the statement with a schema of the
    -- current workspace, instead of using APEX_xxxxxx
    p_parse_as_schema_override    in varchar2                           default null );

--==============================================================================
-- Returns a query context based on the input parameters
--==============================================================================
procedure open_query_context (
    p_context                    in out nocopy t_context,
    p_location                   in            wwv_flow_exec_api.t_location,
    p_remote_server_id           in            number                              default null,
    p_web_src_module_id          in            number                              default null,
    p_array_column_id            in            number                              default null,
    p_document_source_id         in            number                              default null,
    --
    p_query_type                 in            wwv_flow_exec_api.t_query_type,
    -- Used by wwv_flow_exec_api.t_query_type_table
    p_owner                      in            varchar2                            default null,
    p_table_name                 in            varchar2                            default null,
    -- Used by wwv_flow_exec_api.t_query_type_sql_query
    p_sql_query                  in            varchar2                            default null,
    -- Used by wwv_flow_exec_api.c_query_type_func_return_sql
    p_function_body              in            varchar2                            default null,
    p_function_body_language     in            wwv_flow_code_exec.t_language       default null,
    -- Used by wwv_flow_exec_api.t_query_type_table
    p_where_clause               in            varchar2                            default null,
    p_match_clause               in            varchar2                            default null,
    p_columns_clause             in            varchar2                            default null,
    p_include_rowid_column       in            boolean                             default null,
    -- Used by wwv_flow_exec_api.t_query_type_sql_query, wwv_flow_exec_api.c_query_type_func_return_sql and if p_where_clause is set
    p_order_by_clause            in            varchar2                            default null,
    p_source_post_processing     in            wwv_flow_exec_api.t_post_processing default null,
    -- Used by wwv_flow_exec_api.t_query_type_table, wwv_flow_exec_api.t_query_type_sql_query and wwv_flow_exec_api.c_query_type_func_return_sql
    p_optimizer_hint             in            varchar2                            default null,
    -- Used by p_where_clause, p_order_by_clause, wwv_flow_exec_api.t_query_type_sql_query and wwv_flow_exec_api.c_query_type_func_return_sql
    p_use_generic_columns        in            boolean                             default false,
    p_generic_column_cnt         in            pls_integer                         default 50,
    --
    p_return_distinct_rows       in            boolean                             default false,
    p_flashback_minutes          in            pls_integer                         default null,
    --
    p_component_sql              in            varchar2                            default null,
    --
    p_auto_bind_items            in            boolean                             default true,
    p_sql_parameters             in            wwv_flow_exec_api.t_parameters      default wwv_flow_exec_api.c_empty_parameters,
    --
    p_parameters                 in            wwv_flow_exec_api.t_parameters      default wwv_flow_exec_api.c_empty_parameters,
    -- Used by wwv_flow_exec_api.t_location_remote_db and wwv_flow_exec_api.t_location_web_source
    p_cache                      in            varchar2                            default null,
    p_cache_invalidation         in            varchar2                            default null,
    p_cache_comp_id              in            number                              default null,
    p_cache_comp_type            in            number                              default null,
    --
    p_use_local_sync_table       in            boolean                             default false,
    --
    p_external_filter_expr       in            varchar2                            default null,
    p_external_order_by_expr     in            varchar2                            default null,
    -- Used by all location and query types
    p_columns                    in            wwv_flow_exec_api.t_columns         default wwv_flow_exec_api.c_empty_columns,
    p_select_all_query_cols      in            boolean                             default false,
    --
    p_total_row_count            in            boolean                             default false,
    p_total_row_count_limit      in            number                              default null,
    --
    p_force_single_row_fetch     in            boolean                             default false,
    --
    p_first_row                  in            number                              default null,
    p_max_rows                   in            number                              default null,
    p_detect_more_rows           in            boolean                             default false,
    p_filters                    in            wwv_flow_exec_api.t_filters         default wwv_flow_exec_api.c_empty_filters,
    p_order_bys                  in            wwv_flow_exec_api.t_order_bys       default wwv_flow_exec_api.c_empty_order_bys,
    p_aggregation                in            wwv_flow_exec_api.t_aggregation     default wwv_flow_exec_api.c_empty_aggregation,
    p_control_break              in            wwv_flow_exec_api.t_control_break   default wwv_flow_exec_api.c_empty_control_break,
    p_primary_keys               in            t_columns_values                    default c_empty_columns_values,
    --
    p_set_session_state          in            boolean                             default false,
    -- legacy
    -- IR writes page items transparently to session state; need to do here as well
    p_page_items_to_sessionstate in            boolean                             default false,
    --
    p_supports_binary_number     in            boolean                             default false,
    --
    p_executing_component        in            wwv_flow.t_component                default wwv_flow.get_component,
    --
    p_do_substitutions           in            boolean                             default true,
    -- Should only be used by INTERNAL apps to execute the statement with a schema of the
    -- current workspace, instead of using APEX_xxxxxx
    p_parse_as_schema_override   in            varchar2                            default null );

--==============================================================================
-- Returns the result column count
--==============================================================================
function get_column_count (
    p_context in t_context )
    return pls_integer;

--==============================================================================
-- Returns an array with column metadata
--==============================================================================
function get_columns (
    p_context in t_context )
    return wwv_flow_exec_api.t_columns;

--==============================================================================
-- Returns the total row count of a query context, if available
--==============================================================================
function get_row_count(
    p_context in t_context )
    return number;

--==============================================================================
-- Returns the amount of values for a given column in the t_columns_values array
--==============================================================================
function get_value_count(
    p_columns_values in t_columns_values,
    p_columns        in wwv_flow_exec_api.t_columns,
    p_column_idx     in pls_integer ) return number;
--
--
--==============================================================================
-- returns the value from the t_columns_values instance for a given column and row
--==============================================================================
function to_value(
    p_columns        in wwv_flow_exec_api.t_columns,
    p_columns_values in t_columns_values,
    p_row_idx        in number,
    p_column_idx     in pls_integer )
    return wwv_flow_exec_api.t_value;

--==============================================================================
-- Returns whether the query would return more data, beyond the pagination
-- boundaries. Requires p_detect_more_rows to be passed in as TRUE when
-- the query context is opened. Otherwise, NULL is returned.
--
-- Note that this function only returns a value after the NEXT_ROW loop
-- has been finished. Only then we can know that there is more data
-- to fetch than we actually requested.
--==============================================================================
function has_more_rows(
    p_context in t_context )
    return boolean;

--==============================================================================
function has_more_child_rows(
    p_context in t_context )
    return boolean;

--==============================================================================
-- Returns whether an end of group was found.
--==============================================================================
function is_group_end(
    p_context in t_context )
    return boolean;

--==============================================================================
-- Returns the array index for a given column alias
--==============================================================================
function get_column_idx (
    p_columns           in wwv_flow_exec_api.t_columns,
    p_attribute_label   in varchar2,
    p_column_name       in varchar2,
    p_is_required       in boolean,
    p_parent_path       in varchar2 default null,
    p_data_type         in varchar2 default wwv_flow_exec_api.c_data_type_varchar2 )
    return pls_integer;

--==============================================================================
function get_column_idx (
    p_context           in t_context,
    p_attribute_label   in varchar2,
    p_column_name       in varchar2,
    p_is_required       in boolean,
    p_parent_path       in varchar2 default null,
    p_data_type         in varchar2 default wwv_flow_exec_api.c_data_type_varchar2 )
    return pls_integer;

--==============================================================================
-- Re-executes the SQL Statement assigned to the given context. Useful when a SQL
-- is to be executed repeatedly with different bind values for each execute.
--==============================================================================
procedure re_execute_query (
    p_context    in out nocopy t_context,
    p_parameters in            wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters );

--==============================================================================
-- Row buffering functions
--==============================================================================

--==============================================================================
-- prepares a "values" context to store rows being saved for later use. During
-- the next_row() loop this can be used to store row values. At a later point
-- (even after the next_row() loop is finished), the saved rows can be retrieved
-- and processed.
--
-- PARAMETERS:
-- * p_query_context     query context from which rows are to be saved
-- * p_values_context    context object to hold the stored rows
--==============================================================================
procedure prepare_saved_values_context(
    p_query_context   in            t_context,
    p_values_context  in out nocopy t_context );

--==============================================================================
-- save a row from the query context to the values context.
--
-- Implementation restriction:
--
-- Array Columns are copied to the Values Context as-is, i.e. the JSON is copied
-- as returned by the query context. It will not be possible to traverse these
-- array columns using APEX_EXEC.ENTER_CHILD_ROW afterwards, as that would need
-- transformation of the JSON to use column indexes as JSON attribute names.
--
-- PARAMETERS:
-- * p_from_query_context   query context from which rows are to be saved
-- * p_to_values_context    context object to hold the stored rows
-- * p_saved_row_id         ID to reference the saved row later on.
--==============================================================================
procedure save_row(
    p_from_query_context  in            t_context,
    p_to_values_context   in out nocopy t_context,
    p_saved_row_id        in            pls_integer );

--==============================================================================
-- set the active row for a values or DML context. This procedure cannot be
-- used for a query context. After that, column values can be retrieved using
-- the GET_VARCHAR, GET_NUMBER or other functions.
--
-- PARAMETERS:
-- * p_context           DML or values context containing row data
-- * p_row_id            ID to set the "current row" pointer of the value context to.
--==============================================================================
procedure set_active_row(
    p_context         in out nocopy wwv_flow_exec.t_context,
    p_row_id          in            pls_integer );

--==============================================================================
-- reset the active row pointer to the slot before the first row in a values or
-- DML context. This procedure cannot be used for a query context. After that,
-- column values can be retrieved using the GET_VARCHAR, GET_NUMBER or other
-- functions.
--
-- PARAMETERS:
-- * p_context           DML or values context containing row data
--==============================================================================
procedure reset_active_row_pointer(
    p_context         in out nocopy wwv_flow_exec.t_context);

--==============================================================================
-- Data fetching functions.
--==============================================================================

--==============================================================================
-- This function advances one row in the result data. When the last row in the
-- buffer has been reached, the next bulk fetch is executed. For remote SQL,
-- when the last row in the buffer has been reached, the next result page
-- is fetched from the remote server.
--==============================================================================
function next_row (
    p_context in out nocopy t_context )
    return boolean;

--==============================================================================
function next_child_row(
    p_context in out nocopy t_context )
    return boolean;

--==============================================================================
procedure add_child_row(
    p_context               in out nocopy t_context,
    p_column_name           in            varchar2                          default null,
    p_column_idx            in            pls_integer                       default null,
    p_operation             in            wwv_flow_exec_api.t_dml_operation default null );

--==============================================================================
procedure enter_child_array(
    p_context               in out nocopy t_context,
    p_current_row_idx       in            pls_integer                       default 0,
    p_column_name           in            varchar2                          default null,
    p_column_idx            in            pls_integer                       default null );


--==============================================================================
procedure leave_child_array(
    p_context               in out nocopy t_context );

--==============================================================================
function get_row_version_checksum(
    p_context        in t_context ) return varchar2 ;

--==============================================================================
function get_data_type (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return wwv_flow_exec_api.t_data_type;

--==============================================================================
function get_varchar2 (
    p_columns_values in t_columns_values,
    p_columns        in wwv_flow_exec_api.t_columns,
    p_column_idx     in pls_integer,
    p_row_idx        in pls_integer,
    p_raise_error    in boolean     default true,
    p_emit_warnings  in boolean     default true,
    p_format_mask    in varchar2    default null )
    return varchar2;

function get_varchar2 (
    p_context       in t_context,
    p_column_idx    in pls_integer,
    p_raise_error   in boolean     default true,
    p_emit_warnings in boolean     default true,
    p_format_mask   in varchar2    default null )
    return varchar2;

function get_number (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return number;

function get_binary_number (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return binary_double;

function get_date (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return date;

function get_timestamp (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return timestamp;

function get_timestamp_tz (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return timestamp with time zone;

function get_timestamp_ltz (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return timestamp with local time zone;

function get_blob (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return blob;

function get_bfile (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return bfile;

function get_clob (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return clob;

function get_intervaly2m (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return yminterval_unconstrained;

function get_intervald2s (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return dsinterval_unconstrained;

function get_anydata (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return sys.anydata;

function get_array (
    p_context    in t_context,
    p_column_idx in pls_integer )
    return sys.json_array_t;

$if wwv_flow_db_version.c_has_locator $then
function get_sdo_geometry(
    p_context    in t_context,
    p_column_idx in pls_integer )
    return mdsys.sdo_geometry;

function get_geojson(
    p_context    in t_context,
    p_column_idx in pls_integer )
    return clob;
$end

--==============================================================================
-- copy a "wwv_flow_exec.t_columns_values" value from one columns_values array
-- to another.
--
-- PARAMETERS:
-- * p_columns          column metadata, which is valid for source and target arrays
-- * p_from_col_vals    "columns_values" array to copy the value from
-- * p_to_col_vals      "columns_values" array to copy the value to
-- * p_from_row         row to copy the value from
-- * p_to_row           row to copy the value to
-- * p_from_col         column to copy the value from
-- * p_to_col           column to copy the value to
--==============================================================================
procedure copy_context_value(
    p_columns       in            wwv_flow_exec_api.t_columns,
    p_from_col_vals in            wwv_flow_exec.t_columns_values,
    p_to_col_vals   in out nocopy wwv_flow_exec.t_columns_values,
    p_from_row      in            pls_integer,
    p_to_row        in            pls_integer,
    p_from_col      in            pls_integer,
    p_to_col        in            pls_integer );

--==============================================================================
-- XXX. $$$ Should we call it set_session_state_row or set_row_in_session_state???
--
-- p_context: ...
-- p_row_num: ...
--==============================================================================
procedure set_session_state (
    p_context in t_context );

--==============================================================================
-- XXX. $$$
--==============================================================================
procedure clear_session_state;

--==============================================================================
-- This procedure cleans up an existing open_xyz context.
--==============================================================================
procedure close_context (
    p_context in out nocopy t_context );

--==============================================================================
-- Data processing functions.
--==============================================================================


--==============================================================================
-- Returns a "execute PL/SQL" context type
--==============================================================================
procedure open_process_context(
    p_context                  in out nocopy t_context,
    p_location                 in            wwv_flow_exec_api.t_location,
    --
    p_remote_server_id         in            number                           default null,
    --
    p_web_src_operation_id     in            number                           default null,
    p_parameters               in            wwv_flow_exec_api.t_parameters   default wwv_flow_exec_api.c_empty_parameters,
    p_out_parameters           in            t_web_source_out_params          default c_empty_web_source_out_params,
    --
    p_code                     in            varchar2                         default null,
    p_code_language            in            wwv_flow_code_exec.t_language    default null,
    p_auto_bind_items          in            boolean                          default true,
    p_sql_parameters           in            wwv_flow_exec_api.t_parameters   default wwv_flow_exec_api.c_empty_parameters,
    --
    p_executing_component      in            wwv_flow.t_component             default wwv_flow.get_component,
    --
    p_do_substitutions         in            boolean                          default false,
    p_parse_as_schema_override in            varchar2                         default null );

--==============================================================================
-- Executes PL/SQL code locally or remotely, based on component or plug-in setting
--==============================================================================
procedure open_process_context (
    p_context                  in out nocopy t_context,
    p_code                     in            varchar2,
    p_code_language            in            wwv_flow_code_exec.t_language,
    --
    p_auto_bind_items          in            boolean                        default true,
    p_sql_parameters           in            wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    --
    p_executing_component      in            wwv_flow.t_component           default wwv_flow.get_component,
    --
    p_do_substitutions         in            boolean                        default false,
    p_parse_as_schema_override in            varchar2                       default null );

--==============================================================================
-- prepares a DML context.
--
-- PARAMETERS:
--     p_context                        the context object to prepare
--
--     p_location                       whether this is a local db, remote db or web source module context
--     p_remote_server_id               ID of the REST enabled SQL service for remote DB contexts
--     p_web_src_module_id              ID of the Web Source Module for web source module contexts
--     p_array_column_id                ID of the nested array column to create this DML context for.
--     p_parameters                     Web Source parameters to be passed to the web source module.
--
--     p_query_type                     for SQL contexts: TABLE, SQL Query or PL/SQL function returning SQL Query
--
--     p_owner                          Query Type = TABLE: Table Owner
--     p_table_name                     Query Type = TABLE: Table Name
--     p_where_clause                   Query Type = TABLE: WHERE clause
--
--     p_sql_query                      Query Type = SQL QUERY: SQL Query to execute DML on
--     p_function_body                  Query Type = Function body returning SQL Query to execute DML on
--     p_function_body_language         Query Type = FUNC_BODY: Language of p_function_body
--
--     p_with_check_option              whether to add the WITH CHECK OPTION clause on the SQL Query. This
--                                      prevents rows being inserted or updated which would violate the WHERE clause
--                                      of the DML SQL query,
--     p_optimizer_hint                 Optimizer hints to be added to the most outer DML statement
--
--     p_dml_table_owner                Execute DML on a different table: Table owner
--     p_dml_table_name                 Execute DML on a different table: Table name
--     p_dml_plsql_code                 Execute custom PL/SQL code for each row. The APEX$ROW_STATUS pseudocolumn
--                                      will indicate the DML operation to execute.
--
--     p_lost_update_detection          Type of Lost Update Detection to use.
--                                      * wwv_flow_exec_api.c_lost_update_none:     no lost update detection
--                                      * wwv_flow_exec_api.c_lost_update_implicit: calculate a checksum from the column values
--                                      * wwv_flow_exec_api.c_lost_update_explicit: one of p_context.dml_columns has is_checksum = true
--
--     p_lock_rows                      How to lock rows to secure for the (small) timeframe between checksum calculation and "real" DML
--                                      * wwv_flow_exec_api.c_lock_rows_none:      no row locking
--                                      * wwv_flow_exec_api.c_lock_rows_automatic: execute a SELECT ... FOR UPDATE
--                                      * wwv_flow_exec_api.c_lock_rows_plsql:     execute custom PL/SQL to lock the rows
--     p_lock_plsql_code                Custom PL/SQL code to lock the rows
--
--     p_auto_bind_items                whether to auto-bind APEX items
--     p_sql_parameters                 additional bind variables to be used
--
--     p_columns                        Information on DML columns
--     p_columns_values                 Column values for all DML rows
--     p_row_statuses                   DML information for each row. DML Operation and row version checksums are being
--                                      passed in, status code and status message are being passed back.
--
--     p_parse_as_schema_override       for local database: override schema to parse SQL as
--     p_do_substitutions               whether to do substitutions
--
--==============================================================================
procedure prepare_dml_context (
    p_context                    in out nocopy t_context,
    --
    p_location                   in            wwv_flow_exec_api.t_location,
    p_remote_server_id           in            number                                default null,
    p_web_src_module_id          in            number                                default null,
    p_document_source_id         in            number                                default null,
    p_array_column_id            in            number                                default null,
    --
    p_query_type                 in            wwv_flow_exec_api.t_query_type        default null,
    --
    p_owner                      in            varchar2                              default null,
    p_table_name                 in            varchar2                              default null,
    -- passing a WHERE clause, but makes only sense when we use the with WITH CHECK OPTION clause
    p_where_clause               in            varchar2                              default null,
    --
    p_sql_query                  in            varchar2                              default null,
    p_function_body              in            varchar2                              default null,
    p_function_body_language     in            wwv_flow_code_exec.t_language         default null,
    --
    p_source_post_processing     in            wwv_flow_exec_api.t_post_processing   default null,
    --
    p_with_check_option          in            boolean                               default true,
    -- to pass the APPEND or APPEND_VALUES optimizer hints ...
    p_optimizer_hint             in            varchar2                              default null,
    -- parameters to execute DML on another table or with custom code
    p_dml_table_owner            in            varchar2                              default null,
    p_dml_table_name             in            varchar2                              default null,
    p_dml_plsql_code             in            varchar2                              default null,
    -- optimistic locking style to use. Not used for REST; store style in Web Src Module attributes and use that
    p_lost_update_detection      in            wwv_flow_exec_api.t_lost_update_detection default null,
    -- lock row behavior
    p_lock_rows                  in            wwv_flow_exec_api.t_lock_rows         default null,
    p_lock_plsql_code            in            varchar2                              default null,
    -- important for multi-row DML; see "Atomicity" bullet above. For REST services, we cannot assume support for
    -- single transactions - so make this configurable for all data sources ...?
    p_auto_bind_items            in            boolean                               default true,
    -- SQL Parameters = binds - really needed? remove ... we don't have component SQL
    p_sql_parameters             in            wwv_flow_exec_api.t_parameters        default wwv_flow_exec_api.c_empty_parameters,
    -- Web Source Parameters: HTTP Headers, URL Parameters etc.
    p_parameters                 in            wwv_flow_exec_api.t_parameters        default wwv_flow_exec_api.c_empty_parameters,
    p_out_parameters             in            t_web_source_out_params               default c_empty_web_source_out_params,
    --
    p_fetch_row_parameters       in            wwv_flow_exec_api.t_parameters        default wwv_flow_exec_api.c_empty_parameters,
    p_fetch_row_out_parameters   in            t_web_source_out_params               default c_empty_web_source_out_params,
    p_insert_row_parameters      in            wwv_flow_exec_api.t_parameters        default wwv_flow_exec_api.c_empty_parameters,
    p_insert_row_out_parameters  in            t_web_source_out_params               default c_empty_web_source_out_params,
    p_update_row_parameters      in            wwv_flow_exec_api.t_parameters        default wwv_flow_exec_api.c_empty_parameters,
    p_update_row_out_parameters  in            t_web_source_out_params               default c_empty_web_source_out_params,
    p_delete_row_parameters      in            wwv_flow_exec_api.t_parameters        default wwv_flow_exec_api.c_empty_parameters,
    p_delete_row_out_parameters  in            t_web_source_out_params               default c_empty_web_source_out_params,
    --
    p_allowed_operations_attr    in            varchar2                              default null,
    -- DML columns
    p_columns                    in            wwv_flow_exec_api.t_columns           default wwv_flow_exec_api.c_empty_columns,
    p_columns_values             in out nocopy t_columns_values,
    p_row_statuses               in out nocopy t_row_statuses,
    --
    p_executing_component        in            wwv_flow.t_component                  default wwv_flow.get_component,
    --
    p_parse_as_schema_override   in            varchar2                              default null,
    p_do_substitutions           in            boolean                               default false );


--==============================================================================
-- prepares a DML context for the current plug-in source
--
-- PARAMETERS:
--     p_context                        the context object to prepare
--
--     p_with_check_option              whether to add the WITH CHECK OPTION clause on the SQL Query. This
--                                      prevents rows being inserted or updated which would violate the WHERE clause
--                                      of the DML SQL query,
--     p_dml_table_owner                Execute DML on a different table: Table owner
--     p_dml_table_name                 Execute DML on a different table: Table name
--     p_dml_plsql_code                 Execute custom PL/SQL code for each row. The APEX$ROW_STATUS pseudocolumn
--                                      will indicate the DML operation to execute.
--
--     p_lost_update_detection          Type of Lost Update Detection to use.
--                                      * wwv_flow_exec_api.c_lost_update_none:     no lost update detection
--                                      * wwv_flow_exec_api.c_lost_update_implicit: calculate a checksum from the column values
--                                      * wwv_flow_exec_api.c_lost_update_explicit: one of p_context.dml_columns has is_checksum = true
--
--     p_lock_rows                      How to lock rows to secure for the (small) timeframe between checksum calculation and "real" DML
--                                      * wwv_flow_exec_api.c_lock_rows_none:      no row locking
--                                      * wwv_flow_exec_api.c_lock_rows_automatic: execute a SELECT ... FOR UPDATE
--                                      * wwv_flow_exec_api.c_lock_rows_plsql:     execute custom PL/SQL to lock the rows
--     p_lock_plsql_code                Custom PL/SQL code to lock the rows
--
--     p_sql_parameters                 additional bind variables to be used
--
--     p_columns                        Information on DML columns
--     p_columns_values                 Column values for all DML rows
--     p_row_statuses                   DML information for each row. DML Operation and row version checksums are being
--                                      passed in, status code and status message are being passed back.
--
--     p_parse_as_schema_override       for local database: override schema to parse SQL as
--     p_do_substitutions               whether to do substitutions
--
--==============================================================================
procedure prepare_dml_context (
    p_context                    in out nocopy t_context,
    --
    p_with_check_option          in            boolean                               default true,
    p_sql_parameters             in            wwv_flow_exec_api.t_parameters        default wwv_flow_exec_api.c_empty_parameters,
    --
    p_dml_table_owner            in            varchar2                              default null,
    p_dml_table_name             in            varchar2                              default null,
    p_dml_plsql_code             in            varchar2                              default null,
    --
    p_lost_update_detection      in            wwv_flow_exec_api.t_lost_update_detection default null,
    p_lock_rows                  in            wwv_flow_exec_api.t_lock_rows         default null,
    p_lock_plsql_code            in            varchar2                              default null,
    --
    p_allowed_operations_attr    in            varchar2                              default null,
    --
    p_columns                    in            wwv_flow_exec_api.t_columns           default wwv_flow_exec_api.c_empty_columns,
    p_columns_values             in out nocopy t_columns_values,
    p_row_statuses               in out nocopy t_row_statuses,
    --
    p_executing_component        in            wwv_flow.t_component                  default wwv_flow.get_component,
    --
    p_parse_as_schema_override   in            varchar2                              default null,
    p_do_substitutions           in            boolean                               default false );

--
--
--==============================================================================
-- executes a DML context
--
-- PARAMETERS
--     p_context                        the context object to prepare
--
--     p_continue_on_error              whether to continue with remaining rows after an error occurred
--     p_parse_as_schema_override       for local database: override schema to parse SQL as
--     p_do_substitutions               whether to do substitutions
--==============================================================================
procedure execute_dml_context(
    p_context                    in out nocopy t_context,
    --
    p_parse_as_schema_override   in            varchar2                              default null,
    p_continue_on_error          in            boolean                               default false,
    p_do_substitutions           in            boolean                               default false );

--
--
--==============================================================================
-- compares a row of DML values with the existing row in the database
--
-- PARAMETERS
--     p_dml_context                    the DML context object with the new rows
--     p_query_context                  the Query context with the existing rows
--
-- RETURNS
--     true if the DML context actually changes the row, false if not.
--==============================================================================
function has_changed_values(
    p_dml_context   in wwv_flow_exec.t_context,
    p_dml_row_idx   in pls_integer,
    p_query_context in wwv_flow_exec.t_context ) return boolean;
--
--
--==============================================================================
-- Executes a PL/SQL function code block and returns a BOOLEAN result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_plsql_function: PL/SQL function which returns boolean.
--                   For example:
--                   declare
--                       l_test boolean;
--                   begin
--                       -- do something
--                       return l_test;
--                   end;
--==============================================================================
function get_plsql_func_result_boolean (
    p_location         in wwv_flow_exec_api.t_location,
    p_remote_server_id in number                         default null,
    p_function_body    in varchar2,
    p_auto_bind_items  in boolean                        default true,
    p_binds            in wwv_flow_exec_api.t_parameters default wwv_flow_exec_api.c_empty_parameters,
    p_parse_as_schema  in varchar2                       default wwv_flow_security.g_parse_as_schema )
    return boolean;

--==============================================================================
-- Describes a SQL statement and returns the selected columns used in the SQL.
--==============================================================================
function check_and_describe (
    p_location                 in wwv_flow_exec_api.t_location  default wwv_flow_exec_api.c_location_local_db,
    p_remote_server_id         in number                        default null,
    --
    p_query_type               in wwv_flow_exec_api.t_query_type,
    -- Used by wwv_flow_exec_api.t_query_type_table
    p_owner                    in varchar2                      default null,
    p_table_name               in varchar2                      default null,
    -- Used by wwv_flow_exec_api.t_query_type_sql_query
    p_sql_query                in varchar2                      default null,
    -- Used by wwv_flow_exec_api.c_query_type_func_return_sql
    p_function_body            in varchar2                      default null,
    p_function_body_language   in wwv_flow_code_exec.t_language default null,
    p_generic_column_count     in t_column_count                default null,
    -- Used by wwv_flow_exec_api.t_query_type_table and wwv_flow_exec_api.t_location_web_source
    p_where_clause             in varchar2                      default null,
    p_match_clause             in varchar2                      default null,
    p_columns_clause           in varchar2                      default null,
    p_order_by_clause          in varchar2                      default null,
    -- Used by wwv_flow_exec_api.t_query_type_table, wwv_flow_exec_api.t_query_type_sql_query and wwv_flow_exec_api.c_query_type_func_return_sql
    p_optimizer_hint           in varchar2                      default null,
    --
    p_test_for_rowid           in boolean                       default false,
    --
    p_document_source_id       in number                        default null,
    p_web_src_module_id        in number                        default null,
    p_array_column_id          in number                        default null,
    p_post_processing_type     in varchar2                      default null,
    --
    p_columns                  in wwv_flow_exec_api.t_columns   default wwv_flow_exec_api.c_empty_columns,
    p_min_column_count         in t_column_count                default null,
    p_max_column_count         in t_column_count                default null,
    p_only_common_columns      in boolean                       default false,
    -- Used by local database
    p_application_id           in number                        default wwv_flow.g_flow_id,
    p_parse_as_schema          in varchar2                      default null,
    --
    p_extended_describe        in boolean                       default false,
    -- legacy
    p_do_substitutions         in boolean                       default false,
    --
    p_raise_error              in boolean                       default false )
    return t_describe_result;

--==============================================================================
-- Describes a SQL statement and returns the selected columns used in the SQL.
--==============================================================================
function check_and_describe (
    p_query_meta_data          in wwv_flow_exec.t_query_meta_data default c_empty_query_meta_data,
    --
    p_columns                  in wwv_flow_exec_api.t_columns     default wwv_flow_exec_api.c_empty_columns,
    p_min_column_count         in t_column_count                  default null,
    p_max_column_count         in t_column_count                  default null,
    p_generic_column_count     in t_column_count                  default null,
    --
    p_application_id           in number                          default wwv_flow.g_flow_id,
    p_parse_as_schema          in varchar2                        default null,
    --
    p_extended_describe        in boolean                         default false,
    --
    p_do_substitutions         in boolean                         default false,
    --
    p_raise_error              in boolean                         default false )
    return t_describe_result;

--==============================================================================
-- generates the response parsing SQL (including post-processing clauses)
--
-- PARAMETERS:
-- * p_post_processing_type      post-processing type (SQL, WHERE, FUNC_BODY_RETURNING_SQL, or NULL for no post-processing)
-- * p_post_processing_language  post-processing language (PLSQL, JAVASCRIPT, ...) if p_post_processing_type = FUNC_BODY_RETURNING_SQL
-- * p_post_processing_sql       post-processing SQL or PL/SQL code
-- * p_post_processing_where     post-processing WHERE clause
-- * p_post_processing_orderby   post-processing ORDER BY clause
--
-- * p_columns                   Return columns - pass emory arry to return all columns
-- * p_all_columns_needed        Indicates that all columns from the REST data source are needed. No columns
--                               should be "optimized out".
-- * p_data_profile_id           ID of the data profile to use
-- * p_use_single_row_selector   use the "single row selector" defined in the data profile. The "normal" row selector
--                               selects an array of rows, the "single row selector" selects a single row when no array
--                               is present.
-- * p_override_row_selector     Override the row selector from data profile, if provided
--
-- * p_array_count               JSON document count to generate SQL for. Use this to parse multiple XML or JSON
--                               responses in one call
--
-- * p_parse_as_schema_override  parse function body to return the SQL query as a specific schema
--
-- * p_local_table_owner         owner of the local table to generate a SELECT query from.
--                               Used when the local Sync table is used for a REST API.
-- * p_local_table_name          name of the local table to generate a SELECT query from.
--                               Used when the local Sync table is used for a REST API.
-- * p_describe_only             Whether the query is to be generated for a "describe" operation;
--                               i.e. do not fetch or parse any data; only work with the data profile.
--
-- RETURNS:
-- * p_data_source_sql           The SQL Query as an instance of wwv_flow_global.vc_arr2.
-- * p_file_profile              The file profile generated by WWV_FLOW_DATA_PARSER for
--                               CSV or XLSX files
--==============================================================================
procedure generate_data_source_sql(
    p_data_source_sql              out         wwv_flow_global.vc_arr2,
    p_file_profile              in out nocopy  clob,
    --
    p_post_processing_type      in             wwv_flow_exec_api.t_post_processing,
    p_post_processing_language  in             wwv_flow_code_exec.t_language,
    p_post_processing_sql       in             varchar2,
    p_post_processing_where     in             varchar2,
    p_post_processing_orderby   in             varchar2,
    --
    p_document_source_owner     in             varchar2    default null,
    p_document_source_table     in             varchar2    default null,
    p_document_source_where     in             varchar2    default null,
    p_column_expression         in             varchar2    default null,
    --
    p_columns                   in             wwv_flow_exec_api.t_columns,
    p_all_columns_needed        in             boolean     default false,
    p_data_profile_id           in             number,
    p_array_column_id           in             number      default null,
    p_use_single_row_selector   in             boolean     default false,
    p_override_row_selector     in             varchar2    default null,
    --
    p_array_count               in             pls_integer default null,
    --
    p_local_table_owner         in             varchar2    default null,
    p_local_table_name          in             varchar2    default null,
    p_parse_as_schema_override  in             varchar2    default null,
    --
    p_describe_only             in             boolean     default false,
    p_parser_data               in             blob        default null );

--==============================================================================
-- Describes a SQL statement and returns the selected columns and data types.
--
-- This is a Legacy Function, which was previously within wwv_flow_wizard_api,
-- but which is referenced in runtime packages. In order to be able to remove
-- wwv_flow_wizard_api from the runtime-only installation, the function
-- has been moved here.
--==============================================================================
procedure legacy_get_query_columns (
    p_location             in wwv_flow_exec_api.t_location default wwv_flow_exec_api.c_location_local_db,
    p_owner                in varchar2,
    p_query                in varchar2,
    p_include_blob         in varchar2 default 'N',
    p_include_tz           in varchar2 default 'N',
    p_remote_server_id     in number   default null,
    p_web_src_module_id    in number   default null,
    p_document_source_id   in number   default null,
    p_array_column_id      in number   default null,
    p_only_common_columns  in boolean  default false,
    --
    p_columns             out wwv_flow_global.vc_arr2,
    p_types               out wwv_flow_global.vc_arr2,
    p_col_max_len         out wwv_flow_global.vc_arr2 );

--==============================================================================
-- Converts the row status of a t_context to a wwv_flow_error.t_ora_error
--==============================================================================
function to_ora_error (
    p_context in t_context,
    p_row     in binary_integer )
    return wwv_flow_error.t_ora_error;

--==============================================================================
-- This function describes a region's data source and returns its columns
-- Note: Mainly used in facted search rendering
--
-- Parameters:
--
-- * p_region_id:                       The internal ID of the region
-- * p_region_context:                  Region query meta data context
-- * p_region_has_region_columns:       Whether the region supports "Region Columns"
--
-- Returns:
-- List of region columns
--==============================================================================
function get_region_columns (
    p_region_id                 in number,
    p_region_context            in t_query_meta_data,
    p_region_has_region_columns in boolean ) return wwv_flow_exec_api.t_columns;

--==============================================================================
-- Map Location to EXEC API constants
--==============================================================================
function map_location(
    p_location  in varchar2 )
    return wwv_flow_exec_api.t_location;

--==============================================================================
-- Map Query Type to EXEC API constants
--==============================================================================
function map_query_type(
    p_query_type    in varchar2 )
    return wwv_flow_exec_api.t_query_type;

--==============================================================================
-- convert the string representation of a post processing type to its
-- WWV_FLOW_EXEC constant.
--
-- * 'WHERE_ORDER_BY_CLAUSE'   -> wwv_flow_exec_api.c_postprocess_where_orderby
-- * 'SQL'                     -> wwv_flow_exec_api.c_postprocess_sql
-- * 'FUNC_BODY_RETURNING_SQL' -> wwv_flow_exec_api.c_postprocess_func_return_sql
--==============================================================================
function map_post_processing_type(
    p_post_processing_type in varchar2 )
    return wwv_flow_exec_api.t_post_processing;

--==============================================================================
-- Map Vector Distance Description to EXEC API constants
--==============================================================================
function map_vector_distance(
    p_vector_distance in wwv_flow_exec_api.t_vector_distance )
    return wwv_flow_exec_api.t_vector_distance_type;

--==============================================================================
-- Returns the DML operation type for the current array element. Can only be
-- called when being inside an array column; otherwise an error is raised.
--==============================================================================
function get_array_row_dml_operation(
    p_context               in t_context)
    return wwv_flow_exec_api.t_dml_operation;
end wwv_flow_exec;
/
show errors
