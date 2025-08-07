set define '^' verify off
prompt ...wwv_flow_ir_api
create or replace package wwv_flow_ir_api
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2017, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_ir_api.sql
--
--    DESCRIPTION
--      This package is the public API for handling Interactive Report settings
--
--    NOTES
--  
--    MODIFIED (MM/DD/YYYY)
--    cczarski  08/11/2017 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------
type t_report is record (
    sql_query     varchar2(32767),
    binds         wwv_flow_plugin_util.t_bind_list);

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------
c_view_report           constant varchar2(20) := 'REPORT';
c_view_groupby          constant varchar2(20) := 'GROUP_BY';
c_view_pivot            constant varchar2(20) := 'PIVOT';

--==============================================================================
-- Function returns last viewed base report_id for specified page and region.
--==============================================================================
function get_last_viewed_report_id (
    p_page_id       in number,
    p_region_id     in number)
    return number;

--==============================================================================
-- Function validates whether the report_id belongs to the region ID
--==============================================================================
function validate_report_id (
    p_page_id       in number,
    p_region_id     in number,
    p_report_id     in number )
    return number;
    
--==============================================================================
-- DEPRECATED - DO NOT USE - USE APEX_REGION.OPEN_QUERY_CONTEXT INSTEAD
--
-- Function returns Interactive report runtime query with binds.
-- If p_report_id is null, it gets last viewed report information.
--
-- Note: This function works within the same application where the Interactive report exists 
--       and cannot be called outside of APEX environment.
--==============================================================================
function get_report (
    p_page_id        in number,
    p_region_id      in number,
    p_report_id      in number default null,
    p_view           in varchar2 default c_view_report )
    return t_report;

--==============================================================================
-- Procedure adds Interactive report column filter using report_id.
-- If p_report_id is null, it adds filter to the last viewed report.
--==============================================================================
procedure add_filter (
    p_page_id       in number,
    p_region_id     in number,
    p_report_column in varchar2,
    p_filter_value  in varchar2,
    p_operator_abbr in varchar2 default null,
    p_report_id     in number default null
    );
    
--==============================================================================
-- Procedure adds Interactive report column filter using report_alias.
-- If p_report_alias is null, it adds filter to the last viewed report.
--==============================================================================
procedure add_filter (
    p_page_id       in number,
    p_region_id     in number,
    p_report_column in varchar2,
    p_filter_value  in varchar2,
    p_operator_abbr in varchar2 default null,
    p_report_alias  in varchar2 default null
    );
    
--==============================================================================
-- Procedure resets Interactive report to the factory default settings using report_id.
-- If p_report_id is null, it resets the last viewed report.
--==============================================================================
procedure reset_report (
    p_page_id      in number,
    p_region_id    in number,
    p_report_id    in number default null);
    
--==============================================================================
-- Procedure resets Interactive report to the factory default settings using report_alias.
-- If p_report_alias is null, it resets the last viewed report.
--==============================================================================
procedure reset_report (
    p_page_id      in number,
    p_region_id    in number,
    p_report_alias in varchar2 default null);
    
--==============================================================================
-- Procedure clears Interactive report settings using report_id as follows:
--     control break, aggregate, flashback, chart, number of rows to display, 
--      filter, highlight, computation, group by
-- Procedure does NOT clear the following:
--     display column list, sorting, 
--     report preference (view mode, display nulls in detail view, expand/collapse of report settings).
-- If p_report_id is null, it clears the last viewed report settings.
--==============================================================================
procedure clear_report (
    p_page_id      in number,
    p_region_id    in number,
    p_report_id    in number default null);
    
--==============================================================================
-- Procedure clears Interactive report settings using report_alias as follows:
--     control break, aggregate, flashback, chart, number of rows to display, 
--      filter, highlight, computation, group by
-- Procedure does NOT clear the following:
--     display column list, sorting, 
--     report preference (view mode, display nulls in detail view, expand/collapse of report settings).
-- If p_report_alias is null, it clears the last viewed report settings.
--==============================================================================
procedure clear_report (
    p_page_id      in number,
    p_region_id    in number,
    p_report_alias in varchar2 default null);

--==============================================================================
-- Procedure deletes saved reports.  
-- It deletes all saved reports except the Primary Default.
--==============================================================================
procedure delete_report (
    p_report_id          in number);
    
--==============================================================================
-- Procedure deletes Interactive report subscriptions.
--==============================================================================
procedure delete_subscription (
    p_subscription_id    in number);

--==============================================================================
-- Procedure changes Interactive report subscriptions langugae.
-- When email sends out, subscription sends message in the defined language
--==============================================================================
procedure change_subscription_lang (
    p_subscription_id    in number,
    p_language           in varchar2);

--==============================================================================
-- Procedure changes Interactive report subscriptions email address.
-- When email sends out, subscription sends message to the defined email address.
--==============================================================================
procedure change_subscription_email (
    p_subscription_id    in number,
    p_email_address      in varchar2);

--==============================================================================
-- Procedure changes owner of all non-default saved reports (public, private) for the current application.
--==============================================================================
procedure change_report_owner (
    p_report_id    in number,
    p_old_owner    in varchar2,
    p_new_owner    in varchar2);

--==============================================================================
-- This function exports multiple saved reports from the current app and workspace.
--
-- Note:
-- Supports exporting default or user saved reports.
-- If calling outside of APEX, use apex_util.set_workspace to set the current workspace.
--
-- Parameters:
-- * p_report_ids:           The array of report IDs to export.
-- * p_credential_static_id: The "Key Pair" authentication credential static ID.
--                           Create compatible public and private keys using OpenSSH,
--                           and use those to create a "Key Pair" workspace web credential.
--                           This credential is used to create a signature for the export.
--
-- Returns:
-- The signed and base64-encoded report export JSON object in CLOB.
--
-- Example:
--
-- The following example exports report IDs ( 111111, 222222 )
-- from the current workspace using my_API_key_pair credential.
--
--   declare
--       l_export_clob clob;
--   begin
--       l_export_clob := apex_ir.export_saved_reports (
--                            p_report_ids           => apex_t_number(
--                                                          111111, 222222 ),
--                            p_credential_static_id => 'my_API_key_pair' );
--   end;
--==============================================================================
function export_saved_reports (
    p_report_ids           in wwv_flow_t_number,
    p_credential_static_id in varchar2 )
    return clob;

--==============================================================================
-- This procedure imports saved report(s) into an app in the current workspace.
--
-- Note:
-- Supports importing default or user saved reports.
-- If calling outside of APEX, use apex_util.set_workspace to set the current workspace.
--
-- Parameters:
-- * p_export_content:       The signed and base64-encoded report export JSON.
-- * p_credential_static_id: The "Key Pair" authentication credential static ID.
--                           The same credential used to sign the export content
--                           is used to verify.
--   p_replace_report:       If TRUE ( the default), report will be replaced if exists.
--   p_new_owner:            The case-sensitive new owner of the report(s).
--                           Only non-default reports can be overwritten with the p_new_owner.
--   p_new_application_id:   The new application ID of the report(s).
--                           The report(s) will be imported to the application
--                           containing valid interactive report region(s).
--
-- Example:
--
-- The following example imports report(s) using 
-- the uploaded export file and my_API_key_pair credential.
-- The owner and application ID of the report(s) are overwritten
-- by the entered page item values during the import.
-- 
--
-- declare
--     l_blob blob;
-- begin
--     select blob_content
--       into l_blob
--       from apex_application_temp_files
--      where name = :P1_FILE;
-- 
--     apex_ir.import_saved_reports (
--         p_export_content       => apex_util.blob_to_clob( l_blob ),
--         p_credential_static_id => 'my_API_key_pair',
--         p_new_owner            => :P1_NEW_OWNER,
--         p_new_application_id   => :P1_NEW_APP_ID );
-- end;
--==============================================================================
procedure import_saved_reports (
    p_export_content       in clob,
    p_credential_static_id in varchar2,
    p_replace_report       in boolean  default true,
    p_new_owner            in varchar2 default wwv_flow.g_user,
    p_new_application_id   in number   default null );

--==============================================================================
-- This function clones user saved report and returns new report ID.
--
-- Note:
-- Supports cloning into a Private or Public report.
-- Cloning into a default report NOT allowed.
--
-- Parameters:
-- * p_report_id:       The source report ID to clone.
-- * p_new_name:        The new report name.
-- * p_new_description: The new report description.
-- * p_new_owner:       The case-sensitive new owner of the report.
--                      If not passed, current user is the owner.
-- * p_new_is_public:   If new report is Public.
--                      If not passed, clones as Private report.
-- * p_replace_report:  If TRUE ( the default), report will be replaced if exists.
--                      If FALSE, an error is raised if a report with the same name and owner already exists.
--
-- Example:
--
-- The following example clones report ID selected from a page item value.
-- The report name and owner are overwritten by the parameter values, and
-- the report is cloned as public report.
-- 
--
-- declare
--     l_new_report_id number;
-- begin
--     l_new_report_id := apex_ir.clone_report (
--                            p_report_id        => :P1_REPORT_ID,
--                            p_new_name         => 'New Cloned Report',
--                            p_new_owner        => :APP_USER,
--                            p_new_is_public    => true );
-- end;
--==============================================================================
function clone_report (
    p_report_id       in number,
    p_new_name        in varchar2,
    p_new_description in varchar2 default null,
    p_new_owner       in varchar2 default wwv_flow.g_user,
    p_new_is_public   in boolean  default false,
    p_replace_report  in boolean  default true )
    return number;

end wwv_flow_ir_api;
/
show errors;
