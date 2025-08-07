set define '^' verify off
prompt ...wwv_flow_rest_ws
create or replace package wwv_flow_rest_ws as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2017 - 2020. All Rights Reserved.
--
--    NAME
--      wwv_flow_rest_ws.sql
--
--    DESCRIPTION
--     Manages Processing of the ORDS based REST Workshop
--
--    NOTES
--      This API is unsupported.
--
--    MODIFIED    (MM/DD/YYYY)
--     dgault     10/27/2017 - Created
--     dgault     07/09/1028 - Added run_plsql_as_parse_as_exec to spec
--     dgault     10/08/2018 - Added GET_DB_TYPE function to retireve current Multi-tenant disposition (CDB, PDB$SEED,PDB,NONE)
--     dgault     10/25/2018 - added VALIDATE_URI function
--     dgault     01/22/2019 - Added ENABLE_OBJECT, SCHEMA_IS_ORDS_ENABLED, GET_SCHEMA_ALIAS to support REST enablement in SQL Workshop
--
--------------------------------------------------------------------------------\
--
-- Minimum ORDS version required to enable ORDS REST workshop
    c_ords_major constant number := 17;
    c_ords_minor constant number := 4;
    c_ords_patch constant number := 1;
    c_ords_day constant number := 353;
-----------------------------------------------------------------------
--< PUBLIC METHODS >---------------------------------------------------
-----------------------------------------------------------------------

--< PROCESS_REST_WS >-------------------------------------------------
    procedure process_rest_ws_request (
        p_request    in           varchar2,
        p_parse_as   in           varchar2
    );

--< GET_SCHEMA_ALIAS >----------------------------------------

    function get_schema_alias (
        p_schema in   varchar2
    ) return varchar2;

--< SCHEMA_IS_ORDS_ENABLED >----------------------------------------

    function schema_is_ords_enabled (
        p_schema in   varchar2
    ) return varchar2;
    
--< get_enabled_object >----------------------------------------

    function get_enabled_object (
        p_schema   in         varchar2,
        p_object   in         varchar2
    ) return varchar2;

--< ENABLE_OBJECT >-------------------------------------------------

    procedure enable_object (
        p_enabled          in                 varchar2 default 'TRUE',
        p_schema           in                 varchar2,
        p_object           in                 varchar2,
        p_object_type      in                 varchar2,
        p_object_alias     in                 varchar2,
        p_auto_rest_auth   in                 varchar2 default 'TRUE'
    );

--< ENABLE_SCHEMA >-------------------------------------------------

    procedure enable_schema (
        p_schema          in                varchar2,
        p_enable_access   in                varchar2,
        p_schema_alias    in                varchar2,
        p_auth_required   in                varchar2
    );

--< DROP_REST >-------------------------------------------------

    procedure drop_rest (
        p_schema in   varchar2
    );

--< ORDS_REPO_PRESENT >-------------------------------------------------

    function ords_repo_present return varchar2;

--< ORDS_MIN_VER_MET >--------------------------------------------------

    function ords_min_ver_met (
        p_current_version in   varchar2
    ) return varchar2;

--< ORDS_IS_183_PLUS >--------------------------------------------------

    function ords_is_183_plus (
        p_current_version in   varchar2
    ) return varchar2;

--< MODULE_IS_PROTECTED >-----------------------------------------------

    function module_is_protected (
        p_module_id in   number
    ) return varchar2;

--< TEMPLATE_IS_PROTECTED >-----------------------------------------------

    function template_is_protected (
        p_template_id in   number
    ) return varchar2;

--< GET_DB_TYPE >-------------------------------------------

    function get_db_type return varchar2;

--< GET_ORDS_VERSION >-------------------------------------------

    function get_ords_version (
        p_parse_as in   varchar2
    ) return varchar2;

--< VALIDATE_URI >-------------------------------------------

    function validate_uri (
        p_uri_template in   varchar2
    ) return varchar2;

--==============================================================================
-- Install REST service in a given workspace schema schema.
--==============================================================================
procedure install_in_schema (
    p_code   in clob,
    p_schema in varchar2 );

end wwv_flow_rest_ws;
/
show errors
