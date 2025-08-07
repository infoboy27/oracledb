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
,p_default_application_id=>4497
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4497 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4497
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144691775683755833')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'fr-ca'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4497)
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
 p_id=>wwv_flow_imp.id(4497)
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
 p_id=>wwv_flow_imp.id(728504220438374.4497)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4497)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4497)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4497)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4497)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4497)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4497)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4497)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4497)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4497)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4497)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4497)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4497)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4497)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4497)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4497)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4497)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.fr-ca'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4497)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4497)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4497)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4497)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4497)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4497)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4497)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.fr-ca'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4497)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4497)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4497)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4497)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4497)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4497)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.fr-ca'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4497)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4497)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4497)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.fr-ca'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4497)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4497)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4497)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4497)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4497)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4497)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4497)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4497)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4497)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4497)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4497)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4497)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4497)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4497)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4497)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4497)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4497)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.fr-ca'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4497)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4497)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4497)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4497)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4497)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4497)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4497)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4497)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4497)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4497)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4497)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4497)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4497)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4497)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4497)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4497)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4497)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.fr-ca'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4497)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4497)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4497)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4497)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4497)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4497)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4497)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4497)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4497)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4497)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4497)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4497)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4497)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4497)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4497)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.fr-ca'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4497)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4497)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4497)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4497)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4497)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4497)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4497)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4497)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4497)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4497)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4497)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4497)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4497)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4497)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4497)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4497)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4497)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4497)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4497)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4497)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4497)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4497)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4497)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4497)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4497)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4497)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4497)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4497)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4497)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4497)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4497)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4497)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4497)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4497)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4497)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4497)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4497)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4497)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4497)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4497)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4497)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4497)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4497)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4497)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4497)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4497)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4497)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4497)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4497)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4497)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4497)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4497)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4497)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4497)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4497)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4497)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4497)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4497)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4497)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4497)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4497)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4497)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4497)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4497)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4497)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4497)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4497)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4497)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4497)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4497)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4497)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4497)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4497)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4497)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4497)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4497)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4497)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4497)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4497)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4497)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4497)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4497)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4497)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4497)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4497)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4497)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4497)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4497)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4497)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4497)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4497)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4497)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4497)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4497)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4497)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4497)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4497)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4497)
,p_page_name=>'winlov'
,p_page_title=>unistr('Bo\00EEte de dialogue de recherche')
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
,p_find_button_text=>'Rechercher'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'Fermer'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'Suivant &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>unistr('&lt; Pr\00E9c\00E9dent')
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4497)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4497)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4497)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4497)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4497)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4497)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4497)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4497)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4497)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4497)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4497)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4497)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4497)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4497)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4497)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4497)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4497)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4497)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4497)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4497)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4497)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4497)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4497)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4497)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4497)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4497)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4497)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4497)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4497)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4497)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4497)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4497)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4497)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4497)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4497)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4497)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4497)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4497)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4497)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4497)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4497)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4497)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4497)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4497)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4497)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4497)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4497)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4497)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4497)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4497)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4497)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4497)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4497)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4497)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4497)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4497)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4497)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4497)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4497)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4497)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4497)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4497)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4497)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4497)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4497)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4497)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4497)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4497)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4497)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4497)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4497)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4497)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4497)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4497)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4497)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4497)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4497)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4497)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4497)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4497)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4497)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4497)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4497)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4497)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4497)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4497)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4497)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4497)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4497)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4497)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4497)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4497)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4497)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4497)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4497)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4497)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4497)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4497)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4497)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4497)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4497)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4497)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4497)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4497)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4497)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4497)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4497)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4497)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4497)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4497)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4497)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4497)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4497)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4497)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4497)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4497)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4497)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4497)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4497)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4497)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4497)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4497)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4497)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4497)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4497)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4497)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4497)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4497)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4497)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4497)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4497)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4497)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4497)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4497)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4497)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4497)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4497)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4497)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4497)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4497)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4497)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4497)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4497)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4497)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4497)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4497)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4497)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4497)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4497)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4497)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4497)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4497)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4497)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4497)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4497)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4497)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4497)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4497)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4497)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4497)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4497)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4497)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4497)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4497)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4497)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4497)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4497)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4497)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4497)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4497)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4497)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4497)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4497)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4497)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4497)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4497)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4497)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4497)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4497)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4497)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4497)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4497)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4497)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4497)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4497)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4497)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4497)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4497)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4497)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4497)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4497)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4497)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4497)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4497)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4497)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4497)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4497)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4497)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4497)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4497)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4497)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4497)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4497)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4497)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4497)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4497)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4497)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4497)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4497)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4497)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4497)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4497)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4497)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4497)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4497)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4497)
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
 p_id=>wwv_flow_imp.id(138886443934751274)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne %0'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871053261751269)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'fr-ca'
,p_message_text=>'Administrateur'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870906485751269)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom d''utilisateur'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933644455751288)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Acc\00E8s refus\00E9')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890578109751275)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Votre compte %0 a \00E9t\00E9 cr\00E9\00E9.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873749433751270)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le compte est verrouill\00E9.')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858246870751265)
,p_name=>'AM_PM'
,p_message_language=>'fr-ca'
,p_message_text=>'AM / PM'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841014099751260)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'fr-ca'
,p_message_text=>'lien d''action'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840990988751260)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'fr-ca'
,p_message_text=>'lien de dialogue'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005395551751310)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activer/d\00E9sactiver %0')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013159790751312)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'fr-ca'
,p_message_text=>'(Actif)'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817985250751253)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Clavardage effac\00E9')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817889752751253)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer le clavardage'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814449501751252)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'fr-ca'
,p_message_text=>'Accepter'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814500176751252)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'fr-ca'
,p_message_text=>'Refuser'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814248392751252)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'fr-ca'
,p_message_text=>'Historique de conversation'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817682939751253)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Copi\00E9')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817774964751253)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Copi\00E9 dans le presse-papiers')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817485435751253)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'fr-ca'
,p_message_text=>'Copier'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817502321751253)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'fr-ca'
,p_message_text=>'Copier dans le presse-papiers'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814959374751252)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Assistant'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815306606751252)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''IA est d\00E9sactiv\00E9e au niveau de l''espace de travail ou de l''instance.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854616736751264)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le service d''intelligence artificielle g\00E9n\00E9rative portant l''ID ou l''ID statique indiqu\00E9s est introuvable.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853365441751264)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur d''authentification ou acc\00E8s interdit (HTTP-%1) pour l''URL %0. V\00E9rifiez la configuration du service d''IA g\00E9n\00E9rative %2.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833179810751258)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La demande HTTP pour le service d''intelligence artificielle g\00E9n\00E9rative \00E0 %0 \00E0 \00E9chou\00E9 avec HTTP-%1 : %2')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857552370751265)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur dans la demande HTTP au service d''IA g\00E9n\00E9rative pour le plugiciel %0 en mode %1. V\00E9rifiez la configuration du service d''IA g\00E9n\00E9rative.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820335534751254)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Exemples'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818736978751253)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'fr-ca'
,p_message_text=>'Assistant'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820185221751254)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818635142751253)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'fr-ca'
,p_message_text=>'Vous'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849379718751263)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le service d''intelligence artificielle g\00E9n\00E9rative OCI ne prend pas en charge l''exp\00E9rience de clavardage avec plusieurs messages.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829214113751257)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du traitement de l''invite %0 pour l''application %1. V\00E9rifiez si le g\00E9n\00E9rateur d''applications est disponible sur cette instance.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834392003751258)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de traiter la r\00E9ponse pour le service d''intelligence artificielle %0, r\00E9ponse %1')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840554088751260)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoyer un message'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828842369751256)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur dans le service d''intelligence artificielle dorsal %0'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814657789751252)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Message'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814760809751252)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'fr-ca'
,p_message_text=>'Entrez votre message ici'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818060605751253)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Avatar de l''utilisateur'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818132984751253)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'fr-ca'
,p_message_text=>'Utiliser'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814860702751252)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous avez un message non envoy\00E9, vous confirmez?')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983811389751303)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''appel Ajax a retourn\00E9 une erreur de serveur %0 pour %1.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910908952751281)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''alias d''application "%0" ne peut pas \00EAtre converti en ID d''application unique.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899789607751278)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'ERR-1816 Erreur inattendue lors de la conversion de l''alias d''application p_flow_alias_or_id (%0).'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997182153751307)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La somme de contr\00F4le d''une application permet de voir facilement si la m\00EAme application est d\00E9ploy\00E9e dans plusieurs espaces de travail. Vous pouvez comparer cette somme de contr\00F4le pour d\00E9terminer s''il y a une correspondance. ')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883799446751273)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de la fonction d''authentification.'
,p_version_scn=>2704818
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865763616751267)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de la fonction d''authentification.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037601231751319)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nom de locataire %0 retourn\00E9 par Oracle Cloud Identity Management n''est pas autoris\00E9 pour le domaine %1.<br/><a href="&LOGOUT_URL.">Reconnectez-vous</a>, puis indiquez un nom de locataire autoris\00E9 ou modifiez l''URL.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861824966751266)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le compte "%0" ne dispose pas des privil\00E8ges de d\00E9veloppement n\00E9cessaires (DB_DEVELOPER ou DB_ADMINISTRATOR)<br/>pour l''espace de travail "%1". <a href="&LOGOUT_URL.">Reconnectez-vous</a> une fois les privil\00E8ges obtenus.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858410032751265)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nom de locataire retourn\00E9 par Oracle Cloud Identity Management n''est pas autoris\00E9 pour l''espace de travail courant.<br/><a href="&LOGOUT_URL.">Reconnectez-vous</a> et sp\00E9cifiez un nom de locataire autoris\00E9.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861968422751266)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pour des raisons de s\00E9curit\00E9, l''ex\00E9cution des applications de cet espace de travail au moyen du domaine de l''URL n''est pas autoris\00E9e.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883412179751273)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Demandez \00E0 votre administrateur de base de donn\00E9es d''ex\00E9cuter $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2704818
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883370330751273)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'fr-ca'
,p_message_text=>'L''ensemble SYS.DBMS_LDAP n''existe pas ou n''est pas valide.'
,p_version_scn=>2704818
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883213246751273)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de la fonction de modification de l''utilisateur LDAP.'
,p_version_scn=>2704818
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883527885751273)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de l''authentification LDAP.'
,p_version_scn=>2704818
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884351738751273)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur dans l''argument p_flow_page pour la proc\00E9dure login_page.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883995242751273)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'fr-ca'
,p_message_text=>'Argument p_session non valide dans wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935231457751288)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'fr-ca'
,p_message_text=>'Argument incorrect pour wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884071325751273)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nom d''utilisateur nul transmis \00E0 la proc\00E9dure de connexion.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870803155751269)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Patientez pendant <span id="apex_login_throttle_sec">%0</span> secondes avant de vous reconnecter.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872148280751269)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La tentative de connexion a \00E9t\00E9 bloqu\00E9e.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932959297751288)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>'Authentification "%0" introuvable'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872620521751270)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ID groupe de s\00E9curit\00E9 est nul.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883858585751273)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors de l''ex\00E9cution du processus de post-authentification.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883690425751273)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du traitement du processus de pr\00E9-authentification.')
,p_version_scn=>2704818
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885382848751273)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ouvrez l''URL dans le navigateur que vous avez utilis\00E9 pour lancer la demande de r\00E9initialisation de mot de passe. Si vous cliquez sur l''URL de r\00E9initialisation de mot de passe et que vous \00EAtes redirig\00E9 vers la page de connexion, lancez \00E0 nouveau la r')
||unistr('\00E9initialisation du mot de passe et laissez le navigateur ouvert.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035186343751318)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('URL de r\00E9initialisation du mot de passe')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862195517751266)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le %0 de groupe de consommateurs Gestionnaire de ressources n''a pas \00E9t\00E9 accord\00E9 \00E0 %1')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862277820751266)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Utilisez DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP pour accorder le privil\00E8ge manquant.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896827987751277)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de la fonction de drapeau de session.'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896956003751277)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du traitement de la fonction de v\00E9rification de session.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897179616751277)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Demandez \00E0 l''administrateur %0 de configurer le moteur pour l''authentification unique pour Oracle Application Server.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907553680751280)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 non valide dans le jeton %1 retourn\00E9 par l''authentification unique.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884293210751273)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modifiez le mod\00E8le d''authentification et ajoutez le nom de l''application.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907232284751280)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Appelant de la proc\00E9dure %0 non valide :')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907449400751280)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'fr-ca'
,p_message_text=>'Session d''application non valide dans le jeton URLC : %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907070912751280)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur dans portal_sso_redirect : Informations d''enregistrement d''application manquantes : %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897059736751277)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'fr-ca'
,p_message_text=>'L''ensemble WWSEC_SSO_ENABLER_PRIVATE n''existe pas ou n''est pas valide.'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884175856751273)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de trouver le nom de l''application de partenaire enregistr\00E9 dans le mod\00E8le d''authentification.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907178730751280)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Enregistrez cette application comme indiqu\00E9 dans le guide d''installation.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897232284751277)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de l''authentification unique.'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010507783751311)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('URL non autoris\00E9e : %0')
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896698121751277)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de l''authentification.'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862013577751266)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'fr-ca'
,p_message_text=>'L''espace de travail "%0" est inactif. Communiquez avec l''administrateur.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862786519751267)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'fr-ca'
,p_message_text=>'%0'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871864231751269)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Acc\00E8s refus\00E9 par le contr\00F4le de s\00E9curit\00E9 de l''application')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871982501751269)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Acc\00E8s refus\00E9 par le contr\00F4le de s\00E9curit\00E9 de la page')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872033421751269)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de l''autorisation.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941166816751290)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9\00E9 avec %0 \00E0 l''aide de %1')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941239753751290)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'amour'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001053339751308)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Description de l''\00E9v\00E9nement')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000836592751308)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'fr-ca'
,p_message_text=>'Date de fin'
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001193590751308)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ID \00E9v\00E9nement')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000718032751308)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Date de d\00E9but')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000922194751308)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Titre de l''\00E9v\00E9nement')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843579887751261)
,p_name=>'APEX.CARD'
,p_message_language=>'fr-ca'
,p_message_text=>'Carte'
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843773303751261)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Action de carte'
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884463794751273)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Case \00E0 cocher masqu\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886378866751274)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur de contenu de somme de contr\00F4le')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886261671751274)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur de format de somme de contr\00F4le')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956154108751295)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Copi\00E9 dans le presse-papiers.')
,p_is_js_message=>true
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955659871751295)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ce navigateur ne prend pas en charge la copie \00E0 partir d''un bouton ou d''un menu. Essayez Ctrl+C ou Commande+C.')
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941817747751290)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer'
,p_is_js_message=>true
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820294143751254)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le contenu de l''\00E9diteur de code d\00E9passe la longueur maximum de l''article (nombre de caract\00E8res r\00E9el %0, autoris\00E9 %1 caract\00E8res)')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000348666751308)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'fr-ca'
,p_message_text=>'Contraste'
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994894388751306)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'fr-ca'
,p_message_text=>'Courant'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994765357751306)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Initial'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998954631751308)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur pour #LABEL# doit \00EAtre une couleur valide. Exemple : %0')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861311562751266)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'fr-ca'
,p_message_text=>'Plus de couleurs'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861469719751266)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ouvrir le s\00E9lecteur de couleur :')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818503218751253)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Curseur alpha, Utiliser les touches fl\00E9ch\00E9es pour naviguer.')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818274090751253)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Spectre de couleurs, curseur \00E0 quatre voies. Utiliser les touches fl\00E9ch\00E9es pour naviguer.')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818360334751253)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nuance, curseur vertical. Utiliser les touches fl\00E9ch\00E9es pour naviguer.')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994616281751306)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Choisir une couleur'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994923202751306)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le format de couleur'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032892905751318)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste de valeurs'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032959166751318)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'fr-ca'
,p_message_text=>'Ouvrir la liste pour : %0'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013211714751312)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('(Termin\00E9)')
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902113796751278)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'fr-ca'
,p_message_text=>'Communiquez avec l''administrateur de l''application.'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917683946751283)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Communiquez avec l''administrateur de l''application.',
unistr('Les d\00E9tails de cet incident sont disponibles au moyen de l''ID d\00E9bogage "%0".')))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999265087751308)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'fr-ca'
,p_message_text=>'Corrigez les erreurs avant d''enregistrer.'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844552396751261)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0. Appuyez sur la touche de retour arri\00E8re pour supprimer.')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942708514751291)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 correspondances trouv\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824637900751255)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('1 correspondance trouv\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942652535751291)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune correspondance n''a \00E9t\00E9 trouv\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819059819751254)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'fr-ca'
,p_message_text=>'Autres'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818992068751253)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 valeurs s\00E9lectionn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013751643751312)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'fr-ca'
,p_message_text=>'Progression courante'
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999615525751308)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le fichier sp\00E9cifi\00E9 dans l''\00E9l\00E9ment %0 n''existe pas dans APEX_APPLICATION_TEMP_FILES.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988169688751304)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La version courante des donn\00E9es dans la base de donn\00E9es a chang\00E9 depuis le lancement de la mise \00E0 jour par l''utilisateur.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957290076751295)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Ne pas charger'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003511459751309)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur de pr\00E9traitement')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003318944751309)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ins\00E9rer une rang\00E9e')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016966761751313)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9quence : Action')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003496006751309)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mettre \00E0 jour la rang\00E9e')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831903524751257)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Actions'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859536430751266)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'fr-ca'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845692520751262)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 doit \00EAtre un s\00E9lecteur de date ou une date valide, par exemple %1.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954850599751294)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer'
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863037583751267)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Termin\00E9')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874022312751270)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 a des parties non prises en charge dans le masque de format : %1'
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859235202751266)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>'Heure'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943165040751291)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Calendrier contextuel : %0'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859020777751265)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>'Semaine'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859140012751265)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'fr-ca'
,p_message_text=>'Sem.'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859407805751266)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>'Minutes'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859635567751266)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860017123751266)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois prochain'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829699512751257)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fen\00EAtre contextuelle pour %0')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859980323751266)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mois pr\00E9c\00E9dent')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952489830751294)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lecteur de date en lecture seule')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860888940751266)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner la date')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829726259751257)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner la date et l''heure')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826969491751256)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner le jour')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830307597751257)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner le mois et l''ann\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827189625751256)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner l''heure')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827625138751256)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Aujourd''hui'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845203420751261)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur pour #LABEL# doit \00EAtre une date valide, par exemple %0.')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844933877751261)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur de #LABEL# doit \00EAtre comprise entre %0 et %1.')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845075975751261)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur de #LABEL# doit \00EAtre identique ou post\00E9rieure \00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845178910751261)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur de #LABEL# doit \00EAtre identique ou ant\00E9rieure \00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836540953751259)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modification masqu\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859864911751266)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ann\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946819887751292)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur #LABEL# est post\00E9rieure \00E0 la date maximale indiqu\00E9e %0.')
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947245658751292)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>'#LABEL# ne correspond pas au format %0.'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946754049751292)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur #LABEL# est ant\00E9rieure \00E0 la date minimale indiqu\00E9e %0.')
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946972205751292)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur #LABEL# ne figure pas dans l''intervalle valide compris entre %0 et %1.'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947105521751292)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur #LABEL# ne figure pas dans l''intervalle d''ann\00E9es valide compris entre %0 et %1.')
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838996254751259)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Une erreur interne est survenue lors du traitement de la demande DBMS_CLOUD.'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999597779751308)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025485673751316)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886614890751274)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Confirmation'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027486076751316)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999345307751308)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'fr-ca'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999480879751308)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867159187751268)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Titre de la bo\00EEte de dialogue')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906840378751280)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Titre de la bo\00EEte de dialogue masqu\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827926140751256)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fonction pr\00E9d\00E9finie de g\00E9n\00E9rateur de document d''Oracle')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838721208751259)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors de l''impression d''un document.'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815901592751253)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'%s ne prend pas en charge %1 comme sortie.'
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827808025751256)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur "%0" lors de l''appel de la Fonction pr\00E9d\00E9finie de g\00E9n\00E9rateur de document d''Oracle :')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819358225751254)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Un mod\00E8le est requis.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844762317751261)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du t\00E9l\00E9chargement du fichier.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844630644751261)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune donn\00E9e t\00E9l\00E9chargeable trouv\00E9e.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848240508751262)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cette fonction n''est pas disponible dans un environnement r\00E9serv\00E9 \00E0 l''ex\00E9cution.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901048509751278)
,p_name=>'APEX.ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur'
,p_is_js_message=>true
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860953788751266)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''erreur suivante est survenue lors de l''ex\00E9cution du rappel de traitement d''erreur : %0')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873592773751270)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors de l''affichage de la page d''erreur : %0'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862644946751267)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur interne'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012399377751312)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Communiquez avec l''administrateur.',
unistr('Les d\00E9tails de cet incident sont disponibles au moyen de l''ID d\00E9bogage "%0".')))
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006944272751310)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La base de donn\00E9es est ouverte pour acc\00E8s en lecture seule.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037034826751319)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ORA-28353 : \00C9chec de l''ouverture du portefeuille. Les donn\00E9es d''application sont actuellement inaccessibles.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007003193751310)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Cette page n''est pas disponible'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865682939751267)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Informations techniques (disponibles uniquement pour les d\00E9veloppeurs)')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971579838751299)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>'Message d''erreur'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985454455751304)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Format attendu : %0'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950363580751293)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('L''utilisateur figure d\00E9j\00E0 dans la liste de contr\00F4le d''acc\00E8s'),
''))
,p_version_scn=>2704830
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950204844751293)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Confirmez l''ajout des %0 utilisateurs suivants \00E0 la liste de contr\00F4le d''acc\00E8s <strong>%1</strong>.'),
''))
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950778833751293)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'fr-ca'
,p_message_text=>'Il existe un utilisateur en double'
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950446419751293)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'fr-ca'
,p_message_text=>'A commercial (@) manquant dans l''adresse de courriel'
,p_version_scn=>2704830
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950536888751293)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'fr-ca'
,p_message_text=>'Point manquant (.) dans l''adresse de courriel'
,p_version_scn=>2704830
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950624225751293)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'fr-ca'
,p_message_text=>'Le nom d''utilisateur est trop long'
,p_version_scn=>2704830
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950972878751293)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Seuls les utilisateurs d\00E9finis dans la liste de contr\00F4le d''acc\00E8s de l''application peuvent acc\00E9der \00E0 cette application')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951065839751293)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur inattendue pour le param\00E8tre de contr\00F4le d''acc\00E8s : %0')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950868044751293)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tous les utilisateurs authentifi\00E9s peuvent acc\00E9der \00E0 cette application')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995365541751307)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995219813751306)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995572034751307)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 : Est d\00E9sactiv\00E9')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995451605751307)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 : Est activ\00E9')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844093787751261)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>'Non pris en charge'
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905214796751279)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905187061751279)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995140471751306)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('non identifi\00E9')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835646005751259)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 octets'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836184714751259)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835859339751259)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836053404751259)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988330428751304)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E9l\00E9charger')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841496061751260)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Options'
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841134248751260)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841331442751260)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'fr-ca'
,p_message_text=>'Masquer la facette'
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866061692751268)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter un filtre'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942334142751291)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Filtre appliqu\00E9 %0')
,p_is_js_message=>true
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866710873751268)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985996870751304)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866865300751268)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850610842751263)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Graphique \00E0 barres')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998679207751307)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'fr-ca'
,p_message_text=>'Autres'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850721048751263)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Graphique \00E0 secteurs')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997200944751307)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Graphique'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850452329751263)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986492634751304)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986518132751304)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout effacer'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986603968751304)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer %0'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003198550751309)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne %1, r\00E9f\00E9renc\00E9e par la facette %0, n''est pas disponible ou n''est pas autoris\00E9e.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813889462751252)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner les filtres \00E0 afficher')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940356794751290)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 r\00E9sultats')
,p_is_js_message=>true
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940492361751290)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 s\00E9lectionn\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943214763751291)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtres courants'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818822198751253)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La recherche \00E0 facettes n\00E9cessite une source de donn\00E9es au niveau de la r\00E9gion.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822568727751255)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste de filtres'
,p_is_js_message=>true
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001682946751308)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nombre limite de valeurs distinctes (%0) d\00E9pass\00E9 pour la facette %1.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987915812751304)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'La facette %0 n''est pas prise en charge pour les colonnes DATE ou TIMESTAMP.'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986058734751304)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer %0'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860649799751266)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 (Filtre appliqu\00E9)')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986102457751304)
,p_name=>'APEX.FS.GO'
,p_message_language=>'fr-ca'
,p_message_text=>'Aller'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856169799751265)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'fr-ca'
,p_message_text=>'contient %0'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987589624751304)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00E9gal \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855803522751265)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('sup\00E9rieur \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855954658751265)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('sup\00E9rieur ou \00E9gal \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855585381751264)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('inf\00E9rieur \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855732651751264)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('inf\00E9rieur ou \00E9gal \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855074039751264)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'fr-ca'
,p_message_text=>'ne contient pas %0'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840852549751260)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('diff\00E9rent de %0')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855102339751264)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'fr-ca'
,p_message_text=>'ne commence pas par %0'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856013333751265)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'fr-ca'
,p_message_text=>'commence par %0'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854159264751264)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lection de facette')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829917732751257)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le pr\00E9fixe de filtre "%0" n''est pas valide pour la facette "%1".')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828315039751256)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9fixe de filtre manquant pour la facette "%0".')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862582221751267)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Op\00E9rateur')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844431833751261)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'fr-ca'
,p_message_text=>'contient'
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843499384751261)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844120534751261)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('sup\00E9rieur \00E0')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844211501751261)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('sup\00E9rieur ou \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843865854751261)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('inf\00E9rieur \00E0')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843931742751261)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('inf\00E9rieur ou \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854971727751264)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'fr-ca'
,p_message_text=>'ne contient pas'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843669375751261)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('diff\00E9rent de')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854894862751264)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'fr-ca'
,p_message_text=>'ne commence pas par'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844389429751261)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'fr-ca'
,p_message_text=>'commence par'
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862963066751267)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le type de donn\00E9es %0 (%1) n''est pas pris en charge pour la facette Champ d''entr\00E9e.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829842186751257)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le filtre "%0" n''est pas pris en charge pour la facette "%1" (type de donn\00E9es %2).')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862433747751267)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987720750751304)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune colonne de recherche n''a \00E9t\00E9 fournie pour la facette %0')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813925142751252)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'fr-ca'
,p_message_text=>'Plus de filtres'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940537653751290)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9but de l''intervalle')
,p_is_js_message=>true
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987235989751304)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987362581751304)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Sup\00E9rieur \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987433963751304)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Inf\00E9rieur \00E0 %0')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940634979751290)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'fr-ca'
,p_message_text=>'Fin de l''intervalle'
,p_is_js_message=>true
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005279014751309)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''\00E9l\00E9ment de LDV #%2 ("%1") de la facette d''intervalle %0 n''est pas valide (s\00E9parateur "|" manquant).')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987655975751304)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''entr\00E9e manuelle n''est actuellement pas prise en charge pour la facette d''intervalle %0, car la colonne est de type DATE ou TIMESTAMP.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986974319751304)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00E0')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850566590751263)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le graphique'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936989600751289)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986348390751304)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986286199751304)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher...'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987110656751304)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('- S\00E9lectionner -')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850342877751263)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher le graphique'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986729905751304)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher moins'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138986823733751304)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout afficher'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987031758751304)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 \00E9toiles et plus')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942234999751291)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer les suggestions'
,p_is_js_message=>true
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138987840105751304)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'La facette Champ de texte %0 n''est actuellement prise en charge que pour les colonnes de type NUMBER.'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813349064751252)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nombre total de rang\00E9es')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003208133751309)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le type de donn\00E9es %0 (%1) n''est pas pris en charge pour la recherche \00E0 facettes.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933446337751288)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('En-t\00EAte masqu\00E9')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995721093751307)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Acc\00E9der \00E0 l''erreur')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951717645751293)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Agr\00E9ger.')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879618556751272)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('En-t\00EAte vide')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961034570751296)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9duire la commande BREAK')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951857188751293)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Commande BREAK.'
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960980505751296)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9velopper la commande BREAK')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960727174751296)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 rang\00E9es supprim\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029848419751317)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Identit\00E9 en double')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822786944751255)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'fr-ca'
,p_message_text=>'Passage au mode de modification'
,p_is_js_message=>true
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948692472751292)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Premier'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821535789751254)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Masquer la bo\00EEte de dialogue')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820597294751254)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Contenu de la cellule de d\00E9bordement flottante')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821887704751254)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Afficher le contenu de d\00E9bordement')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896055762751277)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'fr-ca'
,p_message_text=>' Pied de page de la grille'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952068582751294)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('En-t\00EAte de groupe')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951954987751293)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('En-t\00EAte.')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948752471751292)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Dernier'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822932819751255)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'fr-ca'
,p_message_text=>'Sortie du mode de modification'
,p_is_js_message=>true
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847612501751262)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout charger'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970533893751299)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher plus'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948427663751292)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952111362751294)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9es de page')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861251489751266)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'fr-ca'
,p_message_text=>'Page %0'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948874595751293)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948947318751293)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 - %1 de %2'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005865731751310)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lection de page')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896334433751277)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'fr-ca'
,p_message_text=>'Pagination'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948546281751292)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846572088751262)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Affichage par intervalle'
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879979849751272)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lection de rang\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029669971751317)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ajout\00E9')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029795659751317)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modifi\00E9')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038042363751319)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9quence de rang\00E9e de grille %0, colonne %1.')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038110580751319)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9quence de rang\00E9e de grille %0.')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029507665751317)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Supprim\00E9')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952319091751294)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('En-t\00EAte de rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879860825751272)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lection de rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847771816751262)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 %1 s\00E9lectionn\00E9')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947847117751292)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 cellules s\00E9lectionn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949037521751293)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 rang\00E9es s\00E9lectionn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991165693751305)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tout s\00E9lectionner')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884647501751273)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner toutes les rang\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960849313751296)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'fr-ca'
,p_message_text=>'Page %0'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952215129751294)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner une rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952503767751294)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tri\00E9 par ordre croissant %0')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952683166751294)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tri\00E9 par ordre d\00E9croissant %0')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947995594751292)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier par ordre croissant'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948292948751292)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier par ordre croissant %0'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948040566751292)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Trier par ordre d\00E9croissant')
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948335544751292)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Trier par ordre d\00E9croissant %0')
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138948111601751292)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'fr-ca'
,p_message_text=>'Ne pas trier'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813764378751252)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Options de tri'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896148129751277)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ic\00F4nes d''\00E9tat')
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896244543751277)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'fr-ca'
,p_message_text=>'Statut de la grille'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826088797751256)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825770787751256)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'fr-ca'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960627836751296)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'fr-ca'
,p_message_text=>'Total %0'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879435594751272)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La demande HTTP pour "%0" a \00E9chou\00E9.')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881071786751272)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne %0'
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881266370751272)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Colonne %0 et rang\00E9e %1')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881504970751272)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9j\00E0 dans la premi\00E8re colonne. Colonne %0 et rang\00E9e %1')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881414731751272)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9j\00E0 dans la premi\00E8re rang\00E9e. Colonne %0 et rang\00E9e %1')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027089275751316)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Figure dans %0 colonnes et %1 rang\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881643898751272)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9j\00E0 dans la derni\00E8re colonne. Colonne %0 et rang\00E9e %1')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881325042751272)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9j\00E0 dans la derni\00E8re rang\00E9e. Colonne %0 et rang\00E9e %1')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960587775751296)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Figure dans %0 rang\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881131122751272)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9e %0')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037837685751319)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Grille interactive %0'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944900581751291)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Actions'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945996802751292)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945817118751292)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ajouter une rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031418303751317)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Agr\00E9ger')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017033099751313)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Agr\00E9gation')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018778999751314)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976370013751301)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Toutes les colonnes de texte'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977581895751301)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Alternatif'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978694159751301)
,p_name=>'APEX.IG.AND'
,p_message_language=>'fr-ca'
,p_message_text=>'et'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998039921751307)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre approximatif de valeurs distinctes'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032436412751318)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre global approximatif de valeurs distinctes'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015659696751313)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'fr-ca'
,p_message_text=>'Aires'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017572567751313)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Croissant'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977683548751301)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Autorisation'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031539691751317)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'fr-ca'
,p_message_text=>'Automatique'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998447748751307)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'fr-ca'
,p_message_text=>'Moyenne'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032180606751318)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Moyenne globale'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015172774751312)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Titre de l''axe des \00E9tiquettes')
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015357064751313)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nombre de d\00E9cimales')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015240673751312)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Titre de l''axe des valeurs'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021389355751314)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Couleur d''arri\00E8re-plan')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015738451751313)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Barres'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972910630751300)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'fr-ca'
,p_message_text=>'compris entre'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022576771751315)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Les deux'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015868369751313)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Bulles'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946111794751292)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978591205751301)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Sensible \00E0 la casse')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033008130751318)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('(Sensible \00E0 la casse)')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004326715751309)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modifications enregistr\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946562980751292)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier la vue'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979622936751302)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Graphique'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976167053751301)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Votre interrogation d\00E9passe le maximum de %0 points de donn\00E9es par graphique. Appliquez un filtre pour r\00E9duire le nombre d''enregistrements de votre interrogation de base.')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944850078751291)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue de graphique'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953214467751294)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer'
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014683330751312)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021588580751314)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'fr-ca'
,p_message_text=>'Couleurs'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998801749751308)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aper\00E7u')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977978953751301)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945055330751291)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonnes'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906983539751280)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Actions de colonne'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906701581751280)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Actions pour la colonne "%0"'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023370712751315)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Objet de la colonne'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978085506751301)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'fr-ca'
,p_message_text=>'Complexe'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945248952751291)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'fr-ca'
,p_message_text=>'Calculer'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973593187751300)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'fr-ca'
,p_message_text=>'contient'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979809676751302)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Commande BREAK'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953042315751294)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'fr-ca'
,p_message_text=>'Copier dans le presse-papiers'
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953164115751294)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'fr-ca'
,p_message_text=>'Copier en-dessous'
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997826072751307)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997914960751307)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre de valeurs distinctes'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032320495751318)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre global de valeurs distinctes'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032286766751318)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre global'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029971455751317)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9er %0')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976594349751301)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Donn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023167291751315)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Type de donn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022780285751315)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Date'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004183424751309)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur de date non valide'
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974263611751300)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'jours'
,p_is_js_message=>true
,p_version_scn=>2704836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977288211751301)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tres par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977084192751301)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Type par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946060523751292)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024284128751315)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>'Voulez-vous supprimer ce rapport?'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981635178751302)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Supprimer la rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980438262751302)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Supprimer les rang\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017652574751313)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9croissant')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979375080751302)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9tails')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944506715751291)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue d\00E9taill\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006631077751310)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Sens'
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979026999751302)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973641403751300)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'fr-ca'
,p_message_text=>'ne contient pas'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973872977751300)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'fr-ca'
,p_message_text=>'ne commence pas par'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015982827751313)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'fr-ca'
,p_message_text=>'Torique'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980055526751302)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E9l\00E9charger')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870322398751269)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Donn\00E9es uniquement')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025275783751315)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner un format')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885440314751273)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le format de t\00E9l\00E9chargement %0 n''est pas activ\00E9.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018378236751313)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Agr\00E9gation en double')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018489486751313)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Commande BREAK en double'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981546912751302)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Dupliquer la rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980363147751302)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9es en double')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945626743751292)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017442322751313)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le graphique'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897990409751277)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier %0'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028803780751317)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le regroupement'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936081927751289)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 en mode de modification'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911625268751281)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>'La grille est en en mode de modification, n''appuyez pas sur la touche pour passer en mode d''affichage'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024866636751315)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'fr-ca'
,p_message_text=>'Copie conforme invisible (Cci)'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025074535751315)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'fr-ca'
,p_message_text=>'Message'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024763240751315)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'fr-ca'
,p_message_text=>'Copie (Cc)'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024413124751315)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Courriel envoy\00E9.')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024934691751315)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'fr-ca'
,p_message_text=>'Objet'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024695599751315)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Destinataire (\00C0)')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978740123751302)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971990591751299)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978885713751302)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'fr-ca'
,p_message_text=>'Expression'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023813967751315)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991088438751305)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fichier pr\00E9par\00E9. D\00E9but du t\00E9l\00E9chargement.')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953336178751294)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'fr-ca'
,p_message_text=>'Remplir'
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955596636751295)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Remplir la s\00E9lection avec')
,p_is_js_message=>true
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955482263751295)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Remplir la s\00E9lection')
,p_is_js_message=>true
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945123803751291)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978135041751301)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtres'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031816117751317)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer...'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017830615751313)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'fr-ca'
,p_message_text=>'Premier'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945313776751291)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976683647751301)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022401981751315)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'fr-ca'
,p_message_text=>'Masque de format'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024135425751315)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'fr-ca'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024064821751315)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'fr-ca'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935168817751288)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'fr-ca'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869009415751268)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'fr-ca'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981273882751302)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'fr-ca'
,p_message_text=>'Geler'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978966349751302)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fonctions et op\00E9rateurs')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016061706751313)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Entonnoir'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997755029751307)
,p_name=>'APEX.IG.GO'
,p_message_language=>'fr-ca'
,p_message_text=>'Aller'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972554289751300)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('sup\00E9rieur \00E0')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972644556751300)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('sup\00E9rieur ou \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979276028751302)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'fr-ca'
,p_message_text=>'Grille'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944327229751291)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue de grille'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018630873751314)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'fr-ca'
,p_message_text=>'Groupe'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979462970751302)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Regroupement'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944650471751291)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue de regroupement'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023061989751315)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de condition'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021908594751314)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('En-t\00EAte')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022188392751315)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Alignement de l''en-t\00EAte')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031723559751317)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027204560751316)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Vous pouvez ins\00E9rer, mettre \00E0 jour et supprimer des donn\00E9es directement dans cette grille interactive.</p>'),
'',
unistr('<p>Ins\00E9rez une nouvelle rang\00E9e en cliquant sur le bouton Ajouter une rang\00E9e.</p>'),
'',
unistr('<p>Modifiez des donn\00E9es existantes en cliquant deux fois sur une cellule sp\00E9cifique. Pour des travaux de modification plus importants, cliquez sur Modifier pour passer en mode de modification. En mode de modification, vous pouvez cliquer une seule fo')
||unistr('is sur une cellule ou utiliser le clavier pour modifier des cellules sp\00E9cifiques.</p>'),
'',
unistr('<p>Utilisez le menu Modifier pour dupliquer et supprimer des rang\00E9es. Pour activer le menu Modifier, utilisez les cases \00E0 cocher pour s\00E9lectionner une ou plusieurs rang\00E9es.</p>'),
'',
unistr('<p>Dupliquez une rang\00E9e s\00E9lectionn\00E9e en cliquant sur le menu Modifier et en s\00E9lectionnant Dupliquer les rang\00E9es. Supprimez une rang\00E9e s\00E9lectionn\00E9e en cliquant sur le menu Modifier et en s\00E9lectionnant Supprimer la rang\00E9e.</p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029321021751317)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fonctionnalit\00E9s de modification')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029484871751317)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Une grille interactive pr\00E9sente un jeu de donn\00E9es dans un rapport interrogeable et personnalisable. Vous pouvez effectuer de nombreuses op\00E9rations pour limiter les enregistrements retourn\00E9s et modifier le mode d''affichage des donn\00E9es.</p>'),
'',
unistr('<p>Utilisez le champ de recherche pour filtrer les enregistrements retourn\00E9s. Cliquez sur Actions pour acc\00E9der aux nombreuses options permettant de modifier la disposition du rapport, ou utilisez les menus d''en-t\00EAte de colonne sur les colonnes affich')
||unistr('\00E9es.</p>'),
'',
unistr('<p>Utilisez les param\00E8tres de rapport pour enregistrer vos personnalisations dans un rapport. Vous pouvez \00E9galement t\00E9l\00E9charger les donn\00E9es du rapport vers un fichier externe ou les envoyer par courriel \00E0 vous-m\00EAme ou \00E0 d''autres personnes.</p>'),
'',
'<p>Pour en savoir plus, consultez la section "Utilisation des rapports interactifs" dans le <em>Guide de l''utilisateur final d''Oracle APEX</em>.'))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029119297751317)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aper\00E7u')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027134490751316)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Vous pouvez personnaliser la grille interactive de sorte qu''elle affiche les donn\00E9es de diverses fa\00E7ons \00E0 l''aide des fonctionnalit\00E9s int\00E9gr\00E9es.</p>'),
'',
unistr('<p>Utilisez les menus d''en-t\00EAte de colonne ou le menu Actions pour d\00E9terminer les colonnes \00E0 afficher, dans quel ordre, et pour figer les colonnes. Vous pouvez \00E9galement d\00E9finir divers filtres de donn\00E9es et trier les donn\00E9es retourn\00E9es.</p>'),
'',
unistr('<p>Utilisez le bouton Vue (adjacent au champ de recherche) pour acc\00E9der \00E0 d''autres vues de donn\00E9es qui peuvent avoir \00E9t\00E9 d\00E9finies par le d\00E9veloppeur d''application. Vous pouvez \00E9galement cr\00E9er un graphique ou visualiser un graphique existant.</p>  '),
'',
unistr('<p><em>Note : Cliquez sur <strong>Aide</strong> dans les bo\00EEtes de dialogue de la grille interactive pour obtenir des informations plus d\00E9taill\00E9es sur la fonction s\00E9lectionn\00E9e.</em></p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029284577751317)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fonctionnalit\00E9s de production de rapports')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980219514751302)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur la grille interactive'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026074534751316)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour agr\00E9ger des colonnes. Les valeurs agr\00E9g\00E9es s''affichent en bas des donn\00E9es ou, si des commandes BREAK sont d\00E9finies, en bas de chaque commande.</p>'),
'',
unistr('<p><strong>Liste d''agr\00E9gations</strong><br>'),
unistr('La liste Agr\00E9gation affiche les agr\00E9gations d\00E9finies. D\00E9sactivez une agr\00E9gation existante en la d\00E9s\00E9lectionnant.<br>'),
unistr('Cliquez sur Ajouter ( &plus; ) pour cr\00E9er une agr\00E9gation ou sur Supprimer ( &minus; ) pour retirer une agr\00E9gation existante.</p>'),
'',
unistr('<p><strong>Param\00E8tres d''agr\00E9gation</strong><br>'),
unistr('Utilisez le formulaire \00E0 droite pour d\00E9finir l''agr\00E9gation.<br>'),
unistr('S\00E9lectionnez le nom de colonne et le type d''agr\00E9gation.<br>'),
unistr('Saisissez \00E9ventuellement une infobulle pour l''agr\00E9gation.<br>'),
unistr('Si vous avez d\00E9fini une commande BREAK, la s\00E9lection de <strong>Afficher la valeur globale</strong> affiche la moyenne globale, le total ou une valeur similaire en bas des donn\00E9es.</p>'),
'',
unistr('<p><em>Note : Acc\00E9dez \00E0 la bo\00EEte de dialogue Agr\00E9gation dans le menu Actions ou en cliquant sur l''en-t\00EAte de colonne et la somme ( &sum; ).</em></p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028231740751316)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aide sur l''agr\00E9gation')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026727331751316)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour d\00E9finir un graphique qui s''affiche dans une vue de donn\00E9es distincte.<br>'),
unistr('S\00E9lectionnez un type de graphique et des attributs de graphique.</p>'),
'<p><strong>Attributs de graphique</strong><br>',
'Les attributs de graphique disponibles varient selon le type de graphique.</p>',
'<p>',
'<ul>',
unistr('  <li>S\00E9lectionnez la colonne contenant la valeur pour l''attribut :'),
'    <ul>',
unistr('      <li>\00C9tiquette - Texte pour chaque point de donn\00E9es.</li>'),
unistr('      <li>Valeur - Donn\00E9es \00E0 repr\00E9senter.</li>'),
unistr('      <li>S\00E9rie - Pour d\00E9finir une interrogation dynamique \00E0 plusieurs s\00E9ries.</li>'),
unistr('      <li>Ouverture - Prix d''ouverture boursi\00E8re quotidien (graphiques boursiers uniquement).</li>'),
unistr('      <li>Cl\00F4ture - Prix de cl\00F4ture boursi\00E8re quotidien (graphiques boursiers uniquement).</li>'),
unistr('      <li>\00C9lev\00E9 - Valeur \00E9lev\00E9e (graphiques en banderole et boursiers uniquement).</li>'),
'      <li>Faible - Valeur basse (graphiques en banderole et boursiers uniquement).</li>',
'      <li>Volume - Volume boursier quotidien (graphiques boursiers uniquement).</li>',
'      <li>Cible : Valeur cible (graphique en entonnoir uniquement).</li>',
unistr('      <li>X - Valeur de l''axe des X (graphiques \00E0 bulles et en nuage de points uniquement).</li>'),
unistr('      <li>Y - Valeur de l''axe des Y (graphiques \00E0 bulles et en nuage de points uniquement).</li>'),
unistr('      <li>Z - Largeur des barres ou rayon des bulles (graphiques \00E0 barres, \00E0 bulles et en banderolle uniquement).</li>'),
'    </ul>',
'  </li>',
'  <li>Orientation - Verticale ou horizontale.</li>',
unistr('  <li>Agr\00E9gation - S\00E9lectionnez le mode d''agr\00E9gation des valeurs du graphique.</li>'),
unistr('  <li>Pile - Sp\00E9cifiez si les \00E9l\00E9ments de donn\00E9es sont empil\00E9s.</li>'),
unistr('  <li>Trier par - Indiquez si le graphique est tri\00E9 par \00E9tiquette ou valeur.'),
'    <ul>',
unistr('      <li>Sens - Indiquez si les donn\00E9es sont tri\00E9es par ordre croissant ou d\00E9croissant de valeurs.</li>'),
unistr('      <li>Valeurs nulles - Indiquez la fa\00E7on dont vous voulez que les enregistrements avec des valeurs nulles soient tri\00E9s par rapport aux enregistrements avec des valeurs non nulles.</li>'),
'    </ul>',
'  </li>',
unistr('  <li>Nombre de d\00E9cimales</li>'),
unistr('  <li>Titre de l''axe des \00E9tiquettes</li>'),
'  <li>Titre de l''axe des valeurs</li>',
'</ul>',
'</p>'))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028639995751316)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur le graphique'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025722354751316)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour s\00E9lectionner les colonnes \00E0 afficher et leur ordre d''affichage.</p>'),
'',
unistr('<p>Masquez une colonne en la d\00E9s\00E9lectionnant.<br>'),
unistr('R\00E9organisez les colonnes en cliquant sur D\00E9placer vers le haut ( &uarr; ) ou D\00E9placer vers le bas ( &darr; ).<br>'),
unistr('Utilisez le s\00E9lecteur de la liste d\00E9roulante pour r\00E9pertorier toutes les colonnes, les colonnes affich\00E9es ou les colonnes non affich\00E9es.</p>'),
'',
unistr('<p>Utilisez \00E9ventuellement le formulaire pour indiquer la largeur minimale d''une colonne en pixels.</p>'),
'',
unistr('<p><em>Note : Vous pouvez \00E9galement r\00E9organiser les colonnes affich\00E9es en cliquant sur la poign\00E9e de glissement (au d\00E9but de l''en-t\00EAte de colonne) et en d\00E9pla\00E7ant la colonne \00E0 gauche ou \00E0 droite. Vous pouvez aussi modifier la largeur des colonnes aff')
||unistr('ich\00E9es en s\00E9lectionnant le s\00E9parateur de colonnes, entre les en-t\00EAtes, et en le d\00E9pla\00E7ant vers la gauche ou la droite.</em></p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028596670751316)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur les colonnes'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026160665751316)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour d\00E9finir des colonnes suppl\00E9mentaires en fonction de calculs math\00E9matiques et fonctionnels r\00E9alis\00E9s sur les colonnes existantes.</p>'),
'',
unistr('<p><strong>Liste de calculs</strong><br>La liste Calcul affiche les calculs d\00E9finis. D\00E9sactivez un calcul existant en le d\00E9s\00E9lectionnant.<br>'),
'Cliquez sur Ajouter ( &plus; ) pour ajouter un nouveau calcul ou sur Supprimer ( &minus; ) pour retirer un calcul existant.</p>',
'',
unistr('<p><strong>Param\00E8tres de calcul</strong><br>Utilisez le formulaire pour d\00E9finir le calcul.<br>'),
unistr('Entrez les d\00E9tails de colonne, tels qu''un en-t\00EAte ou une \00E9tiquette et s\00E9lectionnez des param\00E8tres d''alignement.<br> '),
unistr('Utilisez la zone de texte Expression pour entrer les colonnes et les fonctions associ\00E9es pour le calcul.<br>'),
unistr('S\00E9lectionnez le type de donn\00E9es appropri\00E9 et \00E9ventuellement un masque de format pour la nouvelle colonne.</p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028162870751316)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur le calcul'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026457077751316)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour d\00E9finir une commande BREAK sur des colonnes.</p>'),
'',
'<p><strong>Liste de commandes BREAK</strong><br>',
unistr('La liste Commande BREAK affiche les commandes BREAK d\00E9finies. D\00E9sactivez une colonne de commande BREAK existante en la d\00E9s\00E9lectionnant.<br>'),
'Cliquez sur Ajouter ( &plus; ) pour inclure une nouvelle colonne dans la commande BREAK ou sur Supprimer ( &minus; ) pour retirer une colonne existante de la commande BREAK.<br>',
unistr('Pour r\00E9organiser les colonnes, cliquez sur D\00E9placer vers le haut ( &uarr; ) ou D\00E9placer vers le bas ( &darr; ) pour d\00E9placer la colonne s\00E9lectionn\00E9e vers le haut et vers le bas par rapport aux autres colonnes.</p>'),
'',
unistr('<p><strong>Param\00E8tres de commande BREAK</strong><br>'),
unistr('Utilisez le formulaire pour d\00E9finir la colonne de commande BREAK.<br>'),
unistr('S\00E9lectionnez une colonne de commande BREAK, le sens de tri et le mode d''organisation des colonnes nulles (colonnes sans valeur).</p>'),
'',
unistr('<p><em>Note : Lorsque vous affichez la grille interactive, vous pouvez d\00E9finir une commande BREAK en cliquant sur un en-t\00EAte de colonne et en s\00E9lectionnant l''ic\00F4ne de commande BREAK.</em></p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027892752751316)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur la commande BREAK'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026651905751316)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour t\00E9l\00E9charger toutes les rang\00E9es courantes dans un fichier externe. Le fichier comportera uniquement les colonnes actuellement affich\00E9es, \00E0 l''aide de tous les filtres et tris appliqu\00E9s aux donn\00E9es.</p>'),
'',
unistr('<p>S\00E9lectionnez le format de fichier et cliquez sur T\00E9l\00E9charger.<br>'),
unistr('Note : Le format CSV n''inclura pas le formatage de texte tel que les agr\00E9gats et les commandes BREAK.</p>'),
'',
unistr('<p>Pour envoyer le fichier par courriel, s\00E9lectionnez Envoyer en tant que courriel et entrez les d\00E9tails de courriel (Destinataire, Objet et Message).</p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027629973751316)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aide sur le t\00E9l\00E9chargement')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025838322751316)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour configurer des filtres de donn\00E9es qui limitent le nombre de rang\00E9es retourn\00E9es.</p>'),
'',
'<p><strong>Liste de filtres</strong><br>',
unistr('La liste Filtre affiche les filtres d\00E9finis. D\00E9sactivez un filtre existant en le d\00E9s\00E9lectionnant.<br>'),
unistr('Cliquez sur Ajouter ( &plus; ) pour cr\00E9er un filtre ou sur Supprimer ( &minus; ) pour retirer un filtre existant.</p>'),
'',
unistr('<p><strong>Param\00E8tres de filtre</strong><br>'),
unistr('Utilisez le formulaire pour d\00E9finir les propri\00E9t\00E9s de filtre.<br>'),
unistr('S\00E9lectionnez le type de filtre appropri\00E9 :<br>'),
unistr('&nbsp;&nbsp;&nbsp;Rang\00E9e - Filtrer un terme dans toute colonne filtrable.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Colonne : Filtrer une colonne sp\00E9cifique avec un op\00E9rateur et une valeur sp\00E9cifi\00E9s.</p>'),
'',
unistr('<p><em>Note : Lorsque vous affichez une grille interactive, vous pouvez d\00E9finir des filtres de rang\00E9e en les saisissant directement dans le champ de recherche. Cliquez sur S\00E9lectionner les colonnes \00E0 rechercher pour limiter la recherche \00E0 une colonne')
||unistr(' sp\00E9cifique. Vous pouvez \00E9galement ouvrir un menu En-t\00EAte de colonne et s\00E9lectionner une valeur pour cr\00E9er un filtre de colonne.</em></p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028457866751316)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur le filtrage'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026278013751316)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour voir les donn\00E9es telles qu''elles existaient \00E0 un moment donn\00E9 pr\00E9c\00E9dent.</p>'),
unistr('<p>Entrez le nombre de minutes dans le pass\00E9 pour ex\00E9cuter l''interrogation Flashback.</p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028040007751316)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur Flashback'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028756800751317)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur le regroupement'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026307408751316)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour mettre en surbrillance des rang\00E9es ou des colonnes de donn\00E9es en fonction de la condition entr\00E9e.</p>'),
'',
'<p><strong>Liste de mises en surbrillance</strong><br>',
unistr('La liste Mise en surbrillance affiche les mises en surbrillance d\00E9finies. D\00E9sactivez une mise en surbrillance existante en la d\00E9s\00E9lectionnant.<br>Cliquez sur Ajouter ( &plus; ) pour cr\00E9er une mise en surbrillance ou sur Supprimer ( &minus; ) pour ret')
||'irer une mise en surbrillance existante.</p>',
'',
unistr('<p><strong>Param\00E8tres de mise en surbrillance</strong><br>'),
unistr('Utilisez le formulaire pour d\00E9finir les propri\00E9t\00E9s de mise en surbrillance.<br>'),
unistr('Entrez le nom, s\00E9lectionnez Rang\00E9e ou Colonne, puis s\00E9lectionnez les codes couleur HTML pour le texte et l''arri\00E8re-plan.<br>'),
unistr('S\00E9lectionnez le <strong>type de condition</strong> appropri\00E9 pour mettre en surbrillance des donn\00E9es sp\00E9cifiques :<br>'),
unistr('&nbsp;&nbsp;&nbsp;Rang\00E9e - mise en surbrillance du terme dans toute colonne.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Colonne - mise en surbrillance dans une colonne sp\00E9cifique selon l''op\00E9rateur et la valeur sp\00E9cifi\00E9s.</p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027907629751316)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur la mise en surbrillance'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026567184751316)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour enregistrer les modifications que vous avez apport\00E9es \00E0 la disposition et \00E0 la configuration courantes de la grille.<br>'),
unistr('Les d\00E9veloppeurs d''application peuvent d\00E9finir plusieurs dispositions de rapports alternatifs. Lorsque cela est autoris\00E9, vous et les autres utilisateurs finaux pouvez enregistrer un rapport comme public, ce qui rend le rapport accessible \00E0 tous les ')
||unistr('autres utilisateurs de la grille. Vous pouvez \00E9galement enregistrer un rapport en tant que rapport priv\00E9 que vous seul pouvez consulter.</p>'),
unistr('<p>Effectuez une s\00E9lection parmi les types disponibles et entrez un nom pour le rapport enregistr\00E9.</p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027751990751316)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur le rapport'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025917527751316)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Utilisez cette bo\00EEte de dialogue pour d\00E9finir l''ordre d''affichage.</p>'),
'',
'<p><strong>Liste de tris</strong><br>',
unistr('La bo\00EEte de dialogue Tri affiche une liste des r\00E8gles de tri configur\00E9es.<br>'),
unistr('Cliquez sur Ajouter ( &plus ; ) pour cr\00E9er une colonne de tri ou sur Supprimer ( &minus ; ) pour retirer une colonne de tri.<br>'),
unistr('Cliquez sur D\00E9placer vers le haut ( &uarr ; ) et D\00E9placer vers le bas ( &darr ; ) pour d\00E9placer la colonne de tri s\00E9lectionn\00E9e vers le haut et vers le bas par rapport aux autres colonnes de tri.</p>'),
'',
unistr('<p><strong>Param\00E8tres de tri</strong><br>'),
unistr('S\00E9lectionnez une colonne de tri, le sens du tri et le mode d''organisation des colonnes nulles (colonnes sans valeur).</p>'),
'',
unistr('<p><em>Note : Les donn\00E9es peuvent \00EAtre tri\00E9es en fonction de colonnes qui ne sont pas affich\00E9es. Cependant, toutes les colonnes ne sont pas forc\00E9ment triables.</em><br>'),
unistr('<em>Vous pouvez trier les colonnes affich\00E9es en cliquant sur les fl\00E8ches vers le haut (par ordre croissant) ou vers le bas (par ordre d\00E9croissant) \00E0 la fin des en-t\00EAtes de colonne. Pour ajouter une autre colonne \00E0 un tri existant, maintenez la touche')
||unistr(' Maj enfonc\00E9e et cliquez sur la fl\00E8che vers le haut ou vers le bas.</em></p>')))
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028326329751316)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur le tri'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027596859751316)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur l''abonnement'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981106700751302)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'fr-ca'
,p_message_text=>'Masquer'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945524096751292)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Mettre en surbrillance'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014725805751312)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9lev\00E9')
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015504915751313)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Horizontal'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974101621751300)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'heures'
,p_is_js_message=>true
,p_version_scn=>2704836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979196441751302)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ic\00F4ne')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944405075751291)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue Ic\00F4ne')
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972352006751300)
,p_name=>'APEX.IG.IN'
,p_message_language=>'fr-ca'
,p_message_text=>'dans'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980781221751302)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tre inactif')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980807445751302)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tres inactifs')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988420169751304)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Une erreur interne est survenue lors du traitement de la demande de grille interactive.'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876315154751271)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Le type de filtre de colonne "%0" n''est pas pris en charge pour la colonne "%1".'
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139027371775751316)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Format de date non valide'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002188740751309)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La grille interactive ne prend pas en charge la d\00E9finition d''un filtre sur la colonne %0.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002038339751309)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 n''est pas un type de filtre valide pour d\00E9finir un filtre de grille interactive.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882985637751273)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Format num\00E9rique non valide')
,p_is_js_message=>true
,p_version_scn=>2704816
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030039366751317)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tre non valide')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030146268751317)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tres non valides')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021286794751314)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''option Trier par a \00E9t\00E9 r\00E9gl\00E9e \00E0 %0, mais aucune colonne n''a \00E9t\00E9 s\00E9lectionn\00E9e pour %0.')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018524168751313)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur non valide'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013648512751312)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Non affich\00E9')
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973189397751300)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'dans le dernier intervalle de'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973334711751300)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'dans le prochain intervalle de'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972296983751300)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas vide'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972105530751300)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'est vide'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022008461751315)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tiquette')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014075275751312)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tiquette')
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017906854751313)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'Dernier'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962454569751297)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Dernier jour'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962602728751297)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Derni\00E8re heure')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963166644751297)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Derni\00E8re minute')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962139886751297)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois dernier'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962266965751297)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Semaine derni\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962302118751297)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 derniers jours'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962564839751297)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 derni\00E8res heures')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963204863751297)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 derni\00E8res minutes')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963037472751297)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 derniers mois'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962994037751297)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 derni\00E8res semaines')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961965905751296)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 derni\00E8res ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962043508751297)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ann\00E9e derni\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022245047751315)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'fr-ca'
,p_message_text=>'Alignement des cellules'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022344257751315)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Utiliser le groupe pour'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972784116751300)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('inf\00E9rieur \00E0')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972865549751300)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('inf\00E9rieur ou \00E9gal \00E0')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016177051751313)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lin\00E9aire')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016267640751313)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lin\00E9aire avec aire')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022610180751315)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'fr-ca'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014863311751312)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Faible'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025188853751315)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9parez les diff\00E9rentes adresses par des virgules')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973940618751300)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('correspond \00E0 l''expression rationnelle')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998345426751307)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'fr-ca'
,p_message_text=>'Maximum'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032687084751318)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Maximum global'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998541696751307)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('M\00E9diane')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032739024751318)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('M\00E9diane globale')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998244229751307)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'fr-ca'
,p_message_text=>'Minimum'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974043049751300)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>'minutes'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999000775751308)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Minutes auparavant'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032543930751318)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Minimum global'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974454025751300)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'mois'
,p_is_js_message=>true
,p_version_scn=>2704836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981051252751302)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les donn\00E9es contiennent plus de %0 rang\00E9es, ce qui d\00E9passe le maximum autoris\00E9. Appliquez des filtres suppl\00E9mentaires pour voir les r\00E9sultats.')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006876790751310)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ID statique de la r\00E9gion doit \00EAtre sp\00E9cifi\00E9 car la page contient plusieurs grilles interactives.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977178035751301)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977305146751301)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport nomm\00E9')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961359229751296)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Prochain jour'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961156775751296)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>'Prochaine heure'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963399948751297)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'fr-ca'
,p_message_text=>'Prochaine minute'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961621871751296)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois prochain'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961532849751296)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>'Semaine prochaine'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961413436751296)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 prochains jours'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961270901751296)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 prochaines heures'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963466857751297)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 prochaines minutes'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962791053751297)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 prochains mois'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138962846874751297)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 prochaines semaines'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961836551751296)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 prochaines ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138961704685751296)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ann\00E9e prochaine')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973013490751300)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'fr-ca'
,p_message_text=>'non compris entre'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972092766751299)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('diff\00E9rent de')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036803451751319)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La r\00E9gion portant l''ID %0 n''est pas une r\00E9gion de grille interactive ou n''existe pas dans l''application %1.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138972410060751300)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'pas dans'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973286712751300)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'pas dans le dernier intervalle de'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973406440751300)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'pas dans le prochain intervalle de'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980920230751302)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune donn\00E9e trouv\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017713908751313)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeurs nulles'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022848388751315)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Num\00E9rique')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018024725751313)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018135823751313)
,p_name=>'APEX.IG.ON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971296616751299)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a 1 minute'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025635412751316)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ouvrir le s\00E9lecteur de couleur : %0')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014536327751312)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Ouvrir'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978206058751301)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Op\00E9rateur')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013995745751312)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Orientation'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016341926751313)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'fr-ca'
,p_message_text=>'Secteurs'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979589429751302)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tableau crois\00E9 dynamique')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944773352751291)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue de tableau crois\00E9 dynamique')
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025554046751316)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9parer les valeurs par "%0"')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016441592751313)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Polaire'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021721564751314)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Centre'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021803530751314)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'fr-ca'
,p_message_text=>'Fin'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021614086751314)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9but')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977430301751301)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'fr-ca'
,p_message_text=>'Principal'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977754885751301)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Principal par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994278227751306)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport principal'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867821292751268)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Inclure des balises d''accessibilit\00E9')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865286172751267)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'fr-ca'
,p_message_text=>'Paysage'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865394975751267)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'fr-ca'
,p_message_text=>'Portrait'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865192463751267)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'fr-ca'
,p_message_text=>'Orientation de la page'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865097862751267)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'fr-ca'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864989456751267)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'fr-ca'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868003644751268)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Personnalis\00E9')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864792327751267)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'fr-ca'
,p_message_text=>'Grand format'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864687493751267)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'fr-ca'
,p_message_text=>'Lettre'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864827817751267)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tablo\00EFd')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864585098751267)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'fr-ca'
,p_message_text=>'Taille de la page'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830188679751257)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le texte enrichi'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016514624751313)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Radar'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016690843751313)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Banderole'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026835749751316)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'fr-ca'
,p_message_text=>'Actualiser'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981749466751302)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Actualiser la rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980540822751302)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Actualiser les rang\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985744107751304)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La r\00E9gion de la grille interactive n''existe pas dans l''application %0, la page %1 et la r\00E9gion %2.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946243931751292)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer %0'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976857255751301)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036032758751319)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport supprim\00E9')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035728624751319)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport alternatif enregistr\00E9 pour tous les utilisateurs')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035610024751319)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport par d\00E9faut enregistr\00E9 pour tous les utilisateurs')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035948570751319)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport priv\00E9 enregistr\00E9')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035896568751319)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport public enregistr\00E9 pour tous les utilisateurs')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985841734751304)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La grille interactive enregistr\00E9e avec le nom %0 n''existe pas.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971147040751299)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Donn\00E9es de la grille il y a %0 minutes')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971041800751299)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Donn\00E9es de la grille il y a 1 minute')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906552635751280)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>'Le rapport de grille interactive n''existe pas.'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139029048818751317)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport - Modifier'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985611230751304)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La grille interactive enregistr\00E9e avec l''ID %0 n''existe pas.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139028959419751317)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport - Enregistrer sous'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946330404751292)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tres de la grille')
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036937646751319)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La grille interactive enregistr\00E9e avec l''ID statique %0 n''existe pas.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031981551751317)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue de rapport'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945456576751291)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser')
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981873649751302)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler les modifications'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980624516751302)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9tablir les rang\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138977835646751301)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976790472751301)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9es par page')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036588138751319)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Actions de rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037795867751319)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Actions pour la rang\00E9e %0')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138945715566751292)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990897078751305)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('enregistr\00E9')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895469522751276)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport enregistr\00E9 : %0')
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943932191751291)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapports enregistr\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944001436751291)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917571752751283)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Un rapport enregistr\00E9 nomm\00E9 %0 existe d\00E9j\00E0. Entrez un nouveau nom.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944142255751291)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Priv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138944273265751291)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'fr-ca'
,p_message_text=>'Public'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031622257751317)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer sous'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979921985751302)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Enregistrer les param\00E8tres du rapport')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016783401751313)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Nuage de points'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943814584751291)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023973524751315)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher : Toutes les colonnes de texte'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943701577751291)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher : %0'
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023248392751315)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rechercher : Texte int\00E9gral')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970952960751299)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher ''%0'''
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013359304751312)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('- S\00E9lectionner -')
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953484513751294)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lection')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006522392751310)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner 1 rang\00E9e dans la r\00E9gion parent')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943607305751291)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner les colonnes \00E0 rechercher')
,p_is_js_message=>true
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036289938751319)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Actions de s\00E9lection')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953624782751294)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lection de cellule')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953583762751294)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lection de rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024514372751315)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoyer en tant que courriel'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017172782751313)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9rie')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941350179751290)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher'
,p_is_js_message=>true
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996585953751307)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher la valeur globale'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981446102751302)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue d''une seule rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138979717554751302)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017239319751313)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier par'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036637543751319)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous ne pouvez d\00E9finir qu''un seul tri par colonne.')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036482163751319)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018280736751313)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Empiler'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138973735523751300)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'fr-ca'
,p_message_text=>'commence par'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139016816927751313)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'fr-ca'
,p_message_text=>'Boursier'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936133482751289)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tirer les colonnes en largeur')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138980146706751302)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Abonnement'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998176154751307)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'fr-ca'
,p_message_text=>'Somme'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037920328751319)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'fr-ca'
,p_message_text=>'Grille interactive. Rapport : %0, Vue : %1.'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139032006679751318)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Somme globale'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015069619751312)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Cible'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021470383751314)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Couleur du texte'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946434644751292)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activer/d\00E9sactiver')
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828554810751256)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Grille'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996449136751307)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'fr-ca'
,p_message_text=>'Infobulle'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976901526751301)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981360687751302)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9geler')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978401228751301)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Unit\00E9')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139024323138751315)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Des modifications ne sont pas enregistr\00E9es. Voulez-vous continuer?')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138978376486751301)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014127363751312)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019070214751314)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur est obligatoire.'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004233858751309)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur (le fuseau horaire ne peut pas \00EAtre modifi\00E9)')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139022902855751315)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'fr-ca'
,p_message_text=>'Texte'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139015494451751313)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Vertical'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976434318751301)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911555664751281)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>'La grille est en mode d''affichage, appuyez sur la touche pour modifier'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013437338751312)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Affich\00E9')
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014993911751312)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Volume'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974382397751300)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>'semaines'
,p_is_js_message=>true
,p_version_scn=>2704836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013505288751312)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Largeur de colonne minimale (pixel)'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965565821751298)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 compris entre %1 et %2'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965287118751297)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 contient %1'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965387351751298)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 ne contient pas %1'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940719046751290)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 ne commence pas par %1'
,p_is_js_message=>true
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964039797751297)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 \00E9gal \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964223320751297)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 sup\00E9rieur \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964387633751297)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 sup\00E9rieur ou \00E9gal \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965028640751297)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 dans %1'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966216152751298)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours des %1 derniers jours'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966094398751298)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours des %1 derni\00E8res heures')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965878124751298)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours des %1 derni\00E8res minutes')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966602419751298)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours des %1 derniers mois'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966486585751298)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours des %1 derni\00E8res semaines')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966823764751298)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours des %1 derni\00E8res ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966189170751298)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours du dernier jour'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965944259751298)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours de la derni\00E8re heure')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965733661751298)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours de la derni\00E8re minute')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966552225751298)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours du mois dernier'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966396736751298)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours de la semaine derni\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966765460751298)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours de la derni\00E8re semaine')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968610908751298)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours des %1 prochains jours'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968418028751298)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours des %1 prochaines heures'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968289076751298)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours des %1 prochaines minutes'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969026219751299)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours des %1 prochains mois'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968839960751299)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours des %1 prochaines semaines'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969247412751299)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours des %1 prochaines ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968575710751298)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours du prochain jour'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968319097751298)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours de la prochaine heure'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968157391751298)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours de la prochaine minute'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968921463751299)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours du prochain mois'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968791270751299)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 au cours de la semaine prochaine'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969171747751299)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 au cours de l''ann\00E9e prochaine')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964738162751297)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 n''est pas vide'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964630405751297)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 est vide'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964491580751297)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 inf\00E9rieur \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964527692751297)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 inf\00E9rieur ou \00E9gal \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964889884751297)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 semblable \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965403452751298)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 correspond \00E0 l''expression rationnelle %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971306841751299)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 minutes'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965662204751298)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 non compris entre %1 et %2'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964120786751297)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 diff\00E9rent de %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138965171590751297)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas dans %1'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967410446751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours des %1 derniers jours'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967203764751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours des %1 derni\00E8res heures')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967034563751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours des %1 derni\00E8res minutes')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967810435751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours des %1 derniers mois'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967685591751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours des %1 derni\00E8res semaines')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138968000875751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours des %1 derni\00E8res ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967364541751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours du dernier jour'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967186172751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours de la derni\00E8re heure')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138966939083751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours de la derni\00E8re minute')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967794240751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours du mois dernier'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967547561751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours de la semaine derni\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138967947353751298)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours de la derni\00E8re ann\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969810624751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours des %1 prochains jours'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969689036751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours des %1 prochaines heures'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969461472751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours des %1 prochaines minutes'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970226934751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours des %1 prochains mois'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970052691751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours des %1 prochaines semaines'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970470098751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours des %1 prochaines ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969732571751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours du prochain jour'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969595676751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours de la prochaine heure'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969313075751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours de la prochaine minute'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970113679751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours du prochain mois'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138969958881751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 pas au cours de la semaine prochaine'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970302167751299)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 pas au cours de l''ann\00E9e prochaine')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138964993328751297)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 non semblable \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971840356751299)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 commence par %1'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014276521751312)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974509791751300)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ann\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014378951751312)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139014406559751312)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023452217751315)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'fr-ca'
,p_message_text=>'Lundi 12 Janvier 2016'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023586020751315)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'fr-ca'
,p_message_text=>'Janvier'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023619036751315)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a 16 heures'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139023757462751315)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'fr-ca'
,p_message_text=>'dans 16 heures'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841748569751260)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833731845751258)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Glissez l''image dans le cadre et repositionnez-la \00E0 l''aide du curseur de zoom.</p>'),
'',
unistr('<p>Dans l''outil de recadrage d''image, vous pouvez effectuer les op\00E9rations suivantes :</p>'),
'<ul>',
unistr('    <li>Fl\00E8che vers la gauche : D\00E9placer l''image vers la gauche*</li>'),
unistr('    <li>Fl\00E8che vers le haut : D\00E9placer l''image vers le haut*</li>'),
unistr('    <li>Fl\00E8che vers la droite : D\00E9placer l''image vers la droite*</li>'),
unistr('    <li>Fl\00E8che vers le bas : D\00E9placer l''image vers le bas*</li>'),
'    <li>I : Effectuer un zoom avant</li>',
unistr('    <li>O : Effectuer un zoom arri\00E8re</li>'),
'    <li>L : Faire pivoter vers la gauche</li>',
'    <li>R : Faire pivoter vers la droite</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Maintenez la touche Maj pour un d\00E9placement plus rapide</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833979242751258)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur l''option Rogner l''image'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841840641751260)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834221480751258)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Rogner l''image'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841999499751260)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer le curseur pour ajuster le niveau de zoom')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871551723751269)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de fichier non valide. Types de fichier pris en charge : %0.'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005905866751310)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'fr-ca'
,p_message_text=>'Parcourir'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005635779751310)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner un fichier')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005714064751310)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner des fichiers')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871311758751269)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Glisser-d\00E9poser')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871727957751269)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Glisser-d\00E9poser les fichiers')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873146897751270)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner un fichier ou d\00E9poser un fichier ici.')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873291619751270)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner des fichiers ou d\00E9poser des fichiers ici.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873334857751270)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner un fichier ou d\00E9poser un fichier ici.')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873443052751270)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner des fichiers ou d\00E9poser des fichiers ici.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871655920751269)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 fichiers'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871456778751269)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'fr-ca'
,p_message_text=>'Fichier trop volumineux. La taille maximale de fichier est %0.'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851944338751263)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les chargements de fichiers multiples ne sont pas autoris\00E9s.')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834857713751258)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840344053751260)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Adresse obligatoire.'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839295061751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'fr-ca'
,p_message_text=>'Ville'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839693235751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'fr-ca'
,p_message_text=>'Code de pays'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839353929751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Num\00E9ro de maison')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840222362751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'fr-ca'
,p_message_text=>'Latitude'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840105943751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'fr-ca'
,p_message_text=>'Longitude'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840070099751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'fr-ca'
,p_message_text=>'Aff. sur la carte'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839795056751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'fr-ca'
,p_message_text=>'Score'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839403888751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'fr-ca'
,p_message_text=>'Code postal'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839534740751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tat')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839183955751260)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'fr-ca'
,p_message_text=>'Rue'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839000115751260)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9sultats du g\00E9ocodage')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870538375751269)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('G\00E9ocod\00E9')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870665414751269)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Non g\00E9ocod\00E9')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839983229751260)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Carte'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138839855615751260)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune adresse trouv\00E9e.')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840490504751260)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 obligatoire.'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138946681878751292)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 ou %1 est requis.'
,p_is_js_message=>true
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036148057751319)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir le texte d''aide pour %0.'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842106840751260)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner une image')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842216956751260)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner des images')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842052209751260)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E9l\00E9charger')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842388603751261)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Glisser-d\00E9poser')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842428219751261)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Glisser-d\00E9poser des images')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842548683751261)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner une image ou d\00E9poser une image ici.')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842677456751261)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner des images ou d\00E9poser des images ici.')
,p_is_js_message=>true
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842782800751261)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner une image ou d\00E9poser une image ici.')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842835936751261)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner des images ou d\00E9poser des images ici.')
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927589831751286)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionn\00E9')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927647901751286)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9s\00E9lectionn\00E9')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955164413751294)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Zone combin\00E9e en lecture seule vide')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952959985751294)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'fr-ca'
,p_message_text=>'Zone de liste en lecture seule vide'
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952750212751294)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Zone combin\00E9e en lecture seule')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138952881042751294)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'fr-ca'
,p_message_text=>'Zone de liste en lecture seule'
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868511538751268)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur #LABEL# ne figure pas dans l''intervalle valide compris entre %0 et %1.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868623063751268)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'fr-ca'
,p_message_text=>'#LABEL# n''est pas un multiple de %0.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955905278751295)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'fr-ca'
,p_message_text=>'Basculement en lecture seule'
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896584313751277)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'fr-ca'
,p_message_text=>'Modification en lecture seule avec un lien'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868159086751268)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'#LABEL# doit correspondre aux valeurs %0 et %1.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868319138751268)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Non'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954685332751294)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954754460751294)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activ\00E9')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868222227751268)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Oui'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876173389751271)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lecteur de langue')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812571069751252)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ajouter une entr\00E9e')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989395458751305)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989442504751305)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812655195751252)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Entr\00E9es s\00E9lectionn\00E9es')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993148563751306)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Avanc\00E9')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993488871751306)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993204919751306)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'fr-ca'
,p_message_text=>'Commun'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993543238751306)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Options de mod\00E8le en direct')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994167062751306)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les options de mod\00E8le ne sont pas disponibles car ce composant n''est pas affich\00E9 sur la page.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993075887751306)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune option de mod\00E8le n''a \00E9t\00E9 trouv\00E9e.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993317105751306)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847148789751262)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer le cercle'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849506693751263)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le fichier de styles personnalis\00E9s n''est pas un fichier JSON valide.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847450130751262)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'fr-ca'
,p_message_text=>'Outil Distance'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847210305751262)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Dessiner un cercle'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827084086751256)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Emplacement courant'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833430153751258)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les coordonn\00E9es de la position initiale ne sont pas valides.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822423899751255)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La position initiale doit \00EAtre une g\00E9om\00E9trie de type point.')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831033678751257)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'fr-ca'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826207694751256)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'fr-ca'
,p_message_text=>'Couche'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996636564751307)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Couche : %0'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845469099751261)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'fr-ca'
,p_message_text=>'Carte'
,p_is_js_message=>true
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815156410751252)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'fr-ca'
,p_message_text=>'Messages'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831281893751257)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'fr-ca'
,p_message_text=>'milles'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995626587751307)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les donn\00E9es contiennent plus de %0 rang\00E9es, ce qui d\00E9passe le nombre maximal autoris\00E9.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825511627751255)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Conditions</a> &nbsp;&nbsp; Donn\00E9es de la carte &copy; 2021 HERE')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822119071751254)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le type de donn\00E9es SDO_GEOMETRY n''est pas disponible dans cette base de donn\00E9es.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825650310751256)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; contributeurs OpenStreetMap</a>'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850258769751263)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; contributeurs OpenStreetMap</a>'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826467048751256)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'fr-ca'
,p_message_text=>'Points'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996717789751307)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 points'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847368004751262)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'fr-ca'
,p_message_text=>'Zoom sur le rectangle'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847061772751262)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826829253751256)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser l''azimut \00E0 Nord')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941691552751290)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'fr-ca'
,p_message_text=>'Basculer en mode 2D'
,p_is_js_message=>true
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941718154751290)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'fr-ca'
,p_message_text=>'Basculer en mode 3D'
,p_is_js_message=>true
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846912317751262)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activer/d\00E9sactiver l''avis de droit d''auteur')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847585085751262)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'fr-ca'
,p_message_text=>'Distance totale'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826599415751256)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'Zoom avant'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826779216751256)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Zoom arri\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991293304751305)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'fr-ca'
,p_message_text=>'Gras'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992179138751306)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Image'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991721842751305)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Code ins\00E9r\00E9')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004466644751309)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ins\00E9rer une image')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004540150751309)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ins\00E9rer un lien')
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991306001751305)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'fr-ca'
,p_message_text=>'Italique'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005102289751309)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'fr-ca'
,p_message_text=>'Lien'
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992038553751306)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991998052751305)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Liste tri\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991441925751305)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aper\00E7u')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991586850751305)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Il n''y a rien \00E0 pr\00E9visualiser')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991684538751305)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Barr\00E9')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138991823450751305)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Liste non tri\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970771243751299)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'courant'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139026942558751316)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Plus...'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970685898751299)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'fr-ca'
,p_message_text=>'Chargement'
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884887601751273)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'fr-ca'
,p_message_text=>'Bouton Fractionner'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884718189751273)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Menu Fractionner'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001740488751308)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>'Message d''avis'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825842607751256)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucun objet %0 trouv\00E9')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975782809751301)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur pour #LABEL# doit \00EAtre un nombre inf\00E9rieur ou \00E9gal \00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975877045751301)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur pour #LABEL# doit \00EAtre un nombre valide.')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975999777751301)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur pour #LABEL# ne correspond pas au format num\00E9rique %0 (exemple : %1).')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975629464751301)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur pour #LABEL# doit \00EAtre un nombre sup\00E9rieur ou \00E9gal \00E0 %0.')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975597781751301)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur pour #LABEL# doit \00EAtre un nombre compris entre %0 et %1.')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138970805439751299)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('s''ouvre dans une nouvelle fen\00EAtre')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920699133751284)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cette page a d\00E9j\00E0 \00E9t\00E9 soumise et ne peut pas \00EAtre soumise \00E0 nouveau.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902072711751278)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>'L''application "%0", page "%1", est introuvable.'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937509990751289)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Une valeur doit \00EAtre indiqu\00E9e pour #LABEL#.')
,p_is_js_message=>true
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828215686751256)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'fr-ca'
,p_message_text=>'Masquer le mot de passe'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828109905751256)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher le mot passe'
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875706870751270)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher'
,p_is_js_message=>true
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989794511751305)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989654114751305)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher %0'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989901945751305)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989844825751305)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866504465751268)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Entrez un terme de recherche comportant au moins %0 caract\00E8res.')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942832875751291)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste de valeurs contextuelle : %0'
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866632378751268)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'fr-ca'
,p_message_text=>'Entrez un terme de recherche.'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813692412751252)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste de valeurs'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866401223751268)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucun r\00E9sultat trouv\00E9.')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866375490751268)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer %0'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963560117751297)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'fr-ca'
,p_message_text=>'Terme de recherche'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989508300751305)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815766865751253)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('N\00E9cessite %0.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828039003751256)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors de l''impression du rapport.'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838853256751259)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''imprimer le document \00E0 l''aide du serveur d''impression configur\00E9.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861514961751266)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Une erreur est survenue durant l''\00E9valuation du param\00E8tre %0 lors de l''appel de %1. Pour plus de d\00E9tails, consultez le journal d''erreurs.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000211859751308)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'fr-ca'
,p_message_text=>'Traitement'
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859366651751266)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860447155751266)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ce site Web dispose d''une fonctionnalit\00E9 d''application. Installez-la sur votre appareil pour une exp\00E9rience optimale.')
,p_version_scn=>2704802
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861713524751266)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863326340751267)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Installer cette application'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848145604751262)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Votre appareil ou votre navigateur ne semble pas prendre en charge l''installation des applications Web progressives pour le moment.'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843236091751261)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('1. Touchez l''ic\00F4ne <strong>Partager</strong>')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843389521751261)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('2. Faites d\00E9filer l''\00E9cran et touchez <strong>Ajouter \00E0 \00E9cran d''accueil</strong>')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138859761673751266)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'fr-ca'
,p_message_text=>'3. Touchez <strong style="color:#007AE1;">Ajouter</strong> pour confirmer'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858860539751265)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'fr-ca'
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
'    <h1>Connexion impossible</h1>',
unistr('    <p>Il semble y avoir un probl\00E8me de r\00E9seau. V\00E9rifiez votre connexion et r\00E9essayez.</p>'),
unistr('    <button type="button">R\00E9essayer</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858730668751265)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Connexion impossible'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905348249751279)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cet appareil ne prend pas en charge l''activation des avis pouss\00E9s.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910894282751281)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lections rapides pour %0')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910722081751281)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lien de s\00E9lection rapide')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884592429751273)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Bouton radio masqu\00E9')
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828630939751256)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue d''une seule rang\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011396405751311)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956601584751295)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Toute la journ\00E9e')
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034280205751318)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoyer une invitation'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034017248751318)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Options'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958474192751295)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue quotidienne pour toute la journ\00E9e ')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958217482751295)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue quotidienne pour les donn\00E9es avec l''heure')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002424255751309)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Jour'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997450427751307)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Description'
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880901780751272)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'fr-ca'
,p_message_text=>'CSV'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880748953751272)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'fr-ca'
,p_message_text=>'iCal'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880687099751272)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'fr-ca'
,p_message_text=>'PDF'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880801865751272)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'fr-ca'
,p_message_text=>'XML'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880385329751272)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Date de fin'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880598299751272)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nom de l''\00E9v\00E9nement')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034140381751318)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Invitation'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002531739751309)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002229839751309)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004843414751309)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018897140751314)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucun \00E9v\00E9nement')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034417207751318)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modifier un \00E9v\00E9nement existant.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034387932751318)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoi d''une invitation par courriel.'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004912371751309)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012634813751312)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoyer un courriel'
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012463821751312)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoyer un courriel'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035000532751318)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Tous les champs sont obligatoires.'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034951326751318)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoyer une invitation'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033934791751318)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'fr-ca'
,p_message_text=>'Objet'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012591842751312)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C0')
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880483617751272)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Date de d\00E9but')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010609445751311)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'fr-ca'
,p_message_text=>'Formulaire sur %0'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958029649751295)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'fr-ca'
,p_message_text=>'Heure'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005042132751309)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Aujourd''hui'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003094200751309)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002330832751309)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>'Semaine'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958314486751295)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue hebdomadaire pour toute la journ\00E9e')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958114424751295)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue hebdomadaire pour les donn\00E9es avec l''heure')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002943580751309)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ann\00E9e')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002632879751309)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonnes...'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002756754751309)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'fr-ca'
,p_message_text=>'Charger plus...'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932117933751287)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873624152751270)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'fr-ca'
,p_message_text=>'Charger plus...'
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875944688751271)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher...'
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139002857218751309)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'fr-ca'
,p_message_text=>'Charger plus...'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004743398751309)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ID r\00E9gion %0 introuvable.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875875153751270)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune donn\00E9e d\00E9tect\00E9e')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903337237751279)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de r\00E9initialiser la pagination de r\00E9gion.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867003593751268)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors de la d\00E9finition de pagination de r\00E9gion.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996829817751307)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonnes...'
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851330956751263)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le chargement diff\00E9r\00E9 est incompatible avec les emplacements dans %0, qui est une r\00E9gion unique (partielle). Vous devez d\00E9sactiver le chargement diff\00E9r\00E9 pour cette r\00E9gion ou d\00E9placer les composants d''emplacement dans une autre r\00E9gion.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846656749751262)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mod\00E8le de groupe est manquant dans le composant de mod\00E8le pour %0.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841615677751260)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 est une r\00E9gion unique (partielle) qui a retourn\00E9 plusieurs rang\00E9es.')
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004628181751309)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le type de r\00E9gion %0 n''est pas pris en charge.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866907105751268)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du rendu de la r\00E9gion "#COMPONENT_NAME#".')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937686755751289)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Une valeur doit \00EAtre indiqu\00E9e pour #COLUMN_HEADER#.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819278018751254)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier la disposition du rapport.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033573018751318)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0, \00E9diteur de texte enrichi')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939784196751290)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le balisage HTML de texte enrichi d\00E9passe la longueur maximale de l''\00E9l\00E9ment (r\00E9elle : %0, autoris\00E9e : %1 caract\00E8res)')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849187431751263)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9diteur de texte enrichi en lecture seule')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849025265751263)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9diteur de texte enrichi')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848820861751262)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'fr-ca'
,p_message_text=>'Alignement'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848962987751262)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'fr-ca'
,p_message_text=>'Extras'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848603554751262)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'fr-ca'
,p_message_text=>'Police'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848566686751262)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'fr-ca'
,p_message_text=>'Formatage'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848777347751262)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'fr-ca'
,p_message_text=>'Listes'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001817365751308)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994345992751306)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'fr-ca'
,p_message_text=>'En double'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992617792751306)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Colonnes affich\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992585784751306)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'Exclure les valeurs nulles'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001917736751308)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter'
,p_is_js_message=>true
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956274520751295)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer vers le bas')
,p_is_js_message=>true
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956376017751295)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer vers le haut')
,p_is_js_message=>true
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992350113751306)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992932112751306)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Autres colonnes'
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992436725751306)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992719150751306)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9e %0')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992863441751306)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9e %0 de %1')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994497723751306)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'fr-ca'
,p_message_text=>'Actualiser'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994527909751306)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler les modifications'
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138992266122751306)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tres')
,p_is_js_message=>true
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951446242751293)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Par exemple, %0'
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955777586751295)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Exemple : %0'
,p_is_js_message=>true
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868448820751268)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('1 r\00E9sultat')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865551781751267)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 r\00E9sultats')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917328483751283)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Pagination'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917418196751283)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9sultats, %0 \00E0 %1')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813145585751252)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Se reconnecter'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813083600751252)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Votre session a pris fin'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813264673751252)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tendre')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812820492751252)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Votre session se terminera \00E0 %0. Souhaitez-vous la prolonger?')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812978944751252)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Votre session se terminera \00E0 %0 et ne pourra pas \00EAtre prolong\00E9e. Enregistrez votre travail maintenant pour \00E9viter de perdre des donn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012228010751312)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du traitement du code de nettoyage de session de base de donn\00E9es.')
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901975136751278)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du traitement du code de configuration de session de base de donn\00E9es.')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872344092751269)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Votre session a pris fin.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011447523751311)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fermez cette bo\00EEte de dialogue et cliquez sur le bouton Recharger de votre navigateur pour obtenir une nouvelle session.')
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030342665751317)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('<a href="%0">Connectez-vous</a> \00E0 nouveau pour cr\00E9er une nouvelle session.')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914608050751282)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'fr-ca'
,p_message_text=>'Session non valide'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957701122751295)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucun r\00F4le dynamique n''a pu \00EAtre activ\00E9 dans la session Real Application Security pour l''utilisateur "%0".')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899801649751278)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-99900 Impossible de cr\00E9er l''ID session unique : %0')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828932204751256)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Type CLOB pour les donn\00E9es d''\00E9tat de session non autoris\00E9 pour l''\00E9l\00E9ment %0.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848302159751262)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La substitution des \00E9l\00E9ments de type CLOB pour les donn\00E9es d''\00E9tat de session n''est pas prise en charge.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917100938751283)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Violation de protection de l''\00E9tat de session. Cause possible : Modification manuelle de l''\00E9l\00E9ment de page prot\00E9g\00E9 %0. Si vous n''\00EAtes pas s\00FBr de la cause de l''erreur, communiquez avec votre administrateur pour obtenir de l''aide.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038397406751319)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Violation de protection de page. Cause possible : Soumission d''une page dont le chargement n''est pas encore termin\00E9 ou modification manuelle d''\00E9l\00E9ments de page prot\00E9g\00E9s. Pour obtenir de l''aide, communiquez avec l''administrateur de l''application.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037459458751319)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 contient l''un des caract\00E8res non valides suivants : &<>"/;,*|=% ou --')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037524783751319)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 contient l''un des caract\00E8res non valides suivants : &<>"/;,*|=% ou -- ou un saut de ligne.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037217777751319)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 contient des caract\00E8res sp\00E9ciaux. Seuls les caract\00E8res a-Z, 0-9 et les espaces sont autoris\00E9s.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037367161751319)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 contient <, > ou ", qui ne sont pas des caract\00E8res valides.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874719678751270)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune somme de contr\00F4le n''a \00E9t\00E9 fournie au traitement de l''affichage d''une page exigeant une somme de contr\00F4le lorsqu''une ou plusieurs valeurs de demande, de vidage de cache ou d''argument sont transmises en tant que param\00E8tres.')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912039870751281)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Violation de protection de l''\00E9tat de session. Cause possible : Modification manuelle d''une URL contenant une somme de contr\00F4le ou utilisation d''un lien dont la somme de contr\00F4le est incorrecte ou manquante. Si vous n''\00EAtes pas s\00FBr de la cause de l''err')
||'eur, communiquez avec votre administrateur pour obtenir de l''aide.'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993606738751306)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9sactiver le mode de contraste \00E9lev\00E9')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993774472751306)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activer le mode de contraste \00E9lev\00E9')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858149047751265)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de mettre \00E0 jour le param\00E8tre d''application %0, car il fait l''objet d''un abonnement \00E0 partir d''une autre application.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908454865751280)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'fr-ca'
,p_message_text=>'Bas'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908688379751280)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'fr-ca'
,p_message_text=>'Vers le bas'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908797611751280)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908893303751280)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tout d\00E9placer')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908947092751281)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909046761751281)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout supprimer'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909170752751281)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908351285751280)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'fr-ca'
,p_message_text=>'Haut'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908564073751280)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'fr-ca'
,p_message_text=>'Vers le haut'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020105194751314)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020880717751314)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>'dans %0 jour(s)'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020021338751314)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020958689751314)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>'dans %0 heure(s)'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019871585751314)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021088571751314)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>'dans %0 minute(s)'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020465381751314)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 mois'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020641172751314)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>'dans %0 mois'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019988557751314)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020734559751314)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>'dans %0 seconde(s)'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020297152751314)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139021135080751314)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>'dans %0 semaine(s)'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020378717751314)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139020526182751314)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('dans %0 ann\00E9e(s)')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821471028751254)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'fr-ca'
,p_message_text=>'[Ligne]'
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822017901751254)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'fr-ca'
,p_message_text=>'[Lignes multiples]'
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821734409751254)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'fr-ca'
,p_message_text=>'[Points multiples]'
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822257398751254)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'fr-ca'
,p_message_text=>'[Polygones multiples]'
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822364271751255)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('[Objet de g\00E9om\00E9trie]')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821366473751254)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'fr-ca'
,p_message_text=>'[Point (%0,%1)]'
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821666215751254)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'fr-ca'
,p_message_text=>'[Polygone]'
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820835286751254)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9gion r\00E9duite : %0')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935918939751289)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9duire')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819812814751254)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le s\00E9parateur orient\00E9 horizontalement ne peut \00EAtre d\00E9plac\00E9 ni vers la gauche ni vers la droite')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820001668751254)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'fr-ca'
,p_message_text=>'Taille maximale de %0 px atteinte'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821020829751254)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'fr-ca'
,p_message_text=>'Taille minimale de %0 px atteinte'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820987875751254)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La r\00E9gion est r\00E9duite')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820732411751254)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La r\00E9gion est restaur\00E9e')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820454447751254)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Redimensionn\00E9 \00E0 %0 px')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138820672955751254)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9gion restaur\00E9e : %0')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935832262751289)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Restaurer'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819937723751254)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le s\00E9parateur orient\00E9 verticalement ne peut pas \00EAtre d\00E9plac\00E9 vers le haut ou vers le bas')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985303904751304)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer la notation'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975256766751300)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur %0 ne figure pas dans l''intervalle de notation valide compris entre 1 et %1'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975312384751301)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 n''est pas une valeur num\00E9rique')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971417838751299)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Message de r\00E9ussite')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033218116751318)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033119476751318)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943388502751291)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de trouver le syst\00E8me des enregistrements associ\00E9s \00E0 cette instance de t\00E2che')
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951687079751293)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec de l''action de t\00E2che %0 - La t\00E2che a l''\00E9tat Erreur, v\00E9rifiez le code d''action de la t\00E2che')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831801324751257)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ajouter un commentaire : Non autoris\00E9')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831178743751257)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che d\00E9j\00E0 affect\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824521465751255)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Affect\00E9 \00E0 %0')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830811669751257)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Annuler la t\00E2che : Non autoris\00E9')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846462572751262)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de supprimer le responsable actuel de cette t\00E2che. D\00E9l\00E9guez la t\00E2che \00E0 un autre participant avant de r\00E9essayer cette op\00E9ration.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830473834751257)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9clamer la t\00E2che : Non autoris\00E9')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830550949751257)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Terminer la t\00E2che : Non autoris\00E9')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830632774751257)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9l\00E9guer la t\00E2che : Non autoris\00E9')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829023142751257)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La date d''\00E9ch\00E9ance de la t\00E2che ne peut pas \00EAtre dans le pass\00E9.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824322680751255)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9ch\00E9ance le %0')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824719457751255)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec de l''action %1 de la t\00E2che. Message d''erreur - %0')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824438779751255)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec ')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824083443751255)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9ussite')
,p_is_js_message=>true
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824254609751255)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''action %1 a r\00E9ussi avec le message %0')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827551903751256)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'fr-ca'
,p_message_text=>'Avant expiration'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853146506751264)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852619660751264)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che annul\00E9e')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853237303751264)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le participant n''est pas autoris\00E9 \00E0 annuler la t\00E2che')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852573090751264)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9clamer')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852964989751264)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La t\00E2che est d\00E9j\00E0 r\00E9clam\00E9e par un autre utilisateur ou le participant n''est pas autoris\00E9 \00E0 r\00E9clamer cette t\00E2che')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852784504751264)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che r\00E9clam\00E9e par %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953881401751294)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Termin\00E9e')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852344234751263)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che termin\00E9e avec le r\00E9sultat %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853677367751264)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La t\00E2che n''est pas affect\00E9e ou le participant n''est pas autoris\00E9 \00E0 l''ex\00E9cuter')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814055575751252)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che termin\00E9e sans r\00E9sultat')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953986060751294)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9er')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846823486751262)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che cr\00E9\00E9e avec l''ID %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954091771751294)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9l\00E9guer')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852427498751264)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che d\00E9l\00E9gu\00E9e au responsable potentiel %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853088751751264)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le participant n''est pas autoris\00E9 ou, s''il est nouveau, il ne s''agit pas d''un responsable potentiel de la t\00E2che')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826123014751256)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'fr-ca'
,p_message_text=>'Expirer'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827233724751256)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che expir\00E9e.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954146462751294)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822852808751255)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La t\00E2che n''est pas affect\00E9e ou le participant n''est pas autoris\00E9 \00E0 demander des informations pour la t\00E2che')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823035772751255)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune information n''a \00E9t\00E9 demand\00E9e pour la t\00E2che ou le participant n''est pas autoris\00E9 \00E0 soumettre des informations pour la t\00E2che.')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826695249751256)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Expiration de la t\00E2che lorsque le nombre maximal de renouvellements de %0 est atteint.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853963590751264)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La t\00E2che n''est pas dans un \00E9tat appropri\00E9 ou le participant n''est pas un administrateur d''affaires pour cette t\00E2che')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854043905751264)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''op\00E9ration %0 est inconnue ou non applicable \00E0 cette t\00E2che')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954252263751294)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9bloquer')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939958541751290)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che d\00E9bloqu\00E9e, elle peut maintenant \00EAtre r\00E9clam\00E9e par d''autres')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832804644751258)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9blocage de t\00E2che non autoris\00E9 - L''utilisateur n''est pas le responsable de la t\00E2che')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849872616751263)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le responsable'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850080914751263)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Participant %0 supprim\00E9 de la t\00E2che')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827497544751256)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Renouveler'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138826393235751256)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che renouvel\00E9e avec l''ID %0, le nombre maximal de renouvellements restants avant l''expiration est de %1.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827390156751256)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ID t\00E2che %0 a \00E9t\00E9 renouvel\00E9 avec l''ID t\00E2che %1')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823368425751255)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'fr-ca'
,p_message_text=>'Demander des informations'
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823229346751255)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('A demand\00E9 %0 pour plus d''informations : %1')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821172295751254)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9finir l''initiateur Peut terminer \00E0 %0')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823457278751255)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'fr-ca'
,p_message_text=>'Soumettre les informations'
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823173889751255)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Informations demand\00E9es soumises \00E0 %0 : %1')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954371203751294)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mettre \00E0 jour le commentaire')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850801463751263)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter un commentaire : %0'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853785135751264)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La t\00E2che est dans un \00E9tat qui ne permet pas les commentaires')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861034368751266)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9gler la date d''\00E9ch\00E9ance de la t\00E2che \00E0 %0')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819141977751254)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mise \00E0 jour due le')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954461917751294)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mettre \00E0 jour le responsable')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852181852751263)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ajouter le responsable potentiel %0 aux participants \00E0 la t\00E2che')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851293119751263)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mettre \00E0 jour les param\00E8tres')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954514540751294)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mettre \00E0 jour la priorit\00E9')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852867496751264)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9gler la priorit\00E9 de la t\00E2che \00E0 %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850196244751263)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tre "%0" mis \00E0 jour de "%1" \00E0 "%2".')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833678336751258)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che annul\00E9e car l''instance de flux de travail correspondante a \00E9t\00E9 interrompue.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830747584751257)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Transf\00E9rer la t\00E2che : Non autoris\00E9')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824111251751255)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lanc\00E9 par %0 %1')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833038621751258)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Une erreur interne inattendue s''est produite'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831369665751257)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Op\00E9ration de t\00E2che non applicable')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856923959751265)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'fr-ca'
,p_message_text=>'Ce responsable potentiel n''existe pas.'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832662636751258)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Approuv\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832707401751258)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rejet\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814105615751252)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Un r\00E9sultat est requis \00E0 l''issue de l''ex\00E9cution de la t\00E2che')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138814393510751252)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La t\00E2che n''est pas autoris\00E9e \00E0 avoir un r\00E9sultat')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849970031751263)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de mettre \00E0 jour le param\00E8tre %0.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846201778751262)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le participant existe d\00E9j\00E0 pour cette instance de t\00E2che.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947711585751292)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'fr-ca'
,p_message_text=>'Urgent'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824885536751255)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Urgent'
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947616586751292)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9lev\00E9')
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138824928398751255)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Priorit\00E9 \00E9lev\00E9e')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947527835751292)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'fr-ca'
,p_message_text=>'Moyen'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825061479751255)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Priorit\00E9 moyenne')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947400660751292)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'fr-ca'
,p_message_text=>'Faible'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825160896751255)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Priorit\00E9 faible')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947393903751292)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tr\00E8s faible')
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825272005751255)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Priorit\00E9 la plus faible')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830905383751257)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9gler la priorit\00E9 de la t\00E2che : Non autoris\00E9')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832147103751257)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Affect\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832526872751258)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Annul\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832259844751257)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Termin\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832417933751258)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825993177751256)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Expir\00E9')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832357242751258)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec ')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138822676814751255)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Informations demand\00E9es')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832075904751257)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Non affect\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854474568751264)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('La cr\00E9ation d''une nouvelle t\00E2che pour la d\00E9finition de t\00E2che %0 dans l''application %1 a \00E9chou\00E9.'),
'SQLCODE : %2'))
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854381158751264)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La tentative de cr\00E9ation d''une t\00E2che pour la d\00E9finition de t\00E2che %0 dans l''application %1 a \00E9chou\00E9, car la d\00E9finition de t\00E2che ne contient aucun responsable potentiel - Modifiez la d\00E9finition de t\00E2che et ajoutez au moins un participant de type Respon')
||'sable potentiel'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831698158751257)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9finition de t\00E2che introuvable')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831505782751257)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Participants introuvables pour la t\00E2che')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138832952414751258)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Plusieurs t\00E2ches pour l''ID t\00E2che indiqu\00E9 - V\00E9rifiez aupr\00E8s de l''administrateur de base de donn\00E9es')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831732539751257)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E2che introuvable')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138831465677751257)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tre de t\00E2che introuvable')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867701085751268)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Action'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867605225751268)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Approbation'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815020332751252)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec de l''ex\00E9cution de la proc\00E9dure de r\00E8gle de vacances %2 pour la d\00E9finition de t\00E2che %0 dans l''application %1.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815282533751252)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le participant %1 a \00E9t\00E9 ajout\00E9 comme rempla\00E7ant du participant %0. Motif - %2')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139018908662751314)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Barre d''outils'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872492241751269)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Application'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033643056751318)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9velopper/R\00E9duire la navigation')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033769188751318)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9velopper/R\00E9duire la colonne lat\00E9rale')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942157118751291)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Navigation principale'
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138842929416751261)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('"%0" n''est pas un nom de param\00E8tre fictif valide.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949816174751293)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'1 jour'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949664190751293)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>'1 heure'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949971243751293)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 jours'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949719731751293)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 heures'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949594606751293)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 minutes'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950191050751293)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 semaines'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138950019327751293)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>'1 semaine'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847891640751262)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 \00E9l\00E9ments s\00E9lectionn\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848071765751262)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner un \00E9l\00E9ment')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138847993839751262)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner %0')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036746227751319)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9but de la page')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894316419751276)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activ\00E9')
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862810970751267)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors du traitement de la demande.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138848465620751262)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de mettre \00E0 jour le message texte %0, car il fait l''objet d''un abonnement \00E0 partir d''une autre application.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951519409751293)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur obligatoire'
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867909901751268)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Niveau d''en-t\00EAte %0, masqu\00E9')
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996334531751307)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cette page comporte des modifications non enregistr\00E9es.')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857945476751265)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Navigateur'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857641264751265)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'Zoom avant'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858607217751265)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Niveau de zoom {0}%'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857747806751265)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Zoom arri\00E8re')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857808569751265)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialisation du zoom')
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833305173751258)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'fr-ca'
,p_message_text=>'Le diagramme du flux de travail n''est pas accessible pour le moment.'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833209637751258)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Diagramme du flux de travail'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835123517751258)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance de flux de travail %0 est actuellement \00E0 l''\00E9tat %1. L''op\00E9ration n''est donc pas autoris\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837796343751259)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance %1 de l''activit\00E9 %2 dans le flux de travail %0 a \00E9t\00E9 termin\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837580958751259)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9ation d''une nouvelle instance %1 de l''activit\00E9 %2 dans le flux de travail %0')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829362732751257)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de trouver la rang\00E9e de donn\00E9es suppl\00E9mentaire associ\00E9e \00E0 cette instance d''activit\00E9 de flux de travail')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837662866751259)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance en erreur %1 de l''activit\00E9 %2 dans le flux de travail %0 a \00E9t\00E9 relanc\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819664504751254)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance d''activit\00E9 %1 dans le flux de travail %0 a \00E9t\00E9 interrompue')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853464894751264)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance d''activit\00E9 %1 du flux de travail %0 a fait l''objet d''une temporisation et a \00E9t\00E9 interrompue.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837856670751259)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance %1 de l''activit\00E9 %2 dans le flux de travail %0 est en attente')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819415648751254)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance de flux de travail %0 a \00E9t\00E9 modifi\00E9e et a repris \00E0 l''activit\00E9 %1')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836810121751259)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance en attente %1 de l''activit\00E9 %2 du flux de travail %0 s''est termin\00E9e avec succ\00E8s')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836698403751259)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''activit\00E9 en attente %1 a g\00E9n\00E9r\00E9 une erreur, car le flux de travail %0 \00E9tait \00E0 l''\00E9tat En erreur avant la fin de l''activit\00E9')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836732853751259)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''activit\00E9 en attente %1 a \00E9t\00E9 interrompue, car le flux de travail %0 \00E9tait d\00E9j\00E0 \00E0 l''\00E9tat Interrompu avant que l''activit\00E9 ne soit termin\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819728549751254)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec de l''interruption de l''activit\00E9 %1 dans le flux de travail %0 en raison d''une exception - %2')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835302098751258)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le flux de travail est actuellement occup\00E9 \00E0 terminer une op\00E9ration pr\00E9c\00E9dente. Essayez plus tard')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851488927751263)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Termin\00E9 le %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834406133751258)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de poursuivre le flux de travail %0, car il se trouve actuellement \00E0 l''activit\00E9 %1 qui n''est pas \00E0 l''\00E9tat En attente')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846370442751262)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 n''est pas un contexte de corr\00E9lation de flux de travail valide pour le processus ex\00E9cut\00E9 par cette activit\00E9 de flux de travail. Le contexte de corr\00E9lation doit \00EAtre un texte d\00E9limit\00E9 par deux points contenant APEX_APPL_WORKFLOW suivi de l''ID insta')
||unistr('nce de flux de travail et de l''ID instance d''activit\00E9.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837055800751259)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9ation d''une nouvelle instance %0 du flux de travail %1, version %2')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829158973751257)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de trouver la rang\00E9e de donn\00E9es suppl\00E9mentaire associ\00E9e \00E0 cette instance de flux de travail')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851640833751263)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9ch\00E9ance le %0')
,p_version_scn=>2704801
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836995587751259)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le flux de travail %0 s''est termin\00E9 avec l''\00E9tat %1')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834160810751258)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le type de donn\00E9es %1 pour les conditions compar\00E9es dans l''activit\00E9 de permutation du flux de travail %0 n''est pas compatible avec l''op\00E9rateur de condition')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823955898751255)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lanc\00E9 par %0 %1')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846717144751262)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9ation d''une nouvelle instance %0 du flux de travail %1, version %2 - Appel \00E0 partir de l''instance d''activit\00E9 %4 de l''instance de flux de travail %3')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138819546591751254)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''activit\00E9 avec l''ID statique %1 n''est pas une activit\00E9 du flux de travail %0. V\00E9rifiez l''ID statique de l''activit\00E9 dans la version correspondante du flux de travail.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138844803058751261)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 est un param\00E8tre obligatoire pour ce flux de travail et ne doit pas avoir la valeur NULL.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837459858751259)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance de flux de travail %0 a \00E9t\00E9 reprise')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837384587751259)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance de flux de travail %0 a \00E9t\00E9 relanc\00E9e')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851753307751263)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 relance'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851820277751263)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 relances'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851540267751263)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9marr\00E9 le %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845701447751262)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Active'
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845993167751262)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Termin\00E9e')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846038107751262)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'fr-ca'
,p_message_text=>'En erreur'
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138846149378751262)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'fr-ca'
,p_message_text=>'Suspendue'
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845809366751262)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'fr-ca'
,p_message_text=>'Interrompue'
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861185650751266)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'fr-ca'
,p_message_text=>'En attente'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837133728751259)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance de flux de travail %0 a \00E9t\00E9 suspendue')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843099547751261)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de d\00E9terminer l''activit\00E9 suivante pour l''instance de flux de travail %0. V\00E9rifiez et corrigez les conditions d\00E9finies pour l''activit\00E9 de permutation courante avant de relancer le flux de travail.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837266604751259)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance de flux de travail %0 a \00E9t\00E9 interrompue')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836310791751259)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'fr-ca'
,p_message_text=>'Seul l''administrateur d''affaires du flux de travail %0 peut reprendre le flux de travail'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836498961751259)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le flux de travail %0 ne peut \00EAtre relanc\00E9 que par un administrateur d''affaires ou un responsable')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835911292751259)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance de flux de travail %0 ne peut \00EAtre suspendue que par un administrateur d''affaires du flux de travail')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138836227766751259)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Seuls les responsables et les administrateurs d''affaires de l''instance de flux de travail %0 peuvent mettre fin au flux de travail'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834617624751258)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les variables du flux de travail %0 ne peuvent \00EAtre mises \00E0 jour que par un administrateur d''affaires d\00E9fini pour le flux de travail')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849286905751263)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance de flux de travail %0 doit \00EAtre \00E0 l''\00E9tat En erreur ou Suspendue pour que ses variables puissent \00EAtre mises \00E0 jour.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840760211751260)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur de la variable de flux de travail %0 mise \00E0 jour \00E0 %1')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138850970439751263)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Le flux de travail %0 n''a pas de version active'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851023763751263)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le flux de travail %0 n''a pas de version en cours de d\00E9veloppement')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138851176945751263)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le flux de travail %0 n''a pas de version active ou en cours de d\00E9veloppement')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834099692751258)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''instance d''activit\00E9 %1 pour l''instance de flux de travail %0 est introuvable')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833813154751258)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>'L''instance de flux de travail %0 est introuvable'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868924989751268)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'fr-ca'
,p_message_text=>'Le classeur ne contient aucune feuille de calcul active.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868806262751268)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le classeur n''a pas \00E9t\00E9 initialis\00E9.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138868702185751268)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Une erreur interne est survenue lors de la cr\00E9ation du fichier XLSX.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871299529751269)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'fr-ca'
,p_message_text=>'Feuille'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881843347751272)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nom de feuille de calcul "%0" est d\00E9j\00E0 pris. Essayez un autre nom.')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010407636751311)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Actions'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925465528751285)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Menu Actions'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921117721751284)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter une fonction'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921059652751284)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter une colonne de regroupement'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958695608751296)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Ajouter une colonne de pivotement'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958784854751296)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ajouter une colonne de rang\00E9e')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893153384751276)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Agr\00E9ger')
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931609925751287)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Agr\00E9gation')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912540041751282)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'fr-ca'
,p_message_text=>'Moyenne'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916892341751283)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912683721751282)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'fr-ca'
,p_message_text=>'Maximum'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912876005751282)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('M\00E9diane')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912797426751282)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'fr-ca'
,p_message_text=>'Minimum'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912444001751282)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'fr-ca'
,p_message_text=>'Somme de %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913595055751282)
,p_name=>'APEXIR_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892415864751276)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Toutes les colonnes'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872521001751269)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Toutes les rang\00E9es')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007406084751310)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Alternatif'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009053189751311)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur par d\00E9faut de remplacement :  %0 ')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906638973751280)
,p_name=>'APEXIR_AND'
,p_message_language=>'fr-ca'
,p_message_text=>'et'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941430704751290)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''importer le rapport enregistr\00E9. Son contenu est corrompu.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941544519751290)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''importer le rapport enregistr\00E9. Son contenu est vide.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894611198751276)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Appliquer'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888230732751274)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Croissant'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909764443751281)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'En date du %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009664583751311)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'fr-ca'
,p_message_text=>'Moyenne de %0'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001210178751308)
,p_name=>'APEXIR_BAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Barres'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893962130751276)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'fr-ca'
,p_message_text=>'compris entre'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887051890751274)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Couleur d''arri\00E8re-plan')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888943730751274)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'fr-ca'
,p_message_text=>'bleu'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923004449751285)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'fr-ca'
,p_message_text=>'Bas'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853804573751264)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Boutons \00E0 c\00F4t\00E9 de la barre de recherche de %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889567940751275)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Annuler'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895872488751277)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cat\00E9gorie')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886987400751274)
,p_name=>'APEXIR_CELL'
,p_message_language=>'fr-ca'
,p_message_text=>'Cellule'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913442648751282)
,p_name=>'APEXIR_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Graphique'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923987214751285)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'fr-ca'
,p_message_text=>'Initialisation...'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963654604751297)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier une \00E9tiquette de graphique.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976002889751301)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Votre interrogation d\00E9passe le maximum de %0 points de donn\00E9es par graphique. Appliquez un filtre pour r\00E9duire le nombre d''enregistrements de votre interrogation de base.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974911461751300)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nombre maximal de rang\00E9es d''une interrogation de graphique limite le nombre de rang\00E9es de l''interrogation de base, et non le nombre de rang\00E9es affich\00E9es. Votre interrogation de base d\00E9passe le nombre maximal de rang\00E9es de %0. Appliquez un filtre p')
||unistr('our r\00E9duire le nombre d''enregistrements de votre interrogation de base.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892593910751276)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de graphique'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856438333751265)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue de graphique de %0'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971689873751299)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tout s\00E9lectionner')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910140139751281)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner un format de rapport')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917968128751283)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'fr-ca'
,p_message_text=>'effacer'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889497301751275)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929282004751287)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonnes'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896436447751277)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'fr-ca'
,p_message_text=>'Alias de colonne'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139004045869751309)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer...'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864269580751267)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('En-t\00EAte de colonne')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878366923751271)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Actions de colonne'
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878657232751271)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Actions pour la colonne "%0"'
,p_is_js_message=>true
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920076283751284)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Menu d''en-t\00EAte de colonne')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923796494751285)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'fr-ca'
,p_message_text=>'Informations sur la colonne'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006390203751310)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tiquette de colonne')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921478911751284)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne %0'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904387909751279)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'fr-ca'
,p_message_text=>'contient'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905698488751280)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'fr-ca'
,p_message_text=>'ne contient pas'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887959687751274)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'dans'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905884765751280)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'ne se situe pas dans le dernier intervalle de'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914948122751282)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'ne se situe dans le prochain intervalle de'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905708071751280)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'se situe dans le dernier intervalle de'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914828469751282)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'se situe dans le prochain intervalle de'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887885988751274)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'n''est pas null'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887797474751274)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'est nul'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887589056751274)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('semblable \00E0')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888035161751274)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'pas dans'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887618720751274)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('non semblable \00E0')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904691855751279)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('correspond \00E0 l''expression rationnelle')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910066977751281)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Calcul'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974678377751300)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'fr-ca'
,p_message_text=>'Expression de calcul'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929515334751287)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9er un calcul \00E0 l''aide d''alias de colonne.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929616360751287)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'fr-ca'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929724414751287)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'fr-ca'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929850515751287)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'fr-ca'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870749703751269)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'fr-ca'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914215950751282)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'fr-ca'
,p_message_text=>'Calculer'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922010037751284)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Commande BREAK'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925019462751285)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'fr-ca'
,p_message_text=>'Commandes BREAK'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011643438751311)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonnes de commande BREAK'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867431805751268)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre de valeurs distinctes'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010100167751311)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre de valeurs distinctes'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010067232751311)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre de %0'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983038611751303)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'fr-ca'
,p_message_text=>'Tous les jours'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139036338980751319)
,p_name=>'APEXIR_DATA'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Donn\00E9es')
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923879439751285)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Donn\00E9es du rapport il y a %0 minutes.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856889508751265)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue de donn\00E9es de %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893297219751276)
,p_name=>'APEXIR_DATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Date'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927798653751286)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Par d\00E9faut')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007292771751310)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Type de rapport par d\00E9faut')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889650538751275)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_is_js_message=>true
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893504265751276)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Voulez-vous supprimer ces param\00E8tres de rapport?')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138994037914751306)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Supprimer le rapport par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921746491751284)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le rapport'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888392157751274)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9croissant')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895939696751277)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Description'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919923098751284)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue d''une seule rang\00E9e')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928212867751286)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Sens %0'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929162434751287)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9sactiv\00E9')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889125897751275)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Affich\00E9')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892371276751276)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Colonnes affich\00E9es')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928108645751286)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher dans le rapport'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922945392751285)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'fr-ca'
,p_message_text=>'Vers le bas'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914336354751282)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E9l\00E9charger')
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928053223751286)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Ne pas afficher'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997323803751307)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Il existe d\00E9j\00E0 une mise en surbrillance avec la m\00EAme condition')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011866850751311)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne de pivotement. La liste des colonnes de pivotement doit contenir des valeurs uniques.'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012044559751312)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924032611751285)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modifier les param\00E8tres du graphique')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930696370751287)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le graphique'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894506775751276)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier la commande BREAK'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931015190751287)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le filtre'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897537787751277)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modifier l''op\00E9ration Flashback')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988898212751305)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le regroupement'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930973757751287)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier la mise en surbrillance'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958959366751296)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modifier le tableau crois\00E9 dynamique')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918395316751283)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier le rapport'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007572556751310)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'fr-ca'
,p_message_text=>'Courriel'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879731001751272)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'fr-ca'
,p_message_text=>'Adresse de courriel'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007833577751310)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'fr-ca'
,p_message_text=>'Cci'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008092577751310)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'fr-ca'
,p_message_text=>'Corps'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007769570751310)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'fr-ca'
,p_message_text=>'Cc'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008537752751310)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fr\00E9quence')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138884931645751273)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le courriel n''a pas \00E9t\00E9 configur\00E9 pour cette application. Communiquez avec l''administrateur.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982355865751303)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier une adresse de courriel.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008103300751310)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir le fichier joint'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007930043751310)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'fr-ca'
,p_message_text=>'Objet'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983379630751303)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier un objet pour le courriel.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007680947751310)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C0')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886795906751274)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activ\00E9')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930838232751287)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activer/D\00E9sactiver')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930383560751287)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur. %0'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929936448751287)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'fr-ca'
,p_message_text=>'Exemples'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930748648751287)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'fr-ca'
,p_message_text=>'Exemples :'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892245114751275)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'Exclure les valeurs nulles'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931378713751287)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9velopper/R\00E9duire')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928953436751287)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'fr-ca'
,p_message_text=>'Expression'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913818599751282)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924918599751285)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtres'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935615535751289)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'fr-ca'
,p_message_text=>'Expression de filtre'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033874069751318)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'fr-ca'
,p_message_text=>'L''expression de filtre est trop longue.'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878588716751271)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtrer les suggestions'
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935521979751288)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de filtre'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931597270751287)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner les colonnes \00E0 rechercher')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914105222751282)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928702448751286)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Une interrogation Flashback permet de voir les donn\00E9es telles qu''elles existaient \00E0 un moment donn\00E9 pr\00E9c\00E9dent.'),
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982713068751303)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Dur\00E9e de l''op\00E9ration Flashback')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984169100751303)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909996353751281)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'fr-ca'
,p_message_text=>'Masque de format %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921634079751284)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Fonction'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929455009751287)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Fonctions %0'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007116665751310)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Fonctions / Op\00E9rateurs')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921309206751284)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'fr-ca'
,p_message_text=>'Fonction %0'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913624203751282)
,p_name=>'APEXIR_GO'
,p_message_language=>'fr-ca'
,p_message_text=>'Aller'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887241516751274)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'fr-ca'
,p_message_text=>'vert'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932214092751288)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne de regroupement'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932390450751288)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Fonctions de regroupement'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867526992751268)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Regroupement'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008282564751310)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne de regroupement %0'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963781535751297)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier une colonne de regroupement.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974821972751300)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nombre maximal de rang\00E9es d''une interrogation de regroupement limite le nombre de rang\00E9es de l''interrogation de base, et non le nombre de rang\00E9es affich\00E9es. Votre interrogation de base d\00E9passe le nombre maximal de rang\00E9es de %0. Appliquez un filtr')
||unistr('e pour r\00E9duire le nombre d''enregistrements de votre interrogation de base.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955051242751294)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Tri de regroupement'
,p_is_js_message=>true
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011766451751311)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'fr-ca'
,p_message_text=>'Ordre de tri du regroupement'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856649028751265)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue de regroupement de %0'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892682251751276)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne horizontale'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926633577751286)
,p_name=>'APEXIR_HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918442557751283)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Les rapports interactifs permettent aux utilisateurs finaux de personnaliser les rapports. Les utilisateurs peuvent modifier la disposition des donn\00E9es du rapport en s\00E9lectionnant des colonnes, en appliquant des filtres, en mettant en surbrillance de')
||unistr('s valeurs et en les triant. En outre, ils peuvent d\00E9finir des sections, des agr\00E9gations, des graphiques, des regroupements et ajouter des calculs personnalis\00E9s. Ils peuvent \00E9galement configurer un abonnement afin qu''une version HTML du rapport leur s')
||unistr('oit envoy\00E9e par courriel selon une fr\00E9quence d\00E9termin\00E9e. Les utilisateurs peuvent cr\00E9er plusieurs variantes d''un rapport et les enregistrer en tant que rapports nomm\00E9s, pour une consultation publique ou priv\00E9e. '),
'<p/>',
unistr('Les sections qui suivent r\00E9capitulent les modes de personnalisation d''un rapport interactif. Pour en savoir plus, consultez la section "Utilisation des rapports interactifs" dans le <i>Guide de l''utilisateur final d''Oracle APEX</i>.')))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925572903751286)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le menu Actions appara\00EEt \00E0 droite du bouton Aller de la barre de recherche. Utilisez ce menu pour personnaliser un rapport interactif.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919223611751284)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les agr\00E9gats sont des calculs math\00E9matiques effectu\00E9s sur une colonne. Ils s''affichent apr\00E8s chaque commande BREAK et \00E0 la fin du rapport dans la colonne dans laquelle ils sont d\00E9finis. Les options sont les suivantes : <p> </p><ul> <li><strong>Agr\00E9ga')
||unistr('tion</strong> permet de s\00E9lectionner une agr\00E9gation pr\00E9c\00E9demment d\00E9finie pour la modifier.</li> <li><strong>Fonction</strong> est la fonction \00E0 ex\00E9cuter (par exemple, SUM, MIN).</li> <li><strong>Colonne</strong> permet de s\00E9lectionner la colonne \00E0 la')
||unistr('quelle appliquer la fonction math\00E9matique. Seules les colonnes num\00E9riques s''affichent.</li> </ul>')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919397041751284)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Vous pouvez d\00E9finir un graphique par rapport enregistr\00E9. Une fois qu''il est d\00E9fini, vous pouvez passer de la vue de graphique \00E0 la vue de rapport \00E0 l''aide des ic\00F4nes de vue de la barre de recherche.'),
'Les options sont les suivantes :  ',
'<p>',
'</p><ul>',
unistr('<li><strong>Type de graphique</strong> identifie le type de graphique \00E0 inclure. S\00E9lectionnez une option parmi Barres horizontales, Barres verticales, Secteurs ou Lin\00E9aire.</li> <li><strong>\00C9tiquette</strong> permet de s\00E9lectionner la colonne \00E0 utili')
||unistr('ser comme \00E9tiquette.</li> <li><strong>Titre de l''axe pour l''\00E9tiquette</strong> est le titre qui s''affiche sur l''axe associ\00E9 \00E0 la colonne s\00E9lectionn\00E9e pour l''\00E9tiquette. Cette option n''est pas disponible pour les graphiques \00E0 secteurs.</li> <li><strong')
||unistr('>Valeur</strong> permet de s\00E9lectionner la colonne \00E0 utiliser comme valeur. Si votre fonction est de type COUNT, il n''est pas n\00E9cessaire de s\00E9lectionner une valeur.</li> <li><strong>Titre de l''axe pour la valeur</strong> est le titre qui s''affiche su')
||unistr('r l''axe associ\00E9 \00E0 la colonne s\00E9lectionn\00E9e pour la valeur. Cette option n''est pas disponible pour les graphiques \00E0 secteurs.</li> <li><strong>Fonction</strong> est une fonction facultative \00E0 ex\00E9cuter sur la colonne s\00E9lectionn\00E9e pour Valeur.</li> <li><')
||unistr('strong>Trier</strong> permet de trier votre jeu de r\00E9sultats.</li></ul>'),
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918610411751283)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Si vous cliquez sur un en-t\00EAte de colonne, vous obtenez un menu proposant les options suivantes : <p></p> <ul> <li>L''ic\00F4ne <strong>Trier par ordre croissant</strong> permet de trier le rapport selon la colonne dans l''ordre croissant.</li> <li>L''ic\00F4ne')
||unistr(' <strong>Trier par ordre d\00E9croissant</strong> permet de trier le rapport selon la colonne dans l''ordre d\00E9croissant.</li> <li>L''ic\00F4ne <strong>Masquer la colonne</strong> permet de masquer la colonne. Les colonnes ne peuvent pas toutes \00EAtre masqu\00E9es. S')
||unistr('i une colonne ne peut pas l''\00EAtre, cette ic\00F4ne n''est pas disponible.</li> <li><strong>Colonne de section</strong> permet de cr\00E9er un groupe de section pour la colonne. Cela permet d''extraire la colonne du rapport en tant qu''enregistrement ma\00EEtre.</li>')
||unistr(' <li><strong>Informations sur la colonne</strong> permet d''afficher un texte d''aide sur la colonne, s''il est disponible.</li> <li><strong>Zone de texte</strong> permet d''entrer des crit\00E8res de recherche non sensibles \00E0 la casse (pas besoin de caract\00E8')
||unistr('res g\00E9n\00E9riques). La saisie d''une valeur r\00E9duit la liste de choix au bas du menu. Vous pouvez alors s\00E9lectionner une valeur au bas du menu et celle-ci est utilis\00E9e comme filtre avec l''op\00E9rateur ''='' (par exemple, <code>column = ''ABC''</code>). Vous pouv')
||unistr('ez \00E9galement cliquer sur l''ic\00F4ne en forme de lampe torche et entrer une valeur \00E0 utiliser comme filtre avec le modificateur ''LIKE''. (par exemple, <code>column LIKE ''%ABC%''</code>).</li> <li><strong>Liste des valeurs uniques</strong> affiche les 500 p')
||unistr('remi\00E8res valeurs uniques qui r\00E9pondent \00E0 vos crit\00E8res de filtrage. Si la colonne est de type date, une liste d''intervalle de dates s''affiche \00E0 la place. Si vous s\00E9lectionnez une valeur, un filtre est cr\00E9\00E9 avec l''op\00E9rateur ''='' (par exemple, <code>colu')
||'mn = ''ABC''</code>).</li> </ul>',
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919198452751284)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Permet d''ajouter des colonnes calcul\00E9es \00E0 votre rapport. Il peut s''agir de calculs math\00E9matiques (par exemple, <code>NBR_HOURS/24</code>) ou de fonctions Oracle standard appliqu\00E9es \00E0 des colonnes existantes. Certaines s''affichent \00E0 titre d''exemple et')
||unistr(' d''autres (telles que <code>TO_DATE)</code> peuvent \00E9galement \00EAtre utilis\00E9es). Les options sont les suivantes : <p></p> <ul> <li><strong>Calcul</strong> permet de s\00E9lectionner un calcul pr\00E9c\00E9demment d\00E9fini pour le modifier.</li> <li><strong>En-t\00EAte d')
||unistr('e colonne</strong> d\00E9signe l''en-t\00EAte de la nouvelle colonne.</li> <li><strong>Masque de format</strong> repr\00E9sente un masque de format Oracle \00E0 appliquer \00E0 la colonne (par exemple, S9999).</li> <li><strong>Calcul</strong> correspond au calcul \00E0 effec')
||unistr('tuer. Dans le calcul, les colonnes sont r\00E9f\00E9renc\00E9es \00E0 l''aide des alias affich\00E9s.</li> </ul> <p>Sous le calcul, les colonnes de votre interrogation s''affichent avec les alias qui leur sont associ\00E9s. En cliquant sur le nom ou l''alias d''une colonne, vou')
||unistr('s incluez celle-ci dans le calcul. \00C0 c\00F4t\00E9 des colonnes se trouve un clavier virtuel qui fournit des raccourcis vers les touches couramment utilis\00E9es. \00C0 l''extr\00EAme droite se trouvent les fonctions.</p> </p>L''exemple de calcul suivant montre comment aff')
||unistr('icher la r\00E9mun\00E9ration totale :</p> <pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre> (o\00F9 A est l''organisation, B le salaire et C la commission)')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925602634751286)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Sert \00E0 cr\00E9er un groupe de section pour une ou plusieurs colonnes. Cela permet d''extraire les colonnes du rapport interactif et de les afficher sous forme d''enregistrement ma\00EEtre.'),
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919850896751284)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Pour voir les d\00E9tails d''une seule rang\00E9e \00E0 la fois, cliquez sur l''ic\00F4ne Vue d''une seule rang\00E9e pour la rang\00E9e que vous voulez voir. Si elle est disponible, la vue d''une seule rang\00E9e affiche toujours la premi\00E8re colonne. Selon la personnalisation du r')
||unistr('apport interactif, la vue d''une seule rang\00E9e peut \00EAtre la vue standard ou une page personnalis\00E9e pouvant permettre la mise \00E0 jour.'),
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919720097751284)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Permet de t\00E9l\00E9charger le jeu de r\00E9sultats courant. Les formats de t\00E9l\00E9chargement incluent PDF, Excel, HTM et CSV. Les options de t\00E9l\00E9chargement diff\00E8rent en fonction du format s\00E9lectionn\00E9. Tous les formats peuvent \00E9galement \00EAtre envoy\00E9s par courriel.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918843052751284)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Permet de restreindre le rapport en ajoutant ou en modifiant la clause <code>WHERE</code> dans l''interrogation. Vous pouvez effectuer le filtrage par colonne ou par rang\00E9e. <p>Si vous filtrez par colonne, s\00E9lectionnez une colonne (il n''est pas n\00E9cess')
||unistr('aire que ce soit une colonne affich\00E9e), s\00E9lectionnez un op\00E9rateur Oracle standard (=, !=, pas dans, compris entre), et entrez une expression de comparaison. Les expressions sont sensibles \00E0 la casse. Utilisez % comme caract\00E8re g\00E9n\00E9rique (par exemple,')
||unistr(' <code>STATE_NAME like A%)</code>.</p> <p>Si vous filtrez par rang\00E9e, vous pouvez cr\00E9er des clauses <code>WHERE</code> complexes \00E0 l''aide des alias de colonnes et des fonctions ou op\00E9rateurs Oracle standard (par exemple, <code>G = ''VA'' or G = ''CT''</c')
||unistr('ode>, o\00F9 <code>G</code> est l''alias de <code>CUSTOMER_STATE</code>).</p>'),
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919447920751284)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Une interrogation Flashback permet de visualiser les donn\00E9es telles qu''elles existaient \00E0 un moment donn\00E9 pr\00E9c\00E9dent. Par d\00E9faut, la dur\00E9e du retour en arri\00E8re est de 3 heures (ou 180 minutes), mais la dur\00E9e r\00E9elle diff\00E8re pour chaque base de donn\00E9es.'),
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984092415751303)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Le menu Format vous permet de personnaliser l''affichage du rapport.',
'Il contient les sous-menus suivants :</p>',
'<ul><li>Trier</li>',
'<li>Commande BREAK</li>',
'<li>Mettre en surbrillance</li>',
'<li>Calculer</li>',
unistr('<li>Agr\00E9ger</li>'),
'<li>Graphique</li>',
'<li>Regroupement</li>',
unistr('<li>Tableau crois\00E9 dynamique</li>'),
'</ul>'))
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982295216751303)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous pouvez d\00E9finir une vue de regroupement par rapport enregistr\00E9. Lorsqu''elle est d\00E9finie, vous pouvez passer de la vue de regroupement \00E0 la vue de rapport \00E0 l''aide des ic\00F4nes de vue de la barre de recherche. Pour cr\00E9er une vue de regroupement, vou')
||unistr('s s\00E9lectionnez : <p></p><ul> <li>les colonnes sur lesquelles effectuer le regroupement</li> <li>les colonnes \00E0 agr\00E9ger ainsi que la fonction \00E0 ex\00E9cuter (moyenne, somme, nombre, etc.)</li> </ul>')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919064542751284)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('<p>Permet de d\00E9finir un filtre. Les rang\00E9es qui r\00E9pondent aux crit\00E8res du filtre s''affichent en surbrillance avec les caract\00E9ristiques associ\00E9es au filtre. Les options sont les suivantes :</p> <ul> <li><strong>Nom</strong> est utilis\00E9 uniquement pour')
||unistr(' l''affichage.</li> <li><strong>S\00E9quence</strong> indique l''ordre dans laquelle les r\00E8gles sont \00E9valu\00E9es.</li> <li><strong>Activ\00E9</strong> indique si une r\00E8gle est activ\00E9e ou d\00E9sactiv\00E9e.</li> <li><strong>Type de mise en \00E9vidence</strong> indique si la')
||unistr(' rang\00E9e ou la cellule doit \00EAtre mise en \00E9vidence. Si la valeur Cellule est s\00E9lectionn\00E9e, la colonne r\00E9f\00E9renc\00E9e dans la condition de mise en \00E9vidence est en surbrillance.</li> <li><strong>Couleur d''arri\00E8re-plan</strong> est la nouvelle couleur de l''ar')
||unistr('ri\00E8re-plan de la zone en surbrillance.</li> <li><strong>Couleur du texte</strong> est la nouvelle couleur du texte de la zone en surbrillance.</li> <li><strong>Condition de mise en \00E9vidence</strong> d\00E9finit votre condition de filtre.</li> </ul>')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812414952751252)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Vous pouvez d\00E9finir une vue de tableau crois\00E9 dynamique par rapport enregistr\00E9. Une fois qu''elle est d\00E9finie, vous pouvez passer d''une vue de tableau crois\00E9 dynamique \00E0 une vue de rapport \00E0 l''aide des ic\00F4nes de vue de la barre de recherche. Pour cr\00E9e')
||unistr('r une vue de tableau crois\00E9 dynamique, vous s\00E9lectionnez :'),
'<p></p>',
'<ul>',
unistr('<li>les colonnes pour le tableau crois\00E9 dynamique</li>'),
unistr('<li>les colonnes \00E0 afficher en tant que rang\00E9es</li>'),
unistr('<li>les colonnes \00E0 agr\00E9ger ainsi que la fonction \00E0 ex\00E9cuter (moyenne, somme, nombre, etc.)</li>'),
'</ul>'))
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930121204751287)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Lorsque vous personnalisez un rapport interactif, les param\00E8tres du rapport s''affichent sous la barre de recherche et au-dessus du rapport. Cette zone peut \00EAtre r\00E9duite et d\00E9velopp\00E9e \00E0 l''aide de l''ic\00F4ne situ\00E9e \00E0 gauche. <p> Pour chaque param\00E8tre de r')
||unistr('apport, vous pouvez : </p><ul> <li>Modifier le param\00E8tre en cliquant sur son nom.</li> <li>D\00E9sactiver/activer le param\00E8tre en d\00E9s\00E9lectionnant ou en cochant la case Activer/D\00E9sactiver. Utilisez cette commande pour d\00E9sactiver et activer temporairement ')
||unistr('un param\00E8tre.</li> <li>Supprimer le param\00E8tre en cliquant sur l''ic\00F4ne Supprimer.</li> </ul> <p>Si vous avez cr\00E9\00E9 un graphique, un regroupement ou un tableau crois\00E9 dynamique, vous pouvez passer de ceux-ci au rapport de base \00E0 l''aide des liens Vue de ')
||unistr('rapport, Vue de graphique, Vue de regroupement et Vue de tableau crois\00E9 dynamique affich\00E9s sur la droite. Lorsque vous visualisez le graphique, le regroupement ou le tableau crois\00E9 dynamique, vous pouvez \00E9galement utiliser le lien Modifier pour modif')
||unistr('ier les param\00E8tres.</p>'),
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919659726751284)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9tablit les param\00E8tres par d\00E9faut du rapport, en supprimant toutes les personnalisations que vous avez effectu\00E9es.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984316305751303)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9finit le nombre d''enregistrements \00E0 afficher par page.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138919579817751284)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Enregistre le rapport personnalis\00E9 pour une utilisation ult\00E9rieure. Vous fournissez un nom et une description facultative et pouvez rendre le rapport accessible au public (c''est-\00E0-dire \00E0 tous les utilisateurs qui peuvent acc\00E9der au rapport princip')
||unistr('al par d\00E9faut). Vous pouvez enregistrer quatre types de rapport interactif :</p> <ul> <li><strong>Principal par d\00E9faut</strong> (d\00E9veloppeur uniquement). Le rapport principal par d\00E9faut est le rapport qui s''affiche initialement. Il ne peut pas \00EAtre p')
||unistr('as \00EAtre renomm\00E9 ni supprim\00E9.</li> <li><strong>Rapport alternatif</strong> (d\00E9veloppeur uniquement). Permet aux d\00E9veloppeurs de cr\00E9er plusieurs dispositions de rapport. Seuls les d\00E9veloppeurs peuvent enregistrer, renommer ou supprimer un rapport alter')
||unistr('natif.</li> <li><strong>Rapport public</strong> (utilisateur final). Peut \00EAtre enregistr\00E9, renomm\00E9 ou supprim\00E9 par l''utilisateur final qui l''a cr\00E9\00E9. Les autres utilisateurs peuvent le visualiser et enregistrer la disposition pour un autre rapport.</l')
||unistr('i> <li><strong>Rapport priv\00E9</strong> (utilisateur final). Seul l''utilisateur final qui a cr\00E9\00E9 le rapport peut visualiser, enregistrer, renommer ou supprimer le rapport.</li> </ul> <p>Si vous enregistrez des rapports personnalis\00E9s, un s\00E9lecteur de ra')
||unistr('pport s''affiche dans la barre de recherche \00E0 gauche du s\00E9lecteur de rang\00E9e (si cette fonction est activ\00E9e).</p>'),
''))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918588746751283)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('En haut de chaque page de rapport se trouve une r\00E9gion de recherche. Cette r\00E9gion (ou barre de recherche) pr\00E9sente les fonctions suivantes :')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984953836751303)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'fr-ca'
,p_message_text=>'Le <li><strong>menu Actions</strong> permet de personnaliser un rapport. Voir les sections qui suivent.</li>'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984419016751303)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('<li><strong>L''ic\00F4ne S\00E9lectionner des colonnes</strong> vous permet d''identifier la colonne \00E0 rechercher (ou toutes).</li>')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984733716751303)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('<li>L''option <strong>Rapports</strong> affiche d''autres rapports priv\00E9s ou publics par d\00E9faut et enregistr\00E9s.</li>')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984630553751303)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('<li>L''option <strong>Rang\00E9es</strong> d\00E9finit le nombre d''enregistrements \00E0 afficher par page.</li>')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984517735751303)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li>La <strong>Zone de texte</strong> vous permet d''entrer des crit\00E8res de recherche non sensibles \00E0 la casse (les caract\00E8res g\00E9n\00E9riques sont implicites).</li>'),
unistr('<li>Le <strong>bouton Aller</strong> permet de lancer la recherche. Si vous appuyez sur la touche Entr\00E9e, vous lancez \00E9galement la recherche lorsque le curseur se trouve dans la zone de texte de recherche.</li>')))
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984811168751303)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les <li><strong>Ic\00F4nes de vue</strong> permettent de basculer entre les diff\00E9rentes vues d\00E9finies pour le rapport : ic\00F4ne, rapport, d\00E9tails, graphique, regroupement et tableau crois\00E9 dynamique.</li>')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918760953751283)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Permet de modifier les colonnes affich\00E9es. Les colonnes de droite sont affich\00E9es. Les colonnes de gauche sont masqu\00E9es. Vous pouvez r\00E9organiser les colonnes affich\00E9es \00E0 l''aide des fl\00E8ches situ\00E9es \00E0 l''extr\00EAme droite. Les colonnes calcul\00E9es sont pr\00E9fix')
||unistr('\00E9es par <strong>**</strong>.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918913658751284)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Permet de modifier les colonnes sur lesquelles effectuer le tri et d\00E9termine si'),
unistr('le tri doit se faire par ordre croissant ou d\00E9croissant. Vous pouvez \00E9galement sp\00E9cifier comment traiter les valeurs <code>NULL</code>. Le param\00E8tre par d\00E9faut affiche toujours les valeurs <code>NULL</code> en dernier ou les affiche toujours en premi')
||unistr('er. Le tri r\00E9sultant s''affiche \00E0 droite des'),
unistr('en-t\00EAtes de colonne dans le rapport.</p>')))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982060208751303)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lorsque vous ajoutez un abonnement, vous indiquez une adresse de courriel (ou plusieurs adresses de courriel, s\00E9par\00E9es par des virgules), l''objet du message, la fr\00E9quence et les dates de d\00E9but et de fin. Les courriels r\00E9sultants comprennent une versi')
||unistr('on export\00E9e (PDF, Excel, HTML ou CSV) du rapport interactif qui contient les donn\00E9es courantes avec les param\00E8tres de rapport qui \00E9taient pr\00E9sents au moment de l''ajout de l''abonnement.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923637950751285)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Masquer la colonne'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914081457751282)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Mettre en surbrillance'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925190724751285)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'fr-ca'
,p_message_text=>'Mises en surbrillance'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895316418751276)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'fr-ca'
,p_message_text=>'Mettre en surbrillance la cellule, %0 de %1'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930241319751287)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'fr-ca'
,p_message_text=>'Condition de mise en surbrillance'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895249868751276)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mettre en surbrillance la rang\00E9e, %0 de %1')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982671991751303)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Style de mise en surbrillance'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886880864751274)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de mise en surbrillance'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001449988751308)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Horizontal'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030496188751317)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('1 param\00E8tre inactif')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030507324751317)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 param\00E8tres inactifs')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920275745751284)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide sur le rapport interactif'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931228791751287)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>'Non valide'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924638666751285)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Expression de calcul non valide. %0'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880232909751272)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La date de fin doit \00EAtre post\00E9rieure \00E0 la date de d\00E9but.')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939483746751290)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Expression de filtre non valide. %0'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009206385751311)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'fr-ca'
,p_message_text=>'Interrogation de filtrage non valide'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030658066751317)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('1 param\00E8tre non valide')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030763156751317)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 param\00E8tres non valides')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982895364751303)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>'(en minutes)'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999858299751308)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 se situe dans le dernier intervalle de %1'
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000002639751308)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 se situe dans le prochain intervalle de %1'
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999944802751308)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 ne se situe pas dans le dernier intervalle de %1'
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000132942751308)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 ne se situe pas dans le prochain intervalle de %1'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929382219751287)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Clavier virtuel'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893059718751276)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tiquette %0')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923281809751285)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Titre de l''axe pour l''\00E9tiquette')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915519396751282)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Dernier jour'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915714093751283)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Derni\00E8re heure')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915275268751282)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois dernier'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915311234751282)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Semaine derni\00E8re')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915418665751282)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 derniers jours'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915611270751283)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 derni\00E8res heures')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915045855751282)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 derni\00E8res ann\00E9es')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915146096751282)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ann\00E9e derni\00E8re')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892939940751276)
,p_name=>'APEXIR_LINE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lin\00E9aire')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889712778751275)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lin\00E9aire avec aire')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009131807751311)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'fr-ca'
,p_message_text=>'Mapper'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924194471751285)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Selon les estimations, l''interrogation d\00E9passe les ressources maximales autoris\00E9es. Modifiez les param\00E8tres de votre rapport et r\00E9essayez.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905590818751279)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nombre maximal de rang\00E9es pour ce rapport est de %0 rang\00E9es. Appliquez un filtre pour r\00E9duire le nombre d''enregistrements de votre interrogation.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009708959751311)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'fr-ca'
,p_message_text=>'Maximum de %0'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009987044751311)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('M\00E9diane de %0')
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852271030751263)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Message'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909836885751281)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 minutes'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009822502751311)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'fr-ca'
,p_message_text=>'Minimum de %0'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008824874751311)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983223054751303)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Tous les mois'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922483581751285)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922383372751285)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tout d\00E9placer')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035505061751319)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ID statique de la r\00E9gion doit \00EAtre sp\00E9cifi\00E9 car la page contient plusieurs rapports interactifs.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888498242751274)
,p_name=>'APEXIR_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918137522751283)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nouvelle agr\00E9gation')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031361266751317)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nouvelle cat\00E9gorie')
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918270258751283)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Nouveau calcul'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912991713751282)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916051302751283)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Prochain jour'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915873002751283)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>'Prochaine heure'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916336873751283)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois prochain'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916263236751283)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>'Semaine prochaine'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916190011751283)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 prochains jours'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138915909406751283)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 prochaines heures'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916567464751283)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 prochaines ann\00E9es')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916401826751283)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ann\00E9e prochaine')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888770990751274)
,p_name=>'APEXIR_NO'
,p_message_language=>'fr-ca'
,p_message_text=>'Non'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931488109751287)
,p_name=>'APEXIR_NONE'
,p_message_language=>'fr-ca'
,p_message_text=>'- Aucun -'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982407109751303)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'fr-ca'
,p_message_text=>'L''adresse de courriel n''est pas valide.'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854515334751264)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune colonne s\00E9lectionn\00E9e pour l''affichage. Utilisez <strong>Colonnes</strong> dans le menu Actions pour rendre les colonnes visibles.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927916716751286)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeurs nulles toujours en premier'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927843088751286)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeurs nulles toujours en dernier'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928300765751286)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'fr-ca'
,p_message_text=>'Tri des valeurs nulles %0'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924750534751285)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La dur\00E9e de l''op\00E9ration Flashback doit \00EAtre une valeur num\00E9rique.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924352076751285)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La s\00E9quence doit \00EAtre num\00E9rique.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928830729751286)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Op\00E9rateur')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887317308751274)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'fr-ca'
,p_message_text=>'orange'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001304886751308)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Orientation'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889285473751275)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'fr-ca'
,p_message_text=>'Autre'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855497981751264)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'Pagination de %0'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869424144751269)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Orientation de la page'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870159535751269)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Paysage'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870237264751269)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Portrait'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869339259751269)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'fr-ca'
,p_message_text=>'Taille de la page'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869943491751269)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'fr-ca'
,p_message_text=>'A3'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869880903751269)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'fr-ca'
,p_message_text=>'A4'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870073981751269)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Personnalis\00E9')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869636023751269)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Grand format'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869582317751269)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Lettre'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869790036751269)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tablo\00EFd')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010227535751311)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'fr-ca'
,p_message_text=>'Pourcentage du nombre total de %0 (%)'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009471822751311)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'fr-ca'
,p_message_text=>'Pourcentage de la somme totale %0 (%)'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008474863751310)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>'Pourcentage du nombre total'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008340522751310)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'fr-ca'
,p_message_text=>'Pourcentage de la somme totale'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892832619751276)
,p_name=>'APEXIR_PIE'
,p_message_language=>'fr-ca'
,p_message_text=>'Secteurs'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958571051751295)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tableau crois\00E9 dynamique')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960025593751296)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier un agr\00E9gat.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960220754751296)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous ne pouvez pas effectuer une agr\00E9gation sur une colonne s\00E9lectionn\00E9e en tant que colonne de rang\00E9e.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959491234751296)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonnes de pivotement'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959221215751296)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne de pivotement %0'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959835109751296)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier une colonne de pivotement')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812398886751252)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nombre maximal de rang\00E9es d''une interrogation de tableau crois\00E9 dynamique limite le nombre de rang\00E9es de l''interrogation de base, et non le nombre de rang\00E9es affich\00E9es. Votre interrogation de base d\00E9passe le nombre maximal de rang\00E9es de %0. Appliq')
||unistr('uez un filtre pour r\00E9duire le nombre d''enregistrements de votre interrogation de base.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959758070751296)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tri de tableau crois\00E9 dynamique')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925707234751286)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne de pivotement contient trop de valeurs distinctes - le SQL du tableau crois\00E9 dynamique ne peut pas \00EAtre g\00E9n\00E9r\00E9.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856759968751265)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vue de tableau crois\00E9 dynamique de %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982562666751303)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aper\00E7u')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913032320751282)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139007301235751310)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'fr-ca'
,p_message_text=>'Principal'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983543922751303)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport principal'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869200139751269)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Inclure des balises d''accessibilit\00E9')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830033659751257)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le texte enrichi'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938452944751289)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Priv\00E9')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893428556751276)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'fr-ca'
,p_message_text=>'Public'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889098902751275)
,p_name=>'APEXIR_RED'
,p_message_language=>'fr-ca'
,p_message_text=>'rouge'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035472247751319)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ID statique de la r\00E9gion %0 n''existe pas.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922512367751285)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922690817751285)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout supprimer'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030897285751317)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le graphique'
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922151869751284)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer la commande BREAK'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921826184751284)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le filtre'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921913517751284)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Supprimer l''op\00E9ration Flashback')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030914896751317)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le regroupement'
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922269946751285)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer la mise en surbrillance'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031080896751317)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Supprimer le tableau crois\00E9 dynamique')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012133826751312)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Supprimer le rapport'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993953795751306)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Renommer le rapport par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931723549751287)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Renommer le rapport'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913327669751282)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010313650751311)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapports'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885543718751273)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le rapport interactif enregistr\00E9 portant l''alias %0 n''existe pas.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938746425751289)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>'Le rapport n''existe pas.'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885630475751273)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le rapport interactif enregistr\00E9 portant l''ID %0 n''existe pas.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930062303751287)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tres de rapport')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854231415751264)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Param\00E8tres de rapport de %0')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910365423751281)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Vue de rapport'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914593855751282)
,p_name=>'APEXIR_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser')
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893636170751276)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9tablir les param\00E8tres par d\00E9faut pour le rapport.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888896278751274)
,p_name=>'APEXIR_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9e')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006458801751310)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous ne pouvez pas utiliser ROWID comme colonne de cl\00E9 primaire pour une source de donn\00E9es REST.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921261959751284)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9es')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138984251159751303)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9es par page')
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959555384751296)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Colonnes de rang\00E9e')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959385953751296)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Colonne de rang\00E9e %0')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959972919751296)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier une colonne de rang\00E9e.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960127251751296)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne de rang\00E9e doit \00EAtre diff\00E9rente de la colonne de pivotement.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935730343751289)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Filtre de rang\00E9e')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910437731751281)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9e %0 de %1')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914766151751282)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le texte de la rang\00E9e contient')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888169235751274)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925387727751285)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport enregistr\00E9')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925280025751285)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rapport enregistr\00E9 = "%0"')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927422114751286)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les param\00E8tres du rapport courant seront utilis\00E9s par d\00E9faut pour tous les utilisateurs.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138993839539751306)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Enregistrer le rapport par d\00E9faut')
,p_is_js_message=>true
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138914412582751282)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer le rapport'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031205178751317)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer le rapport *'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985213683751303)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920163146751284)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Barre de recherche'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138853523850751264)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'Barre de recherche de %0'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139031158537751317)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher : %0'
,p_is_js_message=>true
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990728283751305)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher un rapport'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138974720456751300)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Colonnes s\00E9lectionn\00E9es')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889827364751275)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('- S\00E9lectionner une colonne -')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913723326751282)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner des colonnes')
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893379835751276)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('- S\00E9lectionner une fonction -')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920998534751284)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('- S\00E9lectionner une colonne de regroupement -')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959074647751296)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('- S\00E9lectionner une colonne de pivotement -')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009337496751311)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner une rang\00E9e')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959110488751296)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('- S\00E9lectionner une colonne de rang\00E9e -')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138840604990751260)
,p_name=>'APEXIR_SEND'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoyer'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863151493751267)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'fr-ca'
,p_message_text=>'Envoyer en tant que courriel'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888567467751274)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9quence')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913976066751282)
,p_name=>'APEXIR_SORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier'
,p_is_js_message=>true
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923466929751285)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier par ordre croissant'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923566335751285)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Trier par ordre d\00E9croissant')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011564955751311)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'fr-ca'
,p_message_text=>'Ordre de tri'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917815691751283)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'fr-ca'
,p_message_text=>'espace'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138929056695751287)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'fr-ca'
,p_message_text=>'Statut %0'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982960258751303)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Abonnement'
,p_is_js_message=>true
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008769557751311)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'fr-ca'
,p_message_text=>'Fin'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138827758118751256)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ignorer si aucune donn\00E9e trouv\00E9e')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008607344751310)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C0 partir de')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139009541421751311)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'fr-ca'
,p_message_text=>'Somme de %0'
,p_version_scn=>2704843
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000497085751308)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'fr-ca'
,p_message_text=>'%0, Rapport = %1, Vue = %2'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887437590751274)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Couleur du texte'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906130125751280)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'jours'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906069029751280)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'heures'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905996018751280)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'fr-ca'
,p_message_text=>'minutes'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906344672751280)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'mois'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906220653751280)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>'semaines'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138906406555751280)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ann\00E9es')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011995620751311)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activer/d\00E9sactiver')
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922731913751285)
,p_name=>'APEXIR_TOP'
,p_message_language=>'fr-ca'
,p_message_text=>'Haut'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005409429751310)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Colonne non regroup\00E9e')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924234562751285)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nom de la mise en surbrillance doit \00EAtre unique.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892170426751275)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('type de donn\00E9es non pris en charge')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138922814518751285)
,p_name=>'APEXIR_UP'
,p_message_language=>'fr-ca'
,p_message_text=>'Vers le haut'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924457115751285)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Entrez une couleur valide.'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924551748751285)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'fr-ca'
,p_message_text=>'Entrez un masque de format valide.'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889393986751275)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923350468751285)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Titre de l''axe pour la valeur'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931108706751287)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Valeur obligatoire'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892719127751276)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne verticale'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139001511515751308)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Vertical'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930400499751287)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir le graphique'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989022453751305)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Voir les d\00E9tails')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033356513751318)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune vue %0 n''est d\00E9finie pour le rapport.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989122244751305)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir le regroupement'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988987057751305)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ic\00F4nes de vue')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138958815086751296)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Voir le tableau crois\00E9 dynamique')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138930505698751287)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir le rapport'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983169314751303)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Toutes les semaines'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913265548751282)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport de travail'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010923353751311)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 jours'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010898297751311)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 heures'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139010723434751311)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 minutes'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011176659751311)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 mois'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011091613751311)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 semaines'
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139011234424751311)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 ann\00E9es')
,p_version_scn=>2704844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139008943442751311)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ann\00E9e')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138887128568751274)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'fr-ca'
,p_message_text=>'jaune'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138888607869751274)
,p_name=>'APEXIR_YES'
,p_message_language=>'fr-ca'
,p_message_text=>'Oui'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138923187898751285)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 contient < or > qui sont des caract\00E8res non valides.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138947075572751292)
,p_name=>'APEX_REGION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9gion')
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838195083751259)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>'Impossible d''extraire le fichier ZIP.'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838047510751259)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Signature de fin de r\00E9pertoire central introuvable. Ce fichier n''est pas un fichier ZIP.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138869196842751268)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Violation de pr\00E9condition d''API ')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891276504751275)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''obtenir la valeur du param\00E8tre d''application %0 car l''option de compilation associ\00E9e est d\00E9sactiv\00E9e.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891190340751275)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de d\00E9finir la valeur du param\00E8tre d''application %0 car l''option de compilation associ\00E9e est d\00E9sactiv\00E9e.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003795440751309)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur du param\00E8tre d''application %0 n''est pas valide')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003619636751309)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le param\00E8tre d''application demand\00E9 %0 n''est pas d\00E9fini')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003833844751309)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le param\00E8tre d''application %0 ne peut pas \00EAtre r\00E9gl\00E9 \00E0 une valeur nulle')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877731528751271)
,p_name=>'BACK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860198618751266)
,p_name=>'BUILDER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('G\00E9n\00E9rateur')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933772532751288)
,p_name=>'BUTTON LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tiquette de bouton')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857078393751265)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'fr-ca'
,p_message_text=>'Classes CSS de bouton'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895536256751276)
,p_name=>'BUTTON_ID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ID du bouton g\00E9n\00E9r\00E9 sera l''ID statique du bouton, s''il est d\00E9fini. S''il ne l''est pas, il s''agira d''un ID g\00E9n\00E9r\00E9 \00E0 l''interne dans le format ''B'' || [ID du bouton interne].')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829500663751257)
,p_name=>'CANDLESTICK'
,p_message_language=>'fr-ca'
,p_message_text=>'Bougies'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943557331751291)
,p_name=>'CENTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Centre'
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890189862751275)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'fr-ca'
,p_message_text=>'Demande %0'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880165050751272)
,p_name=>'CHECK$'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('s\00E9lecteur de rang\00E9e')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139005584948751310)
,p_name=>'CHECKED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('s\00E9lectionn\00E9')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138981970846751302)
,p_name=>'COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939509734751290)
,p_name=>'COMMENTS'
,p_message_language=>'fr-ca'
,p_message_text=>'Commentaires'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920577200751284)
,p_name=>'CONTINUE'
,p_message_language=>'fr-ca'
,p_message_text=>'Continuer'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878030508751271)
,p_name=>'COPYRIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Copyright &copy; 1999, %0, Oracle et/ou ses soci\00E9t\00E9s affili\00E9es.')
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926245621751286)
,p_name=>'COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>'Nombre'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933252801751288)
,p_name=>'CREATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9er')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988629255751305)
,p_name=>'CREATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9ation')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988745298751305)
,p_name=>'CREATED_BY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9ation par')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909645635751281)
,p_name=>'CREATED_ON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9ation le')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920746664751284)
,p_name=>'CUSTOM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Personnalis\00E9')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931927357751287)
,p_name=>'CUSTOMIZE'
,p_message_language=>'fr-ca'
,p_message_text=>'Personnaliser'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933978291751288)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialisation des pr\00E9f\00E9rences de page pour l''utilisateur %0.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934080536751288)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9f\00E9rences modifi\00E9es pour l''utilisateur %0.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933847335751288)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialisation des pr\00E9f\00E9rences de page pour l''utilisateur %0.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894918328751276)
,p_name=>'DAILY'
,p_message_language=>'fr-ca'
,p_message_text=>'Tous les jours'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858369275751265)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le fichier charg\00E9 n''est pas valide ou comporte une extension incorrecte.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890348906751275)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Utilisation d''un s\00E9lecteur XML ou JSON non valide.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835460710751258)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le profil de donn\00E9es et le fichier charg\00E9 ne contiennent aucune colonne de la table cible.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949386107751293)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune donn\00E9e trouv\00E9e dans le fichier charg\00E9.')
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949412110751293)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune donn\00E9e trouv\00E9e dans la feuille de calcul "%0".')
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855264556751264)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le fichier sp\00E9cifi\00E9 n''est pas un fichier XLSX.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821257778751254)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : %0 rang\00E9es trait\00E9es.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823517772751255)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : %0 rang\00E9es trait\00E9es avec 1 erreur.')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823814125751255)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : %0 rang\00E9es trait\00E9es avec %1 erreurs.')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823690796751255)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : 1 rang\00E9e trait\00E9e.')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138837902233751259)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : 1 rang\00E9e trait\00E9e avec erreur.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138823761306751255)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Chargement des donn\00E9es termin\00E9 : 1 rang\00E9e trait\00E9e sans erreur.')
,p_version_scn=>2704794
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956488402751295)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne cible'
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863657362751267)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Ne pas charger'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863745067751267)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur de pr\00E9traitement')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956572250751295)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'fr-ca'
,p_message_text=>'Colonne source'
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957347589751295)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Format de date / nombre'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863435953751267)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ins\00E9rer une rang\00E9e')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019511254751314)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec de l''extraction de la valeur de consultation.')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138989246724751305)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mappage donn\00E9es / table')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957426924751295)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9e')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863867710751267)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9quence : Action')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951140645751293)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La r\00E8gle de transformation a \00E9chou\00E9')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863576552751267)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mettre \00E0 jour la rang\00E9e')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925830783751286)
,p_name=>'DATE'
,p_message_language=>'fr-ca'
,p_message_text=>'Date'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898736785751277)
,p_name=>'DAY'
,p_message_language=>'fr-ca'
,p_message_text=>'jour'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898888474751277)
,p_name=>'DAYS'
,p_message_language=>'fr-ca'
,p_message_text=>'jours'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939261135751290)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le d\00E9bogage n''est pas activ\00E9 pour cette application.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990905729751305)
,p_name=>'DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Par d\00E9faut')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899549724751278)
,p_name=>'DELETE'
,p_message_language=>'fr-ca'
,p_message_text=>'supprimer'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875120142751270)
,p_name=>'DELETE_MSG'
,p_message_language=>'fr-ca'
,p_message_text=>'Voulez-vous effectuer cette suppression?'
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138854780540751264)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'fr-ca'
,p_message_text=>'Remplacements de session'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855694039751264)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Activer les remplacements de session'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856586396751265)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'fr-ca'
,p_message_text=>'Une erreur s''est produite lors du chargement des remplacements de session.'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856325861751265)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Une erreur s''est produite lors de l''enregistrement des remplacements de session.'
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138856241202751265)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Remplacements de session enregistr\00E9s. Fermez cette bo\00EEte de dialogue pour voir les modifications.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138829461940751257)
,p_name=>'DIAL_PCT'
,p_message_language=>'fr-ca'
,p_message_text=>'Cadran (pourcentage)'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138870468938751269)
,p_name=>'DOWNLOAD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('T\00E9l\00E9charger')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990031591751305)
,p_name=>'DUP_USER'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom d''utilisateur en double dans la liste.'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878852375751271)
,p_name=>'EDIT'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier'
,p_is_js_message=>true
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890054257751275)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>'Adresse de courriel "%0" introuvable.'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872710328751270)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ce courriel a \00E9t\00E9 envoy\00E9 par %0.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990230203751305)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''adresse de courriel est trop longue. La limite est 240 caract\00E8res.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920416845751284)
,p_name=>'ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951218818751293)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de d\00E9finir la valeur source de l''\00E9l\00E9ment de page pour la r\00E9gion d''actualisation de page partielle')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911771971751281)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cr\00E9ation par')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873017860751270)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mot de passe expir\00E9')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865480663751267)
,p_name=>'FILE_EMPTY'
,p_message_language=>'fr-ca'
,p_message_text=>'Le fichier est vide.'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955206565751294)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La taille du fichier charg\00E9 \00E9tait sup\00E9rieure \00E0 %0 Mo. Chargez un fichier plus petit.')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875322239751270)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''authentification de l''utilisateur a \00E9chou\00E9 et un ou plusieurs fichiers n''ont pas \00E9t\00E9 charg\00E9s.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875493814751270)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cette instance ne permet pas aux utilisateurs non authentifi\00E9s de charger des fichiers.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955307882751294)
,p_name=>'FILTERS'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtres'
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933365082751288)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'1 erreur est survenue'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932535573751288)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 erreurs sont survenues'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877910438751271)
,p_name=>'FORM_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 de %1'
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916963976751283)
,p_name=>'GO'
,p_message_language=>'fr-ca'
,p_message_text=>'Aller'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019137606751314)
,p_name=>'HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aide'
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860279780751266)
,p_name=>'HOME'
,p_message_language=>'fr-ca'
,p_message_text=>'Accueil'
,p_is_js_message=>true
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898593328751277)
,p_name=>'HOUR'
,p_message_language=>'fr-ca'
,p_message_text=>'heure'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898665816751277)
,p_name=>'HOURS'
,p_message_language=>'fr-ca'
,p_message_text=>'heures'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138880031528751272)
,p_name=>'ICON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ic\00F4ne %0')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857359152751265)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rogner l''ic\00F4ne d''aide')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858574614751265)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Glissez l''ic\00F4ne et repositionnez-la dans le cadre \00E0 l''aide du curseur de zoom.</p>'),
'',
unistr('<p>Lorsqu''une nouvelle ic\00F4ne est charg\00E9e, elle est redimensionn\00E9e pour \00EAtre ajust\00E9e \00E0 trois formats : favoric\00F4ne, petite ic\00F4ne et grande ic\00F4ne.</p>'),
'',
unistr('<p>Lorsque l''ic\00F4ne est la cible de rognage, les raccourcis-claviers suivants sont disponibles :</p>'),
'<ul>',
unistr('    <li>Fl\00E8che vers la gauche : D\00E9placer l''image vers la gauche*</li>'),
unistr('    <li>Fl\00E8che vers le haut : D\00E9placer l''image vers le haut*</li>'),
unistr('    <li>Fl\00E8che vers la droite : D\00E9placer l''image vers la droite*</li>'),
unistr('    <li>Fl\00E8che vers le bas : D\00E9placer l''image vers le bas*</li>'),
'    <li>I : Effectuer un zoom avant</li>',
unistr('    <li>O : Effectuer un zoom arri\00E8re</li>'),
'    <li>L : Faire pivoter vers la gauche</li>',
'    <li>R : Faire pivoter vers la droite</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Maintenir la touche Maj pour un d\00E9placement plus rapide</em></p>')))
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864024499751267)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Faire glisser l''ic\00F4ne pour la repositionner')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864153210751267)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer le curseur pour ajuster le niveau de zoom')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857156508751265)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Modifier l''ic\00F4ne d''application')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857478702751265)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors de l''enregistrement de l''ic\00F4ne')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939826800751290)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> Cette application utilise des ic\00F4nes existantes. Le chargement d''une nouvelle ic\00F4ne causera le remplacement de toutes les ic\00F4nes existantes.</p>')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858035740751265)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Charger une nouvelle ic\00F4ne')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934252452751288)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Donn\00E9es d''identification de connexion non valides')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035389263751319)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur non valide pour le param\00E8tre : %0')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928563547751286)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Comme param\00E8tres de rapport par d\00E9faut')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928668108751286)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Comme rapport nomm\00E9')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910563697751281)
,p_name=>'IR_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur %0. %1'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910225567751281)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Impossible de calculer la navigation du formulaire. %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885888509751274)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport interactif introuvable.'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885249061751273)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La r\00E9gion du rapport interactif n''existe pas dans l''application %0, la page %1 et la r\00E9gion %2.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138928440450751286)
,p_name=>'IR_STAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Affich\00E9 uniquement pour les d\00E9veloppeurs')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916692579751283)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''interrogation du rapport n\00E9cessite une cl\00E9 unique pour identifier chaque rang\00E9e. La cl\00E9 fournie ne peut pas \00EAtre utilis\00E9e pour cette interrogation. D\00E9finissez une colonne de cl\00E9 unique. %0')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138916744567751283)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''interrogation du rapport n\00E9cessite une cl\00E9 unique pour identifier chaque rang\00E9e. La cl\00E9 fournie ne peut pas \00EAtre utilis\00E9e pour cette interrogation. Modifiez les attributs du rapport pour d\00E9finir une colonne de cl\00E9 unique. %0')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957656297751295)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner un fichier')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957540931751295)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Glisser-d\00E9poser le fichier ici ou')
,p_is_js_message=>true
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878209940751271)
,p_name=>'ITEMS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9l\00E9ments')
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911988205751281)
,p_name=>'ITEM_VALUE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur d''\00E9l\00E9ment')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926523932751286)
,p_name=>'LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tiquette')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939121227751290)
,p_name=>'LANGUAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Langue'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899222914751278)
,p_name=>'LAST'
,p_message_language=>'fr-ca'
,p_message_text=>'dernier'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875227469751270)
,p_name=>'LENGTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Longueur'
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933544297751288)
,p_name=>'LOGIN'
,p_message_language=>'fr-ca'
,p_message_text=>'Connexion'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975108171751300)
,p_name=>'MANAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('G\00E9rer')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139038237417751319)
,p_name=>'MAXIMIZE'
,p_message_language=>'fr-ca'
,p_message_text=>'Agrandir'
,p_is_js_message=>true
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898347927751277)
,p_name=>'MINUTE'
,p_message_language=>'fr-ca'
,p_message_text=>'minute'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898401325751277)
,p_name=>'MINUTES'
,p_message_language=>'fr-ca'
,p_message_text=>'minutes'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990440202751305)
,p_name=>'MISSING_AT'
,p_message_language=>'fr-ca'
,p_message_text=>'"@" manquante dans l''adresse de courriel.'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990674760751305)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Avertissement : Aucun mod\00E8le de page de bo\00EEte de dialogue n''a \00E9t\00E9 d\00E9fini pour la page de bo\00EEte de dialogue %0 dans l''application %1.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990338864751305)
,p_name=>'MISSING_DOT'
,p_message_language=>'fr-ca'
,p_message_text=>'"." manquant dans le domaine de l''adresse de courriel.'
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936676307751289)
,p_name=>'MODULE'
,p_message_language=>'fr-ca'
,p_message_text=>'Module'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890867678751275)
,p_name=>'MONTH'
,p_message_language=>'fr-ca'
,p_message_text=>'Mois'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894728705751276)
,p_name=>'MONTHLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Tous les mois'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890994946751275)
,p_name=>'MONTHS'
,p_message_language=>'fr-ca'
,p_message_text=>'mois'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926186478751286)
,p_name=>'MOVE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996915401751307)
,p_name=>'MOVE_FROM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer depuis')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997022476751307)
,p_name=>'MOVE_TO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9placer vers')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138913107379751282)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur dans l''op\00E9ration de suppression de plusieurs rang\00E9es : rang\00E9e= %0, %1, %2')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912120928751281)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ne doit pas \00EAtre un utilisateur public')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860700769751266)
,p_name=>'NAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926333385751286)
,p_name=>'NEW'
,p_message_language=>'fr-ca'
,p_message_text=>'Nouveau'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890676996751275)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous pouvez vous connecter \00E0 %0 en allant \00E0 :')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890783722751275)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Avis de nouveau compte %0'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019323918751314)
,p_name=>'NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936542075751289)
,p_name=>'NO'
,p_message_language=>'fr-ca'
,p_message_text=>'Non'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139033453090751318)
,p_name=>'NOBODY'
,p_message_language=>'fr-ca'
,p_message_text=>'personne'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899611004751278)
,p_name=>'NOT'
,p_message_language=>'fr-ca'
,p_message_text=>'N''est pas'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942578361751291)
,p_name=>'NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>'Non nul'
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912288750751282)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'fr-ca'
,p_message_text=>'N''est pas %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932071344751287)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('aucune donn\00E9e trouv\00E9e')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942091424751290)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucun rapport actualisable n''a \00E9t\00E9 trouv\00E9. Les op\00E9rations de mise \00E0 jour et de suppression de plusieurs rang\00E9es ne peuvent \00EAtre effectu\00E9es que sur des formulaires tabulaires de type "rapport actualisable".')
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942947798751291)
,p_name=>'OK'
,p_message_language=>'fr-ca'
,p_message_text=>'OK'
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938235596751289)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'fr-ca'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139037116031751319)
,p_name=>'ORA_06550'
,p_message_language=>'fr-ca'
,p_message_text=>'ORA-06550 : ligne %0, colonne %1'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988053761751304)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous utilisez un navigateur Web obsol\00E8te. Pour obtenir la liste des navigateurs pris en charge, consultez le guide d''installation d''Oracle APEX.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883016761751273)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Jeu de rang\00E9es non valide demand\00E9. Les donn\00E9es sources du rapport ont \00E9t\00E9 modifi\00E9es.')
,p_version_scn=>2704816
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905059091751279)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Un num\00E9ro de page valide doit \00EAtre sp\00E9cifi\00E9, par exemple p?n=1234.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909242080751281)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'fr-ca'
,p_message_text=>'Suivant'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909388133751281)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'fr-ca'
,p_message_text=>'Jeu suivant'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909414743751281)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138909582164751281)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Jeu pr\00E9c\00E9dent')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019282756751314)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner une pagination')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949210962751293)
,p_name=>'PASSWORD'
,p_message_language=>'fr-ca'
,p_message_text=>'Mot de passe'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138889980544751275)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Votre mot de passe pour %0 a \00E9t\00E9 modifi\00E9.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877624608751271)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe n''est pas conforme aux r\00E8gles de complexit\00E9 de mot de passe de ce site.')
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876741385751271)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Le nouveau mot de passe doit comporter au moins %0 caract\00E8res diff\00E9rents de ceux du mot de passe pr\00E9c\00E9dent.'),
''))
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877357820751271)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Le mot de passe ne doit pas contenir de nom d''utilisateur.'
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877581191751271)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe contient un mot simple non autoris\00E9.')
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877420375751271)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Le mot de passe ne doit pas contenir de nom d''espace de travail.'
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876667593751271)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe doit contenir au moins %0 caract\00E8res.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876857065751271)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe doit contenir au moins un caract\00E8re alphab\00E9tique (%0).')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877202188751271)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe doit contenir au moins un caract\00E8re alphab\00E9tique minuscule.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876988141751271)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe doit contenir au moins un caract\00E8re num\00E9rique (0123456789).')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877003812751271)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe doit contenir au moins un caract\00E8re de ponctuation (%0).')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877182546751271)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe doit contenir au moins un caract\00E8re alphab\00E9tique majuscule.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890436588751275)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Avis de r\00E9initialisation de mot de passe')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875559387751270)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le mot de passe ne peut pas \00EAtre utilis\00E9, car il a \00E9t\00E9 utilis\00E9 au cours des %0 derniers jours.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872275184751269)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Graphique en pourcentage'
,p_is_js_message=>true
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963862079751297)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9l\00E9ments')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138963922583751297)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9l\00E9ment')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938047425751289)
,p_name=>'PERCENT'
,p_message_language=>'fr-ca'
,p_message_text=>'Pourcentage'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907352440751280)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'fr-ca'
,p_message_text=>'Communiquez avec l''administrateur.'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019479813751314)
,p_name=>'PREVIOUS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pr\00E9c\00E9dent')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956082807751295)
,p_name=>'PRINT'
,p_message_language=>'fr-ca'
,p_message_text=>'Imprimer'
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936860615751289)
,p_name=>'PRIVILEGES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Privil\00E8ges')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138905421267751279)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9f\00E9rences de r\00E9gion')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926436768751286)
,p_name=>'REPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936762539751289)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('P\00E9riode de rapport')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019668806751314)
,p_name=>'REPORT_LABEL'
,p_message_language=>'fr-ca'
,p_message_text=>'Rapport : %0'
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937436875751289)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Total du rapport'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138883173421751273)
,p_name=>'RESET'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser la pagination')
,p_version_scn=>2704816
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911843164751281)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser la pagination')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941951186751290)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9initialiser le mot de passe')
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917770497751283)
,p_name=>'RESTORE'
,p_message_language=>'fr-ca'
,p_message_text=>'Restaurer'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138951334962751293)
,p_name=>'RESULTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9sultats')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943082675751291)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Retour \00E0 l''application.')
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138943473541751291)
,p_name=>'RIGHT'
,p_message_language=>'fr-ca'
,p_message_text=>'Droite'
,p_version_scn=>2704827
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975461798751301)
,p_name=>'ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Rang\00E9e %0')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926034915751286)
,p_name=>'ROW_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nombre de rang\00E9es')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815814690751253)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Consulter Oracle'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816151960751253)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer l''outil Consulter Oracle'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816452961751253)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste des avis'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816055646751253)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Ouvrir l''outil Consulter Oracle'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816374122751253)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'fr-ca'
,p_message_text=>'Carte des produits'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816242243751253)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste des suggestions'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817155220751253)
,p_name=>'RW_CLEAR'
,p_message_language=>'fr-ca'
,p_message_text=>'Effacer'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817019035751253)
,p_name=>'RW_CLOSE'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816822590751253)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir plus'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817239196751253)
,p_name=>'RW_GO_TO'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aller \00E0')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816692299751253)
,p_name=>'RW_GP_STEP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9tape')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816701068751253)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'fr-ca'
,p_message_text=>'de'
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816555524751253)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activer/d\00E9sactiver l''affichage des \00E9tapes')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815689074751253)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'fr-ca'
,p_message_text=>'Masquer le mot de passe'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138816933559751253)
,p_name=>'RW_OPEN'
,p_message_language=>'fr-ca'
,p_message_text=>'Ouvrir'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815403695751252)
,p_name=>'RW_ORACLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138815560734751252)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher le mot passe'
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138817353159751253)
,p_name=>'RW_START'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9but')
,p_is_js_message=>true
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138942461293751291)
,p_name=>'SAVE'
,p_message_language=>'fr-ca'
,p_message_text=>'Enregistrer'
,p_version_scn=>2704826
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938642161751289)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Alternatif par d\00E9faut')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939002985751290)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'fr-ca'
,p_message_text=>'Description'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938510921751289)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Principal par d\00E9faut')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939354116751290)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Plus de %0 rang\00E9es sont disponibles. Augmentez la valeur du s\00E9lecteur de rang\00E9e pour voir plus de rang\00E9es.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006755393751310)
,p_name=>'SEARCH'
,p_message_language=>'fr-ca'
,p_message_text=>'Rechercher'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898269283751277)
,p_name=>'SECONDS'
,p_message_language=>'fr-ca'
,p_message_text=>'secondes'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938117517751289)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'fr-ca'
,p_message_text=>'Voir le fichier joint'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138998722121751308)
,p_name=>'SELECT_ROW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('S\00E9lectionner une rang\00E9e')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937800957751289)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9sactiver le mode Lecteur d''\00E9cran')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937910342751289)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Activer le mode Lecteur d''\00E9cran')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934116915751288)
,p_name=>'SHOW'
,p_message_language=>'fr-ca'
,p_message_text=>'Afficher'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000595703751308)
,p_name=>'SHOW_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout afficher'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139025364874751315)
,p_name=>'SIGN_IN'
,p_message_language=>'fr-ca'
,p_message_text=>'Connexion'
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138976228658751301)
,p_name=>'SIGN_OUT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9connexion')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927018405751286)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 jours'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934684540751288)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 jours \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926906484751286)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 heures'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934528168751288)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 heures \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926809617751286)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 minutes'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934494074751288)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 minutes \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927256274751286)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 mois'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934849918751288)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 mois \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935089783751288)
,p_name=>'SINCE_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>'Maintenant'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138926723510751286)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 secondes'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934309178751288)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 secondes \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927185984751286)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 semaines'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934741176751288)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 semaines \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138927300229751286)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'fr-ca'
,p_message_text=>'Il y a %0 ans'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138934960489751288)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 ans \00E0 partir de maintenant')
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920896913751284)
,p_name=>'STANDARD'
,p_message_language=>'fr-ca'
,p_message_text=>'Standard'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937711854751289)
,p_name=>'START_DATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Date de d\00E9but')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872977631751270)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous recevez ce courriel \00E0 partir de l''abonnement au rapport interactif cr\00E9\00E9 par %0.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034538607751318)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'fr-ca'
,p_message_text=>'Abonnements'
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983919405751303)
,p_name=>'TAB'
,p_message_language=>'fr-ca'
,p_message_text=>'Onglet'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898119357751277)
,p_name=>'TITLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Titre'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138877837599751271)
,p_name=>'TODAY'
,p_message_language=>'fr-ca'
,p_message_text=>'Aujourd''hui'
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937379465751289)
,p_name=>'TOTAL'
,p_message_language=>'fr-ca'
,p_message_text=>'Total'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879133829751271)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous pouvez s\00E9lectionner un maximum de %0 colonnes.')
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834912687751258)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tout r\00E9duire')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835565969751258)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('R\00E9duire tous les \00E9l\00E9ments en dessous')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834555079751258)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Tout d\00E9velopper')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835257885751258)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9velopper tous les \00E9l\00E9ments en dessous')
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835717088751259)
,p_name=>'TREE.REPARENT'
,p_message_language=>'fr-ca'
,p_message_text=>'Affecter un nouveau parent'
,p_is_js_message=>true
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957873478751295)
,p_name=>'TREES'
,p_message_language=>'fr-ca'
,p_message_text=>'Arbres'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139000698681751308)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Obligatoire'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138921579940751284)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Non autoris\00E9')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138971725374751299)
,p_name=>'UNAVAILABLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Non disponible'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935483368751288)
,p_name=>'UNKNOWN'
,p_message_language=>'fr-ca'
,p_message_text=>'Inconnu'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873889387751270)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Une erreur d''authentification non reconnue est survenue.'
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876033572751271)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Si vous ne souhaitez plus recevoir de courriels, cliquez sur <a href="%0">Se d\00E9sabonner</a> pour g\00E9rer votre abonnement.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138872820036751270)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Si vous ne souhaitez plus recevoir de courriels, allez \00E0 l''URL suivante pour g\00E9rer votre abonnement :')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138912378312751282)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('type de donn\00E9es non pris en charge')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899415382751278)
,p_name=>'UPDATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('mettre \00E0 jour')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898045636751277)
,p_name=>'UPDATED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mis \00E0 jour')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841203842751260)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mise \00E0 niveau en cours')
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138841534725751260)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Oracle APEXest en cours de mise \00E0 niveau vers une nouvelle version. Le processus dure g\00E9n\00E9ralement 3 minutes au maximum.')
,p_version_scn=>2704798
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904817351751279)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''URL demand\00E9e n''est pas autoris\00E9e. Communiquez avec l''administrateur.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138925935030751286)
,p_name=>'USER'
,p_message_language=>'fr-ca'
,p_message_text=>'Utilisateur'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138949172602751293)
,p_name=>'USERNAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom d''utilisateur'
,p_version_scn=>2704829
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990551479751305)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nom d''utilisateur est trop long. La limite est %0 caract\00E8res.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933002459751288)
,p_name=>'USERS'
,p_message_language=>'fr-ca'
,p_message_text=>'utilisateurs'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138990143335751305)
,p_name=>'USER_EXISTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nom d''utilisateur existe d\00E9j\00E0.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139003990759751309)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Image de profil pour l''utilisateur %0'
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865859671751268)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'fr-ca'
,p_message_text=>'Automatisation - %0'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864389029751267)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Page %0 - %1 '
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867267771751268)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138867364300751268)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866230424751268)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'fr-ca'
,p_message_text=>'Configuration de recherche - %0'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138866178209751268)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('LDV dynamique partag\00E9e - %0')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138865928794751268)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9finition de t\00E2che - %0')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138864450364751267)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'fr-ca'
,p_message_text=>'Flux de travail - %0 '
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886552368751274)
,p_name=>'VALID'
,p_message_language=>'fr-ca'
,p_message_text=>'Valide'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878185431751271)
,p_name=>'VALIDATIONS'
,p_message_language=>'fr-ca'
,p_message_text=>'Validations'
,p_version_scn=>2704813
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938832826751290)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier une valeur')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985150602751303)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Une valeur doit \00EAtre sp\00E9cifi\00E9e pour %0')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907727092751280)
,p_name=>'VERTICAL'
,p_message_language=>'fr-ca'
,p_message_text=>'vertical'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899373753751278)
,p_name=>'VIEW'
,p_message_language=>'fr-ca'
,p_message_text=>'voir'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138933132890751288)
,p_name=>'VIEWS'
,p_message_language=>'fr-ca'
,p_message_text=>'vues'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138939645942751290)
,p_name=>'VIEW_ALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Tout voir'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879565218751272)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Lien masqu\00E9')
,p_is_js_message=>true
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138920332110751284)
,p_name=>'WARNING'
,p_message_language=>'fr-ca'
,p_message_text=>'Avertissement'
,p_is_js_message=>true
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138898932856751277)
,p_name=>'WEEK'
,p_message_language=>'fr-ca'
,p_message_text=>'semaine'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894851262751276)
,p_name=>'WEEKLY'
,p_message_language=>'fr-ca'
,p_message_text=>'Toutes les semaines'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899018817751278)
,p_name=>'WEEKS'
,p_message_language=>'fr-ca'
,p_message_text=>'semaines'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938944055751290)
,p_name=>'WELCOME_USER'
,p_message_language=>'fr-ca'
,p_message_text=>'Bienvenue : %0'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937183045751289)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur non valide trouv\00E9e. V\00E9rifiez les donn\00E9es entr\00E9es.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937250410751289)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur non valide trouv\00E9e. V\00E9rifiez les donn\00E9es entr\00E9es.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875037668751270)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur de date non valide trouv\00E9e. V\00E9rifiez le format de date.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138937080957751289)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur num\00E9rique non valide trouv\00E9e. V\00E9rifiez le format de nombre.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886104946751274)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur d''horodatage non valide trouv\00E9e. V\00E9rifiez le format d''horodatage.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138910657841751281)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de lier "%0". Utilisez des guillemets doubles pour les \00E9l\00E9ments multioctets, ou v\00E9rifiez que la longueur de l''\00E9l\00E9ment est \00E9gale ou inf\00E9rieure \00E0 30 octets. Utilisez la syntaxe v() pour r\00E9f\00E9rencer des \00E9l\00E9ments de plus de 30 octets.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900407679751278)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Acc\00E8s refus\00E9 par le contr\00F4le de s\00E9curit\00E9 %0')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902962028751279)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Application non disponible'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901308242751278)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Application introuvable.'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901421730751278)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'application=%0  espace de travail=%1'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901818937751278)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''acc\00E8s \00E0 cette application est restreint. R\00E9essayez plus tard.')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901766039751278)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('L''acc\00E8s \00E0 cette application est r\00E9serv\00E9 aux d\00E9veloppeurs d''application. R\00E9essayez plus tard.'),
''))
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900983077751278)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'ERR-7744 Impossible de traiter le branchement pour une fonction renvoyant une URL.'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900888237751278)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'ERR-7744 Impossible de traiter le branchement pour une fonction renvoyant une page.'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901157964751278)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'ERR-1430 L''appel de l''affichage depuis le processus de page n''est pas pris en charge : G_FLOW_STEP_ID (%0).'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902248324751278)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-1018 Erreur lors de l''effacement du cache d''\00E9tape.')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900643882751278)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'ERR-1005 Type de calcul inconnu.'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901520793751278)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-1201 ID session non d\00E9fini pour l''authentification personnalis\00E9e.')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901688380751278)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'page=%0'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138901288307751278)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-7620 Impossible de d\00E9terminer l''espace de travail pour l''application (%0).')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881772946751272)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'fr-ca'
,p_message_text=>'Modifier'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900365118751278)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-1802 ID \00E9l\00E9ment "%0" introuvable')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900020822751278)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-1002 ID introuvable pour l''\00E9l\00E9ment "%0" dans l''application "%1".')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900190907751278)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Erreur inattendue. Impossible de trouver le nom de l''\00E9l\00E9ment au niveau de l''application ou de la page.'),
''))
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900517159751278)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous \00EAtes d\00E9j\00E0 sur la premi\00E8re page de donn\00E9es.')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917072675751283)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ID \00E9l\00E9ment (%0) n''est pas un \00E9l\00E9ment d\00E9fini dans la page courante.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874627283751270)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de d\00E9finir l''\00E9l\00E9ment en transmettant des arguments \00E0 l''application.')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874900688751270)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('(Aucune somme de contr\00F4le n''a \00E9t\00E9 fournie)')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874441429751270)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''\00E9l\00E9ment peut \00EAtre d\00E9fini s''il est accompagn\00E9 d''une somme de contr\00F4le de type "signet de niveau utilisateur".')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874313824751270)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''\00E9l\00E9ment peut \00EAtre d\00E9fini s''il est accompagn\00E9 d''une somme de contr\00F4le de type "signet de niveau application".')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874573560751270)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''\00E9l\00E9ment peut \00EAtre d\00E9fini s''il est accompagn\00E9 d''une somme de contr\00F4le de type "session".')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874288299751270)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''\00E9l\00E9ment n''a aucune protection.')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902372006751279)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'fr-ca'
,p_message_text=>'Aucune aide disponible sur la page.'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138890283622751275)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''espace de travail %0 n''a pas les privil\00E8ges n\00E9cessaires pour effectuer une analyse en tant que sch\00E9ma %1.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900721540751278)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-1010 D\00E9passement de la limite de r\00E9cursivit\00E9 du traitement d''acceptation de branchement vers une page. %0')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138857200006751265)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Page non disponible, vous ne pouvez pas ex\00E9cuter un mod\00E8le de page.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874888300751270)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cette page ne peut pas \00EAtre appel\00E9e \00E0 l''aide d''une URL ou d''une commande GET ou POST vers la proc\00E9dure d''affichage. Elle doit \00EAtre appel\00E9e \00E0 l''aide d''un branchement de type "Branchement vers une page".')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138959646595751296)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors de la tentative d''enregistrement d''une valeur non num\00E9rique dans l''\00E9l\00E9ment %0.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891906086751275)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le sch\00E9ma d''analyse de l''application "%0" n''existe pas dans la base de donn\00E9es.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138892019971751275)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les comptes de l''espace de travail INTERNAL ne peuvent \00EAtre utilis\00E9s que pour acc\00E9der \00E0 &PRODUCT_NAME. <a href="%0">Services d''administration</a>.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899991810751278)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-1029 Impossible de stocker les informations de session. session=%0 \00E9l\00E9ment=%1')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903017664751279)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''arr\00EAter la trace : %0')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138900219406751278)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur inattendue'
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911083790751281)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur dans update_substitution_cache : %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903189735751279)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Pour afficher l''aide, l''application et la page doivent \00EAtre indiqu\00E9es.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138924877653751285)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>'Automatisation introuvable.'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860374903751266)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur d''interrogation d''automatisation : %0'
,p_version_scn=>2704802
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904262502751279)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Sessions %0 \00E9pur\00E9es.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845590998751261)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''ex\00E9cuter le code %0. Il n''est pas pris en charge par la base de donn\00E9es ou n''est pas activ\00E9 par le param\00E8tre d''instance MLE_LANGUAGES.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138843176151751261)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le moteur multilingue n''est pas disponible pour cette version de base de donn\00E9es.')
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882392019751272)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le tableau de la collection d''applications ne doit pas \00EAtre vide')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882163944751272)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le num\00E9ro d''attribut de membre %0 sp\00E9cifi\00E9 n''est pas valide. Le num\00E9ro d''attribut doit \00EAtre compris entre 1 et %1')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882650619751273)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La collection d''applications existe d\00E9j\00E0.')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882429516751272)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nom de la collection ne peut pas \00EAtre nul')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882567371751273)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nom de la collection ne peut pas comporter plus de 255 caract\00E8res')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138881929426751272)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>'La collection d''applications %0 n''existe pas'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882790435751273)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'fr-ca'
,p_message_text=>'Le curseur n''est pas encore ouvert'
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882075017751272)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La s\00E9quence de membre %0 n''existe pas dans la collection d''applications %1')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882242054751272)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La s\00E9quence de membre %0 n''existe pas dans la collection d''applications "%1"')
,p_version_scn=>2704815
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138835061330751258)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'fr-ca'
,p_message_text=>'L''algorithme %0 n''est pas pris en charge pour ECDSA.'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834771842751258)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'fr-ca'
,p_message_text=>'La courbe elliptique de type %0 n''est pas prise en charge.'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960446982751296)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La fonction cryptographique "%0" n''est pas prise en charge par ce syst\00E8me.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012749898751312)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Accessibilit\00E9 test\00E9e')
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903775314751279)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'fr-ca'
,p_message_text=>'Fermer'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903840471751279)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'fr-ca'
,p_message_text=>'Options de personnalisation de page'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903986462751279)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Par d\00E9faut')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904031822751279)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Affich\00E9')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904152953751279)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Masqu\00E9 ')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903558817751279)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cochez les r\00E9gions que vous souhaitez voir figurer sur cette page. Les r\00E9gions coch\00E9es peuvent ne pas s''afficher si vous n''\00EAtes pas dans le bon contexte d''application ou si vous ne disposez pas des privil\00E8ges appropri\00E9s.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903637440751279)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'fr-ca'
,p_message_text=>'Cette page n''est pas personnalisable.'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013003783751312)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous pouvez personnaliser l''apparence de cette application en modifiant le style du th\00E8me. S\00E9lectionnez un style de th\00E8me dans la liste ci-dessous et cliquez sur Appliquer les modifications.')
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139013898549751312)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Affichage de la r\00E9gion')
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012971698751312)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Utiliser le style par d\00E9faut de l''application')
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139012888983751312)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'fr-ca'
,p_message_text=>'Apparence'
,p_version_scn=>2704845
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957054654751295)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''index de colonne r\00E9f\00E9renc\00E9 dans l''agr\00E9gat %0 n''existe pas.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849718485751263)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ajout de l''exportation de donn\00E9es n''est pas pris en charge pour le format %0.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138812720217751252)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>'La sortie CLOB n''est pas prise en charge pour le format %0.'
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956779375751295)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le changement de colonne doit se trouver au d\00E9but du tableau de colonnes.')
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956891593751295)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''index de groupe de colonnes r\00E9f\00E9renc\00E9 dans %0 n''existe pas.')
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863922008751267)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'exportation'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138871131508751269)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le format d''exportation doit \00EAtre XML avec ORDS comme serveur d''impression.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957124476751295)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''index de colonne r\00E9f\00E9renc\00E9 dans la mise en surbrillance %0 n''existe pas.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138860583099751266)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'fr-ca'
,p_message_text=>'Format d''exportation non valide : %0'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138956990213751295)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''index de groupe parent r\00E9f\00E9renc\00E9 dans %0 n''existe pas.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138982138577751303)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne %1 de la table %0 est une colonne d''identit\00E9 "GENERATED ALWAYS". Assurez-vous qu''aucune colonne source n''est mapp\00E9e \00E0 la colonne %1 dans la bo\00EEte de dialogue Configurer.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893790911751276)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''intervalle de validation sp\00E9cifi\00E9 est trop faible.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138893863693751276)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune colonne n''a \00E9t\00E9 fournie pour le chargement des donn\00E9es.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895106640751276)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune colonne trouv\00E9e pour le s\00E9lecteur de rang\00E9e "%0". Essayez la d\00E9tection automatique ou v\00E9rifiez la structure JSON.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904519916751279)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune feuille de calcul trouv\00E9e dans le fichier XLSX.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849688020751263)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les niveaux hi\00E9rarchiques demand\00E9s \00E0 d\00E9tecter (%0) d\00E9passent le maximum de %1.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904463790751279)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La feuille de calcul sp\00E9cifi\00E9e n''existe pas dans le fichier XLSX.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138882867869751273)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La version courante des donn\00E9es dans la base de donn\00E9es a chang\00E9 depuis le lancement de la mise \00E0 jour par l''utilisateur.')
,p_version_scn=>2704816
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885740213751274)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors de la mise \00E0 jour des colonnes du rapport : %0')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996250036751307)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'fr-ca'
,p_message_text=>'Impossible de convertir %0 en SDO_GEOMETRY.'
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932715645751288)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne %0 qui est du type de donn\00E9es %1 ne peut pas \00EAtre convertie en VARCHAR2.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940139901751290)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne "%0" sp\00E9cifi\00E9e pour l''attribut "%1" n''a pas \00E9t\00E9 trouv\00E9e dans la source de donn\00E9es.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876252928751271)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le type de filtre %0 n''est pas pris en charge pour les colonnes \00E0 valeurs multiples.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999706273751308)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'fr-ca'
,p_message_text=>'Filtre "compris entre" non valide.'
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138855340202751264)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune valeur %2 trouv\00E9e dans la colonne %0, rang\00E9e #%1.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138852020850751263)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne %0 ou la rang\00E9e #%1 n''existe pas.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838600641751259)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Type de LDV indiqu\00E9 non valide.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838527469751259)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Type d''interrogation non valide. Le type d''interrogation doit avoir pour valeur Table, Interrogation SQL ou Fonction PL/SQL renvoyant une interrogation SQL.'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932898081751288)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\00C9chec de l''analyse de l''interrogation SQL.'),
'%0'))
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940236260751290)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La position de colonne %0 sp\00E9cifi\00E9e pour l''attribut "%1" n''a pas \00E9t\00E9 trouv\00E9e dans l''\00E9nonc\00E9 SQL.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138830224222751257)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Trop d''\00E9l\00E9ments utilis\00E9s dans le filtre multivaleur.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940028505751290)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune colonne n''est sp\00E9cifi\00E9e pour l''attribut "%0".')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838461813751259)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le corps de la fonction PL/SQL n''a pas retourn\00E9 de valeur.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138955870768751295)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La source de donn\00E9es REST ne contient pas d''op\00E9ration permettant de traiter l''action LMD demand\00E9e.')
,p_version_scn=>2704833
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997537442751307)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les filtres d''intervalle ne sont pris en charge que pour les types de donn\00E9es NUMBER, DATE et TIMESTAMP.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138818414347751253)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec de la demande avec %0')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138821991796751254)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La conversion de GeoJSON en SDO_GEOMETRY (colonne %0) n''est pas disponible dans cette base de donn\00E9es.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825364710751255)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La conversion SDO_GEOMETRY (colonne %0) n''est pas prise en charge pour les sources de donn\00E9es XML.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138849421252751263)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le caract\00E8re %0 n''est pas pris en charge comme s\00E9parateur de valeurs multiples.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138997617157751307)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cette fonction ne peut pas \00EAtre utilis\00E9e dans un contexte d''interrogation.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138825476190751255)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Non-concordance de type de donn\00E9es de colonne.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138858904301751265)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cette source de donn\00E9es ne prend pas en charge la modification de plusieurs rang\00E9es.')
,p_version_scn=>2704801
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838352652751259)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9passement des limites de liaison ORDS OUT internes. R\00E9duisez le nombre de rang\00E9es LMD.')
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138941053545751290)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Impossible d''analyser la r\00E9ponse JSON du serveur distant : '),
'%0'))
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138838289354751259)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Type de contexte inconnu ou incorrect.'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138862345243751266)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'fr-ca'
,p_message_text=>'Composants non pris en charge pour une exportation lisible : %0'
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138960391544751296)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>'Ce type de fichier n''est pas pris en charge par l''analyseur.'
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911116685751281)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Acc\00E8s non autoris\00E9 (wwv_flow_api.set_credentials non d\00E9fini).')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138886028594751274)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''espace de travail n''a pas \00E9t\00E9 cr\00E9\00E9 car il existe d\00E9j\00E0.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885900693751274)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le groupe d''utilisateurs n''a pas \00E9t\00E9 cr\00E9\00E9 car il existe d\00E9j\00E0.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897383964751277)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nom d''utilisateur en double trouv\00E9 pour %0.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897461090751277)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du chargement des utilisateurs. \00C9chec pour l''utilisateur %0.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908227573751280)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 utilisateurs auraient \00E9t\00E9 charg\00E9s.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908025166751280)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'fr-ca'
,p_message_text=>'Mot de passe'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138908117082751280)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Privil\00E8ges')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907818700751280)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'fr-ca'
,p_message_text=>'Nom d''utilisateur'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988256300751304)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du rendu de l''\00E9l\00E9ment de page #COMPONENT_NAME#.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903208868751279)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''afficher l''\00E9l\00E9ment de page car le formulaire HTML n''\00E9tait pas encore ouvert.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138861615375751266)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du calcul de la valeur par d\00E9faut pour l''\00E9l\00E9ment de page #COMPONENT_NAME#.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902534691751279)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du post-calcul de l''\00E9l\00E9ment de page #COMPONENT_NAME#.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902482292751279)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors du calcul de la valeur source de l''\00E9l\00E9ment de page #COMPONENT_NAME#.')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879227588751272)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Acc\00E8s non autoris\00E9.')
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828770169751256)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur %0 de %1 n''est pas un tableau JSON valide.'
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902728134751279)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'fr-ca'
,p_message_text=>'JavaScript non pris en charge.'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902834106751279)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'fr-ca'
,p_message_text=>'Liste'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138903497236751279)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'fr-ca'
,p_message_text=>'Impossible d''initialiser l''interrogation.'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911475202751281)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La mise \00E0 jour de %0 n''est pas prise en charge.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904950420751279)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ID \00E9l\00E9ment non valide : %0 ')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932640649751288)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Il n''existe aucune aide pour cet \00E9l\00E9ment.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894426739751276)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec de la g\00E9n\00E9ration de l''interrogation de graphique. V\00E9rifiez les param\00E8tres de mappage source-colonne.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895772644751277)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur non valide pour le param\00E8tre p_mail_id : %0')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138932440869751288)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''utiliser le contenu du champ "\00C0" ou "R\00E9pondre \00E0" comme adresse d''exp\00E9diteur, car ces champs contiennent plusieurs adresses de courriel.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139017356318751313)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous avez d\00E9pass\00E9 le nombre maximal de courriels par espace de travail. Communiquez avec l''administrateur.')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138873964472751270)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Cette proc\00E9dure doit \00EAtre appel\00E9e \00E0 partir d''une session d''application.')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895617095751276)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Valeur nulle indiqu\00E9e pour le param\00E8tre %0.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138953757703751294)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Mod\00E8le de courriel "%0" introuvable dans l''application %1.')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139030209745751317)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le param\00E8tre d''instance SMTP_HOST_ADDRESS doit \00EAtre d\00E9fini pour l''envoi de courriels.')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138895073288751276)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>'Vous devez indiquer au moins un destinataire pour l''envoi de courriel.'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139019713623751314)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''\00E9tablir une connexion SMTP avec le serveur de courriel configur\00E9.')
,p_version_scn=>2704847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995066794751306)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'fr-ca'
,p_message_text=>'Appel Ajax non valide.'
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878925834751271)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune fonction Ajax n''a \00E9t\00E9 d\00E9finie pour le plugiciel %0')
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985528997751304)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune fonction d''ex\00E9cution n''a \00E9t\00E9 d\00E9finie pour le plugiciel %0')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879097581751271)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune fonction de rendu n''a \00E9t\00E9 d\00E9finie pour le plugiciel %0')
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995952742751307)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le plugiciel de source de donn\00E9es REST "%0" ne contient pas de fonction de capacit\00E9s.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138995819830751307)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le plugiciel de source de donn\00E9es REST "%0" ne contient pas de fonction LMD.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996023806751307)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le plugiciel de source de donn\00E9es REST "%0" ne contient pas de fonction d''ex\00E9cution.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138996197804751307)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le plugiciel de source de donn\00E9es REST "%0" ne contient pas de fonction d''extraction.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876422027751271)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur dans le code PLSQL g\00E9n\00E9r\00E9e pendant le traitement du plugiciel.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885020521751273)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous devez sp\00E9cifier une valeur.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138918082409751283)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le type de donn\00E9es %0 ne peut pas \00EAtre converti en VARCHAR2.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006268601751310)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne "%0" sp\00E9cifi\00E9e pour l''attribut "%1" n''a pas \00E9t\00E9 trouv\00E9e dans l''\00E9nonc\00E9 SQL.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138833570547751258)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'fr-ca'
,p_message_text=>'La valeur %0 de %1 n''est pas un tableau JSON valide.'
,p_version_scn=>2704797
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983440751751303)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Une interrogation de type liste de valeurs (LDV) ou liste de valeurs nomm\00E9e doit \00EAtre sp\00E9cifi\00E9e pour %0.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138985041380751303)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le nombre de colonnes s\00E9lectionn\00E9es dans l''interrogation SQL de LDV pour %0 est incorrect. Consultez les exemples d''\00E9nonc\00E9s valides.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006097857751310)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Aucune colonne n''est sp\00E9cifi\00E9e pour l''attribut "%0".')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139035222433751318)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La valeur entr\00E9e %0 pour l''attribut "%1" n''est pas num\00E9rique.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138988586754751304)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('%0 a un type de donn\00E9es incorrect dans l''\00E9nonc\00E9 SQL. Le num\00E9ro de colonne %1 est %2 mais %3 est attendu.')
,p_version_scn=>2704838
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139006100096751310)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La colonne "%0" sp\00E9cifi\00E9e pour l''attribut "%1" a le type de donn\00E9es %2 mais devrait avoir le type %3.')
,p_version_scn=>2704842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138875623537751270)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'fr-ca'
,p_message_text=>'Impossible de trouver la disposition du rapport.'
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138863212147751267)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('D\00E9passement de la limite du nombre d''ex\00E9cutions en arri\00E8re-plan pour %0.')
,p_version_scn=>2704804
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813581691751252)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Une autre ex\00E9cution de %0 est d\00E9j\00E0 en cours.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138813470627751252)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Une autre ex\00E9cution de %0 est d\00E9j\00E0 en cours pour le contexte %1.')
,p_version_scn=>2704793
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138828438382751256)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les fichiers charg\00E9s ne sont pas visibles dans la session de travail pour l''ex\00E9cution de %0.')
,p_version_scn=>2704796
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940920143751290)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La fonction de calcul de la somme ne peut pas \00EAtre utilis\00E9e pour les rapports bas\00E9s sur une source de donn\00E9es REST.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138902685437751279)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ERR-2904 Impossible de d\00E9finir la valeur de raccourci.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907602236751280)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur : Type de raccourci inconnu.'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138845396578751261)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'fr-ca'
,p_message_text=>'L''interrogation de recherche dure trop longtemps.'
,p_version_scn=>2704800
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138896795825751277)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible d''extraire le param\00E8tre authentication_scheme dans l''application %0.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138904763324751279)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Impossible d''extraire le composant %0.'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138975093697751300)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''ID locataire existe d\00E9j\00E0 pour la session courante.')
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138907967978751280)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'fr-ca'
,p_message_text=>'Courriel'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034790871751318)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('\00C9chec de l''authentification.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138935353193751288)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Un ou plusieurs t\00E9moins d\00E9finis dans apex_util.g_request_cookies contiennent une valeur non valide.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138917243475751283)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La r\00E9ponse du registre UDDI n''\00E9tait pas valide.')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138876595266751271)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('L''URL fournie n''a pas retourn\00E9 de document WSDL valide.')
,p_version_scn=>2704812
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138879328672751272)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Le document WSDL contient plusieurs liaisons SOAP. &PRODUCT_NAME. ne prend en charge que les documents WSDL ayant une seule liaison SOAP. Cliquez sur Cr\00E9er manuellement une r\00E9f\00E9rence de service Web pour continuer la cr\00E9ation d''une r\00E9f\00E9rence pour ce s')
||'ervice.',
''))
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138954915722751294)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('La r\00E9ponse du service n''\00E9tait pas au format XML.')
,p_version_scn=>2704832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034661880751318)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le jeton d''acc\00E8s OAuth n''est pas valide ou a expir\00E9.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138999197723751308)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Vous avez d\00E9pass\00E9 le nombre maximal de demandes de service Web par espace de travail. Communiquez avec l''administrateur.')
,p_version_scn=>2704841
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139034824758751318)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le serveur a r\00E9pondu avec un type de jeton OAuth non pris en charge.')
,p_version_scn=>2704848
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878731244751271)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le document WSDL ne contenait pas de liaison pour SOAP, ce qui est n\00E9cessaire pour l''ajout de r\00E9f\00E9rence.')
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138874133806751270)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ce document WSDL n\00E9cessite des donn\00E9es d''identification pour l''authentification. Indiquez le nom d''utilisateur et le mot de passe ci-dessous.')
,p_version_scn=>2704811
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138885173696751273)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le document WSDL n''a pas pu \00EAtre interpr\00E9t\00E9 par le moteur de rendu. Cliquez sur Cr\00E9er une r\00E9f\00E9rence de service Web manuellement pour continuer la cr\00E9ation d''une r\00E9f\00E9rence pour ce service.')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138957911516751295)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Impossible de traiter la mise \00E0 jour.')
,p_version_scn=>2704834
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983765075751303)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'fr-ca'
,p_message_text=>'La colonne de retour et la colonne d''affichage de la liste de valeurs sont identiques.'
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138983625426751303)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'La liste de valeurs n''a pas de colonne de retour.',
''))
,p_version_scn=>2704837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911307381751281)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>'Erreur lors de l''extraction de la valeur de colonne : %0'
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936238067751289)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Les donn\00E9es du formulaire tabulaire courant sont trop anciennes; les donn\00E9es sources ont \00E9t\00E9 modifi\00E9es.<br/>Cliquez <strong><a href="%0">ici</a></strong> pour abandonner vos modifications et recharger les donn\00E9es depuis la base de donn\00E9es.')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891467776751275)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors de la d\00E9termination de la cha\00EEne de pagination')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891329721751275)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('impossible de d\00E9terminer les en-t\00EAtes d''interrogation :'),
'%0'))
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891503666751275)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'fr-ca'
,p_message_text=>'erreur lors du remplacement des pieds de page du rapport'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891627008751275)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('\00E9chec de l''analyse de l''interrogation SQL :'),
'%0',
'%1'))
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897743445751277)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Nombre minimal de rang\00E9es demand\00E9es : %0, rang\00E9es trouv\00E9es mais non affich\00E9es : %1')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894116758751276)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('la colonne d''interrogation #%0 (%1) n''est pas valide, les colonnes qui utilisent du HTML n\00E9cessitent des noms d''alias')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138911207826751281)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Erreur lors de l''obtention des en-t\00EAtes d''interrogation : %0')
,p_version_scn=>2704822
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891765556751275)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'erreur de rapport :',
'%0'))
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138931833180751287)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'fr-ca'
,p_message_text=>'Trier en fonction de cette colonne'
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894208286751276)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'fr-ca'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Impossible d''analyser l''interrogation, v\00E9rifiez la syntaxe de votre interrogation.'),
'(%0)',
'</p>'))
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936337253751289)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Ce formulaire contient des modifications non enregistr\00E9es. Cliquez sur OK pour continuer sans enregistrer vos modifications. ')
,p_version_scn=>2704823
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138940840291751290)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('Le sch\00E9ma de pagination du rapport (%0) n''est pas pris en charge par la source de donn\00E9es s\00E9lectionn\00E9e.')
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138894074614751276)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'fr-ca'
,p_message_text=>'la colonne d''interrogation #%0 (%1) n''est pas valide, utilisez un alias de colonne'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897889683751277)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('rang\00E9e(s) %0 - %1 de plus de %2')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138938315123751289)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 - %1 de plus de %2'
,p_version_scn=>2704824
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138897619113751277)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('rang\00E9e(s) %0 - %1 de %2')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138878451599751271)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'fr-ca'
,p_message_text=>'%0 - %1 de %2'
,p_version_scn=>2704814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891807637751275)
,p_name=>'Y'
,p_message_language=>'fr-ca'
,p_message_text=>'Y'
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138899181677751278)
,p_name=>'YEAR'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ann\00E9e')
,p_version_scn=>2704820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138891067751751275)
,p_name=>'YEARS'
,p_message_language=>'fr-ca'
,p_message_text=>unistr('ann\00E9es')
,p_version_scn=>2704819
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138936438125751289)
,p_name=>'YES'
,p_message_language=>'fr-ca'
,p_message_text=>'Oui'
,p_version_scn=>2704824
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
 p_id=>wwv_flow_imp.id(109678305570583962.4497)
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
 p_id=>1.4497
,p_name=>'Messages'
,p_alias=>'MESSAGES'
,p_step_title=>'Messages'
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
