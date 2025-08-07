set define '^' verify off
prompt ...wwv_flow_export_int.sql
create or replace package wwv_flow_export_int as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
-- NAME
--   wwv_flow_export_int.sql
--
-- DESCRIPTION
--   Implementation of wwv_flow_export_api
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  09/29/2017 - Created (feature #2224)
--
--------------------------------------------------------------------------------

type t_app_info is record (
    app_type          varchar2(2), -- WS or DB
    id                number,
    security_group_id number,
    owner             wwv_flows.owner%type );

--==============================================================================
function get_app_info (
    p_application_id in number,
    p_calling_user   in varchar2 )
    return t_app_info;

--==============================================================================
procedure set_workspace (
    p_security_group_id in number,
    p_calling_user      in varchar2 );

--##############################################################################
--#
--# LEGACY INTERFACE ( FROM WWV_FLOW_UTILITIES )
--#
--##############################################################################

--==============================================================================
procedure init_gen_api_clob;

--==============================================================================
function get_gen_api_clob return clob;

--##############################################################################
--#
--# WWV_FLOW_EXPORT_API IMPLEMENTATION
--#
--##############################################################################

--==============================================================================
function get_readable_application (
    p_application_id  in number,
    p_page_id         in number default null,
    p_with_id_mode    in wwv_flow_gen_api2.t_id_mode,
    p_base_path       in varchar2,
    p_export_for_diff in boolean default false )
    return wwv_flow_t_export_files;

--==============================================================================
function get_application (
    p_app_info                in t_app_info,
    p_type                    in wwv_flow_export_api.t_export_type,
    p_split                   in boolean,
    p_with_date               in boolean,
    p_with_ir_public_reports  in boolean,
    p_with_ir_private_reports in boolean,
    p_with_ir_notifications   in boolean,
    p_with_translations       in boolean,
    p_with_pkg_app_mapping    in boolean,
    p_with_id_mode            in wwv_flow_gen_api2.t_id_mode,
    p_with_no_subscriptions   in boolean,
    p_with_comments           in boolean,
    p_with_supporting_objects in varchar2,
    p_with_acl_assignments    in boolean,
    p_components              in wwv_flow_t_varchar2,
    p_format                  in varchar2 default 'UNIX',
    p_with_install            in boolean  default true,
    p_export_for_diff         in boolean  default false,
    p_export_for_merge        in boolean  default false,
    p_with_audit_info         in wwv_flow_export_api.t_audit_type default null,
    p_flashback_min_ago       in number   default null,
    --
    p_with_runtime_instances  in wwv_flow_t_varchar2 default null )
    return wwv_flow_t_export_files;

--==============================================================================
function get_workspace_files (
    p_workspace_id in number,
    p_with_date    in boolean )
    return wwv_flow_t_export_files;

--==============================================================================
function get_feedback (
    p_workspace_id      in number,
    p_with_date         in boolean,
    p_since             in date,
    p_deployment_system in varchar2 )
    return wwv_flow_t_export_files;

--==============================================================================
function get_workspace (
    p_workspace_id          in number,
    p_with_date             in boolean,
    p_with_team_development in boolean,
    p_with_misc             in boolean )
    return wwv_flow_t_export_files;

--==============================================================================
function get_embedded_code (
    p_application_id        in number )
    return wwv_flow_t_export_files;

--==============================================================================
function zip (
    p_source_files wwv_flow_t_export_files,
    p_extra_files  wwv_flow_t_export_files )
    return blob;

--==============================================================================
function unzip (
    p_source_zip in blob )
    return wwv_flow_t_export_files;

--==============================================================================
-- remove undesireables from the file name
--==============================================================================
function get_file_name (
    p_name in varchar2 )
    return varchar2;

end wwv_flow_export_int;
/
show err
