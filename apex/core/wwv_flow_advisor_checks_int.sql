set define '^' verify off
prompt ...wwv_flow_advisor_checks_int.sql
create or replace package wwv_flow_advisor_checks_int authid definer
accessible by (package wwv_flow_advisor_checks_api)
as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2014, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_advisor_checks_int.sql
--
--    DESCRIPTION
--      Internal advisor checks that directly go against the base tables.
--
--
--    RUNTIME DEPLOYMENT: NO
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--    cneumuel    05/22/2014 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- checks for deprecated attributes of pages and page components 
--==============================================================================
procedure deprecated_attributes (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure sql_injection (
    p_application_id in number,
    p_page_id        in number default null );

--==============================================================================
procedure item_has_label (
    p_application_id in number,
    p_page_id        in number default null );

end wwv_flow_advisor_checks_int;
/
show err

