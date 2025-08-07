set define '^' verify off
prompt ...wwv_flow_exec_web_src_boss.sql
create or replace package wwv_flow_exec_web_src_boss as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2023 - 2024. All Rights Reserved.
--
--    NAME
--      wwv_flow_exec_web_src_boss.sql
--
--    DESCRIPTION
--      Web source (plug-in) implementation for BOSS REST Services
--
--
--    MODIFIED   (MM/DD/YYYY)
--    smuench     11/30/2023 - APEX-9081 Native Support for BOSS REST Services
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constants for BOSS Query String Parameters
--------------------------------------------------------------------------------
c_qstr_fields             constant varchar2(7)        := '$fields';
c_qstr_limit              constant varchar2(6)        := '$limit';
c_qstr_offset             constant varchar2(7)        := '$offset';
c_qstr_filter             constant varchar2(7)        := '$filter';
c_qstr_keywords           constant varchar2(9)        := '$keywords';
c_qstr_sortby             constant varchar2(7)        := '$sortBy';
c_qstr_totalRows          constant varchar2(18)       := '$includeTotalItems';

--------------------------------------------------------------
-- Constants for remote data types
--------------------------------------------------------------
c_boolean                      constant varchar2(7)   := 'boolean';

--------------------------------------------------------------------------------
-- Constants for UTL_HTTP authentication header propagation on temp redirect
--------------------------------------------------------------------------------
c_utl_http_auth_flag_header    constant varchar2(21)        := 'X-UTL_HTTP-AUTH_SCOPE';

--------------------------------------------------------------------------------
-- Constants for resource key
--------------------------------------------------------------------------------
c_context_key_attr_name        constant varchar2(17)  := 'APEX$ResourceKey';
c_context_key_attr_colname     constant varchar2(17)  := upper(c_context_key_attr_name);
c_context_key_selector         constant varchar2(20)  := '$id';
c_quoted_context_key_selector  constant varchar2(20)  := '"$id"';

--------------------------------------------------------------------------------
-- Constants for etag
--------------------------------------------------------------------------------
c_context_etag_attr_name       constant varchar2(9)   := 'APEX$ETag';
c_context_etag_attr_colname    constant varchar2(9)   := upper(c_context_etag_attr_name);
c_context_attr                 constant varchar2(8)   := '$context';
c_etag_attr                    constant varchar2(4)   := 'etag';
c_context_etag_selector        constant varchar2(13)  := c_context_attr||'.'||c_etag_attr;

--------------------------------------------------------------------------------
-- Constants for HTTP headers and URL encoding
--------------------------------------------------------------------------------
c_application_json             constant varchar2(16)  := 'application/json';

--------------------------------------------------------------------------------
-- Constants for data profile column annotation tags
--------------------------------------------------------------------------------
c_primary_key_flag             constant varchar2(8)   := 'RemotePK';
c_accessor_foreign_key_flag    constant varchar2(10)  := 'AccessorFK';
c_change_never_flag            constant varchar2(8)   := 'ReadOnly';
c_change_create_flag           constant varchar2(10)  := 'CreateOnly';
c_required_flag                constant varchar2(8)   := 'Required';
c_def_val_expr_flag            constant varchar2(10)  := 'HasDefault';
c_composite_flag               constant varchar2(9)   := 'Composite';
c_sortable_flag                constant varchar2(8)   := 'Sortable';
c_subtype_flag                 constant varchar2(7)   := 'Subtype';
c_etag_flag                    constant varchar2(7)   := 'ETag';

--------------------------------------------------------------------------------
-- Constants for HTTP headers and URL encoding
--------------------------------------------------------------------------------
c_rest_content_type            constant varchar2(22)  := 'Content-Type';
c_utf8                         constant varchar2(4)   := 'UTF8';

--------------------------------------------------------------------------------
-- Constants for BOSS Header Parameters
--------------------------------------------------------------------------------
c_location_header         constant varchar2(8)        := 'Location';

--------------------------------------------------------------------------------
-- Constants for BOSS Resource Types (Attribute05)
--------------------------------------------------------------------------------
c_business_object         constant varchar2(15)       := 'BUSINESS_OBJECT';
c_search_view             constant varchar2(11)       := 'SEARCH_VIEW';
c_extraction_view         constant varchar2(15)       := 'EXTRACTION_VIEW';

--------------------------------------------------------------------------------
-- Constants for BOSS URL parsing becuase some locales have issues with "[a-z]"
--------------------------------------------------------------------------------
c_start_of_string              constant varchar2(1)   := '^';
c_lowercase_iso_letters        constant varchar2(26)  := 'abcdefghijklmnopqrstuvwxyz';
c_uppercase_iso_letters        constant varchar2(26)  := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
c_locale_path_seg_regexp       constant varchar2(255) := c_start_of_string||
                                                         wwv_flow_string.format('\$[%s][%s](-[%s][%s])?$',
                                                                                    c_lowercase_iso_letters,
                                                                                    c_lowercase_iso_letters,
                                                                                    c_uppercase_iso_letters,
                                                                                    c_uppercase_iso_letters);

--------------------------------------------------------------------------------
-- Constant for detecting BOSS version URL path segment
--
-- versionWithDeploymentPattern from oracle.boss.rest.RestConstants
--
-- Pattern which matches version segment in URL. Version segment is supposed to contain version,
-- optionally followed by deploymentId, where version and deploymentId are separated by a colon.
-- Examples of strings matching this pattern:- v1, 1.0, v1:1000, 1.0:abcd
-- For simplicity, deployment id is recognized as a set of characters where each character is not : or /
--------------------------------------------------------------------------------
c_version_segment_regexp constant varchar2(255) := c_start_of_string||'v?(0|[1-9]\d*)(\.(0|[1-9]\d*))?(:[^:/]*)?$';

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure capabilities_boss (
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_capabilities );

--======================================================================================================================
-- Web Source Module Plug-In fetch procedure
--======================================================================================================================
procedure fetch_boss (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_fetch_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_fetch_result );

--======================================================================================================================
-- Web Source Module Plug-In dml procedure
--======================================================================================================================
procedure dml_boss (
    p_plugin     in            wwv_flow_plugin_api.t_plugin,
    p_web_source in            wwv_flow_plugin_api.t_web_source,
    p_params     in            wwv_flow_plugin_api.t_web_source_dml_params,
    p_result     in out nocopy wwv_flow_plugin_api.t_web_source_dml_result );
    
end wwv_flow_exec_web_src_boss;
/
show err

set define '^'
