set define '^' verify off
prompt ...wwv_flow_item_help
create or replace package wwv_flow_item_help as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2002 - 2021. All Rights Reserved.
--
--    NAME
--      wwv_flow_item_help.sql
--
--    DESCRIPTION
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--    rmattama    02/26/2002 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Shows the defined help text of an page item.
--==============================================================================
procedure show_help (
    p_item_id           in varchar2 default null,
    p_session           in varchar2 default null,
    p_close_button_name in varchar2 default 'Close',
    p_title_bgcolor     in varchar2 default '#cccccc;',
    p_page_bgcolor      in varchar2 default '#FFFFFF',
    p_output_format     in varchar2 default 'HTML',
    p_context           in varchar2 default null );

--==============================================================================
-- Shows the defined help text of a plug-in attribute.
--==============================================================================
procedure show_plugin_attribute_help (
    p_application_id     in number   default null,
    p_builder_page_id    in number   default null,
    p_session_id         in varchar2 default null,
    p_plugin_type        in varchar2 default null,
    p_plugin_name        in varchar2 default null,
    p_attribute_scope    in varchar2 default null,
    p_attribute_sequence in number   default null,
    p_output_format      in varchar2 default 'JSON' );

--==============================================================================
-- Returns the help text of a page item.
-- Note: p_item_id has to be the language specific id of the page item.
--==============================================================================
function get_help_text (
    p_item_id in number )
    return varchar2;

--==============================================================================
-- Returns TRUE if a page item has a help text defined.
-- Note: p_item_id has to be the language specific id of the page item.
--==============================================================================
function has_help_text (
    p_item_id in number )
    return boolean;

end wwv_flow_item_help;
/
show errors
