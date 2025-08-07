set define '^' verify off
prompt ...wwv_flow_f4000_util
create or replace package wwv_flow_f4000_util as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2006, 2023, Oracle and/or its affiliates.
--
--  NAME
--    wwv_flow_f4000_util
--
--  DESCRIPTION
--    Oracle APEX logic
--
--  MODIFIED (MM/DD/YYYY)
--    mhichwa   06/16/2006 - Created
--
--------------------------------------------------------------------------------

-- package globals
c_gallery_status_initial  constant varchar2(50) := 'INITIAL';
c_gallery_status_pending  constant varchar2(50) := 'PENDING';
c_gallery_status_success  constant varchar2(50) := 'SUCCESS';
c_gallery_status_error    constant varchar2(50) := 'ERROR';
c_gallery_action_install  constant varchar2(50) := 'INSTALL';
c_gallery_action_update   constant varchar2(50) := 'UPDATE';

type t_gallery_app is record (
    collection_seq number,
    execution_id   number,
    app_id         number,
    internal_name  varchar2( 4000 ),
    author         varchar2( 4000 ),
    name           varchar2( 4000 ),
    description    varchar2( 4000 ),
    icon           varchar2( 4000 ),
    version        varchar2( 4000 ),
    zip_file       blob,
    action         varchar2( 4000 ),
    status         varchar2( 4000 ),
    message        varchar2( 4000 ) );

function validate_db_column (
    p_parsing_schema in varchar2,
    p_owner          in varchar2,
    p_table_name     in varchar2,
    p_column_name    in varchar2 )
    return varchar2;

function get_next_app_page (
    p_request      in varchar2 default null,
    p_current_app  in number   default null,
    p_current_page in number   default null)
    return number
    ;

function get_build_opt_util
    return varchar2
    ;

procedure show_popup_images (
    p_return_item   in varchar2 default null,
    p_image_size    in number   default null,
    p_show          in varchar2 default null,
    p_category      in varchar2 default null)
    ;

-- for popup pages to implement help links
procedure show_help_link (
   p_lang           in varchar2 default null,
   p_session_id     in varchar2 default null,
   p_application_id in varchar2 default null,
   p_page_id        in varchar2 default null)
   ;

-- application level process
procedure set_flow_page
;

--==============================================================================
-- Validates a LOV query which has to contain two columns.
-- If p_parse_as_schema is null, it will default to
-- wwv_flow_security.flow_owner for FB_FLOW_ID
--==============================================================================
function is_valid_lov_query (
    p_query            in varchar2,
    p_parse_as_schema  in varchar2 default null,
    p_min_column_count in number default 2,
    p_max_column_count in number default 2 )
    return varchar2;

--==============================================================================
function is_valid_list_query (
    p_query       varchar2,
    p_query_type  varchar2
) return varchar2;

--==============================================================================
-- Return if p_query contains an order by clause at the end.
-- Used by validations on 4000:420, 4000:4651, 4000:4796 and 4000:831
--==============================================================================
function is_query_with_order_by (
    p_query       in varchar2 )
    return boolean;

function check_plsql (
    p_sql               in varchar2,
    p_flow_id           in number,
    p_security_group_id in number,
    p_remote_server_id  in number  default null,
    p_escape_result     in boolean default true
) return varchar2 ;

--==============================================================================
-- Checks for a valid SQL statement
-- Returns the error text.
--==============================================================================
function check_sql (
    p_sql                 in varchar2,
    p_flow_id             in number   default nv('FB_FLOW_ID'),
    p_parse_as_schema     in varchar2 default null,
    p_min_column_count    in number,
    p_max_column_count    in number   default null,
    p_invalid_sql_error   in varchar2,
    p_column_count_error  in varchar2,
    p_column_name_invalid in varchar2 default null,
    p_column_not_unique   in varchar2 default null,
    p_escape_result       in boolean default true )
    return varchar2;

--==============================================================================
-- Checks for a valid SQL statement using wwv_flow_exec_dev API
-- Returns the error text.
--==============================================================================
function check_sql(
    p_sql                 in varchar2,
    p_flow_id             in number   default nv('FB_FLOW_ID'),
    p_remote_server_id    in number   default null,
    p_parse_as_schema     in varchar2 default null,
    p_min_column_count    in number   default null,
    p_max_column_count    in number   default null,
    p_escape_result       in boolean  default true )
    return varchar2;

function countem( p_sql in varchar2,
                  p_user in varchar2 ) return varchar2;

--==============================================================================
-- Checks for a valid report SQL statement
-- moved from wwv_render_report3 to here.
-- Returns the error text.
--==============================================================================
function is_valid_report_query (
    p_plug_source      varchar2,
    p_plug_source_type varchar2,
    p_owner            varchar2  default null,
    p_required_col_num number    default null )
return varchar2;

--==============================================================================
-- Checks whether the query returns 1 row and 1 column.
-- moved from wwv_flow_tree_region to here.
--==============================================================================
function is_valid_start_query(
    p_sql    in varchar2
) return boolean;

--==============================================================================
-- Test a legacy web service (app process P875_TEST_REST). The procedure writes
-- unescaped text to the HTP buffer. The caller is responsible for escaping (JS
-- functions p975_test_rest on page 975 and p875_test_rest on page 875).
--==============================================================================
procedure test_legacy_rest_service (
    p_url             in varchar2,
    p_proxy_override  in varchar2,
    p_method          in varchar2,
    p_username        in varchar2,
    p_password        in varchar2,
    p_body            in varchar2,
    p_parm_name       in wwv_flow_global.vc_arr2,
    p_parm_value      in wwv_flow_global.vc_arr2,
    p_http_headers    in wwv_flow_global.vc_arr2,
    p_http_hdr_values in wwv_flow_global.vc_arr2 );

--==============================================================================
-- Checks for a valid SQL statement
-- Returns the error text.
--==============================================================================
function validate_plsql_expressions (
    p_expression       in varchar2,
    p_expression_type  in varchar2 )
    return varchar2;

--==============================================================================
-- Procedure to initialize LOVs collection
-- This procedure is used in 4000:623
--==============================================================================
procedure init_lov_collection (
    p_collection_name   in varchar2,
    p_copy_from_flow_id in number,
    p_copy_from_page_id in number );

--==============================================================================
-- Procedure to initialize Lists collection
-- This procedure is used in 4000:625
--==============================================================================
procedure init_list_collection (
    p_collection_name   in varchar2,
    p_copy_from_flow_id in number,
    p_copy_from_page_id in number );

--==============================================================================
-- Procedure to initialize Authorization Scheme collection
-- This procedure is used in 4000:627
--==============================================================================
procedure init_authorization_collection (
    p_collection_name   in varchar2,
    p_copy_from_flow_id in number,
    p_copy_from_page_id in number );

--==============================================================================
-- Gallery: Update app installation collection with status information
-- to indicate the progress of the installation.
-- Updates collection in current session & optional in parent process session.
-- Used in 4750:50
--==============================================================================
procedure update_gallery_install_status(
    p_background_install in boolean default true,
    p_seq_id             in number,
    p_session_id         in number default null,
    p_action             in varchar2,
    p_status             in varchar2,
    p_message            in varchar2,
    p_execution_id       in number default null
);

--==============================================================================
-- Gallery: Initialize packaged app installation process
-- Stores uploaded app information & zip file in collection
-- Used in 4750:50
--==============================================================================
procedure init_install_app( p_write_json in boolean default true );

--==============================================================================
-- Gallery: Removes a packaged app including supporting objects
-- Used in 4750:50
--==============================================================================
procedure remove_app(
    p_flow_id in wwv_flows.id%type
);

--==============================================================================
-- Gallery: Write global javascript variable gInstalledApps to page, this is used
-- by frontend logic to render cards based on this information, e.g. display delete
-- or run app buttons
-- Used in 4750:50
--==============================================================================
procedure write_installed_apps_js( p_write_script in boolean default true );

--==============================================================================
-- Gallery: Write global javascript variable gPendingApps to page, this is used
-- by frontend logic to render cards based on this information, e.g. indicating
-- pending installations
-- Used in 4750:50
--==============================================================================
procedure write_pending_apps_js( p_write_script in boolean default true );

--==============================================================================
-- Gallery: Fetch data from collection to our custom type t_gallery_app
-- Used in 4750:40 / 4750:50
--==============================================================================
function fetch_install_app_collection(
    p_app_int_name in  wwv_flow_gallery_installs.internal_name%type,
    p_app_author   in  wwv_flow_gallery_installs.author%type,
    p_execution_id in  wwv_flow_process_bg_execs$.id%type default null
) return t_gallery_app;

--==============================================================================
-- Gallery: Install packaged app including supporting objects
-- Used in 4750:40 / 4750:50
--==============================================================================
procedure install_app(
    p_flow_id            in out wwv_flows.id%type,
    p_owner              in varchar2,
    p_app_int_name       in wwv_flow_gallery_installs.internal_name%type,
    p_app_author         in wwv_flow_gallery_installs.author%type,
    p_background_install in boolean  default true,
    p_install_action     in varchar2 default c_gallery_action_install
);

--==============================================================================
-- Gallery: Execute a process chain defined on the gallery page
-- We execute these processes in the context of an AJAX call, so we don't use the
-- standard APEX submission mechanism.
-- Used in 4750:50
--==============================================================================
procedure execute_app_process_chain(
    p_process_name in varchar2
);

--==============================================================================
-- Gallery: Perform an application install action dependent on install action,
-- execute background or foreground process defined on gallery page
-- Used in 4750:50
--==============================================================================
procedure perform_app_install_action(
    p_background_install in boolean  default true,
    p_install_action     in varchar2 default c_gallery_action_install,
    p_execution_id_item  in varchar2 default null
);

--==============================================================================
-- Returns a sample API call signature to send an email using a template
--==============================================================================
function get_sample_email_api_usage(
    p_static_id         in varchar2,
    p_version_number    in number,
    p_subject           in clob,
    p_html_header       in clob,
    p_html_body         in clob,
    p_html_footer       in clob,
    p_text_template     in clob )
    return varchar2;

--==============================================================================
-- Checks if specific table or view exists or accessible from the owner
--==============================================================================
function does_table_view_exist (
    p_owner       in varchar2,
    p_object_name in varchar2 )
    return boolean;

--==============================================================================
-- Clean references to a build option by updating all references to null
--==============================================================================
procedure update_build_option_references(
    p_build_option_id in number,
    p_application_id  in number );

--==============================================================================
-- Delete components related to a build option
--==============================================================================
procedure delete_build_option_references(
    p_build_option_id in number,
    p_application_id  in number );

--==============================================================================
-- This function checks and returns item id of a page item in the application
--
-- Parameters:
-- * p_item_name:      Item Name to check
-- * p_application_id: Looks for the item in this application
--
-- Returns:
-- * ID of the item, if exists. NULL otherwise
--==============================================================================
function get_page_item_id (
    p_item_name       in varchar2,
    p_application_id  in number )
    return number;

--==============================================================================
-- This function checks and returns item id of an application item in the application
--
-- Parameters:
-- * p_item_name:      Item Name to check
-- * p_application_id: Looks for the item in this application
--
-- Returns:
-- * ID of the item, if exists. NULL otherwise
--==============================================================================
function get_application_item_id (
    p_item_name       in varchar2,
    p_application_id  in number )
    return number;

--==============================================================================
-- Checks wwv_flow_global.g_cloud and returns 'Y' or 'N' respectively.
--==============================================================================
function is_cloud
    return varchar2;

--==============================================================================
-- Deletes list and clearing reference_id in subscribed component
--==============================================================================
procedure delete_list(
    p_list_id           in number,
    p_application_id    in number);

end wwv_flow_f4000_util;
/
show errors