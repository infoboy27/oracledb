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
,p_default_application_id=>4482
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4482 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4482
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144692090325756922')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'hu'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4482)
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
 p_id=>wwv_flow_imp.id(4482)
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
 p_id=>wwv_flow_imp.id(728504220438374.4482)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4482)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4482)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4482)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4482)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4482)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4482)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4482)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4482)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4482)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4482)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4482)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4482)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4482)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4482)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4482)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4482)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.hu'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4482)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4482)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4482)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4482)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4482)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4482)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4482)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.hu'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4482)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4482)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4482)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4482)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4482)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4482)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.hu'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4482)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4482)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4482)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.hu'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4482)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4482)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4482)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4482)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4482)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4482)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4482)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4482)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4482)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4482)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4482)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4482)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4482)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4482)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4482)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4482)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4482)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.hu'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4482)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4482)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4482)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4482)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4482)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4482)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4482)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4482)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4482)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4482)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4482)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4482)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4482)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4482)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4482)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4482)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4482)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.hu'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4482)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4482)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4482)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4482)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4482)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4482)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4482)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4482)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4482)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4482)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4482)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4482)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4482)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4482)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4482)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.hu'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4482)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4482)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4482)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4482)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4482)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4482)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4482)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4482)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4482)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4482)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4482)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4482)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4482)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4482)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4482)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4482)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4482)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4482)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4482)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4482)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4482)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4482)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4482)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4482)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4482)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4482)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4482)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4482)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4482)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4482)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4482)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4482)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4482)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4482)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4482)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4482)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4482)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4482)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4482)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4482)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4482)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4482)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4482)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4482)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4482)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4482)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4482)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4482)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4482)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4482)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4482)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4482)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4482)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4482)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4482)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4482)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4482)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4482)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4482)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4482)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4482)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4482)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4482)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4482)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4482)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4482)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4482)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4482)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4482)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4482)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4482)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4482)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4482)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4482)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4482)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4482)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4482)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4482)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4482)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4482)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4482)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4482)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4482)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4482)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4482)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4482)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4482)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4482)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4482)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4482)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4482)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4482)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4482)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4482)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4482)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4482)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4482)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4482)
,p_page_name=>'winlov'
,p_page_title=>unistr('Keres\00E9si p\00E1rbesz\00E9dpanel')
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
,p_find_button_text=>unistr('Keres\00E9s')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>unistr('Bez\00E1r\00E1s')
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>unistr('Tov\00E1bb &gt;')
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; Vissza'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">#FIRST_ROW# - #LAST_ROW# sor</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4482)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4482)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4482)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4482)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4482)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4482)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4482)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4482)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4482)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4482)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4482)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4482)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4482)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4482)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4482)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4482)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4482)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4482)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4482)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4482)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4482)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4482)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4482)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4482)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4482)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4482)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4482)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4482)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4482)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4482)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4482)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4482)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4482)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4482)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4482)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4482)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4482)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4482)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4482)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4482)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4482)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4482)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4482)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4482)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4482)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4482)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4482)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4482)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4482)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4482)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4482)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4482)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4482)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4482)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4482)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4482)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4482)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4482)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4482)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4482)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4482)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4482)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4482)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4482)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4482)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4482)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4482)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4482)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4482)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4482)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4482)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4482)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4482)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4482)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4482)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4482)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4482)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4482)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4482)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4482)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4482)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4482)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4482)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4482)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4482)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4482)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4482)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4482)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4482)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4482)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4482)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4482)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4482)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4482)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4482)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4482)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4482)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4482)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4482)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4482)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4482)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4482)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4482)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4482)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4482)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4482)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4482)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4482)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4482)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4482)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4482)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4482)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4482)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4482)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4482)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4482)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4482)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4482)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4482)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4482)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4482)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4482)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4482)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4482)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4482)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4482)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4482)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4482)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4482)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4482)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4482)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4482)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4482)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4482)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4482)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4482)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4482)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4482)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4482)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4482)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4482)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4482)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4482)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4482)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4482)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4482)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4482)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4482)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4482)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4482)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4482)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4482)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4482)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4482)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4482)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4482)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4482)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4482)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4482)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4482)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4482)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4482)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4482)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4482)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4482)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4482)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4482)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4482)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4482)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4482)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4482)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4482)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4482)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4482)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4482)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4482)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4482)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4482)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4482)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4482)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4482)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4482)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4482)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4482)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4482)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4482)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4482)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4482)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4482)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4482)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4482)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4482)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4482)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4482)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4482)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4482)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4482)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4482)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4482)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4482)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4482)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4482)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4482)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4482)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4482)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4482)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4482)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4482)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4482)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4482)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4482)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4482)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4482)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4482)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4482)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4482)
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
 p_id=>wwv_flow_imp.id(139564760004751486)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'hu'
,p_message_text=>'Oszlop %0'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549334116751482)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'hu'
,p_message_text=>'Rendszergazda'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549267665751482)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'hu'
,p_message_text=>unistr('Felhaszn\00E1l\00F3n\00E9v')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611936514751500)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1f\00E9r\00E9s megtagadva')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568857866751487)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'hu'
,p_message_text=>unistr('Elk\00E9sz\00FClt az \00D6n %0 fi\00F3kja.')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552064206751482)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'hu'
,p_message_text=>unistr('A fi\00F3k z\00E1rolva van.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536550553751478)
,p_name=>'AM_PM'
,p_message_language=>'hu'
,p_message_text=>'de. / du.'
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519369847751473)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'hu'
,p_message_text=>unistr('m\0171velethivatkoz\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519230663751473)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'hu'
,p_message_text=>unistr('p\00E1rbesz\00E9dpanel-hivatkoz\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683662706751521)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 v\00E1lt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691408710751523)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'hu'
,p_message_text=>unistr('(Akt\00EDv)')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496213513751466)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'hu'
,p_message_text=>unistr('Cseveg\00E9s t\00F6r\00F6lve')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496142855751466)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'hu'
,p_message_text=>unistr('Cseveg\00E9s t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492793558751465)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'hu'
,p_message_text=>unistr('Elfogad\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492820140751465)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'hu'
,p_message_text=>unistr('Elutas\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492541109751465)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'hu'
,p_message_text=>unistr('Besz\00E9lget\00E9s el\0151zm\00E9nyei')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495953254751466)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1solva')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496022323751466)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'hu'
,p_message_text=>unistr('A v\00E1g\00F3lapra m\00E1solva')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495757355751466)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1sol\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495893425751466)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1sol\00E1s a v\00E1g\00F3lapra')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493292630751465)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'hu'
,p_message_text=>'Asszisztens'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493614646751465)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az AI le van tiltva a munkater\00FClet vagy a p\00E9ld\00E1ny szintj\00E9n.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532975247751477)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 Generative AI Service a megadott azonos\00EDt\00F3val vagy statikus azonos\00EDt\00F3val.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531649007751476)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiteles\00EDt\00E9si hiba vagy tiltott hozz\00E1f\00E9r\00E9s (HTTP-%1) a(z) %0 URL-c\00EDm eset\00E9ben. Ellen\0151rizze a(z) %2 Generative AI Service konfigur\00E1ci\00F3j\00E1t.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511453353751470)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A Generative AI Service szolg\00E1ltat\00E1sra vonatkoz\00F3 HTTP-k\00E9relem nem siker\00FClt a k\00F6vetkez\0151n\00E9l: %0, a HTTP-%1: %2 v\00E1laszk\00F3ddal')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535839688751478)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a Generative AI Service szolg\00E1ltat\00E1shoz k\00FCld\00F6tt HTTP-k\00E9relemben a(z) %0 b\0151v\00EDtm\00E9ny eset\00E9ben, %1 m\00F3dban. Ellen\0151rizze a Generative AI Service konfigur\00E1ci\00F3j\00E1t.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498600482751467)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('P\00E9ld\00E1k')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497058694751466)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'hu'
,p_message_text=>'Asszisztens'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498439890751467)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496918069751466)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6n')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527638429751475)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az OCI Generative AI jelenleg nem t\00E1mogatja a t\00F6bb\00FCzenetes cseveg\00E9si felhaszn\00E1l\00F3i \00E9lm\00E9nyt.')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507575033751469)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a(z) %0 prompt %1 alkalmaz\00E1s eset\00E9ben t\00F6rt\00E9n\0151 feldolgoz\00E1sakor. Ellen\0151rizze, hogy az Alkalmaz\00E1sszerkeszt\0151 el\00E9rhet\0151-e ezen a p\00E9ld\00E1nyon.')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512662638751471)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet v\00E1laszt feldolgozni a(z) %0 AI-szolg\00E1ltat\00E1s sz\00E1m\00E1ra, v\00E1lasz: %1')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518898501751473)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCzenet k\00FCld\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507199623751469)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a(z) %0 h\00E1tt\00E9rbeli AI-szolg\00E1ltat\00E1sban')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492982236751465)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCzenet')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493062561751465)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00CDrja ide az \00FCzenetet')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496332681751466)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Felhaszn\00E1l\00F3 avat\00E1rja')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496498746751466)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'hu'
,p_message_text=>unistr('Haszn\00E1lja ezt')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493196113751465)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Egy \00FCzenetet nem k\00FCld\00F6tt el. Biztosan tov\00E1bbl\00E9p?')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662156653751515)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Az Ajax h\00EDv\00E1sa %0 kiszolg\00E1l\00F3i hib\00E1val t\00E9rt vissza %1 r\00E9sz\00E9re.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589240346751493)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alkalmaz\00E1s "%0" m\00E1sodlagos neve nem alak\00EDthat\00F3 \00E1t az alkalmaz\00E1s egyedi azonos\00EDt\00F3j\00E1ra.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578055832751490)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1816 V\00E1ratlan hiba a p_flow_alias_or_id (%0) alkalmaz\00E1si alias \00E1talak\00EDt\00E1sakor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675462676751519)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alkalmaz\00E1s ellen\0151rz\0151 \00F6sszege egyszer\0171 m\00F3dszert k\00EDn\00E1l annak meg\00E1llap\00EDt\00E1s\00E1hoz, hogy ugyanaz az alkalmaz\00E1s lett telep\00EDtve minden munkater\00FCletre. Az ellen\0151rz\0151 \00F6sszegek \00F6sszehasonl\00EDt\00E1s\00E1val lehet meg\00E1llap\00EDtani, hogy van-e egyez\00E9s. ')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562097794751485)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a hiteles\00EDt\00E9si funkci\00F3 feldolgoz\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544034176751480)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba t\00F6rt\00E9nt a hiteles\00EDt\00E9si funkci\00F3 feldolgoz\00E1sakor.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715989913751531)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Az Oracle Cloud Identity Management \00E1ltal visszaadott %0 b\00E9rl\0151n\00E9v nincs hiteles\00EDtve a(z) %1 tartom\00E1nyhoz!<br/>K\00E9rj\00FCk, <a href="&LOGOUT_URL.">jelentkezzen be \00FAjra</a>, \00E9s adjon meg egy hiteles\00EDtett b\00E9rl\0151nevet, vagy m\00F3dos\00EDtsa az URL-c\00EDmet.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540125588751479)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" fi\00F3k a(z) "%1" munkater\00FCletn\00E9l nem rendelkezik a sz\00FCks\00E9ges <br/>fejleszt\0151i jogosults\00E1ggal (DB_DEVELOPER vagy DB_ADMINISTRATOR)! K\00E9rj\00FCk, <a href="&LOGOUT_URL.">jelentkezzen be \00FAjra</a> a jogosults\00E1gok megszerz\00E9se ut\00E1n.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536726884751478)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'hu'
,p_message_text=>unistr('Az Oracle Cloud Identity Management \00E1ltal visszaadott b\00E9rl\0151n\00E9v nincs hiteles\00EDtve az aktu\00E1lis munkater\00FCletre!<br/>K\00E9rj\00FCk, <a href="&LOGOUT_URL.">jelentkezzen be \00FAjra</a>, \00E9s adjon meg egy hiteles\00EDtett b\00E9rl\0151nevet.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540242833751479)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Biztons\00E1gi okok miatt a jelen munkater\00FClet alkalmaz\00E1sainak az URL-c\00EDmben l\00E9v\0151 tartom\00E1ny \00E1ltali futtat\00E1sa nem megengedett.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561742850751485)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9rje meg az adatb\00E1zis rendszergazd\00E1j\00E1t a $OH/rdbms/admin/catldap.sql futtat\00E1s\00E1ra.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561648860751485)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'hu'
,p_message_text=>unistr('A SYS.DBMS_LDAP csomag nem l\00E9tezik vagy \00E9rv\00E9nytelen.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561593556751485)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba t\00F6rt\00E9nt az LDAP felhaszn\00E1l\00F3i funkci\00F3 feldolgoz\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561876457751485)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az LDAP hiteles\00EDt\00E9s feldolgoz\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562675936751485)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a login_page elj\00E1r\00E1snak \00E1tadand\00F3 p_flow_page argumentumban.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562200805751485)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'hu'
,p_message_text=>unistr('A p_session \00E9rv\00E9nytelen itt: wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613574695751500)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'hu'
,p_message_text=>unistr('Helytelen form\00E1tum\00FA argumentum a wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2 r\00E9sz\00E9re.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562337875751485)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'hu'
,p_message_text=>unistr('Null \00E9rt\00E9k\0171 felhaszn\00E1l\00F3n\00E9v lett \00E1tadva a bejelentkez\00E9si elj\00E1r\00E1s r\00E9sz\00E9re.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549108436751482)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00FAjb\00F3li bejelentkez\00E9shez v\00E1rjon <span id="apex_login_throttle_sec">%0</span> m\00E1sodpercet.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550466317751482)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Blokkolva lett a bejelentkez\00E9si k\00EDs\00E9rlet.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611249660751500)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a(z) "%0" hiteles\00EDt\00E9s.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550943182751482)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'hu'
,p_message_text=>unistr('Null \00E9rt\00E9k\0171 a biztons\00E1gi csoport azonos\00EDt\00F3ja.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562141881751485)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az ut\00F3hiteles\00EDt\00E9si elj\00E1r\00E1s v\00E9grehajt\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561944520751485)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az el\0151hiteles\00EDt\00E9si elj\00E1r\00E1s feldolgoz\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563622733751486)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Nyissa meg az URL-c\00EDmet ugyanabban a b\00F6ng\00E9sz\0151ben, mint ahol kezdem\00E9nyezte a Jelsz\00F3-vissza\00E1ll\00EDt\00E1si k\00E9relmet.  Ha a Jelsz\00F3-vissza\00E1ll\00EDt\00E1si URL-c\00EDmre kattint,'),
unistr('vissza lesz ir\00E1ny\00EDtva a bejelentkez\00E9si oldalra.'),
unistr('Pr\00F3b\00E1lja \00FAjra a Jelsz\00F3-vissza\00E1ll\00EDt\00E1st, \00E9s hagyja nyitva a b\00F6ng\00E9sz\0151t.')))
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713468842751530)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelsz\00F3 URL-c\00EDm\00E9nek vissza\00E1ll\00EDt\00E1sa')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540453036751479)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az Er\0151forr\00E1skezel\0151i %0 fogyaszt\00F3i csoportnak nincs %1 jogosults\00E1ga')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540545914751479)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'hu'
,p_message_text=>unistr('A hi\00E1nyz\00F3 jogosults\00E1g megszerz\00E9s\00E9hez haszn\00E1lja a k\00F6vetkez\0151t: DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575171960751489)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a feldolgoz\00E1si munkamenet sentry funkci\00F3j\00E1ban.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575264249751489)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a feldolgoz\00E1si munkamenet ellen\0151rz\00E9si funkci\00F3j\00E1ban.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575488857751489)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9rje meg a(z) %0 rendszergazd\00E1j\00E1t, hogy konfigur\00E1lja az Oracle Application Server Single Sign-On (SSO) funkci\00F3j\00E1t.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585888031751492)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 tokenben szab\00E1lytalan %0 lett visszaadva az egyszeri bejelentkez\00E9s \00E1ltal.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562507368751485)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00F3dos\00EDtsa a hiteles\00EDt\00E9si s\00E9m\00E1t, \00E9s adja meg az alkalmaz\00E1s nev\00E9t.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585536183751492)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 elj\00E1r\00E1s szab\00E1lytalan megh\00EDv\00F3ja:')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585766393751492)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen alkalmaz\00E1si munkamenet az urlc tokenben: %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585388363751492)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a portal_sso_redirect elj\00E1r\00E1sban: hi\00E1nyzik az alkalmaz\00E1s-regisztr\00E1l\00E1si adat: %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575315714751489)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik vagy \00E9rv\00E9nytelen a WWSEC_SSO_ENABLER_PRIVATE csomag.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562406794751485)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('A hiteles\00EDt\00E9si s\00E9m\00E1ban nem tal\00E1lhat\00F3 a regisztr\00E1lt partneralkalmaz\00E1s neve.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585479005751492)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'hu'
,p_message_text=>unistr('Regisztr\00E1lja ezt az alkalmaz\00E1st a telep\00EDt\00E9si \00FAtmutat\00F3 szerint.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575519344751489)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az SSO hiteles\00EDt\00E9s feldolgoz\00E1sakor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688824053751523)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'hu'
,p_message_text=>unistr('Jogosulatlan URL-c\00EDm: %0')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574981080751489)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a hiteles\00EDt\00E9s feldolgoz\00E1sakor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540393519751479)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" munkater\00FClet nem akt\00EDv. Forduljon a rendszergazd\00E1hoz.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541009061751479)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'hu'
,p_message_text=>'%0'
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550167679751482)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1f\00E9r\00E9s megtagadva az alkalmaz\00E1s-biztons\00E1gi ellen\0151rz\00E9s \00E1ltal')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550212636751482)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1f\00E9r\00E9s megtagadva az oldalbiztons\00E1gi ellen\0151rz\00E9s \00E1ltal')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550361405751482)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a hiteles\00EDt\00E9s feldolgoz\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619490973751502)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 k\00E9sz\00FClt a(z) %1 haszn\00E1lat\00E1val')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619548571751502)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Szak\00E9rtelemmel')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679337082751520)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Esem\00E9ny le\00EDr\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679194179751520)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'hu'
,p_message_text=>unistr('Z\00E1r\00F3 d\00E1tum')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679410949751520)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'hu'
,p_message_text=>unistr('Esem\00E9ny azonos\00EDt\00F3ja')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679040633751520)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezd\0151 d\00E1tum')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679212773751520)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Esem\00E9ny megnevez\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521873791751473)
,p_name=>'APEX.CARD'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E1rtya')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522045052751474)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E1rtyam\0171velet')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562772738751485)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'hu'
,p_message_text=>unistr('Vizu\00E1lisan elrejtett jel\00F6l\0151n\00E9gyzet')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564638669751486)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hib\00E1s az ellen\0151rz\0151 \00F6sszeg tartalma')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564520025751486)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hib\00E1s az ellen\0151rz\0151 \00F6sszeg form\00E1tuma')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634421900751507)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'hu'
,p_message_text=>unistr('A v\00E1g\00F3lapra m\00E1solva.')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633971486751506)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez a b\00F6ng\00E9sz\0151 nem t\00E1mogatja a v\00E1g\00F3lapra t\00F6rt\00E9n\0151 m\00E1sol\00E1st gombr\00F3l \00E9s men\00FCb\0151l. Pr\00F3b\00E1lja a Ctrl+C vagy Command+C billenty\0171kombin\00E1ci\00F3val.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620137002751502)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Bez\00E1r\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498590783751467)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'hu'
,p_message_text=>unistr('A K\00F3dszerkeszt\0151 tartalmai t\00FAll\00E9pik az elem r\00E9sz\00E9re enged\00E9lyezett hossz\00FAs\00E1got (a t\00E9nyleges %0, a megengedett pedig %1 karakter)')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678648401751520)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'hu'
,p_message_text=>'Kontraszt'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673177901751518)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'hu'
,p_message_text=>unistr('Aktu\00E1lis')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673006888751518)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezd\0151bet\0171')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677234285751519)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# \00E9rt\00E9ke csak \00E9rv\00E9nyes sz\00EDn lehet. P\00E9ld\00E1ul: %0')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539669983751479)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'hu'
,p_message_text=>unistr('Tov\00E1bbi sz\00EDnek')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539708445751479)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00EDnv\00E1laszt\00F3 megnyit\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496854843751466)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'hu'
,p_message_text=>unistr('Alfa\00E9rt\00E9k, v\00EDzszintes cs\00FAszka. A navig\00E1l\00E1shoz haszn\00E1lja a ny\00EDlbillenty\0171ket.')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496563011751466)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00EDntartom\00E1ny, n\00E9gyir\00E1ny\00FA cs\00FAszka. A navig\00E1l\00E1shoz haszn\00E1lja a ny\00EDlbillenty\0171ket.')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496648241751466)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00EDn\00E1rnyalat, f\00FCgg\0151leges cs\00FAszka. A navig\00E1l\00E1shoz haszn\00E1lja a ny\00EDlbillenty\0171ket.')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672973015751518)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00EDnv\00E1laszt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673256979751518)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00EDnform\00E1tum megv\00E1ltoztat\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711174131751529)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9klista')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711286452751529)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'hu'
,p_message_text=>unistr('Lista megnyit\00E1sa ehhez: %0')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691570577751523)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'hu'
,p_message_text=>'(Befejezve)'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580497131751491)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'hu'
,p_message_text=>unistr('Forduljon az alkalmaz\00E1s adminisztr\00E1tor\00E1hoz.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595937604751495)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('L\00E9pjen kapcsolatba az alkalmaz\00E1s adminisztr\00E1tor\00E1val.'),
unistr('Az esem\00E9nyre vonatkoz\00F3 r\00E9szletek a(z) "%0" hibakeres\00E9si azonos\00EDt\00F3 haszn\00E1lat\00E1val tal\00E1lhat\00F3k meg.')))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677527614751519)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'hu'
,p_message_text=>unistr('A ment\00E9s el\0151tt jav\00EDtsa ki a hib\00E1kat.')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522822100751474)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'hu'
,p_message_text=>unistr('%0. A t\00F6rl\00E9shez nyomja meg a backspace billenty\0171t.')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621001511751503)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 egyez\00E9s tal\00E1lhat\00F3')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502923759751468)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('1 el\00E9rhet\0151 tal\00E1lat')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620951018751503)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs egyez\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497340863751466)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'hu'
,p_message_text=>'Egyebek'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497232997751466)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 kiv\00E1lasztott \00E9rt\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692080397751524)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'hu'
,p_message_text=>unistr('Aktu\00E1lis folyamat')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677945281751519)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 elemben megadott f\00E1jl nem l\00E9tezik az APEX_APPLICATION_TEMP_FILES \00E1ltal megadottak k\00F6z\00F6tt.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666439461751516)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatb\00E1zisban megv\00E1ltozott az adatok aktu\00E1lis verzi\00F3ja, ami\00F3ta valamelyik felhaszn\00E1l\00F3 friss\00EDt\00E9si elj\00E1r\00E1st kezdem\00E9nyezett.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635505797751507)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'hu'
,p_message_text=>unistr('Ne t\00F6ltse be')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681883994751521)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151feldolgoz\00E1si hiba')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681690734751521)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor besz\00FAr\00E1sa')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695234541751524)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorrend : M\0171velet')
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681777535751521)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor m\00F3dos\00EDt\00E1sa')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510269905751470)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('M\0171veletek')
,p_is_js_message=>true
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537899580751478)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'hu'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523938417751474)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 csak d\00E1tumv\00E1laszt\00F3 vagy egy \00E9rv\00E9nyes d\00E1tum lehet. P\00E9ld\00E1ul: %1.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633164359751506)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Tartalom t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541315605751479)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9sz')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552369203751482)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem t\00E1mogatott r\00E9szekkel rendelkezik a form\00E1tummaszkban: %1')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537506979751478)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D3ra')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621472620751503)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Felbukkan\00F3 napt\00E1r: %0')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537308719751478)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00E9t')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537416564751478)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'hu'
,p_message_text=>'WK'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537797831751478)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'hu'
,p_message_text=>'Perc'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537960461751478)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00F3nap')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538365841751478)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 h\00F3nap')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507980086751469)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 el\0151ugr\00F3 ablaka')
,p_is_js_message=>true
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538210711751478)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 h\00F3nap')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630740929751506)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00CDr\00E1sv\00E9dett d\00E1tumv\00E1laszt\00F3')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539180314751479)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('D\00E1tum kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508087383751469)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'hu'
,p_message_text=>unistr('D\00E1tum \00E9s id\0151 kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505232348751469)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('Nap kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508638898751470)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00F3nap \00E9s \00E9v kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505406952751469)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'hu'
,p_message_text=>unistr('Id\0151 kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505985440751469)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'hu'
,p_message_text=>'Ma'
,p_is_js_message=>true
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523558814751474)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# \00E9rt\00E9ke csak \00E9rv\00E9nyes d\00E1tum lehet, p\00E9ld\00E1ul: %0')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523217756751474)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'hu'
,p_message_text=>unistr('#LABEL# csak %0 \00E9s %1 k\00F6z\00F6tti lehet.')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523336417751474)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'hu'
,p_message_text=>unistr('#LABEL# csak aznapi vagy k\00E9s\0151bbi lehet, mint %0.')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523484316751474)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'hu'
,p_message_text=>unistr('#LABEL# csak aznapi vagy kor\00E1bbi lehet, mint %0.')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514894204751471)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'hu'
,p_message_text=>unistr('Vizu\00E1lisan elrejtett szerkeszt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538160036751478)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9v')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625119689751504)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# k\00E9s\0151bbi, mint a megadott legk\00E9s\0151bbi %0 d\00E1tum.')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625577799751504)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('#LABEL# nem a megfelel\0151 %0 form\00E1tum\00FA.')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625090469751504)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# kor\00E1bbi, mint a megadott legkor\00E1bbi %0 d\00E1tum.')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625215297751504)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# nincs a(z) %0 \00E9s %1 \00E9rv\00E9nyes tartom\00E1ny\00E1ban.')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625490498751504)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# nincs a(z) %0 \00E9s %1 k\00F6z\00F6tti \00E9vek tartom\00E1ny\00E1ban.')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517211172751472)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Bels\0151 hiba t\00F6rt\00E9nt a DBMS_CLOUD-k\00E9relem feldolgoz\00E1sakor.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677837724751519)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E9gse')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703718916751527)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'hu'
,p_message_text=>unistr('Bez\00E1r\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564973285751486)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Meger\0151s\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705740072751528)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677665117751519)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'hu'
,p_message_text=>'OK'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677751485751519)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ment\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545448260751480)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('P\00E1rbesz\00E9d c\00EDme')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585176372751492)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Vizu\00E1lisan elrejtett p\00E1rbesz\00E9dpanel c\00EDme')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506243551751469)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'hu'
,p_message_text=>unistr('Oracle dokumentum-el\0151\00E1ll\00EDt\00F3 el\0151re kialak\00EDtott f\00FCggv\00E9nye')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517097509751472)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a dokumentum nyomtat\00E1sakor.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494286290751465)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %s nem t\00E1mogatja kimenetk\00E9nt a k\00F6vetkez\0151t: %1.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506175009751469)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" hiba elind\00EDtotta az Oracle dokumentum-el\0151\00E1ll\00EDt\00F3 el\0151re kialak\00EDtott f\00FCggv\00E9ny\00E9t:')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497607017751466)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('A sablon megad\00E1sa k\00F6telez\0151.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523054934751474)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a f\00E1jl let\00F6lt\00E9sekor.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522954922751474)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3k let\00F6lthet\0151 adatok.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526573538751475)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez a funkci\00F3 nem t\00E1mogatott csak fut\00E1si idej\0171 k\00F6rnyezeten.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579321297751490)
,p_name=>'APEX.ERROR'
,p_message_language=>'hu'
,p_message_text=>'Hiba'
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539203554751479)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('A hibakezel\00E9si visszah\00EDv\00E1s v\00E9grehajt\00E1sakor a k\00F6vetkez\0151 hiba t\00F6rt\00E9nt: %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551841638751482)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba t\00F6rt\00E9nt a(z) %0 hibalap kirajzol\00E1sakor')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540932028751479)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'hu'
,p_message_text=>unistr('Bels\0151 hiba')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690659664751523)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('L\00E9pjen kapcsolatba a rendszergazd\00E1val.'),
unistr('Az esem\00E9nyre vonatkoz\00F3 r\00E9szletek a(z) "%0" hibakeres\00E9si azonos\00EDt\00F3 haszn\00E1lat\00E1val tal\00E1lhat\00F3k meg.')))
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685219774751522)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatb\00E1zis \00EDr\00E1sv\00E9detten van megnyitva')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715386276751530)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'hu'
,p_message_text=>unistr('ORA-28353: Nem siker\00FClt megnyitni a t\00E1rc\00E1t. Az alkalmaz\00E1s adatai jelenleg nem \00E9rhet\0151k el.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685345290751522)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sajnos ez az oldal nem \00E9rhet\0151 el')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543949489751480)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'hu'
,p_message_text=>unistr('Technikai inform\00E1ci\00F3 (csak a fejleszt\0151k sz\00E1m\00E1ra el\00E9rhet\0151)')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649874035751511)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba\00FCzenet')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663732893751515)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('A v\00E1rt form\00E1tum: %0')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628600004751505)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'hu'
,p_message_text=>unistr('A felhaszn\00E1l\00F3 m\00E1r a Hozz\00E1f\00E9r\00E9s-vez\00E9rl\00E9si list\00E1ban van')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628535768751505)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'hu'
,p_message_text=>unistr('Er\0151s\00EDtse meg a k\00F6vetkez\0151 %0 felhaszn\00E1l\00F3 felv\00E9tel\00E9t a(z) <strong>%1</strong> hozz\00E1f\00E9r\00E9s-vez\00E9rl\00E9si list\00E1ba.')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629031694751505)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\0151 felhaszn\00E1l\00F3 tal\00E1lhat\00F3')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628765443751505)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'hu'
,p_message_text=>unistr('Hi\00E1nyzik a kukac (@) az e-mail-c\00EDmben')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628824549751505)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'hu'
,p_message_text=>unistr('Hi\00E1nyzik a pont (.) az e-mail-c\00EDmben')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628997436751505)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAl hossz\00FA a felhaszn\00E1l\00F3n\00E9v')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629264025751505)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'hu'
,p_message_text=>unistr('Csak az alkalmaz\00E1s hozz\00E1f\00E9r\00E9s-vez\00E9rl\00E9si list\00E1j\00E1ban megadott felhaszn\00E1l\00F3k \00E9rhetik el')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629324036751505)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1ratlan a hozz\00E1f\00E9r\00E9s-vez\00E9rl\00E9si lista \00E9rt\00E9ke: %0')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629189583751505)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ezt az alkalmaz\00E1st el\00E9ri minden hiteles\00EDtett felhaszn\00E1l\00F3')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673699006751518)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'hu'
,p_message_text=>'Letiltva'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673594384751518)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'hu'
,p_message_text=>unistr('Enged\00E9lyezve')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673891821751518)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'hu'
,p_message_text=>'%0: Letiltva'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673761143751518)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'hu'
,p_message_text=>unistr('%0: Enged\00E9lyezve')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522306136751474)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem t\00E1mogatott')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583522067751492)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'hu'
,p_message_text=>'Ki'
,p_is_js_message=>true
,p_version_scn=>2704958
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583491291751492)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'hu'
,p_message_text=>'Be'
,p_is_js_message=>true
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673498892751518)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'hu'
,p_message_text=>unistr('azonos\00EDtatlan')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513945548751471)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 b\00E1jt')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514469458751471)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'hu'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514148219751471)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'hu'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514331783751471)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'hu'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666639170751516)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Let\00F6lt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519741011751473)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Be\00E1ll\00EDt\00E1sok')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519434423751473)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519623815751473)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9rv elrejt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544367214751480)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151 hozz\00E1ad\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620673948751503)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'hu'
,p_message_text=>unistr('Alkalmazott sz\0171r\0151: %0')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545007813751480)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'hu'
,p_message_text=>'Alkalmaz'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664256058751515)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'hu'
,p_message_text=>'Alkalmaz'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545133209751480)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E9gse')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528956226751476)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00E1vdiagram')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676997037751519)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'hu'
,p_message_text=>'Egyebek'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529026062751476)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6rdiagram')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675567129751519)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'hu'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528719117751476)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Mennyis\00E9g')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664733607751516)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6rl\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664844233751516)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664966257751516)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681425683751520)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 ism\00E9rv \00E1ltal hivatkozott %1 oszlop nem \00E9rhet\0151 el, vagy nem jogosult.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492113172751465)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a megjelen\00EDtend\0151 sz\0171r\0151ket')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618672484751502)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 tal\00E1lat')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618736582751502)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 kiv\00E1lasztva')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621587830751503)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'hu'
,p_message_text=>unistr('Aktu\00E1lis sz\0171r\0151k')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497198029751466)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'hu'
,p_message_text=>unistr('Az ir\00E1ny\00EDtott keres\00E9shez sz\00FCks\00E9ges, hogy az adatforr\00E1s r\00E9gi\00F3 szint\0171 legyen.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500895448751467)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151k list\00E1ja')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679934120751520)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'hu'
,p_message_text=>unistr('A megk\00FCl\00F6nb\00F6ztet\00E9s \00E9rt\00E9kkorl\00E1tja (%0) t\00FAll\00E9pve a(z) %1 ism\00E9rvn\00E9l.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666284234751516)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 ism\00E9rv nem t\00E1mogatott sem a DATE, sem a TIMESTAMP form\00E1tum\00FA oszlopokn\00E1l.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664388702751515)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 sz\0171r\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538972964751479)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 (Alkalmazott sz\0171r\0151)')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664468603751515)
,p_name=>'APEX.FS.GO'
,p_message_language=>'hu'
,p_message_text=>unistr('Ind\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534447330751477)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'hu'
,p_message_text=>'tartalmazza ezt: %0'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665831431751516)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'hu'
,p_message_text=>unistr('egyenl\0151 ezzel: %0')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534171469751477)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'hu'
,p_message_text=>'nagyobb, mint %0'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534235365751477)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'hu'
,p_message_text=>unistr('nagyobb vagy egyenl\0151, mint %0')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533864361751477)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'hu'
,p_message_text=>'kevesebb, mint %0'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534071400751477)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'hu'
,p_message_text=>unistr('kisebb vagy egyenl\0151, mint %0')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533302768751477)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'hu'
,p_message_text=>'nem tartalmazza ezt: %0'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519112241751473)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'hu'
,p_message_text=>unistr('nem egyenl\0151 ezzel: %0')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533433065751477)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'hu'
,p_message_text=>unistr('nem ezzel kezd\0151dik: %0')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534309156751477)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'hu'
,p_message_text=>unistr('ezzel kezd\0151dik: %0')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532437220751477)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9rv kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508204180751469)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'hu'
,p_message_text=>unistr('A sz\0171r\0151 "%0" el\0151tagja \00E9rv\00E9nytelen a(z) "%1" ism\00E9rvhez.')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506651490751469)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'hu'
,p_message_text=>unistr('A sz\0171r\0151 el\0151tagja hi\00E1nyzik a(z) "%0" ism\00E9rvn\00E9l.')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540845932751479)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Oper\00E1tor')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522777436751474)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'hu'
,p_message_text=>'tartalmaz'
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521754692751473)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'hu'
,p_message_text=>unistr('egyenl\0151')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522444697751474)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'hu'
,p_message_text=>'nagyobb, mint'
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522526348751474)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'hu'
,p_message_text=>unistr('nagyobb vagy egyenl\0151')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522199170751474)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'hu'
,p_message_text=>'kisebb, mint'
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522297687751474)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'hu'
,p_message_text=>unistr('kisebb vagy egyenl\0151')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533237008751477)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'hu'
,p_message_text=>'nem tartalmaz'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521993413751474)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'hu'
,p_message_text=>unistr('nem egyenl\0151')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533179923751477)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'hu'
,p_message_text=>unistr('nem ezzel kezd\0151dik')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139522657617751474)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'hu'
,p_message_text=>unistr('ezzel kezd\0151dik')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541270673751479)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('A Beviteli mez\0151 ism\00E9rv\00E9n\00E9l nem t\00E1mogatott a(z) %0 adatt\00EDpusa (%1).')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508118538751469)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" sz\0171r\0151 nem t\00E1mogatott a(z) "%1" ism\00E9rvn\00E9l (adatt\00EDpus: %2).')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540722398751479)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666085457751516)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 ism\00E9rv r\00E9sz\00E9re nem lett biztos\00EDtva keres\00E9si oszlop')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492295174751465)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'hu'
,p_message_text=>unistr('Tov\00E1bbi sz\0171r\0151k')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618852003751502)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'hu'
,p_message_text=>unistr('Tartom\00E1ny kezdete')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665559884751516)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'hu'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665611563751516)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'hu'
,p_message_text=>'%0 felett'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665785904751516)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'hu'
,p_message_text=>'%0 alatt'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618925553751502)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'hu'
,p_message_text=>unistr('Tartom\00E1ny v\00E9ge')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683504116751521)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 ism\00E9rvn\00E9l \00E9rv\00E9nytelen az \00E9rt\00E9klista #%2 ("%1") eleme (hi\00E1nyzik a "|" elv\00E1laszt\00F3).')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665913546751516)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelenleg a(z) %0 tartom\00E1nyi ism\00E9rvhez nem t\00E1mogatott a manu\00E1lis adatbevitel, mivel az oszlop DATE vagy TIMESTAMP form\00E1tum\00FA.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665244267751516)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'hu'
,p_message_text=>'eddig:'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528851604751476)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagram elt\00E1vol\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615258719751501)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Vissza\00E1ll\00EDt\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664673224751515)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664560226751515)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s...')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665496913751516)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'hu'
,p_message_text=>unistr('- Kijel\00F6l\00E9s -')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528693514751475)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagram megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665000350751516)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kevesebb megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665194535751516)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'hu'
,p_message_text=>unistr('Mind megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139665399698751516)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 csillag vagy t\00F6bb')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620539509751503)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\00E9si javaslatok')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666148210751516)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('A sz\00F6vegmez\0151 %0 ism\00E9rve jelenleg csak NUMBER form\00E1tum\00FA oszlopokn\00E1l t\00E1mogatott.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491648642751465)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorok teljes sz\00E1ma')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681555631751520)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 adatt\00EDpusa (%1) az ir\00E1ny\00EDtott keres\00E9sn\00E9l nem t\00E1mogatott.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611771078751500)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('Vizu\00E1lisan elrejtett c\00EDmsor')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674025185751518)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Ugr\00E1s a hib\00E1hoz')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630035050751505)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes\00EDt\00E9s.')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557906494751484)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCres fejl\00E9c')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639310484751508)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9spont becsuk\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630110476751505)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9spont.')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639252764751508)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9spont kibont\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639054108751508)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 sor t\00F6r\00F6lve')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708109453751528)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\0151 azonos\00EDt\00F3')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501073144751467)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'hu'
,p_message_text=>unistr('Bel\00E9p\00E9s a szerkeszt\00E9si m\00F3dba')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626968336751504)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Els\0151')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499807584751467)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'hu'
,p_message_text=>unistr('P\00E1rbesz\00E9dpanel elrejt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498835352751467)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Lebeg\0151 t\00FAlcsordul\00F3 tartalommal rendelkez\0151 cella')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500156676751467)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAlcsordul\00F3 tartalom megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574342738751489)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cs l\00E1bl\00E9ce')
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630306323751505)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportfejl\00E9c')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630291607751505)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Fejl\00E9c.')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627058976751504)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Utols\00F3')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501236255751467)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kil\00E9p\00E9s a szerkeszt\00E9si m\00F3db\00F3l')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525991553751475)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00F6sszes bet\00F6lt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648857286751511)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6bb megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626712339751504)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630442228751505)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'hu'
,p_message_text=>'Oldal sorai'
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539553519751479)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'hu'
,p_message_text=>'%0. oldal'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627199212751504)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'hu'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627238004751504)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'hu'
,p_message_text=>'%0 - %1 / %2'
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684105777751521)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldal kijel\00F6l\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574663652751489)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldalt\00F6rdel\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626831361751504)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524865625751474)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'hu'
,p_message_text=>unistr('Tartom\00E1ny megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558207935751484)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorok kijel\00F6l\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707943073751528)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1adva')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708066517751528)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00F3dos\00EDtva')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139716319284751531)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cssor sorrendje: %0, oszlop: %1.')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139716476859751531)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cssor sorrendje: %0.')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707839503751528)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6r\00F6lve')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630676655751505)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor fejl\00E9ce')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558105666751484)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorkijel\00F6l\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526015513751475)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 %1 kiv\00E1lasztva')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626173236751504)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 cella kijel\00F6lve')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627355903751505)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 sor kijel\00F6lve')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669432335751517)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('Mind kijel\00F6l\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562906944751486)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes sor kijel\00F6l\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639151299751508)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'hu'
,p_message_text=>'%0. oldal'
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630549817751505)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor kijel\00F6l\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630819344751506)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00F6vekv\0151 sorrend %0')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139630952913751506)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('Cs\00F6kken\0151 sorrend %0')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626266525751504)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00F6vekv\0151 sorrend')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626575755751504)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9s n\00F6vekv\0151 sorrendben %0')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626307751751504)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('Cs\00F6kken\0151 sorrend')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626671264751504)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9s cs\00F6kken\0151 sorrendben %0')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626409456751504)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9s n\00E9lk\00FCl')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492068151751465)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9si be\00E1ll\00EDt\00E1sok')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574468564751489)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1llapotikonok')
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574510186751489)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cs \00E1llapota')
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504306039751468)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'hu'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504096124751468)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'hu'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638948392751508)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszesen %0')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557760610751484)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem siker\00FClt a(z) "%0" vonatkoz\00E1s\00FA HTTP k\00E9relem.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559363431751485)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Oszlop %0'
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559594034751485)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'hu'
,p_message_text=>'Oszlop: %0, sor: %1'
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559803287751485)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1r az els\0151 oszlopon van. Oszlop: %0, sor: %1')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559716356751485)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1r az els\0151 soron van. Oszlop: %0, sor: %1')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705316571751527)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDtve %0 oszlopban \00E9s %1 sorban')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559904193751485)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1r az utols\00F3 oszlopon van. Oszlop: %0, sor: %1')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559604052751485)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1r az utols\00F3 soron van. Oszlop: %0, sor: %1')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638818493751508)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDtve %0 sorban')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559417838751485)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'hu'
,p_message_text=>'%0. sor'
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139716135990751531)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 interakt\00EDv r\00E1cs')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623289904751503)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('M\0171veletek')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624234902751504)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1ad\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624194400751504)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor hozz\00E1ad\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709775880751529)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695381894751525)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697076262751525)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'hu'
,p_message_text=>'Mind'
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654696913751513)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Minden sz\00F6vegoszlop')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655839038751513)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Alternat\00EDva')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656968148751513)
,p_name=>'APEX.IG.AND'
,p_message_language=>'hu'
,p_message_text=>unistr('\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676351629751519)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCl\00F6nb\00F6z\0151k sz\00E1ma k\00F6r\00FClbel\00FCl')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710788317751529)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCl\00F6nb\00F6z\0151k \00E1ltal\00E1nos sz\00E1ma megk\00F6zel\00EDt\0151leg')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693924664751524)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'hu'
,p_message_text=>unistr('Ter\00FClet')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695836606751525)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00F6vekv\0151')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655950576751513)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Enged\00E9lyez\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709857344751529)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'hu'
,p_message_text=>'Automatikus'
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676733944751519)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1tlag')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710450680751529)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ltal\00E1nos \00E1tlag')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693482346751524)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('A feliratok tengely\00E9nek c\00EDme')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693635245751524)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'hu'
,p_message_text=>'Tizedesjegyek'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693505832751524)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00E9rt\00E9kek tengely\00E9nek c\00EDme')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699636916751526)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00E1tt\00E9rsz\00EDn')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694068073751524)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00E1v')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651268164751512)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'hu'
,p_message_text=>unistr('ezek k\00F6z\00F6tt')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700852305751526)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'hu'
,p_message_text=>unistr('Mindkett\0151')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694183428751524)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Bubor\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624472571751504)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E9gse')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656864466751513)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kis- \00E9s nagybet\0171 megk\00FCl\00F6nb\00F6ztet\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711318435751529)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'hu'
,p_message_text=>unistr('(Kis- \00E9s nagybet\0171k megk\00FCl\00F6nb\00F6ztet\00E9se)')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682642226751521)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00F3dos\00EDt\00E1sok mentve')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624840261751504)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00E9zet megv\00E1ltoztat\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657953708751514)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'hu'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654447931751513)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'hu'
,p_message_text=>unistr('A lek\00E9rdez\00E9sben a diagramonk\00E9nti adatpontok sz\00E1ma t\00F6bb, mint a maximum: %0. Haszn\00E1ljon sz\0171r\0151t, hogy cs\00F6kkentse a rekordok sz\00E1m\00E1t az alap lek\00E9rdez\00E9sben.')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623121966751503)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagramn\00E9zet')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631599399751506)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Kit\00F6rl\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692927895751524)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Bez\00E1r\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699880183751526)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00EDnek')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677170761751519)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151n\00E9zet')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656271416751513)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Oszlop'
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623310351751503)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'hu'
,p_message_text=>'Oszlopok'
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585270971751492)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlopm\0171veletek')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585068923751492)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" oszlop m\0171veletei')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701611855751526)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlop rendeltet\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656368043751513)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszetett')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623577766751503)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00E1m\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651859377751512)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'hu'
,p_message_text=>'tartalmaz'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658190844751514)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9spont')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631360873751506)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1sol\00E1s a v\00E1g\00F3lapra')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631402834751506)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1sol\00E1s lefel\00E9')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676182865751519)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('Mennyis\00E9g')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676292049751519)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCl\00F6nb\00F6z\0151k sz\00E1ma')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710602133751529)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCl\00F6nb\00F6z\0151k \00E1ltal\00E1nos sz\00E1ma')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710589234751529)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ltal\00E1nos mennyis\00E9g')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708256387751528)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 l\00E9trehoz\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654845222751513)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'hu'
,p_message_text=>'Adatok'
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701411745751526)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Adatt\00EDpus')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701048465751526)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('D\00E1tum')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682474815751521)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen d\00E1tum \00E9rt\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652507618751512)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'hu'
,p_message_text=>'nap'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655577152751513)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett be\00E1ll\00EDt\00E1sok')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655309805751513)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Alapt\00EDpus')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624390532751504)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6rl\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702533396751527)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'hu'
,p_message_text=>unistr('Biztos, hogy szeretn\00E9 t\00F6r\00F6lni ezt a kimutat\00E1st?')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659904968751514)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658726645751514)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorok t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695974151751525)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('Cs\00F6kken\0151')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657623109751513)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9szletek')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622873782751503)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9szletes n\00E9zet')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684971908751521)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Ir\00E1ny')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657318259751513)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'hu'
,p_message_text=>'Letiltva'
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651900538751512)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'hu'
,p_message_text=>'nem tartalmaz'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652124011751512)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'hu'
,p_message_text=>unistr('nem ezzel kezd\0151dik')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694257686751524)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'hu'
,p_message_text=>unistr('Gy\0171r\0171')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658303677751514)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'hu'
,p_message_text=>unistr('Let\00F6lt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548691720751481)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'hu'
,p_message_text=>'Csak adatok'
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703570572751527)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lasszon form\00E1tumot')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563770785751486)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs enged\00E9lyezve a(z) %0 let\00F6lt\00E9si form\00E1tum.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696642334751525)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\0151 \00F6sszes\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696730879751525)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\0151 ellen\0151rz\0151 t\00F6r\00E9spont')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659805103751514)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor m\00E1sol\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658669520751514)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\0151 sorok')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623999565751504)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'hu'
,p_message_text=>unistr('Szerkeszt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695797097751525)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagram szerkeszt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576298240751489)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 szerkeszt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707193706751528)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1si szempont szerkeszt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614351185751501)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 szerkeszt\00E9si \00FCzemm\00F3dban')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589940854751494)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cs szerkeszt\00E9si \00FCzemm\00F3dban, nyomja meg \00FAjra a megtekint\00E9si \00FCzemm\00F3dra val\00F3 v\00E1lt\00E1shoz')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703195559751527)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'hu'
,p_message_text=>unistr('Titkos m\00E1solat (bcc)')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703340651751527)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCzenet')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703068867751527)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1solat (cc)')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702704558751527)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'hu'
,p_message_text=>unistr('E-mail elk\00FCldve.')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703238714751527)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00E1rgy')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702951569751527)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00EDmzett (to)')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657006164751513)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'hu'
,p_message_text=>unistr('Enged\00E9lyezett')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650250450751511)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'hu'
,p_message_text=>unistr('egyenl\0151')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657174191751513)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('Kifejez\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702125444751527)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00EDpus')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669329150751517)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'hu'
,p_message_text=>unistr('A f\00E1jl el\0151k\00E9sz\00EDtve. Kezd\0151dik a let\00F6lt\00E9s.')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631605283751506)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'hu'
,p_message_text=>unistr('Kit\00F6lt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633819514751506)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Kijel\00F6l\00E9s kit\00F6lt\00E9se ezzel')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633769855751506)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kijel\00F6l\00E9s kit\00F6lt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623413099751503)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656492880751513)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151k')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710103653751529)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151...')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696105332751525)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'hu'
,p_message_text=>unistr('Els\0151')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623653815751503)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'hu'
,p_message_text=>unistr('Visszatekint\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654991216751513)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('Form\00E1tum')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700771387751526)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'hu'
,p_message_text=>unistr('Form\00E1tummaszk')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702421067751527)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'hu'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702312687751527)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'hu'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613404011751500)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'hu'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547373454751481)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'hu'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659565784751514)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00F6gz\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657242099751513)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCggv\00E9nyek \00E9s oper\00E1torok')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694311284751524)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6lcs\00E9r')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676001164751519)
,p_name=>'APEX.IG.GO'
,p_message_language=>'hu'
,p_message_text=>unistr('Ugr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650831676751511)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'hu'
,p_message_text=>'nagyobb, mint'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650913299751511)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'hu'
,p_message_text=>unistr('nagyobb vagy egyenl\0151')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657577517751513)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cs')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622613949751503)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cs n\00E9zet')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696909933751525)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'hu'
,p_message_text=>'Csoport'
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657760385751513)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1si szempont')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622921544751503)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1s n\00E9zet')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701390065751526)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Felt\00E9tel t\00EDpusa')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700223702751526)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00EDmsor')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700436251751526)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00EDmsor igaz\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710086168751529)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705575971751528)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Adatokat k\00F6zvetlen\00FCl az interakt\00EDv adatr\00E1cson is lehet besz\00FArni, m\00F3dos\00EDtani \00E9s t\00F6r\00F6lni.</p>'),
'',
unistr('<p>\00DAj sor besz\00FAr\00E1s\00E1hoz kattintson a Sor hozz\00E1ad\00E1sa gombra.</p>'),
'',
unistr('<p>L\00E9tez\0151 adatokat a konkr\00E9t cell\00E1ra dupl\00E1n kattintva lehet szerkeszteni. Nagyobb szerkeszt\00E9si munk\00E1hoz kattintson a Szerkeszt\00E9s gombra, hogy bel\00E9pjen a szerkeszt\00E9si m\00F3dba. A szerkeszt\00E9si m\00F3dban egyszeri kattint\00E1ssal \00E9s a billenty\0171zet haszn\00E1lat\00E1val m')
||unistr('\00F3dos\00EDthatja a k\00EDv\00E1nt cell\00E1kat.</p>'),
'',
unistr('<p>A M\00F3dos\00EDt\00E1s men\00FC haszn\00E1lhat\00F3 az egyes sorok megdupl\00E1z\00E1s\00E1hoz vagy t\00F6rl\00E9s\00E9hez. A M\00F3dos\00EDt\00E1s men\00FC megjelen\00EDt\00E9s\00E9hez a jel\00F6l\0151n\00E9gyzetek bejel\00F6l\00E9s\00E9vel v\00E1laszthat ki egy vagy t\00F6bb sort.</p>'),
'',
unistr('<p>Egy kijel\00F6lt sor megdupl\00E1z\00E1s\00E1hoz kattintson a M\00F3dos\00EDt\00E1s men\00FCre, \00E9s v\00E1lassza az Ism\00E9tl\0151d\0151 sorok elemet. Egy kijel\00F6lt sor t\00F6rl\00E9s\00E9hez kattintson a M\00F3dos\00EDt\00E1s men\00FCre, \00E9s v\00E1lassza a Sor t\00F6rl\00E9se elemet.</p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707635955751528)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('Szerkeszt\00E9si lehet\0151s\00E9gek')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707729268751528)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Az interakt\00EDv r\00E1cs az adatok k\00E9szlet\00E9t kereshet\0151, testre szabhat\00F3 kimutat\00E1sk\00E9nt jelen\00EDti meg. A visszaadott rekordok korl\00E1toz\00E1sa \00E9rdek\00E9ben sz\00E1mos m\0171velet hajthat\00F3 v\00E9gre, \00E9s megv\00E1ltoztathat\00F3 az adatok megjelen\00EDt\00E9si m\00F3dja is.</p>'),
'',
unistr('<p>A Keres\00E9s mez\0151 haszn\00E1lhat\00F3 a visszaadott rekordok sz\0171r\00E9s\00E9re. A M\0171veletek men\00FCre vagy a megjelen\00EDtett oszlop Oszlopfejl\00E9c men\00FCire kattintva el\00E9rhet\0151 sz\00E1mos, a kimutat\00E1s elrendez\00E9s\00E9t m\00F3dos\00EDt\00F3 lehet\0151s\00E9g.</p>'),
'',
unistr('<p>A Kimutat\00E1s be\00E1ll\00EDt\00E1sai men\00FC haszn\00E1lhat\00F3 a kimutat\00E1son v\00E9gzett testreszab\00E1sok ment\00E9s\00E9re. A kimutat\00E1sb\00F3l sz\00E1rmaz\00F3 adatok k\00FCls\0151 f\00E1jlba is let\00F6lthet\0151k, illetve elk\00FCldhet\0151 a saj\00E1t vagy m\00E1sok e-mail-c\00EDm\00E9re.</p>'),
'',
unistr('<p>A tov\00E1bbi r\00E9szleteket l\00E1sd az <em>Oracle APEX v\00E9gfelhaszn\00E1l\00F3i \00FAtmutat\00F3j\00E1ban</em> az "Interakt\00EDv r\00E1csok haszn\00E1lata" c\00EDm alatt.')))
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707451895751528)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ttekint\00E9s')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705435643751527)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Az interakt\00EDv r\00E1cs testre szabhat\00F3, hogy az adatokat a be\00E9p\00EDtett lehet\0151s\00E9gek haszn\00E1lat\00E1val k\00FCl\00F6nb\00F6z\0151 m\00F3don jelen\00EDtse meg.</p>'),
'',
unistr('<p>Az Oszlopfejl\00E9c men\00FC vagy a M\0171veletek men\00FC haszn\00E1lhat\00F3 annak megad\00E1s\00E1ra, hogy mely oszlopok, milyen sorrendben vagy r\00F6gz\00EDtve jelenjenek meg. Meghat\00E1rozhat\00F3k az adatsz\0171r\0151k \00E9s a visszaadott adatok sorrendje is.</p>'),
'',
unistr('<p>A (Keres\00E9s mez\0151 melletti) Megtekint\00E9s gombbal el\00E9rhet olyan adatn\00E9zeteket is, amelyeket esetleg az alkalmaz\00E1s fejleszt\0151je defini\00E1lt. Emellett diagramot is l\00E9trehozhat, illetve megtekinthet egy megl\00E9v\0151t.</p>  '),
'',
unistr('<p><em>Megjegyz\00E9s: A kijel\00F6lt funkci\00F3ra vonatkoz\00F3 r\00E9szletesebb inform\00E1ci\00F3k\00E9rt kattintson a <strong>S\00FAg\00F3</strong> gombra az interakt\00EDv r\00E1cs p\00E1rbesz\00E9dpaneljein.</em></p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707561615751528)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1sk\00E9sz\00EDt\00E9si lehet\0151s\00E9gek')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658549729751514)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 az interakt\00EDv r\00E1cshoz')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704312467751527)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ez a p\00E1rbesz\00E9dpanel haszn\00E1lhat\00F3 az oszlopok \00F6sszes\00EDt\00E9s\00E9hez. Az \00F6sszes\00EDtett \00E9rt\00E9kek az adatok alatt jelennek meg, illetve ha lett Ellen\0151rz\0151 t\00F6r\00E9spont defini\00E1lva, az egyes t\00F6r\00E9spontok alatt.</p>'),
'',
unistr('<p><strong>\00D6sszes\00EDt\00E9si lista</strong><br>'),
unistr('Az \00D6sszes\00EDt\00E9si lista jelen\00EDti meg a defini\00E1lt \00F6sszes\00EDt\00E9seket. L\00E9tez\0151 \00F6sszes\00EDt\00E9st a kijel\00F6l\00E9se megsz\00FCntet\00E9s\00E9vel rejthet el.<br>'),
unistr('A Hozz\00E1ad\00E1s ( &plus; ) elemre kattintva \00FAj \00F6sszes\00EDt\00E9st hozhat l\00E9tre, a T\00F6rl\00E9s ( &minus; ) elemmel pedig elt\00E1vol\00EDthat egy l\00E9tez\0151 \00F6sszes\00EDt\00E9st.</p>'),
unistr('<p><strong>\00D6sszes\00EDt\00E9si be\00E1ll\00EDt\00E1sok</strong><br>'),
unistr('A jobb oldalon l\00E9v\0151 \0171rlapon defini\00E1lhat\00F3 az \00F6sszes\00EDt\00E9s.<br>'),
unistr('V\00E1lassza ki az Oszlop nev\00E9t \00E9s az \00D6sszes\00EDt\00E9s t\00EDpus\00E1t.<br>'),
unistr('Opcion\00E1lisan elemle\00EDr\00E1st is hozz\00E1rendelhet az \00F6sszes\00EDt\00E9shez.<br>'),
unistr('Ha Ellen\0151rz\0151 t\00F6r\00E9spontot is defini\00E1lt, akkor az <strong>\00C1tfog\00F3 \00E9rt\00E9k megjelen\00EDt\00E9se</strong> bejel\00F6l\00E9se az adatok alj\00E1n megjelen\00EDti az \00E1ltal\00E1nos \00E1tlagot, az \00F6sszeg \00E9rt\00E9k\00E9t, vagy ehhez hasonl\00F3 \00E9rt\00E9ket.</p>'),
'',
unistr('<p><em>Megjegyz\00E9s: Az \00D6sszes\00EDt\00E9s p\00E1rbesz\00E9dpanel el\00E9rhet\0151 a M\0171veletek men\00FCb\0151l vagy az oszlopfejl\00E9cre kattintva \00E9s a sum ( &sum; ) m\0171veletet v\00E1lasztva.</em></p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706588399751528)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 az \00F6sszes\00EDt\00E9shez')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705070568751527)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ezzel a p\00E1rbesz\00E9dpanellel lehet defini\00E1lni olyan diagramot, amelyik k\00FCl\00F6n adatn\00E9zetk\00E9nt jelenik meg.<br>'),
unistr('V\00E1lassza ki a diagram t\00EDpus\00E1t \00E9s a diagram jellemz\0151it.</p>'),
unistr('<p><strong>Diagramjellemz\0151k</strong><br>'),
unistr('A rendelkez\00E9sre \00E1ll\00F3 diagramjellemz\0151k k\00FCl\00F6nb\00F6z\0151ek a diagram t\00EDpus\00E1t\00F3l f\00FCgg\0151en.</p>'),
'<p>',
'<ul>',
unistr('  <li>Jel\00F6lje ki azt az oszlopot, amelyik a jellemz\0151 \00E9rt\00E9k\00E9t tartalmazza:'),
'    <ul>',
unistr('      <li>Felirat - Az egyes adatpontokhoz tartoz\00F3 sz\00F6veg.</li>'),
unistr('      <li>\00C9rt\00E9k - Az \00E1br\00E1zoland\00F3 adatok.</li>'),
unistr('      <li>Adatsorok - A t\00F6bb adatsoros dinamikus lek\00E9rdez\00E9s defini\00E1l\00E1s\00E1hoz.</li>'),
unistr('      <li>Nyit\00F3 - A r\00E9szv\00E9nyek napi nyit\00F3 \00E1ra (csak t\0151zsdei diagramn\00E1l).</li>'),
unistr('      <li>Z\00E1r\00F3 - A r\00E9szv\00E9nyek napi z\00E1r\00F3 \00E1ra (csak t\0151zsdei diagramn\00E1l).</li>'),
unistr('      <li>Max. - A legmagasabb \00E9rt\00E9k (csak tartom\00E1ny- \00E9s t\0151zsdei diagramn\00E1l).</li>'),
unistr('      <li>Min. - A legalacsonyabb \00E9rt\00E9k (csak tartom\00E1ny- \00E9s t\0151zsdei diagramn\00E1l).</li>'),
unistr('      <li>Volumen - A napi t\0151zsdei forgalom (csak t\0151zsdei diagramn\00E1l).</li>'),
unistr('      <li>C\00E9l\00E9rt\00E9k - A c\00E9l\00E9rt\00E9k (csak t\00F6lcs\00E9rdiagramn\00E1l).</li>'),
unistr('      <li>X - Az X tengely \00E9rt\00E9ke (csak bubor\00E9k- \00E9s pontdiagramn\00E1l).</li>'),
unistr('      <li>Y - Az Y tengely \00E9rt\00E9ke (csak bubor\00E9k- \00E9s pontdiagramn\00E1l).</li>'),
unistr('      <li>Z - A s\00E1v sz\00E9less\00E9ge vagy a bubor\00E9k sugara (csak s\00E1v-, bubor\00E9k- \00E9s tartom\00E1nydiagramn\00E1l).</li>'),
'    </ul>',
'  </li>',
unistr('  <li>T\00E1jol\00E1s - F\00FCgg\0151leges vagy v\00EDzszintes.</li>'),
unistr('  <li>\00D6sszevon\00E1s - Itt v\00E1laszthat\00F3 ki, hogy a diagram t\00E1rs\00EDtott \00E9rt\00E9kei hogyan legyenek \00F6sszevonva.</li>'),
unistr('  <li>Halmoz\00E1s - Adja meg, hogy az adatelemek halmozottak-e.</li>'),
unistr('  <li>Rendez\00E9si szempont - Rendez\00E9s felirat vagy \00E9rt\00E9k(ek) szerint.'),
'    <ul>',
unistr('      <li>Ir\00E1ny - Az adatok rendez\00E9se az \00E9rt\00E9k\00FCk n\00F6vekv\0151 vagy cs\00F6kken\0151 sorrendj\00E9ben.</li>'),
unistr('      <li>Null \00E9rt\00E9kek - Adja meg, hogy a null \00E9rt\00E9kes rekordok hogyan legyenek rendezve a nem null \00E9rt\00E9k\0171 rekordokhoz viszony\00EDtva.</li>'),
'    </ul>',
'  </li>',
'  <li>Tizedeshelyek</li>',
unistr('  <li>Felirattengely c\00EDme</li>'),
unistr('  <li>\00C9rt\00E9ktengely c\00EDme</li>'),
'</ul>',
'</p>'))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706984335751528)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 a diagramokhoz')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704088118751527)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ezzel a p\00E1rbesz\00E9dpanellel v\00E1laszthatja ki a megjelen\00EDtend\0151 oszlopokat \00E9s azok sorrendj\00E9t.</p>'),
'',
unistr('<p>Az oszlopot a kijel\00F6l\00E9se megsz\00FCntet\00E9s\00E9vel rejtheti el.<br>'),
unistr('Az oszlopok sorrendje a Feljebb ( &uarr; ) vagy a Lejjebb ( &darr; ) ny\00EDlra kattint\00E1ssal v\00E1ltoztathat\00F3 meg.<br>'),
unistr('A leny\00EDl\00F3ban v\00E1laszthat\00F3 ki, hogy mi legyen list\00E1zva: az \00D6sszes oszlop, a Megjelen\00EDtett vagy a Nem megjelen\00EDtett oszlopok.</p>'),
'',
unistr('<p>Ha sz\00FCks\00E9ges, az \0171rlap haszn\00E1lat\00E1val megadhatja k\00E9ppontban egy adott oszlop legkisebb sz\00E9less\00E9g\00E9t.</p>'),
'',
unistr('<p><em>Megjegyz\00E9s: A megjelen\00EDtett oszlopokat (az oszlopfejl\00E9c elej\00E9n l\00E9v\0151) fog\00F3pontra kattintva, majd az oszlop balra vagy jobbra h\00FAz\00E1s\00E1val rendezheti \00E1t. Megv\00E1ltoztathat\00F3 a megjelen\00EDtett oszlopok sz\00E9less\00E9ge is, ha a fejl\00E9cen kijel\00F6li az oszlopnevek')
||unistr(' k\00F6z\00F6tti f\00FCgg\0151leges elv\00E1laszt\00F3t, \00E9s azt jobbra vagy balra h\00FAzza.</em></p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706884378751528)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 az oszlopokhoz')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704475614751527)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Haszn\00E1lja ezt a p\00E1rbesz\00E9dpanelt, hogy defini\00E1lja azokat a tov\00E1bbi oszlopokat, amelyek alapj\00E1t a l\00E9tez\0151 oszlopokon v\00E9gzett matematikai vagy f\00FCggv\00E9ny alap\00FA sz\00E1m\00EDt\00E1sok hat\00E1rozz\00E1k meg.</p>'),
'',
unistr('<p><strong>Sz\00E1m\00EDt\00E1sok list\00E1ja</strong><br>'),
unistr('A Sz\00E1m\00EDt\00E1sok list\00E1ja jelen\00EDti meg a defini\00E1lt sz\00E1m\00EDt\00E1sokat. L\00E9tez\0151 sz\00E1m\00EDt\00E1st a kijel\00F6l\00E9se megsz\00FCntet\00E9s\00E9vel rejthet el.<br>'),
unistr('A Hozz\00E1ad\00E1s ( &plus; ) elemre kattintva \00FAj sz\00E1m\00EDt\00E1st hozhat l\00E9tre, a T\00F6rl\00E9s ( &minus; ) elemmel pedig elt\00E1vol\00EDthat egy l\00E9tez\0151 sz\00E1m\00EDt\00E1st.</p>'),
'',
unistr('<p><strong>Sz\00E1m\00EDt\00E1si be\00E1ll\00EDt\00E1sok</strong><br>'),
unistr('Az \0171rlap haszn\00E1lhat\00F3 a sz\00E1m\00EDt\00E1s defini\00E1l\00E1s\00E1hoz.<br>'),
unistr('Adja meg az oszlop olyan r\00E9szleteit, mint a fejl\00E9c \00E9s a felirat, \00E9s v\00E1lassza ki az igaz\00EDt\00E1si be\00E1ll\00EDt\00E1sokat.<br> '),
unistr('A Kifejez\00E9s sz\00F6vegter\00FCleten adja meg a sz\00E1m\00EDt\00E1shoz az oszlop(ok) \00E9s a kapcsol\00F3d\00F3 f\00FCggv\00E9nyek nev\00E9t.<br>'),
unistr('V\00E1lassza ki az \00FAj oszlop r\00E9sz\00E9re a megfelel\0151 adatt\00EDpust \00E9s az esetleg sz\00FCks\00E9ges form\00E1tummaszkot.</p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706474105751528)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 a sz\00E1m\00EDt\00E1shoz')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704759539751527)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ezzel a p\00E1rbesz\00E9dpanellel lehet ellen\0151rz\0151 t\00F6r\00E9spontot defini\00E1lni egy vagy t\00F6bb oszlopon.</p>'),
'',
unistr('<p><strong>Ellen\0151rz\0151 t\00F6r\00E9spontok list\00E1ja</strong><br>'),
unistr('Az Ellen\0151rz\0151 t\00F6r\00E9spontok list\00E1ja meghat\00E1rozott ellen\0151rz\0151 t\00F6r\00E9spontokat jelen\00EDt meg. L\00E9tez\0151 ellen\0151rz\0151 t\00F6r\00E9spontokat a kijel\00F6l\00E9s\00FCk megsz\00FCntet\00E9s\00E9vel lehet letiltani.<br>'),
unistr('A Hozz\00E1ad\00E1s ( &plus; ) elemre kattintva \00FAj oszlopot vehet be a t\00F6r\00E9spontok k\00F6z\00E9, a T\00F6rl\00E9s ( &minus; ) elemmel pedig elt\00E1vol\00EDthat egy l\00E9tez\0151 oszlopot az ellen\0151rz\0151 t\00F6r\00E9spontok k\00F6z\00FCl.<br>'),
unistr('Az oszlopok egym\00E1shoz viszony\00EDtott sorrendje a Feljebb ( &uarr; ) vagy a Lejjebb ( &darr; ) ny\00EDlra kattint\00E1ssal v\00E1ltoztathat\00F3 meg.</p>'),
'',
unistr('<p><strong>Ellen\0151rz\0151 t\00F6r\00E9spont be\00E1ll\00EDt\00E1sai</strong><br>'),
unistr('Ezzel az \0171rlappal adhat\00F3 meg, hogy melyik oszlop legyen ellen\0151rz\0151 t\00F6r\00E9spont.<br>'),
unistr('Itt jel\00F6lhet\0151 ki az ellen\0151rz\0151 t\00F6r\00E9spont oszlopa, a rendez\00E9s ir\00E1nya \00E9s az, hogy hogyan rendezend\0151k a null \00E9rt\00E9k\0171 oszlopok (az \00E9rt\00E9k n\00E9lk\00FCli oszlopok).</p>'),
'',
unistr('<p><em>Megjegyz\00E9s: Interakt\00EDv r\00E1cs megtekint\00E9sekor az ellen\0151rz\0151 t\00F6r\00E9spont az Oszlopfejl\00E9c men\00FCre kattint\00E1ssal defini\00E1lhat\00F3, \00E9s az ellen\0151rz\0151 t\00F6r\00E9spont ikonj\00E1nak kiv\00E1laszt\00E1s\00E1val.</em></p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706193757751528)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 az ellen\0151rz\0151 t\00F6r\00E9sponthoz')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704943514751527)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ezzel a p\00E1rbesz\00E9dpanellel az \00F6sszes aktu\00E1lis sor let\00F6lthet\0151 egy k\00FCls\0151 f\00E1jlba. A f\00E1jl csak a let\00F6lt\00E9sekor az adatokra vonatkoz\00F3 sz\0171r\0151k \00E9s sorrendek haszn\00E1lat\00E1val megjelen\00EDtett oszlopokat fogja tartalmazni.</p>'),
'',
unistr('<p>Jel\00F6lje ki a f\00E1jl form\00E1tum\00E1t, \00E9s kattintson a Let\00F6lt\00E9s gombra.<br>'),
unistr('Megjegyz\00E9s: A CSV nem fogja tartalmazni az olyan form\00E1z\00E1sokat, mint az \00F6sszes\00EDt\00E9sek \00E9s az ellen\0151rz\0151 t\00F6r\00E9spontok.</p>'),
'',
unistr('<p>A f\00E1jl e-mailk\00E9nt tov\00E1bb\00EDt\00E1s\00E1hoz v\00E1lassza a K\00FCld\00E9s e-mailk\00E9nt lehet\0151s\00E9get, \00E9s adja meg a k\00FCld\00E9si adatokat (C\00EDmzett, T\00E1rgy \00E9s \00DCzenet).</p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705926802751528)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 let\00F6lt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704181144751527)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ez a p\00E1rbesz\00E9dpanel haszn\00E1lhat\00F3 olyan adatsz\0171r\0151k konfigur\00E1l\00E1s\00E1hoz, amelyek cs\00F6kkentik a visszaadott sorok sz\00E1m\00E1t.</p>'),
'',
unistr('<p><strong>Sz\0171r\0151lista</strong><br>'),
unistr('A Sz\0171r\0151lista sorolja fel a defini\00E1lt sz\0171r\0151ket. Adott l\00E9tez\0151 sz\0171r\0151 letilthat\00F3, ha megsz\00FCnteti a kijel\00F6l\00E9s\00E9t.<br>'),
unistr('A Hozz\00E1ad\00E1s ( &plus; ) elemre kattintva \00FAj sz\0171r\0151t hozhat l\00E9tre, a T\00F6rl\00E9s ( &minus; ) elemmel pedig elt\00E1vol\00EDthat egy megl\00E9v\0151 sz\0171r\0151t.</p>'),
'',
unistr('<p><strong>Sz\0171r\0151be\00E1ll\00EDt\00E1sok</strong><br>'),
unistr('Ezen az \0171rlapon hat\00E1rozhat\00F3k meg a sz\0171r\0151 be\00E1ll\00EDt\00E1sai.<br>'),
unistr('A megfelel\0151 sz\0171r\00E9si t\00EDpus kiv\00E1laszt\00E1sa:<br>'),
unistr('&nbsp;&nbsp;&nbsp;Sor - elv\00E9gzi a kifejez\00E9s szerinti sz\0171r\00E9st minden sz\0171rhet\0151 oszlopban.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Oszlop - konkr\00E9t oszlopra sz\0171r a megadott oper\00E1tor \00E9s \00E9rt\00E9k alapj\00E1n.</p>'),
'',
unistr('<p><em>Megjegyz\00E9s: Interakt\00EDv r\00E1cs megtekint\00E9sekor a sorsz\0171r\00E9sek k\00F6zvetlen\00FCl a Keres\00E9s mez\0151be \00EDr\00E1ssal defini\00E1lhat\00F3k. Kattintson az Oszlopok kijel\00F6l\00E9se keres\00E9shez lehet\0151s\00E9gre, hogy a keres\00E9st korl\00E1tozza egy konkr\00E9t oszlopra. M\00E1sik m\00F3d lehet, hogy megn')
||unistr('yitja az Oszlopfejl\00E9c men\00FCt, \00E9s kiv\00E1laszt egy \00E9rt\00E9ket, hogy az legyen az oszlop sz\0171r\0151je.</em></p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706779355751528)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 a sz\0171r\0151kh\00F6z')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704541074751527)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ezzel a p\00E1rbesz\00E9dpanellel \00FAgy tekintheti meg az adatokat, ahogy azok egy kor\00E1bbi id\0151pontban l\00E9teztek.</p>'),
unistr('<p>A visszatekint\0151 (flashback) lek\00E9rdez\00E9s v\00E9grehajt\00E1s\00E1hoz adja meg az elm\00FAlt percek sz\00E1m\00E1t.</p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706317997751528)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 a visszatekint\00E9shez')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707089575751528)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 a csoportos\00EDt\00E1shoz')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704688932751527)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ez a p\00E1rbesz\00E9dpanel haszn\00E1lhat\00F3 a megadott felt\00E9telen alapul\00F3 sorok \00E9s oszlopok kiemel\00E9s\00E9re.</p>'),
'',
unistr('<p><strong>Kiemel\00E9si lista</strong><br>'),
unistr('A Kiemel\00E9si lista jelen\00EDti meg a megadott kiemel\00E9seket. Megl\00E9v\0151 kiemel\00E9st a kijel\00F6l\00E9se megsz\00FCntet\00E9s\00E9vel rejthet el.<br>'),
unistr('\00DAj kiemel\00E9s l\00E9trehoz\00E1s\00E1hoz kattintson a Hozz\00E1ad\00E1s ( &plus; ), a megl\00E9v\0151 t\00F6rl\00E9s\00E9hez pedig a T\00F6rl\00E9s ( &minus; ) gombra.</p>'),
'',
unistr('<p><strong>Kiemel\00E9si be\00E1ll\00EDt\00E1sok</strong><br>'),
unistr('A kiemel\00E9si tulajdons\00E1gok meghat\00E1roz\00E1s\00E1hoz ez az \0171rlap haszn\00E1lhat\00F3.<br>'),
unistr('Adja meg a nevet, jel\00F6lje ki a Sort vagy Oszlopot, \00E9s v\00E1lassza ki a h\00E1tt\00E9r \00E9s a sz\00F6veg HTML sz\00EDnk\00F3dj\00E1t.<br>'),
unistr('A <strong>Felt\00E9tel t\00EDpusa</strong> kiv\00E1laszt\00E1s\00E1val adhat\00F3k meg a kiemelend\0151 konkr\00E9t adatok:<br>'),
unistr('&nbsp;&nbsp;&nbsp;Sor - a kifejez\00E9st emeli ki az oszlopban.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Oszlop - konkr\00E9t oszlopban a megadott oper\00E1tor \00E9s \00E9rt\00E9k alapj\00E1n v\00E9gzi el a kiemel\00E9st.</p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706209020751528)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 a kiemel\00E9shez')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704833996751527)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ez a p\00E1rbesz\00E9dpanel haszn\00E1lhat\00F3 a r\00E1cs aktu\00E1lis elrendez\00E9s\00E9nek \00E9s konfigur\00E1l\00E1s\00E1nak ment\00E9s\00E9hez.<br>'),
unistr('Az alkalmaz\00E1sfejleszt\0151k t\00F6bb k\00FCl\00F6nb\00F6z\0151 kimutat\00E1s-elrendez\00E9st is kialak\00EDthatnak. Ahol megengedett, \00D6n vagy m\00E1s v\00E9gfelhaszn\00E1l\00F3k menthetnek egy kimutat\00E1st Nyilv\00E1nosk\00E9nt is, ami azt jelenti, hogy a kimutat\00E1s a r\00E1cs t\00F6bbi felhaszn\00E1l\00F3ja sz\00E1m\00E1ra is el\00E9rhet\0151')
||unistr('. A kimutat\00E1s menthet\0151 olyan priv\00E1t, bels\0151 haszn\00E1lat\00FA kimutat\00E1sk\00E9nt is, amelyiket csak \00D6n l\00E1t.</p>'),
unistr('<p>V\00E1lasszon az el\00E9rhet\0151 t\00EDpusok k\00F6z\00FCl, \00E9s adja meg a menteni k\00EDv\00E1nt kimutat\00E1s nev\00E9t.</p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706092102751528)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 a kimutat\00E1shoz')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139704203354751527)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ez a p\00E1rbesz\00E9dpanel haszn\00E1lhat\00F3 a megjelen\00EDt\00E9si sorrend be\00E1ll\00EDt\00E1s\00E1hoz.</p>'),
'',
unistr('<p><strong>Rendez\00E9si lista</strong><br>'),
unistr('A rendez\00E9si lista jelen\00EDti meg a konfigur\00E1lt rendez\00E9si szab\00E1lyokat.<br>'),
unistr('Rendez\00E9si oszlop list\00E1ba helyez\00E9s\00E9hez kattintson a Hozz\00E1ad\00E1s ( &plus; ), a list\00E1b\00F3l t\00F6rl\00E9shez pedig a T\00F6rl\00E9s ( &minus; ) gombra.<br>'),
unistr('Kattintson a Feljebb ( &uarr; ) vagy a Lejjebb ( &darr; ) ny\00EDlra hogy a kijel\00F6lt rendez\00E9si oszlopot a list\00E1ban a t\00F6bbihez k\00E9pest feljebb vagy lejjebb helyezze el.</p>'),
'',
unistr('<p><strong>Rendez\00E9si be\00E1ll\00EDt\00E1sok</strong><br>'),
unistr('Itt jel\00F6lhet\0151 ki a rendez\00E9s oszlopa, ir\00E1nya \00E9s az, hogy hogyan rendezend\0151k a null \00E9rt\00E9k\0171 oszlopok (az \00E9rt\00E9k n\00E9lk\00FCli oszlopok).</p>'),
'',
unistr('<p><em>Megjegyz\00E9s: Az adatok a nem megjelen\00EDtett oszlopok szerint is sorba rendezhet\0151k; azonban nem minden oszlop rendezhet\0151 sorba.</em><br>'),
unistr('<em>A megjelen\00EDtett oszlopok az oszlopfejl\00E9c v\00E9g\00E9n l\00E9v\0151 felfel\00E9 ny\00EDllal (n\00F6vekv\0151) vagy a lefel\00E9 ny\00EDllal (cs\00F6kken\0151) sorrendbe rakhat\00F3k. Amikor egy l\00E9tez\0151 rendez\00E9shez k\00F6vetkez\0151 oszlopot ad hozz\00E1, tartsa lenyomva a Shift billenty\0171t \00E9s kattintson a felfe')
||unistr('l\00E9 vagy a lefel\00E9 mutat\00F3 ny\00EDlra.</em></p>')))
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139706642670751528)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 a sorba rendez\00E9shez')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705817931751528)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3 az el\0151fizet\00E9shez')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659499291751514)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'hu'
,p_message_text=>unistr('Elrejt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623806074751504)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kiemel\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693021281751524)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Max.'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693865510751524)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00EDzszintes')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652433509751512)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00F3ra')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657449956751513)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'hu'
,p_message_text=>'Ikon'
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622735851751503)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Ikon n\00E9zet')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650648865751511)
,p_name=>'APEX.IG.IN'
,p_message_language=>'hu'
,p_message_text=>'ebben'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659022762751514)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'hu'
,p_message_text=>unistr('Inakt\00EDv be\00E1ll\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659139174751514)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>unistr('Inakt\00EDv be\00E1ll\00EDt\00E1sok')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666718790751516)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Az Interakt\00EDv r\00E1cs k\00E9relm\00E9nek feldolgoz\00E1sakor bels\0151 hiba t\00F6rt\00E9nt.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554633644751483)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" sz\0171r\0151t\00EDpus a(z) "%1" oszlophoz nem t\00E1mogatott.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705681020751528)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen d\00E1tumform\00E1tum')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680422118751520)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Az Interakt\00EDv r\00E1cs nem t\00E1mogatja a(z) %0 oszlopra vonatkoz\00F3 sz\0171r\0151 defini\00E1l\00E1s\00E1t.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680311444751520)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 nem megfelel\0151 sz\0171r\0151t\00EDpus az Interakt\00EDv r\00E1cs sz\0171r\0151j\00E9nek defini\00E1l\00E1s\00E1hoz.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561265232751485)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen sz\00E1mform\00E1tum')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708357993751528)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen be\00E1ll\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708495064751528)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen be\00E1ll\00EDt\00E1sok')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699501975751526)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('A Rendez\00E9si szempont be\00E1ll\00EDt\00E1sa %0, de a(z) %0 r\00E9sz\00E9re nem lett kijel\00F6lve oszlop.')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696812279751525)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen \00E9rt\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691971246751524)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'hu'
,p_message_text=>'Nem jelenik meg'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651457957751512)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('az utols\00F3ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651670776751512)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('a k\00F6vetkez\0151ben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650543787751511)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('nem \00FCres')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650454440751511)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00FCres')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700310374751526)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'hu'
,p_message_text=>'Felirat'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692367984751524)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Felirat'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696287200751525)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('Utols\00F3')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640799301751508)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 nap')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640998996751509)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 \00F3ra')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641405783751509)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 perc')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640406591751508)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 h\00F3nap')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640598363751508)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 h\00E9t')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640622378751508)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 nap')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640856141751509)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 \00F3ra')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641538673751509)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 perc')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641396448751509)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 h\00F3nap')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641249884751509)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 h\00E9t')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640237704751508)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 \00E9v')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640344267751508)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 \00E9v')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700582096751526)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'hu'
,p_message_text=>unistr('Cella igaz\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700652945751526)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoport haszn\00E1lata ehhez')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651008103751512)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'hu'
,p_message_text=>'kisebb, mint'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651135530751512)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'hu'
,p_message_text=>unistr('kisebb vagy egyenl\0151')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694493730751524)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'hu'
,p_message_text=>'Vonaldiagram'
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694560285751524)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'hu'
,p_message_text=>unistr('Grafikon \00E9s ter\00FCletdiagram')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700938656751526)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'hu'
,p_message_text=>unistr('Lista\00F6ssz.')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693179375751524)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Min.'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703432877751527)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'hu'
,p_message_text=>unistr('A c\00EDmeket pontosvessz\0151vel v\00E1lassza el')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652201378751512)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('egyezik a regul\00E1ris kifejez\00E9ssel')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676622930751519)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'hu'
,p_message_text=>'Maximum'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710978765751529)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ltal\00E1nos maximum')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676831410751519)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6z\00E9p\00E9rt\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711056512751529)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ltal\00E1nos k\00F6z\00E9p\00E9rt\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676508112751519)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'hu'
,p_message_text=>'Minimum'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652314468751512)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'hu'
,p_message_text=>'perc'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677330062751519)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('Perccel ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710877883751529)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ltal\00E1nos minimum')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652779277751512)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('h\00F3nap')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659368878751514)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adat t\00F6bb, mint %0 sort tartalmaz, ezzel t\00FAl l\00E9pte a megengedett maximumot. Haszn\00E1ljon tov\00E1bbi sz\0171r\0151ket, hogy megtekinthesse az eredm\00E9nyeket.')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685181959751522)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('A r\00E9gi\00F3 statikus azonos\00EDt\00F3j\00E1t meg kell adni, mivel az oldal t\00F6bb interakt\00EDv r\00E1csot tartalmaz.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655474127751513)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00E9v')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655693926751513)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Megnevezett kimutat\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639689433751508)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 nap')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639480139751508)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 \00F3ra')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641662543751509)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 perc')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639993355751508)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 h\00F3nap')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639839223751508)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 h\00E9t')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639770453751508)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 nap')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139639532830751508)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 \00F3ra')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641780136751509)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 perc')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641054819751509)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 h\00F3nap')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641124032751509)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 h\00E9t')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640112436751508)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 \00E9v')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139640040217751508)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 \00E9v')
,p_is_js_message=>true
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651343941751512)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'hu'
,p_message_text=>unistr('nem ezek k\00F6z\00F6tt')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650330215751511)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'hu'
,p_message_text=>unistr('nem egyenl\0151')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715189882751530)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 azonos\00EDt\00F3j\00FA r\00E9gi\00F3 nem interakt\00EDv r\00E1csos r\00E9gi\00F3, vagy nem l\00E9tezik a(z) %1 alkalmaz\00E1sban.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650737911751511)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'hu'
,p_message_text=>'nem ebben'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651518708751512)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('nem az utols\00F3ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139651764883751512)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('nem a k\00F6vetkez\0151ben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659226796751514)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 adat')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696055191751525)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'hu'
,p_message_text=>unistr('Null \00E9rt\00E9k\0171ek')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701139946751526)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'hu'
,p_message_text=>'Numerikus'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696330297751525)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'hu'
,p_message_text=>'Ki'
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696468018751525)
,p_name=>'APEX.IG.ON'
,p_message_language=>'hu'
,p_message_text=>'Be'
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649530931751511)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('1 perccel ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703976595751527)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00EDnv\00E1laszt\00F3 megnyit\00E1sa: %0')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692812656751524)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Megnyit\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656586463751513)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Oper\00E1tor')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692229662751524)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00E1jol\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694626826751524)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6rdiagram')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139657819907751514)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'hu'
,p_message_text=>unistr('Elforgat\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623087334751503)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Megtekint\00E9s kimutat\00E1sk\00E9nt')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703809604751527)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00E9rt\00E9keket egym\00E1st\00F3l "%0" karakterrel v\00E1lassza el.')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694780234751524)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Pol\00E1r')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700066424751526)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6zepe')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139700119321751526)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E9ge')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699948274751526)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'hu'
,p_message_text=>'Eleje'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655762468751513)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'hu'
,p_message_text=>unistr('Els\0151dleges')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656010623751513)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('Els\0151dleges alap\00E9rtelmez\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672575909751518)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Els\0151dleges kimutat\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546142089751481)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'hu'
,p_message_text=>unistr('El\00E9rhet\0151s\00E9gi c\00EDmk\00E9kkel egy\00FCtt')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543567499751480)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'hu'
,p_message_text=>unistr('Fekv\0151')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543665305751480)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ll\00F3')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543457505751480)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldal t\00E1jol\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543395908751480)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'hu'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543268530751480)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'hu'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546394789751481)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'hu'
,p_message_text=>unistr('Egy\00E9ni')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543081189751480)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'hu'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542925883751480)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'hu'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543194512751480)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'hu'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542850646751480)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldalm\00E9ret')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508442272751470)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'hu'
,p_message_text=>unistr('Rich Text lefejt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694827640751524)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Sug\00E1r')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139694979060751524)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Tartom\00E1ny')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705193312751527)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'hu'
,p_message_text=>unistr('Friss\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660010396751514)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor friss\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658871263751514)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorok friss\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664048490751515)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 alkalmaz\00E1s, %1 lapj\00E1n \00E9s %2 r\00E9gi\00F3j\00E1ban nem l\00E9tezik az interakt\00EDv r\00E1csos r\00E9gi\00F3.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624579796751504)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 elt\00E1vol\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655107187751513)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714381501751530)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s t\00F6r\00F6lve')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714067302751530)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alternat\00EDv kimutat\00E1s mentve lett az \00F6sszes felhaszn\00E1l\00F3 sz\00E1m\00E1ra')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713998547751530)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alap\00E9rtelmezett kimutat\00E1s mentve lett az \00F6sszes felhaszn\00E1l\00F3 sz\00E1m\00E1ra')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714278981751530)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nyilv\00E1nos kimutat\00E1s mentve')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714112173751530)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'hu'
,p_message_text=>unistr('A nyilv\00E1nos kimutat\00E1s mentve lett az \00F6sszes felhaszn\00E1l\00F3 sz\00E1m\00E1ra')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139664133769751515)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik a(z) %0 nev\0171 mentett interakt\00EDv r\00E1cs.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649433105751511)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 perccel kor\00E1bbi r\00E1csadatok')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649398524751511)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('1 perccel kor\00E1bbi r\00E1csadatok')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584835935751492)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik interakt\00EDv r\00E1csos kimutat\00E1s.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707361585751528)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s - Szerkeszt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663942788751515)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik a(z) %0 azonos\00EDt\00F3j\00FA mentett interakt\00EDv r\00E1cs.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139707236979751528)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s - Ment\00E9s m\00E1sk\00E9nt')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624618124751504)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cs be\00E1ll\00EDt\00E1sai')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715299843751530)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik a(z) %0 statikus azonos\00EDt\00F3j\00FA mentett interakt\00EDv r\00E1cs.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710251090751529)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1sn\00E9zet')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139623784196751503)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Vissza\00E1ll\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660119853751514)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00F3dos\00EDt\00E1sok vissza\00E1ll\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658942955751514)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorok vissza\00E1ll\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656197507751513)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'hu'
,p_message_text=>'Sor'
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655031091751513)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'hu'
,p_message_text=>'Sor/oldal'
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714846698751530)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorm\0171veletek')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139716067141751531)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'hu'
,p_message_text=>unistr('M\0171veletek a(z) %0. sorhoz')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624098869751504)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ment\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669194021751517)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'hu'
,p_message_text=>'mentve'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573721519751489)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s elmentve: %0')
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622262207751503)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Mentett kimutat\00E1sok')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622327468751503)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595842640751495)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1r l\00E9tezik %0 nev\0171 mentett kimutat\00E1s. Adjon meg egy \00FAj nevet.')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622409389751503)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Szem\00E9lyes')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622544938751503)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'hu'
,p_message_text=>unistr('Nyilv\00E1nos')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709978134751529)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ment\00E9s m\00E1sk\00E9nt')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658208271751514)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1si be\00E1ll\00EDt\00E1sok ment\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695064355751524)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'hu'
,p_message_text=>'Pontdiagram'
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622163700751503)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702286667751527)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s: Minden sz\00F6vegoszlop')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139622048443751503)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s: %0')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701556011751526)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Teljes sz\00F6veges keres\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649270370751511)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'hu'
,p_message_text=>unistr('''%0'' keres\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691628992751523)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'hu'
,p_message_text=>unistr('- Kijel\00F6l\00E9s -')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631730917751506)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Kijel\00F6l\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684883077751521)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Jel\00F6lj\00F6n ki 1 sort a f\00F6l\00E9rendelt r\00E9gi\00F3ban')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621962200751503)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Jel\00F6lj\00F6n ki oszlopokat a keres\00E9shez')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714518650751530)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kijel\00F6l\00E9si m\0171veletek')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631954731751506)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'hu'
,p_message_text=>unistr('Cellakijel\00F6l\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631863952751506)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorkijel\00F6l\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702892813751527)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCld\00E9s e-mailk\00E9nt')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695416687751525)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Adatsor'
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619642707751502)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674815702751518)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1tfog\00F3 \00E9rt\00E9k megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659790934751514)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Egysoros megtekint\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658056263751514)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695581896751525)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9si szempont')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714980143751530)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszloponk\00E9nt csak egy sorrend defini\00E1lhat\00F3.')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714711946751530)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00F3dos\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139696527891751525)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'hu'
,p_message_text=>'Verem'
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652087025751512)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'hu'
,p_message_text=>unistr('ezzel kezd\0151dik')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695187431751524)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'hu'
,p_message_text=>unistr('T\0151zsdei')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614497760751501)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlopsz\00E9less\00E9g ny\00FAjt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139658445908751514)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151fizet\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139676482932751519)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszesen')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139716264232751531)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'hu'
,p_message_text=>unistr('Interakt\00EDv r\00E1cs. Kimutat\00E1s: %0, N\00E9zet: %1.')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139710388306751529)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ltal\00E1nos \00F6sszesen')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693308069751524)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00E9l')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699728112751526)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00F6vegsz\00EDn')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624788368751504)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506813166751469)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cs')
,p_is_js_message=>true
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674724111751518)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'hu'
,p_message_text=>unistr('Elemle\00EDr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139655296733751513)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00EDpus')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139659671029751514)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'hu'
,p_message_text=>unistr('Felold\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656745383751513)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'hu'
,p_message_text=>unistr('Egys\00E9g')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702648118751527)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'hu'
,p_message_text=>unistr('Vannak nem mentett v\00E1ltoztat\00E1sok. Folytatja?')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139656696016751513)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692409574751524)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9k')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697378200751525)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6telez\0151 \00E9rt\00E9ket megadni.')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682580936751521)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9k (az id\0151z\00F3na nem v\00E1ltoztathat\00F3 meg)')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701246346751526)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00F6veg')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693782652751524)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCgg\0151leges')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654736382751513)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Megtekint\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589867231751493)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E1cs megtekint\00E9si \00FCzemm\00F3dban, nyomja meg a szerkeszt\00E9shez')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691728648751523)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDtve')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139693217479751524)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6tet')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652609690751512)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('h\00E9t')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691836626751523)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'hu'
,p_message_text=>unistr('Minim\00E1lis oszlopsz\00E9less\00E9g')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643805289751509)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 %1 \00E9s %2 k\00F6z\00F6tti')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643559535751509)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'hu'
,p_message_text=>'%0 ezt tartalmazza: %1'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643678301751509)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'hu'
,p_message_text=>'%0 nem tartalmazza ezt: %1'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619010649751502)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem ezzel kezd\0151dik: %1')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642393056751509)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 egyenl\0151 %1')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642522849751509)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'hu'
,p_message_text=>'%0 nagyobb, mint %1'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642646891751509)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nagyobb vagy egyenl\0151 %1')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643384311751509)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'hu'
,p_message_text=>'%0 ebben: %1'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644511824751510)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt %1 napon')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644351506751510)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 elm\00FAlt %1 \00F3r\00E1ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644183765751509)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt %1 percben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644976234751510)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt %1 h\00F3napban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644728144751510)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt %1 h\00E9ten')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645120784751510)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt %1 \00E9vben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644477567751510)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt napon')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644292532751510)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 elm\00FAlt \00F3r\00E1ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644063356751509)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt percben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644837514751510)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt h\00F3napban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139644604685751510)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt h\00E9ten')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645031964751510)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 az elm\00FAlt \00E9vben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646924983751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 %1 napon')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646702638751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 %1 \00F3r\00E1ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646518733751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 %1 percben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647390412751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 %1 h\00F3napban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647148165751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 %1 h\00E9ten')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647550375751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 %1 \00E9vben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646830715751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 napon')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646605984751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 \00F3r\00E1ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646417171751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 percben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647212357751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 h\00F3napban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647086377751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 h\00E9ten')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647436600751510)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 \00E9vben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643096074751509)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem \00FCres')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642902569751509)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00FCres')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642711645751509)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'hu'
,p_message_text=>'%0 kisebb, mint %1'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642857766751509)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 kisebb vagy egyenl\0151 %1')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643114773751509)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'hu'
,p_message_text=>'%0 olyan, mint %1'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643706928751509)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 egyezik a regul\00E1ris kifejez\00E9ssel: %1')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649602438751511)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 perccel ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643917546751509)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem %1 \00E9s %2 k\00F6z\00F6tti')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642490188751509)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem egyenl\0151 ezzel: %1')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643447859751509)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'hu'
,p_message_text=>'%0 nem ebben: %1'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645768169751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt %1 napon')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645577274751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt %1 \00F3r\00E1ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645393179751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt %1 percben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646163213751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt %1 h\00F3napban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645925968751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt %1 h\00E9ten')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646316577751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt %1 \00E9vben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645684704751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt napon')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645498136751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt \00F3r\00E1ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645257159751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt percben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646040126751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt h\00F3napban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139645895895751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt h\00E9ten')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139646277758751510)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem az elm\00FAlt \00E9vben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648178104751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 %1 napon')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647913703751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 %1 \00F3r\00E1ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647702389751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 %1 percben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648552548751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 %1 h\00F3napban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648385017751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 %1 h\00E9ten')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648772484751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 %1 \00E9vben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648013215751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 napon')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647864190751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 \00F3r\00E1ban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139647615356751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151 percben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648419766751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 h\00F3napban')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648216567751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 h\00E9ten')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648694013751511)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151 \00E9vben')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139643238779751509)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'hu'
,p_message_text=>'%0 nem olyan, mint %1'
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650144918751511)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 ezzel kezd\0151dik: %1')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692500732751524)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'hu'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652884840751512)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00E9v')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692636480751524)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692723771751524)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701791886751526)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'hu'
,p_message_text=>unistr('2016. janu\00E1r 12., h\00E9tf\0151')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701815468751526)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'hu'
,p_message_text=>unistr('Janu\00E1r')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139701925117751526)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'hu'
,p_message_text=>unistr('16 \00F3r\00E1val ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139702002411751526)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'hu'
,p_message_text=>unistr('16 \00F3r\00E1n bel\00FCl')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520014561751473)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'hu'
,p_message_text=>'Alkalmaz'
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512057569751471)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>H\00FAzza \00E1t a k\00E9pet, \00E9s haszn\00E1lja a nagy\00EDt\00E1si cs\00FAszk\00E1t a keretben t\00F6rt\00E9n\0151 \00E1thelyez\00E9s\00E9hez.</p>'),
'',
unistr('<p>A k\00E9p k\00F6r\00FClv\00E1g\00E1s\00E1ra f\00F3kusz\00E1l\00E1skor a k\00F6vetkez\0151 billenty\0171parancsok haszn\00E1lhat\00F3k:</p>'),
'<ul>',
unistr('    <li>Balra mutat\00F3 ny\00EDl: K\00E9p \00E1thelyez\00E9se balra*</li>'),
unistr('    <li>Felfel\00E9 mutat\00F3 ny\00EDl: K\00E9p \00E1thelyez\00E9se felfel\00E9*</li>'),
unistr('    <li>Jobbra mutat\00F3 ny\00EDl: K\00E9p \00E1thelyez\00E9se jobbra*</li>'),
unistr('    <li>Lefel\00E9 mutat\00F3 ny\00EDl: K\00E9p \00E1thelyez\00E9se lefel\00E9*</li>'),
unistr('    <li>I: Nagy\00EDt\00E1s</li>'),
unistr('    <li>O: Kicsiny\00EDt\00E9s</li>'),
unistr('    <li>L: Elforgat\00E1s balra</li>'),
unistr('    <li>R: Elforgat\00E1s jobbra</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*A gyorsabb \00E1thelyez\00E9shez tartsa lenyomva a Shift billenty\0171t</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512280301751471)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9p k\00F6r\00FClv\00E1g\00E1sa - s\00FAg\00F3')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520120001751473)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Vissza\00E1ll\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512588866751471)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9p k\00F6r\00FClv\00E1g\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520228291751473)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('A cs\00FAszka mozgat\00E1s\00E1val m\00F3dos\00EDtsa a nagy\00EDt\00E1si szintet')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549883332751482)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen f\00E1jlt\00EDpus. A t\00E1mogatott f\00E1jlt\00EDpusok: %0.')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684287174751521)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'hu'
,p_message_text=>unistr('Tall\00F3z\00E1s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683932776751521)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00E1jl kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684019324751521)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00E1jlok kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549676538751482)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1thelyez\00E9s h\00FAz\00E1ssal')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550019621751482)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00E1jlok \00E1th\00FAz\00E1sa')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551401588751482)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a f\00E1jlt, vagy h\00FAzza \00E1t ide.')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551560819751482)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a f\00E1jlokat, vagy h\00FAzza \00E1t ide.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551642333751482)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a f\00E1jlt, vagy h\00FAzza \00E1t ide.')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551733335751482)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a f\00E1jlokat, vagy h\00FAzza \00E1t ide.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549915584751482)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 f\00E1jl')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549760697751482)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAl nagy a f\00E1jl. A megengedett maxim\00E1lis m\00E9ret %0.')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530223014751476)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6bb f\00E1jl felt\00F6lt\00E9se nem t\00E1mogatott.')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513156569751471)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Elt\00E1vol\00EDt\00E1s')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518622181751473)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00EDm sz\00FCks\00E9ges.')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517503113751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'hu'
,p_message_text=>unistr('Telep\00FCl\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517937198751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'hu'
,p_message_text=>unistr('Orsz\00E1gk\00F3d')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517644417751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00E1zsz\00E1m')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518510081751473)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00F6ldrajzi sz\00E9less\00E9g')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518407622751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00F6ldrajzi hossz\00FAs\00E1g')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518330624751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDt\00E9s t\00E9rk\00E9pen')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518040114751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'hu'
,p_message_text=>unistr('Pontsz\00E1m')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517742233751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ir\00E1ny\00EDt\00F3sz\00E1m')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517810796751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1llapot')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517401928751472)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'hu'
,p_message_text=>'Utca'
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517306510751472)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Geok\00F3dol\00E1si eredm\00E9nyek')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548825208751481)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00F6ldrajzi k\00F3d megadva')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548922331751481)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs megadva f\00F6ldrajzi k\00F3d')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518269789751472)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00E9rk\00E9p')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518197135751472)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 c\00EDm.')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518777933751473)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 megad\00E1sa k\00F6telez\0151.')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139624921916751504)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 vagy %1 megad\00E1sa k\00F6telez\0151.')
,p_is_js_message=>true
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714430782751530)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3sz\00F6veg megtekint\00E9se ehhez: %0.')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520442824751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9p kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520555075751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9pek kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520317483751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Let\00F6lt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520684791751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1thelyez\00E9s h\00FAz\00E1ssal')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520734457751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9pek \00E1th\00FAz\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520863330751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a k\00E9pet, vagy h\00FAzza \00E1t ide.')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139520948822751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a k\00E9peket, vagy h\00FAzza \00E1t ide.')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521086225751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a k\00E9pet, vagy h\00FAzza \00E1t ide.')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521130320751473)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lassza ki a k\00E9peket, vagy h\00FAzza \00E1t ide.')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605823122751498)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'hu'
,p_message_text=>unistr('Bejel\00F6lve')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605910372751498)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs bejel\00F6lve')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633403363751506)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCres \00EDr\00E1sv\00E9dett kombin\00E1lt lista')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631285016751506)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCres \00EDr\00E1sv\00E9dett listamez\0151')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631011682751506)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'hu'
,p_message_text=>unistr('\00CDr\00E1sv\00E9dett kombin\00E1lt lista')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139631124272751506)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'hu'
,p_message_text=>unistr('\00CDr\00E1sv\00E9dett listamez\0151')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546828578751481)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# nincs a(z) %0 \00E9s %1 \00E9rv\00E9nyes tartom\00E1ny\00E1ban.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546913814751481)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# nem a(z) %0 t\00F6bbsz\00F6r\00F6se.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634293911751507)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'hu'
,p_message_text=>unistr('\00CDr\00E1sv\00E9dett kapcsol\00F3')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574898735751489)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'hu'
,p_message_text=>unistr('\00CDr\00E1sv\00E9dett szerkeszt\00E9s hivatkoz\00E1ssal')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546487041751481)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# csak a(z) %0 \00E9s %1 \00E9rt\00E9keinek megfelel\0151 lehet.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546646905751481)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'hu'
,p_message_text=>'Nem'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632960002751506)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'hu'
,p_message_text=>'Ki'
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633050709751506)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'hu'
,p_message_text=>'Be'
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546580758751481)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'hu'
,p_message_text=>'Igen'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554415673751483)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Nyelvv\00E1laszt\00F3')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490823378751464)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'hu'
,p_message_text=>unistr('Bejegyz\00E9s hozz\00E1ad\00E1sa')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667645331751516)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1ad\00E1s')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667743165751516)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Elt\00E1vol\00EDt\00E1s')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490967424751464)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'hu'
,p_message_text=>unistr('Kiv\00E1lasztott bejegyz\00E9sek')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671465159751517)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'hu'
,p_message_text=>unistr('Speci\00E1lis')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671753591751518)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E9gse')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671594182751518)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ltal\00E1nos')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671832266751518)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9l\0151 sablon be\00E1ll\00EDt\00E1sai')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672409766751518)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem \00E9rhet\0151k el a sablonm\0171veletek, mert ez az \00F6sszetev\0151 nincs megjelen\00EDtve az oldalon.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671368679751517)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 sablonbe\00E1ll\00EDt\00E1s.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671691400751518)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ment\00E9s')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525401638751475)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6r t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527810070751475)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'hu'
,p_message_text=>unistr('Az Egy\00E9ni st\00EDlusok nem \00E9rv\00E9nyes JSON.')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525789586751475)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00E1vols\00E1g eszk\00F6z')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525507481751475)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6r rajzol\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505308277751469)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'hu'
,p_message_text=>'Jelenlegi hely'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511732209751471)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelenek a kiindul\00E1si poz\00EDci\00F3 koordin\00E1t\00E1i.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500760953751467)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('A kezd\0151 poz\00EDci\00F3 csak pontgeometriai lehet.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509302785751470)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'hu'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504531862751468)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9teg')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674982692751519)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9teg: %0')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523718144751474)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'hu'
,p_message_text=>unistr('Lek\00E9pez\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493480292751465)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCzenetek')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509546454751470)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'hu'
,p_message_text=>unistr('m\00E9rf\00F6ld')
,p_is_js_message=>true
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673942862751518)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adat t\00F6bb, mint %0 sort tartalmaz, ezzel t\00FAll\00E9pte a megengedett maximumot. ')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503888837751468)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Felt\00E9telek</a> &nbsp;&nbsp; T\00E9rk\00E9padatok &copy; 2021 HERE')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500401282751467)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ebben az adatb\00E1zisban az SDO_GEOMETRY adatt\00EDpus nem \00E9rhet\0151 el.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503902528751468)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap k\00F6zrem\0171k\00F6d\0151k </a>')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528537901751475)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap k\00F6zrem\0171k\00F6d\0151k </a>')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504771247751468)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'hu'
,p_message_text=>'Pontok'
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675089404751519)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'hu'
,p_message_text=>'%0 pont'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525649667751475)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00E9gyzetes nagy\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525311727751475)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Elt\00E1vol\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505133944751469)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9szak szerinti t\00E1jol\00E1s vissza\00E1ll\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619954930751502)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lt\00E1s 2-dimenzi\00F3s m\00F3dra')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620028473751502)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lt\00E1s 3-dimenzi\00F3s m\00F3dra')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525210396751474)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('Szerz\0151i jogi nyilatkozat v\00E1lt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525820229751475)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes t\00E1vols\00E1g')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504871827751468)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'hu'
,p_message_text=>unistr('Nagy\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505075328751469)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kicsiny\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669562096751517)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00E9lk\00F6v\00E9r')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670471067751517)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9p')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670087148751517)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'hu'
,p_message_text=>unistr('Soron bel\00FCli k\00F3d')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682764011751521)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9p besz\00FAr\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682802996751521)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'hu'
,p_message_text=>unistr('Hivatkoz\00E1s besz\00FAr\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669671902751517)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'hu'
,p_message_text=>unistr('D\0151lt')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683415695751521)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'hu'
,p_message_text=>unistr('Hivatkoz\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670315794751517)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'hu'
,p_message_text=>'Lista'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670216836751517)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'hu'
,p_message_text=>'Rendezett lista'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669759635751517)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151n\00E9zet')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669813259751517)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs elem az el\0151n\00E9zethez')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669927437751517)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1th\00FAz\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670167194751517)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9s n\00E9lk\00FCli lista')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649032972751511)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'hu'
,p_message_text=>unistr('aktu\00E1lis')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139705297787751527)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'hu'
,p_message_text=>'Egyebek...'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139648921432751511)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'hu'
,p_message_text=>unistr('Bet\00F6lt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563145314751486)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'hu'
,p_message_text=>unistr('Feloszt\00E1s gomb')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563065943751486)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'hu'
,p_message_text=>unistr('Feloszt\00E1s men\00FC')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680000893751520)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rtes\00EDt\0151 \00FCzenet')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504149781751468)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 %0')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654062602751512)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %#LABEL# \00E9rt\00E9ke csak %0 vagy kisebb lehet.')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654193292751512)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# \00E9rt\00E9ke csak \00E9rv\00E9nyes sz\00E1m lehet.')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654207886751512)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) #LABEL# nem felel meg a(z) %0 sz\00E1mform\00E1tumnak (P\00E9lda: %1).')
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653952569751512)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %#LABEL# \00E9rt\00E9ke csak %0 vagy nagyobb lehet.')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653800732751512)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %#LABEL# \00E9rt\00E9ke csak %0 \00E9s %1 k\00F6z\00F6tti sz\00E1m lehet.')
,p_is_js_message=>true
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649162670751511)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00FAj ablakban ny\00EDlik meg')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598956309751496)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez az oldal m\00E1r be lett k\00FCldve, \00E9s nem k\00FCldhet\0151 be \00FAjra.')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580339189751491)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a(z) "%0" alkalmaz\00E1s "%1". oldala.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615879052751501)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('#LABEL# \00E9rt\00E9ket kell tartalmazzon.')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506572208751469)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelsz\00F3 elrejt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506467914751469)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelsz\00F3 megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554006249751483)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668079961751516)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'hu'
,p_message_text=>unistr('Bez\00E1r\00E1s')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667941988751516)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s%0')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668282955751517)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668151705751517)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544808740751480)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9si kifejez\00E9sk\00E9nt legal\00E1bb %0 karaktert kell be\00EDrni.')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621121544751503)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151ugr\00F3 \00E9rt\00E9klista: %0')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544902512751480)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'hu'
,p_message_text=>unistr('Adjon meg keres\0151kifejez\00E9st.')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491908431751465)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9klista')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544785027751480)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs tal\00E1lat.')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544668170751480)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 elt\00E1vol\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641808208751509)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\0151kifejez\00E9s')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667847132751516)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494034677751465)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 sz\00FCks\00E9ges.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506361800751469)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a kimutat\00E1s nyomtat\00E1sakor.')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139517137041751472)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet kinyomtatni a dokumentumot a konfigur\00E1lt nyomtat\00F3kiszolg\00E1l\00F3 haszn\00E1lat\00E1val.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539841169751479)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a(z) %0 param\00E9ter \00E9rt\00E9kel\00E9sekor a(z) %1 h\00EDv\00E1sa sor\00E1n. A r\00E9szletek\00E9rt tekintse meg a hibanapl\00F3t.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678565270751520)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'hu'
,p_message_text=>unistr('Feldolgoz\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537615030751478)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'hu'
,p_message_text=>'Vissza'
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538790921751478)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez a webhely k\00E9pes alkalmaz\00E1sk\00E9nt m\0171k\00F6dni. A legjobb felhaszn\00E1l\00F3i \00E9lm\00E9ny \00E9rdek\00E9ben telep\00EDtse az eszk\00F6z\00E9re.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540097789751479)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541692290751479)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Alkalmaz\00E1s telep\00EDt\00E9se')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526468238751475)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DAgy t\0171nik, hogy az \00D6n eszk\00F6ze vagy b\00F6ng\00E9sz\0151je jelenleg nem t\00E1mogatja a Progressz\00EDv webes alkalmaz\00E1sok telep\00EDt\00E9s\00E9t.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521567172751473)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'hu'
,p_message_text=>unistr('1. \00C9rintse meg a <strong>Megoszt\00E1s</strong> ikont')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521657863751473)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'hu'
,p_message_text=>unistr('2. G\00F6rgessen le, \00E9s \00E9rintse meg a <strong>Felv\00E9tel a Kezd\0151k\00E9perny\0151re</strong> lehet\0151s\00E9get')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538046151751478)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'hu'
,p_message_text=>unistr('3. A meger\0151s\00EDt\00E9shez \00E9rintse meg a <strong style="color:#007AE1;">Hozz\00E1ad\00E1s</strong> lehet\0151s\00E9get')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537150139751478)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'hu'
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
unistr('    <h1>Nem lehet kapcsol\00F3dni</h1>'),
unistr('    <p>\00DAgy t\0171nik, hogy h\00E1l\00F3zati probl\00E9ma ad\00F3dott. Ellen\0151rizze a kapcsolatot, majd pr\00F3b\00E1lja \00FAjra.</p>'),
unistr('    <button type="button">\00DAjra</button>'),
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537045222751478)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet kapcsol\00F3dni')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583671037751492)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez az eszk\00F6z nem tudta enged\00E9lyezni a k\00FCld\00E9ses \00E9rtes\00EDt\00E9seket.')
,p_version_scn=>2704958
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589137369751493)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Gyorsv\00E1laszt\00F3k ehhez: %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589075225751493)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Gyorsv\00E1laszt\00F3 hivatkoz\00E1sa')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139562807618751486)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'hu'
,p_message_text=>unistr('Vizu\00E1lisan elrejtett v\00E1laszt\00F3gomb')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506924608751469)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Egysoros megtekint\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689676083751523)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1ad\00E1s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634993058751507)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('Eg\00E9sz napos')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712558297751530)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'hu'
,p_message_text=>unistr('Megh\00EDv\00F3 k\00FCld\00E9se')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712334941751530)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Be\00E1ll\00EDt\00E1sok')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636796088751507)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00F6sszes nap napi megtekint\00E9se')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636576351751507)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'hu'
,p_message_text=>unistr('Adatok napi megtekint\00E9se az id\0151adattal')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680776703751520)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'hu'
,p_message_text=>'Nap'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675734727751519)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Le\00EDr\00E1s')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559246120751484)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'hu'
,p_message_text=>'CSV'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559043313751484)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'hu'
,p_message_text=>'iCal'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558900809751484)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'hu'
,p_message_text=>'PDF'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139559114560751484)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'hu'
,p_message_text=>'XML'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558665812751484)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Z\00E1r\00F3 d\00E1tum')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558831274751484)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'hu'
,p_message_text=>unistr('Esem\00E9ny neve')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712497960751530)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Megh\00EDv\00E1s')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680869101751520)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'hu'
,p_message_text=>'Lista'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680555646751520)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00F3nap')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683122640751521)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697127835751525)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs esem\00E9ny')
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712794640751530)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9tez\0151 esem\00E9ny szerkeszt\00E9se.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712639726751530)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'hu'
,p_message_text=>unistr('Megh\00EDv\00F3 k\00FCld\00E9se e-mailben.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683220045751521)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690990398751523)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'hu'
,p_message_text=>unistr('E-mail k\00FCld\00E9se')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690796520751523)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'hu'
,p_message_text=>unistr('E-mail k\00FCld\00E9se')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713361945751530)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Minden mez\0151t k\00F6telez\0151 kit\00F6lteni.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713238801751530)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Megh\00EDv\00F3 k\00FCld\00E9se')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712269374751529)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00E1rgy')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690836422751523)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00EDmzett')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558766809751484)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezd\0151 d\00E1tum')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688931901751523)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'hu'
,p_message_text=>unistr('\0170rlap ezen: %0')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636366780751507)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'hu'
,p_message_text=>unistr('Id\0151')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683306213751521)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'hu'
,p_message_text=>'Ma'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681323280751520)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Megtekint\00E9s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680685523751520)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00E9t')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636689598751507)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00F6sszes nap heti megtekint\00E9se')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636464465751507)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'hu'
,p_message_text=>unistr('Adatok heti megtekint\00E9se az id\0151adattal')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681203002751520)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9v')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680952155751520)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'hu'
,p_message_text=>'Oszlopok...'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681012204751520)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'hu'
,p_message_text=>unistr('Tov\00E1bbiak bet\00F6lt\00E9se...')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610421601751500)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'hu'
,p_message_text=>'Vissza'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551924416751482)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'hu'
,p_message_text=>unistr('Tov\00E1bbiak bet\00F6lt\00E9se...')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554264689751483)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s...')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681183737751520)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'hu'
,p_message_text=>unistr('Tov\00E1bbiak bet\00F6lt\00E9se...')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683039749751521)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 r\00E9gi\00F3azonos\00EDt\00F3 nem tal\00E1lhat\00F3.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554121687751483)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 adat')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581676022751491)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a r\00E9gi\00F3 oldalra t\00F6rdel\00E9s\00E9nek vissza\00E1ll\00EDt\00E1sakor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545317869751480)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a r\00E9gi\00F3 oldalra t\00F6rdel\00E9s\00E9nek be\00E1ll\00EDt\00E1sakor.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675112639751519)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'hu'
,p_message_text=>'Oszlopok...'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529685897751476)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'hu'
,p_message_text=>unistr('A lass\00FA bet\00F6lt\00E9s nem kompatibilis a k\00F6vetkez\0151ben l\00E9v\0151 hely\0151rz\0151kkel: %0, amely egy egyed\00FCl\00E1ll\00F3 (r\00E9szleges) r\00E9gi\00F3. Letilthatja a lass\00FA bet\00F6lt\00E9st erre a r\00E9gi\00F3ra vonatkoz\00F3an, vagy \00E1thelyezheti a hely\0151rz\0151 komponenseit egy m\00E1sik r\00E9gi\00F3ba.')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524931900751474)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Hi\00E1nyzik a csoportsablon a sablon\00F6sszetev\0151ben enn\00E9l: %0.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519939785751473)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 egy egyed\00FCl\00E1ll\00F3 (r\00E9szleges) r\00E9gi\00F3, \00E9s t\00F6bb sort adott vissza.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682909532751521)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 r\00E9gi\00F3t\00EDpus nem t\00E1mogatott.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545282738751480)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a(z) "#COMPONENT_NAME#" r\00E9gi\00F3 megjelen\00EDt\00E9se sor\00E1n.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615913618751501)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('#COLUMN_HEADER# \00E9rt\00E9ket kell tartalmazzon.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497531855751466)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('A kimutat\00E1s elrendez\00E9s\00E9nek megad\00E1sa k\00F6telez\0151.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711860313751529)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('%0, rich text szerkeszt\0151')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618024094751502)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'hu'
,p_message_text=>unistr('A Rich Text form\00E1tum\00FA HTML-jel\00F6l\00E9s t\00FAll\00E9pte az elem r\00E9sz\00E9re enged\00E9lyezett hossz\00FAs\00E1got (a t\00E9nyleges %0, a megengedett pedig %1 karakter)')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527429266751475)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00CDr\00E1sv\00E9dett Rich Text-sz\00F6vegszerkeszt\0151')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527340768751475)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Rich Text-sz\00F6vegszerkeszt\0151')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527127185751475)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'hu'
,p_message_text=>unistr('Igaz\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527266099751475)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'hu'
,p_message_text=>unistr('Extr\00E1k')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526962656751475)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'hu'
,p_message_text=>unistr('Bet\0171t\00EDpus')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526817450751475)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'hu'
,p_message_text=>unistr('Form\00E1z\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527044168751475)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'hu'
,p_message_text=>unistr('List\00E1k')
,p_is_js_message=>true
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680152121751520)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6rl\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672627025751518)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670959148751517)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDtett oszlopok')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670855731751517)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('Null \00E9rt\00E9kek kiz\00E1r\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139680247481751520)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1ad\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634501475751507)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'hu'
,p_message_text=>'Lejjebb'
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634619066751507)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'hu'
,p_message_text=>'Feljebb'
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670645904751517)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671281780751517)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Egy\00E9b oszlopok')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670771930751517)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671025878751517)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'hu'
,p_message_text=>'%0. sor'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671129428751517)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'hu'
,p_message_text=>unistr('%0. sor, \00F6sszesen %1 sor')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672788158751518)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'hu'
,p_message_text=>unistr('Friss\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672896343751518)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00F3dos\00EDt\00E1sok vissza\00E1ll\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139670579639751517)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'hu'
,p_message_text=>unistr('Be\00E1ll\00EDt\00E1sok')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629788758751505)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('P\00E9ld\00E1ul: %0')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634083720751506)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'hu'
,p_message_text=>unistr('P\00E9lda: %0')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546700511751481)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('1 eredm\00E9ny')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543877934751480)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 tal\00E1lat')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595677433751495)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldalt\00F6rdel\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595719047751495)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'hu'
,p_message_text=>unistr('Eredm\00E9nyek, %0 erre: %1')
,p_is_js_message=>true
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491478265751465)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Bejelentkez\00E9s \00FAjra')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491347812751465)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkamenet v\00E9get \00E9rt.')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491594945751465)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'hu'
,p_message_text=>unistr('Kiterjeszt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491136546751465)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00D6n munkamenete ekkor lej\00E1r: %0. Szeretn\00E9 meghosszabb\00EDtani?')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491273595751465)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'hu'
,p_message_text=>unistr('Munkamenete lej\00E1r ekkor: %0, \00E9s nem hosszabb\00EDthat\00F3 meg. Mentse minden munk\00E1j\00E1t, hogy elker\00FClje az adatveszt\00E9st.')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690540818751523)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az adatb\00E1zisi munkamenet t\00F6rl\00E9si k\00F3dj\00E1nak feldolgoz\00E1sakor.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580286762751491)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az adatb\00E1zisi munkamenet be\00E1ll\00EDt\00E1si k\00F3dj\00E1nak feldolgoz\00E1sakor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550624305751482)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkamenet v\00E9get \00E9rt.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689794418751523)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'hu'
,p_message_text=>unistr('Z\00E1rja be a p\00E1rbesz\00E9dpanelt, \00E9s nyomja meg a b\00F6ng\00E9sz\0151 friss\00EDt\00E9si gombj\00E1t, hogy \00FAj munkamenetet nyisson.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708654357751528)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DAj munkamenet l\00E9trehoz\00E1s\00E1hoz <a href="%0">jelentkezzen be</a> \00FAjb\00F3l.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592903999751494)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkamenet nem \00E9rv\00E9nyes')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636043437751507)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'hu'
,p_message_text=>unistr('"%0" felhaszn\00E1l\00F3 r\00E9sz\00E9re nem lehetett Dinamikus szerepk\00F6r\00F6ket enged\00E9lyezni a Real Application Security munkamenet\00E9ben.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578193907751490)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-99900 Nem lehetett l\00E9trehozni egyedi munkamenet-azonos\00EDt\00F3t: %0')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507263997751469)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkamenet-\00E1llapot adatt\00EDpus\00FA CLOB nem enged\00E9lyezett a(z) %0 elemn\00E9l.')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526647520751475)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkamenet-\00E1llapot adatt\00EDpus\00FA CLOB elemek helyettes\00EDt\00E9se nem t\00E1mogatott.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595423768751495)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkameneti \00E1llapot v\00E9delm\00E9nek megs\00E9r\00FCl\00E9se: Ezt okozhatta a v\00E9dett %0 oldalelem manu\00E1lis megv\00E1ltoztat\00E1sa. Ha nem biztos benne, hogy mi okozta ezt a hib\00E1t, k\00E9rjen seg\00EDts\00E9get az alkalmaz\00E1s adminisztr\00E1tor\00E1t\00F3l.')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139716637028751531)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Az oldalv\00E9delem megs\00E9rt\00E9se: Ennek oka lehet olyan oldal beny\00FAjt\00E1sa, amelyik bet\00F6lt\00E9se m\00E9g nem fejez\0151d\00F6tt be, vagy manu\00E1lisan m\00F3dos\00EDtva lettek a v\00E9dett oldalelemek. Tov\00E1bbi seg\00EDts\00E9g\00E9rt forduljon az alkalmaz\00E1s rendszergazd\00E1j\00E1hoz.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715700829751531)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 tartalmazza a k\00F6vetkez\0151 \00E9rv\00E9nytelen karakterek valamelyik\00E9t: &<>"/;,*|=% vagy --')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715828196751531)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 tartalmazza a k\00F6vetkez\0151 \00E9rv\00E9nytelen karakterek valamelyik\00E9t: &<>"/;,*|=% vagy -- vagy az \00FAj sor karakter\00E9t.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715524854751531)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 k\00FCl\00F6nleges karaktereket tartalmaz. Csak az a-Z, 0-9 k\00F6z\00F6tti karakterek \00E9s a sz\00F3k\00F6z\00F6k megengedettek.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715647536751531)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 tartalmaz <, > vagy " karaktert, melyek \00E9rv\00E9nytelenek.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553065884751483)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lett megadva ellen\0151rz\0151\00F6sszeg annak az oldalnak a megjelen\00EDt\00E9s\00E9hez, amelyiknek ellen\0151rz\0151 \00F6sszegre van sz\00FCks\00E9ge, amikor egy vagy t\00F6bb k\00E9relem, gyors\00EDt\00F3t\00E1ri t\00F6rl\00E9s vagy argumentum \00E9rt\00E9k\00E9t param\00E9terk\00E9nt tov\00E1bb\00EDtja.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590312918751494)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkameneti \00E1llapot v\00E9delm\00E9nek megs\00E9r\00FCl\00E9se: Ezt okozhatta az ellen\0151rz\0151 \00F6sszeget tartalmaz\00F3 URL-c\00EDm manu\00E1lis megv\00E1ltoztat\00E1sa, illetve helytelen vagy hi\00E1nyz\00F3 ellen\0151rz\0151 \00F6sszeget tartalmaz\00F3 hivatkoz\00E1s haszn\00E1lata. Ha nem biztos benne, hogy mi okozta ezt')
||unistr(' a hib\00E1t, k\00E9rjen seg\00EDts\00E9get az alkalmaz\00E1s adminisztr\00E1tor\00E1t\00F3l.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139671935626751518)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'hu'
,p_message_text=>unistr('Kontrasztos sz\00EDnek \00FCzemm\00F3d kikapcsol\00E1sa')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672071328751518)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'hu'
,p_message_text=>unistr('Kontrasztos sz\00EDnek \00FCzemm\00F3d bekapcsol\00E1sa')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536435326751478)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 alkalmaz\00E1sbe\00E1ll\00EDt\00E1s nem m\00F3dos\00EDthat\00F3, mert a feliratkoz\00E1s egy m\00E1sik alkalmaz\00E1sb\00F3l sz\00E1rmazik.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586707645751493)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'hu'
,p_message_text=>'Alulra'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586998028751493)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'hu'
,p_message_text=>'Lejjebb'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587051327751493)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1thelyez\00E9s')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587154947751493)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('Mind \00E1thelyez\00E9se')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587284143751493)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Elt\00E1vol\00EDt\00E1s')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587386904751493)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('Mind elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587480735751493)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Vissza\00E1ll\00EDt\00E1s')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586695162751493)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'hu'
,p_message_text=>unistr('Fel\00FClre')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586846310751493)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'hu'
,p_message_text=>'Feljebb'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698455841751525)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'hu'
,p_message_text=>'%0n'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699123471751526)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('ezen bel\00FCl: %0n')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698374380751525)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'hu'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699262778751526)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('ezen bel\00FCl: %0h')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698121763751525)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'hu'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699370101751526)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('ezen bel\00FCl: %0m')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698776390751526)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0h\00F3')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698979241751526)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('ezen bel\00FCl: %0h\00F3')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698290632751525)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'hu'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699040558751526)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('ezen bel\00FCl: %0s')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698514906751525)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0h\00E9')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139699448255751526)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('ezen bel\00FCl: %0h\00E9')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698695368751526)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0\00E9')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698885458751526)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('ezen bel\00FCl: %0\00E9')
,p_is_js_message=>true
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499714260751467)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'hu'
,p_message_text=>'[Vonal]'
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500395272751467)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'hu'
,p_message_text=>'[Sok vonal]'
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500013060751467)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'hu'
,p_message_text=>'[Sok pont]'
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500555600751467)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'hu'
,p_message_text=>unistr('[Sok soksz\00F6g]')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500619982751467)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'hu'
,p_message_text=>'[Geometriai objektum]'
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499651001751467)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'hu'
,p_message_text=>'[Pont (%0,%1)]'
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499987823751467)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'hu'
,p_message_text=>unistr('[Soksz\00F6g]')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499132133751467)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszecsukott r\00E9gi\00F3: %0')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614203894751501)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Becsuk\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498162189751467)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('A v\00EDzszintes t\00E1jol\00E1s\00FA feloszt\00F3 nem mozgathat\00F3 balra vagy jobbra')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498316775751467)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'hu'
,p_message_text=>unistr('El\00E9rte a k\00E9ppontok maxim\00E1lis sz\00E1m\00E1t (%0)')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499304094751467)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'hu'
,p_message_text=>unistr('El\00E9rte a k\00E9ppontok minim\00E1lis sz\00E1m\00E1t (%0)')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499239793751467)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9gi\00F3 \00F6sszecsukva')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499071668751467)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9gi\00F3 vissza\00E1ll\00EDtva')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498785978751467)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1tm\00E9retezve %0 k\00E9ppontra')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498991744751467)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'hu'
,p_message_text=>unistr('Vissza\00E1ll\00EDtott r\00E9gi\00F3: %0')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614152674751501)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Helyre\00E1ll\00EDt\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498256743751467)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'hu'
,p_message_text=>unistr('A f\00FCgg\0151leges t\00E1jol\00E1s\00FA feloszt\00F3 nem mozgathat\00F3 felfel\00E9 vagy lefel\00E9')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663608306751515)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9kel\00E9s t\00F6rl\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653593370751512)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nincs az 1 \00E9s %1 k\00F6z\00F6tti \00E9rv\00E9nyes \00E9rt\00E9kel\00E9si tartom\00E1nyban')
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653604039751512)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'hu'
,p_message_text=>'%0 nem numerikus'
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649715187751511)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('Sikeres m\0171veletr\0151l \00E9rtes\00EDt\0151 \00FCzenet')
,p_is_js_message=>true
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711530242751529)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711489383751529)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621694730751503)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 az ehhez a feladatp\00E9ld\00E1nyhoz kapcsol\00F3d\00F3 bejegyz\00E9s(ek) rendszere')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629921306751505)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 feladatm\0171velet v\00E9grehajt\00E1sa sikertelen - a feladat hib\00E1s \00E1llapot\00FAra lett \00E1ll\00EDtva, ellen\0151rizze a feladat m\0171veletk\00F3dj\00E1t')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510110073751470)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjegyz\00E9s hozz\00E1ad\00E1sa: Nem jogosult')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509400006751470)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat m\00E1r hozz\00E1 van rendelve')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502856906751468)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1 rendelve: %0')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509157342751470)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat megszak\00EDt\00E1sa: Nem jogosult')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524777764751474)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet elt\00E1vol\00EDtani a feladat jelenlegi tulajdonos\00E1t. A m\0171velet \00FAjb\00F3li v\00E9grehajt\00E1sa el\0151tt adja \00E1t a feladatot m\00E1sik r\00E9sztvev\0151nek.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508726666751470)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat ig\00E9nyl\00E9se: Nem jogosult')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508815164751470)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat befejez\00E9se: Nem jogosult')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508959334751470)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat \00E1truh\00E1z\00E1sa: Nem jogosult')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507341799751469)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat esed\00E9kess\00E9gi d\00E1tuma nem lehet m\00FAltbeli.')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502603439751468)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'hu'
,p_message_text=>unistr('Esed\00E9kess\00E9g: %0')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503096135751468)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 feladatm\0171velet nem siker\00FClt. Hiba\00FCzenet: %0')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502707708751468)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sikertelen m\0171velet')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502303475751468)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sikeres m\0171velet')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502549231751468)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 m\0171velet siker\00FClt. \00DCzenet: %0')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505807430751469)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'hu'
,p_message_text=>unistr('Lej\00E1rat el\0151tt')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531496151751476)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E9gse')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530971332751476)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat megszak\00EDtva')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531526473751476)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A r\00E9sztvev\0151 sz\00E1m\00E1ra nem enged\00E9lyezett a feladat megszak\00EDt\00E1sa')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530850926751476)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'hu'
,p_message_text=>unistr('Ig\00E9nyl\00E9s')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531221313751476)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladatot m\00E1r egy m\00E1sik felhaszn\00E1l\00F3 ig\00E9nyelte, vagy a r\00E9sztvev\0151 nem jogosult a feladat ig\00E9nyl\00E9s\00E9re')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531025988751476)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat ig\00E9nyelve %0 \00E1ltal')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632158125751506)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'hu'
,p_message_text=>unistr('Befejez\00E9s')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530649052751476)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat befejezve %0 eredm\00E9nnyel')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531932870751476)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat vagy nincs hozz\00E1rendelve, vagy a r\00E9sztvev\0151 sz\00E1m\00E1ra nem enged\00E9lyezett a feladat befejez\00E9se')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492350469751465)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat befejezve eredm\00E9ny n\00E9lk\00FCl')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632276888751506)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9trehoz\00E1s')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525178740751474)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat l\00E9trehozva %0 azonos\00EDt\00F3val')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632323517751506)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1truh\00E1z\00E1s')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530700065751476)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat \00E1truh\00E1zva lehets\00E9ges tulajdonosra: %0')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531396101751476)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A r\00E9sztvev\0151 nem jogosult, vagy az \00FAj r\00E9sztvev\0151 nem lehets\00E9ges tulajdonosa a feladatnak')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504496566751468)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'hu'
,p_message_text=>unistr('Lej\00E1r')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505518579751469)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat lej\00E1rt.')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632494753751506)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'hu'
,p_message_text=>'Sikertelen'
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501172656751467)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat vagy nincs hozz\00E1rendelve, vagy a r\00E9sztvev\0151 sz\00E1m\00E1ra nem enged\00E9lyezett az adatok k\00E9r\00E9se a feladathoz')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501347304751467)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lettek k\00E9rve adatok a feladathoz, vagy a r\00E9sztvev\0151 sz\00E1m\00E1ra nem enged\00E9lyezett az adatok elk\00FCld\00E9se a feladathoz.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504966087751469)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat lej\00E1r, mert el\00E9rte a meg\00FAj\00EDt\00E1sok maxim\00E1lis sz\00E1m\00E1t: %0.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532264681751477)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat nincs a helyes \00E1llapotban, vagy a r\00E9sztvev\0151 nem v\00E1llalati rendszergazda enn\00E9l a feladatn\00E1l')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532326283751477)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 m\0171velet ismeretlen vagy nem alkalmazhat\00F3 erre a feladatra')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632509880751506)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'hu'
,p_message_text=>unistr('Felszabad\00EDt\00E1s')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618292494751502)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat felszabad\00EDtva, mostant\00F3l m\00E1sok ig\00E9nyelhetik.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511117826751470)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat felszabad\00EDt\00E1sa nem enged\00E9lyezett - a felhaszn\00E1l\00F3 nem a feladat tulajdonosa')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528170808751475)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'hu'
,p_message_text=>unistr('Tulajdonos elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528380723751475)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 r\00E9sztvev\0151 elt\00E1vol\00EDtva a feladatb\00F3l')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505718441751469)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Meg\00FAj\00EDt\00E1s')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504672400751468)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat meg\00FAj\00EDtva %0 azonos\00EDt\00F3val, a lej\00E1rat el\0151tti meg\00FAj\00EDt\00E1sok h\00E1tral\00E9v\0151 maxim\00E1lis sz\00E1ma %1.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139505602356751469)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 feladatazonos\00EDt\00F3 meg\00FAj\00EDtva %1 feladatazonos\00EDt\00F3val')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501628155751468)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'hu'
,p_message_text=>unistr('Adatok k\00E9r\00E9se')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501511060751468)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Tov\00E1bbi adatok k\00E9r\00E9se %0 fel\0151l: %1')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499455470751467)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezdem\00E9nyez\0151 elv\00E9gezheti - be\00E1ll\00EDt\00E1s erre: %0')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501742366751468)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'hu'
,p_message_text=>unistr('Adatok elk\00FCld\00E9se')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501467332751468)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A k\00E9rt adatok sikeresen elk\00FCldve %0 r\00E9sz\00E9re: %1')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632669375751506)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjegyz\00E9s m\00F3dos\00EDt\00E1sa')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529125582751476)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjegyz\00E9s hozz\00E1ad\00E1sa: %0')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532005058751476)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat \00E1llapota nem enged\00E9lyezi a megjegyz\00E9seket')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539320959751479)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ll\00EDtsa be a feladat esed\00E9kess\00E9gi d\00E1tum\00E1t a k\00F6vetkez\0151re: %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497480752751466)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00F3dos\00EDt\00E1s esed\00E9kess\00E9g\00E9nek napja')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632720444751506)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'hu'
,p_message_text=>unistr('Tulajdonos m\00F3dos\00EDt\00E1sa')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530449776751476)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 lehets\00E9ges tulajdonos hozz\00E1ad\00E1sa a feladat r\00E9sztvev\0151ihez')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529514379751476)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'hu'
,p_message_text=>unistr('Param\00E9terek m\00F3dos\00EDt\00E1sa')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632858611751506)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'hu'
,p_message_text=>unistr('Priorit\00E1s friss\00EDt\00E9se')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531115979751476)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ll\00EDtsa be a feladat priorit\00E1s\00E1t a k\00F6vetkez\0151re: %0')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528445072751475)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" param\00E9ter m\00F3dos\00EDtva err\0151l: "%1" erre: "%2".')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511938805751471)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat megszak\00EDtva, mert a kapcsol\00F3d\00F3 munkafolyamat-p\00E9ld\00E1nyt megsz\00FCntett\00E9k.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509048771751470)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat tov\00E1bb\00EDt\00E1sa: Nem jogosult')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502423394751468)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezdem\00E9nyez\0151: %0 %1')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511343875751470)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1ratlan bels\0151 hiba t\00F6rt\00E9nt')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509662338751470)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladatm\0171velet nem alkalmazhat\00F3')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535223418751477)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez a lehets\00E9ges tulajdonos nem l\00E9tezik.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510933283751470)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'hu'
,p_message_text=>unistr('J\00F3v\00E1hagyva')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511072188751470)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Elutas\00EDtva')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492409687751465)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat befejez\00E9s\00E9hez eredm\00E9ny sz\00FCks\00E9ges')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139492610792751465)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A feladat nem rendelkezhet eredm\00E9nnyel')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528274677751475)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem m\00F3dos\00EDthat\00F3 a(z) %0 param\00E9ter.')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524523627751474)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'hu'
,p_message_text=>unistr('A r\00E9sztvev\0151 m\00E1r l\00E9tezik ehhez a feladatp\00E9ld\00E1nyhoz.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139626042872751504)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FCrg\0151s')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503151762751468)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FCrg\0151s')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625961019751504)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'hu'
,p_message_text=>'Magas'
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503248185751468)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Magas priorit\00E1s')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625827899751504)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6zepes')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503315693751468)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6zepes priorit\00E1s')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625739715751504)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'hu'
,p_message_text=>'Alacsony'
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503475213751468)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Alacsony priorit\00E1s')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625625190751504)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'hu'
,p_message_text=>unistr('Kev\00E9sb\00E9 s\00FCrg\0151s')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503587240751468)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Legalacsonyabb priorit\00E1s')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509220869751470)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladat priorit\00E1s\00E1nak megad\00E1sa: Nem jogosult')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510462143751470)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1rendelve')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510872424751470)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'hu'
,p_message_text=>unistr('Megszak\00EDtva')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510574431751470)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'hu'
,p_message_text=>'Befejezve'
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510787134751470)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'hu'
,p_message_text=>unistr('Hib\00E1s')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139504272028751468)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Lej\00E1rt')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510688511751470)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'hu'
,p_message_text=>'Sikertelen'
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500924534751467)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9rt adatok')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510383344751470)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs hozz\00E1rendelve')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532767598751477)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('A(z) %1 alkalmaz\00E1sban nem siker\00FClt l\00E9trehozni \00FAj feladatot a(z) %0 feladatdefin\00EDci\00F3hoz.'),
'SQLCODE: %2'))
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532639985751477)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem siker\00FClt l\00E9trehozni feladatot a(z) %0 feladatdefin\00EDci\00F3hoz a(z) %1 alkalmaz\00E1sban, mert a feladatdefin\00EDci\00F3 nem tartalmaz lehets\00E9ges tulajdonosokat - szerkessze a feladatdefin\00EDci\00F3t, \00E9s adjon hozz\00E1 legal\00E1bb egy, Lehets\00E9ges tulajdonos t\00EDpus\00FA r\00E9sztvev\0151')
||'t'
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509935490751470)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a feladat defin\00EDci\00F3ja')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509895580751470)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3k r\00E9sztvev\0151k a feladathoz')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511280099751470)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Egyn\00E9l t\00F6bb feladat tal\00E1lhat\00F3 a megadott feladatazonos\00EDt\00F3n\00E1l - k\00E9rje az adatb\00E1zis rendszergazd\00E1j\00E1nak seg\00EDts\00E9g\00E9t')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139510007141751470)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a feladat')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139509723715751470)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a feladat param\00E9tere')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546080279751481)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'hu'
,p_message_text=>unistr('M\0171velet')
,p_version_scn=>2704950
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545920479751481)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'hu'
,p_message_text=>unistr('J\00F3v\00E1hagy\00E1s')
,p_version_scn=>2704950
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493394208751465)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %2 szabads\00E1gszab\00E1ly-folyamat %0 feladatdefin\00EDci\00F3hoz t\00F6rt\00E9n\0151 v\00E9grehajt\00E1sa sikertelen volt a k\00F6vetkez\0151 alkalmaz\00E1sban: %1.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493555052751465)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('%1 r\00E9sztvev\0151 hozz\00E1adva %0 r\00E9sztvev\0151 helyettesek\00E9nt . Ok - %2 .')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697254408751525)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Eszk\00F6zt\00E1r')
,p_is_js_message=>true
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550782355751482)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Alkalmaz\00E1s')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711928713751529)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Navig\00E1l\00E1s kibont\00E1sa/becsuk\00E1sa')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712002684751529)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldals\00F3 oszlop kibont\00E1sa/becsuk\00E1sa')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620444850751503)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('F\0151 navig\00E1ci\00F3')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521238133751473)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" \00E9rv\00E9nytelen hely\0151rz\0151n\00E9v.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628122653751505)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'hu'
,p_message_text=>'1 nap'
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627951531751505)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('1 \00F3ra')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628205880751505)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'hu'
,p_message_text=>'%0 nap'
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628032617751505)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00F3ra')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627801957751505)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'hu'
,p_message_text=>'%0 perc'
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628475720751505)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 h\00E9t')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139628355341751505)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('1 h\00E9t')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526112749751475)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 elem kiv\00E1lasztva')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526385483751475)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Elem kijel\00F6l\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526273481751475)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715051270751530)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'hu'
,p_message_text=>'Oldal kezdete'
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572683038751488)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'hu'
,p_message_text=>unistr('Enged\00E9lyezett')
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541196600751479)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba t\00F6rt\00E9nt a k\00E9relem feldolgoz\00E1sakor.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139526797358751475)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 sz\00F6veges \00FCzenet nem m\00F3dos\00EDthat\00F3, mert a feliratkoz\00E1s egy m\00E1sik alkalmaz\00E1sb\00F3l sz\00E1rmazik.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629882472751505)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9ket kell megadni')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139546266950751481)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'hu'
,p_message_text=>unistr('%0. fejl\00E9cszint, rejtett')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674642901751518)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'hu'
,p_message_text=>unistr('Ezen az oldalon nem mentett m\00F3dos\00EDt\00E1sok tal\00E1lhat\00F3k.')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536283040751478)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1laszt\00F3')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535930220751478)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'hu'
,p_message_text=>unistr('Nagy\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536929021751478)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Nagy\00EDt\00E1si szint {0}%')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536076853751478)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kicsiny\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536162826751478)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'hu'
,p_message_text=>'Alaphelyzet'
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511656850751471)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkafolyamat-diagram jelenleg nem el\00E9rhet\0151.')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511558712751470)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'hu'
,p_message_text=>'Munkafolyamat-diagram'
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513417197751471)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat-p\00E9ld\00E1ny jelenleg %1 \00E1llapotban van, ez\00E9rt a m\0171velet nem enged\00E9lyezett.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516012369751472)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %2 tev\00E9kenys\00E9g %1 p\00E9ld\00E1ny\00E1t a(z) %0 munkafolyamatban befejezt\00E9k')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515876491751472)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 p\00E9ld\00E1ny l\00E9trej\00F6tt a(z) %2 tev\00E9kenys\00E9ghez, munkafolyamat: %0')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507656788751469)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 az ehhez a munkafolyamati tev\00E9kenys\00E9gp\00E9ld\00E1nyhoz kapcsol\00F3d\00F3 tov\00E1bbi adatsor')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515909526751472)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %2 tev\00E9kenys\00E9g hib\00E1s %1 p\00E9ld\00E1ny\00E1t a(z) %0 munkafolyamatban ism\00E9telten megk\00EDs\00E9relt\00E9k')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497964613751466)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 tev\00E9kenys\00E9gp\00E9ld\00E1nyt a(z) %0 munkafolyamatban megsz\00FCntett\00E9k')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531798218751476)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 tev\00E9kenys\00E9gp\00E9ld\00E1ny a(z) %0 munkafolyamatban t\00FAll\00E9pte az id\0151korl\00E1tot, \00E9s meg lett sz\00FCntetve.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516171033751472)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %2 tev\00E9kenys\00E9g %1 p\00E9ld\00E1nya a(z) %0 munkafolyamatban V\00E1rakoz\00E1s \00E1llapotban van')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497711195751466)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat-p\00E9ld\00E1ny m\00F3dosult, \00E9s folytat\00F3dott a k\00F6vetkez\0151 tev\00E9kenys\00E9gn\00E9l: %1')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515112835751472)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 v\00E1rakoz\00E1si p\00E9ld\00E1ny (tev\00E9kenys\00E9g: %2, munkafolyamat: %0) sikeresen befejez\0151d\00F6tt')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514901041751471)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 V\00E1rakoz\00E1s tev\00E9kenys\00E9g Hib\00E1s \00E1llapot\00FAv\00E1 v\00E1lt, mert a(z) %0 munkafolyamat m\00E1r a tev\00E9kenys\00E9g befejez\00E9se el\0151tt Hib\00E1s \00E1llapotban volt')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515019671751472)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 V\00E1rakoz\00E1s tev\00E9kenys\00E9g Megsz\00FCntetett \00E1llapotra lett \00E1ll\00EDtva, mert a(z) %0 munkafolyamat m\00E1r a tev\00E9kenys\00E9g befejez\00E9se el\0151tt Megsz\00FCntetett \00E1llapotban volt')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139498026270751467)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 tev\00E9kenys\00E9g megsz\00FCntet\00E9se a(z) %0 munkafolyamatban kiv\00E9tel miatt sikertelen - %2')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513680756751471)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkafolyamat jelenleg egy el\0151z\0151 m\0171velet befejez\00E9s\00E9vel van leterhelve. K\00E9rj\00FCk, pr\00F3b\00E1lja \00FAjra k\00E9s\0151bb.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529796835751476)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'hu'
,p_message_text=>'Befejezve: %0'
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512769496751471)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat nem folytathat\00F3, mert jelenlegi tev\00E9kenys\00E9ge %1, amely nem a V\00E1rakoz\00E1s \00E1llapotban van')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524603976751474)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 nem \00E9rv\00E9nyes munkafolyamat-korrel\00E1ci\00F3s kontextus az adott munkafolyamat-tev\00E9kenys\00E9g \00E1ltal v\00E9grehajtott folyamathoz. A korrel\00E1ci\00F3s kontextusnak kett\0151sponttal elv\00E1lasztott sz\00F6vegnek kell lennie, amely tartalmazza az APEX_APPL_WORKFLOW \00E9rt\00E9ket, ')
||unistr('majd a munkafolyamat p\00E9ld\00E1nyazonos\00EDt\00F3j\00E1t \00E9s a tev\00E9kenys\00E9g p\00E9ld\00E1nyazonos\00EDt\00F3j\00E1t.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515335305751472)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 p\00E9ld\00E1ny l\00E9trej\00F6tt a(z) %1 munkafolyamathoz, verzi\00F3: %2')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507498289751469)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 az ehhez a munkafolyamat-p\00E9ld\00E1nyhoz kapcsol\00F3d\00F3 tov\00E1bbi adatsor')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529932180751476)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'hu'
,p_message_text=>unistr('Esed\00E9kess\00E9g: %0')
,p_version_scn=>2704948
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515229932751472)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat %1 \00E1llapottal z\00E1rult')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512460669751471)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat V\00E1lt\00E1s tev\00E9kenys\00E9g\00E9ben \00F6sszehasonl\00EDtott felt\00E9telek %1 adatt\00EDpusa nem kompatibilis a felt\00E9teloper\00E1torral.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502286522751468)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezdem\00E9nyez\0151: %0 %1')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139525057410751474)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 p\00E9ld\00E1ny l\00E9trej\00F6tt a(z) %1 munkafolyamathoz, verzi\00F3: %2 - megh\00EDvva a(z) %3 munkafolyamat-p\00E9ld\00E1ny %4 tev\00E9kenys\00E9gp\00E9ld\00E1ny\00E1b\00F3l')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139497896693751466)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 statikus azonos\00EDt\00F3j\00FA tev\00E9kenys\00E9g nem tev\00E9kenys\00E9g a(z) %0 munkafolyamatban. Ellen\0151rizze a megfelel\0151 munkafolyamat-verzi\00F3hoz tartoz\00F3 tev\00E9kenys\00E9g statikus azonos\00EDt\00F3j\00E1t.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523143213751474)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 k\00F6telez\0151 param\00E9ter ehhez a munkamenethez, \00E9s nem lehet NULL \00E9rt\00E9k\0171.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515788396751472)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat-p\00E9ld\00E1nyt folytatt\00E1k')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515608831751472)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat-p\00E9ld\00E1nyt ism\00E9telten megk\00EDs\00E9relt\00E9k')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530041470751476)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00FAjrapr\00F3b\00E1lkoz\00E1s')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530121927751476)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00FAjrapr\00F3b\00E1lkoz\00E1s')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529822158751476)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'hu'
,p_message_text=>unistr('Elind\00EDtva: %0')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524066272751474)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Akt\00EDv')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524293542751474)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'hu'
,p_message_text=>'Befejezve'
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524379397751474)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Hib\00E1s')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524474178751474)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'hu'
,p_message_text=>unistr('Felf\00FCggesztett')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139524165551751474)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'hu'
,p_message_text=>unistr('Megsz\00FCntetett')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539411630751479)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1rakoz\00E1s')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515444059751472)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat-p\00E9ld\00E1nyt felf\00FCggesztett\00E9k')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521392513751473)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet meghat\00E1rozni a(z) %0 munkafolyamat-p\00E9ld\00E1ny k\00F6vetkez\0151 tev\00E9kenys\00E9g\00E9t. Ellen\0151rizze \00E9s jav\00EDtsa az aktu\00E1lis v\00E1lt\00E1si tev\00E9kenys\00E9ghez meghat\00E1rozott felt\00E9teleket, miel\0151tt \00FAjra megpr\00F3b\00E1ln\00E1 a munkafolyamatot.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139515552036751472)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat-p\00E9ld\00E1nyt megsz\00FCntett\00E9k')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514643017751471)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'hu'
,p_message_text=>unistr('Csak a(z) %0 munkafolyamat \00FCzleti adminisztr\00E1tora folytathatja a munkafolyamatot')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514776776751471)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamatot csak \00FCzleti adminisztr\00E1tor vagy tulajdonos k\00EDs\00E9relheti meg ism\00E9telten')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514289898751471)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat-p\00E9ld\00E1nyt csak a munkafolyamat \00FCzleti adminisztr\00E1tora f\00FCggesztheti fel')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514515489751471)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Csak a(z) %0 munkafolyamat-p\00E9ld\00E1ny tulajdonosai \00E9s \00FCzleti adminisztr\00E1torai sz\00FCntethetik meg a munkafolyamatot')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512956200751471)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat v\00E1ltoz\00F3it csak a munkafolyamathoz meghat\00E1rozott \00FCzleti adminisztr\00E1tor m\00F3dos\00EDthatja')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527505355751475)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamat-p\00E9ld\00E1nynak a v\00E1ltoz\00F3i m\00F3dos\00EDt\00E1sa el\0151tt Hib\00E1s vagy Felf\00FCggesztett \00E1llapot\00FAnak kell lennie.')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519006503751473)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkafolyamat %0 v\00E1ltoz\00F3j\00E1nak \00E9rt\00E9ke a k\00F6vetkez\0151re m\00F3dosult: %1')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529219553751476)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamatnak nincs Akt\00EDv verzi\00F3ja')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529306113751476)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamatnak nincs Fejleszt\00E9s alatt verzi\00F3ja')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139529419477751476)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkafolyamatnak nincs Akt\00EDv vagy Fejleszt\00E9s alatt verzi\00F3ja')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512322875751471)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a(z) %1 tev\00E9kenys\00E9gp\00E9ld\00E1ny a(z) %0 munkafolyamat-p\00E9ld\00E1nyhoz')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512193553751471)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a(z) %0 munkafolyamat-p\00E9ld\00E1ny')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547253696751481)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs akt\00EDv munkalapja a munkaf\00FCzetnek.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547133561751481)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lett inicializ\00E1lva a munkaf\00FCzet.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547096478751481)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Bels\0151 hiba t\00F6rt\00E9nt az XLSX f\00E1jl l\00E9trehoz\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549555916751482)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'hu'
,p_message_text=>'Munkalap'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560111934751485)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" munkalapn\00E9v m\00E1r l\00E9tezik. Adjon meg egy m\00E1sikat.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688746559751523)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('M\0171veletek')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603712131751498)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'hu'
,p_message_text=>unistr('M\0171veletek men\00FC')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599470500751496)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCggv\00E9ny hozz\00E1ad\00E1sa')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599372023751496)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlop alap\00FA csoportos\00EDt\00E1s hozz\00E1ad\00E1sa')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636958028751507)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1soszlop hozz\00E1ad\00E1sa')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637040824751507)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor oszlop\00E1nak hozz\00E1ad\00E1sa')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571485163751488)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes\00EDt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609966565751499)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes\00EDt\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590827660751494)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1tlag')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595146943751495)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('Mennyis\00E9g')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590926371751494)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'hu'
,p_message_text=>'Maximum'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591174280751494)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6z\00E9p\00E9rt\00E9k')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591043850751494)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'hu'
,p_message_text=>'Minimum'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590735978751494)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszesen %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591833586751494)
,p_name=>'APEXIR_ALL'
,p_message_language=>'hu'
,p_message_text=>'Mind'
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570710140751488)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>'Minden oszlop'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550821035751482)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'hu'
,p_message_text=>'Minden sor'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685759747751522)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Alternat\00EDva')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687323337751522)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1sodlagos alap\00E9rtelmez\00E9s: %0')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584996560751492)
,p_name=>'APEXIR_AND'
,p_message_language=>'hu'
,p_message_text=>unistr('\00E9s')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619714914751502)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem siker\00FClt import\00E1lni az elmentett kimutat\00E1st. A tartalom s\00E9r\00FClt.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619857444751502)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem siker\00FClt import\00E1lni az elmentett kimutat\00E1st. A tartalom \00FCres.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572941999751488)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'hu'
,p_message_text=>'Alkalmaz'
,p_is_js_message=>true
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566561122751487)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00F6vekv\0151')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588085276751493)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('Ett\0151l kezdve: %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687936172751522)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1tlag: %0')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679557072751520)
,p_name=>'APEXIR_BAR'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00E1v')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572209225751488)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'hu'
,p_message_text=>unistr('ezek k\00F6z\00F6tt')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565349588751486)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00E1tt\00E9rsz\00EDn')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567215196751487)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'hu'
,p_message_text=>unistr('k\00E9k')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601340147751497)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'hu'
,p_message_text=>'Alulra'
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532156513751477)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 keres\0151s\00E1vja melletti gombok')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567847222751487)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E9gse')
,p_is_js_message=>true
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574172054751489)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'hu'
,p_message_text=>unistr('Kateg\00F3ria')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565216460751486)
,p_name=>'APEXIR_CELL'
,p_message_language=>'hu'
,p_message_text=>'Cella'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591736172751494)
,p_name=>'APEXIR_CHART'
,p_message_language=>'hu'
,p_message_text=>'Diagram'
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602268302751497)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'hu'
,p_message_text=>unistr('Inicializ\00E1l\00E1s...')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139641940622751509)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('Meg kell adni a diagram felirat\00E1t.')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654338730751512)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'hu'
,p_message_text=>unistr('A lek\00E9rdez\00E9sben a diagramonk\00E9nti adatpontok sz\00E1ma t\00F6bb, mint a maximum: %0. Haszn\00E1ljon sz\0171r\0151t, hogy cs\00F6kkentse a rekordok sz\00E1m\00E1t az alap lek\00E9rdez\00E9sben.')
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653200477751512)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagram t\00EDpus\00FA lek\00E9rdez\00E9shez a sorok maxim\00E1lis sz\00E1m\00E1t az alap lek\00E9rdez\00E9sben l\00E9v\0151 sorok sz\00E1ma korl\00E1tozza, nem a megjelen\00EDtett sorok sz\00E1ma. Ez az alap lek\00E9rdez\00E9s t\00FAll\00E9pi a sorok megengedett sz\00E1m\00E1t, ami %0. Haszn\00E1ljon sz\0171r\0151t, hogy cs\00F6kkentse a rekordok ')
||unistr('sz\00E1m\00E1t az alap lek\00E9rdez\00E9sben.')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570863678751488)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagramt\00EDpus')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534771719751477)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 diagramn\00E9zete')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139649993919751511)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes bejel\00F6l\00E9se')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588471187751493)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lasszon kimutat\00E1sform\00E1tumot')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596217367751495)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('t\00F6rl\00E9s')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567736086751487)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Oszlop'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607505243751499)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>'Oszlopok'
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574763302751489)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlop m\00E1sodlagos nevek')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682383735751521)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151...')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542590027751480)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlopfejl\00E9c')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556675180751484)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlopm\0171veletek')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556960566751484)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" oszlop m\0171veletei')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598375855751496)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlopfejl\00E9c men\00FCje')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602064037751497)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlopinform\00E1ci\00F3')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684684811751521)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'hu'
,p_message_text=>'Oszlopfelirat'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599716838751496)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'hu'
,p_message_text=>'Oszlop %0'
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582610961751491)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'hu'
,p_message_text=>'tartalmaz'
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583914234751492)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'hu'
,p_message_text=>'nem tartalmaz'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566217915751487)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'hu'
,p_message_text=>'tartalmazza'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584165851751492)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('nem az utols\00F3ban')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593296878751495)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('nem a k\00F6vetkez\0151ben van')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584097261751492)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('az utols\00F3ban')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593190768751494)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('a k\00F6vetkez\0151ben van')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566105702751487)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('nem null \00E9rt\00E9k\0171')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566012985751486)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('null \00E9rt\00E9k\0171')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565830755751486)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'hu'
,p_message_text=>unistr('ehhez hasonl\00F3')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566348511751487)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'hu'
,p_message_text=>'nem tartalmazza'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565911526751486)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'hu'
,p_message_text=>unistr('nem ehhez hasonl\00F3')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582942259751491)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'hu'
,p_message_text=>unistr('egyezik a regul\00E1ris kifejez\00E9ssel')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588365944751493)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00E1m\00EDt\00E1s')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139652956975751512)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00E1m\00EDt\00E1si kifejez\00E9s')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607830725751499)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00E1m\00EDt\00E1s l\00E9trehoz\00E1sa m\00E1sodlagos oszlopnevek haszn\00E1lat\00E1val.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607911803751499)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'hu'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608078120751499)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'hu'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608167254751499)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'hu'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549029477751481)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'hu'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592543016751494)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00E1m\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600313884751497)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9spont')
,p_is_js_message=>true
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603392215751497)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9spont')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689981608751523)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9sponti oszlopok')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545782136751480)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCl\00F6nb\00F6z\0151k sz\00E1ma')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688450681751522)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCl\00F6nb\00F6z\0151k sz\00E1ma')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688380292751522)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'hu'
,p_message_text=>unistr('Mennyis\00E9g: %0')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661383021751515)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'hu'
,p_message_text=>'Naponta'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139714620166751530)
,p_name=>'APEXIR_DATA'
,p_message_language=>'hu'
,p_message_text=>'Adatok'
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602199945751497)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 perccel kor\00E1bbi kimutat\00E1sadatok.')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535106969751477)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 adatn\00E9zete')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571504254751488)
,p_name=>'APEXIR_DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('D\00E1tum')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606099067751498)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685515395751522)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett kimutat\00E1st\00EDpus')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567931588751487)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6rl\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571820203751488)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'hu'
,p_message_text=>unistr('Szeretn\00E9 t\00F6r\00F6lni ezeket a kimutat\00E1sbe\00E1ll\00EDt\00E1sokat?')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672368775751518)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett kimutat\00E1s t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600024692751497)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s t\00F6rl\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566676772751487)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('Cs\00F6kken\0151')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574293875751489)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Le\00EDr\00E1s')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598261046751496)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Egysoros megtekint\00E9s')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606578710751498)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Ir\00E1ny: %0')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607436156751499)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'hu'
,p_message_text=>'Letiltva'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567498172751487)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDtett')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570608993751488)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDtett oszlopok')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606445179751498)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDt\00E9s kimutat\00E1sban')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601261349751497)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'hu'
,p_message_text=>'Lejjebb'
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592616602751494)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'hu'
,p_message_text=>unistr('Let\00F6lt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606356109751498)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'hu'
,p_message_text=>'Ne jelenjen meg'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675628382751519)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1r l\00E9tezik kiemel\00E9s ilyen felt\00E9telekkel.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690113014751523)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\0151 kimutat\00E1soszlop. A kimutat\00E1soszlopi lista csak egyedi lehet.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690348013751523)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'hu'
,p_message_text=>unistr('Szerkeszt\00E9s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602346415751497)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagrambe\00E1ll\00EDt\00E1sok szerkeszt\00E9se')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608921876751499)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagram szerkeszt\00E9se')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572882392751488)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9spont szerkeszt\00E9se')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609357715751499)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151 szerkeszt\00E9se')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575832852751489)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'hu'
,p_message_text=>unistr('Visszatekint\00E9s szerkeszt\00E9se')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667167721751516)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1si szempont szerkeszt\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609203749751499)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kiemel\00E9s szerkeszt\00E9se')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637226827751507)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1st\00E1bla szerkeszt\00E9se')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596652885751496)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Riport szerkeszt\00E9se')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685875007751522)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'hu'
,p_message_text=>'E-mail'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558069773751484)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'hu'
,p_message_text=>unistr('E-mail-c\00EDm')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686139255751522)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'hu'
,p_message_text=>unistr('Titkos m\00E1solat')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686318611751522)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6rzs')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686001607751522)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1solatot kap')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686878201751522)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'hu'
,p_message_text=>unistr('Gyakoris\00E1g')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563234484751486)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs konfigur\00E1lva e-mail-c\00EDm ehhez az alkalmaz\00E1shoz. Forduljon a rendszergazd\00E1hoz.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660689599751514)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Meg kell adnia az e-mail-c\00EDmet.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686444249751522)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E1sd a mell\00E9kletet')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686219732751522)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00E1rgy')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661639829751515)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Meg kell adni az e-mail-c\00EDmet.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685914207751522)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00EDmzett')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565026610751486)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'hu'
,p_message_text=>unistr('Enged\00E9lyezett')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609154657751499)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'hu'
,p_message_text=>unistr('Enged\00E9lyez\00E9s/Letilt\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608614295751499)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'hu'
,p_message_text=>'Hiba! %0'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608216779751499)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'hu'
,p_message_text=>unistr('P\00E9ld\00E1k')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609094313751499)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'hu'
,p_message_text=>unistr('P\00E9ld\00E1k:')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570565367751488)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('Null \00E9rt\00E9kek kiz\00E1r\00E1sa')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609672113751499)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kibont\00E1s/Becsuk\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607215774751499)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('Kifejez\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592161673751494)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603246357751497)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151k')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613966029751501)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151kifejez\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712139644751529)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAl hossz\00FA a sz\0171r\0151kifejez\00E9s.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556849579751484)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\00E9si javaslatok')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613850629751501)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151t\00EDpus')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609862126751499)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlopok kijel\00F6l\00E9se keres\00E9shez')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592460883751494)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'hu'
,p_message_text=>unistr('Visszatekint\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607022310751499)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('A visszatekint\0151 (flashback) lek\00E9rdez\00E9s lehet\0151v\00E9 teszi az adatok megtekint\00E9s\00E9t \00FAgy, mint egy kor\00E1bbi id\0151pontban.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661074395751514)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Visszatekint\00E9s id\0151tartama')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662407677751515)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('Form\00E1tum')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588234520751493)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'hu'
,p_message_text=>unistr('Form\00E1tummaszk %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599902397751496)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCggv\00E9ny')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607702048751499)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCggv\00E9nyek %0')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685473920751522)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCggv\00E9nyek / Oper\00E1torok')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599653230751496)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCggv\00E9ny %0')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591918104751494)
,p_name=>'APEXIR_GO'
,p_message_language=>'hu'
,p_message_text=>unistr('Ugr\00E1s')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565587235751486)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'hu'
,p_message_text=>unistr('z\00F6ld')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610523315751500)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1s oszlopok szerint')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610611902751500)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1s f\00FCggv\00E9nyek szerint')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545892828751481)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1si szempont')
,p_is_js_message=>true
,p_version_scn=>2704950
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686568068751522)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1s %0 szerint')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642002686751509)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('Meg kell adni a csoportos\00EDt\00E1s oszlop\00E1t.')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653148620751512)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1s t\00EDpus\00FA lek\00E9rdez\00E9shez a sorok maxim\00E1lis sz\00E1m\00E1t az alap lek\00E9rdez\00E9sben l\00E9v\0151 sorok sz\00E1ma korl\00E1tozza, nem a megjelen\00EDtett sorok sz\00E1ma. Ez az alap lek\00E9rdez\00E9s t\00FAll\00E9pi a sorok megengedett sz\00E1m\00E1t, ami %0. Haszn\00E1ljon sz\0171r\0151t, hogy cs\00F6kkentse a rek')
||unistr('ordok sz\00E1m\00E1t az alap lek\00E9rdez\00E9sben.')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633396546751506)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1s sorba rendez\00E9ssel')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690084349751523)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1s sorrendje')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534977864751477)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 csoportn\00E9zete')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570916759751488)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00EDzszintes oszlop')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604903524751498)
,p_name=>'APEXIR_HELP'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596724676751496)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Az interakt\00EDv kimutat\00E1sok r\00E9v\00E9n a felhaszn\00E1l\00F3k testre szabhatnak kimutat\00E1sokat. A felhaszn\00E1l\00F3k megv\00E1ltoztathatj\00E1k a kimutat\00E1s elrendez\00E9s\00E9t, ha oszlopokat jel\00F6lnek ki, sz\0171r\0151ket haszn\00E1lnak, kiemelnek \00E9s sorba rendeznek. A felhaszn\00E1l\00F3k megadhatnak t\00F6r\00E9s')
||unistr('eket, \00F6sszes\00EDt\00E9seket, diagramokat, csoportos\00EDt\00E1sokat \00E9s egy\00E9b saj\00E1t sz\00E1m\00EDt\00E1sokat. A felhaszn\00E1l\00F3knak feliratkoz\00E1si lehet\0151s\00E9ge is van, hogy e-mail-\00FCzenetben rendszeres id\0151k\00F6z\00F6nk\00E9nt megkapj\00E1k a kimutat\00E1s HTML-verzi\00F3j\00E1t. A felhaszn\00E1l\00F3k l\00E9trehozhatnak t\00F6b')
||unistr('b v\00E1ltozatot is a kimutat\00E1sb\00F3l, \00E9s azokat n\00E9vvel ell\00E1tva menthetik ak\00E1r nyilv\00E1nos, ak\00E1r saj\00E1t megtekint\00E9sre. '),
'<p/>',
unistr('A k\00F6vetkez\0151 szakaszok \00F6sszefoglalj\00E1k azokat a m\00F3dokat, amelyekkel testre szabhatnak egy interakt\00EDv kimutat\00E1st. A tov\00E1bbi r\00E9szleteket l\00E1sd az <i>Oracle APEX v\00E9gfelhaszn\00E1l\00F3i \00FAtmutat\00F3j\00E1ban</i> az "Interakt\00EDv kimutat\00E1sok haszn\00E1lata" c\00EDm alatt.')))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603881389751498)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'hu'
,p_message_text=>unistr('A M\0171veletek men\00FC az Ugr\00E1s gombt\00F3l jobbra jelenik meg a Keres\00E9si s\00E1von. Ez a men\00FC haszn\00E1lhat\00F3 az interakt\00EDv kimutat\00E1shoz.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597539380751496)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Az \00F6sszes\00EDt\00E9sek olyan matematikai sz\00E1m\00EDt\00E1sok, amelyek oszlopokon v\00E9gezhet\0151k. Az \00F6sszes\00EDt\00E9sek az egyes ellen\0151rz\0151 t\00F6r\00E9spontok ut\00E1n \00E9s a kimutat\00E1s v\00E9g\00E9n jelennek meg az erre defini\00E1lt oszlopban. A be\00E1ll\00EDt\00E1sok a k\00F6vetkez\0151k lehetnek:'),
'<p>',
'</p><ul>',
unistr('<li>Az <strong>\00D6sszes\00EDt\00E9s</strong> lehet\0151v\00E9 teszi egy el\0151z\0151leg defini\00E1lt'),
unistr('\00F6sszes\00EDt\00E9s szerkeszt\00E9s\00E9t.</li>'),
unistr('<li>A <strong>F\00FCggv\00E9ny</strong> a v\00E9grehajtand\00F3 f\00FCggv\00E9ny (p\00E9ld\00E1ul SUM, MIN).</li>'),
unistr('<li>Az <strong>Oszlop</strong> haszn\00E1lhat\00F3 annak az oszlopnak a kiv\00E1laszt\00E1s\00E1ra, amelyiken v\00E9grehajt\00F3dik a matematikai f\00FCggv\00E9ny. Csak a sz\00E1m'),
'oszlopok jelennek meg.</li>',
'</ul>'))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597619386751496)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Mentett kimutat\00E1sonk\00E9nt csak egy diagram defini\00E1lhat\00F3. Ha defini\00E1lva lett,'),
unistr('a Keres\00E9s eszk\00F6zt\00E1r megjelen\00EDt\00E9si ikonj\00E1val v\00E1ltogathat a diagramos \00E9s a kimutat\00E1sos n\00E9zet k\00F6z\00F6tt.'),
unistr('A be\00E1ll\00EDt\00E1sok a k\00F6vetkez\0151k lehetnek: '),
'<p>',
'</p><ul>',
unistr('<li>A <strong>Diagramt\00EDpus</strong> hat\00E1rozza meg a beker\00FCl\0151 diagram t\00EDpus\00E1t.'),
unistr('V\00E1laszthat\00F3 v\00EDzszintes s\00E1v, f\00FCgg\0151leges s\00E1v, k\00F6rdiagram \00E9s grafikon.</li>'),
unistr('<li>A <strong>Felirat</strong> haszn\00E1lat\00E1val adhat\00F3 meg, hogy melyik oszlop legyen haszn\00E1lva feliratk\00E9nt.</li>'),
unistr('<li>A <strong>Tengelyc\00EDm a felirathoz</strong> az a c\00EDm, amelyik a Felirathoz v\00E1lasztott oszlophoz kapcsol\00F3d\00F3 tengely mellett'),
unistr('jelenik meg. K\00F6rdiagramn\00E1l ez nem el\00E9rhet\0151.</li>'),
unistr('<li>Az <strong>\00C9rt\00E9k</strong> teszi lehet\0151v\00E9 az \00E9rt\00E9kk\00E9nt haszn\00E1lt oszlop kijel\00F6l\00E9s\00E9t. Ha a'),
unistr('f\00FCggv\00E9ny a COUNT, az \00C9rt\00E9k kijel\00F6l\00E9se nem sz\00FCks\00E9ges.</li>'),
unistr('<li>A <strong>Tengelyc\00EDm az \00E9rt\00E9khez</strong> az a c\00EDm, amelyik az \00C9rt\00E9khez v\00E1lasztott oszlophoz kapcsol\00F3d\00F3 tengelyen jelenik meg.'),
unistr('K\00F6rdiagramn\00E1l ez nem el\00E9rhet\0151.</li>'),
unistr('<li>A <strong>F\00FCggv\00E9ny</strong> az \00C9rt\00E9khez v\00E1lasztott oszlopon esetleg v\00E9grehajthat\00F3 f\00FCggv\00E9ny.</li>'),
unistr('<li>A <strong>Rendez\00E9s</strong> teszi lehet\0151v\00E9 az eredm\00E9nyhalmaz elemeinek a sorrendj\00E9t.</li></ul>')))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596921558751496)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Az oszlopfejl\00E9cre kattint\00E1s megjelen\00EDt egy oszlopfejl\00E9c men\00FCt. A lehets\00E9ges be\00E1ll\00EDt\00E1sok:'),
'<p></p>',
'<ul>',
unistr('<li>A <strong>N\00F6vekv\0151 sorrend</strong> ikon a kimutat\00E1st a n\00F6vekv\0151 sorrend\0171 oszlop szerint rendezi sorba.</li>'),
unistr('<li>A <strong>Cs\00F6kken\0151 sorrend</strong> ikon a kimutat\00E1st a cs\00F6kken\0151 sorrend\0171 oszlop szerint rendezi sorba.</li>'),
unistr('<li>Az <strong>Oszlop elrejt\00E9se</strong> elrejti az oszlopot. Nem minden oszlop rejthet\0151 el. Ha nem rejthet\0151 el egy oszlop, ott nem jelenik meg Oszlop elrejt\00E9se ikon.</li>'),
unistr('<li>A <strong>Csoportt\00F6r\0151 oszlop</strong> csoportt\00F6r\0151v\00E9 teszi az oszlopot. Ez mint t\00F6rzsrekordot kiveszi a kimutat\00E1sb\00F3l.</li>'),
unistr('<li>Az <strong>Oszlopinform\00E1ci\00F3</strong> megjelen\00EDti az oszlopra vonatkoz\00F3 s\00FAg\00F3t, ha van.</li>'),
unistr('<li>A <strong>Sz\00F6vegter\00FClet</strong> haszn\00E1lhat\00F3 olyan keresend\0151 sz\00F6veg be\00EDr\00E1s\00E1ra, ahol a nagy- \00E9s kisbet\0171k azonosnak sz\00E1m\00EDtanak (nincs sz\00FCks\00E9g helyettes\00EDt\0151 karakterekre).'),
unistr('Egy \00E9rt\00E9k be\00EDr\00E1sa r\00F6vid\00EDti a men\00FC alj\00E1n az \00E9rt\00E9kek list\00E1j\00E1t. Ezut\00E1n v\00E1laszthat lentr\0151l \00E9rt\00E9ket, \00E9s a v\00E1lasztott \00E9rt\00E9k az ''='' egyenl\0151s\00E9gjelet haszn\00E1l\00F3 sz\0171r\0151k\00E9nt j\00F6n l\00E9tre'),
unistr('(p\00E9ld\00E1ul <code>oszlop = ''ABC''</code>). M\00E1sik m\00F3dk\00E9nt kattinthat a Zsebl\00E1mpa ikonra \00E9s be\00EDrhatja a sz\0171r\0151 \00E9rt\00E9k\00E9t egy\00FCtt a ''LIKE'' m\00F3dos\00EDt\00F3val'),
unistr('(p\00E9ld\00E1ul <code>oszlop LIKE ''%ABC%''</code>).</li>'),
unistr('<li>Az <strong>Egyedi \00E9rt\00E9kek list\00E1ja</strong> tartalmazza az els\0151 500 olyan'),
unistr('egyedi \00E9rt\00E9ket, amelyik megfelel a sz\0171r\00E9si felt\00E9teleknek. Ha az'),
unistr('oszlop d\00E1tum, akkor a lista ink\00E1bb a d\00E1tumtartom\00E1nyokat jelen\00EDti meg.'),
unistr('Ha \00E9rt\00E9ket jel\00F6l ki, a sz\0171r\0151 l\00E9trehoz\00E1sa az ''='' haszn\00E1lat\00E1val t\00F6rt\00E9nik'),
unistr('(p\00E9ld\00E1ul <code>oszlop = ''ABC''</code>).</li>'),
'</ul>'))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597495469751496)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Lehet\0151v\00E9 teszi, hogy a kimutat\00E1sba felvegyen sz\00E1m\00EDtott oszlopokat. Ezek lehetnek matematikai sz\00E1m\00EDt\00E1sok (p\00E9ld\00E1ul <code>NBR_HOURS/24</code>) vagy l\00E9tez\0151 oszlopokra'),
unistr('alkalmazott szabv\00E1nyos Oracle f\00FCggv\00E9nyek. N\00E9h\00E1nyan p\00E9ldak\00E9nt jelennek meg, illetve a t\00F6bbi (p\00E9ld\00E1ul a <code>TO_DATE)</code>) is haszn\00E1lhat\00F3. A be\00E1ll\00EDt\00E1sok a k\00F6vetkez\0151k lehetnek:'),
'<p></p>',
'<ul>',
unistr('<li>A <strong>Sz\00E1m\00EDt\00E1s</strong> lehet\0151v\00E9 teszi, hogy szerkeszt\00E9sre kiv\00E1lasszon egy el\0151zetesen defini\00E1lt sz\00E1m\00EDt\00E1st.</li>'),
unistr('<li>Az <strong>Oszlopfejl\00E9c</strong> az \00FAj oszlop oszlopfejl\00E9ce.</li>'),
unistr('<li>A <strong>Form\00E1tummaszk</strong> az az Oracle form\00E1tummaszk, amelyik \00E9rv\00E9nyes\00EDtve lesz az oszlopra (p\00E9ld\00E1ul S9999).</li>'),
unistr('<li>A <strong>Sz\00E1m\00EDt\00E1s</strong> a v\00E9grehajtand\00F3 sz\00E1m\00EDt\00E1s. A sz\00E1m\00EDt\00E1sban az oszlopokra hivatkoz\00E1s a megjelen\00EDtett aliasok haszn\00E1lat\00E1val t\00F6rt\00E9nik.</li>'),
'</ul>',
unistr('<p>A sz\00E1m\00EDt\00E1s alatt a lek\00E9rdez\00E9sben l\00E9v\0151 oszlopokra a hivatkoz\00E1s a kapcsol\00F3d\00F3'),
unistr('alias haszn\00E1lat\00E1val t\00F6rt\00E9nik. Ha r\00E1kattint az oszlopn\00E9vre vagy az aliasra, akkor az'),
unistr('beker\00FCl a Sz\00E1m\00EDt\00E1sba. Az Oszlopok mellett billenty\0171zet l\00E1that\00F3. Ez a billenty\0171zet'),
unistr('a rendszeresen haszn\00E1lt billenty\0171k "parancsikonjak\00E9nt" m\0171k\00F6dik. A jobb sz\00E9len vannak a F\00FCggv\00E9nyek.</p>'),
unistr('<p>A k\00F6vetkez\0151 sz\00E1m\00EDt\00E1si p\00E9lda szeml\00E9lteti a teljes d\00EDjaz\00E1st:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(ahol A a SZERVEZET, B a B\00C9R, a C pedig a JUTAL\00C9K)'),
''))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603981891751498)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez haszn\00E1lhat\00F3 egy vagy t\00F6bb oszlop ut\00E1n egy t\00F6r\00E9si csoport elk\00FCl\00F6n\00EDt\00E9s\00E9re. Ez kiveszi az oszlopokat az interakt\00EDv kimutat\00E1sb\00F3l, \00E9s azokat k\00FCl\00F6n t\00F6rzsrekordokk\00E9nt jelen\00EDti meg.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598123468751496)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('A r\00E9szletek vagy egyszerre egy sor megtekint\00E9s\00E9hez kattintson a megtekinteni k\00EDv\00E1nt sorban az egysoros megtekint\00E9s ikonj\00E1ra. Ha van, az egysoros megtekint\00E9sben mindig az els\0151 oszlop lesz. Az interakt\00EDv kimutat\00E1s testreszab\00E1s\00E1t\00F3l f\00FCgg\0151en, az egysoros ')
||unistr('megtekint\00E9s lehet a szabv\00E1nyos megtekint\00E9s vagy az az egy\00E9ni oldal, amelyik lehet\0151v\00E9 teszi a m\00F3dos\00EDt\00E1st.')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598005500751496)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'hu'
,p_message_text=>unistr('Lehet\0151v\00E9 teszi az aktu\00E1lis eredm\00E9nyhalmaz let\00F6lt\00E9s\00E9t. A let\00F6lthet\0151 form\00E1tumok a PDF, Excel, HTML \00E9s CSV. A let\00F6lt\00E9si lehet\0151s\00E9gek a kiv\00E1lasztott form\00E1tumt\00F3l f\00FCgg\0151en elt\00E9rnek. Minden form\00E1tum elk\00FCldhet\0151 e-mailk\00E9nt is.')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597118072751496)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('A kimutat\00E1sban f\00F3kusz\00E1lni a lek\00E9rdez\00E9s <code>WHERE</code> utas\00EDt\00E1sr\00E9sz\00E9nek megad\00E1s\00E1val vagy m\00F3dos\00EDt\00E1s\00E1val lehet. Sz\0171rni oszlopra vagy sorra lehet.'),
unistr('<p>Ha oszlopra sz\0171r, jel\00F6lj\00F6n ki egy oszlopot (nem sz\00FCks\00E9ges, hogy ez megjelenjen), v\00E1lasszon egy szabv\00E1nyos Oracle m\0171veletet (=, !=, not in, between), \00E9s adja meg az \00F6sszehasonl\00EDtand\00F3 kifejez\00E9st. A kifejez\00E9s a kis- \00E9s a nagybet\0171ket megk\00FCl\00F6nb\00F6zteti. ')
||unistr('Helyettes\00EDt\0151 karakterk\00E9nt haszn\00E1lja a % jelet (p\00E9ld\00E1ul <code>STATE_NAME like A%)</code>.</p>'),
unistr('<p>Ha soronk\00E9nt sz\0171r, l\00E9trehozhat egy \00F6sszetett <code>WHERE</code> utas\00EDt\00E1sr\00E9szt az oszlop-p\00F3tnevek \00E9s b\00E1rmilyen Oracle f\00FCggv\00E9ny vagy m\0171velet haszn\00E1lat\00E1val (p\00E9ld\00E1ul <code>G = ''VA'' or G = ''CT''</code>, ahol a'),
'<code>G</code> a <code>CUSTOMER_STATE</code> aliasneve).</p>',
''))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597705229751496)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('A flashback t\00EDpus\00FA lek\00E9rdez\00E9s lehet\0151v\00E9 teszi, hogy \00FAgy tekintse meg az adatokat, ahogy azok'),
unistr('egy kor\00E1bbi id\0151pontban voltak. Alap\00E9rtelmezetten az ilyen visszatekint\00E9s legfeljebb 3 \00F3r\00E1ra'),
unistr('(vagy 180 percre) korl\00E1tozott, de az egyes adatb\00E1zisokn\00E1l a t\00E9nyleges id\0151hossz elt\00E9r\0151 lehet.')))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662302655751515)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>A Form\00E1tum teszi lehet\0151v\00E9, hogy testre szabja a kimutat\00E1s megjelen\00E9s\00E9t.'),
unistr('A Form\00E1tum a k\00F6vetkez\0151 almen\00FCt tartalmazza:</p>'),
unistr('<ul><li>Rendez\00E9s</li>'),
unistr('<li>Ellen\0151rz\0151 t\00F6r\00E9spont</li>'),
unistr('<li>Kiemel\00E9s</li>'),
unistr('<li>Sz\00E1m\00EDt\00E1s</li>'),
unistr('<li>\00D6sszes\00EDt\00E9s</li>'),
'<li>Diagram</li>',
unistr('<li>Csoportos\00EDt\00E1si szempont</li>'),
unistr('<li>Kimutat\00E1st\00E1bla</li>'),
'</ul>',
''))
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660579827751514)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Mentett jelent\00E9senk\00E9nt egy Csoportos\00EDt\00E1s n\00E9zet defini\00E1lhat\00F3. Ha m\00E1r defini\00E1lva lett, a Keres\00E9s eszk\00F6zt\00E1ron a megfelel\0151 ikonokkal v\00E1ltogathat a csoportos\00EDt\00E1s \00E9s a jelent\00E9s t\00EDpus\00FA megjelen\00EDt\00E9s k\00F6z\00F6tt. A Csoportos\00EDt\00E1s \00FAjabb n\00E9zet\00E9nek l\00E9trehoz\00E1s\00E1hoz v\00E1la')
||'sszon: ',
'<p></p><ul>',
unistr('<li>oszlopokat, amelyek a csoportos\00EDt\00E1s alapj\00E1t k\00E9pezik</li>'),
unistr('<li>oszlopokat, amelyeken az \00F6sszes\00EDt\0151 f\00FCggv\00E9nyek (average, sum, count stb.) elv\00E9gzik a sz\00E1m\00EDt\00E1saikat</li>'),
'</ul>'))
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597398130751496)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ez lehet\0151v\00E9 teszi a sz\0171r\0151 defini\00E1l\00E1s\00E1t. A sz\0171r\0151felt\00E9telnek megfelel\0151 sorok kiemeltek lesznek azon jellemz\0151k haszn\00E1lat\00E1val, amelyek a sz\0171r\0151h\00F6z kapcsol\00F3dnak. A lehets\00E9ges be\00E1ll\00EDt\00E1sok:</p>'),
'<ul>',
unistr('<li>A <strong>N\00E9v</strong> csak a megjelen\00EDt\00E9shez haszn\00E1lhat\00F3.</li>'),
unistr('<li>A <strong>Sorrend</strong> azt a sorrendet azonos\00EDtja, amelyikben a szab\00E1lyok ki\00E9rt\00E9kel\0151dnek.</li>'),
unistr('<li>Az <strong>Enged\00E9lyezett</strong> jelzi, hogy a szab\00E1ly enged\00E9lyezett vagy letiltott.</li>'),
unistr('<li>A <strong>Kiemel\00E9s t\00EDpusa</strong> azt jelzi, hogy a sor vagy a cella legyen'),
unistr('kiemelve. Ha a Cella van kijel\00F6lve, a Kiemel\00E9si felt\00E9telben hivatkozott oszlop lesz'),
'kiemelve.</li>',
unistr('<li>A <strong>H\00E1tt\00E9rsz\00EDn</strong> a kijel\00F6lt ter\00FClet h\00E1tter\00E9nek \00FAj sz\00EDne.</li>'),
unistr('<li>A <strong>Sz\00F6vegsz\00EDn</strong> a kijel\00F6lt ter\00FCleten l\00E9v\0151 sz\00F6veg \00FAj sz\00EDne.</li>'),
unistr('<li>A <strong>Kiemel\00E9si felt\00E9tel</strong> hat\00E1rozza meg a sz\0171r\00E9si felt\00E9telt.</li>'),
'</ul>',
''))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490738120751464)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Mentett jelent\00E9senk\00E9nt egy Kimutat\00E1s n\00E9zet defini\00E1lhat\00F3. Ha m\00E1r defini\00E1lva lett, a Keres\00E9s eszk\00F6zt\00E1ron a megfelel\0151 ikonokkal v\00E1ltogathat a kimutat\00E1s \00E9s a jelent\00E9s t\00EDpus\00FA megjelen\00EDt\00E9s k\00F6z\00F6tt. A Kimutat\00E1s \00FAjabb n\00E9zet\00E9nek l\00E9trehoz\00E1s\00E1hoz v\00E1lasszon: '),
'<p></p>',
'<ul>',
unistr('<li>oszlopokat, amelyeken \00E1tfordul a kimutat\00E1s</li>'),
unistr('<li>oszlopokat, amelyek sork\00E9nt jelennek meg</li>'),
unistr('<li>oszlopokat, amelyeken az \00F6sszes\00EDt\0151 f\00FCggv\00E9nyek (average, sum, count stb.) elv\00E9gzik a sz\00E1m\00EDt\00E1saikat</li>'),
'</ul>'))
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608430771751499)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ha testre szab egy interakt\00EDv kimutat\00E1st, a kimutat\00E1s be\00E1ll\00EDt\00E1sai a'),
unistr('Keres\00E9s eszk\00F6zt\00E1r alatt \00E9s a kimutat\00E1s f\00F6l\00F6tt jelennek meg. Ez a ter\00FClet'),
unistr('a balra tal\00E1lhat\00F3 ikonnal becsukhat\00F3 \00E9s kibonthat\00F3.'),
'<p>',
unistr('Az egyes kimutat\00E1s-be\00E1ll\00EDt\00E1sokn\00E1l a k\00F6vetkez\0151ket teheti:'),
'</>< ul>',
unistr('<li>A n\00E9vre kattintva szerkesztheti a be\00E1ll\00EDt\00E1st.</li>'),
unistr('<li>A be\00E1ll\00EDt\00E1s letilt\00E1s\00E1hoz/enged\00E9lyez\00E9s\00E9hez az Enged\00E9lyez\00E9s/Letilt\00E1s jel\00F6l\0151n\00E9gyzet haszn\00E1lhat\00F3. A be\00E1ll\00EDt\00E1s ideiglenesen is ezzel kapcsolhat\00F3 be \00E9s ki.</li>'),
unistr('<li>Be\00E1ll\00EDt\00E1st az Elt\00E1vol\00EDt\00E1s ikonnal t\00E1vol\00EDthat el.</li>'),
'</ul>',
unistr('<p>Ha diagramot vagy csoportos\00EDt\00E1st hozott l\00E9tre, v\00E1ltogathat k\00F6z\00F6tt\00FCk \00E9s az'),
unistr('alapkimutat\00E1s k\00F6z\00F6tt a Jelent\00E9s, a Diagram vagy a Csoportos\00EDt\00E1s n\00E9zet jobbra'),
unistr('l\00E1that\00F3 hivatkoz\00E1s\00E1val. A diagram vagy a csoportos\00EDt\00E1s megtekint\00E9sekor \00D6n'),
unistr('m\00F3dos\00EDthatja a be\00E1ll\00EDt\00E1sokat a Szerkeszt\00E9s hivatkoz\00E1s haszn\00E1lat\00E1val.</p>'),
''))
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597905212751496)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Vissza\00E1ll\00EDtja a kimutat\00E1st az alap\00E9rtelmezett be\00E1ll\00EDt\00E1sokra, elt\00E1vol\00EDtva azokat a testreszab\00E1sokat, amelyeket \00D6n m\00E1r elv\00E9gzett.')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662613522751515)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Be\00E1ll\00EDtja az oldalank\00E9nt megjelen\00EDteni k\00EDv\00E1nt rekordok sz\00E1m\00E1t.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597880988751496)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Menti a testre szabott kimutat\00E1st a j\00F6v\0151beli haszn\00E1lathoz. \00D6nnek meg kell adni a nevet, opcion\00E1lisan a le\00EDr\00E1st, \00E9s nyilv\00E1nosan el\00E9rhet\0151v\00E9 kell tenni (azaz azok r\00E9sz\00E9re, akik hozz\00E1f\00E9rhetnek az els\0151dleges kimutat\00E1shoz). Az interakt\00EDv kimutat\00E1sok n\00E9g')
||unistr('y t\00EDpusa menthet\0151:</p>'),
'<ul>',
unistr('<li><strong>Els\0151dleges alap\00E9rtelmez\00E9s</strong> (Csak fejleszt\0151knek). Az Els\0151dleges alap\00E9rtelmez\00E9s az a kimutat\00E1s, amelyik a kezdetkor jelenik meg. Az Els\0151dleges alap\00E9rtelmez\00E9s nem nevezhet\0151 \00E1t, \00E9s nem is t\00F6r\00F6lhet\0151.</li>'),
unistr('<li><strong>Alternat\00EDv kimutat\00E1s</strong> (Csak fejleszt\0151knek). Lehet\0151v\00E9 teszi, hogy a fejleszt\0151 t\00F6bb kimutat\00E1s-elrendez\00E9st is l\00E9trehozzon. Alternat\00EDv kimutat\00E1st csak a fejleszt\0151k nevezhetnek \00E1t, illetve csak \0151k t\00F6r\00F6lhetik.</li>'),
unistr('<li><strong>Nyilv\00E1nos kimutat\00E1s</strong> (V\00E9gfelhaszn\00E1l\00F3i). Csak a l\00E9trehoz\00F3 v\00E9gfelhaszn\00E1l\00F3 mentheti, nevezheti \00E1t, illetve t\00F6r\00F6lheti. M\00E1s felhaszn\00E1l\00F3k csak megtekinthetik, illetve az elrendez\00E9s\00E9t menthetik m\00E1sik k\00FCl\00F6n kimutat\00E1sk\00E9nt.</li>'),
unistr('<li><strong>Priv\00E1t kimutat\00E1s</strong> (V\00E9gfelhaszn\00E1l\00F3i). Csak a l\00E9trehoz\00F3 v\00E9gfelhaszn\00E1l\00F3 tekintheti meg, mentheti, nevezheti \00E1t, illetve t\00F6r\00F6lheti.</li>'),
'</ul>',
unistr('<p>Ha testre szabott kimutat\00E1sokat ment, a Kimutat\00E1sv\00E1laszt\00F3 a Keres\00E9s s\00E1von a Sorv\00E1laszt\00F3 (ha ez be van kapcsolva) bal oldal\00E1n jelenik meg.</p>'),
''))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596830029751496)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Az egyes kimutat\00E1soldalak tetej\00E9n keres\00E9si ter\00FClet is van. Ez a ter\00FClet (illetve Keres\00E9s s\00E1v) a k\00F6vetkez\0151 funkci\00F3kat biztos\00EDtja:')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663217857751515)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'hu'
,p_message_text=>unistr('<li>A <strong>M\0171veletek men\00FC</strong> teszi lehet\0151v\00E9 a kimutat\00E1st\00E1bla testreszab\00E1s\00E1t. L\00E1sd a k\00F6vetkez\0151 szakaszokat.</li>')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662782605751515)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'hu'
,p_message_text=>unistr('<li>Az <strong>Oszlopok kijel\00F6l\00E9se ikon</strong> teszi lehet\0151v\00E9, hogy azonos\00EDtsa, a keres\00E9s melyik (vagy mindegyik) oszlopban t\00F6rt\00E9njen.</li>')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663046932751515)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'hu'
,p_message_text=>unistr('<li>A <strong>Kimutat\00E1sok</strong> megjelen\00EDti az alternat\00EDv alap\00E9rtelmez\00E9st, \00E9s a mentett szem\00E9lyes vagy nyilv\00E1nos kimutat\00E1sokat.</li>')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662992825751515)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('<li>A <strong>Sorok</strong> \00E1ll\00EDtja be az oldalank\00E9nt megjelen\00EDtend\0151 sorok sz\00E1m\00E1t.</li>')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662874935751515)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li>A <strong>Sz\00F6vegter\00FClet</strong> teszi lehet\0151v\00E9 olyan keres\00E9si felt\00E9tel be\00EDr\00E1s\00E1t, amelyikn\00E9l a kisbet\0171 \00E9s a nagybet\0171 azonosnak tekintend\0151 (a helyettes\00EDt\0151 karaktereket is bele\00E9rtve).</li>'),
unistr('<li>Az <strong>Ind\00EDt\00E1s gomb</strong> v\00E9grehajtja a keres\00E9st. Az Enter billenty\0171 lenyom\00E1sa akkor is v\00E9grehajtja a keres\00E9st, amikor a kurzor m\00E9g a keresend\0151 sz\00F6veg mez\0151j\00E9ben van.</li>')))
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663173604751515)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('<li>A <strong>Megtekint\00E9si ikonok</strong> v\00E1ltogat a kimutat\00E1s k\00F6vetkez\0151 n\00E9zetei k\00F6z\00F6tt, ha azok defini\00E1lva lettek: ikon, kimutat\00E1s, r\00E9szlet, diagram, csoportos\00EDt\00E1s \00E9s kimutat\00E1st\00E1bla.</li>')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597000023751496)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez haszn\00E1lhat\00F3 a megjelen\00EDtett oszlopok m\00F3dos\00EDt\00E1s\00E1ra. A jobbra l\00E9v\0151 oszlopok jelennek meg. A balra l\00E9v\0151 oszlopok rejtettek. A megjelen\00EDtett oszlopok sorrendj\00E9t a jobb sz\00E9len l\00E9v\0151 nyilakkal rendezheti \00E1t. A sz\00E1m\00EDtott oszlopok jel\00F6l\00E9se ez: <strong>**</')
||'strong>.'
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139597298595751496)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Ezzel v\00E1ltoztathat\00F3 meg, hogy melyik oszlop legyen rendezve, \00E9s azt is meghat\00E1rozza,'),
unistr('hogy az n\00F6vekv\0151 vagy cs\00F6kken\0151 sorrend\0171 legyen. \00D6n azt is meghat\00E1rozhatja, hogy hogyan kezelend\0151k a'),
unistr('<code>NULL</code> \00E9rt\00E9kek. Az alap\00E9rtelmezett be\00E1ll\00EDt\00E1s szerint a <code>NULL</code> mindig az utols\00F3, vagy mindig az els\0151. '),
unistr('A sorba rendez\00E9s eredm\00E9nye az oszlopfejl\00E9ct\0151l jobbra jelenik meg a kimutat\00E1sban.</p>')))
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660301226751514)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Feliratkoz\00E1s hozz\00E1ad\00E1sakor \00D6nnek meg kell adni az e-mail-c\00EDmet (vagy t\00F6bb e-mail-c\00EDmet vessz\0151vel elv\00E1lasztva), a lev\00E9l t\00E1rgy\00E1t, gyakoris\00E1g\00E1t, valamint a kezd\0151 \00E9s befejez\0151 d\00E1tumot. Az eredm\00E9ny\00FCl kapott e-mailek tartalmazz\00E1k az aktu\00E1lis adatokat tartal')
||unistr('maz\00F3 interakt\00EDv kimutat\00E1s export\00E1lt verzi\00F3j\00E1t (PDF, Excel, HTML vagy CSV) annak a kimutat\00E1si be\00E1ll\00EDt\00E1snak a haszn\00E1lat\00E1val, amelyik jelen volt a feliratkoz\00E1s hozz\00E1ad\00E1sakor')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601916773751497)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlop elrejt\00E9se')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592379358751494)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kiemel\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603474504751498)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kiemel\00E9sek')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573630562751489)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'hu'
,p_message_text=>unistr('Cella kiemel\00E9se, %0 ezen: %1')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608570145751499)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'hu'
,p_message_text=>unistr('Felt\00E9tel kiemel\00E9se')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573572782751489)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor kiemel\00E9se, %0 ezen: %1')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660903563751514)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'hu'
,p_message_text=>unistr('St\00EDlus kiemel\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565145456751486)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00EDpus kiemel\00E9se')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679749887751520)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00EDzszintes')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708731002751528)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'hu'
,p_message_text=>unistr('1 inakt\00EDv be\00E1ll\00EDt\00E1s')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708882244751528)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 inakt\00EDv be\00E1ll\00EDt\00E1s')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598591077751496)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'hu'
,p_message_text=>unistr('Interakt\00EDv kimutat\00E1s s\00FAg\00F3ja')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609537044751499)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602965053751497)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen sz\00E1m\00EDt\00E1si kifejez\00E9s. %0')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558536138751484)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('A z\00E1r\00F3 d\00E1tumnak k\00E9s\0151bbinek kell lennie a kezd\0151 d\00E1tumn\00E1l.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617729274751502)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen sz\0171r\00E9si kifejez\00E9s. %0')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687586659751522)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen sz\0171r\0151lek\00E9rdez\00E9s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708936816751529)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'hu'
,p_message_text=>unistr('1 \00E9rv\00E9nytelen be\00E1ll\00EDt\00E1s')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709096812751529)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00E9rv\00E9nytelen be\00E1ll\00EDt\00E1s')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661102373751514)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'hu'
,p_message_text=>'(percben)'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678172602751519)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a legut\00F3bbiban: %1')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678310042751520)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 a k\00F6vetkez\0151ben: %1')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678211354751519)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a legut\00F3bbiban: %1')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678476869751520)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nem a k\00F6vetkez\0151ben: %1')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607619492751499)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'hu'
,p_message_text=>unistr('Billenty\0171zet')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571325453751488)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00EDmke %0')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601510736751497)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Tengelyc\00EDm a felirathoz')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593837572751495)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 nap')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594053650751495)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 \00F3ra')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593541228751495)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 h\00F3nap')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593641799751495)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 h\00E9t')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593786227751495)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 nap')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593984349751495)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 \00F3ra')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593319651751495)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 %0 \00E9v')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593476255751495)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 \00E9v')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571227402751488)
,p_name=>'APEXIR_LINE'
,p_message_language=>'hu'
,p_message_text=>'Vonaldiagram'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568021522751487)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'hu'
,p_message_text=>unistr('Grafikon \00E9s ter\00FCletdiagram')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687412360751522)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9pezze le ezt')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602413629751497)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'hu'
,p_message_text=>unistr('Becsl\00E9s szerint a lek\00E9rdez\00E9s t\00FAl fogja l\00E9pni az er\0151forr\00E1sok megengedett korl\00E1tj\00E1t. M\00F3dos\00EDtsa a kimutat\00E1s be\00E1ll\00EDt\00E1sait \00E9s pr\00F3b\00E1lja meg \00FAjra.')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583886756751492)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'hu'
,p_message_text=>unistr('A kimutat\00E1sban a sorok maxim\00E1lis sz\00E1ma %0. Adjon meg megfelel\0151 sz\0171r\0151felt\00E9teleket, hogy korl\00E1tozza a rekordok sz\00E1m\00E1t a lek\00E9rdez\00E9sben.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688038561751522)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'hu'
,p_message_text=>'Maximum: %0'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688235984751522)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6z\00E9p\00E9rt\00E9k: %0')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530521434751476)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCzenet')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588147206751493)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 perccel ezel\0151tt')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688173234751522)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'hu'
,p_message_text=>'Minimum: %0'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687145386751522)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00F3nap')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661591210751515)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'hu'
,p_message_text=>'Havonta'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600716656751497)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1thelyez\00E9s')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600634075751497)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('Mind \00E1thelyez\00E9se')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713870199751530)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('A r\00E9gi\00F3 statikus azonos\00EDt\00F3j\00E1t meg kell adni, mivel az oldal t\00F6bb interakt\00EDv kimutat\00E1st tartalmaz.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566777351751487)
,p_name=>'APEXIR_NAME'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00E9v')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596484695751495)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DAj \00F6sszevon\00E1s')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709686807751529)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DAj kateg\00F3ria')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596584775751495)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DAj sz\00E1m\00EDt\00E1s')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591234686751494)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594333692751495)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 nap')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594162040751495)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 \00F3ra')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594643708751495)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 h\00F3nap')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594580522751495)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 h\00E9t')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594450129751495)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 nap')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594214893751495)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 \00F3ra')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594878877751495)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 %0 \00E9v')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594793522751495)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 \00E9v')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567075494751487)
,p_name=>'APEXIR_NO'
,p_message_language=>'hu'
,p_message_text=>'Nem'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609762291751499)
,p_name=>'APEXIR_NONE'
,p_message_language=>'hu'
,p_message_text=>unistr('- \00DCres -')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660757901751514)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen e-mail-c\00EDm.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532887584751477)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincsenek megjelen\00EDt\00E9sre kijel\00F6lt oszlopok. Az oszlopok megjelen\00EDt\00E9s\00E9hez v\00E1lassza a M\0171veletek men\00FC <strong>Oszlopok</strong> lehet\0151s\00E9g\00E9t.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606242169751498)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'hu'
,p_message_text=>unistr('A null \00E9rt\00E9kek mindig az els\0151k')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606112822751498)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('A null \00E9rt\00E9kek mindig az utols\00F3k')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606671243751498)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'hu'
,p_message_text=>unistr('Null \00E9rt\00E9k rendez\00E9se: %0')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603093867751497)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'hu'
,p_message_text=>unistr('A visszatekint\00E9si id\0151 csak sz\00E1m lehet.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602684524751497)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'hu'
,p_message_text=>unistr('A sorrend csak sz\00E1m alap\00FA lehet.')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607155077751499)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Oper\00E1tor')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565622496751486)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'hu'
,p_message_text=>unistr('narancss\00E1rga')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679634758751520)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00E1jol\00E1s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567521751751487)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'hu'
,p_message_text=>unistr('Egy\00E9b')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533701796751477)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 t\00F6rdel\00E9se')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547781477751481)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldalt\00E1jol\00E1s')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548448511751481)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'hu'
,p_message_text=>unistr('Fekv\0151')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548547155751481)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1ll\00F3')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547661161751481)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldalm\00E9ret')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548259218751481)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'hu'
,p_message_text=>'A3'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548146666751481)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'hu'
,p_message_text=>'A4'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548314320751481)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'hu'
,p_message_text=>unistr('Egy\00E9ni')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547905009751481)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'hu'
,p_message_text=>'Legal'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547826752751481)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'hu'
,p_message_text=>'Letter'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548055168751481)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'hu'
,p_message_text=>'Tabloid'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688583161751523)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'hu'
,p_message_text=>unistr('A teljes %0 mennyis\00E9g sz\00E1zal\00E9ka (%)')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687703377751522)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'hu'
,p_message_text=>unistr('A teljes %0 \00F6sszeg sz\00E1zal\00E9ka (%)')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686741024751522)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('A teljes mennyis\00E9g sz\00E1zal\00E9ka')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686646047751522)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'hu'
,p_message_text=>unistr('A teljes \00F6sszeg sz\00E1zal\00E9ka')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571192047751488)
,p_name=>'APEXIR_PIE'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6rdiagram')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636889451751507)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1st\00E1bla')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638314943751508)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('Meg kell adni az \00F6sszes\00EDt\00E9st.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638546237751508)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'hu'
,p_message_text=>unistr('Soroszlopk\00E9nt kijel\00F6lt oszlopon nem lehet \00F6sszes\00EDteni.')
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637735528751508)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1soszlopok')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637528709751508)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1soszlop %0')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638155088751508)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('Meg kell adni a forgat\00E1si oszlopot.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490683203751464)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s t\00EDpus\00FA lek\00E9rdez\00E9shez a sorok maxim\00E1lis sz\00E1m\00E1t az alap lek\00E9rdez\00E9sben l\00E9v\0151 sorok sz\00E1ma korl\00E1tozza, nem a megjelen\00EDtett sorok sz\00E1ma. Ez az alap lek\00E9rdez\00E9s t\00FAll\00E9pi a sorok megengedett sz\00E1m\00E1t, ami %0. Haszn\00E1ljon sz\0171r\0151t, hogy cs\00F6kkentse a rekordo')
||unistr('k sz\00E1m\00E1t az alap lek\00E9rdez\00E9sben.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638070509751508)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s sorba rendez\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604005141751498)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'hu'
,p_message_text=>unistr('A kimutat\00E1soszlop t\00FAl sok elt\00E9r\0151 \00E9rt\00E9ket tartalmaz - nem \00E1ll\00EDthat\00F3 el\0151 a kimutat\00E1s SQL utas\00EDt\00E1sa.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535057633751477)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 kimutat\00E1sn\00E9zete')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660843922751514)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151n\00E9zet')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591342688751494)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685649027751522)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'hu'
,p_message_text=>unistr('Els\0151dleges')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661805120751515)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Els\0151dleges kimutat\00E1s')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547543196751481)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'hu'
,p_message_text=>unistr('El\00E9rhet\0151s\00E9gi c\00EDmk\00E9kkel egy\00FCtt')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508349407751470)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Rich Text lefejt\00E9se')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616768938751501)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Szem\00E9lyes')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571721778751488)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'hu'
,p_message_text=>unistr('Nyilv\00E1nos')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567301983751487)
,p_name=>'APEXIR_RED'
,p_message_language=>'hu'
,p_message_text=>'piros'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713793253751530)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik a(z) %0 r\00E9gi\00F3 statikus azonos\00EDt\00F3ja.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600844474751497)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Elt\00E1vol\00EDt\00E1s')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600993141751497)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('Mind elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709173255751529)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagram elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600414085751497)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\0151 t\00F6r\00E9spont elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600161489751497)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151 elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600223826751497)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'hu'
,p_message_text=>unistr('Visszatekint\00E9s elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709217316751529)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1si szempont elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139600539071751497)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kiemel\00E9s elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709301388751529)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690472007751523)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s elt\00E1vol\00EDt\00E1sa')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672263286751518)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett kimutat\00E1s \00E1tnevez\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610014650751499)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s \00E1tnevez\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591618839751494)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139688619569751523)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1sok')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563812743751486)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik %0 m\00E1sodlagos nev\0171 mentett interakt\00EDv kimutat\00E1s.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617063148751502)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('A kimutat\00E1s nem l\00E9tezik.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563935712751486)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik %0 azonos\00EDt\00F3j\00FA mentett interakt\00EDv kimutat\00E1s.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608372275751499)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s be\00E1ll\00EDt\00E1sai')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139532578546751477)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 kimutat\00E1sbe\00E1ll\00EDt\00E1sai')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588669671751493)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1sn\00E9zet')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592899683751494)
,p_name=>'APEXIR_RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Vissza\00E1ll\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571935538751488)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s vissza\00E1ll\00EDt\00E1sa az alap\00E9rtelmezett be\00E1ll\00EDt\00E1sokra.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567149388751487)
,p_name=>'APEXIR_ROW'
,p_message_language=>'hu'
,p_message_text=>'Sor'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684789546751521)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'hu'
,p_message_text=>unistr('A ROWID nem haszn\00E1lhat\00F3, mivel az a REST adatforr\00E1s els\0151dleges kulcsoszlopa.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599562879751496)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'hu'
,p_message_text=>'Sorok'
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662539121751515)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'hu'
,p_message_text=>'Sor/oldal'
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637887253751508)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>'Soroszlopok'
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637657633751508)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'hu'
,p_message_text=>'Soroszlop %0'
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638277578751508)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('Meg kell adni a sorok oszlop\00E1t.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638460328751508)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'hu'
,p_message_text=>unistr('A soroszlop nem lehet azonos a kimutat\00E1soszloppal.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614050448751501)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorsz\0171r\0151')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588714786751493)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0. sor, \00F6sszesen %1')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139593011936751494)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'hu'
,p_message_text=>unistr('A sor sz\00F6vege tartalmazza')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566479785751487)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ment\00E9s')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603660967751498)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Mentett kimutat\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603567054751498)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'hu'
,p_message_text=>unistr('Mentett kimutat\00E1s = "%0"')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605717334751498)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelenlegi be\00E1ll\00EDt\00E1sok lesznek alap\00E9rtelmezettk\00E9nt haszn\00E1lva minden felhaszn\00E1l\00F3n\00E1l.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139672115503751518)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett kimutat\00E1s ment\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592776207751494)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s ment\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709584911751529)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s ment\00E9se*')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663524577751515)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598476847751496)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s s\00E1v')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139531899239751476)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 keres\0151s\00E1vja')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139709468393751529)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s : %0')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669081563751517)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s keres\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653094050751512)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Kijel\00F6lt oszlopok')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568197318751487)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('- Oszlop kijel\00F6l\00E9se -')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592007334751494)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Oszlopok kijel\00F6l\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571651654751488)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('- F\00FCggv\00E9ny kiv\00E1laszt\00E1sa -')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599248931751496)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('- Oszlop alap\00FA csoportos\00EDt\00E1s v\00E1laszt\00E1sa -')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637349089751507)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('- Kimutat\00E1soszlop kijel\00F6l\00E9se -')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687601954751522)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor kijel\00F6l\00E9se')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637412529751507)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('- Kimutat\00E1ssor kijel\00F6l\00E9se -')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139518902484751473)
,p_name=>'APEXIR_SEND'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCld\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541441896751479)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00FCld\00E9s e-mailk\00E9nt')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566890790751487)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'hu'
,p_message_text=>'Sorrend'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139592242628751494)
,p_name=>'APEXIR_SORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601753291751497)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00F6vekv\0151 sorrend')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601825617751497)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('Cs\00F6kken\0151 sorrend')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689874017751523)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'hu'
,p_message_text=>unistr('Rendez\00E9si sorrend')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596129226751495)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'hu'
,p_message_text=>unistr('sz\00F3k\00F6z')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139607339594751499)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1llapot: %0')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661241767751515)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151fizet\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687043423751522)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'hu'
,p_message_text=>unistr('Befejez\00E9s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506066364751469)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'hu'
,p_message_text=>unistr('Kihagy\00E1s, ha nincs adat')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139686983948751522)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezd\00E9s innen')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687814469751522)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszesen: %0')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678764435751520)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'hu'
,p_message_text=>unistr('%0, Kimutat\00E1s = %1, N\00E9zet = %2')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565763422751486)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00F6vegsz\00EDn')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584499278751492)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'hu'
,p_message_text=>'nap'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584345895751492)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00F3ra')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584256541751492)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'hu'
,p_message_text=>'perc'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584625818751492)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('h\00F3nap')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584553268751492)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('h\00E9t')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139584792463751492)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00E9v')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139690234415751523)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1lt\00E1s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601085637751497)
,p_name=>'APEXIR_TOP'
,p_message_language=>'hu'
,p_message_text=>unistr('Fel\00FClre')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683702010751521)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem csoportos\00EDtott oszlop')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602570972751497)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'hu'
,p_message_text=>unistr('A kiemel\00E9s neve csak egyedi lehet.')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570454276751488)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('nem t\00E1mogatott adatt\00EDpus')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601198308751497)
,p_name=>'APEXIR_UP'
,p_message_language=>'hu'
,p_message_text=>'Feljebb'
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602798804751497)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Adjon meg egy \00E9rv\00E9nyes sz\00EDnt.')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139602848905751497)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'hu'
,p_message_text=>unistr('Adjon meg egy \00E9rv\00E9nyes form\00E1tummaszkot.')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139567602443751487)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9k')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601656636751497)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Tengelyc\00EDm az \00E9rt\00E9khez')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139609487799751499)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rt\00E9ket kell megadni')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139571009014751488)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCgg\0151leges oszlop')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139679833259751520)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00FCgg\0151leges')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608751944751499)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'hu'
,p_message_text=>unistr('Diagram megtekint\00E9se')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667357573751516)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9szletek megtekint\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711600237751529)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('A kimutat\00E1shoz nincs defini\00E1lva %0 n\00E9zet.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667401226751516)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Csoportos\00EDt\00E1si szempont megtekint\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667291928751516)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Megtekint\00E9si ikonok')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637139981751507)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1st\00E1bla megtekint\00E9se')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139608882430751499)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s megtekint\00E9se')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661455832751515)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'hu'
,p_message_text=>'Hetente'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591572208751494)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Akt\00EDv kimutat\00E1s')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689285157751523)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'hu'
,p_message_text=>'%0 nap'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689131847751523)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00F3ra')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689000350751523)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'hu'
,p_message_text=>'%0 perc'
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689420018751523)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 h\00F3nap')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689306849751523)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 h\00E9t')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139689508143751523)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00E9v')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139687228295751522)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9v')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139565420239751486)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'hu'
,p_message_text=>unistr('s\00E1rga')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139566976796751487)
,p_name=>'APEXIR_YES'
,p_message_language=>'hu'
,p_message_text=>'Igen'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139601412681751497)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 tartalmaz < vagy > karaktert, melyek \00E9rv\00E9nytelenek.')
,p_version_scn=>2704962
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139625393318751504)
,p_name=>'APEX_REGION'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9gi\00F3')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516411521751472)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet kibontani a ZIP f\00E1jlt.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516337326751472)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a k\00F6zponti k\00F6nyvt\00E1r v\00E9g\00E9re vonatkoz\00F3 al\00E1\00EDr\00E1s. A f\00E1jl nem ZIP f\00E1jl.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139547472833751481)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'hu'
,p_message_text=>unistr('API el\0151felt\00E9tel megs\00E9rt\00E9se')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569515215751487)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet \00E9rt\00E9ket beolvasni a(z) %0 alkalmaz\00E1sbe\00E1ll\00EDt\00E1shoz, mert a kapcsol\00F3d\00F3 build be\00E1ll\00EDt\00E1sa letiltott.')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569424096751487)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet \00E9rt\00E9ket be\00E1ll\00EDtani (z) %0 alkalmaz\00E1sbe\00E1ll\00EDt\00E1shoz, mert a kapcsol\00F3d\00F3 build be\00E1ll\00EDt\00E1sa letiltott.')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682028577751521)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen az alkalmaz\00E1si be\00E1ll\00EDt\00E1s %0 \00E9rt\00E9ke')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139681992171751521)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lett defini\00E1lva a lek\00E9rt %0 alkalmaz\00E1si be\00E1ll\00EDt\00E1s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682135767751521)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 alkalmaz\00E1si be\00E1ll\00EDt\00E1s nem \00E1ll\00EDthat\00F3 be null \00E9rt\00E9kre')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556070928751484)
,p_name=>'BACK'
,p_message_language=>'hu'
,p_message_text=>'Vissza'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538427170751478)
,p_name=>'BUILDER'
,p_message_language=>'hu'
,p_message_text=>unistr('Szerkeszt\0151')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612018191751500)
,p_name=>'BUTTON LABEL'
,p_message_language=>'hu'
,p_message_text=>'Gomb felirata'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535318162751477)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'hu'
,p_message_text=>unistr('Gomb CSS-oszt\00E1lyai')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573849849751489)
,p_name=>'BUTTON_ID'
,p_message_language=>'hu'
,p_message_text=>unistr('A gener\00E1lt gombazonos\00EDt\00F3 a gomb statikus azonos\00EDt\00F3ja lesz, ha lett defini\00E1lva, vagy ha nem, akkor pedig egy bels\0151leg el\0151\00E1ll\00EDtott, ''B'' || [Internal Button ID] form\00E1tum\00FA azonos\00EDt\00F3 lesz')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507895235751469)
,p_name=>'CANDLESTICK'
,p_message_language=>'hu'
,p_message_text=>unistr('Gyertyatart\00F3')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621883650751503)
,p_name=>'CENTER'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6z\00E9pre')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568445982751487)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 k\00E9relem')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558415665751484)
,p_name=>'CHECK$'
,p_message_language=>'hu'
,p_message_text=>unistr('sorv\00E1laszt\00F3')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139683823971751521)
,p_name=>'CHECKED'
,p_message_language=>'hu'
,p_message_text=>unistr('bejel\00F6lve')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660201216751514)
,p_name=>'COLUMN'
,p_message_language=>'hu'
,p_message_text=>'Oszlop'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617891243751502)
,p_name=>'COMMENTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjegyz\00E9sek')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598818579751496)
,p_name=>'CONTINUE'
,p_message_language=>'hu'
,p_message_text=>unistr('Folytat\00E1s')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556332759751484)
,p_name=>'COPYRIGHT'
,p_message_language=>'hu'
,p_message_text=>unistr('Copyright &copy; 1999, %0, Oracle, illetve le\00E1nyv\00E1llalatai. Minden jog fenntartva.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604563304751498)
,p_name=>'COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('Mennyis\00E9g')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611590862751500)
,p_name=>'CREATE'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9trehoz\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666902929751516)
,p_name=>'CREATED'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9trehozva')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667004808751516)
,p_name=>'CREATED_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9trehozta')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587970760751493)
,p_name=>'CREATED_ON'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9trehoz\00E1s d\00E1tuma')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599079124751496)
,p_name=>'CUSTOM'
,p_message_language=>'hu'
,p_message_text=>unistr('Egy\00E9ni')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610259143751500)
,p_name=>'CUSTOMIZE'
,p_message_language=>'hu'
,p_message_text=>unistr('Testreszab\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612254168751500)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Az oldalbe\00E1ll\00EDt\00E1sok vissza\00E1ll\00EDt\00E1sa %0 felhaszn\00E1l\00F3 r\00E9sz\00E9re.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612384673751500)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 felhaszn\00E1l\00F3 r\00E9sz\00E9re megv\00E1ltoztak a be\00E1ll\00EDt\00E1sok.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612123348751500)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Az oldalbe\00E1ll\00EDt\00E1sok vissza\00E1ll\00EDt\00E1sa %0 felhaszn\00E1l\00F3 r\00E9sz\00E9re.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573280679751489)
,p_name=>'DAILY'
,p_message_language=>'hu'
,p_message_text=>'Naponta'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536657225751478)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('A felt\00F6lt\00F6tt f\00E1jl \00E9rv\00E9nytelen vagy rossz a kiterjeszt\00E9se.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568624041751487)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen XML vagy JSON kijel\00F6l\0151 van haszn\00E1latban.')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513796478751471)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatprofil \00E9s a felt\00F6lt\00F6tt f\00E1jl nem tartalmaz c\00E9lk\00E9nt megjel\00F6lt t\00E1bl\00E1t.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627659716751505)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 adat a felt\00F6lt\00F6tt f\00E1jlban.')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627775358751505)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 adat a(z) "%0" munkalapon.')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533502384751477)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('A megadott f\00E1jl nem XLSX f\00E1jl.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139499583380751467)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatbet\00F6lt\00E9s befejez\0151d\00F6tt: %0 sor lett feldolgozva.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501872343751468)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatbet\00F6lt\00E9s befejez\0151d\00F6tt: %0 sor lett feldolgozva, 1 hib\00E1val.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502122811751468)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatbet\00F6lt\00E9s befejez\0151d\00F6tt: %0 sor lett feldolgozva, %1 hib\00E1val.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139501997886751468)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatbet\00F6lt\00E9s befejez\0151d\00F6tt: 1 sor lett feldolgozva.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516262312751472)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatbet\00F6lt\00E9s befejez\0151d\00F6tt: 1 sor lett feldolgozva, hib\00E1val.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139502044568751468)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatbet\00F6lt\00E9s befejez\0151d\00F6tt: 1 sor lett feldolgozva, hiba n\00E9lk\00FCl.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634730722751507)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00E9loszlop')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541976119751479)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'hu'
,p_message_text=>unistr('Ne t\00F6ltse be')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542034442751479)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151feldolgoz\00E1si hiba')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634880455751507)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'hu'
,p_message_text=>unistr('Forr\00E1soszlop')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635612114751507)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('D\00E1tum-/Sz\00E1mform\00E1tum')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541754173751479)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor besz\00FAr\00E1sa')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697806149751525)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem siker\00FClt beolvasni az \00E9rt\00E9klista \00E9rt\00E9k\00E9t.')
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139667530081751516)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'hu'
,p_message_text=>unistr('Adatok / T\00E1bla lek\00E9pez\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635700453751507)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'hu'
,p_message_text=>'Sor'
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542101425751479)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorrend : M\0171velet')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629406666751505)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('Sikertelen az \00E1talak\00EDt\00E1s szab\00E1ly v\00E9grehajt\00E1sa')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541891236751479)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor m\00F3dos\00EDt\00E1sa')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604176859751498)
,p_name=>'DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('D\00E1tum')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577015738751490)
,p_name=>'DAY'
,p_message_language=>'hu'
,p_message_text=>'nap'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577102535751490)
,p_name=>'DAYS'
,p_message_language=>'hu'
,p_message_text=>'nap'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617528686751502)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'hu'
,p_message_text=>unistr('A hibakeres\00E9s nem enged\00E9lyezett enn\00E9l az alkalmaz\00E1sn\00E1l.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139669216330751517)
,p_name=>'DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577810937751490)
,p_name=>'DELETE'
,p_message_language=>'hu'
,p_message_text=>unistr('t\00F6rl\00E9s')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553465145751483)
,p_name=>'DELETE_MSG'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E9grehajtja ezt a t\00F6rl\00E9si m\0171veletet?')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533042373751477)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'hu'
,p_message_text=>unistr('Munkamenet-fel\00FCl\00EDr\00E1sok')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533944092751477)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Munkamenet-fel\00FCl\00EDr\00E1sok enged\00E9lyez\00E9se')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534852259751477)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba t\00F6rt\00E9nt a munkamenet-fel\00FCl\00EDr\00E1sok bet\00F6lt\00E9sekor.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534688616751477)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba t\00F6rt\00E9nt a munkamenet-fel\00FCl\00EDr\00E1sok ment\00E9sekor.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139534555119751477)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkamenet-fel\00FCl\00EDr\00E1sokat elmentette a rendszer. A v\00E1ltoz\00E1sok megtekint\00E9s\00E9hez z\00E1rja be ezt a p\00E1rbesz\00E9dpanelt.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507763594751469)
,p_name=>'DIAL_PCT'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00E1mt\00E1rcsa (sz\00E1zal\00E9kos)')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139548785155751481)
,p_name=>'DOWNLOAD'
,p_message_language=>'hu'
,p_message_text=>unistr('Let\00F6lt\00E9s')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668382143751517)
,p_name=>'DUP_USER'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\0151 felhaszn\00E1l\00F3n\00E9v tal\00E1lhat\00F3 a list\00E1ban.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557153288751484)
,p_name=>'EDIT'
,p_message_language=>'hu'
,p_message_text=>unistr('Szerkeszt\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568324016751487)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" e-mail-c\00EDm nem tal\00E1lhat\00F3.')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551070555751482)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Az e-mail felad\00F3ja: %0.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668533153751517)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'hu'
,p_message_text=>unistr('Az e-mail-c\00EDm t\00FAl hossz\00FA. A korl\00E1t 240 karakter.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598766136751496)
,p_name=>'ERROR'
,p_message_language=>'hu'
,p_message_text=>'Hiba'
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629593018751505)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet be\00E1ll\00EDtani az oldalelem forr\00E1s\00E9rt\00E9k\00E9t a r\00E9szleges oldalfriss\00EDt\00E9si r\00E9gi\00F3ban')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590090487751494)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9trehozta')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551355965751482)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Lej\00E1rt a jelsz\00F3')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139543712880751480)
,p_name=>'FILE_EMPTY'
,p_message_language=>'hu'
,p_message_text=>unistr('A f\00E1jl \00FCres.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633531245751506)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A felt\00F6lt\00F6tt f\00E1jl m\00E9rete t\00F6bb, mint %0 MB volt. Kisebb f\00E1jlt t\00F6lts\00F6n fel.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553622374751483)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem siker\00FClt a felhaszn\00E1l\00F3-hiteles\00EDt\00E9s, \00E9s egy vagy t\00F6bb f\00E1jl nem lett felt\00F6ltve.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553711032751483)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez a p\00E9ld\00E1ny nem engedi meg, hogy hiteles\00EDt\00E9s n\00E9lk\00FCli felhaszn\00E1l\00F3k f\00E1jlokat t\00F6ltsenek fel.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633637590751506)
,p_name=>'FILTERS'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\0171r\0151k')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611662310751500)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('1 hiba t\00F6rt\00E9nt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610874194751500)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 hiba t\00F6rt\00E9nt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556200610751484)
,p_name=>'FORM_OF'
,p_message_language=>'hu'
,p_message_text=>'%1/%0'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595264775751495)
,p_name=>'GO'
,p_message_language=>'hu'
,p_message_text=>unistr('Ugr\00E1s')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697460796751525)
,p_name=>'HELP'
,p_message_language=>'hu'
,p_message_text=>unistr('S\00FAg\00F3')
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538511782751478)
,p_name=>'HOME'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezd\0151lap')
,p_is_js_message=>true
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576868023751490)
,p_name=>'HOUR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00F3ra')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576961983751490)
,p_name=>'HOURS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00F3ra')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139558302032751484)
,p_name=>'ICON'
,p_message_language=>'hu'
,p_message_text=>'%0 ikon'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535611956751478)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'hu'
,p_message_text=>unistr('Ikon k\00F6r\00FClv\00E1g\00E1sa - s\00FAg\00F3')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536896258751478)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>H\00FAzza \00E1t az ikont, \00E9s haszn\00E1lja a nagy\00EDt\00E1si cs\00FAszk\00E1t a keretben t\00F6rt\00E9n\0151 \00E1thelyez\00E9s\00E9hez.</p>'),
'',
unistr('<p>\00DAj ikon felt\00F6lt\00E9sekor h\00E1rom m\00E9retnek megfelel\0151en lesz \00E1tm\00E9retezve: weblapicon, kicsi \00E9s nagy ikon.</p>'),
'',
unistr('<p>Az ikon k\00F6r\00FClv\00E1g\00E1s\00E1ra f\00F3kusz\00E1l\00E1skor a k\00F6vetkez\0151 billenty\0171parancsok haszn\00E1lhat\00F3k:</p>'),
'<ul>',
unistr('    <li>Balra mutat\00F3 ny\00EDl: K\00E9p \00E1thelyez\00E9se balra*</li>'),
unistr('    <li>Felfel\00E9 mutat\00F3 ny\00EDl: K\00E9p \00E1thelyez\00E9se felfel\00E9*</li>'),
unistr('    <li>Jobbra mutat\00F3 ny\00EDl: K\00E9p \00E1thelyez\00E9se jobbra*</li>'),
unistr('    <li>Lefel\00E9 mutat\00F3 ny\00EDl: K\00E9p \00E1thelyez\00E9se lefel\00E9*</li>'),
unistr('    <li>I: Nagy\00EDt\00E1s</li>'),
unistr('    <li>O: Kicsiny\00EDt\00E9s</li>'),
unistr('    <li>L: Elforgat\00E1s balra</li>'),
unistr('    <li>R: Elforgat\00E1s jobbra</li>'),
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*A gyorsabb \00E1thelyez\00E9shez tartsa lenyomva a Shift billenty\0171t</em></p>')))
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542382385751480)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00FAz\00E1ssal helyezze \00E1t az ikont')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542467015751480)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('A cs\00FAszka mozgat\00E1s\00E1val m\00F3dos\00EDtsa a nagy\00EDt\00E1si szintet')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535401286751477)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Alkalmaz\00E1sikon szerkeszt\00E9se')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535715448751478)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az ikon ment\00E9sekor')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618150874751502)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'hu'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> Ez az alkalmaz\00E1s kor\00E1bbi ikonokat haszn\00E1l. Az \00FAj ikon felt\00F6lt\00E9se lecser\00E9li az \00F6sszes kor\00E1bbi ikont.</p>')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139536393814751478)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DAj ikon felt\00F6lt\00E9se')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612502583751500)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen bejelentkez\00E9si hiteles\00EDt\0151 adatok')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713640895751530)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen \00E9rt\00E9k a param\00E9ter sz\00E1m\00E1ra: %0')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606846745751499)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett kimutat\00E1si be\00E1ll\00EDt\00E1sok')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606983511751499)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Megnevezett kimutat\00E1sk\00E9nt')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588885393751493)
,p_name=>'IR_ERROR'
,p_message_language=>'hu'
,p_message_text=>'%0 hiba. %1'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588566782751493)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem sz\00E1molhat\00F3 ki a navig\00E1l\00E1s az \0171rlapon. %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564100755751486)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 interakt\00EDv kimutat\00E1s.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563536576751486)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 alkalmaz\00E1s, %1 lapj\00E1n \00E9s %2 r\00E9gi\00F3j\00E1ban nem l\00E9tezik interakt\00EDv kimutat\00E1si r\00E9gi\00F3.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139606724017751499)
,p_name=>'IR_STAR'
,p_message_language=>'hu'
,p_message_text=>unistr('Csak a fejleszt\0151k l\00E1thatj\00E1k')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139594993301751495)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A kimutat\00E1s lek\00E9rdez\00E9s\00E9hez az egyes sorok azonos\00EDt\00E1s\00E1hoz egyedi kulcs sz\00FCks\00E9ges. A megadott kulcs nem haszn\00E1lhat\00F3 ehhez a lek\00E9rdez\00E9shez. Adja meg az egyedi kulcs oszlop\00E1t. %0')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595021641751495)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'hu'
,p_message_text=>unistr('A kimutat\00E1s lek\00E9rdez\00E9s\00E9hez az egyes sorok azonos\00EDt\00E1s\00E1hoz egyedi kulcs sz\00FCks\00E9ges. A megadott kulcs nem haszn\00E1lhat\00F3 ehhez a lek\00E9rdez\00E9shez. M\00F3dos\00EDtsa a kimutat\00E1s attrib\00FAtumait, hogy megadja az egyedi kulcs oszlop\00E1t. %0')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635920748751507)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00E1jl kiv\00E1laszt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635886664751507)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00E1jl \00E1th\00FAz\00E1sa ide vagy')
,p_is_js_message=>true
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556575558751484)
,p_name=>'ITEMS'
,p_message_language=>'hu'
,p_message_text=>'Elemek'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590231801751494)
,p_name=>'ITEM_VALUE'
,p_message_language=>'hu'
,p_message_text=>unistr('Elem \00E9rt\00E9ke')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604822736751498)
,p_name=>'LABEL'
,p_message_language=>'hu'
,p_message_text=>'Felirat'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617478191751502)
,p_name=>'LANGUAGE'
,p_message_language=>'hu'
,p_message_text=>'Nyelv'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577578429751490)
,p_name=>'LAST'
,p_message_language=>'hu'
,p_message_text=>unistr('utols\00F3')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553512011751483)
,p_name=>'LENGTH'
,p_message_language=>'hu'
,p_message_text=>'Hossz'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611898984751500)
,p_name=>'LOGIN'
,p_message_language=>'hu'
,p_message_text=>unistr('Bejelentkez\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653400650751512)
,p_name=>'MANAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezel\00E9s')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139716589570751531)
,p_name=>'MAXIMIZE'
,p_message_language=>'hu'
,p_message_text=>unistr('Teljes m\00E9ret')
,p_is_js_message=>true
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576633353751490)
,p_name=>'MINUTE'
,p_message_language=>'hu'
,p_message_text=>'perc'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576701705751490)
,p_name=>'MINUTES'
,p_message_language=>'hu'
,p_message_text=>'perc'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668781285751517)
,p_name=>'MISSING_AT'
,p_message_language=>'hu'
,p_message_text=>unistr('Hi\00E1nyzik a kukac (@) az e-mail-c\00EDmben.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668917444751517)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'hu'
,p_message_text=>unistr('Figyelmeztet\00E9s: A(z) %1 alkalmaz\00E1sban a(z) %0 p\00E1rbesz\00E9dpanel-laphoz nincs defini\00E1lva p\00E1rbesz\00E9dpanel-lapi sablon.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668614832751517)
,p_name=>'MISSING_DOT'
,p_message_language=>'hu'
,p_message_text=>unistr('Hi\00E1nyzik a pont (.) az e-mail-c\00EDm tartom\00E1ny\00E1ban.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614919410751501)
,p_name=>'MODULE'
,p_message_language=>'hu'
,p_message_text=>'Modul'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569161452751487)
,p_name=>'MONTH'
,p_message_language=>'hu'
,p_message_text=>unistr('H\00F3nap')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573061499751489)
,p_name=>'MONTHLY'
,p_message_language=>'hu'
,p_message_text=>'Havonta'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569219802751487)
,p_name=>'MONTHS'
,p_message_language=>'hu'
,p_message_text=>unistr('h\00F3nap')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604497032751498)
,p_name=>'MOVE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1thelyez\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675298839751519)
,p_name=>'MOVE_FROM'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1thelyez\00E9s innen')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675322419751519)
,p_name=>'MOVE_TO'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C1thelyez\00E9s ide')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139591410671751494)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a t\00F6bbsoros t\00F6rl\00E9si m\0171veletben: sor= %0, %1, %2')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590431701751494)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet nyilv\00E1nos felhaszn\00E1l\00F3')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539001481751479)
,p_name=>'NAME'
,p_message_language=>'hu'
,p_message_text=>unistr('N\00E9v')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604645793751498)
,p_name=>'NEW'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DAj')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568991052751487)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 fi\00F3kba bejelentkez\00E9shez l\00E9pjen ide:')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569084235751487)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rtes\00EDt\00E9s az \00FAj %0 fi\00F3kr\00F3l')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697679972751525)
,p_name=>'NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614837260751501)
,p_name=>'NO'
,p_message_language=>'hu'
,p_message_text=>'Nem'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139711729770751529)
,p_name=>'NOBODY'
,p_message_language=>'hu'
,p_message_text=>'senki'
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577980979751490)
,p_name=>'NOT'
,p_message_language=>'hu'
,p_message_text=>'Nem'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620880504751503)
,p_name=>'NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>'Nem Null'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590506447751494)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'hu'
,p_message_text=>'Nem %0'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610370700751500)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'hu'
,p_message_text=>'nincs adat'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620363062751502)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 m\00F3dos\00EDthat\00F3 kimutat\00E1s. A t\00F6bb sort m\00F3dos\00EDt\00F3 \00E9s t\00F6rl\0151 m\0171velet csak a ''M\00F3dos\00EDthat\00F3 kimutat\00E1s'' t\00EDpus\00FA t\00E1bl\00E1zatos form\00E1tumokon v\00E9gezhet\0151.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621243493751503)
,p_name=>'OK'
,p_message_language=>'hu'
,p_message_text=>'OK'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616584972751501)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'hu'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139715412729751531)
,p_name=>'ORA_06550'
,p_message_language=>'hu'
,p_message_text=>'ORA-06550: %0. sor, %1. oszlop'
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666372183751516)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6n elavult webb\00F6ng\00E9sz\0151t haszn\00E1l. A t\00E1mogatott b\00F6ng\00E9sz\0151k list\00E1j\00E1t n\00E9zze meg az Oracle APEX telep\00EDt\00E9si \00FAtmutat\00F3j\00E1ban.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561391693751485)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen sork\00E9szlet lett lek\00E9rve, a kimutat\00E1s forr\00E1sadata megv\00E1ltozott.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583354383751492)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nyes oldalsz\00E1mot kell megadni, p\00E9ld\00E1ul: p?n=1234.')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587517423751493)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587695332751493)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6vetkez\0151 csoport')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587783961751493)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139587853129751493)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151 csoport')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697594546751525)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldalt\00F6rdel\00E9s kiv\00E1laszt\00E1sa')
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627588387751505)
,p_name=>'PASSWORD'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelsz\00F3')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568218795751487)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 jelszava megv\00E1ltozott.')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555920257751484)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3 nem felel meg az enn\00E9l a webhelyn\00E9l \00E9rv\00E9nyes jelsz\00F3bonyolults\00E1gi szab\00E1lyoknak.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555062366751483)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00FAj jelsz\00F3nak legal\00E1bb %0 karakterben k\00FCl\00F6nb\00F6znie kell a r\00E9gi jelsz\00F3t\00F3l.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555629608751483)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3 nem tartalmazhatja a felhaszn\00E1l\00F3nevet.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555819551751483)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3 nem tartalmazhat egyszer\0171 tiltott szavakat.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555764498751483)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3 nem tartalmazhatja a munkahely nev\00E9t.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554909272751483)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3nak legal\00E1bb %0 karaktert kell tartalmaznia.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555172730751483)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3nak legal\00E1bb egy bet\0171karaktert (%0) kell tartalmaznia.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555576066751483)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3nak legal\00E1bb egy kisbet\0171s karaktert kell tartalmaznia.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555284633751483)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3nak legal\00E1bb egy numerikus karaktert (0123456789) kell tartalmaznia.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555316167751483)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3nak legal\00E1bb egy \00EDr\00E1sjelet (%0) kell tartalmaznia.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139555497977751483)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A jelsz\00F3nak legal\00E1bb egy nagybet\0171s karaktert kell tartalmaznia.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568748335751487)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rtes\00EDt\00E9s a jelsz\00F3 vissza\00E1ll\00EDt\00E1s\00E1r\00F3l')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553829310751483)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Lehet, hogy nem haszn\00E1lhat\00F3 a jelsz\00F3, mert haszn\00E1latban volt a legut\00F3bbi %0 napon.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139550566718751482)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00E1zal\00E9kos diagram')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642109733751509)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'hu'
,p_message_text=>'Elemek'
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139642205996751509)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'hu'
,p_message_text=>'Elem'
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616322303751501)
,p_name=>'PERCENT'
,p_message_language=>'hu'
,p_message_text=>unistr('Sz\00E1zal\00E9k')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585618816751492)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'hu'
,p_message_text=>unistr('Forduljon a rendszergazd\00E1hoz.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697787570751525)
,p_name=>'PREVIOUS'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151z\0151')
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634361313751507)
,p_name=>'PRINT'
,p_message_language=>'hu'
,p_message_text=>unistr('Nyomtat\00E1s')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615154771751501)
,p_name=>'PRIVILEGES'
,p_message_language=>'hu'
,p_message_text=>unistr('Jogosults\00E1gok')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583735727751492)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9gi\00F3hivatkoz\00E1sok')
,p_version_scn=>2704958
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604715015751498)
,p_name=>'REPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615077954751501)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1si id\0151szak')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139697992006751525)
,p_name=>'REPORT_LABEL'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s : %0')
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615797533751501)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'hu'
,p_message_text=>unistr('Kimutat\00E1s \00F6sszesen')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561488742751485)
,p_name=>'RESET'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldalt\00F6rdel\00E9s vissza\00E1ll\00EDt\00E1sa')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590185495751494)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldalt\00F6rdel\00E9s vissza\00E1ll\00EDt\00E1sa')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620255233751502)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelsz\00F3 vissza\00E1ll\00EDt\00E1sa')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596039538751495)
,p_name=>'RESTORE'
,p_message_language=>'hu'
,p_message_text=>unistr('Helyre\00E1ll\00EDt\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139629606521751505)
,p_name=>'RESULTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Eredm\00E9nyek')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621389209751503)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Vissza az alkalmaz\00E1shoz.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139621752848751503)
,p_name=>'RIGHT'
,p_message_language=>'hu'
,p_message_text=>'Jobbra'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653762785751512)
,p_name=>'ROW'
,p_message_language=>'hu'
,p_message_text=>'%0. sor'
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604377904751498)
,p_name=>'ROW_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorok sz\00E1ma')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494163324751465)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'hu'
,p_message_text=>'Oracle-asszisztens'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494469753751465)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Oracle-asszisztens bez\00E1r\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494708186751466)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rtes\00EDt\00E9sek list\00E1ja')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494316852751465)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Az Oracle-asszisztens megnyit\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494618345751466)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'hu'
,p_message_text=>unistr('Term\00E9kt\00E9rk\00E9p')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494543818751466)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Javaslatok list\00E1ja')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495484277751466)
,p_name=>'RW_CLEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6rl\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495305034751466)
,p_name=>'RW_CLOSE'
,p_message_language=>'hu'
,p_message_text=>unistr('Bez\00E1r\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495139732751466)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6bb megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495536986751466)
,p_name=>'RW_GO_TO'
,p_message_language=>'hu'
,p_message_text=>unistr('Ugr\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494923214751466)
,p_name=>'RW_GP_STEP'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9p\00E9s:')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495007140751466)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'hu'
,p_message_text=>'/'
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139494842356751466)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E9p\00E9sek megjelen\00EDt\00E9s\00E9nek ki-/bekapcsol\00E1sa')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493991874751465)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelsz\00F3 elrejt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495236298751466)
,p_name=>'RW_OPEN'
,p_message_language=>'hu'
,p_message_text=>unistr('Megnyit\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493728825751465)
,p_name=>'RW_ORACLE'
,p_message_language=>'hu'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139493897502751465)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelsz\00F3 megjelen\00EDt\00E9se')
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139495607696751466)
,p_name=>'RW_START'
,p_message_language=>'hu'
,p_message_text=>'Eleje'
,p_is_js_message=>true
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139620705216751503)
,p_name=>'SAVE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ment\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616938715751501)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1sodlagos alap\00E9rtelmez\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617362857751502)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Le\00EDr\00E1s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616881586751501)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('Els\0151dleges alap\00E9rtelmez\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617696855751502)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6bb mint %0 sor \00E9rhet\0151 el. N\00F6velje a sorv\00E1laszt\00F3ban a megtekinthet\0151 sorok sz\00E1m\00E1t.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139685031029751522)
,p_name=>'SEARCH'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9s')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576505558751490)
,p_name=>'SECONDS'
,p_message_language=>'hu'
,p_message_text=>unistr('m\00E1sodperc')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616495156751501)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'hu'
,p_message_text=>unistr('L\00E1sd a mell\00E9kletet')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677011182751519)
,p_name=>'SELECT_ROW'
,p_message_language=>'hu'
,p_message_text=>unistr('Sor kijel\00F6l\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616185489751501)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9perny\0151olvas\00F3 m\00F3d KI')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616206906751501)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00E9perny\0151olvas\00F3 m\00F3d BE')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612485381751500)
,p_name=>'SHOW'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDt\00E9s')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678812051751520)
,p_name=>'SHOW_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('Mind megjelen\00EDt\00E9se')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139703621533751527)
,p_name=>'SIGN_IN'
,p_message_language=>'hu'
,p_message_text=>unistr('Bejelentkez\00E9s')
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139654532946751513)
,p_name=>'SIGN_OUT'
,p_message_language=>'hu'
,p_message_text=>unistr('Kijelentkez\00E9s')
,p_version_scn=>2704971
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605332221751498)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nappal ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612926960751500)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 nap mostant\00F3l')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605254340751498)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00F3r\00E1val ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612895483751500)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00F3ra mostant\00F3l')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605147780751498)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 perccel ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612763156751500)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 perc mostant\00F3l')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605598705751498)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 h\00F3nappal ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613103095751500)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 h\00F3nap mostant\00F3l')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613344765751500)
,p_name=>'SINCE_NOW'
,p_message_language=>'hu'
,p_message_text=>'Most'
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605086579751498)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 m\00E1sodperccel ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139612663810751500)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 m\00E1sodperc mostant\00F3l')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605481196751498)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 h\00E9ttel ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613028534751500)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 h\00E9t mostant\00F3l')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139605647421751498)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00E9vvel ezel\0151tt')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613257678751500)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00E9v mostant\00F3l')
,p_is_js_message=>true
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599134269751496)
,p_name=>'STANDARD'
,p_message_language=>'hu'
,p_message_text=>unistr('Szok\00E1sos')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616005626751501)
,p_name=>'START_DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('Kezd\0151 d\00E1tum')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551270518751482)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'hu'
,p_message_text=>unistr('Ezt az e-mailt a(z) %0 \00E1ltal l\00E9trehozott interakt\00EDv feliratkoz\00E1s-kezel\0151 k\00FCldte.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712888093751530)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'hu'
,p_message_text=>unistr('El\0151fizet\00E9sek')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662297251751515)
,p_name=>'TAB'
,p_message_language=>'hu'
,p_message_text=>'Lap'
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576490373751490)
,p_name=>'TITLE'
,p_message_language=>'hu'
,p_message_text=>unistr('C\00EDm')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556109469751484)
,p_name=>'TODAY'
,p_message_language=>'hu'
,p_message_text=>'Ma'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615694383751501)
,p_name=>'TOTAL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszesen')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557459069751484)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Legfeljebb %0 oszlopot v\00E1laszthat ki.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513274383751471)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('Mind becsuk\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513875520751471)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'hu'
,p_message_text=>unistr('Minden al\00E1bbi becsuk\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139512899994751471)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes kibont\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513560083751471)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'hu'
,p_message_text=>unistr('Az al\00E1bbiak kibont\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139514013215751471)
,p_name=>'TREE.REPARENT'
,p_message_language=>'hu'
,p_message_text=>unistr('F\00F6l\00E9rendel\00E9s m\00F3dos\00EDt\00E1sa')
,p_is_js_message=>true
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636123222751507)
,p_name=>'TREES'
,p_message_language=>'hu'
,p_message_text=>unistr('Fastrukt\00FAr\00E1k')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678937653751520)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('K\00F6telez\0151')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139599812012751496)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>'Jogosulatlan'
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139650045121751511)
,p_name=>'UNAVAILABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem \00E9rhet\0151 el')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613762111751501)
,p_name=>'UNKNOWN'
,p_message_language=>'hu'
,p_message_text=>'Ismeretlen'
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552179520751482)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Ismeretlen hiteles\00EDt\00E9si hiba t\00F6rt\00E9nt.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554386516751483)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'hu'
,p_message_text=>unistr('Ha a tov\00E1bbiakban nem szeretne e-maileket kapni, a leiratkoz\00E1shoz kattintson a <a href="%0">leiratkoz\00E1s</a> lehet\0151s\00E9gre.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139551100510751482)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Ha a tov\00E1bbiakban nem szeretne e-maileket kapni, a leiratkoz\00E1shoz nyissa meg a k\00F6vetkez\0151 URL-c\00EDmet:')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139590696164751494)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('nem t\00E1mogatott adatt\00EDpus')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577757532751490)
,p_name=>'UPDATE'
,p_message_language=>'hu'
,p_message_text=>unistr('m\00F3dos\00EDt\00E1s')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576388241751489)
,p_name=>'UPDATED'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00F3dos\00EDtva')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519523556751473)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'hu'
,p_message_text=>unistr('Friss\00EDt\00E9s folyamatban')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139519809913751473)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'hu'
,p_message_text=>unistr('Folyamatban van az Oracle APEX \00FAjabb verzi\00F3ra t\00F6rt\00E9n\0151 friss\00EDt\00E9se. Ez a folyamat \00E1ltal\00E1ban 3 percet is ig\00E9nybe vehet.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583165637751492)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'hu'
,p_message_text=>unistr('A k\00E9rt URL-c\00EDm tiltott. L\00E9pjen kapcsolatba a rendszergazd\00E1val.')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139604296598751498)
,p_name=>'USER'
,p_message_language=>'hu'
,p_message_text=>unistr('Felhaszn\00E1l\00F3')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139627469953751505)
,p_name=>'USERNAME'
,p_message_language=>'hu'
,p_message_text=>unistr('Felhaszn\00E1l\00F3n\00E9v')
,p_version_scn=>2704964
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668866936751517)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'hu'
,p_message_text=>unistr('Az e-mail-c\00EDm t\00FAl hossz\00FA. A korl\00E1t %0 karakter.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611384539751500)
,p_name=>'USERS'
,p_message_language=>'hu'
,p_message_text=>unistr('felhaszn\00E1l\00F3k')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139668480921751517)
,p_name=>'USER_EXISTS'
,p_message_language=>'hu'
,p_message_text=>unistr('A felhaszn\00E1l\00F3n\00E9v m\00E1r l\00E9tezik.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139682220298751521)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Profilk\00E9p %0 r\00E9sz\00E9re')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544126919751480)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Automatiz\00E1l\00E1s - %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542600638751480)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'hu'
,p_message_text=>'Oldal: %0 - %1 '
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545559432751480)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'hu'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139545687899751480)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'hu'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544562904751480)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'hu'
,p_message_text=>unistr('Keres\00E9si konfigur\00E1ci\00F3 - %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544451220751480)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'hu'
,p_message_text=>unistr('Megosztott dinamikus \00E9rt\00E9klista - %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139544269481751480)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'hu'
,p_message_text=>unistr('Feladatdefin\00EDci\00F3 - %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542720383751480)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'hu'
,p_message_text=>'Munkafolyamat - %0 '
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564891507751486)
,p_name=>'VALID'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nyes')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556453423751484)
,p_name=>'VALIDATIONS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ellen\0151rz\00E9sek')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617107787751502)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00E9rt\00E9k megad\00E1sa k\00F6telez\0151')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663410374751515)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 r\00E9sz\00E9re az \00E9rt\00E9k megad\00E1sa k\00F6telez\0151.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586073558751492)
,p_name=>'VERTICAL'
,p_message_language=>'hu'
,p_message_text=>unistr('f\00FCgg\0151leges')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577610045751490)
,p_name=>'VIEW'
,p_message_language=>'hu'
,p_message_text=>unistr('n\00E9zet')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611462345751500)
,p_name=>'VIEWS'
,p_message_language=>'hu'
,p_message_text=>unistr('n\00E9zetek')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617949725751502)
,p_name=>'VIEW_ALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00D6sszes megtekint\00E9se')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557808265751484)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'hu'
,p_message_text=>unistr('Vizu\00E1lisan elrejtett hivatkoz\00E1s')
,p_is_js_message=>true
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139598667104751496)
,p_name=>'WARNING'
,p_message_language=>'hu'
,p_message_text=>unistr('Figyelmeztet\00E9s')
,p_is_js_message=>true
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577204842751490)
,p_name=>'WEEK'
,p_message_language=>'hu'
,p_message_text=>unistr('h\00E9t')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573183205751489)
,p_name=>'WEEKLY'
,p_message_language=>'hu'
,p_message_text=>'Hetente'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577301193751490)
,p_name=>'WEEKS'
,p_message_language=>'hu'
,p_message_text=>unistr('h\00E9t')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139617247949751502)
,p_name=>'WELCOME_USER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00DCdv\00F6z\00F6lj\00FCk: %0')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615446298751501)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen \00E9rt\00E9k tal\00E1lhat\00F3, ellen\0151rizze a be\00EDrt adatot.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615546514751501)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen \00E9rt\00E9k tal\00E1lhat\00F3, ellen\0151rizze a be\00EDrt adatot.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553352236751483)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen d\00E1tum\00E9rt\00E9k tal\00E1lhat\00F3, ellen\0151rizze a d\00E1tum form\00E1tum\00E1t.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139615317750751501)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen sz\00E1m\00E9rt\00E9k tal\00E1lhat\00F3, ellen\0151rizze a sz\00E1m form\00E1tum\00E1t.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564492081751486)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen id\0151b\00E9lyeg\00E9rt\00E9k tal\00E1lhat\00F3, ellen\0151rizze az id\0151b\00E9lyeg form\00E1tum\00E1t.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139588957948751493)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" nem rendelhet\0151 hozz\00E1. T\00F6bb-b\00E1jtos t\00E9telekn\00E9l haszn\00E1ljon kett\0151s id\00E9z\0151jelet, vagy ellen\0151rizze, hogy az elem hossza 30 vagy kevesebb b\00E1jt. A 30 b\00E1jtn\00E1l hosszabb elemekre hivatkoz\00E1shoz haszn\00E1lja a v() szintaxist.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578728711751490)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'hu'
,p_message_text=>unistr('Hozz\00E1f\00E9r\00E9s megtagadva %0 biztons\00E1gi ellen\0151rz\00E9s \00E1ltal')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581254408751491)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alkalmaz\00E1s nem \00E9rhet\0151 el')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579681516751490)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alkalmaz\00E1s nem tal\00E1lhat\00F3.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579746321751491)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('alkalmaz\00E1s=%0 munkater\00FClet=%1')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580136456751491)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez az alkalmaz\00E1s korl\00E1tozott el\00E9r\00E9s\0171, pr\00F3b\00E1lja meg k\00E9s\0151bb.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580080943751491)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'hu'
,p_message_text=>unistr('Ennek az alkalmaz\00E1snak az el\00E9r\00E9se az alkalmaz\00E1sfejleszt\0151kre korl\00E1tozott, pr\00F3b\00E1lja meg k\00E9s\0151bb.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579276490751490)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-7744 Nem lehet feldolgozni az el\00E1gaztat\00E1si f\00FCggv\00E9ny \00E1ltal visszat\00E9r\00EDtett URL-c\00EDmet.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579150433751490)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-7744 Nem lehet feldolgozni az el\00E1gaztat\00E1si f\00FCggv\00E9ny \00E1ltal visszat\00E9r\00EDtett oldalt.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579485171751490)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1430 Nem t\00E1mogatott a kezd\0151oldal megjelen\00EDt\00E9s\00E9re vonatkoz\00F3 elj\00E1r\00E1s h\00EDv\00E1sa: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580580653751491)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1018 Hiba a l\00E9p\00E9s gyors\00EDt\00F3t\00E1r\00E1nak ki\00FCr\00EDt\00E9sekor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578950015751490)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1005 Ismeretlen sz\00E1m\00EDt\00E1si t\00EDpus.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579825566751491)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1201 Nem lett be\00E1ll\00EDtva munkamenet-azonos\00EDt\00F3 az egy\00E9ni hiteles\00EDt\00E9skor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579956370751491)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'hu'
,p_message_text=>'oldal=%0'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579599970751490)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-7620 Nem hat\00E1rozhat\00F3 meg az alkalmaz\00E1s (%0) munkater\00FClete.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560096739751485)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'hu'
,p_message_text=>unistr('Szerkeszt\00E9s')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578639039751490)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1802 Nem tal\00E1lhat\00F3 a(z) "%0" elem azonos\00EDt\00F3ja')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578356090751490)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1002 Nem tal\00E1lhat\00F3 a(z) "%0" elem elemazonos\00EDt\00F3ja a(z) "%1" alkalmaz\00E1sban.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578434269751490)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem v\00E1rt hiba, alkalmaz\00E1s vagy oldal szintj\00E9n nem lehet megtal\00E1lni az elem nev\00E9t.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578891538751490)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('M\00E1r az adatok els\0151 oldal\00E1n\00E1l tart.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595363318751495)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Az elemazonos\00EDt\00F3 (%0) nincs defini\00E1lva az aktu\00E1lis oldalon.')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552962577751483)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'hu'
,p_message_text=>unistr('Lehet, hogy az elem nem lett be\00E1ll\00EDtva az argumentumoknak az alkalmaz\00E1shoz tov\00E1bb\00EDt\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553291208751483)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'hu'
,p_message_text=>unistr('(Nincs megadva az ellen\0151rz\0151 \00F6sszeg)')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552709936751483)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'hu'
,p_message_text=>unistr('Az elem akkor \00E1ll\00EDthat\00F3 be, ha tartozik hozz\00E1 egy "felhaszn\00E1l\00F3 szint\0171 k\00F6nyvjelz\0151" funkci\00F3j\00FA ellen\0151rz\0151 \00F6sszeg.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552678185751483)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'hu'
,p_message_text=>unistr('Az elem akkor \00E1ll\00EDthat\00F3 be, ha tartozik hozz\00E1 egy "alkalmaz\00E1s szint\0171 k\00F6nyvjelz\0151" funkci\00F3j\00FA ellen\0151rz\0151 \00F6sszeg.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552848965751483)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('Az elem akkor \00E1ll\00EDthat\00F3 be, ha azt "munkamenet" ellen\0151rz\0151 \00F6sszeg k\00EDs\00E9ri.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552538647751483)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez az elem nem v\00E9dett.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580620233751491)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs oldal szint\0171 s\00FAg\00F3.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139568595236751487)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 munkater\00FCletnek nincs el\00E9g jogosults\00E1ga, hogy %1 s\00E9mak\00E9nt elemezzen.')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139579056844751490)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1010 Az "El\00E1gaztat\00E1s oldalra" t\00EDpusn\00E1l a feldolgoz\00E1si ism\00E9tl\00E9sek fogad\00E1s\00E1nak sz\00E1ma t\00FAll\00E9pte a korl\00E1tot. %0')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139535561603751478)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Az oldal nem el\00E9rhet\0151, \00EDgy az oldalminta nem futtathat\00F3.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553122006751483)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez az oldal nem h\00EDvhat\00F3 meg URL-c\00EDmmel, illetve GET vagy POST utas\00EDt\00E1ssal a megjelen\00EDt\00E9si elj\00E1r\00E1shoz, mert az csak az "El\00E1gaztat\00E1s oldalra" \00E1gt\00EDpus haszn\00E1lat\00E1val h\00EDvhat\00F3 meg.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139637957310751508)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba t\00F6rt\00E9nt a nem sz\00E1m\00E9rt\00E9k %0 elembe val\00F3 ment\00E9s\00E9nek megk\00EDs\00E9rl\00E9sekor. ')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570222793751488)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" alkalmaz\00E1s-elemz\00E9si s\00E9ma nem l\00E9tezik az adatb\00E1zisban.')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570361350751488)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'hu'
,p_message_text=>unistr('Az INTERNAL munkater\00FCleten l\00E9v\0151 fi\00F3kok csak a(z) &PRODUCT_NAME. term\00E9k el\00E9r\00E9s\00E9hez haszn\00E1lhat\00F3k. <a href="%0">Adminisztr\00E1ci\00F3s szolg\00E1ltat\00E1sok</a>.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578288058751490)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-1029 Nem lehet t\00E1rolni a munkameneti inform\00E1ci\00F3t. munkamenet=%0 elem=%1')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581339098751491)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 nyomk\00F6vet\00E9s nem \00E1ll\00EDthat\00F3 le')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139578512645751490)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('V\00E1ratlan hiba')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589378614751493)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az update_substitution_cache gyors\00EDt\00F3t\00E1rban: %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581421296751491)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A s\00FAg\00F3 megjelen\00EDt\00E9s\00E9hez meg kell adni az alkalmaz\00E1st \00E9s az oldalt.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139603199115751497)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 automatiz\00E1l\00E1s.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538606655751478)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Automatiz\00E1l\00E1si lek\00E9rdez\00E9s hib\00E1ja: %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582547279751491)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 munkamenet t\00F6r\00F6lve.')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523854752751474)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem hajthat\00F3 v\00E9gre a(z) %0 programk\00F3d! Nem t\00E1mogatja az adatb\00E1zis, vagy nem enged\00E9lyezi a p\00E9ld\00E1ny MLE_LANGUAGES param\00E9tere.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139521482530751473)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Enn\00E9l az adatb\00E1zis-verzi\00F3n\00E1l nem t\00E1mogatott a nyelveket kezel\0151 vez\00E9rl\0151 (MLE)!')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560625124751485)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alkalmaz\00E1sgy\0171jtem\00E9ny t\00F6mbje nem lehet null \00E9rt\00E9k\0171')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560451942751485)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A megadott %0 tagattrib\00FAtumi sz\00E1m \00E9rv\00E9nytelen. Az attrib\00FAtumsz\00E1m csak 1 \00E9s %1 k\00F6z\00F6tti lehet')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560912165751485)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alkalmaz\00E1sgy\0171jtem\00E9ny m\00E1r l\00E9tezik')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560776692751485)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('A gy\0171jtem\00E9ny neve nem lehet null \00E9rt\00E9k\0171')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560860209751485)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'hu'
,p_message_text=>unistr('A gy\0171jtem\00E9ny neve nem lehet 255 karaktern\00E9l hosszabb')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560210114751485)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 alkalmaz\00E1sgy\0171jtem\00E9ny nem l\00E9tezik.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561039116751485)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'hu'
,p_message_text=>unistr('A kurzor m\00E9g nincs megnyitva')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560376989751485)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('A(z) %0 tagsorrend nem l\00E9tezik a(z) %1 alkalmaz\00E1sgy\0171jtem\00E9nyben'),
''))
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139560562990751485)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 tagsorrend nem l\00E9tezik a(z) "%1" alkalmaz\00E1sgy\0171jtem\00E9nyben')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513314544751471)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 algoritmus nem t\00E1mogatott ECDSA eset\00E9ben.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139513062684751471)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 elliptikus g\00F6rbe nem t\00E1mogatott.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638781867751508)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Ezen a rendszeren nem t\00E1mogatott a(z) "%0" titkos\00EDt\00E1si f\00FCggv\00E9ny.')
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691006195751523)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'hu'
,p_message_text=>unistr('El\00E9rhet\0151s\00E9g tesztelve')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582069826751491)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'hu'
,p_message_text=>unistr('Bez\00E1r\00E1s')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582156372751491)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'hu'
,p_message_text=>unistr('Oldal testreszab\00E1si be\00E1ll\00EDt\00E1sai')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582263803751491)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'hu'
,p_message_text=>unistr('Alap\00E9rtelmezett')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582347087751491)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00EDtett')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582419087751491)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'hu'
,p_message_text=>'Rejtett'
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581820122751491)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'hu'
,p_message_text=>unistr('Jel\00F6lje be az ehhez az oldalhoz hozz\00E1adand\00F3 r\00E9gi\00F3kat. A bejel\00F6lt oldalak nem jelennek meg, ha \00D6n nem a megfelel\0151 alkalmaz\00E1si k\00F6rnyezetben van, vagy \00D6nnek nincs megfelel\0151 jogosults\00E1ga.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581966881751491)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez az oldal nem testre szabhat\00F3.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691317644751523)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'hu'
,p_message_text=>unistr('A t\00E9ma st\00EDlus\00E1nak megv\00E1ltoztat\00E1s\00E1val szem\00E9lyess\00E9 teheti ennek az alkalmaz\00E1snak a megjelen\00E9s\00E9t. Az al\00E1bbi list\00E1ban v\00E1lassza a T\00E9ma st\00EDlusa elemet, \00E9s kattintson a V\00E1ltoztat\00E1sok alkalmaz\00E1sa elemre.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139692174605751524)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'hu'
,p_message_text=>unistr('R\00E9gi\00F3 megjelen\00EDt\00E9se')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691254954751523)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Az alkalmaz\00E1s alap\00E9rtelmezett st\00EDlus\00E1nak haszn\00E1lata')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139691130624751523)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Megjelen\00E9s ')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635321094751507)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik a(z) %0 \00F6sszes\00EDt\00E9sben hivatkozott oszlopindex.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139528007895751475)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatexport\00E1l\00E1s hozz\00E1f\0171z\00E9se nem t\00E1mogatott a(z) %0 form\00E1tum eset\00E9n.')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491084812751464)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 form\00E1tum eset\00E9n a CLOB kimeneti form\00E1tum nem t\00E1mogatott.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635059445751507)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'hu'
,p_message_text=>unistr('Az oszlopt\00F6r\00E9snek az oszlopt\00F6mb\00F6k elej\00E9n kell lenni.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635105732751507)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik a(z) %0 \00E1ltal hivatkozott oszlopcsoportos\00EDt\00E1si index.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139542231800751479)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('export\00E1l\00E1s')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139549454461751482)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'hu'
,p_message_text=>unistr('Az export\00E1l\00E1s form\00E1tuma csak olyan XML lehet, amelyik megfelel az ORDS nyomtat\00F3kiszolg\00E1l\00F3 form\00E1tum\00E1nak.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635418955751507)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik a(z) %0 kiemel\00E9sben hivatkozott oszlopindex.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139538845057751478)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen export\00E1l\00E1si form\00E1tum: %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139635208769751507)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tezik a(z) %0 \00E1ltal hivatkozott f\00F6l\00E9rendelt csoport indexe.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139660440419751514)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 t\00E1bl\00E1zat %1 oszlopa "GENERATED ALWAYS" azonos\00EDt\00E1s\00FA oszlop. Ellen\0151rizze, hogy nincs-e lek\00E9pezve oszlop a Konfigur\00E1l\00E1s p\00E1rbesz\00E9dpanelen a(z) %1 oszlop r\00E9sz\00E9re.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572014171751488)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAl kev\00E9s a megadott v\00E9grehajt\00E1si id\0151k\00F6z.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572191147751488)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatbet\00F6lt\00E9shez nem lett oszlop megadva.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573408338751489)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 oszlop a(z) "%0" sorv\00E1laszt\00F3hoz. Pr\00F3b\00E1lkozzon az automatikus felismer\00E9ssel, vagy ellen\0151rizze a JSON strukt\00FAr\00E1t.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582805780751491)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nincs munkalap az XLSX f\00E1jlban.')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527902830751475)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'hu'
,p_message_text=>unistr('A k\00E9rt felder\00EDtend\0151 hierarchiaszintek sz\00E1ma (%0) t\00FAll\00E9pi a maxim\00E1lis \00E9rt\00E9ket (%1).')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139582715625751491)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'hu'
,p_message_text=>unistr('A megadott munkalap nincs az XLSX f\00E1jlban.')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139561148591751485)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az adatb\00E1zisban megv\00E1ltozott az adatok aktu\00E1lis verzi\00F3ja, ami\00F3ta valamelyik felhaszn\00E1l\00F3 friss\00EDt\00E9si elj\00E1r\00E1st kezdem\00E9nyezett.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564022624751486)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba t\00F6rt\00E9n a kimutat\00E1s %0 oszlopainak m\00F3dos\00EDt\00E1sakor')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674543173751518)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 nem alak\00EDthat\00F3 \00E1t SDO_GEOMETRY \00E9rt\00E9kk\00E9.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611088078751500)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %1 adatt\00EDpus\00FA %0 oszlop nem alak\00EDthat\00F3 \00E1t VARCHAR2 t\00EDpuss\00E1!')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618487912751502)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%1" attrib\00FAtumhoz megadott "%0" oszlop nem tal\00E1lhat\00F3 az adatforr\00E1sban!')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554591627751483)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6bb\00E9rt\00E9kes oszlopokhoz a(z) %0 sz\0171r\0151t\00EDpus nem t\00E1mogatott.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139678069706751519)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen a "k\00F6z\00F6tt" sz\0171r\0151.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139533668652751477)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 %2 \00E9rt\00E9k a(z) %0 oszlop %1. sor\00E1ban.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139530385848751476)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 oszlop vagy a(z) %1. sor nem l\00E9tezik.')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516912235751472)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen a megadott \00E9rt\00E9klista t\00EDpusa.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516805841751472)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen lek\00E9rdez\00E9st\00EDpus. A lek\00E9rdez\00E9st\00EDpus csak T\00E1bla, SQL-lek\00E9rdez\00E9s \00E9s SQL-lek\00E9rdez\00E9st visszat\00E9r\00EDt\0151 PL/SQL f\00FCggv\00E9ny lehet.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139611195499751500)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Nem siker\00FClt elemezni az SQL-lek\00E9rdez\00E9st!'),
'%0'))
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618584685751502)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%1" attrib\00FAtumhoz megadott %0 oszloppoz\00EDci\00F3 nem tal\00E1lhat\00F3 az SQL utas\00EDt\00E1sban!')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139508592373751470)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAl sok t\00E9tel van a t\00F6bb\00E9rt\00E9kes sz\0171r\0151ben.')
,p_version_scn=>2704944
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139618334695751502)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" attrib\00FAtumhoz nem adtak meg \00E9rt\00E9ket.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516721184751472)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('A PL/SQL f\00FCggv\00E9nyt\00F6rzse nem ad vissza \00E9rt\00E9ket.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139634195134751507)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'hu'
,p_message_text=>unistr('A REST adatforr\00E1s nem tartalmaz M\0171veletet a k\00E9rt DML m\0171velet kezel\00E9s\00E9hez.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675811474751519)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('A tartom\00E1nysz\0171r\0151k csak NUMBER, DATE \00E9s TIMESTAMP adatt\00EDpusok eset\00E9ben t\00E1mogatottak.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139496755192751466)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('A k\00E9relem a k\00F6vetkez\0151 hiba miatt nem siker\00FClt: %0.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139500243667751467)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ebben az adatb\00E1zisban nem \00E9rhet\0151 el a GeoJSON form\00E1tumr\00F3l az SDO_GEOMETRY (oszlop: %0) form\00E1tum\00E1ra val\00F3 \00E1talak\00EDt\00E1s.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503675117751468)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'hu'
,p_message_text=>unistr('XML adatforr\00E1sokban nem t\00E1mogatott az SDO_GEOMETRY (oszlop: %0) \00E1talak\00EDt\00E1sa.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139527793741751475)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00F6bb \00E9rt\00E9k k\00F6z\00F6tti tagol\00F3k\00E9nt a(z) %0 karakter nem t\00E1mogatott.')
,p_version_scn=>2704948
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139675926583751519)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez a f\00FCggv\00E9ny nem haszn\00E1lhat\00F3 lek\00E9rdez\00E9si k\00F6rnyezetben.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139503710890751468)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem egyez\0151 adatt\00EDpus.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139537241137751478)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez az adatforr\00E1s nem t\00E1mogatja t\00F6bb sor m\00F3dos\00EDt\00E1s\00E1t.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516632265751472)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAll\00E9pte a bels\0151 ORDS OUT hozz\00E1rendel\00E9si korl\00E1tj\00E1t. Cs\00F6kkentse a DML sorok mennyis\00E9g\00E9t.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619363162751502)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Nem lehetett elemezni a t\00E1voli kiszolg\00E1l\00F3t\00F3l kapott JSON v\00E1laszt: '),
'%0'))
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139516528743751472)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Ismeretlen vagy rossz a k\00F6rnyezet t\00EDpusa.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139540668422751479)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem t\00E1mogatott komponensek az olvashat\00F3 export\00E1l\00E1shoz: %0')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139638687652751508)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Ezt a f\00E1jlt\00EDpust az elemz\0151 nem t\00E1mogatja.')
,p_version_scn=>2704969
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589468498751493)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Jogosulatlan hozz\00E1f\00E9r\00E9s (a wwv_flow_api.set_credentials nincs be\00E1ll\00EDtva).')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564308935751486)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'hu'
,p_message_text=>unistr('A munkater\00FClet nem lett l\00E9trehozva, mert m\00E1r l\00E9tezik.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139564212490751486)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'hu'
,p_message_text=>unistr('A felhaszn\00E1l\00F3i csoport nem lett l\00E9trehozva, mert m\00E1r l\00E9tezik.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575619437751489)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'hu'
,p_message_text=>unistr('Ism\00E9tl\0151d\0151 felhaszn\00E1l\00F3n\00E9v tal\00E1lhat\00F3 ehhez: %0.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575799850751489)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a felhaszn\00E1l\00F3k bet\00F6lt\00E9sekor. Nem siker\00FClt a(z) %0 felhaszn\00E1l\00F3n\00E1l.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586523914751493)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 felhaszn\00E1l\00F3t kellett volna bet\00F6lteni.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586317645751492)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'hu'
,p_message_text=>unistr('Jelsz\00F3')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586490353751493)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'hu'
,p_message_text=>unistr('Jogosults\00E1gok')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586137068751492)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'hu'
,p_message_text=>unistr('Felhaszn\00E1l\00F3n\00E9v')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666540973751516)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a(z) #COMPONENT_NAME# oldalelem megjelen\00EDt\00E9sekor.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581575678751491)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem jelen\00EDthet\0151 meg az oldal, mert m\00E9g nem lett megnyitva a HTML \0171rlap.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139539933829751479)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a(z) #COMPONENT_NAME# oldalelem\00E9hez val\00F3 elem alap\00E9rtelmezett \00E9rt\00E9k\00E9nek kisz\00E1m\00EDt\00E1sakor.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580885711751491)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a(z) #COMPONENT_NAME# oldalelem\00E9hez val\00F3 elem ut\00F3sz\00E1m\00EDt\00E1sakor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580767418751491)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a(z) #COMPONENT_NAME# oldalelem\00E9hez val\00F3 elem forr\00E1s\00E9rt\00E9k\00E9nek kisz\00E1m\00EDt\00E1sakor.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557583680751484)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'hu'
,p_message_text=>unistr('Jogosulatlan hozz\00E1f\00E9r\00E9s.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139507090413751469)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'hu'
,p_message_text=>unistr('%1 %0 \00E9rt\00E9ke nem egy \00E9rv\00E9nyes JSON-t\00F6mb.')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581029178751491)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'hu'
,p_message_text=>unistr('A JavaScript nem t\00E1mogatott.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581120921751491)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'hu'
,p_message_text=>'Lista'
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139581743976751491)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lehet lek\00E9rdez\00E9st inicializ\00E1lni.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589770090751493)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0m\00F3dos\00EDt\00E1sa nem t\00E1mogatott.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583222271751492)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen elemazonos\00EDt\00F3: %0 ')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610910462751500)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Ehhez az elemhez nincs s\00FAg\00F3.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572795810751488)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem siker\00FClt a diagram lek\00E9rdez\00E9s\00E9nek el\0151\00E1ll\00EDt\00E1sa. Ellen\0151rizze a forr\00E1s \00E9s az oszlop lek\00E9pez\00E9si be\00E1ll\00EDt\00E1sait.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139574080004751489)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen \00E9rt\00E9k a p_mail_id param\00E9tern\00E9l: %0')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610756344751500)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem haszn\00E1lhat\00F3 "Felad\00F3" c\00EDmk\00E9nt a "C\00EDmzett" vagy a "V\00E1lasz c\00EDmzettje", mivel ezek t\00F6bb e-mail-c\00EDmet tartalmaznak.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139695695970751525)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'hu'
,p_message_text=>unistr('Meghaladta a munkater\00FCletenk\00E9nti e-mail-\00FCzenetek maxim\00E1lis sz\00E1m\00E1t. Forduljon a rendszergazd\00E1hoz.')
,p_version_scn=>2704975
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552246072751482)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'hu'
,p_message_text=>unistr('Ezt az elj\00E1r\00E1st csak egy alkalmaz\00E1si munkamenetb\0151l lehet megh\00EDvni.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573917683751489)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 param\00E9tern\00E9l null \00E9rt\00E9k van megadva.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139632073103751506)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" e-mail-sablon nem tal\00E1lhat\00F3 a(z) %1 alkalmaz\00E1sban.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139708514835751528)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az SMTP_HOST_ADDRESS p\00E9ld\00E1ny param\00E9ter\00E9t be kell \00E1ll\00EDtani elektronikus levelek k\00FCld\00E9s\00E9re.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139573391081751489)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az e-mail elk\00FCld\00E9s\00E9hez meg kell adni az \00FCzenet c\00EDmzettj\00E9t.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139698011413751525)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem l\00E9tes\00EDthet\0151 SMTP kapcsolat a konfigur\00E1lt levelez\00E9si kiszolg\00E1l\00F3val.')
,p_version_scn=>2704976
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139673363120751518)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen Ajax h\00EDv\00E1s!')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557225999751484)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lett defini\00E1lva Ajax f\00FCggv\00E9ny a(z) %0 be\00E9p\00FCl\0151 modulhoz')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663876750751515)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 be\00E9p\00FCl\0151 modul r\00E9sz\00E9re nem lett defini\00E1lva v\00E9grehajt\00E1si f\00FCggv\00E9ny')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557342459751484)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem lett defini\00E1lva megjelen\00EDt\00E9si f\00FCggv\00E9ny a(z) %0 be\00E9p\00FCl\0151 modulhoz')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674294083751518)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('A REST adatforr\00E1si "%0" be\00E9p\00FCl\0151 modul nem tartalmaz "Capabilities" f\00FCggv\00E9nyt.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674117572751518)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('A REST adatforr\00E1si "%0" be\00E9p\00FCl\0151 modul nem tartalmaz DML f\00FCggv\00E9nyt.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674366076751518)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('A REST adatforr\00E1si "%0" be\00E9p\00FCl\0151 modul nem tartalmaz v\00E9grehajt\00E1si f\00FCggv\00E9nyt.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139674438232751518)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'hu'
,p_message_text=>unistr('A REST adatforr\00E1si "%0" be\00E9p\00FCl\0151 modul nem tartalmaz gyors beolvas\00F3 f\00FCggv\00E9nyt.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554772339751483)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('A PLSQL k\00F3dban hiba jelentkezett a be\00E9p\00FCl\0151 modul feldolgoz\00E1sakor.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563308326751486)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00E9rt\00E9k megad\00E1sa k\00F6telez\0151.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139596391214751495)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 adatt\00EDpus nem alak\00EDthat\00F3 \00E1t VARCHAR2 t\00EDpus\00FAra!')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684593199751521)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%1" attrib\00FAtumhoz megadott "%0" oszlop nem tal\00E1lhat\00F3 az SQL-utas\00EDt\00E1sban!')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139511804176751471)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'hu'
,p_message_text=>unistr('%1 %0 \00E9rt\00E9ke nem egy \00E9rv\00E9nyes JSON-t\00F6mb.')
,p_version_scn=>2704946
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661771941751515)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00E9rt\00E9klista (LOV) lek\00E9rdez\00E9s\00E9t vagy az \00E9rt\00E9kek Megnevezett list\00E1j\00E1t meg kell adni %0 r\00E9sz\00E9re.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139663348576751515)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 \00E9rt\00E9klist\00E1j\00E1nak SQL-lek\00E9rdez\00E9s\00E9ben az oszlopok rossz sz\00E1ma lett kiv\00E1lasztva. N\00E9zze meg a p\00E9ld\00E1ban, hogy melyek az \00E9rv\00E9nyes SQL-utas\00EDt\00E1sok.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684383572751521)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%0" attrib\00FAtumhoz nem adtak meg oszlopot.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713518225751530)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%1" attrib\00FAtum r\00E9sz\00E9re be\00EDrt %0 \00E9rt\00E9k nem sz\00E1m.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139666849988751516)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('Az SQL utas\00EDt\00E1sban rossz a(z) %0 adatt\00EDpusa. A(z) %1 oszlopsz\00E1ma %2, pedig a v\00E1rt %3.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139684461137751521)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) "%1" attrib\00FAtumhoz megadott "%0" oszlopnak %2 adatt\00EDpusa van, pedig %3 kellene.')
,p_version_scn=>2704973
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139553990946751483)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem tal\00E1lhat\00F3 a kimutat\00E1s elrendez\00E9se.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139541558648751479)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'hu'
,p_message_text=>unistr('A h\00E1tt\00E9rbeli futtat\00E1sok hat\00E1r\00E9rt\00E9ke t\00FAll\00E9pve %0 eset\00E9ben.')
,p_version_scn=>2704949
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491813688751465)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 egy m\00E1sik v\00E9grehajt\00E1sa m\00E1r fut.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139491735307751465)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'hu'
,p_message_text=>unistr('A(z) %0 egy m\00E1sik v\00E9grehajt\00E1sa m\00E1r fut a(z) %1 k\00F6rnyezet eset\00E9ben.')
,p_version_scn=>2704942
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139506782732751469)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'hu'
,p_message_text=>unistr('A felt\00F6lt\00F6tt f\00E1jlok nem l\00E1that\00F3k a(z) %0 v\00E9grehajt\00E1s\00E1hoz tartoz\00F3 munkafolyamatban.')
,p_version_scn=>2704943
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619286675751502)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00D6sszesen (Sum) \00E9rt\00E9k\00E9t sz\00E1m\00EDt\00F3 funkci\00F3 nem haszn\00E1lhat\00F3 olyan kimutat\00E1sokhoz, amelyek alapja REST adatforr\00E1s.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139580947170751491)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('ERR-2904 Nem \00E1ll\00EDthat\00F3 be a billenty\0171parancs \00E9rt\00E9ke.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139585973143751492)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba: Ismeretlen billenty\0171parancs-t\00EDpus.')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139523648311751474)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAl hossz\00FA a keres\00E9si lek\00E9rdez\00E9s.')
,p_version_scn=>2704947
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575025550751489)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem olvashat\00F3 be a hiteles\00EDt\00E9si s\00E9ma a(z) %0 alkalmaz\00E1sban.')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139583037445751491)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem siker\00FClt beolvasni a(z) %0 \00F6sszetev\0151t.')
,p_version_scn=>2704956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139653386446751512)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'hu'
,p_message_text=>unistr('Az aktu\00E1lis munkamenethez m\00E1r l\00E9tezik a b\00E9rl\0151azonos\00EDt\00F3.')
,p_version_scn=>2704970
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139586211292751492)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'hu'
,p_message_text=>'E-mail'
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713029126751530)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'hu'
,p_message_text=>unistr('A hiteles\00EDt\00E9s sikertelen.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139613662585751501)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'hu'
,p_message_text=>unistr('Az apex_util.g_request_cookies be\00E1ll\00EDt\00E1s\00E1ban egy vagy t\00F6bb cookie \00E9rv\00E9nytelen \00E9rt\00E9ket tartalmaz.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139595527797751495)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'hu'
,p_message_text=>unistr('\00C9rv\00E9nytelen volt az UDDI regiszter v\00E1lasza.')
,p_version_scn=>2704961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139554856883751483)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'hu'
,p_message_text=>unistr('A megadott URL-c\00EDm nem adott vissza \00E9rv\00E9nyes WSDL dokumentumot.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557674889751484)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'hu'
,p_message_text=>unistr('A WSDL dokumentum t\00F6bb SOAP hozz\00E1rendel\00E9st tartalmaz. A(z) &PRODUCT_NAME. csak az egy SOAP hozz\00E1rendel\00E9s\0171 WSDL dokumentumokat t\00E1mogatja. Kattintson a Webszolg\00E1ltat\00E1s-referencia manu\00E1lis l\00E9trehoz\00E1sa lehet\0151s\00E9gre, hogy folytassa a szolg\00E1ltat\00E1s hivatkoz\00E1')
||unistr('sainak l\00E9trehoz\00E1s\00E1t.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139633273597751506)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'hu'
,p_message_text=>unistr('A szolg\00E1ltat\00E1st\00F3l \00E9rkezett v\00E1lasz nem XML volt.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139712909926751530)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'hu'
,p_message_text=>unistr('Az OAuth hozz\00E1f\00E9r\00E9si token nem \00E9rhet\0151 el vagy lej\00E1rt.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139677424692751519)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'hu'
,p_message_text=>unistr('Meghaladta a munkater\00FCletenk\00E9nti webszolg\00E1ltat\00E1si lek\00E9r\00E9sek maxim\00E1lis sz\00E1m\00E1t. Forduljon a rendszergazd\00E1hoz.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139713106423751530)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'hu'
,p_message_text=>unistr('A kiszolg\00E1l\00F3 nem t\00E1mogatott OAuth token t\00EDpussal v\00E1laszolt.')
,p_version_scn=>2704977
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139557096481751484)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'hu'
,p_message_text=>unistr('A WSDL dokumentum nem tartalmaz hozz\00E1rendel\00E9st ahhoz a SOAP dokumentumhoz, amely a hivatkoz\00E1s hozz\00E1ad\00E1s\00E1hoz sz\00FCks\00E9ges.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139552414503751482)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'hu'
,p_message_text=>unistr('E WSDL el\00E9r\00E9s\00E9hez hiteles\00EDt\00E9si jogosults\00E1g sz\00FCks\00E9ges. Adja meg al\00E1bb a felhaszn\00E1l\00F3nevet \00E9s a jelsz\00F3t.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139563498967751486)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'hu'
,p_message_text=>unistr('A megjelen\00EDt\00E9si vez\00E9rl\0151program nem tudta \00E9rtelmezni a WSDL dokumentumot. Kattintson a Webszolg\00E1ltat\00E1s-referencia manu\00E1lis l\00E9trehoz\00E1sa lehet\0151s\00E9gre, hogy folytassa a szolg\00E1ltat\00E1s hivatkoz\00E1s\00E1nak l\00E9trehoz\00E1s\00E1t.')
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139636236677751507)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'hu'
,p_message_text=>unistr('Nem hajhat\00F3 v\00E9gre a friss\00EDt\00E9s.')
,p_version_scn=>2704967
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139662043170751515)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00E9rt\00E9klist\00E1nak ugyanaz a visszat\00E9r\00E9si \00E9s a megjelen\00EDt\00E9si oszlopa!')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139661919421751515)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Az \00E9rt\00E9klista nem rendelkezik visszat\00E9r\00E9si oszloppal.')
,p_version_scn=>2704972
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589645400751493)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az oszlop\00E9rt\00E9k beolvas\00E1sakor: %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614500091751501)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'hu'
,p_message_text=>unistr('T\00FAl r\00E9giek ezek a t\00E1bl\00E1zatos adatok; a forr\00E1sadatok m\00F3dos\00EDtva lettek.<br/> Kattintson <strong><a href="%0">ide</a></strong>, hogy elvesse a m\00F3dos\00EDt\00E1sokat, \00E9s t\00F6ltse be \00FAjb\00F3l az adatokat az adatb\00E1zisb\00F3l.')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569717324751488)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba az oldalt\00F6rdel\00E9si karakterl\00E1nc \00E9rtelmez\00E9sekor')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569612957751488)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('nem \00E1llap\00EDthat\00F3k meg a lek\00E9rdez\00E9s fejl\00E9cei:'),
'%0'))
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569835200751488)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'hu'
,p_message_text=>unistr('hiba a kimutat\00E1s l\00E1bl\00E9c\00E9nek lecser\00E9l\00E9sekor')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569985654751488)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('nem siker\00FClt elemezni az SQL-lek\00E9rdez\00E9st:'),
'%0',
'%1'))
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576021673751489)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'hu'
,p_message_text=>unistr('Legal\00E1bb %0 sor lek\00E9rve, a tal\00E1lt, de nem megjelen\00EDtett sorok: %1')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572491638751488)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00E9rv\00E9nytelen a lek\00E9rdez\00E9s #%0 (%1) oszlopa, haszn\00E1ljon m\00E1sodlagos nevet a HTML-t haszn\00E1l\00F3 oszlopokhoz')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139589593560751493)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'hu'
,p_message_text=>unistr('Hiba a lek\00E9rdez\00E9s fejl\00E9ceinek beolvas\00E1sakor: %0')
,p_version_scn=>2704959
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570029162751488)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('kimutat\00E1si hiba:'),
'%0'))
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139610137597751500)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'hu'
,p_message_text=>unistr('Sorok rendez\00E9se ezen oszlop alapj\00E1n')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572586205751488)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'hu'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Nem elemezhet\0151 a lek\00E9rdez\00E9s, ellen\0151rizze a lek\00E9rdez\00E9s szintaktikai helyess\00E9g\00E9t.'),
'(%0)',
'</p>'))
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614662618751501)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'hu'
,p_message_text=>unistr('Ez a formalap nem mentett m\00F3dos\00EDt\00E1sokat tartalmaz. Nyomja meg az "OK" gombot, hogy folytassa a v\00E1ltoz\00E1sok ment\00E9se n\00E9lk\00FCl. ')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139619160701751502)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'hu'
,p_message_text=>unistr('A v\00E1lasztott adatforr\00E1ssal nem t\00E1mogatott a kimutat\00E1s oldalakra bont\00E1sa (%0).')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139572335570751488)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00E9rv\00E9nytelen a lek\00E9rdez\00E9s #%0 (%1) oszlopa, haszn\00E1ljon m\00E1sodlagos oszlopnevet')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139576181295751489)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 - %1 sor / \00F6sszesen t\00F6bb, mint %2')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139616613436751501)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 - %1 / t\00F6bb, mint %2')
,p_version_scn=>2704963
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139575973954751489)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'hu'
,p_message_text=>unistr('%0 - %1 sor / \00F6sszesen %2')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139556776009751484)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'hu'
,p_message_text=>'%0 - %1 / %2'
,p_version_scn=>2704952
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139570156486751488)
,p_name=>'Y'
,p_message_language=>'hu'
,p_message_text=>'Y'
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139577449137751490)
,p_name=>'YEAR'
,p_message_language=>'hu'
,p_message_text=>unistr('\00E9v')
,p_version_scn=>2704955
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139569340409751487)
,p_name=>'YEARS'
,p_message_language=>'hu'
,p_message_text=>unistr('\00E9v')
,p_version_scn=>2704953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139614798238751501)
,p_name=>'YES'
,p_message_language=>'hu'
,p_message_text=>'Igen'
,p_version_scn=>2704963
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
 p_id=>wwv_flow_imp.id(109678305570583962.4482)
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
 p_id=>1.4482
,p_name=>unistr('\00DCzenetek')
,p_alias=>'MESSAGES'
,p_step_title=>unistr('\00DCzenetek')
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
