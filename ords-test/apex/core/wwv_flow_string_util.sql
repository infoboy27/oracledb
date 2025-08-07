set define '^' verify off
prompt ...wwv_flow_string_util.sql
create or replace package wwv_flow_string_util as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
-- NAME
--   wwv_flow_string_util.sql - apex_string_util
--
-- DESCRIPTION
--   Additional string related utilities.
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             YES
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  12/10/2019 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- This function can be used to tokenize the input. It replaces white space and
-- special characters with the given whitespace character. It also lower-cases
-- the input. If p_original_find contains '.' or '#', these characters are also
-- replaced by white space.
--
-- PARAMETERS
-- * p_string:               The input string.
-- * p_original_find:        A set of characters that were already found in a
--                           preceding search operation.
-- * p_whitespace_character: The separator character.
--
-- RETURNS
-- * The input string in lower case, with all special characters replaced.
--
-- EXAMPLE
--   select apex_string_util.replace_whitespace('foo: Bar...Baz') from dual
--   -> |foo|bar|baz|
--   select apex_string_util.replace_whitespace('foo: Bar...Baz',null,'*') from dual
--   -> *foo*bar*baz*
--   select apex_string_util.replace_whitespace('foo: Bar...Baz','.','*') from dual
--   -> *foo*bar...baz*
--==============================================================================
function replace_whitespace (
    p_string               in varchar,
    p_original_find        in varchar2 default null,
    p_whitespace_character in varchar2 default '|')
    return varchar2;

--==============================================================================
-- Returns a file name's extension.
--
-- PARAMETERS
-- * p_filename: The filename.
--
-- RETURNS
-- * The file name's extension in lower case.
--
-- EXAMPLE
--   select apex_string_util.get_file_extension('foo.pPtx') from dual
--   -> pptx
--   select apex_string_util.get_file_extension('PLEASE.READ.ME.TXT') from dual
--   -> txt
--==============================================================================
function get_file_extension (
    p_filename      in varchar2 )
    return varchar2;

--==============================================================================
-- DEPRECATED. Use get_file_extension instead.
--==============================================================================
function find_file_extension (
    p_filename      in varchar2 )
    return varchar2;

--==============================================================================
-- Return whether the given phrase is in p_string.
-- The search is case insensitive, it also ignores white space and special
-- characters.
--
-- PARAMETERS
-- * p_phrase: The given phrase.
-- * p_string: The input string.
--
-- RETURNS
-- * True if the phrase was found, False otherwise.
--
-- EXAMPLE
--   declare
--       l_phrase varchar2(4000) := 'sqldeveloper';
--       l_string varchar2(4000) := 'how now brown cow sqldeveloper? sql developer.';
--   begin
--       if apex_string_util.phrase_exists(l_phrase,l_string) then
--           dbms_output.put_line('found');
--       else
--           dbms_output.put_line('NOT found');
--       end if;
--   end;
--   /
--   -> found
--==============================================================================
function phrase_exists (
    p_phrase in varchar2,
    p_string in varchar2 )
    return boolean;

--==============================================================================
-- DEPRECATED. Use phrase_exists instead.
--==============================================================================
function find_phrase (
    p_phrase in varchar2,
    p_string in varchar2 )
    return boolean;

--==============================================================================
-- Find the occurrences of p_string in p_phrase return in an array.
-- The search is case insensitive, it also ignores white space and special
-- characters.
--
-- PARAMETERS
-- * p_phrases: A table of phrases.
-- * p_string:  The input string.
--
-- RETURNS
-- * An array of phrases that were found, without duplicates.
--
-- EXAMPLE
--   declare
--       l_phrases apex_t_varchar2 := apex_t_varchar2();
--       l_arr     apex_t_varchar2 := apex_t_varchar2();
--       l_string varchar2(4000) := 'how now brown cow';
--   begin
--       apex_string.push(l_phrases,'brown');
--       apex_string.push(l_phrases,'cow');
--       apex_string.push(l_phrases,'brown cow');
--       l_arr := apex_string_util.find_phrases(l_phrases,l_string);
--   end;
--   /
--   -> apex_t_varchar2('brown','cow','brown cow')
--==============================================================================
function find_phrases (
    p_phrases in wwv_flow_t_varchar2,
    p_string  in varchar2 )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Finds all email addresses in the given input string.
--
-- PARAMETERS
-- * p_string: The input string.
--
-- RETURNS
-- * An array of email addresses, without duplicates.
--
-- EXAMPLE
--   declare
--       l_string  varchar2(32767) := 'b@c.it hello this hello.world@example.com is text b@c.it includes the '||
--                                    'michael.h@example.com email address and x.y.z@m.io';
--       l_results apex_t_varchar2;
--   begin
--      l_results := apex_string_util.find_email_addresses(l_string);
--   end;
--   /
--   -> apex_t_varchar2 (
--          'b@c.it',
--          'hello.world@example.com',
--          'michael.h@example.com',
--          'x.y.z@m.io' )
--==============================================================================
function find_email_addresses (
    p_string in varchar2 )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Finds first occurrance of "From: " and the first email after the "From:".
--
-- PARAMETERS
-- * p_string: The input string.
--
-- RETURNS
-- * The from address.
--
-- EXAMPLE
--   declare
--       l_string  varchar2(32767) := 'From: Marc Sample <marc.sample@example.com>'||chr(10)||
--                                    'Subject: Status Meeting'||chr(10)||
--                                    'Date';
--       l_result varchar2(4000);
--   begin
--      l_result := apex_string_util.find_email_from(l_string);
--      dbms_output.put_line('from = "'||l_result||'"');
--   end;
--   /
--   declare
--       l_string  varchar2(32767) := 'Elmar J. Fud <elmar.fud@example.com> wrote:';
--       l_result varchar2(4000);
--   begin
--      l_result := apex_string_util.find_email_from(l_string);
--      dbms_output.put_line('from = "'||l_result||'"');
--   end;
--   /
--   -> from = "marc.sample@example.com"
--==============================================================================
function find_email_from (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
-- Find the subject text in a given email string.
--
-- PARAMETERS
-- * p_string: The input string.
--
-- RETURNS
-- * The subject line
--
-- EXAMPLE
--   declare
--       l_string  varchar2(32767) := 'From: Marc Sample <marc.sample@example.com>'||chr(10)||
--                                    'Subject: Status Meeting'||chr(10)||
--                                    'Date';
--       l_result varchar2(4000);
--   begin
--      l_result := apex_string_util.find_email_subject(l_string);
--      dbms_output.put_line('Subject = "'||l_result||'"');
--   end;
--   /
--   -> Subject = "Status meeting"
--==============================================================================
function find_email_subject (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
-- Find all strings prefixed with a tag identifier.
-- The search is case insensitive, it also ignores white space and special
-- characters.
--
-- PARAMETERS
-- * p_string:          The input string. Max 32765 bytes.
-- * p_prefix:          The tag prefix (default '#').
-- * p_exclude_numeric: If true (the default), exclude values that only consist
--                      of the tag identifier and digits.
--
-- RETURNS
-- * The found tags, in upper case.
--
-- EXAMPLE
--   declare
--      l_tags   apex_t_varchar2;
--      l_string varchar2(4000) := 'how now #orclapex @mike brown #cow';
--   begin
--      l_tags := apex_string_util.find_tags(l_string);
--      l_tags := apex_string_util.find_tags(l_string, '@');
--   end;
--   /
--   -> apex_t_varchar2('#ORCLAPEX','#COW')
--   -> apex_t_varchar2('@MIKE')
--==============================================================================
function find_tags (
    p_string          in varchar2,
    p_prefix          in varchar2 default '#',
    p_exclude_numeric in boolean  default true )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Find https and http hypertext links within text. Case of URL is preserved,
-- protocol is returned in lower case.
--
-- PARAMETERS
-- * p_string:     The input string.
-- * p_https_only: If true (default false), only return https:// links.
--
-- RETURNS
-- * Array of links.
--
-- EXAMPLE
--   declare
--       l_string  varchar2(32767) := 'http://example1.com i example2.com like https://example3.com '||
--                                    'and <a href="https://example4.com"> and http://example5.com';
--       l_results apex_t_varchar2;
--   begin
--      l_results := apex_string_util.find_links(l_string,false);
--   end;
--   /
--   -> apex_t_string (
--          'https://example3.com',
--          'https://example4.com',
--          'http://example1.com',
--          'http://example5.com' )
--==============================================================================
function find_links (
    p_string     in varchar2,
    p_https_only in boolean  default false )
    return wwv_flow_t_varchar2;

--==============================================================================
-- Extract domain from a link or email.
--
-- PARAMETERS
-- * p_string: The input string.
--
-- RETURNS
-- * Domain from a url or email.
--
-- EXAMPLE
--   select apex_string_util.get_domain('https://apex.oracle.com/en/platform/low-code/') from dual
--   -> apex.oracle.com
--==============================================================================
function get_domain (
    p_string in varchar2 )
    return varchar2;

--==============================================================================
-- Given an identifiers prefix, find the identifiers including consecutive
-- numbers following. The search is case insensitive, it also ignores white
-- space and special characters.
--
-- PARAMETERS
-- * p_string: The input string.
-- * p_prefix: The identifer prefix.
--
-- RETURNS
-- * An array of identifers present in a string.
--
-- EXAMPLE
--   declare
--       l_string  varchar2(32767) :=
--       'ORA-02291: integrity constraint (A.B.C) violated - parent key not found '||
--       'SR # 3-17627996921 bug: 23423 feature 100022 and feature: 1000001 rptno=28487031 sr# 1111111,  '||
--       ' i have filed bug 27911887.';
--       l_results apex_t_varchar2;
--   begin
--      l_results := apex_string_util.find_identifiers(l_string,'ORA-',true);
--      l_results := apex_string_util.find_identifiers(l_string,'sr ',true);
--      l_results := apex_string_util.find_identifiers(l_string,'feature ',true);
--      l_results := apex_string_util.find_identifiers(l_string,'bug ',true);
--      l_results := apex_string_util.find_identifiers(l_string,'rptno=',true);
--   end;
--   /
--   -> apex_t_varchar2('ORA-02291')
--   -> apex_t_varchar2('SR 3-17627996921','SR 1111111')
--   -> apex_t_varchar2('FEATURE 100022','FEATURE 1000001')
--   -> apex_t_varchar2('BUG 23423','BUG 27911887')
--   -> apex_t_varchar2('RPTNO=28487031')
--==============================================================================
function find_identifiers (
     p_string in varchar2,
     p_prefix in varchar2 )
     return wwv_flow_t_varchar2;

--==============================================================================
-- Return a friendly file size, given a size in bytes (e.g. 5.1MB or 6GB).
--
-- PARAMETERS
-- * p_string: The input string.
--
-- RETURNS
-- * The file size with a unit.
--
-- EXAMPLE
--   select apex_string_util.to_display_filesize(1312312312) from dual;
--   -> 1.2GB
--==============================================================================
function to_display_filesize (
    p_size_in_bytes in number )
    return varchar2;

--==============================================================================
-- Convert the input string to a "-" separated string, with special characters
-- removed.
--
-- PARAMETERS
-- * p_string:      The input string.
-- * p_hash_length: If > 0 (default 0), append a hash of the current timestamp
--                  to make the result unique.
--
-- EXAMPLE
--   select apex_string_util.get_slug('hey now, brown cow! 1') from dual;
--   -> hey-now-brown-cow-1
--
--   select apex_string_util.get_slug('hey now, brown cow! 1',4) from dual;
--   -> hey-now-brown-cow-1-3486
--==============================================================================
function get_slug (
    p_string      in varchar2,
    p_hash_length in pls_integer default 0 )
    return varchar2;

--==============================================================================
-- DEPRECATED. Use get_slug instead.
--==============================================================================
function to_slug (
    p_string      in varchar2,
    p_hash_length in pls_integer default 0 )
    return varchar2;

--==============================================================================
-- Compute the difference between tables of lines. The implementation uses the
-- default version of the longest common subexpression algorithm, without any
-- optimizations. It is not intended for very large inputs. The output is
-- similar to the unified diff format.
--
-- PARAMETERS
-- * p_left:    The lines in the "left" table.
-- * p_right:   The lines in the "right" table.
-- * p_context: The number of same lines after each diff that should also be
--              returned (default 3).
--
-- RESULT
-- * A table of varchar2, where the first character denotes the type of diff:
--   - "@": Line numbers on left and right hand side.
--   - " ": Context, left and right hand side are equal.
--   - "-": Line is in left hand side, but not in right hand side.
--   - "+": Line is in right hand side, but not in left hand side.
--
-- EXAMPLE
--   Compute the diff between the given tables.
--
--   select apex_string_util.diff (
--              p_left  => apex_t_varchar2('how','now','brown','cow'),
--              p_right => apex_t_varchar2('what','now','brown','cow',1,2,3) )
--     from sys.dual;
--
--   -> apex_t_varchar2 (
--          '@@ 1,0 @@',
--          '-how',
--          '@@ 1,1 @@',
--          '+what',
--          ' now',
--          ' brown',
--          ' cow',
--          '@@ 4,5 @@',
--          '+1',
--          '+2',
--          '+3' )
--==============================================================================
function diff (
    p_left    in wwv_flow_t_varchar2,
    p_right   in wwv_flow_t_varchar2,
    p_context in pls_integer default 3 )
    return wwv_flow_t_varchar2;

end wwv_flow_string_util;
/
show err

