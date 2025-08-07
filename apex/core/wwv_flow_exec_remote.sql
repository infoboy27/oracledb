set define '^' verify off
prompt ...wwv_flow_exec_remote.sql
create or replace package wwv_flow_exec_remote is
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_remote_exec.sql
--
--    DESCRIPTION
--      SQL Data Access for remote ORDS instances (feature #2109).
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    03/14/2017 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Constants
--==============================================================================

c_date_format_mask            constant varchar2(26) := 'YYYY-MM-DD"T"HH24:MI:SS"Z"';
c_timestamp_format_mask       constant varchar2(30) := 'YYYY-MM-DD"T"HH24:MI:SS.FF6"Z"';
c_timestamp_tz_format_mask    constant varchar2(30) := 'YYYY-MM-DD"T"HH24:MI:SS.FF6"Z"';
c_timestamp_ltz_format_mask   constant varchar2(30) := 'YYYY-MM-DD"T"HH24:MI:SS.FF6"Z"';

c_ords_classname_json         constant varchar2(20) := 'javax.json.JsonValue';

c_page_size                   constant pls_integer  := 500;

subtype t_server_status is pls_integer range 1..4;
c_server_ok          constant t_server_status := 1;
c_server_no_metadata constant t_server_status := 2;
c_server_no_restsql  constant t_server_status := 3;
c_server_no_auth     constant t_server_status := 4;

--==============================================================================
-- global types
--==============================================================================
type t_remote_server is record(
    id                      number,
    endpoint_url            wwv_remote_servers.base_url%type,
    https_host              wwv_remote_servers.https_host%type,
    --
    ords_timezone           wwv_remote_servers.ords_timezone%type,
    ords_version            wwv_remote_servers.ords_version%type,
    ords_init_code          wwv_remote_servers.ords_init_code%type,
    ords_cleanup_code       wwv_remote_servers.ords_cleanup_code%type,
    --
    database_type           wwv_flow_exec_api.t_database_type,
    default_schema          wwv_remote_servers.remote_sql_default_schema%type,    
    database_version        number,
    mysql_sql_modes         wwv_remote_servers.mysql_sql_modes%type,
    --
    credential_id           wwv_remote_servers.credential_id%type,
    result_stmt_id          pls_integer,
    --
    configuration_procedure wwv_remote_servers.configuration_procedure%type );

type t_server_test_result is record(
    remote_server          t_remote_server,
    --
    server_status          t_server_status,
    http_status_code       pls_integer,
    sql_error_code         pls_integer,
    --
    mysql_sql_modes        varchar2(4000),
    --
    discover_response      varchar2(32767),
    message                varchar2(32767) );

type t_configured_remote_server is record (
    base_url   wwv_remote_servers.base_url%type,
    https_host wwv_remote_servers.https_host%type );

--==============================================================================
-- retrieves remote server details based on remote server ID
--==============================================================================
function get_remote_server(
    p_remote_server_id in wwv_remote_servers.id%type,
    p_application_id   in number )
    return t_remote_server;

--==============================================================================
-- retrieves the remote database type
--==============================================================================
function get_database_type(
    p_remote_server_id  in wwv_remote_servers.id%type )
    return wwv_flow_exec_api.t_database_type result_cache;

--==============================================================================
-- is the REST Enabled SQL database type and version supported by APEX
--==============================================================================
function is_supported(
    p_remote_server_id  in wwv_remote_servers.id%type )
    return varchar2;

--==============================================================================
-- finds the remote server ID by static ID
--
-- PARAMETERS
--     p_server_static_id        IN remote server static ID
--==============================================================================
function find_remote_server_id(
    p_server_static_id in varchar2 ) return wwv_remote_servers.static_id%type;

--==============================================================================
-- return the WWV_FLOW_EXEC_API data type contant which represents the
-- data type specification being passed in.
--==============================================================================
function get_datatype_num(
    p_datatype_string in varchar2,
    p_datatype_java   in varchar2,
    p_for_database    in wwv_flow_exec_api.t_database_type )
    return wwv_flow_exec_api.t_data_type;

--==============================================================================
-- generate the ORDS Remote SQL Data Access JSON Request for a query context
--==============================================================================
procedure construct_json_query_request (
    p_json_request         in out nocopy wwv_flow_t_clob_writer,
    p_context              in out nocopy wwv_flow_exec.t_context,
    p_execute              in            boolean                        default true,
    p_test_for_rowid       in            boolean                        default false,
    p_first_page           in            boolean                        default true,
    p_remote_server        in            t_remote_server );

--==============================================================================
-- Performs the "open_query_context" operation for execution on a remote server.
--
-- For a DML context, the procedure does nothing; a query context will be
-- executed so that the component can continue with fetching rows.
--
-- p_context: context object with execution details
--==============================================================================
procedure open_query_context (
    p_context              in out nocopy wwv_flow_exec.t_context,
    p_columns              in            wwv_flow_exec_api.t_columns default wwv_flow_exec_api.c_empty_columns,
    p_cache                in            varchar2                    default null,
    p_cache_invalidation   in            varchar2                    default null,
    p_cache_component_id   in            number                      default null,
    p_cache_component_type in            number                      default null);

--==============================================================================
-- Performs a describe operation for the query on the remote server and
-- populates the context object with result set metadata
--
-- p_sql_query: SQL    Query to describe
-- p_remote_server_id: Remote Server ID to execute the describe on
-- p_columns:          Array of columns
--==============================================================================
function describe_query (
    p_remote_server_id in number,
    p_sql_query        in wwv_flow_global.vc_arr2,
    p_test_for_rowid   in boolean  default false,
    p_optimizer_hint   in varchar2 default null,
    p_application_id   in number )
    return wwv_flow_exec_api.t_columns;

--==============================================================================
function get_returning_col_out_expr(
    p_column_idx      in pls_integer )
    return varchar2;

--==============================================================================
function get_column_in_expr(
    p_context in wwv_flow_exec.t_context,
    p_col_idx in pls_integer )
    return varchar2;

--==============================================================================
-- Executes the DML operation on the remote server.
--
-- Parameters:
-- * p_context:                    The context object with execution details.
-- * p_continue_on_error:          Whether to continue with processing the remaining rows when
--                                 an error occurs on one row.
--
-- * p_override_statements:        DML statements to use instead of generated ones.
-- * p_returning_only_for_insert:  If passed as TRUE, RETURNING values will only be
--                                 processed for DML INSERT statements; this is needed
--                                 for document sources.
-- * p_no_binds_for_cols:          Ignore bind variables for the columns in this array.
--                                 This is needed for Document Sources, when JSON binds
--                                 cannot be used for a column. In that case, the value
--                                 is added to the SQL as a literal, thus we must not
--                                 bind it any more.
--
--==============================================================================
procedure execute_dml (
    p_context                   in out nocopy wwv_flow_exec.t_context,
    p_continue_on_error         in            boolean                     default false,
    --
    p_override_statements       in            wwv_flow_global.vc_arr2     default wwv_flow_global.c_empty_vc_arr2,
    p_returning_only_for_insert in            boolean                     default false,
    p_no_binds_for_cols         in            wwv_flow_global.vc_arr2     default wwv_flow_global.c_empty_vc_arr2 );

--==============================================================================
-- Computes the row version checksum for the current row. This is a special
-- implementation for Remote SQL for the following reasons:
--
-- * We cannot compute the checksum locally - it has to be the same HTTP request
--   as the actual DML update statement. This is because REST Enabled SQL is
--   stateless.
-- * We cannot rely on any APEX package on the remote side
-- * We cannot rely on DBMS_CRYPTO on the remote side; a DB user has no privs
--   on this by default.
--
-- So we cpompute a very simple "checksum" using plain SQL functions. This function
-- computes the "checksum" based on simple LENGTH and "+"/"-" arithmetic operations.
--
-- Parameters:
-- * p_context: Context object with execution details.
--
-- Returns:
-- The computed checksum.
--==============================================================================
function get_row_version_checksum(
    p_context in wwv_flow_exec.t_context ) return varchar2;

--==============================================================================
-- Executes the PL/SQL operation on the remote server.
--
-- p_context: context object with execution details
--==============================================================================
procedure execute_plsql (
    p_context in out nocopy wwv_flow_exec.t_context );

--==============================================================================
-- Fetches the next page for a query context.
--
-- p_context: context object with execution details
--==============================================================================
function next_page (
    p_context in out nocopy wwv_flow_exec.t_context )
    return boolean;

--==============================================================================
-- Tests whether credentials for this remote server are correct
--
-- p_remote_server_id: Remote Server ID to execute the describe on
--==============================================================================
function test_authentication(
    p_remote_server_id in number,
    p_application_id   in number ) return boolean;

--==============================================================================
-- Executes a PL/SQL function code block and returns a VARCHAR2 result.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_plsql_function: PL/SQL function which returns string.
--                   For example:
--                   declare
--                       l_test varchar2(10);
--                   begin
--                       -- do something
--                       return l_test;
--                   end;
--==============================================================================
function get_plsql_func_result_varchar2(
    p_plsql_expression in varchar2,
    p_remote_server_id in number,
    p_binds            in wwv_flow_exec_api.t_parameters  default wwv_flow_exec_api.c_empty_parameters
) return varchar2;

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
function get_plsql_func_result_boolean(
    p_plsql_function   in varchar2,
    p_remote_server_id in number,
    p_binds            in wwv_flow_exec_api.t_parameters  default wwv_flow_exec_api.c_empty_parameters
) return boolean;

--==============================================================================
-- Executes a SQL statement which contains one VARCHAR2 column and returns the
-- value of the first row. If the SQL statement doesn't return any rows or the
-- SQL statement itself is NULL then NULL will be returned.
--
-- The function automatically performs the necessary binding of bind variables.
--
-- p_sql_statement: SQL statement with one VARCHAR2 column.
--==============================================================================
function get_first_row_result_varchar2 (
    p_sql_statement    in varchar2,
    p_remote_server_id in number,
    p_binds            in wwv_flow_exec_api.t_parameters  default wwv_flow_exec_api.c_empty_parameters
) return varchar2;

--==============================================================================
-- Checks PL/SQL code in the remote database
--
-- PARAMETERS
--    p_plsql_code        PL/SQL code to verify
--    p_remote_server_id  The ID of the remote server
--
-- RETURNS
--    the error message in case of an error, NULL on success
--==============================================================================
function check_plsql(
    p_plsql_code       in varchar2,
    p_remote_server_id in number,
    p_application_id   in number ) return varchar2;

--==============================================================================
-- Tests a ORDS Remote SQL server.
--
-- PARAMETERS:
--    * p_remote_sql_server_id  The ID of the remote server
--    * p_update_timezone       Update the time zone information based on the server response
--
-- RETURNS
--    * p_test_result:          Record with test results
--==============================================================================
procedure test_remote_sql_server(
    p_remote_server_id in            number,
    p_update_metadata  in            boolean default true,
    --
    p_test_result      in out nocopy t_server_test_result );

--==============================================================================
-- Procedure to configure a remote server at runtime
-- by execution the configuration procedure
-- performs a substitution on (some) stored attributes of wwv_remote_servers
--   * base_url
--   * https_host
--==============================================================================
procedure configure_remote_server(
    p_remote_server_id         in     number,
    p_application_id           in     number,
    p_configured_remote_server in out t_configured_remote_server );

--==============================================================================
-- Function to get the configured base_url of a remote server
--==============================================================================
function get_configured_base_url(
    p_remote_server_id in number,
    p_application_id   in number ) return varchar2;

end wwv_flow_exec_remote;
/
show err
set define '^'
