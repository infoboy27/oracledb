set define '^' verify off
prompt ...wwv_flow_pwa_dev.sql
create or replace package wwv_flow_pwa_dev as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_pwa_dev.sql
--
--    DESCRIPTION
--      This package is responsible for managing PWA services in the builder
--
--    MODIFIED   (MM/DD/YYYY)
--    vmorneau   12/16/2021 - Created
--
--------------------------------------------------------------------------------

--
--==============================================================================
-- Inititalize the PWA Service Worker values on 4000:507
--==============================================================================
procedure init_service_worker (
    p_application_id                in  number,
    p_sw_mode                       out varchar2,
    p_sw_hooks_url                  out varchar2,
    p_sw_function_variable_mode     out varchar2,
    p_sw_install_mode               out varchar2,
    p_sw_activate_mode              out varchar2,
    p_sw_fetch_mode                 out varchar2,
    p_sw_sync_mode                  out varchar2,
    p_sw_push_mode                  out varchar2,
    p_sw_notificationclick_mode     out varchar2,
    p_sw_notificationclose_mode     out varchar2,
    p_sw_canmakepayment_mode        out varchar2,
    p_sw_paymentrequest_mode        out varchar2,
    p_file_reference                out varchar2,
    p_funct_variable_declaration    out varchar2,
    p_event_install                 out varchar2,
    p_event_install_before          out varchar2,
    p_event_install_after           out varchar2,
    p_event_activate                out varchar2,
    p_event_activate_before         out varchar2,
    p_event_activate_after          out varchar2,
    p_event_fetch                   out varchar2,
    p_event_fetch_before            out varchar2,
    p_event_fetch_cache_definition  out varchar2,
    p_event_fetch_cache_response    out varchar2,
    p_event_fetch_network_resp_suc  out varchar2,
    p_event_fetch_network_resp_err  out varchar2,
    p_event_fetch_offline_page      out varchar2,
    p_event_fetch_network_fallback  out varchar2,
    p_event_sync                    out varchar2,
    p_event_push                    out varchar2,
    p_event_push_before             out varchar2,
    p_event_push_after              out varchar2,
    p_event_notificationclick       out varchar2,
    p_event_notificationclick_bef   out varchar2,
    p_event_notificationclick_aft   out varchar2,
    p_event_notificationclose       out varchar2,
    p_event_canmakepayment          out varchar2,
    p_event_paymentrequest          out varchar2 );

--
--==============================================================================
-- Save the PWA Service Worker values on 4000:507
--==============================================================================
procedure save_service_worker (
    p_application_id            in number,
    p_is_pwa                    in varchar2,
    p_sw_mode                   in varchar2,
    p_sw_file_reference         in varchar2,
    p_sw_function_variable_mode in varchar2,
    p_sw_function_variable      in varchar2,
    p_sw_install_mode           in varchar2,
    p_sw_install_before         in varchar2,
    p_sw_install_after          in varchar2,
    p_sw_install                in varchar2,
    p_sw_activate_mode          in varchar2,
    p_sw_activate_before        in varchar2,
    p_sw_activate_after         in varchar2,
    p_sw_activate               in varchar2,
    p_sw_fetch_mode             in varchar2,
    p_sw_fetch_before           in varchar2,
    p_sw_fetch_cache_definition in varchar2,
    p_sw_fetch_cache_response   in varchar2,
    p_sw_fetch_network_resp_suc in varchar2,
    p_sw_fetch_network_resp_err in varchar2,
    p_sw_fetch_offline_page     in varchar2,
    p_sw_fetch_network_fallback in varchar2,
    p_sw_fetch                  in varchar2,
    p_sw_sync_mode              in varchar2,
    p_sw_sync                   in varchar2,
    p_sw_push_mode              in varchar2,
    p_sw_push                   in varchar2,
    p_sw_push_before            in varchar2,
    p_sw_push_after             in varchar2,
    p_sw_notificationclick_mode in varchar2,
    p_sw_notificationclick      in varchar2,
    p_sw_notificationclick_bef  in varchar2,
    p_sw_notificationclick_aft  in varchar2,
    p_sw_notificationclose_mode in varchar2,
    p_sw_notificationclose      in varchar2,
    p_sw_canmakepayment_mode    in varchar2,
    p_sw_canmakepayment         in varchar2,
    p_sw_paymentrequest_mode    in varchar2,
    p_sw_paymentrequest         in varchar2 );

--
--==============================================================================
-- Creates the navigation bar list entry for Install App
--==============================================================================
procedure create_pwa_install_list_entry (
    p_application_id    in number,
    p_seq               in number default 1,
    p_nav_bar_list_id   in number default null );

--
--==============================================================================
-- Deletes the navigation bar list entry for Install App
--==============================================================================
procedure delete_pwa_install_list_entry (
    p_application_id in number );
--
--==============================================================================
-- Generate Push Notifications Credentials
-- If a static ID is provided, it those credentials will be updated.
-- If no static ID is provided, a new set of credentials will be generated.
-- Then assigns the application with the generated push credentials
-- Returns the credentials ID that was generated.
--==============================================================================
function generate_push_credentials (
    p_application_id in number,
    p_credential_id  in number default null )
    return number;

end wwv_flow_pwa_dev;
/
show errors