set define '^' verify off
prompt ...wwv_flow_epg_include_modules
create or replace package wwv_flow_epg_include_modules as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--    NAME
--      wwv_flow_epg_include.sql
--
--    DESCRIPTION
--      The authorize function in this package implements the PL/SQL "inclusion
--      list" for Oracle APEX. The package must be referenced by name
--      in the web listener.
--
--      Users can add custom entry points by calling
--      apex_instance_admin.add_web_entry_point.
--
--      Not recommended, but still supported for backwards compatibility: Users
--      can also overwrite the global function wwv_flow_epg_include_mod_local to
--      customize public entry points. Authorize() calls this function when it
--      can not find the given procedure name in the list of public APEX entry
--      points.
--
--    WEB TIER CONFIGURATION
--      With mod_plsql, add this line to the DAD:
--
--        PlsqlRequestValidationFunction wwv_flow_epg_include_modules.authorize
--
--      With EPG, call (automatically done in apex_epg_config.sql)
--
--        dbms_epg.set_dad_attribute('APEX','request-validation-function','wwv_flow_epg_include_modules.authorize');
--
--      or add this to the XDB config file:
--
--        <request-validation-function xmlns="http://xmlns.oracle.com/xdb/xdbconfig.xsd">
--          wwv_flow_epg_include_modules.authorize
--        </request-validation-function>
--
--      With ORDS (APEX Listener), add this line to defaults.xml:
--
--        <entry key="security.requestValidationFunction">
--          wwv_flow_epg_include_modules.authorize
--        </entry>
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             YES
--
--    MODIFIED   (MM/DD/YYYY)
--      sspadafo  11/22/2005 - Created
--      sspadafo  11/26/2005 - revised
--      sspadafo  12/02/2005 - changed from standalone function to package
--      mhichwa   12/08/2005 - Changed name to application express
--      cneumuel  06/27/2014 - In authorize: restrict to global procedures and specific package procedures (bug #18846680)
--      cneumuel  04/26/2016 - Added authorize_in_apex,reset (bug #23141159)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Table of colon-separated HTTP request methods, indexed by procedure name.
--==============================================================================
subtype t_request_methods is varchar2(100);
type t_entry_points is table of t_request_methods index by varchar2(60);

--==============================================================================
-- Return all defined entry points to the APEX engine (e.g. F, WWV_FLOW.ACCEPT,
-- ...).
--==============================================================================
function get_apex_entry_points
    return t_entry_points
    result_cache;

--==============================================================================
-- Return a colon-separated list of HTTP request methods (e.g. 'GET:POST') that
-- have been authorized for the given procedure_name. If null, no methods are
-- supported.
--==============================================================================
function authorized_methods (
    procedure_name in varchar2)
    return t_request_methods;

--==============================================================================
-- Return whether procedure_name is authorized as a public entry point, i.e.
-- whether authorized_methods(procedure_name) is not null.
--==============================================================================
function authorize(
    procedure_name in varchar2)
    return boolean;

--==============================================================================
-- Return whether a call to authorize() failed.
--==============================================================================
function has_authorize_failed
    return boolean;

--==============================================================================
-- Validate entry point from within APEX.
--==============================================================================
procedure authorize_in_apex;

--==============================================================================
-- Reset internal cache
--==============================================================================
procedure reset;

end wwv_flow_epg_include_modules;
/
show errors
