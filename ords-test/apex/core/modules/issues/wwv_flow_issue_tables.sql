set define off verify off

prompt ...create APEX Issue objects

Rem  Copyright (c) Oracle Corporation 2017 - 2019. All Rights Reserved.
Rem
Rem    NAME
Rem      wwv_issue_tables.sql
Rem
Rem    DESCRIPTION
Rem      Creates the tables required to run APEX Issues from within APEX
Rem
Rem    NOTES
Rem
Rem    REQUIRMENTS
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    dgault      11/26/2018 - Created

---------------------------------------------------------
-- create tables
---------------------------------------------------------
create table wwv_flow_label_groups 
   ( id                     number not null, 
    security_group_id       number not null, 
    group_name              varchar2(255) not null, 
    group_color             varchar2(20) not null, 
    group_description       varchar2(4000), 
    created_on              date not null, 
    created_by              varchar2(255) not null, 
    updated_on              date, 
    updated_by              varchar2(255), 
    values_are_exclusive    varchar2(1) default 'N' not null, 
    constraint wwv_flow_label_groups_pk primary key (id), 
    constraint wwv_flow_label_groups_c1 check (values_are_exclusive in ('Y', 'N')), 
    constraint wwv_flow_label_groups_u1 unique (security_group_id, group_name), 
    constraint wwv_flow_label_groups_f1 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
   ) ;

---------------------------------------------------------
create table wwv_flow_labels 
   ( id                     number not null, 
    label_group_id          number not null, 
    security_group_id       number not null, 
    label_name              varchar2(255) not null, 
    label_desc              varchar2(4000), 
    created_on              date not null, 
    created_by              varchar2(255) not null, 
    updated_on              date, 
    updated_by              varchar2(255), 
    label_slug              varchar2(255) not null, 
    display_sequence        number, 
    constraint wwv_flow_labels_pk primary key (id), 
    constraint wwv_flow_labels_u1 unique (security_group_id, label_name), 
    constraint wwv_flow_labels_u2 unique (security_group_id, label_slug), 
    constraint wwv_flow_labels_f1 foreign key (label_group_id)
      references wwv_flow_label_groups (id) on delete cascade, 
    constraint wwv_flow_labels_f2 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
   ) ;
create index wwv_flow_labels_i1 on wwv_flow_labels(label_group_id);

---------------------------------------------------------
create table wwv_flow_milestones 
   (id                    number not null, 
    security_group_id     number not null, 
    milestone_name        varchar2(255) not null, 
    milestone_desc        varchar(4000),
    milestone_date        date not null, 
    milestone_status      varchar2(20) default 'OPEN' not null,
    created_on            date not null, 
    created_by            varchar2(255) not null, 
    updated_on            date, 
    updated_by            varchar2(255), 
    milestone_slug        varchar2(255) not null, 
    milestone_id          number not null, 
    constraint wwv_flow_milestones_pk primary key (id), 
    constraint wwv_flow_milestones_u1 unique (security_group_id, milestone_id), 
    constraint wwv_flow_milestones_u2 unique (security_group_id, milestone_name), 
    constraint wwv_flow_milestones_u3 unique (security_group_id, milestone_slug), 
    constraint wwv_flow_milestones_c1 check (milestone_status in ('OPEN','CLOSED')), 
    constraint wwv_flow_milestones_f1 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
   ) ;

---------------------------------------------------------
create table wwv_flow_issues 
   (id                      number not null, 
    security_group_id       number not null, 
    title                   varchar2(255) not null, 
    slug                    varchar2(255) not null, 
    duplicate_of            number, 
    issue_text              clob not null, 
    row_version             number, 
    duplicate_identified_on date, 
    duplicate_identified_by varchar2(255), 
    application_id          number, 
    page_id                 number, 
    created_on              date not null, 
    created_by              varchar2(255) not null, 
    updated_on              date, 
    updated_by              varchar2(255), 
    status                  varchar2(20) default 'OPEN' not null, 
    issue_number            number not null, 
    deleted                 varchar2(1) default 'N' not null,
    constraint wwv_flow_issue_pk primary key (id), 
    constraint wwv_flow_issue_u1 unique (security_group_id, title), 
    constraint wwv_flow_issue_u2 unique (security_group_id, slug), 
    constraint wwv_flow_issue_u3 unique (security_group_id, issue_number), 
    constraint wwv_flow_issue_f1 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade, 
    constraint wwv_flow_issue_f2 foreign key (duplicate_of)
      references wwv_flow_issues (id) on delete set null deferrable initially deferred,
    constraint wwv_flow_issue_c1 check (deleted in ('Y','N'))
   ) ;


create index wwv_flow_issue_i1 on wwv_flow_issues (duplicate_of);
create index wwv_flow_issue_i2 on wwv_flow_issues (status);


---------------------------------------------------------
create table wwv_flow_issue_attachments 
   (id                    number not null, 
    issue_id              number not null, 
    security_group_id     number not null, 
    file_blob             blob, 
    file_name             varchar2(255) not null, 
    file_name_slug        varchar2(255) not null, 
    mime_type             varchar2(255),
    charset               varchar2(255), 
    created_on            date not null, 
    created_by            varchar2(255) not null, 
    updated_on            date, 
    updated_by            varchar2(255), 
    constraint wwv_flow_issue_attachments_pk primary key (id), 
    constraint wwv_flow_issue_attachments_u1 unique (security_group_id, issue_id, file_name_slug), 
    constraint wwv_flow_issue_attachments_f1 foreign key (issue_id)
      references wwv_flow_issues (id) on delete cascade, 
    constraint wwv_flow_issue_attachments_f2 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
   ) ;

create index wwv_flow_issue_attachments_i1 on wwv_flow_issue_attachments (issue_id);

---------------------------------------------------------
create table wwv_flow_issue_stakeholders 
   (issue_id              number not null, 
    stakeholder           varchar2(255) not null, 
    security_group_id     number not null, 
    stakeholder_type      varchar2(10) not null, 
    created_on            date not null, 
    created_by            varchar2(255) not null, 
    updated_on            date, 
    updated_by            varchar2(255), 
    constraint wwv_flow_issue_stakeholders_c1 check (stakeholder_type in ('ASSIGNEE','SUBSCRIBER')), 
    constraint wwv_flow_issue_stakeholders_pk primary key (issue_id, stakeholder, stakeholder_type), 
    constraint wwv_flow_issue_stakeholders_f1 foreign key (issue_id)
      references wwv_flow_issues (id) on delete cascade, 
    constraint wwv_flow_issue_stakeholders_f2 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
   ) ;

create index wwv_flow_issue_stakeholders_i1 on wwv_flow_issue_stakeholders(security_group_id);

---------------------------------------------------------
create table wwv_flow_issue_comments 
   (id                    number not null, 
    issue_id              number, 
    security_group_id     number not null, 
    comment_text          clob not null, 
    row_version           number, 
    public_yn             varchar2(1), 
    created_on            date not null, 
    created_by            varchar2(255) not null, 
    updated_on            date, 
    updated_by            varchar2(255), 
    constraint wwv_flow_issue_comments_c1 check (public_yn in ('Y','N')), 
    constraint wwv_flow_issue_comments_pk primary key (id), 
    constraint wwv_flow_issue_comments_f1 foreign key (issue_id)
      references wwv_flow_issues (id) on delete cascade, 
    constraint wwv_flow_issue_comments_f2 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
   ) ;

create index wwv_flow_issue_comments_i1 on wwv_flow_issue_comments(issue_id);
create index wwv_flow_issue_comments_i2 on wwv_flow_issue_comments(security_group_id);

---------------------------------------------------------
create table wwv_flow_issue_events 
   (id                    number not null, 
    issue_id              number, 
    comment_id            number, 
    security_group_id     number not null, 
    event_date            date not null, 
    event_text            clob not null, 
    created_on            date not null, 
    created_by            varchar2(255) not null, 
    updated_on            date, 
    updated_by            varchar2(255), 
    constraint wwv_flow_issue_events_pk primary key (id), 
    constraint wwv_flow_issue_events_f1 foreign key (issue_id)
      references wwv_flow_issues (id) on delete cascade, 
    constraint wwv_flow_issue_events_f2 foreign key (comment_id)
      references wwv_flow_issue_comments (id) on delete cascade, 
    constraint wwv_flow_issue_events_f3 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
   ) ;

create index wwv_flow_issue_events_i1 on wwv_flow_issue_events (comment_id);
create index wwv_flow_issue_events_i3 on wwv_flow_issue_events (issue_id);
create index wwv_flow_issue_events_i2 on wwv_flow_issue_events (security_group_id);
---------------------------------------------------------
create table wwv_flow_issue_milestones 
   (issue_id            number, 
    milestone_id        number, 
    security_group_id   number not null, 
    created_on          date not null, 
    created_by          varchar2(255) not null, 
    updated_on          date, 
    updated_by          varchar2(255), 
    constraint wwv_flow_issue_milestones_pk primary key (issue_id, milestone_id), 
    constraint wwv_flow_issue_milestones_f1 foreign key (issue_id)
      references wwv_flow_issues (id) on delete cascade, 
    constraint wwv_flow_issue_milestones_f2 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade, 
    constraint wwv_flow_issue_milestones_f3 foreign key (milestone_id)
      references wwv_flow_milestones (id)
   ) ;

create index wwv_flow_issue_milestones_i1 on wwv_flow_issue_milestones (security_group_id);
create index wwv_flow_issue_milestones_i2 on wwv_flow_issue_milestones (milestone_id);

---------------------------------------------------------
create table wwv_flow_issue_labels 
   (issue_id          number, 
    label_id          number, 
    security_group_id number not null, 
    created_on        date not null, 
    created_by        varchar2(255) not null, 
    updated_on        date, 
    updated_by        varchar2(255), 
    constraint wwv_flow_issue_labels_pk primary key (issue_id, label_id), 
    constraint wwv_flow_issue_labels_f1 foreign key (issue_id)
      references wwv_flow_issues (id) on delete cascade, 
    constraint wwv_flow_issue_labels_f2 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade, 
    constraint wwv_flow_issue_labels_f3 foreign key (label_id)
      references wwv_flow_labels (id)
   ) ;

create index wwv_flow_issue_labels_i1 on wwv_flow_issue_labels(security_group_id);
create index wwv_flow_issue_labels_i2 on wwv_flow_issue_labels(label_id);
---------------------------------------------------------
create table wwv_flow_issue_templates 
   ( id                   number not null, 
    template_name         varchar2(250) not null, 
    template_description  varchar2(4000), 
    template_text         clob not null, 
    template_type         varchar2(10), 
    security_group_id     number not null, 
    created_on            date not null, 
    created_by            varchar2(255) not null, 
    updated_on            date, 
    updated_by            varchar2(255), 
    constraint wwv_flow_issue_templates_c1 check (template_type in ('ISSUE','RESPONSE')), 
    constraint wwv_flow_issue_templates_pk primary key (id), 
    constraint wwv_flow_issue_templates_u1 unique (security_group_id, template_name), 
    constraint wwv_flow_issue_templates_f1 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
   ) ;

---------------------------------------------------------
create table wwv_flow_issue_notifications 
   (id                             number not null,
    security_group_id              number not null, 
    user_id                        varchar2(255) not null,
    issue_id                       number,
    comment_id                     number,
    event_id                       number,
    read_yn                        varchar2(1) constraint wwv_flow_issue_not_read_yn_cc check (read_yn in ('Y','N')),
    type                           varchar2(255),
    created_on                     timestamp with time zone,
    email_sent_yn                  varchar2(1) constraint wwv_flow_issue_email_sent_cc check (email_sent_yn in ('Y','N')),
    email_sent_on                  timestamp with time zone, 
    constraint wwv_flow_issue_notification_pk primary key (id),
    constraint wwv_flow_issue_notification_f1 foreign key (issue_id)
      references wwv_flow_issues (id) on delete cascade, 
    constraint wwv_flow_issue_notification_f2 foreign key (comment_id)
      references wwv_flow_issue_comments (id) on delete cascade ,
    constraint wwv_flow_issue_notification_f3 foreign key (event_id)
      references wwv_flow_issue_events (id) on delete cascade 
);

create index wwv_flow_issue_notification_i1 on wwv_flow_issue_notifications (issue_id);
create index wwv_flow_issue_notification_i2 on wwv_flow_issue_notifications (comment_id);
create index wwv_flow_issue_notification_i3 on wwv_flow_issue_notifications (event_id);

---------------------------------------------------------
create table wwv_flow_issue_email_prefs 
   (id                             number not null,
    security_group_id              number not null, 
    user_id                        varchar2(255) not null,
    receive_emails_yn              varchar2(1) default 'N' not null,
    notification_types             varchar2(255),
    frequency                      varchar2(50),
    created_on                     date not null, 
    created_by                     varchar2(255) not null, 
    updated_on                     date, 
    updated_by                     varchar2(255), 
    constraint wwv_flow_issue_email_prefs_pk primary key (id),
    constraint wwv_flow_issue_email_prefs_u1 unique (security_group_id, user_id),
    constraint wwv_flow_issue_email_prefs_c1 check (receive_emails_yn in ('Y','N')),
    constraint wwv_flow_issue_email_prefs_f1 foreign key (security_group_id)
      references wwv_flow_companies (provisioning_company_id) on delete cascade
);


prompt ...done creating APEX ISSUE Tables
set define '^'

