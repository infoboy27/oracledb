set define '^'
set verify off
prompt ...wwv_flow_issue_notify_int

create or replace package wwv_flow_issue_notify_int as
--===============================================================================
--
--  Copyright (c) Oracle Corporation 2019. All Rights Reserved.
--
--    NAME
--      wwv_flow_ISSUE_NOTIFY_INT.sql
--
--    DESCRIPTION
--      Provides notifications services for the ISSUES application
--
--    NOTES
--
--    MODIFIED    (MM/DD/YYYY)
--     dgault     06/03/2019 - Created
--
--===============================================================================
--
-----------------------------------------------------------------------
--< PUBLIC METHODS >---------------------------------------------------
-----------------------------------------------------------------------
--=====================================================================
--< set_default_email_prefs >--------------------------------------
--=====================================================================
-- Purpose: Set Default Email Preferences for a user if they don't already exists
--
-- Defaults will be :
--  receive_emails_yn = Y
--  notification_types= 'ISSUE_EDIT:COMMENT_ADD:COMMENT_EDIT:STATUS:ASSIGNEE:SUBSCRIBER:MILESTONE:LABEL:DUPLICATE:ASSOCIATION:ATTACHMENT'
--  frequency = 'IMMEDIATE'

procedure set_default_email_prefs (
        p_user_name in varchar2
    );
--=====================================================================
--< send_summaries >--------------------------------------
--=====================================================================
--  Purpose: Sunds summary emails to those that have outstanding notifications
--
--  Comments:
--
-----------------------------------------------------------------------
    procedure send_summaries;

--=====================================================================
--< get_notification_prefs >--------------------------------------
--=====================================================================
--  Purpose: Retuirns Y or N depending on whether user is subscribed
--
--  Comments:
--
--  If p_notification_type is null then the function returns whether or
--  not the user is subscribed to emails.
--
-- If p_notification_type is not null then the function returns whether
-- the user is subscribed to that specific notification type
-----------------------------------------------------------------------
    function get_notification_prefs (
        p_user_name             in   varchar2,
        p_notification_type   in   varchar2 default null,
        p_security_group_id   in   number default wwv_flow_security.g_security_group_id
    ) return varchar2;

--=====================================================================
--< get_notification_frequency>----------------------------------------
--=====================================================================
--  Purpose: Retuirns frequency of notifications for user
--
--  Comments:
--
--  Return will be one of (IMMEDIATELLY, HOURLY, DAILY)
-----------------------------------------------------------------------
    function get_notification_frequency (
        p_user_name             in   varchar2,
        p_security_group_id   in   number default wwv_flow_security.g_security_group_id
    ) return varchar2;
--=====================================================================
--< save_notification_prefs>----------------------------------------
--=====================================================================
--  Purpose: Saves notification preferences for a user
--
--  Comments:
-----------------------------------------------------------------------
    procedure save_notification_prefs (
        p_user_name         in   varchar2,
        p_receive_email   in   varchar2,
        p_types           in   varchar2,
        p_frequency       in   varchar2
    );


--=====================================================================
--< mark_as_sent >----------------------------------------
--=====================================================================
--  Purpose: Marks a notification as sent for a specific notification_id
--
--  Comments:
-----------------------------------------------------------------------
    procedure mark_as_sent (
        p_notification_id in number
    );

--=====================================================================
--< mark_as_sent_for_user >----------------------------------------
--=====================================================================
--  Purpose: Marks a notification as sent for all notification for a specific user
--
--  Comments:
-----------------------------------------------------------------------
    procedure mark_as_sent_for_user (
        p_user_name in   varchar2,
        p_security_group_id   in   number default wwv_flow_security.g_security_group_id
    );

--=====================================================================
--< add_notification >----------------------------------------
--=====================================================================
--  Purpose: Marks a notification as sent for all notification for a specific user
--
--  Comments:
-----------------------------------------------------------------------
    procedure add_notification (
        p_notification_type   in   varchar2,
        p_issue_id            in   number default null,
        p_comment_id          in   number default null,
        p_event_id            in   number default null
    );

--=====================================================================
--< clear_notifications >----------------------------------------
--=====================================================================
--  Purpose: deletes all notifications for the specified user
--
--  Comments:
-----------------------------------------------------------------------
    procedure clear_notifications (
        p_user_name in varchar2
    );

--=====================================================================
--< mark_notifications_read >----------------------------------------
--=====================================================================
--  Purpose: Marks all notification as read for  for a specific user
--
--  Comments:
-----------------------------------------------------------------------
    procedure mark_notifications_read (
        p_user_name in varchar2
    );
end wwv_flow_issue_notify_int;
/

show errors