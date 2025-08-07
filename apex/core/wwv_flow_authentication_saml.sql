set define '^' verify off
prompt ...wwv_flow_authentication_saml.sql
create or replace package wwv_flow_authentication_saml as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2020. All Rights Reserved.
--
-- NAME
--   wwv_flow_authentication_saml.sql
--
-- DESCRIPTION
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             NO
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  06/04/2019 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- SAML authentication scheme data
--==============================================================================
type t_credentials is table of wwv_flow_credential_api.t_credential;
type t_saml is record (
    sign_on_url        varchar2(4000),      -- The identity provider's URL to initiate single sign-on.
    sign_out_url       varchar2(4000),      -- The identity provider's URL to initiate signle sign-out.
    ip_issuer          varchar2(4000),      -- The identity provider's expected issue attribute.
    sp_issuer          varchar2(4000),      -- The service provider (=APEX) issuer.
    username_attribute varchar2(4000),      -- The attribute in AuthnResponse with the username.
    credentials        t_credentials,       -- SP credentials. More than one for for certificate rollover, to announce
                                            -- them to the IP in the metadata XML document.
    signing_id         pls_integer,         -- The ID in the credentials record for the one actually used for signing.
    certificate2       varchar2(4000),      -- Alternative certificate.
    ip_certificates    wwv_flow_t_varchar2, -- Certificates to verify responses from the IP.
    deflate_requests   boolean,             -- Should deflate compression be used for requests?
    post_logout_url    varchar2(4000),      -- URL to redirect to after logout
    uppercase_username boolean default true -- Should APEX convert the username to upper case?
);

--==============================================================================
-- Return a t_saml record with instance-level settings.
--==============================================================================
function instance_saml (
    p_post_logout_url in varchar2 )
    return t_saml;

--==============================================================================
-- Turn t_authentication into a t_saml record.
--==============================================================================
function to_saml (
    p_authentication in wwv_flow_plugin_api.t_authentication )
    return t_saml;

--==============================================================================
-- SAML authentication scheme hook.
--==============================================================================
function invalid_session (
    p_saml in t_saml )
    return wwv_flow_plugin_api.t_authentication_inval_result;

--==============================================================================
-- SAML authentication scheme hook.
--==============================================================================
function ajax (
    p_saml in t_saml )
    return wwv_flow_plugin_api.t_authentication_ajax_result;

--==============================================================================
-- SAML authentication scheme hook.
--==============================================================================
function post_logout (
    p_saml in t_saml )
    return wwv_flow_plugin_api.t_authentication_logout_result;

--==============================================================================
-- Implementation of wwv_flow_authentication_api.saml_callback.
--==============================================================================
procedure saml_callback (
    SAMLResponse      in varchar2,
    SAMLRequest       in varchar2,
    RelayState        in varchar2,
    SigAlg            in varchar2,
    Signature         in varchar2 );

--==============================================================================
-- Implementation of wwv_flow_authentication_api.saml_metadata.
--==============================================================================
procedure metadata (
    p_app_id          in number default null );

--==============================================================================
-- Base64-decode and inflate the given SAML request/response.
--==============================================================================
function decode_message (
    p_message in varchar2 )
    return varchar2;

end wwv_flow_authentication_saml;
/
show err

