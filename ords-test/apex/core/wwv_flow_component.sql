set define '^'
set verify off
prompt ...wwv_flow_component


create or replace package wwv_flow_component
as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2013, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_component.sql
--
--    DESCRIPTION
--      This package provides constants for the components of APEX.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      12/11/2013 - Init
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

c_comp_type_breadcrumb         constant number := 3510;
c_comp_type_list               constant number := 3520;
c_comp_type_automation         constant number := 3610;
c_comp_type_automation_action  constant number := 3620;
c_comp_type_task_def_action    constant number := 3710;
c_comp_type_workflow_activity  constant number := 8830;
c_comp_type_app_process        constant number := 3030; 
c_comp_type_region             constant number := 5110;
c_comp_type_page_item          constant number := 5120;
c_comp_type_button             constant number := 5130;
c_comp_type_page_process       constant number := 5530;
c_comp_type_ir_column          constant number := 7040;
c_comp_type_classic_report     constant number := 7310;
c_comp_type_classic_rpt_column constant number := 7320;
c_comp_type_tab_form_column    constant number := 7420;
c_comp_type_ig_column          constant number := 7940;
c_comp_type_facet              constant number := 8010;
c_comp_type_facet_group_item   constant number := 8030;
c_comp_type_sfilter            constant number := 8050;
c_comp_type_sfilter_group_item constant number := 8052;
--
end wwv_flow_component;
/
show errors
