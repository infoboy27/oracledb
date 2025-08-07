set define off verify off
prompt ...wwv_meta_meta_data
create or replace package wwv_meta_meta_data
as
--------------------------------------------------------------------------------
--  Copyright (c) 2022, 2024, Oracle and/or its affiliates.
--
--  This package provides data processing and query capabilities for
--  Page Designer configuration.
--------------------------------------------------------------------------------

--##############################################################################
-- Global types
--##############################################################################

subtype t_id                    is varchar2( 255 );
subtype t_property_id           is varchar2( 30 );
subtype t_property_type         is varchar2( 40 );
subtype t_component_type_id     is binary_integer;
subtype t_plugin_name           is varchar2( 255 );
subtype t_db_column             is varchar2( 128 );
subtype t_db_column_json_key    is varchar2( 4000 );
subtype t_component_id          is varchar2( 4000 );
subtype t_display_value         is varchar2( 4000 );

subtype t_max_varchar2 is varchar2 ( 32767 );

type t_component_type_ids is table of t_component_type_id;
type t_property_ids       is table of t_property_id;
type t_numbers            is table of number;

type t_display_group is record (
    id            wwv_pe_display_groups.id%type,
    name          wwv_pe_display_groups.name%type,
    title         varchar2(255) -- store the translated value instead of the message name in the table
);
type t_display_groups is table of t_display_group index by t_property_id;

type t_lov_value is record (
    d              wwv_pe_property_lov_values.display_value%type,
    r              wwv_pe_property_lov_values.return_value%type,
    icon           wwv_pe_property_lov_values.icon%type,
    is_translated  boolean,
    is_quick_pick  boolean default false,
    is_internal    boolean default false,
    is_deprecated  boolean default false,
    min_db_version number,
    help_text      wwv_flow_messages$.message_text%type );

type t_lov_values is table of t_lov_value index by binary_integer; -- index by rownum

type t_property is record (
    id                         wwv_pe_properties.id%type,
    name                       wwv_pe_properties.name%type,
    prompt                     varchar2( 255 ),
    property_type              wwv_pe_properties.property_type%type,
    multi_value_delimiter      wwv_pe_properties.multi_value_delimiter%type,
    is_query_only              boolean default false,
    is_plugin_attribute        boolean default false,
    display_length             wwv_pe_properties.display_length%type,
    max_length                 wwv_pe_properties.max_length%type,
    min_value                  wwv_pe_properties.min_value%type,
    max_value                  wwv_pe_properties.max_value%type,
    unit                       wwv_pe_properties.unit%type,
    validation_plsql_ret_error wwv_pe_properties.validation_plsql_ret_error%type,
    text_case                  wwv_pe_properties.text_case%type,
    restricted_characters      wwv_pe_properties.restricted_characters%type,
    supported_component_types  wwv_flow_plugin_attributes.supported_component_types%type, -- only needed by plug-in attributes, because normal properties would just not be assigned to that component type
    display_group_id           wwv_pe_properties.display_group_id%type,
    lov_type                   wwv_pe_properties.lov_type%type,
    lov_component_type_id      t_component_type_id,
    lov_component_type_scope   wwv_pe_properties.lov_component_type_scope%type,
    lov_values                 t_lov_values,
    yes_value                  wwv_pe_properties.prop_type_yesno_override_y%type,
    no_value                   wwv_pe_properties.prop_type_yesno_override_n%type,
    sql_min_column_count       wwv_pe_properties.sql_min_column_count%type,
    sql_max_column_count       wwv_pe_properties.sql_max_column_count%type,
    column_data_types          wwv_pe_properties.column_data_types%type,
    examples                   wwv_flow_messages$.message_text%type,
    is_translatable            boolean,
    is_searchable              boolean,
    deprecated_values          wwv_pe_properties.deprecated_values%type,
    is_internal                boolean default false,
    min_db_version             number,
    help_text                  wwv_flow_messages$.message_text%type,
    ref_by_component_types     t_component_type_ids := t_component_type_ids());

type t_properties is table of t_property index by t_property_id;

subtype t_condition_type        is wwv_pe_component_props.depending_on_condition_type%type;

c_cond_equals                   constant t_condition_type := 'EQUALS';
c_cond_not_equals               constant t_condition_type := 'NOT_EQUALS';
c_cond_like                     constant t_condition_type := 'LIKE';
c_cond_not_like                 constant t_condition_type := 'NOT_LIKE';
c_cond_null                     constant t_condition_type := 'NULL';
c_cond_not_null                 constant t_condition_type := 'NOT_NULL';
c_cond_in_list                  constant t_condition_type := 'IN_LIST';
c_cond_not_in_list              constant t_condition_type := 'NOT_IN_LIST';
c_cond_in_list_like             constant t_condition_type := 'IN_LIST_LIKE';
c_cond_not_in_list_like         constant t_condition_type := 'NOT_IN_LIST_LIKE';

type t_used_properties     is table of t_property_id;
type t_features_properties is table of t_used_properties index by varchar2( 255 ); -- index by feature (standard attribute) name

type t_depending_on is record (
    id             number,
    has_to_exist   boolean default true,
    condition_type t_condition_type,
    expression     t_max_varchar2 );

type t_depending_ons is table of t_depending_on;

type t_ref_by_depending_on is record (
    id           t_property_id,
    has_to_exist boolean );

type t_ref_by_depending_ons is table of t_ref_by_depending_on;

type t_comp_property is record (
    property_id                 wwv_pe_component_props.property_id%type,
    db_column                   t_db_column,
    db_column_json_key          t_db_column_json_key,
    display_sequence            wwv_pe_component_props.display_sequence%type,
    is_required                 boolean,
    is_common                   boolean,
    check_uniqueness            wwv_pe_component_props.check_uniqueness%type,
    is_read_only                boolean,
    is_plugin_attribute         boolean default false,
    reference_on_delete         wwv_pe_component_props.reference_on_delete%type,
    reference_scope             wwv_pe_component_props.reference_scope%type,
    supports_substitution       boolean,
    supports_template_directive wwv_pe_component_props.supports_template_directive%type,
    custom_data_type            wwv_pe_component_props.custom_data_type%type,
    default_value               wwv_pe_component_props.default_value%type,
    null_text                   wwv_pe_component_props.null_text%type,
    null_help_text              wwv_pe_component_props.null_help_text%type,
    parent_component_type_id    t_component_type_id,
    parent_property_id          t_property_id,
    features_properties         t_features_properties,
    depending_ons               t_depending_ons        := t_depending_ons(),
    ref_by_depending_ons        t_ref_by_depending_ons := t_ref_by_depending_ons(),
    examples                    wwv_flow_messages$.message_text%type,
    help_text                   wwv_flow_messages$.message_text%type,
    important_for_accessibility boolean,
    accessibility_help_text     wwv_flow_messages$.message_text%type );

type t_comp_properties is table of t_comp_property index by t_property_id;

type t_plugin_attribute is record (
    id                          wwv_flow_plugin_attributes.id%type,
    scope                       wwv_flow_plugin_attributes.attribute_scope%type,
    mapping_no                  wwv_flow_plugin_attributes.attribute_sequence%type,
    db_column                   t_db_column,
    static_id                   wwv_flow_plugin_attributes.static_id%type,
    display_sequence            wwv_flow_plugin_attributes.display_sequence%type,
    prompt                      wwv_flow_plugin_attributes.prompt%type,
    attribute_type              wwv_flow_plugin_attributes.attribute_type%type,
    display_group_id            number,
    multi_value_delimiter       varchar2(1),
    is_required                 boolean,
    is_common                   boolean,
    is_translatable             boolean,
    is_searchable               boolean,
    display_length              wwv_flow_plugin_attributes.display_length%type,
    max_length                  wwv_flow_plugin_attributes.max_length%type,
    text_case                   wwv_flow_plugin_attributes.text_case%type,
    sql_min_column_count        wwv_flow_plugin_attributes.sql_min_column_count%type,
    sql_max_column_count        wwv_flow_plugin_attributes.sql_max_column_count%type,
    column_data_types           wwv_flow_plugin_attributes.column_data_types%type,
    parent_component_type_id    t_component_type_id,
    parent_attribute_id         wwv_flow_plugin_attributes.parent_attribute_id%type,
    lov_type                    wwv_flow_plugin_attributes.lov_type%type,
    lov_component_type_id       t_component_type_id,
    lov_component_type_scope    wwv_flow_plugin_attributes.lov_component_type_scope%type,
    reference_on_delete         wwv_flow_plugin_attributes.lov_component_type_on_delete%type,
    unit                        wwv_flow_plugin_attributes.unit%type,
    null_text                   wwv_flow_plugin_attributes.null_text%type,
    supported_component_types   wwv_flow_plugin_attributes.supported_component_types%type,
    reference_scope             wwv_flow_plugin_attributes.reference_scope%type,
    supports_substitution       boolean,
    supports_template_directive wwv_pe_component_props.supports_template_directive%type,
    default_value               wwv_flow_plugin_attributes.default_value%type,
    lov_values                  t_lov_values,
    depending_on                t_depending_on,
    deprecated_values           wwv_flow_plugin_attributes.deprecated_values%type,
    examples                    wwv_flow_plugin_attributes.examples%type,
    help_text                   wwv_flow_plugin_attributes.help_text%type,
    important_for_accessibility boolean,
    accessibility_help_text     wwv_flow_plugin_attributes.accessibility_help_text%type );

type t_plugin_attributes is table of t_plugin_attribute index by t_property_id;

type t_plugin_std_attribute is record (
    is_required               boolean,
    sql_min_column_count      wwv_flow_plugin_std_attributes.sql_min_column_count%type,
    sql_max_column_count      wwv_flow_plugin_std_attributes.sql_max_column_count%type,
    supported_component_types wwv_flow_plugin_std_attributes.supported_component_types%type, -- $$$ not yet supported
    default_value             wwv_flow_plugin_std_attributes.default_value%type,
    depending_on              t_depending_on, -- $$$ not yet supported
    examples                  wwv_flow_plugin_std_attributes.examples%type,
    help_text                 wwv_flow_plugin_std_attributes.help_text%type );

type t_plugin_std_attributes is table of t_plugin_std_attribute index by t_property_id;

type t_plugin_event is record (
    name         varchar2( 255 ),
    display_name wwv_flow_plugin_events.display_name%type );

type t_plugin_events is table of t_plugin_event index by binary_integer; -- seq

type t_plugin_action_template is record (
    id               t_id,
    name             wwv_flow_plugin_act_templates.name%type,
    type             wwv_flow_plugin_act_templates.type%type,
    help_text        wwv_flow_plugin_act_templates.help_text%type,
    features         t_max_varchar2 );

type t_plugin_action_templates is table of t_plugin_action_template index by binary_integer;

type t_plugin_action_position is record (
    id               t_id,
    name             wwv_flow_plugin_act_positions.name%type,
    is_quick_pick    boolean,
    type             wwv_flow_plugin_act_positions.type%type,
    template_id      t_id, -- references t_plugin_action_template
    help_text        wwv_flow_plugin_act_positions.help_text%type,
    features         t_max_varchar2 );

type t_plugin_action_positions is table of t_plugin_action_position index by binary_integer;

type t_plugin_slot is record (
    name                   wwv_flow_plugin_slots.name%type,
    placeholder            varchar2(255),
    has_grid_support       boolean,
    has_region_support     boolean,
    has_item_support       boolean,
    has_button_support     boolean,
    max_fixed_grid_columns pls_integer,
    position_in_partial    pls_integer,
    position_in_report     pls_integer,
    glv_new_row            boolean default true,
    is_quick_pick          boolean default false,
    supported_region_types t_max_varchar2,
    supported_item_types   t_max_varchar2 );

type t_plugin_slots is table of t_plugin_slot index by wwv_flow_plugin_slots.name%type;

type t_plugin_attribute_group is record (
    id                        wwv_flow_plugin_attr_groups.id%type,
    title                     wwv_flow_plugin_attr_groups.title%type);

type t_plugin_attribute_groups is table of t_plugin_attribute_group index by binary_integer;

type t_plugin is record (
    plugin_type               wwv_flow_plugins.plugin_type%type,
    name                      t_plugin_name,
    display_name              wwv_flow_plugins.display_name%type,
    category                  wwv_flow_plugins.category%type,
    features                  wwv_flow_plugins.standard_attributes%type,
    supported_component_types wwv_flow_plugins.supported_component_types%type,
    supported_data_types      wwv_flow_plugins.supported_data_types%type,
    is_quick_pick             boolean,
    is_deprecated             boolean,
    is_legacy                 boolean,
    about_url                 wwv_flow_plugins.about_url%type,
    help_text                 wwv_flow_plugins.help_text%type,
    attributes                t_plugin_attributes,
    attribute_groups          t_plugin_attribute_groups,
    std_attributes            t_plugin_std_attributes,
    events                    t_plugin_events,
    action_templates          t_plugin_action_templates,
    action_positions          t_plugin_action_positions,
    slots                     t_plugin_slots,
    default_slot_region       wwv_flow_plugins.default_slot_region%type,
    default_slot_item         wwv_flow_plugins.default_slot_item%type,
    default_slot_button       wwv_flow_plugins.default_slot_button%type,
    theme_id                  number );

type t_plugins is table of t_plugin index by t_plugin_name;

type t_component_type is record (
    id                            t_component_type_id,
    name                          wwv_pe_component_types.name%type,
    singular_title                varchar2( 255 ),
    plural_title                  varchar2( 255 ),
    table_name                    wwv_pe_component_types.table_name%type,
    display_sequence              wwv_pe_component_types.display_sequence%type,
    pk_column                     wwv_pe_component_types.pk_column%type,
    parent_id                     t_component_type_id,
    parent_fk_column              wwv_pe_component_types.parent_fk_column%type,
    parent_property_id            t_property_id,
    is_one_to_one_relation        boolean,
    is_attributes_type            boolean,
    page_id_column                wwv_pe_component_types.page_id_column%type,
    where_clause                  wwv_pe_component_types.where_clause%type,
    display_column                wwv_pe_component_types.display_column%type,
    alt_display_column            wwv_pe_component_types.alt_display_column%type,
    display_property_id           t_property_id,
    alt_display_property_id       t_property_id,
    seq_property_id               t_property_id,
    create_url                    wwv_pe_component_types.create_url%type,
    edit_url                      wwv_pe_component_types.edit_url%type,
    copy_url                      wwv_pe_component_types.copy_url%type,
    file_path                     varchar2( 255 ),
    is_query_only                 boolean,
    plugin_type                   wwv_pe_component_types.plugin_type%type,
    plugin_column                 wwv_pe_component_types.plugin_column%type,
    supported_template_components wwv_pe_component_types.supported_template_components%type,
    plugin_property_id            t_property_id,
    plugin_attributes_seq_offset  wwv_pe_component_types.plugin_attributes_seq_offset%type,
    plugin_required_properties    t_used_properties default t_used_properties(),
    plugins                       t_plugins,
    properties                    t_comp_properties,
    ref_by_properties             t_property_ids       := t_property_ids(),
    child_component_types         t_component_type_ids := t_component_type_ids(),
    is_shared_designer_component  boolean,
    is_theme_component            boolean );

type t_component_types is table of t_component_type index by t_component_type_id;

type t_property_values is table of t_max_varchar2 index by t_property_id;

-- Used by fetch_all_components
type t_child_component_range is record (
    from_idx pls_integer,
    to_idx   pls_integer );

type t_child_component_ranges is table of t_child_component_range index by t_component_type_id;

type t_component is record (
    id                     t_component_id,
    parent_id              t_component_id,
    display_value          t_display_value,
    page_id                number,
    property_values        t_property_values,
    child_component_ranges t_child_component_ranges );

type t_components     is table of t_component index by pls_integer;
type t_components_map is table of pls_integer index by t_component_id;

type t_type_component  is record (
    components     t_components,
    components_map t_components_map );

type t_type_components is table of t_type_component index by t_component_type_id;

type t_changed_property_value is record (
    old_value t_max_varchar2,
    new_value t_max_varchar2 );

type t_changed_property_values is table of t_changed_property_value index by t_property_id;

type t_error is record (
    property_id t_property_id,
    message     t_max_varchar2 );

type t_errors is table of t_error;

type t_component_reference is record (
    page_id                pls_integer,
    component_id           t_component_id,
    component_type_id      t_component_type_id,
    component_display_name t_max_varchar2 );

type t_component_references is table of t_component_reference;

--##############################################################################
-- Constants
--##############################################################################

c_current_db_version            constant number              := sys.dbms_db_version.version + ( sys.dbms_db_version.release / 10 );

c_comp_type_component_type      constant t_component_type_id := 1;

c_comp_type_application         constant t_component_type_id := 1000;

c_comp_type_theme               constant t_component_type_id := 2000;
c_comp_type_theme_style         constant t_component_type_id := 2010;
c_comp_type_page_template       constant t_component_type_id := 2510;
c_comp_type_field_template      constant t_component_type_id := 2520;
c_comp_type_button_template     constant t_component_type_id := 2530;
c_comp_type_region_template     constant t_component_type_id := 2540;
c_comp_type_list_template       constant t_component_type_id := 2550;
c_comp_type_bc_template         constant t_component_type_id := 2560;
c_comp_type_calendar_template   constant t_component_type_id := 2570;
c_comp_type_report_template     constant t_component_type_id := 2580;

c_comp_type_build_option        constant t_component_type_id := 3040;
c_comp_type_authentication      constant t_component_type_id := 3050;
c_comp_type_authorization       constant t_component_type_id := 3060;
c_comp_type_web_src_module      constant t_component_type_id := 3080;
c_comp_type_web_src_mod_param   constant t_component_type_id := 3082;
c_comp_type_web_src_mod_dp      constant t_component_type_id := 3084;
c_comp_type_web_src_mod_dp_col  constant t_component_type_id := 3086;
c_comp_type_web_src_operation   constant t_component_type_id := 3088;
c_comp_type_web_src_oper_param  constant t_component_type_id := 3090;
c_comp_type_web_src_oper_dp     constant t_component_type_id := 3092;
c_comp_type_web_src_oper_dpcol  constant t_component_type_id := 3094;
c_comp_type_plugin              constant t_component_type_id := 3110;
c_comp_type_plugin_file         constant t_component_type_id := 3142;
c_comp_type_plugin_setting      constant t_component_type_id := 3144;
c_comp_type_application_file    constant t_component_type_id := 3150;

c_comp_type_dualityvw_dp_col    constant t_component_type_id := 3318;
c_comp_type_jsoncoll_dp_col     constant t_component_type_id := 3320;
c_comp_type_breadcrumb_entry    constant t_component_type_id := 3511;
c_comp_type_list_entry          constant t_component_type_id := 3521;
c_comp_type_lov_entry           constant t_component_type_id := 3531;
c_comp_type_data_load_table     constant t_component_type_id := 3550;
c_comp_type_tabset              constant t_component_type_id := 3560;
c_comp_type_report_layout       constant t_component_type_id := 3570;
c_comp_type_report_query        constant t_component_type_id := 3580;
c_comp_type_report_query_stmt   constant t_component_type_id := 3585;
c_comp_type_automation_action   constant t_component_type_id := 3620;
c_comp_type_email_template      constant t_component_type_id := 3630;
c_comp_type_data_load_def       constant t_component_type_id := 3640;
c_comp_type_data_load_dp        constant t_component_type_id := 3645;
c_comp_type_data_load_dp_col    constant t_component_type_id := 3647;
c_comp_type_task_definition     constant t_component_type_id := 3700;
c_comp_type_task_param          constant t_component_type_id := 3705;
c_comp_type_task_def_action     constant t_component_type_id := 3710;
c_comp_type_language_map        constant t_component_type_id := 3890;

c_comp_type_supobj              constant t_component_type_id := 4950;
c_comp_type_supobj_install      constant t_component_type_id := 4970;
c_comp_type_supobj_upgrade      constant t_component_type_id := 4975;

c_comp_type_page                constant t_component_type_id := 5000;
c_comp_type_region              constant t_component_type_id := 5110;
c_comp_type_page_item           constant t_component_type_id := 5120;
c_comp_type_button              constant t_component_type_id := 5130;
c_comp_type_da_event            constant t_component_type_id := 5140;
c_comp_type_da_action           constant t_component_type_id := 5150;
c_comp_type_meta_tag            constant t_component_type_id := 5160;
c_comp_type_validation          constant t_component_type_id := 5510;
c_comp_type_page_computation    constant t_component_type_id := 5520;
c_comp_type_page_process        constant t_component_type_id := 5530;
c_comp_type_branch              constant t_component_type_id := 5540;
c_comp_type_region_plugin_attr  constant t_component_type_id := 7000;
c_comp_type_ir_attributes       constant t_component_type_id := 7010;
c_comp_type_ir_column           constant t_component_type_id := 7040;
c_comp_type_classic_rpt_column  constant t_component_type_id := 7320;
c_comp_type_classic_rpt_print   constant t_component_type_id := 7330;
c_comp_type_tab_form_print      constant t_component_type_id := 7430;
c_comp_type_classic_calendar    constant t_component_type_id := 7610;
c_comp_type_region_column       constant t_component_type_id := 7710;
c_comp_type_jet_chart           constant t_component_type_id := 7810;
c_comp_type_ig_attributes       constant t_component_type_id := 7910;
c_comp_type_ig_column           constant t_component_type_id := 7940;
c_comp_type_card                constant t_component_type_id := 8110;
c_comp_type_map_region          constant t_component_type_id := 8210;
c_comp_type_region_action       constant t_component_type_id := 8610;
c_comp_type_ir_column_action    constant t_component_type_id := 8615;
c_comp_type_map_background      constant t_component_type_id := 8240;

c_comp_type_workflow            constant t_component_type_id := 8800;
c_comp_type_workflow_param      constant t_component_type_id := 8810;
c_comp_type_workflow_activity   constant t_component_type_id := 8830;

c_prop_error_handling_function  constant t_property_id := 41;
c_prop_process_type             constant t_property_id := 95;
c_prop_plsql_code               constant t_property_id := 198;
c_prop_verify_function_name     constant t_property_id := 199;
c_prop_pre_authentication_proc  constant t_property_id := 202;
c_prop_post_authenticatn_proc   constant t_property_id := 203;
c_prop_template_component_type  constant t_property_id := 243;
c_prop_plugin_category          constant t_property_id := 265;
c_prop_column_name              constant t_property_id := 267;
c_prop_hidden_col_have_groups   constant t_property_id := 301;
c_prop_changed_by               constant t_property_id := 381;
c_prop_changed_on               constant t_property_id := 382;
c_prop_generic_column_count     constant t_property_id := 391;
c_prop_source_graph_owner       constant t_property_id := 475;
c_prop_source_graph_name        constant t_property_id := 476;
c_prop_source_graph_match       constant t_property_id := 477;
c_prop_source_graph_where       constant t_property_id := 478;
c_prop_source_graph_columns     constant t_property_id := 479;
c_prop_source_graph_order_by    constant t_property_id := 481;
c_prop_termination_function     constant t_property_id := 486;
c_prop_task_vacation_rule_proc  constant t_property_id := 487;
c_prop_auth_config_procedure    constant t_property_id := 555;
c_prop_source_sql_expression    constant t_property_id := 817;
c_prop_source_location          constant t_property_id := 957;
c_prop_source_remote_database   constant t_property_id := 958;
c_prop_source_query_type        constant t_property_id := 959;
c_prop_source_query_owner       constant t_property_id := 960;
c_prop_source_query_table       constant t_property_id := 961;
c_prop_source_query_where       constant t_property_id := 962;
c_prop_source_query_order_by    constant t_property_id := 963;
c_prop_source_sql_query         constant t_property_id := 964;
c_prop_source_web_src_query     constant t_property_id := 967;
c_prop_source_web_src_array     constant t_property_id := 969;
c_prop_source_duality_view      constant t_property_id := 53520005;
c_prop_source_duality_view_arr  constant t_property_id := 53520009;
c_prop_source_json_collection   constant t_property_id := 53520006;
c_prop_source_json_coll_arr     constant t_property_id := 53520010;
c_prop_include_rowid_column     constant t_property_id := 978;
c_prop_child_source_location    constant t_property_id := 1032;
c_prop_source_post_proc         constant t_property_id := 1034;
c_prop_post_proc_sql_query      constant t_property_id := 1041;
c_prop_email_tmpl_placeholders  constant t_property_id := 1225;
c_prop_lov_source_location      constant t_property_id := 1316;
c_prop_lov_query_type           constant t_property_id := 1317;
c_prop_lov_legacy_sql_query     constant t_property_id := 1318;
c_prop_data_profile_csv_sep     constant t_property_id := 1340;
c_prop_data_profile_col_type    constant t_property_id := 1346;
c_prop_oracle_text_function     constant t_property_id := 1446;
c_prop_web_src_function         constant t_property_id := 1706;
c_prop_working_copy_created_on  constant t_property_id := 1785;
c_prop_completion_function      constant t_property_id := 1854;
c_prop_plugin_type              constant t_property_id := 1960;
c_prop_api_interface            constant t_property_id := 1974;
c_prop_render_proc_function     constant t_property_id := 1975;
c_prop_meta_data_proc           constant t_property_id := 1976;
c_prop_session_sentry_function  constant t_property_id := 1977;
c_prop_invalid_session_func     constant t_property_id := 1978;
c_prop_authentication_function  constant t_property_id := 1979;
c_prop_post_logout_function     constant t_property_id := 1980;
c_prop_ajax_procedure_function  constant t_property_id := 1981;
c_prop_validation_proc          constant t_property_id := 1982;
c_prop_execution_function       constant t_property_id := 1983;
c_prop_rest_source_capab_proc   constant t_property_id := 1984;
c_prop_rest_source_fetch_proc   constant t_property_id := 1985;
c_prop_rest_source_dml_proc     constant t_property_id := 1986;
c_prop_rest_source_exec_proc    constant t_property_id := 1987;
c_prop_rest_source_discov_proc  constant t_property_id := 1988;
c_prop_computation_sql_expr     constant t_property_id := 5201;
c_prop_post_proc_plsql_func     constant t_property_id := 5381;
c_prop_post_proc_js_func        constant t_property_id := 5382;
c_prop_post_proc_java_func      constant t_property_id := 5383;
c_prop_post_proc_python_func    constant t_property_id := 5384;

c_prop_custom_auth_sentry_func  constant t_property_id := 353179625368369848; -- session sentry function
c_prop_custom_auth_auth_func    constant t_property_id := 353293115026395181; -- authentication function
c_prop_custom_auth_invali_proc  constant t_property_id := 551983430308015470; -- invalid session procedure
c_prop_custom_auth_postlg_proc  constant t_property_id := 353301225415398269; -- post logout procedure

c_prop_type_owner               constant t_property_type := 'OWNER';
c_prop_type_table               constant t_property_type := 'TABLE';
c_prop_type_graph               constant t_property_type := 'GRAPH';
c_prop_type_sql                 constant t_property_type := 'SQL';
c_prop_type_legacy_sql          constant t_property_type := 'LEGACY SQL';
c_prop_type_password            constant t_property_type := 'PASSWORD';
c_prop_type_plsql               constant t_property_type := 'PLSQL';
c_prop_type_plsql_func_sql      constant t_property_type := 'PLSQL FUNCTION BODY SQL';
c_prop_type_func_return_vc2     constant t_property_type := 'PLSQL FUNCTION BODY VARCHAR2';
c_prop_type_func_return_bool    constant t_property_type := 'PLSQL FUNCTION BODY BOOLEAN';
c_prop_type_func_return_custom  constant t_property_type := 'PLSQL FUNCTION BODY CUSTOM';
c_prop_type_javascript          constant t_property_type := 'JAVASCRIPT';
c_prop_type_js_func_sql         constant t_property_type := 'MLE JAVASCRIPT FUNCTION BODY SQL';
c_prop_type_java_func_sql       constant t_property_type := 'MLE JAVA FUNCTION BODY SQL';
c_prop_type_python_func_sql     constant t_property_type := 'MLE PYTHON FUNCTION BODY SQL';
c_prop_type_where_clause        constant t_property_type := 'WHERE CLAUSE';
c_prop_type_order_by_clause     constant t_property_type := 'ORDER BY CLAUSE';
c_prop_type_code_language       constant t_property_type := 'CODE LANGUAGE';
c_prop_type_yes_no              constant t_property_type := 'YES NO';
c_prop_type_hidden              constant t_property_type := 'HIDDEN';
c_prop_type_number              constant t_property_type := 'NUMBER';
c_prop_type_integer             constant t_property_type := 'INTEGER';
c_prop_type_checkboxes          constant t_property_type := 'CHECKBOXES';
c_prop_type_page_number         constant t_property_type := 'PAGE NUMBER';
c_prop_type_template_options    constant t_property_type := 'TEMPLATE OPTIONS';
c_prop_type_file_urls_js        constant t_property_type := 'FILE URLS JAVASCRIPT';
c_prop_type_file_urls_css       constant t_property_type := 'FILE URLS CSS';
c_prop_type_link                constant t_property_type := 'LINK';
c_prop_type_order_by_item       constant t_property_type := 'ORDER BY ITEM';
c_prop_type_subscription        constant t_property_type := 'SUBSCRIPTION';
c_prop_type_plsql_package       constant t_property_type := 'PLSQL PACKAGE';
c_prop_type_plsql_method        constant t_property_type := 'PLSQL METHOD';
c_prop_type_html                constant t_property_type := 'HTML';
c_prop_type_media               constant t_property_type := 'MEDIA';
c_prop_type_plsql_expr_vc2      constant t_property_type := 'PLSQL EXPRESSION VARCHAR2';
c_prop_type_plsql_expr_bool     constant t_property_type := 'PLSQL EXPRESSION BOOLEAN';
c_prop_type_plsql_expr_custom   constant t_property_type := 'PLSQL EXPRESSION CUSTOM';
c_prop_type_plsql_expr_clob     constant t_property_type := 'PLSQL FUNCTION BODY CLOB';
c_prop_type_sql_expr            constant t_property_type := 'SQL EXPRESSION';
c_prop_type_sql_expr_bool       constant t_property_type := 'SQL EXPRESSION BOOLEAN';
c_prop_type_sql_expr_custom     constant t_property_type := 'SQL EXPRESSION CUSTOM';

subtype t_lov_type is wwv_pe_properties.lov_type%type;

c_lov_type_static              constant t_lov_type := 'STATIC';
c_lov_type_component           constant t_lov_type := 'COMPONENT';
c_lov_type_distinct            constant t_lov_type := 'DISTINCT';
c_lov_type_events              constant t_lov_type := 'EVENTS';
c_lov_type_plugins             constant t_lov_type := 'PLUGINS';
c_lov_type_action_positions    constant t_lov_type := 'PLUGIN_ACTION_POSITIONS';
c_lov_type_action_templates    constant t_lov_type := 'PLUGIN_ACTION_TEMPLATES';
c_lov_type_grid_columns        constant t_lov_type := 'GRID_COLUMNS';

--------------------------------------------------------------------------------
-- Supported levels of the INIT procedure.
--------------------------------------------------------------------------------
subtype t_init_level is pls_integer range 1 .. 7;

c_init_level_page_designer constant t_init_level := 1;
c_init_level_page          constant t_init_level := 2;
c_init_level_workspace     constant t_init_level := 3;
c_init_level_all           constant t_init_level := 4;
c_init_level_page_export   constant t_init_level := 5;
c_init_level_deps          constant t_init_level := 6;
c_init_level_page_deps     constant t_init_level := 7;

--------------------------------------------------------------------------------
-- Supported where clauses of the PARSE_COMPONENT_SELECT procedure.
--------------------------------------------------------------------------------
subtype t_where_clause is pls_integer range 1 .. 3;

c_where_clause_primary_key constant t_where_clause := 1;
c_where_clause_parent_id   constant t_where_clause := 2;
c_where_clause_page_id     constant t_where_clause := 3;

--##############################################################################
-- Global variables
--##############################################################################

g_properties      t_properties;
g_component_types t_component_types;
g_display_groups  t_display_groups;

procedure get_component_references (
    p_application_id        in number,
    p_component_type_id     in wwv_meta_meta_data.t_component_type_id,
    p_component_id          in t_component_id,
    p_result                in out nocopy t_component_references );
--
--==============================================================================
-- Populates the internal caching arrays with the meta data for all
-- Component Types and plug-ins.
--
-- Parameters:
-- * p_application_id: ID of the application.
-- * p_level:          Specify which component types should be included.
--                     Use constants c_init_level_*.
-- * p_set_text        If true, all system messages for prompts, titles, LOV
--                     display values will be read instead of just returning
--                     the name of the system message.
--                     Note: Help text is not set!
-- * p_set_help_text   If true, help text will be read from system messages
--                     instead of just returning the name of the system message.
-- * p_lang:           Language used when p_set_text or p_set_help_text = true.
-- * p_with_id_mode:   Specifies how component ids should be emitted by
--                     get_property_display_value.
--==============================================================================
procedure init (
    p_application_id in number,
    p_level          in t_init_level,
    p_set_text       in boolean                     default false,
    p_set_help_text  in boolean                     default false,
    p_lang           in varchar2                    default null,
    p_with_id_mode   in wwv_flow_gen_api2.t_id_mode default wwv_flow_gen_api2.c_id_unchanged );

--==============================================================================
-- Populates the internal caching arrays with the meta data for all the page
-- related component types.
--==============================================================================
--procedure populate_page_comp_types;

--==============================================================================
-- Populates the internal caching arrays with the meta data for all
-- Shared Components.
--
-- Parameters:
-- * p_only_for_page_designer:  If true, Shared Component sub-components like
--                              breadcrumb entrys, list entries and lov entries
--                              will get excluded.
--                              If false, all Shared Components will be loaded.
--==============================================================================
procedure populate_shared_comp_types (
    p_only_for_page_designer in boolean default false );

--==============================================================================
-- Populates the internal caching arrays with the meta data of a component type
-- and it's dependent objects.
--==============================================================================
procedure populate_component_type (
    p_id                     in t_component_type_id,
    p_only_type_data         in boolean default false,
    p_only_for_page_designer in boolean default false );

--==============================================================================
-- Populates the internal caching arrays with the meta data of all
-- "native" plug-ins in app 4411.
--==============================================================================
procedure populate_native_plugins;

--==============================================================================
-- Populates the internal caching arrays with the meta data of all
-- plug-ins defined in the specified application.
--==============================================================================
procedure populate_custom_plugins (
    p_application_id in number );

--==============================================================================
-- Populates the internal caching arrays with the meta data of all
-- workflow related components.
--==============================================================================
procedure populate_wf_component_types(
    p_application_id in number );

--==============================================================================
-- Generates and parses the SQL query to read the meta data of the specified
-- component type.
--==============================================================================
procedure parse_component_select (
    p_cursor           in integer,
    p_type_id          in t_component_type_id,
    p_add_properties   in boolean        default true,
    p_add_where_clause in t_where_clause default null,
    p_add_for_update   in boolean        default false,
    p_add_order_by     in boolean        default false );

--==============================================================================
-- Binds and executes the SQL query prepared by parse_component_select.
--==============================================================================
procedure execute_component_select (
    p_cursor         in integer,
    p_type_id        in t_component_type_id,
    p_application_id in number         default null,
    p_page_id        in number         default null,
    p_id             in t_component_id default null,
    p_parent_id      in t_component_id default null );

--==============================================================================
-- Fetches the next component and returns true if a component was read and
-- false if no additional component could be read. p_component contains the
-- data of the read component.
--==============================================================================
function fetch_component (
    p_cursor    in     integer,
    p_type_id   in     t_component_type_id,
    p_component    out t_component )
    return boolean;

--==============================================================================
-- Reads all components of the specified application or page and stores them as
-- a hierarchy of components in p_type_components.
--==============================================================================
procedure fetch_all_components (
    p_application_id  in            number,
    p_page_id         in            number default null,
    p_type_components in out nocopy t_type_components );

--==============================================================================
-- Returns the specified component if it's available in the p_type_components
-- array, otherwise an empty t_component will be returned.
--==============================================================================
function get_component (
    p_component_type_id in t_component_type_id,
    p_component_id      in t_component_id,
    p_type_components   in t_type_components )
    return t_component;

--==============================================================================
-- Returns the display title of the passed component. This function is
-- more accurate than p_component.display_value, because it also resolves
-- static lovs or component lookups to get the real display value.
--==============================================================================
function get_component_display_title (
    p_component_type_id in t_component_type_id,
    p_component         in t_component,
    p_type_components   in t_type_components,
    p_export_for_diff   in boolean             default false )
    return varchar2;

--==============================================================================
-- Returns the display value and if it's a component reference the component id
-- of the passed in property and property value.
--==============================================================================
procedure set_property_display_value (
    p_component_type_id   in     t_component_type_id,
    p_property_id         in     t_property_id,
    p_type_components     in     t_type_components,
    p_value               in     varchar2,
    p_return_component_id in     boolean,
    p_export_for_diff     in     boolean             default false,
    p_display_value          out varchar2,
    p_component_id           out varchar2 );

--==============================================================================
-- Deletes the specified component from the meta data of the application.
--
-- Note: Before this procedure can be used, populate_component_type has to be
--       called for the passed component type.
--==============================================================================
procedure delete_component (
    p_cursor         in            integer,
    p_application_id in            number,
    p_page_id        in            number,
    p_type_id        in            t_component_type_id,
    p_id             in            t_component_id,
    p_parent_id      in            t_component_id,
    p_errors         in out nocopy t_errors );

--==============================================================================
-- Updates the specified component in the meta data of the application.
--==============================================================================
procedure update_component (
    p_cursor              in integer,
    p_application_id      in            number,
    p_page_id             in            number,
    p_type_id             in            t_component_type_id,
    p_id                  in            t_component_id,
    p_parent_id           in            t_component_id,
    p_old_grid_properties in            t_property_ids,
    p_grid_properties     in            t_property_ids,
    p_property_values     in            t_changed_property_values,
    p_errors              in out nocopy t_errors );

--==============================================================================
-- Inserts the specified component into the meta data of the application.
--
-- Note: Before this procedure can be used, populate_component_type has to be
--       called for the passed component type.
--==============================================================================
procedure insert_component (
    p_cursor          in            integer,
    p_application_id  in            number,
    p_page_id         in            number,
    p_type_id         in            t_component_type_id,
    p_id              in            t_component_id,
    p_parent_id       in            t_component_id,
    p_grid_properties in            t_property_ids,
    p_property_values in            t_changed_property_values,
    p_errors          in out nocopy t_errors );
--
--==============================================================================
-- reset global variables and free unused memory
--==============================================================================
procedure reset_package_state;

--==============================================================================
-- Returns a text/breadcrumb hierachical representation of the component.
-- Passing TRUE for p_include_app will include the Application ID and name
-- in the hierarchy.
--==============================================================================
function get_hierarchy_path (
    p_cursor         in integer,
    p_application_id in number,
    p_type_id        in t_component_type_id,
    p_id             in t_component_id,
    p_include_app    in boolean )
    return varchar2;

--==============================================================================
-- Evaluates the condition of a depending on
--==============================================================================
function is_depending_on_valid(
    p_depending_on_value    in varchar2,
    p_condition_type        in t_condition_type,
    p_expression            in varchar2,
    p_depending_on_id       in number,
    p_property_id           in t_property_id default null )
    return boolean;

end wwv_meta_meta_data;
/
show errors

set define '^'
