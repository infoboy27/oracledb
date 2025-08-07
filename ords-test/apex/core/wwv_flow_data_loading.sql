set define '^' verify off
prompt ...wwv_flow_data_loading.sql
create or replace package wwv_flow_data_loading as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2020, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_data_loading.sql
--
--    DESCRIPTION
--      Implementation for the data loading process type
--
--
--    MODIFIED   (MM/DD/YYYY)
--    cczarski    12/07/2020 - created
-- 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--======================================================================================================================
-- returns the file profile ( determinded by the data loading definition )in JSON format
-- based on its static ID
--
-- PARAMETERS:
-- * p_application_id       application ID
-- * p_static_id            static ID of the load definition to find
--
-- RETURNS
-- Returns file profile computed from the data load definition in JSON format.
--======================================================================================================================
function get_file_profile (
    p_application_id   in number      default wwv_flow.g_flow_id,
    p_static_id        in varchar2 )
    return clob;

--==============================================================================
-- finds a data load definition ID, based on its static ID
--
-- PARAMETERS:
-- * p_application_id       application ID
-- * p_static_id            static ID of the load definition to find
--
-- RETURNS
-- ID of the load definition
--==============================================================================
function find_data_load_id(
    p_application_id  in number,
    p_static_id       in varchar2 )
    return number;

--==============================================================================
-- loads data in CLOB or BLOB, based on the references data loading definition
--
-- PARAMETERS:
-- * p_load_id              ID of the loading definition to use
-- * p_data_blob            data to load (use for BLOB data)
-- * p_data_clob            data to load (use for CLOB data)
-- * p_xlsx_sheet_name      name of the worksheet to extract for XLSX files
--
-- RETURNS:
-- status information about processed and error rows.
--==============================================================================
function perform_data_loading (
    p_load_id         in number,
    p_data_blob       in blob     default null,
    p_data_clob       in clob     default null,
    p_xlsx_sheet_name in varchar2 default null )
    return wwv_flow_data_loading_api.t_data_load_result;

--==============================================================================
-- executes the data loading process
--==============================================================================
function load_data_process (
    p_process                in wwv_flow_plugin_api.t_process,
    p_error_message          in varchar2,
    p_error_display_location in varchar2 )
    return wwv_flow_plugin_api.t_process_exec_result;

end wwv_flow_data_loading;
/
show err

set define '^'

