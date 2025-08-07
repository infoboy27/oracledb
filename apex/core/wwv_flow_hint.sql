set define '^' verify off
prompt ...wwv_flow_hint
create or replace package wwv_flow_hint as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2003, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_hint.sql
--
--    DESCRIPTION
--      This package is used to interact with the following tables:
--          wwv_flow_hnt_table_info
--          wwv_flow_hnt_column_info
--          wwv_flow_hnt_column_dict
--          wwv_flow_hnt_col_dict_syn
--      This package can be used to better create meaningful forms and reports and other flows contructs.
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED (MM/DD/YYYY)
--     cbcho    04/02/2003 - created
--
--------------------------------------------------------------------------------

procedure set_calling_version(
    p_version in number );

--==============================================================================
-- Used in get_table_ui_defaults and get_col_ui_defaults

    g_form_region_title    varchar2(255)  := null;
    g_report_region_title  varchar2(255)  := null;

    g_group_id             number         := null;
    g_group_seq            number         := null;
    g_group_name           varchar2(255)  := null;

    g_column_id            number         := null;
    g_label                varchar2(255)  := null;
    g_help_text            varchar2(4000) := null;
    g_mask_form            varchar2(255)  := null;
    g_display_seq_form     number         := null;
    g_display_in_form      varchar2(1)    := null;
    g_display_as_form      varchar2(50)   := null;
    g_form_attributes      clob           := null;
    g_display_as_tab_form  varchar2(255)  := null;
    g_display_seq_report   number         := null;
    g_display_in_report    varchar2(1)    := null;
    g_display_as_report    varchar2(255)  := null;
    g_mask_report          varchar2(255)  := null;
    g_aggregate_by         varchar2(1)    := null;
    g_lov_query            varchar2(4000) := null;
    g_default_value        varchar2(255)  := null;
    g_required             varchar2(1)    := null;
    g_alignment            varchar2(1)    := null;
    g_display_width        number         := null;
    g_max_width            number         := null;
    g_height               number         := null;
    g_group_by             varchar2(1)    := null;
    g_searchable           varchar2(1)    := null;
    g_lov_type             varchar2(1)    := null;
    --
    g_form_format_mask     varchar2(255)  := null;
    g_form_display_width   number         := null;
    g_form_display_height  number         := null;
    g_form_data_type       varchar2(30)   := null;
    g_report_format_mask   varchar2(4000) := null;
    g_report_col_alignment varchar2(10)    := null;

-- Setting the following global to true makes all the functions and procedures pull
--   the UI Default values.  If the global is set to false (the user running the wizard
--   decided to override and not use UI Defaults), null is returned for the values.

    g_use_ui_defaults      boolean        := true;

-- The following global is used in check_schema_privs to ensure that, on import,
--    the user has privilege on the schema they are importing.

    g_schema               wwv_flows.owner%type;

-- The following global is used in wwv_flow_imp_parser.get_attr_dict_workspace to show,
--    on import, the name of the exporting workspace.

    g_exp_workspace        varchar2(255)   := null;

procedure check_schema_privs (
    p_schema     in varchar2 default g_schema,
    p_table_name in varchar2 default null );

function table_hint_exists (
    p_schema      in varchar2,
    p_table_name  in varchar2 )
    return boolean;

function column_hint_exists (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return boolean;

-- sbk, 06/11/04: This column is no longer used but function left in for now
function get_region_title (
    p_schema      in varchar2,
    p_table_name  in varchar2 )
    return varchar2;

function get_report_region_title (
    p_schema      in varchar2,
    p_table_name  in varchar2 )
    return varchar2;

function get_form_region_title (
    p_schema      in varchar2,
    p_table_name  in varchar2 )
    return varchar2;

function get_item_help (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return varchar2;

function get_report_mask (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return varchar2;

function get_form_mask (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return varchar2;

function get_alignment (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return varchar2;

function get_searchable (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return varchar2;

function get_required (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return varchar2;

function get_label (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2
    ) return varchar2;

function get_display_in_report (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return varchar2;

function get_display_seq_report (
    p_schema      in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return number;

function get_group_by (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return varchar2;

-- sbk, 06/11/04 - column not used for 1.5 or 1.6
function get_order_by_seq (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return number;

-- sbk, 06/11/04 - column not used for 1.5 or 1.6
function get_order_by_asc_desc (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return number;

function get_display_in_form (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return varchar2;

function get_display_seq_form (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2
    ) return number;

function get_display_as_form (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return varchar2;

function get_lov_query (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return varchar2;

procedure get_lov (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2,
    p_lov_type     out varchar2,
    p_lov_query    out varchar2,
    p_column_id    out number );

function get_static_lov_string (
    p_column_id   in number )
    return varchar2;

function get_default_value (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return varchar2;

function get_display_width (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return number;

function get_max_width (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return number;

function get_height (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return number;

function get_display_as_tab_form (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return varchar2;

function get_display_as_report (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return varchar2;

function get_aggregate_by (
    p_schema       in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2 )
    return varchar2;


procedure create_table_hint (
    p_table_id             in number   default null,
    p_schema               in varchar2 default null,
    p_table_name           in varchar2 default null,
    p_form_region_title    in varchar2 default null,
    p_report_region_title  in varchar2 default null,
    p_description          in varchar2 default null );

procedure create_group (
    p_group_id             in number   default null,
    p_table_id             in number   default null,
    p_group_name           in varchar2 default null,
    p_description          in varchar2 default null,
    p_display_sequence     in number   default null );

procedure create_column_hint (
    p_column_id           in number   default null,
    p_table_id            in number   default null,
    p_column_name         in varchar2 default null,
    p_group_id            in number   default null,
    p_label               in varchar2 default null,
    p_help_text           in varchar2 default null,
    p_mask_form           in varchar2 default null,
    p_display_seq_form    in number   default null,
    p_display_in_form     in varchar2 default null,
    p_display_as_form     in varchar2 default null,
    p_attributes          in clob     default null,
    p_display_as_tab_form in varchar2 default null,
    p_display_seq_report  in number   default null,
    p_display_in_report   in varchar2 default null,
    p_display_as_report   in varchar2 default null,
    p_mask_report         in varchar2 default null,
    p_aggregate_by        in varchar2 default null,
    p_lov_query           in varchar2 default null,
    p_default_value       in varchar2 default null,
    p_required            in varchar2 default null,
    p_alignment           in varchar2 default null,
    p_display_width       in number   default null,
    p_max_width           in number   default null,
    p_height              in number   default null,
    p_group_by            in varchar2 default null,
    p_order_by_seq        in number   default null,
    p_order_by_asc_desc   in varchar2 default null,
    p_searchable          in varchar2 default null );

procedure create_lov_data (
    p_id                 in number      default null,
    p_column_id          in number      default null,
    p_lov_disp_sequence  in number      default null,
    p_lov_disp_value     in varchar2    default null,
    p_lov_return_value   in varchar2    default null );

procedure remove_table_hint (
    p_table_id    in number   default null );

procedure remove_hint (
    p_schema          in varchar2 default null,
    p_table_name      in varchar2 default null );

procedure synch_hints (
    p_schema          in varchar2 default null,
    p_table_name      in varchar2 default null );

function gen_lov_name (
    p_owner        in varchar2,
    p_table_name   in varchar2,
    p_column_name  in varchar2,
    p_sgid         in number,
    p_app_number   in number,
    p_page_number  in number )
    return varchar2;


procedure get_table_ui_defaults (
    p_schema               in  varchar2,
    p_table_name           in  varchar2 );

procedure get_col_ui_defaults (
    p_schema              in  varchar2,
    p_table_name          in  varchar2,
    p_column_name         in  varchar2 );

function check_table (
    p_schema      in varchar2,
    p_table_name  in varchar2 )
    return varchar2;

procedure create_table_hint_priv (
    p_table_id             in number   default null,
    p_schema               in varchar2 default null,
    p_table_name           in varchar2 default null,
    p_form_region_title    in varchar2 default null,
    p_report_region_title  in varchar2 default null,
    p_description          in varchar2 default null );

procedure create_group_priv (
    p_group_id             in number   default null,
    p_table_id             in number   default null,
    p_group_name           in varchar2 default null,
    p_description          in varchar2 default null,
    p_display_sequence     in number   default null );

procedure create_column_hint_priv (
    p_column_id           in number   default null,
    p_table_id            in number   default null,
    p_column_name         in varchar2 default null,
    p_group_id            in number   default null,
    p_label               in varchar2 default null,
    p_help_text           in varchar2 default null,
    p_mask_form           in varchar2 default null,
    p_display_seq_form    in number   default null,
    p_display_in_form     in varchar2 default null,
    p_display_as_form     in varchar2 default null,
    p_attributes          in clob     default null,
    p_form_attribute_01   in varchar2 default null,
    p_form_attribute_02   in varchar2 default null,
    p_form_attribute_03   in varchar2 default null,
    p_form_attribute_04   in varchar2 default null,
    p_form_attribute_05   in varchar2 default null,
    p_form_attribute_06   in varchar2 default null,
    p_form_attribute_07   in varchar2 default null,
    p_form_attribute_08   in varchar2 default null,
    p_form_attribute_09   in varchar2 default null,
    p_form_attribute_10   in varchar2 default null,
    p_form_attribute_11   in varchar2 default null,
    p_form_attribute_12   in varchar2 default null,
    p_form_attribute_13   in varchar2 default null,
    p_form_attribute_14   in varchar2 default null,
    p_form_attribute_15   in varchar2 default null,
    p_form_attribute_16   in varchar2 default null,
    p_form_attribute_17   in varchar2 default null,
    p_form_attribute_18   in varchar2 default null,
    p_form_attribute_19   in varchar2 default null,
    p_form_attribute_20   in varchar2 default null,
    p_form_attribute_21   in varchar2 default null,
    p_form_attribute_22   in varchar2 default null,
    p_form_attribute_23   in varchar2 default null,
    p_form_attribute_24   in varchar2 default null,
    p_form_attribute_25   in varchar2 default null,
    p_display_as_tab_form in varchar2 default null,
    p_display_seq_report  in number   default null,
    p_display_in_report   in varchar2 default null,
    p_display_as_report   in varchar2 default null,
    p_mask_report         in varchar2 default null,
    p_aggregate_by        in varchar2 default null,
    p_lov_query           in varchar2 default null,
    p_default_value       in varchar2 default null,
    p_required            in varchar2 default null,
    p_alignment           in varchar2 default null,
    p_display_width       in number   default null,
    p_max_width           in number   default null,
    p_height              in number   default null,
    p_group_by            in varchar2 default null,
    p_order_by_seq        in number   default null,
    p_order_by_asc_desc   in varchar2 default null,
    p_searchable          in varchar2 default null );

procedure create_lov_data_priv (
    p_id                 in number      default null,
    p_column_id          in number      default null,
    p_lov_disp_sequence  in number      default null,
    p_lov_disp_value     in varchar2    default null,
    p_lov_return_value   in varchar2    default null );


procedure remove_hint_priv (
    p_schema          in varchar2 default null,
    p_table_name      in varchar2 default null );

function check_lov_issues (
    p_table_id in number )
    return varchar2;

procedure update_table_hint (
    p_table_id             in number   default null,
    p_schema               in varchar2 default null,
    p_table_name           in varchar2 default null,
    p_form_region_title    in varchar2 default null,
    p_report_region_title  in varchar2 default null );

procedure update_group (
    p_group_id             in number   default null,
    p_table_id             in number   default null,
    p_group_name           in varchar2 default null,
    p_description          in varchar2 default null,
    p_display_sequence     in number   default null );

procedure update_column_hint (
    p_column_id           in number   default null,
    p_table_id            in number   default null,
    p_column_name         in varchar2 default null,
    p_group_id            in number   default null,
    p_label               in varchar2 default null,
    p_help_text           in varchar2 default null,
    p_mask_form           in varchar2 default null,
    p_display_seq_form    in number   default null,
    p_display_in_form     in varchar2 default null,
    p_display_as_form     in varchar2 default null,
    p_display_as_tab_form in varchar2 default null,
    p_display_seq_report  in number   default null,
    p_display_in_report   in varchar2 default null,
    p_display_as_report   in varchar2 default null,
    p_mask_report         in varchar2 default null,
    p_aggregate_by        in varchar2 default null,
    p_lov_query           in varchar2 default null,
    p_default_value       in varchar2 default null,
    p_required            in varchar2 default null,
    p_alignment           in varchar2 default null,
    p_display_width       in number   default null,
    p_max_width           in number   default null,
    p_height              in number   default null,
    p_group_by            in varchar2 default null,
    p_order_by_seq        in number   default null,
    p_order_by_asc_desc   in varchar2 default null,
    p_searchable          in varchar2 default null );

procedure update_lov_data (
    p_id                 in number      default null,
    p_column_id          in number      default null,
    p_lov_disp_sequence  in number      default null,
    p_lov_disp_value     in varchar2    default null,
    p_lov_return_value   in varchar2    default null );

procedure remove_column_hint (
    p_column_id  in number   default null );

procedure remove_lov_data (
    p_id  in number   default null );

procedure remove_group (
    p_group_id  in number  default null );

--

procedure synch_defaults_from_app (
   p_application_id         in number,
   p_form_page_id           in number default null,
   p_report_page_id         in number default null,
   p_table_id               in number,
   p_attributes_to_synch    in varchar2 );

procedure migrate (
   p_table_id   in number );

procedure update_ad_from_items (
   p_application_id   in number,
   p_page_id          in number,
   p_item_id          in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2 );

procedure insert_ad_from_items (
   p_application_id   in number,
   p_page_id          in number,
   p_item_id          in number,
   p_attr_to_include  in varchar2);

procedure update_ad_from_cr (
   p_application_id   in number,
   p_rc_id            in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2 );

procedure update_ad_from_ir (
   p_application_id   in number,
   p_rc_id            in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2 );

procedure insert_ad_from_cr (
   p_application_id   in number,
   p_rc_id            in number,
   p_attr_to_include  in varchar2 );

procedure insert_ad_from_ir (
   p_application_id   in number,
   p_rc_id            in number,
   p_attr_to_include  in varchar2 );

procedure update_items_from_ad (
   p_application_id   in number,
   p_page_id          in number,
   p_item_id          in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2 );

procedure update_ir_from_ad (
   p_application_id   in number,
   p_rc_id            in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2 );

procedure update_cr_ht_from_ad (
   p_application_id   in number,
   p_page_id          in number,
   p_region_id        in number );

procedure update_cr_from_ad (
   p_application_id   in number,
   p_page_id          in number,
   p_region_id        in number,
   p_rc_id            in number,
   p_column_id        in number,
   p_attr_to_include  in varchar2 );

procedure create_col_attribute (
    p_column_id             in number   default null,
    p_column_name           in varchar2 default null,
    p_label                 in varchar2 default null,
    p_help_text             in varchar2 default null,
    p_format_mask           in varchar2 default null,
    p_default_value         in varchar2 default null,
    p_form_format_mask      in varchar2 default null,
    p_form_display_width    in number   default null,
    p_form_display_height   in number   default null,
    p_form_data_type        in varchar2 default null,
    p_report_format_mask    in varchar2 default null,
    p_report_col_alignment  in varchar2 default null );

procedure create_col_synonym (
    p_syn_id             in number   default null,
    p_column_id          in number   default null,
    p_syn_name           in varchar2 default null );

procedure update_col_attribute (
    p_column_id             in number   default null,
    p_column_name           in varchar2 default null,
    p_label                 in varchar2 default null,
    p_help_text             in varchar2 default null,
    p_format_mask           in varchar2 default null,
    p_default_value         in varchar2 default null,
    p_form_format_mask      in varchar2 default null,
    p_form_display_width    in number   default null,
    p_form_display_height   in number   default null,
    p_form_data_type        in varchar2 default null,
    p_report_format_mask    in varchar2 default null,
    p_report_col_alignment  in varchar2 default null );

procedure update_col_synonym (
    p_syn_id             in number   default null,
    p_syn_name           in varchar2 default null );

procedure remove_col_attribute (
    p_column_id          in number   default null );

procedure remove_col_attr_by_name (
    p_column_name        in varchar2   default null );

procedure remove_col_synonym (
    p_syn_id             in number   default null );

procedure remove_col_syn_by_name (
    p_syn_name           in varchar2   default null );

function ad_col_hint_exists (
    p_sgid        in number,
    p_schema      in varchar2,
    p_table_name  in varchar2 )
    return boolean;

procedure get_ad_ui_defaults (
    p_sgid                in  number,
    p_column_name         in  varchar2 );

end wwv_flow_hint;
/
show errors;
