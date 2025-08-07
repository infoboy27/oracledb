set define '^' verify off
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--  NAME
--    object_dependencies_tables.sql
--
--  DESCRIPTION
--    Create tables for Object Dependency reports
--
--  MODIFIED   (MM/DD/YYYY)
--  JPKEMP      02/19/2024 - Created
--
--------------------------------------------------------------------------------

prompt ... Create APEX Object Dependency tables

create table wwv_flow_used_db_objects (
    id                          number          not null
                                                constraint used_db_objects_pk
                                                primary key,
    security_group_id           number          not null,
    flow_id                     number          not null
                                                constraint used_db_objects_flows_fk
                                                references wwv_flows
                                                on delete cascade,
    referenced_type             varchar2(100)   not null,
    referenced_owner            varchar2(128),
    referenced_name             varchar2(128)   not null,
    referenced_sub_name         varchar2(128),
    is_system_owner             varchar2(1)     check (is_system_owner in ('Y','N')),
    usage_count                 number,
    reference_count             number,
    parent_id                   number,
    -- object metadata
    created                     date,
    oracle_maintained           varchar2(1),
    last_ddl_time               date,
    status                      varchar2(7),
    temporary                   varchar2(1),
    generated                   varchar2(1),
    -- column metadata
    data_type                   varchar2(128),
    data_length                 number,
    data_precision              number,
    data_scale                  number,
    nullable                    varchar2(1),
    column_id                   number,
    data_default                varchar2(4000),
    char_length                 number,
    char_used                   varchar2(1),
    virtual_column              varchar2(3),
    user_generated              varchar2(3),
    default_on_null             varchar2(3),
    identity_column             varchar2(3)
    --
    )
/

alter table wwv_flow_used_db_objects
    add constraint used_db_objects_uk unique (flow_id, referenced_owner, referenced_name, referenced_sub_name, referenced_type)
    using index compress
/

create index used_db_objects_flow_fx
    on wwv_flow_used_db_objects (flow_id, security_group_id)
/

create index used_db_objects_sec_fx
    on wwv_flow_used_db_objects (security_group_id)
/

comment on column wwv_flow_used_db_objects.referenced_sub_name is
    'Depending on the referenced type may contain column name, function/procedure name or stay empty';
comment on column wwv_flow_used_db_objects.is_system_owner
    is 'Y if the owner schema is a system schema (e.g. SYS, APEX, ORDS, PUBLIC)';

create table wwv_flow_used_obj_comp_props (
    id                          number          not null
                                                constraint used_obj_comp_props_pk
                                                primary key,
    security_group_id           number          not null,
    flow_id                     number          not null
                                                constraint used_obj_comp_props_flows_fk
                                                references wwv_flows
                                                on delete cascade,
    page_id                     number,
    component_type_id           number          not null
                                                constraint used_obj_comp_props_ctype_fk
                                                references wwv_pe_component_types
                                                on delete cascade,
    component_id                varchar2(4000)  not null,
    component_display_name      varchar2(4000),
    property_id                 number          not null,
    is_plugin_attribute         varchar2(1)     not null
                                                constraint used_obj_comp_props_ipa_ck
                                                check (is_plugin_attribute in ('Y','N')),
    analyzed_at                 date,
    error_message               varchar2(4000),
    code_fragment               clob            not null,
    code_fragment_hash          varchar2(64)    not null,
    component_table_name        varchar2(128),
    property_db_column          varchar2(128),
    property_db_column_json_key varchar2(4000),
    parent_component_id         varchar2(4000),
    parent_component_table_name varchar2(128) )
/

alter table wwv_flow_used_obj_comp_props
    add constraint used_obj_comp_props_uk unique (component_type_id, flow_id, component_id, property_id)
/

alter table wwv_flow_used_obj_comp_props
    add constraint used_obj_comp_props_steps_fk
        foreign key (flow_id, page_id)
        references wwv_flow_steps (flow_id, id)
        on delete cascade
/

create index used_obj_comp_props_steps_fx
    on wwv_flow_used_obj_comp_props (flow_id, page_id, security_group_id)
/

create index used_obj_comp_props_sec_fx
    on wwv_flow_used_obj_comp_props (security_group_id)
/

comment on column wwv_flow_used_obj_comp_props.component_type_id
    is 'Contains the foreign key to the wwv_pe_component_types record.';
comment on column wwv_flow_used_obj_comp_props.property_id
    is 'Contains the internal ID for the component or plugin property.';
comment on column wwv_flow_used_obj_comp_props.analyzed_at
    is 'If null, code fragment has not yet been analyzed';
comment on column wwv_flow_used_obj_comp_props.code_fragment_hash
    is 'Hash of code_fragment for fast detection of modifications. SH256';
comment on column wwv_flow_used_obj_comp_props.component_table_name
    is 'Metadata table where the code fragment was found';
comment on column wwv_flow_used_obj_comp_props.property_db_column
    is 'Metadata column where the code fragment was found';
comment on column wwv_flow_used_obj_comp_props.property_db_column_json_key
    is 'Metadata json key where the code fragment was found';
comment on column wwv_flow_used_obj_comp_props.parent_component_id
    is 'Component ID of the parent component, if applicable';
comment on column wwv_flow_used_obj_comp_props.parent_component_table_name
    is 'Metadata table of the parent component, if applicable';

create table wwv_flow_used_obj_dependencies (
    id                          number          not null
                                                constraint used_obj_dependencies_pk
                                                primary key,
    security_group_id           number          not null,
    flow_id                     number          not null
                                                constraint used_obj_dependencies_flows_fk
                                                references wwv_flows
                                                on delete cascade,
    used_db_object_id           number          not null
                                                constraint used_obj_dep_db_objects_fk
                                                references wwv_flow_used_db_objects
                                                on delete cascade,
    used_db_object_comp_prop_id number          not null
                                                constraint used_obj_dep_comp_props_fk
                                                references wwv_flow_used_obj_comp_props
                                                on delete cascade )
/

alter table wwv_flow_used_obj_dependencies
    add constraint used_obj_dependencies_uk unique (used_db_object_id, used_db_object_comp_prop_id)
/

create index used_obj_dependencies_flows_fx
    on wwv_flow_used_obj_dependencies (flow_id, security_group_id)
/

create index used_obj_dep_comp_props_fx
    on wwv_flow_used_obj_dependencies (used_db_object_comp_prop_id)
/

create index used_obj_dependencies_sec_fx
    on wwv_flow_used_obj_dependencies (security_group_id)
/

--------------------------------------------------------------------------------

prompt ...done creating APEX Object Dependency tables

set define '^'