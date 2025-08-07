prompt --application/set_environment
set define off verify off feedback off
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>10
,p_default_application_id=>4498
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4498 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4498
--   Name:            Oracle APEX Runtime Messages
--   Exported By:     APEX_240200
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      1
--     Shared Components:
--       Logic:
--       Navigation:
--         Breadcrumbs:            1
--       Security:
--         Authentication:         1
--       User Interface:
--         Templates:
--           Page:                 7
--           Region:              11
--           Label:                7
--           List:                 6
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               6
--           Report:               8
--       PWA:
--       Globalization:
--         Messages:           2,261
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         24.2.0
--   Instance ID:     1000169064607063
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'APEX_240200')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX Runtime Messages')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144690914531753089')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'ar'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'Y'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4498)
,p_populate_roles=>'A'
,p_application_tab_set=>0
,p_logo_type=>'C'
,p_logo=>'<img src="#IMAGE_PREFIX#apex_ui/apexlogo.png" width="282" height="20" alt="&PRODUCT_NAME." />'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'&PRODUCT_NAME. 24.2.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'O:W'
,p_security_scheme=>wwv_flow_imp.id(860535012146524358)
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_version_scn=>2663316
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(4498)
,p_theme_id=>3
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_nav_list_template_options=>'#DEFAULT#'
,p_include_legacy_javascript=>'PRE18:18'
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(728504220438374.4498)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4498)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4498)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4498)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4498)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4498)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4498)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>7007821
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(124389732573989299.4498)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4498)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER',
  'show_coordinates', 'N')).to_clob
,p_version_scn=>7021930
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(285800719532138903.4498)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4498)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4498)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4498)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4498)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4498)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.FLOTLINECHART2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '3',
  'attribute_02', '1.333')).to_clob
,p_version_scn=>1088662545
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(649613204592764515.4498)
,p_name=>' Breadcrumb'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page/apex_5_0_wizard_dialog
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(850359229090693491.4498)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.ar'
,p_internal_name=>'APEX_5.0_WIZARD_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.builder.initWizardModal();',
'apex.builder.initWizardProgressBar();'))
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE.">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<meta charset="utf-8">  ',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'<meta name="viewport" content="width=device-width,initial-scale=1" />',
'</head>',
'<body class="a-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Dialog a-Dialog--wizard">',
'  <div class="a-Dialog-wrap">',
'    <div class=" a-Dialog-wizardSteps">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="a-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="a-Dialog-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_success_msg" role="region" aria-labelledby="page_success_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.SUCCESS"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_success_id" class="a-Alert-title">#SUCCESS_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #SUCCESS_MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_success_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_warning_msg" role="region" aria-labelledby="page_warning_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.WARNING"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_warning_id" class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_warning_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--danger a-Alert--defaultIcons a-Alert--inlineDialog a-Alert--wizard margin-none padding-none">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header u-vh">',
'        <h2 class="a-Alert-title">&APP_TEXT$ERROR!HTML.</h2>',
'      </div>',
'      <div class="a-Alert-body">',
'        <p>#MESSAGE# #ADDITIONAL_INFO#</p>',
'        <p><a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a></p>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    <div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>        '))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,baseDialogClass:''a-Dialog--wizard'',dialogClass:#DIALOG_CSS_CLASSES#,jsDialogClass:true,#DIALOG_A'
||'TTRIBUTES#},#PAGE_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'800'
,p_dialog_max_width=>'1200'
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526110820992194.4498)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4498)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4498)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4498)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4498)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4498)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/apex_5_0_dialog
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(851037359784626333.4498)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.ar'
,p_internal_name=>'APEX_5.0_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.builder.initWizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE.">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<meta charset="UTF-8" />',
'<title>#TITLE#</title>',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'</head>',
'<body class="a-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="a-Dialog-wrap">',
'    <div class=" a-Dialog-wizardSteps">',
'      #REGION_POSITION_01#',
'    </div>',
'    <div class="a-Dialog-body">',
'      #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'      #BODY#',
'    </div>',
'    <div class="a-Dialog-footer">',
'      #REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_success_msg" role="region" aria-labelledby="page_success_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.SUCCESS"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_success_id" class="a-Alert-title">#SUCCESS_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #SUCCESS_MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_success_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_warning_msg" role="region" aria-labelledby="page_warning_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.WARNING"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_warning_id" class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_warning_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--danger a-Alert--defaultIcons a-Alert--inlineDialog a-Alert--wizard margin-none padding-none">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header u-vh">',
'        <h2 class="a-Alert-title">&APP_TEXT$ERROR!HTML.</h2>',
'      </div>',
'      <div class="a-Alert-body">',
'        <p>#MESSAGE# #ADDITIONAL_INFO#</p>',
'        <p><a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a></p>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    <div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>        '))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,baseDialogClass:''a-Dialog--uiDialog'',dialogClass:#DIALOG_CSS_CLASSES#,jsDialogClass:true,#DIALOG'
||'_ATTRIBUTES#},#PAGE_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'800'
,p_dialog_max_width=>'1200'
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473352245977306.4498)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4498)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4498)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4498)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4498)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4498)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/apex_5_0_edit_screen
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.ar'
,p_internal_name=>'APEX_5.0_EDIT_SCREEN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.builder.initStickyHeader(''a_EditScreen_header'');'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE.">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<meta charset="UTF-8" />',
'<title>#TITLE#</title>',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>',
'<!--[if lte IE 9]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'<a href="#main" id="a_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<header>',
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'</header>',
'#REGION_POSITION_09#',
'  <div class="a-Body">',
'    <main id="main" class="a-Main">',
'      #REGION_POSITION_02#',
'      <div class="a-EditScreen">',
'        <div class="a-EditScreen-header" id="a_EditScreen_header">',
'          #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'          #REGION_POSITION_04#',
'        </div>',
'        <div class="a-EditScreen-body">',
'          #BODY#',
'        </div>',
'      </div>',
'    </main>',
'    <aside class="a-Side">',
'        #REGION_POSITION_03#',
'        #REGION_POSITION_05#',
'    </aside>',
'  </div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<footer class="a-Footer">',
'  <div class="a-Footer-info">',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-user" title="&MSG_USER." aria-label="&MSG_USER.">',
'        <span class="u-vh">&MSG_USER.</span>',
'      </span>',
'      &USER.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-workspace" title="&MSG_WORKSPACE." aria-label="&MSG_WORKSPACE.">',
'        <span class="u-vh">&MSG_WORKSPACE.</span>',
'      </span>',
'      &COMPANY.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-language" title="&MSG_LANGUAGE." aria-label="&MSG_LANGUAGE.">',
'        <span class="u-vh">&MSG_LANGUAGE.</span>',
'      </span>',
'      &BROWSER_LANGUAGE.',
'    </span>',
'  </div>',
'  <div class="a-Footer-copyright">&MSG_COPYRIGHT.</div>',
'  <div class="a-Footer-version">#FLOW_VERSION#</div>',
'</footer>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_success_msg" role="region" aria-labelledby="page_success_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.SUCCESS"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_success_id" class="a-Alert-title">#SUCCESS_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #SUCCESS_MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_success_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_warning_msg" role="region" aria-labelledby="page_warning_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.WARNING"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_warning_id" class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_warning_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_09'
,p_theme_class_id=>1
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>'))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2495515088702127.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4498)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4498)
,p_name=>'Control Bar'
,p_placeholder=>'REGION_POSITION_09'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/apex_5_0_no_side_bar
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.ar'
,p_internal_name=>'APEX_5.0_NO_SIDE_BAR'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE.">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<meta charset="UTF-8" />',
'<title>#TITLE#</title>',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>',
'<!--[if lte IE 9]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'<a href="#main" id="a_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<header>',
'    #REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'</header>',
'#REGION_POSITION_09#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'#REGION_POSITION_02#',
'#REGION_POSITION_03#',
'  <div id="main" class="a-Body">',
'    <main class="a-Main">',
'        #BODY#',
'    </main>',
'  </div>',
'#REGION_POSITION_04#'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<footer class="a-Footer">',
'  <div class="a-Footer-info">',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-user" title="&MSG_USER." aria-label="&MSG_USER."><span class="u-vh">&MSG_USER.</span></span>',
'      &USER.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-workspace" title=''&"APP_TEXT$APEXDEV.TEMPLATE_WORKSPACE"!HTML.'' aria-label=''&"APP_TEXT$APEXDEV.TEMPLATE_WORKSPACE"!HTML.''><span class="u-vh">&MSG_WORKSPACE.</span></span>',
'      &COMPANY.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-language" title="&MSG_LANGUAGE." aria-label="&MSG_LANGUAGE."><span class="u-vh">&MSG_LANGUAGE.</span></span>',
'      &BROWSER_LANGUAGE.',
'    </span>',
'  </div>',
'  <div class="a-Footer-copyright">&MSG_COPYRIGHT.</div>',
'  <div class="a-Footer-version">#FLOW_VERSION#</div>',
'</footer>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_success_msg" role="region" aria-labelledby="page_success_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.SUCCESS"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_success_id" class="a-Alert-title">#SUCCESS_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #SUCCESS_MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_success_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_warning_msg" role="region" aria-labelledby="page_warning_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.WARNING"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_warning_id" class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_warning_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_09'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--danger a-Alert--wizard a-Alert--defaultIcons">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 class="a-Alert-title">#MESSAGE#</h2>',
'      </div>',
'      <div class="a-Alert-body">',
'        #ADDITIONAL_INFO#',
'        #TECHNICAL_INFO#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--large a-Button--hot" onclick="#BACK_LINK#" type="button">#RETURN_TO_APPLICATION#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>'))
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2418665544706094.4498)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4498)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4498)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4498)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4498)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4498)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4498)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4498)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4498)
,p_name=>'Control Bar'
,p_placeholder=>'REGION_POSITION_09'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/apex_5_0_right_side_bar
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.ar'
,p_internal_name=>'APEX_5.0_RIGHT_SIDE_BAR'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE.">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<meta charset="UTF-8" />',
'<title>#TITLE#</title>',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'</head>',
'<body class="#PAGE_CSS_CLASSES#" #ONLOAD#>',
'<!--[if lte IE 9]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'<noscript>&MSG_JSCRIPT.</noscript>',
'<a href="#main" id="a_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<header>',
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'</header>',
'#REGION_POSITION_09#',
'#REGION_POSITION_02#',
'  <div id="main" class="a-Body">',
'    <main class="a-Main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'    </main>',
'    <aside class="a-Side">',
'        #REGION_POSITION_03#',
'    </aside>',
'  </div>',
'#REGION_POSITION_04#'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<footer class="a-Footer">',
'  <div class="a-Footer-info">',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-user" title="&MSG_USER." aria-label="&MSG_USER."></span>',
'      &USER.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-workspace" title="&MSG_WORKSPACE." aria-label="&MSG_WORKSPACE."></span>',
'      &COMPANY.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-language" title="&MSG_LANGUAGE." aria-label="&MSG_LANGUAGE."></span>',
'      &BROWSER_LANGUAGE.',
'    </span>',
'  </div>',
'  <div class="a-Footer-copyright">&MSG_COPYRIGHT.</div>',
'  <div class="a-Footer-version">#FLOW_VERSION#</div>',
'</footer>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--success a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_success_msg" role="region" aria-labelledby="page_success_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.SUCCESS"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_success_id" class="a-Alert-title">#SUCCESS_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #SUCCESS_MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_success_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--warning a-Alert--horizontal a-Alert--defaultIcons a-Alert--colorBG a-Alert--page" id="page_warning_msg" role="region" aria-labelledby="page_warning_id">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.WARNING"!HTML.''></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="page_warning_id" class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      </div>',
'      <div class="a-Alert-body" role="alert">',
'        #MESSAGE#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI" onclick="$x_Remove(''page_warning_msg'');" value="#CLOSE_NOTIFICATION#" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#"><span class="a-Icon '
||'icon-remove" aria-hidden="true"></span></button>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_09'
,p_theme_class_id=>1
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>'))
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537388880131854.4498)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4498)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4498)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4498)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4498)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4498)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4498)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4498)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4498)
,p_name=>'Control Bar'
,p_placeholder=>'REGION_POSITION_09'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/apex_5_0_sign_up_wizard
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(851041812938626395.4498)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.ar'
,p_internal_name=>'APEX_5.0_SIGN_UP_WIZARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.builder.initWizardProgressBar();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE.">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<meta charset="UTF-8" />',
'<meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'<title>#TITLE#</title>',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'</head>',
'<body class="a-Page--simpleWizard #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<header>',
'#REGION_POSITION_07#',
'</header>',
'#REGION_POSITION_08#',
'#REGION_POSITION_01#',
'#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'#REGION_POSITION_02#',
'#REGION_POSITION_03#',
'<main class="u-Layout u-Layout--centerVertically">',
'  #BODY#',
'</main>',
'#REGION_POSITION_04#'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" id="sucessMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-success">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-check"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h5 class="a-AlertMessages-messageTitle" id="sucessMsg-Message" role="alert">#SUCCESS_MESSAGE#</h5>',
'      <button id="sucessMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#CLOSE_NOTIFICATION#" onclick="$x_Remove(''sucessMsg'');return false;"><span class="a-I'
||'con icon-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" role="alert" id="errorMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-error">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-remove"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h5 class="a-AlertMessages-messageTitle" id="errorMsg-Message">#MESSAGE#</h5>',
'      <button id="errorMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#CLOSE_NOTIFICATION#" onclick="$x_Remove(''errorMsg'');return false;"><span class="a-Ico'
||'n icon-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_08'
,p_theme_class_id=>1
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>'))
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212309210289451.4498)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4498)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4498)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4498)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4498)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4498)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4498)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4498)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4498)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4498)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4498)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4498)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4498)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4498)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/apex_5_0_wizard_page
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.ar'
,p_internal_name=>'APEX_5.0_WIZARD_PAGE'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.builder.initWizardProgressBar();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!doctype html>',
'<html class="no-js page-&APP_PAGE_ID. app-&APP_ID." lang="&BROWSER_LANGUAGE.">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<meta charset="UTF-8" />',
'<title>#TITLE#</title>',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon.ico">',
'<link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-16x16.png">',
'<link rel="icon" sizes="32x32" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-32x32.png">',
'<link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/favicon-180x180.png">',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#HEAD#',
'</head>',
'<body class="a-Page--wizard #PAGE_CSS_CLASSES#" #ONLOAD#>',
'<noscript>&MSG_JSCRIPT.</noscript>',
'#ENVIRONMENT_BANNER#',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<header>',
'#REGION_POSITION_07#',
'#REGION_POSITION_08#',
'</header>',
'#REGION_POSITION_09#',
'<main class="a-Main" id="main">',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="u-Layout u-Layout--centerVertically">',
'    <div class="a-Wizard a-Wizard--default">',
'      #REGION_POSITION_02#',
'      <div class="a-Wizard-controls">#REGION_POSITION_01#</div>',
'      <div class="a-Wizard-body">#BODY#</div>',
'      <div class="a-Wizard-buttons">#REGION_POSITION_03#</div>',
'    </div>',
'  </div>',
'</main>',
'#REGION_POSITION_04#'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<footer class="a-Footer">',
'  <div class="a-Footer-info">',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-user" title="&MSG_USER." aria-label="&MSG_USER."><span class="u-vh">&MSG_USER.</span></span>',
'      &USER.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-workspace" title="&MSG_WORKSPACE." aria-label="&MSG_WORKSPACE."><span class="u-vh">&MSG_WORKSPACE.</span></span>',
'      &COMPANY.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-language" title="&MSG_LANGUAGE." aria-label="&MSG_LANGUAGE."><span class="u-vh">&MSG_LANGUAGE.</span></span>',
'      &BROWSER_LANGUAGE.',
'    </span>',
'  </div>',
'  <div class="a-Footer-copyright">&MSG_COPYRIGHT.</div>',
'  <div class="a-Footer-version">#FLOW_VERSION#</div>',
'</footer>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body></html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" id="sucessMsg">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-success">',
'    <div class="a-MediaBlock-graphic">',
'      <span class="a-Icon a-Icon--medium icon-check"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h5 class="a-AlertMessages-messageTitle" id="sucessMsg-Message" role="alert">#SUCCESS_MESSAGE#</h5>',
'      <button id="sucessMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" title="#CLOSE_NOTIFICATION#" onclick="$x_Remove(''sucessMsg'');return false;"><span class="a-I'
||'con icon-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-AlertMessages a-AlertMessages--page" id="errorMsg" role="region" aria-labelledby="page_warning_id">',
' <div class="a-AlertMessages-item">',
'  <div class="a-MediaBlock a-AlertMessages-message is-error">',
'    <div class="a-MediaBlock-graphic" role="img" aria-label=''&"APP_TEXT$APEXDEV.ICON_LABEL.WARNING"!HTML.''>',
'      <span class="a-Icon a-Icon--medium icon-remove"></span> ',
'    </div>',
'    <div class="a-MediaBlock-content">',
'      <h2 class="u-vh" id="page_warning_id" class="a-Alert-title">#ERROR_MESSAGE_HEADING#</h2>',
'      <div class="a-AlertMessages-messageTitle" id="errorMsg-Message" role="alert">#MESSAGE#</div>',
'      <button id="errorMsg-Close" class="a-Button a-Button--small a-Button--noUI a-Button--noLabel a-Button--withIcon a-Button--alertMessages" type="button" aria-label="#CLOSE_NOTIFICATION#" title="#CLOSE_NOTIFICATION#" onclick="$x_Remove(''errorMsg'')'
||';return false;"><span class="a-Icon icon-remove"></span></button>',
'    </div>',
'  </div>',
' </div>',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="htmldbNavLink">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="2" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_09'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert a-Alert--danger a-Alert--wizard a-Alert--defaultIcons">',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'      </div>',
'      <div class="a-Alert-body">',
'        <h2 class="a-Alert-subTitle">#MESSAGE#</h2>',
'        #ADDITIONAL_INFO#',
'        #TECHNICAL_INFO#',
'      </div>',
'    </div>',
'    <div class="a-Alert-buttons">',
'      <button class="a-Button a-Button--large a-Button--hot" onclick="#BACK_LINK#" type="button">#RETURN_TO_APPLICATION#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>false
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-grid-container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="apex-col apex-col-#COLUMN_SPAN_NUMBER# #ATTRIBUTES#">',
'#CONTENT#',
'</div>'))
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485266589875353.4498)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4498)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4498)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4498)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4498)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4498)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4498)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4498)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4498)
,p_name=>'Control Bar'
,p_placeholder=>'REGION_POSITION_09'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(514381861202541059.4498)
,p_template_name=>'APEX 5.0 - Button'
,p_internal_name=>'APEX_5.0_BUTTON'
,p_template=>'<button onclick="#JAVASCRIPT#" class="a-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="a-Button a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_menu_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(514382190540541061.4498)
,p_template_name=>'APEX 5.0 - Icon Menu Button'
,p_internal_name=>'APEX_5.0_ICON_MENU_BUTTON'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_only_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(514382538845541061.4498)
,p_template_name=>'APEX 5.0 - Icon Only Button'
,p_internal_name=>'APEX_5.0_ICON_ONLY_BUTTON'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CL'
||'ASSES#" aria-hidden="true"></span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button_large
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(620629666890811728.4498)
,p_template_name=>'APEX 5.0 - Button (Large)'
,p_internal_name=>'APEX_5.0_BUTTON_LARGE'
,p_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--large #BUTTON_CSS_CLASSES#" type="button" role="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--large a-Button--hot #BUTTON_CSS_CLASSES#" type="button" role="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button_small
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(620629778318811745.4498)
,p_template_name=>'APEX 5.0 - Button (Small)'
,p_internal_name=>'APEX_5.0_BUTTON_SMALL'
,p_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--small #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--small a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button_with_icon
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(868252865986181054.4498)
,p_template_name=>'APEX 5.0 - Button with Icon'
,p_internal_name=>'APEX_5.0_BUTTON_WITH_ICON'
,p_template=>'<button class="a-Button a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Region #REGION_CSS_CLASSES#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="a-Region-header">',
'    <div class="a-Region-headerItems  a-Region-headerItems--title">',
'      <h2 class="a-Region-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h2>',
'    </div>',
'    <div class="a-Region-headerItems  a-Region-headerItems--buttons">',
'      #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'    </div>',
'  </div>',
'  <div class="a-Region-body">',
'  <div class="a-Region-bodyHeader">#REGION_HEADER#</div>',
'  #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Region'
,p_internal_name=>'APEX_5.0_REGION'
,p_theme_id=>3
,p_theme_class_id=>21
,p_preset_template_options=>'a-Region--noPadding'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_heading'
,p_translate_this_template=>'N'
,p_template_comment=>'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI a-Button--goToTop" onclick="uF();" type="button" title="&TOP."><span class="a-Icon icon-up-chevron"></span></button>'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962385277500935.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4498)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_div_with_id_class_and_region_attributes
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(514343873675436760.4498)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>#PREVIOUS##BODY##NEXT#</div>'
,p_page_plug_template_name=>'[x] APEX 5.0 - Div with ID, Class, and Region Attributes'
,p_internal_name=>'APEX_5.0_DIV_WITH_ID,_CLASS,_AND_REGION_ATTRIBUTES'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585474981747544.4498)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4498)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4498)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4498)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4498)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4498)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_wizard_body_hide_show
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aWizardRegion aWizardRegion--disclosure" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="wizardRegionHeading">',
'    <h2 data-apex-heading>',
'        <button type="button">#TITLE#</button>',
'    </h2>',
'    <div class="buttonContainer">',
'    #EDIT##CLOSE##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT##CREATE##CREATE2#',
'    </div>',
'  </div>',
'  <div class="hideShowRegion" id="#REGION_STATIC_ID#_content">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Wizard Body (Hide/Show)'
,p_internal_name=>'APEX_5.0_WIZARD_BODY_HIDE/SHOW'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$( "##REGION_STATIC_ID#" ).collapsible({',
'    content: $( "##REGION_STATIC_ID#_content" )',
'});'))
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207496127505978.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4498)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_button_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-ButtonRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>',
'  <div class="a-ButtonRegion-wrap">',
'    <div class="a-ButtonRegion-col a-ButtonRegion-col--left"><div class="a-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'    <div class="a-ButtonRegion-col a-ButtonRegion-col--content">',
'      <h2 id="#REGION_STATIC_ID#_TITLE" class="a-ButtonRegion-title" data-apex-heading>#TITLE#</h2>',
'      #BODY#',
'      <div class="a-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="a-ButtonRegion-col a-ButtonRegion-col--right"><div class="a-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Button Region'
,p_internal_name=>'APEX_5.0_BUTTON_REGION'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_template_options=>'a-ButtonRegion--wizard'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2204663592232325.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4498)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_wizard_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(850442966147812557.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Wizard-region a-Form #REGION_CSS_CLASSES#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <h2 id="#REGION_STATIC_ID#_TITLE" class="u-vh" data-apex-heading>#TITLE#</h2>',
'  <div class="a-Wizard-regionHeader">#REGION_HEADER#</div>',
'  <div class="a-Wizard-regionBody">#BODY#</div>',
'  <div class="a-Wizard-regionFooter">#REGION_FOOTER#</div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Wizard Region'
,p_internal_name=>'APEX_5.0_WIZARD_REGION'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3346988371508588.4498)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4498)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_alert
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>',
'  <div class="a-Alert-wrap">',
'    <div class="a-Alert-icon">',
'      <span class="a-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    </div>',
'    <div class="a-Alert-content">',
'      <div class="a-Alert-header">',
'        <h2 id="#REGION_STATIC_ID#_TITLE" class="a-Alert-title" data-apex-heading>#TITLE#</h2>',
'      </div>',
'      <div role="alert" class="a-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="a-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Alert'
,p_internal_name=>'APEX_5.0_ALERT'
,p_theme_id=>3
,p_theme_class_id=>7
,p_default_template_options=>'a-Alert--defaultIcons'
,p_preset_template_options=>'a-Alert--warning:a-Alert--wizard'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526185270486606.4498)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4498)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4498)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4498)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4498)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4498)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_wizard_header
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(914802799655239969.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="wizardHeader" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Wizard Header'
,p_internal_name=>'APEX_5.0_WIZARD_HEADER'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183211858816924.4498)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4498)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_wizard_title_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(914803495164240003.4498)
,p_layout=>'TABLE'
,p_template=>'<div class="#REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><h1 class="a-Wizard-title" data-apex-heading>#TITLE#</h1></div>'
,p_page_plug_template_name=>'[x] APEX 5.0 - Wizard Title Region'
,p_internal_name=>'APEX_5.0_WIZARD_TITLE_REGION'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373447170510516.4498)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4498)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_interactive_report_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="a-IRR-region #REGION_CSS_CLASSES#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>',
'  <h2 id="#REGION_STATIC_ID#_heading" class="u-vh a-Region-header" data-apex-heading>#TITLE#</h2>',
'  #PREVIOUS##BODY##NEXT#',
'</div>',
''))
,p_page_plug_template_name=>'[x] APEX 5.0 - Interactive Report Region'
,p_internal_name=>'APEX_5.0_INTERACTIVE_REPORT_REGION'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_template_options=>'a-IRR-region--responsiveIconView'
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_heading'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2899946654493378.4498)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4498)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4498)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4498)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_hide_show_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Region a-Region--hideShow #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# #REGION_LANDMARK_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="a-Region-header">',
'    <div class="a-Region-headerItems  a-Region-headerItems--controls">',
'        <h2 id="#REGION_STATIC_ID#_TITLE" class="a-Region-title" data-apex-heading>',
'            <button class="a-Region-toggle" type="button">#TITLE#</button>',
'        </h2>',
'    </div>',
'    <div class="a-Region-headerItems  a-Region-headerItems--buttons">',
'      #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'    </div>',
'  </div>',
'  <div class="a-Region-body">',
'  #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Hide + Show Region'
,p_internal_name=>'APEX_5.0_HIDE_+_SHOW_REGION'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_template_options=>'a-Region--flush'
,p_preset_template_options=>'is-expanded'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2695578355491332.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4498)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_processing_spinner_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(1274355059486017828.4498)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-ProcessingRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <span class="u-Processing"><span class="u-Processing-spinner"></span></span>',
'  <div class="a-ProcessingRegion-title">#TITLE#</div>',
'  <div class="a-ProcessingRegion-body">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Processing Spinner Region'
,p_internal_name=>'APEX_5.0_PROCESSING_SPINNER_REGION'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61232728057733462.4498)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4498)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4498)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4498)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_navigation_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(514332014414430986.4498)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'APEX 5.0 - Navigation List'
,p_internal_name=>'APEX_5.0_NAVIGATION_LIST'
,p_theme_id=>3
,p_theme_class_id=>7
,p_list_template_before_rows=>'<ul>'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_sub_list_item_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>',
''))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>',
''))
,p_sub_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>',
''))
,p_sub_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>',
''))
,p_a06_label=>'Link Target'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_menu_popup
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(514332292784430987.4498)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'APEX 5.0 - Menu Popup'
,p_internal_name=>'APEX_5.0_MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup(e);',
'}',
'e.menu({ slide: e.hasClass("js-slide")});',
''))
,p_theme_id=>3
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a06_label=>'Target'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_image_navigation
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(860563697365629462.4498)
,p_list_template_current=>'<li class="a-ImageNav-item"><button type="button" data-link="#LINK#" class="a-ImageNav-link launch-aut #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></button></li>'
,p_list_template_noncurrent=>'<li class="a-ImageNav-item"><a href="#LINK#" class="a-ImageNav-link #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></a></li>'
,p_list_template_name=>'APEX 5.0 - Image Navigation'
,p_internal_name=>'APEX_5.0_IMAGE_NAVIGATION'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<ul class="a-ImageNav #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td style="width: 20%">',
'	<a href="#LINK#" class="iconContainer" title="#TEXT_ESC_SC#">',
'		<span class="largeIcon"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></span>',
'		<span class="iconLabel">#TEXT#</span>',
'	</a>',
'</td>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_wizard_progress
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(865273508717512144.4498)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-WizardSteps-step is-active" aria-current="step">',
'  <div class="a-WizardSteps-wrap">',
'    <span class="a-WizardSteps-marker" aria-hidden="true"><span class="a-Icon icon-wizard-step-complete"></span></span>',
'    <span class="a-WizardSteps-label">#TEXT#</span>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-WizardSteps-step is-inactive">',
'  <div class="a-WizardSteps-wrap">',
'    <span class="a-WizardSteps-marker" aria-hidden="true"><span class="a-Icon icon-wizard-step-complete"></span></span>',
'    <span class="a-WizardSteps-label">#TEXT#</span>',
'  </div>',
'</li>',
''))
,p_list_template_name=>'APEX 5.0 - Wizard Progress'
,p_internal_name=>'APEX_5.0_WIZARD_PROGRESS'
,p_theme_id=>3
,p_theme_class_id=>17
,p_default_template_options=>'a-WizardSteps--slim'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul aria-label="#CURRENT_PROGRESS#" class="a-WizardSteps #COMPONENT_CSS_CLASSES#">',
''))
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_media_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-MediaList-item is-active">',
'    <div class="a-MediaList-link">',
'        <div class="a-MediaList-iconWrap">',
'            <span class="a-MediaList-icon" aria-hidden="true"><span class="a-Icon #IMAGE#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="a-MediaList-body">',
'            <h3 class="a-MediaList-title" aria-describedby="description_#LIST_ITEM_ID#"><a href="#LINK#" aria-current="page" #A03#>#TEXT#</a></h3>',
'            <p id="description_#LIST_ITEM_ID#" class="a-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="a-MediaList-badgeWrap">',
'            <span class="a-MediaList-badge">#A02#</span>',
'        </div>',
'    </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-MediaList-item">',
'    <div class="a-MediaList-link">',
'        <div class="a-MediaList-iconWrap">',
'            <span class="a-MediaList-icon" aria-hidden="true"><span class="a-Icon #IMAGE#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="a-MediaList-body">',
'            <h3 class="a-MediaList-title" aria-describedby="description_#LIST_ITEM_ID#"><a href="#LINK#" #A03#>#TEXT#</a></h3>',
'            <p id="description_#LIST_ITEM_ID#" class="a-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="a-MediaList-badgeWrap">',
'            <span class="a-MediaList-badge">#A02#</span>',
'        </div>',
'    </div>',
'</li>'))
,p_list_template_name=>'[x] APEX 5.0 - Media List'
,p_internal_name=>'APEX_5.0_MEDIA_LIST'
,p_theme_id=>3
,p_theme_class_id=>9
,p_default_template_options=>'a-MediaList--noBadge'
,p_list_template_before_rows=>'<ul class="a-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_links_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(914818080687341593.4498)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-LinksList-item is-current #A03#" aria-current="page">',
'  <a href="#LINK#" class="a-LinksList-link" #A02#>',
'    <span class="a-LinksList-icon" aria-hidden="true"><span class="t-Icon #IMAGE#"></span></span>',
'    <span class="a-LinksList-label">#TEXT#</span>',
'    <span class="u-vh">&nbsp;</span>',
'    <span class="a-LinksList-badge">#A01#</span>',
'    <span class="a-LinksList-arrow" aria-hidden="true"></span>',
'  </a>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-LinksList-item #A03#">',
'  <a href="#LINK#" class="a-LinksList-link" #A02#>',
'    <span class="a-LinksList-icon" aria-hidden="true"><span class="t-Icon #IMAGE#"></span></span>',
'    <span class="a-LinksList-label">#TEXT#</span>',
'    <span class="u-vh">&nbsp;</span>',
'    <span class="a-LinksList-badge">#A01#</span>',
'    <span class="a-LinksList-arrow" aria-hidden="true"></span>',
'  </a>',
'</li>',
''))
,p_list_template_name=>'[x] APEX 5.0 - Links List'
,p_internal_name=>'APEX_5.0_LINKS_LIST'
,p_theme_id=>3
,p_theme_class_id=>1
,p_default_template_options=>'a-LinksList--showArrow'
,p_list_template_before_rows=>'<ul class="a-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-LinksList-item is-current #A03#" aria-current="page">',
'  <a href="#LINK#" class="a-LinksList-link" #A02#>',
'    <span class="a-LinksList-icon" aria-hidden="true"><span class="t-Icon #IMAGE#"></span></span>',
'    <span class="a-LinksList-label">#TEXT#</span>',
'    <span class="a-LinksList-badge">#A01#</span>',
'    <span class="a-LinksList-arrow" aria-hidden="true"></span>',
'  </a>',
'</li>'))
,p_sub_list_item_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-LinksList-item #A03#">',
'  <a href="#LINK#" class="a-LinksList-link" #A02#>',
'    <span class="a-LinksList-icon" aria-hidden="true"><span class="t-Icon #IMAGE#"></span></span>',
'    <span class="a-LinksList-label">#TEXT#</span>',
'    <span class="a-LinksList-badge">#A01#</span>',
'    <span class="a-LinksList-arrow" aria-hidden="true"></span>',
'  </a>',
'</li>'))
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-LinksList-item is-current is-expanded #A03#" aria-current="page">',
'  <a href="#LINK#" class="a-LinksList-link" #A02#>',
'    <span class="a-LinksList-icon" aria-hidden="true"><span class="t-Icon #IMAGE#"></span></span>',
'    <span class="a-LinksList-label">#TEXT#</span>',
'    <span class="u-vh">&nbsp;</span>',
'    <span class="a-LinksList-badge">#A01#</span>',
'    <span class="a-LinksList-arrow" aria-hidden="true"></span>',
'  </a>',
'  #SUB_LISTS#',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-LinksList-item #A03#">',
'  <a href="#LINK#" class="a-LinksList-link" #A02#>',
'    <span class="a-LinksList-icon" aria-hidden="true"><span class="t-Icon #IMAGE#"></span></span>',
'    <span class="a-LinksList-label">#TEXT#</span>',
'    <span class="u-vh">&nbsp;</span>',
'    <span class="a-LinksList-badge">#A01#</span>',
'    <span class="a-LinksList-arrow" aria-hidden="true"></span>',
'  </a>',
'  #SUB_LISTS#',
'</li>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_badge_list_named_column
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_row_template_name=>'APEX 5.0 - Badge List (Named Column)'
,p_internal_name=>'APEX_5.0_BADGE_LIST_NAMED_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-BadgeList-item #A01#">',
'  <span class="a-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="a-BadgeList-value">#COLUMN_VALUE#</span>',
'</li>',
''))
,p_row_template_before_rows=>'<ul class="a-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>0
,p_preset_template_options=>'a-BadgeList--fixed:a-BadgeList--large'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_badge_list_row
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(851054516889639461.4498)
,p_row_template_name=>'APEX 5.0 - Badge List (Row)'
,p_internal_name=>'APEX_5.0_BADGE_LIST_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-label">#1#</span>',
'  <span class="t-BadgeList-value">#2#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>6
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_links_list
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(851055225644639463.4498)
,p_row_template_name=>'APEX 5.0 - Links List'
,p_internal_name=>'APEX_5.0_LINKS_LIST'
,p_row_template1=>'<li class="a-LinksList-item">#COLUMN_VALUE#</li>'
,p_row_template_before_rows=>'<ul class="a-LinksList a-LinksList--report #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES#>'
,p_row_template_after_rows=>'</ul>'
,p_row_template_before_first=>'OMIT'
,p_row_template_after_last=>'OMIT'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'OMIT'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_template_options=>'a-LinksList--nowrap:a-LinksList--showArrow'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_standard_report
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(851056531929639482.4498)
,p_row_template_name=>'APEX 5.0 - Standard Report'
,p_internal_name=>'APEX_5.0_STANDARD_REPORT'
,p_row_template1=>'<td class="a-Report-cell" #ALIGNMENT# #ACCESSIBLE_HEADERS# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="a-Report-wrap">',
'    <table class="a-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="a-Report-tableWrap">',
'    <table class="a-Report-report" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="a-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="a-Report-pagination a-Report-pagination a-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="a-Report-colHead" #ALIGNMENT# #ARIA_SORT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>'</thead><tbody>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="a-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>3
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_portlet_column_template
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(914792024808213039.4498)
,p_row_template_name=>'APEX 5.0 - Portlet  Column Template'
,p_internal_name=>'APEX_5.0_PORTLET_COLUMN_TEMPLATE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-AVPList-item">',
'  <span class="a-AVPList-label">#COLUMN_HEADER#</span>',
'  <span class="a-AVPList-value">#COLUMN_VALUE#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="a-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_ID#_report">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>0
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_portlet_row_template
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(914792322768213043.4498)
,p_row_template_name=>'APEX 5.0 - Portlet Row Template'
,p_internal_name=>'APEX_5.0_PORTLET_ROW_TEMPLATE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-AVPList-item">',
'  <span class="a-AVPList-label">#1#</span>',
'  <span class="a-AVPList-value">#2#</span>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="a-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_ID#_report">',
''))
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>3
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_one_column_unordered_list
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(915377874236666939.4498)
,p_row_template_name=>'APEX 5.0 - One Column Unordered List'
,p_internal_name=>'APEX_5.0_ONE_COLUMN_UNORDERED_LIST'
,p_row_template1=>'<td class="a-Report-cell" #ALIGNMENT# #ACCESSIBLE_HEADERS# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="a-Report-wrap">',
'    <table class="a-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="a-Report-tableWrap">',
'    <table class="a-Report-report" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="a-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="a-Report-pagination a-Report-pagination a-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_after_column_heading=>'<tbody>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="a-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="a-Report-paginationLink">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>3
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_app_cards_report
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(1041941432531249038.4498)
,p_row_template_name=>'APEX 5.0 - App Cards Report'
,p_internal_name=>'APEX_5.0_APP_CARDS_REPORT'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-AppCards-item #ID#">',
'  <div class="a-AppCards-itemContainer">',
'    <div class="a-AppCards-iconContainer">',
'      <span class="a-AppCards-icon #ICON_CLASS#"></span>',
'    </div>',
'    <div class="a-AppCards-contentContainer" id="#ID#_name">',
'      <h2 class="a-AppCards-name">#APP_NAME#</h2>',
'      <div class="a-AppCards-info">#APP_INFO#</div>',
'    </div>',
'    <div class="a-AppCards-actionsContainer">',
'        #MODIFY_APP_BUTTON#',
'        #RUN_APP_BUTTON#',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="a-AppCards-item #ID#">',
'  <div class="a-AppCards-itemContainer">',
'    <a href="#CARD_LINK#" class="a-AppCards-link">',
'      <div class="a-AppCards-iconContainer">',
'        <span class="a-AppCards-icon #ICON_CLASS#"></span>',
'      </div>',
'      <div class="a-AppCards-contentContainer" id="#ID#_name">',
'        <h2 class="a-AppCards-name">#APP_NAME#</h2>',
'        <div class="a-AppCards-info">#APP_INFO#</div>',
'      </div>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition2=>':CARD_LINK is not null'
,p_row_template_before_rows=>'<ul class="a-AppCards #COMPONENT_CSS_CLASSES#">'
,p_row_template_after_rows=>'</ul>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>3
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_dynamic_attribute
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(850683711614406253.4498)
,p_template_name=>'APEX 5.0 - Dynamic Attribute'
,p_internal_name=>'APEX_5.0_DYNAMIC_ATTRIBUTE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'  <span class="a-Form-required"><span class="a-Icon icon-asterisk"></span></span><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-dynamicItemHelp" data-itemname="#CURRENT_ITEM_NAME#" data-appid="&FB_FLOW_ID." title="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help"></span><span cl'
||'ass="u-VisuallyHidden">#CURRENT_ITEM_HELP_LABEL#</span></button>#ERROR_TEMPLATE#</div>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_template_comment=>'<label for="#CURRENT_ITEM_NAME#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(851047536471633848.4498)
,p_template_name=>'APEX 5.0 - Optional Label'
,p_internal_name=>'APEX_5.0_OPTIONAL_LABEL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label_above
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(851047676005633854.4498)
,p_template_name=>'APEX 5.0 - Optional Label (Above)'
,p_internal_name=>'APEX_5.0_OPTIONAL_LABEL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer a-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_on_error_after_label=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_required_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(851047684809633856.4498)
,p_template_name=>'APEX 5.0 - Required Label'
,p_internal_name=>'APEX_5.0_REQUIRED_LABEL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'  <span class="a-Form-required"><span class="a-Icon icon-asterisk"></span></span><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_required_label_above
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(851047795461633856.4498)
,p_template_name=>'APEX 5.0 - Required Label (Above)'
,p_internal_name=>'APEX_5.0_REQUIRED_LABEL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer">',
'  <span class="a-Form-required"><span class="a-Icon icon-asterisk"></span></span><label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' </label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer a-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_error_template=>'<span class="a-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden_label_read_by_screen_reader
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(860542631889572088.4498)
,p_template_name=>'Hidden label, read by screen reader'
,p_internal_name=>'HIDDEN_LABEL,_READ_BY_SCREEN_READER'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999" class="hideMeButHearMe">'
,p_template_body2=>'</label>'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#'
,p_theme_id=>3
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_hidden_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(1321751941832424103.4498)
,p_template_name=>'APEX 5.0 - Hidden Label'
,p_internal_name=>'APEX_5.0_HIDDEN_LABEL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Form-labelContainer a-Form-labelContainer--visuallyhidden">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="a-Form-label visuallyhidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="a-Form-fieldContainer #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_before_element=>'<div class="a-Form-inputContainer">'
,p_after_element=>'#HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="a-Button a-Button--noUI a-Button--helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#"  aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidde'
||'n="true"></span></button>'
,p_theme_id=>3
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/apex_5_0_breadcrumbs
begin
wwv_flow_imp_shared.create_menu_template(
 p_id=>wwv_flow_imp.id(514333590213433126.4498)
,p_name=>'APEX 5.0 - Breadcrumbs'
,p_internal_name=>'APEX_5.0_BREADCRUMBS'
,p_before_first=>'<ul class="a-Breadcrumb">'
,p_current_page_option=>'<li class="a-Breadcrumb-item a-Breadcrumb-item is-active" aria-current="page"><span class="a-Breadcrumb-label">#NAME#</span></li>'
,p_non_current_page_option=>'<li class="a-Breadcrumb-item"><a href="#LINK#" class="a-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>8
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_imp_shared.create_popup_lov_template(
 p_id=>wwv_flow_imp.id(649611704621764507.4498)
,p_page_name=>'winlov'
,p_page_title=>unistr('\0645\0631\0628\0639 \062D\0648\0627\0631 \0627\0644\0628\062D\062B')
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#APEX_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'<link rel="stylesheet" href="#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css?v=#APEX_VERSION#" type="text/css"/>',
'<link rel="stylesheet" href="#IMAGE_PREFIX#apex_ui/css/Theme-Standard#MIN#.css?v=#APEX_VERSION#" type="text/css"/>',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="a-Page a-Page--popupLOV"'
,p_before_field_text=>'<div class="a-PopupLOV-actions a-Form--large">'
,p_filter_width=>'15'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="a-Form-field a-Form-searchField"'
,p_find_button_text=>unistr('\0628\062D\062B')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>unistr('\0625\063A\0644\0627\0642')
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>unistr('\0627\0644\062A\0627\0644\064A &gt;')
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>unistr('&lt; \0627\0644\0633\0627\0628\0642')
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>unistr('<div class="a-PopupLOV-pagination">\0627\0644\0635\0641 (\0627\0644\0635\0641\0648\0641) #FIRST_ROW# - #LAST_ROW#</div>')
,p_result_rows_per_pg=>200
,p_before_result_set=>'<div class="a-PopupLOV-links">'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/default_calander
begin
wwv_flow_imp_shared.create_calendar_template(
 p_id=>wwv_flow_imp.id(649611609668764506.4498)
,p_cal_template_name=>'Default Calander'
,p_internal_name=>'DEFAULT_CALANDER'
,p_day_of_week_format=>'<th scope="col" width="14%" class="htmldbDayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="htmldbCalendarHolder" cellpadding="0" cellspacing="0" border="0" width="100%" summary="" role="presentation"><tr>',
'<td class="htmldbMonthTitle">#IMONTH# #YYYY#</td>',
'</tr>',
'<tr><td>'))
,p_month_open_format=>'<table class="htmldbCalendar" cellpadding="0" cellspacing="3" border="0" width="100%" summary="#CALENDAR_TITLE# #IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td></tr></table>',
'',
''))
,p_day_title_format=>'<div class="htmldbDayTitle">#DD#</div>'
,p_day_open_format=>'<td class="htmldbDay">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="htmldbToday">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="htmldbWeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td class="htmldbWeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="htmldbNonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="htmldbNonDay">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr>'
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>3
,p_theme_class_id=>1
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(182005134783173294.4498)
,p_theme_id=>3
,p_name=>'DARK'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css',
'#IMAGE_PREFIX#apex_ui/css/Theme-Dark#MIN#.css'))
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(666074212329754757.4498)
,p_theme_id=>3
,p_name=>'STANDARD_AUTO'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css',
'#IMAGE_PREFIX#apex_ui/css/Theme-Standard#MIN#.css'))
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(666074525535755551.4498)
,p_theme_id=>3
,p_name=>'DARK_AUTO'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css',
'#IMAGE_PREFIX#apex_ui/css/Theme-Dark#MIN#.css'))
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(717250289307903026.4498)
,p_theme_id=>3
,p_name=>'STANDARD'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#apex_ui/css/Core#MIN#.css',
'#IMAGE_PREFIX#apex_ui/css/Theme-Standard#MIN#.css'))
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(2336377640986141.4498)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4498)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4498)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4498)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4498)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4498)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4498)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4498)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4498)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4498)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4498)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4498)
,p_theme_id=>3
,p_name=>'FORM_LABEL_ALIGNMENT'
,p_display_name=>'Form Label Alignment'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Set Form Alignment for Grid Based forms'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114830529058024.4498)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4498)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4498)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4498)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4498)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4498)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4498)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4498)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4498)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4498)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4498)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4498)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4498)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4498)
,p_theme_id=>3
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1487577187426769.4498)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4498)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4498)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4498)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4498)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4498)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4498)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4498)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4498)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4498)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4498)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4498)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4498)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4498)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4498)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4498)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4498)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4498)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4498)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4498)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4498)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4498)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4498)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4498)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4498)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4498)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4498)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4498)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4498)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4498)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4498)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4498)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4498)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4498)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4498)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4498)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4498)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4498)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4498)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4498)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4498)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4498)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4498)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4498)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4498)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4498)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4498)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4498)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4498)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4498)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4498)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4498)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4498)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4498)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4498)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4498)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4498)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4498)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4498)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4498)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4498)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4498)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4498)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4498)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4498)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4498)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4498)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4498)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4498)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4498)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4498)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4498)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4498)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4498)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4498)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4498)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4498)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4498)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4498)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4498)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4498)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4498)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4498)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4498)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4498)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4498)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4498)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4498)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4498)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4498)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4498)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4498)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4498)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4498)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4498)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4498)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4498)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4498)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4498)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4498)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4498)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4498)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4498)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4498)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4498)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4498)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4498)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4498)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4498)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4498)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4498)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4498)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4498)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4498)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4498)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4498)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4498)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4498)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4498)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4498)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4498)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4498)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4498)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4498)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4498)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4498)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4498)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4498)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4498)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4498)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4498)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4498)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4498)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4498)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4498)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4498)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4498)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4498)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4498)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4498)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4498)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4498)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4498)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4498)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4498)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4498)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4498)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4498)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4498)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4498)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4498)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4498)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4498)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4498)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4498)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4498)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4498)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4498)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4498)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4498)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4498)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4498)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4498)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4498)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4498)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4498)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4498)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4498)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4498)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4498)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4498)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4498)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4498)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4498)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4498)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4498)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4498)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4498)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4498)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4498)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4498)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4498)
,p_template_types=>'REGION'
);
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077653124750706)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F %0')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062295699750702)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0633\0624\0648\0644')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062125075750702)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\0645\0633\062A\062E\062F\0645')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124875828750721)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0631\0641\0636 \0627\0644\0648\0635\0648\0644')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081758280750708)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0643\0648\064A\0646 \062D\0633\0627\0628 %0 \0627\0644\062E\0627\0635 \0628\0643.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064944382750702)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\0633\0627\0628 \0645\0642\0641\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049454785750698)
,p_name=>'AM_PM'
,p_message_language=>'ar'
,p_message_text=>'AM / PM'
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032294669750693)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0631\062A\0628\0627\0637 \0627\0644\0625\062C\0631\0627\0621')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032135834750693)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0631\062A\0628\0627\0637 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196593236750743)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631/\0625\062E\0641\0627\0621 %0')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204338021750746)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'ar'
,p_message_text=>unistr('(\0646\0634\0637)')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009166058750686)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0645\0633\062D \0627\0644\0645\062D\0627\062F\062B\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009020589750686)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D \0627\0644\0645\062D\0627\062F\062B\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005628194750685)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0628\0648\0644')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005712755750685)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0641\0636')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005420053750685)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0627\0631\064A\062E \0627\0644\0645\062D\0627\062F\062B\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008890234750686)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0633\0648\062E')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008998731750686)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0646\0633\062E \0625\0644\0649 \0627\0644\062D\0627\0641\0638\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008680231750686)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\062E')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008729450750686)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\062E \0625\0644\0649 \0627\0644\062D\0627\0641\0638\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006106714750685)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\0627\0639\062F')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006508123750685)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0639\0637\064A\0644 \0627\0644\0630\0643\0627\0621 \0627\0644\0627\0635\0637\0646\0627\0639\064A \0639\0644\0649 \0645\0633\062A\0648\0649 \0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644 \0623\0648 \0627\0644\0645\062B\064A\0644.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045801669750697)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \062E\062F\0645\0629 \0627\0644\0630\0643\0627\0621 \0627\0644\0627\0635\0637\0646\0627\0639\064A \0627\0644\0645\0628\062A\0643\0631 \0628\0627\0644\0645\0639\0631\0641 \0627\0644\0645\062D\062F\062F \0623\0648 \0627\0644\0645\0639\0631\0641 \0627\0644\062B\0627\0628\062A.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044523750750696)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0627\0644\062A\0635\062F\064A\0642 \0623\0648 \0648\0635\0648\0644 \0645\062D\0638\0648\0631 (HTTP-%1) \0644\0639\0646\0648\0627\0646 URL %0. \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \062A\0643\0648\064A\0646 \062E\062F\0645\0629 \0627\0644\0630\0643\0627\0621 \0627\0644\0627\0635\0637\0646\0627\0639\064A \0627\0644\0645\0628\062A\0643\0631 %2.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024354434750690)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \0637\0644\0628 HTTP \0625\0644\0649 \062E\062F\0645\0629 Geneative AI Service \0639\0646\062F %0 \0628\0627\0633\062A\062E\062F\0627\0645 HTTP-%1: %2')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048738332750697)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0641\064A \0637\0644\0628 HTTP \0644\062E\062F\0645\0629 \0627\0644\0630\0643\0627\0621 \0627\0644\0627\0635\0637\0646\0627\0639\064A \0627\0644\0645\0628\062A\0643\0631 \0644\0644\0623\062F\0627\0629 \0627\0644\0625\0636\0627\0641\064A\0629 %0 \0641\064A \0627\0644\0648\0636\0639 %1. \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \062A\0643\0648\064A\0646 \062E\062F\0645\0629 \0627\0644\0630\0643\0627\0621 \0627\0644\0627\0635\0637\0646\0627\0639\064A \0627\0644\0645\0628\062A\0643\0631.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011555614750686)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0645\062B\0644\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009906689750686)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\0627\0639\062F')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011309987750686)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009869720750686)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0646\062A')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040526986750695)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062F\0639\0645 \0627\0644\0630\0643\0627\0621 \0627\0644\0627\0635\0637\0646\0627\0639\064A \0627\0644\0645\062A\0628\0643\0631 \0644\0640 OCI \062D\0627\0644\064A\064B\0627 \062A\062C\0631\0628\0629 \0627\0644\062F\0631\062F\0634\0629 \0645\0639 \0631\0633\0627\0626\0644 \0645\062A\0639\062F\062F\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020489972750689)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0627\0644\0645\0648\062C\0647 %0 \0644\0644\062A\0637\0628\064A\0642 %1. \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0645\0627 \0625\0630\0627 \0643\0627\0646 \0645\0646\0634\0626 \0627\0644\062A\0637\0628\064A\0642\0627\062A \0645\062A\0627\062D\064B\0627 \0641\064A \0647\0630\0647 \0627\0644\062D\0627\0644\0629.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025579522750691)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062A\0639\0630\0631 \0645\0639\0627\0644\062C\0629 \0627\0644\0627\0633\062A\062C\0627\0628\0629 \0644\062E\062F\0645\0629 \0627\0644\0630\0643\0627\0621 \0627\0644\0627\0635\0637\0646\0627\0639\064A %0\060C \0627\0644\0627\0633\062A\062C\0627\0628\0629 %1')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031754089750692)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644 \0631\0633\0627\0644\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020088463750689)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623 \0641\064A \062E\062F\0645\0629 \0627\0644\0630\0643\0627\0621 \0627\0644\0627\0635\0637\0646\0627\0639\064A \0644\0644\0648\0627\062C\0647\0629 \0627\0644\062E\0644\0641\064A\0629 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005876164750685)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0627\0644\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005923194750685)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0643\062A\0628 \0631\0633\0627\0644\062A\0643 \0647\0646\0627')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009249296750686)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0648\0631\0629 \0627\0644\0631\0645\0632\064A\0629 \0644\0644\0645\0633\062A\062E\062F\0645')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009336037750686)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\062E\062F\0627\0645 \0647\0630\0627')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006041734750685)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\062F\064A\0643 \0631\0633\0627\0644\0629 \0644\0645 \062A\064F\0631\0633\0644\0647\0627\060C \0647\0644 \0623\0646\062A \0645\062A\0623\0643\062F\061F')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175057164750736)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0631\062C\0639 \0627\0633\062A\062F\0639\0627\0621 Ajax \062E\0637\0623 \0627\0644\062E\0627\062F\0645 %0 \0641\064A %1.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102102077750714)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\0648\064A\0644 \0627\0644\0627\0633\0645 \0627\0644\0628\062F\064A\0644 \0644\0644\062A\0637\0628\064A\0642 "%0" \0625\0644\0649 \0645\0639\0631\0641 \062A\0637\0628\064A\0642 \0641\0631\064A\062F.')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090972278750710)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1816 \062E\0637\0623 \063A\064A\0631 \0645\062A\0648\0642\0639 \0623\062B\0646\0627\0621 \062A\062D\0648\064A\0644 \0627\0644\0627\0633\0645 \0627\0644\0628\062F\064A\0644 \0644\0644\062A\0637\0628\064A\0642 p_flow_alias_or_id (%0).')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188338692750741)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\062B\0644 \0627\0644\0645\062C\0645\0648\0639 \0627\0644\0627\062E\062A\0628\0627\0631\064A \0641\064A \0627\0644\062A\0637\0628\064A\0642 \0648\0633\064A\0644\0629 \0628\0633\064A\0637\0629 \0644\062A\062D\062F\064A\062F \0645\0627 \0625\0630\0627 \0643\0627\0646 \0627\0644\062A\0637\0628\064A\0642 \0646\0641\0633\0647 \0645\0648\0632\0639\064B\0627 \0639\0644\0649 \0645\0633\062A\0648\0649 \0645\0633\0627\062D\0627\062A \0627\0644\0639\0645\0644. \0648\064A\0645\0643\0646 \0645\0642\0627\0631\0646\0629 \0647\0630\0627 \0627\0644\0645\062C\0645\0648\0639 \0627\0644\0627\062E\062A\0628\0627\0631\064A \0644\0645\0639\0631\0641\0629 \0645\0627 \0625\0630\0627 \0643\0627\0646 \0647\0646\0627\0643 \0645\062C\0645\0648\0639 \0645\0637\0627\0628\0642 \0644\0647. ')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074992378750706)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \062F\0627\0644\0629 \0627\0644\0645\0635\0627\062F\0642\0629.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056905031750700)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \062F\0627\0644\0629 \0627\0644\0645\0635\0627\062F\0642\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228820543750753)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\0639\0645\064A\0644 %0 \0627\0644\0630\064A \0623\0631\062C\0639\0647 Oracle Cloud Identity Management \063A\064A\0631 \0645\0639\062A\0645\062F \0641\064A \0627\0644\0645\062C\0627\0644%1!<br/>\0627\0644\0631\062C\0627\0621 <a href="&LOGOUT_URL.">\0645\0639\0627\0648\062F\0629 \062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644</a> \0648\062A\062D\062F\064A\062F \0627\0633\0645 \0639\0645\064A\0644 \0645\0639\062A\0645\062F \0623\0648 \062A\063A\064A\064A\0631 \0639\0646\0648\0627\0646 URL.')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053006999750699)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0634\062A\0645\0644 \062D\0633\0627\0628\0643 "%0" \0639\0644\0649 \0627\0645\062A\064A\0627\0632\0627\062A \0627\0644\062A\0637\0648\064A\0631 \0627\0644\0644\0627\0632\0645\0629 (DB_DEVELOPER \0623\0648 DB_ADMINISTRATOR)<br/>\0641\064A \0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644 "%1"! \0627\0644\0631\062C\0627\0621 <a href="&LOGOUT_URL.">\0645\0639\0627\0648\062F\0629 \062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644</a> \0628\0639\062F \0625\062A\0627\062D\0629 \0627\0644\0627\0645\062A\064A\0627\0632\0627\062A.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049696933750698)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\0639\0645\064A\0644 \0627\0644\0630\064A \0623\0631\062C\0639\0647 Oracle Cloud Identity Management \063A\064A\0631 \0645\0639\062A\0645\062F \0641\064A \0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644 \0627\0644\062D\0627\0644\064A\0629!<br/>\0627\0644\0631\062C\0627\0621 <a href="&LOGOUT_URL.">\0645\0639\0627\0648\062F\0629 \062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644</a> \0648\062A\062D\062F\064A\062F \0627\0633\0645 \0639\0645\064A\0644 \0645\0639\062A\0645\062F.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053159666750699)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0623\0633\0628\0627\0628 \0623\0645\0646\064A\0629\060C \0644\0627 \064A\064F\0633\0645\062D \0628\062A\0634\063A\064A\0644 \062A\0637\0628\064A\0642\0627\062A \0641\064A \0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644 \0647\0630\0647 \0639\0646 \0637\0631\064A\0642 \0627\0644\0645\062C\0627\0644 \0641\064A \0639\0646\0648\0627\0646 URL.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074605209750705)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \0645\0637\0627\0644\0628\0629 \0645\0633\0626\0648\0644 \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0628\062A\0634\063A\064A\0644 $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074561377750705)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0632\0645\0629 SYS.DBMS_LDAP \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0623\0648 \063A\064A\0631 \0635\0627\0644\062D\0629.')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074425739750705)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\062D\0631\064A\0631 \062F\0627\0644\0629 \0645\0633\062A\062E\062F\0645 LDAP.')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074736960750706)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0645\0635\0627\062F\0642\0629 LDAP.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075551212750706)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0641\064A \0648\0633\064A\0637\0629 p_flow_page ar \0628\0625\062C\0631\0627\0621 login_page.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075108715750706)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'ar'
,p_message_text=>unistr('p_session \063A\064A\0631 \0635\0627\0644\062D \0641\064A wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126475634750721)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0633\064A\0637\0629 \063A\064A\0631 \0635\062D\064A\062D\0629 \0627\0644\0635\064A\0627\063A\0629 \0641\064A wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075291627750706)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0645\0631\064A\0631 \0627\0633\0645 \0645\0633\062A\062E\062F\0645 \062E\0627\0644\064D \0625\0644\0649 \0625\062C\0631\0627\0621 \062A\0633\062C\064A\0644 \062F\062E\0648\0644.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062011184750702)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \0627\0644\0627\0646\062A\0638\0627\0631 \0644\0645\062F\0629 <span id="apex_login_throttle_sec">%0</span> \062B\0627\0646\064A\0629 \0644\062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644 \0645\0631\0629 \0623\062E\0631\0649.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063364726750702)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0638\0631 \0645\062D\0627\0648\0644\0629 \062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124114019750721)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0635\0627\062F\0642\0629 "%0" \063A\064A\0631 \0645\0648\062C\0648\062F\0629')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063848846750702)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0641 \0645\062C\0645\0648\0639\0629 \0627\0644\0623\0645\0627\0646 \062E\0627\0644\064D.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075077604750706)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\0646\0641\064A\0630 \0639\0645\0644\064A\0629 \0645\0627 \0628\0639\062F \0627\0644\0645\0635\0627\062F\0642\0629.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074893982750706)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0639\0645\0644\064A\0629 \0645\0627 \0642\0628\0644 \0627\0644\0645\0635\0627\062F\0642\0629.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076528778750706)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0627\0644\0631\062C\0627\0621 \0641\062A\062D \0639\0646\0648\0627\0646 URL \0641\064A \0627\0644\0645\062A\0635\0641\062D \0646\0641\0633\0647 \062D\064A\062B \0642\0645\062A \0628\0627\0644\0628\062F\0621 \0641\064A \0637\0644\0628 \0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0643\0644\0645\0629 \0627\0644\0633\0631.  \0625\0630\0627 \0642\0645\062A \0628\0627\0644\0646\0642\0631 \0639\0644\0649 \0639\0646\0648\0627\0646 URL \0644\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0643\0644\0645\0629 \0627\0644\0633\0631 \0648\062A\0645\062A \0625\0639\0627\062F\0629 \062A\0648\062C\064A\0647\0643 \0625\0644\0649'),
unistr('\0635\0641\062D\0629 \0627\0644\062F\062E\0648\0644\060C \0641\0627\0644\0631\062C\0627\0621 \0627\0644\0628\062F\0621 \0641\064A \0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0643\0644\0645\0629 \0627\0644\0633\0631 \0645\0631\0629 \0623\062E\0631\0649 \0645\0639 \062A\0631\0643'),
unistr('\0627\0644\0645\062A\0635\0641\062D \0645\0641\062A\0648\062D\064B\0627.')))
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226380396750753)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 URL \0644\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0643\0644\0645\0629 \0627\0644\0633\0631')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053397477750699)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062C\0645\0648\0639\0629 \0627\0644\0627\0633\062A\0647\0644\0627\0643 %0 \0641\064A \0645\062F\064A\0631 \0627\0644\0645\0648\0627\0631\062F \0644\0645 \064A\062A\0645 \0645\0646\062D\0647\0627 %1')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053405990750699)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \0627\0633\062A\062E\062F\0627\0645 DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP \0644\0645\0646\062D \0627\0644\0627\0645\062A\064A\0627\0632 \0627\0644\0645\0641\0642\0648\062F.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088037051750709)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \062F\0627\0644\0629 \0645\0631\0627\0642\0628\0629 \062C\0644\0633\0629 \0627\0644\0639\0645\0644.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088149201750710)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \062F\0627\0644\0629 \0627\0644\062A\062D\0642\0642 \0645\0646 \062C\0644\0633\0629 \0627\0644\0639\0645\0644.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088315983750710)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \0645\0637\0627\0644\0628\0629 \0645\0633\0626\0648\0644 %0 \0628\062A\0643\0648\064A\0646 \0645\062D\0631\0643 \0644\062F\062E\0648\0644 \0627\0644\0645\0648\062D\062F \0641\064A Oracle Application Server.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098758125750713)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0631\062C\0627\0639 %0 \063A\064A\0631 \0635\0627\0644\062D \0641\064A \0631\0645\0632 %1 \0627\0644\0641\0631\064A\062F \0628\0648\0627\0633\0637\0629 \0627\0644\062F\062E\0648\0644 \0627\0644\0645\0648\062D\062F.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075420609750706)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \062A\062D\0631\064A\0631 \0645\062E\0637\0637 \0627\0644\0645\0635\0627\062F\0642\0629 \0648\0625\0636\0627\0641\0629 \0627\0633\0645 \0627\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098497141750713)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062A\062F\0639\064A \0625\062C\0631\0627\0621 %0 \063A\064A\0631 \0645\0634\0631\0648\0639:')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098641856750713)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\0644\0633\0629 \0639\0645\0644 \0627\0644\062A\0637\0628\064A\0642 \063A\064A\0631 \0635\0627\0644\062D\0629 \0641\064A \0631\0645\0632 urlc \0627\0644\0641\0631\064A\062F: %0')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098257145750713)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \062E\0637\0623 \0641\064A portal_sso_redirect: \0645\0639\0644\0648\0645\0627\062A \062A\0633\062C\064A\0644 \0627\0644\062A\0637\0628\064A\0642 \063A\064A\0631 \0645\0648\062C\0648\062F\0629: %0')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088281048750710)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0632\0645\0629 WWSEC_SSO_ENABLER_PRIVATE \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0623\0648 \063A\064A\0631 \0635\0627\0644\062D\0629.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075323058750706)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0639\0630\0631 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0633\0645 \062A\0637\0628\064A\0642 \0634\0631\064A\0643 \0645\0633\062C\0644 \0641\064A \0645\062E\0637\0637 \0645\0635\0627\062F\0642\0629.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098378733750713)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \062A\0633\062C\064A\0644 \0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642 \0643\0645\0627 \0647\0648 \0645\0628\064A\0646 \0641\064A \062F\0644\064A\0644 \0627\0644\062A\062B\0628\064A\062A.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088435618750710)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0645\0635\0627\062F\0642\0629 \0627\0644\062F\062E\0648\0644 \0627\0644\0645\0648\062D\062F.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201736300750745)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 URL \063A\064A\0631 \0645\0639\062A\0645\062F:  %0')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087849022750709)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0627\0644\0645\0635\0627\062F\0642\0629.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053263820750699)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644 "%0" \063A\064A\0631 \0646\0634\0637\0629. \0639\0644\064A\0643 \0628\0627\0644\0627\062A\0635\0627\0644 \0628\0627\0644\0645\0633\0626\0648\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053962967750699)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'ar'
,p_message_text=>'%0'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063021936750702)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0631\0641\0636 \0627\0644\0648\0635\0648\0644 \0628\0648\0627\0633\0637\0629 \0627\062E\062A\0628\0627\0631 \0627\0644\0623\0645\0627\0646 \0641\064A \0627\0644\062A\0637\0628\064A\0642')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063116142750702)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0631\0641\0636 \0627\0644\0648\0635\0648\0644 \0628\0648\0627\0633\0637\0629 \0627\062E\062A\0628\0627\0631 \0627\0644\0623\0645\0627\0646 \0641\064A \0627\0644\0635\0641\062D\0629')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063228034750702)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0627\0644\0627\0639\062A\0645\0627\062F.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132390702750723)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\0646\0634\0627\0621 \0628\0648\0627\0633\0637\0629 %0 \0628\0627\0633\062A\062E\062F\0627\0645 %1')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132454547750723)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0647\062A\0645\0627\0645')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192298664750742)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0635\0641 \0627\0644\062D\062F\062B')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192032398750742)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0627\0631\064A\062E \0627\0644\0646\0647\0627\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192388933750742)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0641 \0627\0644\062D\062F\062B')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191912007750742)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0627\0631\064A\062E \0627\0644\0628\062F\0627\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192179194750742)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0627\0644\062D\062F\062B')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034722224750693)
,p_name=>'APEX.CARD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\0637\0627\0642\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034921125750693)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0631\0627\0621 \0627\0644\0628\0637\0627\0642\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075689134750706)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0628\0639 \062D\0648\0627\0631 \0645\062E\0641\064A \0645\0631\0626\064A\064B\0627')
,p_is_js_message=>true
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077539007750706)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \062E\0637\0623 \0641\064A \0645\062D\062A\0648\0649 \0627\0644\0645\062C\0645\0648\0639 \0627\0644\0627\062E\062A\0628\0627\0631\064A')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077421450750706)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \062E\0637\0623 \0641\064A \062A\0646\0633\064A\0642 \0627\0644\0645\062C\0645\0648\0639 \0627\0644\0627\062E\062A\0628\0627\0631\064A')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147397313750728)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0646\0633\062E \0625\0644\0649 \0627\0644\062D\0627\0641\0638\0629.')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146851491750728)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062F\0639\0645 \0647\0630\0627 \0627\0644\0645\0633\062A\0639\0631\0636 \0627\0644\0646\0633\062E \0628\0627\0633\062A\062E\062F\0627\0645 \0632\0631 \0623\0648 \0642\0627\0626\0645\0629. \062D\0627\0648\0644 \0627\0633\062A\062E\062F\0627\0645 \0627\0644\0627\062E\062A\0635\0627\0631 Ctrl+C \0623\0648 Command+C.')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133024318750723)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\063A\0644\0627\0642')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011408289750686)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\062C\0627\0648\0632 \0645\062D\062A\0648\0649 \0645\062D\0631\0631 \0627\0644\0631\0645\0632 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0637\0648\0644 \0627\0644\0639\0646\0635\0631 (%0 \0627\0644\0641\0639\0644\064A\060C %1 \0645\0646 \0627\0644\0623\062D\0631\0641 \0627\0644\0645\0633\0645\0648\062D \0628\0647\0627)')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191549960750742)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0628\0627\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186013684750740)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185977351750740)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0648\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190134561750741)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 #LABEL# \0644\0648\0646\064B\0627 \0635\0627\0644\062D\064B\0627. \0645\062B\0627\0644: %0')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052585218750699)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0632\064A\062F \0645\0646 \0627\0644\0623\0644\0648\0627\0646')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052624651750699)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0641\062A\062D \0645\0646\062A\0642\064A \0627\0644\0623\0644\0648\0627\0646')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009773432750686)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0631\064A\0637 \062A\0645\0631\064A\0631 \0623\0644\0641\0627\060C \0634\0631\064A\0637 \062A\0645\0631\064A\0631\0623\0641\0642\064A. \0627\0633\062A\062E\062F\0645 \0645\0641\0627\062A\064A\062D \0627\0644\0623\0633\0647\0645 \0644\0644\062A\0646\0642\0644.')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009437086750686)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\064A\0641 \0627\0644\0623\0644\0648\0627\0646\060C \0634\0631\064A\0637 \062A\0645\0631\064A\0631 \0631\0628\0627\0639\064A \0627\0644\0627\062A\062C\0627\0647\0627\062A. \0627\0633\062A\062E\062F\0645 \0645\0641\0627\062A\064A\062D \0627\0644\0623\0633\0647\0645 \0644\0644\062A\0646\0642\0644.')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009508360750686)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0631\064A\0637 \062A\0645\0631\064A\0631 \0644\062A\062F\0631\062C \0627\0644\0623\0644\0648\0627\0646\060C \0634\0631\064A\0637 \062A\0645\0631\064A\0631 \0639\0645\0648\062F\064A. \0627\0633\062A\062E\062F\0645 \0645\0641\0627\062A\064A\062D \0627\0644\0623\0633\0647\0645 \0644\0644\062A\0646\0642\0644.')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185835139750740)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0644\0648\0646')
,p_is_js_message=>true
,p_version_scn=>2704482
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186145034750740)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\063A\064A\064A\0631 \0635\064A\063A\0629 \0627\0644\0644\0648\0646')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224080064750752)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224108213750752)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\062A\062D \0642\0627\0626\0645\0629 \0644\0640: %0')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204417066750746)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'ar'
,p_message_text=>unistr('(\0645\0643\062A\0645\0644)')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093317041750711)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062A\0635\0644 \0628\0645\0633\0626\0648\0644 \0627\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108850146750716)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0627\062A\0635\0644 \0628\0645\0633\0626\0648\0644 \0627\0644\062A\0637\0628\064A\0642.'),
unistr('\062A\062A\0648\0641\0631 \062A\0641\0627\0635\064A\0644 \062D\0648\0644 \0647\0630\0627 \0627\0644\062D\0627\062F\062B \0628\0648\0627\0633\0637\0629 \0645\0639\0631\0641 \062A\0635\062D\064A\062D \0627\0644\0623\062E\0637\0627\0621 "%0".')))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190423501750741)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0635\062D\064A\062D \0627\0644\0623\062E\0637\0627\0621 \0642\0628\0644 \0627\0644\062D\0641\0638.')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035786106750694)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'ar'
,p_message_text=>unistr('%0. \0627\0636\063A\0637 \0639\0644\0649 \0645\0641\062A\0627\062D \0627\0644\062A\0631\0627\062C\0639 \0644\0644\062D\0630\0641.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133933505750724)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 %0 \0645\0646 \0627\0644\0639\0646\0627\0635\0631 \0627\0644\0645\0637\0627\0628\0642\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015848227750688)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('1 \062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \062D\0627\0644\0629 \0645\0637\0627\0628\0642\0629')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133812726750724)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0639\0646\0627\0635\0631 \0645\0637\0627\0628\0642\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010258562750686)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0630\0644\0643')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010194435750686)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0642\064A\0645 \0627\0644\0645\062D\062F\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204947228750746)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\062F\0645 \0627\0644\062D\0627\0644\064A')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190802491750742)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0644\0641 \0627\0644\0645\062D\062F\062F \0641\064A \0639\0646\0635\0631 %0 \063A\064A\0631 \0645\0648\062C\0648\062F \0641\064A APEX_APPLICATION_TEMP_FILES.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179358260750738)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\063A\064A\0631\062A \0646\0633\062E\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062D\0627\0644\064A\0629 \0641\064A \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0644\0623\0646 \0627\0644\0645\0633\062A\062E\062F\0645 \0628\062F\0623 \0639\0645\0644\064A\0629 \062A\062D\062F\064A\062B.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148425146750728)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\0645 \0627\0644\062A\062D\0645\064A\0644')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194787808750743)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623 \0645\0639\0627\0644\062C\0629 \0623\0648\0644\064A\0629')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194560493750743)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062F\0631\0627\062C \0635\0641')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208116128750747)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0633\0644\0633\0644: \0627\0644\0625\062C\0631\0627\0621')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194626493750743)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062B \0627\0644\0635\0641')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023187441750690)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\062C\0631\0627\0621\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050714270750698)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'ar'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036816027750694)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 %0 \0645\0646\062A\0642\064A \062A\0627\0631\064A\062E \0623\0648 \062A\0627\0631\064A\062E\064B\0627 \0635\0627\0644\062D\064B\0627\060C \0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644 %1.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146093740750727)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054214262750699)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065283572750703)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0634\062A\0645\0644 %0 \0639\0644\0649 \0623\062C\0632\0627\0621 \063A\064A\0631 \0645\062F\0639\0648\0645\0629 \0641\064A \0642\0646\0627\0639 \0627\0644\0635\064A\063A\0629: %1')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050404816750698)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0627\0639\0629')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134328285750724)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0648\064A\0645 \0627\0644\0645\0646\0628\062B\0642: %0')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050255850750698)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0628\0648\0639')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050313658750698)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0628\0648\0639')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050601601750698)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0642\0627\0626\0642')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050845441750698)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051264065750698)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020894233750689)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0627\0641\0630\0629 \0645\0646\0628\062B\0642\0629 \0644\0640 %0')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051109097750698)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631 \0627\0644\0633\0627\0628\0642')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143696144750727)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\062A\0642\064A \062A\0627\0631\064A\062E \0644\0644\0642\0631\0627\0621\0629 \0641\0642\0637')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052079114750699)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\062A\0627\0631\064A\062E')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020943720750689)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062F \0627\0644\062A\0627\0631\064A\062E \0648\0627\0644\0648\0642\062A')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018126243750688)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\064A\0648\0645')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021571638750689)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0634\0647\0631 \0648\0627\0644\0633\0646\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018302174750688)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0648\0642\062A')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018857261750689)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\064A\0648\0645')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036446239750694)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 #LABEL# \062A\0627\0631\064A\062E\064B\0627 \0635\0627\0644\062D\064B\0627\060C \0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644 %0.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036137013750694)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\0643\0648\0646 \0642\064A\0645\0629 #LABEL# \0628\064A\0646 %0 \0648 %1.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036251549750694)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\0643\0648\0646 \0642\064A\0645\0629 #LABEL# \0641\064A %0 \0623\0648 \0628\0639\062F\0647.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036399157750694)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\0643\0648\0646 \0642\064A\0645\0629 #LABEL# \0641\064A %0 \0623\0648 \0642\0628\0644\0647.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027741263750691)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0645\062E\0641\064A \0645\0631\0626\064A\064B\0627')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051000838750698)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0646\0629')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138032385750725)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('#LABEL# \0623\0643\0628\0631 \0645\0646 (\0644\0627\062D\0642 \0644\0640) \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0627\0644\0645\062D\062F\062F \0644\0644\062A\0627\0631\064A\062E %0.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138438623750725)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('#LABEL# \0644\0627 \064A\0637\0627\0628\0642 \0627\0644\0635\064A\063A\0629 %0.')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137967479750725)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('#LABEL# \0623\0642\0644 \0645\0646 (\0633\0627\0628\0642 \0639\0644\0649) \0627\0644\062D\062F \0627\0644\0623\062F\0646\0649 \0627\0644\0645\062D\062F\062F \0644\0644\062A\0627\0631\064A\062E %0.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138112229750725)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'ar'
,p_message_text=>unistr('#LABEL# \0644\064A\0633 \0641\064A \0646\0637\0627\0642 \0635\0627\0644\062D \0645\0646 %0 \0625\0644\0649 %1.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138385489750725)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'ar'
,p_message_text=>unistr('#LABEL# \0644\064A\0633 \0641\064A \0646\0637\0627\0642 \0633\0646\0648\0627\062A \0635\0627\0644\062D \0628\064A\0646 %0 \0648%1.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030147605750692)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \062F\0627\062E\0644\064A \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0637\0644\0628 DBMS_CLOUD.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190710388750742)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\063A\0627\0621')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216658486750750)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\063A\0644\0627\0642')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077830261750706)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0623\0643\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218602223750750)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0639\0644\064A\0645\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190545270750741)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0648\0627\0641\0642')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190672555750741)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058317111750700)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098056083750713)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0645\0631\0628\0639 \062D\0648\0627\0631 \0645\062E\0641\064A \0645\0631\0626\064A\064B\0627')
,p_is_js_message=>true
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019103830750689)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0638\064A\0641\0629 Oracle Document Generator \0627\0644\0645\064F\0639\062F\0629 \0645\0633\0628\0642\064B\0627')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029942382750692)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0637\0628\0627\0639\0629 \0645\0633\062A\0646\062F.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007184084750685)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('%s \0644\0627 \064A\062F\0639\0645 %1 \0643\0625\062E\0631\0627\062C.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019024182750689)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623 "%0" \0623\062B\0646\0627\0621 \0627\0633\062A\062F\0639\0627\0621 \0648\0638\064A\0641\0629 Oracle Document Generator \0627\0644\0645\064F\0639\062F\0629 \0645\0633\0628\0642\064B\0627:')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010555515750686)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0637\0644\0648\0628 \0625\062F\062E\0627\0644 \0642\0627\0644\0628.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035930868750694)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\0646\0632\064A\0644 \0627\0644\0645\0644\0641.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035801627750694)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0628\064A\0627\0646\0627\062A \0642\0627\0628\0644\0629 \0644\0644\062A\0646\0632\064A\0644.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039449503750695)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0647\0630\0647 \0627\0644\0645\064A\0632\0629 \063A\064A\0631 \0645\062A\0627\062D\0629 \0641\064A \0628\064A\0626\0629 \0648\0642\062A \0627\0644\062A\0634\063A\064A\0644 \0641\0642\0637.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092298921750711)
,p_name=>'APEX.ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623')
,p_is_js_message=>true
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052178670750699)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \0627\0644\062E\0637\0623 \0627\0644\062A\0627\0644\064A \0623\062B\0646\0627\0621 \062A\0646\0641\064A\0630 \0645\0639\0627\0648\062F\0629 \0627\062A\0635\0627\0644 \0644\0625\0635\0644\0627\062D \062E\0637\0623: %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064702040750702)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0637\0628\0627\0639\0629 \0635\0641\062D\0629 \0627\0644\062E\0637\0623: %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053834027750699)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623 \062F\0627\062E\0644\064A')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203564770750745)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0639\0644\064A\0643 \0628\0627\0644\0627\062A\0635\0627\0644 \0628\0627\0644\0645\0633\0626\0648\0644.'),
unistr('\062A\062A\0648\0641\0631 \062A\0641\0627\0635\064A\0644 \062D\0648\0644 \0647\0630\0627 \0627\0644\062D\0627\062F\062B \0645\0646 \062E\0644\0627\0644 \0645\0639\0631\0641 \062A\0635\062D\064A\062D \0627\0644\0623\062E\0637\0627\0621 "%0".')))
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198108502750744)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0641\062A\062D \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0628\063A\0631\0636 \0627\0644\0642\0631\0627\0621\0629-\0641\0642\0637')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228234575750753)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'ar'
,p_message_text=>unistr('ORA-28353: \0641\0634\0644 \0641\062A\062D \0627\0644\062D\0627\0641\0638\0629. \0648\0645\0646 \062B\0645\060C \0644\0627 \064A\0645\0643\0646 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0628\064A\0627\0646\0627\062A \0627\0644\062A\0637\0628\064A\0642 \062D\0627\0644\064A\064B\0627.')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198215497750744)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0630\0631\0629\060C \0647\0630\0647 \0627\0644\0635\0641\062D\0629 \063A\064A\0631 \0645\062A\0627\062D\0629.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056833799750700)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0639\0644\0648\0645\0627\062A \0627\0644\0641\0646\064A\0629 (\0645\062A\0648\0641\0631 \0644\0644\0645\0637\0648\0631\064A\0646 \0641\0642\0637)')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162747409750733)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0633\0627\0644\0629 \062E\0637\0623')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176676442750737)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0646\0633\064A\0642 \0627\0644\0645\062A\0648\0642\0639: %0')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141567051750726)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0633\062A\062E\062F\0645 \0641\064A \0642\0627\0626\0645\0629 \0627\0644\062A\062D\0643\0645 \0628\0627\0644\0648\0635\0648\0644 \0628\0627\0644\0641\0639\0644')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141495070750726)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \062A\0623\0643\064A\062F \0625\0636\0627\0641\0629 \0627\0644\0645\0633\062A\062E\062F\0645 (\0627\0644\0645\0633\062A\062E\062F\0645\064A\0646) \0627\0644\062A\0627\0644\064A %0 \0625\0644\0649 \0642\0627\0626\0645\0629 \0627\0644\062A\062D\0643\0645 \0628\0627\0644\0648\0635\0648\0644 <strong>%1</strong>.')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141917972750726)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \0645\0633\062A\062E\062F\0645 \0645\0643\0631\0631.')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141641820750726)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0644\0627\0645\0629 (@) \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0641\064A \0639\0646\0648\0627\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141716510750726)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0642\0637\0629 (.) \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0641\064A \0639\0646\0648\0627\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141852075750726)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\0645\0633\062A\062E\062F\0645 \0637\0648\064A\0644 \0644\0644\063A\0627\064A\0629')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142196853750726)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646 \0644\0644\0645\0633\062A\062E\062F\0645\064A\0646 \0627\0644\0645\062D\062F\062F\064A\0646 \0641\064A \0642\0627\0626\0645\0629 \0627\0644\062A\062D\0643\0645 \0628\0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0627\0644\062A\0637\0628\064A\0642 \0641\0642\0637 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142234699750726)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0645\0629 \0625\0639\062F\0627\062F \0627\0644\062A\062D\0643\0645 \0641\064A \0627\0644\0648\0635\0648\0644 \063A\064A\0631 \0645\062A\0648\0642\0639\0629: %0')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142045285750726)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646 \0644\0643\0644 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646 \0627\0644\0645\0635\062F\0642 \0639\0644\064A\0647\0645 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186526691750740)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0637\0644')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186434684750740)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0645\0643\0646')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186713192750740)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('%0: \0645\0639\0637\0644')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186683099750740)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('%0: \0645\0645\0643\0646')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035241568750693)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\062F\0639\0648\0645')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096416188750712)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\064A\0642\0627\0641')
,p_is_js_message=>true
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096322157750712)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0634\063A\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186386565750740)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\0639\0631\0641')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026830466750691)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0628\0627\064A\062A')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027350416750691)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'ar'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027032655750691)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'ar'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027289708750691)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'ar'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179547736750738)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0646\0632\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032634784750693)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\064A\0627\0631\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032308884750693)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032519931750693)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062E\0641\0627\0621 \0627\0644\0645\0631\0634\062D \0627\0644\0625\0636\0627\0641\064A')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057276737750700)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \0645\0631\0634\062D')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133552269750724)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D \0627\0644\0645\0637\0628\0642 %0')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057980764750700)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0637\0628\064A\0642')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177136550750737)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0637\0628\064A\0642')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058003777750700)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\063A\0627\0621')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041820667750695)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\0634\0631\064A\0637\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189832452750741)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0630\0644\0643')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041961631750695)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0633\0645 \0628\064A\0627\0646\064A \0642\0631\0635\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188423350750741)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041614637750695)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\062F\062F')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177639446750737)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177706679750737)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D \0627\0644\0643\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177873454750737)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D %0')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194301428750743)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F %1\060C \0627\0644\0645\0634\0627\0631 \0625\0644\064A\0647 \0641\064A \0627\0644\062C\0627\0646\0628 %0\060C \063A\064A\0631 \0645\062A\0627\062D \0623\0648 \063A\064A\0631 \0645\0639\062A\0645\062F.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005065565750684)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0627\0644\0645\0631\0634\062D\0627\062A \0627\0644\0645\0637\0644\0648\0628 \0639\0631\0636\0647\0627')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131533401750723)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0646\062A\0627\0626\062C')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131695341750723)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062D\062F\064A\062F %0')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134470111750724)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D\0627\062A \0627\0644\062D\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010073941750686)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\062D\062B \0645\062A\0639\062F\062F \0627\0644\062C\0648\0627\0646\0628 \064A\062A\0637\0644\0628 \0645\0635\062F\0631 \0628\064A\0627\0646\0627\062A \0639\0644\0649 \0645\0633\062A\0648\0649 \0627\0644\0645\0646\0637\0642\0629.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013720369750687)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0645\0631\0634\062D\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192898530750742)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062C\0627\0648\0632 \062D\062F \0627\0644\0642\064A\0645\0629 \0627\0644\0641\0631\064A\062F\0629 (%0) \0641\064A \0627\0644\062C\0627\0646\0628 %1.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179121213750738)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062C\0627\0646\0628 %0 \063A\064A\0631 \0645\062F\0639\0648\0645 \0641\064A \0627\0644\0623\0639\0645\062F\0629 \0645\0646 \0627\0644\0646\0648\0639 DATE \0623\0648 TIMESTAMP.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177235638750737)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D %0')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051879585750699)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 (\0627\0644\0645\064F\0631\0634\062D \0627\0644\0645\0637\0628\0642)')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177342581750737)
,p_name=>'APEX.FS.GO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0642\0627\0644 \0625\0644\0649')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047308558750697)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A \0639\0644\0649 %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178790367750738)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0633\0627\0648\064A %0')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047056207750697)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0643\0628\0631 \0645\0646 %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047172268750697)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0643\0628\0631 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046731265750697)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0642\0644 \0645\0646 %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046924196750697)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0635\063A\0631 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046233038750697)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A \0639\0644\0649 %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032086649750693)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0633\0627\0648\064A %0')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046327719750697)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0628\062F\0623 \0628\0640 %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047292550750697)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0628\062F\0623 \0628\0640 %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045351837750696)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0639\0627\0645\0644 \062A\0635\0641\064A\0629 \0625\0636\0627\0641\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021107115750689)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\0627\062F\0626\0629 \0627\0644\0645\0631\0634\062D "%0" \063A\064A\0631 \0635\0627\0644\062D\0629 \0644\0644\0645\0631\0634\062D \0627\0644\0625\0636\0627\0641\064A "%1".')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019536881750689)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\0627\062F\0626\0629 \0627\0644\0645\0631\0634\062D \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0644\0644\0645\0631\0634\062D \0627\0644\0625\0636\0627\0641\064A "%0".')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053702020750699)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0627\0645\0644')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035606431750694)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034612610750693)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0633\0627\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035314578750694)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0643\0628\0631 \0645\0646')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035442525750694)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0643\0628\0631 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035069560750693)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0642\0644 \0645\0646')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035115491750693)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0635\063A\0631 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046172050750697)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A \0639\0644\0649')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034865414750693)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0633\0627\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046086143750697)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0628\062F\0623 \0628\0640')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137035523320750694)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0628\062F\0623 \0628\0640')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054100770750699)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0628\064A\0627\0646\0627\062A %0 (%1) \063A\064A\0631 \0645\062F\0639\0648\0645 \0641\064A \062C\0627\0646\0628 "\062D\0642\0644 \0627\0644\0625\062F\062E\0627\0644".')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021060105750689)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D "%0" \063A\064A\0631 \0645\062F\0639\0648\0645 \0644\0644\0645\0631\0634\062D \0627\0644\0625\0636\0627\0641\064A "%1" (\0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A %2).')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053689610750699)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178952407750738)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\0642\062F\064A\0645 \0623\0639\0645\062F\0629 \0628\062D\062B \0641\064A \0627\0644\062C\0627\0646\0628 %0')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005126850750684)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0632\064A\062F \0645\0646 \0627\0644\0645\0631\0634\062D\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131749346750723)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062F\0627\064A\0629 \0627\0644\0646\0637\0627\0642')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178466213750738)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0625\0644\0649 %1')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178507888750738)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0639\0644\0649 %0')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178641659750738)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0642\0644 %0')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131868878750723)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0647\0627\064A\0629 \0627\0644\0646\0637\0627\0642')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196436227750743)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0635\0631 \0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645 #%2 ("%1") \0641\064A \062C\0627\0646\0628 \0627\0644\0646\0637\0627\0642 %0 \063A\064A\0631 \0635\0627\0644\062D (\0627\0644\0641\0627\0635\0644 "|" \063A\064A\0631 \0645\0648\062C\0648\062F).')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178849746750738)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\062F\062E\0627\0644 \0627\0644\064A\062F\0648\064A \0641\064A \062C\0627\0646\0628 \0627\0644\0646\0637\0627\0642 %0 \063A\064A\0631 \0645\062F\0639\0648\0645 \062D\0627\0644\064A\064B\0627\060C \0646\0638\0631\064B\0627 \0644\0623\0646 \0627\0644\0639\0645\0648\062F \0645\0646 \0627\0644\0646\0648\0639 DATE \0623\0648 TIMESTAMP.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178147196750737)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\0649')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041761286750695)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128141025750722)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177593908750737)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177471397750737)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B...')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178357831750738)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'ar'
,p_message_text=>unistr('- \062A\062D\062F\064A\062F -')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041509554750695)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177996246750737)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0623\0642\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178059690750737)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0627\0644\0643\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137178289528750738)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0646\062C\0648\0645 \0648\0623\0643\062B\0631')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133452142750723)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0642\062A\0631\0627\062D\0627\062A \0627\0644\062A\0631\0634\064A\062D')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179076586750738)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\0627\0646\0628 \0627\0644\062D\0642\0644 \0627\0644\0646\0635\064A %0 \0645\062F\0639\0648\0645 \0641\0642\0637 \062D\0627\0644\064A\064B\0627 \0641\064A \0623\0639\0645\062F\0629 NUMBER.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004514421750684)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0645\0627\0644\064A \0639\062F\062F \0627\0644\0635\0641\0648\0641')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194449894750743)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0628\064A\0627\0646\0627\062A %0 (%1) \063A\064A\0631 \0645\062F\0639\0648\0645 \0641\064A \0627\0644\0628\062D\062B \0645\062A\0639\062F\062F \0627\0644\062C\0648\0627\0646\0628.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124687882750721)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0645\062E\0641\064A \0645\0631\0626\064A\064B\0627')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186937495750740)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0642\0627\0644 \0625\0644\0649 \0627\0644\062E\0637\0623')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142942635750726)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639.')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070866105750704)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0641\0627\0631\063A')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152210741750729)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\064A \0641\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143044901750726)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0648\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645.')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152114481750729)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\0633\064A\0639 \0641\0627\0635\0644 \0639\0646\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151959194750729)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0630\0641 %0 \0645\0646 \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221039827750751)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0647\0648\064A\0629 \0645\0643\0631\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013941633750687)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062F\062E\0648\0644 \0641\064A \0648\0636\0639 \0627\0644\062A\062D\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139813812750725)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0648\0644')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012724374750687)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062E\0641\0627\0621 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011734126750686)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062D\062A\0648\0649 \062E\0644\064A\0629 \0627\0644\062F\0641\0642 \0627\0644\0639\0627\0626\0645')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013019644750687)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0645\062D\062A\0648\0649 \062F\0641\0642 \0627\0644\0623\0639\0645\0627\0644')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087247475750709)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0630\064A\064A\0644 \0627\0644\0634\0628\0643\0629')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143242647750727)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0627\0644\0645\062C\0645\0648\0639\0629')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143133123750726)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0646\0648\0627\0646.')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139973386750726)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\062E\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014100772750687)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\063A\0627\062F\0631\0629 \0648\0636\0639 \0627\0644\062A\062D\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038850435750695)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0645\064A\0644 \0627\0644\0643\0644')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161720527750732)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0627\0644\0645\0632\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139615076750725)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143382542750727)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\0641\0648\0641 \0627\0644\0635\0641\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052480724750699)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641\062D\0629 %0')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140030914750726)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'ar'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140128329750726)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 - %1 \0645\0646 %2')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197084222750743)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0635\0641\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087582116750709)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0631\0642\064A\0645 \0627\0644\0635\0641\062D\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139788374750725)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0628\0642')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037727290750694)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\0645\062F\0649')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071121646750704)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220891244750751)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062A \0627\0644\0625\0636\0627\0641\0629')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220998732750751)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062A\063A\064A\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137229213357750754)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\0644\0633\0644 \0635\0641\0648\0641 \0627\0644\0634\0628\0643\0629 %0\060C \0627\0644\0639\0645\0648\062F %1.')
,p_is_js_message=>true
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137229317329750754)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\0644\0633\0644 \0635\0641\0648\0641 \0627\0644\0634\0628\0643\0629 %0.')
,p_is_js_message=>true
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220703195750751)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062D\0630\0641')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143567594750727)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0627\0644\0635\0641')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071022891750704)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038957631750695)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062D\062F\064A\062F %0 %1')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139031105750725)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062D\062F\064A\062F %0 \0645\0646 \0627\0644\062E\0644\0627\064A\0627')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140252412750726)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062D\062F\064A\062F %0 \0645\0646 \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182363941750739)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0643\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075897328750706)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0643\0644 \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152048766750729)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641\062D\0629 %0')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143446448750727)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0635\0641')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143733698750727)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0641\0631\0632 \062A\0635\0627\0639\062F\064A\064B\0627 %0')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143863659750727)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0641\0631\0632 \062A\0646\0627\0632\0644\064A\064B\0627 %0')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139124466750725)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \062A\0635\0627\0639\062F\064A')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139438470750725)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \062A\0635\0627\0639\062F\064A %0')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139271243750725)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \062A\0646\0627\0632\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139567847750725)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \062A\0646\0627\0632\0644\064A %0')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139325154750725)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\0645 \0627\0644\0641\0631\0632')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004980243750684)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\064A\0627\0631\0627\062A \0627\0644\0641\0631\0632')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087372013750709)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\064A\0642\0648\0646\0627\062A \0627\0644\062D\0627\0644\0629')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087487447750709)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0627\0644\0629 \0627\0644\0634\0628\0643\0629')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017225176750688)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'ar'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016992310750688)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'ar'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151886420750729)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0645\0627\0644\064A %0')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070608766750704)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \0637\0644\0628 HTTP \0625\0644\0649"%0".')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072205655750705)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F %0')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072489957750705)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F %0 \0648\0627\0644\0635\0641 %1')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072793513750705)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A \0627\0644\0639\0645\0648\062F \0627\0644\0623\0648\0644 \0628\0627\0644\0641\0639\0644. \0627\0644\0639\0645\0648\062F %0 \0648\0627\0644\0635\0641 %1')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072682128750705)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A \0627\0644\0635\0641 \0627\0644\0623\0648\0644 \0628\0627\0644\0641\0639\0644. \0627\0644\0639\0645\0648\062F %0 \0648\0627\0644\0635\0641 %1')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218253317750750)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0648\062C\0648\062F\0629 \0641\064A %0 \0645\0646 \0627\0644\0623\0639\0645\062F\0629 \0648%1 \0645\0646 \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072808655750705)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A \0627\0644\0639\0645\0648\062F \0627\0644\0623\062E\064A\0631 \0628\0627\0644\0641\0639\0644. \0627\0644\0639\0645\0648\062F %0 \0648\0627\0644\0635\0641 %1')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072534305750705)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A \0627\0644\0635\0641 \0627\0644\0623\062E\064A\0631 \0628\0627\0644\0641\0639\0644. \0627\0644\0639\0645\0648\062F %0 \0648\0627\0644\0635\0641 %1')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151739402750729)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0648\062C\0648\062F\0629 \0641\064A %0 \0645\0646 \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072362492750705)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641 %0')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137229020613750753)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 %0')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136126221750724)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\062C\0631\0627\0621\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137179812750725)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137025326750725)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \0635\0641')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222699062750751)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208200816750747)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\062C\0645\064A\0639')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209953757750747)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0643\0644')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167515042750734)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0644 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0646\0635\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168713332750734)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\062F\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169813620750735)
,p_name=>'APEX.IG.AND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189257470750741)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\062F \0627\0644\0645\0645\064A\0632 \0627\0644\062A\0642\0631\064A\0628\064A')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223608658750752)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\062F\062F \0627\0644\0625\062C\0645\0627\0644\064A \0627\0644\0645\0645\064A\0632 \0627\0644\062A\0642\0631\064A\0628\064A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206844452750747)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\0627\062D\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208749252750747)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0635\0627\0639\062F\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168873749750735)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0635\0627\062F\0642\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222724420750751)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0644\0642\0627\0626\064A')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189636259750741)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062A\0648\0633\0637')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223354387750752)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062A\0648\0633\0637 \0627\0644\0625\062C\0645\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206386154750746)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0645\062D\0648\0631 \0627\0644\062A\0633\0645\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206522134750746)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0645\0627\0643\0646 \0627\0644\0639\0634\0631\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206432137750746)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0645\062D\0648\0631 \0627\0644\0642\064A\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212561068750748)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0648\0646 \0627\0644\062E\0644\0641\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206919449750747)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0631\064A\0637\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164111180750733)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213787065750749)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0644\0627\0647\0645\0627')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207064749750747)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0642\0627\0639\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137337896750725)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\063A\0627\0621')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169758319750735)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0633\0627\0633 \0644\062D\0627\0644\0629 \0627\0644\0623\062D\0631\0641')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224251965750752)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'ar'
,p_message_text=>unistr('(\062D\0633\0627\0633 \0644\062D\0627\0644\0629 \0627\0644\0623\062D\0631\0641)')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195503013750743)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0641\0638 \0627\0644\062A\063A\064A\064A\0631\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137750021750725)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\063A\064A\064A\0631 \0637\0631\064A\0642\0629 \0627\0644\0639\0631\0636')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170890314750735)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167388776750734)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\062C\0627\0648\0632 \0627\0633\062A\0639\0644\0627\0645\0643 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0646\0642\0627\0637 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\0628\0627\0644\063A %0 \0644\0643\0644 \0631\0633\0645 \0628\064A\0627\0646\064A. \0627\0644\0631\062C\0627\0621 \062A\0637\0628\064A\0642 \0645\0631\0634\062D \0644\062A\0642\0644\064A\0644 \0639\062F\062F \0627\0644\062A\0633\062C\064A\0644\0627\062A \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0623\0633\0627\0633\064A \0627\0644\062E\0627\0635 \0628\0643.')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136030066750724)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\0647\064A\0643\0644 \0627\0644\062A\0646\0638\064A\0645\064A')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144496304750727)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205857181750746)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\063A\0644\0627\0642')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212760831750748)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0644\0648\0627\0646')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190002676750741)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0627\064A\0646\0629')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169114116750735)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136210893750724)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0639\0645\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098116321750713)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0631\0627\0621\0627\062A \0627\0644\0639\0645\0648\062F')
,p_is_js_message=>true
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097960347750712)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0631\0627\0621\0627\062A \0627\0644\0639\0645\0648\062F "%0"')
,p_is_js_message=>true
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214523436750749)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\0631\0636 \0627\0644\0639\0645\0648\062F')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169275447750735)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0643\0628')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136448508750724)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0633\0627\0628')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164760154750733)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171034178750735)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0648\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144238860750727)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\062E \0625\0644\0649 \0627\0644\062D\0627\0641\0638\0629')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144305361750727)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\062E \0644\0623\0633\0641\0644')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189082856750741)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\062F\062F')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189187080750741)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\062F \0627\0644\0645\0645\064A\0632')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223574190750752)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\062F\062F \0627\0644\0625\062C\0645\0627\0644\064A \0627\0644\0645\0645\064A\0632')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223400122750752)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\062F\062F \0627\0644\0625\062C\0645\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221191476750751)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0648\064A\0646 %0')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167766772750734)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\064A\0627\0646\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214382500750749)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213915404750749)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0631\064A\062E')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195301215750743)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0645\0629 \0627\0644\062A\0627\0631\064A\062E \063A\064A\0631 \0635\0627\0644\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165492670750733)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\064A\0627\0645')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168417952750734)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\0639\062F\0627\062F\0627\062A \0627\0644\0627\0641\062A\0631\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168211469750734)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0648\0639 \0627\0644\0627\0641\062A\0631\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137229035750725)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0630\0641')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215476364750749)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0647\0644 \062A\0631\064A\062F \0628\0627\0644\062A\0623\0643\064A\062F \062D\0630\0641 \0647\0630\0627 \0627\0644\062A\0642\0631\064A\0631\061F')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172846489750736)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0630\0641 \0635\0641')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171654023750735)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0630\0641 \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208803443750747)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0646\0627\0632\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170580113750735)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0641\0627\0635\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135726203750724)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\062A\0641\0627\0635\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197828462750744)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\062A\062C\0627\0647')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170278629750735)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0637\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164846015750733)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A \0639\0644\0649')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165026472750733)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0628\062F\0623 \0628\0640')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207187350750747)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0627\0626\0631\064A \0645\062C\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171295037750735)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0646\0632\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061561575750701)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\064A\0627\0646\0627\062A \0641\0642\0637')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216422951750749)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0635\064A\063A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076616922750706)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0646\0633\064A\0642 \0627\0644\062A\0646\0632\064A\0644 %0 \063A\064A\0631 \0645\0645\0643\0646.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209566384750747)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639 \0645\0643\0631\0631')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209632070750747)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0627\0635\0644 \0639\0646\0627\0635\0631 \062A\062D\0643\0645 \0645\0643\0631\0631')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172797604750736)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\0641 \0645\0643\0631\0631')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171531670750735)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641\0648\0641 \0627\0644\0645\0643\0631\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136826562750725)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208626636750747)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089177661750710)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 %0')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220051847750751)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0627\0644\0645\062C\0645\0648\0639\0629 \062D\0633\0628')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127229347750722)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0641\064A \0648\0636\0639 \0627\0644\062A\062D\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102842162750714)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0629 \0641\064A \0648\0636\0639 \0627\0644\062A\062D\0631\064A\0631\060C \062A\0648\0642\0641 \0639\0646 \0627\0644\0636\063A\0637 \0644\0644\062A\0628\062F\064A\0644 \0625\0644\0649 \0648\0636\0639 \0627\0644\0639\0631\0636')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216055952750749)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\062E\0629 \0645\062E\0641\064A\0629 (bcc)')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216207094750749)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0627\0644\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215977118750749)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\062E\0629 (\0646\0633\062E\0629 \0625\0644\0649)')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215624172750749)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0631\0633\0627\0644 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A.')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216128792750749)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0648\0636\0648\0639')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215891081750749)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0633\062A\0644\0645 (\0625\0644\0649)')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169913828750735)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0645\0643\0646')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163123229750733)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0633\0627\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170099250750735)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0639\0628\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215074780750749)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0648\0639')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182222273750739)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0639\062F\0627\062F \0627\0644\0645\0644\0641. \062C\0627\0631\064D \0628\062F\0621 \0627\0644\062A\0646\0632\064A\0644.')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144576512750727)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0628\0626\0629')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146772627750728)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\062A\0639\0628\0626\0629 \0645\0639')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146634134750728)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\062A\0639\0628\0626\0629')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136338057750724)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169369410750735)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223090590750752)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0634\062D...')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209061607750747)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0648\0644')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136547636750724)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\0627\0631\064A\062E\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167882851750734)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\064A\063A\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213654114750749)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0646\0627\0639 \0627\0644\0635\064A\0627\063A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215313833750749)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'ar'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215282493750749)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'ar'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126319788750721)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'ar'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060283722750701)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'ar'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172460169750736)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170184639750735)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062F\0648\0627\0644 \0648\0627\0644\0639\0648\0627\0645\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207204188750747)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0645\0639\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188906540750741)
,p_name=>'APEX.IG.GO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0642\0627\0644 \0625\0644\0649')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163780438750733)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0643\0628\0631 \0645\0646')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163801217750733)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0643\0628\0631 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170409849750735)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135570179750724)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\0634\0628\0643\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209827795750747)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062C\0645\0648\0639\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170613151750735)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639 \062D\0633\0628')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135825347750724)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \062A\062C\0645\064A\0639 \062D\0633\0628')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214224356750749)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0634\0631\0637')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213163387750748)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0646\0648\0627\0646')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213334029750749)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062D\0627\0630\0627\0629 \0627\0644\0639\0646\0648\0627\0646')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222995053750752)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0639\0644\064A\0645\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218461904750750)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\064A\0645\0643\0646 \0625\062F\0631\0627\062C \0627\0644\0628\064A\0627\0646\0627\062A \0648\062A\062D\062F\064A\062B\0647\0627 \0648\062D\0630\0641\0647\0627 \0645\0628\0627\0634\0631\0629 \0636\0645\0646 \0647\0630\0647 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629.</p>'),
'',
unistr('<p>\0623\062F\0631\062C \0635\0641\064B\0627 \062C\062F\064A\062F\064B\0627 \0628\0627\0644\0646\0642\0631 \0639\0644\0649 \0632\0631 "\0625\0636\0627\0641\0629 \0635\0641".</p>'),
'',
unistr('<p>\0642\0645 \0628\062A\062D\0631\064A\0631 \0628\064A\0627\0646\0627\062A \0645\0648\062C\0648\062F\0629 \0628\0627\0644\0646\0642\0631 \0627\0644\0645\0632\062F\0648\062C \0639\0644\0649 \062E\0644\064A\0629 \0628\0639\064A\0646\0647\0627. \0648\0644\062A\062D\0631\064A\0631 \0643\0645\064A\0627\062A \0623\0643\0628\0631\060C \0627\0646\0642\0631 \0639\0644\0649 "\062A\062D\0631\064A\0631" \0644\0644\062F\062E\0648\0644 \0641\064A \0648\0636\0639 \0627\0644\062A\062D\0631\064A\0631. \0648\0641\064A \0647\0630\0627 \0627\0644\0648\0636\0639 \064A\0645\0643\0646\0643 \0627\0644\0646\0642\0631 \0627\0644\0645\0641\0631\062F \0623\0648 \0627\0633\062A\062E\062F\0627\0645 \0644\0648\062D\0629 \0627\0644\0645\0641\0627\062A\064A\062D \0644\062A\062D\0631\064A\0631 \062E\0644\0627\064A\0627 \0628\0639\064A\0646\0647\0627.</p>'),
'',
unistr('<p>\0627\0633\062A\062E\062F\0645 \0627\0644\0642\0627\0626\0645\0629 "\062A\063A\064A\064A\0631" \0644\062A\0643\0631\0627\0631 \0635\0641\0648\0641 \0648\062D\0630\0641\0647\0627. \0648\0644\062A\0645\0643\064A\0646 \0627\0644\0642\0627\0626\0645\0629 "\062A\063A\064A\064A\0631" \0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639\0627\062A \0627\0644\0627\062E\062A\064A\0627\0631 \0644\062A\062D\062F\064A\062F \0635\0641 \0623\0648 \0623\0643\062B\0631.</p>'),
'',
unistr('<p>\0642\0645 \0628\062A\0643\0631\0627\0631 \0635\0641 \0645\062D\062F\062F \0639\0646 \0637\0631\064A\0642 \0627\0644\0646\0642\0631 \0639\0644\0649 \0627\0644\0642\0627\0626\0645\0629 "\062A\063A\064A\064A\0631" \0648\062A\062D\062F\064A\062F "\062A\0643\0631\0627\0631 \0635\0641\0648\0641". \0648\0627\062D\0630\0641 \0635\0641\064B\0627 \0645\062D\062F\062F\064B\0627 \0639\0646 \0637\0631\064A\0642 \0627\0644\0646\0642\0631 \0639\0644\0649 \0627\0644\0642\0627\0626\0645\0629 "\062A\063A\064A\064A\0631" \0648\062A\062D\062F\064A\062F "\062D\0630\0641 \0635\0641".</p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220574694750751)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0645\0643\0627\0646\064A\0627\062A \0627\0644\062A\062D\0631\064A\0631')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220686667750751)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\062A\0642\062F\0645 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \0645\062C\0645\0648\0639\0629 \0645\0646 \0627\0644\0628\064A\0627\0646\0627\062A \0641\064A \062A\0642\0631\064A\0631 \0642\0627\0628\0644 \0644\0644\0628\062D\062B \0648\0627\0644\062A\062E\0635\064A\0635. \0648\064A\0645\0643\0646 \0625\062C\0631\0627\0621 \0627\0644\0639\062F\064A\062F \0645\0646 \0627\0644\0639\0645\0644\064A\0627\062A \0639\0644\064A\0647 \0644\062A\0642\0644\064A\0644 \0639\062F\062F \0627\0644\0633\062C\0644\0627\062A \0627\0644\0645\0631\062C\0639\0629\060C \0648\062A\063A\064A\064A\0631 \0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\0628\064A\0627\0646\0627\062A.</p>'),
'',
unistr('<p>\0627\0633\062A\062E\062F\0645 \0627\0644\062D\0642\0644 "\0628\062D\062B" \0641\064A \062A\0631\0634\064A\062D \0627\0644\0633\062C\0644\0627\062A \0627\0644\0645\0631\062C\0639\0629. \0648\0627\0646\0642\0631 \0639\0644\0649 "\0625\062C\0631\0627\0621\0627\062A" \0644\0644\0648\0635\0648\0644 \0625\0644\0649 \0627\0644\0639\062F\064A\062F \0645\0646 \062E\064A\0627\0631\0627\062A \062A\0639\062F\064A\0644 \0646\0633\0642 \0627\0644\062A\0642\0631\064A\0631\060C \0623\0648 \0627\0633\062A\062E\062F\0627\0645 \0642\0648\0627\0626\0645 "\0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F" \0641\064A \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629.</p>'),
'',
unistr('<p>\0627\0633\062A\062E\062F\0645 "\0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0642\0631\064A\0631" \0644\062D\0641\0638 \0639\0645\0644\064A\0627\062A \0627\0644\062A\062E\0635\064A\0635 \0627\0644\062A\064A \0623\062C\0631\064A\062A\0647\0627 \0641\064A \062A\0642\0631\064A\0631. \0643\0645\0627 \064A\0645\0643\0646\0643 \062A\0646\0632\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A \0645\0646 \0627\0644\062A\0642\0631\064A\0631 \0641\064A \0645\0644\0641 \062E\0627\0631\062C\064A\060C \0623\0648 \0625\0631\0633\0627\0644\0647\0627 \0641\064A \0631\0633\0627\0644\0629 \0625\0644\0643\062A\0631\0648\0646\064A\0629 \0625\0644\0649 \0646\0641\0633\0643 \0623\0648 \0627\0644\0622\062E\0631\064A\0646.</p>'),
'',
unistr('<p>\0644\0645\0639\0631\0641\0629 \0627\0644\0645\0632\064A\062F\060C \064A\064F\0631\062C\0649 \0627\0644\0627\0637\0644\0627\0639 \0639\0644\0649 "\0627\0633\062A\062E\062F\0627\0645 \0627\0644\0634\0628\0643\0627\062A \0627\0644\062A\0641\0627\0639\0644\064A\0629" \0641\064A <em>\062F\0644\064A\0644 \0645\0633\062A\062E\062F\0645 Oracle APEX</em>.')))
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220339083750751)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0638\0631\0629 \0639\0627\0645\0629')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218357528750750)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\064A\0645\0643\0646\0643 \062A\062E\0635\064A\0635 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \0628\062D\064A\062B \062A\0639\0631\0636 \0627\0644\0628\064A\0627\0646\0627\062A \0628\0637\0631\0642 \0645\062A\0646\0648\0639\0629 \0628\0627\0633\062A\062E\062F\0627\0645 \0627\0644\0625\0645\0643\0627\0646\064A\0627\062A \0627\0644\0645\0636\0645\0646\0629 \0641\064A\0647\0627.</p>'),
'',
unistr('<p>\0627\0633\062A\062E\062F\0645 \0642\0648\0627\0626\0645 "\0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F" \0623\0648 \0627\0644\0642\0627\0626\0645\0629 "\0625\062C\0631\0627\0621\0627\062A" \0644\062A\062D\062F\064A\062F \0623\064A \0627\0644\0623\0639\0645\062F\0629 \064A\062A\0645 \0639\0631\0636\0647\0627\060C \0648\0628\0623\064A \062A\0633\0644\0633\0644\060C \0648\062A\062C\0645\064A\062F \0623\0639\0645\062F\0629. \0643\0645\0627 \064A\0645\0643\0646\0643 \062A\0639\0631\064A\0641 \0645\062E\062A\0644\0641 \0645\0631\0634\062D\0627\062A \0627\0644\0628\064A\0627\0646\0627\062A \0648\0641\0631\0632 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\0645\0631\062C\0639\0629.</p>'),
'',
unistr('<p>\0627\0633\062A\062E\062F\0645 \0627\0644\0632\0631 "\0639\0631\0636" (\0627\0644\0645\062C\0627\0648\0631 \0644\0644\062D\0642\0644 "\0628\062D\062B") \0641\064A \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0637\0631\0642 \0639\0631\0636 \0628\064A\0627\0646\0627\062A \0623\062E\0631\0649 \0631\0628\0645\0627 \062A\0645 \062A\0639\0631\064A\0641\0647\0627 \0628\0648\0627\0633\0637\0629 \0645\0637\0648\0631 \0627\0644\062A\0637\0628\064A\0642. \0643\0645\0627 \064A\0645\0643\0646\0643 \062A\0643\0648\064A\0646 \0631\0633\0645 \0628\064A\0627\0646\064A \0623\0648 \0639\0631\0636 \0631\0633\0645 \0628\064A\0627\0646\064A \0645\0648\062C\0648\062F.</p>  '),
'',
unistr('<p><em>\0645\0644\0627\062D\0638\0629: \0627\0646\0642\0631 \0639\0644\0649 <strong>\062A\0639\0644\064A\0645\0627\062A</strong> \0641\064A \0645\0631\0628\0639\0627\062A \062D\0648\0627\0631 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \0644\0644\062D\0635\0648\0644 \0639\0644\0649 \0645\0632\064A\062F \0645\0646 \0627\0644\0645\0639\0644\0648\0645\0627\062A \0627\0644\062A\0641\0635\064A\0644\064A\0629 \062D\0648\0644 \0627\0644\062F\0627\0644\0629 \0627\0644\0645\062D\062F\062F\0629.</em></p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220496150750751)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0645\0643\0627\0646\064A\0627\062A \0625\0639\062F\0627\062F \0627\0644\062A\0642\0627\0631\064A\0631')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171463903750735)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217270975750750)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \062A\062C\0645\064A\0639 \0627\0644\0623\0639\0645\062F\0629. \064A\062A\0645 \0639\0631\0636 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\062C\0645\0639\0629 \0641\064A \0646\0647\0627\064A\0629 \0627\0644\0628\064A\0627\0646\0627\062A\060C \0623\0648 \0641\064A \062D\0627\0644\0629 \062A\0639\0631\064A\0641 "\0641\0648\0627\0635\0644 \062A\062D\0643\0645" \064A\062A\0645 \0639\0631\0636\0647\0627 \0641\064A \0623\0633\0641\0644 \0643\0644 \0641\0627\0635\0644.</p>'),
'',
unistr('<p><strong>\0642\0627\0626\0645\0629 \0627\0644\062A\062C\0645\064A\0639</strong><br>'),
unistr('\062A\0639\0631\0636 \0642\0627\0626\0645\0629 \0627\0644\062A\062C\0645\064A\0639 \0645\0627 \062A\0645 \062A\0639\0631\064A\0641\0647 \0645\0646 \062A\062C\0645\064A\0639\0627\062A. \0648\064A\0645\0643\0646 \062A\0639\0637\064A\0644 \062A\062C\0645\064A\0639 \0645\0648\062C\0648\062F \0639\0646 \0637\0631\064A\0642 \0625\0644\063A\0627\0621 \062A\062D\062F\064A\062F\0647.<br>'),
unistr('\0627\0646\0642\0631 \0639\0644\0649 "\0625\0636\0627\0641\0629" ( &plus; ) \0644\062A\0643\0648\064A\0646 \062A\062C\0645\064A\0639 \062C\062F\064A\062F\060C \0623\0648 \0639\0644\0649 "\062D\0630\0641" ( &minus; ) \0644\0625\0632\0627\0644\0629 \062A\062C\0645\064A\0639 \0645\0648\062C\0648\062F.</p>'),
'',
unistr('<p><strong>\0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\062C\0645\064A\0639</strong><br>'),
unistr('\0627\0633\062A\062E\062F\0645 \0627\0644\0646\0645\0648\0630\062C \0627\0644\0645\0648\062C\0648\062F \0639\0644\0649 \0627\0644\062C\0627\0646\0628 \0627\0644\0623\064A\0645\0646 \0641\064A \062A\0639\0631\064A\0641 \0627\0644\062A\062C\0645\064A\0639.<br>'),
unistr('\062D\062F\062F \0627\0633\0645 \0627\0644\0639\0645\0648\062F \0648\0646\0648\0639 \0627\0644\062A\062C\0645\064A\0639.<br>'),
unistr('\064A\0645\0643\0646 \0628\0634\0643\0644 \0627\062E\062A\064A\0627\0631\064A \0625\062F\062E\0627\0644 \062A\0644\0645\064A\062D \0628\0634\0623\0646 \0627\0644\062A\062C\0645\064A\0639.<br>'),
unistr('\0641\064A \062D\0627\0644\0629 \0648\062C\0648\062F \0641\0627\0635\0644 \062A\062D\0643\0645 \0645\0639\0631\0641\060C \0641\0625\0646 \062A\062D\062F\064A\062F <strong>\0625\0638\0647\0627\0631 \0627\0644\0642\064A\0645\0629 \0627\0644\0625\062C\0645\0627\0644\064A\0629</strong> \0627\0644\0645\062A\0648\0633\0637 \0627\0644\0625\062C\0645\0627\0644\064A \0623\0648 \0627\0644\0625\062C\0645\0627\0644\064A \0627\0644\0643\0644\064A \0623\0648 \0642\064A\0645\0629 \0645\0634\0627\0628\0647\0629 \0641\064A \0623\0633\0641\0644 \0627\0644\0628\064A\0627\0646\0627\062A.</p>'),
'',
unistr('<p><em>\0645\0644\0627\062D\0638\0629: \064A\0645\0643\0646 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 "\062A\062C\0645\064A\0639" \0639\0646 \0637\0631\064A\0642 \0627\0644\0642\0627\0626\0645\0629 "\0625\062C\0631\0627\0621\0627\062A" \0623\0648 \0628\0627\0644\0646\0642\0631 \0639\0644\0649 \0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F \0648\0627\0644\0645\062C\0645\0648\0639 ( &sum; ).</em></p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219493075750750)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\062A\062C\0645\064A\0639')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217988376750750)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0644\062A\0639\0631\064A\0641 \0631\0633\0645 \0628\064A\0627\0646\064A \064A\0638\0647\0631 \0643\0637\0631\064A\0642\0629 \0639\0631\0636 \0628\064A\0627\0646\0627\062A \0645\0646\0641\0635\0644\0629.<br>'),
unistr('\062D\062F\062F \0646\0648\0639 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0648\0633\0645\0627\062A\0647.</p>'),
unistr('<p><strong>\0633\0645\0627\062A \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A</strong><br>'),
unistr('\062A\062E\062A\0644\0641 \0633\0645\0627\062A \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\0645\062A\0627\062D\0629 \062A\0628\0639\064B\0627 \0644\0646\0648\0639 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A.</p>'),
'<p>',
'<ul>',
unistr('  <li>\062D\062F\062F \0627\0644\0639\0645\0648\062F \0627\0644\0630\064A \064A\062D\062A\0648\064A \0639\0644\0649 \0642\064A\0645\0629 \0627\0644\0633\0645\0629:'),
'    <ul>',
unistr('      <li>\0627\0644\062A\0633\0645\064A\0629 - \0646\0635 \0643\0644 \0646\0642\0637\0629 \0628\064A\0627\0646\0627\062A.</li>'),
unistr('      <li>\0627\0644\0642\064A\0645\0629 - \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\0645\0637\0644\0648\0628 \062A\062E\0637\064A\0637\0647\0627.</li>'),
unistr('      <li>\0627\0644\0633\0644\0633\0644\0629 - \0644\062A\0639\0631\064A\0641 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\062F\064A\0646\0627\0645\064A\0643\064A \0645\062A\0639\062F\062F \0627\0644\0633\0644\0627\0633\0644.</li>'),
unistr('      <li>\0641\062A\062D - \0633\0639\0631 \0627\0644\0641\062A\062D \0627\0644\064A\0648\0645\064A \0644\0644\0623\0633\0647\0645 (\0627\0644\0623\0633\0647\0645 \0641\0642\0637).</li>'),
unistr('      <li>\0625\0642\0641\0627\0644 - \0633\0639\0631 \0627\0644\0625\0642\0641\0627\0644 \0627\0644\064A\0648\0645\064A \0644\0644\0623\0633\0647\0645 (\0627\0644\0623\0633\0647\0645 \0641\0642\0637).</li>'),
unistr('      <li>\0645\0631\062A\0641\0639 - \0627\0644\0642\064A\0645\0629 \0627\0644\0645\0631\062A\0641\0639\0629 (\0627\0644\0646\0637\0627\0642 \0648\0627\0644\0623\0633\0647\0645 \0641\0642\0637).</li>'),
unistr('      <li>\0645\0646\062E\0641\0636 - \0627\0644\0642\064A\0645\0629 \0627\0644\0645\0646\062E\0641\0636\0629 (\0627\0644\0646\0637\0627\0642 \0648\0627\0644\0623\0633\0647\0645).</li>'),
unistr('      <li>\0627\0644\062D\062C\0645 - \062D\062C\0645 \0627\0644\062A\062F\0627\0648\0644 \0627\0644\064A\0648\0645\064A \0644\0644\0623\0633\0647\0645 (\0627\0644\0623\0633\0647\0645 \0641\0642\0637).</li>'),
unistr('      <li>\0627\0644\0647\062F\0641 - \0627\0644\0642\064A\0645\0629 \0627\0644\0647\062F\0641 (\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\0642\0645\0639\064A).</li>'),
unistr('      <li>\0633 - \0642\064A\0645\0629 \0627\0644\0645\062D\0648\0631 \0633 (\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\0641\0642\0627\0639\064A \0648\0627\0644\0645\0628\0639\062B\0631 \0641\0642\0637).</li>'),
unistr('      <li>\0635 - \0642\064A\0645\0629 \0627\0644\0645\062D\0648\0631 \0635 (\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\0641\0642\0627\0639\064A \0648\0627\0644\0645\0628\0639\062B\0631 \0641\0642\0637).</li>'),
unistr('      <li>\0639 - \0639\0631\0636 \0627\0644\0634\0631\064A\0637 \0623\0648 \0646\0635\0641 \0642\0637\0631 \0627\0644\0641\0642\0627\0639\0629 (\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\0641\0642\0627\0639\064A \0648\0627\0644\0645\0628\0639\062B\0631 \0641\0642\0637).</li>'),
'    </ul>',
'  </li>',
unistr('  <li>\0627\0644\0627\062A\062C\0627\0647 - \0627\0644\0639\0631\0636 \0631\0623\0633\064A\064B\0627 \0623\0648 \0623\0641\0642\064A\064B\0627.</li>'),
unistr('  <li>\0627\0644\062A\062C\0645\064A\0639 - \062A\062D\062F\064A\062F \0643\064A\0641\064A\0629 \062A\062C\0645\064A\0639 \0642\064A\0645 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A.</li>'),
unistr('  <li>\0627\0644\0645\0643\062F\0633 - \062A\062D\062F\064A\062F \0625\0630\0627 \0645\0627 \0643\0627\0646\062A \0639\0646\0627\0635\0631 \0627\0644\0628\064A\0627\0646\0627\062A \0645\0643\062F\0633\0629.</li>'),
unistr('  <li>\0641\0631\0632 \062D\0633\0628 - \0627\0644\0641\0631\0632 \062D\0633\0628 \0627\0644\062A\0633\0645\064A\0629 \0623\0648 \0627\0644\0642\064A\0645\0629 (\0627\0644\0642\064A\0645).'),
'    <ul>',
unistr('      <li>\0627\0644\0627\062A\062C\0627\0647 - \0641\0631\0632 \0627\0644\0642\064A\0645 \0628\062A\0631\062A\064A\0628 \062A\0635\0627\0639\062F\064A \0623\0648 \062A\0646\0627\0632\0644\064A.</li>'),
unistr('      <li>\0627\0644\0642\064A\0645 \0627\0644\0641\0627\0631\063A\0629 - \062A\062D\062F\064A\062F \0643\064A\0641\064A\0629 \0641\0631\0632 \0627\0644\0633\062C\0644\0627\062A \0630\0627\062A \0627\0644\0642\064A\0645 \0627\0644\0641\0627\0631\063A\0629 \0645\0642\0627\0631\0646\0629 \0628\0627\0644\0633\062C\0644\0627\062A \0630\0627\062A \0627\0644\0642\064A\0645 \063A\064A\0631 \0627\0644\0641\0627\0631\063A\0629.</li>'),
'    </ul>',
'  </li>',
unistr('  <li>\0627\0644\0645\0646\0627\0632\0644 \0627\0644\0639\0634\0631\064A\0629</li>'),
unistr('  <li>\0639\0646\0648\0627\0646 \0645\062D\0648\0631 \0627\0644\062A\0633\0645\064A\0629</li>'),
unistr('  <li>\0639\0646\0648\0627\0646 \0645\062D\0648\0631 \0627\0644\0642\064A\0645\0629</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219874305750751)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216985378750750)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0644\0627\062E\062A\064A\0627\0631 \0623\064A \0627\0644\0623\0639\0645\062F\0629 \0633\064A\062A\0645 \0639\0631\0636\0647\0627 \0648\0628\0623\064A \062A\0631\062A\064A\0628.</p>'),
'',
unistr('<p>\064A\0645\0643\0646 \0625\062E\0641\0627\0621 \0627\0644\0639\0645\0648\062F \0639\0646 \0637\0631\064A\0642 \0625\0644\063A\0627\0621 \062A\062D\062F\064A\062F\0647.<br>'),
unistr('\0643\0645\0627 \064A\0645\0643\0646 \0625\0639\0627\062F\0629 \062A\0631\062A\064A\0628 \0627\0644\0623\0639\0645\062F\0629 \0628\0627\0644\0646\0642\0631 \0639\0644\0649 \0646\0642\0644 \0644\0623\0639\0644\0649 ( &uarr; ) \0623\0648 \0646\0642\0644 \0644\0623\0633\0641\0644 ( &darr; ).<br>'),
unistr('\0627\0633\062A\062E\062F\0645 \0627\0644\0645\064F\062D\062F\0650\062F \0627\0644\0645\0646\0633\062F\0644 \0644\0639\0631\0636 "\0643\0644" \0627\0644\0623\0639\0645\062F\0629 \0623\0648 "\0627\0644\0645\0639\0631\0648\0636" \0623\0648 "\063A\064A\0631 \0627\0644\0645\0639\0631\0648\0636" \0645\0646 \0627\0644\0623\0639\0645\062F\0629.</p>'),
'',
unistr('<p>\0628\0634\0643\0644 \0627\062E\062A\064A\0627\0631\064A\060C \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645 \0627\0644\0646\0645\0648\0630\062C \0641\064A \062A\062D\062F\064A\062F \0627\0644\062D\062F \0627\0644\0623\062F\0646\0649 \0644\0639\0631\0636 \0639\0645\0648\062F \0628\0627\0644\0628\0643\0633\0644.</p>'),
'',
unistr('<p><em>\0645\0644\0627\062D\0638\0629: \064A\0645\0643\0646\0643 \0643\0630\0644\0643 \0625\0639\0627\062F\0629 \062A\0631\062A\064A\0628 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629 \0628\0627\0644\0646\0642\0631 \0639\0644\0649 \0645\0642\0628\0636 \0627\0644\0633\062D\0628 (\0641\064A \0628\062F\0627\064A\0629 \0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F) \0648\0633\062D\0628 \0627\0644\0639\0645\0648\062F \0625\0644\0649 \0627\0644\064A\0645\064A\0646 \0623\0648 \0625\0644\0649 \0627\0644\064A\0633\0627\0631. \0648\0628\0645\0642\062F\0648\0631\0643 \0623\064A\0636\064B\0627 \062A\063A\064A\064A\0631 \0639\0631\0636 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629 \0639\0646 \0637\0631\064A\0642 \062A\062D\062F\064A\062F \0641\0627\0635\0644 \0627\0644\0623\0639\0645\062F\0629\060C \0627\0644\0648\0627\0642\0639 \0628\064A\0646 \0627\0644\0639\0646\0627\0648\064A\0646\060C \0648\0646\0642\0644\0647 \0625\0644\0649 \0627\0644\064A\0645\064A\0646 \0623\0648 ')
||unistr('\0625\0644\0649 \0627\0644\064A\0633\0627\0631.</em></p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219712087750751)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\0623\0639\0645\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217333311750750)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \062A\0639\0631\064A\0641 \0623\0639\0645\062F\0629 \0625\0636\0627\0641\064A\0629 \0627\0633\062A\0646\0627\062F\064B\0627 \0625\0644\0649 \062D\0633\0627\0628\0627\062A \062A\0642\0648\0645 \0639\0644\0649 \0627\0644\0631\064A\0627\0636\064A\0627\062A \0648\0627\0644\062F\0648\0627\0644 \064A\062A\0645 \0625\062C\0631\0627\0624\0647\0627 \0639\0644\0649 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0648\062C\0648\062F\0629.</p>'),
'',
unistr('<p><strong>\0642\0627\0626\0645\0629 \0627\0644\062D\0633\0627\0628</strong><br>'),
unistr('\062A\0639\0631\0636 \0642\0627\0626\0645\0629 "\0627\0644\062D\0633\0627\0628" \0645\0627 \062A\0645 \062A\0639\0631\064A\0641\0647 \0645\0646 \062D\0633\0627\0628\0627\062A. \0648\064A\0645\0643\0646 \062A\0639\0637\064A\0644 \062D\0633\0627\0628 \0645\0648\062C\0648\062F \0639\0646 \0637\0631\064A\0642 \0625\0644\063A\0627\0621 \062A\062D\062F\064A\062F\0647.<br>'),
unistr('\0627\0646\0642\0631 \0639\0644\0649 "\0625\0636\0627\0641\0629" ( &plus; ) \0644\0625\0636\0627\0641\0629 \062D\0633\0627\0628 \062C\062F\064A\062F\060C \0627\0648 \0639\0644\0649 "\062D\0630\0641" ( &minus; ) \0644\0625\0632\0627\0644\0629 \062D\0633\0627\0628 \0645\0648\062C\0648\062F.</p>'),
'',
unistr('<p><strong>\0625\0639\062F\0627\062F\0627\062A \0627\0644\062D\0633\0627\0628</strong><br>'),
unistr('\0627\0633\062A\062E\062F\0645 \0627\0644\0646\0645\0648\0630\062C \0641\064A \062A\0639\0631\064A\0641 \0627\0644\062D\0633\0627\0628.<br>'),
unistr('\0623\062F\062E\0644 \062A\0641\0627\0635\064A\0644 \0627\0644\0639\0645\0648\062F\060C \0645\062B\0644 \0627\0644\0639\0646\0648\0627\0646 \0648\0627\0644\062A\0633\0645\064A\0629 \0648\062D\062F\062F \0625\0639\062F\0627\062F\0627\062A \0627\0644\0645\062D\0627\0630\0627\0629.<br> '),
unistr('\0627\0633\062A\062E\062F\0645 \0645\0633\0627\062D\0629 \0646\0635 "\0627\0644\062A\0639\0628\064A\0631" \0641\064A \0625\062F\062E\0627\0644 \0627\0644\0639\0645\0648\062F/\0627\0644\0623\0639\0645\062F\0629 \0648\0645\0627 \064A\0642\062A\0631\0646 \0628\0647\0627 \0645\0646 \062F\0648\0627\0644 \0644\0625\062C\0631\0627\0621 \0627\0644\062D\0633\0627\0628.<br>'),
unistr('\062D\062F\062F \0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\0645\0644\0627\0626\0645\060C \0645\0639 \0642\0646\0627\0639 \062A\0646\0633\064A\0642 \0627\062E\062A\064A\0627\0631\064A\060C \0644\0644\0639\0645\0648\062F \0627\0644\062C\062F\064A\062F.</p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219328322750750)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\062D\0633\0627\0628')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217662917750750)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \062A\0639\0631\064A\0641 \0641\0627\0635\0644 \062A\062D\0643\0645 \0641\064A \0639\0645\0648\062F \0623\0648 \0623\0643\062B\0631.</p>'),
'',
unistr('<p><strong>\0642\0627\0626\0645\0629 \0641\0627\0635\0644 \0627\0644\062A\062D\0643\0645</strong><br>'),
unistr('\062A\0639\0631\0636 \0642\0627\0626\0645\0629 "\0641\0627\0635\0644 \0627\0644\062A\062D\0643\0645" \0645\0627 \062A\0645 \062A\0639\0631\064A\0641\0647 \0645\0646 \0641\0648\0627\0635\0644 \0627\0644\062A\062D\0643\0645. \0648\064A\0645\0643\0646 \062A\0639\0637\064A\0644 \0639\0645\0648\062F \0641\0627\0635\0644 \062A\062D\0643\0645 \0645\0648\062C\0648\062F \0639\0646 \0637\0631\064A\0642 \0625\0644\063A\0627\0621 \062A\062D\062F\064A\062F\0647.<br>'),
unistr('\0627\0646\0642\0631 \0639\0644\0649 "\0625\0636\0627\0641\0629" ( &plus; ) \0644\062A\0636\0645\064A\0646 \0639\0645\0648\062F \062C\062F\064A\062F \0641\064A \0641\0627\0635\0644 \0627\0644\062A\062D\0643\0645\060C \0623\0648 \0627\0646\0642\0631 \0639\0644\0649 "\062D\0630\0641" ( &minus; ) \0644\0625\0632\0627\0644\0629 \0639\0645\0648\062F \0645\0648\062C\0648\062F \0645\0646 \0641\0627\0635\0644 \0627\0644\062A\062D\0643\0645.<br>'),
unistr('\0644\0625\0639\0627\062F\0629 \062A\0631\062A\064A\0628 \0627\0644\0623\0639\0645\062F\0629\060C \0627\0646\0642\0631 \0639\0644\0649 "\0646\0642\0631 \0644\0623\0639\0644\0649" ( &uarr; ) \0623\0648 "\0646\0642\0644 \0644\0623\0633\0641\0644" ( &darr; ) \0644\0646\0642\0644 \0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\062F\062F \0623\0639\0644\0649 \0623\0648 \0623\0633\0641\0644 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0623\062E\0631\0649.</p>'),
'',
unistr('<p><strong>\0625\0639\062F\0627\062F\0627\062A \0641\0627\0635\0644 \0627\0644\062A\062D\0643\0645</strong><br>'),
unistr('\0627\0633\062A\062E\062F\0645 \0627\0644\0646\0645\0648\0630\062C \0641\064A \062A\0639\0631\064A\0641 \0639\0645\0648\062F \0641\0627\0635\0644 \0627\0644\062A\062D\0643\0645.<br>'),
unistr('\062A\062A\0639\0644\0642 \0627\0644\0625\0639\062F\0627\062F\0627\062A \0628\062A\062D\062F\064A\062F \0639\0645\0648\062F \0641\0627\0635\0644 \0627\0644\062A\062D\0643\0645\060C \0648\0627\062A\062C\0627\0647 \0627\0644\0641\0631\0632\060C \0648\0643\064A\0641\064A\0629 \062A\0631\062A\064A\0628 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0641\0627\0631\063A\0629 (\0623\064A \0627\0644\0623\0639\0645\062F\0629 \063A\064A\0631 \0627\0644\0645\0634\062A\0645\0644\0629 \0639\0644\0649 \0642\064A\0645).</p>'),
'',
unistr('<p><em>\0645\0644\0627\062D\0638\0629: \0639\0646\062F \0639\0631\0636 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629\060C \064A\0645\0643\0646 \062A\0639\0631\064A\0641 \0641\0627\0635\0644 \062A\062D\0643\0645 \0628\0627\0644\0646\0642\0631 \0639\0644\0649 "\0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F" \0648\062A\062D\062F\064A\062F \0623\064A\0642\0648\0646\0629 \0641\0627\0635\0644 \0627\0644\062A\062D\0643\0645.</em></p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219075938750750)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0641\0648\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217872544750750)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \062A\0646\0632\064A\0644 \0643\0644 \0627\0644\0635\0641\0648\0641 \0627\0644\062D\0627\0644\064A\0629 \0641\064A \0645\0644\0641 \062E\0627\0631\062C\064A. \0648\0633\0648\0641 \064A\0634\062A\0645\0644 \0627\0644\0645\0644\0641 \0641\0642\0637 \0639\0644\0649 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629 \062D\0627\0644\064A\064B\0627\060C \0628\0627\0633\062A\062E\062F\0627\0645 \0623\064A\0629 \0645\0631\0634\062D\0627\062A \0648\0639\0645\0644\064A\0627\062A \0641\0631\0632 \0645\0637\0628\0642\0629 \0639\0644\0649 \0627\0644\0628\064A\0627\0646\0627\062A.</p>'),
'',
unistr('<p>\062D\062F\062F \062A\0646\0633\064A\0642 \0627\0644\0645\0644\0641 \0648\0627\0636\063A\0637 \0639\0644\0649 "\062A\0646\0632\064A\0644".<br>'),
unistr('\0645\0644\0627\062D\0638\0629: \0644\0646 \064A\0634\062A\0645\0644 \0645\0644\0641 CSV \0639\0644\0649 \062A\0646\0633\064A\0642 \0646\0635\064A \0645\062B\0644 \0627\0644\062A\062C\0645\064A\0639\0627\062A \0648\0641\0648\0627\0635\0644 \0627\0644\062A\062D\0643\0645.</p>'),
'',
unistr('<p>\0644\0625\0631\0633\0627\0644 \0627\0644\0645\0644\0641 \0639\0628\0631 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A\060C \062D\062F\062F "\0625\0631\0633\0627\0644 \0643\0631\0633\0627\0644\0629 \0625\0644\0643\062A\0631\0648\0646\064A\0629" \0648\0623\062F\062E\0644 \062A\0641\0627\0635\064A\0644 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A (\0627\0644\0645\062A\0644\0642\064A\060C \0627\0644\0645\0648\0636\0648\0639\060C \0627\0644\0631\0633\0627\0644\0629).</p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218836131750750)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\062A\0646\0632\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217011567750750)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \062A\0643\0648\064A\0646 \0645\0631\0634\062D\0627\062A \0627\0644\0628\064A\0627\0646\0627\062A \0648\0627\0644\062A\064A \062A\0642\0644\0644 \0645\0646 \0639\062F\062F \0627\0644\0635\0641\0648\0641 \0627\0644\0631\0627\062C\0639\0629.</p>'),
'',
unistr('<p><strong>\0642\0627\0626\0645\0629 \0627\0644\0645\0631\0634\062D\0627\062A</strong><br>'),
unistr('\062A\0639\0631\0636 \0642\0627\0626\0645\0629 \0627\0644\0645\0631\0634\062D\0627\062A \0645\0627 \062A\0645 \062A\0639\0631\064A\0641\0647 \0645\0646 \0645\0631\0634\062D\0627\062A. \0648\064A\0645\0643\0646 \062A\0639\0637\064A\0644 \0645\0631\0634\062D \0645\0648\062C\0648\062F \0639\0646 \0637\0631\064A\0642 \0625\0644\063A\0627\0621 \062A\062D\062F\064A\062F\0647.<br>'),
unistr('\0627\0646\0642\0631 \0639\0644\0649 "\0625\0636\0627\0641\0629" ( &plus; ) \0644\0645\0633\062D \0645\0631\0634\062D \062C\062F\064A\062F\060C \0623\0648 \0639\0644\0649 "\062D\0630\0641" ( &minus; ) \0644\0625\0632\0627\0644\0629 \0645\0631\0634\062D \0645\0648\062C\0648\062F.</p>'),
'',
unistr('<p><strong>\0625\0639\062F\0627\062F\0627\062A \0627\0644\0645\0631\0634\062D</strong><br>'),
unistr('\0627\0633\062A\062E\062F\0645 \0627\0644\0646\0645\0648\0630\062C \0641\064A \062A\0639\0631\064A\0641 \062E\0635\0627\0626\0635 \0627\0644\0645\0631\0634\062D.<br>'),
unistr('\062A\062D\062F\064A\062F \0646\0648\0639 \0627\0644\0645\0631\0634\062D \0627\0644\0645\0644\0627\0626\0645:<br>'),
unistr('&nbsp;&nbsp;&nbsp;\0635\0641 - \0645\0631\0634\062D \0644\0644\0628\062D\062B \0639\0646 \0645\0635\0637\0644\062D \0641\064A \0623\064A \0639\0645\0648\062F \0642\0627\0628\0644 \0644\0644\062A\0631\0634\064A\062D.<br>'),
unistr('&nbsp;&nbsp;&nbsp;\0639\0645\0648\062F - \062A\0631\0634\064A\062D \0639\0645\0648\062F \0628\0639\064A\0646\0647 \0628\0627\0633\062A\062E\062F\0627\0645 \0639\0627\0645\0644 \0648\0642\064A\0645\0629 \0628\0639\064A\0646\0647\0645\0627.</p>'),
'',
unistr('<p><em>\0645\0644\0627\062D\0638\0629: \0639\0646\062F \0639\0631\0636 \0634\0628\0643\0629 \062A\0641\0627\0639\0644\064A\0629\060C \064A\0645\0643\0646 \062A\0639\0631\064A\0641 \0645\0631\0634\062D\0627\062A \0635\0641 \0639\0646 \0637\0631\064A\0642 \0627\0644\0643\062A\0627\0628\0629 \0641\064A \0627\0644\062D\0642\0644 "\0628\062D\062B". \0648\0627\0644\0646\0642\0631 \0639\0644\0649 "\062A\062D\062F\064A\062F \0623\0639\0645\062F\0629 \0644\0644\0628\062D\062B" \0628\063A\0631\0636 \0642\0635\0631 \0627\0644\0628\062D\062B \0639\0644\0649 \0623\0639\0645\062F\0629 \0645\0639\064A\0646\0629. \0648\064A\0645\0643\0646 \0643\0625\062C\0631\0627\0621 \0628\062F\064A\0644\060C \0641\062A\062D \0642\0627\0626\0645\0629 "\0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F" \0648\062A\062D\062F\064A\062F \0642\064A\0645\0629 \0644\062A\0643\0648\064A\0646 \0645\0631\0634\062D \0639\0645\0648\062F.</em></p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219658882750751)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\0645\0631\0634\062D')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217441102750750)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \0639\0631\0636 \0627\0644\0628\064A\0627\0646\0627\062A \0643\0645\0627 \0643\0627\0646\062A \0641\064A \0646\0642\0637\0629 \0633\0627\0628\0642\0629 \0641\064A \0627\0644\0645\0627\0636\064A.</p>'),
unistr('<p>\0623\062F\062E\0644 \0639\062F\062F \0627\0644\062F\0642\0627\0626\0642 \0641\064A \0627\0644\0645\0627\0636\064A \0644\0625\062C\0631\0627\0621 \0627\0633\062A\0639\0644\0627\0645 \0639\0646 \0628\064A\0627\0646\0627\062A \062A\0627\0631\064A\062E\064A\0629.</p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219237943750750)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\0627\0631\064A\062E\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219939590750751)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217578094750750)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \062A\0645\064A\064A\0632 \0635\0641\0648\0641 \0623\0648 \0623\0639\0645\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \062A\0628\0639\064B\0627 \0644\0634\0631\0637 \062A\0645 \0625\062F\062E\0627\0644\0647.</p>'),
'',
unistr('<p><strong>\0642\0627\0626\0645\0629 \0627\0644\062A\0645\064A\064A\0632</strong><br>'),
unistr('\062A\0639\0631\0636 \0642\0627\0626\0645\0629 "\0627\0644\062A\0645\064A\064A\0632" \0645\0627 \062A\0645 \062A\0639\0631\064A\0641\0647 \0645\0646 \062A\0645\064A\064A\0632\0627\062A. \0648\064A\0645\0643\0646 \062A\0639\0637\064A\0644 \062A\0645\064A\064A\0632 \0645\0648\062C\0648\062F \0639\0646 \0637\0631\064A\0642 \0625\0644\063A\0627\0621 \062A\062D\062F\064A\062F\0647.<br>'),
unistr('\0627\0646\0642\0631 \0639\0644\0649 "\0625\0636\0627\0641\0629" ( &plus; ) \0644\062A\0643\0648\064A\0646 \062A\0645\064A\064A\0632 \062C\062F\064A\062F\060C \0623\0648 \0627\0646\0642\0631 \0639\0644\0649 "\062D\0630\0641" ( &minus; ) \0644\0625\0632\0627\0644\0629 \062A\0645\064A\064A\0632 \0645\0648\062C\0648\062F.</p>'),
unistr('<p><strong>\0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0645\064A\064A\0632</strong><br>'),
unistr('\0627\0633\062A\062E\062F\0645 \0627\0644\0646\0645\0648\0630\062C \0641\064A \062A\0639\0631\064A\0641 \062E\0635\0627\0626\0635 \0627\0644\062A\0645\064A\064A\0632.<br>'),
unistr('\0623\062F\062E\0644 \0627\0644\0627\0633\0645\060C \0648\062D\062F\062F "\0635\0641" \0623\0648 "\0639\0645\0648\062F" \062B\0645 \062D\062F\062F \0631\0645\0648\0632 \0623\0644\0648\0627\0646 HTML\0644\0644\062E\0644\0641\064A\0629 \0648\0627\0644\0646\0635.<br>'),
unistr('\062D\062F\062F <strong>\0646\0648\0639 \0627\0644\0634\0631\0637</strong> \0627\0644\0645\0644\0627\0626\0645 \0644\062A\0645\064A\064A\0632 \0628\064A\0627\0646\0627\062A \0645\062D\062F\062F\0629:<br>'),
unistr('&nbsp;&nbsp;&nbsp;\0635\0641 - \062A\0645\064A\064A\0632 \0627\0644\0645\0635\0637\0644\062D \0641\064A \0623\064A \0639\0645\0648\062F.<br>'),
unistr('&nbsp;&nbsp;&nbsp;\0639\0645\0648\062F - \0627\0644\062A\0645\064A\064A\0632 \0641\064A \0639\0645\0648\062F \0645\062D\062F\062F \062A\0628\0639\064B\0627 \0644\0639\0627\0645\0644 \0648\0642\064A\0645\0629 \0628\0639\064A\0646\0647\0645\0627.</p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219173358750750)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\062A\0645\064A\064A\0632')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217709945750750)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \062D\0641\0638 \0627\0644\062A\063A\064A\064A\0631\0627\062A \0627\0644\062A\064A \0623\062C\0631\064A\062A\0647\0627 \0639\0644\0649 \0646\0633\0642 \0627\0644\0634\0628\0643\0629 \0627\0644\062D\0627\0644\064A\0629 \0648\0639\0644\0649 \0627\0644\062A\0643\0648\064A\0646.<br>'),
unistr('\0628\0648\0633\0639 \0645\0637\0648\0631\064A \0627\0644\062A\0637\0628\064A\0642\0627\062A \062A\0639\0631\064A\0641 \0627\0644\0639\062F\064A\062F \0645\0646 \0646\064F\0633\0642 \0627\0644\062A\0642\0627\0631\064A\0631 \0627\0644\0628\062F\064A\0644\0629. \0648\0645\062A\0649 \0623\0645\0643\0646\060C \064A\0645\0643\0646\0643 \0623\0646\062A \0648\0633\0648\0627\0643 \0645\0646 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646 \062D\0641\0638 \062A\0642\0631\064A\0631 \0628\0648\0635\0641\0647 "\0639\0627\0645"\060C \0645\0645\0627 \064A\062C\0639\0644\0647 \0645\062A\0627\062D\064B\0627 \0644\0643\0644 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646 \0639\0644\0649 \0627\0644\0634\0628\0643\0629. \064A\0645\0643\0646\0643 \0643\0630\0644\0643 \062D\0641\0638 \062A\0642\0631\064A\0631 \0628\0648\0635\0641\0647 \062A\0642\0631\064A\0631\064B\0627 "\062E\0627\0635" \0644\0627 \064A\064F\0633\0645\062D \0644\0623\062D\062F \0633\0648\0627\0643 \0628\0627\0644\0627\0637\0644\0627\0639 \0639\0644\064A\0647.</p>'),
unistr('<p>\0627\062E\062A\0631 \0645\0646 \0628\064A\0646 \0627\0644\0623\0646\0648\0627\0639 \0627\0644\0645\062A\0627\062D\0629 \0648\0623\062F\062E\0644 \0627\0633\0645\064B\0627 \0644\0644\062A\0642\0631\064A\0631 \0627\0644\0645\062D\0641\0648\0638.</p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218961190750750)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\062A\0642\0631\064A\0631'),
''))
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137217170564750750)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062A\062E\062F\0645 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0641\064A \062A\0639\064A\064A\0646 \062A\0631\062A\064A\0628 \0627\0644\0623\0639\0645\062F\0629.</p>'),
'',
unistr('<p><strong>\0642\0627\0626\0645\0629 \0627\0644\0641\0631\0632</strong><br>'),
unistr('\064A\0639\0631\0636 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 "\0641\0631\0632" \0642\0627\0626\0645\0629 \0628\0642\0648\0627\0639\062F \0627\0644\0641\0631\0632 \0627\0644\0645\0643\0648\0646\0629.<br>'),
unistr('\0627\0646\0642\0631 \0639\0644\0649 "\0625\0636\0627\0641\0629" ( &plus; ) \0644\062A\0643\0648\064A\0646 \0639\0645\0648\062F \0641\0631\0632\060C \0623\0648 \0639\0644\0649 "\062D\0630\0641" ( &minus; ) \0644\0625\0632\0627\0644\0629 \0639\0645\0648\062F \0641\0631\0632.<br>'),
unistr('\0627\0646\0642\0631 \0639\0644\0649 "\0646\0642\0644 \0644\0623\0639\0644\0649" ( &uarr; ) \0648"\0646\0642\0644 \0644\0623\0633\0641\0644" ( &darr; ) \0644\0646\0642\0644 \0639\0645\0648\062F \0627\0644\0641\0631\0632 \0627\0644\0645\062D\062F\062F \0623\0639\0644\0649 \0623\0648 \0623\0633\0641\0644 \0623\0639\0645\062F\0629 \0627\0644\0641\0631\0632 \0627\0644\0623\062E\0631\0649.</p>'),
'',
unistr('<p><strong>\0625\0639\062F\0627\062F\0627\062A \0627\0644\0641\0631\0632</strong><br>'),
unistr('\062A\062D\062F\064A\062F \0639\0645\0648\062F \0627\0644\0641\0631\0632 \0648\0627\062A\062C\0627\0647 \0627\0644\0641\0631\0632 \0648\0643\064A\0641\064A\0629 \062A\0631\062A\064A\0628 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0641\0627\0631\063A\0629 (\0623\064A \0627\0644\0623\0639\0645\062F\0629 \063A\064A\0631 \0627\0644\0645\0634\062A\0645\0644\0629 \0639\0644\0649 \0642\064A\0645\0629).</p>'),
'',
unistr('<p><em>\0645\0644\0627\062D\0638\0629: \064A\0645\0643\0646 \0641\0631\0632 \0627\0644\0628\064A\0627\0646\0627\062A \062D\0633\0628 \0627\0644\0623\0639\0645\062F\0629 \063A\064A\0631 \0627\0644\0645\0639\0631\0648\0636\0629\061B \0639\0644\0645\064B\0627 \0628\0623\0646\0647 \0644\064A\0633\062A \062C\0645\064A\0639 \0627\0644\0623\0639\0645\062F\0629 \0642\0627\0628\0644\0629 \0644\0644\0641\0631\0632.</em><br>'),
unistr('<em>\064A\0645\0643\0646 \0641\0631\0632 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629 \0628\0627\0644\0636\063A\0637 \0639\0644\0649 \0633\0647\0645 \0644\0623\0639\0644\0649 (\062A\0635\0627\0639\062F\064A) \0623\0648 \0633\0647\0645 \0644\0623\0633\0641\0644 (\062A\0646\0627\0632\0644\064A) \0627\0644\0645\0648\062C\0648\062F\0629 \0641\064A \0646\0647\0627\064A\0629 \0639\0646\0627\0648\064A\0646 \0627\0644\0623\0639\0645\062F\0629. \0648\0644\0625\0636\0627\0641\0629 \0639\0645\0648\062F \062A\0627\0644\064D \0625\0644\0649 \0641\0631\0632 \0645\0648\062C\0648\062F\060C \064A\0644\0632\0645 \0627\0644\0636\063A\0637 \0628\0627\0633\062A\0645\0631\0627\0631 \0639\0644\0649 \0627\0644\0645\0641\062A\0627\062D Shift \0645\0639 \0627\0644\0646\0642\0631 \0639\0644\0649 \0633\0647\0645 \0644\0623\0639\0644\0649 \0623\0648 \0644\0623\0633\0641\0644.</em></p>')))
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137219502024750750)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\0641\0631\0632')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218754872750750)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\0627\0634\062A\0631\0627\0643')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172370824750736)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062E\0641\0627\0621')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136785640750724)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\064A\064A\0632')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205909075750746)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\062A\0641\0639')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206768119750746)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0641\0642\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165391801750733)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0627\0639\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170317589750735)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\064A\0642\0648\0646\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135648341750724)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\0623\064A\0642\0648\0646\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163574249750733)
,p_name=>'APEX.IG.IN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171913868750735)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F \063A\064A\0631 \0646\0634\0637')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172050633750736)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F\0627\062A \063A\064A\0631 \0646\0634\0637\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179661650750738)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \062F\0627\062E\0644\064A \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0637\0644\0628 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067547801750703)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0645\0631\0634\062D \0627\0644\0639\0645\0648\062F "%0" \063A\064A\0631 \0645\062F\0639\0648\0645 \0644\0644\0639\0645\0648\062F "%1".')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218572456750750)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\064A\063A\0629 \062A\0627\0631\064A\062E \063A\064A\0631 \0635\0627\0644\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193328238750742)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \062A\062F\0639\0645 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \062A\0639\0631\064A\0641 \0645\0631\0634\062D \0641\064A \0627\0644\0639\0645\0648\062F %0.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193219815750742)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0646\0648\0639 \0645\0639\0631\0641 \064A\0635\0644\062D \0644\0644\062A\0639\0631\064A\0641 \0641\064A \0634\0628\0643\0629 \062A\0641\0627\0639\0644\064A\0629.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074161602750705)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\064A\063A\0629 \0631\0642\0645 \063A\064A\0631 \0635\0627\0644\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221243615750751)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F \063A\064A\0631 \0635\0627\0644\062D')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221341807750751)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F\0627\062A \063A\064A\0631 \0635\0627\0644\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212446449750748)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0639\064A\064A\0646 \0627\0644\0641\0631\0632 \062D\0633\0628 \0639\0644\0649 %0\060C \0644\0643\0646 \0644\0645 \064A\062A\0645 \062A\062D\062F\064A\062F \0639\0645\0648\062F \0644\0640 %0.')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209730443750747)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0645\0629 \063A\064A\0631 \0635\0627\0644\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204890438750746)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\0631\0636')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164398410750733)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A \0622\062E\0631')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164565821750733)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163459371750733)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0641\0627\0631\063A\064B\0627')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163344010750733)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0627\0631\063A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213265390750748)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0633\0645\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205210953750746)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0633\0645\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209108350750747)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\062E\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153671157750730)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\064A\0648\0645 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153833722750730)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 \0633\0627\0639\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154330655750730)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062F\0642\064A\0642\0629 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153373293750730)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153425092750730)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0633\0628\0648\0639 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153568178750730)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 %0 \0645\0646 \0627\0644\0623\064A\0627\0645')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153757903750730)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 %0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154403112750730)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154216692750730)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0634\0647\0648\0631 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154127941750730)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153134162750730)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 %0 \0645\0646 \0627\0644\0633\0646\0648\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153228060750730)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0646\0629 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213420426750749)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062D\0627\0630\0627\0629 \0627\0644\062E\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213525138750749)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\062E\062F\0627\0645 \0645\062C\0645\0648\0639\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163964714750733)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0642\0644 \0645\0646')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164085291750733)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0642\0644 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207351270750747)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207432844750747)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\064A \0645\0639 \0645\0633\0627\062D\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213895049750749)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'ar'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206059317750746)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\062E\0641\0636')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216380994750749)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0645 \0628\0641\0635\0644 \0627\0644\0639\0646\0627\0648\064A\0646 \0627\0644\0645\062A\0639\062F\062F\0629 \0628\0641\0627\0635\0644\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165142644750733)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0637\0627\0628\0642 \0627\0644\062A\0639\0628\064A\0631 \0627\0644\0639\0627\062F\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189596161750741)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\0642\0635\0649')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223845730750752)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0627\0644\0625\062C\0645\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189724838750741)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0633\064A\0637')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223907622750752)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0633\064A\0637 \0627\0644\0625\062C\0645\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189419679750741)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\062F\0646\0649')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165241636750733)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0642\0627\0626\0642')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190259518750741)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 \062F\0642\0627\0626\0642')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223770525750752)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\062F\0646\0649 \0627\0644\0625\062C\0645\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165653047750734)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0647\0648\0631')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172220606750736)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062A\0648\064A \0627\0644\0628\064A\0627\0646\0627\062A \0639\0644\0649 \0645\0627 \064A\0632\064A\062F \0639\0646 %0 \0645\0646 \0627\0644\0635\0641\0648\0641 \0648\0647\0630\0627 \064A\062A\062C\0627\0648\0632 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0627\0644\0645\0633\0645\0648\062D \0628\0647. \0627\0644\0631\062C\0627\0621 \062A\0637\0628\064A\0642 \0645\0631\0634\062D\0627\062A \0625\0636\0627\0641\064A\0629 \0644\0639\0631\0636 \0627\0644\0646\062A\0627\0626\062C.')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198028567750744)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0627\0644\0645\0639\0631\0641 \0627\0644\062B\0627\0628\062A \0644\0644\0645\0646\0637\0642\0629 \0644\0623\0646 \0627\0644\0635\0641\062D\0629 \062A\062D\062A\0648\064A \0639\0644\0649 \0639\062F\0629 \0634\0628\0643\0627\062A \062A\0641\0627\0639\0644\064A\0629.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168366996750734)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0633\0645')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168528864750734)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0645\0633\0645\0649')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152588143750729)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\064A\0648\0645 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152365178750729)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0639\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154514622750730)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062F\0642\064A\0642\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152887504750730)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152738681750729)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0633\0628\0648\0639 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152624809750729)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\064A\0627\0645 \0627\0644\0642\0627\062F\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152477380750729)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A \0627\0644\0642\0627\062F\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154673461750730)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153915293750730)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\0634\0647\0631 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154090639750730)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137153010988750730)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0633\0646\0648\0627\062A \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137152974003750730)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0646\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164206060750733)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633\062A \0628\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163210356750733)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0633\0627\0648\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228085548750753)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0646\0637\0642\0629 \0630\0627\062A \0627\0644\0645\0639\0631\0641 %0 \0644\064A\0633\062A \0645\0646\0637\0642\0629 \0634\0628\0643\0629 \062A\0641\0627\0639\0644\064A\0629 \0623\0648 \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0641\064A \0627\0644\062A\0637\0628\064A\0642 %1.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163695912750733)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0641\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164470962750733)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0641\064A \0622\062E\0631')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164648880750733)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0641\064A \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172102978750736)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0628\064A\0627\0646\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208985926750747)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0645 \062E\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214067033750749)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0642\0645\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209215472750747)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\064A\0642\0627\0641')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209310911750747)
,p_name=>'APEX.IG.ON'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0634\063A\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162460075750733)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 \062F\0642\064A\0642\0629 \0648\0627\062D\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216836200750750)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\062A\062D \0645\0646\062A\0642\064A \0627\0644\0623\0644\0648\0627\0646: %0')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205743109750746)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\062A\062D')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169427450750735)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0627\0645\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205117492750746)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\062A\062C\0627\0647')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207537126750747)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0631\0635\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170752693750735)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\062F\0648\0644 \0645\062D\0648\0631\064A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135920448750724)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \062C\062F\0648\0644 \0645\062D\0648\0631\064A')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216758277750750)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0635\0644 \0627\0644\0642\064A\0645 \0628\0627\0633\062A\062E\062F\0627\0645 "%0"')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207677246750747)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0637\0628\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212922604750748)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0646\062A\0635\0641')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137213004824750748)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0647\0627\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212831045750748)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\062F\0627\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168679590750734)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0627\0633\064A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168950940750735)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0641\062A\0631\0627\0636\064A \0627\0644\0623\0633\0627\0633\064A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185421482750740)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0623\0633\0627\0633\064A')
,p_is_js_message=>true
,p_version_scn=>2704482
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059024763750701)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0636\0645\064A\0646 \0639\0644\0627\0645\0627\062A \0625\0645\0643\0627\0646\064A\0629 \0627\0644\0648\0635\0648\0644')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056445342750700)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0641\0642\064A')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056539222750700)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0623\0633\064A')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056356063750700)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062A\062C\0627\0647 \0627\0644\0635\0641\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056216387750700)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'ar'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056120695750700)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'ar'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059219578750701)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062E\0635\0635')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055977259750700)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'ar'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055899455750700)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'ar'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056011539750700)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'ar'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055756218750700)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062C\0645 \0627\0644\0635\0641\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021310496750689)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0635 \0627\0644\0645\0646\0633\0642 \0644\0644\0634\0631\064A\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207707956750747)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0627\0626\0631\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207876046750747)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0637\0627\0642')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218094616750750)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\062F\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172968643750736)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\062F\064A\062F \0635\0641')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171765393750735)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\062F\064A\062F \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176906744750737)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0637\0642\0629 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0641\064A \0627\0644\0635\0641\062D\0629 %1 \0648\0627\0644\0645\0646\0637\0642\0629 %2 \0636\0645\0646 \0627\0644\062A\0637\0628\064A\0642 %0.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137457812750725)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 %0')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168039156750734)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227263041750753)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0630\0641 \0627\0644\062A\0642\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226952123750753)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0641\0638 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0628\062F\064A\0644 \0644\0643\0644 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226857316750753)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0641\0638 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0627\0641\062A\0631\0627\0636\064A \0644\0643\0644 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227114855750753)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0641\0638 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\062E\0627\0635')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227053705750753)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0641\0638 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0639\0627\0645 \0644\0643\0644 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137177006691750737)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \0627\0644\0645\062D\0641\0648\0638\0629 \0630\0627\062A \0627\0644\0627\0633\0645 %0 \063A\064A\0631 \0645\0648\062C\0648\062F\0629.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162390789750732)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\064A\0627\0646\0627\062A \0627\0644\0634\0628\0643\0629 \0627\0639\062A\0628\0627\0631\064B\0627 \0645\0646 %0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642 \0645\0636\062A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162274020750732)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\064A\0627\0646\0627\062A \0627\0644\0634\0628\0643\0629 \0627\0639\062A\0628\0627\0631\064B\0627 \0645\0646 \062F\0642\064A\0642\0629 \0648\0627\062D\062F\0629 \0645\0636\062A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097760168750712)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0642\0631\064A\0631 \0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \063A\064A\0631 \0645\0648\062C\0648\062F')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220279959750751)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 - \062A\062D\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176842898750737)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \0627\0644\0645\062D\0641\0648\0638\0629 \0630\0627\062A \0627\0644\0645\0639\0631\0641 %0 \063A\064A\0631 \0645\0648\062C\0648\062F\0629.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137220191971750751)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 - \062D\0641\0638 \0643\0640')
,p_is_js_message=>true
,p_version_scn=>2704489
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137553339750725)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F\0627\062A \0627\0644\0634\0628\0643\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228164840750753)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0629 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \0627\0644\0645\062D\0641\0648\0638\0629 \0630\0627\062A \0627\0644\0645\0639\0631\0641 \0627\0644\062B\0627\0628\062A %0 \063A\064A\0631 \0645\0648\062C\0648\062F\0629.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223186189750752)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\062A\0642\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136658547750724)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173025695750736)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0631\0627\062C\0639 \0639\0646 \0627\0644\062A\063A\064A\064A\0631\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171884633750735)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0643\0633 \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169012714750735)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167915794750734)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\0641\0648\0641 \0644\0643\0644 \0635\0641\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227753466750753)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0631\0627\0621\0627\062A \0627\0644\0635\0641')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228979123750753)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0631\0627\0621\0627\062A \0627\0644\0635\0641 %0')
,p_is_js_message=>true
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137136986492750725)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182026369750739)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062D\0641\0638')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086605776750709)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0645\062D\0641\0648\0638: %0')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135152478750724)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0627\0631\064A\0631 \0627\0644\0645\062D\0641\0648\0638\0629')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135254298750724)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0641\062A\0631\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108796834750716)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \062A\0637\0628\064A\0642 \0645\062D\0641\0648\0638 \0628\0627\0644\0627\0633\0645 %0 \0645\0648\062C\0648\062F \0628\0627\0644\0641\0639\0644. \0623\062F\062E\0644 \0627\0633\0645\064B\0627 \062C\062F\064A\062F\064B\0627.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135323598750724)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0627\0635')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135435176750724)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0627\0645')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222866056750752)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638 \0628\0627\0633\0645')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171171417750735)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638 \0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0642\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137207913832750747)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0628\0639\062B\0631')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137135038076750724)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215133128750749)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\062D\062B: \0643\0644 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0646\0635\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134975867750724)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B: %0')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214423050750749)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\062D\062B: \0627\0644\0646\0635 \0627\0644\0643\0627\0645\0644')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162108537750732)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B \0639\0646 ''%0''')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204539469750746)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'ar'
,p_message_text=>unistr('- \062A\062D\062F\064A\062F -')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144694998750727)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\062D\062F\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197767675750744)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062F \0635\0641\064B\0627 \0648\0627\062D\062F\064B\0627 \0641\064A \0627\0644\0645\0646\0637\0642\0629 \0627\0644\0623\0635\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134879967750724)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0623\0639\0645\062F\0629 \0644\0644\0628\062D\062B')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227447682750753)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0631\0627\0621\0627\062A \0627\0644\062A\062D\062F\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144815377750727)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\062E\0644\0627\064A\0627')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144702967750727)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0635\0641\0648\0641')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215761619750749)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644 \0643\0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208391509750747)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0644\0633\0644\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132540507750723)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187717120750741)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0627\0644\0642\064A\0645\0629 \0627\0644\0625\062C\0645\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172614392750736)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0635\0641 \0648\0627\062D\062F')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170971043750735)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208468280750747)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \062D\0633\0628')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227854430750753)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646\0643 \062A\0639\0631\064A\0641 \0641\0631\0632 \0648\0627\062D\062F \0641\0642\0637 \0644\0643\0644 \0639\0645\0648\062F.')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227618798750753)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\063A\064A\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137209483735750747)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0648\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164934088750733)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0628\062F\0623 \0628\0640')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208035507750747)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\0648\0631\0635\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127322237750722)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062F\064A\062F \0639\0631\0636 \0627\0644\0639\0645\0648\062F')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171335357750735)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0634\062A\0631\0627\0643')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189326701750741)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062C\0645\0648\0639')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137229119145750753)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0628\0643\0629 \062A\0641\0627\0639\0644\064A\0629. \0627\0644\062A\0642\0631\064A\0631: %0\060C \0637\0631\064A\0642\0629 \0627\0644\0639\0631\0636: %1.')
,p_is_js_message=>true
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137223218177750752)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062C\0645\0648\0639 \0627\0644\0625\062C\0645\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206206798750746)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0647\062F\0641')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212694893750748)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0648\0646 \0627\0644\0646\0635')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137671920750725)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0628\062F\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019784444750689)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187682418750741)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0644\0645\064A\062D \0627\0644\0623\062F\0627\0629')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137168147278750734)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0648\0639')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137172545246750736)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\063A\0627\0621 \0627\0644\062A\062C\0645\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169686511750735)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\062D\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137215548350750749)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\062C\062F \062A\063A\064A\064A\0631\0627\062A \0644\0645 \064A\062A\0645 \062D\0641\0638\0647\0627. \0647\0644 \062A\0631\064A\062F \0627\0644\0645\062A\0627\0628\0639\0629\061F')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137169597388750735)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205374578750746)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210222546750748)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0625\062F\062E\0627\0644 \0642\064A\0645\0629.')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195417214750743)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629 (\0644\0627 \064A\0645\0643\0646 \062A\063A\064A\064A\0631 \0627\0644\0645\0646\0637\0642\0629 \0627\0644\0632\0645\0646\064A\0629)')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214123996750749)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0635')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206613736750746)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0623\0633\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167651180750734)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102783622750714)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0629 \0641\064A \0648\0636\0639 \0627\0644\0639\0631\0636\060C \0627\0646\0642\0631 \0644\0644\062A\062D\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204674644750746)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0648\0636')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137206187213750746)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062C\0645')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165543043750733)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0627\0628\064A\0639')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204726695750746)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\062F\0646\0649 \0644\0639\0631\0636 \0627\0644\0639\0645\0648\062F (\0628\0627\0644\0628\0643\0633\0644)')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156704062750731)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0628\064A\0646 %1 \0648%2')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156426750750731)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \064A\062D\062A\0648\064A \0639\0644\0649 %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156557810750731)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A %0 \0639\0644\0649 %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131925818750723)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\0627 \064A\0628\062F\0623 \0628\0640 %1')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155257530750730)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \064A\0633\0627\0648\064A %1')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155489649750730)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0623\0643\0628\0631 \0645\0646 %1')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155597382750730)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0623\0643\0628\0631 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A %1')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156210510750731)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0641\064A %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157461983750731)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0623\064A\0627\0645 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157217917750731)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0633\0627\0639\0627\062A \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157071932750731)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\062F\0642\0627\0626\0642 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157801478750731)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0634\0647\0648\0631 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157617130750731)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158077537750731)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0633\0646\0648\0627\062A \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157351891750731)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\064A\0648\0645 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157156959750731)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\0633\0627\0639\0629 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156950501750731)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\062F\0642\064A\0642\0629 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157785511750731)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\0634\0647\0631 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157532631750731)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\0623\0633\0628\0648\0639 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137157921630750731)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\0633\0646\0629 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159810557750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0623\064A\0627\0645 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159652389750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0633\0627\0639\0627\062A \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159475111750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\062F\0642\0627\0626\0642 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160299795750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0634\0647\0648\0631 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160024625750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160493210750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0633\0646\0648\0627\062A \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159758418750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\064A\0648\0645 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159554194750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\0633\0627\0639\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159386729750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\062F\0642\064A\0642\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160198260750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\0634\0647\0631 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159952351750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\0623\0633\0628\0648\0639 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160342736750732)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \062E\0644\0627\0644 \0627\0644\0633\0646\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155933478750731)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0641\0627\0631\063A\064B\0627')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155823455750730)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0641\0627\0631\063A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155626452750730)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0623\0642\0644 \0645\0646 %1')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155789900750730)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0623\0642\0644 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156053043750731)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\062B\0644 %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156609456750731)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \064A\0637\0627\0628\0642 \0627\0644\062A\0639\0628\064A\0631 \0627\0644\0639\0627\062F\064A %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162553555750733)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156835775750731)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0628\064A\0646 %1 \0648%2')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155326279750730)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\0627 \064A\0633\0627\0648\064A %1')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156396153750731)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0641\064A %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158661408750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0623\064A\0627\0645 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158446556750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0633\0627\0639\0627\062A \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158293330750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\062F\0642\0627\0626\0642 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159085631750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0634\0647\0648\0631 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158877705750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159229351750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0633\0646\0648\0627\062A \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158548180750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\064A\0648\0645 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158390495750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\0633\0627\0639\0629 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158178525750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\062F\0642\064A\0642\0629 \0627\0644\0645\0627\0636\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158997045750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\0634\0647\0631 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158778237750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\0623\0633\0628\0648\0639 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137159128495750731)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\0639\0627\0645 \0627\0644\0645\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161014125750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0623\064A\0627\0645 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160883700750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0633\0627\0639\0627\062A \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160694479750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\062F\0642\0627\0626\0642 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161418293750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0634\0647\0648\0631 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161255911750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161614424750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 %1 \0645\0646 \0627\0644\0633\0646\0648\0627\062A \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160912779750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\064A\0648\0645 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160746120750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\0633\0627\0639\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160547225750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\062F\0642\064A\0642\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161337914750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\0634\0647\0631 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161138083750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\0623\0633\0628\0648\0639 \0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161585199750732)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \062E\0644\0627\0644 \0627\0644\0633\0646\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137156139914750731)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0645\062B\0644 %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137163013246750733)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \064A\0628\062F\0623 \0628\0640 %1')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205487377750746)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165782868750734)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0646\0648\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205505252750746)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205627618750746)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214625455750749)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\062B\0646\064A\0646\060C 12 \064A\0646\0627\064A\0631 2016')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214796729750749)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0646\0627\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214877764750749)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 16 \0633\0627\0639\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137214996309750749)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0644\0627\0644 16 \0633\0627\0639\0629')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032947139750693)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0637\0628\064A\0642')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024964091750690)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062D\0628 \0635\0648\0631\062A\0643 \0648\0627\0633\062A\062E\062F\0645 \0634\0631\064A\0637 \062A\0645\0631\064A\0631 \0627\0644\062A\0643\0628\064A\0631/\0627\0644\062A\0635\063A\064A\0631 \0644\062A\063A\064A\064A\0631 \0648\0636\0639\0647\0627 \0641\064A \0627\0644\0625\0637\0627\0631.</p>'),
'',
unistr('<p>\0639\0646\062F \0627\0644\062A\0631\0643\064A\0632 \0639\0644\0649 \0623\062F\0627\0629 \0642\0635 \0627\0644\0635\0648\0631\0629\060C \062A\062A\0648\0641\0631 \0627\062E\062A\0635\0627\0631\0627\062A \0627\0644\0645\0641\0627\062A\064A\062D \0627\0644\062A\0627\0644\064A\0629:</p>'),
'<ul>',
unistr('    <li>\0644\0633\0647\0645 \0644\0644\064A\0633\0627\0631: \0646\0642\0644 \0627\0644\0635\0648\0631\0629 \0644\0644\064A\0633\0627\0631*</li>'),
unistr('    <li>\0627\0644\0633\0647\0645 \0644\0623\0639\0644\0649: \0646\0642\0644 \0627\0644\0635\0648\0631\0629 \0644\0623\0639\0644\0649*</li>'),
unistr('    <li>\0627\0644\0633\0647\0645 \0644\0644\064A\0645\064A\0646: \0646\0642\0644 \0627\0644\0635\0648\0631\0629 \0644\0644\064A\0645\064A\0646*</li>'),
unistr('    <li>\0627\0644\0633\0647\0645 \0644\0623\0633\0641\0644: \0646\0642\0644 \0627\0644\0635\0648\0631\0629 \0644\0623\0633\0641\0644*</li>'),
unistr('    <li>I: \062A\0643\0628\064A\0631</li>'),
unistr('    <li>O: \062A\0635\063A\064A\0631</li>'),
unistr('    <li>L: \062A\062F\0648\064A\0631 \0644\0644\064A\0633\0627\0631</li>'),
unistr('    <li>R: \062A\062F\0648\064A\0631 \0644\0644\064A\0645\064A\0646</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*\0627\0636\063A\0637 \0628\0627\0633\062A\0645\0631\0627\0631 \0639\0644\0649 Shift \0644\0644\062A\062D\0631\0643 \0628\0633\0631\0639\0629 \0623\0643\0628\0631</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025137399750690)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0642\0635 \0627\0644\0635\0648\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033088198750693)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025454002750691)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0635 \0627\0644\0635\0648\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033168812750693)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644 \0634\0631\064A\0637 \0627\0644\062A\0645\0631\064A\0631 \0644\062A\0639\062F\064A\0644 \0645\0633\062A\0648\0649 \0627\0644\062A\0642\0631\064A\0628/\0627\0644\0625\0628\0639\0627\062F')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062703111750702)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0645\0644\0641 \063A\064A\0631 \0635\0627\0644\062D. \0623\0646\0648\0627\0639 \0627\0644\0645\0644\0641\0627\062A \0627\0644\0645\062F\0639\0648\0645\0629 %0.')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197102123750743)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\0639\0631\0627\0636')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196816658750743)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0645\0644\0641')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196981480750743)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0645\0644\0641\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062524773750702)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\062D\0628 \0648\0625\0633\0642\0627\0637')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062957626750702)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\062D\0628 \0627\0644\0645\0644\0641\0627\062A \0648\0625\0641\0644\0627\062A\0647\0627')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064307129750702)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0645\0644\0641 \0623\0648 \0625\0633\0642\0627\0637 \0648\0627\062D\062F \0647\0646\0627.')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064403981750702)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0645\0644\0641\0627\062A \0623\0648 \0625\0633\0642\0627\0637\0647\0627 \0647\0646\0627.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064593310750702)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0645\0644\0641 \0623\0648 \0625\0633\0642\0627\0637 \0648\0627\062D\062F \0647\0646\0627.')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064655456750702)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0645\0644\0641\0627\062A \0623\0648 \0625\0633\0642\0627\0637\0647\0627 \0647\0646\0627.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062878828750702)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0645\0644\0641\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062639591750702)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0644\0641 \0643\0628\064A\0631 \0644\0644\063A\0627\064A\0629. \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\062D\062C\0645 \0627\0644\0645\0644\0641 \0647\0648 %0.')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043150918750696)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062A\0645 \062F\0639\0645 \062A\062D\0645\064A\0644 \0645\0644\0641\0627\062A \0645\062A\0639\062F\062F\0629.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026084215750691)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031555253750692)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0646\0648\0627\0646 \0645\0637\0644\0648\0628.')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030421429750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062F\064A\0646\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030884779750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0645\0632 \0627\0644\062F\0648\0644\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030584676750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0642\0645 \0627\0644\0645\0646\0632\0644')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031499842750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0627\0626\0631\0629 \0627\0644\0639\0631\0636')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031339127750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637 \0627\0644\0637\0648\0644')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031264505750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0639\0644\0649 \0627\0644\062E\0631\064A\0637\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030987799750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062C\0645\0648\0639 \0627\0644\0646\0642\0627\0637')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030679148750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0645\0632 \0627\0644\0628\0631\064A\062F\064A')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030754411750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0644\0627\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030373085750692)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0627\0631\0639')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030253466750692)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\062A\0627\0626\062C \0627\0644\062A\0631\0645\064A\0632 \0627\0644\062C\063A\0631\0627\0641\064A')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061756815750702)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0633\062A\062E\062F\0645 \0627\0644\0631\0645\0648\0632 \0627\0644\062C\063A\0631\0627\0641\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061820550750702)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0633\062A\062E\062F\0645 \0627\0644\0631\0645\0648\0632 \0627\0644\062C\063A\0631\0627\0641\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031143650750692)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0631\064A\0637\0629')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031018456750692)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0639\0646\0627\0648\064A\0646.')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031688596750692)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0637\0644\0648\0628.')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137137820169750725)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0623\0648 %1 \0645\0637\0644\0648\0628.')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227321487750753)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0646\0635 \062A\0639\0644\064A\0645\0627\062A %0.')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033369790750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0635\0648\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033470412750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0635\0648\0631')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033299610750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0646\0632\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033527188750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\062D\0628 \0648\0625\0633\0642\0627\0637')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033637848750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\062D\0628 \0627\0644\0635\0648\0631 \0648\0625\0641\0644\0627\062A\0647\0627')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033710267750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0635\0648\0631 \0623\0648 \0625\0641\0644\0627\062A \0648\0627\062D\062F\0629 \0647\0646\0627.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033865977750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0635\0648\0631 \0623\0648 \0625\0641\0644\0627\062A\0647\0627 \0647\0646\0627.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137033995026750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0635\0648\0631 \0623\0648 \0625\0641\0644\0627\062A \0648\0627\062D\062F\0629 \0647\0646\0627.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034002831750693)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0635\0648\0631 \0623\0648 \0625\0641\0644\0627\062A\0647\0627 \0647\0646\0627.')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118700446750719)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062D\062F\062F')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118889741750719)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\062D\062F\062F')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146355891750727)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0628\0639 \0642\0627\0628\0644 \0644\0644\062A\062D\0631\064A\0631 \0644\0644\0642\0631\0627\0621\0629 \0641\0642\0637 \0641\0627\0631\063A')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144154288750727)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0628\0639 \0642\0627\0626\0645\0629 \0644\0644\0642\0631\0627\0621\0629 \0641\0642\0637 \0641\0627\0631\063A')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137143961740750727)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0628\0639 \0642\0627\0628\0644 \0644\0644\062A\062D\0631\064A\0631 \0644\0644\0642\0631\0627\0621\0629 \0641\0642\0637')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144056415750727)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0628\0639 \0642\0627\0626\0645\0629 \0644\0644\062A\062D\0631\064A\0631 \0641\0642\0637')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059749032750701)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'ar'
,p_message_text=>unistr('#LABEL# \0644\064A\0633 \0641\064A \0646\0637\0627\0642 \0635\0627\0644\062D \0645\0646 %0 \0625\0644\0649 %1.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059851485750701)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'ar'
,p_message_text=>unistr('#LABEL# \0644\064A\0633 \0645\0636\0627\0639\0641 \0627\0644\0631\0642\0645 %0.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147195860750728)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0641\062A\0627\062D \062A\0628\062F\064A\0644 \0644\0644\0642\0631\0627\0621\0629 \0641\0642\0637')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087721420750709)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0644\0644\0642\0631\0627\0621\0629 \0641\0642\0637 \0628\0631\0627\0628\0637')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059341574750701)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 #LABEL# \0645\0637\0627\0628\0642\064B\0627 \0644\0644\0642\064A\0645\062A\064A\0646 %0 \0648%1.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059565797750701)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145888060750727)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\064A\0642\0627\0641')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145954209750727)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0634\063A\064A\0644')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059486442750701)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0639\0645')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067359818750703)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062D\062F\062F \0627\0644\0644\063A\0629')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137003760629750684)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \0625\062F\062E\0627\0644')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180590971750738)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180642848750738)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137003837421750684)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\062F\062E\0627\0644\0627\062A \0627\0644\0645\062D\062F\062F\0629')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184313247750739)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062A\0642\062F\0645')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184652188750740)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\063A\0627\0621')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184417823750740)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0627\0645')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184728100750740)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\064A\0627\0631\0627\062A \0627\0644\0646\0645\0648\0630\062C \0627\0644\0645\0628\0627\0634\0631')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185300320750740)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\064A\0627\0631\0627\062A \0627\0644\0642\0627\0644\0628 \063A\064A\0631 \0645\062A\0648\0641\0631\0629 \0644\0623\0646 \0647\0630\0627 \0627\0644\0645\0643\0648\0646 \063A\064A\0631 \0645\0639\0631\0648\0636 \0641\064A \0627\0644\0635\0641\062D\0629.')
,p_version_scn=>2704482
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184203258750739)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \062E\064A\0627\0631\0627\062A \0642\0627\0644\0628.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184563082750740)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038386650750694)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D \062F\0627\0626\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040717970750695)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0646\0645\0627\0637 \0627\0644\0645\062E\0635\0635\0629 \063A\064A\0631 \0635\0627\0644\062D\0629 \0641\064A JSON.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038675149750694)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\062F\0627\0629 \0627\0644\0645\0633\0627\0641\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038437547750694)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0633\0645 \062F\0627\0626\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018211397750688)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0648\0642\0639 \0627\0644\062D\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024653446750690)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062D\062F\0627\062B\064A\0627\062A \0627\0644\0645\0648\0636\0639 \0627\0644\0645\0628\062F\0626\064A \063A\064A\0631 \0635\0627\0644\062D\0629.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013661995750687)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0627\0644\0645\0648\0636\0639 \0627\0644\0645\0628\062F\0626\064A \0646\0642\0637\0629 \0641\064A \0634\0643\0644 \0647\0646\062F\0633\064A.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022218572750690)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0645')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017418963750688)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0637\0628\0642\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187841891750741)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0637\0628\0642\0629: %0')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036649935750694)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0631\064A\0637\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006302145750685)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0627\0626\0644')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022477219750690)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0645\064A\0627\0644')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186892386750740)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062A\0648\064A \0627\0644\0628\064A\0627\0646\0627\062A \0639\0644\0649 \0645\0627 \064A\0632\064A\062F \0639\0646 %0 \0645\0646 \0627\0644\0635\0641\0648\0641 \0648\0647\0630\0627 \064A\062A\062C\0627\0648\0632 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0627\0644\0645\0633\0645\0648\062D \0628\0647.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016772979750688)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0642\0648\0642 \0627\0644\0646\0634\0631 &copy; \0644\0639\0627\0645 2022 \0645\062D\0641\0648\0638\0629 \0644\0634\0631\0643\0629 \0623\0648\0631\0627\0643\0644 &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">\0627\0644\0628\0646\0648\062F</a> \0648\0628\064A\0627\0646\0627\062A \0627\0644\062E\0631\064A\0637\0629 &copy; 2021 \0647\0646\0627')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013316863750687)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A SDO_GEOMETRY \063A\064A\0631 \0645\062A\0627\062D \0641\064A \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0647\0630\0647.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016891726750688)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; \0645\0633\0627\0647\0645\0648 OpenStreetMap </a>')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041441572750695)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; \0645\0633\0627\0647\0645\0648 OpenStreetMap </a>')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017667910750688)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0642\0627\0637')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187951546750741)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0646\0642\0627\0637')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038596552750694)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0628\064A\0631/\062A\0635\063A\064A\0631 \0627\0644\0645\0633\062A\0637\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038238785750694)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018079565750688)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0627\0644\0645\062D\0645\0644 \0625\0644\0649 \0627\0644\0634\0645\0627\0644')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132872329750723)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0628\062F\064A\0644 \0625\0644\0649 \0648\0636\0639 \062B\0646\0627\0626\064A \0627\0644\0623\0628\0639\0627\062F')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132916750750723)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0628\062F\064A\0644 \0625\0644\0649 \0648\0636\0639 \062B\0644\0627\062B\064A \0627\0644\0623\0628\0639\0627\062F')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038108863750694)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0634\0639\0627\0631 \062D\0642\0648\0642 \0627\0644\0646\0634\0631')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038741182750695)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0633\0627\0641\0629 \0627\0644\0625\062C\0645\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017797489750688)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0628\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017905701750688)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0635\063A\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182410133750739)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\064A\0636')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183391994750739)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\0648\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182944680750739)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0645\0632 \0627\0644\0645\0636\0645\0646')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195625063750743)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062F\0631\0627\062C \0635\0648\0631\0629')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195700962750743)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062F\0631\0627\062C \0627\0631\062A\0628\0627\0637')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182526109750739)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0627\0626\0644')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196324006750743)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0631\062A\0628\0627\0637')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183243262750739)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183161222750739)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0645\0631\062A\0628\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182603312750739)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0627\064A\0646\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182703302750739)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0648\062C\062F \0645\0627 \064A\0645\0643\0646 \0645\0639\0627\064A\0646\062A\0647')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182829568750739)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0648\0633\0637\0647 \062E\0637')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183072730750739)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \063A\064A\0631 \0645\0631\062A\0628\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161991073750732)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137218119393750750)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0632\064A\062F...')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137161860501750732)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\0627\0631\064D \0627\0644\062A\062D\0645\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076056603750706)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'ar'
,p_message_text=>unistr('\0632\0631 \062A\0642\0633\064A\0645')
,p_is_js_message=>true
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075946292750706)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0645\0642\0633\0645\0629')
,p_is_js_message=>true
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192972578750742)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0633\0627\0644\0629 \0627\0644\0625\0634\0639\0627\0631')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017022955750688)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 %0')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166974338750734)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 #LABEL# \0631\0642\0645\064B\0627 \0623\0642\0644 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A %0.')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167025054750734)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 #LABEL# \0631\0642\0645\064B\0627 \0635\0627\0644\062D\064B\0627.')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167172262750734)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'ar'
,p_message_text=>unistr('#LABEL# \063A\064A\0631 \0645\0637\0627\0628\0642 \0644\062A\0646\0633\064A\0642 \0627\0644\0631\0642\0645 %0 (\0645\062B\0627\0644: %1).')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166871040750734)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 #LABEL# \0631\0642\0645\064B\0627 \0623\0643\0628\0631 \0645\0646 \0623\0648 \064A\0633\0627\0648\064A %0.')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166789979750734)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 #LABEL# \0631\0642\0645\064B\0627 \0628\064A\0646 %0 \0648%1.')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162076572750732)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\062A\062D \0641\064A \0646\0627\0641\0630\0629 \062C\062F\064A\062F\0629')
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111814169750717)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0642\062F\064A\0645 \0647\0630\0647 \0627\0644\0635\0641\062D\0629 \0628\0627\0644\0641\0639\0644 \0648\0644\0627 \064A\0645\0643\0646 \0625\0639\0627\062F\0629 \062A\0642\062F\064A\0645\0647\0627.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093250418750711)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641\062D\0629 "%1" \0636\0645\0646 \0627\0644\062A\0637\0628\064A\0642 "%0" \063A\064A\0631 \0645\0648\062C\0648\062F\0629.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128763271750722)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\0648\062C\062F \0642\064A\0645\0629 \0644\0640 #LABEL#.')
,p_is_js_message=>true
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019426466750689)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062E\0641\0627\0621 \0643\0644\0645\0629 \0627\0644\0633\0631')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019328557750689)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0643\0644\0645\0629 \0627\0644\0633\0631')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066900126750703)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180978062750738)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\063A\0644\0627\0642')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180853172750738)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B \0639\0646 %0')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181152807750738)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181063096750738)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0628\0642')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057710416750700)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\062F\062E\0644 \0645\0635\0637\0644\062D \0628\062D\062B \064A\062A\0643\0648\0646 \0645\0646 %0 \0645\0646 \0627\0644\062D\0631\0648\0641 \0639\0644\0649 \0627\0644\0623\0642\0644.')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134077262750724)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645 \0627\0644\0645\0646\0628\062B\0642\0629: %0')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057845456750700)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\062F\062E\0644 \0645\0635\0637\0644\062D \0628\062D\062B.')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004892842750684)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057673446750700)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0646\062A\0627\0626\062C.')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057511164750700)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 %0')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154742980750730)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0635\0637\0644\062D \0627\0644\0628\062D\062B')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180765177750738)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006986175750685)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0637\0644\0628 %0.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019258061750689)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0637\0628\0627\0639\0629 \0627\0644\062A\0642\0631\064A\0631.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137030088946750692)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062A\0639\0630\0631 \0637\0628\0627\0639\0629 \0627\0644\0645\0633\062A\0646\062F \0628\0627\0633\062A\062E\062F\0627\0645 \062E\0627\062F\0645 \0627\0644\0637\0628\0627\0639\0629 \0627\0644\0630\064A \062A\0645 \062A\0643\0648\064A\0646\0647.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052701495750699)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\0642\064A\064A\0645 \0627\0644\0645\0639\0644\0645\0629 %0 \0639\0646\062F \0627\0633\062A\062F\0639\0627\0621 %1. \0627\0637\0644\0639 \0639\0644\0649 \0633\062C\0644 \0627\0644\062E\0637\0623 \0644\0645\0639\0631\0641\0629 \0627\0644\062A\0641\0627\0635\064A\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191414839750742)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\0627\0631\064D \0627\0644\0645\0639\0627\0644\062C\0629')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050550543750698)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0644\062E\0644\0641')
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051649186750698)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0647\0630\0627 \0627\0644\0645\0648\0642\0639 \0644\0647 \0648\0638\064A\0641\0629 \062A\0637\0628\064A\0642. \0642\0645 \0628\062A\062B\0628\064A\062A\0647 \0639\0644\0649 \062C\0647\0627\0632\0643 \0644\0644\062D\0635\0648\0644 \0639\0644\0649 \0623\0641\0636\0644 \062A\062C\0631\0628\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052974317750699)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054547563750699)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062B\0628\064A\062A \0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039354652750695)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0628\062F\0648 \0623\0646 \062C\0647\0627\0632\0643 \0623\0648 \0645\0633\062A\0639\0631\0636\0643 \064A\062F\0639\0645 \062A\062B\0628\064A\062A \062A\0637\0628\064A\0642\0627\062A \0627\0644\0648\064A\0628 \0627\0644\062A\0642\062F\0645\064A\0629 \062D\0627\0644\064A\064B\0627.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034410068750693)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'ar'
,p_message_text=>unistr('1- \0627\0646\0642\0631 \0639\0644\0649 \0623\064A\0642\0648\0646\0629 <strong>\0645\0634\0627\0631\0643\0629</strong>')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034521954750693)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'ar'
,p_message_text=>unistr('2- \0645\0631\0631 \0644\0623\0633\0641\0644 \0648\0627\0646\0642\0631 \0639\0644\0649 <strong>\0625\0636\0627\0641\0629 \0625\0644\0649 \0627\0644\0634\0627\0634\0629 \0627\0644\0631\0626\064A\0633\064A\0629</strong>')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050992688750698)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'ar'
,p_message_text=>unistr('3- \0627\0646\0642\0631 \0639\0644\0649 <strong style="color:#007AE1;">\0625\0636\0627\0641\0629</strong> \0644\0644\062A\0623\0643\064A\062F')
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050018479750698)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<main>',
'    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 280" role="presentation">',
'      <g fill="none">',
'        <path d="M316.846 213.183c39.532 0 63.154-30.455 63.154-62.764 0-30.943-22.158-56.615-51.441-62.179v-1.17c0-48.123-38.947-87.07-87.07-87.07-39.044 0-72.036 25.672-83.066 61.007-8.492-3.612-17.863-5.564-27.722-5.564-34.261 0-62.764 24.11-69.69'
||'4 56.322a51.007 51.007 0 0 0-9.468-.879C23.036 110.79 0 133.825 0 162.327c0 28.405 23.036 51.441 51.441 51.441l265.405-.585z" fill="currentColor" opacity=".2"/>',
'        <circle fill="#D63B25" cx="336" cy="216" r="64"/>',
'        <path d="M367.357 198.439c-.395-.395-.947-.632-1.657-.632-.71 0-1.184.237-1.657.632L351.97 210.51l-10.494-10.493 12.072-12.072c.395-.395.71-.947.71-1.657A2.29 2.29 0 0 0 351.97 184c-.631 0-1.183.237-1.657.631l-12.071 12.072-7.496-7.496c-.394-'
||'.394-.947-.71-1.657-.71a2.29 2.29 0 0 0-2.288 2.288c0 .632.237 1.184.71 1.657l2.604 2.604-13.176 13.176a13.781 13.781 0 0 0-4.024 9.705c0 3.787 1.499 7.18 4.024 9.705l2.13 2.13-14.36 14.36c-.394.394-.71.947-.71 1.657a2.29 2.29 0 0 0 2.288 2.288c.631 '
||'0 1.184-.237 1.657-.71l14.36-14.36 1.736 1.736a13.781 13.781 0 0 0 9.704 4.024c3.787 0 7.18-1.5 9.705-4.024l13.176-13.177 2.92 2.92c.394.394.946.71 1.656.71a2.29 2.29 0 0 0 2.289-2.288c0-.632-.237-1.184-.71-1.657l-7.575-7.496 12.072-12.071c.394-.395.'
||'71-.947.71-1.657.079-.632-.237-1.184-.631-1.578zm-27.142 33.059a9.398 9.398 0 0 1-6.47 2.603c-2.525 0-4.813-.946-6.47-2.603l-7.1-7.101a9.124 9.124 0 0 1-2.683-6.47 9.124 9.124 0 0 1 2.682-6.47l13.177-13.176 3.156 3.156c.079.079.079.158.158.158l.157.1'
||'57 13.413 13.413c.08.08.08.158.158.158l.158.158 2.761 2.762-13.097 13.255z" fill="#FFF"/>',
'      </g>',
'    </svg>',
unistr('    <h1>\0644\0627 \064A\0645\0643\0646 \0627\0644\0627\062A\0635\0627\0644</h1>'),
unistr('    <p>\064A\0628\062F\0648 \0623\0646 \0647\0646\0627\0643 \0645\0634\0643\0644\0629 \0641\064A \0627\0644\0634\0628\0643\0629. \062A\062D\0642\0642 \0645\0646 \0627\062A\0635\0627\0644\0643 \0648\062D\0627\0648\0644 \0645\0631\0629 \0623\062E\0631\0649.</p>'),
unistr('    <button type="button">\0625\0639\0627\062F\0629 \0627\0644\0645\062D\0627\0648\0644\0629</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049909239750698)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0627\0644\0627\062A\0635\0627\0644')
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096540028750712)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \0647\0630\0627 \0627\0644\062C\0647\0627\0632 \0641\064A \062A\0645\0643\064A\0646 \0627\0644\0625\0634\0639\0627\0631\0627\062A \0627\0644\062A\0644\0642\0627\0626\064A\0629.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102011738750714)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631\0627\062A \0633\0631\064A\0639\0629 \0644\0640 %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101967247750714)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0631\062A\0628\0627\0637 \0627\062E\062A\064A\0627\0631 \0633\0631\064A\0639')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137075727476750706)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0632\0631 \0627\062E\062A\064A\0627\0631 \0645\062E\0641\064A \0645\0631\0626\064A\064B\0627')
,p_is_js_message=>true
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019885466750689)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0635\0641 \0648\0627\062D\062F')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202527608750745)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147811510750728)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0648\0627\0644 \0627\0644\064A\0648\0645')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225473273750752)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644 \062F\0639\0648\0629')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225225514750752)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\064A\0627\0631\0627\062A')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149620266750729)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \064A\0648\0645\064A\0629 \0644\0643\0644 \0627\0644\064A\0648\0645')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149482189750728)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \064A\0648\0645\064A\0629 \0644\0644\0628\064A\0627\0646\0627\062A \0645\0639 \0627\0644\0648\0642\062A')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193662587750742)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\0645')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188690176750741)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0635\0641')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072136148750705)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'ar'
,p_message_text=>'CSV'
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071917528750705)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'ar'
,p_message_text=>'iCal'
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071829390750705)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'ar'
,p_message_text=>'PDF'
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072015037750705)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'ar'
,p_message_text=>'XML'
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071548978750705)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0627\0631\064A\062E \0627\0644\0646\0647\0627\064A\0629')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071709144750705)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\062D\062F\062B')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225306448750752)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0639\0648\0629')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193782922750742)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193425217750742)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196004984750743)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210001483750748)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \062A\0648\062C\062F \0623\062D\062F\0627\062B')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225638215750752)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \062D\062F\062B \0645\0648\062C\0648\062F.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225517776750752)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644 \062F\0639\0648\0629 \0628\0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196190334750743)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0628\0642')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203864449750746)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644 \0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203672403750746)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644 \0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226264553750753)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\0645\064A\0639 \0627\0644\062D\0642\0648\0644 \0645\0637\0644\0648\0628\0629.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226142624750753)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644 \062F\0639\0648\0629')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225107124750752)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0648\0636\0648\0639')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203723181750746)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\0649')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071641275750705)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0627\0631\064A\062E \0627\0644\0628\062F\0627\064A\0629')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201850160750745)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0645\0648\0630\062C \0641\064A %0')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149228051750728)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0642\062A')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196213054750743)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\064A\0648\0645')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194208678750743)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193531835750742)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0628\0648\0639')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149523674750728)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0623\0633\0628\0648\0639\064A\0629 \0644\0643\0644 \0627\0644\064A\0648\0645')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149328990750728)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0623\0633\0628\0648\0639\064A\0629 \0644\0644\0628\064A\0627\0646\0627\062A \0645\0639 \0627\0644\0648\0642\062A')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194114692750743)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0646\0629')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193860745750742)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0639\0645\062F\0629...')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193940930750743)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0645\064A\0644 \0627\0644\0645\0632\064A\062F...')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123393480750720)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0644\062E\0644\0641')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064892491750702)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0645\064A\0644 \0627\0644\0645\0632\064A\062F...')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067101280750703)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B...')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194018776750743)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0645\064A\0644 \0627\0644\0645\0632\064A\062F...')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195985410750743)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0641 \0627\0644\0645\0646\0637\0642\0629 %0 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067095754750703)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0628\064A\0627\0646\0627\062A')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094533087750711)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062A\0639\0630\0631 \0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0641\0635\0644 \0635\0641\062D\0627\062A \0627\0644\0645\0646\0637\0642\0629.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058294144750700)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0625\0639\062F\0627\062F \0641\0635\0644 \0635\0641\062D\0627\062A \0627\0644\0645\0646\0637\0642\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188090948750741)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0639\0645\062F\0629...')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042577733750696)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\062D\0645\064A\0644 \0627\0644\0628\0637\064A\0621 \063A\064A\0631 \0645\062A\0648\0627\0641\0642 \0645\0639 \0627\0644\0641\062A\062D\0627\062A \0627\0644\0645\0648\062C\0648\062F\0629 \0641\064A %0\060C \0648\0647\064A \0645\0646\0637\0642\0629 \0648\0627\062D\062F\0629 (\062C\0632\0626\064A\0629). \064A\062C\0628 \0639\0644\064A\0643 \0625\0645\0627 \062A\0639\0637\064A\0644 \0627\0644\062A\062D\0645\064A\0644 \0627\0644\0628\0637\064A\0621 \0644\0647\0630\0647 \0627\0644\0645\0646\0637\0642\0629\060C \0623\0648 \0646\0642\0644 \0645\0643\0648\0646\0627\062A \0627\0644\0641\062A\062D\0629 \0625\0644\0649 \0645\0646\0637\0642\0629 \0645\062E\062A\0644\0641\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037866669750694)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0644\0628 \0627\0644\0645\062C\0645\0648\0639\0629 \063A\064A\0631 \0645\0648\062C\0648\062F \0641\064A \0645\0643\0648\0646 \0627\0644\0642\0627\0644\0628 \0627\0644\062E\0627\0635 \0628\0640 %0.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032836833750693)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0647\064A \0645\0646\0637\0642\0629 \0648\0627\062D\062F\0629 (\062C\0632\0626\064A\0629) \0648\0642\062F \0623\0631\062C\0639\062A \0635\0641\0648\0641\064B\0627 \0645\062A\0639\062F\062F\0629.')
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195881326750743)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0645\0646\0637\0642\0629 %0 \063A\064A\0631 \0645\062F\0639\0648\0645.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058115237750700)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0639\0631\0636 \0627\0644\0645\0646\0637\0642\0629 "#COMPONENT_NAME#".')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128851507750722)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\0648\062C\062F \0642\064A\0645\0629 \0644\0640 #COLUMN_HEADER#.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010430197750686)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0639\0644\064A\0643 \062A\062D\062F\064A\062F \062A\062E\0637\064A\0637 \062A\0642\0631\064A\0631.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224760199750752)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('%0\061C\060C \0645\062D\0631\0631 \0646\0635 \0645\0646\0633\0642')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130992912750723)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\062C\0627\0648\0632 \062A\0631\0645\064A\0632 HTML \0644\0644\0646\0635 \0627\0644\0645\0646\0633\0642 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0637\0648\0644 \0627\0644\0639\0646\0635\0631 (\0627\0644\0623\062D\0631\0641 \0627\0644\0641\0639\0644\064A\0629 %0\060C \0627\0644\0645\0633\0645\0648\062D \0628\0647\0627 %1)')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040310984750695)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062D\0631\0631 \0646\0635 \0645\0646\0633\0642 \0644\0644\0642\0631\0627\0621\0629 \0641\0642\0637')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040229379750695)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\0631\0646\0627\0645\062C \062A\062D\0631\064A\0631 \0646\0635 \0645\0646\0633\0642')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040016959750695)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062D\0627\0630\0627\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040196025750695)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0627\0635\0631 \0625\0636\0627\0641\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039816015750695)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\0646\0637')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039711586750695)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0646\0633\064A\0642')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039924460750695)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\0648\0627\0626\0645')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193052967750742)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0630\0641')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185595325750740)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0631\0627\0631')
,p_is_js_message=>true
,p_version_scn=>2704482
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183825540750739)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183747829750739)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\062B\0646\0627\0621 \0627\0644\0642\064A\0645 \0627\0644\062E\0627\0644\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137193156079750742)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629')
,p_is_js_message=>true
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147451544750728)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644 \0644\0623\0633\0641\0644')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147580607750728)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644 \0644\0623\0639\0644\0649')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183592592750739)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184138919750739)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0639\0645\062F\0629 \0627\0644\0623\062E\0631\0649')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183630756750739)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0628\0642')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183956926750739)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641 %0')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184003443750739)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641 %0 \0645\0646 %1')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185642884750740)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\062F\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704482
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185740956750740)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0631\0627\062C\0639 \0639\0646 \0627\0644\062A\063A\064A\064A\0631\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704482
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137183474737750739)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\0639\062F\0627\062F\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142612216750726)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644\060C %0')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146983203750728)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062B\0627\0644: %0')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059659621750701)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\062A\064A\062C\0629 \0648\0627\062D\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056743670750700)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0646\062A\0627\0626\062C')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108594519750716)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0631\0642\064A\0645 \0627\0644\0635\0641\062D\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108667197750716)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\062A\0627\0626\062C\060C %0 \0625\0644\0649 %1')
,p_is_js_message=>true
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004330769750684)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644 \0645\0631\0629 \0623\062E\0631\0649')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004207144750684)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\062A \062C\0644\0633\062A\0643')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004423942750684)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062F\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004099845750684)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\062A\0646\062A\0647\064A \062C\0644\0633\062A\0643 \062E\0644\0627\0644 %0. \0647\0644 \062A\0631\064A\062F \062A\0645\062F\064A\062F\0647\0627\061F')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004158318750684)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\062A\0646\062A\0647\064A \062C\0644\0633\062A\0643 \0641\064A %0 \0648\0644\0627 \064A\0645\0643\0646 \062A\0645\062F\064A\062F\0647\0627. \0627\0644\0631\062C\0627\0621 \062D\0641\0638 \0623\064A \0639\0645\0644 \0627\0644\0622\0646 \0644\062A\062C\0646\0628 \0641\0642\062F\0627\0646 \0623\064A \0628\064A\0627\0646\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203423679750745)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0631\0645\0632 \062A\0646\0638\064A\0641 \062C\0644\0633\0629 \0639\0645\0644 \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A.')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093139252750711)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0631\0645\0632 \0625\0639\062F\0627\062F \062C\0644\0633\0629 \0627\0644\0639\0645\0644.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063527367750702)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\062A \062C\0644\0633\062A\0643.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202675741750745)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \0625\063A\0644\0627\0642 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0648\0627\0644\0636\063A\0637 \0639\0644\0649 \0632\0631 \0625\0639\0627\062F\0629 \0627\0644\062A\062D\0645\064A\0644 \0641\064A \0627\0644\0645\062A\0635\0641\062D \0644\0628\062F\0621 \062C\0644\0633\0629 \0639\0645\0644 \062C\062F\064A\062F\0629.')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221561535750751)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('<a href="%0">\062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644</a> \0645\0631\0629 \0623\062E\0631\0649 \0644\0625\0646\0634\0627\0621 \062C\0644\0633\0629 \062C\062F\064A\062F\0629.')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105818938750715)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062C\0644\0633\0629 \063A\064A\0631 \0635\0627\0644\062D\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148929976750728)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \062A\0645\0643\064A\0646 \0623\064A\0629 \0623\062F\0648\0627\0631 \062F\064A\0646\0627\0645\064A\0643\064A\0629 \0641\064A \062C\0644\0633\0629 \0639\0645\0644 Real Application Security \0644\0644\0645\0633\062A\062E\062F\0645 "%0".')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091021065750710)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-99900 \062A\0639\0630\0631 \062A\0643\0648\064A\0646 \0645\0639\0631\0641 \062C\0644\0633\0629 \0627\0644\0639\0645\0644 \0627\0644\0641\0631\064A\062F: %0')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020126289750689)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\0633\0645\0648\062D \0628\0646\0648\0639 \0628\064A\0627\0646\0627\062A \062D\0627\0644\0629 CLOB \0644\0644\0635\0646\0641 %0.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039524322750695)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0628\062F\064A\0644 \0639\0646\0627\0635\0631 \0646\0648\0639 \062D\0627\0644\0629 \062C\0644\0633\0629 CLOB \063A\064A\0631 \0645\062F\0639\0648\0645.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108307151750716)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \0627\0646\062A\0647\0627\0643 \0644\062D\0645\0627\064A\0629 \062C\0644\0633\0629 \0627\0644\0639\0645\0644: \0642\062F \064A\0643\0648\0646 \0647\0630\0627 \0628\0633\0628\0628 \062A\0639\062F\064A\0644 \064A\062F\0648\064A \0644\0639\0646\0635\0631 \0635\0641\062D \0645\062D\0645\064A %0. \0641\0625\0646 \0644\0645 \062A\0643\0646 \0639\0644\0649 \062F\0631\0627\064A\0629 \0628\0633\0628\0628 \062D\062F\0648\062B \0647\0630\0627 \0627\0644\062E\0637\0623\060C \0641\0627\0644\0631\062C\0627\0621 \0627\0644\0627\062A\0635\0627\0644 \0628\0645\0633\0626\0648\0644 \0627\0644\062A\0637\0628\064A\0642 \0637\0644\0628\064B\0627 \0644\0644\0645\0633\0627\0639\062F\0629.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137229577597750754)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0627\0643 \062D\0645\0627\064A\0629 \0627\0644\0635\0641\062D\0629: \0642\062F \064A\0643\0648\0646 \0627\0644\0633\0628\0628 \0641\064A \0647\0630\0627 \062A\0642\062F\064A\0645 \0635\0641\062D\0629 \0644\0645 \064A\062A\0645 \0627\0644\0627\0646\062A\0647\0627\0621 \0645\0646 \062A\062D\0645\064A\0644\0647\0627 \0623\0648 \0625\062C\0631\0627\0621 \062A\0639\062F\064A\0644 \064A\062F\0648\064A \0639\0644\0649 \0639\0646\0627\0635\0631 \0645\062D\0645\064A\0629 \0641\064A \0627\0644\0635\0641\062D\0629. \0644\0644\062D\0635\0648\0644 \0639\0644\0649 \0645\0632\064A\062F \0645\0646 \0627\0644\0645\0633\0627\0639\062F\0629\060C \0627\0644\0631\062C\0627\0621 \0627\0644\0627\062A\0635\0627\0644 \0628\0645\0633\0626\0648\0644 \0627\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228666346750753)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0634\062A\0645\0644 %0 \0639\0644\0649 \0623\062D\062F \0627\0644\0623\062D\0631\0641 \063A\064A\0631 \0627\0644\0635\0627\0644\062D\0629 \0627\0644\062A\0627\0644\064A\0629 & \0623\0648 < \0623\0648 > \0623\0648 " \0623\0648 / \0623\0648 ; \0623\0648 , \0623\0648 * \0623\0648 | \0623\0648 = \0623\0648 % \0623\0648 --')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228755572750753)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0634\062A\0645\0644 %0 \0639\0644\0649 \0623\062D\062F \0627\0644\0623\062D\0631\0641 \063A\064A\0631 \0627\0644\0635\0627\0644\062D\0629 \0627\0644\062A\0627\0644\064A\0629 & \0623\0648 <\0623\0648 >\0623\0648 "\0623\0648 /\0623\0648 ;\0623\0648 ,\0623\0648 *\0623\0648 |\0623\0648 =\0623\0648 % \0623\0648 -- \0623\0648 \0633\0637\0631 \062C\062F\064A\062F.')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228469980750753)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0634\062A\0645\0644 %0 \0639\0644\0649 \0623\062D\0631\0641 \062E\0627\0635\0629. \0648\0644\0643\0646 \0644\0627 \064A\064F\0633\0645\062D \0633\0648\0649 \0628\0627\0644\0623\062D\0631\0641 a-Z \06480-9 \0648\0627\0644\0645\0633\0627\0641\0627\062A.')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228572891750753)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0634\062A\0645\0644 %0 \0639\0644\0649 < \0623\0648 > \0623\0648 " \0648\0647\064A \0623\062D\0631\0641 \063A\064A\0631 \0635\0627\0644\062D\0629.')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065989967750703)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0625\062F\062E\0627\0644 \0645\062C\0645\0648\0639 \0627\062E\062A\0628\0627\0631\064A \0644\0625\0638\0647\0627\0631 \0645\0639\0627\0644\062C\0629 \0635\0641\062D\0629 \062A\062A\0637\0644\0628 \0645\062C\0645\0648\0639\064B\0627 \0627\062E\062A\0628\0627\0631\064A\064B\0627 \0641\064A \062D\0627\0644\0629 \0648\062C\0648\062F \0637\0644\0628 \0623\0648 \0623\0643\062B\0631\060C \0623\0648 \0645\0633\062D \0627\0644\0630\0627\0643\0631\0629 \0627\0644\0645\062E\0628\0626\064A\0629\060C \0623\0648 \062A\0645\0631\064A\0631 \0642\064A\0645 \0627\0644\0648\0633\0627\0626\0637 \0643\0645\0639\0644\0645\0627\062A.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103285149750714)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \0627\0646\062A\0647\0627\0643 \0644\062D\0645\0627\064A\0629 \062C\0644\0633\0629 \0627\0644\0639\0645\0644: \0642\062F \064A\0643\0648\0646 \0647\0630\0627 \0628\0633\0628\0628 \062A\0639\062F\064A\0644 \064A\062F\0648\064A \0644\0639\0646\0648\0627\0646 URL \064A\0634\062A\0645\0644 \0639\0644\0649 \0645\062C\0645\0648\0639 \0627\062E\062A\0628\0627\0631\064A \0623\0648 \0628\0627\0633\062A\062E\062F\0627\0645 \0627\0631\062A\0628\0627\0637 \064A\0634\062A\0645\0644 \0639\0644\0649 \0645\062C\0645\0648\0639 \0627\062E\062A\0628\0627\0631\064A \063A\064A\0631 \0635\062D\064A\062D \0623\0648 \063A\064A\0631 \0645\0648\062C\0648\062F. \0641\0625\0646 \0644\0645 \062A\0643\0646 \0639\0644\0649 \062F\0631\0627\064A\0629 \0628\0633\0628\0628 \062D\062F\0648\062B \0647\0630\0627 \0627\0644\062E\0637\0623\060C \0641\0627\0644\0631\062C\0627\0621 \0627\0644\0627\062A\0635\0627\0644 \0628\0645\0633\0626\0648\0644 \0627\0644\062A\0637\0628\064A\0642 \0637\0644\0628\064B\0627 \0644\0644\0645\0633\0627\0639\062F\0629.')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184848012750740)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\064A\064A\0646 \0648\0636\0639 \0627\0644\062A\0628\0627\064A\0646 \0627\0644\0639\0627\0644\064A \0625\0644\0649 \0625\064A\0642\0627\0641')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137184938533750740)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\064A\064A\0646 \0648\0636\0639 \0627\0644\062A\0628\0627\064A\0646 \0627\0644\0639\0627\0644\064A \0625\0644\0649 \062A\0634\063A\064A\0644')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049372853750698)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\062F\064A\062B \0625\0639\062F\0627\062F \0627\0644\062A\0637\0628\064A\0642 %0 \0644\0623\0646\0647 \062A\0645 \0627\0644\0627\0634\062A\0631\0627\0643 \0628\0647 \0645\0646 \062A\0637\0628\064A\0642 \0622\062E\0631.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099668381750713)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0641\0644')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099827091750713)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0623\0633\0641\0644')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099955029750713)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100074430750713)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644 \0627\0644\0643\0644')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100110251750713)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100292883750713)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\0643\0644')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100309048750713)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099522292750713)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0639\0644\0649')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099721637750713)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0623\0639\0644\0649')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211335587750748)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'ar'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212080686750748)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0644\0627\0644 %0 \0645\0646 \0627\0644\0623\064A\0627\0645')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211295524750748)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'ar'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212176229750748)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0644\0627\0644 %0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211017664750748)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'ar'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212266210750748)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0644\0627\0644 %0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211679563750748)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0634\0647\0648\0631')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211825080750748)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0644\0627\0644 %0 \0645\0646 \0627\0644\0634\0647\0648\0631')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211129792750748)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'ar'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211978347750748)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0644\0627\0644 %0 \0645\0646 \0627\0644\062B\0648\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211415543750748)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'ar'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137212305909750748)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0644\0627\0644 %0 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211579509750748)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'ar'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137211733651750748)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0644\0627\0644 %0 \0645\0646 \0627\0644\0633\0646\0648\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012652124750687)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'ar'
,p_message_text=>unistr('[\062E\0637]')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013262296750687)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'ar'
,p_message_text=>unistr('[\062E\0637\0648\0637 \0645\062A\0639\062F\062F\0629]')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012983935750687)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'ar'
,p_message_text=>unistr('[\0646\0642\0627\0637 \0645\062A\0639\062F\062F\0629]')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013488892750687)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'ar'
,p_message_text=>unistr('[\0645\0636\0644\0639\0627\062A \0645\062A\0639\062F\062F\0629]')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013545629750687)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'ar'
,p_message_text=>unistr('[\0643\0627\0626\0646 \0647\0646\062F\0633\064A]')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012564517750687)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'ar'
,p_message_text=>unistr('[\0627\0644\0646\0642\0637\0629 (%0,%1)]')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012886290750687)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'ar'
,p_message_text=>unistr('[\0645\0636\0644\0639]')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012021411750687)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0646\0637\0642\0629 \0627\0644\0645\0637\0648\064A\0629: %0')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127129946750721)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\064A')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011008048750686)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0646\0642\0644 \0627\0644\0641\0627\0635\0644 \0627\0644\0645\0648\062C\0647 \0623\0641\0642\064A\064B\0627 \0625\0644\0649 \0627\0644\064A\0633\0627\0631 \0623\0648 \0625\0644\0649 \0627\0644\064A\0645\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011281571750686)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0644\062D\062C\0645 \0648\0647\0648 %0px')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012227308750687)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0627\0644\062D\062F \0627\0644\0623\062F\0646\0649 \0644\0644\062D\062C\0645 \0648\0647\0648 %0px')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012132571750687)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0637\064A \0627\0644\0645\0646\0637\0642\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011967560750687)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062A \0627\0633\062A\0639\0627\062F\0629 \0627\0644\0645\0646\0637\0642\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011600586750686)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\063A\064A\064A\0631 \0627\0644\062D\062C\0645 \0625\0644\0649 %0px')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011807994750686)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0646\0637\0642\0629 \0627\0644\0645\0633\062A\0639\0627\062F\0629: %0')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127071965750721)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\0639\0627\062F\0629')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137011131844750686)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\0631\064A\0643 \0627\0644\0641\0627\0635\0644 \0627\0644\0645\0648\062C\0647 \0639\0645\0648\062F\064A\064B\0627 \0644\0623\0639\0644\0649 \0623\0648 \0644\0623\0633\0641\0644')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176551393750737)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D \0627\0644\062A\0642\064A\064A\0645')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166407268750734)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0641\064A \0646\0637\0627\0642 \062A\0642\064A\064A\0645 \0635\0627\0644\062D \0645\0646 1 - %1')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166517148750734)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \063A\064A\0631 \0631\0642\0645\064A')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162642463750733)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0633\0627\0644\0629 \0646\062C\0627\062D')
,p_is_js_message=>true
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224402484750752)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224345550750752)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0628\0642')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134568154750724)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0646\0638\0627\0645 \0627\0644\0633\062C\0644 (\0627\0644\0633\062C\0644\0627\062A) \0628\0637\0628\0639\0629 \0627\0644\0645\0647\0645\0629 \0647\0630\0647')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142829750750726)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \062A\0646\0641\064A\0630 \0625\062C\0631\0627\0621 \0627\0644\0645\0647\0645\0629 %0 - \062A\0645 \062A\0639\064A\064A\0646 \0627\0644\0645\0647\0645\0629 \0639\0644\0649 \0627\0644\062D\0627\0644\0629 \062E\0637\0623\060C \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \0631\0645\0632 \0625\062C\0631\0627\0621 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023022278750690)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \062A\0639\0644\064A\0642: \063A\064A\0631 \0645\0635\062F\0642 \0639\0644\064A\0647')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022332234750690)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0639\064A\064A\0646 \0627\0644\0645\0647\0645\0629 \0628\0627\0644\0641\0639\0644')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015730245750688)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062A\062E\0635\064A\0635 \0625\0644\0649 %0')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022020452750690)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\063A\0627\0621 \0627\0644\0645\0647\0645\0629: \063A\064A\0631 \0645\0635\062F\0642 \0639\0644\064A\0647')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037641582750694)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0625\0632\0627\0644\0629 \0627\0644\0645\0627\0644\0643 \0627\0644\0641\0639\0644\064A \0644\0647\0630\0647 \0627\0644\0645\0647\0645\0629. \0627\0644\0631\062C\0627\0621 \062A\0641\0648\064A\0636 \0627\0644\0645\0647\0645\0629 \0625\0644\0649 \0645\0634\0627\0631\0643 \0622\062E\0631 \0642\0628\0644 \0625\0639\0627\062F\0629 \0645\062D\0627\0648\0644\0629 \062A\0634\063A\064A\0644 \0647\0630\0647 \0627\0644\0639\0645\0644\064A\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021605028750689)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0637\0627\0644\0628\0629 \0628\0627\0644\0645\0647\0645\0629: \063A\064A\0631 \0645\0635\062F\0642 \0639\0644\064A\0647')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021770386750689)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0643\0645\0627\0644 \0627\0644\0645\0647\0645\0629: \063A\064A\0631 \0645\0635\062F\0642 \0639\0644\064A\0647')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021858821750689)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0641\0648\064A\0636 \0627\0644\0645\0647\0645\0629: \063A\064A\0631 \0645\0635\062F\0642 \0639\0644\064A\0647')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020286693750689)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0623\0646 \064A\0643\0648\0646 \062A\0627\0631\064A\062E \0627\0633\062A\062D\0642\0627\0642 \0627\0644\0645\0647\0645\0629 \0641\064A \0627\0644\0645\0627\0636\064A.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015540812750688)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0633\062A\062D\0642\0627\0642 %0')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015947842750688)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \0625\062C\0631\0627\0621 \0627\0644\0645\0647\0645\0629 %1. \0631\0633\0627\0644\0629 \0627\0644\062E\0637\0623 - %0')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015668124750688)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015266627750688)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\062C\0627\062D')
,p_is_js_message=>true
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015466403750688)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\062C\062D \0627\0644\0625\062C\0631\0627\0621 %1 \0645\0639 \0638\0647\0648\0631 \0627\0644\0631\0633\0627\0644\0629 %0')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018739696750689)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0628\0644 \0627\0646\062A\0647\0627\0621 \0627\0644\0635\0644\0627\062D\064A\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044348283750696)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\063A\0627\0621')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043841271750696)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0644\063A\0627\0621 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044447993750696)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\0633\0645\0648\062D \0644\0644\0645\0634\0627\0631\0643 \0628\0625\0644\063A\0627\0621 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043752654750696)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0637\0627\0644\0628\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044139378750696)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062A \0627\0644\0645\0637\0627\0644\0628\0629 \0628\0627\0644\0645\0647\0645\0629 \0628\0627\0644\0641\0639\0644 \0628\0648\0627\0633\0637\0629 \0645\0633\062A\062E\062F\0645 \0623\0648 \0645\0634\0627\0631\0643 \0622\062E\0631 \0644\0627 \064A\062D\0642 \0644\0647 \0627\0644\0645\0637\0627\0644\0628\0629 \0628\0647\0630\0647 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043909201750696)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0645 %0 \0628\0627\0644\0645\0637\0627\0644\0628\0629 \0628\0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145097333750727)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0643\0645\0627\0644')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043553112750696)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0643\062A\0645\0644\062A \0627\0644\0645\0647\0645\0629 \0628\0627\0644\0646\062A\064A\062C\0629 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044859304750696)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0647\0645\0629 \063A\064A\0631 \0645\0639\064A\0646\0629 \0623\0648 \0627\0644\0645\0634\0627\0631\0643 \063A\064A\0631 \0645\0633\0645\0648\062D \0644\0647 \0628\0625\062A\0645\0627\0645 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005236729750685)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0643\062A\0645\0644\062A \0627\0644\0645\0647\0645\0629 \0628\062F\0648\0646 \0646\062A\064A\062C\0629')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145169190750727)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0648\064A\0646')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137038068564750694)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0643\0648\064A\0646 \0627\0644\0645\0647\0645\0629 \0628\0627\0644\0645\0639\0631\0641 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145242401750727)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0641\0648\064A\0636')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043637724750696)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0641\0648\064A\0636 \0627\0644\0645\0647\0645\0629 \0625\0644\0649 \0627\0644\0645\0627\0644\0643 \0627\0644\0645\062D\062A\0645\0644 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044250596750696)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0634\0627\0631\0643 \0623\0648 \0627\0644\0645\0634\0627\0631\0643 \0627\0644\062C\062F\064A\062F \0644\064A\0633 \0627\0644\0645\0627\0644\0643 \0627\0644\0645\062D\062A\0645\0644 \0644\0647\0630\0647 \0627\0644\0645\0647\0645\0629 \0623\0648 \0644\0627 \064A\0645\0644\0643 \0627\0644\062D\0642\0648\0642')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017367835750688)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0627\0621 \0627\0644\0635\0644\0627\062D\064A\0629')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018478380750688)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\062A \0635\0644\0627\062D\064A\0629 \0627\0644\0645\0647\0645\0629.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145370106750727)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014032672750687)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0647\0645\0629 \063A\064A\0631 \0645\0639\064A\0646\0629 \0623\0648 \0627\0644\0645\0634\0627\0631\0643 \063A\064A\0631 \0645\0633\0645\0648\062D \0644\0647 \0628\0637\0644\0628 \0645\0639\0644\0648\0645\0627\062A \062D\0648\0644 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014244278750687)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0637\0644\0628 \0645\0639\0644\0648\0645\0627\062A \0644\0644\0645\0647\0645\0629 \0623\0648 \0627\0644\0645\0634\0627\0631\0643 \063A\064A\0631 \0645\0633\0645\0648\062D \0644\0647 \0628\0625\0631\0633\0627\0644 \0645\0639\0644\0648\0645\0627\062A \062D\0648\0644 \0627\0644\0645\0647\0645\0629.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017819459750688)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0646\0647\0627\0621 \0635\0644\0627\062D\064A\0629 \0627\0644\0645\0647\0645\0629 \0644\0623\0646\0647 \062A\0645 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0645\0631\0627\062A \0627\0644\062A\062C\062F\064A\062F %0.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045157105750696)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0647\0645\0629 \0644\064A\0633\062A \0628\0627\0644\062D\0627\0644\0629 \0627\0644\0635\062D\064A\062D\0629 \0623\0648 \0627\0644\0645\0634\0627\0631\0643 \0644\064A\0633 \0645\0633\0624\0648\0644 \0623\0639\0645\0627\0644 \0644\0647\0630\0647 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045271949750696)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0644\064A\0629 %0 \063A\064A\0631 \0645\0639\0631\0648\0641\0629 \0623\0648 \0644\0627 \062A\0646\0637\0628\0642 \0639\0644\0649 \0647\0630\0647 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145495248750727)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0635\062F\0627\0631')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131197052750723)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0635\062F\0627\0631 \0627\0644\0645\0647\0645\0629\060C \064A\0645\0643\0646 \0627\0644\0622\0646 \0644\0644\0622\062E\0631\064A\0646 \0627\0644\0645\0637\0627\0644\0628\0629 \0628\0647\0627.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024041533750690)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\0633\0645\0648\062D \0628\0625\0635\062F\0627\0631 \0627\0644\0645\0647\0645\0629 - \0627\0644\0645\0633\062A\062E\062F\0645 \0647\0648 \0645\0627\0644\0643 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041035185750695)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\0645\0627\0644\0643')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041269619750695)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062A \0625\0632\0627\0644\0629 \0627\0644\0645\0634\0627\0631\0643 %0 \0645\0646 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018687173750689)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\062F\064A\062F')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017521603750688)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062C\062F\064A\062F \0627\0644\0645\0647\0645\0629 \0628\0627\0644\0645\0639\0631\0641 %0\060C \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0645\0631\0627\062A \0627\0644\062A\062C\062F\064A\062F \0627\0644\0645\062A\0628\0642\064A\0629 \0642\0628\0644 \0627\0646\062A\0647\0627\0621 \0627\0644\0635\0644\0627\062D\064A\0629 \0647\0648 %1.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018533844750688)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062C\062F\064A\062F \0645\0639\0631\0641 \0627\0644\0645\0647\0645\0629 %0 \0628\0645\0639\0631\0641 \0627\0644\0645\0647\0645\0629 %1')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014598339750687)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0644\0628 \0645\0639\0644\0648\0645\0627\062A')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014459341750687)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0637\0644\0628 %0 \0644\0645\0632\064A\062F \0645\0646 \0627\0644\0645\0639\0644\0648\0645\0627\062A: %1')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012363623750687)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0645 \0628\062A\0639\064A\064A\0646 \062C\0647\0629 \0627\0644\0628\0627\062F\0626 \0625\0645\0643\0627\0646\064A\0629 \0627\0644\0625\0643\0645\0627\0644 \0625\0644\0649 %0')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014602604750687)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0642\062F\064A\0645 \0645\0639\0644\0648\0645\0627\062A')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014347424750687)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0631\0633\0627\0644 \0627\0644\0645\0639\0644\0648\0645\0627\062A \0627\0644\0645\0637\0644\0648\0628\0629 \0625\0644\0649 %0: %1')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145502455750727)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062B \0627\0644\062A\0639\0644\064A\0642')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042043786750695)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \062A\0639\0644\064A\0642: %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044906725750696)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \062A\0633\0645\062D \062D\0627\0644\0629 \0627\0644\0645\0647\0645\0629 \0628\0623\064A \062A\0639\0644\064A\0642\0627\062A')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052281009750699)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\064A\064A\0646 \062A\0627\0631\064A\062E \0627\0633\062A\062D\0642\0627\0642 \0627\0644\0645\0647\0645\0629 \0625\0644\0649 %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010319590750686)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\062D\062F\064A\062B \0645\0633\062A\062D\0642 \0641\064A')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145630618750727)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062B \0627\0644\0645\0627\0644\0643')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043353473750696)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \0645\0627\0644\0643 \0645\062D\062A\0645\0644 %0 \0625\0644\0649 \0645\0634\0627\0631\0643\064A \0627\0644\0645\0647\0645\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042418671750696)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062B \0627\0644\0645\0639\0644\0645\0627\062A')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137145792712750727)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0648\0644\0648\064A\0629 \0627\0644\062A\062D\062F\064A\062B')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044060004750696)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\064A\064A\0646 \0623\0648\0644\0648\064A\0629 \0627\0644\0645\0647\0645\0629 \0639\0644\0649 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041377274750695)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062D\062F\064A\062B \0627\0644\0645\0639\0644\0645\0629 "%0" \0645\0646 "%1" \0625\0644\0649 "%2".')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024881881750690)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0644\063A\0627\0621 \0627\0644\0645\0647\0645\0629 \0628\0633\0628\0628 \0625\0646\0647\0627\0621 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 \0627\0644\0645\0642\0627\0628\0644.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021913782750690)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0648\062C\064A\0647 \0645\0647\0645\0629: \063A\064A\0631 \0645\0635\062F\0642 \0639\0644\064A\0647')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015306684750688)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0628\062F\0621 \0628\0648\0627\0633\0637\0629: %0 %1')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024252997750690)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \062F\0627\062E\0644\064A \063A\064A\0631 \0645\062A\0648\0642\0639')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022500470750690)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0634\063A\064A\0644 \0627\0644\0645\0647\0645\0629 \063A\064A\0631 \0642\0627\0628\0644 \0644\0644\062A\0637\0628\064A\0642')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048108027750697)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0647\0630\0627 \0627\0644\0645\0627\0644\0643 \0627\0644\0645\062D\062A\0645\0644 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023881967750690)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\064F\0639\062A\0645\062F')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023994876750690)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0641\0648\0636')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005345789750685)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0637\0644\0628 \0627\0643\062A\0645\0627\0644 \0627\0644\0645\0647\0645\0629 \0648\062C\0648\062F \0646\062A\064A\062C\0629')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137005586160750685)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\0633\0645\0648\062D \0628\0623\0646 \064A\0643\0648\0646 \0644\0644\0645\0647\0645\0629 \0646\062A\064A\062C\0629')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137041153940750695)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\062F\064A\062B \0627\0644\0645\0639\0644\0645\0629 %0.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037488725750694)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0634\0627\0631\0643 \0645\0648\062C\0648\062F \0628\0627\0644\0641\0639\0644 \0644\0645\062B\064A\0644 \0627\0644\0645\0647\0645\0629 \0647\0630\0627.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138972096750725)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0627\062C\0644')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016087836750688)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0627\062C\0644')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138809092750725)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\062A\0641\0639')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016143477750688)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0648\0644\0648\064A\0629 \0642\0635\0648\0649')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138778237750725)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062A\0648\0633\0637')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016243804750688)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0648\0644\0648\064A\0629 \0645\062A\0648\0633\0637\0629')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138675160750725)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\062E\0641\0636')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016354433750688)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0648\0644\0648\064A\0629 \0645\0646\062E\0641\0636\0629')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138550503750725)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0643\062B\0631 \0627\0646\062E\0641\0627\0636\064B\0627')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016451578750688)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\062F\0646\0649 \0623\0648\0644\0648\064A\0629')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022166663750690)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\064A\064A\0646 \0623\0648\0644\0648\064A\0629 \0627\0644\0645\0647\0645\0629: \063A\064A\0631 \0645\0635\062F\0642 \0639\0644\064A\0647')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023314335750690)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\064F\0639\064A\0651\0646')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023731845750690)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0625\0644\063A\0627\0621')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023444495750690)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0643\062A\0645\0644')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023637698750690)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137017119926750688)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\062A\0647\064A \0627\0644\0635\0644\0627\062D\064A\0629')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023574878750690)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013817510750687)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0639\0644\0648\0645\0627\062A \0645\0637\0644\0648\0628\0629')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137023217646750690)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\064F\0639\064A\0651\0646')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045643002750697)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0641\0634\0644 \062A\0643\0648\064A\0646 \0645\0647\0645\0629 \062C\062F\064A\062F\0629 \0644\062A\0639\0631\064A\0641 \0627\0644\0645\0647\0645\0629 %0 \0641\064A \0627\0644\062A\0637\0628\064A\0642 %1.'),
'SQLCODE: %2'))
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045562941750697)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644\062A \0645\062D\0627\0648\0644\0629 \062A\0643\0648\064A\0646 \0645\0647\0645\0629 \0644\062A\0639\0631\064A\0641 \0627\0644\0645\0647\0645\0629 %0 \0641\064A \0627\0644\062A\0637\0628\064A\0642 %1 \0644\0623\0646 \062A\0639\0631\064A\0641 \0627\0644\0645\0647\0645\0629 \0644\0627 \064A\062A\0636\0645\0646 \0623\064A \0645\0627\0644\0643\064A\0646 \0645\062D\062A\0645\0644\064A\0646 - \0627\0644\0631\062C\0627\0621 \062A\062D\0631\064A\0631 \062A\0639\0631\064A\0641 \0627\0644\0645\0647\0645\0629 \0648\0625\0636\0627\0641\0629 \0645\0634\0627\0631\0643 \0648\0627\062D\062F \0639\0644\0649 \0627\0644\0623\0642\0644 \0645\0646 \0627\0644\0646\0648\0639 "\0645\0627\0644\0643 \0645\062D\062A\0645\0644"')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022867110750690)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \062A\0639\0631\064A\0641 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022771616750690)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0645\0634\0627\0631\0643\064A\0646 \0644\0647\0630\0647 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024171710750690)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0643\062B\0631 \0645\0646 \0645\0647\0645\0629 \0648\0627\062D\062F\0629 \0644\0645\0639\0631\0641 \0627\0644\0645\0647\0645\0629 \0627\0644\0645\062D\062F\062F\0629. \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0639 \0645\0633\0624\0648\0644 \0642\0627\0639\062F\0629 \0628\064A\0627\0646\0627\062A\0643')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022922782750690)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137022674562750690)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0645\0639\0644\0645\0629 \0627\0644\0645\0647\0645\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058910374750701)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\062C\0631\0627\0621')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058802397750701)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0639\062A\0645\0627\062F')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006291938750685)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \0625\062C\0631\0627\0621 \0642\0627\0639\062F\0629 \0627\0644\0627\0633\062A\062C\0627\0628\0629 %2 \0641\064A \062A\0646\0641\064A\0630 \062A\0639\0631\064A\0641 \0627\0644\0645\0647\0645\0629 %0 \0641\064A \0627\0644\062A\0637\0628\064A\0642 %1.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006478163750685)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062A \0625\0636\0627\0641\0629 \0627\0644\0645\0634\0627\0631\0643 %1 \0643\0628\062F\064A\0644 \0644\0644\0645\0634\0627\0631\0643 %0 . \0627\0644\0633\0628\0628 - %2 .')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210164494750748)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0631\064A\0637 \0627\0644\0623\062F\0648\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063660885750702)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0637\0628\064A\0642')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224832438750752)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\0633\064A\0639 / \0637\064A \0645\0646\0637\0642\0629 \0627\0633\062A\0643\0634\0627\0641')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224986566750752)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\0633\064A\0639 / \0637\064A \0639\0645\0648\062F \062C\0627\0646\0628\064A')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133312161750723)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\0632\0621 \0627\0644\0627\0633\062A\0643\0634\0627\0641 \0627\0644\0631\0626\064A\0633\064A')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034144003750693)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'ar'
,p_message_text=>unistr('"%0" \0627\0633\0645 \0639\0646\0635\0631 \0646\0627\0626\0628 \063A\064A\0631 \0635\0627\0644\062D.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141082531750726)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\0645 \0648\0627\062D\062F')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140846158750726)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0627\0639\0629 \0648\0627\062D\062F\0629')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141137019750726)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\064A\0627\0645')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140922585750726)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140778965750726)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141320268750726)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137141291349750726)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0628\0648\0639 \0648\0627\062D\062F')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039048000750695)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062D\062F\064A\062F %0 \0645\0646 \0627\0644\0639\0646\0627\0635\0631')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039225383750695)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0639\0646\0635\0631')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039173858750695)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062D\062F\064A\062F %0')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227977050750753)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062F\0627\064A\0629 \0627\0644\0635\0641\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085562156750709)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0645\0643\0646')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054012580750699)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0627\0644\0637\0644\0628.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137039610754750695)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\062F\064A\062B \0627\0644\0631\0633\0627\0644\0629 \0627\0644\0646\0635\064A\0629 %0 \0644\0623\0646\0647 \062A\0645 \0627\0644\0627\0634\062A\0631\0627\0643 \0641\064A\0647\0627 \0645\0646 \062A\0637\0628\064A\0642 \0622\062E\0631.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142717214750726)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629 \0645\0637\0644\0648\0628\0629')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059183158750701)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062A\0648\0649 \0627\0644\0639\0646\0648\0627\0646 %0\060C \0645\062E\0641\064A')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187568647750741)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\062C\062F \062A\063A\064A\064A\0631\0627\062A \063A\064A\0631 \0645\062D\0641\0648\0638\0629 \0641\064A \0647\0630\0647 \0627\0644\0635\0641\062D\0629.')
,p_is_js_message=>true
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049163046750698)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062A\0643\0634\0641')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048854047750698)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0642\0631\064A\0628')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049832613750698)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062A\0648\0649 \0627\0644\062A\0642\0631\064A\0628/\0627\0644\0625\0628\0639\0627\062F {0}%')
,p_is_js_message=>true
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048990758750698)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0628\0639\0627\0621')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049021244750698)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0627\0644\062A\0642\0631\064A\0628/\0627\0644\0625\0628\0639\0627\062F')
,p_is_js_message=>true
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024507951750690)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0645\062E\0637\0637 \0633\064A\0631 \0627\0644\0639\0645\0644 \0641\064A \0627\0644\0648\0642\062A \0627\0644\062D\0627\0644\064A.')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024442872750690)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062E\0637\0637 \0633\064A\0631 \0627\0644\0639\0645\0644')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026364421750691)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0645\0648\062C\0648\062F \062D\0627\0644\064A\064B\0627 \0641\064A \0627\0644\062D\0627\0644\0629 %1. \0648\0628\0627\0644\062A\0627\0644\064A \0644\0627 \064A\064F\0633\0645\062D \0628\0627\0644\062A\0634\063A\064A\0644')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028993857750692)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0643\062A\0645\0627\0644 \0627\0644\0645\062B\064A\0644 %1 \0644\0644\0646\0634\0627\0637 %2 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028733973750692)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0646\0634\0627\0621 \0645\062B\064A\0644 \062C\062F\064A\062F %1 \0644\0644\0646\0634\0627\0637 %2 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020594998750689)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0635\0641 \0628\064A\0627\0646\0627\062A \0625\0636\0627\0641\064A \0645\0642\062A\0631\0646 \0628\0645\062B\064A\0644 \0646\0634\0627\0637 \0633\064A\0631 \0627\0644\0639\0645\0644 \0647\0630\0627')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028869000750692)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062A \0625\0639\0627\062F\0629 \0645\062D\0627\0648\0644\0629 \062A\0634\063A\064A\0644 \0627\0644\0645\062B\064A\0644 \0627\0644\0641\0627\0634\0644 %1 \0644\0644\0646\0634\0627\0637 %2 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010867322750686)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0646\0647\0627\0621 \0645\062B\064A\0644 \0627\0644\0646\0634\0627\0637 %1 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044672819750696)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\062A \0645\0647\0644\0629 \0646\0634\0627\0637 \0627\0644\0645\062B\064A\0644 %1 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0648\062A\0645 \0625\0646\0647\0627\0624\0647.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029045991750692)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062B\064A\0644 %1 \0644\0644\0646\0634\0627\0637 %2 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0641\064A \062D\0627\0644\0629 \0627\0646\062A\0638\0627\0631')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010623486750686)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0639\062F\064A\0644 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0648\0627\0633\062A\0626\0646\0627\0641\0647 \0639\0646\062F \0627\0644\0646\0634\0627\0637 %1')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028038455750691)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0643\062A\0645\0627\0644 \0645\062B\064A\0644 \0627\0644\0627\0646\062A\0638\0627\0631 %1 \0644\0644\0646\0634\0627\0637 %2 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0628\0646\062C\0627\062D')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027801798750691)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0648\0636\0639 \0646\0634\0627\0637 \0627\0644\0627\0646\062A\0638\0627\0631 %1 \0641\064A \0627\0644\062D\0627\0644\0629 \0641\0634\0644 \0644\0623\0646 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0643\0627\0646 \0628\0627\0644\0641\0639\0644 \0641\064A \062D\0627\0644\0629 \0641\0634\0644 \0642\0628\0644 \0627\0643\062A\0645\0627\0644 \0627\0644\0646\0634\0627\0637')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027973673750691)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0646\0647\0627\0621 \0646\0634\0627\0637 \0627\0644\0627\0646\062A\0638\0627\0631 %1 \0644\0623\0646 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0643\0627\0646 \0628\0627\0644\0641\0639\0644 \0641\064A \0627\0644\062D\0627\0644\0629 "\062A\0645 \0627\0644\0627\0646\062A\0647\0627\0621" \0642\0628\0644 \0627\0643\062A\0645\0627\0644 \0627\0644\0646\0634\0627\0637')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010903488750686)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \0625\0646\0647\0627\0621 \0627\0644\0646\0634\0627\0637 %1 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0628\0633\0628\0628 \0627\0644\0627\0633\062A\062B\0646\0627\0621 - %2')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026543000750691)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\064A\0631 \0627\0644\0639\0645\0644 \0645\0634\063A\0648\0644 \062D\0627\0644\064A\064B\0627 \0628\0625\0643\0645\0627\0644 \0639\0645\0644\064A\0629 \0633\0627\0628\0642\0629. \0627\0644\0631\062C\0627\0621 \0627\0644\0645\062D\0627\0648\0644\0629 \0644\0627\062D\0642\064B\0627')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042679793750696)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0643\062A\0645\0644 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025627080750691)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0645\062A\0627\0628\0639\0629 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0644\0623\0646\0647 \062D\0627\0644\064A\064B\0627 \0641\064A \0627\0644\0646\0634\0627\0637 %1 \0648\0627\0644\0630\064A \0644\0627 \064A\0639\062A\0628\0631 \062D\0627\0644\0629 \0627\0646\062A\0638\0627\0631')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037567399750694)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0633\064A\0627\0642 \0627\0631\062A\0628\0627\0637 \0635\0627\0644\062D\064B\0627 \0644\0633\064A\0631 \0627\0644\0639\0645\0644 \0644\0644\0639\0645\0644\064A\0629 \0627\0644\062A\064A \064A\062C\0631\064A \062A\0646\0641\064A\0630\0647\0627 \0628\0648\0627\0633\0637\0629 \0646\0634\0627\0637 \0633\064A\0631 \0627\0644\0639\0645\0644. \064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0633\064A\0627\0642 \0627\0644\0627\0631\062A\0628\0627\0637 \0646\0635\064B\0627 \0645\062D\062F\062F\064B\0627 \0628\0641\0648\0627\0635\0644 \062A\062D\062A\0648\064A \0639\0644\0649 APEX_APPL_WORKFLOW \0645\062A\0628\0648\0639\064B\0627 \0628\0645\0639\0631\0641 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 \0648\0645\0639\0631\0641 \0645\062B\064A\0644 \0627\0644\0646\0634\0627\0637.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028291452750691)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0643\0648\064A\0646 \0645\062B\064A\0644 \062C\062F\064A\062F %0 \0644\0633\064A\0631 \0627\0644\0639\0645\0644 %1\060C \0627\0644\0646\0633\062E\0629 %2')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020365351750689)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0635\0641 \0628\064A\0627\0646\0627\062A \0625\0636\0627\0641\064A \0645\0642\062A\0631\0646 \0628\0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 \0647\0630\0627')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042865515750696)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0633\062A\062D\0642\0627\0642 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028137994750691)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0649 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0628\0627\0644\062D\0627\0644\0629 %1')
,p_version_scn=>2704458
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025398731750691)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A %1 \0644\0644\0634\0631\0648\0637 \0627\0644\062A\064A \062A\062E\0636\0639 \0644\0644\0645\0642\0627\0631\0646\0629 \0641\064A \0646\0634\0627\0637 \0627\0644\062A\0628\062F\064A\0644 \0644\0633\064A\0631 \0627\0644\0639\0645\0644 %0 \063A\064A\0631 \0645\062A\0648\0627\0641\0642 \0645\0639 \0645\064F\0634\063A\0644 \0627\0644\0634\0631\0637')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015186561750687)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0628\062F\0621 \0628\0648\0627\0633\0637\0629: %0 %1')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037996321750694)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0643\0648\064A\0646 \0645\062B\064A\0644 %0 \062C\062F\064A\062F \0645\0646 \0633\064A\0631 \0627\0644\0639\0645\0644 %1\060C \0627\0644\0625\0635\062F\0627\0631 %2 - \062A\0645 \0627\0633\062A\062F\0639\0627\0624\0647 \0645\0646 \0645\062B\064A\0644 \0627\0644\0646\0634\0627\0637 %4 \0644\0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %3')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137010781865750686)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0634\0627\0637 \0630\0648 \0627\0644\0645\0639\0631\0641 \0627\0644\062B\0627\0628\062A %1 \0644\064A\0633 \0646\0634\0627\0637\064B\0627 \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644 %0. \062A\062D\0642\0642 \0645\0646 \0645\0639\0631\0641\0627\062A \0627\0644\0646\0634\0627\0637 \0627\0644\062B\0627\0628\062A\0629 \0644\0625\0635\062F\0627\0631 \0633\064A\0631 \0627\0644\0639\0645\0644 \0627\0644\0645\0642\0627\0628\0644.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036024741750694)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0647\0648 \0645\0639\0644\0645\0629 \0645\0637\0644\0648\0628\0629 \0644\0633\064A\0631 \0627\0644\0639\0645\0644 \0647\0630\0627 \0648\0644\0627 \064A\062C\0628 \0623\0646 \062A\0643\0648\0646 NULL.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028663092750691)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0633\062A\0626\0646\0627\0641 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028595414750691)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\062A \0625\0639\0627\062F\0629 \0645\062D\0627\0648\0644\0629 \062A\0634\063A\064A\0644 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042924118750696)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0625\0639\0627\062F\0629 \0645\062D\0627\0648\0644\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043095779750696)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0625\0639\0627\062F\0627\062A \0627\0644\0645\062D\0627\0648\0644\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042710023750696)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\062F\0621 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036920176750694)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0634\0637')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037109122750694)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0643\062A\0645\0644')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037221944750694)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037343613750694)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0644\0642')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137037088582750694)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0646\0647\0627\0624\0647')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052343316750699)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0638\0627\0631')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028346918750691)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\0639\0644\064A\0642 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034202453750693)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\062F\064A\062F \0627\0644\0646\0634\0627\0637 \0627\0644\062A\0627\0644\064A \0644\0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0. \062A\062D\0642\0642 \0645\0646 \0627\0644\0634\0631\0648\0637 \0627\0644\0645\062D\062F\062F\0629 \0644\0646\0634\0627\0637 \0627\0644\062A\0628\062F\064A\0644 \0627\0644\062D\0627\0644\064A \0648\0642\0645 \0628\062A\0635\062D\064A\062D\0647\0627 \0642\0628\0644 \0625\0639\0627\062F\0629 \0645\062D\0627\0648\0644\0629 \0633\064A\0631 \0627\0644\0639\0645\0644.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137028437045750691)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0646\0647\0627\0621 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027526561750691)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0633\062A\0626\0646\0627\0641 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0625\0644\0627 \0628\0648\0627\0633\0637\0629 \0645\0633\0624\0648\0644 \0627\0644\0623\0639\0645\0627\0644')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027668175750691)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0625\0639\0627\062F\0629 \0645\062D\0627\0648\0644\0629 \062A\0634\063A\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0625\0644\0627 \0628\0648\0627\0633\0637\0629 \0645\0627\0644\0643 \0623\0648 \0645\0633\0624\0648\0644 \0623\0639\0645\0627\0644 \0623\0648 \0643\0644\0627\0647\0645\0627.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027110086750691)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\0639\0644\064A\0642 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0625\0644\0627 \0628\0648\0627\0633\0637\0629 \0645\0633\0624\0648\0644 \0623\0639\0645\0627\0644 \0644\0633\064A\0631 \0627\0644\0639\0645\0644')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137027484093750691)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0643\0645\0646 \0625\0644\0627 \0644\0645\0644\0627\0643 \0648\0645\0633\0624\0648\0644\064A \0623\0639\0645\0627\0644 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0625\0646\0647\0627\0621 \0633\064A\0631 \0627\0644\0639\0645\0644')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025859051750691)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\062F\064A\062B \0645\062A\063A\064A\0631\0627\062A \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0625\0644\0627 \0628\0648\0627\0633\0637\0629 \0645\0633\0624\0648\0644 \0623\0639\0645\0627\0644 \0645\062D\062F\062F \0641\064A \0633\064A\0631 \0627\0644\0639\0645\0644')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040493043750695)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0641\064A \062D\0627\0644\0629 \0645\0639\0637\0644\0629 \0623\0648 \0645\0639\0644\0642\0629 \0642\0628\0644 \0623\0646 \062A\062A\0645\0643\0646 \0645\0646 \062A\062D\062F\064A\062B \0645\062A\063A\064A\0631\0627\062A\0647.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031917112750692)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062D\062F\064A\062B \0642\064A\0645\0629 \0645\062A\063A\064A\0631 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0625\0644\0649 %1')
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042130183750695)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0634\062A\0645\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0639\0644\0649 \0646\0633\062E\0629 \0646\0634\0637\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042262514750696)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0634\062A\0645\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0639\0644\0649 \0646\0633\062E\0629 \0642\064A\062F \0627\0644\062A\0637\0648\064A\0631')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137042301244750696)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0634\062A\0645\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0 \0639\0644\0649 \0646\0633\062E\0629 \0646\0634\0637\0629 \0623\0648 \0642\064A\062F \0627\0644\062A\0637\0648\064A\0631')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025219432750690)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0645\062B\064A\0644 \0627\0644\0646\0634\0627\0637 %1 \0644\0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025017664750690)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0645\062B\064A\0644 \0633\064A\0631 \0627\0644\0639\0645\0644 %0')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060170609750701)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0634\062A\0645\0644 \0627\0644\0645\0635\0646\0641 \0639\0644\0649 \0648\0631\0642\0629 \0646\0634\0637\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060075879750701)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \062A\062A\0645 \062A\0647\064A\0626\0629 \0627\0644\0645\0635\0646\0641.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137059964270750701)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \062F\0627\062E\0644\064A \0623\062B\0646\0627\0621 \062A\0643\0648\064A\0646 \0645\0644\0641 XLSX.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062456574750702)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0631\0642\0629')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073083624750705)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0648\0631\0642\0629 \0627\0644\0639\0645\0644 "%0" \0645\064F\0633\062A\062E\062F\0645 \0628\0627\0644\0641\0639\0644. \062D\0627\0648\0644 \0627\0633\062A\062E\062F\0627\0645 \0627\0633\0645 \0645\062E\062A\0644\0641.')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201676818750745)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\062C\0631\0627\0621\0627\062A')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116630282750718)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0625\062C\0631\0627\0621\0627\062A')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112310226750717)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \062F\0627\0644\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112239517750717)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \0639\0645\0648\062F \062A\062C\0645\064A\0639 \062D\0633\0628')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149844305750729)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \0639\0645\0648\062F \062C\062F\0648\0644 \0645\062D\0648\0631\064A')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149961373750729)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0636\0627\0641\0629 \0639\0645\0648\062F \0635\0641')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084317417750708)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122835392750720)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\062C\0645\064A\0639')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103775060750714)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062A\0648\0633\0637')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108056045750715)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\062F\062F')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103876855750714)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\0642\0635\0649')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104031305750714)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0633\064A\0637')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103980035750714)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\062F\0646\0649')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103685778750714)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062C\0645\0648\0639 %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104720091750715)
,p_name=>'APEXIR_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0643\0644')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083698412750708)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0627\0641\0629 \0627\0644\0623\0639\0645\062F\0629')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063793410750702)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0644 \0627\0644\0635\0641\0648\0641')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198693535750744)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\062F\064A\0644')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200274538750744)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0641\062A\0631\0627\0636\064A \0627\0644\0628\062F\064A\0644: %0 ')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097885045750712)
,p_name=>'APEXIR_AND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132638739750723)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0639\0630\0631 \0627\0633\062A\064A\0631\0627\062F \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0645\062D\0641\0648\0638. \0627\0644\0645\062D\062A\0648\0649 \062A\0627\0644\0641.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132723566750723)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0639\0630\0631 \0627\0633\062A\064A\0631\0627\062F \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0645\062D\0641\0648\0638. \0627\0644\0645\062D\062A\0648\0649 \0641\0627\0631\063A.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085800789750709)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0637\0628\064A\0642')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079465635750707)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0635\0627\0639\062F\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100979519750713)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0639\062A\0628\0627\0631\064B\0627 \0645\0646 %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200861815750745)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062A\0648\0633\0637 %0')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192490248750742)
,p_name=>'APEXIR_BAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0631\064A\0637\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085190251750709)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\064A\0646')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078271282750707)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0648\0646 \0627\0644\062E\0644\0641\064A\0629')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080157746750707)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0632\0631\0642')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114294626750717)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0641\0644')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045007477750696)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0632\0631\0627\0631 \0628\062C\0627\0646\0628 \0634\0631\064A\0637 \0628\062D\062B %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080708791750707)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\063A\0627\0621')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087074759750709)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0641\0626\0629')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078105639750707)
,p_name=>'APEXIR_CELL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062E\0644\064A\0629')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104602277750714)
,p_name=>'APEXIR_CHART'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115166870750718)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\0627\0631\064D \0627\0644\0628\062F\0621...')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154879457750730)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \062A\0633\0645\064A\0629 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167212086750734)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\062C\0627\0648\0632 \0627\0633\062A\0639\0644\0627\0645\0643 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0646\0642\0627\0637 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\0628\0627\0644\063A %0 \0644\0643\0644 \0631\0633\0645 \0628\064A\0627\0646\064A. \0627\0644\0631\062C\0627\0621 \062A\0637\0628\064A\0642 \0645\0631\0634\062D \0644\062A\0642\0644\064A\0644 \0639\062F\062F \0627\0644\062A\0633\062C\064A\0644\0627\062A \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0623\0633\0627\0633\064A \0627\0644\062E\0627\0635 \0628\0643.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166131164750734)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0642\0644\0644 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0627\0644\0635\0641\0648\0641 \0641\064A \0627\0633\062A\0639\0644\0627\0645 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0645\0646 \0639\062F\062F \0627\0644\0635\0641\0648\0641 \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0623\0633\0627\0633\064A\060C \0648\0644\064A\0633 \0645\0646 \0639\062F\062F \0627\0644\0635\0641\0648\0641 \0627\0644\0645\0639\0631\0648\0636\0629. \064A\062A\062C\0627\0648\0632 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0631\0626\064A\0633\064A \0644\062F\064A\0643 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0627\0644\0635\0641\0648\0641 %0. \0627\0644\0631\062C\0627\0621 \062A\0637\0628\064A\0642 \0645\0631\0634\062D \0644\062A\0642\0644\064A\0644 \0639\062F\062F \0627\0644\0633\062C\0644\0627\062A \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0623\0633\0627\0633\064A \0627\0644\062E\0627\0635 \0628\0643.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083780809750708)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047615667750697)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162807535750733)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\0643\0644')
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101352722750713)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0635\064A\063A\0629 \0627\0644\062A\0642\0631\064A\0631')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109176604750716)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080612998750707)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120486369750719)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0639\0645\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087631287750709)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0633\0645\0627\0621 \0627\0644\0628\062F\064A\0644\0629 \0644\0644\0623\0639\0645\062F\0629')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195230468750743)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0634\062D...')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055452436750700)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0623\0633 \0627\0644\0639\0645\0648\062F')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069597514750704)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0631\0627\0621\0627\062A \0627\0644\0639\0645\0648\062F')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069883180750704)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0631\0627\0621\0627\062A \0627\0644\0639\0645\0648\062F "%0"')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111218225750716)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114912349750718)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0644\0648\0645\0627\062A \0627\0644\0623\0639\0645\062F\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197582105750744)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\0645\064A\0629 \0627\0644\0639\0645\0648\062F')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112648480750717)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F %0')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095500953750712)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096874766750712)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A \0639\0644\0649')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079116364750707)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097046076750712)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0641\064A \0622\062E\0631')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106198948750715)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0641\064A \0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096933686750712)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A \0622\062E\0631')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106045960750715)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\064A \0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079062128750707)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \062E\0627\0644\064A\064B\0627')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078932848750707)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0627\0644\064D')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078764454750707)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062B\0644')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079259976750707)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0641\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078885673750707)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0645\062B\0644')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095891662750712)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0637\0627\0628\0642 \0627\0644\062A\0639\0628\064A\0631 \0627\0644\0639\0627\062F\064A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101206823750713)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\062D\062A\0633\0627\0628')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165879165750734)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0628\064A\0631 \062D\0633\0627\0628\064A')
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120753681750719)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0648\064A\0646 \0627\062D\062A\0633\0627\0628 \0628\0627\0633\062A\062E\062F\0627\0645 \0627\0644\0623\0633\0645\0627\0621 \0627\0644\0645\0633\062A\0639\0627\0631\0629 \0644\0644\0623\0639\0645\062F\0629.')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120874333750719)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'ar'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120916485750720)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'ar'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121031361750720)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'ar'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061904511750702)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'ar'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105400570750715)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0633\0627\0628')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113268961750717)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0648\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_is_js_message=>true
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116241550750718)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0648\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202806726750745)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0639\0645\062F\0629 \0641\0648\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058683684750701)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\062F \0627\0644\0645\0645\064A\0632')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201307864750745)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\062F \0627\0644\0645\0645\064A\0632')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201299984750745)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\062F %0')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174218234750736)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\0645\064A')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137227539972750753)
,p_name=>'APEXIR_DATA'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\064A\0627\0646\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115098972750718)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\064A\0627\0646\0627\062A \0627\0644\062A\0642\0631\064A\0631 \0645\0646\0630 %0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048082279750697)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0628\064A\0627\0646\0627\062A %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084469064750708)
,p_name=>'APEXIR_DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0631\064A\062E')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118976848750719)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0641\062A\0631\0627\0636\064A')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198452628750744)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0627\0641\062A\0631\0627\0636\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080853689750707)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0630\0641')
,p_is_js_message=>true
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084752414750709)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0647\0644 \062A\0631\064A\062F \062D\0630\0641 \0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0642\0631\064A\0631 \0647\0630\0647\061F')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185209507750740)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0630\0641 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0627\0641\062A\0631\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704482
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112922597750717)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0630\0641 \0627\0644\062A\0642\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079588318750707)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0646\0627\0632\0644\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087155054750709)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0635\0641')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111191096750716)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0635\0641 \0648\0627\062D\062F')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119467046750719)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\062A\062C\0627\0647 %0')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120354130750719)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0637\0644')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080333637750707)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0648\0636')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083515353750708)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119393580750719)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0641\064A \0627\0644\062A\0642\0631\064A\0631')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114189619750717)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0623\0633\0641\0644')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105589218750715)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0646\0632\064A\0644')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119262488750719)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\0645 \0627\0644\0639\0631\0636')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188536786750741)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \062A\0645\064A\064A\0632 \0628\0627\0644\0634\0631\0637 \0630\0627\062A\0647 \0628\0627\0644\0641\0639\0644.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203083117750745)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\0648\0631\064A \0645\0643\0631\0631. \064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\0648\0631\064A \0641\0631\064A\062F\064B\0627.')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203253678750745)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115282242750718)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0625\0639\062F\0627\062F\0627\062A \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121865349750720)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085771259750709)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0641\0648\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122240363750720)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0645\0631\0634\062D')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088757378750710)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0627\0633\062A\0639\0644\0627\0645 \0639\0646 \0628\064A\0627\0646\0627\062A \062A\0627\0631\064A\062E\064A\0629')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180009008750738)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0627\0644\0645\062C\0645\0648\0639\0629 \062D\0633\0628')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122173997750720)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0627\0644\062A\0645\064A\064A\0632')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150171471750729)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \0627\0644\062C\062F\0648\0644 \0627\0644\0645\062D\0648\0631\064A')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109546099750716)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631 \062A\0642\0631\064A\0631')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198711936750744)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070910478750704)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199048387750744)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\062E\0629 \0645\062E\0641\064A\0629')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199229868750744)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0635')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198974010750744)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\062E\0629 \0625\0644\0649')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199726156750744)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\062F\0644 \0627\0644\062A\0643\0631\0627\0631')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076131042750706)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\0643\0648\064A\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A \0644\0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642. \0627\0644\0631\062C\0627\0621 \0627\0644\0627\062A\0635\0627\0644 \0628\0627\0644\0645\0633\0624\0648\0644 \0644\062F\064A\0643.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173594563750736)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0639\0646\0648\0627\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199377956750744)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0637\0644\0627\0639 \0639\0644\0649 \0627\0644\0645\0631\0641\0642')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199118805750744)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0648\0636\0648\0639')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174515019750736)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0645\0648\0636\0648\0639 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198834518750744)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\0649')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077906286750706)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0645\0643\0646')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122027211750720)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\0643\064A\0646/\062A\0639\0637\064A\0644')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121500505750720)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623! %0')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121171205750720)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0645\062B\0644\0629')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121959820750720)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0645\062B\0644\0629:')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083461105750708)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\062B\0646\0627\0621 \0627\0644\0642\064A\0645 \0627\0644\062E\0627\0644\064A\0629')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122590968750720)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\0633\064A\0639/\0637\064A')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120174465750719)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0639\0628\064A\0631')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105040407750715)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0631\0634\064A\062D')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116104304750718)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D\0627\062A')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126810234750721)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0628\064A\0631 \0627\0644\0645\0631\0634\062D')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225062136750752)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0628\064A\0631 \0627\0644\0645\0631\0634\062D \0637\0648\064A\0644 \0644\0644\063A\0627\064A\0629.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069745280750704)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0642\062A\0631\0627\062D\0627\062A \0627\0644\062A\0631\0634\064A\062D')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126735989750721)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0645\0631\0634\062D')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122755665750720)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0623\0639\0645\062F\0629 \0644\0644\0628\062D\062B')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105343854750715)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\0627\0631\064A\062E\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119977933750719)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\064A\062D \0644\0643 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0639\0646 \0628\064A\0627\0646\0627\062A \062A\0627\0631\064A\062E\064A\0629 \0639\0631\0636 \0627\0644\0628\064A\0627\0646\0627\062A \0643\0645\0627 \0643\0627\0646\062A \0645\0648\062C\0648\062F\0629 \0633\0627\0628\0642\064B\0627.')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173918222750736)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\0627\0631\064A\062E\064A\0629')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175334921750737)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\064A\063A\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101151949750713)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0646\0627\0639 \0627\0644\0635\064A\063A\0629 %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112899772750717)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062F\0627\0644\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120664258750719)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062F\0648\0627\0644 %0')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198348379750744)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062F\0648\0627\0644/\0627\0644\0639\0648\0627\0645\0644')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112507321750717)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062F\0627\0644\0629 %0')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104866660750715)
,p_name=>'APEXIR_GO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0642\0627\0644 \0625\0644\0649')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078428972750707)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\062E\0636\0631')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123437009750720)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639 \062D\0633\0628 \0627\0644\0623\0639\0645\062F\0629')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123580464750720)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639 \062D\0633\0628 \0627\0644\0648\0638\0627\0626\0641')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058794810750701)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639 \062D\0633\0628')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199421039750744)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639 \062D\0633\0628 \0627\0644\0639\0645\0648\062F %0')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137154989655750730)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0639\0645\0648\062F \062A\062C\0645\064A\0639 \062D\0633\0628.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166073422750734)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0642\0644\0644 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0627\0644\0635\0641\0648\0641 \0641\064A \0627\0633\062A\0639\0644\0627\0645 \062A\062C\0645\064A\0639 \062D\0633\0628 \0645\0646 \0639\062F\062F \0627\0644\0635\0641\0648\0641 \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0623\0633\0627\0633\064A\060C \0648\0644\064A\0633 \0645\0646 \0639\062F\062F \0627\0644\0635\0641\0648\0641 \0627\0644\0645\0639\0631\0648\0636\0629. \064A\062A\062C\0627\0648\0632 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0631\0626\064A\0633\064A \0644\062F\064A\0643 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0627\0644\0635\0641\0648\0641 %0. \0627\0644\0631\062C\0627\0621 \062A\0637\0628\064A\0642 \0645\0631\0634\062D \0644\062A\0642\0644\064A\0644 \0639\062F\062F \0627\0644\0633\062C\0644\0627\062A \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0623\0633\0627\0633\064A \0627\0644\062E\0627\0635 \0628\0643.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146236273750727)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0632\0631 \062A\062C\0645\064A\0639 \062D\0633\0628')
,p_is_js_message=>true
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202914781750745)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0631\062A\064A\0628 \0641\0631\0632 \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047829405750697)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0645\064A\0639 \062D\0633\0628 \0637\0631\064A\0642\0629 \0639\0631\0636 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083822633750708)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0623\0641\0642\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117816841750719)
,p_name=>'APEXIR_HELP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0639\0644\064A\0645\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109690930750716)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\062A\062A\064A\062D \0627\0644\062A\0642\0627\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \0644\0644\0645\0633\062A\062E\062F\0645\064A\0646 \062A\062E\0635\064A\0635 \0627\0644\062A\0642\0627\0631\064A\0631. \064A\0645\0643\0646 \0644\0644\0645\0633\062A\062E\062F\0645\064A\0646 \062A\0639\062F\064A\0644 \0627\0644\0625\0637\0627\0631 \0627\0644\0639\0627\0645 \0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\0642\0631\064A\0631 \0639\0628\0631 \062A\062D\062F\064A\062F \0627\0644\0623\0639\0645\062F\0629 \0648\062A\0637\0628\064A\0642 \0627\0644\0645\0631\0634\062D\0627\062A \0648\0627\0644\062A\0645\064A\064A\0632 \0648\0627\0644\0641\0631\0632. \064A\0645\0643\0646 \0644\0644\0645\0633\062A\062E\062F\0645\064A\0646 \0643\0630\0644\0643 \062A\062D\062F\064A\062F \0641\0648\0627\0635\0644 \0648\062A\062C\0645\064A\0639\0627\062A \0648\0631\0633\0648\0645 \0628\064A\0627\0646\064A\0629 \0648\0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628 \0648\0625\0636\0627\0641\0629 \0627\0644\0639\0645\0644\064A\0627\062A \0627\0644\062D\0633\0627\0628\064A\0629 \0627\0644\062E\0627')
||unistr('\0635\0629 \0628\0647\0645. \0643\0645\0627 \064A\0645\0643\0646 \0644\0644\0645\0633\062A\062E\062F\0645\064A\0646 \0625\0639\062F\0627\062F \0627\0634\062A\0631\0627\0643 \0644\064A\062A\0645 \0625\0631\0633\0627\0644 \0646\0633\062E\0629 HTML \0645\0646 \0627\0644\062A\0642\0631\064A\0631 \0625\0644\064A\0647\0645 \0641\064A \0641\062A\0631\0627\062A \0645\062D\062F\062F\0629. \064A\0645\0643\0646 \0644\0644\0645\0633\062A\062E\062F\0645\064A\0646 \062A\0643\0648\064A\0646 \0639\062F\0629 \0645\062A\063A\064A\0631\0627\062A \0645\0646 \062A\0642\0631\064A\0631 \0648\062D\0641\0638\0647\0627 \0643\062A\0642\0627\0631\064A\0631 \0645\0639\064A\0646\0629 \0644\0639\0631\0636\0647\0627 \0628\0634\0643\0644 \0639\0627\0645 \0623\0648 \062E\0627\0635. '),
'<p/>',
unistr('\062A\0644\062E\0635 \0627\0644\0623\0642\0633\0627\0645 \0627\0644\062A\0627\0644\064A\0629 \0627\0644\0637\0631\0642 \0627\0644\062A\064A \064A\0645\0643\0646\0643 \0628\0647\0627 \062A\062E\0635\064A\0635 \062A\0642\0631\064A\0631 \062A\0641\0627\0639\0644\064A. \0644\0645\0639\0631\0641\0629 \0627\0644\0645\0632\064A\062F\060C \0627\0637\0644\0639 \0639\0644\0649 "\0627\0633\062A\062E\062F\0627\0645 \0627\0644\062A\0642\0627\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A\0629" \0641\064A <i>\062F\0644\064A\0644 \0645\0633\062A\062E\062F\0645 Oracle APEX</i>.')))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116751855750718)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0638\0647\0631 \0642\0627\0626\0645\0629 \0627\0644\0625\062C\0631\0627\0621\0627\062A \0639\0644\0649 \064A\0645\064A\0646 \0632\0631 "\0627\0646\062A\0642\0627\0644" \0641\064A \0634\0631\064A\0637 \0627\0644\0628\062D\062B. \0627\0633\062A\062E\062F\0645 \0647\0630\0647 \0627\0644\0642\0627\0626\0645\0629 \0644\062A\062E\0635\064A\0635 \062A\0642\0631\064A\0631 \062A\0641\0627\0639\0644\064A.')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110442648750716)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0627\0644\062A\062C\0645\064A\0639\0627\062A \0647\064A \0639\0645\0644\064A\0627\062A \062D\0633\0627\0628\064A\0629 \0631\064A\0627\0636\064A\0629 \062A\062A\0645 \0639\0644\0649 \0639\0645\0648\062F. \062A\0638\0647\0631 \0627\0644\062A\062C\0645\064A\0639\0627\062A \0628\0639\062F \0643\0644 \0641\0627\0635\0644 \0639\0646\0627\0635\0631 \062A\062D\0643\0645 \0648\0641\064A \0646\0647\0627\064A\0629 \0627\0644\062A\0642\0631\064A\0631 \0641\064A \0627\0644\0639\0645\0648\062F \062D\064A\062B \062A\0645 \062A\0639\0631\064A\0641\0647\0627. \062A\062A\0636\0645\0646 \0627\0644\062E\064A\0627\0631\0627\062A:'),
'<p>',
'</p><ul>',
unistr('<li><strong>\0627\0644\062A\062C\0645\064A\0639</strong> \064A\062A\064A\062D \062A\062D\062F\064A\062F \062A\062C\0645\064A\0639 \0645\0639\0631\0641 \0645\0633\0628\0642\064B\0627'),
unistr('\0644\062A\062D\0631\064A\0631\0647.</li>'),
unistr('<li><strong>\0627\0644\062F\0627\0644\0629</strong> \0647\064A \0627\0644\062F\0627\0644\0629 \0627\0644\0645\0637\0644\0648\0628 \062A\0646\0641\064A\0630\0647\0627 (\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644\060C SUM\060C MIN).</li>'),
unistr('<li><strong>\0627\0644\0639\0645\0648\062F</strong> \064A\064F\0633\062A\062E\062F\0645 \0644\062A\062D\062F\064A\062F \0627\0644\0639\0645\0648\062F \0627\0644\0630\064A \064A\062A\0645 \062A\0637\0628\064A\0642 \0627\0644\062F\0627\0644\0629 \0627\0644\0631\064A\0627\0636\064A\0629 \0639\0644\064A\0647. \064A\062A\0645 \0639\0631\0636 \0627\0644\0623\0639\0645\062F\0629'),
unistr('\0627\0644\0631\0642\0645\064A\0629 \0641\0642\0637.</li>'),
'</ul>'))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110511727750716)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\064A\0645\0643\0646\0643 \062A\0639\0631\064A\0641 \0631\0633\0645 \0628\064A\0627\0646\064A \0648\0627\062D\062F \0644\0643\0644 \062A\0642\0631\064A\0631 \0645\062D\0641\0648\0638. \0628\0645\062C\0631\062F'),
unistr('\062A\0639\0631\064A\0641\0647\060C \064A\0645\0643\0646\0643 \0627\0644\062A\0628\062F\064A\0644 \0628\064A\0646 \0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0648\0627\0644\062A\0642\0631\064A\0631 \0628\0627\0633\062A\062E\062F\0627\0645 \0623\064A\0642\0648\0646\0627\062A \0637\0631\0642 \0627\0644\0639\0631\0636 \0641\064A \0634\0631\064A\0637 \0627\0644\0628\062D\062B.'),
unistr('\062A\062A\0636\0645\0646 \0627\0644\062E\064A\0627\0631\0627\062A:  '),
'<p>',
'</p><ul>',
unistr('<li><strong>\0646\0648\0639 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A</strong> \064A\062D\062F\062F \0646\0648\0639 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\0645\0637\0644\0648\0628 \062A\0636\0645\064A\0646\0647.'),
unistr('\0648\064A\0645\0643\0646 \0627\0644\0627\062E\062A\064A\0627\0631 \0645\0646 \0628\064A\0646 \0634\0631\064A\0637\064A \0623\0641\0642\064A \0623\0648 \0634\0631\064A\0637\064A \0631\0623\0633\064A \0623\0648 \062F\0627\0626\0631\064A \0623\0648 \062E\0637\064A.</li>'),
unistr('<li><strong>\0627\0644\062A\0633\0645\064A\0629</strong> \062A\062A\064A\062D \0644\0643 \062A\062D\062F\064A\062F \0627\0644\0639\0645\0648\062F \0627\0644\0630\064A \0633\064A\062A\0645 \0627\0633\062A\062E\062F\0627\0645\0647 \0643\062A\0633\0645\064A\0629.</li>'),
unistr('<li><strong>\0639\0646\0648\0627\0646 \0627\0644\0645\062D\0648\0631 \0644\0644\062A\0633\0645\064A\0629</strong> \0627\0644\0639\0646\0648\0627\0646 \0627\0644\0645\0639\0631\0648\0636 \0639\0644\0649 \0627\0644\0645\062D\0648\0631 \0627\0644\0645\0631\062A\0628\0637 \0628\0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\062F\062F \0644\0644\062A\0633\0645\064A\0629.'),
unistr('\0644\0627 \064A\062A\0648\0641\0631 \0647\0630\0627 \0644\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\062F\0627\0626\0631\064A.</li>'),
unistr('<li><strong>\0627\0644\0642\064A\0645\0629</strong> \062A\062A\064A\062D \0644\0643 \062A\062D\062F\064A\062F \0627\0644\0639\0645\0648\062F \0627\0644\0630\064A \0633\064A\062A\0645 \0627\0633\062A\062E\062F\0627\0645\0647 \0643\0642\064A\0645\0629.  \0625\0630\0627 \0643\0627\0646\062A \0627\0644\062F\0627\0644\0629 \0627\0644\0645\064F\0633\062A\062E\062F\0645\0629 COUNT\060C \0641\0644\0633\062A \0628\062D\0627\062C\0629 \0644\062A\062D\062F\064A\062F \0642\064A\0645\0629.</li>'),
unistr('<li><strong>\0639\0646\0648\0627\0646 \0627\0644\0645\062D\0648\0631 \0644\0644\0642\064A\0645\0629</strong> \0627\0644\0639\0646\0648\0627\0646 \0627\0644\0645\0639\0631\0648\0636 \0639\0644\0649 \0627\0644\0645\062D\0648\0631 \0627\0644\0645\0631\062A\0628\0637 \0628\0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\062F\062F \0644\0644\0642\064A\0645\0629.'),
unistr('\0644\0627 \064A\062A\0648\0641\0631 \0647\0630\0627 \0644\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0627\0644\062F\0627\0626\0631\064A.</li>'),
unistr('<li><strong>\0627\0644\062F\0627\0644\0629</strong> \062F\0627\0644\0629 \0627\062E\062A\064A\0627\0631\064A\0629 \064A\062A\0645 \062A\0637\0628\064A\0642\0647\0627 \0639\0644\0649 \0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\062F\062F \0644\0644\0642\064A\0645\0629.</li>'),
unistr('<li><strong>\0627\0644\0641\0631\0632</strong> \0641\0631\0632 \0645\062C\0645\0648\0639\0629 \0627\0644\0646\062A\0627\0626\062C \0627\0644\062E\0627\0635\0629 \0628\0643.</li></ul>')))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109891754750716)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\064A\0624\062F\064A \0627\0644\0646\0642\0631 \0639\0644\0649 \0623\064A \0639\0646\0648\0627\0646 \0639\0645\0648\062F \0625\0644\0649 \0639\0631\0636 \0642\0627\0626\0645\0629 \0639\0646\0648\0627\0646 \0639\0645\0648\062F. \0648\062A\062A\0636\0645\0646 \0627\0644\062E\064A\0627\0631\0627\062A:'),
'<p></p>',
'<ul>',
unistr('<li>\0623\064A\0642\0648\0646\0629 <strong>\0641\0631\0632 \062A\0635\0627\0639\062F\064A</strong> \0641\0631\0632 \0627\0644\062A\0642\0631\064A\0631 \062D\0633\0628 \0627\0644\0639\0645\0648\062F \0628\062A\0631\062A\064A\0628 \062A\0635\0627\0639\062F\064A.</li>'),
unistr('<li>\0623\064A\0642\0648\0646\0629 <strong>\0641\0631\0632 \062A\0646\0627\0632\0644\064A</strong> \0641\0631\0632 \0627\0644\062A\0642\0631\064A\0631 \062D\0633\0628 \0627\0644\0639\0645\0648\062F \0628\062A\0631\062A\064A\0628 \062A\0646\0627\0632\0644\064A.</li>'),
unistr('<li><strong>\0625\062E\0641\0627\0621 \0627\0644\0639\0645\0648\062F</strong> \0625\062E\0641\0627\0621 \0627\0644\0639\0645\0648\062F. \0644\0627 \064A\0645\0643\0646 \0625\062E\0641\0627\0621 \0643\0644 \0627\0644\0623\0639\0645\062F\0629. \0625\0630\0627 \0644\0645 \064A\0643\0646 \0645\0646 \0627\0644\0645\0645\0643\0646 \0625\062E\0641\0627\0621 \0627\0644\0639\0645\0648\062F\060C \0641\0644\0646 \062A\0638\0647\0631 \0623\064A\0642\0648\0646\0629 \0625\062E\0641\0627\0621 \0627\0644\0639\0645\0648\062F.</li>'),
unistr('<li><strong>\062A\0642\0633\064A\0645 \0627\0644\0639\0645\0648\062F</strong> \062A\0643\0648\064A\0646 \0645\062C\0645\0648\0639\0629 \0645\0642\0633\0645\0629 \0641\064A \0627\0644\0639\0645\0648\062F. \064A\0624\062F\064A \0647\0630\0627 \0625\0644\0649 \0633\062D\0628 \0627\0644\0639\0645\0648\062F \0645\0646 \0627\0644\062A\0642\0631\064A\0631 \0643\0633\062C\0644 \0631\0626\064A\0633\064A.</li>'),
unistr('<li><strong>\0645\0639\0644\0648\0645\0627\062A \0627\0644\0639\0645\0648\062F</strong> \0639\0631\0636 \0646\0635 \062A\0639\0644\064A\0645\0627\062A \0627\0644\0639\0645\0648\062F\060C \0625\0646 \0648\062C\062F.</li>'),
unistr('<li><strong>\0645\0646\0637\0642\0629 \0627\0644\0646\0635</strong> \0645\0633\062A\062E\062F\0645\0629 \0644\0625\062F\062E\0627\0644 \0645\0639\0627\064A\064A\0631 \0627\0644\0628\062D\062B \0627\0644\062D\0633\0627\0633\0629 \0644\062D\0627\0644\0629 \0627\0644\0623\062D\0631\0641'),
unistr('(\0644\0627 \062D\0627\062C\0629 \0644\0623\062D\0631\0641 \0627\0644\0628\062F\0644). \064A\0642\0644\0644 \0625\062F\062E\0627\0644 \0642\064A\0645\0629 \0645\0646 \0642\0627\0626\0645\0629'),
unistr('\0627\0644\0642\064A\0645 \0623\0633\0641\0644 \0627\0644\0642\0627\0626\0645\0629. \062B\0645 \064A\0645\0643\0646\0643 \062A\062D\062F\064A\062F \0642\064A\0645\0629 \0645\0646'),
unistr('\0627\0644\0623\0633\0641\0644 \0648\0633\064A\062A\0645 \062A\0643\0648\064A\0646 \0627\0644\0642\064A\0645\0629 \0627\0644\0645\062D\062F\062F\0629 \0643\0645\0631\0634\062D \0628\0627\0633\062A\062E\062F\0627\0645 ''='''),
unistr('(\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644 <code>column = ''ABC''</code>). \0628\062F\0644\0627\064B \0645\0646 \0630\0644\0643\060C \064A\0645\0643\0646\0643 \0627\0644\0646\0642\0631 \0639\0644\0649 \0623\064A\0642\0648\0646\0629 \0627\0644\0628\062D\062B \0648\0625\062F\062E\0627\0644 \0642\064A\0645\0629 \0644\064A\062A\0645 \062A\0643\0648\064A\0646\0647\0627 \0643\0645\0631\0634\062D \0628\0627\0633\062A\062E\062F\0627\0645 \062A\0639\062F\064A\0644\0627\062A ''LIKE'''),
unistr('(\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644\060C <code>column LIKE ''%ABC%''</code>).</li>'),
unistr('<li><strong>\0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645 \0627\0644\0641\0631\064A\062F\0629</strong> \062A\062D\062A\0648\064A \0639\0644\0649 \0623\0648\0644 500 \0642\064A\0645\0629 \0641\0631\064A\062F\0629 \062A\0644\0628\064A \0645\0639\0627\064A\064A\0631 \0627\0644\0645\0631\0634\062D \0627\0644\062E\0627\0635\0629 \0628\0643. \0625\0630\0627 \0643\0627\0646 \0627\0644\0639\0645\0648\062F \062A\0627\0631\064A\062E\064B\0627\060C \0641\0633\062A\0638\0647\0631'),
unistr('\0642\0627\0626\0645\0629 \0646\0637\0627\0642\0627\062A \0627\0644\062A\0648\0627\0631\064A\062E \0628\062F\0644\0627\064B \0645\0646 \0630\0644\0643. \0648\0625\0630\0627 \062D\062F\062F\062A \0642\064A\0645\0629\060C \0641\0633\064A\062A\0645'),
unistr('\062A\0643\0648\064A\0646 \0645\0631\0634\062D \0628\0627\0633\062A\062E\062F\0627\0645 ''='' (\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644\060C <code>column = ''ABC''</code>).</li>'),
'</ul>'))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110369597750716)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\064A\062A\064A\062D \0644\0643 \0625\0636\0627\0641\0629 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\062D\0633\0648\0628\0629 \0625\0644\0649 \062A\0642\0631\064A\0631\0643. \064A\0645\0643\0646 \0623\0646 \062A\0643\0648\0646 \0639\0645\0644\064A\0627\062A \062D\0633\0627\0628\064A\0629 \0631\064A\0627\0636\064A\0629 (\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644\060C <code>NBR_HOURS/24</code>) \0623\0648 \062F\0648\0627\0644 Oracle'),
unistr('\0627\0644\0642\064A\0627\0633\064A\0629 \0645\0637\0628\0642\0629 \0639\0644\0649 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\062D\0627\0644\064A\0629. \062A\0638\0647\0631 \0628\0639\0636\0647\0627 \0643\0623\0645\062B\0644\0629 \0648\0627\0644\0623\062E\0631\0649 (\0645\062B\0644 <code>TO_DATE)</code> \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645\0647\0627 \0643\0630\0644\0643). \062A\062A\0636\0645\0646 \0627\0644\062E\064A\0627\0631\0627\062A:'),
'<p></p>',
'<ul>',
unistr('<li><strong>\0627\0644\0627\062D\062A\0633\0627\0628</strong> \064A\062A\064A\062D \0644\0643 \062A\062D\062F\064A\062F \0639\0645\0644\064A\0629 \0627\062D\062A\0633\0627\0628 \0645\0639\0631\0641\0629 \0633\0627\0628\0642\064B\0627 \0644\062A\062D\0631\064A\0631\0647\0627.</li>'),
unistr('<li><strong>\0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F</strong> \0647\0648 \0639\0646\0648\0627\0646 \0627\0644\0639\0645\0648\062F \0627\0644\062C\062F\064A\062F.</li>'),
unistr('<li><strong>\0642\0646\0627\0639 \0627\0644\0635\064A\063A\0629</strong> \0647\0648 \0642\0646\0627\0639 \0635\064A\063A\0629 \0645\0646 Oracle \064A\062A\0645 \062A\0637\0628\064A\0642\0647 \0639\0644\0649 \0627\0644\0639\0645\0648\062F (\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644\060C S9999).</li>'),
unistr('<li><strong>\0627\0644\0627\062D\062A\0633\0627\0628</strong> \0647\0648 \0627\0644\0627\062D\062A\0633\0627\0628 \0627\0644\0645\0637\0644\0648\0628 \062A\0646\0641\064A\0630\0647. \0641\064A \0627\0644\0627\062D\062A\0633\0627\0628\060C \062A\062A\0645 \0627\0644\0625\0634\0627\0631\0629 \0625\0644\0649 \0627\0644\0623\0639\0645\062F\0629 \0628\0627\0633\062A\062E\062F\0627\0645 \0627\0644\0623\0633\0645\0627\0621 \0627\0644\0645\0633\062A\0639\0627\0631\0629 \0627\0644\0645\0639\0631\0648\0636\0629.</li>'),
'</ul>',
unistr('<p>\0623\0633\0641\0644 \0627\0644\0627\062D\062A\0633\0627\0628\060C \062A\0638\0647\0631 \0627\0644\0623\0639\0645\062F\0629 \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\062E\0627\0635 \0628\0643'),
unistr('\0628\0627\0644\0623\0633\0645\0627\0621 \0627\0644\0645\0633\062A\0639\0627\0631\0629 \0627\0644\062E\0627\0635\0629 \0628\0647\0627. \0648\064A\0624\062F\064A \0627\0644\0646\0642\0631 \0639\0644\0649 \0627\0633\0645 \0627\0644\0639\0645\0648\062F \0623\0648 \0627\0644\0627\0633\0645 \0627\0644\0645\0633\062A\0639\0627\0631 \0625\0644\0649 \062A\0636\0645\064A\0646\0647\0627'),
unistr('\0641\064A \0627\0644\0627\062D\062A\0633\0627\0628. \062A\0648\062C\062F \0628\062C\0627\0646\0628 \0627\0644\0623\0639\0645\062F\0629 \0644\0648\062D\0629 \0645\0641\0627\062A\064A\062D. \062A\0639\0645\0644 \0644\0648\062D\0629 \0627\0644\0645\0641\0627\062A\064A\062D \0647\0630\0647'),
unistr('\0643\0627\062E\062A\0635\0627\0631 \0644\0644\0645\0641\0627\062A\064A\062D \0634\0627\0626\0639\0629 \0627\0644\0627\0633\062A\062E\062F\0627\0645. \0641\064A \0623\0642\0635\0649 \0627\0644\064A\0645\064A\0646 \062A\0648\062C\062F \0627\0644\062F\0648\0627\0644.</p>'),
unistr('<p>\064A\0648\0636\062D \0645\062B\0627\0644 \0627\0644\0627\062D\062A\0633\0627\0628 \0627\0644\062A\0627\0644\064A \0643\064A\0641\064A\0629 \0639\0631\0636 \0625\062C\0645\0627\0644\064A \0627\0644\062A\0639\0648\064A\0636:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(\062D\064A\062BA \0647\0648 ORGANIZATION \0648B \0647\0648 SALARY \0648C \0647\0648 COMMISSION)'),
''))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116832952750718)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\064F\0633\062A\062E\062F\0645 \0644\062A\0643\0648\064A\0646 \0641\0635\0644 \0627\0644\0645\062C\0645\0648\0639\0629 \0641\064A \0639\0645\0648\062F \0648\0627\062D\062F \0623\0648 \0623\0643\062B\0631. \064A\0624\062F\064A \0647\0630\0627 \0625\0644\0649 \0633\062D\0628 \0627\0644\0623\0639\0645\062F\0629 \0645\0646 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A \0648\0639\0631\0636\0647\0627 \0643\0633\062C\0644 \0631\0626\064A\0633\064A.')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111084583750716)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0639\0631\0636 \062A\0641\0627\0635\064A\0644 \0635\0641 \0648\0627\062D\062F \0641\064A \0643\0644 \0645\0631\0629\060C \0627\0646\0642\0631 \0639\0644\0649 \0623\064A\0642\0648\0646\0629 \0637\0631\064A\0642\0629 \0639\0631\0636 \0635\0641 \0648\0627\062D\062F \0641\064A \0627\0644\0635\0641 \0627\0644\0630\064A \062A\0631\064A\062F \0639\0631\0636\0647. \0633\062A\0643\0648\0646 \062F\0627\0626\0645\064B\0627 \0637\0631\064A\0642\0629 \0639\0631\0636 \0635\0641 \0648\0627\062D\062F \0627\0644\0639\0645\0648\062F \0627\0644\0623\0648\0644. \062A\0628\0639\064B\0627 \0644\062A\062E\0635\064A\0635 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A\060C \0642\062F \062A\0643\0648\0646 \0637\0631\064A\0642\0629 \0639\0631\0636 \0635\0641 \0648\0627\062D\062F \0647\064A \0637\0631\064A\0642\0629 \0627\0644\0639\0631\0636 \0627\0644\0642\064A\0627\0633\064A\0629 \0623\0648 \0635\0641\062D\0629 \0645\062E\0635\0635\0629 \062A\0633\0645\062D \0628\0627\0644\062A\062D\062F\064A\062B.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110966474750716)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\0643\064A\0646 \062A\0646\0632\064A\0644 \0645\062C\0645\0648\0639\0629 \0627\0644\0646\062A\0627\0626\062C \0627\0644\062D\0627\0644\064A\0629. \062A\062A\0636\0645\0646 \062A\0646\0633\064A\0642\0627\062A \0627\0644\062A\0646\0632\064A\0644 PDF \0648Excel \0648HTML \0648CSV. \062A\062E\062A\0644\0641 \062E\064A\0627\0631\0627\062A \0627\0644\062A\0646\0632\064A\0644 \062A\0628\0639\064B\0627 \0644\0644\062A\0646\0633\064A\0642 \0627\0644\0645\062D\062F\062F. \064A\0645\0643\0646 \0623\064A\0636\064B\0627 \0625\0631\0633\0627\0644 \0643\0644 \0627\0644\062A\0646\0633\064A\0642\0627\062A \0643\0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110009839750716)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0642\0645 \0628\062A\0631\0643\064A\0632 \0627\0644\062A\0642\0631\064A\0631 \0639\0628\0631 \0625\0636\0627\0641\0629 \0639\0628\0627\0631\0629 <code>WHERE</code> \0623\0648 \062A\0639\062F\064A\0644\0647\0627 \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645. \0648\064A\0645\0643\0646\0643 \0627\0644\062A\0631\0634\064A\062D \062D\0633\0628 \0639\0645\0648\062F \0623\0648 \0635\0641.  '),
unistr('<p>\0625\0630\0627 \0642\0645\062A \0628\0627\0644\062A\0631\0634\064A\062D \062D\0633\0628 \0639\0645\0648\062F\060C \0641\062D\062F\062F \0639\0645\0648\062F\064B\0627 (\0644\0627 \064A\0646\0628\063A\064A \0623\0646 \064A\0643\0648\0646'),
unistr('\0639\0645\0648\062F\064B\0627 \0645\0639\0631\0648\0636\064B\0627)\060C \062D\062F\062F \0645\0639\0627\0645\0644 Oracle \0642\064A\0627\0633\064A\064B\0627  (=\060C !=\060C \0644\064A\0633 \0641\064A\060C \0628\064A\0646)\060C \0648\0623\062F\062E\0644 \062A\0639\0628\064A\0631\064B\0627 \0644\0644\0645\0642\0627\0631\0646\0629 \0628\0647. \0627\0644\062A\0639\0628\064A\0631\0627\062A \062D\0633\0627\0633\0629 \0644\062D\0627\0644\0629 \0627\0644\0623\062D\0631\0641. \0627\0633\062A\062E\062F\0645 % \0643\062D\0631\0641 \0628\062F\0644 (\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644\060C <code>STATE_NAME'),
'like A%)</code>.</p>',
unistr('<p>\0625\0630\0627 \0642\0645\062A \0628\0627\0644\062A\0631\0634\064A\062D \062D\0633\0628 \0635\0641\060C \064A\0645\0643\0646\0643 \062A\0643\0648\064A\0646 \0639\0628\0627\0631\0627\062A <code>WHERE</code> \0645\0639\0642\062F\0629 \0628\0627\0633\062A\062E\062F\0627\0645'),
unistr('\0627\0644\0623\0633\0645\0627\0621 \0627\0644\0645\0633\062A\0639\0627\0631\0629 \0644\0644\0623\0639\0645\062F\0629 \0648\0623\064A \062F\0648\0627\0644 \0623\0648 \0645\0639\0627\0645\0644\0627\062A Oracle (\0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644\060C <code>G = ''VA'' or G = ''CT''</code>\060C \062D\064A\062B \064A\0643\0648\0646'),
unistr('<code>G</code> \0627\0644\0627\0633\0645 \0627\0644\0645\0633\062A\0639\0627\0631 \0644\0640 <code>CUSTOMER_STATE</code>).</p>'),
''))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110659910750716)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\064A\062A\064A\062D \0644\0643 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0639\0646 \0628\064A\0627\0646\0627\062A \062A\0627\0631\064A\062E\064A\0629 \0639\0631\0636 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\064A \0643\0627\0646\062A \0645\0648\062C\0648\062F\0629 \0633\0627\0628\0642\064B\0627.'),
unistr('\0627\0644\0641\062A\0631\0629 \0627\0644\0627\0641\062A\0631\0627\0636\064A\0629 \0627\0644\062A\064A \064A\0645\0643\0646\0643 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0639\0646 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\0627\0631\064A\062E\064A\0629 \0628\0647\0627 \0647\0648 3 \0633\0627\0639\0627\062A (\0623\0648 180'),
unistr('\062F\0642\064A\0642\0629) \0644\0643\0646 \062A\062E\062A\0644\0641 \0627\0644\0641\062A\0631\0629 \0627\0644\0641\0639\0644\064A\0629 \0644\0643\0644 \0642\0627\0639\062F\0629 \0628\064A\0627\0646\0627\062A.')))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175296015750737)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\062A\062A\064A\062D \0644\0643 \0627\0644\0635\064A\063A\0629 \062A\062E\0635\064A\0635 \0639\0631\0636 \0627\0644\062A\0642\0631\064A\0631.'),
unistr('\062A\062A\0636\0645\0646 \0627\0644\0635\064A\063A\0629 \0627\0644\0642\0627\0626\0645\0629 \0627\0644\0641\0631\0639\064A\0629 \0627\0644\062A\0627\0644\064A\0629:</p>'),
unistr('<ul><li>\0641\0631\0632</li>'),
unistr('<li>\062A\0642\0633\064A\0645 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645</li>'),
unistr('<li>\062A\0645\064A\064A\0632</li>'),
unistr('<li>\062D\0633\0627\0628</li>'),
unistr('<li>\062A\062C\0645\064A\0639</li>'),
unistr('<li>\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A</li>'),
unistr('<li>\062A\062C\0645\064A\0639 \062D\0633\0628</li>'),
unistr('<li>\062C\062F\0648\0644 \0645\062D\0648\0631\064A</li>'),
'</ul>',
''))
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173418079750736)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\064A\0645\0643\0646\0643 \062A\0639\0631\064A\0641 \0637\0631\064A\0642\0629 \062A\062C\0645\064A\0639 \062D\0633\0628 \0648\0627\062D\062F\0629 \0644\0643\0644 \062A\0642\0631\064A\0631'),
unistr('\0645\062D\0641\0648\0638. \0628\0645\062C\0631\062F \062A\0639\0631\064A\0641\0647\0627\060C \064A\0645\0643\0646\0643 \0627\0644\062A\0628\062F\064A\0644 \0628\064A\0646 \0637\0631\064A\0642\062A\064A \0627\0644\0639\0631\0636 \062A\062C\0645\064A\0639 \062D\0633\0628 \0648\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\062A\0642\0631\064A\0631'),
unistr('\0628\0627\0633\062A\062E\062F\0627\0645 \0623\064A\0642\0648\0646\0627\062A \0637\0631\0642 \0627\0644\0639\0631\0636 \0641\064A \0634\0631\064A\0637 \0627\0644\0628\062D\062B. \0644\062A\0643\0648\064A\0646 \0637\0631\064A\0642\0629 \0639\0631\0636 \062A\062C\0645\064A\0639 \062D\0633\0628\060C'),
unistr(' \062D\062F\062F: '),
'<p></p><ul>',
unistr('<li>\0627\0644\0623\0639\0645\062F\0629 \0627\0644\062A\064A \0633\064A\062A\0645 \062A\0643\0648\064A\0646 \0645\062C\0645\0648\0639\0627\062A \062D\0633\0628\0647\0627</li>'),
unistr('<li>\0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0637\0644\0648\0628 \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628\0647\0627 \0645\0639 \0627\0644\062F\0627\0644\0629 \0627\0644\0645\0637\0644\0648\0628 \062A\0646\0641\064A\0630\0647\0627 (\0627\0644\0645\062A\0648\0633\0637\060C \0627\0644\0645\062C\0645\0648\0639\060C \0627\0644\0639\062F\062F\060C \0648\063A\064A\0631 \0630\0644\0643.)</li>'),
'</ul>'))
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110251502750716)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\064A\062A\064A\062D \0644\0643 \062A\0639\0631\064A\0641 \0645\0631\0634\062D. \064A\062A\0645 \062A\0645\064A\064A\0632 \0627\0644\0635\0641\0648\0641 \0627\0644\062A\064A \062A\0644\0628\064A \0645\0639\0627\064A\064A\0631 \0627\0644\0645\0631\0634\062D \0628\0627\0633\062A\062E\062F\0627\0645 \0627\0644\062E\0635\0627\0626\0635 \0627\0644\0645\0631\062A\0628\0637\0629 \0628\0627\0644\0645\0631\0634\062D. \062A\062A\0636\0645\0646 \0627\0644\062E\064A\0627\0631\0627\062A:</p>'),
'<ul>',
unistr('<li><strong>\0627\0644\0627\0633\0645</strong> \064A\064F\0633\062A\062E\062F\0645 \0644\0644\0639\0631\0636 \0641\0642\0637.</li>'),
unistr('<li><strong>\0627\0644\062A\0633\0644\0633\0644</strong> \064A\062D\062F\062F \062A\0633\0644\0633\0644 \062A\0642\064A\064A\0645 \0627\0644\0642\0648\0627\0639\062F.</li>'),
unistr('<li><strong>\0645\0645\0643\0646</strong> \064A\062D\062F\062F \0625\0630\0627 \0645\0627 \0643\0627\0646\062A \0627\0644\0642\0627\0639\062F\0629 \0645\0645\0643\0646\0629 \0623\0648 \0645\0639\0637\0644\0629.</li>'),
unistr('<li><strong>\0646\0648\0639 \0627\0644\062A\0645\064A\064A\0632</strong> \064A\062D\062F\062F \0625\0630\0627 \0645\0627 \0643\0627\0646 \064A\0646\0628\063A\064A'),
unistr('\062A\0645\064A\064A\0632 \0627\0644\0635\0641 \0623\0648 \0627\0644\062E\0644\064A\0629. \0641\064A \062D\0627\0644\0629 \062A\062D\062F\064A\062F \062E\0644\064A\0629\060C \064A\062A\0645 \062A\0645\064A\064A\0632 \0627\0644\0639\0645\0648\062F \0627\0644\0645\0634\0627\0631 \0625\0644\064A\0647 \0641\064A'),
unistr('\0634\0631\0637 \0627\0644\062A\0645\064A\064A\0632.</li>'),
unistr('<li><strong>\0644\0648\0646 \0627\0644\062E\0644\0641\064A\0629</strong> \0644\0648\0646 \0627\0644\062E\0644\0641\064A\0629 \0627\0644\062C\062F\064A\062F \0641\064A \0627\0644\0645\0646\0637\0642\0629 \0627\0644\0645\0645\064A\0632\0629.</li>'),
unistr('<li><strong>\0644\0648\0646 \0627\0644\0646\0635</strong> \0647\0648 \0644\0648\0646 \0627\0644\0646\0635 \0627\0644\062C\062F\064A\062F \0641\064A \0627\0644\0645\0646\0637\0642\0629 \0627\0644\0645\0645\064A\0632\0629.</li>'),
unistr('<li><strong>\0634\0631\0637 \0627\0644\062A\0645\064A\064A\0632</strong>  \064A\062D\062F\062F \0634\0631\0637 \0627\0644\062A\0645\064A\064A\0632 \0627\0644\062E\0627\0635 \0628\0643.</li>'),
'</ul>',
''))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137003613862750684)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\064A\0645\0643\0646\0643 \062A\0639\0631\064A\0641 \0637\0631\064A\0642\0629 \0639\0631\0636 \0645\062D\0648\0631\064A \0648\0627\062D\062F\0629 \0644\0643\0644 \062A\0642\0631\064A\0631 \0645\062D\0641\0648\0638. \0628\0645\062C\0631\062F \062A\0639\0631\064A\0641\0647\0627\060C \064A\0645\0643\0646\0643 \0627\0644\062A\0628\062F\064A\0644 \0628\064A\0646 \0637\0631\064A\0642\062A\064A \0627\0644\0639\0631\0636 \0627\0644\0645\062D\0648\0631\064A \0648\0639\0631\0636 \0627\0644\062A\0642\0631\064A\0631 \0628\0627\0633\062A\062E\062F\0627\0645 \0623\064A\0642\0648\0646\0627\062A \0637\0631\0642 \0627\0644\0639\0631\0636 \0641\064A \0634\0631\064A\0637 \0627\0644\0628\062D\062B. \0644\062A\0643\0648\064A\0646 \0637\0631\064A\0642\0629 \0639\0631\0636 \0645\062D\0648\0631\064A\060C \062D\062F\062F: '),
'<p></p>',
'<ul>',
unistr('<li>\0627\0644\0623\0639\0645\062F\0629 \0627\0644\062A\064A \0633\062A\0643\0648\0646 \0627\0644\0645\062D\0648\0631</li>'),
unistr('<li>\0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0637\0644\0648\0628 \0639\0631\0636\0647\0627 \0643\0635\0641\0648\0641</li>'),
unistr('<li>\0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0637\0644\0648\0628 \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628\0647\0627 \0645\0639 \0627\0644\0648\0638\064A\0641\0629 \0627\0644\0645\0637\0644\0648\0628 \0623\062F\0627\0624\0647\0627 (\0627\0644\0645\062A\0648\0633\0637\060C \0627\0644\0645\062C\0645\0648\0639\060C \0627\0644\0639\062F\062F\060C \0648\063A\064A\0631 \0630\0644\0643.)</li>'),
'</ul>'))
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121348785750720)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0625\0630\0627 \0642\0645\062A \0628\062A\062E\0635\064A\0635 \062A\0642\0631\064A\0631 \062A\0641\0627\0639\0644\064A\060C \0641\0633\062A\0638\0647\0631 \0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0642\0631\064A\0631'),
unistr('\0623\0633\0641\0644 \0634\0631\064A\0637 \0627\0644\0628\062D\062B \0648\0623\0639\0644\0649 \0627\0644\062A\0642\0631\064A\0631. \064A\0645\0643\0646 \0637\064A \0647\0630\0647 \0627\0644\0645\0646\0637\0642\0629 \0648\062A\0648\0633\064A\0639\0647\0627 \0628\0627\0633\062A\062E\062F\0627\0645 \0627\0644\0623\064A\0642\0648\0646\0629 \0639\0644\0649 \0627\0644\064A\0633\0627\0631.'),
'<p>',
unistr('\0644\0643\0644 \0625\0639\062F\0627\062F \062A\0642\0631\064A\0631\060C \064A\0645\0643\0646\0643:'),
'</p><ul>',
unistr('<li>\062A\062D\0631\064A\0631 \0625\0639\062F\0627\062F \0628\0627\0644\0646\0642\0631 \0639\0644\0649 \0627\0644\0627\0633\0645.</li>'),
unistr('<li>\062A\0639\0637\064A\0644/\062A\0645\0643\064A\0646 \0625\0639\062F\0627\062F \0645\0646 \062E\0644\0627\0644 \062A\062D\062F\064A\062F \0645\0631\0628\0639 \0627\062E\062A\064A\0627\0631 \062A\0645\0643\064A\0646/\062A\0639\0637\064A\0644 \0623\0648 \0625\0644\063A\0627\0621 \062A\062D\062F\064A\062F\0647. \0627\0633\062A\062E\062F\0645 \0639\0646\0635\0631 \0627\0644\062A\062D\0643\0645 \0647\0630\0627 \0644\062A\0634\063A\064A\0644 \0625\0639\062F\0627\062F \0623\0648 \0625\064A\0642\0627\0641 \062A\0634\063A\064A\0644\0647 \0645\0624\0642\062A\064B\0627.</li>'),
unistr('<li>\0625\0632\0627\0644\0629 \0625\0639\062F\0627\062F \0628\0627\0644\0646\0642\0631 \0639\0644\0649 \0623\064A\0642\0648\0646\0629 \0625\0632\0627\0644\0629.</li>'),
'</ul>',
unistr('<p>\0625\0630\0627 \0642\0645\062A \0628\062A\0643\0648\064A\0646 \0631\0633\0645 \0628\064A\0627\0646\064A \0623\0648 \062A\062C\0645\064A\0639 \062D\0633\0628 \0623\0648 \062C\062F\0648\0644 \0645\062D\0648\0631\064A\060C \064A\0645\0643\0646\0643 \0627\0644\062A\0628\062F\064A\0644 \0628\064A\0646\0647\0627'),
unistr('\0648\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0623\0633\0627\0633\064A \0628\0627\0633\062A\062E\062F\0627\0645 \0631\0648\0627\0628\0637 \0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\062A\0642\0631\064A\0631 \0648\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0648\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628 \0648\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\062C\062F\0648\0644 \0627\0644\0645\062D\0648\0631\064A'),
unistr('\0627\0644\0645\0639\0631\0648\0636\0629 \0639\0644\0649 \0627\0644\064A\0645\064A\0646. \0625\0630\0627 \0643\0646\062A \062A\0639\0631\0636 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0623\0648 \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628 \0623\0648 \0627\0644\062C\062F\0648\0644 \0627\0644\0645\062D\0648\0631\064A\060C \064A\0645\0643\0646\0643'),
unistr('\0623\064A\0636\064B\0627 \0627\0633\062A\062E\062F\0627\0645 \0631\0627\0628\0637 "\062A\062D\0631\064A\0631" \0644\062A\062D\0631\064A\0631 \0627\0644\0625\0639\062F\0627\062F\0627\062A.</p>'),
''))
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110831240750716)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0627\0644\062A\0642\0631\064A\0631 \0625\0644\0649 \0627\0644\0625\0639\062F\0627\062F\0627\062A \0627\0644\0627\0641\062A\0631\0627\0636\064A\0629\060C \0648\0625\0632\0627\0644\0629 \0623\064A \0645\0646 \0627\0644\062A\062E\0635\064A\0635\0627\062A \0627\0644\062A\064A \0642\0645\062A \0628\0647\0627.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175508255750737)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\064A\064A\0646 \0639\062F\062F \0627\0644\0633\062C\0644\0627\062A \0627\0644\062A\064A \064A\062A\0645 \0639\0631\0636\0647\0627 \0641\064A \0627\0644\0635\0641\062D\0629.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110730083750716)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\062D\0641\0638 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0645\062E\0635\0635 \0644\0644\0627\0633\062A\062E\062F\0627\0645 \0627\0644\0645\0633\062A\0642\0628\0644\064A. \0623\062F\062E\0644 \0627\0644\0627\0633\0645 \0648\0627\0644\0648\0635\0641 \0627\0644\0627\062E\062A\064A\0627\0631\064A \0648\064A\0645\0643\0646\0643 \0625\062A\0627\062D\0629 \0627\0644\0648\0635\0648\0644 \0627\0644\0639\0627\0645 \0644\0644\062A\0642\0631\064A\0631 (\0623\064A\060C \0643\0644 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646 \0627\0644\0630\064A\0646 \064A\0645\0643\0646\0647\0645 \0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0623\0633\0627\0633\064A \0627\0644\0627\0641\062A\0631\0627\0636\064A). \064A\0645\0643\0646\0643 \062D\0641\0638 \0623\0631\0628\0639\0629 \0623\0646\0648\0627\0639 \0645\0646 \0627\0644\062A\0642\0627\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A\0629:</p>'),
'<ul>',
unistr('<li><strong>\0627\0644\0627\0641\062A\0631\0627\0636\064A \0627\0644\0623\0633\0627\0633\064A</strong> (\0627\0644\0645\0637\0648\0631 \0641\0642\0637). \0627\0644\0627\0641\062A\0631\0627\0636\064A \0627\0644\0623\0633\0627\0633\064A \0647\0648 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0630\064A \064A\0638\0647\0631 \0641\064A \0627\0644\0628\062F\0627\064A\0629. \0644\0627 \064A\0645\0643\0646 \0625\0639\0627\062F\0629 \062A\0633\0645\064A\0629 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0627\0641\062A\0631\0627\0636\064A \0627\0644\0623\0633\0627\0633\064A \0623\0648 \062D\0630\0641\0647.</li>'),
unistr('<li><strong>\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0628\062F\064A\0644</strong> (\0627\0644\0645\0637\0648\0631 \0641\0642\0637). \064A\062A\064A\062D \0644\0644\0645\0637\0648\0631\064A\0646 \062A\0643\0648\064A\0646 \0639\062F\0629 \062A\062E\0637\064A\0637\0627\062A \062A\0642\0627\0631\064A\0631. \064A\0645\0643\0646 \0644\0644\0645\0637\0648\0631\064A\0646 \0641\0642\0637 \062D\0641\0638 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0628\062F\064A\0644 \0623\0648 \0625\0639\0627\062F\0629 \062A\0633\0645\064A\062A\0647 \0623\0648 \062D\0630\0641\0647.</li>'),
unistr('<li><strong>\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0639\0627\0645</strong> (\0627\0644\0645\0633\062A\062E\062F\0645). \064A\0645\0643\0646 \0644\0644\0645\0633\062A\062E\062F\0645 \0627\0644\0630\064A \0642\0627\0645 \0628\0625\0646\0634\0627\0626\0647 \062D\0641\0638\0647 \0623\0648 \0625\0639\0627\062F\0629 \062A\0633\0645\064A\062A\0647 \0623\0648 \062D\0630\0641\0647. \064A\0645\0643\0646 \0644\0645\0633\062A\062E\062F\0645\064A\0646 \0622\062E\0631\064A\0646 \0639\0631\0636 \0627\0644\062A\062E\0637\064A\0637 \0648\062D\0641\0638\0647 \0643\062A\0642\0631\064A\0631 \0622\062E\0631.</li>'),
unistr('<li><strong>\0627\0644\062A\0642\0631\064A\0631 \0627\0644\062E\0627\0635</strong> (\0627\0644\0645\0633\062A\062E\062F\0645). \064A\0645\0643\0646 \0644\0644\0645\0633\062A\062E\062F\0645 \0627\0644\0630\064A \0623\0646\0634\0623 \0627\0644\062A\0642\0631\064A\0631 \0641\0642\0637 \0639\0631\0636 \0627\0644\062A\0642\0631\064A\0631 \0623\0648 \062D\0641\0638\0647 \0623\0648 \0625\0639\0627\062F\0629 \062A\0633\0645\064A\062A\0647 \0623\0648 \062D\0630\0641\0647.</li>'),
'</ul>',
unistr('<p>\0625\0630 \062D\0641\0638\062A \0627\0644\062A\0642\0627\0631\064A\0631 \0627\0644\0645\062E\0635\0635\0629\060C \064A\0638\0647\0631 \0645\062D\062F\062F \0627\0644\062A\0642\0627\0631\064A\0631 \0641\064A \0634\0631\064A\0637 \0627\0644\0628\062D\062B \0639\0644\0649 \064A\0633\0627\0631 \0645\062D\062F\062F \0627\0644\0635\0641\0648\0641 (\0641\064A \062D\0627\0644\0629 \062A\0645\0643\064A\0646 \0647\0630\0647 \0627\0644\0645\064A\0632\0629).</p>'),
''))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109765963750716)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\062C\062F \0641\064A \0623\0639\0644\0649 \0643\0644 \0635\0641\062D\0629 \062A\0642\0631\064A\0631 \0645\0646\0637\0642\0629 \0628\062D\062B. \062A\0642\062F\0645 \0647\0630\0647 \0627\0644\0645\0646\0637\0642\0629 (\0623\0648 \0634\0631\064A\0637 \0627\0644\0628\062D\062B) \0627\0644\0645\064A\0632\0627\062A \0627\0644\062A\0627\0644\064A\0629:')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176142332750737)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'ar'
,p_message_text=>unistr('<li><strong>\0642\0627\0626\0645\0629 \0627\0644\0625\062C\0631\0627\0621\0627\062A</strong> \062A\062A\064A\062D \0644\0643 \062A\062E\0635\064A\0635 \062A\0642\0631\064A\0631. \0627\0637\0644\0639 \0639\0644\0649 \0627\0644\0623\0642\0633\0627\0645 \0627\0644\062A\0627\0644\064A\0629.</li>')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175667959750737)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'ar'
,p_message_text=>unistr('<li><strong>\0623\064A\0642\0648\0646\0629 \062A\062D\062F\064A\062F \0623\0639\0645\062F\0629</strong> \062A\062A\064A\062D \0644\0643 \062A\0639\0631\064A\0641 \0627\0644\0639\0645\0648\062F \0627\0644\0630\064A \062A\0628\062D\062B \0639\0646\0647 (\0623\0648 \0627\0644\0643\0644).</li>')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175923530750737)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'ar'
,p_message_text=>unistr('<li><strong>\0627\0644\062A\0642\0627\0631\064A\0631</strong> \062A\0639\0631\0636 \0627\0644\062A\0642\0627\0631\064A\0631 \0627\0644\0627\0641\062A\0631\0627\0636\064A\0629 \0627\0644\0628\062F\064A\0644\0629 \0648\0627\0644\0645\062D\0641\0648\0638\0629 \0627\0644\0639\0627\0645\0629 \0623\0648 \0627\0644\062E\0627\0635\0629.</li>')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175822142750737)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('<li><strong>\0627\0644\0635\0641\0648\0641</strong> \064A\062A\0645 \0645\0646 \062E\0644\0627\0644\0647\0627 \062A\0639\064A\064A\0646 \0639\062F\062F \0627\0644\0633\062C\0644\0627\062A \0627\0644\062A\064A \064A\062A\0645 \0639\0631\0636\0647\0627 \0644\0643\0644 \0635\0641\062D\0629.</li>')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175701725750737)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li><strong>\0645\0646\0637\0642\0629 \0627\0644\0646\0635</strong> \062A\062A\064A\062D \0644\0643 \0625\062F\062E\0627\0644 \0645\0639\0627\064A\064A\0631 \0628\062D\062B \062D\0633\0627\0633\0629 \0644\062D\0627\0644\0629 \0627\0644\0623\062D\0631\0641 (\064A\062A\0645 \062A\0636\0645\064A\0646 \0623\062D\0631\0641 \0627\0644\0628\062F\0644).</li>'),
unistr('<li><strong>\0632\0631 \0627\0644\0627\0646\062A\0642\0627\0644</strong> \064A\0646\0641\0630 \0627\0644\0628\062D\062B. \0648\0633\064A\0624\062F\064A \0627\0644\0636\063A\0637 \0639\0644\0649 \0645\0641\062A\0627\062D \0627\0644\0625\062F\062E\0627\0644 Enter \0625\0644\0649 \062A\0646\0641\064A\0630 \0627\0644\0628\062D\062B \0643\0630\0644\0643 \0639\0646\062F\0645\0627 \064A\0643\0648\0646 \0627\0644\0645\0624\0634\0631 \0641\064A \0645\0646\0637\0642\0629 \0646\0635 \0627\0644\0628\062D\062B.</li>')))
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176016968750737)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('<li><strong>\0623\064A\0642\0648\0646\0627\062A \0637\0631\0642 \0627\0644\0639\0631\0636</strong> \0627\0644\062A\0628\062F\064A\0644 \0628\064A\0646 \0637\0631\0642 \0639\0631\0636 \0627\0644\0623\064A\0642\0648\0646\0627\062A \0648\0627\0644\062A\0642\0631\064A\0631 \0648\0627\0644\062A\0641\0627\0635\064A\0644 \0648\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0648\062A\062C\0645\064A\0639 \062D\0633\0628 \0648\062C\062F\0648\0644 \0645\062D\0648\0631\064A \0644\0644\062A\0642\0631\064A\0631 \0625\0630\0627 \0643\0627\0646\062A \0645\0639\0631\0641\0629 .</li>')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109901707750716)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\064F\0633\062A\062E\062F\0645 \0644\062A\0639\062F\064A\0644 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629. \062A\0638\0647\0631 \0627\0644\0623\0639\0645\062F\0629 \0639\0644\0649 \0627\0644\064A\0645\064A\0646\060C \0648\064A\062A\0645 \0625\062E\0641\0627\0621 \0627\0644\0623\0639\0645\062F\0629 \0639\0644\0649 \0627\0644\064A\0633\0627\0631. \064A\0645\0643\0646\0643 \0625\0639\0627\062F\0629 \062A\0631\062A\064A\0628 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0639\0631\0648\0636\0629 \0628\0627\0633\062A\062E\062F\0627\0645 \0627\0644\0623\0633\0647\0645 \0641\064A \0623\0642\0635\0649 \0627\0644\064A\0645\064A\0646. \062A\062A\0636\0645\0646 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\062D\0633\0648\0628\0629 \0627\0644\0628\0627\062F\0626\0629 <strong>**</strong>.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137110140745750716)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\064A\064F\0633\062A\062E\062F\0645 \0644\062A\063A\064A\064A\0631 \0627\0644\0623\0639\0645\062F\0629 \0644\0644\0641\0631\0632 \062D\0633\0628\0647\0627 \0648\062A\062D\062F\064A\062F \0625\0630\0627 \0645\0627 \0643\0627\0646'),
unistr('\0633\064A\062A\0645 \0627\0644\0641\0631\0632 \0628\062A\0631\062A\064A\0628 \062A\0635\0627\0639\062F\064A \0623\0645 \062A\0646\0627\0632\0644\064A. \0643\0645\0627 \064A\0645\0643\0646\0643 \062A\062D\062F\064A\062F \0643\064A\0641\064A\0629 \0627\0644\062A\0639\0627\0645\0644 \0645\0639'),
unistr('<code>\0627\0644\0642\064A\0645 \0627\0644\062E\0627\0644\064A\0629</code>. \0627\0644\0625\0639\062F\0627\062F \0627\0644\0627\0641\062A\0631\0627\0636\064A \064A\0639\0631\0636 <code>\0627\0644\0642\064A\0645 \0627\0644\062E\0627\0644\064A\0629</code> \062F\0627\0626\0645\064B\0627 \0641\064A \0627\0644\0646\0647\0627\064A\0629 \0623\0648 \0639\0631\0636\0647\0627 \062F\0627\0626\0645\064B\0627 \0641\064A \0627\0644\0628\062F\0627\064A\0629. \064A\0638\0647\0631 \0627\0644\0641\0631\0632 \0627\0644\0646\0627\062A\062C \0639\0644\0649 \064A\0645\064A\0646'),
unistr('\0639\0646\0627\0648\064A\0646 \0627\0644\0623\0639\0645\062F\0629 \0641\064A \0627\0644\062A\0642\0631\064A\0631.</p>')))
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173262889750736)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\062F \0625\0636\0627\0641\0629 \0627\0634\062A\0631\0627\0643\060C \062A\0642\0648\0645 \0628\0625\062F\062E\0627\0644 \0639\0646\0648\0627\0646 \0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A (\0623\0648 \0639\062F\0629 \0639\0646\0627\0648\064A\0646 \0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A\060C \0645\0641\0635\0648\0644\0629 \0628\0641\0627\0635\0644\0629)\060C \0648\0645\0648\0636\0648\0639 \0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A \0648\0645\0639\062F\0644 \0627\0644\062A\0643\0631\0627\0631 \0648\062A\0648\0627\0631\064A\062E \0627\0644\0628\062F\0627\064A\0629 \0648\0627\0644\0646\0647\0627\064A\0629. \062A\062A\0636\0645\0646 \0631\0633\0627\0626\0644 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A \0627\0644\0646\0627\062A\062C\0629 \0646\0633\062E\0629 \062A\0645 \062A\0635\062F\064A\0631\0647\0627 (PDF \0623\0648 Excel \0623\0648 HTML \0623\0648 CSV) \0645\0646 \0627\0644\062A\0642\0631\064A')
||unistr('\0631 \0627\0644\062A\0641\0627\0639\0644\064A \062A\062D\062A\0648\064A \0639\0644\0649 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062D\0627\0644\064A\0629 \0628\0627\0633\062A\062E\062F\0627\0645 \0625\0639\062F\0627\062F \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0630\064A \0643\0627\0646 \0645\0648\062C\0648\062F\064B\0627 \0639\0646\062F \0625\0636\0627\0641\0629 \0627\0644\0627\0634\062A\0631\0627\0643.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114802539750718)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062E\0641\0627\0621 \0627\0644\0639\0645\0648\062F')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105272853750715)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\064A\064A\0632')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116346813750718)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0645\064A\064A\0632\0627\062A')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086553684750709)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\064A\064A\0632 \0627\0644\062E\0644\064A\0629\060C %0 \0641\064A %1')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121409944750720)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0631\0637 \0627\0644\062A\0645\064A\064A\0632')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086487021750709)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\064A\064A\0632 \0627\0644\0635\0641\060C %0 \0641\064A %1')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173853487750736)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0644\0648\0628 \0627\0644\062A\0645\064A\064A\0632')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078036081750707)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\062A\0645\064A\064A\0632')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192660172750742)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0641\0642\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221613066750751)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F \0648\0627\062D\062F \063A\064A\0631 \0646\0634\0637')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221704569750751)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0625\0639\062F\0627\062F\0627\062A \063A\064A\0631 \0627\0644\0646\0634\0637\0629')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111497904750717)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\062A\0642\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122416618750720)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0635\0627\0644\062D')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115835435750718)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0628\064A\0631 \0627\062D\062A\0633\0627\0628 \063A\064A\0631 \0635\0627\0644\062D. %0')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071436176750705)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \062A\0627\0631\064A\062E \0627\0644\0646\0647\0627\064A\0629 \0623\0643\0628\0631 \0645\0646 \062A\0627\0631\064A\062E \0627\0644\0628\062F\0627\064A\0629.')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130682431750723)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0628\064A\0631 \0645\0631\0634\062D \063A\064A\0631 \0635\0627\0644\062D. %0')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200452113750745)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\0639\0644\0627\0645 \0645\0631\0634\062D \063A\064A\0631 \0635\0627\0644\062D')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221836935750751)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F \0648\0627\062D\062F \063A\064A\0631 \0635\0627\0644\062D')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221911388750751)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0625\0639\062F\0627\062F\0627\062A \063A\064A\0631 \0627\0644\0635\0627\0644\062D\0629')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174021272750736)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('(\0628\0627\0644\062F\0642\0627\0626\0642)')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191052684750742)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0641\064A \0622\062E\0631 %1')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191213751750742)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0641\064A %1 \0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191166734750742)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0641\064A \0622\062E\0631 %1')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191396915750742)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\064A\0633 \0641\064A %1 \0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120516593750719)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0648\062D\0629 \0627\0644\0645\0641\0627\062A\064A\062D')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084202147750708)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0633\0645\064A\0629 %0')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114491292750717)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0627\0644\0645\062D\0648\0631 \0644\0644\062A\0633\0645\064A\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106790183750715)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\064A\0648\0645 \0627\0644\0645\0627\0636\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106927775750715)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 \0633\0627\0639\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106489403750715)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631 \0627\0644\0645\0627\0636\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106526115750715)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0633\0628\0648\0639 \0627\0644\0645\0627\0636\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106682704750715)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 %0 \0645\0646 \0627\0644\0623\064A\0627\0645')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106819284750715)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 %0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106234611750715)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 %0 \0645\0646 \0627\0644\0633\0646\0648\0627\062A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137106398691750715)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0646\0629 \0627\0644\0645\0627\0636\064A\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084137222750708)
,p_name=>'APEXIR_LINE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080958043750707)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\064A \0645\0639 \0645\0633\0627\062D\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200395778750745)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062E\0637\064A\0637')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115385665750718)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646 \0627\0644\0645\0642\062F\0631 \0623\0646 \064A\062A\062C\0627\0648\0632 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0627\0644\0645\0633\0645\0648\062D \0628\0647 \0645\0646 \0627\0644\0645\0648\0627\0631\062F. \0627\0644\0631\062C\0627\0621 \062A\0639\062F\064A\0644 \0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0642\0631\064A\0631 \0648\0625\0639\0627\062F\0629 \0627\0644\0645\062D\0627\0648\0644\0629.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096776824750712)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0635\0641\0648\0641 \0647\0630\0627 \0627\0644\062A\0642\0631\064A\0631 \0647\0648 %0 \0645\0646 \0627\0644\0635\0641\0648\0641. \0627\0644\0631\062C\0627\0621 \062A\0637\0628\064A\0642 \0645\0631\0634\062D \0644\062A\0642\0644\064A\0644 \0639\062F\062F \0627\0644\0633\062C\0644\0627\062A \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\062E\0627\0635 \0628\0643.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200972412750745)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F \0623\0642\0635\0649 %0')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201112640750745)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0633\064A\0637 %0')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043452884750696)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0627\0644\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101067702750713)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201067751750745)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F \0623\062F\0646\0649 %0')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200075569750744)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174454658750736)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0647\0631\064A')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113698604750717)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113550407750717)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644 \0627\0644\0643\0644')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226720007750753)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0627\0644\0645\0639\0631\0641 \0627\0644\062B\0627\0628\062A \0644\0644\0645\0646\0637\0642\0629 \0644\0623\0646 \0627\0644\0635\0641\062D\0629 \062A\062D\062A\0648\064A \0639\0644\0649 \0639\062F\0629 \062A\0642\0627\0631\064A\0631 \062A\0641\0627\0639\0644\064A\0629.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079642807750707)
,p_name=>'APEXIR_NAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0633\0645')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109337427750716)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\062C\0645\064A\0639 \0627\0644\062C\062F\064A\062F')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222553052750751)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0626\0629 \062C\062F\064A\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109458405750716)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\062D\062A\0633\0627\0628 \0627\0644\062C\062F\064A\062F')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104165023750714)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107272511750715)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\064A\0648\0645 \0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107045742750715)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0639\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107587969750715)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631 \0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107472412750715)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0633\0628\0648\0639 \0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107398932750715)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\064A\0627\0645 \0627\0644\062A\0627\0644\064A\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107129765750715)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0622\062E\0631 %0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107763431750715)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0633\0646\0648\0627\062A \0627\0644\062A\0627\0644\064A\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107631783750715)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0646\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079994816750707)
,p_name=>'APEXIR_NO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122668823750720)
,p_name=>'APEXIR_NONE'
,p_message_language=>'ar'
,p_message_text=>unistr('- \0628\0644\0627 -')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173669713750736)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 \0639\0646\0648\0627\0646 \0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A \0635\0627\0644\062D\064B\0627.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045798796750697)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\062D\062F\064A\062F \0623\0639\0645\062F\0629 \0644\0639\0631\0636\0647\0627. \0627\0633\062A\062E\062F\0645 <strong>\0627\0644\0623\0639\0645\062F\0629</strong> \0641\064A \0642\0627\0626\0645\0629 \0627\0644\0625\062C\0631\0627\0621\0627\062A \0644\062C\0639\0644 \0627\0644\0623\0639\0645\062F\0629 \0645\0631\0626\064A\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119127199750719)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645 \0627\0644\062E\0627\0644\064A\0629 \062F\0627\0626\0645\064B\0627 \0641\064A \0627\0644\0628\062F\0627\064A\0629')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119016808750719)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645 \0627\0644\062E\0627\0644\064A\0629 \062F\0627\0626\0645\064B\0627 \0641\064A \0627\0644\0646\0647\0627\064A\0629')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119533285750719)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \0627\0644\0642\064A\0645 \0627\0644\0641\0627\0631\063A\0629 %0')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115918438750718)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0648\0642\062A \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\0627\0631\064A\062E\064A\0629 \0631\0642\0645\064A\064B\0627.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115568916750718)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0627\0644\062A\0633\0644\0633\0644 \0631\0642\0645\064A\064B\0627.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120065387750719)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0627\0645\0644')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078514882750707)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\0631\062A\0642\0627\0644\064A')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192501225750742)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\062A\062C\0627\0647')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080499506750707)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0630\0644\0643')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046662204750697)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0642\0633\064A\0645 \0635\0641\062D\0627\062A %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060620170750701)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062A\062C\0627\0647 \0627\0644\0635\0641\062D\0629')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061347133750701)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0641\0642\064A')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061437012750701)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0623\0633\064A')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060503790750701)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062C\0645 \0627\0644\0635\0641\062D\0629')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061165542750701)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'ar'
,p_message_text=>'A3'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061068279750701)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'ar'
,p_message_text=>'A4'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061243494750701)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062E\0635\0635')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060833338750701)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'ar'
,p_message_text=>'Legal'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060771856750701)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'ar'
,p_message_text=>'Letter'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060964694750701)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'ar'
,p_message_text=>'Tabloid'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201493735750745)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\0628\0629 \0627\0644\0639\062F\062F \0627\0644\0625\062C\0645\0627\0644\064A %0 (%)')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200693419750745)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\0628\0629 \0627\0644\0645\062C\0645\0648\0639 \0627\0644\0625\062C\0645\0627\0644\064A %0 (%)')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199668335750744)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\0628\0629 \0627\0644\0639\062F\062F \0627\0644\0625\062C\0645\0627\0644\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199519824750744)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0633\0628\0629 \0627\0644\0645\062C\0645\0648\0639 \0627\0644\0625\062C\0645\0627\0644\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084077229750708)
,p_name=>'APEXIR_PIE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0631\0635\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149744170750729)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062C\062F\0648\0644 \0627\0644\0645\062D\0648\0631\064A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151229106750729)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0627\0644\062A\062C\0645\064A\0639.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151492968750729)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646\0643 \0627\0644\062A\062C\0645\064A\0639 \0641\064A \0639\0645\0648\062F \0645\062D\062F\062F \0643\0639\0645\0648\062F \0635\0641.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150635045750729)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\062D\0648\0631\064A\0629')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150497892750729)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0645\062D\0648\0631\064A %0')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151065829750729)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\0648\0631\064A.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137003516330750684)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0642\0644\0644 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0627\0644\0635\0641\0648\0641 \0641\064A \0627\0633\062A\0639\0644\0627\0645 \0645\062D\0648\0631\064A \0645\0646 \0639\062F\062F \0627\0644\0635\0641\0648\0641 \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0623\0633\0627\0633\064A\060C \0648\0644\064A\0633 \0645\0646 \0639\062F\062F \0627\0644\0635\0641\0648\0641 \0627\0644\0645\0639\0631\0648\0636\0629. \064A\062A\062C\0627\0648\0632 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0631\0626\064A\0633\064A \0644\062F\064A\0643 \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0644\0639\062F\062F \0627\0644\0635\0641\0648\0641 %0. \0627\0644\0631\062C\0627\0621 \062A\0637\0628\064A\0642 \0645\0631\0634\062D \0644\062A\0642\0644\064A\0644 \0639\062F\062F \0627\0644\0633\062C\0644\0627\062A \0641\064A \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0623\0633\0627\0633\064A \0627\0644\062E\0627\0635 \0628\0643.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150907704750729)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \0645\062D\0648\0631\064A')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116999109750718)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A \0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\0648\0631\064A \0639\0644\0649 \0627\0644\0643\062B\064A\0631 \0645\0646 \0627\0644\0642\064A\0645 \0627\0644\0641\0631\064A\062F\0629 - \0644\0627 \064A\0645\0643\0646 \062A\0643\0648\064A\0646 SQL \0645\062D\0648\0631\064A.')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047977405750697)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 %0 \0627\0644\0645\062D\0648\0631\064A\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173713410750736)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0627\064A\0646\0629')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104237157750714)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0628\0642')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137198501895750744)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0633\0627\0633\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174737170750736)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0623\0633\0627\0633\064A')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060498293750701)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0636\0645\064A\0646 \0639\0644\0627\0645\0627\062A \0625\0645\0643\0627\0646\064A\0629 \0627\0644\0648\0635\0648\0644')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021258733750689)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0635 \0627\0644\0645\0646\0633\0642 \0644\0644\0634\0631\064A\062D\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129656788750722)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0627\0635')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084614860750708)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0627\0645')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080251176750707)
,p_name=>'APEXIR_RED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\062D\0645\0631')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226614315750753)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0639\0631\0641 \0627\0644\062B\0627\0628\062A \0644\0644\0645\0646\0637\0642\0629 %0 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113780581750717)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113801182750717)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\0643\0644')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222049246750751)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113306454750717)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0641\0648\0627\0635\0644 \0639\0646\0627\0635\0631 \0627\0644\062A\062D\0643\0645')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113094005750717)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0645\0631\0634\062D')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113199523750717)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062A\0627\0631\064A\062E\064A\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222127425750751)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113419085750717)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\062A\0645\064A\064A\0632')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222272625750751)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \0627\0644\062C\062F\0648\0644 \0627\0644\0645\062D\0648\0631\064A')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203335285750745)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0632\0627\0644\0629 \062A\0642\0631\064A\0631')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185193568750740)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0633\0645\064A\0629 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0627\0641\062A\0631\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704482
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122962882750720)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0633\0645\064A\0629 \0627\0644\062A\0642\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104524615750714)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201548485750745)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0627\0631\064A\0631')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076705700750706)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A \0627\0644\0645\062D\0641\0648\0638 \0628\0627\0644\0627\0633\0645 \0627\0644\0645\0633\062A\0639\0627\0631 %0 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129962955750722)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076856604750706)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0641 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A \0627\0644\0645\062D\0641\0648\0638 %0 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121212503750720)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0642\0627\0631\064A\0631')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045487892750696)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F\0627\062A \062A\0642\0631\064A\0631 %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101582645750714)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\064A\0642\0629 \0639\0631\0636 \0627\0644\062A\0642\0631\064A\0631')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105742276750715)
,p_name=>'APEXIR_RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084848656750709)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\0639\0627\062F\0629 \0627\0644\062A\0642\0631\064A\0631 \0625\0644\0649 \0627\0644\0625\0639\062F\0627\062F\0627\062A \0627\0644\0627\0641\062A\0631\0627\0636\064A\0629.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080072242750707)
,p_name=>'APEXIR_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197611450750744)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645 ROWID \0643\0639\0645\0648\062F \0645\0641\062A\0627\062D \0623\0633\0627\0633\064A \0644\0645\0635\062F\0631 \0628\064A\0627\0646\0627\062A REST.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112427019750717)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641\0648\0641')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175446262750737)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\0641\0648\0641 \0644\0643\0644 \0635\0641\062D\0629')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150764537750729)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0639\0645\062F\0629 \0627\0644\0635\0641\0648\0641')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150547469750729)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0627\0644\0635\0641 %0')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151125642750729)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0639\0645\0648\062F \0627\0644\0635\0641.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151316307750729)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0639\0645\0648\062F \0627\0644\0635\0641 \0645\062E\062A\0644\0641\064B\0627 \0639\0646 \0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\0648\0631\064A.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126965260750721)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0634\062D \0627\0644\0635\0641')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101630234750714)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641 %0 \0645\0646 %1')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105941849750715)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0635 \0627\0644\0635\0641 \064A\062D\062A\0648\064A \0639\0644\0649')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079377881750707)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116518562750718)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0645\062D\0641\0648\0638')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116462371750718)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631 \0627\0644\0645\062D\0641\0648\0638 = "%0"')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118634815750719)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\064A\062A\0645 \0627\0633\062A\062E\062F\0627\0645 \0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0642\0631\064A\0631 \0627\0644\062D\0627\0644\064A \0643\0625\0639\062F\0627\062F\0627\062A \0627\0641\062A\0631\0627\0636\064A\0629 \0644\0643\0644 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646.')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137185040318750740)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0627\0641\062A\0631\0627\0636\064A')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105660594750715)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638 \062A\0642\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222404027750751)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638 \0627\0644\062A\0642\0631\064A\0631*')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176491959750737)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111394149750717)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0631\064A\0637 \0627\0644\0628\062D\062B')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137044771555750696)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0631\064A\0637 \0628\062D\062B %0')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137222390622750751)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B: %0')
,p_is_js_message=>true
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181978160750739)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0642\0631\064A\0631 \0627\0644\0628\062D\062B')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137165950422750734)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\062D\062F\062F\0629')
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081050016750707)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('- \062A\062D\062F\064A\062F \0639\0645\0648\062F -')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104903645750715)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0623\0639\0645\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084526599750708)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('- \062A\062D\062F\064A\062F \0648\0638\064A\0641\0629 -')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112176744750717)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('- \062A\062D\062F\064A\062F \0639\0645\0648\062F \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628 -')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150289908750729)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('- \062A\062D\062F\064A\062F \0639\0645\0648\062F \0645\062D\0648\0631\064A -')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200522447750745)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0635\0641')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150358722750729)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('- \062A\062D\062F\064A\062F \0639\0645\0648\062F \0635\0641 -')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137031882289750692)
,p_name=>'APEXIR_SEND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644')
,p_is_js_message=>true
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054331224750699)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0631\0633\0627\0644 \0643\0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079754440750707)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0633\0644\0633\0644')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137105163506750715)
,p_name=>'APEXIR_SORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632')
,p_is_js_message=>true
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114629900750718)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \062A\0635\0627\0639\062F\064A')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114784526750718)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \062A\0646\0627\0632\0644\064A')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202770837750745)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0631\062A\064A\0628 \0627\0644\0641\0631\0632')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109022065750716)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\0627\0641\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137120250372750719)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0627\0644\0629 %0')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174138154750736)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0634\062A\0631\0627\0643')
,p_is_js_message=>true
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199924446750744)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0647\0627\064A\0629')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137018981161750689)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\062E\0637\064A \0641\064A \062D\0627\0644\0629 \0639\062F\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0644\0628\064A\0627\0646\0627\062A')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137199889073750744)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062F\0627\064A\0629 \0645\0646')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200756063750745)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062C\0645\0648\0639 %0')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191611735750742)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'ar'
,p_message_text=>unistr('%0\060C \0627\0644\062A\0642\0631\064A\0631 = %1\060C \0637\0631\064A\0642\0629 \0627\0644\0639\0631\0636 = %2')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078635091750707)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0648\0646 \0627\0644\0646\0635')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097333685750712)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\064A\0627\0645')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097220864750712)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0627\0639\0627\062A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097134385750712)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0642\0627\0626\0642')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097595212750712)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0647\0648\0631')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097415891750712)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0627\0628\064A\0639')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097644966750712)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0646\0648\0627\062A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203158777750745)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631/\0625\062E\0641\0627\0621')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137113980037750717)
,p_name=>'APEXIR_TOP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0639\0644\0649')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196619538750743)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \063A\064A\0631 \0645\062C\0645\0639')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115465478750718)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0627\0633\0645 \0627\0644\062A\0645\064A\064A\0632 \0641\0631\064A\062F\064B\0627.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083313218750708)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A \063A\064A\0631 \0645\062F\0639\0648\0645')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114051519750717)
,p_name=>'APEXIR_UP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0623\0639\0644\0649')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115680853750718)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \0625\062F\062E\0627\0644 \0644\0648\0646 \0635\0627\0644\062D.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137115726297750718)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \0625\062F\062E\0627\0644 \0642\0646\0627\0639 \0635\064A\063A\0629 \0635\0627\0644\062D.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137080505923750707)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114562490750717)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0627\0644\0645\062D\0648\0631 \0644\0644\0642\064A\0645\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137122351358750720)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629 \0645\0637\0644\0648\0628\0629')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083974554750708)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0631\0623\0633\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137192765247750742)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0623\0633\064A')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121664857750720)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180288997750738)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\062A\0641\0627\0635\064A\0644')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224547609750752)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A \0627\0644\062A\0642\0631\064A\0631 \0639\0644\0649 \0637\0631\064A\0642\0629 \0639\0631\0636 %0 \0645\0639\0631\0641\0629.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180399165750738)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\062A\062C\0645\064A\0639 \062D\0633\0628')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180116814750738)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\0623\064A\0642\0648\0646\0627\062A')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150015256750729)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\062C\062F\0648\0644 \0627\0644\0645\062D\0648\0631\064A')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137121791330750720)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\062A\0642\0631\064A\0631')
,p_version_scn=>2704474
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174365190750736)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0628\0648\0639\064A')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104407685750714)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0642\0631\064A\0631 \0627\0644\0639\0645\0644')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202172080750745)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\064A\0627\0645')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202082298750745)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137201912767750745)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202316009750745)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0634\0647\0648\0631')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202280525750745)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137202430929750745)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 \0627\0644\0633\0646\0648\0627\062A')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137200133174750744)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0646\0629')
,p_version_scn=>2704487
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137078336374750707)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0635\0641\0631')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137079899795750707)
,p_name=>'APEXIR_YES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0639\0645')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137114310216750717)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A %0 \0639\0644\0649 < or > \0648\0647\0648 \062D\0631\0641 \063A\064A\0631 \0635\0627\0644\062D.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137138288194750725)
,p_name=>'APEX_REGION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0637\0642\0629')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029367378750692)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0627\0633\062A\062E\0631\0627\062C \0645\0644\0641 ZIP.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029212965750692)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \062A\0648\0642\064A\0639 \062F\0644\064A\0644 \0646\0647\0627\064A\0629 \0627\0644\0645\0631\0643\0632\064A. \0647\0630\0627 \0627\0644\0645\0644\0641 \0644\064A\0633 \0645\0644\0641 ZIP.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137060377371750701)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062E\0631\0642 \0627\0644\0634\0631\0648\0637 \0627\0644\0645\0633\0628\0642\0629 \0644\0648\0627\062C\0647\0629 \0628\0631\0645\062C\0629 \0627\0644\062A\0637\0628\064A\0642\0627\062A')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082488710750708)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0644\062D\0635\0648\0644 \0639\0644\0649 \0642\064A\0645\0629 \0625\0639\062F\0627\062F \0627\0644\062A\0637\0628\064A\0642 %0 \0644\0623\0646 \062E\064A\0627\0631 \0627\0644\062A\0643\0648\064A\0646 \0627\0644\0645\0631\062A\0628\0637 \0645\0639\0637\0644.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082305860750708)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\0639\064A\064A\0646 \0642\064A\0645\0629 \0625\0639\062F\0627\062F \0627\0644\062A\0637\0628\064A\0642 %0 \0644\0623\0646 \062E\064A\0627\0631 \0627\0644\062A\0643\0648\064A\0646 \0627\0644\0645\0631\062A\0628\0637 \0645\0639\0637\0644.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194914799750743)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0645\0629 \0625\0639\062F\0627\062F \0627\0644\062A\0637\0628\064A\0642 %0 \063A\064A\0631 \0635\0627\0644\062D\0629')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137194855850750743)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\062F\0627\062F \0627\0644\062A\0637\0628\064A\0642 \0627\0644\0645\0637\0644\0648\0628 %0 \063A\064A\0631 \0645\0639\0631\0641')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195001658750743)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\0639\064A\064A\0646 \0625\0639\062F\0627\062F \0627\0644\062A\0637\0628\064A\0642 %0 \0639\0644\0649 \0642\064A\0645\0629 \0641\0627\0631\063A\0629')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068961551750704)
,p_name=>'BACK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0644\062E\0644\0641')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051339341750698)
,p_name=>'BUILDER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0646\0634\0626')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124931609750721)
,p_name=>'BUTTON LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\0645\064A\0629 \0627\0644\0632\0631')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048202632750697)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0632\0631 \0641\0626\0627\062A CSS')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086791453750709)
,p_name=>'BUTTON_ID'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0643\0648\0646 \0645\0639\0631\0641 \0627\0644\0632\0631 \0627\0644\0630\064A \062A\0645 \062A\0643\0648\064A\0646\0647 \0627\0644\0645\0639\0631\0641 \0627\0644\062B\0627\0628\062A \0644\0644\0632\0631 \0641\064A \062D\0627\0644\0629 \062A\0639\0631\064A\0641\0647\060C \0623\0648 \0641\064A \062D\0627\0644\0629 \0639\062F\0645 \062A\0639\0631\064A\0641\0647\060C \064A\0643\0648\0646 \0645\0639\0631\0641 \062A\0645 \062A\0643\0648\064A\0646\0647 \062F\0627\062E\0644\064A\064B\0627 \0628\0627\0644\0635\064A\063A\0629 ''B'' || [\0645\0639\0631\0641 \0627\0644\0632\0631 \0627\0644\062F\0627\062E\0644\064A]')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020726972750689)
,p_name=>'CANDLESTICK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0645\0648\0639 \0627\0644\064A\0627\0628\0627\0646\064A\0629')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134726219750724)
,p_name=>'CENTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0633\0637')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081390816750708)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0644\0628 %0')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071348168750704)
,p_name=>'CHECK$'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062D\062F\062F \0627\0644\0635\0641')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137196792026750743)
,p_name=>'CHECKED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062D\062F\062F')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173153131750736)
,p_name=>'COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130756870750723)
,p_name=>'COMMENTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0639\0644\064A\0642\0627\062A')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111784303750717)
,p_name=>'CONTINUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062A\0627\0628\0639\0629')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069298449750704)
,p_name=>'COPYRIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0642\0648\0642 \0627\0644\0646\0634\0631 &copy; \0644\0639\0627\0645 1999\060C %0\060C \0645\062D\0641\0648\0638\0629 \0644\0634\0631\0643\0629 \0623\0648\0631\0627\0643\0644 \0648/\0623\0648 \0627\0644\0634\0631\0643\0627\062A \0627\0644\062A\0627\0628\0639\0629 \0644\0647\0627.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117423657750718)
,p_name=>'COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\062F\062F')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124416227750721)
,p_name=>'CREATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0648\064A\0646')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179865114750738)
,p_name=>'CREATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062A\0643\0648\064A\0646')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179965640750738)
,p_name=>'CREATED_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062A\0643\0648\064A\0646 \0628\0648\0627\0633\0637\0629')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100890562750713)
,p_name=>'CREATED_ON'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062A\0643\0648\064A\0646 \0641\064A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111921140750717)
,p_name=>'CUSTOM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062E\0635\0635')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123155145750720)
,p_name=>'CUSTOMIZE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062E\0635\064A\0635')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125159290750721)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \062A\0641\0636\064A\0644\0627\062A \0627\0644\0635\0641\062D\0629 \0644\0644\0645\0633\062A\062E\062F\0645 %0.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125297278750721)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\063A\064A\064A\0631 \0627\0644\062A\0641\0636\064A\0644\0627\062A \0644\0644\0645\0633\062A\062E\062F\0645 %0.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125040448750721)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \062A\0641\0636\064A\0644\0627\062A \0627\0644\0635\0641\062D\0629 \0644\0644\0645\0633\062A\062E\062F\0645 %0.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086153719750709)
,p_name=>'DAILY'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\0645\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049589620750698)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0644\0641 \0627\0644\0630\064A \062A\0645 \062A\062D\0645\064A\0644\0647 \063A\064A\0631 \0635\0627\0644\062D \0623\0648 \0644\0647 \0627\0645\062A\062F\0627\062F \062E\0637\0623.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081524075750708)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0633\062A\062E\062F\0627\0645 \0645\062D\062F\062F XML \0623\0648JSON \063A\064A\0631 \0635\0627\0644\062D.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026691736750691)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A \0645\0644\0641 \062A\0639\0631\064A\0641 \0627\0644\0628\064A\0627\0646\0627\062A \0648\0627\0644\0645\0644\0641 \0627\0644\0630\064A \062A\0645 \062A\062D\0645\064A\0644\0647 \0639\0644\0649 \0623\064A \0639\0645\0648\062F \062C\062F\0648\0644 \0647\062F\0641.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140533339750726)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0628\064A\0627\0646\0627\062A \0641\064A \0627\0644\0645\0644\0641 \0627\0644\0630\064A \062A\0645 \062A\062D\0645\064A\0644\0647.')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140623495750726)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0628\064A\0627\0646\0627\062A \0641\064A \0648\0631\0642\0629 \0627\0644\0639\0645\0644 "%0".')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046443674750697)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0644\0641 \0627\0644\0645\062D\062F\062F \0644\064A\0633 \0645\0644\0641 XLSX.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137012460812750687)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0649 \062A\062D\0645\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A: \062A\0645\062A \0645\0639\0627\0644\062C\0629 %0 \0645\0646 \0627\0644\0635\0641\0648\0641.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014717030750687)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0649 \062A\062D\0645\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A: \062A\0645\062A \0645\0639\0627\0644\062C\0629 %0 \0645\0646 \0627\0644\0635\0641\0648\0641 \0648\064A\0648\062C\062F \062E\0637\0623 \0648\0627\062D\062F.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137015074024750687)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0649 \062A\062D\0645\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A: \062A\0645\062A \0645\0639\0627\0644\062C\0629 %0 \0645\0646 \0627\0644\0635\0641\0648\0641 \0648\064A\0648\062C\062F %1 \0645\0646 \0627\0644\0623\062E\0637\0627\0621.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014895125750687)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0649 \062A\062D\0645\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A: \062A\0645\062A \0645\0639\0627\0644\062C\0629 \0635\0641 \0648\0627\062D\062F.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029102099750692)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0649 \062A\062D\0645\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A: \062A\0645\062A \0645\0639\0627\0644\062C\0629 \0635\0641 \0648\0627\062D\062F \0628\0648\062C\0648\062F \0623\062E\0637\0627\0621.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137014978120750687)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\0649 \062A\062D\0645\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A: \062A\0645\062A \0645\0639\0627\0644\062C\0629 \0635\0641 \0648\0627\062D\062F \0628\062F\0648\0646 \0623\062E\0637\0627\0621.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147638887750728)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0627\0644\0647\062F\0641')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054822722750699)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\0645 \0627\0644\062A\062D\0645\064A\0644')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054974210750699)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623 \0645\0639\0627\0644\062C\0629 \0623\0648\0644\064A\0629')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147760855750728)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0627\0644\0645\0635\062F\0631')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148578185750728)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\064A\063A\0629 \0627\0644\0631\0642\0645/\0627\0644\062A\0627\0631\064A\062E')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054670642750699)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062F\0631\0627\062C \0635\0641')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210758105750748)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644\062A \0627\0633\062A\0639\0627\062F\0629 \0642\064A\0645\0629 \0627\0644\0628\062D\062B.')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137180444802750738)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062E\0637\064A\0637 \0627\0644\0628\064A\0627\0646\0627\062A/\0627\0644\062C\062F\0648\0644')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148650456750728)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055079906750700)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0633\0644\0633\0644: \0627\0644\0625\062C\0631\0627\0621')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142335460750726)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644\062A \0642\0627\0639\062F\0629 \0627\0644\062A\062D\0648\064A\0644')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054748516750699)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062B \0627\0644\0635\0641')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117070362750718)
,p_name=>'DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0631\064A\062E')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089947997750710)
,p_name=>'DAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\0645')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090009432750710)
,p_name=>'DAYS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\064A\0627\0645')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130458969750723)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0635\062D\064A\062D \0627\0644\0623\062E\0637\0627\0621 \063A\064A\0631 \0645\0645\0643\0646 \0641\064A \0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137182119436750739)
,p_name=>'DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0641\062A\0631\0627\0636\064A')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090725292750710)
,p_name=>'DELETE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0630\0641')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066371150750703)
,p_name=>'DELETE_MSG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0647\0644 \062A\0631\064A\062F \062A\0646\0641\064A\0630 \0625\062C\0631\0627\0621 \0627\0644\062D\0630\0641 \0647\0630\0627\061F')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137045952833750697)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062C\0627\0648\0632\0627\062A \0627\0644\062C\0644\0633\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046805815750697)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645\0643\064A\0646 \062A\062C\0627\0648\0632\0627\062A \0627\0644\062C\0644\0633\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047740539750697)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\062D\0645\064A\0644 \062A\062C\0627\0648\0632\0627\062A \0627\0644\062C\0644\0633\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047555685750697)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062D\0641\0638 \062A\062C\0627\0648\0632\0627\062A \0627\0644\062C\0644\0633\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137047422620750697)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0641\0638 \062A\062C\0627\0648\0632\0627\062A \0627\0644\062C\0644\0633\0629. \0623\063A\0644\0642 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 \0647\0630\0627 \0644\0639\0631\0636 \0627\0644\062A\063A\064A\064A\0631\0627\062A.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137020647790750689)
,p_name=>'DIAL_PCT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\0631\0635 (\0627\0644\0646\0633\0628\0629 \0627\0644\0645\0626\0648\064A\0629)')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137061629100750701)
,p_name=>'DOWNLOAD'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0646\0632\064A\0644')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181286613750738)
,p_name=>'DUP_USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0645\0633\062A\062E\062F\0645 \0645\062A\0643\0631\0631 \0641\064A \0627\0644\0642\0627\0626\0645\0629.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070085675750704)
,p_name=>'EDIT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081233373750707)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0639\0646\0648\0627\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A "%0".')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063927741750702)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\0631\0633\0627\0644 \0647\0630\0627 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A \0628\0648\0627\0633\0637\0629 %0.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181425144750739)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0646\0648\0627\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A \0637\0648\064A\0644 \0644\0644\063A\0627\064A\0629. \0627\0644\062D\062F \0647\0648 240 \062D\0631\0641\064B\0627.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111695923750717)
,p_name=>'ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142401050750726)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \062A\0639\064A\064A\0646 \0642\064A\0645\0629 \0645\0635\062F\0631 \0639\0646\0635\0631 \0627\0644\0635\0641\062D\0629 \0644\0645\0646\0637\0642\0629 \0627\0644\062A\062C\062F\064A\062F \0627\0644\062C\0632\0626\064A \0644\0644\0635\0641\062D\0629')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102930680750714)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062A\0643\0648\064A\0646 \0628\0648\0627\0633\0637\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064288831750702)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0647\062A \0635\0644\0627\062D\064A\0629 \0643\0644\0645\0629 \0627\0644\0633\0631')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137056668180750700)
,p_name=>'FILE_EMPTY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0644\0641 \0641\0627\0631\063A.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146470973750728)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0632\0627\062F \062D\062C\0645 \0627\0644\0645\0644\0641 \0627\0644\0630\064A \062A\0645 \062A\062D\0645\064A\0644\0647 \0639\0646 %0 \0645\064A\063A\0627\0628\0627\064A\062A. \0627\0644\0631\062C\0627\0621 \062A\062D\0645\064A\0644 \0645\0644\0641 \0623\0635\063A\0631.')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066508841750703)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \0627\0644\062A\0635\062F\064A\0642 \0639\0644\0649 \0627\0644\0645\0633\062A\062E\062F\0645 \0648\0644\0645 \064A\062A\0645 \062A\062D\0645\064A\0644 \0645\0644\0641 \0623\0648 \0623\0643\062B\0631.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066607585750703)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062A\064A\062D \0647\0630\0627 \0627\0644\0645\062B\064A\0644 \0644\0644\0645\0633\062A\062E\062F\0645\064A\0646 \063A\064A\0631 \0627\0644\0645\0635\062F\0642\064A\0646 \0628\062A\062D\0645\064A\0644 \0627\0644\0645\0644\0641\0627\062A.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146509519750728)
,p_name=>'FILTERS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0631\0634\062D\0627\062A')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124561534750721)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0648\0627\062D\062F')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123795268750720)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B\062A %0 \0645\0646 \0627\0644\0623\062E\0637\0627\0621')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069183751750704)
,p_name=>'FORM_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0645\0646 %1')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108112020750716)
,p_name=>'GO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0642\0627\0644 \0625\0644\0649')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210316749750748)
,p_name=>'HELP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0639\0644\064A\0645\0627\062A')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051426507750698)
,p_name=>'HOME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641\062D\0629 \0627\0644\0631\0626\064A\0633\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089769942750710)
,p_name=>'HOUR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0627\0639\0629')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089836941750710)
,p_name=>'HOURS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0627\0639\0627\062A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137071221760750704)
,p_name=>'ICON'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0623\064A\0642\0648\0646\0629 %0')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048510059750697)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0644\064A\0645\0627\062A \0627\0644\0623\064A\0642\0648\0646\0629 "\0642\0635"')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049794712750698)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\0627\0633\062D\0628 \0623\064A\0642\0648\0646\062A\0643 \0648\0627\0633\062A\062E\062F\0645 \0634\0631\064A\0637 \062A\0645\0631\064A\0631 \0627\0644\062A\0642\0631\064A\0628/\0627\0644\0625\0628\0639\0627\062F \0644\062A\063A\064A\064A\0631 \0648\0636\0639\0647\0627 \0641\064A \0627\0644\0625\0637\0627\0631.</p>'),
'',
unistr('<p>\0639\0646\062F \062A\062D\0645\064A\0644 \0623\064A\0642\0648\0646\0629 \062C\062F\064A\062F\0629\060C \064A\062A\0645 \062A\063A\064A\064A\0631 \062D\062C\0645\0647\0627 \0644\062A\0646\0627\0633\0628 \062B\0644\0627\062B\0629 \062A\0646\0633\064A\0642\0627\062A: \0623\064A\0642\0648\0646\0629 \0645\0641\0636\0644\0629 \0648\0623\064A\0642\0648\0646\0629 \0635\063A\064A\0631\0629 \0648\0623\064A\0642\0648\0646\0629 \0643\0628\064A\0631\0629.</p>'),
'',
unistr('<p>\0639\0646\062F \0627\0644\062A\0631\0643\064A\0632 \0639\0644\0649 \0623\062F\0627\0629 \0642\0635 \0627\0644\0623\064A\0642\0648\0646\0629\060C \062A\062A\0648\0641\0631 \0627\062E\062A\0635\0627\0631\0627\062A \0627\0644\0645\0641\0627\062A\064A\062D \0627\0644\062A\0627\0644\064A\0629:</p>'),
'<ul>',
unistr('    <li>\0627\0644\0633\0647\0645 \0644\0644\064A\0633\0627\0631: \0646\0642\0644 \0627\0644\0635\0648\0631\0629 \0644\0644\064A\0633\0627\0631*</li>'),
unistr('    <li>\0627\0644\0633\0647\0645 \0644\0623\0639\0644\0649: \0646\0642\0644 \0627\0644\0635\0648\0631\0629 \0644\0623\0639\0644\0649*</li>'),
unistr('    <li>\0627\0644\0633\0647\0645 \0644\0644\064A\0645\064A\0646: \0646\0642\0644 \0627\0644\0635\0648\0631\0629 \0644\0644\064A\0645\064A\0646*</li>'),
unistr('    <li>\0627\0644\0633\0647\0645 \0644\0623\0633\0641\0644: \0646\0642\0644 \0627\0644\0635\0648\0631\0629 \0644\0623\0633\0641\0644*</li>'),
unistr('    <li>I: \062A\0642\0631\064A\0628</li>'),
unistr('    <li>O: \0625\0628\0639\0627\062F</li>'),
unistr('    <li>L: \062A\062F\0648\064A\0631 \0644\0644\064A\0633\0627\0631</li>'),
unistr('    <li>R: \062A\062F\0648\064A\0631 \0644\0644\064A\0645\064A\0646</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*\0627\0636\063A\0637 \0628\0627\0633\062A\0645\0631\0627\0631 \0639\0644\0649 Shift \0644\0644\062A\062D\0631\0643 \0628\0633\0631\0639\0629 \0623\0643\0628\0631</em></p>')))
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055212907750700)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062D\0628 \0644\062A\063A\064A\064A\0631 \0648\0636\0639 \0627\0644\0623\064A\0642\0648\0646\0629')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055375075750700)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644 \0634\0631\064A\0637 \0627\0644\062A\0645\0631\064A\0631 \0644\062A\0639\062F\064A\0644 \0645\0633\062A\0648\0649 \0627\0644\062A\0642\0631\064A\0628/\0627\0644\0625\0628\0639\0627\062F')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048379331750697)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\064A\0642\0648\0646\0629 \062A\062D\0631\064A\0631 \0627\0644\062A\0637\0628\064A\0642\0627\062A')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048637461750697)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\064A\0642\0648\0646\0629 "\062E\0637\0623 \0641\064A \0627\0644\062D\0641\0638"')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131099966750723)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'ar'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> \064A\0633\062A\062E\062F\0645 \0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642 \0623\064A\0642\0648\0646\0627\062A \0642\062F\064A\0645\0629. \0633\064A\0624\062F\064A \062A\062D\0645\064A\0644 \0623\064A\0642\0648\0646\0629 \062C\062F\064A\062F\0629 \0625\0644\0649 \0627\0633\062A\0628\062F\0627\0644 \0643\0644 \0627\0644\0623\064A\0642\0648\0646\0627\062A \0627\0644\0642\062F\064A\0645\0629.</p>')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137049248346750698)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0645\064A\0644 \0623\064A\0642\0648\0646\0629 \062C\062F\064A\062F\0629')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125410582750721)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\064A\0627\0646\0627\062A \0635\0644\0627\062D\064A\0629 \062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644 \063A\064A\0631 \0635\0627\0644\062D\0629')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226590134750753)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0645\0629 \063A\064A\0631 \0635\0627\0644\062D\0629 \0644\0644\0645\0639\0644\0645\0629: %0')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119740159750719)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0625\0639\062F\0627\062F\0627\062A \0627\0644\062A\0642\0631\064A\0631 \0627\0644\0627\0641\062A\0631\0627\0636\064A\0629')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119821579750719)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\062A\0642\0631\064A\0631 \0645\0639\064A\0646')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101723515750714)
,p_name=>'IR_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623 %0. %1')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101400460750714)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \062D\0633\0627\0628 \062A\0646\0642\0644 \0627\0644\0646\0645\0648\0630\062C. %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077083120750706)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0644\062A\0642\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076487073750706)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0637\0642\0629 \0627\0644\062A\0642\0631\064A\0631 \063A\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A \0644\064A\0633\062A \0645\0648\062C\0648\062F\0629 \0641\064A \0627\0644\062A\0637\0628\064A\0642 %0 \0648\0627\0644\0635\0641\062D\0629 %1 \0648\0627\0644\0645\0646\0637\0642\0629 %2.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137119609628750719)
,p_name=>'IR_STAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0638\0647\0631 \0644\0644\0645\0637\0648\0631\064A\0646 \0641\0642\0637')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107807359750715)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0627\062C \0627\0633\062A\0639\0644\0627\0645 \0627\0644\062A\0642\0631\064A\0631 \0625\0644\0649 \0645\0641\062A\0627\062D \0641\0631\064A\062F \0644\062A\0639\0631\064A\0641 \0643\0644 \0635\0641. \0644\0627 \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645 \0627\0644\0645\0641\062A\0627\062D \0627\0644\0645\0642\062F\0645 \0628\0647\0630\0627 \0627\0644\0627\0633\062A\0639\0644\0627\0645. \0627\0644\0631\062C\0627\0621 \062A\0639\0631\064A\0641 \0639\0645\0648\062F \0645\0641\062A\0627\062D \0641\0631\064A\062F. %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137107968533750715)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0627\062C \0627\0633\062A\0639\0644\0627\0645 \0627\0644\062A\0642\0631\064A\0631 \0625\0644\0649 \0645\0641\062A\0627\062D \0641\0631\064A\062F \0644\062A\0639\0631\064A\0641 \0643\0644 \0635\0641. \0644\0627 \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645 \0627\0644\0645\0641\062A\0627\062D \0627\0644\0645\0642\062F\0645 \0628\0647\0630\0627 \0627\0644\0627\0633\062A\0639\0644\0627\0645. \0627\0644\0631\062C\0627\0621 \062A\062D\0631\064A\0631 \0633\0645\0627\062A \0627\0644\062A\0642\0631\064A\0631 \0644\062A\0639\0631\064A\0641 \0639\0645\0648\062F \0645\0641\062A\0627\062D \0641\0631\064A\062F. %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148800975750728)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\062E\062A\064A\0627\0631 \0645\0644\0641')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148717803750728)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\062D\0628 \0627\0644\0645\0644\0641\0627\062A \0648\0625\0641\0644\0627\062A\0647\0627 \0647\0646\0627 \0623\0648')
,p_is_js_message=>true
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069471002750704)
,p_name=>'ITEMS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0646\0627\0635\0631')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103161887750714)
,p_name=>'ITEM_VALUE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0645\0629 \0627\0644\0639\0646\0635\0631')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117769712750718)
,p_name=>'LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0633\0645\064A\0629')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130331941750722)
,p_name=>'LANGUAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0644\063A\0629')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090492554750710)
,p_name=>'LAST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\062E\064A\0631')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066428639750703)
,p_name=>'LENGTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0637\0648\0644')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124776452750721)
,p_name=>'LOGIN'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166365569750734)
,p_name=>'MANAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062F\0627\0631\0629')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137229470562750754)
,p_name=>'MAXIMIZE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0628\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089573259750710)
,p_name=>'MINUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0642\064A\0642\0629')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089630002750710)
,p_name=>'MINUTES'
,p_message_language=>'ar'
,p_message_text=>unistr('\062F\0642\0627\0626\0642')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181660949750739)
,p_name=>'MISSING_AT'
,p_message_language=>'ar'
,p_message_text=>unistr('"@" \063A\064A\0631 \0645\0648\062C\0648\062F \0641\064A \0639\0646\0648\0627\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181845360750739)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0630\064A\0631: \0644\0645 \064A\062A\0645 \062A\0639\0631\064A\0641 \0642\0627\0644\0628 \0635\0641\062D\0629 \0645\0631\0628\0639 \062D\0648\0627\0631 \0644\0635\0641\062D\0629 \0645\0631\0628\0639 \0627\0644\062D\0648\0627\0631 %0 \0641\064A \0627\0644\062A\0637\0628\064A\0642 %1.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181524638750739)
,p_name=>'MISSING_DOT'
,p_message_language=>'ar'
,p_message_text=>unistr('"." \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0641\064A \0645\062C\0627\0644 \0639\0646\0648\0627\0646 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127840224750722)
,p_name=>'MODULE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\062D\062F\0629 \0627\0644\0646\0645\0637\064A\0629')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082069598750708)
,p_name=>'MONTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0631')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085934677750709)
,p_name=>'MONTHLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0634\0647\0631\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082112015750708)
,p_name=>'MONTHS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0647\0648\0631')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117335155750718)
,p_name=>'MOVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188165609750741)
,p_name=>'MOVE_FROM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644 \0645\0646')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188246366750741)
,p_name=>'MOVE_TO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0642\0644 \0625\0644\0649')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137104326361750714)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0641\064A \0639\0645\0644\064A\0629 \062D\0630\0641 \0639\062F\0629 \0635\0641\0648\0641: \0627\0644\0635\0641= %0\060C %1\060C %2')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103343466750714)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0644\0627 \064A\0643\0648\0646 \0645\0633\062A\062E\062F\0645 \0639\0627\0645')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051995653750699)
,p_name=>'NAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0633\0645')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117508771750718)
,p_name=>'NEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\062F\064A\062F')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081871258750708)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646\0643 \062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644 \0625\0644\0649 %0 \0645\0646 \062E\0644\0627\0644 \0627\0644\0627\0646\062A\0642\0627\0644 \0625\0644\0649:')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081919266750708)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062E\0637\0627\0631 \062D\0633\0627\0628 %0 \062C\062F\064A\062F')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210521743750748)
,p_name=>'NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127792656750722)
,p_name=>'NO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137224662514750752)
,p_name=>'NOBODY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \0623\062D\062F')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090854534750710)
,p_name=>'NOT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133784359750724)
,p_name=>'NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \062E\0627\0644\064D')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103425884750714)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\064A\0633 %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123263164750720)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0628\064A\0627\0646\0627\062A')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133274355750723)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \062A\0642\0631\064A\0631 \0642\0627\0628\0644 \0644\0644\062A\062D\062F\064A\062B. \062A\0645 \062A\062D\062F\064A\062B \0639\062F\0629 \0635\0641\0648\0641 \0648\0644\0627 \064A\0645\0643\0646 \062A\0646\0641\064A\0630 \0639\0645\0644\064A\0627\062A \0627\0644\062D\0630\0641 \0625\0644\0627 \0639\0644\0649 \0627\0644\0646\0645\0627\0630\062C \0627\0644\062C\062F\0648\0644\064A\0629 \0645\0646 \0627\0644\0646\0648\0639 "\062A\0642\0631\064A\0631 \0642\0627\0628\0644 \0644\0644\062A\062D\062F\064A\062B".')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134152568750724)
,p_name=>'OK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0648\0627\0641\0642')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129438864750722)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'ar'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137228395068750753)
,p_name=>'ORA_06550'
,p_message_language=>'ar'
,p_message_text=>unistr('ORA-06550: \0627\0644\0633\0637\0631 %0\060C \0627\0644\0639\0645\0648\062F %1')
,p_version_scn=>2704493
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179238197750738)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0646\062A \062A\0633\062A\062E\062F\0645 \0645\0633\062A\0639\0631\0636 \0648\064A\0628 \0642\062F\064A\0645\064B\0627. \0644\0644\062D\0635\0648\0644 \0639\0644\0649 \0642\0627\0626\0645\0629 \0628\0627\0644\0645\0633\062A\0639\0631\0636\0627\062A \0627\0644\0645\062F\0639\0648\0645\0629\060C \0627\0637\0644\0639 \0639\0644\0649 \062F\0644\064A\0644 \062A\062B\0628\064A\062A Oracle APEX.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074222795750705)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0637\0644\0628 \0645\062C\0645\0648\0639\0629 \063A\064A\0631 \0635\0627\0644\062D\0629 \0645\0646 \0627\0644\0635\0641\0648\0641\060C \062A\0645 \062A\0639\062F\064A\0644 \0628\064A\0627\0646\0627\062A \0645\0635\062F\0631 \0627\0644\062A\0642\0631\064A\0631.')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096206392750712)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0631\0642\0645 \0635\0641\062D\0629 \0635\0627\0644\062D\060C \0639\0644\0649 \0633\0628\064A\0644 \0627\0644\0645\062B\0627\0644 p?n=1234.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100418990750713)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0627\0644\064A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100575258750713)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062C\0645\0648\0639\0629 \0627\0644\062A\0627\0644\064A\0629')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100678777750713)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0628\0642')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137100740410750713)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\062C\0645\0648\0639\0629 \0627\0644\0633\0627\0628\0642\0629')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210438899750748)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0627\0644\062A\0642\0633\064A\0645 \0625\0644\0649 \0635\0641\062D\0627\062A')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140440975750726)
,p_name=>'PASSWORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081125447750707)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\063A\064A\064A\0631 \0643\0644\0645\0629 \0645\0631\0648\0631 %0 \0627\0644\062E\0627\0635\0629 \0628\0643.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068899331750704)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \062A\062A\0648\0627\0641\0642 \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0645\0639 \0642\0648\0627\0639\062F \0627\0644\062A\0631\0643\064A\0628 \0641\064A \0647\0630\0627 \0627\0644\0645\0648\0642\0639.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067925445750703)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\062E\062A\0644\0641 \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0627\0644\062C\062F\064A\062F\0629 \0639\0646 \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0627\0644\0642\062F\064A\0645\0629 \0628\0640 %0 \0645\0646 \0627\0644\062D\0631\0648\0641 \0639\0644\0649 \0627\0644\0623\0642\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068536552750704)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0644\0627 \062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 \0627\0633\0645 \0627\0644\0645\0633\062A\062E\062F\0645.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068778031750704)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 \0643\0644\0645\0629 \0628\0633\064A\0637\0629 \0645\062D\0638\0648\0631\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068640898750704)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0644\0627 \062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 \0627\0633\0645 \0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067876650750703)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 %0 \0645\0646 \0627\0644\062D\0631\0648\0641 \0639\0644\0649 \0627\0644\0623\0642\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068089298750703)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 \062D\0631\0641 \0623\0628\062C\062F\064A \0648\0627\062D\062F \0639\0644\0649 \0627\0644\0623\0642\0644 (%0).')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068419514750704)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 \062D\0631\0641 \0635\063A\064A\0631 \0648\0627\062D\062F \0639\0644\0649 \0627\0644\0623\0642\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068184359750703)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 \062D\0631\0641 \0631\0642\0645\064A \0648\0627\062D\062F \0639\0644\0649 \0627\0644\0623\0642\0644 (0123456789).')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068210160750704)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 \062D\0631\0641 \062A\0631\0642\064A\0645 \0648\0627\062D\062F \0639\0644\0649 \0627\0644\0623\0642\0644 (%0).')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137068306570750704)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\062D\062A\0648\064A \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0639\0644\0649 \062D\0631\0641 \0643\0628\064A\0631 \0648\0627\062D\062F \0639\0644\0649 \0627\0644\0623\0642\0644.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081624748750708)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062E\0637\0627\0631 \0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066726288750703)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645 \0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0644\0623\0646\0647 \062A\0645 \0627\0633\062A\062E\062F\0627\0645\0647\0627 \062E\0644\0627\0644 %0 \0645\0646 \0627\0644\0623\064A\0627\0645 \0627\0644\0633\0627\0628\0642\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137063475442750702)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A \0644\0644\0646\0633\0628 \0627\0644\0645\0626\0648\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155096377750730)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0646\0627\0635\0631')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137155173935750730)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0646\0635\0631')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129218433750722)
,p_name=>'PERCENT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\0633\0628\0629 \0627\0644\0645\0626\0648\064A\0629')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098549589750713)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0631\062C\0627\0621 \0627\0644\0627\062A\0635\0627\0644 \0628\0627\0644\0645\0633\0624\0648\0644.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210674128750748)
,p_name=>'PREVIOUS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0627\0628\0642')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147232757750728)
,p_name=>'PRINT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0628\0627\0639\0629')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128018381750722)
,p_name=>'PRIVILEGES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0645\062A\064A\0627\0632\0627\062A')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096641389750712)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\062C\0639 \0627\0644\0645\0646\0637\0642\0629')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117672483750718)
,p_name=>'REPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127974675750722)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\062A\0631\0629 \0627\0644\062A\0642\0631\064A\0631')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210894639750748)
,p_name=>'REPORT_LABEL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0642\0631\064A\0631: %0')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128616260750722)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062C\0645\0627\0644\064A \0627\0644\062A\0642\0631\064A\0631')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074304792750705)
,p_name=>'RESET'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0627\0644\062A\0642\0633\064A\0645 \0625\0644\0649 \0635\0641\062D\0627\062A')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103056253750714)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0627\0644\062A\0642\0633\064A\0645 \0625\0644\0649 \0635\0641\062D\0627\062A')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133112936750723)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0639\0627\062F\0629 \062A\0639\064A\064A\0646 \0643\0644\0645\0629 \0627\0644\0633\0631')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108938825750716)
,p_name=>'RESTORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\0639\0627\062F\0629')
,p_is_js_message=>true
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137142521438750726)
,p_name=>'RESULTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0646\062A\0627\0626\062C')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134234037750724)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\062C\0648\0639 \0644\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137134649050750724)
,p_name=>'RIGHT'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\064A\0646')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166636720750734)
,p_name=>'ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641 %0')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117299108750718)
,p_name=>'ROW_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\062F \0627\0644\0635\0641\0648\0641')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007074989750685)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0623\0644 Oracle')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007307861750685)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\063A\0644\0627\0642 \0627\0633\0623\0644 Oracle')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007604009750685)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0625\0639\0644\0627\0645\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007296351750685)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\062A\062D \0625\0633\0623\0644 Oracle')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007509945750685)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062E\0637\064A\0637 \0627\0644\0645\0646\062A\062C\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007416293750685)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0627\0642\062A\0631\0627\062D\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008341852750685)
,p_name=>'RW_CLEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\062D')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008239696750685)
,p_name=>'RW_CLOSE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\063A\0644\0627\0642')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008011911750685)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\0645\0632\064A\062F')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008425960750685)
,p_name=>'RW_GO_TO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0646\062A\0642\0627\0644 \0625\0644\0649')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007839497750685)
,p_name=>'RW_GP_STEP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062E\0637\0648\0629')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007919637750685)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137007756953750685)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0628\062F\064A\0644 \0639\0631\0636 \0627\0644\062E\0637\0648\0627\062A')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006866832750685)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\062E\0641\0627\0621 \0643\0644\0645\0629 \0627\0644\0633\0631')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008144346750685)
,p_name=>'RW_OPEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\062A\062D')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006655092750685)
,p_name=>'RW_ORACLE'
,p_message_language=>'ar'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137006769446750685)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0643\0644\0645\0629 \0627\0644\0633\0631')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137008515896750685)
,p_name=>'RW_START'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\062F\0627\064A\0629')
,p_is_js_message=>true
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137133665497750724)
,p_name=>'SAVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\0641\0638')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129844055750722)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0641\062A\0631\0627\0636\064A \0627\0644\0628\062F\064A\0644')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130254713750722)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0635\0641')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129705800750722)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0641\062A\0631\0627\0636\064A \0627\0644\0623\0633\0627\0633\064A')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130531413750723)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0648\0641\0631 \0623\0643\062B\0631 \0645\0646 %0 \0645\0646 \0627\0644\0635\0641\0648\0641. \0642\0645 \0628\0632\064A\0627\062F\0629 \0645\062D\062F\062F \0627\0644\0635\0641\0648\0641 \0644\0639\0631\0636 \0627\0644\0645\0632\064A\062F \0645\0646 \0627\0644\0635\0641\0648\0641.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197960936750744)
,p_name=>'SEARCH'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\062D\062B')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089439173750710)
,p_name=>'SECONDS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062B\0648\0627\0646\064D')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129339529750722)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0637\0644\0627\0639 \0639\0644\0649 \0627\0644\0645\0631\0641\0642')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137189943988750741)
,p_name=>'SELECT_ROW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062F \0635\0641')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129082029750722)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\064A\064A\0646 \0648\0636\0639 \0642\0627\0631\0626 \0627\0644\0634\0627\0634\0629 \0639\0644\0649 \0625\064A\0642\0627\0641')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129154818750722)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\064A\064A\0646 \0648\0636\0639 \0642\0627\0631\0626 \0627\0644\0634\0627\0634\0629 \0639\0644\0649 \062A\0634\063A\064A\0644')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125338906750721)
,p_name=>'SHOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191715052750742)
,p_name=>'SHOW_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0638\0647\0627\0631 \0627\0644\0643\0644')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137216518270750750)
,p_name=>'SIGN_IN'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\062C\064A\0644 \0627\0644\062F\062E\0648\0644')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167456516750734)
,p_name=>'SIGN_OUT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\062C\064A\0644 \0627\0644\062E\0631\0648\062C')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118212276750719)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0623\064A\0627\0645')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125899027750721)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0623\064A\0627\0645')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118153344750719)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125735775750721)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0633\0627\0639\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118052763750719)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125607825750721)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\062F\0642\0627\0626\0642')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118442168750719)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0634\0647\0648\0631')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126094674750721)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0634\0647\0648\0631')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126250393750721)
,p_name=>'SINCE_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0622\0646')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117993737750719)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\062B\0648\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125515754750721)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\062B\0648\0627\0646\064A')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118352052750719)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137125995373750721)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0623\0633\0627\0628\064A\0639')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137118542740750719)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0633\0646\0648\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126143168750721)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0646\0630 %0 \0645\0646 \0627\0644\0633\0646\0648\0627\062A')
,p_is_js_message=>true
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112045400750717)
,p_name=>'STANDARD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0627\0633\064A')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128987452750722)
,p_name=>'START_DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0627\0631\064A\062E \0627\0644\0628\062F\0627\064A\0629')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064173875750702)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062A\0644\0642\0649 \0631\0633\0627\0644\0629 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A \0647\0630\0647 \0645\0646 \0627\0634\062A\0631\0627\0643 \0627\0644\062A\0642\0627\0631\064A\0631 \0627\0644\062A\0641\0627\0639\0644\064A\0629 \0627\0644\0630\064A \062A\0645 \0625\0646\0634\0627\0624\0647 \0628\0648\0627\0633\0637\0629 %0.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225788464750752)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0634\062A\0631\0627\0643\0627\062A')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137175190470750736)
,p_name=>'TAB'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0644\0627\0645\0629 \0627\0644\062A\0628\0648\064A\0628')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089301442750710)
,p_name=>'TITLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0646\0648\0627\0646')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069016154750704)
,p_name=>'TODAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\064A\0648\0645')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128574579750722)
,p_name=>'TOTAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0625\062C\0645\0627\0644\064A')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070395896750704)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646 \062A\062D\062F\064A\062F %0 \0645\0646 \0627\0644\0623\0639\0645\062F\0629 \0628\062D\062F \0623\0642\0635\0649.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026166744750691)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\064A \0627\0644\0643\0644')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026770621750691)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\064A \0627\0644\0643\0644 \0623\062F\0646\0627\0647')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025792064750691)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\0633\064A\0639 \0627\0644\0643\0644')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026438112750691)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0648\0633\064A\0639 \0627\0644\0643\0644 \0623\062F\0646\0627\0647')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026949708750691)
,p_name=>'TREE.REPARENT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0639\0648\064A\0636')
,p_is_js_message=>true
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149049121750728)
,p_name=>'TREES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0634\0628\0643\0627\062A')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137191806428750742)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0637\0644\0648\0628')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137112748440750717)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\0635\062F\0642')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162932171750733)
,p_name=>'UNAVAILABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\062A\0627\062D')
,p_version_scn=>2704480
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126628295750721)
,p_name=>'UNKNOWN'
,p_message_language=>'ar'
,p_message_text=>unistr('\063A\064A\0631 \0645\0639\0631\0648\0641')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065055705750703)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0645\0635\0627\062F\0642\0629 \063A\064A\0631 \0645\0639\0631\0648\0641.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067262943750703)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0630\0627 \0644\0645 \062A\0639\062F \062A\0631\064A\062F \0627\0633\062A\0644\0627\0645 \0631\0633\0627\0626\0644 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A\060C \0641\0627\0644\0631\062C\0627\0621 \0627\0644\0646\0642\0631 \0639\0644\0649 <a href="%0">\0625\0644\063A\0627\0621 \0627\0644\0627\0634\062A\0631\0627\0643</a> \0644\0625\062F\0627\0631\0629 \0627\0634\062A\0631\0627\0643\0643.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137064030575750702)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0630\0627 \0644\0645 \062A\0639\062F \062A\0631\064A\062F \0627\0633\062A\0644\0627\0645 \0631\0633\0627\0626\0644 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A\060C \0641\0627\0644\0631\062C\0627\0621 \0627\0644\0630\0647\0627\0628 \0625\0644\0649 \0631\0627\0628\0637 URL \0627\0644\062A\0627\0644\064A \0644\0625\062F\0627\0631\0629 \0627\0634\062A\0631\0627\0643\0643:')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137103524701750714)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A \063A\064A\0631 \0645\062F\0639\0648\0645')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090660725750710)
,p_name=>'UPDATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062B')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089287456750710)
,p_name=>'UPDATED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\062A\062D\062F\064A\062B')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032412246750693)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0631\0642\064A\0629 \0642\064A\062F \0627\0644\062A\0642\062F\0645')
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137032760474750693)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062A\0645 \062A\0631\0642\064A\0629 Oracle APEX \0625\0644\0649 \0625\0635\062F\0627\0631 \0623\062D\062F\062B. \0633\062A\0633\062A\063A\0631\0642 \0647\0630\0647 \0627\0644\0639\0645\0644\064A\0629 \0639\0645\0648\0645\064B\0627 \0645\0627 \064A\0635\0644 \0625\0644\0649 3 \062F\0642\0627\0626\0642.')
,p_version_scn=>2704459
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096061323750712)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062D\0638\0631 \0631\0627\0628\0637 URL \0627\0644\0645\0637\0644\0648\0628. \0627\062A\0635\0644 \0628\0627\0644\0645\0633\0624\0648\0644 \0644\062F\064A\0643.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137117126368750718)
,p_name=>'USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0633\062A\062E\062F\0645')
,p_version_scn=>2704473
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140385329750726)
,p_name=>'USERNAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\0645\0633\062A\062E\062F\0645')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181748847750739)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\0645\0633\062A\062E\062F\0645 \0637\0648\064A\0644 \0644\0644\063A\0627\064A\0629. \0627\0644\062D\062F \0647\0648 %0 \0645\0646 \0627\0644\062D\0631\0648\0641.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124245390750721)
,p_name=>'USERS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0633\062A\062E\062F\0645\0648\0646')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137181345047750739)
,p_name=>'USER_EXISTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\0645\0633\062A\062E\062F\0645 \0645\0648\062C\0648\062F \0628\0627\0644\0641\0639\0644.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137195130021750743)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\0648\0631\0629 \0645\0644\0641 \062A\0639\0631\064A\0641 \0627\0644\0645\0633\062A\062E\062F\0645 %0')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057041086750700)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0634\063A\064A\0644 \0627\0644\062A\0644\0642\0627\0626\064A - %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055525378750700)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\0641\062D\0629 %0 - %1 ')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058495089750701)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'ar'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137058508339750701)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'ar'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057417410750700)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0643\0648\064A\0646 \0627\0644\0628\062D\062B - %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057335803750700)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645 \0627\0644\062F\064A\0646\0627\0645\064A\0643\064A\0629 \0627\0644\0645\0634\062A\0631\0643\0629 - %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137057120356750700)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0631\064A\0641 \0627\0644\0645\0647\0645\0629 - %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055643276750700)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\064A\0631 \0627\0644\0639\0645\0644 - %0 ')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077743630750706)
,p_name=>'VALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\0627\0644\062D')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069396539750704)
,p_name=>'VALIDATIONS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0644\064A\0627\062A \0627\0644\062A\062F\0642\064A\0642')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130016093750722)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0627\0644\0642\064A\0645\0629')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176374439750737)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0642\064A\0645\0629 %0')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098946185750713)
,p_name=>'VERTICAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0623\0633\064A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090540484750710)
,p_name=>'VIEW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124311970750721)
,p_name=>'VIEWS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0637\0631\0642 \0627\0644\0639\0631\0636')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130836180750723)
,p_name=>'VIEW_ALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\0643\0644')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070792607750704)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0631\062A\0628\0627\0637 \0645\062E\0641\064A \0645\0631\0626\064A\064B\0627')
,p_is_js_message=>true
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137111542529750717)
,p_name=>'WARNING'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0630\064A\0631')
,p_is_js_message=>true
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090152069750710)
,p_name=>'WEEK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0628\0648\0639')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086050605750709)
,p_name=>'WEEKLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0628\0648\0639\064A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090263088750710)
,p_name=>'WEEKS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0633\0627\0628\064A\0639')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137130122990750722)
,p_name=>'WELCOME_USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\062D\0628\064B\0627: %0')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128356267750722)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0642\064A\0645\0629 \063A\064A\0631 \0635\0627\0644\062D\0629\060C \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\0645\0642\062F\0645\0629.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128403629750722)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0642\064A\0645\0629 \063A\064A\0631 \0635\0627\0644\062D\0629\060C \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\0645\0642\062F\0645\0629.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066232656750703)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0642\064A\0645\0629 \0628\064A\0627\0646\0627\062A \063A\064A\0631 \0635\0627\0644\062D\0629\060C \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \0635\064A\063A\0629 \0627\0644\062A\0627\0631\064A\062E.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137128247318750722)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0642\064A\0645\0629 \0631\0642\0645\064A\0629 \063A\064A\0631 \0635\0627\0644\062D\0629\060C \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \0627\0644\0635\064A\063A\0629 \0627\0644\0631\0642\0645\064A\0629.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077398292750706)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0642\064A\0645\0629 \0637\0627\0628\0639 \0632\0645\0646\064A \063A\064A\0631 \0635\0627\0644\062D\0629\060C \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \0635\064A\063A\0629 \0627\0644\0637\0627\0628\0639 \0627\0644\0632\0645\0646\064A.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137101851721750714)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0631\0628\0637 "%0". \0627\0633\062A\062E\062F\0645 \0639\0644\0627\0645\0627\062A \0627\0644\0627\0642\062A\0628\0627\0633 \0627\0644\0645\0632\062F\0648\062C\0629 \0644\0644\0639\0646\0627\0635\0631 \0648\062D\062F\0627\062A \0628\0627\064A\062A \0645\062A\0639\062F\062F\0629\060C \0623\0648 \062A\062D\0642\0642 \0645\0646 \0623\0646 \0637\0648\0644 \0627\0644\0639\0646\0635\0631 30 \0628\0627\064A\062A \0623\0648 \0623\0642\0644. \0627\0633\062A\062E\062F\0645 \0635\064A\0627\063A\0629 v() \0644\0644\0625\0634\0627\0631\0629 \0625\0644\0649 \0627\0644\0639\0646\0627\0635\0631 \0627\0644\0623\0637\0648\0644 \0645\0646 30 \0628\0627\064A\062A.')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091647989750711)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0631\0641\0636 \0627\0644\0648\0635\0648\0644 \0628\0648\0627\0633\0637\0629 \0627\0644\0641\062D\0635 \0627\0644\0623\0645\0646\064A %0')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094187192750711)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0637\0628\064A\0642 \063A\064A\0631 \0645\062A\0648\0641\0631')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092503448750711)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092668273750711)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062A\0637\0628\064A\0642=%0 \0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644=%1')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093088477750711)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642 \0645\062D\0638\0648\0631\060C \0627\0644\0631\062C\0627\0621 \0625\0639\0627\062F\0629 \0627\0644\0645\062D\0627\0648\0644\0629 \0644\0627\062D\0642\064B\0627.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092908391750711)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0648\0635\0648\0644 \0625\0644\0649 \0647\0630\0627 \0627\0644\062A\0637\0628\064A\0642 \0645\062D\0638\0648\0631 \0644\0645\0637\0648\0631\064A \0627\0644\062A\0637\0628\064A\0642\060C \0627\0644\0631\062C\0627\0621 \0625\0639\0627\062F\0629 \0627\0644\0645\062D\0627\0648\0644\0629 \0644\0627\062D\0642\064B\0627.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092170384750711)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-7744 \062A\0639\0630\0631\062A \0645\0639\0627\0644\062C\0629 \0631\0627\0628\0637 URL \0639\0648\062F\0629 \0627\0644\0641\0631\0639 \0625\0644\0649 \0627\0644\0648\0638\064A\0641\0629.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092017256750711)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-7744 \062A\0639\0630\0631\062A \0645\0639\0627\0644\062C\0629 \0635\0641\062D\0629 \0639\0648\062F\0629 \0627\0644\0641\0631\0639 \0625\0644\0649 \0627\0644\0648\0638\064A\0641\0629.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092392439750711)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1430 \0639\0645\0644\064A\0629 \0627\0644\0627\0633\062A\062F\0639\0627\0621 \0644\0644\0639\0631\0636 \0645\0646 \0627\0644\0635\0641\062D\0629 \063A\064A\0631 \0645\062F\0639\0648\0645\0629: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093402504750711)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1018 \062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0645\0633\062D \0630\0627\0643\0631\0629 \0627\0644\062A\062E\0632\064A\0646 \0627\0644\0645\0624\0642\062A \0644\0644\062E\0637\0648\0629.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091869919750711)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1005 \0646\0648\0639 \0627\0644\062D\0633\0627\0628 \063A\064A\0631 \0645\0639\0631\0648\0641.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092762571750711)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1201 \0644\0645 \064A\062A\0645 \062A\0639\064A\064A\0646 \0645\0639\0631\0641 \0627\0644\062C\0644\0633\0629 \0641\064A \0627\0644\0645\0635\0627\062F\0642\0629 \0627\0644\0645\062E\0635\0635\0629.-')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092877463750711)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641\062D\0629=%0')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092481550750711)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-7620 \062A\0639\0630\0631 \062A\062D\062F\064A\062F \0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644 \0644\0644\062A\0637\0628\064A\0642 (%0).')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137072995880750705)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0631\064A\0631')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091514403750711)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1802 \062A\0639\0630\0631 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0645\0639\0631\0641 \0627\0644\0639\0646\0635\0631 "%0"')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091252109750710)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1002 \062A\0639\0630\0631 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0645\0639\0631\0641 \0627\0644\0639\0646\0635\0631 \0627\0644\062E\0627\0635 \0628\0627\0644\0639\0646\0635\0631"%0" \0641\064A \0627\0644\062A\0637\0628\064A\0642 "%1".')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091305728750710)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \063A\064A\0631 \0645\062A\0648\0642\0639\060C \062A\0639\0630\0631 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0633\0645 \0627\0644\0639\0646\0635\0631 \0639\0644\0649 \0645\0633\062A\0648\0649 \0627\0644\0635\0641\062D\0629 \0623\0648 \0627\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091706119750711)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\0646\062A \0628\0627\0644\0641\0639\0644 \0641\064A \0627\0644\0635\0641\062D\0629 \0627\0644\0623\0648\0644\0649 \0645\0646 \0627\0644\0628\064A\0627\0646\0627\062A.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108265925750716)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0641 \0627\0644\0639\0646\0635\0631 (%0) \0644\064A\0633 \0639\0646\0635\0631\064B\0627 \0645\0639\0631\0641\064B\0627 \0641\064A \0627\0644\0635\0641\062D\0629 \0627\0644\062D\0627\0644\064A\0629.')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065874852750703)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\0639\064A\064A\0646 \0627\0644\0639\0646\0635\0631 \0628\0648\0627\0633\0637\0629 \062A\0645\0631\064A\0631 \0627\0644\0648\0633\064A\0637\0627\062A \0625\0644\0649 \0627\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066107602750703)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'ar'
,p_message_text=>unistr('(\0644\0645 \064A\062A\0645 \062A\0648\0641\064A\0631 \062A\062F\0642\064A\0642 \0627\0644\0645\062C\0645\0648\0639)')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065646373750703)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646 \062A\0639\064A\064A\0646 \0627\0644\0639\0646\0635\0631 \0639\0646\062F\0645\0627 \064A\0643\0648\0646 \0645\0635\062D\0648\0628\064B\0627 \0628\062A\062F\0642\064A\0642 \0627\0644\0645\062C\0645\0648\0639 "\0639\0644\0627\0645\0629 \0645\0633\062A\0648\0649 \0627\0644\062A\0637\0628\064A\0642".')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065562547750703)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646 \062A\0639\064A\064A\0646 \0627\0644\0639\0646\0635\0631 \0639\0646\062F\0645\0627 \064A\0643\0648\0646 \0645\0635\062D\0648\0628\064B\0627 \0628\062A\062F\0642\064A\0642 \0627\0644\0645\062C\0645\0648\0639 "\0639\0644\0627\0645\0629 \0645\0633\062A\0648\0649 \0627\0644\062A\0637\0628\064A\0642".')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065761535750703)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646 \062A\0639\064A\064A\0646 \0627\0644\0639\0646\0635\0631 \0639\0646\062F\0645\0627 \064A\0643\0648\0646 \0645\0635\062D\0648\0628\064B\0627 \0628\062A\062F\0642\064A\0642 \0627\0644\0645\062C\0645\0648\0639 "\062C\0644\0633\0629".')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065433718750703)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0646\0635\0631 \0628\0644\0627 \062D\0645\0627\064A\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093562628750711)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \062A\062A\0648\0641\0631 \0635\0641\062D\0629 \062A\0639\0644\064A\0645\0627\062A.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137081433755750708)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644 %0 \0644\064A\0633 \0644\062F\064A\0647\0627 \0623\064A \0627\0645\062A\064A\0627\0632\0627\062A \0644\062A\062D\0644\064A\0644 \0627\0644\0645\062E\0637\0637 %1 \0644\063A\0648\064A\064B\0627.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091917881750711)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1010 \062A\0645 \062A\062C\0627\0648\0632 \062D\062F \062A\0643\0631\0627\0631 \0645\0639\0627\0644\062C\0629 \0642\0628\0648\0644 \0627\0644\0641\0631\0639 \0625\0644\0649 \0627\0644\0635\0641\062D\0629. %0')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137048460143750697)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641\062D\0629 \063A\064A\0631 \0645\062A\0627\062D\0629\060C \0644\0627 \064A\0645\0643\0646\0643 \062A\0634\063A\064A\0644 \0646\0645\0637 \0627\0644\0635\0641\062D\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066009450750703)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0633\062A\062F\0639\0627\0621 \0647\0630\0647 \0627\0644\0635\0641\062D\0629 \0628\0627\0633\062A\062E\062F\0627\0645 \0631\0627\0628\0637 URL \0623\0648 \0628\0627\0633\062A\062E\062F\0627\0645 GET \0623\0648 POST \0625\0644\0649 \0625\062C\0631\0627\0621 \0627\0644\0639\0631\0636\060C \064A\062C\0628 \0627\0633\062A\062F\0639\0627\0621 \0646\0648\0639 \0627\0644\0641\0631\0639 "\0627\0644\0641\0631\0639 \0625\0644\0649 \0627\0644\0635\0641\062D\0629".')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137150823272750729)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0639\0646\062F \0645\062D\0627\0648\0644\0629 \062D\0641\0638 \0642\064A\0645\0629 \063A\064A\0631 \0631\0642\0645\064A\0629 \0641\064A \0627\0644\0639\0646\0635\0631 %0. ')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083156302750708)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062E\0637\0637 \0627\0644\062A\062D\0644\064A\0644 \0627\0644\0644\063A\0648\064A \0644\0644\062A\0637\0628\064A\0642 "%0" \063A\064A\0631 \0645\0648\062C\0648\062F \0641\064A \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083277854750708)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645 \0627\0644\062D\0633\0627\0628\0627\062A \0641\064A \0645\0633\0627\062D\0629 \0639\0645\0644 INTERNAL \0625\0644\0627 \0644\0645\0639\0627\0644\062C\0629 &PRODUCT_NAME. <a href="%0">\0627\0644\062E\062F\0645\0627\062A \0627\0644\0625\062F\0627\0631\064A\0629</a>.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091118820750710)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-1029 \062A\0639\0630\0631 \062A\062E\0632\064A\0646 \0645\0639\0644\0648\0645\0627\062A \0627\0644\062C\0644\0633\0629.  \0627\0644\062C\0644\0633\0629=%0 \0627\0644\0639\0646\0635\0631=%1')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094200070750711)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0625\064A\0642\0627\0641 \0627\0644\062A\062A\0628\0639: %0')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137091467909750711)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623 \063A\064A\0631 \0645\062A\0648\0642\0639')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102264079750714)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \062E\0637\0623 \0641\064A update_substitution_cache: %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094311409750711)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0625\062F\062E\0627\0644 \0627\0644\062A\0637\0628\064A\0642 \0648\0627\0644\0635\0641\062D\0629 \0644\0639\0631\0636 \0627\0644\062A\0639\0644\064A\0645\0627\062A.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137116039106750718)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0644\062A\0634\063A\064A\0644 \0627\0644\062A\0644\0642\0627\0626\064A.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051507375750698)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623 \0641\064A \0627\0633\062A\0639\0644\0627\0645 \0627\0644\062A\0634\063A\064A\0644 \0627\0644\062A\0644\0642\0627\0626\064A: %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095410217750712)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0634\0637\0628 %0 \0645\0646 \0627\0644\062C\0644\0633\0627\062A.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036750845750694)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \062A\0646\0641\064A\0630 \0627\0644\0631\0645\0632 %0! \0647\0648 \063A\064A\0631 \0645\062F\0639\0648\0645 \0628\0648\0627\0633\0637\0629 \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0623\0648 \063A\064A\0631 \0645\0645\0643\0646 \0628\0648\0627\0633\0637\0629 \0645\0639\0644\0645\0629 \0627\0644\0645\062B\064A\0644 MLE_LANGUAGES.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137034343215750693)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\0631\0646\0627\0645\062C \0627\0644\062A\0634\063A\064A\0644 \0645\062A\0639\062F\062F \0627\0644\0644\063A\0627\062A \063A\064A\0631 \0645\062A\0648\0641\0631 \0641\064A \0646\0633\062E\0629 \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0647\0630\0647!')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073572072750705)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0644\0627 \064A\0643\0648\0646 \0635\0641\064A\0641 \0645\062C\0645\0648\0639\0629 \0627\0644\062A\0637\0628\064A\0642 \0641\0627\0631\063A\064B\0627')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073366410750705)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0642\0645 \0633\0645\0629 \0627\0644\0639\0636\0648 \0627\0644\0645\062D\062F\062F %0 \063A\064A\0631 \0635\0627\0644\062D.  \064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0631\0642\0645 \0627\0644\0633\0645\0629 \0628\064A\0646 1 \0648%1')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073861734750705)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062C\0645\0648\0639\0629 \0627\0644\062A\0637\0628\064A\0642 \0645\0648\062C\0648\062F\0629')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073639532750705)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0623\0646 \064A\0643\0648\0646 \0627\0633\0645 \0627\0644\0645\062C\0645\0648\0639\0629 \0641\0627\0631\063A\064B\0627')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073760511750705)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0623\0646 \064A\0632\064A\062F \0627\0633\0645 \0627\0644\0645\062C\0645\0648\0639\0629 \0639\0646 255 \062D\0631\0641\064B\0627')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073103293750705)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062C\0645\0648\0639\0629 \0627\0644\062A\0637\0628\064A\0642 %0 \063A\064A\0631 \0645\0648\062C\0648\062F\0629')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073991336750705)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062E\0644\064A\0629 \0644\064A\0633\062A \0645\0641\062A\0648\062D\0629 \0628\0639\062F')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073245462750705)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\062A\0633\0644\0633\0644 \0627\0644\0639\0636\0648 %0 \063A\064A\0631 \0645\0648\062C\0648\062F \0641\064A \0645\062C\0645\0648\0639\0629 \0627\0644\062A\0637\0628\064A\0642 %1'),
''))
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137073451609750705)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0633\0644\0633\0644 \0627\0644\0639\0636\0648 %0 \063A\064A\0631 \0645\0648\062C\0648\062F \0641\064A \0645\062C\0645\0648\0639\0629 \0627\0644\062A\0637\0628\064A\0642 "%1"')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137026287908750691)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062E\0648\0627\0631\0632\0645\064A\0629 %0 \063A\064A\0631 \0645\062F\0639\0648\0645\0629 \0644\0640 ECDSA.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137025972101750691)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\0637\0639 \0627\0644\0646\0627\0642\0635 %0 \063A\064A\0631 \0645\062F\0639\0648\0645.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151643082750729)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0638\064A\0641\0629 \0627\0644\062A\0634\0641\064A\0631 "%0" \063A\064A\0631 \0645\062F\0639\0648\0645\0629 \0641\064A \0647\0630\0627 \0627\0644\0646\0638\0627\0645.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137203936238750746)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\062E\062A\0628\0627\0631 \0625\0645\0643\0627\0646\064A\0629 \0627\0644\0648\0635\0648\0644')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094919633750712)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\063A\0644\0627\0642')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095009077750712)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\064A\0627\0631\0627\062A \062A\062E\0635\064A\0635 \0627\0644\0635\0641\062D\0629')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095136762750712)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0641\062A\0631\0627\0636\064A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095295731750712)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0648\0636')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095371883750712)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062E\0641\064A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094785087750712)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062F \0627\0644\0645\0646\0627\0637\0642 \0627\0644\062A\064A \062A\0631\064A\062F \062A\0636\0645\064A\0646\0647\0627 \0641\064A \0647\0630\0647 \0627\0644\0635\0641\062D\0629. \0642\062F \0644\0627 \064A\062A\0645 \0639\0631\0636 \0627\0644\0645\0646\0627\0637\0642 \0627\0644\0645\062D\062F\062F\0629 \0625\0630\0627 \0644\0645 \062A\0643\0646 \0641\064A \0633\064A\0627\0642 \0627\0644\062A\0637\0628\064A\0642 \0627\0644\0635\062D\064A\062D \0623\0648 \0644\064A\0633\062A \0644\062F\064A\0643 \0627\0644\0627\0645\062A\064A\0627\0632\0627\062A \0627\0644\0635\062D\064A\062D\0629.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094860318750712)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'ar'
,p_message_text=>unistr('\0647\0630\0647 \0627\0644\0635\0641\062D\0629 \063A\064A\0631 \0642\0627\0628\0644\0629 \0644\0644\062A\062E\0635\064A\0635.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204224038750746)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0645\0643\0646\0643 \062A\062E\0635\064A\0635 \0647\064A\0626\0629 \0627\0644\062A\0637\0628\064A\0642 \0645\0646 \062E\0644\0627\0644 \062A\063A\064A\064A\0631 \0623\0633\0644\0648\0628 \0627\0644\0633\0645\0629. \0627\0644\0631\062C\0627\0621 \062A\062D\062F\064A\062F \0623\0633\0644\0648\0628 \0633\0645\0629 \0645\0646 \0627\0644\0642\0627\0626\0645\0629 \0623\062F\0646\0627\0647 \0648\0627\0644\0646\0642\0631 \0639\0644\0649 "\062A\0637\0628\064A\0642 \0627\0644\062A\063A\064A\064A\0631\0627\062A".')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137205079905750746)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0631\0636 \0627\0644\0645\0646\0637\0642\0629')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204100397750746)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\062E\062F\0627\0645 \0627\0644\0623\0633\0644\0648\0628 \0627\0644\0627\0641\062A\0631\0627\0636\064A \0644\0644\062A\0637\0628\064A\0642')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137204052112750746)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0647\064A\0626\0629 ')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148200346750728)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0624\0634\0631 \0627\0644\0639\0645\0648\062F \0627\0644\0645\0634\0627\0631 \0625\0644\064A\0647 \0641\064A %0 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040926061750695)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0625\0644\062D\0627\0642 \062A\0635\062F\064A\0631 \0627\0644\0628\064A\0627\0646\0627\062A \063A\064A\0631 \0645\062F\0639\0648\0645 \0644\062A\0646\0633\064A\0642 %0.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137003920428750684)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062E\0631\062C\0627\062A CLOB \063A\064A\0631 \0645\062F\0639\0648\0645\0629 \0644\0635\064A\063A\0629 %0.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147966808750728)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0641\0627\0635\0644 \0627\0644\0639\0645\0648\062F \0641\064A \0628\062F\0627\064A\0629 \0635\0641\064A\0641 \0627\0644\0623\0639\0645\062F\0629.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148098674750728)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0624\0634\0631 \0645\062C\0645\0648\0639\0629 \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\0634\0627\0631 \0625\0644\064A\0647 \0641\064A %0 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137055178609750700)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0635\062F\064A\0631')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137062342935750702)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0623\0646 \062A\0643\0648\0646 \0635\064A\063A\0629 \0627\0644\062A\0635\062F\064A\0631 XML \0628\0627\0633\062A\062E\062F\0627\0645 ORDS \0643\062E\0627\062F\0645 \0637\0628\0627\0639\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148304330750728)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0624\0634\0631 \0627\0644\0639\0645\0648\062F \0627\0644\0645\0634\0627\0631 \0625\0644\064A\0647 \0641\064A \0627\0644\062A\0645\064A\064A\0632 %0 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137051779577750699)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0635\064A\063A\0629 \0627\0644\062A\0635\062F\064A\0631 \063A\064A\0631 \0635\0627\0644\062D\0629: %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137148125778750728)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0624\0634\0631 \0627\0644\0645\062C\0645\0648\0639\0629 \0627\0644\0631\0626\064A\0633\064A\0629 \0627\0644\0645\0634\0627\0631 \0625\0644\064A\0647 \0641\064A %0 \063A\064A\0631 \0645\0648\062C\0648\062F.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173328593750736)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F %1 \0641\064A \0627\0644\062C\062F\0648\0644 %0 \0639\0645\0648\062F \0628\0627\0644\0647\0648\064A\0629 "GENERATED ALWAYS". \0627\0644\0631\062C\0627\0621 \0627\0644\062A\0623\0643\062F \0645\0646 \0639\062F\0645 \062A\0639\064A\064A\0646 \0639\0645\0648\062F \0645\0635\062F\0631 \0644\0639\0645\0648\062F %1 \0641\064A \0645\0631\0628\0639 \062D\0648\0627\0631 \0627\0644\062A\0643\0648\064A\0646.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137084910831750709)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0627\0635\0644 \0627\0644\0627\0644\062A\0632\0627\0645 \0627\0644\0645\062D\062F\062F \0642\0644\064A\0644 \0644\0644\063A\0627\064A\0629.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085038917750709)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\0642\062F\064A\0645 \0623\0639\0645\062F\0629 \0644\062A\062D\0645\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086342849750709)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0623\0639\0645\062F\0629 \0644\0645\062D\062F\062F \0627\0644\0635\0641\0648\0641 "%0". \062C\0631\0628 \0627\0644\0627\0643\062A\0634\0627\0641 \0627\0644\062A\0644\0642\0627\0626\064A \0623\0648 \0631\0627\062C\0639 \0647\064A\0643\0644 JSON.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095797176750712)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0623\0648\0631\0627\0642 \0639\0645\0644 \0641\064A \0645\0644\0641 XLSX.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040881117750695)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062A\062C\0627\0648\0632 \0645\0633\062A\0648\064A\0627\062A \0627\0644\062A\062F\0631\062C \0627\0644\0647\0631\0645\064A \0627\0644\0645\0637\0644\0648\0628\0629 \0644\0627\0643\062A\0634\0627\0641 (%0) \0627\0644\062D\062F \0627\0644\0623\0642\0635\0649 \0627\0644\0628\0627\0644\063A %1.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095606694750712)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0631\0642\0649 \0627\0644\0639\0645\0644 \0627\0644\0645\062D\062F\062F\0629 \063A\064A\0631 \0645\0648\062C\0648\062F\0629 \0641\064A \0645\0644\0641 XLSX.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137074062766750705)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\063A\064A\0631\062A \0646\0633\062E\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\062D\0627\0644\064A\0629 \0641\064A \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0644\0623\0646 \0627\0644\0645\0633\062A\062E\062F\0645 \0628\062F\0623 \0639\0645\0644\064A\0629 \062A\062D\062F\064A\062B.')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076923659750706)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\062D\062F\064A\062B \0623\0639\0645\062F\0629 \0627\0644\062A\0642\0631\064A\0631: %0')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187437128750740)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \062A\062D\0648\064A\0644 %0 \0625\0644\0649 SDO_GEOMETRY.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123917080750720)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\0648\064A\0644 \0627\0644\0639\0645\0648\062F  %0 \0645\0646 \0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A %1 \0625\0644\0649 VARCHAR2!')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131380117750723)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0644\0639\0645\0648\062F "%0" \0627\0644\0645\062D\062F\062F \0644\0644\0633\0645\0629 "%1" \0641\064A \0645\0635\062F\0631 \0627\0644\0628\064A\0627\0646\0627\062A!')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067448340750703)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0645\0631\0634\062D %0 \063A\064A\0631 \0645\062F\0639\0648\0645 \0644\0644\0623\0639\0645\062F\0629 \0645\062A\0639\062F\062F\0629 \0627\0644\0642\064A\0645.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190960666750742)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0631\0634\062D "\0628\064A\0646" \063A\064A\0631 \0635\0627\0644\062D.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137046517178750697)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0642\064A\0645\0629 %2 \0641\064A \0627\0644\0639\0645\0648\062F %0\060C \0627\0644\0635\0641 #%1.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137043287791750696)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F %0 \0623\0648 \0627\0644\0635\0641 #%1 \063A\064A\0631 \0645\0648\062C\0648\062F\064A\0646.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029806545750692)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645 \0627\0644\0645\062D\062F\062F\0629 \063A\064A\0631 \0635\0627\0644\062D\0629.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029739888750692)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0633\062A\0639\0644\0627\0645 \063A\064A\0631 \0635\0627\0644\062D. \064A\062C\0628 \0623\0646 \064A\0643\0648\0646 \0646\0648\0639 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \062C\062F\0648\0644 \0623\0648 \0627\0633\062A\0639\0644\0627\0645 SQL \0623\0648 \062F\0627\0644\0629 PL/SQL \062A\064F\0631\062C\0639 \0627\0633\062A\0639\0644\0627\0645 SQL.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137124024524750720)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0641\0634\0644 \062A\062D\0644\064A\0644 \0627\0633\062A\0639\0644\0627\0645 SQL \0644\063A\0648\064A\064B\0627!'),
'%0'))
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131473123750723)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0648\0636\0639 \0627\0644\0639\0645\0648\062F \0627\0644\0645\062D\062F\062F %0 \0644\0644\0633\0645\0629 "%1" \0641\064A \0639\0628\0627\0631\0629 SQL!')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137021435362750689)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0633\062A\062E\062F\0627\0645 \0627\0644\0643\062B\064A\0631 \0644\0644\063A\0627\064A\0629 \0645\0646 \0627\0644\0639\0646\0627\0635\0631 \0641\064A \0645\0631\0634\062D \0627\0644\0642\064A\0645\0629.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137131234789750723)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\062D\062F\064A\062F \0639\0645\0648\062F \0644\0644\0633\0645\0629 "%0".')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029697196750692)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\0631\062C\0639 \0646\0635 \062F\0627\0644\0629 PL/SQL \0642\064A\0645\0629.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137147027187750728)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A \0645\0635\062F\0631 \0628\064A\0627\0646\0627\062A REST \0639\0644\0649 \0639\0645\0644\064A\0629 \0644\0645\0639\0627\0644\062C\0629 \0625\062C\0631\0627\0621 DML \0627\0644\0645\0637\0644\0648\0628.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188789536750741)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062A\0645 \062F\0639\0645 \0645\0631\0634\062D\0627\062A \0627\0644\0646\0637\0627\0642 \0625\0644\0627 \0644\0623\0646\0648\0627\0639 \0627\0644\0628\064A\0627\0646\0627\062A NUMBER \0623\0648 DATE \0623\0648 TIMESTAMP.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137009651351750686)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \0627\0644\0637\0644\0628 \0645\0639 \0638\0647\0648\0631 %0')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137013138634750687)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0648\064A\0644 GeoJSON \0625\0644\0649 SDO_GEOMETRY (\0627\0644\0639\0645\0648\062F %0) \063A\064A\0631 \0645\062A\0648\0641\0631 \0641\064A \0645\062C\0645\0648\0639\0629 \0627\0644\0628\064A\0627\0646\0627\062A \0647\0630\0647.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016504409750688)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\0648\064A\0644 SDO_GEOMETRY (\0627\0644\0639\0645\0648\062F %0) \063A\064A\0631 \0645\062F\0639\0648\0645 \0644\0645\0635\0627\062F\0631 \0628\064A\0627\0646\0627\062A XML.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137040679442750695)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\0631\0641 %0 \063A\064A\0631 \0645\062F\0639\0648\0645 \0643\0641\0627\0635\0644 \0645\062A\0639\062F\062F \0627\0644\0642\064A\0645.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137188848159750741)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645 \0647\0630\0647 \0627\0644\0648\0638\064A\0641\0629 \0641\064A \0633\064A\0627\0642 \0627\0644\0627\0633\062A\0639\0644\0627\0645.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137016622338750688)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\0645 \062A\0637\0627\0628\0642 \0646\0648\0639 \0628\064A\0627\0646\0627\062A \0627\0644\0639\0645\0648\062F.')
,p_version_scn=>2704456
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137050158258750698)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062F\0639\0645 \0645\0635\062F\0631 \0627\0644\0628\064A\0627\0646\0627\062A \0647\0630\0627 \0625\062C\0631\0627\0621 \062A\063A\064A\064A\0631 \0639\0644\0649 \0639\062F\0629 \0635\0641\0648\0641.')
,p_version_scn=>2704462
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029584144750692)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062C\0627\0648\0632 \062D\062F\0648\062F \0631\0628\0637 ORDS OUT \0627\0644\062F\0627\062E\0644\064A\0629. \0627\0644\0631\062C\0627\0621 \062A\0642\0644\064A\0644 \0643\0645\064A\0629 \0635\0641\0648\0641 DML.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132298690750723)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\062A\0639\0630\0631 \062A\062D\0644\064A\0644 \0627\0633\062A\062C\0627\0628\0629 JSON \0645\0646 \0627\0644\062E\0627\062F\0645 \0627\0644\0628\0639\064A\062F \0644\063A\0648\064A\064B\0627: '),
'%0'))
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137029463957750692)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0633\064A\0627\0642 \062E\0637\0623 \0623\0648 \063A\064A\0631 \0645\0639\0631\0648\0641.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137053513093750699)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0645\0643\0648\0646\0627\062A \063A\064A\0631 \0627\0644\0645\062F\0639\0648\0645\0629 \0644\0644\062A\0635\062F\064A\0631 \0627\0644\0642\0627\0628\0644 \0644\0644\0642\0631\0627\0621\0629: %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137151511151750729)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0648\0639 \0627\0644\0645\0644\0641 \0647\0630\0627 \063A\064A\0631 \0645\062F\0639\0648\0645 \0628\0648\0627\0633\0637\0629 \0627\0644\0645\062D\0644\0644 \0627\0644\0644\063A\0648\064A.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102347732750714)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0635\0648\0644 \063A\064A\0631 \0645\0635\062F\0642 (\0644\0645 \064A\062A\0645 \062A\0639\064A\064A\0646 wwv_flow_api.set_credentials).')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077219742750706)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\0643\0648\064A\0646 \0645\0633\0627\062D\0629 \0627\0644\0639\0645\0644 \0644\0623\0646\0647\0627 \0645\0648\062C\0648\062F\0629 \0628\0627\0644\0641\0639\0644.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137077152796750706)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\0643\0648\064A\0646 \0645\062C\0645\0648\0639\0629 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646 \0644\0623\0646\0647\0627 \0645\0648\062C\0648\062F\0629 \0628\0627\0644\0641\0639\0644.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088534077750710)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0633\0645 \0645\0633\062A\062E\062F\0645 \0645\0643\0631\0631 \0644\0640 %0.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088600802750710)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\062D\0645\064A\0644 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646. \0641\0634\0644 \0639\0646\062F \0627\0644\0645\0633\062A\062E\062F\0645 %0.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099458473750713)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0627\0646 \0633\064A\062A\0645 \062A\062D\0645\064A\0644 %0 \0645\0646 \0627\0644\0645\0633\062A\062E\062F\0645\064A\0646.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099256853750713)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099388735750713)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0645\062A\064A\0627\0632\0627\062A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099092877750713)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\0645 \0627\0644\0645\0633\062A\062E\062F\0645')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179470883750738)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0639\0631\0636 \0639\0646\0635\0631 \0627\0644\0635\0641\062D\0629 #COMPONENT_NAME#.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094416273750711)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0639\0631\0636 \0639\0646\0635\0631 \0627\0644\0635\0641\062D\0629 \0644\0623\0646\0647 \0644\0645 \064A\062A\0645 \0641\062A\062D \0646\0645\0648\0630\062C HTML \0628\0639\062F.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137052809649750699)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062D\0633\0627\0628 \0627\0644\0642\064A\0645\0629 \0627\0644\0627\0641\062A\0631\0627\0636\064A\0629 \0644\0639\0646\0635\0631 \0627\0644\0635\0641\062D\0629 #COMPONENT_NAME#.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093701618750711)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0641\064A \0627\0644\062D\0633\0627\0628 \0627\0644\0644\0627\062D\0642 \0644\0639\0646\0635\0631 \0627\0644\0635\0641\062D\0629 #COMPONENT_NAME#.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093652563750711)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062D\0633\0627\0628 \0642\064A\0645\0629 \0645\0635\062F\0631 \0627\0644\0639\0646\0635\0631 \0644\0639\0646\0635\0631 \0627\0644\0635\0641\062D\0629 #COMPONENT_NAME#.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070485624750704)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0648\0635\0648\0644 \063A\064A\0631 \0645\0639\062A\0645\062F.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019940548750689)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629 %0 \0645\0646 %1 \0644\064A\0633\062A \0635\0641\064A\0641 JSON \0635\0627\0644\062D.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093996366750711)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062C\0627\0641\0627 \0633\0643\0631\0628\062A \063A\064A\0631 \0645\062F\0639\0648\0645\0629.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094032254750711)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094651609750711)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0628\062F\0621 \0627\0644\0627\0633\062A\0639\0644\0627\0645.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102655916750714)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\062D\062F\064A\062B %0 \063A\064A\0631 \0645\062F\0639\0648\0645.')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137096121341750712)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0641 \0627\0644\0639\0646\0635\0631 \063A\064A\0631 \0635\0627\0644\062D: %0 ')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123893922750720)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \062A\0648\062C\062F \062A\0639\0644\064A\0645\0627\062A \0644\0647\0630\0627 \0627\0644\0639\0646\0635\0631.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085676594750709)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644 \062A\0643\0648\064A\0646 \0627\0633\062A\0639\0644\0627\0645 \0627\0644\0631\0633\0645 \0627\0644\0628\064A\0627\0646\064A. \062A\062D\0642\0642 \0645\0646 \0625\0639\062F\0627\062F\0627\062A \062A\062E\0637\064A\0637 \0627\0644\0639\0645\0648\062F \0648\0627\0644\0645\0635\062F\0631.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086970005750709)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\064A\0645\0629 \063A\064A\0631 \0635\0627\0644\062D\0629 \0644\0644\0645\0639\0644\0645\0629 p_mail_id: %0')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123661055750720)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0639\0630\0631 \0627\0633\062A\062E\062F\0627\0645 \0639\0646\0627\0648\064A\0646 "\0625\0644\0649" \0623\0648 "\0631\062F \0639\0644\0649" \0643\0639\0646\0648\0627\0646 "\0645\0646"\060C \0644\0623\0646\0647\0627 \062A\062D\062A\0648\064A \0639\0644\0649 \0639\0646\0627\0648\064A\0646 \0628\0631\064A\062F \0625\0644\0643\062A\0631\0648\0646\064A \0645\062A\0639\062F\062F\0629.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137208568040750747)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0642\062F \062A\062C\0627\0648\0632\062A \0627\0644\0639\062F\062F \0627\0644\0623\0642\0635\0649 \0627\0644\0645\0633\0645\0648\062D \0628\0647 \0644\0639\062F\062F \0631\0633\0627\0626\0644 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A \0644\0643\0644 \0645\0633\0627\062D\0629 \0639\0645\0644. \0627\0644\0631\062C\0627\0621 \0627\0644\0627\062A\0635\0627\0644 \0628\0627\0644\0645\0633\0624\0648\0644.')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065141745750703)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0627\0633\062A\062F\0639\0627\0621 \0647\0630\0627 \0627\0644\0625\062C\0631\0627\0621 \0645\0646 \062F\0627\062E\0644 \062C\0644\0633\0629 \0627\0644\062A\0637\0628\064A\0642.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086863988750709)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0625\062F\062E\0627\0644 \0642\064A\0645\0629 \062E\0627\0644\064A\0629 \0644\0644\0645\0639\0644\0645\0629 %0.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137144912249750727)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0642\0627\0644\0628 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A "%0" \0641\064A \0627\0644\062A\0637\0628\064A\0642 %1.')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137221478104750751)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\0639\064A\064A\0646 \0645\0639\0644\0645\0629 \0627\0644\0645\062B\064A\0644 SMTP_HOST_ADDRESS \0644\0625\0631\0633\0627\0644 \0631\0633\0627\0626\0644 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A.')
,p_version_scn=>2704490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137086289310750709)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \0625\062F\062E\0627\0644 \0645\0633\062A\0644\0645 \0631\0633\0627\0644\0629 \0644\0625\0631\0633\0627\0644 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137210913881750748)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \062A\0643\0648\064A\0646 \0627\062A\0635\0627\0644 SMTP \0645\0639 \062E\0627\062F\0645 \0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A \0627\0644\0645\0643\0648\0646.')
,p_version_scn=>2704488
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137186266994750740)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\062F\0639\0627\0621 Ajax \063A\064A\0631 \0635\0627\0644\062D!')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070164583750704)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\0639\0631\064A\0641 \0648\0638\064A\0641\0629Ajax \0644\0644\0623\062F\0627\0629 \0627\0644\0625\0636\0627\0641\064A\0629 %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176712912750737)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\0639\0631\064A\0641 \062A\0646\0641\064A\0630 \0639\0631\0636 \0644\0644\0623\062F\0627\0629 \0627\0644\0625\0636\0627\0641\064A\0629 %0')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070228942750704)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\0639\0631\064A\0641 \0648\0638\064A\0641\0629 \0639\0631\0636 \0644\0644\0623\062F\0627\0629 \0627\0644\0625\0636\0627\0641\064A\0629 %0')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187135486750740)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\0631\0646\0627\0645\062C \0627\0644\0625\0636\0627\0641\064A \0644\0645\0635\062F\0631 \0628\064A\0627\0646\0627\062A REST "%0" \0644\0627 \064A\062D\062A\0648\064A \0639\0644\0649 \0648\0638\064A\0641\0629 "\0642\062F\0631\0627\062A".')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187070249750740)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\0631\0646\0627\0645\062C \0627\0644\0625\0636\0627\0641\064A \0644\0645\0635\062F\0631 \0628\064A\0627\0646\0627\062A REST "%0" \0644\0627 \064A\062D\062A\0648\064A \0639\0644\0649 \0648\0638\064A\0641\0629 DML.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187242483750740)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\0631\0646\0627\0645\062C \0627\0644\0625\0636\0627\0641\064A \0644\0645\0635\062F\0631 \0628\064A\0627\0646\0627\062A REST "%0" \0644\0627 \064A\062D\062A\0648\064A \0639\0644\0649 \0648\0638\064A\0641\0629 \062A\0646\0641\064A\0630.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137187337022750740)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\0631\0646\0627\0645\062C \0627\0644\0625\0636\0627\0641\064A \0644\0645\0635\062F\0631 \0628\064A\0627\0646\0627\062A REST "%0" \0644\0627 \064A\062D\062A\0648\064A \0639\0644\0649 \0648\0638\064A\0641\0629 \0625\062D\0636\0627\0631.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067611372750703)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \0627\0644\0625\0628\0644\0627\063A \0639\0646 \062E\0637\0623 \0641\064A \0631\0645\0632 PLSQL \0623\062B\0646\0627\0621 \0645\0639\0627\0644\062C\0629 \0627\0644\0623\062F\0627\0629 \0627\0644\0625\0636\0627\0641\064A\0629.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076260903750706)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0627\0644\0642\064A\0645\0629.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137109214759750716)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \062A\062D\0648\064A\0644 \0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A %0 \0625\0644\0649 VARCHAR2!')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197463177750744)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \0627\0644\0639\0645\0648\062F "%0" \0627\0644\0645\062D\062F\062F \0644\0644\0633\0645\0629 "%1" \0641\064A \0639\0628\0627\0631\0629 SQL!')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137024715573750690)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629 %0 \0645\0646 %1 \0644\064A\0633\062A \0635\0641\064A\0641 JSON \0635\0627\0644\062D.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174663551750736)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062C\0628 \062A\062D\062F\064A\062F \0627\0633\062A\0639\0644\0627\0645 \0642\0627\0626\0645\0629 \0642\064A\0645 (LOV) \0623\0648 \0642\0627\0626\0645\0629 \0642\064A\0645 \0645\0639\064A\0646\0629 \0644\0640 %0.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137176299897750737)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\062F\062F \0627\0644\0623\0639\0645\062F\0629 \0627\0644\0645\062D\062F\062F\0629 \0641\064A \0627\0633\062A\0639\0644\0627\0645 SQL \0644\0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645 \0644\0640 %0 \062E\0637\0623. \0627\0637\0644\0639 \0639\0644\0649 \0623\0645\062B\0644\0629 \0627\0644\0639\0628\0627\0631\0627\062A \0627\0644\0635\0627\0644\062D\0629.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197236041750744)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\062A\0645 \062A\062D\062F\064A\062F \0639\0645\0648\062F \0644\0644\0633\0645\0629 "%0".')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226426926750753)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0642\064A\0645\0629 \0627\0644\0645\062F\062E\0644\0629 %0 \0644\0644\0633\0645\0629 "%1" \0644\064A\0633\062A \0631\0642\0645\064A\0629.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137179745613750738)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 \0644\0647 \0646\0648\0639 \0628\064A\0627\0646\0627\062A \062E\0637\0623 \0641\064A \0639\0628\0627\0631\0629 SQL. \0627\0644\0639\0645\0648\062F \0631\0642\0645 %1 \0647\0648 %2 \0644\0643\0646 %3 \0647\0648 \0627\0644\0645\062A\0648\0642\0639.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137197320007750744)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0639\0645\0648\062F "%0" \0627\0644\0645\062D\062F\062F \0644\0644\0633\0645\0629 "%1" \0628\0646\0648\0639 \0627\0644\0628\064A\0627\0646\0627\062A %2 \0644\0643\0646 \064A\062C\0628 \0623\0646 \064A\0643\0648\0646 %3.')
,p_version_scn=>2704486
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137066893477750703)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0627\0644\0639\062B\0648\0631 \0639\0644\0649 \062A\062E\0637\064A\0637 \0627\0644\062A\0642\0631\064A\0631.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137054402508750699)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0645 \062A\062C\0627\0648\0632 \062D\062F \0639\0645\0644\064A\0627\062A \0627\0644\062A\0646\0641\064A\0630 \0641\064A \0627\0644\062E\0644\0641\064A\0629 \0644\0640 %0.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004708101750684)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \062A\0646\0641\064A\0630 %0 \0622\062E\0631 \0642\064A\062F \0627\0644\062A\0634\063A\064A\0644 \0628\0627\0644\0641\0639\0644.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137004615390750684)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\0648\062C\062F \062A\0646\0641\064A\0630 %0 \0622\062E\0631 \0642\064A\062F \0627\0644\062A\0634\063A\064A\0644 \0628\0627\0644\0641\0639\0644 \0644\0644\0633\064A\0627\0642 %1.')
,p_version_scn=>2704455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137019611026750689)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0631\0624\064A\0629 \0627\0644\0645\0644\0641\0627\062A \0627\0644\062A\064A \062A\0645 \062A\062D\0645\064A\0644\0647\0627 \0641\064A \0627\0644\062C\0644\0633\0629 \0642\064A\062F \0627\0644\062A\0634\063A\064A\0644 \0644\0644\062A\0646\0641\064A\0630 %0.')
,p_version_scn=>2704458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132162237750723)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\0645\0643\0646 \0627\0633\062A\062E\062F\0627\0645 \0645\064A\0632\0629 \062D\0633\0627\0628 \0627\0644\0645\062C\0645\0648\0639 \0644\0644\062A\0642\0627\0631\064A\0631 \0627\0644\0642\0627\0626\0645\0629 \0639\0644\0649 \0645\0635\062F \0628\064A\0627\0646\0627\062A REST.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093803296750711)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('ERR-2904 \062A\0639\0630\0631 \062A\0639\064A\064A\0646 \0642\064A\0645\0629 \0627\0644\0627\062E\062A\0635\0627\0631.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137098845844750713)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062E\0637\0623: \0646\0648\0639 \0627\062E\062A\0635\0627\0631 \063A\064A\0631 \0645\0639\0631\0648\0641.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137036524765750694)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0633\062A\0639\0644\0627\0645 \0627\0644\0628\062D\062B \0637\0648\064A\0644 \0644\0644\063A\0627\064A\0629.')
,p_version_scn=>2704460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137087903915750709)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0625\062D\0636\0627\0631 authentication_scheme \0641\064A \0627\0644\062A\0637\0628\064A\0642 %0.')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137095988336750712)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0639\0630\0631 \0633\062D\0628 \0627\0644\0645\0643\0648\0646 %0.')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137166223069750734)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\0639\0631\0641 \0627\0644\0639\0645\064A\0644 \0645\0648\062C\0648\062F \0628\0627\0644\0641\0639\0644 \0644\0644\062C\0644\0633\0629 \0627\0644\062D\0627\0644\064A\0629.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099187982750713)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0628\0631\064A\062F \0627\0644\0625\0644\0643\062A\0631\0648\0646\064A')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225970043750752)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0634\0644\062A \0627\0644\0645\0635\0627\062F\0642\0629.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137126521734750721)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A \0645\0644\0641 \062A\0639\0631\064A\0641 \0627\0631\062A\0628\0627\0637 \0648\0627\062D\062F \0623\0648 \0623\0643\062B\0631 \0641\064A apex_util.g_request_cookies \0639\0644\0649 \0642\064A\0645\0629 \063A\064A\0631 \0635\0627\0644\062D\0629.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137108496043750716)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0633\062A\062C\0627\0628\0629 \0645\0646 \0633\062C\0644 UDDI \063A\064A\0631 \0635\0627\0644\062D\0629.')
,p_version_scn=>2704471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137067720072750703)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0645 \064A\0642\0645 \0631\0627\0628\0637 URL \0627\0644\0645\0642\062F\0645 \0628\0625\0631\062C\0627\0639 \0645\0633\062A\0646\062F WSDL \0635\0627\0644\062D.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137070568356750704)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A \0645\0633\062A\0646\062F WSDL \0639\0644\0649 \0639\062F\0629 \0631\0648\0627\0628\0637 SOAP. &PRODUCT_NAME. \0644\0627 \064A\062F\0639\0645 \0625\0644\0627 WSDL \0628\0631\0627\0628\0637 SOAP \0648\0627\062D\062F. \0627\0646\0642\0631 \0644\062A\0643\0648\064A\0646 \0645\0631\062C\0639 \062E\062F\0645\0629 \0648\064A\0628 \064A\062F\0648\064A\064B\0627 \0644\0645\062A\0627\0628\0639\0629 \062A\0643\0648\064A\0646 \0645\0631\062C\0639 \0644\0647\0630\0647 \0627\0644\062E\062F\0645\0629.')
,p_version_scn=>2704464
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137146190605750727)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0627\0633\062A\062C\0627\0628\0629 \0645\0646 \0627\0644\062E\062F\0645\0629 \0644\0645 \062A\0643\0646 \0628\0627\0644\0635\064A\063A\0629 XML.')
,p_version_scn=>2704477
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137225850263750752)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0631\0645\0632 \0648\0635\0648\0644 \0645\0635\0627\062F\0642\0629 OAuth \0627\0644\0645\0645\064A\0632 \063A\064A\0631 \0645\062A\0648\0641\0631 \0623\0648 \0645\0646\062A\0647\064A \0627\0644\0635\0644\0627\062D\064A\0629.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137190337057750741)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0642\062F \062A\062C\0627\0648\0632\062A \0627\0644\0639\062F\062F \0627\0644\0623\0642\0635\0649 \0627\0644\0645\0633\0645\0648\062D \0628\0647 \0644\0639\062F\062F \0637\0644\0628\0627\062A \062E\062F\0645\0629 \0627\0644\0648\064A\0628 \0644\0643\0644 \0645\0633\0627\062D\0629 \0639\0645\0644. \0627\0644\0631\062C\0627\0621 \0627\0644\0627\062A\0635\0627\0644 \0628\0627\0644\0645\0633\0624\0648\0644.')
,p_version_scn=>2704484
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137226054525750753)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0623\062C\0627\0628 \0627\0644\062E\0627\062F\0645 \0628\0646\0648\0639 \0631\0645\0632 \0645\0635\0627\062F\0642\0629 OAuth \0645\0645\064A\0632 \063A\064A\0631 \0645\062F\0639\0648\0645.')
,p_version_scn=>2704491
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069987895750704)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'ar'
,p_message_text=>unistr('\0644\0627 \064A\062D\062A\0648\064A \0645\0633\062A\0646\062F WSDL \0647\0630\0627 \0639\0644\0649 \0631\0627\0628\0637 SOAP \0627\0644\0645\0637\0644\0648\0628 \0644\0625\0636\0627\0641\0629 \0627\0644\0645\0631\062C\0639.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137065332772750703)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062A\0637\0644\0628 WSDL \0628\064A\0627\0646\0627\062A \0635\0644\0627\062D\064A\0629 \0627\0644\0645\0635\0627\062F\0642\0629. \0627\0644\0631\062C\0627\0621 \0625\062F\062E\0627\0644 \0627\0633\0645 \0627\0644\0645\0633\062A\062E\062F\0645 \0648\0643\0644\0645\0629 \0627\0644\0645\0631\0648\0631 \0623\062F\0646\0627\0647.')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137076369218750706)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631 \0641\0647\0645 \0645\0633\062A\0646\062F WSDL \0628\0648\0627\0633\0637\0629 \0645\062D\0631\0643 \0627\0644\0639\0631\0636. \0627\0646\0642\0631 \0639\0644\0649 \062A\0643\0648\064A\0646 \0645\0631\062C\0639 \062E\062F\0645\0629 \0648\064A\0628 \064A\062F\0648\064A\064B\0627 \0644\0645\062A\0627\0628\0639\0629 \062A\0643\0648\064A\0646 \0645\0631\062C\0639 \0644\0647\0630\0627 \0627\0644\062E\062F\0645\0629.')
,p_version_scn=>2704465
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137149149129750728)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062A\0639\0630\0631\062A \0645\0639\0627\0644\062C\0629 \0627\0644\062A\062D\062F\064A\062B.')
,p_version_scn=>2704478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174957548750736)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0627\0644\0639\0631\0636 \0648\0627\0644\0646\062A\064A\062C\0629 \0641\064A \0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645 \0647\0645\0627 \0627\0644\0639\0645\0648\062F \0646\0641\0633\0647!')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137174895707750736)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0642\0627\0626\0645\0629 \0627\0644\0642\064A\0645 \0644\0627 \062A\062D\062A\0648\064A \0639\0644\0649 \0639\0645\0648\062F \0646\062A\064A\062C\0629.')
,p_version_scn=>2704481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102500162750714)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0627\0644\062D\0635\0648\0644 \0639\0644\0649 \0642\064A\0645\0629 \0627\0644\0639\0645\0648\062F: %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127441064750722)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'ar'
,p_message_text=>unistr('\0628\064A\0627\0646\0627\062A \0627\0644\0646\0645\0648\0630\062C \0627\0644\062C\062F\0648\0644\064A \0627\0644\062D\0627\0644\064A\0629 \0642\062F\064A\0645\0629 \0644\0644\063A\0627\064A\0629\060C \062A\0645 \062A\0639\062F\064A\0644 \0628\064A\0627\0646\0627\062A \0627\0644\0645\0635\062F\0631.<br/> \0627\0646\0642\0631 <strong><a href="%0">\0647\0646\0627</a></strong> \0644\062A\062C\0627\0647\0644 \062A\063A\064A\064A\0631\0627\062A\0643 \0648\0625\0639\0627\062F\0629 \062A\062D\0645\064A\0644 \0627\0644\0628\064A\0627\0646\0627\062A \0645\0646 \0642\0627\0639\062F\0629 \0627\0644\0628\064A\0627\0646\0627\062A.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082666194750708)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\062D\062F\064A\062F \0633\0644\0633\0644\0629 \0627\0644\062A\0642\0633\064A\0645 \0625\0644\0649 \0635\0641\062D\0627\062A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082503967750708)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\062A\0639\0630\0631 \062A\062D\062F\064A\062F \0639\0646\0627\0648\064A\0646 \0627\0644\0627\0633\062A\0639\0644\0627\0645:'),
'%0'))
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082741427750708)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \062A\0646\0641\064A\0630 \0627\0633\062A\0628\062F\0627\0644 \062A\0630\064A\064A\0644 \0627\0644\062A\0642\0631\064A\0631')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082854492750708)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\0641\0634\0644 \062A\062D\0644\064A\0644 \0627\0633\062A\0639\0644\0627\0645 SQL \0644\063A\0648\064A\064B\0627:'),
'%0',
'%1'))
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088953421750710)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\062D\062F \0627\0644\0623\062F\0646\0649 \0644\0639\062F\062F \0627\0644\0635\0641\0648\0641: %0\060C \062A\0645 \0644\0644\0639\062B\0648\0631 \0639\0644\0649 \0635\0641\0648\0641 \0644\0643\0646 \0644\0645 \064A\062A\0645 \0639\0631\0636\0647\0627: %1')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085314166750709)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0627\0644\0627\0633\062A\0639\0644\0627\0645 #%0 (%1) \063A\064A\0631 \0635\0627\0644\062D\060C \062A\062D\062A\0627\062C \0627\0644\0623\0639\0645\062F\0629 \0627\0644\062A\064A \062A\0633\062A\062E\062F\0645 HTML \0625\0644\0649 \0623\0633\0645\0627\0621 \0645\0633\062A\0639\0627\0631\0629')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137102494420750714)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'ar'
,p_message_text=>unistr('\062D\062F\062B \062E\0637\0623 \0623\062B\0646\0627\0621 \0627\0644\062D\0635\0648\0644 \0639\0644\0649 \0639\0646\0627\0648\064A\0646 \0627\0644\0627\0633\062A\0639\0644\0627\0645\0627\062A: %0')
,p_version_scn=>2704470
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082929546750708)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\062E\0637\0623 \062A\0642\0631\064A\0631:'),
'%0'))
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137123024269750720)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'ar'
,p_message_text=>unistr('\0641\0631\0632 \062D\0633\0628 \0647\0630\0627 \0627\0644\0639\0645\0648\062F')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085407742750709)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'ar'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>\062A\0639\0630\0631 \062A\062D\0644\064A\0644 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0644\063A\0648\064A\064B\0627\060C \0627\0644\0631\062C\0627\0621 \0627\0644\062A\062D\0642\0642 \0645\0646 \0635\064A\0627\063A\0629 \0627\0644\0627\0633\062A\0639\0644\0627\0645 \0627\0644\062E\0627\0635 \0628\0643.'),
'(%0)',
'</p>'))
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127506075750722)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'ar'
,p_message_text=>unistr('\064A\062D\062A\0648\064A \0647\0630\0627 \0627\0644\0646\0645\0648\0630\062C \0639\0644\0649 \062A\063A\064A\064A\0631\0627\062A \063A\064A\0631 \0645\062D\0641\0648\0638\0629. \0627\0646\0642\0631 \0639\0644\0649 "\0645\0648\0627\0641\0642" \0644\0644\0645\062A\0627\0628\0639\0629 \062F\0648\0646 \062D\0641\0638 \0627\0644\062A\063A\064A\064A\0631\0627\062A.')
,p_version_scn=>2704475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137132032927750723)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'ar'
,p_message_text=>unistr('\0645\062E\0637\0637 \062A\0642\0633\064A\0645 \0627\0644\062A\0642\0631\064A\0631 \0625\0644\0649 \0635\0641\062D\0627\062A (%0) \063A\064A\0631 \0645\062F\0639\0648\0645 \0641\064A \0645\0635\062F\0631 \0627\0644\0628\064A\0627\0646\0627\062A \0627\0644\0645\062D\062F\062F.')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137085225233750709)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0639\0645\0648\062F \0627\0644\0627\0633\062A\0639\0644\0627\0645  #%0 (%1) \063A\064A\0631 \0635\0627\0644\062D\060C \0627\0633\062A\062E\062F\0645 \0627\0644\0627\0633\0645 \0627\0644\0645\0633\062A\0639\0627\0631 \0644\0644\0639\0645\0648\062F')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089047146750710)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641 (\0627\0644\0635\0641\0648\0641) %0 - %1 \0644\0623\0643\062B\0631 \0645\0646 %2')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137129585007750722)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 - %1 \0644\0623\0643\062B\0631 \0645\0646 %2')
,p_version_scn=>2704476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137088872583750710)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0635\0641 (\0627\0644\0635\0641\0648\0641) %0 - %1 \0645\0646 %2')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137069663537750704)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'ar'
,p_message_text=>unistr('%0 - %1 \0645\0646 %2')
,p_version_scn=>2704463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137083062127750708)
,p_name=>'Y'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0639\0645')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137090341860750710)
,p_name=>'YEAR'
,p_message_language=>'ar'
,p_message_text=>unistr('\0633\0646\0629')
,p_version_scn=>2704468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137082220333750708)
,p_name=>'YEARS'
,p_message_language=>'ar'
,p_message_text=>unistr('\0627\0644\0633\0646\0648\0627\062A')
,p_version_scn=>2704467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137127676195750722)
,p_name=>'YES'
,p_message_language=>'ar'
,p_message_text=>unistr('\0646\0639\0645')
,p_version_scn=>2704475
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/no_auth
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(109678305570583962.4498)
,p_name=>'No Auth'
,p_scheme_type=>'NATIVE_DAD'
,p_attribute_01=>'nobody'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>75553098
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1.4498
,p_name=>unistr('\0627\0644\0631\0633\0627\0626\0644')
,p_alias=>'MESSAGES'
,p_step_title=>unistr('\0627\0644\0631\0633\0627\0626\0644')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/deployment/definition
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
