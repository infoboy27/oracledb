set define '^' verify off
prompt ...wwv_flow_meta_data
create or replace package wwv_flow_meta_data as
--------------------------------------------------------------------------------
--
--  Copyright (c) 1999, 2024, Oracle and/or its affiliates.
--
--    DESCRIPTION
--      Fetch meta data for flow rendering
--
--    NOTES
--      Information required to render and process page information is queried from
--      tables using this package.  Template information is queried using the
--      wwv_flow_templates_util package.

--    SECURITY
--      only executable by flows engine
--
--    SECURITY
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED  (MM/DD/YYYY)
--      mhichwa  11/13/1999 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- t_item_properties and utility subtypes
--
-- for protection_level, we can not use the type t_checksum_protection_level and
-- it's constants in wwv_flow_security. doing so causes PLS-00707 [2603, 2604]
-- because of cross package dependency problems for default values.
--==============================================================================
subtype t_item_scope is varchar2(7);
c_page_item_scope    constant t_item_scope := 'PAGE';    -- page item
c_app_item_scope     constant t_item_scope := 'APP';     -- app-local app item
c_global_item_scope  constant t_item_scope := 'GLOBAL';  -- global app item
c_report_scope       constant t_item_scope := 'REPORT';  -- report metadata pseudo-item
c_process_scope      constant t_item_scope := 'PROCESS'; -- process metadata pseudo-item
c_theme_scope        constant t_item_scope := 'THEME';   -- theme metadata pseudo-item
type t_item_properties is record (
    id                    number,
    security_group_id     number,
    scope                 t_item_scope,
    name                  varchar2(255),
    prompt                varchar2(4000),
    data_type             wwv_flow_exec_api.t_data_type,
    restricted_characters varchar2(20),
    is_persistent         varchar2(1),
    is_encrypted          boolean,
    escape_on_http_input  boolean,
    protection_level      pls_integer not null default 0,
    multi_value_type      wwv_flow_exec_api.t_multi_value_type,
    multi_value_separator varchar2(10) );
type t_item_properties_tbl is table of t_item_properties index by pls_integer;
--==============================================================================
-- t_flows: wwv_flows rowtype
--==============================================================================
subtype t_flows is wwv_flows%rowtype;

--==============================================================================
-- package globals
--==============================================================================
g_first_navigable_js_code      varchar2(4000);
g_build_options_included       varchar2(32767);
g_build_options_excluded       varchar2(32767);

g_on_max_idle_timeout_url      wwv_flows.on_max_idle_timeout_url%type;
g_on_max_session_timeout_url   wwv_flows.on_max_session_timeout_url%type;

g_csv_encoding                 wwv_flows.csv_encoding%type;
g_flow_language_derived_from   wwv_flows.flow_language_derived_from%type;
g_tokenize_row_search          boolean;
g_pass_ecid                    boolean;
g_task_vacation_rule_proc      wwv_flows.task_vacation_rule_procedure%type;
g_otel_product_family          wwv_flows.otel_product_family%type;
g_accessible_read_only         boolean;
g_direction_rtl                varchar2(1); -- Flows table indicator whether page is rendered right-to-left

-- Specifies the main application ID from which this application was copied from, if the app is a working copy
-- Otherwise, it will return the current application ID.
g_main_app_id                  number;

--==============================================================================
-- page information
--==============================================================================
g_page_cache_mode              wwv_flow_steps.cache_mode%type;-- page cache mode
g_page_cache_timeout_seconds   wwv_flow_steps.cache_timeout_seconds%type;
g_page_cache_when_cond_type    wwv_flow_steps.cache_when_condition_type%type;
g_page_cache_when_cond_e1      wwv_flow_steps.cache_when_condition_e1%type;
g_page_cache_when_cond_e2      wwv_flow_steps.cache_when_condition_e2%type;
g_read_only_when_type          varchar2(32767);
g_read_only_when               varchar2(32767);
g_read_only_when2              varchar2(32767);
g_is_page_pattern              boolean;

--==============================================================================
-- shortcuts
--==============================================================================
g_shortcut_name                wwv_flow_global.vc_arr2;
g_shortcut_id                  wwv_flow_global.n_arr;

--==============================================================================
-- buttons
--==============================================================================
type t_button is record (
    id                         wwv_flow_step_buttons.id%type                      ,
    page_id                    wwv_flow_step_buttons.flow_step_id%type            ,
    button_name                wwv_flow_step_buttons.button_name%type             ,
    button_plug_id             wwv_flow_step_buttons.button_plug_id%type          ,
    button_position            wwv_flow_step_buttons.button_position%type         ,
    button_template_id         wwv_flow_step_buttons.button_template_id%type      ,
    button_template_options    wwv_flow_step_buttons.button_template_options%type ,
    button_is_hot              wwv_flow_step_buttons.button_is_hot%type           ,
    button_label               wwv_flow_step_buttons.button_image_alt%type        ,
    button_sequence            wwv_flow_step_buttons.button_sequence%type         ,
    button_alignment           wwv_flow_step_buttons.button_alignment%type        ,
    button_css_classes         wwv_flow_step_buttons.button_css_classes%type      ,
    icon_css_classes           wwv_flow_step_buttons.icon_css_classes%type        ,
    button_redirect_url        wwv_flow_step_buttons.button_redirect_url%type     ,
    button_action              wwv_flow_step_buttons.button_action%type           ,
    database_action            wwv_flow_step_buttons.database_action%type         ,
    button_execute_validations wwv_flow_step_buttons.button_execute_validations%type,
    warn_on_unsaved_changes    wwv_flow_step_buttons.warn_on_unsaved_changes%type ,
    show_processing            boolean                                            ,
    confirm_enabled            boolean                                            ,
    confirm_message            wwv_flow_step_buttons.confirm_message%type         ,
    confirm_style              wwv_flow_step_buttons.confirm_style%type           ,
    button_condition           wwv_flow_step_buttons.button_condition%type        ,
    button_condition2          wwv_flow_step_buttons.button_condition2%type       ,
    button_condition_type      wwv_flow_step_buttons.button_condition_type%type   ,
    button_cattributes         wwv_flow_step_buttons.button_cattributes%type      ,
    security_scheme            wwv_flow_step_buttons.security_scheme%type         ,
    button_static_id           wwv_flow_step_buttons.button_static_id%type        ,
    request_source             wwv_flow_step_buttons.request_source%type          ,
    request_source_type        wwv_flow_step_buttons.request_source_type%type     ,
    pre_element_text           wwv_flow_step_buttons.pre_element_text%type        ,
    post_element_text          wwv_flow_step_buttons.post_element_text%type       ,
    grid_column_attributes     wwv_flow_step_buttons.grid_column_attributes%type  ,
    grid_new_grid              wwv_flow_step_buttons.grid_new_grid%type           ,
    grid_new_row               wwv_flow_step_buttons.grid_new_row%type            ,
    grid_row_css_classes       wwv_flow_step_buttons.grid_row_css_classes%type    ,
    grid_new_column            wwv_flow_step_buttons.grid_new_column%type         ,
    grid_column_span           wwv_flow_step_buttons.grid_column_span%type        ,
    grid_row_span              wwv_flow_step_buttons.grid_row_span%type           ,
    grid_column                wwv_flow_step_buttons.grid_column%type             ,
    grid_column_css_classes    wwv_flow_step_buttons.grid_column_css_classes%type ,
    --
    -- attributes that are not directly set via base table fields
    --
    is_ok_to_display           boolean,                   -- result of conditional display computation
    request_name               varchar2(32767),           -- submit request name
    was_rendered               boolean );                 -- see #32051430
                                                          -- flag to be set to true after the button was rendered
                                                          -- used to keep track of cloned buttons (in position TOP_AND_BOTTOM)
type t_buttons is table of t_button index by pls_integer;
g_buttons                      t_buttons;
g_default_button_position      varchar2(30);

--==============================================================================
-- Navigation Bar
--==============================================================================
g_icon_id                    wwv_flow_global.n_arr;       -- pk of nav bar icon
g_icon_image                 wwv_flow_global.vc_arr2;     -- name of image
g_icon_subtext               wwv_flow_global.vc_arr2;     -- entry label
g_icon_is_feedback           wwv_flow_global.n_arr;       -- 1 = is feedback, 0 = not feedback
g_icon_target                wwv_flow_global.vc_arr2;     --
g_icon_image_alt             wwv_flow_global.vc_arr2;     --
g_icon_height                wwv_flow_global.vc_arr2;     --
g_icon_width                 wwv_flow_global.vc_arr2;     --
g_icon_free_text             wwv_flow_global.vc_arr2;     --
g_icon_bar_disp_cond         wwv_flow_global.vc_arr2;     --
g_icon_bar_disp_cond_type    wwv_flow_global.vc_arr2;     --
g_icon_bar_flow_cond_instr   wwv_flow_global.vc_arr2;     --
g_icon_begins_on_new_line    wwv_flow_global.vc_arr2;     --
g_icon_colspan               wwv_flow_global.vc_arr2;     --
g_icon_onclick               wwv_flow_global.vc_arr2;     --
g_icon_security_scheme       wwv_flow_global.vc_arr2;     --

--==============================================================================
-- tab and parent tab info
--==============================================================================
g_tab_id                     wwv_flow_global.n_arr;       -- std tab: pk
g_tab_set                    wwv_flow_global.vc_arr2;     -- std tab: name of tab "collection"
g_tab_step                   wwv_flow_global.vc_arr2;     -- std tab: page
g_tab_name                   wwv_flow_global.vc_arr2;     -- std tab: name of tab, not the display text
g_tab_image                  wwv_flow_global.vc_arr2;     -- std tab: optional image name
g_tab_non_current_image      wwv_flow_global.vc_arr2;     -- std tab: optional image name
g_tab_image_attributes       wwv_flow_global.vc_arr2;     -- std tab: attributes for images
g_tab_text                   wwv_flow_global.vc_arr2;     -- std tab: display text of tab
g_tab_target                 wwv_flow_global.vc_arr2;     --
g_tab_parent_id              wwv_flow_global.n_arr;       -- parent tab pk
g_tab_parent_tabset          wwv_flow_global.vc_arr2;     -- parent tab tabset
g_tab_parent_display_cond    wwv_flow_global.vc_arr2;     -- parent tab display condition
g_tab_parent_display_cond2   wwv_flow_global.vc_arr2;     -- parent tab display condition2
g_tab_parent_display_cond_ty wwv_flow_global.vc_arr2;     -- parent tab display condition type
g_tab_parent_security_scheme wwv_flow_global.vc_arr2;     -- parent tab security scheme
g_tab_current_on_tabset      wwv_flow_global.vc_arr2;     -- parent tab current for this standard tab set
g_tab_also_current_for_pages wwv_flow_global.vc_arr2;     -- std tab: also current for comma delimited page list
g_tab_plsql_condition        wwv_flow_global.vc_arr2;     --
g_tab_plsql_condition_type   wwv_flow_global.vc_arr2;     --
g_tab_disp_cond_text         wwv_flow_global.vc_arr2;     --
g_tab_security_scheme        wwv_flow_global.vc_arr2;     -- sec scheme
g_last_tab_pressed           varchar2(32767);             -- when branching to a tab, this global is set
g_current_parent_tab_text    varchar2(32767);             -- text of the current parent tab set

--==============================================================================
-- page template info
--==============================================================================
g_page_tmpl_id               number;
g_current_page_template      varchar2(32767);
g_current_tab                varchar2(32767);               --
g_current_tab_font_attr      varchar2(32767);               --
g_non_current_tab            varchar2(32767);               --
g_non_current_tab_font_attr  varchar2(32767);               --
g_current_image_tab          varchar2(32767);               --
g_non_current_image_tab      varchar2(32767);               --
g_top_current_tab            varchar2(32767);               --
g_top_current_tab_font_attr  varchar2(32767);               --
g_top_non_curr_tab           varchar2(32767);               --
g_top_non_curr_tab_font_attr varchar2(32767);               --
g_header_template            varchar2(32767);               -- page template header
g_box                        varchar2(32767);               -- page template body
g_footer_template            varchar2(32767);               -- page template footer
g_page_tmpl_def_templ_opt    varchar2(32767);               -- page template default template options
g_footer_len                 pls_integer;                   --
g_footer_end                 varchar2(32767);               --
g_end_tag_printed            boolean         default true;  -- used to position edit links
g_template_navigation_bar    varchar2(32767);               --
g_template_navbar_entry      varchar2(32767);               -- defines a navigation bar occurance
g_template_success_message   varchar2(32767);               -- success message page sub template
g_body_title                 varchar2(32767);               --
g_notification_message       varchar2(32767);               -- notification message page sub template
g_error_page_template        varchar2(32767);               -- error page template
g_mobile_mode                boolean         default false; -- render page in mobile mode when using mobile page template

g_heading_bgcolor            varchar2(32767);               -- obsolete ?
g_table_bgcolor              varchar2(32767);               -- obsolete ?
g_table_cattributes          varchar2(32767);               -- obsolete ?
g_region_table_cattributes   varchar2(32767);               -- obsolete ?
g_font_size                  varchar2(32767);               -- obsolete ?
g_font_face                  varchar2(32767);               -- obsolete ?
g_page_tmpl_dialog_css       varchar2(32767);
g_page_tmpl_css_file_urls    varchar2(32767);
g_page_tmpl_inline_css       varchar2(32767);
g_page_tmpl_js_file_urls     varchar2(32767);
g_page_tmpl_js_code          varchar2(32767);
g_page_tmpl_js_code_onload   varchar2(32767);
g_page_tmpl_is_popup         boolean         default false;

--==============================================================================
-- item info
--==============================================================================
type t_item is record (
    id                            wwv_flow_step_items.id%type                       ,
    page_id                       wwv_flow_step_items.flow_step_id%type             ,
    name                          wwv_flow_step_items.name%type                     ,
    is_persistent                 wwv_flow_step_items.is_persistent%type            ,
    is_required                   wwv_flow_step_items.is_required%type              ,
    is_primary_key                wwv_flow_step_items.is_primary_key%type           ,
    is_query_only                 wwv_flow_step_items.is_query_only%type            ,
    item_source_plug_id           wwv_flow_step_items.item_source_plug_id%type      ,
    session_state_data_type       wwv_flow_session_state_api.t_data_type            ,
    source_data_type              wwv_flow_step_items.source_data_type%type         ,
    item_sequence                 wwv_flow_step_items.item_sequence%type            ,
    item_plug_id                  wwv_flow_step_items.item_plug_id%type             ,
    item_display_point            wwv_flow_step_items.item_display_point%type       ,
    item_default                  wwv_flow_step_items.item_default%type             ,
    item_default_type             wwv_flow_step_items.item_default_type%type        ,
    item_default_language         wwv_flow_step_items.item_default_language%type    ,
    prompt                        wwv_flow_step_items.prompt%type                   ,
    plain_label                   wwv_flow_step_items.prompt%type                   ,
    label_id                      varchar2( 261 )                                   , -- 261=length of name + _label
    placeholder                   wwv_flow_step_items.placeholder%type              ,
    template_id                   wwv_flow_field_templates.id%type                  ,
    before_item_text              wwv_flow_field_templates.before_item%type         ,
    after_item_text               wwv_flow_field_templates.after_item%type          ,
    before_element_text           wwv_flow_field_templates.before_element%type      ,
    after_element_text            wwv_flow_field_templates.after_element%type       ,
    help_template                 wwv_flow_field_templates.help_link%type           ,
    inline_help_template          wwv_flow_field_templates.inline_help_text%type    ,
    error_template                wwv_flow_field_templates.error_template%type      ,
    pre_element_text              wwv_flow_step_items.pre_element_text%type         ,
    post_element_text             wwv_flow_step_items.post_element_text%type        ,
    pre_element_template          wwv_flow_field_templates.item_pre_text%type       ,
    post_element_template         wwv_flow_field_templates.item_post_text%type      ,
    format_mask                   wwv_flow_step_items.format_mask%type              ,
    item_css_classes              wwv_flow_step_items.item_css_classes%type         ,
    item_icon_css_classes         wwv_flow_step_items.item_icon_css_classes%type    ,
    item_template_options         wwv_flow_step_items.item_template_options%type    ,
    default_template_options      wwv_flow_step_items.item_template_options%type    ,
    source                        wwv_flow_step_items.source%type                   ,
    source_type                   wwv_flow_step_items.source_type%type              ,
    source_language               wwv_flow_step_items.source_language%type          ,
    source_post_computation       wwv_flow_step_items.source_post_computation%type  ,
    display_as                    wwv_flow_step_items.display_as%type               ,
    lov_language                  wwv_flow_step_items.lov_language%type             ,
    named_lov                     wwv_flow_step_items.named_lov%type                ,
    lov                           wwv_flow_step_items.lov%type                      ,
    lov_display_extra             wwv_flow_step_items.lov_display_extra%type        ,
    lov_display_null              wwv_flow_step_items.lov_display_null%type         ,
    lov_null_text                 wwv_flow_step_items.lov_null_text%type            ,
    lov_null_value                wwv_flow_step_items.lov_null_value%type           ,
    lov_translated                wwv_flow_step_items.lov_translated%type           ,
    lov_cascade_parent_item       wwv_flow_step_items.lov_cascade_parent_items%type ,
    ajax_items_to_submit          wwv_flow_step_items.ajax_items_to_submit%type     ,
    ajax_optimize_refresh         wwv_flow_step_items.ajax_optimize_refresh%type    ,
    --
    csize                         wwv_flow_step_items.csize%type                    ,
    cmaxlength                    wwv_flow_step_items.cmaxlength%type               ,
    cHeight                       wwv_flow_step_items.cHeight%type                  ,
    cattributes                   wwv_flow_step_items.cattributes%type              ,
    cattributes_element           wwv_flow_step_items.cattributes_element%type      ,
    tag_css_classes               wwv_flow_step_items.tag_css_classes%type          ,
    tag_attributes                wwv_flow_step_items.tag_attributes%type           ,
    tag_attributes2               wwv_flow_step_items.tag_attributes2%type          ,
    --
    new_grid                      wwv_flow_step_items.new_grid%type                 ,
    begin_on_new_line             wwv_flow_step_items.begin_on_new_line%type        ,
    grid_row_css_classes          wwv_flow_step_items.grid_row_css_classes%type     ,
    begin_on_new_field            wwv_flow_step_items.begin_on_new_field%type       ,
    colspan                       wwv_flow_step_items.colspan%type                  ,
    rowspan                       wwv_flow_step_items.rowspan%type                  ,
    grid_column                   wwv_flow_step_items.grid_column%type              ,
    grid_label_column_span        wwv_flow_step_items.grid_label_column_span%type   ,
    grid_column_css_classes       wwv_flow_step_items.grid_column_css_classes%type  ,
    --
    label_alignment               wwv_flow_step_items.label_alignment%type          ,
    display_when                  wwv_flow_step_items.display_when%type             ,
    display_when2                 wwv_flow_step_items.display_when2%type            ,
    display_when_type             wwv_flow_step_items.display_when_type%type        ,
    --
    warn_on_unsaved_changes       wwv_flow_step_items.warn_on_unsaved_changes%type  ,
    use_cache_before_def          wwv_flow_step_items.use_cache_before_default%type ,
    field_alignment               wwv_flow_step_items.field_alignment%type          ,
    security_scheme               wwv_flow_step_items.security_scheme%type          ,
    read_only_when                wwv_flow_step_items.read_only_when%type           ,
    read_only_when2               wwv_flow_step_items.read_only_when2%type          ,
    read_only_when_type           wwv_flow_step_items.read_only_when_type%type      ,
    read_only_disp_attr           wwv_flow_step_items.read_only_disp_attr%type      ,
    escape_on_http_input          wwv_flow_step_items.escape_on_http_input%type     ,
    escape_on_http_output         wwv_flow_step_items.escape_on_http_output%type    ,
    encrypted                     wwv_flow_step_items.encrypt_session_state_yn%type ,
    quick_pick_yn                 wwv_flow_step_items.show_quick_picks%type         ,
    inline_help_text              wwv_flow_step_items.inline_help_text%type         ,
    inline_help_id                varchar2(270)                                     ,
    has_help_text                 boolean                                           ,
    plugin_init_javascript_code   wwv_flow_step_items.plugin_init_javascript_code%type,
    --
    attributes                    wwv_flow_step_items.attributes%type               ,
    --
    fc_collapsible                wwv_flow_step_items.fc_collapsible%type           ,
    fc_initial_collapsed          wwv_flow_step_items.fc_initial_collapsed%type     ,
    fc_compute_counts             wwv_flow_step_items.fc_compute_counts%type        ,
    fc_show_counts                wwv_flow_step_items.fc_show_counts%type           ,
    fc_zero_count_entries         wwv_flow_step_items.fc_zero_count_entries%type    ,
    fc_show_more_count            wwv_flow_step_items.fc_show_more_count%type       ,
    fc_filter_values              wwv_flow_step_items.fc_filter_values%type         ,
    fc_show_selected_first        wwv_flow_step_items.fc_show_selected_first%type   ,
    fc_max_height                 wwv_flow_step_items.fc_max_height%type            ,
    --
    ai_enabled                    boolean                                           ,
    ai_config_id                  wwv_flow_step_items.ai_config_id%type             ,
    ai_remote_server_id           wwv_flow_step_items.ai_remote_server_id%type      ,
    ai_system_prompt              wwv_flow_step_items.ai_system_prompt%type         ,
    ai_welcome_message            wwv_flow_step_items.ai_welcome_message%type       ,
    --
    is_ok_to_display              boolean,
    --
    multi_value_type              wwv_flow_exec_api.t_multi_value_type              ,
    multi_value_separator         wwv_flow_step_items.multi_value_separator%type );
type t_items is table of t_item index by pls_integer;

g_items                       t_items;
g_item_type_features          wwv_flow_global.vc_map; -- indexed by item type name

--==============================================================================
-- branch info
--==============================================================================
type t_branch is record (
    id                          wwv_flow_step_branches.id%type                          ,
    branch_name                 wwv_flow_step_branches.branch_name%type                 ,
    branch_action               wwv_flow_step_branches.branch_action%type               ,
    branch_point                wwv_flow_step_branches.branch_point%type                ,
    branch_type                 wwv_flow_step_branches.branch_type%type                 ,
    branch_language             wwv_flow_step_branches.branch_language%type             ,
    branch_condition            wwv_flow_step_branches.branch_condition%type            ,
    branch_condition_text       wwv_flow_step_branches.branch_condition_text%type       ,
    branch_condition_type       wwv_flow_step_branches.branch_condition_type%type       ,
    branch_when_button_id       wwv_flow_step_branches.branch_when_button_id%type       ,
    save_state_before_branch_yn wwv_flow_step_branches.save_state_before_branch_yn%type ,
    security_scheme             wwv_flow_step_branches.security_scheme%type );
type t_branches is table of t_branch index by pls_integer;

g_branches                    t_branches;
g_branch_page_mode            varchar2(10);

--==============================================================================
-- process info
--==============================================================================
type t_process is record (
    id                           wwv_flow_step_processing.id%type                      ,
    process_sequence             wwv_flow_step_processing.process_sequence%type        ,
    process_name                 wwv_flow_step_processing.process_name%type            ,
    process_sql                  varchar2(32767)                                       ,
    process_clob_language        wwv_flow_code_exec.t_language                         ,
    process_point                wwv_flow_step_processing.process_point%type           ,
    parent_process_id            wwv_flow_step_processing.parent_process_id%type       ,
    region_id                    wwv_flow_step_processing.region_id%type               ,
    process_type                 wwv_flow_step_processing.process_type%type            ,
    process_component_name       varchar2(30)                                          , -- APEX_APPLICATION_PROCESSES or APEX_APPLICATION_PAGE_PROCESS
    process_error_message        wwv_flow_step_processing.process_error_message%type   ,
    error_display_location       wwv_flow_step_processing.error_display_location%type  ,
    process_success_message      wwv_flow_step_processing.process_success_message%type ,
    process_when                 wwv_flow_step_processing.process_when%type            ,
    process_when_type            wwv_flow_step_processing.process_when_type%type       ,
    process_when2                wwv_flow_step_processing.process_when2%type           ,
    process_when_button_id       wwv_flow_step_processing.process_when_button_id%type  ,
    security_scheme              wwv_flow_step_processing.security_scheme%type         ,
    only_for_changed_rows        wwv_flow_step_processing.only_for_changed_rows%type   ,
    exec_cond_for_each_row       wwv_flow_step_processing.exec_cond_for_each_row%type  ,
    process_is_stateful_y_n      wwv_flow_step_processing.process_is_stateful_y_n%type ,
    item_name                    wwv_flow_step_processing.item_name%type               ,
    --
    location                     wwv_flow_step_processing.location%type,
    remote_server_id             wwv_flow_step_processing.remote_server_id%type,
    web_src_module_id            wwv_flow_step_processing.web_src_module_id%type,
    web_src_operation_id         wwv_flow_step_processing.web_src_operation_id%type,
    --
    attribute_01                 wwv_flow_step_processing.attribute_01%type            ,
    attribute_02                 wwv_flow_step_processing.attribute_02%type            ,
    attribute_03                 wwv_flow_step_processing.attribute_03%type            ,
    attribute_04                 wwv_flow_step_processing.attribute_04%type            ,
    attribute_05                 wwv_flow_step_processing.attribute_05%type            ,
    attribute_06                 wwv_flow_step_processing.attribute_06%type            ,
    attribute_07                 wwv_flow_step_processing.attribute_07%type            ,
    attribute_08                 wwv_flow_step_processing.attribute_08%type            ,
    attribute_09                 wwv_flow_step_processing.attribute_09%type            ,
    attribute_10                 wwv_flow_step_processing.attribute_10%type            ,
    attribute_11                 wwv_flow_step_processing.attribute_11%type            ,
    attribute_12                 wwv_flow_step_processing.attribute_12%type            ,
    attribute_13                 wwv_flow_step_processing.attribute_13%type            ,
    attribute_14                 wwv_flow_step_processing.attribute_14%type            ,
    attribute_15                 wwv_flow_step_processing.attribute_15%type );

type t_processes is table of t_process index by pls_integer;

g_processes                   t_processes;

--==============================================================================
-- Components (region, item, button)
--==============================================================================
subtype t_component_type_id is pls_integer range 1 .. 3;
c_component_item        constant t_component_type_id := 1;
c_component_button      constant t_component_type_id := 2;
c_component_region      constant t_component_type_id := 3;
type t_component is record (
    slot_placeholder     varchar2(32767)    ,
    placeholder_position pls_integer        ,
    display_sequence     number             ,
    component_id         number             ,
    type_id              t_component_type_id,
    idx                  pls_integer
);
type t_components is table of t_component index by pls_integer;

--==============================================================================
-- region (plug) info
--==============================================================================

type t_plug is record (
    id                             wwv_flow_page_plugs.id%type                             ,
    page_id                        wwv_flow_page_plugs.page_id%type                        ,
    plug_name                      wwv_flow_page_plugs.plug_name%type                      ,
    title                          wwv_flow_page_plugs.title%type                          ,
    parent_plug_id                 wwv_flow_page_plugs.parent_plug_id%type                 ,
    plug_display_point             wwv_flow_page_plugs.plug_display_point%type             ,
    master_region_id               wwv_flow_page_plugs.master_region_id%type               ,
    filtered_region_id             wwv_flow_page_plugs.filtered_region_id%type             ,
    master_region_static_id        varchar2(32767)                                         ,
    plug_template                  wwv_flow_page_plugs.plug_template%type                  ,
    plug_new_grid                  wwv_flow_page_plugs.plug_new_grid%type                  ,
    plug_new_grid_row              wwv_flow_page_plugs.plug_new_grid_row%type              ,
    plug_grid_row_css_classes      wwv_flow_page_plugs.plug_grid_row_css_classes%type      ,
    plug_new_grid_column           wwv_flow_page_plugs.plug_new_grid_column%type           ,
    plug_display_column            wwv_flow_page_plugs.plug_display_column%type            ,
    plug_grid_column_span          wwv_flow_page_plugs.plug_grid_column_span%type          ,
    plug_grid_column_css_classes   wwv_flow_page_plugs.plug_grid_column_css_classes%type   ,
    plug_display_sequence          wwv_flow_page_plugs.plug_display_sequence%type          ,
    plug_item_display_point        wwv_flow_page_plugs.plug_item_display_point%type        ,
    plug_source                    varchar2(32767)                                         ,
    plug_source_type               wwv_flow_page_plugs.plug_source_type%type               ,
    --
    plug_query_type                wwv_flow_page_plugs.query_type%type                     ,
    function_body_language         wwv_flow_page_plugs.function_body_language%type         ,
    --
    source_location                wwv_flow_page_plugs.location%type                       ,
    remote_server_id               wwv_flow_page_plugs.remote_server_id%type               ,
    web_source_module_id           wwv_flow_page_plugs.web_src_module_id%type              ,
    array_column_id                wwv_flow_page_plugs.array_column_id%type           ,
    use_local_sync_table           boolean                                                 ,
    document_source_id             wwv_flow_page_plugs.document_source_id%type               ,
    --
    query_owner                    wwv_flow_page_plugs.query_owner%type                    ,
    query_table                    wwv_flow_page_plugs.query_table%type                    ,
    query_where                    wwv_flow_page_plugs.query_where%type                    ,
    query_match                    wwv_flow_page_plugs.query_match%type                    ,
    query_columns                  wwv_flow_page_plugs.query_columns%type                  ,
    query_order_by_type            wwv_flow_page_plugs.query_order_by_type%type            ,
    query_order_by                 wwv_flow_page_plugs.query_order_by%type                 ,
    source_post_processing         wwv_flow_page_plugs.source_post_processing%type         ,
    include_rowid_column           wwv_flow_page_plugs.include_rowid_column%type           ,
    optimizer_hint                 wwv_flow_page_plugs.optimizer_hint%type                 ,
    --
    remote_sql_caching             wwv_flow_page_plugs.remote_sql_caching%type             ,
    remote_sql_invalidate_when     wwv_flow_page_plugs.remote_sql_invalidate_when%type     ,
    --
    external_filter_expr           wwv_flow_page_plugs.external_filter_expr%type           ,
    external_order_by_type         wwv_flow_page_plugs.external_order_by_type%type         ,
    external_order_by_expr         wwv_flow_page_plugs.external_order_by_expr%type         ,
    --
    template_component_type        wwv_flow_page_plugs.template_component_type%type        ,
    --
    is_editable                    boolean                                                 ,
    edit_operations                wwv_flow_page_plugs.edit_operations%type                ,
    edit_row_operations_column     wwv_flow_page_plugs.edit_row_operations_column%type     ,
    add_authorization_scheme       wwv_flow_page_plugs.add_authorization_scheme%type       ,
    update_authorization_scheme    wwv_flow_page_plugs.update_authorization_scheme%type    ,
    delete_authorization_scheme    wwv_flow_page_plugs.delete_authorization_scheme%type    ,
    lost_update_check_type         wwv_flow_page_plugs.lost_update_check_type%type         ,
    row_version_column             wwv_flow_page_plugs.row_version_column%type             ,
    add_row_if_empty               boolean                                                 ,
    --
    lazy_loading                   boolean                                                 ,
    --
    list_template_id               wwv_flow_page_plugs.list_template_id%type               ,
    list_id                        wwv_flow_page_plugs.list_id%type                        ,
    menu_id                        wwv_flow_page_plugs.menu_id%type                        ,
    --
    plug_header                    wwv_flow_page_plugs.plug_header%type                    ,
    plug_footer                    wwv_flow_page_plugs.plug_footer%type                    ,
    --
    include_in_reg_disp_sel_yn     wwv_flow_page_plugs.include_in_reg_disp_sel_yn%type     ,
    --
    plug_required_role             wwv_flow_page_plugs.plug_required_role%type             ,
    plug_display_when_condition    wwv_flow_page_plugs.plug_display_when_condition%type    ,
    plug_display_when_cond2        wwv_flow_page_plugs.plug_display_when_cond2%type        ,
    plug_display_condition_type    wwv_flow_page_plugs.plug_display_condition_type%type    ,
    plug_column_width              wwv_flow_page_plugs.plug_column_width%type              ,
    plug_customized                wwv_flow_page_plugs.plug_customized%type                ,
    plug_query_no_data_found       wwv_flow_page_plugs.plug_query_no_data_found%type       ,
    no_data_found_icon_classes     wwv_flow_page_plugs.no_data_found_icon_classes%type     ,
    plug_query_more_data           wwv_flow_page_plugs.plug_query_more_data%type           ,
    plug_query_parse_override      wwv_flow_page_plugs.plug_query_parse_override%type      ,
    plug_query_num_rows            wwv_flow_page_plugs.plug_query_num_rows%type            ,
    plug_query_num_rows_item       wwv_flow_page_plugs.plug_query_num_rows_item%type       ,
    plug_query_headings_type       wwv_flow_page_plugs.plug_query_headings_type%type       ,
    plug_query_headings            wwv_flow_page_plugs.plug_query_headings%type            ,
    --
    plug_query_num_rows_type       wwv_flow_page_plugs.plug_query_num_rows_type%type       ,
    show_total_row_count           boolean                                                 ,
    --
    ajax_items_to_submit           wwv_flow_page_plugs.ajax_items_to_submit%type           ,
    escape_on_http_output          wwv_flow_page_plugs.escape_on_http_output%type          ,
    plug_caching                   wwv_flow_page_plugs.plug_caching%type                   ,
    plug_cache_when                wwv_flow_page_plugs.plug_cache_when%type                ,
    plug_cache_expression1         wwv_flow_page_plugs.plug_cache_expression1%type         ,
    plug_cache_expression2         wwv_flow_page_plugs.plug_cache_expression2%type         ,
    plug_cache_depends_on_items    wwv_flow_page_plugs.plug_cache_depends_on_items%type    ,
    plug_static_id                 varchar2(32767)                                         ,
    region_css_classes             wwv_flow_page_plugs.region_css_classes%type             ,
    icon_css_classes               wwv_flow_page_plugs.icon_css_classes%type               ,
    region_sub_css_classes         wwv_flow_page_plugs.region_sub_css_classes%type         ,
    region_template_options        wwv_flow_page_plugs.region_template_options%type        ,
    component_template_options     wwv_flow_page_plugs.component_template_options%type     ,
    region_attributes_substitution wwv_flow_page_plugs.region_attributes_substitution%type ,
    region_image                   wwv_flow_page_plugs.region_image%type                   ,
    region_image_attr              wwv_flow_page_plugs.region_image_attr%type              ,
    region_image_alt_text          wwv_flow_page_plugs.region_image_alt_text%type          ,
    plug_read_only_when_type       wwv_flow_page_plugs.plug_read_only_when_type%type       ,
    plug_read_only_when            wwv_flow_page_plugs.plug_read_only_when%type            ,
    plug_read_only_when2           wwv_flow_page_plugs.plug_read_only_when2%type           ,
    --
    plugin_init_javascript_code    wwv_flow_page_plugs.plugin_init_javascript_code%type    ,
    --
    landmark_type                  wwv_flow_page_plugs.landmark_type%type                  ,
    landmark_label                 wwv_flow_page_plugs.landmark_label%type                 ,
    --
    ai_enabled                     boolean                                                 ,
    ai_config_id                   wwv_flow_page_plugs.ai_config_id%type                   ,
    ai_remote_server_id            wwv_flow_page_plugs.ai_remote_server_id%type            ,
    ai_system_prompt               wwv_flow_page_plugs.ai_system_prompt%type               ,
    ai_welcome_message             wwv_flow_page_plugs.ai_welcome_message%type             ,
    --
    row_selection_type             wwv_flow_page_plugs.row_selection_type%type             ,
    current_selection_page_item    wwv_flow_page_plugs.current_selection_page_item%type    ,
    select_all_page_item           wwv_flow_page_plugs.select_all_page_item%type           ,
    --
    entity_title_singular          wwv_flow_page_plugs.entity_title_singular%type          ,
    entity_title_plural            wwv_flow_page_plugs.entity_title_plural%type            ,
    --
    region_template_css_file_urls  wwv_flow_page_plug_templates.css_file_urls%type         ,
    region_template_inline_css     wwv_flow_list_templates.inline_css%type                 ,
    --
    attributes                     wwv_flow_page_plugs.attributes%type                     ,
    --
    -- attributes that are not directly set via base table fields, but
    -- populated some time during page processing
    --
    query_order_by_item            varchar2(255)                                           ,
    external_order_by_item         varchar2(255)                                           ,
    external_search_item           varchar2(255)                                           ,
    --
    is_read_only                   boolean                                                 , -- result of read only computation
    is_ok_to_display               boolean                                                 , -- result of conditional display computation
    save_in_cache                  boolean                                                 , -- should the render result be saved in the cache?
    protected_items_in_region      pls_integer                                             , -- number of protected items that have been rendered in this region
    idx                            pls_integer                                             , -- index in g_plugs
    parent_idx                     pls_integer                                             , -- index of parent region in g_plugs
    --
    components                     t_components );
type t_plugs is table of t_plug index by pls_integer;

g_plugs                       t_plugs;
g_page_components             t_components;
g_plug_position               varchar2(32767);

--==============================================================================
-- computation info
--==============================================================================
type t_computation is record (
    id                          wwv_flow_step_computations.id%type                    ,
    computation_sequence        wwv_flow_step_computations.computation_sequence%type  ,
    computation_item            wwv_flow_step_computations.computation_item%type      ,
    computation_point           wwv_flow_step_computations.computation_point%type     ,
    computation_type            wwv_flow_step_computations.computation_type%type      ,
    computation_language        wwv_flow_step_computations.computation_language%type  ,
    computation_component_type  varchar2(30)                                          ,
    computation_processed       wwv_flow_step_computations.computation_processed%type ,
    computation                 wwv_flow_step_computations.computation%type           ,
    compute_when                wwv_flow_step_computations.compute_when%type          ,
    compute_when_text           wwv_flow_step_computations.compute_when_text%type     ,
    compute_when_type           wwv_flow_step_computations.compute_when_type%type     ,
    security_scheme             wwv_flow_step_computations.security_scheme%type );
type t_computations is table of t_computation index by pls_integer;

g_computations                t_computations;

--==============================================================================
-- What to do when an item lookup fails?
--==============================================================================
subtype t_item_not_found_action is pls_integer range 0..2;
c_not_found_raise     constant t_item_not_found_action := 0;
c_not_found_log_error constant t_item_not_found_action := 1;
c_not_found_log_trace constant t_item_not_found_action := 2;
-----------------
-- Fetch Counters
--
g_flowCnt                      pls_integer := 0;      -- flow info found, 1 = yes, 0 = no
g_iconbarCnt                   pls_integer := 0;      -- nav bar icon count
g_tabCnt                       pls_integer := 0;      -- standard tab count
g_branchCnt                    pls_integer;           -- branch count
g_computationCnt               pls_integer;           -- computations count
g_list_mgr_cnt                 pls_integer := 0;      --

--==============================================================================
-- flow level fetch
--==============================================================================
function  fetch_flow_info (
    p_absolute_url      in boolean  default false )
    return number;
--==============================================================================
function  fetch_icon_bar_info
    return number;

--==============================================================================
function  fetch_flow_record (
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id,
    p_application_id    in number )
    return t_flows;

--==============================================================================
-- page level fetch
-- raises APEX.PAGE.NOT_FOUND if page can not be found
--==============================================================================
procedure  fetch_step_info;

--==============================================================================
function  fetch_tab_info
    return number;
--==============================================================================
function  fetch_toplevel_tab_info (p_tabset in varchar2)
    return number;

--==============================================================================
function fetch_branch_info
    return number;

--==============================================================================
procedure fetch_process_info (
    p_in_accept         in boolean,
    p_parent_process_id in number default null );

--==============================================================================
function fetch_g_build_options_included
    return varchar2;
--==============================================================================
function fetch_g_build_options_excluded
    return varchar2;
--==============================================================================
function  fetch_computations
    return number;

--==============================================================================
procedure fetch_item_type_settings;

--==============================================================================
-- Fetch item info only. Normally, we fetch item data as part of the
-- fetch_page_plugs call. However, in ACCEPT, we do not need region info, so
-- this gets called instead.
--
-- ARGUMENTS
-- * p_register_in_parent: True if item initialization happens as part of region
--   initialization (i.e. from fetch_page_plugs). False if initialization
--   happens without initializing other page components (in wwv_flow.accept,
--   where e.g. regions are irrelevant).
--==============================================================================
procedure fetch_item_info (
    p_register_in_parent in boolean );

--==============================================================================
-- fetch regions and optionally also items and buttons into the wwv_flow.g_NNN
-- tables.
--
-- ARGUMENTS
-- * p_include_subcomponents if true (wwv_flow.show), also fetch items and buttons
--==============================================================================
procedure  fetch_page_plugs (
    p_include_subcomponents in boolean,
    p_plug_id                in number default null );

--==============================================================================
-- for a region, item or button, get it's index in the wwv_flow.g_NNN tables
-- (e.g. g_plugs).
--==============================================================================
function get_component_index (
    p_type_id      in t_component_type_id,
    p_component_id in number )
    return pls_integer;

--==============================================================================
-- return item properties
--
-- t_item_properties.id is the ID of the ITEM (p_name) or 0 for items that begin
-- with IR and are not an existing item name or -1 if the item is contained in
-- the component value array
--
-- ARGUMENTS
-- * p_name:           The item name.
-- * p_application_id: The application.
-- * p_security_group_id: The workspace.
-- * p_when_not_found: Defines what happens when the item was not found.
--                     - c_not_found_raise (the default): Raise internal
--                       error.
--                     - c_not_found_log_error: Log at error level.
--                     - c_not_found_ignore: Log at trace level, only when
--                       debug is enabled.
--==============================================================================
function find_item_by_name (
    p_name                  in  varchar2,
    p_application_id        in  number default wwv_flow_security.g_flow_id,
    p_security_group_id     in  number default wwv_flow_security.g_curr_flow_security_group_id,
    p_when_not_found        in  t_item_not_found_action default c_not_found_raise )
    return t_item_properties;

--==============================================================================
-- return item properties
--
-- t_item_properties.id is the ID of the ITEM (p_name) or 0 for items that begin
-- with IR and are not an existing item name or -1 if the item is contained in
-- the component value array
--
--==============================================================================
function find_item_by_id (
    p_id in number,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return t_item_properties;

--==============================================================================
-- replace application-level substitution variables in p_str
--==============================================================================
procedure do_static_substitutions (
    p_str in out nocopy varchar2 );
--
--==============================================================================
-- look up application-level substitution variable p_name. if found, return true
-- and the variable's value in p_value
--==============================================================================
function find_static_substitution (
    p_name  in varchar2,
    p_value in out nocopy varchar2 )
    return boolean;

--==============================================================================
-- Return the names of non-persistent primary key items on the page.
--==============================================================================
function get_nonpersistent_pk_items
    return wwv_flow_t_varchar2;

--==============================================================================
-- Returns if a slot is used based on page template id and slot placeholder.
--==============================================================================
function is_page_template_slot_used (
    p_page_template_id in number,
    p_slot_placeholder in varchar2 )
    return boolean;

--==============================================================================
-- Returns if a slot is used based on region id and slot placeholder.
--==============================================================================
function is_region_slot_used (
    p_region_id        in number,
    p_slot_placeholder in varchar2 )
    return boolean;

--==============================================================================
-- Returns if any slot is used for a region plugin based on region id.
--==============================================================================
function is_any_region_plugin_slot_used (
    p_region_id in number )
    return boolean;

--==============================================================================
-- returns the "Order By Item Name"
--==============================================================================
function get_orderby_item_name(
    p_order_by_expression in varchar2 )
    return varchar2;

--==============================================================================
-- Resets internal caches
--==============================================================================
procedure reset;

--==============================================================================
function get_data_type_from_string (
    p_data_type in varchar2 )
    return wwv_flow_exec_api.t_data_type;

--==============================================================================
-- Returns the format mask for an item identified by p_item
--==============================================================================
function get_format_mask (
    p_item          in varchar2,
    p_for_boolean   in boolean default false )
    return varchar2;

end wwv_flow_meta_data;
/
show errors
