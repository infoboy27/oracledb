Rem  Copyright (c) Oracle Corporation 1999 - 2019. All Rights Reserved.
Rem
Rem    NAME
Rem      check_lovs_for_errors.sql
Rem
Rem    DESCRIPTION
Rem      Checks List of Values defined both inline on an item, and at shared component level for possible execution errors.
Rem
Rem    NOTES
Rem      - This utility should be run via SQL*Plus and connected as your application parsing schema.
Rem
Rem    Arguments:
Rem     Position 1: Application ID you wish to check
Rem     Position 2: APEX user name from the workspace the application belongs to
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      arayner    10/09/2019 - Created

set define '&'
set concat on
set concat .
set verify off
set termout on

define APP_ID       = &1
define APEX_USER    = &2

declare 
    l_context        apex_exec.t_context;
    l_error_count    number := 0;
    l_lov_count      number := 0;
    
    function is_plsql( p_sql_or_plsql in varchar2 ) return boolean is
    begin
        return coalesce( not( upper( substr(trim(p_sql_or_plsql), 1, 6) ) = 'SELECT' or upper(substr(trim(p_sql_or_plsql), 1, 4)) = 'WITH' ), true );
    end is_plsql;
begin 
    apex_session.create_session( &APP_ID, null, '&APEX_USER' );

    for l_lov in ( select *
                      from ( select 'Inline'             lov_type,
                                    application_id       app_id,
                                    page_id              page_id,
                                    item_name            name,
                                    lov_definition       query
                               from apex_application_page_items
                              where lov_definition       is not null
                                and lov_definition       not like 'STATIC%'
                                and lov_definition       not like '.%'
                              union all
                             select 'Shared Component'   lov_type,
                                    application_id       app_id,
                                    null                 page_id,
                                    list_of_values_name  name,
                                    list_of_values_query query
                               from apex_application_lovs
                              where source_type_code     = 'LEGACY_SQL' )
                     where app_id = &APP_ID
                     order by lov_type, app_id, page_id, name
                  )
    loop
        begin 
            l_lov_count := l_lov_count + 1;
            l_context := apex_exec.open_query_context(
                p_location              => 'LOCAL',
                p_sql_query             => case when not is_plsql( l_lov.query) then l_lov.query end,
                p_plsql_function_body   => case when is_plsql( l_lov.query) then l_lov.query end,
                p_max_rows              => 0 );        -- We are not interested in the results, we simple want to see if the query executes without error
            apex_exec.close( l_context );
        exception    
            when others then 
                l_error_count := l_error_count + 1;
                apex_exec.close( l_context );
                sys.dbms_output.put_line( '--------------------' );
                sys.dbms_output.put_line( 'Error #' || l_error_count );
                sys.dbms_output.put_line( 'Application: ' || l_lov.app_id );
                sys.dbms_output.put_line( 'Type:        ' || l_lov.lov_type );
                if l_lov.page_id is not null then 
                    sys.dbms_output.put_line( 'Page:        ' || l_lov.page_id );
                end if;
                sys.dbms_output.put_line( 'Name:        ' || l_lov.name );
                sys.dbms_output.put_line( 'LOV (' || case when is_plsql( l_lov.query ) then 'PL/SQL' else 'SQL' end || '):' ); 
                sys.dbms_output.put_line( l_lov.query );
                sys.dbms_output.put_line( 'Error:       ' || SQLERRM );
                sys.dbms_output.put_line( '' );
        end;
    end loop;
    
    sys.dbms_output.put_line( '--------------------' );
    if l_error_count > 0 then
        sys.dbms_output.put_line( 'Action Required! ' || l_error_count || ' LOV definitions raised an error, please review to see if they need to be fixed to avoid facing the same error in your app at runtime.' );
    else
        sys.dbms_output.put_line( 'No action required! All ' || l_lov_count || ' LOV definitions executed successfully.' );
    end if;

exception    
    when others then 
        apex_exec.close( l_context );
        sys.dbms_output.put_line( SQLERRM );
end;
/