set define '^' verify off
prompt ...wwv_flow_custom_auth_sso
create or replace package wwv_flow_custom_auth_sso as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2001, 2024. All Rights Reserved.
--
--     NAME
--       custom_auth_sso_902.sql
--
--     DESCRIPTION
--
--       Conditionally compiled on installation only if wwsec_ packages
--       used by 9iAS Single Signon are installed in flows schema.
--
--     SECURITY
--       Executable via public synonym and grant
--
--     RUNTIME DEPLOYMENT: YES
--
--     MODIFIED  (MM/DD/YYYY)
--     sspadafo   11/27/2002 - Created
--
--------------------------------------------------------------------------------

g_username varchar2(4000);

--==============================================================================
procedure portal_sso_redirect(
    p_partner_app_name in varchar2);

--==============================================================================
procedure portal_sso_redirect;

--==============================================================================
procedure process_success(
    urlc in varchar2,
    p_partner_app_name in varchar2);

--==============================================================================
procedure process_success(
    urlc in varchar2);

--==============================================================================
procedure urlc_vals(
    p_ssousername       in out varchar2,
    p_ipadd             in out varchar2,
    p_ssotimeremaining  in out varchar2,
    p_sitetimestamp     in out varchar2,
    p_urlrequested      in out varchar2,
    p_subscriberid      in out varchar2,
    p_newsitekey        in out varchar2,
    p_pouserdn          in out varchar2,
    p_pouserguid        in out varchar2,
    p_ponlslanguage     in out varchar2,
    p_ponlslocale       in out varchar2,
    p_posubscribername  in out varchar2,
    p_posubscriberdn    in out varchar2,
    p_posubscriberguid  in out varchar2,
    p_polstime          in out varchar2,
    p_polstz            in out varchar2);

end wwv_flow_custom_auth_sso;
/
show errors
