set define '^' verify off

prompt ... Create APEX ISSUE views

prompt ... apex_issues

create or replace  view apex_issues (
    workspace_id,
    workspace_name,
    issue_id,
    friendly_issue_number,
    issue_title,
    issue_slug,
    issue_text,
    issue_status,
    marked_as_deleted,
    duplicate_of_issue_id,
    duplicate_identified_on,
    duplicate_identified_by,
    related_application_id,
    related_page_id,
    created_on,
    created_by,
    updated_on,
    updated_by
) as
    select w.workspace_id,
           w.workspace        workspace_name,
       --
           i.id               issue_id,
           i.issue_number     friendly_issue_number,
           i.title            issue_title,
           i.slug             issue_slug,
           i.issue_text       issue_text,
           i.status           issue_status,
           i.deleted          marked_as_deleted,
           i.duplicate_of     duplicate_of_issue_id,
           i.duplicate_identified_on,
           i.duplicate_identified_by,
           i.application_id   related_application_id,
           i.page_id          related_page_id,
           i.created_on,
           i.created_by,
           i.updated_on,
           i.updated_by
      from wwv_companies_auth_restricted w,
           wwv_flow_issues               i
     where i.security_group_id = w.workspace_id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issues',
    p_table_comment     => 'All Issues logged within the APEX ISSUE system.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary key that identifies the workspace.',
      'workspace_name' , 'Name of the workspace.',
      'issue_id' , 'Primary key of the issue.',
      'friendly_issue_number' , 'User friendly system assigned issue number.',
      'issue_title' , 'Title of the issue.',
      'issue_slug' , 'Normalized unique text identifier for the issue.',
      'issue_text' , 'Detailed description of the issue. Uses Markdown formatting.',
      'issue_status' , 'Status of the issue (OPEN or CLOSED).',
      'marked_as_deleted' , 'Marks the issue as deleted. If so marked, it will not show in the main issues report.',
      'duplicate_of_issue_id' , 'If the issue is a duplicate of an existing issue, the unique id of the other issue.',
      'duplicate_identified_on' , 'Date the duplicate was identified.',
      'duplicate_identified_by' , 'User who identified the duplicate.',
      'related_application_id' , 'If the issue is related to a specific application, the id of the related application.',
      'related_page_id' , 'If the issue is related to a specific page in an application, the id of the related page.',
      'CREATED_BY' , 'Developer who created this issue.',
      'CREATED_ON' , 'Date on which this issue was created.',
      'UPDATED_BY' , 'Developer who last updated this issue.',
      'UPDATED_ON' , 'Date on which this issue was last updated.'
    )
  );
end;
/
     
prompt ... apex_issue_events

create or replace  view apex_issue_events (
    workspace_id,
    workdspace_name,
    issue_id,
    issue_title,
    issue_status,
    issue_makred_as_deleted,
    comment_id,
    event_id,
    event_date,
    event_json,
    created_on,
    created_by,
    updated_on,
    updated_by
)AS
select w.workspace_id   workspace_id,
       w.workspace      workspace_name,
       --
       i.id             issue_id,
       i.title          issue_title,
       i.status 		issue_status,
       i.deleted 		issue_makred_as_deleted,
       c.id             comment_id,
       e.id             event_id,
       e.event_date     event_date,
       e.event_text     event_json,
       e.created_on     created_on,
       e.created_by     created_by,
       e.updated_on     updated_on,
       e.updated_by     update_by
  from wwv_companies_auth_restricted w,
       wwv_flow_issues               i, 
       wwv_flow_issue_events e,
       wwv_flow_issue_comments c
 where e.security_group_id = w.workspace_id
   and e.security_group_id = i.security_group_id (+)
   and e.issue_id = i.id (+)
   and e.security_group_id = c.security_group_id (+)
   and e.comment_id = c.id (+);

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_events',
    p_table_comment     => 'All events linked to either an ISSUE_ID or COMMENT_ID.',
    p_column_comments   => wwv_flow_t_varchar2 ( 
      'workspace_id' , 'Primary key that identifies a workspace.',
      'workdspace_name' , 'Name of the workspace.',
      'issue_id' , 'Primary key of the related Issue.',
      'issue_title' , 'Title of the related Issue.',
      'issue_status' , 'Status of the related issue (OPEN or CLOSED).',
      'issue_makred_as_deleted' , 'Has the issue been marked as deleted within the system (Y or N)',
      'comment_id' , 'Primary Key of the related Comment',
      'event_id' , 'Primary Key of the Event.',
      'event_date' , 'Date the Event Occurred.',
      'event_json' , 'Event JSON containting details of the event.',
      'created_on' , 'Date the event record was created.',
      'created_by' , 'Developer that created the event record.',
      'updated_on' , 'Date the event record was last updated.',
      'updated_by' , 'Developer that last updated the event recored.'
    )
  );
end;
/

prompt ... apex_issue_comments

create or replace  view apex_issue_comments (
    workspace_id,
    workspace_name,
    issue_id,
    issue_title,
    issue_status,
    issue_makred_as_deleted,
    comment_id,
    comment_text,
    row_version,
    hidden,
    created_on,
    created_by,
    updated_on,
    updated_by
) as
    select w.workspace_id   workspace_id,
           w.workspace      workspace_name,
       --
           i.id             issue_id,
           i.title          issue_title,
           i.status 		issue_status,
           i.deleted 		issue_makred_as_deleted,
           c.id             comment_id,
           c.comment_text   comment_text,
           c.row_version    row_version,
           c.public_yn      hidden,
           c.created_on     created_on,
           c.created_by     created_by,
       c.updated_on     updated_on,
           c.updated_by     updated_by
      from wwv_companies_auth_restricted w,
           wwv_flow_issues               i,
           wwv_flow_issue_comments       c
     where c.security_group_id = w.workspace_id
       and c.security_group_id = i.security_group_id 
       and c.issue_id = i.id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_comments',
    p_table_comment     => 'Lists all comments for a spcific issue.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary key that identifies a workspace.',
      'workspace_name' , 'Name of the workspace.',
      'issue_id' , 'Primary key of the related Issue.',
      'issue_title' , 'Title of the related Issue.',
      'issue_status' , 'Status of the related issue (OPEN or CLOSED).',
      'issue_makred_as_deleted' , 'Has the issue been marked as deleted within the system (Y or N)',
      'comment_id' , 'Primary Key of the related comment ',
      'comment_text' , 'Text of the comment.',
      'row_version' , 'Row version of the comment.',
      'hidden' , 'Has the comment been hidden from view by an admin or the comment owner.',
      'created_on' , 'Date the comment was created.',
      'created_by' , 'Developer that created the comment.',
      'updated_on' , 'Date the comment was last updated.',
      'updated_by' , 'Developer that last updated the comment'
    )
  );
end;
/

prompt apex_issue_attachments

create or replace  view apex_issue_attachments (
    workspace_id,
    workspace_name,
    issue_id,
    issue_title,
    issue_status,
    issue_makred_as_deleted,
    attachment_id,
    file_name,
    file_name_slug,
    file_blob,
    mime_type,
    charset,
    created_on,
    created_by,
    updated_on,
    updated_by
) as
    select w.workspace_id     workspace_id,
           w.workspace        workspace_name,
       --
           i.id               issue_id,
           i.title            issue_title,
           i.status 		  issue_status,
           i.deleted 		  issue_makred_as_deleted,
           a.id               attachment_id,
           a.file_name        file_name,
           a.file_name_slug   file_name_slug,
           a.file_blob        file_blob,
           a.mime_type        mime_type,
           a.charset          charset,
           a.created_on       created_on,
           a.created_by       created_by,
           a.updated_on       updated_on,
           a.updated_by     updated_by
      from wwv_companies_auth_restricted w,
           wwv_flow_issues               i,
           wwv_flow_issue_attachments    a
     where a.security_group_id = w.workspace_id
       and a.security_group_id = i.security_group_id
       and a.issue_id = i.id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_attachments',
    p_table_comment     => 'Attachments associated with a given issue.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary key that identifies a workspace.',
      'workspace_name' , 'Name of the workspace.',
      'issue_id' , 'Primary key of the related Issue.',
      'issue_title' , 'Title of the related Issue.',
      'issue_status' , 'Status of the related issue (OPEN or CLOSED).',
      'issue_makred_as_deleted' , 'Has the issue been marked as deleted within the system (Y or N)',
      'attachment_id' , 'Primary key of the attachment',
      'file_name' , 'Attachment File Name',
      'file_name_slug' , 'Normalized unique text identifier for the attachment',
      'file_blob' , 'BLOB column holding the file attachment',
      'mime_type' , 'Mime type of the file attachment',
      'charset' , 'Character set of the file attachment',
      'created_on' , 'Developer who created this attachment.',
      'created_by' , 'Date on which this attachment was created.',
      'updated_on' , 'Developer who last updated this attachment.',
      'updated_by' , 'Date on which this attachment was last updated.'
    )
  );
end;
/

prompt ... apex_issue_stakeholders

create or replace  view apex_issue_stakeholders (
    workspace_id,
    workspace_name,
    issue_id,
    issue_title,
    issue_status,
    issue_makred_as_deleted,
    stakeholder,
    stakeholder_type,
    created_on,
    created_by,
    updated_on,
    updated_by
) as
    select w.workspace_id       workspace_id,
           w.workspace          workspace_name,
       --
           i.id                 issue_id,
           i.title              issue_title,
           i.status 			issue_status,
           i.deleted 			issue_makred_as_deleted,
           s.stakeholder        stakeholder,
           s.stakeholder_type   stakeholder_type,
           s.created_on         created_on,
           s.created_by         created_by,
           s.updated_on         updated_on,
           s.updated_by         updated_by
      from wwv_companies_auth_restricted w,
           wwv_flow_issues               i,
           wwv_flow_issue_stakeholders   s
     where s.security_group_id = w.workspace_id
       and s.security_group_id = i.security_group_id
       and s.issue_id = i.id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_stakeholders',
    p_table_comment     => 'Stakeholders (ASSIGNEES or SUBSCRIBERS) for a given issue',
    p_column_comments   => wwv_flow_t_varchar2 (  
      'workspace_id' , 'Primary key that identifies a workspace.',
      'workspace_name' , 'Name of the workspace.',
      'issue_id' , 'Primary key that identifies the realted Issue.',
      'issue_title' , 'Title of the related issue.',
      'issue_status' , 'Status of the related issue (OPEN or CLOSED).',
      'issue_makred_as_deleted' , 'Has the issue been marked as deleted within the system (Y or N)',
      'stakeholder' , 'Developer that is a stakeholder for the issue.',
      'stakeholder_type' , 'Type of stakeholder (ASSIGNEE or SUBSCRIBER).',
      'created_on' , 'Developer who created this attachment.',
      'created_by' , 'Date on which this attachment was created.',
      'updated_on' , 'Developer who last updated this attachment.',
      'updated_by' , 'Date on which this attachment was last updated.'
    )
  );
end;
/

prompt ... apex_issue_milestones

create or replace  view apex_issue_milestones (
    workspace_id,
    workspace_name,
    milestone_id,
    friendly_milestone_id,
    milestone_name,
    milestone_slug,
    milestone_date,
    milestone_desc,
    milestone_status,
    milestone_owner,
    created_on,
    updated_by,
    updated_on
) as
    select w.workspace_id   workspace_id,
           w.workspace      workspace_name,
       --
           id               milestone_id,
           milestone_id     friendly_milestone_id,
           milestone_name,
           milestone_slug,
           milestone_date,
           milestone_desc,
           milestone_status,
           created_by       milestone_owner,
           created_on,
           updated_by,
           updated_on
      from wwv_flow_milestones           m,
           wwv_companies_auth_restricted w
     where m.security_group_id = w.workspace_id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_milestones',
    p_table_comment     => 'All milestones available to the issues system.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary Key that identifies the workspace.',
      'workspace_name' , 'Name of the Workspace.',
      'milestone_id' , 'Primary Key that identifies the Milestone.',
      'friendly_milestone_id' , 'User friendly system assigned Milestone Number.',
      'milestone_name' , 'Name of the milestone.',
      'milestone_slug' , 'Normalized unique text identifier for the milestone.',
      'milestone_date' , 'Date for the milestone.',
      'milestone_desc' , 'Description of the milestone.',
      'milestone_status' , 'Status of the milestone (OPEN or CLOSED).',
      'milestone_owner' , 'Developer that created the milestone.',
      'created_on' , 'Date the milestone was created',
      'updated_by' , 'Developer that last updated the milestone.',
      'updated_on' , 'Date the milestone was last updated.'
    )
  );
end;
/

prompt ... apex_issue_label_groups

create or replace  view apex_issue_label_groups (
    workspace_id,
    workspace_name,
    label_group_id,
    label_group_name,
    label_group_color_class,
    label_group_desc,
    values_are_exclusive,
    created_by,
    created_on,
    updated_by,
    updated_on
) as
    select w.workspace_id           workspace_id,
           w.workspace              workspace_name,
       --
           g.id                     label_group_id,
           g.group_name             label_group_name,
           g.group_color            label_group_color_class,
           g.group_description      label_group_desc,
           g.values_are_exclusive   values_are_exclusive,
           created_by,
           created_on,
           updated_by,
           updated_on
      from wwv_flow_label_groups         g,
           wwv_companies_auth_restricted w
     where g.security_group_id = w.workspace_id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_label_groups',
    p_table_comment     => 'All Label Groups available to the issues system.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary Key that identifies the workspace.',
      'workspace_name' , 'Name of the Workspace.',
      'label_group_id' , 'Primary Key for the Label Group',
      'label_group_name' , 'Label Group Name',
      'label_group_color_class' , 'CSS Class used to style the color of labels in the group.',
      'label_group_desc' , 'Description of the Label Group.',
      'values_are_exclusive' , 'Designates if the values within the group are exclusively assigned to issues (Y or N).',
      'created_by' , 'Developer that created the milestone.',
      'created_on' , 'Date the milestone was created',
      'updated_by' , 'Developer that last updated the milestone.',
      'updated_on' , 'Date the milestone was last updated.'
    )
  );
end;
/

prompt ... apex_issue_labels

create or replace  view apex_issue_labels (
    workspace_id,
    workspace_name,
    label_id,
    label_group_id,
    label_group_name,
    label_group_color_class,
    label_name,
    label_desc,
    label_slug,
    display_sequence,
    created_by,
    created_on,
    updated_by,
    updated_on
) as
    select w.workspace_id   workspace_id,
           w.workspace      workspace_name,
       --
           l.id             label_id,
           l.label_group_id,
           g.group_name     label_group_name,
           g.group_color    label_group_color_class,
           l.label_name,
           l.label_desc,
           l.label_slug,
           l.display_sequence,
           l.created_by,
           l.created_on,
           l.updated_by,
           l.updated_on
      from wwv_flow_labels               l,
           wwv_flow_label_groups         g,
           wwv_companies_auth_restricted w
     where l.security_group_id = w.workspace_id
       and g.security_group_id = l.security_group_id
       and l.label_group_id = g.id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_labels',
    p_table_comment     => 'All Labels available to the issues system.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary Key that identifies the workspace.',
      'workspace_name' , 'Name of the Workspace.',
      'label_id' , 'Primary key of the label.',
      'label_group_id' , 'Primary key of the parent Label Group',
      'label_group_name' , 'Name of the Parent label Group',
      'label_group_color_class' , 'CSS Class used to style the labels within the parent group.',
      'label_name' , 'Name of the label.',
      'label_desc' , 'Description of the label.',
      'label_slug' , 'Normalized unique text identifier for the label.',
      'display_sequence' , 'Display sequence used to order labels in the UI.',
      'created_by' , 'Developer that created the milestone.',
      'created_on' , 'Date the milestone was created',
      'updated_by' , 'Developer that last updated the milestone.',
      'updated_on' , 'Date the milestone was last updated.'
    )
  );
end;
/

prompt ... apex_issue_label_relation

create or replace  view apex_issue_label_relation (
    workspace_id,
    workspace_name,
    issue_id,
    issue_title,
    issue_slug,
    issue_status,
    issue_makred_as_deleted,
    label_group_id,
    label_group_name,
    label_group_color_class,
    label_id,
    label_name,
    label_slug,
    created_by,
    created_on,
    updated_by,
    updated_on
) as
    select w.workspace_id   workspace_id,
           w.workspace      workspace_name,
       --
           i.id             issue_id,
           i.title          issue_title,
           i.slug           issue_slug,
           i.status         issue_status,
           i.deleted        issue_marked_as_deleted,
           g.id             label_group_id,
           g.group_name     label_group_name,
           g.group_color    label_group_color_class,
           l.id             label_id,
           l.label_name     label_name,
           l.label_slug     label_slug,
           il.created_by,
           il.created_on,
           il.updated_by,
           il.updated_on
      from wwv_flow_issues               i,
           wwv_flow_labels               l,
           wwv_flow_label_groups         g,
           wwv_flow_issue_labels         il,
           wwv_companies_auth_restricted w
     where i.security_group_id = w.workspace_id
       and g.security_group_id = i.security_group_id
       and l.security_group_id = i.security_group_id
       and il.security_group_id = i.security_group_id
       and il.issue_id = i.id
       and il.label_id = l.id
       and l.label_group_id = g.id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_label_relation',
    p_table_comment     => 'A list of Issues and associated labels.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary Key that identifies the workspace.',
      'workspace_name' , 'Name of the Workspace.',
      'issue_id' , 'Primary Key of the related issue.',
      'issue_title' , 'Title of the related issue.',
      'issue_slug' , 'Normalized unique text identifier for the related issue.',
      'issue_status' , 'Status of the related issue (OPEN or CLOSED).',
      'issue_makred_as_deleted' , 'Has the issue been marked as deleted within the system (Y or N)',
      'label_group_id' , 'Primary key for the related Label Group.',
      'label_group_name' , 'Name of the related Label Group.',
      'label_group_color_class' , 'CSS Class used to style members of the Label Group.',
      'label_id' , 'Primary Key for the related Label.',
      'label_name' , 'Name of the related Label.',
      'label_slug' , 'Normalized unique text identifier for the related label.',
      'created_by' , 'Developer that created the milestone.',
      'created_on' , 'Date the milestone was created',
      'updated_by' , 'Developer that last updated the milestone.',
      'updated_on' , 'Date the milestone was last updated.'
    )
  );
end;
/

prompt ... apex_issue_milestone_relation

create or replace  view apex_issue_milestone_relation (
    workspace_id,
    workspace_name,
    issue_id,
    issue_title,
    issue_status,
    issue_makred_as_deleted,
    issue_slug,
    milestone_id,
    milestone_name,
    milestone_date,
    friendly_milestone_id,
    milestone_slug,
    milestone_status,
    created_by,
    created_on,
    updated_by,
    updated_on
) as
    select w.workspace_id       workspace_id,
           w.workspace          workspace_name,
       --
           i.id                 issue_id,
           i.title              issue_title,
           i.status             issue_status,
           i.deleted            issue_marked_as_deleted,
           i.slug               issue_slug,
           m.id                 milestone_id,
       m.milestone_name     milestone_name,
           m.milestone_date     milestone_date,
           m.milestone_id       friendly_milestone_id,
           m.milestone_slug     milestone_slug,
           m.milestone_status   milestone_status,
           im.created_by,
           im.created_on,
           im.updated_by,
           im.updated_on
      from wwv_flow_issues               i,
           wwv_flow_milestones           m,
           wwv_flow_issue_milestones     im,
           wwv_companies_auth_restricted w
     where i.security_group_id = w.workspace_id
       and m.security_group_id = i.security_group_id
       and im.security_group_id = i.security_group_id
       and im.issue_id = i.id
       and im.milestone_id = m.id;
       
begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_milestone_relation',
    p_table_comment     => 'A list of Issues and associated Milestones.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary Key that identifies the workspace.',
      'workspace_name' , 'Name of the Workspace.',
      'issue_id' , 'Primary key of the related issue.',
      'issue_title' , 'Title of the related issue.',
      'issue_status' , 'Status of the related issue (OPEN or CLOSED).',
      'issue_makred_as_deleted' , 'Has the issue been marked as deleted within the system (Y or N)',
      'issue_slug' , 'Normalized unique text identifier for the related issue.',
      'milestone_id' , 'Primary Key for the related milestone.',
      'milestone_name' , 'Name of the related milestone.',
      'milestone_date' , 'Date of the related milestone.',
      'friendly_milestone_id' , 'User friendly system assigned Milestone Number.',
      'milestone_slug' , 'Normalized unique text identifier for the related milestone.',
      'milestone_status' , 'Status of the related milestone (OPEN or CLOSED).',
      'created_by' , 'Developer that created the milestone.',
      'created_on' , 'Date the milestone was created',
      'updated_by' , 'Developer that last updated the milestone.',
      'updated_on' , 'Date the milestone was last updated.'
    )
  );
end;
/

prompt ... apex_issue_email_prefs

create or replace  view apex_issue_email_prefs (
    workspace_id,
    workspace_name,
    user_name,
    receive_emails_yn,
    notification_types,
    email_frequency,
    created_by,
    created_on,
    updated_by,
    updated_on
) as
    select w.workspace_id         workspace_id,
           w.workspace            workspace_name,
       --
           p.user_id              user_name,
           p.receive_emails_yn    receive_emails_yn,
           p.notification_types   notification_types,
           p.frequency            email_frequency,
           p.created_by,
           p.created_on,
           p.updated_by,
           p.updated_on
      from wwv_flow_issue_email_prefs    p,
           wwv_companies_auth_restricted w
     where p.security_group_id = w.workspace_id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_email_prefs',
    p_table_comment     => 'A list of Issues and associated Milestones.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary Key that identifies the workspace.',
      'workspace_name' , 'Name of the Workspace.',
      'user_name' , 'Workspace user whos preferences are defined by this record',
      'receive_emails_yn' , 'Should the user recieve email notifications (Y or N)',
      'notification_types' , 'Colon separated list of notifications requested (ISSUE_EDIT COMMENT_ADD COMMENT_EDIT STATUS ASSIGNEE SUBSCRIBER MILESTONE LABEL DUPLICATE ASSOCIATION ATTACHMENT)',
      'email_frequency' , 'Frequency to send emails (IMMEDIATELY HOURLY DAILY)',
      'created_by' , 'Developer that created the milestone.',
      'created_on' , 'Date the milestone was created',
      'updated_by' , 'Developer that last updated the milestone.',
      'updated_on' , 'Date the milestone was last updated.'
    )
  );
end;
/

prompt ... apex_issue_notifications

create or replace  view apex_issue_notifications (
    workspace_id,
    workspace_name,
    user_name,
    issue_id,
    issue_title,
    issue_status,
    issue_marked_as_deleted,
    comment_id,
    notification_read_yn,
    notification_email_sent_yn,
    notification_email_sent_on,
    notification_created_on,
    notification_type,
    event_id
) as
    select w.workspace_id    workspace_id,
           w.workspace       workspace_name,
       --
           n.user_id         user_name,
           i.id              issue_id,
           i.title           issue_title,
           i.status          issue_status,
           i.deleted         issue_marked_as_deleted,
           n.comment_id      comment_id,
           n.read_yn         notification_read_yn,
           n.email_sent_yn   notification_email_sent_yn,
           n.email_sent_on   notification_email_sent_on,
           n.created_on      notification_created_on,
           n.type            notification_type,
           n.event_id        event_id
      from wwv_flow_issue_notifications   n,
           wwv_flow_issues                i,
           wwv_companies_auth_restricted  w
     where n.security_group_id = w.workspace_id
       and n.issue_id is not null
       and n.issue_id = i.id
       and i.security_group_id = n.security_group_id
    union
    select w.workspace_id    workspace_id,
           w.workspace       workspace_name,
       --
           n.user_id         user_name,
           i.id              issue_id,
           i.title           issue_title,
           i.status          issue_status,
           i.deleted         issue_marked_as_deleted,
           n.comment_id      comment_id,
           n.read_yn         notification_read_yn,
           n.email_sent_yn   notification_email_sent_yn,
           n.email_sent_on   notification_email_sent_on,
           n.created_on      notification_created_on,
           n.type            notification_type,
           n.event_id        event_id
      from wwv_flow_issue_notifications   n,
           wwv_flow_issues                i,
           wwv_flow_issue_comments        c,
           wwv_companies_auth_restricted  w
     where n.security_group_id = w.workspace_id
       and n.comment_id is not null
       and c.id = n.comment_id
       and c.security_group_id = n.security_group_id
       and i.id = c.issue_id;

begin
  wwv_flow_upgrade.add_table_comments (
    p_table_name        => 'apex_issue_notifications',
    p_table_comment     => 'Issue system notifications for a given user.',
    p_column_comments   => wwv_flow_t_varchar2 (
      'workspace_id' , 'Primary Key that identifies the workspace.',
      'workspace_name' , 'Name of the Workspace.',
      'user_name' , 'Workspace user whos preferences are defined by this record',
      'user_name' , 'Developer user for which this notification exists.',
      'issue_id' , 'Primary key of the related issue.',
      'issue_title' , 'Title of the related issue.',
      'issue_status' , 'Status of the related issue.',
      'issue_marked_as_deleted' , 'Whether the related issue has been marked as deleted.',
      'comment_id' , 'Primary key of the related comment.',
      'notification_read_yn' , 'Has the notification seen ready by the user via the UI (Y or N).',
      'notification_email_sent_yn' , 'Has an email been sent to the user (Y or N)',
      'notification_email_sent_on' , 'Date an email was sent to the user.',
      'notification_created_on' , 'Date the notification was created by the system.',
      'notification_type' , 'Type of notification (ISSUE_EDIT COMMENT_ADD COMMENT_EDIT STATUS ASSIGNEE SUBSCRIBER MILESTONE LABEL DUPLICATE ASSOCIATION ATTACHMENT)',
      'event_id' , 'Primary key of the related event.'
    )
  );
end;
/

prompt ...done creating APEX ISSUE VIEWS
set define '^'
