set define '^' verify off
prompt ...wwv_flow_application_install
create or replace package wwv_flow_application_install as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2010, 2023, Oracle and/or its affiliates.
--
-- The APEX_APPLICATION_INSTALL package provides many methods to modify application
-- attributes during the Oracle APEX application installation process.
--
-- # About the APEX_APPLICATION_INSTALL API
--
-- Oracle APEX provides two ways to import an application into an
-- Oracle APEX instance:
-- 1. Upload and installation of an application export file by using the web
--    interface of Oracle APEX.
-- 2. Execution of the application export file as a SQL script, typically in
--    the command-line utility SQLcl.
--
-- Using the file upload capability of the web interface of Oracle APEX,
-- developers can import an application with a different application ID, different
-- workspace ID and different parsing schema. But when importing an application
-- by using a command-line tool like SQLcl, none of these attributes
-- (application ID, workspace ID, parsing schema) can be changed without directly
-- modifying the application export file.
--
-- To view the install log, enter the following from the command-line tool, so
-- the server outputs are displayed:
--
--     set serveroutput on unlimited
--
-- As more and more Oracle APEX customers create applications which are
-- meant to be deployed by using command-line utilities or by using a non-web-based
-- installer, they are faced with this challenge of how to import their application
-- into an arbitrary workspace on any Oracle APEX instance.
--
-- Another common scenario is in a training class when installing an application
-- into 50 different workspaces that all use the same application export file.
-- Today, customers  work around this by adding their own global variables to an
-- application export file and then varying the values of these globals at installation
-- time. However, this manual modification of the application export file (usually
-- done with a post-export sed or awk script) should not be necessary.
--
-- Oracle APEX 4.0 and higher includes the APEX_APPLICATION_INSTALL API.
-- This PL/SQL API provides many methods to set application attributes during
-- the Oracle APEX application installation process. All export files
-- in Oracle APEX 4.0 and higher contain references to the values set
-- by the APEX_APPLICATION_INSTALL API. However, the methods in this API are only
-- used to override the default application installation behavior.
--
-- # Attributes Manipulated by APEX_APPLICATION_INSTALL
--
-- The table below lists the attributes that can be set by functions in this API.
--
-- | Attribute        | Description                                                                                                                                                                                                                |
-- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
-- | `Workspace ID`   | Workspace ID of the application to be imported. See [GET_WORKSPACE_ID Function](@@GET_WORKSPACE_ID), [SET_WORKSPACE_ID Procedure](@@SET_WORKSPACE_ID).                                                                           |
-- | `Application ID` | Application ID of the application to be imported. See [GENERATE_APPLICATION_ID Procedure](@@GENERATE_APPLICATION_ID), [GET_APPLICATION_ID Function](@@GET_APPLICATION_ID), [SET_APPLICATION_ID Procedure](@@SET_APPLICATION_ID). |
-- | `Offset`         | Offset value used during application import. See [GENERATE_OFFSET Procedure](@@GENERATE_OFFSET), [GET_OFFSET Function](@@GET_OFFSET), [SET_OFFSET Procedure](@@SET_OFFSET).                                                |
-- | `Schema`         | The parsing schema ("`owner`") of the application to be imported. See [GET_SCHEMA Function](@@GET_SCHEMA), [SET_SCHEMA Procedure](@@SET_SCHEMA).                                                                                 |
-- | `Name`           | Application name of the application to be imported. See [GET_APPLICATION_NAME Function](@@GET_APPLICATION_NAME), [SET_APPLICATION_NAME Procedure](@@SET_APPLICATION_NAME).                                                       |
-- | `Alias`          | Application alias of the application to be imported. See [GET_APPLICATION_ALIAS Function](@@GET_APPLICATION_ALIAS), [SET_APPLICATION_ALIAS Procedure](@@SET_APPLICATION_ALIAS).                                                  |
-- | `Image Prefix`   | The image prefix of the application to be imported. See [GET_IMAGE_PREFIX Function](@GET_IMAGE_PREFIX), [SET_IMAGE_PREFIX Procedure](@SET_IMAGE_PREFIX).                                                                         |
-- | `Proxy`          | The proxy server attributes of the application to be imported. See [GET_PROXY Function](@@GET_PROXY), [SET_PROXY Procedure](@@SET_PROXY).                                                                                        |
--
-- # Import Script Examples
--
-- Using the workspace FRED_DEV on the development instance, you generate an
-- application export of application 645 and save it as file f645.sql.
-- All examples in this section assume you are connected to SQLcl.
--
-- ## Import Application without Modification
--
-- To import this application back into the FRED_DEV workspace on the same
-- development instance using the same application ID:
--
--     @f645.sql
--
-- ## Import Application with Specified Application ID
--
-- To import this application back into the FRED_DEV workspace on the same
-- development instance, but using application ID 702:
--
--     begin
--         apex_application_install.set_application_id(702);
--         apex_application_install.generate_offset;
--         apex_application_install.set_application_alias( 'F' || apex_application_install.get_application_id );
--     end;
--     /
--
--     @645.sql
--
-- ## Import Application with Generated Application ID
--
-- To import this application back into the FRED_DEV workspace on the same
-- development instance, but using an available application ID generated by
-- Oracle APEX:
--
--     begin
--         apex_application_install.generate_application_id;
--         apex_application_install.generate_offset;
--         apex_application_install.set_application_alias( 'F' || apex_application_install.get_application_id );
--     end;
--     /
--  
--     @f645.sql
--
-- ## Import Application into Different Workspace using Different Schema
--
-- To import this application into the FRED_PROD workspace on the production instance,
-- using schema FREDDY, and the workspace ID of FRED_DEV and FRED_PROD are different:
--
--     begin
--         apex_application_install.set_workspace('FRED_PROD');
--         apex_application_install.generate_offset;
--         apex_application_install.set_schema( 'FREDDY' );
--         apex_application_install.set_application_alias( 'FREDPROD_APP' );
--     end;
--     /
--  
--     @f645.sql
--
-- ## Import into Training Instance for Three Different Workspaces
--
-- To import this application into the Training instance for 3 different workspaces:
--
--     begin
--         apex_application_install.set_workspace('TRAINING1');
--         apex_application_install.generate_application_id;
--         apex_application_install.generate_offset;
--         apex_application_install.set_schema( 'STUDENT1' );
--         apex_application_install.set_application_alias( 'F' || apex_application_install.get_application_id );
--     end;
--     /
--  
--     @f645.sql
--
--     begin
--         apex_application_install.set_workspace('TRAINING2');
--         apex_application_install.generate_application_id;
--         apex_application_install.generate_offset;
--         apex_application_install.set_schema( 'STUDENT2' );
--         apex_application_install.set_application_alias( 'F' || apex_application_install.get_application_id );
--     end;
--     /
--  
--     @f645.sql
--
--     begin
--         apex_application_install.set_workspace('TRAINING3');
--         apex_application_install.generate_application_id;
--         apex_application_install.generate_offset;
--         apex_application_install.set_schema( 'STUDENT3' );
--         apex_application_install.set_application_alias( 'F' || apex_application_install.get_application_id );
--     end;
--     /
--  
--     @f645.sql
--------------------------------------------------------------------------------

--
--##############################################################################
-- Data Types: Import Data Types
--
-- The section describes import data types used by the APEX_APPLICATION_INSTALL package.
--##############################################################################
--
--------------------------------------------------------------------------------
-- Defines the kind of install files.
--
-- Note: The constant c_file_type_websheet is no longer used in APEX and is obsolete.
--
--------------------------------------------------------------------------------
subtype t_file_type is pls_integer range 1 .. 5;
c_file_type_workspace           constant t_file_type := 1;
c_file_type_app                 constant t_file_type := 2;
c_file_type_websheet            constant t_file_type := 3; 
c_file_type_plugin              constant t_file_type := 4;
c_file_type_css                 constant t_file_type := 5;
--------------------------------------------------------------------------------
-- Define the kind of application usage.
--------------------------------------------------------------------------------
subtype t_app_usage is pls_integer range 1..3;
c_app_usage_not_used            constant t_app_usage := 1;
c_app_usage_current_workspace   constant t_app_usage := 2;
c_app_usage_other_workspace     constant t_app_usage := 3;

--------------------------------------------------------------------------------
-- Specifies information in a source file that can be used to configure the installation.
--------------------------------------------------------------------------------
type t_file_info is record (
     file_type          t_file_type,
     workspace_id       number,
     version            varchar2(10),
     app_id             number,
     app_name           varchar2(4000),
     app_alias          varchar2(4000),
     app_owner          varchar2(4000),
     build_status       varchar2(4000),
     has_install_script boolean,
     app_id_usage       t_app_usage,
     app_alias_usage    t_app_usage );

--==============================================================================
-- Use this function to set the workspace ID for the application to be imported.
--
-- Parameters:
-- * p_workspace_id: The workspace ID.
--
-- Example:
--
-- For examples of this procedure call, see "Import Application into Different
-- Workspace using Different Schema" and "Import into Training Instance for Three Different Workspaces".
--
-- See Also:
-- SET_WORKSPACE
-- GET_WORKSPACE_ID
-- Import Script Examples
--==============================================================================
procedure set_workspace_id(
    p_workspace_id in number );
--
--==============================================================================
-- This function is used to set the workspace ID for the application to be imported.
--
-- Parameters:
-- * p_workspace: The workspace name.
--
-- Example:
--
-- The following example sets the workspace ID for app 100 to workspace FRED_PROD.
--  
--     begin
--         apex_application_install.set_workspace (
--             p_workspace => 'FRED_PROD' );
--     end;
--     /
--     @f100.sql 
--
-- See Also:
-- GET_WORKSPACE_ID
-- SET_WORKSPACE_ID
--==============================================================================
procedure set_workspace (
    p_workspace in varchar2 );
--
--==============================================================================
-- Use this function to get the workspace ID for the application to be imported.
--
-- Example:
--
-- The following example returns the value of the workspace ID value in the
-- APEX_APPLICATION_INSTALL package.
--
--     declare
--         l_workspace_id number;
--     begin
--         l_workspace_id := apex_application_install.get_workspace_id;
--     end;
--
-- See Also:
-- SET_WORKSPACE_ID
-- SET_WORKSPACE
--==============================================================================
function get_workspace_id
    return number;
--
--==============================================================================
-- Use this procedure to set the application ID of the application to be imported.
-- The application ID should either not exist in the instance or, if it does exist,
-- must be in the workspace where the application is being imported to. This number
-- must be a positive integer and must not be from the reserved range of
-- Oracle APEX application IDs.
--
-- Parameters:
-- * p_application_id: This is the application ID. The application ID must be
--                     a positive integer, and cannot be in the reserved range of
--                     application IDs (3000 - 8999). It must be less than 3000
--                     or greater than or equal to 9000.
--
-- Example:
--
-- For an example of this procedure call, see "Import Application with Specified Application ID."
--
-- See Also:
-- GENERATE_APPLICATION_ID
-- Import Script Examples
-- GET_APPLICATION_ID
--==============================================================================
procedure set_application_id(
    p_application_id in number );
--
--==============================================================================
-- Use this function to get the application ID of the application to be imported.
-- The application ID should either not exist in the instance or, if it does exist,
-- must be in the workspace where the application is being imported to.
--
-- Example:
--
-- The following example returns the value of the application ID value in the
-- APEX_APPLICATION_INSTALL package.
--
--     declare
--         l_id number;
--     begin
--         l_id := apex_application_install.get_application_id;
--     end;
--
-- See Also:
-- SET_APPLICATION_ID
-- GENERATE_APPLICATION_ID
--==============================================================================
function get_application_id
    return number;
--
--==============================================================================
-- This procedure generates an available application ID on the instance and sets
-- the application ID in APEX_APPLICATION_INSTALL.
--
-- Example:
--
-- For an example of this procedure call, see "Import Application with Generated Application ID"
-- and "Import into Training Instance for Three Different Workspaces".
--
-- See Also:
-- SET_APPLICATION_ID
-- Import Script Examples
-- GET_APPLICATION_ID
--==============================================================================
procedure generate_application_id;
--
--==============================================================================
-- This procedure sets the offset value used during application import. Use the
-- offset value to ensure that the metadata for the Oracle APEX application
-- definition does not collide with other metadata on the instance. For a new
-- application installation, it is usually sufficient to call the GENERATE_OFFSET
-- procedure to have Oracle APEX generate this offset value for you.
--
-- Parameters:
-- * p_offset: The offset value. The offset must be a positive integer. In most
--             cases you do not need to specify the offset, and instead, call
--             GENERATE_OFFSET, which generates a large random value and then
--             sets it in the APEX_APPLICATION_INSTALL package.
--
-- Example:
--
-- The following example generates a random number from the database and uses
-- this as the offset value for app 100.
--
--     declare
--         l_offset number;
--     begin
--         l_offset := sys.dbms_random.value(100000000000, 999999999999);
--         apex_application_install.set_offset( p_offset => l_offset );
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_OFFSET
-- GENERATE_OFFSET
--==============================================================================
procedure set_offset(
    p_offset in number );
--
--==============================================================================
-- This procedure generates the offset value used during application import.
-- Use the offset value to ensure that the metadata for the Oracle APEX
-- application  definition does not collide with other metadata on the instance.
-- For a new application installation, it is usually sufficient to call this
-- procedure to have Oracle APEX generate this offset value for you.
--
-- Example:
--
-- For examples of this procedure call, see "Import Application with Specified Application ID",
-- "Import Application with Generated Application ID" and
-- "Import into Training Instance for Three Different Workspaces".
--
-- See Also:
-- GET_OFFSET
-- Import Script Examples
-- SET_OFFSET
--==============================================================================
procedure generate_offset;
--
--==============================================================================
-- Use function to get the offset value used during the import of an application.
--
-- Example:
--
-- The following example returns the value of the application offset value in the
-- APEX_APPLICATION_INSTALL package.
--
--     declare
--         l_offset number;
--     begin
--         l_offset := apex_application_install.get_offset;
--     end;
--
-- See Also:
-- SET_OFFSET
-- GENERATE_OFFSET
--==============================================================================
function get_offset
    return number;
--
--==============================================================================
-- Use this procedure to set the parsing schema (`owner`) of the Oracle APEX
-- application. The database user of this schema must already exist, and this
-- schema name must already be mapped to the workspace used to import the application.
--
-- Example:
--
-- For examples of this procedure call, see "Import Application into Different Workspace using Different Schema"
-- and "Import into Training Instance for Three Different Workspaces".
--
-- See Also:
-- GET_SCHEMA
-- Import Script Examples
--==============================================================================
procedure set_schema(
    p_schema in varchar2 );
--
--==============================================================================
-- Use this function to get the parsing schema (`owner`) of the Application
-- Express application.
--
-- Example:
--
-- The following example returns the value of the application schema in the
-- APEX_APPLICATION_INSTALL package.
--
--     declare
--         l_schema varchar2(30);
--     begin
--         l_schema := apex_application_install.get_schema;
--     end;
--
-- See Also:
-- SET_SCHEMA
--==============================================================================
function get_schema
    return varchar2;
--
--==============================================================================
-- This procedure sets the application name of the application to be imported.
--
-- Parameters:
-- * p_application_name: This is the application name. The application name cannot
--                       be null and cannot be longer than 255 characters.
--
-- Example:
--
--The following example sets the application name for app 100 to "Executive Dashboard."
--
--     begin
--         apex_application_install.set_application_name( p_application_name => 'Executive Dashboard' );
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_APPLICATION_NAME
--==============================================================================
procedure set_application_name(
    p_application_name in varchar2 );
--
--==============================================================================
-- This function gets the application name of the import application.
--
-- Example:
--
-- The following example returns the value of the application name value in the
-- APEX_APPLICATION_INSTALL package.
--
--     declare
--         l_application_name varchar2(255);
--     begin
--         l_application_name := apex_application_install.get_application_name;
--     end;
--
-- See Also:
-- SET_APPLICATION_NAME
--==============================================================================
function get_application_name
    return varchar2;
--
--==============================================================================
-- This procedure sets the application alias for the application to be imported.
-- This is only used if the application to be imported has an alias specified.
-- An application alias must be unique within a workspace and it is recommended
-- to be unique within an instance.
--
-- Parameters:
-- * p_application_alias: The application alias. The application alias is an
--                        alphanumeric identifier. It cannot exceed 255 characters,
--                        must be unique within a workspace and, ideally, is unique
--                        within an entire instance.
--
-- Example:
--
-- For examples of this procedure call, see "Import Application with Specified Application ID",
-- "Import Application with Generated Application ID",
-- "Import Application into Different Workspace using Different Schema" and
-- "Import into Training Instance for Three Different Workspaces."
--
-- See Also:
-- GET_APPLICATION_ALIAS
-- Import Script Examples
--==============================================================================
procedure set_application_alias(
    p_application_alias in varchar2 );
--
--==============================================================================
-- This function gets the application alias for the application to be imported.
-- This is only used if the application to be imported has an alias specified.
-- An application alias must be unique within a workspace and it is recommended
-- to be unique within an instance.
--
-- Example:
--
-- The following example returns the value of the application alias value in the
-- APEX_APPLICATION_INSTALL package. The application alias cannot be more than
-- 255 characters.
--
--     declare
--         l_alias varchar2(255);
--     begin
--         l_alias := apex_application_install.get_application_alias;
--     end;
--
-- See Also:
-- SET_APPLICATION_ALIAS
--==============================================================================
function get_application_alias
    return varchar2;
--
--==============================================================================
-- This procedure sets the image prefix of the import application. Most Application
-- Express instances use the default image prefix of `/i/`.
--
-- Parameters:
-- * p_image_prefix: The image prefix. It can be a fully qualified domain, like
--                   a CDN or another web server, or just a path.
--
-- Example:
--
-- The following example sets the value of the image prefix attribute for app 100 to /i/.
--
--     begin
--       apex_application_install.set_image_prefix( p_image_prefix => '/i/' );
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_IMAGE_PREFIX
--==============================================================================
procedure set_image_prefix(
    p_image_prefix in varchar2 );
--
--==============================================================================
-- This function gets the image prefix of the import application. Most Application
-- Express instances use the default image prefix of `/i/`.
--
-- Example:
--
-- The following example returns the value of the application image prefix in the
-- APEX_APPLICATION_INSTALL package. The application image prefix cannot be more
-- than 255 characters.
--
--     declare
--         l_image_prefix varchar2(255);
--     begin
--         l_image_prefix := apex_application_install.get_image_prefix;
--     end;
--
-- See Also:
-- SET_IMAGE_PREFIX
--==============================================================================
function get_image_prefix
    return varchar2;
--
--==============================================================================
-- Use this procedure to set the proxy server attributes of an application to be imported.
--
-- Parameters:
-- * p_proxy:            The proxy server. There is no default value. The proxy
--                       server cannot be more than 255 characters and should
--                       not include any protocol prefix such as
--                       http://. A sample value might be: `www-proxy.example.com`
-- * p_no_proxy_domains: Comma delimited list of domains for which the proxy server should
--                       not be used. The default value is null.
--
-- Example:
--
-- The following example sets the value of the proxy attribute for app 100 to www-proxy.example.com.
--
--     begin
--         apex_application_install.set_proxy( p_proxy => 'www-proxy.example.com' );
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_PROXY
-- GET_NO_PROXY_DOMAINS
--==============================================================================
procedure set_proxy(
    p_proxy            in varchar2,
    p_no_proxy_domains in varchar2 default null );
--
--==============================================================================
-- Use this function to get the proxy server attribute of an application to be imported.
--
-- Example:
--
-- The following example returns the value of the proxy server attribute in the
-- APEX_APPLICATION_INSTALL package. The proxy server attribute cannot be more
-- than 255 characters.
--
--     declare
--         l_proxy varchar2(255);
--     begin
--         l_proxy := apex_application_install.get_proxy;
--     end;
--
-- See Also:
-- SET_PROXY
--==============================================================================
function get_proxy
    return varchar2;
--
--==============================================================================
-- Use this function to get the no proxy domains attribute of an application to be imported.
--
-- Returns:
-- Comma delimited list of domains for which the proxy server should not be used.
--
-- Example:
--     declare
--         l_no_proxy_domains varchar2(255);
--     begin
--         l_no_proxy_domains := apex_application_install.get_no_proxy_domains;
--     end;
--
-- See Also:
-- SET_PROXY
--==============================================================================
function get_no_proxy_domains
    return varchar2;
--
--==============================================================================
-- Use this procedure to set the Base URL and the HTTPS Host attributes for remote
-- servers of the imported application. Remote Servers are identified by their Static ID.
--
-- Parameters:
-- * p_static_id:        Static ID to reference the remote server object.
-- * p_base_url:         New Base URL to use for this remote server object.
-- * p_https_host:       New HTTPS Host Property to use for this remote server object.
--                       Only relevant when the base URL is https:// and the database
--                       version is 12.2 or greater.
-- * p_default_database: default database to use when connecting. Currently only supported
--                       for MySQL databases.
-- * p_mysql_sql_modes:  SQL modes to use when connecting to a MySQL database.
-- * p_ai_model_name:    The AI model to use when requesting a response from a Generative AI Service.
-- * p_ai_http_headers:  HTTP headers to use when making a request to a Generative AI Service.
-- * p_ai_attributes:    Attributes in JSON format to use when making a request to a Generative AI Service.
--
-- Example:
--
--     begin
--         apex_application_install.set_remote_server(
--             p_static_id => 'MY_REMOTE_SERVER',
--             p_base_url => 'http://production.example.com' );
--     end;
--
-- See Also:
-- GET_REMOTE_SERVER_BASE_URL
-- GET_REMOTE_SERVER_HTTPS_HOST
-- GET_REMOTE_SERVER_DEFAULT_DB
-- GET_REMOTE_SERVER_SQL_MODE
-- GET_REMOTE_SERVER_AI_MODEL
-- GET_REMOTE_SERVER_AI_HEADERS
-- GET_REMOTE_SERVER_AI_ATTRS
--==============================================================================
procedure set_remote_server(
    p_static_id        in varchar2,
    p_base_url         in varchar2,
    p_https_host       in varchar2 default null,
    --
    p_default_database in varchar2 default null,
    p_mysql_sql_modes  in varchar2 default null,
    --
    p_ords_timezone    in varchar2 default null,
    --
    p_ai_model_name    in varchar2 default null,
    p_ai_http_headers  in clob     default null,
    p_ai_attributes    in clob     default null );
--
--==============================================================================
-- Use this function to get the Base URL property to be used for a given remote
-- server during application import.
--
-- Parameters:
-- * p_static_id: Static ID to reference the remote server object.
--
-- Example:
--
--     declare
--         l_base_url varchar2(255);
--     begin
--         l_base_url := apex_application_install.get_remote_server_base_url( 'MY_REMOTE_SERVER' );
--     end;
--
-- See Also:
-- SET_REMOTE_SERVER
--==============================================================================
function get_remote_server_base_url(
    p_static_id in varchar2 )
    return varchar2;
--
--==============================================================================
-- Use this function to get the HTTPS Host property to be used for a given remote
-- server during application import.
--
-- Parameters:
-- * p_static_id: Static ID to reference the remote server object.
--
-- Example:
--
--     declare
--         l_https_host varchar2(255);
--     begin
--         l_https_host := apex_application_install.get_remote_server_https_host( 'MY_REMOTE_SERVER' );
--     end;
--
-- See Also:
-- SET_REMOTE_SERVER
--==============================================================================
function get_remote_server_https_host(
    p_static_id in varchar2 )
    return varchar2;
--
--==============================================================================
-- Use this function to get the default database to be used for a given remote
-- server during application import.
--
-- Parameters:
-- * p_static_id: Static ID to reference the remote server object.
--
-- Example:
--
--     declare
--         l_default_database varchar2(255);
--     begin
--         l_default_database := apex_application_install.get_remote_server_default_db( 'MY_REMOTE_SERVER' );
--     end;
--
-- See Also:
-- SET_REMOTE_SERVER
--==============================================================================
function get_remote_server_default_db(
    p_static_id in varchar2 )
    return varchar2;
--
--==============================================================================
-- Use this function to get the SQL mode to be used for a given remote MySQL
-- server during application import.
--
-- Parameters:
-- * p_static_id: Static ID to reference the remote server object.
--
-- Example:
--
--     declare
--         l_default_database varchar2(255);
--     begin
--         l_default_database := apex_application_install.get_remote_server_sql_mode( 'MY_REMOTE_SERVER' );
--     end;
--
-- See Also:
-- SET_REMOTE_SERVER
--==============================================================================
function get_remote_server_sql_mode(
    p_static_id in varchar2 )
    return varchar2;

--
--==============================================================================
-- Use this function to get the AI model name property to be used for a given remote
-- server during application import.
--
-- Parameters:
-- * p_static_id: Static ID to reference the remote server object.
--
-- Example:
--
--     declare
--         l_ai_model varchar2(255);
--     begin
--         l_ai_model := apex_application_install.get_remote_server_ai_model( 'MY_REMOTE_SERVER' );
--     end;
--
-- See Also:
-- SET_REMOTE_SERVER
--==============================================================================
function get_remote_server_ai_model(
    p_static_id in varchar2 )
    return varchar2;

--
--==============================================================================
-- Use this function to get the AI HTTP Headers property to be used for a given remote
-- server during application import.
--
-- Parameters:
-- * p_static_id: Static ID to reference the remote server object.
--
-- Example:
--
--     declare
--         l_ai_http_headers clob;
--     begin
--         l_ai_http_headers := apex_application_install.get_remote_server_ai_headers( 'MY_REMOTE_SERVER' );
--     end;
--
-- See Also:
-- SET_REMOTE_SERVER
--==============================================================================
function get_remote_server_ai_headers(
    p_static_id in varchar2 )
    return clob;

--
--==============================================================================
-- Use this function to get the AI attributes property to be used for a given remote
-- server during application import.
--
-- Parameters:
-- * p_static_id: Static ID to reference the remote server object.
--
-- Example:
--
--     declare
--         l_ai_attributes clob;
--     begin
--         l_ai_attributes := apex_application_install.get_remote_server_ai_attrs( 'MY_REMOTE_SERVER' );
--     end;
--
-- See Also:
-- SET_REMOTE_SERVER
--==============================================================================
function get_remote_server_ai_attrs(
    p_static_id in varchar2 )
    return clob;
    
--
--==============================================================================
-- Internal:
--==============================================================================
function get_remote_server_ords_tz(
    p_static_id in varchar2 )
    return varchar2;
--
--==============================================================================
-- This procedure sets the automatic install of supporting objects value used
-- during application import. This setting is valid only for command line installs.
-- If the value is set to TRUE and the application export contains supporting
-- objects, it automatically installs or upgrades the supporting objects when
-- an application is imported from the command line.
--
-- Parameters:
-- * p_auto_install_sup_obj: The automatic install of supporting objects. BOOLEAN value.
--
-- Example:
--
-- The following example enables the automatic installation of supporting objects 
-- for app 100.
--
--     begin
--         apex_application_install.set_auto_install_sup_obj(
--             p_auto_install_sup_obj => true );
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_AUTO_INSTALL_SUP_OBJ
--==============================================================================
procedure set_auto_install_sup_obj(
    p_auto_install_sup_obj in boolean );
--
--==============================================================================
-- Use this function to get the automatic install of supporting objects setting
-- used during the import of an application. This setting is valid only for
-- command line installs. If the setting is set to TRUE and the application export
-- contains supporting objects, it automatically installs or upgrades the supporting
-- objects when an application is imported from the command line.
--
-- Example:
--
-- The following example returns the value of the automatic install of supporting
-- objects setting in the APEX_APPLICATION_INSTALL package.
--
--     declare
--         l_auto_install_sup_obj boolean;
--     begin
--         l_auto_install_sup_obj := apex_application_install.get_auto_install_sup_obj;
--     end;
--
-- See Also:
-- SET_AUTO_INSTALL_SUP_OBJ
--==============================================================================
function get_auto_install_sup_obj
    return boolean;
--
--==============================================================================
-- Internal:
-- Static Application File Prefix
--
-- See Also:
-- GET_STATIC_APP_FILE_PREFIX
--==============================================================================
procedure set_static_app_file_prefix(
    p_file_prefix in varchar2 );
--
--==============================================================================
-- Internal:
--
-- See Also:
-- SET_STATIC_APP_FILE_PREFIX
--==============================================================================
function get_static_app_file_prefix
    return varchar2;
--
--==============================================================================
-- Internal:
-- Static Theme File Prefix
--
-- See Also:
-- GET_STATIC_THEME_FILE_PREFIX
--==============================================================================
procedure set_static_theme_file_prefix(
    p_theme_number in number,
    p_file_prefix  in varchar2 );
--
--==============================================================================
-- Internal:
--
-- See Also:
-- SET_STATIC_THEME_FILE_PREFIX
--==============================================================================
function get_static_theme_file_prefix(
    p_theme_number in number )
    return varchar2;
--
--==============================================================================
-- Internal:
-- Static Plugin File Prefix
--
-- See Also:
-- GET_STATIC_PLUGIN_FILE_PREFIX
--==============================================================================
procedure set_static_plugin_file_prefix(
    p_plugin_type in varchar2,
    p_plugin_name in varchar2,
    p_file_prefix in varchar2 );
--
--==============================================================================
-- Internal:
--
-- See Also:
-- SET_STATIC_PLUGIN_FILE_PREFIX
--==============================================================================
function get_static_plugin_file_prefix(
    p_plugin_type in varchar2,
    p_plugin_name in varchar2 )
    return varchar2;
--
--==============================================================================
-- This procedure preserves sessions associated with the application on upgrades.
--
-- Parameters
-- * p_keep_sessions: FALSE is the default value. TRUE if sessions should be preserved,
--                    FALSE if they should be deleted.
--                    The instance parameter `KEEP_SESSIONS_ON_UPGRADE` controls
--                    the default behavior. If it is `N` (the default), sessions
--                    will be deleted. This instance parameter can be manipulated 
--                    via the `APEX_INSTANCE_ADMIN` API.
--
-- Example
--
-- The following example installs application 100 in workspace `FRED_PROD` and keeps
-- session state.
--
--     begin
--         apex_application_install.set_workspace(p_workspace => 'FRED_PROD');
--         apex_application_install.set_keep_sessions(p_keep_sessions => true);
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_KEEP_SESSIONS
-- APEX_INSTANCE_ADMIN
--==============================================================================
procedure set_keep_sessions (
    p_keep_sessions in boolean );
--
--==============================================================================
-- This function finds out if sessions and session state will be preserved or
-- deleted on upgrades.
--
-- Example:
--
-- The following example shows whether print sessions will be kept or deleted.
--
--     begin
--         sys.dbms_output.put_line (
--             case when apex_application_install.get_keep_sessions 
--                  then 'sessions will be kept'
--             else 'sessions will be deleted'
--             end );
--     end;
--
-- See Also:
-- SET_KEEP_SESSIONS
--==============================================================================
function get_keep_sessions
    return boolean;
--
--==============================================================================
-- This procedure preserves background executions associated with the application 
-- on upgrades.
--
-- Parameters:
-- * p_keep_background_execs: TRUE if background executions should be kept,
--                            FALSE if they should be deleted.
--
-- Example:
--
-- The following example installs application 100 in workspace `FRED_PROD` and keeps
-- background executions.
--
--     begin
--         apex_application_install.set_workspace(p_workspace => 'FRED_PROD');
--         apex_application_install.set_keep_background_execs(p_keep_background_execs => true);
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_KEEP_BACKGROUND_EXECS
--==============================================================================
procedure set_keep_background_execs (
    p_keep_background_execs in boolean );
--
--==============================================================================
-- This function checks if background executions will be preserved or
-- deleted on upgrades. Defaults to false, which means that all background executions
-- will be aborted and deleted on application upgrade.
--
-- Example:
--
-- The following example shows whether background executions will be kept or deleted.
--
--     begin
--         sys.dbms_output.put_line (
--             case when apex_application_install.get_keep_background_execs 
--                  then 'background executions will be kept'
--             else 'background executions will be deleted'
--             end );
--     end;
--
-- See Also:
-- SET_KEEP_BACKGROUND_EXECS
--==============================================================================
function get_keep_background_execs
    return boolean;
--
--==============================================================================
-- Suspends background page processing for an application. To be used before 
-- upgrade. When background execution is suspended for an application, new
-- executions can be enqueued, but are not executed, until the lock is released.
-- This procedure allows to gracefully perform an application upgrade by first
-- allowing all SCHEDULED or EXECUTING background executions to complete.
--
-- The lock is released when the transaction ends, with a COMMIT or
-- ROLLBACK operation.
--
-- Parameters:
-- * p_application_id: The application ID.
-- 
-- Example:
--     begin
--         apex_application_install.suspend_background_execs(
--             p_application_id => 100 );
--     end;
--=============================================================================
procedure suspend_background_execs(
    p_application_id     in number );
--
--==============================================================================
-- This procedure sets the maximum background processing jobs attribute of the 
-- application to be imported. 
--
-- Parameters:
-- * p_max_scheduler_jobs: Maximum number of background processing jobs for the 
--                         application to be imported. 
-- 
-- Example:
-- The following example sets the maximum number of background processing jobs 
-- for app 100 to 5.
--
--     begin
--         apex_application_install.set_max_scheduler_jobs(
--             p_max_scheduler_jobs => 5 );
--     end;
--     /
--     @f100.sql
--       
-- See Also:
-- GET_MAX_SCHEDULER_JOBS
--==============================================================================
procedure set_max_scheduler_jobs(
    p_max_scheduler_jobs in number );
--
--==============================================================================
-- Use this function to get the maximum background processing jobs attribute
-- during application import.
--
-- Example:
--
--     declare
--         l_max_scheduler_jobs number;
--     begin
--         l_max_scheduler_jobs := apex_application_install.get_max_scheduler_jobs;
--     end;
--
-- See Also:
-- SET_MAX_SCHEDULER_JOBS
--==============================================================================
function get_max_scheduler_jobs return number;
--
--==============================================================================
-- Use this procedure to override the active authentication scheme for the
-- applications that are about to be installed.
--
-- Parameters:
-- * p_name: The name of the authentication scheme to be activated. This new
--           authentication scheme must exist in the application. If null,
--           the active authentication scheme will remain unchanged.
--
-- Example:
--
-- Activate authentication scheme `SSO-Production` and install application
-- `f100.sql`, then reset the override for `f101.sql` to keep its active scheme.
--
--     begin
--         apex_application_install.set_authentication_scheme (
--             p_name => 'SSO-Production' );
--     end;
--     /
--     @f100.sql
--     begin
--         apex_application_install.set_authentication_scheme (
--             p_name => null );
--     end;
--     /
--     @f101.sql
--
-- See Also:
-- GET_AUTHENTICATION_SCHEME
--==============================================================================
procedure set_authentication_scheme (
    p_name in varchar2 );
--
--==============================================================================
-- Use this function to retrieve the authentication scheme name that should
-- override the default.
--
-- Example:
--
-- Print the authentication scheme override
--
--     select apex_application_install.get_authentication_scheme 
--       from sys.dual;
--
-- See Also:
-- SET_AUTHENTICATION_SCHEME
--==============================================================================
function get_authentication_scheme
    return varchar2;
--
--==============================================================================
-- Use this procedure to set the REST Source Catalog group which a new REST
-- Source Catalog should be imported into.
--
-- Parameters:
-- * p_name: The name of the REST Source Catalog Group. That Group must
--           exist in the workspace.
--
-- Example:
--
-- Set the Catalog group to "Financial Services Catalogs". REST Source Catalogs will
-- be imported into this group.
--
--     begin
--         apex_application_install.set_rest_source_catalog_group (
--             p_name => 'Financial Services Catalogs' );
--     end;
--     /
--     @rest-service-catalog-financial.sql
--
-- See Also:
-- GET_REST_SOURCE_CATALOG_GROUP
--==============================================================================
procedure set_rest_source_catalog_group (
    p_name in varchar2 );
--
--==============================================================================
-- Use this function to retrieve the name of REST Source Catalog Group which
-- new catalogs will be imported into.
--
-- Example:
--
-- Print the REST Source Catalog Group override
--
--     select apex_application_install.get_rest_source_catalog_group 
--       from sys.dual;
--
-- See Also:
-- SET_REST_SOURCE_CATALOG_GROUP
--==============================================================================
function get_rest_source_catalog_group
    return varchar2;
--
--==============================================================================
-- Use this function to override the build status for applications that are about
-- to be installed.
--
-- Parameters:
-- * p_build_status: New build status to set application to. Values include:
--                   - apex_application_admin.c_build_status_run_and_build
--                     Developers and users can both run and develop the application.
--                   - apex_application_admin.c_build_status_run_only
--                     Users can only run the application.
--                     Developers cannot edit the application.
--
-- Example:
--
-- The following example sets build status for app 100 to run only.
--
--     begin
--         apex_application_install.set_build_status (
--             p_build_status => apex_application_admin.c_build_status_run_only );
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_BUILD_STATUS
--==============================================================================
procedure set_build_status (
    p_build_status in wwv_flow_application_admin_api.t_build_status );
--
--==============================================================================
-- Use this function to retrieve the build status that should override the default.
--
-- Example:
--
-- The following example prints the build status override.
--
--     select apex_application_install.get_build_status 
--       from sys.dual;
--
-- See Also:
-- SET_BUILD_STATUS
--==============================================================================
function get_build_status
    return varchar2;
--
--==============================================================================
-- Use this function to override the pass ECID attribute for applications that 
-- are about to be installed.
--
-- Parameters:
-- * p_pass_ecid:    New pass ECID value to set application to. Values include:
--                   - true:  Pass the Execution Context ID (ECID) to the 
--                            external web services for end-to-end tracing.
--                   - false: Do not pass the Execution Context ID.
--
-- Example:
--
-- The following example sets "Pass ECID" to true for appplication 100.
--
--     begin
--         apex_application_install.set_pass_ecid (
--             p_pass_ecid => true );
--     end;
--     /
--     @f100.sql
--
-- See Also:
-- GET_PASS_ECID
--==============================================================================
procedure set_pass_ecid (
    p_pass_ecid in boolean );
--
--==============================================================================
-- Use this function to retrieve the pass ECID attribute value that overrides
-- the default.
--
-- See Also:
-- SET_PASS_ECID
--==============================================================================
function get_pass_ecid
    return boolean;
--
--==============================================================================
-- Use this function to override the Theme ID attribute for Template Components
-- that are about to be installed.
--
-- Parameters:
-- * p_theme_id:        New Theme ID value to install the Template Component. 
--
-- Example:
--
-- The following example sets "Theme ID" to 42.
--
--     begin
--         apex_application_install.set_theme_id (
--             p_theme_id => 42 );
--     end;
--     /
--     @plugin.sql
--
-- See Also:
-- GET_THEME_ID
--==============================================================================
procedure set_theme_id (
    p_theme_id in number );
--
--==============================================================================
-- Use this function to retrieve the Theme ID value that overrides
-- the default.
--
-- Example:
--
-- The following example prints the theme ID override.
--
--     select apex_application_install.get_theme_id 
--       from sys.dual;
--
-- See Also:
-- SET_THEME_ID
--==============================================================================
function get_theme_id
    return number;
--
--==============================================================================
-- This procedure clears all values currently maintained in the
-- APEX_APPLICATION_INSTALL package.
--
-- Example:
--
-- The following example clears all values currently set by the
-- APEX_APPLICATION_INSTALL package.
--
--     begin
--         apex_application_install.clear_all;
--     end;
--==============================================================================
procedure clear_all;
--
--==============================================================================
-- Use this function to retrieve install information from a source file.
--
-- Parameters:
-- * p_source: The source code, a table of (name, contents) with a single record
--             for normal APEX applications or multiple records for applications
--             that were split when exporting. Note that passing multiple
--             applications is not supported.
--
-- Returns:
--
-- This function returns information about the application that can be used to
-- configure the installation.
--
-- Raises:
-- * WWV_FLOW_IMP_PARSER.RUN_STMT_ERROR: The source contains invalid statements.
--
-- Example:
--
-- The following example fetches an application from a remote URL and prints its
-- install information.
--```
-- declare
--     l_source apex_t_export_files;
--     l_info   apex_application_install.t_file_info;
-- begin
--     l_source := apex_t_export_files (
--                     apex_t_export_file (
--                         name     => 'f100.sql',
--                         contents => apex_web_service.make_rest_request (
--                                         p_url         => 'https://www.example.com/apps/f100.sql',
--                                         p_http_method => 'GET' )));
--     l_info   := apex_application_install.get_info (
--                     p_source => l_source );
--
--     sys.dbms_output.put_line (
--         apex_string.format (
--             p_message => q'~
--                          !Type ................. %0
--                          !Workspace ............ %1
--                          !Version .............. %2
--                          !App ID ............... %3
--                          !App Name ............. %4
--                          !Alias ................ %5
--                          !Owner ................ %6
--                          !Build Status ......... %7
--                          !Has Install Script ... %8
--                          !App ID Usage ......... %9
--                          !App Alias Usage ...... %10
--                          !~',
--             p0        => l_info.file_type,
--             p1        => l_info.workspace_id,
--             p2        => l_info.version,
--             p3        => l_info.app_id,
--             p4        => l_info.app_name,
--             p5        => l_info.app_alias,
--             p6        => l_info.app_owner,
--             p7        => l_info.build_status,
--             p8        => apex_debug.tochar(l_info.has_install_script),
--             p9        => l_info.app_id_usage,
--             p10       => l_info.app_alias_usage,
--             p_prefix  => '!' ));
-- end;
-- ```
-- See Also:
-- INSTALL
-- GET_APPLICATION
--==============================================================================
function get_info (
    p_source in wwv_flow_t_export_files )
    return t_file_info;
--
--==============================================================================
-- Use this procedure to install an application. Use the
-- `APEX_APPLICATION_INSTALL.SET`* procedures to configure installation parameters.
--
-- Parameters:
-- * p_source:             The source code, a table of (name, contents) with
--                         a single record for normal Oracle APEX
--                         applications or multiple records for applications that
--                         were split when exporting. Note that passing multiple
--                         applications is not supported. If NULL (the default),
--                         import the source that was previously passed to GET_INFO.
-- * p_overwrite_existing: If FALSE (the default), raise an error instead of
--                         overwriting an existing application.
--
-- Raises:
-- * WWV_FLOW_IMP_PARSER.RUN_STMT_ERROR:                The source contains invalid statements.
-- * SECURITY_GROUP_ID_INVALID:                         The current workspace conflicts with the install
--                                                      workspace.
-- * WWV_FLOW_API.FLOW_ID_RESERVED_FOR_OTHER_WORKSPACE: The application ID is used in another workspace.
-- * WWV_FLOW_API.FLOW_ID_RANGE_RESERVED:               The application ID is reserved for internal use.
-- * WWV_FLOW_API.FLOW_ID_OUT_OF_RANGE:                 The application ID used for installing is
--                                                      not in a valid range.
-- * APPLICATION_ID_RESERVED:                           The application ID is in use in the current workspace
--                                                      and p_overwrite_existing was set to false.
--
-- Example:
--
-- Fetch an application from a remote URL, then install it with a new ID
-- and new component ID offsets in workspace `EXAMPLE`.
--
--     declare
--         l_source apex_t_export_files;
--         l_info   apex_application_install.t_file_info;
--     begin
--         l_source := apex_t_export_files (
--             apex_t_export_file (
--                 name     => 'f100.sql',
--                 contents => apex_web_service.make_rest_request (
--                     p_url         => 'https://www.example.com/apps/f100.sql',
--                     p_http_method => 'GET' )));
--  
--         apex_util.set_workspace('EXAMPLE');
--         apex_application_install.generate_application_id;
--         apex_application_install.generate_offset;
--         apex_application_install.install (
--             p_source => l_source );
--     end;
--
-- See Also:
-- GET_INFO
-- GET_APPLICATION
--==============================================================================
procedure install (
    p_source             in wwv_flow_t_export_files default null,
    p_overwrite_existing in boolean                 default false );
--
--==============================================================================
-- This procedure removes an application from a workspace. Use the 
-- `APEX_APPLICATION_INSTALL.SET_%` procedures to configure parameters.
--
-- Parameters
-- * p_application_id: The ID of the application.
--
-- Raises:
-- * WWV_FLOW_API.DELETE_APP_IN_DIFFERENT_WORKSPACE: The application is not in this workspace.
-- * WWV_FLOW_API.FLOW_NOT_DELETED:                  The application was not deleted.
-- * WWV_FLOW.APP_NOT_FOUND_ERR:                     The application ID was not found.
--
-- Example:
--
-- The following example demonstrates how to use the REMOVE_APPLICATION procedure
-- to remove an application with an ID of 100 from a workspace.
--
--     begin
--         apex_application_install.set_workspace('EXAMPLE');
--         apex_application_install.set_keep_sessions(false);
--         apex_application_install.remove_application(100);
--     end;
--
-- See Also:
-- SET_WORKSPACE_ID
-- SET_WORKSPACE
-- SET_KEEP_SESSIONS
--==============================================================================
procedure remove_application (
    p_application_id in number );
--
--##############################################################################
-- Translation
--##############################################################################
--
--==============================================================================
-- Internal:
-- Publish Application
--==============================================================================
procedure publish_application (
    p_application_id        in number,
    p_language_code         in varchar2,
    p_new_translated_app_id in number   default null );
--

end wwv_flow_application_install;
/
show errors
