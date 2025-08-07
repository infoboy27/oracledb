
set define '^'
set verify off
prompt ... wwv_flow_issue_int

create or replace package wwv_flow_issue_int as
--===============================================================================
--
--  Copyright (c) Oracle Corporation 2019. All Rights Reserved.
--
--    NAME
--      wwv_flow_issue_int.sql
--
--    DESCRIPTION
--      Provides APIs to create and manage Issues
--
--    NOTES
--
--    MODIFIED    (MM/DD/YYYY)
--     dgault     12/13/2018 - Created
--
--===============================================================================
--
-----------------------------------------------------------------------
--< PUBLIC METHODS >---------------------------------------------------
-----------------------------------------------------------------------
--=====================================================================
--< upload_files>------------------------------------------------
--=====================================================================
--  Purpose: Upploads Attachemnts for a specific Issue
--
--  Comments:
----------------------------------------------------------------------
    procedure upload_files (
        p_issue_id     in    number,
        p_file_names   in    varchar2,
        p_files_info   out   clob
    );

--=====================================================================
--< GET_avatar>------------------------------------------------
--=====================================================================
--  Purpose: gets the users avatar HTML from the db
--
--  Comments:
----------------------------------------------------------------------
    function get_avatar (
        p_user_name        in   varchar2,
        p_image_size       in   number default 24,
        p_modifier_class   in   varchar2 default null,
        p_include_link     in   varchar2 default 'N',
        p_include_name     in   varchar2 default 'N'
    ) return varchar2;
--=====================================================================
--< GET_USER_NAME >------------------------------------------------
--=====================================================================
--  Purpose: Gets the type o event that was stored in the json
--
--  Comments:
----------------------------------------------------------------------
    function get_user_name (
        p_user_name in varchar2
    ) return varchar2;

--=====================================================================
--< GET_JSON_EVENT_TYPE >------------------------------------------------
--=====================================================================
--  Purpose: Gets the type o event that was stored in the json
--
--  Comments:
----------------------------------------------------------------------
    function get_json_event_type (
        p_json in clob
    ) return varchar2;
--=====================================================================
--< GET_JSON_EVENT_ACTION>------------------------------------------------
--=====================================================================
--  Purpose: Gets the type of ACTION that was stored in the json
--
--  Comments:
----------------------------------------------------------------------
    function get_json_event_action (
        p_json in clob
    ) return varchar2;

--=====================================================================
--< format_event_json >------------------------------------------------
--=====================================================================
--  Purpose: Remove attachments from an issue and record the event
--
--  Comments:
--
----------------------------------------------------------------------
    function format_event_json (
        p_json          in   clob,
        p_issue_title   in   varchar2 default null,
        p_issue_id      in   number default null,
        p_generate_link in   varchar2 default 'N'
    ) return clob;

--=====================================================================
--< format_event_for_email >------------------------------------------------
--=====================================================================
--  Purpose: Formats the JSOn for an event into the HTML needed in an email template
--
--  Comments:
----------------------------------------------------------------------
    function format_event_for_email (
        p_json          in   clob,
        p_issue_title   in   varchar2 default null
    ) return clob;

--=====================================================================
--< GEN_SLUG >---------------------------------------------------------
--=====================================================================
--  Purpose: Create the slug for a text string
--
--  Comments: Slugs are limited to 255 characters.
--
-------------------------------------------------------------------
    function gen_slug (
        p_text in varchar2
    ) return varchar2;

--=====================================================================
--< VALIDATE_SLUG >----------------------------------------------------
--=====================================================================
--  Purpose: Validate a slug
--
--  Comments: Validates a slug to make sure the following is true.
--       * No spaces or special characters
--       * All Lower Case
--       * words separated by single dash
--
-------------------------------------------------------------------
    function validate_slug (
        p_slug in varchar2
    ) return boolean;

--=====================================================================
--< GET_ISSUE_ID_FROM_SLUG >-------------------------------------------
--=====================================================================
--  Purpose: Create the slug for
--
--  Comments:
--
-------------------------------------------------------------------
    function get_issue_id_from_slug (
        p_slug in varchar2
    ) return number;

--=====================================================================
--< SET_STATUS >-------------------------------------------------------
--=====================================================================
--  Purpose: Set the status of an Issue and record the event
--
--  Comments:
--
----------------------------------------------------------------------
    procedure set_status (
        p_issue_id    in   number,
        p_status_id   in   varchar2
    );

--=====================================================================
--< ADD_LABELS >-------------------------------------------------------
--=====================================================================
--  Purpose: Add labels to an issue and record the event
--
--  Comments:
--
--  p_labels is a colon separated list of LABEL_IDs to add
----------------------------------------------------------------------
    procedure add_labels (
        p_issue_id    in   number,
        p_label_ids   in   varchar2
    );

--=====================================================================
--< REMOVE_LABELS >----------------------------------------------------
--=====================================================================
--  Purpose: Remove labels from an issue and record the event
--
--  Comments:
--
--  p_labels is a colon separated list of LABEL_IDs to remove
-------------------------------------------------------------------
    procedure remove_labels (
        p_issue_id    in   number,
        p_label_ids   in   varchar2
    );

--=====================================================================
--< ADD_MILESTONES >---------------------------------------------------
--=====================================================================
--  Purpose: Add milestones to an issue and recored the event
--
--  Comments:
--
--  p_milestone_ids is a colon separated list of MILESTONE_IDs to add
-------------------------------------------------------------------
    procedure add_milestones (
        p_issue_id        in   number,
        p_milestone_ids   in   varchar2
    );

--=====================================================================
--< REMOVE_MILESTONES >------------------------------------------------
--=====================================================================
--  Purpose: remove milestones from an issue and record the event
--
--  Comments:
--
--  p_milestone_ids is a colon separated list of MILESTONE_IDs to remove
----------------------------------------------------------------------
    procedure remove_milestones (
        p_issue_id        in   number,
        p_milestone_ids   in   varchar2
    );

--=====================================================================
--< ADD_ASSIGNEES >----------------------------------------------------
--=====================================================================
--  Purpose: Add assignees to an issue and record the event
--
--  Comments:
--
--  p_assignee_ids is a colon separated list of ASSIGNEE_IDs to add.
----------------------------------------------------------------------
    procedure add_assignees (
        p_issue_id       in   number,
        p_assignee_ids   in   varchar2
    );

--=====================================================================
--< REMOVE_ASSIGNEES >-------------------------------------------------
--=====================================================================
--  Purpose: Remove assignees from an issue and record the event
--
--  Comments:
--
--  p_assignee_ids is a colon separated list of ASSIGNEE_IDs to remove.
----------------------------------------------------------------------
    procedure remove_assignees (
        p_issue_id       in   number,
        p_assignee_ids   in   varchar2
    );

--=====================================================================
--< ADD_SUBSCRIBERS >--------------------------------------------------
--=====================================================================
--  Purpose: Add a subscriber to an issue and record the event
--
--  Comments:
--
--  p_subscriber_ids is a colon separated list of SUBSCRIBER_IDs to add
----------------------------------------------------------------------
    procedure add_subscribers (
        p_issue_id         in   number,
        p_subscriber_ids   in   varchar2
    );

--=====================================================================
--< REMOVE_SUBSCRIBERS >-----------------------------------------------
--=====================================================================
--  Purpose: Remove a subscriber from an issue and record the event
--
--  Comments:
--
--  p_subscriber_ids is a colon separated list of SUBSCRIBER_IDs to remove
----------------------------------------------------------------------
    procedure remove_subscribers (
        p_issue_id         in   number,
        p_subscriber_ids   in   varchar2
    );

--=====================================================================
--< ADD_ATTACHMENT >---------------------------------------------------
--=====================================================================
--  Purpose: Add an atttachment to an issue and record the event
--
--  Comments:
--
--  p_attachemnt is a BLOB that containst the attached file..
----------------------------------------------------------------------
    procedure add_attachment (
        p_issue_id     in   number,
        p_attachment   in   blob,
        p_file_name    in   varchar2,
        p_mime_type    in   varchar2,
        p_charset      in   varchar2
    );

--=====================================================================
--< REMOVE_ATTACHMENT >------------------------------------------------
--=====================================================================
--  Purpose: Remove attachments from an issue and record the event
--
--  Comments:
--
--  p_attachment_id is the ATTACHMENT_IDs to remove.
----------------------------------------------------------------------
    procedure remove_attachment (
        p_issue_id        in   number,
        p_attachment_id   in   number
    );

--=====================================================================
--< TRACK_COMMENT_EDIT >---------------------------------------------------
--=====================================================================
--  Purpose: Tracks the before text of a comment on edit
--
--  Comments:
--
--  p_issue_id - the issue for the comment
--  p_comment_id - the comment to update
--  p_comment_text - a CLOB that contains the old text of the comment
----------------------------------------------------------------------
    procedure track_comment_edit (
        p_comment_id     in   number,
        p_comment_text   in   clob
    );

--=====================================================================
--< TRACK_ISSUE_EDIT >---------------------------------------------------
--=====================================================================
--  Purpose: Update the core text of an issue.
--
--  Comments:
--
--  p_issue_id - the issue to update
--  p_issue_text - a CLOB that contains the old text of the issue
----------------------------------------------------------------------
    procedure track_issue_edit (
        p_issue_id     in   number,
        p_issue_text   in   clob
    );

--=====================================================================
--< ADD_DUPLIACATE >--------------------------------------------------
--=====================================================================
--  Purpose: Mark an issue as a duplicate
--
--  Comments:
--
--  p_issue_id - the issue to mark as suplicate
--  p_duplicate_issue_id - Issue that this issue is a duplicate of
----------------------------------------------------------------------
    procedure add_duplicate (
        p_issue_id                  in   number,
        p_duplicate_issue_id        in   number,
        p_duplicate_identified_by   in   varchar2,
        p_duplicate_identified_on   in   varchar2
    );

--=====================================================================
--< REMOVE_DUPLICATE >-----------------------------------------------
--=====================================================================
--  Purpose: REMOVE_DUPLICATE ISSUE
--
--  Comments:
--
--  p_issue_id - the issue to mark as suplicate
----------------------------------------------------------------------
    procedure remove_duplicate (
        p_issue_id in number
    );

--=====================================================================
--< ADD_ASSOCIATION >--------------------------------------------------
--=====================================================================
--  Purpose: Associate issue with a n application/page
--
--  Comments:
--
--  p_issue_id - the issue to mark as suplicate
--  p_application_id - Applicationt that this issue is associated with
--  p_page_id - Page this issue is associated With
----------------------------------------------------------------------
    procedure add_association (
        p_issue_id         in   number,
        p_application_id   in   number,
        p_page_id          in   number
    );

--=====================================================================
--< REMOVE_ASSOCIATION >-----------------------------------------------
--=====================================================================
--  Purpose: Remove association with Application/Page
--
--  Comments:
--
--  p_issue_id - the issue to remove association from
----------------------------------------------------------------------
    procedure remove_association (
        p_issue_id in number
    );

--=====================================================================
--< SHOW_COMMENT >-----------------------------------------------
--=====================================================================
--  Purpose: Show comment to all users
--
--  Comments:
--
--  p_comment_id - the id of the comment to show
----------------------------------------------------------------------
    procedure show_comment (
        p_comment_id in number
    );
--=====================================================================
--< HIDE_COMMENT >-----------------------------------------------
--=====================================================================
--  Purpose: Hide the comment from all but ADMIN users
--
--  Comments:
--
--  p_comment_id - the id of the comment to hide
----------------------------------------------------------------------
    procedure hide_comment (
        p_comment_id in number
    );
--=====================================================================
--< DELETE_COMMENT >-----------------------------------------------
--=====================================================================
--  Purpose: Delete the comment
--
--  Comments:
--
--  p_comment_id - the id of the comment to delete
----------------------------------------------------------------------
    procedure delete_comment (
        p_comment_id in number
    );
--=====================================================================
--< SOFT_DELETE_ISSUE >-----------------------------------------------
--=====================================================================
--  Purpose: Marks an issue as deleted (does not physically delete)
--
--  Comments:
--
--  p_issue_id - the id of the issue to soft delete
----------------------------------------------------------------------
    procedure soft_delete_issue (
        p_issue_id in number
    );

--=====================================================================
--< REASSIGN_ISSUES >-----------------------------------------------
--=====================================================================
--  Purpose: Reassigns issues from one user to another
--
--  Comments:
--
--  p_change_from - Current Assignee
--  p_change_to   - Target Assignee
--  p_for_issues  - OPEN or ALL
----------------------------------------------------------------------
    procedure reassign_issues (
        p_change_from   in   varchar2,
        p_change_to     in   varchar2,
        p_for_issues    in   varchar2
    );

--=====================================================================
--< BULK_REMOVE_MILESTONE >-----------------------------------------------
--=====================================================================
--  Purpose: Remove milestone from issues
--
--  Comments:
--
--  p_milestone_id - Milesone to remove
--  p_for_issues  - OPEN or ALL
----------------------------------------------------------------------
    procedure bulk_remove_milestone (
        p_milestone_id   in   varchar2,
        p_for_issues     in   varchar2 default 'ALL'
    );

--=====================================================================
--< BULK_REMOVE_LABELS >-----------------------------------------------
--=====================================================================
--  Purpose: Remove LABELS from issues
--
--  Comments:
--
--  p_label_or_group_id - Label or Label Group to remove
--  p_for_issues  - OPEN or ALL
----------------------------------------------------------------------
    procedure bulk_remove_labels (
        p_label_or_group_id   in   varchar2,
        p_for_issues          in   varchar2 default 'ALL'
    );
--=====================================================================
--< get_feedback_logged_as_info >-----------------------------------------------
--=====================================================================
--  Purpose: Get information about how the feedback was logged
--
--  Comments:
--
--  p_id - Feedback ID
--  p_type  - Logged as type 
----------------------------------------------------------------------

function get_feedback_logged_as_info (
    p_id   in number,
    p_type in varchar2 default 'ISSUE'
    ) return varchar2;

--
end wwv_flow_issue_int;
/

show errors