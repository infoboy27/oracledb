set define off verify off
prompt ...wwv_flow_button
create or replace package wwv_flow_button as
--------------------------------------------------------------------------------
--
--  Copyright (c), 1999, 2023, Oracle and/or its affiliates.
--
--    NAME
--     wwv_flow_button.plb
--
--    DESCRIPTION
--     This package is responsible for handling buttons.
--
--    RUNTIME DEPLOYMENT: YES
--    PUBLIC:             NO
--
--    MODIFIED   (MM/DD/YYYY)
--     arayner  03/03/2011 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================
subtype t_action is wwv_flow_step_buttons.button_action%type;
c_action_submit         constant t_action := 'SUBMIT';
c_action_redirect_url   constant t_action := 'REDIRECT_URL';
c_action_redirect_page  constant t_action := 'REDIRECT_PAGE';
c_action_redirect_app   constant t_action := 'REDIRECT_APP';
c_action_defined_by_da  constant t_action := 'DEFINED_BY_DA';
c_action_javascript     constant t_action := 'JAVASCRIPT';
-- The actions below are deprecated
c_action_report         constant t_action := 'REPORT';
c_action_reset          constant t_action := 'RESET';
c_action_next_page      constant t_action := 'NEXT_PAGE';
c_action_previous_page  constant t_action := 'PREVIOUS_PAGE';

subtype t_confirm_style is wwv_flow_step_buttons.confirm_style%type;
c_confirm_style_information constant t_confirm_style := 'information';
c_confirm_style_warning     constant t_confirm_style := 'warning';
c_confirm_style_danger      constant t_confirm_style := 'danger';
c_confirm_style_success     constant t_confirm_style := 'success';

-- used by various form wizards for the delete button
c_delete_confirm_message constant varchar2(25)    := '&APP_TEXT$DELETE_MSG!RAW.';
c_delete_confirm_style   constant t_confirm_style := c_confirm_style_danger;

--==============================================================================
-- Global variables
--==============================================================================

--==============================================================================
-- initialize non-database columns of p_button. if the button has a
-- request_source_type, init() computes the value and saves it in transient
-- session state, for compatibility with pre 5.0 code.
--
-- this procedure computes private_is_ok_to_display if request_source_type is
-- not null, because computing the source value can be expensive.
--==============================================================================
procedure init (
    p_button               in out nocopy wwv_flow_meta_data.t_button );

--==============================================================================
-- return whether the button can be displayed. if the button is not yet
-- initialized, this function performs the initialization as a side effect.
--
-- always use this function instead of accessing p_button.private_is_ok_to_display.
--==============================================================================
function is_ok_to_display (
    p_button               in out nocopy wwv_flow_meta_data.t_button )
    return boolean;

--==============================================================================
-- put the button on top of the component stack
--==============================================================================
procedure set_component (
    p_button               in wwv_flow_meta_data.t_button );

--==============================================================================
-- Function returning the HTML for an APEX page button
--==============================================================================
function render (
    p_idx          in            pls_integer,
    p_button       in out nocopy wwv_flow_meta_data.t_button )
    return varchar2;

--==============================================================================
-- Function that returns the button redirect_url, based on button attributes
--==============================================================================
function get_button_redirect_url (
    p_button_action in varchar2,
    p_clear_page    in varchar2,
    p_clear_cache   in varchar2,
    p_page_id       in varchar2,
    p_request       in varchar2,
    p_arg_names     in varchar2,
    p_arg_values    in varchar2,
    p_url_target    in varchar2 )
    return varchar2;

--==============================================================================
function paint_buttons (
    p_position in varchar2,
    p_plug_id  in number )
    return varchar2;

--==============================================================================
-- return if there are buttons for the given region id
--==============================================================================
function region_has_buttons (
    p_plug_id in number )
    return boolean;

end wwv_flow_button;
/
show errors

set define '^'
