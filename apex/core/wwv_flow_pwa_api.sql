set define '^' verify off
prompt ...wwv_flow_pwa_api.sql
create or replace package wwv_flow_pwa_api authid current_user as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2022, 2023, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_pwa_api.sql
--
--    DESCRIPTION
--      This package is used to provide utilities to applications
--      that have enabled Progressive Web App
--      such as:
--      * subscribing and unsubscribing users for push notificiations.
--      * verifiying subscription for push notificiations.
--      * send push notifications to subscribed users.
--
--    Since: 23.1
--
--    MODIFIED   (MM/DD/YYYY)
--    vmorneau   11/25/2022 - Created
--
--------------------------------------------------------------------------------

--==============================================================================
-- Globals
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

--==============================================================================
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
--     apex_pwa.has_push_subscription (
--         p_application_id => 100,
--         p_user_name      => 'SMITH' );
-- end;
--
-- Since: 23.1
--==============================================================================
function has_push_subscription(
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2 default wwv_flow_security.g_user )
    return boolean;

--==============================================================================
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
--     apex_pwa.subscribe_push_notifications (
--         p_subscription_interface => '{ "endpoint": "", "expirationTime": null, "keys": { "p256dh": "", "auth": "" } }' );
-- end;
--
-- Since: 23.1
--==============================================================================
procedure subscribe_push_notifications(
    p_application_id         in number   default wwv_flow_security.g_flow_id,
    p_user_name              in varchar2 default wwv_flow_security.g_user,
    p_subscription_interface in varchar2 );

--==============================================================================
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
--     apex_pwa.unsubscribe_push_notifications;
-- end;
--
-- Since: 23.1
--==============================================================================
procedure unsubscribe_push_notifications(
    p_application_id         in number   default wwv_flow_security.g_flow_id,
    p_user_name              in varchar2 default wwv_flow_security.g_user,
    p_subscription_interface in varchar2 default null );

--==============================================================================
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
--     apex_pwa.send_push_notification (
--         p_application_id => 100,
--         p_user_name      => 'SMITH',
--         p_title          => 'Your order has been shipped',
--         p_body           => 'Order #123456 will arrive within 3 days.' );
-- end;
--
-- Since: 23.1
--==============================================================================
procedure send_push_notification(
    p_application_id in number   default wwv_flow_security.g_flow_id,
    p_user_name      in varchar2,
    p_title          in varchar2,
    p_body           in varchar2 default null,
    p_icon_url       in varchar2 default null,
    p_target_url     in varchar2 default null );

--==============================================================================
-- Triggers the database job to send all push notifications in the queue.
--
-- Example:
-- begin
--     apex_pwa.push_queue;
-- end;
--
-- Since: 23.1
--==============================================================================
procedure push_queue;

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
--     apex_pwa.generate_push_credentials (
--         p_application_id => 100 );
-- end;
--
-- Since: 23.1
--==============================================================================
procedure generate_push_credentials (
    p_application_id in number default wwv_flow_security.g_flow_id );

end wwv_flow_pwa_api;
/
show errors
