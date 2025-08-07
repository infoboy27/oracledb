set define '^' verify off
prompt ...wwv_flow_object_dependency_dev
create or replace package wwv_flow_object_dependency_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--  NAME
--    wwv_flow_object_dependency_dev.sql
--
--  DESCRIPTION
--    Generates base data for object dependency reports
--
--  MODIFIED   (MM/DD/YYYY)
--  JPKEMP      02/19/2024 - Created
--
--------------------------------------------------------------------------------
 
--==============================================================================
-- Global types
--==============================================================================
 
--==============================================================================
-- Constants
--==============================================================================

--==============================================================================
-- Globals
--==============================================================================
   
--==============================================================================
-- Removes all dependency report data for a given application
--
-- Parameters:
-- * p_application_id        : ID of the application for which cache should be
--                             cleared
-- * p_page_id               : ID of the page to clear the cache for (default is
--                             all pages and shared components)
-- * p_reset_last_analyzed_at: if true (default), reset the
--                             application last_dependency_analyzed_at to null
--
--==============================================================================
procedure clear_cache (
    p_application_id         in number,
    p_page_id                in number  default null,
    p_reset_last_analyzed_at in boolean default true );

--==============================================================================
-- Generates data for object dependency report
--
-- Parameters:
-- * p_application_id: ID of the application which should be analyzed
-- * p_page_id       : Set this parameter to analyze a single page of an
--                     application
-- * p_clear_cache   : True means clear_cache before starting the analysis
--                     Otherwise, re-use existing cached data where possible
-- * p_options       : 'ALL' to scan all sources (default).
--
--                     'DEPENDENCIES' to scan for top-level dependencies (via
--                      dba_dependencies) only.
--
--                     'IDENTIFIERS' to scan for detailed dependencies (via
--                     PL/Scope) where available. This allows detection of
--                     dependencies on columns in tables and views, and member
--                     functions and procedures within packages compiled with
--                     'identifiers:all'.
--
--                     'ERRORS' to scan neither (report compilation errors
--                     only).
--
--==============================================================================
procedure scan (
    p_application_id in number,
    p_page_id        in number   default null,
    p_clear_cache    in boolean  default false,
    p_options        in varchar2 default wwv_flow_object_dependency_api.c_option_all );

--==============================================================================
-- Get the data_default for a column
--==============================================================================
function get_data_default(
    p_owner       in varchar2,
    p_table_name  in varchar2,
    p_column_name in varchar2 )
    return varchar2;

end wwv_flow_object_dependency_dev;
/
show err