set define off verify off
prompt ...wwv_flow_remote_deploy_dev.sql
create or replace package wwv_flow_remote_deploy_dev authid definer is
------------------------------------------------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
--    NAME
--      wwv_flow_remote_deploy_dev.sql
--
--    DESCRIPTION
--      Remote application deployment support in APEX
--
--
--    MODIFIED   (MM/DD/YYYY)
--    jstraub     12/09/2019 - Created
--
------------------------------------------------------------------------------------------------------------------------


--=============================================================================
-- validates a remote deployment server reference.
--
-- PARAMETERS:
-- * p_server_id:             ID of the remote SQL server
--
-- RETURNS:
--     An error message if cannot interact with remote SQL server, otherwise
--     null if a valid interaction
--=============================================================================
function validate_deployment_server(
    p_server_id                 in varchar2 )
    return varchar2;

--=============================================================================
-- gets the list of workspaces associated with the REST enabled schema
--
-- PARAMETERS:
-- * p_server_id:             ID of the remote SQL server
--
-- RETURNS:
--     A table of varchar2, the list of workspaces
--=============================================================================
function get_workspaces(
    p_server_id                 in varchar2 )
    return wwv_flow_t_varchar2;

--=============================================================================
-- gets the list of schemas associated with the workspaces of the REST enabled
-- schema
--
-- PARAMETERS:
-- * p_server_id:             ID of the remote SQL server
--
-- RETURNS:
--     A table of varchar2, the list of workspaces
--=============================================================================
function get_schemas(
    p_server_id                 in varchar2 )
    return wwv_flow_t_varchar2;

--=============================================================================
-- validates whether the alias is available
--
-- PARAMETERS:
-- * p_server_id:             ID of the remote SQL server
-- * p_alias                  The proposed alias
--
-- RETURNS:
--     True if alias available, false if not available
--=============================================================================
function is_valid_alias(
    p_server_id                 in varchar2,
    p_alias                     in varchar2 )
    return boolean;

--=============================================================================
-- validates whether the alias is available
--
-- PARAMETERS:
-- * p_server_id:             ID of the remote SQL server
-- * p_app_id                 The proposed app id
-- * p_workspace              The workspace to check
--
-- RETURNS:
--     Reason app is not available, null if available
--=============================================================================
function is_valid_app_id(
    p_server_id                 in varchar2,
    p_app_id                    in varchar2,
    p_workspace                 in varchar2 )
    return varchar2;

--=============================================================================
-- Deploys an application on a remote SQL server
--
-- PARAMETERS:
-- * p_application_id:              ID of the application to deploy
-- * p_server_id:                   ID of the remote SQL server
-- * p_owner_override               An override for the owner of the application
-- * p_workspace_override           An override of the workspace for the application
-- * p_app_id_override              An ID to use instead of p_application_id
-- * p_alias_override               An override for the application alias
-- * p_overwrite_app                Whether to overwrite the app if it already exists
-- * p_keep_sessions                If overwriting an app, should keep existing sessions?
-- * p_export_sup_objects           Whether to include/install supporting objects with the
--                                  deployment
-- * p_export_comments              Include developer comments with the deployment
-- * p_export_ir_public_reports     Include IR public reports
-- * p_export_ir_private_reports    Include IR private reports
-- * p_export_ir_notifications      Include IR notifications
-- * p_export_translations          Include translations
-- * p_build_status_override        An override for the build status, Run and Build or
--                                  Run Only
-- * p_flashback_min_ago            Flashback the app to the specified number of minutes
--                                  before deploying
--
--=============================================================================
procedure deploy(
    p_application_id            in varchar2,
    p_server_id                 in varchar2,
    p_owner_override            in varchar2,
    p_workspace_override        in varchar2,
    p_app_id_override           in varchar2,
    p_alias_override            in varchar2,
    p_overwrite_app             in varchar2,
    p_keep_sessions             in varchar2,
    p_export_sup_objects        in varchar2,
    p_export_comments           in varchar2,
    p_export_ir_public_reports  in varchar2,
    p_export_ir_private_reports in varchar2,
    p_export_ir_notifications   in varchar2,
    p_export_translations       in varchar2,
    p_build_status_override     in varchar2,
    p_flashback_min_ago         in varchar2 );

end wwv_flow_remote_deploy_dev;
/
sho err

set define '^'

