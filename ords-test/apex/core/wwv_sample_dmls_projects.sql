Rem  Copyright (c) 2018, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      wwv_sample_dmls_projects.sql
Rem
Rem    DESCRIPTION
Rem      Insert Sample datasets during APEX installation
Rem
Rem    IMPORTANT: If DML lengh > 4000, DML cannot exceed 255 chars per line.
Rem               When DML > 4000, install uses varchar2 255 array to execute DDL.
Rem

Rem    MODIFIED     (MM/DD/YYYY)
Rem    dpeake       01/10/2018 - Created

set define '^'
prompt ...Oracle APEX Sample installation of datasets

prompt
prompt ...insert into wwv_sample_dmls - Projects Data
prompt

declare
  l_clob clob;
begin
    -- Insert into JSON Table
    delete from wwv_sample_json
    where wwv_sample_dataset_id = 1;

    l_clob :=q'~{
"application": {
  "name": "Demonstration - Projects",
  "appShortDescription": "Generated based on a Sample Dataset!",
  "appDescription": "This application was generated directly from Sample Datasets. Go to SQL Workshop, Utilities, Sample Datasets to install tables and then create an application based on those tables.",
  "features": {
    "progressiveWebApp": true,
    "pushNotifications": true,
    "accessControl": true,
    "activityReporting": true,
    "configurationOptions": true,
    "feedback": true,
    "helpPages": true,
    "themeSelection": true
    },
  "appearance": {
    "themeStyle": "Vita",
    "navigation": "SIDE",
    "icon": "app-icon-pencil-paper",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "EBA_",
    "primaryLanguage": "en",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "Home",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "Dashboard",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "Project Statuses",
        "type": "pie",
        "table": "EBA_PROJECTS_V",
        "labelColumn": "STATUS",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Project Budgets Versus Costs",
        "type": "bar",
        "table": "EBA_PROJECTS_V",
        "labelColumn": "NAME",
        "valueColumn": "BUDGET_V_COST",
        "valueDerivation": "columnValue"
      }
      ,
      {
        "name": "Project Budgets",
        "type": "bar",
        "table": "EBA_PROJECTS_V",
        "labelColumn": "NAME",
        "valueColumn": "BUDGET",
        "valueDerivation": "columnValue"
      }
      ,
      {
        "name": "Project Costs",
        "type": "bar",
        "table": "EBA_PROJECTS_V",
        "labelColumn": "NAME",
        "valueColumn": "COST",
        "valueDerivation": "columnValue"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "cards",
      "pageName": "Projects",
      "pageIcon": "fa-cards",
      "table": "EBA_PROJECTS",
      "layoutType": "GRID",
      "titleColumn": "NAME",
      "bodyColumn": "DESCRIPTION",
      "iconColumn": "PROJECT_LEAD",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveGrid",
      "pageName": "Milestones",
      "pageIcon": "fa-table-pointer",
      "reportImplementation": "TABLE",
      "interactiveGridIsEditable": true,
      "table": "EBA_PROJECT_MILESTONES",
      "help": ""
    }
    ,
    {
      "page": "5",
      "pageType": "facetedSearch",
      "pageName": "Tasks",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EBA_PROJECT_TASKS",
      "includeFormWithReport": true,
      "table": "EBA_PROJECT_TASKS",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "facetColumns": "PROJECT_ID,MILESTONE_ID,ASSIGNEE,COST,IS_COMPLETE_YN",
      "help": ""
    }
    ,
    {
      "page": "6",
      "pageType": "calendar",
      "pageName": "Tasks Calendar",
      "pageIcon": "fa-calendar-o",
      "table": "EBA_PROJECT_TASKS",
      "calendarDisplayColumn": "NAME",
      "calendarDateColumnStart": "START_DATE",
      "calendarDateColumnEnd": "END_DATE",
      "calendarShowTime": "N",
      "help": ""
    }
    ,
    {
      "page": "7",
      "pageType": "interactiveReport",
      "pageName": "Statuses",
      "pageIcon": "fa-table",
      "pageIsAdministrative": true,
      "reportImplementation": "TABLE",
      "table": "EBA_PROJECT_STATUS",
      "includeFormWithReport": true,
      "help": ""
    }
    ],
  "generalSettings": {
    "builtWithLove": true,
    "learnAppDefaults": false,
    "version": "Release 1.0",
    "logging": true,
    "debugging": true
    },
  "securitySettings": {
    "deepLinking": false,
    "maximumSessionSeconds": "",
    "maximumSessionIdleSeconds": ""
    }
  }
}~';

    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (1, 'en', l_clob);

    commit;

    -- Insert into DML Table
    delete from wwv_sample_dmls
    where wwv_sample_dataset_id = 1;

    l_clob := q'~begin
        -----------------------
        --<< Load statuses >>--
        -----------------------
        begin
          insert into eba_project_status (id, code, description, display_order)
          values (1, 'ASSIGNED', 'Assigned', 1);
        exception
            when DUP_VAL_ON_INDEX then
                null;
        end;
        begin
          insert into eba_project_status (id, code, description, display_order)
          values (2, 'IN-PROGRESS', 'In-Progress', 2);
        exception
            when DUP_VAL_ON_INDEX then
                null;
        end;
        begin
          insert into eba_project_status (id, code, description, display_order)
          values (3, 'COMPLETED', 'Completed', 3);
        exception
            when DUP_VAL_ON_INDEX then
                null;
        end;
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Statuses', 1, l_clob);

    --*******************************************--
    --*** Load Projects, Milestones and Tasks ***--
    --*******************************************--
    -- Need to insert a project and all of its releated child records at once and then move to the next project

    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 1 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Configure Web Environment'
           , 'Determine the hardware and software required to develop with Web development tool.'
           , 'Lucille Beatie'
           , 5000
           , to_date('20171005', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Tasks for Project 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tameka Hall'
           , 'Identify Server Requirements'
           , 'Determine which databases will be used to install Web development tool for Development, QA, and Production.
              Also specify which Web Listeners will be used for the three environments.'
           , null
           , 'Y'
           , to_date('20171001', 'YYYYMMDD') + l_add_days
           , to_date('20171002', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Install Web development tool'
           , 'Install the latest version of Web development tool from the vendor into the databases for Development, QA, and Production.
              Note: For QA and Production, Web development tool should be configured as "run time" only.'
           , null
           , 'Y'
           , to_date('20171003', 'YYYYMMDD') + l_add_days
           , to_date('20171003', 'YYYYMMDD') + l_add_days
           , 1000
          )
          returning id into l_task_id;

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Mei Yu'
           , 'Download tool from vendor'
           , 'Download the latest available version of the Web development tool from the vendor site.'
           , 'Y'
          );

        insert into eba_project_task_links
          (  project_id
           , task_id
           , link_type
           , url
           , application_id
           , application_page
           , description
          )
        values
          (  l_project_id
           , l_task_id
           , 'URL'
           , 'http://Web-tool.download.com'
           , null
           , null
           , 'Ficticous download page for Web development tool'
          );

        insert into eba_project_task_links
          (  project_id
           , task_id
           , link_type
           , url
           , application_id
           , application_page
           , description
          )
        values
          (  l_project_id
           , l_task_id
           , 'URL'
           , 'http://Web-tool.install.com'
           , null
           , null
           , 'Ficticous installation guide for Web development tool'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Configure Web Listeners'
           , 'Configure the three Web Listeners for Web development tool to support the Dev, QA, and Prod environments.'
           , null
           , 'Y'
           , to_date('20171003', 'YYYYMMDD') + l_add_days
           , to_date('20171003', 'YYYYMMDD') + l_add_days
           , 500
          )
          returning id into l_task_id;

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Harold Youngblood'
           , 'Download Web Listener from vendor'
           , 'Download the latest available version of the Web Listener from the vendor site.'
           , 'Y'
          );

        insert into eba_project_task_links
          (  project_id
           , task_id
           , link_type
           , url
           , application_id
           , application_page
           , description
          )
        values
          (  l_project_id
           , l_task_id
           , 'URL'
           , 'http://Web-Listener.download.com'
           , null
           , null
           , 'Ficticous download page for Web Listener'
          );

        insert into eba_project_task_links
          (  project_id
           , task_id
           , link_type
           , url
           , application_id
           , application_page
           , description
          )
        values
          (  l_project_id
           , l_task_id
           , 'URL'
           , 'http://Web-Listener.install.com'
           , null
           , null
           , 'Ficticous installation guide for Web Listener'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Configure Web development tool Instance Administration Settings'
           , 'Set the appropriate security and configuration settings for the development instance using specified tools.
              Also set instance settings for QA and Production using the available APIs.'
           , null
           , 'Y'
           , to_date('20171004', 'YYYYMMDD') + l_add_days
           , to_date('20171004', 'YYYYMMDD') + l_add_days
           , 500
          )
          returning id into l_task_id;

        insert into eba_project_task_links
          (  project_id
           , task_id
           , link_type
           , url
           , application_id
           , application_page
           , description
          )
        values
          (  l_project_id
           , l_task_id
           , 'URL'
           , 'https://Web-tool.admin.com'
           , null
           , null
           , 'Ficticous administration guide for Web development tool'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Define Workspaces'
           , 'Define workspaces needed for different application development teams.
              It is important that access be granted to the necessary schemas and/or new schemas created as appropriate.
              Then export these workspaces and import them into QA and Production environments.'
           , null
           , 'Y'
           , to_date('20171005', 'YYYYMMDD') + l_add_days
           , to_date('20171005', 'YYYYMMDD') + l_add_days
           , 500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Assign Workspace Administrators'
           , 'In development assign a minimum of two Workspace administators to each workspace.
              These administrators will then be responsible for maintaining developer access within their own workspaces.'
           , null
           , 'N'
           , to_date('20171005', 'YYYYMMDD') + l_add_days
           , to_date('20171005', 'YYYYMMDD') + l_add_days
           , 250
          );

        -- Insert Project Comments for Project 1
        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'We have decided to use the Web Listener included with the database for Dev Only and a separate Web Listener for QA and Prod.'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('20171002', 'YYYYMMDD') + l_add_days
          where id = l_comment_id;

        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'Installed latest version of Web development tool.'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('20171004', 'YYYYMMDD') + l_add_days
          ,   created_by = 'MEIYU'
          where id = l_comment_id;

        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'Installed latest version of Web Listener in QA and Prod environments'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('20171004', 'YYYYMMDD') + l_add_days
          ,   created_by = 'HARRY'
          where id = l_comment_id;
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 1', 10, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 2 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Train Developers'
           , 'Ensure all developers who will be developing with the new tool get the appropriate training.'
           , 'Lucille Beatie'
           , 20000
           , to_date('20171016', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 2
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Train the Trainers'
           , 'Rather than all developers being trained centrally, a select group will be trained.
              These people will then be responsible for training other developers in their group.'
           , to_date('20171011', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 2 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Prepare Course Outline'
           , 'Creation of the training syllabus'
           , l_milestone_id
           , 'Y'
           , to_date('20171001', 'YYYYMMDD') + l_add_days
           , to_date('20171005', 'YYYYMMDD') + l_add_days
           , 5000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Write Training Guide'
           , 'Produce the powerpoint deck (with notes) for the training instructor.'
           , l_milestone_id
           , 'N'
           , to_date('20171006', 'YYYYMMDD') + l_add_days
           , to_date('20171008', 'YYYYMMDD') + l_add_days
           , 3000
          )
          returning id into l_task_id;

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Madison Smith'
           , 'Review the online examples hosted by the vendor'
           , 'Run through the numerous examples available from the vendor to get course content.'
           , 'Y'
          );

        insert into eba_project_task_links
          (  project_id
           , task_id
           , link_type
           , url
           , application_id
           , application_page
           , description
          )
        values
          (  l_project_id
           , l_task_id
           , 'URL'
           , 'https://Web-tool.examples.com'
           , null
           , null
           , 'Ficticous examples page for Web development tool'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Develop Training Exercises'
           , 'Create scripts for sample data and problem statements with solutions.'
           , l_milestone_id
           , 'Y'
           , to_date('20171002', 'YYYYMMDD') + l_add_days
           , to_date('20171008', 'YYYYMMDD') + l_add_days
           , 5000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Conduct Train-the-Trainer session'
           , 'Give the training material to the selected developers.'
           , l_milestone_id
           , 'Y'
           , to_date('20171009', 'YYYYMMDD') + l_add_days
           , to_date('20171011', 'YYYYMMDD') + l_add_days
           , 2500
          );

        -- Insert Milestone 2 for Project 2
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'All Developers Trained'
           , 'Train the Trainers will have successfully trained the remaining development team members.'
           , to_date('20171015', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 2 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Train Developers I'
           , 'Give the training to developers within your group.'
           , l_milestone_id
           , 'Y'
           , to_date('20171012', 'YYYYMMDD') + l_add_days
           , to_date('20171014', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Train Developers II'
           , 'Give the training to developers within your group.'
           , l_milestone_id
           , 'Y'
           , to_date('20171014', 'YYYYMMDD') + l_add_days
           , to_date('20171016', 'YYYYMMDD') + l_add_days
           , 3000
          );

        -- Insert Project Comments for Project 2
        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'The exercises had some errors that need correcting ASAP.'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('20171011', 'YYYYMMDD') + l_add_days
          where id = l_comment_id;

        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'Thanks for the feedback, Exercises corrected.'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('20171012', 'YYYYMMDD') + l_add_days
          ,   created_by = 'TKING'
          where id = l_comment_id;
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 2', 20, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 3 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Migrate Legacy Applications'
           , 'Move the data and redevelop the applications currently running on top of legacy servers'
           , 'Miyazaki Yokohama'
           , 38000
           , null
           , 2
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 3
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Move Data Structures'
           , 'Move all of the tables and program logic across to the new database'
           , to_date('20171220', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 3 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tameka Hall'
           , 'Create New Tables'
           , 'Create table scripts to replicate the legacy tables'
           , l_milestone_id
           , 'Y'
           , to_date('20171214', 'YYYYMMDD') + l_add_days
           , to_date('20171214', 'YYYYMMDD') + l_add_days
           , 500
          )
          returning id into l_task_id;

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Tameka Hall'
           , 'Reverse engineer the legacy tables into the data modeling tool'
           , 'Connect the data modeling tool to the legacy dev instance and suck in all of the required DB objects.'
           , 'Y'
          );

        insert into eba_project_task_links
          (  project_id
           , task_id
           , link_type
           , url
           , application_id
           , application_page
           , description
          )
        values
          (  l_project_id
           , l_task_id
           , 'URL'
           , 'http://Web-data-modeler.info.com'
           , null
           , null
           , 'Ficticous information site for the data mdoeling tool'
          );

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Tameka Hall'
           , 'Add proper integrity constraints to the entities'
           , 'Add foreign keys as needed to correctly integrate referential integrity.'
           , 'Y'
          );

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Tameka Hall'
           , 'Generate DDL Scripts for new tables'
           , 'Generate the DDL scripts from the data modeling tool to create the DB objects in the new database.'
           , 'Y'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           ,  'Nina Herschel'
           , 'Migrate data from Legacy Server'
           , 'Develop scripts to populate the new database tables from the legacy database.'
           , l_milestone_id
           , 'Y'
           , to_date('20171215', 'YYYYMMDD') + l_add_days
           , to_date('20171218', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tameka Hall'
           , 'Convert transaction logic'
           , 'Convert the legacy database transactional objects across to the new database'
           , l_milestone_id
           , 'Y'
           , to_date('20171215', 'YYYYMMDD') + l_add_days
           , to_date('20171217', 'YYYYMMDD') + l_add_days
           , 2500
          );

        -- Insert Milestone 2 for Project 3
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Redevelop HR Applications'
           , 'Build applications to replace the HR functionality currently implemented in older technologies'
           , to_date('20171228', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 3 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Redevelop Timesheet App'
           , 'Develop desktop and mobile app for entering timesheets'
           , l_milestone_id
           , 'Y'
           , to_date('20171217', 'YYYYMMDD') + l_add_days
           , to_date('20171222', 'YYYYMMDD') + l_add_days
           , 6000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Create Shift Schedule App'
           , 'Create an app for defining when people are scheduled to work different shifts.'
           , l_milestone_id
           , 'Y'
           , to_date('20171217', 'YYYYMMDD') + l_add_days
           , to_date('20171225', 'YYYYMMDD') + l_add_days
           , 7500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Reengineer Employee App'
           , 'Create an app for employee details and benefits.'
           , l_milestone_id
           , 'N'
           , to_date('20171226', 'YYYYMMDD') + l_add_days
           , to_date('20171228', 'YYYYMMDD') + l_add_days
           , 3000
          );

        -- Insert Milestone 3 for Project 3
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Redevelop Project Tracking Applications'
           , 'Build applications to replace the project tracking functionality currently running on legacy servers'
           , to_date('20180103', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 3 / Milestone 3
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Brock Shilling'
           , 'Customize Customer Tracker Productivity App'
           , 'Install Customer Tracker and use flex fields to meet requirements.'
           , l_milestone_id
           , 'Y'
           , to_date('20171228', 'YYYYMMDD') + l_add_days
           , to_date('20171228', 'YYYYMMDD') + l_add_days
           , 750
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Brock Shilling'
           , 'Migrate data into Customer Tracker tables'
           , 'Move previous project tracking data into the Customer Tracker APEX$CUST_xxx tables.'
           , l_milestone_id
           , 'Y'
           , to_date('20171229', 'YYYYMMDD') + l_add_days
           , to_date('20171230', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Pilot new Customer Tracker application'
           , 'Use Customer Tracker to ensure it meets requirements.'
           , l_milestone_id
           , 'N'
           , to_date('20171231', 'YYYYMMDD') + l_add_days
           , to_date('20180109', 'YYYYMMDD') + l_add_days
           , 0
          );

        -- Insert Project Comments for Project 3
        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'Bernie - I have migrated all of the projects data across, so you can start your pilot now.'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('201712310100', 'YYYYMMDDHH24MI') + l_add_days
          ,   created_by = 'THEBROCK'
          where id = l_comment_id;

        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'I''m telling you now, this Customer Tracker thing had better be good'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('201712310200', 'YYYYMMDDHH24MI') + l_add_days
          ,   created_by = 'BERNIE'
          where id = l_comment_id;

        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'This guy Mike told me this app is brilliant.'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('201712310300', 'YYYYMMDDHH24MI') + l_add_days
          ,   created_by = 'THEBROCK'
          where id = l_comment_id;

        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'So far Customer Tracker is working out great - better than the old apps. Brocky, my boy, you are the man!'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('201801010100', 'YYYYMMDDHH24MI') + l_add_days
          ,   created_by = 'BERNIE'
          where id = l_comment_id;

        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'Bernie, I told you that you were going to be impressed.'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('201801010200', 'YYYYMMDDHH24MI') + l_add_days
          ,   created_by = 'THEBROCK'
          where id = l_comment_id;

        insert into eba_project_comments
          (  project_id
           , comment_text
          )
        values
          (  l_project_id
           , 'All of the old tables and transactional logic now migrated and ready for developers to use in the new database.'
          )
          returning id into l_comment_id;
        update eba_project_comments
          set created = to_date('20171217', 'YYYYMMDD') + l_add_days
          ,   created_by = 'THALL'
          where id = l_comment_id;
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 3', 30, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 4 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Develop Partner Portal POC'
           , 'Develop a proof of concept that partners can use to work more collaboratively with us.'
           , 'Bernard Jackman'
           , 25000
           , null
           , 2
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 4
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Define Requirements'
           , 'Work with key stakeholders to define the scope of the project, and design screen flow and data requirements.'
           , to_date('20180106', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 4 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Define scope of Partner Portal App.'
           , 'Meet with internal and external SMEs and define the requirements'
           , l_milestone_id
           , 'N'
           , to_date('20171228', 'YYYYMMDD') + l_add_days
           , to_date('20180104', 'YYYYMMDD') + l_add_days
           , 4000
          )
          returning id into l_task_id;

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Bernard Jackman'
           , 'Meet key Partners for input'
           , 'Determine the most important functionality for Partners.'
           , 'Y'
          );

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Bernard Jackman'
           , 'Meet internal Partner liason reps'
           , 'Determine the most important functionality for internal stakeholders.'
           , 'Y'
          );

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Bernard Jackman'
           , 'Develop inital screen designs'
           , 'Prototype new screens using Web development tool to get buy-in from SMEs.'
           , 'Y'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Define Partner App Data Structures'
           , 'Design the data model for new and existing entities required to support the Partner Portal.'
           , l_milestone_id
           , 'N'
           , to_date('20180104', 'YYYYMMDD') + l_add_days
           , to_date('20180107', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Design User Experience'
           , 'Define how partners will interact with the application.'
           , l_milestone_id
           , 'N'
           , to_date('20180105', 'YYYYMMDD') + l_add_days
           , to_date('20180106', 'YYYYMMDD') + l_add_days
           , 0
          );


        -- Insert Milestone 2 for Project 4
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Build Proof-of-Concept'
           , 'Create the initial screens and populate with data so key stakeholders can review proposed solution.'
           , to_date('20180113', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 4 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Nina Herschel'
           , 'Develop Admin Screens for Partner Portal'
           , 'Develop the screens needed to maintain all of the base tables for the Partner Portal app.'
           , l_milestone_id
           , 'N'
           , to_date('20180108', 'YYYYMMDD') + l_add_days
           , to_date('20180110', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Populate Data Structures for Partner Portal'
           , 'Upload sample data provided by key partner, and ensure existing tables accessible.'
           , l_milestone_id
           , 'N'
           , to_date('20180108', 'YYYYMMDD') + l_add_days
           , to_date('20180109', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Design first-cut of main Partner Portal app'
           , 'Implement the major functional areas and ensure navigation between pages is working correctly.'
           , l_milestone_id
           , 'N'
           , to_date('20180107', 'YYYYMMDD') + l_add_days
           , to_date('20180111', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Present POC to Key Stakeholders'
           , 'Walk key stakeholders through the proof of concept and obtain their feedback.'
           , l_milestone_id
           , 'N'
           , to_date('20180112', 'YYYYMMDD') + l_add_days
           , to_date('20180112', 'YYYYMMDD') + l_add_days
           , 0
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 4', 40, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 5 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Develop Production Partner Portal'
           , 'Develop the production app that partners can use to work more collaboratively with us.'
           , 'Lucille Beatie'
           , 85000
           , null
           , 1
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 5
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Define Production App Scope'
           , 'Based on the results of the POC, define the requirements for the production app.'
           , to_date('20180114', 'YYYYMMDD') + l_add_days
         )
         returning id into l_milestone_id;

        -- Insert Tasks for Project 5 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Lucille Beatie'
           , 'Define production scope of Partner Portal App.'
           , 'Define the scope and timelines for the development of the production app.'
           , l_milestone_id
           , 'N'
           , to_date('20180113', 'YYYYMMDD') + l_add_days
           , to_date('20180114', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Finalize Partner App Data Model'
           , 'Refine the data model for new and existing entities required to support the Partner Portal'
           , l_milestone_id
           , 'N'
           , to_date('20180113', 'YYYYMMDD') + l_add_days
           , to_date('20180114', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Finalize User Experience for Partner Portal app'
           , 'Write developer standards on UX and development standards on how partners will interact with the application.'
           , l_milestone_id
           , 'N'
           , to_date('20180113', 'YYYYMMDD') + l_add_days
           , to_date('20180114', 'YYYYMMDD') + l_add_days
           , 0
          );


        -- Insert Milestone 2 for Project 5
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Build Phase 1 of Production Partner Portal App'
           , 'Develop the modules defined in the first phase of the application.'
           , to_date('20180121', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 5 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Refine Admin Screens for Partner Portal'
           , 'Refine screens developed in the POC to be fully operational to maintain all of the base tables for the Partner Portal app.'
           , l_milestone_id
           , 'N'
           , to_date('20180115', 'YYYYMMDD') + l_add_days
           , to_date('20180118', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Populate Data Structures for Production Partner Portal'
           , 'Upload actual data provided by key partner, and ensure existing tables accessible.'
           , l_milestone_id
           , 'N'
           , to_date('20180115', 'YYYYMMDD') + l_add_days
           , to_date('20180117', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Design production screens for main Partner Portal app'
           , 'Implement fully functional and complete screens to cover the major functional areas in Phase 1.'
           , l_milestone_id
           , 'N'
           , to_date('20180117', 'YYYYMMDD') + l_add_days
           , to_date('20180123', 'YYYYMMDD') + l_add_days
           , 0
          );

        -- Insert Milestone 3 for Project 5
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Perform Beta testing with select Partners'
           , 'Work with a few key partners to trial Phase 1 of the Partner Portal app.'
           , to_date('20180129', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 5 / Milestone 3
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Train Partners'
           , 'Train selected partners in how to use the Partner Portal app.'
           , l_milestone_id
           , 'N'
           , to_date('20180122', 'YYYYMMDD') + l_add_days
           , to_date('20180122', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Monitor Partners'
           , 'Monitor partners selected for the Beta and provide assistance as necessary.'
           , l_milestone_id
           , 'N'
           , to_date('20180123', 'YYYYMMDD') + l_add_days
           , to_date('20180128', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Lucille Beatie'
           , 'Review Beta Feedback from Partners'
           , 'Analyse feedback from the partners who participated in the Beta program.'
           , l_milestone_id
           , 'N'
           , to_date('20180129', 'YYYYMMDD') + l_add_days
           , to_date('20180129', 'YYYYMMDD') + l_add_days
           , 0
          );

        -- Insert Milestone 4 for Project 5
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Complete Phase 1 Development of Partner Portal app'
           , 'Based on the results of the Beta program, enhance the application to make production ready.'
           , to_date('20180225', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 5 / Milestone 4
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Improve existing feature functions based on feedback'
           , 'Enhance existing features based on responses from Beta partners.'
           , l_milestone_id
           , 'N'
           , to_date('20180201', 'YYYYMMDD') + l_add_days
           , to_date('20180220', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tameka Hall'
           , 'Add missing feature functions'
           , 'Add missing features outlined in responses from Beta partners.'
           , l_milestone_id
           , 'N'
           , to_date('20180201', 'YYYYMMDD') + l_add_days
           , to_date('20180220', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Load full portal data'
           , 'Ensure all data required for production roll out are inserted and maintained.'
           , l_milestone_id
           , 'N'
           , to_date('20180215', 'YYYYMMDD') + l_add_days
           , to_date('20180220', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Test Production Partner Portal'
           , 'Do full scale testing on the Partner Portal application.'
           , l_milestone_id
           , 'N'
           , to_date('20180221', 'YYYYMMDD') + l_add_days
           , to_date('20180225', 'YYYYMMDD') + l_add_days
           , 0
          );

        -- Insert Milestone 5 for Project 5
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Roll out Phase 1 of Partner Portal app'
           , 'Go-Live for the Partner Portal application to all partners.'
           , to_date('20180301', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 5 / Milestone 5
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tameka Hall'
           , 'Install Partner Portal app onto Production Server'
           , 'Install the database objects and application(s) into the production environment.'
           , l_milestone_id
           , 'N'
           , to_date('20180226', 'YYYYMMDD') + l_add_days
           , to_date('20180226', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Configure initial data load procedures'
           , 'Install and test data load procedures from internal and external data sources into production environment.'
           , l_milestone_id
           , 'N'
           , to_date('20180227', 'YYYYMMDD') + l_add_days
           , to_date('20180228', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Lucille Beatie'
           , 'Provide user credentials for partners'
           , 'Define user credentials for each partner to allow access to the Partner Portal app.'
           , l_milestone_id
           , 'N'
           , to_date('20180228', 'YYYYMMDD') + l_add_days
           , to_date('20180228', 'YYYYMMDD') + l_add_days
           , 0
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Lucille Beatie'
           , 'Announce Partner Portal app to all partners'
           , 'Email or call partners to inform them of the new application and instructions on how to get started.'
           , l_milestone_id
           , 'N'
           , to_date('20180301', 'YYYYMMDD') + l_add_days
           , to_date('20180301', 'YYYYMMDD') + l_add_days
           , 0
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 5', 50, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 6 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Develop New Reporting Apps'
           , 'Develop apps to meet C Level reporting requirements.'
           , 'Lucille Beatie'
           , 15000
           , to_date('20171030', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 6
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Define Reporting Requirements`'
           , 'Work with key stakeholders to define the scope of the project, and design data requirements.'
           , to_date('20171022', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 6 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Lucille Beatie'
           , 'Define scope of CEO Reporting'
           , 'Meet with executives to define the high level requirements'
           , l_milestone_id
           , 'Y'
           , to_date('20171018', 'YYYYMMDD') + l_add_days
           , to_date('20171018', 'YYYYMMDD') + l_add_days
           , 1000
          )
          returning id into l_task_id;

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Lucille Beatie'
           , 'Contact executive assitants'
           , 'Get meetings scheduled for the key stakeholders.'
           , 'Y'
          );

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Lucille Beatie'
           , 'Prepare presentation for executives'
           , 'Prepare and practice delivering concise, high level positioning on app feasability.'
           , 'Y'
          );

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Mei Yu'
           , 'Develop inital report designs'
           , 'Mock up new dashboard screens using Web development tool to get buy-in from executives.'
           , 'Y'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Define data requirements'
           , 'Specify the data sources required to support the reports.'
           , l_milestone_id
           , 'Y'
           , to_date('20171019', 'YYYYMMDD') + l_add_days
           , to_date('20171021', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Design Dashboard presentation'
           , 'Define how data will be displayed in the dashboard.'
           , l_milestone_id
           , 'Y'
           , to_date('20171021', 'YYYYMMDD') + l_add_days
           , to_date('20171022', 'YYYYMMDD') + l_add_days
           , 1500
          );


        -- Insert Milestone 2 for Project 6
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Build First Cut of Executive Dashboard'
           , 'Create the initial screens and populate with data so key executives can review the initial solution.'
           , to_date('20171030', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 6 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Nina Herschel'
           , 'Develop Admin Screens for Executive Dashboard`'
           , 'Develop the screens needed to maintain all of the base tables for the executive reporting app.'
           , l_milestone_id
           , 'Y'
           , to_date('20171023', 'YYYYMMDD') + l_add_days
           , to_date('20171023', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Populate Data Structures for Executive Dashboard'
           , 'Upload reporting data from external sources into local tables.'
           , l_milestone_id
           , 'Y'
           , to_date('20171023', 'YYYYMMDD') + l_add_days
           , to_date('20171024', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Build first-cut of Executive Dashboard app'
           , 'Implement the major functional areas and ensure navigation between pages is working correctly.'
           , l_milestone_id
           , 'Y'
           , to_date('20171025', 'YYYYMMDD') + l_add_days
           , to_date('20171029', 'YYYYMMDD') + l_add_days
           , 4000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Lucille Beatie'
           , 'Present First Cut to executives'
           , 'Walk key stakeholders through the initial reports and obtain their feedback.'
           , l_milestone_id
           , 'Y'
           , to_date('20171030', 'YYYYMMDD') + l_add_days
           , to_date('20171030', 'YYYYMMDD') + l_add_days
           , 500
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 6', 60, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 7 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Develop IT Management Apps'
           , 'Develop apps to allow IT to manage resources.'
           , 'Bernard Jackman'
           , 45000
           , to_date('20171110', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 7
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Define IT Management App Scope'
           , 'Define the different apps required to meet IT requirements.'
           , to_date('20171025', 'YYYYMMDD') + l_add_days
         )
         returning id into l_milestone_id;

        -- Insert Tasks for Project 7 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Define the primary IT requirements.'
           , 'Define the scope and timelines for the development of the IT Management apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171020', 'YYYYMMDD') + l_add_days
           , to_date('20171021', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Finalize IT Management Apps Data Model'
           , 'Define the data model for new and existing entities required to support the IT Management apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171021', 'YYYYMMDD') + l_add_days
           , to_date('20171024', 'YYYYMMDD') + l_add_days
           , 5000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Finalize User Experience for IT Management app'
           , 'Write developer standards on UX and development standards on how IT will interact with the applications.'
           , l_milestone_id
           , 'Y'
           , to_date('20171023', 'YYYYMMDD') + l_add_days
           , to_date('20171024', 'YYYYMMDD') + l_add_days
           , 2500
          );


        -- Insert Milestone 2 for Project 7
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Build Phase 1 of IT Management Apps'
           , 'Develop the modules defined in the first phase of the applications.'
           , to_date('20171030', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 7 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Brock Shilling'
           , 'Define Admin Screens for IT Management Apps'
           , 'Define screens to maintain all of the base tables for the IT Management apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171023', 'YYYYMMDD') + l_add_days
           , to_date('20171025', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Populate Data Structures for IT Management Apps'
           , 'Upload actual data provided from other IT systems.'
           , l_milestone_id
           , 'Y'
           , to_date('20171024', 'YYYYMMDD') + l_add_days
           , to_date('20171026', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Design production screens for IT Management apps'
           , 'Implement fully functional and complete screens to cover the major functional areas in Phase 1.'
           , l_milestone_id
           , 'Y'
           , to_date('20171025', 'YYYYMMDD') + l_add_days
           , to_date('20171030', 'YYYYMMDD') + l_add_days
           , 6000
          );

        -- Insert Milestone 3 for Project 7
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Perform Beta testing with IT staff'
           , 'Work with a few key IT personnel to trial Phase 1 of the IT Management apps.'
           , to_date('20171105', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 7 / Milestone 3
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Train IT personnel'
           , 'Train selected IT staff in how to use the apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171101', 'YYYYMMDD') + l_add_days
           , to_date('20171101', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Monitor IT Staff'
           , 'Monitor IT staff selected for the Beta and provide assistance as necessary.'
           , l_milestone_id
           , 'Y'
           , to_date('20171102', 'YYYYMMDD') + l_add_days
           , to_date('20171104', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Review Beta Feedback from IT staff'
           , 'Analyse feedback from the IT staff who participated in the Beta program.'
           , l_milestone_id
           , 'Y'
           , to_date('20171105', 'YYYYMMDD') + l_add_days
           , to_date('20171105', 'YYYYMMDD') + l_add_days
           , 1000
          );

        -- Insert Milestone 4 for Project 7
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Complete Phase 1 Development of IT Management apps'
           , 'Based on the results of the Beta program, enhance the application to make production ready.'
           , to_date('20171110', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 7 / Milestone 4
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Brock Shilling'
           , 'Improve existing feature functions'
           , 'Enhance existing features based on responses from Beta staff.'
           , l_milestone_id
           , 'Y'
           , to_date('20171106', 'YYYYMMDD') + l_add_days
           , to_date('20171110', 'YYYYMMDD') + l_add_days
           , 7000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Add required feature functions'
           , 'Add missing features outlined in responses from Beta staff.'
           , l_milestone_id
           , 'Y'
           , to_date('20171106', 'YYYYMMDD') + l_add_days
           , to_date('20171110', 'YYYYMMDD') + l_add_days
           , 5500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Load full production data'
           , 'Ensure all data required for production roll out are inserted and maintained.'
           , l_milestone_id
           , 'Y'
           , to_date('20171108', 'YYYYMMDD') + l_add_days
           , to_date('20171110', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Test IT Management Apps'
           , 'Do full scale testing on the IT Management apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171111', 'YYYYMMDD') + l_add_days
           , to_date('20171111', 'YYYYMMDD') + l_add_days
           , 1000
          );

        -- Insert Milestone 5 for Project 7
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Roll out Phase 1 of IT Management apps'
           , 'Go-Live for the IT Management apps for IT staff.'
           , to_date('20171116', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 7 / Milestone 5
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Install IT Management apps onto Production Server'
           , 'Install the database objects and application(s) into the production environment.'
           , l_milestone_id
           , 'Y'
           , to_date('20171112', 'YYYYMMDD') + l_add_days
           , to_date('20171112', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Configure final data load procedures'
           , 'Install and test data load procedures from internal and external data sources into production environment.'
           , l_milestone_id
           , 'Y'
           , to_date('20171113', 'YYYYMMDD') + l_add_days
           , to_date('20171114', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Provide user credentials for IT staff'
           , 'Define user credentials for each IT staff member to allow access to the IT Management apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171114', 'YYYYMMDD') + l_add_days
           , to_date('20171114', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Announce IT Management apps to all IT staff'
           , 'Email or call IT staff to inform them of the new application and instructions on how to get started.'
           , l_milestone_id
           , 'Y'
           , to_date('20171115', 'YYYYMMDD') + l_add_days
           , to_date('20171115', 'YYYYMMDD') + l_add_days
           , 1000
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 7', 70, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 8 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Develop Customer Tracker'
           , 'Develop an application to track customers from prospects through closed deals.'
           , 'Lucille Beatie'
           , 14000
           , to_date('20171130', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 8
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Review Productivity App'
           , 'Work with key stakeholders to prioritize improvements to the default Productivity App.'
           , to_date('20171118', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 8 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Install Customer Tracker Productivity App'
           , 'Install the Productivity app and turn on the appropriate options.'
           , l_milestone_id
           , 'Y'
           , to_date('20171116', 'YYYYMMDD') + l_add_days
           , to_date('20171116', 'YYYYMMDD') + l_add_days
           , 1000
          )
          returning id into l_task_id;

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Miyazaki Yokohama'
           , 'Contact executive assitants'
           , 'Get meetings scheduled for the key stakeholders.'
           , 'Y'
          );

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Miyazaki Yokohama'
           , 'Prepare presentation for executives'
           , 'Determine the current functionality to present to key stakeholders.'
           , 'Y'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Define external customer data feeds'
           , 'Specify the data sources for customer data.'
           , l_milestone_id
           , 'Y'
           , to_date('20171116', 'YYYYMMDD') + l_add_days
           , to_date('20171117', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Design Customer Tracker Look and Feel'
           , 'Define how data will be displayed on customers.'
           , l_milestone_id
           , 'Y'
           , to_date('20171117', 'YYYYMMDD') + l_add_days
           , to_date('20171118', 'YYYYMMDD') + l_add_days
           , 1500
          );


        -- Insert Milestone 2 for Project 8
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Deliver First-Cut of Customer Tracker'
           , 'Create the initial screens and populate with data so key executives can review the initial solution.'
           , to_date('20171122', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 8 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Define necessary flex-fields within the Customer Tracker app'
           , 'Add the additional customer attributes required using the flex fields.'
           , l_milestone_id
           , 'Y'
           , to_date('20171119', 'YYYYMMDD') + l_add_days
           , to_date('20171119', 'YYYYMMDD') + l_add_days
           , 500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Populate Data Structures for Customer Tracker'
           , 'Upload existing customer data from external sources into local tables.'
           , l_milestone_id
           , 'Y'
           , to_date('20171120', 'YYYYMMDD') + l_add_days
           , to_date('20171121', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Customize the Customer Tracker app'
           , 'Use built-in functionality and Theme Roller to tweak the application.'
           , l_milestone_id
           , 'Y'
           , to_date('20171121', 'YYYYMMDD') + l_add_days
           , to_date('20171121', 'YYYYMMDD') + l_add_days
           , 500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Lucille Beatie'
           , 'Present First Cut to executives'
           , 'Walk key stakeholders through the initial app and obtain their feedback.'
           , l_milestone_id
           , 'Y'
           , to_date('20171123', 'YYYYMMDD') + l_add_days
           , to_date('20171123', 'YYYYMMDD') + l_add_days
           , 500
          );

        -- Insert Milestone 3 for Project 8
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Deliver Final Customer Tracker Application'
           , 'Deliver the completed application to the business.'
           , to_date('20171130', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 8 / Milestone 3
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Define additional flex-fields within the Customer Tracker app'
           , 'Add the extra customer attributes required using the flex fields.'
           , l_milestone_id
           , 'Y'
           , to_date('20171125', 'YYYYMMDD') + l_add_days
           , to_date('20171125', 'YYYYMMDD') + l_add_days
           , 500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Final upload of Data Structures for Customer Tracker'
           , 'Reload customer data from external sources into local tables.'
           , l_milestone_id
           , 'Y'
           , to_date('20171126', 'YYYYMMDD') + l_add_days
           , to_date('20171126', 'YYYYMMDD') + l_add_days
           , 1500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Customize the Customer Tracker app based on First-Cut feedback'
           , 'Use built-in functionality and Theme Roller to tweak the application.'
           , l_milestone_id
           , 'Y'
           , to_date('20171126', 'YYYYMMDD') + l_add_days
           , to_date('20171126', 'YYYYMMDD') + l_add_days
           , 500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Train reps on use of Customer Tracker'
           , 'Walk key users through the application.'
           , l_milestone_id
           , 'Y'
           , to_date('20171127', 'YYYYMMDD') + l_add_days
           , to_date('20171127', 'YYYYMMDD') + l_add_days
           , 500
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 8', 80, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        --------------------------
        --<< Insert Project 9 >>--
        --------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Implement Customer Satisfaction Application'
           , 'Implement an application to track customer satisfaction and feedback.'
           , 'Bernard Jackman'
           , 25000
           , to_date('20171130', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Tasks for Project 9
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Define main requirements for tracking customer satisfaction.'
           , 'Define the scope and timelines for the development of the tracking app.'
           , null
           , 'Y'
           , to_date('20171117', 'YYYYMMDD') + l_add_days
           , to_date('20171118', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Finalize Customer Satisfaction Tracker Data Model'
           , 'Define the data model for new and existing entities required to support customer satisfaction tracking.'
           , null
           , 'Y'
           , to_date('20171119', 'YYYYMMDD') + l_add_days
           , to_date('20171121', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Finalize User Experience for Customer Satisfaction app'
           , 'Write developer standards on UX and development standards on how the company will acquire and report on customer satisfaction.'
           , null
           , 'Y'
           , to_date('20171119', 'YYYYMMDD') + l_add_days
           , to_date('20171120', 'YYYYMMDD') + l_add_days
           , 3000
          );

         insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Brock Shilling'
           , 'Define Admin Screens for Customer Satisfaction App'
           , 'Define screens to maintain all of the base tables for the Customer Satisfaction apps.'
           , null
           , 'Y'
           , to_date('20171121', 'YYYYMMDD') + l_add_days
           , to_date('20171122', 'YYYYMMDD') + l_add_days
           , 2750
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Populate Data Structures for Customer Satisfaction Apps'
           , 'Upload actual data provided from other IT systems.'
           , null
           , 'Y'
           , to_date('20171122', 'YYYYMMDD') + l_add_days
           , to_date('20171122', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Design production screens for the customer to provide feedback'
           , 'Implement fully functional and complete screens to allow customers to provide feedback.'
           , null
           , 'Y'
           , to_date('20171123', 'YYYYMMDD') + l_add_days
           , to_date('20171125', 'YYYYMMDD') + l_add_days
           , 3500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Design internal screens for collecting feedback and analyzing results'
           , 'Develop data entry and reporting screens to manage Customer Satisfaction.'
           , null
           , 'Y'
           , to_date('20171123', 'YYYYMMDD') + l_add_days
           , to_date('20171126', 'YYYYMMDD') + l_add_days
           , 5000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Test Customer Satisfaction internal / external apps'
           , 'Do full scale testing on both the customer facing and internal-only screens.'
           , null
           , 'Y'
           , to_date('20171127', 'YYYYMMDD') + l_add_days
           , to_date('20171128', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Contact initial customers to educate them on providing feedback'
           , 'Work off a call list to email or call the beta customers and monitor their responses.'
           , null
           , 'Y'
           , to_date('20171127', 'YYYYMMDD') + l_add_days
           , to_date('20171201', 'YYYYMMDD') + l_add_days
           , 5500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Announce Customer Satisfaction apps to all customers and staff'
           , 'Email all current customers and staff to inform them of the new application and instructions on how to get started.'
           , null
           , 'Y'
           , to_date('20171130', 'YYYYMMDD') + l_add_days
           , to_date('20171130', 'YYYYMMDD') + l_add_days
           , 1000
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 9', 90, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        ---------------------------
        --<< Insert Project 10 >>--
        ---------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Improve IT Management Apps'
           , 'Enahnce apps to allow IT to manage resources.'
           , 'Bernard Jackman'
           , 40000
           , to_date('20171228', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 10
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Define IT Management App Enhancement Scope'
           , 'Define the updates required to improve the apps.'
           , to_date('20171205', 'YYYYMMDD') + l_add_days
         )
         returning id into l_milestone_id;

        -- Insert Tasks for Project 10 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Define improvements to IT requirements.'
           , 'Define the scope and timelines for the improvement to the IT Management apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171201', 'YYYYMMDD') + l_add_days
           , to_date('20171201', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Revise IT Management Apps Data Model'
           , 'Define the data model for new entities required to support the updated IT Management apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171202', 'YYYYMMDD') + l_add_days
           , to_date('20171204', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Refine User Experience for IT Management Apps'
           , 'Update developer standards on UX and development standards on how IT will interact with the applications.'
           , l_milestone_id
           , 'Y'
           , to_date('20171202', 'YYYYMMDD') + l_add_days
           , to_date('20171203', 'YYYYMMDD') + l_add_days
           , 2500
          );


        -- Insert Milestone 2 for Project 10
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Build Final Phase of IT Management Apps'
           , 'Develop the modules defined in the final phase of the applications.'
           , to_date('20171212', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 10 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Populate New Data Structures for IT Management Apps'
           , 'Upload actual data provided from other IT systems.'
           , l_milestone_id
           , 'Y'
           , to_date('20171204', 'YYYYMMDD') + l_add_days
           , to_date('20171206', 'YYYYMMDD') + l_add_days
           , 3000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Design production screens for revised IT Management apps'
           , 'Implement fully functional and complete screens to cover the major functional areas.'
           , l_milestone_id
           , 'Y'
           , to_date('20171204', 'YYYYMMDD') + l_add_days
           , to_date('20171210', 'YYYYMMDD') + l_add_days
           , 6000
          );

        -- Insert Milestone 3 for Project 10
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Perform Beta testing with IT staff of revised IT Management Apps'
           , 'Work with a few key IT personnel to trial the final IT Management apps.'
           , to_date('20171215', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 10 / Milestone 3
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Train IT personnel in updated app'
           , 'Train selected IT staff in how to use the apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171212', 'YYYYMMDD') + l_add_days
           , to_date('20171112', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Monitor IT Staff on IT Management Apps'
           , 'Monitor IT staff and provide assistance as necessary.'
           , l_milestone_id
           , 'Y'
           , to_date('20171213', 'YYYYMMDD') + l_add_days
           , to_date('20171216', 'YYYYMMDD') + l_add_days
           , 4000
          );

        -- Insert Milestone 4 for Project 10
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Complete Final Development of IT Management apps'
           , 'Enhance the application further to meet outstanding requirements.'
           , to_date('20171225', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 10 / Milestone 4
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Brock Shilling'
           , 'Implement additional feature functions to IT Management Apps'
           , 'Enhance existing features based on responses from IT staff.'
           , l_milestone_id
           , 'Y'
           , to_date('20171217', 'YYYYMMDD') + l_add_days
           , to_date('20171222', 'YYYYMMDD') + l_add_days
           , 6000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Implement outstanding feature functions'
           , 'Add missing features outlined in responses from IT staff.'
           , l_milestone_id
           , 'Y'
           , to_date('20171217', 'YYYYMMDD') + l_add_days
           , to_date('20171221', 'YYYYMMDD') + l_add_days
           , 5500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Load new production data for final IT Management Apps'
           , 'Ensure all data required for production roll out are inserted and maintained.'
           , l_milestone_id
           , 'Y'
           , to_date('20171223', 'YYYYMMDD') + l_add_days
           , to_date('20171223', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Test Production-Ready IT Management Apps'
           , 'Do full scale testing on the IT Management Apps.'
           , l_milestone_id
           , 'Y'
           , to_date('20171224', 'YYYYMMDD') + l_add_days
           , to_date('20171225', 'YYYYMMDD') + l_add_days
           , 1000
          );

        -- Insert Milestone 5 for Project 10
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Roll out final IT Management app'
           , 'Go-Live for the IT Management application.'
           , to_date('20171230', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 10 / Milestone 5
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Install revised IT Management apps onto Production Server'
           , 'Install the revised database objects and application(s) into the production environment.'
           , l_milestone_id
           , 'Y'
           , to_date('20171226', 'YYYYMMDD') + l_add_days
           , to_date('20171226', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Configure production data load procedures'
           , 'Install and test data load procedures from internal and external data sources into production environment.'
           , l_milestone_id
           , 'Y'
           , to_date('20171227', 'YYYYMMDD') + l_add_days
           , to_date('20171228', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Announce Rollout of revised IT Management apps to all IT staff'
           , 'Email or call IT staff to inform them of the new application and details on new features.'
           , l_milestone_id
           , 'Y'
           , to_date('20171229', 'YYYYMMDD') + l_add_days
           , to_date('20171229', 'YYYYMMDD') + l_add_days
           , 1000
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 10', 100, l_clob);


     l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        ---------------------------
        --<< Insert Project 11 >>--
        ---------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Develop Bug Application'
           , 'Develop an application to track bugs and their resolution.'
           , 'Lucille Beatie'
           , 18000
           , to_date('20171225', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Milestone 1 for Project 11
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Review Bug Tracker Productivity App'
           , 'Work with key stakeholders to prioritize improvements to the default Productivity App.'
           , to_date('20171211', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 11 / Milestone 1
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Install Bug Tracker Productivity App'
           , 'Install the Productivity app and turn on the appropriate options.'
           , l_milestone_id
           , 'Y'
           , to_date('20171210', 'YYYYMMDD') + l_add_days
           , to_date('20171110', 'YYYYMMDD') + l_add_days
           , 1000
          )
          returning id into l_task_id;

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Miyazaki Yokohama'
           , 'Contact key stakeholders'
           , 'Get meetings scheduled for the key stakeholders.'
           , 'Y'
          );

        insert into eba_project_task_todos
          (  project_id
           , task_id
           , assignee
           , name
           , description
           , is_complete_yn
          )
        values
          (  l_project_id
           , l_task_id
           , 'Miyazaki Yokohama'
           , 'Prepare presentation for stakeholders'
           , 'Determine the current functionality to present to key stakeholders.'
           , 'Y'
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Define external bug data feeds'
           , 'Specify the data sources for bug data.'
           , l_milestone_id
           , 'Y'
           , to_date('20171211', 'YYYYMMDD') + l_add_days
           , to_date('20171212', 'YYYYMMDD') + l_add_days
           , 2500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Design Bug Tracker Look and Feel'
           , 'Define how data will be displayed on bugs.'
           , l_milestone_id
           , 'Y'
           , to_date('20171211', 'YYYYMMDD') + l_add_days
           , to_date('20171213', 'YYYYMMDD') + l_add_days
           , 2000
          );


        -- Insert Milestone 2 for Project 11
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Deliver First-Cut of Bug Tracker'
           , 'Create the initial screens and populate with data so key stakeholders can review the initial solution.'
           , to_date('20171217', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 11 / Milestone 2
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Define necessary customizations to the Bug Tracker app'
           , 'Add the additional attributes required based on the bug information being delivered.'
           , l_milestone_id
           , 'Y'
           , to_date('20171213', 'YYYYMMDD') + l_add_days
           , to_date('20171214', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Populate Data Structures for Bug Tracker'
           , 'Upload existing bug data from external sources into local tables.'
           , l_milestone_id
           , 'Y'
           , to_date('20171215', 'YYYYMMDD') + l_add_days
           , to_date('20171215', 'YYYYMMDD') + l_add_days
           , 1500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Customize the Bug Tracker app'
           , 'Use built-in functionality and Theme Roller to tweak the application.'
           , l_milestone_id
           , 'Y'
           , to_date('20171215', 'YYYYMMDD') + l_add_days
           , to_date('20171215', 'YYYYMMDD') + l_add_days
           , 500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Lucille Beatie'
           , 'Present First Cut to stakeholders'
           , 'Walk key stakeholders through the initial app and obtain their feedback.'
           , l_milestone_id
           , 'Y'
           , to_date('20171217', 'YYYYMMDD') + l_add_days
           , to_date('20171217', 'YYYYMMDD') + l_add_days
           , 500
          );

        -- Insert Milestone 3 for Project 11
        insert into eba_project_milestones
          (  project_id
           , name
           , description
           , due_date
          )
        values
          (  l_project_id
           , 'Deliver Final Customer Tracker Application'
           , 'Deliver the completed application to the business.'
           , to_date('20171224', 'YYYYMMDD') + l_add_days
          )
          returning id into l_milestone_id;

        -- Insert Tasks for Project 11 / Milestone 3
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Define additional tables / columns within the Bug Tracker app'
           , 'Add the extra bug attributes required based on feedback.'
           , l_milestone_id
           , 'Y'
           , to_date('20171219', 'YYYYMMDD') + l_add_days
           , to_date('20171120', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Mei Yu'
           , 'Final upload of Data Structures for Bug Tracker'
           , 'Reload bug data from external sources into local tables.'
           , l_milestone_id
           , 'Y'
           , to_date('20171221', 'YYYYMMDD') + l_add_days
           , to_date('20171222', 'YYYYMMDD') + l_add_days
           , 1500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Customize the Bug Tracker app based on First-Cut feedback'
           , 'Use built-in functionality and Theme Roller to tweak the application.'
           , l_milestone_id
           , 'Y'
           , to_date('20171222', 'YYYYMMDD') + l_add_days
           , to_date('20171222', 'YYYYMMDD') + l_add_days
           , 500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Miyazaki Yokohama'
           , 'Train staff on use of Bug Tracker'
           , 'Walk key users through the application.'
           , l_milestone_id
           , 'Y'
           , to_date('20171224', 'YYYYMMDD') + l_add_days
           , to_date('20171225', 'YYYYMMDD') + l_add_days
           , 2500
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 11', 110, l_clob);


    l_clob := q'~declare
        l_add_days          number;
        l_project_id        number;
        l_milestone_id      number;
        l_task_id           number;
        l_comment_id        number;
    begin
        ---------------------------
        --<< Insert Project 12 >>--
        ---------------------------
        l_add_days := sysdate - to_date('20180101','YYYYMMDD');
        insert into eba_projects
          (  name
           , description
           , project_lead
           , budget
           , completed_date
           , status_id
          )
          values
          (  'Implement Customer Success Application'
           , 'Implement an application to track and display customer success stories and quotes.'
           , 'Bernard Jackman'
           , 25000
           , to_date('20171231', 'YYYYMMDD') + l_add_days
           , 3
          )
          returning id into l_project_id;

        -- Insert Tasks for Project 12
        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Define main requirements for customer success application.'
           , 'Define the scope and timelines for the development of the app.'
           , null
           , 'Y'
           , to_date('20171217', 'YYYYMMDD') + l_add_days
           , to_date('20171218', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Finalize Customer Success Data Model'
           , 'Define the data model for new and existing entities required to support customer success input and reporting.'
           , null
           , 'Y'
           , to_date('20171219', 'YYYYMMDD') + l_add_days
           , to_date('20171221', 'YYYYMMDD') + l_add_days
           , 2500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Madison Smith'
           , 'Finalize User Experience for Customer Success app'
           , 'Write developer standards on UX and development standards on how the company will acquire and report on customer success.'
           , null
           , 'Y'
           , to_date('20171219', 'YYYYMMDD') + l_add_days
           , to_date('20171220', 'YYYYMMDD') + l_add_days
           , 2500
          );

         insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Brock Shilling'
           , 'Define Admin Screens for Customer Success App'
           , 'Define screens to maintain all of the base tables for the Customer Success apps.'
           , null
           , 'Y'
           , to_date('20171121', 'YYYYMMDD') + l_add_days
           , to_date('20171222', 'YYYYMMDD') + l_add_days
           , 1500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Populate Data Structures for Customer Success App'
           , 'Upload actual data provided from other IT systems.'
           , null
           , 'Y'
           , to_date('20171222', 'YYYYMMDD') + l_add_days
           , to_date('20171222', 'YYYYMMDD') + l_add_days
           , 1000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Tyson King'
           , 'Design production screens for the customer to provide quotes and success stories'
           , 'Implement fully functional and complete screens to allow customers to provide input.'
           , null
           , 'Y'
           , to_date('20171223', 'YYYYMMDD') + l_add_days
           , to_date('20171225', 'YYYYMMDD') + l_add_days
           , 2500
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Eva Jelinek'
           , 'Design screens for collecting information and analyzing results'
           , 'Develop data entry and reporting screens to manage Customer Success.'
           , null
           , 'Y'
           , to_date('20171223', 'YYYYMMDD') + l_add_days
           , to_date('20171226', 'YYYYMMDD') + l_add_days
           , 4000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Daniel James Lee'
           , 'Test Customer Success internal / external apps'
           , 'Do full scale testing on both the customer facing and internal-only screens.'
           , null
           , 'Y'
           , to_date('20171227', 'YYYYMMDD') + l_add_days
           , to_date('20171228', 'YYYYMMDD') + l_add_days
           , 2000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Harold Youngblood'
           , 'Contact initial customers to educate them on providing quotes and success stories'
           , 'Work off a call list to email or call the beta customers and monitor their responses.'
           , null
           , 'Y'
           , to_date('20171227', 'YYYYMMDD') + l_add_days
           , to_date('20171230', 'YYYYMMDD') + l_add_days
           , 4000
          );

        insert into eba_project_tasks
          (  project_id
           , assignee
           , name
           , description
           , milestone_id
           , is_complete_yn
           , start_date
           , end_date
           , cost
          )
        values
          (  l_project_id
           , 'Bernard Jackman'
           , 'Announce Customer Success app to all customers and staff'
           , 'Email all current customers and staff to inform them of the new application and instructions on how to get started.'
           , null
           , 'Y'
           , to_date('20171231', 'YYYYMMDD') + l_add_days
           , to_date('20171231', 'YYYYMMDD') + l_add_days
           , 1000
          );
    end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (1, 'en', 'Insert Project 12', 120, l_clob);

    commit;
end;
/
