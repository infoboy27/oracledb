set define '^' verify off
prompt ...wwv_flow_lov_api
create or replace package wwv_flow_lov_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2024. All Rights Reserved.
--
--    NAME
--      wwv_flow_lov_api.sql
--
--    DESCRIPTION
--      Public API for LOV related functions
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    04/04/2019 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------


--======================================================================================================================
-- Function used by IG to split up a multi value string into a wwv_flow_t_temp_lov_data for further processing.
--
-- PARAMETERS
-- * p_values             String with values
-- * p_separator          Separator char to use, defaults to ":"
-- * p_populate_display:  Whether to populate the LOV display value as well
-- * p_multi_value_type:  Type of the multi value (separated or json-array)
--
-- RETURNS
--     array of LOV values as instance of wwv_flow_t_temp_lov_data type
--======================================================================================================================
function get_multi_value_lov_data (
    p_values           in varchar2,
    p_separator        in varchar2                             default ':',
    p_populate_display in varchar2                             default 'N',
    p_multi_value_type in wwv_flow_exec_api.t_multi_value_type default wwv_flow_exec_api.c_multi_value_separated )
    return wwv_flow_t_temp_lov_data;

--======================================================================================================================
-- fetches Display and Return values for a shared LOV based on a remote data source.
--
-- PARAMETERS
-- * p_lov_id       Shared LOV ID to fetch data from
-- * p_return_value If given, only data for this return value is fetched. 
--
-- RETURNS
--     Display and return values as the wwv_flow_t_temp_lov_data table type.
--======================================================================================================================
function get_remote_lov_data( 
    p_lov_id       in number,
    p_return_value in varchar2 default null ) return wwv_flow_t_temp_lov_data pipelined;

--======================================================================================================================
-- evaluates a filter on the LOV data and returns 'Y' or 'N'. To be used in a region SQL Query
-- for columns with multiple values enabled (e.g. Interactive Grid "Checkbox" or "Shuttle" columns).
--
-- PARAMETERS
-- * p_lov_data                  LOV data to evaluate the filter on
-- * p_filter_type               Type of the filter to apply. Use the constants defined in wwv_flow_exec_api
--                               Numeric or Datetime filters like gt, gte, lt, gte or between are not supported
-- * p_filter_values             Filter values. For the IN or NOT_IN filter, the values are be expected with
--                               CHR(1) as the separator character.
-- * p_null_result               result to be returned if the LOV is NULL or contains no items
-- * p_case_sensitive            whether to evaluate the filter case-sensitive or not
-- * p_column_case               whether to assume that the LOV values are mixed case ("M"), lower case ("L") or
--                               upper case ("U")
-- * p_filter_search_operator    The search operator to use for a row search filter. Use the 
--                               wwv_flow_exec_api.t_search_operator constants here.
--
-- RETURNS
--     filter evaluation result: 'N' or 'Y'
--======================================================================================================================
function evaluate_filter(
    p_lov_data                in wwv_flow_t_temp_lov_data,
    p_filter_type             in wwv_flow_exec_api.t_filter_type,
    p_filter_values           in varchar2                               default null,
    p_null_result             in varchar2                               default 'N',
    p_case_sensitive          in varchar2                               default 'N',
    p_column_case             in varchar2                               default 'M',
    p_filter_search_operator  in wwv_flow_exec_api.t_search_operator    default null )
    return varchar2;

--======================================================================================================================
-- INTERNAL USE ONLY - do not document.
--======================================================================================================================
-- fetches Display and Return values for a static LOV, which has already been pre-processed by wwv_flow_lov.
--
-- PARAMETERS
-- * p_lov_cache_idx   Cache Index of a pre-processed static LOV
--
-- RETURNS
--     Display and return values as the wwv_flow_t_temp_lov_data table type.
--======================================================================================================================
function get_static_lov_data( p_lov_cache_idx in pls_integer ) return wwv_flow_t_temp_lov_data;

--
--
end wwv_flow_lov_api;
/
show errors
