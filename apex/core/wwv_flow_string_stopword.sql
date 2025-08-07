set define '^' verify off
prompt ...wwv_flow_string_stopword.sql
create or replace package wwv_flow_string_stopword as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2018. All Rights Reserved.
--
-- NAME
--   wwv_flow_string_stopword.sql
--
-- DESCRIPTION
--   Stopwords for wwv_flow_string.get_searchable_words.
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  11/28/2018 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
function for_language (
    p_language in varchar2 )
    return wwv_flow_t_varchar2;

end wwv_flow_string_stopword;
/
show err

