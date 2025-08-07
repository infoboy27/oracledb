set define off
set verify off

prompt ...wwv_flow_dynamic_action

create or replace package wwv_flow_dynamic_action
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009. All Rights Reserved.
--
--    NAME
--      wwv_flow_dynamic_action.sql
--
--    DESCRIPTION
--      This package is resonsible for handling dynamic actions in the
--      runtime engine.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      arayner   06/04/2009 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Public types
--==============================================================================
type t_browser_attributes is record (
    javascript_function varchar2(32767),
    ajax_identifier     varchar2(255),
    attribute_01        wwv_flow_page_da_actions.attribute_01%type,
    attribute_02        wwv_flow_page_da_actions.attribute_02%type,
    attribute_03        wwv_flow_page_da_actions.attribute_03%type,
    attribute_04        wwv_flow_page_da_actions.attribute_04%type,
    attribute_05        wwv_flow_page_da_actions.attribute_05%type,
    attribute_06        wwv_flow_page_da_actions.attribute_06%type,
    attribute_07        wwv_flow_page_da_actions.attribute_07%type,
    attribute_08        wwv_flow_page_da_actions.attribute_08%type,
    attribute_09        wwv_flow_page_da_actions.attribute_09%type,
    attribute_10        wwv_flow_page_da_actions.attribute_10%type );

--==============================================================================
-- includes the necessary Javascript code into the HTML page
-- to handle the defined dynamic actions of the current page.
--==============================================================================
procedure render;

end wwv_flow_dynamic_action;
/
show errors

set define '^'
