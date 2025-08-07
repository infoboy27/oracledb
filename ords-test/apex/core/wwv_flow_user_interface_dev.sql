set define off
set verify off

prompt ...wwv_flow_user_interface_dev

create or replace package wwv_flow_user_interface_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_user_interface_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling user interfaces in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/12/2012 - Created
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
-- Returns the current theme id of the specified application.
--==============================================================================
function get_current_theme_id (
    p_application_id    in number )
    return number;

--==============================================================================
-- Returns the global page id of the specified application.
--==============================================================================
function get_global_page_id (
    p_application_id    in number )
    return number;

--==============================================================================
-- Returns TRUE if the theme of the specified application has a default
-- breadcrumb template and templates are available.
--==============================================================================
function supports_breadcrumbs (
    p_application_id    in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified user interface supports tabs in the
-- given application, otherwise returns FALSE.
--==============================================================================
function supports_tabs (
    p_application_id    in number )
    return boolean;

--==============================================================================
-- Returns TRUE if the specified application theme has a dialog page template.
--==============================================================================
function dialog_page_template_exists (
    p_application_id    in number )
    return boolean;

--==============================================================================
-- this function checks if the specified application theme has a DRAWER page template or not
--
-- Parameters:
-- * p_application_id   : Application ID
--
-- Returns:
--  returns TRUE if the specified application theme has a DRAWER page template
--  return FALSE otherwise
--==============================================================================
function drawer_page_template_exists (
    p_application_id    in number )
    return boolean;

end wwv_flow_user_interface_dev;
/
show errors

set define '^'
