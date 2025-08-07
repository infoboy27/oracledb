set define '^' verify off
prompt ...creating dev-only tables

Rem  Copyright (c) Oracle Corporation 2019. All Rights Reserved.
Rem
Rem    NAME
Rem      dev_tabs.sql
Rem
Rem    DESCRIPTION
Rem      Tables which are used in development only environment.
Rem
Rem    NOTE
Rem      Table triggers must be added in dev_triggers.sql
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    cbcho       08/08/2019 - Created


--##############################################################################
--#
--# data dictionary cache information
--#
--##############################################################################
prompt ...dictionary cache
--==============================================================================
create table wwv_dictionary_cache_log (
    id                           number
                                 constraint wwv_dict_cache_log_pk primary key,
    security_group_id            number not null,
    apex_workspace               varchar2(255)   not null,
    schema                       varchar2(255)   not null,
    table_name                   varchar2(255)   not null,
    status                       varchar2(255)   not null
                                 constraint wwv_dict_cache_log_status_ck
                                 check (status in ('RUNNING','COMPLETED','ABANDONED')),
    row_version                  integer         not null,
    cancel_work                  varchar2(1)     not null
                                 constraint wwv_dict_cache_log_cancel_ck
                                 check (cancel_work in ('Y','N')),
    work_started                 date            not null,
    work_completed               date,
    current_task                 varchar2(4000),
    initiated_by                 varchar2(255)   not null,
    updated_by                   varchar2(4000),
    updated_on                   date,
    --
    analyzed_table_yn            varchar2(1)
                                 constraint wwv_dict_cache_analyzed_ck
                                 check (analyzed_table_yn in ('Y','N','U')),    -- Y = Yes, N = No, U = Unkonwn
    cached_columns_yn            varchar2(1)
                                 constraint wwv_dict_cache_cached_col_ck
                                 check (cached_columns_yn in ('Y','N','U')),    -- Y = Yes, N = No, U = Unkonwn
    last_ddl_time_seconds_ago    number,         -- number of seconds ago the last ddl time
    max_stats_age_seconds        number,         -- requested max stats age required to recompute
    max_stats_age_seconds_act    number,         -- observed actual max stats age for requested object
    max_cache_stale_seconds      number,         -- requested max dictionary attributes max age to recompute
    max_cache_stale_seconds_act  number,         -- observed max dictionary cache max age for requested object
    max_elap_exec_time_sec       number,
    --
    elaplsed_time_sec            number,
    run_id                       number          not null
    )
/

create index wwv_dictionary_cache_log_idx1 on wwv_dictionary_cache_log(work_started)
/
create index wwv_dictionary_cache_log_idx2 on wwv_dictionary_cache_log(run_id)
/
create index wwv_dictionary_cache_log_idx3 on wwv_dictionary_cache_log(elaplsed_time_sec)
/

create table wwv_dictionary_cache_obj (
    id                           number
                                 constraint wwv_dict_cache_obj_pk primary key,
    security_group_id            number not null,
    apx_cache_date               date,            -- date this row was created
    apx_col_cache_date           date,            -- date columns for this database object where cached
    --
    apx_workspace                varchar2(255),   -- oracle apex workspace name
    apx_workspace_created        date,            -- date when the workspace was created
    apx_workspace_last_login     date,            -- last time log entry from apex was noted
    apx_workspace_status         varchar2(255),   -- current apex workspace status
    --
    object_id                    number,          -- database object id from dba_objects
    object_owner                 varchar2(255),   -- schema owner of the database object
    object_name                  varchar2(255),   -- name of the database object
    object_prefix                varchar2(30),    -- the prefix for this table, e.g. EBA_
    object_type                  varchar2(255),   -- type of database object, eg TABLE
    object_created               date,            -- date the database object was created
    object_last_ddl_time         date,            -- date the database objects last DDL
    object_pk_columns            varchar2(4000),  -- Comma separated PK columns for info only. IMPORTANT: not for dynamic query use!
    display_col_1                varchar2(255),   -- primary display column
    display_col_2                varchar2(255),   -- secondary display column
    geometry_type                varchar2(7)
                                 constraint wwv_dict_cache_obj_geotype_ck
                                 check (geometry_type in ('POINT','LINE','POLYGON','UNKNOWN')),
    --
    tab_last_analyzed            date,            -- date table was last analyzed
    tab_cache_num_rows           number,          -- number of rows in the table from the dictionary stats
    --
    default_query                clob,            -- SQL select statement to query data in this table
    --
    -- labels
    --
    prefix_removed_tab_name      varchar2(255),   -- table name with prefix removed for example EBA_EMP would be EMP
    singular_display_label       varchar2(255),   -- singular display name, for use when creating pages on this table (typically a form)
    plural_display_label         varchar2(255),   -- plural table name for creating pages on this table (for example a report)
    description                  varchar2(4000),
    --
    -- quality
    --
    has_fk_references            varchar2(1)
                                 constraint wwv_dict_cache_obj_hasfkref_ck
                                 check (has_fk_references in ('Y','N')),
    has_primary_key_yn           varchar2(1)
                                 constraint wwv_dict_cache_obj_has_pk_ck
                                 check (has_primary_key_yn in ('Y','N')),
    has_long_columns_yn          varchar2(1)
                                 constraint wwv_dict_cache_obj_has_long_ck
                                 check (has_long_columns_yn in ('Y','N'))        -- mike: columns of type long
    )
/

create unique index  wwv_dictionary_cache_obj_idx1 on wwv_dictionary_cache_obj (security_group_id, object_owner, object_name)
/
create unique index  wwv_dictionary_cache_obj_idx2 on wwv_dictionary_cache_obj (security_group_id, object_id, object_type)
/
create  index        wwv_dictionary_cache_obj_idx3 on wwv_dictionary_cache_obj (object_created)
/
create  index        wwv_dictionary_cache_obj_idx4 on wwv_dictionary_cache_obj (apx_cache_date)
/

create table wwv_dictionary_cache_col (
    id                          number
                                constraint wwv_dict_cache_col_pk primary key,
    object_cache_id             number
                                constraint wwv_dict_cache_col_fk1
                                references wwv_dictionary_cache_obj
                                on delete cascade,
    security_group_id           number not null,
    apx_cache_date              date,
    --
    -- data dictionary info
    --
    owner_name                  varchar2(255),
    table_name                  varchar2(255),
    column_name                 varchar2(255),
    data_type_display           varchar2(255),
    data_type                   varchar2(128),
    data_length                 number,
    data_scale                  number,
    data_precision              number,
    has_char_semantics_yn       varchar2(1)
                                constraint wwv_dict_cache_col_char_sem_ck
                                check ( has_char_semantics_yn in ('Y','N') ),
    nullable                    varchar2(1)
                                constraint wwv_dict_cache_col_null_ck
                                check (nullable in ('Y','N')),
    density                     number,
    num_nulls                   number,
    last_analyzed               date,
    avg_col_len                 number,
    num_distinct                number,
    column_id                   number,
    --
    -- display info
    --
    item_display_as             varchar2(255), -- APEX form display as recommendation
    filter_display_as           varchar2(255)
                                constraint wwv_dict_cache_col_filterda_ck
                                check (filter_display_as in ('CHECKBOX','RADIOGROUP','SELECT_LIST','RANGE','TEXT_FIELD')),
    filter_global_searchable_yn varchar2(1)
                                constraint wwv_dict_cache_col_filtergs_ck
                                check (filter_global_searchable_yn in ('Y','N')),
    label                       varchar2(255), -- Item Label recommendation
    format_mask                 varchar2(255), -- dates and numbers format mask recommendation
    recommend_disp_on_rpt_yn    varchar2(1)
                                constraint wwv_dict_cache_col_diprpt_ck
                                check (recommend_disp_on_rpt_yn in ('Y','N')),   -- typically CLOB columns are not displayed
    recommend_disp_on_forms_yn  varchar2(1),
                                constraint wwv_dict_cache_col_dipform_ck
                                check (recommend_disp_on_forms_yn in ('Y','N')),  -- typically CLOB columns are provided
    --
    -- index and PK info
    --
    has_leading_idx_yn          varchar2(1)
                                constraint wwv_dict_cache_col_lidx_ck
                                check (has_leading_idx_yn in ('Y','N')),  -- this column is part of a leading edge index
    is_single_col_pk_yn         varchar2(1)
                                constraint wwv_dict_cache_col_sc_pk_ck
                                check (is_single_col_pk_yn in ('Y','N')),
    pk_position                 number,       -- 1 = first position of primary key, 2 = second position...
    is_identity_yn              varchar2(1)
                                constraint wwv_dict_cache_col_is_iden_ck
                                check ( is_identity_yn in ('Y','N') ),
    single_col_unique_con_yn    varchar2(1)
                                constraint wwv_dict_cache_col_s_unique_ck
                                check (single_col_unique_con_yn in ('Y','N')),
    is_virtually_unique_yn      varchar2(1)
                                constraint wwv_dict_cache_col_v_unique_ck
                                check (is_virtually_unique_yn in ('Y','N')),
    is_fk_yn                    varchar2(1)
                                constraint wwv_dict_cache_col_is_fk_ck
                                check (is_fk_yn in ('Y','N')),
    is_fk_indexed_yn            varchar2(1)
                                constraint wwv_dict_cache_col_fk_idxed_ck
                                check (is_fk_indexed_yn in ('Y','N')),    -- mike: for future, just do leading edge fk
    --
    -- drill down
    --
    drill_down_table            varchar2(255), -- mike new
    drill_down_display_column   varchar2(255), -- mike new
    drill_down_return_column    varchar2(255), -- mike
    --
    -- minimum and maximum values
    --
    low_value                   varchar2(4000),
    high_value                  varchar2(4000),
    low_number                  number,
    high_number                 number,
    low_date                    date,
    high_date                   date,
    --
    -- chartability, filterability
    --
    filterable_score            number,
    num_not_null                number,
    pct_null                    number,
    --
    -- relatied queries
    --
    recommend_chart_type        varchar2(255),    -- what type of chart display is recommended based on distinct values (pie, bar)
    fk_chart_query              varchar2(4000),   -- fk column chart query
    chart_label_column          varchar2(255),    --
    chart_value_column          varchar2(255),    --
    column_query                varchar2(4000),   -- mike review: non fk column chart query
    static_lov                  varchar2(4000)    -- Static lov for bucket ranges
    )
/

create  index  wwv_dictionary_cache_col_idx1 on wwv_dictionary_cache_col (object_cache_id)
/
create  index  wwv_dictionary_cache_col_idx2 on wwv_dictionary_cache_col (security_group_id, owner_name, table_name)
/

create table wwv_dictionary_cache_fkcon (
    id                          number
                                constraint wwv_dict_cache_fkcon_pk primary key,
    object_cache_id             number
                                constraint wwv_dict_cache_fkcon_fk
                                references wwv_dictionary_cache_obj
                                on delete cascade,
    security_group_id           number not null,
    apx_cache_date              date,
    --
    constraint_name             varchar2(255) not null,     -- database constraint name
    --
    child_owner                 varchar2(255) not null,
    child_table                 varchar2(255) not null,
    child_column                varchar2(255) not null,
    position                    number        not null,     --
    --
    parent_owner                varchar2(255) not null,
    parent_table                varchar2(255) not null,
    parent_column               varchar2(255) not null,     -- parent column
    --
    is_single_col_fk_yn         varchar2(1)
                                constraint wwv_dict_cache_fkcon_sc_ck
                                check (is_single_col_fk_yn in ('Y','N')),
    parent_display_column       varchar2(255)                             -- this is the display column for list of values or lookup
    )
/

create index wwv_dict_cache_fkcon_idx1 on wwv_dictionary_cache_fkcon (object_cache_id)
/
create index wwv_dict_cache_fkcon_idx2 on wwv_dictionary_cache_fkcon (security_group_id, child_owner, child_table)
/



--##############################################################################
--#
--# APPLICATION > SHARED COMPONENTS > SERVICE CATALOGS
--#
--##############################################################################
prompt APPLICATION > SHARED COMPONENTS > SERVICE CATALOGS

--==============================================================================
create table wwv_web_src_catalog_groups (
    id                              number
                                    constraint wwv_websrc_catgrps_pk
                                    primary key,
    security_group_id               number not null
                                    constraint wwv_websrc_catgrps_sgid_fk
                                    references wwv_flow_companies( provisioning_company_id )
                                    on delete cascade,
    --
    name                            varchar2(255) not null,
    icon                            varchar2(255),
    description                     varchar2(4000),
    --
    -- Audit
    last_updated_by                 varchar2(255),
    last_updated_on                 date,
    created_by                      varchar2(255),
    created_on                      date )
/

alter table wwv_web_src_catalog_groups add constraint wwv_websrc_catgrps_name_uk unique (security_group_id, name) using index compress 1
/

--==============================================================================
create table wwv_web_src_catalogs (
    id                              number
                                    constraint wwv_websrc_catalogs_pk
                                    primary key,
    security_group_id               number not null
                                    constraint wwv_websrc_catalogs_sgid_fk
                                    references wwv_flow_companies( provisioning_company_id )
                                    on delete cascade,
    --
    catalog_group_id                number
                                    constraint wwv_websrc_catalogs_catgrps_fk
                                    references wwv_web_src_catalog_groups,
    name                            varchar2(255) not null,
    internal_name                   varchar2(255) not null
                                    constraint wwv_flow_catalog_int_name_ck
                                               check (upper(internal_name)=internal_name),
    icon                            varchar2(255),
    description                     varchar2(4000),
    --
    -- attributes to populate REST catalog contents from a URL.
    --
    endpoint_url                    varchar2(4000),
    token_server_url                varchar2(4000),
    proxy_server                    varchar2(4000),
    credential_id                   number
                                    constraint wwv_websrc_catalogs_credid_fk
                                    references wwv_credentials
                                    on delete set null
                                    deferrable initially deferred,
    --
    format                          varchar2(4) not null
                                    constraint wwv_websrc_catalogs_format_ck
                                    check ( format in ( 'APEX' ) ),          -- other formats (e.g. openAPI) to be added once
                                                                             -- APEX supports them
    --
    -- defaults for services within the catalog
    --
    default_plugin_internal_name    varchar2(255)
                                    constraint wwv_websrc_catalogs_plugin_ck
                                    check (
                                        default_plugin_internal_name like 'NATIVE\_%' escape '\' or
                                        default_plugin_internal_name like 'PLUGIN\_%' escape '\'),
    default_authentication_type     varchar2(25)
                                    constraint wwv_websrc_catalogs_dfathty_ck check (
                                    default_authentication_type in ( 'BASIC',
                                                                     'OAUTH2_CLIENT_CREDENTIALS',
                                                                     'OCI',
                                                                     'HTTP_HEADER',
                                                                     'HTTP_QUERY_STRING' )),
    --
    version                         number,
    last_imported_at                timestamp with time zone,
    last_import_file                blob,
    --
    -- Audit
    last_updated_by                 varchar2(255),
    last_updated_on                 date,
    created_by                      varchar2(255),
    created_on                      date )
/

alter table wwv_web_src_catalogs add constraint wwv_websrc_catalogs_name_uk unique (catalog_group_id, name) using index compress 1
/
alter table wwv_web_src_catalogs add constraint wwv_websrc_catalogs_intname_uk unique (security_group_id, internal_name) using index compress 1
/

create index wwv_websrc_catalogs_credid_fx    on wwv_web_src_catalogs (credential_id)         compress
/

--==============================================================================
create table wwv_web_src_catalog_plugins (
    id                              number
                                    constraint wwv_websrc_catalog_plugins_pk
                                    primary key,
    security_group_id               number not null
                                    constraint wwv_websrc_catplgs_sgid_fk
                                    references wwv_flow_companies( provisioning_company_id )
                                    on delete cascade,
    --
    catalog_id                      number
                                    constraint wwv_websrc_catplgs_catalogs_fk
                                    references wwv_web_src_catalogs
                                    on delete cascade,
    --
    plugin_internal_name            varchar2(255) not null
                                    constraint wwv_websrc_catplgs_plgname_ck
                                    check ( plugin_internal_name like 'PLUGIN\_%' escape '\'),
    plugin_display_name             varchar2(255) not null,
    plugin_export                   clob,
    plugin_version                  varchar2(30),
    --
    -- Audit
    last_updated_by                 varchar2(255),
    last_updated_on                 date,
    created_by                      varchar2(255),
    created_on                      date )
/

alter table wwv_web_src_catalog_plugins add constraint wwv_websrc_catplgs_name_uk unique (catalog_id, plugin_internal_name) using index compress 1
/

create index wwv_websrc_catplgs_sgid_fx       on wwv_web_src_catalog_plugins (security_group_id)     compress
/

--==============================================================================
create table wwv_web_src_catalog_services (
    id                              number
                                    constraint wwv_websrc_catsrvcs_pk
                                    primary key,
    security_group_id               number not null
                                    constraint wwv_websrc_catsrvcs_sgid_fk
                                    references wwv_flow_companies( provisioning_company_id )
                                    on delete cascade,
    catalog_id                      number not null
                                    constraint wwv_websrc_catsrvcs_catlgs_fk
                                    references wwv_web_src_catalogs
                                    on delete cascade,
    --
    name                            varchar2(255) not null,
    icon                            varchar2(255),
    description                     varchar2(4000),
    --
    -- the endpoint URL can be split up into BASE_URL and SERVICE_PATH. When a new REST data source is
    -- created, the BASE_URL will be used for the remote server.
    base_url                        varchar2(4000),
    service_path                    varchar2(4000),
    --
    auth_server_base_url            varchar2(4000),
    auth_server_url_path            varchar2(4000),
    --
    plugin_internal_name            varchar2(255)
                                    constraint wwv_websrc_catsrvcs_plgname_ck
                                    check (
                                        plugin_internal_name like 'NATIVE\_%' escape '\' or
                                        plugin_internal_name like 'PLUGIN\_%' escape '\'),
    authentication_type             varchar2(25)
                                    constraint wwv_websrc_catsrvcs_authtyp_ck check (
                                    authentication_type in ( 'BASIC',
                                                             'OAUTH2_CLIENT_CREDENTIALS',
                                                             'OCI',
                                                             'HTTP_HEADER',
                                                             'HTTP_QUERY_STRING' )),
    --
    -- all REST source operations, parameters and data profile information will be stored as
    -- JSON format to simplify the data model.
    details_json                    clob,
    --
    version                         number,
    last_imported_at                timestamp with time zone,
    --
    -- Audit
    last_updated_by                 varchar2(255),
    last_updated_on                 date,
    created_by                      varchar2(255),
    created_on                      date )
/

alter table wwv_web_src_catalog_services add constraint wwv_websrc_catsrvcs_name_uk unique (catalog_id, name) using index compress 1
/

create index wwv_websrc_catsrvcs_sgid_fx      on wwv_web_src_catalog_services (security_group_id) compress
/


prompt ...done create dev tables
set define '^'
