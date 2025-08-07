set define '^'
set verify off
prompt ...wwv_flow_credential_dev
create or replace package wwv_flow_credential_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2017. All Rights Reserved.
--
--    NAME
--      wwv_flow_credential_dev.sql
--
--    DESCRIPTION
--      This package is resonsible for handling credentials in the APEX Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/09/2017 - Created
--      cneumuel  06/29/2017 - Added get_name (feature #561)
--      cczarski  11/14/2017 - change wwv_flow_credentials to store credentials at workspace level (feature #2109, #2092)
--
--------------------------------------------------------------------------------

--==============================================================================
-- Look up the credential's name or static ID by it's ID.
--
-- PARAMETERS
--   * p_id: Credential ID.
--
-- RETURNS
--   Credential name.
--==============================================================================
function get_name (
    p_id in number )
    return varchar2;

function get_static_id (
    p_id in number )
    return varchar2;
--==============================================================================
-- Copy a credential, between applications p_from_application_id to p_to_application_id.
--
-- p_subscribe:
--     if true then the new credential gets a subscription to the old one.
-- p_if_existing_raise_dupval:
--     if true and a credential with the same name already exists in
--     p_to_flow_id then DUP_VAL_ON_INDEX gets thrown.
--==============================================================================
function copy_credential (
    p_static_id                in varchar2,
    p_to_static_id             in varchar2 default null )
    return number;

end wwv_flow_credential_dev;
/
show errors
