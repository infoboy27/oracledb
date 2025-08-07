set define '^' verify off
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--  NAME
--    object_dependencies_views.sql
--
--  DESCRIPTION
--    Create views for Object Dependency reports
--
--  MODIFIED   (MM/DD/YYYY)
--  JPKEMP      02/19/2024 - Created
--
--------------------------------------------------------------------------------

prompt ... Create APEX Object Dependency views

-----------------------------------------------------
-- OBJECT DEPENDENCY
--

--------------------------------------------------------------------------------
--==============================================================================
prompt ...wwv_used_db_object_comp_props view
create or replace view wwv_used_db_object_comp_props as
with q_default_group as (
    select wwv_flow_lang.system_message( title ) as group_name
    from   wwv_pe_display_groups
    where  name = 'SETTINGS' ),
q_comp_prop as (
    select cp.component_type_id,
           cp.property_id,
           dg.title as group_title,
           p.prompt
      from wwv_pe_component_props cp,
           wwv_pe_properties      p,
           wwv_pe_display_groups  dg -- OUTER
     where p.id     = cp.property_id
       and dg.id(+) = p.display_group_id ),
q_plug_prop as (
    select pa.id,
           pa.security_group_id,
           pa.prompt,
           coalesce(pg.title,
                    (select group_name from q_default_group) )  as group_title
      from wwv_flow_plugin_attributes  pa,
           wwv_flow_plugin_attr_groups pg -- OUTER
     where pg.id(+)                = pa.attribute_group_id
       and pg.security_group_id(+) = pa.security_group_id )
select f.workspace,
       f.workspace_display_name,
       ocp.flow_id,
       f.application_name,
       ocp.id,
       ocp.page_id,
       wwv_flow_lang.system_message( ct.singular_title )
                                                as component_type_name,
       ocp.component_type_id,
       ocp.component_id,
       ocp.component_display_name,
       ocp.property_id,
       case
         when q_plug_prop.id is not null
           then q_plug_prop.group_title
         when q_comp_prop.group_title is not null
           then wwv_flow_lang.system_message( q_comp_prop.group_title )
       end                                      as property_group_name,
       case
         when q_plug_prop.id is not null
           then q_plug_prop.prompt
         when q_comp_prop.prompt is not null
           then wwv_flow_lang.system_message( q_comp_prop.prompt )
       end                                      as property_name,
       ocp.code_fragment,
       ocp.error_message,
       ocp.analyzed_at,
       ocp.component_table_name,
       ocp.property_db_column,
       ocp.property_db_column_json_key,
       ocp.parent_component_id,
       ocp.parent_component_table_name,
       case when ocp.error_message is null then
         ( select count(*)
             from wwv_flow_used_obj_dependencies uod
            where uod.flow_id                     = ocp.flow_id
              and uod.security_group_id           = ocp.security_group_id
              and uod.used_db_object_comp_prop_id = ocp.id )
       end                                      as object_dependency_count,
       ct.edit_url,
       ct.is_shared_designer,
       ocp.security_group_id
  from wwv_flow_used_obj_comp_props  ocp
  join wwv_flow_authorized_extension f
    on     f.workspace_id           = ocp.security_group_id
       and f.application_id         = ocp.flow_id
  join wwv_pe_component_types        ct
    on ct.id = ocp.component_type_id
  -- each ocp should join to either a component or a plugin property:
  left join q_comp_prop
    on     q_comp_prop.component_type_id = ocp.component_type_id
       and q_comp_prop.property_id       = ocp.property_id
  left join q_plug_prop
    on     q_plug_prop.id                = ocp.property_id
       and q_plug_prop.security_group_id in ( ocp.security_group_id, 10)
/

--==============================================================================
prompt ...apex_used_db_object_comp_props view
create or replace view apex_used_db_object_comp_props as
select workspace,
       workspace_display_name,
       flow_id as application_id,
       application_name,
       id,
       page_id,
       component_type_name,
       component_display_name,
       property_group_name,
       property_name,
       code_fragment,
       error_message,
       analyzed_at,
       object_dependency_count
  from wwv_used_db_object_comp_props
/

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_used_db_object_comp_props',
    p_table_comment     => 'Application code fragment analysed for database object dependencies',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace'               , 'A work area mapped to one or more database schemas',
      'workspace_display_name'  , 'Display name for the workspace',
      'application_id'          , 'Application Primary Key, Unique over all workspaces',
      'application_name'        , 'Identifies the application',
      'id'                      , 'Identifies the code fragment',
      'page_id'                 , 'Identifies page number',
      'component_type_name'     , 'Name of component type',
      'component_display_name'  , 'Component name',
      'property_group_name'     , 'Property display group',
      'property_name'           , 'Name of component/plugin property',
      'code_fragment'           , 'The code fragment analysed for dependencies',
      'error_message'           , 'Compilation error (dependency analysis unable to be completed)',
      'analyzed_at'             , 'Date/time when this property was analyzed for dependencies',
      'object_dependency_count' , 'Count of objects this property references'
    )
  );
end;
/

--==============================================================================
prompt ...wwv_used_db_objects view
create or replace view wwv_used_db_objects as
select f.workspace,
       f.workspace_display_name,
       uo.flow_id,
       f.application_name,
       uo.id,
       uo.referenced_type,
       uo.referenced_owner,
       uo.referenced_name,
       uo.referenced_sub_name,
       case when uo.referenced_owner is not null then uo.referenced_owner || '.' end ||
       uo.referenced_name ||
       case when uo.referenced_sub_name is not null then '.' || uo.referenced_sub_name end
                           as full_name,
       uo.usage_count,
       uo.reference_count,
       uo.parent_id,
       case
         when uo.referenced_sub_name is not null then
           uo.referenced_owner || '.' || uo.referenced_name
       end                 as parent_name,
       uo.is_system_owner,
       uo.created,
       uo.oracle_maintained,
       uo.last_ddl_time,
       uo.status,
       uo.temporary,
       uo.generated,
       uo.data_type,
       uo.data_length,
       uo.data_precision,
       uo.data_scale,
       uo.nullable,
       uo.column_id,
       uo.data_default,
       uo.char_length,
       uo.char_used,
       uo.virtual_column,
       uo.user_generated,
       uo.default_on_null,
       uo.identity_column,
       uo.security_group_id
  from wwv_flow_used_db_objects      uo,
       wwv_flow_authorized_extension f
 where f.application_id = uo.flow_id
   and f.workspace_id   = uo.security_group_id
/

--==============================================================================
prompt ...apex_used_db_objects view
create or replace view apex_used_db_objects as
select workspace,
       workspace_display_name,
       flow_id as application_id,
       application_name,
       id,
       referenced_type,
       referenced_owner,
       referenced_name,
       referenced_sub_name,
       usage_count,
       reference_count,
       parent_id,
       parent_name,
       is_system_owner,
       created,
       oracle_maintained,
       last_ddl_time,
       status,
       temporary,
       generated,
       data_type,
       data_length,
       data_precision,
       data_scale,
       nullable,
       column_id,
       data_default,
       char_length,
       char_used,
       virtual_column,
       user_generated,
       default_on_null,
       identity_column
  from wwv_used_db_objects
/

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_used_db_objects',
    p_table_comment     => 'Database object referenced by an application',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace'              , 'A work area mapped to one or more database schemas',
      'workspace_display_name' , 'Display name for the workspace',
      'application_id'         , 'Application Primary Key, Unique over all workspaces',
      'application_name'       , 'Identifies the application',
      'id'                     , 'Identifies the database object',
      'referenced_type'        , 'Type of database object',
      'referenced_owner'       , 'Owner of the database object',
      'referenced_name'        , 'Name of database object',
      'referenced_sub_name'    , 'Depending on the referenced type may contain column name, function/procedure name or stay empty',
      'referenced_sub_name'    , 'Depending on the referenced type may contain column name, function/procedure name or stay empty',
      'usage_count'            , 'Count of properties in the application that refer to this object',
      'reference_count'        , 'Count of other objects referenced by the application that are within this one',
      'parent_id'              , 'Reference to parent database object',
      'parent_name'            , 'Name of parent datatabase object',
      'is_system_owner'        , 'Y if the object is owned by an Oracle system schema or maintained by Oracle-supplied scripts',
      'created'                , 'Date/time when the object was created',
      'oracle_maintained'      , 'Y if the object was created and is maintained by Oracle-supplied scripts',
      'last_ddl_time'          , 'Date/time when the object (or a dependent object) was last modified from a DDL statement (including grants and revokes)',
      'status'                 , 'Status of the object (VALID or INVALID)',
      'temporary'              , 'Y if the object is temporary (current session can see only data that it itself placed in the object)',
      'generated'              , 'Y if the name of the object was system-generated',
      'data_type'              , 'For columns: data type of the column',
      'data_length'            , 'For columns: length of the column (in bytes)',
      'data_precision'         , 'For columns: decimal precision for NUMBER datatype; binary precision for FLOAT datatype',
      'data_scale'             , 'For columns: digits to the right of the decimal point in a number',
      'nullable'               , 'For columns: indicates whether the column allows NULLs',
      'column_id'              , 'For columns: sequence number of the column',
      'data_default'           , 'For columns: default value of the column',
      'char_length'            , 'For columns: length of the column in characters (CHAR, VARCHAR2, NCHAR, NVARCHAR2)',
      'char_used'              , 'For columns: B if the column uses BYTE length semantics, C if CHAR length semantics (CHAR, VARCHAR2, NCHAR, NVARCHAR2)',
      'virtual_column'         , 'For columns: YES if the column is a virtual column',
      'user_generated'         , 'For columns: YES if the column is a user-generated column, NO if it was generated by the system',
      'default_on_null'        , 'For columns: YES if the column has DEFAULT ON NULL semantics',
      'identity_column'        , 'For columns: YES if the column is an identity column'
    )
  );
end;
/

--==============================================================================
prompt ...wwv_used_db_obj_dependencies view
create or replace view wwv_used_db_obj_dependencies as
select f.workspace,
       f.workspace_display_name,
       uod.flow_id,
       f.application_name,
       ocp.page_id,
       ocp.component_type_id,
       ocp.component_type_name,
       ocp.component_id,
       ocp.component_display_name,
       ocp.property_group_name,
       ocp.property_name,
       ocp.code_fragment,
       ocp.analyzed_at,
       ocp.component_table_name,
       ocp.property_db_column,
       ocp.property_db_column_json_key,
       ocp.parent_component_id,
       ocp.parent_component_table_name,
       ocp.edit_url,
       ocp.is_shared_designer,
       uo.referenced_type,
       uo.referenced_owner,
       uo.referenced_name,
       uo.referenced_sub_name,
       uo.is_system_owner,
       uo.created,
       uo.oracle_maintained,
       uo.last_ddl_time,
       uo.status,
       uo.temporary,
       uo.generated,
       uo.data_type,
       uo.data_length,
       uo.data_precision,
       uo.data_scale,
       uo.nullable,
       uo.column_id,
       uo.data_default,
       uo.char_length,
       uo.char_used,
       uo.virtual_column,
       uo.user_generated,
       uo.default_on_null,
       uo.identity_column,
       uo.parent_id as used_db_object_parent_id,
       uod.used_db_object_comp_prop_id,
       uod.used_db_object_id,
       uod.security_group_id
  from wwv_flow_used_obj_dependencies uod,
       wwv_flow_authorized_extension  f,
       wwv_flow_used_db_objects       uo,
       wwv_used_db_object_comp_props  ocp
 where f.workspace_id        = uod.security_group_id
   and f.application_id      = uod.flow_id
   and uo.id                 = uod.used_db_object_id
   and uo.security_group_id  = uod.security_group_id
   and ocp.id                = uod.used_db_object_comp_prop_id
   and ocp.security_group_id = uod.security_group_id
/

--==============================================================================
prompt ...apex_used_db_object_dependencies view
create or replace view apex_used_db_obj_dependencies as
select workspace,
       workspace_display_name,
       flow_id as application_id,
       application_name,
       page_id,
       component_type_name,
       component_display_name,
       property_group_name,
       property_name,
       code_fragment,
       analyzed_at,
       referenced_type,
       referenced_owner,
       referenced_name,
       referenced_sub_name,
       is_system_owner,
       created,
       oracle_maintained,
       last_ddl_time,
       status,
       temporary,
       generated,
       data_type,
       data_length,
       data_precision,
       data_scale,
       nullable,
       column_id,
       data_default,
       char_length,
       char_used,
       virtual_column,
       user_generated,
       default_on_null,
       identity_column,
       used_db_object_comp_prop_id,
       used_db_object_id
  from wwv_used_db_obj_dependencies
/

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_used_db_obj_dependencies',
    p_table_comment     => 'Database object referenced by an application component',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace'                      , 'A work area mapped to one or more database schemas',
      'workspace_display_name'         , 'Display name for the workspace',
      'application_id'                 , 'Application Primary Key, Unique over all workspaces',
      'application_name'               , 'Identifies the application',
      'page_id'                        , 'Identifies page number',
      'component_type_name'            , 'Name of component type',
      'component_display_name'         , 'Component name',
      'property_group_name'            , 'Property display group',
      'property_name'                  , 'Name of component/plugin property',
      'code_fragment'                  , 'The code fragment analysed for dependencies',
      'analyzed_at'                    , 'Date/time when this property was analyzed for dependencies',
      'referenced_type'                , 'Type of database object',
      'referenced_owner'               , 'Owner of the database object',
      'referenced_name'                , 'Name of database object',
      'referenced_sub_name'            , 'Depending on the referenced type may contain column name, function/procedure name or stay empty',
      'is_system_owner'                , 'Y if the object is owned by an Oracle system schema',
      'created'                        , 'Date/time when the object was created',
      'oracle_maintained'              , 'Y if the object was created and is maintained by Oracle-supplied scripts',
      'last_ddl_time'                  , 'Date/time when the object (or a dependent object) was last modified from a DDL statement (including grants and revokes)',
      'status'                         , 'Status of the object (VALID or INVALID)',
      'temporary'                      , 'Y if the object is temporary (current session can see only data that it itself placed in the object)',
      'generated'                      , 'Y if the name of the object was system-generated',
      'data_type'                      , 'For columns: data type of the column',
      'data_length'                    , 'For columns: length of the column (in bytes)',
      'data_precision'                 , 'For columns: decimal precision for NUMBER datatype; binary precision for FLOAT datatype',
      'data_scale'                     , 'For columns: digits to the right of the decimal point in a number',
      'nullable'                       , 'For columns: indicates whether the column allows NULLs',
      'column_id'                      , 'For columns: sequence number of the column',
      'data_default'                   , 'For columns: default value of the column',
      'char_length'                    , 'For columns: length of the column in characters (CHAR, VARCHAR2, NCHAR, NVARCHAR2)',
      'char_used'                      , 'For columns: B if the column uses BYTE length semantics, C if CHAR length semantics (CHAR, VARCHAR2, NCHAR, NVARCHAR2)',
      'virtual_column'                 , 'For columns: YES if the column is a virtual column',
      'user_generated'                 , 'For columns: YES if the column is a user-generated column, NO if it was generated by the system',
      'default_on_null'                , 'For columns: YES if the column has DEFAULT ON NULL semantics',
      'identity_column'                , 'For columns: YES if the column is an identity column',
      'used_db_object_comp_prop_id'    , 'Identifies the application component property',
      'used_db_object_id'              , 'Identifies the database object dependency'
    )
  );
end;
/

--------------------------------------------------------------------------------

--==============================================================================
-- view to display the database object dependency tree  
--==============================================================================
prompt ...wwv_flow_obj_dep_entries

create or replace view wwv_flow_obj_dep_entries
as
with apex_ss as (
    select ( select nv('FB_FLOW_ID') from sys.dual ) fb_flow_id,
           ( select nv('FLOW_SESSION') from sys.dual) flow_session,
           ( select nv('FLOW_SECURITY_GROUP_ID') from sys.dual ) flow_security_group_id
      from sys.dual )
-- generate top-level reference type nodes, plus type nodes under system dependencies
select distinct
       case when t.is_system_owner = 'Y' then 'SYSTEM_DEPENDENCIES/' end ||
       t.referenced_type as node_id,
       case when t.is_system_owner = 'Y' then 'SYSTEM_DEPENDENCIES' end as parent_id,
       t.referenced_type,
       '' as referenced_name,
       '' as referenced_sub_name,
       wwv_flow_lang_dev.builder_message('DEP.'||replace(t.referenced_type, ' ', '_')||'_PLURAL')
           as node_label,
       null as search_text,
       wwv_flow_escape.html_attribute('icon-db-'||lower(translate(t.referenced_type,'_ ','--'))) as icon_css,
       instr('TABLE,VIEW,SEQUENCE,TYPE,PACKAGE,PROCEDURE,FUNCTION,NESTED TABLE,MVIEW,SYNONYM,SCHEMA',
             t.referenced_type) as sort_col
  from wwv_used_db_objects t, 
       apex_ss
 where t.parent_id is null
   and t.flow_id           = apex_ss.fb_flow_id
   and t.security_group_id = apex_ss.flow_security_group_id
   and t.usage_count > 0
union all
-- generate node for each object
select to_char(t.id) as node_id,
       case when t.parent_id is null and t.is_system_owner = 'Y' then
           'SYSTEM_DEPENDENCIES/' || t.referenced_type
       else
           nvl(to_char(t.parent_id), t.referenced_type)
       end as parent_id,
       t.referenced_type,
       t.referenced_name,
       t.referenced_sub_name,
       case when     t.referenced_sub_name is null
                 and t.is_system_owner     = 'Y'
                 and t.referenced_type    != 'SCHEMA' then
           -- include the owner in the name of system dependency objects
           t.referenced_owner || '.'
       end || nvl(t.referenced_sub_name, t.referenced_name) as node_label,
       upper( t.referenced_owner || '.' ||
              t.referenced_name || '.' ||
              t.referenced_sub_name ) as search_text,
       wwv_flow_escape.html_attribute('icon-db-'||lower(translate(t.referenced_type,'_ ','--'))) as icon_css,
       row_number() over (order by
           case when t.is_system_owner = 'Y' then t.referenced_owner end nulls first,
           t.referenced_name,
           t.column_id,
           t.referenced_sub_name
       ) as sort_col
  from wwv_used_db_objects t, 
       apex_ss
 where t.flow_id           = apex_ss.fb_flow_id
   and t.security_group_id = apex_ss.flow_security_group_id
   and t.usage_count > 0
union all
-- generate top-level "Errors" node
select distinct
       '0' as node_id,
       NULL as parent_id,
       'ERROR' as referenced_type,
       '' as referenced_name,
       '' as referenced_sub_name,
       wwv_flow_lang_dev.builder_message('DEP.ERROR_COUNT', count(*) over ()) as node_label,
       null as search_text,
       'icon-db-errors' as icon_css,
       0 as sort_col
  from wwv_used_db_object_comp_props t, 
       apex_ss
 where t.flow_id           = apex_ss.fb_flow_id
   and t.security_group_id = apex_ss.flow_security_group_id
   and t.error_message is not null
union all
-- generate top-level "System Dependencies" node
select 'SYSTEM_DEPENDENCIES' as node_id,
       null as parent_id,
       'SYSTEM_DEPENDENCIES' as referenced_type,
       '' as referenced_name,
       '' as referenced_sub_name,
       wwv_flow_lang_dev.builder_message('DEP.SYSTEM_DEPENDENCY_PLURAL') as node_label,
       null as search_text,
       'icon-db-system-dependency' as icon_css,
       9999999999 as sort_col
  from wwv_used_db_objects t, 
       apex_ss
 where t.flow_id           = apex_ss.fb_flow_id
   and t.security_group_id = apex_ss.flow_security_group_id
   and t.is_system_owner = 'Y'
   and t.usage_count > 0
   and rownum = 1
/

--------------------------------------------------------------------------------

prompt ...done creating APEX Object Dependency views

set define '^'
