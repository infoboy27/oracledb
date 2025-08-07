set define off verify off
prompt ...create ODG triggers

Rem  Copyright (c) Oracle Corporation 1999 - 2021. All Rights Reserved.
Rem
Rem    NAME
Rem      odg_trigger.sql
Rem
Rem    DESCRIPTION
Rem      ODG object trigger creation script.
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jstraub  02/03/2021 - Created from Anton Nielsen, Neelesh Shah

prompt ...creating trigger 'apex_dg_datasets_t1';
create or replace trigger apex_dg_datasets_t1
    before insert or update on apex_dg_datasets
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'apex_dg_dataset_rows_t1';
create or replace trigger apex_dg_dataset_rows_t1
    before insert or update on apex_dg_dataset_rows
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bi_animals_t1';
create or replace trigger wwv_dg_bi_animals_t1
    before insert or update on wwv_dg_builtin_animals
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bi_cars_t1';
create or replace trigger wwv_dg_bi_cars_t1
    before insert or update on wwv_dg_builtin_cars
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bi_icd_diags_t1';
create or replace trigger wwv_dg_bi_icd_diags_t1
    before insert or update on wwv_dg_builtin_icd_diags
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bi_icd_procs_t1';
create or replace trigger wwv_dg_bi_icd_procs_t1
    before insert or update on wwv_dg_builtin_icd_procs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bi_locations_t1';
create or replace trigger wwv_dg_bi_locations_t1
    before insert or update on wwv_dg_builtin_locations
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bi_plants_t1';
create or replace trigger wwv_dg_bi_plants_t1
    before insert or update on wwv_dg_builtin_plants
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bi_products_t1';
create or replace trigger wwv_dg_bi_products_t1
    before insert or update on wwv_dg_builtin_products
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bi_airports_t1';
create or replace trigger wwv_dg_bi_airports_t1
    before insert or update on wwv_dg_builtin_airports
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bp_data_sources_t1';
create or replace trigger wwv_dg_bp_data_sources_t1
    before insert or update on wwv_dg_blueprint_data_sources
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bp_samples_t1';
create or replace trigger wwv_dg_bp_samples_t1
    before insert or update on wwv_dg_blueprint_samples
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bp_t1';
create or replace trigger wwv_dg_bp_t1
    before insert or update on wwv_dg_blueprints
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bp_tab_columns_t1';
create or replace trigger wwv_dg_bp_tab_columns_t1
    before insert or update on wwv_dg_blueprint_tab_columns
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_bp_tables_t1';
create or replace trigger wwv_dg_bp_tables_t1
    before insert or update on wwv_dg_blueprint_tables
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd
    if :new.security_group_id is null then
       :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_helper_data_t1';
create or replace trigger wwv_dg_helper_data_t1
    before insert or update on wwv_dg_helper_data
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_helper_persons_t1';
create or replace trigger wwv_dg_helper_persons_t1
    before insert or update on wwv_dg_helper_persons
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_meta_tab_cols_t1';
create or replace trigger wwv_dg_meta_tab_cols_t1
    before insert or update on wwv_dg_meta_tab_cols
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_meta_tables_t1';
create or replace trigger wwv_dg_meta_tables_t1
    before insert or update on wwv_dg_meta_tables
    for each row
begin
    if inserting and :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;

    -- vpd not required on this table

    -- audit
    if not wwv_flow.g_import_in_progress then
        if inserting then
            :new.created_on := sysdate;
            :new.created_by := wwv_flow.g_user;
        end if;
        --
        :new.last_updated_on := sysdate;
        :new.last_updated_by := wwv_flow.g_user;
    end if;
end;
/

prompt ...creating trigger 'wwv_dg_meta_mappings_t1';
create or replace trigger wwv_dg_meta_mappings_t1 before
  insert or update on wwv_dg_meta_mappings
  for each row
begin
  if
    inserting
    and :new.id is null
  then
    :new.id := wwv_flow_id.next_val;
  end if;

  -- audit
  if not wwv_flow.g_import_in_progress then
    if inserting then
      :new.created_on := sysdate;
      :new.created_by := wwv_flow.g_user;
    end if;
        --
    :new.last_updated_on := sysdate;
    :new.last_updated_by := wwv_flow.g_user;
  end if;

end;
/

set define '^'
