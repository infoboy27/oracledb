set define '^' verify off
prompt ...theme_dev_views.sql

Rem  Copyright (c) 2024, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      theme_dev_views.sql
Rem
Rem    DESCRIPTION
Rem      Theme views which are used in internal applications
Rem
Rem    NOTES
Rem      Theme metadata can be detached from app metadata.
Rem      Apps can reference themes locally, or using central workspaces, such as
Rem      Workspace 12: Oracle Themes    - managed by APEX
Rem      Workspace 11: Public Themes    - managed by instance admins
Rem      Workspace 11: Workspace Themes - managed by workspace admins
Rem                                       wwv_flow_themes.theme_security_group_id contains associated workspace_id
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    vmorneau   01/08/2024 - Created

--==============================================================================
-- Theme Styles
--==============================================================================
prompt ...wwv_theme_styles
create or replace view wwv_theme_styles
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_theme_styles t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_theme_styles t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Theme Files
--==============================================================================
prompt ...wwv_theme_files
create or replace view wwv_theme_files
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_theme_files t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_theme_files t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Page Templates
--==============================================================================
prompt ...wwv_theme_page_templates
create or replace view wwv_theme_page_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_templates t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_templates t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Region Templates
--==============================================================================
prompt ...wwv_theme_region_templates
create or replace view wwv_theme_region_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_page_plug_templates t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_page_plug_templates t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Report Templates
--==============================================================================
prompt ...wwv_theme_report_templates
create or replace view wwv_theme_report_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_row_templates t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_row_templates t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- List Templates
--==============================================================================
prompt ...wwv_theme_list_templates
create or replace view wwv_theme_list_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_list_templates t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_list_templates t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Item Templates
--==============================================================================
prompt ...wwv_theme_item_templates
create or replace view wwv_theme_item_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_field_templates t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_field_templates t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Button Templates
--==============================================================================
prompt ...wwv_theme_button_templates
create or replace view wwv_theme_button_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_button_templates t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_button_templates t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Breadcrumb Templates
--==============================================================================
prompt ...wwv_theme_breadcrumb_templates
create or replace view wwv_theme_breadcrumb_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_menu_templates t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_menu_templates t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Calendar Templates
--==============================================================================
prompt ...wwv_theme_calendar_templates
create or replace view wwv_theme_calendar_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_cal_templates t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_cal_templates t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Popup LOV Templates
--==============================================================================
prompt ...wwv_theme_popup_lov_templates
create or replace view wwv_theme_popup_lov_templates
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_popup_lov_template t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_popup_lov_template t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Popup LOV Templates
--==============================================================================
prompt ...wwv_theme_template_opt_groups
create or replace view wwv_theme_template_opt_groups
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_template_opt_groups t,
       apex_ss
 where t.flow_id           = apex_ss.application_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_template_opt_groups t,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;

--==============================================================================
-- Popup LOV Templates
--==============================================================================
prompt ...wwv_theme_template_options
create or replace view wwv_theme_template_options
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) application_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       g.display_name group_name,
       g.display_sequence group_sequence,
       g.is_advanced group_is_advanced,
       g.null_text group_null_text,
       t.theme_id as current_app_theme_id
  from wwv_flow_template_options t,
       wwv_flow_template_opt_groups g,
       apex_ss
 where t.flow_id               = apex_ss.application_id
   and t.security_group_id     = apex_ss.workspace_id
   and g.id                (+) = t.group_id
   and g.flow_id           (+) = t.flow_id
   and g.security_group_id (+) = t.security_group_id
union all
select t.*,
       g.display_name group_name,
       g.display_sequence group_sequence,
       g.is_advanced group_is_advanced,
       g.null_text group_null_text,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_template_options t,
       wwv_flow_template_opt_groups g,
       apex_ss
 where current_theme.flow_id           = apex_ss.application_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id
   and g.id                        (+) = t.group_id
   and g.flow_id                   (+) = t.flow_id
   and g.security_group_id         (+) = t.security_group_id;

--==============================================================================
-- Template Components
--==============================================================================
prompt ...wwv_theme_template_components
create or replace view wwv_theme_template_components
as
with apex_ss as (
    select ( select nv( 'FB_FLOW_ID' )   from sys.dual ) flow_id,
           ( select nv( 'WORKSPACE_ID' ) from sys.dual ) workspace_id
      from sys.dual )
select t.*,
       t.theme_id as current_app_theme_id
  from wwv_flow_template_components t,
       apex_ss
 where t.flow_id           = apex_ss.flow_id
   and t.security_group_id = apex_ss.workspace_id
union all
select t.*,
       current_theme.theme_id as current_app_theme_id
  from wwv_flow_themes current_theme,
       wwv_flow_themes central_theme,
       wwv_flow_template_components t,
       apex_ss
 where current_theme.flow_id           = apex_ss.flow_id
   and current_theme.security_group_id = apex_ss.workspace_id
   and central_theme.id                = current_theme.reference_id
   and central_theme.security_group_id in ( 11, 12 )
   and t.flow_id                       = central_theme.flow_id
   and t.theme_id                      = central_theme.theme_id
   and t.security_group_id             = central_theme.security_group_id;