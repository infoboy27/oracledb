set define '^' verify off
prompt ...wwv_flow_working_copy_dev
create or replace package wwv_flow_working_copy_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_working_copy_dev.sql
--
--    DESCRIPTION
--     Working Copy, Diff, Merge functionality
--
--    SECURITY
--      No grants
--
--    MODIFIED (MM/DD/YYYY)
--     mnolan   26/07/2023 - Created
--
--------------------------------------------------------------------------------

--===============================================================================
-- return the working copy name
--===============================================================================
function get_working_copy_name(
    p_application_id    in number,
    p_security_group_id in number default wwv_flow_security.g_security_group_id )
    return varchar2 result_cache;

--===============================================================================
-- return true/false if app has a working copy
--===============================================================================
function app_has_working_copy (
    p_application_id     number,
    p_security_group_id  number default wwv_flow_security.g_security_group_id )
    return boolean;

--===============================================================================
-- return true/false if app is a working copy
--===============================================================================
function is_working_copy (
    p_application_id     number,
    p_security_group_id  number default wwv_flow_security.g_security_group_id )
    return boolean;

--===============================================================================
-- return true/false if app is a main application
--===============================================================================
function is_main_app (
    p_application_id     number,
    p_security_group_id  number default wwv_flow_security.g_security_group_id )
    return boolean;

--===============================================================================
-- return the list of export types that are not supported
--===============================================================================
function get_unsupported_export_types
    return wwv_flow_t_varchar2;

--===============================================================================
-- return the working copy app name that fits within the 255 charatcer size limit
--===============================================================================
function get_working_copy_app_name (
    p_main_app_name      in varchar2,
    p_working_copy_name  in varchar2 )
    return varchar2;

--===============================================================================
-- return the merge title for the page
--===============================================================================
function get_page_title (
    p_compare         in boolean,
    p_reverse         in boolean,
    p_left_app_label  in varchar2,
    p_right_app_label in varchar2 )
    return varchar2;

--===============================================================================
-- return the differences informational text that describes what can't be diffed
--===============================================================================
function get_differences_info (
    p_url               in varchar2,
    p_differences_count in number )
    return varchar2;

--==============================================================================
-- Copy an application as a working copy:
--
-- PARAMETERS
-- * p_old_application_id:     The ID of the existing application.
-- * p_new_application_id:     The ID of the new application.
-- * p_main_app_name:          The name of the main application.
-- * p_working_copy_name:      The name of the working copy.
-- * p_description:            The description of the working copy application
-- * p_export_sup_objects:     Should supporting objects be copied? (Y/N)
--==============================================================================
procedure create_working_copy (
    p_old_application_id   in number,
    p_new_application_id   in number,
    p_main_app_name        in varchar2,
    p_working_copy_name    in varchar2,
    p_description          in varchar2,
    p_export_sup_objects   in varchar2,
    p_security_group_id    in varchar2 );

--===============================================================================
-- procedure to initialize session state
-- procedure to initialize session state
--===============================================================================
procedure diff_merge_init (
    p_left_app_id_item  in varchar2,
    p_left_label_item   in varchar2,
    p_right_app_id_item in varchar2,
    p_right_label_item  in varchar2,
    p_reverse_item      in varchar2,
    p_init_collections  in boolean default true );

--===============================================================================
-- procedure to perform the diff of two exports
--===============================================================================
procedure do_diff (
    p_left_app_id         in number,
    p_right_app_id        in number,
    p_left_app_label      in varchar2,
    p_right_app_label     in varchar2,
    p_reverse_merge       in varchar2,
    p_status_item         in varchar2,
    p_pct_item            in varchar2,
    p_current_status_item in varchar2,
    p_in_background       in boolean );

--===============================================================================
-- procedure to perform the diff of two exports in the background
--===============================================================================
procedure diff_in_background (
    p_left_app_id         in number,
    p_right_app_id        in number,
    p_left_app_label      in varchar2,
    p_right_app_label     in varchar2,
    p_reverse_merge       in varchar2,
    p_status_item         in varchar2,
    p_pct_item            in varchar2,
    p_current_status_item in varchar2 );

--===============================================================================
-- wrapper procedure to perform the diff of two exports by the job scheduler
--===============================================================================
procedure diff_export_files_job (
    p_left_app_id         in number,
    p_right_app_id        in number,
    p_left_app_label      in varchar2,
    p_right_app_label     in varchar2,
    p_reverse_merge       in varchar2,
    p_status_item         in varchar2,
    p_pct_item            in varchar2,
    p_current_status_item in varchar2,
    p_apex_session_id     in number,
    p_apex_app_id         in number,
    p_apex_page_id        in number );

--===============================================================================
-- procedure to perform the diff of two exports
--===============================================================================
procedure diff_export_files (
    p_left_app_id         in number,
    p_right_app_id        in number,
    p_left_app_label      in varchar2,
    p_right_app_label     in varchar2,
    p_reverse_merge       in varchar2,
    p_status_item         in varchar2,
    p_pct_item            in varchar2,
    p_current_status_item in varchar2 );

--===============================================================================
-- procedure to perform a "merge" using a component export/import
--===============================================================================
procedure diff_merge (
    p_left_app_id       in number,
    p_right_app_id      in number,
    p_reverse_merge     in boolean,
    p_backup_first      in boolean );

--===============================================================================
-- return the checkbox that securely encodes the required data
--===============================================================================
function add_encoded_checkbox (
    p_component_type            in varchar2,
    p_component_id              in varchar2,
    p_component_type_label      in varchar2,
    p_component_display_name    in varchar2,
    p_status                    in varchar2,
    p_rownum                    in number )
    return varchar2;

--===============================================================================
-- procedure to add components to a collection for later merging
--===============================================================================
procedure add_to_merge_collection (
    p_app_id in number );

--===============================================================================
-- function to return locked pages error messages i.e. you can't merge a
-- page that is locked in main by another user
--===============================================================================
function get_locked_page_errors (
    p_application_id in number )
    return wwv_flow_t_varchar2;

--===============================================================================
-- procedure to populate collection with all page changes of other working
-- copies for the current page and return the count
--===============================================================================
procedure populate_other_page_changes (
    p_application_id in  number,
    p_page_id        in  number,
    p_count          out number );

--===============================================================================
-- procedure to populate collection with all working copies that have the
-- current page locked and return the count
--===============================================================================
procedure populate_other_page_locks (
    p_application_id in  number,
    p_page_id        in  number,
    p_count          out number );

--===============================================================================
-- procedure to get the diff of a single page from two different applications
-- and return the clob with the data for the original and modified files
--===============================================================================
function diff_pages (
    p_left_app_id    in number,
    p_right_app_id   in number,
    p_page_id        in number,
    p_comparing_main in boolean )
    return clob;

end wwv_flow_working_copy_dev;
/
show errors
