set define '^' verify off
prompt ...wwv_flow_query_builder
create or replace package wwv_flow_query_builder as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2005, 2023, Oracle and/or its affiliates.
--
--  NAME
--    wwv_flow_query_builder.sql 
--
--  DESCRIPTION
--    This package for for use in the query builder. 
--
--  MODIFIED   (MM/DD/YYYY)
--    skutz     01/19/2005 - Created 
--
--------------------------------------------------------------------------------
         
--
-- check if a user has access on a schema
--
procedure check_priv (p_schema in varchar2);

--
-- renders the HTML for the query builder to add tables.
--
procedure renderTableV2(p_object_id varchar2, p_count number);

--
-- generates the javascript from meta data
--
procedure loadQuery;

--
-- renders the clone row headers
--
procedure renderCloneRow;

   
end wwv_flow_query_builder;
/
show errors;
