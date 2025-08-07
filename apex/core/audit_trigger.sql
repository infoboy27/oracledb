set define '^' verify off
prompt ...audit triggers
Rem  Copyright (c) 2000, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      audit_trigger.sql
Rem
Rem    DESCRIPTION
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem       jkallman 04/25/2006 - Created

create or replace trigger wwv_biu_flow_build_audit_t
    before insert or update on wwv_flow_builder_audit_trail
    for each row
begin
    --
    -- vpd
    --
    if :new.security_group_id is null then
       :new.security_group_id := nvl(wwv_flow_security.g_security_group_id,0);
    end if;
end;
/
show errors


prompt ...wwv_flow_company_static_files audit

create or replace trigger wwv_biu_flow_comp_file_audit
    before insert or update or delete on wwv_flow_company_static_files
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_COMPANY_STATIC_FILES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.file_name, :old.file_name) );
end;
/
show errors

prompt ...wwv_flows audit

create or replace trigger wwv_biu_flows_audit
    before insert or update or delete on wwv_flows
    for each row
declare
    l_action varchar2(1);
begin
    if inserting then
       l_action := 'I';
    elsif updating then
       -- skip audit procedure call if update is just updating the audit column
       if :new.last_updated_on <> :old.last_updated_on then
           return;
       end if;
       l_action := 'U';
    else
       l_action := 'D';
    end if;
    begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOWS',
       p_action      => l_action,
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
    exception when others then null;
    end;
end;
/
show errors

prompt ...wwv_flow_pwa_shortcuts audit

create or replace trigger wwv_biu_pwa_shortcuts_audit
    before insert or update or delete on wwv_flow_pwa_shortcuts
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PWA_SHORTCUTS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
end;
/
show errors

prompt ...wwv_flow_pwa_screenshots audit

create or replace trigger wwv_biu_pwa_screenshots_audit
    before insert or update or delete on wwv_flow_pwa_screenshots
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PWA_SCREENSHOTS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.label,:old.label));
end;
/
show errors


prompt ...wwv_flow_templates audit

create or replace trigger wwv_biu_flow_tmplts_audit
    before insert or update or delete on wwv_flow_templates
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TEMPLATES',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
end;
/
show errors


prompt ...wwv_flow_page_tmpl_dp_audit

create or replace trigger wwv_flow_page_tmpl_dp_audit
    before insert or update or delete on wwv_flow_page_tmpl_disp_points
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PAGE_TMPL_DISP_POINTS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );
end;
/
show errors


prompt ...wwv_flow_template_opt_audit

create or replace trigger wwv_flow_template_opt_audit
    before insert or update or delete on wwv_flow_template_options
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_TEMPLATE_OPTIONS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );
end;
/
show errors


prompt ...wwv_flow_template_opt_grp_audit

create or replace trigger wwv_flow_templ_opt_grp_audit
    before insert or update or delete on wwv_flow_template_opt_groups
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_TEMPLATE_OPT_GROUPS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );
end;
/
show errors


prompt ...wwv_flow_icon_bar audit

create or replace trigger wwv_biu_flow_icon_bar_audit
    before insert or update or delete on wwv_flow_icon_bar
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ICON_BAR',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(nvl(:new.icon_image_alt,:new.icon_subtext),
                            nvl(:old.icon_image_alt,:old.icon_subtext)));
end;
/
show errors


prompt ...wwv_flow_processing audit

create or replace trigger wwv_biu_processing_audit
    before insert or update or delete on wwv_flow_processing
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PROCESSING',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.process_name,:old.process_name));
end;
/
show errors


prompt ...wwv_flow_items audit

create or replace trigger wwv_biu_flow_items_audit
    before insert or update or delete on wwv_flow_items
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ITEMS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
end;
/
show errors


prompt ...wwv_flow_computations audit

create or replace trigger wwv_biu_computations_audit
    before insert or update or delete on wwv_flow_computations
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_COMPUTATIONS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.computation_item,:old.computation_item));
end;
/
show errors


prompt ...wwv_flow_tabs audit

create or replace trigger wwv_biu_flow_tabs_audit
    before insert or update or delete on wwv_flow_tabs
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TABS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.tab_name,:old.tab_name));
end;
/
show errors



prompt ...wwv_flow_toplevel_tabs audit

create or replace trigger wwv_biu_flow_tl_tabs_audit
    before insert or update or delete on wwv_flow_toplevel_tabs
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_TOPLEVEL_TABS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.tab_name,:old.tab_name));

end;
/
show errors


prompt ...wwv_flow_lists_of_values$ audit

create or replace trigger wwv_biu_flow_lov_audit
    before insert or update or delete on wwv_flow_lists_of_values$
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LISTS_OF_VALUES$',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.lov_name,:old.lov_name));
end;
/
show errors


prompt ...wwv_flow_list_of_values_cols audit

create or replace trigger wwv_biu_flow_lovc_audit
    before insert or update or delete on wwv_flow_list_of_values_cols
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_OF_VALUES_COLS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.query_column_name,:old.query_column_name));
end;
/
show errors


prompt ...wwv_flow_list_of_values_data audit

create or replace trigger wwv_biu_flow_lovd_audit
    before insert or update or delete on wwv_flow_list_of_values_data
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_OF_VALUES_DATA',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.lov_disp_value,:old.lov_disp_value));
end;
/
show errors


prompt ...wwv_flow_steps audit

create or replace trigger wwv_biu_flow_steps_audit
    before insert or update or delete on wwv_flow_steps
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEPS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
end;
/
show errors


prompt ...wwv_flow_step_buttons audit

create or replace trigger wwv_biu_step_buttons_audit
    before insert or update or delete on wwv_flow_step_buttons
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_BUTTONS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.button_name,:old.button_name));
end;
/
show errors


prompt ...wwv_flow_step_branches audit

create or replace trigger wwv_biu_step_branches_audit
    before insert or update or delete on wwv_flow_step_branches
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_BRANCHES',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.branch_name, :old.branch_name));
end;
/
show errors


prompt ...wwv_flow_step_item_groups audit

create or replace trigger wwv_biu_step_item_groups_audit
    before insert or update or delete on wwv_flow_step_item_groups
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_ITEM_GROUPS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.label,:old.label));
end;
/
show errors


prompt ...wwv_flow_step_items audit

create or replace trigger wwv_biu_step_items_audit
    before insert or update or delete on wwv_flow_step_items
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_ITEMS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
end;
/
show errors


prompt ...wwv_biu_flow_menu_opt audit (breadcrumbs)

create or replace trigger wwv_biu_flow_menu_opt_audit
    before insert or update or delete on wwv_flow_menu_options
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_MENU_OPTIONS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.short_name,:old.short_name));
end;
/
show errors


prompt ...wwv_flow_step_computations audit

create or replace trigger wwv_biu_step_comp_audit
    before insert or update or delete on wwv_flow_step_computations
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_COMPUTATIONS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.computation_item,:old.computation_item));
end;
/
show errors


prompt ...wwv_flow_step_validations audit

create or replace trigger wwv_biu_step_valid_audit
    before insert or update or delete on wwv_flow_step_validations
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_VALIDATIONS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.validation_name,:old.validation_name));
end;
/
show errors


prompt ...wwv_flow_step_processing audit

create or replace trigger wwv_biu_step_processing_audit
    before insert or update or delete on wwv_flow_step_processing
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_PROCESSING',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.process_name,:old.process_name));
end;
/
show errors


prompt ...wwv_flow_page_plug_templates audit

create or replace trigger wwv_biu_flowpageplugtemp_audit
    before insert or update or delete on wwv_flow_page_plug_templates
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_PLUG_TEMPLATES',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.page_plug_template_name,:old.page_plug_template_name));
end;
/
show errors


prompt ...wwv_flow_plug_tmpl_dp_audit

create or replace trigger wwv_flow_plug_tmpl_dp_audit
    before insert or update or delete on wwv_flow_plug_tmpl_disp_points
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUG_TMPL_DISP_POINTS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );
end;
/
show errors


prompt ...wwv_flow_row_templates audit

create or replace trigger wwv_biu_flowrowtmplts_audit
    before insert or update or delete on wwv_flow_row_templates
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_ROW_TEMPLATES',
       p_table_pk   => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.row_template_name,:old.row_template_name));
end;
/
show errors


prompt ...wwv_flow_list_templates audit

create or replace trigger wwv_biu_flowlisttmplts_audit
    before insert or update or delete on wwv_flow_list_templates
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_TEMPLATES',
       p_table_pk   => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.list_template_name,:old.list_template_name));
end;
/
show errors


prompt ...wwv_flow_page_meta_tags audit

create or replace trigger wwv_biu_page_meta_tags_audit
    before insert or update or delete on wwv_flow_page_meta_tags
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_META_TAGS',
       p_table_pk   => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.meta_tag_name,:old.meta_tag_name));
end;
/
show errors

prompt ...wwv_flow_page_plugs audit

create or replace trigger wwv_biu_flowpageplugs_audit
    before insert or update or delete on wwv_flow_page_plugs
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PAGE_PLUGS',
       p_table_pk   => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.plug_name,:old.plug_name));
end;
/
show errors


prompt ...wwv_flow_interact_grids_audit

create or replace trigger wwv_flow_interact_grids_audit
    before insert or update or delete on wwv_flow_interactive_grids
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_INTERACTIVE_GRIDS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => null );
end;
/
show errors

prompt ...wwv_flow_region_col_grps_audit

create or replace trigger wwv_flow_region_col_grps_audit
    before insert or update or delete on wwv_flow_region_column_groups
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_REGION_COLUMN_GROUPS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.heading, :old.heading) );
end;
/
show errors


prompt ...wwv_flow_region_columns_audit

create or replace trigger wwv_flow_region_columns_audit
    before insert or update or delete on wwv_flow_region_columns
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_REGION_COLUMNS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );

end;
/
show errors


prompt ...wwv_biu_flow_messages audit

create or replace trigger wwv_biu_flow_messages_audit
    before insert or update or delete on wwv_flow_messages$
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_MESSAGES$',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
end;
/
show errors


prompt ...wwv_flow_patches audit (build options)

create or replace trigger wwv_biu_flow_patches_audit
    before insert or update or delete on wwv_flow_patches
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_PATCHES',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.patch_name,:old.patch_name));
end;
/
show errors


prompt ...wwv_flow_developers audit

create or replace trigger wwv_biu_flow_developers_audit
    before insert or update or delete on wwv_flow_developers
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_DEVELOPERS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.userid,:old.userid));
end;
/
show errors


prompt ...wwv_flow_lists audit

create or replace trigger wwv_biu_flow_lists_audit
    before insert or update or delete on wwv_flow_lists
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LISTS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.name,:old.name));
end;
/
show errors


prompt ...wwv_flow_list_items audit

create or replace trigger wwv_biu_flow_list_items_audit
    before insert or update or delete on wwv_flow_list_items
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_LIST_ITEMS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.list_item_link_text,:old.list_item_link_text));
end;
/
show errors

prompt ...wwv_flow_shortcuts audit

create or replace trigger wwv_biu_flow_shortcuts_audit
    before insert or update or delete on wwv_flow_shortcuts
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_SHORTCUTS',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.shortcut_name,:old.shortcut_name));
end;
/
show errors


prompt ...wwv_flow_setp_item_help audit

create or replace trigger wwv_biu_flow_step_item_help_a
    before insert or update or delete on wwv_flow_step_item_help
    for each row
begin
    wwv_flow_audit.audit_action (
       p_table_name  => 'WWV_FLOW_STEP_ITEM_HELP',
       p_table_pk    => nvl(:old.id,:new.id),
       p_object_name => nvl(:new.help_text,:old.help_text));
end;
/
show errors


prompt ...trigger wwv_flow_themes audit

create or replace trigger wwv_biu_flowthemes_audit
         before insert or update or delete on wwv_flow_themes
         for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_THEMES',
        p_table_pk    => nvl(:old.id,:new.id),
        p_object_name => nvl(:new.theme_name,:old.theme_name));
end;
/
show errors


prompt ...wwv_flow_theme_styles_audit

create or replace trigger wwv_biu_flow_theme_style_audit
    before insert or update or delete on wwv_flow_theme_styles
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_THEME_STYLES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );
end;
/
show errors


prompt ...wwv_flow_theme_files audit

create or replace trigger wwv_biu_flow_theme_file_audit
    before insert or update or delete on wwv_flow_theme_files
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_THEME_FILES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.file_name,:old.file_name) );
end;
/
show errors


prompt ...wwv_flow_plugins audit

create or replace trigger wwv_biu_flow_plugin_audit
    before insert or update or delete on wwv_flow_plugins
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                  when inserting then 'I'
                  when updating  then 'U'
                  else                'D'
                end;
    begin
        -- Change of plugin type
        if ( (      l_action = 'D'
                and :old.plugin_type = wwv_flow_plugin.c_plugin_type_tmpl_component
                and :old.theme_id is not null )
            or (    l_action = 'U'
                and (   wwv_flow_plugin.c_plugin_type_tmpl_component in ( :old.plugin_type, :new.plugin_type )
                    and ( :old.theme_id is not null or :new.theme_id is not null ) ) )
            or (    l_action = 'I'
                and :new.plugin_type = wwv_flow_plugin.c_plugin_type_tmpl_component
                and :new.theme_id is not null ) )
        then
            wwv_flow_audit.audit_action (
               p_table_name  => 'WWV_FLOW_TEMPLATE_COMPONENTS',
               p_action      => l_action,
               p_table_pk    => nvl(:old.id, :new.id),
               p_object_name => nvl(:new.display_name,:old.display_name) );
        else
            wwv_flow_audit.audit_action (
               p_table_name  => 'WWV_FLOW_PLUGINS',
               p_action      => l_action,
               p_table_pk    => nvl(:old.id, :new.id),
               p_object_name => nvl(:new.display_name,:old.display_name) );
       end if;
    exception when others then null;
    end;
end;
/
show errors

prompt ...wwv_flow_plugin_std_attributes audit

create or replace trigger wwv_biu_flow_plgin_stdatt_audt
    before insert or update or delete on wwv_flow_plugin_std_attributes
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_STD_ATTRIBUTES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_plugin_attr_groups audit

create or replace trigger wwv_flow_plugin_attr_grp_audit
    before insert or update or delete on wwv_flow_plugin_attr_groups
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_ATTR_GROUPS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.title,:old.title) );
end;
/
show errors


prompt ...wwv_flow_plugin_attributes audit

create or replace trigger wwv_biu_flow_plugin_attr_audit
    before insert or update or delete on wwv_flow_plugin_attributes
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_ATTRIBUTES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.prompt,:old.prompt) );
end;
/
show errors


prompt ...wwv_flow_plugin_attr_values audit

create or replace trigger wwv_biu_flow_plugin_attrv_audi
    before insert or update or delete on wwv_flow_plugin_attr_values
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_ATTR_VALUES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.display_value,:old.display_value) );
end;
/
show errors


prompt ...wwv_flow_plugin_files audit

create or replace trigger wwv_biu_flow_plugin_file_audit
    before insert or update or delete on wwv_flow_plugin_files
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_FILES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.file_name,:old.file_name) );
end;
/
show errors


prompt ...wwv_flow_plugin_events audit

create or replace trigger wwv_biu_flow_plugin_evnt_audit
    before insert or update or delete on wwv_flow_plugin_events
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_EVENTS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_plugin_settings audit

create or replace trigger wwv_biu_flow_plugin_set_audit
    before insert or update or delete on wwv_flow_plugin_settings
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_SETTINGS',
        p_table_pk    => nvl(:old.id,    :new.id),
        p_object_name => nvl(:new.plugin,:old.plugin) );
end;
/
show errors


prompt ...wwv_flow_page_da_events audit

create or replace trigger wwv_biu_flow_page_da_e_audit
    before insert or update or delete on wwv_flow_page_da_events
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PAGE_DA_EVENTS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_page_da_actions audit

create or replace trigger wwv_biu_flow_page_da_a_audit
    before insert or update or delete on wwv_flow_page_da_actions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PAGE_DA_ACTIONS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.action,:old.action) );
end;
/
show errors


prompt ...wwv_flow_shared_web_services audit

create or replace trigger wwv_biu_flow_shared_ws_audit
    before insert or update or delete on wwv_flow_shared_web_services
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_SHARED_WEB_SERVICES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_combined_files

create or replace trigger wwv_biu_flow_comb_files_audit
    before insert or update or delete on wwv_flow_combined_files
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_COMBINED_FILES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.combined_file_url, :old.combined_file_url) );
end;
/
show errors


prompt ...wwv_flow_static_files audit

create or replace trigger wwv_biu_flow_file_audit
    before insert or update or delete on wwv_flow_static_files
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_STATIC_FILES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.file_name,:old.file_name) );
end;
/
show errors


prompt ...wwv_credentials audit

create or replace trigger wwv_biu_credential_audit
    before insert or update or delete on wwv_credentials
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_CREDENTIALS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_remote_servers audit

create or replace trigger wwv_biu_remote_srv_audit
    before insert or update or delete on wwv_remote_servers
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_REMOTE_SERVERS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_data_profiles audit

create or replace trigger wwv_biu_flow_data_prof_audit
    before insert or update or delete on wwv_flow_data_profiles
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_DATA_PROFILES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_data_profile_cols audit

create or replace trigger wwv_biu_flow_dataprofcol_audit
    before insert or update or delete on wwv_flow_data_profile_cols
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_DATA_PROFILE_COLS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_document_sources audit

create or replace trigger wwv_biu_flow_docsrc_audit
    before insert or update or delete on wwv_flow_document_sources
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => case :new.document_source_type
                            when 'DUALITY_VIEW'
                            then 'WWV_FLOW_DUALITY_VIEW_SOURCES'
                            else 'WWV_FLOW_JSON_SOURCES'
                        end,
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_ai_configs audit

create or replace trigger wwv_biu_flow_ai_config_audit
    before insert or update or delete on wwv_flow_ai_configs
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_AI_CONFIGS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );
end;
/
show errors

prompt ...wwv_flow_ai_config_rag_sources audit

create or replace trigger wwv_biu_flow_ai_rag_audit
    before insert or update or delete on wwv_flow_ai_config_rag_sources
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_AI_CONFIG_RAG_SOURCES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );
end;
/
show errors

prompt ...wwv_flow_web_src_modules audit

create or replace trigger wwv_biu_flow_websrc_mod_audit
    before insert or update or delete on wwv_flow_web_src_modules
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WEB_SRC_MODULES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_web_src_operations audit

create or replace trigger wwv_biu_flow_websrc_oper_audit
    before insert or update or delete on wwv_flow_web_src_operations
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WEB_SRC_OPERATIONS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.operation,:old.operation) );
end;
/
show errors

prompt ...wwv_flow_web_src_sync_steps audit

create or replace trigger wwv_biu_flow_websrc_sync_audit
    before insert or update or delete on wwv_flow_web_src_sync_steps
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WEB_SRC_SYNC_STEPS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.static_id,:old.static_id) );
end;
/
show errors

prompt ...wwv_flow_web_src_params audit

create or replace trigger wwv_biu_flow_websrc_parm_audit
    before insert or update or delete on wwv_flow_web_src_params
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WEB_SRC_PARAMS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_web_src_comp_params audit

create or replace trigger wwv_biu_flow_websrc_cpar_audit
    before insert or update or delete on wwv_flow_web_src_comp_params
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WEB_SRC_COMP_PARAMS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.value,:old.value) );
end;
/
show errors

prompt ...wwv_flow_invokeapi_comp_params audit

create or replace trigger wwv_biu_invokeapi_cpar_audit
    before insert or update or delete on wwv_flow_invokeapi_comp_params
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_INVOKEAPI_COMP_PARAMS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.value,:old.value) );
end;
/
show errors

prompt ...wwv_flow_security_schemes audit

create or replace trigger wwv_biu_flow_sec_schemes_audit
    before insert or update or delete on wwv_flow_security_schemes
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_SECURITY_SCHEMES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_trees audit

create or replace trigger wwv_biu_flow_trees_audit
    before insert or update or delete on wwv_flow_trees
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_TREES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.tree_name,:old.tree_name) );
end;
/
show errors


prompt ...wwv_flow_shared_queries audit

create or replace trigger wwv_biu_flow_shrd_qry_audit
    before insert or update or delete on wwv_flow_shared_queries
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_SHARED_QUERIES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_shared_qry_sql_stmts audit

create or replace trigger wwv_biu_flow_shrdqrystmt_audit
    before insert or update or delete on wwv_flow_shared_qry_sql_stmts
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_SHARED_QRY_SQL_STMTS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_report_layouts audit

create or replace trigger wwv_biu_flow_rpt_layouts_audit
    before insert or update or delete on wwv_flow_report_layouts
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_REPORT_LAYOUTS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.report_layout_name,:old.report_layout_name) );
end;
/
show errors

prompt ...wwv_flow_load_tables audit

create or replace trigger wwv_flow_load_tables_audit
    before insert or update or delete on wwv_flow_load_tables
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_LOAD_TABLES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_load_table_lookups audit

create or replace trigger wwv_flow_ld_tab_lookups_audit
    before insert or update or delete on wwv_flow_load_table_lookups
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_LOAD_TABLE_LOOKUPS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.load_column_name,:old.load_column_name) );
end;
/
show errors

prompt ...wwv_flow_load_table_rules audit

create or replace trigger wwv_flow_ld_tab_rules_audit
    before insert or update or delete on wwv_flow_load_table_rules
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_LOAD_TABLE_RULES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.load_column_name,:old.load_column_name) );
end;
/
show errors

prompt ...wwv_flow_authentications audit

create or replace trigger wwv_biu_flow_authent_audit
    before insert or update or delete on wwv_flow_authentications
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_AUTHENTICATIONS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

create or replace trigger wwv_biu_jet_charts_audit
    before insert or update or delete on wwv_flow_jet_charts
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_JET_CHARTS',
        p_table_pk    => nvl(:old.id,:new.id),
        p_object_name => nvl(:new.title,:old.title));
end;
/
show errors

create or replace trigger wwv_biu_jet_series_audit
    before insert or update or delete on wwv_flow_jet_chart_series
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_JET_CHART_SERIES',
        p_table_pk    => nvl(:old.id,:new.id),
        p_object_name => nvl(:new.name,:old.name));
end;
/
show errors

create or replace trigger wwv_biu_jet_axes_audit
    before insert or update or delete on wwv_flow_jet_chart_axes
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_JET_CHART_AXES',
        p_table_pk    => nvl(:old.id,:new.id),
        p_object_name => nvl(:new.title,:old.title));
end;
/
show errors

prompt ...wwv_flow_app_settings audit

create or replace trigger wwv_biu_flow_appset_audit
    before insert or update or delete on wwv_flow_app_settings
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_APP_SETTINGS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_email_templates audit

create or replace trigger wwv_biu_flow_emailtemp_audit
    before insert or update or delete on wwv_flow_email_templates
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_EMAIL_TEMPLATES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_automations audit

create or replace trigger wwv_biu_flow_automation_audit
    before insert or update or delete on wwv_flow_automations
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_AUTOMATIONS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_automation_actions audit

create or replace trigger wwv_biu_flow_am_actions_audit
    before insert or update or delete on wwv_flow_automation_actions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_AUTOMATION_ACTIONS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_map_regions

create or replace trigger wwv_flow_map_regions_audit
    before insert or update or delete on wwv_flow_map_regions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_MAP_REGIONS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => null );
end;
/

prompt ...wwv_flow_map_region_layers

create or replace trigger wwv_flow_map_layers_audit
    before insert or update or delete on wwv_flow_map_region_layers
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_MAP_REGION_LAYERS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/

prompt ...wwv_flow_cards

create or replace trigger wwv_flow_cards_audit
    before insert or update or delete on wwv_flow_cards
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_CARDS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => null );
end;
/
show errors

prompt ...wwv_flow_card_actions

create or replace trigger wwv_flow_card_actions_audit
    before insert or update or delete on wwv_flow_card_actions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_CARD_ACTIONS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => null );
end;
/
show errors

prompt ...wwv_flow_task_defs

create or replace trigger wwv_flow_task_defs_audit
    before insert or update or delete on wwv_flow_task_defs
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_TASK_DEFS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_task_def_parameters

create or replace trigger wwv_flow_task_def_params_audit
    before insert or update or delete on wwv_flow_task_def_params
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_TASK_DEF_PARAMS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.static_id,:old.static_id) );
end;
/
show errors


prompt ...wwv_flow_task_def_participants

create or replace trigger wwv_flow_task_def_parts_audit
    before insert or update or delete on wwv_flow_task_def_participants
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_TASK_DEF_PARTICIPANTS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.value,:old.value) );
end;
/
show errors


prompt ...wwv_flow_task_def_actions

create or replace trigger wwv_flow_task_def_acts_audit
    before insert or update or delete on wwv_flow_task_def_actions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_TASK_DEF_ACTIONS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_taskdef_comp_params audit

create or replace trigger wwv_flow_taskdef_cparams_audit
    before insert or update or delete on wwv_flow_task_def_comp_params
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_TASK_DEF_COMP_PARAMS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.value,:old.value) );
end;
/
show errors

prompt ...wwv_flow_search_configs audit

create or replace trigger wwv_biu_flow_searchcfg_audit
    before insert or update or delete on wwv_flow_search_configs
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_SEARCH_CONFIGS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.label,:old.label) );
end;
/
show errors


prompt ...wwv_flow_search_region_sources audit

create or replace trigger wwv_biu_flow_srchregsrc_audit
    before insert or update or delete on wwv_flow_search_region_sources
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_SEARCH_REGION_SOURCES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name) );
end;
/
show errors

prompt ...wwv_flow_plugin_act_tmpl audit

create or replace trigger wwv_flow_plugin_act_tmpl_audit
    before insert or update or delete on wwv_flow_plugin_act_templates
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_ACT_TEMPLATES',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name ));
end;
/
show errors


prompt ...wwv_flow_plugin_act_pos audit

create or replace trigger wwv_flow_plugin_act_pos_audit
    before insert or update or delete on wwv_flow_plugin_act_positions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_ACT_POSITIONS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name ));
end;
/
show errors

prompt ...wwv_flow_plugin_slots_audit audit

create or replace trigger wwv_flow_plugin_slots_audit
    before insert or update or delete on wwv_flow_plugin_slots
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_PLUGIN_SLOTS',
        p_table_pk    => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name, :old.name ));
end;
/
show errors


prompt ...wwv_flow_component_actions audit

create or replace trigger wwv_biu_component_action_audit
    before insert or update or delete on wwv_flow_component_actions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_COMPONENT_ACTIONS',
        p_table_pk    => coalesce(:old.id, :new.id),
        p_object_name => coalesce(:new.label, to_char(:new.position_id), :old.label, to_char(:old.position_id)));
end;
/
show errors


prompt ...wwv_flow_comp_menu_entries audit

create or replace trigger wwv_biu_comp_menu_entry_audit
    before insert or update or delete on wwv_flow_comp_menu_entries
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_COMP_MENU_ENTRIES',
        p_table_pk    => coalesce(:old.id, :new.id),
        p_object_name => coalesce(:new.label, :new.menu_entry_type, :old.label, :old.menu_entry_type));
end;
/
show errors

prompt ...wwv_flow_workflows audit

create or replace trigger wwv_flow_workflows_audit
    before insert or update or delete on wwv_flow_workflows
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WORKFLOWS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_workflow_versions audit

create or replace trigger wwv_flow_workflow_vers_audit
    before insert or update or delete on wwv_flow_workflow_versions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WORKFLOW_VERSIONS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.version,:old.version) );
end;
/
show errors


prompt ...wwv_flow_workflow_activities audit

create or replace trigger wwv_flow_workflow_acts_audit
    before insert or update or delete on wwv_flow_workflow_activities
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WORKFLOW_ACTIVITIES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_workflow_transitions audit

create or replace trigger wwv_flow_workflow_trans_audit
    before insert or update or delete on wwv_flow_workflow_transitions
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WORKFLOW_TRANSITIONS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors


prompt ...wwv_flow_workflow_variables audit

create or replace trigger wwv_flow_workflow_vars_audit
    before insert or update or delete on wwv_flow_workflow_variables
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WORKFLOW_VARIABLES',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.label,:old.label) );
end;
/
show errors


prompt ...wwv_flow_workflow_comp_params audit

create or replace trigger wwv_flow_workflow_cparam_audit
    before insert or update or delete on wwv_flow_workflow_comp_params
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WORKFLOW_COMP_PARAMS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.value,:old.value) );
end;
/
show errors

prompt ...wwv_flow_workflow_participants audit

create or replace trigger wwv_flow_workflow_parts_audit
    before insert or update or delete on wwv_flow_workflow_participants
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name => 'WWV_FLOW_WORKFLOW_PARTICIPANTS',
        p_table_pk   => nvl(:old.id, :new.id),
        p_object_name => nvl(:new.name,:old.name) );
end;
/
show errors

prompt ...wwv_flow_map_backgrounds audit
create or replace trigger wwv_biu_flow_mapbkg_audit
    before insert or update or delete on wwv_flow_map_backgrounds
    for each row
begin
    wwv_flow_audit.audit_action (
        p_table_name  => 'WWV_FLOW_MAP_BACKGROUNDS',
        p_table_pk    => nvl( :old.id, :new.id ),
        p_object_name => nvl( :new.name,:old.name ) );
end;
/
show errors

prompt ...wwv_flow_component_groups audit
create or replace trigger wwv_flow_comp_grps_audit
    before insert or update or delete on wwv_flow_component_groups
    for each row
declare
    l_action varchar2(1);
begin
    l_action := case
                    when inserting then 'I'
                    when updating  then 'U'
                    else                'D'
                end;

    begin
        wwv_flow_audit.audit_action (
            p_table_name  => 'WWV_FLOW_COMPONENT_GROUPS',
            p_action      => l_action,
            p_table_pk    => nvl(:old.id,:new.id),
            p_object_name => nvl(:new.name,:old.name));
    exception
        when others then
            null;
    end;
end;
/
show errors
