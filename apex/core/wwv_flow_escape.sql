set define '^' verify off
prompt wwv_flow_escape
create or replace package wwv_flow_escape as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2012, 2022, Oracle and/or its affiliates.
--
-- The APEX_ESCAPE package provides functions for escaping special characters
-- in strings to ensure that the data is suitable for further processing.
--
--------------------------------------------------------------------------------

--##############################################################################
--
-- Constants
--
--##############################################################################

-- Reserved characters for LDAP distinquished name
c_ldap_dn_reserved_chars     constant varchar2(8)   := '"+,;<=>\';
-- Reserved characters for LDAP search
c_ldap_search_reserved_chars constant varchar2(5)   := '*()\/';
-- Safe HTML tags
-- Since: 20.2
c_html_allowlist_tags        constant varchar2(255) := '<h1>,</h1>,<h2>,</h2>,<h3>,</h3>,<h4>,</h4>,<p>,</p>,<b>,</b>,<strong>,</strong>,<i>,</i>,<em>,</em>,<ul>,</ul>,<ol>,</ol>,<li>,</li>,<dl>,</dl>,<dt>,</dt>,<dd>,</dd>,<pre>,</pre>,<code>,</code>,<br />,<br/>,<br>,<BR>,<hr/>';
-- Remains for backward compatibility
-- Deprecated: 20.2
c_html_whitelist_tags        constant varchar2(255) := c_html_allowlist_tags;


--##############################################################################
--
-- LDAP Escaping
--
--##############################################################################

--==============================================================================
-- The LDAP_DN function escapes reserved characters in an LDAP distinguished name,
-- according to RFC 4514. The RFC describes `+,;<=>\` as reserved characters
-- (see P_RESERVED_CHARS).
--
-- - These are escaped by a backslash, for example, `"` becomes `\"`.
-- - Non-printable characters, ascii 0 - 31, and ones with a code > 127
--   (see P_ESCAPE_NON_ASCII) are escaped as `\xx`, where `xx` is the
--   hexadecimal character code.
-- - The space character at the beginning or end of the string and a `#` at the
--   beginning is also escaped with a backslash.
--
-- Parameters:
-- * p_string:           The text string that is escaped.
-- * p_reserved_chars:   A list of characters that when found in P_STRING is
--                       escaped with a backslash.
-- * p_escape_non_ascii: If TRUE, characters above ascii 127 in P_STRING are
--                       escaped with a backslash. This is supported by
--                       RFCs 4514 and 2253, but may cause errors with older
--                       LDAP servers and Microsoft AD.
--
-- Example:
--
-- This example escapes characters in `l_name` and places the result in `l_escaped`.
--
--   declare
--       l_name    varchar2(4000) := 'Joe+User';
--       l_escaped varchar2(4000);
--   begin
--       l_escaped := apex_escape.ldap_dn(l_name);
--       htp.p(l_name||' becomes '||l_escaped);
--   end;
--
-- See Also:
-- - LDAP_SEARCH_FILTER
--==============================================================================
function ldap_dn (
    p_string           in varchar2,
    p_reserved_chars   in varchar2 default c_ldap_dn_reserved_chars,
    p_escape_non_ascii in boolean  default true )
    return varchar2;

--==============================================================================
-- The LDAP_SEARCH_FILTER function escapes reserved characters in an
-- LDAP search filter, according to RFC 4515. The RFC describes `+,;<=>\` as
-- reserved characters (see P_RESERVED_CHARS).
--
-- - These are escaped by a backslash, for example, `"` becomes `\"`.
-- - Non-printable characters, ascii 0 - 31, and ones with a code > 127
--   (see P_ESCAPE_NON_ASCII) are escaped as `\xx`, where `xx` is the
--   hexadecimal character code.
--
-- Parameters:
-- * p_string:           The text string that is escaped.
-- * p_reserved_chars:   A list of characters that when found in P_STRING is
--                       escaped with a backslash.
-- * p_escape_non_ascii: If TRUE, characters above ascii 127 in P_STRING are
--                       escaped with a backslash. This is supported by
--                       RFCs 4514 and 2253, but may cause errors with older
--                       LDAP servers and Microsoft AD.
--
-- Example:
--
-- This example escapes characters in `l_name` and places the result in `l_escaped`.
--
--   declare
--       l_name    varchar2(4000) := 'Joe*User';
--       l_escaped varchar2(4000);
--   begin
--       l_escaped := apex_escape.ldap_search_filter(l_name);
--       htp.p(l_name||' becomes '||l_escaped);
--   end;
--
-- See Also:
-- - LDAP_DN
--==============================================================================
function ldap_search_filter (
    p_string           in varchar2,
    p_reserved_chars   in varchar2 default c_ldap_search_reserved_chars,
    p_escape_non_ascii in boolean default true )
    return varchar2;


--##############################################################################
--
-- HTML Escaping
--
--##############################################################################

--==============================================================================
-- The HTML function escapes characters which can change the context in an
-- HTML environment. It is an extended version of the well-known SYS.HTF.ESCAPE_SC.
--
-- The function's result depends on the escaping mode that is defined by using
-- SET_HTML_ESCAPING_MODE. By default, the escaping mode is *Extended*, but it
-- can be overridden by manually calling SET_HTML_ESCAPING_MODE or by setting
-- the *application security attribute HTML Escaping Mode* to *Basic*. If the
-- mode is Basic, the function behaves like SYS.HTF.ESCAPE_SC. Otherwise, the
-- rules below apply.
--
-- The following table depicts ascii characters that the function will
-- transform and their escaped values:
--
--   Raw Escaped
--   --- -------
--   &   &amp;
--   "   &quot;
--   <   &lt;
--   >   &gt;
--   '   &#x27;
--   /   &#x2F;
--
-- In addition, the function may escape unicode characters if the database NLS
-- character set is not UTF-8 or if the `REQUEST_IANA_CHARSET` http header
-- variable is set to something different than UTF-8 (which is the default). If
-- unicode escaping applies, these characters are escaped via `&#xHHHH;` where
-- `HHHH` is the unicode hex code.
--
-- Parameters:
-- * p_string:  The string text that is escaped
--
-- Example:
--
-- This example tests escaping in basic (`B`) and extended (`E`) mode.
--
--   declare
--     procedure eq(p_str1 in varchar2,p_str2 in varchar2)
--     is
--     begin
--       if p_str1||'.' <> p_str2||'.' then
--         raise_application_error(-20001,p_str1||' <> '||p_str2);
--       end if;
--     end eq;
--   begin
--     apex_escape.set_html_escaping_mode('B');
--     eq(apex_escape.html('hello &"<>''/'), 'hello &amp;&quot;&lt;&gt;''/');
--     apex_escape.set_html_escaping_mode('E');
--     eq(apex_escape.html('hello &"<>''/'), 'hello &amp;&quot;&lt;&gt;&#x27;&#x2F;');
--   end;
--
-- See Also:
-- - HTML_CLOB
-- - HTML_TRUNC
-- - HTML_ALLOWLIST
-- - HTML_ATTRIBUTE
-- - SET_HTML_ESCAPING_MODE
--==============================================================================
function html (
    p_string in varchar2 )
    return varchar2 deterministic;

--==============================================================================
-- The HTML_CLOB function escapes characters which can change the context in an
-- HTML environment. It is an extended version of the well-known SYS.HTF.ESCAPE_SC.
--
-- The function's result depends on the escaping mode that is defined by using
-- SET_HTML_ESCAPING_MODE. By default, the escaping mode is *Extended*, but it
-- can be overridden by manually calling SET_HTML_ESCAPING_MODE or by setting
-- the *application security attribute HTML Escaping Mode* to *Basic*. If the
-- mode is Basic, the function behaves like SYS.HTF.ESCAPE_SC. Otherwise, the
-- rules below apply.
--
-- The following table depicts ascii characters that the function will
-- transform and their escaped values:
--
--   Raw Escaped
--   --- -------
--   &   &amp;
--   "   &quot;
--   <   &lt;
--   >   &gt;
--   '   &#x27;
--   /   &#x2F;
--
-- In addition, the function may escape unicode characters if the database NLS
-- character set is not UTF-8 or if the `REQUEST_IANA_CHARSET` http header
-- variable is set to something different than UTF-8 (which is the default). If
-- unicode escaping applies, these characters are escaped via `&#xHHHH;` where
-- `HHHH` is the unicode hex code.
--
-- Parameters:
-- * p_string:  The string text that is escaped
--
-- Example:
--
-- This example tests escaping in basic (`B`) and extended (`E`) mode.
--
--   declare
--     procedure eq(p_str1 in clob,p_str2 in clob)
--     is
--     begin
--       if dbms_lob.compare(p_str1||'.', p_str2||'.') <> 0 then
--         raise_application_error(-20001,'p_str1 <> p_str2');
--       end if;
--     end eq;
--   begin
--     apex_escape.set_html_escaping_mode('B');
--     eq(apex_escape.html_clob('hello &"<>''/'), 'hello &amp;&quot;&lt;&gt;''/');
--     apex_escape.set_html_escaping_mode('E');
--     eq(apex_escape.html_clob('hello &"<>''/'), 'hello &amp;&quot;&lt;&gt;&#x27;&#x2F;');
--   end;
--
-- See Also:
-- - HTML
-- - HTML_TRUNC
-- - HTML_ALLOWLIST_CLOB
-- - HTML_ATTRIBUTES_CLOB
-- - SET_HTML_ESCAPING_MODE
--
-- Since: 22.2
--==============================================================================
function html_clob (
    p_string in clob )
    return clob deterministic;

--==============================================================================
-- The HTML_TRUNC(1) function escapes HTML and limits the returned string to
-- P_LENGTH *bytes*. This function returns the first P_LENGTH bytes of
-- input VARCHAR2 and escapes them. You can use this function if the escaped
-- input VARCHAR2 is too large to fit in a VARCHAR2 variable and it is sufficient
-- to only display the first part of it.
--
-- Parameters:
-- * p_string:  The text string to be escaped (varchar2).
-- * p_length   The number of bytes from P_STRING that are escaped.
--              - For ASCII characters, a byte is a character.
--              - For Unicode characters, a single character can take up to 4 bytes.
--
-- Example:
--
-- This example generates a HTML list of of titles and text bodies. HTML entity
-- attributes are escaped with HTML_ATTRIBUTE, whereas normal text is escaped
-- with HTML and HTML_TRUNC.
--
--   begin
--       htp.p('<ul>');
--       for l_data in ( select title, cls, body
--                         from my_topics )
--       loop
--           sys.htp.p(
--               '<li><span class="' || apex_escape.html_attribute(l_data.cls) || '">' ||
--               apex_escape.html(l_data.title) ||
--               '</span>' );
--           sys.htp.p(apex_escape.html_trunc(l_data.body));
--           sys.htp.p('</li>');
--       end loop;
--       htp.p('</ul>');
--   end;
--
-- See Also:
-- - HTML_TRUNC(2)
-- - HTML
-- - HTML_ALLOWLIST
-- - HTML_ATTRIBUTE
-- - SET_HTML_ESCAPING_MODE
--==============================================================================
function html_trunc (
    p_string in varchar2,
    p_length in number   default 4000 )
    return varchar2 deterministic;

--==============================================================================
-- The HTML_TRUNC(2) function escapes HTML and limits the returned string to
-- P_LENGTH *bytes*. This function returns the first P_LENGTH bytes of an
-- input CLOB and escapes them. You can use this function if the input CLOB
-- is too large to fit in a VARCHAR2 variable and it is sufficient to only
-- display the first part of it.
--
-- Parameters:
-- * p_string:  The text string to be escaped (clob).
-- * p_length   The number of bytes from P_STRING that are escaped.
--              - For ASCII characters, a byte is a character.
--              - For Unicode characters, a single character can take up to 4 bytes.
--
-- Example:
--
-- This example generates a HTML list of of titles and text bodies. HTML entity
-- attributes are escaped with HTML_ATTRIBUTE, whereas normal text is escaped
-- with HTML and HTML_TRUNC.
--
--   begin
--       htp.p('<ul>');
--       for l_data in ( select title, cls, body
--                         from my_topics )
--       loop
--           sys.htp.p(
--               '<li><span class="' || apex_escape.html_attribute(l_data.cls) || '">' ||
--               apex_escape.html(l_data.title) ||
--               '</span>' );
--           sys.htp.p(apex_escape.html_trunc(l_data.body));
--           sys.htp.p('</li>');
--       end loop;
--       htp.p('</ul>');
--   end;
--
-- See Also:
-- - HTML_TRUNC(1)
-- - HTML_CLOB
-- - HTML_ALLOWLIST_CLOB
-- - HTML_ATTRIBUTES_CLOB
-- - SET_HTML_ESCAPING_MODE
--==============================================================================
function html_trunc (
    p_string in clob,
    p_length in number   default 4000 )
    return varchar2 deterministic;

--==============================================================================
-- The HTML_ALLOWLIST function performs HTML escape on all characters in the
-- input text except the specified allowlist tags. This function can be useful
-- if the input text contains simple html markup but a developer wants to ensure
-- that an attacker cannot use malicious tags for cross-site scripting.
--
-- Parameters
-- * p_html:            The text string that is filtered.
-- * p_allowlist_tags:  The comma separated list of tags that stays in P_HTML.
--                      Defaults to C_HTML_ALLOWLIST_TAGS.
--
-- Example:
--
-- This example shows how to use HTML_ALLOWLIST to remove unwanted html markup
-- from a string, while preserving allowlisted tags.
--
--   begin
--     sys.htp.p(
--         apex_escape.html_allowlist(
--             '<h1>Hello<script>alert("XSS");</script></h1>'));
--   end;
--
-- See Also:
-- - HTML_ALLOWLIST_CLOB
-- - HTML
-- - HTML_TRUNC
-- - HTML_ATTRIBUTE
-- - SET_HTML_ESCAPING_MODE
--
-- Since: 20.2
--==============================================================================
function html_allowlist (
   p_html           in varchar2,
   p_allowlist_tags in varchar2 default c_html_allowlist_tags )
   return varchar2 deterministic;

--==============================================================================
-- The HTML_ALLOWLIST_CLOB function performs HTML escape on all characters in the
-- input text except the specified allowlist tags. This function can be useful
-- if the input text contains simple html markup but a developer wants to ensure
-- that an attacker cannot use malicious tags for cross-site scripting.
--
-- Parameters
-- * p_html:            The text string that is filtered.
-- * p_allowlist_tags:  The comma separated list of tags that stays in P_HTML.
--                      Defaults to C_HTML_ALLOWLIST_TAGS.
--
-- Example:
--
-- This example shows how to use HTML_ALLOWLIST to remove unwanted html markup
-- from a string, while preserving allowlisted tags.
--
--   begin
--     sys.htp.p(
--         apex_escape.html_allowlist_clob(
--             '<h1>Hello<script>alert("XSS");</script></h1>'));
--   end;
--
-- See Also:
-- - HTML_ALLOWLIST
-- - HTML_CLOB
-- - HTML_TRUNC_CLOB
-- - HTML_ATTRIBUTES_CLOB
-- - SET_HTML_ESCAPING_MODE
--
-- Since: 22.2
--==============================================================================
function html_allowlist_clob (
   p_html           in clob,
   p_allowlist_tags in varchar2 default c_html_allowlist_tags )
   return clob deterministic;

--==============================================================================
-- The HTML_WHITELIST function remains for backward compatibility, use
-- HTML_ALLOWLIST instead.
--
-- Deprecated: 20.2
--
-- See Also:
-- - HTML_ALLOWLIST
-- - HTML_ALLOWLIST_CLOB
--==============================================================================
function html_whitelist (
   p_html           in varchar2,
   p_whitelist_tags in varchar2 default c_html_whitelist_tags )
   return varchar2 deterministic;

--==============================================================================
-- Use the HTML_ATTRIBUTE function to escape the values of HTML entity attributes.
-- It hex escapes everything that is not alphanumeric or in one of the
-- following characters: `,.-_`
--
-- Parameters:
-- * p_string:  The text string that is escaped.
--
-- Example:
--
-- For an example see HTML_TRUNC.
--
-- See Also:
-- - HTML_ATTRIBUTE_CLOB
-- - HTML
-- - HTML_TRUNC
-- - HTML_ALLOWLIST
-- - SET_HTML_ESCAPING_MODE
--==============================================================================
function html_attribute (
    p_string in varchar2 )
    return varchar2 deterministic;

--==============================================================================
-- Use the HTML_ATTRIBUTE_CLOB function to escape the values of HTML entity
-- attributes. It hex escapes everything that is not alphanumeric or in one of
-- the following characters: `,.-_`
--
-- Parameters:
-- * p_string:  The text string that is escaped.
--
-- Example:
--
-- For an example see HTML_TRUNC.
--
-- See Also:
-- - HTML_ATTRIBUTE
-- - HTML_CLOB
-- - HTML_TRUNC_CLOB
-- - HTML_ALLOWLIST_CLOB
-- - SET_HTML_ESCAPING_MODE
--
-- Since: 22.2
--==============================================================================
function html_attribute_clob (
    p_string in clob )
    return clob deterministic;

--==============================================================================
-- The SET_HTML_ESCAPING_MODE procedure configures HTML escaping mode for HTML
-- escaping functions.
--
-- Parameters:
-- * p_mode: If equal to `B`, then do basic escaping, like SYS.HTF.ESCAPE_SC.
--           If equal to `E`, then do extended escaping.
--
-- Example:
--
-- For an example see HTML.
--
-- See Also:
-- - HTML
-- - HTML_CLOB
-- - HTML_TRUNC
-- - HTML_ALLOWLIST
-- - HTML_ALLOWLIST_CLOB
--==============================================================================
procedure set_html_escaping_mode (
    p_mode in varchar2 );

--##############################################################################
--
-- JavaScript escaping
--
--##############################################################################

--==============================================================================
-- The JS_LITERAL function escapes and optionally enquotes a javascript string.
-- This function replaces non-immune characters with `\xHH` or `\uHHHH` equivalents.
-- The result can be injected into javascript code, within `<script>` tags or
-- inline (`javascript:xxx`). Immune characters include:
--
-- - `a` through `z`
-- - `A` through `Z`
-- - `0` through `9`
-- - commas `,`
-- - periods `.`
-- - underscores `_`
--
-- If the output should not be enclosed in quotes when the parameter P_QUOTE
-- is NULL. If P_QUOTE has a value, printable ASCII 7 characters except for
-- `& < > " ' ` / \ %` are not escaped.
--
-- Parameters:
-- * p_string:   The text string that is escaped.
-- * p_quote:    If not null, this string is placed on the left and right of
--               the result. The quotation character must be a single or a
--               double quotation mark.
--
-- Example:
--
-- It describes how to use JS_LITERAL to escape special characters in
-- the `l_string` variable.
--
--   declare
--       l_string varchar2(4000) := 'O''Brien';
--   begin
--       sys.htp.p(
--           '<script>'||
--           'alert(' || apex_escape.js_literal(l_string) || ');' ||
--           '</script>' );
--   end;
--
-- See Also:
-- - JS_LITERAL_CLOB
--==============================================================================
function js_literal (
    p_string in varchar2,
    p_quote  in varchar2 default '''' )
    return varchar2;

--==============================================================================
-- The JS_LITERAL_CLOB function escapes and optionally enquotes a javascript
-- string. This function replaces non-immune characters with `\xHH` or `\uHHHH`
-- equivalents. The result can be injected into javascript code, within
-- `<script>` tags or inline (`javascript:xxx`). Immune characters include:
--
-- - `a` through `z`
-- - `A` through `Z`
-- - `0` through `9`
-- - commas `,`
-- - periods `.`
-- - underscores `_`
--
-- If the output should not be enclosed in quotes when the parameter P_QUOTE
-- is NULL. If P_QUOTE has a value, printable ASCII 7 characters except for
-- `& < > " ' ` / \ %` are not escaped.
--
-- Parameters:
-- * p_string:   The text string that is escaped.
-- * p_quote:    If not null, this string is placed on the left and right of
--               the result. The quotation character must be a single or a
--               double quotation mark.
--
-- Example:
--
-- It describes how to use JS_LITERAL to escape special characters in
-- the `l_string` variable.
--
--   declare
--       l_string clob := 'O''Brien';
--   begin
--       sys.htp.p(
--           to_clob('<script>')||
--           'alert(' || apex_escape.js_literal_clob(l_string) || ');' ||
--           '</script>' );
--   end;
--
-- See Also:
-- - JS_LITERAL
--
-- Since: 22.2
--==============================================================================
function js_literal_clob (
    p_string in clob )
    return clob;

--##############################################################################
-- JSON escaping
--##############################################################################

--==============================================================================
-- The JSON function returns P_STRING with all special characters escaped.
--
-- Parameters:
-- * p_string:   The string to be escaped.
--
-- Example:
--
-- The following example prints this: `{ "name": "O\u0027Brien"}`
--
--   declare
--       l_string varchar2(4000) := 'O''Brien';
--   begin
--       sys.htp.p('{ "name": "' || apex_escape.json(l_string) || '"}');
--   end;
--
-- See Also:
-- - JSON_CLOB
--==============================================================================
function json (
    p_string  in varchar2 )
    return varchar2;

--==============================================================================
-- The JSON_CLOB function returns P_STRING with all special characters escaped.
--
-- Parameters:
-- * p_string:   The string to be escaped.
--
-- Example:
--
-- The following example prints this: `{ "name": "O\u0027Brien"}`
--
--   declare
--       l_string clob := 'O''Brien';
--   begin
--       sys.htp.p('{ "name": "' || apex_escape.json_clob(l_string) || '"}');
--   end;
--
-- See Also:
-- - JSON
--
-- Since: 22.2
--==============================================================================
function json_clob (
    p_string  in clob )
    return clob;

--##############################################################################
-- REGEXP Escaping
--##############################################################################

--==============================================================================
-- The REGEXP function escapes characters that can change the context in a
-- regular expression. It should be used to secure user input. The following list
-- depicts ascii characters that the function escapes with a backslash (`\`):
-- Escape regular expression special characters
--
-- This function escapes characters which can change the context in a
-- regular expression. It should be used to secure user input.
--
--   \.^$*+-?()[]{|
--
-- Parameters:
-- * p_string:  The string to be escaped.
--
-- Example:
--
-- The following example ensures the special character `-` in Mary-Ann will be
-- escaped and ignored by the regular expression engine.
--
--   declare
--       l_subscribers varchar2(4000) := 'Christina,Hilary,Mary-Ann,Joel';
--       l_name        varchar2(4000) := 'Mary-Ann';
--   begin
--       if regexp_instr( l_subscribers, '(^|,)' || apex_escape.regexp( l_name ) || '($|,)' ) > 0 then
--           sys.htp.p('found');
--       else
--           sys.htp.p('not found');
--       end if;
--   end;
--
--==============================================================================
function regexp (
    p_string in varchar2 )
    return varchar2 deterministic;

--##############################################################################
--#
--# CSS selector escaping
--#
--##############################################################################

--==============================================================================
-- The CSS_SELECTOR function escapes meta-characters in a string used in a CSS
-- selector.
--
-- See http://api.jquery.com/category/selectors/ for a list of characters.
--
-- Parameters:
-- * p_string: The string to be escaped.
--
-- Example:
--
-- The following example will make sure that the meta-character `@`
-- in `mary@ann.com` will be escaped and ignored by jQuery.
--
--   declare
--       l_name varchar2(30) := 'mary@ann.com';
--   begin
--       apex_javascript.add_onload_code( '$( "#' || apex_escape.js_literal( apex_escape.css_selector( l_name ), null ) || '" ).hide();' );
--   end;
--
-- Since: 21.1
--==============================================================================
function css_selector (
    p_string in varchar2 )
    return varchar2 deterministic;


--##############################################################################
-- CSV escaping
--##############################################################################

--==============================================================================
-- The SET_CSV_PARAMETERS procedure may be used to set parameters for the CSV
-- function.
--
-- Parameters:
-- * p_enclosed_by:      The string to enclose CSV values. If NULL (the
--                       default), fall back to double quote.
-- * p_separated_by:     The string to separate CSV values. If NULL (the
--                       default), determine the separator by checking the NLS
--                       decimal separator. If that is `,`, the CSV separator is
--                       `;`. Otherwise, it is `,`.
-- * p_escape_formulas:  If TRUE (the default is TRUE, but can be overridden
--                       with instance parameter `CSV_DOWNLOAD_ESCAPE_FORMULAS`),
--                       escape formula cells by prepending them with a space.
--                       Formula cells can start with `=`, `@`, `+` or `-`. The
--                       sign characters are only escaped if they are not part
--                       of numbers.
--
-- Example:
--
-- For an example see CSV.
--
-- See Also:
-- - CSV(1)
-- - CSV(2)
-- - GET_CSV_ENCLOSED_BY
-- - GET_CSV_SEPARATED_BY
--
-- Since: 21.1
--==============================================================================
procedure set_csv_parameters (
    p_enclosed_by     in varchar2 default null,
    p_separated_by    in varchar2 default null,
    p_escape_formulas in boolean  default null );

--==============================================================================
-- The GET_CSV_ENCLOSED_BY function returns the CSV enclose by character.
--
-- Example:
--
-- For an example see CSV.
--
-- See Also:
-- - CSV(1)
-- - CSV(2)
-- - SET_CSV_PARAMETERS
-- - GET_CSV_SEPARATED_BY
--
-- Since: 21.1
--==============================================================================
function get_csv_enclosed_by
    return varchar2;

--==============================================================================
-- The GET_CSV_SEPARATED_BY function returns the CSV separated by character.
--
-- Example:
--
-- For an example see CSV.
--
-- See Also:
-- - CSV(1)
-- - CSV(2)
-- - SET_CSV_PARAMETERS
-- - GET_CSV_ENCLOSED_BY
--
-- Since: 21.1
--==============================================================================
function get_csv_separated_by
    return varchar2;

--==============================================================================
-- The CSV(1) function escapes special characters in a CSV value (varchar2).
--
-- Parameters:
-- * p_string:      The string to be escaped.
-- * p_quote:       If TRUE (the default) and P_STRING contains special characters,
--                  enclose the result with the P_ENCLOSE_BY parameter of
--                  SET_CSV_PARAMETERS.
-- * p_strip_html:  If TRUE (the default is FALSE), remove any HTML tags.
--
-- Example:
--
-- Print a CSV report with employee IDs and names and non-default `;` as
-- separator.
--
--   begin
--       apex_escape.set_csv_parameters (
--           p_enclosed_by  => '"',
--           p_separated_by => ';' );
--
--       for i in ( select empno, ename from emp ) loop
--           sys.dbms_output.put_line (
--               i.empno || ';' || apex_escape.csv(i.ename) );
--       end loop;
--   end;
--
-- See Also:
-- - CSV(2)
-- - SET_CSV_PARAMETERS
-- - GET_CSV_ENCLOSED_BY
-- - GET_CSV_SEPARATED_BY
--
-- Since: 21.1
--==============================================================================
function csv (
    p_string     in varchar2,
    p_quote      in boolean default true,
    p_strip_html in boolean default false )
    return varchar2;

--==============================================================================
-- The CSV(2) function escapes special characters in a CSV value (clob).
--
-- Parameters:
-- * p_string:      The string to be escaped.
-- * p_quote:       If TRUE (the default) and P_STRING contains special characters,
--                  enclose the result with the P_ENCLOSE_BY parameter of
--                  SET_CSV_PARAMETERS.
-- * p_strip_html:  If TRUE (the default is FALSE), remove any HTML tags.
--
-- Example:
--
-- Print a CSV report with employee IDs and bio (a CLOB column) and
-- non-default `;` as separator.
--
--   begin
--       apex_escape.set_csv_parameters (
--           p_enclosed_by  => '"',
--           p_separated_by => ';' );
--
--       for i in ( select empno, bio from emp ) loop
--           sys.dbms_output.put_line (
--               i.empno || ';' || apex_escape.csv(i.bio) );
--       end loop;
--   end;
--
-- See Also:
-- - CSV(1)
-- - SET_CSV_PARAMETERS
-- - GET_CSV_ENCLOSED_BY
-- - GET_CSV_SEPARATED_BY
--
-- Since: 22.2
--==============================================================================
function csv (
    p_string     in clob,
    p_quote      in boolean default true,
    p_strip_html in boolean default false )
    return clob;

--##############################################################################
-- Public Utility Functions
--##############################################################################

--==============================================================================
-- The NOOP(1) function returns P_STRING (varchar2) unchanged.
-- Use this function to silence automatic injection detection tests, similar
-- to DBMS_ASSERT.NOOP for SQL injection.
--
-- Parameters:
-- * p_string:  The input text string.
--
-- Example:
--
-- This example shows how to use NOOP to show the developer's intention to
-- explicitly not escape text.
--
--   begin
--       sys.htp.p(apex_escape.noop('Cats & Dogs'));
--   end;
--
-- See Also:
-- - NOOP(2)
--
-- Since: 22.2
--==============================================================================
function noop (
    p_string in varchar2 )
    return varchar2 deterministic;
    
--==============================================================================
-- The NOOP(2) function returns P_STRING (clob) unchanged.
-- Use this function to silence automatic injection detection tests, similar
-- to DBMS_ASSERT.NOOP for SQL injection.
--
-- Parameters:
-- * p_string:  The input text string.
--
-- Example:
--
-- This example shows how to use NOOP to show the developer's intention to
-- explicitly not escape text.
--
--   begin
--       sys.htp.p(apex_escape.noop( to_clob('Cats & Dogs') ));
--   end;
--
-- See Also:
-- - NOOP(1)
--
-- Since: 22.2
--==============================================================================
function noop (
    p_string in clob )
    return clob deterministic;

--##############################################################################
--#
--# STRIP HTML
--#
--##############################################################################

--==============================================================================
-- The STRIPHTML(1) function returns P_STRING (varchar2) with any HTML tags
-- removed, leaving plain text. Removes all HTML attributes as well.
--
-- Note: this does not distinguish between different types of HTML content;
-- content such as JavaScript and CSS are left intact but the script and css
-- HTML tags are removed.
--
-- Parameters:
-- * p_string:  The input text string.
--
-- Example:
--
--   begin
--       sys.htp.p(apex_escape.striphtml(
--           q'[<p id="greeting">Hello <b>Joe</b></p>]'
--       ));
--   end;
--
--   Result:
--   ---------------------------------------------------------------------------
--   Hello Joe
--   ---------------------------------------------------------------------------
--
--   begin
--       sys.htp.p(apex_escape.striphtml(q'[
--           <html>
--             <head>
--               <title>Web Page</title>
--             </head>
--             <body>
--               <h1>Page Title</h1>
--               <p>
--                   This is some text.
--               </p>
--             </body>
--           </html>
--       ]'));
--   end;
--
--   Result:
--   ---------------------------------------------------------------------------
--   
--           
--             
--               Web Page
--             
--             
--               Page Title
--               
--                   This is some text.
--               
--
--             
--           
--   ---------------------------------------------------------------------------
--
-- See Also:
-- - STRIPHTML(2)
--
-- Since: 22.2
--==============================================================================
function striphtml(
    p_string in varchar2)
    return varchar2 deterministic;

--==============================================================================
-- The STRIPHTML(2) function returns P_STRING (clob) with any HTML tags
-- removed, leaving plain text. Removes all HTML attributes as well.
--
-- Note: this does not distinguish between different types of HTML content;
-- content such as JavaScript and CSS are left intact but the script and css
-- HTML tags are removed.
--
-- Parameters:
-- * p_string:  The input text string.
--
-- Example:
--
--   begin
--       sys.htp.p(apex_escape.striphtml(
--           q'[<p id="greeting">Hello <b>Joe</b></p>]'
--       ));
--   end;
--
--   Result:
--   ---------------------------------------------------------------------------
--   Hello Joe
--   ---------------------------------------------------------------------------
--
--   begin
--       sys.htp.p(apex_escape.striphtml(q'[
--           <html>
--             <head>
--               <title>Web Page</title>
--             </head>
--             <body>
--               <h1>Page Title</h1>
--               <p>
--                   This is some text.
--               </p>
--             </body>
--           </html>
--       ]'));
--   end;
--
--   Result:
--   ---------------------------------------------------------------------------
--   
--           
--             
--               Web Page
--             
--             
--               Page Title
--               
--                   This is some text.
--               
--
--             
--           
--   ---------------------------------------------------------------------------
--
-- See Also:
-- - STRIPHTML(1)
--
-- Since: 22.2
--==============================================================================
function striphtml(
    p_string in clob)
    return clob deterministic;

--##############################################################################
--#
--# Internal:
--#
--##############################################################################

--==============================================================================
-- Internal:
--
-- The INIT procedure can be used to re-initialize internal package state, after
-- HTTP header variables or the current application have been changed. It is for
-- internal use only.
--==============================================================================
procedure init;

end wwv_flow_escape;
/
show errors
