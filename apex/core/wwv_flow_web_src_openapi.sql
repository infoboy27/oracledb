set define '^' verify off
prompt ...wwv_flow_web_src_openapi.sql
create or replace package wwv_flow_web_src_openapi authid definer as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2023 Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_web_src_openapi.sql
--
--    DESCRIPTION
--      Parse OpenAPI / Swagger document
--
--
--    MODIFIED   (MM/DD/YYYY)
--    ascheffe    11/21/2022 - Created
--    ascheffe    08/08/2022 - discover_all_openapi
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

--===============================================================================
-- function to parse an OpenAPI file to an array of REST Source discovery results
--
-- Parameters:
-- * p_openapi_json:           the OpenAPI file in JSON format
--
-- Returns:
-- the list of discovery results
--===============================================================================
function discover_all_openapi(
    p_openapi_json in clob )
    return wwv_flow_plugin_api.t_web_source_discover_results;

--==============================================================================
-- REST datasource discovery based on swagger/OpenAPI json document
--==============================================================================
procedure discover_openapi(
    p_openapi_json   in            clob,
    p_result         in out nocopy wwv_flow_plugin_api.t_web_source_discover_result );
	
    
--==============================================================================
-- do some basic validations on the document and 
-- store it in a APEX collection when it is a valid OpenAPI json document
--
-- Parameters:
-- * p_document:           content expected to be a OpenAPI json document
-- * p_collection_name:
--==============================================================================
procedure store_and_validate_openapi(
    p_document        in blob,
    p_collection_name in varchar2 default null );

end wwv_flow_web_src_openapi;
/
show err

set define '^'
