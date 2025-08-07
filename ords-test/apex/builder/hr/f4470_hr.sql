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
,p_default_application_id=>4481
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4481 - Oracle APEX Runtime Messages
--
-- Application Export:
--   Application:     4481
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
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A144691935325756568')
,p_page_view_logging=>'YES'
,p_charset=>'utf-8'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422180859'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'hr'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(109678305570583962.4481)
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
 p_id=>wwv_flow_imp.id(4481)
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
 p_id=>wwv_flow_imp.id(728504220438374.4481)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(736540203200530.4481)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243430877
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(800575880762576.4481)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>15457644
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2657043006125217.4481)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117636987
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(110599941590099161.4481)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007818
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(118481226255833028.4481)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214098089478467.4481)
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
 p_id=>wwv_flow_imp.id(124389732573989299.4481)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(209516503264520988.4481)
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
 p_id=>wwv_flow_imp.id(285800719532138903.4481)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(649595203182764436.4481)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539584
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1874744429444344138.4481)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1941451863897626238.4481)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2027366558906572283.4481)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(2120597162971751123.4481)
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
 p_id=>wwv_flow_imp.id(649613204592764515.4481)
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
 p_id=>wwv_flow_imp.id(850359229090693491.4481)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Wizard Dialog.hr'
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
 p_id=>wwv_flow_imp.id(293526110820992194.4481)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4481)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293526630547992195.4481)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4481)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293527171164992195.4481)
,p_page_template_id=>wwv_flow_imp.id(850359229090693491.4481)
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
 p_id=>wwv_flow_imp.id(851037359784626333.4481)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Dialog.hr'
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
 p_id=>wwv_flow_imp.id(293473352245977306.4481)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4481)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293473882718977306.4481)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4481)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293474370844977307.4481)
,p_page_template_id=>wwv_flow_imp.id(851037359784626333.4481)
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
 p_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Edit Screen.hr'
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
 p_id=>wwv_flow_imp.id(2495515088702127.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496016567702127.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2496522618702127.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497097895702127.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2497562953702128.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498085850702128.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2498553894702128.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499023066702128.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2499516729702128.4481)
,p_page_template_id=>wwv_flow_imp.id(851037631091626378.4481)
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
 p_id=>wwv_flow_imp.id(851039898661626389.4481)
,p_theme_id=>3
,p_name=>'APEX 5.0 - No Side Bar.hr'
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
 p_id=>wwv_flow_imp.id(2418665544706094.4481)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4481)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419139140706094.4481)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4481)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2419660231706094.4481)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4481)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420136000706094.4481)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4481)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2420617033706094.4481)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4481)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421142368706094.4481)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4481)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2421629849706095.4481)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4481)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2422132460706095.4481)
,p_page_template_id=>wwv_flow_imp.id(851039898661626389.4481)
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
 p_id=>wwv_flow_imp.id(851040471818626394.4481)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Right Side Bar.hr'
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
 p_id=>wwv_flow_imp.id(1537388880131854.4481)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4481)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1537880270131855.4481)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4481)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538315330131855.4481)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4481)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1538840638131855.4481)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4481)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539339441131855.4481)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4481)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1539830162131855.4481)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4481)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540338421131855.4481)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4481)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1540832064131856.4481)
,p_page_template_id=>wwv_flow_imp.id(851040471818626394.4481)
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
 p_id=>wwv_flow_imp.id(851041812938626395.4481)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - Sign Up Wizard.hr'
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
 p_id=>wwv_flow_imp.id(115212309210289451.4481)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4481)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115212857712289451.4481)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4481)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213340345289452.4481)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4481)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115213804331289452.4481)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4481)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214317592289452.4481)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4481)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115214875819289453.4481)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4481)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115215325320289453.4481)
,p_page_template_id=>wwv_flow_imp.id(851041812938626395.4481)
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
 p_id=>wwv_flow_imp.id(851042476105626395.4481)
,p_theme_id=>3
,p_name=>'APEX 5.0 - Wizard Page.hr'
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
 p_id=>wwv_flow_imp.id(1485266589875353.4481)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4481)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1485734308875353.4481)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4481)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486237142875354.4481)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4481)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1486735024875354.4481)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4481)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487219028875354.4481)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4481)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1487770987875354.4481)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4481)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488272041875354.4481)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4481)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1488725778875354.4481)
,p_page_template_id=>wwv_flow_imp.id(851042476105626395.4481)
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
 p_id=>wwv_flow_imp.id(514381861202541059.4481)
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
 p_id=>wwv_flow_imp.id(514382190540541061.4481)
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
 p_id=>wwv_flow_imp.id(514382538845541061.4481)
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
 p_id=>wwv_flow_imp.id(620629666890811728.4481)
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
 p_id=>wwv_flow_imp.id(620629778318811745.4481)
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
 p_id=>wwv_flow_imp.id(868252865986181054.4481)
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
 p_id=>wwv_flow_imp.id(514338947870435171.4481)
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
 p_id=>wwv_flow_imp.id(2962385277500935.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2962865718500935.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963338641500935.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2963894582500935.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964329937500935.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2964897214500936.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965324003500936.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2965838011500936.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966328405500936.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2966823859500936.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967325351500936.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2967812485500936.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2968377768500937.4481)
,p_plug_template_id=>wwv_flow_imp.id(514338947870435171.4481)
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
 p_id=>wwv_flow_imp.id(514343873675436760.4481)
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
 p_id=>wwv_flow_imp.id(32585474981747544.4481)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32585915750747544.4481)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4481)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586471989747545.4481)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4481)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(32586972270747545.4481)
,p_plug_template_id=>wwv_flow_imp.id(514343873675436760.4481)
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
 p_id=>wwv_flow_imp.id(771803843049318447.4481)
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
 p_id=>wwv_flow_imp.id(3207496127505978.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3207907805505978.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208484941505978.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3208991047505978.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209402462505979.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3209972507505979.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210460159505979.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3210935368505979.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211466566505979.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3211956312505979.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212461962505979.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3212966370505980.4481)
,p_plug_template_id=>wwv_flow_imp.id(771803843049318447.4481)
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
 p_id=>wwv_flow_imp.id(850406444708718383.4481)
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
 p_id=>wwv_flow_imp.id(2204663592232325.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205135519232325.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2205694824232325.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206129075232325.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2206618558232325.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207115910232326.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2207688896232326.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208160700232326.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2208614050232326.4481)
,p_plug_template_id=>wwv_flow_imp.id(850406444708718383.4481)
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
 p_id=>wwv_flow_imp.id(850442966147812557.4481)
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
 p_id=>wwv_flow_imp.id(3346988371508588.4481)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3347426198508588.4481)
,p_plug_template_id=>wwv_flow_imp.id(850442966147812557.4481)
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
 p_id=>wwv_flow_imp.id(856206049762521193.4481)
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
 p_id=>wwv_flow_imp.id(2526185270486606.4481)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2526610033486606.4481)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527184084486606.4481)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2527626846486607.4481)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528141078486607.4481)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2528637911486607.4481)
,p_plug_template_id=>wwv_flow_imp.id(856206049762521193.4481)
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
 p_id=>wwv_flow_imp.id(914802799655239969.4481)
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
 p_id=>wwv_flow_imp.id(88183211858816924.4481)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(88183732152816924.4481)
,p_plug_template_id=>wwv_flow_imp.id(914802799655239969.4481)
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
 p_id=>wwv_flow_imp.id(914803495164240003.4481)
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
 p_id=>wwv_flow_imp.id(3373447170510516.4481)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3373993086510516.4481)
,p_plug_template_id=>wwv_flow_imp.id(914803495164240003.4481)
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
 p_id=>wwv_flow_imp.id(915210356236972585.4481)
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
 p_id=>wwv_flow_imp.id(2899946654493378.4481)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900442121493378.4481)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4481)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2900949359493378.4481)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4481)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2901467944493378.4481)
,p_plug_template_id=>wwv_flow_imp.id(915210356236972585.4481)
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
 p_id=>wwv_flow_imp.id(915371118115573423.4481)
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
 p_id=>wwv_flow_imp.id(2695578355491332.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696079816491332.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2696558276491332.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697055726491332.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2697581510491332.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698048732491333.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2698576547491333.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699004772491333.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2699557295491333.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700035673491333.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2700500589491333.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701097053491333.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2701554382491334.4481)
,p_plug_template_id=>wwv_flow_imp.id(915371118115573423.4481)
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
 p_id=>wwv_flow_imp.id(1274355059486017828.4481)
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
 p_id=>wwv_flow_imp.id(61232728057733462.4481)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4481)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(61233207886733462.4481)
,p_plug_template_id=>wwv_flow_imp.id(1274355059486017828.4481)
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
 p_id=>wwv_flow_imp.id(514332014414430986.4481)
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
 p_id=>wwv_flow_imp.id(514332292784430987.4481)
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
 p_id=>wwv_flow_imp.id(860563697365629462.4481)
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
 p_id=>wwv_flow_imp.id(865273508717512144.4481)
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
 p_id=>wwv_flow_imp.id(908020362212234651.4481)
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
 p_id=>wwv_flow_imp.id(914818080687341593.4481)
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
 p_id=>wwv_flow_imp.id(851049711466639395.4481)
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
 p_id=>wwv_flow_imp.id(851054516889639461.4481)
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
 p_id=>wwv_flow_imp.id(851055225644639463.4481)
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
 p_id=>wwv_flow_imp.id(851056531929639482.4481)
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
 p_id=>wwv_flow_imp.id(914792024808213039.4481)
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
 p_id=>wwv_flow_imp.id(914792322768213043.4481)
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
 p_id=>wwv_flow_imp.id(915377874236666939.4481)
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
 p_id=>wwv_flow_imp.id(1041941432531249038.4481)
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
 p_id=>wwv_flow_imp.id(850683711614406253.4481)
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
 p_id=>wwv_flow_imp.id(851047536471633848.4481)
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
 p_id=>wwv_flow_imp.id(851047676005633854.4481)
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
 p_id=>wwv_flow_imp.id(851047684809633856.4481)
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
 p_id=>wwv_flow_imp.id(851047795461633856.4481)
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
 p_id=>wwv_flow_imp.id(860542631889572088.4481)
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
 p_id=>wwv_flow_imp.id(1321751941832424103.4481)
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
 p_id=>wwv_flow_imp.id(514333590213433126.4481)
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
 p_id=>wwv_flow_imp.id(649611704621764507.4481)
,p_page_name=>'winlov'
,p_page_title=>unistr('Dijalo\0161ki okvir za pretra\017Eivanje')
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
,p_find_button_text=>unistr('Pretra\017Eivanje')
,p_find_button_attr=>'class="a-Button a-Button--hot a-Button--padLeft"'
,p_close_button_text=>'Zatvori'
,p_close_button_attr=>'class="a-Button u-pullRight"'
,p_next_button_text=>unistr('Sljede\0107e &gt;')
,p_next_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_prev_button_text=>'&lt; Prethodno'
,p_prev_button_attr=>'class="a-Button a-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_height=>'480'
,p_result_row_x_of_y=>'<div class="a-PopupLOV-pagination">Redci #FIRST_ROW# - #LAST_ROW#</div>'
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
 p_id=>wwv_flow_imp.id(649611609668764506.4481)
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
 p_id=>wwv_flow_imp.id(182005134783173294.4481)
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
 p_id=>wwv_flow_imp.id(666074212329754757.4481)
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
 p_id=>wwv_flow_imp.id(666074525535755551.4481)
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
 p_id=>wwv_flow_imp.id(717250289307903026.4481)
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
 p_id=>wwv_flow_imp.id(2336377640986141.4481)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(806925000765340952.4481)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380142596819918.4481)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808380828683819918.4481)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808381542095819918.4481)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(808383088145819924.4481)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850406791580718389.4481)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407096779718396.4481)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(850407509193718398.4481)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_theme_id=>3
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(851051045625639457.4481)
,p_theme_id=>3
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856113214217058023.4481)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856114568019058024.4481)
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
 p_id=>wwv_flow_imp.id(856114830529058024.4481)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856115135223058024.4481)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116214022058024.4481)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116523282058024.4481)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856116798725058025.4481)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117102944058028.4481)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117454663058028.4481)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856117908453058029.4481)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856118261810058029.4481)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206461450521195.4481)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(856206736628521198.4481)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860570508910721307.4481)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(860571060920721309.4481)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(908020718209234676.4481)
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
 p_id=>wwv_flow_imp.id(1487577187426769.4481)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4481)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4481)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336635141996782.4481)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4481)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2336917964996782.4481)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4481)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337368425996782.4481)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4481)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2337706283996782.4481)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4481)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338144805996782.4481)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4481)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2338562059996782.4481)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2336377640986141.4481)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134384175764258.4481)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134654971764258.4481)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857134823880764258.4481)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135009020764258.4481)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135269851764258.4481)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(856117102944058028.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135477215764258.4481)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(856117454663058028.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135634744764258.4481)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857135785730764258.4481)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136068296764258.4481)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(856115135223058024.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136225140764258.4481)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(856118261810058029.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136360666764258.4481)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136507481764259.4481)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(856116798725058025.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136620486764259.4481)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857136861925764259.4481)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137023291764259.4481)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137193234764259.4481)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(856116523282058024.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137470293764259.4481)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(856114568019058024.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137586003764259.4481)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(856116214022058024.4481)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137737661764259.4481)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857137933035764259.4481)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138175863764259.4481)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(856114830529058024.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138340877764259.4481)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138553321764259.4481)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138777457764259.4481)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857138891974764260.4481)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139153872764260.4481)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857139375337764260.4481)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(856113214217058023.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145206107768768.4481)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145328630768768.4481)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145505007768768.4481)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145725778768768.4481)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857145892117768768.4481)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146085228768768.4481)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146322225768769.4481)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146393064768769.4481)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857146615368768769.4481)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(856206049762521193.4481)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(856206461450521195.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147042367768771.4481)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147189725768771.4481)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147385795768771.4481)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147655668768771.4481)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147872948768771.4481)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857147976018768771.4481)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148162424768771.4481)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857148341454768771.4481)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(850406444708718383.4481)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4481)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149438708768778.4481)
,p_theme_id=>3
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149614105768778.4481)
,p_theme_id=>3
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149843563768778.4481)
,p_theme_id=>3
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857149998210768778.4481)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150194417768778.4481)
,p_theme_id=>3
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150439507768778.4481)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150608654768780.4481)
,p_theme_id=>3
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857150792333768780.4481)
,p_theme_id=>3
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(851051045625639457.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151008734768780.4481)
,p_theme_id=>3
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151259777768780.4481)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151408063768780.4481)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151643103768780.4481)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(857151861194768780.4481)
,p_theme_id=>3
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851049711466639395.4481)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(851050160062639437.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798730495581814.4481)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4481)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896798963380581814.4481)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4481)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799089194581814.4481)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4481)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799349986581814.4481)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4481)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799577541581814.4481)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4481)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799637215581814.4481)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4481)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(896799807498581814.4481)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851056531929639482.4481)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022191342234716.4481)
,p_theme_id=>3
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4481)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022392217234716.4481)
,p_theme_id=>3
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4481)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022597980234716.4481)
,p_theme_id=>3
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4481)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908022867300234717.4481)
,p_theme_id=>3
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4481)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023065592234717.4481)
,p_theme_id=>3
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(908020718209234676.4481)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023131122234717.4481)
,p_theme_id=>3
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023191297234717.4481)
,p_theme_id=>3
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023315038234717.4481)
,p_theme_id=>3
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023432264234717.4481)
,p_theme_id=>3
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(908023494059234717.4481)
,p_theme_id=>3
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(908020362212234651.4481)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378094918666945.4481)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4481)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(808380142596819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378225037666947.4481)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4481)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(808380828683819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378370589666947.4481)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4481)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378467813666947.4481)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4481)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378526097666947.4481)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4481)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378615102666947.4481)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4481)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(808383088145819924.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(915378735377666947.4481)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(915377874236666939.4481)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(808381542095819918.4481)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071796325339624.4481)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4481)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1036071972285339624.4481)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(514332292784430987.4481)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1050367122398973653.4481)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(865273508717512144.4481)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1309233880682664517.4481)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(868252865986181054.4481)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(856117908453058029.4481)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1351338307429029043.4481)
,p_theme_id=>3
,p_name=>'USED_IN_DIALOG'
,p_display_name=>'Used in Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1274355059486017828.4481)
,p_css_classes=>'a-ProcessingRegion--dialog'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333722717814196.4481)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4481)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333859287814196.4481)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4481)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635333887728814196.4481)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4481)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334039640814196.4481)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4481)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334247146814196.4481)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4481)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4481)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1635334455135814196.4481)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(914818080687341593.4481)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(806925000765340952.4481)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491342397110118.4481)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4481)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491390428110118.4481)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4481)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1654491480011110118.4481)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(851055225644639463.4481)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488722406040473.4481)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664488933681040473.4481)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(850406791580718389.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489165994040473.4481)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489304869040473.4481)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489519844040473.4481)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489753255040473.4481)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664489941797040473.4481)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490153471040473.4481)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490336091040473.4481)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490377667040473.4481)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664490659850040473.4481)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(514338947870435171.4481)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664501980442158869.4481)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4481)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502160891158869.4481)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4481)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664502181188158869.4481)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915210356236972585.4481)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508367504174332.4481)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508426350174332.4481)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508588305174332.4481)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664508810521174332.4481)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(850407096779718396.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509005841174332.4481)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(860570508910721307.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509270186174332.4481)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(850407509193718398.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509448573174333.4481)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509659839174333.4481)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(860571060920721309.4481)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664509822387174334.4481)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4481)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1664510028962174334.4481)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(915371118115573423.4481)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(856206736628521198.4481)
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
 p_id=>wwv_flow_imp.id(139338628205751416)
,p_name=>'4150_COLUMN_NUMBER'
,p_message_language=>'hr'
,p_message_text=>'Stupac %0'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323286159751411)
,p_name=>'ACCESS_CONTROL_ADMIN'
,p_message_language=>'hr'
,p_message_text=>'Administrator'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323174828751411)
,p_name=>'ACCESS_CONTROL_USERNAME'
,p_message_language=>'hr'
,p_message_text=>unistr('Korisni\010Dko ime')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385846628751430)
,p_name=>'ACCESS_DENIED_SIMPLE'
,p_message_language=>'hr'
,p_message_text=>'Pristup je odbijen'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342717241751417)
,p_name=>'ACCOUNT_HAS_BEEN_CREATED'
,p_message_language=>'hr'
,p_message_text=>unistr('Stvoren je va\0161 %0 ra\010Dun.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325985834751412)
,p_name=>'ACCOUNT_LOCKED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ra\010Dun je zaklju\010Dan.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310492018751407)
,p_name=>'AM_PM'
,p_message_language=>'hr'
,p_message_text=>'AM / PM'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293251737751402)
,p_name=>'APEX.ACTIONS.ACTION_LINK'
,p_message_language=>'hr'
,p_message_text=>'veza akcije'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293127304751402)
,p_name=>'APEX.ACTIONS.DIALOG_LINK'
,p_message_language=>'hr'
,p_message_text=>unistr('veza na dijalo\0161ki okvir')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457518003751451)
,p_name=>'APEX.ACTIONS.TOGGLE'
,p_message_language=>'hr'
,p_message_text=>'Prebacivanje %0'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465355851751453)
,p_name=>'APEX.ACTIVE_STATE'
,p_message_language=>'hr'
,p_message_text=>'(Aktivno)'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270199092751396)
,p_name=>'APEX.AI.CHAT_CLEARED'
,p_message_language=>'hr'
,p_message_text=>unistr('Chat o\010Di\0161\0107en')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270051659751396)
,p_name=>'APEX.AI.CLEAR_CHAT'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Disti chat')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266603292751395)
,p_name=>'APEX.AI.CONSENT_ACCEPT'
,p_message_language=>'hr'
,p_message_text=>'Prihvati'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266733402751395)
,p_name=>'APEX.AI.CONSENT_DENY'
,p_message_language=>'hr'
,p_message_text=>'Odbaci'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266406544751395)
,p_name=>'APEX.AI.CONVERSATION_HISTORY'
,p_message_language=>'hr'
,p_message_text=>'Prethodni razgovori'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269869779751396)
,p_name=>'APEX.AI.COPIED'
,p_message_language=>'hr'
,p_message_text=>'Kopirano'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269919334751396)
,p_name=>'APEX.AI.COPIED_TO_CLIPBOARD'
,p_message_language=>'hr'
,p_message_text=>unistr('Kopirano u me\0111uspremnik')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269692886751396)
,p_name=>'APEX.AI.COPY'
,p_message_language=>'hr'
,p_message_text=>'Kopiraj'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269710210751396)
,p_name=>'APEX.AI.COPY_TO_CLIPBOARD'
,p_message_language=>'hr'
,p_message_text=>unistr('Kopiraj u me\0111uspremnik')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267107766751395)
,p_name=>'APEX.AI.DIALOG_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107nik')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267584659751395)
,p_name=>'APEX.AI.DISABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('AI je onemogu\0107en na razini radnog prostora ili instance.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306883746751406)
,p_name=>'APEX.AI.GET_SERVER_ID_OR_STATIC_ID'
,p_message_language=>'hr'
,p_message_text=>unistr('Servis Generativni AI s navedenim ID-om ili stati\010Dkim ID-om nije prona\0111en.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305507234751406)
,p_name=>'APEX.AI.HTTP_4013_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka provjere autenti\010Dnosti ili zabranjen pristup (HTTP-%1) za URL %0. Provjerite konfiguraciju servisa Generative AI Service %2.')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285343279751400)
,p_name=>'APEX.AI.HTTP_ERROR'
,p_message_language=>'hr'
,p_message_text=>'HTTP zahtjev servisu Generativni AI na %0 nije uspio uz HTTP-%1: %2'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309713134751407)
,p_name=>'APEX.AI.HTTP_FRIENDLY_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka u HTTP zahtjevu poslanom servisu Generative AI Service za dodatak %0 u na\010Dinu %1. Provjerite konfiguraciju servisa Generative AI Service.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272566176751396)
,p_name=>'APEX.AI.MAIN_QUICK_ACTIONS_ARIA_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Primjeri'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270990318751396)
,p_name=>'APEX.AI.NAME_ASSISTANT'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107nik')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272383198751396)
,p_name=>'APEX.AI.NAME_COMMA_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'%0,%1'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270872989751396)
,p_name=>'APEX.AI.NAME_USER'
,p_message_language=>'hr'
,p_message_text=>'Vi'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301547669751405)
,p_name=>'APEX.AI.OCI_CHAT_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('OCI Generative AI trenutno ne podr\017Eava iskustvo chata s vi\0161e poruka.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281436588751399)
,p_name=>'APEX.AI.PROMPT_ENRICHMENT_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi upita %0 za aplikaciju %1. Provjerite je li App Builder dostupan na ovoj instanci.')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286597206751400)
,p_name=>'APEX.AI.RESPONSE_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se obraditi odgovor za AI servis %0, odgovor %1')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292717835751402)
,p_name=>'APEX.AI.SEND_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161alji poruku')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281070041751399)
,p_name=>'APEX.AI.SERVICE_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka u pozadinskom AI servisu %0')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266820787751395)
,p_name=>'APEX.AI.TEXTAREA_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Poruka'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266910565751395)
,p_name=>'APEX.AI.TEXTAREA_PLACEHOLDER'
,p_message_language=>'hr'
,p_message_text=>'Ovdje unesite poruku'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270284508751396)
,p_name=>'APEX.AI.USER_AVATAR'
,p_message_language=>'hr'
,p_message_text=>'Korisnikov avatar'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270398790751396)
,p_name=>'APEX.AI.USE_THIS'
,p_message_language=>'hr'
,p_message_text=>'Upotrijebite to'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267077477751395)
,p_name=>'APEX.AI.WARN_UNSENT_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Imate neposlanu poruku, jeste li sigurni?'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436041081751445)
,p_name=>'APEX.AJAX_SERVER_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ajax poziv vratio je pogre\0161ku poslu\017Eitelja %0 za %1.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363196013751423)
,p_name=>'APEX.APPLICATION.ALIAS.NON_UNIQUE'
,p_message_language=>'hr'
,p_message_text=>unistr('Drugi naziv aplikacije "%0" ne mo\017Ee se pretvoriti u jedinstveni ID aplikacije.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351951143751420)
,p_name=>'APEX.APPLICATION.ALIAS.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-1816 Neo\010Dekivana pogre\0161ka pri pretvaranju drugog naziva aplikacije p_flow_alias_or_id (%0).')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449364940751448)
,p_name=>'APEX.APPLICATION.CHECKSUM.DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Kontrolni broj aplikacije omogu\0107uje jednostavan na\010Din za utvr\0111ivanje implementira li se ista aplikacija u vi\0161e radnih prostora. Usporedite taj kontrolni zbroj kako biste utvrdili postoji li podudaranje.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335912026751415)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNC.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi funkcije provjere autenti\010Dnosti.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317980697751410)
,p_name=>'APEX.AUTHENTICATION.AUTH_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi funkcije provjere autenti\010Dnosti.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489854547751460)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.HOST_PREFIX_MISMATCH'
,p_message_language=>'hr'
,p_message_text=>'Naziv klijenta %0 koji je vratio Oracle Cloud Identity Management nije odobren za domenu %1!<br/><a href="&LOGOUT_URL.">Ponovite prijavu</a> i navedite odobreni naziv klijenta ili promijenite URL.'
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314003399751409)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.USER_IS_NOT_DEVELOPER'
,p_message_language=>'hr'
,p_message_text=>unistr('Va\0161 ra\010Dun "%0" nema potrebne razvojne povlastice (DB_DEVELOPER ili DB_ADMINISTRATOR)<br/>za radni prostor "%1"! <a href="&LOGOUT_URL.">Ponovo se prijavite</a> nakon \0161to dobijete povlastice.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310609207751408)
,p_name=>'APEX.AUTHENTICATION.CLOUD_IDM.WRONG_GROUP_NAME'
,p_message_language=>'hr'
,p_message_text=>'Naziv klijenta koji je vratio Oracle Cloud Identity Management nije odobren za trenutni radni prostor!<br/><a href="&LOGOUT_URL.">Ponovite prijavu</a> i navedite odobreni naziv klijenta.'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314164038751409)
,p_name=>'APEX.AUTHENTICATION.HOST_PREFIX_MISMATCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Iz sigurnosnih razloga pokretanje aplikacija u ovom radnom prostoru preko domene u URL-u nije dopu\0161teno.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335607427751415)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.ASK_FOR_INSTALLATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Zatra\017Eite da DBA pokrene $OH/rdbms/admin/catldap.sql.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335586584751415)
,p_name=>'APEX.AUTHENTICATION.LDAP.DBMS_LDAP.MISSING'
,p_message_language=>'hr'
,p_message_text=>'SYS.DBMS_LDAP paket ne postoji ili nije valjan.'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335447379751415)
,p_name=>'APEX.AUTHENTICATION.LDAP.EDIT_USER_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi funkcije LDAP korisnika.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335777053751415)
,p_name=>'APEX.AUTHENTICATION.LDAP.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi LDAP provjere autenti\010Dnosti.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336574162751415)
,p_name=>'APEX.AUTHENTICATION.LOGIN.ILLEGAL_PAGE_ARG'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka u p_flow_page argumentu za login_page postupak.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336114697751415)
,p_name=>'APEX.AUTHENTICATION.LOGIN.INVALID_ARG'
,p_message_language=>'hr'
,p_message_text=>'p_session koji nije valjan u wwv_flow_custom_auth_std.login--p_flow_page:%0 p_session_id:%1.'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387435406751430)
,p_name=>'APEX.AUTHENTICATION.LOGIN.MALFORMED_ARGS'
,p_message_language=>'hr'
,p_message_text=>'Nepravilno oblikovan argument za wwv_flow_custom_auth_std.login--p_flow_page:p_session_id:p_entry_point:%0:%1:%2.'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336228728751415)
,p_name=>'APEX.AUTHENTICATION.LOGIN.NULL_USER'
,p_message_language=>'hr'
,p_message_text=>unistr('Korisni\010Dko ime koje je null proslije\0111eno u postupak prijave.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323062432751411)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.COUNTER'
,p_message_language=>'hr'
,p_message_text=>unistr('Za ponovnu prijavu pri\010Dekajte <span id="apex_login_throttle_sec">%0</span> s.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324370285751412)
,p_name=>'APEX.AUTHENTICATION.LOGIN_THROTTLE.ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Blokiran je poku\0161aj prijave.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385119070751430)
,p_name=>'APEX.AUTHENTICATION.NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Provjera autenti\010Dnosti "%0" nije prona\0111ena')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324828856751412)
,p_name=>'APEX.AUTHENTICATION.NO_SECURITY_GROUP_ID'
,p_message_language=>'hr'
,p_message_text=>'ID sigurnosne grupe je null.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336010148751415)
,p_name=>'APEX.AUTHENTICATION.POST_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri izvr\0161avanju procesa naknadne provjere autenti\010Dnosti.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335885878751415)
,p_name=>'APEX.AUTHENTICATION.PRE_AUTH_PROC.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi procesa pretprovjere autenti\010Dnosti.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337568787751416)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD.INSTRUCTIONS'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Otvorite URL u istom pregledniku u kojem ste inicirali zahtjev za ponovno postavljanje lozinke. Ako pritisnete URL za ponovno postavljanje lozinke i preusmjeri vas se na',
'stanicu za prijavu, ponovno inicirajte ponovno postavljanje lozinke i ostavite',
'preglednik otvoren.'))
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487338953751460)
,p_name=>'APEX.AUTHENTICATION.RESET_PASSWORD_URL'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi URL lozinke'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314367185751409)
,p_name=>'APEX.AUTHENTICATION.RM_GROUP_NOT_GRANTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Grupa potro\0161a\010Da upravitelja resursa %0 nije odobrena za %1')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314461411751409)
,p_name=>'APEX.AUTHENTICATION.RM_INFO_TO_GRANT'
,p_message_language=>'hr'
,p_message_text=>'Upotrijebite DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP za dodjelu povlastice koja nedostaje.'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349070126751419)
,p_name=>'APEX.AUTHENTICATION.SESSION_SENTRY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi sentry funkcije sesije.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349134264751419)
,p_name=>'APEX.AUTHENTICATION.SESSION_VERIFY_FUNCTION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi funkcije provjere valjanosti sesije.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349379315751419)
,p_name=>'APEX.AUTHENTICATION.SSO.ASK_FOR_INSTALLATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Zatra\017Eite od %0 administratora da konfigurira modul za jedinstvenu prijavu za Oracle Application Server.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359785340751422)
,p_name=>'APEX.AUTHENTICATION.SSO.BAD_URLC'
,p_message_language=>'hr'
,p_message_text=>unistr('SSO je vratio nedopu\0161teni %0 u %1 tokenu.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336402718751415)
,p_name=>'APEX.AUTHENTICATION.SSO.FIX_PARTNER_APP'
,p_message_language=>'hr'
,p_message_text=>unistr('Uredite shemu za provjeru autenti\010Dnosti i dodajte naziv aplikacije.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359411311751422)
,p_name=>'APEX.AUTHENTICATION.SSO.ILLEGAL_CALLER'
,p_message_language=>'hr'
,p_message_text=>unistr('Nedopu\0161teni pozivatelj %0 postupka:')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359697647751422)
,p_name=>'APEX.AUTHENTICATION.SSO.INVALID_APP_SESSION'
,p_message_language=>'hr'
,p_message_text=>'Sesija aplikacije koja nije valjana u URLC tokenu: %0'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359203732751422)
,p_name=>'APEX.AUTHENTICATION.SSO.MISSING_APP_REGISTRATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka u portal_sso_redirect: nedostaju informacije o registraciji aplikacije: %0')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349233470751419)
,p_name=>'APEX.AUTHENTICATION.SSO.PACKAGE_MISSING'
,p_message_language=>'hr'
,p_message_text=>'WWSEC_SSO_ENABLER_PRIVATE paket ne postoji ili nije valjan.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336313874751415)
,p_name=>'APEX.AUTHENTICATION.SSO.PARTNER_APP_IS_NULL'
,p_message_language=>'hr'
,p_message_text=>unistr('U shemi za provjeru autenti\010Dnosti ne mo\017Ee se prona\0107i naziv aplikacije registriranog partnera.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359384836751422)
,p_name=>'APEX.AUTHENTICATION.SSO.REGISTER_APP'
,p_message_language=>'hr'
,p_message_text=>unistr('Registrirajte ovu aplikaciju kako je opisano u instalacijskom vodi\010Du.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349469257751419)
,p_name=>'APEX.AUTHENTICATION.SSO.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi SSO provjere autenti\010Dnosti.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462727009751452)
,p_name=>'APEX.AUTHENTICATION.UNAUTHORIZED_URL'
,p_message_language=>'hr'
,p_message_text=>'Neodobreni URL:  %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348838950751419)
,p_name=>'APEX.AUTHENTICATION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi provjere autenti\010Dnosti.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314282325751409)
,p_name=>'APEX.AUTHENTICATION.WORKSPACE_NOT_ASSIGNED'
,p_message_language=>'hr'
,p_message_text=>'Radni prostor "%0" nije aktivan. Obratite se administratoru.'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314938415751409)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED'
,p_message_language=>'hr'
,p_message_text=>'%0'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324093817751411)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.APPLICATION'
,p_message_language=>'hr'
,p_message_text=>'Pristup je odbila provjera sigurnosti aplikacije'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324148932751412)
,p_name=>'APEX.AUTHORIZATION.ACCESS_DENIED.PAGE'
,p_message_language=>'hr'
,p_message_text=>'Pristup je odbila provjera sigurnosti stranice'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324203938751412)
,p_name=>'APEX.AUTHORIZATION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi odobrenja.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393354228751432)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX'
,p_message_language=>'hr'
,p_message_text=>unistr('Izra\0111eno s %0 upotrebom alata %1')
,p_version_scn=>2704924
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393453267751432)
,p_name=>'APEX.BUILT_WITH_LOVE_USING_APEX.ACCESSIBLE.LOVE'
,p_message_language=>'hr'
,p_message_text=>'ljubavlju'
,p_version_scn=>2704924
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453200163751450)
,p_name=>'APEX.CALENDAR.EVENT_DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Opis doga\0111aja')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453057037751450)
,p_name=>'APEX.CALENDAR.EVENT_END'
,p_message_language=>'hr'
,p_message_text=>unistr('Datum zavr\0161etka')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453302712751450)
,p_name=>'APEX.CALENDAR.EVENT_ID'
,p_message_language=>'hr'
,p_message_text=>unistr('ID doga\0111aja')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452910114751450)
,p_name=>'APEX.CALENDAR.EVENT_START'
,p_message_language=>'hr'
,p_message_text=>unistr('Datum po\010Detka')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453164366751450)
,p_name=>'APEX.CALENDAR.EVENT_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Naslov doga\0111aja')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295735193751403)
,p_name=>'APEX.CARD'
,p_message_language=>'hr'
,p_message_text=>'Kartica'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295944169751403)
,p_name=>'APEX.CARD.CARD_ACTION'
,p_message_language=>'hr'
,p_message_text=>'Akcija kartice'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336650509751415)
,p_name=>'APEX.CHECKBOX.VISUALLY_HIDDEN_CHECKBOX'
,p_message_language=>'hr'
,p_message_text=>'Vizualno skriveni potvrdni okvir'
,p_is_js_message=>true
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338543659751416)
,p_name=>'APEX.CHECKSUM.CONTENT_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka u sadr\017Eaju kontrolnog broja')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338495851751416)
,p_name=>'APEX.CHECKSUM.FORMAT_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka u formatu kontrolnog broja')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408306686751436)
,p_name=>'APEX.CLIPBOARD.COPIED'
,p_message_language=>'hr'
,p_message_text=>unistr('Kopirano u me\0111uspremnik.')
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407860538751436)
,p_name=>'APEX.CLIPBOARD.NOTSUP'
,p_message_language=>'hr'
,p_message_text=>unistr('Ovaj preglednik ne podr\017Eava kopiranje upotrebom gumba ili izbornika. Poku\0161ajte s Ctrl+C ili Command+C.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394009936751432)
,p_name=>'APEX.CLOSE_NOTIFICATION'
,p_message_language=>'hr'
,p_message_text=>'Zatvori'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272410632751396)
,p_name=>'APEX.CODE_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'hr'
,p_message_text=>unistr('Sadr\017Eaj Ure\0111iva\010Da koda prekora\010Duje maksimalnu dopu\0161tenu duljinu (stvarni broj znakova: %0, dopu\0161teni broj znakova: %1)')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452598818751449)
,p_name=>'APEX.COLOR_PICKER.CONTRAST'
,p_message_language=>'hr'
,p_message_text=>'Kontrast'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447044262751448)
,p_name=>'APEX.COLOR_PICKER.CURRENT'
,p_message_language=>'hr'
,p_message_text=>'Trenutno'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446900132751448)
,p_name=>'APEX.COLOR_PICKER.INITIAL'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\010Detno')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451124408751449)
,p_name=>'APEX.COLOR_PICKER.INVALID_COLOR'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# mora biti valjana boja. Primjer: %0'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313506545751408)
,p_name=>'APEX.COLOR_PICKER.MORE_PRESET_COLORS'
,p_message_language=>'hr'
,p_message_text=>unistr('Vi\0161e boja')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313677533751408)
,p_name=>'APEX.COLOR_PICKER.OPEN'
,p_message_language=>'hr'
,p_message_text=>'Otvori izbornik boje'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270774330751396)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER'
,p_message_language=>'hr'
,p_message_text=>unistr('Vodoravni alpha kliza\010D. Pomi\010Dite se pomo\0107u tipki sa strelicama.')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270496769751396)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM'
,p_message_language=>'hr'
,p_message_text=>unistr('\010Cetverosmjerni kliza\010D za spektar boja. Pomi\010Dite se pomo\0107u tipki sa strelicama.')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270551131751396)
,p_name=>'APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER'
,p_message_language=>'hr'
,p_message_text=>unistr('Okomiti kliza\010D za nijanse. Pomi\010Dite se pomo\0107u tipki sa strelicama.')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446898214751448)
,p_name=>'APEX.COLOR_PICKER.TITLE'
,p_message_language=>'hr'
,p_message_text=>'Odaberite boju'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447114978751448)
,p_name=>'APEX.COLOR_PICKER.TOGGLE_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Promijeni format boje'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485019822751459)
,p_name=>'APEX.COMBOBOX.LIST_OF_VALUES'
,p_message_language=>'hr'
,p_message_text=>'Popis vrijednosti'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485134649751459)
,p_name=>'APEX.COMBOBOX.SHOW_ALL_VALUES'
,p_message_language=>'hr'
,p_message_text=>'Otvori popis za: %0'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465463514751453)
,p_name=>'APEX.COMPLETED_STATE'
,p_message_language=>'hr'
,p_message_text=>unistr('(Dovr\0161eno)')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354364479751420)
,p_name=>'APEX.CONTACT_ADMIN'
,p_message_language=>'hr'
,p_message_text=>'Obrati se administratoru aplikacije.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369822570751425)
,p_name=>'APEX.CONTACT_ADMIN.DEBUG'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Obratite se administratoru aplikacije.',
unistr('Pojedinosti o ovom incidentu dostupne su putem ID-a ispravljanja pogre\0161ke "%0".')))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451471091751449)
,p_name=>'APEX.CORRECT_ERRORS'
,p_message_language=>'hr'
,p_message_text=>unistr('Ispravite pogre\0161ke prije spremanja.')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296719518751403)
,p_name=>'APEX.CS.ACTIVE_VALUE_CHIP'
,p_message_language=>'hr'
,p_message_text=>'%0. Pritisnite Backspace za brisanje.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394955192751433)
,p_name=>'APEX.CS.MATCHES_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111eno odgovaraju\0107ih rezultata: %0')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276827803751398)
,p_name=>'APEX.CS.MATCH_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111en 1 rezultat')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394896072751432)
,p_name=>'APEX.CS.NO_MATCHES'
,p_message_language=>'hr'
,p_message_text=>unistr('Nije prona\0111en nijedan rezultat')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271298160751396)
,p_name=>'APEX.CS.OTHERS_GROUP'
,p_message_language=>'hr'
,p_message_text=>'Ostalo'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271159878751396)
,p_name=>'APEX.CS.SELECTED_VALUES_COUNTER'
,p_message_language=>'hr'
,p_message_text=>unistr('Odabran je sljede\0107i broj vrijednosti: %0')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465959786751453)
,p_name=>'APEX.CURRENT_PROGRESS'
,p_message_language=>'hr'
,p_message_text=>unistr('Teku\0107i napredak')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451823008751449)
,p_name=>'APEX.DATA.LOAD.FILE_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>'Datoteka navedena u stavki %0 ne postoji u APEX_APPLICATION_TEMP_FILES.'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440347499751446)
,p_name=>'APEX.DATA_HAS_CHANGED'
,p_message_language=>'hr'
,p_message_text=>unistr('Trenutna verzija podataka u bazi podataka promijenila se otkad je korisnik pokrenuo proces a\017Euriranja.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409483466751437)
,p_name=>'APEX.DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'hr'
,p_message_text=>unistr('Nemoj u\010Ditati')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455775742751450)
,p_name=>'APEX.DATA_LOAD.FAILED'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka predobrade')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455585848751450)
,p_name=>'APEX.DATA_LOAD.INSERT'
,p_message_language=>'hr'
,p_message_text=>'Umetni redak'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469178403751454)
,p_name=>'APEX.DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'hr'
,p_message_text=>'Slijed: akcija'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455615168751450)
,p_name=>'APEX.DATA_LOAD.UPDATE'
,p_message_language=>'hr'
,p_message_text=>unistr('A\017Euriraj redak')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284156198751400)
,p_name=>'APEX.DATEPICKER.ACTIONS'
,p_message_language=>'hr'
,p_message_text=>'Akcije'
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311768449751408)
,p_name=>'APEX.DATEPICKER.AM_PM'
,p_message_language=>'hr'
,p_message_text=>'AM/PM'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297890810751404)
,p_name=>'APEX.DATEPICKER.BOUNDARY_ITEM_FORMAT_INVALID'
,p_message_language=>'hr'
,p_message_text=>'%0 mora biti odabir datuma ili valjani datum, primjerice %1.'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407006743751436)
,p_name=>'APEX.DATEPICKER.CLEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Disti')
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315298447751409)
,p_name=>'APEX.DATEPICKER.DONE'
,p_message_language=>'hr'
,p_message_text=>'Gotovo'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326225407751412)
,p_name=>'APEX.DATEPICKER.FORMAT_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 ima nepodr\017Eane dijelove u maski formata: %1')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311401576751408)
,p_name=>'APEX.DATEPICKER.HOUR'
,p_message_language=>'hr'
,p_message_text=>'Sat'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395329046751433)
,p_name=>'APEX.DATEPICKER.ICON_TEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sko\010Dni kalendar: %0')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311297197751408)
,p_name=>'APEX.DATEPICKER.ISO_WEEK'
,p_message_language=>'hr'
,p_message_text=>'Tjedan'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311339139751408)
,p_name=>'APEX.DATEPICKER.ISO_WEEK_ABBR'
,p_message_language=>'hr'
,p_message_text=>'Tj.'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311662707751408)
,p_name=>'APEX.DATEPICKER.MINUTES'
,p_message_language=>'hr'
,p_message_text=>'Minute'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311887285751408)
,p_name=>'APEX.DATEPICKER.MONTH'
,p_message_language=>'hr'
,p_message_text=>'Mjesec'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312289354751408)
,p_name=>'APEX.DATEPICKER.NEXT_MONTH'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i mjesec')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281801946751399)
,p_name=>'APEX.DATEPICKER.POPUP'
,p_message_language=>'hr'
,p_message_text=>unistr('Sko\010Dni prozor za %0')
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312175019751408)
,p_name=>'APEX.DATEPICKER.PREVIOUS_MONTH'
,p_message_language=>'hr'
,p_message_text=>'Prethodni mjesec'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404641617751435)
,p_name=>'APEX.DATEPICKER.READONLY_DATEPICKER'
,p_message_language=>'hr'
,p_message_text=>unistr('Odabir datuma samo za \010Ditanje')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313055421751408)
,p_name=>'APEX.DATEPICKER.SELECT_DATE'
,p_message_language=>'hr'
,p_message_text=>'Odabir datuma'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281996635751399)
,p_name=>'APEX.DATEPICKER.SELECT_DATE_AND_TIME'
,p_message_language=>'hr'
,p_message_text=>'Odabir datuma i vremena'
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279179637751398)
,p_name=>'APEX.DATEPICKER.SELECT_DAY'
,p_message_language=>'hr'
,p_message_text=>'Odaberi dan'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282595900751399)
,p_name=>'APEX.DATEPICKER.SELECT_MONTH_AND_YEAR'
,p_message_language=>'hr'
,p_message_text=>'Odaberi mjesec i godinu'
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279383255751398)
,p_name=>'APEX.DATEPICKER.SELECT_TIME'
,p_message_language=>'hr'
,p_message_text=>'Odabir vremena'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279860551751399)
,p_name=>'APEX.DATEPICKER.TODAY'
,p_message_language=>'hr'
,p_message_text=>'Danas'
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297451893751404)
,p_name=>'APEX.DATEPICKER.VALUE_INVALID'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# mora biti valjani datum, primjerice %0.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297143962751404)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_BETWEEN'
,p_message_language=>'hr'
,p_message_text=>unistr('#LABEL# mora biti izme\0111u %0 i %1.')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297256470751404)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_AFTER'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# mora biti %0 ili nakon.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297333961751404)
,p_name=>'APEX.DATEPICKER.VALUE_MUST_BE_ON_OR_BEFORE'
,p_message_language=>'hr'
,p_message_text=>'#LABEL#  mora biti %0 ili prije.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288744061751401)
,p_name=>'APEX.DATEPICKER.VISUALLY_HIDDEN_EDIT'
,p_message_language=>'hr'
,p_message_text=>unistr('Vizualno skriveno ure\0111ivanje')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312086706751408)
,p_name=>'APEX.DATEPICKER.YEAR'
,p_message_language=>'hr'
,p_message_text=>'Godina'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399007106751434)
,p_name=>'APEX.DATEPICKER_VALUE_GREATER_MAX_DATE'
,p_message_language=>'hr'
,p_message_text=>unistr('#LABEL# je ve\0107i od navedenog maksimalnog datuma %0.')
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399444710751434)
,p_name=>'APEX.DATEPICKER_VALUE_INVALID'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# ne odgovara formatu %0.'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398924455751434)
,p_name=>'APEX.DATEPICKER_VALUE_LESS_MIN_DATE'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# je manji od navedenog minimalnog datuma %0.'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399194910751434)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# nije u valjanom rasponu od %0 do %1.'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399380052751434)
,p_name=>'APEX.DATEPICKER_VALUE_NOT_IN_YEAR_RANGE'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# nije u valjanom rasponu godina od %0 do %1.'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291199784751402)
,p_name=>'APEX.DBMS_CLOUD_INT.DBMS_CLOUD_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pri obradi DBMS_CLOUD zahtjeva do\0161lo je do interne pogre\0161ke.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451765030751449)
,p_name=>'APEX.DIALOG.CANCEL'
,p_message_language=>'hr'
,p_message_text=>'Odustani'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477624630751457)
,p_name=>'APEX.DIALOG.CLOSE'
,p_message_language=>'hr'
,p_message_text=>'Zatvori'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338894357751416)
,p_name=>'APEX.DIALOG.CONFIRMATION'
,p_message_language=>'hr'
,p_message_text=>'Potvrda'
,p_is_js_message=>true
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479622584751457)
,p_name=>'APEX.DIALOG.HELP'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451583266751449)
,p_name=>'APEX.DIALOG.OK'
,p_message_language=>'hr'
,p_message_text=>'U redu'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451633399751449)
,p_name=>'APEX.DIALOG.SAVE'
,p_message_language=>'hr'
,p_message_text=>'Spremi'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319379621751410)
,p_name=>'APEX.DIALOG.TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Naslov dijalo\0161kog okvira')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359085182751422)
,p_name=>'APEX.DIALOG.VISUALLY_HIDDEN_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Vizualno skriveni naslov dijalo\0161kog okvira')
,p_is_js_message=>true
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280132525751399)
,p_name=>'APEX.DOCGEN'
,p_message_language=>'hr'
,p_message_text=>unistr('Prethodno ugra\0111ena funkcija Oracle alata za generiranje dokumenata')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290965509751402)
,p_name=>'APEX.DOCGEN.DBMS_CLOUD_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri ispisu dokumenta.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268142289751395)
,p_name=>'APEX.DOCGEN.INVALID_OUTPUT_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('%s ne podr\017Eava %1 kao izlaz.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280006100751399)
,p_name=>'APEX.DOCGEN.INVOKE_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka "%0" pri pozivanju prethodno ugra\0111ene funkcije Oracle alata za generiranje dokumenata:')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271552874751396)
,p_name=>'APEX.DOCGEN.TEMPLATE_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Predlo\017Eak je obavezan.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296995626751404)
,p_name=>'APEX.DOWNLOAD.ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka tijekom preuzimanja datoteke.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296889068751403)
,p_name=>'APEX.DOWNLOAD.NO_DATA_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Nisu prona\0111eni podaci koji se mogu preuzeti.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300478933751405)
,p_name=>'APEX.ENVIRONMENT.RUNTIME_ONLY'
,p_message_language=>'hr'
,p_message_text=>unistr('Ova zna\010Dajka nije dostupna u okru\017Eenju samo za izvr\0161avanje.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353205008751420)
,p_name=>'APEX.ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka')
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313152837751408)
,p_name=>'APEX.ERROR.CALLBACK_FAILED'
,p_message_language=>'hr'
,p_message_text=>unistr('Do\0161lo je do sljede\0107e pogre\0161ke pri izvr\0161avanju povratnog pozivanja postupanja s pogre\0161kama: %0')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325779266751412)
,p_name=>'APEX.ERROR.ERROR_PAGE.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Do\0161lo je do pogre\0161ke pri bojenju stranice pogre\0161ke: %0')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314841164751409)
,p_name=>'APEX.ERROR.INTERNAL'
,p_message_language=>'hr'
,p_message_text=>unistr('Interna pogre\0161ka')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464505834751453)
,p_name=>'APEX.ERROR.INTERNAL.CONTACT_ADMINISTRATOR'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Obratite se administratoru.',
unistr('Pojedinosti o ovom incidentu dostupne su putem ID-a ispravljanja pogre\0161ke "%0".')))
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459104245751451)
,p_name=>'APEX.ERROR.ORA-16000'
,p_message_language=>'hr'
,p_message_text=>unistr('Baza podataka otvorena je za pristup samo za \010Ditanje.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489216312751460)
,p_name=>'APEX.ERROR.ORA-28353'
,p_message_language=>'hr'
,p_message_text=>'ORA-28353: Otvaranje walleta nije uspjelo. Podaci aplikacije trenutno nisu dostupni.'
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459266248751451)
,p_name=>'APEX.ERROR.PAGE_NOT_AVAILABLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Na\017Ealost, ta stranica nije dostupna')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317872569751410)
,p_name=>'APEX.ERROR.TECHNICAL_INFO'
,p_message_language=>'hr'
,p_message_text=>unistr('Tehni\010Dke informacije (dostupne samo razvojnim programerima)')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423711746751441)
,p_name=>'APEX.ERROR_MESSAGE_HEADING'
,p_message_language=>'hr'
,p_message_text=>unistr('Poruka o pogre\0161ci')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437650624751445)
,p_name=>'APEX.EXPECTED_FORMAT'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Dekivani format: %0')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402558302751435)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.ALREADY_IN_ACL'
,p_message_language=>'hr'
,p_message_text=>unistr('Korisnik se ve\0107 nalazi na popisu za kontrolu pristupa')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402485650751435)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.CREATE_CONFIRM'
,p_message_language=>'hr'
,p_message_text=>unistr('Potvrdite dodavanje sljede\0107eg broja korisnika: %0 na popis za kontrolu pristupa <strong>%1</strong>.')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402940864751435)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.DUPLICATE_USER'
,p_message_language=>'hr'
,p_message_text=>'Postoji duplicirani korisnik'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402691089751435)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_AT_SIGN'
,p_message_language=>'hr'
,p_message_text=>unistr('U adresi e-po\0161te nedostaje znak at (@)')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402717367751435)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.MISSING_DOT'
,p_message_language=>'hr'
,p_message_text=>unistr('U adresi e-po\0161te nedostaje to\010Dka (.)')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402854483751435)
,p_name=>'APEX.FEATURE.ACL.BULK_USER.USERNAME_TOO_LONG'
,p_message_language=>'hr'
,p_message_text=>unistr('Korisni\010Dko ime preduga\010Dko')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403154448751435)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_ONLY'
,p_message_language=>'hr'
,p_message_text=>'Ovoj aplikaciji mogu pristupiti samo korisnici definirani na popisu za kontrolu pristupa aplikaciji'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403249067751435)
,p_name=>'APEX.FEATURE.ACL.INFO.ACL_VALUE_INVALID'
,p_message_language=>'hr'
,p_message_text=>unistr('Neo\010Dekivana vrijednost postavke kontrole pristupa: %0')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403004629751435)
,p_name=>'APEX.FEATURE.ACL.INFO.ALL_USERS'
,p_message_language=>'hr'
,p_message_text=>unistr('Ovoj aplikaciji mogu pristupiti svi korisnici \010Dija je autenti\010Dnost provjerena')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447585254751448)
,p_name=>'APEX.FEATURE.CONFIG.DISABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Onemogu\0107eno')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447425776751448)
,p_name=>'APEX.FEATURE.CONFIG.ENABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Omogu\0107eno')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447715918751448)
,p_name=>'APEX.FEATURE.CONFIG.IS_DISABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('%0: onemogu\0107eno')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447661223751448)
,p_name=>'APEX.FEATURE.CONFIG.IS_ENABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('%0: omogu\0107eno')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296244654751403)
,p_name=>'APEX.FEATURE.CONFIG.NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Nije podr\017Eano')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357457348751421)
,p_name=>'APEX.FEATURE.CONFIG.OFF'
,p_message_language=>'hr'
,p_message_text=>unistr('Isklju\010Deno')
,p_is_js_message=>true
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357397815751421)
,p_name=>'APEX.FEATURE.CONFIG.ON'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Deno')
,p_is_js_message=>true
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447368228751448)
,p_name=>'APEX.FEATURE.TOP_USERS.USERNAME.NOT_IDENTIFIED'
,p_message_language=>'hr'
,p_message_text=>'nije identificirano'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287887663751401)
,p_name=>'APEX.FILESIZE.BYTES'
,p_message_language=>'hr'
,p_message_text=>'%0 B'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288356162751401)
,p_name=>'APEX.FILESIZE.GB'
,p_message_language=>'hr'
,p_message_text=>'%0 GB'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288085252751401)
,p_name=>'APEX.FILESIZE.KB'
,p_message_language=>'hr'
,p_message_text=>'%0 KB'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288262953751401)
,p_name=>'APEX.FILESIZE.MB'
,p_message_language=>'hr'
,p_message_text=>'%0 MB'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440570180751446)
,p_name=>'APEX.FILE_BROWSE.DOWNLOAD_LINK_TEXT'
,p_message_language=>'hr'
,p_message_text=>'Preuzmi'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293638691751403)
,p_name=>'APEX.FS.ACTIONS_MENU_BUTTON_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Opcije'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293318019751402)
,p_name=>'APEX.FS.ACTIONS_MENU_FILTER'
,p_message_language=>'hr'
,p_message_text=>'Filtar'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293587736751403)
,p_name=>'APEX.FS.ACTIONS_MENU_HIDE'
,p_message_language=>'hr'
,p_message_text=>'Sakrij facet'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318213880751410)
,p_name=>'APEX.FS.ADD_FILTER'
,p_message_language=>'hr'
,p_message_text=>'Dodaj filtar'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394579372751432)
,p_name=>'APEX.FS.APPLIED_FACET'
,p_message_language=>'hr'
,p_message_text=>'Primijenjeni filtar %0'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318933922751410)
,p_name=>'APEX.FS.APPLY'
,p_message_language=>'hr'
,p_message_text=>'Primijeni'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438102407751445)
,p_name=>'APEX.FS.BATCH_APPLY'
,p_message_language=>'hr'
,p_message_text=>'Primijeni'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319057578751410)
,p_name=>'APEX.FS.CANCEL'
,p_message_language=>'hr'
,p_message_text=>'Odustani'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302829699751405)
,p_name=>'APEX.FS.CHART_BAR'
,p_message_language=>'hr'
,p_message_text=>'Trakasti grafikon'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450867297751449)
,p_name=>'APEX.FS.CHART_OTHERS'
,p_message_language=>'hr'
,p_message_text=>'Ostalo'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302976604751405)
,p_name=>'APEX.FS.CHART_PIE'
,p_message_language=>'hr'
,p_message_text=>'Tortni grafikon'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449411208751448)
,p_name=>'APEX.FS.CHART_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Grafikon'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302666945751405)
,p_name=>'APEX.FS.CHART_VALUE_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Broj'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438652603751445)
,p_name=>'APEX.FS.CLEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Disti')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438725292751445)
,p_name=>'APEX.FS.CLEAR_ALL'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Disti sve')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438818606751445)
,p_name=>'APEX.FS.CLEAR_VALUE'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Disti %0')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455325861751450)
,p_name=>'APEX.FS.COLUMN_UNAUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>'Stupac %1, koji referencira facet %0, nije dostupan ili nije odobren.'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266013923751394)
,p_name=>'APEX.FS.CONFIG_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Odaberite filtre za prikaz'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392500243751432)
,p_name=>'APEX.FS.COUNT_RESULTS'
,p_message_language=>'hr'
,p_message_text=>'Broj rezultata: %0'
,p_is_js_message=>true
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392635964751432)
,p_name=>'APEX.FS.COUNT_SELECTED'
,p_message_language=>'hr'
,p_message_text=>'Odabrano: %0'
,p_is_js_message=>true
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395462267751433)
,p_name=>'APEX.FS.CUR_FILTERS_LM'
,p_message_language=>'hr'
,p_message_text=>'Trenutni filtri'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271068112751396)
,p_name=>'APEX.FS.FACETED_SEARCH_NEEDS_REGION_QUERY'
,p_message_language=>'hr'
,p_message_text=>unistr('Za facetno pretra\017Eivanje obavezan je izvor podataka na razini regije.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274784971751397)
,p_name=>'APEX.FS.FACETS_LIST'
,p_message_language=>'hr'
,p_message_text=>'Popis filtara'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453885935751450)
,p_name=>'APEX.FS.FACET_VALUE_LIMIT_EXCEEDED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ograni\010Denje zasebne vrijednosti (%0) prekora\010Deno za facet %1.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440191913751446)
,p_name=>'APEX.FS.FC_TYPE_UNSUPPORTED_FOR_DATE_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>unistr('Facet %0 nije podr\017Ean za stupce DATE ili TIMESTAMP.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438216931751445)
,p_name=>'APEX.FS.FILTER'
,p_message_language=>'hr'
,p_message_text=>'Filtar %0'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312881645751408)
,p_name=>'APEX.FS.FILTER_APPLIED'
,p_message_language=>'hr'
,p_message_text=>'%0 (primijenjen filtar)'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438327051751445)
,p_name=>'APEX.FS.GO'
,p_message_language=>'hr'
,p_message_text=>'Idi'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308338836751407)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_C'
,p_message_language=>'hr'
,p_message_text=>unistr('sadr\017Ei %0')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439702448751446)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_EQ'
,p_message_language=>'hr'
,p_message_text=>'jednako %0'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308015373751407)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GT'
,p_message_language=>'hr'
,p_message_text=>unistr('ve\0107e od %0')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308138242751407)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_GTE'
,p_message_language=>'hr'
,p_message_text=>unistr('ve\0107e od ili jednako %0')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307738461751407)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LT'
,p_message_language=>'hr'
,p_message_text=>'manje od %0'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307996365751407)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_LTE'
,p_message_language=>'hr'
,p_message_text=>'manje od ili jednako %0'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307247250751407)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NC'
,p_message_language=>'hr'
,p_message_text=>unistr('ne sadr\017Ei %0')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293053022751402)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NEQ'
,p_message_language=>'hr'
,p_message_text=>'nije jednako %0'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307329913751407)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_NSTARTS'
,p_message_language=>'hr'
,p_message_text=>unistr('ne zapo\010Dinje s %0')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308240467751407)
,p_name=>'APEX.FS.INPUT_CURRENT_LABEL_STARTS'
,p_message_language=>'hr'
,p_message_text=>unistr('zapo\010Dinje s %0')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306360954751406)
,p_name=>'APEX.FS.INPUT_FACET_SELECTOR'
,p_message_language=>'hr'
,p_message_text=>'Odabir faceta'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282156196751399)
,p_name=>'APEX.FS.INPUT_INVALID_FILTER_PREFIX'
,p_message_language=>'hr'
,p_message_text=>'Prefiks filtra "%0" nije valjan za facet "%1".'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280573878751399)
,p_name=>'APEX.FS.INPUT_MISSING_FILTER_PREFIX'
,p_message_language=>'hr'
,p_message_text=>'Prefiks filtra nedostaje za facet "%0".'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314764650751409)
,p_name=>'APEX.FS.INPUT_OPERATOR'
,p_message_language=>'hr'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296610859751403)
,p_name=>'APEX.FS.INPUT_OPERATOR.C'
,p_message_language=>'hr'
,p_message_text=>unistr('sadr\017Ei')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295693905751403)
,p_name=>'APEX.FS.INPUT_OPERATOR.EQ'
,p_message_language=>'hr'
,p_message_text=>'jednako'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296344085751403)
,p_name=>'APEX.FS.INPUT_OPERATOR.GT'
,p_message_language=>'hr'
,p_message_text=>unistr('ve\0107e od')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296430051751403)
,p_name=>'APEX.FS.INPUT_OPERATOR.GTE'
,p_message_language=>'hr'
,p_message_text=>unistr('ve\0107e ili jednako')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296076945751403)
,p_name=>'APEX.FS.INPUT_OPERATOR.LT'
,p_message_language=>'hr'
,p_message_text=>'manje od'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296167408751403)
,p_name=>'APEX.FS.INPUT_OPERATOR.LTE'
,p_message_language=>'hr'
,p_message_text=>'manje od ili jednako '
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307159294751407)
,p_name=>'APEX.FS.INPUT_OPERATOR.NC'
,p_message_language=>'hr'
,p_message_text=>unistr('ne sadr\017Ei')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295850802751403)
,p_name=>'APEX.FS.INPUT_OPERATOR.NEQ'
,p_message_language=>'hr'
,p_message_text=>'nije jednako'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307050556751407)
,p_name=>'APEX.FS.INPUT_OPERATOR.NSTARTS'
,p_message_language=>'hr'
,p_message_text=>unistr('ne po\010Dinje s')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139296507008751403)
,p_name=>'APEX.FS.INPUT_OPERATOR.STARTS'
,p_message_language=>'hr'
,p_message_text=>unistr('zapo\010Dinje s')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315133283751409)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta podataka %0 (%1) nije podr\017Eana za facet polja unosa.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282062872751399)
,p_name=>'APEX.FS.INPUT_UNSUPPORTED_FILTER_FOR_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Filtar "%0" nije podr\017Ean za facet "%1" (vrsta podataka %2).')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314602206751409)
,p_name=>'APEX.FS.INPUT_VALUE'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439918356751446)
,p_name=>'APEX.FS.NO_SEARCH_COLUMNS_PROVIDED'
,p_message_language=>'hr'
,p_message_text=>unistr('Stupci pretra\017Eivanja nisu navedeni za facet %0')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266185773751395)
,p_name=>'APEX.FS.OPEN_CONFIG'
,p_message_language=>'hr'
,p_message_text=>unistr('Vi\0161e filtara')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392761300751432)
,p_name=>'APEX.FS.RANGE_BEGIN'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\010Detak raspona')
,p_is_js_message=>true
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439474888751446)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL'
,p_message_language=>'hr'
,p_message_text=>'%0 do %1'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439588179751446)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_HI'
,p_message_language=>'hr'
,p_message_text=>'Iznad %0'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439693718751446)
,p_name=>'APEX.FS.RANGE_CURRENT_LABEL_OPEN_LO'
,p_message_language=>'hr'
,p_message_text=>'Ispod %0'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392811011751432)
,p_name=>'APEX.FS.RANGE_END'
,p_message_language=>'hr'
,p_message_text=>'Kraj raspona'
,p_is_js_message=>true
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457419694751451)
,p_name=>'APEX.FS.RANGE_LOV_ITEM_INVALID'
,p_message_language=>'hr'
,p_message_text=>'Stavka popisa vrijednosti #%2 ("%1") za facet raspona %0 nije valjana (nedostaje razdjelnik "|").'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439898928751446)
,p_name=>'APEX.FS.RANGE_MANUAL_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ru\010Dni unos za facet raspona %0 trenutno nije podr\017Ean jer je stupac DATE ili TIMESTAMP.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439102875751445)
,p_name=>'APEX.FS.RANGE_TEXT'
,p_message_language=>'hr'
,p_message_text=>'do'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302704275751405)
,p_name=>'APEX.FS.REMOVE_CHART'
,p_message_language=>'hr'
,p_message_text=>'Ukloni grafikon'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389180831751431)
,p_name=>'APEX.FS.RESET'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438508115751445)
,p_name=>'APEX.FS.SEARCH_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438404457751445)
,p_name=>'APEX.FS.SEARCH_PLACEHOLDER'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje...')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439337167751446)
,p_name=>'APEX.FS.SELECT_PLACEHOLDER'
,p_message_language=>'hr'
,p_message_text=>'- Odabir -'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302519021751405)
,p_name=>'APEX.FS.SHOW_CHART'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei grafikon')
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438950754751445)
,p_name=>'APEX.FS.SHOW_LESS'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei manje')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439015502751445)
,p_name=>'APEX.FS.SHOW_MORE'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei sve')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139439242465751446)
,p_name=>'APEX.FS.STAR_RATING_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i broj zvjezdica: %0 i vi\0161e')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394442149751432)
,p_name=>'APEX.FS.SUGGESTIONS'
,p_message_language=>'hr'
,p_message_text=>'Prijedlozi filtra'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440062563751446)
,p_name=>'APEX.FS.TEXT_FIELD_ONLY_FOR_NUMBER_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>unistr('Facet tekstnog polja %0 trenutno je samo podr\017Ean za stupce NUMBER.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265576891751394)
,p_name=>'APEX.FS.TOTAL_ROW_COUNT_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Ukupni broj redaka'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455468066751450)
,p_name=>'APEX.FS.UNSUPPORTED_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta podataka %0 (%1) nije podr\017Eana za facetno pretra\017Eivanje.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385638803751430)
,p_name=>'APEX.FS.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'hr'
,p_message_text=>'Vizualno skriveno zaglavlje'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447961592751448)
,p_name=>'APEX.GO_TO_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Idi na pogre\0161ku')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403953467751435)
,p_name=>'APEX.GV.AGG_CONTEXT'
,p_message_language=>'hr'
,p_message_text=>'Agregiranje.'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331833403751414)
,p_name=>'APEX.GV.BLANK_HEADING'
,p_message_language=>'hr'
,p_message_text=>'Prazno zaglavlje'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413261200751438)
,p_name=>'APEX.GV.BREAK_COLLAPSE'
,p_message_language=>'hr'
,p_message_text=>unistr('Sa\017Emi kontrolno razdvajanje')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404083102751435)
,p_name=>'APEX.GV.BREAK_CONTEXT'
,p_message_language=>'hr'
,p_message_text=>'Kontrolno razdvajanje.'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413126060751438)
,p_name=>'APEX.GV.BREAK_EXPAND'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161iri kontrolno razdvajanje')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412964337751438)
,p_name=>'APEX.GV.DELETED_COUNT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbrisan sljede\0107i broj redaka: %0')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482063757751458)
,p_name=>'APEX.GV.DUP_REC_ID'
,p_message_language=>'hr'
,p_message_text=>'Duplicirani identitet'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274919062751397)
,p_name=>'APEX.GV.ENTER_EDIT_MODE'
,p_message_language=>'hr'
,p_message_text=>unistr('Ulazak u na\010Din ure\0111ivanja')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400836353751434)
,p_name=>'APEX.GV.FIRST_PAGE'
,p_message_language=>'hr'
,p_message_text=>'Prvo'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273724254751397)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.HIDE_DIALOG'
,p_message_language=>'hr'
,p_message_text=>unistr('Sakrij dijalo\0161ki okvir')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272714085751396)
,p_name=>'APEX.GV.FLOATING_ITEM.DIALOG.TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Plutaju\0107i sadr\017Eaj \0107elije prekora\010Denja')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274003605751397)
,p_name=>'APEX.GV.FLOATING_ITEM.SHOW_DIALOG'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei sadr\017Eaj prekora\010Denja')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348251698751419)
,p_name=>'APEX.GV.FOOTER_LANDMARK'
,p_message_language=>'hr'
,p_message_text=>unistr('Podno\017Eje re\0161etke')
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404207966751435)
,p_name=>'APEX.GV.GROUP_CONTEXT'
,p_message_language=>'hr'
,p_message_text=>'Zaglavlje grupe'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404174619751435)
,p_name=>'APEX.GV.HEADER_CONTEXT'
,p_message_language=>'hr'
,p_message_text=>'Zaglavlje.'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400931871751434)
,p_name=>'APEX.GV.LAST_PAGE'
,p_message_language=>'hr'
,p_message_text=>'Zadnje'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275189478751397)
,p_name=>'APEX.GV.LEAVE_EDIT_MODE'
,p_message_language=>'hr'
,p_message_text=>unistr('Izlazak iz na\010Dina ure\0111ivanja')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299840824751404)
,p_name=>'APEX.GV.LOAD_ALL'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditaj sve')
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422753137751441)
,p_name=>'APEX.GV.LOAD_MORE'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei vi\0161e')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400675185751434)
,p_name=>'APEX.GV.NEXT_PAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404386061751435)
,p_name=>'APEX.GV.PAGE_RANGE'
,p_message_language=>'hr'
,p_message_text=>'Redci na stranici'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313417702751408)
,p_name=>'APEX.GV.PAGE_RANGE_ENTITY'
,p_message_language=>'hr'
,p_message_text=>'Stranica %0'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401082617751434)
,p_name=>'APEX.GV.PAGE_RANGE_XY'
,p_message_language=>'hr'
,p_message_text=>'%0 - %1'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401160537751434)
,p_name=>'APEX.GV.PAGE_RANGE_XYZ'
,p_message_language=>'hr'
,p_message_text=>'%0 - %1 od %2'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458007290751451)
,p_name=>'APEX.GV.PAGE_SELECTION'
,p_message_language=>'hr'
,p_message_text=>'Odabir stranica'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348595461751419)
,p_name=>'APEX.GV.PAGINATION_LANDMARK'
,p_message_language=>'hr'
,p_message_text=>'Paginacija'
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400722821751434)
,p_name=>'APEX.GV.PREV_PAGE'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298731731751404)
,p_name=>'APEX.GV.RANGE_DISPLAY'
,p_message_language=>'hr'
,p_message_text=>'Prikaz raspona'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332191097751414)
,p_name=>'APEX.GV.ROWS_SELECTION'
,p_message_language=>'hr'
,p_message_text=>'Odabir redaka'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481849978751458)
,p_name=>'APEX.GV.ROW_ADDED'
,p_message_language=>'hr'
,p_message_text=>'Dodano'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481920879751458)
,p_name=>'APEX.GV.ROW_CHANGED'
,p_message_language=>'hr'
,p_message_text=>'Promijenjeno'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490264845751461)
,p_name=>'APEX.GV.ROW_COLUMN_CONTEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Slijed retka re\0161etke %0, stupac %1.')
,p_is_js_message=>true
,p_version_scn=>2704939
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490385870751461)
,p_name=>'APEX.GV.ROW_CONTEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Slijed retka re\0161etke %0.')
,p_is_js_message=>true
,p_version_scn=>2704939
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481725454751458)
,p_name=>'APEX.GV.ROW_DELETED'
,p_message_language=>'hr'
,p_message_text=>'Izbrisano'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404588758751435)
,p_name=>'APEX.GV.ROW_HEADER'
,p_message_language=>'hr'
,p_message_text=>'Zaglavlje retka'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332031307751414)
,p_name=>'APEX.GV.ROW_SELECTION'
,p_message_language=>'hr'
,p_message_text=>'Odabir redaka'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299963778751404)
,p_name=>'APEX.GV.SELECTED_ENTITY_COUNT'
,p_message_language=>'hr'
,p_message_text=>'%0 %1 odabrano'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400058062751434)
,p_name=>'APEX.GV.SELECTION_CELL_COUNT'
,p_message_language=>'hr'
,p_message_text=>unistr('Odabran sljede\0107i broj \0107elija: %0')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401261086751434)
,p_name=>'APEX.GV.SELECTION_COUNT'
,p_message_language=>'hr'
,p_message_text=>unistr('Odabran sljede\0107i broj redaka: %0')
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443354394751447)
,p_name=>'APEX.GV.SELECT_ALL'
,p_message_language=>'hr'
,p_message_text=>'Odaberi sve'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336811937751415)
,p_name=>'APEX.GV.SELECT_ALL_ROWS'
,p_message_language=>'hr'
,p_message_text=>'Odabir svih redaka'
,p_is_js_message=>true
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413082990751438)
,p_name=>'APEX.GV.SELECT_PAGE_N'
,p_message_language=>'hr'
,p_message_text=>'Stranica %0'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404408344751435)
,p_name=>'APEX.GV.SELECT_ROW'
,p_message_language=>'hr'
,p_message_text=>'Odaberi redak'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404798486751435)
,p_name=>'APEX.GV.SORTED_ASCENDING'
,p_message_language=>'hr'
,p_message_text=>'Uzlazno sortirano %0'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404822007751435)
,p_name=>'APEX.GV.SORTED_DESCENDING'
,p_message_language=>'hr'
,p_message_text=>'Silazno sortirano %0'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400196670751434)
,p_name=>'APEX.GV.SORT_ASCENDING'
,p_message_language=>'hr'
,p_message_text=>'Uzlazno sortiranje'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400444833751434)
,p_name=>'APEX.GV.SORT_ASCENDING_ORDER'
,p_message_language=>'hr'
,p_message_text=>'Uzlazno sortiranje %0'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400246496751434)
,p_name=>'APEX.GV.SORT_DESCENDING'
,p_message_language=>'hr'
,p_message_text=>'Silazno sortiranje'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400590254751434)
,p_name=>'APEX.GV.SORT_DESCENDING_ORDER'
,p_message_language=>'hr'
,p_message_text=>'Silazno sortiranje %0'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139400358077751434)
,p_name=>'APEX.GV.SORT_OFF'
,p_message_language=>'hr'
,p_message_text=>'Nemoj sortirati'
,p_is_js_message=>true
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265982842751394)
,p_name=>'APEX.GV.SORT_OPTIONS'
,p_message_language=>'hr'
,p_message_text=>'Opcije za sortiranje'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348315165751419)
,p_name=>'APEX.GV.STATE_ICONS_LANDMARK'
,p_message_language=>'hr'
,p_message_text=>'Ikone stanja'
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348440669751419)
,p_name=>'APEX.GV.STATUS_LANDMARK'
,p_message_language=>'hr'
,p_message_text=>unistr('Status re\0161etke')
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278251087751398)
,p_name=>'APEX.GV.TOTAL_ENTITY_PLURAL'
,p_message_language=>'hr'
,p_message_text=>'%0 %1'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277975824751398)
,p_name=>'APEX.GV.TOTAL_ENTITY_SINGULAR'
,p_message_language=>'hr'
,p_message_text=>'1 %0'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412862994751438)
,p_name=>'APEX.GV.TOTAL_PAGES'
,p_message_language=>'hr'
,p_message_text=>'Ukupno %0'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331665148751414)
,p_name=>'APEX.HTTP.REQUEST_FAILED'
,p_message_language=>'hr'
,p_message_text=>'HTTP zahtjev za "%0" nije uspio.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333262376751414)
,p_name=>'APEX.ICON_LIST.COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Stupac %0'
,p_is_js_message=>true
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333455127751414)
,p_name=>'APEX.ICON_LIST.COLUMN_AND_ROW'
,p_message_language=>'hr'
,p_message_text=>'Stupac %0 i redak %1'
,p_is_js_message=>true
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333764097751414)
,p_name=>'APEX.ICON_LIST.FIRST_COLUMN'
,p_message_language=>'hr'
,p_message_text=>unistr('Ve\0107 je na prvom stupcu. Stupac %0 i redak %1')
,p_is_js_message=>true
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333634860751414)
,p_name=>'APEX.ICON_LIST.FIRST_ROW'
,p_message_language=>'hr'
,p_message_text=>unistr('Ve\0107 je na prvom retku. Stupac %0 i redak %1')
,p_is_js_message=>true
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479287122751457)
,p_name=>'APEX.ICON_LIST.GRID_DIM'
,p_message_language=>'hr'
,p_message_text=>unistr('Prikazano u sljede\0107em broju stupaca: %0 i redaka: %1')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333801875751414)
,p_name=>'APEX.ICON_LIST.LAST_COLUMN'
,p_message_language=>'hr'
,p_message_text=>unistr('Ve\0107 je na zadnjem stupcu. Stupac %0 i redak %1')
,p_is_js_message=>true
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333527672751414)
,p_name=>'APEX.ICON_LIST.LAST_ROW'
,p_message_language=>'hr'
,p_message_text=>unistr('Ve\0107 je na zadnjem retku. Stupac %0 i redak %1')
,p_is_js_message=>true
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412791004751438)
,p_name=>'APEX.ICON_LIST.LIST_DIM'
,p_message_language=>'hr'
,p_message_text=>unistr('Prikazano u sljede\0107em broju redaka: %0')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333352197751414)
,p_name=>'APEX.ICON_LIST.ROW'
,p_message_language=>'hr'
,p_message_text=>'Redak %0'
,p_is_js_message=>true
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490077053751461)
,p_name=>'APEX.IG.ACC_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Interaktivna re\0161etka %0')
,p_version_scn=>2704939
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397126017751433)
,p_name=>'APEX.IG.ACTIONS'
,p_message_language=>'hr'
,p_message_text=>'Akcije'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398150749751433)
,p_name=>'APEX.IG.ADD'
,p_message_language=>'hr'
,p_message_text=>'Dodaj'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398058781751433)
,p_name=>'APEX.IG.ADD_ROW'
,p_message_language=>'hr'
,p_message_text=>'Dodaj redak'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483688836751459)
,p_name=>'APEX.IG.AGGREGATE'
,p_message_language=>'hr'
,p_message_text=>'Agregiranje'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469274667751454)
,p_name=>'APEX.IG.AGGREGATION'
,p_message_language=>'hr'
,p_message_text=>'Agregiranje'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470964081751455)
,p_name=>'APEX.IG.ALL'
,p_message_language=>'hr'
,p_message_text=>'Sve'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428541355751442)
,p_name=>'APEX.IG.ALL_TEXT_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Svi stupci s tekstom'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429729004751443)
,p_name=>'APEX.IG.ALTERNATIVE'
,p_message_language=>'hr'
,p_message_text=>'Alternativno'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430894762751443)
,p_name=>'APEX.IG.AND'
,p_message_language=>'hr'
,p_message_text=>'i'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450238583751449)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT'
,p_message_language=>'hr'
,p_message_text=>unistr('Pribli\017Ean broj razli\010Ditih')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484602521751459)
,p_name=>'APEX.IG.APPROX_COUNT_DISTINCT_OVERALL'
,p_message_language=>'hr'
,p_message_text=>unistr('Ukupni pribli\017Ean broj razli\010Ditih')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467882470751454)
,p_name=>'APEX.IG.AREA'
,p_message_language=>'hr'
,p_message_text=>unistr('Podru\010Dje')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469799057751454)
,p_name=>'APEX.IG.ASCENDING'
,p_message_language=>'hr'
,p_message_text=>'Uzlazno'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429873536751443)
,p_name=>'APEX.IG.AUTHORIZATION'
,p_message_language=>'hr'
,p_message_text=>'Odobrenje'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483713749751459)
,p_name=>'APEX.IG.AUTO'
,p_message_language=>'hr'
,p_message_text=>'Automatski'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450608108751449)
,p_name=>'APEX.IG.AVG'
,p_message_language=>'hr'
,p_message_text=>'Prosjek'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484393293751459)
,p_name=>'APEX.IG.AVG_OVERALL'
,p_message_language=>'hr'
,p_message_text=>'Ukupni prosjek'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467386442751454)
,p_name=>'APEX.IG.AXIS_LABEL_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Naslov osi oznake'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467515704751454)
,p_name=>'APEX.IG.AXIS_VALUE_DECIMAL'
,p_message_language=>'hr'
,p_message_text=>'Decimalna mjesta'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467473445751454)
,p_name=>'APEX.IG.AXIS_VALUE_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Naslov osi vrijednosti'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473580100751456)
,p_name=>'APEX.IG.BACKGROUND_COLOR'
,p_message_language=>'hr'
,p_message_text=>'Boja pozadine'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467937061751454)
,p_name=>'APEX.IG.BAR'
,p_message_language=>'hr'
,p_message_text=>'Trakasti'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425155479751441)
,p_name=>'APEX.IG.BETWEEN'
,p_message_language=>'hr'
,p_message_text=>unistr('izme\0111u')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474705418751456)
,p_name=>'APEX.IG.BOTH'
,p_message_language=>'hr'
,p_message_text=>'Oboje'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468033428751454)
,p_name=>'APEX.IG.BUBBLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Mjehuri\0107asti')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398313968751434)
,p_name=>'APEX.IG.CANCEL'
,p_message_language=>'hr'
,p_message_text=>'Odustani'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430754492751443)
,p_name=>'APEX.IG.CASE_SENSITIVE'
,p_message_language=>'hr'
,p_message_text=>'Razlikovanje malih i velikih slova'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485264158751459)
,p_name=>'APEX.IG.CASE_SENSITIVE_WITH_BRACKETS'
,p_message_language=>'hr'
,p_message_text=>'(razlikovanje malih i velikih slova)'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456596269751451)
,p_name=>'APEX.IG.CHANGES_SAVED'
,p_message_language=>'hr'
,p_message_text=>'Promjene su spremljene'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398785209751434)
,p_name=>'APEX.IG.CHANGE_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Promjena prikaza'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431896403751443)
,p_name=>'APEX.IG.CHART'
,p_message_language=>'hr'
,p_message_text=>'Grafikon'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428322956751442)
,p_name=>'APEX.IG.CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'hr'
,p_message_text=>unistr('Upit prekora\010Duje sljede\0107i maksimalni broj podatkovnih to\010Daka po grafikonu: %0. Primijenite filtar kako biste smanjili broj zapisa u osnovnom upitu.')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397050727751433)
,p_name=>'APEX.IG.CHART_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Prikaz grafikona'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405490741751436)
,p_name=>'APEX.IG.CLEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Disti')
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466896980751454)
,p_name=>'APEX.IG.CLOSE_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Zatvori'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473782396751456)
,p_name=>'APEX.IG.COLORS'
,p_message_language=>'hr'
,p_message_text=>'Boje'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451019716751449)
,p_name=>'APEX.IG.COLOR_PREVIEW'
,p_message_language=>'hr'
,p_message_text=>'Pregled'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430177036751443)
,p_name=>'APEX.IG.COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Stupac'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397233907751433)
,p_name=>'APEX.IG.COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Stupci'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359125099751422)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS'
,p_message_language=>'hr'
,p_message_text=>'Akcije stupca'
,p_is_js_message=>true
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358915853751422)
,p_name=>'APEX.IG.COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'hr'
,p_message_text=>'Akcije za stupac "%0"'
,p_is_js_message=>true
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475531047751456)
,p_name=>'APEX.IG.COLUMN_TYPE'
,p_message_language=>'hr'
,p_message_text=>'Svrha stupca'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430266869751443)
,p_name=>'APEX.IG.COMPLEX'
,p_message_language=>'hr'
,p_message_text=>unistr('Slo\017Eeno')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397497881751433)
,p_name=>'APEX.IG.COMPUTE'
,p_message_language=>'hr'
,p_message_text=>unistr('Izra\010Dun')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425757131751442)
,p_name=>'APEX.IG.CONTAINS'
,p_message_language=>'hr'
,p_message_text=>unistr('sadr\017Ei')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432077090751443)
,p_name=>'APEX.IG.CONTROL_BREAK'
,p_message_language=>'hr'
,p_message_text=>'Kontrolno razdvajanje'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405217968751436)
,p_name=>'APEX.IG.COPY_CB'
,p_message_language=>'hr'
,p_message_text=>unistr('Kopiraj u me\0111uspremnik')
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405367182751436)
,p_name=>'APEX.IG.COPY_DOWN'
,p_message_language=>'hr'
,p_message_text=>'Kopiraj ispod'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450086484751449)
,p_name=>'APEX.IG.COUNT'
,p_message_language=>'hr'
,p_message_text=>'Broj'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450170504751449)
,p_name=>'APEX.IG.COUNT_DISTINCT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbroji razli\010Dite')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484512368751459)
,p_name=>'APEX.IG.COUNT_DISTINCT_OVERALL'
,p_message_language=>'hr'
,p_message_text=>unistr('Ukupni broj razli\010Ditih')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484430312751459)
,p_name=>'APEX.IG.COUNT_OVERALL'
,p_message_language=>'hr'
,p_message_text=>'Ukupni broj'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482154713751458)
,p_name=>'APEX.IG.CREATE_X'
,p_message_language=>'hr'
,p_message_text=>'Stvori %0'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428731007751442)
,p_name=>'APEX.IG.DATA'
,p_message_language=>'hr'
,p_message_text=>'Podaci'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475388660751456)
,p_name=>'APEX.IG.DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>'Vrsta podataka'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474944021751456)
,p_name=>'APEX.IG.DATE'
,p_message_language=>'hr'
,p_message_text=>'Datum'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456340917751451)
,p_name=>'APEX.IG.DATE_INVALID_VALUE'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost datuma nije valjana'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426426518751442)
,p_name=>'APEX.IG.DAYS'
,p_message_language=>'hr'
,p_message_text=>'dana'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429496539751443)
,p_name=>'APEX.IG.DEFAULT_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>'Zadane postavke'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429271635751443)
,p_name=>'APEX.IG.DEFAULT_TYPE'
,p_message_language=>'hr'
,p_message_text=>'Zadana vrsta'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398220544751433)
,p_name=>'APEX.IG.DELETE'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbri\0161i')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476424821751456)
,p_name=>'APEX.IG.DELETE_REPORT_CONFIRM'
,p_message_language=>'hr'
,p_message_text=>unistr('Jeste li sigurni da \017Eelite izbrisati to izvje\0161\0107e?')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433888097751444)
,p_name=>'APEX.IG.DELETE_ROW'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbri\0161i redak')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432698236751444)
,p_name=>'APEX.IG.DELETE_ROWS'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbri\0161i retke')
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469872141751454)
,p_name=>'APEX.IG.DESCENDING'
,p_message_language=>'hr'
,p_message_text=>'Silazno'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431531990751443)
,p_name=>'APEX.IG.DETAIL'
,p_message_language=>'hr'
,p_message_text=>'Pojedinosti'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396746532751433)
,p_name=>'APEX.IG.DETAIL_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Prikaz pojedinosti'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458895828751451)
,p_name=>'APEX.IG.DIRECTION'
,p_message_language=>'hr'
,p_message_text=>'Smjer'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431297206751443)
,p_name=>'APEX.IG.DISABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Onemogu\0107eno')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425845639751442)
,p_name=>'APEX.IG.DOES_NOT_CONTAIN'
,p_message_language=>'hr'
,p_message_text=>unistr('ne sadr\017Ei')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426061109751442)
,p_name=>'APEX.IG.DOES_NOT_START_WITH'
,p_message_language=>'hr'
,p_message_text=>unistr('ne po\010Dinje s')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468170702751454)
,p_name=>'APEX.IG.DONUT'
,p_message_language=>'hr'
,p_message_text=>'Prstenasti'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432217284751443)
,p_name=>'APEX.IG.DOWNLOAD'
,p_message_language=>'hr'
,p_message_text=>'Preuzmi'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322527824751411)
,p_name=>'APEX.IG.DOWNLOAD_DATA_ONLY'
,p_message_language=>'hr'
,p_message_text=>'Samo podaci'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477478157751457)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT'
,p_message_language=>'hr'
,p_message_text=>'Odabir formata'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337686637751416)
,p_name=>'APEX.IG.DOWNLOAD_FORMAT_NOT_ENABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Format preuzimanja %0 nije omogu\0107en.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470541322751455)
,p_name=>'APEX.IG.DUPLICATE_AGGREGATION'
,p_message_language=>'hr'
,p_message_text=>'Duplicirano agregiranje'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470685776751455)
,p_name=>'APEX.IG.DUPLICATE_CONTROLBREAK'
,p_message_language=>'hr'
,p_message_text=>'Duplicirano kontrolno razdvajanje'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433777545751444)
,p_name=>'APEX.IG.DUPLICATE_ROW'
,p_message_language=>'hr'
,p_message_text=>'Duplicirani redak'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432555850751444)
,p_name=>'APEX.IG.DUPLICATE_ROWS'
,p_message_language=>'hr'
,p_message_text=>'Duplicirani redci'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397829409751433)
,p_name=>'APEX.IG.EDIT'
,p_message_language=>'hr'
,p_message_text=>'Uredi'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469637571751454)
,p_name=>'APEX.IG.EDIT_CHART'
,p_message_language=>'hr'
,p_message_text=>'Uredi grafikon'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350167700751419)
,p_name=>'APEX.IG.EDIT_CONTROL'
,p_message_language=>'hr'
,p_message_text=>'Uredi %0'
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481086058751458)
,p_name=>'APEX.IG.EDIT_GROUP_BY'
,p_message_language=>'hr'
,p_message_text=>'Uredi grupiranje po'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388266708751430)
,p_name=>'APEX.IG.EDIT_MODE'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u na\010Dinu ure\0111ivanja')
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363807766751423)
,p_name=>'APEX.IG.EDIT_MODE_DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Mre\017Ea u na\010Dinu za ure\0111ivanje, poni\0161tite pritisak za prijelaz u na\010Din za pregled')
,p_is_js_message=>true
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477015319751457)
,p_name=>'APEX.IG.EMAIL_BCC'
,p_message_language=>'hr'
,p_message_text=>'Skriveni primatelji (bcc)'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477260158751457)
,p_name=>'APEX.IG.EMAIL_BODY'
,p_message_language=>'hr'
,p_message_text=>'Poruka'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476984011751457)
,p_name=>'APEX.IG.EMAIL_CC'
,p_message_language=>'hr'
,p_message_text=>'Primatelj kopije (cc)'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476665091751456)
,p_name=>'APEX.IG.EMAIL_SENT'
,p_message_language=>'hr'
,p_message_text=>unistr('Poruka e-po\0161te poslana.')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477113656751457)
,p_name=>'APEX.IG.EMAIL_SUBJECT'
,p_message_language=>'hr'
,p_message_text=>'Predmet'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476808881751457)
,p_name=>'APEX.IG.EMAIL_TO'
,p_message_language=>'hr'
,p_message_text=>'Primatelj (za)'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430932563751443)
,p_name=>'APEX.IG.ENABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Omogu\0107eno')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424102859751441)
,p_name=>'APEX.IG.EQUALS'
,p_message_language=>'hr'
,p_message_text=>'jednako'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431037523751443)
,p_name=>'APEX.IG.EXPRESSION'
,p_message_language=>'hr'
,p_message_text=>'Izraz'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476050320751456)
,p_name=>'APEX.IG.FD_TYPE'
,p_message_language=>'hr'
,p_message_text=>'Vrsta'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443211005751447)
,p_name=>'APEX.IG.FILE_PREPARED'
,p_message_language=>'hr'
,p_message_text=>unistr('Datoteka pripremljena. Preuzimanje zapo\010Dinje.')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405524246751436)
,p_name=>'APEX.IG.FILL'
,p_message_language=>'hr'
,p_message_text=>'Ispuni'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407787106751436)
,p_name=>'APEX.IG.FILL_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Ispuni odabir s'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407656616751436)
,p_name=>'APEX.IG.FILL_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Ispuni odabir'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397363389751433)
,p_name=>'APEX.IG.FILTER'
,p_message_language=>'hr'
,p_message_text=>'Filtar'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430360253751443)
,p_name=>'APEX.IG.FILTERS'
,p_message_language=>'hr'
,p_message_text=>'Filtri'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484060803751459)
,p_name=>'APEX.IG.FILTER_WITH_DOTS'
,p_message_language=>'hr'
,p_message_text=>'Filtriranje...'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470071496751455)
,p_name=>'APEX.IG.FIRST'
,p_message_language=>'hr'
,p_message_text=>'Prvo'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397532119751433)
,p_name=>'APEX.IG.FLASHBACK'
,p_message_language=>'hr'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428874904751442)
,p_name=>'APEX.IG.FORMAT'
,p_message_language=>'hr'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474612782751456)
,p_name=>'APEX.IG.FORMATMASK'
,p_message_language=>'hr'
,p_message_text=>'Maska formata'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476304120751456)
,p_name=>'APEX.IG.FORMAT_CSV'
,p_message_language=>'hr'
,p_message_text=>'CSV'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476206506751456)
,p_name=>'APEX.IG.FORMAT_HTML'
,p_message_language=>'hr'
,p_message_text=>'HTML'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387397722751430)
,p_name=>'APEX.IG.FORMAT_PDF'
,p_message_language=>'hr'
,p_message_text=>'PDF'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321219001751411)
,p_name=>'APEX.IG.FORMAT_XLSX'
,p_message_language=>'hr'
,p_message_text=>'Excel'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433437237751444)
,p_name=>'APEX.IG.FREEZE'
,p_message_language=>'hr'
,p_message_text=>'Zamrzni'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431188297751443)
,p_name=>'APEX.IG.FUNCTIONS_AND_OPERATORS'
,p_message_language=>'hr'
,p_message_text=>'Funkcije i operatori'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468296704751454)
,p_name=>'APEX.IG.FUNNEL'
,p_message_language=>'hr'
,p_message_text=>'Ljevkasti'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449937345751449)
,p_name=>'APEX.IG.GO'
,p_message_language=>'hr'
,p_message_text=>'Idi'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424732251751441)
,p_name=>'APEX.IG.GREATER_THAN'
,p_message_language=>'hr'
,p_message_text=>unistr('ve\0107e od')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424856552751441)
,p_name=>'APEX.IG.GREATER_THAN_OR_EQUALS'
,p_message_language=>'hr'
,p_message_text=>unistr('ve\0107e od ili jednako')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431429678751443)
,p_name=>'APEX.IG.GRID'
,p_message_language=>'hr'
,p_message_text=>unistr('Re\0161etka')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396547652751433)
,p_name=>'APEX.IG.GRID_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Rasterski pregled'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470802475751455)
,p_name=>'APEX.IG.GROUP'
,p_message_language=>'hr'
,p_message_text=>'Grupiraj'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431607334751443)
,p_name=>'APEX.IG.GROUP_BY'
,p_message_language=>'hr'
,p_message_text=>'Grupiraj prema'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396863629751433)
,p_name=>'APEX.IG.GROUP_BY_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Prikaz grupiranja po'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475274766751456)
,p_name=>'APEX.IG.HD_TYPE'
,p_message_language=>'hr'
,p_message_text=>'Vrsta uvjeta'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474127406751456)
,p_name=>'APEX.IG.HEADING'
,p_message_language=>'hr'
,p_message_text=>'Zaglavlje'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474333811751456)
,p_name=>'APEX.IG.HEADING_ALIGN'
,p_message_language=>'hr'
,p_message_text=>'Poravnanje zaglavlja'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483958766751459)
,p_name=>'APEX.IG.HELP'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479435820751457)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>U ovoj interaktivnoj re\0161etki izravno mo\017Eete umetnuti, a\017Eurirati i brisati podatke.</p>'),
'',
'<p>Umetnite novi redak tak da pritisnete gumb Dodaj redak.</p>',
'',
unistr('<p>Uredite postoje\0107e podatke tako da dvaput pritisnete odre\0111enu \0107eliju. Za ure\0111ivanje ve\0107eg opsega pritisnite Uredi kako biste u\0161li u na\010Din ure\0111ivanja. U na\010Dinu ure\0111ivanja mo\017Eete jednom pritisnuti odre\0111ene \0107elije ili ih ure\0111ivati tipkovnicom.</p>'),
'',
unistr('<p>Pomo\0107u izbornika za promjene duplicirajte i bri\0161ite retke. Kako biste omogu\0107ili izbornik za promjene, upotrijebite potvrdne okvire za odabir jednog ili vi\0161e redaka.</p>'),
'',
unistr('<p>Duplicirajte odabrani redak pritiskom na izbornik za promjene i odabirom Dupliciraj retke. Izbri\0161ite odabrani redak tako da pritisnete izbornik za promjene i odaberete Izbri\0161i redak.</p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481548739751458)
,p_name=>'APEX.IG.HELP.ACTIONS.EDITING_HEADING'
,p_message_language=>'hr'
,p_message_text=>unistr('Mogu\0107nosti ure\0111ivanja')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481633671751458)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Interaktivna re\0161etka predstavlja skup podataka u pretra\017Eivom i prilagodljivom izvje\0161\0107u. Mo\017Eete izvesti razne operacije kako biste ograni\010Dili broj vra\0107enih zapisa i promijenili na\010Din prikaza podataka.</p>'),
'',
unistr('<p>Pomo\0107u polja za pretra\017Eivanje filtrirajte vra\0107ene zapise. Pritisnite Akcije za pristup raznim opcijama za mijenjanje izgleda izvje\0161\0107a ili upotrijebite izbornike zaglavlja stupca na prikazanim stupcima.</p>'),
'',
unistr('<p>Upotrijebite postavke izvje\0161\0107a kako biste spremili prilagodbe u izvje\0161\0107e. Mo\017Eete i preuzeti podatke iz izvje\0161\0107a u vanjsku datoteku ili e-po\0161tom poslati podatke sebi ili drugima.</p>'),
'',
unistr('<p> Pogledajte "Upotreba interaktivnih izvje\0161\0107a" u <em>Priru\010Dniku za krajnjeg korisnika platforme Oracle APEX</em> kako biste saznali vi\0161e.')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481342224751458)
,p_name=>'APEX.IG.HELP.ACTIONS.INTRO_HEADING'
,p_message_language=>'hr'
,p_message_text=>'Pregled'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479395587751457)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Mo\017Eete prilagoditi interaktivnu mre\017Eu tako da prikazuje podatke na razne na\010Dine pomo\0107u ugra\0111enih mogu\0107nosti.</p>'),
'',
unistr('<p>Pomo\0107u izbornika zaglavlja stupaca ili izbornika akcija odredite koji \0107e se stupci prikazati, kojim redoslijedom te zamrznite stupce. Mo\017Eete i definirati razne podatkovne filtre i sortirati vra\0107ene podatke.</p>'),
'',
unistr('<p>Pomo\0107u gumba za prikaz (uz polje za pretra\017Eivanje) pristupite drugim prikazima podataka koje je definirao programer aplikacije. Mo\017Eete i stvoriti grafikon ili prikazati postoje\0107i grafikon.</p>  '),
'',
unistr('<p><em>Napomena: Pritisnite <strong>Pomo\0107</strong> u dijalo\0161kom prozoru interaktivne re\0161etke kako biste dobili detaljnije informacije o odabranoj funkciji.</em></p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481446106751458)
,p_name=>'APEX.IG.HELP.ACTIONS.REPORTING_HEADING'
,p_message_language=>'hr'
,p_message_text=>unistr('Mogu\0107nosti izvje\0161\0107ivanja')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432425274751444)
,p_name=>'APEX.IG.HELP.ACTIONS_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za interaktivnu re\0161etku')
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478210053751457)
,p_name=>'APEX.IG.HELP.AGGREGATE'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Upotrijebite ovaj dijalo\0161ki okvir za agregiranje stupaca. Agregirane vrijednosti prikazuju se u dnu podataka ili, ako se definiraju kontrolna razdvajanja, u dnu svakog razdvajanja.</p>'),
'',
'<p><strong>Popis agregiranja</strong><br>',
'Na popisu agregiranja prikazuju se definirana agregiranja.<br>',
unistr('Pritisnite Dodaj ( &plus; ) kako biste stvorili novo agregiranje ili Izbri\0161i ( &minus; ) kako biste uklonili postoje\0107e agregiranje.</p>'),
'',
'<p><strong>Postavke agregiranja</strong><br>',
'Upotrijebite obrazac s desne strane kako biste definirali agregiranje.<br>',
'Odaberite naziv stupca i vrstu agregiranja.<br>',
'Po izboru unesite zaslonski opis za agregiranje.<br>',
unistr('Ako ste definirali kontrolno razdvajanje, <strong>Prika\017Ei ukupnu vrijednost</strong> prikazuje sveukupnu prosje\010Dnu, ukupnu ili sli\010Dnu vrijednost u dnu podataka.</p>'),
'',
unistr('<p><em>Napomena: Pristupite dijalo\0161kom okviru Agregiranje u izborniku akcija ili pritiskom na zaglavlje stupca i zbroj ( &sum; ).</em></p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480450442751458)
,p_name=>'APEX.IG.HELP.AGGREGATE_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za agregiranje')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478900392751457)
,p_name=>'APEX.IG.HELP.CHART'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Pomo\0107u ovog dijalo\0161kog okvira definirajte grafikon koji se prikazuje kao zasebni prikaz podataka.<br>'),
'Odaberite vrstu i atribute grafikona.</p>',
'<p><strong>Atributi grafikona</strong><br>',
'Dostupni atributi grafikona razlikuju se ovisno o vrsti grafikona.</p>',
'<p>',
'<ul>',
'  <li>Odaberite stupac s vrijednosti za atribut:',
'    <ul>',
unistr('      <li>Oznaka - tekst za svaku podatkovnu to\010Dku.</li>'),
'      <li>Vrijednost - podaci za iscrtavanje.</li>',
unistr('      <li>Serija - za definiranje vi\0161eserijskog dinami\010Dkog upita.</li>'),
'      <li>Otvaranje - cijena pri otvaranju burze u danu (samo burzovni grafikon).</li>',
unistr('      <li>Zaklju\010Dno - zaklju\010Dna burzovna cijena u danu (samo burzovni grafikon).</li>'),
'      <li>Visoko - visoka vrijednost (samo rasponski i burzovni grafikon).</li>',
'      <li>Nisko - niska vrijednost (samo rasponski i burzovni grafikon).</li>',
'      <li>Obujam - dnevni obujam trgovanja (samo burzovni grafikon).</li>',
unistr('      <li>Odredi\0161te - odredi\0161na vrijednost (samo ljevkasti grafikon).</li>'),
unistr('      <li>X - vrijednost x-osi (samo mjehuri\0107asti i raspr\0161eni grafikon).</li>'),
unistr('      <li>Y - vrijednost y-osi (samo mjehuri\0107asti i raspr\0161eni grafikon).</li>'),
unistr('      <li>Z - \0161irina trake ili polumjer mjehuri\0107a (samo trakasti, mjehuri\0107asti i rasponski grafikon).</li>'),
'    </ul>',
'  </li>',
'  <li>Orijentacija - vodoravna ili okomita.</li>',
unistr('  <li>Agregiranje -  odaberite na\010Din agregiranja vrijednosti grafikona.</li>'),
unistr('  <li>Slaganje- navedite sla\017Eu li se podatkovne stavke.</li>'),
'  <li>Sortiranje prema - sortirajte prema oznaci ili vrijednostima.',
'    <ul>',
'      <li>Smjer - sortiranje po uzlaznim ili silaznim vrijednostima.</li>',
unistr('      <li>Nulls - navedite kako \017Eelite sortirati zapise s null vrijednostima u odnosu na zapise bez null vrijednosti.</li>'),
'    </ul>',
'  </li>',
'  <li>Decimalna mjesta</li>',
'  <li>Naslov osi oznake</li>',
'  <li>Naslov osi vrijednosti</li>',
'</ul>',
'</p>'))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480866699751458)
,p_name=>'APEX.IG.HELP.CHART_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za grafikone')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477996403751457)
,p_name=>'APEX.IG.HELP.COLUMNS'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Pomo\0107u ovog dijalo\0161kog prozora odaberite koji \0107e se stupci prikazati i kojim redoslijedom.</p>'),
'',
unistr('<p>Sakrijte stupac tako da poni\0161tite njegov odabir.<br>'),
'Ponovo sortirajte stupce tako da pritisnete Premjesti gore ( &uarr; ) ili Premjesti dolje ( &darr; ).<br>',
unistr('Pomo\0107u padaju\0107eg izbornika generirajte popis Svih stupaca, Prikazanih stupaca ili Neprikazanih stupaca .</p>'),
'',
unistr('<p>Po izboru upotrijebite obrazac kako biste naveli minimalnu \0161irinu stupca u pikselima.</p>'),
'',
unistr('<p><em>Napomena: Mo\017Eete i ponovo sortirati prikazane stupce tako da pritisnete i povu\010Dete pokaziva\010D (na po\010Detku zaglavlja stupca) te povu\010Dete stupac slijeva nadesno. Mo\017Eete i promijeniti \0161irinu prikazanih stupaca tako da odaberete razdjelnik stupaca,')
||unistr(' izme\0111u zaglavlja, te ga pomaknete ulijevo ili udesno.</em></p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480768408751458)
,p_name=>'APEX.IG.HELP.COLUMNS_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za stupce')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478313687751457)
,p_name=>'APEX.IG.HELP.COMPUTE'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Pomo\0107u ovog dijalo\0161kog okvira definirajte dodatne stupce na temelju matemati\010Dkih i funkcijskih izra\010Duna izvedenih na postoje\0107im stupcima.</p>'),
'',
unistr('<p><strong>Popis izra\010Duna</strong><br>'),
unistr('Na popisu izra\010Duna prikazuju se definirani izra\010Duni. Onemogu\0107ite postoje\0107i izra\010Dun tako da poni\0161tite njegov odabir.<br>'),
unistr('Pritisnite Dodaj ( &plus; ) kako biste dodali novi izra\010Dun ili Izbri\0161i ( &minus; ) kako biste uklonili postoje\0107i izra\010Dun.</p>'),
'',
unistr('<p><strong>Postavke izra\010Duna</strong><br>'),
unistr('Upotrijebite obrazac za definirane izra\010Duna.<br>'),
unistr('Unesite pojedinosti stupca kao \0161to su zaglavlje, oznaka i odabir postavki poravnanja.<br> '),
unistr('Pomo\0107u tekstnog podru\010Dja izraza unesite stupce i povezane funkcije za izra\010Dun.<br>'),
unistr('Odaberite odgovaraju\0107u vrstu podataka i, po izboru, masku formata za novi stupac.</p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480300845751458)
,p_name=>'APEX.IG.HELP.COMPUTE_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za izra\010Dun')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478691009751457)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Upotrijebite ovaj dijalo\0161ki okvir za definiranje kontrolnog razdvajanje u jednom ili vi\0161e stupaca.</p>'),
'',
'<p><strong>Popis kontrolnih razdvajanja</strong><br>',
unistr('Na popisu kontrolnih razdvajanja prikazuju se definirana kontrolna razdvajanja. Postoje\0107e kontrolno razdvajanje mo\017Eete onemogu\0107iti tako da poni\0161tite njegov odabir.<br>'),
unistr('Pritisnite Dodaj ( &plus; ) kako biste uklju\010Dili novi stupac u kontrolno razdvajanje ili Izbri\0161i ( &minus; ) kako biste uklonili postoje\0107i stupac iz kontrolnog razdvajanja.<br>'),
'Kako biste promijenili redoslijed stupaca, pritisnite Premjesti gore ( &uarr; ) ili Premjesti dolje ( &darr; ) kako biste premjestili odabrani stupac gore ili dolje u odnosu na druge stupce.</p>',
'',
'<p><strong>Postavke kontrolnog razdvajanja</strong><br>',
unistr('Pomo\0107u obrasca definirajte stupac kontrolnog razdvajanja.<br>'),
unistr('Odaberite stupac kontrolnog razdvajanja, smjer sortiranja i na\010Din raspore\0111ivanja null stupaca (stupci bez vrijednosti).</p>'),
'',
unistr('<p><em>Napomena: Kod prikaza interaktivne re\0161etke mo\017Eete definirati kontrolno razdvajanje pritiskom na zaglavlje stupca i odabirom ikone kontrolnog razdvajanja.</em></p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480012295751457)
,p_name=>'APEX.IG.HELP.CONTROL_BREAK_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za kontrolno razdvajanje')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478898181751457)
,p_name=>'APEX.IG.HELP.DOWNLOAD'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Upotrijebite ovaj dijalo\0161ki okvir za preuzimanje svih trenutnih redaka u vanjsku datoteku. Datoteka \0107e sadr\017Eavati samo trenutno prikazane stupce uz upotrebu filtara i sortiranja primijenjenih na podatke.</p>'),
'',
'<p>Odaberite format datoteke i pritisnite Preuzmi.<br>',
unistr('Napomena: CSV ne\0107e uklju\010Divati formatiranje teksta poput agregiranja i kontrolnih razdvajanja.</p>'),
'',
unistr('<p>Kako biste datoteku poslali e-po\0161tom, odaberite Po\0161alji kao e-po\0161tu i unesite pojedinosti e-po\0161te (Primatelj, Predmet i Poruka).</p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479858306751457)
,p_name=>'APEX.IG.HELP.DOWNLOAD_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za preuzimanje')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478065650751457)
,p_name=>'APEX.IG.HELP.FILTER'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Pomo\0107u ovog dijalo\0161kog okvira konfigurirajte filtre podataka koji ograni\010Davaju vra\0107ene retke.</p>'),
'',
'<p><strong>Popis filtara</strong><br>',
unistr('Na popisu filtara prikazuju se definirani filtri. Onemogu\0107ite postoje\0107i filtar tako da poni\0161tite njegov odabir.<br>'),
unistr('Pritisnite Dodaj ( &plus; ) kako biste stvorili novi filtar ili Izbri\0161i ( &minus; ) kako biste uklonili postoje\0107i filtar.</p>'),
'',
'<p><strong>Postavke filtra</strong><br>',
unistr('Pomo\0107u obrasca definirajte svojstva filtra.<br>'),
unistr('Odaberite odgovaraju\0107u vrstu filtra:<br>'),
unistr('&nbsp;&nbsp;&nbsp;Redak - filtrirajte pojam u bilo kojem stupcu s mogu\0107nosti filtriranja.<br>'),
unistr('&nbsp;&nbsp;&nbsp;Stupac - filtrirajte odre\0111eni stupac s odre\0111enim operatorom i vrijednosti.</p>'),
'',
unistr('<p><em>Napomena: . Kod prikaza interaktivne re\0161etke mo\017Eete definirati filtre redaka izravnim upisivanjem u polje za pretra\017Eivanje. Pritisnite Odabir stupaca za pretra\017Eivanje kako biste ograni\010Dili pretra\017Eivanje na odre\0111eni stupac. Umjesto toga mo\017Eete ')
||'otvoriti izbornik zaglavlja stupca i odabrati vrijednost za stvaranje filtra stupca.</em></p>'))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480637384751458)
,p_name=>'APEX.IG.HELP.FILTER_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za filtriranje')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478471856751457)
,p_name=>'APEX.IG.HELP.FLASHBACK'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Upotrijebite ovaj dijalo\0161ki okvir za prikaz podataka u stanju u kojem su bili u prethodnoj vremenskoj to\010Dki.</p>'),
unistr('<p>Unesite broj proteklih minuta za izvr\0161enje upita Flashback.</p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480258432751458)
,p_name=>'APEX.IG.HELP.FLASHBACK_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za Flashback')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480959202751458)
,p_name=>'APEX.IG.HELP.GROUP_BY_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za grupiranje po')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478539005751457)
,p_name=>'APEX.IG.HELP.HIGHLIGHT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Pomo\0107u ovog dijalo\0161kog okvira istaknite retke ili stupce podataka na temelju unesenog uvjeta.</p>'),
'',
'<p><strong>Popis isticanja</strong><br>',
unistr('Na popisu isticanja prikazuju se definirana isticanja. Onemogu\0107ite postoje\0107e isticanje tako da poni\0161tite njegov odabir.<br>'),
unistr('Pritisnite Dodaj ( &plus; ) kako biste stvorili novo isticanje ili Izbri\0161i ( &minus; ) kako biste uklonili postoje\0107e isticanje.</p>'),
'',
'<p><strong>Postavke isticanja</strong><br>',
unistr('Pomo\0107u obrasca definirajte svojstva isticanja.<br>'),
unistr('Unesite naziv, odaberite Redak ili Stupac i odaberite HTML \0161ifre boja za pozadinu i tekst.<br>'),
unistr('Odaberite odgovaraju\0107u <strong>vrstu uvjeta</strong> za isticanje odre\0111enih podataka:<br>'),
'&nbsp;&nbsp;&nbsp;Redak - istaknite pojam u bilo kojem stupcu.<br>',
unistr('&nbsp;&nbsp;&nbsp;Stupac - izvr\0161ite isticanje u odre\0111enom stupcu na temelju odre\0111enog operatora i vrijednosti.</p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480166779751457)
,p_name=>'APEX.IG.HELP.HIGHLIGHT_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za isticanje')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478708720751457)
,p_name=>'APEX.IG.HELP.REPORT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Pomo\0107u ovog dijalo\0161kog okvira spremite promjene trenutnog izgleda i konfiguracije izgleda re\0161etke.<br>'),
unistr('Programeri aplikacija mogu definirati vi\0161e promjenjivih izgleda izvje\0161\0107a. Kada je to dopu\0161teno, vi i ostali krajnji korisnici mo\017Eete spremiti izvje\0161\0107e kao javno, \010Dime izvje\0161\0107e postaje dostupno svim korisnicima re\0161etke. Izvje\0161\0107e mo\017Eete spremiti kao pr')
||unistr('ivatno izvje\0161\0107e koje samo vi mo\017Eete vidjeti.</p>'),
unistr('<p>Birajte me\0111u dostupnim vrstama i unesite naziv za spremljeno izvje\0161\0107e.</p>')))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479916370751457)
,p_name=>'APEX.IG.HELP.REPORT_TITLE'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Pomo\0107 za izvje\0161\0107e'),
''))
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139478105144751457)
,p_name=>'APEX.IG.HELP.SORT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Pomo\0107u ovog dijalo\0161kog okvira postavite redoslijed prikaza.</p>'),
'',
'<p><strong>Popis sortiranja</strong><br>',
unistr('Dijalo\0161ki okvir za sortiranje prikazuje popis konfiguriranih pravila sortiranja.<br>'),
unistr('Pritisnite Dodaj ( &plus; ) kako biste stvorili stupac sortiranja ili Izbri\0161i ( &minus; ) kako biste uklonili stupac sortiranja.<br>'),
'Pritisnite Premjesti gore ( &uarr; ) i Premjesti dolje ( &darr; ) kako biste odabrani stupac sortiranja premjestili prema gore i dolje u odnosu na druge stupce sortiranja.</p>',
'',
'<p><strong>Postavke sortiranja</strong><br>',
unistr('Odaberite stupac sortiranja, smjer sortiranja i na\010Din raspore\0111ivanja null stupaca (stupci bez vrijednosti).</p>'),
'',
unistr('<p><em>Napomena: Podaci se mogu sortirati po stupcima koji nisu prikazani; no nemaju svi stupci mogu\0107nost sortiranja.</em><br>'),
unistr('<em>Prikazani stupci mogu se sortirati tako da pritisnete strelice za gore (uzlazno) ili dolje (silazno) na kraju zaglavlja stupaca. Kako biste dodali naknadni stupac postoje\0107em sortiranju, dr\017Eite tipku Shift i pritisnite strelicu za gore ili dolje.<')
||'/em></p>'))
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139480531031751458)
,p_name=>'APEX.IG.HELP.SORT_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za sortiranje')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479760207751457)
,p_name=>'APEX.IG.HELP.SUBSCRIPTION_TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za pretplatu')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433332345751444)
,p_name=>'APEX.IG.HIDE'
,p_message_language=>'hr'
,p_message_text=>'Sakrij'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397740193751433)
,p_name=>'APEX.IG.HIGHLIGHT'
,p_message_language=>'hr'
,p_message_text=>'Istakni'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466941702751454)
,p_name=>'APEX.IG.HIGH_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Visoko'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467746297751454)
,p_name=>'APEX.IG.HORIZONTAL'
,p_message_language=>'hr'
,p_message_text=>'Vodoravno'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426324037751442)
,p_name=>'APEX.IG.HOURS'
,p_message_language=>'hr'
,p_message_text=>'h'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431321699751443)
,p_name=>'APEX.IG.ICON'
,p_message_language=>'hr'
,p_message_text=>'Ikona'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396697135751433)
,p_name=>'APEX.IG.ICON_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Prikaz ikone'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424558458751441)
,p_name=>'APEX.IG.IN'
,p_message_language=>'hr'
,p_message_text=>'u'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432975885751444)
,p_name=>'APEX.IG.INACTIVE_SETTING'
,p_message_language=>'hr'
,p_message_text=>'Neaktivna postavka'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433047991751444)
,p_name=>'APEX.IG.INACTIVE_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>'Neaktivne postavke'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440602105751446)
,p_name=>'APEX.IG.INTERNAL_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pri obradi zahtjeva interaktivne re\0161etke do\0161lo je do interne pogre\0161ke.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328562250751413)
,p_name=>'APEX.IG.INVALID_COLUMN_FILTER_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta filtra stupca "%0" nije podr\017Eana za stupac "%1".')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479582866751457)
,p_name=>'APEX.IG.INVALID_DATE_FORMAT'
,p_message_language=>'hr'
,p_message_text=>'Format datuma nije valjan'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454388145751450)
,p_name=>'APEX.IG.INVALID_FILTER_COLUMN'
,p_message_language=>'hr'
,p_message_text=>unistr('Interaktivna re\0161etka ne podr\017Eava definiranje filtra na stupcu %0.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454283200751450)
,p_name=>'APEX.IG.INVALID_FILTER_OPERATOR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije valjana vrsta filtra za definiranje filtra interaktivne re\0161etke.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335159976751415)
,p_name=>'APEX.IG.INVALID_NUMBER_FORMAT'
,p_message_language=>'hr'
,p_message_text=>'Format broja nije valjan'
,p_is_js_message=>true
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482203981751458)
,p_name=>'APEX.IG.INVALID_SETTING'
,p_message_language=>'hr'
,p_message_text=>'Postavka nije valjana'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482327557751458)
,p_name=>'APEX.IG.INVALID_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>'Postavke nisu valjane'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473435052751456)
,p_name=>'APEX.IG.INVALID_SORT_BY'
,p_message_language=>'hr'
,p_message_text=>'Sortiranje po postavljeno je na %0, ali za %0 nije odabran stupac.'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470704502751455)
,p_name=>'APEX.IG.INVALID_VALUE'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost nije valjana'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465857559751453)
,p_name=>'APEX.IG.INVISIBLE'
,p_message_language=>'hr'
,p_message_text=>'Nije prikazano'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425385898751441)
,p_name=>'APEX.IG.IN_THE_LAST'
,p_message_language=>'hr'
,p_message_text=>'je u zadnjem'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425527436751441)
,p_name=>'APEX.IG.IN_THE_NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('u sljede\0107em')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424419264751441)
,p_name=>'APEX.IG.IS_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'nije prazno'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424362493751441)
,p_name=>'APEX.IG.IS_NULL'
,p_message_language=>'hr'
,p_message_text=>'je prazno'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474214011751456)
,p_name=>'APEX.IG.LABEL'
,p_message_language=>'hr'
,p_message_text=>'Oznaka'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466210929751453)
,p_name=>'APEX.IG.LABEL_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Oznaka'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470135657751455)
,p_name=>'APEX.IG.LAST'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414686896751438)
,p_name=>'APEX.IG.LAST.DAY'
,p_message_language=>'hr'
,p_message_text=>'Zadnji dan'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414884915751438)
,p_name=>'APEX.IG.LAST.HOUR'
,p_message_language=>'hr'
,p_message_text=>'Zadnji sat'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415383398751438)
,p_name=>'APEX.IG.LAST.MINUTE'
,p_message_language=>'hr'
,p_message_text=>'Prethodna minuta'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414393382751438)
,p_name=>'APEX.IG.LAST.MONTH'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161li mjesec')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414407647751438)
,p_name=>'APEX.IG.LAST.WEEK'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161li tjedan')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414526631751438)
,p_name=>'APEX.IG.LAST.X_DAYS'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih dana: %0'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414710366751438)
,p_name=>'APEX.IG.LAST.X_HOURS'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih sati: %0'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415453373751439)
,p_name=>'APEX.IG.LAST.X_MINUTES'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih minuta: %0'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415223684751438)
,p_name=>'APEX.IG.LAST.X_MONTHS'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih mjeseci: %0'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415154751751438)
,p_name=>'APEX.IG.LAST.X_WEEKS'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih tjedana: %0'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414183386751438)
,p_name=>'APEX.IG.LAST.X_YEARS'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih godina: %0'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414235347751438)
,p_name=>'APEX.IG.LAST.YEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161la godina')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474487930751456)
,p_name=>'APEX.IG.LAYOUT_ALIGN'
,p_message_language=>'hr'
,p_message_text=>unistr('Poravnanje \0107elija')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474503735751456)
,p_name=>'APEX.IG.LAYOUT_USEGROUPFOR'
,p_message_language=>'hr'
,p_message_text=>'Upotrijebi grupu za'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424966425751441)
,p_name=>'APEX.IG.LESS_THAN'
,p_message_language=>'hr'
,p_message_text=>'manje od'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425081843751441)
,p_name=>'APEX.IG.LESS_THAN_OR_EQUALS'
,p_message_language=>'hr'
,p_message_text=>'manje od ili jednako'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468373748751454)
,p_name=>'APEX.IG.LINE'
,p_message_language=>'hr'
,p_message_text=>'Linijski'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468418756751454)
,p_name=>'APEX.IG.LINE_WITH_AREA'
,p_message_language=>'hr'
,p_message_text=>unistr('Redak s povr\0161inom')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474863753751456)
,p_name=>'APEX.IG.LISTAGG'
,p_message_language=>'hr'
,p_message_text=>'Listagg'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467016791751454)
,p_name=>'APEX.IG.LOW_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Nisko'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477315616751457)
,p_name=>'APEX.IG.MAILADDRESSES_COMMASEP'
,p_message_language=>'hr'
,p_message_text=>unistr('Odvojite vi\0161e adresa zarezima')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426130368751442)
,p_name=>'APEX.IG.MATCHES_REGULAR_EXPRESSION'
,p_message_language=>'hr'
,p_message_text=>'odgovara regularnom izrazu'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450502980751449)
,p_name=>'APEX.IG.MAX'
,p_message_language=>'hr'
,p_message_text=>'Maksimalno'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484806819751459)
,p_name=>'APEX.IG.MAX_OVERALL'
,p_message_language=>'hr'
,p_message_text=>'Ukupni maksimum'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450713839751449)
,p_name=>'APEX.IG.MEDIAN'
,p_message_language=>'hr'
,p_message_text=>'Sredina'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484911693751459)
,p_name=>'APEX.IG.MEDIAN_OVERALL'
,p_message_language=>'hr'
,p_message_text=>'Ukupna sredina'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450454686751449)
,p_name=>'APEX.IG.MIN'
,p_message_language=>'hr'
,p_message_text=>'Minimalno'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426259604751442)
,p_name=>'APEX.IG.MINUTES'
,p_message_language=>'hr'
,p_message_text=>'min'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451224711751449)
,p_name=>'APEX.IG.MINUTES_AGO'
,p_message_language=>'hr'
,p_message_text=>'Min ranije'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484734569751459)
,p_name=>'APEX.IG.MIN_OVERALL'
,p_message_language=>'hr'
,p_message_text=>'Ukupni minimum'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426666137751442)
,p_name=>'APEX.IG.MONTHS'
,p_message_language=>'hr'
,p_message_text=>'mj.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433272299751444)
,p_name=>'APEX.IG.MORE_DATA_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Podaci sadr\017Ee vi\0161e od sljede\0107eg broja redaka: %0, a to je vi\0161e od maksimalno dopu\0161tenog broja. Primijenite dodatne filtre kako biste prikazali rezultate.')
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459026830751451)
,p_name=>'APEX.IG.MULTIIG_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Mora se navesti stati\010Dni ID podru\010Dja jer stranica sadr\017Ei vi\0161e interaktivnih re\0161etki.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429386595751443)
,p_name=>'APEX.IG.NAME'
,p_message_language=>'hr'
,p_message_text=>'Naziv'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429534507751443)
,p_name=>'APEX.IG.NAMED_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e s nazivom')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413576880751438)
,p_name=>'APEX.IG.NEXT.DAY'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i dan')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413384529751438)
,p_name=>'APEX.IG.NEXT.HOUR'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i sat')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415598930751439)
,p_name=>'APEX.IG.NEXT.MINUTE'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107a minuta')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413814874751438)
,p_name=>'APEX.IG.NEXT.MONTH'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i mjesec')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413705020751438)
,p_name=>'APEX.IG.NEXT.WEEK'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i tjedan')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413637402751438)
,p_name=>'APEX.IG.NEXT.X_DAYS'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih dana: %0')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413417184751438)
,p_name=>'APEX.IG.NEXT.X_HOURS'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih sati: %0')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415649958751439)
,p_name=>'APEX.IG.NEXT.X_MINUTES'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih minuta: %0')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414936932751438)
,p_name=>'APEX.IG.NEXT.X_MONTHS'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih mjeseci: %0')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415045216751438)
,p_name=>'APEX.IG.NEXT.X_WEEKS'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih tjedana: %0')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139414038357751438)
,p_name=>'APEX.IG.NEXT.X_YEARS'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih godina: %0')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139413953093751438)
,p_name=>'APEX.IG.NEXT.YEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107a godina')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425246708751441)
,p_name=>'APEX.IG.NOT_BETWEEN'
,p_message_language=>'hr'
,p_message_text=>unistr('nije izme\0111u')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424280055751441)
,p_name=>'APEX.IG.NOT_EQUALS'
,p_message_language=>'hr'
,p_message_text=>'nije jednako'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489093367751460)
,p_name=>'APEX.IG.NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Regija s ID-om %0 nije podru\010Dje interaktivne re\0161etke ili ne postoji u aplikaciji  %1.')
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424661732751441)
,p_name=>'APEX.IG.NOT_IN'
,p_message_language=>'hr'
,p_message_text=>'nije u'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425472721751441)
,p_name=>'APEX.IG.NOT_IN_THE_LAST'
,p_message_language=>'hr'
,p_message_text=>'nije u zadnjem'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425603109751442)
,p_name=>'APEX.IG.NOT_IN_THE_NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('nije u sljede\0107em')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433185216751444)
,p_name=>'APEX.IG.NO_DATA_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Podaci nisu prona\0111eni')
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469949421751455)
,p_name=>'APEX.IG.NULLS'
,p_message_language=>'hr'
,p_message_text=>'Vrijednosti null'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475018064751456)
,p_name=>'APEX.IG.NUMBER'
,p_message_language=>'hr'
,p_message_text=>unistr('Numeri\010Dka vrijednost')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470252785751455)
,p_name=>'APEX.IG.OFF'
,p_message_language=>'hr'
,p_message_text=>unistr('Isklju\010Deno')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470363526751455)
,p_name=>'APEX.IG.ON'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Deno')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423442660751441)
,p_name=>'APEX.IG.ONE_MINUTE_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije 1 minute'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477858544751457)
,p_name=>'APEX.IG.OPEN_COLORPICKER'
,p_message_language=>'hr'
,p_message_text=>'Otvori izbornik boje: %0'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466722233751454)
,p_name=>'APEX.IG.OPEN_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Otvori'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430457822751443)
,p_name=>'APEX.IG.OPERATOR'
,p_message_language=>'hr'
,p_message_text=>'Operator'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466157571751453)
,p_name=>'APEX.IG.ORIENTATION'
,p_message_language=>'hr'
,p_message_text=>'Orijentacija'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468587710751454)
,p_name=>'APEX.IG.PIE'
,p_message_language=>'hr'
,p_message_text=>'Tortni'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431747490751443)
,p_name=>'APEX.IG.PIVOT'
,p_message_language=>'hr'
,p_message_text=>'Zaokretanje'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396975611751433)
,p_name=>'APEX.IG.PIVOT_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Zaokretni prikaz'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477705597751457)
,p_name=>'APEX.IG.PLACEHOLDER_INVALUES'
,p_message_language=>'hr'
,p_message_text=>'Vrijednosti odvojite upotrebom "%0"'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468640073751454)
,p_name=>'APEX.IG.POLAR'
,p_message_language=>'hr'
,p_message_text=>'Polarni'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473968341751456)
,p_name=>'APEX.IG.POSITION_CENTER'
,p_message_language=>'hr'
,p_message_text=>'Sredina'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139474026998751456)
,p_name=>'APEX.IG.POSITION_END'
,p_message_language=>'hr'
,p_message_text=>'Kraj'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473892830751456)
,p_name=>'APEX.IG.POSITION_START'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\010Detak')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429637902751443)
,p_name=>'APEX.IG.PRIMARY'
,p_message_language=>'hr'
,p_message_text=>'Primarno'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429926046751443)
,p_name=>'APEX.IG.PRIMARY_DEFAULT'
,p_message_language=>'hr'
,p_message_text=>'Primarno zadano'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446487100751448)
,p_name=>'APEX.IG.PRIMARY_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Primarno izvje\0161\0107e')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320049905751410)
,p_name=>'APEX.IG.PRINT_ACCESSIBLE.PROMPT'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Di oznake pristupa\010Dnosti')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317459735751410)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.HORIZONTAL.D'
,p_message_language=>'hr'
,p_message_text=>'Vodoravno'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317579463751410)
,p_name=>'APEX.IG.PRINT_ORIENTATION.LOV.VERTICAL.D'
,p_message_language=>'hr'
,p_message_text=>'Okomito'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317385525751410)
,p_name=>'APEX.IG.PRINT_ORIENTATION.PROMPT'
,p_message_language=>'hr'
,p_message_text=>'Orijentacija stranice'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317270878751409)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A3.D'
,p_message_language=>'hr'
,p_message_text=>'A3'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317163447751409)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.A4.D'
,p_message_language=>'hr'
,p_message_text=>'A4'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320213586751410)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.CUSTOM.D'
,p_message_language=>'hr'
,p_message_text=>unistr('Prilago\0111eno')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316985469751409)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LEGAL.D'
,p_message_language=>'hr'
,p_message_text=>'Legal'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316861062751409)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.LETTER.D'
,p_message_language=>'hr'
,p_message_text=>'Letter'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317052397751409)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.LOV.TABLOID.D'
,p_message_language=>'hr'
,p_message_text=>'Tabloid'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316742232751409)
,p_name=>'APEX.IG.PRINT_PAGE_SIZE.PROMPT'
,p_message_language=>'hr'
,p_message_text=>unistr('Veli\010Dina stranice')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282331028751399)
,p_name=>'APEX.IG.PRINT_STRIP_RICH_TEXT.PROMPT'
,p_message_language=>'hr'
,p_message_text=>unistr('Ukloni oboga\0107eni tekst')
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468737230751454)
,p_name=>'APEX.IG.RADAR'
,p_message_language=>'hr'
,p_message_text=>'Radarski'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468867333751454)
,p_name=>'APEX.IG.RANGE'
,p_message_language=>'hr'
,p_message_text=>'Rasponski'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479020763751457)
,p_name=>'APEX.IG.REFRESH'
,p_message_language=>'hr'
,p_message_text=>unistr('Osvje\017Ei')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433907987751444)
,p_name=>'APEX.IG.REFRESH_ROW'
,p_message_language=>'hr'
,p_message_text=>unistr('Osvje\017Ei redak')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432744525751444)
,p_name=>'APEX.IG.REFRESH_ROWS'
,p_message_language=>'hr'
,p_message_text=>unistr('Osvje\017Ei retke')
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437924239751445)
,p_name=>'APEX.IG.REGION_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Podru\010Dje interaktivne re\0161etke ne postoji u aplikaciji %0, stranici %1 ni podru\010Dju %2.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398445740751434)
,p_name=>'APEX.IG.REMOVE_CONTROL'
,p_message_language=>'hr'
,p_message_text=>'Ukloni %0'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429071711751443)
,p_name=>'APEX.IG.REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488294204751460)
,p_name=>'APEX.IG.REPORT.DELETED'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e izbrisano')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487969529751460)
,p_name=>'APEX.IG.REPORT.SAVED.ALTERNATIVE'
,p_message_language=>'hr'
,p_message_text=>unistr('Alternativno izvje\0161\0107e spremljeno za sve korisnike')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487897149751460)
,p_name=>'APEX.IG.REPORT.SAVED.DEFAULT'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadano izvje\0161\0107e spremljeno za sve korisnike')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488194865751460)
,p_name=>'APEX.IG.REPORT.SAVED.PRIVATE'
,p_message_language=>'hr'
,p_message_text=>unistr('Privatno izvje\0161\0107e spremljeno')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488060135751460)
,p_name=>'APEX.IG.REPORT.SAVED.PUBLIC'
,p_message_language=>'hr'
,p_message_text=>unistr('Javno izvje\0161\0107e spremljeno za sve korisnike')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139438054895751445)
,p_name=>'APEX.IG.REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljena interaktivna re\0161etka s nazivom %0 ne postoji.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423361982751441)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF.X.MINUTES_AGO'
,p_message_language=>'hr'
,p_message_text=>unistr('Podaci mre\017Ee od prije %0 min')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423298143751441)
,p_name=>'APEX.IG.REPORT_DATA_AS_OF_ONE_MINUTE_AGO'
,p_message_language=>'hr'
,p_message_text=>unistr('Podaci mre\017Ee od prije 1 minute')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358750745751422)
,p_name=>'APEX.IG.REPORT_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e u interaktivnoj re\0161etki ne postoji.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481271907751458)
,p_name=>'APEX.IG.REPORT_EDIT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e - uredi')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437803475751445)
,p_name=>'APEX.IG.REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljena interaktivna re\0161etka s ID-om %0 ne postoji.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139481119654751458)
,p_name=>'APEX.IG.REPORT_SAVE_AS'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e - spremi kao')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398586601751434)
,p_name=>'APEX.IG.REPORT_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavke re\0161etke')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489101946751460)
,p_name=>'APEX.IG.REPORT_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljena interaktivna re\0161etka sa stati\010Dkim ID-om %0 ne postoji.')
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484180734751459)
,p_name=>'APEX.IG.REPORT_VIEW'
,p_message_language=>'hr'
,p_message_text=>unistr('Prikaz izvje\0161\0107a')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397679526751433)
,p_name=>'APEX.IG.RESET'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434036104751444)
,p_name=>'APEX.IG.REVERT_CHANGES'
,p_message_language=>'hr'
,p_message_text=>'Vrati promjene'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432830850751444)
,p_name=>'APEX.IG.REVERT_ROWS'
,p_message_language=>'hr'
,p_message_text=>'Vrati retke'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430079391751443)
,p_name=>'APEX.IG.ROW'
,p_message_language=>'hr'
,p_message_text=>'Redak'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428920424751442)
,p_name=>'APEX.IG.ROWS_PER_PAGE'
,p_message_language=>'hr'
,p_message_text=>'Redaka po stranici'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488712009751460)
,p_name=>'APEX.IG.ROW_ACTIONS'
,p_message_language=>'hr'
,p_message_text=>'Akcije redaka'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489951753751461)
,p_name=>'APEX.IG.ROW_ACTIONS_FOR'
,p_message_language=>'hr'
,p_message_text=>'Akcije za redak %0'
,p_is_js_message=>true
,p_version_scn=>2704939
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139397940796751433)
,p_name=>'APEX.IG.SAVE'
,p_message_language=>'hr'
,p_message_text=>'Spremi'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443045073751447)
,p_name=>'APEX.IG.SAVED'
,p_message_language=>'hr'
,p_message_text=>'spremljeno'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347659855751419)
,p_name=>'APEX.IG.SAVED_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljeno izvje\0161\0107e: %0')
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396108161751433)
,p_name=>'APEX.IG.SAVED_REPORTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljeni izvje\0161taji')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396272650751433)
,p_name=>'APEX.IG.SAVED_REPORT_DEFAULT'
,p_message_language=>'hr'
,p_message_text=>'Zadano'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369762032751425)
,p_name=>'APEX.IG.SAVED_REPORT_EXISTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljeno izvje\0161\0107e naziva %0 ve\0107 postoji. Unesite novi naziv.')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396398243751433)
,p_name=>'APEX.IG.SAVED_REPORT_PRIVATE'
,p_message_language=>'hr'
,p_message_text=>'Privatno'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396428411751433)
,p_name=>'APEX.IG.SAVED_REPORT_PUBLIC'
,p_message_language=>'hr'
,p_message_text=>'Javno'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483833965751459)
,p_name=>'APEX.IG.SAVE_AS'
,p_message_language=>'hr'
,p_message_text=>'Spremi kao'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432168437751443)
,p_name=>'APEX.IG.SAVE_REPORT_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremi postavke izvje\0161\0107a')
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139468921460751454)
,p_name=>'APEX.IG.SCATTER'
,p_message_language=>'hr'
,p_message_text=>unistr('Raspr\0161eni')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139396041177751433)
,p_name=>'APEX.IG.SEARCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476135142751456)
,p_name=>'APEX.IG.SEARCH.ALL_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje: svi stupci s tekstom')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395946548751433)
,p_name=>'APEX.IG.SEARCH.COLUMN'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje: %0')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475486517751456)
,p_name=>'APEX.IG.SEARCH.ORACLE_TEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje: cijeli tekst')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423173461751441)
,p_name=>'APEX.IG.SEARCH_FOR.X'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Ei  ''%0''')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465516031751453)
,p_name=>'APEX.IG.SELECT'
,p_message_language=>'hr'
,p_message_text=>'- Odabir -'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405628341751436)
,p_name=>'APEX.IG.SELECTION'
,p_message_language=>'hr'
,p_message_text=>'Odabir'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458795563751451)
,p_name=>'APEX.IG.SELECT_1_ROW_IN_MASTER'
,p_message_language=>'hr'
,p_message_text=>unistr('Odaberite 1 redak u nadre\0111enoj regiji')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395854740751433)
,p_name=>'APEX.IG.SELECT_COLUMNS_TO_SEARCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Odaberite stupce za pretra\017Eivanje')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488421603751460)
,p_name=>'APEX.IG.SEL_ACTIONS'
,p_message_language=>'hr'
,p_message_text=>'Akcije odabira'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405817866751436)
,p_name=>'APEX.IG.SEL_MODE_CELL'
,p_message_language=>'hr'
,p_message_text=>unistr('Odabir \0107elija')
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405777396751436)
,p_name=>'APEX.IG.SEL_MODE_ROW'
,p_message_language=>'hr'
,p_message_text=>'Odabir redaka'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476729939751456)
,p_name=>'APEX.IG.SEND_AS_EMAIL'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161alji kao poruku e-po\0161te')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469317312751454)
,p_name=>'APEX.IG.SERIES_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Serija'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393524428751432)
,p_name=>'APEX.IG.SHOW'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei')
,p_is_js_message=>true
,p_version_scn=>2704924
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448732091751448)
,p_name=>'APEX.IG.SHOW_OVERALL_VALUE'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei ukupnu vrijednost')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433677199751444)
,p_name=>'APEX.IG.SINGLE_ROW_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Prikaz jednog retka'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139431924651751443)
,p_name=>'APEX.IG.SORT'
,p_message_language=>'hr'
,p_message_text=>'Sortiraj'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469448930751454)
,p_name=>'APEX.IG.SORT_BY'
,p_message_language=>'hr'
,p_message_text=>unistr('Na\010Din sortiranja')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488806918751460)
,p_name=>'APEX.IG.SORT_ONLY_ONE_PER_COLUMN'
,p_message_language=>'hr'
,p_message_text=>unistr('Mo\017Eete definirati samo jedno sortiranje po stupcu.')
,p_is_js_message=>true
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488682176751460)
,p_name=>'APEX.IG.SRV_CHANGE_MENU'
,p_message_language=>'hr'
,p_message_text=>'Promjena'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139470463832751455)
,p_name=>'APEX.IG.STACK'
,p_message_language=>'hr'
,p_message_text=>'Stog'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139425938188751442)
,p_name=>'APEX.IG.STARTS_WITH'
,p_message_language=>'hr'
,p_message_text=>unistr('zapo\010Dinje s')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469090897751454)
,p_name=>'APEX.IG.STOCK'
,p_message_language=>'hr'
,p_message_text=>'Burzovni'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388387181751431)
,p_name=>'APEX.IG.STRETCH_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>unistr('Rastegni \0161irinu stupca')
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139432366113751443)
,p_name=>'APEX.IG.SUBSCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Pretplata'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450346027751449)
,p_name=>'APEX.IG.SUM'
,p_message_language=>'hr'
,p_message_text=>'Zbroj'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490175092751461)
,p_name=>'APEX.IG.SUMMARY'
,p_message_language=>'hr'
,p_message_text=>unistr('Interaktivna re\0161etka. Izvje\0161\0107e: %0, prikaz: %1.')
,p_is_js_message=>true
,p_version_scn=>2704939
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139484223913751459)
,p_name=>'APEX.IG.SUM_OVERALL'
,p_message_language=>'hr'
,p_message_text=>'Ukupni zbroj'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467210346751454)
,p_name=>'APEX.IG.TARGET_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Cilj'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473606323751456)
,p_name=>'APEX.IG.TEXT_COLOR'
,p_message_language=>'hr'
,p_message_text=>'Boja teksta'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398638153751434)
,p_name=>'APEX.IG.TOGGLE'
,p_message_language=>'hr'
,p_message_text=>'Prebacivanje'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280701410751399)
,p_name=>'APEX.IG.TOOLBAR'
,p_message_language=>'hr'
,p_message_text=>unistr('Re\0161etka')
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448621908751448)
,p_name=>'APEX.IG.TOOLTIP'
,p_message_language=>'hr'
,p_message_text=>'Opis alata'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139429100171751443)
,p_name=>'APEX.IG.TYPE'
,p_message_language=>'hr'
,p_message_text=>'Vrsta'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139433544487751444)
,p_name=>'APEX.IG.UNFREEZE'
,p_message_language=>'hr'
,p_message_text=>'Odmrzni'
,p_is_js_message=>true
,p_version_scn=>2704931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430643329751443)
,p_name=>'APEX.IG.UNIT'
,p_message_language=>'hr'
,p_message_text=>'Jedinica'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139476564321751456)
,p_name=>'APEX.IG.UNSAVED_CHANGES_CONTINUE_CONFIRM'
,p_message_language=>'hr'
,p_message_text=>unistr('Postoje promjene koje nisu spremljene. \017Delite li nastaviti?')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139430540420751443)
,p_name=>'APEX.IG.VALUE'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466387909751453)
,p_name=>'APEX.IG.VALUE_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471293428751455)
,p_name=>'APEX.IG.VALUE_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost je obavezna.'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456463094751451)
,p_name=>'APEX.IG.VALUE_TIMESTAMP_TZ'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrijednost (vremenska zona ne mo\017Ee se promijeniti)')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475174220751456)
,p_name=>'APEX.IG.VARCHAR2'
,p_message_language=>'hr'
,p_message_text=>'Tekst'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467696791751454)
,p_name=>'APEX.IG.VERTICAL'
,p_message_language=>'hr'
,p_message_text=>'Okomito'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428624932751442)
,p_name=>'APEX.IG.VIEW'
,p_message_language=>'hr'
,p_message_text=>'Prikaz'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363734968751423)
,p_name=>'APEX.IG.VIEW_MODE_DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Mre\017Ea u na\010Dinu prikaza, pritisnite za ure\0111ivanje')
,p_is_js_message=>true
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465662272751453)
,p_name=>'APEX.IG.VISIBLE'
,p_message_language=>'hr'
,p_message_text=>'Prikazano'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139467119395751454)
,p_name=>'APEX.IG.VOLUME_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Opseg'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426536937751442)
,p_name=>'APEX.IG.WEEKS'
,p_message_language=>'hr'
,p_message_text=>'tj.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465781631751453)
,p_name=>'APEX.IG.WIDTH'
,p_message_language=>'hr'
,p_message_text=>unistr('Minimalna \0161irina stupca (pikseli)')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417770612751439)
,p_name=>'APEX.IG.X.BETWEEN.Y.AND.Z'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 izme\0111u %1 i %2')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417491679751439)
,p_name=>'APEX.IG.X.CONTAINS.Y'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 sadr\017Ei %1')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417530313751439)
,p_name=>'APEX.IG.X.DOES_NOT_CONTAIN.Y'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 ne sadr\017Ei %1')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392907651751432)
,p_name=>'APEX.IG.X.DOES_NOT_START_WITH.Y'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 ne zapo\010Dinje s %1')
,p_is_js_message=>true
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416263312751439)
,p_name=>'APEX.IG.X.EQUALS.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 jednako %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416458915751439)
,p_name=>'APEX.IG.X.GREATER_THAN.Y'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 ve\0107e od %1')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416510748751439)
,p_name=>'APEX.IG.X.GREATER_THAN_OR_EQUALS.Y'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 ve\0107e od ili jednako %1')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417294387751439)
,p_name=>'APEX.IG.X.IN.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 u %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418456879751439)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.DAYS'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom intervalu od %1 dana'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418205213751439)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.HOURS'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom intervalu od %1 h'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418047421751439)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MINUTES'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom intervalu od %1 min'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418871570751440)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.MONTHS'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom intervalu od %1 mj.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418654575751439)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.WEEKS'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom intervalu od %1 tj.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419013344751440)
,p_name=>'APEX.IG.X.IN_THE_LAST.Y.YEARS'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom intervalu od %1 god.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418384806751439)
,p_name=>'APEX.IG.X.IN_THE_LAST_DAY'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom danu'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418119774751439)
,p_name=>'APEX.IG.X.IN_THE_LAST_HOUR'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom satu'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417966106751439)
,p_name=>'APEX.IG.X.IN_THE_LAST_MINUTE'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnoj minuti'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418795295751440)
,p_name=>'APEX.IG.X.IN_THE_LAST_MONTH'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom mjesecu'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418570617751439)
,p_name=>'APEX.IG.X.IN_THE_LAST_WEEK'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom tjednu'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139418939331751440)
,p_name=>'APEX.IG.X.IN_THE_LAST_YEAR'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnoj godini'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420827159751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.DAYS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em intervalu od %1 dana')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420664038751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.HOURS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em intervalu od %1 h')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420466900751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em intervalu od %1 min')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421212374751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em intervalu od %1 mj.')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421057084751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em intervalu od %1 tj.')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421458268751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT.Y.YEARS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em intervalu od %1 god.')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420796458751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT_DAY'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em danu')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420523930751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT_HOUR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em satu')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420365224751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MINUTE'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107oj minuti')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421131252751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT_MONTH'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em mjesecu')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420913590751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT_WEEK'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em tjednu')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421393761751440)
,p_name=>'APEX.IG.X.IN_THE_NEXT_YEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107oj godini')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416931580751439)
,p_name=>'APEX.IG.X.IS_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'%0 nije prazno'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416824937751439)
,p_name=>'APEX.IG.X.IS_NULL'
,p_message_language=>'hr'
,p_message_text=>'%0 je prazno'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416663475751439)
,p_name=>'APEX.IG.X.LESS_THAN.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 manje od %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416743263751439)
,p_name=>'APEX.IG.X.LESS_THAN_OR_EQUALS.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 manje od ili jednako %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417076339751439)
,p_name=>'APEX.IG.X.LIKE.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 poput %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417648416751439)
,p_name=>'APEX.IG.X.MATCHES_REGULAR_EXPRESSION.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 odgovara regularnom izrazu %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423539675751441)
,p_name=>'APEX.IG.X.MINUTES_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 min'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417875717751439)
,p_name=>'APEX.IG.X.NOT_BETWEEN.Y.AND.Z'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije izme\0111u %1 i %2')
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416380976751439)
,p_name=>'APEX.IG.X.NOT_EQUALS.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 nije jednako %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417392716751439)
,p_name=>'APEX.IG.X.NOT_IN.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 nije %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419601756751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.DAYS'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom intervalu od %1 dana'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419424206751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.HOURS'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom intervalu od %1 h'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419287734751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MINUTES'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom intervalu od %1 min'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420069104751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.MONTHS'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom intervalu od %1 mj.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419840102751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.WEEKS'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom intervalu od %1 tj.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420219863751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST.Y.YEARS'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom intervalu od %1 god.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419523037751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_DAY'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom danu'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419317451751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_HOUR'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodom satu'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419161255751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MINUTE'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnoj minuti'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419986374751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_MONTH'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom mjesecu'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139419793870751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_WEEK'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom tjednu'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139420183317751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_LAST_YEAR'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnoj godini'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422068753751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.DAYS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em intervalu od %1 dana')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421829192751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.HOURS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em intervalu od %1 h')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421633933751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MINUTES'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em intervalu od %1 min')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422465099751441)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.MONTHS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em intervalu od %1 mjeseci')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422206883751441)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.WEEKS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em intervalu od %1 tj.')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422665128751441)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT.Y.YEARS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em intervalu od %1 god.')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421945508751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_DAY'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em danu')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421741889751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_HOUR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em satu')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139421515444751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MINUTE'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107oj minuti')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422332088751441)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_MONTH'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em mjesecu')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422102911751440)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_WEEK'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em tjednu')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422564328751441)
,p_name=>'APEX.IG.X.NOT_IN_THE_NEXT_YEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107oj godini')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139417166775751439)
,p_name=>'APEX.IG.X.NOT_LIKE.Y'
,p_message_language=>'hr'
,p_message_text=>'%0 nije poput %1'
,p_is_js_message=>true
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139424095074751441)
,p_name=>'APEX.IG.X.STARTS_WITH.Y'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 zapo\010Dinje s %1')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466495049751453)
,p_name=>'APEX.IG.X_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'X'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426764056751442)
,p_name=>'APEX.IG.YEARS'
,p_message_language=>'hr'
,p_message_text=>'godine'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466560478751454)
,p_name=>'APEX.IG.Y_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Y'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466680454751454)
,p_name=>'APEX.IG.Z_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Z'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475626830751456)
,p_name=>'APEX.IG_FORMAT_SAMPLE_1'
,p_message_language=>'hr'
,p_message_text=>unistr('Ponedjeljak, 12. sije\010Dnja 2016.')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475748878751456)
,p_name=>'APEX.IG_FORMAT_SAMPLE_2'
,p_message_language=>'hr'
,p_message_text=>unistr('Sije\010Danj')
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475812020751456)
,p_name=>'APEX.IG_FORMAT_SAMPLE_3'
,p_message_language=>'hr'
,p_message_text=>'Prije 16 sati'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139475963366751456)
,p_name=>'APEX.IG_FORMAT_SAMPLE_4'
,p_message_language=>'hr'
,p_message_text=>'za 16 h'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293984020751403)
,p_name=>'APEX.ITEM.CROPPER.APPLY'
,p_message_language=>'hr'
,p_message_text=>'Primijeni'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285901843751400)
,p_name=>'APEX.ITEM.CROPPER.HELP.TEXT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Povucite ikonu i upotrijebite kliza\010D za zumiranje kako biste promijenili njezin polo\017Eaj u okviru.</p>'),
'',
unistr('<p>Kada je fokus na alatu za izrezivanje slika, dostupni su sljede\0107i tipkovni pre\010Daci:</p>'),
'<ul>',
'    <li>Lijeva strelica: premjesti sliku ulijevo*</li>',
'    <li>Strelica prema gore: Premjesti sliku prema gore*</li>',
'    <li>Desna strelica: Premjesti sliku udesno*</li>',
'    <li>Strelica prema dolje: Premjesti sliku prema dolje*</li>',
unistr('    <li>I: Uve\0107aj</li>'),
'    <li>O: Smanji</li>',
'    <li>L: Zakreni ulijevo</li>',
'    <li>R: Zakreni udesno</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Dr\017Eite Shift za br\017Ee kretanje</em></p>')))
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286161835751400)
,p_name=>'APEX.ITEM.CROPPER.HELP.TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za izrezivanje slike')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294034488751403)
,p_name=>'APEX.ITEM.CROPPER.RESET'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286440225751400)
,p_name=>'APEX.ITEM.CROPPER.TITLE'
,p_message_language=>'hr'
,p_message_text=>'Izrezivanje slike'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294117514751403)
,p_name=>'APEX.ITEM.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomaknite pokaziva\010D za pode\0161avanje razine zumiranja')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323746570751411)
,p_name=>'APEX.ITEM.FILE.ACCEPTED_TYPES'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta datoteke nije valjana. Podr\017Eane vrste datoteke: %0.')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458192046751451)
,p_name=>'APEX.ITEM.FILE.BROWSE'
,p_message_language=>'hr'
,p_message_text=>'Pregled'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457897034751451)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILE'
,p_message_language=>'hr'
,p_message_text=>'Odabir datoteke'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457950432751451)
,p_name=>'APEX.ITEM.FILE.CHOOSE_FILES'
,p_message_language=>'hr'
,p_message_text=>'Odabir datoteka'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323516112751411)
,p_name=>'APEX.ITEM.FILE.DROP_FILE'
,p_message_language=>'hr'
,p_message_text=>'Povuci i ispusti'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323975414751411)
,p_name=>'APEX.ITEM.FILE.DROP_FILES'
,p_message_language=>'hr'
,p_message_text=>'Povuci i ispusti datoteke'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325306812751412)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILE'
,p_message_language=>'hr'
,p_message_text=>'Odaberite datoteku ili je ovdje ispustite.'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325410304751412)
,p_name=>'APEX.ITEM.FILE.DROP_OR_CHOOSE_FILES'
,p_message_language=>'hr'
,p_message_text=>'Odaberite datoteke ili ih ovdje ispustite.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325587688751412)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILE'
,p_message_language=>'hr'
,p_message_text=>'Odaberite datoteku ili je ovdje ispustite.'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325605497751412)
,p_name=>'APEX.ITEM.FILE.DROP_OR_SELECT_FILES'
,p_message_language=>'hr'
,p_message_text=>'Odaberite datoteke ili ih ovdje ispustite.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323861270751411)
,p_name=>'APEX.ITEM.FILE.FILES_WITH_COUNT'
,p_message_language=>'hr'
,p_message_text=>'%0 datoteke'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323604103751411)
,p_name=>'APEX.ITEM.FILE.MAX_FILE_SIZE'
,p_message_language=>'hr'
,p_message_text=>unistr('Datoteka je prevelika. Maksimalna veli\010Dina datoteke iznosi %0.')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304171710751406)
,p_name=>'APEX.ITEM.FILE.MULTIPLE_FILES_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Prijenosi vi\0161e datoteka nisu podr\017Eani.')
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287005030751401)
,p_name=>'APEX.ITEM.FILE.REMOVE'
,p_message_language=>'hr'
,p_message_text=>'Ukloni'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292569162751402)
,p_name=>'APEX.ITEM.GEOCODE.ADDRESS_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Adresa je obavezna.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291484451751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_CITY'
,p_message_language=>'hr'
,p_message_text=>'Grad'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291800130751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_COUNTRY'
,p_message_language=>'hr'
,p_message_text=>unistr('\0160ifra dr\017Eave')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291536022751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER'
,p_message_language=>'hr'
,p_message_text=>unistr('Ku\0107ni broj')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292465645751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LATITUDE'
,p_message_language=>'hr'
,p_message_text=>unistr('\0160irina')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292374297751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_LONGITUDE'
,p_message_language=>'hr'
,p_message_text=>unistr('Du\017Eina')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292277094751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MAPLINK'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei na karti')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291985364751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE'
,p_message_language=>'hr'
,p_message_text=>'Rezultat'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291680089751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_POSTALCODE'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161tanski broj')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291781779751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STATE'
,p_message_language=>'hr'
,p_message_text=>'Stanje'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291306898751402)
,p_name=>'APEX.ITEM.GEOCODE.COLUMN_STREET'
,p_message_language=>'hr'
,p_message_text=>'Ulica'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291247793751402)
,p_name=>'APEX.ITEM.GEOCODE.DIALOG_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Rezultati geokodiranja'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322703296751411)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_DONE'
,p_message_language=>'hr'
,p_message_text=>'Geokodirano'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322807790751411)
,p_name=>'APEX.ITEM.GEOCODE.GEOCODING_OPEN'
,p_message_language=>'hr'
,p_message_text=>'Nije geokodirano'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292139154751402)
,p_name=>'APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Mapiranje'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292026663751402)
,p_name=>'APEX.ITEM.GEOCODE.NO_DATA_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Adresa nije prona\0111ena.')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292623279751402)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'%0 je obavezna vrijednost.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139398866159751434)
,p_name=>'APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost je za %0 ili %1 obavezna.'
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488370955751460)
,p_name=>'APEX.ITEM.HELP_TEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Prikaz teksta pomo\0107i za %0.')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294305437751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'hr'
,p_message_text=>'Odaberite sliku'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294441098751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.CHOOSE_FILES'
,p_message_language=>'hr'
,p_message_text=>'Odabir slika'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294237249751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DOWNLOAD_LINK_TEXT'
,p_message_language=>'hr'
,p_message_text=>'Preuzmi'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294584665751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILE'
,p_message_language=>'hr'
,p_message_text=>'Povuci i ispusti'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294607257751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_FILES'
,p_message_language=>'hr'
,p_message_text=>'Povucite i ispustite slike'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294722823751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILE'
,p_message_language=>'hr'
,p_message_text=>'Odaberite sliku ili je ovdje ispustite.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294832302751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_CHOOSE_FILES'
,p_message_language=>'hr'
,p_message_text=>'Odaberite slike ili ih ovdje ispustite.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139294956633751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILE'
,p_message_language=>'hr'
,p_message_text=>'Odaberite sliku ili je ovdje ispustite.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295031914751403)
,p_name=>'APEX.ITEM.IMAGE_UPLOAD.DROP_OR_SELECT_FILES'
,p_message_language=>'hr'
,p_message_text=>'Odaberite slike ili ih ovdje ispustite.'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379790044751428)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.CHECKED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ozna\010Deno')
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379863939751428)
,p_name=>'APEX.ITEM_TYPE.CHECKBOX.UNCHECKED'
,p_message_language=>'hr'
,p_message_text=>unistr('Neozna\010Deno')
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407301114751436)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_COMBOBOX'
,p_message_language=>'hr'
,p_message_text=>unistr('Prazni okvir s popisom samo za \010Ditanje')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405107505751436)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.EMPTY_READONLY_LISTBOX'
,p_message_language=>'hr'
,p_message_text=>unistr('Prazni okvir s popisom samo za \010Ditanje')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139404952223751435)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_COMBOBOX'
,p_message_language=>'hr'
,p_message_text=>unistr('Kombinirani okvir samo za \010Ditanje')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405017097751435)
,p_name=>'APEX.ITEM_TYPE.SELECT_LIST.READONLY_LISTBOX'
,p_message_language=>'hr'
,p_message_text=>unistr('Okvir s popisom samo za \010Ditanje')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320706404751411)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# nije u valjanom rasponu od %0 do %1.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320887484751411)
,p_name=>'APEX.ITEM_TYPE.SLIDER.VALUE_NOT_MULTIPLE_OF_STEP'
,p_message_language=>'hr'
,p_message_text=>unistr('#LABEL# nije vi\0161ekratnik %0.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408120214751436)
,p_name=>'APEX.ITEM_TYPE.SWITCH.READONLY_SWITCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Prekida\010D samo za \010Ditanje')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348783394751419)
,p_name=>'APEX.ITEM_TYPE.TEXT.READONLY_WITH_LINK'
,p_message_language=>'hr'
,p_message_text=>unistr('Ure\0111ivanje samo za \010Ditanje s vezom')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320339603751410)
,p_name=>'APEX.ITEM_TYPE.YES_NO.INVALID_VALUE'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# mora odgovarati vrijednostima %0 i %1.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320583331751410)
,p_name=>'APEX.ITEM_TYPE.YES_NO.NO_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Ne'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406838092751436)
,p_name=>'APEX.ITEM_TYPE.YES_NO.OFF_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Isklju\010Deno')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406970018751436)
,p_name=>'APEX.ITEM_TYPE.YES_NO.ON_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Deno')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320457821751410)
,p_name=>'APEX.ITEM_TYPE.YES_NO.YES_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Da'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328349757751413)
,p_name=>'APEX.LANGUAGE_SELECTOR'
,p_message_language=>'hr'
,p_message_text=>'Odabir jezika'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264761355751394)
,p_name=>'APEX.LIST_MANAGER.ADD_ENTRY'
,p_message_language=>'hr'
,p_message_text=>'Dodaj unos'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441545316751446)
,p_name=>'APEX.LIST_MANAGER.BUTTON_ADD'
,p_message_language=>'hr'
,p_message_text=>'Dodaj'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441628801751446)
,p_name=>'APEX.LIST_MANAGER.BUTTON_REMOVE'
,p_message_language=>'hr'
,p_message_text=>'Ukloni'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264897396751394)
,p_name=>'APEX.LIST_MANAGER.SELECTED_ENTRY'
,p_message_language=>'hr'
,p_message_text=>'Odabrani unosi'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445371498751447)
,p_name=>'APEX.LTO.ADVANCED'
,p_message_language=>'hr'
,p_message_text=>'Napredno'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445602330751447)
,p_name=>'APEX.LTO.CANCEL'
,p_message_language=>'hr'
,p_message_text=>'Odustani'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445416115751447)
,p_name=>'APEX.LTO.COMMON'
,p_message_language=>'hr'
,p_message_text=>unistr('Uobi\010Dajeno')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445702916751447)
,p_name=>'APEX.LTO.LIVE_TEMPLATE_OPTIONS'
,p_message_language=>'hr'
,p_message_text=>unistr('Aktivne opcije predlo\0161ka')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446300029751448)
,p_name=>'APEX.LTO.NOT_APPLICABLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Opcije predlo\0161ka nisu dostupne jer se ta komponenta ne prikazuje na stranici.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445221209751447)
,p_name=>'APEX.LTO.NO_OPTIONS_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Opcije predlo\0161ka nisu prona\0111ene.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445509155751447)
,p_name=>'APEX.LTO.SAVE'
,p_message_language=>'hr'
,p_message_text=>'Spremi'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299348023751404)
,p_name=>'APEX.MAPS.CLEAR_CIRCLE'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Disti krug')
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301736610751405)
,p_name=>'APEX.MAPS.CUSTOM_STYLES_INVALID_JSON'
,p_message_language=>'hr'
,p_message_text=>unistr('Prilago\0111eni stilovi nisu valjani JSON.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299611805751404)
,p_name=>'APEX.MAPS.DISTANCE_TOOL'
,p_message_language=>'hr'
,p_message_text=>'Alat za udaljenost'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299472535751404)
,p_name=>'APEX.MAPS.DRAW_CIRCLE'
,p_message_language=>'hr'
,p_message_text=>'Nacrtaj krug'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279206103751398)
,p_name=>'APEX.MAPS.FIND_MY_LOCATION'
,p_message_language=>'hr'
,p_message_text=>'Trenutna lokacija'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285612698751400)
,p_name=>'APEX.MAPS.INIT_POINT_COORDINATES_INVALID'
,p_message_language=>'hr'
,p_message_text=>unistr('Koordinate po\010Detnog polo\017Eaja nisu valjane.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274626404751397)
,p_name=>'APEX.MAPS.INIT_POINT_GEOMETRY_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\010Detni polo\017Eaj mora biti geometrija to\010Dke.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283277974751400)
,p_name=>'APEX.MAPS.KM'
,p_message_language=>'hr'
,p_message_text=>'km'
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278465523751398)
,p_name=>'APEX.MAPS.LAYER'
,p_message_language=>'hr'
,p_message_text=>'Sloj'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448826690751448)
,p_name=>'APEX.MAPS.LAYER_NAME'
,p_message_language=>'hr'
,p_message_text=>'Sloj: %0'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297668338751404)
,p_name=>'APEX.MAPS.MAP'
,p_message_language=>'hr'
,p_message_text=>'Mapiranje'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267398262751395)
,p_name=>'APEX.MAPS.MAP_MESSAGES'
,p_message_language=>'hr'
,p_message_text=>'Poruke'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283428146751400)
,p_name=>'APEX.MAPS.MILES'
,p_message_language=>'hr'
,p_message_text=>'milje'
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447840400751448)
,p_name=>'APEX.MAPS.MORE_DATA_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Podaci sadr\017Ee vi\0161e od sljede\0107eg broj redaka: %0, \0161to je vi\0161e od dopu\0161tenog maksimalnog broja.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277775119751398)
,p_name=>'APEX.MAPS.ORACLE_MAP_COPYRIGHT'
,p_message_language=>'hr'
,p_message_text=>'&copy; 2022 Oracle Corporation &nbsp;&nbsp; <a rel="noopener noreferrer" target="_blank" href="https://elocation.oracle.com/elocation/legal.html">Uvjeti</a> &nbsp;&nbsp; Kartografski podaci &copy; 2021 HERE'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274348693751397)
,p_name=>'APEX.MAPS.ORACLE_SDO_GEOMETRY_NOT_AVAILABLE'
,p_message_language=>'hr'
,p_message_text=>'SDO_GEOMETRY vrsta podataka nije dostupna u ovoj bazi podataka.'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277859173751398)
,p_name=>'APEX.MAPS.OSM_MAP_COPYRIGHT'
,p_message_language=>'hr'
,p_message_text=>'<a rel="noopener noreferrer" target="_blank" href="http://openmaptiles.org"> &copy; OpenMapTiles </a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap suradnici </a>'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302435232751405)
,p_name=>'APEX.MAPS.OSM_VECTOR_MAP_COPYRIGHT'
,p_message_language=>'hr'
,p_message_text=>'<a rel="noopener noreferrer" target="blank" href="https://www.maptiler.com/copyright"> &copy; MapTiler</a> &nbsp; <a rel="noopener noreferrer" target="_blank" href="https://www.openstreetmap.org/copyright"> &copy; OpenStreetMap suradnici </a>'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278647674751398)
,p_name=>'APEX.MAPS.POINTS'
,p_message_language=>'hr'
,p_message_text=>unistr('To\010Dke')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448970982751448)
,p_name=>'APEX.MAPS.POINTS_COUNT'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 - to\010Dke')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299591358751404)
,p_name=>'APEX.MAPS.RECTANGLE_ZOOM'
,p_message_language=>'hr'
,p_message_text=>'Pravokutno zumiranje'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299299657751404)
,p_name=>'APEX.MAPS.REMOVE_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Ukloni'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279052854751398)
,p_name=>'APEX.MAPS.RESET_BEARING_TO_NORTH'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi smjer na Sjever'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393880650751432)
,p_name=>'APEX.MAPS.TOGGLE_2D_MODE'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Di 2D na\010Din rada')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393962267751432)
,p_name=>'APEX.MAPS.TOGGLE_3D_MODE'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Di 3D na\010Din rada')
,p_is_js_message=>true
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299176524751404)
,p_name=>'APEX.MAPS.TOGGLE_COPYRIGHT'
,p_message_language=>'hr'
,p_message_text=>'Promjena obavijesti o autorskim pravima'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299711192751404)
,p_name=>'APEX.MAPS.TOTAL_DISTANCE'
,p_message_language=>'hr'
,p_message_text=>'Ukupna udaljenost'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278740705751398)
,p_name=>'APEX.MAPS.ZOOM_IN'
,p_message_language=>'hr'
,p_message_text=>unistr('Pove\0107aj')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278925218751398)
,p_name=>'APEX.MAPS.ZOOM_OUT'
,p_message_language=>'hr'
,p_message_text=>'Smanji'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443415128751447)
,p_name=>'APEX.MARKDOWN.BOLD'
,p_message_language=>'hr'
,p_message_text=>'Podebljano'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444309894751447)
,p_name=>'APEX.MARKDOWN.IMAGE'
,p_message_language=>'hr'
,p_message_text=>'Slika'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443952135751447)
,p_name=>'APEX.MARKDOWN.INLINE_CODE'
,p_message_language=>'hr'
,p_message_text=>'Inline kod'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456658396751451)
,p_name=>'APEX.MARKDOWN.INSERT_IMAGE'
,p_message_language=>'hr'
,p_message_text=>'Umetni sliku'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456736027751451)
,p_name=>'APEX.MARKDOWN.INSERT_LINK'
,p_message_language=>'hr'
,p_message_text=>'Umetni vezu'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443500600751447)
,p_name=>'APEX.MARKDOWN.ITALIC'
,p_message_language=>'hr'
,p_message_text=>'Kurziv'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457306100751451)
,p_name=>'APEX.MARKDOWN.LINK'
,p_message_language=>'hr'
,p_message_text=>'Veza'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444251872751447)
,p_name=>'APEX.MARKDOWN.LIST'
,p_message_language=>'hr'
,p_message_text=>'Popis'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444115973751447)
,p_name=>'APEX.MARKDOWN.ORDERED_LIST'
,p_message_language=>'hr'
,p_message_text=>'Razvrstani popis'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443612136751447)
,p_name=>'APEX.MARKDOWN.PREVIEW'
,p_message_language=>'hr'
,p_message_text=>'Pregled'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443733304751447)
,p_name=>'APEX.MARKDOWN.PREVIEW_EMPTY'
,p_message_language=>'hr'
,p_message_text=>unistr('Ni\0161ta za pregled')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443880047751447)
,p_name=>'APEX.MARKDOWN.STRIKETHROUGH'
,p_message_language=>'hr'
,p_message_text=>'Precrtano'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444023303751447)
,p_name=>'APEX.MARKDOWN.UNORDERED_LIST'
,p_message_language=>'hr'
,p_message_text=>'Nerazvrstani popis'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422967861751441)
,p_name=>'APEX.MENU.CURRENT_MENU'
,p_message_language=>'hr'
,p_message_text=>'trenutno'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139479113517751457)
,p_name=>'APEX.MENU.OVERFLOW_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Vi\0161e...')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139422849016751441)
,p_name=>'APEX.MENU.PROCESSING'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditavanje')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337055390751415)
,p_name=>'APEX.MENU.SPLIT_BUTTON'
,p_message_language=>'hr'
,p_message_text=>'Podijeljeni gumb'
,p_is_js_message=>true
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336963589751415)
,p_name=>'APEX.MENU.SPLIT_MENU'
,p_message_language=>'hr'
,p_message_text=>'Podijeljeni izbornik'
,p_is_js_message=>true
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453906585751450)
,p_name=>'APEX.NOTIFICATION_MESSAGE_HEADING'
,p_message_language=>'hr'
,p_message_text=>'Poruka obavijesti'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278081858751398)
,p_name=>'APEX.NO_DATA_FOUND_ENTITY'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije prona\0111en')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427902425751442)
,p_name=>'APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# mora biti broj manji od ili jednak %0.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428047611751442)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# mora biti valjani broj.'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428107553751442)
,p_name=>'APEX.NUMBER_FIELD.VALUE_INVALID2'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# ne odgovara formatu broja %0 (primjer: %1).'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427861605751442)
,p_name=>'APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE'
,p_message_language=>'hr'
,p_message_text=>unistr('#LABEL# mora biti broj ve\0107i od ili jednak %0.')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427723196751442)
,p_name=>'APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX'
,p_message_language=>'hr'
,p_message_text=>unistr('#LABEL# mora biti broj izme\0111u %0 i %1.')
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423065104751441)
,p_name=>'APEX.OPENS_IN_NEW_WINDOW_LOWER'
,p_message_language=>'hr'
,p_message_text=>'otvara se u novom prozoru'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372856818751426)
,p_name=>'APEX.PAGE.DUPLICATE_SUBMIT'
,p_message_language=>'hr'
,p_message_text=>unistr('Stranica je ve\0107 poslana i ne mo\017Ee se ponovo poslati.')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354251947751420)
,p_name=>'APEX.PAGE.NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Aplikacija "%0" - stranica "%1" nije prona\0111ena.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389777139751431)
,p_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'#LABEL# mora imati vrijednost.'
,p_is_js_message=>true
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280496386751399)
,p_name=>'APEX.PASSWORD.HIDE_PASSWORD'
,p_message_language=>'hr'
,p_message_text=>'Sakrij lozinku'
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280361601751399)
,p_name=>'APEX.PASSWORD.SHOW_PASSWORD'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei lozinku')
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327909562751413)
,p_name=>'APEX.POPUP.SEARCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441975839751446)
,p_name=>'APEX.POPUP_LOV.BUTTON_CLOSE'
,p_message_language=>'hr'
,p_message_text=>'Zatvori'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441827617751446)
,p_name=>'APEX.POPUP_LOV.BUTTON_FIND'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111i%0')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442130381751446)
,p_name=>'APEX.POPUP_LOV.BUTTON_NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442090591751446)
,p_name=>'APEX.POPUP_LOV.BUTTON_PREV'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318770861751410)
,p_name=>'APEX.POPUP_LOV.FILTER_REQ'
,p_message_language=>'hr'
,p_message_text=>unistr('Unesite pojam za pretra\017Eivanje s najmanje sljede\0107im brojem znakova: %0.')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395000931751433)
,p_name=>'APEX.POPUP_LOV.ICON_TEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sko\010Dni popis vrijednosti: %0')
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318872304751410)
,p_name=>'APEX.POPUP_LOV.INITIAL_FILTER_REQ'
,p_message_language=>'hr'
,p_message_text=>unistr('Unesite pojam za pretra\017Eivanje.')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265870288751394)
,p_name=>'APEX.POPUP_LOV.LIST_OF_VALUES'
,p_message_language=>'hr'
,p_message_text=>'Popis vrijednosti'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318623731751410)
,p_name=>'APEX.POPUP_LOV.NO_RESULTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Rezultati nisu prona\0111eni.')
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318534135751410)
,p_name=>'APEX.POPUP_LOV.REMOVE_VALUE'
,p_message_language=>'hr'
,p_message_text=>'Ukloni %0'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415739530751439)
,p_name=>'APEX.POPUP_LOV.SEARCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Uvjet pretra\017Eivanja')
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441741775751446)
,p_name=>'APEX.POPUP_LOV.TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267935955751395)
,p_name=>'APEX.PRINT.DOCGEN_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Zahtijeva %0.'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280252663751399)
,p_name=>'APEX.PRINT_REPORT.ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka tijekom ispisa izvje\0161\0107a.')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139291042143751402)
,p_name=>'APEX.PRINT_UTIL.UNABLE_TO_PRINT'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se ispisati dokument s pomo\0107u konfiguriranog poslu\017Eitelja ispisa.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313730121751408)
,p_name=>'APEX.PROCESS.INVOKE_API.PARAMETER_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri procjeni parametra %0 pri pozivanju %1. Pojedinosti potra\017Eite u zapisniku o pogre\0161kama.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452407578751449)
,p_name=>'APEX.PROCESSING'
,p_message_language=>'hr'
,p_message_text=>'Obrada'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311526718751408)
,p_name=>'APEX.PWA.DIALOG.HIDE.INSTRUCTIONS'
,p_message_language=>'hr'
,p_message_text=>'Natrag'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312613621751408)
,p_name=>'APEX.PWA.DIALOG.INTRO'
,p_message_language=>'hr'
,p_message_text=>unistr('Ovo web-mjesto ima funkciju aplikacije. Instalirajte je na svoj ure\0111aj kako biste imali najbolje mogu\0107e iskustvo.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313980463751409)
,p_name=>'APEX.PWA.DIALOG.SHOW.INSTRUCTIONS'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315520412751409)
,p_name=>'APEX.PWA.DIALOG.TITLE'
,p_message_language=>'hr'
,p_message_text=>'Instaliraj ovu aplikaciju'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300359442751405)
,p_name=>'APEX.PWA.INSTRUCTIONS'
,p_message_language=>'hr'
,p_message_text=>unistr('\010Cini se da ure\0111aj ili preglednik trenutno ne podr\017Eavaju instalaciju progresivnih web-aplikacija.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295471277751403)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP1'
,p_message_language=>'hr'
,p_message_text=>'1. Dodirnite ikonu <strong>Share</strong> (Podijeli)'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295583139751403)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP2'
,p_message_language=>'hr'
,p_message_text=>unistr('2. Pomi\010Dite se prema dolje i dodirnite <strong>Dodaj na po\010Detni zaslon</strong>')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311927898751408)
,p_name=>'APEX.PWA.INSTRUCTIONS.IOS.STEP3'
,p_message_language=>'hr'
,p_message_text=>'3. Dodirnite <strong style="color:#007AE1;">Dodaj</strong> kako biste potvrdili'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311029458751408)
,p_name=>'APEX.PWA.OFFLINE.BODY'
,p_message_language=>'hr'
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
unistr('    <h1>Ne mo\017Ee se povezati</h1>'),
unistr('    <p>\010Cini se da je do\0161lo do problema s vezom. Provjerite vezu i poku\0161ajte ponovo.</p>'),
'    <button type="button">Ponovi</button>',
'</main>',
'',
'<script>',
'    document.querySelector("button").addEventListener("click", () => {',
'        window.location.reload();',
'    });',
'</script>'))
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310952637751408)
,p_name=>'APEX.PWA.OFFLINE.TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se povezati')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357559660751421)
,p_name=>'APEX.PWA.PUSH.SUBSCRIPTION_FAILED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ovaj ure\0111aj nije uspio omogu\0107iti push obavijesti.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363084216751423)
,p_name=>'APEX.QUICK_PICK.GROUP_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Brzi odabiri za %0'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362909201751423)
,p_name=>'APEX.QUICK_PICK.LINK_ROLE'
,p_message_language=>'hr'
,p_message_text=>'Veza za brzi odabir'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139336775460751415)
,p_name=>'APEX.RADIO.VISUALLY_HIDDEN_RADIO'
,p_message_language=>'hr'
,p_message_text=>'Vizualno skriveni izborni gumb'
,p_is_js_message=>true
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280880610751399)
,p_name=>'APEX.RECORD_VIEW.TOOLBAR'
,p_message_language=>'hr'
,p_message_text=>'Prikaz jednog retka'
,p_is_js_message=>true
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463543383751453)
,p_name=>'APEX.REGION.CSSCALENDAR.ADD'
,p_message_language=>'hr'
,p_message_text=>'Dodaj'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408835636751437)
,p_name=>'APEX.REGION.CSSCALENDAR.ALL_DAY'
,p_message_language=>'hr'
,p_message_text=>'Cijeli dan'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486498184751459)
,p_name=>'APEX.REGION.CSSCALENDAR.BUTTON.SENDEMAIL'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161alji pozivnicu')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486222404751459)
,p_name=>'APEX.REGION.CSSCALENDAR.CHOOSE_ACTION'
,p_message_language=>'hr'
,p_message_text=>'Opcije'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410635973751437)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_ALLDAY'
,p_message_language=>'hr'
,p_message_text=>'Dnevni prikaz za cijeli dan'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410495320751437)
,p_name=>'APEX.REGION.CSSCALENDAR.DAILY_TIME_SPECIFIC'
,p_message_language=>'hr'
,p_message_text=>'Dnevni prikaz za podatke s vremenom'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454620108751450)
,p_name=>'APEX.REGION.CSSCALENDAR.DAY'
,p_message_language=>'hr'
,p_message_text=>'Dan'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449659672751449)
,p_name=>'APEX.REGION.CSSCALENDAR.DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Opis'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333189827751414)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.CSV'
,p_message_language=>'hr'
,p_message_text=>'CSV'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332925624751414)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.ICALENDAR'
,p_message_language=>'hr'
,p_message_text=>'iCal'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332864131751414)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.PDF'
,p_message_language=>'hr'
,p_message_text=>'PDF'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333029562751414)
,p_name=>'APEX.REGION.CSSCALENDAR.DOWNLOAD.XML'
,p_message_language=>'hr'
,p_message_text=>'XML'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332597132751414)
,p_name=>'APEX.REGION.CSSCALENDAR.ENDDATE'
,p_message_language=>'hr'
,p_message_text=>unistr('Datum zavr\0161etka')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332768489751414)
,p_name=>'APEX.REGION.CSSCALENDAR.EVENTNAME'
,p_message_language=>'hr'
,p_message_text=>unistr('Naziv doga\0111aja')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486354700751459)
,p_name=>'APEX.REGION.CSSCALENDAR.INVITATION'
,p_message_language=>'hr'
,p_message_text=>'Pozivnica'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454732428751450)
,p_name=>'APEX.REGION.CSSCALENDAR.LIST'
,p_message_language=>'hr'
,p_message_text=>'Popis'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454413833751450)
,p_name=>'APEX.REGION.CSSCALENDAR.MONTH'
,p_message_language=>'hr'
,p_message_text=>'Mjesec'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457062760751451)
,p_name=>'APEX.REGION.CSSCALENDAR.NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471066779751455)
,p_name=>'APEX.REGION.CSSCALENDAR.NOEVENTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Nema doga\0111aja')
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486674646751459)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.FORM'
,p_message_language=>'hr'
,p_message_text=>unistr('Uredite postoje\0107i doga\0111aj.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486544135751459)
,p_name=>'APEX.REGION.CSSCALENDAR.OPTION.SEND'
,p_message_language=>'hr'
,p_message_text=>unistr('Slanje pozivnice e-po\0161tom.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457180228751451)
,p_name=>'APEX.REGION.CSSCALENDAR.PREVIOUS'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464860580751453)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161alji poruku e-po\0161te')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464603774751453)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.BUTTON'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161alji poruku e-po\0161te')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487252560751460)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Sva su polja obavezna.'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487136527751460)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.DIALOG.TITLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161alji pozivnicu')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486173871751459)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.SUBJECT'
,p_message_language=>'hr'
,p_message_text=>'Predmet'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464772480751453)
,p_name=>'APEX.REGION.CSSCALENDAR.SENDEMAIL.TO'
,p_message_language=>'hr'
,p_message_text=>'Primatelj'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332609956751414)
,p_name=>'APEX.REGION.CSSCALENDAR.STARTDATE'
,p_message_language=>'hr'
,p_message_text=>unistr('Datum po\010Detka')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462833387751452)
,p_name=>'APEX.REGION.CSSCALENDAR.TABLEFORM'
,p_message_language=>'hr'
,p_message_text=>'Obrazac na %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410204955751437)
,p_name=>'APEX.REGION.CSSCALENDAR.TIME'
,p_message_language=>'hr'
,p_message_text=>'Vrijeme'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457209965751451)
,p_name=>'APEX.REGION.CSSCALENDAR.TODAY'
,p_message_language=>'hr'
,p_message_text=>'Danas'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455235852751450)
,p_name=>'APEX.REGION.CSSCALENDAR.VIEW'
,p_message_language=>'hr'
,p_message_text=>'Prikaz'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454592831751450)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEK'
,p_message_language=>'hr'
,p_message_text=>'Tjedan'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410510877751437)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_ALLDAY'
,p_message_language=>'hr'
,p_message_text=>'Tjedni prikaz za cijeli dan'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410343289751437)
,p_name=>'APEX.REGION.CSSCALENDAR.WEEKLY_TIME_SPECIFIC'
,p_message_language=>'hr'
,p_message_text=>'Tjedni prikaz za podatke s vremenom'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455115158751450)
,p_name=>'APEX.REGION.CSSCALENDAR.YEAR'
,p_message_language=>'hr'
,p_message_text=>'Godina'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454832351751450)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Stupci...'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454922446751450)
,p_name=>'APEX.REGION.JQM_COLUMN_TOGGLE.LOAD_MORE'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditaj jo\0161...')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384349940751429)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.BACK'
,p_message_language=>'hr'
,p_message_text=>'Natrag'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325868570751412)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.LOAD_MORE'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditaj jo\0161...')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328161860751413)
,p_name=>'APEX.REGION.JQM_LIST_VIEW.SEARCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje...')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455093451751450)
,p_name=>'APEX.REGION.JQM_REFLOW.LOAD_MORE'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditaj jo\0161...')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456973528751451)
,p_name=>'APEX.REGION.NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('ID podru\010Dja %0 nije prona\0111en.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328002617751413)
,p_name=>'APEX.REGION.NO_DATA_FOUND_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Podaci nisu prona\0111eni')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355597704751421)
,p_name=>'APEX.REGION.PAGINATION.RESET_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se postaviti numeriranje stranica podru\010Dja.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319241816751410)
,p_name=>'APEX.REGION.PAGINATION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri postavljanju podru\010Dja numeriranja stranica.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449061077751448)
,p_name=>'APEX.REGION.RESPONSIVE_TABLE.COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Stupci...'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303502371751405)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.LAZY_LOADING_INCOMPATIBLE'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditavanje s odgodom nije kompatibilno s utorima u %0, \0161to je jedna (djelomi\010Dna) regija. Trebali biste onemogu\0107iti u\010Ditavanje s odgodom za ovu regiju ili premjestiti komponente utora u drugu regiju.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298867293751404)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.NO_GROUP_TEMPLATE'
,p_message_language=>'hr'
,p_message_text=>unistr('Predlo\017Eak grupe nedostaje u komponenti predlo\0161ka za %0.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293841238751403)
,p_name=>'APEX.REGION.TEMPLATE_COMPONENT.TOO_MANY_ROWS'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 je jedna (djelomi\010Dna) regija i vratila je vi\0161e redaka.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456804932751451)
,p_name=>'APEX.REGION.TYPE_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta podru\010Dja %0 nije podr\017Eana.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319177634751410)
,p_name=>'APEX.REGION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri prikazu podru\010Dja "#COMPONENT_NAME#".')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389812755751431)
,p_name=>'APEX.REGION_COLUMN_IS_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'#COLUMN_HEADER# mora imati vrijednost.'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271469026751396)
,p_name=>'APEX.REPORT_QUERY.LAYOUT_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Morate navesti izgled izvje\0161\0107a.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485711311751459)
,p_name=>'APEX.RICH_TEXT_EDITOR.ACCESSIBLE_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('%0, ure\0111iva\010D oboga\0107enog teksta')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391983642751432)
,p_name=>'APEX.RICH_TEXT_EDITOR.MAXIMUM_LENGTH_EXCEEDED'
,p_message_language=>'hr'
,p_message_text=>unistr('HTML oznake oboga\0107enog teksta prekora\010Duju maksimalnu dopu\0161tenu duljinu (stvarni broj znakova: %0, dopu\0161teni broj znakova: %1)')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301380971751405)
,p_name=>'APEX.RTE.READ_ONLY_RICH_TEXT_EDITOR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ure\0111iva\010D oboga\0107enog teksta samo za \010Ditanje')
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301284209751405)
,p_name=>'APEX.RTE.RICH_TEXT_EDITOR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ure\0111iva\010D oboga\0107enog teksta')
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301062354751405)
,p_name=>'APEX.RTE.TOOLBAR_ALIGNMENT'
,p_message_language=>'hr'
,p_message_text=>'Poravnanje'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301155099751405)
,p_name=>'APEX.RTE.TOOLBAR_EXTRAS'
,p_message_language=>'hr'
,p_message_text=>'Dodaci'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300860410751405)
,p_name=>'APEX.RTE.TOOLBAR_FONT'
,p_message_language=>'hr'
,p_message_text=>'Font'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300743755751405)
,p_name=>'APEX.RTE.TOOLBAR_FORMATTING'
,p_message_language=>'hr'
,p_message_text=>'Formatiranje'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300951080751405)
,p_name=>'APEX.RTE.TOOLBAR_LISTS'
,p_message_language=>'hr'
,p_message_text=>'Popisi'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454059045751450)
,p_name=>'APEX.RV.DELETE'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbri\0161i')
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446570626751448)
,p_name=>'APEX.RV.DUPLICATE'
,p_message_language=>'hr'
,p_message_text=>'Dupliciraj'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444875062751447)
,p_name=>'APEX.RV.EXCLUDE_HIDDEN'
,p_message_language=>'hr'
,p_message_text=>'Prikazani stupci'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444784834751447)
,p_name=>'APEX.RV.EXCLUDE_NULL'
,p_message_language=>'hr'
,p_message_text=>unistr('Isklju\010Di Null vrijednosti')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139454197700751450)
,p_name=>'APEX.RV.INSERT'
,p_message_language=>'hr'
,p_message_text=>'Dodaj'
,p_is_js_message=>true
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408464871751436)
,p_name=>'APEX.RV.MOVE_DOWN'
,p_message_language=>'hr'
,p_message_text=>'Premjesti dolje'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408591075751436)
,p_name=>'APEX.RV.MOVE_UP'
,p_message_language=>'hr'
,p_message_text=>'Premjesti gore'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444571660751447)
,p_name=>'APEX.RV.NEXT_RECORD'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445186689751447)
,p_name=>'APEX.RV.NOT_GROUPED_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Ostali stupci'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444648427751447)
,p_name=>'APEX.RV.PREV_RECORD'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444991241751447)
,p_name=>'APEX.RV.REC_X'
,p_message_language=>'hr'
,p_message_text=>'Redak %0'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445001991751447)
,p_name=>'APEX.RV.REC_XY'
,p_message_language=>'hr'
,p_message_text=>'Redak %0 od %1'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446607619751448)
,p_name=>'APEX.RV.REFRESH'
,p_message_language=>'hr'
,p_message_text=>unistr('Osvje\017Ei')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446716114751448)
,p_name=>'APEX.RV.REVERT'
,p_message_language=>'hr'
,p_message_text=>'Vrati promjene'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139444457943751447)
,p_name=>'APEX.RV.SETTINGS_MENU'
,p_message_language=>'hr'
,p_message_text=>'Postavke'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403656701751435)
,p_name=>'APEX.SAMPLE_FORMAT'
,p_message_language=>'hr'
,p_message_text=>'Na primjer, %0'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407900419751436)
,p_name=>'APEX.SAMPLE_FORMAT_SHORT'
,p_message_language=>'hr'
,p_message_text=>'Primjer: %0'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320627583751410)
,p_name=>'APEX.SEARCH.1_RESULT_FOUND'
,p_message_language=>'hr'
,p_message_text=>'1 rezultat'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317791350751410)
,p_name=>'APEX.SEARCH.N_RESULTS_FOUND'
,p_message_language=>'hr'
,p_message_text=>'Broj rezultata: %0'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369507594751425)
,p_name=>'APEX.SEARCH.PAGINATION'
,p_message_language=>'hr'
,p_message_text=>'Paginacija'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369622243751425)
,p_name=>'APEX.SEARCH.RESULTS_X_TO_Y'
,p_message_language=>'hr'
,p_message_text=>'Rezultati, %0 do %1'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265376766751394)
,p_name=>'APEX.SESSION.ALERT.CREATE_NEW'
,p_message_language=>'hr'
,p_message_text=>'Ponovna prijava'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265255899751394)
,p_name=>'APEX.SESSION.ALERT.EXPIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Sesija je zavr\0161ena')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265486110751394)
,p_name=>'APEX.SESSION.ALERT.EXTEND'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161iri')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265081020751394)
,p_name=>'APEX.SESSION.ALERT.IDLE_WARN'
,p_message_language=>'hr'
,p_message_text=>unistr('Sesija zavr\0161ava u %0. \017Delite li je produljiti?')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265154752751394)
,p_name=>'APEX.SESSION.ALERT.MAX_WARN'
,p_message_language=>'hr'
,p_message_text=>unistr('Sesija \0107e zavr\0161iti u %0 i ne mo\017Ee je se produ\017Eiti. Spremite izmjene odmah kako ne biste izgubili podatke')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464424687751453)
,p_name=>'APEX.SESSION.DB_SESSION_CLEANUP.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi \0161ifre \010Di\0161\0107enja sesije baze podataka.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354197308751420)
,p_name=>'APEX.SESSION.DB_SESSION_INIT.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi \0161ifre postavljanja sesije baze podataka.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324561005751412)
,p_name=>'APEX.SESSION.EXPIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Sesija je zavr\0161ena.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463629063751453)
,p_name=>'APEX.SESSION.EXPIRED.CLOSE_DIALOG'
,p_message_language=>'hr'
,p_message_text=>unistr('Zatvorite ovaj dijalo\0161ki okvir i pritisnite gumb za ponovno u\010Ditavanje preglednika kako biste dobili novu sesiju.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482504660751458)
,p_name=>'APEX.SESSION.EXPIRED.NEW_SESSION'
,p_message_language=>'hr'
,p_message_text=>'Ponovo se <a href="%0">prijavite</a> za stvaranje nove sesije.'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366863701751424)
,p_name=>'APEX.SESSION.NOT_VALID'
,p_message_language=>'hr'
,p_message_text=>'Sesija nije valjana'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409996071751437)
,p_name=>'APEX.SESSION.RAS.NO_DYNAMIC_ROLES'
,p_message_language=>'hr'
,p_message_text=>unistr('Za korisnika "%0" ne mogu se omogu\0107iti dinami\010Dne uloge u sesiji stvarne sigurnosti za aplikacije.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352004497751420)
,p_name=>'APEX.SESSION.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-99900 Ne mo\017Ee se stvoriti jedinstveni ID sesije: %0')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281168201751399)
,p_name=>'APEX.SESSION_STATE.CLOB_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('CLOB koji pripada vrsti podataka o stanju sesije nije dopu\0161ten za stavku %0.')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300575453751405)
,p_name=>'APEX.SESSION_STATE.CLOB_SUBSTITUTION_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Zamjena stavki za CLOB koji pripada vrsti podataka o stanju sesije nije podr\017Eana.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369343924751425)
,p_name=>'APEX.SESSION_STATE.ITEM_VALUE_PROTECTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Kr\0161enje za\0161tite stanja sesije: uzrok mo\017Ee biti ru\010Dno mijenjanje za\0161ti\0107ene stavke na stranici %0. Ako niste sigurni koji je uzrok pogre\0161ke, za pomo\0107 se obratite administratoru aplikacije.')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490509912751461)
,p_name=>'APEX.SESSION_STATE.PAGE_PROTECTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Kr\0161enje za\0161tite stranice: uzrok mo\017Ee biti podno\0161enje stranice koja se jo\0161 nije u\010Ditala ili ru\010Dno mijenjanje za\0161ti\0107enih stavki na stranici. Dodatnu pomo\0107 zatra\017Eite od administratora aplikacije.')
,p_version_scn=>2704939
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489640527751460)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 sadr\017Ei jedan od sljede\0107ih znakova koji nisu valjani: &<>"/;,*|=% ili --')
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489726448751460)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.NO_SPECIAL_CHAR_NL'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 sadr\017Ei jedan od sljede\0107ih znakova koji nisu valjani: &<>"/;,*|=% ili -- ili novi redak.')
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489466853751460)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 sadr\017Ei posebne znakova. Dopu\0161teni su samo znakovi-Z, 0-9 i razmaci.')
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489551826751460)
,p_name=>'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 sadr\017Ei znakove <, > ili " koji nisu valjani.')
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326976078751412)
,p_name=>'APEX.SESSION_STATE.SSP_CHECKSUM_MISSING'
,p_message_language=>'hr'
,p_message_text=>unistr('Kontrolni zbroj nije naveden za prikaz obrade za stranicu koja zahtijeva kontrolni zbroj kad se kao parametri proslijede jedna ili vi\0161e vrijednosti zahtjeva, \010Di\0161\0107enja cache memorije ili argumenata.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364239977751423)
,p_name=>'APEX.SESSION_STATE.SSP_VIOLATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Kr\0161enje za\0161tite stanja sesije: uzrok mo\017Ee biti ru\010Dno mijenjanje URL-a s kontrolnim zbrojem ili upotreba veze s neto\010Dnim kontrolim zbrojem ili bez kontrolnog broja. Ako niste sigurni koji je uzrok pogre\0161ke, za pomo\0107 se obratite administratoru aplikaci')
||'je.'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445871942751447)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_OFF'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavi na\010Din visokog kontrasta na isklju\010Deno')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139445962442751447)
,p_name=>'APEX.SET_HIGH_CONTRAST_MODE_ON'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavi na\010Din visokog kontrasta na uklju\010Deno')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310373330751407)
,p_name=>'APEX.SET_VALUE_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavka aplikacije %0 ne mo\017Ee se a\017Eurirati jer je pretplata za nju izvr\0161ena iz druge aplikacije.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360635863751422)
,p_name=>'APEX.SHUTTLE.CONTROL_BOTTOM'
,p_message_language=>'hr'
,p_message_text=>'Dno'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360862070751422)
,p_name=>'APEX.SHUTTLE.CONTROL_DOWN'
,p_message_language=>'hr'
,p_message_text=>'Dolje'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360927374751422)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE'
,p_message_language=>'hr'
,p_message_text=>'Premjesti'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361020900751422)
,p_name=>'APEX.SHUTTLE.CONTROL_MOVE_ALL'
,p_message_language=>'hr'
,p_message_text=>'Premjesti sve'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361157185751423)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE'
,p_message_language=>'hr'
,p_message_text=>'Ukloni'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361262405751423)
,p_name=>'APEX.SHUTTLE.CONTROL_REMOVE_ALL'
,p_message_language=>'hr'
,p_message_text=>'Ukloni sve'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361372692751423)
,p_name=>'APEX.SHUTTLE.CONTROL_RESET'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360502627751422)
,p_name=>'APEX.SHUTTLE.CONTROL_TOP'
,p_message_language=>'hr'
,p_message_text=>'Vrh'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360739312751422)
,p_name=>'APEX.SHUTTLE.CONTROL_UP'
,p_message_language=>'hr'
,p_message_text=>'Gore'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472384377751455)
,p_name=>'APEX.SINCE.SHORT.DAYS_AGO'
,p_message_language=>'hr'
,p_message_text=>'%0d'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473093106751455)
,p_name=>'APEX.SINCE.SHORT.DAYS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'za %0 d.'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472288417751455)
,p_name=>'APEX.SINCE.SHORT.HOURS_AGO'
,p_message_language=>'hr'
,p_message_text=>'%0h'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473155409751455)
,p_name=>'APEX.SINCE.SHORT.HOURS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'za %0 h'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472047057751455)
,p_name=>'APEX.SINCE.SHORT.MINUTES_AGO'
,p_message_language=>'hr'
,p_message_text=>'%0m'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473279730751455)
,p_name=>'APEX.SINCE.SHORT.MINUTES_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'za %0 mj.'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472602946751455)
,p_name=>'APEX.SINCE.SHORT.MONTHS_AGO'
,p_message_language=>'hr'
,p_message_text=>'%0 mj.'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472825072751455)
,p_name=>'APEX.SINCE.SHORT.MONTHS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'za %0 mj.'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472106465751455)
,p_name=>'APEX.SINCE.SHORT.SECONDS_AGO'
,p_message_language=>'hr'
,p_message_text=>'%0s'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472906776751455)
,p_name=>'APEX.SINCE.SHORT.SECONDS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'za %0 s'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472476802751455)
,p_name=>'APEX.SINCE.SHORT.WEEKS_AGO'
,p_message_language=>'hr'
,p_message_text=>'%0w'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139473324367751455)
,p_name=>'APEX.SINCE.SHORT.WEEKS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'za %0 tj.'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472548891751455)
,p_name=>'APEX.SINCE.SHORT.YEARS_AGO'
,p_message_language=>'hr'
,p_message_text=>'%0y'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139472767225751455)
,p_name=>'APEX.SINCE.SHORT.YEARS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'za %0 god.'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273693268751397)
,p_name=>'APEX.SPATIAL.GEOMETRY.LINE'
,p_message_language=>'hr'
,p_message_text=>'[Linija]'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274205544751397)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTILINE'
,p_message_language=>'hr'
,p_message_text=>unistr('[Vi\0161e linija]')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273984216751397)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOINT'
,p_message_language=>'hr'
,p_message_text=>unistr('[Vi\0161e to\010Daka]')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274427383751397)
,p_name=>'APEX.SPATIAL.GEOMETRY.MULTIPOLYGON'
,p_message_language=>'hr'
,p_message_text=>unistr('[Vi\0161e poligona]')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274550353751397)
,p_name=>'APEX.SPATIAL.GEOMETRY.OTHER'
,p_message_language=>'hr'
,p_message_text=>'[Geometrijski objekt]'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273550814751397)
,p_name=>'APEX.SPATIAL.GEOMETRY.POINT'
,p_message_language=>'hr'
,p_message_text=>unistr('[To\010Dka (%0,%1)]')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273823649751397)
,p_name=>'APEX.SPATIAL.GEOMETRY.POLYGON'
,p_message_language=>'hr'
,p_message_text=>'[Poligon]'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273009319751397)
,p_name=>'APEX.SPLITTER.COLLAPSED_REGION'
,p_message_language=>'hr'
,p_message_text=>unistr('Sa\017Eeta regija: %0')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388125230751430)
,p_name=>'APEX.SPLITTER.COLLAPSE_TEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sa\017Emi')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272034959751396)
,p_name=>'APEX.SPLITTER.HORIZ_CANNOT_LEFT_RIGHT'
,p_message_language=>'hr'
,p_message_text=>unistr('Vodoravni razdjelnik ne mo\017Ee se pomicati ulijevo ili udesno')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272274822751396)
,p_name=>'APEX.SPLITTER.MAX_SIZE_REACHED'
,p_message_language=>'hr'
,p_message_text=>unistr('Dosegnuta maksimalna veli\010Dina od %0px')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273293105751397)
,p_name=>'APEX.SPLITTER.MIN_SIZE_REACHED'
,p_message_language=>'hr'
,p_message_text=>unistr('Dosegnuta minimalna veli\010Dina od %0px')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273141174751397)
,p_name=>'APEX.SPLITTER.REGION_IS_COLLAPSED'
,p_message_language=>'hr'
,p_message_text=>'Regija je smanjena'
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272927059751396)
,p_name=>'APEX.SPLITTER.REGION_IS_RESTORED'
,p_message_language=>'hr'
,p_message_text=>unistr('Regija je vra\0107ena')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272699961751396)
,p_name=>'APEX.SPLITTER.RESIZED_TO'
,p_message_language=>'hr'
,p_message_text=>unistr('Veli\010Dina promijenjena na %0px')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272809813751396)
,p_name=>'APEX.SPLITTER.RESTORED_REGION'
,p_message_language=>'hr'
,p_message_text=>unistr('Vra\0107ena regija: %0')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388043720751430)
,p_name=>'APEX.SPLITTER.RESTORE_TEXT'
,p_message_language=>'hr'
,p_message_text=>'Vrati'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139272124346751396)
,p_name=>'APEX.SPLITTER.VERTICAL_CANNOT_UP_DOWN'
,p_message_language=>'hr'
,p_message_text=>unistr('Okomiti razdjelnik ne mo\017Ee se pomicati prema gore ili dolje')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437590553751445)
,p_name=>'APEX.STAR_RATING.CLEAR_RATING'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbri\0161i ocjenu')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427456450751442)
,p_name=>'APEX.STAR_RATING.INVALID_RATING_RANGE'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u valjanom rasponu ocjena od 1 - %1'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427500687751442)
,p_name=>'APEX.STAR_RATING.IS_NOT_NUMERIC'
,p_message_language=>'hr'
,p_message_text=>'%0 nije broj'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423678727751441)
,p_name=>'APEX.SUCCESS_MESSAGE_HEADING'
,p_message_language=>'hr'
,p_message_text=>'Poruka o uspjehu'
,p_is_js_message=>true
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485493788751459)
,p_name=>'APEX.TABS.NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485397966751459)
,p_name=>'APEX.TABS.PREVIOUS'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395575853751433)
,p_name=>'APEX.TASK.ACTION.DATA_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Sustav zapisa povezan s ovom instancom zadatka nije prona\0111en')
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403848780751435)
,p_name=>'APEX.TASK.ACTION.ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvr\0161avanje akcije zadatka %0 nije uspjelo - zadatak je postavljen na stanje Pogre\0161no, provjerite \0161ifru akcije zadatka')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284097837751400)
,p_name=>'APEX.TASK.ADD_COMMENT_NOT_AUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Dodaj komentar: nema ovla\0161tenja')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283333381751400)
,p_name=>'APEX.TASK.ALREADY_ASSIGNED'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak je ve\0107 dodijeljen')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276783762751398)
,p_name=>'APEX.TASK.ASSIGNED_TO_USER'
,p_message_language=>'hr'
,p_message_text=>'Dodijeljeno korisniku %0'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283045060751399)
,p_name=>'APEX.TASK.CANCEL_TASK_NOT_AUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Poni\0161ti zadatak: nema ovla\0161tenja')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298620127751404)
,p_name=>'APEX.TASK.CANNOT_REMOVE_OWNER'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se ukloniti stvarni vlasnik ovog zadatka. Delegirajte zadatak drugom sudioniku prije ponovnog poku\0161aja ove operacije.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282634920751399)
,p_name=>'APEX.TASK.CLAIM_TASK_NOT_AUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Preuzmi zadatak: nema ovla\0161tenja')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282794870751399)
,p_name=>'APEX.TASK.COMPLETE_TASK_NOT_AUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Dovr\0161i zadatak: nema ovla\0161tenja')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282854837751399)
,p_name=>'APEX.TASK.DELEGATE_TASK_NOT_AUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Delegiraj zadatak: nema ovla\0161tenja')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281290335751399)
,p_name=>'APEX.TASK.DUE_DATE_IN_PAST'
,p_message_language=>'hr'
,p_message_text=>unistr('Datum dospije\0107a zadatka ne mo\017Ee biti u pro\0161losti.')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276574336751398)
,p_name=>'APEX.TASK.DUE_SINCE'
,p_message_language=>'hr'
,p_message_text=>'Dospijeva %0'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276984836751398)
,p_name=>'APEX.TASK.EVENT.ACTION.ERROR_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Akcija zadatka %1 nije uspjela. Poruka o gre\0161ci - %0')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276654015751398)
,p_name=>'APEX.TASK.EVENT.ACTION.FAILURE'
,p_message_language=>'hr'
,p_message_text=>'Nije uspjelo'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276204459751397)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS'
,p_message_language=>'hr'
,p_message_text=>unistr('Uspje\0161no')
,p_is_js_message=>true
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276449346751397)
,p_name=>'APEX.TASK.EVENT.ACTION.SUCCESS_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Akcija %1 uspjela je uz poruku %0'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279773147751398)
,p_name=>'APEX.TASK.EVENT.BEFORE_EXPIRE'
,p_message_language=>'hr'
,p_message_text=>'Prije isteka'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305355037751406)
,p_name=>'APEX.TASK.EVENT.CANCEL'
,p_message_language=>'hr'
,p_message_text=>'Odustani'
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304866615751406)
,p_name=>'APEX.TASK.EVENT.CANCEL_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak poni\0161ten')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305494251751406)
,p_name=>'APEX.TASK.EVENT.CANCEL_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Sudionik nije ovla\0161ten poni\0161titi zadatak')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304708346751406)
,p_name=>'APEX.TASK.EVENT.CLAIM'
,p_message_language=>'hr'
,p_message_text=>unistr('Zatra\017Ei')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305141657751406)
,p_name=>'APEX.TASK.EVENT.CLAIM_ALREADY_CLAIMED'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak je ve\0107 zatra\017Eio drugi korisnik ili sudionik nije ovla\0161ten da zatra\017Ei ovaj zadatak')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304983563751406)
,p_name=>'APEX.TASK.EVENT.CLAIM_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak zatra\017Eio %0')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406013778751436)
,p_name=>'APEX.TASK.EVENT.COMPLETE'
,p_message_language=>'hr'
,p_message_text=>unistr('Dovr\0161i')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304527364751406)
,p_name=>'APEX.TASK.EVENT.COMPLETE_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak dovr\0161en s rezultatom %0')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305859493751406)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak nije dodijeljen ili sudioniku nije dopu\0161teno dovr\0161iti zadatak')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266266529751395)
,p_name=>'APEX.TASK.EVENT.COMPLETE_NO_OUTCOME'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak dovr\0161en bez ishoda')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406171448751436)
,p_name=>'APEX.TASK.EVENT.CREATE'
,p_message_language=>'hr'
,p_message_text=>'Stvori'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139299028703751404)
,p_name=>'APEX.TASK.EVENT.CREATE_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Zadatak stvoren s ID-om %0'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406257482751436)
,p_name=>'APEX.TASK.EVENT.DELEGATE'
,p_message_language=>'hr'
,p_message_text=>'Delegiraj'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304662954751406)
,p_name=>'APEX.TASK.EVENT.DELEGATE_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Zadatak delegiran potencijalnom vlasniku %0'
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305237413751406)
,p_name=>'APEX.TASK.EVENT.DELEGATE_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Sudionik nije ovla\0161ten ili novi sudionik nije potencijalni vlasnik ovog zadatka')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278379538751398)
,p_name=>'APEX.TASK.EVENT.EXPIRE'
,p_message_language=>'hr'
,p_message_text=>'Istek'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279440605751398)
,p_name=>'APEX.TASK.EVENT.EXPIRED_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Zadatak je istekao.'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406327919751436)
,p_name=>'APEX.TASK.EVENT.FAIL'
,p_message_language=>'hr'
,p_message_text=>'Neuspjeh'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275051839751397)
,p_name=>'APEX.TASK.EVENT.INFO_REQUEST.NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak nije dodijeljen ili sudioniku nije dopu\0161teno zatra\017Eiti informacije za zadatak')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275279958751397)
,p_name=>'APEX.TASK.EVENT.INFO_SUBMIT.NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Informacije nisu zatra\017Eene za zadatak ili sudioniku nije dopu\0161teno podnijeti informacije za zadatak.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278850766751398)
,p_name=>'APEX.TASK.EVENT.MAXRENEW_EXPIRED_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Istek zadataka kad se dosegne maksimalni broj obnova od %0.'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306134938751406)
,p_name=>'APEX.TASK.EVENT.NOT_ALLOWED_BUSINESS_ADMIN'
,p_message_language=>'hr'
,p_message_text=>'Zadatak nije u ispravnom stanju ili sudionik nije administrator poslovanja za taj zadatak'
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306209858751406)
,p_name=>'APEX.TASK.EVENT.NOT_APPLICABLE'
,p_message_language=>'hr'
,p_message_text=>'Operacija %0 nije poznata ili nije primjenjiva za ovaj zadatak'
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406435192751436)
,p_name=>'APEX.TASK.EVENT.RELEASE'
,p_message_language=>'hr'
,p_message_text=>'Izdaj'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392165670751432)
,p_name=>'APEX.TASK.EVENT.RELEASE_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak izdan, drugi ga sada mogu zatra\017Eiti')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285010247751400)
,p_name=>'APEX.TASK.EVENT.RELEASE_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Izdavanje zadatka nije dopu\0161teno - korisnik nije vlasnik zadatka')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302004434751405)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER'
,p_message_language=>'hr'
,p_message_text=>'Ukloni vlasnika'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302299430751405)
,p_name=>'APEX.TASK.EVENT.REMOVE_OWNER_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Sudionik %0 uklonjen iz zadatka'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279699821751398)
,p_name=>'APEX.TASK.EVENT.RENEW'
,p_message_language=>'hr'
,p_message_text=>'Obnovi'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278546698751398)
,p_name=>'APEX.TASK.EVENT.RENEW_EXPIRED_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Zadatak obnovljen s ID-om %0, maksimalni preostali broj obnova prije isteka iznosi %1.'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279550935751398)
,p_name=>'APEX.TASK.EVENT.RENEW_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'ID zadatka %0 obnovljen s ID-om zadatka %1'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275581308751397)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO'
,p_message_language=>'hr'
,p_message_text=>'Zahtjev za informacijama'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275450906751397)
,p_name=>'APEX.TASK.EVENT.REQUEST_INFO_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 - zatra\017Eeno vi\0161e informacija: %1')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273318413751397)
,p_name=>'APEX.TASK.EVENT.SET_INITIATOR_CAN_COMPLETE_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavljeni inicijator mo\017Ee dovr\0161iti na %0')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275640887751397)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO'
,p_message_language=>'hr'
,p_message_text=>'Podnesi informacije'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275323880751397)
,p_name=>'APEX.TASK.EVENT.SUBMIT_INFO_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Zatra\017Eene informacije podnesene %0: %1')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406559552751436)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT'
,p_message_language=>'hr'
,p_message_text=>unistr('A\017Euriranje komentara')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303030029751405)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Dodaj komentar: %0'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305940341751406)
,p_name=>'APEX.TASK.EVENT.UPDATE_COMMENT_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Stanje zadatka - komentari nisu dopu\0161teni')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313230076751408)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_DATE_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavite datum dospije\0107a za zadatak %0')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271324190751396)
,p_name=>'APEX.TASK.EVENT.UPDATE_DUE_ON'
,p_message_language=>'hr'
,p_message_text=>unistr('Dospije\0107e a\017Euriranja')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406641521751436)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER'
,p_message_language=>'hr'
,p_message_text=>unistr('A\017Euriraj vlasnika')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304375898751406)
,p_name=>'APEX.TASK.EVENT.UPDATE_OWNER_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Dodaj potencijalnog vlasnika %0 sudionicima zadatka'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303450394751405)
,p_name=>'APEX.TASK.EVENT.UPDATE_PARAM'
,p_message_language=>'hr'
,p_message_text=>unistr('A\017Euriranje parametara')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139406714977751436)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY'
,p_message_language=>'hr'
,p_message_text=>unistr('A\017Euriraj prioritet')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305076630751406)
,p_name=>'APEX.TASK.EVENT.UPDATE_PRIORITY_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Postavi prioritet zadatka na %0'
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302397260751405)
,p_name=>'APEX.TASK.EVENT.UPD_PARAMETER_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('A\017Euriran parametar "%0" iz "%1" u "%2".')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285886935751400)
,p_name=>'APEX.TASK.EVENT.WF_CANCEL_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak je poni\0161ten jer je prekinuta odgovaraju\0107a instanca tijeka rada.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282998698751399)
,p_name=>'APEX.TASK.FORWARD_TASK_NOT_AUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Proslijedi zadatak: nema ovla\0161tenja')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276324633751397)
,p_name=>'APEX.TASK.INITIATED_BY_USER_SINCE'
,p_message_language=>'hr'
,p_message_text=>'Pokrenuo %0 %1'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285263441751400)
,p_name=>'APEX.TASK.INTERNAL_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Do\0161lo je do neo\010Dekivane interne pogre\0161ke')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283524112751400)
,p_name=>'APEX.TASK.NOT_APPLICABLE'
,p_message_language=>'hr'
,p_message_text=>'Operacija zadatka nije primjenjiva'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309117158751407)
,p_name=>'APEX.TASK.NO_POTENTIAL_OWNER'
,p_message_language=>'hr'
,p_message_text=>'Ovaj potencijalni vlasnik ne postoji.'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284822513751400)
,p_name=>'APEX.TASK.OUTCOME.APPROVED'
,p_message_language=>'hr'
,p_message_text=>'Odobreno'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284928582751400)
,p_name=>'APEX.TASK.OUTCOME.REJECTED'
,p_message_language=>'hr'
,p_message_text=>'Odbijeno'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266396785751395)
,p_name=>'APEX.TASK.OUTCOME_MISSING'
,p_message_language=>'hr'
,p_message_text=>unistr('Dovr\0161enje zadatka zahtijeva ishod')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139266550349751395)
,p_name=>'APEX.TASK.OUTCOME_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Za zadatak nije dopu\0161ten ishod')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139302106946751405)
,p_name=>'APEX.TASK.PARAM_NOT_UPDATABLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se a\017Eurirati parametar %0.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298456073751404)
,p_name=>'APEX.TASK.PARTICIPANT_EXISTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Sudionik ve\0107 postoji za ovu instancu zadatka.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399932868751434)
,p_name=>'APEX.TASK.PRIORITY.1'
,p_message_language=>'hr'
,p_message_text=>'Hitna'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277023899751398)
,p_name=>'APEX.TASK.PRIORITY.1.DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Hitna'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399884323751434)
,p_name=>'APEX.TASK.PRIORITY.2'
,p_message_language=>'hr'
,p_message_text=>'Visoko'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277100357751398)
,p_name=>'APEX.TASK.PRIORITY.2.DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Visoki prioritet'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399702253751434)
,p_name=>'APEX.TASK.PRIORITY.3'
,p_message_language=>'hr'
,p_message_text=>'Srednje'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277262457751398)
,p_name=>'APEX.TASK.PRIORITY.3.DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Srednji prioritet'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399606559751434)
,p_name=>'APEX.TASK.PRIORITY.4'
,p_message_language=>'hr'
,p_message_text=>'Nisko'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277344698751398)
,p_name=>'APEX.TASK.PRIORITY.4.DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Niski prioritet'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399513562751434)
,p_name=>'APEX.TASK.PRIORITY.5'
,p_message_language=>'hr'
,p_message_text=>unistr('Najni\017Ea')
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277491665751398)
,p_name=>'APEX.TASK.PRIORITY.5.DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Najni\017Ei prioritet')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283191345751399)
,p_name=>'APEX.TASK.SET_PRIORITY_NOT_AUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavi prioritet zadatka: nema ovla\0161tenja')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284392499751400)
,p_name=>'APEX.TASK.STATE.ASSIGNED'
,p_message_language=>'hr'
,p_message_text=>'Dodijeljeno'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284707568751400)
,p_name=>'APEX.TASK.STATE.CANCELLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Poni\0161teno')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284402169751400)
,p_name=>'APEX.TASK.STATE.COMPLETED'
,p_message_language=>'hr'
,p_message_text=>unistr('Dovr\0161eno')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284629025751400)
,p_name=>'APEX.TASK.STATE.ERRORED'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161no')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139278139671751398)
,p_name=>'APEX.TASK.STATE.EXPIRED'
,p_message_language=>'hr'
,p_message_text=>'Isteklo'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284590101751400)
,p_name=>'APEX.TASK.STATE.FAILED'
,p_message_language=>'hr'
,p_message_text=>'Nije uspjelo'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274868312751397)
,p_name=>'APEX.TASK.STATE.INFO_REQUESTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Zatra\017Eene informacije')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139284238340751400)
,p_name=>'APEX.TASK.STATE.UNASSIGNED'
,p_message_language=>'hr'
,p_message_text=>'Nije dodijeljeno'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306672991751406)
,p_name=>'APEX.TASK.TASK_CREATE_ERROR'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Nije uspjelo stvaranje novog zadatka za definiciju zadatka %0 u aplikaciji %1.',
'SQLCODE: %2'))
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306579158751406)
,p_name=>'APEX.TASK.TASK_CREATE_NO_POTENTIAL_OWNER'
,p_message_language=>'hr'
,p_message_text=>unistr('Poku\0161aj stvaranja zadatka za definiciju zadatka %0 u aplikaciji %1 nije uspio jer definicija zadatka ne sadr\017Ei potencijalne vlasnike - uredite definiciju zadatka i dodajte najmanje jednog sudionika vrste potencijalni vlasnik')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283843884751400)
,p_name=>'APEX.TASK.TASK_DEFINITION_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Definicija zadatka nije prona\0111ena')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283797416751400)
,p_name=>'APEX.TASK.TASK_DEF_PARTICIPANTS_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Sudionici nisu prona\0111eni za zadatak')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285139099751400)
,p_name=>'APEX.TASK.TASK_ID_PK_VIOLATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Vi\0161e od jednog zadatka za navedeni ID zadatka - provjerite s administratorom baze podataka')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283930488751400)
,p_name=>'APEX.TASK.TASK_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadatak nije prona\0111en')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139283655778751400)
,p_name=>'APEX.TASK.TASK_PARAMETER_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Parametar zadatka nije prona\0111en')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319969359751410)
,p_name=>'APEX.TASK.TYPE.ACTION'
,p_message_language=>'hr'
,p_message_text=>'Akcija'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319855227751410)
,p_name=>'APEX.TASK.TYPE.APPROVAL'
,p_message_language=>'hr'
,p_message_text=>'Odobrenje'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267236411751395)
,p_name=>'APEX.TASK.VACATION_RULE_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Postupak pravila godi\0161njeg odmora %2 nije uspio s izvr\0161avanjem za definiciju zadatka %0 u aplikaciji %1.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267465584751395)
,p_name=>'APEX.TASK.VACATION_RULE_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Sudionik %1 dodan je kao zamjena za sudionika %0. Razlog - %2 .'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471154997751455)
,p_name=>'APEX.TB.TOOLBAR'
,p_message_language=>'hr'
,p_message_text=>'Alatna traka'
,p_is_js_message=>true
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324679328751412)
,p_name=>'APEX.TEMPLATE.APPLICATION'
,p_message_language=>'hr'
,p_message_text=>'Aplikacija'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485843245751459)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_NAV_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161iri/sa\017Emi navigaciju')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485919236751459)
,p_name=>'APEX.TEMPLATE.EXPAND_COLLAPSE_SIDE_COL_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161iri/sa\017Emi bo\010Dni stupac')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394323966751432)
,p_name=>'APEX.TEMPLATE.MAIN_NAV_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Glavna navigacija'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295196117751403)
,p_name=>'APEX.TEMPLATE_DIRECTIVE.INVALID_PLACEHOLDER_NAME'
,p_message_language=>'hr'
,p_message_text=>'"%0" nije valjani naziv rezerviranog mjesta.'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402030592751435)
,p_name=>'APEX.TIME.DAY'
,p_message_language=>'hr'
,p_message_text=>'1 dan'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401811850751435)
,p_name=>'APEX.TIME.HOUR'
,p_message_language=>'hr'
,p_message_text=>'1 sat'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402145859751435)
,p_name=>'APEX.TIME.N_DAYS'
,p_message_language=>'hr'
,p_message_text=>'%0 dana'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401906007751435)
,p_name=>'APEX.TIME.N_HOURS'
,p_message_language=>'hr'
,p_message_text=>'%0 h'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401764224751435)
,p_name=>'APEX.TIME.N_MINUTES'
,p_message_language=>'hr'
,p_message_text=>'%0 min'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402368784751435)
,p_name=>'APEX.TIME.N_WEEKS'
,p_message_language=>'hr'
,p_message_text=>'%0 tj.'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139402284915751435)
,p_name=>'APEX.TIME.WEEK'
,p_message_language=>'hr'
,p_message_text=>'1 tjedan'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300074042751404)
,p_name=>'APEX.TMV.SELECTION_COUNT'
,p_message_language=>'hr'
,p_message_text=>'Odabrane stavke: %0'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300201408751404)
,p_name=>'APEX.TMV.SELECTOR_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Odaberi proizvod'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300143697751404)
,p_name=>'APEX.TMV.SELECTOR_LABEL_1'
,p_message_language=>'hr'
,p_message_text=>'Odaberi %0'
,p_is_js_message=>true
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488973368751460)
,p_name=>'APEX.UI.BACK_TO_TOP'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\010Detak stranice')
,p_is_js_message=>true
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346563831751418)
,p_name=>'APEX.UI.ENABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Omogu\0107eno')
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315080520751409)
,p_name=>'APEX.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri obradi zahtjeva.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139300637522751405)
,p_name=>'APEX.UPDATE_MESSAGE_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Tekstna poruka %0 ne mo\017Ee se a\017Eurirati jer je pretplata za nju izvr\0161ena iz druge aplikacije.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403762158751435)
,p_name=>'APEX.VALUE_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Obavezna vrijednost'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320112540751410)
,p_name=>'APEX.VISUALLY_HIDDEN_HEADING'
,p_message_language=>'hr'
,p_message_text=>'Razina zaglavlja %0, skriveno'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448579160751448)
,p_name=>'APEX.WARN_ON_UNSAVED_CHANGES'
,p_message_language=>'hr'
,p_message_text=>unistr('Ova stranica sadr\017Ei nespremljene promjene.')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310106236751407)
,p_name=>'APEX.WF.NAVIGATOR'
,p_message_language=>'hr'
,p_message_text=>'Navigator'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309807198751407)
,p_name=>'APEX.WF.ZOOM_IN'
,p_message_language=>'hr'
,p_message_text=>unistr('Uve\0107aj')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310825485751408)
,p_name=>'APEX.WF.ZOOM_LEVEL'
,p_message_language=>'hr'
,p_message_text=>'Razina zumiranja {0}%'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309907747751407)
,p_name=>'APEX.WF.ZOOM_OUT'
,p_message_language=>'hr'
,p_message_text=>'Smanji'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310078271751407)
,p_name=>'APEX.WF.ZOOM_RESET'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi zumiranje'
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285566058751400)
,p_name=>'APEX.WF_DIAGRAM.ARIA_DESC'
,p_message_language=>'hr'
,p_message_text=>unistr('Dijagramu tijeka rada ne mo\017Ee se pristupiti u ovom trenutku.')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285440238751400)
,p_name=>'APEX.WF_DIAGRAM.ARIA_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Dijagram tijeka rada'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287387922751401)
,p_name=>'APEX.WORKFLOW.ACTION_NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Instanca tijeka rada %0 trenutno je u stanju %1. Stoga operacija nije dopu\0161tena')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289969761751401)
,p_name=>'APEX.WORKFLOW.ACTIVITY.COMPLETED'
,p_message_language=>'hr'
,p_message_text=>unistr('Instanca %1 s gre\0161kom za aktivnost %2 u tijeku rada %0 dovr\0161ena je')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289754268751401)
,p_name=>'APEX.WORKFLOW.ACTIVITY.CREATED'
,p_message_language=>'hr'
,p_message_text=>'Stvorena je nova instanca %1 aktivnosti %2 u tijeku rada %0'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281593636751399)
,p_name=>'APEX.WORKFLOW.ACTIVITY.DATA_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Dodatni podatkovni redak povezan s ovom instancom aktivnosti tijeka rada nije prona\0111en')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289877757751401)
,p_name=>'APEX.WORKFLOW.ACTIVITY.RETRIED'
,p_message_language=>'hr'
,p_message_text=>unistr('Instanca %1 s pogre\0161kom za aktivnost %2 u tijeku rada %0 poku\0161ana je ponovo')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271805924751396)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TERMINATED'
,p_message_language=>'hr'
,p_message_text=>'Prekinuta je instanca aktivnosti %1 u tijeku rada %0'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305615366751406)
,p_name=>'APEX.WORKFLOW.ACTIVITY.TIMEOUT'
,p_message_language=>'hr'
,p_message_text=>'Instanca aktivnosti %1 u tijeku rada %0 istekla je i prekinuta je.'
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290028698751402)
,p_name=>'APEX.WORKFLOW.ACTIVITY.WAITING'
,p_message_language=>'hr'
,p_message_text=>unistr('Instanca %1 s gre\0161kom za aktivnost %2 u tijeku rada %0 u stanju je \010Dekanja')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271632887751396)
,p_name=>'APEX.WORKFLOW.ALTERED_AND_RESUMED'
,p_message_language=>'hr'
,p_message_text=>'Instanca tijeka rada %0 promijenjena je i nastavljena tijekom aktivnosti %1'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289064883751401)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.COMPLETED'
,p_message_language=>'hr'
,p_message_text=>unistr('Instanca \010Dekanja %1 aktivnosti %2 u tijeku rada %0 uspje\0161no je dovr\0161ena')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288837719751401)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.FAULTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Aktivnost \010Dekanja %1 ima pogre\0161ku jer je tijek rada %0 ve\0107 bio u stanju S pogre\0161kom prije dovr\0161etka aktivnosti')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288962704751401)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATED'
,p_message_language=>'hr'
,p_message_text=>unistr('Aktivnost na \010Dekanju %1 prekinuta je jer je tijek rada %0 ve\0107 bio u prekinutom stanju prije nego \0161to je aktivnost dovr\0161ena')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271925559751396)
,p_name=>'APEX.WORKFLOW.ASYNC.ACT.TERMINATE_FAILED'
,p_message_language=>'hr'
,p_message_text=>unistr('Prekid aktivnosti %1 u tijeku rada %0 nije uspio zbog pogre\0161ke - %2')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287591962751401)
,p_name=>'APEX.WORKFLOW.BUSY'
,p_message_language=>'hr'
,p_message_text=>unistr('Tijek rada trenutno je zauzet dovr\0161avanjem prethodne operacije. Poku\0161ajte kasnije')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303615821751405)
,p_name=>'APEX.WORKFLOW.COMPLETED_SINCE'
,p_message_language=>'hr'
,p_message_text=>unistr('Dovr\0161eno %0')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286698920751401)
,p_name=>'APEX.WORKFLOW.CONTINUE.NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Tijek rada %0 ne mo\017Ee se nastaviti jer je trenutno na aktivnosti %1 koja nije stanje \010Dekanja')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298509106751404)
,p_name=>'APEX.WORKFLOW.CORRELATION_CONTEXT_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije valjani kontekst korelacije tijeka rada za proces koji izvr\0161ava ova aktivnost tijeka rada. Kontekst korelacije mora biti tekst odvojen dvoto\010Dkom koji sadr\017Ei APEX_APPL_WORKFLOW iza kojeg slijede ID instance tijeka rada i ID instance aktivnosti')
||'.'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289205471751401)
,p_name=>'APEX.WORKFLOW.CREATED'
,p_message_language=>'hr'
,p_message_text=>'Stvorena nova instanca %0 tijeka rada %1, verzija %2'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281339470751399)
,p_name=>'APEX.WORKFLOW.DATA_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Dodatni podatkovni redak povezan s ovom instancom tijeka rada nije prona\0111en')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303846533751406)
,p_name=>'APEX.WORKFLOW.DUE_SINCE'
,p_message_language=>'hr'
,p_message_text=>'Dospijeva %0'
,p_version_scn=>2704905
);
end;
/
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289128020751401)
,p_name=>'APEX.WORKFLOW.END'
,p_message_language=>'hr'
,p_message_text=>unistr('Tijek rada %0 zavr\0161en je sa stanjem %1')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286398807751400)
,p_name=>'APEX.WORKFLOW.INCOMPATIBLE_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta podataka %1 za uvjete koji se uspore\0111uju u aktivnosti promjene tijeka rada %0 nije kompatibilna s operatorom uvjeta')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276120678751397)
,p_name=>'APEX.WORKFLOW.INITIATED_BY_USER_SINCE'
,p_message_language=>'hr'
,p_message_text=>'Pokrenuo %0 %1'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298902034751404)
,p_name=>'APEX.WORKFLOW.INVOKED'
,p_message_language=>'hr'
,p_message_text=>'Stvorena nova instanca %0 tijeka rada %1, verzija %2 - pozvana iz instance aktivnosti %4 instance tijeka rada %3'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139271741232751396)
,p_name=>'APEX.WORKFLOW.NO_ACTIVITY_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Aktivnost sa stati\010Dkim ID-om %1 nije aktivnost u tijeku rada %0. Provjerite stati\010Dke ID-ove aktivnosti odgovaraju\0107e verzije tijeka rada.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297033074751404)
,p_name=>'APEX.WORKFLOW.REQUIRED_PARAM_MISSING'
,p_message_language=>'hr'
,p_message_text=>'%0 je obavezan parametar za ovaj tijek rada i ne smije biti NULL.'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289619851751401)
,p_name=>'APEX.WORKFLOW.RESUMED'
,p_message_language=>'hr'
,p_message_text=>'Nastavljena je instanca tijeka rada %0'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289537496751401)
,p_name=>'APEX.WORKFLOW.RETRIED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ponovo je poku\0161ana instanca tijeka rada %0')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303952378751406)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.EQUALS_ONE'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 ponovni poku\0161aj')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304027039751406)
,p_name=>'APEX.WORKFLOW.RETRY_COUNT.NOT_EQUALS_ONE'
,p_message_language=>'hr'
,p_message_text=>unistr('Ponovni poku\0161aji: %0')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303717943751406)
,p_name=>'APEX.WORKFLOW.STARTED_SINCE'
,p_message_language=>'hr'
,p_message_text=>'Pokrenuto %0'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297992589751404)
,p_name=>'APEX.WORKFLOW.STATE.ACTIVE'
,p_message_language=>'hr'
,p_message_text=>'Aktivno'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298122796751404)
,p_name=>'APEX.WORKFLOW.STATE.COMPLETED'
,p_message_language=>'hr'
,p_message_text=>unistr('Dovr\0161eno')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298232940751404)
,p_name=>'APEX.WORKFLOW.STATE.FAULTED'
,p_message_language=>'hr'
,p_message_text=>unistr('S pogre\0161kom')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298379792751404)
,p_name=>'APEX.WORKFLOW.STATE.SUSPENDED'
,p_message_language=>'hr'
,p_message_text=>'Obustavljeno'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139298086972751404)
,p_name=>'APEX.WORKFLOW.STATE.TERMINATED'
,p_message_language=>'hr'
,p_message_text=>'Prekinuto'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313323122751408)
,p_name=>'APEX.WORKFLOW.STATE.WAITING'
,p_message_language=>'hr'
,p_message_text=>unistr('Na \010Dekanju')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289389857751401)
,p_name=>'APEX.WORKFLOW.SUSPENDED'
,p_message_language=>'hr'
,p_message_text=>'Obustavljena je instanca tijeka rada %0'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295290444751403)
,p_name=>'APEX.WORKFLOW.SWITCH.BRANCH_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107a aktivnost za instancu tijeka rada %0 ne mo\017Ee se odrediti. Provjerite i ispravite uvjete definirane za trenutnu aktivnost prebacivanja prije ponovnog poku\0161aja tijeka rada.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139289418946751401)
,p_name=>'APEX.WORKFLOW.TERMINATED'
,p_message_language=>'hr'
,p_message_text=>'Ukinuta je instanca tijeka rada %0'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288597886751401)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RESUME'
,p_message_language=>'hr'
,p_message_text=>unistr('Samo poslovni administrator tijeka rada %0 mo\017Ee nastaviti tijek rada')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288621766751401)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_RETRY'
,p_message_language=>'hr'
,p_message_text=>unistr('Tijek rada %0 mo\017Ee ponovo poku\0161ati samo poslovni administrator i/ili vlasnik')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288188964751401)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_SUSPEND'
,p_message_language=>'hr'
,p_message_text=>unistr('Instancu tijeka rada %0 mo\017Ee obustaviti samo poslovni administrator tijeka rada')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139288433236751401)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_TERMINATE'
,p_message_language=>'hr'
,p_message_text=>'Samo vlasnici i poslovni administratori instance tijeka rada %0 mogu prekinuti tijek rada'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286891330751401)
,p_name=>'APEX.WORKFLOW.UNAUTHORIZED_UPDATE'
,p_message_language=>'hr'
,p_message_text=>unistr('Varijable tijeka rada %0 mo\017Ee a\017Eurirati samo poslovni administrator definiran za tijek rada')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301498594751405)
,p_name=>'APEX.WORKFLOW.UPDATE,NOT_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Instanca tijeka rada %0 mora biti u stanju pogre\0161ke ili obustave prije nego \0161to se njene varijable mogu a\017Eurirati.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292913463751402)
,p_name=>'APEX.WORKFLOW.UPDATED'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrijednost varijable tijeka rada %0 a\017Eurirana je na %1')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303142243751405)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_ACTIVE'
,p_message_language=>'hr'
,p_message_text=>unistr('Tijek rada %0 ne sadr\017Ei aktivnu verziju')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303274880751405)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_DEV'
,p_message_language=>'hr'
,p_message_text=>unistr('Tijek rada %0 ne sadr\017Ei verziju u razvoju')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139303352523751405)
,p_name=>'APEX.WORKFLOW.VERSION_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Tijek rada %0 ne sadr\017Ei aktivnu ni verziju u razvoju')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286240560751400)
,p_name=>'APEX.WORKFLOW.WORKFLOW_ACT_INSTANCE_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Instanca aktivnosti %1 za instancu tijeka rada %0 nije prona\0111ena')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286081655751400)
,p_name=>'APEX.WORKFLOW.WORKFLOW_INSTANCE_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Instanca tijeka rada %0 nije prona\0111ena')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321177562751411)
,p_name=>'APEX.XLSX.ERROR.NO_ACTIVE_WORKSHEET'
,p_message_language=>'hr'
,p_message_text=>'Radna knjiga nema aktivni radni list.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321025030751411)
,p_name=>'APEX.XLSX.ERROR.WORKBOOK_NOT_INITIALIZED'
,p_message_language=>'hr'
,p_message_text=>'Radna knjiga nije inicijalizirana.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139320954965751411)
,p_name=>'APEX.XLSX.INTERNAL_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pri stvaranju XLSX datoteke do\0161lo je do interne pogre\0161ke.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323402979751411)
,p_name=>'APEX.XLSX.SHEET'
,p_message_language=>'hr'
,p_message_text=>'List'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334000534751414)
,p_name=>'APEX.XLSX.SHEET_NAME_TAKEN'
,p_message_language=>'hr'
,p_message_text=>unistr('Naziv radnog lista "%0" ve\0107 je zauzet. Poku\0161ajte s drugim')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462678024751452)
,p_name=>'APEXIR_ACTIONS'
,p_message_language=>'hr'
,p_message_text=>'Akcije'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377687511751427)
,p_name=>'APEXIR_ACTIONS_MENU'
,p_message_language=>'hr'
,p_message_text=>'Izbornik akcija'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373364892751426)
,p_name=>'APEXIR_ADD_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>'Dodaj funkciju'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373268936751426)
,p_name=>'APEXIR_ADD_GROUP_BY_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Dodaj Grupiraj po stupcu'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410833813751437)
,p_name=>'APEXIR_ADD_PIVOT_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Dodaj zaokretni stupac'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410959916751437)
,p_name=>'APEXIR_ADD_ROW_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Dodaj stupac retka'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345309183751418)
,p_name=>'APEXIR_AGGREGATE'
,p_message_language=>'hr'
,p_message_text=>'Agregiranje'
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383812526751429)
,p_name=>'APEXIR_AGGREGATION'
,p_message_language=>'hr'
,p_message_text=>'Agregiranje'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364776285751424)
,p_name=>'APEXIR_AGG_AVG'
,p_message_language=>'hr'
,p_message_text=>'Prosjek'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369003526751425)
,p_name=>'APEXIR_AGG_COUNT'
,p_message_language=>'hr'
,p_message_text=>'Broj'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364869023751424)
,p_name=>'APEXIR_AGG_MAX'
,p_message_language=>'hr'
,p_message_text=>'Maksimalno'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365049102751424)
,p_name=>'APEXIR_AGG_MEDIAN'
,p_message_language=>'hr'
,p_message_text=>'Sredina'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364993993751424)
,p_name=>'APEXIR_AGG_MIN'
,p_message_language=>'hr'
,p_message_text=>'Minimalno'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364681271751424)
,p_name=>'APEXIR_AGG_SUM'
,p_message_language=>'hr'
,p_message_text=>'Zbroj %0'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365731355751424)
,p_name=>'APEXIR_ALL'
,p_message_language=>'hr'
,p_message_text=>'Sve'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344685748751418)
,p_name=>'APEXIR_ALL_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Svi stupci'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324757244751412)
,p_name=>'APEXIR_ALL_ROWS'
,p_message_language=>'hr'
,p_message_text=>'Svi redci'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459644335751452)
,p_name=>'APEXIR_ALTERNATIVE'
,p_message_language=>'hr'
,p_message_text=>'Alternativno'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461260714751452)
,p_name=>'APEXIR_ALTERNATIVE_DEFAULT_NAME'
,p_message_language=>'hr'
,p_message_text=>'Alternativno zadano:  %0 '
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358820779751422)
,p_name=>'APEXIR_AND'
,p_message_language=>'hr'
,p_message_text=>'i'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393643525751432)
,p_name=>'APEXIR_API.IMPORT_CONTENT_CORRUPTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se uvesti spremljeno izvje\0161\0107e. Sadr\017Eaj je o\0161te\0107en.')
,p_version_scn=>2704924
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393795654751432)
,p_name=>'APEXIR_API.IMPORT_CONTENT_EMPTY'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se uvesti spremljeno izvje\0161\0107e. Sadr\017Eaj je prazan.')
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346841009751418)
,p_name=>'APEXIR_APPLY'
,p_message_language=>'hr'
,p_message_text=>'Primijeni'
,p_is_js_message=>true
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340494842751416)
,p_name=>'APEXIR_ASCENDING'
,p_message_language=>'hr'
,p_message_text=>'Uzlazno'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361971771751423)
,p_name=>'APEXIR_AS_OF'
,p_message_language=>'hr'
,p_message_text=>'Na dan%0'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461816013751452)
,p_name=>'APEXIR_AVERAGE_X'
,p_message_language=>'hr'
,p_message_text=>'Prosjek %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453484162751450)
,p_name=>'APEXIR_BAR'
,p_message_language=>'hr'
,p_message_text=>'Traka'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346124487751418)
,p_name=>'APEXIR_BETWEEN'
,p_message_language=>'hr'
,p_message_text=>unistr('izme\0111u')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339223349751416)
,p_name=>'APEXIR_BGCOLOR'
,p_message_language=>'hr'
,p_message_text=>'Boja pozadine'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341193299751417)
,p_name=>'APEXIR_BLUE'
,p_message_language=>'hr'
,p_message_text=>'plava'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375294063751427)
,p_name=>'APEXIR_BOTTOM'
,p_message_language=>'hr'
,p_message_text=>'Dno'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306023896751406)
,p_name=>'APEXIR_BTNS_NEXT_TO_SEARCH_OF'
,p_message_language=>'hr'
,p_message_text=>unistr('Gumbi pokraj trake za pretra\017Eivanje za %0')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341784740751417)
,p_name=>'APEXIR_CANCEL'
,p_message_language=>'hr'
,p_message_text=>'Odustani'
,p_is_js_message=>true
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348065439751419)
,p_name=>'APEXIR_CATEGORY'
,p_message_language=>'hr'
,p_message_text=>'Kategorija'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339171319751416)
,p_name=>'APEXIR_CELL'
,p_message_language=>'hr'
,p_message_text=>unistr('\0106elija')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365635129751424)
,p_name=>'APEXIR_CHART'
,p_message_language=>'hr'
,p_message_text=>'Grafikon'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376132005751427)
,p_name=>'APEXIR_CHART_INITIALIZING'
,p_message_language=>'hr'
,p_message_text=>'Inicijalizacija...'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415873715751439)
,p_name=>'APEXIR_CHART_LABEL_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'Mora se navesti oznaka grafikona.'
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428266817751442)
,p_name=>'APEXIR_CHART_MAX_DATAPOINT_CNT'
,p_message_language=>'hr'
,p_message_text=>unistr('Upit prekora\010Duje sljede\0107i maksimalni broj podatkovnih to\010Daka po grafikonu: %0. Primijenite filtar kako biste smanjili broj zapisa u osnovnom upitu.')
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427122892751442)
,p_name=>'APEXIR_CHART_MAX_ROW_CNT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Maksimalni broj redaka za upit grafikona ograni\010Dava broj redaka u osnovnom upitu, a ne prikazani broj redaka.'),
unistr('Osnovni upit prekora\010Duje maksimalni broj redaka koji iznosi %0. Primijenite filtar kako biste smanjili broj zapisa u osnovnom upitu.')))
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344745214751418)
,p_name=>'APEXIR_CHART_TYPE'
,p_message_language=>'hr'
,p_message_text=>'Vrsta grafikona'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308620512751407)
,p_name=>'APEXIR_CHART_VIEW_OF'
,p_message_language=>'hr'
,p_message_text=>'Prikaz grafikona za %0'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423852417751441)
,p_name=>'APEXIR_CHECK_ALL'
,p_message_language=>'hr'
,p_message_text=>unistr('Ozna\010Di sve')
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362354890751423)
,p_name=>'APEXIR_CHOOSE_DOWNLOAD_FORMAT'
,p_message_language=>'hr'
,p_message_text=>unistr('Odabir formata izvje\0161\0107a')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370108287751425)
,p_name=>'APEXIR_CLEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('o\010Disti')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341603466751417)
,p_name=>'APEXIR_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Stupac'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381487080751429)
,p_name=>'APEXIR_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Stupci'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348661790751419)
,p_name=>'APEXIR_COLUMN_ALIASES'
,p_message_language=>'hr'
,p_message_text=>'Drugi nazivi stupaca'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456203672751451)
,p_name=>'APEXIR_COLUMN_FILTER'
,p_message_language=>'hr'
,p_message_text=>'Filtriranje...'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316498709751409)
,p_name=>'APEXIR_COLUMN_HEADER'
,p_message_language=>'hr'
,p_message_text=>'Zaglavlje stupca'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330544824751413)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS'
,p_message_language=>'hr'
,p_message_text=>'Akcije stupca'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330872762751413)
,p_name=>'APEXIR_COLUMN_HEADER_ACTIONS_FOR'
,p_message_language=>'hr'
,p_message_text=>'Akcije za stupac "%0"'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372258190751426)
,p_name=>'APEXIR_COLUMN_HEADING_MENU'
,p_message_language=>'hr'
,p_message_text=>'Izbornik zaglavlja stupca'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375981966751427)
,p_name=>'APEXIR_COLUMN_INFO'
,p_message_language=>'hr'
,p_message_text=>'Informacije iz stupca'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458526578751451)
,p_name=>'APEXIR_COLUMN_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Oznaka stupca'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373611453751426)
,p_name=>'APEXIR_COLUMN_N'
,p_message_language=>'hr'
,p_message_text=>'Stupac %0'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356552631751421)
,p_name=>'APEXIR_COMPARISON_CONTAINS'
,p_message_language=>'hr'
,p_message_text=>unistr('sadr\017Ei')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357804095751422)
,p_name=>'APEXIR_COMPARISON_DOESNOT_CONTAIN'
,p_message_language=>'hr'
,p_message_text=>unistr('ne sadr\017Ei')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340109147751416)
,p_name=>'APEXIR_COMPARISON_IN'
,p_message_language=>'hr'
,p_message_text=>'in'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358039109751422)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_LAST'
,p_message_language=>'hr'
,p_message_text=>'nije u zadnjem'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367110873751424)
,p_name=>'APEXIR_COMPARISON_ISNOT_IN_NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('nije u sljede\0107em')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357942362751422)
,p_name=>'APEXIR_COMPARISON_IS_IN_LAST'
,p_message_language=>'hr'
,p_message_text=>'je u zadnjem'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367019418751424)
,p_name=>'APEXIR_COMPARISON_IS_IN_NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('je u sljede\0107em')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340036405751416)
,p_name=>'APEXIR_COMPARISON_IS_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'is not null'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339991725751416)
,p_name=>'APEXIR_COMPARISON_IS_NULL'
,p_message_language=>'hr'
,p_message_text=>'is null'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339770703751416)
,p_name=>'APEXIR_COMPARISON_LIKE'
,p_message_language=>'hr'
,p_message_text=>'like'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340288687751416)
,p_name=>'APEXIR_COMPARISON_NOT_IN'
,p_message_language=>'hr'
,p_message_text=>'not in'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339870335751416)
,p_name=>'APEXIR_COMPARISON_NOT_LIKE'
,p_message_language=>'hr'
,p_message_text=>'not like'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356897481751421)
,p_name=>'APEXIR_COMPARISON_REGEXP_LIKE'
,p_message_language=>'hr'
,p_message_text=>'odgovara regularnom izrazu'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362233892751423)
,p_name=>'APEXIR_COMPUTATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Izra\010Dun')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426884744751442)
,p_name=>'APEXIR_COMPUTATION_EXPRESSION'
,p_message_language=>'hr'
,p_message_text=>unistr('Izraz izra\010Duna')
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381778264751429)
,p_name=>'APEXIR_COMPUTATION_FOOTER'
,p_message_language=>'hr'
,p_message_text=>unistr('Stvorite izra\010Dun pomo\0107u drugih naziva stupca.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381836092751429)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E1'
,p_message_language=>'hr'
,p_message_text=>'(B+C)*100'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381939442751429)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E2'
,p_message_language=>'hr'
,p_message_text=>'INITCAP(B)||'', ''||INITCAP(C)'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382012098751429)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E3'
,p_message_language=>'hr'
,p_message_text=>'CASE WHEN A = 10 THEN B + C ELSE B END'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322951630751411)
,p_name=>'APEXIR_COMPUTATION_FOOTER_E4'
,p_message_language=>'hr'
,p_message_text=>'ROUND(C / 1000000)'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366495279751424)
,p_name=>'APEXIR_COMPUTE'
,p_message_language=>'hr'
,p_message_text=>unistr('Izra\010Dun')
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374298230751426)
,p_name=>'APEXIR_CONTROL_BREAK'
,p_message_language=>'hr'
,p_message_text=>'Kontrolno razdvajanje'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377239098751427)
,p_name=>'APEXIR_CONTROL_BREAKS'
,p_message_language=>'hr'
,p_message_text=>'Kontrolna razdvajanja'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463817299751453)
,p_name=>'APEXIR_CONTROL_BREAK_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Stupci kontrolnih razdvajanja'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319665594751410)
,p_name=>'APEXIR_COUNT_DISTINCT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbroji razli\010Dite')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462321795751452)
,p_name=>'APEXIR_COUNT_DISTINCT_X'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbroji razli\010Dite')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462209495751452)
,p_name=>'APEXIR_COUNT_X'
,p_message_language=>'hr'
,p_message_text=>'Broj %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435228240751444)
,p_name=>'APEXIR_DAILY'
,p_message_language=>'hr'
,p_message_text=>'Dnevno'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139488591323751460)
,p_name=>'APEXIR_DATA'
,p_message_language=>'hr'
,p_message_text=>'Podaci'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376041044751427)
,p_name=>'APEXIR_DATA_AS_OF'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei podatke od prije %0 min.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309074849751407)
,p_name=>'APEXIR_DATA_VIEW_OF'
,p_message_language=>'hr'
,p_message_text=>'Prikaz podataka za %0'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345426807751418)
,p_name=>'APEXIR_DATE'
,p_message_language=>'hr'
,p_message_text=>'Datum'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379950570751428)
,p_name=>'APEXIR_DEFAULT'
,p_message_language=>'hr'
,p_message_text=>'Zadano'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459471553751451)
,p_name=>'APEXIR_DEFAULT_REPORT_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Zadana vrsta izvje\0161\0107a')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341874501751417)
,p_name=>'APEXIR_DELETE'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbri\0161i')
,p_is_js_message=>true
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345732089751418)
,p_name=>'APEXIR_DELETE_CONFIRM'
,p_message_language=>'hr'
,p_message_text=>unistr('\017Delite li izbrisati ove postavke izvje\0161\0107a?')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446250059751448)
,p_name=>'APEXIR_DELETE_DEFAULT_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbri\0161i zadano izvje\0161\0107e')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373982957751426)
,p_name=>'APEXIR_DELETE_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbri\0161i izvje\0161\0107e')
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340571888751416)
,p_name=>'APEXIR_DESCENDING'
,p_message_language=>'hr'
,p_message_text=>'Silazno'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348164927751419)
,p_name=>'APEXIR_DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Opis'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372144457751426)
,p_name=>'APEXIR_DETAIL_VIEW'
,p_message_language=>'hr'
,p_message_text=>'Prikaz jednog retka'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380430562751428)
,p_name=>'APEXIR_DIRECTION'
,p_message_language=>'hr'
,p_message_text=>'Smjer %0'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381349112751428)
,p_name=>'APEXIR_DISABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Onemogu\0107eno')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341333958751417)
,p_name=>'APEXIR_DISPLAYED'
,p_message_language=>'hr'
,p_message_text=>'Prikazano'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344532717751418)
,p_name=>'APEXIR_DISPLAYED_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Prikazani stupci'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380348304751428)
,p_name=>'APEXIR_DISPLAY_IN_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei u izvje\0161\0107u')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375111401751427)
,p_name=>'APEXIR_DOWN'
,p_message_language=>'hr'
,p_message_text=>'Dolje'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366590865751424)
,p_name=>'APEXIR_DOWNLOAD'
,p_message_language=>'hr'
,p_message_text=>'Preuzmi'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380257012751428)
,p_name=>'APEXIR_DO_NOT_DISPLAY'
,p_message_language=>'hr'
,p_message_text=>'Nemoj prikazivati'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449515796751449)
,p_name=>'APEXIR_DUPLICATE_HIGHLIGHT_COND'
,p_message_language=>'hr'
,p_message_text=>unistr('Isticanje s istim uvjetom ve\0107 postoji.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464018456751453)
,p_name=>'APEXIR_DUPLICATE_PIVOT_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Duplicirani zaokretni stupac. Popis zaokretnih stupaca mora biti jedinstven.'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464263948751453)
,p_name=>'APEXIR_EDIT'
,p_message_language=>'hr'
,p_message_text=>'Uredi'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376252755751427)
,p_name=>'APEXIR_EDIT_CHART'
,p_message_language=>'hr'
,p_message_text=>'Uredi postavke grafikona'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382842435751429)
,p_name=>'APEXIR_EDIT_CHART2'
,p_message_language=>'hr'
,p_message_text=>'Uredi grafikon'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346759391751418)
,p_name=>'APEXIR_EDIT_CONTROL_BREAK'
,p_message_language=>'hr'
,p_message_text=>'Uredi kontrolno razdvajanje'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383249437751429)
,p_name=>'APEXIR_EDIT_FILTER'
,p_message_language=>'hr'
,p_message_text=>'Uredi filtar'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349759013751419)
,p_name=>'APEXIR_EDIT_FLASHBACK'
,p_message_language=>'hr'
,p_message_text=>'Uredi Flashback'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441049200751446)
,p_name=>'APEXIR_EDIT_GROUP_BY'
,p_message_language=>'hr'
,p_message_text=>'Uredi grupiranje po'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383130383751429)
,p_name=>'APEXIR_EDIT_HIGHLIGHT'
,p_message_language=>'hr'
,p_message_text=>'Uredi isticanje'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411144382751437)
,p_name=>'APEXIR_EDIT_PIVOT'
,p_message_language=>'hr'
,p_message_text=>unistr('Ure\0111ivanje zaokretanja')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370501382751425)
,p_name=>'APEXIR_EDIT_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Uredi izvje\0161\0107e')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459701466751452)
,p_name=>'APEXIR_EMAIL'
,p_message_language=>'hr'
,p_message_text=>unistr('E-po\0161ta')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331908980751414)
,p_name=>'APEXIR_EMAIL_ADDRESS'
,p_message_language=>'hr'
,p_message_text=>unistr('Adresa e-po\0161te')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460061445751452)
,p_name=>'APEXIR_EMAIL_BCC'
,p_message_language=>'hr'
,p_message_text=>'Skriveni primatelji'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460217470751452)
,p_name=>'APEXIR_EMAIL_BODY'
,p_message_language=>'hr'
,p_message_text=>'Glavni dio'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459916692751452)
,p_name=>'APEXIR_EMAIL_CC'
,p_message_language=>'hr'
,p_message_text=>'Primatelj kopije'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460783152751452)
,p_name=>'APEXIR_EMAIL_FREQUENCY'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Destalost')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337191355751415)
,p_name=>'APEXIR_EMAIL_NOT_CONFIGURED'
,p_message_language=>'hr'
,p_message_text=>unistr('E-po\0161ta nije konfigurirana za ovu aplikaciju. Obratite se administratoru.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434571325751444)
,p_name=>'APEXIR_EMAIL_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Morate navesti adresu e-po\0161te.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460336403751452)
,p_name=>'APEXIR_EMAIL_SEE_ATTACHED'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei prilo\017Eeno')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460125837751452)
,p_name=>'APEXIR_EMAIL_SUBJECT'
,p_message_language=>'hr'
,p_message_text=>'Predmet'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435586675751444)
,p_name=>'APEXIR_EMAIL_SUBJECT_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Morate navesti predmet e-po\0161te.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459862924751452)
,p_name=>'APEXIR_EMAIL_TO'
,p_message_language=>'hr'
,p_message_text=>'Primatelj'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338903401751416)
,p_name=>'APEXIR_ENABLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Omogu\0107eno')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383022638751429)
,p_name=>'APEXIR_ENABLE_DISABLE_ALT'
,p_message_language=>'hr'
,p_message_text=>unistr('Omogu\0107i/onemogu\0107i')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382544032751429)
,p_name=>'APEXIR_ERROR_LANDMARK'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka! %0')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382127401751429)
,p_name=>'APEXIR_EXAMPLES'
,p_message_language=>'hr'
,p_message_text=>'Primjeri'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382938555751429)
,p_name=>'APEXIR_EXAMPLES_WITH_COLON'
,p_message_language=>'hr'
,p_message_text=>'Primjeri:'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344496365751418)
,p_name=>'APEXIR_EXCLUDE_NULL'
,p_message_language=>'hr'
,p_message_text=>unistr('Isklju\010Di Null vrijednosti')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383576708751429)
,p_name=>'APEXIR_EXPAND_COLLAPSE_ALT'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161iri/sa\017Emi')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381106972751428)
,p_name=>'APEXIR_EXPRESSION'
,p_message_language=>'hr'
,p_message_text=>'Izraz'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366032412751424)
,p_name=>'APEXIR_FILTER'
,p_message_language=>'hr'
,p_message_text=>'Filtar'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377159203751427)
,p_name=>'APEXIR_FILTERS'
,p_message_language=>'hr'
,p_message_text=>'Filtri'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387837136751430)
,p_name=>'APEXIR_FILTER_EXPRESSION'
,p_message_language=>'hr'
,p_message_text=>'Izraz filtra'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486095935751459)
,p_name=>'APEXIR_FILTER_EXPR_TOO_LONG'
,p_message_language=>'hr'
,p_message_text=>unistr('Izraz filtra je preduga\010Dak.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330736434751413)
,p_name=>'APEXIR_FILTER_SUGGESTIONS'
,p_message_language=>'hr'
,p_message_text=>'Prijedlozi filtra'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387783262751430)
,p_name=>'APEXIR_FILTER_TYPE'
,p_message_language=>'hr'
,p_message_text=>'Vrsta filtra'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383795264751429)
,p_name=>'APEXIR_FINDER_ALT'
,p_message_language=>'hr'
,p_message_text=>unistr('Odaberite stupce za pretra\017Eivanje')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366357260751424)
,p_name=>'APEXIR_FLASHBACK'
,p_message_language=>'hr'
,p_message_text=>'Flashback'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380909433751428)
,p_name=>'APEXIR_FLASHBACK_DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Upit Flashback omogu\0107uje vam prikaz podataka u stanju u kojem su bili u prethodnoj vremenskoj to\010Dki.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434966106751444)
,p_name=>'APEXIR_FLASHBACK_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Flashback - trajanje'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436362160751445)
,p_name=>'APEXIR_FORMAT'
,p_message_language=>'hr'
,p_message_text=>'Format'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362191418751423)
,p_name=>'APEXIR_FORMAT_MASK'
,p_message_language=>'hr'
,p_message_text=>'Maska formata %0'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373833265751426)
,p_name=>'APEXIR_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>'Funkcija'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381694038751429)
,p_name=>'APEXIR_FUNCTIONS'
,p_message_language=>'hr'
,p_message_text=>'Funkcije %0'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459358467751451)
,p_name=>'APEXIR_FUNCTIONS_OPERATORS'
,p_message_language=>'hr'
,p_message_text=>'Funkcije/operatori'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373551335751426)
,p_name=>'APEXIR_FUNCTION_N'
,p_message_language=>'hr'
,p_message_text=>'Funkcija %0'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365839842751424)
,p_name=>'APEXIR_GO'
,p_message_language=>'hr'
,p_message_text=>'Idi'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339498691751416)
,p_name=>'APEXIR_GREEN'
,p_message_language=>'hr'
,p_message_text=>'zelena'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384497025751429)
,p_name=>'APEXIR_GROUPBY_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Grupiranje po stupcima'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384565712751429)
,p_name=>'APEXIR_GROUPBY_FUNCTIONS'
,p_message_language=>'hr'
,p_message_text=>'Grupiranje po funkcijama'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319726262751410)
,p_name=>'APEXIR_GROUP_BY'
,p_message_language=>'hr'
,p_message_text=>'Grupiraj prema'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460436797751452)
,p_name=>'APEXIR_GROUP_BY_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Grupiranje po stupcu %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139415912233751439)
,p_name=>'APEXIR_GROUP_BY_COL_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'Mora se navesti grupiranje po stupcu.'
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427064979751442)
,p_name=>'APEXIR_GROUP_BY_MAX_ROW_CNT'
,p_message_language=>'hr'
,p_message_text=>unistr('Maksimalni broj redaka za upit Grupiraj po ograni\010Dava broj redaka u osnovnom upitu, a ne prikazani broj redaka. Osnovni upit prekora\010Duje maksimalni broj redaka koji iznosi %0. Primijenite filtar kako biste smanjili broj zapisa u osnovnom upitu.')
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407238912751436)
,p_name=>'APEXIR_GROUP_BY_SORT'
,p_message_language=>'hr'
,p_message_text=>'Sortiranje grupiranja po'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463906137751453)
,p_name=>'APEXIR_GROUP_BY_SORT_ORDER'
,p_message_language=>'hr'
,p_message_text=>'Grupiranje po redoslijedu sortiranja'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308862736751407)
,p_name=>'APEXIR_GROUP_BY_VIEW_OF'
,p_message_language=>'hr'
,p_message_text=>'Grupiraj po prikazu za %0'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344872316751418)
,p_name=>'APEXIR_HCOLUMN'
,p_message_language=>'hr'
,p_message_text=>'Vodoravni stupac'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378862831751428)
,p_name=>'APEXIR_HELP'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107')
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370669601751425)
,p_name=>'APEXIR_HELP_01'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Interaktivna izvje\0161\0107a omogu\0107uju krajnjim korisnicima prilago\0111avanje izvje\0161\0107a. Korisnici mogu izmijeniti izgled podataka izvje\0161\0107a odabirom stupaca, primjenom filtara, isticanjem i sortiranjem. Korisnici mogu i definirati razdvajanja, agregiranja, graf')
||unistr('ikone i na\010Dine grupiranja te dodavati vlastite izra\010Dune. Korisnici mogu i postaviti pretplatu kako bi e-po\0161tom primali HTML verziju izvje\0161\0107a u odre\0111enom intervalu. Korisnici mogu stvoriti vi\0161e verzija izvje\0161\0107a i spremati ih pod razli\010Ditim nazivima za')
||' javni ili privatni pregled. ',
'<p/>',
unistr('U sljede\0107im odjeljcima sa\017Eeto su opisani na\010Dini na koje mo\017Eete prilagoditi interaktivno izvje\0161\0107e. Pogledajte "Upotreba interaktivnih izvje\0161\0107a" u <i>Priru\010Dniku za krajnjeg korisnika platforme Oracle APEX</i> kako biste saznali vi\0161e.')))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377732305751427)
,p_name=>'APEXIR_HELP_ACTIONS_MENU'
,p_message_language=>'hr'
,p_message_text=>unistr('Izbornik akcija pojavljuje se desno od gumba Idi na traci za pretra\017Eivanje. Pomo\0107u tog izbornika mo\017Eete prilagoditi interaktivno izvje\0161\0107e.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371442184751426)
,p_name=>'APEXIR_HELP_AGGREGATE'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Agregiranja su matemati\010Dki izra\010Duni koji se izvr\0161avaju na stupcima. Agregiranja se prikazuju nakon svakog kontrolnog razdvajanja i na kraju izvje\0161\0107a u stupcu koji definiraju. Opcije obuhva\0107aju:'),
'<p>',
'</p><ul>',
unistr('<li><strong>Agregiranje</strong> vam omogu\0107uje odabir prethodno definiranog'),
unistr('agregiranja za ure\0111ivanje.</li>'),
unistr('<li><strong>Funkcija</strong> je funkcija koja \0107e se izvr\0161iti (primjerice, SUM, MIN).</li>'),
unistr('<li><strong>Stupac</strong> se upotrebljava za odabir stupca na koji \0107e se primijeniti matemati\010Dka funkcija. Prikazuju se samo'),
unistr('numeri\010Dki stupci.</li>'),
'</ul>'))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371581178751426)
,p_name=>'APEXIR_HELP_CHART'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Mo\017Eete definirati jedan grafikon po spremljenom izvje\0161\0107u. Nakon'),
unistr('\0161to ga definirate, mo\017Eete prelaziti s prikaza grafikona na prikaz izvje\0161\0107a i obratno pomo\0107u ikona prikaza na traci za pretra\017Eivanje.'),
unistr('Opcije obuhva\0107aju:  '),
'<p>',
'</p><ul>',
unistr('<li><strong>Vrsta grafikona</strong> identificira vrstu grafikona koju \0107e se uklju\010Diti.'),
unistr('Birajte izme\0111u vodoravnog trakastog, okomitog trakastog, tortnog ili linijskog grafikona.</li>'),
unistr('<li><strong>Oznaka</strong> vam omogu\0107uje biranje stupca koji \0107e se upotrijebiti kao oznaka.</li>'),
'<li><strong>Naslov osi za oznaku</strong> naslov je koji se prikazuje na osi povezanoj sa stupcem odabranim za',
'oznaku. To nije dostupno za tortni grafikon.</li>',
unistr('<li><strong>Vrijednost</strong> vam omogu\0107uje odabir stupca koji \0107e se upotrijebiti kao vrijednost. Ako je va\0161a funkcija COUNT, vrijednost se ne mora odabrati.</li>'),
'<li><strong>Naslov osi za vrijednost</strong> naslov je koji se prikazuje na osi povezanoj sa stupcem odabranim za',
'vrijednost. To nije dostupno za tortni grafikon.</li>',
unistr('<li><strong>Funkcija</strong> je neobavezna funkcija koja \0107e se izvr\0161iti na stupcu odabranom za vrijednost.</li>'),
unistr('<li><strong>Sortiranje</strong> vam omogu\0107uje sortiranje skupa rezultata.</li></ul>')))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370833654751425)
,p_name=>'APEXIR_HELP_COLUMN_HEADING_MENU'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Pritiskom na bilo koje zaglavlje stupca otkriva se izbornik zaglavlja stupca. Opcije obuhva\0107aju:'),
'<p></p>',
'<ul>',
'Ikona <li><strong>Uzlazno sortiranje</strong> sortira podatke u stupcu uzlaznim redoslijedom.</li>',
'Ikona <li><strong>Silazno sortiranje</strong> sortira podatke u stupcu silaznim redoslijedom.</li>',
unistr('<li><strong>Sakrij stupac</strong> skriva stupac. Ne mo\017Ee se sakriti sve stupce. Ako se stupac ne mo\017Ee sakriti, ne\0107e postojati ikona Sakrij stupac.</li>'),
unistr('<li><strong>Grupiraju\0107i stupac</strong> stvara grupu razdvajanja na stupcu. Time se stupac izvla\010Di iz izvje\0161\0107a kao glavni zapis.</li>'),
unistr('<li><strong>Informacije o stupcu</strong> prikazuju tekst pomo\0107i o stupcu, ako je dostupan.</li>'),
unistr('<li><strong>Podru\010Dje teksta</strong> upotrebljava se za uno\0161enje kriterija pretra\017Eivanja bez razlikovanja velikih i malih slova'),
'(bez potrebe za zamjenskim znakovima). Unos vrijednosti smanjuje popis',
unistr('vrijednosti u dnu izbornika. Zatim mo\017Eete odabrati vrijednost s dna'),
unistr('i odabrana vrijednost stvorit \0107e se kao filtar pomo\0107u ''='''),
unistr('(primjerice, <code>column = ''ABC''</code>). Umjesto toga mo\017Eete pritisnuti ikonu lampice i unijeti vrijednost koja \0107e se stvoriti kao filtar s modifikatorom ''LIKE'''),
'(primjerice, <code>column LIKE ''%ABC%''</code>).</li>',
unistr('<li><strong>Popis jedinstvenih vrijednosti</strong> sadr\017Ei prvih 500 jedinstvenih'),
'vrijednosti koje ispunjavaju kriterije filtriranja. Ako je stupac datum, umjesto njega prikazuje se popis raspona',
unistr('datuma. Ako odaberete vrijednost, stvorit \0107e se filtar'),
unistr('pomo\0107u ''='' (primjerice, <code>column = ''ABC''</code>).</li>'),
'</ul>'))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371317218751426)
,p_name=>'APEXIR_HELP_COMPUTE'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Omogu\0107uje vam dodavanje izra\010Dunatih stupaca u izvje\0161\0107e. To mogu biti matemati\010Dki izra\010Duni (primjerice, <code>NBR_HOURS/24</code>) ili standardne Oracle'),
unistr('funkcije primijenjene na postoje\0107e stupce. Neki se prikazuju kao primjeri, a mogu se upotrebljavati i drugi (poput <code>TO_DATE)</code>. Opcije obuhva\0107aju:'),
'<p></p>',
'<ul>',
unistr('<li><strong>Izra\010Dun</strong> vam omogu\0107ava odabir prethodno definiranog izra\010Duna za ure\0111ivanje.</li>'),
'<li><strong>Zaglavlje stupca</strong> zaglavlje je stupca za novi stupac.</li>',
'<li><strong>Maska formata</strong> odnosi se na Oracle masku formata koja se primjenjuje na stupac (primjerice, S9999).</li>',
unistr('<li><strong>Izra\010Dun</strong> je izra\010Dun koji se izvr\0161ava. Unutar izra\010Duna stupci se referenciraju pomo\0107u prikazanih drugih naziva.</li>'),
'</ul>',
unistr('<p>Ispod izra\010Duna stupci u upitu prikazuju se s povezanim'),
unistr('drugim nazivima. Pritiskom na naziv stupca ili drugi naziv uklju\010Duje ih se'),
unistr('u izra\010Dun. Uz stupce se nalazi tipkovnica. Ta tipkovnica funkcionira'),
unistr('kao pre\010Dac za \010Desto upotrebljavane tipke. Krajnje desno nalaze se funkcije.</p>'),
unistr('<p>Sljede\0107i primjer izra\010Duna pokazuje kako prikazati ukupnu naknadu:</p>'),
'<pre>CASE WHEN A = ''SALES'' THEN B + C ELSE B END</pre>',
unistr('(pri \010Demu je A ORGANIZACIJA, B PLA\0106A, a C PROVIZIJA)'),
''))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377829999751427)
,p_name=>'APEXIR_HELP_CONTROL_BREAK'
,p_message_language=>'hr'
,p_message_text=>unistr('Upotrebljava se za stvaranje grupe razdvajanja u jednom ili vi\0161e stupaca. Time se stupci izvla\010De iz interaktivnog izvje\0161\0107a i prikazuju kao glavni zapis.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372085890751426)
,p_name=>'APEXIR_HELP_DETAIL_VIEW'
,p_message_language=>'hr'
,p_message_text=>unistr('Za prikaz pojedinosti svakog pojedina\010Dnog retka pritisnite ikonu prikaza pojedina\010Dnog retka na retku koji \017Eelite prikazati. Ako je dostupan, prikaz pojedina\010Dnog retka uvijek \0107e biti u prvom stupcu. Ovisno o prilago\0111avanju interaktivnog izvje\0161\0107a prika')
||unistr('z pojedina\010Dnog retka mo\017Ee biti standardni prikaz ili prilago\0111ena stranica s mogu\0107im dopu\0161tenjem a\017Euriranja.')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371956403751426)
,p_name=>'APEXIR_HELP_DOWNLOAD'
,p_message_language=>'hr'
,p_message_text=>unistr('Omogu\0107uje preuzimanje trenutnog skupa rezultata. Formati preuzimanja uklju\010Duju PDF, Excel, HTML i CSV. Opcije preuzimanja razlikuju se ovisno o preuzetom formatu. Svi formati mogu biti i Po\0161alji kao e-po\0161tu.')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371045118751425)
,p_name=>'APEXIR_HELP_FILTER'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Fokusira izvje\0161\0107e dodavanjem ili mijenjanjem uvjeta <code>WHERE</code> u upitu. Mo\017Eete filtrirati po stupcu ili retku.  '),
'<p>Ako filtrirate po stupcu, odaberite stupac (ne mora biti onaj koji se prikazuje), odaberite standardni Oracle operator (=, !=, not in, between) i unesite izraz za usporedbu. Izrazi razlikuju veliko i malo slovo. Upotrijebite % kao zamjenski znak ('
||'primjerice, <code>STATE_NAME',
'like A%)</code>.</p>',
unistr('<p>Ako filtrirate po retku, mo\017Eete stvoriti slo\017Eene uvjete <code>WHERE</code> pomo\0107u'),
'drugih naziva stupca i bilo kojih Oracle funkcija i operatora (primjerice, <code>G = ''VA'' or G = ''CT''</code>, gdje je',
'<code>G</code> drugi naziv za <code>CUSTOMER_STATE</code>).</p>',
''))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371605858751426)
,p_name=>'APEXIR_HELP_FLASHBACK'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Upit Flashback omogu\0107uje vam prikaz podataka u obliku u kojem su postojali u prethodnoj vremenskoj'),
unistr('to\010Dki. Zadana koli\010Dina vremena za koju mo\017Eete izvr\0161iti flashback iznosi 3 sata (ili 180'),
unistr('minuta), ali stvarno \0107e se vrijeme razlikovati za svaku bazu podataka.')))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436216132751445)
,p_name=>'APEXIR_HELP_FORMAT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Format vam omogu\0107uje prilagodbu prikaza izvje\0161\0107a.'),
unistr('Format sadr\017Ei sljede\0107e podizbornike:</p>'),
'<ul><li>Sortiranje</li>',
'<li>Kontrolno razdvajanje</li>',
'<li>Isticanje</li>',
unistr('<li>Izra\010Dun</li>'),
'<li>Agregiranje</li>',
'<li>Grafikon</li>',
'<li>Grupiranje po</li>',
'<li>Zaokretanje</li>',
'</ul>',
''))
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434467260751444)
,p_name=>'APEXIR_HELP_GROUP_BY'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Mo\017Eete definirati jedan prikaz na\010Dina grupiranja po spremljenom'),
unistr('izvje\0161\0107u. Nakon definiranja mo\017Eete prebacivati sa prikaza grupiranja po na prikaz izvje\0161\0107a i obratno pomo\0107u ikona prikaza na traci za pretra\017Eivanje. Kako biste stvorili prikaz grupiranja po, odaberite:'),
'<p></p><ul>',
unistr('<li>stupce na koje \0107e se grupiranje primijeniti</li>'),
unistr('<li>stupce za za agregiranje uz funkciju koja se izvodi (prosje\010Dno, zbroj, broj itd.)</li>'),
'</ul>'))
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371247883751426)
,p_name=>'APEXIR_HELP_HIGHLIGHT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Omogu\0107uje vam definiranje filtra. Redci koji ispunjavaju kriterije filtriranja prikazuju se kao istaknuti upotrebom zna\010Dajki povezanih s filtrom. Opcije obuhva\0107aju:</p>'),
'<ul>',
'<li><strong>Naziv</strong> se upotrebljava samo za prikaz.</li>',
'<li><strong>Slijed</strong> identificira slijed ocjenjivanja pravila.</li>',
unistr('<li><strong>Omogu\0107eno</strong> identificira je li pravilo omogu\0107eno ili onemogu\0107eno.</li>'),
'<li><strong>Vrsta isticanja</strong> identificira treba li se istaknuti redak ili',
unistr('\0107elija. Ako se odabere \0107elija, isti\010De se stupac naveden u'),
'uvjetu isticanja.</li>',
unistr('<li><strong>Boja pozadine</strong> odnosi se na novu boju pozadine istaknutog podru\010Dja.</li>'),
unistr('<li><strong>Boja teksta</strong> nova je boja teksta istaknutog podru\010Dja.</li>'),
'<li><strong>Uvjet isticanja</strong> definira uvjet filtriranja.</li>',
'</ul>',
''))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264681253751394)
,p_name=>'APEXIR_HELP_PIVOT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Mo\017Eete definirati jedan zaokretni prikaz po spremljenom izvje\0161\0107u. Nakon definiranja mo\017Eete prebacivati sa zaokretnog prikaza na prikaz izvje\0161\0107a i obratno pomo\0107u ikona prikaza na traci za pretra\017Eivanje. Kako biste stvorili prikaz zaokretanja, odaberit')
||'e: ',
'<p></p>',
'<ul>',
unistr('<li>stupce na koje \0107e se zaokretanje primijeniti</li>'),
'<li>stupce za prikaz kao retke</li>',
unistr('<li>stupce za agregiranje uz funkciju koja se izvodi (prosje\010Dno, zbroj, broj itd.)</li>'),
'</ul>'))
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382373538751429)
,p_name=>'APEXIR_HELP_REPORT_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Ako prilagodite interaktivno izvje\0161\0107e, postavke izvje\0161\0107a prikazuju se'),
unistr('ispod trake za pretra\017Eivanje i iznad izvje\0161\0107a. To se podru\010Dje mo\017Ee sa\017Eeti i pro\0161iriti uz pomo\0107 ikone s lijeve strane.'),
'<p>',
unistr('Za svaku postavku izvje\0161\0107a mo\017Eete napraviti sljede\0107e:'),
'</p><ul>',
'<li>Urediti postavku tako da pritisnete njezin naziv.</li>',
unistr('<li>Onemogu\0107iti/omogu\0107iti postavku tako da poni\0161tite oznaku / ozna\010Dite potvrdni okvir Omogu\0107i/Onemogu\0107i. Upotrebom te kontrole privremeno uklju\010Dite i isklju\010Dite postavku.</li>'),
'<li>Ukloniti postavku tako da pritisnete ikonu Ukloni.</li>',
'</ul>',
unistr('<p>Ako ste stvorili grafikon, grupiranje po ili zaokretanje, mo\017Eete se prebacivati izme\0111u tih opcija i osnovnog izvje\0161\0107a upotrebom veza na prikaz izvje\0161\0107a, prikaz grafikona, prikaz grupiranja po i zaokretni prikaz'),
unistr('koje se nalaze s desne strane. Ako prika\017Eete grafikon, grupiranje po ili zaokretanje,'),
unistr('mo\017Eete upotrijebiti i vezu za ure\0111ivanje kako biste uredili postavke.</p>'),
''))
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371868179751426)
,p_name=>'APEXIR_HELP_RESET'
,p_message_language=>'hr'
,p_message_text=>unistr('Ponovno postavlja izvje\0161\0107e na zadane postavke i uklanja sve prilagodbe koje ste napravili.')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436590681751445)
,p_name=>'APEXIR_HELP_ROWS_PER_PAGE'
,p_message_language=>'hr'
,p_message_text=>'Postavite broj zapisa za prikaz po stranici.'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371788869751426)
,p_name=>'APEXIR_HELP_SAVE_REPORT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Sprema prilago\0111eno izvje\0161\0107e za budu\0107u upotrebu. Navedite naziv i neobavezni opis, a mo\017Eete ga u\010Diniti i javno dostupnim (odnosno, dostupnim svim korisnicima koji mogu pristupiti primarnom zadanom izvje\0161\0107u). Mogu se spremiti \010Detiri vrste interaktiv')
||unistr('nih izvje\0161\0107a:</p>'),
'<ul>',
unistr('<li><strong>Primarno zadano</strong> (samo za razvojne programere). Primarno zadano izvje\0161\0107e ono je koje se inicijalno prikazuje. Naziv primarnih zadanih izvje\0161\0107a ne mo\017Ee se mijenjati niti ga se mo\017Ee izbrisati.</li>'),
unistr('<li><strong>Alternativno izvje\0161\0107e</strong> (samo za razvojne programere). Omogu\0107uje razvojnim programerima stvaranje vi\0161e izgleda izvje\0161\0107a. Samo razvojni programeri mogu spremati, mijenjati naziv izvje\0161\0107a ili izbrisati alternativno izvje\0161\0107e.</li>'),
unistr('<li><strong>Javno izvje\0161\0107e</strong> (krajni korisnik). Mo\017Ee ga spremiti, promijeniti mu naziv ili izbrisati krajnji korisnik koji ga je stvorio. Ostali korisnici mogu prikazati i spremiti izgled kao drugo izvje\0161\0107e.</li>'),
unistr('<li><strong>Privatno izvje\0161\0107e</strong> (krajnji korisnik). Samo krajnji korisnik koji je stvorio izvje\0161\0107e mo\017Ee prikazati, spremiti, promijeniti naziv izvje\0161\0107a ili izbrisati izvje\0161\0107e.</li>'),
'</ul>',
unistr('<p>Ako spremate prilago\0111ena izvje\0161\0107a, u traci za pretra\017Eivanje lijevo od alata za odabir redaka prikazat \0107e se alat za odabir izvje\0161\0107a (ako je ta zna\010Dajka omogu\0107ena).</p>'),
''))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370727974751425)
,p_name=>'APEXIR_HELP_SEARCH_BAR'
,p_message_language=>'hr'
,p_message_text=>unistr('U vrhu svake stranice izvje\0161\0107a nalazi se podru\010Dje za pretra\017Eivanje. To podru\010Dje (ili traka za pretra\017Eivanje) sadr\017Ei sljede\0107e zna\010Dajke:')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437113658751445)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ACTIONS_MENU'
,p_message_language=>'hr'
,p_message_text=>unistr('<li><strong>Izbornik akcija</strong> omogu\0107uje vam prilago\0111avanje izvje\0161\0107a. Pogledajte odjeljke u nastavku.</li>')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436607806751445)
,p_name=>'APEXIR_HELP_SEARCH_BAR_FINDER'
,p_message_language=>'hr'
,p_message_text=>unistr('<li><strong>Ikona za odabir stupaca</strong> omogu\0107uje vam identificiranje stupaca za pretra\017Eivanje (ili odabir svih).</li>')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436981871751445)
,p_name=>'APEXIR_HELP_SEARCH_BAR_REPORTS'
,p_message_language=>'hr'
,p_message_text=>unistr('<li><strong>Izvje\0161\0107a</strong> prikazuju alternativna zadana i spremljena privatna ili javna izvje\0161\0107a.</li>')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436877904751445)
,p_name=>'APEXIR_HELP_SEARCH_BAR_ROWS'
,p_message_language=>'hr'
,p_message_text=>'<li><strong>Redci</strong> postavljaju broj zapisa za prikaz po stranici.</li>'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436708295751445)
,p_name=>'APEXIR_HELP_SEARCH_BAR_TEXTBOX'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<li><strong>Podru\010Dje teksta</strong> omogu\0107uje vam unos kriterija pretra\017Eivanja bez razlikovanja malog i velikog slova (zamjenski znakovi su implicirani).</li>'),
unistr('<li><strong>Gumb Idi</strong> izvr\0161ava pretra\017Eivanje. Pritiskom na tipku enter tako\0111er \0107e se izvr\0161iti pretra\017Eivanje kada je pokaziva\010D u podru\010Dju teksta za pretra\017Eivanje.</li>')))
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437093217751445)
,p_name=>'APEXIR_HELP_SEARCH_BAR_VIEW'
,p_message_language=>'hr'
,p_message_text=>unistr('<li><strong>Ikone prikaza</strong> slu\017Ee za prebacivanje izme\0111u prikaza ikona, izvje\0161\0107a, pojedinosti, grafikona, grupiranja po i zaokretanja za izvje\0161\0107e, ako su definirani.</li>')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370961601751425)
,p_name=>'APEXIR_HELP_SELECT_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>unistr('Upotrebljava se za izmjenu prikazanih stupaca. Prikazuju se desni stupci. Lijevi stupci ostaju sakriveni. Redoslijed prikazanih stupaca mo\017Eete promijeniti upotrebom strelica koje se nalaze krajnje desno. Izra\010Dunati stupci imaju prefiks <strong>**</st')
||'rong>.'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139371178896751425)
,p_name=>'APEXIR_HELP_SORT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Upotrebljava se za mijenjanje stupaca za sortiranje i odre\0111uje ho\0107e li se'),
unistr('sortiranje vr\0161iti uzlazno ili silazno. Mo\017Eete i navesti kako \0107e se obra\0111ivati vrijednosti'),
unistr('<code>NULLs</code>. Prema zadanoj postavci vrijednosti <code>NULLs</code> uvijek se prikazuju posljednje ili ih se mo\017Ee prikazati prve. Rezultiraju\0107e sortiranje prikazuje se desno od'),
unistr('zaglavlja stupca u izvje\0161\0107u.</p>')))
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434279915751444)
,p_name=>'APEXIR_HELP_SUBSCRIPTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Kada dodate pretplatu, trebate navesti adresu e-po\0161te (ili vi\0161e adresa e-po\0161te odvojenih zarezom), predmet e-po\0161te, u\010Destalost te datum po\010Detka i zavr\0161etka. Rezultiraju\0107a e-po\0161ta sadr\017Ei izvezenu  (PDF, Excel, HTML ili CSV) verziju interaktivnog izvje')
||unistr('\0161\0107a s trenutnim podacima s postavkama izvje\0161\0107a prisutnim kada je pretplata dodana.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375886710751427)
,p_name=>'APEXIR_HIDE_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Sakrij stupac'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366237909751424)
,p_name=>'APEXIR_HIGHLIGHT'
,p_message_language=>'hr'
,p_message_text=>'Istakni'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377385703751427)
,p_name=>'APEXIR_HIGHLIGHTS'
,p_message_language=>'hr'
,p_message_text=>'Isticanja'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347504986751419)
,p_name=>'APEXIR_HIGHLIGHT_CELL_WITH_COLORS'
,p_message_language=>'hr'
,p_message_text=>unistr('Istakni \0107eliju, %0 na %1')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382424920751429)
,p_name=>'APEXIR_HIGHLIGHT_CONDITION'
,p_message_language=>'hr'
,p_message_text=>'Uvjet isticanja'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347476806751418)
,p_name=>'APEXIR_HIGHLIGHT_ROW_WITH_COLORS'
,p_message_language=>'hr'
,p_message_text=>'Istakni redak, %0 na %1'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434805234751444)
,p_name=>'APEXIR_HIGHLIGHT_STYLE'
,p_message_language=>'hr'
,p_message_text=>'Stil isticanja'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339004413751416)
,p_name=>'APEXIR_HIGHLIGHT_TYPE'
,p_message_language=>'hr'
,p_message_text=>'Vrsta isticanja'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453613165751450)
,p_name=>'APEXIR_HORIZONTAL'
,p_message_language=>'hr'
,p_message_text=>'Vodoravno'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482697648751458)
,p_name=>'APEXIR_INACTIVE_SETTING'
,p_message_language=>'hr'
,p_message_text=>'1 neaktivna postavka'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482793430751458)
,p_name=>'APEXIR_INACTIVE_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>'Broj neaktivnih postavki: %0'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372430825751426)
,p_name=>'APEXIR_INTERACTIVE_REPORT_HELP'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za interaktivno izvje\0161\0107e')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383419423751429)
,p_name=>'APEXIR_INVALID'
,p_message_language=>'hr'
,p_message_text=>'Nije valjano'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376814670751427)
,p_name=>'APEXIR_INVALID_COMPUTATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Izraz izra\010Duna nije valjan. %0')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332499449751414)
,p_name=>'APEXIR_INVALID_END_DATE'
,p_message_language=>'hr'
,p_message_text=>unistr('Datum zavr\0161etka mora biti ve\0107i od datuma po\010Detka.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391680121751432)
,p_name=>'APEXIR_INVALID_FILTER'
,p_message_language=>'hr'
,p_message_text=>'Izraz filtra nije valjan. %0'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461415241751452)
,p_name=>'APEXIR_INVALID_FILTER_QUERY'
,p_message_language=>'hr'
,p_message_text=>'Upit filtra nije valjan'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482815289751458)
,p_name=>'APEXIR_INVALID_SETTING'
,p_message_language=>'hr'
,p_message_text=>'1 postavka koja nije valjana'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482930746751458)
,p_name=>'APEXIR_INVALID_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>'Broj postavki koje nisu valjane: %0'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435024761751444)
,p_name=>'APEXIR_IN_MINUTES'
,p_message_language=>'hr'
,p_message_text=>'(u minutama)'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452029927751449)
,p_name=>'APEXIR_IS_IN_THE_LAST'
,p_message_language=>'hr'
,p_message_text=>'%0 u prethodnom je intervalu od %1'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452245196751449)
,p_name=>'APEXIR_IS_IN_THE_NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 u sljede\0107em je intervalu od %1')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452178899751449)
,p_name=>'APEXIR_IS_NOT_IN_THE_LAST'
,p_message_language=>'hr'
,p_message_text=>'%0 nije u prethodnom intervalu od %1'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452385047751449)
,p_name=>'APEXIR_IS_NOT_IN_THE_NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 nije u sljede\0107em intervalu od %1')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381567063751429)
,p_name=>'APEXIR_KEYPAD'
,p_message_language=>'hr'
,p_message_text=>'Tipkovnica'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345234386751418)
,p_name=>'APEXIR_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Oznaka %0'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375448639751427)
,p_name=>'APEXIR_LABEL_AXIS_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Naslov osi za oznaku'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367705279751424)
,p_name=>'APEXIR_LAST_DAY'
,p_message_language=>'hr'
,p_message_text=>'Zadnji dan'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367995935751425)
,p_name=>'APEXIR_LAST_HOUR'
,p_message_language=>'hr'
,p_message_text=>'Zadnji sat'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367496049751424)
,p_name=>'APEXIR_LAST_MONTH'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161li mjesec')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367521965751424)
,p_name=>'APEXIR_LAST_WEEK'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161li tjedan')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367630635751424)
,p_name=>'APEXIR_LAST_X_DAYS'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih dana: %0'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367803350751424)
,p_name=>'APEXIR_LAST_X_HOURS'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih sati: %0'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367210762751424)
,p_name=>'APEXIR_LAST_X_YEARS'
,p_message_language=>'hr'
,p_message_text=>'Broj prethodnih godina: %0'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139367314746751424)
,p_name=>'APEXIR_LAST_YEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161la godina')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345150062751418)
,p_name=>'APEXIR_LINE'
,p_message_language=>'hr'
,p_message_text=>'Linijski'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341934574751417)
,p_name=>'APEXIR_LINE_WITH_AREA'
,p_message_language=>'hr'
,p_message_text=>unistr('Redak s povr\0161inom')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461381308751452)
,p_name=>'APEXIR_MAP_IT'
,p_message_language=>'hr'
,p_message_text=>'Mapiraj'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376373206751427)
,p_name=>'APEXIR_MAX_QUERY_COST'
,p_message_language=>'hr'
,p_message_text=>unistr('Procjenjuje se da \0107e upit prekora\010Diti maksimalni broj dopu\0161tenih resursa. Izmijenite postavke izvje\0161\0107a i poku\0161ajte ponovo.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357742053751422)
,p_name=>'APEXIR_MAX_ROW_CNT'
,p_message_language=>'hr'
,p_message_text=>unistr('Maksimalni je broj redaka za ovo izvje\0161\0107e %0. Primijenite filtar kako biste smanjili broj zapisa u upitu.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461908478751452)
,p_name=>'APEXIR_MAX_X'
,p_message_language=>'hr'
,p_message_text=>'Maksimalno %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462106484751452)
,p_name=>'APEXIR_MEDIAN_X'
,p_message_language=>'hr'
,p_message_text=>'Sredina: %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304482631751406)
,p_name=>'APEXIR_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>'Poruka'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362026621751423)
,p_name=>'APEXIR_MIN_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 min.'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462067883751452)
,p_name=>'APEXIR_MIN_X'
,p_message_language=>'hr'
,p_message_text=>'Minimalno %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461060441751452)
,p_name=>'APEXIR_MONTH'
,p_message_language=>'hr'
,p_message_text=>'Mjesec'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435433931751444)
,p_name=>'APEXIR_MONTHLY'
,p_message_language=>'hr'
,p_message_text=>unistr('Mjese\010Dno')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374669527751426)
,p_name=>'APEXIR_MOVE'
,p_message_language=>'hr'
,p_message_text=>'Premjesti'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374502036751426)
,p_name=>'APEXIR_MOVE_ALL'
,p_message_language=>'hr'
,p_message_text=>'Premjesti sve'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487746592751460)
,p_name=>'APEXIR_MULTIIR_PAGE_REGION_STATIC_ID_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Mora se navesti stati\010Dni ID podru\010Dja jer stranica sadr\017Ei vi\0161e interaktivnih izvje\0161\0107a.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340668626751416)
,p_name=>'APEXIR_NAME'
,p_message_language=>'hr'
,p_message_text=>'Naziv'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370317258751425)
,p_name=>'APEXIR_NEW_AGGREGATION'
,p_message_language=>'hr'
,p_message_text=>'Novo agregiranje'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483507329751459)
,p_name=>'APEXIR_NEW_CATEGORY_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Nova kategorija'
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370452700751425)
,p_name=>'APEXIR_NEW_COMPUTATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Novi izra\010Dun')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365126100751424)
,p_name=>'APEXIR_NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368283559751425)
,p_name=>'APEXIR_NEXT_DAY'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i dan')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368048854751425)
,p_name=>'APEXIR_NEXT_HOUR'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i sat')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368559409751425)
,p_name=>'APEXIR_NEXT_MONTH'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i mjesec')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368400235751425)
,p_name=>'APEXIR_NEXT_WEEK'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i tjedan')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368320257751425)
,p_name=>'APEXIR_NEXT_X_DAYS'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih dana: %0')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368137579751425)
,p_name=>'APEXIR_NEXT_X_HOURS'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih sati: %0')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368704770751425)
,p_name=>'APEXIR_NEXT_X_YEARS'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj sljede\0107ih godina: %0')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368629168751425)
,p_name=>'APEXIR_NEXT_YEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107a godina')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340934293751417)
,p_name=>'APEXIR_NO'
,p_message_language=>'hr'
,p_message_text=>'Ne'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383633470751429)
,p_name=>'APEXIR_NONE'
,p_message_language=>'hr'
,p_message_text=>unistr('- Ni\0161ta -')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434617160751444)
,p_name=>'APEXIR_NOT_VALID_EMAIL'
,p_message_language=>'hr'
,p_message_text=>unistr('Nije valjana adresa e-po\0161te.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306758414751406)
,p_name=>'APEXIR_NO_COLUMNS_SELECTED'
,p_message_language=>'hr'
,p_message_text=>'Za prikaz nije odabran nijedan stupac. Upotrijebite <strong>Stupce</strong> u izborniku akcija kako bi stupci bili vidljivi.'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380166221751428)
,p_name=>'APEXIR_NULLS_ALWAYS_FIRST'
,p_message_language=>'hr'
,p_message_text=>'Vrijednosti Null uvijek na prvom mjestu'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380059242751428)
,p_name=>'APEXIR_NULLS_ALWAYS_LAST'
,p_message_language=>'hr'
,p_message_text=>'Vrijednosti Null uvijek na zadnjem mjestu'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380526243751428)
,p_name=>'APEXIR_NULL_SORTING'
,p_message_language=>'hr'
,p_message_text=>'Sortiranje vrijednosti Null %0'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376904863751427)
,p_name=>'APEXIR_NUMERIC_FLASHBACK_TIME'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrijeme za Flashback mora biti numeri\010Dko.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376578638751427)
,p_name=>'APEXIR_NUMERIC_SEQUENCE'
,p_message_language=>'hr'
,p_message_text=>unistr('Slijed mora biti numeri\010Dki.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381086928751428)
,p_name=>'APEXIR_OPERATOR'
,p_message_language=>'hr'
,p_message_text=>'Operator'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339566845751416)
,p_name=>'APEXIR_ORANGE'
,p_message_language=>'hr'
,p_message_text=>unistr('naran\010Dasta')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453531694751450)
,p_name=>'APEXIR_ORIENTATION'
,p_message_language=>'hr'
,p_message_text=>'Orijentacija'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341469734751417)
,p_name=>'APEXIR_OTHER'
,p_message_language=>'hr'
,p_message_text=>'Ostalo'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307684140751407)
,p_name=>'APEXIR_PAGINATION_OF'
,p_message_language=>'hr'
,p_message_text=>'Paginacija za %0'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321647802751411)
,p_name=>'APEXIR_PDF_ORIENTATION'
,p_message_language=>'hr'
,p_message_text=>'Orijentacija stranice'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322375937751411)
,p_name=>'APEXIR_PDF_ORIENTATION_HORIZONTAL'
,p_message_language=>'hr'
,p_message_text=>'Vodoravno'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322453332751411)
,p_name=>'APEXIR_PDF_ORIENTATION_VERTICAL'
,p_message_language=>'hr'
,p_message_text=>'Okomito'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321512592751411)
,p_name=>'APEXIR_PDF_PAGE_SIZE'
,p_message_language=>'hr'
,p_message_text=>unistr('Veli\010Dina stranice')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322186553751411)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A3'
,p_message_language=>'hr'
,p_message_text=>'A3'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322043562751411)
,p_name=>'APEXIR_PDF_PAGE_SIZE_A4'
,p_message_language=>'hr'
,p_message_text=>'A4'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322231426751411)
,p_name=>'APEXIR_PDF_PAGE_SIZE_CUSTOM'
,p_message_language=>'hr'
,p_message_text=>unistr('Prilago\0111eno')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321814862751411)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LEGAL'
,p_message_language=>'hr'
,p_message_text=>'Legal'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321717858751411)
,p_name=>'APEXIR_PDF_PAGE_SIZE_LETTER'
,p_message_language=>'hr'
,p_message_text=>'Letter'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321995952751411)
,p_name=>'APEXIR_PDF_PAGE_SIZE_TABLOID'
,p_message_language=>'hr'
,p_message_text=>'Tabloid'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462413179751452)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_COUNT_X'
,p_message_language=>'hr'
,p_message_text=>'Postotak ukupnog broja %0 (%)'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461683196751452)
,p_name=>'APEXIR_PERCENT_OF_TOTAL_SUM_X'
,p_message_language=>'hr'
,p_message_text=>'Postotak ukupnog zbroja %0 (%)'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460610043751452)
,p_name=>'APEXIR_PERCENT_TOTAL_COUNT'
,p_message_language=>'hr'
,p_message_text=>'Postotak ukupnog broja'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460587505751452)
,p_name=>'APEXIR_PERCENT_TOTAL_SUM'
,p_message_language=>'hr'
,p_message_text=>'Postotak ukupnog zbroja'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345029549751418)
,p_name=>'APEXIR_PIE'
,p_message_language=>'hr'
,p_message_text=>'Tortni'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410766626751437)
,p_name=>'APEXIR_PIVOT'
,p_message_language=>'hr'
,p_message_text=>'Zaokretanje'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412250504751438)
,p_name=>'APEXIR_PIVOT_AGG_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'Treba se navesti agregiranje.'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412453325751438)
,p_name=>'APEXIR_PIVOT_AGG_NOT_ON_ROW_COL'
,p_message_language=>'hr'
,p_message_text=>unistr('Agregiranje se ne mo\017Ee izvr\0161iti na stupcu koji je odabran kao stupac retka.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411619111751437)
,p_name=>'APEXIR_PIVOT_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Zaokretni stupci'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411423160751437)
,p_name=>'APEXIR_PIVOT_COLUMN_N'
,p_message_language=>'hr'
,p_message_text=>'Zaokretni stupac %0'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412057253751438)
,p_name=>'APEXIR_PIVOT_COLUMN_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'Mora se navesti zaokretni stupac.'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264553381751394)
,p_name=>'APEXIR_PIVOT_MAX_ROW_CNT'
,p_message_language=>'hr'
,p_message_text=>unistr('Maksimalni broj redaka za pivot upit ograni\010Dava broj redaka u osnovnom upitu, a ne prikazani broj redaka. Osnovni upit prekora\010Duje maksimalni broj redaka koji iznosi %0. Primijenite filtar kako biste smanjili broj zapisa u osnovnom upitu.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411980268751437)
,p_name=>'APEXIR_PIVOT_SORT'
,p_message_language=>'hr'
,p_message_text=>'Zaokretno sortiranje'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377932588751427)
,p_name=>'APEXIR_PIVOT_TOO_MANY_VALUES'
,p_message_language=>'hr'
,p_message_text=>unistr('Zaokretni stupac sadr\017Ei previ\0161e zasebnih vrijednosti - SQL pivot  ne mo\017Ee se generirati.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308907254751407)
,p_name=>'APEXIR_PIVOT_VIEW_OF'
,p_message_language=>'hr'
,p_message_text=>'Zaokretni prikaz za %0'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434714565751444)
,p_name=>'APEXIR_PREVIEW'
,p_message_language=>'hr'
,p_message_text=>'Pregled'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365207332751424)
,p_name=>'APEXIR_PREVIOUS'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139459589384751451)
,p_name=>'APEXIR_PRIMARY'
,p_message_language=>'hr'
,p_message_text=>'Primarno'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435766217751444)
,p_name=>'APEXIR_PRIMARY_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Primarno izvje\0161\0107e')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321491653751411)
,p_name=>'APEXIR_PRINT_ACCESSIBLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Di oznake pristupa\010Dnosti')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282290788751399)
,p_name=>'APEXIR_PRINT_STRIP_RICH_TEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Ukloni oboga\0107eni tekst')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390680922751431)
,p_name=>'APEXIR_PRIVATE'
,p_message_language=>'hr'
,p_message_text=>'Privatno'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345676179751418)
,p_name=>'APEXIR_PUBLIC'
,p_message_language=>'hr'
,p_message_text=>'Javno'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341264805751417)
,p_name=>'APEXIR_RED'
,p_message_language=>'hr'
,p_message_text=>'crvena'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487650265751460)
,p_name=>'APEXIR_REGION_STATIC_ID_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Stati\010Dni ID podru\010Dja %0 ne postoji.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374759405751427)
,p_name=>'APEXIR_REMOVE'
,p_message_language=>'hr'
,p_message_text=>'Ukloni'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374878530751427)
,p_name=>'APEXIR_REMOVE_ALL'
,p_message_language=>'hr'
,p_message_text=>'Ukloni sve'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483005940751458)
,p_name=>'APEXIR_REMOVE_CHART'
,p_message_language=>'hr'
,p_message_text=>'Ukloni grafikon'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374325218751426)
,p_name=>'APEXIR_REMOVE_CONTROL_BREAK'
,p_message_language=>'hr'
,p_message_text=>'Ukloni kontrolno razdvajanje'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374009430751426)
,p_name=>'APEXIR_REMOVE_FILTER'
,p_message_language=>'hr'
,p_message_text=>'Ukloni filtar'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374195411751426)
,p_name=>'APEXIR_REMOVE_FLASHBACK'
,p_message_language=>'hr'
,p_message_text=>'Ukloni Flashback'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483147863751458)
,p_name=>'APEXIR_REMOVE_GROUP_BY'
,p_message_language=>'hr'
,p_message_text=>'Ukloni grupiranje po'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374442236751426)
,p_name=>'APEXIR_REMOVE_HIGHLIGHT'
,p_message_language=>'hr'
,p_message_text=>'Ukloni isticanje'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483268687751458)
,p_name=>'APEXIR_REMOVE_PIVOT'
,p_message_language=>'hr'
,p_message_text=>'Ukloni zaokretanje'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464326325751453)
,p_name=>'APEXIR_REMOVE_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Ukloni izvje\0161\0107e')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446130121751448)
,p_name=>'APEXIR_RENAME_DEFAULT_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Promijeni naziv zadanog izvje\0161\0107a')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383990928751429)
,p_name=>'APEXIR_RENAME_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Promijeni naziv izvje\0161\0107a')
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365565405751424)
,p_name=>'APEXIR_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e')
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462583627751452)
,p_name=>'APEXIR_REPORTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107a')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337770046751416)
,p_name=>'APEXIR_REPORT_ALIAS_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljeno interaktivno izvje\0161\0107e s drugim nazivom %0 ne postoji.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390910013751431)
,p_name=>'APEXIR_REPORT_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e ne postoji.')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337862580751416)
,p_name=>'APEXIR_REPORT_ID_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('ID spremljenog interaktivnog izvje\0161\0107a ID %0 ne postoji.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382289750751429)
,p_name=>'APEXIR_REPORT_SETTINGS'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavke izvje\0161\0107a')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306474725751406)
,p_name=>'APEXIR_REPORT_SETTINGS_OF'
,p_message_language=>'hr'
,p_message_text=>unistr('Postavke izvje\0161\0107a za %0')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362551081751423)
,p_name=>'APEXIR_REPORT_VIEW'
,p_message_language=>'hr'
,p_message_text=>unistr('Prikaz izvje\0161\0107a')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366728542751424)
,p_name=>'APEXIR_RESET'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345830153751418)
,p_name=>'APEXIR_RESET_CONFIRM'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrati izvje\0161\0107e na zadane postavke.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341035293751417)
,p_name=>'APEXIR_ROW'
,p_message_language=>'hr'
,p_message_text=>'Redak'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458603954751451)
,p_name=>'APEXIR_ROWID_NOT_SUPPORTED_FOR_WEBSOURCE'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Eete upotrijebiti ROWID kao stupac primarnog klju\010Da za REST izvor podataka.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373461085751426)
,p_name=>'APEXIR_ROWS'
,p_message_language=>'hr'
,p_message_text=>'Redci'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436491696751445)
,p_name=>'APEXIR_ROWS_PER_PAGE'
,p_message_language=>'hr'
,p_message_text=>'Redaka po stranici'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411747337751437)
,p_name=>'APEXIR_ROW_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Stupci retka'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411575007751437)
,p_name=>'APEXIR_ROW_COLUMN_N'
,p_message_language=>'hr'
,p_message_text=>'Stupac retka %0'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412188054751438)
,p_name=>'APEXIR_ROW_COLUMN_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'Treba se navesti stupac retka.'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412389569751438)
,p_name=>'APEXIR_ROW_COL_DIFF_FROM_PIVOT_COL'
,p_message_language=>'hr'
,p_message_text=>'Stupac retka mora se razlikovati od zaokretnog stupca.'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387910124751430)
,p_name=>'APEXIR_ROW_FILTER'
,p_message_language=>'hr'
,p_message_text=>'Filtar redaka'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362660262751423)
,p_name=>'APEXIR_ROW_OF'
,p_message_language=>'hr'
,p_message_text=>'Redak %0 od %1'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366960946751424)
,p_name=>'APEXIR_ROW_TEXT_CONTAINS'
,p_message_language=>'hr'
,p_message_text=>unistr('Tekst retka sadr\017Ei')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340393138751416)
,p_name=>'APEXIR_SAVE'
,p_message_language=>'hr'
,p_message_text=>'Spremi'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377585761751427)
,p_name=>'APEXIR_SAVED_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljeno izvje\0161\0107e')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377434835751427)
,p_name=>'APEXIR_SAVED_REPORT_MSG'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremljeno izvje\0161\0107e = "%0"')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379692395751428)
,p_name=>'APEXIR_SAVE_DEFAULT_CONFIRM'
,p_message_language=>'hr'
,p_message_text=>unistr('Trenutne postavke izvje\0161\0107a upotrijebit \0107e se kao zadane za sve korisnike.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139446025572751447)
,p_name=>'APEXIR_SAVE_DEFAULT_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremi zadano izvje\0161\0107e')
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366656339751424)
,p_name=>'APEXIR_SAVE_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremi izvje\0161\0107e')
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483499975751458)
,p_name=>'APEXIR_SAVE_REPORT_DEFAULT'
,p_message_language=>'hr'
,p_message_text=>unistr('Spremi izvje\0161\0107e *')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437485038751445)
,p_name=>'APEXIR_SEARCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Ei')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372373860751426)
,p_name=>'APEXIR_SEARCH_BAR'
,p_message_language=>'hr'
,p_message_text=>unistr('Traka pretra\017E.')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139305788939751406)
,p_name=>'APEXIR_SEARCH_BAR_OF'
,p_message_language=>'hr'
,p_message_text=>unistr('Traka za pretra\017Eivanje za %0')
,p_version_scn=>2704907
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139483388257751458)
,p_name=>'APEXIR_SEARCH_COLUMN'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje: %0')
,p_is_js_message=>true
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442964934751447)
,p_name=>'APEXIR_SEARCH_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Ei izvje\0161\0107e')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139426951369751442)
,p_name=>'APEXIR_SELECTED_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Odabrani stupci'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342029476751417)
,p_name=>'APEXIR_SELECT_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'- Odabir stupca -'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365980052751424)
,p_name=>'APEXIR_SELECT_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>'Odabir stupaca'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345531093751418)
,p_name=>'APEXIR_SELECT_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>'- Odabir funkcije -'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373178596751426)
,p_name=>'APEXIR_SELECT_GROUP_BY_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'- Odaberite Grupiraj po stupcu -'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411204519751437)
,p_name=>'APEXIR_SELECT_PIVOT_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'- Odabir zaokretnog stupca -'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461599352751452)
,p_name=>'APEXIR_SELECT_ROW'
,p_message_language=>'hr'
,p_message_text=>'Odaberi redak'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411393215751437)
,p_name=>'APEXIR_SELECT_ROW_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'- Odabir stupca retka -'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139292873141751402)
,p_name=>'APEXIR_SEND'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161alji')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315392848751409)
,p_name=>'APEXIR_SEND_AS_EMAIL'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161alji kao poruku e-po\0161te')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340787806751416)
,p_name=>'APEXIR_SEQUENCE'
,p_message_language=>'hr'
,p_message_text=>'Slijed'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139366196467751424)
,p_name=>'APEXIR_SORT'
,p_message_language=>'hr'
,p_message_text=>'Sortiraj'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375608946751427)
,p_name=>'APEXIR_SORT_ASCENDING'
,p_message_language=>'hr'
,p_message_text=>'Uzlazno sortiranje'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375791737751427)
,p_name=>'APEXIR_SORT_DESCENDING'
,p_message_language=>'hr'
,p_message_text=>'Silazno sortiranje'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463705581751453)
,p_name=>'APEXIR_SORT_ORDER'
,p_message_language=>'hr'
,p_message_text=>'Redoslijed sortiranja'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370025668751425)
,p_name=>'APEXIR_SPACE_AS_IN_ONE_EMPTY_STRING'
,p_message_language=>'hr'
,p_message_text=>'razmak'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139381254828751428)
,p_name=>'APEXIR_STATUS'
,p_message_language=>'hr'
,p_message_text=>'Status %0'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435189637751444)
,p_name=>'APEXIR_SUBSCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Pretplata'
,p_is_js_message=>true
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460975813751452)
,p_name=>'APEXIR_SUBSCRIPTION_ENDING'
,p_message_language=>'hr'
,p_message_text=>unistr('Zavr\0161ava')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139279938225751399)
,p_name=>'APEXIR_SUBSCRIPTION_SKIP_IF_NDF'
,p_message_language=>'hr'
,p_message_text=>unistr('Presko\010Di ako se podaci ne prona\0111u')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139460826525751452)
,p_name=>'APEXIR_SUBSCRIPTION_STARTING_FROM'
,p_message_language=>'hr'
,p_message_text=>unistr('Zapo\010Dinje od')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461700552751452)
,p_name=>'APEXIR_SUM_X'
,p_message_language=>'hr'
,p_message_text=>'Zbroj %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452645160751449)
,p_name=>'APEXIR_TABLE_SUMMARY'
,p_message_language=>'hr'
,p_message_text=>unistr('%0, Izvje\0161\0107e = %1, Prikaz = %2')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339614606751416)
,p_name=>'APEXIR_TEXT_COLOR'
,p_message_language=>'hr'
,p_message_text=>'Boja teksta'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358387728751422)
,p_name=>'APEXIR_TIME_DAYS'
,p_message_language=>'hr'
,p_message_text=>'dana'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358266875751422)
,p_name=>'APEXIR_TIME_HOURS'
,p_message_language=>'hr'
,p_message_text=>'h'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358102346751422)
,p_name=>'APEXIR_TIME_MINS'
,p_message_language=>'hr'
,p_message_text=>'min'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358551420751422)
,p_name=>'APEXIR_TIME_MONTHS'
,p_message_language=>'hr'
,p_message_text=>'mj.'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358430299751422)
,p_name=>'APEXIR_TIME_WEEKS'
,p_message_language=>'hr'
,p_message_text=>'tj.'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139358634248751422)
,p_name=>'APEXIR_TIME_YEARS'
,p_message_language=>'hr'
,p_message_text=>'god.'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464109421751453)
,p_name=>'APEXIR_TOGGLE'
,p_message_language=>'hr'
,p_message_text=>'Prebacivanje'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139374939541751427)
,p_name=>'APEXIR_TOP'
,p_message_language=>'hr'
,p_message_text=>'Vrh'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457651477751451)
,p_name=>'APEXIR_UNGROUPED_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Negrupirani stupac'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376476785751427)
,p_name=>'APEXIR_UNIQUE_HIGHLIGHT_NAME'
,p_message_language=>'hr'
,p_message_text=>'Naziv isticanja mora biti jedinstven.'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344311764751418)
,p_name=>'APEXIR_UNSUPPORTED_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('nepodr\017Eana vrsta podataka')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375076870751427)
,p_name=>'APEXIR_UP'
,p_message_language=>'hr'
,p_message_text=>'Gore'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376628436751427)
,p_name=>'APEXIR_VALID_COLOR'
,p_message_language=>'hr'
,p_message_text=>'Unesite valjanu boju.'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139376779802751427)
,p_name=>'APEXIR_VALID_FORMAT_MASK'
,p_message_language=>'hr'
,p_message_text=>'Unesite valjanu masku formata.'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139341503530751417)
,p_name=>'APEXIR_VALUE'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375531067751427)
,p_name=>'APEXIR_VALUE_AXIS_TITLE'
,p_message_language=>'hr'
,p_message_text=>'Naslov osi za vrijednost'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139383348901751429)
,p_name=>'APEXIR_VALUE_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Obavezna vrijednost'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344995008751418)
,p_name=>'APEXIR_VCOLUMN'
,p_message_language=>'hr'
,p_message_text=>'Okomiti stupac'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139453701986751450)
,p_name=>'APEXIR_VERTICAL'
,p_message_language=>'hr'
,p_message_text=>'Okomito'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382632014751429)
,p_name=>'APEXIR_VIEW_CHART'
,p_message_language=>'hr'
,p_message_text=>'Prikaz grafikona'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441257512751446)
,p_name=>'APEXIR_VIEW_DETAIL'
,p_message_language=>'hr'
,p_message_text=>'Prikaz pojedinosti'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485527972751459)
,p_name=>'APEXIR_VIEW_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e nema definiran %0 prikaz.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441384885751446)
,p_name=>'APEXIR_VIEW_GROUP_BY'
,p_message_language=>'hr'
,p_message_text=>'Prikaz grupiranja po'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441187014751446)
,p_name=>'APEXIR_VIEW_ICONS'
,p_message_language=>'hr'
,p_message_text=>'Prikaz ikona'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411087286751437)
,p_name=>'APEXIR_VIEW_PIVOT'
,p_message_language=>'hr'
,p_message_text=>'Prikaz zaokretanja'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139382758536751429)
,p_name=>'APEXIR_VIEW_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Prikaz izvje\0161\0107a')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435307724751444)
,p_name=>'APEXIR_WEEKLY'
,p_message_language=>'hr'
,p_message_text=>'Tjedno'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365460097751424)
,p_name=>'APEXIR_WORKING_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Radno izvje\0161\0107e')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463181464751453)
,p_name=>'APEXIR_X_DAYS'
,p_message_language=>'hr'
,p_message_text=>'%0 dana'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463013589751452)
,p_name=>'APEXIR_X_HOURS'
,p_message_language=>'hr'
,p_message_text=>'%0 h'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139462998866751452)
,p_name=>'APEXIR_X_MINS'
,p_message_language=>'hr'
,p_message_text=>'%0 min'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463384000751453)
,p_name=>'APEXIR_X_MONTHS'
,p_message_language=>'hr'
,p_message_text=>'%0 mj.'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463266725751453)
,p_name=>'APEXIR_X_WEEKS'
,p_message_language=>'hr'
,p_message_text=>'%0 tj.'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139463402740751453)
,p_name=>'APEXIR_X_YEARS'
,p_message_language=>'hr'
,p_message_text=>'%0 god.'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139461127873751452)
,p_name=>'APEXIR_YEAR'
,p_message_language=>'hr'
,p_message_text=>'Godina'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139339315402751416)
,p_name=>'APEXIR_YELLOW'
,p_message_language=>'hr'
,p_message_text=>unistr('\017Euta')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139340818314751417)
,p_name=>'APEXIR_YES'
,p_message_language=>'hr'
,p_message_text=>'Da'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139375348590751427)
,p_name=>'APEX_GROUP.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 sadr\017Ei znakove < ili > koji nisu valjani.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139399288023751434)
,p_name=>'APEX_REGION'
,p_message_language=>'hr'
,p_message_text=>unistr('Podru\010Dje')
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290361505751402)
,p_name=>'APEX_ZIP.EXTRACT_FAILED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se izdvojiti ZIP datoteka.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290233083751402)
,p_name=>'APEX_ZIP.INVALID_ZIPFILE'
,p_message_language=>'hr'
,p_message_text=>unistr('Potpis kraja sredi\0161njeg direktorija nije prona\0111en. Ova datoteka nije ZIP datoteka.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139321368456751411)
,p_name=>'API_PRECONDITION_VIOLATED'
,p_message_language=>'hr'
,p_message_text=>unistr('API preduvjet prekr\0161en')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343461918751417)
,p_name=>'APP.SETTING.CANNOT.GET'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se dohvatiti vrijednost za postavku aplikacije %0 jer je povezana opcija izrade onemogu\0107ena.')
,p_version_scn=>2704915
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343332744751417)
,p_name=>'APP.SETTING.CANNOT.SET'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se postaviti vrijednost za postavku aplikacije %0 jer je povezana opcija izrade onemogu\0107ena.')
,p_version_scn=>2704914
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455950662751450)
,p_name=>'APP.SETTING.INVALID.VALUE'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost aplikacije %0 nije valjana'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139455813114751450)
,p_name=>'APP.SETTING.NOT.DEFINED'
,p_message_language=>'hr'
,p_message_text=>'Obavezna postavka aplikacije %0 nije definirana'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456000284751450)
,p_name=>'APP.SETTING.VALUE.NOT.NULL'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost aplikacije %0 ne smije se postaviti na null'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329965208751413)
,p_name=>'BACK'
,p_message_language=>'hr'
,p_message_text=>'Natrag'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312373185751408)
,p_name=>'BUILDER'
,p_message_language=>'hr'
,p_message_text=>'Alat za izradu'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385900823751430)
,p_name=>'BUTTON LABEL'
,p_message_language=>'hr'
,p_message_text=>'Oznaka gumba'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309200741751407)
,p_name=>'BUTTON_CSS_CLASSES'
,p_message_language=>'hr'
,p_message_text=>'Gumb - CSS klase'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347760539751419)
,p_name=>'BUTTON_ID'
,p_message_language=>'hr'
,p_message_text=>unistr('Generirani ID gumba bit \0107e stati\010Dni ID gumba, ako je definiran, a ako nije definiran, bit \0107e interno generirani ID u formatu ''B'' || [interni ID gumba]')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281737067751399)
,p_name=>'CANDLESTICK'
,p_message_language=>'hr'
,p_message_text=>unistr('Svije\0107njak')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395790043751433)
,p_name=>'CENTER'
,p_message_language=>'hr'
,p_message_text=>'Sredina'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342342377751417)
,p_name=>'CHANGE_PW_REQUEST'
,p_message_language=>'hr'
,p_message_text=>'%0 - zahtjev'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332344237751414)
,p_name=>'CHECK$'
,p_message_language=>'hr'
,p_message_text=>'alat za odabir retka'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139457729849751451)
,p_name=>'CHECKED'
,p_message_language=>'hr'
,p_message_text=>unistr('ozna\010Deno')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434186547751444)
,p_name=>'COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Stupac'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391793200751432)
,p_name=>'COMMENTS'
,p_message_language=>'hr'
,p_message_text=>'Komentari'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372795173751426)
,p_name=>'CONTINUE'
,p_message_language=>'hr'
,p_message_text=>'Nastavak'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330244297751413)
,p_name=>'COPYRIGHT'
,p_message_language=>'hr'
,p_message_text=>unistr('Copyright &copy; 1999, %0, Oracle i/ili njegove podru\017Enice.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378499921751428)
,p_name=>'COUNT'
,p_message_language=>'hr'
,p_message_text=>'Broj'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385462359751430)
,p_name=>'CREATE'
,p_message_language=>'hr'
,p_message_text=>'Stvori'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440836187751446)
,p_name=>'CREATED'
,p_message_language=>'hr'
,p_message_text=>'Stvoreno'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440914860751446)
,p_name=>'CREATED_BY'
,p_message_language=>'hr'
,p_message_text=>'Autor'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361817194751423)
,p_name=>'CREATED_ON'
,p_message_language=>'hr'
,p_message_text=>'Datum izrade'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372964014751426)
,p_name=>'CUSTOM'
,p_message_language=>'hr'
,p_message_text=>unistr('Prilago\0111eno')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384113948751429)
,p_name=>'CUSTOMIZE'
,p_message_language=>'hr'
,p_message_text=>'Prilagodi'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386190297751430)
,p_name=>'CUSTOMIZE.USER_PAGE_PREFS_RESET'
,p_message_language=>'hr'
,p_message_text=>'Preference stranice ponovo su postavljene za korisnika %0.'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386231339751430)
,p_name=>'CUSTOMIZE.USER_PREFS_CHANGED'
,p_message_language=>'hr'
,p_message_text=>'Preference su promijenjene za korisnika %0.'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386031329751430)
,p_name=>'CUSTOMIZE.USER_PREFS_RESET'
,p_message_language=>'hr'
,p_message_text=>'Preference stranice ponovo su postavljene za korisnika %0.'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347169613751418)
,p_name=>'DAILY'
,p_message_language=>'hr'
,p_message_text=>'Dnevno'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310544174751408)
,p_name=>'DATA.LOAD.INVALID_FILE'
,p_message_language=>'hr'
,p_message_text=>unistr('Prenesena datoteka nije valjana ili ima pogre\0161no pro\0161irenje.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342562417751417)
,p_name=>'DATA.LOAD.INVALID_SELECTOR'
,p_message_language=>'hr'
,p_message_text=>'Upotrijebljen je XML ili JSON alat za odabir koji nije valjan.'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287620715751401)
,p_name=>'DATA.LOAD.NO_COMMON_COLUMNS'
,p_message_language=>'hr'
,p_message_text=>unistr('Podatkovni profil i prenesena datoteka ne sadr\017Ee odredi\0161ni stupac tablice.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401547153751434)
,p_name=>'DATA.LOAD.NO_FILE_CONTENTS'
,p_message_language=>'hr'
,p_message_text=>unistr('U prenesenoj datoteci nisu prona\0111eni podaci.')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401669574751434)
,p_name=>'DATA.LOAD.NO_WORKSHEET_CONTENTS'
,p_message_language=>'hr'
,p_message_text=>unistr('U radnom listu "%0" nisu prona\0111eni podaci.')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307430743751407)
,p_name=>'DATA.LOAD.NO_XLSX_FILE'
,p_message_language=>'hr'
,p_message_text=>'Navedena datoteka nije XLSX datoteka.'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139273433631751397)
,p_name=>'DATA.LOAD.ROWS_PROCESSED'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditavanje podataka zavr\0161eno: obra\0111en je sljede\0107i broj redaka: %0.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275711160751397)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROW'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditavanje podataka zavr\0161eno: uz 1 pogre\0161ku obra\0111en je sljede\0107i broj redaka: %0.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139276006929751397)
,p_name=>'DATA.LOAD.ROWS_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditavanje podataka zavr\0161eno: uz vi\0161e pogre\0161aka (%1) obra\0111en je sljede\0107i broj redaka: %0.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275845460751397)
,p_name=>'DATA.LOAD.ROW_PROCESSED'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditavanje podataka zavr\0161eno: 1 redak obra\0111en.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290152076751402)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROW'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditavanje podataka zavr\0161eno: 1 redak obra\0111en je s pogre\0161kom.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139275920229751397)
,p_name=>'DATA.LOAD.ROW_PROCESSED_W_ERROR_ROWS'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditavanje podataka zavr\0161eno: 1 redak obra\0111en je bez pogre\0161ke.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408648872751437)
,p_name=>'DATA_LOAD.COLUMN_NAMES_MAPPING'
,p_message_language=>'hr'
,p_message_text=>unistr('Odredi\0161ni stupac')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315867637751409)
,p_name=>'DATA_LOAD.DO_NOT_LOAD'
,p_message_language=>'hr'
,p_message_text=>unistr('Nemoj u\010Ditati')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315958481751409)
,p_name=>'DATA_LOAD.FAILED'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka predobrade')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408717258751437)
,p_name=>'DATA_LOAD.FIRST_COLUMN_NAMES'
,p_message_language=>'hr'
,p_message_text=>'Izvorni stupac'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409570094751437)
,p_name=>'DATA_LOAD.FORMAT'
,p_message_language=>'hr'
,p_message_text=>'Format datuma/broja'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315646800751409)
,p_name=>'DATA_LOAD.INSERT'
,p_message_language=>'hr'
,p_message_text=>'Umetni redak'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471710194751455)
,p_name=>'DATA_LOAD.LOOKUP_FAILED'
,p_message_language=>'hr'
,p_message_text=>unistr('Dohva\0107anje vrijednosti tra\017Eenja nije uspjelo.')
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139441450447751446)
,p_name=>'DATA_LOAD.MAPPING'
,p_message_language=>'hr'
,p_message_text=>'Mapiranje podataka/tablice'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409693720751437)
,p_name=>'DATA_LOAD.ROW'
,p_message_language=>'hr'
,p_message_text=>'Redak'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316029498751409)
,p_name=>'DATA_LOAD.SEQUENCE_ACTION'
,p_message_language=>'hr'
,p_message_text=>'Slijed: akcija'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403335292751435)
,p_name=>'DATA_LOAD.TRANSFORMATION_FAILED'
,p_message_language=>'hr'
,p_message_text=>'Pravilo transformacije nije uspjelo'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315714448751409)
,p_name=>'DATA_LOAD.UPDATE'
,p_message_language=>'hr'
,p_message_text=>unistr('A\017Euriraj redak')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378032745751428)
,p_name=>'DATE'
,p_message_language=>'hr'
,p_message_text=>'Datum'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350968817751420)
,p_name=>'DAY'
,p_message_language=>'hr'
,p_message_text=>'dan'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351013278751420)
,p_name=>'DAYS'
,p_message_language=>'hr'
,p_message_text=>'dana'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391427735751431)
,p_name=>'DEBUGGING_OFF'
,p_message_language=>'hr'
,p_message_text=>unistr('Ispravljanje pogre\0161aka nije omogu\0107eno za ovu aplikaciju.')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139443104160751447)
,p_name=>'DEFAULT'
,p_message_language=>'hr'
,p_message_text=>'Zadano'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351711052751420)
,p_name=>'DELETE'
,p_message_language=>'hr'
,p_message_text=>unistr('izbri\0161i')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327315496751412)
,p_name=>'DELETE_MSG'
,p_message_language=>'hr'
,p_message_text=>unistr('\017Delite li izvr\0161iti ovu akciju brisanja?')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139306961638751406)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES'
,p_message_language=>'hr'
,p_message_text=>unistr('Nadja\010Davanja sesije')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307870162751407)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Omogu\0107i nadja\010Davanja sesije')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308722439751407)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD'
,p_message_language=>'hr'
,p_message_text=>unistr('Do\0161lo je do pogre\0161ke pri u\010Ditavanju nadja\010Davanja sesije.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308568397751407)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE'
,p_message_language=>'hr'
,p_message_text=>unistr('Do\0161lo je do pogre\0161ke pri spremanju nadja\010Davanja sesije.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139308490573751407)
,p_name=>'DEVELOPER_TOOLBAR_SESSION_OVERRIDES_SAVED'
,p_message_language=>'hr'
,p_message_text=>unistr('Nadja\010Davanja sesije spremljena. Zaustavite ovaj dijalo\0161ki okvir za prikaz promjena.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139281654549751399)
,p_name=>'DIAL_PCT'
,p_message_language=>'hr'
,p_message_text=>unistr('Broj\010Danik (postotak)')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139322686098751411)
,p_name=>'DOWNLOAD'
,p_message_language=>'hr'
,p_message_text=>'Preuzmi'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442254471751446)
,p_name=>'DUP_USER'
,p_message_language=>'hr'
,p_message_text=>unistr('Duplicirano korisni\010Dko ime na popisu.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331073500751414)
,p_name=>'EDIT'
,p_message_language=>'hr'
,p_message_text=>'Uredi'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342278995751417)
,p_name=>'EMAIL_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Adresa e-po\0161te "%0" nije prona\0111ena.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324942473751412)
,p_name=>'EMAIL_SENT_BY'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\0161iljatelj ove poruke e-po\0161te je %0.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442496651751446)
,p_name=>'EMAIL_TOO_LONG'
,p_message_language=>'hr'
,p_message_text=>unistr('Adresa e-po\0161te je preduga\010Dka. Ograni\010Denje je 240 znakova.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372675550751426)
,p_name=>'ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403412862751435)
,p_name=>'ERROR_SET_ITEM_STATE_FOR_PPR_REGION'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se postaviti vrijednost izvora stavke stranice za podru\010Dje djelomi\010Dnog osvje\017Eavanja stranice')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363909363751423)
,p_name=>'F4500_P10_CREATED_BY'
,p_message_language=>'hr'
,p_message_text=>'Autor'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325272008751412)
,p_name=>'F4500_P2613_EXPIRED'
,p_message_language=>'hr'
,p_message_text=>'Lozinka je istekla'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139317675229751410)
,p_name=>'FILE_EMPTY'
,p_message_language=>'hr'
,p_message_text=>'Datoteka je prazna.'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407453207751436)
,p_name=>'FILE_TOO_LARGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Veli\010Dina prenesene datoteke iznad je %0 MB. Prenesite manju datoteku.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327594639751413)
,p_name=>'FILE_UPLOAD_AUTHENTICATION_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Provjera autenti\010Dnosti korisnika nije uspjela i nije prenesena jedna ili vi\0161e datoteka.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327664268751413)
,p_name=>'FILE_UPLOAD_PUBLICUSER_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ova instanca ne dopu\0161ta prijenos datoteka korisnicima \010Dija autenti\010Dnost nije provjerena.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407506286751436)
,p_name=>'FILTERS'
,p_message_language=>'hr'
,p_message_text=>'Filtri'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385523199751430)
,p_name=>'FLOW.SINGLE_VALIDATION_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Do\0161lo je do 1 pogre\0161ke')
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384754594751429)
,p_name=>'FLOW.VALIDATION_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Do\0161lo je do sljede\0107eg broja pogre\0161aka: %0')
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330147063751413)
,p_name=>'FORM_OF'
,p_message_language=>'hr'
,p_message_text=>'%0 od %1'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369192531751425)
,p_name=>'GO'
,p_message_language=>'hr'
,p_message_text=>'Idi'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471321531751455)
,p_name=>'HELP'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107')
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312431025751408)
,p_name=>'HOME'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\010Detna stranica')
,p_is_js_message=>true
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350787137751419)
,p_name=>'HOUR'
,p_message_language=>'hr'
,p_message_text=>'h'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350880681751419)
,p_name=>'HOURS'
,p_message_language=>'hr'
,p_message_text=>'h'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139332257778751414)
,p_name=>'ICON'
,p_message_language=>'hr'
,p_message_text=>'Ikona %0'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309594497751407)
,p_name=>'ICON.EDITOR.CROP.HELP'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomo\0107 za izrezivanje ikone')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310732192751408)
,p_name=>'ICON.EDITOR.CROPPER.HELPTEXT'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Povucite ikonu i upotrijebite kliza\010D za zumiranje kako biste promijenili njezin polo\017Eaj u okviru.</p>'),
'',
unistr('<p>Pri prijenosu nove ikone promijenit \0107e se njezina veli\010Dina kako bi bila u skladu s tri formata: favicon, mala i velika ikona.</p>'),
'',
unistr('<p>Kada je fokus na alatu za izrezivanje ikona, dostupni su sljede\0107i tipkovni pre\010Daci:</p>'),
'<ul>',
'    <li>Lijeva strelica: premjesti sliku ulijevo*</li>',
'    <li>Strelica prema gore: Premjesti sliku prema gore*</li>',
'    <li>Desna strelica: Premjesti sliku udesno*</li>',
'    <li>Strelica prema dolje: Premjesti sliku prema dolje*</li>',
unistr('    <li>I: Uve\0107aj</li>'),
'    <li>O: Smanji</li>',
'    <li>L: Zakreni ulijevo</li>',
'    <li>R: Zakreni udesno</li>',
'</ul>',
'',
unistr('<p class="margin-top-md"><em>*Dr\017Eite Shift za br\017Ee kretanje</em></p>')))
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316266723751409)
,p_name=>'ICON.EDITOR.CROPPER.SUBTITLE'
,p_message_language=>'hr'
,p_message_text=>'Povucite za promjenu redoslijeda ikone'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316344050751409)
,p_name=>'ICON.EDITOR.CROPPER.ZOOM_SLIDER_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Pomaknite pokaziva\010D za pode\0161avanje razine zumiranja')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309360190751407)
,p_name=>'ICON.EDITOR.DIALOG.TITLE'
,p_message_language=>'hr'
,p_message_text=>'Uredi ikonu aplikacije'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309637815751407)
,p_name=>'ICON.EDITOR.ERROR.SAVING'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri spremanju ikone')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392060321751432)
,p_name=>'ICON.EDITOR.LEGACY_DATA'
,p_message_language=>'hr'
,p_message_text=>unistr('<p><span class="a-Icon icon-tr-warning"></span> Ova aplikacija upotrebljava naslije\0111ene ikone. Prijenosom nove ikone zamijenit \0107e se sve naslije\0111ene ikone.</p>')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139310295472751407)
,p_name=>'ICON.EDITOR.UPLOAD.ICON'
,p_message_language=>'hr'
,p_message_text=>'Prenesi novu ikonu'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386477771751430)
,p_name=>'INVALID_CREDENTIALS'
,p_message_language=>'hr'
,p_message_text=>'Sigurnosni podaci za prijavu nisu valjani'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487596908751460)
,p_name=>'INVALID_VALUE_FOR_PARAMETER'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost parametra  nije valjana: %0'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380775327751428)
,p_name=>'IR_AS_DEFAULT_REPORT_SETTING'
,p_message_language=>'hr'
,p_message_text=>unistr('Kao zadane postavke izvje\0161\0107a')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380898900751428)
,p_name=>'IR_AS_NAMED_REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Kao izvje\0161\0107e s nazivom')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362701869751423)
,p_name=>'IR_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 pogre\0161ka. %1')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362404453751423)
,p_name=>'IR_FRM_NAV_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se izra\010Dunati navigacija kroz obrazac. %0')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338025087751416)
,p_name=>'IR_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Interaktivno izvje\0161\0107e nije prona\0111eno.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337432747751416)
,p_name=>'IR_REGION_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Podru\010Dje interaktivnog izvje\0161\0107a ne postoji u aplikaciji %0, stranici %1 ni podru\010Dju %2.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139380650805751428)
,p_name=>'IR_STAR'
,p_message_language=>'hr'
,p_message_text=>'Prikazuje se samo za razvojne programere'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368824490751425)
,p_name=>'IR_UNIQUE_KEY_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Za upit izvje\0161\0107a potreban je jedinstveni klju\010D za identifikaciju svakog retka. Navedeni klju\010D ne mo\017Ee se upotrijebiti za ovaj upit. Definirajte stupac s jedinstvenim klju\010Dem. %0')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139368977582751425)
,p_name=>'IR_UNIQUE_KEY_ERROR2'
,p_message_language=>'hr'
,p_message_text=>unistr('Za upit izvje\0161\0107a potreban je jedinstveni klju\010D za identifikaciju svakog retka. Navedeni klju\010D ne mo\017Ee se upotrijebiti za ovaj upit. Uredite atribute izvje\0161\0107a kako biste definirali stupac s jedinstvenim klju\010Dem. %0')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409876028751437)
,p_name=>'ITEM.FILE_UPLOAD.CHOOSE_FILE'
,p_message_language=>'hr'
,p_message_text=>'Odabir datoteke'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409760888751437)
,p_name=>'ITEM.FILE_UPLOAD.DRAG_DROP_FILE_HERE'
,p_message_language=>'hr'
,p_message_text=>'Povucite i ispustite datoteku ovdje ili'
,p_is_js_message=>true
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330431313751413)
,p_name=>'ITEMS'
,p_message_language=>'hr'
,p_message_text=>'Stavke'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364187083751423)
,p_name=>'ITEM_VALUE'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost stavke'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378798890751428)
,p_name=>'LABEL'
,p_message_language=>'hr'
,p_message_text=>'Oznaka'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391382132751431)
,p_name=>'LANGUAGE'
,p_message_language=>'hr'
,p_message_text=>'Jezik'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351422831751420)
,p_name=>'LAST'
,p_message_language=>'hr'
,p_message_text=>'zadnje'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327466262751412)
,p_name=>'LENGTH'
,p_message_language=>'hr'
,p_message_text=>'Duljina'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385747152751430)
,p_name=>'LOGIN'
,p_message_language=>'hr'
,p_message_text=>'Prijava'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427336899751442)
,p_name=>'MANAGE'
,p_message_language=>'hr'
,p_message_text=>'Upravljanje'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139490422912751461)
,p_name=>'MAXIMIZE'
,p_message_language=>'hr'
,p_message_text=>'Maksimiziraj'
,p_is_js_message=>true
,p_version_scn=>2704939
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350566114751419)
,p_name=>'MINUTE'
,p_message_language=>'hr'
,p_message_text=>'min'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350667586751419)
,p_name=>'MINUTES'
,p_message_language=>'hr'
,p_message_text=>'min'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442653514751446)
,p_name=>'MISSING_AT'
,p_message_language=>'hr'
,p_message_text=>unistr('U adresi e-po\0161te nedostaje "@".')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442867519751447)
,p_name=>'MISSING_DIALOG_PAGE_TEMPLATE_WARNING'
,p_message_language=>'hr'
,p_message_text=>unistr('Upozorenje: Za stranicu dijaloga %0 u aplikaciji %1 nije definiran predlo\017Eak stranice dijaloga.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442520969751446)
,p_name=>'MISSING_DOT'
,p_message_language=>'hr'
,p_message_text=>unistr('U domeni adrese e-po\0161te nedostaje ".".')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388818109751431)
,p_name=>'MODULE'
,p_message_language=>'hr'
,p_message_text=>'Modul'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343060184751417)
,p_name=>'MONTH'
,p_message_language=>'hr'
,p_message_text=>'Mjesec'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346932729751418)
,p_name=>'MONTHLY'
,p_message_language=>'hr'
,p_message_text=>unistr('Mjese\010Dno')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343126450751417)
,p_name=>'MONTHS'
,p_message_language=>'hr'
,p_message_text=>'mjeseci'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378365053751428)
,p_name=>'MOVE'
,p_message_language=>'hr'
,p_message_text=>'Premjesti'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449145817751448)
,p_name=>'MOVE_FROM'
,p_message_language=>'hr'
,p_message_text=>'Premjesti iz'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449204498751448)
,p_name=>'MOVE_TO'
,p_message_language=>'hr'
,p_message_text=>'Premjesti u'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139365365763751424)
,p_name=>'MRU.ERROR_IN_MRD'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka operacije brisanja vi\0161e redaka: redak= %0, %1, %2')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364399373751423)
,p_name=>'MUST_NOT_BE_PUBLIC_USER'
,p_message_language=>'hr'
,p_message_text=>'Ne smije biti javni korisnik'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312977718751408)
,p_name=>'NAME'
,p_message_language=>'hr'
,p_message_text=>'Naziv'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378542565751428)
,p_name=>'NEW'
,p_message_language=>'hr'
,p_message_text=>'Novo'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342875327751417)
,p_name=>'NEW_ACCOUNT_LOGIN_INSTRUCTIONS'
,p_message_language=>'hr'
,p_message_text=>unistr('Mo\017Eete se prijaviti u %0 odlaskom na:')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342918513751417)
,p_name=>'NEW_ACCOUNT_NOTIFICATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Obavijest o novom %0 ra\010Dunu')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471513183751455)
,p_name=>'NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388708194751431)
,p_name=>'NO'
,p_message_language=>'hr'
,p_message_text=>'Ne'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139485651631751459)
,p_name=>'NOBODY'
,p_message_language=>'hr'
,p_message_text=>'nitko'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351807021751420)
,p_name=>'NOT'
,p_message_language=>'hr'
,p_message_text=>'Nije'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394788705751432)
,p_name=>'NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'Nije Null'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364476865751423)
,p_name=>'NOT_W_ARGUMENT'
,p_message_language=>'hr'
,p_message_text=>'Nije %0'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384234008751429)
,p_name=>'NO_DATA_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('podaci nisu prona\0111eni')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394278499751432)
,p_name=>'NO_UPDATEABLE_REPORT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Nisu prona\0111ena izvje\0161\0107a koja se mogu a\017Eurirati. Operacije a\017Euriranja vi\0161e redaka i brisanja mogu se izvr\0161iti samo u tabli\010Dnim obrascima vrste ''Izvje\0161\0107e koje se mo\017Ee a\017Eurirati''.')
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395169319751433)
,p_name=>'OK'
,p_message_language=>'hr'
,p_message_text=>'U redu'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390492045751431)
,p_name=>'ORACLE_APPLICATION_EXPRESS'
,p_message_language=>'hr'
,p_message_text=>'Oracle APEX'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139489326011751460)
,p_name=>'ORA_06550'
,p_message_language=>'hr'
,p_message_text=>'ORA-06550: linija %0, stupac %1'
,p_version_scn=>2704937
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440293624751446)
,p_name=>'OUTDATED_BROWSER'
,p_message_language=>'hr'
,p_message_text=>unistr('Upotrebljavate zastarjeli internetski preglednik. Popis podr\017Eanih preglednika potra\017Eite u priru\010Dniku za instalaciju platforme Oracle APEX.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335208084751415)
,p_name=>'OUT_OF_RANGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Zatra\017Een je skup redaka koji nije valjan, izmijenjeni su izvorni podaci izvje\0161\0107a.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357298328751421)
,p_name=>'P.VALID_PAGE_ERR'
,p_message_language=>'hr'
,p_message_text=>'Mora se navesti valjani broj stranice, primjerice p?n=1234.'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361475656751423)
,p_name=>'PAGINATION.NEXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107e')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361526816751423)
,p_name=>'PAGINATION.NEXT_SET'
,p_message_language=>'hr'
,p_message_text=>unistr('Sljede\0107i skup')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361659550751423)
,p_name=>'PAGINATION.PREVIOUS'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139361797341751423)
,p_name=>'PAGINATION.PREVIOUS_SET'
,p_message_language=>'hr'
,p_message_text=>'Prethodni skup'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471429483751455)
,p_name=>'PAGINATION.SELECT'
,p_message_language=>'hr'
,p_message_text=>'Odabir numeriranja stranica'
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401414290751434)
,p_name=>'PASSWORD'
,p_message_language=>'hr'
,p_message_text=>'Lozinka'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342126963751417)
,p_name=>'PASSWORD_CHANGED'
,p_message_language=>'hr'
,p_message_text=>unistr('Promijenjena je va\0161a lozinka za %0.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329852288751413)
,p_name=>'PASSWORD_COMPLEXITY_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka nije u skladu s pravilima o slo\017Eenosti lozinke web-mjesta.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328904783751413)
,p_name=>'PASSWORD_DIFFERS_BY_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Nova lozinka mora se razlikovati od stare u najmanje sljede\0107em broju znakova: %0.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329562081751413)
,p_name=>'PASSWORD_LIKE_USERNAME_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka ne smije sadr\017Eavati korisni\010Dko ime.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329797760751413)
,p_name=>'PASSWORD_LIKE_WORDS_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka sadr\017Ei zabranjenu jednostavnu rije\010D.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329601490751413)
,p_name=>'PASSWORD_LIKE_WORKSPACE_NAME_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka ne smije sadr\017Eavati naziv radnog prostora.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328811939751413)
,p_name=>'PASSWORD_MIN_LEN_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka mora sadr\017Eavati najmanje sljede\0107i broj znakova: %0.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329044354751413)
,p_name=>'PASSWORD_ONE_ALPHA_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka mora sadr\017Eavati najmanje jedno slovo (%0).')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329451670751413)
,p_name=>'PASSWORD_ONE_LOWER_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka mora sadr\017Eavati najmanje jedno malo slovo.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329101350751413)
,p_name=>'PASSWORD_ONE_NUMERIC_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka mora sadr\017Eavati najmanje jedan broj (0123456789).')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329200131751413)
,p_name=>'PASSWORD_ONE_PUNCTUATION_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka mora sadr\017Eavati najmanje jedan interpunkcijski znak (%0).')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139329356239751413)
,p_name=>'PASSWORD_ONE_UPPER_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka mora sadr\017Eavati najmanje jedno veliko slovo.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342606161751417)
,p_name=>'PASSWORD_RESET_NOTIFICATION'
,p_message_language=>'hr'
,p_message_text=>'Obavijest o ponovnom postavljanju lozinke'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327754536751413)
,p_name=>'PASSWORD_REUSE_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Lozinka se ne mo\017Ee upotrijebiti jer je upotrijebljena unutar sljede\0107eg broja proteklih dana: %0.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139324479350751412)
,p_name=>'PCT_GRAPH_ARIA_LABEL'
,p_message_language=>'hr'
,p_message_text=>'Grafikon postotaka'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416099825751439)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.PLURAL'
,p_message_language=>'hr'
,p_message_text=>'Stavke'
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139416132666751439)
,p_name=>'PE.COMPONEN.TYPE.PAGE_ITEM.SINGULAR'
,p_message_language=>'hr'
,p_message_text=>'Stavka'
,p_version_scn=>2704928
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390243600751431)
,p_name=>'PERCENT'
,p_message_language=>'hr'
,p_message_text=>'Postotak'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359532434751422)
,p_name=>'PLEASE_CONTACT_ADMINISTRATOR'
,p_message_language=>'hr'
,p_message_text=>'Obratite se administratoru.'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471689914751455)
,p_name=>'PREVIOUS'
,p_message_language=>'hr'
,p_message_text=>'Prethodno'
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408256949751436)
,p_name=>'PRINT'
,p_message_language=>'hr'
,p_message_text=>'Ispis'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389012749751431)
,p_name=>'PRIVILEGES'
,p_message_language=>'hr'
,p_message_text=>'Povlastice'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357601940751421)
,p_name=>'REGIOIN_REFERENCES'
,p_message_language=>'hr'
,p_message_text=>unistr('Reference podru\010Dja')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378699429751428)
,p_name=>'REPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388928186751431)
,p_name=>'REPORTING_PERIOD'
,p_message_language=>'hr'
,p_message_text=>unistr('Razdoblje izvje\0161\0107ivanja')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471824944751455)
,p_name=>'REPORT_LABEL'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e: %0')
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389677879751431)
,p_name=>'REPORT_TOTAL'
,p_message_language=>'hr'
,p_message_text=>unistr('Izvje\0161\0107e - ukupno')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335352290751415)
,p_name=>'RESET'
,p_message_language=>'hr'
,p_message_text=>'Ponovno postavljanje numeriranja stranica'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364038291751423)
,p_name=>'RESET_PAGINATION'
,p_message_language=>'hr'
,p_message_text=>'Ponovno postavljanje numeriranja stranica'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394125579751432)
,p_name=>'RESET_PASSWORD'
,p_message_language=>'hr'
,p_message_text=>'Ponovo postavi lozinku'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369987758751425)
,p_name=>'RESTORE'
,p_message_language=>'hr'
,p_message_text=>'Vrati'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139403552984751435)
,p_name=>'RESULTS'
,p_message_language=>'hr'
,p_message_text=>'Rezultati'
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395286171751433)
,p_name=>'RETURN_TO_APPLICATION'
,p_message_language=>'hr'
,p_message_text=>'Povratak na aplikaciju.'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139395673705751433)
,p_name=>'RIGHT'
,p_message_language=>'hr'
,p_message_text=>'Desno'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427646227751442)
,p_name=>'ROW'
,p_message_language=>'hr'
,p_message_text=>'Redak %0'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378210143751428)
,p_name=>'ROW_COUNT'
,p_message_language=>'hr'
,p_message_text=>'Broj redaka'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268034871751395)
,p_name=>'RW_AO_ASK_ORACLE'
,p_message_language=>'hr'
,p_message_text=>'Pitaj Oracle'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268303249751395)
,p_name=>'RW_AO_CLOSE_ASK_ORACLE'
,p_message_language=>'hr'
,p_message_text=>'Zatvori Pitaj Oracle'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268682133751395)
,p_name=>'RW_AO_NOTIFICATIONS_LIST'
,p_message_language=>'hr'
,p_message_text=>'Popis obavijesti'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268209790751395)
,p_name=>'RW_AO_OPEN_ASK_ORACLE'
,p_message_language=>'hr'
,p_message_text=>'Otvori Pitaj Oracle'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268566749751395)
,p_name=>'RW_AO_PRODUCT_MAP'
,p_message_language=>'hr'
,p_message_text=>'Mapiranje proizvoda'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268496022751395)
,p_name=>'RW_AO_SUGGESTIONS_LIST'
,p_message_language=>'hr'
,p_message_text=>'Popis prijedloga'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269354949751395)
,p_name=>'RW_CLEAR'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Disti')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269236456751395)
,p_name=>'RW_CLOSE'
,p_message_language=>'hr'
,p_message_text=>'Zatvori'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269056214751395)
,p_name=>'RW_FO_VIEW_MORE'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei vi\0161e')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269409986751395)
,p_name=>'RW_GO_TO'
,p_message_language=>'hr'
,p_message_text=>'Idi na'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268813889751395)
,p_name=>'RW_GP_STEP'
,p_message_language=>'hr'
,p_message_text=>'Korak'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268943646751395)
,p_name=>'RW_GP_STEP_OF'
,p_message_language=>'hr'
,p_message_text=>'od'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139268733907751395)
,p_name=>'RW_GP_TOGGLE_STEPS'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Di/isklju\010Di prikaz koraka')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267878935751395)
,p_name=>'RW_HIDE_PASSWORD'
,p_message_language=>'hr'
,p_message_text=>'Sakrij lozinku'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269124982751395)
,p_name=>'RW_OPEN'
,p_message_language=>'hr'
,p_message_text=>'Otvori'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267607033751395)
,p_name=>'RW_ORACLE'
,p_message_language=>'hr'
,p_message_text=>'Oracle'
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139267733825751395)
,p_name=>'RW_SHOW_PASSWORD'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei lozinku')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139269507613751395)
,p_name=>'RW_START'
,p_message_language=>'hr'
,p_message_text=>unistr('Po\010Detak')
,p_is_js_message=>true
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139394622858751432)
,p_name=>'SAVE'
,p_message_language=>'hr'
,p_message_text=>'Spremi'
,p_version_scn=>2704925
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390858936751431)
,p_name=>'SAVED_REPORTS.ALTERNATIVE.DEFAULT'
,p_message_language=>'hr'
,p_message_text=>'Alternativno zadano'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391248475751431)
,p_name=>'SAVED_REPORTS.DESCRIPTION'
,p_message_language=>'hr'
,p_message_text=>'Opis'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390728026751431)
,p_name=>'SAVED_REPORTS.PRIMARY.DEFAULT'
,p_message_language=>'hr'
,p_message_text=>'Primarno zadano'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391512691751431)
,p_name=>'SC_REPORT_ROWS'
,p_message_language=>'hr'
,p_message_text=>unistr('Dostupno je vi\0161e od sljede\0107eg broja redaka: %0. Pove\0107ajte odabir redaka kako biste prikazali vi\0161e redaka.')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458967870751451)
,p_name=>'SEARCH'
,p_message_language=>'hr'
,p_message_text=>unistr('Pretra\017Eivanje')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350442754751419)
,p_name=>'SECONDS'
,p_message_language=>'hr'
,p_message_text=>'sekunde'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390396600751431)
,p_name=>'SEE_ATTACHED'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei prilo\017Eeno')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139450931652751449)
,p_name=>'SELECT_ROW'
,p_message_language=>'hr'
,p_message_text=>'Odaberi redak'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390054591751431)
,p_name=>'SET_SCREEN_READER_MODE_OFF'
,p_message_language=>'hr'
,p_message_text=>unistr('Isklju\010Di na\010Din \010Dita\010Da zaslona')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390196199751431)
,p_name=>'SET_SCREEN_READER_MODE_ON'
,p_message_language=>'hr'
,p_message_text=>unistr('Uklju\010Di na\010Din \010Dita\010Da zaslona')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386351917751430)
,p_name=>'SHOW'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452724002751449)
,p_name=>'SHOW_ALL'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei sve')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139477569047751457)
,p_name=>'SIGN_IN'
,p_message_language=>'hr'
,p_message_text=>'Prijava'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139428432491751442)
,p_name=>'SIGN_OUT'
,p_message_language=>'hr'
,p_message_text=>'Odjavi se'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379230049751428)
,p_name=>'SINCE_DAYS_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 dana'
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386861304751430)
,p_name=>'SINCE_DAYS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'Za %0 dana'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379111883751428)
,p_name=>'SINCE_HOURS_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 h'
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386704120751430)
,p_name=>'SINCE_HOURS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'Za %0 h'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379063987751428)
,p_name=>'SINCE_MINUTES_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 min'
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386668780751430)
,p_name=>'SINCE_MINUTES_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'Za %0 min'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379426199751428)
,p_name=>'SINCE_MONTHS_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 mj.'
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387055593751430)
,p_name=>'SINCE_MONTHS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'Za %0 mj.'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387208549751430)
,p_name=>'SINCE_NOW'
,p_message_language=>'hr'
,p_message_text=>'Sad'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378971202751428)
,p_name=>'SINCE_SECONDS_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 s'
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386568329751430)
,p_name=>'SINCE_SECONDS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'Za %0 s'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379391695751428)
,p_name=>'SINCE_WEEKS_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 tj.'
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139386975232751430)
,p_name=>'SINCE_WEEKS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'Za %0 tj.'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139379523904751428)
,p_name=>'SINCE_YEARS_AGO'
,p_message_language=>'hr'
,p_message_text=>'Prije %0 god.'
,p_is_js_message=>true
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387180961751430)
,p_name=>'SINCE_YEARS_FROM_NOW'
,p_message_language=>'hr'
,p_message_text=>'Za %0 god.'
,p_is_js_message=>true
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373092298751426)
,p_name=>'STANDARD'
,p_message_language=>'hr'
,p_message_text=>'Standardno'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389946083751431)
,p_name=>'START_DATE'
,p_message_language=>'hr'
,p_message_text=>unistr('Datum po\010Detka')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325118118751412)
,p_name=>'SUBSCRIPTION_CREATED_BY'
,p_message_language=>'hr'
,p_message_text=>unistr('Primili ste ovu poruku e-po\0161te iz pretplate na interaktivno izvje\0161\0107e \010Diji je autor %0.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486700958751460)
,p_name=>'SUBSCRIPTION_REFERENCES'
,p_message_language=>'hr'
,p_message_text=>'Pretplate'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139436164771751445)
,p_name=>'TAB'
,p_message_language=>'hr'
,p_message_text=>'Kartica'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350363554751419)
,p_name=>'TITLE'
,p_message_language=>'hr'
,p_message_text=>'Naslov'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330042532751413)
,p_name=>'TODAY'
,p_message_language=>'hr'
,p_message_text=>'Danas'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389596774751431)
,p_name=>'TOTAL'
,p_message_language=>'hr'
,p_message_text=>'Ukupno'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331365225751414)
,p_name=>'TO_MANY_COLUMNS_SELECTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Mo\017Ee se odabrati najvi\0161e sljede\0107i broj stupaca: %0.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287104363751401)
,p_name=>'TREE.COLLAPSE_ALL'
,p_message_language=>'hr'
,p_message_text=>unistr('Sa\017Emi sve')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287722892751401)
,p_name=>'TREE.COLLAPSE_ALL_BELOW'
,p_message_language=>'hr'
,p_message_text=>'Sakrij sve ispod'
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286750130751401)
,p_name=>'TREE.EXPAND_ALL'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161iri sve')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287471898751401)
,p_name=>'TREE.EXPAND_ALL_BELOW'
,p_message_language=>'hr'
,p_message_text=>unistr('Pro\0161iri sve ispod')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287970594751401)
,p_name=>'TREE.REPARENT'
,p_message_language=>'hr'
,p_message_text=>unistr('Ponovo dodijeli nadre\0111eni')
,p_is_js_message=>true
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410033887751437)
,p_name=>'TREES'
,p_message_language=>'hr'
,p_message_text=>'Stabla'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139452802376751449)
,p_name=>'UI.FORM.REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Obavezno'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139373708839751426)
,p_name=>'UNAUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Neovla\0161teno')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139423925316751441)
,p_name=>'UNAVAILABLE'
,p_message_language=>'hr'
,p_message_text=>'Nije dostupno'
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387621283751430)
,p_name=>'UNKNOWN'
,p_message_language=>'hr'
,p_message_text=>'Nepoznato'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326068129751412)
,p_name=>'UNKNOWN_AUTHENTICATION_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Do\0161lo je do neprepoznate pogre\0161ke pri provjeri autenti\010Dnosti.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328276893751413)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_HTML'
,p_message_language=>'hr'
,p_message_text=>unistr('Ako vi\0161e ne \017Eelite primati e-po\0161tu, pritisnite <a href="%0">Otkazivanje pretplate</a> kako biste upravljali pretplatom.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139325087718751412)
,p_name=>'UNSUBSCRIBE_SUBSCRIPTION_MSG_TXT'
,p_message_language=>'hr'
,p_message_text=>unistr('Ako vi\0161e ne \017Eelite primati e-po\0161tu, idite na sljede\0107i URL za upravljanje pretplatom:')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139364589021751424)
,p_name=>'UNSUPPORTED_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('nepodr\017Eana vrsta podataka')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351683401751420)
,p_name=>'UPDATE'
,p_message_language=>'hr'
,p_message_text=>unistr('a\017Euriraj')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350274779751419)
,p_name=>'UPDATED'
,p_message_language=>'hr'
,p_message_text=>unistr('A\017Eurirano')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293403371751402)
,p_name=>'UPGRADE_IN_PROGRESS'
,p_message_language=>'hr'
,p_message_text=>'Nadogradnja u tijeku'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139293756038751403)
,p_name=>'UPGRADE_IN_PROGRESS_DETAIL'
,p_message_language=>'hr'
,p_message_text=>unistr('Oracle APEX nadogra\0111uje se na noviju verziju. Ovaj proces obi\010Dno traje do 3 minute.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357038815751421)
,p_name=>'URL_PROHIBITED'
,p_message_language=>'hr'
,p_message_text=>unistr('Zabranjen je zatra\017Eeni URL. Obratite se administratoru.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139378195416751428)
,p_name=>'USER'
,p_message_language=>'hr'
,p_message_text=>'Korisnik'
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139401301729751434)
,p_name=>'USERNAME'
,p_message_language=>'hr'
,p_message_text=>unistr('Korisni\010Dko ime')
,p_version_scn=>2704926
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442767207751447)
,p_name=>'USERNAME_TOO_LONG'
,p_message_language=>'hr'
,p_message_text=>unistr('Korisni\010Dko ime je preduga\010Dko. Ograni\010Deno je na sljede\0107i broj znakova: %0.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385269874751430)
,p_name=>'USERS'
,p_message_language=>'hr'
,p_message_text=>'korisnici'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139442313271751446)
,p_name=>'USER_EXISTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Korisni\010Dko ime ve\0107 postoji.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139456189870751450)
,p_name=>'USER_PROFILE_IMAGE'
,p_message_language=>'hr'
,p_message_text=>'Profilna slika za korisnika %0'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318096975751410)
,p_name=>'UTILIZATION_REPORTS.AUTOMATION'
,p_message_language=>'hr'
,p_message_text=>'Automatizacija - %0'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316506136751409)
,p_name=>'UTILIZATION_REPORTS.PAGE'
,p_message_language=>'hr'
,p_message_text=>'Stranica %0 - %1 '
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319470673751410)
,p_name=>'UTILIZATION_REPORTS.PLUG_NAME'
,p_message_language=>'hr'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139319569018751410)
,p_name=>'UTILIZATION_REPORTS.PROCESS_NAME'
,p_message_language=>'hr'
,p_message_text=>'%0 - %1'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318466571751410)
,p_name=>'UTILIZATION_REPORTS.SEARCH_CONFIG'
,p_message_language=>'hr'
,p_message_text=>unistr('Konfiguracija pretra\017Eivanja - %0')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318396576751410)
,p_name=>'UTILIZATION_REPORTS.SHARED_DYNAMIC_LOV'
,p_message_language=>'hr'
,p_message_text=>unistr('Dijeljeni dinami\010Dni popis vrijednosti - %0')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139318142465751410)
,p_name=>'UTILIZATION_REPORTS.TASK_DEFINITION'
,p_message_language=>'hr'
,p_message_text=>'Definicija zadatka - %0'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316616373751409)
,p_name=>'UTILIZATION_REPORTS.WORKFLOW'
,p_message_language=>'hr'
,p_message_text=>'Tijek rada - %0 '
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338776707751416)
,p_name=>'VALID'
,p_message_language=>'hr'
,p_message_text=>'Valjano'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330333502751413)
,p_name=>'VALIDATIONS'
,p_message_language=>'hr'
,p_message_text=>'Provjere valjanosti'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391013436751431)
,p_name=>'VALUE_MUST_BE_SPECIFIED'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost se mora navesti'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437334646751445)
,p_name=>'VALUE_MUST_BE_SPECIFIED_FOR'
,p_message_language=>'hr'
,p_message_text=>'Obavezno se mora navesti vrijednost za %0'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359936726751422)
,p_name=>'VERTICAL'
,p_message_language=>'hr'
,p_message_text=>'okomito'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351524946751420)
,p_name=>'VIEW'
,p_message_language=>'hr'
,p_message_text=>'prikaz'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385336215751430)
,p_name=>'VIEWS'
,p_message_language=>'hr'
,p_message_text=>'prikazi'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391894485751432)
,p_name=>'VIEW_ALL'
,p_message_language=>'hr'
,p_message_text=>unistr('Prika\017Ei sve')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331798056751414)
,p_name=>'VISUALLY_HIDDEN_LINK'
,p_message_language=>'hr'
,p_message_text=>'Vizualno skrivena veza'
,p_is_js_message=>true
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139372561947751426)
,p_name=>'WARNING'
,p_message_language=>'hr'
,p_message_text=>'Upozorenje'
,p_is_js_message=>true
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351186896751420)
,p_name=>'WEEK'
,p_message_language=>'hr'
,p_message_text=>'tj.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347036158751418)
,p_name=>'WEEKLY'
,p_message_language=>'hr'
,p_message_text=>'Tjedno'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351291484751420)
,p_name=>'WEEKS'
,p_message_language=>'hr'
,p_message_text=>'tj.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139391138374751431)
,p_name=>'WELCOME_USER'
,p_message_language=>'hr'
,p_message_text=>unistr('Dobro do\0161li: %0')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389354766751431)
,p_name=>'WWV_DBMS_SQL.INVALID_CLOB'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111ena vrijednost koja nije valjana, provjerite unesene podatke.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389432750751431)
,p_name=>'WWV_DBMS_SQL.INVALID_DATATYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111ena vrijednost koja nije valjana, provjerite unesene podatke.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327298930751412)
,p_name=>'WWV_DBMS_SQL.INVALID_DATE'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111ena je vrijednost datuma koja nije valjana, provjerite format datuma.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139389292534751431)
,p_name=>'WWV_DBMS_SQL.INVALID_NUMBER'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111ena vrijednost broja koja nije valjana, provjerite format broja.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338332752751416)
,p_name=>'WWV_DBMS_SQL.INVALID_TIMESTAMP'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111ena vrijednost vremenske oznake koja nije valjana, provjerite format vremenske oznake.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139362886637751423)
,p_name=>'WWV_DBMS_SQL.UNABLE_TO_BIND_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se vezati "%0". Upotrijebite dvostruke navodnike za vi\0161ebajtne stavke ili potvrdite je li duljina stavke 30 bajtova ili manje. Upotrijebite v() sintaksu za referencu na stavke dulje od 30 bajtova.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352657946751420)
,p_name=>'WWV_FLOW.ACCESS_DENIED'
,p_message_language=>'hr'
,p_message_text=>'Pristup je odbila sigurnosna provjera %0'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355194477751421)
,p_name=>'WWV_FLOW.APP_NOT_AVAILABLE'
,p_message_language=>'hr'
,p_message_text=>'Aplikacija nije dostupna'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353547480751420)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Aplikacija nije prona\0111ena.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353629531751420)
,p_name=>'WWV_FLOW.APP_NOT_FOUND_FOOTER_ERR'
,p_message_language=>'hr'
,p_message_text=>'aplikacija=%0  radni prostor=%1'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354063464751420)
,p_name=>'WWV_FLOW.APP_RESTRICTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Pristup ovoj aplikaciji ograni\010Den je, poku\0161ajte ponovo kasnije.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353976844751420)
,p_name=>'WWV_FLOW.APP_RESTRICTED_TO_DEV'
,p_message_language=>'hr'
,p_message_text=>unistr('Pristup ovoj aplikaciji ograni\010Den je na razvojne programere aplikacije, poku\0161ajte ponovo kasnije.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353124455751420)
,p_name=>'WWV_FLOW.BRANCH_FUNC_RETURNING_URL_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-7744 Ne mo\017Ee se obraditi grananje na URL vra\0107anja funkcija.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353099075751420)
,p_name=>'WWV_FLOW.BRANCH_TO_FUNCT_RET_PAGE_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-7744 Ne mo\017Ee se obraditi grananje na stranicu vra\0107anja funkcija.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353344409751420)
,p_name=>'WWV_FLOW.CALL_TO_SHOW_FROM_PROC_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-1430 Poziv za prikaz iz procesa stranice nije podr\017Ean: G_FLOW_STEP_ID (%0).')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354425066751421)
,p_name=>'WWV_FLOW.CLEAR_STEP_CACHE_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-1018 Pogre\0161ka pri \010Di\0161\0107enju cache memorije koraka.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352895435751420)
,p_name=>'WWV_FLOW.COMP_UNKNOWN_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-1005 Nepoznata vrsta izra\010Duna.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353708977751420)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-1201 ID sesije nije postavljen na prilago\0111enu provjeru autenti\010Dnosti.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353801601751420)
,p_name=>'WWV_FLOW.CUSTOM_AUTH_SESSION_FOOTER_ERR'
,p_message_language=>'hr'
,p_message_text=>'stranica=%0'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139353413613751420)
,p_name=>'WWV_FLOW.DET_COMPANY_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-7620 Ne mo\017Ee se odrediti radni prostor za aplikaciju (%0).')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139333993979751414)
,p_name=>'WWV_FLOW.EDIT'
,p_message_language=>'hr'
,p_message_text=>'Uredi'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352556667751420)
,p_name=>'WWV_FLOW.FIND_ITEM_ERR2'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-1802 Ne mo\017Ee se prona\0107i ID stavke "%0"')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352261479751420)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-1002 ID stavke "%0" ne mo\017Ee se prona\0107i u aplikaciji "%1".')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352318151751420)
,p_name=>'WWV_FLOW.FIND_ITEM_ID_ERR2'
,p_message_language=>'hr'
,p_message_text=>unistr('Neo\010Dekivana pogre\0161ka, ne mo\017Ee se prona\0107i naziv stavke na razini aplikacije ili stranice.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352752370751420)
,p_name=>'WWV_FLOW.FIRST_PAGE_DATA_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ve\0107 se nalazite na prvoj stranici podataka.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369296083751425)
,p_name=>'WWV_FLOW.ITEM_POSTING_VIOLATION'
,p_message_language=>'hr'
,p_message_text=>'Stavka s ID-om (%0) nije stavka definirana na trenutnoj stranici.'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326824898751412)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.INTERNAL_ONLY'
,p_message_language=>'hr'
,p_message_text=>unistr('Stavka se ne mo\017Ee postaviti proslje\0111ivanjem argumenata aplikaciji.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327120782751412)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.NO_CHECKSUM'
,p_message_language=>'hr'
,p_message_text=>'(Nije naveden kontrolni zbroj)'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326696237751412)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PRIVATE_BOOKMARK'
,p_message_language=>'hr'
,p_message_text=>unistr('Stavka se mo\017Ee postaviti kada je s njom povezan kontrolni zbroj za "oznaku na razini korisnika".')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326516981751412)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.PUBLIC_BOOKMARK'
,p_message_language=>'hr'
,p_message_text=>unistr('Stavka se mo\017Ee postaviti kada je s njom povezan kontrolni zbroj za "oznaku na razini aplikacije".')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326770346751412)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.SESSION'
,p_message_language=>'hr'
,p_message_text=>unistr('Stavka se mo\017Ee postaviti kada je s njom povezan kontrolni zbroj za "sesiju".')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326431224751412)
,p_name=>'WWV_FLOW.ITEM_PROTECTION.UNPROTECTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Stavka nema za\0161titu.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354514053751421)
,p_name=>'WWV_FLOW.NO_PAGE_HELP'
,p_message_language=>'hr'
,p_message_text=>unistr('Nije dostupna pomo\0107 za stranicu.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139342444088751417)
,p_name=>'WWV_FLOW.NO_PRIV_ON_SCHEMA'
,p_message_language=>'hr'
,p_message_text=>'Radni prostor %0 nema povlastice za parsiranje kao shemu %1.'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352913230751420)
,p_name=>'WWV_FLOW.PAGE_ACCEPT_RECUR_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-1010 Prekora\010Deno je ograni\010Denje rekurzije obrade prihvata grananja na stranicu. %0')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139309489813751407)
,p_name=>'WWV_FLOW.PAGE_PATTERN_NOT_RUNNABLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Stranica nije dostupna, ne mo\017Eete pokrenuti uzorak stranice.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327061091751412)
,p_name=>'WWV_FLOW.PAGE_PROTECTION.SHOW_NO_URL_ALLOWED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ova se stranica ne mo\017Ee pozvati pomo\0107u URL-a ili upotrebom GET ili POST za prikaz postupka, mora se pozvati pomo\0107u vrste ogranka "Grananje na stranicu".')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139411802535751437)
,p_name=>'WWV_FLOW.SAVE_ROUTINE_NUMERIC_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri spremanju vrijednosti koja nije numeri\010Dka u stavku %0. ')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344182201751418)
,p_name=>'WWV_FLOW.SCHEMA_NOT_EXISTS'
,p_message_language=>'hr'
,p_message_text=>'Shema za parsiranje aplikacije "%0" ne postoji u bazi podataka.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344296491751418)
,p_name=>'WWV_FLOW.SERVICE_ADMIN_LINK'
,p_message_language=>'hr'
,p_message_text=>unistr('Ra\010Duni u INTERNAL radnom prostoru mogu se upotrijebiti samo za pristup elementu &PRODUCT_NAME. <a href="%0">Administrativne usluge</a>.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352160111751420)
,p_name=>'WWV_FLOW.SESSION_INFO_ERR'
,p_message_language=>'hr'
,p_message_text=>'ERR-1029 Informacije o sesiji ne mogu se spremiti.  sesija=%0 stavka=%1'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355272337751421)
,p_name=>'WWV_FLOW.UNABLE_TO_STOP_TRACE_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se zaustaviti pra\0107enje: %0')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139352469200751420)
,p_name=>'WWV_FLOW.UNEXPECTED_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Neo\010Dekivana pogre\0161ka')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363242655751423)
,p_name=>'WWV_FLOW.UPDATE_SUB_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka u update_substitution_cache: %0')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355380469751421)
,p_name=>'WWV_FLOW.VIEW_HELP_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Za prikaz pomo\0107i moraju se navesti aplikacija i stranica.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139377047789751427)
,p_name=>'WWV_FLOW_AUTOMATION.AUTOMATION_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Automatizacija nije prona\0111ena.')
,p_version_scn=>2704920
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312523244751408)
,p_name=>'WWV_FLOW_AUTOMATION.QUERY_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka upita automatizacije: %0')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356426773751421)
,p_name=>'WWV_FLOW_CACHE.PURGE_SESSION'
,p_message_language=>'hr'
,p_message_text=>unistr('O\010Di\0161\0107en sljede\0107i broj sesija: %0.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297748165751404)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.LANGUAGE_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se izvr\0161iti %0 kod! Ne podr\017Eava ga baza podataka ili nije omogu\0107en u parametru instance MLE_LANGUAGES.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139295349271751403)
,p_name=>'WWV_FLOW_CODE_EXEC_MLE.MLE_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>'Multilingual Engine nije dostupan za ovu verziju baze podataka!'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334502657751415)
,p_name=>'WWV_FLOW_COLLECTION.ARRAY_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'Polje zbirke aplikacija ne smije biti null'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334377925751415)
,p_name=>'WWV_FLOW_COLLECTION.ATTRIBUTE_NUMBER_OUTSIDE_RANGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Navedeni broj atributa elementa %0 nije valjan. Broj atributa mora biti izme\0111u 1 i %1')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334867793751415)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_EXISTS'
,p_message_language=>'hr'
,p_message_text=>'Zbirka aplikacija postoji'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334648633751415)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_NOT_NULL'
,p_message_language=>'hr'
,p_message_text=>'Naziv zbirke ne smije biti null'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334790843751415)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NAME_TOO_LARGE'
,p_message_language=>'hr'
,p_message_text=>unistr('Naziv zbirke ne smije biti ve\0107i od 255 znakova')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334187922751414)
,p_name=>'WWV_FLOW_COLLECTION.COLLECTION_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>'Zbirka aplikacija %0 ne postoji'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334946994751415)
,p_name=>'WWV_FLOW_COLLECTION.CURSOR_NOT_OPEN'
,p_message_language=>'hr'
,p_message_text=>unistr('Pokaziva\010D jo\0161 nije otvoren')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334228148751415)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Slijed elemenata %0 ne postoji u zbirci aplikacija %1',
''))
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139334418506751415)
,p_name=>'WWV_FLOW_COLLECTION.MEMBER_SEQUENCE_NUMBER_INVALID'
,p_message_language=>'hr'
,p_message_text=>'Slijed elemenata %0 ne postoji u zbirci aplikacija "%1"'
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139287232688751401)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_ALGORITHM'
,p_message_language=>'hr'
,p_message_text=>unistr('Algoritam %0 nije podr\017Ean za ECDSA.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139286901861751401)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_EC_CURVE'
,p_message_language=>'hr'
,p_message_text=>unistr('Elipti\010Dna krivulja %0 nije podr\017Eana.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412630023751438)
,p_name=>'WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Kriptografska funkcija "%0" nije podr\017Eana u sustavu.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139464912477751453)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_ACCESSIBLE'
,p_message_language=>'hr'
,p_message_text=>unistr('Ispitana pristupa\010Dnost')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355910907751421)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CLOSE'
,p_message_language=>'hr'
,p_message_text=>'Zatvori'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356035818751421)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_CUST_OPT'
,p_message_language=>'hr'
,p_message_text=>unistr('Opcije prilago\0111avanja stranice')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356100336751421)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DEFAULT'
,p_message_language=>'hr'
,p_message_text=>'Zadano'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356200665751421)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_DISP'
,p_message_language=>'hr'
,p_message_text=>'Prikazano'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356375847751421)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_HIDDEN'
,p_message_language=>'hr'
,p_message_text=>'Skriveno'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355796225751421)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE1'
,p_message_language=>'hr'
,p_message_text=>unistr('Ozna\010Dite podru\010Dja koja \017Eelite dodati na stranicu. Ozna\010Dena podru\010Dja mo\017Eda se ne\0107e prikazati ako niste u odgovaraju\0107em kontekstu aplikacije ili ako nemate odgovaraju\0107e povlastice.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355817498751421)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE2'
,p_message_language=>'hr'
,p_message_text=>unistr('Ovu stranicu ne mo\017Ee se prilago\0111avati.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465237921751453)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_MESSAGE3'
,p_message_language=>'hr'
,p_message_text=>unistr('Izgled aplikacije mo\017Eete prilagoditi tako da promijenite stil teme. Odaberite stil teme s donjeg popisa i pritisnite Primijeni promjene.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139466091339751453)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REGION_DISP'
,p_message_language=>'hr'
,p_message_text=>unistr('Prikaz podru\010Dja')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465198626751453)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_REMOVE_STYLE'
,p_message_language=>'hr'
,p_message_text=>'Upotrijebi zadani stil aplikacije'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139465010605751453)
,p_name=>'WWV_FLOW_CUSTOMIZE.T_THEME_STYLE'
,p_message_language=>'hr'
,p_message_text=>'Izgled'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409265648751437)
,p_name=>'WWV_FLOW_DATA_EXPORT.AGG_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>'Indeks stupca referenciran u agregiranju %0 ne postoji.'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301975860751405)
,p_name=>'WWV_FLOW_DATA_EXPORT.APPEND_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Dodavanje izvoza podataka nije podr\017Eano za %0 format.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139264990871751394)
,p_name=>'WWV_FLOW_DATA_EXPORT.CLOB_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('CLOB izlaz nije podr\017Ean za format %0.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408923715751437)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_BREAK_MUST_BE_IN_THE_BEGGINING'
,p_message_language=>'hr'
,p_message_text=>unistr('Razdvajanje stupca mora biti na po\010Detku polja stupca.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409024408751437)
,p_name=>'WWV_FLOW_DATA_EXPORT.COLUMN_GROUP_IDX_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>'Indeks grupe stupaca referenciran u %0 ne postoji.'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139316183563751409)
,p_name=>'WWV_FLOW_DATA_EXPORT.EXPORT'
,p_message_language=>'hr'
,p_message_text=>'izvoz'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139323378357751411)
,p_name=>'WWV_FLOW_DATA_EXPORT.FORMAT_MUST_BE_XML'
,p_message_language=>'hr'
,p_message_text=>unistr('Format za izvoz mora biti XML uz upotrebu ORDS-a kao poslu\017Eitelja ispisa.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409345869751437)
,p_name=>'WWV_FLOW_DATA_EXPORT.HIGHLIGHT_COLUMN_IDX_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>'Indeks stupca referenciran u isticanju %0 ne postoji.'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139312757167751408)
,p_name=>'WWV_FLOW_DATA_EXPORT.INVALID_FORMAT'
,p_message_language=>'hr'
,p_message_text=>'Format izvoza nije valjan: %0'
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139409176607751437)
,p_name=>'WWV_FLOW_DATA_EXPORT.PARENT_GROUP_IDX_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>unistr('Indeks nadre\0111ene grupe referenciran u %0 ne postoji.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139434385795751444)
,p_name=>'WWV_FLOW_DATA_LOADER.CANNOT_LOAD_INTO_GENERATED_ALWAYS_COLUMN'
,p_message_language=>'hr'
,p_message_text=>unistr('Stupac %1 tablice %0 stupac je identiteta "GENERATED ALWAYS". Provjerite da izvorni stupci nisu mapirani u stupac %1 u dijalo\0161kom okviru konfiguriranja.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139345921788751418)
,p_name=>'WWV_FLOW_DATA_LOADER.COMMIT_INTERVAL_TOO_LOW'
,p_message_language=>'hr'
,p_message_text=>'Navedeni je interval spremanja prenizak.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346007264751418)
,p_name=>'WWV_FLOW_DATA_LOADER.NO_COLUMNS_PROVIDED'
,p_message_language=>'hr'
,p_message_text=>unistr('Za u\010Ditavanje podataka nisu navedeni stupci.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347355586751418)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_COLUMNS_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Nije prona\0111en nijedan stupac za alat za odabir redaka "%0". Poku\0161ajte s automatskim prepoznavanjem ili pregledom JSON strukture.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356711654751421)
,p_name=>'WWV_FLOW_DATA_PARSER.NO_WORKSHEETS_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Nijedan radni list nije prona\0111en u XLSX datoteci.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301876745751405)
,p_name=>'WWV_FLOW_DATA_PARSER.REQUESTED_HIERARCHY_LEVELS_EXCEED_MAXIMUM'
,p_message_language=>'hr'
,p_message_text=>unistr('Zatra\017Eene razine hijerarhije za otkrivanje (%0) prekora\010Duju maksimalni broj od %1.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356645559751421)
,p_name=>'WWV_FLOW_DATA_PARSER.WORKSHEET_DOES_NOT_EXIST'
,p_message_language=>'hr'
,p_message_text=>'Navedeni radni list ne postoji u XLSX datoteci.'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139335054386751415)
,p_name=>'WWV_FLOW_DML.VERSION_OF_DATA_CHANGED'
,p_message_language=>'hr'
,p_message_text=>unistr('Trenutna verzija podataka u bazi podataka promijenila se otkad je korisnik pokrenuo proces a\017Euriranja.')
,p_version_scn=>2704910
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337933340751416)
,p_name=>'WWV_FLOW_EDIT_REPORT.ERR_UPDATING_COLS'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri a\017Euriranju stupaca izvje\0161\0107a: %0')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448418574751448)
,p_name=>'WWV_FLOW_EXEC.CANNOT_CONVERT_TO_SDOGEOMETRY'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 se ne mo\017Ee konvertirati u SDO_GEOMETRY.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384986134751430)
,p_name=>'WWV_FLOW_EXEC.CAN_NOT_CONVERT_TO_VARCHAR2'
,p_message_language=>'hr'
,p_message_text=>unistr('Stupac %0 s vrstom podataka %1 ne mo\017Ee se pretvoriti u VARCHAR2!')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392353735751432)
,p_name=>'WWV_FLOW_EXEC.COLUMN_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Stupac "%0" naveden za atribut "%1" nije prona\0111en u izvoru podataka!')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328426158751413)
,p_name=>'WWV_FLOW_EXEC.FILTER_NOT_SUPPORTED_WITH_MULTIPLE_VALUES'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta filtra %0 nije podr\017Eana za stupce s vi\0161e vrijednosti.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451981994751449)
,p_name=>'WWV_FLOW_EXEC.INVALID_BETWEEN_FILTER'
,p_message_language=>'hr'
,p_message_text=>unistr('Filtar "izme\0111u" nije valjan.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139307519140751407)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_DATATYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Nije prona\0111ena vrijednost %2 u stupcu %0, retku br. %1.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139304276858751406)
,p_name=>'WWV_FLOW_EXEC.INVALID_COLUMN_OR_ROW_REFERENCE'
,p_message_language=>'hr'
,p_message_text=>'Stupac %0 ili redak #%1 ne postoji.'
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290841772751402)
,p_name=>'WWV_FLOW_EXEC.INVALID_LOV_SPECIFICATION'
,p_message_language=>'hr'
,p_message_text=>'Navedena vrsta popisa vrijednosti nije valjana.'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290781249751402)
,p_name=>'WWV_FLOW_EXEC.INVALID_QUERY_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta upita nije valjana. Vrsta upita mora biti Tablica, SQL upit ili PL/SQL funkcija koja vra\0107a SQL upit.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139385056691751430)
,p_name=>'WWV_FLOW_EXEC.INVALID_SQL_QUERY'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Nije uspjelo parsiranje SQL upita!',
'%0'))
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392487378751432)
,p_name=>'WWV_FLOW_EXEC.LEGACY_COLUMN_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Navedeni polo\017Eaj stupca %0 za atribut "%1" nije prona\0111en u SQL naredbi!')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139282430904751399)
,p_name=>'WWV_FLOW_EXEC.MULTI_VALUE_TOO_MANY_ITEMS'
,p_message_language=>'hr'
,p_message_text=>unistr('Previ\0161e stavki upotrijebljeno u filtru s vi\0161e vrijednosti.')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139392296324751432)
,p_name=>'WWV_FLOW_EXEC.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'hr'
,p_message_text=>'Za atribut "%0" nije naveden stupac.'
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290636553751402)
,p_name=>'WWV_FLOW_EXEC.NULL_QUERY_RETURNED_BY_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>'Glavni dio PL/SQL funkcije nije vratio vrijednost.'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139408020877751436)
,p_name=>'WWV_FLOW_EXEC.OPERATION_NOT_PRESENT_IN_WEB_SRC_MODULE'
,p_message_language=>'hr'
,p_message_text=>unistr('REST izvor podataka ne sadr\017Ei operaciju za obradu zatra\017Eene DML akcije.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449790418751449)
,p_name=>'WWV_FLOW_EXEC.RANGE_BUCKET.NOT.SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('Filtri raspona podr\017Eani su samo za vrste podataka NUMBER, DATE ili TIMESTAMP.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270659855751396)
,p_name=>'WWV_FLOW_EXEC.REST_REQUEST_ERROR'
,p_message_language=>'hr'
,p_message_text=>'Zahtjev nije uspio uz %0'
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274130080751397)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_JSON_NOT_AVAILABLE'
,p_message_language=>'hr'
,p_message_text=>'Konverzija GeoJSON u SDO_GEOMETRY (stupac %0) nije dostupna u ovoj bazi podataka.'
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277595732751398)
,p_name=>'WWV_FLOW_EXEC.SPATIAL_NOT_SUPPORTED_FOR_XML'
,p_message_language=>'hr'
,p_message_text=>unistr('Konverzija SDO_GEOMETRY (stupac %0) nije podr\017Eana za XML izvore podataka.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139301680961751405)
,p_name=>'WWV_FLOW_EXEC.UNSUPPPORTED_MULTI_VALUE_SEPARATOR'
,p_message_language=>'hr'
,p_message_text=>unistr('Znak %0 nije podr\017Ean kao separator vi\0161e vrijednosti.')
,p_version_scn=>2704905
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139449832723751449)
,p_name=>'WWV_FLOW_EXEC.WRONG_CONTEXT_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Ova funkcija ne mo\017Ee se upotrijebiti s kontekstom upita.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139277666741751398)
,p_name=>'WWV_FLOW_EXEC_API.INVALID_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrste podataka stupca nisu uskla\0111ene.')
,p_version_scn=>2704901
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139311187625751408)
,p_name=>'WWV_FLOW_EXEC_DOC_SRC.REMOTE_MULTI_ROW_DML_NOT_SUPPORTED_WITHOUT_JSON_BINDS'
,p_message_language=>'hr'
,p_message_text=>unistr('Ovaj izvor podataka ne podr\017Eava promjenu vi\0161e redaka.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290562873751402)
,p_name=>'WWV_FLOW_EXEC_REMOTE.ORDS_OUT_BIND_LIMIT_EXCEEDED'
,p_message_language=>'hr'
,p_message_text=>unistr('Prekora\010Dena interna ograni\010Denja ORDS OUT vezivanja. Smanjite koli\010Dinu DML redaka.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393276970751432)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RESPONSE_PARSING_ERROR'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('JSON odgovor od udaljenog poslu\017Eitelja ne mo\017Ee se parsirati: '),
'%0'))
,p_version_scn=>2704924
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139290492416751402)
,p_name=>'WWV_FLOW_EXEC_REMOTE.RUN_PLSQL_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Nepoznata ili pogre\0161na vrsta konteksta.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139314583469751409)
,p_name=>'WWV_FLOW_EXPORT_INT.UNSUPPORTED_READABLE_EXPORT'
,p_message_language=>'hr'
,p_message_text=>unistr('Nepodr\017Eane komponente za izvoz koji se mo\017Ee o\010Ditati: %0')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139412542133751438)
,p_name=>'WWV_FLOW_FILE_PARSER.UNKNOWN_FILE_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Parser ne podr\017Eava ovu vrstu datoteke.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363396469751423)
,p_name=>'WWV_FLOW_FND_DEVELOPER_API.CREDENTIALS_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Neovla\0161teni pristup (nije postavljen wwv_flow_api.set_credentials).')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338223700751416)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_COMPANY'
,p_message_language=>'hr'
,p_message_text=>unistr('Radni prostor nije se stvorio jer ve\0107 postoji.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139338177797751416)
,p_name=>'WWV_FLOW_FND_USER_API.CREATE_USER_GROUP'
,p_message_language=>'hr'
,p_message_text=>unistr('Grupa korisnika nije se stvorila jer ve\0107 postoji.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349548240751419)
,p_name=>'WWV_FLOW_FND_USER_API.DUP_USER'
,p_message_language=>'hr'
,p_message_text=>unistr('Prona\0111eno je duplicirano korisni\010Dko ime za %0.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349646885751419)
,p_name=>'WWV_FLOW_FND_USER_API.LOAD_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri u\010Ditavanju korisnika. Nije uspjelo kod korisnika %0.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360460152751422)
,p_name=>'WWV_FLOW_FND_USER_API.T_MESSAGE'
,p_message_language=>'hr'
,p_message_text=>unistr('U\010Ditao bi se sljede\0107i broj korisnika: %0.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360278533751422)
,p_name=>'WWV_FLOW_FND_USER_API.T_PASSWORD'
,p_message_language=>'hr'
,p_message_text=>'Lozinka'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360302320751422)
,p_name=>'WWV_FLOW_FND_USER_API.T_PRIVILEGE'
,p_message_language=>'hr'
,p_message_text=>'Povlastice'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360091738751422)
,p_name=>'WWV_FLOW_FND_USER_API.T_USERNAME'
,p_message_language=>'hr'
,p_message_text=>unistr('Korisni\010Dko ime')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440443605751446)
,p_name=>'WWV_FLOW_FORM.UNHANDLED_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri prikazu stavke stranice #COMPONENT_NAME#.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355431435751421)
,p_name=>'WWV_FLOW_FORMS.FORM_NOT_OPEN_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Stavka stranice ne mo\017Ee se prikazati jer HTML obrazac jo\0161 nije otvoren.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139313822461751408)
,p_name=>'WWV_FLOW_FORMS.ITEM_DEFAULT_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri izra\010Dunu zadane vrijednosti stavke za stavku stranice #COMPONENT_NAME#.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354775994751421)
,p_name=>'WWV_FLOW_FORMS.ITEM_POST_CALC_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri naknadnom izra\010Dunu stavke za stavku stranice #COMPONENT_NAME#.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354610251751421)
,p_name=>'WWV_FLOW_FORMS.ITEM_SOURCE_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri izra\010Dunu vrijednosti izvora stavke za stavku stranice #COMPONENT_NAME#.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331471536751414)
,p_name=>'WWV_FLOW_HELP.UNAUTHORIZED'
,p_message_language=>'hr'
,p_message_text=>unistr('Neovla\0161teni pristup.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280938403751399)
,p_name=>'WWV_FLOW_INTERACTIVE_GRID.INVALID_JSON_ARRAY'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost %0 od %1 nije valjani JSON niz.'
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354901306751421)
,p_name=>'WWV_FLOW_ITEM.JS_NOT_SUPPORTED'
,p_message_language=>'hr'
,p_message_text=>unistr('JavaScript nije podr\017Ean.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355089533751421)
,p_name=>'WWV_FLOW_ITEM.LIST'
,p_message_language=>'hr'
,p_message_text=>'Popis'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139355669916751421)
,p_name=>'WWV_FLOW_ITEM.UNABLE_INIT_QUERY'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se inicijalizirati upit.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363691270751423)
,p_name=>'WWV_FLOW_ITEM.UPDATE_NOT_SUPPORTED_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 - a\017Euriranje nije podr\017Eano.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139357143441751421)
,p_name=>'WWV_FLOW_ITEM_HELP.INVALID_ITEM_ERR'
,p_message_language=>'hr'
,p_message_text=>'ID stavke: %0 nije valjan'
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384812029751429)
,p_name=>'WWV_FLOW_ITEM_HELP.NO_HELP_EXISTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Za ovu stavku ne postoji pomo\0107.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346616481751418)
,p_name=>'WWV_FLOW_JET_CHART.QUERY_GENERATION_FAILED'
,p_message_language=>'hr'
,p_message_text=>'Generiranje upita grafikona nije uspjelo. Provjerite postavke mapiranja izvora i stupaca.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347959650751419)
,p_name=>'WWV_FLOW_MAIL.ADD_ATTACHMENT.INVALID_MAIL_ID'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost nije valjana za parametar p_mail_id: %0'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384621152751429)
,p_name=>'WWV_FLOW_MAIL.CANNOT_USE_TO_OR_REPLYTO_AS_FROM'
,p_message_language=>'hr'
,p_message_text=>unistr('"Prima" ili "Odgovori" ne mogu se upotrijebiti kao adresa "\0160alje", jer sadr\017Ee vi\0161e adresa e-po\0161te.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139469574374751454)
,p_name=>'WWV_FLOW_MAIL.EMAIL_LIMIT_EXCEEDED'
,p_message_language=>'hr'
,p_message_text=>unistr('Prekora\010Dili ste maksimalan broj poruka e-po\0161te po radnom prostoru. Obratite se administratoru za pomo\0107.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326103157751412)
,p_name=>'WWV_FLOW_MAIL.INVALID_CONTEXT'
,p_message_language=>'hr'
,p_message_text=>'Ovaj se postupak mora pozvati iz sesije aplikacije.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347863469751419)
,p_name=>'WWV_FLOW_MAIL.PARAMETER_NULL'
,p_message_language=>'hr'
,p_message_text=>'Za parametar %0 navedena je null vrijednost.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139405934940751436)
,p_name=>'WWV_FLOW_MAIL.PREPARE_TEMPLATE.NO_DATA_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Predlo\017Eak e-po\0161te "%0" nije prona\0111en u aplikaciji %1.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139482445855751458)
,p_name=>'WWV_FLOW_MAIL.SMTP_HOST_ADDRESS_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Za slanje po\0161te mora se postaviti SMTP_HOST_ADDRESS parametar instance.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139347220139751418)
,p_name=>'WWV_FLOW_MAIL.TO_IS_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>unistr('Za slanje po\0161te morate navesti primatelja poruke.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139471901517751455)
,p_name=>'WWV_FLOW_MAIL.UNABLE_TO_OPEN_SMTP_CONNECTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se uspostaviti SMTP veza s konfiguriranim poslu\017Eiteljem e-po\0161te.')
,p_version_scn=>2704934
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139447233998751448)
,p_name=>'WWV_FLOW_PLUGIN.INVALID_AJAX_CALL'
,p_message_language=>'hr'
,p_message_text=>'Ajax poziv nije valjan!'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331137528751414)
,p_name=>'WWV_FLOW_PLUGIN.NO_AJAX_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Za priklju\010Dak %0 nije definirana Ajax funkcija')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437785592751445)
,p_name=>'WWV_FLOW_PLUGIN.NO_EXECUTION_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Za priklju\010Dak %0 nije definirana funkcija izvr\0161avanja')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331299672751414)
,p_name=>'WWV_FLOW_PLUGIN.NO_RENDER_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Za priklju\010Dak %0 nije definirana funkcija generiranja prikaza')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448156437751448)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_CAPABILITIES_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Priklju\010Dak REST izvora podataka "%0" ne sadr\017Ei funkciju "Mogu\0107nosti".')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448031314751448)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_DML_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Priklju\010Dak REST izvora podataka "%0" ne sadr\017Ei DML funkciju.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448250752751448)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_EXECUTE_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Priklju\010Dak REST izvora podataka "%0" ne sadr\017Ei funkciju Izvr\0161i.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139448327124751448)
,p_name=>'WWV_FLOW_PLUGIN.NO_WSM_FETCH_FUNCTION'
,p_message_language=>'hr'
,p_message_text=>unistr('Priklju\010Dak REST izvora podataka "%0" ne sadr\017Ei funkciju Dohvat.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328699392751413)
,p_name=>'WWV_FLOW_PLUGIN.RUN_PLSQL_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka PLSQL \0161ifre stvorena tijekom obrade priklju\010Dka.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337216252751415)
,p_name=>'WWV_FLOW_PLUGIN_DEV.IS_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost se mora navesti.'
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139370203056751425)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.CANT_CONVERT_TO_VARCHAR2'
,p_message_language=>'hr'
,p_message_text=>unistr('Vrsta podataka %0 ne mo\017Ee se pretvoriti u VARCHAR2!')
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458447155751451)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.COLUMN_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Stupac "%0" naveden za atribut "%1" nije prona\0111en u SQL naredbi!')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139285750001751400)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.INVALID_JSON_ARRAY'
,p_message_language=>'hr'
,p_message_text=>'Vrijednost %0 od %1 nije valjani JSON niz.'
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435600457751444)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_REQUIRED'
,p_message_language=>'hr'
,p_message_text=>'Upit za popis vrijednosti (LOV) ili popis vrijednosti s nazivom mora se navesti za %0.'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139437289469751445)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.LOV_SQL_WRONG_COLUMN_COUNT'
,p_message_language=>'hr'
,p_message_text=>unistr('U SQL upitu popisa vrijednosti za %0 odabran je pogre\0161an broj stupaca. Pogledajte primjere valjanih naredbi.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458235472751451)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NO_COLUMN_FOR_ATTRIBUTE'
,p_message_language=>'hr'
,p_message_text=>'Za atribut "%0" nije naveden stupac.'
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487412509751460)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.NUMBER_ATTRIBUTE_VALUE_INVALID'
,p_message_language=>'hr'
,p_message_text=>'Unesena vrijednost %0 za atribut "%1" nije broj.'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139440714355751446)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.SQL_WRONG_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 sadr\017Ei pogre\0161nu vrstu podataka u SQL naredbi. Column# %1 je %2, a o\010Dekuje se %3.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139458311792751451)
,p_name=>'WWV_FLOW_PLUGIN_UTIL.WRONG_COLUMN_DATA_TYPE'
,p_message_language=>'hr'
,p_message_text=>unistr('Stupac "%0" naveden za atribut "%1" sadr\017Ei vrstu podataka %2, a trebao bi sadr\017Eavati vrstu podataka %3.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139327820065751413)
,p_name=>'WWV_FLOW_PRINT_UTIL.REPORT_LAYOUT_NOT_FOUND'
,p_message_language=>'hr'
,p_message_text=>unistr('Nije prona\0111en izgled izvje\0161\0107a.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139315425528751409)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTIONS_LIMIT_EXCEEDED'
,p_message_language=>'hr'
,p_message_text=>unistr('Ograni\010Denje pozadinskog izvr\0161enja prekora\010Deno za %0.')
,p_version_scn=>2704908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265736426751394)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING'
,p_message_language=>'hr'
,p_message_text=>unistr('Jo\0161 jedno izvo\0111enje procesa %0 ve\0107 je pokrenuto.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139265638922751394)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.EXECUTION_ALREADY_RUNNING_CTX'
,p_message_language=>'hr'
,p_message_text=>unistr('Jo\0161 jedno izvo\0111enje procesa %0 ve\0107 je pokrenuto za kontekst %1.')
,p_version_scn=>2704900
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139280687498751399)
,p_name=>'WWV_FLOW_PROCESS_BACKGROUND.FILES_NOT_VISIBLE_IN_WORKING_SESSION'
,p_message_language=>'hr'
,p_message_text=>unistr('Prenesene datoteke nisu vidljive u radnoj sesiji za izvo\0111enje procesa %0.')
,p_version_scn=>2704902
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393166521751432)
,p_name=>'WWV_FLOW_RENDER_REPORT3.COMPUTE_SUM_NOT_SUPPORTED_FOR_WEB_SOURCES'
,p_message_language=>'hr'
,p_message_text=>unistr('Zna\010Dajka Izra\010Dun zbroja ne mo\017Ee se upotrijebiti za izvje\0161\0107a na temelju REST izvora podataka.')
,p_version_scn=>2704924
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139354887326751421)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNABLE_SET_SHORT_VAL_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('ERR-2904 Ne mo\017Ee se postaviti vrijednost pre\010Daca.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139359808028751422)
,p_name=>'WWV_FLOW_RENDER_SHORTCUT.UNKNOWN_TYPE_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka: Nepoznata vrsta pre\010Daca.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139297563029751404)
,p_name=>'WWV_FLOW_SEARCH_API.TEXT_QUERY_TOO_LONG'
,p_message_language=>'hr'
,p_message_text=>unistr('Upit za pretra\017Eivanje je preduga\010Dak.')
,p_version_scn=>2704904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139348901352751419)
,p_name=>'WWV_FLOW_SECURITY.AUTH_SCHEME_FETCH_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se dohvatiti authentication_scheme u aplikaciji %0.')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139356995816751421)
,p_name=>'WWV_FLOW_SECURITY.COMPONENT_FETCH_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se dohvatiti komponenta %0.')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139427220782751442)
,p_name=>'WWV_FLOW_SESSION_API.TENANT_ID_EXISTS'
,p_message_language=>'hr'
,p_message_text=>unistr('Za trenutnu sesiju ve\0107 postoji ID klijenta.')
,p_version_scn=>2704930
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139360169907751422)
,p_name=>'WWV_FLOW_USER_API.T_EMAIL'
,p_message_language=>'hr'
,p_message_text=>unistr('E-po\0161ta')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486997504751460)
,p_name=>'WWV_FLOW_WEB_SERVICES.AUTHENTICATION_FAILED'
,p_message_language=>'hr'
,p_message_text=>unistr('Provjera autenti\010Dnosti nije uspjela.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139387524344751430)
,p_name=>'WWV_FLOW_WEB_SERVICES.COOKIE_INVALID'
,p_message_language=>'hr'
,p_message_text=>unistr('Jedan ili vi\0161e kola\010Di\0107a postavljenih u apex_util.g_request_cookies sadr\017Ee vrijednost koja nije valjana.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139369414103751425)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_UDDI_RESPONSE'
,p_message_language=>'hr'
,p_message_text=>'Odgovor iz UDDI registra nije bio valjan.'
,p_version_scn=>2704919
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139328747135751413)
,p_name=>'WWV_FLOW_WEB_SERVICES.INVALID_WSDL'
,p_message_language=>'hr'
,p_message_text=>'Navedeni URL nije vratio valjani WSDL dokument.'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139331591553751414)
,p_name=>'WWV_FLOW_WEB_SERVICES.MULTIPLE_SOAP'
,p_message_language=>'hr'
,p_message_text=>unistr('WSDL dokument sadr\017Ei vi\0161e SOAP vezivanja. &PRODUCT_NAME. podr\017Eava samo WSDL-ove s jednim SOAP vezivanjem. Pritisnite Ru\010Dno stvaranje reference web-servisa kako biste nastavili sa stvaranjem reference za ovaj servis.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139407189460751436)
,p_name=>'WWV_FLOW_WEB_SERVICES.NOT_XML'
,p_message_language=>'hr'
,p_message_text=>'Odgovor od servisa nije XML.'
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139486813501751460)
,p_name=>'WWV_FLOW_WEB_SERVICES.NO_VALID_OAUTH_TOKEN'
,p_message_language=>'hr'
,p_message_text=>'OAuth pristupni token nije dostupan ili je istekao.'
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139451317653751449)
,p_name=>'WWV_FLOW_WEB_SERVICES.REQUEST_LIMIT_EXCEEDED'
,p_message_language=>'hr'
,p_message_text=>unistr('Prekora\010Dili ste maksimalan broj zahtjeva web-servisa po radnom prostoru. Obratite se administratoru za pomo\0107.')
,p_version_scn=>2704933
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139487092626751460)
,p_name=>'WWV_FLOW_WEB_SERVICES.UNSUPPORTED_OAUTH_TOKEN'
,p_message_language=>'hr'
,p_message_text=>unistr('Poslu\017Eitelj je odgovorio nepodr\017Eanom vrstom OAuth tokena.')
,p_version_scn=>2704936
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330981205751414)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_NO_SOAP'
,p_message_language=>'hr'
,p_message_text=>unistr('WSDL dokument nije sadr\017Eavao vezivanje za SOAP obavezno za dodavanje reference.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139326360076751412)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_REQUIRES_AUTH'
,p_message_language=>'hr'
,p_message_text=>unistr('Za ovaj WSDL obavezni su sigurnosni podaci za provjeru autenti\010Dnosti. U nastavku navedite korisni\010Dko ime i lozinku.')
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139337304050751415)
,p_name=>'WWV_FLOW_WEB_SERVICES.WSDL_UNHANDLED'
,p_message_language=>'hr'
,p_message_text=>unistr('Modul za generiranje prikaza nije razumio WSDL dokument. Pritisnite Ru\010Dno stvaranje reference web-servisa kako biste nastavili sa stvaranjem reference za ovaj servis.')
,p_version_scn=>2704912
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139410134667751437)
,p_name=>'WWV_FLOW_WIZARD_API.UPDATE_ERROR'
,p_message_language=>'hr'
,p_message_text=>unistr('Ne mo\017Ee se obraditi a\017Euriranje.')
,p_version_scn=>2704927
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435990083751445)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_DISPLAY_AND_RETURN_COLUMN_EQUAL'
,p_message_language=>'hr'
,p_message_text=>'Stupac za povrat i prikaz na popisu vrijednosti su jednaki!'
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139435851121751445)
,p_name=>'WWV_FLOW_WORKSHEET.LOV_NO_RETURN_COLUMN'
,p_message_language=>'hr'
,p_message_text=>unistr('Popis vrijednosti ne sadr\017Ei stupac za povrat.')
,p_version_scn=>2704932
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363567983751423)
,p_name=>'WWV_RENDER_REPORT3.COLUMN_VALUE_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri dohvatu vrijednosti stupca: %0')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388490011751431)
,p_name=>'WWV_RENDER_REPORT3.DATA_TOO_OLD'
,p_message_language=>'hr'
,p_message_text=>unistr('Trenutni su podaci u tabli\010Dnom formatu prestari; izmijenjeni su izvorni podaci.<br/> Pritisnite <strong><a href="%0">ovdje</a></strong> kako biste odbacili promjene i ponovo u\010Ditajte podatke iz baze podataka.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343638338751417)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_PAGINATION'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri odre\0111ivanju niza numeracije stranica')
,p_version_scn=>2704915
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343582322751417)
,p_name=>'WWV_RENDER_REPORT3.ERR_DETERMINE_QUERY_HEADINGS'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ne mogu se odrediti zaglavlja upita:',
'%0'))
,p_version_scn=>2704915
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343794426751417)
,p_name=>'WWV_RENDER_REPORT3.ERR_REPORT_FOOTER'
,p_message_language=>'hr'
,p_message_text=>unistr('pogre\0161ka pri izvr\0161avanju zamjena podno\017Eja izvje\0161\0107a')
,p_version_scn=>2704915
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343820897751417)
,p_name=>'WWV_RENDER_REPORT3.FAILED_PARSING_QUERY'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'parsiranje SQL upita nije uspjelo:',
'%0',
'%1'))
,p_version_scn=>2704915
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349942017751419)
,p_name=>'WWV_RENDER_REPORT3.FOUND_BUT_NOT_DISPLAYED'
,p_message_language=>'hr'
,p_message_text=>unistr('Minimalni broj zatra\017Eenih redaka: %0, redci koji su prona\0111eni, ali nisu prikazani: %1')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346370352751418)
,p_name=>'WWV_RENDER_REPORT3.HTML_USE_COLUMN_ALIAS'
,p_message_language=>'hr'
,p_message_text=>'stupac upita #%0 (%1) nije valjan, za stupce koji upotrebljavaju HTML obavezni su drugi nazivi'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139363425505751423)
,p_name=>'WWV_RENDER_REPORT3.QUERY_HEADING_ERR'
,p_message_language=>'hr'
,p_message_text=>unistr('Pogre\0161ka pri dohva\0107anju zaglavlja upita: %0')
,p_version_scn=>2704917
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343907652751417)
,p_name=>'WWV_RENDER_REPORT3.REPORT_ERROR'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('pogre\0161ka izvje\0161\0107a:'),
'%0'))
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139384087823751429)
,p_name=>'WWV_RENDER_REPORT3.SORT_BY_THIS_COLUMN'
,p_message_language=>'hr'
,p_message_text=>'Sortiraj prema ovom stupcu'
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346474095751418)
,p_name=>'WWV_RENDER_REPORT3.SYNTAX_ERROR'
,p_message_language=>'hr'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Upit se ne mo\017Ee parsirati, provjerite sintaksu upita.'),
'(%0)',
'</p>'))
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388576623751431)
,p_name=>'WWV_RENDER_REPORT3.UNSAVED_DATA'
,p_message_language=>'hr'
,p_message_text=>unistr('Ovaj obrazac sadr\017Ei nespremljene promjene. Pritisnite "U redu" kako biste nastavili bez spremanja promjena.')
,p_version_scn=>2704921
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139393061779751432)
,p_name=>'WWV_RENDER_REPORT3.UNSUPPORTED_PAGINATION_SCHEME'
,p_message_language=>'hr'
,p_message_text=>unistr('Shema numeriranja stranica izvje\0161\0107a (%0) nije podr\017Eana za odabrani izvor podataka.')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139346256751751418)
,p_name=>'WWV_RENDER_REPORT3.USE_COLUMN_ALIAS'
,p_message_language=>'hr'
,p_message_text=>'stupac upita #%0 (%1) nije valjan, upotrijebite drugi naziv stupca'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139350018705751419)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z'
,p_message_language=>'hr'
,p_message_text=>unistr('redci %0 - %1 od vi\0161e od %2')
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139390515878751431)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_MORE_THAN_Z_2'
,p_message_language=>'hr'
,p_message_text=>unistr('%0 - %1 od vi\0161e od %2')
,p_version_scn=>2704923
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139349829190751419)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z'
,p_message_language=>'hr'
,p_message_text=>'redci %0 - %1 od %2'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139330637252751413)
,p_name=>'WWV_RENDER_REPORT3.X_Y_OF_Z_2'
,p_message_language=>'hr'
,p_message_text=>'%0 - %1 od %2'
,p_version_scn=>2704909
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139344079686751417)
,p_name=>'Y'
,p_message_language=>'hr'
,p_message_text=>'Y'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139351357388751420)
,p_name=>'YEAR'
,p_message_language=>'hr'
,p_message_text=>'god.'
,p_version_scn=>2704916
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139343283372751417)
,p_name=>'YEARS'
,p_message_language=>'hr'
,p_message_text=>'godine'
,p_version_scn=>2704914
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139388693696751431)
,p_name=>'YES'
,p_message_language=>'hr'
,p_message_text=>'Da'
,p_version_scn=>2704921
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
 p_id=>wwv_flow_imp.id(109678305570583962.4481)
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
 p_id=>1.4481
,p_name=>'Poruke'
,p_alias=>'MESSAGES'
,p_step_title=>'Poruke'
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
