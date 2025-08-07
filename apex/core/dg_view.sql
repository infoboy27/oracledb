set define off verify off
prompt ...create ODG views

Rem  Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
Rem
Rem    NAME
Rem      odg_view.sql
Rem
Rem    DESCRIPTION
Rem      Create ODG views
Rem
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    jstraub     01/19/2021 - Created from Anton Nielsen, Neelesh Shah

--==============================================================================
-- Views used by the Data Generator API
--==============================================================================
prompt ...creating view 'apex_dg_blueprints';
create or replace view apex_dg_blueprints  as
select  w.workspace_id,
        w.workspace        workspace_name,
        b.id ,
        name,
        display_name,
        description,
        lang,
        default_schema,
        created_on,
        created_by,
        last_updated_on,
        last_updated_by
  from wwv_dg_blueprints             b,
       wwv_companies_auth_restricted w
  where b.security_group_id  =  w.workspace_id
;

comment on table  apex_dg_blueprints                               is 'Blueprint for data generation. See the apex_dg_data_gen API';
comment on column apex_dg_blueprints.workspace_id                  is 'Primary Key that identifies the workspace';
comment on column apex_dg_blueprints.workspace_name                is 'Name of the Workspace';
comment on column apex_dg_blueprints.id                            is 'Primary key that identifies the apex dg blueprint';
comment on column apex_dg_blueprints.name                          is 'The unique name of a blueprint within a workspace';
comment on column apex_dg_blueprints.display_name                  is 'The unique friendly name blueprint within a workspace';
comment on column apex_dg_blueprints.description                   is 'The decription of the blueprint';
comment on column apex_dg_blueprints.lang                          is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_blueprints.default_schema                is 'The default database schema';
comment on column apex_dg_blueprints.created_on                    is 'Auditing; date the record was created';
comment on column apex_dg_blueprints.created_by                    is 'Auditing; user that created the record';
comment on column apex_dg_blueprints.last_updated_on               is 'Auditing; date the record was last modified';
comment on column apex_dg_blueprints.last_updated_by               is 'Auditing; user that last modified the record';

prompt ...creating view 'apex_dg_builtin_2d_shapes';
create or replace view apex_dg_blueprint_samples as
select
    id,
    blueprint_json,
    sample_name,
    description,
    version_number,
    expected_runtime,
    created_by,
    created_on,
    last_updated_by,
    last_updated_on
from
    wwv_dg_blueprint_samples
;

comment on table  apex_dg_blueprint_samples                               is 'Sample JSON representations of blueprints';
comment on column apex_dg_blueprint_samples.id                            is 'Primary key that identifies the apex dg blueprint sample';
comment on column apex_dg_blueprint_samples.blueprint_json                is 'JSON representation of a blueprint. Can be converted to a blueprint using apex_dg_data_gen.import_blueprint.';
comment on column apex_dg_blueprint_samples.sample_name                   is 'The unique name of a blueprint sample';
comment on column apex_dg_blueprint_samples.description                   is 'The decription of the blueprint sample';
comment on column apex_dg_blueprint_samples.version_number                is 'The version number of the blueprint sample';
comment on column apex_dg_blueprint_samples.expected_runtime              is 'The expected amount of time this blueprint takes to run on a fast database server without a resource plan when prioritizing speed over randomness';
comment on column apex_dg_blueprint_samples.created_on                    is 'Auditing; date the record was created';
comment on column apex_dg_blueprint_samples.created_by                    is 'Auditing; user that created the record';
comment on column apex_dg_blueprint_samples.last_updated_on               is 'Auditing; date the record was last modified';
comment on column apex_dg_blueprint_samples.last_updated_by               is 'Auditing; user that last modified the record';

prompt ...creating view 'apex_dg_bp_data_sources';
create or replace view apex_dg_bp_data_sources  as
select  w.workspace_id,
        w.workspace        workspace_name,
        s.id,
        blueprint_id,
        name,
        data_source_type,
        table_name,
        sql_query,
        where_clause,
        order_by_column,
        created_on,
        created_by,
        last_updated_on,
        last_updated_by,
        inline_data
   from
      wwv_dg_blueprint_data_sources  s,
      wwv_companies_auth_restricted  w
   where
      s.security_group_id = w.workspace_id
;

comment on table  apex_dg_bp_data_sources                          is 'Custom locations to obtain data for a blueprint. See the apex_dg_data_gen API';
comment on column apex_dg_bp_data_sources.workspace_id             is 'Primary Key that identifies the workspace';
comment on column apex_dg_bp_data_sources.workspace_name           is 'Name of the Workspace';
comment on column apex_dg_bp_data_sources.id                       is 'Primary key that identifies the blueprint data source';
comment on column apex_dg_bp_data_sources.blueprint_id             is 'Primary key of the parent record';
comment on column apex_dg_bp_data_sources.name                     is 'Name of the data source, unique within the blueprint';
comment on column apex_dg_bp_data_sources.data_source_type         is 'Type of Data Source. See the apex_dg_data_gen API.';
comment on column apex_dg_bp_data_sources.table_name               is 'Table name associated with this data source. Must be in workspace schema.';
comment on column apex_dg_bp_data_sources.sql_query                is 'SQL Query associated with this data source. Must be runnable by workspace schema.';
comment on column apex_dg_bp_data_sources.where_clause             is 'where clause to apply to data source';
comment on column apex_dg_bp_data_sources.order_by_column          is 'order by column for data source. Not currently implemented.';
comment on column apex_dg_bp_data_sources.created_on               is 'Auditing; date the record was created';
comment on column apex_dg_bp_data_sources.created_by               is 'Auditing; user that created the record';
comment on column apex_dg_bp_data_sources.last_updated_on          is 'Auditing; date the record was last modified';
comment on column apex_dg_bp_data_sources.last_updated_by          is 'Auditing; user that last modified the record';
comment on column apex_dg_bp_data_sources.inline_data              is 'Not yet supported';

prompt ...creating view 'apex_dg_bp_tab_columns';
create or replace view apex_dg_bp_tab_columns  as
select  w.workspace_id,
        w.workspace        workspace_name,
        t.id,
        blueprint_table_id,
        name,
        display_name,
        seq,
        lang,
        decode(data_source_type,
          'BLUEPRINT','Blueprint',
          'BUILTIN','Builtin',
          'DATA_SOURCE','Data Source',
          'FORMULA','Formula',
          'INLINE','Inline',
          'SEQUENCE','Sequence',
          'TABLE_COLUMN','Table Column',
          data_source_type) data_source_type,
        data_source,
        min_numeric_value,
        max_numeric_value,
        numeric_precision,
        min_date_value,
        max_date_value,
        date_precision,
        sequence_start_with,
        sequence_increment,
        data_source_table,
        data_source_column,
        depends_on,
        formula,
        custom_attributes,
        percent_blank,
        created_on,
        created_by,
        last_updated_on,
        last_updated_by,
        native_datatype,
        data_format_mask,
        multi_value_yn,
        mv_delimiter,
        mv_min_entries,
        mv_max_entries,
        formula_lang,
        mv_partition_by,
        mv_format,
        max_length,
        mv_unique
   from
      wwv_dg_blueprint_tab_columns  t,
      wwv_companies_auth_restricted w
   where
      t.security_group_id = w.workspace_id
;

comment on table  apex_dg_bp_tab_columns                           is 'Defintion of output columns for data generation. Must be unique within a blueprint. See the apex_dg_data_gen API.';
comment on column apex_dg_bp_tab_columns.workspace_id              is 'Primary Key that identifies the workspace';
comment on column apex_dg_bp_tab_columns.workspace_name            is 'Name of the Workspace';
comment on column apex_dg_bp_tab_columns.id                        is 'Primary key that identifies the blueprint tab column';
comment on column apex_dg_bp_tab_columns.blueprint_table_id        is 'Primary key of the parent record';
comment on column apex_dg_bp_tab_columns.name                      is 'Name of column. Must be unique within a blueprint table. See the apex_dg_data_gen API.';
comment on column apex_dg_bp_tab_columns.display_name              is 'Display name of column.';
comment on column apex_dg_bp_tab_columns.seq                       is 'Sequence in which this column is in the output file';
comment on column apex_dg_bp_tab_columns.lang                      is 'Language code for the generated data of this column, e.g. en';
comment on column apex_dg_bp_tab_columns.data_source_type          is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.data_source               is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.min_numeric_value         is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.max_numeric_value         is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.numeric_precision         is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.min_date_value            is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.max_date_value            is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.date_precision            is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.sequence_start_with       is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.sequence_increment        is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.data_source_table         is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.data_source_column        is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.depends_on                is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.formula                   is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.custom_attributes         is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.percent_blank             is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.created_on                is 'Auditing; date the record was created';
comment on column apex_dg_bp_tab_columns.created_by                is 'Auditing; user that created the record';
comment on column apex_dg_bp_tab_columns.last_updated_on           is 'Auditing; date the record was last modified';
comment on column apex_dg_bp_tab_columns.last_updated_by           is 'Auditing; user that last modified the record';
comment on column apex_dg_bp_tab_columns.native_datatype           is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.data_format_mask          is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.multi_value_yn            is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.mv_delimiter              is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.mv_min_entries            is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.mv_max_entries            is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.formula_lang              is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.mv_partition_by           is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.mv_format                 is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.max_length                is 'See the apex_dg_data_gen API';
comment on column apex_dg_bp_tab_columns.mv_unique                 is 'See the apex_dg_data_gen API';

prompt ...creating view 'apex_dg_bp_tables';
create or replace view apex_dg_bp_tables  as
select  w.workspace_id,
        w.workspace        workspace_name,
        t.id,
        blueprint_id,
        name,
        seq,
        display_name,
        singular_name,
        plural_name,
        num_rows,
        max_rows,
        created_on,
        created_by,
        last_updated_on,
        last_updated_by
   from
      wwv_dg_blueprint_tables       t,
      wwv_companies_auth_restricted w
   where
      t.security_group_id = w.workspace_id
;

comment on table  apex_dg_bp_tables                                is 'Defintion of output tables for data generation. Must be unique within a blueprint. See the apex_dg_data_gen API.';
comment on column apex_dg_bp_tables.workspace_id                   is 'Primary Key that identifies the workspace';
comment on column apex_dg_bp_tables.workspace_name                 is 'Name of the Workspace';
comment on column apex_dg_bp_tables.id                             is 'Primary key that identifies the blueprint table';
comment on column apex_dg_bp_tables.blueprint_id                   is 'Primary key of the parent record';
comment on column apex_dg_bp_tables.name                           is 'Output table name. Must be unique within the blueprint.';
comment on column apex_dg_bp_tables.seq                            is 'Sequence in which this table is generated and sequence in the output file.';
comment on column apex_dg_bp_tables.display_name                   is 'Dispaly name of table';
comment on column apex_dg_bp_tables.singular_name                  is 'Singular name of table';
comment on column apex_dg_bp_tables.plural_name                    is 'Plural name of table';
comment on column apex_dg_bp_tables.num_rows                       is 'Number of rows of data to generate';
comment on column apex_dg_bp_tables.max_rows                       is 'Maximum number of rows of data to generate (random)';
comment on column apex_dg_bp_tables.created_on                     is 'Auditing; date the record was created';
comment on column apex_dg_bp_tables.created_by                     is 'Auditing; user that created the record';
comment on column apex_dg_bp_tables.last_updated_on                is 'Auditing; date the record was last modified';
comment on column apex_dg_bp_tables.last_updated_by                is 'Auditing; user that last modified the record';


prompt ...creating view apex_dg_builtins
create or replace view apex_dg_builtins as
select regexp_substr(friendly_name, '[^.]*') builtin_category,
       friendly_name,
       native_datatype,
       comments,
       usage_notes
  from wwv_dg_meta_tab_cols
;

comment on table  apex_dg_builtins                                 is 'Table describing available builtin data';
comment on column apex_dg_builtins.builtin_category                is 'Category of builtin data';
comment on column apex_dg_builtins.friendly_name                   is 'Friendly name of builtin data. Used in apex_dg_data_gen.add_column';
comment on column apex_dg_builtins.native_datatype                 is 'Datatype of this builtin data';
comment on column apex_dg_builtins.comments                        is 'Comments on this builtin data';
comment on column apex_dg_builtins.usage_notes                     is 'Usage notes for this builtin data';


prompt ...creating view 'apex_dg_builtin_2d_shapes';
create or replace view apex_dg_builtin_2d_shapes as
select   vc1    name,
         n1     sides,
         lang   lang,
         domain
    from wwv_dg_helper_data
    where domain = '2D_SHAPES'
;

comment on table  apex_dg_builtin_2d_shapes                        is 'Sample data related to 2d shapes';
comment on column apex_dg_builtin_2d_shapes.name                   is 'Name of the shape';
comment on column apex_dg_builtin_2d_shapes.sides                  is 'Number of sides';
comment on column apex_dg_builtin_2d_shapes.lang                   is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_2d_shapes.domain                 is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_3d_shapes';
create or replace view apex_dg_builtin_3d_shapes as
select vc1    name,
         n1     faces,
         n2     edges,
         n3     vertices,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = '3D_SHAPES'
;

comment on table  apex_dg_builtin_3d_shapes                        is 'Sample data related to 3d shapes';
comment on column apex_dg_builtin_3d_shapes.name                   is 'Name of the shape';
comment on column apex_dg_builtin_3d_shapes.faces                  is 'Number of faces';
comment on column apex_dg_builtin_3d_shapes.edges                  is 'Number of edges';
comment on column apex_dg_builtin_3d_shapes.vertices               is 'Number of vertices';
comment on column apex_dg_builtin_3d_shapes.lang                   is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_3d_shapes.domain                 is 'Value of the DOMAIN column in apex_dg_helper_data';

prompt ...creating view 'apex_dg_builtin_booleans';
create or replace view apex_dg_builtin_booleans as
select   vc1    true_false,
         vc2    y_n,
         n1     one_zero,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'BOOLEANS'
;

comment on table  apex_dg_builtin_booleans                         is 'Sample data related to booleans';
comment on column apex_dg_builtin_booleans.true_false              is 'TRUE or FALSE';
comment on column apex_dg_builtin_booleans.y_n                     is 'Y or N';
comment on column apex_dg_builtin_booleans.one_zero                is '1 or 0';
comment on column apex_dg_builtin_booleans.lang                    is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_booleans.domain                  is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_colors';
create or replace view apex_dg_builtin_colors as
select vc1    color,
         vc2    hex_code,
         vc3    rgb,
         vc4    rn,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'COLORS'
;

comment on table  apex_dg_builtin_colors                           is 'Sample data related to colors';
comment on column apex_dg_builtin_colors.color                     is 'Common color name';
comment on column apex_dg_builtin_colors.hex_code                  is 'Hex code of color';
comment on column apex_dg_builtin_colors.rgb                       is 'RGB code of color';
comment on column apex_dg_builtin_colors.rn                        is 'RN of color';
comment on column apex_dg_builtin_colors.lang                      is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_colors.domain                    is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_company_names';
create or replace view apex_dg_builtin_company_names as
select
      last_name
      ||
         case round(
            sys.dbms_random.value(
               0, 9
            ), 0
         )
             when 0  then
               ' Corporation'
            when 1  then
               ' Group'
            when 2  then
               ' Studios'
            when 3  then
               ' and Sons'
            when 4  then
               ' International'
            when 5  then
               ' Heavy Industries'
            when 6  then
               ' Cosmetics'
            when 7  then
               ' Pharmaceuticals'
            when 8  then
               ' Design'
            when 9  then
               ' Company'
         end
      as company,
      lang
   from
      wwv_dg_helper_persons
   where
      lang = 'en'
;

comment on table  apex_dg_builtin_company_names                    is 'Sample data related to company names';
comment on column apex_dg_builtin_company_names.company            is 'Company name';
comment on column apex_dg_builtin_company_names.lang               is 'Language code of the data in this row, e.g. en';


prompt ...creating view 'apex_dg_builtin_countries';
create or replace view apex_dg_builtin_countries  as
select vc1    name,
         vc2    region,
         n1     population,
         n2     area,
         n3     pop_density,
         n4     gdp_per_capita,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'COUNTRIES'
;

comment on table  apex_dg_builtin_countries                        is 'Sample data related to countries';
comment on column apex_dg_builtin_countries.name                   is 'Country name';
comment on column apex_dg_builtin_countries.region                 is 'Geographical region';
comment on column apex_dg_builtin_countries.population             is 'Population of country';
comment on column apex_dg_builtin_countries.area                   is 'Area of country';
comment on column apex_dg_builtin_countries.pop_density            is 'Population density';
comment on column apex_dg_builtin_countries.gdp_per_capita         is 'GDP per capita';
comment on column apex_dg_builtin_countries.lang                   is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_countries.domain                 is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_depts';
create or replace view apex_dg_builtin_depts as
  select
         vc1   dname,
         lang  lang,
         domain
   from wwv_dg_helper_data
   where domain = 'DEPARTMENT'
;

comment on table  apex_dg_builtin_depts                            is 'Sample data related to departments';
comment on column apex_dg_builtin_depts.dname                      is 'Department name';
comment on column apex_dg_builtin_depts.lang                       is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_depts.domain                     is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_elements';
create or replace view apex_dg_builtin_elements  as
select vc1    name,
         vc2    symbol,
         n1     atomic_number,
         vc3    element_category,
         n2     atomic_weight,
         vc4    electron_configuration,
         vc5    phase,
         vc6    cas_number,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'ELEMENTS'
;

comment on table  apex_dg_builtin_elements                         is 'Sample data related to elements, e.g Oxygen';
comment on column apex_dg_builtin_elements.name                    is 'Element name';
comment on column apex_dg_builtin_elements.symbol                  is 'Scientific symbol';
comment on column apex_dg_builtin_elements.atomic_number           is 'Atomic number';
comment on column apex_dg_builtin_elements.element_category        is 'Scientific category';
comment on column apex_dg_builtin_elements.atomic_weight           is 'Atomic weight';
comment on column apex_dg_builtin_elements.electron_configuration  is 'Electron coniguration';
comment on column apex_dg_builtin_elements.phase                   is 'Phase';
comment on column apex_dg_builtin_elements.cas_number              is 'CAS number';
comment on column apex_dg_builtin_elements.lang                    is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_elements.domain                  is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_foods';
create or replace view apex_dg_builtin_foods as
select vc1    food,
         vc2    measure,
         vc3    category,
         n1     grams,
         n2     calories,
         n3     protein,
         n4     fat,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'FOODS'
;


comment on table  apex_dg_builtin_foods                            is 'Sample data related to foods';
comment on column apex_dg_builtin_foods.food                       is 'Common food name';
comment on column apex_dg_builtin_foods.measure                    is 'Type of measurement';
comment on column apex_dg_builtin_foods.category                   is 'Food category';
comment on column apex_dg_builtin_foods.grams                      is 'Number of grams';
comment on column apex_dg_builtin_foods.calories                   is 'Number of calories';
comment on column apex_dg_builtin_foods.protein                    is 'Grams of protein';
comment on column apex_dg_builtin_foods.fat                        is 'Grams of fat';
comment on column apex_dg_builtin_foods.lang                       is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_foods.domain                     is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_generic_prods';
create or replace view apex_dg_builtin_generic_prods as
select
       gp.vc1
      || c.color
      || coalesce(
         fs.attr, q1.attr,
         q2.attr,
         q3.attr
      ) product_name,
      gp.n1 * nvl(
         coalesce(
            q1.qty, q2.qty,
            q3.qty
         ), 1
      ) list_price,
      gp.vc2,
      gp.lang
   from
      wwv_dg_helper_data gp
      left outer join (
         select
            ' ('
            || color
            || ')' color,
            lang
         from
            apex_dg_builtin_colors
      ) c on gp.lang = c.lang
             and gp.vc3 = 'Y'
      full outer join (
         select
            ' - ' || trim(column_value) attr
         from
            table ( wwv_flow_string.split(
               'XL,L,M,S', ','
            ) )
      ) fs on gp.vc4 = 'FIT_SIZE'
      full outer join (
         select
            ' ('
            || substr(
               trim(column_value), 4
            )
            || ')' attr,
            to_number(
               substr(
                  trim(column_value), 0,
                  2
               )
            ) qty
         from
            table ( wwv_flow_string.split(
               '01 Single,02 2 Pack,04 4 Pack,08 8 Pack,12 12 Pack', ','
            ) )
      ) q1 on gp.vc4 = 'QTY_1'
      full outer join (
         select
            ' ('
            || substr(
               trim(column_value), 4
            )
            || ')' attr,
            to_number(
               substr(
                  trim(column_value), 0,
                  2
               )
            ) qty
         from
            table ( wwv_flow_string.split(
               '01 2 Pack,03 6 Pack,06 12 Pack', ','
            ) )
      ) q2 on gp.vc4 = 'QTY_2'
      full outer join (
         select
            ' ('
            || substr(
               trim(column_value), 4
            )
            || ')' attr,
            to_number(
               substr(
                  trim(column_value), 0,
                  2
               )
            ) qty
         from
            table ( wwv_flow_string.split(
               '01 10 Pack,03 30 Pack,06 60 Pack', ','
            ) )
      ) q3 on gp.vc4 = 'QTY_3'
   where gp.domain = 'GENERIC_PRODS'
;


comment on table  apex_dg_builtin_generic_prods                    is 'Sample data related to generic products';
comment on column apex_dg_builtin_generic_prods.product_name       is 'Generic product name';
comment on column apex_dg_builtin_generic_prods.list_price         is 'List price';
comment on column apex_dg_builtin_generic_prods.vc2                is 'Category of item';
comment on column apex_dg_builtin_generic_prods.lang               is 'Language code of the data in this row, e.g. en';


prompt ...creating view 'apex_dg_builtin_industries';
create or replace view apex_dg_builtin_industries as
select vc1    title,
         vc2    description,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'INDUSTRIES'
;


comment on table  apex_dg_builtin_industries                       is 'Sample data related to industries';
comment on column apex_dg_builtin_industries.title                 is 'Industry title';
comment on column apex_dg_builtin_industries.description           is 'Industry Description';
comment on column apex_dg_builtin_industries.lang                  is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_industries.domain                is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_islands';
create or replace view apex_dg_builtin_islands as
select
      vc1   name,
      vc2   country,
      lang  lang,
      domain
   from
      wwv_dg_helper_data
   where
      domain = 'ISLANDS'
;

comment on table  apex_dg_builtin_islands                          is 'Sample data related to islands';
comment on column apex_dg_builtin_islands.name                     is 'Island name';
comment on column apex_dg_builtin_islands.country                  is 'Country in which island is located';
comment on column apex_dg_builtin_islands.lang                     is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_islands.domain                   is 'Value of the DOMAIN column in apex_dg_helper_data';



prompt ...creating view 'apex_dg_builtin_languages';
create or replace view apex_dg_builtin_languages as
select   vc1    language_id,
         vc2    nls_territory,
         vc3    nls_language,
         vc4    language_label,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'LANGUAGES'
;


comment on table  apex_dg_builtin_languages                        is 'Sample data related to languages';
comment on column apex_dg_builtin_languages.language_id            is 'Language ID';
comment on column apex_dg_builtin_languages.nls_territory          is 'Language NLS erritory';
comment on column apex_dg_builtin_languages.language_label         is 'Language label';
comment on column apex_dg_builtin_languages.lang                   is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_languages.domain                 is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_latin_texts';
create or replace view apex_dg_builtin_latin_texts as
select vc1    text32,
         vc2    text64,
         vc3    text128,
         vc4    text256,
         vc5    text1024,
         vc6    text4000,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'LATIN_TEXTS'
;


comment on table  apex_dg_builtin_latin_texts                      is 'Sample lorem ipsum text strings';
comment on column apex_dg_builtin_latin_texts.text32               is '32 or fewer characters';
comment on column apex_dg_builtin_latin_texts.text64               is '64 or fewer characters';
comment on column apex_dg_builtin_latin_texts.text128              is '128 or fewer characters';
comment on column apex_dg_builtin_latin_texts.text256              is '256 or fewer characters';
comment on column apex_dg_builtin_latin_texts.text1024             is '1024 or fewer characters';
comment on column apex_dg_builtin_latin_texts.text4000             is '4000 or fewer characters';
comment on column apex_dg_builtin_latin_texts.lang                 is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_latin_texts.domain               is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_occupations';
create or replace view apex_dg_builtin_occupations as
select
      vc1   title,
      n1    mean_wage,
      lang  lang,
      domain
   from
      wwv_dg_helper_data
   where
      domain = 'OCCUPATIONS'
;

comment on table  apex_dg_builtin_occupations                      is 'Sample data related to occupations';
comment on column apex_dg_builtin_occupations.title                is 'Occupation title';
comment on column apex_dg_builtin_occupations.mean_wage            is 'Mean wage of occupation';
comment on column apex_dg_builtin_occupations.lang                 is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_occupations.domain               is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_persons';
create or replace view apex_dg_builtin_persons as
select hp1.first_name,
         hp1.last_name,
         hp1.first_name ||' '|| hp1.last_name forward_name,
         hp1.first_name ||'.' || hp1.last_name ||'@internalmail' email,
         hp1.last_name||', ' || hp1.first_name last_comma_first,
         upper(hp1.first_name ||' '|| hp1.last_name) upper_full_name,
         hp1.biological_sex,
         hp1.lang
    from wwv_dg_helper_persons hp1
;


comment on table  apex_dg_builtin_persons                          is 'Sample data related to persons';
comment on column apex_dg_builtin_persons.first_name               is 'Person given name';
comment on column apex_dg_builtin_persons.last_name                is 'Person family name';
comment on column apex_dg_builtin_persons.forward_name             is 'first_name last_name';
comment on column apex_dg_builtin_persons.email                    is 'coordinated email address';
comment on column apex_dg_builtin_persons.last_comma_first         is 'last_name, first_name';
comment on column apex_dg_builtin_persons.upper_full_name          is 'FIRST_NAME LAST_NAME';
comment on column apex_dg_builtin_persons.biological_sex           is 'Biological sex';
comment on column apex_dg_builtin_persons.lang                     is 'Language code of the data in this row, e.g. en';


prompt ...creating view 'apex_dg_builtin_pets';
create or replace view apex_dg_builtin_pets as
select
      p1.vc1   pet_type,
      p1.vc2    pet_sub_type,
      p2.vc3    pet_name,
      p1.lang  lang,
      p1.domain
   from
      wwv_dg_helper_data p1
      inner join wwv_dg_helper_data p2 on p2.lang = p1.lang
                                           and p2.vc1 = p1.vc1
   where
      p1.domain = 'PETS'
   and p2.domain = 'PETS'
;

comment on table  apex_dg_builtin_pets                             is 'Sample data related to pets';
comment on column apex_dg_builtin_pets.pet_type                    is 'Type of pet';
comment on column apex_dg_builtin_pets.pet_sub_type                is 'Subtype of pet';
comment on column apex_dg_builtin_pets.pet_name                    is 'Name of pet';
comment on column apex_dg_builtin_pets.lang                        is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_pets.domain                      is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_builtin_prod_reviews';
create or replace view apex_dg_builtin_prod_reviews as
select n1      stars,
         vc1     review,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'PROD_REVIEWS'
;

comment on table  apex_dg_builtin_prod_reviews                     is 'Sample data related to product reviews';
comment on column apex_dg_builtin_prod_reviews.stars               is 'Number of stars';
comment on column apex_dg_builtin_prod_reviews.review              is 'Review text';
comment on column apex_dg_builtin_prod_reviews.lang                is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_prod_reviews.domain              is 'Value of the DOMAIN column in apex_dg_helper_data';

prompt ...creating view 'apex_dg_builtin_schools';
create or replace view apex_dg_builtin_schools as
select vc1     institution_name,
         vc2     city,
         vc3     state,
         vc4     accred_agency,
         vc5     insturl,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'SCHOOLS'
;

comment on table  apex_dg_builtin_schools                          is 'Sample data related to schools';
comment on column apex_dg_builtin_schools.institution_name         is 'School name';
comment on column apex_dg_builtin_schools.city                     is 'City';
comment on column apex_dg_builtin_schools.state                    is 'State';
comment on column apex_dg_builtin_schools.accred_agency            is 'Accreding agency';
comment on column apex_dg_builtin_schools.insturl                  is 'School URL';
comment on column apex_dg_builtin_schools.lang                     is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_schools.domain                   is 'Value of the DOMAIN column in apex_dg_helper_data';


prompt ...creating view 'apex_dg_powerset_latin_texts';
create or replace view apex_dg_powerset_latin_texts as
select
      "TEXT32",
      "TEXT64",
      "TEXT128",
      "TEXT256",
      "TEXT1024",
      "TEXT4000",
      lang
   from
      (
         select
            lt1.text32,
            lt2.text64,
            lt1.text128,
            lt2.text256,
            lt1.text1024,
            lt1.text4000,
            lt1.lang
         from
            apex_dg_builtin_latin_texts  lt1,
            apex_dg_builtin_latin_texts  lt2
      )
   where
      rownum < 5000
;

comment on table  apex_dg_powerset_latin_texts                     is 'A cartesian product of the apex_dg_builtin_latin_texts data.';
comment on column apex_dg_powerset_latin_texts.text32              is '32 or fewer characters';
comment on column apex_dg_powerset_latin_texts.text64              is '64 or fewer characters';
comment on column apex_dg_powerset_latin_texts.text128             is '128 or fewer characters';
comment on column apex_dg_powerset_latin_texts.text256             is '256 or fewer characters';
comment on column apex_dg_powerset_latin_texts.text1024            is '1024 or fewer characters';
comment on column apex_dg_powerset_latin_texts.text4000            is '4000 or fewer characters';
comment on column apex_dg_powerset_latin_texts.lang                is 'Language code of the data in this row, e.g. en';


prompt ...creating view 'apex_dg_powerset_persons';
create or replace view apex_dg_powerset_persons as
 select
      hp1.first_name,
      hp2.last_name,
      hp1.first_name
      || ' '
      || hp2.last_name                              forward_name,
      hp1.first_name
      || '.'
      || hp2.last_name
      || '@internalmail'           email,
      hp2.last_name
      || ', '
      || hp1.first_name                             last_comma_first,
      upper(hp1.first_name
            || ' '
            || hp2.last_name)                       upper_full_name,
      hp1.biological_sex,
      hp1.lang
   from
           wwv_dg_helper_persons hp1
      inner join wwv_dg_helper_persons hp2 on hp2.lang = hp1.lang
 ;

comment on table  apex_dg_powerset_persons                         is 'A cartesian product of the apex_dg_builtin_persons data. Dramatically expands name combinations.';
comment on column apex_dg_powerset_persons.first_name              is 'Person given name';
comment on column apex_dg_powerset_persons.last_name               is 'Person family name';
comment on column apex_dg_powerset_persons.forward_name            is 'first_name last_name';
comment on column apex_dg_powerset_persons.email                   is 'coordinated email address';
comment on column apex_dg_powerset_persons.last_comma_first        is 'last_name, first_name';
comment on column apex_dg_powerset_persons.upper_full_name         is 'FIRST_NAME LAST_NAME';
comment on column apex_dg_powerset_persons.biological_sex          is 'Biological sex';
comment on column apex_dg_powerset_persons.lang                    is 'Language code of the data in this row, e.g. en';


prompt ...creating view 'apex_dg_builtin_airports';
create or replace view apex_dg_builtin_airports as
   select
      site_number,
      airport_type,
      iata_code,
      state_name,
      county,
      city,
      facility_name,
      owner,
      owner_address,
      arp_latitude,
      arp_latitude_s,
      arp_longitude,
      arp_longitude_s,
      lang
   from
      wwv_dg_builtin_airports
;

comment on table  apex_dg_builtin_airports                         is 'Sample data related to airports';
comment on column apex_dg_builtin_airports.site_number             is 'Site number';
comment on column apex_dg_builtin_airports.airport_type            is 'Type of airport';
comment on column apex_dg_builtin_airports.iata_code               is 'IATA Code';
comment on column apex_dg_builtin_airports.state_name              is 'State located in';
comment on column apex_dg_builtin_airports.county                  is 'County located in';
comment on column apex_dg_builtin_airports.city                    is 'City located in';
comment on column apex_dg_builtin_airports.facility_name           is 'Airport name';
comment on column apex_dg_builtin_airports.owner                   is 'Airport owner name';
comment on column apex_dg_builtin_airports.owner_address           is 'Airport owner address';
comment on column apex_dg_builtin_airports.arp_latitude            is 'Airport latitude';
comment on column apex_dg_builtin_airports.arp_latitude_s          is 'Airport latitude S';
comment on column apex_dg_builtin_airports.arp_longitude           is 'Airport longitude';
comment on column apex_dg_builtin_airports.arp_longitude_s         is 'Airport longitude S';
comment on column apex_dg_builtin_airports.lang                    is 'Language code of the data in this row, e.g. en';

prompt ...creating view apex_dg_builtin_animals
create or replace view apex_dg_builtin_animals as
  select id,
         common_name,
         domain,
         kingdom,
         phylum,class,
         the_order,
         family,genus,species,
         lang,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_builtin_animals
;


comment on table  apex_dg_builtin_animals                          is 'Sample data related to animals';
comment on column apex_dg_builtin_animals.id                       is 'Primary key that identifies the animal';
comment on column apex_dg_builtin_animals.common_name              is 'Animal common name';
comment on column apex_dg_builtin_animals.domain                   is 'Taxonomy domain';
comment on column apex_dg_builtin_animals.kingdom                  is 'Taxonomy kingdom';
comment on column apex_dg_builtin_animals.phylum                   is 'Taxonomy phylum';
comment on column apex_dg_builtin_animals.class                    is 'Taxonomy class';
comment on column apex_dg_builtin_animals.the_order                is 'Taxonomy order';
comment on column apex_dg_builtin_animals.family                   is 'Taxonomy family';
comment on column apex_dg_builtin_animals.genus                    is 'Taxonomy genus';
comment on column apex_dg_builtin_animals.species                  is 'Taxonomy species';
comment on column apex_dg_builtin_animals.lang                     is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_animals.version_number           is 'Integer incremented with each update of the row';
comment on column apex_dg_builtin_animals.created_by               is 'Auditing; user that created the record';
comment on column apex_dg_builtin_animals.created_on               is 'Auditing; date the record was created';
comment on column apex_dg_builtin_animals.last_updated_by          is 'Auditing; user that last modified the record';
comment on column apex_dg_builtin_animals.last_updated_on          is 'Auditing; date the record was last modified';
comment on column apex_dg_builtin_animals.seeded_data_yn           is 'Yes indicates data was installed with APEX. No indicates it was added later.';


prompt ...creating view apex_dg_builtin_cars
create or replace view apex_dg_builtin_cars as
  select id,
         make,
         model,
         year,
         engine_fuel_type,
         engine_hp,
         engine_cylinders,
         transmission_type,
         driven_wheels,
         number_of_doors,
         market_category,
         vehicle_size,
         vehicle_style,
         highway_mpg,
         city_mpg,
         msrp,
         lang,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_builtin_cars
;

comment on table  apex_dg_builtin_cars                             is 'Sample data related to cars';
comment on column apex_dg_builtin_cars.id                          is 'Primary key that identifies the car';
comment on column apex_dg_builtin_cars.make                        is 'Car make';
comment on column apex_dg_builtin_cars.model                       is 'Car model';
comment on column apex_dg_builtin_cars.year                        is 'Car year';
comment on column apex_dg_builtin_cars.engine_fuel_type            is 'Fuel type';
comment on column apex_dg_builtin_cars.engine_hp                   is 'Horsepower';
comment on column apex_dg_builtin_cars.engine_cylinders            is 'Number of cylinders';
comment on column apex_dg_builtin_cars.transmission_type           is 'Type of transmission';
comment on column apex_dg_builtin_cars.driven_wheels               is 'Number of driven wheels';
comment on column apex_dg_builtin_cars.number_of_doors             is 'Number of doors';
comment on column apex_dg_builtin_cars.market_category             is 'Market category';
comment on column apex_dg_builtin_cars.vehicle_size                is 'Vehicle size';
comment on column apex_dg_builtin_cars.vehicle_style               is 'Vehicle style';
comment on column apex_dg_builtin_cars.highway_mpg                 is 'Miles per gallon highway';
comment on column apex_dg_builtin_cars.city_mpg                    is 'Miles per gallon city';
comment on column apex_dg_builtin_cars.msrp                        is 'Manufacturers suggested retail price';
comment on column apex_dg_builtin_cars.lang                        is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_cars.version_number              is 'Integer incremented with each update of the row';
comment on column apex_dg_builtin_cars.created_by                  is 'Auditing; user that created the record';
comment on column apex_dg_builtin_cars.created_on                  is 'Auditing; date the record was created';
comment on column apex_dg_builtin_cars.last_updated_by             is 'Auditing; user that last modified the record';
comment on column apex_dg_builtin_cars.last_updated_on             is 'Auditing; date the record was last modified';
comment on column apex_dg_builtin_cars.seeded_data_yn              is 'Yes indicates data was installed with APEX. No indicates it was added later.';

prompt ...creating view apex_dg_builtin_icd_diags
create or replace view apex_dg_builtin_icd_diags as
  select id,
         code,
         short_desc,
         long_desc,
         lang,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_builtin_icd_diags
;


comment on table  apex_dg_builtin_icd_diags                        is 'Sample data related to ICD diagnostic codes';
comment on column apex_dg_builtin_icd_diags.id                     is 'Primary key that identifies the icd diag';
comment on column apex_dg_builtin_icd_diags.code                   is 'ICD Diag code';
comment on column apex_dg_builtin_icd_diags.short_desc             is 'ICD short description';
comment on column apex_dg_builtin_icd_diags.long_desc              is 'ICD long description';
comment on column apex_dg_builtin_icd_diags.lang                   is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_icd_diags.version_number         is 'Integer incremented with each update of the row';
comment on column apex_dg_builtin_icd_diags.created_by             is 'Auditing; user that created the record';
comment on column apex_dg_builtin_icd_diags.created_on             is 'Auditing; date the record was created';
comment on column apex_dg_builtin_icd_diags.last_updated_by        is 'Auditing; user that last modified the record';
comment on column apex_dg_builtin_icd_diags.last_updated_on        is 'Auditing; date the record was last modified';
comment on column apex_dg_builtin_icd_diags.seeded_data_yn         is 'Yes indicates data was installed with APEX. No indicates it was added later.';


prompt ...creating view apex_dg_builtin_icd_procs
create or replace view apex_dg_builtin_icd_procs as
  select id,
         code,
         short_desc,
         long_desc,
         lang,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_builtin_icd_procs
;


comment on table  apex_dg_builtin_icd_procs                        is 'Sample data related to ICD procedure codes';
comment on column apex_dg_builtin_icd_procs.id                     is 'Primary key that identifies the icd proc';
comment on column apex_dg_builtin_icd_procs.code                   is 'ICD procedure code';
comment on column apex_dg_builtin_icd_procs.short_desc             is 'ICD short description';
comment on column apex_dg_builtin_icd_procs.long_desc              is 'ICD short description';
comment on column apex_dg_builtin_icd_procs.lang                   is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_icd_procs.version_number         is 'Integer incremented with each update of the row';
comment on column apex_dg_builtin_icd_procs.created_by             is 'Auditing; user that created the record';
comment on column apex_dg_builtin_icd_procs.created_on             is 'Auditing; date the record was created';
comment on column apex_dg_builtin_icd_procs.last_updated_by        is 'Auditing; user that last modified the record';
comment on column apex_dg_builtin_icd_procs.last_updated_on        is 'Auditing; date the record was last modified';
comment on column apex_dg_builtin_icd_procs.seeded_data_yn         is 'Yes indicates data was installed with APEX. No indicates it was added later.';


prompt ...creating view apex_dg_builtin_locations
create or replace view apex_dg_builtin_locations as
  select id,
         latitude,
         longitude,
         city,
         state_id,
         state_name,
         zcta,
         population,
         county_fips,
         county_name,
         military,
         timezone,
         zip_vc,
         lang,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_builtin_locations
;


comment on table  apex_dg_builtin_locations                        is 'Sample data related to locations';
comment on column apex_dg_builtin_locations.id                     is 'Primary key that identifies the location';
comment on column apex_dg_builtin_locations.latitude               is 'City latitude';
comment on column apex_dg_builtin_locations.longitude              is 'City Longitude';
comment on column apex_dg_builtin_locations.city                   is 'City name';
comment on column apex_dg_builtin_locations.state_id               is 'Primary key of the parent record';
comment on column apex_dg_builtin_locations.state_name             is 'State Name';
comment on column apex_dg_builtin_locations.zcta                   is 'Location zcta';
comment on column apex_dg_builtin_locations.population             is 'City population';
comment on column apex_dg_builtin_locations.county_fips            is 'County FIPS';
comment on column apex_dg_builtin_locations.county_name            is 'County name';
comment on column apex_dg_builtin_locations.military               is 'Military designation';
comment on column apex_dg_builtin_locations.timezone               is 'Time Zone';
comment on column apex_dg_builtin_locations.zip_vc                 is 'ZIP VC';
comment on column apex_dg_builtin_locations.lang                   is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_locations.version_number         is 'Integer incremented with each update of the row';
comment on column apex_dg_builtin_locations.created_by             is 'Auditing; user that created the record';
comment on column apex_dg_builtin_locations.created_on             is 'Auditing; date the record was created';
comment on column apex_dg_builtin_locations.last_updated_by        is 'Auditing; user that last modified the record';
comment on column apex_dg_builtin_locations.last_updated_on        is 'Auditing; date the record was last modified';
comment on column apex_dg_builtin_locations.seeded_data_yn         is 'Yes indicates data was installed with APEX. No indicates it was added later.';


prompt ...creating view apex_dg_builtin_plants
create or replace view apex_dg_builtin_plants as
  select id,
         scientific_name,
         genus,
         species,
         variety,
         genera_binomial_author,
         common_name,
         category,
         family,
         family_common_name,
         taxonomy_order,
         subclass,
         class,
         division,
         kingdom,
         growth_habit,
         lang,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_builtin_plants
;


comment on table  apex_dg_builtin_plants                           is 'Sample data related to plants';
comment on column apex_dg_builtin_plants.id                        is 'Primary key that identifies the plant';
comment on column apex_dg_builtin_plants.scientific_name           is 'Plant scientific name';
comment on column apex_dg_builtin_plants.genus                     is 'Taxonomy genus';
comment on column apex_dg_builtin_plants.species                   is 'Taxonomy species';
comment on column apex_dg_builtin_plants.variety                   is 'Taxonomy variety';
comment on column apex_dg_builtin_plants.genera_binomial_author    is 'Genera binomial author';
comment on column apex_dg_builtin_plants.common_name               is 'Plant common name';
comment on column apex_dg_builtin_plants.category                  is 'Plant category';
comment on column apex_dg_builtin_plants.family                    is 'Taxonomy family';
comment on column apex_dg_builtin_plants.family_common_name        is 'Family common name ';
comment on column apex_dg_builtin_plants.taxonomy_order            is 'Taxonomy order';
comment on column apex_dg_builtin_plants.subclass                  is 'Taxonomy subclass';
comment on column apex_dg_builtin_plants.class                     is 'Taxonomy class';
comment on column apex_dg_builtin_plants.division                  is 'Taxonomy division';
comment on column apex_dg_builtin_plants.kingdom                   is 'Taxonomy kingdom';
comment on column apex_dg_builtin_plants.growth_habit              is 'Plant growth habit';
comment on column apex_dg_builtin_plants.lang                      is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_plants.version_number            is 'Integer incremented with each update of the row';
comment on column apex_dg_builtin_plants.created_by                is 'Auditing; user that created the record';
comment on column apex_dg_builtin_plants.created_on                is 'Auditing; date the record was created';
comment on column apex_dg_builtin_plants.last_updated_by           is 'Auditing; user that last modified the record';
comment on column apex_dg_builtin_plants.last_updated_on           is 'Auditing; date the record was last modified';
comment on column apex_dg_builtin_plants.seeded_data_yn            is 'Yes indicates data was installed with APEX. No indicates it was added later.';


prompt ...creating view apex_dg_builtin_products
create or replace view apex_dg_builtin_products as
  select id,
         product_name,
         description,
         list_price,
         brand,
         category,
         lang,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_builtin_products
;


comment on table  apex_dg_builtin_products                         is 'Sample data related to products';
comment on column apex_dg_builtin_products.id                      is 'Primary key that identifies the product';
comment on column apex_dg_builtin_products.product_name            is 'Product name';
comment on column apex_dg_builtin_products.description             is 'Product description';
comment on column apex_dg_builtin_products.list_price              is 'List price';
comment on column apex_dg_builtin_products.brand                   is 'Product brand';
comment on column apex_dg_builtin_products.category                is 'Product category';
comment on column apex_dg_builtin_products.lang                    is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_products.version_number          is 'Integer incremented with each update of the row';
comment on column apex_dg_builtin_products.created_by              is 'Auditing; user that created the record';
comment on column apex_dg_builtin_products.created_on              is 'Auditing; date the record was created';
comment on column apex_dg_builtin_products.last_updated_by         is 'Auditing; user that last modified the record';
comment on column apex_dg_builtin_products.last_updated_on         is 'Auditing; date the record was last modified';
comment on column apex_dg_builtin_products.seeded_data_yn          is 'Yes indicates data was installed with APEX. No indicates it was added later.';

prompt ...creating view 'apex_dg_builtin_status';
create or replace view apex_dg_builtin_status  as
select vc1    code,
         vc2    name,
         vc3    description,
         lang,
         domain
    from wwv_dg_helper_data
    where domain = 'STATUS'
;

comment on table  apex_dg_builtin_status                           is 'Sample data related to status';
comment on column apex_dg_builtin_status.code                      is 'Status code';
comment on column apex_dg_builtin_status.name                      is 'Status name';
comment on column apex_dg_builtin_status.description               is 'Status description';
comment on column apex_dg_builtin_status.lang                      is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_builtin_status.domain                    is 'Value of the DOMAIN column in apex_dg_helper_data';

prompt ...creating view apex_dg_builtin_fontapex
create or replace view apex_dg_builtin_fontapex as
select id            icon_id,
       icon_name,
       icon_filters,
       icon_category
    from wwv_flow_standard_icons
    where icon_library = 'FONTAPEX'
;

comment on table  apex_dg_builtin_fontapex                           is 'Font APEX icon data';
comment on column apex_dg_builtin_fontapex.icon_id                   is 'Identifies the icon';
comment on column apex_dg_builtin_fontapex.icon_name                 is 'Identifies the icon name';
comment on column apex_dg_builtin_fontapex.icon_filters              is 'Identifies the icon filters';
comment on column apex_dg_builtin_fontapex.icon_category             is 'Identifies the icon category or categories';

prompt ...creating view apex_dg_helper_data
create or replace view apex_dg_helper_data  as
  select id,
         domain,
         lang,
         vc1,
         vc2,
         vc3,
         vc4,
         vc5,
         vc6,
         vc7,
         vc8,
         vc9,
         vc10,
         vc11,
         vc12,
         vc13,
         vc14,
         vc15,
         vc16,
         vc17,
         vc18,
         vc19,
         vc20,
         vc21,
         vc22,
         vc23,
         vc24,
         vc25,
         vc26,
         vc27,
         vc28,
         vc29,
         vc30,
         n1,
         n2,
         n3,
         n4,
         n5,
         n6,
         n7,
         n8,
         n9,
         n10,
         d1,
         d2,
         d3,
         d4,
         d5,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_helper_data
;


comment on table  apex_dg_helper_data                              is 'Sample data grouped by DOMAIN. Typically referenced within an APEX_AD_BUILTIN view';
comment on column apex_dg_helper_data.id                           is 'Primary key that identifies the helper data row';
comment on column apex_dg_helper_data.domain                       is 'Describes the type of data in this row';
comment on column apex_dg_helper_data.lang                         is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_helper_data.vc1                          is 'Associated character data';
comment on column apex_dg_helper_data.vc2                          is 'Associated character data';
comment on column apex_dg_helper_data.vc3                          is 'Associated character data';
comment on column apex_dg_helper_data.vc4                          is 'Associated character data';
comment on column apex_dg_helper_data.vc5                          is 'Associated character data';
comment on column apex_dg_helper_data.vc6                          is 'Associated character data';
comment on column apex_dg_helper_data.vc7                          is 'Associated character data';
comment on column apex_dg_helper_data.vc8                          is 'Associated character data';
comment on column apex_dg_helper_data.vc9                          is 'Associated character data';
comment on column apex_dg_helper_data.vc10                         is 'Associated character data';
comment on column apex_dg_helper_data.vc11                         is 'Associated character data';
comment on column apex_dg_helper_data.vc12                         is 'Associated character data';
comment on column apex_dg_helper_data.vc13                         is 'Associated character data';
comment on column apex_dg_helper_data.vc14                         is 'Associated character data';
comment on column apex_dg_helper_data.vc15                         is 'Associated character data';
comment on column apex_dg_helper_data.vc16                         is 'Associated character data';
comment on column apex_dg_helper_data.vc17                         is 'Associated character data';
comment on column apex_dg_helper_data.vc18                         is 'Associated character data';
comment on column apex_dg_helper_data.vc19                         is 'Associated character data';
comment on column apex_dg_helper_data.vc20                         is 'Associated character data';
comment on column apex_dg_helper_data.vc21                         is 'Associated character data';
comment on column apex_dg_helper_data.vc22                         is 'Associated character data';
comment on column apex_dg_helper_data.vc23                         is 'Associated character data';
comment on column apex_dg_helper_data.vc24                         is 'Associated character data';
comment on column apex_dg_helper_data.vc25                         is 'Associated character data';
comment on column apex_dg_helper_data.vc26                         is 'Associated character data';
comment on column apex_dg_helper_data.vc27                         is 'Associated character data';
comment on column apex_dg_helper_data.vc28                         is 'Associated character data';
comment on column apex_dg_helper_data.vc29                         is 'Associated character data';
comment on column apex_dg_helper_data.vc30                         is 'Associated character data';
comment on column apex_dg_helper_data.n1                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n2                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n3                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n4                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n5                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n6                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n7                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n8                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n9                           is 'Associated numberical data';
comment on column apex_dg_helper_data.n10                          is 'Associated numberical data';
comment on column apex_dg_helper_data.d1                           is 'Associated date data';
comment on column apex_dg_helper_data.d2                           is 'Associated date data';
comment on column apex_dg_helper_data.d3                           is 'Associated date data';
comment on column apex_dg_helper_data.d4                           is 'Associated date data';
comment on column apex_dg_helper_data.d5                           is 'Associated date data';
comment on column apex_dg_helper_data.version_number               is 'Integer incremented with each update of the row';
comment on column apex_dg_helper_data.created_by                   is 'Auditing; user that created the record';
comment on column apex_dg_helper_data.created_on                   is 'Auditing; date the record was created';
comment on column apex_dg_helper_data.last_updated_by              is 'Auditing; user that last modified the record';
comment on column apex_dg_helper_data.last_updated_on              is 'Auditing; date the record was last modified';
comment on column apex_dg_helper_data.seeded_data_yn               is 'Yes indicates data was installed with APEX. No indicates it was added later.';


prompt ...creating view apex_dg_helper_persons
create or replace view apex_dg_helper_persons as
  select id,
         first_name,
         last_name,
         lang,
         biological_sex,
         version_number,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         decode(seeded_data_yn,'Y','Yes','No') seeded_data_yn
    from wwv_dg_helper_persons
;

comment on table  apex_dg_helper_persons                           is 'Sample data related to persons. Typically referenced within an APEX_DG_BUILTIN view.';
comment on column apex_dg_helper_persons.id                        is 'Primary key that identifies the helper data row';
comment on column apex_dg_helper_persons.first_name                is 'First name';
comment on column apex_dg_helper_persons.last_name                 is 'Last name';
comment on column apex_dg_helper_persons.lang                      is 'Language code of the data in this row, e.g. en';
comment on column apex_dg_helper_persons.biological_sex            is 'Biological sex';
comment on column apex_dg_helper_persons.version_number            is 'Integer incremented with each update of the row';
comment on column apex_dg_helper_persons.created_by                is 'Auditing; user that created the record';
comment on column apex_dg_helper_persons.created_on                is 'Auditing; date the record was created';
comment on column apex_dg_helper_persons.last_updated_by           is 'Auditing; user that last modified the record';
comment on column apex_dg_helper_persons.last_updated_on           is 'Auditing; date the record was last modified';
comment on column apex_dg_helper_persons.seeded_data_yn            is 'Yes indicates data was installed with APEX. No indicates it was added later.';

prompt ...creating view apex_dg_meta_tab_col_examples
create or replace view apex_dg_meta_tab_col_examples as
  select  c.id,
          c.table_name,
          c.column_name,
          c.friendly_name,
          c.native_datatype,
          c.pl_sql,
          c.plsql_function,
          c.comments,
          c.usage_notes,
          c.version_number,
          c.created_by,
          c.created_on,
          c.last_updated_by,
          c.last_updated_on,
          e.description,
          e.example
  from wwv_dg_meta_tab_cols c
  outer apply (
    select description, example
    from json_table(c.example_output, '$.examples[*]'
    columns (
      description varchar2(100) path '$.description',
      example varchar2(100) path '$.example'
    ))) e
;

comment on table  apex_dg_meta_tab_col_examples                    is 'Examples of generated data';

comment on column apex_dg_meta_tab_col_examples.id                 is 'Primary key that identifies the column row';
comment on column apex_dg_meta_tab_col_examples.table_name         is 'Name of the builtin table';
comment on column apex_dg_meta_tab_col_examples.column_name        is 'Name of the builtin column';
comment on column apex_dg_meta_tab_col_examples.friendly_name      is 'Friendly name of builtin data. Used in apex_dg_data_gen.add_column';
comment on column apex_dg_meta_tab_col_examples.native_datatype    is 'Datatype of this builtin data';
comment on column apex_dg_meta_tab_col_examples.pl_sql             is 'PL/SQL of this builtin data';
comment on column apex_dg_meta_tab_col_examples.plsql_function     is 'PL/SQL function of this builtin data';
comment on column apex_dg_meta_tab_col_examples.comments           is 'Comments about the buildit data';
comment on column apex_dg_meta_tab_col_examples.usage_notes        is 'Usage notes for the builtin data';
comment on column apex_dg_meta_tab_col_examples.version_number     is 'Version number for the builtin data';
comment on column apex_dg_meta_tab_col_examples.created_by         is 'Auditing; user that created the record';
comment on column apex_dg_meta_tab_col_examples.created_on         is 'Auditing; date the record was created';
comment on column apex_dg_meta_tab_col_examples.last_updated_by    is 'Auditing; user that last modified the record';
comment on column apex_dg_meta_tab_col_examples.last_updated_on    is 'Auditing; date the record was last modified';
comment on column apex_dg_meta_tab_col_examples.description        is 'Description of the example data';
comment on column apex_dg_meta_tab_col_examples.example            is 'Examples of the data';

set define '^'
