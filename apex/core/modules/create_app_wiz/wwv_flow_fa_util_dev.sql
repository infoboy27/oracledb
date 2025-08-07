set define off verify off
prompt ...wwv_flow_fa_util_dev
create or replace package wwv_flow_fa_util_dev as
--==============================================================================
-- Copyright (c) 2024, Oracle and/or its affiliates.
--
-- This package contains internal, development only, utilities to create and
-- configure integrations with Fusion (SaaS) Applications.
--
-- Modified:
--     ehjones    08/16/2024 - Created
--
--==============================================================================

--==============================================================================
-- Constants:
--==============================================================================

-- Name of the collection in which to cache a list of properly configured FA pods.
c_pod_cache_name constant varchar2(25) := 'WWV_FLOW_FA_POD_LIST';

-- Regular expression to detect database credentials which have been created
-- in the database and to which the APEX schema has access.
c_cred_regexp    constant varchar2(40) := '^APEX\$FA_([-\.A-Z0-9_]+)_CRED$';

--==============================================================================
-- Convert a free-text name, which may contain any characters, into something
-- which can be used as a static ID, for web credentials, data sources, and
-- other artifacts.
--
-- Parameters:
-- * p_name: The free-text name.
--
-- Returns:
-- The name, in upper case, with double quotes removed, anything non-alpha
-- numeric replaced with underscores, and duplicate underscores removed.
--==============================================================================
function to_static_id (
    p_name in varchar2 )
    return varchar2;

--==============================================================================
-- Returns true if the current environment is correctly configured to facilitate
-- Fusion Apps (FA) integrations. The checks to determine this are as follows;
-- 1. Database supports DBMS Credentials.
-- 2. Instance level INSTANCE_DBMS_CREDENTIAL_ENABLED parameter set to Y.
-- 3. Instance level AUTHENTICATION_SUBSTITUTIONS parameter is not null ...
-- 4. ... and is valid JSON.
-- 5. At least one database credential is accessible to the APEX schema, for
--    which Discovery URL and OAuth Scope entries existing the Authentication
--    Substitutions parameter value.
--==============================================================================
function is_fa_available
    return boolean;

--==============================================================================
-- Populate a collection with a list of FA pods for which there exists valid
-- configuration information, such as the Discover URL, OAuth Scope, and
-- optionally a Public URL
--
-- The collection attributes set are;
-- * c001 - Pod Name
-- * c002 - Discovery URL
-- * c003 - OAuth Scope
-- * c004 - Public URL
-- * c005 - Fusion Instance OCID
-- * c006 - IDCS Confidential App ID
--
-- Parameters:
-- * p_app_id:    The current application ID. This will be populated if we have
--                just created an FA-integrated application. In which case the
--                cache not need to be populated because the UI will just be
--                displaying a confirmation message.
-- * p_pod_count: A variable, or page item bind, which will be populated with
--                number of valid pods retrieved.
-- * p_coll_name: The name of the collection to populate. Defaults to
--                the `c_fa_pod_cache` constant.
--==============================================================================
procedure cache_pod_names (
    p_app_id    in            number,
    p_pod_count in out nocopy number,
    p_coll_name in            varchar2 default c_pod_cache_name );

--==============================================================================
-- Obtain the Public URL, if any, which was cached for this FA Pod.
--
-- Parameters:
-- * p_pod_name: The name of the pod for which to retrieve the Public URL.
--==============================================================================
function get_public_url (
    p_pod_name in varchar2 )
    return varchar2;

--==============================================================================
-- Get the base URL for an environment, from a public URL which may contain
-- additional path elements.
--
-- Parameters:
-- * p_public_url: The public URL of an FA environment. Which usually consists
--                 of an absolute URL to the Fusion home page.
--==============================================================================
function get_base_url (
    p_public_url in varchar2 )
    return varchar2;

--==============================================================================
-- Check that the FA base URL is accessible. Specifically; the Anti-CSRF token
-- endpoint, which should be present in all environments where REST API access
-- is enabled.
--
-- Parameters:
-- * p_base_url:   The URL to check. This will be modifed (and stripped of any
--                 additional path components after the host name) by this
--                 procedure.
-- * p_api_status: The HTTP status resulting from a call to the Anti-CSRF
--                 endpoint.
--==============================================================================
procedure check_base_url (
    p_base_url   in out nocopy varchar2,
    p_api_status in out nocopy varchar2 );

--==============================================================================
-- Returns the default status for the API check endpoint. Used to display
-- a message before the user has selected an FA enmvironment.
--==============================================================================
function get_default_api_status
    return varchar2;

--==============================================================================
-- Calculate the default properties of the application to be generated,
-- based on the Fusion Apps environment selected, and translatable messages.
--
-- Parameters:
-- * p_pod_name: The short name of the FA pod selected.
-- * p_app_name: Will be filled with the application name, from a translated message.
-- * p_app_alias: Will receive the default application alias, based on the pod name.
-- * p_app_id:    Defaults to the next available application ID.
--==============================================================================
procedure default_app_properties (
    p_pod_name   in            varchar2,
    p_app_name   in out nocopy varchar2,
    p_app_alias  in out nocopy varchar2,
    p_app_id     in out nocopy number,
    p_public_url in out nocopy varchar2 );

--==============================================================================
-- Check that the supplied application alias is valid.
--
-- Parameters:
-- * p_app_alias: The alias to check.
--
-- Returns:
-- `TRUE` if the supplied alias is valid, `FALSE` otherwise.
--==============================================================================
function is_app_alias_valid (
    p_app_alias in varchar2 )
    return boolean;

--==============================================================================
-- Return a random icon from the list of icons associated with the specified
-- app. Intended to be used from the Create App Wizard.
--
-- Parameters:
-- * p_lov_app_id: The app within which to look for the icons LOV.
--==============================================================================
function get_random_icon (
    p_lov_app_id in number )
    return varchar2;

--==============================================================================
-- Returns a random color's hex number from the list of values used by the create
-- app wizard.
--
-- Parameters:
-- * p_lov_app_id: The app within which to look for the colors LOV.
--==============================================================================
function get_random_color (
    p_lov_app_id in number )
    return varchar2;

--==============================================================================
-- Initialise the list of icons to be created with a new app.
--==============================================================================
procedure init_icons;

--==============================================================================
-- Save a single icon to the new app's internal list.
--
-- Intended to be called repeatedly from the page's `save_icon` Ajax callback
-- by the `apex.iconEditor.saveStockIcon` JavaScript method, as it creates
-- properly sized and formatted icons.
--
-- Parameters:
-- * p_name:  The name of the icon. Generally passed in the g_x01 global.
-- * p_image: The image data, in Base64 encoded format. Generally passed in the
--            g_clob_01 global.
--==============================================================================
procedure save_icon (
    p_name  in varchar2,
    p_image in clob );

--==============================================================================
-- Create a sample application which is pre-configured to integrate with
-- Oracle Fusion Applications.
--
-- Parameters:
-- * p_app_name:    Name of the application to create.
-- * p_app_alias:   Alias of the created application.
-- * p_fa_instance: Fusion Apps pod name with which this application will be
--                  integrated.
-- * p_language:    Language for the created app. Defaults to the browser's
--                  current language.
-- * p_theme_type:  Default theme type. Default is to use the Universal Theme.
-- * p_theme_style: Style, within theme, to use. Defaults to Redwood Light style.
-- * p_icon_name:   The name of the icon to use for the application, from the list
--                  of standard icons available in the Create Application wizard.
--                  Can be generated via the `random_icon` function.
-- * p_icon_color:  The hex value of the color to use for the application icon
--                  from the standard set of available colors. Can be generated
--                  using the `random_color` function.
-- * p_lov_app_id:  App within which the icon and color LOVs can be found.
--                  Generally this will be the calling app (4020) but the LOVs
--                  could move, or the procedure could be called from a different
--                  application.
-- * p_app_id:      ID to use for the created app. Defaults to the minimum
--                  free ID.
-- * p_schema:      Set the parsing schema of the created app. Defaults to the
--                  workspace's current default schema.
-- * p_base_url:    The URL which will be used to access the Fusion REST APIs.
--==============================================================================
procedure create_application (
    p_app_name      in varchar2,
    p_app_alias     in varchar2,
    p_fa_instance   in varchar2,
    p_language      in varchar2,
    p_theme_type    in varchar2,
    p_theme_style   in varchar2,
    p_icon_name     in varchar2,
    p_icon_color    in varchar2,
    p_lov_app_id    in number,
    p_app_id        in number    default wwv_flow_utilities.minimum_free_flow,
    p_schema        in varchar2  default wwv_flow_user_api.get_default_schema,
    p_base_url      in varchar2  default null );

--==============================================================================
-- Update the alias of an application based upon the naming convention for
-- Fusion Apps integrated apps. As defined by the FA_DEFAULT_APP_ALIAS text message.
--
-- Parameters:
-- * p_app_id:      The ID of the app to update.
-- * p_fa_instance: The short name of the Fusion pod with which the app is
--                  integrated.
--==============================================================================
procedure update_app_alias (
    p_app_id      in number,
    p_fa_instance in varchar2 );

--==============================================================================
-- Create a Remote Server to access the REST endpoints of a Fusion environment.
-- If an existing Remote Server, referencing the same Fusion instance already exists
-- then this procedure will _not_ update it. No validations will be performed
-- as to the validity of the supplied URL.
--
-- Parameters:
-- * p_fa_instance: The short name of the Fusion pod. This will be used for
--                  the name and static ID of the server, according to standard
--                  naming conventions.
-- * p_public_url:  The base URL of the Fusion REST endpoints. If this URL
--                  contains additional path components then those will be
--                  trimmed off before creating the server.
-- * p_static_id:   Will be set to the static ID of the remote server that was
--                  created.
--
--==============================================================================
procedure create_remote_server (
    p_fa_instance  in            varchar2,
    p_public_url   in            varchar2,
    p_static_id    in out nocopy varchar2 );

--==============================================================================
-- Create a Web Credential for the specified Fusion instance, referencing an
-- instance-level Database Credential, according to standard OCI naming
-- conventions. If an existing credential already exists for the given FA pod,
-- then this procedure will _not_ update it.
--
-- Parameters:
-- * p_fa_instance: The short name of the FA instance. The web credential will
--                  be created to access a database credential based on its
--                  name, derived from the FA instance name.
-- * p_static_id:   Will be set to the static ID of the Web Credential that
--                  was created.
--
--==============================================================================
procedure create_web_credential (
    p_fa_instance in            varchar2,
    p_static_id   in out nocopy varchar2 );

--==============================================================================
-- Create an authentication scheme, configured for federated single-sign-on
-- between APEX and Fusion. The scheme is named, and the web credentials accessed,
-- based on the name of the Fusion instance.
--
-- Parameters:
-- * p_app_id:       The identifier of the app to be updated.
-- * p_fa_instance:  Name of the Fusion instance. Other names are derived from this
--                   based on standard naming conventions.
-- * p_make_current: Should the newly created authentication scheme be made current
--                   for the specified app. Default is true.
--==============================================================================
procedure create_authentication_scheme (
    p_app_id       in number,
    p_fa_instance  in varchar2,
    p_make_current in boolean default true );

--==============================================================================
-- Add a REST data source, appropriate data profile, and operations.
--
-- Parameters:
-- * p_app_id:           The ID of the application to which to add the Data Source.
-- * p_name:             Name to use for the data source. If an existing data source
--                       has the same name then no changes will be made.
-- * p_static_id:        Returns the static ID of the data source that was created.
--                       Will be derived from the name provided.
-- * p_server_static_id: Static ID of the remote server to use.
-- * p_url_path:         Path, under the remote server base URL, where the API
--                       endpoint is located.
-- * p_cred_static_id:   Static ID of the Web Credential to use for authentiated
--                       calls to the API endpoint.
-- * p_resource_name:    Case-sensitive name of the root business object resource.
-- * p_row_selector:     Expression to select the collection of rows within the
--                       Data Source, typically a JSON array.
-- * p_columns:          Description of the columns to create, in the source's
--                       data profile, in the format of a JSON array.
--
--==============================================================================
procedure add_rest_data_source (
    p_app_id           in number,
    p_name             in varchar2,
    p_static_id        in out nocopy varchar2,
    p_server_static_id in varchar2,
    p_url_path         in varchar2,
    p_cred_static_id   in varchar2,
    p_resource_name    in varchar2,
    p_row_selector     in varchar2,
    p_columns          in sys.json_array_t );

--==============================================================================

end wwv_flow_fa_util_dev;
/
show errors
set define '^'
