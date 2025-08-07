Rem  Copyright (c) 2018, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      wwv_sample_dmls_empdept.sql
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
prompt ...insert into wwv_sample_dmls - Emp / Dept Data
prompt

declare
  l_clob clob;
begin
    -- Insert into JSON Table
    delete from wwv_sample_json
    where wwv_sample_dataset_id = 2;

    -- English JSON
    l_clob :='{
"application": {
  "name": "Demonstration - EMP / DEPT",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
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
        "name": "Employees per Department",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Employees per Job",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Total Salary per Department",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "Total Salary per Job",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "Employees",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "Departments",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'en', l_clob);

    -- Chinese JSON
    l_clob :='{
"application": {
  "name": "EMP / DEPT '|| unistr('\4F8B\5B50') ||'",
  "appShortDescription": "'|| unistr('\57FA\4E8E\6837\672C\6570\636E\751F\6210') ||'",
  "appDescription": "'|| unistr('\672C\7A0B\5E8F\662F\76F4\63A5\7531\6837\672C\6570\636E\751F\6210\3002\8BF7\8BBF\95EE SQL \5DE5\4F5C\5BA4, \5B9E\7528\7A0B\5E8F, \6837\672C\6570\636E \6765\5B89\88C5\8868\7136\540E\521B\5EFA\57FA\4E8E\8FD9\4E9B\8868\7684\7A0B\5E8F\3002') ||'",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "zh",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "'|| unistr('\4E3B\9875') ||'",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "'|| unistr('\4EEA\8868\76D8') ||'",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "'|| unistr('\6309\90E8\95E8\67E5\770B\5458\5DE5') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\6309\804C\4F4D\67E5\770B\5458\5DE5') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\6309\90E8\95E8\67E5\770B\85AA\6C34') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "'|| unistr('\6309\804C\4F4D\67E5\770B\85AA\6C34') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "'|| unistr('\5458\5DE5') ||'",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "'|| unistr('\90E8\95E8') ||'",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'zh', l_clob);

    -- Arabic JSON
    l_clob :='{
"application": {
  "name": "\u0628\u064a\u0627\u0646\u0627\u062a\u0020\u0627\u0644\u0645\u0648\u0638\u0641\u064a\u0646\u0020\u0648\u0020\u0627\u0644\u0623\u0642\u0633\u0627\u0645",
  "appShortDescription": "\u0647\u0630\u0627\u0020\u0627\u0644\u062a\u0637\u0628\u064a\u0642\u0020\u062a\u0645\u0020\u0625\u0646\u0634\u0627\u0624\u0647\u0020\u0639\u0644\u0649\u0020\u0646\u0645\u0627\u0630\u062c\u0020\u0628\u064a\u0627\u0646\u0627\u062a\u0020\u0648\u0647\u0645\u064a\u0629",
  "appDescription": "\u062a\u0645\u0020\u0625\u0646\u0634\u0627\u0621\u0020\u0647\u0630\u0627\u0020\u0627\u0644\u062a\u0637\u0628\u064a\u0642\u0020\u0645\u0628\u0627\u0634\u0631\u0629\u0020\u0645\u0646\u0020\u0646\u0645\u0627\u0630\u062c\u0020\u0645\u062c\u0645\u0648\u0639\u0627\u062a\u0020\u0627\u0644\u0628\u064a\u0627\u0646\u0627\u062a\u002e\u0020\u0627\u0646\u062a\u0642\u0644\u0020\u0625\u0644\u0649\u0020\u0053\u0051\u004c\u0020\u0057\u006f\u0072\u006b\u0073\u0068\u006f\u0070\u003e\u0020\u0055\u0074\u0069\u006c\u0069\u0074\u0069\u0065\u0073\u003e\u0020\u0053\u0061\u006d\u0070\u006c\u0065\u0020\u0044\u0061\u0074\u0061\u0073\u0065\u0074\u0073\u0020\u0644\u062a\u062b\u0628\u064a\u062a\u0020\u0627\u0644\u062c\u062f\u0627\u0648\u0644\u0020\u062b\u0645\u0020\u0625\u0646\u0634\u0627\u0621\u0020\u062a\u0637\u0628\u064a\u0642\u0020\u0628\u0646\u0627\u0621\u064b\u0020\u0639\u0644\u0649\u0020\u062a\u0644\u0643\u0020\u0627\u0644\u062c\u062f\u0627\u0648\u0644\u002e",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "ar",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "\u0644\u0648\u062d\u0629\u0020\u0627\u0644\u062a\u062d\u0643\u0645",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "\u0639\u062f\u062f\u0020\u0627\u0644\u0645\u0648\u0638\u0641\u064a\u0646\u0020\u062d\u0633\u0628\u0020\u0627\u0644\u0642\u0633\u0645",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "\u0639\u062f\u062f\u0020\u0627\u0644\u0645\u0648\u0638\u0641\u064a\u0646\u0020\u062d\u0633\u0628\u0020\u0627\u0644\u0648\u0638\u064a\u0641\u0629",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "\u0645\u062c\u0645\u0648\u0639\u0020\u0627\u0644\u0631\u0648\u0627\u062a\u0628\u0020\u062d\u0633\u0628\u0020\u0627\u0644\u0642\u0633\u0645",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "\u0645\u062c\u0645\u0648\u0639\u0020\u0627\u0644\u0631\u0648\u0627\u062a\u0628\u0020\u062d\u0633\u0628\u0020\u0627\u0644\u0648\u0638\u064a\u0641\u0629",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "\u0627\u0644\u0645\u0648\u0638\u0641\u064a\u0646",
      "pageIcon": "fa-table-search",
      "resultRegionType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "\u0627\u0644\u0623\u0642\u0633\u0627\u0645",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
      "help": ""
    }
    ],
  "generalSettings": {
    "builtWithLove": true,
    "learnAppDefaults": false,
    "version": "\u0627\u0644\u0625\u0635\u062f\u0627\u0631 1.0",
    "logging": true,
    "debugging": true
    },
  "globalizationSettings": {
    "dateFormat": "DL",
    "documentDirection": "right-to-left"
    },
  "securitySettings": {
    "deepLinking": false,
    "maximumSessionSeconds": "",
    "maximumSessionIdleSeconds": ""
    }
  }
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'ar', l_clob);


    -- Czech JSON
    l_clob :='{
"application": {
  "name": "Demonstrace - EMP / DEPT",
  "appShortDescription": "'|| unistr('Vygenerov\00E1no na z\00E1klad\011B vzorov\00E9 sady dat!') ||'",
  "appDescription": "'|| unistr('Tato aplikace byla vygenerov\00E1na p\0159\00EDmo ze vzorov\00FDch datov\00FDch sad. Chcete-li nainstalovat tabulky a pot\00E9 na z\00E1klad\011B t\011Bchto tabulek vytvo\0159it aplikaci, p\0159ejd\011Bte na SQL Workshop, Utilities, Sample Datasets.') || '",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "cs",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "Domov",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "'|| unistr('P\0159\00EDstrojov\00E1') ||'",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "'|| unistr('Zam\011Bstnanci na jedno odd\011Blen\00ED') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('Celkov\00E1 mzda na odd\011Blen\00ED') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('Zam\011Bstnanci na jednu zak\00E1zku') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "'|| unistr('Celkov\00E1 mzda za ka\017Edou \00FAlohu') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "'|| unistr('Zam\011Bstnanci') ||'",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "'|| unistr('Odd\011Blen\00ED') ||'",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'cs', l_clob);

    -- French JSON
    l_clob :='{
"application": {
  "name": "'|| unistr('D\00E9monstration- EMP / DEPT') ||'",
  "appShortDescription": "'|| unistr('Cette application a \00E9t\00E9 g\00E9n\00E9r\00E9e \00E0 partir d''un exemple de jeu de donn\00E9es') ||'",
  "appDescription": "'|| unistr('Tato aplikace byla vygenerov\00E1na p\0159\00EDmo ze vzorov\00FDch datov\00FDch sad. Chcete-li nainstalovat tabulky a pot\00E9 na z\00E1klad\011B t\011Bchto tabulek vytvo\0159it aplikaci, p\0159ejd\011Bte na SQL Workshop,Utilities, Sample Datasets.') ||'",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "fr",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "Accueil",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "Tableau de Bord",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "'|| unistr('Employ\00E9s par d\00E9partement') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('Employ\00E9s par emploi') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('Salaire total par d\00E9partement') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "Salaire total par emploi",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "'|| unistr('Employ\00E9s') ||'",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "'|| unistr('D\00E9partements') ||'",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'fr', l_clob);

    -- German JSON
    l_clob :='{
"application": {
  "name": "Demonstration - EMP / DEPT",
  "appShortDescription": "Generiert basierend auf einem Beispieldatensatz!",
  "appDescription": "Diese Anwendung wurde basierend auf einem Beispieldatensatz generiert. Weitere Tabellen koennen unter SQL Workshop, Utilitys, Beispieldatensaetze erstellet werden. Danach koennen auf diese Daten Anwendungen generiert werden.",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "de",
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
        "name": "Mitarbeiter pro Abteilung",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Mitarbeiter pro Taetigkeit",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Summe aller Gehaelter pro Abteilung",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "Summe aller Gehaelter pro Taetigkeit",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "Mitarbeiter",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "Abteilungen",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'de', l_clob);

    -- Italian JSON
    l_clob :='{
  "application": {
    "name": "Dimostrazione - EMP / DEPT",
    "appShortDescription": "Generata basandosi su un dataset di esempio!",
    "appDescription": "'||unistr('Questa applicazione \00e8 stata generata direttamente da dataset di esempio. Vai a SQL Workshop, Utilit\00e0, Dataset di Esempio per installare le tabelle e quindi creare un applicazione basata su quelle tabelle.')||'",
    "schema": "MOULEDHA",
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
      "icon": "app-icon-people",
      "iconBackgroundClass": "app-color-1",
      "iconColorHEX": "#309FDB"
    },
    "settings": {
      "baseTablePrefix": "",
      "primaryLanguage": "it",
      "authentication": "NATIVE_APEX_ACCOUNTS"
    },
    "pages": [
      {
        "page": "1",
        "pageType": "blank",
        "pageName": "Pagina iniziale",
        "pageIcon": "fa-home",
        "pageIsHomePage": true,
        "help": ""
      },
      {
        "page": "2",
        "pageType": "dashboard",
        "pageName": "Pannello di controllo",
        "pageIcon": "fa-dashboard",
        "help": "",
        "dashboardWidgets": [
          {
            "name": "Dipendenti Per Dipartimento",
            "type": "pie",
            "table": "EMP_DEPT_V",
            "labelColumn": "DNAME",
            "valueColumn": "allColumns",
            "valueDerivation": "count"
          },
          {
            "name": "Dipendenti Per Ruolo",
            "type": "pie",
            "table": "EMP_DEPT_V",
            "labelColumn": "JOB",
            "valueColumn": "allColumns",
            "valueDerivation": "count"
          },
          {
            "name": "Stipendio Totale Per Dipartimento",
            "type": "bar",
            "table": "EMP_DEPT_V",
            "labelColumn": "DNAME",
            "valueColumn": "SAL",
            "valueDerivation": "sum"
          },
          {
            "name": "Stipendio Totale Per Ruolo",
            "type": "bar",
            "table": "EMP_DEPT_V",
            "labelColumn": "JOB",
            "valueColumn": "SAL",
            "valueDerivation": "sum"
          }
        ]
      },
      {
        "page": "3",
        "pageType": "facetedSearch",
        "pageName": "Dipendenti",
        "pageIcon": "fa-table-search",
        "resultRegionType": "CR",
        "reportImplementation": "TABLE",
        "table": "EMP",
        "includeFormWithReport": true,
        "help": ""
      },
      {
        "page": "4",
        "pageType": "interactiveReport",
        "pageName": "Dipartimenti",
        "pageIcon": "fa-table",
        "reportImplementation": "TABLE",
        "table": "DEPT",
        "includeFormWithReport": true,
        "drillDownLinkColumn": "DNAME",
        "drillDownLinkKey": "DEPTNO",
        "linkToPage": "",
        "linkToKey": "DEPTNO",
        "help": ""
      }
    ],
    "generalSettings": {
      "builtWithLove": true,
      "learnAppDefaults": false,
      "version": "Rilascio 1.0",
      "logging": true,
      "debugging": true
    },
    "globalizationSettings": {
      "documentDirection": "left-to-right"
    },
    "securitySettings": {
      "deepLinking": false,
      "maximumSessionSeconds": "",
      "maximumSessionIdleSeconds": ""
    }
  }
}
';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'it', l_clob);

    -- Japanese JSON
    l_clob :='{
"application": {
  "name": "'|| unistr('\30C7\30E2\0020\002D\0020\5F93\696D\54E1\0020\002F\0020\90E8\9580') ||'",
  "appShortDescription": "'|| unistr('\30B5\30F3\30D7\30EB\30C7\30FC\30BF\304B\3089\958B\767A') ||'",
  "appDescription": "'|| unistr('\3053\306E\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\306F\3001\30B5\30F3\30D7\30EB\30C7\30FC\30BF\30BB\30C3\30C8\304B\3089\76F4\63A5\751F\6210\3055\308C\307E\3057\305F\3002\0020\0053\0051\004C\0020\0057\006F\0072\006B\0073\0068\006F\0070\002C\0020\0055\0074\0069\006C\0069\0074\0069\0065\0073\002C\0020\0053\0061\006D\0070\006C\0065\0020\0044\0061\0074\0061\0073\0065\0074\0073\306B\79FB\52D5\3057\3066\30C6\30FC\30D6\30EB\3092\30A4\30F3\30B9\30C8\30FC\30EB\3057\3001\305D\308C\3089\306E\30C6\30FC\30D6\30EB\306B\57FA\3065\3044\3066\30A2\30D7\30EA\30B1\30FC\30B7\30E7\30F3\3092\4F5C\6210\3057\307E\3059\3002') ||'",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "ja",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "'|| unistr('\30DB\30FC\30E0') ||'",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "'|| unistr('\30C0\30C3\30B7\30E5\30DC\30FC\30C9') ||'",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "'|| unistr('\90E8\9580\3054\3068\306E\5F93\696D\54E1') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\8077\7A2E\3054\3068\306E\5F93\696D\54E1') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\90E8\7F72\3054\3068\306E\7DCF\7D66\4E0E') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "'|| unistr('\8077\7A2E\3054\3068\306E\5408\8A08\7D66\4E0E') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "'|| unistr('\5F93\696D\54E1') ||'",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "'|| unistr('\90E8\9580') ||'",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'ja', l_clob);

    -- Korean JSON
    l_clob :='{
"application": {
  "name": "'|| unistr('\BD80\C11C\C640\C9C1\C6D0 \C0D8\D50C \C560\D50C\B9AC\AC8C\C774\C158') ||'",
  "appShortDescription": "'|| unistr('\C0D8\D50C\B370\C774\D130\B85C\C0DD\C131!') ||'",
  "appDescription": "'||
  unistr('\C774\C560\D50C\B9AC\CF00\C774\C158\C740\C0D8\D50C\B370\C774\D130\C5D0\C11C\C9C1\C811\C0DD\C131\B418\C5C8\C2B5\B2C8\B2E4.\D14C\C774\BE14\C124\CE58\C640\D14C\C774\BE14\C744\C774\C6A9\D55C\C560\D50C\B9AC\CF00\C774\C158\C744\C0DD\C131\D558\B824\BA74 SQL\C6CC\D06C\C20D ,\C720\D2F8\B9AC\D2F0 ,\C0D8\D50C\B370\C774\D130\C138\D2B8\B85C\AC00\C2ED\C2DC\C694.')
  || '",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "ko",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "'|| unistr('\D648') ||'",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "'|| unistr('\B300\C2DC\BCF4\B4DC') ||'",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "'|| unistr('\BD80\C11C\BCC4\C9C1\C6D0') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\C9C1\C6D0\B4E4\C9C1\CC45') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\BD80\C11C\BCC4\AE09\C5EC') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "'|| unistr('\C9C1\CC45\BCC4\AE09\C5EC') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "'|| unistr('\C9C1\C6D0') ||'",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "'|| unistr('\BD80\C11C') ||'",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'ko', l_clob);

    -- Polish JSON
    l_clob :='{
"application": {
  "name": "'|| unistr('Przyk\0142adowa aplikacja - EMP / DEPT') ||'",
  "appShortDescription": "'|| unistr('Aplikacja wygenerowana w oparciu o przyk\0142adowy zestaw danych!') ||'",
  "appDescription": "'|| unistr('Ta aplikacja zosta\0142a wygenerowana bezpo\015Brednio z przyk\0142adowych zestaw\00F3w danych. Przejd\017A do SQL Workshop, Narz\0119dzia, Sample Datasets, aby zainstalowa\0107 tabele, a nast\0119pnie utw\00F3rz aplikacj\0119 na podstawie tych tabel.') || '",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "pl",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "'|| unistr('Strona g\0142\00F3wna') ||'",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "'|| unistr('Przegl\0105d') ||'",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "'|| unistr('Pracownicy wg dzia\0142\00F3w') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Pracownicy wg stanowisk",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\0141\0105cznie pensje w dziale') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "'|| unistr('\0141\0105cznie pensje dla stanowiska') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "Pracownicy",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "'|| unistr('Dzia\0142y') ||'",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'pl', l_clob);

    -- Russian JSON
    l_clob :='{
"application": {
  "name": "'|| unistr('\0414\0435\043C\043E\043D\0441\0442\0440\0430\0446\0438\043E\043D\043D\043E\0435 \043F\0440\0438\043B\043E\0436\0435\043D\0438\0435') ||'",
  "appShortDescription": "'|| unistr('\042D\0442\043E \043F\0440\0438\043B\043E\0436\0435\043D\0438\0435 \0431\044B\043B\043E \0441\043E\0437\0434\0430\043D\043E \0438\0437 \043D\0430\0431\043E\0440\0430 \0434\0435\043C\043E\043D\0441\0442\0440\0430\0446\0438\043E\043D\043D\044B\0445 \0434\0430\043D\043D\044B\0445!') ||'",
  "appDescription": "'||
  unistr('\042D\0442\043E \043F\0440\0438\043B\043E\0436\0435\043D\0438\0435 \0431\044B\043B\043E \0441\043E\0437\0434\0430\043D\043E \0438\0437 \043D\0430\0431\043E\0440\0430 \0434\0435\043C\043E\043D\0441\0442\0440\0430\0446\0438\043E\043D\043D\044B\0445 \0434\0430\043D\043D\044B\0445. \041F\0435\0440\0435\0439\0434\0438\0442\0435 \0432 SQL Workshop, Utilities, Sample Datasets \0447\0442\043E\0431\044B \0441\043E\0437\0434\0430\0442\044C \0434\0435\043C\043E\043D\0441\0442\0440\0430\0446\0438\043E\043D\043D\044B\0435 \0442\0430\0431\043B\0438\0446\044B \0438 \0437\0430\0442\0435\043C \0441\043E\0437\0434\0430\0442\044C \043F\0440\0438\043B\043E\0436\0435\043D\0438\0435 \043D\0430 \043E\0441\043D\043E\0432\0435 \044D\0442\0438\0445 \0442\0430\0431\043B\0438\0446.')
  || '",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "ru",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "'|| unistr('\0413\043B\0430\0432\043D\0430\044F') ||'",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "'|| unistr('\0418\043D\0444\043E\0440\043C\0430\0446\0438\043E\043D\043D\0430\044F \043F\0430\043D\0435\043B\044C') ||'",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "'|| unistr('\041A\043E\043B\0438\0447\0435\0441\0442\0432\043E \0441\043E\0442\0440\0443\0434\043D\0438\043A\043E\0432 \043F\043E \043E\0442\0434\0435\043B\0430\043C') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\041A\043E\043B\0438\0447\0435\0441\0442\0432\043E \0441\043E\0442\0440\0443\0434\043D\0438\043A\043E\0432 \043F\043E \0434\043E\043B\0436\043D\043E\0441\0442\044F\043C') ||'",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "'|| unistr('\041E\0431\0449\0430\044F \0437\0430\0440\043F\043B\0430\0442\0430 \043F\043E \043E\0442\0434\0435\043B\0430\043C') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "'|| unistr('\041E\0431\0449\0430\044F \0437\0430\0440\043F\043B\0430\0442\0430 \043F\043E \0434\043E\043B\0436\043D\043E\0441\0442\044F\043C') ||'",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "'|| unistr('\0421\043E\0442\0440\0443\0434\043D\0438\043A\0438') ||'",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "'|| unistr('\041E\0442\0434\0435\043B\044B') ||'",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'ru', l_clob);

    -- Spanish JSON
    l_clob :='{
"application": {
  "name": "'|| unistr('Demostraci\00F3n - EMP / DEPT') ||'",
  "appShortDescription": "'|| unistr('Esta aplicaci\00F3n se gener\00F3 a partir de un conjunto de datos de muestra!') ||'",
  "appDescription": "'|| unistr('Esta aplicaci\00F3n se gener\00F3 directamente a partir de conjuntos de datos de muestra. Vaya a SQL Workshop, Utilities, Sample Datasets para instalar tablas y luego cree una aplicaci\00F3n basada en esas tablas.') ||'",
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
    "icon": "app-icon-people",
    "iconBackgroundClass": "app-color-1",
    "iconColorHEX": "#309FDB"
    },
  "settings": {
    "baseTablePrefix": "",
    "primaryLanguage": "es",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "Casa",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "Tablero",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "Empleados por departamento",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Empleados por trabajo",
        "type": "pie",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Salario total por departamento",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "DNAME",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ,
      {
        "name": "Salario total por trabajo",
        "type": "bar",
        "table": "EMP_DEPT_V",
        "labelColumn": "JOB",
        "valueColumn": "SAL",
        "valueDerivation": "sum"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "Empleados",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EMP",
      "includeFormWithReport": true,
      "table": "EMP",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "Departamentos",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "DEPT",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "DNAME",
      "drillDownLinkKey": "DEPTNO",
      "linkToPage": "",
      "linkToKey": "DEPTNO",
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
}';
    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  2, 'es', l_clob);

    commit;

    -- Insert into DML Table
    delete from wwv_sample_dmls
    where wwv_sample_dataset_id = 2;

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d (10,'ACCOUNTING','NEW YORK');
d (20,'RESEARCH','DALLAS');
d (30,'SALES','CHICAGO');
d (40,'OPERATIONS','BOSTON');
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'en', 'Insert Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d (10, unistr('\4F1A\8BA1'), unistr('\5317\4EAC'));
d (20, unistr('\7814\53D1'), unistr('\6DF1\5733'));
d (30, unistr('\9500\552E'), unistr('\4E0A\6D77'));
d (40, unistr('\8FD0\8425'), unistr('\5E7F\5DDE'));
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'zh', 'Insert Chinese Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d (10, unistr('\0627\0644\0645\062d\0627\0633\0628\0629'), unistr('\0627\0644\062f\0627\0631\0020\0627\0644\0628\064a\0636\0627\0621'));
d (20, unistr('\0627\0644\0623\0628\062d\0627\062b'), unistr('\0627\0644\0642\0627\0647\0631\0629'));
d (30, unistr('\0627\0644\0645\0628\064a\0639\0627\062a'), unistr('\0627\0644\062f\0648\062d\0629'));
d (40, unistr('\0627\0644\0639\0645\0644\064a\0627\062a'), unistr('\0627\0644\0642\062f\0633'));
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'ar', 'Insert Arabic Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d ( 10, unistr('\00DA\010CETNICTV\00CD'),'PRAHA');
d ( 20, unistr('V\00DDZKUM'),'PILSEN');
d ( 30,'ODBYT','BRNO');
d ( 40,'OPERACE','KLADNO');
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'cs', 'Insert Czech Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d (10, unistr('COMPTABILIT\00C9'),'PARIS');
d (20,'RECHERCHE','BORDEAUX');
d (30,'VENTES','LYON');
d (40, unistr('OP\00C9RATIONS'),'MARSEILLE');
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'fr', 'Insert French Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d ( 10 , 'BUCHHALTUNG' , 'BERLIN'              );
d ( 20 , 'FORSCHUNG'   , unistr('M\00DCNCHEN') );
d ( 30 , 'VERTRIEB'    , 'DRESDEN'             );
d ( 40 , 'INNENDIENST' , 'HAMBURG'             );
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'de', 'Insert German Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d (10,unistr('CONTABILIT\00C0'),'ROMA');
d (20,'RICERCA','MILANO');
d (30,'VENDITE','FIRENZE');
d (40,'OPERAZIONI','NAPOLI' );
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'it', 'Insert Italian Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d (10 , unistr('\4F1A\8A08')           , unistr('\6771\4EAC'));
d (20 , unistr('\7814\7A76\958B\767A') , unistr('\4EAC\90FD'));
d (30 , unistr('\30BB\30FC\30EB\30B9') , unistr('\5927\962A'));
d (40 , unistr('\696D\52D9')           , unistr('\540D\53E4\5C4B'));
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'ja', 'Insert Japanese Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d ( 10, unistr('\ACBD\B9AC\BD80'), unistr('\C11C\C6B8\C2DC') );
d ( 20, unistr('\C5F0\AD6C\BD80'), unistr('\CDA9\C8FC\C2DC') );
d ( 30, unistr('\C601\C5C5\BD80'), unistr('\C11C\C6B8\C2DC') );
d ( 40, unistr('\C0AC\C5C5\BD80'), unistr('\AD11\C591\C2DC') );
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'ko', 'Insert Korean Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d ( 10, unistr('RACHUNKOWO\015A\0106'),'WARSZAWA');
d ( 20,'BADANIA', unistr('KRAK\00D3W') );
d ( 30, unistr('SPRZEDA\017B'), unistr('\0141\00D3D\0179') );
d ( 40,'EKSPLOATACJA', unistr('WROC\0141AW') );
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'pl', 'Insert Polish Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d ( 10, unistr('\0411\0443\0445\0433\0430\043B\0442\0435\0440\0438\044F'), unistr('\041C\043E\0441\043A\0432\0430') );
d ( 20, unistr('\0418\043D\0444\043E\0440\043C\0430\0446\0438\043E\043D\043D\044B\0435 \0442\0435\0445\043D\043E\043B\043E\0433\0438\0438'), unistr('\0421\0430\043D\043A\0442-\041F\0435\0442\0435\0440\0431\0443\0440\0433') );
d ( 30, unistr('\041F\0440\043E\0434\0430\0436\0438'), unistr('\041E\043C\0441\043A') );
d ( 40, unistr('\041F\0435\0440\0441\043E\043D\0430\043B'), unistr('\0412\043E\043B\0433\043E\0433\0440\0430\0434') );
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'ru', 'Insert Russian Departments', 10, l_clob);

    l_clob :=q'~declare
type t_dept is table of dept%rowtype index by binary_integer;
l_dept t_dept;
procedure d (  p_deptno in number
             , p_dname  in varchar2
             , p_loc    in varchar2
            ) is
  begin
    l_dept(l_dept.count + 1).deptno := p_deptno;
    l_dept(l_dept.count).dname      := p_dname;
    l_dept(l_dept.count).loc        := p_loc;
  end d;
begin
d (10,'CONTABILIDAD','MADRID');
d (20, unistr('INVESTIGACI\00D3N'),'BARCELONA');
d (30,'VENTAS','SEVILLA');
d (40,'OPERACIONES','VALENCIA');
forall i in indices of l_dept
  insert into dept values l_dept(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'es', 'Insert Spanish Departments', 10, l_clob);


    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839,'KING','PRESIDENT',null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
e (7698,'BLAKE','MANAGER',7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
e (7782,'CLARK','MANAGER',7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
e (7566,'JONES','MANAGER',7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
e (7788,'SCOTT','ANALYST',7566,to_date('09-12-82','DD-MM-RR'),3000,null,20);
e (7902,'FORD','ANALYST',7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
e (7369,'SMITH','CLERK',7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
e (7499,'ALLEN','SALESMAN',7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
e (7521,'WARD','SALESMAN',7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
e (7654,'MARTIN','SALESMAN',7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844,'TURNER','SALESMAN',7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
e (7876,'ADAMS','CLERK',7788,to_date('12-01-83','DD-MM-RR'),1100,null,20);
e (7900,'JAMES','CLERK',7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
e (7934,'MILLER','CLERK',7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'en', 'Insert Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839, unistr('\5F20\4F1F'), unistr('\603B\88C1'), null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
e (7698, unistr('\5F20\4E09'), unistr('\7ECF\7406'),7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
e (7782, unistr('\738B\82B3'), unistr('\7ECF\7406'),7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
e (7566, unistr('\674E\56DB'), unistr('\7ECF\7406'),7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
e (7788, unistr('\674E\5A1C'), unistr('\5206\6790\5E08'),7566,to_date('09-12-82','DD-MM-RR'),3000,null,20);
e (7902, unistr('\5F20\654F'), unistr('\5206\6790\5E08'),7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
e (7369, unistr('\674E\9759'), unistr('\6587\5458'),7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
e (7499, unistr('\738B\9759'), unistr('\9500\552E\5458'),7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
e (7521, unistr('\5218\4F1F'), unistr('\9500\552E\5458'),7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
e (7654, unistr('\96F7\6DD1'), unistr('\9500\552E\5458'),7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844, unistr('\5B8B\7FBD'), unistr('\9500\552E\5458'),7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
e (7876, unistr('\6797\60E0'), unistr('\6587\5458'),7788,to_date('12-01-83','DD-MM-RR'),1100,null,20);
e (7900, unistr('\80E1\5929'), unistr('\6587\5458'),7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
e (7934, unistr('\7F8E\73B2'), unistr('\6587\5458'),7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'zh', 'Insert Chinese Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839, unistr('\0645\062d\0645\062f'), unistr('\0631\0626\064a\0633\0028\0629\0029'), null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
e (7698, unistr('\0645\0647\062f\064a'), unistr('\0645\062f\064a\0631\0028\0629\0029'),7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
e (7782, unistr('\0646\0648\0631'), unistr('\0645\062f\064a\0631\0028\0629\0029'),7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
e (7566, unistr('\0645\0631\064a\0645'), unistr('\0645\062f\064a\0631\0028\0629\0029'),7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
e (7788, unistr('\0623\062d\0645\062f'), unistr('\0645\062d\0644\0644\0028\0629\0029'),7566,to_date('09-12-82','DD-MM-RR'),3000,null,20);
e (7902, unistr('\0641\0624\0627\062f'), unistr('\0645\062d\0644\0644\0028\0629\0029'),7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
e (7369, unistr('\0635\0627\0644\062d'), unistr('\0643\0627\062a\0628\0028\0629\0029'),7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
e (7499, unistr('\0645\0646\0627\0644'), unistr('\0628\0627\0626\0639\0028\0629\0029'),7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
e (7521, unistr('\064a\0648\0633\0641'), unistr('\0628\0627\0626\0639\0028\0629\0029'),7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
e (7654, unistr('\064a\0627\0633\064a\0646'), unistr('\0628\0627\0626\0639\0028\0629\0029'),7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844, unistr('\062d\0645\064a\062f'), unistr('\0628\0627\0626\0639\0028\0629\0029'),7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
e (7876, unistr('\0645\0646\0627\0644'), unistr('\0643\0627\062a\0628\0028\0629\0029'),7788,to_date('12-01-83','DD-MM-RR'),1100,null,20);
e (7900, unistr('\0633\0639\062f'), unistr('\0643\0627\062a\0628\0028\0629\0029'),7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
e (7934, unistr('\062d\0633\0627\0645'), unistr('\0643\0627\062a\0628\0028\0629\0029'),7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'ar', 'Insert Arabic Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839,'FRYC','PREZIDENT',null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
e (7698,'BURIN', unistr('MANA\017DER'),7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
e (7782,unistr('NOV\00C1K'), unistr('MANA\017DER'),7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
e (7566,'SVOBODA', unistr('MANA\017DER'),7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
e (7788,unistr('NOVOTN\00C1'),'ANALYTIK',7566,to_date('09-12-82','DD-MM-RR'),3000,null,20);
e (7902,unistr('DVO\0158\00C1K'),'ANALYTIK',7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
e (7369,unistr('\010CERN\00C1'), unistr('\00DA\0158EDN\00CDK'),7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
e (7499,unistr('PROCH\00C1ZKA'), unistr('PRODAVA\010C'),7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
e (7521,unistr('KU\010CEROV\00C1'), unistr('PRODAVA\010C'),7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
e (7654,unistr('VESEL\00DD'), unistr('PRODAVA\010C'),7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844,unistr('HOR\00C1K'), unistr('PRODAVA\010C'),7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
e (7876,unistr('KREJ\010C\00CD'), unistr('\00DA\0158EDN\00CDK'),7788,to_date('12-01-83','DD-MM-RR'),1100,null,20);
e (7900,unistr('\0160\0164ASTN\00DD'), unistr('\00DA\0158EDN\00CDK'),7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
e (7934,unistr('\010C\00CDTEK'), unistr('\00DA\0158EDN\00CDK'),7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'cs', 'Insert Czech Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839,'MARTIN', unistr('PR\00C9SIDENT'),NULL,TO_DATE('17-11-81','DD-MM-RR'),5000,NULL,10);
e (7698,'BERNARD', 'DIRECTEUR',7839,TO_DATE('01-05-81','DD-MM-RR'),2850,NULL,30);
e (7782,'PETIT', 'DIRECTEUR',7839,TO_DATE('09-06-81','DD-MM-RR'),2450,NULL,10);
e (7566,'DUBOIS', 'DIRECTEUR',7839,TO_DATE('02-04-81','DD-MM-RR'),2975,NULL,20);
e (7788,'ROUX', 'ANALYSTE',7566,TO_DATE('09-12-82','DD-MM-RR'),3000,NULL,20);
e (7902,'DUPONT',  'ANALYSTE',7566,TO_DATE('03-12-81','DD-MM-RR'),3000,NULL,20);
e (7369,'VINCENT', unistr('EMPLOY\00C9'),7902,TO_DATE('17-12-80','DD-MM-RR'),800,NULL,20);
e (7499,'LEFEVRE', 'VENDEUR',7698,TO_DATE('20-02-81','DD-MM-RR'),1600,300,30);
e (7521,'LAMBERT',  'VENDEUR',7698,TO_DATE('22-02-81','DD-MM-RR'),1250,500,30);
e (7654,'GARNIER','VENDEUR',7698,TO_DATE('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844,'MORIN','VENDEUR',7698,TO_DATE('08-09-81','DD-MM-RR'),1500,0,30);
e (7876, unistr('CL\00C9MENT'), unistr('EMPLOY\00C9'),7788,TO_DATE('12-01-83','DD-MM-RR'),1100,NULL,20);
e (7900,'SIMON', unistr('EMPLOY\00C9'),7698,TO_DATE('03-12-81','DD-MM-RR'),950,NULL,30);
e (7934,'LAURENT', unistr('EMPLOY\00C9'),7782,TO_DATE('23-01-82','DD-MM-RR'),1300,NULL,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'fr', 'Insert French Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e ( 7839 , unistr('K\00D6NIG')  , unistr('PR\00C4SIDENT') , null , to_date('17-11-81','DD-MM-RR') , 5000 , null , 10 );
e ( 7698 , 'SCHWARZ'            , 'DIREKTOR'              , 7839 , to_date('01-05-81','DD-MM-RR') , 2850 , null , 30 );
e ( 7782 , 'FISCHER'            , 'DIREKTOR'              , 7839 , to_date('09-06-81','DD-MM-RR') , 2450 , null , 10 );
e ( 7566 , 'WEBER'              , 'DIREKTOR'              , 7839 , to_date('02-04-81','DD-MM-RR') , 2975 , null , 20 );
e ( 7788 , 'KOCH'               , 'ANALYST'               , 7566 , to_date('09-12-82','DD-MM-RR') , 3000 , null , 20 );
e ( 7902 , 'BRAUN'              , 'ANALYST'               , 7566 , to_date('03-12-81','DD-MM-RR') , 3000 , null , 20 );
e ( 7369 , 'SCHMIDT'            , 'BUCHHALTER'            , 7902 , to_date('17-12-80','DD-MM-RR') ,  800 , null , 20 );
e ( 7499 , 'MEYER'              , unistr('VERK\00C4UFER') , 7698 , to_date('20-02-81','DD-MM-RR') , 1600 ,  300 , 30 );
e ( 7521 , 'SCHNEIDER'          , unistr('VERK\00C4UFER') , 7698 , to_date('22-02-81','DD-MM-RR') , 1250 ,  500 , 30 );
e ( 7654 , 'MARTIN'             , unistr('VERK\00C4UFER') , 7698 , to_date('28-09-81','DD-MM-RR') , 1250 , 1400 , 30 );
e ( 7844 , 'SCHULZ'             , unistr('VERK\00C4UFER') , 7698 , to_date('08-09-81','DD-MM-RR') , 1500 ,    0 , 30 );
e ( 7876 , 'WOLF'               , 'BUCHHALTER'            , 7788 , to_date('12-01-83','DD-MM-RR') , 1100 , null , 20 );
e ( 7900 , 'BAUER'              , 'BUCHHALTER'            , 7698 , to_date('03-12-81','DD-MM-RR') ,  950 , null , 30 );
e ( 7934 , unistr('M\00DCLLER') , 'BUCHHALTER'            , 7782 , to_date('23-01-82','DD-MM-RR') , 1300 , null , 10 );
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'de', 'Insert German Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839,'ROSSI','PRESIDENTE',null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
e (7698,'BRUNO','MANAGER',7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
e (7782,'GALLO','MANAGER',7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
e (7566,'COSTA','MANAGER',7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
e (7788,'MORETTI','ANALISTA',7566,to_date('09-12-82','DD-MM-RR'),3000,null,20);
e (7902,'GRECO','ANALISTA',7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
e (7369,'ROMANO','IMPIEGATO',7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
e (7499,'BIANCHI','VENDITORE',7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
e (7521,'RUSSO','VENDITORE',7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
e (7654,'MANCINI','VENDITORE',7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844,'ESPOSITO','VENDITORE',7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
e (7876,'CONTI','IMPIEGATO',7788,to_date('12-01-83','DD-MM-RR'),1100,null,20);
e (7900,'GIORDANO','IMPIEGATO',7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
e (7934,'RICCI','IMPIEGATO',7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'it', 'Insert Italian Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839 , unistr('\4E2D\5CF6\0020\4E9C\5E0C\5B50') , unistr('\793E\9577')                     , null , to_date('17-11-81' , 'DD-MM-RR') , 5000 , null , 10);
e (7698 , unistr('\4F0A\85E4\0020\660E\5B50')      , unistr('\30DE\30CD\30FC\30B8\30E3\30FC') , 7839 , to_date('01-05-81' , 'DD-MM-RR') , 2850 , null , 30);
e (7782 , unistr('\5742\672C\0020\660E')           , unistr('\30DE\30CD\30FC\30B8\30E3\30FC') , 7839 , to_date('09-06-81' , 'DD-MM-RR') , 2450 , null , 10);
e (7566 , unistr('\95A2\53E3\0020\6643')           , unistr('\30DE\30CD\30FC\30B8\30E3\30FC') , 7839 , to_date('02-04-81' , 'DD-MM-RR') , 2975 , null , 20);
e (7788 , unistr('\65B0\4E95\0020\6566\5B50')      , unistr('\30A2\30CA\30EA\30B9\30C8')      , 7566 , to_date('09-12-82' , 'DD-MM-RR') , 3000 , null , 20);
e (7902 , unistr('\77F3\6A4B\0020\6566')           , unistr('\30A2\30CA\30EA\30B9\30C8')      , 7566 , to_date('03-12-81' , 'DD-MM-RR') , 3000 , null , 20);
e (7369 , unistr('\6751\7530\0020\6DF3')           , unistr('\5E97\54E1')                     , 7902 , to_date('17-12-80' , 'DD-MM-RR') , 800  , null , 20);
e (7499 , unistr('\6751\4E0A\0020\7DBE\5B50')      , unistr('\30BB\30FC\30EB\30B9')           , 7698 , to_date('20-02-81' , 'DD-MM-RR') , 1600 , 300  , 30);
e (7521 , unistr('\6589\85E4\0020\5927\4ECB')      , unistr('\30BB\30FC\30EB\30B9')           , 7698 , to_date('22-02-81' , 'DD-MM-RR') , 1250 , 500  , 30);
e (7654 , unistr('\9AD8\6A4B\0020\5927\8F14')      , unistr('\30BB\30FC\30EB\30B9')           , 7698 , to_date('28-09-81' , 'DD-MM-RR') , 1250 , 1400 , 30);
e (7844 , unistr('\91D1\5B50\0020\6075\7F8E')      , unistr('\30BB\30FC\30EB\30B9')           , 7698 , to_date('08-09-81' , 'DD-MM-RR') , 1500 , 0    , 30);
e (7876 , unistr('\5897\7530\0020\79C0\6A39')      , unistr('\5E97\54E1')                     , 7788 , to_date('12-01-83' , 'DD-MM-RR') , 1100 , null , 20);
e (7900 , unistr('\4F50\91CE\0020\82F1\6A39')      , unistr('\5E97\54E1')                     , 7698 , to_date('03-12-81' , 'DD-MM-RR') , 950  , null , 30);
e (7934 , unistr('\77F3\539F\0020\88D5\7F8E')      , unistr('\5E97\54E1')                     , 7782 , to_date('23-01-82' , 'DD-MM-RR') , 1300 , null , 10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'ja', 'Insert Japanese Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839,unistr('\B178\D604\C131'), unistr('\C0AC\C7A5'),null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
e (7698,unistr('\CC28\C218\D601'), unistr('\B9E4\B2C8\C800'),7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
e (7782,unistr('\CC9C\C6D0\C900'), unistr('\B9E4\B2C8\C800'),7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
e (7566,unistr('\D0C1\C11C\C601'), unistr('\B9E4\B2C8\C800'),7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
e (7788,unistr('\B958\B85C\C6B4'), unistr('\BD84\C11D\AC00'),7566,to_date('09-12-82','DD-MM-RR'),3000,null,20);
e (7902,unistr('\C784\CC2C\C6B0'), unistr('\BD84\C11D\AC00'),7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
e (7369,unistr('\B0A8\C7AC\C12D'), unistr('\C0AC\BB34\C6D0'),7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
e (7499,unistr('\B0A8\C131\BAA8'), unistr('\D310\B9E4\C6D0'),7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
e (7521,unistr('\B098\C885\D604'), unistr('\D310\B9E4\C6D0'),7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
e (7654,unistr('\D558\C9C4\C11C'), unistr('\D310\B9E4\C6D0'),7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844,unistr('\C804\D61C\BBF8'), unistr('\D310\B9E4\C6D0'),7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
e (7876,unistr('\B9C8\C9C4\C11C'), unistr('\C0AC\BB34\C6D0'),7788,to_date('12-01-83','DD-MM-RR'),1100,null,20);
e (7900,unistr('\B178\C120\C601'), unistr('\C0AC\BB34\C6D0'),7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
e (7934,unistr('\D0C1\AD11\C218'), unistr('\C0AC\BB34\C6D0'),7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'ko', 'Insert Korean Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839 , 'KOWALSKI', 'PREZES', null , to_date('17-11-81' , 'DD-MM-RR') , 5000 , null , 10);
e (7698 , 'NOWAK', 'KIEROWNIK' , 7839 , to_date('01-05-81' , 'DD-MM-RR') , 2850 , null , 30);
e (7782 , unistr('WI\015ANIEWSKI') , 'KIEROWNIK' , 7839 , to_date('09-06-81' , 'DD-MM-RR') , 2450 , null , 10);
e (7566 , unistr('W\00D3JCIK') , 'KIEROWNIK' , 7839 , to_date('02-04-81' , 'DD-MM-RR') , 2975 , null , 20);
e (7788 , 'KOWALCZYK', 'ANALITYK', 7566 , to_date('09-12-82' , 'DD-MM-RR') , 3000 , null , 20);
e (7902 , unistr('KAMI\0143SKI') , 'ANALITYK', 7566 , to_date('03-12-81' , 'DD-MM-RR') , 3000 , null , 20);
e (7369 , 'LEWANDOWSKI ', unistr('URZ\0118DNIK') , 7902 , to_date('17-12-80' , 'DD-MM-RR') , 800  , null , 20);
e (7499 , unistr('ZIELI\0143SKI') , 'SPRZEDAWCA', 7698 , to_date('20-02-81' , 'DD-MM-RR') , 1600 , 300  , 30);
e (7521 , unistr('SZYMA\0143SKI') , 'SPRZEDAWCA', 7698 , to_date('22-02-81' , 'DD-MM-RR') , 1250 , 500  , 30);
e (7654 , unistr('WO\0179NIAK') , 'SPRZEDAWCA', 7698 , to_date('28-09-81' , 'DD-MM-RR') , 1250 , 1400 , 30);
e (7844 , unistr('D\0104BROWSKI') , 'SPRZEDAWCA', 7698 , to_date('08-09-81' , 'DD-MM-RR') , 1500 , 0    , 30);
e (7876 , unistr('KOZ\0141OWSKI') , unistr('URZ\0118DNIK') , 7788 , to_date('12-01-83' , 'DD-MM-RR') , 1100 , null , 20);
e (7900 , 'JANKOWSKI', unistr('URZ\0118DNIK') , 7698 , to_date('03-12-81' , 'DD-MM-RR') , 950  , null , 30);
e (7934 , 'MAZUR', unistr('URZ\0118DNIK') , 7782 , to_date('23-01-82' , 'DD-MM-RR') , 1300 , null , 10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'pl', 'Insert Polish Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839,unistr('\0418\0432\0430\043D\043E\0432'), unistr('\0413\0435\043D\0435\0440\0430\043B\044C\043D\044B\0439 \0434\0438\0440\0435\043A\0442\043E\0440'),null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
e (7698,unistr('\0412\043E\043B\043A\043E\0432'), unistr('\0420\0443\043A\043E\0432\043E\0434\0438\0442\0435\043B\044C \043E\0442\0434\0435\043B\0430'),7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
e (7782,unistr('\041A\043E\0437\043B\043E\0432'), unistr('\0420\0443\043A\043E\0432\043E\0434\0438\0442\0435\043B\044C \043E\0442\0434\0435\043B\0430'),7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
e (7566,unistr('\041C\0430\043A\0430\0440\043E\0432\0430'), unistr('\0420\0443\043A\043E\0432\043E\0434\0438\0442\0435\043B\044C \043E\0442\0434\0435\043B\0430'),7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
e (7788,unistr('\0421\0435\043C\0451\043D\043E\0432\0430'), unistr('\0421\0438\0441\0442\0435\043C\043D\044B\0439 \0430\0434\043C\0438\043D\0438\0441\0442\0440\0430\0442\043E\0440'),7566,to_date('09-12-82','DD-MM-RR'),3000,null,20);
e (7902,unistr('\0410\043D\0434\0440\0435\0435\0432'), unistr('\0421\0438\0441\0442\0435\043C\043D\044B\0439 \0430\0434\043C\0438\043D\0438\0441\0442\0440\0430\0442\043E\0440'),7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
e (7369,unistr('\0421\043C\0438\0440\043D\043E\0432\0430'), unistr('\0410\0441\0441\0438\0441\0442\0435\043D\0442'),7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
e (7499,unistr('\0411\0435\043B\044F\0435\0432\0430'), unistr('\041C\0435\043D\0435\0434\0436\0435\0440 \043F\043E \043F\0440\043E\0434\0430\0436\0430\043C'),7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
e (7521,unistr('\0427\0435\0440\043D\043E\0432\0430'), unistr('\041C\0435\043D\0435\0434\0436\0435\0440 \043F\043E \043F\0440\043E\0434\0430\0436\0430\043C'),7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
e (7654,unistr('\0423\0442\043A\0438\043D'), unistr('\041C\0435\043D\0435\0434\0436\0435\0440 \043F\043E \043F\0440\043E\0434\0430\0436\0430\043C'),7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844,unistr('\0427\0443\043C\0430\043A\043E\0432'), unistr('\041C\0435\043D\0435\0434\0436\0435\0440 \043F\043E \043F\0440\043E\0434\0430\0436\0430\043C'),7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
e (7876,unistr('\0424\043E\043C\0438\043D'), unistr('\0410\0441\0441\0438\0441\0442\0435\043D\0442'),7788,to_date('12-01-83','DD-MM-RR'),1100,null,20);
e (7900,unistr('\0413\043E\043B\0443\0431\043E\0432\0430'), unistr('\0410\0441\0441\0438\0441\0442\0435\043D\0442'),7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
e (7934,unistr('\0420\043E\0441\0442\043E\0432'), unistr('\0410\0441\0441\0438\0441\0442\0435\043D\0442'),7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'ru', 'Insert Russian Employees', 20, l_clob);

    l_clob :=q'~declare
type t_emp is table of emp%rowtype index by binary_integer;
l_emp t_emp;
procedure e (  p_empno    in number
             , p_ename    in varchar2
             , p_job      in varchar2
             , p_mgr      in varchar2
             , p_hiredate in date
             , p_sal      in number
             , p_comm     in number
             , p_deptno   in number
            ) is
  begin
    l_emp(l_emp.count + 1).empno := p_empno;
    l_emp(l_emp.count).ename      := p_ename;
    l_emp(l_emp.count).job        := p_job;
    l_emp(l_emp.count).mgr        := p_mgr;
    l_emp(l_emp.count).hiredate   := p_hiredate;
    l_emp(l_emp.count).sal        := p_sal;
    l_emp(l_emp.count).comm       := p_comm;
    l_emp(l_emp.count).deptno     := p_deptno;
  end e;
begin
e (7839, unistr('GARC\00CDA'),  'PRESIDENTE',NULL,TO_DATE('17-11-81','DD-MM-RR'),5000,NULL,10);
e (7698, unistr('FERN\00C1NDEZ'), 'GERENTE',7839,TO_DATE('01-05-81','DD-MM-RR'),2850,NULL,30);
e (7782, unistr('GONZ\00C1LEZ'), 'GERENTE',7839,TO_DATE('09-06-81','DD-MM-RR'),2450,NULL,10);
e (7566, unistr('RODR\00CDGUEZ'), 'GERENTE',7839,TO_DATE('02-04-81','DD-MM-RR'),2975,NULL,20);
e (7788, unistr('L\00D3PEZ'), 'ANALISTA',7566,TO_DATE('09-12-82','DD-MM-RR'),3000,NULL,20);
e (7902, unistr('S\00C1NCHEZ'),  'ANALISTA',7566,TO_DATE('03-12-81','DD-MM-RR'),3000,NULL,20);
e (7369, unistr('MART\00CDN'), 'EMPLEADO',7902,TO_DATE('17-12-80','DD-MM-RR'),800,NULL,20);
e (7499, unistr('P\00C9REZ'), 'VENDEDORES',7698,TO_DATE('20-02-81','DD-MM-RR'),1600,300,30);
e (7521, unistr('G\00D3MEZ'),  'VENDEDORES',7698,TO_DATE('22-02-81','DD-MM-RR'),1250,500,30);
e (7654,'ABAR','VENDEDORES',7698,TO_DATE('28-09-81','DD-MM-RR'),1250,1400,30);
e (7844,'ALEJOS','VENDEDORES',7698,TO_DATE('08-09-81','DD-MM-RR'),1500,0,30);
e (7876,'BAZAN', 'EMPLEADO',7788,TO_DATE('12-01-83','DD-MM-RR'),1100,NULL,20);
e (7900,'IGLESIAS', 'EMPLEADO',7698,TO_DATE('03-12-81','DD-MM-RR'),950,NULL,30);
e (7934,'MENDOZA','EMPLEADO',7782,TO_DATE('23-01-82','DD-MM-RR'),1300,NULL,10);
forall i in indices of l_emp
  insert into emp values l_emp(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  2, 'es', 'Insert Spanish Employees', 20, l_clob);

    commit;
end;
/
