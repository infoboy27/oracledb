set define off
set verify off

prompt ...wwv_flow_page_dev

create or replace package wwv_flow_page_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_page_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling pages in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/13/2012 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================


--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- Returns TRUE if the specified page is the global page of the user interface
-- referenced by that page.
--==============================================================================
function is_global_page (
    p_application_id in number,
    p_page_id        in number )
    return boolean;

--==============================================================================
-- Returns the theme id which is used by the specified page.
--==============================================================================
function get_theme_id (
    p_application_id in number,
    p_page_id        in number )
    return number;

--==============================================================================
-- Given a page_id and the application id, return the
-- page mode: NORMAL, MODAL or NON_MODAL.
--==============================================================================
function get_page_mode (
    p_application_id        in number,
    p_page_id               in number)
    return varchar2;

--==============================================================================
-- Returns a unique page alias.
--==============================================================================
function get_unique_page_alias (
    p_application_id in number,
    p_page_name      in varchar2 )
    return varchar2;

--==============================================================================
-- Creates a page group, if it does not exist yet and returns the internal
-- ID of the group.
--==============================================================================
function create_page_group_if_required (
    p_application_id in number,
    p_group_name     in varchar2 )
    return number;

--==============================================================================
-- Creates a page group in the target application, if it does not exist yet and
-- returns the internal ID of the group, based on the page group for a given page
-- in the source application.
--==============================================================================
function get_or_create_page_group (
    p_application_id_from   in number,
    p_page_id_from          in number,
    p_application_id_to     in number )
    return number;

---==============================================================================
-- Returns the page group name for a given application page
--===============================================================================
function get_page_group_name(
    p_page_id        in number,
    p_application_id in number)

    return varchar2;

--==============================================================================
-- Returns an APEX page URL based on the given parameters.
--==============================================================================
function get_page_url (
    p_page_id     in varchar2 default null,
    p_request     in varchar2 default null,
    p_clear_cache in varchar2 default null,
    p_items       in varchar2 default null,
    p_values      in varchar2 default null,
    p_success_msg in boolean  default false )
    return varchar2;

--==============================================================================
-- this function checks if the application or page alias is a reserved word or not
-- this check is done in multiple places, so, keeping the logic in package
--
-- Parameters:
-- * p_alias   : application or page alias
--
-- Returns:
--  returns TRUE if the specified alias is a reserved word
--  return FALSE otherwise
--==============================================================================
function is_alias_reserved_word (
    p_alias in varchar2 )
    return boolean;

--==============================================================================
-- Creates a new page based on a predefined page pattern
--==============================================================================
procedure copy_page_pattern (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_page_name_to             in varchar2,
    p_breadcrumb_id            in number    default null,
    p_breadcrumb_name          in varchar2  default null,
    p_parent_breadcrumb_id     in number    default null,
    p_nav_list_id              in number    default null,
    p_nav_list_parent_item_id  in number    default null,
    p_nav_list_child_item_name in varchar2  default null,
    p_nav_list_item_icon       in varchar2  default null,
    p_copy_public_report       in boolean   default false );

--==============================================================================
-- Returns true if the app has page patterns
--==============================================================================
function app_has_page_patterns (
    p_application_id in number )
    return boolean;

--==============================================================================
-- Returns true if the page pattern has been subscribed
--==============================================================================
function page_pattern_is_subscribed (
    p_application_id in number,
    p_page_id        in number )
    return boolean;

--==============================================================================
-- Procedure to delete a page
--==============================================================================
procedure delete_page (
    p_page_id                  in number,
    p_application_id           in number,
    p_terminate_bg_executions  in boolean default true,
    p_del_ir_rpts              in boolean default true,
    p_del_page_locks           in boolean default true,
    p_del_breadcrumb_entries   in boolean default true,
    p_del_current_list_entries in boolean default true,
    p_del_target_list_entries  in boolean default true,
    p_del_tabs                 in boolean default true );

--==============================================================================
-- Procedure to refresh a page
-- Here p_master_id refers to the id column, not to internal_id column
--==============================================================================
procedure refresh_page (
    p_master_id          in number,
    p_master_app_id      in number,
    p_subscribing_id     in number,
    p_subscribing_app_id in number );

end wwv_flow_page_dev;
/
show errors

set define '^'