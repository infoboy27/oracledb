set define '^' verify off
prompt ...wwv_web_src_catalog.sql
create or replace package wwv_web_src_catalog as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2023. All Rights Reserved.
--
--    NAME
--      wwv_web_src_catalog.sql
--
--    DESCRIPTION
--      REST Source Catalog Maintenance package
--
--    MODIFIED   (MM/DD/YYYY)
--    dbliss      07/08/2019 - Created
--    aschefe     08/08/2023 - added catalog_from_openapi

--------------------------------------------------------------------------------
-- Global constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------

--===============================================================================
-- creates or updates attributes of a catalog group.
--
-- Parameters:
-- * p_id:            ID of the catalog group to be updated
-- * p_name:          Name of the catalog group to create
-- * p_icon:          Icon to display along with the group (font apex)
-- * p_description:   description for the group
--
-- Example:
--
-- Changes the attributes an existing REST Source Catalog Group
-- 
--
-- declare
--     l_id   number := 1237899872356116;
-- begin
--     wwv_web_src_catalog.save_catalog_group(
--         p_id             => l_id,
--         p_name           => 'Public Financial APIs Group',
--         p_icon           => 'fa-money',
--         p_description    => 'REST Service Catalogs for public financial APIs' );
-- end;
--
-- Creates a new REST Source Catalog Group
-- 
-- declare
--     l_id   number;
-- begin
--     wwv_web_src_catalog.save_catalog_group(
--         p_id             => l_id,
--         p_name           => 'Public Financial APIs Group',
--         p_icon           => 'fa-money',
--         p_description    => 'REST Service Catalogs for public financial APIs' );
-- end;
--===============================================================================
procedure save_catalog_group (
    p_id                          in out number,
    p_name                        in     varchar2, 
    p_icon                        in     varchar2 default null, 
    p_description                 in     varchar2 default null );

--===============================================================================
-- creates or updates attributes of a REST Source catalog
--
-- Parameters:
-- * p_id:                               ID of the catalog to be updated
-- * p_group_id:                         ID of the catalog to be updated
-- * p_internal_name:                    Internal Name of the catalog. When importing a catalog, this name
--                                       is used to determine whether the catalog already exists (and is to be replaced),
--                                       or not. Behavior is similar to Plug-Ins.
-- * p_name:                             Name of the catalog to create
-- * p_icon:                             Icon to display along with the catalog (font apex)
-- * p_description:                      description for the catalog
--
-- * p_endpoint_url:                     URL to fetch catalog updates from
-- * p_proxy_server                      proxy server to use for catalog updates 
-- * p_token_server_url:                 Token server if OAuth authentication is required
-- * p_credential_id:                    Web Credential to use for catalog updates
-- 
-- * p_format:                           Format of catalog updates; currently only "APEX" is supported
-- * p_default_plugin_internal_name:     Internal name of the Plug-In which services in this catalog use by default
-- * p_default_authentication_type:      Authentication type which services in this catalog use by default
-- * p_version:                          Catalog version
--
-- Example:
--
-- Creates a new REST Source Catalog or updates an existing one.
-- 
-- declare
--     l_id   number;
-- begin
--     wwv_web_src_catalog.save_catalog(
--         p_id                          => l_id,
--         p_name                        => 'Public Financial APIs',
--         p_icon                        => 'fa-money',
--         p_description                 => 'REST Service Catalog for public Stock APIs',
--         --
--         p_endpoint_url                => 'http://my-rest-catalog.github.com/rest/apex/stock-apis.sql',
--         p_default_authentication_type => 'BASIC' );
-- end;
--===============================================================================
procedure save_catalog (
    p_id                              in out number,
    p_group_id                        in     number                   default null, 
    p_internal_name                   in     varchar2                 default null,
    p_name                            in     varchar2                 default null, 
    p_icon                            in     varchar2                 default null, 
    p_description                     in     varchar2                 default null, 
    --
    p_endpoint_url                    in     varchar2                 default null,
    p_proxy_server                    in     varchar2                 default null,
    p_token_server_url                in     varchar2                 default null,
    p_credential_id                   in     number                   default null, 
    --
    p_format                          in     varchar2                 default wwv_web_src_catalog_api.c_catalog_format_apex,
    p_default_plugin_internal_name    in     varchar2                 default null,
    p_default_authentication_type     in     varchar2                 default null,
    --
    p_version                         in     number                   default null );

--===============================================================================
-- the procedure will take the id of a web source module and create a
-- web source catalog service entry based on the values from the 
-- WWV_FLOW_WEB_SRC_MODULES table as well as the WWV_FLOW_WEB_SRC_OPERATIONS, 
-- and WWV_FLOW_WEB_SRC_PARAMS tables. 
--
-- There are three overloads: 
-- * accept a catalog ID and add the service this catalog. 
-- * accept a group ID and a catalog name. Create a new catalog and add the service to that new catalog.
-- * accept group and catalog names. Create new group, new catalog and add the service to that new catalog.
--
-- Parameters:
-- * p_module_id:              REST Source Module ID to create the catalog service from.
--
-- * p_catalog_id:             ID of the catalog to create the REST Source in.
-- * p_group_id:               ID of the catalog group to use, if a new catalog is created in an existing group.
--
-- * p_group_name:             Name of the new Catalog group to create.
-- * p_catalog_name:           Name of the new Catalog to create.
-- * p_catalog_internal_name:  Internal name of the new Catalog to create.
-- 
-- * p_service_name:           Name of the service within the catalog.
-- * p_service_icon:           Icon to display for the service within the catalog.
-- * p_service_description:    Description for this service to store in the catalog.
-- * p_version:                Version of this service definition in the catalog.
--
-- * p_replace_when_exists:    Whether to overwrite an existing catalog service
--                             with the same name, or whether to create a new one.
--===============================================================================
procedure import_from_rest_source (
    p_module_id           in number, 
    p_catalog_id          in number,
    --
    p_service_name        in varchar2 default null, 
    p_service_icon        in varchar2 default null, 
    p_service_description in varchar2 default null,
    p_version             in varchar2 default null,
    --
    p_replace_when_exists in boolean  default true );

--===============================================================================
procedure import_from_rest_source (
    p_module_id             in number, 
    --
    p_group_id              in number,
    --
    p_catalog_name          in varchar2, 
    p_catalog_internal_name in varchar2, 
    --
    p_service_name          in varchar2 default null, 
    p_service_icon          in varchar2 default null, 
    p_service_description   in varchar2 default null,
    p_version               in varchar2 default null,
    --
    p_replace_when_exists   in boolean  default true );

--===============================================================================
procedure import_from_rest_source (
    p_module_id             in number, 
    --
    p_group_name            in varchar2,
    p_catalog_name          in varchar2, 
    p_catalog_internal_name in varchar2, 
    --
    p_service_name          in varchar2 default null, 
    p_service_icon          in varchar2 default null, 
    p_service_description   in varchar2 default null,
    p_version               in varchar2 default null,
    --
    p_replace_when_exists   in boolean  default true );

--===============================================================================
-- creates a new REST Data Source from a service definition within a REST Catalog.
--
-- Parameters:
-- * p_catalog_id:                 ID of the catalog to use
-- * p_service_id:                 ID of the catalog service to create a REST Data Source from
--
-- * p_application_id:             ID of the application to create the REST Data Source in
-- * p_module_id:                  ID of the REST Data Source to refresh. If omitted, a new REST Data Source will be created.
-- * p_rest_source_name:           Name to use for the new REST Data Source. If omitted, the name of the catalog service will be used.
--
-- * p_base_url_override:          If provided, use this Base URL instead the definition in the catalog
--
-- * p_credential_id:              Web Credential to use for the new REST Data Source. If omitted, and the
--                                 REST Source requires authentication, a new Web Credential will be created.
--
-- * p_refresh_plugin:             Whether to overwrite a REST source plug-in, which already exists in the application. If
--                                 a required plug-in does not exist in the application, it will always be created.
-- * p_installed_plugins:          VARCHAR2 array with to pass between subsequent calls to this procedure. The procedure
--                                 adds installed plug-ins to this array; and plug-ins contained in this array will not
--                                 be installed again.
--
-- * p_attribute_01:               Value for Plug-In attribute 1
-- * :
-- * p_attribute_15:               Value for Plug-In attribute 15
--
-- * p_remove_obsolete_attributes: remove data profile columns, operations or parameters which exist
--                                 in the REST source, but not in the catalog service.
--===============================================================================
procedure rest_source_from_catalog(
    p_catalog_id                  in            number,
    p_service_id                  in            number,
    --
    p_application_id              in            number,
    p_module_id                   in            number   default null,
    p_rest_source_name            in            varchar2 default null,
    --
    p_base_url_override           in            varchar2 default null,
    --
    p_credential_id               in out nocopy number,
    --
    -- Plug-In attributes to be set in the UI
    --
    p_refresh_plugin              in            boolean  default false,
    p_installed_plugins           in out nocopy wwv_flow_t_varchar2,
    --
    p_attribute_01                in            varchar2 default null,            
    p_attribute_02                in            varchar2 default null,            
    p_attribute_03                in            varchar2 default null,            
    p_attribute_04                in            varchar2 default null,            
    p_attribute_05                in            varchar2 default null,            
    p_attribute_06                in            varchar2 default null,            
    p_attribute_07                in            varchar2 default null,            
    p_attribute_08                in            varchar2 default null,            
    p_attribute_09                in            varchar2 default null,            
    p_attribute_10                in            varchar2 default null,            
    p_attribute_11                in            varchar2 default null,            
    p_attribute_12                in            varchar2 default null,            
    p_attribute_13                in            varchar2 default null,            
    p_attribute_14                in            varchar2 default null, 
    p_attribute_15                in            varchar2 default null,
    --
    p_remove_obsolete_attributes  in            boolean  default false );

--===============================================================================
-- clears catalog references in REST Sources which have been created based on the
-- catalog. This procedure should be called before deleting a catalog or a catalog
-- service.
--
-- Parameters:
-- * p_catalog_id:          ID of the catalog
-- * p_service_id:          ID of the service; if omitted, references to all services in the
--                          catalog will be cleared.
--===============================================================================
procedure clear_catalog_references(
    p_catalog_id             in number,
    p_service_id             in number default null );

--==============================================================================
--
-- A P I   P R O C E D U R E S   ( I M P O R T )
--
--==============================================================================
-- These procedures are called when importing a REST Catalog export file. The
-- export file contains calls to the WWV_WEB_SRC_CATALOG_API package (public package);
-- and that package calls the following four procedures. The concept is the same
-- as in WWV_FLOW_IMP.
--==============================================================================


--==============================================================================
-- Creates a catalog group
--==============================================================================
procedure create_catalog_group(
    p_id                            in number,
    p_name                          in varchar2,
    p_icon                          in varchar2                 default null,
    p_description                   in varchar2                 default null,
    -- 
    p_created_by                    in varchar2                 default null,
    p_created_on                    in date                     default null,
    p_updated_by                    in varchar2                 default null,
    p_updated_on                    in date                     default null );

--==============================================================================
-- Creates a catalog 
--==============================================================================
procedure create_catalog(
    p_id                            in number,
    p_catalog_group_id              in number,
    p_name                          in varchar2,
    p_internal_name                 in varchar2,
    p_icon                          in varchar2                 default null,
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
    p_format                        in varchar2                 default wwv_web_src_catalog_api.c_catalog_format_apex,
    p_default_plugin_internal_name  in varchar2                 default null,
    p_default_authentication_type   in varchar2                 default null,
    p_version                       in number                   default null, 
    --
    p_created_by                    in varchar2                 default null,
    p_created_on                    in date                     default null,
    p_updated_by                    in varchar2                 default null,
    p_updated_on                    in date                     default null );

--==============================================================================
-- creates a catalog service
--==============================================================================
procedure create_catalog_service(
    p_id                            in number,
    p_catalog_id                    in number,
    p_name                          in varchar2,
    p_icon                          in varchar2                    default null,
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
-- creates a catalog plug-in
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

--==============================================================================
-- Imports a REST Source catalog from a file which has already been uploaded
-- to APEX_APPLICATION_TEMP_FILES.
--
-- Parameters:
-- * p_group_name:       Name of the Catalog Group to import this catalog into
-- * p_export_file_id:   ID of the uploaded catalog export file (APEX_APPLICATION_TEMP_FILES)
--==============================================================================
procedure import_catalog(
    p_group_name        in varchar2,
    p_export_file_id    in number );

--==============================================================================
-- Checks whether the REST catalog within the export file already exists. The
-- file has already been uploaded to APEX_APPLICATION_TEMP_FILES.
--
-- Parameters:
-- * p_export_file_id:   ID of the uploaded catalog export file (APEX_APPLICATION_TEMP_FILES)
--
-- Returns:
-- TRUE, of the catalog exists, FALSE otherwise
--==============================================================================
function catalog_exists(
    p_export_file_id    in number ) 
    return boolean;

--==============================================================================
-- Refreshes a REST Source catalog by downloading the catalog export from the
-- stored endpoint URL. If no endpoint URL is stored, this procedure does nothing.
--
-- Parameters:
-- * p_catalog_id:       ID of the Catalog to refresh
--==============================================================================
procedure refresh_catalog(
    p_catalog_id        in number );

--==============================================================================
--
-- E X P O R T
--
--==============================================================================

--==============================================================================
-- Exports Catalog Groups; called from within workspace export
--==============================================================================
procedure export_catalog_groups( 
    p_with_audit_info     in varchar2          default null );

--==============================================================================
-- Exports REST Source Catalog(s). If called as part of a workspace export,
-- catalog group references are exported as well.
-- 
-- Parameters:
-- * p_catalog_ids:          NUMBER Array of Catalog IDs to be exported
-- * p_is_workspace_export:  whether this procedure is invoked as part of a workspace export.
-- 
--==============================================================================
procedure export_catalogs(
    p_catalog_ids         in wwv_flow_t_number default null,
    p_is_workspace_export in boolean           default false, 
    p_with_audit_info     in varchar2          default null );

--==============================================================================
-- Exports a REST Source Catalog to a CLOB
-- 
-- Parameters:
-- * p_catalog_id:       Catalog IDs to be exported
--
-- Returns:
-- Catalog export file, as a CLOB
--==============================================================================
function export_catalog_to_clob(
    p_catalog_id        in number )
    return clob;

--===============================================================================
-- Exports a REST Source Catalog
-- 
-- Parameters:
-- * p_catalog_id:       Catalog IDs to be exported
--==============================================================================
procedure export_catalog(
    p_catalog_id        in number, 
    p_with_audit_info   in varchar2          default null );

--===============================================================================
-- creates or updates attributes of a REST Source catalog, based on a OpenAPI json
--
-- Parameters:
-- * p_openapi                           OpenAPI document used
-- * p_id:                               ID of the catalog to be updated, null creates a new catalog
-- * p_group_id:                         ID of the catalog group
-- * p_internal_name:                    Internal Name of the catalog.
-- * p_name:                             Name of the catalog
-- * p_icon:                             Icon of the catalog
-- * p_description:                      description for the catalog
-- * p_base_url:                         Base URL, default value used when OpenAPI doesn't contain a host or server URL
--
-- * p_endpoint_url:                     URL to fetch catalog updates from
-- * p_proxy_server                      proxy server to use for catalog updates 
-- * p_token_server_url:                 Token server if OAuth authentication is required
-- * p_credential_id:                    Web Credential to use for catalog updates
-- 
-- * p_format:                           Format of catalog updates; currently only "APEX" is supported
-- * p_default_plugin_internal_name:     Internal name of the Plug-In which services in this catalog use by default
-- * p_application_id:                   Id of the apllication from which a non native plugin can be exported
-- * p_default_authentication_type:      Authentication type which services in this catalog use by default
-- * p_version:                          Catalog version
--
-- * p_attribute_01:                     Value for Plug-In attribute 1
-- * :
-- * p_attribute_15:                     Value for Plug-In attribute 15
-- end;
--===============================================================================
procedure catalog_from_openapi (
    p_openapi                         in     clob,
    p_id                              in     number,
    p_group_id                        in     number, 
    p_internal_name                   in     varchar2,
    p_name                            in     varchar2, 
    p_icon                            in     varchar2  default null, 
    p_description                     in     varchar2  default null,
    p_base_url                        in     varchar2  default null,
    --
    p_endpoint_url                    in     varchar2  default null,
    p_proxy_server                    in     varchar2  default null,
    p_token_server_url                in     varchar2  default null,
    p_credential_id                   in     number    default null, 
    --
    p_format                          in     varchar2  default wwv_web_src_catalog_api.c_catalog_format_apex,
    p_default_plugin_internal_name    in     varchar2  default null,
    p_application_id                  in     number    default null,
    p_default_authentication_type     in     varchar2  default null,
    p_default_token_server_url        in     varchar2  default null,
    --
    p_version                         in     number    default null,
    --
    p_attribute_01                    in     varchar2  default null,            
    p_attribute_02                    in     varchar2  default null,            
    p_attribute_03                    in     varchar2  default null,            
    p_attribute_04                    in     varchar2  default null,            
    p_attribute_05                    in     varchar2  default null,            
    p_attribute_06                    in     varchar2  default null,            
    p_attribute_07                    in     varchar2  default null,            
    p_attribute_08                    in     varchar2  default null,            
    p_attribute_09                    in     varchar2  default null,            
    p_attribute_10                    in     varchar2  default null,            
    p_attribute_11                    in     varchar2  default null,            
    p_attribute_12                    in     varchar2  default null,            
    p_attribute_13                    in     varchar2  default null,            
    p_attribute_14                    in     varchar2  default null, 
    p_attribute_15                    in     varchar2  default null
    --
    );

end wwv_web_src_catalog;
/
show errors;
