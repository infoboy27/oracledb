set define off verify off
prompt ...wwv_flow_dev
create or replace package wwv_flow_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_dev.sql
--
--    DESCRIPTION
--      This package is responsible for handling an application in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/16/2012 - Created
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
-- Returns the run URL for the specified application and page.
--==============================================================================
function get_run_url (
    p_application_id in number,
    p_page_id        in number   default null,
    p_debug          in varchar2 default null )
    return varchar2;

--==============================================================================
-- Returns the edit URL for the specified application and page.
--==============================================================================
function get_edit_url (
    p_application_id in number,
    p_page_id        in number   default null )
    return varchar2;
--
--==============================================================================
-- utility procedure on 4000:1 (set flow, page, and run link)
--==============================================================================
procedure set_flow_builder_state;
--
end wwv_flow_dev;
/
show errors

set define '^'
