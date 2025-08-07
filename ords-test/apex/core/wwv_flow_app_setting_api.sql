set define '^' verify off
prompt ...wwv_flow_app_setting_api
create or replace package wwv_flow_app_setting_api as
------------------------------------------------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--  The `APEX_APP_SETTING` package provides utilities you can use when programming 
-- in the Oracle APEX environment related to application setting shared components.
--  You can use the `APEX_APP_SETTING` package to get and set the value of application settings.
------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Public type definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public constant definitions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Global variables
--------------------------------------------------------------------------------

--==============================================================================
-- This procedure changes the application setting value in the current application.
-- If the setting is subscribed from another app, this API will not update the setting value. 
-- If the setting is subscribed and `p_raise_error` is set to `TRUE`, this API raises an error.
--
-- Parameters:
-- * p_name:        The case insensitive name of the application setting. 
--                  An error is raised if:
--                  - the application setting name does not exist.
--                  - the build option associated with the application setting is disabled.
-- * p_value:       The value of the application setting. 
--                  An error is raised if:
--                  - The value is set to required, but null value passed.
--                  - The valid values are defined, but the value is not in one of the
--                    valid values.
-- * p_raise_error: If set to`TRUE` and an error occurs, then this procedure raises an error message.
--                  If set to `FALSE`, all error messages are suppressed.
--                  In either case, this API never updates application setting values when an error occurs.
--
-- Example:
--
-- The following example shows how to use the `SET_VALUE` procedure
-- to set the value of application setting `ACCESS_CONTROL_ENABLED`.
--
--     begin
--         apex_app_setting.set_value (
--             p_name  => 'ACCESS_CONTROL_ENABLED',
--             p_value => 'Y' );
--     end;
--==============================================================================
procedure set_value (
    p_name        in varchar2,
    p_value       in varchar2 default null,
    p_raise_error in boolean  default false );
--
--==============================================================================
-- This function gets the application setting value in the current application.
--
-- Parameters:
-- * p_name:        The case insensitive name of the application setting.  An error is raised if:
--                  - the application setting name does not exist.
--                  - if the build option associated with the application setting is disabled.
-- * p_raise_error:	If set to `TRUE`, the procedure raises an error if an application setting 
--                  with the passed name does not exist.
-- Example:
--
-- The following example shows how to use the `GET_VALUE` function to retrieve
-- the value of application setting `ACCESS_CONTROL_ENABLED`.
--
--     declare
--          l_value varchar2(4000);
--      begin
--         l_value := apex_app_setting.get_value (
--                        p_name => 'ACCESS_CONTROL_ENABLED' );
--     end;
--==============================================================================
function get_value (
    p_name        in varchar2,
    p_raise_error in boolean default false )
    return varchar2;

end wwv_flow_app_setting_api;
/
show errors;
