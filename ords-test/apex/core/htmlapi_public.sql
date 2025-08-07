set define '^' verify off
prompt ...wwv_flow_html_api
create or replace package wwv_flow_html_api as
--==============================================================================
--
-- NAME
--   htmlapi_public.sql
--
-- MODIFIED (MM/DD/YYYY)
--  sdillon  05/24/2001 - Created
--==============================================================================

--==============================================================================
-- *** API Deprecated, use wwv_flow_imp_shared.create_app_static_file and create_workspace_static_file instead ***
--==============================================================================
function new_html_repository_record(
    p_name                  in out varchar2,
    p_varchar2_table            in sys.dbms_sql.varchar2_table,
    p_mimetype                  in varchar2,
    p_flow_id                   in number,
    p_notes                     in varchar2)
    return number
    ;
    
--==============================================================================
-- *** API Deprecated ***
--==============================================================================
procedure remove_html(
    p_html_name in varchar2,
    p_flow_id   in number   default null)
    ;
end wwv_flow_html_api;
/
show error
