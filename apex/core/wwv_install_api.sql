set define '^' verify off
prompt ...wwv_install_api.sql
create or replace package wwv_install_api as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
-- NAME
--   wwv_install_api.sql
--
-- DESCRIPTION
--   APIs for APEX release and patch installations. These APIs log installation
--   actions and errors.
--
-- RUNTIME DEPLOYMENT: NO
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  06/25/2018 - Created
--   cneumuel  07/18/2018 - Added continue_phase
--   cneumuel  07/23/2018 - Added documentation (feature #2344)
--   cneumuel  07/27/2018 - Added set_upgraded_in_registry
--
--------------------------------------------------------------------------------

--==============================================================================
-- Mark the start a new installation in internal APEX install tables and
-- DBA_REGISTRY.
--
-- PARAMETERS
--   * p_install_type: Type of the installation:
--                     - RUNTIME: Runtime-only installation
--                     - FULLINS: Full installation including dev env
--                     - APPCONTAINER: Application Container full installation
--                     - DEVINS: Install development environment on top of
--                       existing runtime-only installation.
--                     - DEVRM: Remove development to convert to Runtime-only
--                       installation.
--                     - PATCH: Patch installation.
--   * p_schema:       Target APEX_nnnnnn schema.
--==============================================================================
procedure begin_install (
    p_install_type in varchar2,
    p_schema       in varchar2 );

--==============================================================================
-- Update the DBA_REGISTRY to log that APEX has been loaded/upgraded
--==============================================================================
procedure set_upgraded_in_registry;

--==============================================================================
-- Mark the end of an installation in internal APEX install tables.
--==============================================================================
procedure end_install;

--==============================================================================
-- Return the Install Type of the latest installation.
--==============================================================================
function get_install_type
    return varchar2;

--==============================================================================
-- Return the Install ID of the latest installation.
--==============================================================================
function get_install_id
    return number;

--==============================================================================
-- Return the number of errors in the latest installation.
--==============================================================================
function get_error_count
    return number;

--==============================================================================
-- Print a summary of the installation actions and errors, in TAP format.
--
-- PARAMETERS
--   * p_install_id:   The Install ID, defaults to the latest installation.
--   * p_phase:        The Install Phase, defaults to the latest phase.
--==============================================================================
procedure print_summary (
    p_install_id in number default null,
    p_phase      in number default null );

--==============================================================================
-- Start a new phase
--
-- PARAMETERS
--   * p_phase:        The phase number (1, 2, 3...)
--   * p_hot:          Set to TRUE (default FALSE) if it is the phase which
--                     requires downtime. If TRUE, set DBA_REGISTRY to
--                     "upgrading".
--==============================================================================
procedure begin_phase (
    p_phase in number,
    p_hot   in boolean default false );

--==============================================================================
-- Tell wwv_install_api to use the given phase for logging subsequent actions
-- and errors. This call is needed in phase 3, when the phase 4 background job
-- is running concurrently and package state was reset in phase 3.
--
-- PARAMETERS
--   * p_phase:        The phase number.
--==============================================================================
procedure continue_phase (
    p_phase in number );

--==============================================================================
-- End a phase and print the phase summary.
--
-- PARAMETERS
--   * p_phase:        The phase number, defaults to the latest phase.
--   * p_raise_error:  If TRUE (the default), raise an error if install errors
--                     were found in the phase.
--==============================================================================
procedure end_phase (
    p_phase       in number  default null,
    p_raise_error in boolean default true );

--==============================================================================
-- Log the start of an action.
--
-- PARAMETERS
--   * p_action:       The action text.
--   * p_info:         Additional info text (optional).
--==============================================================================
procedure action (
    p_action in varchar2,
    p_info   in varchar2  default null );

--==============================================================================
-- Update the info text of the latest action, by appending the given text.
--
-- PARAMETERS
--   * p_info:         The info text.
--==============================================================================
procedure update_action_info (
    p_info in varchar2 );

--==============================================================================
-- Log an error.
--
-- PARAMETERS
--   * p_message:      The error message, defaults to sqlerrm.
--   * p_statement:    The statement that caused the error (optional).
--==============================================================================
procedure error (
    p_message   in varchar2 default sqlerrm,
    p_statement in varchar2 default null );

--==============================================================================
-- Utility procedure for the trigger wwv_install_errors_bi.
--==============================================================================
procedure on_errors_bi (
    p_id          out number,
    p_action_id   out number,
    p_error_stack out varchar2 );

--==============================================================================
-- Upgrade DBA_REGISTRY to new schema.
--==============================================================================
procedure upgrade_registry;

--==============================================================================
-- Return the APEX schema we are upgrading from.
--==============================================================================
function old_schema
    return varchar2;

--==============================================================================
-- Return the APEX schema we are upgrading to.
--==============================================================================
function new_schema
    return varchar2;

--==============================================================================
-- Return whether this is an upgrade or a fresh installation
--==============================================================================
function is_upgrade
    return boolean;

end wwv_install_api;
/
show err

