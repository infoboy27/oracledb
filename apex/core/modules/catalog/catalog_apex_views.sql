set define '^' verify off

prompt ... Create APEX REST Source Catalog views

-----------------------------------------------------
-- W E B  S O U R C E  S E R V I C E  C A T A L O G S
--

--------------------------------------------------------------------------------

prompt ...apex_rest_catalog_groups

create or replace view apex_rest_catalog_groups
as
select 
    w.workspace,
    w.workspace_display_name,
    --
    g.id                                  catalog_group_id,
    g.name                                catalog_group_name,
    --
    (select count(c.id)
       from wwv_web_src_catalogs c
      where catalog_group_id = g.id )     catalogs_count,
    --
    g.last_updated_by,
    g.last_updated_on
from wwv_web_src_catalog_groups   g,
     wwv_companies_auth_extension w
where w.workspace_id       = g.security_group_id
/

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_rest_catalog_groups',
    p_table_comment     => 'Groups of REST Source Catalogs',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace'                    , 'A work area mapped to one or more database schemas',
      'workspace_display_name'       , 'Display name for the workspace',
      'catalog_group_id'             , 'REST Source Catalog Group internal ID',
      'catalog_group_name'           , 'Name of the REST Source Catalog Group',
      'catalogs_count'               , 'Number of Catalogs within the group',
      'last_updated_by'              , 'APEX developer who made last update',
      'last_updated_on'              , 'Date of last update'
    )
  );
end;
/

--------------------------------------------------------------------------------

prompt ...apex_rest_catalogs

create or replace view apex_rest_catalogs
as
select
    w.workspace,
    w.workspace_display_name,
    --
    g.id                                     catalog_group_id,
    g.name                                   catalog_group_name,
    --
    c.id                                     catalog_id,
    c.name                                   catalog_name,
    c.internal_name                          catalog_internal_name,
    c.description                            catalog_description,
    --
    c.endpoint_url                           url_endpoint, 
    c.token_server_url                       auth_url_endpoint,
    c.proxy_server,
    --
    (select count(cs.id)
       from wwv_web_src_catalog_services cs
      where catalog_id = c.id )              services_count,
    --
    cr.id                                    credential_id,
    cr.name                                  credential_name,
    cr.static_id                             credential_static_id,
    --
    c.format,
    --
    c.default_plugin_internal_name           default_plugin_code,
    decode( c.default_authentication_type,
            'BASIC',                     'Basic Authentication',
            'OAUTH2_CLIENT_CREDENTIALS', 'OAuth2 Client Credentials Flow',
            'OCI',                       'Oracle Cloud Infrastructure',
            'HTTP_HEADER',               'HTTP Header',
            'HTTP_QUERY_STRING',         'HTTP Query String'
    )                                        default_authentication_type,
    c.version,
    c.last_imported_at,
    c.last_import_file,
    --
    c.last_updated_by,
    c.last_updated_on
from wwv_web_src_catalogs         c,
     wwv_web_src_catalog_groups   g,
     wwv_companies_auth_extension w,
     wwv_credentials cr
where w.workspace_id = c.security_group_id
  and g.id           = c.catalog_group_id
  and cr.id (+)      = c.credential_id 
/

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_rest_catalogs',
    p_table_comment     => 'REST Source Catalogs',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace'                    , 'A work area mapped to one or more database schemas',
      'workspace_display_name'       , 'Display name for the workspace',
      'catalog_group_id'             , 'Catalog Group internal ID',
      'catalog_group_name'           , 'Name of the Catalog Group',
      'catalog_id'                   , 'REST Source Catalog internal ID',
      'catalog_name'                 , 'Name of the REST Source Catalog',
      'catalog_internal_name'        , 'Internal Name of the catalog',
      'catalog_description'          , 'Description of the catalog',
      'services_count'               , 'Number of services within the REST Source Catalog',
      'url_endpoint'                 , 'URL endpoint from which this catalog can be refreshed',
      'auth_url_endpoint'            , 'URL endpoint to use for authentication when the catalog is refreshed',
      'proxy_server'                 , 'Proxy Server to use when refreshing the catalog',
      'credential_id'                , 'Internal ID of the Web Credential to use for authentication when refreshing the catalog',
      'credential_name'              , 'Name of the Web Credential to use for authentication when refreshing the catalog',
      'credential_static_id'         , 'Static ID of the Web Credential to use for authentication when refreshing the catalog',
      'format'                       , 'The file format to use when refreshing the catalog',
--
      'default_plugin_code'          , 'Internal identifier for the plug-in to use by default for services within the catalog',
      'default_authentication_type'  , 'Type of authentication to use by default for services within the catalog',
      'version'                      , 'Version identifier for this catalog',
      'last_imported_at'             , 'Date when this catalog was last imported or refreshed',
      'last_import_file'             , 'The contents of the file which was last used to refresh this catalog',
      'last_updated_by'              , 'APEX developer who made last update',
      'last_updated_on'              , 'Date of last update'
    )
  );
end;
/

--------------------------------------------------------------------------------

prompt ...apex_rest_catalog_plugins

create or replace view apex_rest_catalog_plugins
as
select 
    w.workspace,
    w.workspace_display_name,
    --
    c.id                                                 catalog_id,
    c.name                                               catalog_name,
    --
    (select count(cs.id)
       from wwv_web_src_catalog_services cs
      where catalog_id = c.id 
        and plugin_internal_name = p.plugin_internal_name)
                                                         usage_count,
    --
    p.id                                                 plugin_id,
    p.plugin_internal_name                               plugin_name,
    p.plugin_display_name                                plugin_display_name,
    p.plugin_version                                     plugin_version,
    p.plugin_export                                      export_file
from wwv_web_src_catalog_plugins  p,
     wwv_web_src_catalogs         c,
     wwv_companies_auth_extension w
where w.workspace_id = p.security_group_id
  and c.id           = p.catalog_id
/

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_rest_catalog_plugins',
    p_table_comment     => 'REST Source Plug-Ins used by services in a REST Source Catalog',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace'                    , 'A work area mapped to one or more database schemas',
      'workspace_display_name'       , 'Display name for the workspace', 
      'catalog_id'                   , 'Internal ID of the REST Source Catalog which this plug-in belongs to',
      'catalog_name'                 , 'Name of the REST Source Catalog which this plug-in belongs to',
      'usage_count'                  , 'Number of services in the REST Source Catalog, which use this plug-in',
      'plugin_id'                    , 'Internal identifier for this plug-in within a catalog',
      'plugin_name'                  , 'Internal name for the plug-in, which is used to reference in REST Data Sources',
      'plugin_display_name'          , 'Display Name of the plug-in',
      'plugin_version'               , 'Version of the plug-in when it was exported',
      'export_file'                  , 'Export file for of the plug-in, in APEX export (SQL) format'
    )
  );
end;
/

--------------------------------------------------------------------------------

prompt ...apex_rest_catalog_services

create or replace view apex_rest_catalog_services
as
select 
    w.workspace,
    w.workspace_display_name,
    --
    c.id                                                 catalog_id,
    c.name                                               catalog_name,
    --
    s.id                                                 service_id,
    s.name                                               service_name,
    s.description                                        service_description,
    --
    s.base_url || s.service_path                         url_endpoint,
    s.auth_server_base_url || s.auth_server_url_path     auth_url_endpoint,
    --
    s.plugin_internal_name                               plugin_name,
    decode( s.authentication_type,
            'BASIC',                     'Basic Authentication',
            'OAUTH2_CLIENT_CREDENTIALS', 'OAuth2 Client Credentials Flow',
            'OCI',                       'Oracle Cloud Infrastructure',
            'HTTP_HEADER',               'HTTP Header',
            'HTTP_QUERY_STRING',         'HTTP Query String'
    )                                                    authentication_type,
    --
    s.details_json,
    --
    s.version,
    s.last_imported_at
from wwv_web_src_catalog_services s,
     wwv_web_src_catalogs         c,
     wwv_companies_auth_extension w
where w.workspace_id = s.security_group_id
  and c.id           = s.catalog_id
/

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_rest_catalog_services',
    p_table_comment     => 'Services within a REST Source Catalog',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace'                    , 'A work area mapped to one or more database schemas',
      'workspace_display_name'       , 'Display name for the workspace', 
      'catalog_id'                   , 'Internal ID for the REST Source Catalog containing this service',
      'catalog_name'                 , 'Name of the REST Source Catalog containing this service',
      'service_id'                   , 'Internal ID for this service',
      'service_name'                 , 'Catalog Service name',
      'service_description'          , 'Description of the catalog service',
      'url_endpoint'                 , 'URL endpoint for this catalog service',
      'auth_url_endpoint'            , 'Token server endpoint, if the service uses OAuth authentication',
--
      'plugin_name'                  , 'Internal name for the REST Source plug-in to use for ths service',
      'authentication_type'          , 'Type of authentication to use for the service',
      'details_json'                 , 'Service details, in JSON format',
      'version'                      , 'Version identifier for this service',
      'last_imported_at'             , 'Date when this service was last imported'
    )
  );
end;
/

--------------------------------------------------------------------------------

prompt ...done creating APEX REST Source Catalog views

set define '^'
