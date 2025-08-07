set define '^'
set verify off
prompt ...wwv_flow_copy_page

Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      cbcho     01/09/2003 - Created

create or replace
package wwv_flow_copy_page
as
--  Copyright (c) 1999, 2022, Oracle and/or its affiliates.
--
--    DESCRIPTION
--      Copy page.
--
--    SECURITY
--      For use by flows user, not granted to public
--
--    RUNTIME DEPLOYMENT: YES
--
--    NOTES
--      This is called from the flow builder HTML designer.
--


empty_vc_arr wwv_flow_global.vc_arr2;

--------------------------------------------------------------------------------
-- Types
--------------------------------------------------------------------------------

type t_lov is record (
    old_lov     number,
    new_lov     number,
    copy_option varchar2(50)
);
type t_auth_scheme is record (
    old_auth     varchar2(255),
    new_auth     varchar2(255),
    copy_option varchar2(50)
);
type t_branch is record (
    old_value     number,
    new_value     number
);

type t_list is record (
    old_list     number,
    new_list     number,
    copy_option varchar2(50)
);

type t_template is record (
    template_type    varchar2(4000),
    old_template     varchar2(4000),
    new_template     varchar2(4000)
);
--------------------------------------------------------------------------------
-- Collection of LOVs
--------------------------------------------------------------------------------
type t_lovs is table of t_lov index by pls_integer;
c_empty_lovs t_lovs; -- LOVs default

--------------------------------------------------------------------------------
-- Collection of Authorization Schemes
--------------------------------------------------------------------------------
type t_auth_schemes is table of t_auth_scheme index by pls_integer;
c_empty_auth_schemes t_auth_schemes; -- Auth Schemes default

--------------------------------------------------------------------------------
-- Collection of Branches
--------------------------------------------------------------------------------
type t_branches is table of t_branch index by pls_integer;
c_empty_branches t_branches; -- Branches default

--------------------------------------------------------------------------------
-- Collection of Lists
--------------------------------------------------------------------------------
type t_lists is table of t_list index by pls_integer;
c_empty_lists t_lists; -- Lists default

--------------------------------------------------------------------------------
-- Collection of Templates
--------------------------------------------------------------------------------
type t_templates is table of t_template index by pls_integer;
c_empty_templates t_templates; -- Templates default
---

function change_page_id_in_branch (
    p_page_id_from             in number,
    p_page_id_to               in number,
    p_url                      in varchar2
    ) return varchar2;

function change_item_name (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_source                   in varchar2
    ) return varchar2;

function change_item_name (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_source                   in clob
    ) return varchar2;

--
-- Copy one flow plug and its items and buttons to another
-- Set p_clear_global_variables to clear the internal global variables. Should
-- be false when copying a page/application.
--
procedure a_region (
    p_flow_id_from           in number,
    p_page_id_from           in number,
    p_region_id_from         in number,
    p_flow_id_to             in number,
    p_page_id_to             in number,
    p_plug_name_to           in varchar2,
    p_parent_plug_id_to      in number   default null,
    p_display_seq_to         in number   default null,
    p_display_col_to         in number   default null,
    p_display_point_to       in varchar2 default null,
    p_new_region_title       in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_item_label         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_button_label       in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_region_name        in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_copy_items             in boolean  default false,
    p_copy_buttons           in boolean  default false,
    p_copy_validations       in boolean  default false,
    p_copy_processes         in boolean  default false,
    p_copy_sub_regions       in boolean  default false,
    p_copy_master_region     in boolean  default false,
    p_copy_filtered_region   in boolean  default false,
    p_copy_public_report     in boolean  default false,
    p_clear_global_variables in boolean  default true,
    p_region_name_to         in varchar2 default null,
    p_offset                 in number   default null,
    p_subscribe              in boolean  default false );

procedure copy (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_page_name_to             in varchar2,
    --
    p_breadcrumb_id            in number default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_id                in number default null,
    --
    p_new_region_title         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_item_label           in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_button_label         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_branch_value         in wwv_flow_global.vc_arr2 default empty_vc_arr,
    p_new_region_name          in wwv_flow_global.vc_arr2 default empty_vc_arr,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number default null,
    p_nav_list_parent_item_id  in number default null,
    p_nav_list_child_item_name in varchar2 default null,
    p_nav_list_item_icon       in varchar2  default null,
    --
    p_copy_public_report       in boolean default false,
    p_copy_build_options       in boolean default false,
    p_copy_navigation          in boolean default false,
    p_subscribe                in boolean default false);

--==============================================================================
--Copy from another App using types
--==============================================================================
procedure copy_from_other_app (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_page_name_to             in varchar2          default null,
    --
    p_breadcrumb_id            in number            default null,
    p_breadcrumb_name          in varchar2          default null,
    p_parent_id                in number            default null,
    --
    p_tab_set                  in varchar2          default null,
    p_tab_name                 in varchar2          default null,
    p_tab_label                in varchar2          default null,
    --
    p_nav_list_id              in number            default null,
    p_nav_list_parent_item_id  in number            default null,
    p_nav_list_child_item_name in varchar2          default null,
    --
    p_lovs                     in t_lovs            default c_empty_lovs,
    p_auth_schemes             in t_auth_schemes    default c_empty_auth_schemes,
    p_branches                 in t_branches        default c_empty_branches,
    p_lists                    in t_lists           default c_empty_lists,
    p_templates                in t_templates       default c_empty_templates,
    --
    p_copy_public_report       in boolean           default false,
    p_copy_build_options       in boolean           default false,
    p_copy_navigation          in boolean           default false,
    p_copy_page_group          in boolean           default false,
    p_subscribe                in boolean           default false );

--==============================================================================
-- Copy from another App using APEX Collections
--==============================================================================
procedure copy_from_other_app (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_page_name_to             in varchar2,
    --
    p_breadcrumb_id            in number default null,
    p_breadcrumb_name          in varchar2 default null,
    p_parent_id                in number default null,
    --
    p_tab_set                  in varchar2 default null,
    p_tab_name                 in varchar2 default null,
    p_tab_label                in varchar2 default null,
    --
    p_nav_list_id              in number default null,
    p_nav_list_parent_item_id  in number default null,
    p_nav_list_child_item_name in varchar2 default null,
    --
    p_lov_collection_name      in varchar2 default 'COPY_PAGE_LOV',
    p_auth_collection_name     in varchar2 default 'COPY_PAGE_SECURITY',
    p_branch_collection_name   in varchar2 default 'COPY_PAGE_BRANCH',
    p_list_collection_name     in varchar2 default 'COPY_PAGE_LIST',
    p_template_collection_name in varchar2 default 'COPY_PAGE_TEMPLATES',
    --
    p_copy_public_report       in boolean default false );

--==============================================================================
-- Copy page from another App
-- This procedure automatically copies or re-uses matching shared components
-- Internally calls copy_from_other_app procedure
--==============================================================================
procedure copy_page (
    p_flow_id_from             in number,
    p_page_id_from             in number,
    p_flow_id_to               in number,
    p_page_id_to               in number,
    p_page_name_to             in varchar2  default null,
    p_subscribe                in boolean   default false );

--==============================================================================
-- This procedure copies dynamic action data from one page to another page
--
-- Parameters:
-- * p_flow_id_from            : Source app id
-- * p_page_id_from            : Source page id
-- * p_event_id_from           : Dynamic action id
-- * p_flow_id_to              : Target app id
-- * p_page_id_to              : Target page id
-- * p_name                    : DA Name in target page
-- * p_event_sequence          : Sequence of DA in target page
-- * p_bind_event_type         : Event type
-- * p_bind_event_type_custom  : Custom event name, optional
-- * p_triggering_element_type : Triggering element type, optional
-- * p_triggering_region_id    : Triggering region id, optional
-- * p_triggering_button_id    : Triggering button id, optional
-- * p_triggering_element      : Triggering element
--
--==============================================================================
procedure a_dynamic_action(
    p_flow_id_from            in number,
    p_page_id_from            in number,
    p_event_id_from           in number,
    p_flow_id_to              in number,
    p_page_id_to              in number,
    p_name                    in varchar2,
    p_event_sequence          in number,
    p_bind_event_type         in varchar2,
    p_bind_event_type_custom  in varchar2,
    p_triggering_element_type in varchar2,
    p_triggering_region_id    in number,
    p_triggering_button_id    in number,
    p_triggering_element      in varchar2,
    p_subscribe               in boolean  default false );

--==============================================================================
-- This procedure copies page process from one page to another page
--
-- Parameters:
-- * p_flow_id_from            : Source app id
-- * p_page_id_from            : Source page id
-- * p_process_id_from         : Page process id
-- * p_flow_id_to              : Target app id
-- * p_page_id_to              : Target page id
-- * p_process_name            : Process Name
-- * p_process_sequence        : Process sequence
-- * p_region_id               : Region id
-- * p_process_when_button_id  : Process "When Button Pressed" id
--==============================================================================
procedure a_process(
    p_flow_id_from            in number,
    p_page_id_from            in number,
    p_process_id_from         in number,
    p_flow_id_to              in number,
    p_page_id_to              in number,
    p_process_name            in varchar2,
    p_process_sequence        in number,
    p_region_id               in number,
    p_process_when_button_id  in number );

--==============================================================================
-- This procedure copies page computation from one page to another page
--
-- Parameters:
-- * p_flow_id_from            : Source app id
-- * p_page_id_from            : Source page id
-- * p_computation_id_from     : Page computation id
-- * p_flow_id_to              : Target app id
-- * p_page_id_to              : Target page id
-- * p_computation_item        : Item Name
-- * p_computation_sequence    : Computation sequence
--==============================================================================
procedure a_computation(
    p_flow_id_from            in number,
    p_page_id_from            in number,
    p_computation_id_from     in number,
    p_flow_id_to              in number,
    p_page_id_to              in number,
    p_computation_item        in varchar2,
    p_computation_sequence    in number );

--==============================================================================
-- This procedure copies page branch from one page to another page
--
-- Parameters:
-- * p_flow_id_from            : Source app id
-- * p_page_id_from            : Source page id
-- * p_branch_id_from          : Page branch id
-- * p_flow_id_to              : Target app id
-- * p_page_id_to              : Target page id
-- * p_branch_when_button_id   : Branch button id
-- * p_branch_sequence         : Branch Sequence
--==============================================================================
procedure a_branch(
    p_flow_id_from            in number,
    p_page_id_from            in number,
    p_branch_id_from          in number,
    p_flow_id_to              in number,
    p_page_id_to              in number,
    p_branch_when_button_id   in number,
    p_branch_sequence         in number );

--==============================================================================
-- This procedure copies validation from one page to another page
--
-- Parameters:
-- * p_flow_id_from            : Source app id
-- * p_page_id_from            : Source page id
-- * p_validation_id_from      : Validation id
-- * p_flow_id_to              : Target app id
-- * p_page_id_to              : Target page id
-- * p_when_button_pressed     : Button condition
-- * p_tabular_form_region_id  : Region associated with validation
-- * p_associated_item         : Item associated with validation
-- * p_validation_sequence     : Validation Sequence
-- * p_validation_name         : Validation Name
--==============================================================================
procedure a_validation(
    p_flow_id_from            in number,
    p_page_id_from            in number,
    p_validation_id_from      in number,
    p_flow_id_to              in number,
    p_page_id_to              in number,
    p_when_button_pressed     in number,
    p_tabular_form_region_id  in number,
    p_associated_item         in number,
    p_validation_sequence     in number,
    p_validation_name         in varchar2 );

end wwv_flow_copy_page;
/
show errors;
