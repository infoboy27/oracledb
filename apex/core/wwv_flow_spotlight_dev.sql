set define off
set verify off

prompt ...wwv_flow_spotlight_dev

create or replace package wwv_flow_spotlight_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2009 - 2017. All Rights Reserved.
--
--    NAME
--      wwv_flow_spotlight_dev.sql
--
--    DESCRIPTION
--      This package is for Spotlight Search in App Builder
--
--    MODIFIED   (MM/DD/YYYY)
--    xhu         08/01/2017 - Created
--    hfarrell    08/22/2017 - Added set define at end of file (resolving Hudson install issue)
--    xhu         01/01/2018 - Added custom entries defined in App 4411 > Shared Components > Lists
--                             Added wwv_flow_list_items.list_text_10 as tokens
--
--------------------------------------------------------------------------------
--
--
--------------------------------------------------------------------------------
-- Type and procedure to store and use all shared components lists and
-- sublists with static IDs
--------------------------------------------------------------------------------
type t_shared_components_path is varray(3) of varchar2(50);

type t_shared_components_list is record (
    list_id             number default 0,
    list_path           t_shared_components_path,
    list_is_parent      boolean default false,
    list_app_id         number default 0,
    list_icon           varchar2(500),
    list_description    varchar2(500),
    list_category       varchar2(255));
type t_sh_comp_list_table is table of t_shared_components_list index by binary_integer;

type t_shared_components_actions is record (
    action_name         varchar2(255),
    action_label        varchar2(255),
    action_path         t_shared_components_path,
    action_page         number default 0,
    action_app_id       number default 0);
type t_actions_table is table of t_shared_components_actions index by binary_integer;

--==============================================================================
-- Ajax Callback for Spotlight Search Indexes
--==============================================================================
procedure emit_spotlight_search_index(
    p_app_id          in varchar2 default null,
    p_advanced_search in varchar2 default 'N' );

--------------------------------------------------------------------------------
-- Adds a JSON object with URLs for shortcuts.
--------------------------------------------------------------------------------
procedure add_shortcut_object (
    p_type in varchar2,
    p_url  in varchar2 );

--------------------------------------------------------------------------------
-- Returns the HTML markup required per each icon type.
--------------------------------------------------------------------------------
function get_icon_markup (
    p_icon_type   in varchar2 default null,
    p_icon_value  in varchar2 default null,
    p_icon_color  in varchar2 default null
)
return varchar2;

end wwv_flow_spotlight_dev;
/
show errors

set define '^'