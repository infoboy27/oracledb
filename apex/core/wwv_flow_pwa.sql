set define '^' verify off
prompt ...wwv_flow_pwa.sql
create or replace package wwv_flow_pwa as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2021, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_pwa.sql
--
--    DESCRIPTION
--      This package is used to emit content to the page 
--      for applications that have enabled Progressive Web App
--      such as:
--      * Web App Manifest in the head section of a page
--      * Meta tags in the head section of a page
--      * Service worker registration
--      * Web App Manifest file rendering (JSON)
--      * Service Worker file rendering (JavaScript)
--
--      It is also used to:
--      * subscribe and unsubscribe users for push 
--      notificiations.
--      * send push notifications to subscribed users.
--
--    Since: 21.2
--
--    MODIFIED   (MM/DD/YYYY)
--    vmorneau   04/28/2021 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Globals
--==============================================================================
g_is_pwa                   boolean := false;
g_is_installable           boolean := false;
g_is_push_enabled          boolean := false;
g_manifest_description     wwv_flows.pwa_manifest_description%type;
g_manifest_display         wwv_flows.pwa_manifest_display%type;
g_manifest_orientation     wwv_flows.pwa_manifest_orientation%type;
g_manifest_theme_color     wwv_flows.pwa_manifest_theme_color%type;
g_manifest_bg_color        wwv_flows.pwa_manifest_background_color%type;
g_manifest_icon_url        wwv_flows.pwa_manifest_icon_url%type;
g_manifest_custom          wwv_flows.pwa_manifest_custom%type;
g_service_worker_hooks     wwv_flows.pwa_service_worker_hooks%type;
g_apple_status_bar_style   wwv_flows.pwa_apple_status_bar_style%type;
g_push_credential_id       wwv_flows.pwa_push_credential_id%type;
g_vapid_contact_info       wwv_flows.pwa_vapid_contact_info%type;

--==============================================================================
-- Constants
--==============================================================================
c_file_reference               constant varchar2(14) := 'FILE_REFERENCE';
c_funct_variable_declaration   constant varchar2(29) := 'FUNCTION_VARIABLE_DECLARATION';
c_event_install                constant varchar2(13) := 'EVENT_INSTALL';
c_event_install_before         constant varchar2(20) := 'EVENT_INSTALL_BEFORE';
c_event_install_after          constant varchar2(19) := 'EVENT_INSTALL_AFTER';
c_event_activate               constant varchar2(14) := 'EVENT_ACTIVATE';
c_event_activate_before        constant varchar2(21) := 'EVENT_ACTIVATE_BEFORE';
c_event_activate_after         constant varchar2(20) := 'EVENT_ACTIVATE_AFTER';
c_event_fetch                  constant varchar2(11) := 'EVENT_FETCH';
c_event_fetch_before           constant varchar2(18) := 'EVENT_FETCH_BEFORE';
c_event_fetch_cache_definition constant varchar2(28) := 'EVENT_FETCH_CACHE_DEFINITION';
c_event_fetch_cache_response   constant varchar2(26) := 'EVENT_FETCH_CACHE_RESPONSE';
c_event_fetch_network_resp_suc constant varchar2(28) := 'EVENT_FETCH_NETWORK_RESP_SUC';
c_event_fetch_network_resp_err constant varchar2(28) := 'EVENT_FETCH_NETWORK_RESP_ERR';
c_event_fetch_offline_page     constant varchar2(24) := 'EVENT_FETCH_OFFLINE_PAGE';
c_event_fetch_network_fallback constant varchar2(28) := 'EVENT_FETCH_NETWORK_FALLBACK';
c_event_sync                   constant varchar2(10) := 'EVENT_SYNC';
c_event_push                   constant varchar2(10) := 'EVENT_PUSH';
c_event_push_before            constant varchar2(17) := 'EVENT_PUSH_BEFORE';
c_event_push_after             constant varchar2(16) := 'EVENT_PUSH_AFTER';
c_event_notificationclick      constant varchar2(23) := 'EVENT_NOTIFICATIONCLICK';
c_event_notificationclick_bef  constant varchar2(30) := 'EVENT_NOTIFICATIONCLICK_BEFORE';
c_event_notificationclick_aft  constant varchar2(29) := 'EVENT_NOTIFICATIONCLICK_AFTER';
c_event_notificationclose      constant varchar2(23) := 'EVENT_NOTIFICATIONCLOSE';
c_event_canmakepayment         constant varchar2(20) := 'EVENT_CANMAKEPAYMENT';
c_event_paymentrequest         constant varchar2(20) := 'EVENT_PAYMENTREQUEST';

--==============================================================================
-- Internal:
--
-- This procedure is used to emit the Web App Manifest for an APEX app
--
-- The Web App Manifest is responsible for holding the definition on the
-- application that will be installed on devices (mobile and desktop).
--
-- The APEX engine will generate a Web App Manifest file will be based on 
-- declarative options in the application properties.
-- 
-- At runtime, the Web App Manifest will be included in the <head> section of the page.
-- 
-- In addition to those APEX declarative options, developers will be able to 
-- enter a custom manifest textarea, with additional JSON data. If a property
-- in custom manifest exists in the declarative options, that property 
-- takes precedence (overrides) over the declarative option
-- 
-- In the end the final Web App Manifest file will consist of
-- * Some default values defined in APEX (home URL, app name, etc.)
-- * Declarative options
-- * Custom options from pwa_manifest_custom
--==============================================================================
procedure emit_manifest;

--==============================================================================
-- Internal:
--
-- This procedure is used to emit the Service Worker for an APEX app
-- 
-- Service workers are JavaScript files that can execute code even when the app is not in use.
-- It can listen to events like fetching resources or handling notifications.

-- By default, the APEX engine generates the service worker with the following strategy:
-- * Install and activate the service worker
-- * Serve ressources from cache if cache exists
-- * Otherwise serve from network, then put ressource in cache
-- * Serve an offline page if network fails

-- The default service worker can be modified through hooks or by replacing events completely.
--==============================================================================
procedure emit_service_worker;

--==============================================================================
-- Internal:
--
-- This procedure is used to emit the Service Worker Hooks for an APEX app
-- 
-- Service Worker Hooks are used to customize the functionality of service worker events.
-- There are two ways of defining hooks:
-- 1. Hooking into existing events (keeping APEX functionnality)
-- 2. Overwriting existing events
--==============================================================================
procedure emit_service_worker_hooks;

--==============================================================================
-- Internal:
--
-- This procedure is used to
-- 1. emit the Service Worker registration JavaScript on an APEX page rendering
-- 2. emit PWA related event listeners
-- 3. emit PWA related APEX actions
-- 4. invoke the PWA components UI refresh JavaScript function
--==============================================================================
procedure emit_init_js;

--==============================================================================
-- Internal:
--
-- This procedure is used to emit <head> HTML tags that are useful
-- for a Progressive Web App on an APEX page rendering
--==============================================================================
procedure emit_header;

--==============================================================================
-- Internal:
--
-- Returns if a user has at least one device subscripted to push notifications
--
-- Parameters:
-- * p_application_id:  ID of the application that has the push subscription.
-- * p_user_name:       Username of the user that has the push subscription.
--
-- Returns:
-- boolean containing if a user is subscribed to an application
--
-- Example:
-- Verify if user SMITH has a push subscription for application 100.
--
-- begin
--     wwv_flow_pwa.has_push_subscription (
--         p_application_id => 100,
--         p_user_name      => 'SMITH' );
-- end;
--==============================================================================
function has_push_subscription (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2 default wwv_flow_security.g_user )
    return boolean;

--==============================================================================
-- Internal:
--
-- Subscribes a user to allow receiving push notifications from an application.
--
-- Parameters:
-- * p_application_id:         ID of the application that has the push subscription.
-- * p_user_name:              Username of the user that has the push subscription.
-- * p_subscription_interface: Subscription object (JSON) generated from a browser.
--
-- Example:
-- Subscribes a user to push notifications. This is usually used in
-- conjunction with APEX JavaScript API apex.pwa.subscribePushNotifications
-- and apex.pwa.getPushSubscription that can generate the subscription object.
--
-- begin
--     wwv_flow_pwa.subscribe_push_notifications (
--         p_subscription_interface => '{ "endpoint": "", "expirationTime": null, "keys": { "p256dh": "", "auth": "" } }' );
-- end;
--==============================================================================
procedure subscribe_push_notifications(
    p_application_id         in number   default wwv_flow_security.g_flow_id,
    p_user_name              in varchar2 default wwv_flow_security.g_user,
    p_subscription_interface in varchar2 );

--==============================================================================
-- Internal:
--
-- Unsubscribes a user to stop receiving push notifications from an application.
--
-- Parameters:
-- * p_application_id:         ID of the application that has the push subscription.
-- * p_user_name:              Username of the user that has the push subscription.
-- * p_subscription_interface: Subscription object (JSON) generated from a browser.
--                             if provided, it will only unsubscribe this subscription.
--                             if not provided, it will unsubscribe all subscriptions.
--
-- Example:
--   Unsubscribes a user to push notifications. This is usually used in
--   conjunction with APEX JavaScript API apex.pwa.unsubscribePushNotifications
--   and apex.pwa.getPushSubscription that can generate the subscription object.
--
-- begin
--     wwv_flow_pwa.unsubscribe_push_notifications;
-- end;
--==============================================================================
procedure unsubscribe_push_notifications(
    p_application_id         in number   default wwv_flow_security.g_flow_id,
    p_user_name              in varchar2 default wwv_flow_security.g_user,
    p_subscription_interface in varchar2 default null  );

--==============================================================================
-- Internal:
--
-- Sends a push notifications to a user. All devices that the user subscribed to
-- will receive the push notification.
--
-- Parameters:
-- * p_application_id:ID of the application that contains the user to send
--                    the push notification to. Defaults to current application.
-- * p_user_name:     Username of the user that should receive the push
--                    notification.
-- * p_title          Title of the push notification.
-- * p_body           Body of the push notification.
-- * p_icon_url       URL of the icon that should be displayed on the push
--                    notification. Defaults to the provided application icon.
-- * p_target_url     URL of the page that will be opened when the user clicks
--                    on the push notification. This works better when deep
--                    linking is enabled or rejoin session is enabled on the
--                    application. Defaults to the home page of the application.
--
-- Example:
-- Send a push notification to user SMITH in application 100.
--
-- begin
--     wwv_flow_pwa.send_push_notification (
--         p_application_id => 100,
--         p_user_name      => 'SMITH',
--         p_title          => 'Your order has been shipped',
--         p_body           => 'Order #123456 will arrive within 3 days.' );
-- end;
--==============================================================================
procedure send_push_notification (
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_title          in varchar2,
    p_body           in varchar2 default null,
    p_icon_url       in varchar2 default null,
    p_target_url     in varchar2 default null );

--==============================================================================
-- Internal:
--
-- Triggers the database job to send all push notifications in the queue.
--
-- Example:
-- begin
--     wwv_flow_pwa.push_queue;
-- end;
--==============================================================================
procedure push_queue;

--==============================================================================
-- Internal:
--
-- Send all push notifications in the queue immediately.
--
-- Parameters:
-- * p_force_yn: Force sending the push notifications regardless of the
--               configured interval between attempts.
--
-- Example:
-- begin
--     wwv_flow_pwa.push_queue_immediate;
-- end;
--==============================================================================
procedure push_queue_immediate (
    p_force_yn in varchar2 default 'N' );

--==============================================================================
-- Internal:
--
-- AJAX dispatcher for PWA related events
--==============================================================================
procedure ajax;

--==============================================================================
-- Regenerate push credential keys based on the provided application ID.
--
-- Parameters:
-- * p_application_id:   ID of the application. Defaults to current application.
--
-- Example:
-- Regenerate push credential keys for application 100.
--
-- begin
--     wwv_flow_pwa.generate_push_credentials (
--         p_application_id => 100 );
-- end;
--==============================================================================
procedure generate_push_credentials (
    p_application_id in number default wwv_flow_security.g_flow_id );

--==============================================================================
-- Update push credentials on the provided application ID.
--
-- Parameters:
-- * p_application_id:   ID of the application. Defaults to current application.
-- * p_credential_id:    ID of the credential to use for the application
--==============================================================================
procedure update_push_credentials (
    p_application_id in number default wwv_flow_security.g_flow_id,
    p_credential_id  in number );

--==============================================================================
-- Internal:
--
-- Indicates if required crypto for Web Push is available in the database
--==============================================================================
function is_push_crypto_available return boolean;

end wwv_flow_pwa;
/
show errors
