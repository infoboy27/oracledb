set define off
set verify off

prompt ...wwv_flow_template_dev

create or replace package wwv_flow_template_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_template_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling templates in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/16/2012 - Created
--      pawolf    05/14/2012 - Added grid templates (feature #936)
--      pawolf    05/24/2012 - Moved grid template attributes into wwv_flow_templates and removed wwv_flow_grid_templates (feature #936)
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
-- Returns the default breadcrumb position of a page template.
-- If p_page_template_id isn't specified, the default page template will be used.
--==============================================================================
function get_breadcrumb_display_point (
    p_application_id   in number,
    p_theme_id         in number,
    p_page_template_id in number default null )
    return varchar2;

--==============================================================================
-- look up all #PLACEHOLDERS# within the template CLOB.
--==============================================================================
procedure template_placeholders(
    p_template            in            clob,
    p_version_number      in            pls_integer,
    p_placeholders        in out nocopy wwv_flow_t_varchar2,
    p_ignore_placeholders in            wwv_flow_t_varchar2 default null );

--==============================================================================
-- look up all placeholders from a given email template and return these
-- as VARCHAR2 array
--==============================================================================
function email_template_placeholders(
    p_application_id       in number,
    p_email_template_id    in number )
    return wwv_flow_t_varchar2;

--==============================================================================
-- look up all placeholders from a given email template and merge these into
-- the existing placeholders JSON.
--==============================================================================
function add_new_placeholders(
    p_application_id         in number,
    p_email_template_id      in number,
    p_placeholder_json       in varchar2 )
    return varchar2;

--==============================================================================
-- write all placeholders with values into a collection
-- C001 => key
-- C002 => value
--==============================================================================
procedure placeholders_to_collection(
    p_placeholder_json       in varchar2,
    p_collection_name        in varchar2 );

--==============================================================================
-- generate a new placeholder JSON from a collection
-- C001 => key
-- C002 => value
--==============================================================================
function placeholders_from_collection(
    p_collection_name        in varchar2 )
    return varchar2;
--
--
end wwv_flow_template_dev;
/
show errors

set define '^'
