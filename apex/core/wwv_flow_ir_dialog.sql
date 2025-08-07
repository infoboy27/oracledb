set define '^' verify off
prompt ...wwv_flow_ir_dialog
create or replace package wwv_flow_ir_dialog as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2021, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_ir_dialog.sql
--
--    RUNTIME INSTALLATION
--      yes
--
--    DESCRIPTION
--      This package contains interactive report dialog functionality
--
--    NOTES
--  
--    MODIFIED (MM/DD/YYYY)
--    cczarski  08/11/2017 - Created
--
--------------------------------------------------------------------------------

c_max_group_by_columns     constant number := 8;
c_max_pivot_columns        constant number := 3;

--
--========================================================================
procedure print_column_lov (
    p_ir_attributes           in wwv_flow_ir.t_interactive_report,
    p_base_report_id          in number,
    p_report_columns          in varchar2 default null,
    p_selected_column         in varchar2 default null,
    p_column_type             in varchar2 default null,
    p_dialog_type             in varchar2 default null,
    p_display_computed_column in varchar2 default 'Y',
    p_display_null            in varchar2 default 'Y',
    p_display_null_text       in varchar2 default null,
    p_include_class           in varchar2 default 'N');
         
--
--========================================================================
procedure show_format_mask (
    p_worksheet_id in number,
    p_app_user     in varchar2,
    p_report_id    in varchar2);

--
--========================================================================
procedure show_column_list (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id     in varchar2,
    p_column_type   in varchar2 default null );
    
--
--========================================================================
procedure show_select_columns (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id     in varchar2 );
    
--
--========================================================================
procedure save_column_list (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id     in varchar2,
    p_column_list   in wwv_flow_global.vc_arr2 );

--
--========================================================================
procedure show_highlight (
    p_region        in wwv_flow_plugin_api.t_region,
    p_report_id     in number,
    p_condition_id  in varchar2 default null);

--
--========================================================================
procedure show_filter (
    p_region       in wwv_flow_plugin_api.t_region,
    p_report_id    in number,
    p_condition_id in varchar2 default null);

--
--========================================================================
procedure show_ordering (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number);

--
--========================================================================
procedure show_group_by_sort (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id         in number);
    
--
--========================================================================
procedure show_save (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number,
    p_save_type    in varchar2 default 'SAVE');
    
--
--========================================================================
procedure show_save_default (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number,
    p_save_type    in varchar2 default 'SAVE');    
    
--
--========================================================================
procedure show_chart (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number);

--
--========================================================================
procedure show_delete (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number,
    p_is_default   in varchar2 default 'N');
    
--
--========================================================================
procedure show_aggregate (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number,
    p_aggregate    in varchar2 default null);
    
--
--========================================================================
procedure show_flashback (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number);
    
--
--========================================================================
procedure show_reset (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number);

--
--========================================================================
procedure show_computation (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id      in number,
    p_computation_id in varchar2 default null);
    
--
--========================================================================
procedure show_download (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number);  
    
--
--========================================================================
procedure show_control_break (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number);
    
--
--========================================================================
procedure show_group_by (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number);
    
--
--========================================================================
procedure show_notify (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_app_user      in varchar2,
    p_report_id     in number);
    
--
--========================================================================
procedure show_pivot (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number);
    
--
--========================================================================
procedure show_pivot_sort (
    p_ir_attributes in wwv_flow_ir.t_interactive_report,
    p_report_id    in number
    );   
end wwv_flow_ir_dialog;
/
show errors
