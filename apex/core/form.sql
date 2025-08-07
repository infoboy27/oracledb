set define '^' verify off
prompt ...wwv_flow_forms
create or replace package wwv_flow_forms as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2000, 2024, Oracle and/or its affiliates.
--
--    DESCRIPTION
--      Flow form rendering engine package specification.
--
--    SECURITY
--
--    INTERNATIONALIZATION
--
--    NOTES
--      This program generates HTML form fields, this package is a utility package to wwv_flow.
--
--    RUNTIME DEPLOYMENT: YES
--
--    SCRIPT ARGUMENTS
--      none
--
--    MODIFIED   (MM/DD/YYYY)
--      mhichwa   01/26/2000 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Determines the HTML attributes for a specific alignment
--==============================================================================
function td_alignment (
    p_alignment in varchar2 )
    return varchar2;

--==============================================================================
-- Set the page item/button request value
--==============================================================================
procedure determine_component_value (
    p_item in wwv_flow_meta_data.t_item );

--==============================================================================
-- initialize p_item.is_ok_to_display and item session state.
--==============================================================================
procedure init_item (
    p_item in out nocopy wwv_flow_meta_data.t_item );

--==============================================================================
-- Return the index in wwv_flow_meta_data.g_items for the item that we are
-- currently rendering.
--==============================================================================
function current_item_index
    return pls_integer;

--==============================================================================
-- Perform label/button template substitutions for the current item/button.
--
-- Parameters:
-- * p_text:    The source text with substitution strings.
-- * p_i:       The index into wwv_flow_meta_data.{g_items,g_buttons} for
--              the current item/button. Defaults to the index for the item that
--              is being rendered with render_item() below.
-- * p_type_id: The component type, either c_component_item or
--              c_component_button.
--==============================================================================
function current_subs (
    p_text    in varchar2,
    p_i       in pls_integer                            default null,
    p_type_id in wwv_flow_meta_data.t_component_type_id default wwv_flow_meta_data.c_component_item )
    return varchar2;

--==============================================================================
function get_display_value (
    p_default_type          in varchar2,
    p_default_language      in varchar2,
    p_default               in varchar2,
    p_data_type             in wwv_flow_session_state_api.t_data_type,
    p_multi_value_type      in wwv_flow_exec_api.t_multi_value_type,
    p_multi_value_separator in varchar2 )
    return wwv_flow_session_state_api.t_value;

--==============================================================================
-- make p_item the current component. this procedure
-- should be used instead of the more generic wwv_flow.set_component, because
-- it performs additional initialization.
--==============================================================================
procedure set_component (
    p_item in wwv_flow_meta_data.t_item );

--==============================================================================
-- return whether the region can be displayed
--==============================================================================
function is_ok_to_display (
    p_item in out nocopy wwv_flow_meta_data.t_item )
    return boolean;

--==============================================================================
procedure render_item (
    p_item                     in out nocopy wwv_flow_meta_data.t_item,
    p_item_type                in            varchar2,
    p_index                    in            pls_integer,
    p_iterator                 in out nocopy wwv_flow_grid_layout.t_iterator,
    p_grid_template            in            wwv_flow_template.t_grid_template,
    p_region_is_read_only      in            boolean );

--==============================================================================
-- Returns the values of the array t as a concatenated varchar2.
--==============================================================================
function get_multi_value_varchar2 (
    p_table                 in wwv_flow_global.vc_arr2,
    p_multi_value_type      in wwv_flow_exec_api.t_multi_value_type,
    p_multi_value_separator in varchar2 )
    return varchar2;

--==============================================================================
-- Returns the values of the array t as a concatenated clob.
--==============================================================================
function get_multi_value_clob (
    p_table                 in wwv_flow_global.vc_arr2,
    p_multi_value_type      in wwv_flow_exec_api.t_multi_value_type,
    p_multi_value_separator in varchar2 )
    return clob;

end wwv_flow_forms;
/
show errors
