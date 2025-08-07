set define '^' verify off
prompt ...wwv_flow_markdown
create or replace package wwv_flow_markdown authid current_user
as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2020, 2023, Oracle and/or its affiliates.
--
-- This package offers a way to convert Markdown to HTML directly in the database.
-- This parser is compliant with the Commonmark specification version 0.29
--
-- MODIFIED   (MM/DD/YYYY)
--   sdobre    27/11/2020 - Created
--
--------------------------------------------------------------------------------

subtype t_embedded_html_mode is varchar2(8);

--------------------------------------------------------------------------------
-- Embedded HTML constants
--------------------------------------------------------------------------------

-- escapes HTML
c_embedded_html_escape   constant t_embedded_html_mode := 'ESCAPE';
-- leaves HTML content as-is
c_embedded_html_preserve constant t_embedded_html_mode := 'PRESERVE';

--------------------------------------------------------------------------------
-- Converts a Markdown string into HTML
--
-- Parameters:
-- * p_markdown:                The Markdown text content to be converted to HTML
-- * p_embedded_html_mode:      Specify what should happen with embedded HTML. By default it will be escaped.
--                              Set this option to C_EMBEDDED_HTML_PRESERVE for it to be preserved.
--                              Note that this option has security implications and should only ever be used
--                              on trusted input.
-- * p_softbreak:               Specify a raw string to be used for a softbreak, e.g. chr(10)
--                              If none is specified, `<br />` will be used.
-- * p_extra_link_attributes:   A plist of additional HTML attributes for anchor elements. For example, to open all links in new tabs, 
--                              set this parameter to `apex_t_varchar2('target', '_blank')`
--
-- Example:
--
--   declare
--      l_markdown varchar2(100) := '## APEX_MARKDOWN' || chr(10) || '- Includes the `to_html` **function**';
--   begin
--      dbms_output.put_line(apex_markdown.to_html(l_markdown));
--   end;
--
--   Output:
--
--   <h2>APEX_MARKDOWN</h2>
--   <ul>
--     <li>Includes the <code>to_html</code> <strong>function</strong></li>
--   </ul>
--------------------------------------------------------------------------------
function to_html (
    p_markdown              in clob,
    p_embedded_html_mode    in t_embedded_html_mode default c_embedded_html_escape,
    p_softbreak             in varchar2             default '<br />',
    p_extra_link_attributes in wwv_flow_t_varchar2  default wwv_flow_t_varchar2() )
    return clob;

end wwv_flow_markdown;
/
show errors
