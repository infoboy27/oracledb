set define off verify off
prompt ...wwv_extension
create or replace package wwv_extension as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2024, Oracle and/or its affiliates.
--
-- NAME
--   wwv_extension.sql
--
-- DESCRIPTION
--   This package implements the Builder Extension API.
--
-- MODIFIED   (MM/DD/YYYY)
--   crokitta  30/01/2024 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- checks whether the current session is enabled for executing extension apps
-- and has access grants to the specified target workspace
--==============================================================================
function has_extension_access(
    p_workspace_id in number)
    return boolean;

--==============================================================================
-- Sets the current workspace to the workspace, that is processed by the
-- extension application or background automation, by it's id.
-- After calling this API, all APEX dictionary views will show the meta-data of
-- that workspace.
--==============================================================================
procedure set_workspace(
    p_id in number);

--==============================================================================
-- Sets the current workspace to the workspace, that is processed by the
-- extension application or background automation, by it's (display) name.
-- After calling this API, all APEX dictionary views will show the meta-data of
-- that workspace.
--==============================================================================
procedure set_workspace(
    p_name in varchar2);

--==============================================================================
-- Returns the link URL with substituted whitelisted values
--==============================================================================
function get_url(p_url in varchar2 default null)
    return varchar2;

--==============================================================================
-- Get current grantor workspace name
--
-- Returns:
-- Workspace name of grantor workspace
--
-- Example:
--   This query returns the name of the invoking workspace in
--   a builder extension context
--
--     select apex_extension.get_grantor_workspace from sys.dual;
--==============================================================================
function get_grantor_workspace return varchar2;

--==============================================================================
-- Adds a builder extension menu link
--
-- Parameters:
-- * p_label:             Menu entry label. Has to be unique within a workspace.
-- * p_url:               The menu entry's url.
-- * p_display_seq:       Optional, display sequence for sorting menu entry.
--                        Default is null: the value will be calculated and the
--                        entry will be appended as last
-- * p_description:       Optional description.
-- * p_is_public:         If true (default false), the entry will be available for
--                        subscribing workspaces. the value true can only be set for
--                        extension workspaces and requires the APEX_ADMINISTRATOR_ROLE
-- * p_workspace:         Default is null, which means the menu entry is created for the current
--                        workspace. With APEX_ADMINISTRATOR_ROLE, the value can be set to any
--                        other existing workspace name.
--
-- Example:
-- Add an extension menu link in workspace MY_WORKSPACE with label 'Example'.
-- (assuming the caller has APEX_ADMINISTRATOR_ROLE rights granted)
--
-- begin
--     apex_extension.add_menu_entry(
--         p_label       => 'Example',
--         p_url         => 'https://example.com',
--         p_description => 'This is an example',
--         p_workspace   => 'MY_WORKSPACE' );
-- end;
--==============================================================================
procedure add_menu_entry(
    p_label            in varchar2,
    p_url              in varchar2,
    p_display_sequence in number    default null,
    p_description      in varchar2  default null,
    p_is_public        in boolean   default false,
    p_workspace        in varchar2  default null );

 --==============================================================================
-- Remove an existing builder extension menu link entry
--
-- Parameters:
-- * p_label:         Menu entry label.
-- * p_workspace:     Default is null, which means the menu entry is from the current
--                    workspace. With APEX_ADMINISTRATOR_ROLE granted, the value can be set to any
--                    be set to any other existing workspace name.
--
-- Example:
-- Delete the builder extension menu entry with label "Example" in the current workspace
--
-- begin
--     apex_extension.remove_menu_entry(p_label => 'Example');
-- end;
--==============================================================================
procedure remove_menu_entry(
    p_label       in varchar2,
    p_workspace   in varchar2  default null );

end wwv_extension;
/
show errors

set define '^'
