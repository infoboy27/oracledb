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
,p_default_application_id=>4470
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4470 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4470
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
--         Themes:                 1
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
--   Instance ID:     1000199029436341
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'RUNTIME-MESSAGES')
,p_application_group=>wwv_flow_imp.id(91050719712959059)
,p_application_group_name=>'APEX Product'
,p_application_group_comment=>'Applications shipped with the APEX product distribution'
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422164159'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962)
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
,p_pass_ecid=>'N'
,p_security_scheme=>wwv_flow_imp.id(860535012146524358)
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_version_scn=>2483339
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(4470)
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
 p_id=>wwv_flow_imp.id(728504220438374)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467)
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
 p_id=>wwv_flow_imp.id(124389732573989299)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988)
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
 p_id=>wwv_flow_imp.id(285800719532138903)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123)
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
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(914833342253396036)
,p_group_name=>'Reporting'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(914830413592381728)
,p_group_name=>'User Management'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(649613204592764515)
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
 p_id=>wwv_flow_imp.id(850359229090693491)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog'
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
,p_reference_id=>689061037088924910
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526110820992194)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491)
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
 p_id=>wwv_flow_imp.id(851037359784626333)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog'
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
,p_reference_id=>120828417372192930
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473352245977306)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333)
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
 p_id=>wwv_flow_imp.id(851037631091626378)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen'
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
,p_reference_id=>689595297061847770
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2495515088702127)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378)
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
 p_id=>wwv_flow_imp.id(851039898661626389)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar'
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
,p_reference_id=>637437892049443496
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2418665544706094)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389)
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
 p_id=>wwv_flow_imp.id(851040471818626394)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar'
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
,p_reference_id=>386895861966224222
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537388880131854)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394)
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
 p_id=>wwv_flow_imp.id(851041812938626395)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard'
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
,p_reference_id=>702692008314080052
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212309210289451)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395)
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
 p_id=>wwv_flow_imp.id(851042476105626395)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page'
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
,p_reference_id=>702684260095026477
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485266589875353)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395)
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
 p_id=>wwv_flow_imp.id(514381861202541059)
,p_template_name=>'APEX 5.0 - Button'
,p_internal_name=>'APEX_5.0_BUTTON'
,p_template=>'<button onclick="#JAVASCRIPT#" class="a-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="a-Button a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174750904387485475
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_menu_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(514382190540541061)
,p_template_name=>'APEX 5.0 - Icon Menu Button'
,p_internal_name=>'APEX_5.0_ICON_MENU_BUTTON'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton js-menuButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class='
||'"a-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_reference_id=>3705338883615
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_only_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(514382538845541061)
,p_template_name=>'APEX 5.0 - Icon Only Button'
,p_internal_name=>'APEX_5.0_ICON_ONLY_BUTTON'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--withIcon #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" aria-label="#LABEL!ATTR#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CL'
||'ASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>353820721334283301
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button_large
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(620629666890811728)
,p_template_name=>'APEX 5.0 - Button (Large)'
,p_internal_name=>'APEX_5.0_BUTTON_LARGE'
,p_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--large #BUTTON_CSS_CLASSES#" type="button" role="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--large a-Button--hot #BUTTON_CSS_CLASSES#" type="button" role="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174756119980565636
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button_small
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(620629778318811745)
,p_template_name=>'APEX 5.0 - Button (Small)'
,p_internal_name=>'APEX_5.0_BUTTON_SMALL'
,p_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--small #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_hot_template=>'<button value="#LABEL!ATTR#" onclick="#JAVASCRIPT#" class="a-Button a-Button--small a-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL!HTML#</button>'
,p_reference_id=>174755910284562884
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button_with_icon
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(868252865986181054)
,p_template_name=>'APEX 5.0 - Button with Icon'
,p_internal_name=>'APEX_5.0_BUTTON_WITH_ICON'
,p_template=>'<button class="a-Button a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#>#LABEL!HTML#<span class="a-Icon #ICON_CSS_CLASSES#"></span></button>'
,p_reference_id=>404889142313786233
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(514338947870435171)
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
,p_reference_id=>174748721787471587
,p_translate_this_template=>'N'
,p_template_comment=>'      <button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--noUI a-Button--goToTop" onclick="uF();" type="button" title="&TOP."><span class="a-Icon icon-up-chevron"></span></button>'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962385277500935)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171)
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
 p_id=>wwv_flow_imp.id(514343873675436760)
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
,p_reference_id=>716895227337398760
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585474981747544)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760)
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
 p_id=>wwv_flow_imp.id(771803843049318447)
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
,p_reference_id=>399850559367741099
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207496127505978)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447)
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
 p_id=>wwv_flow_imp.id(850406444708718383)
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
,p_reference_id=>687153470345619376
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2204663592232325)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383)
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
 p_id=>wwv_flow_imp.id(850442966147812557)
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
,p_reference_id=>702777601713950915
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3346988371508588)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557)
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
 p_id=>wwv_flow_imp.id(856206049762521193)
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
,p_reference_id=>746362351042209764
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526185270486606)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193)
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
 p_id=>wwv_flow_imp.id(914802799655239969)
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
,p_reference_id=>42210710875242480
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183211858816924)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969)
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
 p_id=>wwv_flow_imp.id(914803495164240003)
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
,p_reference_id=>703469000349150769
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373447170510516)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003)
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
 p_id=>wwv_flow_imp.id(915210356236972585)
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
,p_reference_id=>678354360586321695
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2899946654493378)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585)
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
 p_id=>wwv_flow_imp.id(915371118115573423)
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
,p_reference_id=>689955986849128825
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2695578355491332)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423)
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
 p_id=>wwv_flow_imp.id(1274355059486017828)
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
,p_reference_id=>1147280303078953726
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61232728057733462)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828)
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
 p_id=>wwv_flow_imp.id(514332014414430986)
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
,p_reference_id=>573607518145151423
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_menu_popup
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(514332292784430987)
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
,p_reference_id=>747588010155545129
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_image_navigation
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(860563697365629462)
,p_list_template_current=>'<li class="a-ImageNav-item"><button type="button" data-link="#LINK#" class="a-ImageNav-link launch-aut #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></button></li>'
,p_list_template_noncurrent=>'<li class="a-ImageNav-item"><a href="#LINK#" class="a-ImageNav-link #A01#"><span class="a-ImageNav-img gi-icon-#IMAGE#"></span><span class="a-ImageNav-label">#TEXT_ESC_SC#</span></a></li>'
,p_list_template_name=>'APEX 5.0 - Image Navigation'
,p_internal_name=>'APEX_5.0_IMAGE_NAVIGATION'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<ul class="a-ImageNav #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>481290423891543508
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
 p_id=>wwv_flow_imp.id(865273508717512144)
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
,p_reference_id=>687902065557685310
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_media_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(908020362212234651)
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
,p_reference_id=>692720897220784060
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_links_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(914818080687341593)
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
,p_reference_id=>60219508156141083
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_badge_list_named_column
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(851049711466639395)
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
,p_reference_id=>488487951233692049
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_badge_list_row
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(851054516889639461)
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
,p_reference_id=>689060248369886348
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_links_list
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(851055225644639463)
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
,p_reference_id=>17383712077884846
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_standard_report
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(851056531929639482)
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
,p_reference_id=>123725814882271159
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_portlet_column_template
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(914792024808213039)
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
,p_reference_id=>43020300221196425
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_portlet_row_template
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(914792322768213043)
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
,p_reference_id=>46763700145123930
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_one_column_unordered_list
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(915377874236666939)
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
,p_reference_id=>123725814882271159
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_5_0_app_cards_report
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(1041941432531249038)
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
,p_reference_id=>932268343459577530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_dynamic_attribute
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(850683711614406253)
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
,p_reference_id=>692681574974429799
,p_translate_this_template=>'N'
,p_template_comment=>'<label for="#CURRENT_ITEM_NAME#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(851047536471633848)
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
,p_reference_id=>487444299516703815
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label_above
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(851047676005633854)
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
,p_reference_id=>492676964457041934
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_required_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(851047684809633856)
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
,p_reference_id=>487443659585685414
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_required_label_above
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(851047795461633856)
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
,p_reference_id=>492677038682043223
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden_label_read_by_screen_reader
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(860542631889572088)
,p_template_name=>'Hidden label, read by screen reader'
,p_internal_name=>'HIDDEN_LABEL,_READ_BY_SCREEN_READER'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999" class="hideMeButHearMe">'
,p_template_body2=>'</label>'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#'
,p_theme_id=>3
,p_theme_class_id=>13
,p_reference_id=>4903009179971452
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/apex_5_0_hidden_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(1321751941832424103)
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
,p_reference_id=>687907221148719616
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/apex_5_0_breadcrumbs
begin
wwv_flow_imp_shared.create_menu_template(
 p_id=>wwv_flow_imp.id(514333590213433126)
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
,p_reference_id=>689285808648404711
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_imp_shared.create_popup_lov_template(
 p_id=>wwv_flow_imp.id(649611704621764507)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
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
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
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
,p_reference_id=>17343114994581872
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/default_calander
begin
wwv_flow_imp_shared.create_calendar_template(
 p_id=>wwv_flow_imp.id(649611609668764506)
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
,p_reference_id=>353925314576528967
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(649611810437764510)
,p_theme_id=>3
,p_theme_name=>'APEX 5.0'
,p_theme_internal_name=>'APEX_5.0'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_current_theme_style_id=>wwv_flow_imp.id(182005134783173294)
,p_default_page_template=>wwv_flow_imp.id(851040471818626394)
,p_default_dialog_template=>wwv_flow_imp.id(850359229090693491)
,p_error_template=>wwv_flow_imp.id(851042476105626395)
,p_printer_friendly_template=>wwv_flow_imp.id(851040471818626394)
,p_default_button_template=>wwv_flow_imp.id(514381861202541059)
,p_default_region_template=>wwv_flow_imp.id(514338947870435171)
,p_default_form_template=>wwv_flow_imp.id(514338947870435171)
,p_default_tabform_template=>wwv_flow_imp.id(514338947870435171)
,p_default_report_template=>wwv_flow_imp.id(851056531929639482)
,p_default_label_template=>wwv_flow_imp.id(851047536471633848)
,p_default_menu_template=>wwv_flow_imp.id(514333590213433126)
,p_default_calendar_template=>wwv_flow_imp.id(649611609668764506)
,p_default_list_template=>wwv_flow_imp.id(514332014414430986)
,p_default_nav_list_template=>wwv_flow_imp.id(514332014414430986)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(514332014414430986)
,p_default_nav_list_position=>'TOP'
,p_default_option_label=>wwv_flow_imp.id(851047536471633848)
,p_default_required_label=>wwv_flow_imp.id(851047684809633856)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(3),'')
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(182005134783173294)
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
 p_id=>wwv_flow_imp.id(666074212329754757)
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
 p_id=>wwv_flow_imp.id(666074525535755551)
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
 p_id=>wwv_flow_imp.id(717250289307903026)
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
 p_id=>wwv_flow_imp.id(2336377640986141)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024)
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
 p_id=>wwv_flow_imp.id(856114830529058024)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676)
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
 p_id=>wwv_flow_imp.id(1487577187426769)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198)
,p_template_types=>'REGION'
);
end;
/
prompt --application/shared_components/globalization/language
begin
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(1410180289564366)
,p_translation_flow_id=>4546
,p_translation_flow_language_cd=>'uk'
,p_translation_comments=>'APEX Runtime Messages - Ukrainian'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(1410268276586386)
,p_translation_flow_id=>4547
,p_translation_flow_language_cd=>'vi'
,p_translation_comments=>'APEX Runtime Messages - Vietnamese'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720011324456906)
,p_translation_flow_id=>4498
,p_translation_flow_language_cd=>'ar'
,p_translation_comments=>'APEX Runtime Messages - Arabic'
,p_direction_right_to_left=>'Y'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720196291454272)
,p_translation_flow_id=>4481
,p_translation_flow_language_cd=>'hr'
,p_translation_comments=>'APEX Runtime Messages - Croatian'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720276797451397)
,p_translation_flow_id=>4496
,p_translation_flow_language_cd=>'cs'
,p_translation_comments=>'APEX Runtime Messages - Czech'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720393082449356)
,p_translation_flow_id=>4499
,p_translation_flow_language_cd=>'da'
,p_translation_comments=>'APEX Runtime Messages - Danish'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720410166447669)
,p_translation_flow_id=>4541
,p_translation_flow_language_cd=>'fi'
,p_translation_comments=>'APEX Runtime Messages - Finnish'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720593128445011)
,p_translation_flow_id=>4497
,p_translation_flow_language_cd=>'fr-ca'
,p_translation_comments=>'APEX Runtime Messages - French - Canada'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720631247442964)
,p_translation_flow_id=>4491
,p_translation_flow_language_cd=>'el'
,p_translation_comments=>'APEX Runtime Messages - Greek'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720758952441498)
,p_translation_flow_id=>4542
,p_translation_flow_language_cd=>'he'
,p_translation_comments=>'APEX Runtime Messages - Hebrew'
,p_direction_right_to_left=>'Y'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720881350439731)
,p_translation_flow_id=>4482
,p_translation_flow_language_cd=>'hu'
,p_translation_comments=>'APEX Runtime Messages - Hungarian'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109720942708436537)
,p_translation_flow_id=>4483
,p_translation_flow_language_cd=>'no'
,p_translation_comments=>'APEX Runtime Messages - Norwegian'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721029934435247)
,p_translation_flow_id=>4484
,p_translation_flow_language_cd=>'pl'
,p_translation_comments=>'APEX Runtime Messages - Polish'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721128547433695)
,p_translation_flow_id=>4543
,p_translation_flow_language_cd=>'ro'
,p_translation_comments=>'APEX Runtime Messages - Romanian'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721246574431918)
,p_translation_flow_id=>4544
,p_translation_flow_language_cd=>'ru'
,p_translation_comments=>'APEX Runtime Messages - Russian'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721447220423731)
,p_translation_flow_id=>4492
,p_translation_flow_language_cd=>'sr'
,p_translation_comments=>'APEX Runtime Messages - Serbian - Cyrillic'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721569363421840)
,p_translation_flow_id=>4485
,p_translation_flow_language_cd=>'sk'
,p_translation_comments=>'APEX Runtime Messages - Slovak'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721678407420129)
,p_translation_flow_id=>4486
,p_translation_flow_language_cd=>'sl'
,p_translation_comments=>'APEX Runtime Messages - Slovenian'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721788743414792)
,p_translation_flow_id=>4487
,p_translation_flow_language_cd=>'sv'
,p_translation_comments=>'APEX Runtime Messages - Swedish'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721851600402222)
,p_translation_flow_id=>4493
,p_translation_flow_language_cd=>'th'
,p_translation_comments=>'APEX Runtime Messages - Thai'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109721949376400484)
,p_translation_flow_id=>4488
,p_translation_flow_language_cd=>'tr'
,p_translation_comments=>'APEX Runtime Messages - Turkish'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(109802039575937042)
,p_translation_flow_id=>4489
,p_translation_flow_language_cd=>'sr-latn'
,p_translation_comments=>'APEX Runtime Messages - Serbian - Latin'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(110436433028385286)
,p_translation_flow_id=>4494
,p_translation_flow_language_cd=>'nl'
,p_translation_comments=>'APEX Runtime Messages - Dutch'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(110436582615359144)
,p_translation_flow_id=>4495
,p_translation_flow_language_cd=>'pt'
,p_translation_comments=>'APEX Runtime Messages - Portuguese (Portugal) (pt)'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(187872790236856966)
,p_translation_flow_id=>4545
,p_translation_flow_language_cd=>'is'
,p_translation_comments=>'APEX Runtime Messages - Icelandic'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513231000363239188)
,p_translation_flow_id=>4471
,p_translation_flow_language_cd=>'es'
,p_translation_comments=>'APEX Runtime Messages - Spanish'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513231166658240876)
,p_translation_flow_id=>4472
,p_translation_flow_language_cd=>'fr'
,p_translation_comments=>'APEX Runtime Messages - French'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513231241850242254)
,p_translation_flow_id=>4473
,p_translation_flow_language_cd=>'de'
,p_translation_comments=>'APEX Runtime Messages - German'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513231340515244399)
,p_translation_flow_id=>4474
,p_translation_flow_language_cd=>'it'
,p_translation_comments=>'APEX Runtime Messages - Italian'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513231581057248409)
,p_translation_flow_id=>4475
,p_translation_flow_language_cd=>'pt-br'
,p_translation_comments=>'APEX Runtime Messages - Brazilian Portuguese'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513231792164250149)
,p_translation_flow_id=>4476
,p_translation_flow_language_cd=>'zh-cn'
,p_translation_comments=>'APEX Runtime Messages - Simplified Chinese'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513231910827251759)
,p_translation_flow_id=>4477
,p_translation_flow_language_cd=>'zh-tw'
,p_translation_comments=>'APEX Runtime Messages - Traditional Chinese'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513232012707253194)
,p_translation_flow_id=>4478
,p_translation_flow_language_cd=>'ko'
,p_translation_comments=>'APEX Runtime Messages - Korean'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(513232098051253922)
,p_translation_flow_id=>4479
,p_translation_flow_language_cd=>'ja'
,p_translation_comments=>'APEX Runtime Messages - Japanese'
,p_direction_right_to_left=>'N'
);
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
 p_id=>wwv_flow_imp.id(51155503034194159)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_text=>'Column %0'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13171516960524093)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_text=>'Administrator'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13169925917498281)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_text=>'Username'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(165227926946634514)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_text=>'Access Denied'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60533207866610929)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_text=>'Your %0 account has been created.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(20152105108981523)
,p_name=>'ACCOUNT_LOCKED'
,p_message_text=>'The account is locked.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4289917863847367)
,p_name=>'AM_PM'
,p_message_text=>'AM / PM'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2201017074047146)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_text=>'action link'
,p_is_js_message=>true
,p_version_scn=>195983900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2200827370044477)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_text=>'dialog link'
,p_is_js_message=>true
,p_version_scn=>195990458
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(698828197778860023)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_text=>'Toggle %0'
,p_is_js_message=>true
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(930998725733423971)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_text=>'(Active)'
,p_is_js_message=>true
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1420265431143750)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_text=>'Chat cleared'
,p_is_js_message=>true
,p_version_scn=>1181450105
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1420030036144947)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_text=>'Clear chat'
,p_is_js_message=>true
,p_version_scn=>1181450083
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1408804824471935)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_text=>'Accept'
,p_is_js_message=>true
,p_version_scn=>1057827319
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1409080282471117)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_text=>'Deny'
,p_is_js_message=>true
,p_version_scn=>1052671205
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1407854426886434)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_text=>'Conversation History'
,p_is_js_message=>true
,p_version_scn=>1084920867
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1419631260147237)
,p_name=>'APEX.AI.COPIED'
,p_message_text=>'Copied'
,p_is_js_message=>true
,p_version_scn=>1181449989
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1419863437146137)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_text=>'Copied to clipboard'
,p_is_js_message=>true
,p_version_scn=>1181450043
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1419257319149223)
,p_name=>'APEX.AI.COPY'
,p_message_text=>'Copy'
,p_is_js_message=>true
,p_version_scn=>1181449809
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1419472901148109)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_text=>'Copy to clipboard'
,p_is_js_message=>true
,p_version_scn=>1181449844
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1409832398467311)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_text=>'Assistant'
,p_is_js_message=>true
,p_version_scn=>1079990642
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1413389464088521)
,p_name=>'APEX.AI.DISABLED'
,p_message_text=>'AI is disabled on workspace or instance level.'
,p_version_scn=>1016787675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3792232262172652)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_text=>'Generative AI Service with given ID or static ID not found.'
,p_version_scn=>1409124134
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3589575851546829)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_text=>'Authentication error or forbidden access (HTTP-%1) for URL %0. Please check the configuration of Generative AI Service %2.'
,p_version_scn=>2341618450
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1923143183844552)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_text=>'The HTTP request to Generative AI Service at %0 failed with HTTP-%1: %2'
,p_version_scn=>1409124092
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4188821450991735)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_text=>'Error in HTTP request to Generative AI Service for plugin %0 in mode %1. Please check the configuration of the Generative AI Service.'
,p_version_scn=>2367452222
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1486161356347107)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_text=>'Examples'
,p_is_js_message=>true
,p_version_scn=>131159023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1429715035293560)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_text=>'Assistant'
,p_is_js_message=>true
,p_version_scn=>1079990852
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1485997044344212)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>131160943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1429578727294571)
,p_name=>'APEX.AI.NAME_USER'
,p_message_text=>'You'
,p_is_js_message=>true
,p_version_scn=>1079990817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3081924070921867)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_text=>'OCI Generative AI currently doesn''t support chat experience with multiple messages.'
,p_version_scn=>207145643
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1801467208012296)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_text=>'Error processing the prompt %0 for application %1. Please check if the App Builder is available on this instance.'
,p_version_scn=>15910557
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2001769020571888)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_text=>'Unable to process response for AI Service %0, response %1'
,p_version_scn=>14840516
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2194954014147319)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_text=>'Send Message'
,p_is_js_message=>true
,p_version_scn=>1064385731
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1801279646004921)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_text=>'Error in backend AI Service %0'
,p_version_scn=>15905466
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1409284604470150)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_text=>'Message'
,p_is_js_message=>true
,p_version_scn=>1084920672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1409421387469181)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_text=>'Type your message here'
,p_is_js_message=>true
,p_version_scn=>1052671263
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1420469759142399)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_text=>'User avatar'
,p_is_js_message=>true
,p_version_scn=>1181450172
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1420614541141354)
,p_name=>'APEX.AI.USE_THIS'
,p_message_text=>'Use this'
,p_is_js_message=>true
,p_version_scn=>1181450197
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1409638285468380)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_text=>'You have an unsent message, are you sure?'
,p_is_js_message=>true
,p_version_scn=>1052671283
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(451141508450122968)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_text=>'Ajax call returned server error %0 for %1.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(106475728798332122)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_text=>'The application alias "%0" can not be converted to a unique application ID.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88273305533720195)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_text=>'ERR-1816 Unexpected error converting application alias p_flow_alias_or_id (%0).'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(591676729091791716)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_text=>'The application checksum provides an easy way to determine whether the same application is deployed across workspaces. You can compare this checksum to determine whether there is a match. '
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40690514015892568)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_text=>'Error processing authentication function.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9135721868360556)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_text=>'Error processing authentication function.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2150212318674594786)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_text=>'Tenant Name %0 returned by Oracle Cloud Identity Management isn''t authorized for the domain %1!<br/>Please <a href="&LOGOUT_URL.">re-login</a> and specify an authorized tenant name or change your URL.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5721610337697560)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_text=>'Your account "%0" does not have the necessary development privileges (DB_DEVELOPER or DB_ADMINISTRATOR)<br/>for workspace "%1"! Please <a href="&LOGOUT_URL.">re-login</a> after privileges have been provided.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4371710867584719)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_text=>'Tenant Name returned by Oracle Cloud Identity Management isn''t authorized for current workspace!<br/>Please <a href="&LOGOUT_URL.">re-login</a> and specify an authorized tenant name.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5740626203812907)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_text=>'For security reasons, running applications of this workspace via the domain in the URL is not allowed.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40689907724892515)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_text=>'Please ask your DBA to run $OH/rdbms/admin/catldap.sql.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40689700343892497)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_text=>'SYS.DBMS_LDAP package does not exist or is invalid.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40689521565892479)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_text=>'Error processing edit LDAP user function.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40690125759892533)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_text=>'Error processing LDAP authentication.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40693914827892897)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_text=>'Error in p_flow_page argument to login_page procedure.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40691927486892694)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_text=>'Invalid p_session in wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(169663922246485854)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_text=>'Malformed argument to wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40692522089892760)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_text=>'Null username passed to login procedure.'
,p_version_scn=>37165770887572
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12946822629088045)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_text=>'Please wait <span id="apex_login_throttle_sec">%0</span> seconds to sign in again.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(14687417938886622)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_text=>'The login attempt has been blocked.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(155899900117938935)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_text=>'Authentication "%0" not found'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(17907628863168637)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_text=>'Security group ID is null.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40690904166892604)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_text=>'Error executing post-authentication process.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40690325337892551)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_text=>'Error processing pre-authentication process.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(44051638199470109)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Please open the URL in the same browser where you initiated the Reset Password request.  If you click the Reset Password URL and are redirected to',
'the login page, please initiate the Reset Password again and leave the',
'browser open.'))
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1670105559928364548)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_text=>'Reset Password URL'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5740920114349485)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_text=>'Resource Manager consumer group %0 has not been granted to %1'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5741021181362284)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_text=>'Please use DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP to grant the missing privilege.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79172732436693997)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_text=>'Error processing session sentry function.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79173121832700399)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_text=>'Error processing session verification function.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79173901578732375)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_text=>'Please ask your %0 administrator to configure the engine for Oracle Application Server Single Sign-On.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100935918718000178)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_text=>'Illegal %0 in %1 token returned by sso.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40693123284892826)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_text=>'Please edit the authentication scheme and add the application name.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100933316706829275)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_text=>'Illegal caller of %0 procedure:'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100935131176928136)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_text=>'Invalid app session in urlc token: %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100931501852777682)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_text=>'Error in portal_sso_redirect: missing application registration information: %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79173525688729948)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_text=>'WWSEC_SSO_ENABLER_PRIVATE package does not exist or is invalid.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40692914409892809)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_text=>'Unable to find registered partner application name in authentication scheme.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100932020206782969)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_text=>'Please register this application as described in the installation guide.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79174630452750203)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_text=>'Error processing SSO authentication.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(799806132696038883)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_text=>'Unauthorized URL:  %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79171002345638006)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_text=>'Error processing authentication.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5740824967294546)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_text=>'Workspace "%0" is inactive. Contact your administrator.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5989311818506329)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_text=>'%0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13966207550271697)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_text=>'Access denied by Application security check'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13966829714278051)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_text=>'Access denied by Page security check'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13968714317387138)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_text=>'Error processing authorization.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(228902921022110575)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_text=>'Built with %0 using %1'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(228903391513113068)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_text=>'love'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(643378897162797830)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_text=>'Event Description'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(643378428282788989)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_text=>'End Date'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(643379036907799035)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_text=>'Event ID'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(643378226297787858)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_text=>'Start Date'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(643378679568790214)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_text=>'Event Title'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2401461409765337)
,p_name=>'APEX.CARD'
,p_message_text=>'Card'
,p_version_scn=>753386204
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2401620093781921)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_text=>'Card action'
,p_version_scn=>753397086
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40756646633347458)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_text=>'Visually hidden checkbox'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(50066027734401392)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_text=>'Checksum content error'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(50065620116399137)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_text=>'Checksum format error'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(339656274527285148)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_text=>'Copied to clipboard.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(328231522956808260)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_text=>'This browser does not support copy from a button or menu. Try Ctrl+C or Command+C.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(232058807483085715)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_text=>'Close'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1486076479850276)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_text=>'The Code Editor contents exceeds the item''s maximum length (actual %0, allowed %1 characters)'
,p_is_js_message=>true
,p_version_scn=>162633270
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(625197344451340225)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_text=>'Contrast'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(549998872368496251)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_text=>'Current'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(549997707269494236)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_text=>'Initial'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(614566634636837676)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_text=>'#LABEL# must be a valid color. Example: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5400988309665294)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_text=>'More colors'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5401193160596171)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_text=>'Open color picker'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1422884569358790)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_text=>'Alpha Slider, horizontal slider. Use arrow keys to navigate.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1422479309355876)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_text=>'Color Spectrum, 4 way slider. Use arrow keys to navigate.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1422603001357372)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_text=>'Hue Slider, vertical slider. Use arrow keys to navigate.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(549997518771491751)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_text=>'Choose a color'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(549999006957499016)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_text=>'Change color format'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475788463539232651)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_text=>'List of Values'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475790865654264259)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_text=>'Open list for: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(931214598024427227)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_text=>'(Completed)'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88386509585289082)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_text=>'Contact your application administrator.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(120878626231900703)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Contact your application administrator.',
'Details about this incident are available via debug id "%0".'))
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(619030758078664777)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_text=>'Correct errors before saving.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2404079148422449)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_text=>'%0. Press Backspace to delete.'
,p_is_js_message=>true
,p_version_scn=>37165772372521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(242283149264274948)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_text=>'%0 matches found'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513951716881079)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_text=>'1 match found'
,p_is_js_message=>true
,p_version_scn=>55045842
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(242282907550277355)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_text=>'No matches found'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1439759344123193)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_text=>'Others'
,p_is_js_message=>true
,p_version_scn=>68491702
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1439484576755248)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_text=>'%0 values selected'
,p_is_js_message=>true
,p_version_scn=>69693648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(937686590251125216)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_text=>'Current Progress'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(623763873105109247)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_text=>'File specified in %0 item does not exist in APEX_APPLICATION_TEMP_FILES.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(478434417196253607)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_text=>'Current version of data in database has changed since user initiated update process.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(352809701239220907)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_text=>'Do Not Load'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(660541357770378234)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_text=>'Preprocessing error'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(660361174740301619)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_text=>'Insert row'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942960922324150972)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_text=>'Sequence : Action'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(660361313874302630)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_text=>'Update row'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1906901404237764)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_text=>'Actions'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4601712633230720)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2543621214835900)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_text=>'%0 must be a date picker or a valid date, for example %1.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(313132051141130973)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_text=>'Clear'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6539272192129977)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_text=>'Done'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(20877919943122075)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_text=>'%0 has unsupported parts in the format mask: %1'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4601399752225665)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_text=>'Hour'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(246623924575623096)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_text=>'Popup Calendar: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4600969838222419)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_text=>'Week'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4601121561223320)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_text=>'WK'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4601567564229974)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_text=>'Minutes'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4601918954232902)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_text=>'Month'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4602520412237988)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_text=>'Next Month'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1824139538213120)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_text=>'Popup for %0'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4602317594236443)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_text=>'Previous Month'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(298995386791676600)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_text=>'Read only date picker'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4900502413273501)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_text=>'Select Date'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1827394203521299)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_text=>'Select Date and Time'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601804406958321)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_text=>'Select Day'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1900929616033900)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_text=>'Select Month and Year'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1602013159959540)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_text=>'Select Time'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1700214462461762)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_text=>'Today'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2424513521025513)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_text=>'#LABEL# must be a valid date, for example %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2423963489021393)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_text=>'#LABEL# must be between %0 and %1.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2424108520022973)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_text=>'#LABEL# must be on or after %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2424328975024119)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_text=>'#LABEL# must be on or before %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2004353344809449)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_text=>'Visually Hidden edit'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4602162338234658)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_text=>'Year'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(256090702884742274)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_text=>'#LABEL# is greater than specified maximum date %0.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(261691404725928457)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_text=>'#LABEL# does not match format %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(256090525955739426)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_text=>'#LABEL# is less than specified minimum date %0.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(256091613619745375)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_text=>'#LABEL# is not in valid range of %0 to %1.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(257684010343284698)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_text=>'#LABEL# is not within valid year range of %0 and %1.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2087993818520204)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_text=>'An internal error has occurred while processing the DBMS_CLOUD request.'
,p_version_scn=>8581081
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(622853037686069288)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_text=>'Cancel'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1141574914152086146)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_text=>'Close'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(53338042158467602)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_text=>'Confirmation'
,p_is_js_message=>true
,p_version_scn=>37165770887536
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317595751743049086)
,p_name=>'APEX.DIALOG.HELP'
,p_message_text=>'Help'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(622852433456064895)
,p_name=>'APEX.DIALOG.OK'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(622852683918067029)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_text=>'Save'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9473737006401042)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_text=>'Dialog Title'
,p_is_js_message=>true
,p_version_scn=>37165770887601
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(98852663263472042)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_text=>'Visually hidden dialog title'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1727993529669433)
,p_name=>'APEX.DOCGEN'
,p_message_text=>'Oracle Document Generator Pre-built Function'
,p_version_scn=>3585471
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2084295229396432)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_text=>'Error while printing a document.'
,p_version_scn=>8402490
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1414591573226656)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_text=>'%s does not support %1 as output.'
,p_version_scn=>10944626
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1727581220660135)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_text=>'Error "%0" invoking Oracle Document Generator Pre-built Function:'
,p_version_scn=>3586926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1467226723229935)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_text=>'A template is required.'
,p_version_scn=>13126587
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2406343658379129)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_text=>'Error during file download.'
,p_version_scn=>3952233
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2404870770906449)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_text=>'No downloadable data found.'
,p_version_scn=>3938673
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2845586266005175)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_text=>'This feature is not available on a Runtime-Only environment.'
,p_version_scn=>3201552531
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88360625618076097)
,p_name=>'APEX.ERROR'
,p_message_text=>'Error'
,p_is_js_message=>true
,p_version_scn=>1084921130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4931900987762602)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_text=>'The following error has occurred while executing the error handling callback: %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19931017514208460)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_text=>'Error occurred while painting error page: %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5947530396184044)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_text=>'Internal Error'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(888207622853346793)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Contact your administrator.',
'Details about this incident are available via debug id "%0".'))
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(784023907282949860)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_text=>'The database is open for read-only access.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2026538193185817588)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_text=>'ORA-28353: Failed to open wallet. Application data currently not accessible.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(790162199062386158)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_text=>'Sorry, this page isn''t available'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9047130835710266)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_text=>'Technical Info (only available for developers)'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(394626025444107510)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_text=>'Error Message'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(464263453605979983)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_text=>'Expected format: %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276365061398053155)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_text=>'User is already in Access Control List'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276364876592051643)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_text=>'Please confirm adding the following %0 user(s) to <strong>%1</strong> access control list.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276365800433057617)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_text=>'Duplicate user exists'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276365266604054311)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_text=>'Missing at-sign (@) in Email address'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276365414904055467)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_text=>'Missing period (.) in Email address'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276365622188056498)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_text=>'Username is too long'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276366238736059875)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_text=>'Only users defined in the application access control list may access this application'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276366464077060995)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_text=>'Unexpected Access Control Setting Value: %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276366010567058665)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_text=>'All authenticated users can access this application'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(562353207904351743)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_text=>'Disabled'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(562352858532347464)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_text=>'Enabled'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(564505432763712063)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_text=>'%0: Is Disabled'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(562353449653354905)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_text=>'%0: Is Enabled'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2402202740288936)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_text=>'Not Supported'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(93787647827195407)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_text=>'Off'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(93787419833194700)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_text=>'On'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(561775681620287538)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_text=>'not identified'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002846111519152)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_text=>'%0 Bytes'
,p_is_js_message=>true
,p_version_scn=>6726669
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2003621849529240)
,p_name=>'APEX.FILESIZE.GB'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>6726686
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2003136600522023)
,p_name=>'APEX.FILESIZE.KB'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>6726700
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2003478062526636)
,p_name=>'APEX.FILESIZE.MB'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>6726714
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(480881129624931954)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_text=>'Download'
,p_is_js_message=>true
,p_version_scn=>34192578
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2201793791378695)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_text=>'Options'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2201307299350294)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_text=>'Filter'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2201519582355642)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_text=>'Hide Facet'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9201596905005566)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_text=>'Add Filter'
,p_is_js_message=>true
,p_version_scn=>32507916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(236295232951042052)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_text=>'Applied Filter %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9412665699370654)
,p_name=>'APEX.FS.APPLY'
,p_message_text=>'Apply'
,p_is_js_message=>true
,p_version_scn=>32555008
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472559453998840506)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_text=>'Apply'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9412833425371611)
,p_name=>'APEX.FS.CANCEL'
,p_message_text=>'Cancel'
,p_is_js_message=>true
,p_version_scn=>32555026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3302303968951380)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_text=>'Bar Chart'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(612362482505461343)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_text=>'Others'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3302532099952580)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_text=>'Pie Chart'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(596314984318493695)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_text=>'Chart'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3301929112942744)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_text=>'Count'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472560704816840697)
,p_name=>'APEX.FS.CLEAR'
,p_message_text=>'Clear'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472560977407840730)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_text=>'Clear All'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472561286834840762)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_text=>'Clear %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(658004385893566842)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_text=>'Column %1, referenced by facet %0, is not available or unauthorized.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1403241372472352)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_text=>'Choose Filters to show'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(225204579874306115)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_text=>'%0 results'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(225204763554303786)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_text=>'%0 selected'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(246627452529960889)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_text=>'Current filters'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1431626898863315)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_text=>'Faceted Search requires a Data Source at the region level.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1501063245036251)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_text=>'Filters list'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(645135241167191471)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_text=>'Distinct value limit (%0) exceeded for facet %1.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472564915239841226)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_text=>'Facet %0 is not supported for DATE or TIMESTAMP columns.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472559699812840567)
,p_name=>'APEX.FS.FILTER'
,p_message_text=>'Filter %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4803097228694250)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_text=>'%0 (Filter Applied)'
,p_is_js_message=>true
,p_version_scn=>33888194
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472559931805840600)
,p_name=>'APEX.FS.GO'
,p_message_text=>'Go'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3902751995313571)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_text=>'contains %0'
,p_is_js_message=>true
,p_version_scn=>15761597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472563962810841096)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_text=>'equals %0'
,p_is_js_message=>true
,p_version_scn=>15761629
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3902188581310835)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_text=>'greater than %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3902393526311918)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_text=>'greater than or equal to %0'
,p_is_js_message=>true
,p_version_scn=>15761673
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3901721982308040)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_text=>'less than %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3901951686310012)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_text=>'less than or equal to %0'
,p_is_js_message=>true
,p_version_scn=>15761907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3804642229256545)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_text=>'does not contain %0'
,p_is_js_message=>true
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2200357487535355)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_text=>'not equals %0'
,p_is_js_message=>true
,p_version_scn=>15761932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3804860149258745)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_text=>'does not start with %0'
,p_is_js_message=>true
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3902570287312957)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_text=>'starts with %0'
,p_is_js_message=>true
,p_version_scn=>15761969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3607095699243820)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_text=>'Facet Selection'
,p_is_js_message=>true
,p_version_scn=>33515691
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1852345187228046)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_text=>'Filter prefix "%0" is invalid for facet "%1".'
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1775289710126068)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_text=>'Filter prefix missing for facet "%0".'
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5801668102226175)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2402848030014708)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_text=>'contains'
,p_is_js_message=>true
,p_version_scn=>15761988
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2401318239000379)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_text=>'equals'
,p_is_js_message=>true
,p_version_scn=>15762008
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2402280059009181)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_text=>'greater than'
,p_is_js_message=>true
,p_version_scn=>15762017
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2402482583009904)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_text=>'greater than or equal to'
,p_is_js_message=>true
,p_version_scn=>15762027
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2401709633003699)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_text=>'less than'
,p_is_js_message=>true
,p_version_scn=>15762668
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2401963234005192)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_text=>'less than or equal to'
,p_is_js_message=>true
,p_version_scn=>15762675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3804442550254772)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_text=>'does not contain'
,p_is_js_message=>true
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2401586182002478)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_text=>'not equals'
,p_is_js_message=>true
,p_version_scn=>15762046
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3804218791252596)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_text=>'does not start with'
,p_is_js_message=>true
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2402691380012901)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_text=>'starts with'
,p_is_js_message=>true
,p_version_scn=>15762062
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6224725354598992)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_text=>'The %0 data type (%1) is not supported for the Input Field facet.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1851844524253352)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_text=>'Filter "%0" is not supported for facet "%1" (data type %2).'
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5801407024225147)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_text=>'Value'
,p_is_js_message=>true
,p_version_scn=>15747817
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472564495799841162)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_text=>'No search columns have been provided for facet %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1403407060475947)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_text=>'More Filters'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(225204966793300332)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_text=>'Range Begin'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472563140327840991)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_text=>'%0 to %1'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472563395614841023)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_text=>'Above %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472563691938841063)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_text=>'Below %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(225205115477298777)
,p_name=>'APEX.FS.RANGE_END'
,p_message_text=>'Range End'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(698742887263143685)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_text=>'LOV item #%2 ("%1") for range facet %0 is invalid ("|" separator missing).'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472564176512841129)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_text=>'Manual Input for Range facet %0 is currently not supported, since the column is DATE or TIMESTAMP.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472562037048840860)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_text=>'to'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3302108925947013)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_text=>'Remove Chart'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184370943845438949)
,p_name=>'APEX.FS.RESET'
,p_message_text=>'Reset'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472560484915840665)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_text=>'Search'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472560155111840632)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_text=>'Search...'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472562551511840925)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_text=>'- Select -'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3301793193936177)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_text=>'Show Chart'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472561540192840795)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_text=>'Show Less'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472561766803840827)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_text=>'Show All'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472562331391840892)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_text=>'%0 stars and up'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(236295076940071854)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_text=>'Filter suggestions'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472564744437841194)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_text=>'Text Field facet %0 is currently only supported for NUMBER columns.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1378581306319251)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_text=>'Total Row Count'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(658727806749125048)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_text=>'The %0 data type (%1) is not supported for faceted search.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(164452408421844097)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_text=>'Visually hidden heading'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(569329013877349787)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_text=>'Go to error'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(290826604554653767)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_text=>'Aggregate.'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(32939772243123543)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_text=>'Blank heading'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370478627979527482)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_text=>'Collapse control break'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(290826881492656552)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_text=>'Control break.'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370478422903525522)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_text=>'Expand control break'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370477958319520295)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_text=>'%0 rows deleted'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1342378298209919296)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_text=>'Duplicate identity'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1502724835332377)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_text=>'Entering edit mode'
,p_is_js_message=>true
,p_version_scn=>552386814
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269201436690836601)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_text=>'First'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500293479215541)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_text=>'Hide dialog'
,p_is_js_message=>true
,p_version_scn=>543239068
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1486395636087623)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_text=>'Floating overflow cell content'
,p_is_js_message=>true
,p_version_scn=>543086950
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500487379320816)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_text=>'Show overflow content'
,p_is_js_message=>true
,p_version_scn=>543303670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(78633361741084801)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_text=>'Grid Footer'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(290827258737661261)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_text=>'Group header'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(290827074061659148)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_text=>'Header.'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269201610040837444)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_text=>'Last'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1502942593339589)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_text=>'Leaving edit mode'
,p_is_js_message=>true
,p_version_scn=>552387246
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2807146158068282)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_text=>'Load All'
,p_is_js_message=>true
,p_version_scn=>11235029
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382440658981228514)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_text=>'Show More'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269201035043834554)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_text=>'Next'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(291042874389857317)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_text=>'Page rows'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5200912445667477)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_text=>'Page %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269201807004839486)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269202046686841204)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_text=>'%0 - %1 of %2'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(713433559765934637)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_text=>'Page Selection'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(78633981933100383)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_text=>'Pagination'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269201275461835627)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_text=>'Previous'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2605639050577361)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_text=>'Range display'
,p_is_js_message=>true
,p_version_scn=>627190183
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(35692355342109002)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_text=>'Rows Selection'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1341949951903817834)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_text=>'Added'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1341950103101821804)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_text=>'Changed'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2199727423378410167)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_text=>'Grid row sequence %0, Column %1.'
,p_is_js_message=>true
,p_version_scn=>631517110
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2199727650756412304)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_text=>'Grid row sequence %0.'
,p_is_js_message=>true
,p_version_scn=>631516117
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1341949770715813160)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_text=>'Deleted'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(296179677712570497)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_text=>'Row header'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(35692181789092367)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_text=>'Row Selection'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2807349755071170)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_text=>'%0 %1 selected'
,p_is_js_message=>true
,p_version_scn=>7469385
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(268429337089386217)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_text=>'%0 cells selected'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269202211879842444)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_text=>'%0 rows selected'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(511466055042527671)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_text=>'Select All'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40757842177581676)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_text=>'Select All Rows'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370478205264523330)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_text=>'Page %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(296132260794565912)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_text=>'Select Row'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(306083706088278910)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_text=>'Sorted Ascending %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(306083917210282253)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_text=>'Sorted Descending %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269199232752827426)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_text=>'Sort Ascending'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269200627843832575)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_text=>'Sort Ascending %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269199638560829162)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_text=>'Sort Descending'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269200803368833870)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_text=>'Sort Descending %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(269200356765830191)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_text=>'Don''t Sort'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1402385535085777)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_text=>'Sort options'
,p_is_js_message=>true
,p_version_scn=>351889605
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(78633556373089197)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_text=>'State Icons'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(78633725842096056)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_text=>'Grid Status'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1600938985367510)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1600568257359536)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370477767826517194)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_text=>'Total %0'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(29453751000930168)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_text=>'The HTTP request to "%0" failed.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37034614460416359)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_text=>'Column %0'
,p_is_js_message=>true
,p_version_scn=>37165770887524
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37035083359424014)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_text=>'Column %0 and row %1'
,p_is_js_message=>true
,p_version_scn=>37165770887541
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37035895522438161)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_text=>'On the first column already. Column %0 and row %1'
,p_is_js_message=>true
,p_version_scn=>37165770887541
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37035547082432925)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_text=>'On the first row already. Column %0 and row %1'
,p_is_js_message=>true
,p_version_scn=>37165770887541
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1301556372959453932)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_text=>'Presented in %0 columns and %1 rows'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37036038690444097)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_text=>'On the last column already. Column %0 and row %1'
,p_is_js_message=>true
,p_version_scn=>37165770887541
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37035335682428203)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_text=>'On the last row already. Column %0 and row %1'
,p_is_js_message=>true
,p_version_scn=>37165770887541
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(366830231481244976)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_text=>'Presented in %0 rows'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37034860856419517)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_text=>'Row %0'
,p_is_js_message=>true
,p_version_scn=>37165770887541
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2199727008650406202)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_text=>'Interactive Grid %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253103864012428183)
,p_name=>'APEX.IG.ACTIONS'
,p_message_text=>'Actions'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253105840842435569)
,p_name=>'APEX.IG.ADD'
,p_message_text=>'Add'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253105611716434939)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_text=>'Add Row'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475688796693070101)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_text=>'Aggregate'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(949343041237860865)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_text=>'Aggregation'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(994489767765554444)
,p_name=>'APEX.IG.ALL'
,p_message_text=>'All'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436639481545568300)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_text=>'All Text Columns'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436645049387673679)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_text=>'Alternative'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436648901178731701)
,p_name=>'APEX.IG.AND'
,p_message_text=>'and'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(611469940913292197)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_text=>'Approx. Count Distinct'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475737733205956325)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_text=>'Overall Approx. Count Distinct'
,p_is_js_message=>true
,p_version_scn=>37166027472479
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942330819617625580)
,p_name=>'APEX.IG.AREA'
,p_message_text=>'Area'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(973821678450621800)
,p_name=>'APEX.IG.ASCENDING'
,p_message_text=>'Ascending'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436645360194678104)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_text=>'Authorization'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475688878746097167)
,p_name=>'APEX.IG.AUTO'
,p_message_text=>'Auto'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(611470761668296689)
,p_name=>'APEX.IG.AVG'
,p_message_text=>'Average'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475736755355944218)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_text=>'Overall Average'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942329234206617776)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_text=>'Label Axis Title'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942330055649621809)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_text=>'Decimal Places'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942329844822620743)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_text=>'Value Axis Title'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1049329031271359425)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_text=>'Background Color'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942331013847626672)
,p_name=>'APEX.IG.BAR'
,p_message_text=>'Bar'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404796891446524989)
,p_name=>'APEX.IG.BETWEEN'
,p_message_text=>'between'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054979169972955538)
,p_name=>'APEX.IG.BOTH'
,p_message_text=>'Both'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942331293757627905)
,p_name=>'APEX.IG.BUBBLE'
,p_message_text=>'Bubble'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253106266772436990)
,p_name=>'APEX.IG.CANCEL'
,p_message_text=>'Cancel'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436648567971727953)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_text=>'Case Sensitive'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1476076547261910683)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_text=>'(Case Sensitive)'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(692775040984539171)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_text=>'Changes saved'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253107063654440462)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_text=>'Change View'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436651900434787842)
,p_name=>'APEX.IG.CHART'
,p_message_text=>'Chart'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(432467991973453048)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_text=>'Your query exceeds the maximum of %0 data points per chart. Please apply a filter to reduce the number of records in your base query.'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253103659308427301)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_text=>'Chart View'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(309954981793459365)
,p_name=>'APEX.IG.CLEAR'
,p_message_text=>'Clear'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942327892549613277)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_text=>'Close'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1049330773441377496)
,p_name=>'APEX.IG.COLORS'
,p_message_text=>'Colors'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(614102336101408465)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_text=>'Preview'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436646496316700188)
,p_name=>'APEX.IG.COLUMN'
,p_message_text=>'Column'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253104093145428930)
,p_name=>'APEX.IG.COLUMNS'
,p_message_text=>'Columns'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(98852853677479240)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_text=>'Column Actions'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(98852422161464664)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_text=>'Actions for "%0" column'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1093431636145038353)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_text=>'Column Purpose'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436646677069701196)
,p_name=>'APEX.IG.COMPLEX'
,p_message_text=>'Complex'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253104432983430353)
,p_name=>'APEX.IG.COMPUTE'
,p_message_text=>'Compute'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404798072037535094)
,p_name=>'APEX.IG.CONTAINS'
,p_message_text=>'contains'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436886419447046162)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_text=>'Control Break'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(309954539712448807)
,p_name=>'APEX.IG.COPY_CB'
,p_message_text=>'Copy to Clipboard'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(309954709405451342)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_text=>'Copy Down'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(611469443659288373)
,p_name=>'APEX.IG.COUNT'
,p_message_text=>'Count'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(611469692144290436)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_text=>'Count Distinct'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475737542105951541)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_text=>'Overall Count Distinct'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475737002912948105)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_text=>'Overall Count'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1344104320513159198)
,p_name=>'APEX.IG.CREATE_X'
,p_message_text=>'Create %0'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436640316242583633)
,p_name=>'APEX.IG.DATA'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1055157748391759234)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_text=>'Data Type'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054979626302022784)
,p_name=>'APEX.IG.DATE'
,p_message_text=>'Date'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(692264194497294060)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_text=>'Invalid Date Value'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404803561175870412)
,p_name=>'APEX.IG.DAYS'
,p_message_text=>'days'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436644169838660601)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_text=>'Default Settings'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436643467391644512)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_text=>'Default Type'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253106000993436358)
,p_name=>'APEX.IG.DELETE'
,p_message_text=>'Delete'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107141776583682897)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_text=>'Are you sure you would like to delete this report?'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436892898066134059)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_text=>'Delete Row'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436888264441061854)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_text=>'Delete Rows'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(973821809428623592)
,p_name=>'APEX.IG.DESCENDING'
,p_message_text=>'Descending'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436651280631783562)
,p_name=>'APEX.IG.DETAIL'
,p_message_text=>'Detail'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253103012371424462)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_text=>'Detail View'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(757930753783791758)
,p_name=>'APEX.IG.DIRECTION'
,p_message_text=>'Direction'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436650555195771612)
,p_name=>'APEX.IG.DISABLED'
,p_message_text=>'Disabled'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404798280030536858)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_text=>'does not contain'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404798691673539475)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_text=>'does not start with'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942331445831629116)
,p_name=>'APEX.IG.DONUT'
,p_message_text=>'Donut'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436887061361052135)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_text=>'Download'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12310008842595607)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_text=>'Data Only'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107370036857102366)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_text=>'Choose Format'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(46068919086763229)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_text=>'Download Format %0 is not enabled.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(994447117359980355)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_text=>'Duplicate Aggregation'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(994447756355996349)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_text=>'Duplicate Control Break'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436892533101131795)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_text=>'Duplicate Row'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436887981343059441)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_text=>'Duplicate Rows'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253105256188433312)
,p_name=>'APEX.IG.EDIT'
,p_message_text=>'Edit'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(972179588508261076)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_text=>'Edit Chart'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(82854528421745238)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_text=>'Edit %0'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317788439135890817)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_text=>'Edit Group By'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(176002273000348842)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_text=>'%0 in edit mode'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(107809401523364850)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_text=>'Grid in edit mode, un-press to switch to view mode'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107294677075835011)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_text=>'Blind Copy (bcc)'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107295038395837985)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_text=>'Message'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107294481006834214)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_text=>'Copy (cc)'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107293797874826580)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_text=>'Email sent.'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107294804978835859)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_text=>'Subject'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107294146675833592)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_text=>'Recipient (to)'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436649394574735086)
,p_name=>'APEX.IG.ENABLED'
,p_message_text=>'Enabled'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404794263529469999)
,p_name=>'APEX.IG.EQUALS'
,p_message_text=>'equals'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436649830451741092)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_text=>'Expression'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1094702084393516937)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_text=>'Type'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(511401956878762569)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_text=>'File prepared. Starting download.'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(309955146216461354)
,p_name=>'APEX.IG.FILL'
,p_message_text=>'Fill'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(328215598128319769)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_text=>'Fill selection with'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(328215343904317132)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_text=>'Fill Selection'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253104236202429670)
,p_name=>'APEX.IG.FILTER'
,p_message_text=>'Filter'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436646935400706550)
,p_name=>'APEX.IG.FILTERS'
,p_message_text=>'Filters'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475733004599733933)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_text=>'Filter...'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(973825733022680386)
,p_name=>'APEX.IG.FIRST'
,p_message_text=>'First'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253104640261431100)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436640573770594996)
,p_name=>'APEX.IG.FORMAT'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054978274388934102)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_text=>'Format Mask'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107130667843109867)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107090780901108163)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168402622226844194)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11803782243145042)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436890912297104559)
,p_name=>'APEX.IG.FREEZE'
,p_message_text=>'Freeze'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436650114902767367)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_text=>'Functions and Operators'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942331689990630260)
,p_name=>'APEX.IG.FUNNEL'
,p_message_text=>'Funnel'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(610738829829264773)
,p_name=>'APEX.IG.GO'
,p_message_text=>'Go'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404796066486517182)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_text=>'greater than'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404796202906519207)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_text=>'greater than or equals'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436651024300782524)
,p_name=>'APEX.IG.GRID'
,p_message_text=>'Grid'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253102650304422439)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_text=>'Grid View'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(994488740298390122)
,p_name=>'APEX.IG.GROUP'
,p_message_text=>'Group'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436651440509784940)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_text=>'Group By'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253103225479425550)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_text=>'Group By View'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054980303037041411)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_text=>'Condition Type'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054976477380908181)
,p_name=>'APEX.IG.HEADING'
,p_message_text=>'Heading'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054977250872914475)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_text=>'Heading Alignment'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475689533774151886)
,p_name=>'APEX.IG.HELP'
,p_message_text=>'Help'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1302771363919223694)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can insert, update, and delete data directly within this interactive grid.</p>',
'',
'<p>Insert a new row by clicking the Add Row button.</p>',
'',
'<p>Edit existing data by double-clicking a specific cell. For larger editing work, click Edit to enter editing mode. In editing mode, you can single-click or use the keyboard to edit specific cells.</p>',
'',
'<p>Use the Change menu to duplicate and delete rows. To enable the Change menu, use the check boxes to select one or more rows.</p>',
'',
'<p>Duplicate a selected row by clicking the Change menu and selecting Duplicate Rows. Delete a selected row by clicking the Change menu and selecting Delete Row.</p>'))
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1326810589199597587)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_text=>'Editing Capabilities'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1326810830568645356)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>An interactive grid presents a set of data in a searchable, customizable report. You can perform numerous operations to limit the records returned, and change the way the data is displayed.</p>',
'',
'<p>Use the Search field to filter the records returned. Click Actions to access numerous options for modifying the report layout, or use the Column Heading menus on displayed columns.</p>',
'',
'<p>Use Report Settings to save your customizations to a report. You can also download the data from the report to an external file or email the data to yourself or others.</p>',
'',
'<p>To learn more, see "Using Interactive Grids" in <em>Oracle APEX End User''s Guide</em>.'))
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1326808631831517283)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_text=>'Overview'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1302771121045221993)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can customize the interactive grid to display data in various different ways using the built-in capabilities.</p>',
'',
'<p>Use the Column Heading menus or the Actions menu to determine which columns to display, in what sequence, and freeze columns. You can also define various data filters and sort the data returned.</p>',
'',
'<p>Use the View button (adjacent to the Search field) to access other data views that may have been defined by the application developer. You can also create a chart or view an existing chart.</p>  ',
'',
'<p><em>Note: Click <strong>Help</strong> in the interactive grid dialogs to obtain more detailed information on the selected function.</em></p>'))
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1326810321343595694)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_text=>'Reporting Capabilities'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436887665000056779)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_text=>'Interactive Grid Help'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159206922700336839)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to aggregate columns. Aggregated values display at the bottom of the data, or if Control Breaks are defined, at the bottom of each break.</p>',
'',
'<p><strong>Aggregation List</strong><br>',
'The Aggregation list displays defined aggregations. Disable an existing aggregation by deselecting it.<br>',
'Click Add ( &plus; ) to create a new aggregation, or Delete ( &minus; ) to remove an existing aggregation.</p>',
'',
'<p><strong>Aggregation Settings</strong><br>',
'Use the form on the right to define the aggregation.<br>',
'Select the Column name and Aggregation type.<br>',
'Optionally, enter a tooltip for the aggregation.<br>',
'If you have defined a Control Break, selecting <strong>Show Overall Value</strong> displays the overall average, total, or similar value at the bottom of the data.</p>',
'',
'<p><em>Note: Access the Aggregation dialog in the Actions menu or by clicking the column heading and sum ( &sum; ).</em></p>'))
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317745596144816435)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_text=>'Aggregation Help'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1160147484677766675)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to define a chart which displays as a separate data view.<br>',
'Select a chart Type, and chart attributes.</p>',
'<p><strong>Chart Attributes</strong><br>',
'The available chart attributes vary depending on the chart type.</p>',
'<p>',
'<ul>',
'  <li>Select the column containing the value for the attribute:',
'    <ul>',
'      <li>Label - The text for each data point.</li>',
'      <li>Value - The data to be plotted.</li>',
'      <li>Series - For defining your multi-series dynamic query.</li>',
'      <li>Open - The daily stock opening price (Stock only).</li>',
'      <li>Close - The daily stock close price (Stock only).</li>',
'      <li>High - The high value (Range and Stock only).</li>',
'      <li>Low - The low value (Range and Stock only).</li>',
'      <li>Volume - The daily stock volume (Stock only).</li>',
'      <li>Target - The target value (Funnel only).</li>',
'      <li>X - The x-axis value (Bubble and Scatter only).</li>',
'      <li>Y - The y-axis value (Bubble and Scatter only).</li>',
'      <li>Z - The bar width or bubble radius (Bar, Bubble, and Range only).</li>',
'    </ul>',
'  </li>',
'  <li>Orientation - Vertical or horizontal.</li>',
'  <li>Aggregation - Select how to aggregate the chart values.</li>',
'  <li>Stack - Specify whether the data items are stacked.</li>',
'  <li>Sort By - Sort by the label or value(s).',
'    <ul>',
'      <li>Direction - Sort in ascending or descending values.</li>',
'      <li>Nulls - Specify how to sort records with null values in relation to records with non null values.</li>',
'    </ul>',
'  </li>',
'  <li>Decimal Places</li>',
'  <li>Label Axis Title</li>',
'  <li>Value Axis Title</li>',
'</ul>',
'</p>'))
,p_version_scn=>14494662
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317746538366820644)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_text=>'Chart Help'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159206275728334546)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to choose which columns display and in what order.</p>',
'',
'<p>Hide a column by deselecting it.<br>',
'Reorder columns by clicking Move Up ( &uarr; ) or Move Down ( &darr; ).<br>',
'Use the drop down selector to list All columns, Displayed columns, or Not Displayed columns.</p>',
'',
'<p>Optionally, use the form to specify the minimum width of a column in pixels.</p>',
'',
'<p><em>Note: You can also reorder displayed columns by clicking the drag handle (at the start of the column heading) and dragging the column left or right. You can also change the column width of displayed columns by selecting the column separator, b'
||'etween headings, and moving it left or right.</em></p>'))
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317746377678819574)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_text=>'Columns Help'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159207284050337571)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to define additional columns based on mathematical and functional computations performed against existing columns.</p>',
'',
'<p><strong>Computation List</strong><br>',
'The Computation list displays defined computations. Disable an existing computation by deselecting it.<br>',
'Click Add ( &plus; ) to add a new computation, or Delete ( &minus; ) to remove an existing computation.</p>',
'',
'<p><strong>Computation Settings</strong><br>',
'Use the form to define the computation.<br>',
'Enter the column details such as heading, label, and select alignment settings.<br> ',
'Use the Expression textarea to enter the column(s) and associated functions for the computation.<br>',
'Select the appropriate data type, and optionally a format mask, for the new column.</p>'))
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317745192997815080)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_text=>'Compute Help'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159208060834340135)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to define a control break on one or more columns.</p>',
'',
'<p><strong>Control Break List</strong><br>',
'The Control Break list displays defined control breaks. Disable an existing control break column by deselecting it.<br>',
'Click Add ( &plus; ) to include a new column in the control break, or Delete ( &minus; ) to remove an existing column from the control break.<br>',
'To reorder columns, click Move Up ( &uarr; ) or Move Down ( &darr; ) to move the selected column up and down relative to other columns.</p>',
'',
'<p><strong>Control Break Settings</strong><br>',
'Use the form to define the control break column.<br>',
'Selected a control break column, the sort direction, and how to order null columns (columns with no value).</p>',
'',
'<p><em>Note: When viewing the interactive grid, you can define a control break by clicking a Column Heading and selecting the control break icon.</em></p>'))
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317744195610811180)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_text=>'Control Break Help'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159208463119341659)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to download all the current rows to an external file. The file will contain only the currently displayed columns, using any filters and sorts applied to the data.</p>',
'',
'<p>Select the file format and click Download.<br>',
'Note: CSV will not include text formatting such as aggregates and control breaks.</p>',
'',
'<p>To email the file, select Send as Email and enter the email details (Recipient, Subject and Message).</p>'))
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317743590401807908)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_text=>'Download Help'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159206543190335483)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to configure data filters which limit the rows returned.</p>',
'',
'<p><strong>Filter List</strong><br>',
'The Filter list displays defined filters. Disable an existing filter by deselecting it.<br>',
'Click Add ( &plus; ) to create a new filter, or Delete ( &minus; ) to remove an existing filter.</p>',
'',
'<p><strong>Filter Settings</strong><br>',
'Use the form to define the filter properties.<br>',
'Select the appropriate filter type:<br>',
'&nbsp;&nbsp;&nbsp;Row - filter for a term in any filterable column.<br>',
'&nbsp;&nbsp;&nbsp;Column - filter a specific column with a specified operator and value.</p>',
'',
'<p><em>Note: When viewing the interactive grid, you can define row filters by typing directly into the Search field. Click Select Columns to Search to limit the search to a specific column. Alternately, open a Column Heading menu and select a value t'
||'o create a column filter.</em></p>'))
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317746178658818309)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_text=>'Filter Help'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159207456842338185)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to view the data as it existed at a previous point in time.</p>',
'<p>Enter the number of minutes in the past to execute the flashback query.</p>'))
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317744874529813936)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_text=>'Flashback Help'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317746765893821800)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_text=>'Group By Help'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159207803119338874)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to highlight rows or columns of data based on the condition entered.</p>',
'',
'<p><strong>Highlight List</strong><br>',
'The Highlight list displays defined highlights. Disable an existing highlight by deselecting it.<br>',
'Click Add ( &plus; ) to create a new highlight, or Delete ( &minus; ) to remove an existing highlight.</p>',
'',
'<p><strong>Highlight Settings</strong><br>',
'Use the form to define the highlight properties.<br>',
'Enter the name, select Row or Column, and select the HTML color codes for the background and text.<br>',
'Select the appropriate <strong>Condition Type</strong> to highlight specific data:<br>',
'&nbsp;&nbsp;&nbsp;Row - highlight the term in any column.<br>',
'&nbsp;&nbsp;&nbsp;Column - highlight within a specific column based on the specified operator and value.</p>'))
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317744636733812631)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_text=>'Highlight Help'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159208297566340829)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to save changes you have made to the current grid layout and configuration.<br>',
'Application developers can define multiple alternate report layouts. Where permissible, you and other end users can save a report as Public, which makes the report available to all other users of the grid. You can also save a report as a Private repo'
||'rt that only you can view.</p>',
'<p>Select from the available types and enter a name for the saved report.</p>'))
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317743855107809940)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Report Help',
''))
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1159206753419336137)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this dialog to set the display order.</p>',
'',
'<p><strong>Sort List</strong><br>',
'The Sort dialog displays a list of configured sorting rules.<br>',
'Click Add ( &plus; ) to create a sort column, or Delete ( &minus; ) to remove a sort column.<br>',
'Click Move Up ( &uarr; ) and Move Down ( &darr; ) to move the selected sort column up and down relative to the other sort columns.</p>',
'',
'<p><strong>Sort Settings</strong><br>',
'Select a sort column, the sort direction, and how to order null columns (columns with no value).</p>',
'',
'<p><em>Note: Data can be sorted by columns which are not displayed; however, not all columns may be sortable.</em><br>',
'<em>Displayed columns can be sorted by pressing the up (ascending) or down (descending) arrows at the end of the column headings. To add a subsequent column to an existing sort, hold the Shift key and click the up or down arrow.</em></p>'))
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317745734142817317)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_text=>'Sort Help'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1317743340591806330)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_text=>'Subscription Help'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436890584824101871)
,p_name=>'APEX.IG.HIDE'
,p_message_text=>'Hide'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253105098467432574)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_text=>'Highlight'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942328021569614121)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_text=>'High'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942330678133624297)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_text=>'Horizontal'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404803368145869767)
,p_name=>'APEX.IG.HOURS'
,p_message_text=>'hours'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436650893457781656)
,p_name=>'APEX.IG.ICON'
,p_message_text=>'Icon'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253102862831423517)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_text=>'Icon View'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404795665572514384)
,p_name=>'APEX.IG.IN'
,p_message_text=>'in'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436889253916081660)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_text=>'Inactive Setting'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436889413069083164)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_text=>'Inactive Settings'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(482900488999245266)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_text=>'An internal error has occurred while processing the Interactive Grid request.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24879078505833287)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_text=>'Column Filter Type "%0" is not supported for column "%1".'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1302908840610021706)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_text=>'Invalid Date Format'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651225057906041428)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_text=>'Interactive Grid does not support defining a filter on the column %0.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651224161488961207)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_text=>'%0 is not a valid filter type for defining an Interactive Grid filter.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38501415806604433)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_text=>'Invalid Number Format'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1361322172544070615)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_text=>'Invalid Setting'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1361322327986072559)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_text=>'Invalid Settings'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1048091640010697283)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_text=>'Sort By has been set to %0, but no column as been selected for %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(994448126332016743)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_text=>'Invalid Value'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(932008083257271078)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_text=>'Not Displayed'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404797241768529254)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_text=>'in the last'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404797661797531688)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_text=>'in the next'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404795453167513465)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_text=>'is not empty'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404795250103512254)
,p_name=>'APEX.IG.IS_NULL'
,p_message_text=>'is empty'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054976912831911572)
,p_name=>'APEX.IG.LABEL'
,p_message_text=>'Label'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942326072605608093)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_text=>'Label'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(973826061038681470)
,p_name=>'APEX.IG.LAST'
,p_message_text=>'Last'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370792149803626119)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_text=>'Last Day'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370792373253626120)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_text=>'Last Hour'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370799595813722477)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_text=>'Last Minute'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791898737626119)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_text=>'Last Month'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791917636626119)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_text=>'Last Week'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370792050980626119)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_text=>'Last %0 Days'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370792299341626120)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_text=>'Last %0 Hours'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370799798794723960)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_text=>'Last %0 Minutes'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370798573629714357)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_text=>'Last %0 Months'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370798320950712741)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_text=>'Last %0 Weeks'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791628064626118)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_text=>'Last %0 Years'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791743411626119)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_text=>'Last Year'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054977408774922263)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_text=>'Cell Alignment'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054977893245928397)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_text=>'Use Group For'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404796499192522476)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_text=>'less than'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404796694662523747)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_text=>'less than or equals'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942331839259631356)
,p_name=>'APEX.IG.LINE'
,p_message_text=>'Line'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942332064430632572)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_text=>'Line with Area'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054979393387019261)
,p_name=>'APEX.IG.LISTAGG'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942328268912614934)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_text=>'Low'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107296133634884322)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_text=>'Separate multiple addresses with commas'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404798810111542378)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_text=>'matches regular expression'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(611470501472295929)
,p_name=>'APEX.IG.MAX'
,p_message_text=>'Maximum'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475738429565965453)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_text=>'Overall Maximum'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(611470977135297514)
,p_name=>'APEX.IG.MEDIAN'
,p_message_text=>'Median'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475738756828969933)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_text=>'Overall Median'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(611470368378294684)
,p_name=>'APEX.IG.MIN'
,p_message_text=>'Minimum'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404803148109868773)
,p_name=>'APEX.IG.MINUTES'
,p_message_text=>'minutes'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(617543543269810371)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_text=>'Minutes ago'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475738168592962321)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_text=>'Overall Minimum'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404803977589871929)
,p_name=>'APEX.IG.MONTHS'
,p_message_text=>'months'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436890157703095967)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_text=>'The data contains more than %0 rows which exceeds the maximum allowed. Please apply additional filters in order to view the results.'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(783759544769241302)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_text=>'Region Static ID must be specified as the page contains multiple Interactive Grids.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436643745713647879)
,p_name=>'APEX.IG.NAME'
,p_message_text=>'Name'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436644493900664730)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_text=>'Named Report'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791056347624894)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_text=>'Next Day'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370790873207624893)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_text=>'Next Hour'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370799973680725581)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_text=>'Next Minute'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791300449624894)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_text=>'Next Month'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791246795624894)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_text=>'Next Week'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791166014624894)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_text=>'Next %0 Days'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370790969813624893)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_text=>'Next %0 Hours'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370800179174727409)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_text=>'Next %0 Minutes'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370794559494665673)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_text=>'Next %0 Months'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370794719214674295)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_text=>'Next %0 Weeks'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791542595624895)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_text=>'Next %0 Years'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(370791482541624894)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_text=>'Next Year'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404797058477527630)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_text=>'not between'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404795044166510316)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_text=>'not equals'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2015519456814021000)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_text=>'Region with ID %0 is not an Interactive Grid region or does not exist in application %1.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404795833888515465)
,p_name=>'APEX.IG.NOT_IN'
,p_message_text=>'not in'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404797441289530252)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_text=>'not in the last'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404797807680533599)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_text=>'not in the next'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436889846807093500)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_text=>'No data found'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(973824090213656889)
,p_name=>'APEX.IG.NULLS'
,p_message_text=>'Nulls'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054979888988023971)
,p_name=>'APEX.IG.NUMBER'
,p_message_text=>'Numeric'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(982600887110579242)
,p_name=>'APEX.IG.OFF'
,p_message_text=>'Off'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(982601022621580365)
,p_name=>'APEX.IG.ON'
,p_message_text=>'On'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(392705597849066818)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_text=>'1 minute ago'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1155408954374189289)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_text=>'Open Color Picker: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942327648391612587)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_text=>'Open'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436647625712719359)
,p_name=>'APEX.IG.OPERATOR'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942325754863606936)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_text=>'Orientation'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942332500521633588)
,p_name=>'APEX.IG.PIE'
,p_message_text=>'Pie'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436651705380786949)
,p_name=>'APEX.IG.PIVOT'
,p_message_text=>'Pivot'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253103487137426393)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_text=>'Pivot View'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1155123709546580666)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_text=>'Separate values with "%0"'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942332765819636083)
,p_name=>'APEX.IG.POLAR'
,p_message_text=>'Polar'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054880008749858677)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_text=>'Center'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054880242622859339)
,p_name=>'APEX.IG.POSITION_END'
,p_message_text=>'End'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054879818158857530)
,p_name=>'APEX.IG.POSITION_START'
,p_message_text=>'Start'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436644891754670574)
,p_name=>'APEX.IG.PRIMARY'
,p_message_text=>'Primary'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436645782872691039)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_text=>'Primary Default'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(537701974984676361)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_text=>'Primary Report'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10200771441482088)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_text=>'Include Accessibility Tags'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8704391234236143)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_text=>'Landscape'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8704513734237624)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_text=>'Portrait'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8704198974233982)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_text=>'Page orientation'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8703907333232211)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8703703472231463)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10500233423548371)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_text=>'Custom'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8703376844228757)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8703116709227340)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8703523589230224)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8702925299224412)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_text=>'Page size'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1887558248986045)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_text=>'Strip Rich Text'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942333213903637449)
,p_name=>'APEX.IG.RADAR'
,p_message_text=>'Radar'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942333422167639310)
,p_name=>'APEX.IG.RANGE'
,p_message_text=>'Range'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1163359191867029133)
,p_name=>'APEX.IG.REFRESH'
,p_message_text=>'Refresh'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436893191871135971)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_text=>'Refresh Row'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436888629761065089)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_text=>'Refresh Rows'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472091978954693176)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_text=>'Interactive Grid region does not exist in application %0, page %1 and region %2.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253106488058438288)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_text=>'Remove %0'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436642959576638718)
,p_name=>'APEX.IG.REPORT'
,p_message_text=>'Report'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1815758117835027474)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_text=>'Report deleted'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1815757548843013008)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_text=>'Alternative report saved for all users'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1815757005330000590)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_text=>'Default report saved for all users'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1815757909406021772)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_text=>'Private report saved'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1815757790734018205)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_text=>'Public report saved for all users'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472093201359698311)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_text=>'Saved Interactive Grid with name %0 does not exist.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(392705385453044397)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_text=>'Grid data as of %0 minutes ago'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(392705114775041923)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_text=>'Grid data as of 1 minute ago'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95922116184678373)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_text=>'Interactive Grid Report does not exist.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1326762232346092281)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_text=>'Report - Edit'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472091035384684164)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_text=>'Saved Interactive Grid with ID %0 does not exist.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1326762020520089106)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_text=>'Report - Save As'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253106663897439057)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_text=>'Grid Settings'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2015519732569359060)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_text=>'Saved Interactive Grid with static ID %0 does not exist.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475733412334807654)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_text=>'Report View'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253104874689431832)
,p_name=>'APEX.IG.RESET'
,p_message_text=>'Reset'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436893404354138823)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_text=>'Revert Changes'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436888849868066279)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_text=>'Revert Rows'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436646237613698343)
,p_name=>'APEX.IG.ROW'
,p_message_text=>'Row'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436640738472599290)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_text=>'Rows Per Page'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1922047733969401965)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_text=>'Row Actions'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2199701897603048458)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_text=>'Actions for row %0'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253105492018434006)
,p_name=>'APEX.IG.SAVE'
,p_message_text=>'Save'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(498555375783219654)
,p_name=>'APEX.IG.SAVED'
,p_message_text=>'saved'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(76466382255282778)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_text=>'Saved report: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253101855943418320)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_text=>'Saved Reports'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253102095015419355)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_text=>'Default'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(119755357090353913)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_text=>'A saved report named %0 already exists. Enter a new name.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253102285506420394)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_text=>'Private'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253102458792421372)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_text=>'Public'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475689217503115735)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_text=>'Save As'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436886760070049795)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_text=>'Save Report Settings'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942333612003640837)
,p_name=>'APEX.IG.SCATTER'
,p_message_text=>'Scatter'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253101633445417120)
,p_name=>'APEX.IG.SEARCH'
,p_message_text=>'Search'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1102333501644064230)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_text=>'Search: All Text Columns'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253101202071414619)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_text=>'Search: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1082589981930085442)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_text=>'Search: Full Text'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(392704898638969443)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_text=>'Search for ''%0'''
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(931968379610053142)
,p_name=>'APEX.IG.SELECT'
,p_message_text=>'- Select -'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(309956341143862219)
,p_name=>'APEX.IG.SELECTION'
,p_message_text=>'Selection'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(738648437242360324)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_text=>'Select 1 row in the parent region'
,p_is_js_message=>true
,p_version_scn=>22346895
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253101015887413102)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_text=>'Select columns to search'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1853978627372041157)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_text=>'Selection Actions'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(309956765605872724)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_text=>'Cell Selection'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(309956574413870170)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_text=>'Row Selection'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107293919152828938)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_text=>'Send as Email'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(949346833084031756)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_text=>'Series'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(230122436194091558)
,p_name=>'APEX.IG.SHOW'
,p_message_text=>'Show'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(582849405846815319)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_text=>'Show Overall Value'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436892123328128970)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_text=>'Single Row View'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436652408082806049)
,p_name=>'APEX.IG.SORT'
,p_message_text=>'Sort'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(949347060677033130)
,p_name=>'APEX.IG.SORT_BY'
,p_message_text=>'Sort By'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1922048548788589345)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_text=>'You can define only one sort per column.'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1855715169847720287)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_text=>'Change'
,p_is_js_message=>true
,p_version_scn=>595241547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(982601294199581471)
,p_name=>'APEX.IG.STACK'
,p_message_text=>'Stack'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404798477468538053)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_text=>'starts with'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942333950655642023)
,p_name=>'APEX.IG.STOCK'
,p_message_text=>'Stock'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(177975007259589305)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_text=>'Stretch Column Widths'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436887300185054454)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_text=>'Subscription'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(611470140186293498)
,p_name=>'APEX.IG.SUM'
,p_message_text=>'Sum'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2199727297111408409)
,p_name=>'APEX.IG.SUMMARY'
,p_message_text=>'Interactive Grid. Report: %0, View: %1.'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1475735820903940106)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_text=>'Overall Sum'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942329018935616633)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_text=>'Target'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1049329229616360742)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_text=>'Text Color'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253106881522439789)
,p_name=>'APEX.IG.TOGGLE'
,p_message_text=>'Toggle'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1798247603365050)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_text=>'Grid'
,p_is_js_message=>true
,p_version_scn=>82759194
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(582849147873808293)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_text=>'Tooltip'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436643220260641671)
,p_name=>'APEX.IG.TYPE'
,p_message_text=>'Type'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436891184596106666)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_text=>'Unfreeze'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436648217778725151)
,p_name=>'APEX.IG.UNIT'
,p_message_text=>'Unit'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1107239918670882547)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_text=>'There are unsaved changes. Do you want to continue?'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436647923235721837)
,p_name=>'APEX.IG.VALUE'
,p_message_text=>'Value'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942326298694609141)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_text=>'Value'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1008022159557286347)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_text=>'A value is required.'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(692281872005819616)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_text=>'Value (time zone cannot be changed)'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1054980048502024996)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_text=>'Text'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942330295739623120)
,p_name=>'APEX.IG.VERTICAL'
,p_message_text=>'Vertical'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(436639974099577061)
,p_name=>'APEX.IG.VIEW'
,p_message_text=>'View'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(107808617577265705)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_text=>'Grid in view mode, press to edit'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(932007364564253658)
,p_name=>'APEX.IG.VISIBLE'
,p_message_text=>'Displayed'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942328695378615749)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_text=>'Volume'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404803745702871164)
,p_name=>'APEX.IG.WEEKS'
,p_message_text=>'weeks'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(932007590648255273)
,p_name=>'APEX.IG.WIDTH'
,p_message_text=>'Minimum Column Width (Pixel)'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382403887030219061)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_text=>'%0 between %1 and %2'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382403213358215207)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_text=>'%0 contains %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382403434757216304)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_text=>'%0 does not contain %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(225659523230958197)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_text=>'%0 does not start with %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382400865718193282)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_text=>'%0 equals %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382401220702197939)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_text=>'%0 greater than %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382401439721200696)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_text=>'%0 greater than or equal to %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382402885824212764)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_text=>'%0 in %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382405267712231560)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_text=>'%0 in the last %1 days'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382404848314228851)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_text=>'%0 in the last %1 hours'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382404459172226397)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_text=>'%0 in the last %1 minutes'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382406093561237316)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_text=>'%0 in the last %1 months'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382405688486233755)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_text=>'%0 in the last %1 weeks'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382406482077241333)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_text=>'%0 in the last %1 years'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382405027269230385)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_text=>'%0 in the last day'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382404661294227737)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_text=>'%0 in the last hour'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382404224714225176)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_text=>'%0 in the last minute'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382405809345235214)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_text=>'%0 in the last month'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382405474795232658)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_text=>'%0 in the last week'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382406262318239722)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_text=>'%0 in the last year'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382410031531274099)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_text=>'%0 in the next %1 days'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382409696605268271)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_text=>'%0 in the next %1 hours'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382409212302265744)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_text=>'%0 in the next %1 minutes'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382410844664280159)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_text=>'%0 in the next %1 months'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382410420156276661)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_text=>'%0 in the next %1 weeks'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382411244782284062)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_text=>'%0 in the next %1 years'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382409824832272569)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_text=>'%0 in the next day'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382409487131266858)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_text=>'%0 in the next hour'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382409073583264092)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_text=>'%0 in the next minute'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382410636567278860)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_text=>'%0 in the next month'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382410212268275535)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_text=>'%0 in the next week'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382411047889281937)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_text=>'%0 in the next year'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382402217303206905)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_text=>'%0 is not empty'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382402070695205379)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_text=>'%0 is empty'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382401647638202728)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_text=>'%0 less than %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382401854722204063)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_text=>'%0 less than or equal to %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382402415481210159)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_text=>'%0 like %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382403612102217588)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_text=>'%0 matches regular expression %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(392705771422068755)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_text=>'%0 minutes ago'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382404033282220088)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_text=>'%0 not between %1 and %2'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382401002267195016)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_text=>'%0 not equals %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382403023376213798)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_text=>'%0 not in %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382407656651251467)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_text=>'%0 not in the last %1 days'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382407223984249263)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_text=>'%0 not in the last %1 hours'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382406838481245245)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_text=>'%0 not in the last %1 minutes'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382408418018258152)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_text=>'%0 not in the last %1 months'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382408024644255075)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_text=>'%0 not in the last %1 weeks'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382408804059261335)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_text=>'%0 not in the last %1 years'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382407485496250479)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_text=>'%0 not in the last day'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382407077546247396)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_text=>'%0 not in the last hour'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382406601254242573)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_text=>'%0 not in the last minute'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382408255103256403)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_text=>'%0 not in the last month'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382407832895253623)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_text=>'%0 not in the last week'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382408693718259757)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_text=>'%0 not in the last year'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382412466384294656)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_text=>'%0 not in the next %1 days'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382412062003292565)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_text=>'%0 not in the next %1 hours'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382411668556288907)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_text=>'%0 not in the next %1 minutes'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382413227340300896)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_text=>'%0 not in the next %1 months '
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382412832878297692)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_text=>'%0 not in the next %1 weeks'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382413624905304130)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_text=>'%0 not in the next %1 years'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382412203141293547)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_text=>'%0 not in the next day'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382411856070290243)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_text=>'%0 not in the next hour'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382411462429287780)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_text=>'%0 not in the next minute'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382413016592299415)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_text=>'%0 not in the next month'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382412651807295946)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_text=>'%0 not in the next week'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382413431400301950)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_text=>'%0 not in the next year'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382402688672211435)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_text=>'%0 not like %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404446650908657043)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_text=>'%0 starts with %1'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942326683027610260)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(404804146887872738)
,p_name=>'APEX.IG.YEARS'
,p_message_text=>'years'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942327273005611004)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(942327461407611678)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1094566075165687231)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_text=>'Monday, 12 January, 2016'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1094566285019691450)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_text=>'January'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1094566476468694062)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_text=>'16 hours ago'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1094566696931694955)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_text=>'in 16h'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2207132578099210)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_text=>'Apply'
,p_is_js_message=>true
,p_version_scn=>9172460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2001020362965797)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Drag your image and use the zoom slider to reposition it within the frame.</p>',
'',
'<p>When focused on the image cropper, the following keyboard shortcuts are available:</p>',
'<ul>',
'    <li>Left Arrow: Move image left*</li>',
'    <li>Up Arrow: Move image up*</li>',
'    <li>Right Arrow: Move image right*</li>',
'    <li>Down Arrow: Move image down*</li>',
'    <li>I: Zoom in</li>',
'    <li>O: Zoom out</li>',
'    <li>L: Rotate left</li>',
'    <li>R: Rotate right</li>',
'</ul>',
'',
'<p class="margin-top-md"><em>*Hold Shift to move faster</em></p>'))
,p_is_js_message=>true
,p_version_scn=>9170910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2001241817975914)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_text=>'Crop Image Help'
,p_is_js_message=>true
,p_version_scn=>9170917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2207359228101133)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_text=>'Reset'
,p_is_js_message=>true
,p_version_scn=>37165918200007
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2001679216990719)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_text=>'Crop Image'
,p_is_js_message=>true
,p_version_scn=>9170925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2207629027105853)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_text=>'Move slider to adjust zoom level'
,p_is_js_message=>true
,p_version_scn=>9172575
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13645493301180636)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_text=>'Invalid file type. Supported file types %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(716731963153285100)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_text=>'Browse'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(713114456014218471)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_text=>'Choose File'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(713114699698219263)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_text=>'Choose Files'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13644803728846822)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_text=>'Drag and Drop'
,p_is_js_message=>true
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13657905878703340)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_text=>'Drag and Drop Files'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19255861622508838)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_text=>'Select a file or drop one here.'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19256012369510651)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_text=>'Select or drop files here.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19256983023629309)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_text=>'Select a file or drop one here.'
,p_is_js_message=>true
,p_version_scn=>34192315
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19257108528631061)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_text=>'Select or drop files here.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13657130430549673)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_text=>'%0 files'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13645219472172997)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_text=>'File is too large. Maximum file size is %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3471627868106925)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_text=>'Multiple file uploads are not supported.'
,p_is_js_message=>true
,p_version_scn=>13323651
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002409162128647)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_text=>'Remove'
,p_version_scn=>8296861
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2108244961612146)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_text=>'Address required.'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2101490980511445)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_text=>'City'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2102724635521083)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_text=>'Country Code'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2101635821513724)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_text=>'House Number'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2105018501553836)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_text=>'Latitude'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2104874121552951)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_text=>'Longitude'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2104654165551443)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_text=>'Show on Map'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2102998104522897)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_text=>'Score'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2102371252518351)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_text=>'Postal Code'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2102503735519591)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_text=>'State'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2101291285510474)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_text=>'Street'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2101095605509016)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_text=>'Geocoding Results'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12877394277161456)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_text=>'Geocoded'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12877547606163449)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_text=>'Not Geocoded'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2104472140549489)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_text=>'Map'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2103169502525131)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_text=>'No addresses found.'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2108439865615128)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_text=>'%0 is required.'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(254754876350660193)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_text=>'%0 or %1 is required.'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1840599593386561400)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_text=>'View help text for %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2211688914482780)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_text=>'Choose Image'
,p_is_js_message=>true
,p_version_scn=>9227625
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2211899028484655)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_text=>'Choose Images'
,p_is_js_message=>true
,p_version_scn=>9227644
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2208164517300945)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_text=>'Download'
,p_is_js_message=>true
,p_version_scn=>9198335
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2212343598494098)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_text=>'Drag and Drop'
,p_is_js_message=>true
,p_version_scn=>9227667
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2212587826495688)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_text=>'Drag and Drop Images'
,p_is_js_message=>true
,p_version_scn=>9227675
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2212797599522714)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_text=>'Select a image or drop one here.'
,p_is_js_message=>true
,p_version_scn=>9227694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2212906946524793)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_text=>'Select or drop images here.'
,p_is_js_message=>true
,p_version_scn=>9227702
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2213194091526382)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_text=>'Select a image or drop one here.'
,p_is_js_message=>true
,p_version_scn=>9227711
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2213340281527964)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_text=>'Select or drop images here.'
,p_is_js_message=>true
,p_version_scn=>9227721
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146855035025993279)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_text=>'Checked'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146855233446995734)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_text=>'Unchecked'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(314416776260861693)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_text=>'Empty read only combobox'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(307152865302939371)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_text=>'Empty read only listbox'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(307152422737932177)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_text=>'Read only combobox'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(307152656437935702)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_text=>'Read only listbox'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10713920655357983)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_text=>'#LABEL# is not in valid range of %0 to %1.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10714105895363214)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_text=>'#LABEL# is not a multiple of %0.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(331145204006394072)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_text=>'Read only switch'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79025803313294789)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_text=>'Read only edit with a link'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10585816697145762)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_text=>'#LABEL# must match the values %0 and %1.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10586225701148335)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_text=>'No'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311814916612801507)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_text=>'Off'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311815137469802084)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_text=>'On'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10586022238147350)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_text=>'Yes'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24287706391355626)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_text=>'Language selector'
,p_version_scn=>37165770887603
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3783001897424)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_text=>'Add Entry'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(486963902987827356)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_text=>'Add'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(486964607835828783)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_text=>'Remove'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3783003901244)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_text=>'Selected entries'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(530227565276081238)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_text=>'Advanced'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(530228576622090246)
,p_name=>'APEX.LTO.CANCEL'
,p_message_text=>'Cancel'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(530227788879082067)
,p_name=>'APEX.LTO.COMMON'
,p_message_text=>'Common'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(530228815699113691)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_text=>'Live Template Options'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(537684588433148944)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_text=>'Template Options are not available because this component is not rendered on the page.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(530227067847065179)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_text=>'No Template Options found.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(530228377395089241)
,p_name=>'APEX.LTO.SAVE'
,p_message_text=>'Save'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2800337611031006)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_text=>'Clear Circle'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3102890077363609)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_text=>'Custom Styles is not valid JSON.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2800617554037851)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_text=>'Distance Tool'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2800428533033270)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_text=>'Draw Circle'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601838275976542)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_text=>'Current Location'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2000199189530804)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_text=>'Initial position coordinates are invalid.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500877402724159)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_text=>'Initial position must be a point geometry.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1904532575547842)
,p_name=>'APEX.MAPS.KM'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601342686974000)
,p_name=>'APEX.MAPS.LAYER'
,p_message_text=>'Layer'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(584540147334083112)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_text=>'Layer: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2500177942001823)
,p_name=>'APEX.MAPS.MAP'
,p_message_text=>'Map'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1412908623193504)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_text=>'Messages'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1904652940548497)
,p_name=>'APEX.MAPS.MILES'
,p_message_text=>'miles'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(568453498259639532)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_text=>'The data contains more than %0 rows which exceeds the maximum allowed.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1600113709938414)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_text=>'&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Terms</a> &nbsp;&nbsp; Map data &copy; 2021 HERE'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500603103715622)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_text=>'SDO_GEOMETRY data type is not available in this database.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1600265232940079)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap contributors </a>'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3301180801985431)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap contributors </a>'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601474247974517)
,p_name=>'APEX.MAPS.POINTS'
,p_message_text=>'Points'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(584540362989084988)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_text=>'%0 Points'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2800527444036133)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_text=>'Rectangle Zoom'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2800275725029523)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_text=>'Remove'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601777126975982)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_text=>'Reset Bearing to North'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(230777932643730196)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_text=>'Toggle to 2D mode'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(230778413272727251)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_text=>'Toggle to 3D mode'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2800143933026934)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_text=>'Toggle Copyright Notice'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2800742729040220)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_text=>'Total Distance'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601592073975086)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_text=>'Zoom in'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601699326975630)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_text=>'Zoom out'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(517489609116856475)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_text=>'Bold'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(524429846250209949)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_text=>'Image'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(524428592912193705)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_text=>'Inline Code'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(695193682071764838)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_text=>'Insert Image'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(695193807886768084)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_text=>'Insert Link'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(517489874871860559)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_text=>'Italic'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(698741668249134149)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_text=>'Link'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(524429136896203593)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_text=>'List'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(524428981279201843)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_text=>'Ordered List'
,p_is_js_message=>true
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(518671269662928983)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_text=>'Preview'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(524428069099161600)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_text=>'Nothing To Preview'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(524428283119180724)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_text=>'Strikethrough'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(524428772007199667)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_text=>'Unordered List'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382653571976420669)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_text=>'current'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1205049669878717801)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_text=>'More...'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(382652971617412878)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_text=>'Loading'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(41027026208214364)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_text=>'Split Button'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(41026886721208202)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_text=>'Split Menu'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(649203826404196144)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_text=>'Notification Message'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1600720434363454)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_text=>'No %0 found'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(429302907737212206)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_text=>'#LABEL# must be a number less than or equal to %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(429303300596219604)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_text=>'#LABEL# must be a valid number.'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(429303625530226755)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_text=>'#LABEL# does not match number format %0 (Example: %1).'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(429302629077208828)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_text=>'#LABEL# must be a number greater than or equal to %0.'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(429302304490201806)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_text=>'#LABEL# must be a number between %0 and %1.'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(390518589477425048)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_text=>'opens in new window'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(134759704981991167)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_text=>'This page was already submitted and can not be re-submitted.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88385723652283701)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_text=>'Application "%0" Page "%1" not found.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(190382422629374195)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_text=>'#LABEL# must have some value.'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1741034343007989)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_text=>'Hide Password'
,p_is_js_message=>true
,p_version_scn=>81694682
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1740881941788990)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_text=>'Show Password'
,p_is_js_message=>true
,p_version_scn=>81686457
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(22575148437026980)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_text=>'Search'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(486969520911851418)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_text=>'Close'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(486969007405847585)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_text=>'Find%0'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(486972327275862714)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_text=>'Next'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(486970332685854800)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_text=>'Previous'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9204033806877837)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_text=>'Enter a search term of at least %0 characters.'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(244202723691302596)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_text=>'Popup List of Values: %0'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9204281959879931)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_text=>'Enter a search term.'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1401615814002879)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_text=>'List of values'
,p_is_js_message=>true
,p_version_scn=>390631264
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9203813920873916)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_text=>'No results found.'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9203613993869345)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_text=>'Remove %0'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(373435905063801717)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_text=>'Search Term'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(486967716624840718)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_text=>'Search'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1414361224220991)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_text=>'Requires %0.'
,p_version_scn=>10944548
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1737063269851438)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_text=>'Error during report printing.'
,p_version_scn=>32328468
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2084920073751485)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_text=>'Unable to print the document using the configured print server.'
,p_version_scn=>8412130
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5402952410338657)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_text=>'Error during evaluation of parameter %0 when calling %1. See error log for details.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(624278081015358229)
,p_name=>'APEX.PROCESSING'
,p_message_text=>'Processing'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4601546023527114)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_text=>'Back'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4701090568322285)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_text=>'This website has app functionality. Install it on your device for the best experience.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5600758732431559)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_text=>'Next'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7112199240621618)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_text=>'Install this app'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2820042523286030)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_text=>'Your device or browser does not appear to support the installation of Progressive Web Apps right now.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2400976997925489)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_text=>'1. Tap the <strong>Share</strong> icon'
,p_version_scn=>37166001784840
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2401144090928393)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_text=>'2. Scroll down and tap <strong>Add to Home Screen</strong>'
,p_version_scn=>37166001784986
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4601925122582590)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_text=>'3. Tap <strong style="color:#007AE1;">Add</strong> to confirm'
,p_version_scn=>37166001785032
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4400976130322151)
,p_name=>'APEX.PWA.OFFLINE.BODY'
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
'    <h1>Can''t connect</h1>',
'    <p>Looks like there''s a network issue. Check your connection and try again.</p>',
'    <button type="button">Retry</button>',
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>3632690
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4400590879293112)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_text=>'Can''t connect'
,p_version_scn=>3065653
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95127359749759286)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_text=>'This device failed to enable push notifications.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(105926431436972380)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_text=>'Quick Picks for %0'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(105926248811969553)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_text=>'Quick Pick Link'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40757151254403407)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_text=>'Visually hidden radio button'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1798444236362589)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_text=>'Single Row View'
,p_is_js_message=>true
,p_version_scn=>82758881
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(818403400599716783)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_text=>'Add'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(345023003948195760)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_text=>'All Day'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1569876846352725312)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_text=>'Send Invitation'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1569423504970171714)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_text=>'Options'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(360042500367349041)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_text=>'Daily view for all day '
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(360042114182327448)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_text=>'Daily view for data with time '
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651374621292753232)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_text=>'Day'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(599506184874552378)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_text=>'Description'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37018413508386693)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_text=>'CSV'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37018019762383834)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_text=>'iCal'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37004327095380425)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_text=>'PDF'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37018216743385235)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_text=>'XML'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37003614814370926)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_text=>'End Date'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37004005541375177)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_text=>'Event Name'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1569424429566212197)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_text=>'Invitation'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651374855451755318)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_text=>'List'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651374213511750760)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_text=>'Month'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(697004398931996216)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_text=>'Next'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1000695137592203724)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_text=>'No Events'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1574931529420889987)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_text=>'Edit an Existing Event.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1574931332232887139)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_text=>'Sending an Invitation through Email.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(697004568287997253)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_text=>'Previous'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(926875890193286451)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_text=>'Send Email'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(926696712399934446)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_text=>'Send Email'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1645817708828456765)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_text=>'All fields are required.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1645817120198443008)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_text=>'Send Invitation'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1568143073940269291)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_text=>'Subject'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(926866700832284826)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_text=>'To'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37003810933372668)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_text=>'Start Date'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(801476654884688818)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_text=>'Form on %0'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(359998619873896543)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_text=>'Time'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(697115993157599829)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_text=>'Today'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(655714275475588239)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_text=>'View'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651374466490752276)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_text=>'Week'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(360042327756336304)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_text=>'Weekly view for all day'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(360041821946323808)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_text=>'Weekly view for data with time'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(652237706323747746)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_text=>'Year'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651383067195893048)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_text=>'Columns...'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651443111336238570)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_text=>'Load more...'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(150967610028831199)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_text=>'Back'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(20142519502787493)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_text=>'Load more...'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24030217886277957)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_text=>'Search...'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(651443360745240800)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_text=>'Load more...'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(695823050339773628)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_text=>'Region ID %0 not found.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(22580411792191275)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_text=>'No Data Found'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(90971500041141999)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_text=>'Unable to reset region pagination.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9427009266865989)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_text=>'Error setting region pagination.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(585083987340530599)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_text=>'Columns...'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3413681478131169)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_text=>'Lazy loading is incompatible with slots in %0, which is a single (partial) region. You should either disable lazy loading for this region, or move the slot components to a different region.'
,p_version_scn=>90714420
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2619560636172506)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_text=>'Group Template is missing in Template Component for %0.'
,p_version_scn=>33812933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2204688915677753)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_text=>'%0 is a single (partial) region and has returned multiple rows.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(695822417279753343)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_text=>'Region Type %0 is not supported.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9426404923751244)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_text=>'Error during rendering of region "#COMPONENT_NAME#".'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(190459615244864075)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_text=>'#COLUMN_HEADER# must have some value.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1467086101226607)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_text=>'You must specify a Report Layout.'
,p_version_scn=>13126537
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500071714507300629)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_text=>'%0, rich text editor'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(212664925798954792)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_text=>'The Rich Text HTML markup exceeds the item''s maximum length (actual %0, allowed %1 characters)'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3017724072309096)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_text=>'Read Only Rich Text Editor'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3017557817307425)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_text=>'Rich Text Editor'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3016925906247205)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_text=>'Alignment'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3017149596248245)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_text=>'Extras'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3016555470244078)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_text=>'Font'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3016344342242231)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_text=>'Formatting'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3016760175245618)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_text=>'Lists'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(650911878305738762)
,p_name=>'APEX.RV.DELETE'
,p_message_text=>'Delete'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(541341629662273573)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_text=>'Duplicate'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(529556005482770942)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_text=>'Displayed Columns'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(529555737485768353)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_text=>'Exclude Null Values'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(650912085870741224)
,p_name=>'APEX.RV.INSERT'
,p_message_text=>'Add'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(342221495638312066)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_text=>'Move Down'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(342221687713313237)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_text=>'Move Up'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(529555371065764678)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_text=>'Next'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(529556869124782266)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_text=>'Other Columns'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(529555536987766470)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_text=>'Previous'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(529556218803773081)
,p_name=>'APEX.RV.REC_X'
,p_message_text=>'Row %0'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(529556405350775357)
,p_name=>'APEX.RV.REC_XY'
,p_message_text=>'Row %0 of %1'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(541341848855276495)
,p_name=>'APEX.RV.REFRESH'
,p_message_text=>'Refresh'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(541342011477278417)
,p_name=>'APEX.RV.REVERT'
,p_message_text=>'Revert Changes'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(529553726356701078)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_text=>'Settings'
,p_is_js_message=>true
,p_version_scn=>595283763
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(279977374567349822)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_text=>'For example, %0'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(329954595502300961)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_text=>'Example: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10600158921913933)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_text=>'1 result'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9000610177121990)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_text=>'%0 results'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(119017193912044573)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_text=>'Pagination'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(119518394692466411)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_text=>'Results, %0 to %1'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1304042108036057)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_text=>'Sign In Again'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1303739929961850)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_text=>'Your session has ended'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1304264220040628)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_text=>'Extend'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1302096265918293)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_text=>'Your session will end at %0. Would you like to extend it?'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1302297124920486)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_text=>'Your session will end at %0 and cannot be extended. Please save any work now to avoid losing any data'
,p_is_js_message=>true
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(887272622695452483)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_text=>'Error processing database session cleanup code.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88383307245269544)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_text=>'Error processing database session setup code.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(15060014210037190)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_text=>'Your session has ended.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(826760907254550246)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_text=>'Please close this dialog and press your browser''s reload button to obtain a new session.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1398603948573978328)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_text=>'<a href="%0">Sign In</a> again to create a new session.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113436343818212934)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_text=>'Session Not Valid'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(353629704788111686)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_text=>'No Dynamic Roles could be enabled in the Real Application Security session for user "%0".'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88290709698797097)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_text=>'ERR-99900 Could not create unique session ID: %0'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1801293553455886)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_text=>'Session state data type CLOB is not allowed for item %0.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3000587257188262)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_text=>'Substituting items of session state data type CLOB is not supported.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(116868631324477829)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_text=>'Session state protection violation: This may be caused by manual alteration of protected page item %0. If you are unsure what caused this error, please contact the application administrator for assistance.'
,p_version_scn=>37165770887568
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2456070606638875009)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_text=>'Page protection violation: This may be caused by submitting a page that had not yet finished loading or by manual alteration of protected page items. For further assistance, please contact the application administrator.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2136240830381305650)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_text=>'%0 contains one of the following invalid characters &<>"/;,*|=% or --'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2136244912504309950)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_text=>'%0 contains one of the following invalid characters &<>"/;,*|=% or -- or new line.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2136232601291297248)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_text=>'%0 contains special characters. Only the characters a-Z, 0-9 and spaces are allowed.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2136236717222301832)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_text=>'%0 contains <, > or " which are invalid characters.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21004705976711696)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_text=>'No checksum was provided to show processing for a page that requires a checksum when one or more request, clear cache, or argument values are passed as parameters.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(109444001725110520)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_text=>'Session state protection violation: This may be caused by manual alteration of a URL containing a checksum or by using a link with an incorrect or missing checksum. If you are unsure what caused this error, please contact the application administrato'
||'r for assistance.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(533535725698287445)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_text=>'Set High Contrast Mode Off'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(533543528468288294)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_text=>'Set High Contrast Mode On'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4279805404804438)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_text=>'Application setting %0 cannot be updated as it is subscribed from another application.'
,p_version_scn=>37165255031167
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101570118683033179)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_text=>'Bottom'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101571102192037891)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_text=>'Down'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101573222717100578)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_text=>'Move'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101573630682102900)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_text=>'Move All'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101574002070104098)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_text=>'Remove'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101574407611105704)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_text=>'Remove All'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101576614846155070)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_text=>'Reset'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101569303792028866)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_text=>'Top'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101570627687035778)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_text=>'Up'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045734248439358692)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045746385590467383)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_text=>'in %0d'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045734052904357219)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045746765571468818)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_text=>'in %0h'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045733323871353098)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045746913516470768)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_text=>'in %0m'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045734877392363334)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_text=>'%0mo'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045745588911464763)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_text=>'in %0mo'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045733780519355712)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045745966895466310)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_text=>'in %0s'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045734481452359990)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045748375858473977)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_text=>'in %0w'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045734678363362153)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1045743539071455675)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_text=>'in %0y'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500238577563854)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_text=>'[Line]'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500510841565697)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_text=>'[Multiple Lines]'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500417837565137)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_text=>'[Multiple Points]'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500672343566332)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_text=>'[Multiple Polygons]'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500767904566794)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_text=>'[Geometry Object]'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500156100563356)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_text=>'[Point (%0,%1)]'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500322189564598)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_text=>'[Polygon]'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1487555870805239)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_text=>'Collapsed region: %0'
,p_is_js_message=>true
,p_version_scn=>524694613
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(174694807074578792)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_text=>'Collapse'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1484781996829984)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_text=>'Horizontally oriented splitter cannot be moved to the left or to the right'
,p_is_js_message=>true
,p_version_scn=>524533265
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1485817846701995)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_text=>'Maximum size of %0px reached'
,p_is_js_message=>true
,p_version_scn=>524606607
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1487997789908744)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_text=>'Minimum size of %0px reached'
,p_is_js_message=>true
,p_version_scn=>553770184
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1487720524812800)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_text=>'Region is collapsed'
,p_is_js_message=>true
,p_version_scn=>524695712
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1487383010720003)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_text=>'Region is restored'
,p_is_js_message=>true
,p_version_scn=>524687363
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1486240222502315)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_text=>'Resized to %0px'
,p_is_js_message=>true
,p_version_scn=>524676946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1487145803711708)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_text=>'Restored region: %0'
,p_is_js_message=>true
,p_version_scn=>524686991
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(174694611388576802)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_text=>'Restore'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1485155850026808)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_text=>'Vertically oriented splitter cannot be moved up or down'
,p_is_js_message=>true
,p_version_scn=>553770847
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(460404935420350701)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_text=>'Clear Rating'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(427336401112555798)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_text=>'%0 is not in the valid rating range of 1 - %1'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(427336654390558060)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_text=>'%0 is not numeric'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(394625828679106099)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_text=>'Success Message'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1498100561382375898)
,p_name=>'APEX.TABS.NEXT'
,p_message_text=>'Next'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1498100320440373991)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_text=>'Previous'
,p_is_js_message=>true
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(250544521253097248)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_text=>'System of record(s) associated with this task instance is not found'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(285940206222357670)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_text=>'The execution of task action %0 failed - the task is set to errored state, please check the task action code'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1905805114663838)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_text=>'Add Comment: Not authorized'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1904536911595172)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_text=>'Task already assigned'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513819260635808)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_text=>'Assigned to %0'
,p_comment=>'Example: Assigned to Allen'
,p_version_scn=>355413907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1904137274584181)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_text=>'Cancel Task: Not authorized'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2602654230828589)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_text=>'Cannot remove the actual owner of this task. Please delegate the task to another participant before retrying this operation.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1903370126566497)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_text=>'Claim Task: Not authorized'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1903554247568676)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_text=>'Complete Task: Not authorized'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1903780945578285)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_text=>'Delegate Task: Not authorized'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1801294169324595)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_text=>'Due Date of the task can not be in the past.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513637094630716)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_text=>'Due %0'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Intended to be used with the APEX SINCE format mask.',
'Examples: Due 2 days from now, Due 23 hours ago'))
,p_version_scn=>355413705
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513954019714397)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_text=>'Task Action %1 failed. Error message - %0'
,p_version_scn=>64097562
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513771621710803)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_text=>'Failed'
,p_version_scn=>64097646
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513294672693781)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_text=>'Success'
,p_is_js_message=>true
,p_version_scn=>64097981
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513589595706808)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_text=>'Action %1 succeeded with message %0'
,p_version_scn=>64097719
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1620268817577974)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_text=>'Before Expire'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3502190705601156)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_text=>'Cancel'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3501020812530007)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_text=>'Task canceled'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3502314625612745)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_text=>'Participant is not allowed to cancel the task'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3500895436522026)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_text=>'Claim'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3501669151567951)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_text=>'Task is already claimed by another user or participant is not entitled to claim this task'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3501255535535529)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_text=>'Task claimed by %0'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311444798216787965)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_text=>'Complete'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3500458883501160)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_text=>'Task completed with outcome %0'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3600260408623182)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_text=>'The Task is either not assigned or the participant is not allowed to complete the task'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1407455905333274)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_text=>'Task completed without outcome'
,p_version_scn=>16714937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311444816342787966)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_text=>'Create'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2701475865293824)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_text=>'Task created with ID %0'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311444901641787966)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_text=>'Delegate'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3500681083514282)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_text=>'Task delegated to potential owner %0'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3501889238586307)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_text=>'Participant not entitled or new participant is not a potential owner of this task'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601189291298099)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_text=>'Expire'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1603973028403267)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_text=>'Task expired.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311445018011787966)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_text=>'Fail'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1502889152507271)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_text=>'The Task is either not assigned or the participant is not allowed to request information for the task'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1503096637514388)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_text=>'Either no information has been requested for the task or the participant is not allowed to submit information for the task.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601678414328283)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_text=>'Expire task as maximum renewal count of %0 is reached.'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3600637532643570)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_text=>'Task is not in correct state or participant is not a business administrator for this task'
,p_version_scn=>37165770887569
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3600900528671121)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_text=>'Operation %0 is unknown or not applicable for this task'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311445106452787966)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_text=>'Release'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(222942326607473869)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_text=>'Task released, can now be claimed by others'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1913016046406321)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_text=>'Task release is not allowed - the user is not the owner of the task'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3203095775351836)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_text=>'Remove Owner'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3203510659396677)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_text=>'Participant %0 removed from the task'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1605077388763891)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_text=>'Renew'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1601432303321467)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_text=>'Task renewed with ID %0, maximum remaining number of renewals before expiration is %1.'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1604814288756025)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_text=>'Task ID %0 renewed with task ID %1'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1508729120588442)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_text=>'Request Information'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1503448863571429)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_text=>'Requested %0 for more information: %1'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1488402433174765)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_text=>'Set Initiator Can Complete to %0'
,p_version_scn=>80236529
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1508910558590084)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_text=>'Submit Information'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1503255114563555)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_text=>'Requested information submitted to %0: %1'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311445240438787966)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_text=>'Update Comment'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3400688167467974)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_text=>'Add comment: %0'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3600444607632720)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_text=>'Task state allow no comments'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5000822928364192)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_text=>'Set task due date to %0'
,p_version_scn=>64097746
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1458627701830504)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_text=>'Update Due On'
,p_version_scn=>64097768
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311445314952787966)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_text=>'Update Owner'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3500210035484900)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_text=>'Add potential owner %0 to task participants'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3401470311246572)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_text=>'Update Parameters'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(311445431467787966)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_text=>'Update Priority'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3501410682542281)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_text=>'Set task priority to %0'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3203719415405058)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_text=>'Updated parameter "%0" from "%1" to "%2".'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2000770887620976)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_text=>'Task canceled as the corresponding workflow instance was terminated.'
,p_version_scn=>2980721
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1903930186581135)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_text=>'Forward Task: Not authorized'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513479056628154)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_text=>'Initiated by %0 %1'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Intended to be used with the APEX SINCE format mask.',
'Example: Initiated by Allen 4 days ago'))
,p_version_scn=>355413597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1913487222409672)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_text=>'An unexpected internal error occurred'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1904745770603898)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_text=>'Task operation not applicable'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4001451667623920)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_text=>'This potential owner does not exist.'
,p_version_scn=>206714708
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1908228822009812)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_text=>'Approved'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1908479312011631)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_text=>'Rejected'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1407670664344485)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_text=>'Task completion requires an outcome'
,p_version_scn=>16715026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1407883979350278)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_text=>'Task is not allowed to have an outcome'
,p_version_scn=>16715079
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3203268803360653)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_text=>'Cannot update parameter %0.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2601263203790196)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_text=>'The participant already exists for this task instance.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(267342429618145379)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_text=>'Urgent'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1514092401637564)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_text=>'Urgent'
,p_version_scn=>355413970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(267342233735144043)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_text=>'High'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1514203632639246)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_text=>'High priority'
,p_version_scn=>355414143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(267342080278142511)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_text=>'Medium'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1514424276641096)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_text=>'Medium priority'
,p_version_scn=>355414180
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(267341688674139161)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_text=>'Low'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1514636590642264)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_text=>'Low priority'
,p_version_scn=>355414263
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(267341426106138245)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_text=>'Lowest'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1514896666644062)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_text=>'Lowest priority'
,p_version_scn=>355414306
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1904306865589014)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_text=>'Set Task Priority: Not authorized'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1907140891929221)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_text=>'Assigned'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1907942470935308)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_text=>'Canceled'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1907350844930406)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_text=>'Completed'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1907784029933039)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_text=>'Errored'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1600936072293370)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_text=>'Expired'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1907539460931709)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_text=>'Failed'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1502513870484657)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_text=>'Information Requested'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1906938791925255)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_text=>'Unassigned'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3700677537788876)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The creation of a new Task for Task Definition %0 in application %1 failed.',
'SQLCODE: %2'))
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3700343827715577)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_text=>'An attempt to create a task for task definition %0 in application %1 failed because the task definition does not contain any potential owners - please edit the task definition and add at least one participant of type potential owner'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1905424776651207)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_text=>'Task definition not found'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1905285076647714)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_text=>'Participants not found for the task'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1913229056408171)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_text=>'More than one task for the given task id - please check with your database administrator'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1905668101657865)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_text=>'Task Not Found'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1905062707636506)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_text=>'Task parameter not found'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10200439863514064)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_text=>'Action'
,p_version_scn=>17585206
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10200272456506361)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_text=>'Approval'
,p_version_scn=>15475667
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1412724442198582)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_text=>'Vacation Rule Procedure %2 failed to execute for task definition %0 in application %1.'
,p_version_scn=>24827092
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1412962064301198)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_text=>'Participant %1 added as a substitute for participant %0 . Reason - %2 .'
,p_version_scn=>24834665
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1007087409724471246)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_text=>'Toolbar'
,p_is_js_message=>true
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(15458859077809221)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_text=>'Application'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1532550110018432833)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_text=>'Expand / Collapse Navigation'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1532550374224434636)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_text=>'Expand / Collapse Side Column'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(235575565231290634)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_text=>'Main Navigation'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2301163401646276)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_text=>'"%0" is an invalid placeholder name.'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276197738016063719)
,p_name=>'APEX.TIME.DAY'
,p_message_text=>'1 day'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276197359319061779)
,p_name=>'APEX.TIME.HOUR'
,p_message_text=>'1 hour'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276197934911064704)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_text=>'%0 days'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276197580470062743)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_text=>'%0 hours'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276197190830059485)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_text=>'%0 minutes'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276198677296066812)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_text=>'%0 weeks'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276198107718065621)
,p_name=>'APEX.TIME.WEEK'
,p_message_text=>'1 week'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2807596016078733)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_text=>'%0 items selected'
,p_is_js_message=>true
,p_version_scn=>7469438
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2807904965084415)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_text=>'Select Item'
,p_is_js_message=>true
,p_version_scn=>7469481
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2807771942081168)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_text=>'Select %0'
,p_is_js_message=>true
,p_version_scn=>7469452
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1922632899732860545)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_text=>'Start of page'
,p_is_js_message=>true
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(72346184187022435)
,p_name=>'APEX.UI.ENABLED'
,p_message_text=>'Enabled'
,p_is_js_message=>true
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6139627949062416)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_text=>'Error processing request.'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3002756822372897)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_text=>'Text message %0 can not be updated as it is subscribed from another application.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(280295659358440925)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_text=>'Value Required'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10445521673828722)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_text=>'Heading level %0, hidden'
,p_is_js_message=>true
,p_version_scn=>150075864
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(582353484005936597)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_text=>'This page has unsaved changes.'
,p_is_js_message=>true
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4201897858829468)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_text=>'Navigator'
,p_is_js_message=>true
,p_version_scn=>69319323
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4201228360823457)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_text=>'Zoom In'
,p_is_js_message=>true
,p_version_scn=>69319153
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4400279967880925)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_text=>'Zoom level {0}%'
,p_is_js_message=>true
,p_version_scn=>69500550
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4201496709824375)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_text=>'Zoom Out'
,p_is_js_message=>true
,p_version_scn=>69319170
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4201654060827014)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_text=>'Zoom Reset'
,p_is_js_message=>true
,p_version_scn=>69319221
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1929609979716354)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_text=>'The workflow diagram is not accessible at this time.'
,p_is_js_message=>true
,p_version_scn=>103685681
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1929412042723965)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_text=>'Workflow Diagram'
,p_is_js_message=>true
,p_version_scn=>103685443
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002593383394229)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_text=>'The Workflow Instance %0 in currently in state %1. Therefore the operation is not allowed'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2007147081390887)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_text=>'Activity %2''s instance %1 in Workflow %0 was completed'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2006606372305017)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_text=>'Created new instance %1 of Activity %2 in Workflow %0'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1801583960293075)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_text=>'Additional data row associated with this workflow activity instance is not found'
,p_version_scn=>6207212
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2006814397380761)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_text=>'Activity %2''s faulted instance %1 in Workflow %0 was retried'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1481555879943386)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_text=>'Activity instance %1 in Workflow %0 was terminated'
,p_version_scn=>4088628
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3589611938651947)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_text=>'Activity instance %1 in Workflow %0 timed out and was terminated.'
,p_version_scn=>2643257152
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2007399701405005)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_text=>'Activity %2''s instance %1 in Workflow %0 is in Waiting state'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1477679877835610)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_text=>'Workflow Instance %0 was altered and resumed at activity %1'
,p_version_scn=>2845929722
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2005183026211353)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_text=>'The Waiting Instance %1 of Activity %2 in Workflow %0 completed successfully'
,p_version_scn=>37165879964274
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2004599704089037)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_text=>'Waiting activity %1 was Faulted because the Workflow %0 was already in Faulted state before the Activity completed'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2004897356120875)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_text=>'The Waiting Activity %1 was Terminated because the Workflow %0 was already in Terminated state before the Activity completed'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1481785758952191)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_text=>'The termination of Activity %1 in Workflow %0 failed due to exception - %2'
,p_version_scn=>3971703
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002726667403769)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_text=>'The Workflow is currently busy completing a previous operation. Please try later'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3419502963623532)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_text=>'Completed %0'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Intended to be used with the APEX SINCE format mask.',
'Example: Completed 4 days ago'))
,p_version_scn=>356675080
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2001962304366275)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_text=>'The Workflow %0 cannot be continued as it is currently at Activity %1 which is not in a Waiting state'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2601297659296843)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_text=>'%0 is not a valid workflow correlation context for the process being executed by this Workflow Activity. The correlation context must be a colon delimited text containing APEX_APPL_WORKFLOW followed by the Workflow Instance ID and the Activity Instan'
||'ce ID.'
,p_version_scn=>39704534
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2005552199239239)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_text=>'Created new Instance %0 of Workflow %1, Version %2'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1801302417289564)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_text=>'Additional data row associated with this workflow instance is not found'
,p_version_scn=>6207195
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3420237901646869)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_text=>'Due %0'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Intended to be used with the APEX SINCE format mask.',
'Examples: Due 2 days from now, Due 23 hours ago'))
,p_version_scn=>356675113
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2005367924223273)
,p_name=>'APEX.WORKFLOW.END'
,p_message_text=>'Workflow %0 ended with state %1'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2001533813299101)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_text=>'The data type %1 for the conditions being compared in the Switch Activity of Workflow %0 is not compatible with the condition operator'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1513269698624877)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_text=>'Initiated by %0 %1'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Intended to be used with the APEX SINCE format mask.',
'Example: Initiated by Allen 4 days ago'))
,p_version_scn=>355413414
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2650047983511909)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_text=>'Created new Instance %0 of Workflow %1, Version %2 - invoked from activity instance %4 of workflow instance %3'
,p_version_scn=>2107684615
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1478482904917096)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_text=>'Activity with static ID %1 is not an activity in Workflow %0. Check the activity static ID''s of the corresponding Workflow Version.'
,p_version_scn=>2845952150
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2410365122028652)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_text=>'%0 is a required parameter for this workflow and must not be NULL.'
,p_version_scn=>2205216208
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2006412137275076)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_text=>'Workflow Instance %0 was resumed'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2006245181269502)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_text=>'Workflow Instance %0 was retried'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3420719977675282)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_text=>'%0 retry'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Someone could argue why we have not a fixed "1".',
'The reason is we can also provide "One" as a value.'))
,p_version_scn=>356682022
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3421222426692574)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_text=>'%0 retries'
,p_version_scn=>356677155
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3419729581629077)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_text=>'Started %0'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Intended to be used with the APEX SINCE format mask.',
'Example: Started 20 seconds ago'))
,p_version_scn=>356675143
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2600336256186637)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_text=>'Active'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2600715944191372)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_text=>'Completed'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2600923803192908)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_text=>'Faulted'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2601187049195632)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_text=>'Suspended'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2600544549188255)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_text=>'Terminated'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5001370201236806)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_text=>'Waiting'
,p_version_scn=>39365004
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2005744500256484)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_text=>'Workflow Instance %0 was suspended'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2371630148747862)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_text=>'The next activity for Workflow Instance %0 can not be determined. Verify and correct the conditions defined for the current switch activity before retrying the workflow.'
,p_version_scn=>2160425386
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2005903067261588)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_text=>'Workflow Instance %0 was terminated'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2003910163497034)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_text=>'Only the Business Administrator of Workflow %0 can resume the Workflow'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2004196948509482)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_text=>'The Workflow %0 can only be retried by a Business Administrator and/or an Owner'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2003143346422006)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_text=>'The Workflow Instance %0 can only be suspended by a Business Administrator of the workflow'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2003677034478844)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_text=>'Only Owners and Business Administrators of Workflow Instance %0 can terminate the workflow'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002362227383771)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_text=>'Variables of Workflow %0 can only be updated by a Business Administrator defined for the workflow'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3080329224351682)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_text=>'The workflow instance %0 must be in Faulted or Suspended state before its variables can be updated.'
,p_version_scn=>2245175611
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2200240753272272)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_text=>'Value of Workflow Variable %0 updated to %1'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3400735055934326)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_text=>'Workflow %0 has no Active version'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3400998467936962)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_text=>'Workflow %0 has no In Development version'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3401124857943930)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_text=>'Workflow %0 has no Active or In Development version'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2001374633160868)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_text=>'Activity Instance %1 for Workflow Instance %0 was not found'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2001137648141618)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_text=>'Workflow Instance %0 was not found'
,p_version_scn=>38788301
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11803027935106035)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_text=>'The workbook has no active worksheet.'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11802801350099666)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_text=>'The workbook is not initialized.'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11802607294090423)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_text=>'An internal error has occurred while creating the XLSX file.'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13500223295517562)
,p_name=>'APEX.XLSX.SHEET'
,p_message_text=>'Sheet'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37503400307592540)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_text=>'The worksheet name "%0" is already taken. Try a different one.'
,p_version_scn=>37165770887535
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795705001803519569)
,p_name=>'APEXIR_ACTIONS'
,p_message_text=>'Actions'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141731413888941765)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_text=>'Actions Menu'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135797704135807871)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_text=>'Add Function'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135797527427797009)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_text=>'Add Group By Column'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(360321018056844688)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_text=>'Add Pivot Column'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(360321212018847479)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_text=>'Add Row Column'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67562016132370060)
,p_name=>'APEXIR_AGGREGATE'
,p_message_text=>'Aggregate'
,p_is_js_message=>true
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(148143217203749212)
,p_name=>'APEXIR_AGGREGATION'
,p_message_text=>'Aggregation'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112077414311906522)
,p_name=>'APEXIR_AGG_AVG'
,p_message_text=>'Average'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114930610294251134)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_text=>'Count'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112077817774907486)
,p_name=>'APEXIR_AGG_MAX'
,p_message_text=>'Maximum'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112078623662909240)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_text=>'Median'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112078220891908448)
,p_name=>'APEXIR_AGG_MIN'
,p_message_text=>'Minimum'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112077010502905437)
,p_name=>'APEXIR_AGG_SUM'
,p_message_text=>'Sum %0'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112698631876372047)
,p_name=>'APEXIR_ALL'
,p_message_text=>'All'
,p_is_js_message=>true
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67384418248556324)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_text=>'All Columns'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(17314500293251221)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_text=>'All Rows'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791237420010196773)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_text=>'Alternative'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791248906223372577)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_text=>'Alternative Default:  %0 '
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(96129531770428410)
,p_name=>'APEXIR_AND'
,p_message_text=>'and'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(230141456494373684)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_text=>'Unable to import saved report. The content is corrupted.'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(230141660012374783)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_text=>'Unable to import saved report. The content is empty.'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(73414320431887353)
,p_name=>'APEXIR_APPLY'
,p_message_text=>'Apply'
,p_is_js_message=>true
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56121529817331496)
,p_name=>'APEXIR_ASCENDING'
,p_message_text=>'Ascending'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103942030470234494)
,p_name=>'APEXIR_AS_OF'
,p_message_text=>'As of %0'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795668617789278258)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_text=>'Average %0'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(644585085686380031)
,p_name=>'APEXIR_BAR'
,p_message_text=>'Bar'
,p_version_scn=>37165770887570
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(71283707575987937)
,p_name=>'APEXIR_BETWEEN'
,p_message_text=>'between'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55205511867680078)
,p_name=>'APEXIR_BGCOLOR'
,p_message_text=>'Background Color'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56653623769210273)
,p_name=>'APEXIR_BLUE'
,p_message_text=>'blue'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137173229164988337)
,p_name=>'APEXIR_BOTTOM'
,p_message_text=>'Bottom'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3600613676415683)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_text=>'Buttons next to search bar of %0'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56829327541258698)
,p_name=>'APEXIR_CANCEL'
,p_message_text=>'Cancel'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(78487518065976490)
,p_name=>'APEXIR_CATEGORY'
,p_message_text=>'Category'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55204220740673262)
,p_name=>'APEXIR_CELL'
,p_message_text=>'Cell'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112497432589123502)
,p_name=>'APEXIR_CHART'
,p_message_text=>'Chart'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138675402851573624)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_text=>'Initializing...'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(380016024248158072)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_text=>'Chart label must be specified.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(432429528710620298)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_text=>'Your query exceeds the maximum of %0 data points per chart. Please apply a filter to reduce the number of records in your base query.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(411139011605572408)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The maximum row count for a Chart query limits the number of rows in the base query, not the number of rows displayed.  ',
'Your base query exceeds the maximum row count of %0.  Please apply a filter to reduce the number of records in your base query.'))
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67558422880334096)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_text=>'Chart Type'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4000294541463612)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_text=>'Chart view of %0'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(397266617361688313)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_text=>'Check All'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103946910047304286)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_text=>'Choose report format'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(124740303006801945)
,p_name=>'APEXIR_CLEAR'
,p_message_text=>'clear'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56667712650254418)
,p_name=>'APEXIR_COLUMN'
,p_message_text=>'Column'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147609619180217166)
,p_name=>'APEXIR_COLUMNS'
,p_message_text=>'Columns'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(78914829019525060)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_text=>'Column Aliases'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(688293662229697220)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_text=>'Filter...'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8401053954507048)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_text=>'Column Header'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26575543775957437)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_text=>'Column Actions'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26664903342667204)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_text=>'Actions for "%0" column'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131720526938972055)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_text=>'Column Heading Menu'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138531104817366040)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_text=>'Column Information'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(724036399175708813)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_text=>'Column Label'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135909207785744989)
,p_name=>'APEXIR_COLUMN_N'
,p_message_text=>'Column %0'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91841703439014435)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_text=>'contains'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95711715731115353)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_text=>'does not contain'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55347016369031442)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_text=>'in'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95716705735140886)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_text=>'is not in the last'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113972807669134977)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_text=>'is not in the next'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95715014261133828)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_text=>'is in the last'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113970531433132368)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_text=>'is in the next'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55319901038970318)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_text=>'is not null'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55318611989964021)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_text=>'is null'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55315230774950512)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_text=>'like'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55575725934374869)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_text=>'not in'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55316921208957189)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_text=>'not like'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91881922486369978)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_text=>'matches regular expression'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103944510909266740)
,p_name=>'APEXIR_COMPUTATION'
,p_message_text=>'Computation'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(407340830400934392)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_text=>'Computation Expression'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147625329962248695)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_text=>'Create a computation using column aliases.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147625911393252712)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_text=>'(B+C)*100'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147627415333263379)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147627925722266395)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12945676389178553)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112839504460310212)
,p_name=>'APEXIR_COMPUTE'
,p_message_text=>'Compute'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137094928706780072)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_text=>'Control Break'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141663824034727161)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_text=>'Control Breaks'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(836480851356913087)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_text=>'Control Break Columns'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9842503745744521)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_text=>'Count Distinct'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795670828787300321)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_text=>'Count Distinct'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795670015627296574)
,p_name=>'APEXIR_COUNT_X'
,p_message_text=>'Count %0'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(441141115610879450)
,p_name=>'APEXIR_DAILY'
,p_message_text=>'Daily'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1855588807632561795)
,p_name=>'APEXIR_DATA'
,p_message_text=>'Data'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138565924481466401)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_text=>'Report data as of %0 minutes ago.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4000907105477854)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_text=>'Data view of %0'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67616027671281542)
,p_name=>'APEXIR_DATE'
,p_message_text=>'Date'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147215606978132301)
,p_name=>'APEXIR_DEFAULT'
,p_message_text=>'Default'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791236602218182194)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_text=>'Default Report Type'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56831711873273118)
,p_name=>'APEXIR_DELETE'
,p_message_text=>'Delete'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(68506219426846545)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_text=>'Would you like to delete these report settings?'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(534017127084331885)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_text=>'Delete Default Report'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137089323118750054)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_text=>'Delete Report'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56122013325336209)
,p_name=>'APEXIR_DESCENDING'
,p_message_text=>'Descending'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(78495212617031609)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_text=>'Description'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131719030139954075)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_text=>'Single Row View'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147508921015650072)
,p_name=>'APEXIR_DIRECTION'
,p_message_text=>'Direction %0'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147598108042109835)
,p_name=>'APEXIR_DISABLED'
,p_message_text=>'Disabled'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56656312734235446)
,p_name=>'APEXIR_DISPLAYED'
,p_message_text=>'Displayed'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67383828160549754)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_text=>'Displayed Columns'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147473130207416178)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_text=>'Display in Report'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137171815312984248)
,p_name=>'APEXIR_DOWN'
,p_message_text=>'Down'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112840532296327706)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_text=>'Download'
,p_is_js_message=>true
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147472712199410983)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_text=>'Do Not Display'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(598352448133356281)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_text=>'Highlight with the same condition exists already.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(850282539889136958)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_text=>'Duplicate pivot column.  Pivot column list must be unique.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(852087009386397624)
,p_name=>'APEXIR_EDIT'
,p_message_text=>'Edit'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138788511555954552)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_text=>'Edit Chart Settings'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147671805140449609)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_text=>'Edit Chart'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(73032697823845162)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_text=>'Edit Control Break'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147803330766807110)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_text=>'Edit Filter'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(80662703899651306)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_text=>'Edit Flashback'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(484937605504507045)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_text=>'Edit Group By'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147802024533805297)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_text=>'Edit Highlight'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(361755122312729691)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_text=>'Edit Pivot'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(127185849178609177)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_text=>'Edit Report'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791237921527206757)
,p_name=>'APEXIR_EMAIL'
,p_message_text=>'Email'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(34366324184386201)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_text=>'Email Address'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791238708283221847)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_text=>'Bcc'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791239302873229745)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_text=>'Body'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791238427545217901)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_text=>'Cc'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791244410108279062)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_text=>'Frequency'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42642130221073470)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_text=>'Email has not been configured for this application.  Please contact your administrator.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(439500612737168830)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_text=>'Email Address must be specified.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791239620188234715)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_text=>'See attached'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791239021789225748)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_text=>'Subject'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(441505032219375986)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_text=>'Email Subject must be specified.'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791238217156214942)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_text=>'To'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55197630736647713)
,p_name=>'APEXIR_ENABLED'
,p_message_text=>'Enabled'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147759712581763946)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_text=>'Enable/Disable'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147668709942422626)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_text=>'Error! %0'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147628606460270233)
,p_name=>'APEXIR_EXAMPLES'
,p_message_text=>'Examples'
,p_version_scn=>37165770887571
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147673915445471519)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_text=>'Examples:'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67383311884544977)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_text=>'Exclude Null Values'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147837614031944113)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_text=>'Expand/Collapse'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147592430805059674)
,p_name=>'APEXIR_EXPRESSION'
,p_message_text=>'Expression'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112779026924588204)
,p_name=>'APEXIR_FILTER'
,p_message_text=>'Filter'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141662814684724381)
,p_name=>'APEXIR_FILTERS'
,p_message_text=>'Filters'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(172498722149538385)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_text=>'Filter Expression'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1555310516211929341)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_text=>'The filter expression is too long.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26664760951659383)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_text=>'Filter suggestions'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(172477830835417956)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_text=>'Filter Type'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(148054918926324007)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_text=>'Select columns to search'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112831300258280667)
,p_name=>'APEXIR_FLASHBACK'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147531823804802269)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_text=>'A flashback query allows you to view the data as it existed at a previous point in time.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(439756861331812874)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_text=>'Flashback Duration'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455229109465327136)
,p_name=>'APEXIR_FORMAT'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103943829132262564)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_text=>'Format Mask %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(136488513010850442)
,p_name=>'APEXIR_FUNCTION'
,p_message_text=>'Function'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147617626237228665)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_text=>'Functions %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791076506262625152)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_text=>'Functions / Operators'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135908803700731673)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_text=>'Function %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112701330622381179)
,p_name=>'APEXIR_GO'
,p_message_text=>'Go'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55207521349692280)
,p_name=>'APEXIR_GREEN'
,p_message_text=>'green'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(152256436395500432)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_text=>'Group By Columns'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(152256638069502082)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_text=>'Group By Functions'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9860005822095226)
,p_name=>'APEXIR_GROUP_BY'
,p_message_text=>'Group By'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791239903696239401)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_text=>'Group By Column %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(380017487297195724)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_text=>'Group by column must be specified.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(410973308525524174)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_text=>'The maximum row count for a Group By query limits the number of rows in the base query, not the number of rows displayed.  Your base query exceeds the maximum row count of %0.  Please apply a filter to reduce the number of records in your base query.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(313673121169388128)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_text=>'Group By Sort'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(836481613371929256)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_text=>'Group By Sort Order'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4000486698468354)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_text=>'Group by view of %0'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67558910890340090)
,p_name=>'APEXIR_HCOLUMN'
,p_message_text=>'Horizontal Column'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146210524183462011)
,p_name=>'APEXIR_HELP'
,p_message_text=>'Help'
,p_is_js_message=>true
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(130964403262088439)
,p_name=>'APEXIR_HELP_01'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Interactive reports enable end users to customize reports. Users can alter the layout of report data by selecting columns, applying filters, highlighting, and sorting. Users can also define breaks, aggregations, charts, group bys, and add their own c'
||'omputations. Users can also set up a subscription so that an HTML version of the report will be emailed to them at a designated interval. Users can create multiple variations of a report and save them as named reports, for either public or private vi'
||'ewing. ',
'<p/>',
'The sections that follow summarize ways you can customize an interactive report. To learn more, see "Using Interactive Reports" in <i>Oracle APEX End User''s Guide</i>.'))
,p_version_scn=>14516837
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141734006054949019)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_text=>'The Actions menu appears to the right of the Go button on the Search bar. Use this menu to customize an interactive report.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131696001255860548)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Aggregates are mathematical computations performed against a column. Aggregates display after each control break and at the end of the report within the column they are defined. Options include:',
'<p>',
'</p><ul>',
'<li><strong>Aggregation</strong> enables you to select a previously',
'defined aggregation to edit.</li>',
'<li><strong>Function</strong> is the function to be performed (for example, SUM, MIN).</li>',
'<li><strong>Column</strong> is used to select the column to apply the mathematical function to. Only numeric',
'columns display.</li>',
'</ul>'))
,p_version_scn=>37165770887573
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131698818571865576)
,p_name=>'APEXIR_HELP_CHART'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You can define one chart per saved report. Once',
'defined, you can switch between the chart and report views using view icons in the Search bar.',
'Options include:  ',
'<p>',
'</p><ul>',
'<li><strong>Chart Type</strong> identifies the chart type to include.',
'Select from horizontal bar, vertical bar, pie, or line.</li>',
'<li><strong>Label</strong> enables you to select the column to be used as the label.</li>',
'<li><strong>Axis Title for Label</strong> is the title that displays on the axis associated with the column selected for',
'Label. This is not available for pie chart.</li>',
'<li><strong>Value</strong> enables you to select the column to be used as the value.  If your function',
'is a COUNT, a Value does not need to be selected.</li>',
'<li><strong>Axis Title for Value</strong> is the title that displays on the axis associated with the column selected for',
'Value. This is not available for pie chart.</li>',
'<li><strong>Function</strong> is an optional function to be performed on the column selected for Value.</li>',
'<li><strong>Sort</strong> allows you to sort your result set.</li></ul>'))
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131687815491817393)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Clicking on any column heading exposes a column heading menu.Options include:',
'<p></p>',
'<ul>',
'<li><strong>Sort Ascending</strong> icon sorts the report by the column in ascending order.</li>',
'<li><strong>Sort Descending</strong> icon sorts the report by the column in descending order.</li>',
'<li><strong>Hide Column</strong> hides the column.  Not all columns can be hidden.  If a column cannot be hidden, there will be no Hide Column icon.</li>',
'<li><strong>Break Column</strong> creates a break group on the column.  This pulls the column out of the report as a master record.</li>',
'<li><strong>Column Information</strong> displays help text about the column, if available.</li>',
'<li><strong>Text Area</strong> is used to enter case insensitive search criteria',
'(no need for wild cards). Entering a value  reduces the list of',
'values at the bottom of the menu. You can then select a value from the',
'bottom and the selected value will be created as a filter using ''=''',
'(for example, <code>column = ''ABC''</code>). Alternatively, you can click the Flashlight icon and enter a value to be created as a filter with the ''LIKE''',
'modifier (for example, <code>column LIKE ''%ABC%''</code>).</li>',
'<li><strong>List of Unique Values</strong> contains the first 500 unique',
'values that meets your filter criteria. If the column is a date, a list of date',
'ranges is displayed instead. If you select a value, a filter will be',
'created using ''='' (for example, <code>column = ''ABC''</code>).</li>',
'</ul>'))
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131695520864856747)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enables you to add computed columns to your report. These can be mathematical computations (for example, <code>NBR_HOURS/24</code>) or standard Oracle',
'functions applied to existing columns. Some display as examples and others (such as <code>TO_DATE)</code> can also be used). Options include:',
'<p></p>',
'<ul>',
'<li><strong>Computation</strong> enables you to select a previously defined computation to edit.</li>',
'<li><strong>Column Heading</strong> is the column heading for the new column.</li>',
'<li><strong>Format Mask</strong> is an Oracle format mask to be applied against the column (for example,S9999).</li>',
'<li><strong>Computation</strong> is the computation to be performed. Within the computation, columns are referenced using the aliases displayed.</li>',
'</ul>',
'<p>Below computation, the columns in your query display with',
'their associated alias. Clicking on the column name or alias includes',
'them in the Computation. Next to Columns is a keypad. This keypad functions as',
'a shortcut to commonly used keys. On the far right are Functions.</p>',
'<p>The following  example computation demonstrates how to display total compensation:</p>',
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
'(where A is ORGANIZATION, B is SALARY and C is COMMISSION)',
''))
,p_version_scn=>14498142
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141735821638953441)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_text=>'Used to create a break group on one or several columns. This pulls the columns out of the interactive report and displays them as a master record.'
,p_version_scn=>37165770887573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131703528183887319)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_text=>'To view the details of a single row at a time, click the single row view icon on the row you wish to view. If available, the single row view will always be the first column. Depending on the customization of the interactive report, the single row vie'
||'w may be the standard view or a custom page that may allow update.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131703106712881081)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_text=>'Enables the current result set to be downloaded. The download formats include PDF, Excel, HTML, and CSV. The download options differ depending upon the selected format. All formats can also be send as E-Mail.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131690618870837323)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Focuses the report by adding or modifying the <code>WHERE</code> clause on the query. You can filter on a column or by row.  ',
'<p>If you filter by column, select a column (it does not need to',
'be one that displays), select a standard Oracle operator  (=, !=, not in, between), and enter an expression to compare against. Expressions are case sensitive. Use % as a wild card (for example, <code>STATE_NAME',
'like A%)</code>.</p>',
'<p>If you filter by row, you can create complex <code>WHERE</code> clauses using',
'column aliases and any Oracle functions or operators (for example, <code>G = ''VA'' or G = ''CT''</code>, where',
'<code>G</code> is the alias for <code>CUSTOMER_STATE</code>).</p>',
''))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131699901386870068)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A flashback query enables you to view the data as it existed at a previous point',
'in time. The default amount of time that you can flashback is 3 hours (or 180',
'minutes) but the actual amount will differ for each database.'))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455228732190324275)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Format enable you to customize the display of the report.',
'Format contains the following submenu:</p>',
'<ul><li>Sort</li>',
'<li>Control Break</li>',
'<li>Highlight</li>',
'<li>Compute</li>',
'<li>Aggregate</li>',
'<li>Chart</li>',
'<li>Group By</li>',
'<li>Pivot</li>',
'</ul>',
''))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(439318506271908041)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You can define one Group By view per saved',
'report. Once defined, you can switch between the group by and report',
'views using view icons on the Search bar. To create a Group By view,',
'you select:',
'<p></p><ul>',
'<li>the columns on which to group</li>',
'<li>the columns to aggregate along with the function to be performed (average, sum, count, etc.)</li>',
'</ul>'))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131693416923846207)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Enables you to define a filter. The rows that meet the filter criteria display as highlighted using the characteristics associated with the filter. Options include:</p>',
'<ul>',
'<li><strong>Name</strong> is used only for display.</li>',
'<li><strong>Sequence</strong> identifies the sequence in which the rules are evaluated.</li>',
'<li><strong>Enabled</strong> identifies if a rule is enabled or disabled.</li>',
'<li><strong>Highlight Type</strong> identifies whether the row or cell should be',
'highlighted. If Cell is selected, the column referenced in the',
'Highlight Condition is highlighted.</li>',
'<li><strong>Background Color</strong> is the new color for the background of the highlighted area.</li>',
'<li><strong>Text Color</strong> is the new color for the text in the highlighted area.</li>',
'<li><strong>Highlight Condition</strong>  defines your filter condition.</li>',
'</ul>',
''))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3709080100398)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You can define one Pivot view per saved report. Once defined, you can switch between the pivot and report views using view icons on the Search bar. To create a Pivot view, you select: ',
'<p></p>',
'<ul>',
'<li>the columns on which to pivot</li>',
'<li>the columns to display as rows</li>',
'<li>the columns to aggregate along with the function to be performed (average, sum, count, etc.)</li>',
'</ul>'))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147649601621344512)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If you customize an interactive report, the report settings display',
'below the Search bar and above the report. This area can be collapsed and expanded using the icon on the left.',
'<p>',
'For each report setting, you can:',
'</p><ul>',
'<li>Edit a setting by clicking the name.</li>',
'<li>Disable/Enable a setting by unchecking or checking the Enable/Disable check box. Use this control to temporarily turn a setting off and on.</li>',
'<li>Remove a setting by clicking the Remove icon.</li>',
'</ul>',
'<p>If you have created a chart, group by or pivot, you can toggle between them',
'and the base report using the Report View, Chart View, Group By View, and Pivot View',
'links shown on the right. If you are viewing the chart, group by or pivot, you',
'can also use the Edit link to edit the settings.</p>',
''))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131702530822878558)
,p_name=>'APEXIR_HELP_RESET'
,p_message_text=>'Resets the report back to the default settings, removing any customizations that you have made.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455233524965350564)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_text=>'Sets the number of records to display per page.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131701118009874893)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Saves the customized report for future use. You provide a name and optional description and can make the report accessible to the public (that is, all users who can access the primary default report). You can save four types of interactive reports'
||':</p>',
'<ul>',
'<li><strong>Primary Default</strong> (Developer Only). The Primary Default is the report that initially displays. Primary Default reports cannot be renamed or deleted.</li>',
'<li><strong>Alternative Report</strong> (Developer Only). Enables developers to create multiple report layouts. Only developers can save, rename, or delete an Alternative Report.</li>',
'<li><strong>Public Report</strong> (End user). Can be saved, renamed, or deleted by the end user who created it. Other users can view and save the layout as another report.</li>',
'<li><strong>Private Report</strong> (End user). Only the end user that created the report can view, save, rename or delete the report.</li>',
'</ul>',
'<p>If you save customized reports, a Reports selector displays in the Search bar to the left of the Rows selector (if this feature is enabled).</p>',
''))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131667531291812479)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_text=>'At the top of each report page is a search region. This region (or Search bar) provides the following features:'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455263831890702599)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_text=>'<li><strong>Actions Menu</strong> enables you to customize a report. See the sections that follow.</li>'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455259726471634782)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_text=>'<li><strong>Select columns icon</strong> enables you to identify which column to search (or all).</li>'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455262302885675316)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_text=>'<li><strong>Reports</strong> displays alternate default and saved private or public reports.</li>'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455261511758668398)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_text=>'<li><strong>Rows</strong> sets the number of records to display per page.</li>'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455260708510657991)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li><strong>Text area</strong> enables you to enter case insensitive search criteria (wild card characters are implied).</li>',
'<li><strong>Go button</strong> executes the search. Hitting the enter key will also execute the search when the cursor is in the search text area.</li>'))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455263104186694622)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_text=>'<li><strong>View Icons</strong> switches between the icon, report, detail, chart, group by, and pivot views of the report if they are defined.</li>'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131688617354827372)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_text=>'Used to modify the columns displayed. The columns on the right display. The columns on the left are hidden. You can reorder the displayed columns using the arrows on the far right. Computed columns are prefixed with <strong>**</strong>.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131692103418842252)
,p_name=>'APEXIR_HELP_SORT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Used to change the columns to sort on and determines whether',
'to sort in ascending or descending order. You can also specify how to handle',
'<code>NULLs</code>. The default setting always displays <code>NULLs</code> last or always display them first. The resulting sorting displays to the right of',
'column headings in the report.</p>'))
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(437452923093001825)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_text=>'When you add a subscription, you provide an email address (or multiple email addresses, separated by commas), email subject, frequency, and start and end dates. The resulting emails include an exported version (PDF, Excel, HTML, or CSV) of the intera'
||'ctive report containing the current data using the report setting that were present when the subscription was added.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138526725679353196)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_text=>'Hide Column'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112781308963611447)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_text=>'Highlight'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141664631999729465)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_text=>'Highlights'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(76453226015958118)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_text=>'Highlight Cell, %0 on %1'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147663027641380433)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_text=>'Highlight Condition'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(76453032663953637)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_text=>'Highlight Row, %0 on %1'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(439756288559810936)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_text=>'Highlight Style'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55201524765664909)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_text=>'Highlight Type'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(644585798428384246)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_text=>'Horizontal'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1434157528684349547)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_text=>'1 inactive setting'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1434160909460351386)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_text=>'%0 inactive settings'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131723308415004602)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_text=>'Interactive Report Help'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147808904279837268)
,p_name=>'APEXIR_INVALID'
,p_message_text=>'Invalid'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690204252825678)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_text=>'Invalid computation expression. %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(36983722382078745)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_text=>'The end date must be greater than the start date.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(200610302445165579)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_text=>'Invalid filter expression. %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795662420850175011)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_text=>'Invalid filter query'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1434161121899354201)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_text=>'1 invalid setting'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1434161384116357458)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_text=>'%0 invalid settings'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(439757083850813941)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_text=>'(in minutes)'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(623902023969626495)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_text=>'%0 is in the last %1'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(623902618213634271)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_text=>'%0 is in the next %1'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(623902405746630690)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_text=>'%0 is not in the last %1'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(623902800683638663)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_text=>'%0 is not in the next %1'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147616816887225917)
,p_name=>'APEXIR_KEYPAD'
,p_message_text=>'Keypad'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67561417732360999)
,p_name=>'APEXIR_LABEL'
,p_message_text=>'Label %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137371525551876586)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_text=>'Axis Title for Label'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114474904691269411)
,p_name=>'APEXIR_LAST_DAY'
,p_message_text=>'Last Day'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114476515081272362)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_text=>'Last Hour'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114472015642263093)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_text=>'Last Month'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114473427763266591)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_text=>'Last Week'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114474432611268023)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_text=>'Last %0 Days'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114475410579271098)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_text=>'Last %0 Hours'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114471107331260713)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_text=>'Last %0 Years'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114471711833261987)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_text=>'Last Year'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67560421064352551)
,p_name=>'APEXIR_LINE'
,p_message_text=>'Line'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(57043572533656352)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_text=>'Line with Area'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795660918033145841)
,p_name=>'APEXIR_MAP_IT'
,p_message_text=>'Map it'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138834724555071853)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_text=>'The query is estimated to exceed the maximum allowed resources.  Please modify your report settings and try again.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95467716029550046)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_text=>'The maximum row count for this report is %0 rows.  Please apply a filter to reduce the number of records in your query.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795668910301285509)
,p_name=>'APEXIR_MAX_X'
,p_message_text=>'Maximum %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795669602121292668)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_text=>'Median %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3500432351370233)
,p_name=>'APEXIR_MESSAGE'
,p_message_text=>'Message'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103942907530246790)
,p_name=>'APEXIR_MIN_AGO'
,p_message_text=>'%0 minutes ago'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795669223807289397)
,p_name=>'APEXIR_MIN_X'
,p_message_text=>'Minimum %0'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791245908423306957)
,p_name=>'APEXIR_MONTH'
,p_message_text=>'Month'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(441141931540884022)
,p_name=>'APEXIR_MONTHLY'
,p_message_text=>'Monthly'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137160608817963523)
,p_name=>'APEXIR_MOVE'
,p_message_text=>'Move'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137158424962958699)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_text=>'Move All'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1814992979737063426)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_text=>'Region Static ID must be specified as the page contains multiple interactive reports.'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56650124284172631)
,p_name=>'APEXIR_NAME'
,p_message_text=>'Name'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(127136721432879938)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_text=>'New Aggregation'
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1449450948451022801)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_text=>'New Category'
,p_is_js_message=>true
,p_version_scn=>37165770887574
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(127162803012044820)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_text=>'New Computation'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112094425805089540)
,p_name=>'APEXIR_NEXT'
,p_message_text=>'Next'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114523712843385305)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_text=>'Next Day'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114522924141379109)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_text=>'Next Hour'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114525726349389122)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_text=>'Next Month'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114525222886388123)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_text=>'Next Week'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114524217345386569)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_text=>'Next %0 Days'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114523302801382365)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_text=>'Next %0 Hours'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114526802932391838)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_text=>'Next %0 Years'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114526430851390461)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_text=>'Next Year'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56652429741193065)
,p_name=>'APEXIR_NO'
,p_message_text=>'No'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147972914153227972)
,p_name=>'APEXIR_NONE'
,p_message_text=>'- None -'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(439501418371227297)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_text=>'Not a valid email address.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3784412128308587)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_text=>'No columns selected for display. Use <strong>Columns</strong> in the Actions Menu to make columns visible.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147220931004148710)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_text=>'Nulls Always First'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147220017152144693)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_text=>'Nulls Always Last'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147509831751653133)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_text=>'Null Sorting %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691231956833720)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_text=>'Flashback time must be numeric.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683620351792506)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_text=>'Sequence must be numeric.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147591500330050899)
,p_name=>'APEXIR_OPERATOR'
,p_message_text=>'Operator'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55210215939700214)
,p_name=>'APEXIR_ORANGE'
,p_message_text=>'orange'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(644585489247382981)
,p_name=>'APEXIR_ORIENTATION'
,p_message_text=>'Orientation'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56656925201239065)
,p_name=>'APEXIR_OTHER'
,p_message_text=>'Other'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3900295717447743)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_text=>'Pagination of %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12300619912333654)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_text=>'Page orientation'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12302042417345947)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_text=>'Landscape'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12302215542347899)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_text=>'Portrait'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12300477886328975)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_text=>'Page size'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12301691194341441)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_text=>'A3'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12301499905340758)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_text=>'A4'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12301836469342184)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_text=>'Custom'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12301050523337692)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_text=>'Legal'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12300867224336744)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_text=>'Letter'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12301285214339455)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_text=>'Tabloid'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795672626194337461)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_text=>'Percent of Total Count %0 (%)'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795667731033263167)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_text=>'Percent of Total Sum %0 (%)'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791240727723255853)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_text=>'Percent of Total Count'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791240413524251729)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_text=>'Percent of Total Sum'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67559907558348614)
,p_name=>'APEXIR_PIE'
,p_message_text=>'Pie'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(360238408574247355)
,p_name=>'APEXIR_PIVOT'
,p_message_text=>'Pivot'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(366500324290417815)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_text=>'Aggregate must be specified.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(366591528781035116)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_text=>'You cannot aggregate on a column selected to as row column.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(361758832404044016)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_text=>'Pivot Columns'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(361758108718009471)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_text=>'Pivot Column %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(366499912010408276)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_text=>'Pivot column must be specified.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3709046862403)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_text=>'The maximum row count for a Pivot query limits the number of rows in the base query, not the number of rows displayed. Your base query exceeds the maximum row count of %0. Please apply a filter to reduce the number of records in your base query.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(362417721074029905)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_text=>'Pivot Sort'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142902197121174634)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_text=>'The pivot column contains too many distinct values - pivot SQL cannot be generated.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4000616312475426)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_text=>'Pivot view of %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(439756065431809723)
,p_name=>'APEXIR_PREVIEW'
,p_message_text=>'Preview'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112095619010097072)
,p_name=>'APEXIR_PREVIOUS'
,p_message_text=>'Previous'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791237121611187781)
,p_name=>'APEXIR_PRIMARY'
,p_message_text=>'Primary'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(445581803499127121)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_text=>'Primary Report'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12202340445134269)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_text=>'Include Accessibility Tags'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1872082176321259)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_text=>'Strip Rich Text'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(194290521142235310)
,p_name=>'APEXIR_PRIVATE'
,p_message_text=>'Private'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(68505405658823689)
,p_name=>'APEXIR_PUBLIC'
,p_message_text=>'Public'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56654520784218910)
,p_name=>'APEXIR_RED'
,p_message_text=>'red'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1814041034484189894)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_text=>'Region Static ID %0 does not exist.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137162923708967814)
,p_name=>'APEXIR_REMOVE'
,p_message_text=>'Remove'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137164602368971139)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_text=>'Remove All'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1439341109260914002)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_text=>'Remove Chart'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137097107713783419)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_text=>'Remove Control Break'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137092404118772937)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_text=>'Remove Filter'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137093720049777547)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_text=>'Remove Flashback'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1439341335284915353)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_text=>'Remove Group By'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137099619141786761)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_text=>'Remove Highlight'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1439341547929916455)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_text=>'Remove Pivot'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(852087688948430845)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_text=>'Remove Report'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(534016888377327986)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_text=>'Rename Default Report'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(148144209023756291)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_text=>'Rename Report'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112497021853120340)
,p_name=>'APEXIR_REPORT'
,p_message_text=>'Report'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795702629414470790)
,p_name=>'APEXIR_REPORTS'
,p_message_text=>'Reports'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(46131720626808988)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_text=>'Saved Interactive report with alias %0 does not exist.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(196185902703753597)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_text=>'Report does not exist.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(46132519503827597)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_text=>'Saved Interactive Report ID %0 does not exist.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147647815342339094)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_text=>'Report Settings'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3700218569428586)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_text=>'Report settings of %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103965629374830199)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_text=>'Report View'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112841515458332370)
,p_name=>'APEXIR_RESET'
,p_message_text=>'Reset'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(68506600164850479)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_text=>'Restore report to the default settings.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56652902298204065)
,p_name=>'APEXIR_ROW'
,p_message_text=>'Row'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(725960179332697988)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_text=>'You cannot use ROWID as the primary key column for a REST Data Source.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135895305179757408)
,p_name=>'APEXIR_ROWS'
,p_message_text=>'Rows'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455232615614347868)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_text=>'Rows Per Page'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(361759030032045199)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_text=>'Row Columns'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(361758532644013524)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_text=>'Row Column %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(366500103815412125)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_text=>'Row column must be specified.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(366504631154460221)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_text=>'Row column must be different from the pivot column.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(173216916488413272)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_text=>'Row Filter'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103966601932841254)
,p_name=>'APEXIR_ROW_OF'
,p_message_text=>'Row %0 of %1'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113961216280109095)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_text=>'Row text contains'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56101209095079534)
,p_name=>'APEXIR_SAVE'
,p_message_text=>'Save'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141689831054785956)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_text=>'Saved Report'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141682911183770705)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_text=>'Saved Report = "%0"'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146830000933477072)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_text=>'The current report settings will be used as the default for all users.'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(534016447676323851)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_text=>'Save Default Report'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112841113034331594)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_text=>'Save Report'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1449443983164984240)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_text=>'Save Report *'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(460374318700654079)
,p_name=>'APEXIR_SEARCH'
,p_message_text=>'Search'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(131720913910977792)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_text=>'Search Bar'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3600245668394978)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_text=>'Search bar of %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1449340263744712896)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_text=>'Search: %0'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(492798114569932891)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_text=>'Search Report'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(409023115536157236)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_text=>'Selected Columns'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(57104706042725473)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_text=>'- Select Column -'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112703531792390987)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_text=>'Select Columns'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67617018583297858)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_text=>'- Select Function -'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135797015806772068)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_text=>'- Select Group By Column -'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(361757521023988575)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_text=>'- Select Pivot Column -'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795664920120222174)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_text=>'Select Row'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(361757700751998009)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_text=>'- Select Row Column -'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2196506871436097)
,p_name=>'APEXIR_SEND'
,p_message_text=>'Send'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6902795654807357)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_text=>'Send as Email'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56650811256178248)
,p_name=>'APEXIR_SEQUENCE'
,p_message_text=>'Sequence'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112779923939596837)
,p_name=>'APEXIR_SORT'
,p_message_text=>'Sort'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138523507887338609)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_text=>'Sort Ascending'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(138523913428340129)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_text=>'Sort Descending'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(836480296247905181)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_text=>'Sort Order'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(124738716035796307)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_text=>'space'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147597529382106599)
,p_name=>'APEXIR_STATUS'
,p_message_text=>'Status %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(441137300017799287)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_text=>'Subscription'
,p_is_js_message=>true
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791244906214296868)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_text=>'Ending'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1702889242491923)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_text=>'Skip if No Data Found'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791244608161287957)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_text=>'Starting From'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(795668307400275243)
,p_name=>'APEXIR_SUM_X'
,p_message_text=>'Sum %0'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(626810603993712970)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_text=>'%0, Report = %1, View = %2'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55268503144847900)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_text=>'Text Color'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95728903619187590)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_text=>'days'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95727930500185877)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_text=>'hours'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95727122881183611)
,p_name=>'APEXIR_TIME_MINS'
,p_message_text=>'minutes'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95730313316190320)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_text=>'months'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95729808814189019)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_text=>'weeks'
,p_version_scn=>37165770887597
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95730717818191682)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_text=>'years'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(851779236477083158)
,p_name=>'APEXIR_TOGGLE'
,p_message_text=>'Toggle'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137167318991975849)
,p_name=>'APEXIR_TOP'
,p_message_text=>'Top'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(699333651185299950)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_text=>'Ungrouped Column'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681700134777222)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_text=>'Highlight Name must be unique.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67350725400574412)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_text=>'unsupported data type'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137170002499980609)
,p_name=>'APEXIR_UP'
,p_message_text=>'Up'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686812994809325)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_text=>'Please enter a valid color.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689522129821437)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_text=>'Please enter a valid format mask.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56658211480244598)
,p_name=>'APEXIR_VALUE'
,p_message_text=>'Value'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137466309293023209)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_text=>'Axis Title for Value'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147808432198835895)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_text=>'Value Required'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67559429591345531)
,p_name=>'APEXIR_VCOLUMN'
,p_message_text=>'Vertical Column'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(644586007014385311)
,p_name=>'APEXIR_VERTICAL'
,p_message_text=>'Vertical'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147670212282442216)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_text=>'View Chart'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(485065818549403011)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_text=>'View Detail'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1498167500367864995)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_text=>'The report does not have %0 view defined.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(485066109330409776)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_text=>'View Group By'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(485064019110393670)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_text=>'View Icons'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(361753203367902719)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_text=>'View Pivot'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147671024402445694)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_text=>'View Report'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(441141623921881832)
,p_name=>'APEXIR_WEEKLY'
,p_message_text=>'Weekly'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112496631765113761)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_text=>'Working Report'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(803507520899051384)
,p_name=>'APEXIR_X_DAYS'
,p_message_text=>'%0 days'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(803507212588048887)
,p_name=>'APEXIR_X_HOURS'
,p_message_text=>'%0 hours'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(803506901853045812)
,p_name=>'APEXIR_X_MINS'
,p_message_text=>'%0 minutes'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(803508213758058782)
,p_name=>'APEXIR_X_MONTHS'
,p_message_text=>'%0 months'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(803507730942054276)
,p_name=>'APEXIR_X_WEEKS'
,p_message_text=>'%0 weeks'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(803508418953060256)
,p_name=>'APEXIR_X_YEARS'
,p_message_text=>'%0 years'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(791246119158310074)
,p_name=>'APEXIR_YEAR'
,p_message_text=>'Year'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55206607150688197)
,p_name=>'APEXIR_YELLOW'
,p_message_text=>'yellow'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(56651405499186098)
,p_name=>'APEXIR_YES'
,p_message_text=>'Yes'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137286321156741732)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_text=>'%0 contains < or > which are invalid characters.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(256665332220204438)
,p_name=>'APEX_REGION'
,p_message_text=>'Region'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2031115526760063)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_text=>'Unable to extract ZIP file.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2030356074675888)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_text=>'End-of-central-directory signature not found. This file is not a ZIP file.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11992502511417241)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_text=>'API precondition violated'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63070357422745898)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_text=>'Cannot get value for Application Setting %0 as associated build option is disabled.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63070149280740789)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_text=>'Cannot set value for Application Setting %0 as associated build option is disabled.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(682004241434672463)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_text=>'Application Setting %0 value is invalid'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(682003942724667459)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_text=>'Requested Application Setting %0 is not defined'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(682005515172679271)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_text=>'Application Setting %0 may not be set to a null value'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25708712654726011)
,p_name=>'BACK'
,p_message_text=>'Back'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4659903166223659)
,p_name=>'BUILDER'
,p_message_text=>'Builder'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(166095209076019858)
,p_name=>'BUTTON LABEL'
,p_message_text=>'Button Label'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4014216900444054)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_text=>'Button CSS Classes'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(77390125296098295)
,p_name=>'BUTTON_ID'
,p_message_text=>'Generated button ID will be either the button''s Static ID if defined, or if not will be an internally generated ID in the format ''B'' || [Internal Button ID]'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1814930124326252)
,p_name=>'CANDLESTICK'
,p_message_text=>'Candlestick'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(251505106698531708)
,p_name=>'CENTER'
,p_message_text=>'Center'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60161303637564471)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_text=>'%0 Request'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(36719205200406055)
,p_name=>'CHECK$'
,p_message_text=>'row selector'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(708579510672261953)
,p_name=>'CHECKED'
,p_message_text=>'checked'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(437388811254118533)
,p_name=>'COLUMN'
,p_message_text=>'Column'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(202523216319760295)
,p_name=>'COMMENTS'
,p_message_text=>'Comments'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(134758916493975573)
,p_name=>'CONTINUE'
,p_message_text=>'Continue'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26569212233264608)
,p_name=>'COPYRIGHT'
,p_message_text=>'Copyright &copy; 1999, %0, Oracle and/or its affiliates.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145295017371075684)
,p_name=>'COUNT'
,p_message_text=>'Count'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(162758813552367449)
,p_name=>'CREATE'
,p_message_text=>'Create'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(484706413411088670)
,p_name=>'CREATED'
,p_message_text=>'Created'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(484706618952090281)
,p_name=>'CREATED_BY'
,p_message_text=>'Created By'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103917813250886146)
,p_name=>'CREATED_ON'
,p_message_text=>'Created On'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135121023330680609)
,p_name=>'CUSTOM'
,p_message_text=>'Custom'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(148956105885348850)
,p_name=>'CUSTOMIZE'
,p_message_text=>'Customize'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(167528920006287142)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_text=>'Page preferences reset for user %0.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(167529313903294802)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_text=>'Preferences changed for user %0.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(167528513988275909)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_text=>'Page preferences reset for user %0.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(73695111722854518)
,p_name=>'DAILY'
,p_message_text=>'Daily'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4334623025332221)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_text=>'Uploaded file is invalid or has wrong extension.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60420631021025987)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_text=>'Invalid XML or JSON selector used.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002768632617036)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_text=>'Data profile and uploaded file do not contain any target table column.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(273683682253831497)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_text=>'No data found in uploaded file.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(273683824387836303)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_text=>'No data found in worksheet "%0".'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3851391954261787)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_text=>'The specified file is not an XLSX file.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1499951996584323)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_text=>'Data loading finished: %0 rows processed.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1509976855650044)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_text=>'Data loading finished: %0 rows processed with 1 error.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1510291187664018)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_text=>'Data loading finished: %0 rows processed with %1 errors.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1510093925662759)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_text=>'Data loading finished: 1 row processed.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2017578147676342)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_text=>'Data loading finished: 1 row processed with error.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1510110919663253)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_text=>'Data loading finished: 1 row processed without error.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(344315230805508403)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_text=>'Target Column'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7202255818839107)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_text=>'Do Not Load'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7202427991837548)
,p_name=>'DATA_LOAD.FAILED'
,p_message_text=>'Preprocessing error'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(344430615245351315)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_text=>'Source Column'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(352891732192239287)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_text=>'Date / Number Format'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7201824675842325)
,p_name=>'DATA_LOAD.INSERT'
,p_message_text=>'Insert row'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1030462914427048454)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_text=>'Failed to retrieve the lookup value.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(485618016749158110)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_text=>'Data / Table Mapping'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(353255717665386559)
,p_name=>'DATA_LOAD.ROW'
,p_message_text=>'Row'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7202622429836344)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_text=>'Sequence : Action'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(276493223165623868)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_text=>'The transformation rule failed'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7202081974841185)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_text=>'Update row'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145135220301612869)
,p_name=>'DATE'
,p_message_text=>'Date'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87998701979211749)
,p_name=>'DAY'
,p_message_text=>'day'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87999105096212650)
,p_name=>'DAYS'
,p_message_text=>'days'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(198604901502478591)
,p_name=>'DEBUGGING_OFF'
,p_message_text=>'Debugging is not enabled for this application.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(500511875559724119)
,p_name=>'DEFAULT'
,p_message_text=>'Default'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88056620604661839)
,p_name=>'DELETE'
,p_message_text=>'delete'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21614331722420760)
,p_name=>'DELETE_MSG'
,p_message_text=>'Would you like to perform this delete action?'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3800611755350878)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_text=>'Session Overrides'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3901849498518217)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_text=>'Enable Session Overrides'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4000398475649065)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_text=>'There was an error when loading session overrides.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4000264690649064)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_text=>'There was an error when saving session overrides.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4000182644649064)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_text=>'Session overrides saved. Close this dialog to see changes.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1814327920326252)
,p_name=>'DIAL_PCT'
,p_message_text=>'Dial (Percent)'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12363527035828372)
,p_name=>'DOWNLOAD'
,p_message_text=>'Download'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(487075712102088261)
,p_name=>'DUP_USER'
,p_message_text=>'Duplicate Username within list.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26824420525183413)
,p_name=>'EDIT'
,p_message_text=>'Edit'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60160128393533808)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_text=>'Email address "%0" was not found.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(18310020176542314)
,p_name=>'EMAIL_SENT_BY'
,p_message_text=>'This email sent by %0.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(487076420890100228)
,p_name=>'EMAIL_TOO_LONG'
,p_message_text=>'Email Address is too long.  The limit is 240 characters.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(133640811552207318)
,p_name=>'ERROR'
,p_message_text=>'Error'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(277570623146201861)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_text=>'Unable to set page item source value for partial page refresh region'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(108651212594587181)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_text=>'Created By'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19164605018620778)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_text=>'Password Expired'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8773431671668311)
,p_name=>'FILE_EMPTY'
,p_message_text=>'The file is empty.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(314431408852809718)
,p_name=>'FILE_TOO_LARGE'
,p_message_text=>'The size of the uploaded file was over %0 MB. Please upload a smaller file.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21798730141180674)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_text=>'User authentication failed and one or more files were not uploaded.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21799111917184924)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_text=>'This instance does not allow unauthenticated users to upload files.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(315034269542971131)
,p_name=>'FILTERS'
,p_message_text=>'Filters'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(163300503656516489)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_text=>'1 error has occurred'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(152450220776607209)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_text=>'%0 errors have occurred'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26443419609348986)
,p_name=>'FORM_OF'
,p_message_text=>'%0 of %1'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(115167131621746086)
,p_name=>'GO'
,p_message_text=>'Go'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1015317514152959207)
,p_name=>'HELP'
,p_message_text=>'Help'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4660510092225697)
,p_name=>'HOME'
,p_message_text=>'Home'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87997925051208938)
,p_name=>'HOUR'
,p_message_text=>'hour'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87998329206210072)
,p_name=>'HOURS'
,p_message_text=>'hours'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(36685910742707444)
,p_name=>'ICON'
,p_message_text=>'Icon %0'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4173381445323698)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_text=>'Crop Icon Help'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4373182145327694)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Drag your icon and use the zoom slider to reposition it within the frame.</p>',
'',
'<p>When uploading a new icon it will be resized to fit three formats: favicon, small and large icon.</p>',
'',
'<p>When focused on the icon cropper, the following keyboard shortcuts are available:</p>',
'<ul>',
'    <li>Left Arrow: Move image left*</li>',
'    <li>Up Arrow: Move image up*</li>',
'    <li>Right Arrow: Move image right*</li>',
'    <li>Down Arrow: Move image down*</li>',
'    <li>I: Zoom in</li>',
'    <li>O: Zoom out</li>',
'    <li>L: Rotate left</li>',
'    <li>R: Rotate right</li>',
'</ul>',
'',
'<p class="margin-top-md"><em>*Hold Shift to move faster</em></p>'))
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7646333875131848)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_text=>'Drag to reposition icon'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7646476191131862)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_text=>'Move slider to adjust zoom level'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4073145312296188)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_text=>'Edit Application Icon'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4173566560324870)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_text=>'Error saving icon'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(216114029087060466)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_text=>'<p><span class="a-Icon icon-tr-warning"></span> This application uses legacy icons. Uploading a new icon will replace all legacy icons.</p>'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4273116356325848)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_text=>'Upload a new icon'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(167970226756039419)
,p_name=>'INVALID_CREDENTIALS'
,p_message_text=>'Invalid Login Credentials'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1787331672043173004)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_text=>'Invalid value for parameter: %0'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147514129373680812)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_text=>'As Default Report Settings'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147514502839682652)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_text=>'As Named Report'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103967323450875850)
,p_name=>'IR_ERROR'
,p_message_text=>'%0 error. %1'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103964725088819545)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_text=>'Unable to calculate form navigation. %0'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(46834614096530358)
,p_name=>'IR_NOT_FOUND'
,p_message_text=>'Interactive report not found.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(43334927847770645)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_text=>'Interactive report region does not exist in application %0, page %1 and region %2.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147511511019675540)
,p_name=>'IR_STAR'
,p_message_text=>'Only displayed for developers'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114638314144754589)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_text=>'The report query needs a unique key to identify each row.  The supplied key cannot be used for this query.  Please define a unique key column. %0'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114638703193760922)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_text=>'The report query needs a unique key to identify each row.  The supplied key cannot be used for this query.  Please edit the report attributes to define a unique key column. %0'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(353294124784946440)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_text=>'Choose File'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(353293940964945183)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_text=>'Drag and drop file here or'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26574728687307265)
,p_name=>'ITEMS'
,p_message_text=>'Items'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(109288421211327018)
,p_name=>'ITEM_VALUE'
,p_message_text=>'Item Value'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145817803564800313)
,p_name=>'LABEL'
,p_message_text=>'Label'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(197701028451905341)
,p_name=>'LANGUAGE'
,p_message_text=>'Language'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88021328270342361)
,p_name=>'LAST'
,p_message_text=>'last'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21688225673892504)
,p_name=>'LENGTH'
,p_message_text=>'Length'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(165061401695804027)
,p_name=>'LOGIN'
,p_message_text=>'Login'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(424726319350851975)
,p_name=>'MANAGE'
,p_message_text=>'Manage'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2270980516983254550)
,p_name=>'MAXIMIZE'
,p_message_text=>'Maximize'
,p_is_js_message=>true
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87997116047206349)
,p_name=>'MINUTE'
,p_message_text=>'minute'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87997520895207713)
,p_name=>'MINUTES'
,p_message_text=>'minutes'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(487079123792110595)
,p_name=>'MISSING_AT'
,p_message_text=>'Missing "@" in Email Address.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(488389129103564725)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_text=>'Warning: No Dialog Page template has been defined for Dialog page %0 in application %1.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(487076807515105828)
,p_name=>'MISSING_DOT'
,p_message_text=>'Missing "." in Email Address domain.'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184003123459633281)
,p_name=>'MODULE'
,p_message_text=>'Module'
,p_version_scn=>37165770887598
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(61687704055574299)
,p_name=>'MONTH'
,p_message_text=>'Month'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(73691217132846622)
,p_name=>'MONTHLY'
,p_message_text=>'Monthly'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63050751276249309)
,p_name=>'MONTHS'
,p_message_text=>'months'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145294506982072758)
,p_name=>'MOVE'
,p_message_text=>'Move'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(586892827837430559)
,p_name=>'MOVE_FROM'
,p_message_text=>'Move from'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(586896829915431226)
,p_name=>'MOVE_TO'
,p_message_text=>'Move to'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112130504582426465)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_text=>'Error in multi row delete operation: row= %0, %1, %2'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(109855506488052938)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_text=>'Must Not Be Public User'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4803109192360849)
,p_name=>'NAME'
,p_message_text=>'Name'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145558705849365726)
,p_name=>'NEW'
,p_message_text=>'New'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60533628083626283)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_text=>'You can log in to %0 by going to:'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60534030638636489)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_text=>'New %0 Account Notification'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1030083240051714916)
,p_name=>'NEXT'
,p_message_text=>'Next'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(183818625885583880)
,p_name=>'NO'
,p_message_text=>'No'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1498904290397847056)
,p_name=>'NOBODY'
,p_message_text=>'nobody'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88105708249216517)
,p_name=>'NOT'
,p_message_text=>'Not'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(240761512642416333)
,p_name=>'NOT_NULL'
,p_message_text=>'Not Null'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110932107279054212)
,p_name=>'NOT_W_ARGUMENT'
,p_message_text=>'Not %0'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(150522716167736630)
,p_name=>'NO_DATA_FOUND'
,p_message_text=>'no data found'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(233907228296414141)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_text=>'No updateable report found. Multi row updated and delete operations can only be performed on tabular forms of type ''Updateable Report''.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(244740229345303095)
,p_name=>'OK'
,p_message_text=>'OK'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(192629730473838596)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_text=>'Oracle APEX'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2043794796131964374)
,p_name=>'ORA_06550'
,p_message_text=>'ORA-06550: line %0, column %1'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(472583518462698501)
,p_name=>'OUTDATED_BROWSER'
,p_message_text=>'You are using an outdated web browser. For a list of supported browsers, please reference the Oracle APEX Installation Guide.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(39735323071214364)
,p_name=>'OUT_OF_RANGE'
,p_message_text=>'Invalid set of rows requested, the source data of the report has been modified.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(93323015704414120)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_text=>'A valid page number must be specified, for example p?n=1234.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102045308267675215)
,p_name=>'PAGINATION.NEXT'
,p_message_text=>'Next'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102045712769676494)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_text=>'Next Set'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102046116578677651)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_text=>'Previous'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102046721427679006)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_text=>'Previous Set'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1029550928382834867)
,p_name=>'PAGINATION.SELECT'
,p_message_text=>'Select Pagination'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(270675214359320332)
,p_name=>'PASSWORD'
,p_message_text=>'Password'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60159707268527732)
,p_name=>'PASSWORD_CHANGED'
,p_message_text=>'Your password for %0 has been changed.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25620017217886184)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_text=>'Password does not conform to this site''s password complexity rules.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25510823855241766)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_text=>'New password must differ from old password by at least %0 characters.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25513230912253210)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_text=>'Password must not contain username.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25514019961259582)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_text=>'Password contains a prohibited simple word.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25513604724255167)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_text=>'Password must not contain workspace name.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25510416966192448)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_text=>'Password must contain at least %0 characters.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25511230781243730)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_text=>'Password must contain at least one alphabetic character (%0).'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25512824678251451)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_text=>'Password must contain at least one lower-case alphabetic character.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25511604246245532)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_text=>'Password must contain at least one numeric character (0123456789).'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25512011519247602)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_text=>'Password must contain at least one punctuation character (%0).'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25512417752249481)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_text=>'Password must contain at least one upper-case alphabetic character.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60532511020564521)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_text=>'Password Reset Notification'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21799320575187370)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_text=>'The password may not be used because it has been used within the past %0 days.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(14939750408654878)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_text=>'Percent Graph'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(380853058222067227)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_text=>'Items'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(380853145555067227)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_text=>'Item'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(192599307018188404)
,p_name=>'PERCENT'
,p_message_text=>'Percent'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100934031859852611)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_text=>'Please contact the administrator.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1030083510279715838)
,p_name=>'PREVIOUS'
,p_message_text=>'Previous'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(336668829865779986)
,p_name=>'PRINT'
,p_message_text=>'Print'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184183409633256585)
,p_name=>'PRIVILEGES'
,p_message_text=>'Privileges'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95293116741001523)
,p_name=>'REGIOIN_REFERENCES'
,p_message_text=>'Region References'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145814227198788241)
,p_name=>'REPORT'
,p_message_text=>'Report'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184028320267077049)
,p_name=>'REPORTING_PERIOD'
,p_message_text=>'Reporting Period'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1034312330043206878)
,p_name=>'REPORT_LABEL'
,p_message_text=>'Report: %0'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(185478304430531142)
,p_name=>'REPORT_TOTAL'
,p_message_text=>'Report Total'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(39735727226215544)
,p_name=>'RESET'
,p_message_text=>'Reset Pagination'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(109149025961173243)
,p_name=>'RESET_PAGINATION'
,p_message_text=>'Reset Pagination'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(232289201886136749)
,p_name=>'RESET_PASSWORD'
,p_message_text=>'Reset Password'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(123100817958039519)
,p_name=>'RESTORE'
,p_message_text=>'Restore'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(277626629117534782)
,p_name=>'RESULTS'
,p_message_text=>'Results'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(244742808006306377)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_text=>'Return to application.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(251504804274531000)
,p_name=>'RIGHT'
,p_message_text=>'Right'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(427837312318884712)
,p_name=>'ROW'
,p_message_text=>'Row %0'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145283331429994619)
,p_name=>'ROW_COUNT'
,p_message_text=>'Row Count'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1414431729040858)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_text=>'Ask Oracle'
,p_is_js_message=>true
,p_version_scn=>173232788
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1414808127035188)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_text=>'Close Ask Oracle'
,p_is_js_message=>true
,p_version_scn=>173233133
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1415497393027483)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_text=>'Notifications List'
,p_is_js_message=>true
,p_version_scn=>173233394
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1414655060037417)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_text=>'Open Ask Oracle'
,p_is_js_message=>true
,p_version_scn=>173233063
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1415246507030333)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_text=>'Product Map'
,p_is_js_message=>true
,p_version_scn=>173233369
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1415046252032223)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_text=>'Suggestions List'
,p_is_js_message=>true
,p_version_scn=>173233177
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1417045779968660)
,p_name=>'RW_CLEAR'
,p_message_text=>'Clear'
,p_is_js_message=>true
,p_version_scn=>173247168
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1416856594971464)
,p_name=>'RW_CLOSE'
,p_message_text=>'Close'
,p_is_js_message=>true
,p_version_scn=>173247128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1416267569016589)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_text=>'View More'
,p_is_js_message=>true
,p_version_scn=>173233699
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1417254626965858)
,p_name=>'RW_GO_TO'
,p_message_text=>'Go to'
,p_is_js_message=>true
,p_version_scn=>173247218
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1415806608022158)
,p_name=>'RW_GP_STEP'
,p_message_text=>'Step'
,p_version_scn=>173233523
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1416029139020232)
,p_name=>'RW_GP_STEP_OF'
,p_message_text=>'of'
,p_version_scn=>173233564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1415683077024207)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_text=>'Toggle display of steps'
,p_version_scn=>173233498
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1414271871043162)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_text=>'Hide Password'
,p_is_js_message=>true
,p_version_scn=>173232761
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1416657199972545)
,p_name=>'RW_OPEN'
,p_message_text=>'Open'
,p_is_js_message=>true
,p_version_scn=>173247053
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1413859500057177)
,p_name=>'RW_ORACLE'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>173232262
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1414066933047632)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_text=>'Show Password'
,p_is_js_message=>true
,p_version_scn=>173232485
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1417409768963513)
,p_name=>'RW_START'
,p_message_text=>'Start'
,p_is_js_message=>true
,p_version_scn=>173247581
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(236801501681326563)
,p_name=>'SAVE'
,p_message_text=>'Save'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(195134510896077701)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_text=>'Alternative Default'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(197331103874573727)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_text=>'Description'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(195134208125076823)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_text=>'Primary Default'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(199335319293167227)
,p_name=>'SC_REPORT_ROWS'
,p_message_text=>'More than %0 rows available. Increase rows selector to view more rows.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(783643640928519642)
,p_name=>'SEARCH'
,p_message_text=>'Search'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87996606697203579)
,p_name=>'SECONDS'
,p_message_text=>'seconds'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(192611119494617759)
,p_name=>'SEE_ATTACHED'
,p_message_text=>'See attached'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(613015501857392356)
,p_name=>'SELECT_ROW'
,p_message_text=>'Select Row'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(191282927045882299)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_text=>'Set Screen Reader Mode Off'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(191283201203884350)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_text=>'Set Screen Reader Mode On'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(167836505919841363)
,p_name=>'SHOW'
,p_message_text=>'Show'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(628741825990150477)
,p_name=>'SHOW_ALL'
,p_message_text=>'Show All'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1126850947742925064)
,p_name=>'SIGN_IN'
,p_message_text=>'Sign In'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(434101662519708506)
,p_name=>'SIGN_OUT'
,p_message_text=>'Sign out'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146762506537056649)
,p_name=>'SINCE_DAYS_AGO'
,p_message_text=>'%0 days ago'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168301912432957767)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_text=>'%0 days from now'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146762100996055069)
,p_name=>'SINCE_HOURS_AGO'
,p_message_text=>'%0 hours ago'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168301705159955662)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_text=>'%0 hours from now'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146761728915053680)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_text=>'%0 minutes ago'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168301530308953430)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_text=>'%0 minutes from now'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146763319696060453)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_text=>'%0 months ago'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168302327669962199)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_text=>'%0 months from now'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168303007892003732)
,p_name=>'SINCE_NOW'
,p_message_text=>'Now'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146761220950051356)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_text=>'%0 seconds ago'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168301316456949448)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_text=>'%0 seconds from now'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146762913809058781)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_text=>'%0 weeks ago'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168302119358959742)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_text=>'%0 weeks from now'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(146763724198061796)
,p_name=>'SINCE_YEARS_AGO'
,p_message_text=>'%0 years ago'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168302504598964916)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_text=>'%0 years from now'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135121931642683004)
,p_name=>'STANDARD'
,p_message_text=>'Standard'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(191096901046880740)
,p_name=>'START_DATE'
,p_message_text=>'Start Date'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(18811904025816097)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_text=>'You are receiving this email from Interactive report subscription created by %0.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1593043964712209136)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_text=>'Subscriptions'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(454857801924063199)
,p_name=>'TAB'
,p_message_text=>'Tab'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(86628826899413422)
,p_name=>'TITLE'
,p_message_text=>'Title'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25709226853730149)
,p_name=>'TODAY'
,p_message_text=>'Today'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(185477830272529113)
,p_name=>'TOTAL'
,p_message_text=>'Total'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(27342321613257083)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_text=>'A maximum of %0 columns can be selected.'
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002414964237159)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_text=>'Collapse All'
,p_is_js_message=>true
,p_version_scn=>37165770887564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002830777240462)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_text=>'Collapse All Below'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002281736232351)
,p_name=>'TREE.EXPAND_ALL'
,p_message_text=>'Expand All'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002600345238632)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_text=>'Expand All Below'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2003016013241968)
,p_name=>'TREE.REPARENT'
,p_message_text=>'Reparent'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(358906925733812625)
,p_name=>'TREES'
,p_message_text=>'Trees'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(633827930742918458)
,p_name=>'UI.FORM.REQUIRED'
,p_message_text=>'Required'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(136322414434753427)
,p_name=>'UNAUTHORIZED'
,p_message_text=>'Unauthorized'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(402715290353654251)
,p_name=>'UNAVAILABLE'
,p_message_text=>'Unavailable'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(171865922944860764)
,p_name=>'UNKNOWN'
,p_message_text=>'Unknown'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(20152500737989770)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_text=>'An unrecognized authentication error has occurred.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24089122778758466)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_text=>'If you no longer wish to receive emails, please click <a href="%0">unsubscribe</a> to manage your subscription.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(18336630451737507)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_text=>'If you no longer wish to receive emails, please go to the following URL to manage your subscription:'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(111312628402460784)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_text=>'unsupported data type'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88056217141660805)
,p_name=>'UPDATE'
,p_message_text=>'update'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(86586006748227826)
,p_name=>'UPDATED'
,p_message_text=>'Updated'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2201504435588339)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_text=>'Upgrade in Progress'
,p_version_scn=>73590892
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2201795786589140)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_text=>'Oracle APEX is being upgraded to a newer version. This process generally takes up to 3 minutes.'
,p_version_scn=>73590950
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(92340729609401286)
,p_name=>'URL_PROHIBITED'
,p_message_text=>'The requested URL has been prohibited. Contact your administrator.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145136812813620174)
,p_name=>'USER'
,p_message_text=>'User'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(270674028427314972)
,p_name=>'USERNAME'
,p_message_text=>'User Name'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(487080916697146381)
,p_name=>'USERNAME_TOO_LONG'
,p_message_text=>'Username is too long. The limit is %0 characters.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(160739010588249471)
,p_name=>'USERS'
,p_message_text=>'users'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(487075923183091498)
,p_name=>'USER_EXISTS'
,p_message_text=>'Username already exists.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(687418525278320519)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_text=>'Profile image for user %0'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9200660086334127)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_text=>'Automation - %0'
,p_version_scn=>187562200
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8602894811253181)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_text=>'Page %0 - %1 '
,p_version_scn=>186949234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9600214024685954)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_text=>'%0 - %1'
,p_version_scn=>187694547
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9600490519690622)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_text=>'%0 - %1'
,p_version_scn=>187694972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9203276057481968)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_text=>'Search Config - %0'
,p_version_scn=>187585182
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9203007377451199)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_text=>'Shared Dynamic LOV - %0'
,p_version_scn=>194215868
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9200896218336929)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_text=>'Task Definition - %0'
,p_version_scn=>187562364
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8603052784257622)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_text=>'Workflow - %0 '
,p_version_scn=>186951290
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(51596219494412799)
,p_name=>'VALID'
,p_message_text=>'Valid'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26573624185305934)
,p_name=>'VALIDATIONS'
,p_message_text=>'Validations'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(196414501370657734)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_text=>'Value must be specified'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(458967323158742934)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_text=>'Value must be specified for %0'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101038830329268032)
,p_name=>'VERTICAL'
,p_message_text=>'vertical'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88051802026590242)
,p_name=>'VIEW'
,p_message_text=>'view'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(160744723664272237)
,p_name=>'VIEWS'
,p_message_text=>'views'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(209575709357268507)
,p_name=>'VIEW_ALL'
,p_message_text=>'View All'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(32939599457116419)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_text=>'Visually hidden link'
,p_is_js_message=>true
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(133639419732200281)
,p_name=>'WARNING'
,p_message_text=>'Warning'
,p_is_js_message=>true
,p_version_scn=>64097835
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87999508559213652)
,p_name=>'WEEK'
,p_message_text=>'week'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(73692330291850451)
,p_name=>'WEEKLY'
,p_message_text=>'Weekly'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(87999912022214596)
,p_name=>'WEEKS'
,p_message_text=>'weeks'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(197266612336686901)
,p_name=>'WELCOME_USER'
,p_message_text=>'Welcome: %0'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184878201975075665)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_text=>'Found invalid value, please verify data entered.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184879307516077258)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_text=>'Found invalid value, please verify data entered.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21095423729473639)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_text=>'Found invalid date value, please verify date format.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184876822276072000)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_text=>'Found invalid number value, please verify number format.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(49218115309135956)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_text=>'Found invalid timestamp value, please verify timestamp format.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(104345016369563528)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_text=>'Unable to bind "%0". Use double quotes for multi byte items or verify length of item is 30 bytes or less. Use v() syntax to reference items longer than 30 bytes.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88327623952905309)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_text=>'Access denied by %0 security check'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(90685113333104969)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_text=>'Application Not Available'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88365228912114920)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_text=>'Application not found.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88366129043124387)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_text=>'application=%0  workspace=%1'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88382526853265743)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_text=>'Access to this application is restricted, please try again later.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88381709538260685)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_text=>'Access to this application is restricted to application developers, please try again later.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88359018430055125)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_text=>'ERR-7744 Unable to process branch to function returning URL.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88358631805049506)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_text=>'ERR-7744 Unable to process branch to function returning page.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88362300038097085)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_text=>'ERR-1430 Call to show from page process unsupported: G_FLOW_STEP_ID (%0).'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88393518813357980)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_text=>'ERR-1018 Error clearing step cache.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88350523184999693)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_text=>'ERR-1005 Unknown computation type.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88373227752180862)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_text=>'ERR-1201 session ID not set on custom authentication.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88373710221185186)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_text=>'page=%0'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88363420124102961)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_text=>'ERR-7620 Could not determine workspace for application (%0).'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37430926689802128)
,p_name=>'WWV_FLOW.EDIT'
,p_message_text=>'Edit'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88326621051894974)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_text=>'ERR-1802 Unable to find item id "%0"'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88321930700869418)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_text=>'ERR-1002 Unable to find item ID for item "%0" in application "%1".'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88323015594874559)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_text=>'Unexpected error, unable to find item name at application or page level.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88333014433940374)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_text=>'You are already at the first page of data.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(116868226251410190)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_text=>'Item ID (%0) is not an item defined on the current page.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21002726492698648)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_text=>'Item may be not be set by passing arguments to the application.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21008320848914683)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_text=>'(No checksum was provided)'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21001908484693445)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_text=>'Item may be set when accompanied by a "user-level bookmark" checksum.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21001526361689148)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_text=>'Item may be set when accompanied by an "application-level bookmark" checksum.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21002317142695970)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_text=>'Item may be set when accompanied by a "session" checksum.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21000318218648903)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_text=>'Item has no protection.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88429213075517199)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_text=>'No page help available.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60370026495440424)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_text=>'Workspace %0 has no privileges to parse as schema %1.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88358209856033741)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_text=>'ERR-1010 Branch to page accept processing recursion limit exceeded. %0'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4075321592529348)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_text=>'Page unavailable, you cannot run a page pattern.'
,p_version_scn=>130807565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21005901258719729)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_text=>'This page cannot be invoked using a URL or using a GET or POST to the show procedure, it must be called using a "Branch to Page" branch type.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(362100618636641486)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_text=>'Error attempting to save non-numeric value in item %0. '
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65559422408024213)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_text=>'The application''s parsing schema "%0" does not exist in the database.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(67043411401363710)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_text=>'Accounts in the INTERNAL workspace can be used only to access &PRODUCT_NAME. <a href="%0">Administration Services</a>.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88319100787851303)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_text=>'ERR-1029 Unable to store session info.  session=%0 item=%1'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(90690616927115514)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_text=>'Unable to stop trace: %0'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88326113432892799)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_text=>'Unexpected error'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(106479002526352937)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_text=>'Error in update_substitution_cache: %0'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(90699001174148794)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_text=>'Application and page must be provided to view help.'
,p_version_scn=>37165770887565
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(141412522991632131)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_text=>'Automation not found.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4685129191837431)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_text=>'Automation Query Error: %0'
,p_version_scn=>37165770887607
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91486008528950309)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_text=>'Purged %0 sessions.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2500283672959730)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_text=>'Can''t execute %0 code! It''s not supported by database or not enabled by instance parameter MLE_LANGUAGES.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2400736983228916)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_text=>'Multi Lingual Engine is not available on this database version!'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37734609313911732)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_text=>'Application collection array must not be null'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37733803641900575)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_text=>'Specified member attribute number %0 is invalid.  Attribute number must be between 1 and %1'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37740109407968502)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_text=>'Application collection exists'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37739014339951058)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_text=>'Collection name cannot be null'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37739406851958280)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_text=>'Collection name cannot be larger than 255 characters'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37732414330875307)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_text=>'Application collection %0 does not exist'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37740503304976192)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_text=>'Cursor is not yet open'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37733025543887978)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Member sequence %0 does not exist in Application collection %1',
''))
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37734232038908777)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_text=>'Member sequence %0 does not exist in application collection "%1"'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002580065951109)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_text=>'Algorithm %0 is not supported for ECDSA.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2002396604949846)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_text=>'Elliptic curve %0 is not supported.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(366793217552120557)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_text=>'The cryptographic function "%0" is not supported on this system.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(928947547032426441)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_text=>'Accessibility Tested'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91418103306721678)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_text=>'Close'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91420804476731519)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_text=>'Page Customization Options'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91422420406736120)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_text=>'Default'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91423812226743238)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_text=>'Displayed'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91425426424747351)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_text=>'Hidden'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91415531095710840)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_text=>'Check the regions you wish to have included on this page.  Checked regions may not display if you are not in the proper application context or do not have proper privileges.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91417117027716228)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_text=>'This page is not customizable.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(928949514595439864)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_text=>'You can personalize the appearance of this application by changing the Theme Style. Please select a Theme Style from the list below and click on Apply Changes.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(941032217818826971)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_text=>'Region Display'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(928947937955435643)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_text=>'Use Application Default Style'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(928947778784427695)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_text=>'Appearance '
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(348264335222796709)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_text=>'The column index referenced in the aggregate %0 does not exist.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3202594976893422)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_text=>'Appending the data export is not supported for %0 format.'
,p_version_scn=>10065353
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1203340886377889)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_text=>'CLOB output is not supported for %0 format.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(348263629449746570)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_text=>'The column break needs to be in the beginning of the columns array.'
,p_version_scn=>37166027452610
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(348263963439773161)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_text=>'The column group index referenced in %0 does not exist.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7600480133641507)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_text=>'export'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13400397612491969)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_text=>'The export format must be XML using ORDS as Print Server.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(348264755443829095)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_text=>'The column index referenced in the highlight %0 does not exist.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4802979468587200)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_text=>'Invalid Export Format: %0'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(348264173317785551)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_text=>'The parent group index referenced in %0 does not exist.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(438406763465940463)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_text=>'The %1 column of the %0 table is a "GENERATED ALWAYS" identity column. Please make sure that no source column is mapped to the %1 column in the Configure dialog.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(71162330681411401)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_text=>'Specified commit interval is too low.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(71162503471413364)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_text=>'No columns have been provided for data loading.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(74446749270866464)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_text=>'No columns found for row selector "%0". Try to auto-detect or review the JSON structure.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91852255184912302)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_text=>'No worksheets found in XLSX file.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3152482716858061)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_text=>'Requested hierarchy levels to discover (%0) exceeds maximum of %1.'
,p_version_scn=>34801308
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91852077404908185)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_text=>'Specified worksheet does not exist in XLSX file.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38265926490011983)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_text=>'Current version of data in database has changed since user initiated update process.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(46523525314509701)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_text=>'Error updating report columns: %0'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(581268938651288082)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_text=>'Cannot convert %0 to SDO_GEOMETRY.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(153451265502797642)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_text=>'Column %0 which is of data type %1 can not be converted to VARCHAR2!'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(224972444460860386)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_text=>'Column "%0" specified for attribute "%1" has not been found in data source!'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24878584347076330)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_text=>'Filter type %0 is not supported for multi-value columns.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(623766324468175593)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_text=>'Invalid "between" filter.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3862008606482515)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_text=>'No %2 value found in column %0, row #%1.'
,p_version_scn=>37165770887604
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3486976506507812)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_text=>'Column %0 or row #%1 does not exist.'
,p_version_scn=>37165770887602
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2037487029642862)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_text=>'Invalid LOV type specified.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2037004637637706)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_text=>'Invalid query type. Query type must be Table, SQL query or PL/SQL Function returning SQL Query.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(153561805002896882)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Failed to parse SQL query!',
'%0'))
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(224972641418887105)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_text=>'Specified column position %0 for attribute "%1" has not been found in SQL statement!'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1900295148068478)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_text=>'Too many items used in Multi-Value filter.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(224972205799856102)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_text=>'No column specified for attribute "%0".'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2035773703616392)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_text=>'PL/SQL function body did not return a value.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(330297988416961216)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_text=>'The REST Data Source does not contain an Operation to handle the requested DML action.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(599962644011521127)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_text=>'Range filters are only supported for NUMBER, DATE or TIMESTAMP data types.'
,p_version_scn=>64097789
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1422780712697567)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_text=>'Request failed with %0'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1500488112712921)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_text=>'GeoJSON to SDO_GEOMETRY conversion (column %0) is not available in this database.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1524513457220226)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_text=>'SDO_GEOMETRY conversion (column %0) is not supported for XML data sources.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3100654340378365)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_text=>'Character %0 is not supported as a multi-value separator.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(608819720026613167)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_text=>'This function cannot be used on a Query Context.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1524606802655523)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_text=>'Column Data Type mismatch.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(4525363865114790)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_text=>'This data source does not support changing multiple rows.'
,p_version_scn=>54401862
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2032761613534946)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_text=>'Internal ORDS OUT Bind limits exceeded. Please reduce the amount of DML rows.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(226830207783724092)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The JSON response from the remote server could not be parsed: ',
'%0'))
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2032481157527809)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_text=>'Unknown or wrong context type.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5801262721950238)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_text=>'Unsupported components for readable export: %0'
,p_version_scn=>7401715
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(366776950996580242)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_text=>'This file type is not supported by the parser.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(106887803365614605)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_text=>'Unauthorized access (wwv_flow_api.set_credentials not set).'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(48283924695396263)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_text=>'Workspace did not create because it already exists.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(48283201492389477)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_text=>'User group did not create because it already exists.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79175427560815620)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_text=>'Duplicate username found for %0.'
,p_version_scn=>37165770887566
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79176132193826416)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_text=>'Error loading users. Failed on user %0.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101079002952458838)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_text=>'Would have loaded %0 users.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101075104421440280)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_text=>'Password'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101076509054451106)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_text=>'Privileges'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101073210524432596)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_text=>'Username'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(479223104904455167)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_text=>'Error during rendering of page item #COMPONENT_NAME#.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(90711903477215730)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_text=>'Can''t display page item because the HTML form was not yet opened.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5544314435283701)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_text=>'Error computing item default value for page item #COMPONENT_NAME#.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88458219505708300)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_text=>'Error in item post calculation for page item #COMPONENT_NAME#.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88456316688679104)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_text=>'Error computing item source value for page item #COMPONENT_NAME#.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28516808103704827)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_text=>'Unauthorized access.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1800130974250474)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_text=>'Value %0 of %1 is not a valid JSON array.'
,p_version_scn=>9014455
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88572613992933843)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_text=>'JavaScript not supported.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88573524035936761)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_text=>'List'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91143125479736046)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_text=>'Unable to initialize query.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(107542529598109295)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_text=>'Update of %0 is not supported.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(93289421235340020)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_text=>'Invalid item ID: %0 '
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(152883321281057250)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_text=>'No help exists for this item.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(72445491382471284)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_text=>'Chart query generation failed. Check Source and Column Mapping settings.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(77819507280251744)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_text=>'Invalid value for parameter p_mail_id: %0'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(152440718624143867)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_text=>'Cannot use "To" or "Reply-To" as the "From" address, as these contain multiple email addresses.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(950662731361607306)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_text=>'You have exceeded the maximum number of email messages per workspace.  Please contact your administrator.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(20580011080272889)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_text=>'This procedure must be invoked from within an application session.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(77817200307221272)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_text=>'Null value supplied for parameter %0.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(310379438937473388)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_text=>'Email template "%0" not found in application %1.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1362155649689302869)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_text=>'The SMTP_HOST_ADDRESS instance parameter must be set to send mails.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(74362228272400319)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_text=>'You must supply a message recipient to send mail.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1038096408498857060)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_text=>'Unable to establish SMTP connection with the configured email server.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(555924301478776576)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_text=>'Invalid Ajax call!'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26849822991975278)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_text=>'No Ajax function has been defined for plug-in %0'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(471053427565979914)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_text=>'No execution function has been defined for plug-in %0'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26850024854985238)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_text=>'No render function has been defined for plug-in %0'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(574453160697298179)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_text=>'The REST Data Source Plug-In "%0" does not contain a "Capabilities" function.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(574452926118290208)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_text=>'The REST Data Source Plug-In "%0" does not contain a DML function.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(574453488850303219)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_text=>'The REST Data Source Plug-In "%0" dies not contain an execute function.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(574453626423305015)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_text=>'The REST Data Source Plug-In "%0" dies not contain a fetch function.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25436703135875894)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_text=>'Error in PLSQL code raised during plug-in processing.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42881717283670012)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_text=>'Value must be specified.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(125797908898792849)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_text=>'Data type %0 can not be converted to VARCHAR2!'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(723984028603829993)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_text=>'Column "%0" specified for attribute "%1" has not been found in SQL statement!'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2000299540186550)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_text=>'Value %0 of %1 is not a valid JSON array.'
,p_version_scn=>7623790
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(442143627021608661)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_text=>'A list of values (LOV) query or Named list of values must be specified for %0.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(455603517755345445)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_text=>'Wrong number of columns selected in the LOV SQL query for %0. See examples for valid statements.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(723892308386814641)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_text=>'No column specified for attribute "%0".'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1778830758138015288)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_text=>'Entered value %0 for attribute "%1" is not numeric.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(483814009157593994)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_text=>'%0 has a wrong data type in SQL statement. Column# %1 is %2 but %3 expected.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(723918901245822084)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_text=>'Column "%0" specified for attribute "%1" has data type %2 but should have %3.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(22104269293793565)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_text=>'Unable to find the report layout.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7006847070000993)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_text=>'Background Executions Limit exceeded for %0.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1401494740636504)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_text=>'Another Execution of %0 is already running.'
,p_version_scn=>37165770887521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1401225710638189)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_text=>'Another Execution of %0 is already running for context %1.'
,p_version_scn=>37165770887521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1793090876578942)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_text=>'Uploaded files are not visible in the working session for the Execution of %0.'
,p_version_scn=>37165770887521
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(225660927589094258)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_text=>'Compute Sum feature cannot be used for reports based on a REST Data Source.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88462629127805679)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_text=>'ERR-2904 Unable to set shortcut value.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100941205648503960)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_text=>'Error: Unknown shortcut type.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2459774563073572)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_text=>'Search query is too long.'
,p_version_scn=>42331999
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79172306810686653)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_text=>'Unable to fetch authentication_scheme in application %0.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(92124009447379966)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_text=>'Unable to fetch component %0.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(415710502409098950)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_text=>'The tenant id already exists for the current session.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101074520567435495)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_text=>'E-Mail'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1596774382401944399)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_text=>'Authentication failed.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(170839531266100898)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_text=>'One or more cookies set in apex_util.g_request_cookies contain an invalid value.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(116981026887647678)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_text=>'The response from the UDDI registry was invalid.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25441900737188165)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_text=>'The URL provided did not return a valid WSDL document.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28704815063272714)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_text=>'The WSDL document contains multiple SOAP bindings. &PRODUCT_NAME. only supports WSDL''s with one SOAP binding. Click Create Web Service Reference Manually to continue creating a reference for this service.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(313337223506369019)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_text=>'The response from the service was not XML.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1596774180427938667)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_text=>'OAuth access token not available or expired.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(618210067761226303)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_text=>'You have exceeded the maximum number of web service requests per workspace. Please contact your administrator.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1596781746050238453)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_text=>'Server responded with unsupported OAuth token type.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26750800757452239)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_text=>'The WSDL document did not contain a binding for SOAP which is required in order to add the reference.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(20990404520659349)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_text=>'This WSDL requires authentication credentials. Please supply the username and password below.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42953707322560680)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_text=>'The WSDL document could not be understood by the rendering engine. Click Create Web Service Reference Manually to continue creating a reference for this service.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(359623015508572641)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_text=>'Unable to process update.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(450192812874158869)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_text=>'List of Values return and display column are the same!'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(450192502138155698)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_text=>'List of Values doesn''t have a return column.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(107303508278863661)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_text=>'Error fetching column value: %0'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(180949821830443859)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_text=>'Current tabular form data is too old; the source data has been modified.<br/> Click <strong><a href="%0">here</a></strong> to discard your changes and reload the data from the database.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63431709525503579)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_text=>'Error determining pagination string'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63428300952482241)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'unable to determine query headings:',
'%0'))
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63433031689509999)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_text=>'error performing report footer replacements'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63440902262577213)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'failed to parse SQL query:',
'%0',
'%1'))
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(80936819632261587)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_text=>'Minimum row requested: %0, rows found but not displayed: %1'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(72340722145535298)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_text=>'query column #%0 (%1) is invalid, columns that use HTML need alias names'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(107297908494854187)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_text=>'Error getting query headings: %0'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63441406071578348)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'report error:',
'%0'))
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(148416017278648959)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_text=>'Sort by this column'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(72342525739545811)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Query cannot be parsed, please check the syntax of your query.',
'(%0)',
'</p>'))
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(181321002912359208)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_text=>'This form contains unsaved changes. Press "Ok" to proceed without saving your changes. '
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(225660649112031052)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_text=>'Report pagination scheme (%0) is not supported with the chosen data source.'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(72339702752529737)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_text=>'query column #%0 (%1) is invalid, use column alias'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(80989604862541265)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_text=>'row(s) %0 - %1 of more than %2'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(194164045460359394)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_text=>'%0 - %1 of more than %2'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(80930727681244981)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_text=>'row(s) %0 - %1 of %2'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26630013475930364)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_text=>'%0 - %1 of %2'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65392502545578032)
,p_name=>'Y'
,p_message_text=>'Y'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(88000317563216203)
,p_name=>'YEAR'
,p_message_text=>'year'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(63050988224254125)
,p_name=>'YEARS'
,p_message_text=>'years'
,p_version_scn=>37165770887567
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(183818322768583010)
,p_name=>'YES'
,p_message_text=>'Yes'
,p_version_scn=>37165770887567
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
 p_id=>wwv_flow_imp.id(109678305570583962)
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
 p_id=>1
,p_name=>'Messages'
,p_alias=>'MESSAGES'
,p_step_title=>'Messages'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'13'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(138120279395586110)
);
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
