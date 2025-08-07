set define '^' verify off
prompt ...wwv_flow_component_group_dev.sql
create or replace package wwv_flow_component_group_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2023, 2024 Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_component_group_dev.sql
--
--    DESCRIPTION
--      Procedures, functions related to component groups shared component
--
--    MODIFIED   (MM/DD/YYYY)
--    sravva      11/15/2023 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
subtype t_matching_status is varchar2(15); -- UP_TO_DATE, NEEDS_REFRESH, FOUND, NOT_FOUND
subtype t_row_action      is varchar2(10); -- ASSIGN, UNASSIGN

type t_matching_component is record (
    from_app_id        number,
    from_component_id  number,
    component_type     wwv_flow_shared_component_api.t_component_type,
    to_app_id          number,
    to_component_id    number,
    matching_status    t_matching_status,
    row_action         t_row_action );

type t_matching_components is table of t_matching_component;
--==============================================================================
-- Constants
--==============================================================================

--==============================================================================
-- This procedure deletes the component group data
--
-- Parameters:
-- * p_id:       Component group id
-- * p_app_id:   Application id
--==============================================================================
procedure delete_component_group (
    p_id                 in number,
    p_app_id             in number );

--==============================================================================
-- This function compares components from a component group p_from_component_group_id
--  with components from p_to_app_id app. Data is returned as t_matching_components type
--
-- Each component can have below matching_status
--   UP_TO_DATE    - Component found in p_to_app_id app, subscribed and up to date
--   NEEDS_REFRESH - Component found in p_to_app_id app, subscribed but needs refresh
--   FOUND         - Component with the same name found in p_to_app_id app, but subscribed / subcribed to different component
--   NOT_FOUND     - No matching component found in p_to_app_id app
--
-- When p_to_component_group_id is found, each component will also have row_action data.
-- This data is used during refresh / publish to determine if a component is assigned or unassigned from the group
--   ASSIGN   - New component found in p_from_component_group_id, but not in p_to_component_group_id group
--   UNASSIGN - Component not found in p_from_component_group_id, but found in p_to_component_group_id group
--   NULL     - Component exists in both the groups
--
-- Parameters:
-- * p_from_component_group_id: Source Component group id
-- * p_from_app_id:             Source Application id
-- * p_to_app_id:               Target Application id
-- * p_to_component_group_id:   Target Component group id ( Only used during refresh / publish )
-- * p_mode:                    COPY or REFRESH
--
-- Returns:
-- Component group comparision data as t_matching_components type
--==============================================================================
function compare (
    p_from_component_group_id in number,
    p_from_app_id             in number,
    p_to_app_id               in number,
    p_to_component_group_id   in number   default null,
    p_mode                    in varchar2 default 'COPY' )
    return t_matching_components pipelined;

--==============================================================================
-- This function compares components from a component group p_master_id
--  with components from all subscribing apps. Data is returned as t_matching_components type
--  It calls compare function for each subscribing app
--
-- Parameters:
-- * p_master_id:       Master Component group id
-- * p_master_app_id:   Master application id
--
-- Returns:
-- Component groups comparision data as t_matching_components type
--==============================================================================
function preview_publish (
    p_master_id          in number,
    p_master_app_id      in number )
    return t_matching_components pipelined;

--==============================================================================
-- This function checks if a given component group contains any page patterns or not
--
-- Parameters:
-- * p_component_group_id:  Component group id
-- * p_app_id:              Application id
--
-- Returns:
-- true, if given component group contains any page patterns
-- false otherwise
--==============================================================================
function has_page_patterns (
    p_component_group_id   in number,
    p_app_id               in number )
    return boolean;

--==============================================================================
-- This procedure compares theme_internal_name and version_identifier of
-- source and target application themes. Throws error, if they are different
--
-- Parameters:
-- * p_from_app_id:  Source or Master Application ID
-- * p_to_app_id:    Target or Subscribing Application ID
--
--==============================================================================
procedure check_app_themes (
    p_from_app_id           in number,
    p_to_app_id             in number );

--==============================================================================
-- This function copies component group p_from_component_group_id from p_from_app_id app to p_to_app_id app
--
-- Parameters:
-- * p_from_component_group_id: Source Component group id
-- * p_from_app_id:             Source Application id
-- * p_to_app_id:               Target Application id
-- * p_new_name:                Name of the new component group
-- * p_subscribe:               If true, new copied group will be subscribed to p_from_component_group_id group
--
-- Returns:
-- ID of the newly copied component group
--==============================================================================
function copy_component_group (
    p_from_component_group_id in number,
    p_from_app_id             in number,
    p_to_app_id               in number,
    p_new_name                in varchar2 default null,
    p_subscribe               in boolean  default false )
    return number;

--==============================================================================
-- This procedure refreshes the component group and all the components that are part of the group
--
-- Parameters:
-- * p_master_id:          Master Component group id
-- * p_master_app_id:      Master application id
-- * p_subscribing_id:     Subscribing Component group id
-- * p_subscribing_app_id: Subscribing application id
--==============================================================================
procedure refresh_component_group (
    p_master_id          in number,
    p_master_app_id      in number,
    p_subscribing_id     in number,
    p_subscribing_app_id in number );

--==============================================================================
-- This procedure publishes the component group data from master to all subscribing component groups
--
-- Parameters:
-- * p_master_id:       Master Component group id
-- * p_master_app_id:   Master application id
--==============================================================================
procedure publish_component_group (
    p_master_id          in number,
    p_master_app_id      in number );

--==============================================================================
-- This procedure unsubscribes ( clears reference_id ) for the given component group
--
-- Parameters:
-- * p_component_group_id: Component group id
-- * p_app_id:             Application id
--==============================================================================
procedure unsubscribe (
    p_component_group_id        in number,
    p_app_id                    in number );

--==============================================================================
-- This procedure assigns multiple components to p_component_group_id group
--
-- Parameters:
-- * p_component_group_id: Component group id
-- * p_app_id:             Application id
-- * p_component_type:     Component type
-- * p_component_ids:      Component IDs in array
--==============================================================================
procedure assign_components (
    p_component_group_id in number,
    p_app_id             in number,
    p_component_type     in varchar2,
    p_component_ids      in wwv_flow_t_number );

--==============================================================================
-- This procedure unassigns a component from p_component_group_id group
--
-- Parameters:
-- * p_id:                 Id of wwv_flow_comp_grp_components table
-- * p_component_group_id: Component group id
-- * p_app_id:             Application id
--==============================================================================
procedure unassign_component (
    p_id                 in number,
    p_component_group_id in number,
    p_app_id             in number );

--==============================================================================
-- This function checks if a given component is part of any subscribed component group
--
-- Parameters:
-- * p_component_id:   Component id
-- * p_component_type: Component type
-- * p_app_id:         Application id
--
-- Returns:
-- Y, if given component is part of any subscribed component group
-- N otherwise
--==============================================================================
function is_part_of_subscribed_comp_grp (
    p_component_id   in number,
    p_component_type in wwv_flow_shared_component_api.t_component_type,
    p_app_id         in number )
    return varchar2;

--==============================================================================
-- This function checks if a given component is part of any component group
--
-- Parameters:
-- * p_component_id:   Component id
-- * p_component_type: Component type
-- * p_app_id:         Application id
--
-- Returns:
-- true, if given component is part of any component group
-- false, otherwise
--==============================================================================
function is_part_of_comp_grp (
    p_component_id   in number,
    p_component_type in wwv_flow_shared_component_api.t_component_type,
    p_app_id         in number )
    return boolean;

--==============================================================================
-- This function checks if a given component is part of any component group
--
-- Parameters:
-- * p_component_id:   Component id
-- * p_component_type: Component type
-- * p_app_id:         Application id
--
-- Returns:
-- Y, if given component is part of any component group
-- N, otherwise
--==============================================================================
function is_part_of_comp_grp_yn (
    p_component_id   in number,
    p_component_type in wwv_flow_shared_component_api.t_component_type,
    p_app_id         in number )
    return varchar2;

end wwv_flow_component_group_dev;
/
show err

set define '^'