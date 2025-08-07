set define '^' verify off
prompt ...wwv_flow_4050_ui
create or replace package wwv_flow_4050_ui as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2009, 2024, Oracle and/or its affiliates.
--
--  NAME
--    wwv_flow_4050_ui.sql
--
--  DESCRIPTION
--    User interface plsql for internal administration application
--
--  MODIFIED  (MM/DD/YYYY)
--    mhichwa  05/06/2009 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Type Specification
--==============================================================================
type t_schema_status              is record (
    schema_type                   wwv_flow_global.t_dbms_id,
    schema_in_use                 boolean default false,
    schema_restricted             boolean default false );
--==============================================================================
-- System Messages/Announcements (defined in app 4050, but can be displayed in
-- other apps)
--==============================================================================
function get_system_message (
    p_app_session in number default null)
    return varchar2;

procedure show_system_message (
    p_app_session in number default null);

function system_message_exists
    return boolean;
--==============================================================================

--##############################################################################
--#
--# WORKSPACE LEVEL REPORTING
--#
--##############################################################################

--##############################################################################
--#
--# PAGE 136
--#
--##############################################################################

--==============================================================================
procedure p136_fetch_credential (
    p_id        out number,
    p_client_id out varchar2 );

--==============================================================================
procedure p136_save_credential (
    p_id            in number,
    p_client_id     in varchar2,
    p_client_secret in varchar2 );

--==============================================================================
procedure p136_fetch_saml_attributes (
    p_saml_enabled                 out varchar2,
    p_saml_ip_issuer               out varchar2,
    p_saml_ip_signing_certificate  out varchar2,
    p_saml_ip_signing_certificate2 out varchar2,
    p_saml_sign_in_url             out varchar2,
    p_saml_sign_out_url            out varchar2,
    p_saml_nameid_format           out varchar2,
    p_saml_sp_issuer               out varchar2,
    p_saml_username_attribute      out varchar2,
    p_saml_apex_certificate        out varchar2,
    p_saml_apex_certificate2       out varchar2,
    p_saml_apex_private_key        out varchar2,
    p_saml_apex_private_key2       out varchar2,
    p_saml_apex_callback_urls      out varchar2 );

--==============================================================================
procedure p136_save_saml_attributes (
    p_saml_enabled                 in varchar2,
    p_saml_ip_issuer               in varchar2,
    p_saml_ip_signing_certificate  in varchar2,
    p_saml_ip_signing_certificate2 in varchar2,
    p_saml_sign_in_url             in varchar2,
    p_saml_sign_out_url            in varchar2,
    p_saml_nameid_format           in varchar2,
    p_saml_sp_issuer               in varchar2,
    p_saml_username_attribute      in varchar2,
    p_saml_apex_certificate        in varchar2,
    p_saml_apex_certificate2       in varchar2,
    p_saml_apex_private_key        in varchar2,
    p_saml_apex_private_key2       in varchar2,
    p_saml_apex_callback_urls      in varchar2 );

--==============================================================================
-- User Preferences for Workspace Administration
procedure ajax_set_ui_mode;

--==============================================================================
-- Get Schema Status (In Use, Restricted)
--==============================================================================
function get_schema_status (
    p_schema  in varchar2,
    p_sgid    in number )
    return t_schema_status;

--==============================================================================
-- Schema Assignment Status, currently displayed on 4050:278
--==============================================================================
function schema_assignment_status (
    p_file_id        in number,
    p_schema         in varchar2,
    p_imp_company_id in number,
    p_schema_exists  in boolean default false )
    return clob;

end wwv_flow_4050_ui;
/
show errors
