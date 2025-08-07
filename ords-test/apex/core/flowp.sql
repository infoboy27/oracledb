set define '^' verify off
prompt ...wwv_flow_preferences
create or replace package wwv_flow_preferences as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 1999 - 2022. All Rights Reserved.
--
--    DESCRIPTION
--      Flow Preferences utility functions
--
--    SECURITY
--
--    NOTES
--      Use to save information specific to a user.
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   10/18/1999 - Created (based on wwv_cal_preferences)
--
--------------------------------------------------------------------------------
empty_vc_arr wwv_flow_global.vc_arr2;

--==============================================================================
procedure set_preference (
    p_preference   in varchar2 default null,
    p_value        in varchar2 default null,
    p_user         in varchar2 default null,
    p_force_upper  in boolean  default false );

--==============================================================================
procedure set_preferences (
    p_preferences  in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_values       in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_user         in varchar2 default null );
--==============================================================================
function get_preference (
    p_preference   in varchar2 default null,
    p_user         in varchar2 default wwv_flow_session_state.v('USER'))
    return varchar2;

--==============================================================================
procedure remove_preferences (
    p_user         in varchar2 default wwv_flow_session_state.v('USER') );

--==============================================================================
procedure remove_preference (
    p_preference   in varchar2 default null,
    p_user         in varchar2 default wwv_flow_session_state.v('USER') );

--==============================================================================
-- This procedure removes user's column head sorting preference value.
--==============================================================================
procedure remove_fsp_sort (
    p_user         in varchar2 default wwv_flow_session_state.v('USER') );

--==============================================================================
-- Delete the current users report sorting preferences for a given application
-- and region.
--==============================================================================
procedure reset_sort_preference (
    p_region_id      in number );

--==============================================================================
-- Delete the current users report sorting preferences for all report regions on
-- a page within an application.
--==============================================================================
procedure reset_sort_preference (
    p_page_id        in number );

--==============================================================================
-- Delete the current users report sorting preferences for all region on a page
-- within an application.
--==============================================================================
procedure reset_sort_preference (
    p_page_id        in number,
    p_region_name    in varchar2 );

--==============================================================================
-- Returns the value of the specified preference of the current Builder session.
--
-- Note: For internal use only!
--==============================================================================
function get_builder_preference (
    p_name in varchar2 )
    return varchar2;

end wwv_flow_preferences;
/
show errors
