set define '^' verify off
prompt ...wwv_flow_ui_default_update_int.sql
create or replace package wwv_flow_ui_default_update_int as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2017. All Rights Reserved.
--
-- NAME
--   wwv_flow_ui_default_update_int.sql
--
-- DESCRIPTION
--   Implementation of apex_ui_default_update.
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  10/20/2017 - Created
--
--------------------------------------------------------------------------------

procedure upd_form_region_title (
    p_table_name            in varchar2,
    p_form_region_title     in varchar2 default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_report_region_title (
    p_table_name            in varchar2,
    p_report_region_title   in varchar2 default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_label (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_label                 in varchar2 default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_item_help (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_help_text             in varchar2 default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_display_in_form (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_display_in_form       in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_display_in_report (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_display_in_report     in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_item_display_width (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_display_width         in number,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_item_display_height (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_display_height        in number,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_report_alignment (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_report_alignment      in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_item_format_mask (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_format_mask           in varchar2 default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_report_format_mask (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_format_mask           in varchar2 default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') ); 

procedure synch_table (
    p_table_name            in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_table (
    p_table_name            in varchar2,
    p_form_region_title     in varchar2 default null,
    p_report_region_title   in varchar2 default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_group (
    p_table_name            in varchar2,
    p_group_name            in varchar2,
    p_new_group_name        in varchar2 default null,
    p_description           in varchar2 default null,
    p_display_sequence      in varchar2 default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_column (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_group_id              in varchar2  default null,
    p_label                 in varchar2  default null,
    p_help_text             in varchar2  default null,
    p_display_in_form       in varchar2  default null,
    p_display_seq_form      in varchar2  default null,
    p_mask_form             in varchar2  default null,
    p_default_value         in varchar2  default null,
    p_required              in varchar2  default null,
    p_display_width         in varchar2  default null,
    p_max_width             in varchar2  default null,
    p_height                in varchar2  default null,
    p_display_in_report     in varchar2  default null,
    p_display_seq_report    in varchar2  default null,
    p_mask_report           in varchar2  default null,
    p_alignment             in varchar2  default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure del_table (
    p_table_name            in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure del_group (
    p_table_name            in varchar2,
    p_group_name            in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure del_column (
    p_table_name            in varchar2,
    p_column_name           in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure add_ad_column (
    p_column_name           in  varchar2,
    p_label                 in  varchar2  default null,
    p_help_text             in  varchar2  default null,
    p_format_mask           in  varchar2  default null,
    p_default_value         in  varchar2  default null,
    p_form_format_mask      in  varchar2  default null,
    p_form_display_width    in  number    default null,
    p_form_display_height   in  number    default null,
    p_form_data_type        in  varchar2  default null,
    p_report_format_mask    in  varchar2  default null,
    p_report_col_alignment  in  varchar2  default null,
    p_syn_name1             in  varchar2  default null,
    p_syn_name2             in  varchar2  default null,
    p_syn_name3             in  varchar2  default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure upd_ad_column (
    p_column_name           in varchar2,
    p_new_column_name       in varchar2  default null,
    p_label                 in varchar2  default null,
    p_help_text             in varchar2  default null,
    p_format_mask           in varchar2  default null,
    p_default_value         in varchar2  default null,
    p_form_format_mask      in varchar2  default null,
    p_form_display_width    in varchar2  default null,
    p_form_display_height   in varchar2  default null,
    p_form_data_type        in varchar2  default null,
    p_report_format_mask    in varchar2  default null,
    p_report_col_alignment  in varchar2  default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure add_ad_synonym (
   p_column_name            in varchar2,
   p_syn_name               in varchar2,
   p_calling_user           in varchar2 default sys_context('userenv','current_user') );

procedure upd_ad_synonym (
    p_syn_name              in varchar2,
    p_new_syn_name          in varchar2  default null,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure del_ad_column (
    p_column_name           in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

procedure del_ad_synonym (
    p_syn_name              in varchar2,
    p_calling_user          in varchar2 default sys_context('userenv','current_user') );

end wwv_flow_ui_default_update_int;
/
show err

