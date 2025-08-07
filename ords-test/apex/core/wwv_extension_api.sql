set define '^' verify off
prompt ...wwv_extension_api
create or replace package wwv_extension_api as
--------------------------------------------------------------------------------
--
-- Copyright (c) 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_extension_api.sql - APEX_EXTENSION
--
--  The WWV_EXTENSION_API package contains public utility functions used for
--  invoking extension applications.
--
--------------------------------------------------------------------------------

--==============================================================================
-- Sets the current workspace to the workspace, that is processed by the
-- extension application or background automation, by it's id.
-- After calling this API, all APEX dictionary views will show the meta-data of
-- that workspace.
--
-- ARGUMENTS
--   * p_id: The ID of the workspace to be accessed.
--
-- Example:
--
-- This examples sets access for an extension application to workspace with 123456789.
--
--   begin
--       apex_extension.set_workspace( p_id => 123456789);
--   end;
--==============================================================================
procedure set_workspace(
    p_id in number);

--==============================================================================
-- Sets the current workspace to the workspace, that is processed by the
-- extension application or background automation, by it's name.
-- After calling this API, all APEX dictionary views will show the meta-data of
-- that workspace.
--
-- ARGUMENTS
--   * p_name: The (display) name of the workspace to be accessed.
--
-- Example:
--
-- This examples sets access for an extension application to workspace MYWORKSPACE.
--
--   begin
--       apex_extension.set_workspace( p_name => 'MYWORKSPACE');
--   end;
--==============================================================================
procedure set_workspace(
    p_name in varchar2);

--==============================================================================
-- Get current grantor workspace name
--
-- Returns:                                              3.
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
-- Adds a builder extension menu link.
-- This procedure requires the APEX_ADMINISTRATOR_ROLE.
--
-- Parameters:
-- * p_label:             Menu entry label. Has to be unique within a workspace.
-- * p_url:               The menu entry's url.
-- * p_display_sequence   Optional, display sequence for sorting menu entry.
--                        Default is null: the value will be calculated and the
--                        entry will be appended as last
-- * p_description:       Optional description.
-- * p_is_public:         If true (default false), the entry will be available for
--                        subscribing workspaces. The value true can only be set for
--                        extension workspaces. If the given workspace is not
--                        enabled for hosting extensions the flag will be set to false.
-- * p_workspace:         Default is null, which means the menu entry is created for the current
--                        workspace. Value can be set to any existing workspace name.
--
-- Example:
-- Add an extension menu link in workspace MY_WORKSPACE with label 'Example'.
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
-- Remove an existing builder extension menu link entry.
-- This procedure requires the APEX_ADMINISTRATOR_ROLE.
--
-- Parameters:
-- * p_label:         Menu entry label.
-- * p_workspace:     Default is null, which means the menu entry is from the current
--                    workspace. Value can be set to any existing workspace name.
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

end wwv_extension_api;
/
show errors

set define '^'
