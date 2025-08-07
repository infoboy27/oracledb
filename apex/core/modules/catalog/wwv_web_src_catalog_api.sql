set define '^' verify off
prompt ...wwv_web_src_catalog_api.sql
create or replace package wwv_web_src_catalog_api authid current_user as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
--
-- REST Source Catalog Public API package for import purposes. This
-- package will not be part of the APEX API documentation right now.
--
-- Since: 21.2
--
-- MODIFIED   (MM/DD/YYYY)
-- cczarski    06/25/2021 - Created

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------

subtype t_catalog_formats is varchar2(4);

c_catalog_format_apex constant t_catalog_formats := 'APEX';

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------

--==============================================================================
-- Creates a catalog group. This is typically called as part of a workspace
-- export/import operation where the workspace file contains catalog groups
-- as well as catalogs.
--
-- Parameters:
--
-- * p_id:             ID of the new catalog group
-- * p_name:           Name of the catalog group
-- * p_description:    Description for the catalog group
--==============================================================================
procedure create_catalog_group(
    p_id                            in number,
    p_name                          in varchar2,
    p_description                   in varchar2                 default null,
    --
    p_created_by                    in varchar2                 default null,
    p_created_on                    in date                     default null,
    p_updated_by                    in varchar2                 default null,
    p_updated_on                    in date                     default null );

--==============================================================================
-- Creates a catalog. If not running as part of a workspace import, the target
-- catalog group must be set using APEX_APPLICATION_INSTALL.SET_REST_SOURCE_CATALOG_GROUP.
--
-- Parameters:
--
-- * p_id:                              ID of the new catalog.
-- * p_catalog_group_id:                ID of the catalog group to add the new catalog to.
-- * p_name:                            Name of the catalog.
-- * p_internal_name:                   Internal Name of the catalog; this name is used to determine 
--                                      catalog identity across APEX instances and workspaces.
-- * p_description:                     Description for the catalog.
-- * p_endpoint_url:                    URL to refresh the catalog from.
-- * p_token_server_url:                If p_endpoint_url requires OAuth authentication, the URL of the
--                                      token server to use.
-- * p_proxy_server:                    Proxy server to use for catalog refresh.
--
-- * p_credential_name:                 Name of the Web Credential to use for catalog refresh.
-- * p_credential_static_id:            Static ID of the Web Credential to use for catalog refresh. If a 
--                                      credential with this static ID already exists in the workspace, the
--                                      existing Web Credential will be used for this new catalog.
-- * p_authentication_type:             Authentication Type to use for catalog refresh, if authentication is required.
-- * p_scope:                           Scope to use for OAuth catalog refresh authentication.
-- * p_client_id:                       Client ID or user name to use for catalog refresh authentication.
-- * p_namespace:                       Namespace (OCI Tenant ID) to use for "Native OCI" catalog refresh authentication.
-- * p_fingerprint:                     Public Key fingerprint to use for "Native OCI" catalog refresh authentication.
-- * p_valid_for_urls:                  If the Web Credential is being created a new, the list of URLs this credential
--                                      can be used for.
-- * p_prompt_on_install:               Whether to prompt for the Web Credential after import.
-- * p_credential_comment:              Developer comments for the Web Credential.
-- 
-- * p_format:                          File Format for Catalog Refresh operations; currently only "APEX" is supported.
-- * p_default_plugin_internal_name:    Default Plug-In for the REST Services in this Catalog.
-- * p_default_authentication_type:     Default Authentication Type for  the REST Services in this Catalog.
-- * p_version:                         Version of this Catalog.
--==============================================================================
procedure create_catalog(
    p_id                            in number,
    p_catalog_group_id              in number                   default null,
    p_name                          in varchar2,
    p_internal_name                 in varchar2,
    p_description                   in varchar2                 default null,
    --
    p_endpoint_url                  in varchar2                 default null,
    p_token_server_url              in varchar2                 default null,
    p_proxy_server                  in varchar2                 default null,
    --
    p_credential_name               in varchar2                 default null,
    p_credential_static_id          in varchar2                 default null,
    p_authentication_type           in varchar2                 default null,
    p_scope                         in varchar2                 default null,
    p_client_id                     in varchar2                 default null,
    p_namespace                     in varchar2                 default null,
    p_fingerprint                   in varchar2                 default null,
    p_valid_for_urls                in varchar2                 default null,
    p_prompt_on_install             in boolean                  default null,
    p_credential_comment            in varchar2                 default null,
    --
    p_format                        in varchar2                 default c_catalog_format_apex,
    p_default_plugin_internal_name  in varchar2                 default null,
    p_default_authentication_type   in varchar2                 default null,
    p_version                       in number                   default null,
    --
    p_created_by                    in varchar2                 default null,
    p_created_on                    in date                     default null,
    p_updated_by                    in varchar2                 default null,
    p_updated_on                    in date                     default null );

--==============================================================================
-- Creates a catalog service.
--
-- Parameters:
--
-- * p_id:                              ID of the new catalog service.
-- * p_catalog_id:                      ID of the catalog to add the new service to.
-- * p_name:                            Name of the catalog service.
-- * p_description:                     Description for the catalog service.
-- * 
-- * p_base_url:                        Server-Specific part of the endpoint URL of this catalog service. When creating 
--                                      a REST Data Source, this part will be used to determine the Remote Server object.
-- * p_service_path:                    Service-Specific part of the endpoint URL of this catalog service.
-- * p_auth_server_base_url:            Server-Specific part of the OAuth Token Server URL for this catalog service. When creating 
--                                      a REST Data Source, this part will be used to determine the Authentication Server.
-- * p_auth_server_url_path:            Service-Specific part of the token server URL of this catalog service
-- * p_plugin_internal_name:            Internal name of the REST Source Type (Plug-In) to use for this catalog service.
-- * p_authentication_type:             Authentication Type for this catalog service.
-- * p_details_json:                    Data Profile, Operations and parameter details in JSON format.
-- * p_version:                         Version of this service within the catalog.
--==============================================================================
procedure create_catalog_service(
    p_id                            in number,
    p_catalog_id                    in number,
    p_name                          in varchar2,
    p_description                   in varchar2                    default null,
    p_base_url                      in varchar2                    default null,
    p_service_path                  in varchar2                    default null,
    p_auth_server_base_url          in varchar2                    default null,
    p_auth_server_url_path          in varchar2                    default null,
    p_plugin_internal_name          in varchar2                    default null,
    p_authentication_type           in varchar2                    default null,
    p_details_json                  in sys.dbms_sql.varchar2_table default wwv_flow_imp.empty_varchar2_table,
    p_version                       in number                      default null,
    --
    p_created_by                    in varchar2                    default null,
    p_created_on                    in date                        default null,
    p_updated_by                    in varchar2                    default null,
    p_updated_on                    in date                        default null );

--==============================================================================
-- Creates a REST Data Source Plug-In within a catalog. The catalog also contains
-- REST Data Source Plug-Ins for the REST Source types of the catalog services.
-- This allows the Plug-In to be installed automatically when a REST Data Source is created
-- based on a service in the catalog.
-- The Plug-In is contained in the catalog as a Plug-In export file in BLOB format.
--
-- Parameters:
--
-- * p_id:                              ID of the new catalog Plug-In.
-- * p_catalog_id:                      ID of the catalog to add the new service to.
-- * p_plugin_internal_name:            Internal name of the REST Source Type (Plug-In) which is added to the catalog.
-- * p_plugin_display_name:             Display name of the REST Source Type (Plug-In) which is added to the catalog.
-- * p_plugin_export:                   Plug-In export file.
-- * p_plugin_version:                  Version of the Plug-In which is added to the catalog.
--==============================================================================
procedure create_catalog_plugin(
    p_id                            in number,
    p_catalog_id                    in number,
    p_plugin_internal_name          in varchar2,
    p_plugin_display_name           in varchar2,
    p_plugin_export                 in blob,
    p_plugin_version                in varchar2                    default null,
    --
    p_created_by                    in varchar2                    default null,
    p_created_on                    in date                        default null,
    p_updated_by                    in varchar2                    default null,
    p_updated_on                    in date                        default null );

end wwv_web_src_catalog_api;
/
sho err
