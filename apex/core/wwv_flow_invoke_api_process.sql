set define '^' verify off
prompt ...wwv_flow_invoke_api_process
create or replace package wwv_flow_invoke_api_process as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_invoke_api_process.sql
--
--    DESCRIPTION
--      This package is responsible for handling the Invoke API process types.
--
--    MODIFIED   (MM/DD/YYYY)
--    pawolf      08/11/2022 - Created
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

--==============================================================================
-- Invoke API
--==============================================================================
function invoke_api_process (
    p_process                in wwv_flow_plugin_api.t_process,
    p_error_display_location in varchar2,
    p_error_message          in varchar2 )
    return wwv_flow_plugin_api.t_process_exec_result;

end wwv_flow_invoke_api_process;
/
show errors
