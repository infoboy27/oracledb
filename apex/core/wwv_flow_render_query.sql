set define '^' verify off
prompt ...wwv_flow_render_query.sql
create or replace package wwv_flow_render_query as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2005, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_render_query.sql
--
--    DESCRIPTION
--
--    MODIFIED   (MM/DD/YYYY)
--      msewtz    01/26/2005 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Globals
--==============================================================================
g_status                    varchar2(32767);
g_dbms_output               sys.dbms_output.chararr;
g_max_size_reached          boolean := false;

--------------------------------------------------------------------------------
-- get varchar2 array of report results
-- p_owner:                 owner / schema name
-- p_query:                 SQL statement
-- p_format:                HTML or HTMLR (Error in table)
-- p_values:                bind values
-- p_max_size:              maximum size of report rows processed
-- p_max_rows:              number of report rows processed
-- p_limit_type:            'S' for size 'R' for rows
-- p_dbms_output_lines:     number of dbms output lines
--
-- Used by f4500 - SQL Commands (1200)
--------------------------------------------------------------------------------
function get_report(
    p_owner             in varchar2,
    p_query             in clob,
    p_format            in varchar2                 default 'HTML',
    p_values            in wwv_flow_global.vc_arr2  default wwv_flow_global.c_empty_vc_arr2,
    p_max_size          in number                   default 10000000,
    p_max_rows          in number                   default 10,
    p_limit_type        in varchar2                 default 'S',
    p_dbms_output_lines in number                   default 10000000 )
    return wwv_flow_global.vc_arr2;

end wwv_flow_render_query;
/
show err
