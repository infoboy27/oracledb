set define '^' verify off
prompt ...wwv_flow_web_src_boss_discover.sql
create or replace package wwv_flow_web_src_boss_discover as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2023 - 2024. All Rights Reserved.
--
--    NAME
--      wwv_flow_web_src_boss_discover.sql
--
--    DESCRIPTION
--      BOSS-specific OpenAPI discovery logic
--
--    MODIFIED   (MM/DD/YYYY)
--    smuench     08/06/2024 - APEX-9081 Native Support for BOSS REST Services
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Types used by unit tests to validate discover core
--------------------------------------------------------------------------------

type t_query_param is record (
    name varchar2(4000),
    is_required boolean
);

type t_query_params is table of t_query_param index by pls_integer;

type t_attr is record (
    name                 varchar2(4000),
    column_name          varchar2(4000),
    format_mask          varchar2(4000),
    required             boolean,
    required_from_client boolean,
    max_length           number,
    data_type            wwv_flow_exec_api.t_data_type,
    is_binary_number     boolean,
    searchable           boolean,
    sortable             boolean,
    updateable           boolean,
    create_only          boolean,
    read_only            boolean,
    remote_pk            boolean,
    has_time_zone        boolean,
    composite            boolean,
    is_accessor_fk       boolean,    
    remote_data_type     varchar2(4000)
);

type t_attrs is table of t_attr index by pls_integer;

type t_api is record (
    resource_name        varchar2(4000),
    base_url             varchar2(4000),
    is_single_row        boolean,
    is_search_view       boolean,
    row_selector         varchar2(4000),
    get_all_attrs        t_attrs,
    get_all_path         varchar2(4000),
    get_all_query_params t_query_params,
    get_one_path         varchar2(4000),
    post_path            varchar2(4000),
    patch_path           varchar2(4000),
    delete_path          varchar2(4000),
    get_all_name         varchar2(4000),
    get_one_name         varchar2(4000),
    post_name            varchar2(4000),
    patch_name           varchar2(4000),
    delete_name          varchar2(4000)
);

--======================================================================================================================
-- Web Source Module Plug-In discover procedure
--======================================================================================================================
procedure discover_boss (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_discover_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );


--==========================================================================
-- Parse BOSS describe into API metadata needed to create a REST data source
--
-- Exposed for unit testing the discover core
--==========================================================================
function ingest_boss_object_openapi(
    p_document            in clob,
    p_tag                 in varchar2,
    p_views_suffix        in varchar2  default null,
    p_discover_references in boolean   default false)
    return t_api;

end wwv_flow_web_src_boss_discover;
/
show err

set define '^'
